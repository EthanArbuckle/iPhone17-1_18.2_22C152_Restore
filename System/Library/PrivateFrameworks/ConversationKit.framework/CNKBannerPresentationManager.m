@interface CNKBannerPresentationManager
- (BOOL)conversationIsAVLess;
- (BOOL)hasAssociatedCall;
- (BOOL)inCallControlsVisible;
- (BOOL)isMicIndicatorVisible;
- (BOOL)onlyHasPlaceholderCall;
- (BOOL)shouldShowCallDetailsWhenReady;
- (BOOL)wantsBannerWithoutScene;
- (CNKAudioRoutingDelegate)audioRoutingDelegate;
- (CNKBannerPresentationDelegate)presentationDelegate;
- (CNKBannerPresentationManager)init;
- (CNKBannerPresentationManager)initWithDelegate:(id)a3;
- (CNKLocalAudioTogglingDelegate)localAudioTogglingDelegate;
- (NSUUID)callUUID;
- (NSUUID)placeholderCallGroupUUID;
- (TUCall)activeCall;
- (TUCall)handedOffCall;
- (id)makeSystemApertureElementProvider;
- (unint64_t)applicationState;
- (void)bannerDismissedBySpringBoard;
- (void)didUpdatePresentationModeToDismissed;
- (void)didUpdatePresentationModeToFullScreen;
- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4;
- (void)handleLockScreenStatusChanged;
- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3;
- (void)preloadCallChanges;
- (void)presentHUDForCurrentContext;
- (void)presentReminderNotice;
- (void)presentSystemHUD;
- (void)refreshShareableContentWithBundleIdentifier:(id)a3;
- (void)setApplicationState:(unint64_t)a3;
- (void)setAudioRoutingDelegate:(id)a3;
- (void)setHandedOffCall:(id)a3;
- (void)setLocalAudioTogglingDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)showAccessoryButtonEventsNoticeIfNeeded;
- (void)showGreenTea3PHUD;
- (void)showHandoffHUD;
- (void)showInCallHUD;
- (void)showLagunaPullConversationHUD;
- (void)showPTTHUD;
- (void)showRemoteParticipantNoticeIfNeeded;
@end

@implementation CNKBannerPresentationManager

- (CNKBannerPresentationDelegate)presentationDelegate
{
  v2 = self;
  v3 = (void *)CNKBannerPresentationManager.presentationDelegate.getter();

  return (CNKBannerPresentationDelegate *)v3;
}

- (void)setPresentationDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  CNKBannerPresentationManager.presentationDelegate.setter((uint64_t)a3);
}

- (CNKAudioRoutingDelegate)audioRoutingDelegate
{
  v2 = self;
  v3 = (void *)CNKBannerPresentationManager.audioRoutingDelegate.getter();

  return (CNKAudioRoutingDelegate *)v3;
}

- (void)setAudioRoutingDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  CNKBannerPresentationManager.audioRoutingDelegate.setter((uint64_t)a3);
}

- (TUCall)handedOffCall
{
  v2 = self;
  v3 = (void *)CNKBannerPresentationManager.handedOffCall.getter();

  return (TUCall *)v3;
}

- (void)setHandedOffCall:(id)a3
{
  id v5 = a3;
  v6 = self;
  CNKBannerPresentationManager.handedOffCall.setter((uint64_t)a3);
}

- (BOOL)inCallControlsVisible
{
  v2 = self;
  char v3 = CNKBannerPresentationManager.inCallControlsVisible.getter();

  return v3 & 1;
}

- (BOOL)isMicIndicatorVisible
{
  v2 = self;
  char v3 = CNKBannerPresentationManager.isMicIndicatorVisible.getter();

  return v3 & 1;
}

- (BOOL)onlyHasPlaceholderCall
{
  v2 = self;
  char HasPlaceholder = CNKBannerPresentationManager.onlyHasPlaceholderCall.getter();

  return HasPlaceholder & 1;
}

- (BOOL)conversationIsAVLess
{
  v2 = self;
  CNKBannerPresentationManager.conversationIsAVLess.getter();
  char v4 = v3;

  return v4 & 1;
}

- (CNKLocalAudioTogglingDelegate)localAudioTogglingDelegate
{
  v2 = self;
  CNKBannerPresentationManager.localAudioTogglingDelegate.getter();
  char v4 = v3;

  return (CNKLocalAudioTogglingDelegate *)v4;
}

- (void)setLocalAudioTogglingDelegate:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  CNKBannerPresentationManager.localAudioTogglingDelegate.setter();
}

