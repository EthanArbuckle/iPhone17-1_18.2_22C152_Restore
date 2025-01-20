@interface NEIKEv2CryptoKitKEM
- (BOOL)processPeerPayload:(id)a3 error:(id *)a4;
- (NSData)keyExchangeData;
- (NSData)sharedSecret;
- (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM)init;
@end

@implementation NEIKEv2CryptoKitKEM

- (NSData)keyExchangeData
{
  return (NSData *)sub_19DDBD168((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_keyExchangeData);
}

- (NSData)sharedSecret
{
  v2 = self;
  v3 = (void *)NEIKEv2CryptoKitKEM.sharedSecret.getter();

  return (NSData *)v3;
}

- (BOOL)processPeerPayload:(id)a3 error:(id *)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94541A0);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_19DF72A50();
  unint64_t v13 = v12;

  (*(void (**)(uint64_t, unint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.isa) + 0x68))(v11, v13);
  uint64_t v14 = sub_19DF72C60();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 0, 1, v14);
  uint64_t v15 = (uint64_t)v10 + OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_internalSharedSecret;
  swift_beginAccess();
  sub_19DDBF7E0((uint64_t)v8, v15, &qword_1E94541A0);
  swift_endAccess();

  sub_19DDBF398(v11, v13);
  return 1;
}

- (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM)init
{
  result = (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end