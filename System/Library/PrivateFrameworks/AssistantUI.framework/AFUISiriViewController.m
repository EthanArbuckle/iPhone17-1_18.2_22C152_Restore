@interface AFUISiriViewController
- ($5902F3589ABA92D8028CA1BE72F4BD0A)_keyboardInfoFromNotification:(SEL)a3;
- (AFUISiriEdgelightViewProvider)edgeLightViewProvider;
- (AFUISiriRemoteSceneViewController)_remoteViewController;
- (AFUISiriSession)_session;
- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4;
- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5;
- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5 displayConfiguration:(id)a6 edgeLightViewProvider:(id)a7 instrumentationHandler:(id)a8;
- (AFUISiriViewControllerDataSource)dataSource;
- (AFUISiriViewControllerDelegate)delegate;
- (BOOL)_canIgnoreHoldToTalkThreshold;
- (BOOL)_canShowWhileLocked;
- (BOOL)_deviceSupportsZLL;
- (BOOL)_hasCalledBeginAppearanceTransition;
- (BOOL)_hasCalledEndAppearanceTransition;
- (BOOL)_holdToTalkThresholdHasElapsed;
- (BOOL)_isDeviceScreenOn;
- (BOOL)_isInHoldToTalkMode;
- (BOOL)_isInitialSpeechRequest;
- (BOOL)_isLaunchListeningEnabled;
- (BOOL)_isPunchingOut;
- (BOOL)_recordingStartedOnRoute;
- (BOOL)_shouldShowVoiceActivationMaskViewWithSiriView:(id)a3 requestSource:(int64_t)a4 screenOff:(BOOL)a5 connectedToCarPlay:(BOOL)a6;
- (BOOL)_siriRemoteViewControllerIsEditing;
- (BOOL)_statusViewHidden;
- (BOOL)announcementRequestsPermittedWhilePresentationActive;
- (BOOL)canBecomeFirstResponder;
- (BOOL)carDNDActive;
- (BOOL)compactViewShouldShowDebugButton:(id)a3;
- (BOOL)getUIViewModeIsUIFreeForCurrentRequest;
- (BOOL)headphonesAuthenticated;
- (BOOL)isAmbientPresented:(id)a3;
- (BOOL)isDeviceInStarkMode;
- (BOOL)isEyesFree;
- (BOOL)isInitialBringUp;
- (BOOL)isListening;
- (BOOL)isPPTAvailable;
- (BOOL)isPreventingActivationGesture;
- (BOOL)isProcessingAcousticIdRequest;
- (BOOL)isSceneHostingVisualIntelligence;
- (BOOL)isViewDisappearing;
- (BOOL)isVisible;
- (BOOL)receivedIncomingPhoneCall;
- (BOOL)recentButtonPressActivityDetected:(id)a3;
- (BOOL)recentTouchScreenActivityDetected:(id)a3;
- (BOOL)requestSessionAttendingState;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldNonLocalDelegateHandlePunchouts;
- (BOOL)shouldPlaceEffectsWindowOnTopOfSiriWindow;
- (BOOL)showsStatusBar;
- (BOOL)siriView:(id)a3 attemptUnlockWithPassword:(id)a4;
- (BOOL)siriViewShouldSupportTextInput:(id)a3;
- (BOOL)statusBarEnabled;
- (BOOL)supportsCarPlayVehicleData;
- (BOOL)turnsOnScreenOnAppearance;
- (CGRect)_statusBarFrame;
- (CGRect)hostedPresentationFrame;
- (NSNumber)_recordingStartedTimeValue;
- (NSTimer)visualIntelligenceAutolockTimer;
- (OS_dispatch_queue)_remoteViewControllerDispatchQueue;
- (SASRequestOptions)_currentRequestOptions;
- (SASRequestOptions)currentRequestOptions;
- (SiriUIAudioRoutePickerController)routePickerController;
- (UIStatusBar)_statusBar;
- (UIView)inputAccessoryView;
- (double)_delayForHoldToTalkStopRequestsWithSource:(int64_t)a3;
- (double)_homeGestureFractionCompleteFromCurrentYPosition:(double)a3 yPositionAtCompletion:(double)a4;
- (double)_manualEndpointingThreshold;
- (double)_screenHeight;
- (double)_thresholdForBarSwipeDismissal;
- (double)_viewDidAppearTime;
- (float)audioRecordingPowerLevelForSiriView:(id)a3;
- (id)_carPlaySiriView;
- (id)_compactSiriView;
- (id)_configuration;
- (id)_fullSiriView;
- (id)_initForTesting;
- (id)_orbViewControllingView;
- (id)_routePickerController;
- (id)_siriView;
- (id)_systemState;
- (id)_uiPresentationIdentifier;
- (id)_visualIntelligenceCameraDelegate;
- (id)activeAccountForSiriView:(id)a3;
- (id)assistantVersionForSiriView:(id)a3;
- (id)bulletinsForSiriSession:(id)a3;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)contextAppInfosForSiriSession:(id)a3;
- (id)currentCarPlaySupportedOEMAppIDListForSiriSession:(id)a3;
- (id)siriRemoteViewController:(id)a3 bulletinWithIdentifier:(id)a4;
- (id)starkAppBundleIdentifierContextForSiriSession:(id)a3;
- (id)underlyingConnection;
- (id)viewServiceApplicationInfo;
- (int64_t)carPlayEnhancedVoiceTriggerModeForSiriSession:(id)a3;
- (int64_t)currentSource;
- (int64_t)directActionEvent;
- (int64_t)getDeviceOrientation:(id)a3;
- (int64_t)keyboardAppearance;
- (int64_t)siriRemoteViewControllerRequestsActivationSource:(id)a3;
- (int64_t)userAccountCountForSiriView:(id)a3;
- (int64_t)viewMode;
- (unint64_t)_currentSessionAvailabilityState;
- (unint64_t)lockStateForSiriRemoteViewController:(id)a3;
- (unint64_t)lockStateForSiriSession:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activationTriggerDidRelease:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_didDetectAudioRoutePickerTap;
- (void)_dismissWithReason:(int64_t)a3;
- (void)_donateUIDismissalToBiome:(int64_t)a3;
- (void)_enqueueRemoteViewControllerMessageBlock:(id)a3;
- (void)_enterHoldToTalkMode;
- (void)_exitHoldToTalkMode;
- (void)_handleHelpAction;
- (void)_handleMicButtonLongPressBeganFromSource:(int64_t)a3;
- (void)_handleMicButtonLongPressEndedFromSource:(int64_t)a3;
- (void)_handleMicButtonTapFromSource:(int64_t)a3;
- (void)_handlePasscodeUnlockAndCancelRequest:(BOOL)a3 dismissOnFailure:(BOOL)a4 passcodeUnlockClient:(unint64_t)a5 withCompletion:(id)a6;
- (void)_handleReportBugAction;
- (void)_handleReportBugLongPressAction;
- (void)_handleSiriDidActivateFromSource:(int64_t)a3;
- (void)_hideStatusBarAnimated:(BOOL)a3 completion:(id)a4;
- (void)_holdToTalkTriggerDidReleaseFromSource:(int64_t)a3;
- (void)_informRemoteViewControllerOfOrbViewTapToCancelRequest;
- (void)_informRemoteViewControllerOfParentIfNecessary;
- (void)_keyboardDidHideNotification:(id)a3;
- (void)_keyboardDidShowNotification:(id)a3;
- (void)_performTamaleTransitionWithLayer:(id)a3;
- (void)_presentDeferredFlamesViewIfNecessary;
- (void)_presentRemoteViewController;
- (void)_recordUIAppearance;
- (void)_recordUIDismissal;
- (void)_removeStatusBar;
- (void)_resumeRemoteViewControllerDispatchQueue;
- (void)_sendBeginAppearanceTransitionIfReadyAnimated:(BOOL)a3;
- (void)_sendEndAppearanceTransitionIfReady;
- (void)_setAudioRoutePickerBluetoothOn:(BOOL)a3;
- (void)_setCurrentRequestOptions:(id)a3;
- (void)_setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setHasCalledBeginAppearanceTransition:(BOOL)a3;
- (void)_setHasCalledEndAppearanceTransition:(BOOL)a3;
- (void)_setInFluidDismissal:(BOOL)a3;
- (void)_setInHoldToTalkMode:(BOOL)a3;
- (void)_setPunchingOut:(BOOL)a3;
- (void)_setRecordingStartedOnRoute:(BOOL)a3;
- (void)_setRecordingStartedTimeValue:(id)a3;
- (void)_setShowAudioRoutePicker:(BOOL)a3;
- (void)_setSiriRemoteViewControllerIsEditing:(BOOL)a3;
- (void)_setStatusBar:(id)a3;
- (void)_setStatusViewHidden:(BOOL)a3;
- (void)_setTypeToSiriViewHidden:(BOOL)a3;
- (void)_setViewDidAppearTime:(double)a3;
- (void)_setVoiceTriggerEnabled:(BOOL)a3;
- (void)_setupCarPlayShockwaveViewController;
- (void)_showStatusBarAnimated:(BOOL)a3 completion:(id)a4;
- (void)_showVoiceActivationMaskView:(BOOL)a3;
- (void)_startVisualIntelligenceAutolockTimer;
- (void)_statusBarFrameDidChange:(id)a3;
- (void)_stopRequestWithOptions:(id)a3 afterDelay:(double)a4;
- (void)_stopVisualIntelligenceAutolockTimer;
- (void)_suspendRemoteViewControllerDispatchQueue;
- (void)_transitionToAutomaticEndpointMode;
- (void)_transitionToManualEndpointMode;
- (void)_triggerPeopleSuggesterLogging;
- (void)_updateAudioRoutePicker;
- (void)_updateRemoteViewControllerStateForAppearance;
- (void)_updateSiriAvailability:(unint64_t)a3;
- (void)_willEnterFullScreenScreenshotMode:(id)a3;
- (void)animateOrbViewDismissalIfNecessaryWithCompletion:(id)a3;
- (void)animateOrbViewToOffIfNecessaryWithCompletion:(id)a3;
- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4;
- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4;
- (void)cancelSpeechRecordingIfNecessary;
- (void)commandCache:(id)a3 didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a4;
- (void)compactView:(id)a3 blurVisibilityDidChange:(BOOL)a4;
- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4;
- (void)deactivateScene;
- (void)dealloc;
- (void)defrost;
- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4;
- (void)didGainAttentionWithEvent:(int64_t)a3;
- (void)didLoseAttentionWithEvent:(int64_t)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveButtonUpWithRequestOptions:(id)a3;
- (void)dismissSiriRemoteViewController:(id)a3 userInfo:(id)a4 withReason:(int64_t)a5;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)emitInstrumentationEvent:(id)a3;
- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4;
- (void)emitUIStateTransitionForSiriDismissalWithReason:(int64_t)a3;
- (void)endSession;
- (void)enterUITrackingMode;
- (void)exitUITrackingMode;
- (void)handleAppUnlockForAppId:(id)a3 withCompletion:(id)a4;
- (void)handlePasscodeUnlockAndCancelRequest:(BOOL)a3 withCompletion:(id)a4;
- (void)handlePasscodeUnlockWithCompletion:(id)a3;
- (void)handlePunchoutCommand:(id)a3 completion:(id)a4;
- (void)handleViewFullyRevealed;
- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4;
- (void)hideVoiceActivationMaskViewIfNecessary;
- (void)invalidate;
- (void)invalidateSystemApertureAssertion;
- (void)keyboardView:(id)a3 didReceiveText:(id)a4;
- (void)loadView;
- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3;
- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6;
- (void)playCarPlayShockwave;
- (void)preheat;
- (void)preloadPluginBundles;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
- (void)presentRemoteViewControllerIfNecessary;
- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4;
- (void)proximityStatusChanged:(BOOL)a3;
- (void)reactivateScene;
- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5;
- (void)requestStatusBarVisible:(BOOL)a3;
- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)requestSystemApertureCollapse;
- (void)resetContextTypes:(int64_t)a3;
- (void)resetGestureBehaviors;
- (void)routePickerController:(id)a3 hasRoutesToPick:(BOOL)a4;
- (void)routePickerControllerPickedNewRoute:(id)a3 isBluetooth:(BOOL)a4;
- (void)routePickerControllerWillDismiss:(id)a3;
- (void)routePickerControllerWillShow:(id)a3;
- (void)setAlertContext;
- (void)setAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceInStarkMode:(BOOL)a3;
- (void)setDirectActionEvent:(int64_t)a3;
- (void)setDockFrame:(CGRect)a3;
- (void)setEdgeLightViewProvider:(id)a3;
- (void)setEyesFree:(BOOL)a3;
- (void)setFluidDismissalState:(id)a3;
- (void)setHostedPresentationFrame:(CGRect)a3;
- (void)setIsSceneHostingVisualIntelligence:(BOOL)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setReceivedIncomingPhoneCall:(BOOL)a3;
- (void)setRoutePickerController:(id)a3;
- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3;
- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3;
- (void)setShowsStatusBar:(BOOL)a3;
- (void)setSiriRequestCancellationReason:(int64_t)a3;
- (void)setStatusBarEnabled:(BOOL)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setSystemApertureFrame:(CGRect)a3;
- (void)setTurnsOnScreenOnAppearance:(BOOL)a3;
- (void)setViewDisappearing:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisualIntelligenceAutolockTimer:(id)a3;
- (void)setWaitingForTelephonyToStart:(BOOL)a3;
- (void)shortTapActionWithRequestOptions:(id)a3;
- (void)showPasscodeUnlockScreenForRequest:(id)a3 passcodeUnlockClient:(unint64_t)a4 unlockCompletion:(id)a5;
- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5;
- (void)siriContentDidReceiveOrbHoldDidBeginAction:(id)a3;
- (void)siriContentDidReceiveOrbHoldDidEndAction:(id)a3;
- (void)siriContentDidReceiveOrbTappedAction:(id)a3;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivate;
- (void)siriRemoteViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4;
- (void)siriRemoteViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4;
- (void)siriRemoteViewController:(id)a3 didDismissViewControllerWithStatusBarStyle:(int64_t)a4;
- (void)siriRemoteViewController:(id)a3 didFinishTest:(id)a4;
- (void)siriRemoteViewController:(id)a3 didPresentViewControllerWithStatusBarStyle:(int64_t)a4;
- (void)siriRemoteViewController:(id)a3 didRequestCurrentTextInputWithReplyHandler:(id)a4;
- (void)siriRemoteViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4;
- (void)siriRemoteViewController:(id)a3 failTest:(id)a4 withReason:(id)a5;
- (void)siriRemoteViewController:(id)a3 handlePasscodeUnlockWithCompletion:(id)a4;
- (void)siriRemoteViewController:(id)a3 inputTypeDidChange:(int64_t)a4;
- (void)siriRemoteViewController:(id)a3 invalidatedForReason:(unint64_t)a4 explanation:(id)a5;
- (void)siriRemoteViewController:(id)a3 presentedIntentWithBundleId:(id)a4;
- (void)siriRemoteViewController:(id)a3 reduceOrbOpacity:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5;
- (void)siriRemoteViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)siriRemoteViewController:(id)a3 requestsPresentation:(id)a4;
- (void)siriRemoteViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4;
- (void)siriRemoteViewController:(id)a3 setBugReportingAvailable:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5;
- (void)siriRemoteViewController:(id)a3 setHelpButtonEmphasized:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 setRequestHandlingStatus:(unint64_t)a4;
- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)siriRemoteViewController:(id)a3 setStatusViewDisabled:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 setTypeToSiriViewHidden:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 startRequestWithOptions:(id)a4;
- (void)siriRemoteViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)siriRemoteViewController:(id)a3 willDismissViewControllerWithStatusBarStyle:(int64_t)a4;
- (void)siriRemoteViewController:(id)a3 willPresentViewControllerWithStatusBarStyle:(int64_t)a4;
- (void)siriRemoteViewController:(id)a3 willStartTest:(id)a4;
- (void)siriRemoteViewControllerCancelHIDEventDefferal:(id)a3;
- (void)siriRemoteViewControllerDidDeactivateScene:(id)a3;
- (void)siriRemoteViewControllerDidDetectMicButtonLongPressBegan:(id)a3;
- (void)siriRemoteViewControllerDidDetectMicButtonLongPressEnded:(id)a3;
- (void)siriRemoteViewControllerDidDetectMicButtonTap:(id)a3;
- (void)siriRemoteViewControllerDidEndEditing:(id)a3;
- (void)siriRemoteViewControllerDidFinishDismissing:(id)a3;
- (void)siriRemoteViewControllerDidPresentConversationFromBreadcrumb:(id)a3;
- (void)siriRemoteViewControllerDidPresentKeyboard:(id)a3;
- (void)siriRemoteViewControllerDidPresentUserInterface:(id)a3;
- (void)siriRemoteViewControllerDidResetTextInput:(id)a3;
- (void)siriRemoteViewControllerPulseHelpButton:(id)a3;
- (void)siriRemoteViewControllerRequestsHIDEventDefferal:(id)a3;
- (void)siriRemoteViewControllerWillBeginEditing:(id)a3;
- (void)siriResultsDidDismissInTamale;
- (void)siriSession:(id)a3 didChangeToState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6;
- (void)siriSession:(id)a3 didReceiveAppUnlockRequestForAppId:(id)a4 withCompletion:(id)a5;
- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestAndCancelRequest:(BOOL)a4 withCompletion:(id)a5;
- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestWithCompletion:(id)a4;
- (void)siriSession:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4;
- (void)siriSession:(id)a3 initialBringupProcessedWithTurnIdentifier:(id)a4;
- (void)siriSession:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4;
- (void)siriSession:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4;
- (void)siriSessionAudioOutputDidChangePowerLevel:(float)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4;
- (void)siriSessionDidEnd:(id)a3;
- (void)siriSessionDidFinishRequestWithError:(id)a3;
- (void)siriSessionDidReactivateFromFlexibleFollowups;
- (void)siriSessionDidReceiveDelayedActionCancelCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveDelayedActionCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSetUpdateMaskCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveStartScreenRecordingCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveStopScreenRecordingCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveTakeScreenshotCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidResetContext:(id)a3;
- (void)siriSessionDidUpdateSessionInfo:(id)a3;
- (void)siriSessionImmersiveExperienceRequested;
- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall;
- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall;
- (void)siriSessionWillEnd:(id)a3;
- (void)siriView:(id)a3 didReceiveSiriActivationMessageWithSource:(int64_t)a4;
- (void)siriViewDidRecieveStatusViewHoldDidBeginAction:(id)a3;
- (void)siriViewDidRecieveStatusViewHoldDidEndAction:(id)a3;
- (void)siriViewDidRecieveStatusViewTappedAction:(id)a3;
- (void)siriWasPresented:(int64_t)a3;
- (void)siriWillActivateFromSource:(int64_t)a3;
- (void)siriWillBePresented:(int64_t)a3;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)startGuidedAccessForRemoteViewController:(id)a3;
- (void)startRequestWithActivationTrigger:(id)a3;
- (void)startRequestWithActivationTrigger:(id)a3 completion:(id)a4;
- (void)startRequestWithOptions:(id)a3;
- (void)startRequestWithOptions:(id)a3 completion:(id)a4;
- (void)stopRequestWithOptions:(id)a3;
- (void)tamaleViewDidLoad;
- (void)tamaleViewRequestsAuthenticationWithCompletion:(id)a3;
- (void)tapPanDismissalPolicyManager:(id)a3 dismissalPolicyDidChange:(BOOL)a4;
- (void)telephonyRequestCompleted;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3;
- (void)tvRemoteSentButtonDownWhileListening;
- (void)updateContexts:(int64_t)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)updatePresentationVisualState:(unint64_t)a3;
- (void)updateRequestOptions:(id)a3;
- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)userRelevantEventDidOccurInSiriRemoteViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visionIntelligenceDropletLaunchAnimationDidFinish:(BOOL)a3 retargeted:(BOOL)a4;
@end

@implementation AFUISiriViewController

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4
{
  return [(AFUISiriViewController *)self initWithConnection:a3 configuration:a4 requestSource:0];
}

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [(AFUISiriViewController *)self initWithConnection:v9 configuration:v8 requestSource:a5 displayConfiguration:0 edgeLightViewProvider:0 instrumentationHandler:v10];

  return v11;
}

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5 displayConfiguration:(id)a6 edgeLightViewProvider:(id)a7 instrumentationHandler:(id)a8
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v49 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AFUISiriViewController initWithConnection:configuration:requestSource:displayConfi"
                                    "guration:edgeLightViewProvider:instrumentationHandler:]";
    _os_log_impl(&dword_223099000, v18, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v50.receiver = self;
  v50.super_class = (Class)AFUISiriViewController;
  v19 = [(AFUISiriViewController *)&v50 initWithNibName:0 bundle:0];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_configuration, a4);
    v20->_currentRequestSource = a5;
    objc_storeStrong((id *)&v20->_currentDisplayConfiguration, a6);
    objc_storeWeak((id *)&v20->_edgeLightViewProvider, v16);
    v20->_statusBarStyle = [MEMORY[0x263F286B8] isSAEEnabled] ^ 1;
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v20 selector:sel__statusBarFrameDidChange_ name:*MEMORY[0x263F83320] object:0];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v20 selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F833C0] object:0];

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v20 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v20 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];

    if ([(SASRequestOptions *)v20->_currentRequestOptions isTypeToSiriRequest])
    {
      v25 = [MEMORY[0x263F087C8] defaultCenter];
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2020000000;
      v26 = (void *)getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr;
      uint64_t v54 = getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr;
      if (!getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v56 = __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke;
        v57 = &unk_264691928;
        v58 = &v51;
        __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke((uint64_t)&buf);
        v26 = (void *)v52[3];
      }
      _Block_object_dispose(&v51, 8);
      if (!v26) {
        -[AFUISiriViewController initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:]();
      }
      [v25 addObserver:v20 selector:sel__willEnterFullScreenScreenshotMode_ name:*v26 object:0];
    }
    dispatch_queue_t v27 = dispatch_queue_create("Siri Remote View Controller Message Queue", 0);
    remoteViewControllerDispatchQueue = v20->_remoteViewControllerDispatchQueue;
    v20->_remoteViewControllerDispatchQueue = (OS_dispatch_queue *)v27;

    dispatch_set_target_queue((dispatch_object_t)v20->_remoteViewControllerDispatchQueue, MEMORY[0x263EF83A0]);
    [(AFUISiriViewController *)v20 _suspendRemoteViewControllerDispatchQueue];
    [(AFUISiriViewController *)v20 _beginDelayingPresentation:&__block_literal_global_9 cancellationHandler:3.0];
    v29 = [[AFUISiriSession alloc] initWithConnection:v14 delegateQueue:v20->_remoteViewControllerDispatchQueue requestSource:a5];
    session = v20->_session;
    v20->_session = v29;

    [(AFUISiriSession *)v20->_session setLocalDataSource:v20];
    [(AFUISiriSession *)v20->_session setLocalDelegate:v20];
    uint64_t v31 = [objc_alloc(MEMORY[0x263F754A0]) initWithDelegate:v20];
    delayedActionCommandCache = v20->_delayedActionCommandCache;
    v20->_delayedActionCommandCache = (SRUIFDelayedActionCommandCache *)v31;

    v33 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v34 = dispatch_queue_create(0, v33);
    uiAppearanceRecordQueue = v20->_uiAppearanceRecordQueue;
    v20->_uiAppearanceRecordQueue = (OS_dispatch_queue *)v34;

    v20->_turnsOnScreenOnAppearance = 1;
    CGSize v36 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v20->_hostedPresentationFrame.origin = (CGPoint)*MEMORY[0x263F001A0];
    v20->_hostedPresentationFrame.size = v36;
    v20->_statusBarDeferralState = 0;
    v20->_requestCancellationReason = 0;
    v20->_requestedBlurVisible = 0;
    v37 = [[AFUINetworkAvailabilityStateMachine alloc] initWithDelegate:v20];
    networkAvailabilityStateMachine = v20->_networkAvailabilityStateMachine;
    v20->_networkAvailabilityStateMachine = v37;

    if ([v15 siriViewMode] == 7)
    {
      if (SiriUIDeviceIsPad() && ![MEMORY[0x263F286B8] isSAEEnabled])
      {
        uint64_t v39 = 0;
      }
      else if ([MEMORY[0x263F286B8] isSAEEnabled])
      {
        uint64_t v39 = 3;
      }
      else
      {
        uint64_t v39 = 1;
      }
      v40 = [[AFUISiriTapPanDismissalPolicyManager alloc] initWithPolicy:v39 delegate:v20];
      tapPanDismissalPolicyManager = v20->_tapPanDismissalPolicyManager;
      v20->_tapPanDismissalPolicyManager = v40;
    }
    v20->_hasDonatedDismissalToBiome = 0;
    v20->_immersiveExperienceOn = 0;
    objc_storeStrong((id *)&v20->_viewHostingInstrumentationHandler, a8);
    v42 = [MEMORY[0x263F6C818] sharedAnalytics];
    v43 = [v42 defaultMessageStream];

    id v44 = objc_alloc(MEMORY[0x263F6C6F8]);
    v45 = (void *)[objc_alloc(MEMORY[0x263F6C700]) initWithAnalyticsStream:v43];
    uint64_t v46 = [v44 initWithSender:v45];
    activationInstrumentation = v20->_activationInstrumentation;
    v20->_activationInstrumentation = (SASActivationInstrumentation *)v46;

    v20->_dismissalReason = 0;
  }

  return v20;
}

