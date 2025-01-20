@interface AnalyticsEvent
+ (NSString)name;
+ (void)sendLazy:(id)a3;
- (BOOL)canCreatePayload;
- (NSDictionary)payload;
- (NSString)eventName;
- (_TtC9storekitd14AnalyticsEvent)init;
- (id)createPayload;
@end

@implementation AnalyticsEvent

+ (void)sendLazy:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  sub_100111FD0((uint64_t)sub_100113EF0, v4);

  swift_release();
}

- (NSDictionary)payload
{
  v2 = self;
  sub_10011227C();

  sub_100113D48();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

+ (NSString)name
{
  swift_getObjCClassMetadata();
  sub_1001128E0();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC9storekitd14AnalyticsEvent)init
{
  return (_TtC9storekitd14AnalyticsEvent *)sub_100112B78();
}

- (BOOL)canCreatePayload
{
  return 1;
}

- (id)createPayload
{
  NSString v2 = self;
  uint64_t v3 = sub_100112C14();

  if (v3)
  {
    sub_100113D48();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (NSString)eventName
{
  NSString v2 = self;
  sub_100112D00();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end