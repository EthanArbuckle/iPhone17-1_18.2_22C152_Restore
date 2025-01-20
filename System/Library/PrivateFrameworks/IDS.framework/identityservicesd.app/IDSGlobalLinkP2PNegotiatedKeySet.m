@interface IDSGlobalLinkP2PNegotiatedKeySet
- (NSData)clientSecret;
- (NSData)serverSecret;
- (NSString)description;
- (NSString)sensitiveDescription;
- (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet)init;
@end

@implementation IDSGlobalLinkP2PNegotiatedKeySet

- (NSData)serverSecret
{
  return (NSData *)sub_100454780((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_serverSecret);
}

- (NSData)clientSecret
{
  return (NSData *)sub_100454780((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_clientSecret);
}

- (NSString)sensitiveDescription
{
  return (NSString *)sub_1004552E4(self, (uint64_t)a2, (void (*)(void))sub_100454C60);
}

- (NSString)description
{
  return (NSString *)sub_1004552E4(self, (uint64_t)a2, (void (*)(void))sub_100454EC0);
}

- (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet)init
{
  result = (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100442248(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_serverSecret), *(void *)&self->serverSecret[OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_serverSecret]);
  sub_100442248(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_clientSecret), *(void *)&self->serverSecret[OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_clientSecret]);

  swift_bridgeObjectRelease();
}

@end