uint64_t __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)_initForTesting
{
  id v3 = objc_alloc_init(MEMORY[0x263F284A0]);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F753A0]) initWithFlamesViewFidelity:2 isSystemHostedPresentation:1 allowResizingBetweenModes:1 siriViewMode:7 showsSensitiveUI:0];
  uint64_t v5 = [(AFUISiriViewController *)self initWithConnection:v3 configuration:v4 requestSource:8];

  return v5;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v9 = "-[AFUISiriViewController dealloc]";
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  delayedActionCommandCache = self->_delayedActionCommandCache;
  self->_delayedActionCommandCache = 0;

  self->_siriSessionWantsToEnd = 1;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  if ([(SASRequestOptions *)self->_currentRequestOptions isTypeToSiriRequest])
  {
    uint64_t v6 = [MEMORY[0x263F087C8] defaultCenter];
    [v6 removeObserver:self];
  }
  [(AFUISiriViewController *)self _resumeRemoteViewControllerDispatchQueue];
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v7 dealloc];
}

- (id)underlyingConnection
{
  v2 = [(AFUISiriViewController *)self _session];
  id v3 = [v2 underlyingConnection];

  return v3;
}

- (int64_t)viewMode
{
  id v3 = [(AFUISiriViewController *)self _configuration];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(AFUISiriViewController *)self _configuration];
  int64_t v5 = [v4 siriViewMode];

  return v5;
}

- (void)setEyesFree:(BOOL)a3
{
  if (self->_eyesFree != a3)
  {
    BOOL v3 = a3;
    self->_eyesFree = a3;
    id v4 = [(AFUISiriViewController *)self _session];
    [v4 setEyesFree:v3];
  }
}

- (void)setEdgeLightViewProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriViewController *)self _compactSiriView];
  [v5 setEdgeLightViewProvider:v4];
}

- (void)setReceivedIncomingPhoneCall:(BOOL)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_receivedIncomingPhoneCall != a3)
  {
    self->_receivedIncomingPhoneCall = a3;
    id v4 = SiriUIDismissalReasonStringFromReason();
    uint64_t v7 = *MEMORY[0x263F753E8];
    v8[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    dismissalUserInfo = self->_dismissalUserInfo;
    self->_dismissalUserInfo = v5;
  }
}

- (void)_setPunchingOut:(BOOL)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_punchingOut != a3)
  {
    self->_punchingOut = a3;
    id v4 = SiriUIDismissalReasonStringFromReason();
    uint64_t v7 = *MEMORY[0x263F753E8];
    v8[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    dismissalUserInfo = self->_dismissalUserInfo;
    self->_dismissalUserInfo = v5;
  }
}

- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, void))a5;
  if (_os_feature_enabled_impl()
    || ![(AFUISiriViewController *)self statusBarEnabled]
    || (![(AFUISiriViewController *)self isDeviceInStarkMode]
      ? ([(AFUISiriViewController *)self viewMode] != 4
       ? (BOOL v9 = [(AFUISiriViewController *)self viewMode] == 8)
       : (BOOL v9 = 1))
      : (BOOL v9 = 0),
        [(AFUISiriViewController *)self viewMode] == 7 ? (int v10 = 1) : (int v10 = v9),
        v6
     && v10
     && ([(AFUISiriViewController *)self _compactSiriView],
         v11 = objc_claimAutoreleasedReturnValue(),
         char v12 = [v11 shouldRequestStatusBar],
         v11,
         (v12 & 1) == 0)))
  {
LABEL_19:
    if (v8) {
      v8[2](v8, 0);
    }
    goto LABEL_21;
  }
  if (v6)
  {
    if (self->_shouldShowVoiceActivationMaskView)
    {
      v13 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        id v15 = "-[AFUISiriViewController requestStatusBarVisible:animated:completion:]";
        _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Not showing the status bar as voiceActivationMaskView is visible", (uint8_t *)&v14, 0xCu);
      }
      self->_statusBarDeferralState = 1;
      goto LABEL_19;
    }
    if (self->_showsStatusBar != v6)
    {
      self->_showsStatusBar = v6;
      [(AFUISiriViewController *)self _showStatusBarAnimated:v5 completion:v8];
    }
  }
  else if (self->_showsStatusBar)
  {
    self->_showsStatusBar = 0;
    [(AFUISiriViewController *)self _hideStatusBarAnimated:v5 completion:v8];
  }
LABEL_21:
}

- (void)setHostedPresentationFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_hostedPresentationFrame = &self->_hostedPresentationFrame;
  if (!CGRectEqualToRect(self->_hostedPresentationFrame, a3)
    || (([(AFUISiriViewController *)self preferredContentSize], width == v10)
      ? (BOOL v11 = height == v9)
      : (BOOL v11 = 0),
        v11))
  {
    p_hostedPresentationFrame->origin.CGFloat x = x;
    p_hostedPresentationFrame->origin.CGFloat y = y;
    p_hostedPresentationFrame->size.double width = width;
    p_hostedPresentationFrame->size.double height = height;
    -[AFUISiriViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  }
}

- (BOOL)isProcessingAcousticIdRequest
{
  v2 = [(AFUISiriViewController *)self _session];
  char v3 = [v2 isProcessingAcousticIdRequest];

  return v3;
}

- (void)enterUITrackingMode
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"-[AFUISiriViewController enterUITrackingMode]"];
    [v4 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 586, @"%@ can only be used on the main thread", v5 object file lineNumber description];
  }
  id v6 = [(AFUISiriViewController *)self _fullSiriView];
  [v6 setInUITrackingMode:1];
}

- (void)exitUITrackingMode
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"-[AFUISiriViewController exitUITrackingMode]"];
    [v4 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 591, @"%@ can only be used on the main thread", v5 object file lineNumber description];
  }
  id v6 = [(AFUISiriViewController *)self _fullSiriView];
  [v6 setInUITrackingMode:0];
}

- (void)proximityStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[AFUISiriViewController proximityStatusChanged:]"];
    [v7 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 596, @"%@ can only be used on the main thread", v8 object file lineNumber description];
  }
  id v6 = [(AFUISiriViewController *)self _fullSiriView];
  [v6 setInUITrackingMode:v3];

  id v9 = [(AFUISiriViewController *)self _fullSiriView];
  [v9 setDisabled:v3];
}

- (void)cancelSpeechRecordingIfNecessary
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __58__AFUISiriViewController_cancelSpeechRecordingIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained _siriView];
    uint64_t v3 = [v2 siriSessionState];

    id WeakRetained = v5;
    if (v3 == 1)
    {
      id v4 = [v5 _session];
      [v4 cancelSpeechRequest];

      id WeakRetained = v5;
    }
  }
}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[AFUISiriViewController animatedAppearanceWithFactory:completion:]"];
    [v15 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 622, @"%@ can only be used on the main thread", v16 object file lineNumber description];
  }
  if ([(AFUISiriViewController *)self currentSource] != 18
    && [(AFUISiriViewController *)self currentSource] != 19)
  {
    id v9 = [(AFUISiriViewController *)self _fullSiriView];
    double v10 = [v9 foregroundView];
    [v10 setAlpha:0.0];

    BOOL v11 = [(AFUISiriViewController *)self _fullSiriView];
    [v11 setBackdropVisible:0];
  }
  char v12 = [(AFUISiriViewController *)self _carPlaySiriView];
  [v12 resetOrbViewToSiriSessionState];

  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x263F29D20];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke;
  v19[3] = &unk_264691C90;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke_2;
  v17[3] = &unk_264691D48;
  id v14 = v8;
  id v18 = v14;
  [v13 animateWithFactory:v7 actions:v19 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [WeakRetained _compactSiriView];
    [v3 setContentViewsAlpha:1.0];

    id v4 = [v7 _fullSiriView];
    id v5 = [*(id *)(a1 + 32) _siriView];
    [v5 setContentViewsAlpha:1.0];

    id v6 = [v4 foregroundView];
    [v6 setAlpha:1.0];

    [v4 setBackdropVisible:1];
    id WeakRetained = v7;
  }
}

uint64_t __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = [NSString stringWithUTF8String:"-[AFUISiriViewController animatedDisappearanceWithFactory:completion:]"];
    [v16 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 655, @"%@ can only be used on the main thread", v17 object file lineNumber description];
  }
  id v9 = [(AFUISiriViewController *)self _fullSiriView];
  double v10 = [v9 foregroundView];
  [v10 setAlpha:1.0];

  [(AFUISiriViewController *)self _setFullScreenDimmingLayerVisible:0 animated:1];
  BOOL v11 = [(AFUISiriViewController *)self _compactSiriView];
  [v11 requestBlurVisible:0 reason:0 fence:0];

  char v12 = [(AFUISiriViewController *)self _orbViewControllingView];
  [v12 animateOrbViewToOffWithCompletion:0];

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke;
  v22[3] = &unk_264691C90;
  objc_copyWeak(&v24, &location);
  id v13 = v7;
  id v23 = v13;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v22];
  id v14 = (void *)MEMORY[0x263F29D20];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_2;
  v20[3] = &unk_264691BF0;
  v20[4] = self;
  objc_copyWeak(&v21, &location);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_3;
  v18[3] = &unk_264691D48;
  id v15 = v8;
  id v19 = v15;
  [v14 animateWithFactory:v13 actions:v20 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained _remoteViewController];
    [*(id *)(a1 + 32) duration];
    objc_msgSend(v3, "animatedDisappearanceDidBeginWithDuration:reason:", v4[155]);

    id WeakRetained = v4;
  }
}

void __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1256) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1256);
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v21 = *MEMORY[0x263F000D0];
  long long v18 = v21;
  long long v22 = v19;
  long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v17 = v23;
  [v2 setTransform:&v21];
  uint64_t v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 superview];
  long long v21 = v18;
  long long v22 = v19;
  long long v23 = v17;
  [v4 setTransform:&v21];

  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained _siriView];
  [v7 setContentViewsAlpha:0.0];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v8 _fullSiriView];
  [v9 setBackdropVisible:0];

  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 1240);
    if ((v11 == 24 || v11 == 6) && [*(id *)(v10 + 1360) inputType] != 1)
    {
      id v12 = objc_loadWeakRetained((id *)(a1 + 40));
      id v13 = [v12 _compactSiriView];
      id v14 = [v13 remoteContentView];
      CGAffineTransformMakeScale(&v20, 0.9, 0.9);
      [v14 setTransform:&v20];
    }
  }
  id v15 = objc_loadWeakRetained(v5);
  uint64_t v16 = [v15 _carPlaySiriView];

  [v16 animateOutEdgeLight];
}

uint64_t __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = NSStringFromBOOL();
    int v8 = 136315394;
    id v9 = "-[AFUISiriViewController animatedDisappearanceWithFactory:completion:]_block_invoke_3";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation animated disappearance finished: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)requestStatusBarVisible:(BOOL)a3
{
}

- (void)_setInFluidDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriViewController *)self _fullSiriView];
  [v5 setInFluidDismissal:v3];

  id v6 = [(AFUISiriViewController *)self _compactSiriView];
  [v6 setInFluidDismissal:v3];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__AFUISiriViewController__setInFluidDismissal___block_invoke;
  v7[3] = &unk_264691B40;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v3;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__AFUISiriViewController__setInFluidDismissal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 setInFluidDismissal:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setFluidDismissalState:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v44 = [MEMORY[0x263F08690] currentHandler];
    v45 = [NSString stringWithUTF8String:"-[AFUISiriViewController setFluidDismissalState:]"];
    [v44 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 718, @"%@ can only be used on the main thread", v45 object file lineNumber description];
  }
  if ([v5 transitionPhase] != 1)
  {
    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      [(AFUISceneHostingViewController *)self->_remoteViewController setClippingDisabled:1];
    }
    id v6 = [(AFUISiriViewController *)self _fullSiriView];
    id v7 = [v6 foregroundContainerView];

    id v8 = [(AFUISiriViewController *)self _fullSiriView];
    BOOL v9 = [v8 backgroundBlurView];

    __int16 v10 = [(AFUISiriViewController *)self _compactSiriView];

    if (v10)
    {
      int v11 = [MEMORY[0x263F286B8] isSAEEnabled];
      uint64_t v12 = [(AFUISiriViewController *)self _compactSiriView];
      id v13 = v12;
      if (v11) {
        [v12 remoteContentView];
      }
      else {
      uint64_t v14 = [v12 foregroundContainerView];
      }

      id v7 = (void *)v14;
    }
    if (!v5)
    {
      [(AFUISiriViewController *)self _setInFluidDismissal:0];
      tamaleView = self->_tamaleView;
      CGAffineTransformMakeScale(&v49, 1.0, 1.0);
      [(SiriSharedUITamaleView *)tamaleView setTransform:&v49];
      [(SiriSharedUITamaleView *)self->_tamaleView _setSafeAreaInsetsFrozen:0];
      long long v22 = (void *)MEMORY[0x263F82E00];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke_3;
      v46[3] = &unk_264691E90;
      v46[4] = self;
      id v47 = v9;
      id v48 = v7;
      [v22 performWithoutAnimation:v46];

LABEL_35:
      goto LABEL_36;
    }
    double keyboardHeight = self->_keyboardInfo.keyboardHeight;
    if (!self->_isPresentingVisualIntelligenceCamera
      || [(AFUISiriSession *)self->_session attendingState]
      || keyboardHeight > 0.0)
    {
      [(AFUISiriViewController *)self _thresholdForBarSwipeDismissal];
      double v16 = v18;
      int v17 = 0;
    }
    else
    {
      double v16 = 0.0;
      int v17 = 1;
    }
    [v5 contentRect];
    double Height = CGRectGetHeight(v61);
    if (v16 <= Height)
    {
      double v23 = Height;
      [(AFUISiriViewController *)self _setInFluidDismissal:1];
      if (![MEMORY[0x263F286B8] isSAEEnabled])
      {
        objc_initWeak(&location, self);
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke;
        v54[3] = &unk_264691C90;
        objc_copyWeak(&v56, &location);
        id v36 = v5;
        id v55 = v36;
        +[AFUIUtilities animateUsingSpringWithStiffness:v54 damping:746.28 animations:60.1];
        [v36 contentRect];
        double v37 = CGRectGetHeight(v63);
        v38 = [MEMORY[0x263F82B60] mainScreen];
        [v38 bounds];
        double v39 = v37 / CGRectGetHeight(v64);

        if (v39 > 0.0)
        {
          CGAffineTransformMakeScale(&v53, v39, v39);
          [v7 setTransform:&v53];
          [v36 contentRect];
          UIRectGetCenter();
          objc_msgSend(v7, "setCenter:");
        }
        [v36 backgroundWeighting];
        if (v40 < 2.22044605e-16)
        {
          v41 = [(AFUISiriViewController *)self _compactSiriView];
          [v41 animateOrbViewToOffWithCompletion:0];

          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke_2;
          v50[3] = &unk_264692738;
          id v51 = v9;
          v52 = self;
          +[AFUIUtilities animateUsingSpringWithStiffness:v50 damping:194.96 animations:30.72];
        }
        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);
        goto LABEL_34;
      }
      if (keyboardHeight <= 0.0)
      {
        [(AFUISiriViewController *)self _homeGestureFractionCompleteFromCurrentYPosition:v23 yPositionAtCompletion:v16];
        double v25 = (1.0 - v24) * 0.05 + 0.95;
        v26 = [(AFUISiriViewController *)self _compactSiriView];
        *(float *)&double v27 = v25;
        [v26 dismissalBlur:v27];

        v28 = [MEMORY[0x263F82B60] mainScreen];
        [v28 bounds];
        double v29 = CGRectGetHeight(v62);

        v30 = self->_tamaleView;
        double v31 = v23 / v29;
        v32 = [MEMORY[0x263F82B60] mainScreen];
        v33 = [v32 traitCollection];
        [v33 displayCornerRadius];
        if (v31 == 1.0) {
          double v34 = v34 * 0.8;
        }
        [(SiriSharedUITamaleView *)v30 _setCornerRadius:v34];

        [(SiriSharedUITamaleView *)self->_tamaleView setClipsToBounds:1];
        [(SiriSharedUITamaleView *)self->_tamaleView _setSafeAreaInsetsFrozen:1];
        if (!v17)
        {
          CGAffineTransformMakeScale(&v59, v25, v25);
          [v7 setTransform:&v59];
          v42 = self->_tamaleView;
          CGAffineTransformMakeScale(&v58, v25, v25);
          [(SiriSharedUITamaleView *)v42 setTransform:&v58];
          goto LABEL_34;
        }
        CGAffineTransform v20 = [(AFUISiriViewController *)self view];
        v35 = [v20 superview];
        CGAffineTransformMakeScale(&v60, v31, v31);
        [v35 setTransform:&v60];

        goto LABEL_27;
      }
    }
    else
    {
      [(AFUISiriViewController *)self _setInFluidDismissal:0];
      [(AFUISiriViewController *)self _dismissWithReason:6];
      if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53)
      {
        CGAffineTransform v20 = [MEMORY[0x263F283F8] sharedAnalytics];
        [v20 logEventWithType:1450 context:0];
LABEL_27:
      }
    }
LABEL_34:
    v43 = [(AFUISiriViewController *)self _fullSiriView];
    [v43 fadeOutCurrentAura];

    goto LABEL_35;
  }
LABEL_36:
}

void __49__AFUISiriViewController_setFluidDismissalState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _siriView];
  [*(id *)(a1 + 32) contentWeighting];
  objc_msgSend(v2, "setContentViewsAlpha:");
}

uint64_t __49__AFUISiriViewController_setFluidDismissalState___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) transitionToPrivateStyle:-2];
  id v2 = *(void **)(a1 + 40);

  return [v2 _setFullScreenDimmingLayerVisible:0 animated:0];
}

void __49__AFUISiriViewController_setFluidDismissalState___block_invoke_3(id *a1)
{
  id v2 = [a1[4] _fullSiriView];
  BOOL v3 = [v2 dimBackdropSettings];

  [a1[5] transitionToSettings:v3];
  id v4 = a1[6];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v10 = *MEMORY[0x263F000D0];
  long long v8 = v10;
  long long v11 = v9;
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v7 = v12;
  [v4 setTransform:&v10];
  id v5 = [a1[4] view];
  id v6 = [v5 superview];
  long long v10 = v8;
  long long v11 = v9;
  long long v12 = v7;
  [v6 setTransform:&v10];

  [a1[6] setAlpha:1.0];
  [*((id *)a1[4] + 157) setAlpha:1.0];
  [a1[6] frame];
  objc_msgSend(a1[6], "setFrame:", 0.0, 0.0);
}

- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3
{
  if (!a3) {
    [(AFUISceneHostingViewController *)self->_remoteViewController setClippingDisabled:0];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (UIView)inputAccessoryView
{
  return 0;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (void)_updateSiriAvailability:(unint64_t)a3
{
  if ([(AFUISiriViewController *)self _currentSessionAvailabilityState] != a3) {
    self->_currentSessionAvailabilityState = a3;
  }
  if ([(AFUISiriViewController *)self _currentSessionAvailabilityState] == 1
    || [(AFUISiriViewController *)self _currentSessionAvailabilityState] == 3)
  {
    id v5 = [(AFUISiriViewController *)self _configuration];
    uint64_t v6 = [v5 siriViewMode];

    if (v6 == 7)
    {
      long long v7 = [(AFUISiriViewController *)self _configuration];
      id v10 = [(AFUISiriViewController *)self _configuration];
      long long v8 = (SiriUIConfiguration *)objc_msgSend(v7, "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", 0, 1, 0, 0, objc_msgSend(v10, "showsSensitiveUI"));
      configuration = self->_configuration;
      self->_configuration = v8;
    }
  }
}

- (void)loadView
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_hostedPresentationFrame = &self->_hostedPresentationFrame;
  if (CGRectEqualToRect(self->_hostedPresentationFrame, *MEMORY[0x263F001A0]))
  {
    id v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 bounds];
    double x = v5;
    double y = v7;
    double width = v9;
    double height = v11;
  }
  else
  {
    double x = p_hostedPresentationFrame->origin.x;
    double y = p_hostedPresentationFrame->origin.y;
    double width = p_hostedPresentationFrame->size.width;
    double height = p_hostedPresentationFrame->size.height;
  }
  id v13 = [(AFUISiriViewController *)self _configuration];
  int v14 = [v13 isSystemHostedPresentation];

  if (v14)
  {
    id v15 = [(AFUISiriViewController *)self _configuration];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
    +[AFUISiriViewBuilder buildSiriViewForFrame:configuration:dataSource:delegate:siriContentDelegate:edgeLightViewProvider:instrumentationHandler:](AFUISiriViewBuilder, "buildSiriViewForFrame:configuration:dataSource:delegate:siriContentDelegate:edgeLightViewProvider:instrumentationHandler:", v15, self, self, self, WeakRetained, self->_viewHostingInstrumentationHandler, x, y, width, height);
    int v17 = (AFUISiriRemoteContainerView *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AFUISiriRemoteContainerView *)v17 setFlamesViewDeferred:1];
    }
    if ([(AFUISiriViewController *)self _shouldShowVoiceActivationMaskViewWithSiriView:v17 requestSource:self->_currentRequestSource screenOff:[(AFUISiriViewController *)self _isDeviceScreenOn] ^ 1 connectedToCarPlay:[(AFUISiriViewController *)self isDeviceInStarkMode]])
    {
      double v18 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        long long v21 = "-[AFUISiriViewController loadView]";
        _os_log_impl(&dword_223099000, v18, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Requesting show - voiceActivationMaskView", (uint8_t *)&v20, 0xCu);
      }
      [(AFUISiriViewController *)self _showVoiceActivationMaskView:1];
      [(AFUISiriRemoteContainerView *)v17 setVoiceActivationMaskViewVisible:1];
    }
    else
    {
      [(AFUISiriViewController *)self _showVoiceActivationMaskView:0];
    }
    if (self->_currentRequestSource == 20) {
      [(AFUISiriRemoteContainerView *)v17 setSiriSessionState:2];
    }
    if ([(AFUISiriViewController *)self isDeviceInStarkMode]
      && [(AFUISiriViewController *)self directActionEvent])
    {
      [(AFUISiriRemoteContainerView *)v17 setSiriSessionState:2];
    }
  }
  else
  {
    int v17 = -[AFUISiriRemoteContainerView initWithFrame:]([AFUISiriRemoteContainerView alloc], "initWithFrame:", x, y, width, height);
  }
  [(AFUISiriViewController *)self setView:v17];
  uint64_t v19 = !self->_shouldShowVoiceActivationMaskView
     && ![(AFUISiriViewController *)self isDeviceInStarkMode]
     && [(AFUISiriViewController *)self viewMode] != 7;
  if ([(AFUISiriViewController *)self isEyesFree]) {
    uint64_t v19 = v19 & [(AFUISiriRemoteContainerView *)v17 shouldRequestStatusBar];
  }
  [(AFUISiriViewController *)self requestStatusBarVisible:v19];
}

- (BOOL)_shouldShowVoiceActivationMaskViewWithSiriView:(id)a3 requestSource:(int64_t)a4 screenOff:(BOOL)a5 connectedToCarPlay:(BOOL)a6
{
  BOOL v7 = a5;
  char v9 = objc_opt_respondsToSelector();
  int v10 = _os_feature_enabled_impl();
  char v11 = (v10 ^ 1) & v7;
  if (((v10 ^ 1) & 1) == 0 && v7)
  {
    long long v12 = [MEMORY[0x263F82E88] _applicationKeyWindow];
    id v13 = [v12 traitCollection];
    char v11 = [v13 _backlightLuminance] != 1;
  }
  BOOL v14 = v11 & !a6;
  if (a4 != 8) {
    BOOL v14 = 0;
  }
  return (v9 & 1) != 0 && v14;
}

