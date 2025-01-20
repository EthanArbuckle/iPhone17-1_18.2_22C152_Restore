@interface AXSpringBoardServerHelper
+ (id)_assistantController;
+ (id)_awayController;
+ (id)_axActiveWindowScene;
+ (id)_backlightController;
+ (id)_globalIdleTimeCoordinator;
+ (id)_iconController;
+ (id)_lockScreenManager;
+ (id)_syncController;
+ (id)_uiController;
+ (id)_wallpaperController;
+ (id)sharedServerHelper;
+ (void)initialize;
- (AXAssertion)disableSystemGesturesAssertionForAlert;
- (AXSSMotionTrackingInputManager)motionTrackingInputManager;
- (AXSpringBoardServerAlertManager)alertManager;
- (AXSpringBoardServerHelper)init;
- (AXSpringBoardServerSideAppManager)sideAppManager;
- (BOOL)_accessibilityAllowShowNotificationGestureOverride;
- (BOOL)_accessibilityHandleHomeOrLockButtonPress;
- (BOOL)_accessibilityIsUILocked;
- (BOOL)_accessibilityShowCoverSheet:(BOOL)a3 serverInstance:(id)a4 completion:(id)a5;
- (BOOL)_accessibilityShowNotificationCenter:(BOOL)a3 serverInstance:(id)a4;
- (BOOL)_isDarkModeActive;
- (BOOL)_isDisplayingAlertController;
- (BOOL)_shouldShowTCOption:(int)a3;
- (BOOL)accessibilityIsBannerVisible;
- (BOOL)accessibilityIsNotificationVisible;
- (BOOL)accessibilityIsRemoteTransientOverlayVisible;
- (BOOL)accessibilityShowControlCenter:(BOOL)a3;
- (BOOL)areSystemGesturesDisabledByAccessibilityWithServerInstance:(id)a3;
- (BOOL)areSystemGesturesDisabledNativelyWithServerInstance:(id)a3;
- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3;
- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3;
- (BOOL)canSetDockIconActivationModeForServerInstance:(id)a3;
- (BOOL)connectedDevicesRequireAssistiveTouch;
- (BOOL)contintuityDisplayIsActive;
- (BOOL)currentDevicesHaveAssistiveTouchCustomActions;
- (BOOL)dismissSiriWithServerInstance:(id)a3;
- (BOOL)handleToggleIncomingCallWithServerInstance:(id)a3;
- (BOOL)hasActiveCallWithServerInstance:(id)a3;
- (BOOL)hasActiveEndpointCallWithServerInstance:(id)a3;
- (BOOL)hasActiveOrPendingCallOrFaceTimeWithServerInstance:(id)a3;
- (BOOL)hasActiveOrPendingCallWithServerInstance:(id)a3;
- (BOOL)isAppSwitcherPeekingWithServerInstance:(id)a3;
- (BOOL)isAppSwitcherVisibleWithServerInstance:(id)a3;
- (BOOL)isBannerVisibleWithServerInstance:(id)a3;
- (BOOL)isBuddyRunning;
- (BOOL)isCarPlayConnected;
- (BOOL)isContinuitySessionActiveWithServerInstance:(id)a3;
- (BOOL)isControlCenterVisibleWithServerInstance:(id)a3;
- (BOOL)isCoverSheetVisibleWithServerInstance:(id)a3;
- (BOOL)isDockVisibleWithServerInstance:(id)a3;
- (BOOL)isGuidedAccessActiveWithServerInstance:(id)a3;
- (BOOL)isInCallServiceFrontmost;
- (BOOL)isLockScreenVisible;
- (BOOL)isLockScreenVisibleWithServerInstance:(id)a3;
- (BOOL)isLongLookNotificationVisibleWithServerInstance:(id)a3;
- (BOOL)isMagnifierVisibleWithServerInstance:(id)a3;
- (BOOL)isMakingEmergencyCallWithServerInstance:(id)a3;
- (BOOL)isNotificationCenterVisibleWithServerInstance:(id)a3;
- (BOOL)isNotificationVisibleWithServerInstance:(id)a3;
- (BOOL)isOrientationLockedWithServerInstance:(id)a3;
- (BOOL)isPIPWindowVisibleWithServerInstance:(id)a3;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isPasscodeLockVisibleWithServerInstance:(id)a3;
- (BOOL)isPasscodeRequiredOnLockWithServerInstance:(id)a3;
- (BOOL)isPreferencesFrontmost;
- (BOOL)isPurpleBuddyAppFrontmostWithServerInstance:(id)a3;
- (BOOL)isReachabilityActive;
- (BOOL)isRemoteTransientOverlayVisibleWithServerInstance:(id)a3;
- (BOOL)isRingerMutedWithServerInstance:(id)a3;
- (BOOL)isScreenLockedWithServerInstance:(id)a3;
- (BOOL)isScreenshotWindowVisibleWithServerInstance:(id)a3;
- (BOOL)isSettingsAppFrontmostWithServerInstance:(id)a3;
- (BOOL)isShelfSwitcherVisibleWithServerInstance:(id)a3;
- (BOOL)isShowingHomescreenWithServerInstance:(id)a3;
- (BOOL)isShowingNonSystemAppWithServerInstance:(id)a3;
- (BOOL)isSiriVisibleWithServerInstance:(id)a3;
- (BOOL)isSpeakThisTemporarilyDisabledWithServerInstance:(id)a3;
- (BOOL)isSpotlightVisibleWithServerInstance:(id)a3;
- (BOOL)isStageManagerSwitcherVisibleWithServerInstance:(id)a3;
- (BOOL)isStatusBarNativeFocusableWithServerInstance:(id)a3 includingNonDismissableElements:(BOOL)a4;
- (BOOL)isSyncingRestoringResettingOrUpdatingWithServerInstance:(id)a3;
- (BOOL)isSystemAppFrontmostExcludingSiri:(BOOL)a3 withServerInstance:(id)a4;
- (BOOL)isSystemAppShowingAnAlertWithServerInstance:(id)a3;
- (BOOL)isSystemGestureActiveWithServerInstance:(id)a3;
- (BOOL)isSystemSleepingWithServerInstance:(id)a3;
- (BOOL)isTodayViewOrAppLibraryVisibleWithServerInstance:(id)a3;
- (BOOL)isTypeToSiriVisibleWithServerInstance:(id)a3;
- (BOOL)isVoiceControlRunningWithServerInstance:(id)a3;
- (BOOL)serverInstance:(id)a3 isShowingRemoteViewType:(int64_t)a4;
- (BOOL)serverInstance:(id)a3 performMedusaGesture:(unint64_t)a4;
- (BOOL)serverInstance:(id)a3 showControlCenter:(BOOL)a4;
- (BOOL)serverInstance:(id)a3 showNotificationCenter:(BOOL)a4;
- (BOOL)shouldOverrideInterfaceOrientation;
- (BOOL)toggleDarkModeWithServerInstance:(id)a3;
- (BSInvalidatable)presentationWindowFocusAssertion;
- (FBSDisplayLayoutMonitor)continuityDisplayMonitor;
- (UIWindow)presentationWindow;
- (double)reachabilityOffsetWithServerInstance:(id)a3;
- (double)volumeLevelWithServerInstance:(id)a3;
- (id)_accessibilityCoverSheetPresentationManagerSharedInstance;
- (id)_accessibilityNotificationSummary:(unint64_t)a3;
- (id)_axFloatingDockController;
- (id)_handleConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4;
- (id)_handleUsageConfirmationDialogWithMessage:(id)a3;
- (id)_handleVOConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4;
- (id)_handleVOUsageConfirmationDialogWithMessage:(id)a3;
- (id)_serviceForRemoteViewType:(int64_t)a3;
- (id)_visibleTripleClickItems;
- (id)allowedMedusaGesturesWithServerInstance:(id)a3;
- (id)appForLayoutRole:(int64_t)a3;
- (id)appNameFromPid:(int)a3 withServerInstance:(id)a4;
- (id)coverSheetViewController;
- (id)displayIdentifierForSceneIdentifier:(id)a3 serverInstance:(id)a4;
- (id)focusedAppPIDWithServerInstance:(id)a3;
- (id)focusedAppProcessWithServerInstance:(id)a3;
- (id)focusedAppsWithServerInstance:(id)a3;
- (id)focusedOccludedAppScenesWithServerInstance:(id)a3;
- (id)frontmostAppProcessWithServerInstance:(id)a3;
- (id)installedAppsWithServerInstance:(id)a3;
- (id)internalAppsWithServerInstance:(id)a3;
- (id)jindoAppBundleIndentifiersWithServerInstance:(id)a3;
- (id)medusaAppsWithServerInstance:(id)a3;
- (id)medusaBundleIDsToLayoutRoles;
- (id)runningAppPIDsWithServerInstance:(id)a3;
- (id)runningAppProcessesWithServerInstance:(id)a3;
- (id)sceneLayoutState;
- (id)serverInstance:(id)a3 appWithIdentifier:(id)a4;
- (id)serverInstance:(id)a3 splashImageForAppWithBundleIdentifier:(id)a4;
- (id)serverInstance:(id)a3 springBoardSystemInfoQuery:(unint64_t)a4;
- (int)nativeFocusedApplication;
- (int)purpleBuddyPIDWithServerInstance:(id)a3;
- (unint64_t)_accessibilityNotificationCount;
- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3;
- (void)_cleanupAlertController;
- (void)_cleanupPresentationWindow;
- (void)_createAlertWindowSubclass;
- (void)_dismissAlertController;
- (void)_dismissAlertControllerWithCompletion:(id)a3;
- (void)_dismissViewControllerWithCompletion:(id)a3;
- (void)_displayAlertController:(id)a3;
- (void)_displayViewController:(id)a3;
- (void)_displayViewController:(id)a3 withCompletion:(id)a4;
- (void)_handleASTMenuCustomizeAddDwell:(BOOL)a3 addScroll:(BOOL)a4;
- (void)_handleASTMenuFullForInstance:(id)a3;
- (void)_handleAlertActionPress:(id)a3;
- (void)_handleAlwaysOnBluetoothModeForVoiceOver;
- (void)_handleConfirmRebootDevice;
- (void)_handleConnectedDevicesHaveAssistiveTouchCustomActions;
- (void)_handleDisableAssistiveTouchConfirmation;
- (void)_handleDisableBrightnessFiltersAlert:(id)a3;
- (void)_handleDisableFKAConfirmation;
- (void)_handleDisableOnDeviceEyeTrackingConfirmation;
- (void)_handleDisableSwitchControlConfirmation;
- (void)_handleDisallowUSBRestrictedModeSCInformativeOnly:(BOOL)a3;
- (void)_handleDisallowUSBRestrictedModeVOInformativeOnly:(BOOL)a3;
- (void)_handleLiveTranscriptionConfirmation;
- (void)_handleSecureItentAlertForSwitchAST;
- (void)_handleSwitchUsageConfirmed;
- (void)_handleTouchAccommodationsUsageConfirmed;
- (void)_handleTripleClickAskAlert;
- (void)_handleVONoHomeButtonGestureAlert;
- (void)_handleVoiceOverUsageConfirmation;
- (void)_handleZoomConflictAlert:(id)a3;
- (void)_handleZoomInBuddyAlert;
- (void)_handleZoomTripleClickAfterConflict;
- (void)_monitorContinuityDisplayChanges;
- (void)_performValidation;
- (void)_restoreAccessibilityFeatureFromSecurePayCache:(id)a3;
- (void)_restoreSecurePayFeaturesIfNeeded;
- (void)_sortVisibleItems;
- (void)_toggleTripleClickDisplay;
- (void)_unlockWithIntent:(int)a3;
- (void)_updateVisibleTripleClickItems;
- (void)activateSOSModeWithServerInstance:(id)a3;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)armApplePayWithServerInstance:(id)a3;
- (void)cancelSiriDismissalForAssistiveTouchWithServerInstance:(id)a3;
- (void)dealloc;
- (void)didFailToFloatAppForSideAppManager:(id)a3;
- (void)didFailToPinAppForSideAppManager:(id)a3;
- (void)diminishJindoWithServerInstance:(id)a3;
- (void)dismissAlertWithCancel;
- (void)dismissAppSwitcherWithServerInstance:(id)a3;
- (void)dismissShelfSwitcherWithServerInstance:(id)a3;
- (void)forceLoadGAXBundleWithServerInstance:(id)a3;
- (void)freezeClarityUILoadingScreenWithServerInstance:(id)a3;
- (void)handleBrokenHomeButtonAlert;
- (void)hideAlertWithServerInstance:(id)a3;
- (void)isMediaPlayingWithServerInstance:(id)a3 forBundleId:(id)a4 completion:(id)a5;
- (void)launchApplication:(id)a3;
- (void)launchApplicationWithFullConfiguration:(id)a3;
- (void)launchFloatingApplication:(id)a3;
- (void)launchMagnifierAppWithServerInstance:(id)a3;
- (void)launchOnboardingViewServiceWithServerInstance:(id)a3 data:(id)a4;
- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4;
- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(id)a3 forData:(id)a4;
- (void)launchVoiceOverQuickSettingsViewServiceWithServerInstance:(id)a3 data:(id)a4;
- (void)nativeFocusedApplication;
- (void)openAppSwitcherWithServerInstance:(id)a3;
- (void)openCommandAndControlCommandsWithServerInstance:(id)a3;
- (void)openCommandAndControlSettingsWithServerInstance:(id)a3;
- (void)openCommandAndControlVocabularyWithServerInstance:(id)a3;
- (void)openCustomGestureCreationForASTWithServerInstance:(id)a3;
- (void)openCustomGestureCreationForSCATWithServerInstance:(id)a3;
- (void)openMenuCustomizationForASTWithServerInstance:(id)a3;
- (void)openTypeToSiriWithServerInstance:(id)a3;
- (void)openVoiceControlWithServerInstance:(id)a3;
- (void)presentNearbyDeviceControlPickerWithServerInstance:(id)a3;
- (void)reactivateInCallServiceWithServerInstance:(id)a3;
- (void)rebootDeviceWithServerInstance:(id)a3;
- (void)resetDimTimerWithServerInstance:(id)a3;
- (void)revealSpotlightWithServerInstance:(id)a3;
- (void)serverInstance:(id)a3 hideRemoteViewType:(int64_t)a4;
- (void)serverInstance:(id)a3 pauseMedia:(BOOL)a4 forBundleId:(id)a5;
- (void)serverInstance:(id)a3 setDockIconActivationMode:(unint64_t)a4;
- (void)serverInstance:(id)a3 setOrientation:(int64_t)a4;
- (void)serverInstance:(id)a3 setOrientationLocked:(BOOL)a4;
- (void)serverInstance:(id)a3 setReachabilityEnabled:(BOOL)a4;
- (void)serverInstance:(id)a3 showAlertType:(int)a4 withHandler:(id)a5 withData:(id)a6;
- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5;
- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5 withPreviousViewDismissal:(BOOL)a6;
- (void)serverInstance:(id)a3 showSpeechPlaybackControls:(BOOL)a4;
- (void)setAlertManager:(id)a3;
- (void)setContintuityDisplayIsActive:(BOOL)a3;
- (void)setContinuityDisplayMonitor:(id)a3;
- (void)setDashBoardSystemGesturesEnabled:(BOOL)a3 withServerInstance:(id)a4;
- (void)setDisableSystemGesturesAssertionForAlert:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setPresentationWindowFocusAssertion:(id)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3 withServerInstance:(id)a4;
- (void)simulateEdgePressHaptics:(id)a3;
- (void)toggleAppLibraryWithServerInstance:(id)a3;
- (void)toggleBackgroundSoundsWithServerInstance:(id)a3;
- (void)toggleConversationBoostWithServerInstance:(id)a3;
- (void)toggleDetectionModeWithServerInstance:(id)a3;
- (void)toggleDockWithServerInstance:(id)a3;
- (void)toggleLiveTranscriptionWithServerInstance:(id)a3;
- (void)toggleNotificationCenterWithServerInstance:(id)a3;
- (void)toggleQuickNoteWithServerInstance:(id)a3;
- (void)toggleSpotlightWithServerInstance:(id)a3;
- (void)toggleTorchWithServerInstance:(id)a3;
- (void)unlockDeviceWithServerInstance:(id)a3;
- (void)updateFrontMostApplicationWithServerInstance:(id)a3;
- (void)wakeUpDeviceIfNecessaryWithServerInstance:(id)a3;
@end

@implementation AXSpringBoardServerHelper

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_1);
  }
}

void __39__AXSpringBoardServerHelper_initialize__block_invoke()
{
  if (AXProcessIsSpringBoard())
  {
    v0 = objc_alloc_init(AXSpringBoardServerHelper);
    v1 = (void *)SBServerHelper;
    SBServerHelper = (uint64_t)v0;

    v2 = +[_AXSpringBoardServerInstance springBoardServerInstance];
    [v2 setDelegate:SBServerHelper];

    uint64_t v3 = SBServerHelper;
    id v4 = +[AXSpringBoardServerSideAppManager sharedInstance];
    [v4 setDelegate:v3];
  }
}

+ (id)sharedServerHelper
{
  return (id)SBServerHelper;
}

- (void)_performValidation
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global_772 withPreValidationHandler:&__block_literal_global_1624 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_1630];
}

