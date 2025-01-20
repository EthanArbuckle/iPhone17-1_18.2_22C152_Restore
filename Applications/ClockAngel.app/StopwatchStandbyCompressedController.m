@interface StopwatchStandbyCompressedController
- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithCoder:(id)a3;
- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didPauseLapTimer;
- (void)didResumeLapTimer;
- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8;
@end

@implementation StopwatchStandbyCompressedController

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  v14 = self;
  sub_10004E634(a7, a8, a3, a4, a5, a6);
}

- (void)didPauseLapTimer
{
  v2 = self;
  sub_10004E818();
}

- (void)didResumeLapTimer
{
  v2 = self;
  sub_10004E8EC();
}

- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel36StopwatchStandbyCompressedController *)sub_10004EAC0(a3);
}

- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC10ClockAngel36StopwatchStandbyCompressedController *)sub_10004ED5C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10004EBF8);
}

- (void).cxx_destruct
{
}

@end