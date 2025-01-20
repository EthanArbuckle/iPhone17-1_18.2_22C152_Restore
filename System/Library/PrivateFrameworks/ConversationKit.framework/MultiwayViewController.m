@interface MultiwayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)axShouldDisableAutoHidingControls;
- (BOOL)didExpandIncomingCallBanner;
- (BOOL)effectsEnabled;
- (BOOL)hasParticipantVideo;
- (BOOL)isAmbient;
- (BOOL)isCaptioningEnabled;
- (BOOL)isDisplayedInBanner;
- (BOOL)isFullScreen;
- (BOOL)isInCallEndedBlockAndReportFlow;
- (BOOL)isInVideoMessageFlow;
- (BOOL)isOnScreen;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isPipStashed;
- (BOOL)isPipped;
- (BOOL)isPresentingEffectsBrowser;
- (BOOL)isReadyToShowCallDetails;
- (BOOL)isScreenSharingFullScreen;
- (BOOL)isShowingHUD;
- (BOOL)isShowingReactions;
- (BOOL)isShownAboveCoverSheet;
- (BOOL)restoreViewControllerHierarchyWhenExitingPiP;
- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3;
- (BOOL)shouldDisconnectOnDismissal;
- (BOOL)wantsApplicationDismissalStyle;
- (BOOL)wantsPIPRotationForLocalPreview;
- (CGRect)frameForRestoreAnimation;
- (CGRect)mediaPipFrameInWindowScene;
- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3;
- (CGSize)preferredPIPContentAspectRatio;
- (CGSize)preferredPiPContentAspectRatio;
- (CNKBannerPresentationManager)bannerPresentationManager;
- (CNKFaceTimeMultiwayConversationViewControllerDelegate)delegate;
- (CNKFaceTimeMultiwayViewControllerIOSDelegate)iOSDelegate;
- (NSTimer)inCallControlsDismissTimer;
- (TUCall)call;
- (UIImage)audioRouteGlyphForDevice;
- (UIView)localParticipantView;
- (UIViewController)pipViewController;
- (_TtC15ConversationKit22MultiwayViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit22MultiwayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15ConversationKit33VideoReactionPickerViewController)reactionsViewController;
- (id)accessibilityConstraintController;
- (id)audioRouteGlyphFor:(id)a3;
- (id)audioRouteMenu;
- (int64_t)deviceOrientation;
- (int64_t)frontBoardInterfaceOrientation;
- (int64_t)fullScreenFocusedParticipantOrientation;
- (int64_t)pipState;
- (int64_t)supportedDeviceOrientations;
- (void)bannerDidGetTap;
- (void)cameraViewController:(id)a3 didChangeEffectsState:(int64_t)a4;
- (void)cameraViewController:(id)a3 didRenderFrame:(id)a4;
- (void)cameraViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6;
- (void)cameraViewControllerPresentationRectWasDoubleTapped:(id)a3;
- (void)cancelVideoRecordingWithCompletion:(id)a3;
- (void)dealloc;
- (void)didCaptureVideoFrame:(id)a3;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didRejectForInterventionViewController:(id)a3;
- (void)didTapChangeLayoutButton;
- (void)didTapDeskViewButton;
- (void)didTapOneToOneShutterButton;
- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4;
- (void)hideEffectsBrowser;
- (void)muteVideo;
- (void)openMessagesConversation;
- (void)pipDidRotate;
- (void)prepareForAppSwitcher;
- (void)resetEffectsState;
- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4;
- (void)serverDidTimeout:(id)a3;
- (void)setBannerPresentationManager:(id)a3;
- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDidExpandIncomingCallBanner:(BOOL)a3;
- (void)setEffectsEnabled:(BOOL)a3;
- (void)setFrontBoardInterfaceOrientation:(int64_t)a3;
- (void)setHasParticipantVideo:(BOOL)a3;
- (void)setIOSDelegate:(id)a3;
- (void)setInCallControlsDismissTimer:(id)a3;
- (void)setIsAmbient:(BOOL)a3;
- (void)setIsCaptioningEnabled:(BOOL)a3;
- (void)setIsDisplayedInBanner:(BOOL)a3;
- (void)setIsFullScreen:(BOOL)a3;
- (void)setIsInCallEndedBlockAndReportFlow:(BOOL)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)setIsPipStashed:(BOOL)a3;
- (void)setIsScreenSharingFullScreen:(BOOL)a3;
- (void)setMediaPipFrameInWindowScene:(CGRect)a3;
- (void)setPipState:(int64_t)a3;
- (void)setSupportedDeviceOrientations:(int64_t)a3;
- (void)testing_didFinishLocalPreviewRotationAnimation;
- (void)toggleAudioMute;
- (void)toggleCinematicFraming;
- (void)toggleLocalOrientation;
- (void)toggleReactionsView;
- (void)toggleVideoMuteWithShouldPauseIfStopped:(BOOL)a3;
- (void)updateVideoState;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MultiwayViewController

