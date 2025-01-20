@interface AnalyticsEvent
+ (NSString)name;
+ (void)sendLazy:(id)a3;
- (BOOL)canCreatePayload;
- (NSDictionary)payload;
- (NSString)eventName;
- (_TtC17StoreKitUIService14AnalyticsEvent)init;
- (id)createPayload;
@end

@implementation AnalyticsEvent

+ (void)sendLazy:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  sub_10002A5AC((uint64_t)sub_10002C1D0, v4);

  swift_release();
}

- (NSDictionary)payload
{
  v2 = self;
  sub_10002A794();

  sub_10002B278();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

+ (NSString)name
{
  swift_getObjCClassMetadata();
  sub_10002ADF8();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC17StoreKitUIService14AnalyticsEvent)init
{
  return (_TtC17StoreKitUIService14AnalyticsEvent *)sub_10002B090();
}

- (BOOL)canCreatePayload
{
  return 1;
}

- (id)createPayload
{
  NSString v2 = self;
  uint64_t v3 = sub_10002B150();

  if (v3)
  {
    sub_10002B278();
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
  sub_10002B23C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end