uint64_t __47__AXSpringBoardServerHelper__performValidation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SBTelephonyManager"];
  [v2 validateClass:@"SBPrototypeController"];
  [v2 validateClass:@"SBConferenceManager"];
  [v2 validateClass:@"UIApplicationRotationFollowingWindow"];
  [v2 validateClass:@"SBHomeScreenWindow"];
  [v2 validateClass:@"SpringBoard"];
  [v2 validateClass:@"SBMainWorkspace"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainWorkspace", @"_instanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"inCallTransientOverlayManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"ringerControl", "@", 0);
  [v2 validateClass:@"SBMainWorkspace" hasInstanceVariable:@"_keyboardFocusCoordinator" withType:"<SBKeyboardFocusControlling>"];
  [v2 validateClass:@"SBKeyboardFocusCoordinator"];
  [v2 validateClass:@"SBKeyboardFocusArbitrationReason"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBKeyboardFocusArbitrationReason", @"_initWithLabel:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBKeyboardFocusCoordinator", @"sharedInstance", "@", 0);
  [v2 validateClass:@"SBKeyboardFocusCoordinator" conformsToProtocol:@"SBKeyboardFocusControlling"];
  [v2 validateProtocol:@"SBKeyboardFocusControlling" hasRequiredInstanceMethod:@"focusLockSpringBoardWindowScene:forReason:"];
  [v2 validateProtocol:@"SBKeyboardFocusControlling" hasRequiredInstanceMethod:@"requestArbitrationForSBWindowScene:forReason:"];
  [v2 validateClass:@"SBInCallTransientOverlayManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBInCallTransientOverlayManager", @"presentTransientOverlay", "v", 0);
  [v2 validateClass:@"SBRingerControl"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRingerControl", @"_accessibilityIsRingerMuted", "B", 0);
  [v2 validateClass:@"SBReachabilityManager" hasInstanceVariable:@"_reachabilityModeActive" withType:"B"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"isVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBLockScreenManager", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMediaController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBOrientationLockManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBReachabilityManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBTelephonyManager", @"sharedTelephonyManagerCreatingIfNecessary:", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPrototypeController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBConferenceManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBBacklightController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemGestureManager", @"isGestureWithTypeAllowed:", "B", "Q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSystemGestureManager", @"mainDisplayManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"isVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBVoiceControlController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVoiceControlController", @"handleHomeButtonHeld", "B", 0);
  [v2 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"isClassic", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"_classicMode", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"transientOverlayPresentationManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTransientOverlayPresentationManager", @"topmostPresentedViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleShelves", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherShelfViewController", @"dismissShelfForAccessibilityTransition", "v", 0);
  [v2 validateClass:@"SBRemoteTransientOverlayViewController" hasInstanceVariable:@"_hostContentAdapter" withType:"SBRemoteTransientOverlayHostContentAdapter"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRemoteTransientOverlayHostContentAdapter", @"serviceBundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBContinuitySessionManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuitySessionManager", @"currentSession", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSPageViewController", @"view", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBDefaults", @"localDefaults", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"coverSheetViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"coverSheetView", "@", 0);
  [v2 validateClass:@"CSCoverSheetViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"activatePage:animated:withCompletion:", "v", "Q", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_indexOfMainPage", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"suppressesControlCenter", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_allowedPageViewControllers", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"scrollView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFPagedScrollView", @"currentPageIndex", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"processState", "@", 0);
  [v2 validateClass:@"SBApplicationProcessState" hasInstanceMethod:@"pid" withFullSignature:0];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"_updateProcess:withState:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationProcessState", @"taskState", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationProcessState", @"visibility", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"_internalProcessState", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"lockUIFromSource:withOptions:", "v", "i", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"_authenticationStateChanged:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIdleTimerGlobalCoordinator", @"resetIdleTimerForReason:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"shouldTurnOnScreenForBacklightSource:", "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"setBacklightState:source:", "v", "q", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"presentedBanner", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"isPresentingBanner", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"notificationDispatcher", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCNotificationDispatcher", @"bannerDestination", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCNotificationDispatcher", @"dashBoardDestination", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"isPresentingBannerInLongLook", "B", 0);
  [v2 validateProtocol:@"SBNotificationDestination" conformsToProtocol:@"SBFNotificationLongLookPresenting"];
  [v2 validateProtocol:@"SBFNotificationLongLookPresenting" hasRequiredInstanceMethod:@"isPresentingNotificationInLongLook"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_handleOpenAppSwitcherShortcut:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplaySceneManager", @"policyAggregator", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayPolicyAggregator", @"allowsCapability:", "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAssistantController", @"dismissAssistantViewIfNecessaryInWindowScene:", "v", "@", 0);
  [v2 validateClass:@"SBSceneManager"];
  [v2 validateClass:@"SBMainDisplaySceneManager"];
  [v2 validateClass:@"SBMainDisplaySceneManager" isKindOfClass:@"SBSceneManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"isPlaying", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"nowPlayingApplication", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBOrientationLockManager", @"isUserLocked", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBOrientationLockManager", @"lock", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBOrientationLockManager", @"unlock", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBOrientationLockManager", @"userLockOrientation", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBOrientationLockManager", @"lockOverrideEnabled", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_frontMostAppOrientation", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"addActiveOrientationObserver:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"applicationOpenURL:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"removeActiveOrientationObserver:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_toggleSearch", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", "v", "@", "B", "@?", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_setRotatableViewOrientation:duration:force:", "v", "q", "d", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVolumeControl", @"_effectiveVolumeChanged:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBVolumeControl", @"_presentVolumeHUDWithVolume:", "v", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"isVisible", "B", 0);
  [v2 validateProtocol:@"SBLockScreenCallHandling" hasRequiredInstanceMethod:@"isMakingEmergencyCall"];
  [v2 validateProtocol:@"SBLockScreenPasscodeViewPresenting" hasRequiredInstanceMethod:@"isPasscodeLockVisible"];
  [v2 validateProtocol:@"SBLockScreenEnvironment" hasRequiredInstanceMethod:@"passcodeViewPresenter"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenViewControllerBase", @"isMakingEmergencyCall", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenViewControllerBase", @"isPasscodeLockVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_activeDisplaySwitcherController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"dismissMainSwitcherWithSource:animated:", "B", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"dismissMainAndFloatingSwitchersWithSource:animated:", "B", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"canBePresented", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"allowShowTransitionSystemGesture", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"inCall", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"isEndpointOnCurrentDevice", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithPid:", "@", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"reachabilityModeActive", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPrototypeController", @"rootSettings", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBReachabilityDomain", @"rootSettings", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilitySettings", @"yOffsetFactor", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBConferenceManager", @"inFaceTime", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"presentAnimated:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"toggleReachability", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilityManager", @"setReachabilityEnabled:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"_activateApplicationFromAccessibility:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAppLayout", @"homeScreenAppLayout", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleItemContainers", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"layoutContext", "@", 0);
  [v2 validateClass:@"SBWindowScene" isKindOfClass:@"UIWindowScene"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"sceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"allScenes", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"displayIdentity", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"FBScene", @"identifier", "@", 0);
  [v2 validateClass:@"SBElasticHUDViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHUDController", @"_presentHUD:animated:", "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"unlockUIFromSource:withOptions:", "B", "i", "@", 0);
  [v2 validateClass:@"SBLockScreenUnlockRequest"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenUnlockRequest", @"setName:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenUnlockRequest", @"setSource:", "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenUnlockRequest", @"setIntent:", "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"unlockWithRequest:completion:", "B", "@", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"coverSheetViewController", "@", 0);
  [v2 validateClass:@"CSCoverSheetViewController" hasInstanceVariable:@"_scrollGestureController" withType:"CSScrollGestureController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isPasscodeEntryTransientOverlayVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isLockScreenVisible", "B", 0);
  [v2 validateClass:@"SBIconController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"floatingDockController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"presentLibraryForIconManager:windowScene:animated:", "v", "@", "@", "B", 0);
  [v2 validateClass:@"SBCoverSheetPresentationManager"];
  [v2 validateClass:@"SBCoverSheetPresentationManager" hasInstanceVariable:@"_coverSheetSlidingViewController" withType:"SBCoverSheetSlidingViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetSlidingViewController", @"systemGesturesDelegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetSystemGesturesDelegate", @"gestureRecognizerShouldBegin:", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetSystemGesturesDelegate", @"presentGestureRecognizer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetSystemGesturesDelegate", @"dismissGestureRecognizer", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBCoverSheetPresentationManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetPresentationManager", @"isVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetPresentationManager", @"setCoverSheetPresented:animated:withCompletion:", "v", "B", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetPresentationManager", @"coverSheetSlidingViewControllerIfLoaded", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"_appearState", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCoverSheetPresentationManager", @"isInSecureApp", "B", 0);
  [v2 validateClass:@"CSMainPageContentViewController"];
  [v2 validateClass:@"CSCombinedListViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"mainPageContentViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSMainPageContentViewController", @"combinedListViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionRevealHintView", @"revealHintTitle", "@", 0);
  [v2 validateClass:@"CSCombinedListViewController" hasInstanceVariable:@"_structuredListViewController" withType:"NCNotificationStructuredListViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"revealNotificationHistory:animated:", "v", "B", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"listModel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"isNotificationHistoryRevealed", "B", 0);
  [v2 validateClass:@"CSCombinedListViewController" hasInstanceVariable:@"_listPresentingContent" withType:"B"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"_allowNotificationsRevealPolicy", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"_shouldPreventNotificationHistoryRevealForActiveDNDState", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"noteMenuButtonDoublePress", "v", 0);
  [v2 validateClass:@"SBMainScreenActiveInterfaceOrientationWindow"];
  [v2 validateClass:@"SBSecureMainScreenActiveInterfaceOrientationWindow"];
  [v2 validateClass:@"SBSecureMainScreenActiveInterfaceOrientationWindow" isKindOfClass:@"SBMainScreenActiveInterfaceOrientationWindow"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainScreenActiveInterfaceOrientationWindow", @"contentViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainScreenActiveInterfaceOrientationWindow", @"initWithRole:debugName:", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainScreenActiveInterfaceOrientationWindow", @"setContentViewController:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"isShowingHomescreen", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIAlertControllerActionView", @"setHighlighted:", "v", "B", 0);
  [v2 validateClass:@"SBControlCenterController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"isPresented", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager", "@", 0);
  [v2 validateClass:@"SBHIconManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isIconDragging", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isOverlayTodayOrLibraryViewVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemGestureManager", @"isAnyTouchGestureRunning", "B", 0);
  [v2 validateClass:@"SpringBoard" hasInstanceVariable:@"_screenCapturer" withType:"SSScreenCapturer"];
  [v2 validateClass:@"SSScreenCapturer" hasInstanceVariable:@"_serviceWindow" withType:"SSScreenshotsWindow"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSScreenshotsWindow", @"_hostViewControllerIfExists", "@", 0);
  [v2 validateClass:@"SBApplication"];
  [v2 validateClass:@"SBSceneManagerCoordinator"];
  [v2 validateClass:@"SBDeviceApplicationSceneHandle"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"sceneIdentityForApplication:", "@", "@", 0);
  [v2 validateClass:@"SBMainDisplaySceneManager" isKindOfClass:@"SBSceneManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"sceneIdentityForApplication:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplaySceneManager", @"fetchOrCreateApplicationSceneHandleForRequest:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", "@", "@", "@", "@", "d", "{CGSize=dd}", "B", "Q", "Q", "q", "@", "q", "@", 0);
  [v2 validateClass:@"SBApplicationSceneHandleRequest"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationSceneHandleRequest", @"defaultRequestForApplication:sceneIdentity:displayIdentity:", "@", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneHandle", @"displayEdgeInfoForLayoutEnvironment:", "@", "q", 0);
  [v2 validateClass:@"SBSpotlightMultiplexingViewController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSpotlightMultiplexingViewController", @"sharedRemoteSearchViewController", "@", 0);
  [v2 validateClass:@"SPUIRemoteSearchViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUIRemoteSearchViewController", @"revealProgress", "d", 0);
  [v2 validateClass:@"SBVoiceControlTransientOverlayViewController"];
  [v2 validateClass:@"SBMainSwitcherWindow"];
  [v2 validateClass:@"SBWorkspace"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBWorkspace", @"mainWorkspace", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"pipCoordinator", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPControllerCoordinator", @"isAnyPictureInPictureWindowVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"bannerManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"windowSceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneManager", @"activeDisplayWindowScene", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBannerManager", @"isDisplayingBannerInWindowScene:", "B", "@", 0);
  [v2 validateClass:@"SBMainSwitcherControllerCoordinator"];
  [v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController"];
  [v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController" hasInstanceVariable:@"_topAffordanceViewController" withType:"SBTopAffordanceViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTopAffordanceViewController", @"isExpanded", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstanceIfExists", "@", 0);
  [v2 validateClass:@"SBFloatingDockController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBFloatingDockController", @"isFloatingDockSupported", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_toggleAppLibraryVisibility:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_handleSystemNotesPIPKeyShortcut:", "v", "@", 0);
  [v2 validateClass:@"SBMainDisplayLayoutState"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"peekConfiguration", "q", 0);
  [v2 validateClass:@"SBMainDisplayLayoutState" isKindOfClass:@"SBLayoutState"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneManager", @"connectedWindowScenes", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"switcherController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"isChamoisWindowingUIEnabled", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentMainAppLayout", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"leafAppLayouts", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_itemContainerForAppLayoutIfExists:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainer", @"isSelectable", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"itemsToLayoutAttributesMap", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"uniqueIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentLayoutState", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_activeDisplaySwitcherController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"contentViewController", "@", 0);
  [v2 validateClass:@"SBSystemApertureController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"systemApertureControllerForMainDisplay", "@", 0);
  [v2 validateClass:@"SBSystemApertureViewController"];
  [v2 validateClass:@"SBSystemApertureController" hasInstanceVariable:@"_systemApertureViewController" withType:"SBSystemApertureViewController"];
  [v2 validateClass:@"SAUISystemApertureManager"];
  [v2 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_systemApertureManager" withType:"SAUISystemApertureManager"];
  [v2 validateClass:@"SAUISystemApertureManager" hasInstanceVariable:@"_elementsToElementViewControllers" withType:"NSMapTable"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"_axCollapseIfExpandedByUserInteraction", "B", 0);
  [v2 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_orderedContainerViews" withType:"NSMutableArray"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemApertureViewController", @"_elementForContainerView:", "@", "@", 0);
  [v2 validateProtocol:@"SAElement" conformsToProtocol:@"SAElementIdentifying"];
  [v2 validateProtocol:@"SAElementIdentifying" hasRequiredInstanceMethod:@"clientIdentifier"];

  return 1;
}

uint64_t __47__AXSpringBoardServerHelper__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AXSpringBoardServerHelper"];
  [v2 setOverrideProcessName:@"AXSpringBoardServerHelper"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __47__AXSpringBoardServerHelper__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AXSB_UIScreenSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_UIAlertControllerActionViewSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_UIAlertControllerSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBUIWindow" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBServerHelperSBControlCenterController" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBServerVolumeControl" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBServerSBHUDController" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBServerUIApplication" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSpringBoardAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBLockScreenManager" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBReachabilityManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBApplicationSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBRestartManagerSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXCSScrollGestureControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBSceneManagerSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBAssistantControllerSafeCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBSystemNotesInteractionManager" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXSB_SBSpotlightMultiplexingViewController" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride" canInteractWithTargetClass:1];
}

- (void)_createAlertWindowSubclass
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_226EBC000, v0, v1, "Could not find SBSecureMainScreenActiveInterfaceOrientationWindow", v2, v3, v4, v5, v6);
}

- (AXSpringBoardServerHelper)init
{
  v55.receiver = self;
  v55.super_class = (Class)AXSpringBoardServerHelper;
  uint64_t v2 = [(AXSpringBoardServerHelper *)&v55 init];
  if (v2)
  {
    AXSessionIsLoginSession();
    [(AXSpringBoardServerHelper *)v2 _createAlertWindowSubclass];
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    visibleTripleClickItems = v2->_visibleTripleClickItems;
    v2->_visibleTripleClickItems = v3;

    [(AXSpringBoardServerHelper *)v2 _performValidation];
    uint64_t v5 = [MEMORY[0x263F82438] sharedApplication];
    location[1] = (id)MEMORY[0x263EF8330];
    location[2] = (id)3221225472;
    location[3] = __33__AXSpringBoardServerHelper_init__block_invoke;
    location[4] = &unk_2647F0728;
    id v6 = v5;
    id v53 = v6;
    v7 = v2;
    v54 = v7;
    AXPerformSafeBlock();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_appTransitionOccurred, @"com.apple.mobile.SubstantialTransition", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    notificationObservers = v7->_notificationObservers;
    v7->_notificationObservers = v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    v12 = [MEMORY[0x263F08A48] currentQueue];
    v13 = [v11 addObserverForName:@"SBOrientationLockChangedNotification" object:0 queue:v12 usingBlock:&__block_literal_global_1702];

    [(NSMutableArray *)v7->_notificationObservers addObject:v13];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    v15 = [MEMORY[0x263F08A48] currentQueue];
    v16 = [v14 addObserverForName:@"SBMediaNowPlayingChangedNotification" object:0 queue:v15 usingBlock:&__block_literal_global_1704];

    [(NSMutableArray *)v7->_notificationObservers addObject:v16];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v18 = *MEMORY[0x263F796F8];
    v19 = [MEMORY[0x263F08A48] currentQueue];
    v20 = [v17 addObserverForName:v18 object:0 queue:v19 usingBlock:&__block_literal_global_1706];

    [(NSMutableArray *)v7->_notificationObservers addObject:v20];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *MEMORY[0x263F79700];
    v23 = [MEMORY[0x263F08A48] currentQueue];
    v24 = [v21 addObserverForName:v22 object:0 queue:v23 usingBlock:&__block_literal_global_1708];

    [(NSMutableArray *)v7->_notificationObservers addObject:v24];
    v25 = [MEMORY[0x263F08A00] defaultCenter];
    v26 = [MEMORY[0x263F08A48] currentQueue];
    v27 = [v25 addObserverForName:@"AXVisualAlertEvent" object:0 queue:v26 usingBlock:&__block_literal_global_1713];

    [(NSMutableArray *)v7->_notificationObservers addObject:v27];
    v28 = [MEMORY[0x263F08A00] defaultCenter];
    v29 = [MEMORY[0x263F08A48] currentQueue];
    v30 = [v28 addObserverForName:@"AXVisualAlertEventEnded" object:0 queue:v29 usingBlock:&__block_literal_global_1728];

    [(NSMutableArray *)v7->_notificationObservers addObject:v30];
    v31 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v32 = *MEMORY[0x263F796D8];
    v33 = [MEMORY[0x263F08A48] currentQueue];
    v34 = [v31 addObserverForName:v32 object:0 queue:v33 usingBlock:&__block_literal_global_1731];

    [(NSMutableArray *)v7->_notificationObservers addObject:v34];
    objc_initWeak(location, v7);
    v35 = [MEMORY[0x263F08A00] defaultCenter];
    v36 = [MEMORY[0x263F08A48] currentQueue];
    uint64_t v37 = *MEMORY[0x263F796E0];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __33__AXSpringBoardServerHelper_init__block_invoke_3_1732;
    v50[3] = &unk_2647F0810;
    objc_copyWeak(&v51, location);
    v38 = [v35 addObserverForName:v37 object:0 queue:v36 usingBlock:v50];

    [(NSMutableArray *)v7->_notificationObservers addObject:v38];
    v39 = objc_alloc_init(AXSpringBoardServerAlertManager);
    [(AXSpringBoardServerHelper *)v7 setAlertManager:v39];

    id v40 = +[AXSBHearingAidDeviceController sharedController];
    id v41 = objc_alloc_init(MEMORY[0x263F220E0]);
    v42 = [MEMORY[0x263EFFA08] setWithObject:&unk_26DB1FEC0];
    [v41 setAllowedTrackingTypes:v42];

    uint64_t v43 = [objc_alloc(MEMORY[0x263F220E8]) initWithConfiguration:v41];
    motionTrackingInputManager = v7->_motionTrackingInputManager;
    v7->_motionTrackingInputManager = (AXSSMotionTrackingInputManager *)v43;

    v45 = [(AXSpringBoardServerHelper *)v7 motionTrackingInputManager];
    [v45 setDelegate:v7];

    v46 = [(AXSpringBoardServerHelper *)v7 motionTrackingInputManager];
    [v46 startMonitoring];

    [(AXSpringBoardServerHelper *)v7 _monitorContinuityDisplayChanges];
    v49 = v7;
    AXPerformBlockOnMainThreadAfterDelay();
    v47 = v49;

    objc_destroyWeak(&v51);
    objc_destroyWeak(location);
  }
  return v2;
}

uint64_t __33__AXSpringBoardServerHelper_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addActiveOrientationObserver:*(void *)(a1 + 40)];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_2()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:2];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_3()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:5];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_4()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:2];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_5()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:1];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_6(uint64_t a1, void *a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  v13[0] = @"bundleId";
  uint64_t v4 = [v2 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"bundleId"];
  id v6 = (void *)v5;
  v7 = &stru_26DB17D90;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v13[1] = @"visualAlertType";
  v14[0] = v7;
  v8 = [v2 userInfo];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"visualAlertType"];
  v10 = (void *)v9;
  v11 = &unk_26DB1FEA8;
  if (v9) {
    v11 = (void *)v9;
  }
  v14[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v3 springBoardActionOccurred:9 withPayload:v12];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_1726()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:10 withPayload:0];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_2_1729()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:8];
}

void __33__AXSpringBoardServerHelper_init__block_invoke_3_1732(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained sideAppManager];
  char v3 = [v2 isDisplayingApp];

  if ((v3 & 1) == 0)
  {
    id v4 = +[_AXSpringBoardServerInstance springBoardServerInstance];
    [v4 springBoardActionOccurred:3];
  }
}

uint64_t __33__AXSpringBoardServerHelper_init__block_invoke_1740(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreSecurePayFeaturesIfNeeded];
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __36__AXSpringBoardServerHelper_dealloc__block_invoke;
  v21 = &unk_2647F0728;
  id v4 = v3;
  id v22 = v4;
  v23 = self;
  AXPerformSafeBlock();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_notificationObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        v11 = [MEMORY[0x263F08A00] defaultCenter];
        [v11 removeObserver:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v7);
  }

  v12 = [(AXSpringBoardServerHelper *)self motionTrackingInputManager];
  [v12 stopMonitoring];

  v13.receiver = self;
  v13.super_class = (Class)AXSpringBoardServerHelper;
  [(AXSpringBoardServerHelper *)&v13 dealloc];
}

uint64_t __36__AXSpringBoardServerHelper_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeActiveOrientationObserver:*(void *)(a1 + 40)];
}

- (AXSpringBoardServerSideAppManager)sideAppManager
{
  return +[AXSpringBoardServerSideAppManager sharedInstance];
}

- (void)_restoreSecurePayFeaturesIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226EBC000, v0, v1, "Error unarchiving data blob for secure pay: %@", v2, v3, v4, v5, v6);
}

+ (id)_uiController
{
  uint64_t v2 = (void *)_uiController_AX_SBUIController;
  if (!_uiController_AX_SBUIController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbuicontroller.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = (void *)_uiController_AX_SBUIController;
    _uiController_AX_SBUIController = v3;

    uint64_t v2 = (void *)_uiController_AX_SBUIController;
  }
  return v2;
}

+ (id)_globalIdleTimeCoordinator
{
  uint64_t v2 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
  if (!_globalIdleTimeCoordinator_AX_SBIdleTimeController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbidletimerglo.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
    _globalIdleTimeCoordinator_AX_SBIdleTimeController = v3;

    uint64_t v2 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
  }
  return v2;
}

+ (id)_backlightController
{
  uint64_t v2 = (void *)_backlightController_AX_SBBacklightController;
  if (!_backlightController_AX_SBBacklightController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbbacklightcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
    uint64_t v4 = (void *)_backlightController_AX_SBBacklightController;
    _backlightController_AX_SBBacklightController = v3;

    uint64_t v2 = (void *)_backlightController_AX_SBBacklightController;
  }
  return v2;
}

+ (id)_awayController
{
  uint64_t v2 = (void *)_awayController_AX_LockScreenController;
  if (!_awayController_AX_LockScreenController)
  {
    uint64_t v3 = AXSBLockScreenViewController();
    uint64_t v4 = (void *)_awayController_AX_LockScreenController;
    _awayController_AX_LockScreenController = v3;

    NSClassFromString(&cfstr_Sblockscreenvi.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v2 = (void *)_awayController_AX_LockScreenController;
    if ((isKindOfClass & 1) == 0)
    {
      _awayController_AX_LockScreenController = 0;

      uint64_t v2 = (void *)_awayController_AX_LockScreenController;
    }
  }
  return v2;
}

+ (id)_lockScreenManager
{
  uint64_t v2 = (void *)_lockScreenManager_AX_SBLockScreenManager;
  if (!_lockScreenManager_AX_SBLockScreenManager)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstanceIfExists"];
    uint64_t v4 = (void *)_lockScreenManager_AX_SBLockScreenManager;
    _lockScreenManager_AX_SBLockScreenManager = v3;

    uint64_t v2 = (void *)_lockScreenManager_AX_SBLockScreenManager;
  }
  return v2;
}

+ (id)_iconController
{
  uint64_t v2 = (void *)_iconController_AX_SBIconController;
  if (!_iconController_AX_SBIconController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = (void *)_iconController_AX_SBIconController;
    _iconController_AX_SBIconController = v3;

    uint64_t v2 = (void *)_iconController_AX_SBIconController;
  }
  return v2;
}

+ (id)_assistantController
{
  uint64_t v2 = (void *)_assistantController_AX_SBAssistantController;
  if (!_assistantController_AX_SBAssistantController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
    uint64_t v4 = (void *)_assistantController_AX_SBAssistantController;
    _assistantController_AX_SBAssistantController = v3;

    uint64_t v2 = (void *)_assistantController_AX_SBAssistantController;
  }
  return v2;
}

+ (id)_syncController
{
  uint64_t v2 = (void *)_syncController_AX_SBSyncController;
  if (!_syncController_AX_SBSyncController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbsynccontroll.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = (void *)_syncController_AX_SBSyncController;
    _syncController_AX_SBSyncController = v3;

    uint64_t v2 = (void *)_syncController_AX_SBSyncController;
  }
  return v2;
}

+ (id)_wallpaperController
{
  uint64_t v2 = (void *)_wallpaperController_AX_SBWallpaperController;
  if (!_wallpaperController_AX_SBWallpaperController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbwallpapercon.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = (void *)_wallpaperController_AX_SBWallpaperController;
    _wallpaperController_AX_SBWallpaperController = v3;

    uint64_t v2 = (void *)_wallpaperController_AX_SBWallpaperController;
  }
  return v2;
}

+ (id)_axActiveWindowScene
{
  uint64_t v2 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"windowSceneManager"];
  uint64_t v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 safeValueForKey:@"activeDisplayWindowScene"];
  uint64_t v5 = __UIAccessibilitySafeClass();

  return v5;
}

- (void)serverInstance:(id)a3 showAlertType:(int)a4 withHandler:(id)a5 withData:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  [(AXSpringBoardServerHelper *)self dismissAlertWithCancel];
  objc_super v13 = (void *)[v12 copy];

  id alertHandler = self->_alertHandler;
  self->_id alertHandler = v13;

  long long v15 = [MEMORY[0x263F21380] mainAccessQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__AXSpringBoardServerHelper_serverInstance_showAlertType_withHandler_withData___block_invoke;
  v18[3] = &unk_2647F0838;
  int v21 = a4;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v16 = v10;
  id v17 = v11;
  [v15 performAsynchronousWritingBlock:v18];
}

uint64_t __79__AXSpringBoardServerHelper_serverInstance_showAlertType_withHandler_withData___block_invoke(uint64_t result)
{
  switch(*(_DWORD *)(result + 56))
  {
    case 0:
      return [*(id *)(result + 32) _handleTripleClickAskAlert];
    case 1:
      return [*(id *)(result + 32) _handleZoomInBuddyAlert];
    case 2:
      return [*(id *)(result + 32) _handleZoomConflictAlert:*(void *)(result + 40)];
    case 3:
      return [*(id *)(result + 32) _handleZoomTripleClickAfterConflict];
    case 4:
      return [*(id *)(result + 32) _handleSwitchUsageConfirmed];
    case 5:
      return [*(id *)(result + 32) _handleVoiceOverUsageConfirmation];
    case 6:
      return [*(id *)(result + 32) _handleTouchAccommodationsUsageConfirmed];
    case 7:
      return [*(id *)(result + 32) _handleDisableBrightnessFiltersAlert:*(void *)(result + 40)];
    case 8:
      return [*(id *)(result + 32) handleBrokenHomeButtonAlert];
    case 9:
      return [*(id *)(result + 32) _handleDisableSwitchControlConfirmation];
    case 0xA:
      return [*(id *)(result + 32) _handleDisableAssistiveTouchConfirmation];
    case 0xB:
      return [*(id *)(result + 32) _handleConfirmRebootDevice];
    case 0xC:
      return [*(id *)(result + 32) _handleVONoHomeButtonGestureAlert];
    case 0xD:
      uint64_t v1 = *(void **)(result + 32);
      uint64_t v2 = 0;
      return [v1 _handleDisallowUSBRestrictedModeVOInformativeOnly:v2];
    case 0xE:
      uint64_t v3 = *(void **)(result + 32);
      uint64_t v4 = 0;
      return [v3 _handleDisallowUSBRestrictedModeSCInformativeOnly:v4];
    case 0xF:
      uint64_t v1 = *(void **)(result + 32);
      uint64_t v2 = 1;
      return [v1 _handleDisallowUSBRestrictedModeVOInformativeOnly:v2];
    case 0x10:
      uint64_t v3 = *(void **)(result + 32);
      uint64_t v4 = 1;
      return [v3 _handleDisallowUSBRestrictedModeSCInformativeOnly:v4];
    case 0x11:
      return [*(id *)(result + 32) _handleAlwaysOnBluetoothModeForVoiceOver];
    case 0x12:
      return [*(id *)(result + 32) _handleDisableFKAConfirmation];
    case 0x13:
      return [*(id *)(result + 32) _handleASTMenuFullForInstance:*(void *)(result + 48)];
    case 0x14:
      uint64_t v5 = *(void **)(result + 32);
      uint64_t v6 = 1;
      uint64_t v7 = 0;
      goto LABEL_25;
    case 0x15:
      uint64_t v5 = *(void **)(result + 32);
      uint64_t v6 = 0;
      goto LABEL_28;
    case 0x16:
      uint64_t v5 = *(void **)(result + 32);
      uint64_t v6 = 1;
LABEL_28:
      uint64_t v7 = 1;
LABEL_25:
      result = [v5 _handleASTMenuCustomizeAddDwell:v6 addScroll:v7];
      break;
    case 0x17:
      result = [*(id *)(result + 32) _handleConnectedDevicesHaveAssistiveTouchCustomActions];
      break;
    case 0x18:
      result = [*(id *)(result + 32) _handleSecureItentAlertForSwitchAST];
      break;
    case 0x19:
      result = [*(id *)(result + 32) _handleLiveTranscriptionConfirmation];
      break;
    case 0x1A:
      result = [*(id *)(result + 32) _handleDisableOnDeviceEyeTrackingConfirmation];
      break;
    default:
      return result;
  }
  return result;
}

