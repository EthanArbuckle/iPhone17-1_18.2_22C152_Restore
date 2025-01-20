@interface DeviceSecurityActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored22DeviceSecurityActivity)init;
- (_TtC9appstored22DeviceSecurityActivity)initWithBlock:(id)a3;
- (int64_t)deadline;
- (void)run;
@end

@implementation DeviceSecurityActivity

- (_TtC9appstored22DeviceSecurityActivity)initWithBlock:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_deadline) = (Class)XPC_ACTIVITY_INTERVAL_15_MIN;
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_descriptiveName);
  void *v8 = 0x5320656369766544;
  v8[1] = 0xEF79746972756365;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_isEnabled) = 1;
  *(void *)(v7 + 16) = v6;
  v9 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_body);
  *v9 = sub_1000FA264;
  v9[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(ActivityClass *)&v11 init];
}

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_deadline);
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
  NSString v2 = *(void (**)(void))((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_body);
  v3 = self;
  v2();
}

- (_TtC9appstored22DeviceSecurityActivity)init
{
  result = (_TtC9appstored22DeviceSecurityActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end