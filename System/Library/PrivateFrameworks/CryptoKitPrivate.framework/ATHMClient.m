@interface ATHMClient
- (_TtC16CryptoKitPrivate10ATHMClient)init;
- (_TtC16CryptoKitPrivate10ATHMClient)initWithKeyCommitmentsData:(id)a3 error:(id *)a4;
- (id)finalizeWithResponseData:(id)a3 error:(id *)a4;
- (id)request;
@end

@implementation ATHMClient

- (_TtC16CryptoKitPrivate10ATHMClient)initWithKeyCommitmentsData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_1DB0C4A08();
  unint64_t v7 = v6;

  return (_TtC16CryptoKitPrivate10ATHMClient *)ATHMClient.init(keyCommitmentsData:)(v5, v7);
}

- (id)request
{
  v2 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 72];
  v3 = self;
  id result = objc_msgSend(v2, sel_serializedPublicKey_, 1);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_1DB0C4A08();
    unint64_t v8 = v7;

    v9 = (void *)sub_1DB0C49E8();
    sub_1DB042664(v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)finalizeWithResponseData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_1DB0C4A08();
  unint64_t v9 = v8;

  id v10 = sub_1DB0787A4(v7, v9);
  unint64_t v12 = v11;

  sub_1DB042664(v7, v9);
  v13 = (void *)sub_1DB0C49E8();
  sub_1DB042664((uint64_t)v10, v12);
  return v13;
}

- (_TtC16CryptoKitPrivate10ATHMClient)init
{
  id result = (_TtC16CryptoKitPrivate10ATHMClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client];
  id v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client);
  v3 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 8];
  id v4 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 16];
  id v5 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 24];
  uint64_t v6 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 32];
  uint64_t v7 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 56];
  unint64_t v8 = *(void **)&self->client[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMClient_client + 64];

  swift_bridgeObjectRelease();
}

@end