- (void)hideAlertWithServerInstance:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F21380], "mainAccessQueue", a3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__AXSpringBoardServerHelper_hideAlertWithServerInstance___block_invoke;
  v5[3] = &unk_2647F0648;
  v5[4] = self;
  [v4 performAsynchronousWritingBlock:v5];
}

uint64_t __57__AXSpringBoardServerHelper_hideAlertWithServerInstance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAlertController];
}

- (id)_serviceForRemoteViewType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(**((id **)&unk_2647F0E38 + a3), "sharedInstance", v3);
  }
  return v5;
}

- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5
{
}

- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5 withPreviousViewDismissal:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  uint64_t v9 = [(AXSpringBoardServerHelper *)self _serviceForRemoteViewType:a4];
  if (v9)
  {
    id v10 = [(AXSpringBoardServerHelper *)self alertManager];
    [v10 showAXUIViewService:v9 withData:v11 withPreviousViewDismissal:v6];
  }
}

- (void)serverInstance:(id)a3 hideRemoteViewType:(int64_t)a4
{
  id v6 = [(AXSpringBoardServerHelper *)self _serviceForRemoteViewType:a4];
  if (v6)
  {
    uint64_t v5 = [(AXSpringBoardServerHelper *)self alertManager];
    [v5 hideAXUIViewService:v6];
  }
}

- (BOOL)serverInstance:(id)a3 isShowingRemoteViewType:(int64_t)a4
{
  uint64_t v5 = [(AXSpringBoardServerHelper *)self _serviceForRemoteViewType:a4];
  if (v5)
  {
    id v6 = [(AXSpringBoardServerHelper *)self alertManager];
    char v7 = [v6 isShowingAXUIViewService:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)handleToggleIncomingCallWithServerInstance:(id)a3
{
  return MEMORY[0x270F09DD0](self, a2, a3);
}

- (BOOL)isVoiceControlRunningWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_isVoiceControlRunningWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_isVoiceControlRunningWithServerInstance___block_invoke(uint64_t a1)
{
  if ([NSClassFromString(&cfstr_Sbassistantcon.isa) safeBoolForKey:@"isVisible"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    if (!_UIActionSheetDismissDuration_block_invoke_SBVoiceControlOverlayClass) {
      _UIActionSheetDismissDuration_block_invoke_SBVoiceControlOverlayClass = (uint64_t)NSClassFromString(&cfstr_Sbvoicecontrol_0.isa);
    }
    id v4 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
    uint64_t v2 = [v4 safeValueForKey:@"transientOverlayPresentationManager"];
    id v3 = [v2 safeValueForKey:@"topmostPresentedViewController"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  }
}

- (double)volumeLevelWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__AXSpringBoardServerHelper_volumeLevelWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __59__AXSpringBoardServerHelper_volumeLevelWithServerInstance___block_invoke(uint64_t a1)
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&_LastVolumeDisplay >= 1.0)
  {
    uint64_t v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
    float v5 = 0.0;
    id v4 = 0;
    [v2 getActiveCategoryVolume:&v5 andName:&v4];
    id v3 = v4;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(float *)&_CurrentVolume;
  }
}

- (BOOL)isReachabilityActive
{
  uint64_t v2 = [NSClassFromString(&cfstr_Sbreachability.isa) safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeBoolForKey:@"reachabilityModeActive"];

  return v3;
}

- (void)setReachabilityActive:(BOOL)a3
{
  int v3 = a3;
  id v4 = [NSClassFromString(&cfstr_Sbreachability.isa) safeValueForKey:@"sharedInstance"];
  if ([v4 safeBoolForKey:@"_reachabilityModeActive"] == v3)
  {
    float v5 = AXLogSpringboardServer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_INFO, "reachability state same as desired change, doing nothing", buf, 2u);
    }
  }
  else
  {
    id v6 = v4;
    AXPerformSafeBlock();
    float v5 = v6;
  }
}

uint64_t __51__AXSpringBoardServerHelper_setReachabilityActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleReachability];
}

- (BOOL)isRingerMutedWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_isRingerMutedWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __61__AXSpringBoardServerHelper_isRingerMutedWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"ringerControl"];
  id v3 = __UIAccessibilitySafeClass();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 safeBoolForKey:@"_accessibilityIsRingerMuted"];
}

- (BOOL)isOrientationLockedWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AXSpringBoardServerHelper_isOrientationLockedWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __67__AXSpringBoardServerHelper_isOrientationLockedWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sborientationl_0.isa) safeValueForKey:@"sharedInstance"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 safeBoolForKey:@"isUserLocked"];
}

- (void)serverInstance:(id)a3 setOrientation:(int64_t)a4
{
}

- (void)serverInstance:(id)a3 setOrientationLocked:(BOOL)a4
{
}

void __65__AXSpringBoardServerHelper_serverInstance_setOrientationLocked___block_invoke()
{
  id v0 = [NSClassFromString(&cfstr_Sborientationl_0.isa) safeValueForKey:@"sharedInstance"];
  [v0 lock];
}

void __65__AXSpringBoardServerHelper_serverInstance_setOrientationLocked___block_invoke_2()
{
  id v0 = [NSClassFromString(&cfstr_Sborientationl_0.isa) safeValueForKey:@"sharedInstance"];
  [v0 unlock];
}

- (void)openCustomGestureCreationForASTWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __79__AXSpringBoardServerHelper_openCustomGestureCreationForASTWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE/CreateCustomGesture"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (void)openMenuCustomizationForASTWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __75__AXSpringBoardServerHelper_openMenuCustomizationForASTWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE/AssistiveTouchCustomize"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (void)openCustomGestureCreationForSCATWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __80__AXSpringBoardServerHelper_openCustomGestureCreationForSCATWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=ScannerSwitchTitle/CustomGesturesIdentifier/CreateCustomGesture"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (void)openCommandAndControlSettingsWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __77__AXSpringBoardServerHelper_openCommandAndControlSettingsWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=CommandAndControlTitle"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (void)openCommandAndControlCommandsWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __77__AXSpringBoardServerHelper_openCommandAndControlCommandsWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=CommandAndControlTitle/COMMAND_AND_CONTROL_COMMANDS"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (void)openCommandAndControlVocabularyWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __79__AXSpringBoardServerHelper_openCommandAndControlVocabularyWithServerInstance___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v1 = (id)[objc_alloc(NSURL) initWithString:@"prefs:root=ACCESSIBILITY&path=CommandAndControlTitle/COMMAND_AND_CONTROL_VOCABULARY/VOCABULARY"];
    [(id)*MEMORY[0x263F83300] applicationOpenURL:v1];
  }
}

- (BOOL)isScreenLockedWithServerInstance:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F22968], "server", a3);
  char v4 = [v3 isScreenLockedWithPasscode:0];

  return v4;
}

- (BOOL)isCarPlayConnected
{
  carSessionStatus = self->_carSessionStatus;
  if (!carSessionStatus)
  {
    char v4 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x263F30E50]);
    float v5 = self->_carSessionStatus;
    self->_carSessionStatus = v4;

    carSessionStatus = self->_carSessionStatus;
  }
  id v6 = [(CARSessionStatus *)carSessionStatus currentSession];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)isSystemSleepingWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  float v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__AXSpringBoardServerHelper_isSystemSleepingWithServerInstance___block_invoke;
  v7[3] = &unk_2647F06D8;
  v7[4] = self;
  void v7[5] = &v8;
  [v5 performSynchronousReadingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __64__AXSpringBoardServerHelper_isSystemSleepingWithServerInstance___block_invoke(uint64_t a1)
{
  SBAXBacklightControllerInstance();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 safeBoolForKey:@"screenIsOn"]) {
    char v2 = 0;
  }
  else {
    char v2 = [*(id *)(a1 + 32) isCarPlayConnected] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (BOOL)isMakingEmergencyCallWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_isMakingEmergencyCallWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_isMakingEmergencyCallWithServerInstance___block_invoke(uint64_t a1)
{
  AXSBLockScreenEnvironment();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  char v2 = [v3 safeValueForKey:@"callController"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 safeBoolForKey:@"isMakingEmergencyCall"];
}

- (BOOL)isPasscodeRequiredOnLockWithServerInstance:(id)a3
{
  BOOL v5 = 0;
  id v3 = objc_msgSend(MEMORY[0x263F22968], "server", a3);
  [v3 isScreenLockedWithPasscode:&v5];

  return v5;
}

- (void)isMediaPlayingWithServerInstance:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (isMediaPlayingWithServerInstance_forBundleId_completion__onceToken != -1) {
    dispatch_once(&isMediaPlayingWithServerInstance_forBundleId_completion__onceToken, &__block_literal_global_1796);
  }
  MRMediaRemoteGetLocalOrigin();
  char v10 = v6;
  char v11 = v7;
  id v8 = v7;
  id v9 = v6;
  MRMediaRemoteGetNowPlayingClientForOrigin();
}

uint64_t __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke()
{
  isMediaPlayingWithServerInstance_forBundleId_completion__queue = (uint64_t)dispatch_queue_create("media-retrieval-ax-queue", 0);
  return MEMORY[0x270F9A758]();
}

void __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = MRNowPlayingClientGetBundleIdentifier();
    if (([v4 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
      || [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F21340]]
      && (([v4 hasPrefix:*MEMORY[0x263F21360]] & 1) != 0
       || ([v4 hasPrefix:*MEMORY[0x263F21368]] & 1) != 0)
      || ![*(id *)(a1 + 32) length])
    {
      MRMediaRemoteGetLocalOrigin();
      id v5 = *(id *)(a1 + 40);
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke_3(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)resetDimTimerWithServerInstance:(id)a3
{
}

uint64_t __61__AXSpringBoardServerHelper_resetDimTimerWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __61__AXSpringBoardServerHelper_resetDimTimerWithServerInstance___block_invoke_2()
{
  id v0 = [(id)objc_opt_class() _globalIdleTimeCoordinator];
  [v0 resetIdleTimerForReason:@"AccessibilityTimerReset"];
}

- (void)openAppSwitcherWithServerInstance:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_DEFAULT, "AXSBServer handling openAppSwitcher", buf, 2u);
  }

  id v5 = [NSClassFromString(&cfstr_Sbsystemgestur.isa) safeValueForKey:@"mainDisplayManager"];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v17 = 0;
  id v6 = v5;
  AXPerformSafeBlock();
  BOOL v7 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;

  _Block_object_dispose(buf, 8);
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v17 = 0;
    id v15 = v6;
    AXPerformSafeBlock();
    BOOL v8 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  id v9 = [MEMORY[0x263F22838] server];
  uint64_t v10 = [v9 isGuidedAccessActive];

  if (v10 | !v8)
  {
    char v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [NSNumber numberWithBool:v10];
      objc_super v13 = [NSNumber numberWithBool:v8];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_226EBC000, v11, OS_LOG_TYPE_DEFAULT, "AXSBServer: will not perform openAppSwitcher. gaxActive=%@ generallyAllowed=%@", buf, 0x16u);
    }
  }
  else
  {
    id v14 = v3;
    AXPerformBlockOnMainThread();
  }
}

uint64_t __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGestureWithTypeAllowed:45];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGestureWithTypeAllowed:2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_1804(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)])
  {
    id v1 = AXLogCommon();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v2 = 0;
      _os_log_impl(&dword_226EBC000, v1, OS_LOG_TYPE_DEFAULT, "AXSBServer: will not perform openAppSwitcher. screen appears to be locked", v2, 2u);
    }
  }
  else
  {
    AXPerformSafeBlock();
  }
}

void __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_2_1805()
{
  id v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v2 = 0;
    _os_log_impl(&dword_226EBC000, v0, OS_LOG_TYPE_DEFAULT, "AXSBServer: Will ask app to invoke _handleOpenAppSwitcherShortcut: to reveal app switcher", v2, 2u);
  }

  id v1 = [MEMORY[0x263F82438] sharedApplication];
  [v1 _handleOpenAppSwitcherShortcut:0];
}

- (void)simulateEdgePressHaptics:(id)a3
{
}

void __54__AXSpringBoardServerHelper_simulateEdgePressHaptics___block_invoke()
{
  id v0 = [MEMORY[0x263F82670] currentDevice];
  id v1 = [v0 _tapticEngine];
  [v1 actuateFeedback:0];

  id v3 = [MEMORY[0x263F82670] currentDevice];
  char v2 = [v3 _tapticEngine];
  [v2 actuateFeedback:1];
}

- (void)toggleAppLibraryWithServerInstance:(id)a3
{
}

void __64__AXSpringBoardServerHelper_toggleAppLibraryWithServerInstance___block_invoke()
{
  if ([NSClassFromString(&cfstr_Sbfloatingdock.isa) safeBoolForKey:@"isFloatingDockSupported"])
  {
    id v0 = (void *)*MEMORY[0x263F83300];
    [v0 _toggleAppLibraryVisibility:0];
  }
  else
  {
    id v3 = [(id)objc_opt_class() _iconController];
    id v1 = [v3 safeValueForKey:@"iconManager"];
    char v2 = +[AXSpringBoardServerHelper _axActiveWindowScene];
    [v3 presentLibraryForIconManager:v1 windowScene:v2 animated:1];
  }
}

- (void)toggleQuickNoteWithServerInstance:(id)a3
{
}

uint64_t __63__AXSpringBoardServerHelper_toggleQuickNoteWithServerInstance___block_invoke()
{
  return [(id)*MEMORY[0x263F83300] _handleSystemNotesPIPKeyShortcut:0];
}

- (BOOL)dismissSiriWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  AXPerformBlockOnMainThread();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __59__AXSpringBoardServerHelper_dismissSiriWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __59__AXSpringBoardServerHelper_dismissSiriWithServerInstance___block_invoke_2(uint64_t a1)
{
  id v3 = +[AXSpringBoardServerHelper _assistantController];
  char v2 = +[AXSpringBoardServerHelper _axActiveWindowScene];
  [v3 dismissAssistantViewIfNecessaryInWindowScene:v2];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (void)openVoiceControlWithServerInstance:(id)a3
{
  id v4 = [NSClassFromString(&cfstr_Sbvoicecontrol.isa) safeValueForKey:@"sharedInstance"];
  if ((-[objc_class safeBoolForKey:](NSClassFromString(&cfstr_Sbvoicecontrol.isa), "safeBoolForKey:", @"isVisible") & 1) == 0)id v3 = (id)[v4 safeValueForKey:@"handleHomeButtonHeld"]; {
}
  }

- (void)openTypeToSiriWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v4 = (void *)getSiriSimpleActivationSourceClass_softClass;
  uint64_t v11 = getSiriSimpleActivationSourceClass_softClass;
  if (!getSiriSimpleActivationSourceClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getSiriSimpleActivationSourceClass_block_invoke;
    v7[3] = &unk_2647F0860;
    v7[4] = &v8;
    __getSiriSimpleActivationSourceClass_block_invoke((uint64_t)v7);
    id v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  id v6 = objc_alloc_init(v5);
  [v6 activateFromSource:47];
}

- (void)armApplePayWithServerInstance:(id)a3
{
}

void __59__AXSpringBoardServerHelper_armApplePayWithServerInstance___block_invoke()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v7 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPKPassLibraryClass_block_invoke;
    v3[3] = &unk_2647F0860;
    v3[4] = &v4;
    __getPKPassLibraryClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  char v2 = [v1 sharedInstance];
  [v2 presentContactlessInterfaceForDefaultPassFromSource:0 completion:0];
}

- (BOOL)isScreenshotWindowVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  AXPerformBlockOnMainThread();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

void __73__AXSpringBoardServerHelper_isScreenshotWindowVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char v2 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"_screenCapturer"];
  id v3 = [v2 safeValueForKey:@"_serviceWindow"];
  char v4 = [v3 safeValueForKey:@"_hostViewControllerIfExists"];
  id v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 view];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _SBAXIsViewVisible(v6);
}

- (BOOL)isNotificationVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  AXPerformBlockOnMainThread();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __69__AXSpringBoardServerHelper_isNotificationVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessibilityIsNotificationVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isBannerVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  AXPerformBlockOnMainThread();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __63__AXSpringBoardServerHelper_isBannerVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessibilityIsBannerVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLongLookNotificationVisibleWithServerInstance:(id)a3
{
  id v3 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"notificationDispatcher"];
  char v4 = [v3 safeValueForKey:@"bannerDestination"];
  if ([v4 safeBoolForKey:@"isPresentingBannerInLongLook"])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 safeValueForKey:@"dashBoardDestination"];
    char v5 = [v6 safeBoolForKey:@"isPresentingNotificationInLongLook"];
  }
  return v5;
}

- (BOOL)isRemoteTransientOverlayVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  AXPerformBlockOnMainThread();
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __79__AXSpringBoardServerHelper_isRemoteTransientOverlayVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessibilityIsRemoteTransientOverlayVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)toggleNotificationCenterWithServerInstance:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

uint64_t __72__AXSpringBoardServerHelper_toggleNotificationCenterWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  char v2 = AXLogSpringboardServer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) isNotificationCenterVisibleWithServerInstance:*(void *)(a1 + 40)];
    v5[0] = 67109120;
    v5[1] = v3 ^ 1;
    _os_log_impl(&dword_226EBC000, v2, OS_LOG_TYPE_INFO, "toggle NC: will show %d", (uint8_t *)v5, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityShowNotificationCenter:serverInstance:", objc_msgSend(*(id *)(a1 + 32), "isNotificationCenterVisibleWithServerInstance:", *(void *)(a1 + 40)) ^ 1, *(void *)(a1 + 40));
}

- (BOOL)isNotificationCenterVisibleWithServerInstance:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__AXSpringBoardServerHelper_isNotificationCenterVisibleWithServerInstance___block_invoke;
  v11[3] = &unk_2647F08D8;
  v11[4] = self;
  objc_super v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  [v5 performSynchronousReadingBlock:v11];

  uint64_t v7 = AXLogSpringboardServer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)buf = 67109120;
    int v19 = v8;
    _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_INFO, "NC center is visible: %d", buf, 8u);
  }

  BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __75__AXSpringBoardServerHelper_isNotificationCenterVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) coverSheetViewController];
  char v2 = [v10 safeValueForKey:@"mainPageContentViewController"];
  int v3 = [v2 safeValueForKey:@"combinedListViewController"];
  id v4 = [v3 safeValueForKey:@"_structuredListViewController"];
  char v5 = [v4 safeValueForKey:@"listModel"];
  char v6 = [v5 safeBoolForKey:@"isNotificationHistoryRevealed"];

  if ([*(id *)(a1 + 32) isCoverSheetVisibleWithServerInstance:*(void *)(a1 + 40)]
    && (v6 & 1) != 0)
  {
    uint64_t v7 = [v10 safeValueForKey:@"coverSheetView"];
    int v8 = [v7 safeValueForKey:@"scrollView"];
    uint64_t v9 = [v8 safeUnsignedIntegerForKey:@"currentPageIndex"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 == [v10 safeUnsignedIntegerForKey:@"_indexOfMainPage"];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)isCoverSheetVisibleWithServerInstance:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__AXSpringBoardServerHelper_isCoverSheetVisibleWithServerInstance___block_invoke;
  v10[3] = &unk_2647F0900;
  v10[4] = self;
  v10[5] = &v11;
  [v5 performSynchronousReadingBlock:v10];

  char v6 = AXLogSpringboardServer();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *((unsigned __int8 *)v12 + 24);
    *(_DWORD *)buf = 67109120;
    int v16 = v7;
    _os_log_impl(&dword_226EBC000, v6, OS_LOG_TYPE_INFO, "CS is visible: %d", buf, 8u);
  }

  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __67__AXSpringBoardServerHelper_isCoverSheetVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _accessibilityCoverSheetPresentationManagerSharedInstance];
  char v2 = [v3 safeValueForKey:@"coverSheetSlidingViewControllerIfLoaded"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 safeIntForKey:@"_appearState"] != 0;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 safeBoolForKey:@"isInSecureApp"] ^ 1;
  }
}

- (BOOL)serverInstance:(id)a3 showNotificationCenter:(BOOL)a4
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v8 = v4;
  uint64_t v9 = v5;
  AXPerformBlockOnMainThread();
  dispatch_semaphore_wait(v9, 5uLL);

  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v6;
}

intptr_t __67__AXSpringBoardServerHelper_serverInstance_showNotificationCenter___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _accessibilityShowNotificationCenter:*(unsigned __int8 *)(a1 + 64) serverInstance:*(void *)(a1 + 40)];
  char v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (void)serverInstance:(id)a3 setReachabilityEnabled:(BOOL)a4
{
}

void __67__AXSpringBoardServerHelper_serverInstance_setReachabilityEnabled___block_invoke(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sbreachability.isa) safeValueForKey:@"sharedInstance"];
  [v2 setReachabilityEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)serverInstance:(id)a3 showControlCenter:(BOOL)a4
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v7 = dispatch_semaphore_create(0);
  AXPerformBlockOnMainThread();
  dispatch_semaphore_wait(v7, 5uLL);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

intptr_t __62__AXSpringBoardServerHelper_serverInstance_showControlCenter___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) accessibilityShowControlCenter:*(unsigned __int8 *)(a1 + 56)];
  id v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (BOOL)isControlCenterVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_isControlCenterVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_isControlCenterVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstanceIfExists"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 safeBoolForKey:@"isPresented"];
}

- (void)toggleDockWithServerInstance:(id)a3
{
  id v4 = a3;
  if (![(AXSpringBoardServerHelper *)self isScreenLockedWithServerInstance:v4])
  {
    char v5 = [MEMORY[0x263F22838] server];
    int v6 = [v5 isGuidedAccessActive];

    if (v6)
    {
      uint64_t v7 = GAXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_DEFAULT, "Can't toggle dock. GAX is active.", buf, 2u);
      }
    }
    else
    {
      id v8 = v4;
      AXPerformBlockOnMainThread();
    }
  }
}

void __58__AXSpringBoardServerHelper_toggleDockWithServerInstance___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
}

void __58__AXSpringBoardServerHelper_toggleDockWithServerInstance___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _axFloatingDockController];
  if ([v2 safeBoolForKey:@"_allowGestureRecognizers"])
  {
    if ([*(id *)(a1 + 32) isDockVisibleWithServerInstance:*(void *)(a1 + 40)]) {
      [v2 dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
    }
    else {
      [v2 presentFloatingDockIfDismissedAnimated:1 completionHandler:0];
    }
  }
}

- (BOOL)isStatusBarNativeFocusableWithServerInstance:(id)a3 includingNonDismissableElements:(BOOL)a4
{
  if (!_AXSApplicationAccessibilityEnabled()) {
    return 0;
  }
  if (!isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility)
  {
    char v5 = [MEMORY[0x263F82438] sharedApplication];
    isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility = objc_opt_respondsToSelector() & 1;

    if (!isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility) {
      return 0;
    }
  }
  int v6 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v7 = [v6 _accessibilityStatusBarElements:0 sorted:0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__AXSpringBoardServerHelper_isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements___block_invoke;
  v11[3] = &__block_descriptor_33_e11_B24__0_8Q16l;
  BOOL v12 = a4;
  id v8 = [v7 axFilterObjectsUsingBlock:v11];

  BOOL v9 = [v8 count] != 0;
  return v9;
}

BOOL __106__AXSpringBoardServerHelper_isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 _accessibilityIsNonDismissableStatusBarElement];
  uint64_t v5 = [v3 accessibilityRespondsToUserInteraction];

  if (v5 && v4) {
    return *(unsigned char *)(a1 + 32) != 0;
  }
  return v5;
}

