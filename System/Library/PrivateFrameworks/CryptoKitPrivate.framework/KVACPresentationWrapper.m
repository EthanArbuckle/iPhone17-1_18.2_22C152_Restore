@interface KVACPresentationWrapper
- (NSData)prefix;
- (NSData)presentationData;
- (NSData)serverKeyId;
- (NSData)tag;
- (_TtC16CryptoKitPrivate23KVACPresentationWrapper)init;
@end

@implementation KVACPresentationWrapper

- (NSData)serverKeyId
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId);
}

- (NSData)tag
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag);
}

- (NSData)prefix
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix);
}

- (NSData)presentationData
{
  return (NSData *)sub_1DB06255C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData);
}

- (_TtC16CryptoKitPrivate23KVACPresentationWrapper)init
{
  result = (_TtC16CryptoKitPrivate23KVACPresentationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId), *(void *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId]);
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag), *(void *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag]);
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix), *(void *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData);
  unint64_t v4 = *(void *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData];
  sub_1DB042664(v3, v4);
}

@end