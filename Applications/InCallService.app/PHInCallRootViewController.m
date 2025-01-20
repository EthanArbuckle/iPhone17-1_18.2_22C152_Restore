@interface PHInCallRootViewController
+ (BOOL)containsDismissalAssertionForReason:(id)a3;
+ (BOOL)hasDismissalAssertions;
+ (NSSet)dismissalAssertions;
+ (int64_t)cnkDeviceOrientationForUIDeviceOrientation:(int64_t)a3;
+ (int64_t)cnkSupportedDeviceOrientationsFromUIInterfaceOrientationMask:(unint64_t)a3;
+ (int64_t)uiDeviceOrientationForCNKDeviceOrientation:(int64_t)a3;
+ (void)forceClearAllDismissalAssertions;
+ (void)initialize;
+ (void)obtainDismissalAssertionForReason:(id)a3;
+ (void)releaseDismissalAssertionForReason:(id)a3;
+ (void)releaseDismissalAssertionReasons:(id)a3;
+ (void)setShouldForceDismiss;
+ (void)setShouldLockDeviceOnNextDismiss;
+ (void)setStatusBarPillSuppressionForBackgroundActivities:(id)a3 onWindowScene:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAutoAnswer;
- (BOOL)allowHomeOutDismissal;
- (BOOL)currentViewControllerIsMultiway;
- (BOOL)desiresLockAndVolumeButtonEventsForCallContainer:(id)a3;
- (BOOL)desiresLockButtonEvents;
- (BOOL)desiresLockButtonEventsForCallContainer:(id)a3;
- (BOOL)dismissalWasDemandedBeforeRemoteViewControllerWasAvailable;
- (BOOL)hasEverAppearedInWindow;
- (BOOL)isCallRinging;
- (BOOL)isContactBlockedWithCall:(id)a3;
- (BOOL)isCurrentViewControllerAudio;
- (BOOL)isDisplayStyleMiniWindow;
- (BOOL)isFirstTimeInCallHistoryWithHandleValue:(id)a3 normalizedHandleValue:(id)a4;
- (BOOL)isFullScreen;
- (BOOL)isMicIndicatorVisible;
- (BOOL)isPickedRouteReceiver;
- (BOOL)isPipped;
- (BOOL)isPresentingCallDetailsView;
- (BOOL)isPresentingContactDetails;
- (BOOL)isPresentingContactsViewController;
- (BOOL)isPresentingCoverView;
- (BOOL)isPresentingEffectsBrowser;
- (BOOL)isPresentingRemoteHostViewController;
- (BOOL)isPresentingViewControllerWithSensitiveInformation;
- (BOOL)isShowSOSConfirmationSupported;
- (BOOL)isShowing6UP;
- (BOOL)isShowingHUD;
- (BOOL)isShownAboveCoverSheet;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldConsumeDeviceLockEvent;
- (BOOL)shouldExitVideoMessageFlowConsideringShowAudioController:(BOOL)a3 showEmergencyCallController:(BOOL)a4 showSOSController:(BOOL)a5 showScreenTimeController:(BOOL)a6 showUserScoreController:(BOOL)a7 showPTTFullScreenController:(BOOL)a8;
- (BOOL)shouldHideStatusBar;
- (BOOL)shouldReleaseAudioCallViewController;
- (BOOL)shouldShowCallDetailsViewButton;
- (BOOL)shouldShowCallEndedBlockAndReportScreen:(id)a3;
- (BOOL)shouldShowInCallWindowScene;
- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (BOOL)shouldShowLargeAvatar;
- (BOOL)shouldShowNavigationBarForViewController:(id)a3;
- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (BOOL)shouldShowParticipantLabel;
- (BOOL)shouldShowSOS;
- (BOOL)shouldShowScreenTimeShield;
- (BOOL)shouldShowSingleDurationLabelInParticipantsView:(id)a3;
- (BOOL)shouldShowVideoCallBlockAndReportScreen;
- (BOOL)shouldStartMultiwayPIP;
- (BOOL)temporarilyAllowAllStatusBarPills;
- (BOOL)transitionFromBannerToDismissedIfNecessary;
- (BOOL)viewControllerSupportsEffects:(id)a3;
- (BOOL)wantsMiniWindowCoverViewController;
- (BOOL)wantsStandardControls;
- (CGSize)preferredPIPContentAspectRatio;
- (CNContact)contactForParticipantsView;
- (CNContactPickerViewController)contactsViewController;
- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory;
- (CNKCrossFadeAnimatorFactory)animatorFactory;
- (CNKFeatures)features;
- (CNKMultiwayViewControllerProtocol)multiwayViewController;
- (CNKSceneVisibilityHandler)callDetailsNavigationController;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (ICSCallManagerBridge)callManager;
- (ICSCoverViewController)coverViewController;
- (NSString)contactNameForParticipantsView;
- (NSString)disconnectCallUUID;
- (NSString)secondaryStringForParticipantsView;
- (NSTimer)callDurationTimerForParticipantsView;
- (PHAlertController)failureAlertController;
- (PHAudioCallViewController)audioCallViewController;
- (PHAudioCallViewControllerWrapper)audioCallViewControllerWrapper;
- (PHAudioRoutingMenuController)routeListController;
- (PHBottomBar)bottomControlsView;
- (PHCallParticipantsView)callParticipantLabelsView;
- (PHDeclineCallServiceProtocol)declineCallService;
- (PHDeclineWithMessageController)declineWithMessageController;
- (PHEmergencyDialerViewController)emergencyDialerViewController;
- (PHInCallRootViewController)initWithCallDisplayStyleManager:(id)a3;
- (PHInCallRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHPTTFullScreenContainerViewController)pttFullScreenContainerViewController;
- (PHPhoneRemoteHostViewController)remoteHostViewController;
- (PHSOSViewController)sosViewController;
- (PHScreenTimeHostViewController)screenTimeHostViewController;
- (PHUserFeedbackViewController)userFeedbackViewController;
- (SBSUIInCallWindowScene)inCallWindowScene;
- (SBUIRemoteAlertButtonAction)currentAlertButtonAction;
- (TUCall)alertActivationCall;
- (TUCall)callForParticipantsView;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (TUFilteredRequest)filteredRequest;
- (UIImage)audioRouteGlyphForDevice;
- (UINavigationController)audioCallNavigationController;
- (UINavigationController)videoCallNavigationController;
- (UITapGestureRecognizer)bannerTapGestureRecognizer;
- (UIView)transportIndicatorView;
- (UIViewController)currentViewController;
- (UIViewController)oldMultiwayPIPViewController;
- (double)viewController:(id)a3 rubberBandConstrained:(double)a4 inRange:(double)a5;
- (id)_remoteViewControllerProxy;
- (id)audioCallViewControllerIfLoaded;
- (id)audioRouteGlyphFor:(id)a3;
- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4;
- (id)audioRouteMenu;
- (id)backgroundActivities;
- (id)bottomControlsViewForViewController:(id)a3;
- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)callForVideoCallBasedViewController:(id)a3;
- (id)callParticipantLabelsViewForViewController:(id)a3;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)customOverrideOneToOneShutterButtonForViewController:(id)a3;
- (id)findMostRecentSilencedCallWithHandleValue:(id)a3 normalizedHandleValue:(id)a4 ignoredIdentifier:(id)a5;
- (id)getPreferredBackgroundActivitiesToSuppress:(id)a3 whenIsPipped:(BOOL)a4 whenTemporarilyAllowAllStatusBarPills:(BOOL)a5;
- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5;
- (id)linkNameForCall:(id)a3;
- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:(id)a3 delegate:(id)a4 shouldSetControlsManagerInCallDetailsDelegate:(BOOL)a5;
- (id)makeMultiwayConversationViewControllerWithCall:(id)a3 bannerPresentationManager:(id)a4;
- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)overrideStringForParticipantsView:(id)a3;
- (id)routesForAudioRoutingMenuController:(id)a3;
- (id)sosHandles;
- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (id)updateContactInformationForParticipantViewWithInCallState:(unsigned __int16)a3;
- (id)updateSecondaryStringForParticipantViewWithInCallState:(unsigned __int16)a3 allowsDuration:(BOOL)a4;
- (int64_t)alertActivationReason;
- (int64_t)bottomBarCallStateInBar:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)desiredButtonEventsForCallContainer:(id)a3;
- (unint64_t)desiredSceneButtonEventsForCallContainer:(id)a3;
- (unint64_t)numberOfParticipantsForParticipantsView:(id)a3;
- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4;
- (unsigned)inCallState;
- (void)_loadAudioCallViewController;
- (void)_loadMultiwayViewControllerForCall:(id)a3;
- (void)_loadPTTFullScreenContainerViewController;
- (void)_loadSOSViewController;
- (void)_loadUserFeedbackViewController;
- (void)_obtainThenReleaseTransitionAssertion;
- (void)_reloadSOSHandles;
- (void)_showFailureAlertForCall:(id)a3;
- (void)_showTelephonyFallbackAlertForCall:(id)a3;
- (void)_startMonitoringDisplayLayout;
- (void)_testing_finishedAnimatingIn;
- (void)_testing_viewDidAppear;
- (void)_testing_viewWillAppear;
- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4;
- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)acceptCallButtonTapped:(id)a3;
- (void)ambientSetIdleTimerDisabled:(BOOL)a3;
- (void)animateInWithCompletionBlock:(id)a3;
- (void)animateToAlert;
- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4;
- (void)autoAnswer;
- (void)bannerTapped:(id)a3;
- (void)beganRecordingVideoMessage;
- (void)bottomBarActionPerformed:(int64_t)a3 withCompletionState:(int64_t)a4 fromBar:(id)a5;
- (void)callConnectedNotification:(id)a3;
- (void)callContinuityChangedNotification:(id)a3;
- (void)callDisplayContextChanged:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)callDowngradedToAudioNotification:(id)a3;
- (void)callStateChangedNotification:(id)a3;
- (void)callUpgradedToVideoNotification:(id)a3;
- (void)cancelAutoAnswer;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)dealloc;
- (void)didChangeDeviceOrientationNotification:(id)a3;
- (void)didEnterVideoMessagingFlow;
- (void)didExitVideoMessagingFlow;
- (void)dismissContactDetailsWithCompletion:(id)a3;
- (void)dismissContactsViewController;
- (void)dismissContactsViewControllerAnimated:(BOOL)a3;
- (void)dismissContactsViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissInCallPresentationWithDismissalBlock:(id)a3;
- (void)dismissMiniWindowViewControllerAnimated:(BOOL)a3;
- (void)dismissPIPIfNeededForMiniWindowAnimated:(BOOL)a3;
- (void)dismissPhoneRemoteViewController;
- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3;
- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissSOSIfNeeded;
- (void)dismissScreenTimeAlertHostIfNeeded;
- (void)dismissViewControllersWithSensitiveInformation;
- (void)dismissViewControllersWithSensitiveInformationWithCompletion:(id)a3;
- (void)dismissalAssertionReleasedNotification:(id)a3;
- (void)dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:(id)a3;
- (void)emergencyCallbackModeChangedNotification:(id)a3;
- (void)endedRecordingVideoMessage;
- (void)forceUpdateCallControllerForFilteredRequest:(id)a3;
- (void)forceUpdateCallControllerForSOS;
- (void)handleAcceptCallButtonTapped:(id)a3;
- (void)handleActivationContextDidChangeNotification:(id)a3;
- (void)handleActivationForEndAndLock;
- (void)handleCallBufferNotification:(id)a3;
- (void)handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:(int64_t)a3;
- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4;
- (void)handleDoubleHeightStatusBarTap;
- (void)handleFrontBoardInterfaceOrientationChange:(int64_t)a3;
- (void)handleHeadsetButtonLongPressed;
- (void)handleHeadsetButtonPressed;
- (void)handleLockButtonPressed;
- (void)handlePIPInterruptionChangeNotification:(id)a3;
- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3;
- (void)handleSOSActivationIfNecessary;
- (void)handleScreenTimeActivationIfNecessary;
- (void)handleSystemInitiatedPIPInterruptionStoppedNotification:(id)a3;
- (void)handleVolumeDownButtonPressed;
- (void)handleVolumeUpButtonPressed;
- (void)hardwareButtonEventNotification:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)mostRecentlyDisconnectedAudioCallDidClearNotification:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)obtainIdleTimerAssertionWithComment:(id)a3;
- (void)participantsDidChangeLocation:(id)a3;
- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4;
- (void)performBottomBarActionType:(int64_t)a3;
- (void)phoneRemoteHostViewControllerDidDismiss;
- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3;
- (void)pipProxyActiveChangedNotification:(id)a3;
- (void)pipStashChangedNotification:(id)a3;
- (void)pipStateChangedNotification:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForDeviceLock;
- (void)prepareForDeviceLockWithCompletion:(id)a3;
- (void)prepareForDismissal;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)prepareToDismissScreenTime;
- (void)presentAsPopover:(id)a3 fromView:(id)a4 completion:(id)a5;
- (void)presentBlockAndReportAlertToBlockCall:(id)a3 forViewController:(id)a4 completion:(id)a5;
- (void)presentContactsViewControllerForView:(id)a3;
- (void)presentCreateContactViewControllerWithHandle:(id)a3 forViewController:(id)a4;
- (void)presentDisconnectionAlert:(id)a3;
- (void)presentMiniWindowViewControllerAnimated:(BOOL)a3;
- (void)presentPhoneRemoteViewControllerForView:(id)a3;
- (void)presentScreenTimeHostViewController;
- (void)presentViewControllerFullScreen:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)printUI;
- (void)pttCallStateChangedNotification:(id)a3;
- (void)pullRelayingCallsIfNecessary;
- (void)refreshBottomBarButtonLayout;
- (void)registerForNotifications;
- (void)releaseIdleTimerAssertionWithComment:(id)a3;
- (void)remoteParticipantHandlesChangedNotification:(id)a3;
- (void)removeViewController:(id)a3;
- (void)reportWithCall:(id)a3;
- (void)requestInCallDismissal;
- (void)requestInCallSceneTransitionToFullScreen;
- (void)rotatePIPForInterfaceOrientation:(int64_t)a3;
- (void)routesChangedForRouteController:(id)a3;
- (void)sceneDidConnect;
- (void)sendResponseIfNecessaryWithUnhandledEvents:(unint64_t)a3;
- (void)sendUserRating:(int)a3 dontShowPromptAgain:(BOOL)a4;
- (void)setAlertActivationCall:(id)a3;
- (void)setAlertActivationReason:(int64_t)a3;
- (void)setAllowHomeOutDismissal:(BOOL)a3;
- (void)setAnimatorFactory:(id)a3;
- (void)setAudioCallNavigationController:(id)a3;
- (void)setAudioCallViewController:(id)a3;
- (void)setAudioCallViewControllerWrapper:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3 animatedWithDuration:(double)a4;
- (void)setBottomControlsView:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallDetailsNavigationController:(id)a3;
- (void)setCallDurationTimerForParticipantsView:(id)a3;
- (void)setCallForParticipantsView:(id)a3;
- (void)setCallManager:(id)a3;
- (void)setCallParticipantLabelsView:(id)a3;
- (void)setContactForParticipantsView:(id)a3;
- (void)setContactNameForParticipantsView:(id)a3;
- (void)setContactsViewController:(id)a3;
- (void)setCoverViewController:(id)a3;
- (void)setCurrentAlertButtonAction:(id)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setDeclineCallService:(id)a3;
- (void)setDeclineWithMessageController:(id)a3;
- (void)setDisconnectCallUUID:(id)a3;
- (void)setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:(BOOL)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setEmergencyDialerViewController:(id)a3;
- (void)setFailureAlertController:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setFilteredRequest:(id)a3;
- (void)setHasEverAppearedInWindow:(BOOL)a3;
- (void)setIsPresentingCoverView:(BOOL)a3;
- (void)setMultiwayViewController:(id)a3;
- (void)setNeedsStatusBarPillSuppressionUpdate;
- (void)setOldMultiwayPIPViewController:(id)a3;
- (void)setPttFullScreenContainerViewController:(id)a3;
- (void)setRemoteHostViewController:(id)a3;
- (void)setRouteListController:(id)a3;
- (void)setScreenTimeHostViewController:(id)a3;
- (void)setSecondaryStringForParticipantsView:(id)a3;
- (void)setShouldHideStatusBar:(BOOL)a3;
- (void)setSosViewController:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4;
- (void)setTemporarilyAllowAllStatusBarPills:(BOOL)a3;
- (void)setTransportIndicatorView:(id)a3;
- (void)setUserFeedbackViewController:(id)a3;
- (void)setVideoCallNavigationController:(id)a3;
- (void)setupAutoAnswer;
- (void)showCallDetailsView;
- (void)showFailureOrFallbackAlertIfNecessaryForCall:(id)a3;
- (void)showHideMiniWindowViewIfNeededAnimated:(BOOL)a3;
- (void)showKeypadIfPossible;
- (void)startObservingAcceptCallButtonTappedWithNotificationCenter:(id)a3;
- (void)statusBarTappedInFullScreen;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionIntoPiP;
- (void)transitionToVideoCallBasedViewController:(id)a3;
- (void)transitionToVideoCallBasedViewController:(id)a3 shouldUpdatePipSize:(BOOL)a4;
- (void)unansweredCallUIDismissed;
- (void)undimScreenIfNecessary:(id)a3;
- (void)updateAlertActivationReason;
- (void)updateAlertActivationReasonForCall:(id)a3;
- (void)updateBackgroundStartPipAuthorizationState;
- (void)updateBannerTapGestureRecognizerForCallDisplayStyle:(int64_t)a3;
- (void)updateBottomControlsViewWithInCallState:(unsigned __int16)a3;
- (void)updateCallControllerForCurrentState;
- (void)updateCallDetailsViewIsOnScreen;
- (void)updateCallForUserFeedback;
- (void)updateCallParticipantLabelsViewForViewController:(id)a3;
- (void)updateDesiredSpringboardBehavior;
- (void)updateInCallWindowSceneFaceTimeLaunchBehavior;
- (void)updateInCallWindowScenePrefersHiddenWhenDismissed;
- (void)updateMultiwayDeviceOrientation:(int64_t)a3;
- (void)updateMultiwayViewControllerUIState;
- (void)updateRemoteAlertSwipeDismissalStyleForCall:(id)a3;
- (void)updateShouldBecomeVisibleWhenWakingDisplay;
- (void)updateTransportIndicatorView;
- (void)updateUPlusOneVideoCallViews;
- (void)updateVideoState;
- (void)videoCallStateChangedNotification:(id)a3;
- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5;
- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4;
- (void)viewController:(id)a3 localParticipantAspectRatioChanged:(CGSize)a4;
- (void)viewController:(id)a3 mediaPipSafeAreaFrameChanged:(CGRect)a4;
- (void)viewController:(id)a3 pipSourceProviderNeedsUpdate:(id)a4;
- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4;
- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)wantsDismissal;
- (void)wantsHoldMusicChangedNotification:(id)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotate:(id)a3;
- (void)willTransitionToFullScreenNotification:(id)a3;
@end

@implementation PHInCallRootViewController

- (void)_testing_viewWillAppear
{
  if (([UIApp isRunningTest:@"PlaceOutgoingCall"] & 1) != 0
    || [UIApp isRunningTest:@"FaceTimePlaceOutgoingCall"])
  {
    [UIApp finishedSubTest:@"sbRemoteAlert" forTest:qword_10032CBD0];
    [UIApp startedSubTest:@"viewControllerSetup" forTest:qword_10032CBD0];
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10032CBD0;
    [v2 startedSubTest:@"animation" forTest:v3];
  }
}

- (void)_testing_viewDidAppear
{
  if (([UIApp isRunningTest:@"PlaceOutgoingCall"] & 1) != 0
    || [UIApp isRunningTest:@"FaceTimePlaceOutgoingCall"])
  {
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10032CBD0;
    [v2 finishedSubTest:@"viewControllerSetup" forTest:v3];
  }
}

- (void)_testing_finishedAnimatingIn
{
  if (([UIApp isRunningTest:@"PlaceOutgoingCall"] & 1) != 0
    || [UIApp isRunningTest:@"FaceTimePlaceOutgoingCall"])
  {
    [UIApp finishedSubTest:@"animation" forTest:qword_10032CBD0];
    v2 = (void *)UIApp;
    uint64_t v3 = qword_10032CBD0;
    [v2 finishedSubTest:@"end-to-end" forTest:v3];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v3 = (void *)qword_100326250;
    qword_100326250 = (uint64_t)v2;
  }
}

+ (void)setShouldLockDeviceOnNextDismiss
{
  byte_100326258 = 1;
}

+ (void)setShouldForceDismiss
{
  byte_100326259 = 1;
}

+ (void)setStatusBarPillSuppressionForBackgroundActivities:(id)a3 onWindowScene:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (v6)
  {
    v8 = [v6 preferredBackgroundActivitiesToSuppress];
    unsigned __int8 v9 = [v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      [v6 setPreferredBackgroundActivitiesToSuppress:v7];
    }
  }
  else
  {
    v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] No WindowScene, so not setting any preferred status bar pill suppressions", v11, 2u);
    }
  }
}

- (void)setCurrentAlertButtonAction:(id)a3
{
  v4 = (SBUIRemoteAlertButtonAction *)a3;
  currentAlertButtonAction = self->_currentAlertButtonAction;
  if (currentAlertButtonAction) {
    [(SBUIRemoteAlertButtonAction *)currentAlertButtonAction sendResponseWithUnHandledEvents:0];
  }
  id v6 = self->_currentAlertButtonAction;
  self->_currentAlertButtonAction = v4;
}

- (void)forceUpdateCallControllerForSOS
{
  if (+[PHSOSViewController isSOSDismissalAssertionActive])
  {
    [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
    byte_100326258 = 0;
  }
}

- (void)sendResponseIfNecessaryWithUnhandledEvents:(unint64_t)a3
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PHInCallRootViewController *)self currentAlertButtonAction];
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending Response on currentAlertButtonAction: %@ with SBUIRemoteAlertServiceButtonEvents: %ld", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [(PHInCallRootViewController *)self currentAlertButtonAction];

  if (v7)
  {
    v8 = [(PHInCallRootViewController *)self currentAlertButtonAction];
    [v8 sendResponseWithUnHandledEvents:a3];

    currentAlertButtonAction = self->_currentAlertButtonAction;
    self->_currentAlertButtonAction = 0;
  }
}

- (PHInCallRootViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PHInCallRootViewController;
  id v6 = [(PHInCallRootViewController *)&v27 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    uint64_t v8 = objc_opt_new();
    labelDescriptorFactory = v7->_labelDescriptorFactory;
    v7->_labelDescriptorFactory = (CNKCallParticipantLabelDescriptorFactory *)v8;

    uint64_t v10 = +[CNKFeatures sharedInstance];
    features = v7->_features;
    v7->_features = (CNKFeatures *)v10;

    uint64_t v12 = +[TUCallCenter sharedInstance];
    callCenter = v7->_callCenter;
    v7->_callCenter = (TUCallCenter *)v12;

    v14 = objc_opt_new();
    uint64_t v15 = [v14 makeWithCallCenter:v7->_callCenter];
    declineCallService = v7->_declineCallService;
    v7->_declineCallService = (PHDeclineCallServiceProtocol *)v15;

    v17 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"bannerTapped:"];
    bannerTapGestureRecognizer = v7->_bannerTapGestureRecognizer;
    v7->_bannerTapGestureRecognizer = v17;

    [(UITapGestureRecognizer *)v7->_bannerTapGestureRecognizer setNumberOfTapsRequired:1];
    v19 = [(PHInCallRootViewController *)v7 features];
    unsigned int v20 = [v19 callManagerEnabled];

    if (v20)
    {
      v21 = [ICSCallManagerBridge alloc];
      callDisplayStyleManager = v7->_callDisplayStyleManager;
      id v23 = objc_alloc_init((Class)TUFeatureFlags);
      v24 = [(ICSCallManagerBridge *)v21 initWithRootController:v7 callDisplayStyleManager:callDisplayStyleManager flags:v23];
      callManager = v7->_callManager;
      v7->_callManager = v24;
    }
    -[PHInCallRootViewController updateBannerTapGestureRecognizerForCallDisplayStyle:](v7, "updateBannerTapGestureRecognizerForCallDisplayStyle:", [v5 callDisplayStyle]);
  }

  return v7;
}

- (PHInCallRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)PHInCallRootViewController;
  v4 = [(PHInCallRootViewController *)&v20 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    labelDescriptorFactory = v4->_labelDescriptorFactory;
    v4->_labelDescriptorFactory = (CNKCallParticipantLabelDescriptorFactory *)v5;

    uint64_t v7 = objc_opt_new();
    animatorFactory = v4->_animatorFactory;
    v4->_animatorFactory = (CNKCrossFadeAnimatorFactory *)v7;

    unsigned __int8 v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v10 = +[CNKFeatures sharedInstance];
    features = v4->_features;
    v4->_features = (CNKFeatures *)v10;

    uint64_t v12 = +[TUCallCenter sharedInstance];
    callCenter = v4->_callCenter;
    v4->_callCenter = (TUCallCenter *)v12;

    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHInitialPresentationAssertionReason"];
    [(PHInCallRootViewController *)v4 registerForNotifications];
    id v14 = +[PHInCallUtilities sharedInstance];
    uint64_t v15 = +[CUTWiFiManager sharedInstance];
    [v15 setAutoAssociateWiFiAsForegroundClient:1];

    v16 = +[CNKFeatures sharedInstance];
    unsigned __int8 v17 = [v16 isEnhancedEmergencyEnabled];

    if ((v17 & 1) == 0)
    {
      v18 = +[PHSOSDisconnectionConfirmation sharedInstance];
      [v18 addDelegate:v4];
    }
  }
  return v4;
}

- (void)registerForNotifications
{
  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self];
  [v13 addObserver:self selector:"dismissalAssertionReleasedNotification:" name:@"PHDismissalAssertionReleasedNotification" object:0];
  [v13 addObserver:self selector:"callStateChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v13 addObserver:self selector:"videoCallStateChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
  [v13 addObserver:self selector:"callUpgradedToVideoNotification:" name:TUCallUpgradedToVideoNotification object:0];
  [v13 addObserver:self selector:"callConnectedNotification:" name:TUCallCenterCallConnectedNotification object:0];
  [v13 addObserver:self selector:"callDisplayContextChanged:" name:TUCallDisplayContextChangedNotification object:0];
  [v13 addObserver:self selector:"callViewControllerStateChangedNotification:" name:@"PHCallViewControllerStateChangedNotification" object:0];
  uint64_t v3 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"pipStateChangedNotification:" name:@"PHPIPControllerStateDidChangeNotification" object:v3];

  v4 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"pipStashChangedNotification:" name:@"PHPIPControllerStashChangeNotification" object:v4];

  uint64_t v5 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"pipProxyActiveChangedNotification:" name:@"PHPIPControllerPIPProxyActiveDidChangeNotification" object:v5];

  id v6 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"pipControllerDidRequestReturnToFullScreenNotification:" name:@"PHPIPControllerDidRequestReturnToFullScreenNotification" object:v6];

  uint64_t v7 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"handleSystemInitiatedPIPInterruptionStoppedNotification:" name:@"PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification" object:v7];

  uint64_t v8 = +[PHPIPController defaultPIPController];
  [v13 addObserver:self selector:"handlePIPInterruptionChangeNotification:" name:@"PHPIPControllerInterruptionChangeNotification" object:v8];

  [v13 addObserver:self selector:"emergencyCallbackModeChangedNotification:" name:TUCallCapabilitiesEmergencyCallbackModeChangedNotification object:0];
  [v13 addObserver:self selector:"callContinuityChangedNotification:" name:TUCallCenterCallContinuityStateChangedNotification object:0];
  [v13 addObserver:self selector:"mostRecentlyDisconnectedAudioCallDidClearNotification:" name:@"ICSApplicationDelegateMostRecentlyDisconnectedAudioCallDidClearNotification" object:0];
  [v13 addObserver:self selector:"didChangeDeviceOrientationNotification:" name:@"PHInCallOrientationEventNotification" object:0];
  [v13 addObserver:self selector:"callDowngradedToAudioNotification:" name:TUCallDowngradedToAudioNotification object:0];
  [v13 addObserver:self selector:"handleDoubleHeightStatusBarTap" name:@"ICSStatusBarTappedNotification" object:0];
  [v13 addObserver:self selector:"statusBarTappedInFullScreen" name:@"ICSStatusBarTapInFullScreenNotification" object:0];
  [v13 addObserver:self selector:"handleActivationContextDidChangeNotification:" name:@"ICSActivationContextDidChangeNotification" object:0];
  [v13 addObserver:self selector:"wantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];
  [v13 addObserver:self selector:"hardwareButtonEventNotification:" name:@"PHHardwareButtonEventNotification" object:0];
  [v13 addObserver:self selector:"willTransitionToFullScreenNotification:" name:@"ICSSceneManagerDidRequesFullScreenTransitionNotification" object:0];
  [v13 addObserver:self selector:"remoteParticipantHandlesChangedNotification:" name:TUCallRemoteParticipantHandlesChangedNotification object:0];
  [v13 addObserver:self selector:"handleCallBufferNotification:" name:@"PHCallBufferNotification" object:0];
  [(PHInCallRootViewController *)self startObservingAcceptCallButtonTappedWithNotificationCenter:v13];
  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker](PHUIConfiguration, "shouldUseFullScreenPeoplePicker"))[v13 addObserver:self selector:"willRotate:" name:UIWindowWillRotateNotification object:0]; {
  [v13 addObserver:self selector:"pttCallStateChangedNotification:" name:TUBargeCallStatusChangedNotification object:0];
  }
  unsigned __int8 v9 = [(PHInCallRootViewController *)self callCenter];
  uint64_t v10 = [v9 routeController];
  [v10 addDelegate:self];

  v11 = [(PHInCallRootViewController *)self callCenter];
  uint64_t v12 = [v11 conversationManager];
  [v12 addDelegate:self queue:&_dispatch_main_q];
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_willAppearInRemoteViewController", buf, 2u);
  }

  id v6 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v6 setWallpaperTunnelActive:1];

  [v4 setBackgroundStyle:4 withDuration:0.1];
  [v4 setDismissalAnimationStyle:1];
  [v4 setShouldDismissOnUILock:1];
  [v4 setShouldDisableFadeInAnimation:0];

  [(PHInCallRootViewController *)self updateDesiredSpringboardBehavior];
  if ([(PHInCallRootViewController *)self dismissalWasDemandedBeforeRemoteViewControllerWasAvailable])
  {
    uint64_t v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "InCallRootViewController tried to dismiss before the proxy was available. The proxy is now available, so we will dismiss immediately.", v8, 2u);
    }

    [(PHInCallRootViewController *)self requestInCallDismissal];
  }
}

- (void)dealloc
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }

  id v4 = +[CNKFeatures sharedInstance];
  unsigned __int8 v5 = [v4 isEnhancedEmergencyEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = +[PHSOSDisconnectionConfirmation sharedInstance];
    [v6 removeDelegate:self];
  }
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"dealloc"];
  [(PHInCallRootViewController *)self setStatusBarHidden:0 withDuration:0.0];
  uint64_t v8 = [(PHInCallRootViewController *)self remoteHostViewController];
  unsigned __int8 v9 = [v8 remoteViewController];
  [v9 setDelegate:0];

  [(PHInCallRootViewController *)self setRemoteHostViewController:0];
  [(PHInCallRootViewController *)self setContactsViewController:0];
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;

  v11.receiver = self;
  v11.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v11 dealloc];
}

- (TUFeatureFlags)featureFlags
{
  id v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 featureFlags];
  }
  else
  {
    id v4 = 0;
  }

  return (TUFeatureFlags *)v4;
}

- (id)sosHandles
{
  id v2 = sub_10000FA34(@"SOSCallingUsesTestNumber");
  uint64_t v3 = sub_10000FA34(@"SOSCallingUsesTestDisambiguation");
  id v4 = sub_10000FA34(@"SOSCustomEmergencyTestNumber");
  if (([v3 BOOLValue] & 1) != 0
    || ([v2 BOOLValue] & 1) != 0
    || [v4 length])
  {
    unsigned __int8 v5 = &_ss4Int8VN_ptr;
    if ([v4 length])
    {
      id v6 = +[TUHandle normalizedPhoneNumberHandleForValue:v4 isoCountryCode:0];
      if (v6) {
        goto LABEL_7;
      }
    }
    else
    {
      v31 = v4;
      id v14 = +[ICSApplicationServices sharedInstance];
      uint64_t v15 = [v14 callProviderManager];

      v16 = [v15 emergencyProvider];
      id v17 = objc_alloc_init((Class)TUSenderIdentityClient);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v18 = [v16 prioritizedSenderIdentities];
      id v19 = [v18 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v19)
      {
        id v20 = v19;
        v28 = v16;
        v29 = v15;
        v30 = v2;
        id v21 = 0;
        uint64_t v22 = *(void *)v34;
LABEL_15:
        id v23 = 0;
        v24 = v21;
        while (1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v18);
          }
          v25 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v23) accountUUID];
          id v32 = v24;
          id v6 = [v17 testEmergencyHandleForAccountUUID:v25 error:&v32];
          id v21 = v32;

          if (v6) {
            break;
          }
          id v23 = (char *)v23 + 1;
          v24 = v21;
          if (v20 == v23)
          {
            id v20 = [v18 countByEnumeratingWithState:&v33 objects:v43 count:16];
            if (v20) {
              goto LABEL_15;
            }
            id v6 = 0;
            break;
          }
        }

        uint64_t v15 = v29;
        id v2 = v30;
        unsigned __int8 v5 = &_ss4Int8VN_ptr;
        v16 = v28;
      }
      else
      {
        id v6 = 0;
      }

      id v4 = v31;
      if (v6) {
        goto LABEL_7;
      }
    }
    id v6 = [v5[365] normalizedPhoneNumberHandleForValue:@"822" isoCountryCode:0];
LABEL_7:
    unsigned int v7 = [v3 BOOLValue];
    id v8 = [objc_alloc((Class)TULabeledHandle) initWithHandle:v6 label:@"EMERGENCY_DISAMBIGUATION_AMBULANCE" isSuggested:0];
    unsigned __int8 v9 = v8;
    if (v7)
    {
      v42[0] = v8;
      id v10 = [objc_alloc((Class)TULabeledHandle) initWithHandle:v6 label:@"EMERGENCY_DISAMBIGUATION_FIRE" isSuggested:0];
      v42[1] = v10;
      id v11 = [objc_alloc((Class)TULabeledHandle) initWithHandle:v6 label:@"EMERGENCY_DISAMBIGUATION_POLICE" isSuggested:0];
      v42[2] = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:v42 count:3];
    }
    else
    {
      id v41 = v8;
      uint64_t v12 = +[NSArray arrayWithObjects:&v41 count:1];
    }
    goto LABEL_10;
  }
  v26 = +[ICSApplicationServices sharedInstance];
  id v6 = [v26 callProviderManager];

  unsigned __int8 v9 = [v6 emergencyProvider];
  uint64_t v12 = [v9 emergencyLabeledHandles];
  objc_super v27 = sub_1000D5130();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    __int16 v39 = 2112;
    v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SOS Numbers: Emergency call provider is %@ with numbers %@", buf, 0x16u);
  }

LABEL_10:

  return v12;
}

- (void)_reloadSOSHandles
{
  sosViewController = self->_sosViewController;
  id v3 = [(PHInCallRootViewController *)self sosHandles];
  [(PHSOSViewController *)sosViewController updateSOSHandles:v3];
}

- (void)_loadSOSViewController
{
  if (!self->_sosViewController)
  {
    id v3 = [PHSOSViewController alloc];
    id v6 = [(PHInCallRootViewController *)self sosHandles];
    id v4 = [(PHSOSViewController *)v3 initWithSOSHandles:v6];
    sosViewController = self->_sosViewController;
    self->_sosViewController = v4;
  }
}

- (PHSOSViewController)sosViewController
{
  [(PHInCallRootViewController *)self _loadSOSViewController];
  sosViewController = self->_sosViewController;

  return sosViewController;
}

