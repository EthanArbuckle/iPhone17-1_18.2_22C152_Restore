@interface CacheDeleteActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored19CacheDeleteActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation CacheDeleteActivity

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_deadline);
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
  self;
  v3 = self;
  id v4 = sub_1002C5D90();
  sub_1002C7288(v4);
}

- (_TtC9appstored19CacheDeleteActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_deadline) = (Class)XPC_ACTIVITY_INTERVAL_15_MIN;
  id v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_descriptiveName);
  *id v4 = 0xD000000000000010;
  v4[1] = 0x800000010044D3F0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_isEnabled) = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ActivityClass *)&v6 init];
}

- (void).cxx_destruct
{
}

@end