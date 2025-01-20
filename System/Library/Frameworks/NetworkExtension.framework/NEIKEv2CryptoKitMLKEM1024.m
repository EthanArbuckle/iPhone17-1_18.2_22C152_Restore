@interface NEIKEv2CryptoKitMLKEM1024
- (_TtC16NetworkExtension25NEIKEv2CryptoKitMLKEM1024)initWithPublicKeyData:(id)a3 error:(id *)a4;
- (id)initAndReturnError:(id *)a3;
@end

@implementation NEIKEv2CryptoKitMLKEM1024

- (id)initAndReturnError:(id *)a3
{
  return (id)sub_19DDBE72C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))NEIKEv2CryptoKitMLKEM1024.init());
}

- (_TtC16NetworkExtension25NEIKEv2CryptoKitMLKEM1024)initWithPublicKeyData:(id)a3 error:(id *)a4
{
  return (_TtC16NetworkExtension25NEIKEv2CryptoKitMLKEM1024 *)sub_19DDBECD8((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))NEIKEv2CryptoKitMLKEM1024.init(publicKeyData:));
}

- (void).cxx_destruct
{
}

@end