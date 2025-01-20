@interface SpringBoardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestsStatusBar;
- (BOOL)_accessibilityIsAlarmRinging;
- (BOOL)_accessibilityIsAppSwitcherVisible;
- (BOOL)_accessibilityIsBatteryLow;
- (BOOL)_accessibilityIsBuddyRunning;
- (BOOL)_accessibilityIsShowingLongLookNotification;
- (BOOL)_accessibilityIsSystemAppServer;
- (BOOL)_accessibilityIsSystemLocked;
- (BOOL)_accessibilityIsSystemSleeping;
- (BOOL)_accessibilityIsVoiceControlRunning;
- (BOOL)_accessibilityShouldCallAXStatusChangedOnAppLaunchFinish;
- (BOOL)_accessibilityShouldHitTestStatusBarWindow;
- (BOOL)_accessibilityShouldLoadAXInfoOnAppLaunchFinish;
- (BOOL)_accessibilitySpringBoardIsModal;
- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4;
- (BOOL)_accessibilitySystemAppServerIsReady;
- (BOOL)_accessibilitySystemWideGestureInProgress;
- (BOOL)_axIsKeyUIEventCommandTab:(id)a3;
- (BOOL)_axWasRingerMuted;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)_isDim;
- (BOOL)accessibilityStartStopToggle;
- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3;
- (id)_accessibilityAppSwitcherApps;
- (id)_accessibilityCenterPointOfScreen;
- (id)_accessibilityFocusActiveActivityName;
- (id)_accessibilityFocusableScenes;
- (id)_accessibilityHomeAffordanceView;
- (id)_accessibilityLaunchableApps;
- (id)_accessibilityNextDockElementStartingAtDisplayID:(unsigned int)a3;
- (id)_accessibilityNotificationSummary:(unint64_t)a3;
- (id)_accessibilityOrientationDeferralAssertion;
- (id)_accessibilityPIPCoordinator;
- (id)_accessibilityPictureInPictureWindow;
- (id)_accessibilitySideAppDividerElement;
- (id)_accessibilitySoftwareMimicKeyboard;
- (id)_accessibilitySpeakScreenGestureRecognizer;
- (id)_accessibilityStatusBar;
- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4;
- (id)_axKeyboardFocusCoordinator;
- (id)_firstStatusBarElement;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)_lastStatusBarElement;
- (int)_accessibilityCurrentCallState;
- (int)_accessibilityRemoteKeyboardApp;
- (int64_t)_accessibilityApplicationOrientation;
- (unint64_t)_accessibilityNotificationCount;
- (void)__accessibilityUpdateSpeakScreenGestureRecognizer;
- (void)_accessibilityDeactivationAnimationWillBegin;
- (void)_accessibilityHandleOrientationChange;
- (void)_accessibilityHandleSpeakScreenGesture:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityLoadPIPInfo;
- (void)_accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:(BOOL)a3;
- (void)_accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:(BOOL)a3;
- (void)_accessibilitySetSpeakScreenGestureRecognizer:(id)a3;
- (void)_accessibilityStatusChanged:(id)a3;
- (void)_accessibilityUpdateRingerState;
- (void)_accessibilityUpdateSpeakScreenGestureRecognizer;
- (void)_axSetWasRingerMuted:(BOOL)a3;
- (void)_handleKeyUIEvent:(id)a3;
- (void)_keyboardOrCaseLatchWantsToAttemptUnlock:(int)a3;
- (void)_legacy_noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 updateMirroredDisplays:(BOOL)a5 force:(BOOL)a6 logMessage:(id)a7;
- (void)_processAccessibilityStatusChange:(id)a3;
- (void)_setAccessibilityOrientationDeferralAssertion:(id)a3;
- (void)_takeScreenshotAndEdit:(BOOL)a3;
- (void)_updateRingerState:(int)a3 reason:(id)a4;
- (void)accessibilityDisable;
- (void)accessibilityInitialize;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)restartManagerWillReboot:(id)a3;
@end

@implementation SpringBoardAccessibility

- (BOOL)_accessibilityIsSystemAppServer
{
  return 1;
}