- (BOOL)isSiriVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_isSiriVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __61__AXSpringBoardServerHelper_isSiriVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeBoolForKey:@"isVisible"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_axFloatingDockController
{
  id v2 = +[AXSpringBoardServerHelper _axActiveWindowScene];
  id v3 = [v2 safeValueForKey:@"floatingDockController"];

  return v3;
}

- (BOOL)isDockVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  char v5 = 0;
  AXSessionIsLoginSession();

  return 0;
}

void __61__AXSpringBoardServerHelper_isDockVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _axFloatingDockController];
  if ([v3 safeBoolForKey:@"isFloatingDockFullyPresented"]) {
    char v2 = 1;
  }
  else {
    char v2 = [v3 safeBoolForKey:@"isPresentingFolder"];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (BOOL)isShowingNonSystemAppWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__AXSpringBoardServerHelper_isShowingNonSystemAppWithServerInstance___block_invoke;
  v8[3] = &unk_2647F09B8;
  char v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [v5 performSynchronousReadingBlock:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

uint64_t __69__AXSpringBoardServerHelper_isShowingNonSystemAppWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isShowingHomescreenWithServerInstance:*(void *)(a1 + 40)];
  if ((result & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)],
        (result & 1) != 0)
    || (uint64_t result = [*(id *)(a1 + 32) isSystemAppShowingAnAlertWithServerInstance:*(void *)(a1 + 40)],
        (result & 1) != 0)
    || (uint64_t result = [*(id *)(a1 + 32) isControlCenterVisibleWithServerInstance:*(void *)(a1 + 40)],
        (result & 1) != 0))
  {
    char v3 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isAppSwitcherVisibleWithServerInstance:*(void *)(a1 + 40)];
    char v3 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)isPasscodeLockVisibleWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__AXSpringBoardServerHelper_isPasscodeLockVisibleWithServerInstance___block_invoke;
  v7[3] = &unk_2647F06D8;
  v7[4] = self;
  void v7[5] = &v8;
  [v5 performSynchronousReadingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __69__AXSpringBoardServerHelper_isPasscodeLockVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isPasscodeLockVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLockScreenVisibleWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_isLockScreenVisibleWithServerInstance___block_invoke;
  v7[3] = &unk_2647F06D8;
  v7[4] = self;
  void v7[5] = &v8;
  [v5 performSynchronousReadingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __67__AXSpringBoardServerHelper_isLockScreenVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isLockScreenVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isShowingHomescreenWithServerInstance:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServerHelper *)self isSystemAppShowingAnAlertWithServerInstance:v4])
  {
    char v5 = AXFrontBoardSystemAppAlertWindow();
    NSClassFromString(&cfstr_Sbhomescreenwi.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  BOOL v7 = [(AXSpringBoardServerHelper *)self isAppSwitcherPeekingWithServerInstance:v4];
  char v8 = [(id)*MEMORY[0x263F83300] safeBoolForKey:@"isShowingHomescreen"] & isKindOfClass | v7;

  return v8;
}

- (BOOL)isContinuitySessionActiveWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__AXSpringBoardServerHelper_isContinuitySessionActiveWithServerInstance___block_invoke;
  v7[3] = &unk_2647F06D8;
  v7[4] = self;
  void v7[5] = &v8;
  [v5 performSynchronousReadingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __73__AXSpringBoardServerHelper_isContinuitySessionActiveWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) contintuityDisplayIsActive];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_monitorContinuityDisplayChanges
{
  char v3 = [MEMORY[0x263F3F738] configurationForContinuityDisplay];
  [v3 setNeedsUserInteractivePriority:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __61__AXSpringBoardServerHelper__monitorContinuityDisplayChanges__block_invoke;
  v5[3] = &unk_2647F09E0;
  v5[4] = self;
  [v3 setTransitionHandler:v5];
  id v4 = [MEMORY[0x263F3F728] monitorWithConfiguration:v3];
  [(AXSpringBoardServerHelper *)self setContinuityDisplayMonitor:v4];
}

void __61__AXSpringBoardServerHelper__monitorContinuityDisplayChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4 != 0;
  int v6 = v5 ^ [*(id *)(a1 + 32) contintuityDisplayIsActive];
  [*(id *)(a1 + 32) setContintuityDisplayIsActive:v5];
  BOOL v7 = AXLogSpringboardServer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"NO";
    if (v4) {
      uint64_t v8 = @"YES";
    }
    int v10 = 138412290;
    char v11 = v8;
    _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_INFO, "Continuity state changed, is active: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F8B180], 0, 0, 1u);
  }
}

- (BOOL)isTypeToSiriVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AXSpringBoardServerHelper_isTypeToSiriVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __67__AXSpringBoardServerHelper_isTypeToSiriVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v9 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
  char v2 = [v9 safeValueForKey:@"currentSession"];
  id v3 = [v2 safeValueForKey:@"presentationContext"];

  int v4 = [v9 safeBoolForKey:@"isSystemAssistantExperienceEnabled"];
  int v5 = [v3 safeBoolForKey:@"isAssistantPresented"];
  int v6 = [v3 safeIntForKey:@"modality"];
  char v7 = [v3 safeBoolForKey:@"isKeyboardVisible"];
  if (v6 == 2) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  if (!v5) {
    char v8 = 0;
  }
  if (!v4) {
    char v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
}

- (BOOL)isAppSwitcherVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerHelper_isAppSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __68__AXSpringBoardServerHelper_isAppSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 safeBoolForKey:@"isAnySwitcherVisible"];
}

- (BOOL)isAppSwitcherPeekingWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerHelper_isAppSwitcherPeekingWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __68__AXSpringBoardServerHelper_isAppSwitcherPeekingWithServerInstance___block_invoke(uint64_t a1)
{
  id v3 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  id v2 = [v3 safeValueForKeyPath:@"_activeDisplaySwitcherController._currentLayoutState"];
  if ((unint64_t)[v2 safeIntegerForKey:@"peekConfiguration"] >= 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)isShelfSwitcherVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_isShelfSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_isShelfSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v4 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  id v2 = [v4 safeValueForKeyPath:@"_activeDisplaySwitcherController.contentViewController"];
  id v3 = [v2 safeDictionaryForKey:@"visibleShelves"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] != 0;
}

- (BOOL)isStageManagerSwitcherVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__AXSpringBoardServerHelper_isStageManagerSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __77__AXSpringBoardServerHelper_isStageManagerSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v17 = 0;
  id v1 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"windowSceneManager"];
  id v2 = __UIAccessibilitySafeClass();

  uint64_t v12 = v2;
  [v2 safeSetForKey:@"connectedWindowScenes"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) safeValueForKey:@"switcherController"];
        if ([v8 safeBoolForKey:@"isChamoisWindowingUIEnabled"])
        {
          uint64_t v9 = [v8 safeValueForKey:@"_currentLayoutState"];
          uint64_t v10 = [v9 safeIntegerForKey:@"unlockedEnvironmentMode"];

          if (v10 == 3)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;

            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)dismissAppSwitcherWithServerInstance:(id)a3
{
}

uint64_t __66__AXSpringBoardServerHelper_dismissAppSwitcherWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __66__AXSpringBoardServerHelper_dismissAppSwitcherWithServerInstance___block_invoke_2()
{
  id v0 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKeyPath:@"sharedInstance._activeDisplaySwitcherController"];
  [v0 dismissMainAndFloatingSwitchersWithSource:18 animated:1];
}

- (void)dismissShelfSwitcherWithServerInstance:(id)a3
{
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_2()
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v15 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  id v0 = [v15 safeValueForKeyPath:@"_activeDisplaySwitcherController.contentViewController"];
  id v1 = [v0 safeDictionaryForKey:@"visibleShelves"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = [v1 allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * v6);
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        id v22 = __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_3;
        v23 = &unk_2647F0648;
        uint64_t v24 = v7;
        AXPerformSafeBlock();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v8 = AXUIApplicationWindows();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        NSClassFromString(&cfstr_Sbmainswitcher_0.isa);
        if (objc_opt_isKindOfClass())
        {
          long long v14 = [v13 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_1875];
          [v14 enumerateObjectsUsingBlock:&__block_literal_global_1878];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v29 count:16];
    }
    while (v10);
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissShelfForAccessibilityTransition];
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbmedusadecora.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 _accessibilityViewController];
  id v2 = [v3 safeValueForKey:@"_topAffordanceViewController"];
  if ([v2 safeBoolForKey:@"isExpanded"]) {
    [v2 dismissAnimated:1];
  }
}

- (BOOL)isSyncingRestoringResettingOrUpdatingWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__AXSpringBoardServerHelper_isSyncingRestoringResettingOrUpdatingWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __85__AXSpringBoardServerHelper_isSyncingRestoringResettingOrUpdatingWithServerInstance___block_invoke(uint64_t a1)
{
  id v3 = [NSClassFromString(&cfstr_Sbsynccontroll.isa) safeValueForKey:@"sharedInstance"];
  id v2 = [v3 safeValueForKey:@"isInUse"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)isSystemGestureActiveWithServerInstance:(id)a3
{
  id v3 = [(id)objc_opt_class() _iconController];
  uint64_t v4 = [v3 safeValueForKey:@"iconManager"];
  if ([v4 safeBoolForKey:@"isIconDragging"])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [NSClassFromString(&cfstr_Sbsystemgestur.isa) safeValueForKey:@"mainDisplayManager"];
    char v5 = [v6 safeBoolForKey:@"isAnyTouchGestureRunning"];
  }
  return v5;
}

- (BOOL)isSpeakThisTemporarilyDisabledWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__AXSpringBoardServerHelper_isSpeakThisTemporarilyDisabledWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __78__AXSpringBoardServerHelper_isSpeakThisTemporarilyDisabledWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [(id)*MEMORY[0x263F83300] delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 _accessibilityIsSpeakThisTemporarilyDisabled];
}

- (BOOL)areSystemGesturesDisabledNativelyWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__AXSpringBoardServerHelper_areSystemGesturesDisabledNativelyWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __81__AXSpringBoardServerHelper_areSystemGesturesDisabledNativelyWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 _accessibilityIsSystemGestureActive];
  }
}

- (BOOL)areSystemGesturesDisabledByAccessibilityWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__AXSpringBoardServerHelper_areSystemGesturesDisabledByAccessibilityWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __88__AXSpringBoardServerHelper_areSystemGesturesDisabledByAccessibilityWithServerInstance___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 _accessibilitySystemGesturesDisabledByAccessibility];
  }
}

- (id)serverInstance:(id)a3 springBoardSystemInfoQuery:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  char v8 = [MEMORY[0x263F21380] mainAccessQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__AXSpringBoardServerHelper_serverInstance_springBoardSystemInfoQuery___block_invoke;
  void v14[3] = &unk_2647F0A48;
  unint64_t v18 = a4;
  id v9 = v7;
  id v15 = v9;
  long long v16 = self;
  id v17 = v6;
  id v10 = v6;
  [v8 performSynchronousReadingBlock:v14];

  uint64_t v11 = v17;
  id v12 = v9;

  return v12;
}

void __71__AXSpringBoardServerHelper_serverInstance_springBoardSystemInfoQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "areSystemGesturesDisabledNativelyWithServerInstance:", *(void *)(a1 + 48)));
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:&unk_26DB1FED8];

    uint64_t v2 = *(void *)(a1 + 56);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "areSystemGesturesDisabledByAccessibilityWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:&unk_26DB1FED8];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  char v5 = [*(id *)(a1 + 40) installedAppsWithServerInstance:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:&unk_26DB1FEF0];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isPasscodeRequiredOnLockWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:&unk_26DB1FF08];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isAppSwitcherVisibleWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:&unk_26DB1FF20];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x10000) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  char v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isTypeToSiriVisibleWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:&unk_26DB1FF38];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSiriVisibleWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:&unk_26DB1FF50];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x40) == 0)
  {
LABEL_9:
    if ((v2 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isScreenLockedWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:&unk_26DB1FF68];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x80) == 0)
  {
LABEL_10:
    if ((v2 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMakingEmergencyCallWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:&unk_26DB1FF80];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_11:
    if ((v2 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isNotificationCenterVisibleWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:&unk_26DB1FF98];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x200) == 0)
  {
LABEL_12:
    if ((v2 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  long long v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "purpleBuddyPIDWithServerInstance:", *(void *)(a1 + 48)) != -1);
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:&unk_26DB1FFB0];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x400) == 0)
  {
LABEL_13:
    if ((v2 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemAppFrontmostExcludingSiri:withServerInstance:", 0, *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:&unk_26DB1FFC8];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x800) == 0)
  {
LABEL_14:
    if ((v2 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemSleepingWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:&unk_26DB1FFE0];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x1000) == 0)
  {
LABEL_15:
    if ((v2 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  long long v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSyncingRestoringResettingOrUpdatingWithServerInstance:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:&unk_26DB1FFF8];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x2000) == 0)
  {
LABEL_16:
    if ((v2 & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    unint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSyncingRestoringResettingOrUpdatingWithServerInstance:", *(void *)(a1 + 48)));
    [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:&unk_26DB20028];

    if ((*(void *)(a1 + 56) & 0x8000) == 0) {
      return;
    }
    goto LABEL_35;
  }
LABEL_33:
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemAppFrontmostExcludingSiri:withServerInstance:", 1, *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:&unk_26DB20010];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x4000) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((v2 & 0x8000) == 0) {
    return;
  }
LABEL_35:
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemGestureActiveWithServerInstance:", *(void *)(a1 + 48)));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:&unk_26DB20040];
}

- (id)serverInstance:(id)a3 appWithIdentifier:(id)a4
{
  return AXSBApplicationWithIdentifier(a4);
}

- (id)installedAppsWithServerInstance:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v3 = +[AXSpringBoardServerHelper _iconController];
  uint64_t v4 = [v3 safeValueForKey:@"model"];

  char v5 = +[AXSpringBoardServerHelper _applicationController];
  id v6 = [v5 safeValueForKey:@"allApplications"];

  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 safeValueForKey:@"bundleIdentifier"];
        id v12 = [v10 safeValueForKey:@"displayName"];
        long long v13 = [v10 safeValueForKey:@"isInternalApplication"];
        LOBYTE(v10) = [v13 BOOLValue];

        uint64_t v20 = 0;
        uint64_t v21 = &v20;
        uint64_t v22 = 0x2020000000;
        char v23 = 0;
        id v19 = v4;
        id v14 = v11;
        AXPerformSafeBlock();
        if ((v10 & 1) == 0 && *((unsigned char *)v21 + 24) && v14 && v12) {
          [v17 setObject:v12 forKey:v14];
        }

        _Block_object_dispose(&v20, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v17;
}

void __61__AXSpringBoardServerHelper_installedAppsWithServerInstance___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 applicationIconForBundleIdentifier:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isIconVisible:v3];
}

- (id)internalAppsWithServerInstance:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v3 = +[AXSpringBoardServerHelper _iconController];
  uint64_t v4 = [v3 safeValueForKey:@"model"];

  char v5 = +[AXSpringBoardServerHelper _applicationController];
  id v6 = [v5 safeValueForKey:@"allApplications"];

  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 safeValueForKey:@"bundleIdentifier"];
        id v12 = [v10 safeValueForKey:@"displayName"];
        long long v13 = [v10 safeValueForKey:@"isInternalApplication"];
        LODWORD(v10) = [v13 BOOLValue];

        uint64_t v20 = 0;
        uint64_t v21 = &v20;
        uint64_t v22 = 0x2020000000;
        char v23 = 0;
        id v19 = v4;
        id v14 = v11;
        AXPerformSafeBlock();
        if (v10 && *((unsigned char *)v21 + 24) && v14 && v12) {
          [v17 setObject:v12 forKey:v14];
        }

        _Block_object_dispose(&v20, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v17;
}

void __60__AXSpringBoardServerHelper_internalAppsWithServerInstance___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 applicationIconForBundleIdentifier:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isIconVisible:v3];
}

- (void)_unlockWithIntent:(int)a3
{
}

uint64_t __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke()
{
  return AXPerformSafeBlock();
}

void __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke_2(uint64_t a1)
{
  v10[3] = *MEMORY[0x263EF8340];
  NSClassFromString(&cfstr_Sblockscreenun.isa);
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = 0;
  v10[0] = sel_setName_;
  v10[1] = sel_setSource_;
  v10[2] = sel_setIntent_;
  do
  {
    uint64_t v4 = (const char *)v10[v3];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      sel_getName(v4);
      _AXLogWithFacility();
    }
    ++v3;
  }
  while (v3 != 3);
  if (objc_opt_respondsToSelector()) {
    [v2 setName:@"Accessibility screen unlock"];
  }
  if (objc_opt_respondsToSelector()) {
    [v2 setSource:30];
  }
  if (objc_opt_respondsToSelector()) {
    [v2 setIntent:*(unsigned int *)(a1 + 40)];
  }
  char v5 = AXLogSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v6;
    _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_DEFAULT, "Requesting screen unlock. intent: %ld", buf, 0xCu);
  }

  uint64_t v7 = [(id)objc_opt_class() _lockScreenManager];
  [v7 unlockWithRequest:v2 completion:&__block_literal_global_1946];
}

void __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke_1943(uint64_t a1, unsigned int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = AXLogSystemApp();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_impl(&dword_226EBC000, v3, OS_LOG_TYPE_DEFAULT, "Screen unlock request finished: %ld", (uint8_t *)&v4, 0xCu);
  }
}

- (void)wakeUpDeviceIfNecessaryWithServerInstance:(id)a3
{
}

- (void)unlockDeviceWithServerInstance:(id)a3
{
}

- (void)serverInstance:(id)a3 showSpeechPlaybackControls:(BOOL)a4
{
}

- (void)serverInstance:(id)a3 pauseMedia:(BOOL)a4 forBundleId:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  AXPerformBlockOnMainThread();
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  id v3 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPID();
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)SBSCopyInfoForApplicationWithProcessID();
  id v3 = [v2 objectForKey:*MEMORY[0x263F79490]];
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F21340]]
    && (([v3 isEqualToString:*MEMORY[0x263F21360]] & 1) != 0
     || ([v3 isEqualToString:*MEMORY[0x263F21368]] & 1) != 0)
    || ([v3 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
    || !*(void *)(a1 + 32))
  {
    id v4 = v3;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  }
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_3(uint64_t a1, int a2)
{
  if (a2 != 1)
  {
    if (*(unsigned char *)(a1 + 40)) {
      return;
    }
    goto LABEL_5;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
LABEL_5:
    uint64_t v2 = (id *)(a1 + 32);
    MRMediaRemoteSendCommandToApp();
    id v3 = v4;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_6;
    v4[3] = &unk_2647F0648;
    goto LABEL_6;
  }
  uint64_t v2 = (id *)(a1 + 32);
  MRMediaRemoteSendCommandToApp();
  id v3 = v5;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_4;
  v5[3] = &unk_2647F0648;
LABEL_6:
  v3[4] = *v2;
  AXPerformBlockOnMainThreadAfterDelay();
  _AXLogWithFacility();
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_4(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_5(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    MRMediaRemoteSendCommandToApp();
    _AXLogWithFacility();
  }
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_6(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_7(uint64_t a1, int a2)
{
  if (a2 != 1)
  {
    MRMediaRemoteSendCommandToApp();
    _AXLogWithFacility();
  }
}

- (BOOL)hasActiveCallWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000;
  id v6 = __Block_byref_object_copy__0;
  uint64_t v7 = __Block_byref_object_dispose__0;
  id v8 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 safeBoolForKey:@"inCall"];
}

uint64_t __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke_1973(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSClassFromString(&cfstr_Sbtelephonyman.isa) sharedTelephonyManagerCreatingIfNecessary:0];
  return MEMORY[0x270F9A758]();
}

- (BOOL)hasActiveEndpointCallWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__0;
  id v8 = __Block_byref_object_dispose__0;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  int v3 = [v2 safeBoolForKey:@"inCall"];
  if (v3) {
    LOBYTE(v3) = [v2 safeBoolForKey:@"isEndpointOnCurrentDevice"];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

uint64_t __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSClassFromString(&cfstr_Sbtelephonyman.isa) sharedTelephonyManagerCreatingIfNecessary:0];
  return MEMORY[0x270F9A758]();
}

- (BOOL)hasActiveOrPendingCallWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  char v3 = [v2 safeBoolForKey:@"incomingCallExists"];
  char v4 = [v2 safeBoolForKey:@"outgoingCallExists"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 | v4 | [v2 safeBoolForKey:@"inCall"];
}

uint64_t __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSClassFromString(&cfstr_Sbtelephonyman.isa) sharedTelephonyManagerCreatingIfNecessary:0];
  return MEMORY[0x270F9A758]();
}

- (BOOL)hasActiveOrPendingCallOrFaceTimeWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  char v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  char v3 = [v2 safeBoolForKey:@"incomingCallExists"];
  char v4 = [v2 safeBoolForKey:@"outgoingCallExists"];
  char v5 = [v2 safeBoolForKey:@"inCall"];
  uint64_t v6 = [NSClassFromString(&cfstr_Sbconferencema.isa) safeValueForKey:@"sharedInstance"];
  char v7 = [v6 safeBoolForKey:@"inFaceTime"];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 | v4 | v5 | v7;
}

uint64_t __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSClassFromString(&cfstr_Sbtelephonyman.isa) sharedTelephonyManagerCreatingIfNecessary:0];
  return MEMORY[0x270F9A758]();
}

- (double)reachabilityOffsetWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  char v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__AXSpringBoardServerHelper_reachabilityOffsetWithServerInstance___block_invoke;
  v8[3] = &unk_2647F0900;
  v8[4] = self;
  void v8[5] = &v9;
  [v5 performSynchronousReadingBlock:v8];

  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__AXSpringBoardServerHelper_reachabilityOffsetWithServerInstance___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isReachabilityActive])
  {
    id v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 bounds];
    double v3 = v2 * 0.5;
    id v4 = [NSClassFromString(&cfstr_Sbreachability_0.isa) safeValueForKey:@"rootSettings"];
    [v4 safeCGFloatForKey:@"yOffsetFactor"];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 + v5;
  }
}

- (id)allowedMedusaGesturesWithServerInstance:(id)a3
{
  double v3 = [(AXSpringBoardServerHelper *)self sideAppManager];
  id v4 = [v3 allowedMedusaGestures];

  return v4;
}

- (void)toggleBackgroundSoundsWithServerInstance:(id)a3
{
  id v4 = [getHUComfortSoundsSettingsClass() sharedInstance];
  double v3 = [getHUComfortSoundsSettingsClass() sharedInstance];
  objc_msgSend(v4, "setComfortSoundsEnabled:", objc_msgSend(v3, "comfortSoundsEnabled") ^ 1);
}

- (BOOL)serverInstance:(id)a3 performMedusaGesture:(unint64_t)a4
{
  double v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  LOBYTE(a4) = [v5 performMedusaGesture:a4];

  return a4;
}

- (id)medusaAppsWithServerInstance:(id)a3
{
  double v3 = [(AXSpringBoardServerHelper *)self sideAppManager];
  id v4 = [v3 medusaApps];

  return v4;
}

- (void)serverInstance:(id)a3 setDockIconActivationMode:(unint64_t)a4
{
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  [v5 setDockIconActivationMode:a4];
}

- (BOOL)canSetDockIconActivationModeForServerInstance:(id)a3
{
  double v3 = [(AXSpringBoardServerHelper *)self sideAppManager];
  char v4 = [v3 canActivateMedusaForDock];

  return v4;
}

- (id)medusaBundleIDsToLayoutRoles
{
  double v2 = [(AXSpringBoardServerHelper *)self sideAppManager];
  double v3 = [v2 medusaAppBundleIdsToLayoutRoles];

  return v3;
}

