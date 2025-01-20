@interface SKTwoErrorEvent
- (NSString)eventName;
- (_TtC8StoreKit15SKTwoErrorEvent)init;
- (id)createPayload;
@end

@implementation SKTwoErrorEvent

- (NSString)eventName
{
  sub_1B0108758();
  v2 = (void *)sub_1B01DBB20();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)createPayload
{
  v2 = self;
  uint64_t v3 = sub_1B0108774();

  if (v3)
  {
    sub_1B0108AF8();
    v4 = (void *)sub_1B01DBA20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_TtC8StoreKit15SKTwoErrorEvent)init
{
  return (_TtC8StoreKit15SKTwoErrorEvent *)sub_1B0108A30();
}

@end