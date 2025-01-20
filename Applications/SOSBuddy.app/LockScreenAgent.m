@interface LockScreenAgent
- (_TtC8SOSBuddy15LockScreenAgent)init;
- (void)dealloc;
@end

@implementation LockScreenAgent

- (void)dealloc
{
  v2 = self;
  sub_100010C60();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy15LockScreenAgent_queue);
}

- (_TtC8SOSBuddy15LockScreenAgent)init
{
  result = (_TtC8SOSBuddy15LockScreenAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end