- (void)testing_didFinishLocalPreviewRotationAnimation
{
  v2 = self;
  MultiwayViewController.testing_didFinishLocalPreviewRotationAnimation()();
}

- (void)didTapChangeLayoutButton
{
  v2 = self;
  MultiwayViewController.didTapChangeLayoutButton()();
}

- (void)didTapDeskViewButton
{
  v2 = self;
  MultiwayViewController.didTapDeskViewButton()();
}

- (BOOL)isInCallEndedBlockAndReportFlow
{
  return MultiwayViewController.isInCallEndedBlockAndReportFlow.getter() & 1;
}

- (void)setIsInCallEndedBlockAndReportFlow:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isInCallEndedBlockAndReportFlow.setter(a3);
}

- (CNKBannerPresentationManager)bannerPresentationManager
{
  v2 = MultiwayViewController.bannerPresentationManagerBox.getter();
  return (CNKBannerPresentationManager *)v2;
}

- (void)setBannerPresentationManager:(id)a3
{
  id v5 = a3;
  v6 = self;
  MultiwayViewController.bannerPresentationManagerBox.setter(a3);
}

- (BOOL)isShowingReactions
{
  return MultiwayViewController.isShowingReactions.getter() & 1;
}

- (BOOL)didExpandIncomingCallBanner
{
  return MultiwayViewController.didExpandIncomingCallBanner.getter() & 1;
}

- (void)setDidExpandIncomingCallBanner:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.didExpandIncomingCallBanner.setter(a3);
}

- (NSTimer)inCallControlsDismissTimer
{
  v2 = MultiwayViewController.inCallControlsDismissTimer.getter();
  return (NSTimer *)v2;
}

- (void)setInCallControlsDismissTimer:(id)a3
{
  id v5 = a3;
  v6 = self;
  MultiwayViewController.inCallControlsDismissTimer.setter((uint64_t)a3);
}

- (TUCall)call
{
  v2 = (void *)MultiwayViewController.call.getter();
  return (TUCall *)v2;
}

- (BOOL)wantsApplicationDismissalStyle
{
  return 1;
}

- (int64_t)deviceOrientation
{
  return MultiwayViewController.deviceOrientation.getter();
}

- (void)setDeviceOrientation:(int64_t)a3
{
  v4 = self;
  MultiwayViewController.deviceOrientation.setter(a3);
}

- (int64_t)frontBoardInterfaceOrientation
{
  return MultiwayViewController.frontBoardInterfaceOrientation.getter();
}

- (void)setFrontBoardInterfaceOrientation:(int64_t)a3
{
}

- (BOOL)wantsPIPRotationForLocalPreview
{
  v2 = self;
  BOOL v3 = MultiwayViewController.wantsPIPRotationForLocalPreview.getter();

  return v3;
}

- (int64_t)supportedDeviceOrientations
{
  return MultiwayViewController.supportedDeviceOrientations.getter();
}

- (void)setSupportedDeviceOrientations:(int64_t)a3
{
}

- (BOOL)isOnScreen
{
  v2 = self;
  char v3 = MultiwayViewController.isOnScreen.getter();

  return v3 & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
  char v3 = self;
  MultiwayViewController.isOnScreen.setter();
}

- (BOOL)hasParticipantVideo
{
  return MultiwayViewController.hasParticipantVideo.getter() & 1;
}