- (UINavigationController)videoCallNavigationController
{
  videoCallNavigationController = self->_videoCallNavigationController;
  if (!videoCallNavigationController)
  {
    id v4 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    unsigned __int8 v5 = self->_videoCallNavigationController;
    self->_videoCallNavigationController = v4;

    id v6 = [(PHInCallRootViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [(UINavigationController *)self->_videoCallNavigationController view];
    [v15 setFrame:v8, v10, v12, v14];

    v16 = [(UINavigationController *)self->_videoCallNavigationController view];
    [v16 setAutoresizingMask:18];

    [(UINavigationController *)self->_videoCallNavigationController setNavigationBarHidden:1];
    [(UINavigationController *)self->_videoCallNavigationController setDelegate:self];
    videoCallNavigationController = self->_videoCallNavigationController;
  }

  return videoCallNavigationController;
}

- (void)presentCreateContactViewControllerWithHandle:(id)a3 forViewController:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = a4;
      double v7 = [a3 value];
      double v12 = v7;
      double v8 = +[NSArray arrayWithObjects:&v12 count:1];
      double v9 = +[CNContact contactWithDisplayName:0 handleStrings:v8];

      double v10 = +[CNContactViewController viewControllerForNewContact:v9];
      [v10 setDelegate:self];
      [v10 setAllowsEditing:1];
      [v10 setAllowsActions:1];
      id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
      [v6 presentViewController:v11 animated:1 completion:0];
    }
  }
}

- (void)_loadAudioCallViewController
{
  id v3 = [(PHInCallRootViewController *)self features];
  unsigned int v4 = [v3 callManagerEnabled];

  if (v4)
  {
    unsigned __int8 v5 = [(PHInCallRootViewController *)self callManager];
    [v5 createAudioCallViewController];
LABEL_10:

    goto LABEL_11;
  }
  if (!self->_audioCallViewController)
  {
    id v6 = [PHAudioCallViewController alloc];
    double v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    double v8 = [(PHInCallRootViewController *)self callCenter];
    double v9 = [(PHInCallRootViewController *)self featureFlags];
    double v10 = [(PHAudioCallViewController *)v6 initWithCallDisplayStyleManager:v7 callCenter:v8 featureFlags:v9];
    audioCallViewController = self->_audioCallViewController;
    self->_audioCallViewController = v10;

    double v12 = sub_1000D5130();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = self->_audioCallViewController;
      *(_DWORD *)buf = 138412290;
      v50 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController loaded a new audio call view controller: %@", buf, 0xCu);
    }

    [(PHCallViewController *)self->_audioCallViewController setInCallRootViewController:self];
    double v14 = [(PHInCallRootViewController *)self featureFlags];
    unsigned int v15 = [v14 audioCallUIModernizationEnabled];

    if (v15)
    {
      v16 = [PHAudioCallViewControllerWrapper alloc];
      id v17 = [(PHInCallRootViewController *)self callDisplayStyleManager];
      v18 = [(PHInCallRootViewController *)self callCenter];
      id v19 = [(PHInCallRootViewController *)self view];
      [v19 bounds];
      id v21 = [(PHAudioCallViewControllerWrapper *)v16 initWithCallDisplayStyleManager:v17 callCenter:v18 width:self inCallRootViewController:v20];
      audioCallViewControllerWrapper = self->_audioCallViewControllerWrapper;
      self->_audioCallViewControllerWrapper = v21;

      id v23 = objc_alloc((Class)UINavigationController);
      v24 = [(PHInCallRootViewController *)self audioCallViewControllerWrapper];
      v25 = [v24 viewController];
      v26 = (UINavigationController *)[v23 initWithRootViewController:v25];
      audioCallNavigationController = self->_audioCallNavigationController;
      self->_audioCallNavigationController = v26;
    }
    else
    {
      id v28 = objc_alloc((Class)UINavigationController);
      v24 = [(PHInCallRootViewController *)self audioCallViewController];
      v29 = (UINavigationController *)[v28 initWithRootViewController:v24];
      v25 = self->_audioCallNavigationController;
      self->_audioCallNavigationController = v29;
    }

    [(UINavigationController *)self->_audioCallNavigationController setOverrideUserInterfaceStyle:2];
    v30 = [(PHInCallRootViewController *)self view];
    [v30 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    __int16 v39 = [(UINavigationController *)self->_audioCallNavigationController view];
    [v39 setFrame:v32, v34, v36, v38];

    v40 = [(UINavigationController *)self->_audioCallNavigationController view];
    [v40 setAutoresizingMask:18];

    [(UINavigationController *)self->_audioCallNavigationController setNavigationBarHidden:1];
    [(UINavigationController *)self->_audioCallNavigationController setDelegate:self];
    [(UINavigationController *)self->_audioCallNavigationController _setBuiltinTransitionStyle:1];
    unsigned __int8 v5 = [(UINavigationController *)self->_audioCallNavigationController navigationBar];
    id v41 = +[UIColor clearColor];
    [v5 setBackgroundColor:v41];

    [v5 setTranslucent:1];
    v42 = objc_opt_new();
    [v5 setBackgroundImage:v42 forBarMetrics:0];

    v43 = objc_opt_new();
    [v5 setShadowImage:v43];

    v44 = +[UIColor whiteColor];
    [v5 setTintColor:v44];

    v45 = +[UIColor whiteColor];
    v48 = v45;
    v46 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    [v5 setTitleTextAttributes:v46];

    goto LABEL_10;
  }
LABEL_11:
  [(PHInCallRootViewController *)self _startMonitoringDisplayLayout];
}

- (void)presentViewControllerFullScreen:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self currentViewController];
  [(PHInCallRootViewController *)self _transitionFromViewController:v5 toViewController:v4];
}

- (void)_loadPTTFullScreenContainerViewController
{
  if (!self->_pttFullScreenContainerViewController)
  {
    id v3 = [PHPTTFullScreenContainerViewController alloc];
    id v8 = +[UIApplication sharedApplication];
    id v4 = [v8 delegate];
    id v5 = [v4 bannerPresentationManager];
    id v6 = [(PHPTTFullScreenContainerViewController *)v3 initWithBannerPresentationManager:v5];
    pttFullScreenContainerViewController = self->_pttFullScreenContainerViewController;
    self->_pttFullScreenContainerViewController = v6;
  }
}

- (void)pttCallStateChangedNotification:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pttCallStateChangedNotification", buf, 2u);
  }

  id v5 = [v3 object];

  if ([v5 isPTT] && objc_msgSend(v5, "status") - 5 <= 1)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Releasing PTT call details dismissal assertion.", v9, 2u);
    }

    double v7 = +[UIApplication sharedApplication];
    id v8 = [v7 delegate];
    [v8 setDidDeepLinkToPTTCallDetailsView:0];

    +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
  }
}

- (void)_loadMultiwayViewControllerForCall:(id)a3
{
  id v4 = (CNKMultiwayViewControllerProtocol *)a3;
  id v5 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController call];
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    double v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Creating a CNKFaceTimeMultiwayConversationViewController instance for call: %@", (uint8_t *)&v23, 0x16u);
    }

    id v8 = +[UIApplication sharedApplication];
    double v9 = [v8 delegate];
    double v10 = [v9 bannerPresentationManager];
    id v11 = [(PHInCallRootViewController *)self makeMultiwayConversationViewControllerWithCall:v4 bannerPresentationManager:v10];
    multiwayViewController = self->_multiwayViewController;
    self->_multiwayViewController = v11;

    double v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = self->_multiwayViewController;
      int v23 = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Created a CNKFaceTimeMultiwayConversationViewController instance %@", (uint8_t *)&v23, 0x16u);
    }

    [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController setDelegate:self];
    [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController setIOSDelegate:self];
    if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTime])
    {
      unsigned int v15 = self->_multiwayViewController;
      uint64_t v16 = 2;
    }
    else
    {
      id v17 = [(PHInCallRootViewController *)self callDisplayStyleManager];
      id v18 = [v17 callDisplayStyle];

      unsigned int v15 = self->_multiwayViewController;
      uint64_t v16 = v18 == (id)3;
    }
    [(CNKMultiwayViewControllerProtocol *)v15 setSupportedDeviceOrientations:v16];
    id v19 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    -[CNKMultiwayViewControllerProtocol setIsDisplayedInBanner:](self->_multiwayViewController, "setIsDisplayedInBanner:", [v19 callDisplayStyle] == 0);

    double v20 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    -[CNKMultiwayViewControllerProtocol setIsAmbient:](self->_multiwayViewController, "setIsAmbient:", [v20 callDisplayStyle] == (id)3);

    id v21 = +[PHPIPController defaultPIPController];
    -[CNKMultiwayViewControllerProtocol setPipState:](self->_multiwayViewController, "setPipState:", [v21 pipState]);

    uint64_t v22 = +[PHInCallOrientationMonitor sharedInstance];
    -[PHInCallRootViewController updateMultiwayDeviceOrientation:](self, "updateMultiwayDeviceOrientation:", [v22 lastValidOrientation]);

    [(PHInCallRootViewController *)self _startMonitoringDisplayLayout];
  }
}

- (void)_startMonitoringDisplayLayout
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_startMonitoringDisplayLayout", (uint8_t *)buf, 2u);
  }

  id v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v4 setNeedsUserInteractivePriority:1];
  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B2EF4;
  v8[3] = &unk_1002CFE68;
  objc_copyWeak(&v9, buf);
  [v4 setTransitionHandler:v8];
  displayLayoutMonitor = self->_displayLayoutMonitor;
  if (displayLayoutMonitor) {
    [(FBSDisplayLayoutMonitor *)displayLayoutMonitor invalidate];
  }
  unsigned __int8 v6 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v4];
  double v7 = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)handleFrontBoardInterfaceOrientationChange:(int64_t)a3
{
  id v5 = [(PHInCallRootViewController *)self multiwayViewController];
  id v6 = [v5 frontBoardInterfaceOrientation];

  if (a3)
  {
    if (v6 != (id)a3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B35AC;
      block[3] = &unk_1002CF060;
      block[4] = self;
      block[5] = a3;
      block[6] = a3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)rotatePIPForInterfaceOrientation:(int64_t)a3
{
  id v5 = +[PHPIPController defaultPIPController];
  id v6 = [v5 pipState];

  if (v6 == (id)2)
  {
    double v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rotating PIP due to interface orientation change %ld", buf, 0xCu);
    }

    int64_t v8 = +[PHInCallUIUtilities deviceOrientationForBSInterfaceOrientation:a3];
    id v9 = +[PHPIPController defaultPIPController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B37C4;
    v10[3] = &unk_1002CD518;
    v10[4] = self;
    [v9 rotatePIPDeviceOrientationTo:v8 withCompletion:v10];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    [(PHInCallRootViewController *)self shouldShowNavigationBarForViewController:v8];
    double v13 = NSStringFromBOOL();
    int v14 = 138412546;
    unsigned int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TTYC: , viewController: %@ setHidden: %@", (uint8_t *)&v14, 0x16u);
  }
  [v9 setNavigationBarHidden:[self shouldShowNavigationBarForViewController:v8] animated:v5];
}

- (BOOL)shouldShowNavigationBarForViewController:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_100326260;
  if (!qword_100326260)
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    id v6 = (void *)qword_100326260;
    qword_100326260 = (uint64_t)v5;

    id v7 = sub_10010C700();
    if (v7) {
      [(id)qword_100326260 addObject:v7];
    }
    [(id)qword_100326260 addObject:objc_opt_class()];
    id v4 = (void *)qword_100326260;
  }
  unsigned __int8 v8 = [v4 containsObject:objc_opt_class()];

  return v8;
}

- (PHAudioCallViewController)audioCallViewController
{
  [(PHInCallRootViewController *)self _loadAudioCallViewController];
  id v3 = [(PHInCallRootViewController *)self features];
  unsigned int v4 = [v3 callManagerEnabled];

  if (v4)
  {
    id v5 = [(PHInCallRootViewController *)self callManager];
    id v6 = [v5 audioCallViewController];
  }
  else
  {
    id v6 = self->_audioCallViewController;
  }

  return v6;
}

- (id)audioCallViewControllerIfLoaded
{
  audioCallViewController = self->_audioCallViewController;
  if (audioCallViewController)
  {
    id v3 = audioCallViewController;
  }
  else
  {
    unsigned int v4 = [(PHInCallRootViewController *)self callManager];
    id v3 = [v4 audioCallViewController];
  }

  return v3;
}

- (UINavigationController)audioCallNavigationController
{
  id v3 = [(PHInCallRootViewController *)self features];
  unsigned int v4 = [v3 callManagerEnabled];

  if (v4)
  {
    id v5 = [(PHInCallRootViewController *)self callManager];
    id v6 = [v5 audioCallNavController];
  }
  else
  {
    id v6 = self->_audioCallNavigationController;
  }

  return v6;
}

- (void)callStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callStateChangedNotification", v7, 2u);
  }

  id v6 = [v4 object];

  [(PHInCallRootViewController *)self updateAlertActivationReasonForCall:v6];
  [(PHInCallRootViewController *)self updateRemoteAlertSwipeDismissalStyleForCall:v6];
  [(PHInCallRootViewController *)self prepareToDismissScreenTime];
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
  [(PHInCallRootViewController *)self dismissPhoneRemoteViewController];
  [(PHInCallRootViewController *)self dismissContactsViewController];
  [(PHInCallRootViewController *)self updateTransportIndicatorView];
  [(PHInCallRootViewController *)self undimScreenIfNecessary:v6];
}

- (void)callDisplayContextChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callDisplayContextChanged", v8, 2u);
  }

  id v6 = [v4 object];

  id v7 = [(PHInCallRootViewController *)self callManager];
  [v7 updateWithCall:v6];
}

- (void)videoCallStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "videoCallStateChangedNotification", v7, 2u);
  }

  id v6 = [v4 object];

  [(PHInCallRootViewController *)self updateCallForUserFeedback];
  [(PHInCallRootViewController *)self updateAlertActivationReasonForCall:v6];
  [(PHInCallRootViewController *)self showFailureOrFallbackAlertIfNecessaryForCall:v6];
  [(PHInCallRootViewController *)self prepareToDismissScreenTime];
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
  [(PHInCallRootViewController *)self dismissPhoneRemoteViewController];
  [(PHInCallRootViewController *)self dismissContactsViewController];
  [(PHInCallRootViewController *)self updateTransportIndicatorView];
  [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
  [(PHInCallRootViewController *)self undimScreenIfNecessary:v6];
}

- (void)callConnectedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "callConnectedNotification", v5, 2u);
  }

  [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
  [(PHInCallRootViewController *)self transitionFromBannerToDismissedIfNecessary];
  [(PHInCallRootViewController *)self updateBackgroundStartPipAuthorizationState];
}

- (void)willTransitionToFullScreenNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "willTransitionToFullScreenNotification", v11, 2u);
  }

  id v6 = +[UIApplication sharedApplication];
  id v7 = [v6 delegate];
  unsigned __int8 v8 = [v7 isPresentingFullScreenCallUI];

  if ((v8 & 1) == 0)
  {
    id v9 = [v4 object];
    unsigned int v10 = [v9 isEqual:&off_1002DEF10];

    if (v10) {
      [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
    }
  }
}

- (void)remoteParticipantHandlesChangedNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueProxyIdentifier];
    int v7 = 138412290;
    unsigned __int8 v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remoteParticipantHandlesChangedNotification for call: %@", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 isConversation]) {
    [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  }
}

- (void)undimScreenIfNecessary:(id)a3
{
  if ([a3 status] == 4)
  {
    id v9 = [(PHInCallRootViewController *)self traitCollection];
    if ([v9 _backlightLuminance] == (id)1)
    {
      id v4 = +[UIApplication sharedApplication];
      id v5 = [v4 delegate];
      id v6 = [v5 currentInCallScene];
      id v7 = [v6 presentationMode];

      if (v7 == (id)2)
      {
        unsigned __int8 v8 = sub_1000D5130();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Undim screen", buf, 2u);
        }

        SBSUndimScreen();
      }
    }
    else
    {
    }
  }
}

- (BOOL)transitionFromBannerToDismissedIfNecessary
{
  id v3 = [(PHInCallRootViewController *)self featureFlags];
  unsigned int v4 = [v3 expanseEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(PHInCallRootViewController *)self callCenter];
  id v6 = [v5 frontmostAudioOrVideoCall];

  id v7 = [(PHInCallRootViewController *)self callCenter];
  unsigned __int8 v8 = [v7 activeConversationForCall:v6];

  id v9 = [v6 provider];
  unsigned int v10 = [v9 isFaceTimeProvider];

  if (v10)
  {
    id v11 = [(PHInCallRootViewController *)self inCallWindowScene];

    id v12 = +[UIApplication sharedApplication];
    double v13 = [v12 delegate];
    int v14 = [v13 currentInCallScene];
    id v15 = [v14 presentationMode];

    if ([v8 resolvedAudioVideoMode] == (id)1 && objc_msgSend(v6, "status") == 1) {
      unsigned __int8 v16 = [v6 wantsHoldMusic];
    }
    else {
      unsigned __int8 v16 = 1;
    }
    id v18 = [(PHInCallRootViewController *)self callCenter];
    id v19 = [v18 currentAudioAndVideoCallCount];

    BOOL v17 = 0;
    if (v19 == (id)1 && (v16 & 1) == 0 && v11 && v15 == (id)1)
    {
      id v21 = v6;
      TUDispatchMainIfNecessary();

      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)callUpgradedToVideoNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callUpgradedToVideoNotification", v6, 2u);
  }

  [(PHInCallRootViewController *)self videoCallStateChangedNotification:v4];
}

- (void)updateCallForUserFeedback
{
  id v3 = [(PHInCallRootViewController *)self featureFlags];
  unsigned int v4 = [v3 FTUserScore];

  if (v4)
  {
    id v5 = [(PHInCallRootViewController *)self callCenter];
    id v6 = [v5 currentVideoCall];

    if ([v6 isConnected]
      && ([v6 status] == 5 || objc_msgSend(v6, "status") == 6))
    {
      id v7 = +[ICSPreferences sharedPreferences];
      unsigned __int8 v8 = [v7 hasUserScoreFeedbackViewHidden];

      id v9 = sub_1000D5130();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : No Assertion Added, send to TU immediately", v14, 2u);
        }

        id v11 = [(PHInCallRootViewController *)self callCenter];
        id v12 = [(PHInCallRootViewController *)self disconnectCallUUID];
        [v11 sendUserScoreToRTCReporting:v12 withScore:0];
      }
      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : adding Assertion to show feedback view", buf, 2u);
        }

        double v13 = [v6 callUUID];
        [(PHInCallRootViewController *)self setDisconnectCallUUID:v13];

        [(id)objc_opt_class() obtainDismissalAssertionForReason:@"PHUserScoreShowingAssertionReason"];
      }
    }
  }
}

- (void)didEnterVideoMessagingFlow
{
  id v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Entering video messaging flow", v3, 2u);
  }

  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHVideoMessageInProgressAssertionReason"];
}

- (void)didExitVideoMessagingFlow
{
  id v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Exiting video messaging flow", v3, 2u);
  }

  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHVideoMessageInProgressAssertionReason"];
}

- (void)beganRecordingVideoMessage
{
}

- (void)endedRecordingVideoMessage
{
}

- (void)_loadUserFeedbackViewController
{
  if (!self->_userFeedbackViewController)
  {
    id v5 = objc_alloc_init(ScoreController);
    [(ScoreController *)v5 setDelegate:self];
    id v3 = [[PHUserFeedbackViewController alloc] initWithScoreController:v5];
    userFeedbackViewController = self->_userFeedbackViewController;
    self->_userFeedbackViewController = v3;
  }
}

- (void)callDowngradedToAudioNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callDowngradedToAudioNotification: %@", buf, 0xCu);
  }

  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  id v6 = [v4 object];
  if (([v6 isEndpointOnCurrentDevice] & 1) == 0)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Call's endpoint is on another device, releasing dismissal assertions", buf, 2u);
    }

    unsigned __int8 v8 = +[PHAudioCallViewController dismissalAssertionReason];
    id v9 = +[NSSet setWithObjects:v8, @"PHTransitioningBetweenViewControllersAssertionReason", 0];

    [(id)objc_opt_class() releaseDismissalAssertionReasons:v9];
  }
}

- (void)callContinuityChangedNotification:(id)a3
{
  id v3 = [a3 object];
  if ([v3 isConversation]
    && ([v3 isEndpointOnCurrentDevice] & 1) == 0)
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Multiway call's endpoint is on another device, releasing dismissal assertions", buf, 2u);
    }

    id v5 = +[NSSet setWithObjects:@"PHMulitwayCallAssertionReason", @"PHTransitioningBetweenViewControllersAssertionReason", 0];
    [(id)objc_opt_class() releaseDismissalAssertionReasons:v5];
  }
}

- (void)pipStateChangedNotification:(id)a3
{
  id v5 = a3;
  id v6 = +[PHPIPController defaultPIPController];
  id v7 = (char *)[v6 pipState];

  unsigned __int8 v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pipStateChangedNotification; new state=%lu",
      (uint8_t *)&v20,
      0xCu);
  }

  if ((unint64_t)(v7 - 1) <= 1
    && (uint64_t v9 = [(PHInCallRootViewController *)self shouldStartMultiwayPIP], v9))
  {
    BOOL v10 = [(PHInCallRootViewController *)self multiwayViewController];

    if (v10)
    {
      [(PHInCallRootViewController *)self transitionIntoPiP];
    }
    else
    {
      BOOL v17 = sub_1000D5130();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MultiwayViewController isn't ready for initial PiP yet; will transition into PiP on next notification",
          (uint8_t *)&v20,
          2u);
      }
    }
  }
  else
  {
    if (v7 == (char *)3 || v7 == 0)
    {
      unsigned __int8 v8 = [(PHInCallRootViewController *)self multiwayViewController];
      id v3 = [v8 pipViewController];
      uint64_t v9 = [v3 parentViewController];
      if (v9)
      {
        BOOL v12 = 1;
      }
      else
      {
        double v13 = [(PHInCallRootViewController *)self oldMultiwayPIPViewController];
        BOOL v12 = v13 != 0;

        uint64_t v9 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    if (v7 == (char *)3 || !v7)
    {
    }
    if (v12)
    {
      int v14 = [(PHInCallRootViewController *)self multiwayViewController];
      [v14 setPipState:v7];

      if (v7) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v7) {
        goto LABEL_28;
      }
      id v15 = [(PHInCallRootViewController *)self multiwayViewController];

      if (v15)
      {
        unsigned __int8 v16 = +[PHPIPController defaultPIPController];
        [v16 updatePIPFrame];
      }
    }
    [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  }
LABEL_28:
  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
  [(PHInCallRootViewController *)self updateCallDetailsViewIsOnScreen];
  id v18 = [v5 object];

  id v19 = +[PHPIPController defaultPIPController];

  if (v18 == v19) {
    [(PHInCallRootViewController *)self updateBackgroundStartPipAuthorizationState];
  }
}

- (void)pipStashChangedNotification:(id)a3
{
  id v4 = +[PHPIPController defaultPIPController];
  id v5 = [v4 isPIPProxyActiveAndHidden];

  id v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "pipStashChangedNotification; isStashed=%u",
      (uint8_t *)v8,
      8u);
  }

  id v7 = [(PHInCallRootViewController *)self multiwayViewController];
  [v7 setIsPipStashed:v5];
}

- (void)transitionIntoPiP
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transitioning into PiP now", v8, 2u);
  }

  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
  id v4 = objc_opt_class();
  id v5 = [(PHInCallRootViewController *)self multiwayViewController];
  id v6 = [v4 uiDeviceOrientationForCNKDeviceOrientation:[v5 fullScreenFocusedParticipantOrientation]];
  id v7 = +[PHPIPController defaultPIPController];
  [v7 setPipDeviceOrientation:v6];
}

- (void)pipProxyActiveChangedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pipProxyActiveChangedNotification", v5, 2u);
  }

  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int v14 = [v4 view];
  [v14 setBounds:v7, v9, v11, v13];

  id v15 = [(PHInCallRootViewController *)self view];
  [v15 center];
  double v17 = v16;
  double v19 = v18;
  int v20 = [v4 view];

  [v20 setCenter:v17, v19];
  id v21 = [(PHInCallRootViewController *)self multiwayViewController];
  uint64_t v22 = [v21 pipViewController];
  int v23 = [v22 parentViewController];
  if (v23)
  {
    v24 = [(PHInCallRootViewController *)self multiwayViewController];
    __int16 v25 = [v24 pipViewController];
  }
  else
  {
    __int16 v25 = [(PHInCallRootViewController *)self oldMultiwayPIPViewController];
  }

  v26 = sub_1000D5130();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      int v28 = 138412290;
      v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Cross-fading away from PIP view controller %@", (uint8_t *)&v28, 0xCu);
    }

    [(PHInCallRootViewController *)self setOldMultiwayPIPViewController:0];
  }
  else
  {
    if (v27)
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not performing cross-fade for PIP stop because there's no multiway PIP view controller", (uint8_t *)&v28, 2u);
    }
  }
}

- (BOOL)shouldStartMultiwayPIP
{
  id v3 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController view];
  uint64_t v4 = [v3 superview];
  if (!v4)
  {

    goto LABEL_5;
  }
  id v5 = (void *)v4;
  unsigned __int8 v6 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController isChildOf:self];

  if ((v6 & 1) == 0)
  {
LABEL_5:
    double v8 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    BOOL v7 = [v8 callDisplayStyle] == (id)4;

    return v7;
  }
  return 1;
}

- (void)handlePIPInterruptionChangeNotification:(id)a3
{
  uint64_t v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "handlePIPInterruptionChangeNotification", buf, 2u);
  }

  if ([(PHInCallRootViewController *)self isDisplayStyleMiniWindow])
  {
    id v5 = +[PHPIPController defaultPIPController];
    unsigned int v6 = [v5 isPIPProxyInterrupted];

    if (v6)
    {
      BOOL v7 = sub_1000D5130();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PIP is interrupted and display style is mini window, attempting to show mini window view.", v8, 2u);
      }

      [(PHInCallRootViewController *)self showHideMiniWindowViewIfNeededAnimated:0];
    }
  }
  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
}

- (void)handleSystemInitiatedPIPInterruptionStoppedNotification:(id)a3
{
  uint64_t v4 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v5 = [v4 sceneSessionIdentifier];
  unsigned int v6 = +[UIApplication sharedApplication];
  BOOL v7 = [v6 delegate];
  double v8 = [v7 currentInCallScene];
  double v9 = [v8 session];
  double v10 = [v9 persistentIdentifier];
  unsigned __int8 v11 = [v5 isEqualToString:v10];

  if (v11)
  {
    double v12 = +[PHPIPController defaultPIPController];
    double v13 = [v12 pipInterruptedCallIdentifier];

    int v14 = [(PHInCallRootViewController *)self callCenter];
    id v15 = [v14 callWithUniqueProxyIdentifier:v13];

    double v16 = sub_1000D5130();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "handleSystemInitiatedPIPInterruptionStoppedNotification for call identifier: %@", (uint8_t *)&v23, 0xCu);
    }

    if ([v13 length] && v15)
    {
      double v17 = sub_1000D5130();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Call %@ which was originally pip interrupted has been uninterrupted. Stop that calls video since the interruption-stop was not user-initiated", (uint8_t *)&v23, 0xCu);
      }

      if ([v15 isConversation])
      {
        [v15 setRemoteVideoPresentationState:0];
      }
      else
      {
        double v18 = [(PHInCallRootViewController *)self callCenter];
        double v19 = [v18 frontmostAudioOrVideoCall];
        unsigned __int8 v20 = [v19 isVideo];

        if ((v20 & 1) == 0)
        {
          id v21 = [(PHInCallRootViewController *)self callCenter];
          uint64_t v22 = [v21 videoDeviceController];
          [v22 stopPreview];
        }
      }
      [v15 setIsSendingVideo:0];
    }
  }
  else
  {
    double v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not handling PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification since scene does not match the scene currently used by InCallService.", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3
{
  uint64_t v4 = +[ICSPreferences sharedPreferences];
  unsigned __int8 v5 = [v4 hasAdoptedModernInCallAPI];

  if ((v5 & 1) == 0)
  {
    [(PHInCallRootViewController *)self animateToAlert];
  }
}

- (BOOL)shouldShowSOS
{
  id v3 = [(PHInCallRootViewController *)self callCenter];
  if ([v3 currentCallCount])
  {
    BOOL v4 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(PHInCallRootViewController *)self callCenter];
    if ([v5 currentVideoCallCount]) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = +[PHSOSViewController isSOSDismissalAssertionActive];
    }
  }
  return v4;
}

- (BOOL)shouldShowScreenTimeShield
{
  if ([(PHInCallRootViewController *)self shouldShowSOS]) {
    return 0;
  }
  BOOL v4 = [(PHInCallRootViewController *)self filteredRequest];
  if (v4
    && [(id)qword_100326250 containsObject:@"PHScreenTimeAlertAssertionReason"])
  {
    unsigned __int8 v5 = [(PHInCallRootViewController *)self callCenter];
    unsigned int v6 = [v5 incomingVideoCall];
    if (v6)
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v7 = [(PHInCallRootViewController *)self callCenter];
      double v8 = [v7 incomingCall];
      BOOL v3 = v8 == 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)shouldShowVideoCallBlockAndReportScreen
{
  BOOL v3 = [(PHInCallRootViewController *)self callCenter];
  BOOL v4 = [v3 currentVideoCall];

  if (v4)
  {
    unsigned __int8 v5 = [(PHInCallRootViewController *)self callCenter];
    unsigned int v6 = [v5 currentVideoCall];
LABEL_7:

    BOOL v12 = [(PHInCallRootViewController *)self shouldShowCallEndedBlockAndReportScreen:v6];
    goto LABEL_8;
  }
  BOOL v7 = +[UIApplication sharedApplication];
  double v8 = [v7 delegate];
  double v9 = [v8 mostRecentlyDisconnectedVideoCall];

  unsigned int v6 = sub_1000D5130();
  BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[self.callCenter currentVideoCall] is nil, using mostRecentlyDisconnectedVideoCall", buf, 2u);
    }

    unsigned __int8 v5 = +[UIApplication sharedApplication];
    unsigned __int8 v11 = [v5 delegate];
    unsigned int v6 = [v11 mostRecentlyDisconnectedVideoCall];

    goto LABEL_7;
  }
  if (v10)
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICSAppDelegate.mostRecentlyDisconnectedVideoCall is nil so shouldShowVideoCallBlockAndReportScreen is false", v14, 2u);
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)shouldShowCallEndedBlockAndReportScreen:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v6 = [v5 isGreenTea];

  if ((v6 & 1) == 0)
  {
    double v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      double v9 = "not a greentea device, so we don't show the end call screen";
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  BOOL v7 = [v4 contactIdentifier];

  if (v7)
  {
    double v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      double v9 = "it's a contact so we don't show the end call screen";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v29, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL v12 = [v4 provider];
  unsigned __int8 v13 = [v12 isFaceTimeProvider];

  if ((v13 & 1) == 0)
  {
    double v8 = sub_1000D5130();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    LOWORD(v29) = 0;
    double v9 = "it's not a FaceTime call so we don't show the end call screen";
    goto LABEL_7;
  }
  uint64_t v10 = [v4 dateConnected];

  if (!v10)
  {
    double v8 = sub_1000D5130();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v29) = 0;
    double v9 = "call was never connnected so we don't show the end call screen";
    goto LABEL_7;
  }
  if ([(PHInCallRootViewController *)self isContactBlockedWithCall:v4])
  {
    double v8 = sub_1000D5130();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    LOWORD(v29) = 0;
    double v9 = "the caller is already blocked, so we don't show the end call screen";
    goto LABEL_7;
  }
  int v14 = [v4 handle];
  id v15 = [v14 value];
  double v16 = [v4 handle];
  double v17 = [v16 normalizedValue];
  unsigned int v18 = [(PHInCallRootViewController *)self isFirstTimeInCallHistoryWithHandleValue:v15 normalizedHandleValue:v17];

  double v19 = [v4 handle];
  unsigned __int8 v20 = [v19 value];
  id v21 = [v4 handle];
  uint64_t v22 = [v21 normalizedValue];
  int v23 = [v4 uniqueProxyIdentifier];
  double v8 = [(PHInCallRootViewController *)self findMostRecentSilencedCallWithHandleValue:v20 normalizedHandleValue:v22 ignoredIdentifier:v23];

  if (v18) {
    LODWORD(v10) = [v4 isIncoming];
  }
  else {
    LODWORD(v10) = 0;
  }
  v24 = sub_1000D5130();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 67109376;
    BOOL v30 = v18;
    __int16 v31 = 1024;
    unsigned int v32 = [v4 isIncoming];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "(isFirstTimeInCallHistory :%d && call.isIncoming: %d)", (uint8_t *)&v29, 0xEu);
  }

  if (v8) {
    unsigned int v25 = [v4 isOutgoing];
  }
  else {
    unsigned int v25 = 0;
  }
  v26 = sub_1000D5130();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v27 = [v4 isOutgoing];
    int v29 = 67109376;
    BOOL v30 = v8 != 0;
    __int16 v31 = 1024;
    unsigned int v32 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(filteredMostRecent != nil :%d && disconnectedCall.isOutgoing: %d", (uint8_t *)&v29, 0xEu);
  }

  int v28 = sub_1000D5130();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 67109376;
    BOOL v30 = v10;
    __int16 v31 = 1024;
    unsigned int v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "shouldShowCallEndedBlockAndReportScreen: \n (isUnknownFirstTimeCallerConnectedIncomingCall: %d || isFilteredConnectedOutgoingCall): %d \n", (uint8_t *)&v29, 0xEu);
  }

  LOBYTE(v10) = v10 | v25;
LABEL_9:

  return v10;
}

- (BOOL)shouldExitVideoMessageFlowConsideringShowAudioController:(BOOL)a3 showEmergencyCallController:(BOOL)a4 showSOSController:(BOOL)a5 showScreenTimeController:(BOOL)a6 showUserScoreController:(BOOL)a7 showPTTFullScreenController:(BOOL)a8
{
  return a8 || a3 || a4 || a5 || a6;
}

