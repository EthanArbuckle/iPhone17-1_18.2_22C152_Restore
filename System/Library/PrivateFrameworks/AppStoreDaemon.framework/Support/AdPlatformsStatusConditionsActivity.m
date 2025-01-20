@interface AdPlatformsStatusConditionsActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored35AdPlatformsStatusConditionsActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation AdPlatformsStatusConditionsActivity

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_deadline);
}

- (NSString)descriptiveName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)run
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedInstance];
  sub_1003226A8(v5);
}

- (_TtC9appstored35AdPlatformsStatusConditionsActivity)init
{
  if ((unint64_t)(XPC_ACTIVITY_INTERVAL_1_DAY - 0x400000000000000) >> 59 == 31)
  {
    NSString v2 = self;
    uint64_t v3 = OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_deadline;
    ObjectType = (objc_class *)swift_getObjectType();
    *(Class *)((char *)&v2->super.super.isa + v3) = (Class)(32 * XPC_ACTIVITY_INTERVAL_1_DAY);
    id v5 = (Class *)((char *)&v2->super.super.isa
                 + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_descriptiveName);
    *id v5 = 0xD00000000000001DLL;
    v5[1] = 0x800000010044D2C0;
    *((unsigned char *)&v2->super.super.isa + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_isEnabled) = 1;
    v6.receiver = v2;
    v6.super_class = ObjectType;
    return [(ActivityClass *)&v6 init];
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void).cxx_destruct
{
}

@end