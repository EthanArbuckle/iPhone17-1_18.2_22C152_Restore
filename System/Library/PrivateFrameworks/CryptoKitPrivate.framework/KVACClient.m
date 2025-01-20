@interface KVACClient
- (_TtC16CryptoKitPrivate10KVACClient)init;
- (_TtC16CryptoKitPrivate10KVACClient)initWithTokenChallenge:(id)a3 error:(id *)a4;
- (id)makeCredentialWithIssuance:(id)a3 request:(id)a4 error:(id *)a5;
- (id)makeRequestAndReturnError:(id *)a3;
@end

@implementation KVACClient

- (_TtC16CryptoKitPrivate10KVACClient)initWithTokenChallenge:(id)a3 error:(id *)a4
{
  return (_TtC16CryptoKitPrivate10KVACClient *)sub_1DB062334((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KVACClient.init(tokenChallenge:));
}

- (id)makeRequestAndReturnError:(id *)a3
{
  v3 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client];
  v4 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 8];
  v5 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 16];
  v6 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 24];
  v7 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 32];
  v8 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 40];
  v9 = self;
  sub_1DB05D5C0(v3, v4, v5, (uint64_t)v6, v7, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  uint64_t v17 = v16;
  id v18 = objc_allocWithZone((Class)type metadata accessor for KVACRequestWrapper());
  id v19 = sub_1DB05E168(v11, v13, v15, v17);

  return v19;
}

- (id)makeCredentialWithIssuance:(id)a3 request:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1DB060860((uint64_t)v7, (uint64_t)v8);

  return v10;
}

- (_TtC16CryptoKitPrivate10KVACClient)init
{
  result = (_TtC16CryptoKitPrivate10KVACClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 8];
  id v6 = *(id *)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client];
  v3 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 16];
  v4 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 24];
  v5 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10KVACClient_client + 32];
}

@end