- (void)updateCallControllerForCurrentState
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InCallRootViewController updateCallControllerForCurrentState", buf, 2u);
  }

  if (![(PHInCallRootViewController *)self hasEverAppearedInWindow]
    || ([(PHInCallRootViewController *)self view],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 window],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unsigned __int8 v6 = [(PHInCallRootViewController *)self callCenter];
    uint64_t v7 = [v6 incomingCall];
    double v8 = +[UIApplication sharedApplication];
    double v9 = [v8 delegate];
    uint64_t v10 = [v9 mostRecentlyDisconnectedAudioCall];
    if ([v10 disconnectedReasonRequiresCallBackUI])
    {
      unsigned int v11 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked];
    }
    else
    {
      BOOL v12 = +[UIApplication sharedApplication];
      unsigned __int8 v13 = [v12 delegate];
      int v14 = [v13 mostRecentlyDisconnectedAudioCall];
      if ([v14 shouldShowFailureAlert]) {
        unsigned int v11 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked];
      }
      else {
        unsigned int v11 = 0;
      }
    }
    id v15 = +[UIApplication sharedApplication];
    double v16 = [v15 delegate];
    double v17 = [v16 mostRecentlyDisconnectedVideoCall];
    v251 = self;
    if ([v17 disconnectedReasonRequiresCallBackUI])
    {
      unsigned int v18 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked];
    }
    else
    {
      double v19 = v6;
      uint64_t v20 = v7;
      id v21 = +[UIApplication sharedApplication];
      uint64_t v22 = [v21 delegate];
      int v23 = [v22 mostRecentlyDisconnectedVideoCall];
      if ([v23 shouldShowFailureAlert]) {
        unsigned int v24 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked];
      }
      else {
        unsigned int v24 = 0;
      }

      unsigned int v18 = v24;
      uint64_t v7 = v20;
      unsigned __int8 v6 = v19;
      self = v251;
    }

    unsigned int v25 = [(id)qword_100326250 containsObject:@"PHRedialCallAssertionReason"];
    if ((v11 | v18) == 1)
    {
      v26 = +[PHPIPController defaultPIPController];
      id v27 = [v26 pipState];

      if (v27 == (id)2)
      {
        int v28 = +[PHPIPController defaultPIPController];
        [v28 cancelPIPIfNeeded];
      }
    }
    int v29 = [v6 bargeCalls];
    id v30 = [v29 count];

    v253 = [v6 callsPassingTest:&stru_1002CFEA8];
    __int16 v31 = [v6 frontmostCall];
    if ([v31 isActive])
    {
      unsigned int v32 = v6;
      uint64_t v33 = v7;
      unsigned int v34 = v18;
      double v35 = v32;
      double v36 = [v32 frontmostCall];
      double v37 = [v36 provider];
      if ([v37 supportsDynamicSystemUI])
      {
        id v38 = [v253 count];

        unsigned int v18 = v34;
        uint64_t v7 = v33;
        unsigned __int8 v6 = v35;
        self = v251;
        if (v38) {
          goto LABEL_30;
        }
        __int16 v31 = [(PHInCallRootViewController *)v251 featureFlags];
        if ([v31 groupConversations])
        {
          int HasChinaSKU = TUDeviceHasChinaSKU();

          if (HasChinaSKU)
          {
            v40 = sub_1000D5130();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Releasing dismissal assertions and presenting GreenTea3P HUD because only a GroupConversation call remains active.", buf, 2u);
            }

            +[PHInCallRootViewController releaseDismissalAssertionReasons:qword_100326250];
            id v41 = +[UIApplication sharedApplication];
            v42 = [v41 delegate];
            v43 = [v42 bannerPresentationManager];
            [v43 showGreenTea3PHUD];

            goto LABEL_283;
          }
LABEL_30:
          if (([v6 hasCurrentCalls] & 1) == 0
            && ((+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled") | v11 | v18) & 1) == 0&& !-[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](self, "shouldShowVideoCallBlockAndReportScreen")&& !-[PHInCallRootViewController shouldShowSOS](self, "shouldShowSOS")&& !-[PHInCallRootViewController shouldShowScreenTimeShield](self, "shouldShowScreenTimeShield")&& (([(id)qword_100326250 containsObject:@"PHUserScoreShowingAssertionReason"] | v25) & 1) == 0&& !v30&& (objc_msgSend((id)qword_100326250, "containsObject:", @"PHAVLessConversationDetailsViewAssertionReason") & 1) == 0&& (objc_msgSend((id)qword_100326250, "containsObject:",
                                @"PHAVLessConversationAssertionReason") & 1) == 0
            && ([(id)qword_100326250 containsObject:@"PHVideoMessageInProgressAssertionReason"] & 1) == 0&& (objc_msgSend((id)qword_100326250, "containsObject:", @"PHCallEndedBlockAndReportInProgressAssertionReason") & 1) == 0)
          {
            v150 = +[PHPIPController defaultPIPController];
            [v150 cancelPIPIfNeeded];

            v151 = sub_1000D5130();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "InCallRootViewController doesn't need to show anything", buf, 2u);
            }

            id v152 = objc_alloc((Class)NSSet);
            v153 = +[PHAudioCallViewController dismissalAssertionReason];
            v260[0] = v153;
            v260[1] = @"PHMulitwayCallAssertionReason";
            v154 = +[NSArray arrayWithObjects:v260 count:2];
            id v41 = [v152 initWithArray:v154];

            +[PHInCallRootViewController releaseDismissalAssertionReasons:v41];
            goto LABEL_283;
          }
          if ([v6 anyCallPassesTest:&stru_1002CFEC8])
          {
            id v41 = sub_1000D5130();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Ringing call wants suppressed UI, not displaying a view controller.", buf, 2u);
            }
            goto LABEL_283;
          }
          v44 = [(PHInCallRootViewController *)self currentViewController];
          unsigned int v234 = v18;
          if (self->_videoCallNavigationController == v44)
          {
            v46 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController view];
            uint64_t v47 = [v46 superview];
            if (v47)
            {
              v48 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController parentViewController];
              BOOL v233 = v48 != 0;
            }
            else
            {
              BOOL v233 = 0;
            }
            v45 = &_ss4Int8VN_ptr;
          }
          else
          {
            BOOL v233 = 0;
            v45 = &_ss4Int8VN_ptr;
          }
          v49 = [v6 currentAudioAndVideoCalls];
          id v50 = [v49 count];

          v254[0] = _NSConcreteStackBlock;
          v254[1] = 3221225472;
          v254[2] = sub_1000B837C;
          v254[3] = &unk_1002CFEF0;
          v51 = v6;
          v255 = v51;
          v243 = [v51 callPassingTest:v254];
          v240 = [v51 callPassingTest:&stru_1002CFF10];
          uint64_t v250 = [v51 callPassingTest:&stru_1002CFF30];
          v239 = [v51 callPassingTest:&stru_1002CFF50];
          v238 = [v51 callPassingTest:&stru_1002CFF70];
          uint64_t v52 = [v51 callWithStatus:2];
          if (v52)
          {
            v53 = [(PHInCallRootViewController *)self callManager];
            [v53 updateWithCall:v52];
          }
          v235 = (void *)v52;
          uint64_t v54 = [v51 callPassingTest:&stru_1002CFF90];
          if (v54)
          {
            v55 = [(PHInCallRootViewController *)self callManager];
            [v55 updateWithCall:v54];
          }
          v245 = (void *)v54;
          v241 = (PHEmergencyDialerViewController *)v44;
          uint64_t v249 = v7;
          v56 = [v45[387] sharedApplication];
          v57 = [v56 delegate];
          uint64_t v58 = [v57 mostRecentlyDisconnectedVideoCall];

          if (v58)
          {
            v59 = [(PHInCallRootViewController *)self callManager];
            [v59 updateWithCall:v58];
          }
          v236 = (void *)v58;
          unsigned int v60 = [v51 anyCallPassesTest:&stru_1002CFFB0];
          v61 = [v45[387] sharedApplication];
          v62 = [v61 delegate];
          v247 = [v62 mostRecentlyDisconnectedVideoCall];

          unsigned int v63 = [v51 hasCurrentVideoCalls];
          unsigned int v64 = [v51 ics_hasTooManyCallsForCallWaitingBanner];
          if (v7)
          {
            v65 = [(PHInCallRootViewController *)self callManager];
            [v65 updateWithCall:v7];
          }
          unsigned int v66 = ![(PHInCallRootViewController *)self shouldShowScreenTimeShield] | v60;
          if ((v66 & 1) == 0)
          {
            v70 = sub_1000D5130();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v71 = [(PHInCallRootViewController *)self filteredRequest];
              *(_DWORD *)buf = 138412290;
              v257 = v71;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show screen time host view controller for request %@", buf, 0xCu);
            }
            p_super = 0;
            LODWORD(v73) = 0;
            if (!v247)
            {
              unsigned int v246 = 1;
              unsigned int v74 = 0;
              uint64_t v75 = 0;
              unsigned int v244 = 0;
LABEL_79:
              v80 = +[PHPIPController defaultPIPController];
              id v81 = [v80 pipState];

              BOOL v82 = v81 == 0;
              if (v81) {
                uint64_t v83 = 0;
              }
              else {
                uint64_t v83 = v74;
              }
              if (v82) {
                uint64_t v84 = v73;
              }
              else {
                uint64_t v84 = 0;
              }
              v85 = [(PHInCallRootViewController *)self multiwayViewController];

              if (v85)
              {
                if ([(PHInCallRootViewController *)self shouldExitVideoMessageFlowConsideringShowAudioController:v84 showEmergencyCallController:v83 showSOSController:v75 showScreenTimeController:v246 showUserScoreController:v244 showPTTFullScreenController:0])
                {
                  v86 = [(PHInCallRootViewController *)self multiwayViewController];
                  unsigned int v87 = [v86 isInVideoMessageFlow];

                  if (v87)
                  {
                    v88 = [(PHInCallRootViewController *)self multiwayViewController];
                    [v88 cancelVideoRecordingWithCompletion:0];

                    [(PHInCallRootViewController *)self setMultiwayViewController:0];
                  }
                }
              }
              v89 = [v51 frontmostBargeCall];
              if (v89) {
                int v90 = v84;
              }
              else {
                int v90 = 1;
              }
              int v91 = v246 | v75 | v83 | v90;
              if (p_super) {
                int v92 = 1;
              }
              else {
                int v92 = v91;
              }

              v93 = &_ss4Int8VN_ptr;
              if ((v92 | v244))
              {
                if (([(id)qword_100326250 containsObject:@"PHInitialPTTFullScreenPresentationAssertionReason"] & 1) != 0|| objc_msgSend((id)qword_100326250, "containsObject:", @"PHPTTCallDetailsViewAssertionReason"))
                {
                  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHInitialPTTFullScreenPresentationAssertionReason"];
                  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
                }
                unsigned int v94 = 0;
                unsigned int v237 = 0;
              }
              else
              {
                v95 = sub_1000D5130();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                {
                  v96 = [v51 frontmostBargeCall];
                  *(_DWORD *)buf = 138412290;
                  v257 = v96;
                  _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Loading PTT full screen controller %@", buf, 0xCu);
                }
                v97 = +[UIApplication sharedApplication];
                v98 = [v97 delegate];
                unsigned int v237 = [v98 didDeepLinkToPTTCallDetailsView] ^ 1;

                v99 = +[UIApplication sharedApplication];
                uint64_t v84 = [v99 delegate];
                unsigned int v94 = [(id)v84 didDeepLinkToPTTCallDetailsView];

                LODWORD(v84) = 0;
              }
              int v248 = v84;
              int v242 = v75;
              v252 = p_super;
              v100 = [v51 frontmostAudioOrVideoCall];
              if (v100)
              {
              }
              else
              {
                uint64_t p_info = +[UIApplication sharedApplication];
                v102 = [(id)p_info delegate];
                v103 = [v102 bannerPresentationManager];
                unsigned int v104 = [v103 conversationIsAVLess];

                if (v104)
                {
                  v105 = sub_1000D5130();
                  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController should show call details view for an AV-less conversation", buf, 2u);
                  }

                  unsigned int v94 = 1;
                  goto LABEL_111;
                }
              }
              uint64_t p_info = +[UIApplication sharedApplication];
              v106 = [(id)p_info delegate];
              v107 = [v106 bannerPresentationManager];
              if (![v107 onlyHasPlaceholderCall])
              {
                v108 = [v51 conversationManager];
                v109 = [v108 avLessConversation];

                if (!v109)
                {
                  uint64_t p_info = (uint64_t)&OBJC_METACLASS___PHAirplaneEmergencyCallAlert.info;
                  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationAssertionReason"];
                  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationDetailsViewAssertionReason"];
                }
                uint64_t v7 = v249;
                v93 = &_ss4Int8VN_ptr;
LABEL_115:
                unint64_t v111 = (unint64_t)v240;
                v110 = v241;
                if (v83)
                {
                  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHEmergencyCallBackModeAssertionReason"];
                  v112 = [(PHEmergencyDialerViewController *)self->_emergencyDialerViewController view];
                  v113 = [v112 superview];

                  v114 = v235;
                  if (!v113)
                  {
                    v115 = sub_1000D5130();
                    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing the emergency callback view controller", buf, 2u);
                    }

                    [(PHInCallRootViewController *)self obtainIdleTimerAssertionWithComment:@"showing Emergency controller"];
                    emergencyDialerViewController = self->_emergencyDialerViewController;
                    if (!emergencyDialerViewController)
                    {
                      v117 = objc_alloc_init(PHEmergencyDialerViewController);
                      v118 = self->_emergencyDialerViewController;
                      self->_emergencyDialerViewController = v117;

                      [(PHEmergencyDialerViewController *)self->_emergencyDialerViewController setShouldSetPresenceToken:0];
                      emergencyDialerViewController = self->_emergencyDialerViewController;
                    }
                    [(PHInCallRootViewController *)self _transitionFromViewController:v241 toViewController:emergencyDialerViewController];
                    v119 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
                    [v119 setWallpaperTunnelActive:1];
                  }
                  goto LABEL_184;
                }
                if (v248)
                {
                  [(PHInCallRootViewController *)self _loadAudioCallViewController];
                  v120 = [(PHInCallRootViewController *)self features];
                  if ([v120 callManagerEnabled])
                  {
                    v121 = [(PHInCallRootViewController *)self callCenter];
                    v122 = [v121 frontmostCall];

                    if (v122)
                    {
                      v123 = [(PHInCallRootViewController *)self callManager];
                      v124 = [(PHInCallRootViewController *)self callCenter];
                      v125 = [v124 frontmostCall];
                      [v123 updateWithCall:v125];

                      goto LABEL_137;
                    }
                  }
                  else
                  {
                  }
                  v134 = [(PHInCallRootViewController *)self audioCallNavigationController];
                  v135 = [v134 view];
                  v136 = [v135 superview];

                  if (v136)
                  {
LABEL_138:
                    if (!v241) {
                      goto LABEL_180;
                    }
                    uint64_t v138 = [(PHInCallRootViewController *)self audioCallViewController];
                    if (!v138) {
                      goto LABEL_180;
                    }
                    v139 = (void *)v138;
                    uint64_t v140 = [(PHInCallRootViewController *)self audioCallNavigationController];
                    if (v140)
                    {
                      v141 = (void *)v140;
                      v142 = [(PHInCallRootViewController *)self audioCallNavigationController];
                      v143 = [v142 view];
                      uint64_t v144 = [v143 superview];
                      if (!(v144 | (unint64_t)v252))
                      {
                        multiwayViewController = self->_multiwayViewController;

                        v93 = &_ss4Int8VN_ptr;
                        if (multiwayViewController)
                        {
                          v146 = sub_1000D5130();
                          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Audio controller after transitioning from multiwayViewController", buf, 2u);
                          }

                          v139 = [(PHInCallRootViewController *)self audioCallNavigationController];
                          [(PHInCallRootViewController *)self _transitionFromViewController:v241 toViewController:v139];
                          goto LABEL_179;
                        }
LABEL_180:
                        if (v7) {
                          [(PHInCallRootViewController *)self obtainIdleTimerAssertionWithComment:@"showing Audio controller"];
                        }
                        else {
                          [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"showing Audio controller"];
                        }
                        v114 = v235;
                        goto LABEL_184;
                      }

                      v93 = &_ss4Int8VN_ptr;
                    }
LABEL_179:

                    goto LABEL_180;
                  }
                  v137 = sub_1000D5130();
                  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Audio controller", buf, 2u);
                  }

                  v123 = [(PHInCallRootViewController *)self audioCallNavigationController];
                  [(PHInCallRootViewController *)self _transitionFromViewController:v241 toViewController:v123];
LABEL_137:

                  goto LABEL_138;
                }
                if (v242)
                {
                  v126 = [(PHSOSViewController *)self->_sosViewController view];
                  v127 = [v126 superview];

                  v114 = v235;
                  if (!v127)
                  {
                    v128 = sub_1000D5130();
                    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing SOS controller", buf, 2u);
                    }

                    [(PHInCallRootViewController *)self _loadSOSViewController];
                    [(PHInCallRootViewController *)self _reloadSOSHandles];
                    [(PHInCallRootViewController *)self _transitionFromViewController:v241 toViewController:self->_sosViewController];
                    v129 = +[UIApplication sharedApplication];
                    v130 = [v129 delegate];
                    [v130 transitionSceneToOverlayForSOS];
                  }
                  v131 = +[UIColor clearColor];
                  v132 = [(PHInCallRootViewController *)self view];
                  v133 = [v132 window];
                  [v133 setBackgroundColor:v131];

                  [(PHInCallRootViewController *)self obtainIdleTimerAssertionWithComment:@"showing SOS controller"];
LABEL_184:
                  [(PHInCallRootViewController *)self showHideMiniWindowViewIfNeededAnimated:0];
                  v162 = v245;
                  id v41 = v252;
                  if (v252)
                  {
LABEL_185:
                    if (([(id)qword_100326250 containsObject:@"PHMulitwayCallAssertionReason"] & 1) == 0)
                    {
                      +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
                      id v41 = v252;
                    }
                    goto LABEL_273;
                  }
LABEL_267:
                  if ([(id)qword_100326250 containsObject:@"PHMulitwayCallAssertionReason"])
                  {
                    v209 = [(PHInCallRootViewController *)self multiwayViewController];
                    if ([v209 isInVideoMessageFlow])
                    {
                    }
                    else
                    {
                      unsigned __int8 v210 = [(PHInCallRootViewController *)self shouldShowVideoCallBlockAndReportScreen];

                      if ((v210 & 1) == 0) {
                        +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
                      }
                    }
                  }
                  id v41 = 0;
LABEL_273:
                  if ((v248 | v237) == 1)
                  {
                    v211 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
                    [v211 setWallpaperTunnelActive:1];
                  }
                  if (v242)
                  {
                    v212 = [v93[387] sharedApplication];
                    v213 = [v212 delegate];
                    [v213 hideCarPlayUI];
                  }
                  else
                  {
                    char v214 = v248 ^ 1;
                    if (v252) {
                      char v214 = 0;
                    }
                    if (v214) {
                      goto LABEL_282;
                    }
                    v212 = [v93[387] sharedApplication];
                    v213 = [v212 delegate];
                    [v213 showCarPlayUIWithActivation:(v7 | v111 | v250) != 0];
                  }

                  v162 = v245;
LABEL_282:
                  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
                  [(PHInCallRootViewController *)self updateCallDetailsViewIsOnScreen];
                  [(PHInCallRootViewController *)self updateDesiredSpringboardBehavior];

LABEL_283:
                  goto LABEL_284;
                }
                if (!v252)
                {
                  if (v246)
                  {
                    v155 = [(PHInCallRootViewController *)self screenTimeHostViewController];
                    v156 = [v155 view];
                    v157 = [v156 superview];

                    v114 = v235;
                    if (!v157)
                    {
                      v158 = sub_1000D5130();
                      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Screen Time Host controller", buf, 2u);
                      }

                      [(PHInCallRootViewController *)self dismissPhoneRemoteViewController];
                      [(PHInCallRootViewController *)self dismissContactsViewController];
                      [(PHInCallRootViewController *)self presentScreenTimeHostViewController];
                    }
                  }
                  else
                  {
                    v114 = v235;
                    if (v244)
                    {
                      [(PHInCallRootViewController *)self _loadUserFeedbackViewController];
                      v189 = sub_1000D5130();
                      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing User Feedback View controller", buf, 2u);
                      }

                      v190 = [(PHInCallRootViewController *)self callCenter];
                      v191 = [v190 videoDeviceController];
                      [v191 stopPreview];

                      [(PHInCallRootViewController *)self presentViewController:self->_userFeedbackViewController animated:1 completion:0];
                    }
                    else if (v237)
                    {
                      v195 = [(PHPTTFullScreenContainerViewController *)self->_pttFullScreenContainerViewController view];
                      v196 = [v195 superview];

                      if (!v196)
                      {
                        v197 = sub_1000D5130();
                        if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing PTT Full screen controller", buf, 2u);
                        }

                        [(PHInCallRootViewController *)self _loadPTTFullScreenContainerViewController];
                        [(PHInCallRootViewController *)self _transitionFromViewController:v241 toViewController:self->_pttFullScreenContainerViewController];
                        [(PHInCallRootViewController *)self requestInCallDismissal];
                      }
                      [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"showing PTT Full Screen controller"];
                    }
                    else if (v94 {
                           && ![(PHInCallRootViewController *)self isPresentingCallDetailsView])
                    }
                    {
                      [(PHInCallRootViewController *)self showCallDetailsView];
                    }
                  }
                  [(PHInCallRootViewController *)self showHideMiniWindowViewIfNeededAnimated:0];
                  v162 = v245;
                  goto LABEL_267;
                }
                v147 = sub_1000D5130();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "showMultiwayControllerCall", buf, 2u);
                }

                v148 = [(PHInCallRootViewController *)self callDisplayStyleManager];
                if ([v148 callDisplayStyle])
                {
                }
                else
                {
                  v163 = [(PHInCallRootViewController *)self featureFlags];
                  uint64_t p_info = (uint64_t)[v163 conversationOneToOneModeEnabled];

                  if ((p_info & 1) == 0)
                  {
                    v164 = sub_1000D5130();
                    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                      sub_1001EB8C4();
                    }

                    [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
                  }
                }
                v165 = v252;
                v166 = [v51 activeConversationForCall:v252];
                unsigned int v167 = [v252 wantsStagingArea];
                if (v167)
                {
                  if ((+[TUConversationManager allowsVideo] & 1) == 0)goto LABEL_204; {
                  goto LABEL_193;
                  }
                }
                v165 = [v166 activeRemoteParticipants];
                if (-[NSObject count](v165, "count") && [v166 state] != (id)3)
                {
                  v51 = [(PHInCallRootViewController *)self multiwayViewController];
                  uint64_t p_info = [v51 call];
                  if (![(id)p_info isEqual:v252]
                    && +[TUConversationManager allowsVideo])
                  {
LABEL_193:
                    v168 = [(PHInCallRootViewController *)self featureFlags];
                    unsigned __int8 v169 = [v168 conversationOneToOneModeEnabled];

                    if (!v167)
                    {
                    }
                    unint64_t v111 = (unint64_t)v240;
                    if (v169) {
                      goto LABEL_204;
                    }
                    v165 = sub_1000D5130();
                    if (os_log_type_enabled(v165, OS_LOG_TYPE_FAULT)) {
                      sub_1001EB884();
                    }
                    goto LABEL_203;
                  }
                }
LABEL_203:

LABEL_204:
                v93 = &_ss4Int8VN_ptr;
                v110 = v241;
                v114 = v235;
                if (!v233)
                {
                  v170 = [(PHInCallRootViewController *)self multiwayViewController];
                  unsigned __int8 v171 = [v170 isInVideoMessageFlow];

                  if ((v171 & 1) == 0)
                  {
                    v172 = sub_1000D5130();
                    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Multiway controller", buf, 2u);
                    }

                    v173 = [(PHInCallRootViewController *)self multiwayViewController];
                    v174 = [v173 pipViewController];
                    v175 = [v174 parentViewController];

                    [(PHInCallRootViewController *)self _loadMultiwayViewControllerForCall:v252];
                    v176 = [(PHInCallRootViewController *)self multiwayViewController];
                    [(PHInCallRootViewController *)self transitionToVideoCallBasedViewController:v176 shouldUpdatePipSize:1];

                    v177 = +[PHInCallOrientationMonitor sharedInstance];
                    [v177 setOrientationEventsEnabled:1];

                    v178 = [(PHInCallRootViewController *)self multiwayViewController];

                    BOOL v82 = v173 == v178;
                    v93 = &_ss4Int8VN_ptr;
                    if (!v82 && v175)
                    {
                      v179 = sub_1000D5130();
                      if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
                      {
                        v180 = [v173 pipViewController];
                        *(_DWORD *)buf = 138412290;
                        v257 = v180;
                        _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "Old GFT call was showing PIP view controller %@", buf, 0xCu);

                        v93 = &_ss4Int8VN_ptr;
                      }

                      v181 = [v173 pipViewController];
                      [(PHInCallRootViewController *)self setOldMultiwayPIPViewController:v181];
                    }
                  }
                }
                if (v234) {
                  [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"showing Multiway controller for disconnected video call requiring UI"];
                }
                else {
                  [(PHInCallRootViewController *)self obtainIdleTimerAssertionWithComment:@"showing Multiway controller"];
                }
                v162 = v245;

                [(PHInCallRootViewController *)self showHideMiniWindowViewIfNeededAnimated:0];
                id v41 = v252;
                goto LABEL_185;
              }

LABEL_111:
              uint64_t v7 = v249;
              goto LABEL_115;
            }
            unsigned int v74 = 0;
            uint64_t v75 = 0;
            unsigned int v244 = 0;
            goto LABEL_74;
          }
          if (v250)
          {
            v67 = sub_1000D5130();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v257 = (PHInCallRootViewController *)v250;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Showing video controller for ringing video call %@", buf, 0xCu);
            }

            if ([(id)qword_100326250 containsObject:@"PHCallEndedBlockAndReportInProgressAssertionReason"])
            {
              v68 = [(PHInCallRootViewController *)self multiwayViewController];
              [v68 setIsInCallEndedBlockAndReportFlow:0];

              [(id)objc_opt_class() releaseDismissalAssertionForReason:@"PHCallEndedBlockAndReportInProgressAssertionReason"];
            }
            v69 = (void *)v250;
LABEL_70:
            p_super = v69;
LABEL_71:
            LODWORD(v73) = 0;
LABEL_72:
            unsigned int v74 = 0;
            uint64_t v75 = 0;
            unsigned int v244 = 0;
            unsigned int v246 = 0;
            goto LABEL_73;
          }
          if (v50 == (id)1 && v243)
          {
            v76 = sub_1000D5130();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v257 = v243;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Showing multiway controller for not-ringing multiway call %@", buf, 0xCu);
            }

            v69 = v243;
            goto LABEL_70;
          }
          if (v7)
          {
            v149 = [(PHInCallRootViewController *)self features];
            if (([v149 shouldShowFullScreenCallWaiting] | v64 | v63 ^ 1))
            {

              goto LABEL_220;
            }
            v182 = [(PHInCallRootViewController *)self features];
            if ([v182 callManagerEnabled])
            {
              v183 = [(PHInCallRootViewController *)self callManager];
              v184 = [v183 presentedFullScreenedCall];

              if (v184)
              {
LABEL_220:
                v185 = sub_1000D5130();
                if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v257 = (PHInCallRootViewController *)v7;
                  v186 = "Showing audio controller for incomingCall %@";
                  v187 = v185;
                  uint32_t v188 = 12;
LABEL_222:
                  _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, v186, buf, v188);
                  goto LABEL_262;
                }
                goto LABEL_262;
              }
            }
            else
            {
            }
LABEL_228:
            if ([(PHInCallRootViewController *)v240 isConversation])
            {
              v192 = sub_1000D5130();
              if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v257 = v240;
                _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_DEFAULT, "Showing multiway controller for sending video call %@", buf, 0xCu);
              }

              v193 = v240;
              goto LABEL_232;
            }
            if (v239 && !v240 && !v238)
            {
              if ([(PHInCallRootViewController *)v239 isScreening]) {
                [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"Showing audio controller for Screening, enabling idleTimer"];
              }
              v194 = sub_1000D5130();
              if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v257 = v239;
                _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, "Showing audio controller for active audio call %@", buf, 0xCu);
              }

              p_super = 0;
              LODWORD(v73) = 1;
LABEL_290:
              v217 = [(PHInCallRootViewController *)self features];
              unsigned int v218 = [v217 callManagerEnabled];
              if ((v73 & 1) == 0 && v218)
              {
                v219 = [(PHInCallRootViewController *)self callManager];
                uint64_t v73 = [v219 presentedFullScreenedCall];

                if (v73) {
                  goto LABEL_71;
                }
                v217 = [(PHInCallRootViewController *)self callManager];
                [v217 cleanUp];
              }

              goto LABEL_72;
            }
            v198 = [v51 currentVideoCalls];
            if ([v198 count] == (id)1)
            {
              v199 = [v51 currentVideoCalls];
              v200 = [v199 objectAtIndex:0];
              unsigned __int8 v201 = [v200 isConversation];

              if (v201)
              {
                if (!v238)
                {
                  p_super = 0;
                  goto LABEL_289;
                }
                v202 = sub_1000D5130();
                if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v257 = v238;
                  _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "Showing video controller for active video call %@", buf, 0xCu);
                }

                v193 = v238;
LABEL_232:
                p_super = &v193->super.super.super;
LABEL_289:
                LODWORD(v73) = 0;
                goto LABEL_290;
              }
            }
            else
            {
            }
            v215 = sub_1000D5130();
            if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "Showing video controller", buf, 2u);
            }

            v216 = [v51 currentVideoCalls];
            p_super = [v216 objectAtIndex:0];

            goto LABEL_289;
          }
          if (v63) {
            goto LABEL_228;
          }
          if ([v51 currentCallCount])
          {
            if (v241)
            {
              unsigned int v159 = v241 == self->_emergencyDialerViewController ? v60 : 0;
              if (v159 == 1)
              {
                v160 = sub_1000D5130();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                {
                  v161 = [v51 currentCalls];
                  *(_DWORD *)buf = 138412546;
                  v257 = v161;
                  __int16 v258 = 2112;
                  v259 = v241;
                  _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show emergency viewcontroller for currentCalls %@ (the view controller currently being shown is %@)", buf, 0x16u);
                }
                goto LABEL_177;
              }
            }
            if ([v51 currentCallCount] == (id)1)
            {
              v203 = [v51 currentCalls];
              v204 = [v203 objectAtIndexedSubscript:0];
              unsigned int v205 = [v204 isScreening];

              if (v205) {
                [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"Showing audio controller for Screening, enabling idleTimer"];
              }
            }
            v185 = sub_1000D5130();
            if (!os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_262;
            }
            v206 = [v51 currentCalls];
            *(_DWORD *)buf = 138412546;
            v257 = v206;
            __int16 v258 = 2112;
            v259 = v241;
            _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show audio viewcontroller for currentCalls %@ (the view controller currently being shown is %@)", buf, 0x16u);

LABEL_261:
            goto LABEL_262;
          }
          if (v11)
          {
            v185 = sub_1000D5130();
            if (!os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_262;
            }
            v206 = +[UIApplication sharedApplication];
            v207 = [(PHInCallRootViewController *)v206 delegate];
            v208 = [v207 mostRecentlyDisconnectedAudioCall];
            *(_DWORD *)buf = 138412290;
            v257 = v208;
            _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show audio view controller for disconnected call %@", buf, 0xCu);

            goto LABEL_261;
          }
          if (v234)
          {
            v220 = sub_1000D5130();
            if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
            {
              v221 = +[UIApplication sharedApplication];
              v222 = [v221 delegate];
              v223 = [v222 mostRecentlyDisconnectedVideoCall];
              *(_DWORD *)buf = 138412290;
              v257 = v223;
              _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show video view controller for disconnected call %@", buf, 0xCu);
            }
            v78 = [(PHInCallRootViewController *)self multiwayViewController];
            if ([v78 isOneToOneModeEnabled])
            {
              v224 = +[UIApplication sharedApplication];
              uint64_t v73 = [v224 delegate];
              p_super = [(id)v73 mostRecentlyDisconnectedVideoCall];

              LODWORD(v73) = 0;
              unsigned int v74 = 0;
              uint64_t v75 = 0;
              unsigned int v246 = 0;
LABEL_304:
              unsigned int v244 = 0;
LABEL_77:

              goto LABEL_79;
            }
          }
          else
          {
            if (![(PHInCallRootViewController *)self shouldShowVideoCallBlockAndReportScreen])
            {
              if (!+[TUCallCapabilities isEmergencyCallbackModeEnabled])
              {
                if (!+[PHSOSViewController isCallBufferDismissalAssertionActive])
                {
                  if ([(PHInCallRootViewController *)self shouldShowSOS])
                  {
                    v228 = sub_1000D5130();
                    if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show sos view controller", buf, 2u);
                    }

                    LODWORD(v73) = 0;
                    unsigned int v74 = 0;
                    p_super = 0;
                    unsigned int v244 = 0;
                    unsigned int v246 = 0;
                    uint64_t v75 = 1;
                  }
                  else if ([(id)qword_100326250 containsObject:@"PHAudioCallViewControllerDismissalAssertionWaitingForIdle"])
                  {
                    v229 = sub_1000D5130();
                    if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController will show audio controller since we're waiting for an idle call state", buf, 2u);
                    }

                    unsigned int v74 = 0;
                    uint64_t v75 = 0;
                    p_super = 0;
                    unsigned int v244 = 0;
                    unsigned int v246 = 0;
                    LODWORD(v73) = 1;
                  }
                  else if ([(id)qword_100326250 containsObject:@"PHUserScoreShowingAssertionReason"])
                  {
                    v230 = sub_1000D5130();
                    if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v230, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show UserFeedback View Controller", buf, 2u);
                    }

                    LODWORD(v73) = 0;
                    unsigned int v74 = 0;
                    uint64_t v75 = 0;
                    p_super = 0;
                    unsigned int v246 = 0;
                    unsigned int v244 = 1;
                  }
                  else
                  {
                    if (v50
                      || ![(id)qword_100326250 containsObject:@"PHAVLessConversationAssertionReason"])
                    {
                      p_super = 0;
                      self = v251;
                      goto LABEL_71;
                    }
                    v231 = sub_1000D5130();
                    if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_DEFAULT, "InCallRootViewController doesn't have any calls but still has an assertion for an AVLess conversation.", buf, 2u);
                    }

                    v232 = +[PHPIPController defaultPIPController];
                    [v232 cancelPIPIfNeeded];

                    LODWORD(v73) = 0;
                    unsigned int v74 = 0;
                    uint64_t v75 = 0;
                    p_super = 0;
                    unsigned int v244 = 0;
                    unsigned int v246 = 0;
                  }
                  self = v251;
LABEL_73:
                  if (!v247) {
                    goto LABEL_79;
                  }
LABEL_74:
                  unsigned int v246 = v66 ^ 1;
                  v77 = sub_1000D5130();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "setting ICSAppDelegate.mostRecentlyDisconnectedVideoCall to nil", buf, 2u);
                  }

                  v78 = +[UIApplication sharedApplication];
                  v79 = [v78 delegate];
                  [v79 setMostRecentlyDisconnectedVideoCall:0];

                  goto LABEL_77;
                }
                v185 = sub_1000D5130();
                if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v186 = "PHInCallRootViewController will show audio controller for call buffer. No call is active right now.";
                  v187 = v185;
                  uint32_t v188 = 2;
                  goto LABEL_222;
                }
LABEL_262:

                unsigned int v74 = 0;
                uint64_t v75 = 0;
                p_super = 0;
                unsigned int v244 = 0;
                unsigned int v246 = 0;
                LODWORD(v73) = 1;
                goto LABEL_73;
              }
              v160 = sub_1000D5130();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show emergency view controller as ECBM is active", buf, 2u);
              }
LABEL_177:

              LODWORD(v73) = 0;
              uint64_t v75 = 0;
              p_super = 0;
              unsigned int v244 = 0;
              unsigned int v246 = 0;
              unsigned int v74 = 1;
              goto LABEL_73;
            }
            v78 = sub_1000D5130();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v225 = +[UIApplication sharedApplication];
              v226 = [v225 delegate];
              v227 = [v226 mostRecentlyDisconnectedVideoCall];
              *(_DWORD *)buf = 138412290;
              v257 = v227;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "updateCallControllerForCurrentState InCallRootViewController will show video view controller for disconnected call %@", buf, 0xCu);
            }
          }
          LODWORD(v73) = 0;
          unsigned int v74 = 0;
          uint64_t v75 = 0;
          unsigned int v246 = 0;
          p_super = 0;
          goto LABEL_304;
        }
      }
      else
      {

        unsigned int v18 = v34;
        uint64_t v7 = v33;
        unsigned __int8 v6 = v35;
        self = v251;
      }
    }

    goto LABEL_30;
  }
  unsigned __int8 v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v257 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This instance of PHInCallRootVC %@ no longer has a window, not continuing with updateCallControllerForCurrentState", buf, 0xCu);
  }
LABEL_284:
}