- (void)_showVoiceActivationMaskView:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldShowVoiceActivationMaskView = a3;
  id v5 = [(AFUISiriViewController *)self delegate];
  [v5 siriViewController:self voiceActivationMaskViewIsVisible:v3];
}

- (id)_siriView
{
  BOOL v3 = [(AFUISiriViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  id v4 = [(AFUISiriViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
LABEL_5:
    id v5 = [(AFUISiriViewController *)self view];
    goto LABEL_6;
  }
  BOOL v7 = [(AFUISiriViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

- (void)_statusBarFrameDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriViewController *)self _statusBar];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;

  if (v7 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v7;
  }
  if (v7 < v9) {
    double v7 = v9;
  }
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__AFUISiriViewController__statusBarFrameDidChange___block_invoke;
  v11[3] = &unk_264692940;
  objc_copyWeak(&v12, &location);
  long long v13 = *MEMORY[0x263F00148];
  double v14 = v7;
  double v15 = v10;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __51__AFUISiriViewController__statusBarFrameDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  objc_msgSend(v2, "setStatusBarFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_showStatusBarAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(id, uint64_t))a4;
  [(AFUISiriViewController *)self _statusBarFrame];
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  if (!self->_statusBar)
  {
    double v15 = objc_msgSend(objc_alloc(MEMORY[0x263F82C08]), "initWithFrame:", v7, v8, v9, v10);
    double v16 = (unsigned char *)[MEMORY[0x263F82C18] getStatusBarOverrideData];
    if (v16)
    {
      *double v16 = 1;
      v16[64] = 1;
    }
    [v15 setLocalDataOverrides:v16];
    [(AFUISiriViewController *)self _setStatusBar:v15];
    int v17 = [v15 layer];
    [v17 setEdgeAntialiasingMask:0];

    [v15 requestStyle:self->_statusBarStyle];
    double v18 = [(AFUISiriViewController *)self view];
    [v18 addSubview:self->_statusBar];
  }
  uint64_t v19 = [(AFUISiriViewController *)self view];
  [v19 bringSubviewToFront:self->_statusBar];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke;
  aBlock[3] = &unk_264691A50;
  aBlock[4] = self;
  int v20 = _Block_copy(aBlock);
  long long v21 = v20;
  if (v4)
  {
    [(UIStatusBar *)self->_statusBar setAlpha:0.0];
    [MEMORY[0x263F82E00] animateWithDuration:v21 animations:v6 completion:0.3];
  }
  else
  {
    (*((void (**)(void *))v20 + 2))(v20);
    if (v6) {
      v6[2](v6, 1);
    }
  }
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke_2;
  v22[3] = &unk_264692940;
  objc_copyWeak(v23, &location);
  v23[1] = *(id *)&v11;
  v23[2] = *(id *)&v12;
  v23[3] = *(id *)&v13;
  v23[4] = *(id *)&v14;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v22];
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _statusBar];
  [v1 setAlpha:1.0];
}

void __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  objc_msgSend(v2, "setStatusBarFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_hideStatusBarAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(id, uint64_t))a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AFUISiriViewController__hideStatusBarAnimated_completion___block_invoke;
  aBlock[3] = &unk_264691A50;
  aBlock[4] = self;
  double v7 = _Block_copy(aBlock);
  double v8 = v7;
  if (v4)
  {
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:0.3];
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
    if (v6) {
      v6[2](v6, 1);
    }
  }
}

void __60__AFUISiriViewController__hideStatusBarAnimated_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _statusBar];
  [v1 setAlpha:0.0];
}

- (void)_removeStatusBar
{
  BOOL v3 = [(AFUISiriViewController *)self _statusBar];
  [v3 removeFromSuperview];

  [(AFUISiriViewController *)self _setStatusBar:0];
}

- (CGRect)_statusBarFrame
{
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 _referenceBounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(id)*MEMORY[0x263F83300] statusBar];
  [v8 defaultHeight];
  double v10 = v9;

  double v11 = [(AFUISiriViewController *)self view];
  double v12 = [v11 window];
  uint64_t v13 = [v12 interfaceOrientation];

  unint64_t v14 = [(AFUISiriViewController *)self supportedInterfaceOrientations] & (1 << v13);
  if ((unint64_t)(v13 - 3) >= 2 || v14 == 0) {
    double v16 = v5;
  }
  else {
    double v16 = v7;
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v16;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)didGainAttentionWithEvent:(int64_t)a3
{
  id v4 = [(AFUISiriViewController *)self _session];
  [v4 didGainAttentionWithEvent:a3];
}

- (void)didLoseAttentionWithEvent:(int64_t)a3
{
  id v4 = [(AFUISiriViewController *)self _session];
  [v4 didLoseAttentionWithEvent:a3];
}

- (void)_applicationWillResignActive:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__AFUISiriViewController__applicationWillResignActive___block_invoke;
  v5[3] = &unk_2646919D8;
  objc_copyWeak(&v6, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__AFUISiriViewController__applicationWillResignActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 applicationWillResignActive];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__AFUISiriViewController__applicationWillEnterForeground___block_invoke;
  v5[3] = &unk_2646919D8;
  objc_copyWeak(&v6, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__AFUISiriViewController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 applicationWillEnterForeground];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__AFUISiriViewController__applicationDidBecomeActive___block_invoke;
  v5[3] = &unk_2646919D8;
  objc_copyWeak(&v6, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__AFUISiriViewController__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 applicationDidBecomeActive];
}

- (void)_willEnterFullScreenScreenshotMode:(id)a3
{
}

- (void)_recordUIAppearance
{
  uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___updateContextSiriActiveStatus_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v16 = 1;
  dispatch_async(uiAppearanceRecordQueue, block);
  id v4 = [MEMORY[0x263F08C38] UUID];
  double v5 = [v4 UUIDString];
  uiAppearanceUUIDString = self->_uiAppearanceUUIDString;
  self->_uiAppearanceUUIDString = v5;

  if (self->_uiAppearanceUUIDString)
  {
    double v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setObject:self->_uiAppearanceUUIDString forKeyedSubscript:@"UUID"];
    double v8 = NSNumber;
    double v9 = [(AFUISiriViewController *)self _siriView];
    double v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "mode"));
    [v7 setObject:v10 forKeyedSubscript:@"VIEWMODE"];

    if (AFIsInternalInstall())
    {
      double v11 = [(AFUISiriViewController *)self _session];
      double v12 = [v11 siriSessionInfo];
      uint64_t v13 = [v12 identifier];
      [v7 setObject:v13 forKeyedSubscript:@"SESSIONID"];
    }
  }
  else
  {
    double v7 = 0;
  }
  unint64_t v14 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v14 logEventWithType:1406 context:v7];

  _AFUIRecordSiriBeginEndCoreDuetEvent(self->_uiAppearanceRecordQueue, @"com.apple.siri.ui.begin", v7);
  _AFUIRecordSiriBeginEndBiomeEvent(self->_uiAppearanceRecordQueue, @"com.apple.siri.ui.begin", v7);
}

- (void)_recordUIDismissal
{
  uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___updateContextSiriActiveStatus_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v11 = 0;
  dispatch_async(uiAppearanceRecordQueue, block);
  if (!self->_uiAppearanceUUIDString)
  {
    p_dismissalUserInfo = &self->_dismissalUserInfo;
    if (!self->_dismissalUserInfo)
    {
      id v4 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:self->_uiAppearanceUUIDString forKeyedSubscript:@"UUID"];
  if (AFIsInternalInstall())
  {
    double v5 = [(AFUISiriViewController *)self _session];
    id v6 = [v5 siriSessionInfo];
    double v7 = [v6 identifier];
    [v4 setObject:v7 forKeyedSubscript:@"SESSIONID"];
  }
  p_dismissalUserInfo = &self->_dismissalUserInfo;
  if (self->_dismissalUserInfo)
  {
    if (v4)
    {
LABEL_9:
      [v4 addEntriesFromDictionary:*p_dismissalUserInfo];
      goto LABEL_10;
    }
LABEL_8:
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    goto LABEL_9;
  }
LABEL_10:
  double v9 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v9 logEventWithType:1409 context:v4];

  _AFUIRecordSiriBeginEndCoreDuetEvent(self->_uiAppearanceRecordQueue, @"com.apple.siri.ui.end", v4);
  [(AFUISiriViewController *)self _triggerPeopleSuggesterLogging];
}

- (void)_donateUIDismissalToBiome:(int64_t)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AFUISiriViewController__donateUIDismissalToBiome___block_invoke;
  block[3] = &unk_2646925E8;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __52__AFUISiriViewController__donateUIDismissalToBiome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1185))
  {
    id v11 = WeakRetained;
    if (*((void *)WeakRetained + 129))
    {
      id v2 = [MEMORY[0x263EFF9A0] dictionary];
      [v2 setObject:*((void *)v11 + 129) forKeyedSubscript:@"UUID"];
      if (AFIsInternalInstall())
      {
        BOOL v3 = [v11 _session];
        id v4 = [v3 siriSessionInfo];
        double v5 = [v4 identifier];
        [v2 setObject:v5 forKeyedSubscript:@"SESSIONID"];
      }
    }
    else
    {
      id v2 = 0;
    }
    uint64_t v6 = SASDismissalReasonGetName();
    double v7 = (void *)v6;
    double v8 = &stru_26D61DD68;
    if (v6) {
      double v8 = (__CFString *)v6;
    }
    double v9 = v8;

    if (!v2)
    {
      id v2 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v2 setObject:v9 forKey:*MEMORY[0x263F753E8]];

    double v10 = *((void *)v11 + 130);
    if (v10)
    {
      _AFUIRecordSiriBeginEndBiomeEvent(v10, @"com.apple.siri.ui.end", v2);
      *((unsigned char *)v11 + 1185) = 1;
    }

    id WeakRetained = v11;
  }
}

- (void)_triggerPeopleSuggesterLogging
{
  if (AFIsInternalInstall())
  {
    BOOL v3 = [(AFUISiriViewController *)self _session];
    id v4 = [v3 siriSessionInfo];
    double v5 = [v4 identifier];

    uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__AFUISiriViewController__triggerPeopleSuggesterLogging__block_invoke;
    block[3] = &unk_264691A50;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(uiAppearanceRecordQueue, block);
  }
}

void __56__AFUISiriViewController__triggerPeopleSuggesterLogging__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)get_PSSiriNLLoggerClass_softClass;
  uint64_t v9 = get_PSSiriNLLoggerClass_softClass;
  if (!get_PSSiriNLLoggerClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    id v5[2] = __get_PSSiriNLLoggerClass_block_invoke;
    v5[3] = &unk_264691928;
    void v5[4] = &v6;
    __get_PSSiriNLLoggerClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = objc_alloc_init(v3);
  [v4 logPeopleSuggesterDataWithSessionId:*(void *)(a1 + 32)];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    double v19 = "-[AFUISiriViewController viewWillAppear:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(AFUISiriViewController *)self _recordUIAppearance];
  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53) {
    [(SRUIFPlatformHostingInstrumentationHandler *)self->_viewHostingInstrumentationHandler appearanceDidChange:0 machAbsoluteTime:mach_absolute_time()];
  }
  uint64_t v6 = [(AFUISiriViewController *)self _session];
  [v6 notifyStateManagerPresentationTransitionBegan];

  v15.receiver = self;
  v15.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v15 viewWillAppear:v3];
  [(AFUISiriViewController *)self _sendBeginAppearanceTransitionIfReadyAnimated:v3];
  unint64_t v7 = +[AFUISiriSession availabilityState];
  if (v7)
  {
    uint64_t v8 = [(AFUISiriViewController *)self _session];
    [v8 forceAudioSessionActive];
  }
  uint64_t v9 = [(AFUISiriViewController *)self _fullSiriView];
  [v9 setDisabled:v7 != 0];

  double v10 = [(AFUISiriViewController *)self _fullSiriView];
  [v10 setFlamesViewDeferred:SiriUIDeviceShouldDeferFlamesView()];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel__keyboardDidShowNotification_ name:*MEMORY[0x263F837A8] object:0];
  [v11 addObserver:self selector:sel__keyboardDidHideNotification_ name:*MEMORY[0x263F837A0] object:0];
  uint64_t v16 = *MEMORY[0x263F753E8];
  double v12 = SiriUIDismissalReasonStringFromReason();
  double v17 = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  dismissalUserInfo = self->_dismissalUserInfo;
  self->_dismissalUserInfo = v13;
}

- ($5902F3589ABA92D8028CA1BE72F4BD0A)_keyboardInfoFromNotification:(SEL)a3
{
  long long v5 = *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_keyboardInfo.enabled;
  *(_OWORD *)&retstr->var3.origin.double y = v5;
  *(_OWORD *)&retstr->var3.size.double height = *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.height;
  uint64_t v6 = [a4 userInfo];
  unint64_t v7 = [v6 objectForKey:*MEMORY[0x263F837B8]];
  [v7 CGRectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  retstr->var3.origin.double x = v8;
  retstr->var3.origin.double y = v10;
  retstr->var3.size.double width = v12;
  retstr->var3.size.double height = v14;

  uint64_t v16 = [MEMORY[0x263F82B60] mainScreen];
  [v16 bounds];
  double MaxY = CGRectGetMaxY(v20);

  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (CGRectGetHeight(v21) == 0.0
    || (v22.origin.x = v9, v22.origin.y = v11, v22.size.width = v13, v22.size.double height = v15, CGRectGetMaxY(v22) >= MaxY))
  {
    v24.origin.double x = v9;
    v24.origin.double y = v11;
    v24.size.double width = v13;
    v24.size.double height = v15;
    CGFloat Height = MaxY - CGRectGetMinY(v24);
  }
  else
  {
    v23.origin.double x = v9;
    v23.origin.double y = v11;
    v23.size.double width = v13;
    v23.size.double height = v15;
    CGFloat Height = CGRectGetHeight(v23);
  }
  retstr->var4 = Height;
  return result;
}

- (void)_keyboardDidShowNotification:(id)a3
{
  id v4 = a3;
  if ([(AFUISiriViewController *)self _siriRemoteViewControllerIsEditing]) {
    goto LABEL_14;
  }
  double keyboardHeight = self->_keyboardInfo.keyboardHeight;
  [(AFUISiriViewController *)self _keyboardInfoFromNotification:v4];
  *(_OWORD *)&self->_keyboardInfo.enabled = v14;
  *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.double y = v15;
  *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.double height = v16;
  if (!self->_keyboardInfo.hasBeenShown)
  {
    double v6 = self->_keyboardInfo.keyboardHeight;
    [MEMORY[0x263F753B8] heightForWidthSizeClass:SiriUIIsCompactWidth()];
    if (v6 <= v7)
    {
      if (!self->_keyboardInfo.hasBeenShown) {
        goto LABEL_11;
      }
    }
    else
    {
      self->_keyboardInfo.hasBeenShown = 1;
    }
  }
  double v8 = self->_keyboardInfo.keyboardHeight;
  [MEMORY[0x263F753B8] heightForWidthSizeClass:SiriUIIsCompactWidth()];
  if (v8 == v9)
  {
    BOOL v10 = 1;
LABEL_10:
    self->_keyboardInfo.minimized = v10;
    goto LABEL_11;
  }
  double v11 = self->_keyboardInfo.keyboardHeight;
  [MEMORY[0x263F753B8] heightForWidthSizeClass:SiriUIIsCompactWidth()];
  if (v11 > v12)
  {
    BOOL v10 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if (keyboardHeight != self->_keyboardInfo.keyboardHeight)
  {
    CGFloat v13 = [(AFUISiriViewController *)self _remoteViewController];
    [v13 siriKeyboardViewDidChange:&self->_keyboardInfo];
  }
  [(AFUISiriViewController *)self preloadPluginBundles];
LABEL_14:
}

- (void)_keyboardDidHideNotification:(id)a3
{
  id v4 = a3;
  if (![(AFUISiriViewController *)self _siriRemoteViewControllerIsEditing])
  {
    p_keyboardInfo = &self->_keyboardInfo;
    double keyboardHeight = self->_keyboardInfo.keyboardHeight;
    [(AFUISiriViewController *)self _keyboardInfoFromNotification:v4];
    *(_OWORD *)&self->_keyboardInfo.enabled = v10;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.double y = v11;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.double height = v12;
    if (self->_keyboardInfo.hasBeenShown)
    {
      double v7 = self->_keyboardInfo.keyboardHeight;
      [MEMORY[0x263F753B8] heightForWidthSizeClass:SiriUIIsCompactWidth()];
      if (v7 == v8) {
        self->_keyboardInfo.minimized = 1;
      }
    }
    if (self->_keyboardInfo.keyboardHeight != keyboardHeight)
    {
      double v9 = [(AFUISiriViewController *)self _remoteViewController];
      [v9 siriKeyboardViewDidChange:p_keyboardInfo];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v5 = (os_log_t *)MEMORY[0x263F28348];
  double v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    double v18 = "-[AFUISiriViewController viewDidAppear:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v16.receiver = self;
  v16.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v16 viewDidAppear:v3];
  if ([(SASRequestOptions *)self->_currentRequestOptions inputType] != 2
    && [(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53)
  {
    [(AFUISiriViewController *)self presentRemoteViewControllerIfNecessary];
  }
  [(AFUISiriViewController *)self _sendEndAppearanceTransitionIfReady];
  [(AFUISiriViewController *)self setVisible:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriViewControllerDidChangeVisibility:self];

  [(AFUISiriViewController *)self _updateAudioRoutePicker];
  double v8 = [MEMORY[0x263F08AB0] processInfo];
  [v8 systemUptime];
  -[AFUISiriViewController _setViewDidAppearTime:](self, "_setViewDidAppearTime:");

  double v9 = [(AFUISiriViewController *)self _session];
  [v9 recordRequestMetricEvent:*MEMORY[0x263F28328] withTimestamp:self->_viewDidAppearTime];

  long long v10 = [(AFUISiriViewController *)self _session];
  [v10 notifyStateManagerPresentationTransitionEnded];

  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53)
  {
    long long v11 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v11 logEventWithType:1407 context:0];

    if (([MEMORY[0x263F286B8] isSAEEnabled] & 1) == 0) {
      [(SRUIFPlatformHostingInstrumentationHandler *)self->_viewHostingInstrumentationHandler appearanceDidChange:1 machAbsoluteTime:mach_absolute_time()];
    }
  }
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    long long v12 = [(AFUISiriViewController *)self view];
    CGFloat v13 = [v12 window];
    long long v14 = [v13 layer];
    [v14 setDisableUpdateMask:512];
  }
  long long v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    double v18 = "-[AFUISiriViewController viewDidAppear:]";
    _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s AFUISiriViewController's view did appear", buf, 0xCu);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v12 = "-[AFUISiriViewController viewWillDisappear:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53)
  {
    double v6 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v6 logEventWithType:1408 context:0];

    [(SRUIFPlatformHostingInstrumentationHandler *)self->_viewHostingInstrumentationHandler appearanceDidChange:2 machAbsoluteTime:mach_absolute_time()];
  }
  double v7 = [(AFUISiriViewController *)self _session];
  [v7 notifyStateManagerPresentationTransitionBegan];

  v10.receiver = self;
  v10.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v10 viewWillDisappear:v3];
  self->_viewDisappearing = 1;
  if ([(SiriUIAudioRoutePickerController *)self->_routePickerController isShowingPicker])[(SiriUIAudioRoutePickerController *)self->_routePickerController cancelPickerAnimated:1]; {
  double v8 = [(AFUISiriViewController *)self _remoteViewController];
  }
  [v8 beginAppearanceTransition:0 animated:v3];

  double v9 = [(AFUISiriViewController *)self _fullSiriView];
  [v9 setBackdropShouldRasterize:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v12 = "-[AFUISiriViewController viewDidDisappear:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v10 viewDidDisappear:v3];
  self->_viewDisappearing = 0;
  double v6 = [(AFUISiriViewController *)self _fullSiriView];
  [v6 cancelShowingPasscodeUnlock];

  double v7 = [(AFUISiriViewController *)self _remoteViewController];
  [v7 endAppearanceTransition];

  [(AFUISiriViewController *)self _setHasCalledBeginAppearanceTransition:0];
  [(AFUISiriViewController *)self _setHasCalledEndAppearanceTransition:0];
  [(AFUISiriViewController *)self setVisible:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriViewControllerDidChangeVisibility:self];

  [(AFUISiriViewController *)self _removeStatusBar];
  double v9 = [(AFUISiriViewController *)self _session];
  [v9 notifyStateManagerPresentationTransitionEnded];

  [(AFUISiriViewController *)self _recordUIDismissal];
  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53) {
    [(SRUIFPlatformHostingInstrumentationHandler *)self->_viewHostingInstrumentationHandler appearanceDidChange:3 machAbsoluteTime:mach_absolute_time()];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v4 didMoveToParentViewController:a3];
  [(AFUISiriViewController *)self _informRemoteViewControllerOfParentIfNecessary];
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v7 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(AFUISiriViewController *)self _fullSiriView];

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__AFUISiriViewController_viewSafeAreaInsetsDidChange__block_invoke;
    v4[3] = &unk_2646919D8;
    objc_copyWeak(&v5, &location);
    [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __53__AFUISiriViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  id v3 = objc_loadWeakRetained(v1);
  objc_super v4 = [v3 _fullSiriView];
  [v4 statusViewHeight];
  objc_msgSend(v2, "setStatusViewHeight:");
}

- (BOOL)isInitialBringUp
{
  return !self->_active;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v3 viewDidLoad];
  if (self->_deviceIsInStarkMode)
  {
    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      [(AFUISiriViewController *)self _setupCarPlayShockwaveViewController];
    }
  }
}

- (void)_setupCarPlayShockwaveViewController
{
  objc_super v3 = [(AFUISiriViewController *)self dataSource];
  [v3 safeAreaInsetsForSceneCreationInSiriViewController:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v12 = -[AFUISiriCarPlayShockwaveViewController initWithSafeAreaInsets:]([_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController alloc], "initWithSafeAreaInsets:", v5, v7, v9, v11);
  carPlayShockwaveViewController = self->_carPlayShockwaveViewController;
  self->_carPlayShockwaveViewController = v12;

  [(AFUISiriViewController *)self addChildViewController:self->_carPlayShockwaveViewController];
  id v15 = [(AFUISiriViewController *)self view];
  long long v14 = [(AFUISiriCarPlayShockwaveViewController *)self->_carPlayShockwaveViewController view];
  [v15 bounds];
  objc_msgSend(v14, "setFrame:");
  [v14 setAutoresizingMask:18];
  [v15 addSubview:v14];
  [(AFUISiriCarPlayShockwaveViewController *)self->_carPlayShockwaveViewController didMoveToParentViewController:self];
}

- (void)_setVoiceTriggerEnabled:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int64_t vtEnabledCount = self->_vtEnabledCount;
  int64_t v5 = vtEnabledCount - 1;
  if (a3) {
    int64_t v5 = vtEnabledCount + 1;
  }
  self->_int64_t vtEnabledCount = v5;
  if (vtEnabledCount == 1)
  {
    BOOL v7 = 0;
    BOOL v8 = v5 == 0;
  }
  else
  {
    BOOL v6 = v5 == 1;
    if (vtEnabledCount) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6;
    }
    if (vtEnabledCount) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v6;
    }
  }
  double v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = NSStringFromBOOL();
    int64_t v12 = self->_vtEnabledCount;
    uint64_t v13 = NSStringFromBOOL();
    long long v14 = (void *)v13;
    id v15 = @"Disabled";
    *(_DWORD *)long long buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[AFUISiriViewController _setVoiceTriggerEnabled:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    if (v7) {
      id v15 = @"Enabled";
    }
    CGRect v23 = (void *)vtEnabledCount;
    *(_WORD *)&buf[22] = 2048;
    if (!v8) {
      id v15 = @"No change";
    }
    *(_WORD *)CGRect v24 = 2048;
    *(void *)&v24[2] = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ previousCount:%zd newCount:%zd transitioning:%@ newState:%@", buf, 0x3Eu);
  }
  if (v8)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    objc_super v16 = (void *)getVTStateManagerClass_softClass;
    uint64_t v21 = getVTStateManagerClass_softClass;
    if (!getVTStateManagerClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getVTStateManagerClass_block_invoke;
      CGRect v23 = &unk_264691928;
      *(void *)CGRect v24 = &v18;
      __getVTStateManagerClass_block_invoke((uint64_t)buf);
      objc_super v16 = (void *)v19[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v17, "requestVoiceTriggerEnabled:forReason:", v7, @"Siri is active", v18);
  }
}

