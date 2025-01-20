@interface KeychainWriteFailedEvent
+ (NSString)name;
- (BOOL)canCreatePayload;
- (NSString)errorDomain;
- (_TtC9storekitd24KeychainWriteFailedEvent)init;
- (_TtC9storekitd24KeychainWriteFailedEvent)initWithError:(id)a3;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
@end

@implementation KeychainWriteFailedEvent

+ (NSString)name
{
  return (NSString *)sub_100113798((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1001137EC);
}

- (NSString)errorDomain
{
  sub_100113850();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setErrorDomain:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_1001138FC(v4, v6);
}

- (int64_t)errorCode
{
  return sub_10011392C();
}

- (void)setErrorCode:(int64_t)a3
{
}

- (_TtC9storekitd24KeychainWriteFailedEvent)initWithError:(id)a3
{
  return (_TtC9storekitd24KeychainWriteFailedEvent *)sub_10011396C(a3);
}

- (_TtC9storekitd24KeychainWriteFailedEvent)init
{
  return (_TtC9storekitd24KeychainWriteFailedEvent *)sub_100113B44();
}

- (BOOL)canCreatePayload
{
  NSString v2 = self;
  BOOL v3 = sub_100113C38();

  return v3;
}

- (void).cxx_destruct
{
}

@end