- (UIViewController)currentViewController
{
  BOOL v3 = [(PHInCallRootViewController *)self audioCallNavigationController];
  id v4 = [v3 view];
  uint64_t v5 = [v4 superview];
  if (v5)
  {
    unsigned __int8 v6 = (void *)v5;
    uint64_t v7 = [(PHInCallRootViewController *)self audioCallNavigationController];
    double v8 = [v7 parentViewController];

    if (v8)
    {
      id v9 = [(PHInCallRootViewController *)self audioCallNavigationController];
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v10 = 56;
  unsigned int v11 = [(PHEmergencyDialerViewController *)self->_emergencyDialerViewController view];
  uint64_t v12 = [v11 superview];
  if (v12)
  {
    unsigned __int8 v13 = (void *)v12;
    int v14 = [(PHEmergencyDialerViewController *)self->_emergencyDialerViewController parentViewController];

    if (v14) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v10 = 64;
  id v15 = [(PHSOSViewController *)self->_sosViewController view];
  uint64_t v16 = [v15 superview];
  if (v16)
  {
    double v17 = (void *)v16;
    unsigned int v18 = [(PHSOSViewController *)self->_sosViewController parentViewController];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v10 = 120;
  double v19 = [(UINavigationController *)self->_videoCallNavigationController view];
  uint64_t v20 = [v19 superview];
  if (!v20)
  {

    goto LABEL_17;
  }
  id v21 = (void *)v20;
  uint64_t v22 = [(UINavigationController *)self->_videoCallNavigationController parentViewController];

  if (v22)
  {
LABEL_19:
    id v9 = *(id *)((char *)&self->super.super.super.isa + v10);
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v10 = 104;
  int v23 = [(PHPTTFullScreenContainerViewController *)self->_pttFullScreenContainerViewController view];
  uint64_t v24 = [v23 superview];
  if (v24)
  {
    unsigned int v25 = (void *)v24;
    v26 = [(PHPTTFullScreenContainerViewController *)self->_pttFullScreenContainerViewController parentViewController];

    if (v26) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v28 = [(PHInCallRootViewController *)self callDetailsNavigationController];
  int v29 = [v28 view];
  uint64_t v30 = [v29 superview];
  if (v30)
  {
    __int16 v31 = (void *)v30;
    unsigned int v32 = [(PHInCallRootViewController *)self callDetailsNavigationController];
    uint64_t v33 = [v32 parentViewController];

    if (v33)
    {
      id v9 = [(PHInCallRootViewController *)self callDetailsNavigationController];
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v9 = 0;
LABEL_20:

  return (UIViewController *)v9;
}

- (BOOL)wantsMiniWindowCoverViewController
{
  BOOL v3 = [(PHInCallRootViewController *)self isDisplayStyleMiniWindow];
  if (v3)
  {
    id v4 = [(PHInCallRootViewController *)self callCenter];
    unsigned __int8 v5 = [v4 hasCurrentCalls];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)showHideMiniWindowViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHInCallRootViewController *)self wantsMiniWindowCoverViewController])
  {
    unsigned __int8 v5 = +[PHPIPController defaultPIPController];
    unsigned int v6 = [v5 isPipped];

    if (v6)
    {
      [(PHInCallRootViewController *)self dismissPIPIfNeededForMiniWindowAnimated:v3];
      return;
    }
    unsigned int v11 = [(PHInCallRootViewController *)self coverViewController];
    if ([v11 isBeingPresented]) {
      goto LABEL_14;
    }
    uint64_t v12 = [(PHInCallRootViewController *)self coverViewController];
    unsigned __int8 v13 = [v12 presentingViewController];
    if (v13)
    {

LABEL_14:
      goto LABEL_15;
    }
    double v17 = [(PHInCallRootViewController *)self parentViewController];
    unsigned int v18 = [v17 view];
    double v19 = [v18 window];

    if (!v19)
    {
LABEL_15:
      int v14 = [(PHInCallRootViewController *)self coverViewController];

      if (v14)
      {
        id v15 = sub_1000D5130();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "InCallRootViewController mini window already visible, updating views", v20, 2u);
        }

        uint64_t v16 = [(PHInCallRootViewController *)self coverViewController];
        [v16 updateViews];
      }
      return;
    }
    [(PHInCallRootViewController *)self presentMiniWindowViewControllerAnimated:v3];
  }
  else
  {
    uint64_t v7 = [(PHInCallRootViewController *)self coverViewController];
    if (v7)
    {
      double v8 = (void *)v7;
      id v9 = [(PHInCallRootViewController *)self coverViewController];
      unsigned __int8 v10 = [v9 isBeingDismissed];

      if ((v10 & 1) == 0)
      {
        [(PHInCallRootViewController *)self dismissMiniWindowViewControllerAnimated:1];
      }
    }
  }
}

- (void)dismissPIPIfNeededForMiniWindowAnimated:(BOOL)a3
{
  unsigned __int8 v5 = +[PHPIPController defaultPIPController];
  unsigned int v6 = [v5 isPIPProxyActiveAndHidden];

  if (v6)
  {
    uint64_t v7 = +[PHPIPController defaultPIPController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1000B8B8C;
    v8[3] = &unk_1002CD918;
    void v8[4] = self;
    BOOL v9 = a3;
    [v7 manuallyStopPIPWithCompletion:v8];
  }
}

- (void)presentMiniWindowViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing mini window", buf, 2u);
  }

  if (!self->_coverViewController)
  {
    unsigned int v6 = [ICSCoverViewController alloc];
    uint64_t v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    double v8 = [(ICSCoverViewController *)v6 initWithCallDisplayStyleManager:v7];
    coverViewController = self->_coverViewController;
    self->_coverViewController = v8;
  }
  unsigned __int8 v10 = [(PHInCallRootViewController *)self coverViewController];
  [v10 setModalPresentationStyle:0];

  unsigned int v11 = [(PHInCallRootViewController *)self coverViewController];
  [v11 setModalTransitionStyle:2];

  uint64_t v12 = [(PHInCallRootViewController *)self coverViewController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B8D10;
  v13[3] = &unk_1002CD518;
  v13[4] = self;
  [(PHInCallRootViewController *)self presentViewController:v12 animated:v3 completion:v13];
}

- (void)dismissMiniWindowViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(PHInCallRootViewController *)self coverViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B8DB0;
  v6[3] = &unk_1002CD518;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:v3 completion:v6];
}

- (BOOL)isDisplayStyleMiniWindow
{
  id v2 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)1;

  return v3;
}

- (void)_showFailureAlertForCall:(id)a3
{
  id v4 = a3;
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHFailureAlertShowingAssertionReason"];
  [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
  unsigned __int8 v5 = [v4 errorAlertTitle];
  unsigned int v6 = [v4 errorAlertMessage];
  uint64_t v7 = +[PHAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
  [(PHInCallRootViewController *)self setFailureAlertController:v7];

  objc_initWeak(&location, self);
  double v8 = +[NSBundle mainBundle];
  BOOL v9 = [v8 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];

  if ([v4 disconnectedReason] == 30
    || [v4 disconnectedReason] == 49)
  {
    unsigned __int8 v10 = [v4 contactIdentifiers];
    if ([v10 count] == (id)1)
    {
      if ([v4 originatingUIType] == 8)
      {

LABEL_12:
        int v23 = +[NSBundle mainBundle];
        uint64_t v12 = [v23 localizedStringForKey:@"NOT_NOW" value:&stru_1002D6110 table:@"InCallService"];

        uint64_t v24 = [(PHInCallRootViewController *)self failureAlertController];
        unsigned int v25 = +[NSBundle mainBundle];
        v26 = [v25 localizedStringForKey:@"SHOW_CONTACT_CARD" value:&stru_1002D6110 table:@"InCallService"];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000B95D0;
        v43[3] = &unk_1002CFFD8;
        id v44 = v4;
        objc_copyWeak(&v45, &location);
        id v27 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v43];
        [v24 addAction:v27];

        objc_destroyWeak(&v45);
        goto LABEL_13;
      }
      BOOL v22 = [v4 originatingUIType] == 9;

      if (v22) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if ([v4 disconnectedReason] == 44)
  {
    unsigned int v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];

    unsigned __int8 v13 = [(PHInCallRootViewController *)self failureAlertController];
    int v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"SIGN_IN" value:&stru_1002D6110 table:@"InCallService"];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000B96CC;
    v41[3] = &unk_1002D0000;
    objc_copyWeak(&v42, &location);
    uint64_t v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v41];
    [v13 addAction:v16];

    objc_destroyWeak(&v42);
  }
  else
  {
    if ([v4 disconnectedReason] != 45) {
      goto LABEL_14;
    }
    double v17 = +[NSBundle mainBundle];
    uint64_t v12 = [v17 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];

    unsigned int v18 = [(PHInCallRootViewController *)self failureAlertController];
    double v19 = +[NSBundle mainBundle];
    uint64_t v20 = [v19 localizedStringForKey:@"SHOW_APP_STORE" value:&stru_1002D6110 table:@"InCallService"];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000B9758;
    v39[3] = &unk_1002D0000;
    objc_copyWeak(&v40, &location);
    id v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v39];
    [v18 addAction:v21];

    objc_destroyWeak(&v40);
  }
LABEL_13:
  BOOL v9 = (void *)v12;
LABEL_14:
  int v28 = [(PHInCallRootViewController *)self failureAlertController];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B989C;
  v37[3] = &unk_1002D0000;
  objc_copyWeak(&v38, &location);
  int v29 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v37];
  [v28 addAction:v29];

  uint64_t v30 = [(PHInCallRootViewController *)self failureAlertController];
  [v30 setDismissalAssertionReason:@"PHFailureAlertShowingAssertionReason"];

  __int16 v31 = sub_1000D5130();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    unsigned int v32 = [v4 errorAlertTitle];
    uint64_t v33 = [v4 errorAlertMessage];
    sub_1001EB8F8(v32, v33, buf, v31);
  }

  unsigned int v34 = [(PHInCallRootViewController *)self presentedViewController];

  if (v34)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000B9938;
    v36[3] = &unk_1002CD518;
    v36[4] = self;
    [(PHInCallRootViewController *)self dismissViewControllerAnimated:0 completion:v36];
  }
  else
  {
    double v35 = [(PHInCallRootViewController *)self failureAlertController];
    [(PHInCallRootViewController *)self presentViewController:v35 animated:1 completion:0];
  }
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (void)_showTelephonyFallbackAlertForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_showTelephonyFallbackAlertForCall", v7, 2u);
  }

  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHFallbackToTelephonyAssertionReason"];
  [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
  unsigned int v6 = [[ICSFallbackToTelephonyAlert alloc] initWithDisconnectedCall:v4];

  [(ICSFallbackToTelephonyAlert *)v6 setCancelAction:&stru_1002D0020];
  [(ICSFallbackToTelephonyAlert *)v6 show];
}

- (void)showFailureOrFallbackAlertIfNecessaryForCall:(id)a3
{
  id v5 = a3;
  if ([v5 shouldShowFailureAlert])
  {
    id v4 = [(PHInCallRootViewController *)self failureAlertController];
    if (v4)
    {
    }
    else if (!+[PHInCallUIUtilities isSpringBoardPasscodeLocked])
    {
      [(PHInCallRootViewController *)self _showFailureAlertForCall:v5];
      goto LABEL_7;
    }
  }
  if ([v5 shouldShowAutomaticTelephonyCallFallback]) {
    [(PHInCallRootViewController *)self _showTelephonyFallbackAlertForCall:v5];
  }
LABEL_7:
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B9BC8;
  v7[3] = &unk_1002CD518;
  id v8 = a4;
  id v6 = v8;
  [(PHInCallRootViewController *)self _transitionFromViewController:a3 toViewController:v6 completion:v7];
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(void))a5;
  unsigned int v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Transitioning from %@ to a new view controller, and setting it as the currentViewController: %@", buf, 0x16u);
  }

  [(PHInCallRootViewController *)self _obtainThenReleaseTransitionAssertion];
  uint64_t v12 = [(PHInCallRootViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [v9 view];
  [v21 setFrame:v14, v16, v18, v20];

  BOOL v22 = [v9 view];
  [v22 setAutoresizingMask:18];

  int v23 = [v9 view];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:1];

  uint64_t v24 = [v9 view];
  [v24 setHidden:0];

  if (v8
    && ([v8 parentViewController],
        unsigned int v25 = (PHInCallRootViewController *)objc_claimAutoreleasedReturnValue(),
        BOOL v26 = v25 == self,
        v25,
        v26))
  {
    [(PHInCallRootViewController *)self addChildViewController:v9];
    [v8 willMoveToParentViewController:0];
    objc_initWeak((id *)buf, self);
    int v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    __int16 v31 = sub_1000BA000;
    unsigned int v32 = &unk_1002D0048;
    id v33 = v8;
    id v34 = v9;
    objc_copyWeak(&v36, (id *)buf);
    double v35 = v10;
    [(PHInCallRootViewController *)self transitionFromViewController:v33 toViewController:v34 duration:5242880 options:0 animations:&v29 completion:0.5];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [v9 willMoveToParentViewController:self];
    id v27 = [(PHInCallRootViewController *)self view];
    int v28 = [v9 view];
    [v27 addSubview:v28];

    [(PHInCallRootViewController *)self addChildViewController:v9];
    [v9 didMoveToParentViewController:self];
    if (v10) {
      v10[2](v10);
    }
  }
  -[PHInCallRootViewController setCurrentViewController:](self, "setCurrentViewController:", v9, v29, v30, v31, v32);
  [(PHInCallRootViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v14 viewDidLoad];
  BOOL v3 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v4 = [v3 callDisplayStyle];

  if (v4 == (id)3) {
    +[UIColor blackColor];
  }
  else {
  id v5 = +[UIColor clearColor];
  }
  id v6 = [(PHInCallRootViewController *)self view];
  [v6 setBackgroundColor:v5];

  uint64_t v7 = [(PHInCallRootViewController *)self view];
  [v7 setOpaque:0];

  id v8 = [(PHInCallRootViewController *)self view];
  id v9 = [v8 layer];
  [v9 setAllowsGroupBlending:0];

  unsigned __int8 v10 = [(PHInCallRootViewController *)self view];
  unsigned int v11 = [v10 layer];
  [v11 setAllowsGroupOpacity:0];

  uint64_t v12 = [(PHInCallRootViewController *)self view];
  double v13 = [(PHInCallRootViewController *)self bannerTapGestureRecognizer];
  [v12 addGestureRecognizer:v13];

  [(PHInCallRootViewController *)self handleScreenTimeActivationIfNecessary];
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
}

- (void)printUI
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHInCallRootViewController *)self view];
    id v5 = [v4 recursiveDescription];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
  [(PHInCallRootViewController *)self performSelector:"printUI" withObject:0 afterDelay:30.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[UIApplication sharedApplication];
    uint64_t v7 = [v6 delegate];
    id v8 = [v7 currentInCallScene];
    [v8 presentationMode];
    id v9 = SBSInCallPresentationModeDescription();
    *(_DWORD *)buf = 134218242;
    unsigned int v32 = self;
    __int16 v33 = 2114;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewWillAppear presentationMode: %{public}@", buf, 0x16u);
  }
  [(PHInCallRootViewController *)self _testing_viewWillAppear];
  v30.receiver = self;
  v30.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v30 viewWillAppear:v3];
  unsigned __int8 v10 = [(PHInCallRootViewController *)self callCenter];
  id v11 = [v10 currentVideoCallCount];

  if (v11) {
    [(PHInCallRootViewController *)self obtainIdleTimerAssertionWithComment:@"viewWillAppear"];
  }
  uint64_t v12 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v12 setBackgroundStyle:4 withDuration:0.100000001];

  uint64_t v13 = [(PHInCallRootViewController *)self presentedViewController];
  if (!v13) {
    goto LABEL_11;
  }
  objc_super v14 = (void *)v13;
  double v15 = [(PHInCallRootViewController *)self presentedViewController];
  uint64_t v16 = [(PHInCallRootViewController *)self coverViewController];
  if (v15 == (void *)v16)
  {

    goto LABEL_11;
  }
  double v17 = (void *)v16;
  double v18 = [(PHInCallRootViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_11:
    uint64_t v20 = 0;
    goto LABEL_12;
  }
  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker])goto LABEL_13; {
  uint64_t v20 = 1;
  }
LABEL_12:
  [(PHInCallRootViewController *)self setTemporarilyAllowAllStatusBarPills:v20];
LABEL_13:
  [(PHInCallRootViewController *)self pullRelayingCallsIfNecessary];
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  [(PHInCallRootViewController *)self updateAlertActivationReason];
  [(PHInCallRootViewController *)self registerForNotifications];
  id v21 = [(PHInCallRootViewController *)self callCenter];
  BOOL v22 = [v21 routeController];
  int v23 = [v22 routes];
  id v24 = [v23 count];

  if (!v24)
  {
    unsigned int v25 = sub_1000D5130();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Currently have no routes, re-querying...", buf, 2u);
    }

    BOOL v26 = [(PHInCallRootViewController *)self callCenter];
    id v27 = [v26 routeController];
    [v27 requeryRoutes];
  }
  if (self->_multiwayViewController)
  {
    int v28 = +[PHInCallOrientationMonitor sharedInstance];
    id v29 = [v28 lastValidOrientation];

    [(PHInCallRootViewController *)self updateMultiwayDeviceOrientation:v29];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(PHInCallRootViewController *)self view];
    uint64_t v7 = [v6 window];
    id v8 = [v7 windowScene];
    *(_DWORD *)buf = 134218240;
    int v23 = self;
    __int16 v24 = 2048;
    unsigned int v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewDidAppear in windowScene (%p)", buf, 0x16u);
  }
  v21.receiver = self;
  v21.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v21 viewDidAppear:v3];
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, &stru_1002D0068);
  [(PHInCallRootViewController *)self _testing_viewDidAppear];
  [(PHInCallRootViewController *)self _testing_finishedAnimatingIn];
  unsigned __int8 v10 = [(PHInCallRootViewController *)self callCenter];
  uint64_t v11 = [v10 lastDaemonConnectTime];
  if (!v11)
  {

    goto LABEL_9;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [(PHInCallRootViewController *)self callCenter];
  objc_super v14 = [v13 lastDaemonConnectTime];
  [v14 timeIntervalSinceNow];
  if (v15 <= 0.0)
  {
    uint64_t v16 = [(PHInCallRootViewController *)self callCenter];
    double v17 = [v16 lastDaemonConnectTime];
    [v17 timeIntervalSinceNow];
    double v19 = v18;

    if (v19 < -1.0) {
      goto LABEL_8;
    }
LABEL_9:
    dispatch_time_t v20 = dispatch_time(0, 2000000000);
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, &stru_1002D0088);

    goto LABEL_10;
  }

LABEL_8:
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHInitialPresentationAssertionReason"];
LABEL_10:
  [(PHInCallRootViewController *)self setupAutoAnswer];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewWillDisappear", buf, 0xCu);
  }

  [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"viewWillDisappear"];
  v9.receiver = self;
  v9.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v9 viewWillDisappear:v3];
  [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
  int v6 = [(PHInCallRootViewController *)self callCenter];
  id v7 = [v6 currentAudioAndVideoCallCount];

  if (!v7)
  {
    +[PHInCallRootViewController forceClearAllDismissalAssertions];
    if (+[PHSOSViewController isSOSDismissalAssertionActive])
    {
      if (BKSHIDServicesIsSmartCoverClosed() && self->_sosViewController)
      {
        id v8 = [(PHInCallRootViewController *)self sosViewController];
        [v8 deactivateSOSWithSOSDismissalType:1];
      }
    }
  }
  [(PHInCallRootViewController *)self cancelAutoAnswer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    objc_super v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewDidDisappear", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v7 viewDidDisappear:v3];
  [(PHInCallRootViewController *)self dismissViewControllersWithSensitiveInformation];
  if (byte_100326258 == 1)
  {
    int v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via viewDidDisappear", buf, 2u);
    }

    byte_100326258 = 0;
    [(PHInCallRootViewController *)self sendResponseIfNecessaryWithUnhandledEvents:1];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v10 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  objc_super v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "viewDidMoveToWindow %@ window %@", buf, 0x16u);
  }

  unsigned int v8 = [(PHInCallRootViewController *)self hasEverAppearedInWindow];
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  [(PHInCallRootViewController *)self setHasEverAppearedInWindow:v9];
}

- (id)_remoteViewControllerProxy
{
  uint64_t v3 = [(PHInCallRootViewController *)self parentViewController];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(PHInCallRootViewController *)self parentViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    objc_super v7 = [(PHInCallRootViewController *)self parentViewController];
    unsigned int v8 = [v7 _remoteViewControllerProxy];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)requestInCallSceneTransitionToFullScreen
{
  id v2 = [(PHInCallRootViewController *)self inCallWindowScene];

  if (v2) {
    TUDispatchMainIfNecessary();
  }
}

- (void)requestInCallDismissal
{
  [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"requestInCallDismissal"];
  [(PHInCallRootViewController *)self setStatusBarHidden:0 withDuration:0.0];
  uint64_t v3 = +[ICSPreferences sharedPreferences];
  unsigned int v4 = [v3 hasAdoptedModernInCallAPI];

  id v5 = sub_1000D5130();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "About to request InCall dismissal using the scene-based API", buf, 2u);
    }

    [(PHInCallRootViewController *)self dismissInCallPresentationWithDismissalBlock:&stru_1002D00A8];
    objc_super v7 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];

    if (v7)
    {
      unsigned int v8 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
      [v8 dismiss];
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested InCall dismissal using remote view controller proxy", buf, 2u);
    }

    uint64_t v9 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];

    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BB0A0;
      v10[3] = &unk_1002CD518;
      v10[4] = self;
      [(PHInCallRootViewController *)self dismissInCallPresentationWithDismissalBlock:v10];
    }
    else
    {
      [(PHInCallRootViewController *)self setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:1];
    }
  }
}

- (void)dismissInCallPresentationWithDismissalBlock:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requestInCallDismissal", (uint8_t *)buf, 2u);
  }

  BOOL v6 = [(PHInCallRootViewController *)self multiwayViewController];
  unsigned int v7 = [v6 effectsEnabled];

  if (v7)
  {
    unsigned int v8 = [(PHInCallRootViewController *)self callCenter];
    uint64_t v9 = [v8 videoDeviceController];
    unsigned int v10 = [v9 isPreviewRunning];

    if (v10)
    {
      uint64_t v11 = [(PHInCallRootViewController *)self callCenter];
      uint64_t v12 = [v11 videoDeviceController];
      [v12 stopPreview];
    }
  }
  __int16 v13 = +[UIApplication sharedApplication];
  id v14 = [v13 delegate];
  [v14 acquirePreventSuspensionAssertion];

  objc_initWeak(buf, self);
  double v15 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v16 = [v15 callDisplayStyle];

  if (v16 == (id)3)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000BB51C;
    v32[3] = &unk_1002CED28;
    double v17 = &v33;
    objc_copyWeak(&v33, buf);
    double v18 = +[UIApplication sharedApplication];
    double v19 = [v18 delegate];
    dispatch_time_t v20 = [v19 sceneManager];
    objc_super v21 = [v20 ambientScene];
    BOOL v22 = [v21 delegate];
    [v22 setSceneDidDisconnectBlock:v32];
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000BB590;
    v30[3] = &unk_1002CED28;
    double v17 = &v31;
    objc_copyWeak(&v31, buf);
    double v18 = +[UIApplication sharedApplication];
    double v19 = [v18 delegate];
    dispatch_time_t v20 = [v19 currentInCallScene];
    objc_super v21 = [v20 delegate];
    [v21 setSceneDidDisconnectBlock:v30];
  }

  objc_destroyWeak(v17);
  if (byte_100326258 == 1)
  {
    int v23 = sub_1000D5130();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via requestInCallDismissal", v29, 2u);
    }

    byte_100326258 = 0;
    __int16 v24 = [(PHInCallRootViewController *)self currentAlertButtonAction];
    char v25 = byte_100326259;

    if (!v24 && (v25 & 1) == 0)
    {
      BOOL v26 = sub_1000D5130();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v29 = 0;
        id v27 = "dismissing remoteViewControllerProxy via requestInCallDismissal because no currentAlertButtonAction and sh"
              "ouldForceDismiss == NO";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, v29, 2u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    [(PHInCallRootViewController *)self sendResponseIfNecessaryWithUnhandledEvents:1];
    if (byte_100326259 == 1)
    {
      BOOL v26 = sub_1000D5130();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v29 = 0;
        id v27 = "dismissing remoteViewControllerProxy via requestInCallDismissal";
        goto LABEL_20;
      }
LABEL_21:

      v4[2](v4);
      byte_100326259 = 0;
    }
  }
  else
  {
    v4[2](v4);
  }
  int v28 = +[PHPIPController defaultPIPController];
  [v28 resetPipContentViewController];

  objc_destroyWeak(buf);
}

- (void)prepareForDismissal
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Preparing for dismissal by removing current view controllers", v20, 2u);
  }

  unsigned int v4 = [(PHInCallRootViewController *)self features];
  unsigned int v5 = [v4 callManagerEnabled];

  if (v5) {
    [(ICSCallManagerBridge *)self->_callManager cleanUp];
  }
  [(PHInCallRootViewController *)self removeViewController:self->_videoCallNavigationController];
  BOOL v6 = [(PHInCallRootViewController *)self audioCallNavigationController];
  [(PHInCallRootViewController *)self removeViewController:v6];

  [(PHInCallRootViewController *)self removeViewController:self->_multiwayViewController];
  unsigned int v7 = [(PHPhoneRemoteHostViewController *)self->_remoteHostViewController remoteViewController];
  [v7 setDelegate:0];

  remoteHostViewController = self->_remoteHostViewController;
  self->_remoteHostViewController = 0;

  contactsViewController = self->_contactsViewController;
  self->_contactsViewController = 0;

  audioCallNavigationController = self->_audioCallNavigationController;
  self->_audioCallNavigationController = 0;

  audioCallViewController = self->_audioCallViewController;
  self->_audioCallViewController = 0;

  multiwayViewController = self->_multiwayViewController;
  self->_multiwayViewController = 0;

  videoCallNavigationController = self->_videoCallNavigationController;
  self->_videoCallNavigationController = 0;

  -[CNKMultiwayViewControllerProtocol setMediaPipFrameInWindowScene:](self->_multiwayViewController, "setMediaPipFrameInWindowScene:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;

  double v15 = +[NSNotificationCenter defaultCenter];
  [v15 removeObserver:self];
  [(PHInCallRootViewController *)self startObservingAcceptCallButtonTappedWithNotificationCenter:v15];
  id v16 = +[UIApplication sharedApplication];
  double v17 = [v16 delegate];
  [v17 hideCarPlayUI];

  double v18 = [(PHInCallRootViewController *)self callCenter];
  double v19 = [v18 videoDeviceController];
  [v19 stopPreview];

  [(id)objc_opt_class() releaseDismissalAssertionForReason:@"PHMessageComposeViewControllerAssertionReason"];
}

- (void)removeViewController:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 parentViewController];

  if (v3)
  {
    [v5 willMoveToParentViewController:0];
    [v5 removeFromParentViewController];
    if ([v5 isViewLoaded])
    {
      unsigned int v4 = [v5 view];
      [v4 removeFromSuperview];
    }
    [v5 didMoveToParentViewController:0];
  }
}

- (void)animateInWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self view];
  [v5 setAlpha:0.0];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BB9A4;
  v6[3] = &unk_1002CD518;
  v6[4] = self;
  +[UIView animateWithDuration:0x20000 delay:v6 options:v4 animations:0.349999994 completion:0.0];
}

- (void)presentContactsViewControllerForView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CNContactPickerViewController);
  [v5 setAllowsEditing:1];
  [v5 setMode:1];
  BOOL v6 = +[NSPredicate predicateWithValue:1];
  [v5 setPredicateForSelectionOfContact:v6];

  [v5 setCardActions:5];
  [v5 setDelegate:self];
  [(PHInCallRootViewController *)self setContactsViewController:v5];
  if (+[PHUIConfiguration shouldUseFullScreenPeoplePicker])
  {
    unsigned int v7 = self;
    unsigned int v8 = [(PHInCallRootViewController *)v7 presentedViewController];

    uint64_t v9 = v7;
    if (v8)
    {
      uint64_t v9 = [(PHInCallRootViewController *)v7 presentedViewController];
    }
    unsigned int v10 = [(PHInCallRootViewController *)v7 contactsViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BBBC4;
    v14[3] = &unk_1002CD518;
    v14[4] = v7;
    [v9 presentViewController:v10 animated:1 completion:v14];

    uint64_t v11 = [(PHInCallRootViewController *)v7 contactsViewController];
    uint64_t v12 = [v11 presentationController];
    [v12 setDelegate:v7];
  }
  else
  {
    __int16 v13 = [(PHInCallRootViewController *)self contactsViewController];
    [(PHInCallRootViewController *)self presentAsPopover:v13 fromView:v4 completion:0];
  }
  [(PHInCallRootViewController *)self updateDesiredSpringboardBehavior];
}

- (void)forceUpdateCallControllerForFilteredRequest:(id)a3
{
  id v4 = a3;
  if ([(id)qword_100326250 containsObject:@"PHScreenTimeAlertAssertionReason"])
  {
    [(PHInCallRootViewController *)self setFilteredRequest:v4];
    [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  }
}

- (void)presentScreenTimeHostViewController
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHInCallRootViewController *)self filteredRequest];
    *(_DWORD *)buf = 138412290;
    objc_super v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading screen time host view controller for request: %@", buf, 0xCu);
  }
  id v5 = [PHScreenTimeHostViewController alloc];
  BOOL v6 = [(PHInCallRootViewController *)self filteredRequest];
  unsigned int v7 = [(PHScreenTimeHostViewController *)v5 initWithRequest:v6 delegate:self];

  unsigned int v8 = [(PHInCallRootViewController *)self callCenter];
  uint64_t v9 = [v8 currentAudioAndVideoCalls];
  id v10 = [v9 count];

  if (v10)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000BBF2C;
    v18[3] = &unk_1002CDDE0;
    v18[4] = self;
    double v19 = v7;
    [(PHInCallRootViewController *)self presentViewController:v7 animated:1 completion:v18];
    uint64_t v11 = v19;
  }
  else
  {
    uint64_t v12 = [(PHScreenTimeHostViewController *)v7 view];
    [v12 setAlpha:0.0];

    [(PHScreenTimeHostViewController *)v7 willMoveToParentViewController:self];
    __int16 v13 = [(PHInCallRootViewController *)self view];
    id v14 = [(PHScreenTimeHostViewController *)v7 view];
    [v13 addSubview:v14];

    [(PHInCallRootViewController *)self addChildViewController:v7];
    [(PHScreenTimeHostViewController *)v7 didMoveToParentViewController:self];
    [(PHInCallRootViewController *)self setScreenTimeHostViewController:v7];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BBF6C;
    v16[3] = &unk_1002CD518;
    double v17 = v7;
    double v15 = v7;
    +[UIView animateWithDuration:0x10000 delay:v16 options:0 animations:0.15 completion:0.0];
    uint64_t v11 = v17;
  }
}

- (void)prepareToDismissScreenTime
{
}

- (void)dismissScreenTimeAlertHostIfNeeded
{
  uint64_t v3 = [(PHInCallRootViewController *)self screenTimeHostViewController];

  if (v3)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000BC270;
    v20[3] = &unk_1002CD518;
    v20[4] = self;
    id v4 = objc_retainBlock(v20);
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(PHInCallRootViewController *)self screenTimeHostViewController];
      *(_DWORD *)buf = 138412290;
      BOOL v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing screen time view controller: %@", buf, 0xCu);
    }
    unsigned int v7 = [(PHInCallRootViewController *)self presentedViewController];
    unsigned int v8 = [(PHInCallRootViewController *)self screenTimeHostViewController];
    unsigned int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = [(PHInCallRootViewController *)self presentedViewController];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000BC2CC;
      v18[3] = &unk_1002CDCD0;
      v18[4] = self;
      double v19 = v4;
      uint64_t v11 = v4;
      [v10 dismissViewControllerAnimated:1 completion:v18];

      uint64_t v12 = v19;
    }
    else
    {
      __int16 v13 = [(PHInCallRootViewController *)self screenTimeHostViewController];
      [v13 willMoveToParentViewController:0];

      id v16 = v4;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000BC314;
      v17[3] = &unk_1002CD518;
      v17[4] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000BC374;
      v15[3] = &unk_1002CE9D0;
      v15[4] = self;
      id v14 = v4;
      +[UIView animateWithDuration:0x20000 delay:v17 options:v15 animations:0.15 completion:0.0];
      uint64_t v12 = v16;
    }
  }
}

- (void)dismissSOSIfNeeded
{
  id v7 = [(PHInCallRootViewController *)self callCenter];
  if (![v7 hasCurrentCalls])
  {
    uint64_t v3 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    if ([v3 callDisplayStyle] == (id)4
      && +[PHSOSViewController isSOSDismissalAssertionActive])
    {
      id v4 = [(PHInCallRootViewController *)self sosViewController];

      if (v4)
      {
        id v5 = sub_1000D5130();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1001EB968();
        }

        +[ICSCrashReporter simulateCrashReportWithFormat:@"The SOS UI was dismissed even though there were no active calls."];
        BOOL v6 = [(PHInCallRootViewController *)self sosViewController];
        [v6 deactivateSOSWithSOSDismissalType:0];
      }
      return;
    }
  }
}

- (void)presentAsPopover:(id)a3 fromView:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setModalPresentationStyle:7];
  [(PHInCallRootViewController *)self presentViewController:v10 animated:1 completion:v8];

  uint64_t v11 = [v10 popoverPresentationController];
  [v11 setDelegate:self];

  uint64_t v12 = [(PHInCallRootViewController *)self view];
  [v9 bounds];
  [v12 convertRect:v9 fromView:];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_super v21 = [v10 popoverPresentationController];
  [v21 setPermittedArrowDirections:15];

  BOOL v22 = [(PHInCallRootViewController *)self view];
  int v23 = [v10 popoverPresentationController];
  [v23 setSourceView:v22];

  id v24 = [v10 popoverPresentationController];

  [v24 setSourceRect:v14, v16, v18, v20];
}

- (void)willRotate:(id)a3
{
  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker])
  {
    id v9 = [(PHInCallRootViewController *)self presentedViewController];
    if ([v9 isBeingPresented])
    {
    }
    else
    {
      id v4 = [(PHInCallRootViewController *)self presentedViewController];
      unsigned __int8 v5 = [v4 isBeingDismissed];

      if ((v5 & 1) == 0)
      {
        BOOL v6 = [(PHInCallRootViewController *)self presentedViewController];
        id v7 = [(PHInCallRootViewController *)self contactsViewController];
        unsigned int v8 = [v6 isEqual:v7];

        if (v8)
        {
          [(PHInCallRootViewController *)self dismissContactsViewControllerAnimated:0];
        }
        else
        {
          [(PHInCallRootViewController *)self dismissPhoneRemoteViewControllerAnimated:0];
        }
      }
    }
  }
}

- (void)dismissContactsViewController
{
}

- (void)dismissContactsViewControllerAnimated:(BOOL)a3
{
}

- (void)dismissContactsViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PHInCallRootViewController *)self isPresentingContactsViewController])
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v16 = v4;
      __int16 v17 = 1024;
      BOOL v18 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dismissing contactsVC animated %d, hasCompletion: %d", buf, 0xEu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BC9B8;
    v12[3] = &unk_1002D00D0;
    BOOL v14 = v4;
    v12[4] = self;
    id v13 = v6;
    unsigned int v8 = objc_retainBlock(v12);
    id v9 = v8;
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BCAE0;
      v10[3] = &unk_1002CDCD0;
      v10[4] = self;
      uint64_t v11 = v8;
      [(PHInCallRootViewController *)self dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      [(PHInCallRootViewController *)self setTemporarilyAllowAllStatusBarPills:0];
      [(PHInCallRootViewController *)self dismissViewControllerAnimated:0 completion:v9];
    }
  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)dismissContactDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PHInCallRootViewController *)self isPresentingContactDetails])
  {
    unsigned __int8 v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v4 != 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dismissing contact details hasCompletion: %d", buf, 8u);
    }

    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_1000BCC84;
    id v10 = &unk_1002CDCD0;
    uint64_t v11 = self;
    id v12 = v4;
    id v6 = objc_retainBlock(&v7);
    -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v6, v7, v8, v9, v10, v11);
  }
  else if (v4)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)updateRemoteAlertSwipeDismissalStyleForCall:(id)a3
{
  id v7 = a3;
  if (v7 && [v7 status] == 4)
  {
    id v4 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
    unsigned __int8 v5 = v4;
    uint64_t v6 = 0;
  }
  else
  {
    id v4 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
    unsigned __int8 v5 = v4;
    uint64_t v6 = 1;
  }
  [v4 setSwipeDismissalStyle:v6];
}

- (void)updateAlertActivationReason
{
  uint64_t v3 = [(PHInCallRootViewController *)self callCenter];
  id v10 = [v3 incomingCall];

  if (v10
    || ([(PHInCallRootViewController *)self callCenter],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 incomingVideoCall],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v10))
  {
    unsigned __int8 v5 = [(PHInCallRootViewController *)self callCenter];
    uint64_t v6 = [v5 currentCallGroups];
    id v7 = (char *)[v6 count];
    uint64_t v8 = [(PHInCallRootViewController *)self callCenter];
    BOOL v9 = &v7[(void)[v8 currentVideoCallCount]] > (char *)1;
  }
  else
  {
    id v10 = 0;
    BOOL v9 = 0;
  }
  [(PHInCallRootViewController *)self setAlertActivationReason:v9];
  [(PHInCallRootViewController *)self setAlertActivationCall:v10];
}

- (void)updateAlertActivationReasonForCall:(id)a3
{
  id v13 = a3;
  if ((id)[(PHInCallRootViewController *)self alertActivationReason] == (id)1)
  {
    id v4 = [(PHInCallRootViewController *)self alertActivationCall];
    unsigned __int8 v5 = [v4 callUUID];
    uint64_t v6 = [v13 callUUID];
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      unsigned int v8 = [v13 status];
      if (v8 - 5 >= 2)
      {
        if (v8 != 1) {
          goto LABEL_8;
        }
      }
      else
      {
        BOOL v9 = [(PHInCallRootViewController *)self callCenter];
        unsigned __int8 v10 = [v9 hasCurrentCalls];

        if ((v10 & 1) == 0)
        {
          uint64_t v11 = +[PHAudioCallViewController dismissalAssertionReason];
          +[PHInCallRootViewController releaseDismissalAssertionForReason:v11];

          +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
        }
      }
      alertActivationCall = self->_alertActivationCall;
      self->_alertActivationCall = 0;

      self->_alertActivationReason = 0;
    }
  }
