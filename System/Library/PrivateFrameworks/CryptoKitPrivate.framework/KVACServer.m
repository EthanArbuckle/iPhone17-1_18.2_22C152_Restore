@interface KVACServer
- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4;
- (NSData)keyId;
- (_TtC16CryptoKitPrivate10KVACServer)init;
- (id)issueWithRequestData:(id)a3 error:(id *)a4;
@end

@implementation KVACServer

- (NSData)keyId
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId);
}

- (_TtC16CryptoKitPrivate10KVACServer)init
{
  return (_TtC16CryptoKitPrivate10KVACServer *)KVACServer.init()();
}

- (id)issueWithRequestData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1DB0C4A08();
  unint64_t v9 = v8;

  v10 = sub_1DB0628B8(v7, v9);
  sub_1DB042664(v7, v9);
  return v10;
}

- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  uint64_t v9 = sub_1DB0C4A08();
  unint64_t v11 = v10;

  uint64_t v12 = sub_1DB0C4A08();
  unint64_t v14 = v13;

  LOBYTE(v7) = sub_1DB062AE0(v9, v11, v12, v14);
  sub_1DB042664(v12, v14);
  sub_1DB042664(v9, v11);

  return v7 & 1;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 8];
  unint64_t v14 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server];
  v4 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 16];
  id v5 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 24];
  id v6 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 32];
  id v7 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 40];
  uint64_t v9 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 48];
  unint64_t v8 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 56];
  uint64_t v10 = *(void *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 72];
  unint64_t v11 = *(void *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 80];

  sub_1DB042664(v10, v11);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId);
  unint64_t v13 = *(void *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId];
  sub_1DB042664(v12, v13);
}

@end