@interface BaseManualSyncEvent
+ (NSString)baseName;
- (NSString)app;
- (_TtC9storekitd19BaseManualSyncEvent)init;
- (void)configureWithClient:(id)a3;
- (void)setApp:(id)a3;
@end

@implementation BaseManualSyncEvent

+ (NSString)baseName
{
  return (NSString *)sub_100113798((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_100112D3C);
}

- (NSString)app
{
  sub_100112DCC();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setApp:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_100112E58(v4, v6);
}

- (void)configureWithClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100112E64((uint64_t)v4);
}

- (_TtC9storekitd19BaseManualSyncEvent)init
{
  return (_TtC9storekitd19BaseManualSyncEvent *)sub_100112F70();
}

- (void).cxx_destruct
{
}

@end