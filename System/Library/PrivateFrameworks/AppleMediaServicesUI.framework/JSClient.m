@interface JSClient
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)locale;
- (NSString)userAgent;
- (_TtC14amsengagementd8JSClient)init;
- (_TtP14amsengagementd19JSClientDemoExports_)demo;
- (void)setDemo:(id)a3;
@end

@implementation JSClient

- (_TtP14amsengagementd19JSClientDemoExports_)demo
{
  v2 = (void *)sub_1000D4CC0();
  return (_TtP14amsengagementd19JSClientDemoExports_ *)v2;
}

- (void)setDemo:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1000D4D30((uint64_t)a3);
}

- (NSString)clientIdentifier
{
  return (NSString *)sub_1000D4FD4(self, (uint64_t)a2, (void (*)(void))sub_1000D4D60);
}

- (NSString)clientVersion
{
  return (NSString *)sub_1000D4FD4(self, (uint64_t)a2, (void (*)(void))sub_1000D4D84);
}

- (NSString)locale
{
  v2 = self;
  sub_1000D4E40();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)userAgent
{
  return (NSString *)sub_1000D4FD4(self, (uint64_t)a2, (void (*)(void))sub_1000D5044);
}

- (_TtC14amsengagementd8JSClient)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14amsengagementd8JSClient_clientInfo);
}

@end