+ (id)safeCategoryTargetClassName
{
  return @"SpringBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_isDim", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"_AXSpringBoardServerInstance", @"springBoardServerInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"handleDoubleHeightStatusBarTapWithStyleOverride:", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_keyboardOrCaseLatchWantsToAttemptUnlock:", "v", "i", 0);
  [v3 validateClass:@"SBControlCenterController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"isPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"isPaused", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBConferenceManager", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBConferenceManager", @"faceTimeInvitationExists", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBConferenceManager", @"inFaceTime", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBConferenceManager", @"endFaceTime", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"isVisible", "B", 0);
  [v3 validateClass:@"SBControlCenterController" hasInstanceVariable:@"_viewController" withType:"UIViewController<CCUIMainViewController>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIMainViewController", @"_statusLabelViewContainerView", "@", 0);
  [v3 validateClass:@"CCUIStatusBar" hasInstanceVariable:@"_compactTrailingStatusBar" withType:"UIStatusBar"];
  [v3 validateClass:@"CCUIStatusBar" hasInstanceVariable:@"_expandedStatusBar" withType:"UIStatusBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"setGridSizeClass:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIHeaderPocketView", @"statusBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"isInternalApplication", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPageView", @"_overlayClippingView", "@", 0);
  [v3 validateClass:@"SBAssistantWindow"];
  [v3 validateClass:@"SBSceneManagerCoordinator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"_activateApplicationFromAccessibility:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"unlockUIFromSource:withOptions:", "B", "i", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"lockScreenEnvironment", "@", 0);
  [v3 validateProtocol:@"SBLockScreenEnvironment" hasRequiredInstanceMethod:@"rootViewController"];
  [v3 validateClass:@"SBLockScreenViewControllerBase"];
  [v3 validateClass:@"SBLockScreenViewControllerBase" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"notificationDispatcher", "@", 0);
  [v3 validateClass:@"SBNCNotificationDispatcher" hasInstanceVariable:@"_alertingController" withType:"SBNCAlertingController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCAlertingController", @"soundController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCNotificationDispatcher", @"bannerDestination", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCNotificationDispatcher", @"dashBoardDestination", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"isPresentingBannerInLongLook", "B", 0);
  [v3 validateProtocol:@"SBNotificationDestination" conformsToProtocol:@"SBFNotificationLongLookPresenting"];
  [v3 validateProtocol:@"SBFNotificationLongLookPresenting" hasRequiredInstanceMethod:@"isPresentingNotificationInLongLook"];
  [v3 validateClass:@"SBMainDisplaySceneManager" isKindOfClass:@"SBSceneManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"windowScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowScene", @"keyWindow", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleItemContainers", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer" hasInstanceVariable:@"_pageView" withType:"SBAppSwitcherPageView"];
  [v3 validateClass:@"SpringBoard" hasInstanceVariable:@"_extendedDisplayControllerProvider" withType:"SBSceneHostingDisplayControllerProvider"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0);
  [v3 validateClass:@"SBMainSwitcherControllerCoordinator"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstanceIfExists", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController"];
  [v3 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFullScreenSwitcherSceneLiveContentOverlay", @"deviceApplicationSceneViewController", "@", 0);
  [v3 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController"];
  [v3 validateClass:@"SBAppContainerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"pipCoordinator", "@", 0);
  [v3 validateClass:@"SBPIPControllerCoordinator" hasInstanceVariable:@"_controllersByType" withType:"NSMutableDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"brightnessControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPController", @"_leadingWindowForWindowScene:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPController", @"_windowScenesDisplayingPIPContent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"applicationDidFinishLaunching:", "v", "@", 0);
  [v3 validateClass:@"SpringBoard" hasInstanceVariable:@"_hasFinishedLaunching" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"restartManagerWillReboot:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_axIsFloatingSwitcherVisible", "B", 0);
  [v3 validateClass:@"SBHomeGrabberView" hasInstanceVariable:@"_pillView" withType:"MTLumaDodgePillView"];
  [v3 validateClass:@"SBMainWorkspace"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBMainWorkspace", @"_instanceIfExists", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"ringerControl", "@", 0);
  [v3 validateClass:@"SBMainWorkspace" hasInstanceVariable:@"_keyboardFocusCoordinator" withType:"<SBKeyboardFocusControlling>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBKeyboardFocusCoordinator", @"_sceneControllerForScene:", "@", "@", 0);
  [v3 validateProtocol:@"SBKeyboardFocusControlling" hasRequiredInstanceMethod:@"inputUISceneController"];
  [v3 validateClass:@"SBInputUISceneController" hasInstanceVariable:@"_inputUIScene" withType:"FBScene"];
  [v3 validateClass:@"SBRingerControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRingerControl", @"_accessibilityIsRingerMuted", "B", 0);
  [v3 validateClass:@"SBLayoutState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"elementWithRole:", "@", "q", 0);
  [v3 validateClass:@"SBLayoutElement"];
  [v3 validateClass:@"SBApplicationSceneEntity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneEntity", @"application", "@", 0);
  [v3 validateClass:@"SBApplication"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleUnderlayAccessoryViews", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherSpaceUnderlayAccessoryView" hasInstanceVariable:@"_resizeGrabber" withType:"SBSeparatorView"];
  [v3 validateClass:@"SiriPresentationSpringBoardMainScreenViewController"];
  [v3 validateClass:@"SiriPresentationSpringBoardMainScreenViewController" isKindOfClass:@"SiriPresentationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriPresentationViewController", @"siriViewController", "@", 0);
  [v3 validateClass:@"AFUISiriViewController"];
  [v3 validateClass:@"AFUISiriViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"_siriView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"isVisible", "B", 0);
  [v3 validateClass:@"AFUISiriView"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_siriStatusView" withType:"UIView<SiriUISiriStatusViewProtocol>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreenEdgePanGestureRecognizer", @"_touchInterfaceOrientation", "q", 0);
  [v3 validateClass:@"SBCommandTabController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBCommandTabController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCommandTabController", @"isVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCommandTabController", @"next", "v", 0);
  [v3 validateClass:@"UIStatusBar_Modern"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarAccessibility", @"_axSetIsHitTesting:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"bannerManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBannerManager", @"isDisplayingBannerInWindowScene:", "B", "@", 0);
  [v3 validateClass:@"SBBrightnessControl" hasInstanceVariable:@"_displayBrightnessController" withType:"SBDisplayBrightnessController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayBrightnessController", @"handleBrightnessKeyPressEvent:", "v", "^{__IOHIDEvent=}", 0);
  [v3 validateClass:@"SBTopAffordanceDotsView"];
  [v3 validateClass:@"SBTopAffordanceViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplicationAccessibility", @"_accessibilityActiveScenes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"deviceOrientationUpdateDeferralAssertionWithReason:", "@", "@", 0);
  [v3 validateClass:@"SBSystemApertureController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"systemApertureControllerForMainDisplay", "@", 0);
  [v3 validateClass:@"SBSystemApertureViewController"];
  [v3 validateClass:@"SBSystemApertureController" hasInstanceVariable:@"_systemApertureViewController" withType:"SBSystemApertureViewController"];
  [v3 validateClass:@"SAUISystemApertureManager"];
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_systemApertureManager" withType:"SAUISystemApertureManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemApertureViewController", @"minimumSensorRegionFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_orderedContainerViews" withType:"NSMutableArray"];
  [v3 validateClass:@"SBSystemApertureViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SAUISystemApertureManager" hasInstanceVariable:@"_elementsToElementViewControllers" withType:"NSMapTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIElementViewController", @"_elementView", "@", 0);
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_indicatorContainerView" withType:"_SBSystemApertureIndicatorContainerView"];
  [v3 validateClass:@"SAUIIndicatorElementViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemApertureSceneElement", @"elementIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneManager", @"connectedWindowScenes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"floatingDockController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isFloatingDockFullyPresented", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"floatingDockViewController", "@", 0);
  [v3 validateClass:@"SBFloatingDockViewController" hasInstanceVariable:@"_dockView" withType:"SBFloatingDockView"];
  [v3 validateClass:@"SBIconListView" hasInstanceVariable:@"_iconViews" withType:"NSMapTable"];
  [v3 validateClass:@"SBStatusBarWindow"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBStatusBarWindow", @"statusBar", "@", 0);
  [v3 validateClass:@"SBTransientOverlayWindow"];
  [v3 validateClass:@"SpringBoard" hasInstanceVariable:@"_orientationAggregator" withType:"SBMainDisplayInterfaceOrientationAggregator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayInterfaceOrientationAggregator", @"interfaceOrientationSources", "@", 0);
}

- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v151 = *MEMORY[0x263EF8340];
  v103 = [MEMORY[0x263F81198] options];
  [v103 setShouldUseAllSubviews:1];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v113 = [MEMORY[0x263EFF980] array];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v6 = [(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  v7 = [v6 reverseObjectEnumerator];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v141 objects:v150 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v142;
    uint64_t v107 = *(void *)v142;
    do
    {
      uint64_t v11 = 0;
      uint64_t v109 = v9;
      do
      {
        if (*(void *)v142 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v141 + 1) + 8 * v11);
        if (v4)
        {
          BOOL v13 = v4;
          v14 = [*(id *)(*((void *)&v141 + 1) + 8 * v11) _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_18];
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v137 objects:v149 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v138;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v138 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = [*(id *)(*((void *)&v137 + 1) + 8 * i) _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_815];
                [v5 axSafelyAddObjectsFromArray:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v137 objects:v149 count:16];
            }
            while (v16);
          }
          [v5 axSafelyAddObjectsFromArray:v14];

          BOOL v4 = v13;
          uint64_t v10 = v107;
          uint64_t v9 = v109;
        }
        NSClassFromString(&cfstr_Sbstatusbarwin_0.isa);
        if (objc_opt_isKindOfClass())
        {
          v20 = [v12 safeUIViewForKey:@"statusBar"];
          if ([v20 _accessibilityViewIsVisible]) {
            [v113 axSafelyAddObject:v20];
          }
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v141 objects:v150 count:16];
    }
    while (v9);
  }

  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v110 = AXSwitcherController(@"activeDisplayWindowScene", obja);
  [v110 safeValueForKey:@"contentViewController"];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v108 = long long v136 = 0u;
  v21 = [v108 safeDictionaryForKey:@"visibleItemContainers"];
  v22 = [v21 allValues];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v133 objects:v148 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v134 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v133 + 1) + 8 * j) safeUIViewForKey:@"_pageView"];
        v28 = [v27 safeUIViewForKey:@"_overlayClippingView"];

        v29 = [v28 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_821];
        [v113 axSafelyAddObjectsFromArray:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v133 objects:v148 count:16];
    }
    while (v24);
  }

  v30 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstanceIfExists"];
  if ([v30 safeBoolForKey:@"isVisible"])
  {
    v31 = [v30 safeValueForKey:@"_viewController"];
    v32 = [v31 safeValueForKey:@"_statusLabelViewContainerView"];
    v33 = [v32 safeValueForKey:@"statusBar"];

    v34 = [v33 safeValueForKey:@"_compactTrailingStatusBar"];
    [v113 axSafelyAddObject:v34];

    v35 = [v33 safeValueForKey:@"_expandedStatusBar"];
    [v113 axSafelyAddObject:v35];
  }
  v102 = v30;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v36 = v113;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v129 objects:v147 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v130;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v130 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v129 + 1) + 8 * k);
        if ([v41 _accessibilityViewIsVisible])
        {
          v42 = [v41 safeValueForKey:@"statusBar"];
          if ([v42 _accessibilityViewIsVisible])
          {
            v125[5] = MEMORY[0x263EF8330];
            v125[6] = 3221225472;
            v125[7] = __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_4;
            v125[8] = &unk_2651545F0;
            id v126 = v42;
            BOOL v128 = a4;
            id v127 = v5;
            AXPerformSafeBlock();
          }
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v129 objects:v147 count:16];
    }
    while (v38);
  }

  Class v43 = NSClassFromString(&cfstr_Sbtopaffordanc_1.isa);
  v125[0] = MEMORY[0x263EF8330];
  v125[1] = 3221225472;
  v125[2] = __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_7;
  v125[3] = &__block_descriptor_40_e27_q24__0__UIView_8__UIView_16lu32l8;
  v125[4] = v43;
  [v5 sortUsingComparator:v125];
  if (AXDeviceHasJindo())
  {
    v114 = [(SpringBoardAccessibility *)self safeValueForKey:@"systemApertureControllerForMainDisplay"];
    v44 = [v114 safeValueForKey:@"_systemApertureViewController"];
    v45 = [v44 safeValueForKey:@"_systemApertureManager"];
    char v101 = [v44 safeBoolForKey:@"_systemApertureContainsAnyContent"];
    [v44 safeCGRectForKey:@"minimumSensorRegionFrame"];
    double v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    v54 = [v44 safeUIViewForKey:@"view"];
    v106 = v54;
    if (objc_opt_respondsToSelector())
    {
      memset(&v124, 0, sizeof(v124));
      v55 = [v54 window];
      v56 = v55;
      v57 = v45;
      if (v55) {
        [v55 transform];
      }
      else {
        memset(&v124, 0, sizeof(v124));
      }

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      v58 = [v44 safeArrayForKey:@"_orderedContainerViews"];
      uint64_t v59 = [v58 countByEnumeratingWithState:&v120 objects:v146 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v121;
        do
        {
          for (uint64_t m = 0; m != v60; ++m)
          {
            if (*(void *)v121 != v61) {
              objc_enumerationMutation(v58);
            }
            v63 = *(void **)(*((void *)&v120 + 1) + 8 * m);
            v64 = [v63 window];
            [v63 bounds];
            objc_msgSend(v64, "convertRect:fromView:", v63);
            CGFloat x = v65;
            CGFloat y = v67;
            CGFloat width = v69;
            CGFloat height = v71;

            v153.origin.CGFloat x = x;
            v153.origin.CGFloat y = y;
            v153.size.CGFloat width = width;
            v153.size.CGFloat height = height;
            if (!CGRectIsEmpty(v153))
            {
              CGAffineTransform v119 = v124;
              if (!CGAffineTransformIsIdentity(&v119))
              {
                CGAffineTransform v119 = v124;
                v154.origin.CGFloat x = x;
                v154.origin.CGFloat y = y;
                v154.size.CGFloat width = width;
                v154.size.CGFloat height = height;
                CGRect v155 = CGRectApplyAffineTransform(v154, &v119);
                CGFloat x = v155.origin.x;
                CGFloat y = v155.origin.y;
                CGFloat width = v155.size.width;
                CGFloat height = v155.size.height;
              }
              v156.origin.CGFloat x = v47;
              v156.origin.CGFloat y = v49;
              v156.size.CGFloat width = v51;
              v156.size.CGFloat height = v53;
              v158.origin.CGFloat x = x;
              v158.origin.CGFloat y = y;
              v158.size.CGFloat width = width;
              v158.size.CGFloat height = height;
              CGRect v157 = CGRectUnion(v156, v158);
              double v47 = v157.origin.x;
              CGFloat v49 = v157.origin.y;
              CGFloat v51 = v157.size.width;
              CGFloat v53 = v157.size.height;
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v120 objects:v146 count:16];
        }
        while (v60);
      }

      v45 = v57;
    }
    id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
    LOBYTE(v124.a) = 0;
    v74 = [v45 safeValueForKey:@"_elementsToElementViewControllers"];
    v75 = __UIAccessibilitySafeClass();

    if (LOBYTE(v124.a)) {
      abort();
    }
    v100 = v75;
    if ([v75 count])
    {
      v76 = [v75 objectEnumerator];
      uint64_t v77 = [v76 nextObject];
      if (v77)
      {
        v78 = (void *)v77;
        do
        {
          v79 = (objc_class *)objc_opt_class();
          if (v79 != NSClassFromString(&cfstr_Sauiindicatore.isa))
          {
            v80 = [v78 safeUIViewForKey:@"_elementView"];
            [v73 axSafelyAddObject:v80];
          }
          uint64_t v81 = [v76 nextObject];

          v78 = (void *)v81;
        }
        while (v81);
      }
      v82 = [v73 sortedArrayUsingComparator:&__block_literal_global_845];
      uint64_t v83 = [v82 mutableCopy];

      id v73 = (id)v83;
    }
    v84 = [v44 safeValueForKey:@"_indicatorContainerView"];
    v85 = [v84 accessibilityLabel];

    if (v85) {
      [v73 axSafelyAddObject:v84];
    }
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v86 = v5;
    uint64_t v87 = [v86 countByEnumeratingWithState:&v115 objects:v145 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      v99 = v44;
      v89 = v45;
      uint64_t v90 = *(void *)v116;
      while (2)
      {
        for (uint64_t n = 0; n != v88; ++n)
        {
          if (*(void *)v116 != v90) {
            objc_enumerationMutation(v86);
          }
          v92 = *(void **)(*((void *)&v115 + 1) + 8 * n);
          [v92 frame];
          if (v93 > v47)
          {
            unint64_t v94 = [v86 indexOfObject:v92];
            goto LABEL_78;
          }
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v115 objects:v145 count:16];
        if (v88) {
          continue;
        }
        break;
      }
      unint64_t v94 = 0;
LABEL_78:
      v45 = v89;
      v44 = v99;
    }
    else
    {
      unint64_t v94 = 0;
    }

    if ((v101 & 1) == 0) {
      [v73 axSafelyAddObject:v44];
    }
    id v95 = objc_alloc_init(MEMORY[0x263F089C8]);
    if (v94 < [v73 count] + v94)
    {
      unint64_t v96 = v94;
      do
        [v95 addIndex:v96++];
      while (v96 < [v73 count] + v94);
    }
    [v86 insertObjects:v73 atIndexes:v95];
  }
  v97 = [(SpringBoardAccessibility *)self _accessibilityGeometrySortedElements:v5];

  return v97;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbtopaffordanc_2.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityTraits];
  return (*MEMORY[0x263F813F0] & v2) != 0;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_4(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) _axSetIsHitTesting:1];
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    [v2 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_826];
  }
  else {
  BOOL v4 = [v2 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_826];
  }
  [v3 axSafelyAddObjectsFromArray:v4];

  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v6 = *(void **)(a1 + 32);
    return [v6 _axSetIsHitTesting:0];
  }
  return result;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement])
  {
    uint64_t v3 = [v2 _accessibilityFindAncestor:&__block_literal_global_829 startWithSelf:0];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = 1;
  }
  else
  {
    [v4 accessibilityFrame];
    double v8 = v7;
    [v5 accessibilityFrame];
    if (v8 <= v9)
    {
      uint64_t v6 = -1;
    }
    else
    {
      [v4 accessibilityFrame];
      double v11 = v10;
      [v5 accessibilityFrame];
      uint64_t v6 = v11 >= v12;
    }
  }

  return v6;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  return v6 < v8;
}