- (void)setHasParticipantVideo:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isInCallEndedBlockAndReportFlow.setter(a3, &OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_hasParticipantVideo, (uint64_t (*)(uint64_t))MultiwayViewController.hasParticipantVideo.didset);
}

- (BOOL)isDisplayedInBanner
{
  return MultiwayViewController.isDisplayedInBanner.getter() & 1;
}

- (void)setIsDisplayedInBanner:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isDisplayedInBanner.setter(a3);
}

- (BOOL)isInVideoMessageFlow
{
  v2 = self;
  char v3 = MultiwayViewController.isInVideoMessageFlow.getter();

  return v3 & 1;
}

- (BOOL)isShowingHUD
{
  v2 = self;
  BOOL v3 = MultiwayViewController.isShowingHUD.getter();

  return v3;
}

- (BOOL)isFullScreen
{
  return MultiwayViewController.isFullScreen.getter() & 1;
}

- (void)setIsFullScreen:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isFullScreen.setter(a3);
}

- (BOOL)isAmbient
{
  return MultiwayViewController.isAmbient.getter() & 1;
}

- (void)setIsAmbient:(BOOL)a3
{
}

- (BOOL)isShownAboveCoverSheet
{
  v2 = self;
  unsigned __int8 v3 = MultiwayViewController.isShownAboveCoverSheet.getter();

  return v3 & 1;
}

- (BOOL)isPipStashed
{
  return MultiwayViewController.isPipStashed.getter() & 1;
}

- (void)setIsPipStashed:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isPipStashed.setter(a3);
}

- (int64_t)pipState
{
  return MultiwayViewController.pipState.getter();
}

- (void)setPipState:(int64_t)a3
{
  v4 = self;
  MultiwayViewController.pipState.setter(a3);
}

- (BOOL)isCaptioningEnabled
{
  v2 = self;
  char v3 = MultiwayViewController.isCaptioningEnabled.getter();

  return v3 & 1;
}

- (void)setIsCaptioningEnabled:(BOOL)a3
{
  v4 = self;
  MultiwayViewController.isCaptioningEnabled.setter(a3);
}

- (BOOL)isPipped
{
  return MultiwayViewController.isPipped.getter();
}

- (UIView)localParticipantView
{
  v2 = (void *)MultiwayViewController.localParticipantView.getter();
  return (UIView *)v2;
}

- (_TtC15ConversationKit33VideoReactionPickerViewController)reactionsViewController
{
  v2 = MultiwayViewController.reactionsViewController.getter();
  return (_TtC15ConversationKit33VideoReactionPickerViewController *)v2;
}

- (CNKFaceTimeMultiwayConversationViewControllerDelegate)delegate
{
  v2 = (void *)MultiwayViewController.delegate.getter();
  return (CNKFaceTimeMultiwayConversationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  MultiwayViewController.delegate.setter();
}

- (CNKFaceTimeMultiwayViewControllerIOSDelegate)iOSDelegate
{
  v2 = (void *)MultiwayViewController.iOSDelegate.getter();
  return (CNKFaceTimeMultiwayViewControllerIOSDelegate *)v2;
}

- (void)setIOSDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  MultiwayViewController.iOSDelegate.setter();
}

- (BOOL)effectsEnabled
{
  return MultiwayViewController.effectsEnabled.getter() & 1;
}

- (void)setEffectsEnabled:(BOOL)a3
{
}

- (UIViewController)pipViewController
{
  v2 = (void *)MultiwayViewController.pipViewController.getter();
  return (UIViewController *)v2;
}

- (CGSize)preferredPIPContentAspectRatio
{
  v2 = self;
  double v3 = MultiwayViewController.preferredPIPContentAspectRatio.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)fullScreenFocusedParticipantOrientation
{
  v2 = self;
  MultiwayViewController.fullScreenFocusedParticipantOrientation.getter();
  int64_t v4 = v3;

  return v4;
}

- (BOOL)isOneToOneModeEnabled
{
  v2 = self;
  char v3 = MultiwayViewController.isOneToOneModeEnabled.getter();

  return v3 & 1;
}

- (BOOL)shouldDisconnectOnDismissal
{
  v2 = self;
  BOOL v3 = MultiwayViewController.shouldDisconnectOnDismissal.getter();

  return v3;
}