LABEL_8:
}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Emergency callback mode changed notification, reassessing dismissal assertions", buf, 2u);
  }

  unsigned int v5 = +[TUCallCapabilities isEmergencyCallbackModeEnabled];
  uint64_t v6 = sub_1000D5130();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "... mode is active, obtaining emergency callback assertion reason", v9, 2u);
    }

    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHEmergencyCallBackModeAssertionReason"];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "... mode is not active, releasing emergency callback assertion reason", v8, 2u);
    }

    +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHEmergencyCallBackModeAssertionReason"];
  }
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
}

- (void)mostRecentlyDisconnectedAudioCallDidClearNotification:(id)a3
{
  if (+[TUCallCapabilities isEmergencyCallbackModeEnabled])
  {
    [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
  }
}

- (void)didChangeDeviceOrientationNotification:(id)a3
{
  if (self->_multiwayViewController)
  {
    id v4 = a3;
    unsigned int v5 = +[PHPIPController defaultPIPController];
    unsigned int v6 = [v5 isPipped];

    BOOL v7 = &off_1002D05C8;
    if (!v6) {
      BOOL v7 = &off_1002D05D0;
    }
    unsigned int v8 = *v7;
    BOOL v9 = [v4 userInfo];

    unsigned __int8 v10 = [v9 objectForKey:v8];

    uint64_t v11 = (int)[v10 intValue];
    [(PHInCallRootViewController *)self updateMultiwayDeviceOrientation:v11];
  }
}

- (void)updateMultiwayDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3)
  {
    id v5 = [(id)objc_opt_class() cnkDeviceOrientationForUIDeviceOrientation:a3];
    multiwayViewController = self->_multiwayViewController;
    [(CNKMultiwayViewControllerProtocol *)multiwayViewController setDeviceOrientation:v5];
  }
}

- (CGSize)preferredPIPContentAspectRatio
{
  uint64_t v3 = [(PHInCallRootViewController *)self multiwayViewController];
  uint64_t v4 = [v3 parentViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    unsigned int v6 = [(PHInCallRootViewController *)self multiwayViewController];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      uint64_t v11 = 0x4059000000000000;
      uint64_t v9 = 0x4059000000000000;
      goto LABEL_7;
    }
    uint64_t v3 = [(PHInCallRootViewController *)self multiwayViewController];
    [v3 preferredPIPContentAspectRatio];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0x4059000000000000;
    uint64_t v9 = 0x4059000000000000;
  }

LABEL_7:
  double v12 = *(double *)&v9;
  double v13 = *(double *)&v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)prepareForDeviceLock
{
}

- (void)prepareForDeviceLockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prepareForDeviceLock started", buf, 2u);
  }

  unsigned int v6 = [(PHInCallRootViewController *)self currentViewController];
  char v7 = +[PHInCallUIUtilities handleNavigationControllerIfNecessary:v6];

  if ([(PHInCallRootViewController *)self viewControllerSupportsEffects:v7])
  {
    uint64_t v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Disabling effects controller due to device lock event", buf, 2u);
    }

    [v7 resetEffectsState];
  }
  unsigned int v9 = [(PHInCallRootViewController *)self isPresentingViewControllerWithSensitiveInformation];
  uint64_t v10 = sub_1000D5130();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dismissing view controllers with sensitive information due to device lock event", buf, 2u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BD5DC;
    v12[3] = &unk_1002CDA98;
    double v13 = v4;
    [(PHInCallRootViewController *)self dismissViewControllersWithSensitiveInformationWithCompletion:v12];
    uint64_t v10 = v13;
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "prepareForDeviceLock completed without dismissal", buf, 2u);
  }
}

- (BOOL)viewControllerSupportsEffects:(id)a3
{
  return [a3 conformsToProtocol:&OBJC_PROTOCOL___CNKFaceTimeInCallControlsEffectsPresentingProtocol];
}

- (BOOL)isPresentingEffectsBrowser
{
  uint64_t v3 = [(PHInCallRootViewController *)self currentViewController];
  id v4 = +[PHInCallUIUtilities handleNavigationControllerIfNecessary:v3];

  if ([(PHInCallRootViewController *)self viewControllerSupportsEffects:v4]) {
    unsigned __int8 v5 = [v4 isPresentingEffectsBrowser];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isPresentingViewControllerWithSensitiveInformation
{
  if ([(PHInCallRootViewController *)self isPresentingEffectsBrowser]
    || [(PHInCallRootViewController *)self isPresentingRemoteHostViewController]
    || [(PHInCallRootViewController *)self isPresentingContactsViewController])
  {
    return 1;
  }

  return [(PHInCallRootViewController *)self isPresentingContactDetails];
}

- (BOOL)isPresentingRemoteHostViewController
{
  id v2 = [(PHInCallRootViewController *)self remoteHostViewController];
  uint64_t v3 = [v2 presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isPresentingContactsViewController
{
  id v2 = [(PHInCallRootViewController *)self contactsViewController];
  uint64_t v3 = [v2 presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isPresentingContactDetails
{
  uint64_t v3 = [(PHInCallRootViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    unsigned int v6 = [(PHInCallRootViewController *)self presentedViewController];
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if (v7)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [(PHInCallRootViewController *)self presentedViewController];
      unsigned int v9 = [v8 viewControllers];

      unsigned __int8 v5 = (char *)[v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v9);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              LOBYTE(v5) = 1;
              goto LABEL_15;
            }
          }
          unsigned __int8 v5 = (char *)[v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)dismissViewControllersWithSensitiveInformation
{
}

- (void)dismissViewControllersWithSensitiveInformationWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dismiss sensitive view controllers: started", buf, 2u);
  }

  unsigned int v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BDBA4;
  v17[3] = &unk_1002CD518;
  char v7 = v6;
  BOOL v18 = v7;
  [(PHInCallRootViewController *)self dismissPhoneRemoteViewControllerAnimated:0 completion:v17];
  dispatch_group_enter(v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BDC18;
  v15[3] = &unk_1002CD518;
  uint64_t v8 = v7;
  long long v16 = v8;
  [(PHInCallRootViewController *)self dismissContactsViewControllerAnimated:0 completion:v15];
  dispatch_group_enter(v8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BDC8C;
  v13[3] = &unk_1002CD518;
  long long v14 = v8;
  unsigned int v9 = v8;
  [(PHInCallRootViewController *)self dismissContactDetailsWithCompletion:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BDD00;
  v11[3] = &unk_1002CDA98;
  id v12 = v4;
  id v10 = v4;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)showKeypadIfPossible
{
  uint64_t v3 = [(PHInCallRootViewController *)self audioCallViewController];

  if (v3)
  {
    id v4 = [(PHInCallRootViewController *)self audioCallViewController];
    [v4 audioCallControlsViewControllerRequestedKeypadPresentation:0];
  }
}

- (BOOL)isShowingHUD
{
  id v2 = [(PHInCallRootViewController *)self multiwayViewController];
  unsigned __int8 v3 = [v2 isShowingHUD];

  return v3;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  uint64_t v8 = [(PHInCallRootViewController *)self presentedViewController];
  [v8 preferredContentSize];
  double v10 = v9;

  BOOL v11 = [(PHInCallRootViewController *)self presentedViewController];
  [v11 setPreferredContentSize:v10, v7 * 0.5];

  id v12 = [(PHInCallRootViewController *)self presentedViewController];
  long long v13 = [(PHInCallRootViewController *)self contactsViewController];

  if (v12 == v13)
  {
    id v15 = +[UIColor whiteColor];
    [v4 setBackgroundColor:];
  }
  else
  {
    id v15 = +[UIColor _externalSystemDarkGrayColor];
    uint64_t v14 = [v15 colorWithAlphaComponent:0.8];
    [v4 setBackgroundColor:v14];

    id v4 = (id)v14;
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v8 = a3;
  id v4 = [v8 presentedViewController];
  unsigned __int8 v5 = [(PHInCallRootViewController *)self contactsViewController];

  if (v4 == v5)
  {
    [v8 setDelegate:0];
    [(PHInCallRootViewController *)self setContactsViewController:0];
  }
  else
  {
    double v6 = [v8 presentedViewController];
    double v7 = [(PHInCallRootViewController *)self remoteHostViewController];

    if (v6 == v7)
    {
      [v8 setDelegate:0];
      [(PHInCallRootViewController *)self setRemoteHostViewController:0];
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  unsigned __int8 v5 = [(PHInCallRootViewController *)self contactsViewController];

  if (v4 == v5)
  {
    [(PHInCallRootViewController *)self setContactsViewController:0];
    [(PHInCallRootViewController *)self setTemporarilyAllowAllStatusBarPills:0];
  }
}

- (void)transitionToVideoCallBasedViewController:(id)a3
{
}

- (void)transitionToVideoCallBasedViewController:(id)a3 shouldUpdatePipSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Transitioning to video-call-based view controller: %@", buf, 0xCu);
  }

  id v8 = [(PHInCallRootViewController *)self currentViewController];
  double v9 = [(PHInCallRootViewController *)self videoCallNavigationController];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    if (v4)
    {
      BOOL v11 = &v36;
      id v36 = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472;
      id v38 = sub_1000BE51C;
      __int16 v39 = &unk_1002CD518;
      id v40 = self;
    }
    else
    {
      BOOL v11 = 0;
    }
    id v12 = objc_retainBlock(v11);
    long long v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not currently showing the video call nav controller, transitioning to it first", buf, 2u);
    }

    uint64_t v14 = [(PHInCallRootViewController *)self videoCallNavigationController];
    id v15 = [v14 view];
    [v15 alpha];
    double v17 = v16;

    if (v17 == 0.0)
    {
      BOOL v18 = [(PHInCallRootViewController *)self videoCallNavigationController];
      double v19 = [v18 view];
      [v19 setAlpha:1.0];

      double v20 = [(PHInCallRootViewController *)self videoCallNavigationController];
      objc_super v21 = [v20 view];
      [v21 layoutIfNeeded];
    }
    BOOL v22 = [(PHInCallRootViewController *)self currentViewController];
    int v23 = [(PHInCallRootViewController *)self videoCallNavigationController];
    [(PHInCallRootViewController *)self _transitionFromViewController:v22 toViewController:v23 completion:v12];

    BOOL v4 = 0;
  }
  id v24 = [(PHInCallRootViewController *)self callForVideoCallBasedViewController:v6];
  char v25 = [(PHInCallRootViewController *)self videoCallNavigationController];
  BOOL v26 = [v25 topViewController];
  unsigned int v27 = [v26 conformsToProtocol:&OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol];

  if (v27)
  {
    int v28 = [(PHInCallRootViewController *)self videoCallNavigationController];
    id v29 = [v28 topViewController];
    objc_super v30 = [v29 call];
  }
  else
  {
    objc_super v30 = 0;
  }
  id v31 = sub_1000D5130();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v43 = v24;
    __int16 v44 = 2112;
    id v45 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Transitioning to multiway view controller for %@, Current displayed active call: %@", buf, 0x16u);
  }

  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol]
    && ([v30 isEqualToCall:v24] & 1) == 0)
  {
    unsigned int v32 = sub_1000D5130();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Replacing existing view controllers with multiway view controller", buf, 2u);
    }

    id v33 = [(PHInCallRootViewController *)self videoCallNavigationController];
    id v41 = v6;
    id v34 = +[NSArray arrayWithObjects:&v41 count:1];
    [v33 setViewControllers:v34 animated:1];
  }
  if (v4)
  {
    double v35 = +[PHPIPController defaultPIPController];
    [v35 updatePIPSize];
  }
}

- (id)callForVideoCallBasedViewController:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol])
  {
    BOOL v4 = [v3 call];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  uint64_t v15 = objc_opt_class();
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v15 count:1];
  BOOL v11 = +[NSSet setWithArray:v10];

  uint64_t v12 = objc_opt_class();
  if (([v11 containsObject:v12] & 1) != 0
    || ([v11 containsObject:objc_opt_class()] & 1) != 0)
  {
    long long v13 = 0;
  }
  else
  {
    long long v13 = [(CNKCrossFadeAnimatorFactory *)self->_animatorFactory makeAnimator];
  }

  return v13;
}

- (void)showCallDetailsView
{
  if ([(PHInCallRootViewController *)self isPresentingCallDetailsView])
  {
    id v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requested details view controller presentation, but it's already presented", buf, 2u);
    }
  }
  else
  {
    BOOL v4 = [(PHInCallRootViewController *)self callDetailsNavigationController];

    if (!v4)
    {
      unsigned __int8 v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating new call details navigation controller to show from the root view controller", v14, 2u);
      }

      id v6 = +[UIApplication sharedApplication];
      double v7 = [v6 delegate];
      id v8 = [v7 bannerPresentationManager];
      id v9 = [(PHInCallRootViewController *)self makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:v8 delegate:self shouldSetControlsManagerInCallDetailsDelegate:1];
      [(PHInCallRootViewController *)self setCallDetailsNavigationController:v9];

      unsigned __int8 v10 = [(PHInCallRootViewController *)self callDetailsNavigationController];
      [v10 setOverrideUserInterfaceStyle:2];
    }
    BOOL v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController transitioning to call details view", v13, 2u);
    }

    id v3 = [(PHInCallRootViewController *)self currentViewController];
    uint64_t v12 = [(PHInCallRootViewController *)self callDetailsNavigationController];
    [(PHInCallRootViewController *)self _transitionFromViewController:v3 toViewController:v12];
  }
}

- (BOOL)isPresentingCallDetailsView
{
  id v3 = [(PHInCallRootViewController *)self callDetailsNavigationController];
  if (v3)
  {
    BOOL v4 = [(PHInCallRootViewController *)self callDetailsNavigationController];
    unsigned __int8 v5 = [v4 view];
    id v6 = [v5 superview];
    if (v6)
    {
      double v7 = [(PHInCallRootViewController *)self callDetailsNavigationController];
      id v8 = [v7 parentViewController];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)presentPhoneRemoteViewControllerForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHInCallRootViewController *)self remoteHostViewController];
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = (void *)v5;
  double v7 = [(PHInCallRootViewController *)self presentedViewController];
  id v8 = [(PHInCallRootViewController *)self remoteHostViewController];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    unsigned __int8 v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(PHInCallRootViewController *)self remoteHostViewController];
      *(_DWORD *)buf = 138412290;
      double v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested Add Call presentation, but we already have a remote view controller: %@", buf, 0xCu);
    }
  }
  else
  {
LABEL_14:
    if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked])
    {
      uint64_t v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requested Add Call presentation, but the device is passcode locked", buf, 2u);
      }
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000BEC14;
      v13[3] = &unk_1002D00F8;
      void v13[4] = self;
      id v14 = v4;
      +[PHPhoneRemoteHostViewController requestViewControllerWithCompletionHandler:v13];
    }
  }
}

- (void)dismissPhoneRemoteViewController
{
}

- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3
{
}

- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PHInCallRootViewController *)self isPresentingRemoteHostViewController])
  {
    double v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v16 = v4;
      __int16 v17 = 1024;
      BOOL v18 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dismissing phoneRemoteVC animated: %d, hasCompletion: %d", buf, 0xEu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BF11C;
    v12[3] = &unk_1002D00D0;
    BOOL v14 = v4;
    void v12[4] = self;
    id v13 = v6;
    id v8 = objc_retainBlock(v12);
    unsigned int v9 = v8;
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BF244;
      v10[3] = &unk_1002CDCD0;
      v10[4] = self;
      BOOL v11 = v8;
      [(PHInCallRootViewController *)self dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      [(PHInCallRootViewController *)self setTemporarilyAllowAllStatusBarPills:0];
      [(PHInCallRootViewController *)self dismissViewControllerAnimated:0 completion:v9];
    }
  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localizedDescription];
    int v8 = 138412290;
    unsigned int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController: Remote view service terminated with error: %@", (uint8_t *)&v8, 0xCu);
  }
  if ([v4 code] != (id)1)
  {
    double v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController: Remote view service was not cancelled, so dismissing remote view controller", (uint8_t *)&v8, 2u);
    }

    [(PHInCallRootViewController *)self dismissPhoneRemoteViewControllerAnimated:0];
  }
}

- (void)setBackgroundStyle:(int64_t)a3 animatedWithDuration:(double)a4
{
  id v6 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v6 setBackgroundStyle:a3 withDuration:a4];
}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  double v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    unsigned int v9 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
    int v11 = 138412546;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    BOOL v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request to set status bar hidden %@ on %@", (uint8_t *)&v11, 0x16u);
  }
  unsigned __int8 v10 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v10 setStatusBarHidden:v5 withDuration:a4];

  [(PHInCallRootViewController *)self setShouldHideStatusBar:v5];
  [(PHInCallRootViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)phoneRemoteHostViewControllerDidDismiss
{
  [(PHInCallRootViewController *)self setTemporarilyAllowAllStatusBarPills:0];
  [(PHInCallRootViewController *)self setRemoteHostViewController:0];

  [(PHInCallRootViewController *)self updateDesiredSpringboardBehavior];
}

+ (void)obtainDismissalAssertionForReason:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)qword_100326250 containsObject:v3];
  BOOL v5 = sub_1000D5130();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EBA80((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Obtaining Dismissal Assertion for reason: %@", (uint8_t *)&v21, 0xCu);
    }

    [(id)qword_100326250 addObject:v3];
  }
  __int16 v13 = sub_1000D5130();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1001EBA08(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

+ (void)releaseDismissalAssertionForReason:(id)a3
{
  id v3 = a3;
  if ([(id)qword_100326250 containsObject:v3])
  {
    [(id)qword_100326250 removeObject:v3];
    unsigned __int8 v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = qword_100326250;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing Dismissal Assertion %@. Remaining assertions are: %@", buf, 0x16u);
    }

    BOOL v5 = +[NSSet setWithObject:v3, @"PHReleasedAssertionKey"];
    uint64_t v9 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"PHDismissalAssertionReleasedNotification" object:0 userInfo:v6];
  }
}

+ (void)releaseDismissalAssertionReasons:(id)a3
{
  id v3 = a3;
  id v4 = [(id)qword_100326250 copy];
  unsigned int v5 = [v4 intersectsSet:v3];

  if (v5)
  {
    [(id)qword_100326250 minusSet:v3];
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = qword_100326250;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Releasing Dismissal Assertion Reasons %@. Remaining assertions are: %@", buf, 0x16u);
    }

    CFStringRef v9 = @"PHReleasedAssertionKey";
    id v10 = v3;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"PHDismissalAssertionReleasedNotification" object:0 userInfo:v7];
  }
}

+ (BOOL)containsDismissalAssertionForReason:(id)a3
{
  return [(id)qword_100326250 containsObject:a3];
}

+ (void)forceClearAllDismissalAssertions
{
  id v2 = +[PHSOSViewController getSetOfSOSDismissalAssertions];
  id v3 = [(id)qword_100326250 mutableCopy];
  [v3 minusSet:v2];
  if ([(id)qword_100326250 count])
  {
    [(id)qword_100326250 intersectSet:v2];
    CFStringRef v8 = @"PHReleasedAssertionKey";
    id v9 = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    unsigned int v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"PHDismissalAssertionReleasedNotification" object:0 userInfo:v4];

    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Force clearing dismissal assertions besides PHSOSCallAssertionReason", v7, 2u);
    }
  }
}

- (void)dismissalAssertionReleasedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    int v23 = self;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v22, 0x16u);
  }

  id v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[PHInCallRootViewController dismissalAssertions];
    int v22 = 138412290;
    int v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The remaining dismissal assertions are %@", (uint8_t *)&v22, 0xCu);
  }
  CFStringRef v8 = [v4 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"PHReleasedAssertionKey"];

  if (+[PHInCallRootViewController hasDismissalAssertions])
  {
    if (+[PHSOSViewController isSOSDismissalAssertionActive])
    {
      id v10 = +[PHSOSViewController getSetOfSOSDismissalAssertions];
      if ([v9 intersectsSet:v10])
      {
        sosViewController = self->_sosViewController;

        if (sosViewController)
        {
          id v12 = self->_sosViewController;
LABEL_12:
          self->_sosViewController = 0;

          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    else
    {
      id v12 = self->_sosViewController;
      if (v12) {
        goto LABEL_12;
      }
    }
    if ([(PHInCallRootViewController *)self shouldReleaseAudioCallViewController])
    {
      __int16 v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        int v23 = (PHInCallRootViewController *)qword_100326250;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Releasing the audio call view controller based on current dismissal assertions: %@", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v14 = [(PHInCallRootViewController *)self features];
      unsigned int v15 = [v14 callManagerEnabled];

      if (v15)
      {
        uint64_t v16 = [(PHInCallRootViewController *)self callManager];
        [v16 cleanUp];
      }
      uint64_t v17 = [(PHInCallRootViewController *)self audioCallNavigationController];
      [(PHInCallRootViewController *)self removeViewController:v17];

      audioCallNavigationController = self->_audioCallNavigationController;
      self->_audioCallNavigationController = 0;

      audioCallViewController = self->_audioCallViewController;
      self->_audioCallViewController = 0;
    }
    else if ([(id)qword_100326250 count] == (id)1 {
           && [(id)qword_100326250 containsObject:@"PHMessageComposeViewControllerAssertionReason"])
    }
    {
      [(PHInCallRootViewController *)self releaseIdleTimerAssertionWithComment:@"only showing message compose"];
    }
  }
  else
  {
    [(PHInCallRootViewController *)self requestInCallDismissal];
  }
LABEL_23:
  if ([v9 containsObject:@"PHInitialPTTFullScreenPresentationAssertionReason"]
    && self->_pttFullScreenContainerViewController)
  {
    uint64_t v20 = sub_1000D5130();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Releasing the PushToTalk view controller.", (uint8_t *)&v22, 2u);
    }

    [(PHInCallRootViewController *)self removeViewController:self->_pttFullScreenContainerViewController];
    pttFullScreenContainerViewController = self->_pttFullScreenContainerViewController;
    self->_pttFullScreenContainerViewController = 0;
  }
  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
}

- (BOOL)shouldReleaseAudioCallViewController
{
  id v3 = (void *)qword_100326250;
  id v4 = +[PHAudioCallViewController dismissalAssertionReason];
  if (([v3 containsObject:v4] & 1) != 0
    || ([(id)qword_100326250 containsObject:@"PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"] & 1) != 0|| (objc_msgSend((id)qword_100326250, "containsObject:", @"PHFailureAlertShowingAssertionReason") & 1) != 0|| (objc_msgSend((id)qword_100326250, "containsObject:", @"PHFallbackToTelephonyAssertionReason") & 1) != 0|| (objc_msgSend((id)qword_100326250, "containsObject:", @"PHMessageComposeViewControllerAssertionReason") & 1) != 0|| (objc_msgSend((id)qword_100326250, "containsObject:", @"PHCallEndedBlockAndReportInProgressAssertionReason") & 1) != 0
    || ([(id)qword_100326250 containsObject:@"PHAudioCallViewControllerDismissalAssertionWaitingForIdle"] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v7 = [(PHInCallRootViewController *)self currentViewController];
    CFStringRef v8 = [(PHInCallRootViewController *)self audioCallNavigationController];
    if (v7 == v8)
    {
      BOOL v5 = 0;
    }
    else
    {
      id v9 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
      BOOL v5 = v9 != 0;
    }
  }

  return v5;
}

+ (NSSet)dismissalAssertions
{
  return (NSSet *)(id)qword_100326250;
}

+ (BOOL)hasDismissalAssertions
{
  return [(id)qword_100326250 count] != 0;
}

- (void)obtainIdleTimerAssertionWithComment:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v6 setIdleTimerDisabled:1 forReason:@"PHIdleTimerDisabledReason"];

  uint64_t v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 == (id)3)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion on ambient scene: %@", (uint8_t *)&v13, 0xCu);
    }

    [(PHInCallRootViewController *)self ambientSetIdleTimerDisabled:1];
  }
  else
  {
    id v10 = [(PHInCallRootViewController *)self inCallWindowScene];

    if (v10)
    {
      id v11 = sub_1000D5130();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion on window scene: %@", (uint8_t *)&v13, 0xCu);
      }

      id v12 = [(PHInCallRootViewController *)self inCallWindowScene];
      [v12 setIdleTimerDisabled:1];
    }
  }
}

- (void)releaseIdleTimerAssertionWithComment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"PHIdleTimerDisabledReason"];

  id v6 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v7 = [v6 callDisplayStyle];

  if (v7 == (id)3)
  {
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion on ambient scene: %@", (uint8_t *)&v13, 0xCu);
    }

    [(PHInCallRootViewController *)self ambientSetIdleTimerDisabled:0];
  }
  else
  {
    id v9 = [(PHInCallRootViewController *)self inCallWindowScene];

    if (v9)
    {
      id v10 = [(PHInCallRootViewController *)self inCallWindowScene];
      [v10 setIdleTimerDisabled:0];

      id v11 = sub_1000D5130();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion on window scene: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  id v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion: %@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)pullRelayingCallsIfNecessary
{
  id v3 = [(PHInCallRootViewController *)self callCenter];
  id v4 = [v3 routeController];
  BOOL v5 = [v4 pickedRoute];

  id v6 = [(PHInCallRootViewController *)self callCenter];
  unsigned int v7 = [v6 anyCallPassesTest:&stru_1002D0118];

  id v8 = [v5 deviceType];
  id v9 = sub_1000D5130();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != (id)13 || (v7 & 1) != 0)
  {
    if (v10)
    {
      int v11 = 67109376;
      LODWORD(v12[0]) = v7;
      WORD2(v12[0]) = 2048;
      *(void *)((char *)v12 + 6) = [v5 deviceType];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not pulling any relay calls (incomingCallExists: %d, pickedRouteDeviceType: %ld)", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 138412290;
      v12[0] = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pulling all relaying calls from device: %@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = [(PHInCallRootViewController *)self callCenter];
    [v9 pullRelayingCallsFromClient];
  }
}

- (void)handleActivationForEndAndLock
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleActivationForEndAndLock", buf, 2u);
  }

  id v4 = [(PHInCallRootViewController *)self callCenter];
  BOOL v5 = [v4 routeController];
  id v6 = [v5 pickedRoute];
  unsigned int v7 = [v6 isReceiver];

  id v8 = [(PHInCallRootViewController *)self callCenter];
  id v9 = v8;
  if (v7)
  {
    if ([v8 hasCurrentCalls])
    {
      BOOL v10 = +[PHInCallUtilities sharedInstance];
      unsigned int v11 = [v10 isLockToEndCallEnabled];

      if (v11)
      {
        id v12 = sub_1000D5130();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ending call on lock event", buf, 2u);
        }

        byte_100326258 = 1;
        int v13 = [(PHInCallRootViewController *)self callCenter];
        [v13 disconnectAllCalls];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = [(PHInCallRootViewController *)self callCenter];
        unsigned int v15 = [v14 currentVideoCalls];

        id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v19);
              int v21 = [(PHInCallRootViewController *)self callCenter];
              [v21 disconnectCall:v20];

              uint64_t v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
          }
          while (v17);
        }

        return;
      }
    }
    else
    {
    }
    BOOL v26 = sub_1000D5130();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = +[PHInCallUtilities sharedInstance];
      unsigned int v28 = [v27 isLockToEndCallEnabled];
      *(_DWORD *)buf = 67109120;
      unsigned int v34 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via handleActivationForEndAndLock - Receiver route is picked, but there are no active calls or AX setting to ignore is on: %d", buf, 8u);
    }
    byte_100326258 = 0;
LABEL_24:
    [(PHInCallRootViewController *)self sendResponseIfNecessaryWithUnhandledEvents:1];
    return;
  }
  unsigned int v22 = [v8 hasCurrentVideoCalls];

  int v23 = sub_1000D5130();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disconnecting video calls due to lock button press", buf, 2u);
    }

    id v25 = [(PHInCallRootViewController *)self callCenter];
    [v25 disconnectAllCalls];

    goto LABEL_24;
  }
  if (v24)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via handleActivationForEndAndLock - Not ending call on lock event because audio route is handset", buf, 2u);
  }

  byte_100326258 = 0;
  [(PHInCallRootViewController *)self sendResponseIfNecessaryWithUnhandledEvents:1];
  +[PHInCallRootViewController forceClearAllDismissalAssertions];
}

- (BOOL)shouldConsumeDeviceLockEvent
{
  unsigned __int8 v2 = +[PHSOSViewController isSOSDismissalAssertionActive];
  return v2 & 1 | ((byte_100326258 & 1) == 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHInCallRootViewController;
  [(PHInCallRootViewController *)&v8 traitCollectionDidChange:a3];
  id v4 = [(PHInCallRootViewController *)self traitCollection];
  id v5 = [v4 _backlightLuminance];

  if (v5 == (id)1)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Screen entered into reduced luminance. Prepare for device lock", v7, 2u);
    }

    [(PHInCallRootViewController *)self prepareForDeviceLock];
  }
}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  unsigned int v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController handleDeviceLockEventWithSourceType %ld started", buf, 0xCu);
  }

  if (!a3)
  {
    id v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received device lock event with unknown source type, not handing off to child view controllers", buf, 2u);
    }

    [(PHInCallRootViewController *)self prepareForDeviceLock];
    v6[2](v6, 0);
    goto LABEL_37;
  }
  [(PHInCallRootViewController *)self cancelAutoAnswer];
  objc_super v8 = [(PHInCallRootViewController *)self audioCallNavigationController];
  id v9 = [v8 view];
  BOOL v10 = [v9 superview];
  if (v10)
  {
    unsigned int v11 = [(PHInCallRootViewController *)self audioCallNavigationController];
    id v12 = [v11 parentViewController];
    BOOL v13 = v12 == 0;

    if (v13) {
      goto LABEL_12;
    }
    objc_super v8 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
    [v8 handleDeviceLockEventWithSourceType:a3];
  }
  else
  {
  }
LABEL_12:
  unsigned int v15 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController view];
  id v16 = [v15 superview];
  if (!v16)
  {

    goto LABEL_21;
  }
  id v17 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController parentViewController];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    if (([(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController isOneToOneModeEnabled] & 1) == 0)
    {
      uint64_t v19 = [(PHInCallRootViewController *)self featureFlags];
      if ([v19 conversationOneToOneModeEnabled])
      {
        uint64_t v20 = [(PHInCallRootViewController *)self callCenter];
        int v21 = [v20 incomingVideoCall];
        BOOL v22 = v21 == 0;

        if (!v22) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss];
      goto LABEL_21;
    }
LABEL_17:
    [(PHInCallRootViewController *)self handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:a3];
  }
LABEL_21:
  if ([(PHInCallRootViewController *)self isPresentingViewControllerWithSensitiveInformation])
  {
    objc_initWeak((id *)buf, self);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000C0EEC;
    v33[3] = &unk_1002CD7E8;
    objc_copyWeak(&v35, (id *)buf);
    unsigned int v34 = v6;
    int v23 = objc_retainBlock(v33);
    BOOL v24 = [(PHInCallRootViewController *)self transitionCoordinator];

    if (v24)
    {
      id v25 = sub_1000D5130();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device lock event received while transitioning a view controller with sensitive information. Delaying lock until transition is complete.", v32, 2u);
      }

      BOOL v26 = [(PHInCallRootViewController *)self transitionCoordinator];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000C10A4;
      v30[3] = &unk_1002D0140;
      long long v31 = v23;
      [v26 animateAlongsideTransition:0 completion:v30];

      [(PHInCallRootViewController *)self dismissViewControllersWithSensitiveInformation];
LABEL_30:

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
      goto LABEL_37;
    }
    if ([(PHInCallRootViewController *)self shouldConsumeDeviceLockEvent])
    {
      unsigned int v27 = sub_1000D5130();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "We are requesting lock events due to ICS showing view controllers with sensitive information, allow the screen to be locked", v32, 2u);
      }

      ((void (*)(void *))v23[2])(v23);
      goto LABEL_30;
    }

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  BOOL v28 = [(PHInCallRootViewController *)self shouldConsumeDeviceLockEvent];
  long long v29 = sub_1000D5130();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController handleDeviceLockEventWithSourceType shouldConsumeDeviceLockEvent %d", buf, 8u);
  }

  if (!v28) {
    [(PHInCallRootViewController *)self prepareForDeviceLock];
  }
  v6[2](v6, v28);
LABEL_37:
}

- (void)handleLockButtonPressed
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleLockButtonPressed", v5, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"kPHHardwareButtonEventType";
  CFStringRef v7 = @"kPHHardwareButtonEventTypeLockButton";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"PHHardwareButtonEventNotification" object:0 userInfo:v4];
}

- (void)handleVolumeUpButtonPressed
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleVolumeUpButtonPressed", v5, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"kPHHardwareButtonEventType";
  CFStringRef v7 = @"kPHHardwareButtonEventTypeVolumeUpButton";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"PHHardwareButtonEventNotification" object:0 userInfo:v4];
}

- (void)handleVolumeDownButtonPressed
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleVolumeDownButtonPressed", v5, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"kPHHardwareButtonEventType";
  CFStringRef v7 = @"kPHHardwareButtonEventTypeVolumeDownButton";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"PHHardwareButtonEventNotification" object:0 userInfo:v4];
}

- (void)handleHeadsetButtonPressed
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleHeadsetButtonPressed", v5, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"kPHHardwareButtonEventType";
  CFStringRef v7 = @"kPHHardwareButtonEventTypeHeadsetButton";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"PHHardwareButtonEventNotification" object:0 userInfo:v4];
}

- (void)handleHeadsetButtonLongPressed
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleHeadsetButtonLongPressed", v5, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"kPHHardwareButtonEventType";
  CFStringRef v7 = @"kPHHardwareButtonEventTypeHeadsetButtonLongPress";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"PHHardwareButtonEventNotification" object:0 userInfo:v4];
}

- (void)statusBarTappedInFullScreen
{
  id v5 = [(PHInCallRootViewController *)self callManager];
  id v3 = [(PHInCallRootViewController *)self callCenter];
  id v4 = [v3 frontmostAudioOrVideoCall];
  [v5 prioritizeCall:v4];
}

- (void)handleDoubleHeightStatusBarTap
{
  [(PHInCallRootViewController *)self dismissPhoneRemoteViewController];
  [(PHInCallRootViewController *)self dismissContactsViewController];

  [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
}

- (unint64_t)desiredButtonEventsForCallContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];

  if (v5)
  {
    uint64_t v6 = [(PHInCallRootViewController *)self desiresLockButtonEventsForCallContainer:v4];
    CFStringRef v7 = [v4 incomingCall];

    uint64_t v8 = v6 | 6;
    if (!v7) {
      uint64_t v8 = v6;
    }
    unint64_t v9 = v8 | 0x28;
    BOOL v10 = sub_1000D5130();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v13 = 134217984;
    unint64_t v14 = v9;
    unsigned int v11 = "Audio controller requesting button events %ld";
    goto LABEL_12;
  }
  if (!self->_multiwayViewController)
  {
    unint64_t v9 = 0;
    goto LABEL_14;
  }
  if ([(PHInCallRootViewController *)self desiresLockAndVolumeButtonEventsForCallContainer:v4])
  {
    unint64_t v9 = 47;
  }
  else
  {
    unint64_t v9 = 40;
  }
  BOOL v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = v9;
    unsigned int v11 = "Video controller requesting button events %ld";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
  }
LABEL_13:

LABEL_14:
  return v9;
}

- (unint64_t)desiredSceneButtonEventsForCallContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];

  if (v5)
  {
    uint64_t v6 = [v4 incomingCall];

    if (v6) {
      unint64_t v7 = 30;
    }
    else {
      unint64_t v7 = 24;
    }
    uint64_t v8 = sub_1000D5130();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v11 = 134217984;
    unint64_t v12 = v7;
    unint64_t v9 = "Audio controller requesting scene button events %ld";
    goto LABEL_13;
  }
  if (!self->_multiwayViewController)
  {
    unint64_t v7 = 0;
    goto LABEL_15;
  }
  if ([(PHInCallRootViewController *)self desiresLockAndVolumeButtonEventsForCallContainer:v4])
  {
    unint64_t v7 = 30;
  }
  else
  {
    unint64_t v7 = 24;
  }
  uint64_t v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = v7;
    unint64_t v9 = "Video controller requesting scene button events %ld";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
  }
