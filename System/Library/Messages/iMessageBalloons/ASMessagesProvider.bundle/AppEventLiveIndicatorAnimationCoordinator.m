@interface AppEventLiveIndicatorAnimationCoordinator
- (_TtC18ASMessagesProvider41AppEventLiveIndicatorAnimationCoordinator)init;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
@end

@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC18ASMessagesProvider41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC18ASMessagesProvider41AppEventLiveIndicatorAnimationCoordinator *)sub_19CE84();
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_19DC84();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_19D30C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider41AppEventLiveIndicatorAnimationCoordinator_currentAnimator);
}

@end