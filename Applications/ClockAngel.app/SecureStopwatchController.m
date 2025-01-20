@interface SecureStopwatchController
- (_TtC10ClockAngel25SecureStopwatchController)init;
- (_TtC10ClockAngel25SecureStopwatchController)initWithCoder:(id)a3;
- (_TtC10ClockAngel25SecureStopwatchController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didClearAllLaps;
- (void)didLapLapTimer;
- (void)didPauseLapTimer;
- (void)didResetLapTimer;
- (void)didResumeLapTimer;
- (void)didStartLapTimer;
- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8;
- (void)lapCancelAction;
- (void)playPausedAction;
- (void)viewDidLoad;
@end

@implementation SecureStopwatchController

- (void)viewDidLoad
{
  uint64_t v3 = sub_100007830(&qword_1000C3778);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_100010324((uint64_t)v5, (uint64_t)&unk_1000C3788, (uint64_t)v7);
  swift_release();
  sub_10000FAF8((uint64_t)v5, &qword_1000C3778);
}

- (_TtC10ClockAngel25SecureStopwatchController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel25SecureStopwatchController *)sub_100010628(a3);
}

- (_TtC10ClockAngel25SecureStopwatchController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10ClockAngel25SecureStopwatchController *)sub_100010844(v5, v7, a4);
}

- (void)playPausedAction
{
  v2 = self;
  sub_100010AD4();
}

- (void)lapCancelAction
{
  v2 = self;
  sub_100010E04();
}

- (_TtC10ClockAngel25SecureStopwatchController)init
{
  result = (_TtC10ClockAngel25SecureStopwatchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_stopwatchManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_stopwatch));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_spinnyResetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_pausePlayPackage));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_lapCancelButton);
}

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  uint64_t v9 = self;
  sub_100013EBC(a8);
}

- (void)didClearAllLaps
{
}

- (void)didStartLapTimer
{
  v2 = self;
  sub_100012CC0();
}

- (void)didPauseLapTimer
{
  v2 = self;
  sub_100012E0C();
}

- (void)didLapLapTimer
{
  v2 = self;
  sub_100013018();
}

- (void)didResetLapTimer
{
}

- (void)didResumeLapTimer
{
  v2 = self;
  sub_100013264();
}

@end