LABEL_14:

LABEL_15:
  return v7;
}

- (BOOL)desiresLockAndVolumeButtonEventsForCallContainer:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];
  uint64_t v6 = [v5 incomingVideoCallUsingCallContainer:v3];

  return v6 != 0;
}

- (BOOL)isPickedRouteReceiver
{
  unsigned __int8 v2 = [(PHInCallRootViewController *)self callCenter];
  id v3 = [v2 routeController];
  id v4 = [v3 pickedRoute];
  unsigned __int8 v5 = [v4 isReceiver];

  return v5;
}

- (BOOL)desiresLockButtonEventsForCallContainer:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 incomingCall];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else if ([v4 currentCallCount])
  {
    BOOL v6 = [(PHInCallRootViewController *)self isPickedRouteReceiver];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)hardwareButtonEventNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 userInfo];
    int v17 = 138412290;
    BOOL v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController received a hardware button event (%@)", (uint8_t *)&v17, 0xCu);
  }
  unint64_t v7 = [(PHInCallRootViewController *)self featureFlags];
  if (![(__CFString *)v7 conversationOneToOneModeEnabled]
    || ![(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController isViewLoaded])
  {
    goto LABEL_15;
  }
  uint64_t v8 = [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController view];
  unint64_t v9 = [v8 window];

  if (v9)
  {
    BOOL v10 = [v4 userInfo];
    unint64_t v7 = [v10 valueForKey:@"kPHHardwareButtonEventType"];

    int v11 = +[UIApplication sharedApplication];
    unint64_t v12 = [v11 delegate];
    int v13 = [(PHInCallRootViewController *)self callCenter];
    unint64_t v14 = [v12 incomingVideoCallUsingCallContainer:v13];

    if (v7 == @"kPHHardwareButtonEventTypeVolumeDownButton"
      || v7 == @"kPHHardwareButtonEventTypeVolumeUpButton")
    {
      [v14 suppressRingtone];
    }
    else
    {
      if (v7 == @"kPHHardwareButtonEventTypeHeadsetButton")
      {
        unsigned int v15 = +[UIApplication sharedApplication];
        id v16 = [v15 delegate];
        [v16 handleHeadsetButtonPressForCall:v14 sourceIdentifier:0];

        goto LABEL_13;
      }
      if (v7 == @"kPHHardwareButtonEventTypeHeadsetButtonLongPress")
      {
        unsigned int v15 = [(PHInCallRootViewController *)self callCenter];
        [v15 handleActionForWiredHeadsetMiddleButtonLongPress];
LABEL_13:
      }
    }

LABEL_15:
  }
}

- (void)updateDesiredSpringboardBehavior
{
  id v3 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
  if (v3)
  {
    id v4 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
    unint64_t v5 = (unint64_t)[v4 allowsOrientationChangeEvents];
  }
  else
  {
    unint64_t v5 = self->_multiwayViewController != 0;
  }
  BOOL v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 67109120;
    int v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting allowsOrientationChangeEvents to %d", (uint8_t *)&v36, 8u);
  }

  unint64_t v7 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v7 setOrientationChangedEventsEnabled:v5];

  uint64_t v8 = [(PHInCallRootViewController *)self callCenter];
  unint64_t v9 = [(PHInCallRootViewController *)self desiredButtonEventsForCallContainer:v8];
  unint64_t v10 = [(PHSOSViewController *)self->_sosViewController desiredButtonEvents] | v9;

  int v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 67109120;
    int v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting desired hardware buttons to %d", (uint8_t *)&v36, 8u);
  }

  unint64_t v12 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v12 setDesiredHardwareButtonEvents:v10];

  int v13 = [(PHInCallRootViewController *)self inCallWindowScene];

  if (v13)
  {
    BOOL v14 = [(PHInCallRootViewController *)self desiresLockButtonEvents];
    unsigned int v15 = [(PHInCallRootViewController *)self callCenter];
    unint64_t v16 = [(PHInCallRootViewController *)self desiredSceneButtonEventsForCallContainer:v15];
    unint64_t v17 = [(PHSOSViewController *)self->_sosViewController desiredSceneButtonEvents] | v16;

    BOOL v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 67109376;
      int v37 = v17;
      __int16 v38 = 1024;
      BOOL v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting scenes desired button events to %d and desires lock button events to %d", (uint8_t *)&v36, 0xEu);
    }

    uint64_t v19 = [(PHInCallRootViewController *)self inCallWindowScene];
    [v19 setSupportsDeviceLockEvents:v14];

    uint64_t v20 = [(PHInCallRootViewController *)self inCallWindowScene];
    [v20 setPreferredHardwareButtonEventTypes:v17];

    [(PHInCallRootViewController *)self updateInCallWindowScenePrefersHiddenWhenDismissed];
    [(PHInCallRootViewController *)self updateInCallWindowSceneFaceTimeLaunchBehavior];
  }
  if (v3) {
    unsigned int v21 = [v3 allowsMenuButtonDismissal];
  }
  else {
    unsigned int v21 = 1;
  }
  sosViewController = self->_sosViewController;
  if (sosViewController) {
    unsigned int v23 = [(PHSOSViewController *)sosViewController allowsMenuButtonDismissal];
  }
  else {
    unsigned int v23 = 1;
  }
  uint64_t v24 = v21 & v23;
  id v25 = sub_1000D5130();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 67109120;
    int v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Setting allows menu button dismissal to %d", (uint8_t *)&v36, 8u);
  }

  BOOL v26 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v26 setAllowsMenuButtonDismissal:v24];

  [(PHInCallRootViewController *)self setAllowHomeOutDismissal:v24];
  [(PHInCallRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  if (v3)
  {
    id v27 = [v3 allowsOtherAlertsToStackOnTop];
    BOOL v28 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
    [v28 setAllowsAlertStacking:v27];

    uint64_t v29 = (uint64_t)[v3 allowsBanners];
  }
  else
  {
    long long v30 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
    uint64_t v29 = 1;
    [v30 setAllowsAlertStacking:1];
  }
  long long v31 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v31 setAllowsBanners:v29];

  if (([v3 wantsApplicationDismissalStyle] & 1) != 0
    || [(CNKMultiwayViewControllerProtocol *)self->_multiwayViewController wantsApplicationDismissalStyle])
  {
    if (self->_sosViewController) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = 2;
    }
  }
  else
  {
    uint64_t v32 = 1;
  }
  id v33 = [(PHInCallRootViewController *)self _remoteViewControllerProxy];
  [v33 setDismissalAnimationStyle:v32];

  unsigned int v34 = [(PHInCallRootViewController *)self callCenter];
  id v35 = [v34 frontmostAudioOrVideoCall];
  [(PHInCallRootViewController *)self updateRemoteAlertSwipeDismissalStyleForCall:v35];

  [(PHInCallRootViewController *)self updateShouldBecomeVisibleWhenWakingDisplay];
}

- (void)updateShouldBecomeVisibleWhenWakingDisplay
{
  id v3 = [(PHInCallRootViewController *)self callCenter];
  id v4 = [v3 frontmostAudioOrVideoCall];

  if (!v4
    || ([v4 isVideo] & 1) != 0
    || ([v4 remoteParticipantHandles],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v6 != (id)1))
  {
    if (![(PHInCallRootViewController *)self wantsMiniWindowCoverViewController])
    {
      if (SBUIIsSystemApertureEnabled())
      {
        uint64_t v9 = 0;
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  unsigned int v7 = [v4 isScreening];
  int v8 = SBUIIsSystemApertureEnabled();
  uint64_t v9 = v8 & v7 ^ 1;
  if ((v8 & 1) == 0 && v7)
  {
LABEL_10:
    unint64_t v10 = [(PHInCallRootViewController *)self currentViewController];
    int v11 = [(PHInCallRootViewController *)self pttFullScreenContainerViewController];
    uint64_t v9 = v10 == v11;
  }
LABEL_11:
  unint64_t v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating shouldBecomeVisibleWhenWakingDisplay: %d", (uint8_t *)v16, 8u);
  }

  int v13 = +[UIApplication sharedApplication];
  BOOL v14 = [v13 delegate];
  unsigned int v15 = [v14 currentInCallScene];
  [v15 setShouldBecomeVisibleWhenWakingDisplay:v9];
}

- (BOOL)desiresLockButtonEvents
{
  id v3 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
  if (([v3 desiresLockButtonEvents] & 1) != 0
    || [(PHSOSViewController *)self->_sosViewController desiresLockButtonEvents])
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = [(PHInCallRootViewController *)self callCenter];
    if ([v5 hasCurrentVideoCalls]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(PHInCallRootViewController *)self isPresentingViewControllerWithSensitiveInformation];
    }
  }
  return v4;
}

- (id)getPreferredBackgroundActivitiesToSuppress:(id)a3 whenIsPipped:(BOOL)a4 whenTemporarilyAllowAllStatusBarPills:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  int v8 = v7;
  if (v5)
  {
    uint64_t v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      unint64_t v10 = "Don't suppress status bar pill because temporarilyAllowAllStatusBarPills is true.";
      int v11 = (uint8_t *)&v16;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    uint64_t v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      unint64_t v10 = "Don't suppress status bar pill because ICS is pipped.";
      int v11 = (uint8_t *)&v15;
      goto LABEL_7;
    }
LABEL_8:

    id v12 = (id)objc_opt_new();
    goto LABEL_10;
  }
  id v12 = v7;
LABEL_10:
  int v13 = v12;

  return v13;
}

- (id)backgroundActivities
{
  unsigned __int8 v2 = [(PHInCallRootViewController *)self inCallWindowScene];
  id v3 = [v2 ics_sceneType];

  return v3;
}

- (BOOL)isPipped
{
  unsigned __int8 v2 = +[PHPIPController defaultPIPController];
  unsigned __int8 v3 = [v2 isPipped];

  return v3;
}

- (void)setTemporarilyAllowAllStatusBarPills:(BOOL)a3
{
  if (self->_temporarilyAllowAllStatusBarPills != a3)
  {
    self->_temporarilyAllowAllStatusBarPills = a3;
    [(PHInCallRootViewController *)self setNeedsStatusBarPillSuppressionUpdate];
  }
}

- (void)setNeedsStatusBarPillSuppressionUpdate
{
  unsigned __int8 v3 = [(PHInCallRootViewController *)self backgroundActivities];
  id v5 = [(PHInCallRootViewController *)self getPreferredBackgroundActivitiesToSuppress:v3 whenIsPipped:[(PHInCallRootViewController *)self isPipped] whenTemporarilyAllowAllStatusBarPills:[(PHInCallRootViewController *)self temporarilyAllowAllStatusBarPills]];

  BOOL v4 = [(PHInCallRootViewController *)self inCallWindowScene];
  +[PHInCallRootViewController setStatusBarPillSuppressionForBackgroundActivities:v5 onWindowScene:v4];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  BOOL v6 = [(PHInCallRootViewController *)self childViewControllers];
  id v7 = [v6 lastObject];

  if (objc_opt_respondsToSelector()) {
    [v7 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v4 = [(PHInCallRootViewController *)self childViewControllers];
  id v5 = [v4 lastObject];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 shouldAutorotateToInterfaceOrientation:a3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)updateTransportIndicatorView
{
  if (!CPIsInternalDevice()) {
    return;
  }
  unsigned __int8 v3 = sub_10000FA34(@"ShowFaceTimeTransportIndicator");
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return;
  }
  id v5 = [(PHInCallRootViewController *)self callCenter];
  id v25 = [v5 callPassingTest:&stru_1002D0160];

  unsigned __int8 v6 = [(PHInCallRootViewController *)self transportIndicatorView];
  if (!v25)
  {

    if (v6)
    {
      BOOL v22 = [(PHInCallRootViewController *)self transportIndicatorView];
      [v22 removeFromSuperview];

      [(PHInCallRootViewController *)self setTransportIndicatorView:0];
    }
    goto LABEL_16;
  }

  if (!v6)
  {
    id v7 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 15.0, 15.0];
    [(PHInCallRootViewController *)self setTransportIndicatorView:v7];

    int v8 = [(PHInCallRootViewController *)self transportIndicatorView];
    [v8 setAutoresizingMask:9];

    uint64_t v9 = [(PHInCallRootViewController *)self transportIndicatorView];
    unint64_t v10 = [v9 layer];
    [v10 setCornerRadius:7.5];

    int v11 = [(PHInCallRootViewController *)self view];
    id v12 = [(PHInCallRootViewController *)self transportIndicatorView];
    [v11 addSubview:v12];

    int v13 = [(PHInCallRootViewController *)self view];
    [v13 bounds];
    double v15 = v14 + -15.0 + -5.0;
    __int16 v16 = [(PHInCallRootViewController *)self view];
    [v16 bounds];
    double v18 = v17 + -15.0 + -5.0;
    uint64_t v19 = [(PHInCallRootViewController *)self transportIndicatorView];
    [v19 setFrame:v15, v18, 15.0, 15.0];
  }
  id v20 = [v25 faceTimeTransportType];
  if (v20 == (id)2)
  {
    uint64_t v21 = +[UIColor systemBlueColor];
    goto LABEL_15;
  }
  if (v20 == (id)1)
  {
    uint64_t v21 = +[UIColor systemGreenColor];
    goto LABEL_15;
  }
  if (!v20)
  {
    uint64_t v21 = +[UIColor systemGrayColor];
LABEL_15:
    unsigned int v23 = (void *)v21;
    uint64_t v24 = [(PHInCallRootViewController *)self transportIndicatorView];
    [v24 setBackgroundColor:v23];
  }
LABEL_16:
}

- (SBSUIInCallWindowScene)inCallWindowScene
{
  unsigned __int8 v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 delegate];
  unsigned int v4 = [v3 sceneManager];
  id v5 = [v4 callScene];

  return (SBSUIInCallWindowScene *)v5;
}

- (void)animateToAlert
{
  unsigned __int8 v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Animate to Alert", v8, 2u);
  }

  unsigned __int8 v3 = +[PHPIPController defaultPIPController];
  id v4 = [v3 pipState];

  if (v4 == (id)2)
  {
    v9[0] = SBSUIRemoteAlertOptionViewControllerClass;
    id v5 = TUInCallRemoteAlertViewControllerClassName();
    v10[0] = v5;
    v10[1] = &__kCFBooleanTrue;
    v9[1] = SBSUIRemoteAlertOptionDismissWithHomeButton;
    v9[2] = SBSUIRemoteAlertOptionWantsWallpaperTunnel;
    v10[2] = &__kCFBooleanTrue;
    v9[3] = SBSUIRemoteAlertOptionDismissalAnimationStyle;
    unsigned __int8 v6 = +[NSNumber numberWithInt:2];
    v9[4] = SBSUIRemoteAlertOptionSwipeDismissalStyle;
    v10[3] = v6;
    v10[4] = &off_1002DEF28;
    id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

    SBSUIActivateRemoteAlert();
  }
}

- (void)presentBlockAndReportAlertToBlockCall:(id)a3 forViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    int v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"BLOCK_REPORT_ALERT_TITLE" value:&stru_1002D6110 table:@"InCallService"];
    int v13 = +[UIAlertController alertControllerWithTitle:v12 message:0 preferredStyle:0];

    objc_initWeak(location, self);
    double v14 = +[NSBundle mainBundle];
    double v15 = [v14 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_BLOCK" value:&stru_1002D6110 table:@"InCallService"];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000C3058;
    v32[3] = &unk_1002D0188;
    objc_copyWeak(&v35, location);
    id v16 = v8;
    id v33 = v16;
    id v17 = v10;
    id v34 = v17;
    double v18 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v32];
    [v13 addAction:v18];

    uint64_t v19 = +[NSBundle mainBundle];
    id v20 = [v19 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_BLOCK_REPORT" value:&stru_1002D6110 table:@"InCallService"];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C3100;
    v28[3] = &unk_1002D0188;
    objc_copyWeak(&v31, location);
    id v29 = v16;
    id v21 = v17;
    id v30 = v21;
    BOOL v22 = +[UIAlertAction actionWithTitle:v20 style:2 handler:v28];
    [v13 addAction:v22];

    unsigned int v23 = +[NSBundle mainBundle];
    uint64_t v24 = [v23 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_CANCEL" value:&stru_1002D6110 table:@"InCallService"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000C31C0;
    v26[3] = &unk_1002CEEB0;
    id v27 = v21;
    id v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v26];
    [v13 addAction:v25];

    [v9 presentModalViewController:v13 animated:1];
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);
  }
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  unsigned __int8 v3 = +[ICSPreferences sharedPreferences];
  if ([v3 hasAdoptedModernInCallAPI]) {
    unsigned int v4 = ![(PHInCallRootViewController *)self allowHomeOutDismissal];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return [(PHInCallRootViewController *)self shouldHideStatusBar];
}

- (void)routesChangedForRouteController:(id)a3
{
  [(PHInCallRootViewController *)self updateDesiredSpringboardBehavior];
  id v4 = [(PHInCallRootViewController *)self routeListController];
  [v4 reload];
}

- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4
{
}

- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v4 delegate];
  [v3 acquireLongPreventSuspensionAssertion];
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4
{
  unsigned __int8 v6 = +[PHPIPController defaultPIPController];
  id v7 = [v6 pipState];

  if (v7 == (id)2)
  {
    id v8 = +[PHPIPController defaultPIPController];
    id v9 = [v8 pipContentViewController];
    id v10 = [v9 view];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    double v18 = v17;

    if ([v8 pipState] == (id)2
      && (v18 == CGSizeZero.height ? (BOOL v19 = v16 == CGSizeZero.width) : (BOOL v19 = 0),
          !v19 ? (BOOL v20 = v16 == v18) : (BOOL v20 = 0),
          v20))
    {
      id v21 = sub_1000D5250();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v22 = v21;
        v27.origin.x = v12;
        v27.origin.y = v14;
        v27.size.width = v16;
        v27.size.height = v18;
        unsigned int v23 = NSStringFromRect(v27);
        *(_DWORD *)buf = 138412290;
        BOOL v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Skipping orientation update to PIP since the PIP is square %@", buf, 0xCu);
      }
    }
    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000C34FC;
      v24[3] = &unk_1002CD518;
      v24[4] = self;
      [v8 rotatePIPDeviceOrientationTo:[objc_opt_class() uiDeviceOrientationForCNKDeviceOrientation:a4] withCompletion:v24];
    }
  }
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5
{
  id v5 = +[PHPIPController defaultPIPController];
  [v5 updatePIPSize];

  id v6 = +[PHPIPController defaultPIPController];
  [v6 updatePIPFrame];
}

- (void)viewController:(id)a3 localParticipantAspectRatioChanged:(CGSize)a4
{
  id v4 = +[PHPIPController defaultPIPController];
  [v4 updatePIPSize];

  id v5 = +[PHPIPController defaultPIPController];
  [v5 updatePIPFrame];
}

- (void)viewController:(id)a3 pipSourceProviderNeedsUpdate:(id)a4
{
  id v4 = a4;
  id v5 = +[PHPIPController defaultPIPController];
  [v5 setSourceProvider:v4];
}

- (void)participantsDidChangeLocation:(id)a3
{
  id v3 = +[PHPIPController defaultPIPController];
  [v3 updatePIPFrame];
}

- (void)updateBackgroundStartPipAuthorizationState
{
  id v3 = [(PHInCallRootViewController *)self featureFlags];
  unsigned int v4 = [v3 expanseEnabled];

  if (v4)
  {
    id v5 = [(PHInCallRootViewController *)self multiwayViewController];
    id v6 = [v5 hasParticipantVideo];
    id v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    id v8 = [v7 callDisplayStyle];

    id v9 = +[PHPIPController defaultPIPController];
    id v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 67109888;
      unsigned int v24 = v6;
      __int16 v25 = 2048;
      *(void *)BOOL v26 = v8;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)NSRect v27 = [v5 isPipped];
      *(_WORD *)&v27[4] = 2048;
      id v28 = [v9 pipState];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "hasParticipantVideo changed (hasParticipantVideo: %d, callDisplayStyle: %ld, isPipped: %d pipState: %lu)", (uint8_t *)&v23, 0x22u);
    }

    [v9 setHasParticipantVideoForActiveConversation:v6];
    [v9 updateShouldPIPWhenEnteringBackground];
    double v11 = [(PHInCallRootViewController *)self callCenter];
    CGFloat v12 = [v11 frontmostAudioOrVideoCall];

    if ([v12 isConnected])
    {
      BOOL v13 = 0;
    }
    else
    {
      if (([v5 isOneToOneModeEnabled] & 1) == 0)
      {
        BOOL v14 = v5 == 0;
        goto LABEL_19;
      }
      BOOL v13 = [v12 status] != 3;
    }
    BOOL v14 = v5 == 0;
    if (v5 && !v13)
    {
      if (v8 == (id)4) {
        int v15 = (int)v6;
      }
      else {
        int v15 = 0;
      }
      if (v15 == 1 && ![v9 pipState])
      {
        double v16 = +[UIApplication sharedApplication];
        double v17 = [v16 delegate];
        BOOL v22 = [v5 call];
        [v17 requestBackgroundPiPAuthorizationOfDismissedInCallSceneForCall:v22];
      }
      else
      {
        double v16 = +[UIApplication sharedApplication];
        double v17 = [v16 delegate];
        [v17 revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:0];
      }

      if ((v6 & 1) == 0) {
        [v9 cancelPIPIfNeeded];
      }
LABEL_22:

      return;
    }
LABEL_19:
    double v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v12 isConnected];
      unsigned int v20 = [v12 status];
      unsigned int v21 = [v5 isOneToOneModeEnabled];
      int v23 = 67109888;
      unsigned int v24 = v19;
      __int16 v25 = 1024;
      *(_DWORD *)BOOL v26 = v20;
      *(_WORD *)&void v26[4] = 1024;
      *(_DWORD *)&v26[6] = v21;
      *(_WORD *)NSRect v27 = 1024;
      *(_DWORD *)&v27[2] = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "skipping updating background start pip authorization; call is connected %d or call status %d or call isOneToOneM"
        "odeEnabled %d or multiway view controller is nil %d",
        (uint8_t *)&v23,
        0x1Au);
    }

    goto LABEL_22;
  }
}

- (void)viewController:(id)a3 mediaPipSafeAreaFrameChanged:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = [(PHInCallRootViewController *)self multiwayViewController];
  double v11 = [(PHInCallRootViewController *)self featureFlags];
  unsigned int v12 = [v11 expanseEnabled];

  if (v12 && v10 == v9)
  {
    BOOL v13 = +[UIApplication sharedApplication];
    BOOL v14 = [v13 delegate];
    int v15 = [v14 currentInCallScene];

    v51.origin.double x = x;
    v51.origin.double y = y;
    v51.size.double width = width;
    v51.size.double height = height;
    if (CGRectIsEmpty(v51))
    {
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
    else
    {
      unsigned int v20 = [v9 view];
      unsigned int v21 = [v15 coordinateSpace];
      [v20 convertRect:v21 toCoordinateSpace:x, y, width, height];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      id v30 = [v15 coordinateSpace];
      [v30 bounds];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      v52.origin.double x = v23;
      CGFloat v46 = v23;
      v52.origin.double y = v25;
      v52.size.double width = v27;
      v52.size.double height = v29;
      double MinY = CGRectGetMinY(v52);
      v53.origin.double x = v32;
      v53.origin.double y = v34;
      v53.size.double width = v36;
      v53.size.double height = v38;
      double v48 = MinY - CGRectGetMinY(v53);
      v54.origin.double x = v23;
      v54.origin.double y = v25;
      v54.size.double width = v27;
      v54.size.double height = v29;
      double MinX = CGRectGetMinX(v54);
      v55.origin.double x = v32;
      v55.origin.double y = v34;
      v55.size.double width = v36;
      v55.size.double height = v38;
      double v45 = MinX - CGRectGetMinX(v55);
      v56.origin.double x = v32;
      v56.origin.double y = v34;
      v56.size.double width = v36;
      v56.size.double height = v38;
      double MaxY = CGRectGetMaxY(v56);
      v57.origin.double x = v46;
      v57.origin.double y = v25;
      v57.size.double width = v27;
      v57.size.double height = v29;
      double v41 = MaxY - CGRectGetMaxY(v57);
      v58.origin.double x = v32;
      v58.size.double width = v36;
      v58.origin.double y = v34;
      double left = v45;
      v58.size.double height = v38;
      double bottom = v41;
      double MaxX = CGRectGetMaxX(v58);
      v59.origin.double x = v46;
      v59.origin.double y = v25;
      v59.size.double width = v27;
      v59.size.double height = v29;
      double right = MaxX - CGRectGetMaxX(v59);
      double top = v48;
    }
    id v43 = sub_1000D5130();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v60.double top = top;
      v60.double left = left;
      v60.double bottom = bottom;
      v60.double right = right;
      __int16 v44 = NSStringFromUIEdgeInsets(v60);
      *(_DWORD *)buf = 138412290;
      id v50 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "mediaPipSafeAreaInsetsInScene changed to %@", buf, 0xCu);
    }
    [v15 setExpanseHUDDodgingInsets:top, left, bottom, right];
  }
}

- (double)viewController:(id)a3 rubberBandConstrained:(double)a4 inRange:(double)a5
{
  id v5 = a3;
  BSUIConstrainValueWithRubberBand();
  id v6 = [v5 viewIfLoaded];

  UIRoundToViewScale();
  double v8 = v7;

  return v8;
}

- (id)audioRouteMenu
{
  id v3 = [(PHInCallRootViewController *)self routeListController];

  if (!v3)
  {
    unsigned int v4 = +[PHAudioRoutingMenuController menuControllerWithCallStyle:1 dataSource:self delegate:self];
    [(PHInCallRootViewController *)self setRouteListController:v4];
  }
  id v5 = [(PHInCallRootViewController *)self routeListController];
  id v6 = [v5 menu];

  return v6;
}

- (id)audioRouteGlyphFor:(id)a3
{
  return [a3 audioRouteGlyphForDisplayStyle:4];
}

- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4
{
  if ((unint64_t)a4 > 6) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_100285078[a4];
  }
  return [a3 audioRouteGlyphForDisplayStyle:v5];
}

- (UIImage)audioRouteGlyphForDevice
{
  unsigned __int8 v2 = +[PHDevice currentDevice];
  id v3 = [v2 audioRouteGlyphImage];

  return (UIImage *)v3;
}

- (id)callParticipantLabelsViewForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self multiwayViewController];

  if (v5 == v4)
  {
    callParticipantLabelsView = self->_callParticipantLabelsView;
    if (!callParticipantLabelsView)
    {
      double v8 = [PHCallParticipantsView alloc];
      id v9 = [(PHInCallRootViewController *)self callDisplayStyleManager];
      id v10 = [(PHCallParticipantsView *)v8 initWithCallDisplayStyleManager:v9];
      double v11 = self->_callParticipantLabelsView;
      self->_callParticipantLabelsView = v10;

      unsigned int v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = self->_callParticipantLabelsView;
        int v15 = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        double v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "View controller %@ requested a call participant label view: %@", (uint8_t *)&v15, 0x16u);
      }

      [(PHCallParticipantsView *)self->_callParticipantLabelsView setAutoresizingMask:37];
      [(PHCallParticipantsView *)self->_callParticipantLabelsView setUserInteractionEnabled:1];
      [(PHCallParticipantsView *)self->_callParticipantLabelsView setDelegate:self];
      [(PHCallParticipantsView *)self->_callParticipantLabelsView setPreservesSuperviewLayoutMargins:1];
      [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
      callParticipantLabelsView = self->_callParticipantLabelsView;
    }
    id v6 = callParticipantLabelsView;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateCallParticipantLabelsViewForViewController:(id)a3
{
  id v6 = a3;
  id v4 = [(PHInCallRootViewController *)self multiwayViewController];
  if (v4 == v6)
  {
    callParticipantLabelsView = self->_callParticipantLabelsView;

    if (callParticipantLabelsView) {
      [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
    }
  }
  else
  {
  }
}

- (id)bottomControlsViewForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PHInCallRootViewController *)self multiwayViewController];

  if (v5 == v4)
  {
    bottomControlsView = self->_bottomControlsView;
    if (!bottomControlsView)
    {
      double v8 = [PHBottomBar alloc];
      id v9 = [(PHInCallRootViewController *)self callDisplayStyleManager];
      id v10 = [(PHBottomBar *)v8 initWithCallDisplayStyleManager:v9];
      double v11 = self->_bottomControlsView;
      self->_bottomControlsView = v10;

      [(PHBottomBar *)self->_bottomControlsView setDelegate:self];
      id v12 = objc_alloc((Class)UIView);
      BOOL v13 = +[UIScreen mainScreen];
      [v13 bounds];
      double v15 = v14;
      id v16 = +[UIScreen mainScreen];
      [v16 bounds];
      id v17 = [v12 initWithFrame:0.0, 0.0, v15];
      +[PHCallViewController _bottomBarBottomMarginForView:v17];
      -[PHBottomBar setBottomMargin:](self->_bottomControlsView, "setBottomMargin:");

      [(PHBottomBar *)self->_bottomControlsView setUsesLowerButtons:1];
      +[PHCallViewController _yOffsetForLoweredButtons];
      -[PHBottomBar setYOffsetForLoweredButtons:](self->_bottomControlsView, "setYOffsetForLoweredButtons:");
      [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
      bottomControlsView = self->_bottomControlsView;
    }
    id v6 = bottomControlsView;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)customOverrideOneToOneShutterButtonForViewController:(id)a3
{
  return 0;
}

+ (int64_t)uiDeviceOrientationForCNKDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_1002850B0[a3];
  }
}

+ (int64_t)cnkDeviceOrientationForUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 1;
  }
  else {
    return qword_1002850D0[a3 - 2];
  }
}

+ (int64_t)cnkSupportedDeviceOrientationsFromUIInterfaceOrientationMask:(unint64_t)a3
{
  int64_t v3 = (~(_BYTE)a3 & 0x18) == 0;
  if ((a3 & 2) != 0) {
    int64_t v3 = 0;
  }
  if ((~(_BYTE)a3 & 0x1E) != 0) {
    return v3;
  }
  else {
    return 2;
  }
}

- (BOOL)isShownAboveCoverSheet
{
  unsigned __int8 v2 = [(PHInCallRootViewController *)self inCallWindowScene];
  unsigned __int8 v3 = [v2 isBeingShownAboveCoverSheet];

  return v3;
}

- (BOOL)wantsStandardControls
{
  return 1;
}

- (void)unansweredCallUIDismissed
{
  unsigned __int8 v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 delegate];
  [v3 setMostRecentlyDisconnectedVideoCall:0];

  id v4 = +[NSSet setWithObjects:@"PHMulitwayCallAssertionReason", @"PHVideoMessageInProgressAssertionReason", 0];
  +[PHInCallRootViewController releaseDismissalAssertionReasons:v4];
}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  unsigned __int8 v3 = [(PHInCallRootViewController *)self callCenter];
  id v4 = [v3 routeController];
  id v5 = [v4 sortedRoutes];

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v5 = a4;
  id v7 = [(PHInCallRootViewController *)self callCenter];
  id v6 = [v7 routeController];
  [v6 pickRoute:v5];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating call controller because active remote participants changed for conversation %@", (uint8_t *)&v7, 0xCu);
  }

  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
}

- (void)handleActivationContextDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleActivationContextDidChangeNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHInCallRootViewController *)self handleSOSActivationIfNecessary];
  [(PHInCallRootViewController *)self handleScreenTimeActivationIfNecessary];
}

- (void)handleSOSActivationIfNecessary
{
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  unsigned int v5 = [v4 shouldActivateSOS];

  if (v5)
  {
    int v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting SOS UI", v7, 2u);
    }

    [(PHInCallRootViewController *)self forceUpdateCallControllerForSOS];
    [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
  }
}

- (void)handleScreenTimeActivationIfNecessary
{
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  unsigned int v5 = [v4 activationContext];
  int v6 = [v5 pendingRestrictedScreenTimeRequest];

  if (v6)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[UIApplication sharedApplication];
      id v9 = [v8 delegate];
      id v10 = [v9 activationContext];
      double v11 = [v10 pendingRestrictedScreenTimeRequest];
      int v18 = 138412290;
      unsigned int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will request screen time alert for request %@", (uint8_t *)&v18, 0xCu);
    }
    id v12 = +[UIApplication sharedApplication];
    BOOL v13 = [v12 delegate];
    double v14 = [v13 activationContext];
    double v15 = [v14 pendingRestrictedScreenTimeRequest];
    [(PHInCallRootViewController *)self forceUpdateCallControllerForFilteredRequest:v15];

    id v16 = +[UIApplication sharedApplication];
    id v17 = [v16 delegate];
    [v17 setActivationContext:0];
  }
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  BOOL v7 = a4 == 4;
  id v8 = [(PHInCallRootViewController *)self callManager];
  [v8 setIsInBackground:v7];

  if (a3 == 4 && a4 == 2)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In-call UI was just presented full-screen, updating shouldPIPWhenEnteringBackground", (uint8_t *)v53, 2u);
    }

    id v10 = +[PHPIPController defaultPIPController];
    [v10 updateShouldPIPWhenEnteringBackground];
  }
  if (a3 == 1 || a4 == 1)
  {
    [(PHInCallRootViewController *)self updateVideoState];
    [(PHInCallRootViewController *)self showHideMiniWindowViewIfNeededAnimated:a3 != 4];
  }
  double v11 = [(PHInCallRootViewController *)self featureFlags];
  if ([v11 conversationOneToOneModeEnabled])
  {
    unsigned int v12 = [(PHInCallRootViewController *)self currentViewControllerIsMultiway];
    if (a3 == 2)
    {
      if (v12)
      {
        BOOL v13 = [(PHInCallRootViewController *)self multiwayViewController];
        unsigned int v14 = [v13 shouldDisconnectOnDismissal];

        if (!v14) {
          goto LABEL_15;
        }
        double v11 = [(PHInCallRootViewController *)self callCenter];
        double v15 = [(PHInCallRootViewController *)self multiwayViewController];
        id v16 = [v15 call];
        [v11 disconnectCall:v16 withReason:2];
      }
    }
  }

