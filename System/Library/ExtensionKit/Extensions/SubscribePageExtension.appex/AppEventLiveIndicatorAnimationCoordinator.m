@interface AppEventLiveIndicatorAnimationCoordinator
- (_TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator)init;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
@end

@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator *)sub_1001B26B4();
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_1001B3174();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_1001B2794();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator_currentAnimator);
}

@end