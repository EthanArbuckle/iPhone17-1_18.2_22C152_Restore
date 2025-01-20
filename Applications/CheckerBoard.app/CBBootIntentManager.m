@interface CBBootIntentManager
+ (CBBootIntentManager)sharedInstance;
- (BOOL)isCurrentProcessFirstToReadIntent;
- (CBBootIntentManager)init;
- (id)bootIntentLocale;
- (id)bootIntentWifiPassword;
- (id)bootIntentWifiSSID;
- (unint64_t)currentBootIntentReason;
- (void)deleteBootIntentSourceData;
@end

@implementation CBBootIntentManager

+ (CBBootIntentManager)sharedInstance
{
  if (qword_10008F7B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000902F0;

  return (CBBootIntentManager *)v2;
}

- (unint64_t)currentBootIntentReason
{
  v2 = self;
  sub_10003B354((uint64_t)v4);
  sub_10003D0A8((uint64_t)v4);

  return v4[0];
}

- (id)bootIntentLocale
{
  v2 = self;
  sub_10003B354((uint64_t)&v5);
  sub_10003D0F4((uint64_t)&v6, (uint64_t)v7, &qword_10008F818);
  sub_10003D158((uint64_t)v7);
  sub_10003D0A8((uint64_t)&v5);

  sub_10003D0F4((uint64_t)v7, (uint64_t)v8, &qword_10008F818);
  if (v8[1])
  {
    NSString v3 = String._bridgeToObjectiveC()();
    sub_10003D184((uint64_t)v7);
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

- (id)bootIntentWifiSSID
{
  v2 = self;
  sub_10003B354((uint64_t)v5);
  sub_10003D0F4((uint64_t)&v6, (uint64_t)v7, &qword_10008F818);
  sub_10003D158((uint64_t)v7);
  sub_10003D0A8((uint64_t)v5);

  sub_10003D0F4((uint64_t)v7, (uint64_t)v8, &qword_10008F818);
  if (v8[1])
  {
    NSString v3 = String._bridgeToObjectiveC()();
    sub_10003D184((uint64_t)v7);
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

- (id)bootIntentWifiPassword
{
  v2 = self;
  sub_10003B354((uint64_t)v5);
  sub_10003D0F4((uint64_t)&v6, (uint64_t)v7, &qword_10008F818);
  sub_10003D158((uint64_t)v7);
  sub_10003D0A8((uint64_t)v5);

  sub_10003D0F4((uint64_t)v7, (uint64_t)v8, &qword_10008F818);
  if (v8[1])
  {
    NSString v3 = String._bridgeToObjectiveC()();
    sub_10003D184((uint64_t)v7);
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

- (void)deleteBootIntentSourceData
{
  sub_10003CC64();
  NSString v3 = self;
  v4 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 clearNVRamVariable:v6];
}

- (BOOL)isCurrentProcessFirstToReadIntent
{
  v2 = self;
  sub_10003B354((uint64_t)v4);
  sub_10003D0A8((uint64_t)v4);

  return v4[56];
}

- (CBBootIntentManager)init
{
  v2 = (char *)self + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent;
  *(void *)v2 = 0;
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 1;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  v2[56] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BootIntentManager();
  return [(CBBootIntentManager *)&v4 init];
}

- (void).cxx_destruct
{
}

@end