LABEL_15:
  BOOL v18 = a4 == 4 || a4 == 2;
  unsigned int v19 = [(PHInCallRootViewController *)self currentViewControllerIsMultiway];
  if (!a3 && v18 && v19)
  {
    unsigned int v20 = [(PHInCallRootViewController *)self multiwayViewController];
    [v20 setDidExpandIncomingCallBanner:1];
  }
  [(PHInCallRootViewController *)self updateMultiwayViewControllerUIState];
  [(PHInCallRootViewController *)self updateCallDetailsViewIsOnScreen];
  if (a4 == 4)
  {
    [(PHInCallRootViewController *)self cancelAutoAnswer];
    unsigned int v21 = +[PHInCallUtilities sharedInstance];
    [v21 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForFullscreenUIReason"];

    [(PHInCallRootViewController *)self dismissSOSIfNeeded];
    [(PHInCallRootViewController *)self dismissScreenTimeAlertHostIfNeeded];
    [(PHInCallRootViewController *)self dismissViewControllersWithSensitiveInformation];
    double v22 = +[UIApplication sharedApplication];
    CGFloat v23 = [v22 delegate];
    double v24 = [v23 bannerPresentationManager];
    [(PHInCallRootViewController *)self dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:v24];

    CGFloat v25 = +[UIApplication sharedApplication];
    double v26 = [v25 delegate];
    if ([v26 didDeepLinkToPTTCallDetailsView])
    {
      unsigned int v27 = [(id)qword_100326250 containsObject:@"PHPTTCallDetailsViewAssertionReason"];

      if (v27)
      {
        double v28 = +[UIApplication sharedApplication];
        CGFloat v29 = [v28 delegate];
        [v29 setDidDeepLinkToPTTCallDetailsView:0];

        +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
      }
    }
    else
    {
    }
    double v31 = +[UIApplication sharedApplication];
    CGFloat v32 = [v31 delegate];
    double v33 = [v32 allInCallScenes];
    id v34 = [v33 count];

    if (v34 == (id)1)
    {
      double v35 = +[PHIntervalTimer oneSecondTimer];
      [v35 pause];
    }
    CGFloat v36 = +[UIApplication sharedApplication];
    double v37 = [v36 delegate];
    CGFloat v38 = [(PHInCallRootViewController *)self callCenter];
    uint64_t v30 = [v37 currentVideoCallUsingCallContainer:v38];

    BOOL v39 = [(PHInCallRootViewController *)self callCenter];
    uint64_t v40 = [v39 callPassingTest:&stru_1002D01A8];

    if (!(v30 | v40))
    {
      double v41 = [(PHInCallRootViewController *)self multiwayViewController];
      unsigned __int8 v42 = [v41 isInVideoMessageFlow];

      if ((v42 & 1) == 0)
      {
        [(id)objc_opt_class() releaseDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
        if ([(id)qword_100326250 containsObject:@"PHCallEndedBlockAndReportInProgressAssertionReason"])
        {
          id v43 = sub_1000D5130();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v53[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Dismissing PHCallEndedBlockAndReportInProgressAssertionReason because display style is dismissed.", (uint8_t *)v53, 2u);
          }

          __int16 v44 = [(PHInCallRootViewController *)self multiwayViewController];
          [v44 setIsInCallEndedBlockAndReportFlow:0];

          [(id)objc_opt_class() releaseDismissalAssertionForReason:@"PHCallEndedBlockAndReportInProgressAssertionReason"];
        }
        double v45 = +[UIApplication sharedApplication];
        CGFloat v46 = [v45 delegate];
        [v46 setMostRecentlyDisconnectedVideoCall:0];
      }
    }
  }
  else
  {
    if (a3 != 4) {
      goto LABEL_43;
    }
    uint64_t v30 = +[PHIntervalTimer oneSecondTimer];
    [(id)v30 resume];
  }

LABEL_43:
  uint64_t v47 = sub_1000D5130();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v48 = [(PHInCallRootViewController *)self isCurrentViewControllerAudio];
    v49 = [(PHInCallRootViewController *)self parentViewController];
    id v50 = [(PHInCallRootViewController *)self view];
    CGRect v51 = [v50 window];
    CGRect v52 = [(PHInCallRootViewController *)self childViewControllers];
    v53[0] = 67109890;
    v53[1] = v48;
    __int16 v54 = 2112;
    CGRect v55 = v49;
    __int16 v56 = 2112;
    CGRect v57 = v51;
    __int16 v58 = 2112;
    CGRect v59 = v52;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController - isCurrentViewControllerAudio: %d, my parent: %@, window: %@, children: %@", (uint8_t *)v53, 0x26u);
  }
  [(PHInCallRootViewController *)self updateBannerTapGestureRecognizerForCallDisplayStyle:a4];
  [(PHInCallRootViewController *)self notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:a3 toStyle:a4];
}

- (BOOL)currentViewControllerIsMultiway
{
  unsigned __int8 v3 = [(PHInCallRootViewController *)self multiwayViewController];
  id v4 = [v3 parentViewController];
  if (v4)
  {
    unsigned int v5 = [(PHInCallRootViewController *)self currentViewController];
    int v6 = [(PHInCallRootViewController *)self videoCallNavigationController];
    if (v5 == v6)
    {
      id v8 = [(PHInCallRootViewController *)self videoCallNavigationController];
      id v9 = [v8 topViewController];
      if ([v9 conformsToProtocol:&OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol])
      {
        unsigned __int8 v7 = 1;
      }
      else
      {
        id v10 = [(PHInCallRootViewController *)self multiwayViewController];
        unsigned __int8 v7 = [v10 isInVideoMessageFlow];
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isCurrentViewControllerAudio
{
  unsigned __int8 v3 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
  id v4 = [v3 parentViewController];
  if (v4)
  {
    unsigned int v5 = [(PHInCallRootViewController *)self currentViewController];
    int v6 = [(PHInCallRootViewController *)self audioCallNavigationController];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isShowing6UP
{
  BOOL v3 = [(PHInCallRootViewController *)self isCurrentViewControllerAudio];
  if (v3)
  {
    id v4 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
    unsigned __int8 v5 = [v4 isShowing6UP];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMicIndicatorVisible
{
  if ([(PHInCallRootViewController *)self isShowing6UP]) {
    return 1;
  }

  return [(PHInCallRootViewController *)self isShowingHUD];
}

- (void)updateCallDetailsViewIsOnScreen
{
  unsigned __int8 v5 = [(PHInCallRootViewController *)self callDetailsNavigationController];

  if (v5)
  {
    unsigned int v6 = [(PHInCallRootViewController *)self isPresentingCallDetailsView];
    if (v6)
    {
      id v9 = +[UIApplication sharedApplication];
      unsigned __int8 v2 = [v9 delegate];
      BOOL v3 = [v2 sceneManager];
      id v7 = [v3 hasActiveOrPendingFullScreenCallScene];
    }
    else
    {
      id v7 = 0;
    }
    id v8 = [(PHInCallRootViewController *)self callDetailsNavigationController];
    [v8 setIsOnScreen:v7];

    if (v6)
    {
    }
  }
}

- (BOOL)isFullScreen
{
  BOOL v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  unsigned __int8 v5 = [v4 currentInCallScene];

  if (v5)
  {
    unsigned int v6 = +[UIApplication sharedApplication];
    id v7 = [v6 delegate];
    id v8 = [v7 currentInCallScene];
    if ([v8 presentationMode] == (id)2)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v10 = +[UIApplication sharedApplication];
      double v11 = [v10 delegate];
      unsigned int v12 = [v11 currentInCallScene];
      if ([v12 presentationMode] == (id)3)
      {
        BOOL v9 = 1;
      }
      else
      {
        BOOL v13 = +[UIApplication sharedApplication];
        unsigned int v14 = [v13 delegate];
        double v15 = [v14 sceneManager];
        if ([v15 hasPendingCompletionForSceneType:0 presentationMode:2])
        {
          BOOL v9 = 1;
        }
        else
        {
          [(PHInCallRootViewController *)self callDisplayStyleManager];
          id v16 = v18 = v13;
          BOOL v9 = [v16 callDisplayStyle] == (id)3;

          BOOL v13 = v18;
        }
      }
    }

    goto LABEL_15;
  }
  unsigned int v6 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  if ([v6 callDisplayStyle] != (id)2)
  {
    id v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    BOOL v9 = [v7 callDisplayStyle] == (id)3;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (void)updateMultiwayViewControllerUIState
{
  BOOL v3 = [(PHInCallRootViewController *)self isFullScreen];
  id v4 = +[PHPIPController defaultPIPController];
  unsigned int v5 = [v4 isPIPProxyActive];

  if (v3 || v5)
  {
    id v7 = +[PHPIPController defaultPIPController];
    if ([v7 isPIPProxyInterrupted]) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = ![(PHInCallRootViewController *)self isDisplayStyleMiniWindow];
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  id v8 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  id v9 = [v8 callDisplayStyle];

  id v10 = [(PHInCallRootViewController *)self multiwayViewController];

  if (v10)
  {
    if (v6) {
      BOOL v11 = [(PHInCallRootViewController *)self currentViewControllerIsMultiway];
    }
    else {
      BOOL v11 = 0;
    }
    unsigned int v12 = sub_1000D5130();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(PHInCallRootViewController *)self multiwayViewController];
      unsigned int v14 = [(PHInCallRootViewController *)self callDisplayStyleManager];
      int v25 = 138413058;
      double v26 = v13;
      __int16 v27 = 1024;
      BOOL v28 = v11;
      __int16 v29 = 1024;
      unsigned int v30 = v5;
      __int16 v31 = 2048;
      id v32 = [v14 callDisplayStyle];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating %@ isMultiwayVisibleOnScreen=%d isPipped=%d callDisplayStyle=%ld", (uint8_t *)&v25, 0x22u);
    }
    double v15 = +[PHPIPController defaultPIPController];
    id v16 = [v15 pipState];
    id v17 = [(PHInCallRootViewController *)self multiwayViewController];
    [v17 setPipState:v16];

    BOOL v18 = [(PHInCallRootViewController *)self multiwayViewController];
    [v18 setIsOnScreen:v11];

    unsigned int v19 = [(PHInCallRootViewController *)self multiwayViewController];
    [v19 setIsDisplayedInBanner:v9 == 0];

    unsigned int v20 = [(PHInCallRootViewController *)self multiwayViewController];
    [v20 setIsFullScreen:v3];

    [(PHInCallRootViewController *)self refreshBottomBarButtonLayout];
    [(PHInCallRootViewController *)self setNeedsStatusBarPillSuppressionUpdate];
    unsigned int v21 = +[PHInCallOrientationMonitor sharedInstance];
    double v22 = v21;
    if (v5) {
      id v23 = [v21 currentOrientation];
    }
    else {
      id v23 = [v21 lastValidOrientation];
    }
    id v24 = v23;

    [(PHInCallRootViewController *)self updateMultiwayDeviceOrientation:v24];
  }
}

- (void)updateVideoState
{
  BOOL v3 = [(UINavigationController *)self->_videoCallNavigationController topViewController];
  unsigned __int8 v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol];
  if (!v3 || (v4 & 1) != 0)
  {
    if ([(PHInCallRootViewController *)self isDisplayStyleMiniWindow]) {
      [v3 muteVideo];
    }
    else {
      [v3 updateVideoState];
    }
  }
  else
  {
    unsigned int v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1001EBAEC((uint64_t)v3, self, v5);
    }
  }
}

- (void)notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  id v7 = [(PHInCallRootViewController *)self audioCallNavigationController];
  if (v7)
  {
    id v8 = [(PHInCallRootViewController *)self audioCallNavigationController];
    id v9 = [v8 view];
    id v10 = [v9 superview];
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  unsigned int v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController - audioCallControllerExistsOutsideHierarchy: %d", (uint8_t *)v18, 8u);
  }

  if (a3) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v11;
  }
  if (v13)
  {
    unsigned int v14 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
    +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:v14 callDisplayStyleDidChangeFromStyle:0 toStyle:a4];

    double v15 = [(PHInCallRootViewController *)self featureFlags];
    LODWORD(v14) = [v15 audioCallUIModernizationEnabled];

    if (v14)
    {
      id v16 = [(PHInCallRootViewController *)self audioCallViewControllerWrapper];
      id v17 = [v16 viewController];
      +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:v17 callDisplayStyleDidChangeFromStyle:0 toStyle:a4];
    }
  }
}

- (void)updateBannerTapGestureRecognizerForCallDisplayStyle:(int64_t)a3
{
  BOOL v3 = a3 == 0;
  id v4 = [(PHInCallRootViewController *)self bannerTapGestureRecognizer];
  [v4 setEnabled:v3];
}

- (void)bannerTapped:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transitioning scene to full screen due to tap", buf, 2u);
  }

  unsigned int v5 = [(PHInCallRootViewController *)self inCallWindowScene];

  if (v5) {
    TUDispatchMainIfNecessary();
  }
}

- (void)updateUPlusOneVideoCallViews
{
  uint64_t v3 = [(PHInCallRootViewController *)self inCallState];
  id v4 = +[UIApplication sharedApplication];
  unsigned int v5 = [v4 delegate];
  unsigned int v6 = [(PHInCallRootViewController *)self callCenter];
  id v7 = [v5 currentVideoCallUsingCallContainer:v6];

  id v8 = [(PHInCallRootViewController *)self callCenter];
  id v9 = [v8 activeConversationForCall:v7];

  if ((v3 & 0xFFFE) == 4)
  {
    id v10 = +[UIApplication sharedApplication];
    BOOL v11 = [v10 delegate];
    unsigned int v12 = [v11 currentInCallScene];
    if ([v12 presentationMode] == (id)1)
    {
      id v13 = [v9 resolvedAudioVideoMode];

      if (v13 == (id)2)
      {
        unsigned int v14 = sub_1000D5130();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Transitioning to fullscreen since we're transitioning to show an active video call", v25, 2u);
        }

        [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
      }
    }
    else
    {
    }
  }
  else if (!v3)
  {
    double v15 = [(PHInCallRootViewController *)self callDurationTimerForParticipantsView];
    [v15 invalidate];

    [(PHInCallRootViewController *)self setCallDurationTimerForParticipantsView:0];
  }
  id v16 = [(PHInCallRootViewController *)self traitCollection];
  BOOL v17 = [v16 _backlightLuminance] != (id)1;

  BOOL v18 = [(PHInCallRootViewController *)self updateContactInformationForParticipantViewWithInCallState:v3];
  unsigned int v19 = [(PHInCallRootViewController *)self updateSecondaryStringForParticipantViewWithInCallState:v3 allowsDuration:v17];
  if (!v18)
  {
LABEL_15:
    if (!v19) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  unsigned int v20 = [v9 link];
  unsigned int v21 = [v20 displayName];

  if (!v21 || !v19)
  {
    [(PHInCallRootViewController *)self setContactNameForParticipantsView:v18];
    goto LABEL_15;
  }
  [(PHInCallRootViewController *)self setSecondaryStringForParticipantsView:v19];
LABEL_16:
  double v22 = [v9 link];
  id v23 = [v22 displayName];

  if (v18 && v23) {
    [(PHInCallRootViewController *)self setContactNameForParticipantsView:v18];
  }
  else {
    [(PHInCallRootViewController *)self setSecondaryStringForParticipantsView:v19];
  }
LABEL_20:
  id v24 = [(PHInCallRootViewController *)self callParticipantLabelsView];
  [v24 updateParticipants];

  [(PHInCallRootViewController *)self updateBottomControlsViewWithInCallState:v3];
}

- (unsigned)inCallState
{
  uint64_t v3 = [(PHInCallRootViewController *)self callCenter];
  id v4 = [v3 currentCallCount];

  unsigned int v5 = [(PHInCallRootViewController *)self callCenter];
  id v6 = [v5 currentVideoCallCount];

  id v7 = [(PHInCallRootViewController *)self callCenter];
  id v8 = [v7 currentVideoCalls];

  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 138412290;
    v42[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState for non final chats %@", (uint8_t *)&v41, 0xCu);
  }

  if (v6)
  {
    if (!v4 && v6 == (id)1)
    {
      id v10 = [v8 lastObject];
      if ([v10 status] == 4
        || [v10 wantsHoldMusic])
      {
        BOOL v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v12 = [v10 status] == 4;
          unsigned int v13 = [v10 wantsHoldMusic];
          int v41 = 67109376;
          LODWORD(v42[0]) = v12;
          WORD2(v42[0]) = 1024;
          *(_DWORD *)((char *)v42 + 6) = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusRinging (%d) or call wants hold music (%d), setting state to PHInCallStateIncomingRinging", (uint8_t *)&v41, 0xEu);
        }
        unsigned __int16 v14 = 1;
        goto LABEL_38;
      }
      if ([v10 status] == 3)
      {
        BOOL v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          int v25 = "UpdateCurrentState: Call status is TUCallStatusSending, setting state to PHInCallStateOutgoingRinging";
LABEL_44:
          unsigned __int16 v14 = 2;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v41, 2u);
          goto LABEL_38;
        }
        goto LABEL_50;
      }
      if ([v10 status] == 1
        && [v10 isEndpointOnCurrentDevice])
      {
        BOOL v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v29 = [v10 isHostedOnCurrentDevice];
          unsigned int v30 = [(PHInCallRootViewController *)self callCenter];
          __int16 v31 = [v30 routeController];
          id v32 = [v31 pickedRoute];
          id v33 = [v32 deviceType];
          int v41 = 67109376;
          LODWORD(v42[0]) = v29;
          WORD2(v42[0]) = 2048;
          *(void *)((char *)v42 + 6) = v33;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, setting state to PHInCallStateSingleCallActive (hosted: %d, endpoint: 1, pickedRouteDeviceType: %ld)", (uint8_t *)&v41, 0x12u);
        }
        unsigned __int16 v14 = 4;
        goto LABEL_38;
      }
      if ([v10 status] == 1)
      {
        BOOL v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v34 = [v10 isHostedOnCurrentDevice];
          double v35 = [(PHInCallRootViewController *)self callCenter];
          CGFloat v36 = [v35 routeController];
          double v37 = [v36 pickedRoute];
          id v38 = [v37 deviceType];
          int v41 = 67109376;
          LODWORD(v42[0]) = v34;
          WORD2(v42[0]) = 2048;
          *(void *)((char *)v42 + 6) = v38;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, setting state to PHInCallStateIdle (hosted: %d, endpoint: 0, pickedRouteDeviceType: %ld)", (uint8_t *)&v41, 0x12u);
        }
        unsigned __int16 v14 = 0;
        goto LABEL_38;
      }
      if ([v10 status] != 5)
      {
        unsigned __int16 v14 = 0;
        goto LABEL_39;
      }
      BOOL v11 = sub_1000D5130();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v41) = 0;
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    BOOL v18 = [(PHInCallRootViewController *)self callCenter];
    id v19 = [v18 currentAudioAndVideoCallCount];

    if ((unint64_t)v19 >= 2)
    {
      unsigned int v20 = +[UIApplication sharedApplication];
      unsigned int v21 = [v20 delegate];
      double v22 = [(PHInCallRootViewController *)self callCenter];
      id v10 = [v21 currentVideoCallUsingCallContainer:v22];

      if ([v10 status] != 4
        && ![v10 wantsHoldMusic])
      {
        if ([v10 status] == 3)
        {
          BOOL v11 = sub_1000D5130();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            int v25 = "UpdateCurrentState: Current chat status is TUCallStatusSending, setting state to PHInCallStateOutgoingRinging";
            goto LABEL_44;
          }
LABEL_50:
          unsigned __int16 v14 = 2;
          goto LABEL_38;
        }
        unsigned int v39 = [v10 status];
        BOOL v11 = sub_1000D5130();
        BOOL v40 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v39 != 5)
        {
          if (v40)
          {
            LOWORD(v41) = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Multiple chats, setting state to PHInCallStateMultipleCallsActive", (uint8_t *)&v41, 2u);
          }
          unsigned __int16 v14 = 5;
          goto LABEL_38;
        }
        if (v40)
        {
          LOWORD(v41) = 0;
LABEL_61:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnecting, setting state to PHInCallStateEnding", (uint8_t *)&v41, 2u);
        }
LABEL_62:
        unsigned __int16 v14 = 6;
        goto LABEL_38;
      }
      id v23 = [(PHInCallRootViewController *)self callCenter];
      BOOL v11 = [v23 displayedCalls];

      if ([v11 count])
      {
        id v24 = [v11 firstObject];
      }
      else
      {
        id v24 = 0;
      }
      if ([v10 wantsHoldMusic])
      {
        double v26 = sub_1000D5130();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          __int16 v27 = "UpdateCurrentState: Current video call wants hold music, setting state to PHInCallStateIncomingRinging";
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v41, 2u);
        }
      }
      else
      {
        if (v4 != (id)1 || ![v10 isVideoUpgradeFromCall:v24])
        {
          double v26 = sub_1000D5130();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Incoming chat and active chat, setting state to PHInCallStateCallWaiting", (uint8_t *)&v41, 2u);
          }
          unsigned __int16 v14 = 3;
          goto LABEL_37;
        }
        double v26 = sub_1000D5130();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          __int16 v27 = "UpdateCurrentState: Incoming chat that is an upgrade, setting state to PHInCallStateIncomingRinging";
          goto LABEL_28;
        }
      }
      unsigned __int16 v14 = 1;
LABEL_37:

LABEL_38:
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    double v15 = +[UIApplication sharedApplication];
    id v16 = [v15 delegate];
    BOOL v17 = [v16 mostRecentlyDisconnectedVideoCall];

    if (v17)
    {
      id v10 = sub_1000D5130();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call has been disconnected, setting state to PHInCallStateEnded", (uint8_t *)&v41, 2u);
      }
      unsigned __int16 v14 = 7;
      goto LABEL_39;
    }
  }
  unsigned __int16 v14 = 0;
LABEL_40:

  return v14;
}

- (id)updateContactInformationForParticipantViewWithInCallState:(unsigned __int16)a3
{
  int v3 = a3;
  unsigned int v5 = +[UIApplication sharedApplication];
  id v6 = [v5 delegate];
  id v7 = v6;
  if (v3 == 7)
  {
    id v8 = [v6 mostRecentlyDisconnectedVideoCall];
  }
  else
  {
    id v9 = [(PHInCallRootViewController *)self callCenter];
    id v8 = [v7 currentVideoCallUsingCallContainer:v9];
  }
  if (v8)
  {
    id v10 = [objc_alloc((Class)TUContactsDataProviderFetchRequest) initWithCall:v8];
    BOOL v11 = [v8 contactIdentifier];
    [v10 setContactIdentifier:v11];

    uint64_t v35 = +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:1];
    v36[0] = v35;
    v36[1] = CNContactImageDataAvailableKey;
    BOOL v12 = +[NSArray arrayWithObjects:v36 count:2];
    [v10 setAuxiliaryKeysToFetch:v12];

    uint64_t v34 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v8];
    id v13 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v34];
    id v14 = [objc_alloc((Class)TUContactsDataProvider) initWithContactsDataSource:v13];
    double v15 = [v14 executeFetchRequest:v10];
    id v16 = [v8 handle];
    BOOL v17 = [v16 siriDisplayName];
    if (v17)
    {
      BOOL v18 = [v8 handle];
      unsigned int v19 = [v18 shouldHideContact];
    }
    else
    {
      unsigned int v19 = 0;
    }

    unsigned int v21 = [v15 contacts];
    id v22 = [v21 count];

    if (v22 == (id)1 && (v19 & 1) == 0)
    {
      id v23 = [v15 contacts];
      id v24 = [v23 firstObject];

      [(PHInCallRootViewController *)self setContactForParticipantsView:v24];
    }
    int v25 = [(PHInCallRootViewController *)self callCenter];
    double v26 = [v25 activeConversationForCall:v8];

    __int16 v27 = [v26 link];
    BOOL v28 = [v27 displayName];

    [(PHInCallRootViewController *)self setCallForParticipantsView:v8];
    if ([v8 isConversation] && v26)
    {
      unsigned int v30 = (void *)v34;
      unsigned int v29 = (void *)v35;
      if (v28)
      {
        id v31 = v28;
      }
      else
      {
        id v31 = [v26 displayName];
      }
      unsigned int v20 = v31;
    }
    else
    {
      if (v19)
      {
        id v32 = [v8 handle];
        unsigned int v20 = [v32 siriDisplayName];
      }
      else
      {
        unsigned int v20 = [v15 localizedName];
      }
      unsigned int v30 = (void *)v34;
      unsigned int v29 = (void *)v35;
    }
  }
  else
  {
    unsigned int v20 = 0;
  }

  return v20;
}

- (id)updateSecondaryStringForParticipantViewWithInCallState:(unsigned __int16)a3 allowsDuration:(BOOL)a4
{
  int v5 = a3;
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 delegate];
  id v9 = [(PHInCallRootViewController *)self callCenter];
  id v10 = [v8 currentVideoCallUsingCallContainer:v9];

  BOOL v11 = [(PHInCallRootViewController *)self callCenter];
  BOOL v12 = [v11 activeConversationForCall:v10];

  switch(v5)
  {
    case 0:
      id v13 = +[NSBundle conversationKit];
      id v14 = v13;
      CFStringRef v15 = @"STATUS_ENDED";
      goto LABEL_43;
    case 1:
      if (![v10 wantsHoldMusic]) {
        goto LABEL_7;
      }
      +[NSBundle conversationKit];
      if (a4) {
        id v16 = {;
      }
        BOOL v17 = [v16 localizedStringForKey:@"%@_HOLD_MUSIC" value:&stru_1002D6110 table:@"CallStatus"];
        BOOL v18 = [v10 callDurationString];
        id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);
      }
      else {
        id v16 = {;
      }
        id v14 = [v16 localizedStringForKey:@"HOLD_MUSIC" value:&stru_1002D6110 table:@"CallStatus"];
      }

      if ([v10 isConnected])
      {
        id v35 = v14;
        goto LABEL_44;
      }
      CGFloat v36 = +[NSBundle conversationKit];
      id v24 = [v36 localizedStringForKey:@"STATUS_CONNECTING" value:&stru_1002D6110 table:@"CallStatus"];

      goto LABEL_45;
    case 2:
      if ([v10 isConversation]) {
        BOOL v20 = v12 == 0;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20) {
        goto LABEL_39;
      }
      uint64_t v21 = [v12 link];
      if (!v21) {
        goto LABEL_39;
      }
      id v22 = (void *)v21;
      if ([v12 letMeInRequestState] == (id)1)
      {
      }
      else
      {
        id v37 = [v12 letMeInRequestState];

        if (v37 != (id)2)
        {
LABEL_39:
          unsigned __int8 v38 = [v10 isConnecting];
          id v14 = +[NSBundle conversationKit];
          if (v38) {
            CFStringRef v15 = @"STATUS_CONNECTING";
          }
          else {
            CFStringRef v15 = @"STATUS_WAITING";
          }
          goto LABEL_42;
        }
      }
      if ([v12 letMeInRequestState] == (id)2)
      {
        id v13 = +[NSBundle conversationKit];
        id v14 = v13;
        CFStringRef v15 = @"FACETIME_VIDEO_WAITING_FOR_LET_IN";
        goto LABEL_43;
      }
LABEL_38:
      id v24 = 0;
      goto LABEL_46;
    case 3:
LABEL_7:
      if (v12) {
        BOOL v19 = [v12 resolvedAudioVideoMode] == (id)1;
      }
      else {
        BOOL v19 = 0;
      }
      uint64_t v30 = [v12 link];
      if (v30)
      {
        id v31 = (void *)v30;
        id v32 = [v12 link];
        id v33 = [v32 displayName];

        if (v33)
        {
          id v24 = [v10 displayName];
          goto LABEL_46;
        }
      }
      id v14 = +[NSBundle conversationKit];
      if (v19) {
        CFStringRef v15 = @"FACETIME_AUDIO_INCOMING";
      }
      else {
        CFStringRef v15 = @"FACETIME_VIDEO_INCOMING";
      }
LABEL_42:
      id v13 = v14;
LABEL_43:
      id v35 = [v13 localizedStringForKey:v15 value:&stru_1002D6110 table:@"CallStatus"];
LABEL_44:
      id v24 = v35;
      goto LABEL_45;
    case 4:
    case 5:
      id v13 = +[NSBundle conversationKit];
      id v14 = v13;
      CFStringRef v15 = @"STATUS_CONNECTING";
      goto LABEL_43;
    case 6:
      id v13 = +[NSBundle conversationKit];
      id v14 = v13;
      CFStringRef v15 = @"STATUS_ENDING";
      goto LABEL_43;
    case 7:
      id v23 = +[NSBundle conversationKit];
      id v24 = [v23 localizedStringForKey:@"STATUS_ENDED" value:&stru_1002D6110 table:@"CallStatus"];

      int v25 = +[UIApplication sharedApplication];
      double v26 = [v25 delegate];
      id v14 = [v26 mostRecentlyDisconnectedVideoCall];

      if ([v14 disconnectedReason] == 14)
      {
        __int16 v27 = +[NSBundle conversationKit];
        BOOL v28 = v27;
        CFStringRef v29 = @"STATUS_FAILED";
LABEL_29:
        uint64_t v34 = [v27 localizedStringForKey:v29 value:&stru_1002D6110 table:@"CallStatus"];

        id v24 = (void *)v34;
        goto LABEL_45;
      }
      if ([v14 disconnectedReason] == 15
        || [v14 disconnectedReason] == 5)
      {
        __int16 v27 = +[NSBundle conversationKit];
        BOOL v28 = v27;
        CFStringRef v29 = @"STATUS_UNAVAILABLE";
        goto LABEL_29;
      }
LABEL_45:

LABEL_46:
      return v24;
    default:
      goto LABEL_38;
  }
}

- (void)updateBottomControlsViewWithInCallState:(unsigned __int16)a3
{
  if (a3 != 7)
  {
    if (a3 != 3)
    {
      if (a3 != 1) {
        goto LABEL_39;
      }
      id v4 = +[UIApplication sharedApplication];
      int v5 = [v4 delegate];
      id v6 = [(PHInCallRootViewController *)self callCenter];
      id v7 = [v5 incomingVideoCallUsingCallContainer:v6];

      id v8 = [(PHInCallRootViewController *)self bottomControlsView];
      id v9 = [v8 currentState];

      if (v9 == (id)9
        || +[PHSOSViewController isSOSDismissalAssertionActive])
      {
        unsigned int v60 = 0;
        id v10 = 0;
      }
      else
      {
        id v10 = [v7 isMessagingAllowed];
        unsigned int v60 = [v7 isReminderAllowed];
      }
      id v32 = [(PHInCallRootViewController *)self callCenter];
      BOOL v18 = [v32 activeConversationForCall:v7];

      if (v18 && [v18 resolvedAudioVideoMode] == (id)1)
      {
        if ([v18 isOneToOneModeEnabled]) {
          uint64_t v33 = 2;
        }
        else {
          uint64_t v33 = 3;
        }
      }
      else
      {
        uint64_t v33 = 1;
      }
      uint64_t v34 = [(PHInCallRootViewController *)self bottomControlsView];
      id v35 = +[UIApplication sharedApplication];
      CGFloat v36 = [v35 delegate];
      id v37 = [v36 currentInCallScene];
      if ([v37 isBeingShownAboveCoverSheet])
      {
        unsigned __int8 v38 = [(PHInCallRootViewController *)self callCenter];
        if ([v38 currentCallCount]) {
          uint64_t v39 = v33;
        }
        else {
          uint64_t v39 = 6;
        }
        [v34 setCurrentState:v39];
      }
      else
      {
        [v34 setCurrentState:v33];
      }

      BOOL v40 = [(PHInCallRootViewController *)self bottomControlsView];
      [v40 setDeclineAndMessageIsAvailable:v10];

      int v41 = [(PHInCallRootViewController *)self bottomControlsView];
      [v41 setDeclineAndRemindIsAvailable:v60];

      unsigned __int8 v42 = [(PHInCallRootViewController *)self bottomControlsView];
      [v42 setUsesLowerButtons:0];

      goto LABEL_37;
    }
    BOOL v20 = +[UIApplication sharedApplication];
    uint64_t v21 = [v20 delegate];
    uint64_t v22 = [(PHInCallRootViewController *)self callCenter];
    id v7 = [v21 incomingVideoCallUsingCallContainer:v22];

    id v23 = +[UIApplication sharedApplication];
    id v24 = [v23 delegate];
    LOBYTE(v22) = [v24 isPresentingAmbient];

    if ((v22 & 1) == 0) {
      [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
    }
    id v25 = [v7 isMessagingAllowed];
    double v26 = [(PHInCallRootViewController *)self bottomControlsView];
    [v26 setDeclineAndMessageIsAvailable:v25];

    id v27 = [v7 isReminderAllowed];
    BOOL v28 = [(PHInCallRootViewController *)self bottomControlsView];
    [v28 setDeclineAndRemindIsAvailable:v27];

    CFStringRef v29 = [(PHInCallRootViewController *)self bottomControlsView];
    [v29 setUserInteractionEnabled:1];

    BOOL v17 = [(PHInCallRootViewController *)self bottomControlsView];
    BOOL v18 = v17;
    uint64_t v19 = 9;
LABEL_14:
    [v17 setCurrentState:v19 animated:1 animationCompletionBlock:0];
LABEL_37:

    goto LABEL_38;
  }
  BOOL v11 = +[UIApplication sharedApplication];
  BOOL v12 = [v11 delegate];
  id v7 = [v12 mostRecentlyDisconnectedVideoCall];

  id v13 = sub_1000D5130();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v63 = [(PHInCallRootViewController *)self shouldShowVideoCallBlockAndReportScreen];
    __int16 v64 = 1024;
    unsigned int v65 = [v7 disconnectedReason];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[self shouldShowVideoCallBlockAndReportScreen]: %d, disconnectedCall.disconnectedReason: %d", buf, 0xEu);
  }

  if ([(PHInCallRootViewController *)self shouldShowVideoCallBlockAndReportScreen])
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHCallEndedBlockAndReportInProgressAssertionReason"];
    [(PHInCallRootViewController *)self requestInCallSceneTransitionToFullScreen];
    id v14 = [(PHInCallRootViewController *)self multiwayViewController];
    [v14 setIsInCallEndedBlockAndReportFlow:1];

    CFStringRef v15 = [(PHInCallRootViewController *)self bottomControlsView];
    [v15 setUserInteractionEnabled:1];

    id v16 = [(PHInCallRootViewController *)self bottomControlsView];
    [v16 setUsesLowerButtons:1];

    BOOL v17 = [(PHInCallRootViewController *)self bottomControlsView];
    BOOL v18 = v17;
    uint64_t v19 = 26;
    goto LABEL_14;
  }
  if ([v7 disconnectedReason] == 14
    && ([v7 isOutgoing] & 1) != 0
    || [v7 disconnectedReason] == 5
    || [v7 disconnectedReason] == 15)
  {
    uint64_t v30 = [(PHInCallRootViewController *)self callDisplayStyleManager];
    if ([v30 callDisplayStyle] == (id)4
      || +[PHInCallUIUtilities isSpringBoardPasscodeLocked])
    {
    }
    else
    {
      CGRect v55 = [v7 handle];
      __int16 v56 = [v55 value];
      id v57 = [v56 length];

      if (v57)
      {
        if ([v7 isMessagingAllowed])
        {
          uint64_t v58 = 17;
        }
        else if ([v7 isCallbackAllowed])
        {
          uint64_t v58 = 13;
        }
        else
        {
          uint64_t v58 = 18;
        }
        CGRect v59 = [(PHInCallRootViewController *)self bottomControlsView];
        [v59 setCurrentState:v58 animated:1 animationCompletionBlock:0];

        goto LABEL_38;
      }
    }
  }
  dispatch_time_t v31 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C73C8;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, block);
  [(PHInCallRootViewController *)self showFailureOrFallbackAlertIfNecessaryForCall:v7];
LABEL_38:

LABEL_39:
  id v43 = [(PHInCallRootViewController *)self callCenter];
  __int16 v44 = [v43 incomingVideoCall];

  if (v44)
  {
    double v45 = [(PHInCallRootViewController *)self bottomControlsView];
    CGFloat v46 = [v45 controlForActionType:13];

    uint64_t v47 = [(PHInCallRootViewController *)self bottomControlsView];
    unsigned int v48 = [v47 controlForActionType:9];

    if (!v48)
    {
      v49 = [(PHInCallRootViewController *)self bottomControlsView];
      unsigned int v48 = [v49 controlForActionType:12];
    }
    if (v46) {
      +[PHDeclineWithReminderController configureButton:v46 forIncomingCall:v44 presenter:self];
    }
    if (v48)
    {
      id v50 = [PHDeclineWithMessageController alloc];
      CGRect v51 = [(PHInCallRootViewController *)self multiwayViewController];
      CGRect v52 = [(PHInCallRootViewController *)self declineCallService];
      CGRect v53 = [(PHDeclineWithMessageController *)v50 initWithIncomingCall:v44 customMessagePresentingViewController:v51 declineCallService:v52];
      [(PHInCallRootViewController *)self setDeclineWithMessageController:v53];

      __int16 v54 = [(PHInCallRootViewController *)self declineWithMessageController];
      [v54 configureDeclineMessageForButton:v48];
    }
  }
  [(PHInCallRootViewController *)self refreshBottomBarButtonLayout];
}

- (void)sceneDidConnect
{
  int v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  int v5 = [v4 currentInCallScene];

  if (v5)
  {
    [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
    id v6 = [(PHInCallRootViewController *)self audioCallViewControllerIfLoaded];
    [v6 updateIncomingBottomBarControlState];

    [(PHInCallRootViewController *)self updateBackgroundStartPipAuthorizationState];
    [(PHInCallRootViewController *)self updateInCallWindowScenePrefersHiddenWhenDismissed];
  }
}

- (void)wantsHoldMusicChangedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "wantsHoldMusicChangedNotification", buf, 2u);
  }

  int v5 = +[UIApplication sharedApplication];
  id v6 = [v5 delegate];
  id v7 = [(PHInCallRootViewController *)self callCenter];
  id v8 = [v6 currentVideoCallUsingCallContainer:v7];
  unsigned int v9 = [v8 wantsHoldMusic];

  if (v9)
  {
    id v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "decline with reminder and decline with message unavailable due to call wanting hold music.", v15, 2u);
    }

    BOOL v11 = [(PHInCallRootViewController *)self bottomControlsView];
    [v11 setDeclineAndMessageIsAvailable:0];

    BOOL v12 = [(PHInCallRootViewController *)self bottomControlsView];
    [v12 setDeclineAndRemindIsAvailable:0];

    [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
    id v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateUPlusOneVideoCallViews" selector:0 userInfo:1 repeats:1.0];
    [(PHInCallRootViewController *)self setCallDurationTimerForParticipantsView:v13];
  }
  else
  {
    id v14 = [(PHInCallRootViewController *)self callDurationTimerForParticipantsView];
    [v14 invalidate];

    [(PHInCallRootViewController *)self setCallDurationTimerForParticipantsView:0];
    [(PHInCallRootViewController *)self transitionFromBannerToDismissedIfNecessary];
  }
}

