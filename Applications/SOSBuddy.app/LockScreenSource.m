@interface LockScreenSource
- (_TtC8SOSBuddy16LockScreenSource)init;
- (void)dealloc;
@end

@implementation LockScreenSource

- (_TtC8SOSBuddy16LockScreenSource)init
{
  return (_TtC8SOSBuddy16LockScreenSource *)sub_100069414();
}

- (void)dealloc
{
  v2 = self;
  sub_100069684();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy16LockScreenSource_agent);
}

@end