- (NSUUID)placeholderCallGroupUUID
{
  return (NSUUID *)@objc CNKBannerPresentationManager.placeholderCallGroupUUID.getter(self, (uint64_t)a2, (void (*)(void))CNKBannerPresentationManager.placeholderCallGroupUUID.getter);
}

- (NSUUID)callUUID
{
  return (NSUUID *)@objc CNKBannerPresentationManager.placeholderCallGroupUUID.getter(self, (uint64_t)a2, CNKBannerPresentationManager.callUUID.getter);
}

- (BOOL)shouldShowCallDetailsWhenReady
{
  v2 = self;
  CNKBannerPresentationManager.shouldShowCallDetailsWhenReady.getter();
  char v4 = v3;

  return v4 & 1;
}

- (unint64_t)applicationState
{
  v2 = self;
  CNKBannerPresentationManager.applicationState.getter();
  unint64_t v4 = v3;

  return v4;
}

- (void)setApplicationState:(unint64_t)a3
{
  unint64_t v3 = self;
  CNKBannerPresentationManager.applicationState.setter();
}

- (BOOL)wantsBannerWithoutScene
{
  v2 = self;
  char v3 = CNKBannerPresentationManager.wantsBannerWithoutScene.getter();

  return v3 & 1;
}

- (TUCall)activeCall
{
  v2 = self;
  char v3 = (void *)CNKBannerPresentationManager.activeCall.getter();

  return (TUCall *)v3;
}

- (BOOL)hasAssociatedCall
{
  v2 = self;
  BOOL v3 = CNKBannerPresentationManager.hasAssociatedCall.getter();

  return v3;
}

- (void)presentSystemHUD
{
  v2 = self;
  CNKBannerPresentationManager.presentSystemHUD()();
}

- (void)presentHUDForCurrentContext
{
  v2 = self;
  CNKBannerPresentationManager.presentHUDForCurrentContext()();
}

- (void)showInCallHUD
{
  v2 = self;
  CNKBannerPresentationManager.showInCallHUD()();
}

- (void)showGreenTea3PHUD
{
  v2 = self;
  CNKBannerPresentationManager.showGreenTea3PHUD()();
}

- (void)showPTTHUD
{
  v2 = self;
  CNKBannerPresentationManager.showPTTHUD()();
}

- (void)showRemoteParticipantNoticeIfNeeded
{
  v2 = self;
  CNKBannerPresentationManager.showRemoteParticipantNoticeIfNeeded()();
}

- (void)showAccessoryButtonEventsNoticeIfNeeded
{
  v2 = self;
  CNKBannerPresentationManager.showAccessoryButtonEventsNoticeIfNeeded()();
}

- (void)showHandoffHUD
{
  v2 = self;
  CNKBannerPresentationManager.showHandoffHUD()();
}

- (void)showLagunaPullConversationHUD
{
  v2 = self;
  CNKBannerPresentationManager.showLagunaPullConversationHUD()();
}

- (void)presentReminderNotice
{
  v2 = self;
  CNKBannerPresentationManager.presentReminderNotice()();
}

- (void)preloadCallChanges
{
  v2 = self;
  CNKBannerPresentationManager.preloadCallChanges()();
}

- (void)bannerDismissedBySpringBoard
{
  v2 = self;
  CNKBannerPresentationManager.bannerDismissedBySpringBoard()();
}

- (void)refreshShareableContentWithBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  CNKBannerPresentationManager.refreshShareableContentWithBundleIdentifier(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String_optional v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CNKBannerPresentationManager.dismissPresentedBanner(forReason:animated:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  CNKBannerPresentationManager.invalidatePersistentSystemApertureAlert(reason:)(v8);

  swift_bridgeObjectRelease();
}

- (void)didUpdatePresentationModeToFullScreen
{
  v2 = self;
  CNKBannerPresentationManager.didUpdatePresentationModeToFullScreen()();
}

- (void)didUpdatePresentationModeToDismissed
{
  v2 = self;
  CNKBannerPresentationManager.didUpdatePresentationModeToDismissed()();
}

- (id)makeSystemApertureElementProvider
{
  v2 = self;
  BOOL v3 = (void *)CNKBannerPresentationManager.makeSystemApertureElementProvider()();

  return v3;
}

- (void)handleLockScreenStatusChanged
{
  v2 = self;
  CNKBannerPresentationManager.handleLockScreenStatusChanged()();
}

- (CNKBannerPresentationManager)init
{
  return (CNKBannerPresentationManager *)CNKBannerPresentationManager.init()();
}

- (CNKBannerPresentationManager)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  CNKBannerPresentationManager.init(delegate:)();
  return result;
}

- (void).cxx_destruct
{
}

@end