- (void)presentRemoteViewControllerIfNecessary
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __64__AFUISiriViewController_presentRemoteViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentRemoteViewController];
}

- (void)_presentRemoteViewController
{
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = (os_log_t *)MEMORY[0x263F28348];
    if (v4)
    {
      [WeakRetained _resumeRemoteViewControllerDispatchQueue];
      os_log_t v8 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_2(v8, v6, (uint64_t)v4);
      }
      double v9 = [(id)v6 delegate];
      [v9 siriViewController:v6 didEncounterUnexpectedError:v4];

      if ([(id)v6 isBeingPresented]) {
        [(id)v6 dismissViewControllerAnimated:0 completion:0];
      }
    }
    else
    {
      if (WeakRetained[166])
      {
        uint64_t v18 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315138;
          v28 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
          _os_log_impl(&dword_223099000, v18, OS_LOG_TYPE_DEFAULT, "%s Remote Scene Controller did succeed in hosting scene", (uint8_t *)&v27, 0xCu);
        }
        [(id)v6 addChildViewController:*(void *)(v6 + 1328)];
        [(id)v6 _sendBeginAppearanceTransitionIfReadyAnimated:0];
        uint64_t v19 = *(void **)(v6 + 1328);
        [(id)v6 _statusBarFrame];
        objc_msgSend(v19, "setStatusBarFrame:");
        uint64_t v20 = *(void **)(v6 + 1328);
        uint64_t v21 = [(id)v6 _fullSiriView];
        [v21 statusViewHeight];
        objc_msgSend(v20, "setStatusViewHeight:");

        CGRect v22 = *(void **)(v6 + 1320);
        CGRect v23 = [*(id *)(v6 + 1328) sessionDelegate];
        [v22 setDelegate:v23];

        [*(id *)(v6 + 1328) setSession:*(void *)(v6 + 1320)];
        CGRect v24 = [(id)v6 view];
        __int16 v25 = [*(id *)(v6 + 1328) view];
        [v24 setRemoteContentView:v25];

        [(id)v6 _informRemoteViewControllerOfParentIfNecessary];
      }
      [(id)v6 _resumeRemoteViewControllerDispatchQueue];
      [(id)v6 _sendEndAppearanceTransitionIfReady];
      [(id)v6 _endDelayingPresentation];
    }
    *(void *)(v6 + 1120) = 2;
    uint64_t v26 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315138;
      v28 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
      _os_log_impl(&dword_223099000, v26, OS_LOG_TYPE_DEFAULT, "%s transitioning _remoteViewController connectionState to loaded", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    double v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    remoteViewController = self->_remoteViewController;
    [(AFUISiriRemoteSceneViewController *)remoteViewController dismissViewControllerAnimated:1 completion:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AFUISiriViewController;
    [(AFUISiriViewController *)&v5 dismissViewControllerAnimated:0 completion:a4];
  }
}

- (void)_informRemoteViewControllerOfParentIfNecessary
{
  id v6 = [(AFUISiriViewController *)self view];
  objc_super v3 = [(AFUISiriRemoteSceneViewController *)self->_remoteViewController view];
  if ([v6 containsView:v3])
  {
    id v4 = [(AFUISiriViewController *)self parentViewController];

    if (v4)
    {
      remoteViewController = self->_remoteViewController;
      [(AFUISiriRemoteSceneViewController *)remoteViewController didMoveToParentViewController:self];
    }
  }
  else
  {
  }
}

- (void)invalidate
{
}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v7 = (void (**)(id, uint64_t))a4;
  os_log_t v8 = [(AFUISiriViewController *)self traitCollection];
  int v9 = [v8 isAmbientPresented];

  if (!v9) {
    goto LABEL_7;
  }
  double v10 = [(AFUISiriViewController *)self _compactSiriView];
  int v11 = [v10 isDimmingViewVisible];

  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CGRect v24 = "-[AFUISiriViewController hasContentAtPoint:completion:]";
    _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s #ambient - dimming layer visible - has content at point", buf, 0xCu);
  }
  if (v7)
  {
    v7[2](v7, 1);
  }
  else
  {
LABEL_7:
    uint64_t v13 = [(AFUISiriViewController *)self view];
    uint64_t v14 = objc_msgSend(v13, "hitTest:withEvent:", 0, x, y);

    if (v14)
    {
      uint64_t v15 = [(AFUISiriRemoteSceneViewController *)self->_remoteViewController view];
      if ([v14 isDescendantOfView:v15])
      {
        objc_initWeak((id *)buf, self);
        uint64_t v16 = -[SiriSharedUITamaleView hitTest:withEvent:](self->_tamaleView, "hitTest:withEvent:", 0, x, y);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke;
        v18[3] = &unk_264692990;
        objc_copyWeak(v22, (id *)buf);
        v22[1] = *(id *)&x;
        v22[2] = *(id *)&y;
        id v17 = v16;
        id v19 = v17;
        uint64_t v20 = self;
        uint64_t v21 = v7;
        [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v18];

        objc_destroyWeak(v22);
        objc_destroyWeak((id *)buf);
      }
      else if (v7)
      {
        v7[2](v7, 1);
      }
    }
    else if (v7)
    {
      v7[2](v7, 0);
    }
  }
}

void __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained _remoteViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_2;
  v7[3] = &unk_264692968;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  objc_copyWeak(&v11, v2);
  id v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "hasContentAtPoint:completion:", v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

  objc_destroyWeak(&v11);
}

void __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32) || (a2 & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      BOOL v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
  else
  {
    objc_super v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v11 = "-[AFUISiriViewController hasContentAtPoint:completion:]_block_invoke_2";
      _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #contentAtPoint - tapping on Tamale only when Siri is also on screen", buf, 0xCu);
    }
    id v4 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_165;
    v8[3] = &unk_2646919D8;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    [v4 _enqueueRemoteViewControllerMessageBlock:v8];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
    objc_destroyWeak(&v9);
  }
}

void __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_165(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 dismissSiriResults];
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AFUISiriViewController_didDetectGestureEvent_inRegion___block_invoke;
  v7[3] = &unk_2646929B8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  void v8[2] = (id)a4;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __57__AFUISiriViewController_didDetectGestureEvent_inRegion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 didDetectGestureEvent:*(void *)(a1 + 40) inRegion:*(void *)(a1 + 48)];
}

- (void)setDockFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(AFUISiriViewController *)self _compactSiriView];
  id v9 = [(AFUISiriViewController *)self view];
  objc_msgSend(v9, "convertRect:toView:", v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v8, "setDockFrame:", v11, v13, v15, v17);
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __39__AFUISiriViewController_setDockFrame___block_invoke;
  v18[3] = &unk_264692940;
  objc_copyWeak(v19, &location);
  v19[1] = *(id *)&x;
  v19[2] = *(id *)&y;
  v19[3] = *(id *)&width;
  v19[4] = *(id *)&height;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v18];
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __39__AFUISiriViewController_setDockFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  objc_msgSend(v2, "setDockFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setSystemApertureFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __49__AFUISiriViewController_setSystemApertureFrame___block_invoke;
  id v8[3] = &unk_264692940;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&x;
  v9[2] = *(id *)&y;
  v9[3] = *(id *)&width;
  v9[4] = *(id *)&height;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __49__AFUISiriViewController_setSystemApertureFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  objc_msgSend(v2, "setSystemContentFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)requestSystemApertureCollapse
{
  objc_super v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 requestSystemApertureCollapse];
  }
}

- (void)invalidateSystemApertureAssertion
{
  objc_super v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 invalidateSystemApertureAssertion];
  }
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __95__AFUISiriViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke;
  id v8[3] = &unk_264691C68;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  id v7 = v6;
  id v9 = v7;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __95__AFUISiriViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 siriWillBeginTearDownForDismissalReason:*(void *)(a1 + 48) withOriginalDismissalOptions:*(void *)(a1 + 32)];
}

- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AFUISiriViewController_compactView_bottomContentInsetDidChange___block_invoke;
  v7[3] = &unk_2646925E8;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a4;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __66__AFUISiriViewController_compactView_bottomContentInsetDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 setBottomContentInset:*(double *)(a1 + 40)];
}

- (void)compactView:(id)a3 blurVisibilityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = [(AFUISiriViewController *)self _compactSiriView];
    id v8 = [v7 window];
    if ([v8 interfaceOrientation] == 1)
    {
    }
    else
    {
      int IsPad = SiriUIDeviceIsPad();

      if (!IsPad) {
        goto LABEL_6;
      }
    }
    [(AFUISiriViewController *)self setStatusBarEnabled:1];
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__AFUISiriViewController_compactView_blurVisibilityDidChange___block_invoke;
    v17[3] = &unk_2646929E0;
    objc_copyWeak(&v18, &location);
    BOOL v19 = v4;
    [(AFUISiriViewController *)self requestStatusBarVisible:v4 animated:1 completion:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
LABEL_6:
  double v10 = [(AFUISiriViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(AFUISiriViewController *)self delegate];
    [v12 setShouldPassTouchesThroughToSpringBoard:v4 ^ 1];
  }
  double v13 = [(AFUISiriViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v15 = [(AFUISiriViewController *)self delegate];
    [v15 setShareHomeGesture:v4 ^ 1];
  }
  double v16 = [(AFUISiriViewController *)self delegate];
  [v16 siriViewController:self updateHomeAffordanceForBlurVisibilty:v4];
}

void __62__AFUISiriViewController_compactView_blurVisibilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStatusBarEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)compactViewShouldShowDebugButton:(id)a3
{
  if (!AFIsInternalInstall()) {
    return 0;
  }
  BOOL v4 = [MEMORY[0x263F285A0] sharedPreferences];
  BOOL v5 = [v4 debugButtonIsEnabled]
    && [(AFUISiriViewController *)self viewMode] != 5
    && self->_currentRequestSource != 53;

  return v5;
}

- (void)_presentDeferredFlamesViewIfNecessary
{
  id v2 = [(AFUISiriViewController *)self _fullSiriView];
  [v2 setFlamesViewDeferred:0];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_sendBeginAppearanceTransitionIfReadyAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AFUISiriViewController *)self _remoteViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [(AFUISiriViewController *)self _hasCalledBeginAppearanceTransition];

    if (!v7)
    {
      id v8 = [(AFUISiriViewController *)self _remoteViewController];
      [v8 beginAppearanceTransition:1 animated:v3];

      [(AFUISiriViewController *)self _setHasCalledBeginAppearanceTransition:1];
    }
  }
}

- (void)_sendEndAppearanceTransitionIfReady
{
  uint64_t v3 = [(AFUISiriViewController *)self _remoteViewController];
  if (v3
    && (id v6 = (id)v3,
        [(AFUISiriViewController *)self _hasCalledBeginAppearanceTransition]))
  {
    BOOL v4 = [(AFUISiriViewController *)self _hasCalledEndAppearanceTransition];

    if (!v4)
    {
      uint64_t v5 = [(AFUISiriViewController *)self _remoteViewController];
      [v5 endAppearanceTransition];

      [(AFUISiriViewController *)self _setHasCalledEndAppearanceTransition:1];
    }
  }
  else
  {
    MEMORY[0x270F9A758]();
  }
}

- (void)_enqueueRemoteViewControllerMessageBlock:(id)a3
{
}

- (id)siriRemoteViewController:(id)a3 bulletinWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(AFUISiriViewController *)self dataSource];
  BOOL v7 = [v6 siriViewController:self bulletinWithIdentifier:v5];

  return v7;
}

- (unint64_t)lockStateForSiriRemoteViewController:(id)a3
{
  BOOL v4 = [(AFUISiriViewController *)self dataSource];
  unint64_t v5 = [v4 lockStateForSiriViewController:self];

  return v5;
}

- (void)siriRemoteViewControllerDidFinishDismissing:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    double v10 = "-[AFUISiriViewController siriRemoteViewControllerDidFinishDismissing:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(AFUISiriViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(AFUISiriViewController *)self delegate];
    [v8 siriViewControllerDidFinishDismissing:self];
  }
}

- (void)siriRemoteViewController:(id)a3 invalidatedForReason:(unint64_t)a4 explanation:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 7;
  if (a4 != 4) {
    uint64_t v6 = 0;
  }
  if (a4 == 5) {
    uint64_t v7 = 23;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F28730];
  if (a5)
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = a5;
    double v10 = NSDictionary;
    id v11 = a5;
    id v12 = [v10 dictionaryWithObjects:v16 forKeys:&v15 count:1];
    double v13 = [v8 errorWithDomain:v9 code:v7 userInfo:v12];
  }
  else
  {
    id v12 = 0;
    double v13 = [v8 errorWithDomain:v9 code:v7 userInfo:0];
  }

  char v14 = [(AFUISiriViewController *)self delegate];
  [v14 siriViewController:self didEncounterUnexpectedError:v13];
}

- (int64_t)siriRemoteViewControllerRequestsActivationSource:(id)a3
{
  return self->_currentRequestSource;
}

- (void)dismissSiriRemoteViewController:(id)a3 userInfo:(id)a4 withReason:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (NSDictionary *)a4;
  double v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = SASDismissalReasonGetName();
    int v14 = 136315394;
    uint64_t v15 = "-[AFUISiriViewController dismissSiriRemoteViewController:userInfo:withReason:]";
    __int16 v16 = 2112;
    double v17 = v12;
    _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #punchout #activation dismissal requested %@", (uint8_t *)&v14, 0x16u);
  }
  dismissalUserInfo = v9;
  if (!v9) {
    dismissalUserInfo = self->_dismissalUserInfo;
  }
  objc_storeStrong((id *)&self->_dismissalUserInfo, dismissalUserInfo);
  [(AFUISiriViewController *)self _dismissWithReason:a5];
}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriViewController *)self delegate];
    [v7 setShouldDismissForTapOutsideContent:v3];
  }
}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriViewController *)self delegate];
    [v7 setShouldDismissForTapsOutsideContent:v3];
  }
}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriViewController *)self delegate];
    [v7 setShouldDismissForSwipesOutsideContent:v3];
  }
}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriViewController *)self delegate];
    [v7 setShouldPassTouchesThroughToSpringBoard:v3];
  }
}

- (void)resetGestureBehaviors
{
  BOOL v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 resetGestureBehaviors];
  }
}

- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(AFUISiriViewController *)self _compactSiriView];
  [v9 requestBlurVisible:v6 reason:a4 fence:v8];
}

- (void)siriRemoteViewController:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(AFUISiriViewController *)self _compactSiriView];
  [v5 reduceOrbOpacity:v4];
}

- (void)siriRemoteViewControllerDidPresentKeyboard:(id)a3
{
  BOOL v4 = [(AFUISiriViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewControllerDidPresentKeyboard:self];
  }
}

- (void)startGuidedAccessForRemoteViewController:(id)a3
{
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 startGuidedAccessForSiriViewController:self];
}

- (void)siriRemoteViewController:(id)a3 startRequestWithOptions:(id)a4
{
}

- (void)userRelevantEventDidOccurInSiriRemoteViewController:(id)a3
{
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 userRelevantEventDidOccurInSiriViewController:self];
}

- (void)siriRemoteViewController:(id)a3 didRequestCurrentTextInputWithReplyHandler:(id)a4
{
  if (a4)
  {
    inputAccessoryView = self->_inputAccessoryView;
    id v6 = a4;
    id v8 = [(SiriUIKeyboardView *)inputAccessoryView textField];
    id v7 = [v8 text];
    (*((void (**)(id, void *))a4 + 2))(v6, v7);
  }
}

- (void)siriRemoteViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AFUISiriViewController *)self _siriView];
  uint64_t v7 = [v6 siriSessionState];

  [(AFUISiriTapPanDismissalPolicyManager *)self->_tapPanDismissalPolicyManager idleAndQuietDidChange:v4 forSessionState:v7];
  id v8 = [(AFUISiriViewController *)self delegate];
  [v8 siriViewController:self siriIdleAndQuietStatusDidChange:v4];

  session = self->_session;

  [(AFUISiriSession *)session idleAndQuietStatusDidChange:v4];
}

- (void)siriRemoteViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
}

- (void)siriRemoteViewController:(id)a3 setTypeToSiriViewHidden:(BOOL)a4
{
}

- (void)siriRemoteViewController:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)_setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(AFUISiriViewController *)self _siriView];
  uint64_t v8 = [v7 siriSessionState];

  [(AFUISiriTapPanDismissalPolicyManager *)self->_tapPanDismissalPolicyManager dimmingLayerVisibilityDidChange:v5 forSessionState:v8];
  id v9 = [(AFUISiriViewController *)self _compactSiriView];
  [v9 setFullScreenDimmingLayerVisible:v5 animated:v4];
}

- (void)siriRemoteViewController:(id)a3 inputTypeDidChange:(int64_t)a4
{
  [(AFUISiriTapPanDismissalPolicyManager *)self->_tapPanDismissalPolicyManager inputTypeDidChange:a4];
  id v6 = [(AFUISiriViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(AFUISiriViewController *)self delegate];
    [v8 setInputType:a4];
  }
  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    id v9 = [(AFUISiriViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(AFUISiriViewController *)self delegate];
      [v11 setShouldPassTouchesThroughToSpringBoard:a4 != 1];
    }
  }
}

- (void)siriRemoteViewController:(id)a3 setStatusViewDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(AFUISiriViewController *)self _fullSiriView];
  [v5 setDisabled:v4];
}

- (void)siriRemoteViewController:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(AFUISiriViewController *)self _fullSiriView];
  [v5 setStatusViewUserInteractionEnabled:v4];
}

- (void)siriRemoteViewController:(id)a3 willPresentViewControllerWithStatusBarStyle:(int64_t)a4
{
  [(UIStatusBar *)self->_statusBar requestStyle:a4 animated:1];
  id v5 = NSStringFromSelector(sel_supportedInterfaceOrientations);
  [(AFUISiriViewController *)self willChangeValueForKey:v5];

  self->_remoteViewControllerIsPresenting = 1;
}

- (void)siriRemoteViewController:(id)a3 didPresentViewControllerWithStatusBarStyle:(int64_t)a4
{
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AFUISiriViewController *)self didChangeValueForKey:v5];
}

- (void)siriRemoteViewController:(id)a3 willDismissViewControllerWithStatusBarStyle:(int64_t)a4
{
  [(UIStatusBar *)self->_statusBar requestStyle:self->_statusBarStyle animated:0];
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AFUISiriViewController *)self willChangeValueForKey:v5];
}

- (void)siriRemoteViewController:(id)a3 didDismissViewControllerWithStatusBarStyle:(int64_t)a4
{
  [(UIStatusBar *)self->_statusBar requestStyle:self->_statusBarStyle animated:0];
  self->_remoteViewControllerIsPresenting = 0;
  [(AFUISiriViewController *)self _updateInterfaceOrientationAnimated:1];
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AFUISiriViewController *)self didChangeValueForKey:v5];
}

- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)siriRemoteViewController:(id)a3 setHelpButtonEmphasized:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(AFUISiriViewController *)self _fullSiriView];
  [v5 setHelpButtonEmphasized:v4];
}

- (void)siriRemoteViewController:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(AFUISiriViewController *)self _fullSiriView];
  [v5 setBugReportingAvailable:v4];
}

- (void)siriRemoteViewController:(id)a3 setRequestHandlingStatus:(unint64_t)a4
{
  id v6 = [(AFUISiriViewController *)self _siriView];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(AFUISiriViewController *)self _siriView];
    [v8 setRequestHandlingStatus:a4];
  }
}

- (void)siriRemoteViewController:(id)a3 handlePasscodeUnlockWithCompletion:(id)a4
{
  id v6 = a4;
  if (([(AFUISiriViewController *)self lockStateForSiriRemoteViewController:a3] & 2) != 0)
  {
    [(AFUISiriViewController *)self handlePasscodeUnlockWithCompletion:v6];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __86__AFUISiriViewController_siriRemoteViewController_handlePasscodeUnlockWithCompletion___block_invoke;
    v7[3] = &unk_264691AC8;
    id v8 = v6;
    [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v7];
  }
}

uint64_t __86__AFUISiriViewController_siriRemoteViewController_handlePasscodeUnlockWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siriRemoteViewController:(id)a3 willStartTest:(id)a4
{
  id v8 = a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AFUISiriViewController *)self delegate];
    [v7 siriViewController:self willStartTest:v8];
  }
}

- (void)siriRemoteViewController:(id)a3 didFinishTest:(id)a4
{
  id v8 = a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AFUISiriViewController *)self delegate];
    [v7 siriViewController:self didFinishTest:v8];
  }
}

- (void)siriRemoteViewController:(id)a3 failTest:(id)a4 withReason:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(AFUISiriViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(AFUISiriViewController *)self delegate];
    [v10 siriViewController:self failTest:v11 withReason:v7];
  }
}

- (void)siriRemoteViewControllerDidPresentUserInterface:(id)a3
{
  id v5 = [(AFUISiriViewController *)self _session];
  uint64_t v3 = *MEMORY[0x263F28330];
  BOOL v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  objc_msgSend(v5, "recordRequestMetricEvent:withTimestamp:", v3);
}

- (void)siriRemoteViewControllerPulseHelpButton:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _fullSiriView];
  [v3 pulseHelpButton];
}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(AFUISiriViewController *)self _setPunchingOut:1];
  id v13 = [(AFUISiriViewController *)self delegate];
  [v13 openURL:v12 bundleId:v11 inPlace:v6 completion:v10];
}

- (void)siriRemoteViewControllerDidDetectMicButtonTap:(id)a3
{
}

- (void)siriRemoteViewControllerDidDetectMicButtonLongPressBegan:(id)a3
{
}

- (void)siriRemoteViewControllerDidDetectMicButtonLongPressEnded:(id)a3
{
}

- (void)siriRemoteViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4
{
  id v6 = [(AFUISiriViewController *)self delegate];
  [v6 siriViewController:self didChangePresentationPeekMode:a4];
}

- (void)updatePresentationVisualState:(unint64_t)a3
{
  id v5 = [(AFUISiriViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriViewController *)self delegate];
    [v7 siriViewController:self didChangePresentationVisualState:a3];
  }
}

- (void)siriRemoteViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4
{
}

- (void)siriRemoteViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AFUISiriViewController *)self delegate];
  [v6 siriViewController:self willChangeKeyboardVisibility:v4];
}

- (void)siriRemoteViewControllerDidPresentConversationFromBreadcrumb:(id)a3
{
  self->_presentedConversationFromBreadcrumb = 1;
  id v3 = [(AFUISiriViewController *)self _siriView];
  [v3 setSiriSessionState:0];
}

- (void)siriRemoteViewControllerDidResetTextInput:(id)a3
{
  id v3 = [(SiriUIKeyboardView *)self->_inputAccessoryView textField];
  [v3 setText:&stru_26D61DD68];
}

- (void)siriRemoteViewControllerRequestsHIDEventDefferal:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _remoteViewController];
  [v3 startDeferringHIDEventsIfNeeded];
}

- (void)siriRemoteViewControllerCancelHIDEventDefferal:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _remoteViewController];
  [v3 invalidateAndPauseDeferringHIDEvents];
}

- (void)siriRemoteViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  [(AFUISiriViewController *)self _setSiriRemoteViewControllerIsEditing:1];
  id v5 = [(AFUISiriViewController *)self _remoteViewController];
  [v5 startDeferringHIDEventsIfNeeded];

  v6[2](v6, 1);
}

- (void)siriRemoteViewControllerWillBeginEditing:(id)a3
{
  uint64_t v4 = 1;
  [(AFUISiriViewController *)self _setSiriRemoteViewControllerIsEditing:1];
  BOOL v5 = [(AFUISiriViewController *)self _statusViewHidden];
  self->_statusViewWasHiddenBeforeEditingStarted = v5;
  if (!v5) {
    uint64_t v4 = [MEMORY[0x263F828A0] isInHardwareKeyboardMode] ^ 1;
  }
  [(AFUISiriViewController *)self _setStatusViewHidden:v4];
  id v6 = (void *)*MEMORY[0x263F83300];

  [v6 _deactivateReachability];
}

- (void)siriRemoteViewControllerDidEndEditing:(id)a3
{
  [(AFUISiriViewController *)self _setSiriRemoteViewControllerIsEditing:0];
  BOOL v4 = self->_unlockScreenVisible || self->_statusViewWasHiddenBeforeEditingStarted;
  [(AFUISiriViewController *)self _setStatusViewHidden:v4];
  id v5 = [(AFUISiriViewController *)self _remoteViewController];
  [v5 invalidateAndPauseDeferringHIDEvents];
}