- (void)toggleSpotlightWithServerInstance:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  if (AXDeviceIsPad())
  {
    id v6 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    char v7 = __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke;
  }
  else
  {
    if ([(AXSpringBoardServerHelper *)self isAppSwitcherVisibleWithServerInstance:v4])
    {
      [(AXSpringBoardServerHelper *)self dismissAppSwitcherWithServerInstance:v4];
    }
    id v6 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    char v7 = __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke_2;
  }
  v6[2] = v7;
  v6[3] = &unk_2647F0648;
  v6[4] = v5;
  id v8 = v5;
  AXPerformSafeBlock();
}

uint64_t __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleSearchOnWindowScene:0 fromBreadcrumbSource:1 withWillBeginHandler:0 completionHandler:0];
}

uint64_t __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleSearch];
}

- (void)revealSpotlightWithServerInstance:(id)a3
{
  id v4 = a3;
  if (!-[AXSpringBoardServerHelper isSpotlightVisibleWithServerInstance:](self, "isSpotlightVisibleWithServerInstance:"))[(AXSpringBoardServerHelper *)self toggleSpotlightWithServerInstance:v4]; {
}
  }

- (BOOL)isGuidedAccessActiveWithServerInstance:(id)a3
{
  double v3 = [NSClassFromString(&cfstr_Gaxspringboard.isa) safeValueForKey:@"sharedInstanceIfExists"];
  char v4 = [v3 safeBoolForKey:@"isActive"];

  return v4;
}

- (BOOL)toggleDarkModeWithServerInstance:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F82DE8], "sharedInstance", a3);
  [v3 toggleCurrentStyle];

  return 1;
}

- (BOOL)_isDarkModeActive
{
  return MEMORY[0x270F09D58](self, a2);
}

- (BOOL)isSpotlightVisibleWithServerInstance:(id)a3
{
  id v3 = a3;
  char v4 = [NSClassFromString(&cfstr_Sbspotlightmul.isa) safeValueForKey:@"sharedRemoteSearchViewController"];
  objc_opt_class();
  id v5 = __UIAccessibilityCastAsClass();
  int v6 = [v5 _appearState];

  return (v6 - 1) < 2;
}

- (BOOL)isTodayViewOrAppLibraryVisibleWithServerInstance:(id)a3
{
  id v3 = [(id)objc_opt_class() _iconController];
  char v4 = [v3 safeValueForKey:@"iconManager"];
  char v5 = [v4 safeBoolForKey:@"isOverlayTodayOrLibraryViewVisible"];

  return v5;
}

- (BOOL)isPIPWindowVisibleWithServerInstance:(id)a3
{
  id v3 = [NSClassFromString(&cfstr_Sbworkspace.isa) safeValueForKey:@"mainWorkspace"];
  char v4 = [v3 safeValueForKey:@"pipCoordinator"];
  char v5 = [v4 safeBoolForKey:@"isAnyPictureInPictureWindowVisible"];

  return v5;
}

- (void)forceLoadGAXBundleWithServerInstance:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:*MEMORY[0x263F8B1D8] object:0];
}

- (void)reactivateInCallServiceWithServerInstance:(id)a3
{
  id v5 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
  id v3 = [v5 safeValueForKey:@"inCallTransientOverlayManager"];
  id v4 = (id)[v3 safeValueForKey:@"presentTransientOverlay"];
}

- (void)launchMagnifierAppWithServerInstance:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self serverInstance:v4 appWithIdentifier:*MEMORY[0x263F8B0C8]];
  int v6 = __UIAccessibilitySafeClass();

  if (v6 && ![(AXSpringBoardServerHelper *)self isPasscodeLockVisible])
  {
    char v7 = [(id)objc_opt_class() _uiController];
    if (objc_opt_respondsToSelector())
    {
      id v8 = v7;
      id v9 = v6;
      AXPerformSafeBlock();
    }
    else
    {
      _AXLogWithFacility();
    }
  }
}

uint64_t __66__AXSpringBoardServerHelper_launchMagnifierAppWithServerInstance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateApplicationFromAccessibility:*(void *)(a1 + 40)];
}

- (BOOL)isMagnifierVisibleWithServerInstance:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  AXFrontBoardRunningAppProcesses();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    id v9 = (void *)MEMORY[0x263F8B0C8];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "bundleIdentifier", (void)v18);
        int v13 = [v12 isEqualToString:*v9];

        if (v13)
        {
          id v14 = [v11 state];
          uint64_t v15 = [v14 visibility];

          if (v15 == 2)
          {
            LOBYTE(v16) = 1;
            goto LABEL_14;
          }
          if (v15 == 3)
          {
            BOOL v16 = ![(AXSpringBoardServerHelper *)self isScreenLockedWithServerInstance:v4];
            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v16) = 0;
LABEL_14:

  return v16;
}

- (void)updateFrontMostApplicationWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  AXPerformSafeBlock();
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  uint64_t v6 = v4;
  id v5 = v4;
  AXPerformSafeBlock();
}

uint64_t __74__AXSpringBoardServerHelper_updateFrontMostApplicationWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSClassFromString(&cfstr_Sbkeyboardfocu_1.isa) accessibility:@"Accessibility-FKA"];
  return MEMORY[0x270F9A758]();
}

void __74__AXSpringBoardServerHelper_updateFrontMostApplicationWithServerInstance___block_invoke_2(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sbkeyboardfocu_0.isa) safeValueForKey:@"sharedInstance"];
  [v2 requestArbitrationForSBWindowScene:0 forReason:*(void *)(a1 + 32)];
}

- (void)diminishJindoWithServerInstance:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  id v5 = [v4 safeValueForKey:@"systemApertureControllerForMainDisplay"];
  uint64_t v6 = [v5 safeValueForKey:@"_systemApertureViewController"];
  uint64_t v7 = [v6 safeValueForKey:@"_systemApertureManager"];
  uint64_t v8 = [v7 safeValueForKey:@"_elementsToElementViewControllers"];
  uint64_t v9 = __UIAccessibilitySafeClass();

  if ([v9 count])
  {
    uint64_t v10 = [v9 objectEnumerator];
    uint64_t v11 = [v10 nextObject];
    if (v11)
    {
      id v12 = (void *)v11;
      do
      {
        if (objc_opt_respondsToSelector()) {
          [v12 _axCollapseIfExpandedByUserInteraction];
        }
        uint64_t v13 = [v10 nextObject];

        id v12 = (void *)v13;
      }
      while (v13);
    }
  }
}

- (id)jindoAppBundleIndentifiersWithServerInstance:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v11 = [v12 safeValueForKey:@"systemApertureControllerForMainDisplay"];
  id v3 = [v11 safeValueForKey:@"_systemApertureViewController"];
  [v3 safeArrayForKey:@"_orderedContainerViews"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v27;
    uint64_t v18 = *MEMORY[0x263F21350];
    uint64_t v15 = *MEMORY[0x263F21248];
    uint64_t v16 = *MEMORY[0x263F21330];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = 0;
        long long v21 = &v20;
        uint64_t v22 = 0x3032000000;
        uint64_t v23 = __Block_byref_object_copy__0;
        long long v24 = __Block_byref_object_dispose__0;
        id v25 = 0;
        id v19 = v3;
        AXPerformSafeBlock();
        id v7 = (id)v21[5];

        _Block_object_dispose(&v20, 8);
        if (v7)
        {
          uint64_t v8 = objc_msgSend(v7, "safeStringForKey:", @"clientIdentifier", v10);
          if (([v8 isEqualToString:v18] & 1) == 0
            && ([v8 isEqualToString:@"com.apple.chronod"] & 1) == 0
            && ([v8 isEqualToString:@"com.apple.CoreAuthUI"] & 1) == 0
            && ([v8 isEqualToString:v16] & 1) == 0
            && ([v8 isEqualToString:@"com.apple.accessibility.MagnifierAngel"] & 1) == 0
            && ([v8 isEqualToString:@"com.apple.ShortcutsUI"] & 1) == 0
            && (![v8 isEqualToString:v15]
             || ![(AXSpringBoardServerHelper *)self isInCallServiceFrontmost]))
          {
            [v14 axSafelyAddObject:v8];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }

  return v14;
}

uint64_t __74__AXSpringBoardServerHelper_jindoAppBundleIndentifiersWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _elementForContainerView:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (void)launchOnboardingViewServiceWithServerInstance:(id)a3 data:(id)a4
{
}

- (void)launchVoiceOverQuickSettingsViewServiceWithServerInstance:(id)a3 data:(id)a4
{
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(id)a3 forData:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F22778];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F22778]];
  id v24 = 0;
  id v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v24];
  id v11 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v11)
  {
    uint64_t v13 = AXLogSpringboardServer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      long long v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412802;
      long long v26 = v22;
      __int16 v27 = 2112;
      long long v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_fault_impl(&dword_226EBC000, v13, OS_LOG_TYPE_FAULT, "%@ - elementInfo must be type AXSBImageExplorerData. was actually %@. error:%@ ", buf, 0x20u);
    }
    goto LABEL_20;
  }
  if (!v10)
  {
    uint64_t v13 = AXLogSpringboardServer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:]((uint64_t)self, v13);
    }
LABEL_20:
    id v17 = v9;
    goto LABEL_21;
  }
  id v12 = [v10 hostAppBundleID];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = AXSBApplicationWithIdentifier(v12);
    NSClassFromString(&cfstr_Sbapplication.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 safeValueForKey:@"displayName"];
      [v10 setHostAppName:v15];

      uint64_t v16 = AXLogSpringboardServer();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:](v10, v16);
      }
    }
  }
  id v23 = 0;
  id v17 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v23];
  id v18 = v23;

  if (v18 || !v17)
  {
    id v19 = AXLogSpringboardServer();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:]();
    }
  }
  uint64_t v20 = (void *)[v7 mutableCopy];
  [v20 setObject:v17 forKeyedSubscript:v8];
  [(AXSpringBoardServerHelper *)self serverInstance:v6 showRemoteViewType:2 withData:v20 withPreviousViewDismissal:1];

LABEL_21:
}

- (id)coverSheetViewController
{
  id v2 = AXSpringBoardGlueSBLockScreenControllerInstance();
  id v3 = [v2 safeValueForKey:@"coverSheetViewController"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  return v4;
}

- (void)setDashBoardSystemGesturesEnabled:(BOOL)a3 withServerInstance:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AXSpringBoardServerHelper *)self coverSheetViewController];
  objc_opt_class();
  uint64_t v8 = [v7 safeValueForKey:@"_scrollGestureController"];
  uint64_t v9 = __UIAccessibilityCastAsSafeCategory();

  [v9 accessibilitySetSystemDashBoardGesturesEnabled:v4];
}

- (void)setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3 withServerInstance:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F22938] sharedInstance];
  int v8 = [v7 securePayAssertionActive];

  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (AccessibilityFeatureCache *)objc_opt_new();
      axFeatureCache = self->_axFeatureCache;
      self->_axFeatureCache = v9;

      [(AccessibilityFeatureCache *)self->_axFeatureCache setAssistiveTouch:_AXSAssistiveTouchEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setLiveCaptions:_AXSLiveTranscriptionEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setLiveSpeech:_AXSLiveSpeechEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setSpeakScreen:_AXSSpeakThisEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setZoom:_AXSZoomTouchEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setVoiceControl:_AXSCommandAndControlEnabled() != 0];
      [(AccessibilityFeatureCache *)self->_axFeatureCache setBackTap:_AXSBackTapEnabled() != 0];
      id v11 = (void *)_AXSTripleClickCopyOptions();
      [(AccessibilityFeatureCache *)self->_axFeatureCache setTripleClickOptions:v11];

      id v12 = [MEMORY[0x263F22938] sharedInstance];
      [v12 setSecurePayAssertionActive:1];

      _AXSSetTripleClickOptions();
      _AXSBackTapSetEnabled();
      _AXSAssistiveTouchSetEnabled();
      _AXSLiveTranscriptionSetEnabled();
      _AXSLiveSpeechSetEnabled();
      _AXSSetSpeakThisEnabled();
      _AXSZoomTouchSetEnabled();
      _AXSCommandAndControlSetEnabled();
      uint64_t v13 = self->_axFeatureCache;
      id v23 = 0;
      id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v23];
      uint64_t v15 = v23;
      if (v15)
      {
        uint64_t v16 = AXLogAssertions();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[AXSpringBoardServerHelper setSecurePayAccessibilityFeaturesDisabled:withServerInstance:]();
        }
      }
      if (v14)
      {
        id v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v17 setObject:v14 forKey:@"AXSecurePayFeatureCache"];
      }
      id v18 = AXLogAssertions();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EBC000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for ax secure pay feature disablement", buf, 2u);
      }

LABEL_15:
    }
  }
  else if (v8)
  {
    [(AXSpringBoardServerHelper *)self _restoreAccessibilityFeatureFromSecurePayCache:self->_axFeatureCache];
    id v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v19 removeObjectForKey:@"AXSecurePayFeatureCache"];

    uint64_t v20 = [MEMORY[0x263F22938] sharedInstance];
    [v20 setSecurePayAssertionActive:0];

    uint64_t v15 = AXLogAssertions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v21 = 0;
      _os_log_impl(&dword_226EBC000, v15, OS_LOG_TYPE_DEFAULT, "Release assertion for ax secure pay feature disablement", v21, 2u);
    }
    goto LABEL_15;
  }
}

- (void)_restoreAccessibilityFeatureFromSecurePayCache:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 assistiveTouch];
    _AXSAssistiveTouchSetEnabled();
    [v3 liveCaptions];
    _AXSLiveTranscriptionSetEnabled();
    [v3 liveSpeech];
    _AXSLiveSpeechSetEnabled();
    [v3 speakScreen];
    _AXSSetSpeakThisEnabled();
    [v3 zoom];
    _AXSZoomTouchSetEnabled();
    [v3 voiceControl];
    _AXSCommandAndControlSetEnabled();
    [v3 backTap];
    _AXSBackTapSetEnabled();
    id v4 = [v3 tripleClickOptions];

    _AXSSetTripleClickOptions();
  }
}

- (void)activateSOSModeWithServerInstance:(id)a3
{
  id v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, &__block_literal_global_2007);
}

uint64_t __63__AXSpringBoardServerHelper_activateSOSModeWithServerInstance___block_invoke()
{
  LOBYTE(v3) = 1;
  _AXLogWithFacility();
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  id v0 = (void *)getSOSManagerClass_softClass;
  uint64_t v8 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getSOSManagerClass_block_invoke;
    v4[3] = &unk_2647F0860;
    v4[4] = &v5;
    __getSOSManagerClass_block_invoke((uint64_t)v4);
    id v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  return objc_msgSend(v1, "triggerSOS", v3, @"SOS: triggering SOS");
}

- (BOOL)connectedDevicesRequireAssistiveTouch
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(AXSpringBoardServerHelper *)self motionTrackingInputManager];
  uint64_t v3 = [v2 compatibleInputs];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isHIDDevice])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  id v2 = [MEMORY[0x263F228E8] sharedInstance];
  char v3 = [v2 currentDevicesHaveAssistiveTouchCustomActions];

  return v3;
}

- (void)cancelSiriDismissalForAssistiveTouchWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_INFO, "Canceling Siri dismissal (if pending) due to AssistiveTouch handling an up event.", buf, 2u);
  }

  objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() _assistantController];
  id v6 = __UIAccessibilityCastAsSafeCategory();

  [v6 _axCancelDismissSiriForAssistiveTouch];
}

- (id)appNameFromPid:(int)a3 withServerInstance:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x263F64570];
  uint64_t v5 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", *(void *)&a3, a4);
  id v27 = 0;
  id v6 = [v4 handleForIdentifier:v5 error:&v27];
  id v7 = v27;

  if (!v7)
  {
    long long v10 = [v6 bundle];
    long long v8 = [v10 identifier];

    long long v11 = [v6 hostProcess];
    id v12 = [v11 bundle];
    uint64_t v13 = [v12 identifier];

    id v14 = AXLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.4();
    }

    uint64_t v15 = AXLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:]();
    }

    if (v13)
    {
      id v16 = objc_alloc(MEMORY[0x263F01878]);
      uint64_t v26 = 0;
      id v17 = (id *)&v26;
      id v18 = &v26;
      id v19 = v13;
    }
    else
    {
      if (!v8)
      {
        uint64_t v20 = AXLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:]();
        }
        id v7 = 0;
        goto LABEL_23;
      }
      id v16 = objc_alloc(MEMORY[0x263F01878]);
      uint64_t v25 = 0;
      id v17 = (id *)&v25;
      id v18 = &v25;
      id v19 = v8;
    }
    uint64_t v20 = [v16 initWithBundleIdentifier:v19 allowPlaceholder:0 error:v18];
    id v7 = *v17;
    if (!v20)
    {
      long long v9 = &stru_26DB17D90;
LABEL_25:

      goto LABEL_26;
    }
    long long v21 = [v20 localizedName];

    if (v21)
    {
      long long v9 = [v20 localizedName];
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v22 = AXLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:](v7);
    }

LABEL_23:
    long long v9 = &stru_26DB17D90;
    goto LABEL_24;
  }
  long long v8 = AXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.5(v7);
  }
  long long v9 = &stru_26DB17D90;
LABEL_26:

  id v23 = v9;
  return v23;
}

- (void)toggleLiveTranscriptionWithServerInstance:(id)a3
{
  int v3 = _AXSLiveTranscriptionEnabled();
  BOOL v4 = v3 == 0;
  if (v3)
  {
    _AXSLiveTranscriptionSetEnabled();
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F22968] server];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__AXSpringBoardServerHelper_toggleLiveTranscriptionWithServerInstance___block_invoke;
    v6[3] = &__block_descriptor_33_e8_v16__0q8l;
    BOOL v7 = v4;
    [v5 showAlert:25 withHandler:v6];
  }
}

uint64_t __71__AXSpringBoardServerHelper_toggleLiveTranscriptionWithServerInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return _AXSLiveTranscriptionSetEnabled();
  }
  return result;
}

- (void)freezeClarityUILoadingScreenWithServerInstance:(id)a3
{
  id v3 = objc_alloc(MEMORY[0x263F29808]);
  BOOL v4 = [MEMORY[0x263F15778] mainDisplay];
  id v6 = (id)[v3 initWithName:@"ClarityUI" display:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F29800]) initWithDescriptor:v6];
  [v5 present];
  [v5 freeze];
}

- (void)presentNearbyDeviceControlPickerWithServerInstance:(id)a3
{
}

void __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v6 = 0;
    BOOL v7 = &v6;
    uint64_t v8 = 0x2050000000;
    id v2 = (void *)getAXRemoteViewServiceAdaptorClass_softClass;
    uint64_t v9 = getAXRemoteViewServiceAdaptorClass_softClass;
    if (!getAXRemoteViewServiceAdaptorClass_softClass)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      _DWORD v5[2] = __getAXRemoteViewServiceAdaptorClass_block_invoke;
      v5[3] = &unk_2647F0860;
      v5[4] = &v6;
      __getAXRemoteViewServiceAdaptorClass_block_invoke((uint64_t)v5);
      id v2 = (void *)v7[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v6, 8);
    [v3 presentRemoteNearbyDevicesViewControllerWithPresentationHandler:0 dismissalHandler:0];
  }
  else
  {
    BOOL v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke_cold_1();
    }
  }
}

- (void)toggleDetectionModeWithServerInstance:(id)a3
{
  id v3 = a3;
  if (AccessibilityPhysicalInteractionLibraryCore())
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2050000000;
    BOOL v4 = (void *)getAXPISystemActionHelperClass_softClass;
    uint64_t v11 = getAXPISystemActionHelperClass_softClass;
    if (!getAXPISystemActionHelperClass_softClass)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __getAXPISystemActionHelperClass_block_invoke;
      v7[3] = &unk_2647F0860;
      v7[4] = &v8;
      __getAXPISystemActionHelperClass_block_invoke((uint64_t)v7);
      BOOL v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    uint64_t v6 = [v5 sharedInstance];
    [v6 activateDetectionMode];
  }
}

- (void)toggleConversationBoostWithServerInstance:(id)a3
{
  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v15 address];
  if ([v3 length]
    && paCurrentRouteSupportsTransparencyAccommodations()
    && paBluetoothDeviceSupportsSSL())
  {
    BOOL v4 = [MEMORY[0x263F5D458] sharedInstance];
    if ([v4 personalMediaEnabled])
    {
      int v5 = [v15 listeningMode];

      if (v5 == 3)
      {
        uint64_t v6 = [MEMORY[0x263F5D458] sharedInstance];
        int v7 = [v6 transparencyCustomizedForAddress:v3];

        uint64_t v8 = [MEMORY[0x263F5D458] sharedInstance];
        [v8 setTransparencyCustomized:v7 ^ 1u forAddress:v3];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v9 = [MEMORY[0x263F5D458] sharedInstance];
    int v10 = [v9 sslEnabledForAddress:v3];

    uint64_t v11 = v10 ^ 1u;
    int v12 = [v15 listeningMode];
    if ((v10 & 1) != 0 || v12 == 3)
    {
      if (v12 == 3) {
        int v14 = v10;
      }
      else {
        int v14 = 0;
      }
      if (v14 != 1) {
        goto LABEL_17;
      }
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 3;
    }
    [v15 setListeningMode:v13];
LABEL_17:
    uint64_t v8 = [MEMORY[0x263F5D458] sharedInstance];
    [v8 setSslEnabled:v11 forAddress:v3];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)toggleTorchWithServerInstance:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F796B8], "sharedInstance", a3);
  uint64_t v4 = [v3 level];

  int v5 = [MEMORY[0x263F796B8] sharedInstance];
  id v6 = v5;
  if (v4) {
    [v5 turnFlashlightOffForReason:@"Accessibility"];
  }
  else {
    [v5 turnFlashlightOnForReason:@"Accessibility"];
  }
}

- (id)serverInstance:(id)a3 splashImageForAppWithBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  int v7 = AXSBApplicationWithIdentifier(v6);
  NSClassFromString(&cfstr_Sbapplication.isa);
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    AXPerformSafeBlock();
  }
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Sbscenemanager_0.isa) mainDisplaySceneManager];
  NSClassFromString(&cfstr_Sbmaindisplays.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 sceneIdentityForApplication:*(void *)(a1 + 32)];
    Class v4 = NSClassFromString(&cfstr_Sbapplications.isa);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v2 safeValueForKey:@"displayIdentity"];
    int v7 = [(objc_class *)v4 defaultRequestForApplication:v5 sceneIdentity:v3 displayIdentity:v6];

    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    id v30 = v2;
    id v8 = v7;
    AXPerformSafeBlock();
    id v9 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    NSClassFromString(&cfstr_Sbdeviceapplic.isa);
    if (objc_opt_isKindOfClass())
    {
      id v27 = v8;
      long long v28 = v3;
      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__0;
      v35 = __Block_byref_object_dispose__0;
      id v36 = 0;
      id v29 = v9;
      AXPerformSafeBlock();
      id v10 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      uint64_t v26 = *(void **)(a1 + 32);
      uint64_t v11 = [MEMORY[0x263F82B60] mainScreen];
      [v11 scale];
      double v13 = v12;
      int v14 = [MEMORY[0x263F82B60] mainScreen];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;
      id v19 = [(id)*MEMORY[0x263F83300] windows];
      uint64_t v20 = [v19 objectAtIndexedSubscript:0];
      long long v21 = [v20 traitCollection];
      uint64_t v22 = objc_msgSend(v26, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", @"SBSuspendSnapshot", v29, @"downscaled", 1, -1, -5, v13, v16, v18, 1, 0, objc_msgSend(v21, "userInterfaceStyle"), v10);

      uint64_t v23 = [v22 imageForInterfaceOrientation:1];
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      id v8 = v27;
      id v3 = v28;
    }
  }
}

uint64_t __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) fetchOrCreateApplicationSceneHandleForRequest:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) displayEdgeInfoForLayoutEnvironment:1];
  return MEMORY[0x270F9A758]();
}

