@interface BannerPresentationManager
- (BOOL)hasPresentedFullScreenCallUI;
- (BOOL)inCallControlsVisible;
- (BOOL)isAmbient;
- (BOOL)isPresentingFullScreenCallUI;
- (BOOL)isSpringBoardLocked;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)inCallSceneSessionIdentifier;
- (_TtC15ConversationKit25BannerPresentationManager)init;
- (_TtC15ConversationKit30SystemBannerHostViewController)presentedBanner;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)deepLinkToFullScreenCallDetailsView;
- (void)deepLinkToFullScreenCallUI;
- (void)deepLinkToFullScreenPTTCallDetailsView;
- (void)didDismiss:(id)a3 reason:(int64_t)a4;
- (void)didUpdatePresentationModeToDismissed;
- (void)didUpdatePresentationModeToFullScreen;
- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4;
- (void)handleAppLaunchWantsHUDDismissal:(id)a3;
- (void)handleCallStatusDidChange:(id)a3;
- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3;
- (void)setPresentedBanner:(id)a3;
- (void)showDefaultSystemHUD;
@end

@implementation BannerPresentationManager

- (_TtC15ConversationKit30SystemBannerHostViewController)presentedBanner
{
  v2 = BannerPresentationManager.presentedBanner.getter();
  return (_TtC15ConversationKit30SystemBannerHostViewController *)v2;
}

- (void)setPresentedBanner:(id)a3
{
  id v5 = a3;
  v6 = self;
  BannerPresentationManager.presentedBanner.setter(a3);
}

- (BOOL)inCallControlsVisible
{
  v2 = self;
  char v3 = BannerPresentationManager.inCallControlsVisible.getter();

  return v3 & 1;
}

- (_TtC15ConversationKit25BannerPresentationManager)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_activityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_bannerActivityManager));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentationDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_audioRoutingDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_inCallConversationControlsDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager__conversationControlsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_handedOffCall));
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedBanner));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedSystemApertureElement));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedBannerDismissalTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_systemApertureElementDismissalTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_placeholderCallCenter));
  swift_unknownObjectRelease();
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_features);
}

- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BannerPresentationManager.dismissPresentedBanner(forReason:animated:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BannerPresentationManager.invalidatePersistentSystemApertureAlert(reason:)(v8);

  swift_bridgeObjectRelease();
}

- (NSString)inCallSceneSessionIdentifier
{
  v2 = self;
  uint64_t v3 = BannerPresentationManager.inCallSceneSessionIdentifier.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (NSSet)backgroundActivitiesToSuppress
{
  v2 = self;
  BannerPresentationManager.backgroundActivitiesToSuppress.getter();

  type metadata accessor for STBackgroundActivityIdentifier(0);
  lazy protocol witness table accessor for type STBackgroundActivityIdentifier and conformance STBackgroundActivityIdentifier((uint64_t)&lazy protocol witness table cache variable for type STBackgroundActivityIdentifier and conformance STBackgroundActivityIdentifier);
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v3.super.isa;
}

- (BOOL)hasPresentedFullScreenCallUI
{
  v2 = self;
  unsigned __int8 v3 = BannerPresentationManager.hasPresentedFullScreenCallUI.getter();

  return v3 & 1;
}

- (BOOL)isPresentingFullScreenCallUI
{
  v2 = self;
  unsigned __int8 v3 = BannerPresentationManager.isPresentingFullScreenCallUI.getter();

  return v3 & 1;
}

- (BOOL)isAmbient
{
  v2 = self;
  unsigned __int8 v3 = BannerPresentationManager.isAmbient.getter();

  return v3 & 1;
}

- (BOOL)isSpringBoardLocked
{
  v2 = self;
  unsigned __int8 v3 = BannerPresentationManager.isSpringBoardLocked.getter();

  return v3 & 1;
}

- (void)deepLinkToFullScreenCallUI
{
  v2 = self;
  BannerPresentationManager.presentFullscreenUI()();
}

- (void)deepLinkToFullScreenCallDetailsView
{
  v2 = self;
  BannerPresentationManager.deepLinkToFullScreenCallDetailsView()();
}

- (void)deepLinkToFullScreenPTTCallDetailsView
{
  v2 = self;
  BannerPresentationManager.deepLinkToFullScreenPTTCallDetailsView()();
}

- (void)showDefaultSystemHUD
{
  v2 = self;
  BannerPresentationManager.showDefaultSystemHUD()();
}

- (void)didDismiss:(id)a3 reason:(int64_t)a4
{
  uint64_t v6 = a3;
  v7 = self;
  BannerPresentationManager.didDismiss(_:reason:)(v6, a4);
}

- (void)handleCallStatusDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v8 = self;
  BannerPresentationManager.handleCallStatusDidChange(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleAppLaunchWantsHUDDismissal:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v8 = self;
  BannerPresentationManager.handleAppLaunchWantsHUDDismissal(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didUpdatePresentationModeToDismissed
{
  v2 = self;
  BannerPresentationManager.didUpdatePresentationModeToDismissed()();
}

- (void)didUpdatePresentationModeToFullScreen
{
  v2 = self;
  BannerPresentationManager.didUpdatePresentationModeToFullScreen()();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Swift::String v8 = self;
  BannerPresentationManager.conversationManager(_:removedActiveConversation:)();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  BannerPresentationManager.conversationManager(_:stateChangedFor:fromOldConversation:)();
}

@end