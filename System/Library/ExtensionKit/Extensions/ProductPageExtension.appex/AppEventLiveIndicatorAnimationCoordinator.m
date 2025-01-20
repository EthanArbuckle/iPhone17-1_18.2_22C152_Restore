@interface AppEventLiveIndicatorAnimationCoordinator
- (_TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator)init;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
@end

@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator *)sub_10016717C();
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_100167FE4();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_100167604();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator_currentAnimator);
}

@end