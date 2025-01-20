@interface StopwatchLockscreenController
- (_TtC10ClockAngel29StopwatchLockscreenController)initWithCoder:(id)a3;
- (_TtC10ClockAngel29StopwatchLockscreenController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_childViewControllersForAlwaysOnTimelines;
@end

@implementation StopwatchLockscreenController

- (id)_childViewControllersForAlwaysOnTimelines
{
  sub_100007830((uint64_t *)&unk_1000C66F0);
  id result = (id)swift_allocObject();
  *((_OWORD *)result + 1) = xmmword_100098560;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView);
  if (v4)
  {
    *((void *)result + 4) = v4;
    specialized Array._endMutation()();
    id v5 = v4;
    sub_100007830((uint64_t *)&unk_1000C6710);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return v6.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC10ClockAngel29StopwatchLockscreenController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StopwatchLockscreenController();
  return [(SecureStopwatchController *)&v5 initWithCoder:a3];
}

- (_TtC10ClockAngel29StopwatchLockscreenController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StopwatchLockscreenController();
  v9 = [(SecureStopwatchController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView));
}

@end