@interface KVACIssuanceWrapper
- (NSData)issuanceData;
- (NSData)keyId;
- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)init;
- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)initWithIssuanceData:(id)a3 error:(id *)a4;
@end

@implementation KVACIssuanceWrapper

- (NSData)keyId
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId);
}

- (NSData)issuanceData
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData);
}

- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)initWithIssuanceData:(id)a3 error:(id *)a4
{
  return (_TtC16CryptoKitPrivate19KVACIssuanceWrapper *)sub_1DB062334((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KVACIssuanceWrapper.init(issuanceData:));
}

- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)init
{
  result = (_TtC16CryptoKitPrivate19KVACIssuanceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance];
  v4 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 8];
  v5 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 16];
  v6 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 24];
  v7 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 32];
  v9 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 40];
  v8 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 48];
  uint64_t v10 = *(void *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 64];
  unint64_t v11 = *(void *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 72];
  v14 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance);
  v15 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 80];

  sub_1DB042664(v10, v11);
  swift_bridgeObjectRelease();

  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId), *(void *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId]);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData);
  unint64_t v13 = *(void *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData];
  sub_1DB042664(v12, v13);
}

@end