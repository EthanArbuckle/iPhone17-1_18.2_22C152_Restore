@interface TimerCompressedController
- (_TtC10ClockAngel25TimerCompressedController)init;
- (_TtC10ClockAngel25TimerCompressedController)initWithCoder:(id)a3;
- (_TtC10ClockAngel25TimerCompressedController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TimerCompressedController

- (_TtC10ClockAngel25TimerCompressedController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel25TimerCompressedController *)sub_10002F2A0(a3);
}

- (_TtC10ClockAngel25TimerCompressedController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10ClockAngel25TimerCompressedController *)sub_10002F4B8(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10002FE64(a3);
}

- (_TtC10ClockAngel25TimerCompressedController)init
{
  result = (_TtC10ClockAngel25TimerCompressedController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end