- (void)siriRemoteViewController:(id)a3 requestsPresentation:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 siriViewController:self requestsPresentation:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)siriRemoteViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void))a5;
  id v8 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v9 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = SASDismissalReasonGetName();
      int v12 = 136315394;
      id v13 = "-[AFUISiriViewController siriRemoteViewController:requestsDismissalWithReason:withCompletion:]";
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v12, 0x16u);
    }
    [v8 siriViewController:self requestsDismissalWithReason:a4 withCompletion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (void)siriRemoteViewController:(id)a3 presentedIntentWithBundleId:(id)a4
{
  id v6 = a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 siriViewController:self presentedIntentWithBundleId:v6];
  }
}

- (void)siriRemoteViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  id v7 = a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewController:self didUpdateAudioCategoriesDisablingVolumeHUD:v7];
  }
}

- (void)siriRemoteViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4
{
  id v7 = a4;
  id v5 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewController:self sceneDidActivateWithIdentifier:v7];
  }
}

- (void)siriRemoteViewControllerDidDeactivateScene:(id)a3
{
  id v5 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(AFUISiriViewController *)self delegate];
    [v4 siriViewControllerDidDeactivateScene:self];
  }
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 toggleHomeAffordanceHidden:v3];
}

- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 toggleSiriHomeAffordanceGestureControl:v3];
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  self->_shouldPlaceEffectsWindowOnTopOfSiriWindow = a3 == 1;
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 updateEdgeLightWindowLevel:a3];
}

- (void)siriResultsDidDismissInTamale
{
  BOOL v3 = [(AFUISiriViewController *)self _visualIntelligenceCameraDelegate];
  [v3 siriDidDismissResults];

  id v4 = [(AFUISiriViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewControllerDidStopListening:self];
  }
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    id v7 = v5;
    id v8 = [v6 numberWithBool:v3];
    int v14 = 136315394;
    uint64_t v15 = "-[AFUISiriViewController _setStatusViewHidden:]";
    __int16 v16 = 2112;
    double v17 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s _setStatusViewHidden: %@", (uint8_t *)&v14, 0x16u);
  }
  self->_statusViewHidden = v3;
  char v9 = [(AFUISiriViewController *)self _fullSiriView];
  [v9 setStatusViewHidden:self->_statusViewHidden];

  id v10 = [(AFUISiriViewController *)self _siriView];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(AFUISiriViewController *)self _siriView];
    [v12 setAuxiliaryViewsHidden:self->_statusViewHidden animated:1];
  }
  id v13 = [(AFUISiriViewController *)self delegate];
  [v13 siriViewController:self didHideStatusView:self->_statusViewHidden];
}

- (void)_setTypeToSiriViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[SiriUIKeyboardView setHidden:](self->_inputAccessoryView, "setHidden:");
  if (v3)
  {
    [(SiriUIKeyboardView *)self->_inputAccessoryView resignFirstResponder];
    [(AFUISiriViewController *)self resignFirstResponder];
  }
  else
  {
    [(AFUISiriViewController *)self becomeFirstResponder];
  }
}

- (double)_thresholdForBarSwipeDismissal
{
  [(AFUISiriViewController *)self _screenHeight];
  return v2 + v2 / -15.0;
}

- (double)_screenHeight
{
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 _referenceBounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  int v12 = [(AFUISiriViewController *)self view];
  id v13 = [v12 window];
  uint64_t v14 = [v13 interfaceOrientation];

  uint64_t v15 = v5;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v11;
  if ((unint64_t)(v14 - 1) > 1)
  {
    return CGRectGetWidth(*(CGRect *)&v15);
  }
  else
  {
    return CGRectGetHeight(*(CGRect *)&v15);
  }
}

- (double)_homeGestureFractionCompleteFromCurrentYPosition:(double)a3 yPositionAtCompletion:(double)a4
{
  [(AFUISiriViewController *)self _screenHeight];
  double v8 = v7 - a4;
  [(AFUISiriViewController *)self _screenHeight];
  return fmin((v9 - a3) / v8, 1.0);
}

- (void)keyboardView:(id)a3 didReceiveText:(id)a4
{
  id v5 = a4;
  id v6 = [(AFUISiriViewController *)self _remoteViewController];
  [v6 startRequestForText:v5];
}

- (void)tapPanDismissalPolicyManager:(id)a3 dismissalPolicyDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  [(AFUISiriViewController *)self setShouldDismissForTapOutsideContent:a4];
  [(AFUISiriViewController *)self setShouldDismissForTapsOutsideContent:v4];

  [(AFUISiriViewController *)self setShouldDismissForSwipesOutsideContent:v4];
}

- (void)_handleMicButtonTapFromSource:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (![(AFUISiriSession *)self->_session attendingState]
    || [(AFUISiriViewController *)self isDeviceInStarkMode])
  {
    id v6 = [MEMORY[0x263F283F8] sharedAnalytics];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __56__AFUISiriViewController__handleMicButtonTapFromSource___block_invoke;
    v28[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v28[4] = a3;
    [v6 logEventWithType:1412 contextProvider:v28];

    activationInstrumentation = self->_activationInstrumentation;
    double v8 = SASRequestSourceGetName();
    double v9 = [(SASActivationInstrumentation *)activationInstrumentation buttonTapWithIdentifier:v8 associateWithButtonDown:0];

    uint64_t v10 = [(AFUISiriViewController *)self _siriView];
    uint64_t v11 = [v10 siriSessionState];

    int v12 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      uint64_t v14 = SRUIFSiriSessionStateGetDescription();
      *(_DWORD *)long long buf = 136315394;
      v30 = "-[AFUISiriViewController _handleMicButtonTapFromSource:]";
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);
    }
    uint64_t v15 = [(AFUISiriViewController *)self _compactSiriView];
    if (v15
      || ([(AFUISiriViewController *)self _carPlaySiriView],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v26 = [(AFUISiriViewController *)self _fullSiriView];
      char v27 = [v26 disabled];

      if (v27)
      {
LABEL_22:

        return;
      }
    }
    switch(v11)
    {
      case 0:
        if (![(AFUISiriSession *)self->_session attendingState]) {
          goto LABEL_14;
        }
        if (![(AFUISiriSession *)self->_session attendingState]) {
          goto LABEL_17;
        }
        goto LABEL_11;
      case 1:
LABEL_11:
        uint64_t v16 = [(AFUISiriViewController *)self _session];
        [v16 stopRecordingSpeech];

        uint64_t v17 = [(AFUISiriViewController *)self _session];
        [v17 stopAttending];

        [(AFUISiriViewController *)self _informRemoteViewControllerOfOrbViewTapToCancelRequest];
        break;
      case 2:
        CGRect v24 = [(AFUISiriViewController *)self _session];
        [v24 cancelSpeechRequest];

        [(AFUISiriViewController *)self _informRemoteViewControllerOfOrbViewTapToCancelRequest];
        uint64_t v25 = [(AFUISiriViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v25 siriViewControllerSpeechRequestCancelledFromSiriOrb];
        }

        break;
      case 3:
LABEL_14:
        id v19 = objc_alloc(MEMORY[0x263F6C730]);
        uint64_t v20 = [(AFUISiriViewController *)self _uiPresentationIdentifier];
        uint64_t v21 = (void *)[v19 initWithRequestSource:3 uiPresentationIdentifier:v20];

        [v21 setActivationEventInstrumentationIdenifier:v9];
        [(AFUISiriViewController *)self startRequestWithOptions:v21];
        CGRect v22 = [(AFUISiriViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v22 siriViewControllerSpeechRequestStartedFromSiriOrb];
        }

        break;
      default:
LABEL_17:
        CGRect v23 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFUISiriViewController.m", 2350, @"Unknown Siri status session state %ld", v11);

        break;
    }
    goto LABEL_22;
  }
  uint64_t v18 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v30 = "-[AFUISiriViewController _handleMicButtonTapFromSource:]";
    _os_log_impl(&dword_223099000, v18, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button taps in fluid configurations - orb will bounce instead", buf, 0xCu);
  }
}

id __56__AFUISiriViewController__handleMicButtonTapFromSource___block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = SASRequestSourceGetName();
  id v1 = (void *)v0;
  if (v0)
  {
    BOOL v4 = @"requestSource";
    v5[0] = v0;
    double v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

- (void)_informRemoteViewControllerOfOrbViewTapToCancelRequest
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__AFUISiriViewController__informRemoteViewControllerOfOrbViewTapToCancelRequest__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __80__AFUISiriViewController__informRemoteViewControllerOfOrbViewTapToCancelRequest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 didReceiveOrbViewTapToCancelRequest];
}

- (void)_handleMicButtonLongPressBeganFromSource:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(AFUISiriSession *)self->_session attendingState]
    && ![(AFUISiriViewController *)self isDeviceInStarkMode])
  {
    uint64_t v26 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
      _os_log_impl(&dword_223099000, v26, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button long press start in fluid configurations - orb will bounce instead", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F283F8] sharedAnalytics];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67__AFUISiriViewController__handleMicButtonLongPressBeganFromSource___block_invoke;
    v27[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v27[4] = a3;
    [v5 logEventWithType:1410 contextProvider:v27];

    id v6 = [(AFUISiriViewController *)self _siriView];
    unint64_t v7 = [v6 siriSessionState];

    double v8 = (os_log_t *)MEMORY[0x263F28348];
    double v9 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      uint64_t v11 = SRUIFSiriSessionStateGetDescription();
      *(_DWORD *)long long buf = 136315394;
      uint64_t v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
      __int16 v30 = 2112;
      __int16 v31 = v11;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);
    }
    if (v7 <= 3 && v7 != 1)
    {
      p_triggerUpdater = &self->_triggerUpdater;
      if (self->_triggerUpdater)
      {
        id v13 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
          _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s Old trigger released", buf, 0xCu);
        }
        (*((void (**)(void))*p_triggerUpdater + 2))();
        id v14 = *p_triggerUpdater;
        id *p_triggerUpdater = 0;
      }
      uint64_t v15 = [(AFUISiriViewController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [(AFUISiriViewController *)self delegate];
        [v17 siriViewControllerSpeechRequestStartedFromSiriOrb];
      }
      activationInstrumentation = self->_activationInstrumentation;
      id v19 = SASRequestSourceGetName();
      uint64_t v20 = [(SASActivationInstrumentation *)activationInstrumentation buttonDownWithIdentifier:v19];

      id v21 = objc_alloc(MEMORY[0x263F6C730]);
      CGRect v22 = [(AFUISiriViewController *)self _uiPresentationIdentifier];
      CGRect v23 = (void *)[v21 initWithRequestSource:a3 uiPresentationIdentifier:v22];

      [v23 setActivationEventInstrumentationIdenifier:v20];
      CGRect v24 = (void *)[objc_alloc(MEMORY[0x263F6C738]) initWithRequestOptions:v23 updateHandle:&self->_triggerUpdater];
      uint64_t v25 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
        _os_log_impl(&dword_223099000, v25, OS_LOG_TYPE_DEFAULT, "%s Starting new request with trigger", buf, 0xCu);
      }
      [(AFUISiriViewController *)self startRequestWithActivationTrigger:v24];
    }
  }
}

id __67__AFUISiriViewController__handleMicButtonLongPressBeganFromSource___block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = SASRequestSourceGetName();
  id v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"requestSource";
    v5[0] = v0;
    double v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

- (void)_handleMicButtonLongPressEndedFromSource:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(AFUISiriSession *)self->_session attendingState]
    && ![(AFUISiriViewController *)self isDeviceInStarkMode])
  {
    char v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
      _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button long press end in fluid configurations - orb will bounce instead", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F283F8] sharedAnalytics];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67__AFUISiriViewController__handleMicButtonLongPressEndedFromSource___block_invoke;
    v17[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    void v17[4] = a3;
    [v5 logEventWithType:1411 contextProvider:v17];

    activationInstrumentation = self->_activationInstrumentation;
    unint64_t v7 = SASRequestSourceGetName();
    id v8 = (id)[(SASActivationInstrumentation *)activationInstrumentation buttonUpWithIdentifier:v7];

    double v9 = [(AFUISiriViewController *)self _siriView];
    [v9 siriSessionState];

    uint64_t v10 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v11 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      id v13 = SRUIFSiriSessionStateGetDescription();
      *(_DWORD *)long long buf = 136315394;
      id v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);
    }
    if (self->_triggerUpdater)
    {
      id v14 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
        _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s Trigger released", buf, 0xCu);
      }
      (*((void (**)(void))self->_triggerUpdater + 2))();
      id triggerUpdater = self->_triggerUpdater;
      self->_id triggerUpdater = 0;
    }
  }
}

id __67__AFUISiriViewController__handleMicButtonLongPressEndedFromSource___block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = SASRequestSourceGetName();
  id v1 = (void *)v0;
  if (v0)
  {
    id v4 = @"requestSource";
    v5[0] = v0;
    double v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

- (void)_handleSiriDidActivateFromSource:(int64_t)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __59__AFUISiriViewController__handleSiriDidActivateFromSource___block_invoke;
  v5[3] = &unk_2646925E8;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __59__AFUISiriViewController__handleSiriDidActivateFromSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _remoteViewController];
  [v2 siriDidActivateFromSource:*(void *)(a1 + 40)];
}

- (void)handlePasscodeUnlockWithCompletion:(id)a3
{
}

- (void)handlePasscodeUnlockAndCancelRequest:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = [(AFUISiriViewController *)self _configuration];
  uint64_t v8 = [v7 siriViewMode];

  if (v8)
  {
    [(AFUISiriViewController *)self _handlePasscodeUnlockAndCancelRequest:v4 dismissOnFailure:0 passcodeUnlockClient:0 withCompletion:v6];
  }
  else
  {
    double v9 = [(AFUISiriViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      id v10[2] = __78__AFUISiriViewController_handlePasscodeUnlockAndCancelRequest_withCompletion___block_invoke;
      v10[3] = &unk_264692A28;
      objc_copyWeak(&v12, &location);
      BOOL v13 = v4;
      id v11 = v6;
      [v9 siriViewController:self requestsPresentation:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

uint64_t __78__AFUISiriViewController_handlePasscodeUnlockAndCancelRequest_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    [WeakRetained _handlePasscodeUnlockAndCancelRequest:*(unsigned __int8 *)(a1 + 48) dismissOnFailure:1 passcodeUnlockClient:0 withCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)handleAppUnlockForAppId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_initWeak(&location, self);
  double v9 = [(AFUISiriViewController *)self view];
  [v9 setUserInteractionEnabled:0];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke;
  v12[3] = &unk_264691EE0;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1112] = 1;
    uint64_t v5 = [WeakRetained _remoteViewController];
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_2;
    v7[3] = &unk_264692A78;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 40);
    [v5 showAppUnlockForAppId:v6 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained view];
    [v6 setUserInteractionEnabled:1];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_3;
    v7[3] = &unk_264692A50;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = a2;
    id v8 = v5;
    [v8 _enqueueRemoteViewControllerMessageBlock:v7];
  }
}

uint64_t __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[6]);
  }
  *(unsigned char *)(a1[4] + 1112) = 0;
  return result;
}

- (void)_handlePasscodeUnlockAndCancelRequest:(BOOL)a3 dismissOnFailure:(BOOL)a4 passcodeUnlockClient:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = objc_initWeak(&location, self);
  id v12 = [(AFUISiriViewController *)self view];
  [v12 setUserInteractionEnabled:0];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke;
  v14[3] = &unk_264692B10;
  objc_copyWeak(v16, &location);
  BOOL v17 = a3;
  v16[1] = (id)a5;
  id v13 = v10;
  BOOL v18 = a4;
  v14[4] = self;
  id v15 = v13;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1112] = 1;
    uint64_t v5 = [WeakRetained _remoteViewController];
    [v5 siriWillShowPasscodeUnlockAndCancelRequest:*(unsigned __int8 *)(a1 + 64)];

    LODWORD(v5) = *(void *)(a1 + 56) == 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v7 = v6;
    if (v5) {
      id v8 = @"ASSISTANT_UNLOCK_TITLE";
    }
    else {
      id v8 = @"VISUAL_INTELLIGENCE_UNLOCK_TITLE";
    }
    id v9 = [v6 assistantUILocalizedStringForKey:v8 table:@"Localizable"];

    id v10 = [v4 _siriView];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [v4 _siriView];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_2;
      v26[3] = &unk_2646920C8;
      id v27 = v4;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_3;
      id v22[3] = &unk_264692AE8;
      objc_copyWeak(&v24, v2);
      id v23 = *(id *)(a1 + 40);
      char v25 = *(unsigned char *)(a1 + 65);
      [v12 showPasscodeUnlockWithStatusText:v9 subtitle:0 completionHandler:v26 unlockCompletionHandler:v22];

      objc_destroyWeak(&v24);
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = (os_log_t *)MEMORY[0x263F28348];
      if (v13)
      {
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
        id v15 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v29 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:passcodeUnlockClient:wit"
                "hCompletion:]_block_invoke";
          _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s Cannot present unlock screen. Sending SiriUIUnlockResultFailure to completion handler.", buf, 0xCu);
        }
      }
      char v16 = [v4 view];
      [v16 setUserInteractionEnabled:1];

      os_log_t v17 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = *(void **)(a1 + 32);
        id v19 = v17;
        __int16 v20 = [v18 view];
        id v21 = [v20 debugDescription];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v29 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:passcodeUnlockClient:withC"
              "ompletion:]_block_invoke";
        __int16 v30 = 2112;
        __int16 v31 = v21;
        _os_log_impl(&dword_223099000, v19, OS_LOG_TYPE_DEFAULT, "%s  %@Current view cannot show passcode unlock flow.", buf, 0x16u);
      }
    }
  }
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setUserInteractionEnabled:1];
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_4;
    v9[3] = &unk_264692AA0;
    id v6 = WeakRetained;
    id v10 = v6;
    uint64_t v12 = a2;
    id v11 = *(id *)(a1 + 32);
    [v6 _enqueueRemoteViewControllerMessageBlock:v9];
    if (a2 && *(unsigned char *)(a1 + 48))
    {
      id v7 = [v6 delegate];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      id v8[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_6;
      id v8[3] = &__block_descriptor_40_e8_v12__0B8l;
      void v8[4] = a2;
      [v7 siriViewController:v6 requestsDismissalWithReason:54 withCompletion:v8];
    }
  }
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _remoteViewController];
  [v2 siriWillHidePasscodeUnlockForResult:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 48));
  }
  BOOL v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_5;
  v5[3] = &unk_264691A50;
  id v6 = v4;
  [v6 _enqueueRemoteViewControllerMessageBlock:v5];
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1112) = 0;
  id v1 = [*(id *)(a1 + 32) _remoteViewController];
  [v1 siriDidHidePasscodeUnlock];
}

void __117__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_passcodeUnlockClient_withCompletion___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:passcodeUnlockClient:withComple"
         "tion:]_block_invoke_6";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s Dismissed siri for unlock result: %lu dismissal result: %d", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)showPasscodeUnlockScreenForRequest:(id)a3 passcodeUnlockClient:(unint64_t)a4 unlockCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  self->_unlockScreenVisible = 1;
  int v10 = [v8 requiresUserInteraction];
  int v11 = *MEMORY[0x263F28348];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[AFUISiriViewController showPasscodeUnlockScreenForRequest:passcodeUnlockClient:unlockCompletion:]";
      _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s Passcode unlock screen for handoff authentication.", buf, 0xCu);
    }
    uint64_t v13 = [v8 handoffOriginDeviceName];
    id v14 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v15 = [v14 assistantUILocalizedStringForKey:@"ASSISTANT_REMOTE_AUTHENTICATION_TITLE" table:@"Localizable"];

    char v16 = NSString;
    os_log_t v17 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    BOOL v18 = [v17 assistantUILocalizedStringForKey:@"ASSISTANT_REMOTE_AUTHENTICATION_SUBTITLE" table:@"Localizable"];
    id v19 = [v16 stringWithValidatedFormat:v18, @"%@", 0, v13 validFormatSpecifiers error];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[AFUISiriViewController showPasscodeUnlockScreenForRequest:passcodeUnlockClient:unlockCompletion:]";
      _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s Passcode unlock screen for cold boot authentication.", buf, 0xCu);
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    if (a4) {
      [v13 assistantUILocalizedStringForKey:@"VISUAL_INTELLIGENCE_FIRST_UNLOCK_TITLE" table:@"Localizable"];
    }
    else {
    id v15 = [v13 assistantUILocalizedStringForKey:@"ASSISTANT_FIRST_UNLOCK_TITLE" table:@"Localizable"];
    }
    id v19 = 0;
  }

  __int16 v20 = [(AFUISiriViewController *)self _siriView];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __99__AFUISiriViewController_showPasscodeUnlockScreenForRequest_passcodeUnlockClient_unlockCompletion___block_invoke;
  id v22[3] = &unk_264692A78;
  objc_copyWeak(&v24, &location);
  id v21 = v9;
  id v23 = v21;
  [v20 showPasscodeUnlockWithStatusText:v15 subtitle:v19 completionHandler:0 unlockCompletionHandler:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

uint64_t __99__AFUISiriViewController_showPasscodeUnlockScreenForRequest_passcodeUnlockClient_unlockCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[1112] = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)defrost
{
}

- (void)preheat
{
  id v2 = [(AFUISiriViewController *)self _session];
  [v2 preheat];
}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  self->_currentRequestSource = a3;
  self->_siriSessionWantsToEnd = 0;
  if (a3 != 53)
  {
    uint64_t v5 = [(AFUISiriViewController *)self underlyingConnection];
    [v5 willPresentUI];
  }
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __53__AFUISiriViewController_siriWillActivateFromSource___block_invoke;
  v6[3] = &unk_2646925E8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v6];
  if ((unint64_t)a3 > 0x35 || ((1 << a3) & 0x30800000000000) == 0) {
    [(AFUISiriViewController *)self preloadPluginBundles];
  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __53__AFUISiriViewController_siriWillActivateFromSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 siriWillActivateFromSource:*(void *)(a1 + 40)];
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  self->_currentRequestSource = a3;
  if (!self->_active)
  {
    self->_active = 1;
    [(AFUISiriViewController *)self _setVoiceTriggerEnabled:1];
  }
  uint64_t v5 = [(AFUISiriViewController *)self _fullSiriView];

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self _fullSiriView];
    [v6 siriDidActivateFromSource:a3];
  }
  else
  {
    [(AFUISiriViewController *)self _handleSiriDidActivateFromSource:a3];
  }
}

- (void)siriWillBePresented:(int64_t)a3
{
  objc_initWeak(&location, self);
  if (self->_remoteViewController)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    void v5[2] = __46__AFUISiriViewController_siriWillBePresented___block_invoke;
    v5[3] = &unk_2646925E8;
    objc_copyWeak(v6, &location);
    v6[1] = (id)a3;
    [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
    objc_destroyWeak(v6);
  }
  objc_destroyWeak(&location);
}

void __46__AFUISiriViewController_siriWillBePresented___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 siriWillBePresented:*(void *)(a1 + 40)];
}

- (void)siriWasPresented:(int64_t)a3
{
  if (a3 == 53 && self->_tamaleViewWaitingForPresentation)
  {
    self->_tamaleViewWaitingForPresentation = 0;
    [(AFUISiriViewController *)self tamaleViewDidLoad];
  }
}

- (int64_t)currentSource
{
  return self->_currentRequestSource;
}

- (void)siriDidDeactivate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[AFUISiriViewController siriDidDeactivate]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  self->_active = 0;
  BOOL v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  double v6 = v5;
  [(AFUISiriViewController *)self _viewDidAppearTime];
  double v8 = v6 - v7;

  id v9 = objc_alloc(MEMORY[0x263F28550]);
  int v10 = [NSNumber numberWithDouble:v8];
  int v11 = (void *)[v9 initWithOriginalCommandId:0 category:0 duration:v10];

  BOOL v12 = [(AFUISiriViewController *)self _session];
  [v12 recordUIMetrics:v11];

  uint64_t v13 = [(AFUISiriViewController *)self underlyingConnection];
  [v13 didDismissUI];

  [(AFUISiriTapPanDismissalPolicyManager *)self->_tapPanDismissalPolicyManager invalidate];
  if (self->_immersiveExperienceOn)
  {
    [(AFUISiriViewController *)self resetGestureBehaviors];
    self->_immersiveExperienceOn = 0;
  }
  [(AFUISiriViewController *)self _setVoiceTriggerEnabled:0];
  [(AFUISiriViewController *)self endSession];
}

