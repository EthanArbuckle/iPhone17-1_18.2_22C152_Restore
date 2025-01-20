@interface ManualSyncFinishedEvent
+ (NSString)name;
- (NSString)errorDomain;
- (_TtC9storekitd23ManualSyncFinishedEvent)init;
- (void)configureWithError:(id)a3;
- (void)setErrorDomain:(id)a3;
@end

@implementation ManualSyncFinishedEvent

+ (NSString)name
{
  return (NSString *)sub_100113798((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_100113324);
}

- (NSString)errorDomain
{
  sub_1000BA470(&OBJC_IVAR____TtC9storekitd23ManualSyncFinishedEvent_errorDomain);
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

- (void)setErrorDomain:(id)a3
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
  sub_100113440(v4, v6, &OBJC_IVAR____TtC9storekitd23ManualSyncFinishedEvent_errorDomain);
}

- (void)configureWithError:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_100113448((uint64_t)a3);
}

- (_TtC9storekitd23ManualSyncFinishedEvent)init
{
  return (_TtC9storekitd23ManualSyncFinishedEvent *)sub_10011369C();
}

- (void).cxx_destruct
{
}

@end