- (CGRect)mediaPipFrameInWindowScene
{
  double v2 = MultiwayViewController.mediaPipFrameInWindowScene.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setMediaPipFrameInWindowScene:(CGRect)a3
{
  double v3 = self;
  MultiwayViewController.mediaPipFrameInWindowScene.setter();
}

- (BOOL)isScreenSharingFullScreen
{
  return MultiwayViewController.isScreenSharingFullScreen.getter() & 1;
}

- (void)setIsScreenSharingFullScreen:(BOOL)a3
{
}

- (_TtC15ConversationKit22MultiwayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  MultiwayViewController.init(coder:)();
}

- (void)dealloc
{
  double v2 = self;
  MultiwayViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_queryForSuggestedBannerStartTime, (uint64_t *)&demangling cache variable for type metadata for Date?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_remoteControlAccessoryEventsAgent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_featureFlags));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_conversationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_bannerPresentationManagerBox));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_showReactionPickerTimer));
  swift_release();
  swift_release();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_reactionPickerTip, (uint64_t *)&demangling cache variable for type metadata for VideoReactionPickerTip?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_avcEffects));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_effectsCaptureInfo));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_linkShareCoordinator, (uint64_t *)&demangling cache variable for type metadata for LinkShareCoordinatorProtocol?);
  outlined init with take of CATransform3D?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_viewContent, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for MultiwayViewController.ViewContent?);
  _s15ConversationKit22MultiwayViewControllerC0D7ContentVSgWOrTm_0((uint64_t)v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_callDetailsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_inCallControlsDismissTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_effectsLayoutController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_pipZoomControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_hideOneToOneLivePhotoAlertViewTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_mutedBannerViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_features));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v3();
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_deskViewTapHandler);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_windowAspectRatioHandler);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_captionsLayoutChangeHandler);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_unansweredCallDismissalHandler);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_delegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_iOSDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_lastUpdatedMostActiveParticipantViewForPiP));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController____lazy_storage___flashView));
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController____lazy_storage___insulatingView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_tonePlayer));
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  double v2 = self;
  MultiwayViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4 = self;
  MultiwayViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4 = self;
  MultiwayViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v4 = self;
  MultiwayViewController.viewDidDisappear(_:)(a3);
}

- (void)viewSafeAreaInsetsDidChange
{
  double v2 = self;
  MultiwayViewController.viewSafeAreaInsetsDidChange()();
}

- (void)viewDidLayoutSubviews
{
  double v2 = self;
  MultiwayViewController.viewDidLayoutSubviews()();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  double v6 = self;
  MultiwayViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateViewConstraints
{
  double v2 = self;
  MultiwayViewController.updateViewConstraints()();
}

- (BOOL)axShouldDisableAutoHidingControls
{
  return OUTLINED_FUNCTION_1_3() & 1;
}

- (void)toggleAudioMute
{
  double v2 = self;
  MultiwayViewController.toggleAudioMute()();
}

- (void)toggleVideoMuteWithShouldPauseIfStopped:(BOOL)a3
{
  double v4 = self;
  MultiwayViewController.toggleVideoMute(shouldPauseIfStopped:)(a3);
}

- (void)toggleCinematicFraming
{
  double v2 = self;
  MultiwayViewController.toggleCinematicFraming()();
}

- (void)muteVideo
{
  double v2 = self;
  MultiwayViewController.muteVideo()();
}

- (void)openMessagesConversation
{
  double v2 = self;
  MultiwayViewController.openMessagesConversation()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  MultiwayViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (void)hideEffectsBrowser
{
  double v2 = self;
  MultiwayViewController.hideEffectsBrowser()();
}

- (void)updateVideoState
{
  double v2 = self;
  MultiwayViewController.updateVideoState()();
}

- (id)accessibilityConstraintController
{
  double v2 = MultiwayViewController.accessibilityConstraintController()();
  return v2;
}

- (_TtC15ConversationKit22MultiwayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  MultiwayViewController.init(nibName:bundle:)();
}

- (BOOL)isReadyToShowCallDetails
{
  double v2 = self;
  BOOL v3 = MultiwayViewController.isReadyToShowCallDetails.getter();

  return v3;
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  MultiwayViewController.screenSharingInteractionController(_:didUpdateRemoteControlStatus:)((uint64_t)v6, a4);
  swift_unknownObjectRelease();
}

- (void)toggleLocalOrientation
{
  double v2 = self;
  MultiwayViewController.toggleLocalOrientation()();
}

- (void)pipDidRotate
{
  double v2 = self;
  MultiwayViewController.pipDidRotate()();
}

- (void)toggleReactionsView
{
  double v2 = self;
  MultiwayViewController.toggleReactionsView()();
}

- (void)didTapOneToOneShutterButton
{
  double v2 = self;
  MultiwayViewController.didTapOneToOneShutterButton()();
}

- (BOOL)isPresentingEffectsBrowser
{
  double v2 = self;
  BOOL v3 = MultiwayViewController.isPresentingEffectsBrowser.getter();

  return v3;
}

- (void)resetEffectsState
{
  double v2 = self;
  MultiwayViewController.resetEffectsState()();
}

- (id)audioRouteMenu
{
  double v2 = self;
  BOOL v3 = (void *)MultiwayViewController.audioRouteMenu()();

  return v3;
}

- (id)audioRouteGlyphFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = MultiwayViewController.audioRouteGlyph(for:)((uint64_t)v4);

  return v6;
}

- (UIImage)audioRouteGlyphForDevice
{
  double v2 = self;
  id v3 = MultiwayViewController.audioRouteGlyphForDevice.getter();

  return (UIImage *)v3;
}

- (void)cameraViewController:(id)a3 didRenderFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  MultiwayViewController.cameraViewController(_:didRenderFrame:)();
}