- (id)_firstStatusBarElement
{
  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  uint64_t v3 = [(SpringBoardAccessibility *)&v8 _firstStatusBarElement];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(SpringBoardAccessibility *)self _accessibilityStatusBarElements:0 sorted:1];
    id v5 = [v6 firstObject];
  }

  return v5;
}

- (id)_lastStatusBarElement
{
  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  uint64_t v3 = [(SpringBoardAccessibility *)&v8 _lastStatusBarElement];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(SpringBoardAccessibility *)self _accessibilityStatusBarElements:0 sorted:1];
    id v5 = [v6 lastObject];
  }

  return v5;
}

- (BOOL)_accessibilityShouldHitTestStatusBarWindow
{
  id v2 = AXFrontBoardFocusedAppProcesses();
  if ([v2 count] == 1)
  {
    uint64_t v3 = AXFrontBoardSystemAppProcess();
    id v4 = [v2 firstObject];
    char v5 = [v3 isEqual:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_accessibilityStatusBar
{
  uint64_t v3 = [(SpringBoardAccessibility *)self _accessibilityMainWindow];
  NSClassFromString(&cfstr_Sbassistantwin_0.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 _accessibilityDescendantOfType:objc_opt_class()],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)SpringBoardAccessibility;
    id v4 = [(SpringBoardAccessibility *)&v6 _accessibilityStatusBar];
  }

  return v4;
}

- (BOOL)_accessibilitySystemAppServerIsReady
{
  if (![(SpringBoardAccessibility *)self safeBoolForKey:@"_hasFinishedLaunching"])return 0; {
  id v2 = AXSBLockScreenViewController();
  }
  if (v2) {
    BOOL v3 = NSClassFromString(&cfstr_Axspringboards_0.isa) != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_accessibilityHandleOrientationChange
{
}

- (void)_legacy_noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 updateMirroredDisplays:(BOOL)a5 force:(BOOL)a6 logMessage:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v8 _legacy_noteInterfaceOrientationChanged:a3 duration:a5 updateMirroredDisplays:a6 force:a7 logMessage:a4];
  if (_legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___LastPostedOrientation != a3)
  {
    _legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___LastPostedOrientatiouint64_t n = a3;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __117__SpringBoardAccessibility__legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityHandleOrientationChange];
}

- (id)_accessibilitySoftwareMimicKeyboard
{
  BOOL v3 = [MEMORY[0x263F22968] server];
  int v4 = [v3 isPasscodeLockVisible];

  if (v4)
  {
    char v5 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstanceIfExists"];
    objc_super v6 = [v5 safeValueForKey:@"_lockScreenEnvironment"];
    double v7 = [v6 safeValueForKeyPath:@"rootViewController.view"];
    objc_super v8 = [v7 _accessibilityFindDescendant:&__block_literal_global_869];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SpringBoardAccessibility;
    objc_super v8 = [(SpringBoardAccessibility *)&v10 _accessibilitySoftwareMimicKeyboard];
  }

  return v8;
}

uint64_t __63__SpringBoardAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsSoftwareKeyboardMimic];
}

- (void)accessibilityInitialize
{
  if ((SpringBoardAccessibility *)_SBAXInstance != self)
  {
    objc_storeStrong((id *)&_SBAXInstance, self);
    uint64_t v3 = +[SBVoiceOverTouchConnection defaultConnection];
    int v4 = (void *)_VOTConnection;
    _VOTConnectiouint64_t n = v3;

    *(double *)&_SBAXPhoneCallLastEnded = CFAbsoluteTimeGetCurrent() + -10.0;
    _AXStatusEnabled = _AXSApplicationAccessibilityEnabled() != 0;
    if ((accessibilityInitialize_DidEnable & 1) == 0)
    {
      char v5 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v6 = *MEMORY[0x263F7E310];
      double v7 = [MEMORY[0x263F08A48] mainQueue];
      id v8 = (id)[v5 addObserverForName:v6 object:0 queue:v7 usingBlock:&__block_literal_global_877];

      double v9 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v10 = *MEMORY[0x263F796F8];
      double v11 = [MEMORY[0x263F08A48] mainQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_879;
      v18[3] = &unk_265154678;
      v18[4] = self;
      id v12 = (id)[v9 addObserverForName:v10 object:0 queue:v11 usingBlock:v18];

      BOOL v13 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v14 = *MEMORY[0x263F1CE78];
      uint64_t v15 = [MEMORY[0x263F08A48] mainQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_2;
      v17[3] = &unk_265154678;
      v17[4] = self;
      id v16 = (id)[v13 addObserverForName:v14 object:0 queue:v15 usingBlock:v17];

      accessibilityInitialize_DidEnable = 1;
    }
    [(SpringBoardAccessibility *)self _accessibilityUpdateSpeakScreenGestureRecognizer];
  }
}

void __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F7E1A0] sharedInstance];
  v1 = [v0 currentCalls];

  if (!v1)
  {
    id v2 = AXLogSpringboardServer();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 134217984;
      uint64_t v4 = _SBAXPhoneCallLastEnded;
      _os_log_impl(&dword_242561000, v2, OS_LOG_TYPE_INFO, "marking last call at %f", (uint8_t *)&v3, 0xCu);
    }

    _SBAXPhoneCallLastEnded = CFAbsoluteTimeGetCurrent();
  }
}

uint64_t __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_879(uint64_t a1)
{
  UIAccessibilityPostNotification(0x7EBu, 0);
  id v2 = *(void **)(a1 + 32);

  return [v2 _accessibilityUpdateRingerState];
}