- (void)resetContextTypes:(int64_t)a3
{
  id v4 = [(AFUISiriViewController *)self _session];
  [v4 resetContextTypes:a3];
}

- (void)updateContexts:(int64_t)a3
{
  char v3 = a3;
  if ((a3 & 2) != 0)
  {
    double v5 = [(AFUISiriViewController *)self _session];
    [v5 setAlertContext];
  }
  if (v3)
  {
    id v6 = [(AFUISiriViewController *)self _session];
    [v6 setApplicationContext];
  }
}

- (void)setAlertContext
{
}

- (void)setDeviceInStarkMode:(BOOL)a3
{
  BOOL deviceIsInStarkMode = self->_deviceIsInStarkMode;
  if (deviceIsInStarkMode != a3)
  {
    self->_BOOL deviceIsInStarkMode = a3;
    [(AFUISiriViewController *)self _updateAudioRoutePicker];
    BOOL deviceIsInStarkMode = self->_deviceIsInStarkMode;
  }
  if (deviceIsInStarkMode)
  {
    id v5 = [(AFUISiriViewController *)self _session];
    [v5 setDeviceInStarkMode:self->_deviceIsInStarkMode];
  }
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  if (self->_supportsCarPlayVehicleData != a3)
  {
    BOOL v3 = a3;
    id v4 = [(AFUISiriViewController *)self _session];
    [v4 setSupportsCarPlayVehicleData:v3];
  }
}

- (void)setAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3
{
  if (self->_announcementRequestsPermittedWhilePresentationActive != a3)
  {
    BOOL v3 = a3;
    self->_announcementRequestsPermittedWhilePresentationActive = a3;
    id v4 = [(AFUISiriViewController *)self _session];
    [v4 setAnnouncementRequestsPermittedByPresentationWhileActive:v3];
  }
}

- (BOOL)_isLaunchListeningEnabled
{
  return 0;
}

- (void)_dismissWithReason:(int64_t)a3
{
  self->_dismissalReason = a3;
  id v5 = [(AFUISiriViewController *)self delegate];
  [v5 dismissSiriViewController:self withReason:a3];
}

- (void)deactivateScene
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__AFUISiriViewController_deactivateScene__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__AFUISiriViewController_deactivateScene__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 deactivateScene];
}

- (void)reactivateScene
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__AFUISiriViewController_reactivateScene__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__AFUISiriViewController_reactivateScene__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 reactivateScene];
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = NSStringFromBOOL();
    int v9 = 136315394;
    int v10 = "-[AFUISiriViewController setCarDNDActive:]";
    __int16 v11 = 2112;
    BOOL v12 = v7;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #carDnd setting carDNDActive to %@", (uint8_t *)&v9, 0x16u);
  }
  self->_carDNDActive = v3;
  double v8 = [(AFUISiriViewController *)self _session];
  [v8 setCarDNDActive:v3];
}

- (void)setSiriRequestCancellationReason:(int64_t)a3
{
  self->_requestCancellationReason = a3;
}

- (void)startRequestWithOptions:(id)a3
{
}

- (void)startRequestWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v7 = a3;
  CGRect v61 = (void (**)(id, void *))a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    CGAffineTransform v59 = [MEMORY[0x263F08690] currentHandler];
    CGAffineTransform v60 = [NSString stringWithUTF8String:"-[AFUISiriViewController startRequestWithOptions:completion:]"];
    [v59 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 2749, @"%@ can only be used on the main thread", v60 object file lineNumber description];
  }
  double v8 = [(AFUISiriViewController *)self _systemState];
  [v7 updateIfNeededWithSystemState:v8];

  int v9 = [(AFUISiriViewController *)self delegate];
  int v10 = v9;
  if (v9)
  {
    id v11 = [v9 siriViewController:self willStartRequestWithOptions:v7];
  }
  else
  {
    id v11 = v7;
  }
  BOOL v12 = v11;
  self->_recordingStartedOnRoute = 0;
  self->_dismissalReason = 0;
  [(AFUISiriViewController *)self _setPunchingOut:0];
  if (v12)
  {
    objc_initWeak(&location, self);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke;
    v64[3] = &unk_264691C90;
    objc_copyWeak(&v66, &location);
    id v13 = v12;
    id v65 = v13;
    [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v64];
    if ([v13 requestSource] == 23)
    {
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke_2;
      v62[3] = &unk_2646919D8;
      objc_copyWeak(&v63, &location);
      [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v62];
      objc_destroyWeak(&v63);
    }
    BOOL v14 = [(AFUISiriViewController *)self _deviceSupportsZLL];
    uint64_t v15 = [v13 inputType];
    unsigned int v16 = [v13 isInitialBringUp];
    if ([v13 predictedRecordRouteIsZLL])
    {
      os_log_t v17 = [(AFUISiriViewController *)self _fullSiriView];
      BOOL v18 = v17;
      if (v15 == 2) {
        uint64_t v19 = v16;
      }
      else {
        uint64_t v19 = 0;
      }
      [v17 setHelpButtonDeferred:v19];
    }
    else
    {
      BOOL v18 = [(AFUISiriViewController *)self _fullSiriView];
      [v18 setHelpButtonDeferred:0];
    }

    if ([MEMORY[0x263F286B8] isSAEEnabled]
      && [v13 isForStark]
      && [v13 isInitialBringUp])
    {
      uint64_t v22 = [(AFUISiriViewController *)self _carPlaySiriView];
      [v22 initializeEdgeLightForRequest:v13];

      [(AFUISiriCarPlayShockwaveViewController *)self->_carPlayShockwaveViewController initializeEdgeLightForRequest:v13];
    }
    uint64_t v23 = [v13 requestSource];
    unint64_t v24 = [v13 requestSource];
    int v25 = 0;
    if (v24 <= 0x2C && ((1 << v24) & 0x100010000107) != 0) {
      int v25 = [v13 predictedRecordRouteIsZLL];
    }
    BOOL v26 = v15 == 2 && v14;
    int v27 = v26 & v16;
    if (v23 == 8) {
      int v28 = 1;
    }
    else {
      int v28 = v25;
    }
    char v29 = v27 & v28;
    if ((v27 & v28) == 1)
    {
      uint64_t v30 = mach_absolute_time();
      __int16 v31 = [(AFUISiriViewController *)self _siriView];
      [v31 setSiriSessionState:1];

      uint64_t v32 = [(AFUISiriViewController *)self _session];
      [v32 launchedIntoListeningAtTime:(double)v30];

      uint64_t v33 = NSNumber;
      double v34 = [MEMORY[0x263F08AB0] processInfo];
      [v34 systemUptime];
      objc_msgSend(v33, "numberWithDouble:");
      v35 = (AFUISiriViewController *)objc_claimAutoreleasedReturnValue();

      id v36 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        v69 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
        __int16 v70 = 2112;
        v71 = v35;
        _os_log_impl(&dword_223099000, v36, OS_LOG_TYPE_DEFAULT, "%s Launched into listening mode. Setting recording start time to: %@", buf, 0x16u);
      }
      [(AFUISiriViewController *)self _setRecordingStartedTimeValue:v35];
    }
    double v37 = [(AFUISiriViewController *)self _session];
    [v37 startRequestWithOptions:v13 completion:v61];

    [(AFUISiriViewController *)self _setCurrentRequestOptions:v13];
    [v7 timestamp];
    AFMachAbsoluteTimeAddTimeInterval();
    int64_t currentRequestSource = self->_currentRequestSource;
    int v39 = 1;
    if (currentRequestSource != 8 && currentRequestSource != 44) {
      int v39 = [v7 isVoiceTriggerRequest];
    }
    unint64_t v40 = [v7 requestSource];
    if (v39)
    {
      v41 = [v7 speechRequestOptions];
      SRUIFInstrumentVoiceLaunchSignpost();
    }
    else if (v40 <= 0x34)
    {
      if (((1 << v40) & 0x400006) != 0)
      {
        SRUIFInstrumentButtonLaunchSignpost();
      }
      else if (((1 << v40) & 0x10800000000000) != 0)
      {
        SRUIFInstrumentQuickTypeGestureLaunchSignpost();
      }
    }
    if ((v29 & 1) == 0)
    {
      v42 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v69 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
        _os_log_impl(&dword_223099000, v42, OS_LOG_TYPE_DEFAULT, "%s Not launching into listening mode. Setting recording start time back to nil.", buf, 0xCu);
      }
      [(AFUISiriViewController *)self _setRecordingStartedTimeValue:0];
      if (v15 == 2) {
        unsigned int v43 = v16;
      }
      else {
        unsigned int v43 = 0;
      }
      if (v43 == 1 && ![(AFUISiriViewController *)self isEyesFree])
      {
        id v44 = [(AFUISiriViewController *)self _fullSiriView];
        [v44 setFlamesViewPaused:1];
      }
    }
    if ([v13 isInitialBringUp])
    {
      v45 = [(AFUISiriViewController *)self _session];
      [v13 timestamp];
      objc_msgSend(v45, "recordRequestMetricEvent:withTimestamp:", *MEMORY[0x263F28320]);
    }
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v20 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      v69 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
      __int16 v70 = 2112;
      v71 = self;
      _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, "%s %@ not starting request because delegate returned nil requestOptions", buf, 0x16u);
    }
    if (v61)
    {
      id v21 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"No UI request options." underlyingError:0];
      v61[2](v61, v21);
    }
  }
  if (![v7 isInitialBringUp] || objc_msgSend(v7, "isForUIFree")) {
    [(AFUISiriViewController *)self _presentRemoteViewController];
  }
  if ([v7 requestSource] == 53 && !self->_isPresentingVisualIntelligenceCamera)
  {
    uint64_t v46 = [(AFUISiriViewController *)self delegate];
    id v47 = [v46 requestCachedSceneHostedView];
    tamaleView = self->_tamaleView;
    self->_tamaleView = v47;

    [(SiriSharedUITamaleView *)self->_tamaleView setDelegate:self];
    if (self->_tamaleView)
    {
      self->_tamaleViewWaitingForPresentation = 1;
    }
    else
    {
      CGAffineTransform v49 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v69 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
        _os_log_impl(&dword_223099000, v49, OS_LOG_TYPE_DEFAULT, "%s #vi - Creating Visual Intelligence Camera View", buf, 0xCu);
      }
      objc_super v50 = (SiriSharedUITamaleView *)[objc_alloc(MEMORY[0x263F74498]) initWithDelegate:self];
      id v51 = self->_tamaleView;
      self->_tamaleView = v50;

      v52 = [(AFUISiriViewController *)self delegate];
      [v52 siriViewController:self cacheSceneHostedView:self->_tamaleView];
    }
    CGAffineTransform v53 = [(AFUISiriViewController *)self delegate];
    uint64_t v54 = [(SiriSharedUITamaleView *)self->_tamaleView sceneIdentifier];
    id v55 = [(SiriSharedUITamaleView *)self->_tamaleView bundleIdentifier];
    [v53 siriViewController:self willStartHostingSceneWithIdentifier:v54 bundleIdentifier:v55];

    id v56 = [(AFUISiriViewController *)self _compactSiriView];
    [v56 setTamaleView:self->_tamaleView];

    v57 = [(AFUISiriViewController *)self _session];
    CGAffineTransform v58 = [(AFUISiriViewController *)self _visualIntelligenceCameraDelegate];
    [v57 setVisualIntelligenceCameraDelegate:v58];

    [(AFUISiriViewController *)self setIsSceneHostingVisualIntelligence:1];
  }
  if ([v7 isForUIFree] && objc_msgSend(v7, "isInitialBringUp")) {
    [(AFUISiriViewController *)self _recordUIAppearance];
  }
}

void __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 setRequestOptions:*(void *)(a1 + 32)];
}

void __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 siriWillActivateFromSource:23];
}

- (id)_visualIntelligenceCameraDelegate
{
  return self->_tamaleView;
}

- (void)stopRequestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriViewController *)self _session];
  [v5 stopRequestWithOptions:v4];
}

- (void)didReceiveButtonUpWithRequestOptions:(id)a3
{
  id v7 = a3;
  id v4 = [(AFUISiriViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewController:self didReceiveButtonUpWithRequestOptions:v7];
  }
}

- (void)updateRequestOptions:(id)a3
{
  id v5 = a3;
  id v4 = [(AFUISiriViewController *)self _session];
  [v4 updateRequestOptions:v5];

  [(AFUISiriViewController *)self _setCurrentRequestOptions:v5];
}

- (SASRequestOptions)currentRequestOptions
{
  return self->_currentRequestOptions;
}

- (void)_setCurrentRequestOptions:(id)a3
{
  p_currentRequestOptions = &self->_currentRequestOptions;
  id v5 = a3;
  if (([v5 isEqual:*p_currentRequestOptions] & 1) == 0) {
    objc_storeStrong((id *)p_currentRequestOptions, a3);
  }
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __66__AFUISiriViewController_preloadPresentationBundleWithIdentifier___block_invoke;
  v6[3] = &unk_264691C90;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__AFUISiriViewController_preloadPresentationBundleWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 preloadPresentationBundleWithIdentifier:*(void *)(a1 + 32)];
}

- (void)preloadPluginBundles
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__AFUISiriViewController_preloadPluginBundles__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__AFUISiriViewController_preloadPluginBundles__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 preloadPluginBundles];
}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  id v8 = a3;
  int v9 = (void *)[a4 mutableCopy];
  int v10 = NSNumber;
  id v11 = [(AFUISiriViewController *)self _configuration];
  BOOL v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "showsSensitiveUI"));
  [v9 setObject:v12 forKey:@"AFUIPresentationPropertiesShowsSensitiveUIKey"];

  id v13 = v9;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __78__AFUISiriViewController_showPresentationWithIdentifier_properties_lockState___block_invoke;
  v16[3] = &unk_264692B38;
  objc_copyWeak(v20, &location);
  id v14 = v8;
  id v17 = v14;
  id v15 = v13;
  v20[1] = (id)a5;
  id v18 = v15;
  uint64_t v19 = self;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v16];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __78__AFUISiriViewController_showPresentationWithIdentifier_properties_lockState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained _remoteViewController];
    [v3 showPresentationWithIdentifier:*(void *)(a1 + 32) properties:*(void *)(a1 + 40) lockState:*(void *)(a1 + 64)];

    [*(id *)(a1 + 48) _updateRemoteViewControllerStateForAppearance];
    id WeakRetained = v4;
  }
}

- (void)_updateRemoteViewControllerStateForAppearance
{
  BOOL v3 = [(AFUISceneHostingViewController *)self->_remoteViewController configuration];
  id v4 = (id)[v3 copy];

  if (([v4 foreground] & 1) == 0)
  {
    [v4 setForeground:1];
    [(AFUISceneHostingViewController *)self->_remoteViewController updateSceneWithConfiguration:v4];
  }
}

- (void)setLockState:(unint64_t)a3
{
  id v4 = [(AFUISiriViewController *)self _session];
  [v4 setLockState:a3];
}

- (void)handleViewFullyRevealed
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[AFUISiriViewController handleViewFullyRevealed]"];
    [v4 handleFailureInMethod:a2, self, @"AFUISiriViewController.m", 3003, @"%@ can only be used on the main thread", v5 object file lineNumber description];
  }
  id v6 = [(AFUISiriViewController *)self _fullSiriView];
  [v6 setBackdropVisible:1];
}

- (void)shortTapActionWithRequestOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __59__AFUISiriViewController_shortTapActionWithRequestOptions___block_invoke;
  v6[3] = &unk_264691C90;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__AFUISiriViewController_shortTapActionWithRequestOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 didReceiveShortTapActionWithRequestOptions:*(void *)(a1 + 32)];
}

- (id)viewServiceApplicationInfo
{
  return [(AFUISiriRemoteSceneViewController *)self->_remoteViewController viewServiceApplicationInfo];
}

- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __92__AFUISiriViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke;
  v7[3] = &unk_2646929B8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  id v8[2] = (id)a4;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __92__AFUISiriViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 presentationStateUpdatedFromPresentationState:*(void *)(a1 + 40) toPresentationState:*(void *)(a1 + 48)];
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AFUISiriViewController *)self _compactSiriView];
  if (v3)
  {

LABEL_3:
    BOOL eyesFree = self->_eyesFree;
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"YES";
      if (!eyesFree) {
        id v6 = @"NO";
      }
      int v9 = 136315394;
      int v10 = "-[AFUISiriViewController supportedInterfaceOrientations]";
      __int16 v11 = 2112;
      BOOL v12 = v6;
      _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Forcing portrait mode for Siri EyesFree: %@", (uint8_t *)&v9, 0x16u);
    }
    if (eyesFree) {
      return 2;
    }
    else {
      return 30;
    }
  }
  if (SiriUIDeviceIsZoomed() & 1) == 0 && (SiriUIIsAllOrientationsSupported()) {
    goto LABEL_3;
  }
  if (!self->_remoteViewControllerIsPresenting) {
    return 2;
  }
  remoteViewController = self->_remoteViewController;

  return [(AFUISiriRemoteSceneViewController *)remoteViewController supportedInterfaceOrientations];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AFUISiriViewController;
  [(AFUISiriViewController *)&v6 viewWillLayoutSubviews];
  BOOL v3 = [(AFUISiriViewController *)self _statusBar];
  [(AFUISiriViewController *)self _statusBarFrame];
  objc_msgSend(v3, "setFrame:");

  id v4 = [MEMORY[0x263F82670] currentDevice];
  if (![v4 userInterfaceIdiom])
  {
    int v5 = [MEMORY[0x263F286B8] isSAEEnabled];

    if (!v5) {
      return;
    }
    id v4 = [(AFUISiriViewController *)self _compactSiriView];
    objc_msgSend(v4, "setCurrentInterfaceOrientation:", -[AFUISiriViewController interfaceOrientation](self, "interfaceOrientation"));
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(AFUISiriViewController *)self _compactSiriView];
  int v9 = [v8 isBlurViewVisible];

  if (v9 && (SiriUIDeviceIsPad() & 1) == 0) {
    [(AFUISiriViewController *)self requestStatusBarVisible:width < height];
  }
  if (width < height) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 4;
  }
  __int16 v11 = [(AFUISiriViewController *)self _remoteViewController];
  [v11 orientationWillChangeTo:v10];

  BOOL v12 = [(AFUISiriViewController *)self _fullSiriView];
  [v12 setFlamesViewPaused:1];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_264692B60;
  v15[4] = self;
  *(double *)&v15[5] = width;
  *(double *)&v15[6] = height;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v14[3] = &unk_264692B88;
  v14[4] = self;
  [v7 animateAlongsideTransition:v15 completion:v14];
  v13.receiver = self;
  v13.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _fullSiriView];
  [v1 setFlamesViewPaused:0];
}

- (void)_holdToTalkTriggerDidReleaseFromSource:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  objc_super v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = [(AFUISiriViewController *)self _isInHoldToTalkMode];
    int v9 = [(AFUISiriViewController *)self _currentRequestOptions];
    int v26 = 136315906;
    int v27 = "-[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:]";
    __int16 v28 = 1024;
    *(_DWORD *)char v29 = v8;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v9;
    *(_WORD *)&v29[14] = 2048;
    *(void *)&v29[16] = a3;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s In HTTMode %d, Current options %@, source %ld", (uint8_t *)&v26, 0x26u);
  }
  uint64_t v10 = [(AFUISiriViewController *)self _currentRequestOptions];
  uint64_t v11 = [v10 requestSource];

  if ([(AFUISiriViewController *)self _isInHoldToTalkMode]
    && (v11 == a3 || (v11 & 0xFFFFFFFFFFFFFFFELL) == 6))
  {
    BOOL v12 = [(AFUISiriViewController *)self _canIgnoreHoldToTalkThreshold];
    BOOL v13 = [(AFUISiriViewController *)self _holdToTalkThresholdHasElapsed];
    BOOL v14 = v13;
    if (v12 || v13)
    {
      os_log_t v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = NSNumber;
        id v17 = v15;
        id v18 = [v16 numberWithBool:v12];
        uint64_t v19 = [NSNumber numberWithBool:v14];
        __int16 v20 = objc_msgSend(NSNumber, "numberWithBool:", -[AFUISiriViewController _isInitialSpeechRequest](self, "_isInitialSpeechRequest"));
        int v26 = 136315906;
        int v27 = "-[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:]";
        __int16 v28 = 2112;
        *(void *)char v29 = v18;
        *(_WORD *)&v29[8] = 2112;
        *(void *)&v29[10] = v19;
        *(_WORD *)&v29[18] = 2112;
        *(void *)&v29[20] = v20;
        _os_log_impl(&dword_223099000, v17, OS_LOG_TYPE_DEFAULT, "%s Stopping recording on hold to talk request canIgnoreHoldToTalkThreshold %@, holdToTalkThresholdElapsed %@, isInitialSpeechRequest %@", (uint8_t *)&v26, 0x2Au);
      }
      id v21 = objc_alloc(MEMORY[0x263F6C730]);
      uint64_t v22 = [(AFUISiriViewController *)self _uiPresentationIdentifier];
      uint64_t v23 = (void *)[v21 initWithRequestSource:v11 uiPresentationIdentifier:v22];

      unint64_t v24 = [(AFUISiriViewController *)self _currentRequestOptions];
      int v25 = [v24 homeButtonUpFromBeep];
      [v23 setHomeButtonUpFromBeep:v25];

      objc_msgSend(v23, "setInitialBringUp:", -[SASRequestOptions isInitialBringUp](self->_currentRequestOptions, "isInitialBringUp"));
      [(AFUISiriViewController *)self _delayForHoldToTalkStopRequestsWithSource:a3];
      -[AFUISiriViewController _stopRequestWithOptions:afterDelay:](self, "_stopRequestWithOptions:afterDelay:", v23);
    }
    else
    {
      [(AFUISiriViewController *)self _transitionToAutomaticEndpointMode];
    }
  }
}

- (void)tvRemoteSentButtonDownWhileListening
{
  if ([(SASRequestOptions *)self->_currentRequestOptions isATVRemotePTTEligible]
    && [(AFUISiriViewController *)self isListening]
    && ![(AFUISiriViewController *)self _isInHoldToTalkMode])
  {
    [(AFUISiriViewController *)self _transitionToManualEndpointMode];
  }
}

