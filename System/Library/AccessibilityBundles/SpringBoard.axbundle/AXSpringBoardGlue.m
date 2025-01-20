@interface AXSpringBoardGlue
+ (BOOL)_isSessionLoginSession;
+ (BOOL)_showingBuddyLockScreen;
+ (BOOL)canShowAXInfoPanel;
+ (BOOL)isBuddyRunning;
+ (id)sharedInstance;
+ (int)applicationOrientation;
+ (void)accessibilityInitializeBundle;
+ (void)handleOrientationChange;
+ (void)removeVoiceOverInfoPanel:(double)a3;
+ (void)resetCanShowAXInfoPanel;
+ (void)toggleVoiceOverInfoPanel;
- (BOOL)_accessibilityAllowShowNotificationGestureOverride;
- (BOOL)_axIsAppLibraryOrTodayViewPresent;
- (BOOL)_axIsCoverSheetTodayViewControllerPresent;
- (BOOL)isDimmed;
- (BOOL)isUILocked;
- (int)lastLockSource;
- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3;
@end

@implementation AXSpringBoardGlue

+ (BOOL)canShowAXInfoPanel
{
  return CanShowAXInfoPanel;
}

+ (void)resetCanShowAXInfoPanel
{
  if ((CanShowAXInfoPanel & 1) == 0)
  {
    CanShowAXInfoPanel = 1;
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:a1 selector:sel_toggleVoiceOverInfoPanel name:*MEMORY[0x263F1CF90] object:0];

    [a1 toggleVoiceOverInfoPanel];
  }
}

+ (void)removeVoiceOverInfoPanel:(double)a3
{
  objc_msgSend((id)__axClient, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x263EFFA78], 10001, 0, 0, a3);
  v3 = (void *)__axClient;
  __axClient = 0;
}

+ (BOOL)isBuddyRunning
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [MEMORY[0x263F22968] server];
  v3 = [v2 runningAppProcesses];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__AXSpringBoardGlue_isBuddyRunning__block_invoke;
  v5[3] = &unk_265153C60;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __35__AXSpringBoardGlue_isBuddyRunning__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 safeValueForKey:@"bundleIdentifier"];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F21338]];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)_showingBuddyLockScreen
{
  v2 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstanceIfExists"];
  v3 = [v2 safeValueForKey:@"setupApplication"];
  v4 = [v3 safeValueForKey:@"processState"];
  v5 = __UIAccessibilitySafeClass();

  uint64_t v6 = [v5 safeValueForKey:@"taskState"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [v5 safeValueForKey:@"visibility"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  BOOL v11 = v9 == 2 && v7 == 2;
  return v11;
}

+ (BOOL)_isSessionLoginSession
{
  return MEMORY[0x270F09180](a1, a2);
}

+ (void)toggleVoiceOverInfoPanel
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (CanShowAXInfoPanel == 1)
  {
    uint64_t v3 = [a1 isBuddyRunning];
    uint64_t v4 = [a1 _isSessionLoginSession];
    uint64_t v5 = [a1 _showingBuddyLockScreen];
    int v6 = v3 | v5 | v4;
    if (UIAccessibilityIsVoiceOverRunning() && v6)
    {
      if (!__axClient)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"AXSpringBoardBundle" serviceBundleName:@"VoiceOver"];
        uint64_t v8 = (void *)__axClient;
        __axClient = v7;
      }
      uint64_t v9 = VOTLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [NSNumber numberWithBool:v3];
        BOOL v11 = [NSNumber numberWithBool:v5];
        v12 = [NSNumber numberWithBool:v4];
        *(_DWORD *)buf = 138412802;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_242561000, v9, OS_LOG_TYPE_DEFAULT, "Will show vot-enabled banner. buddyIsRunnig=%@ showingBuddyScreen=%@ sessionIsLoginSession=%@", buf, 0x20u);
      }
      [(id)__axClient sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:10000 targetAccessQueue:0 completion:0];
    }
    else
    {
      [a1 removeVoiceOverInfoPanel:0.5];
      if ((v6 & 1) == 0)
      {
        CanShowAXInfoPanel = 0;
        id v13 = [MEMORY[0x263F08A00] defaultCenter];
        [v13 removeObserver:a1 name:*MEMORY[0x263F1CF90] object:0];
      }
    }
  }
  else if (__axClient)
  {
    [a1 removeVoiceOverInfoPanel:0.5];
  }
}