uint64_t __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateSpeakScreenGestureRecognizer];
}

- (void)accessibilityDisable
{
  id v2 = (void *)_SBAXInstance;
  _SBAXInstance = 0;

  int v3 = (void *)_VOTConnection;

  [v3 tearDownVoiceOverTouchConnection];
}

- (BOOL)_accessibilityShouldLoadAXInfoOnAppLaunchFinish
{
  return MEMORY[0x270F09620](self, &__SpringBoard___accessibilityShouldLoadAXInfoOnAppLaunchFinish);
}

- (void)_accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:(BOOL)a3
{
}

- (BOOL)_accessibilityShouldCallAXStatusChangedOnAppLaunchFinish
{
  return MEMORY[0x270F09620](self, &__SpringBoard___accessibilityShouldCallAXStatusChangedOnAppLaunchFinish);
}

- (void)_accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:(BOOL)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  if ([(SpringBoardAccessibility *)self safeBoolForKey:@"_hasFinishedLaunching"])
  {
    v6.receiver = self;
    v6.super_class = (Class)SpringBoardAccessibility;
    [(SpringBoardAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
    int v3 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstanceIfExists"];
    [v3 _accessibilityLoadAccessibilityInformation];

    uint64_t v4 = [NSClassFromString(&cfstr_Sbwallpapercon_0.isa) safeValueForKey:@"sharedInstance"];
    [v4 _accessibilityLoadAccessibilityInformation];

    uint64_t v5 = [(SpringBoardAccessibility *)self safeValueForKey:@"_extendedDisplayControllerProvider"];
    [v5 _accessibilityLoadAccessibilityInformation];

    [(SpringBoardAccessibility *)self accessibilityInitialize];
  }
  else
  {
    [(SpringBoardAccessibility *)self _accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:1];
  }
}

- (void)_accessibilityLoadPIPInfo
{
  int v3 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];

  if (v3)
  {
    id v4 = [(SpringBoardAccessibility *)self _accessibilityPIPCoordinator];
    [v4 _accessibilityLoadAccessibilityInformation];
  }
}

- (void)_accessibilityStatusChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityValueForKey:@"AXReenabledTimer"];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v5 = (void *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(SpringBoardAccessibility *)self _accessibilitySetRetainedValue:v5 forKey:@"AXReenabledTimer"];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SpringBoardAccessibility__accessibilityStatusChanged___block_invoke;
  v8[3] = &unk_265154148;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 afterDelay:v8 processBlock:0.3];
}

uint64_t __56__SpringBoardAccessibility__accessibilityStatusChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processAccessibilityStatusChange:*(void *)(a1 + 40)];
}

- (void)_processAccessibilityStatusChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = [(SpringBoardAccessibility *)self safeBoolForKey:@"_hasFinishedLaunching"];
    _os_log_impl(&dword_242561000, v5, OS_LOG_TYPE_DEFAULT, "SB AX Status change (finished: %d), ", buf, 8u);
  }

  if ([(SpringBoardAccessibility *)self safeBoolForKey:@"_hasFinishedLaunching"])
  {
    v10.receiver = self;
    v10.super_class = (Class)SpringBoardAccessibility;
    [(SpringBoardAccessibility *)&v10 _accessibilityStatusChanged:v4];
    int v6 = _AXSApplicationAccessibilityEnabled();
    id v7 = AXLogLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v6 != 0;
      _os_log_impl(&dword_242561000, v7, OS_LOG_TYPE_INFO, "SB new status: %d, ", buf, 8u);
    }

    if (_AXStatusEnabled || !v6)
    {
      if (_AXStatusEnabled == (v6 != 0)) {
        [MEMORY[0x263F811C8] _accessibilityReenabled];
      }
      _AXStatusEnabled = v6 != 0;
      if (!v6)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F21908], 0, 0, 1u);
        id v9 = AXLogLoading();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_242561000, v9, OS_LOG_TYPE_INFO, "Posted kAXAccessibilityTurnedOff notification", buf, 2u);
        }
      }
    }
    else
    {
      [(SpringBoardAccessibility *)self accessibilityInitialize];
      [(SpringBoardAccessibility *)self _accessibilityLoadPIPInfo];
      _AXStatusEnabled = v6 != 0;
    }
  }
  else
  {
    [(SpringBoardAccessibility *)self _accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:1];
  }
}

- (void)applicationDidFinishLaunching:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v4 applicationDidFinishLaunching:a3];
  if ([(SpringBoardAccessibility *)self _accessibilityShouldCallAXStatusChangedOnAppLaunchFinish])
  {
    [(SpringBoardAccessibility *)self _accessibilityStatusChanged:0];
  }
  if ([(SpringBoardAccessibility *)self _accessibilityShouldLoadAXInfoOnAppLaunchFinish])
  {
    [(SpringBoardAccessibility *)self _accessibilityLoadAccessibilityInformation];
  }
}

- (void)restartManagerWillReboot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = accessibilityLocalizedString(@"rebooting.format");
  if (v5)
  {
    id v6 = [NSString alloc];
    id v7 = [MEMORY[0x263F1C5C0] currentDevice];
    id v8 = [v7 localizedModel];
    id v9 = objc_msgSend(v6, "initWithFormat:", v5, v8);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v10 restartManagerWillReboot:v4];
}

- (BOOL)_isDim
{
  if (UIAccessibilityIsVoiceOverRunning() && _SBAXScreenCurtainEnabled && *(float *)&_SBAXRealBacklightFactor == 1.0) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SpringBoardAccessibility;
  return [(SpringBoardAccessibility *)&v5 _isDim];
}

- (void)_accessibilityDeactivationAnimationWillBegin
{
  v2.receiver = self;
  v2.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v2 _accessibilityDeactivationAnimationWillBegin];
  UIAccessibilityPostNotification(*MEMORY[0x263F81348], 0);
}

- (int64_t)_accessibilityApplicationOrientation
{
  LODWORD(result) = +[AXSpringBoardGlue applicationOrientation];
  if (result >= 7) {
    return 1;
  }
  else {
    return result;
  }
}

- (BOOL)_accessibilityIsVoiceControlRunning
{
  if (!_accessibilityIsVoiceControlRunning_VoiceControlClass) {
    _accessibilityIsVoiceControlRunning_VoiceControlClass = (uint64_t)NSClassFromString(&cfstr_Sbvoicecontrol.isa);
  }
  objc_super v2 = [(id)*MEMORY[0x263F1D020] keyWindow];
  int v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_909];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __63__SpringBoardAccessibility__accessibilityIsVoiceControlRunning__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityIsBatteryLow
{
  objc_super v2 = [(objc_class *)AXSpringBoardGlueSBUIControllerClass() safeValueForKey:@"sharedInstance"];
  int v3 = [v2 safeValueForKey:@"batteryCapacityAsPercentage"];
  uint64_t v4 = [v3 integerValue];

  return v4 < 21;
}

- (BOOL)_accessibilityIsSystemLocked
{
  objc_super v2 = +[AXSpringBoardGlue sharedInstance];
  char v3 = [v2 isUILocked];

  return v3;
}

- (BOOL)_accessibilityIsAlarmRinging
{
  objc_super v2 = [(SpringBoardAccessibility *)self safeValueForKey:@"notificationDispatcher"];
  char v3 = [v2 safeValueForKey:@"_alertingController"];
  uint64_t v4 = [v3 safeValueForKey:@"soundController"];
  char v5 = [v4 _accessibilityIsAlarmRinging];

  return v5;
}

- (BOOL)_accessibilityIsSystemSleeping
{
  objc_super v2 = [(SpringBoardAccessibility *)self safeValueForKey:@"_accessibilityObjectWithinProximity"];
  char v3 = [v2 BOOLValue];

  if (v3) {
    return 1;
  }
  char v5 = +[AXSpringBoardGlue sharedInstance];
  char v6 = [v5 isDimmed];

  return v6;
}

- (BOOL)_accessibilitySystemWideGestureInProgress
{
  objc_super v2 = [(SpringBoardAccessibility *)self safeValueForKey:@"_accessibilityIsSystemGestureActive"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_accessibilityLaunchableApps
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v2 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeValueForKey:@"model"];

  uint64_t v4 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
  char v5 = [v4 safeValueForKey:@"allApplications"];

  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_super v10 = [v9 safeValueForKey:@"bundleIdentifier"];
        double v11 = [v9 safeValueForKey:@"displayName"];
        int v12 = [v9 safeValueForKey:@"isInternalApplication"];
        LOBYTE(v9) = [v12 BOOLValue];

        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x2020000000;
        char v21 = 0;
        id v17 = v3;
        id v13 = v10;
        AXPerformSafeBlock();
        if ((v9 & 1) == 0 && *((unsigned char *)v19 + 24) && v13 && v11) {
          [v15 setObject:v13 forKey:v11];
        }

        _Block_object_dispose(&v18, 8);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v15;
}

void __56__SpringBoardAccessibility__accessibilityLaunchableApps__block_invoke(void *a1)
{
  objc_super v2 = (void *)a1[4];
  id v3 = [v2 applicationIconForBundleIdentifier:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isIconVisible:v3];
}

- (id)_accessibilityCenterPointOfScreen
{
  objc_super v2 = [(SpringBoardAccessibility *)self _accessibilityMainWindow];
  id v3 = [v2 screen];

  [v3 bounds];
  double MidX = CGRectGetMidX(v8);
  [v3 bounds];
  char v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", MidX, CGRectGetMidY(v9));

  return v5;
}

