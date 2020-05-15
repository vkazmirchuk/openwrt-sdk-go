FROM openwrtorg/sdk:ramips-mt76x8

ENV PKG_NAME myPKG

RUN sudo apt-get update -qq && sudo apt-get install -y upx

WORKDIR /home/build

RUN wget -nv https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz &&\
    sudo tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

WORKDIR openwrt

RUN make defconfig

ENTRYPOINT ["make", "package/$PKG_NAME/compile"]