- (void)refreshBottomBarButtonLayout
{
  int v3 = [(PHInCallRootViewController *)self bottomControlsView];
  [v3 setUsesLowerButtons:1];

  id v4 = [(PHInCallRootViewController *)self bottomControlsView];
  [v4 setUsesLowerButtons:0];
}

- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return [(PHInCallRootViewController *)self contactForParticipantsView];
}

- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return [(PHInCallRootViewController *)self contactNameForParticipantsView];
}

- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return [(PHInCallRootViewController *)self callForParticipantsView];
}

- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5
{
  id v6 = [(PHInCallRootViewController *)self updateSecondaryStringForParticipantViewWithInCallState:[(PHInCallRootViewController *)self inCallState] allowsDuration:a5];
  [(PHInCallRootViewController *)self setSecondaryStringForParticipantsView:v6];

  labelDescriptorFactordouble y = self->_labelDescriptorFactory;
  id v8 = [(PHInCallRootViewController *)self secondaryStringForParticipantsView];
  unsigned int v9 = [(CNKCallParticipantLabelDescriptorFactory *)labelDescriptorFactory makeLabelWithString:v8];

  return v9;
}

- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 0;
}

- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 3;
}

- (unint64_t)numberOfParticipantsForParticipantsView:(id)a3
{
  return 1;
}

- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 0;
}

- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 1;
}

- (BOOL)shouldShowCallDetailsViewButton
{
  return 0;
}

- (BOOL)shouldShowSingleDurationLabelInParticipantsView:(id)a3
{
  return 0;
}

- (id)overrideStringForParticipantsView:(id)a3
{
  return 0;
}

- (BOOL)shouldShowLargeAvatar
{
  return 0;
}

- (BOOL)shouldShowParticipantLabel
{
  return 1;
}

- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  if (+[PHDevice isGeminiCapable])
  {
    int v5 = +[UIApplication sharedApplication];
    id v6 = [v5 delegate];
    id v7 = [(PHInCallRootViewController *)self callCenter];
    id v8 = [v6 currentVideoCallUsingCallContainer:v7];

    unsigned int v9 = [v8 provider];
    id v10 = [v9 prioritizedSenderIdentities];
    id v11 = [v10 count];

    if ((unint64_t)v11 < 2)
    {
      id v13 = 0;
    }
    else
    {
      BOOL v12 = [v8 localSenderIdentity];
      id v13 = [v12 localizedShortName];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PHInCallRootViewController *)self callParticipantLabelsView];

  if (v7 == v6)
  {
    [(PHInCallRootViewController *)self performBottomBarActionType:a4];
  }
  else
  {
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(PHInCallRootViewController *)self callParticipantLabelsView];
      int v10 = 134218242;
      int64_t v11 = a4;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown call participants view object %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)linkNameForCall:(id)a3
{
  id v4 = a3;
  if ([v4 isConversation])
  {
    int v5 = [(PHInCallRootViewController *)self callCenter];
    id v6 = [v5 activeConversationForCall:v4];

    id v7 = [v6 link];
    if (v7)
    {
      id v8 = v7;
      if ([v7 isLocallyCreated]
        && ([v6 letMeInRequestState] == (id)1 || objc_msgSend(v6, "letMeInRequestState") == (id)2)
        && ([v8 linkName],
            unsigned int v9 = objc_claimAutoreleasedReturnValue(),
            id v10 = [v9 length],
            v9,
            !v10))
      {
        id v13 = +[NSBundle mainBundle];
        int64_t v11 = [v13 localizedStringForKey:@"FACETIME_LINK" value:&stru_1002D6110 table:@"InCallService"];
      }
      else
      {
        int64_t v11 = [v6 displayName];
      }
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (BOOL)isCallRinging
{
  return 0;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  return 2;
}

- (void)bottomBarActionPerformed:(int64_t)a3 withCompletionState:(int64_t)a4 fromBar:(id)a5
{
  id v7 = a5;
  id v8 = [(PHInCallRootViewController *)self bottomControlsView];

  if (v8 == v7)
  {
    [(PHInCallRootViewController *)self performBottomBarActionType:a3];
  }
  else
  {
    unsigned int v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      int64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown bottom bar %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)performBottomBarActionType:(int64_t)a3
{
  int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PHInCallRootViewController *)self bottomControlsView];
    id v7 = [v6 nameForActionType:a3];
    *(_DWORD *)buf = 138412290;
    *(void *)int v92 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BottomBarActionPerformed: %@", buf, 0xCu);
  }
  id v8 = +[UIApplication sharedApplication];
  unsigned int v9 = [v8 delegate];
  int v10 = [(PHInCallRootViewController *)self callCenter];
  int64_t v11 = [v9 currentVideoCallUsingCallContainer:v10];

  __int16 v12 = +[UIApplication sharedApplication];
  id v13 = [v12 delegate];
  id v14 = [(PHInCallRootViewController *)self callCenter];
  CFStringRef v15 = [v13 incomingVideoCallUsingCallContainer:v14];

  id v16 = [(PHInCallRootViewController *)self callCenter];
  BOOL v17 = [v16 activeConversationForCall:v15];

  switch(a3)
  {
    case 1:
    case 3:
      v85 = v11;
      id v27 = [v17 resolvedAudioVideoMode];
      BOOL v28 = +[UIApplication sharedApplication];
      CFStringRef v29 = [v28 delegate];
      uint64_t v30 = [v29 currentInCallScene];
      id v31 = [v30 presentationMode];

      if (v31 == (id)1 && v27 == (id)2)
      {
        id v32 = +[UIApplication sharedApplication];
        uint64_t v33 = [v32 delegate];
        uint64_t v34 = [v33 currentInCallScene];
        [v34 requestTransitionToPresentationMode:2 isUserInitiated:0 analyticsSource:@"SBSUIInCallTransitionAnalyticsSourceAnswerFaceTimeButtonPress"];

        int64_t v11 = v85;
      }
      else
      {
        int64_t v11 = v85;
        if (![v85 wantsHoldMusic])
        {
          uint64_t v73 = [(PHInCallRootViewController *)self callCenter];
          uint64_t v21 = [v73 activeConversationForCall:v85];

          if (![v85 isConversation]
            || [v85 status] != 4
            || ([v85 isSendingVideo] & 1) != 0
            || ([v21 isOneToOneModeEnabled] & 1) != 0)
          {
            unsigned int v74 = sub_1000D5130();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v82 = v27 == (id)2;
              uint64_t v84 = v21;
              id v81 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 resolvedAudioVideoMode]);
              v80 = [v17 activeRemoteParticipants];
              uint64_t v83 = +[UIApplication sharedApplication];
              uint64_t v75 = [v83 delegate];
              v76 = [v75 currentInCallScene];
              v77 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v76 presentationMode]);
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)int v92 = v82;
              *(_WORD *)&v92[4] = 2112;
              *(void *)&v92[6] = v81;
              *(_WORD *)&v92[14] = 2112;
              *(void *)&v92[16] = v80;
              __int16 v93 = 2112;
              unsigned int v94 = v77;
              __int16 v95 = 2112;
              v96 = v15;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Answering FaceTime Video call. hasPartWithVideoEnabled: %d, resolvedAudioVideoMode: %@, participants: %@, banner: %@, incomingCall: %@", buf, 0x30u);

              uint64_t v21 = v84;
              int64_t v11 = v85;
            }
            id v40 = [(PHInCallRootViewController *)self callCenter];
            [v40 answerCall:v15];
            goto LABEL_70;
          }
          v79 = sub_1000D5130();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Answering a ringing conversation while video is disabled, updating answer behavior to downgrade to audio so we join conversation with video disabled as well.", buf, 2u);
          }

          id v40 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v15];
          [v40 setBehavior:4];
          [v40 setDowngradeToAudio:1];
          int v41 = [(PHInCallRootViewController *)self callCenter];
          [v41 answerWithRequest:v40];
          goto LABEL_16;
        }
        [v85 resetWantsHoldMusic];
        [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
      }
      goto LABEL_72;
    case 4:
      id v43 = [(PHInCallRootViewController *)self callCenter];
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_1000C8B5C;
      v88[3] = &unk_1002CDDE0;
      id v89 = v15;
      id v90 = v43;
      id v44 = v43;
      double v45 = objc_retainBlock(v88);
      ((void (*)(void))v45[2])();

      goto LABEL_37;
    case 5:
      id v44 = [(PHInCallRootViewController *)self callCenter];
      [v44 answerCall:v15];
      goto LABEL_37;
    case 7:
    case 8:
    case 15:
      BOOL v18 = +[UIApplication sharedApplication];
      uint64_t v19 = [v18 delegate];
      BOOL v20 = [(PHInCallRootViewController *)self callCenter];
      uint64_t v21 = [v19 incomingVideoCallUsingCallContainer:v20];

      if (v21)
      {
        uint64_t v22 = sub_1000D5130();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)int v92 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ending FaceTime %@", buf, 0xCu);
        }

        id v23 = [(PHInCallRootViewController *)self callCenter];
        [v23 disconnectCall:v21 withReason:2];
LABEL_63:

        goto LABEL_71;
      }
      id v35 = [(PHInCallRootViewController *)self callCenter];
      CGFloat v36 = [v35 activeVideoCall];

      if (!v36)
      {
        [(PHInCallRootViewController *)self updateUPlusOneVideoCallViews];
        goto LABEL_71;
      }
      id v37 = sub_1000D5130();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v38 = [(PHInCallRootViewController *)self callCenter];
        uint64_t v39 = [v38 activeVideoCall];
        *(_DWORD *)buf = 138412290;
        *(void *)int v92 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Ending FaceTime %@", buf, 0xCu);
      }
      id v40 = [(PHInCallRootViewController *)self callCenter];
      int v41 = [(PHInCallRootViewController *)self callCenter];
      unsigned __int8 v42 = [v41 activeVideoCall];
      [v40 disconnectCall:v42];

LABEL_16:
      goto LABEL_70;
    case 14:
    case 19:
      id v24 = +[UIApplication sharedApplication];
      id v25 = [v24 delegate];
      [v25 setMostRecentlyDisconnectedVideoCall:0];

      CFStringRef v26 = @"PHMulitwayCallAssertionReason";
      goto LABEL_43;
    case 18:
      unsigned int v66 = +[UIApplication sharedApplication];
      v67 = [v66 delegate];
      uint64_t v21 = [v67 mostRecentlyDisconnectedVideoCall];

      if (v21)
      {
        id v23 = [(PHInCallRootViewController *)self callCenter];
        v68 = [v21 dialRequestForRedial];
        [v23 launchAppForDialRequest:v68 completion:0];
      }
      else
      {
        id v23 = sub_1000D5130();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1001EBBA8();
        }
      }
      goto LABEL_63;
    case 24:
      id v44 = [(PHInCallRootViewController *)self callCenter];
      [v44 disconnectCall:v15 withReason:2];
LABEL_37:

      goto LABEL_72;
    case 27:
      CGFloat v46 = +[UIApplication sharedApplication];
      uint64_t v47 = [v46 delegate];
      uint64_t v21 = [v47 mostRecentlyDisconnectedVideoCall];

      unsigned int v48 = [v21 handle];
      id v40 = [v48 value];

      v49 = sub_1000D5130();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)int v92 = v21;
        *(_WORD *)&v92[8] = 2112;
        *(void *)&v92[10] = v40;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Call %@; Destination ID %@", buf, 0x16u);
      }

      if ([v40 destinationIdIsPhoneNumber])
      {
        id v50 = v11;
        CGRect v51 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage();
        if (!v51)
        {
          CGRect v51 = TUActiveCountryCode();
        }
        CGRect v52 = TUNetworkCountryCode();
        uint64_t v53 = TUNumberToDial();

        id v40 = (id)v53;
        int64_t v11 = v50;
      }
      id v54 = objc_alloc_init((Class)MFMessageComposeViewController);
      [v54 setBody:&stru_1002D6110];
      [v54 setMessageComposeDelegate:self];
      [v54 _setCanEditRecipients:0];
      if (v40 && [v40 length])
      {
        CGRect v55 = +[NSArray arrayWithObject:v40];
        [v54 setRecipients:v55];
      }
      else
      {
        CGRect v55 = sub_1000D5130();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_1001EBC10();
        }
      }

      [(PHInCallRootViewController *)self presentViewController:v54 animated:1 completion:0];
      goto LABEL_69;
    case 33:
      __int16 v56 = v11;
      id v57 = sub_1000D5130();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on block caller", buf, 2u);
      }

      uint64_t v21 = [(PHInCallRootViewController *)self callCenter];
      id v40 = [v21 currentVideoCall];
      uint64_t v58 = +[UIApplication sharedApplication];
      CGRect v59 = [v58 delegate];
      id v54 = [v59 mostRecentlyDisconnectedVideoCall];

      if (v40)
      {
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_1000C8C0C;
        v87[3] = &unk_1002CD540;
        v87[4] = self;
        [(PHInCallRootViewController *)self presentBlockAndReportAlertToBlockCall:v54 forViewController:self completion:v87];
        int64_t v11 = v56;
        goto LABEL_69;
      }
      int64_t v11 = v56;
      if (v54)
      {
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_1000C8CC0;
        v86[3] = &unk_1002CD540;
        v86[4] = self;
        [(PHInCallRootViewController *)self presentBlockAndReportAlertToBlockCall:v54 forViewController:self completion:v86];
        goto LABEL_69;
      }
      unsigned int v65 = sub_1000D5130();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      goto LABEL_68;
    case 34:
      unsigned int v60 = v11;
      v61 = sub_1000D5130();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on create contact", buf, 2u);
      }

      uint64_t v21 = [(PHInCallRootViewController *)self callCenter];
      id v40 = [v21 currentVideoCall];
      v62 = +[UIApplication sharedApplication];
      unsigned int v63 = [v62 delegate];
      id v54 = [v63 mostRecentlyDisconnectedVideoCall];

      if (v40)
      {
        __int16 v64 = [v40 handle];
        [(PHInCallRootViewController *)self presentCreateContactViewControllerWithHandle:v64 forViewController:self];

        unsigned int v65 = [(PHInCallRootViewController *)self multiwayViewController];
        [v65 setIsInCallEndedBlockAndReportFlow:0];
        int64_t v11 = v60;
      }
      else
      {
        int64_t v11 = v60;
        if (v54)
        {
          v78 = [v54 handle];
          [(PHInCallRootViewController *)self presentCreateContactViewControllerWithHandle:v78 forViewController:self];

          unsigned int v65 = [(PHInCallRootViewController *)self multiwayViewController];
          [v65 setIsInCallEndedBlockAndReportFlow:0];
        }
        else
        {
          unsigned int v65 = sub_1000D5130();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
LABEL_67:
          }
            sub_1001EBBDC();
        }
      }
LABEL_68:

LABEL_69:
LABEL_70:

LABEL_71:
LABEL_72:

      return;
    case 35:
      v69 = +[UIApplication sharedApplication];
      v70 = [v69 delegate];
      [v70 setMostRecentlyDisconnectedVideoCall:0];

      v71 = sub_1000D5130();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on close", buf, 2u);
      }

      v72 = [(PHInCallRootViewController *)self multiwayViewController];
      [v72 setIsInCallEndedBlockAndReportFlow:0];

      CFStringRef v26 = @"PHCallEndedBlockAndReportInProgressAssertionReason";
LABEL_43:
      uint64_t v21 = +[NSSet setWithObject:v26];
      +[PHInCallRootViewController releaseDismissalAssertionReasons:v21];
      goto LABEL_71;
    default:
      goto LABEL_72;
  }
}

- (void)handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:(int64_t)a3
{
  int v5 = [(PHInCallRootViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHInCallRootViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  id v7 = [(PHInCallRootViewController *)self callDisplayStyleManager];
  if ([v7 callDisplayStyle] == (id)1)
  {
    id v8 = [(PHInCallRootViewController *)self callCenter];
    unsigned int v9 = [v8 incomingVideoCall];
    unsigned int v10 = [v9 isConversation];
  }
  else
  {
    unsigned int v10 = 0;
  }

  int64_t v11 = [(PHInCallRootViewController *)self callCenter];
  if (([v11 hasCurrentVideoCalls] & 1) != 0 || v10)
  {
  }
  else
  {
    __int16 v12 = [(PHInCallRootViewController *)self multiwayViewController];
    unsigned __int8 v13 = [v12 isInVideoMessageFlow];

    if ((v13 & 1) == 0) {
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
    }
  }
  id v14 = [(PHInCallRootViewController *)self callCenter];
  CFStringRef v15 = +[UIApplication sharedApplication];
  id v16 = [v15 delegate];
  BOOL v17 = [v16 incomingVideoCallUsingCallContainer:v14];

  BOOL v18 = +[UIApplication sharedApplication];
  uint64_t v19 = [v18 delegate];
  BOOL v20 = [v19 currentVideoCallUsingCallContainer:v14];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C90E4;
  v34[3] = &unk_1002CDFE8;
  id v21 = v14;
  id v35 = v21;
  id v22 = v17;
  id v36 = v22;
  id v23 = v20;
  id v37 = v23;
  id v24 = objc_retainBlock(v34);
  if (a3 == 2) {
    goto LABEL_12;
  }
  if (!v22) {
    goto LABEL_16;
  }
  if ([v22 shouldSuppressRingtone])
  {
    if ([v22 shouldSuppressRingtone])
    {
LABEL_12:
      ((void (*)(void *))v24[2])(v24);
      goto LABEL_20;
    }
LABEL_16:
    if (v23) {
      +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss];
    }
    goto LABEL_20;
  }
  uint64_t v33 = +[UIApplication sharedApplication];
  id v25 = [v33 delegate];
  CFStringRef v26 = [v25 currentInCallScene];
  id v27 = [v26 delegate];
  BOOL v28 = [v27 callAnalyticsLogger];
  CFStringRef v29 = [v22 uniqueProxyIdentifierUUID];
  [v28 ringerMutedForCallUUID:v29];

  [v22 suppressRingtone];
  if ([v22 status] == 4)
  {
    uint64_t v30 = +[UIApplication sharedApplication];
    id v31 = [v30 delegate];
    id v32 = [v31 bannerPresentationManager];
    [v32 invalidatePersistentSystemApertureAlertWithReason:@"Hardware lock button pressed"];
  }
LABEL_20:
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
}

- (void)sendUserRating:(int)a3 dontShowPromptAgain:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : User has rating: %d and BOOL: %d", buf, 0xEu);
  }

  if (v4)
  {
    id v8 = +[ICSPreferences sharedPreferences];
    [v8 setHasUserScoreFeedbackViewHidden:1];
  }
  if (v5 != -1)
  {
    unsigned int v9 = [(PHInCallRootViewController *)self callCenter];
    unsigned int v10 = [(PHInCallRootViewController *)self disconnectCallUUID];
    [v9 sendUserScoreToRTCReporting:v10 withScore:v5];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C943C;
  v11[3] = &unk_1002CD518;
  void v11[4] = self;
  [(PHInCallRootViewController *)self dismissViewControllerAnimated:1 completion:v11];
}

- (void)updateInCallWindowScenePrefersHiddenWhenDismissed
{
  int v3 = [(PHInCallRootViewController *)self inCallWindowScene];

  if (v3)
  {
    if ([(PHInCallRootViewController *)self isPresentingCallDetailsView]
      && (+[UIApplication sharedApplication],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          [v4 delegate],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 didDeepLinkToCallDetailsView],
          v5,
          v4,
          !v6))
    {
      BOOL v9 = 1;
    }
    else
    {
      id v7 = [(PHInCallRootViewController *)self callCenter];
      id v8 = [v7 frontmostBargeCall];
      BOOL v9 = v8 != 0;
    }
    unsigned int v10 = [(PHInCallRootViewController *)self callCenter];
    int64_t v11 = [v10 frontmostCall];

    if (v11)
    {
      __int16 v12 = [v11 provider];
      if ([v12 supportsDynamicSystemUI])
      {
        int v13 = [(PHInCallRootViewController *)self featureFlags];
        if ([v13 groupConversations]) {
          int HasChinaSKU = TUDeviceHasChinaSKU();
        }
        else {
          int HasChinaSKU = 0;
        }
      }
      else
      {
        int HasChinaSKU = 0;
      }
    }
    else
    {
      int HasChinaSKU = 0;
    }
    uint64_t v15 = HasChinaSKU | v9;
    id v16 = [(PHInCallRootViewController *)self inCallWindowScene];
    unsigned int v17 = [v16 prefersHiddenWhenDismissed];

    if (v15 != v17)
    {
      BOOL v18 = sub_1000D5130();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(PHInCallRootViewController *)self inCallWindowScene];
        BOOL v20 = (void *)v19;
        CFStringRef v21 = @"NO";
        if (v15) {
          CFStringRef v21 = @"YES";
        }
        int v23 = 138412546;
        uint64_t v24 = v19;
        __int16 v25 = 2112;
        CFStringRef v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating scene: %@ prefersHiddenWhenDismissed: %@", (uint8_t *)&v23, 0x16u);
      }
      id v22 = [(PHInCallRootViewController *)self inCallWindowScene];
      [v22 setPrefersHiddenWhenDismissed:v15];
    }
  }
}

- (void)updateInCallWindowSceneFaceTimeLaunchBehavior
{
  int v3 = [(PHInCallRootViewController *)self inCallWindowScene];

  if (v3)
  {
    uint64_t v4 = [(PHInCallRootViewController *)self shouldShowInCallWindowScene] ^ 1;
    id v5 = [(PHInCallRootViewController *)self inCallWindowScene];
    [v5 setShouldNeverBeShownWhenLaunchingFaceTime:v4];
  }
}

- (BOOL)shouldShowInCallWindowScene
{
  int v3 = [(PHInCallRootViewController *)self callCenter];
  uint64_t v4 = [v3 conversationManager];
  id v5 = [v4 avLessConversation];

  unsigned int v6 = [(PHInCallRootViewController *)self currentViewController];
  id v7 = [(PHInCallRootViewController *)self pttFullScreenContainerViewController];

  return v6 != v7 && v5 == 0;
}

- (void)wantsDismissal
{
  int v3 = +[UIApplication sharedApplication];
  uint64_t v4 = [v3 delegate];
  [v4 setDidDeepLinkToCallDetailsView:0];

  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationDetailsViewAssertionReason"];
  id v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 delegate];
  [v6 setDidDeepLinkToPTTCallDetailsView:0];

  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
  id v7 = [(PHInCallRootViewController *)self inCallWindowScene];
  [v7 requestTransitionToPresentationMode:0 shouldDismissCMASAlerts:0];

  [(PHInCallRootViewController *)self updateInCallWindowScenePrefersHiddenWhenDismissed];
}

- (void)presentDisconnectionAlert:(id)a3
{
  id v6 = a3;
  uint64_t v4 = +[CNKFeatures sharedInstance];
  unsigned __int8 v5 = [v4 isEnhancedEmergencyEnabled];

  if ((v5 & 1) == 0) {
    [(PHInCallRootViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (BOOL)isShowSOSConfirmationSupported
{
  return 1;
}

- (void)handleCallBufferNotification:(id)a3
{
  uint64_t v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController,handleCallBufferNotification", v5, 2u);
  }

  [(PHInCallRootViewController *)self updateCallControllerForCurrentState];
}

- (void)acceptCallButtonTapped:(id)a3
{
  uint64_t v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController.acceptCallButtonTapped", v5, 2u);
  }

  [(PHInCallRootViewController *)self _obtainThenReleaseTransitionAssertion];
}

- (BOOL)_shouldAutoAnswer
{
  unsigned __int8 v2 = +[IMLockdownManager sharedInstance];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    uint64_t v4 = sub_10000FA3C(@"autoAnswerInvites", @"com.apple.conference");
    if ([v4 BOOLValue])
    {
      unsigned __int8 v5 = +[TUCallCenter sharedInstance];
      id v6 = [v5 incomingCall];

      id v7 = +[TUCallCenter sharedInstance];
      id v8 = [v7 currentCallCount];

      BOOL v9 = +[TUCallCenter sharedInstance];
      unsigned int v10 = [v9 incomingVideoCall];

      int64_t v11 = +[TUCallCenter sharedInstance];
      id v12 = [v11 currentVideoCallCount];

      if (v8 == (id)1 && [v6 service] == 2) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v12 == (id)1 && [v10 service] == 3;
      }
      __int16 v14 = sub_1000D5130();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v15 = @"NO";
        int v17 = 138413314;
        if (v13) {
          CFStringRef v15 = @"YES";
        }
        CFStringRef v18 = v15;
        __int16 v19 = 2048;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2048;
        id v24 = v12;
        __int16 v25 = 2112;
        CFStringRef v26 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Auto Answer is %@ - call count is %lu (incoming call: %@), video call count is %lu (incoming video call: %@)", (uint8_t *)&v17, 0x34u);
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)setupAutoAnswer
{
  if ([(PHInCallRootViewController *)self _shouldAutoAnswer])
  {
    unsigned int v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up auto answer", v4, 2u);
    }

    [(PHInCallRootViewController *)self performSelector:"autoAnswer" withObject:0 afterDelay:5.0];
  }
}

- (void)cancelAutoAnswer
{
  if ([(PHInCallRootViewController *)self _shouldAutoAnswer])
  {
    unsigned int v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling auto answer", v4, 2u);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"autoAnswer" object:0];
  }
}

- (void)autoAnswer
{
  [(PHInCallRootViewController *)self cancelAutoAnswer];
  if ([(PHInCallRootViewController *)self _shouldAutoAnswer])
  {
    unsigned int v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Auto answering", v10, 2u);
    }

    uint64_t v4 = +[TUCallCenter sharedInstance];
    unsigned __int8 v5 = [v4 incomingCall];

    if (v5)
    {
      id v6 = +[TUCallCenter sharedInstance];
      [v6 answerCall:v5];
    }
    id v7 = +[TUCallCenter sharedInstance];
    id v8 = [v7 incomingVideoCall];

    if (v8)
    {
      BOOL v9 = +[TUCallCenter sharedInstance];
      [v9 answerCall:v8];
    }
  }
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (BOOL)dismissalWasDemandedBeforeRemoteViewControllerWasAvailable
{
  return self->_dismissalWasDemandedBeforeRemoteViewControllerWasAvailable;
}

- (void)setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:(BOOL)a3
{
  self->_dismissalWasDemandedBeforeRemoteViewControllerWasAvailable = a3;
}

- (int64_t)alertActivationReason
{
  return self->_alertActivationReason;
}

- (void)setAlertActivationReason:(int64_t)a3
{
  self->_alertActivationReason = a3;
}

- (TUCall)alertActivationCall
{
  return self->_alertActivationCall;
}

- (void)setAlertActivationCall:(id)a3
{
}

- (void)setAudioCallViewController:(id)a3
{
}

- (PHAudioCallViewControllerWrapper)audioCallViewControllerWrapper
{
  return self->_audioCallViewControllerWrapper;
}

- (void)setAudioCallViewControllerWrapper:(id)a3
{
}

- (PHEmergencyDialerViewController)emergencyDialerViewController
{
  return self->_emergencyDialerViewController;
}

- (void)setEmergencyDialerViewController:(id)a3
{
}

- (void)setSosViewController:(id)a3
{
}

- (CNKMultiwayViewControllerProtocol)multiwayViewController
{
  return self->_multiwayViewController;
}

- (void)setMultiwayViewController:(id)a3
{
}

- (ICSCoverViewController)coverViewController
{
  return self->_coverViewController;
}

- (void)setCoverViewController:(id)a3
{
}

- (PHScreenTimeHostViewController)screenTimeHostViewController
{
  return self->_screenTimeHostViewController;
}

- (void)setScreenTimeHostViewController:(id)a3
{
}

- (PHUserFeedbackViewController)userFeedbackViewController
{
  return self->_userFeedbackViewController;
}

- (void)setUserFeedbackViewController:(id)a3
{
}

- (PHPTTFullScreenContainerViewController)pttFullScreenContainerViewController
{
  return self->_pttFullScreenContainerViewController;
}

- (void)setPttFullScreenContainerViewController:(id)a3
{
}

- (void)setCurrentViewController:(id)a3
{
}

- (void)setVideoCallNavigationController:(id)a3
{
}

- (UIViewController)oldMultiwayPIPViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oldMultiwayPIPViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setOldMultiwayPIPViewController:(id)a3
{
}

- (CNContactPickerViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
}

- (void)setAudioCallNavigationController:(id)a3
{
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
}

- (PHPhoneRemoteHostViewController)remoteHostViewController
{
  return self->_remoteHostViewController;
}

- (void)setRemoteHostViewController:(id)a3
{
}

- (CNKSceneVisibilityHandler)callDetailsNavigationController
{
  return self->_callDetailsNavigationController;
}

- (void)setCallDetailsNavigationController:(id)a3
{
}

- (UIView)transportIndicatorView
{
  return self->_transportIndicatorView;
}

- (void)setTransportIndicatorView:(id)a3
{
}

- (SBUIRemoteAlertButtonAction)currentAlertButtonAction
{
  return self->_currentAlertButtonAction;
}

- (TUFilteredRequest)filteredRequest
{
  return self->_filteredRequest;
}

- (void)setFilteredRequest:(id)a3
{
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (BOOL)allowHomeOutDismissal
{
  return self->_allowHomeOutDismissal;
}

- (void)setAllowHomeOutDismissal:(BOOL)a3
{
  self->_allowHomeOutDismissal = a3;
}

- (BOOL)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(BOOL)a3
{
  self->_shouldHideStatusBar = a3;
}

- (BOOL)isPresentingCoverView
{
  return self->_isPresentingCoverView;
}

- (void)setIsPresentingCoverView:(BOOL)a3
{
  self->_isPresentingCoverView = a3;
}

- (UITapGestureRecognizer)bannerTapGestureRecognizer
{
  return self->_bannerTapGestureRecognizer;
}

- (PHCallParticipantsView)callParticipantLabelsView
{
  return self->_callParticipantLabelsView;
}

- (void)setCallParticipantLabelsView:(id)a3
{
}

- (CNContact)contactForParticipantsView
{
  return self->_contactForParticipantsView;
}

- (void)setContactForParticipantsView:(id)a3
{
}

- (TUCall)callForParticipantsView
{
  return self->_callForParticipantsView;
}

- (void)setCallForParticipantsView:(id)a3
{
}

- (NSString)contactNameForParticipantsView
{
  return self->_contactNameForParticipantsView;
}

- (void)setContactNameForParticipantsView:(id)a3
{
}

- (NSString)secondaryStringForParticipantsView
{
  return self->_secondaryStringForParticipantsView;
}

- (void)setSecondaryStringForParticipantsView:(id)a3
{
}

- (NSTimer)callDurationTimerForParticipantsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callDurationTimerForParticipantsView);

  return (NSTimer *)WeakRetained;
}

- (void)setCallDurationTimerForParticipantsView:(id)a3
{
}

- (PHBottomBar)bottomControlsView
{
  return self->_bottomControlsView;
}

- (void)setBottomControlsView:(id)a3
{
}

- (PHDeclineWithMessageController)declineWithMessageController
{
  return self->_declineWithMessageController;
}

- (void)setDeclineWithMessageController:(id)a3
{
}

- (PHAlertController)failureAlertController
{
  return self->_failureAlertController;
}

- (void)setFailureAlertController:(id)a3
{
}

- (NSString)disconnectCallUUID
{
  return self->_disconnectCallUUID;
}

- (void)setDisconnectCallUUID:(id)a3
{
}

- (BOOL)temporarilyAllowAllStatusBarPills
{
  return self->_temporarilyAllowAllStatusBarPills;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (CNKCrossFadeAnimatorFactory)animatorFactory
{
  return self->_animatorFactory;
}

- (void)setAnimatorFactory:(id)a3
{
}

- (BOOL)hasEverAppearedInWindow
{
  return self->_hasEverAppearedInWindow;
}

- (void)setHasEverAppearedInWindow:(BOOL)a3
{
  self->_hasEverAppearedInWindow = a3;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return self->_declineCallService;
}

- (void)setDeclineCallService:(id)a3
{
}

- (ICSCallManagerBridge)callManager
{
  return self->_callManager;
}

- (void)setCallManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callManager, 0);
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_animatorFactory, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_disconnectCallUUID, 0);
  objc_storeStrong((id *)&self->_failureAlertController, 0);
  objc_storeStrong((id *)&self->_declineWithMessageController, 0);
  objc_storeStrong((id *)&self->_bottomControlsView, 0);
  objc_destroyWeak((id *)&self->_callDurationTimerForParticipantsView);
  objc_storeStrong((id *)&self->_secondaryStringForParticipantsView, 0);
  objc_storeStrong((id *)&self->_contactNameForParticipantsView, 0);
  objc_storeStrong((id *)&self->_callForParticipantsView, 0);
  objc_storeStrong((id *)&self->_contactForParticipantsView, 0);
  objc_storeStrong((id *)&self->_callParticipantLabelsView, 0);
  objc_storeStrong((id *)&self->_bannerTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_filteredRequest, 0);
  objc_storeStrong((id *)&self->_currentAlertButtonAction, 0);
  objc_storeStrong((id *)&self->_transportIndicatorView, 0);
  objc_storeStrong((id *)&self->_callDetailsNavigationController, 0);
  objc_storeStrong((id *)&self->_remoteHostViewController, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_audioCallNavigationController, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_oldMultiwayPIPViewController);
  objc_storeStrong((id *)&self->_videoCallNavigationController, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_pttFullScreenContainerViewController, 0);
  objc_storeStrong((id *)&self->_userFeedbackViewController, 0);
  objc_storeStrong((id *)&self->_screenTimeHostViewController, 0);
  objc_storeStrong((id *)&self->_coverViewController, 0);
  objc_storeStrong((id *)&self->_multiwayViewController, 0);
  objc_storeStrong((id *)&self->_sosViewController, 0);
  objc_storeStrong((id *)&self->_emergencyDialerViewController, 0);
  objc_storeStrong((id *)&self->_audioCallViewControllerWrapper, 0);
  objc_storeStrong((id *)&self->_audioCallViewController, 0);
  objc_storeStrong((id *)&self->_alertActivationCall, 0);

  objc_storeStrong((id *)&self->_callCenter, 0);
}

- (id)makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:(id)a3 delegate:(id)a4 shouldSetControlsManagerInCallDetailsDelegate:(BOOL)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = (void *)sub_1001DCF98((uint64_t)v6);

  swift_unknownObjectRelease();

  return v8;
}

- (id)makeMultiwayConversationViewControllerWithCall:(id)a3 bannerPresentationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  BOOL v9 = (void *)sub_1001DD0B0(v6, (uint64_t)v7);

  return v9;
}

- (void)dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001DD19C((uint64_t)v4);
}

- (void)ambientSetIdleTimerDisabled:(BOOL)a3
{
  unsigned int v3 = self;
  sub_1001DD26C();
}

- (void)startObservingAcceptCallButtonTappedWithNotificationCenter:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001DD408(v4);
}

- (void)handleAcceptCallButtonTapped:(id)a3
{
  uint64_t v5 = sub_10011EB3C(&qword_1003219E8);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for Notification();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    uint64_t v10 = 1;
  }
  sub_10011EB80((uint64_t)v8, v10, 1, v9);
  int64_t v11 = self;
  sub_1001DD4E4();

  sub_100189CFC((uint64_t)v8, &qword_1003219E8);
}

- (void)_obtainThenReleaseTransitionAssertion
{
  unsigned __int8 v2 = self;
  sub_1001DD7C8();
}

- (BOOL)isContactBlockedWithCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  BOOL v6 = sub_1001DDC9C();

  return v6;
}

- (void)reportWithCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001DE0A0();
}

- (id)findMostRecentSilencedCallWithHandleValue:(id)a3 normalizedHandleValue:(id)a4 ignoredIdentifier:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  CFStringRef v15 = self;
  id v16 = sub_1001DE208(v7, v9, v10, (unint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v16;
}

- (BOOL)isFirstTimeInCallHistoryWithHandleValue:(id)a3 normalizedHandleValue:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  int64_t v11 = self;
  BOOL v12 = sub_1001DED1C(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  PHInCallRootViewController.contactViewController(_:didCompleteWith:)((CNContactViewController)v8, v10);
}

@end