- (BOOL)_accessibilityIsAppSwitcherVisible
{
  objc_super v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  char v3 = [v2 safeBoolForKey:@"isAnySwitcherVisible"];

  return v3;
}

- (id)_accessibilityAppSwitcherApps
{
  return 0;
}

- (BOOL)_accessibilityHitTestsStatusBar
{
  objc_super v2 = [MEMORY[0x263F1C408] sharedApplication];
  char v3 = [v2 safeValueForKey:@"bannerManager"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  char v5 = AXWindowScene(@"activeDisplayWindowScene");
  LOBYTE(v3) = [v4 isDisplayingBannerInWindowScene:v5];

  return (char)v3;
}

- (BOOL)_accessibilityIsBuddyRunning
{
  return +[AXSpringBoardGlue isBuddyRunning];
}

- (id)_accessibilitySideAppDividerElement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  char v3 = AXSwitcherController(@"activeDisplayWindowScene", v2);
  uint64_t v4 = [v3 safeValueForKey:@"contentViewController"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = objc_msgSend(v4, "safeDictionaryForKey:", @"visibleUnderlayAccessoryViews", 0);
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      double v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) safeUIViewForKey:@"_resizeGrabber"];
      if ([v11 _accessibilityViewIsVisible]) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    double v11 = 0;
  }

  return v11;
}

- (id)_accessibilityHomeAffordanceView
{
  objc_super v2 = [NSClassFromString(&cfstr_Sbscenemanager.isa) safeValueForKey:@"mainDisplaySceneManager"];
  char v3 = [v2 safeValueForKey:@"windowScene"];
  uint64_t v4 = [v3 safeUIViewForKey:@"keyWindow"];
  char v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_936];
  uint64_t v6 = [v5 safeUIViewForKey:@"_pillView"];

  return v6;
}

uint64_t __60__SpringBoardAccessibility__accessibilityHomeAffordanceView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sbhomegrabberv_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityPIPCoordinator
{
  id v2 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
  char v3 = [v2 safeValueForKey:@"pipCoordinator"];

  return v3;
}

- (id)_accessibilityPictureInPictureWindow
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [(SpringBoardAccessibility *)self _accessibilityPIPCoordinator];
  char v3 = [v2 safeDictionaryForKey:@"_controllersByType"];
  uint64_t v4 = [v3 objectForKey:&unk_26F7E5ED8];

  char v31 = 0;
  objc_opt_class();
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  char v21 = __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke;
  long long v22 = &unk_265153E18;
  long long v24 = &v25;
  id v5 = v4;
  id v23 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  uint64_t v7 = __UIAccessibilityCastAsClass();

  if (v31) {
    abort();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__8;
      v29 = __Block_byref_object_dispose__8;
      id v30 = 0;
      id v14 = v5;
      AXPerformSafeBlock();
      id v12 = (id)v26[5];

      _Block_object_dispose(&v25, 8);
      if (v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v32 count:16];
        if (v9) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v12 = 0;
  }

  return v12;
}

uint64_t __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _windowScenesDisplayingPIPContent];

  return MEMORY[0x270F9A758]();
}

uint64_t __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _leadingWindowForWindowScene:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  if (a3 > 5039)
  {
    if (a3 == 5040)
    {
      uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilitySideAppDividerElement];
    }
    else if (a3 == 5065)
    {
      uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityHomeAffordanceView];
    }
    else
    {
LABEL_9:
      v13.receiver = self;
      v13.super_class = (Class)SpringBoardAccessibility;
      uint64_t v5 = -[SpringBoardAccessibility _iosAccessibilityAttributeValue:](&v13, sel__iosAccessibilityAttributeValue_);
    }
  }
  else
  {
    switch(a3)
    {
      case 1500:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilityIsSystemLocked];
        goto LABEL_29;
      case 1501:
        char v3 = NSNumber;
        if ([(SpringBoardAccessibility *)self _accessibilityIsVoiceControlRunning])
        {
          uint64_t v11 = 1;
        }
        else
        {
          uint64_t IsAssistantVisible = AXSpringBoardIsAssistantVisible();
LABEL_29:
          uint64_t v11 = IsAssistantVisible;
        }
        uint64_t v5 = [v3 numberWithBool:v11];
        break;
      case 1502:
      case 1511:
        goto LABEL_9;
      case 1503:
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithLong:", -[SpringBoardAccessibility _accessibilityApplicationOrientation](self, "_accessibilityApplicationOrientation"));
        break;
      case 1504:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilityIsBatteryLow];
        goto LABEL_29;
      case 1505:
        id v6 = NSNumber;
        uint64_t v7 = [(SpringBoardAccessibility *)self _accessibilityCurrentCallState];
        goto LABEL_23;
      case 1506:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilitySystemWideGestureInProgress];
        goto LABEL_29;
      case 1507:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilityIsSystemSleeping];
        goto LABEL_29;
      case 1508:
        uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityLaunchableApps];
        break;
      case 1509:
        uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityAppSwitcherApps];
        break;
      case 1510:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilityIsAppSwitcherVisible];
        goto LABEL_29;
      case 1512:
        uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityCenterPointOfScreen];
        break;
      case 1513:
        uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityPictureInPictureWindow];
        break;
      case 1514:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilitySpringBoardIsModal];
        goto LABEL_29;
      case 1515:
        char v3 = NSNumber;
        uint64_t IsAssistantVisible = [(SpringBoardAccessibility *)self _accessibilityIsAlarmRinging];
        goto LABEL_29;
      case 1516:
        id v8 = NSNumber;
        uint64_t v9 = [MEMORY[0x263F22968] server];
        uint64_t v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isControlCenterVisible"));

        goto LABEL_32;
      case 1517:
        uint64_t v5 = [(SpringBoardAccessibility *)self _accessibilityFocusActiveActivityName];
        break;
      default:
        if (a3 != 1107) {
          goto LABEL_9;
        }
        id v6 = NSNumber;
        uint64_t v7 = [(SpringBoardAccessibility *)self _accessibilityRemoteKeyboardApp];
LABEL_23:
        uint64_t v5 = [v6 numberWithInt:v7];
        break;
    }
  }
  uint64_t v10 = (void *)v5;
LABEL_32:

  return v10;
}

- (id)_accessibilityNextDockElementStartingAtDisplayID:(unsigned int)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  char v42 = 0;
  uint64_t v4 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
  uint64_t v5 = __UIAccessibilitySafeClass();

  id v6 = [v5 safeSetForKey:@"connectedWindowScenes"];
  if ([v6 count] == 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v6;
    uint64_t v32 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v39;
      uint64_t v27 = v6;
      v28 = v5;
      unsigned int v26 = a3;
      id v29 = v8;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v8);
          }
          uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v11 = [v10 safeValueForKey:@"floatingDockController"];
          if ([v11 safeBoolForKey:@"isFloatingDockFullyPresented"])
          {
            id v12 = [v10 screen];
            objc_super v13 = [v12 displayIdentity];
            int v14 = [v13 displayID];

            if (v14 != a3)
            {
              char v31 = [v11 safeValueForKey:@"floatingDockViewController"];
              id v30 = [v31 safeValueForKey:@"_dockView"];
              long long v15 = [v30 safeValueForKey:@"_userIconListView"];
              char v42 = 0;
              long long v16 = [v15 safeValueForKey:@"_iconViews"];
              long long v17 = __UIAccessibilitySafeClass();

              if (v42) {
LABEL_30:
              }
                abort();
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v35;
                while (2)
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v35 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * j);
                    char v42 = 0;
                    long long v24 = [v18 objectForKey:v23];
                    uint64_t v7 = __UIAccessibilitySafeClass();

                    if (v42) {
                      goto LABEL_30;
                    }
                    if (v7)
                    {

                      id v6 = v27;
                      uint64_t v5 = v28;
                      id v8 = v29;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
                  if (v20) {
                    continue;
                  }
                  break;
                }
              }

              a3 = v26;
              id v8 = v29;
            }
          }
        }
        uint64_t v7 = 0;
        id v6 = v27;
        uint64_t v5 = v28;
        uint64_t v32 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v32);
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_26:
  }

  return v7;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  if (a3 == 91513)
  {
    id v5 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    uint64_t v7 = -[SpringBoardAccessibility _accessibilityNextDockElementStartingAtDisplayID:](self, "_accessibilityNextDockElementStartingAtDisplayID:", [v6 unsignedIntValue]);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SpringBoardAccessibility;
    id v5 = a4;
    uint64_t v7 = [(SpringBoardAccessibility *)&v11 _iosAccessibilityAttributeValue:a3 forParameter:v5];
  }
  uint64_t v9 = (void *)v7;

  return v9;
}

- (id)_accessibilityFocusActiveActivityName
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v2 = (void *)getFCActivityManagerClass_softClass;
  uint64_t v12 = getFCActivityManagerClass_softClass;
  if (!getFCActivityManagerClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getFCActivityManagerClass_block_invoke;
    v8[3] = &unk_265153E40;
    v8[4] = &v9;
    __getFCActivityManagerClass_block_invoke((uint64_t)v8);
    id v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  uint64_t v4 = [v3 sharedActivityManager];
  id v5 = [v4 activeActivity];
  id v6 = [v5 activityDisplayName];

  return v6;
}