- (double)_delayForHoldToTalkStopRequestsWithSource:(int64_t)a3
{
  double result = 0.25;
  if ((unint64_t)a3 <= 0x1F && ((1 << a3) & 0xE0400000) != 0)
  {
    AFPreferencesATVStopRecordingDelay();
    double result = fmin(v4, 0.25);
    if (result < 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (id)_uiPresentationIdentifier
{
  int v3 = [MEMORY[0x263F286B8] isSAEEnabled];
  if (self->_deviceIsInStarkMode) {
    return @"com.apple.siri.CarDisplay";
  }
  int v5 = @"com.apple.siri.Compact";
  if (v3) {
    int v5 = @"com.apple.siri.SystemAssistantExperience";
  }
  if (self->_eyesFree) {
    return @"com.apple.siri.EyesFree";
  }
  else {
    return v5;
  }
}

- (BOOL)_canIgnoreHoldToTalkThreshold
{
  id v2 = self;
  int v3 = [(AFUISiriViewController *)self _currentRequestOptions];
  uint64_t v4 = [v3 requestSource];

  LOBYTE(v6) = v4 == 22 || v4 == 31;
  if ([MEMORY[0x263F28510] isTVPushToTalkEnabled])
  {
    if (v4 == 31 || v4 == 22)
    {
      id v2 = [v2 _currentRequestOptions];
      int v6 = [v2 isATVRemotePTTEligible] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    if (v4 == 31 || v4 == 22) {
  }
    }
  return v6;
}

- (BOOL)_isInitialSpeechRequest
{
  int v3 = [(AFUISiriViewController *)self _currentRequestOptions];
  if ([v3 isInitialBringUp])
  {
    uint64_t v4 = [(AFUISiriViewController *)self _currentRequestOptions];
    BOOL v5 = [v4 inputType] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_holdToTalkThresholdHasElapsed
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v3 = [(AFUISiriViewController *)self _recordingStartedTimeValue];
  if (!v3)
  {
    uint64_t v19 = *MEMORY[0x263F28348];
    BOOL v18 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v22 = 136315138;
    uint64_t v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    __int16 v20 = "%s Recording start time was not set";
LABEL_14:
    _os_log_impl(&dword_223099000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
    BOOL v18 = 0;
    goto LABEL_15;
  }
  if (!self->_recordingStartedOnRoute)
  {
    uint64_t v19 = *MEMORY[0x263F28348];
    BOOL v18 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v22 = 136315138;
    uint64_t v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    __int16 v20 = "%s Recording has not started on the audio route";
    goto LABEL_14;
  }
  uint64_t v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  double v6 = v5;

  [v3 doubleValue];
  double v8 = v7;
  int v9 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    __int16 v24 = 2048;
    double v25 = v6;
    _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s Button up time: %f", (uint8_t *)&v22, 0x16u);
  }
  double v11 = v6 - v8;
  BOOL v12 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    __int16 v24 = 2048;
    double v25 = v11;
    _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s Start recording to button up time: %f", (uint8_t *)&v22, 0x16u);
  }
  BOOL v13 = [(AFUISiriViewController *)self _currentRequestOptions];
  BOOL v14 = [NSNumber numberWithDouble:v11];
  [v13 setHomeButtonUpFromBeep:v14];

  [(AFUISiriViewController *)self _manualEndpointingThreshold];
  double v16 = v15;
  id v17 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    __int16 v24 = 2048;
    double v25 = v16;
    _os_log_impl(&dword_223099000, v17, OS_LOG_TYPE_DEFAULT, "%s Manual endpointing threshold: %f", (uint8_t *)&v22, 0x16u);
  }
  BOOL v18 = v11 > v16;
LABEL_15:

  return v18;
}

- (void)_enterHoldToTalkMode
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[AFUISiriViewController _enterHoldToTalkMode]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s Entering HTT mode", (uint8_t *)&v5, 0xCu);
  }
  [(AFUISiriViewController *)self _setInHoldToTalkMode:1];
  if (([(id)*MEMORY[0x263F83300] isPPTAvailable] & 1) == 0)
  {
    uint64_t v4 = [(AFUISiriViewController *)self _fullSiriView];
    [v4 configureReportBugButtonToShowHoldToTalkState:1];
  }
}

- (void)_transitionToAutomaticEndpointMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[AFUISiriViewController _transitionToAutomaticEndpointMode]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s Transitioning to Automatic Endpointing", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [(AFUISiriViewController *)self _currentRequestOptions];
  int v5 = (void *)[v4 copy];

  [v5 setUseAutomaticEndpointing:1];
  [(AFUISiriViewController *)self updateRequestOptions:v5];
  [(AFUISiriViewController *)self _exitHoldToTalkMode];
}

- (void)_transitionToManualEndpointMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[AFUISiriViewController _transitionToManualEndpointMode]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s Transitioning to HTT mode", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [(AFUISiriViewController *)self _currentRequestOptions];
  int v5 = (void *)[v4 copy];

  [v5 setUseAutomaticEndpointing:0];
  [(AFUISiriViewController *)self updateRequestOptions:v5];
  [(AFUISiriViewController *)self _enterHoldToTalkMode];
}

- (void)_exitHoldToTalkMode
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[AFUISiriViewController _exitHoldToTalkMode]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s Exiting HTT mode", (uint8_t *)&v5, 0xCu);
  }
  [(AFUISiriViewController *)self _setInHoldToTalkMode:0];
  if (([(id)*MEMORY[0x263F83300] isPPTAvailable] & 1) == 0)
  {
    uint64_t v4 = [(AFUISiriViewController *)self _fullSiriView];
    [v4 configureReportBugButtonToShowHoldToTalkState:0];
  }
}

- (double)_manualEndpointingThreshold
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  int v3 = [v2 manualEndpointingThreshold];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (void)_activationTriggerDidRelease:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[AFUISiriViewController _activationTriggerDidRelease:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s Trigger target did release", (uint8_t *)&v7, 0xCu);
  }
  [v4 removeTriggerTarget:self];
  int v6 = [v4 options];
  -[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:](self, "_holdToTalkTriggerDidReleaseFromSource:", [v6 requestSource]);
}

- (void)startRequestWithActivationTrigger:(id)a3
{
}

- (void)startRequestWithActivationTrigger:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSNumber;
    double v11 = v9;
    BOOL v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v6, "state"));
    int v20 = 136315394;
    id v21 = "-[AFUISiriViewController startRequestWithActivationTrigger:completion:]";
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting request with trigger %@", (uint8_t *)&v20, 0x16u);
  }
  BOOL v13 = [v6 options];
  [(AFUISiriViewController *)self startRequestWithOptions:v13 completion:v7];

  if ([v6 state] == 1)
  {
    BOOL v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      id v21 = "-[AFUISiriViewController startRequestWithActivationTrigger:completion:]";
      _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s Adding trigger target", (uint8_t *)&v20, 0xCu);
    }
    [v6 addTriggerTarget:self action:sel__activationTriggerDidRelease_];
    uint64_t v15 = [(AFUISiriViewController *)self inputAccessoryView];
    if (v15
      && (double v16 = (void *)v15,
          [(AFUISiriViewController *)self inputAccessoryView],
          id v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 isHidden],
          v17,
          v16,
          !v18))
    {
      uint64_t v19 = [(AFUISiriViewController *)self inputAccessoryView];
      [v19 becomeFirstResponder];
    }
    else
    {
      [(AFUISiriViewController *)self _enterHoldToTalkMode];
    }
  }
}

- (void)_stopRequestWithOptions:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  double v7 = fmin(a4, 0.25);
  double v8 = v7 * 1000000000.0;
  BOOL v9 = v7 < 0.0;
  double v10 = 0.0;
  if (!v9) {
    double v10 = v8;
  }
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)v10);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__AFUISiriViewController__stopRequestWithOptions_afterDelay___block_invoke;
  v13[3] = &unk_264692738;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  dispatch_after(v11, MEMORY[0x263EF83A0], v13);
}

uint64_t __61__AFUISiriViewController__stopRequestWithOptions_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopRequestWithOptions:*(void *)(a1 + 40)];
}

- (BOOL)isPreventingActivationGesture
{
  id v2 = [(AFUISiriViewController *)self _session];
  char v3 = [v2 isPreventingActivationGesture];

  return v3;
}

- (BOOL)isListening
{
  id v2 = [(AFUISiriViewController *)self _session];
  char v3 = [v2 isListening];

  return v3;
}

- (void)endSession
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AFUISiriViewController *)self delegate];
  if (!v3
    || (id v4 = (void *)v3,
        [(AFUISiriViewController *)self delegate],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 siriViewControllerShouldEndSession:self],
        v5,
        v4,
        v6))
  {
    int64_t requestCancellationReason = self->_requestCancellationReason;
    self->_int64_t requestCancellationReason = 0;
    if (requestCancellationReason)
    {
      double v8 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = v8;
        double v10 = AFRequestCancellationReasonGetName();
        int v12 = 136315394;
        BOOL v13 = "-[AFUISiriViewController endSession]";
        __int16 v14 = 2112;
        uint64_t v15 = v10;
        _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: endForReason %@", (uint8_t *)&v12, 0x16u);
      }
    }
    dispatch_time_t v11 = [(AFUISiriViewController *)self _session];
    [v11 endForReason:requestCancellationReason];
  }
}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __56__AFUISiriViewController_setWaitingForTelephonyToStart___block_invoke;
  v5[3] = &unk_264691B40;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__AFUISiriViewController_setWaitingForTelephonyToStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewController];
  [v2 setWaitingForTelephonyToStart:*(unsigned __int8 *)(a1 + 40)];
}

- (void)telephonyRequestCompleted
{
  id v2 = [(AFUISiriViewController *)self _session];
  [v2 telephonyRequestCompleted];
}

- (void)_suspendRemoteViewControllerDispatchQueue
{
  if (!self->_remoteViewControllerDispatchQueueSuspended)
  {
    dispatch_suspend((dispatch_object_t)self->_remoteViewControllerDispatchQueue);
    self->_remoteViewControllerDispatchQueueSuspended = 1;
  }
}

- (void)_resumeRemoteViewControllerDispatchQueue
{
  if (self->_remoteViewControllerDispatchQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_remoteViewControllerDispatchQueue);
    self->_remoteViewControllerDispatchQueueSuspended = 0;
  }
}

- (float)audioRecordingPowerLevelForSiriView:(id)a3
{
  uint64_t v3 = [(AFUISiriViewController *)self _session];
  [v3 recordingPowerLevel];
  float v5 = v4;

  return v5;
}

- (void)siriViewDidRecieveStatusViewTappedAction:(id)a3
{
}

- (void)siriViewDidRecieveStatusViewHoldDidBeginAction:(id)a3
{
}

- (void)siriViewDidRecieveStatusViewHoldDidEndAction:(id)a3
{
}

- (void)_handleReportBugAction
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__AFUISiriViewController__handleReportBugAction__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__AFUISiriViewController__handleReportBugAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 didReceiveReportBugAction];
}

- (void)_handleReportBugLongPressAction
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AFUISiriViewController__handleReportBugLongPressAction__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__AFUISiriViewController__handleReportBugLongPressAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 didReceiveBugButtonLongPress];
}

- (void)_handleHelpAction
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__AFUISiriViewController__handleHelpAction__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__AFUISiriViewController__handleHelpAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _remoteViewController];
  [v1 didReceiveHelpAction];
}

- (BOOL)siriView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  id v5 = a4;
  id v6 = [(AFUISiriViewController *)self delegate];
  LOBYTE(self) = [v6 siriViewController:self attemptUnlockWithPassword:v5];

  return (char)self;
}

- (void)siriView:(id)a3 didReceiveSiriActivationMessageWithSource:(int64_t)a4
{
}

- (BOOL)requestSessionAttendingState
{
  return [(AFUISiriSession *)self->_session attendingState];
}

- (void)playCarPlayShockwave
{
}

- (id)assistantVersionForSiriView:(id)a3
{
  uint64_t v3 = [(AFUISiriSession *)self->_session siriSessionInfo];
  id v4 = [v3 assistantVersion];

  return v4;
}

- (id)activeAccountForSiriView:(id)a3
{
  uint64_t v3 = [(AFUISiriSession *)self->_session siriSessionInfo];
  id v4 = [v3 activeAccount];

  return v4;
}

- (int64_t)userAccountCountForSiriView:(id)a3
{
  uint64_t v3 = [(AFUISiriSession *)self->_session siriSessionInfo];
  id v4 = [v3 userAccountCount];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)_setShowAudioRoutePicker:(BOOL)a3
{
  if (a3) {
    char v4 = ![(AFUISiriViewController *)self isDeviceInStarkMode];
  }
  else {
    char v4 = 0;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __51__AFUISiriViewController__setShowAudioRoutePicker___block_invoke;
  v5[3] = &unk_2646919B0;
  void v5[4] = self;
  char v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __51__AFUISiriViewController__setShowAudioRoutePicker___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fullSiriView];
  [v2 setShowAudioRoutePicker:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setAudioRoutePickerBluetoothOn:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__AFUISiriViewController__setAudioRoutePickerBluetoothOn___block_invoke;
  v3[3] = &unk_2646919B0;
  void v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __58__AFUISiriViewController__setAudioRoutePickerBluetoothOn___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fullSiriView];
  [v2 setAudioRoutePickerBluetoothOn:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didDetectAudioRoutePickerTap
{
  uint64_t v3 = [(AFUISiriViewController *)self _session];
  [v3 cancelSpeechRequest];

  id v4 = [(AFUISiriViewController *)self _routePickerController];
  [v4 showPickerFromViewController:self animated:1];
}

- (id)_routePickerController
{
  routePickerController = self->_routePickerController;
  if (!routePickerController)
  {
    id v4 = objc_alloc(MEMORY[0x263F75388]);
    int64_t v5 = (SiriUIAudioRoutePickerController *)[v4 initWithCategory:*MEMORY[0x263F28778] mode:@"SpeechRecognition" delegate:self];
    char v6 = self->_routePickerController;
    self->_routePickerController = v5;

    routePickerController = self->_routePickerController;
  }

  return routePickerController;
}

- (BOOL)siriViewShouldSupportTextInput:(id)a3
{
  return 0;
}

- (void)_updateAudioRoutePicker
{
  id v3 = [(AFUISiriViewController *)self _routePickerController];
  [v3 refreshRoutes];
  -[AFUISiriViewController _setShowAudioRoutePicker:](self, "_setShowAudioRoutePicker:", [v3 hasRoutesToPick]);
  -[AFUISiriViewController _setAudioRoutePickerBluetoothOn:](self, "_setAudioRoutePickerBluetoothOn:", [v3 bluetoothIsPicked]);
}

- (void)routePickerController:(id)a3 hasRoutesToPick:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AFUISiriViewController *)self _setShowAudioRoutePicker:v4];
  if (v4) {
    -[AFUISiriViewController _setAudioRoutePickerBluetoothOn:](self, "_setAudioRoutePickerBluetoothOn:", [v6 bluetoothIsPicked]);
  }
}

- (void)routePickerControllerPickedNewRoute:(id)a3 isBluetooth:(BOOL)a4
{
}

- (void)routePickerControllerWillShow:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _session];
  [v3 audioRoutePickerWillShow];
}

- (void)routePickerControllerWillDismiss:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _session];
  [v3 audioRoutePickerWillDismiss];
}

- (int64_t)getDeviceOrientation:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v4 = [v3 orientation];

  if ((unint64_t)(v4 - 1) > 5) {
    return 0;
  }
  else {
    return qword_2230F5D88[v4 - 1];
  }
}

- (BOOL)getUIViewModeIsUIFreeForCurrentRequest
{
  return [(AFUISiriViewController *)self viewMode] == 0;
}

- (BOOL)recentButtonPressActivityDetected:(id)a3
{
  uint64_t v4 = [(AFUISiriViewController *)self dataSource];
  int64_t v5 = [v4 getDeviceEngagementEvents:self forDeviceEngagementTimeWindow:10.0];

  LOBYTE(v4) = [v5 containsObject:&unk_26D62A8C0];
  return (char)v4;
}

- (BOOL)isAmbientPresented:(id)a3
{
  id v3 = [(AFUISiriViewController *)self delegate];
  char v4 = [v3 isAmbientPresented];

  return v4;
}

- (BOOL)recentTouchScreenActivityDetected:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  int64_t v5 = [v4 getDeviceEngagementEvents:self forDeviceEngagementTimeWindow:10.0];

  LOBYTE(v4) = [v5 containsObject:&unk_26D62A8D8];
  return (char)v4;
}

- (id)bulletinsForSiriSession:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  int64_t v5 = [v4 bulletinsForSiriViewController:self];

  return v5;
}

- (id)contextAppInfosForSiriSession:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  int64_t v5 = [v4 contextAppInfosForSiriViewController:self];

  return v5;
}

- (id)currentCarPlaySupportedOEMAppIDListForSiriSession:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self dataSource];
    BOOL v7 = [v6 currentCarPlaySupportedOEMAppsForSiriViewController:self];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)starkAppBundleIdentifierContextForSiriSession:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self dataSource];
    BOOL v7 = [v6 starkAppBundleIdentifierContextForSiriViewController:self];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isPPTAvailable
{
  return [(id)*MEMORY[0x263F83300] isPPTAvailable];
}

- (unint64_t)lockStateForSiriSession:(id)a3
{
  char v4 = [(AFUISiriViewController *)self dataSource];
  unint64_t v5 = [v4 lockStateForSiriViewController:self];

  return v5;
}

- (int64_t)carPlayEnhancedVoiceTriggerModeForSiriSession:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F6C740], "sharedSystemState", a3);
  int64_t v4 = [v3 carPlayEnhancedVoiceTriggerMode];

  return v4;
}

- (void)siriSession:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[AFUISiriViewController siriSession:willProcessAppLaunchWithBundleIdentifier:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v8, 0xCu);
  }
  self->_isProcessingAppLaunch = 1;
  BOOL v7 = [(AFUISiriViewController *)self delegate];
  [v7 siriViewController:self willProcessAppLaunchWithBundleIdentifier:v5];
}

- (void)siriSession:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[AFUISiriViewController siriSession:failedToLaunchAppWithBundleIdentifier:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v8, 0xCu);
  }
  self->_isProcessingAppLaunch = 0;
  BOOL v7 = [(AFUISiriViewController *)self delegate];
  [v7 siriViewController:self failedToLaunchAppWithBundleIdentifier:v5];
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3
{
  id v5 = [(AFUISiriViewController *)self _compactSiriView];
  *(float *)&double v6 = a3;
  [v5 setInputPowerLevel:v6];

  id v8 = [(AFUISiriViewController *)self _carPlaySiriView];
  *(float *)&double v7 = a3;
  [v8 setInputPowerLevel:v7];
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4
{
  double v6 = [(AFUISiriViewController *)self _compactSiriView];
  *(float *)&double v7 = a3;
  [v6 updateVolumeInputdB:v7];

  id v9 = [(AFUISiriViewController *)self _carPlaySiriView];
  *(float *)&double v8 = a3;
  [v9 updateVolumeInputdB:v8];
}

- (void)siriSessionAudioOutputDidChangePowerLevel:(float)a3
{
  id v5 = [(AFUISiriViewController *)self _compactSiriView];
  *(float *)&double v6 = a3;
  [v5 setOutputPowerLevel:v6];

  id v8 = [(AFUISiriViewController *)self _carPlaySiriView];
  *(float *)&double v7 = a3;
  [v8 setOutputPowerLevel:v7];
}

- (void)siriSession:(id)a3 didChangeToState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v9 = [(AFUISiriSession *)self->_session attendingState];
  BOOL v10 = a5 != 10 && v9;
  if ((a4 == 3) == a4 && !v10 && ((a5 & 0xFFFFFFFFFFFFFFFCLL) == 4 || a5 == 10 || a5 == 3))
  {
    dispatch_time_t v11 = [(AFUISiriViewController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      if (a5 == 10 && self->_isPresentingVisualIntelligenceCamera)
      {
        BOOL v13 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v14 = v13;
          uint64_t v15 = SRUIFSiriSessionStateGetDescription();
          uint64_t v16 = SRUIFSiriSessionEventGetDescription();
          *(_DWORD *)uint64_t v30 = 136315650;
          *(void *)&v30[4] = "-[AFUISiriViewController siriSession:didChangeToState:event:machAbsoluteTransitionTime:]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v15;
          *(_WORD *)&v30[22] = 2112;
          __int16 v31 = v16;
          _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s siriSession didChangeToState %@ by event %@, skip siriViewControllerDidStopListening when _isPresentingVisualIntelligenceCamera", v30, 0x20u);
        }
      }
      else
      {
        int v17 = [(SASRequestOptions *)self->_currentRequestOptions isForBluetoothCar];
        int v18 = (void *)*MEMORY[0x263F28348];
        BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (!v19) {
            goto LABEL_20;
          }
          int v20 = v18;
          id v21 = SRUIFSiriSessionStateGetDescription();
          __int16 v22 = SRUIFSiriSessionEventGetDescription();
          *(_DWORD *)uint64_t v30 = 136315650;
          *(void *)&v30[4] = "-[AFUISiriViewController siriSession:didChangeToState:event:machAbsoluteTransitionTime:]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v21;
          *(_WORD *)&v30[22] = 2112;
          __int16 v31 = v22;
          uint64_t v23 = "%s siriSession didChangeToState %@ by event %@, skip siriViewControllerDidStopListening when we are in a bluetooth car";
        }
        else
        {
          if (!v19) {
            goto LABEL_20;
          }
          int v20 = v18;
          id v21 = SRUIFSiriSessionStateGetDescription();
          __int16 v22 = SRUIFSiriSessionEventGetDescription();
          *(_DWORD *)uint64_t v30 = 136315650;
          *(void *)&v30[4] = "-[AFUISiriViewController siriSession:didChangeToState:event:machAbsoluteTransitionTime:]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v21;
          *(_WORD *)&v30[22] = 2112;
          __int16 v31 = v22;
          uint64_t v23 = "%s siriSession didChangeToState %@ by event %@";
        }
        _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, v23, v30, 0x20u);
      }
    }
  }
LABEL_20:
  int64_t currentRequestSource = self->_currentRequestSource;
  if (currentRequestSource == 20)
  {
    if (!self->_presentedConversationFromBreadcrumb) {
      return;
    }
  }
  else if (a4 == 2 && currentRequestSource == 23)
  {
    return;
  }
  if (self->_isProcessingAppLaunch && ![(AFUISiriViewController *)self isDeviceInStarkMode])
  {
    char v29 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v30 = 136315138;
      *(void *)&v30[4] = "-[AFUISiriViewController siriSession:didChangeToState:event:machAbsoluteTransitionTime:]";
      _os_log_impl(&dword_223099000, v29, OS_LOG_TYPE_DEFAULT, "%s #activation: trying to change session state while processing an app launch", v30, 0xCu);
    }
  }
  else
  {
    double v25 = [(AFUISiriViewController *)self _siriView];
    [v25 setSiriSessionState:a4];

    if (a4 == 1)
    {
      uint64_t v26 = [(AFUISiriViewController *)self delegate];
      char v27 = objc_opt_respondsToSelector();

      if (v27)
      {
        __int16 v28 = [(AFUISiriViewController *)self delegate];
        [v28 siriViewControllerDidChangeToListeningMode:self];
      }
    }
  }
}

- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestWithCompletion:(id)a4
{
}

- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestAndCancelRequest:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)siriSession:(id)a3 didReceiveAppUnlockRequestForAppId:(id)a4 withCompletion:(id)a5
{
}

- (void)siriSessionDidReceiveDelayedActionCommand:(id)a3 completion:(id)a4
{
}

- (void)siriSessionDidReceiveDelayedActionCancelCommand:(id)a3 completion:(id)a4
{
}

- (void)siriSessionDidResetContext:(id)a3
{
  id v4 = [(AFUISiriViewController *)self delegate];
  [v4 siriViewControllerSessionDidResetContext:self];
}

- (void)siriSessionWillEnd:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[AFUISiriViewController siriSessionWillEnd:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(SRUIFDelayedActionCommandCache *)self->_delayedActionCommandCache performDismissalCommands];
}

- (void)siriSessionDidEnd:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  double v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    int v17 = "-[AFUISiriViewController siriSessionDidEnd:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v7 = [(AFUISiriViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(AFUISiriViewController *)self delegate];
    [v9 siriViewController:self didEndSession:v4];
  }
  session = self->_session;
  self->_session = 0;

  dispatch_time_t v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    int v17 = "-[AFUISiriViewController siriSessionDidEnd:]";
    _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s Session released from AFUISiriViewController", buf, 0xCu);
  }
  char v12 = [(AFUISiriViewController *)self _remoteViewController];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__AFUISiriViewController_siriSessionDidEnd___block_invoke;
  v14[3] = &unk_264691A50;
  id v15 = v12;
  id v13 = v12;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v14];
}

uint64_t __44__AFUISiriViewController_siriSessionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriDidDeactivate];
}

- (void)siriSessionDidUpdateSessionInfo:(id)a3
{
  id v3 = [(AFUISiriViewController *)self _fullSiriView];
  [v3 reloadData];
}

- (void)siriSession:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = (os_log_t *)MEMORY[0x263F28348];
  BOOL v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 136315394;
    *(void *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v7;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s Speech recording began on audio route: %@", v21, 0x16u);
  }
  if ([v7 isEqualToString:*MEMORY[0x263EF91C8]])
  {
    BOOL v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v21 = 136315138;
      *(void *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
      dispatch_time_t v11 = "%s Audio route changed to BluetoothHFP";
LABEL_9:
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, v11, v21, 0xCu);
    }
  }
  else
  {
    char v12 = [(AFUISiriViewController *)self _recordingStartedTimeValue];

    if (v12) {
      goto LABEL_15;
    }
    BOOL v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v21 = 136315138;
      *(void *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
      dispatch_time_t v11 = "%s Recording start time is not set";
      goto LABEL_9;
    }
  }
  id v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 136315138;
    *(void *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s Recording start time should be updated", v21, 0xCu);
  }
  __int16 v14 = NSNumber;
  id v15 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", *(_OWORD *)v21);
  [v15 systemUptime];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");

  int v17 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 136315394;
    *(void *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v16;
    _os_log_impl(&dword_223099000, v17, OS_LOG_TYPE_DEFAULT, "%s Updating recording start time to: %@", v21, 0x16u);
  }
  [(AFUISiriViewController *)self _setRecordingStartedTimeValue:v16];

