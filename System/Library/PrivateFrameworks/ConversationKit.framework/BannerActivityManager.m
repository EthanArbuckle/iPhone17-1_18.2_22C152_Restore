@interface BannerActivityManager
+ (_TtC15ConversationKit21BannerActivityManager)sharedManager;
- (_TtC15ConversationKit21BannerActivityManager)init;
@end

@implementation BannerActivityManager

+ (_TtC15ConversationKit21BannerActivityManager)sharedManager
{
  id v2 = static BannerActivityManager.shared.getter();
  return (_TtC15ConversationKit21BannerActivityManager *)v2;
}

- (_TtC15ConversationKit21BannerActivityManager)init
{
  return (_TtC15ConversationKit21BannerActivityManager *)BannerActivityManager.init()();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21BannerActivityManager__bannerPresentationManager);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21BannerActivityManager__callUIPresentationStateProvider);
  swift_release();
  swift_bridgeObjectRelease();
}

@end