- (int)_accessibilityRemoteKeyboardApp
{
  id v2 = [(SpringBoardAccessibility *)self _axKeyboardFocusCoordinator];
  id v3 = [v2 safeValueForKey:@"_inputUISceneController"];
  uint64_t v4 = [v3 safeValueForKey:@"_inputUIScene"];
  id v5 = __UIAccessibilitySafeClass();

  id v6 = [v5 clientHandle];
  uint64_t v7 = [v6 processHandle];
  LODWORD(v4) = [v7 pid];

  return (int)v4;
}

- (id)_accessibilityOrientationDeferralAssertion
{
}

- (void)_setAccessibilityOrientationDeferralAssertion:(id)a3
{
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if ((int)v6 > 5300)
  {
    if (v6 != 5301)
    {
      if (v6 != 5303)
      {
LABEL_40:
        v62.receiver = self;
        v62.super_class = (Class)SpringBoardAccessibility;
        unsigned __int8 v16 = [(SpringBoardAccessibility *)&v62 _iosAccessibilityPerformAction:v6 withValue:v9 fencePort:v5];
        goto LABEL_57;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count])
      {
        uint64_t v11 = [v9 firstObject];
        uint64_t v12 = [v11 intValue];

        if ((unint64_t)[v9 count] < 2)
        {
          id v13 = 0;
        }
        else
        {
          id v13 = [v9 lastObject];
        }
        unsigned __int8 v16 = [(SpringBoardAccessibility *)self _accessibilitySwitchNativeFocusedApplicationWithPID:v12 identifier:v13];
LABEL_49:

        goto LABEL_57;
      }
      uint64_t v25 = FKALogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:].cold.4(v25, v51, v52, v53, v54, v55, v56, v57);
      }
LABEL_42:

LABEL_56:
      unsigned __int8 v16 = 1;
      goto LABEL_57;
    }
    if (!v8)
    {
      long long v34 = 0;
      uint64_t v33 = 0;
LABEL_55:
      LOBYTE(v69) = 0;
      objc_opt_class();
      v58 = [(SpringBoardAccessibility *)self _axKeyboardFocusCoordinator];
      uint64_t v59 = __UIAccessibilityCastAsSafeCategory();

      [v59 _accessibilitySetPrimaryKeyboardFocusOverridePid:v33 sceneID:v34];
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = [v9 lastObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v32 = [v9 firstObject];
          uint64_t v33 = [v32 intValue];

          long long v34 = [v9 lastObject];
          if (!v33)
          {
            long long v35 = FKALogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](v35, v36, v37, v38, v39, v40, v41, v42);
            }
          }
          if ([v34 length]) {
            goto LABEL_55;
          }
          Class v43 = FKALogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](v43, v44, v45, v46, v47, v48, v49, v50);
          }
          goto LABEL_54;
        }
      }
      else
      {
      }
    }
    Class v43 = FKALogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:]((uint64_t)v9, v43);
    }
    long long v34 = 0;
    uint64_t v33 = 0;
LABEL_54:

    goto LABEL_55;
  }
  switch((int)v6)
  {
    case 5009:
      if ([v8 BOOLValue])
      {
        id v10 = [(SpringBoardAccessibility *)self _accessibilityOrientationDeferralAssertion];
        [v10 invalidate];
      }
      else
      {
        uint64_t v69 = 0;
        v70 = &v69;
        uint64_t v71 = 0x3032000000;
        v72 = __Block_byref_object_copy__8;
        id v73 = __Block_byref_object_dispose__8;
        id v74 = 0;
        uint64_t v63 = MEMORY[0x263EF8330];
        uint64_t v64 = 3221225472;
        double v65 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_973;
        v66 = &unk_265153E18;
        double v67 = self;
        v68 = &v69;
        AXPerformSafeBlock();
        id v10 = (id)v70[5];
        _Block_object_dispose(&v69, 8);

        [(SpringBoardAccessibility *)self _setAccessibilityOrientationDeferralAssertion:v10];
      }

      goto LABEL_40;
    case 5010:
    case 5011:
      goto LABEL_40;
    case 5012:
      long long v17 = [NSClassFromString(&cfstr_Sbuicontroller.isa) safeValueForKey:@"sharedInstance"];
      id v18 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x2020000000;
      LOBYTE(v72) = 0;
      uint64_t v81 = MEMORY[0x263EF8330];
      uint64_t v82 = 3221225472;
      uint64_t v83 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke;
      v84 = &unk_2651546C0;
      id v19 = v18;
      id v85 = v19;
      id v86 = v9;
      id v13 = v17;
      id v87 = v13;
      uint64_t v88 = &v69;
      AXPerformSafeBlock();
      unsigned __int8 v16 = *((unsigned char *)v70 + 24) != 0;

      _Block_object_dispose(&v69, 8);
      goto LABEL_49;
    case 5013:
      LOBYTE(v69) = 0;
      uint64_t v20 = [MEMORY[0x263F1C408] safeValueForKeyPath:@"brightnessControl._displayBrightnessController"];
      int v14 = __UIAccessibilitySafeClass();

      objc_opt_class();
      unsigned __int8 v16 = objc_opt_isKindOfClass();
      if (v16)
      {
        id v21 = v9;
        uint64_t v22 = [v21 newHIDEventRef];
        if (v22)
        {
          uint64_t v23 = (const void *)v22;
          uint64_t v75 = MEMORY[0x263EF8330];
          uint64_t v76 = 3221225472;
          uint64_t v77 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2;
          v78 = &unk_2651546E8;
          id v79 = v14;
          v80 = v23;
          AXPerformSafeBlock();
          CFRelease(v23);
        }
      }
      goto LABEL_46;
    case 5014:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [(SpringBoardAccessibility *)self _accessibilityIsBuddyRunning])
      {
        goto LABEL_17;
      }
      int v14 = [MEMORY[0x263F22968] server];
      unsigned __int8 v15 = objc_msgSend(v14, "showControlCenter:", objc_msgSend(v9, "BOOLValue"));
      goto LABEL_45;
    case 5015:
      long long v24 = [MEMORY[0x263F22938] sharedInstance];
      uint64_t v25 = [v24 voiceOverHandwritingWasNativeAutocorrectEnabled];

      if (v25)
      {
        LOBYTE(v61) = 1;
        _AXLogWithFacility();
        unsigned int v26 = objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController", v61, @"Restoring preferences changed by VOT Handwriting now");
        [v26 setValue:v25 forKey:8];

        uint64_t v27 = [MEMORY[0x263F1C758] sharedPreferencesController];
        [v27 synchronizePreferences];

        v28 = [MEMORY[0x263F22938] sharedInstance];
        [v28 setVoiceOverHandwritingWasNativeAutocorrectEnabled:0];
      }
      else
      {
        _AXAssert();
        _AXLogWithFacility();
      }
      goto LABEL_42;
    default:
      if (v6 != 5000) {
        goto LABEL_40;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [(SpringBoardAccessibility *)self _accessibilityIsBuddyRunning])
      {
LABEL_17:
        unsigned __int8 v16 = 0;
      }
      else
      {
        int v14 = [MEMORY[0x263F22968] server];
        unsigned __int8 v15 = objc_msgSend(v14, "showNotificationCenter:", objc_msgSend(v9, "BOOLValue"));
LABEL_45:
        unsigned __int8 v16 = v15;
LABEL_46:
      }
      break;
  }
LABEL_57:

  return v16 & 1;
}

uint64_t __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) _activateApplicationFromAccessibility:v2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrightnessKeyPressEvent:*(void *)(a1 + 40)];
}

uint64_t __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_973(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) deviceOrientationUpdateDeferralAssertionWithReason:@"Accessibility"];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityFocusableScenes
{
  id v3 = [(SpringBoardAccessibility *)self _axKeyboardFocusCoordinator];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke;
  block[3] = &unk_265153D50;
  id v4 = v3;
  id v12 = v4;
  if (_accessibilityFocusableScenes_onceToken != -1) {
    dispatch_once(&_accessibilityFocusableScenes_onceToken, block);
  }
  uint64_t v5 = [(SpringBoardAccessibility *)self safeArrayForKey:@"_accessibilityActiveScenes"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke_2;
  v9[3] = &unk_265154710;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 axFilterObjectsUsingBlock:v9];

  return v7;
}

uint64_t __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  _accessibilityFocusableScenes__sShouldCheckKeyboardFocusCoordinator = result & 1;
  return result;
}

uint64_t __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_accessibilityFocusableScenes__sShouldCheckKeyboardFocusCoordinator)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__8;
    id v13 = __Block_byref_object_dispose__8;
    id v14 = 0;
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    AXPerformSafeBlock();
    id v4 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    char isKindOfClass = v4 != 0;
  }
  else
  {
    NSClassFromString(&cfstr_Sbwindowscene.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _sceneControllerForScene:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axKeyboardFocusCoordinator
{
  uint64_t v2 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
  id v3 = [v2 safeValueForKey:@"_keyboardFocusCoordinator"];

  return v3;
}

- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [(SpringBoardAccessibility *)self _axKeyboardFocusCoordinator];
  id v8 = __UIAccessibilityCastAsSafeCategory();

  LOBYTE(v4) = [v8 _accessibilitySwitchNativeFocusedApplicationWithPID:v4 identifier:v6];
  return v4;
}

- (int)_accessibilityCurrentCallState
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__8;
  unsigned __int8 v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  id v3 = [v2 safeValueForKey:@"incomingCallExists"];
  char v4 = [v3 BOOLValue];

  if (v4)
  {
    int v5 = 2;
  }
  else
  {
    id v6 = [v2 safeValueForKey:@"activeCallExists"];
    char v7 = [v6 BOOLValue];

    if (v7)
    {
      int v5 = 1;
    }
    else
    {
      id v8 = [v2 safeValueForKey:@"outgoingCallExists"];
      int v9 = [v8 BOOLValue];

      if (v9) {
        int v5 = 3;
      }
      else {
        int v5 = 0;
      }
    }
  }

  return v5;
}

