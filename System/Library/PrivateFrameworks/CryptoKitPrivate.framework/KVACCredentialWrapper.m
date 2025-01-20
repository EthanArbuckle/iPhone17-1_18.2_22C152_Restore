@interface KVACCredentialWrapper
- (NSData)credentialData;
- (NSData)serverKeyId;
- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)init;
- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)initWithCredentialData:(id)a3 error:(id *)a4;
- (id)makePresentationWithTagPrefix:(id)a3 error:(id *)a4;
@end

@implementation KVACCredentialWrapper

- (NSData)credentialData
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData);
}

- (NSData)serverKeyId
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId);
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)initWithCredentialData:(id)a3 error:(id *)a4
{
  return (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)sub_1DB062334((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KVACCredentialWrapper.init(credentialData:));
}

- (id)makePresentationWithTagPrefix:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1DB0C4A08();
  unint64_t v9 = v8;

  long long v11 = *(_OWORD *)&v6->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  long long v10 = *(_OWORD *)&v6->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v17[0] = *(_OWORD *)((char *)&v6->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential);
  v17[1] = v11;
  v17[2] = v10;
  sub_1DB067970((uint64_t)v17);
  sub_1DB05CF00(v7, v9, (uint64_t)v15);
  sub_1DB0679CC((uint64_t)v17);
  v16[3] = v15[3];
  v16[4] = v15[4];
  v16[5] = v15[5];
  v16[6] = v15[6];
  v16[0] = v15[0];
  v16[1] = v15[1];
  v16[2] = v15[2];
  id v12 = objc_allocWithZone((Class)type metadata accessor for KVACPresentationWrapper());
  v13 = sub_1DB05F78C((uint64_t)v16);

  sub_1DB042664(v7, v9);
  return v13;
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)init
{
  result = (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData), *(void *)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData]);
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId), *(void *)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId]);
  v3 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential);
  id v5 = *(void **)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential];
  uint64_t v7 = *(void **)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v6 = *(void **)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential];
  uint64_t v8 = *(void *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  unint64_t v9 = *((void *)v3 + 5);

  sub_1DB042664(v8, v9);
}

@end