- (void)rebootDeviceWithServerInstance:(id)a3
{
  objc_msgSend(MEMORY[0x263F22968], "server", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 showAlert:11 withHandler:&__block_literal_global_2036];
}

uint64_t __60__AXSpringBoardServerHelper_rebootDeviceWithServerInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return MEMORY[0x270F09750]();
  }
  return result;
}

- (void)launchApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  [v5 launchApplication:v4];
}

- (void)launchApplicationWithFullConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  [v5 launchApplicationWithFullConfiguration:v4];
}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AXSpringBoardServerHelper *)self sideAppManager];
  [v7 launchPinnedApplication:v6 onLeadingSide:v4];
}

- (void)launchFloatingApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  [v5 launchFloatingApplication:v4];
}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  char v6 = [v5 canLaunchAsPinnedApplicationForIconView:v4];

  return v6;
}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpringBoardServerHelper *)self sideAppManager];
  char v6 = [v5 canLaunchAsFloatingApplicationForIconView:v4];

  return v6;
}

- (id)sceneLayoutState
{
  id v2 = [(AXSpringBoardServerHelper *)self sideAppManager];
  id v3 = [v2 sceneLayoutState];

  return v3;
}

- (id)appForLayoutRole:(int64_t)a3
{
  id v4 = [(AXSpringBoardServerHelper *)self sideAppManager];
  id v5 = [v4 appForLayoutRole:a3];

  return v5;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  id v4 = [(AXSpringBoardServerHelper *)self coverSheetViewController];
  id v5 = [v4 safeValueForKey:@"mainPageContentViewController"];
  char v6 = [v5 safeValueForKey:@"combinedListViewController"];
  id v7 = [v6 safeValueForKey:@"_structuredListViewController"];
  id v8 = [v7 _accessibilityNotificationSummary:a3];

  return v8;
}

- (unint64_t)_accessibilityNotificationCount
{
  id v2 = [(AXSpringBoardServerHelper *)self coverSheetViewController];
  id v3 = [v2 safeValueForKey:@"mainPageContentViewController"];
  id v4 = [v3 safeValueForKey:@"combinedListViewController"];
  id v5 = [v4 safeValueForKey:@"_structuredListViewController"];
  unint64_t v6 = [v5 _accessibilityNotificationCount];

  return v6;
}

- (int)nativeFocusedApplication
{
  id v2 = [NSClassFromString(&cfstr_Sbworkspace.isa) safeValueForKey:@"mainWorkspace"];
  id v3 = [v2 safeValueForKey:@"keyboardFocusController"];

  int v4 = [v3 safeIntForKey:@"_axPrimaryKeyboardFocusOverridePid"];
  if (!v4)
  {
    char v19 = 0;
    objc_opt_class();
    id v5 = [NSClassFromString(&cfstr_Sbworkspace.isa) safeValueForKey:@"mainWorkspace"];
    unint64_t v6 = [v5 safeValueForKey:@"keyboardFocusController"];
    id v7 = [v6 safeValueForKey:@"sceneWithFocusIncludingSpringBoard"];
    id v8 = __UIAccessibilityCastAsClass();

    if ([v8 accessibilitySceneIsDeactivatedBySidebar])
    {
      id v9 = AXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXSpringBoardServerHelper nativeFocusedApplication]();
      }
      int v4 = 0;
    }
    else
    {
      id v10 = [v8 definition];
      uint64_t v11 = [v10 clientIdentity];
      id v9 = [v11 processIdentity];

      if (v9)
      {
        double v12 = (void *)MEMORY[0x263F64570];
        double v13 = [MEMORY[0x263F645D8] predicateMatchingIdentity:v9];
        id v18 = 0;
        int v14 = [v12 handleForPredicate:v13 error:&v18];
        double v15 = v18;

        if (v15)
        {
          double v16 = AXLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[AXSpringBoardServerHelper nativeFocusedApplication]();
          }

          int v4 = 0;
        }
        else
        {
          int v4 = [v14 pid];
        }
      }
      else
      {
        double v15 = AXLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[AXSpringBoardServerHelper nativeFocusedApplication]();
        }
        int v4 = 0;
      }
    }
  }

  return v4;
}

- (BOOL)_accessibilityIsUILocked
{
  id v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isScreenLockedWithPasscode:0];

  return v3;
}

- (BOOL)accessibilityIsNotificationVisible
{
  id v2 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"notificationDispatcher"];
  char v3 = __UIAccessibilitySafeClass();

  int v4 = [v3 safeValueForKey:@"bannerDestination"];
  id v5 = __UIAccessibilitySafeClass();

  unint64_t v6 = [v5 safeValueForKey:@"presentedBanner"];
  id v7 = __UIAccessibilitySafeClass();

  objc_opt_class();
  id v8 = __UIAccessibilityCastAsClass();
  if ([v5 safeBoolForKey:@"isPresentingBanner"])
  {
    id v9 = [v8 view];
    char v10 = _SBAXIsViewVisible(v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)accessibilityIsBannerVisible
{
  id v2 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"bannerManager"];
  char v3 = __UIAccessibilitySafeClass();

  int v4 = +[AXSpringBoardServerHelper _axActiveWindowScene];
  char v5 = [v3 isDisplayingBannerInWindowScene:v4];

  return v5;
}

- (BOOL)accessibilityIsRemoteTransientOverlayVisible
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = +[AXSpringBoardServerHelper _axActiveWindowScene];
  [v2 safeArrayForKey:@"windows"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        NSClassFromString(&cfstr_Sbmainswitcher_0.isa);
        if (objc_opt_isKindOfClass())
        {
          id v9 = objc_msgSend(v8, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_2055, (void)v13);
          uint64_t v10 = [v9 count];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __73__AXSpringBoardServerHelper_accessibilityIsRemoteTransientOverlayVisible__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbdeviceapplic_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShowCoverSheet:(BOOL)a3 serverInstance:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  [(AXSpringBoardServerHelper *)self setReachabilityActive:0];
  uint64_t v10 = [(AXSpringBoardServerHelper *)self _accessibilityCoverSheetPresentationManagerSharedInstance];
  BOOL v11 = [v10 safeValueForKey:@"_coverSheetSlidingViewController"];
  double v12 = [v11 safeValueForKey:@"systemGesturesDelegate"];
  long long v13 = v12;
  if (v6)
  {
    if ([(AXSpringBoardServerHelper *)self isCoverSheetVisibleWithServerInstance:v8])
    {
      long long v14 = [(AXSpringBoardServerHelper *)self coverSheetViewController];
      long long v15 = [v14 safeValueForKey:@"mainPageContentViewController"];
      long long v16 = [v15 safeValueForKey:@"combinedListViewController"];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v48 = 0x2020000000;
      LOBYTE(v49) = 0;
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2;
      uint64_t v43 = &unk_2647F06D8;
      p_long long buf = &buf;
      double v17 = v16;
      v44 = v17;
      AXPerformSafeBlock();
      BOOL v18 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
      char v19 = AXLogSpringboardServer();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v20)
        {
          LOWORD(buf) = 0;
          long long v21 = "Revealing more recent notifications";
LABEL_26:
          _os_log_impl(&dword_226EBC000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&buf, 2u);
        }
      }
      else if (v20)
      {
        LOWORD(buf) = 0;
        long long v21 = "Not revealing more recent notifications";
        goto LABEL_26;
      }

      goto LABEL_28;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x2020000000;
    LOBYTE(v49) = 0;
    v46[5] = MEMORY[0x263EF8330];
    v46[6] = 3221225472;
    v46[7] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke;
    v46[8] = &unk_2647F06D8;
    v46[10] = &buf;
    id v27 = v13;
    v46[9] = v27;
    AXPerformSafeBlock();
    BOOL v28 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
    double v17 = AXLogSpringboardServer();
    BOOL v29 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v29)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_226EBC000, v17, OS_LOG_TYPE_INFO, "Not showing CoverSheet because system gesture delegate said no: %@", (uint8_t *)&buf, 0xCu);
      }
      LOBYTE(v18) = 0;
      goto LABEL_28;
    }
    if (v29)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226EBC000, v17, OS_LOG_TYPE_INFO, "Showing CoverSheet and revealing more notifications", (uint8_t *)&buf, 2u);
    }

    id v30 = v46;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2059;
    v46[3] = &unk_2647F0BB8;
    v46[4] = v9;
    [v10 setCoverSheetPresented:1 animated:1 withCompletion:v46];
LABEL_19:
    double v17 = v30[4];
    LOBYTE(v18) = 1;
LABEL_28:

    goto LABEL_29;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  id v36 = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2060;
  uint64_t v37 = &unk_2647F06D8;
  v39 = &buf;
  id v22 = v12;
  id v38 = v22;
  AXPerformSafeBlock();
  int v23 = *(_DWORD *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  BOOL v24 = v23 == 0;
  uint64_t v25 = AXLogSpringboardServer();
  uint64_t v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226EBC000, v26, OS_LOG_TYPE_INFO, "Hiding CS with completion", (uint8_t *)&buf, 2u);
    }

    id v30 = v32;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2061;
    v32[3] = &unk_2647F0BE0;
    v32[4] = v10;
    id v33 = v9;
    AXPerformSafeBlock();

    goto LABEL_19;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_226EBC000, v26, OS_LOG_TYPE_DEFAULT, "Not hiding CS because system gesture delegate said no: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([(AXSpringBoardServerHelper *)self isCoverSheetVisibleWithServerInstance:v8])
  {
    double v17 = AXLogSpringboardServer();
    LOBYTE(v18) = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226EBC000, v17, OS_LOG_TYPE_INFO, "trying to hide recent notifications", (uint8_t *)&buf, 2u);
    }
    goto LABEL_28;
  }
  LOBYTE(v18) = 0;
LABEL_29:

  return v18;
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 safeValueForKey:@"presentGestureRecognizer"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 gestureRecognizerShouldBegin:v3];
}

uint64_t __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2059(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2060(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 safeValueForKey:@"dismissGestureRecognizer"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 gestureRecognizerShouldBegin:v3] ^ 1;
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2061(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2_2062;
  v2[3] = &unk_2647F0BB8;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 setCoverSheetPresented:0 animated:1 withCompletion:v2];
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2_2062(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F83200];
  UIAccessibilityPostNotification(v2, 0);
}

- (BOOL)_accessibilityShowNotificationCenter:(BOOL)a3 serverInstance:(id)a4
{
  BOOL v4 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(AXSpringBoardServerHelper *)self isControlCenterVisibleWithServerInstance:v6])
  {
    [(AXSpringBoardServerHelper *)self accessibilityShowControlCenter:0];
  }
  id v7 = [NSClassFromString(&cfstr_Sbsystemgestur.isa) safeValueForKey:@"mainDisplayManager"];
  *(void *)long long buf = 0;
  v47 = buf;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  uint64_t v40 = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke;
  uint64_t v41 = &unk_2647F06D8;
  uint64_t v43 = buf;
  id v8 = v7;
  id v42 = v8;
  AXPerformSafeBlock();
  BOOL v9 = v47[24] == 0;

  _Block_object_dispose(buf, 8);
  uint64_t v10 = [MEMORY[0x263F22838] server];
  int v11 = [v10 isGuidedAccessActive];

  if (!(v9 | v11))
  {
    double v12 = [NSClassFromString(&cfstr_Sbbulletinwind.isa) safeValueForKey:@"sharedInstance"];
    if (objc_opt_respondsToSelector())
    {
      long long v13 = [v12 safeValueForKey:@"_accessibilityAllowsShowNotificationsGestureFromThreeFingerSwipe"];
      int v14 = [v13 BOOLValue];

      long long v15 = AXLogSpringboardServer();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_226EBC000, v15, OS_LOG_TYPE_INFO, "BB window allows: %d", buf, 8u);
      }

      int v16 = !v4;
      if ((!v4 | v14) != 1) {
        goto LABEL_10;
      }
    }
    else
    {
      int v16 = !v4;
    }
    BOOL v28 = [(AXSpringBoardServerHelper *)self isCoverSheetVisibleWithServerInstance:v6];
    BOOL v18 = [(AXSpringBoardServerHelper *)self coverSheetViewController];
    char v19 = [v18 safeValueForKey:@"mainPageContentViewController"];
    BOOL v20 = [v19 safeValueForKey:@"combinedListViewController"];

    if ([v20 safeBoolForKey:@"_allowNotificationsRevealPolicy"]
      && ((v16 | [v20 safeBoolForKey:@"_shouldPreventNotificationHistoryRevealForActiveDNDState"]) & 1) == 0)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      uint64_t v34 = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2071;
      uint64_t v35 = &unk_2647F0B30;
      id v36 = v20;
      BOOL v37 = v4;
      AXPerformSafeBlock();
      id v22 = objc_alloc(MEMORY[0x263F086A0]);
      int v23 = SBAXLocalizedString(@"notification.center.showing");
      uint64_t v44 = *MEMORY[0x263F216D8];
      v45 = &unk_26DB20070;
      BOOL v24 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v25 = (void *)[v22 initWithString:v23 attributes:v24];

      UIAccessibilityPostNotification(*MEMORY[0x263F83188], v25);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2078;
      aBlock[3] = &unk_2647F0728;
      id v30 = v36;
      uint64_t v31 = self;
      long long v21 = (void (**)(void))_Block_copy(aBlock);
    }
    else
    {
      long long v21 = 0;
    }
    if (v4)
    {
      if (v28)
      {
        if (v21) {
          v21[2](v21);
        }
        BOOL v17 = 1;
        goto LABEL_24;
      }
      BOOL v26 = [(AXSpringBoardServerHelper *)self _accessibilityShowCoverSheet:1 serverInstance:v6 completion:v21];
    }
    else
    {
      BOOL v26 = [(AXSpringBoardServerHelper *)self _accessibilityShowCoverSheet:0 serverInstance:v6 completion:v21];
    }
    BOOL v17 = v26;
LABEL_24:

    goto LABEL_25;
  }
  double v12 = AXLogSpringboardServer();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_226EBC000, v12, OS_LOG_TYPE_INFO, "GAX active or generally not allowed", buf, 2u);
  }
LABEL_10:
  BOOL v17 = 0;
LABEL_25:

  return v17;
}

uint64_t __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGestureWithTypeAllowed:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2071(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_structuredListViewController"];
  [v2 revealNotificationHistory:*(unsigned __int8 *)(a1 + 40) animated:0];
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2078(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_3;
  aBlock[3] = &unk_2647F0648;
  id v9 = *(id *)(a1 + 32);
  id v2 = (void (**)(void))_Block_copy(aBlock);
  id v3 = [*(id *)(a1 + 40) coverSheetViewController];
  uint64_t v4 = [v3 safeUnsignedIntegerForKey:@"_indexOfMainPage"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2[2](v2);
  }
  else
  {
    uint64_t v5 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_4;
    v6[3] = &unk_2647F0BB8;
    id v7 = v2;
    [v3 activatePage:v5 animated:1 withCompletion:v6];
  }
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"_structuredListViewController"];
  id v1 = [v4 view];
  [v1 setNeedsLayout];

  id v2 = [v4 view];
  [v2 layoutIfNeeded];

  LODWORD(v2) = *MEMORY[0x263F831C0];
  id v3 = [v4 view];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);
}

uint64_t __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_accessibilityCoverSheetPresentationManagerSharedInstance
{
  if (_accessibilityCoverSheetPresentationManagerSharedInstance_onceToken != -1) {
    dispatch_once(&_accessibilityCoverSheetPresentationManagerSharedInstance_onceToken, &__block_literal_global_2080);
  }
  id v2 = (void *)_accessibilityCoverSheetPresentationManagerSharedInstance_SBCoverSheetPresentationManager;
  return (id)[v2 safeValueForKey:@"sharedInstance"];
}

Class __86__AXSpringBoardServerHelper__accessibilityCoverSheetPresentationManagerSharedInstance__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbcoversheetpr.isa);
  _accessibilityCoverSheetPresentationManagerSharedInstance_SBCoverSheetPresentationManager = (uint64_t)result;
  return result;
}

- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3
{
}

- (BOOL)_accessibilityAllowShowNotificationGestureOverride
{
  return [(id)*MEMORY[0x263F83300] _accessibilityBoolValueForKey:@"AXSBAllowShowNotificationGesture"];
}

- (BOOL)accessibilityShowControlCenter:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = ASTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_INFO, "Show CC: %d", buf, 8u);
  }

  id v6 = [NSClassFromString(&cfstr_Sbsystemgestur.isa) safeValueForKey:@"mainDisplayManager"];
  *(void *)long long buf = 0;
  *(void *)&long long v28 = buf;
  *((void *)&v28 + 1) = 0x2020000000;
  char v29 = 0;
  v26[1] = (id)MEMORY[0x263EF8330];
  v26[2] = (id)3221225472;
  v26[3] = __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke;
  v26[4] = &unk_2647F06D8;
  v26[6] = buf;
  id v7 = v6;
  v26[5] = v7;
  AXPerformSafeBlock();
  int v8 = *(unsigned __int8 *)(v28 + 24);
  BOOL v9 = *(unsigned char *)(v28 + 24) == 0;

  _Block_object_dispose(buf, 8);
  if (!v9 || !v3)
  {
    if (v3)
    {
      double v12 = [MEMORY[0x263F22838] server];
      int v13 = [v12 isGuidedAccessActive];

      if (v13)
      {
        uint64_t v10 = ASTLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
        *(_WORD *)long long buf = 0;
        int v11 = "Show CC: No because GA is active";
        goto LABEL_6;
      }
    }
    uint64_t v10 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstance"];
    [(AXSpringBoardServerHelper *)self _accessibilitySetAllowShowNotificationGestureOverride:1];
    if ([(AXSpringBoardServerHelper *)self _accessibilityIsUILocked])
    {
      if (!v3)
      {
        int v14 = 1;
        goto LABEL_23;
      }
      int v14 = [v10 safeBoolForKey:@"allowShowTransitionSystemGesture"];
      long long v15 = ASTLogCommon();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
LABEL_22:

LABEL_23:
        char v19 = ASTLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v14;
          LOWORD(v28) = 2114;
          *(void *)((char *)&v28 + 2) = v10;
          _os_log_impl(&dword_226EBC000, v19, OS_LOG_TYPE_INFO, "Show CC: Allow transition: %d %{public}@", buf, 0x12u);
        }

        if ((v3 & v14) == 1)
        {
          [(AXSpringBoardServerHelper *)self _accessibilitySetAllowShowNotificationGestureOverride:0];
          [v10 _accessibilitySetBoolValue:1 forKey:@"IsAXActivating"];
          v25[1] = MEMORY[0x263EF8330];
          v25[2] = 3221225472;
          v25[3] = __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_2087;
          v25[4] = &unk_2647F0648;
          v26[0] = v10;
          AXPerformSafeBlock();
          [v26[0] _accessibilitySetBoolValue:0 forKey:@"IsAXActivating"];
          BOOL v20 = ASTLogCommon();
          long long v21 = v26;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            id v22 = "Show CC: Presenting CC";
LABEL_32:
            _os_log_impl(&dword_226EBC000, v20, OS_LOG_TYPE_INFO, v22, buf, 2u);
          }
        }
        else
        {
          [(AXSpringBoardServerHelper *)self _accessibilitySetAllowShowNotificationGestureOverride:0];
          if ((v3 | v14 ^ 1)) {
            goto LABEL_29;
          }
          v25[0] = v10;
          AXPerformSafeBlock();
          BOOL v20 = ASTLogCommon();
          long long v21 = (id *)v25;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            id v22 = "Show CC: Dismiss CC";
            goto LABEL_32;
          }
        }

        BOOL v23 = 1;
        goto LABEL_34;
      }
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v8;
      LOWORD(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 2) = v14;
      int v16 = "Show CC: UI is locked, generally allowed: %d, ccAllows: %d";
      BOOL v17 = v15;
      uint32_t v18 = 14;
    }
    else
    {
      if (v3) {
        int v14 = [v10 safeBoolForKey:@"canBePresented"];
      }
      else {
        int v14 = 1;
      }
      long long v15 = ASTLogCommon();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v14;
      int v16 = "Show CC: controller allows transition: %d";
      BOOL v17 = v15;
      uint32_t v18 = 8;
    }
    _os_log_impl(&dword_226EBC000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
    goto LABEL_22;
  }
  uint64_t v10 = ASTLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    int v11 = "Show CC: Gesture manager said not generally allowed";
LABEL_6:
    _os_log_impl(&dword_226EBC000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
  }
LABEL_29:
  BOOL v23 = 0;
LABEL_34:

  return v23;
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGestureWithTypeAllowed:6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_2087(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAnimated:1];
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_2088(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAnimated:1];
}

- (BOOL)isSystemAppShowingAnAlertWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__AXSpringBoardServerHelper_isSystemAppShowingAnAlertWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  void v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __73__AXSpringBoardServerHelper_isSystemAppShowingAnAlertWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = AXFrontBoardIsSystemAppShowingAlert();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)focusedAppPIDWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__0;
  double v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__AXSpringBoardServerHelper_focusedAppPIDWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __61__AXSpringBoardServerHelper_focusedAppPIDWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardFocusedAppPID();
  return MEMORY[0x270F9A758]();
}

- (int)purpleBuddyPIDWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -1;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__AXSpringBoardServerHelper_purpleBuddyPIDWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  void v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LODWORD(v4) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return (int)v4;
}

uint64_t __62__AXSpringBoardServerHelper_purpleBuddyPIDWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = AXFrontBoardPurpleBuddyPID();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)runningAppPIDsWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__0;
  double v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__AXSpringBoardServerHelper_runningAppPIDsWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __62__AXSpringBoardServerHelper_runningAppPIDsWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardRunningAppPIDs();
  return MEMORY[0x270F9A758]();
}

- (BOOL)isSystemAppFrontmostExcludingSiri:(BOOL)a3 withServerInstance:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = [MEMORY[0x263F21380] mainAccessQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__AXSpringBoardServerHelper_isSystemAppFrontmostExcludingSiri_withServerInstance___block_invoke;
  v10[3] = &unk_2647F0C08;
  BOOL v13 = a3;
  void v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  double v12 = &v14;
  [v7 performSynchronousReadingBlock:v10];

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

void __82__AXSpringBoardServerHelper_isSystemAppFrontmostExcludingSiri_withServerInstance___block_invoke(uint64_t a1)
{
  AXFrontBoardSystemAppProcess();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = AXFrontBoardFocusedAppProcessesForGuidedAccess();
  id v3 = [v2 firstObject];

  if (v4 == v3
    || [*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)isSettingsAppFrontmostWithServerInstance:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [MEMORY[0x263F21380] mainAccessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__AXSpringBoardServerHelper_isSettingsAppFrontmostWithServerInstance___block_invoke;
  v8[3] = &unk_2647F0C30;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 performSynchronousReadingBlock:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_isSettingsAppFrontmostWithServerInstance___block_invoke(uint64_t a1)
{
  AXFrontBoardSystemAppProcess();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  AXFrontBoardFocusedAppProcess();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v2
    || [*(id *)(a1 + 32) isScreenLockedWithServerInstance:*(void *)(a1 + 40)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)focusedAppsWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  double v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__AXSpringBoardServerHelper_focusedAppsWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __59__AXSpringBoardServerHelper_focusedAppsWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardFocusedApps();
  return MEMORY[0x270F9A758]();
}

- (id)displayIdentifierForSceneIdentifier:(id)a3 serverInstance:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AXSpringBoardServerHelper _axActiveWindowScene];
  uint64_t v8 = [v7 safeValueForKey:@"sceneManager"];

  [v8 safeSetForKey:@"allScenes"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) safeValueForKey:@"identifier"];
        int v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          objc_opt_class();
          char v17 = [v8 safeValueForKey:@"displayIdentity"];
          uint32_t v18 = __UIAccessibilityCastAsClass();

          uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v18, "displayID"));

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_11:

  return v16;
}