uint64_t __58__SpringBoardAccessibility__accessibilityCurrentCallState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(objc_class *)AXSpringBoardGlueSBTelephonyManagerClass() sharedTelephonyManagerCreatingIfNecessary:0];

  return MEMORY[0x270F9A758]();
}

- (BOOL)accessibilityStartStopToggle
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = AXSBHIconManagerFromSharedIconController();
  int v4 = [v3 safeBoolForKey:@"isEditing"];

  if (!v4)
  {
    if (AXSpringBoardIsAssistantVisible())
    {
      id v8 = [NSClassFromString(&cfstr_Sbmediacontrol.isa) safeValueForKey:@"sharedInstance"];
      if ([v8 safeBoolForKey:@"isPlaying"]
        && ([v8 safeBoolForKey:@"isPaused"] & 1) == 0)
      {
        uint64_t v49 = [MEMORY[0x263F213C8] sharedInstance];
        char v50 = [v49 ignoreLogging];

        if ((v50 & 1) == 0)
        {
          uint64_t v51 = [MEMORY[0x263F213C8] identifier];
          uint64_t v52 = AXLoggerForFacility();

          os_log_type_t v53 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v52, v53))
          {
            uint64_t v54 = AXColorizeFormatLog();
            uint64_t v55 = _AXStringForArgs();
            if (os_log_type_enabled(v52, v53))
            {
              *(_DWORD *)buf = 138543362;
              v72 = v55;
              _os_log_impl(&dword_242561000, v52, v53, "%{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v66 = MEMORY[0x263EF8330];
        uint64_t v67 = 3221225472;
        v68 = __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke;
        uint64_t v69 = &unk_265153D50;
        id v8 = v8;
        v70 = v8;
        AXPerformSafeBlock();
        char v7 = 1;
        id v16 = v8;
      }
      else
      {
        int v9 = [MEMORY[0x263F213C8] sharedInstance];
        char v10 = [v9 ignoreLogging];

        if ((v10 & 1) == 0)
        {
          uint64_t v11 = [MEMORY[0x263F213C8] identifier];
          id v12 = AXLoggerForFacility();

          os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v12, v13))
          {
            id v14 = AXColorizeFormatLog();
            unsigned __int8 v15 = _AXStringForArgs();
            if (os_log_type_enabled(v12, v13))
            {
              *(_DWORD *)buf = 138543362;
              v72 = v15;
              _os_log_impl(&dword_242561000, v12, v13, "%{public}@", buf, 0xCu);
            }
          }
        }
        id v16 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
        long long v17 = [v16 safeValueForKey:@"_presentedMainScreenSiriPresentation"];
        id v18 = [v17 safeValueForKey:@"siriViewController"];
        id v19 = [v18 safeUIViewForKey:@"_siriView"];
        uint64_t v20 = [v19 safeUIViewForKey:@"siriStatusView"];
        char v7 = [v20 accessibilityPerformMagicTap];
      }
      goto LABEL_63;
    }
    v65.receiver = self;
    v65.super_class = (Class)SpringBoardAccessibility;
    if ([(SpringBoardAccessibility *)&v65 accessibilityStartStopToggle])
    {
      long long v24 = [MEMORY[0x263F213C8] sharedInstance];
      char v25 = [v24 ignoreLogging];

      if (v25) {
        return 1;
      }
      uint64_t v56 = [MEMORY[0x263F213C8] identifier];
      id v8 = AXLoggerForFacility();

      char v7 = 1;
      os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v8, v57)) {
        goto LABEL_64;
      }
      id v16 = AXColorizeFormatLog();
      v58 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v57))
      {
        *(_DWORD *)buf = 138543362;
        v72 = v58;
        _os_log_impl(&dword_242561000, v8, v57, "%{public}@", buf, 0xCu);
      }
      goto LABEL_62;
    }
    unsigned int v26 = [(SpringBoardAccessibility *)self _iosAccessibilityAttributeValue:1500];
    int v27 = [v26 BOOLValue];

    if (v27)
    {
      v28 = [MEMORY[0x263F213C8] sharedInstance];
      char v29 = [v28 ignoreLogging];

      if ((v29 & 1) == 0)
      {
        id v30 = [MEMORY[0x263F213C8] identifier];
        char v31 = AXLoggerForFacility();

        os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = AXColorizeFormatLog();
          long long v34 = _AXStringForArgs();
          if (os_log_type_enabled(v31, v32))
          {
            *(_DWORD *)buf = 138543362;
            v72 = v34;
            _os_log_impl(&dword_242561000, v31, v32, "%{public}@", buf, 0xCu);
          }
        }
      }
      id v8 = [NSClassFromString(&cfstr_Sbmediacontrol.isa) safeValueForKey:@"sharedInstance"];
      if (([v8 safeBoolForKey:@"isPlaying"] & 1) == 0
        && ([v8 safeBoolForKey:@"isPaused"] & 1) == 0)
      {
        uint64_t v59 = [MEMORY[0x263F213C8] sharedInstance];
        char v60 = [v59 ignoreLogging];

        if (v60)
        {
          char v7 = 1;
          goto LABEL_64;
        }
        uint64_t v61 = [MEMORY[0x263F213C8] identifier];
        id v16 = AXLoggerForFacility();

        char v7 = 1;
        os_log_type_t v62 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v16, v62))
        {
LABEL_63:

          goto LABEL_64;
        }
        v58 = AXColorizeFormatLog();
        uint64_t v63 = _AXStringForArgs();
        if (os_log_type_enabled(v16, v62))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v63;
          _os_log_impl(&dword_242561000, v16, v62, "%{public}@", buf, 0xCu);
        }

LABEL_62:
        char v7 = 1;
        goto LABEL_63;
      }
    }
    long long v35 = [MEMORY[0x263F213C8] sharedInstance];
    char v36 = [v35 ignoreLogging];

    if ((v36 & 1) == 0)
    {
      uint64_t v37 = [MEMORY[0x263F213C8] identifier];
      uint64_t v38 = AXLoggerForFacility();

      os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = AXColorizeFormatLog();
        CFAbsoluteTimeGetCurrent();
        uint64_t v41 = _AXStringForArgs();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v41;
          _os_log_impl(&dword_242561000, v38, v39, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_SBAXPhoneCallLastEnded <= 10.0) {
      return 0;
    }
    id v8 = [NSClassFromString(&cfstr_Sbmediacontrol.isa) safeValueForKey:@"sharedInstance"];
    AXPerformSafeBlock();
    uint64_t v42 = [MEMORY[0x263F213C8] sharedInstance];
    char v43 = [v42 ignoreLogging];

    if ((v43 & 1) == 0)
    {
      uint64_t v44 = [MEMORY[0x263F213C8] identifier];
      uint64_t v45 = AXLoggerForFacility();

      os_log_type_t v46 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = AXColorizeFormatLog();
        uint64_t v48 = _AXStringForArgs();
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v48;
          _os_log_impl(&dword_242561000, v45, v46, "%{public}@", buf, 0xCu);
        }
      }
    }
    char v7 = 1;
    id v16 = v8;
    goto LABEL_63;
  }
  int v5 = [MEMORY[0x263F213C8] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v21 = [MEMORY[0x263F213C8] identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v22))
    {
      id v16 = AXColorizeFormatLog();
      uint64_t v23 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v22))
      {
        *(_DWORD *)buf = 138543362;
        v72 = v23;
        _os_log_impl(&dword_242561000, v8, v22, "%{public}@", buf, 0xCu);
      }

      char v7 = 0;
      goto LABEL_63;
    }
    char v7 = 0;
LABEL_64:

    return v7;
  }
  return 0;
}

uint64_t __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePlayPauseForEventSource:1];
}

uint64_t __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke_1027(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePlayPauseForEventSource:1];
}

- (BOOL)_axWasRingerMuted
{
  return MEMORY[0x270F09620](self, &__SpringBoardAccessibility___axWasRingerMuted);
}

- (void)_axSetWasRingerMuted:(BOOL)a3
{
}

- (void)_accessibilityUpdateRingerState
{
  if (![(SpringBoardAccessibility *)self _accessibilityIsSystemSleeping])
  {
    id v3 = [(SpringBoardAccessibility *)self safeValueForKey:@"ringerControl"];
    int v4 = [v3 safeBoolForKey:@"_accessibilityIsRingerMuted"];

    if (v4 != [(SpringBoardAccessibility *)self _axWasRingerMuted])
    {
      if (v4) {
        int v5 = @"silent.mode";
      }
      else {
        int v5 = @"ring.mode";
      }
      accessibilityLocalizedString(v5);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      char v6 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
      [v6 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F218C0]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);
    }
  }
}

- (void)_updateRingerState:(int)a3 reason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(SpringBoardAccessibility *)self safeValueForKey:@"ringerControl"];
  uint64_t v8 = [v7 safeBoolForKey:@"_accessibilityIsRingerMuted"];

  [(SpringBoardAccessibility *)self _axSetWasRingerMuted:v8];
  v9.receiver = self;
  v9.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v9 _updateRingerState:v4 reason:v6];
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SpringBoardAccessibility;
  BOOL v4 = -[SpringBoardAccessibility handleDoubleHeightStatusBarTapWithStyleOverride:](&v7, sel_handleDoubleHeightStatusBarTapWithStyleOverride_);
  int v5 = _AXSHearingAidsPaired();
  if (a3 != 1024 && v5) {
    AXPerformSafeBlock();
  }
  return v4;
}

