@interface IDSGlobalLinkP2PKeyNegotiation
- (NSData)blob;
- (NSString)description;
- (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation)init;
- (id)receiveBlob:(id)a3;
@end

@implementation IDSGlobalLinkP2PKeyNegotiation

- (NSString)description
{
  v2 = self;
  sub_10052CB5C();

  NSString v3 = sub_100726420();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSData)blob
{
  v2 = self;
  uint64_t v3 = sub_10052CDB8();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100725B20().super.isa;
    sub_10044CE88(v3, v5);
  }

  return (NSData *)isa;
}

- (id)receiveBlob:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  uint64_t v6 = sub_100725B50();
  unint64_t v8 = v7;

  id v9 = sub_10052D04C(v6, v8);
  sub_100442248(v6, v8);

  return v9;
}

- (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation)init
{
  result = (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_logger;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end