- (id)focusedOccludedAppScenesWithServerInstance:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  LOBYTE(v41) = 0;
  id v4 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"windowSceneManager"];
  uint64_t v16 = __UIAccessibilitySafeClass();

  [v16 safeSetForKey:@"connectedWindowScenes"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v22 = [*(id *)(*((void *)&v51 + 1) + 8 * i) safeValueForKey:@"switcherController"];
        if ([v22 safeBoolForKey:@"isChamoisWindowingUIEnabled"])
        {
          uint64_t v25 = [v22 safeValueForKey:@"contentViewController"];
          char v19 = [v22 safeValueForKey:@"_currentMainAppLayout"];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v23 = [v19 safeArrayForKey:@"leafAppLayouts"];
          uint64_t v26 = [v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v26)
          {
            uint64_t v24 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v48 != v24) {
                  objc_enumerationMutation(v23);
                }
                id v5 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                uint64_t v41 = 0;
                id v42 = &v41;
                uint64_t v43 = 0x3032000000;
                uint64_t v44 = __Block_byref_object_copy__0;
                v45 = __Block_byref_object_dispose__0;
                id v46 = 0;
                uint64_t v34 = MEMORY[0x263EF8330];
                uint64_t v35 = 3221225472;
                id v36 = __72__AXSpringBoardServerHelper_focusedOccludedAppScenesWithServerInstance___block_invoke;
                BOOL v37 = &unk_2647F09B8;
                uint64_t v40 = &v41;
                id v38 = v25;
                uint64_t v39 = v5;
                AXPerformSafeBlock();
                id v28 = (id)v42[5];

                _Block_object_dispose(&v41, 8);
                if ([v28 safeBoolForKey:@"isSelectable"])
                {
                  id v27 = [v5 safeDictionaryForKey:@"itemsToLayoutAttributesMap"];
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v30 = 0u;
                  long long v31 = 0u;
                  id v6 = [v27 allKeys];
                  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v55 count:16];
                  if (v7)
                  {
                    uint64_t v8 = *(void *)v31;
                    do
                    {
                      for (uint64_t k = 0; k != v7; ++k)
                      {
                        if (*(void *)v31 != v8) {
                          objc_enumerationMutation(v6);
                        }
                        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * k);
                        uint64_t v11 = [v10 safeStringForKey:@"bundleIdentifier"];
                        uint64_t v12 = [v10 safeStringForKey:@"uniqueIdentifier"];
                        id v13 = (void *)[objc_alloc(MEMORY[0x263F22818]) initWithBundleIdentifier:v11 fbSceneIdentifier:v12];
                        [v3 addObject:v13];
                      }
                      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v55 count:16];
                    }
                    while (v7);
                  }
                }
              }
              uint64_t v26 = [v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v26);
          }
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v20);
  }

  return v3;
}

uint64_t __72__AXSpringBoardServerHelper_focusedOccludedAppScenesWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _itemContainerForAppLayoutIfExists:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (BOOL)isPurpleBuddyAppFrontmostWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__AXSpringBoardServerHelper_isPurpleBuddyAppFrontmostWithServerInstance___block_invoke;
  v6[3] = &unk_2647F0860;
  void v6[4] = &v7;
  [v4 performSynchronousReadingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __73__AXSpringBoardServerHelper_isPurpleBuddyAppFrontmostWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result = AXIsPurpleBuddyFrontmost();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)frontmostAppProcessWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_frontmostAppProcessWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __67__AXSpringBoardServerHelper_frontmostAppProcessWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardFocusedAppProcess();
  return MEMORY[0x270F9A758]();
}

- (id)focusedAppProcessWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__AXSpringBoardServerHelper_focusedAppProcessWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __65__AXSpringBoardServerHelper_focusedAppProcessWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardFocusedAppProcess();
  return MEMORY[0x270F9A758]();
}

- (id)runningAppProcessesWithServerInstance:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [MEMORY[0x263F21380] mainAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_runningAppProcessesWithServerInstance___block_invoke;
  v7[3] = &unk_2647F0860;
  v7[4] = &v8;
  [v4 performSynchronousReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __67__AXSpringBoardServerHelper_runningAppProcessesWithServerInstance___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AXFrontBoardRunningAppProcesses();
  return MEMORY[0x270F9A758]();
}

- (id)_visibleTripleClickItems
{
  [(AXSpringBoardServerHelper *)self _updateVisibleTripleClickItems];
  visibleTripleClickItems = self->_visibleTripleClickItems;
  return visibleTripleClickItems;
}

- (void)_updateVisibleTripleClickItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_visibleTripleClickItems removeAllObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)_AXSTripleClickCopyOptions();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (-[AXSpringBoardServerHelper _shouldShowTCOption:](self, "_shouldShowTCOption:", objc_msgSend(v8, "intValue", (void)v9)))
        {
          [(NSMutableArray *)self->_visibleTripleClickItems addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(AXSpringBoardServerHelper *)self _sortVisibleItems];
}

- (BOOL)isBuddyRunning
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(AXSpringBoardServerHelper *)self runningAppProcessesWithServerInstance:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __43__AXSpringBoardServerHelper_isBuddyRunning__block_invoke;
  v5[3] = &unk_2647F0C58;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__AXSpringBoardServerHelper_isBuddyRunning__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 safeValueForKey:@"bundleIdentifier"];
  int v7 = [v6 isEqualToString:@"com.apple.purplebuddy"];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isPreferencesFrontmost
{
  id v2 = AXFrontBoardFocusedAppProcess();
  char v3 = [v2 safeValueForKey:@"bundleIdentifier"];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F21330]];

  return v4;
}

- (BOOL)isInCallServiceFrontmost
{
  id v2 = AXFrontBoardFocusedAppProcess();
  char v3 = [v2 safeValueForKey:@"bundleIdentifier"];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F21248]];

  return v4;
}

- (BOOL)isPasscodeLockVisible
{
  id v2 = AXSpringBoardGlueSBLockScreenControllerInstance();
  char v3 = [v2 safeBoolForKey:@"isPasscodeEntryTransientOverlayVisible"];
  char v4 = AXSBLockScreenEnvironment();
  uint64_t v5 = [v4 safeValueForKey:@"passcodeViewPresenter"];
  char v6 = [v5 safeBoolForKey:@"isPasscodeLockVisible"];

  return v3 | v6;
}

- (BOOL)isLockScreenVisible
{
  id v2 = AXSpringBoardGlueSBLockScreenControllerInstance();
  char v3 = [v2 safeBoolForKey:@"isLockScreenVisible"];

  return v3;
}

- (BOOL)_shouldShowTCOption:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  LOBYTE(v5) = 0;
  switch(a3)
  {
    case 5:
      return v5;
    case 6:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 15:
      goto LABEL_13;
    case 7:
      if (![(AXSpringBoardServerHelper *)self isSystemAppFrontmostExcludingSiri:0 withServerInstance:0])goto LABEL_8; {
      char v6 = [MEMORY[0x263F22938] sharedInstance];
      }
      char v7 = [v6 guidedAccessEnableExperimentalUI];

      if (v7) {
        goto LABEL_8;
      }
      BOOL v8 = [(AXSpringBoardServerHelper *)self hasActiveOrPendingCallOrFaceTimeWithServerInstance:0];
      char v9 = GAXLogCommon();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v8)
      {
        if (v10)
        {
          *(_WORD *)long long v30 = 0;
          _os_log_impl(&dword_226EBC000, v9, OS_LOG_TYPE_DEFAULT, "Not showing Guided Access in triple click: system app is frontmost.", v30, 2u);
        }
LABEL_34:

        goto LABEL_43;
      }
      if (v10)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226EBC000, v9, OS_LOG_TYPE_DEFAULT, "Showing Guided Access in triple click due to call.", buf, 2u);
      }

LABEL_8:
      if ([(AXSpringBoardServerHelper *)self isAppSwitcherVisibleWithServerInstance:0])
      {
        long long v11 = GAXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = 0;
          long long v12 = "Not showing Guided Access in triple click: app switcher is active.";
          id v13 = (uint8_t *)&v29;
LABEL_41:
          _os_log_impl(&dword_226EBC000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
          goto LABEL_42;
        }
        goto LABEL_42;
      }
      long long v22 = [(AXSpringBoardServerHelper *)self sideAppManager];
      int v23 = [v22 hasMultipleApps];

      if (v23)
      {
        long long v11 = GAXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = 0;
          long long v12 = "Not showing Guided Access in triple click: multiple apps are active.";
          id v13 = (uint8_t *)&v28;
          goto LABEL_41;
        }
LABEL_42:

LABEL_43:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ([(AXSpringBoardServerHelper *)self isMakingEmergencyCallWithServerInstance:0])
      {
        long long v11 = GAXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = 0;
          long long v12 = "Not showing Guided Access in triple click: emergency call.";
          id v13 = (uint8_t *)&v27;
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      if ([(AXSpringBoardServerHelper *)self isBuddyRunning])
      {
        long long v11 = GAXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = 0;
          long long v12 = "Not showing Guided Access in triple click: setup.";
          id v13 = (uint8_t *)&v26;
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      if ([(AXSpringBoardServerHelper *)self isPreferencesFrontmost])
      {
        long long v11 = GAXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = 0;
          long long v12 = "Not showing Guided Access in triple click: Settings is frontmost.";
          id v13 = (uint8_t *)&v25;
          goto LABEL_41;
        }
        goto LABEL_42;
      }
LABEL_13:
      uint64_t v16 = [MEMORY[0x263F229B8] titleForTripleClickOption:v3];
      LOBYTE(v5) = [v16 length] != 0;
LABEL_25:

      return v5;
    case 8:
      char v9 = [MEMORY[0x263F47530] sharedInstance];
      uint64_t v17 = [v9 pairedHearingAids];
      if (!v17) {
        goto LABEL_34;
      }
      uint64_t v18 = (void *)v17;
      char v19 = [MEMORY[0x263F47530] sharedInstance];
      char v20 = [v19 isiCloudPaired];

      if (v20) {
        goto LABEL_43;
      }
      if ([(AXSpringBoardServerHelper *)self isScreenLockedWithServerInstance:0])
      {
        long long v21 = [MEMORY[0x263F22938] sharedInstance];
        int v5 = [v21 allowHearingAidControlOnLockScreen];

        if (!v5) {
          return v5;
        }
      }
LABEL_12:
      uint64_t v14 = [MEMORY[0x263F22938] sharedInstance];
      uint64_t v15 = [v14 voiceOverActivationWorkaround];

      if (v15 != 3) {
        goto LABEL_13;
      }
      goto LABEL_43;
    case 12:
      uint64_t v16 = [MEMORY[0x263F22968] server];
      if ([v16 isMagnifierVisible]) {
        LOBYTE(v5) = 0;
      }
      else {
        int v5 = ![(AXSpringBoardServerHelper *)self isPasscodeLockVisible];
      }
      goto LABEL_25;
    case 16:
      return MEMORY[0x270F0A010](self, a2);
    default:
      if (a3 == 1) {
        goto LABEL_12;
      }
      goto LABEL_13;
  }
}

- (BOOL)shouldOverrideInterfaceOrientation
{
  return self->_shouldOverrideInterfaceOrientation;
}

- (void)_sortVisibleItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  char v4 = [v3 tripleClickOrderedOptions];

  visibleTripleClickItems = self->_visibleTripleClickItems;
  if (v4)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke;
    v13[3] = &unk_2647F0C80;
    id v14 = v4;
    [(NSMutableArray *)visibleTripleClickItems sortUsingComparator:v13];
    char v6 = [MEMORY[0x263F213A8] sharedInstance];
    char v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = [MEMORY[0x263F213A8] identifier];
      char v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        long long v11 = AXColorizeFormatLog();
        long long v12 = _AXStringForArgs();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v16 = v12;
          _os_log_impl(&dword_226EBC000, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    [(NSMutableArray *)visibleTripleClickItems sortUsingComparator:&__block_literal_global_2103];
  }
}

uint64_t __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = NSNumber;
  char v6 = *(void **)(a1 + 32);
  id v7 = a3;
  BOOL v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  char v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  long long v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

uint64_t __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke_2101(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 intValue] == 1)
  {
    uint64_t v6 = -1;
  }
  else if ([v5 intValue] == 1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263F229B8], "titleForTripleClickOption:", objc_msgSend(v4, "intValue"));
    BOOL v8 = objc_msgSend(MEMORY[0x263F229B8], "titleForTripleClickOption:", objc_msgSend(v5, "intValue"));
    uint64_t v6 = [v7 localizedCompare:v8];
  }
  return v6;
}

- (void)_handleAlertActionPress:(id)a3
{
  id alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  if (alertHandler)
  {
    alertHandler[2](alertHandler, [a3 buttonIndex]);
    id v5 = self->_alertHandler;
  }
  else
  {
    id v5 = 0;
  }
  self->_id alertHandler = 0;

  [(AXSpringBoardServerHelper *)self _cleanupAlertController];
}

- (void)_toggleTripleClickDisplay
{
  id v2 = self;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(UIWindow *)self->_presentationWindow rootViewController];
  id v4 = [v3 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(AXSpringBoardServerHelper *)v2 _dismissAlertController];
    uint64_t v6 = AXLogSpringboardServer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226EBC000, v6, OS_LOG_TYPE_DEFAULT, "Triple click: dismissed.", buf, 2u);
    }
  }
  else
  {
    if (_AXSLiveSpeechEnabled()) {
      _AXSLiveSpeechSetEnabled();
    }
    id v7 = SBAXLocalizedString(@"ask.sheet.title");
    uint64_t v6 = +[AXTripleClickAlertController alertControllerWithTitle:v7 message:0 preferredStyle:AXDeviceIsPad()];

    [v6 _accessibilitySetBoolValue:1 forKey:@"IsTripleClick"];
    [(AXSpringBoardServerHelper *)v2 _updateVisibleTripleClickItems];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v2->_visibleTripleClickItems;
    uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v12 = [v11 intValue];
          uint64_t v13 = [MEMORY[0x263F229B8] titleForTripleClickOption:v12];
          id v14 = &stru_26DB17D90;
          if (v13) {
            id v14 = (__CFString *)v13;
          }
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke;
          v33[3] = &unk_2647F0CC8;
          uint64_t v34 = v14;
          uint64_t v35 = v2;
          uint64_t v15 = v14;
          uint64_t v16 = +[AXAlertAction actionWithTitle:v15 style:0 handler:v33];
          objc_msgSend(v16, "setButtonIndex:", objc_msgSend(v11, "integerValue"));
          uint64_t v17 = v2;
          uint64_t v18 = (void *)MEMORY[0x263F229B8];
          uint64_t v19 = [v11 intValue];
          char v20 = v18;
          id v2 = v17;
          objc_msgSend(v16, "_setChecked:", objc_msgSend(v20, "valueForTripleClickOption:", v19));
          [v6 addAction:v16];
        }
        uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v9);
    }

    long long v21 = AXParameterizedLocalizedString();
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_2113;
    v32[3] = &unk_2647F0CF0;
    v32[4] = v2;
    long long v22 = +[AXAlertAction actionWithTitle:v21 style:1 handler:v32];

    [v6 addAction:v22];
    if ([(NSMutableArray *)v2->_visibleTripleClickItems count])
    {
      if ([(NSMutableArray *)v2->_visibleTripleClickItems count] == 1)
      {
        int v23 = [v6 actions];
        uint64_t v24 = [v23 firstObject];
        [(AXSpringBoardServerHelper *)v2 _handleAlertActionPress:v24];
      }
      else
      {
        v2->_shouldOverrideInterfaceOrientation = 1;
        [(AXSpringBoardServerHelper *)v2 _displayAlertController:v6];
        __int16 v25 = AXLogSpringboardServer();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_226EBC000, v25, OS_LOG_TYPE_DEFAULT, "Triple click: presented.", buf, 2u);
        }

        __int16 v26 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v27 = *MEMORY[0x263F22698];
        uint64_t v41 = @"windowContextID";
        __int16 v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIWindow _contextId](v2->_presentationWindow, "_contextId"));
        id v42 = v28;
        __int16 v29 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        [v26 postNotificationName:v27 object:0 userInfo:v29];

        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
    else
    {
      [(AXSpringBoardServerHelper *)v2 _handleAlertActionPress:v22];
    }
  }
}

void __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = AXLogSpringboardServer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: selected %@.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 40) _handleAlertActionPress:v3];
}

void __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_2113(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogSpringboardServer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: canceled.", v5, 2u);
  }

  [*(id *)(a1 + 32) _handleAlertActionPress:v3];
}

uint64_t __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_2117(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (void)_displayAlertController:(id)a3
{
  [(AXSpringBoardServerHelper *)self _displayViewController:a3 withCompletion:0];
  id v4 = [MEMORY[0x263F22820] assertionWithType:*MEMORY[0x263F223D0] identifier:@"AXSpringBoardServerHelper"];
  [(AXSpringBoardServerHelper *)self setDisableSystemGesturesAssertionForAlert:v4];
}

- (void)_displayViewController:(id)a3
{
}

- (void)_displayViewController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(AXSpringBoardServerHelper *)self _isDisplayingAlertController])
  {
    presentationWindow = self->_presentationWindow;
    if (!presentationWindow)
    {
      uint64_t v9 = NSClassFromString(&cfstr_AxSbsecuremain.isa);
      if (!v9)
      {
        uint64_t v10 = AXLogValidations();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[AXSpringBoardServerHelper _displayViewController:withCompletion:]();
        }

        uint64_t v9 = objc_opt_class();
      }
      int v11 = [v9 isEqual:NSClassFromString(&cfstr_AxSbsecuremain.isa)];
      id v12 = objc_alloc_init(MEMORY[0x263F82E10]);
      uint64_t v13 = v12;
      if (v11)
      {
        id v22 = v12;
        AXPerformSafeBlock();
      }
      else
      {
        id v14 = objc_alloc((Class)v9);
        uint64_t v15 = [MEMORY[0x263F82B60] mainScreen];
        [v15 bounds];
        uint64_t v16 = (UIWindow *)objc_msgSend(v14, "initWithFrame:");
        uint64_t v17 = self->_presentationWindow;
        self->_presentationWindow = v16;

        [(UIWindow *)self->_presentationWindow setRootViewController:v13];
      }
      [(UIWindow *)self->_presentationWindow setAutorotates:1];
      [(UIWindow *)self->_presentationWindow setAccessibilityViewIsModal:1];
      [(UIWindow *)self->_presentationWindow setHidden:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        AXSBPrepareWindowForTripleClickSpeaking(self->_presentationWindow);
      }
      [(UIWindow *)self->_presentationWindow setWindowLevel:10000009.0];
      uint64_t v18 = [(AXSpringBoardServerHelper *)self presentationWindowFocusAssertion];

      if (v18)
      {
        uint64_t v19 = AXLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[AXSpringBoardServerHelper _displayViewController:withCompletion:]();
        }
      }
      [(AXSpringBoardServerHelper *)self presentationWindowFocusAssertion];

      if (v11)
      {
        objc_opt_class();
        char v20 = [(UIWindow *)self->_presentationWindow safeValueForKey:@"contentViewController"];
        long long v21 = __UIAccessibilityCastAsClass();

        if (!v21)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:
        [v21 presentViewController:v6 animated:1 completion:&__block_literal_global_2132];
        goto LABEL_20;
      }
      presentationWindow = self->_presentationWindow;
    }
    long long v21 = [(UIWindow *)presentationWindow rootViewController];
    if (!v21) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke;
  v23[3] = &unk_2647F0D18;
  v23[4] = self;
  id v24 = v6;
  id v25 = v7;
  [(AXSpringBoardServerHelper *)self _dismissAlertControllerWithCompletion:v23];

LABEL_21:
}

uint64_t __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayViewController:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

uint64_t __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke_2122(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 48)) initWithRole:@"SBTraitsParticipantRoleAlert" debugName:@"AccessibilityShortcut"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v6 setContentViewController:v5];
}

void __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke_2130()
{
  id v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 setNeedsFocusUpdate];
}

- (BOOL)_isDisplayingAlertController
{
  uint64_t v2 = [(UIWindow *)self->_presentationWindow rootViewController];
  uint64_t v3 = [v2 presentedViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_dismissAlertController
{
}

- (void)_dismissAlertControllerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __67__AXSpringBoardServerHelper__dismissAlertControllerWithCompletion___block_invoke;
  uint64_t v10 = &unk_2647F0BE0;
  int v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = _Block_copy(&v7);
  -[AXSpringBoardServerHelper _dismissViewControllerWithCompletion:](self, "_dismissViewControllerWithCompletion:", v6, v7, v8, v9, v10, v11);
}

uint64_t __67__AXSpringBoardServerHelper__dismissAlertControllerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissAlertWithCancel];
  [*(id *)(a1 + 32) _cleanupAlertController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_dismissViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(UIWindow *)self->_presentationWindow rootViewController];
  id v6 = [v5 presentedViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__AXSpringBoardServerHelper__dismissViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_2647F0BE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __66__AXSpringBoardServerHelper__dismissViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupPresentationWindow];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_cleanupAlertController
{
  [(AXSpringBoardServerHelper *)self _cleanupPresentationWindow];
  [(AXSpringBoardServerHelper *)self setDisableSystemGesturesAssertionForAlert:0];
}

- (void)_cleanupPresentationWindow
{
  [(UIWindow *)self->_presentationWindow setHidden:1];
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = 0;

  id v4 = [(AXSpringBoardServerHelper *)self presentationWindowFocusAssertion];
  [v4 invalidate];

  [(AXSpringBoardServerHelper *)self setPresentationWindowFocusAssertion:0];
}

- (void)dismissAlertWithCancel
{
  id alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  if (alertHandler)
  {
    alertHandler[2](alertHandler, 0x7FFFFFFFFFFFFFFFLL);
    id alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  }
  self->_id alertHandler = 0;
}

- (void)_handleTripleClickAskAlert
{
  id v6 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v3 = [v6 safeValueForKey:@"_accessibilityObjectWithinProximity"];
  char v4 = [v3 BOOLValue];

  BOOL v5 = [(AXSpringBoardServerHelper *)self isSystemSleepingWithServerInstance:0];
  if ((v4 & 1) != 0 || v5) {
    [(AXSpringBoardServerHelper *)self dismissAlertWithCancel];
  }
  else {
    [(AXSpringBoardServerHelper *)self _toggleTripleClickDisplay];
  }
}

- (void)_handleZoomConflictAlert:(id)a3
{
  char v4 = NSString;
  id v5 = a3;
  id v6 = SBAXLocalizedString(@"ZoomConflictMessage");
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5, v5);

  uint64_t v8 = (void *)MEMORY[0x263F82418];
  id v9 = SBAXLocalizedString(@"ZoomConflictTitle");
  uint64_t v10 = [v8 alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  int v11 = SBAXLocalizedString(@"No");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke;
  v16[3] = &unk_2647F0CF0;
  v16[4] = self;
  id v12 = +[AXAlertAction actionWithTitle:v11 style:1 handler:v16];

  [v12 setButtonIndex:0];
  [v10 addAction:v12];
  uint64_t v13 = SBAXLocalizedString(@"Yes");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke_2;
  v15[3] = &unk_2647F0CF0;
  v15[4] = self;
  id v14 = +[AXAlertAction actionWithTitle:v13 style:0 handler:v15];

  [v14 setButtonIndex:1];
  [v10 addAction:v14];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v10];
}

uint64_t __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleZoomTripleClickAfterConflict
{
  uint64_t v3 = AXLocStringKeyForHomeButtonAndExclusiveModel();
  char v4 = SBAXLocalizedStringWithTable(v3, @"Accessibility");
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = SBAXLocalizedString(@"TripleClickEnableTitle");
  id v7 = [v5 alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  uint64_t v8 = SBAXLocalizedString(@"No");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke;
  v13[3] = &unk_2647F0CF0;
  void v13[4] = self;
  id v9 = +[AXAlertAction actionWithTitle:v8 style:1 handler:v13];

  [v9 setButtonIndex:0];
  [v7 addAction:v9];
  uint64_t v10 = SBAXLocalizedString(@"Yes");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke_2;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  int v11 = +[AXAlertAction actionWithTitle:v10 style:0 handler:v12];

  [v11 setButtonIndex:1];
  [v7 addAction:v11];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v7];
}