+ (void)handleOrientationChange
{
  UIAccessibilityPostNotification(0x3F3u, 0);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  v2 = [MEMORY[0x263F089F8] notificationWithName:@"SBAXStatusBarOrientationChange" object:0];
  [v3 postNotification:v2];
}

+ (int)applicationOrientation
{
  uint64_t v2 = [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
  if ((unint64_t)(v2 - 1) >= 4) {
    LODWORD(v2) = 0;
  }
  return v2;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_frontBoardCategoriesDidInstall, (CFStringRef)*MEMORY[0x263F21468], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v4 = [MEMORY[0x263F21400] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_976 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_985];

    uint64_t v5 = [MEMORY[0x263F21400] sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_4;
    v13[3] = &__block_descriptor_40_e29_v16__0__AXValidationManager_8l;
    v13[4] = a1;
    [v5 installSafeCategories:v13 afterDelay:@"SpringBoard Framework (Delay)" validationTargetName:@"SB" overrideProcessName:0.5];

    uint64_t v6 = [objc_allocWithZone((Class)a1) init];
    uint64_t v7 = (void *)_Failover;
    _Failover = v6;

    uint64_t v8 = [MEMORY[0x263F21388] sharedInstance];
    [v8 addHandler:&__block_literal_global_1368 forBundleName:@"NowPlayingArtLockScreen.lockbundle"];

    uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:a1 selector:sel_toggleVoiceOverInfoPanel name:*MEMORY[0x263F1CF90] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_appTransitionOccurred, @"com.apple.mobile.SubstantialTransition", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    BOOL v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, 0, (CFNotificationCallback)_StackshotTaken, (CFStringRef)*MEMORY[0x263F298D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (_AXSFullKeyboardAccessEnabled())
    {
      v12 = [MEMORY[0x263F1C920] mainScreen];
      [v12 setNeedsFocusUpdate];
    }
  }
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SBAlertItemWindow"];
  [v2 validateClass:@"SBMainWorkspace"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainWorkspace", @"_instanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"transientOverlayPresentationManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTransientOverlayPresentationManager", @"topmostPresentedViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAmbientPresentationController", @"isPresented", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"ambientPresentationController", "@", 0);
  [v2 validateClass:@"SBInCallTransientOverlayViewController"];
  [v2 validateClass:@"SBSpotlightTransientOverlayViewController"];
  [v2 validateClass:@"SBRemoteTransientOverlayViewController"];
  [v2 validateClass:@"SBRemoteTransientOverlayHostContentAdapter" hasInstanceVariable:@"_hostRemoteViewController" withType:"SBRemoteTransientOverlayHostViewController"];
  [v2 validateClass:@"SBRemoteTransientOverlayHostViewController" isKindOfClass:@"_UIRemoteViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"overlayLibraryViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"isTodayOverlayPresented", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"coverSheetTodayViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"isModalAppLibrarySupported", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"modalLibraryController", "@", 0);
  [v2 validateClass:@"SBModalLibraryController" hasProperty:@"libraryViewController" withType:"@"];
  [v2 validateClass:@"SBTransientOverlayWindow"];
  [v2 validateClass:@"SBAppSwitcherModel"];
  [v2 validateClass:@"SBHCalendarApplicationIcon"];
  [v2 validateClass:@"SBConferenceManager"];
  [v2 validateClass:@"SBFolder"];
  [v2 validateClass:@"SBFolderIcon"];
  [v2 validateClass:@"SBHUDController"];
  [v2 validateClass:@"SBIcon"];
  [v2 validateClass:@"SBIconController"];
  [v2 validateClass:@"SBApplicationController"];
  [v2 validateClass:@"SBIconListModel"];
  [v2 validateClass:@"SBIconModel"];
  [v2 validateClass:@"SBIconScrollView"];
  [v2 validateClass:@"SBMediaController"];
  [v2 validateClass:@"SBPlatformController"];
  [v2 validateClass:@"SBScreenshotManager"];
  [v2 validateClass:@"SBTelephonyManager"];
  [v2 validateClass:@"SBUIController"];
  [v2 validateClass:@"SPDaemonQueryToken"];
  [v2 validateClass:@"SSDownload"];
  [v2 validateClass:@"SSDownloadStatus"];
  [v2 validateClass:@"SpringBoard"];
  [v2 validateClass:@"UITableViewCellAccessibilityElement"];
  [v2 validateClass:@"SBPIPContainerViewController"];
  [v2 validateClass:@"SBAlertItemWindow"];
  [v2 validateClass:@"SBAssistantController"];
  [v2 validateClass:@"SBHomeScreenController"];
  [v2 validateClass:@"SBMainSwitcherControllerCoordinator"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"windowSceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"switcherControllerForWindowScene:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneManager", @"activeDisplayWindowScene", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"switcherViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenController", @"iconManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenController", @"homeScreenOverlayController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenController", @"_currentFolderController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenController", @"_rootFolderController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"isContinuityDisplayWindowScene", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"homeScreenController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  [v2 validateClass:@"SBApplication" hasInstanceVariable:@"_appInfo" withType:"SBApplicationInfo"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationIcon", @"application", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"appLayout", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_appLayoutContainingDisplayItem:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"floatingAppLayout", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayoutAccessibility", @"_axDisplayName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinatorAccessibility", @"_axFluidSwitcherViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinatorAccessibility", @"_axIsAppSwitcherPeekingSlideOver", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinatorAccessibility", @"_axIsAppSwitcherPeekingSplitView", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isMainDisplayLibraryViewVisible", "B", 0);
  [v2 validateClass:@"SBApplicationController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  [v2 validateClass:@"SBDockSuggestionsIconListView"];
  [v2 validateClass:@"SBFloatingDockController"];
  [v2 validateClass:@"SBFloatingDockController" hasInstanceVariable:@"_viewController" withType:"SBFloatingDockRootViewController"];
  [v2 validateClass:@"SBFloatingDockRootViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockRootViewController", @"floatingDockViewController", "@", 0);
  [v2 validateClass:@"SBFloatingDockSuggestionsViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"isMedusaCapable", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockSuggestionsViewController", @"listView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_rootFolderController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_currentFolderController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"areAnyIconViewContextMenusShowing", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"rootFolder", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconDragManager", "@", 0);
  [v2 validateClass:@"SBFloatingDockSuggestionsViewController" conformsToProtocol:@"SBFloatingDockSuggestionsViewProviding"];
  [v2 validateProtocol:@"SBFloatingDockSuggestionsViewProviding" hasRequiredInstanceMethod:@"floatingDockViewController"];
  [v2 validateClass:@"SBLayoutState"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"elementWithRole:", "@", "q", 0);
  [v2 validateClass:@"SBLayoutElement"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutElement", @"layoutAttributes", "Q", 0);
  [v2 validateClass:@"SBMainDisplayLayoutState"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"spaceConfiguration", "q", 0);
  [v2 validateClass:@"SBPlatformController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPlatformController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPlatformController", @"medusaCapabilities", "q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBLockScreenManager", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"isVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBBluetoothController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBConferenceManager", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMediaController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBModelessSyncController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPlatformController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBTelephonyManager", @"sharedTelephonyManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBTelephonyManager", @"sharedTelephonyManagerCreatingIfNecessary:", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBUIController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"setupApplication", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"processState", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationProcessState", @"visibility", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationProcessState", @"taskState", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BBBulletin", @"sectionID", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BBBulletin", @"unlockActionLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAlertItemsController", @"activateAlertItem:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAlertItemsController", @"deactivateAlertItem:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBluetoothController", @"batteryLevel", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"allIcons", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"displayName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isFolderIcon", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"_cancelCloseFolderTimer", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"_closeFolderTimerFired", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"model", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"_setCloseFolderTimerIfNecessary", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"icons", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"isPlaying", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMediaController", @"togglePlayPauseForEventSource:", "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBModelessSyncController", @"isSyncing", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPlatformController", @"isInternalInstall", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"incomingCallExists", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"outgoingCallExists", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"batteryCapacity", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"batteryCapacityAsPercentage", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAssistantController", @"currentSession", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAssistantSession", @"presentationContext", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAssistantSessionPresentationContext", @"modality", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"headsetBatteryCapacity", "C", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIController", @"updateBatteryState:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownload", @"metadata", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownload", @"status", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadMetadata", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isFailed", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isPausable", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isPaused", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityDeactivationAnimationWillBegin", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityTopDisplay", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"activeInterfaceOrientation", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"isLocked", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibilityElement", @"accessibilityScrollToVisibleWithChild:", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_updateToInterfaceOrientation: duration: force:", "v", "q", "d", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isUILocked", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"_setUILocked:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppToAppWorkspaceTransaction", @"_setupAnimation", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeleteNonAppIconAlertItem", @"configure: requirePasscodeForActions:", "v", "B", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"model", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconModel", @"applicationIconForBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconModel", @"isIconVisible:", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_takeScreenshotAndEdit:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"turnOnScreenFullyWithBacklightSource:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_updateRingerState:reason:", "v", "i", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"setBacklightState:source:animated:completion:", "v", "q", "q", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_legacy_noteInterfaceOrientationChanged: duration: updateMirroredDisplays: force: logMessage:", "v", "q", "d", "B", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownload", @"metadata", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenViewControllerBase", @"setInScreenOffMode:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"badgeNumberOrString", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewWithKeypad", @"resetForFailedPasscode", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BBBulletin", @"bulletinID", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_accessibilityHitTestSubviews", "@", 0);
  [v2 validateClass:@"SBApplicationIcon" isKindOfClass:@"SBIcon"];
  [v2 validateClass:@"SBBookmarkIcon" isKindOfClass:@"SBIcon"];
  [v2 validateClass:@"SBFolderIcon" isKindOfClass:@"SBIcon"];
  [v2 validateClass:@"SBApplication" hasInstanceVariable:@"_bundleIdentifier" withType:"NSString"];
  [v2 validateClass:@"SBLockScreenManager" hasInstanceVariable:@"_lockScreenEnvironment" withType:"<SBLockScreenEnvironment>"];
  [v2 validateProtocol:@"SBLockScreenEnvironment" hasRequiredInstanceMethod:@"rootViewController"];
  [v2 validateProtocol:@"SBLockScreenEnvironment" hasRequiredInstanceMethod:@"callController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"badgeNumberOrString", "@", 0);
  [v2 validateClass:@"SBIconController" hasInstanceVariable:@"_iconModel" withType:"SBIconModel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_currentFolderController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"iconListViews", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"currentPageIndex", "q", 0);
  [v2 validateClass:@"SBFolderView" hasInstanceVariable:@"_scrollView" withType:"SBIconScrollView"];
  [v2 validateClass:@"SBFolderIcon" hasInstanceVariable:@"_folder" withType:"SBFolder"];
  [v2 validateClass:@"SBFolderController" hasInstanceVariable:@"_closeFolderTimer" withType:"NSTimer"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIScreenEdgePanRecognizerEdgeSettings", @"hysteresis", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIScreenEdgePanRecognizerEdgeSettings", @"edgeRegionSize", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPanGestureRecognizer", @"_removeHysteresisFromTranslation", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITouch", @"_edgeType", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITouch", @"_edgeAim", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPanGestureRecognizer", @"setFailsPastMaxTouches:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"floatingDockController", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBLockScreenManager", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isUILocked", "B", 0);
  [v2 validateClass:@"SBAssistantController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBAssistantController", @"isVisible", "B", 0);
  [v2 validateProtocol:@"SBHTodayViewControlling" hasRequiredInstanceMethod:@"listView"];
  [v2 validateClass:@"NCNotificationListHeaderTitleView"];
  [v2 validateClass:@"SBCoverSheetWindow"];
  [v2 validateClass:@"SBPIPController"];
  [v2 validateClass:@"SBMainScreenActiveInterfaceOrientationWindow"];
  [v2 validateClass:@"SBHomeScreenWindow"];
  [v2 validateClass:@"SBVoiceControlViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"disconnectCallAndActivateHeld", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"disconnectIncomingCall", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTelephonyManager", @"updateSpringBoard", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityObjectWithinProximity", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"sensorActivityDataProvider", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSensorActivityAttribution", @"sensor", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_activeDisplaySwitcherController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentLayoutState", "@", 0);
  [v2 validateClass:@"SBWindowSceneStatusBarManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneStatusBarManager", @"statusBar", "@", 0);

  return 1;
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SpringBoard Framework AX"];
  [v2 setOverrideProcessName:@"SpringBoardFramework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SBWorkspaceAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIAlertViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAlertItemsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDeleteNonAppIconAlertItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISegmentedControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBBookmarkIconAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUITableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMainSwitcherControllerCoordinatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBControlCenterWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBTelephonyManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBHUDControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBBacklightControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBElasticHUDViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDisplayBrightnessControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUITableViewCellAccessibilityElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBScreenshotManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppToAppWorkspaceTransactionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBLockScreenManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppSwitcherPageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBWallpaperControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBElasticSliderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIAnimationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBControlCenterControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAssistantControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDashBoardSetupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBIdleTimerPolicyAggregatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBProximitySensorManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBIconControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDashBoardLockScreenEnvironmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppLayoutAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherTitledButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDisplayItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherItemContainerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherShelfViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDragAndDropWorkspaceTransactionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPowerDownViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBRestartManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBLogoutProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPasscodeEntryTransientOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBRootSceneWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherAppSuggestionBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherAppSuggestionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMainScreenActiveInterfaceOrientationWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPIPContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPIPControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPictureInPictureWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBCommandTabViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBCommandTabControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BBBulletinAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIViewControllerWrapperViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUITextEffectsRemoteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMainSwitcherWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAssistantWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBHomeScreenWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBCoverSheetWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFloatingDockControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDashBoardSetupViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBHomeGrabberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBCoverSheetPresentationManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBMoveGestureFloatingSwitcherModifierAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIRemoteKeyboardWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAlertItemWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBNotificationBannerDestinationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSeparatorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSlideOverTongueViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppSwitcherScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBKeyboardFocusCoordinatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBRemoteTransientOverlayHostViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBTransientOverlayWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBIsolatedSceneOrientationFollowingWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSyncControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFloatingDockWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFluidSwitcherTouchPassThroughScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBNCSoundControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBHomeScreenOverlayControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBHomeScreenOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBRecordingIndicatorViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDeviceApplicationSceneViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppClipOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDeviceApplicationSceneClassicAccessoryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBTopAffordanceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBInCallPresentationSessionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherShelfViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBTopAffordanceDotsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBCursiveTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SBWallpaperSecureWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBWindowSceneAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemApertureWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemApertureStatusBarPillElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SBSystemApertureIndicatorContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBDynamicFlashlightActivityElementViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBRingerAlertElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPowerAlertElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFlashlightActivityElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemActionSimpleAccessibilityPreviewElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemApertureViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBContinuousExposeWindowDragSwitcherModifierAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBAppResizeGrabberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemApertureTelemetryEmitterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBStatusBarWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBBannerWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBActivityAmbientViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemActionCoachingHUDViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSystemActionCoachingControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSwitcherControllerAccessibility" canInteractWithTargetClass:1];
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"SBApplicationAccessibility" canInteractWithTargetClass:1];
  CanShowAXInfoPanel = 1;
  uint64_t result = AXProcessIsSpringBoard();
  if (result) {
    return AXPerformBlockOnMainThreadAfterDelay();
  }
  return result;
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isBuddyRunning];
  int v3 = [*(id *)(a1 + 32) _showingBuddyLockScreen];
  if ((v2 & 1) != 0 || v3) {
    _AXSForcePreferenceUpdate();
  }
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleVoiceOverInfoPanel];
}

void __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_7()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 installSafeCategories:&__block_literal_global_1370 afterDelay:@"NowPlayingLockScreen" validationTargetName:@"NowPlayingLockScreen" overrideProcessName:0.5];
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"_NowPlayingArtViewAccessibility" canInteractWithTargetClass:1];
}

+ (id)sharedInstance
{
  return (id)_Failover;
}

- (BOOL)isDimmed
{
  char v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isSystemSleeping];

  return v3;
}

- (BOOL)isUILocked
{
  Class v2 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    Class v2 = NSClassFromString(&cfstr_Sblockscreenma.isa);
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v2;
  }
  char v3 = [(objc_class *)v2 safeValueForKey:@"sharedInstanceIfExists"];
  char v4 = [v3 safeBoolForKey:@"isUILocked"];

  return v4;
}

- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3
{
}

- (BOOL)_accessibilityAllowShowNotificationGestureOverride
{
  return [(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"AXSBAllowShowNotificationGesture"];
}

- (int)lastLockSource
{
  Class v2 = AXSpringBoardFrameworkGlueSBLockScreenControllerInstance();
  int v3 = [v2 safeIntForKey:@"_axLastLockSource"];

  return v3;
}

- (BOOL)_axIsAppLibraryOrTodayViewPresent
{
  int v3 = AXSBHIconManagerFromSharedIconController();
  if ([v3 safeBoolForKey:@"isMainDisplayLibraryViewVisible"])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = AXSBIconControllerSharedInstance();
    BOOL v4 = ([v5 safeBoolForKey:@"isTodayOverlayPresented"] & 1) != 0
      || [(AXSpringBoardGlue *)self _axIsCoverSheetTodayViewControllerPresent];
  }
  return v4;
}

- (BOOL)_axIsCoverSheetTodayViewControllerPresent
{
  Class v2 = AXSBIconControllerSharedInstance();
  int v3 = [v2 safeValueForKey:@"coverSheetTodayViewController"];

  BOOL v4 = [v3 _appearState] == 2 || objc_msgSend(v3, "_appearState") == 1;
  return v4;
}

@end