- (void)cameraViewControllerPresentationRectWasDoubleTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MultiwayViewController.cameraViewControllerPresentationRectWasDoubleTapped(_:)((CFXCameraViewController *)v5);
}

- (void)cameraViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6
{
  id v8 = a3;
  v9 = self;
  MultiwayViewController.cameraViewController(_:presentationRectWasPinchedWith:scale:velocity:)(a5);
}

- (void)cameraViewController:(id)a3 didChangeEffectsState:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  MultiwayViewController.cameraViewController(_:didChange:)();
}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = MultiwayViewController.shouldAlwaysPresentExpandedApps(for:)();

  return self & 1;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    v9 = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  MultiwayViewController.effectBrowserViewController(_:presentExpandedAppViewController:animated:completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v9);
}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    v9 = _sIeyB_Ieg_TRTA_0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  MultiwayViewController.effectBrowserViewController(_:dismissExpandedAppViewController:animated:completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v9);
}

- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MultiwayViewController.expandedAppViewControllerSize(for:)();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  id v6 = a3;
  double v7 = self;
  MultiwayViewController.effectBrowserViewController(_:willChangeDockHeight:)(a4);
}

- (void)didCaptureVideoFrame:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MultiwayViewController.didCapture(_:)(v4);
}

- (void)serverDidTimeout:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MultiwayViewController.serverDidTimeout(_:)();
}

- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4
{
  id v4 = self;
  MultiwayViewController.setControlsState(_:animated:)();
}

- (void)bannerDidGetTap
{
  double v2 = self;
  MultiwayViewController.bannerDidGetTap()();
}

- (CGRect)frameForRestoreAnimation
{
  double v2 = self;
  __C::CGRect v11 = MultiwayViewController.frameForRestoreAnimation()();
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;

  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGSize)preferredPiPContentAspectRatio
{
  double v2 = self;
  CGSize v3 = MultiwayViewController.preferredPiPContentAspectRatio()();

  double width = v3.width;
  double height = v3.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)restoreViewControllerHierarchyWhenExitingPiP
{
  return 0;
}

- (void)prepareForAppSwitcher
{
  double v2 = self;
  MultiwayViewController.prepareForAppSwitcher()();
}

- (void)cancelVideoRecordingWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Bool) -> ();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = self;
  MultiwayViewController.cancelVideoRecording(completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v5);
}

- (void)didConfirmForInterventionViewController:(id)a3
{
}

- (void)didRejectForInterventionViewController:(id)a3
{
}

@end