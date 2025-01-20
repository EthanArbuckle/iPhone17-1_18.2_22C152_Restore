@interface _MPCSleepTimerController
- (_MPCSleepTimerController)init;
- (_MPCSleepTimerController)initWithPlaybackEngine:(id)a3;
- (double)fireDate;
- (double)time;
- (int64_t)stopMode;
- (void)didChangeItemElapsedTime:(double)a3;
- (void)didEndPlaybackForCurrentItem;
- (void)reset;
- (void)startSleepTimerForChapterEnd;
- (void)startSleepTimerForItemEnd;
- (void)startSleepTimerWithTimeRemaining:(double)a3;
@end

@implementation _MPCSleepTimerController

- (_MPCSleepTimerController)initWithPlaybackEngine:(id)a3
{
  SleepTimerController.init(playbackEngine:)(a3);
  return result;
}

- (void)startSleepTimerForItemEnd
{
  v2 = self;
  sub_21BD0A58C();
}

- (void)startSleepTimerWithTimeRemaining:(double)a3
{
  v4 = self;
  sub_21BD0A604(a3);
}

- (void)startSleepTimerForChapterEnd
{
  v2 = self;
  sub_21BD0A6A4();
}

- (void)reset
{
  v2 = self;
  sub_21BD0A734();
}

- (int64_t)stopMode
{
  return sub_21BD0A7D8();
}

- (double)time
{
  return sub_21BD0A830();
}

- (double)fireDate
{
  v2 = self;
  double v3 = sub_21BD0A890();

  return v3;
}

- (_MPCSleepTimerController)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____MPCSleepTimerController_observedChapter);
}

- (void)didEndPlaybackForCurrentItem
{
  v2 = self;
  SleepTimerController.didEndPlaybackForCurrentItem()();
}

- (void)didChangeItemElapsedTime:(double)a3
{
  v4 = self;
  SleepTimerController.didChangeItemElapsedTime(_:)(v3);
}

@end