uint64_t __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleDisableBrightnessFiltersAlert:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F8B198];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F8B1A0]];
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = SBAXLocalizedStringWithTable(v7, v6);

    uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F8B190]];

    SBAXLocalizedStringWithTable(v10, v6);
  }
  else
  {
    id v9 = SBAXLocalizedString(v7);

    uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F8B190]];

    SBAXLocalizedString(v10);
  int v11 = };

  id v12 = [MEMORY[0x263F82418] alertControllerWithTitle:v9 message:v11 preferredStyle:1];
  uint64_t v13 = SBAXLocalizedString(@"cancel");
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke;
  v18[3] = &unk_2647F0CF0;
  v18[4] = self;
  id v14 = +[AXAlertAction actionWithTitle:v13 style:1 handler:v18];

  [v14 setButtonIndex:0];
  [v12 addAction:v14];
  uint64_t v15 = SBAXLocalizedString(@"enable");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke_2;
  v17[3] = &unk_2647F0CF0;
  v17[4] = self;
  uint64_t v16 = +[AXAlertAction actionWithTitle:v15 style:0 handler:v17];

  [v16 setButtonIndex:1];
  [v12 addAction:v16];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v12];
}

uint64_t __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (id)_handleConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4
{
  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = a4;
  id v8 = a3;
  id v9 = SBAXLocalizedString(@"USAGE_CONFIRMED_TITLE");
  uint64_t v10 = [v6 alertControllerWithTitle:v9 message:v8 preferredStyle:1];

  int v11 = SBAXLocalizedString(@"cancel");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke;
  v16[3] = &unk_2647F0CF0;
  v16[4] = self;
  id v12 = +[AXAlertAction actionWithTitle:v11 style:1 handler:v16];

  [v10 addAction:v12];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke_2;
  v15[3] = &unk_2647F0CF0;
  v15[4] = self;
  uint64_t v13 = +[AXAlertAction actionWithTitle:v7 style:0 handler:v15];

  [v13 setButtonIndex:0];
  [v10 addAction:v13];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v10];

  return v10;
}

uint64_t __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (id)_handleVOConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4
{
  id v5 = [MEMORY[0x263F82418] alertControllerWithTitle:a3 message:0 preferredStyle:0];
  id v6 = [v5 view];
  [v6 setAccessibilityIdentifier:@"VO_USAGE_CONFIRMED_ALERT"];

  id v7 = SBAXLocalizedString(@"VoiceOver.confirmation.launchTutorial");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke;
  v16[3] = &unk_2647F0CF0;
  v16[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:0 handler:v16];

  [v8 setButtonIndex:0];
  [v8 setAccessibilityIdentifier:@"VO_USAGE_CONFIRMED_TUTORIAL_BUTTON"];
  [v5 addAction:v8];
  id v9 = SBAXLocalizedString(@"VoiceOver.confirmation.useVO");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_2;
  v15[3] = &unk_2647F0CF0;
  v15[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:0 handler:v15];

  [v5 addAction:v10];
  int v11 = SBAXLocalizedString(@"cancel");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_3;
  void v14[3] = &unk_2647F0CF0;
  void v14[4] = self;
  id v12 = +[AXAlertAction actionWithTitle:v11 style:1 handler:v14];

  [v5 addAction:v12];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v5];

  return v5;
}

void __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _handleAlertActionPress:a2];
  id v2 = [MEMORY[0x263F22968] server];
  [v2 launchOnboardingViewService:@"voiceover"];
}

uint64_t __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (id)_handleUsageConfirmationDialogWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = SBAXLocalizedString(@"OK");
  id v6 = [(AXSpringBoardServerHelper *)self _handleConfirmationDialogWithMessage:v4 confirmTitle:v5];

  return v6;
}

- (id)_handleVOUsageConfirmationDialogWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = SBAXLocalizedString(@"OK");
  id v6 = [(AXSpringBoardServerHelper *)self _handleVOConfirmationDialogWithMessage:v4 confirmTitle:v5];

  return v6;
}

- (void)_handleVoiceOverUsageConfirmation
{
  uint64_t v3 = AXLocStringKeyForHomeButton();
  id v4 = AXLocStringKeyForModel();
  SBAXLocalizedString(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(AXSpringBoardServerHelper *)self _handleVOUsageConfirmationDialogWithMessage:v6];
}

- (void)_handleVONoHomeButtonGestureAlert
{
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = SBAXLocalizedString(@"voiceover.home.gesture.alert.title");
  id v5 = AXLocStringKeyForModel();
  id v6 = SBAXLocalizedString(v5);
  id v7 = [v3 alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v8 = SBAXLocalizedString(@"OK");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__AXSpringBoardServerHelper__handleVONoHomeButtonGestureAlert__block_invoke;
  v10[3] = &unk_2647F0CF0;
  void v10[4] = self;
  id v9 = +[AXAlertAction actionWithTitle:v8 style:0 handler:v10];

  [v7 addAction:v9];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v7];
}

uint64_t __62__AXSpringBoardServerHelper__handleVONoHomeButtonGestureAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleAlwaysOnBluetoothModeForVoiceOver
{
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = SBAXLocalizedString(@"vo.bluetooth.always.on.for.braille");
  id v5 = SBAXLocalizedString(@"vo.bluetooth.always.on.for.message");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = SBAXLocalizedString(@"OK");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:0 handler:v12];

  [v8 setButtonIndex:0];
  [v6 addAction:v8];
  id v9 = SBAXLocalizedString(@"cancel");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke_2;
  v11[3] = &unk_2647F0CF0;
  void v11[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:1 handler:v11];

  [v10 setButtonIndex:1];
  [v6 addAction:v10];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v6];
}

uint64_t __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleDisallowUSBRestrictedModeVOInformativeOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXDeviceIsPod())
  {
    id v5 = @"vo.disallow.usb.restricted.mode.alert.message_IPOD";
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (AXDeviceIsPad()) {
    id v5 = @"vo.disallow.usb.restricted.mode.alert.message_IPAD";
  }
  else {
    id v5 = @"vo.disallow.usb.restricted.mode.alert.message_IPHONE";
  }
  if (v3)
  {
LABEL_8:
    id v5 = [(__CFString *)v5 stringByAppendingString:@".informativeOnly"];
  }
LABEL_9:
  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = SBAXLocalizedString(@"vo.disallow.usb.restricted.mode.alert.title");
  id v8 = SBAXLocalizedString(v5);
  id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  uint64_t v10 = SBAXLocalizedString(@"OK");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeVOInformativeOnly___block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  int v11 = +[AXAlertAction actionWithTitle:v10 style:0 handler:v12];

  [v9 addAction:v11];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v9];
}

uint64_t __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeVOInformativeOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleDisallowUSBRestrictedModeSCInformativeOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXDeviceIsPod())
  {
    id v5 = @"sc.disallow.usb.restricted.mode.alert.message_IPOD";
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (AXDeviceIsPad()) {
    id v5 = @"sc.disallow.usb.restricted.mode.alert.message_IPAD";
  }
  else {
    id v5 = @"sc.disallow.usb.restricted.mode.alert.message_IPHONE";
  }
  if (v3)
  {
LABEL_8:
    id v5 = [(__CFString *)v5 stringByAppendingString:@".informativeOnly"];
  }
LABEL_9:
  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = SBAXLocalizedString(@"sc.disallow.usb.restricted.mode.alert.title");
  id v8 = SBAXLocalizedString(v5);
  id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  uint64_t v10 = SBAXLocalizedString(@"OK");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeSCInformativeOnly___block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  int v11 = +[AXAlertAction actionWithTitle:v10 style:0 handler:v12];

  [v9 addAction:v11];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v9];
}

uint64_t __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeSCInformativeOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleASTMenuFullForInstance:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = SBAXLocalizedString(@"DWELL_CONTROL_CUSTOMIZE_MENU");
  id v7 = SBAXLocalizedString(@"DWELL_CONTROL_ADD_DWELL_SCROLL");
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = SBAXLocalizedString(@"No");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke;
  v16[3] = &unk_2647F0CF0;
  v16[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:1 handler:v16];

  [v10 setButtonIndex:0];
  [v8 addAction:v10];
  int v11 = SBAXLocalizedString(@"DWELL_CONTROL_CUSTOMIZE");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke_2;
  void v14[3] = &unk_2647F0CC8;
  void v14[4] = self;
  id v15 = v4;
  id v12 = v4;
  uint64_t v13 = +[AXAlertAction actionWithTitle:v11 style:0 handler:v14];

  [v13 setButtonIndex:1];
  [v8 addAction:v13];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v8];
}

uint64_t __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _handleAlertActionPress:a2];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 openMenuCustomizationForASTWithServerInstance:v4];
}

- (void)_handleASTMenuCustomizeAddDwell:(BOOL)a3 addScroll:(BOOL)a4
{
  id v5 = @"DWELL_CONTROL_ADD_DWELL";
  if (a4) {
    id v5 = @"DWELL_CONTROL_ADD_DWELL_SCROLL";
  }
  if (!a3) {
    id v5 = @"DWELL_CONTROL_ADD_SCROLL";
  }
  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = v5;
  id v8 = SBAXLocalizedString(@"DWELL_CONTROL_CUSTOMIZE_MENU");
  id v9 = SBAXLocalizedString(v7);

  uint64_t v10 = [v6 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  int v11 = SBAXLocalizedString(@"cancel");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke;
  v16[3] = &unk_2647F0CF0;
  v16[4] = self;
  id v12 = +[AXAlertAction actionWithTitle:v11 style:1 handler:v16];

  [v12 setButtonIndex:0];
  [v10 addAction:v12];
  uint64_t v13 = SBAXLocalizedString(@"Yes");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke_2;
  v15[3] = &unk_2647F0CF0;
  v15[4] = self;
  id v14 = +[AXAlertAction actionWithTitle:v13 style:0 handler:v15];

  [v14 setButtonIndex:1];
  [v10 addAction:v14];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v10];
}

uint64_t __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleConnectedDevicesHaveAssistiveTouchCustomActions
{
  BOOL v3 = (void *)MEMORY[0x263F82418];
  uint64_t v4 = SBAXLocalizedStringWithTable(@"devices.require.ast.title", @"Accessibility-hello");
  id v5 = SBAXLocalizedStringWithTable(@"devices.have.ast.customActions", @"Accessibility-hello");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = SBAXLocalizedString(@"cancel");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:1 handler:v12];

  [v8 setButtonIndex:0];
  [v6 addAction:v8];
  id v9 = SBAXLocalizedString(@"turn.off");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke_2;
  v11[3] = &unk_2647F0CF0;
  void v11[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:2 handler:v11];

  [v10 setButtonIndex:1];
  [v6 addAction:v10];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v6];
}

uint64_t __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleSecureItentAlertForSwitchAST
{
  int v3 = _AXSAssistiveTouchEnabled();
  BOOL v4 = v3 == 0;
  if (v3) {
    id v5 = @"SECURE_INTENT_ALERT_FIRST_USE_TITLE_AST";
  }
  else {
    id v5 = @"SECURE_INTENT_ALERT_FIRST_USE_TITLE_SC";
  }
  if (v4) {
    id v6 = @"SECURE_INTENT_ALERT_FIRST_USE_BODY_SC";
  }
  else {
    id v6 = @"SECURE_INTENT_ALERT_FIRST_USE_BODY_AST";
  }
  id v7 = SBAXLocalizedString(v5);
  id v8 = SBAXLocalizedString(v6);
  id v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  uint64_t v10 = SBAXLocalizedString(@"OK");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__AXSpringBoardServerHelper__handleSecureItentAlertForSwitchAST__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  int v11 = +[AXAlertAction actionWithTitle:v10 style:0 handler:v12];

  [v9 addAction:v11];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v9];
}

uint64_t __64__AXSpringBoardServerHelper__handleSecureItentAlertForSwitchAST__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleSwitchUsageConfirmed
{
  int v3 = AXLocStringKeyForHomeButton();
  BOOL v4 = AXLocStringKeyForModel();
  SBAXLocalizedString(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(AXSpringBoardServerHelper *)self _handleUsageConfirmationDialogWithMessage:v6];
}

- (void)_handleDisableAssistiveTouchConfirmation
{
  int v3 = AXUILocalizedStringForKey();
  SBAXLocalizedString(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = SBAXLocalizedString(@"Yes");
  id v5 = [(AXSpringBoardServerHelper *)self _handleConfirmationDialogWithMessage:v6 confirmTitle:v4];
}

- (void)_handleDisableSwitchControlConfirmation
{
  int v3 = AXUILocalizedStringForKey();
  SBAXLocalizedString(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = SBAXLocalizedString(@"Yes");
  id v5 = [(AXSpringBoardServerHelper *)self _handleConfirmationDialogWithMessage:v6 confirmTitle:v4];
}

- (void)_handleDisableFKAConfirmation
{
  int v3 = AXUILocalizedStringForKey();
  SBAXLocalizedString(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = SBAXLocalizedString(@"Yes");
  id v5 = [(AXSpringBoardServerHelper *)self _handleConfirmationDialogWithMessage:v6 confirmTitle:v4];
}

- (void)_handleLiveTranscriptionConfirmation
{
  int v3 = SBAXLocalizedString(@"OK");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke;
  v15[3] = &unk_2647F0CF0;
  v15[4] = self;
  BOOL v4 = +[AXAlertAction actionWithTitle:v3 style:0 handler:v15];

  [v4 setButtonIndex:1];
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [v5 objectForKey:@"kAXLiveTranscriptionConfirmationAlertDefaultsKey"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v6 isEqualToString:@"AXLiveTranscriptionAlertShowed"])
  {
    [(AXSpringBoardServerHelper *)self _handleAlertActionPress:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F82418];
    id v8 = AXUILocalizedStringForKey();
    id v9 = AXLocStringKeyForModel();
    uint64_t v10 = AXUILocalizedStringForKey();
    int v11 = [v7 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    id v12 = SBAXLocalizedString(@"cancel");
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke_2;
    void v14[3] = &unk_2647F0CF0;
    void v14[4] = self;
    uint64_t v13 = +[AXAlertAction actionWithTitle:v12 style:1 handler:v14];

    [v13 setButtonIndex:0];
    [v11 addAction:v13];
    [v11 addAction:v4];
    [(AXSpringBoardServerHelper *)self _displayAlertController:v11];
  }
}

void __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x263EFFA40];
  id v6 = a2;
  BOOL v4 = [v3 standardUserDefaults];
  [v4 setObject:@"AXLiveTranscriptionAlertShowed" forKey:@"kAXLiveTranscriptionConfirmationAlertDefaultsKey"];

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 synchronize];

  [*(id *)(a1 + 32) _handleAlertActionPress:v6];
}

uint64_t __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleDisableOnDeviceEyeTrackingConfirmation
{
  int v3 = SBAXLocalizedString(@"OK");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  BOOL v4 = +[AXAlertAction actionWithTitle:v3 style:0 handler:v12];

  [v4 setButtonIndex:1];
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = SBAXLocalizedString(@"USAGE_CONFIRMED_TITLE");
  id v7 = AXUILocalizedStringForKey();
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = SBAXLocalizedString(@"cancel");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke_2;
  v11[3] = &unk_2647F0CF0;
  void v11[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:1 handler:v11];

  [v10 setButtonIndex:0];
  [v8 addAction:v10];
  [v8 addAction:v4];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v8];
}

void __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x263F22938];
  id v5 = a2;
  BOOL v4 = [v3 sharedInstance];
  [v4 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:0];

  [*(id *)(a1 + 32) _handleAlertActionPress:v5];
}

uint64_t __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleTouchAccommodationsUsageConfirmed
{
  int v3 = AXLocStringKeyForHomeButton();
  BOOL v4 = AXLocStringKeyForModel();
  SBAXLocalizedString(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(AXSpringBoardServerHelper *)self _handleUsageConfirmationDialogWithMessage:v6];
}

- (void)handleBrokenHomeButtonAlert
{
  int v3 = (void *)MEMORY[0x263F82418];
  BOOL v4 = SBAXLocalizedString(@"broken.home.button.title");
  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v5 = [v3 alertControllerWithTitle:v4 message:&stru_26DB17D90 preferredStyle:1];
  }
  else
  {
    id v6 = SBAXLocalizedString(@"broken.home.button.message");
    id v5 = [v3 alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  }
  id v7 = SBAXLocalizedString(@"OK");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__AXSpringBoardServerHelper_handleBrokenHomeButtonAlert__block_invoke;
  v9[3] = &unk_2647F0CF0;
  v9[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:0 handler:v9];

  [v5 addAction:v8];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v5];
}

uint64_t __56__AXSpringBoardServerHelper_handleBrokenHomeButtonAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleZoomInBuddyAlert
{
  int v3 = (void *)MEMORY[0x263F82418];
  BOOL v4 = SBAXLocalizedString(@"enable.zoom.purple.buddy.title");
  id v5 = SBAXLocalizedString(@"enable.zoom.purple.buddy.message");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = SBAXLocalizedString(@"cancel");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:1 handler:v12];

  [v6 addAction:v8];
  id v9 = SBAXLocalizedString(@"enable");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke_2;
  v11[3] = &unk_2647F0CF0;
  void v11[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:0 handler:v11];

  [v10 setButtonIndex:0];
  [v6 addAction:v10];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v6];
}

uint64_t __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (void)_handleConfirmRebootDevice
{
  if (AXDeviceIsPad())
  {
    int v3 = @"REBOOT_ALERT_MESSAGE_IPAD";
  }
  else if (AXDeviceIsPod())
  {
    int v3 = @"REBOOT_ALERT_MESSAGE_IPOD";
  }
  else
  {
    int v3 = @"REBOOT_ALERT_MESSAGE_IPHONE";
  }
  BOOL v4 = (void *)MEMORY[0x263F82418];
  id v5 = SBAXLocalizedString(v3);
  id v6 = [v4 alertControllerWithTitle:0 message:v5 preferredStyle:1];

  id v7 = SBAXLocalizedString(@"cancel");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke;
  v12[3] = &unk_2647F0CF0;
  v12[4] = self;
  id v8 = +[AXAlertAction actionWithTitle:v7 style:1 handler:v12];

  [v6 addAction:v8];
  id v9 = SBAXLocalizedString(@"REBOOT_ALERT_CONFIRM");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke_2;
  v11[3] = &unk_2647F0CF0;
  void v11[4] = self;
  uint64_t v10 = +[AXAlertAction actionWithTitle:v9 style:0 handler:v11];

  [v10 setButtonIndex:0];
  [v6 addAction:v10];
  [(AXSpringBoardServerHelper *)self _displayAlertController:v6];
}

uint64_t __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

uint64_t __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlertActionPress:a2];
}

- (BOOL)_accessibilityHandleHomeOrLockButtonPress
{
  if (!UIAccessibilityIsGuidedAccessEnabled())
  {
    id v2 = [MEMORY[0x263F88140] sharedInstance];
    [v2 notifyZoomHomeButtonWasPressed];
  }
  int v3 = [(id)SBServerHelper _isDisplayingAlertController];
  if (v3)
  {
    [(id)SBServerHelper _dismissAlertController];
  }
  else
  {
    BOOL v4 = +[AXSBHearingAidDeviceController sharedController];
    int v5 = [v4 isShowingHearingAidControl];

    if (v5)
    {
      id v6 = +[AXSBHearingAidDeviceController sharedController];
      [v6 showHearingAidControl:0];
    }
  }
  return v3;
}

- (void)didFailToFloatAppForSideAppManager:(id)a3
{
  id v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v3 springBoardActionOccurred:12];
}

- (void)didFailToPinAppForSideAppManager:(id)a3
{
  id v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v3 springBoardActionOccurred:11];
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3, a5);
  id v8 = [v7 safeValueForKey:@"_frontMostAppOrientation"];
  uint64_t v9 = [v8 integerValue];

  if (v9) {
    int64_t v10 = a3;
  }
  else {
    int64_t v10 = 0;
  }
  v16[0] = *MEMORY[0x263F226E0];
  int v11 = [NSNumber numberWithInteger:v10];
  v17[0] = v11;
  v16[1] = *MEMORY[0x263F226E8];
  id v12 = [NSNumber numberWithDouble:a4];
  v17[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v14 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v14 springBoardActionOccurred:4 withPayload:v13];

  id v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"AXSBServerOrientationChange" object:0];
}

- (AXSpringBoardServerAlertManager)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (UIWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
}

- (BSInvalidatable)presentationWindowFocusAssertion
{
  return self->_presentationWindowFocusAssertion;
}

- (void)setPresentationWindowFocusAssertion:(id)a3
{
}

- (AXSSMotionTrackingInputManager)motionTrackingInputManager
{
  return self->_motionTrackingInputManager;
}

- (FBSDisplayLayoutMonitor)continuityDisplayMonitor
{
  return self->_continuityDisplayMonitor;
}

- (void)setContinuityDisplayMonitor:(id)a3
{
}

- (BOOL)contintuityDisplayIsActive
{
  return self->_contintuityDisplayIsActive;
}

- (void)setContintuityDisplayIsActive:(BOOL)a3
{
  self->_contintuityDisplayIsActive = a3;
}

- (AXAssertion)disableSystemGesturesAssertionForAlert
{
  return self->_disableSystemGesturesAssertionForAlert;
}

- (void)setDisableSystemGesturesAssertionForAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertionForAlert, 0);
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_motionTrackingInputManager, 0);
  objc_storeStrong((id *)&self->_presentationWindowFocusAssertion, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_axFeatureCache, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_visibleTripleClickItems, 0);
  objc_storeStrong(&self->_alertHandler, 0);
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(uint64_t)a1 forData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_226EBC000, a2, OS_LOG_TYPE_FAULT, "%@ - Unable to unarchive AXSBImageExplorerData object from imageData", v5, 0xCu);
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_226EBC000, v0, OS_LOG_TYPE_FAULT, "Failed to archive AXSBImageExplorerData. error: %@", v1, 0xCu);
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(void *)a1 forData:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 hostAppName];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_226EBC000, a2, OS_LOG_TYPE_DEBUG, "displayName : %@", v4, 0xCu);
}

- (void)setSecurePayAccessibilityFeaturesDisabled:withServerInstance:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226EBC000, v0, v1, "Unable to encode feature cache map: %@", v2, v3, v4, v5, v6);
}

- (void)appNameFromPid:withServerInstance:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226EBC000, v0, v1, "Couldn't get appID", v2, v3, v4, v5, v6);
}

- (void)appNameFromPid:(void *)a1 withServerInstance:.cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_226EBC000, v2, v3, "Couldn't read appName from record, error = %@", v4, v5, v6, v7, v8);
}

- (void)appNameFromPid:withServerInstance:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_226EBC000, v0, OS_LOG_TYPE_DEBUG, "Host AppID: %@", v1, 0xCu);
}

- (void)appNameFromPid:withServerInstance:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_226EBC000, v0, OS_LOG_TYPE_DEBUG, "Process AppID: %@", v1, 0xCu);
}

- (void)appNameFromPid:(void *)a1 withServerInstance:.cold.5(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_226EBC000, v2, v3, "Couldn't get process handle, error = %@", v4, v5, v6, v7, v8);
}

void __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226EBC000, v0, v1, "Failed to unlock device - do not present nearby devices UI", v2, v3, v4, v5, v6);
}

- (void)nativeFocusedApplication
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226EBC000, v0, v1, "Error getting process handle for native focused application: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_displayViewController:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_226EBC000, v0, v1, "Unexpectedly had a presentation window focus assertion, even though the presentation window was created from scratch", v2, v3, v4, v5, v6);
}

- (void)_displayViewController:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226EBC000, v0, v1, "Could not find the class for SBSecureMainScreenActiveInterfaceOrientationWindow.", v2, v3, v4, v5, v6);
}

@end