void __76__SpringBoardAccessibility_handleDoubleHeightStatusBarTapWithStyleOverride___block_invoke()
{
  id v0 = [NSClassFromString(&cfstr_Axsbhearingaid.isa) safeValueForKey:@"sharedController"];
  [v0 showHearingAidControl:0];
}

- (void)_keyboardOrCaseLatchWantsToAttemptUnlock:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  UIAccessibilityPostNotification(*MEMORY[0x263F81320], 0);
  v5.receiver = self;
  v5.super_class = (Class)SpringBoardAccessibility;
  [(SpringBoardAccessibility *)&v5 _keyboardOrCaseLatchWantsToAttemptUnlock:v3];
}

- (void)_takeScreenshotAndEdit:(BOOL)a3
{
  objc_super v5 = +[SBVoiceOverTouchConnection defaultConnection];
  int v6 = [v5 screenCurtainEnabled];

  if (v6)
  {
    objc_super v7 = +[SBVoiceOverTouchConnection defaultConnection];
    [v7 setScreenCurtainEnabled:0 animated:0];
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke;
  v10[3] = &unk_265154740;
  BOOL v11 = a3;
  v10[4] = self;
  char v12 = v6;
  uint64_t v8 = MEMORY[0x2456635C0](v10);
  objc_super v9 = (void *)v8;
  if (v6) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

id __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SpringBoardAccessibility;
  id result = objc_msgSendSuper2(&v4, sel__takeScreenshotAndEdit_, v2);
  if (*(unsigned char *)(a1 + 41)) {
    return (id)AXPerformBlockOnMainThreadAfterDelay();
  }
  return result;
}

void __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_2()
{
  id v0 = +[SBVoiceOverTouchConnection defaultConnection];
  [v0 setScreenCurtainEnabled:1];
}

- (BOOL)_accessibilitySpringBoardIsModal
{
  uint64_t v3 = [MEMORY[0x263F22968] server];
  BOOL v4 = [v3 isDockVisible] && (objc_msgSend(v3, "isShowingNonSystemApp") & 1) != 0
    || [(SpringBoardAccessibility *)self _accessibilityIsShowingLongLookNotification];

  return v4;
}

- (BOOL)_accessibilityIsShowingLongLookNotification
{
  uint64_t v2 = [(SpringBoardAccessibility *)self safeValueForKey:@"notificationDispatcher"];
  uint64_t v3 = [v2 safeValueForKey:@"bannerDestination"];
  if ([v3 safeBoolForKey:@"isPresentingBannerInLongLook"])
  {
    char v4 = 1;
  }
  else
  {
    objc_super v5 = [v2 safeValueForKey:@"dashBoardDestination"];
    char v4 = [v5 safeBoolForKey:@"isPresentingNotificationInLongLook"];
  }
  return v4;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v4 = [(SpringBoardAccessibility *)self safeValueForKey:@"_orientationAggregator"];
  objc_super v5 = [v4 safeValueForKey:@"interfaceOrientationSources"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        NSClassFromString(&cfstr_Sbtransientove_0.isa);
        if (objc_opt_isKindOfClass())
        {
          char v12 = 0;
          BOOL v11 = v6;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = objc_msgSend(MEMORY[0x263F21DB8], "sharedServerHelper", v14);
  char v12 = [v11 _accessibilityNotificationSummary:a3];
LABEL_11:

  return v12;
}

- (unint64_t)_accessibilityNotificationCount
{
  uint64_t v2 = [MEMORY[0x263F21DB8] sharedServerHelper];
  unint64_t v3 = [v2 _accessibilityNotificationCount];

  return v3;
}

- (id)_accessibilitySpeakScreenGestureRecognizer
{
}

- (void)_accessibilitySetSpeakScreenGestureRecognizer:(id)a3
{
}

- (void)_accessibilityHandleSpeakScreenGesture:(id)a3
{
  id v14 = a3;
  [v14 locationInView:0];
  double v5 = v4;
  double v7 = v6;
  if (_AXSSpeakThisEnabled())
  {
    if (([(SpringBoardAccessibility *)self _accessibilityIsSpeakThisTemporarilyDisabled] & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x263F22968] server];
      char v9 = [v8 hasActiveOrPendingCallOrFaceTime];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [v14 state];
        switch(v10)
        {
          case 5:
            os_log_type_t v13 = @"Speak Screen gesture recognizer failed";
            LOBYTE(v12) = 1;
            _AXLogWithFacility();
            break;
          case 4:
            break;
          case 1:
            BOOL v11 = [MEMORY[0x263F78B80] sharedInstance];
            objc_msgSend(v11, "speakThisWithOptions:useAppAtPoint:errorHandler:", 12, &__block_literal_global_1073, v5, v7);
            goto LABEL_10;
          default:
            goto LABEL_11;
        }
        BOOL v11 = objc_msgSend(MEMORY[0x263F78B80], "sharedInstance", v12, v13);
        [v11 didCancelSpeakThisErrorHandler:0];
LABEL_10:
      }
    }
  }
LABEL_11:
}

void __67__SpringBoardAccessibility__accessibilityHandleSpeakScreenGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  unint64_t v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_242561000, v3, OS_LOG_TYPE_INFO, "Error handler: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_accessibilityUpdateSpeakScreenGestureRecognizer
{
  if (AXSpringBoardIsReadyToBeProbed())
  {
    [(SpringBoardAccessibility *)self __accessibilityUpdateSpeakScreenGestureRecognizer];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __76__SpringBoardAccessibility__accessibilityUpdateSpeakScreenGestureRecognizer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateSpeakScreenGestureRecognizer];
}

- (void)__accessibilityUpdateSpeakScreenGestureRecognizer
{
  if (!AXSpringBoardIsReadyToBeProbed()) {
    _AXAssert();
  }
  BOOL IsSpeakScreenEnabled = UIAccessibilityIsSpeakScreenEnabled();
  int v4 = [(SpringBoardAccessibility *)self _accessibilitySpeakScreenGestureRecognizer];

  if (IsSpeakScreenEnabled)
  {
    if (!v4)
    {
      uint64_t v10 = [(UIScreenEdgePanGestureRecognizer *)[SpeakScreenGestureRecognizer alloc] initWithTarget:self action:sel__accessibilityHandleSpeakScreenGesture_];
      [(UIScreenEdgePanGestureRecognizer *)v10 setMinimumNumberOfTouches:2];
      [(SpeakScreenGestureRecognizer *)v10 setMaximumNumberOfTouches:2];
      [(UIScreenEdgePanGestureRecognizer *)v10 setEdges:1];
      id v5 = [MEMORY[0x263F1CD50] sharedInstance];
      uint64_t v6 = [MEMORY[0x263F3F430] mainIdentity];
      [v5 addGestureRecognizer:v10 toDisplayWithIdentity:v6];

      [(SpringBoardAccessibility *)self _accessibilitySetSpeakScreenGestureRecognizer:v10];
    }
  }
  else if (v4)
  {
    double v7 = [MEMORY[0x263F1CD50] sharedInstance];
    uint64_t v8 = [(SpringBoardAccessibility *)self _accessibilitySpeakScreenGestureRecognizer];
    char v9 = [MEMORY[0x263F3F430] mainIdentity];
    [v7 removeGestureRecognizer:v8 fromDisplayWithIdentity:v9];

    [(SpringBoardAccessibility *)self _accessibilitySetSpeakScreenGestureRecognizer:0];
  }
}

- (BOOL)_axIsKeyUIEventCommandTab:(id)a3
{
  id v4 = a3;
  if (!AXDeviceIsPad()) {
    goto LABEL_13;
  }
  int v5 = _UIAccessibilityFullKeyboardAccessEnabled();
  LOBYTE(v6) = 0;
  if (!v4 || !v5) {
    goto LABEL_14;
  }
  if (![(SpringBoardAccessibility *)self safeBoolForKey:@"_hasFinishedLaunching"])
  {
LABEL_13:
    LOBYTE(v6) = 0;
    goto LABEL_14;
  }
  double v7 = [v4 _modifiedInput];
  if (v7)
  {
    uint64_t v6 = [v4 _hidEvent];
    if (v6)
    {
      uint64_t v8 = [NSClassFromString(&cfstr_Sbcommandtabco_0.isa) safeValueForKey:@"sharedInstance"];
      char v9 = v8;
      LOBYTE(v6) = v8
                && [v8 safeBoolForKey:@"isVisible"]
                && (BKSHIDEventGetSourceFromKeyboardEvent() & 0xFFFFFFFD) == 1
                && [v4 _isKeyDown]
                && ([v7 isEqualToString:@"\t"] & 1) != 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

LABEL_14:
  return v6;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  if ([(SpringBoardAccessibility *)self _axIsKeyUIEventCommandTab:v4])
  {
    int v5 = [NSClassFromString(&cfstr_Sbcommandtabco_0.isa) safeValueForKey:@"sharedInstance"];
    id v6 = (id)[v5 next];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SpringBoardAccessibility;
    [(SpringBoardAccessibility *)&v7 _handleKeyUIEvent:v4];
  }
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a1 withValue:(NSObject *)a2 fencePort:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242561000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for kAXOverrideNativeFocusedApplicationAction: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end