LABEL_15:
  [(AFUISiriViewController *)self _presentDeferredFlamesViewIfNecessary];
  uint64_t v18 = [(AFUISiriViewController *)self _fullSiriView];
  [v18 setFlamesViewPaused:0];

  BOOL v19 = [(AFUISiriViewController *)self _fullSiriView];
  [v19 setupOrbIfNeeded];

  int v20 = [(AFUISiriViewController *)self _fullSiriView];
  [v20 setHelpButtonDeferred:0];

  self->_recordingStartedOnRoute = 1;
}

- (void)siriSessionDidFinishRequestWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(AFUISiriViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriViewController *)self delegate];
    [v6 siriViewController:self didCompleteRequestWithError:v7];
  }
}

- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall
{
  id v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 siriSessionShouldExtendAudioSessionForImminentPhoneCall];
  }
}

- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall
{
  id v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 siriSessionShouldEndExtendAudioSessionForImminentPhoneCall];
  }
}

- (BOOL)shouldNonLocalDelegateHandlePunchouts
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    char v4 = NSNumber;
    id v5 = v3;
    id v6 = objc_msgSend(v4, "numberWithBool:", -[AFUISiriViewController isVisible](self, "isVisible"));
    int v8 = 136315394;
    BOOL v9 = "-[AFUISiriViewController shouldNonLocalDelegateHandlePunchouts]";
    __int16 v10 = 2112;
    dispatch_time_t v11 = v6;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s shouldNonLocalDelegateHandlePunchouts isVisible: %@", (uint8_t *)&v8, 0x16u);
  }
  return [(AFUISiriViewController *)self isVisible];
}

- (void)handlePunchoutCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 launchOptions];
  uint64_t v9 = [v8 containsObject:*MEMORY[0x263F65D30]];

  id v12 = [(AFUISiriViewController *)self delegate];
  __int16 v10 = [v7 punchOutUri];
  dispatch_time_t v11 = [v7 bundleId];

  [v12 openURL:v10 bundleId:v11 inPlace:v9 completion:v6];
}

- (void)siriSessionImmersiveExperienceRequested
{
  if ((SiriUIDeviceIsPad() & 1) == 0 && !self->_immersiveExperienceOn)
  {
    [(AFUISiriViewController *)self setShouldDismissForTapOutsideContent:0];
    [(AFUISiriViewController *)self setShouldDismissForTapsOutsideContent:0];
    [(AFUISiriViewController *)self setShouldDismissForSwipesOutsideContent:0];
    self->_immersiveExperienceOn = 1;
  }
}

- (void)siriSessionDidReactivateFromFlexibleFollowups
{
  id v3 = [(AFUISiriViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self delegate];
    [v5 siriViewControllerDidReactivateFromFlexibleFollowups];
  }
}

- (void)siriSessionDidReceiveTakeScreenshotCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 shouldHideSiri])
  {
    int v8 = [(AFUISiriViewController *)self view];
    uint64_t v9 = [v8 window];
    __int16 v10 = [v9 layer];
    [v10 setDisableUpdateMask:2];
  }
  objc_initWeak(&location, self);
  dispatch_time_t v11 = [(AFUISiriViewController *)self _remoteViewController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__AFUISiriViewController_siriSessionDidReceiveTakeScreenshotCommand_completion___block_invoke;
  v13[3] = &unk_264692BB0;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [v11 takeScreenshotWithCompletion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __80__AFUISiriViewController_siriSessionDidReceiveTakeScreenshotCommand_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained view];
  id v6 = [v5 window];
  id v7 = [v6 layer];
  [v7 setDisableUpdateMask:0];

  if (*(void *)(a1 + 32))
  {
    int v8 = (Class *)0x263F64830;
    if (!a2) {
      int v8 = (Class *)0x263F64820;
    }
    id v9 = objc_alloc_init(*v8);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)siriSessionDidReceiveSetUpdateMaskCommand:(id)a3 completion:(id)a4
{
  id v12 = (void (**)(id, id))a4;
  LODWORD(a3) = [a3 shouldHideSiri];
  id v6 = [(AFUISiriViewController *)self view];
  id v7 = [v6 window];
  int v8 = [v7 layer];
  id v9 = v8;
  if (a3) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  [v8 setDisableUpdateMask:v10];

  if (v12)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F64830]);
    v12[2](v12, v11);
  }
}

- (void)siriSessionDidReceiveStartScreenRecordingCommand:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int v8 = [MEMORY[0x263F16978] sharedRecorder];
  if ([v8 isRecording])
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v18 = "-[AFUISiriViewController siriSessionDidReceiveStartScreenRecordingCommand:completion:]";
      _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to start recording as it is already in progress", buf, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x263F64820];
    id v11 = [v6 aceId];
    id v12 = objc_msgSend(v10, "sruif_commandFailedWithRefId:", v11);

    v7[2](v7, v12);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke;
    v13[3] = &unk_264692BD8;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v7;
    id v14 = v6;
    [v8 startSystemRecordingWithMicrophoneEnabled:0 handler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke_cold_1();
    }
    uint64_t v5 = a1 + 40;
    if (*(void *)(a1 + 40))
    {
      id v6 = (void *)MEMORY[0x263F64820];
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = objc_msgSend(v6, "sruif_commandFailedWithRefId:", v7);
LABEL_10:
      id v11 = (void *)v8;

      (*(void (**)(void))(*(void *)v5 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[AFUISiriViewController siriSessionDidReceiveStartScreenRecordingCommand:completion:]_block_invoke";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s Recording successfully started", (uint8_t *)&v12, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _dismissWithReason:9];

    uint64_t v5 = a1 + 40;
    if (*(void *)(a1 + 40))
    {
      uint64_t v10 = (void *)MEMORY[0x263F64830];
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = objc_msgSend(v10, "sruif_commandSucceededWithRefId:", v7);
      goto LABEL_10;
    }
  }
}

- (void)siriSessionDidReceiveStopScreenRecordingCommand:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F16978] sharedRecorder];
  if ([v7 isRecording])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke;
    v12[3] = &unk_264692C00;
    id v14 = v6;
    id v13 = v5;
    [v7 stopSystemRecording:v12];

    uint64_t v8 = v14;
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v16 = "-[AFUISiriViewController siriSessionDidReceiveStopScreenRecordingCommand:completion:]";
      _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to stop recording as there is no recording in progress", buf, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x263F64820];
    id v11 = [v5 aceId];
    uint64_t v8 = objc_msgSend(v10, "sruif_commandFailedWithRefId:", v11);

    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
}

void __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke_cold_1();
    }
    uint64_t v5 = a1 + 40;
    if (*(void *)(a1 + 40))
    {
      id v6 = (void *)MEMORY[0x263F64820];
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = objc_msgSend(v6, "sruif_commandFailedWithRefId:", v7);
LABEL_10:
      uint64_t v10 = (void *)v8;

      (*(void (**)(void))(*(void *)v5 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[AFUISiriViewController siriSessionDidReceiveStopScreenRecordingCommand:completion:]_block_invoke";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s Recording successfully stopped", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = a1 + 40;
    if (*(void *)(a1 + 40))
    {
      id v9 = (void *)MEMORY[0x263F64830];
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = objc_msgSend(v9, "sruif_commandSucceededWithRefId:", v7);
      goto LABEL_10;
    }
  }
}

- (void)siriSession:(id)a3 initialBringupProcessedWithTurnIdentifier:(id)a4
{
  id v5 = a4;
  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53) {
    [(SRUIFPlatformHostingInstrumentationHandler *)self->_viewHostingInstrumentationHandler hostingBringUpProcessedWithTurnIdenitfier:v5];
  }
}

- (BOOL)headphonesAuthenticated
{
  id v3 = [(AFUISiriViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(AFUISiriViewController *)self delegate];
    char v5 = [v4 headphonesAuthenticated];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(AFUISiriViewController *)self _remoteViewController];
  [v13 updateToPresentationWithIdentifier:v12 presentationProperties:v11 animated:v6 completion:v10];
}

- (BOOL)_recordingStartedOnRoute
{
  return self->_recordingStartedOnRoute;
}

- (void)_setRecordingStartedOnRoute:(BOOL)a3
{
  self->_recordingStartedOnRoute = a3;
}

- (id)_configuration
{
  return self->_configuration;
}

- (unint64_t)_currentSessionAvailabilityState
{
  return self->_currentSessionAvailabilityState;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isDeviceScreenOn
{
  id v2 = [(AFUISiriViewController *)self _systemState];
  char v3 = [v2 deviceScreenIsOn];

  return v3;
}

- (id)_systemState
{
  return (id)[MEMORY[0x263F6C740] sharedSystemState];
}

- (void)emitUIStateTransitionForSiriDismissalWithReason:(int64_t)a3
{
  if ([(SASRequestOptions *)self->_currentRequestOptions requestSource] != 53)
  {
    objc_initWeak(&location, self);
    [(AFUISiriViewController *)self _donateUIDismissalToBiome:a3];
    int v5 = SASDismissalReasonToSISchemaDismissalReason();
    BOOL v6 = self->_viewHostingInstrumentationHandler;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v8[2] = __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke;
    id v8[3] = &unk_264692C50;
    objc_copyWeak(&v10, &location);
    int v11 = v5;
    id v7 = v6;
    id v9 = v7;
    [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = [WeakRetained _remoteViewController];
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke_2;
  v5[3] = &unk_264692C28;
  id v6 = *(id *)(a1 + 32);
  [v3 emitUIStateTransitionForSiriDismissalWithDismissalReason:v4 completion:v5];
}

void __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)MEMORY[0x263F28400];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithTurnIdentifier:v4];

  [*(id *)(a1 + 32) hostingDismissalProcessedWithTurnIdenitfier:v5];
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __51__AFUISiriViewController_emitInstrumentationEvent___block_invoke;
  v6[3] = &unk_264691C90;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__AFUISiriViewController_emitInstrumentationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 emitInstrumentationEvent:*(void *)(a1 + 32)];
}

- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __58__AFUISiriViewController_emitInstrumentationEvent_atTime___block_invoke;
  id v8[3] = &unk_264691C68;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __58__AFUISiriViewController_emitInstrumentationEvent_atTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 emitInstrumentationEvent:*(void *)(a1 + 32) atTime:*(void *)(a1 + 48)];
}

- (void)siriContentDidReceiveOrbTappedAction:(id)a3
{
}

- (void)siriContentDidReceiveOrbHoldDidBeginAction:(id)a3
{
}

- (void)siriContentDidReceiveOrbHoldDidEndAction:(id)a3
{
}

- (void)hideVoiceActivationMaskViewIfNecessary
{
  if (self->_shouldShowVoiceActivationMaskView)
  {
    self->_shouldShowVoiceActivationMaskView = 0;
    objc_initWeak(&location, self);
    objc_copyWeak(&v2, &location);
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

void __64__AFUISiriViewController_hideVoiceActivationMaskViewIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _siriView];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        id v9 = "-[AFUISiriViewController hideVoiceActivationMaskViewIfNecessary]_block_invoke";
        _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Requesting hide - voiceActivationMaskView", (uint8_t *)&v8, 0xCu);
      }
      id v6 = [v2 _siriView];
      [v6 setVoiceActivationMaskViewVisible:0];
    }
    if (v2[143] == 1) {
      [v2 requestStatusBarVisible:1];
    }
    v2[143] = 0;
    id v7 = [v2 delegate];
    [v7 siriViewController:v2 voiceActivationMaskViewIsVisible:0];
  }
}

- (void)animateOrbViewDismissalIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __75__AFUISiriViewController_animateOrbViewDismissalIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    char v3 = [WeakRetained _compactSiriView];

    if (v3)
    {
      id v4 = [v5 _compactSiriView];
      [v4 animateOrbViewDismissalWithCompletion:*(void *)(a1 + 32)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id WeakRetained = v5;
  }
}

- (void)animateOrbViewToOffIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __71__AFUISiriViewController_animateOrbViewToOffIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    char v3 = [WeakRetained _compactSiriView];

    if (v3)
    {
      id v4 = [v5 _compactSiriView];
      [v4 animateOrbViewToOffWithCompletion:*(void *)(a1 + 32)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id WeakRetained = v5;
  }
}

- (void)commandCache:(id)a3 didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__AFUISiriViewController_commandCache_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke;
  v9[3] = &unk_264691C90;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(AFUISiriViewController *)self _enqueueRemoteViewControllerMessageBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __91__AFUISiriViewController_commandCache_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _remoteViewController];
  [v2 didSuccessfullyHandleCommandsInDelayedActionCommand:*(void *)(a1 + 32)];
}

- (id)_fullSiriView
{
  char v3 = [(AFUISiriViewController *)self _siriView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(AFUISiriViewController *)self _siriView];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_compactSiriView
{
  char v3 = [(AFUISiriViewController *)self _siriView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(AFUISiriViewController *)self _siriView];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_carPlaySiriView
{
  char v3 = [(AFUISiriViewController *)self _siriView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(AFUISiriViewController *)self _siriView];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_orbViewControllingView
{
  char v3 = [(AFUISiriViewController *)self _siriView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriViewController *)self _siriView];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_deviceSupportsZLL
{
  return MEMORY[0x270F0ED08](self, a2);
}

- (void)tamaleViewDidLoad
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __43__AFUISiriViewController_tamaleViewDidLoad__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[1265])
    {
      char v4 = [WeakRetained delegate];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      void v5[2] = __43__AFUISiriViewController_tamaleViewDidLoad__block_invoke_2;
      v5[3] = &unk_264692C78;
      objc_copyWeak(&v6, v1);
      [v4 requestTamaleLaunchAnimationLayerProviderWithCompletion:v5];

      objc_destroyWeak(&v6);
    }
    [v3 presentRemoteViewControllerIfNecessary];
    [v3 _startVisualIntelligenceAutolockTimer];
  }
}

void __43__AFUISiriViewController_tamaleViewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performTamaleTransitionWithLayer:v3];
}

- (void)tamaleViewRequestsAuthenticationWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __73__AFUISiriViewController_tamaleViewRequestsAuthenticationWithCompletion___block_invoke;
  v6[3] = &unk_264692CA0;
  id v7 = v4;
  id v5 = v4;
  [(AFUISiriViewController *)self _handlePasscodeUnlockAndCancelRequest:0 dismissOnFailure:0 passcodeUnlockClient:1 withCompletion:v6];
}

uint64_t __73__AFUISiriViewController_tamaleViewRequestsAuthenticationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)_performTamaleTransitionWithLayer:(id)a3
{
  void v18[4] = *MEMORY[0x263EF8340];
  tamaleView = self->_tamaleView;
  id v5 = a3;
  id v6 = [(SiriSharedUITamaleView *)tamaleView layer];
  id v7 = [MEMORY[0x263F82B60] mainScreen];
  id v8 = [v7 traitCollection];
  [v8 displayCornerRadius];
  objc_msgSend(v6, "setCornerRadius:");

  [(SiriSharedUITamaleView *)self->_tamaleView setClipsToBounds:1];
  id v9 = objc_alloc_init(MEMORY[0x263F15800]);
  [v9 setSourceLayer:v5];

  [v9 setDuration:INFINITY];
  [v9 setFillMode:*MEMORY[0x263F15AA8]];
  [v9 setRemovedOnCompletion:0];
  id v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 0.0);
  v18[0] = v10;
  id v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.0, 0.0);
  v18[1] = v11;
  id v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.0, 1.0);
  v18[2] = v12;
  id v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 1.0);
  v18[3] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  [v9 setSourcePoints:v14];
  [v9 setUsesNormalizedCoordinates:1];
  id v15 = [MEMORY[0x263F15890] animationWithKeyPath:@"opacity"];
  [v15 setFromValue:&unk_26D62A8F0];
  [v15 setToValue:&unk_26D62A908];
  [v15 setMass:1.0];
  [v15 setStiffness:400.405875];
  [v15 setDamping:40.020289];
  id v16 = [(SiriSharedUITamaleView *)self->_tamaleView layer];
  [v16 addAnimation:v9 forKey:@"TamaleMatchMoveToDropletAnimation"];

  uint64_t v17 = [(SiriSharedUITamaleView *)self->_tamaleView layer];
  [v17 addAnimation:v15 forKey:@"opacity"];

  [(SiriSharedUITamaleView *)self->_tamaleView setAlpha:1.0];
  self->_isPresentingVisualIntelligenceCamera = 1;
}

- (void)visionIntelligenceDropletLaunchAnimationDidFinish:(BOOL)a3 retargeted:(BOOL)a4
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __87__AFUISiriViewController_visionIntelligenceDropletLaunchAnimationDidFinish_retargeted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1265) = 1;
    id v6 = (id *)WeakRetained;
    [*((id *)WeakRetained + 157) setAlpha:1.0];
    [v6[157] _setContinuousCornerRadius:0.0];
    id v2 = [v6[157] layer];
    [v2 removeAnimationForKey:@"TamaleMatchMoveToDropletAnimation"];

    id v3 = [v6[157] layer];
    [v3 removeAnimationForKey:@"opacity"];

    [v6[157] setClipsToBounds:0];
    id v4 = v6[157];
    id v5 = [v6 view];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");

    id WeakRetained = v6;
  }
}

- (void)_startVisualIntelligenceAutolockTimer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(AFUISiriViewController *)self visualIntelligenceAutolockTimer];

  if (v3) {
    [(AFUISiriViewController *)self _stopVisualIntelligenceAutolockTimer];
  }
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[AFUISiriViewController _startVisualIntelligenceAutolockTimer]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence Starting the auto-lock timer", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = (void *)MEMORY[0x263EFFA20];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __63__AFUISiriViewController__startVisualIntelligenceAutolockTimer__block_invoke;
  v7[3] = &unk_264692CC8;
  objc_copyWeak(&v8, (id *)buf);
  id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:600.0];
  [(AFUISiriViewController *)self setVisualIntelligenceAutolockTimer:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __63__AFUISiriViewController__startVisualIntelligenceAutolockTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopVisualIntelligenceAutolockTimer];

  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[AFUISiriViewController _startVisualIntelligenceAutolockTimer]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence Will dismiss due to auto-lock timeout. The visual intelligence camera should dismiss after it's been open for 10 minutes", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained(v1);
  [v4 _dismissWithReason:4];
}

- (void)_stopVisualIntelligenceAutolockTimer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [(AFUISiriViewController *)self visualIntelligenceAutolockTimer];

  if (v3)
  {
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[AFUISiriViewController _stopVisualIntelligenceAutolockTimer]";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #visualIntelligence Stopping the auto-lock timer", (uint8_t *)&v6, 0xCu);
    }
    int v5 = [(AFUISiriViewController *)self visualIntelligenceAutolockTimer];
    [v5 invalidate];

    [(AFUISiriViewController *)self setVisualIntelligenceAutolockTimer:0];
  }
}

- (AFUISiriViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AFUISiriViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (AFUISiriViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (BOOL)isDeviceInStarkMode
{
  return self->_deviceIsInStarkMode;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)announcementRequestsPermittedWhilePresentationActive
{
  return self->_announcementRequestsPermittedWhilePresentationActive;
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (BOOL)carDNDActive
{
  return self->_carDNDActive;
}

- (BOOL)receivedIncomingPhoneCall
{
  return self->_receivedIncomingPhoneCall;
}

- (BOOL)turnsOnScreenOnAppearance
{
  return self->_turnsOnScreenOnAppearance;
}

- (void)setTurnsOnScreenOnAppearance:(BOOL)a3
{
  self->_turnsOnScreenOnAppearance = a3;
}

- (BOOL)shouldPlaceEffectsWindowOnTopOfSiriWindow
{
  return self->_shouldPlaceEffectsWindowOnTopOfSiriWindow;
}

- (BOOL)showsStatusBar
{
  return self->_showsStatusBar;
}

- (void)setShowsStatusBar:(BOOL)a3
{
  self->_showsStatusBar = a3;
}

- (BOOL)statusBarEnabled
{
  return self->_statusBarEnabled;
}

- (void)setStatusBarEnabled:(BOOL)a3
{
  self->_statusBarEnabled = a3;
}

- (BOOL)isSceneHostingVisualIntelligence
{
  return self->_isSceneHostingVisualIntelligence;
}

- (void)setIsSceneHostingVisualIntelligence:(BOOL)a3
{
  self->_isSceneHostingVisualIntelligence = a3;
}

- (AFUISiriEdgelightViewProvider)edgeLightViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);

  return (AFUISiriEdgelightViewProvider *)WeakRetained;
}

- (AFUISiriSession)_session
{
  return self->_session;
}

- (AFUISiriRemoteSceneViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (OS_dispatch_queue)_remoteViewControllerDispatchQueue
{
  return self->_remoteViewControllerDispatchQueue;
}

- (BOOL)_hasCalledBeginAppearanceTransition
{
  return self->_hasCalledBeginAppearanceTransition;
}

- (void)_setHasCalledBeginAppearanceTransition:(BOOL)a3
{
  self->_hasCalledBeginAppearanceTransition = a3;
}

- (BOOL)_hasCalledEndAppearanceTransition
{
  return self->_hasCalledEndAppearanceTransition;
}

- (void)_setHasCalledEndAppearanceTransition:(BOOL)a3
{
  self->_hasCalledEndAppearanceTransition = a3;
}

- (SiriUIAudioRoutePickerController)routePickerController
{
  return self->_routePickerController;
}

- (void)setRoutePickerController:(id)a3
{
}

- (UIStatusBar)_statusBar
{
  return self->_statusBar;
}

- (void)_setStatusBar:(id)a3
{
}

- (BOOL)_isInHoldToTalkMode
{
  return self->_inHoldToTalkMode;
}

- (void)_setInHoldToTalkMode:(BOOL)a3
{
  self->_inHoldToTalkMode = a3;
}

- (SASRequestOptions)_currentRequestOptions
{
  return self->_currentRequestOptions;
}

- (NSNumber)_recordingStartedTimeValue
{
  return self->_recordingStartedTimeValue;
}

- (void)_setRecordingStartedTimeValue:(id)a3
{
}

- (double)_viewDidAppearTime
{
  return self->_viewDidAppearTime;
}

- (void)_setViewDidAppearTime:(double)a3
{
  self->_viewDidAppearTime = a3;
}

- (BOOL)isViewDisappearing
{
  return self->_viewDisappearing;
}

- (void)setViewDisappearing:(BOOL)a3
{
  self->_viewDisappearing = a3;
}

- (BOOL)_siriRemoteViewControllerIsEditing
{
  return self->_siriRemoteViewControllerIsEditing;
}

- (void)_setSiriRemoteViewControllerIsEditing:(BOOL)a3
{
  self->_siriRemoteViewControllerIsEditing = a3;
}

- (BOOL)_isPunchingOut
{
  return self->_punchingOut;
}

- (CGRect)hostedPresentationFrame
{
  double x = self->_hostedPresentationFrame.origin.x;
  double y = self->_hostedPresentationFrame.origin.y;
  double width = self->_hostedPresentationFrame.size.width;
  double height = self->_hostedPresentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_statusViewHidden
{
  return self->_statusViewHidden;
}

- (NSTimer)visualIntelligenceAutolockTimer
{
  return self->_visualIntelligenceAutolockTimer;
}

- (void)setVisualIntelligenceAutolockTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIntelligenceAutolockTimer, 0);
  objc_storeStrong((id *)&self->_recordingStartedTimeValue, 0);
  objc_storeStrong((id *)&self->_currentRequestOptions, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_routePickerController, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_edgeLightViewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tamaleView, 0);
  objc_storeStrong((id *)&self->_carPlayShockwaveViewController, 0);
  objc_storeStrong((id *)&self->_activationInstrumentation, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong((id *)&self->_currentDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_tapPanDismissalPolicyManager, 0);
  objc_storeStrong((id *)&self->_networkAvailabilityStateMachine, 0);
  objc_storeStrong((id *)&self->_dismissalUserInfo, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_uiAppearanceRecordQueue, 0);
  objc_storeStrong((id *)&self->_uiAppearanceUUIDString, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delayedActionCommandCache, 0);

  objc_storeStrong(&self->_triggerUpdater, 0);
}

- (void)initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:.cold.1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriViewController.m", 136, @"%s", dlerror());

  __break(1u);
}

void __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 136315650;
  uint64_t v7 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
  __int16 v8 = 2114;
  id v9 = (id)objc_opt_class();
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  id v5 = v9;
  _os_log_error_impl(&dword_223099000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to obtain remote view controller: %{public}@", (uint8_t *)&v6, 0x20u);
}

void __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_223099000, v0, OS_LOG_TYPE_ERROR, "%s Error starting system recording: %@", (uint8_t *)v1, 0x16u);
}

void __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_223099000, v0, OS_LOG_TYPE_ERROR, "%s Error stopping system recording: %@", (uint8_t *)v1, 0x16u);
}

@end