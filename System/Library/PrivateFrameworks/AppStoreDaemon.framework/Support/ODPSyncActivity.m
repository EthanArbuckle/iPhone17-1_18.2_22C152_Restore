@interface ODPSyncActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored15ODPSyncActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation ODPSyncActivity

- (int64_t)deadline
{
  return 0;
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
  NSString v2 = self;
  sub_100073724();
}

- (_TtC9appstored15ODPSyncActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_deadline) = 0;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_descriptiveName);
  void *v4 = 0x636E79732050444FLL;
  v4[1] = 0xE800000000000000;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_isEnabled) = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ActivityClass *)&v6 init];
}

- (void).cxx_destruct
{
}

@end