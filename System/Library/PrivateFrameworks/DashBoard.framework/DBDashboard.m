@interface DBDashboard
+ (id)_stateChangeApplications;
- (BOOL)_isStatusBarScene:(id)a3;
- (BOOL)_supportsDisplayingPunchthroughWithIdentifier:(id)a3;
- (BOOL)handleACHomeUp:(unint64_t)a3;
- (BOOL)hasActiveCall;
- (BOOL)isScreenAvailable;
- (BOOL)pendingInCallServiceActivation;
- (BOOL)shouldDisableFiveRowKeyboards;
- (BOOL)showingApp;
- (BSInvalidatable)oemScreenLayoutElementAssertion;
- (BSInvalidatable)preventPasscodeLockToken;
- (BSInvalidatable)preventSpuriousScreenUndimToken;
- (BSInvalidatable)punchThroughServiceDomainActivationToken;
- (BSInvalidatable)serviceDomainActivationToken;
- (BSInvalidatable)volumeNotificationServiceDomainActivationToken;
- (CAFCameraGeneral)camera;
- (CARDisplayInfo)displayInfo;
- (CGRect)_rectForFocusedRectDictionary:(id)a3;
- (CGRect)sceneFrameForApplication:(id)a3;
- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4;
- (CRSIconLayoutVehicleDataProviding)iconLayoutDataProvider;
- (CRSUIPunchThroughService)punchThroughService;
- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion;
- (CRSUIStatusBarStyleService)statusBarStyleService;
- (CRSUIVolumeNotificationService)volumeNotificationService;
- (DBAudioNotificationManager)audioNotificationManager;
- (DBAudioWindow)audioWindow;
- (DBCameraWindow)cameraWindow;
- (DBClimateWindow)climateWindow;
- (DBDashboard)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBDashboardRootViewController)rootViewController;
- (DBDashboardStateProvider)dashboardStateProvider;
- (DBDashboardWorkspaceOwner)workspaceOwner;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBFocusController)focusController;
- (DBFocusMovementManager)focusMovementManager;
- (DBLockOutController)lockOutController;
- (DBNotificationViewController)notificationViewController;
- (DBNotificationWindow)notificationWindow;
- (DBNowPlayingObserver)nowPlayingObserver;
- (DBRootStatusBarViewController)driverStatusBarViewController;
- (DBRootStatusBarViewController)passengerStatusBarViewController;
- (DBScreenshotManager)screenshotManager;
- (DBSiriViewController)siriViewController;
- (DBSplashScreenAlert)splashScreenAlert;
- (DBStatusBarHomeButtonStateManager)homeButtonStateManager;
- (DBStatusBarHostWindow)statusBarHostWindow;
- (DBStatusBarStateProvider)statusBarStateProvider;
- (DBStatusBarWindow)driverStatusBarWindow;
- (DBStatusBarWindow)passengerStatusBarWindow;
- (DBUserAlertServer)userAlertServer;
- (DBWorkspace)workspace;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (NSDictionary)settingsCategoryToBundleID;
- (NSMutableDictionary)identifierToAppScenesMap;
- (NSMutableDictionary)identifierToApplicationMap;
- (NSMutableDictionary)identifierToForegroundAppScenesMap;
- (NSString)activeBundleIdentifier;
- (RBSProcessMonitor)templateAppProcessMonitor;
- (SiriActivityAssertion)siriButtonAssertion;
- (SiriAssertion)siriPrewarmAssertion;
- (SiriDirectActionSource)siriDirectActionSource;
- (SiriLongPressButtonSource)siriButtonSource;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4;
- (UIEdgeInsets)statusBarInsets;
- (UIScreen)screen;
- (UIView)cornerRadiusView;
- (UIView)interestingView;
- (UIViewController)alertViewController;
- (UIWindow)cornerRadiusWindow;
- (UIWindow)interestingWindow;
- (UIWindow)mainWindow;
- (UIWindow)resizeWindow;
- (UIWindow)voiceControlWindow;
- (UIWindowScene)windowScene;
- (_TtC9DashBoard15DBCAFCarManager)carManager;
- (_TtC9DashBoard17DBWallpaperWindow)wallpaperWindow;
- (_TtC9DashBoard21DBWallpaperHostWindow)wallpaperHostWindow;
- (_TtC9DashBoard22DBCameraViewController)cameraViewController;
- (_TtC9DashBoard23DBClimateViewController)climateViewController;
- (_TtC9DashBoard28DBVoiceControlViewController)voiceControlViewController;
- (_TtC9DashBoard29DBWallpaperRootViewController)wallpaperRootViewController;
- (_TtC9DashBoard33DBAudioNotificationViewController)audioViewController;
- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)uisyncSessionCommandHandler;
- (double)currentCornerRadius;
- (double)siriPrewarmTimestamp;
- (id)_activeBundleIdentifierForScene:(id)a3;
- (id)_applicationSceneForBundleID:(id)a3;
- (id)_dashboardScene;
- (id)_foregroundActiveScene;
- (id)_newResizeAnimationWindow;
- (id)_nowRecordingBundleIdentifier;
- (id)_takeSnapshotOfFrame:(CGRect)a3;
- (id)activeCallScreenBorrowToken;
- (id)applicationForScene:(id)a3;
- (id)focusWindow;
- (id)sceneForApplication:(id)a3;
- (id)sceneIdentifierForApplication:(id)a3;
- (id)systemGestureWindow;
- (id)wallpaperViewForLockOutController:(id)a3;
- (int)connectedNotifyToken;
- (int64_t)_sceneInterfaceStyleForScene:(id)a3;
- (int64_t)sceneInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4;
- (int64_t)sceneMapInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4;
- (void)_animateStartupFromScaledMainWindow;
- (void)_animateStartupToHomeScreen;
- (void)_animateStartupToIcons;
- (void)_backLongPressed:(id)a3;
- (void)_collectMemgraphsForTapToRadarWithCompletion:(id)a3;
- (void)_createBackgroundSceneForTemplateAppBundleID:(id)a3;
- (void)_dismissFloatingSiriIfNecessary;
- (void)_dismissPunchthroughWithIdentifier:(id)a3;
- (void)_displayRecordingAlert;
- (void)_drawCorners;
- (void)_handleAppSchemeURL:(id)a3 activationSettings:(id)a4;
- (void)_handleAutoSettingsURL:(id)a3;
- (void)_handleBackgroundURLDeliveryForLaunchInfo:(id)a3;
- (void)_handleCarPlayUIReady;
- (void)_handleHomeEvent:(id)a3;
- (void)_handleInputStreamURL:(id)a3;
- (void)_handleInterruptPunchthroughEvent:(id)a3;
- (void)_handleOEMNotificationURL:(id)a3;
- (void)_handleOpenApplicationEvent:(id)a3;
- (void)_handleReturnToHomeScreenEvent:(id)a3;
- (void)_handleSessionURL:(id)a3;
- (void)_handleSiriButtonDownWithTimestamp:(double)a3;
- (void)_handleSiriButtonUpWithTimestamp:(double)a3;
- (void)_handleSiriPrewarmWithTimestamp:(double)a3;
- (void)_handleTapToRadarEvent;
- (void)_homeTapped:(id)a3;
- (void)_initializeWallpaper;
- (void)_launchAppWithInfo:(id)a3 forURL:(id)a4;
- (void)_notifyAccessoryIfNeededWithUIContext:(id)a3;
- (void)_notifyClimateWindowIsPunchthroughPresented:(BOOL)a3;
- (void)_presentPrivacyDisclosureAlertForApplication:(id)a3;
- (void)_presentPunchthroughWithIdentifier:(id)a3;
- (void)_screenDidBecomeAvailable:(id)a3;
- (void)_screenDidBecomeUnavailable:(id)a3;
- (void)_setInitialFocusOwner;
- (void)_setupClassicStatusBarWithScene:(id)a3;
- (void)_setupClimateOverlayIfNeeded;
- (void)_setupDualStatusBarWithScene:(id)a3;
- (void)_setupStatusBar;
- (void)_setupVoiceControlWindow;
- (void)_showBackupCameraApp;
- (void)_templateAppStateUpdated:(id)a3;
- (void)_updateAppScenesViewArea;
- (void)_updateAudioNotificationBlocker;
- (void)_updateCameraObserverForCar:(id)a3;
- (void)_updateDeferrals;
- (void)_updateMaskedCornersForStatusBarWindows;
- (void)_updatePasscodeLockToken;
- (void)_updateUserInterfaceStyle;
- (void)_updateWallpaper;
- (void)_updateWallpaperWithAnimationDuration:(double)a3 delay:(double)a4;
- (void)_updateWindowFrames;
- (void)alertServer:(id)a3 wantsAppDismissalForAlert:(id)a4 bundleID:(id)a5;
- (void)alertServer:(id)a3 wantsAppPresentationForAlert:(id)a4 bundleID:(id)a5;
- (void)alertServer:(id)a3 wantsSystemDismissalForViewController:(id)a4;
- (void)alertServer:(id)a3 wantsSystemPresentationForViewController:(id)a4;
- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6;
- (void)cameraGeneralService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)carManager:(id)a3 didUpdateAccessories:(id)a4;
- (void)carManager:(id)a3 didUpdateCar:(id)a4;
- (void)dealloc;
- (void)didDismissPresentable:(id)a3 forNotificationViewController:(id)a4;
- (void)environmentConfiguration:(double)a3 viewAreaDidChangeFromViewAreaFrame:(double)a4 safeAreaInsets:(double)a5 toViewAreaFrame:(double)a6 safeAreaInsets:(double)a7 duration:(double)a8 transitionControlType:(double)a9;
- (void)environmentConfiguration:(id)a3 appearanceStyleDidChange:(int64_t)a4;
- (void)environmentConfiguration:(id)a3 mapsAppearanceStyleDidChange:(int64_t)a4;
- (void)environmentConfiguration:(id)a3 nightModeDidChange:(BOOL)a4;
- (void)goToPageContainingBundleIdentifier:(id)a3 completion:(id)a4;
- (void)handleConnect;
- (void)handleEvent:(id)a3;
- (void)handleFocusMovementAction:(id)a3 fromScene:(id)a4;
- (void)handleLongBackPress;
- (void)inCallAssertionService:(id)a3 didSetBannersEnabled:(BOOL)a4;
- (void)inCallAssertionServiceDidDismiss:(id)a3;
- (void)inCallAssertionServiceDidPresent:(id)a3;
- (void)invalidate;
- (void)lockOutController:(id)a3 didChangeFromLockoutMode:(int64_t)a4 toLockOutMode:(int64_t)a5 animated:(BOOL)a6 takeScreen:(BOOL)a7;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processMonitor:(id)a3 didHandleDeathOfBundleIdentifier:(id)a4;
- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5;
- (void)punchThroughService:(id)a3 dismissPunchThroughWithIdentifier:(id)a4;
- (void)punchThroughService:(id)a3 presentPunchThroughWithIdentifier:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5;
- (void)session:(id)a3 handleSiriRequestEvent:(int64_t)a4 withPayload:(id)a5;
- (void)session:(id)a3 openURL:(id)a4;
- (void)session:(id)a3 receivedUnhandledRemoteEvent:(id)a4 withPayload:(id)a5;
- (void)setActiveCallScreenBorrowToken:(id)a3;
- (void)setAlertViewController:(id)a3;
- (void)setAudioNotificationManager:(id)a3;
- (void)setAudioViewController:(id)a3;
- (void)setAudioWindow:(id)a3;
- (void)setCamera:(id)a3;
- (void)setCameraViewController:(id)a3;
- (void)setCameraWindow:(id)a3;
- (void)setCarManager:(id)a3;
- (void)setClimateViewController:(id)a3;
- (void)setClimateWindow:(id)a3;
- (void)setConnectedNotifyToken:(int)a3;
- (void)setCornerRadiusView:(id)a3;
- (void)setCornerRadiusWindow:(id)a3;
- (void)setCurrentCornerRadius:(double)a3;
- (void)setDashboardStateProvider:(id)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setDriverStatusBarViewController:(id)a3;
- (void)setDriverStatusBarWindow:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setFocusController:(id)a3;
- (void)setFocusMovementManager:(id)a3;
- (void)setHomeButtonStateManager:(id)a3;
- (void)setIdentifierToAppScenesMap:(id)a3;
- (void)setIdentifierToApplicationMap:(id)a3;
- (void)setIdentifierToForegroundAppScenesMap:(id)a3;
- (void)setInterestingView:(id)a3;
- (void)setInterestingWindow:(id)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setLockOutController:(id)a3;
- (void)setMainWindow:(id)a3;
- (void)setNotificationViewController:(id)a3;
- (void)setNotificationWindow:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setOemScreenLayoutElementAssertion:(id)a3;
- (void)setPassengerStatusBarViewController:(id)a3;
- (void)setPassengerStatusBarWindow:(id)a3;
- (void)setPendingInCallServiceActivation:(BOOL)a3;
- (void)setPreventPasscodeLockToken:(id)a3;
- (void)setPreventSpuriousScreenUndimToken:(id)a3;
- (void)setPunchThroughService:(id)a3;
- (void)setPunchThroughServiceDomainActivationToken:(id)a3;
- (void)setResizeWindow:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScreenAvailable:(BOOL)a3;
- (void)setScreenshotManager:(id)a3;
- (void)setServiceDomainActivationToken:(id)a3;
- (void)setSettingsCategoryToBundleID:(id)a3;
- (void)setShowingApp:(BOOL)a3;
- (void)setSiriButtonAssertion:(id)a3;
- (void)setSiriButtonSource:(id)a3;
- (void)setSiriDirectActionSource:(id)a3;
- (void)setSiriPrewarmAssertion:(id)a3;
- (void)setSiriPrewarmTimestamp:(double)a3;
- (void)setSiriViewController:(id)a3;
- (void)setSplashScreenAlert:(id)a3;
- (void)setStatusBarHostWindow:(id)a3;
- (void)setStatusBarStateProvider:(id)a3;
- (void)setStatusBarStyleAssertion:(id)a3;
- (void)setStatusBarStyleService:(id)a3;
- (void)setTemplateAppProcessMonitor:(id)a3;
- (void)setUisyncSessionCommandHandler:(id)a3;
- (void)setUserAlertServer:(id)a3;
- (void)setVoiceControlViewController:(id)a3;
- (void)setVoiceControlWindow:(id)a3;
- (void)setVolumeNotificationService:(id)a3;
- (void)setVolumeNotificationServiceDomainActivationToken:(id)a3;
- (void)setWallpaperHostWindow:(id)a3;
- (void)setWallpaperRootViewController:(id)a3;
- (void)setWallpaperWindow:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)setWorkspaceOwner:(id)a3;
- (void)thermalMonitorLevelDidChange:(id)a3;
- (void)volumeNotificationServiceUpdated:(id)a3;
- (void)willPresentPresentable:(id)a3 forNotificationViewController:(id)a4;
- (void)willUpdateThemeData:(id)a3 withDuration:(double)a4 delay:(double)a5;
- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
@end

@implementation DBDashboard

- (DBDashboard)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4
{
  v149[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v141.receiver = self;
  v141.super_class = (Class)DBDashboard;
  v9 = [(DBDashboard *)&v141 init];
  if (v9)
  {
    v10 = objc_alloc_init(DBSplashScreenAlert);
    splashScreenAlert = v9->_splashScreenAlert;
    v9->_splashScreenAlert = v10;

    v12 = [v8 displayConfiguration];
    objc_storeStrong((id *)&v9->_environmentConfiguration, a4);
    [(DBEnvironmentConfiguration *)v9->_environmentConfiguration addObserver:v9];
    v13 = [[DBDashboardLayoutEngine alloc] initWithEnvironmentConfiguration:v9->_environmentConfiguration];
    layoutEngine = v9->_layoutEngine;
    v9->_layoutEngine = v13;

    v15 = [(DBEnvironmentConfiguration *)v9->_environmentConfiguration session];
    [v15 addObserver:v9];
    v16 = [(DBEnvironmentConfiguration *)v9->_environmentConfiguration thermalMonitor];
    [v16 addObserver:v9];

    uint64_t v17 = [(DBEnvironmentConfiguration *)v9->_environmentConfiguration screen];
    screen = v9->_screen;
    v9->_screen = (UIScreen *)v17;

    objc_storeStrong((id *)&v9->_windowScene, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [v12 hardwareIdentifier];
    v139 = (void *)v19;
    if (v19)
    {
      v20 = (void *)MEMORY[0x263EFFA08];
      v21 = [MEMORY[0x263F29858] displayWithHardwareIdentifier:v19];
      uint64_t v22 = [v20 setWithObject:v21];

      v133 = v15;
      v132 = [MEMORY[0x263F29890] defaultSystemPredicate];
      [v132 setDisplays:v22];
      v23 = (void *)MEMORY[0x263F29848];
      v24 = [MEMORY[0x263F29850] systemTarget];
      v138 = [v23 ruleForDispatchingDiscreteEventsMatchingPredicate:v132 toTarget:v24];

      v131 = [MEMORY[0x263F29890] defaultFocusPredicate];
      uint64_t v25 = v22;
      [v131 setDisplays:v22];
      v26 = (void *)MEMORY[0x263F29848];
      v27 = [MEMORY[0x263F29850] keyboardFocusTarget];
      v137 = [v26 ruleForDispatchingDiscreteEventsMatchingPredicate:v131 toTarget:v27];

      id v28 = objc_alloc_init(MEMORY[0x263F29890]);
      v29 = (void *)MEMORY[0x263EFFA08];
      v30 = [MEMORY[0x263F29840] descriptorWithEventType:17];
      v130 = [v29 setWithObject:v30];

      [v28 setDescriptors:v130];
      v129 = v28;
      [v28 setDisplays:v22];
      v31 = (void *)MEMORY[0x263F29848];
      v32 = [MEMORY[0x263F29850] systemTarget];
      v136 = [v31 ruleForDispatchingDiscreteEventsMatchingPredicate:v28 toTarget:v32];

      id v33 = objc_alloc_init(MEMORY[0x263F29890]);
      v34 = (void *)MEMORY[0x263EFFA08];
      v35 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:548];
      v128 = [v34 setWithObject:v35];

      [v33 setDescriptors:v128];
      [v33 setDisplays:v25];
      v36 = (void *)MEMORY[0x263F29848];
      v37 = [MEMORY[0x263F29850] systemTarget];
      v135 = [v36 ruleForDispatchingDiscreteEventsMatchingPredicate:v33 toTarget:v37];

      id v38 = objc_alloc_init(MEMORY[0x263F29890]);
      v39 = (void *)MEMORY[0x263EFFA08];
      [MEMORY[0x263F29860] descriptorWithPage:12 usage:547];
      v40 = id v134 = v8;
      v127 = [v39 setWithObject:v40];

      [v38 setDescriptors:v127];
      v125 = (void *)v25;
      v126 = v38;
      [v38 setDisplays:v25];
      v41 = (void *)MEMORY[0x263F29848];
      v42 = [MEMORY[0x263F29850] systemTarget];
      v119 = [v41 ruleForDispatchingDiscreteEventsMatchingPredicate:v38 toTarget:v42];

      id v43 = objc_alloc_init(MEMORY[0x263F29890]);
      v44 = (void *)MEMORY[0x263EFFA08];
      v45 = [MEMORY[0x263F29860] descriptorWithPage:11 usage:38];
      v124 = [v44 setWithObject:v45];

      [v43 setDescriptors:v124];
      v123 = v43;
      [v43 setDisplays:v25];
      v46 = (void *)MEMORY[0x263F29848];
      v47 = [MEMORY[0x263F29850] systemTarget];
      v48 = [v46 ruleForDispatchingDiscreteEventsMatchingPredicate:v43 toTarget:v47];

      id v49 = objc_alloc_init(MEMORY[0x263F29890]);
      v50 = (void *)MEMORY[0x263EFFA08];
      v51 = [MEMORY[0x263F29860] descriptorWithPage:11 usage:46];
      v122 = [v50 setWithObject:v51];

      [v49 setDescriptors:v122];
      v121 = v49;
      [v49 setDisplays:0];
      v52 = (void *)MEMORY[0x263F29848];
      v53 = [MEMORY[0x263F29850] systemTarget];
      v120 = [v52 ruleForDispatchingDiscreteEventsMatchingPredicate:v49 toTarget:v53];

      v54 = [MEMORY[0x263F29830] sharedInstance];
      v55 = NSString;
      v56 = [v12 identity];
      v57 = [v55 stringWithFormat:@"DashBoard-%@", v56];
      v149[0] = v138;
      v149[1] = v137;
      v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:2];
      uint64_t v59 = [v54 dispatchDiscreteEventsForReason:v57 withRules:v58];
      dispatchingAssertion = v9->_dispatchingAssertion;
      v9->_dispatchingAssertion = (BSInvalidatable *)v59;

      v61 = [MEMORY[0x263F29830] sharedInstance];
      v62 = NSString;
      v63 = [v12 identity];
      v64 = [v62 stringWithFormat:@"DashBoardACSelect-%@", v63];
      v148 = v136;
      v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:1];
      uint64_t v66 = [v61 dispatchDiscreteEventsForReason:v64 withRules:v65];
      dispatchingAssertionACSelect = v9->_dispatchingAssertionACSelect;
      v9->_dispatchingAssertionACSelect = (BSInvalidatable *)v66;

      v68 = [MEMORY[0x263F29830] sharedInstance];
      v69 = NSString;
      v70 = [v12 identity];
      v71 = [v69 stringWithFormat:@"DashBoardACBack-%@", v70];
      v147 = v135;
      v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v147 count:1];
      uint64_t v73 = [v68 dispatchDiscreteEventsForReason:v71 withRules:v72];
      dispatchingAssertionACBack = v9->_dispatchingAssertionACBack;
      v9->_dispatchingAssertionACBack = (BSInvalidatable *)v73;

      v75 = [MEMORY[0x263F29830] sharedInstance];
      v76 = NSString;
      v77 = [v12 identity];
      v78 = [v76 stringWithFormat:@"DashBoardACHome-%@", v77];
      v146 = v119;
      v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v146 count:1];
      uint64_t v80 = [v75 dispatchDiscreteEventsForReason:v78 withRules:v79];
      dispatchingAssertionACHome = v9->_dispatchingAssertionACHome;
      v9->_dispatchingAssertionACHome = (BSInvalidatable *)v80;

      v82 = [MEMORY[0x263F29830] sharedInstance];
      v83 = NSString;
      v84 = [v12 identity];
      v85 = [v83 stringWithFormat:@"DashBoardTelephonyDrop-%@", v84];
      v145 = v48;
      v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v145 count:1];
      uint64_t v87 = [v82 dispatchDiscreteEventsForReason:v85 withRules:v86];
      dispatchingAssertionTelephonyDrop = v9->_dispatchingAssertionTelephonyDrop;
      v9->_dispatchingAssertionTelephonyDrop = (BSInvalidatable *)v87;

      v89 = [MEMORY[0x263F29830] sharedInstance];
      v90 = NSString;
      v91 = [v12 identity];
      v92 = [v90 stringWithFormat:@"DashBoardRinger-%@", v91];
      v144 = v120;
      v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v144 count:1];
      uint64_t v94 = [v89 dispatchDiscreteEventsForReason:v92 withRules:v93];
      dispatchingAssertionRinger = v9->_dispatchingAssertionRinger;
      v9->_dispatchingAssertionRinger = (BSInvalidatable *)v94;

      v15 = v133;
      v96 = [[DBFocusController alloc] initWithScreen:v9->_screen];
      focusController = v9->_focusController;
      v9->_focusController = v96;

      v98 = [[DBFocusMovementManager alloc] initWithEnvironmentConfiguration:v9->_environmentConfiguration];
      focusMovementManager = v9->_focusMovementManager;
      v9->_focusMovementManager = v98;

      id v8 = v134;
      v100 = v125;
    }
    else
    {
      id v140 = v12;
      id v101 = (id)BSLogAddStateCaptureBlockWithTitle();
      v102 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT)) {
        -[DBDashboard initWithWindowScene:environmentConfiguration:]();
      }

      v100 = v140;
    }

    v103 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToAppScenesMap = v9->_identifierToAppScenesMap;
    v9->_identifierToAppScenesMap = v103;

    v105 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToForegroundAppScenesMap = v9->_identifierToForegroundAppScenesMap;
    v9->_identifierToForegroundAppScenesMap = v105;

    v107 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToApplicationMap = v9->_identifierToApplicationMap;
    v9->_identifierToApplicationMap = v107;

    v9->_siriPrewarmTimestamp = -1.0;
    v109 = [v8 wallpaperPreferences];
    v110 = [v8 session];
    v111 = [v110 configuration];
    objc_msgSend(v109, "updateHasGaugeClusterScreen:", objc_msgSend(v111, "hasGaugeClusterScreen"));

    v112 = NSStringFromSettingsCategory();
    v142[0] = v112;
    v143[0] = @"com.apple.AutoSettings";
    v113 = NSStringFromSettingsCategory();
    v142[1] = v113;
    v143[1] = @"com.apple.CarRadio";
    v114 = NSStringFromSettingsCategory();
    v142[2] = v114;
    v143[2] = @"com.apple.CarRadio";
    v115 = NSStringFromSettingsCategory();
    v142[3] = v115;
    v143[3] = @"com.apple.CarClimate";
    uint64_t v116 = [NSDictionary dictionaryWithObjects:v143 forKeys:v142 count:4];
    settingsCategoryToBundleID = v9->_settingsCategoryToBundleID;
    v9->_settingsCategoryToBundleID = (NSDictionary *)v116;
  }
  return v9;
}

id __60__DBDashboard_initWithWindowScene_environmentConfiguration___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"Display Configuration";
  v2 = [*(id *)(a1 + 32) debugDescription];
  v7[1] = @"CADisplay";
  v8[0] = v2;
  v3 = [*(id *)(a1 + 32) CADisplay];
  v4 = [v3 debugDescription];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)handleConnect
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  v3 = [[DBDashboardStateProvider alloc] initWithDashboard:self];
  dashboardStateProvider = self->_dashboardStateProvider;
  self->_dashboardStateProvider = v3;

  v5 = self->_dashboardStateProvider;
  v6 = [(DBDashboard *)self environmentConfiguration];
  id v7 = [v6 analytics];
  [(DBDashboardStateProvider *)v5 addObserver:v7];

  id v8 = [(DBDashboard *)self environmentConfiguration];
  v9 = [v8 appHistory];
  v10 = [(DBDashboard *)self environmentConfiguration];
  v11 = [v10 navigationStateProvider];
  [v9 addObserver:v11];

  v12 = [(DBDashboard *)self environmentConfiguration];
  v13 = [v12 navigationStateProvider];
  v14 = [(DBDashboard *)self environmentConfiguration];
  v15 = [v14 appHistory];
  [v13 setAppHistoryAppDockProvider:v15];

  v16 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v17 = [v16 processMonitor];
  [v17 addObserver:self];

  [(DBDashboard *)self _updatePasscodeLockToken];
  v18 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v19 = [v18 session];
  v20 = [v19 configuration];
  v21 = [v20 screens];
  v211[0] = MEMORY[0x263EF8330];
  v211[1] = 3221225472;
  v211[2] = __28__DBDashboard_handleConnect__block_invoke;
  v211[3] = &unk_2649B3F28;
  v211[4] = self;
  uint64_t v22 = objc_msgSend(v21, "bs_firstObjectPassingTest:", v211);

  v23 = [(DBDashboard *)self environmentConfiguration];
  v24 = [v23 session];
  uint64_t v25 = [v24 configuration];
  v209 = (void *)v22;
  v26 = objc_msgSend(v25, "db_displayInfoForScreenInfo:", v22);

  [(DBDashboard *)self setDisplayInfo:v26];
  v27 = [(DBDashboard *)self environmentConfiguration];
  LODWORD(v24) = [v27 supportsGaugeCluster];

  int v207 = (int)v24;
  if (v24)
  {
    if ([v26 supportsDDPContent])
    {
      id v28 = [(DBDashboard *)self environmentConfiguration];
      v29 = [v28 uisyncChannel];

      if (v29)
      {
        v30 = [_TtC9DashBoard15DBUISyncSession alloc];
        v31 = [(DBDashboard *)self environmentConfiguration];
        v32 = [v31 uisyncChannel];
        id v33 = [(DBDashboard *)self environmentConfiguration];
        v34 = [v33 vehicleID];
        v35 = [v26 identifier];
        v36 = [(DBUISyncSession *)v30 initWithChannel:v32 vehicleID:v34 displayID:v35];

        v37 = [[_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler alloc] initWithUISyncSession:v36];
        [(DBDashboard *)self setUisyncSessionCommandHandler:v37];

        id v38 = [(DBDashboard *)self uisyncSessionCommandHandler];
        [(DBUISyncSession *)v36 setObserver:v38];

        v39 = [(DBDashboard *)self environmentConfiguration];
        [v39 setUisyncSession:v36];
      }
    }
  }
  v210 = v26;
  id v40 = objc_alloc(MEMORY[0x263F82E88]);
  v41 = [(DBDashboard *)self layoutEngine];
  [v41 areaOfInterestWindowFrame];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = NSString;
  v51 = [(DBDashboard *)self displayConfiguration];
  v52 = [v51 identity];
  v53 = [v50 stringWithFormat:@"interestingWindow-%@", v52];
  v54 = (UIWindow *)objc_msgSend(v40, "_initWithFrame:debugName:windowScene:", v53, self->_windowScene, v43, v45, v47, v49);
  interestingWindow = self->_interestingWindow;
  self->_interestingWindow = v54;

  double v56 = *MEMORY[0x263F83C58];
  [(UIWindow *)self->_interestingWindow setWindowLevel:*MEMORY[0x263F83C58] + -2.0];
  [(UIWindow *)self->_interestingWindow setHidden:0];
  v57 = self->_interestingWindow;
  v58 = [MEMORY[0x263F825C8] clearColor];
  [(UIWindow *)v57 setBackgroundColor:v58];

  id v59 = objc_alloc_init(MEMORY[0x263F82E00]);
  v60 = [MEMORY[0x263F825C8] blackColor];
  [v59 setBackgroundColor:v60];

  v61 = [(DBDashboard *)self layoutEngine];
  [v61 areaOfInterestFrameForApplication:0];
  objc_msgSend(v59, "setFrame:");

  v62 = [v59 layer];
  [v62 setDefinesDisplayRegionOfInterest:1];

  [(UIWindow *)self->_interestingWindow addSubview:v59];
  v208 = v59;
  objc_storeStrong((id *)&self->_interestingView, v59);
  id v63 = objc_alloc(MEMORY[0x263F82E88]);
  v64 = [(DBDashboard *)self layoutEngine];
  [v64 mainWindowFrame];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  uint64_t v73 = NSString;
  v74 = [(DBDashboard *)self displayConfiguration];
  v75 = [v74 identity];
  v76 = [v73 stringWithFormat:@"starkRoot-%@", v75];
  v77 = (UIWindow *)objc_msgSend(v63, "_initWithFrame:debugName:windowScene:", v76, self->_windowScene, v66, v68, v70, v72);
  mainWindow = self->_mainWindow;
  self->_mainWindow = v77;

  v79 = DBLogForCategory(0);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v80 = self->_mainWindow;
    *(_DWORD *)buf = 138412290;
    v213 = v80;
    _os_log_impl(&dword_22D6F0000, v79, OS_LOG_TYPE_DEFAULT, "Creating new main window: %@", buf, 0xCu);
  }

  [(UIWindow *)self->_mainWindow setWindowLevel:v56];
  v81 = [DBDashboardRootViewController alloc];
  v82 = [(DBDashboard *)self layoutEngine];
  v83 = [(DBDashboardRootViewController *)v81 initWithEnvironment:self layoutEngine:v82];

  v84 = [(DBDashboard *)self layoutEngine];
  [v84 rootViewControllerContentInsets];
  -[DBDashboardRootViewController setAdditionalSafeAreaInsets:](v83, "setAdditionalSafeAreaInsets:");

  [(UIWindow *)self->_mainWindow setRootViewController:v83];
  objc_storeStrong((id *)&self->_rootViewController, v83);
  [(UIWindow *)self->_mainWindow setHidden:0];
  v85 = [[DBSiriViewController alloc] initWithEnvironment:self layoutEngine:self->_layoutEngine];
  siriViewController = self->_siriViewController;
  self->_siriViewController = v85;

  uint64_t v87 = [MEMORY[0x263F6C778] longPressButtonForIdentifier:6];
  siriButtonSource = self->_siriButtonSource;
  self->_siriButtonSource = v87;

  v89 = (SiriDirectActionSource *)objc_alloc_init(MEMORY[0x263F6C768]);
  siriDirectActionSource = self->_siriDirectActionSource;
  self->_siriDirectActionSource = v89;

  self->_currentCornerRadius = 13.0;
  v91 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v91 addObserver:self forKeyPath:@"CARCornerRadius" options:1 context:0];
  v92 = [v91 objectForKey:@"CARCornerRadius"];

  if (v92)
  {
    [v91 floatForKey:@"CARCornerRadius"];
    self->_currentCornerRadius = v93;
  }
  uint64_t v94 = [(DBDashboard *)self environmentConfiguration];
  int v95 = [v94 currentViewAreaSupportsUIOutsideSafeArea];

  if (v95) {
    [(DBDashboardRootViewController *)self->_rootViewController setContentCornerRadius:self->_currentCornerRadius];
  }
  v206 = v91;
  v96 = [(UIWindow *)self->_mainWindow layer];
  [v96 setCornerCurve:*MEMORY[0x263F15A20]];

  [(UIWindow *)self->_mainWindow setClipsToBounds:1];
  [(DBDashboard *)self _initializeWallpaper];
  v97 = [(DBDashboard *)self environmentConfiguration];
  v98 = [v97 themeController];
  [v98 addObserver:self];

  v205 = objc_alloc_init(DBDashboardWorkspaceStateResolver);
  v99 = [[DBDashboardWorkspaceOwner alloc] initWithStateResolver:v205 environment:self rootViewController:v83 siriViewController:self->_siriViewController];
  workspaceOwner = self->_workspaceOwner;
  self->_workspaceOwner = v99;

  id v101 = [[DBWorkspace alloc] initWithOwner:self->_workspaceOwner];
  workspace = self->_workspace;
  self->_workspace = v101;

  [(DBDashboardWorkspaceOwner *)self->_workspaceOwner setWorkspace:self->_workspace];
  v103 = self->_workspace;
  v104 = [(DBDashboard *)self environmentConfiguration];
  v105 = [v104 appHistory];
  [(DBWorkspace *)v103 addObserver:v105];

  [(DBWorkspace *)self->_workspace addObserver:self];
  [(DBDashboard *)self _setupStatusBar];
  [(CRSUIStatusBarStyleService *)self->_statusBarStyleService addObserver:self->_rootViewController];
  v106 = self->_siriViewController;
  v107 = [(DBRootStatusBarViewController *)self->_driverStatusBarViewController appDockViewController];
  [(DBSiriViewController *)v106 setIntentUsageDelegate:v107];

  v108 = [[DBStatusBarHomeButtonStateManager alloc] initWithDelegate:self->_driverStatusBarViewController];
  homeButtonStateManager = self->_homeButtonStateManager;
  self->_homeButtonStateManager = v108;

  v110 = [(DBDashboardRootViewController *)v83 homeViewController];
  [v110 addPageChangeObserver:self->_homeButtonStateManager];

  [(DBDashboardRootViewController *)v83 addViewStateObserver:self->_homeButtonStateManager];
  v111 = [(DBDashboardRootViewController *)v83 homeViewController];
  [v111 addPageChangeObserver:self->_dashboardStateProvider];

  v112 = [(DBRootStatusBarViewController *)self->_driverStatusBarViewController appDockViewController];
  [(DBDashboardRootViewController *)v83 setAppDockViewController:v112];

  v113 = [[DBLockOutController alloc] initWithWindowScene:self->_windowScene environmentConfiguration:self->_environmentConfiguration dashboardStateProvider:self->_dashboardStateProvider delegate:self];
  lockOutController = self->_lockOutController;
  self->_lockOutController = v113;

  v115 = self->_lockOutController;
  uint64_t v116 = [(DBDashboard *)self uisyncSessionCommandHandler];
  [v116 setCommandObserver:v115];

  v117 = [DBNotificationWindow alloc];
  v118 = [(DBDashboard *)self layoutEngine];
  [v118 notificationWindowFrame];
  double v120 = v119;
  double v122 = v121;
  double v124 = v123;
  double v126 = v125;
  v127 = NSString;
  v128 = [(DBDashboard *)self displayConfiguration];
  v129 = [v128 identity];
  v130 = [v127 stringWithFormat:@"notifications-%@", v129];
  v131 = (DBNotificationWindow *)-[DBNotificationWindow _initWithFrame:debugName:windowScene:](v117, "_initWithFrame:debugName:windowScene:", v130, self->_windowScene, v120, v122, v124, v126);
  notificationWindow = self->_notificationWindow;
  self->_notificationWindow = v131;

  [(DBNotificationWindow *)self->_notificationWindow setLevel:v56 + 7.0];
  if (_os_feature_enabled_impl()) {
    [(DBDashboard *)self _setupVoiceControlWindow];
  }
  v133 = [DBNotificationViewController alloc];
  id v134 = [(id)DBApp carManager];
  v135 = [(DBDashboard *)self displayInfo];
  v136 = [v135 identifier];
  v137 = [(DBNotificationViewController *)v133 initWithEnvironment:self carManager:v134 displayID:v136 delegate:self];
  notificationViewController = self->_notificationViewController;
  self->_notificationViewController = v137;

  [(DBNotificationWindow *)self->_notificationWindow setRootViewController:self->_notificationViewController];
  [(DBDashboardWorkspaceOwner *)self->_workspaceOwner setNotificationSuspender:self->_notificationViewController];
  [(DBDashboard *)self _setInitialFocusOwner];
  v139 = [(DBDashboard *)self environmentConfiguration];
  id v140 = [v139 session];

  objc_super v141 = [(DBDashboard *)self environmentConfiguration];
  v142 = [v141 appHistory];
  v143 = [(DBDashboard *)self environmentConfiguration];
  [v142 _sessionDidConnect:v140 environmentConfiguration:v143];

  v144 = [DBNowPlayingObserver alloc];
  v145 = [(DBDashboard *)self environmentConfiguration];
  v146 = [(DBNowPlayingObserver *)v144 initWithEnvironmentConfiguration:v145];
  nowPlayingObserver = self->_nowPlayingObserver;
  self->_nowPlayingObserver = v146;

  [(DBNotificationWindow *)self->_notificationWindow setHidden:0];
  v148 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__homeTapped_];
  [v148 setAllowedPressTypes:&unk_26E17EE40];
  v149 = [MEMORY[0x263F83118] sharedInstance];
  v150 = [(DBDashboard *)self displayConfiguration];
  v151 = [v150 identity];
  v204 = v148;
  [v149 addGestureRecognizer:v148 toDisplayWithIdentity:v151];

  v152 = [[_DBLongPressGestureRecognizer alloc] initWithTarget:self action:sel__backLongPressed_];
  [(_DBLongPressGestureRecognizer *)v152 setAllowedPressTypes:&unk_26E17EE58];
  v153 = [MEMORY[0x263F83118] sharedInstance];
  v154 = [(DBDashboard *)self displayConfiguration];
  v155 = [v154 identity];
  [v153 addGestureRecognizer:v152 toDisplayWithIdentity:v155];

  v156 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__pointerSelectionPressed_];
  [v156 setAllowedPressTypes:&unk_26E17EE70];
  v157 = [MEMORY[0x263F83118] sharedInstance];
  v158 = [(DBDashboard *)self displayConfiguration];
  v159 = [v158 identity];
  [v157 addGestureRecognizer:v156 toDisplayWithIdentity:v159];

  v160 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__acBackPressed_];
  [v160 setAllowedPressTypes:&unk_26E17EE88];
  v161 = [MEMORY[0x263F83118] sharedInstance];
  v162 = [(DBDashboard *)self displayConfiguration];
  v163 = [v162 identity];
  [v161 addGestureRecognizer:v160 toDisplayWithIdentity:v163];

  v164 = [[_DBCornerRadiusWindow alloc] initWithWindowScene:self->_windowScene];
  v165 = [(DBDashboard *)self layoutEngine];
  [v165 cornerRadiusWindowFrame];
  -[_DBCornerRadiusWindow setFrame:](v164, "setFrame:");

  [(_DBCornerRadiusWindow *)v164 setWindowLevel:v56 + 12.0];
  [(_DBCornerRadiusWindow *)v164 setHidden:0];
  [(_DBCornerRadiusWindow *)v164 setUserInteractionEnabled:0];
  [(DBDashboard *)self setCornerRadiusWindow:v164];
  [(DBDashboard *)self _drawCorners];
  v166 = [MEMORY[0x263F312E8] sharedInstance];
  [v166 addObserver:self notifyIfNeeded:1];

  v167 = [DBUserAlertServer alloc];
  [(DBDashboard *)self statusBarInsets];
  double v169 = v168;
  double v171 = v170;
  double v173 = v172;
  double v175 = v174;
  v176 = [(DBDashboard *)self environmentConfiguration];
  v177 = -[DBUserAlertServer initWithSafeAreaInsets:environmentConfiguration:](v167, "initWithSafeAreaInsets:environmentConfiguration:", v176, v169, v171, v173, v175);
  userAlertServer = self->_userAlertServer;
  self->_userAlertServer = v177;

  v179 = [(DBDashboard *)self userAlertServer];
  [v179 setSystemPresenter:self];

  v180 = [(DBDashboard *)self userAlertServer];
  [v180 setAppPresenter:self];

  v181 = [(DBDashboard *)self userAlertServer];
  v182 = [(DBDashboard *)self workspaceOwner];
  [v182 setUserAlertServer:v181];

  if (v207 && [v210 supportsDDPContent])
  {
    v183 = (CRSUIPunchThroughService *)[objc_alloc(MEMORY[0x263F31568]) initWithDelegate:self];
    punchThroughService = self->_punchThroughService;
    self->_punchThroughService = v183;

    v185 = [MEMORY[0x263F2BA00] activateManualDomain:@"com.apple.CarPlay.PunchThrough"];
    punchThroughServiceDomainActivationToken = self->_punchThroughServiceDomainActivationToken;
    self->_punchThroughServiceDomainActivationToken = v185;
  }
  v187 = DBLogForCategory(0);
  if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v187, OS_LOG_TYPE_DEFAULT, "Taking preventSpuriousScreenUndimToken", buf, 2u);
  }

  id v188 = objc_alloc_init(MEMORY[0x263F793C8]);
  v189 = [v188 preventSpuriousScreenUndimWithReason:@"CarPlay Active"];
  [(DBDashboard *)self setPreventSpuriousScreenUndimToken:v189];

  [v188 invalidate];
  self->_int connectedNotifyToken = -1;
  notify_register_check("com.apple.carplay.connected", &self->_connectedNotifyToken);
  int connectedNotifyToken = self->_connectedNotifyToken;
  if (connectedNotifyToken != -1)
  {
    notify_set_state(connectedNotifyToken, 1uLL);
    notify_post("com.apple.carplay.connected");
  }
  [(DBDashboard *)self _updateUserInterfaceStyle];
  kdebug_trace();
  v191 = [(DBDashboard *)self environmentConfiguration];
  int v192 = [v191 isVehicleDataSession];

  if (v192)
  {
    v193 = objc_alloc_init(_TtC9DashBoard15DBCAFCarManager);
    carManager = self->_carManager;
    self->_carManager = v193;

    [(DBCAFCarManager *)self->_carManager setDelegate:self];
  }
  v195 = (CRSUIVolumeNotificationService *)objc_alloc_init(MEMORY[0x263F315C0]);
  volumeNotificationService = self->_volumeNotificationService;
  self->_volumeNotificationService = v195;

  [(CRSUIVolumeNotificationService *)self->_volumeNotificationService addObserver:self];
  v197 = [MEMORY[0x263F2BA00] activateManualDomain:@"com.apple.CarPlay.VolumeNotification"];
  volumeNotificationServiceDomainActivationToken = self->_volumeNotificationServiceDomainActivationToken;
  self->_volumeNotificationServiceDomainActivationToken = v197;

  [(DBLockOutController *)self->_lockOutController updateLockOutModeAnimated:1 takeScreen:1];
  v199 = [MEMORY[0x263F08A00] defaultCenter];
  [v199 addObserver:self selector:sel__updateWallpaper name:*MEMORY[0x263F31418] object:0];

  v200 = [MEMORY[0x263F08A00] defaultCenter];
  [v200 addObserver:self selector:sel__screenDidBecomeUnavailable_ name:*MEMORY[0x263F30DC0] object:v140];

  v201 = [MEMORY[0x263F08A00] defaultCenter];
  [v201 addObserver:self selector:sel__screenDidBecomeAvailable_ name:*MEMORY[0x263F30DB8] object:v140];

  v202 = +[DBApplicationController sharedInstance];
  [v202 addObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)ResetCarPlayUSB, @"ResetUSBHostToDeviceModeConnectionDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(DBDashboardStateProvider *)self->_dashboardStateProvider setConnectionReady:1];
  os_unfair_lock_lock(&self->_lock);
  self->_lock_hasHandledConnect = 1;
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __28__DBDashboard_handleConnect__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) displayConfiguration];
  v5 = [v4 hardwareIdentifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Invalidating unexpected preventPasscodeLockToken", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"CARCornerRadius"])
  {
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    [v13 floatValue];
    self->_currentCornerRadius = v14;

    [(DBDashboard *)self _drawCorners];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DBDashboard;
    [(DBDashboard *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)handleACHomeUp:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = +[DBEvent eventWithType:1 context:v4];
  [(DBDashboard *)self _handleHomeEvent:v5];

  return 1;
}

- (void)handleLongBackPress
{
  id v3 = +[DBEvent eventWithType:1 context:&unk_26E17EB10];
  [(DBDashboard *)self _handleHomeEvent:v3];
}

- (NSString)activeBundleIdentifier
{
  id v3 = [(DBDashboard *)self _foregroundActiveScene];
  if (v3)
  {
    uint64_t v4 = [(DBDashboard *)self _activeBundleIdentifierForScene:v3];
LABEL_5:
    id v8 = v4;
    goto LABEL_7;
  }
  uint64_t v5 = [(DBDashboard *)self identifierToForegroundAppScenesMap];
  uint8_t v6 = [v5 allValues];
  int v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", &__block_literal_global_5);

  if (v7)
  {
    uint64_t v4 = @"com.apple.CarPlay.dashboard";
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return (NSString *)v8;
}

uint64_t __37__DBDashboard_activeBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 workspaceIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.DashBoard.scene-workspace.widget"];

  return v3;
}

- (void)_handleInterruptPunchthroughEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DBDashboard *)self workspace];
  uint8_t v6 = [v5 state];
  int v7 = [v6 stackedEntity];

  id v8 = [(DBDashboard *)self workspaceOwner];
  [v8 handleEvent:v4];

  v9 = objc_opt_class();
  if ([v9 isEqual:objc_opt_class()])
  {
    id v10 = [v7 identifier];
    interruptedPunchthroughIdentifier = self->_interruptedPunchthroughIdentifier;
    self->_interruptedPunchthroughIdentifier = v10;

    id v12 = DBLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_interruptedPunchthroughIdentifier;
      int v14 = 138543362;
      objc_super v15 = v13;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "PT Interrupted. Identifier of interrupted PT: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_handleHomeEvent:(id)a3
{
  id v7 = a3;
  id v4 = [(DBDashboard *)self notificationViewController];
  char v5 = [v4 handleHomeEvent];

  if ((v5 & 1) == 0)
  {
    uint8_t v6 = [(DBDashboard *)self workspaceOwner];
    [v6 handleEvent:v7];
  }
}

- (void)_handleReturnToHomeScreenEvent:(id)a3
{
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Sending return to home screen event", v6, 2u);
  }

  char v5 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  [(DBMutableWorkspaceStateChangeRequest *)v5 activateHomeScreen];
  [(DBWorkspace *)self->_workspace requestStateChange:v5];
}

- (void)_handleOpenApplicationEvent:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 context];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v6 application];
  id v8 = [v6 activationSettings];
  v9 = [v6 activationSettings];
  uint64_t v10 = [v9 launchSource];

  id v11 = [v7 appPolicy];
  id v12 = +[DBApplicationController sharedInstance];
  int v13 = [v12 preflightRequiredForApplication:v7];

  if (v13)
  {
    int IsUserInitiated = DBLaunchSourceIsUserInitiated(v10);
    objc_super v15 = DBLogForCategory(0);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (IsUserInitiated)
    {
      if (v16) {
        -[DBDashboard _handleOpenApplicationEvent:](v7);
      }

      [(DBDashboard *)self _presentPrivacyDisclosureAlertForApplication:v7];
      uint64_t v17 = DBLogForCategory(0);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      v18 = "Taking screen for alert";
    }
    else
    {
      if (v16) {
        -[DBDashboard _handleOpenApplicationEvent:](v7, v10);
      }

      uint64_t v17 = DBLogForCategory(0);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      v18 = "Taking screen for ignored open application request";
    }
    _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
LABEL_27:

    v23 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBWorkspace *)self->_workspace requestStateChange:v23];
    v24 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v25 = [v24 session];
    [v25 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"User activated app"];

    goto LABEL_28;
  }
  if (v7 && [v7 isLockedOrHidden])
  {
    uint64_t v19 = DBLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleOpenApplicationEvent:].cold.4(v7, v10);
    }

    v20 = DBLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_INFO, "Taking screen for ignored open application request", buf, 2u);
    }

    v21 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v22 = [v21 session];
    [v22 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"User activated app"];
  }
  else if ([v11 launchUsingSiri] && (objc_msgSend(v11, "canDisplayOnCarScreen") & 1) == 0)
  {
    v52[0] = @"__bundleId";
    id v28 = [v7 bundleIdentifier];
    v52[1] = @"__supportsCarFullScreen";
    v53[0] = v28;
    v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "canDisplayOnCarScreen"));
    v53[1] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

    v31 = [v11 siriActivationOptions];
    v32 = v31;
    if (v31)
    {
      id v33 = (void *)[v31 mutableCopy];
      [v33 addEntriesFromDictionary:v30];
    }
    else
    {
      id v33 = v30;
    }
    id v38 = DBLogForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [v7 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v51 = v39;
      _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_DEFAULT, "Sending Siri direct action for app: %{public}@", buf, 0xCu);
    }
    id v40 = DBLogForCategory(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v33;
      _os_log_impl(&dword_22D6F0000, v40, OS_LOG_TYPE_INFO, "Direct action context payload: %@", buf, 0xCu);
    }

    v41 = (void *)[objc_alloc(MEMORY[0x263F6C760]) initWithPayload:v33];
    double v42 = [(DBDashboard *)self siriDirectActionSource];
    [v42 activateWithContext:v41];
  }
  else if ([v7 requiresBackgroundURLDelivery])
  {
    [(DBDashboard *)self _handleBackgroundURLDeliveryForLaunchInfo:v6];
  }
  else if (v7)
  {
    v26 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v26 activateApplication:v7 withSettings:v8];
    objc_initWeak((id *)buf, self);
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v46 = 3221225472;
    double v47 = __43__DBDashboard__handleOpenApplicationEvent___block_invoke;
    double v48 = &unk_2649B4738;
    location = &v49;
    objc_copyWeak(&v49, (id *)buf);
    v27 = (void (**)(void))_Block_copy(&aBlock);
    if ([(DBDashboard *)self isScreenAvailable]) {
      v27[2](v27);
    }
    else {
      -[DBWorkspaceStateChangeRequest setCompletionHandler:](v26, "setCompletionHandler:", v27, &v49, aBlock, v46, v47, v48);
    }
    -[DBWorkspace requestStateChange:](self->_workspace, "requestStateChange:", v26, location);
    if ([v8 launchSource] == 2)
    {
      v35 = [(DBDashboard *)self environmentConfiguration];
      v36 = [v35 appHistory];
      [v36 nowPlayingIconTapped];
    }
    v37 = +[DBAppHistory contextForApplicationCategory:](DBAppHistory, "contextForApplicationCategory:", [v11 applicationCategory]);
    if (v37) {
      [(DBDashboard *)self _notifyAccessoryIfNeededWithUIContext:v37];
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v34 = DBLogForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleOpenApplicationEvent:]();
    }
  }
LABEL_28:
}

void __43__DBDashboard__handleOpenApplicationEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "Taking screen for app launch", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained environmentConfiguration];
  id v5 = [v4 session];
  [v5 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"User activated app"];
}

- (void)_handleBackgroundURLDeliveryForLaunchInfo:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 application];
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Starting background launch for app: %@", buf, 0xCu);
  }
  id v6 = [v3 activationSettings];
  id v7 = [v6 url];

  id v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_INFO, "Launch URL: %@", buf, 0xCu);
  }

  v9 = [v3 activationSettings];
  uint64_t v10 = [v9 actions];

  id v11 = DBLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_INFO, "Launch actions: %@", buf, 0xCu);
  }

  id v12 = (void *)MEMORY[0x263F64598];
  int v13 = [v3 application];
  int v14 = [v13 info];
  objc_super v15 = [v14 applicationIdentity];
  BOOL v16 = [v12 identityForLSApplicationIdentity:v15];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F3F420]) initWithProcessIdentity:v16 executionContextProvider:&__block_literal_global_363];
  objc_initWeak((id *)buf, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_2;
  v22[3] = &unk_2649B47D0;
  objc_copyWeak(&v27, (id *)buf);
  id v18 = v7;
  id v23 = v18;
  id v19 = v3;
  id v24 = v19;
  id v20 = v10;
  id v25 = v20;
  id v21 = v16;
  id v26 = v21;
  [v17 setCompletionBlock:v22];
  [v17 begin];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

id __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F3F448]);
  [v0 setLaunchIntent:2];
  return v0;
}

void __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = (uint64_t)v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Launch transaction completed with success: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [WeakRetained process];

  if (v5)
  {
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    if (*(void *)(a1 + 32))
    {
      id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v9 = [v8 BOOLForKey:@"SendOriginatingProcessWithURLAction"];

      uint64_t v10 = [MEMORY[0x263F29CB8] processHandle];
      if (v9)
      {
        objc_opt_class();
        id v11 = [*(id *)(a1 + 40) activationSettings];
        id v12 = [v11 clientProcess];
        if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }

        uint64_t v14 = [v13 handle];

        uint64_t v10 = (void *)v14;
      }
      objc_super v15 = (void *)[objc_alloc(MEMORY[0x263F829E0]) initWithURL:*(void *)(a1 + 32) workspaceOriginatingProcess:v10];
      BOOL v16 = DBLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = (uint64_t)v15;
        _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Creating open url action: %@", buf, 0xCu);
      }

      [v6 addObject:v15];
    }
    uint64_t v17 = *(void **)(a1 + 48);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_372;
    v45[3] = &unk_2649B4780;
    id v18 = v6;
    id v46 = v18;
    id v19 = v7;
    id v47 = v19;
    [v17 enumerateObjectsUsingBlock:v45];
    if ([v18 count])
    {
      id v20 = [v5 workspace];
      if (v20)
      {
        id v21 = DBLogForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v18 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v49 = v22;
          _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Sending %lu actions to the workspace", buf, 0xCu);
        }

        [v20 sendActions:v18];
      }
    }
    if (![v19 count]) {
      goto LABEL_32;
    }
    id v23 = [MEMORY[0x263F3F4F0] sharedInstance];
    id v24 = [v23 sceneWithIdentifier:@"com.apple.CarPlayApp.url-delivery"];

    if (v24)
    {
      id v25 = [v24 clientProcess];
      id v26 = [v25 identity];
      char v27 = [v26 isEqual:*(void *)(a1 + 56)];

      if ((v27 & 1) == 0)
      {
        id v28 = DBLogForCategory(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v24 clientProcess];
          uint64_t v30 = [v29 identity];
          *(_DWORD *)buf = 138543362;
          uint64_t v49 = (uint64_t)v30;
          _os_log_impl(&dword_22D6F0000, v28, OS_LOG_TYPE_DEFAULT, "Destroying existing throwaway scene for non-matching process identity: %{public}@", buf, 0xCu);
        }
        v31 = [MEMORY[0x263F3F4F0] sharedInstance];
        [v31 destroyScene:@"com.apple.CarPlayApp.url-delivery" withTransitionContext:0];
      }
    }
    else
    {
      id v32 = objc_alloc_init(MEMORY[0x263F82460]);
      id v33 = objc_alloc_init((Class)[v32 settingsClass]);
      v34 = (void *)[v33 mutableCopy];

      v35 = [MEMORY[0x263F3F430] mainConfiguration];
      [v34 setDisplayConfiguration:v35];

      v36 = [MEMORY[0x263F3F430] mainConfiguration];
      [v36 bounds];
      objc_msgSend(v34, "setFrame:");

      [v34 setLevel:1.0];
      [v34 setInterfaceOrientation:1];
      v37 = [MEMORY[0x263F3F768] parametersForSpecification:v32];
      [v37 setSettings:v34];
      id v38 = DBLogForCategory(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_DEFAULT, "Creating throwaway scene for action delivery", buf, 2u);
      }

      v39 = [MEMORY[0x263F3F4F0] sharedInstance];
      id v40 = [v5 workspace];
      id v24 = [v39 createSceneWithIdentifier:@"com.apple.CarPlayApp.url-delivery" parameters:v37 clientProvider:v40 transitionContext:0];

      if (!v24) {
        goto LABEL_32;
      }
    }
    v41 = DBLogForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v42;
      _os_log_impl(&dword_22D6F0000, v41, OS_LOG_TYPE_DEFAULT, "Sending %lu non-workspace actions via throwaway scene", buf, 0xCu);
    }

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_379;
    v43[3] = &unk_2649B47A8;
    id v44 = v19;
    [v24 updateSettingsWithTransitionBlock:v43];

LABEL_32:
  }
}

void __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_372(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = 40;
  if (isKindOfClass) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

id __57__DBDashboard__handleBackgroundURLDeliveryForLaunchInfo___block_invoke_379(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F82468]);
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  [v2 setActions:v3];

  uint64_t v4 = [MEMORY[0x263F29CB8] processHandle];
  [v2 setOriginatingProcess:v4];

  return v2;
}

- (void)_handleTapToRadarEvent
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_FAULT, "CarPlay radar item tapped, gathering screenshots and diagnostics.", v1, 2u);
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F3F430];
  id v4 = a2;
  id v5 = [v3 mainIdentity];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [*(id *)(a1 + 32) displayIdentity];
  id v8 = [v4 objectForKeyedSubscript:v7];

  int v9 = objc_opt_new();
  uint64_t v10 = dispatch_get_global_queue(17, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__DBDashboard__handleTapToRadarEvent__block_invoke_2;
  v14[3] = &unk_2649B4848;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v9;
  id v16 = v6;
  id v17 = v8;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  dispatch_async(v10, v14);
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__DBDashboard__handleTapToRadarEvent__block_invoke_3;
  v5[3] = &unk_2649B4820;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 _collectMemgraphsForTapToRadarWithCompletion:v5];
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DBDashboard__handleTapToRadarEvent__block_invoke_4;
  block[3] = &unk_2649B47F8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F839A0] object:0];

  id v3 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay diagnostics started.", v5, 2u);
  }

  id v4 = [*(id *)(a1 + 64) activeBundleIdentifier];
  CRCollectCarPlayDiagnostics();
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke_384()
{
}

void __37__DBDashboard__handleTapToRadarEvent__block_invoke_2_387()
{
  os_log_t v0 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEFAULT, "CarPlay diagnostics ended.", v2, 2u);
  }

  uint64_t v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:*MEMORY[0x263F83998] object:0];
}

- (void)_collectMemgraphsForTapToRadarWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v29 = (void (**)(id, void))a3;
  id v3 = NSString;
  id v4 = [&unk_26E17EEA0 componentsJoinedByString:@"|"];
  uint64_t v5 = [v3 stringWithFormat:@"_(%@)_.*memgraph$", v4];

  id v28 = (void *)v5;
  id v32 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v5 options:1 error:0];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [MEMORY[0x263F8BC40] getLogPathsSortedByTime];
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v13 = objc_msgSend(v32, "firstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length"));

        if (v13)
        {
          uint64_t v14 = [NSURL fileURLWithPath:v12];
          if (!v9)
          {
            id v15 = [MEMORY[0x263F08850] defaultManager];
            id v35 = 0;
            id v9 = [v15 URLForDirectory:99 inDomain:1 appropriateForURL:v14 create:1 error:&v35];
            id v16 = v35;

            if (v16)
            {
              id v17 = DBLogForCategory(0);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v41 = v16;
                _os_log_error_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_ERROR, "Error creating temporary directory for CarPlay memgraphs: %@", buf, 0xCu);
              }
            }
          }
          if (v9 && !v8)
          {
            id v8 = [v9 URLByAppendingPathComponent:@"CarPlayMemoryExceptions" isDirectory:1];
            id v18 = [MEMORY[0x263F08850] defaultManager];
            id v34 = 0;
            [v18 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:&v34];
            id v19 = v34;

            if (v19)
            {
              id v20 = DBLogForCategory(0);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v41 = v19;
                _os_log_error_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_ERROR, "Error creating CarPlayMemoryExceptions directory: %@", buf, 0xCu);
              }
            }
          }
          id v21 = [v14 lastPathComponent];
          if (v21) {
            BOOL v22 = v8 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22)
          {
            id v23 = [v8 URLByAppendingPathComponent:v21];
            id v24 = [MEMORY[0x263F08850] defaultManager];
            id v33 = 0;
            [v24 copyItemAtURL:v14 toURL:v23 error:&v33];
            id v25 = v33;

            if (v25)
            {
              id v26 = DBLogForCategory(0);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v41 = v25;
                _os_log_error_impl(&dword_22D6F0000, v26, OS_LOG_TYPE_ERROR, "Error copying memgraph to temporary CarPlayMemoryExceptions directory: %@", buf, 0xCu);
              }
            }
            else
            {
              [v30 addObject:v23];
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  if ([v30 count]) {
    char v27 = v8;
  }
  else {
    char v27 = 0;
  }
  ((void (**)(id, void *))v29)[2](v29, v27);
}

- (void)_setupVoiceControlWindow
{
  id v3 = objc_alloc(MEMORY[0x263F82E88]);
  id v4 = [(DBDashboard *)self layoutEngine];
  [v4 mainWindowFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = NSString;
  uint64_t v14 = [(DBDashboard *)self displayConfiguration];
  id v15 = [v14 identity];
  id v16 = [v13 stringWithFormat:@"voiceControl-%@", v15];
  id v17 = objc_msgSend(v3, "_initWithFrame:debugName:windowScene:", v16, self->_windowScene, v6, v8, v10, v12);
  [(DBDashboard *)self setVoiceControlWindow:v17];

  id v18 = [[_TtC9DashBoard28DBVoiceControlViewController alloc] initWithEnvironment:self];
  [(DBDashboard *)self setVoiceControlViewController:v18];

  id v19 = [MEMORY[0x263F825C8] clearColor];
  id v20 = [(DBDashboard *)self voiceControlWindow];
  [v20 setBackgroundColor:v19];

  double v21 = *MEMORY[0x263F83C58] + 9.0;
  BOOL v22 = [(DBDashboard *)self voiceControlWindow];
  [v22 setWindowLevel:v21];

  id v23 = [(DBDashboard *)self voiceControlViewController];
  id v24 = [(DBDashboard *)self voiceControlWindow];
  [v24 setRootViewController:v23];

  id v25 = [(DBDashboard *)self voiceControlWindow];
  [v25 setHidden:0];

  id v26 = [(DBDashboard *)self voiceControlWindow];
  [v26 setUserInteractionEnabled:0];

  id v28 = [(DBDashboard *)self dashboardStateProvider];
  char v27 = [(DBDashboard *)self voiceControlViewController];
  [v28 addObserver:v27];
}

- (id)_foregroundActiveScene
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__1;
  double v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v2 = [(DBDashboard *)self identifierToAppScenesMap];
  id v3 = [v2 allValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__DBDashboard__foregroundActiveScene__block_invoke;
  v6[3] = &unk_2649B4898;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__DBDashboard__foregroundActiveScene__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 uiSettings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v8 = [v7 isForeground];
        uint64_t v9 = [v7 deactivationReasons];
        if (v8)
        {
          if (!v9)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
            *a4 = 1;
          }
        }
      }
    }
  }
}

- (void)_updateDeferrals
{
  id v16 = [(DBDashboard *)self _foregroundActiveScene];
  if (v16)
  {
    [(DBDashboard *)self setShowingApp:1];
    id v3 = [v16 clientProcess];
    id v4 = [(DBDashboard *)self focusController];
    double v5 = [v3 bundleIdentifier];
    objc_msgSend(v4, "takeWithPriority:reason:forWindow:bundleIdentifier:pid:scene:", @"app", 0, v5, objc_msgSend(v3, "pid"), v16, 2.0);

    double v6 = [(DBDashboard *)self userAlertServer];
    uint64_t v7 = [v3 bundleIdentifier];
    int v8 = [v6 alertForBundleID:v7];

    uint64_t v9 = [(DBDashboard *)self focusController];
    id v10 = v9;
    if (v8)
    {
      double v11 = [v8 window];
      id v12 = FBSystemAppBundleID();
      uint64_t v13 = getpid();
      uint64_t v14 = [v8 scene];
      [v10 takeWithPriority:@"appUserAlert" reason:v11 forWindow:v12 bundleIdentifier:v13 pid:v14 scene:3.0];
    }
    else
    {
      [v9 dropReason:@"appUserAlert"];
    }
  }
  else
  {
    [(DBDashboard *)self setShowingApp:0];
    id v15 = [(DBDashboard *)self focusController];
    [v15 dropReason:@"app"];

    id v3 = [(DBDashboard *)self focusController];
    [v3 dropReason:@"appUserAlert"];
  }
}

- (id)_activeBundleIdentifierForScene:(id)a3
{
  id v3 = a3;
  id v4 = [v3 definition];
  double v5 = [v4 clientIdentity];
  double v6 = [v5 processIdentity];
  uint64_t v7 = [v6 embeddedApplicationIdentifier];

  id v8 = v7;
  if (([v8 isEqualToString:@"com.apple.CarPlayTemplateUIHost"] & 1) != 0
    || (id v9 = v8, [v8 isEqualToString:@"com.apple.MusicUIService"]))
  {
    objc_opt_class();
    id v10 = [v3 settings];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    id v12 = [v11 proxiedApplicationBundleIdentifier];
    uint64_t v13 = +[DBApplicationController sharedInstance];
    uint64_t v14 = [v13 applicationWithBundleIdentifier:v12];

    if (v14) {
      id v9 = v12;
    }
    else {
      id v9 = 0;
    }
  }
  return v9;
}

- (BOOL)hasActiveCall
{
  id v2 = [(DBDashboard *)self statusBarStateProvider];
  char v3 = [v2 inCallServiceActive];

  return v3;
}

- (id)_newResizeAnimationWindow
{
  id v3 = objc_alloc(MEMORY[0x263F82E88]);
  id v4 = [(DBDashboard *)self layoutEngine];
  [v4 resizeAnimationWindowFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(UIWindow *)self->_mainWindow windowScene];
  uint64_t v14 = objc_msgSend(v3, "_initWithFrame:debugName:windowScene:", @"resizeAnimationWindow", v13, v6, v8, v10, v12);

  [v14 setWindowLevel:*MEMORY[0x263F83C58] + 11.0];
  [v14 setHidden:0];
  id v15 = [MEMORY[0x263F825C8] blackColor];
  [v14 setBackgroundColor:v15];

  return v14;
}

- (id)_takeSnapshotOfFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(DBDashboard *)self _dashboardScene];
  double v9 = [v8 snapshotContext];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  double v11 = [(DBDashboard *)self resizeWindow];

  if (v11)
  {
    double v12 = [v8 layerManager];
    uint64_t v13 = [(DBDashboard *)self resizeWindow];
    uint64_t v14 = objc_msgSend(v12, "layerWithContextID:", objc_msgSend(v13, "_contextId"));
    [v10 addObject:v14];
  }
  id v15 = [(DBDashboard *)self cornerRadiusWindow];

  if (v15)
  {
    id v16 = [v8 layerManager];
    id v17 = [(DBDashboard *)self cornerRadiusWindow];
    id v18 = objc_msgSend(v16, "layerWithContextID:", objc_msgSend(v17, "_contextId"));

    if (v18) {
      [v10 addObject:v18];
    }
  }
  [v9 setLayersToExclude:v10];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  id v19 = [v8 createSnapshotWithContext:v9];
  [v19 capture];
  id v20 = [v8 uiPresentationManager];
  double v21 = [v20 snapshotPresentationForSnapshot:v19];

  return v21;
}

- (void)_homeTapped:(id)a3
{
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "home button triggered", v5, 2u);
  }

  [(DBDashboard *)self handleACHomeUp:1];
}

- (void)_dismissFloatingSiriIfNecessary
{
  id v3 = [(DBDashboard *)self siriViewController];
  char v4 = [v3 isDismissed];

  if ((v4 & 1) == 0)
  {
    double v5 = [(DBDashboard *)self identifierToForegroundAppScenesMap];
    double v6 = [v5 allValues];
    double v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_445);

    objc_opt_class();
    id v8 = [v7 settings];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9 && [v9 deactivationReasons])
    {
      id v10 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Dismissing floating Siri", v12, 2u);
      }

      double v11 = [(DBDashboard *)self siriViewController];
      [v11 backgroundSceneWithCompletion:0];
    }
  }
}

uint64_t __46__DBDashboard__dismissFloatingSiriIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 workspaceIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.siri"];

  return v3;
}

- (void)_backLongPressed:(id)a3
{
  id v4 = a3;
  double v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "long back press triggered", v6, 2u);
  }

  [(DBDashboard *)self handleLongBackPress];
  [v4 lastSenderID];

  BKSHIDServicesCancelButtonEventsFromSenderID();
}

- (id)_nowRecordingBundleIdentifier
{
  id v2 = [(DBDashboard *)self statusBarStateProvider];
  uint64_t v3 = [v2 nowRecordingBundleIdentifier];

  return v3;
}

- (void)_displayRecordingAlert
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBDashboard *)self _nowRecordingBundleIdentifier];
  if (v3)
  {
    id v4 = [MEMORY[0x263F01888] bundleProxyForIdentifier:v3];
    double v5 = DBLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [v4 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v28 = v6;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Displaying recording alert for %{public}@", buf, 0xCu);
    }
    double v7 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    id v8 = [v7 localizedStringForKey:@"APP_USING_MIC_OK" value:&stru_26E13A820 table:@"CarPlayApp"];

    id v9 = NSString;
    [v4 localizedName];
    v10 = id v25 = v4;
    double v11 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    double v12 = [v11 localizedStringForKey:@"APP_USING_MIC_MESSAGE" value:&stru_26E13A820 table:@"CarPlayApp"];
    uint64_t v13 = [v9 stringWithFormat:@"%@ %@", v10, v12];

    uint64_t v14 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v13 preferredStyle:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __37__DBDashboard__displayRecordingAlert__block_invoke;
    v26[3] = &unk_2649B44A8;
    v26[4] = self;
    id v15 = [MEMORY[0x263F82400] actionWithTitle:v8 style:0 handler:v26];
    [v14 addAction:v15];
    id v16 = [(DBDashboard *)self notificationViewController];
    [v16 setSuspended:1 forReason:@"DBNotificationSuspensionReasonRecordingAlert"];

    id v17 = [(DBDashboard *)self notificationViewController];
    [v17 presentViewController:v14 animated:1 completion:0];

    id v18 = [(DBDashboard *)self _dashboardScene];
    id v19 = [(DBDashboard *)self focusController];
    id v20 = [(DBDashboard *)self notificationWindow];
    double v21 = FBSystemAppBundleID();
    [v19 takeWithPriority:@"alertSheetFocus" reason:v20 forWindow:v21 bundleIdentifier:getpid() pid:v18 scene:6.0];

    BOOL v22 = (void *)MEMORY[0x263F82758];
    id v23 = [(DBDashboard *)self notificationWindow];
    id v24 = [v22 focusSystemForEnvironment:v23];
    [v24 setNeedsFocusUpdate];
  }
}

void __37__DBDashboard__displayRecordingAlert__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) focusController];
  [v2 dropReason:@"alertSheetFocus"];

  id v3 = [*(id *)(a1 + 32) notificationViewController];
  [v3 setSuspended:0 forReason:@"DBNotificationSuspensionReasonRecordingAlert"];
}

- (void)_presentPrivacyDisclosureAlertForApplication:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    char v27 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Displaying privacy disclosure alert for %{public}@", buf, 0xCu);
  }
  double v7 = NSString;
  id v8 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  id v9 = [v8 localizedStringForKey:@"PRIVACY_DISCLOSURE_ALERT_BODY_%@" value:&stru_26E13A820 table:@"CarPlayApp"];
  id v10 = [v4 displayName];
  double v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  double v12 = (void *)MEMORY[0x263F82418];
  uint64_t v13 = [v4 displayName];
  uint64_t v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__DBDashboard__presentPrivacyDisclosureAlertForApplication___block_invoke;
  v25[3] = &unk_2649B44A8;
  v25[4] = self;
  id v15 = [MEMORY[0x263F82400] actionWithTitle:@"OK" style:0 handler:v25];
  [v14 addAction:v15];
  id v16 = [(DBDashboard *)self notificationViewController];
  [v16 setSuspended:1 forReason:@"DBNotificationSuspensionReasonPrivacyAlert"];

  id v17 = [(DBDashboard *)self notificationViewController];
  [v17 presentViewController:v14 animated:1 completion:0];

  id v18 = [(DBDashboard *)self _dashboardScene];
  id v19 = [(DBDashboard *)self focusController];
  id v20 = [(DBDashboard *)self notificationWindow];
  double v21 = FBSystemAppBundleID();
  [v19 takeWithPriority:@"alertSheetFocus" reason:v20 forWindow:v21 bundleIdentifier:getpid() pid:v18 scene:6.0];

  BOOL v22 = (void *)MEMORY[0x263F82758];
  id v23 = [(DBDashboard *)self notificationWindow];
  id v24 = [v22 focusSystemForEnvironment:v23];
  [v24 setNeedsFocusUpdate];
}

void __60__DBDashboard__presentPrivacyDisclosureAlertForApplication___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) focusController];
  [v2 dropReason:@"alertSheetFocus"];

  id v3 = [*(id *)(a1 + 32) notificationViewController];
  [v3 setSuspended:0 forReason:@"DBNotificationSuspensionReasonPrivacyAlert"];
}

- (void)_notifyAccessoryIfNeededWithUIContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(DBDashboard *)self environmentConfiguration];
  double v6 = [v5 appHistory];
  uint64_t v7 = [v6 currentOwnerForContext:v4];

  if (v7)
  {
    id v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v4;
      id v9 = "Accessory is not context owner for %{public}@, not notifying.";
LABEL_8:
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v10 = [(DBDashboard *)self environmentConfiguration];
  double v11 = [v10 appHistory];
  double v12 = [v11 sessionAppContextURLs];
  char v13 = [v12 containsObject:v4];

  if ((v13 & 1) == 0)
  {
    id v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v4;
      id v9 = "Accessory does not declare session support for context %{public}@; not notifying.";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v14 = [(DBDashboard *)self environmentConfiguration];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__DBDashboard__notifyAccessoryIfNeededWithUIContext___block_invoke;
  v15[3] = &unk_2649B48C0;
  v15[4] = self;
  id v16 = v4;
  [v14 fetchEnhancedIntegrationStatusWithCompletion:v15];

LABEL_10:
}

void __53__DBDashboard__notifyAccessoryIfNeededWithUIContext___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__DBDashboard__notifyAccessoryIfNeededWithUIContext___block_invoke_477;
    v4[3] = &unk_2649B3D30;
    id v2 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    id v5 = v2;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
  else
  {
    id v3 = DBLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Enhanced Integration is not enabled; leaving context owner as Accessory.",
        buf,
        2u);
    }
  }
}

void __53__DBDashboard__notifyAccessoryIfNeededWithUIContext___block_invoke_477(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) environmentConfiguration];
  id v3 = [v2 appHistory];
  [v3 updateOwner:1 forContext:*(void *)(a1 + 40)];

  id v6 = [NSDictionary dictionaryWithObject:*(void *)(a1 + 40) forKey:@"url"];
  id v4 = [*(id *)(a1 + 32) environmentConfiguration];
  id v5 = [v4 session];
  [v5 sendCommand:@"changeUIContext" withParameters:v6];
}

- (void)_screenDidBecomeUnavailable:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DBDashboard__screenDidBecomeUnavailable___block_invoke;
  block[3] = &unk_2649B3E90;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__DBDashboard__screenDidBecomeUnavailable___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScreenAvailable:0];
  id v2 = [*(id *)(a1 + 32) oemScreenLayoutElementAssertion];

  if (!v2)
  {
    id v3 = DBLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Activating layout element for OEM screen", v8, 2u);
    }

    id v4 = (void *)[objc_alloc(MEMORY[0x263F3F718]) initWithIdentifier:@"com.apple.carplay.oem"];
    [v4 setLevel:3];
    [v4 setFillsDisplayBounds:1];
    id v5 = [*(id *)(a1 + 32) environmentConfiguration];
    id v6 = [v5 displayLayoutPublisher];
    uint64_t v7 = [v6 addElement:v4];
    [*(id *)(a1 + 32) setOemScreenLayoutElementAssertion:v7];
  }
}

- (void)_screenDidBecomeAvailable:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DBDashboard__screenDidBecomeAvailable___block_invoke;
  block[3] = &unk_2649B3E90;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__DBDashboard__screenDidBecomeAvailable___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScreenAvailable:1];
  id v2 = [*(id *)(a1 + 32) oemScreenLayoutElementAssertion];

  if (v2)
  {
    id v3 = DBLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating layout element for OEM screen", v10, 2u);
    }

    id v4 = [*(id *)(a1 + 32) oemScreenLayoutElementAssertion];
    [v4 invalidate];

    [*(id *)(a1 + 32) setOemScreenLayoutElementAssertion:0];
  }
  id v5 = [*(id *)(a1 + 32) activeBundleIdentifier];
  if (v5)
  {
    id v6 = +[DBApplicationController sharedInstance];
    uint64_t v7 = [v6 applicationWithBundleIdentifier:v5];

    if (v7)
    {
      id v8 = [v7 appPolicy];
      id v9 = +[DBAppHistory contextForApplicationCategory:](DBAppHistory, "contextForApplicationCategory:", [v8 applicationCategory]);
      if (v9) {
        [*(id *)(a1 + 32) _notifyAccessoryIfNeededWithUIContext:v9];
      }
    }
  }
}

- (void)_updateWallpaper
{
}

- (void)_updateWallpaperWithAnimationDuration:(double)a3 delay:(double)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v7 = DBLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Updating #wallpaper", buf, 2u);
  }

  id v8 = [(DBDashboard *)self environmentConfiguration];
  id v9 = [v8 wallpaperPreferences];

  id v10 = [v9 currentWallpaper];
  double v11 = [(DBDashboard *)self environmentConfiguration];
  double v12 = [v11 vehicle];
  uint64_t v13 = [v12 appearanceModePreference];

  if (!v13)
  {
    uint64_t v14 = [v10 traits];
    char v15 = [v14 supportsDynamicAppearance];

    if ((v15 & 1) == 0)
    {
      id v16 = DBLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DBDashboard _updateWallpaperWithAnimationDuration:delay:]();
      }

      [v9 updateWallpaperToSupportDynamicAppearance];
      uint64_t v17 = [v9 currentWallpaper];

      id v10 = (void *)v17;
    }
  }
  id v18 = [(DBDashboard *)self wallpaperRootViewController];
  uint64_t v19 = [v18 currentWallpaper];
  char v20 = [v19 isEqual:v10];

  if ((v20 & 1) == 0)
  {
    double v21 = DBLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v10;
      _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Applying #wallpaper %{public}@", buf, 0xCu);
    }

    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    char v27 = __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke;
    uint64_t v28 = &unk_2649B3D30;
    id v22 = v10;
    id v29 = v22;
    id v30 = self;
    id v23 = _Block_copy(&v25);
    id v24 = [(DBDashboard *)self wallpaperRootViewController];
    [v24 setWallpaper:v22 duration:v23 delay:a3 updates:a4];
  }
}

void __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) traits];
  if ([v2 isBlack])
  {
    id v3 = [MEMORY[0x263F82DA0] currentTraitCollection];
    BOOL v4 = [v3 userInterfaceStyle] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }

  id v5 = [MEMORY[0x263F3F4F0] sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke_2;
  v12[3] = &unk_2649B4908;
  v12[4] = *(void *)(a1 + 40);
  BOOL v13 = v4;
  [v5 enumerateScenesWithBlock:v12];

  id v6 = [*(id *)(a1 + 32) traits];
  uint64_t v7 = [v6 hideRoundedCorners];
  id v8 = [*(id *)(a1 + 40) cornerRadiusWindow];
  [v8 setHidden:v7];

  id v9 = [*(id *)(a1 + 40) driverStatusBarViewController];
  [v9 updateAppearanceForWallpaper];

  id v10 = [*(id *)(a1 + 40) passengerStatusBarViewController];
  [v10 updateAppearanceForWallpaper];

  double v11 = [*(id *)(a1 + 40) rootViewController];
  [v11 updateAppearanceForWallpaper];
}

void __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 settings];
  id v5 = [v4 displayIdentity];
  id v6 = [*(id *)(a1 + 32) displayIdentity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke_3;
    void v8[3] = &__block_descriptor_33_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    char v9 = *(unsigned char *)(a1 + 40);
    [v3 updateUISettingsWithBlock:v8];
  }
}

void __59__DBDashboard__updateWallpaperWithAnimationDuration_delay___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setBlackWallpaperModeEnabled:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)_updateUserInterfaceStyle
{
  id v3 = [MEMORY[0x263F3F4F0] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__DBDashboard__updateUserInterfaceStyle__block_invoke;
  v4[3] = &unk_2649B4950;
  v4[4] = self;
  [v3 enumerateScenesWithBlock:v4];

  [(DBDashboard *)self _updateWallpaper];
}

void __40__DBDashboard__updateUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [v3 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = [v3 settings];
    int v7 = [v6 displayIdentity];
    id v8 = [*(id *)(a1 + 32) displayIdentity];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) _sceneInterfaceStyleForScene:v3];
      double v11 = DBLogForCategory(0x10uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = CPUIDescriptionForUserInterfaceStyle();
        *(_DWORD *)buf = 138412546;
        char v15 = v12;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Updating user interface style to %@ for scene: %@", buf, 0x16u);
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __40__DBDashboard__updateUserInterfaceStyle__block_invoke_488;
      v13[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
      v13[4] = v10;
      [v3 updateUISettingsWithBlock:v13];
    }
  }
}

uint64_t __40__DBDashboard__updateUserInterfaceStyle__block_invoke_488(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (int64_t)_sceneInterfaceStyleForScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 definition];
  id v6 = [v5 clientIdentity];
  int v7 = [v6 processIdentity];
  id v8 = [v7 embeddedApplicationIdentifier];

  int v9 = +[DBApplicationController sharedInstance];
  uint64_t v10 = [v9 applicationWithBundleIdentifier:v8];

  objc_opt_class();
  double v11 = [v4 settings];

  id v12 = v11;
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13)
  {
    uint64_t v14 = +[DBApplicationController sharedInstance];
    char v15 = [v13 proxiedApplicationBundleIdentifier];
    uint64_t v16 = [v14 applicationWithBundleIdentifier:v15];

    id v17 = v10;
    uint64_t v10 = (void *)v16;
  }
  else
  {
    id v17 = 0;
  }
  int64_t v18 = [(DBDashboard *)self sceneInterfaceStyleForApplication:v10 proxyApplication:v17];

  return v18;
}

- (id)_dashboardScene
{
  id v2 = [(DBDashboard *)self environmentConfiguration];
  id v3 = [v2 displayIdentity];
  id v4 = [NSString stringWithFormat:@"DBDashboard-%@", v3];

  id v5 = [MEMORY[0x263F3F4F0] sharedInstance];
  id v6 = [v5 sceneWithIdentifier:v4];

  return v6;
}

- (void)_drawCorners
{
  v97[16] = *MEMORY[0x263EF8340];
  id v3 = [(DBDashboard *)self environmentConfiguration];
  int v4 = [v3 currentViewAreaSupportsUIOutsideSafeArea];

  id v5 = [(DBDashboard *)self cornerRadiusWindow];
  id v6 = v5;
  if (v4)
  {
    [v5 setHidden:1];

    [(DBDashboard *)self currentCornerRadius];
    double v8 = v7;
    int v9 = [(DBDashboard *)self driverStatusBarWindow];
    uint64_t v10 = [v9 layer];
    [v10 setCornerRadius:v8];

    double v11 = [(DBDashboard *)self environmentConfiguration];
    LODWORD(v10) = [v11 hasDualStatusBar];

    if (v10)
    {
      [(DBDashboard *)self currentCornerRadius];
      double v13 = v12;
      id v91 = [(DBDashboard *)self passengerStatusBarWindow];
      uint64_t v14 = [v91 layer];
      [v14 setCornerRadius:v13];
    }
  }
  else
  {
    [v5 setHidden:0];

    char v15 = [(DBDashboard *)self driverStatusBarWindow];
    uint64_t v16 = [v15 layer];
    [v16 setCornerRadius:0.0];

    id v17 = [(DBDashboard *)self environmentConfiguration];
    LODWORD(v16) = [v17 hasDualStatusBar];

    if (v16)
    {
      int64_t v18 = [(DBDashboard *)self passengerStatusBarWindow];
      uint64_t v19 = [v18 layer];
      [v19 setCornerRadius:0.0];
    }
    char v20 = [(DBDashboard *)self cornerRadiusWindow];
    double v21 = [(DBDashboard *)self environmentConfiguration];
    [v21 screenScale];
    double v23 = v22;

    double currentCornerRadius = self->_currentCornerRadius;
    uint64_t v25 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v26 = [v25 session];
    char v27 = [v26 configuration];
    uint64_t v28 = [v27 screens];
    id v29 = objc_msgSend(v28, "bs_firstObjectPassingTest:", &__block_literal_global_491);

    if (([v29 wantsCornerMasks] & 1) == 0)
    {
      v90 = v29;
      double v30 = v23 * currentCornerRadius;
      double v31 = ceil(currentCornerRadius * 1.528665);
      double v32 = v23 * v31;
      uint64_t v33 = DBLogForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v33, OS_LOG_TYPE_DEFAULT, "Main screen is not requesting corner masks.", buf, 2u);
      }

      id v34 = [MEMORY[0x263F825C8] blackColor];
      uint64_t v35 = DBGenerateUpperLeftCornerImage(v34, 0, v32, v30);

      long long v36 = [v20 subviews];
      [v36 enumerateObjectsUsingBlock:&__block_literal_global_495];

      id v37 = objc_alloc_init(MEMORY[0x263F82E00]);
      [v37 setUserInteractionEnabled:0];
      [v20 addSubview:v37];
      long long v38 = [(DBDashboard *)self layoutEngine];
      [v38 cornerRadiusViewFrame];
      objc_msgSend(v37, "setFrame:");

      [(DBDashboard *)self setCornerRadiusView:v37];
      long long v39 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v35];
      [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v37 addSubview:v39];
      id v40 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v35];
      CGAffineTransformMakeRotation(&v95, 1.57079633);
      [v40 setTransform:&v95];
      [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v37 addSubview:v40];
      v89 = (void *)v35;
      id v41 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v35];
      CGAffineTransformMakeRotation(&v94, 3.14159265);
      [v41 setTransform:&v94];
      [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v37 addSubview:v41];
      uint64_t v42 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v35];
      CGAffineTransformMakeRotation(&v93, 4.71238898);
      [v42 setTransform:&v93];
      [v42 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v37 addSubview:v42];
      double v68 = (void *)MEMORY[0x263F08938];
      v88 = [v39 leftAnchor];
      uint64_t v87 = [v37 leftAnchor];
      [v88 constraintEqualToAnchor:v87];
      v86 = v85 = v39;
      v97[0] = v86;
      v84 = [v39 topAnchor];
      v83 = [v37 topAnchor];
      v82 = [v84 constraintEqualToAnchor:v83];
      v97[1] = v82;
      v81 = [v39 heightAnchor];
      uint64_t v80 = [v81 constraintEqualToConstant:v31];
      v97[2] = v80;
      v79 = [v39 widthAnchor];
      v77 = [v79 constraintEqualToConstant:v31];
      v97[3] = v77;
      v76 = [v40 rightAnchor];
      v75 = [v37 rightAnchor];
      v74 = [v76 constraintEqualToAnchor:v75];
      v97[4] = v74;
      v78 = v40;
      uint64_t v73 = [v40 topAnchor];
      double v72 = [v37 topAnchor];
      double v71 = [v73 constraintEqualToAnchor:v72];
      v97[5] = v71;
      double v69 = [v40 heightAnchor];
      double v67 = [v69 constraintEqualToConstant:v31];
      v97[6] = v67;
      double v66 = [v40 widthAnchor];
      double v65 = [v66 constraintEqualToConstant:v31];
      v97[7] = v65;
      v64 = [v41 rightAnchor];
      id v63 = [v37 rightAnchor];
      v61 = [v64 constraintEqualToAnchor:v63];
      v97[8] = v61;
      double v70 = v41;
      v60 = [v41 bottomAnchor];
      id v59 = [v37 bottomAnchor];
      v58 = [v60 constraintEqualToAnchor:v59];
      v97[9] = v58;
      v57 = [v41 heightAnchor];
      double v56 = [v57 constraintEqualToConstant:v31];
      v97[10] = v56;
      v55 = [v41 widthAnchor];
      v54 = [v55 constraintEqualToConstant:v31];
      v97[11] = v54;
      v53 = [v42 leftAnchor];
      v52 = [v37 leftAnchor];
      [v53 constraintEqualToAnchor:v52];
      uint64_t v43 = v92 = v20;
      v97[12] = v43;
      v62 = v42;
      id v44 = [v42 bottomAnchor];
      double v45 = [v37 bottomAnchor];
      id v46 = [v44 constraintEqualToAnchor:v45];
      v97[13] = v46;
      id v47 = [v42 heightAnchor];
      double v48 = [v47 constraintEqualToConstant:v31];
      v97[14] = v48;
      uint64_t v49 = [v42 widthAnchor];
      uint64_t v50 = [v49 constraintEqualToConstant:v31];
      v97[15] = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:16];
      [v68 activateConstraints:v51];

      char v20 = v92;
      id v29 = v90;
    }
  }
}

BOOL __27__DBDashboard__drawCorners__block_invoke(uint64_t a1, void *a2)
{
  return [a2 screenType] == 0;
}

uint64_t __27__DBDashboard__drawCorners__block_invoke_492(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)_updateMaskedCornersForStatusBarWindows
{
  id v3 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v4 = [v3 currentStatusBarEdge];

  if (v4 == 3)
  {
    uint64_t v5 = 3;
  }
  else
  {
    id v6 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v7 = [v6 currentStatusBarEdge];

    if (v7 == 1)
    {
      uint64_t v5 = 12;
    }
    else
    {
      double v8 = [(DBDashboard *)self environmentConfiguration];
      int v9 = [v8 isRightHandDrive];

      if (v9) {
        uint64_t v5 = 10;
      }
      else {
        uint64_t v5 = 5;
      }
    }
  }
  uint64_t v10 = [(DBStatusBarWindow *)self->_driverStatusBarWindow layer];
  [v10 setMaskedCorners:v5];

  double v11 = [(DBDashboard *)self environmentConfiguration];
  LODWORD(v10) = [v11 hasDualStatusBar];

  if (v10)
  {
    double v12 = [(DBDashboard *)self environmentConfiguration];
    int v13 = [v12 isRightHandDrive];

    if (v13) {
      uint64_t v14 = 5;
    }
    else {
      uint64_t v14 = 10;
    }
    id v15 = [(DBStatusBarWindow *)self->_passengerStatusBarWindow layer];
    [v15 setMaskedCorners:v14];
  }
}

- (void)_setInitialFocusOwner
{
  id v3 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v4 = [v3 session];
  uint64_t v5 = [v4 configuration];
  id v6 = [v5 screens];
  objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_499);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [(DBDashboard *)self _dashboardScene];
  focusController = self->_focusController;
  mainWindow = self->_mainWindow;
  uint64_t v10 = FBSystemAppBundleID();
  [(DBFocusController *)focusController takeWithPriority:@"launcher" reason:mainWindow forWindow:v10 bundleIdentifier:getpid() pid:v7 scene:1.0];

  [(DBDashboard *)self _updateDeferrals];
  double v11 = [(DBDashboard *)self environmentConfiguration];
  if ([v11 currentViewAreaSupportsFocusTransfer])
  {
    char v12 = [v13 initialFocusOwner];

    if ((v12 & 1) == 0) {
      [(DBFocusController *)self->_focusController takeWithPriority:@"oemFocus" reason:0 forWindow:*MEMORY[0x263F312A8] bundleIdentifier:0xFFFFFFFFLL pid:0 scene:9.0];
    }
  }
  else
  {
  }
}

BOOL __36__DBDashboard__setInitialFocusOwner__block_invoke(uint64_t a1, void *a2)
{
  return [a2 screenType] == 0;
}

- (void)_initializeWallpaper
{
  id v3 = NSString;
  uint64_t v4 = [(DBDashboard *)self displayConfiguration];
  uint64_t v5 = [v4 identity];
  id v40 = [v3 stringWithFormat:@"wallpaper-%@", v5];

  id v6 = [MEMORY[0x263F3F7C8] identityForIdentifier:v40 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.local"];
  uint64_t v7 = [_TtC9DashBoard21DBWallpaperHostWindow alloc];
  double v8 = [(DBDashboard *)self windowScene];
  int v9 = [(DBDashboard *)self layoutEngine];
  [v9 wallpaperHostWindowFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  int64_t v18 = [(DBDashboard *)self layoutEngine];
  [v18 wallpaperHostSceneFrame];
  double v23 = -[DBWallpaperHostWindow initWithWindowScene:frame:sceneFrame:sceneIdentity:](v7, "initWithWindowScene:frame:sceneFrame:sceneIdentity:", v8, v6, v11, v13, v15, v17, v19, v20, v21, v22);
  wallpaperHostWindow = self->_wallpaperHostWindow;
  self->_wallpaperHostWindow = v23;

  [(DBWallpaperHostWindow *)self->_wallpaperHostWindow setLevel:*MEMORY[0x263F83C58] + -1.0];
  [(DBWallpaperHostWindow *)self->_wallpaperHostWindow setHidden:0];
  uint64_t v25 = [_TtC9DashBoard17DBWallpaperWindow alloc];
  uint64_t v26 = [(DBDashboard *)self layoutEngine];
  [v26 wallpaperWindowFrame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  uint64_t v35 = [(DBLocalSceneHostWindow *)self->_wallpaperHostWindow clientScene];
  long long v36 = (_TtC9DashBoard17DBWallpaperWindow *)-[DBWallpaperWindow _initWithFrame:debugName:scene:attached:](v25, "_initWithFrame:debugName:scene:attached:", v40, v35, 0, v28, v30, v32, v34);
  wallpaperWindow = self->_wallpaperWindow;
  self->_wallpaperWindow = v36;

  long long v38 = [[_TtC9DashBoard29DBWallpaperRootViewController alloc] initWithEnvironment:self];
  wallpaperRootViewController = self->_wallpaperRootViewController;
  self->_wallpaperRootViewController = v38;

  [(DBWallpaperWindow *)self->_wallpaperWindow setRootViewController:self->_wallpaperRootViewController];
  [(DBWallpaperWindow *)self->_wallpaperWindow setClipsToBounds:1];
  [(DBWallpaperWindow *)self->_wallpaperWindow setHidden:0];
}

- (void)_setupStatusBar
{
  id v3 = NSString;
  uint64_t v4 = [(DBDashboard *)self displayConfiguration];
  uint64_t v5 = [v4 identity];
  id v32 = [v3 stringWithFormat:@"statusbar-%@", v5];

  id v6 = [MEMORY[0x263F3F7C8] identityForIdentifier:v32 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.local"];
  uint64_t v7 = [DBStatusBarHostWindow alloc];
  double v8 = [(DBDashboard *)self windowScene];
  int v9 = [(DBDashboard *)self layoutEngine];
  [v9 statusBarHostWindowFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  int64_t v18 = [(DBDashboard *)self layoutEngine];
  [v18 statusBarHostSceneFrame];
  double v23 = -[DBLocalSceneHostWindow initWithWindowScene:frame:sceneFrame:sceneIdentity:](v7, "initWithWindowScene:frame:sceneFrame:sceneIdentity:", v8, v6, v11, v13, v15, v17, v19, v20, v21, v22);
  statusBarHostWindow = self->_statusBarHostWindow;
  self->_statusBarHostWindow = v23;

  [(DBStatusBarHostWindow *)self->_statusBarHostWindow setLevel:*MEMORY[0x263F83C58] + 5.0];
  [(DBStatusBarHostWindow *)self->_statusBarHostWindow setHidden:0];
  uint64_t v25 = (CRSUIStatusBarStyleService *)objc_alloc_init(MEMORY[0x263F31588]);
  statusBarStyleService = self->_statusBarStyleService;
  self->_statusBarStyleService = v25;

  double v27 = [MEMORY[0x263F2BA00] activateManualDomain:@"com.apple.CarPlay.StatusBar"];
  serviceDomainActivationToken = self->_serviceDomainActivationToken;
  self->_serviceDomainActivationToken = v27;

  double v29 = [(DBLocalSceneHostWindow *)self->_statusBarHostWindow clientScene];
  if ([(DBEnvironmentConfiguration *)self->_environmentConfiguration hasDualStatusBar])
  {
    [(DBDashboard *)self _setupDualStatusBarWithScene:v29];
    double v30 = (void *)[objc_alloc(MEMORY[0x263F31580]) initWithInterfaceStyle:2];
    [(DBDashboard *)self setStatusBarStyleAssertion:v30];

    double v31 = [(DBDashboard *)self statusBarStyleAssertion];
    [v31 acquireWithAnimationSettings:0];
  }
  else
  {
    [(DBDashboard *)self _setupClassicStatusBarWithScene:v29];
  }
  [(DBDashboard *)self _updateMaskedCornersForStatusBarWindows];
}

- (void)_setupClassicStatusBarWithScene:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [DBStatusBarWindow alloc];
  id v6 = [(DBDashboard *)self layoutEngine];
  [v6 primaryStatusBarWindowFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v4 identifier];
  double v16 = (DBStatusBarWindow *)-[DBStatusBarWindow _initWithFrame:debugName:scene:attached:](v5, "_initWithFrame:debugName:scene:attached:", v15, v4, 0, v8, v10, v12, v14);

  driverStatusBarWindow = self->_driverStatusBarWindow;
  self->_driverStatusBarWindow = v16;

  uint64_t v18 = *MEMORY[0x263F15A20];
  double v19 = [(DBStatusBarWindow *)self->_driverStatusBarWindow layer];
  [v19 setCornerCurve:v18];

  [(DBStatusBarWindow *)self->_driverStatusBarWindow setClipsToBounds:1];
  double v20 = DBLogForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = self->_driverStatusBarWindow;
    int v32 = 138412290;
    double v33 = v21;
    _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Creating new status bar window: %@", (uint8_t *)&v32, 0xCu);
  }

  double v22 = [(DBDashboard *)self environmentConfiguration];
  -[DBStatusBarWindow setRightHandDrive:](self->_driverStatusBarWindow, "setRightHandDrive:", [v22 isRightHandDrive]);

  double v23 = [[DBStatusBarStateProvider alloc] initWithEnvironment:self];
  statusBarStateProvider = self->_statusBarStateProvider;
  self->_statusBarStateProvider = v23;

  [(DBWorkspace *)self->_workspace addObserver:self->_statusBarStateProvider];
  uint64_t v25 = [DBRootStatusBarViewController alloc];
  uint64_t v26 = [(DBDashboard *)self rootViewController];
  double v27 = [v26 homeViewController];
  double v28 = [(DBRootStatusBarViewController *)v25 initWithEnvironment:self iconProvider:v27 climateViewController:self->_climateViewController audioNotificationViewController:self->_audioViewController stateProvider:self->_statusBarStateProvider layout:0];
  driverStatusBarViewController = self->_driverStatusBarViewController;
  self->_driverStatusBarViewController = v28;

  double v30 = self->_driverStatusBarViewController;
  double v31 = [(DBDashboard *)self environmentConfiguration];
  -[DBRootStatusBarViewController setTransitionControlType:](v30, "setTransitionControlType:", [v31 currentViewAreaTransitionControlType]);

  [(DBWorkspace *)self->_workspace addObserver:self->_driverStatusBarViewController];
  [(DBStatusBarWindow *)self->_driverStatusBarWindow setRootViewController:self->_driverStatusBarViewController];
  [(DBStatusBarWindow *)self->_driverStatusBarWindow setHidden:0];
  [(CRSUIStatusBarStyleService *)self->_statusBarStyleService addObserver:self->_driverStatusBarViewController];
}

- (BOOL)_supportsDisplayingPunchthroughWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DBDashboard *)self displayInfo];
  int v6 = [v5 supportsDDPContent];

  if (v6)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    double v7 = [(DBDashboard *)self displayInfo];
    double v8 = [v7 oemPunchThroughs];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__DBDashboard__supportsDisplayingPunchthroughWithIdentifier___block_invoke;
    v14[3] = &unk_2649B49B8;
    id v9 = v4;
    id v15 = v9;
    double v16 = &v17;
    [v8 enumerateObjectsUsingBlock:v14];

    BOOL v10 = *((unsigned char *)v18 + 24) != 0;
    if (*((unsigned char *)v18 + 24))
    {
      double v11 = DBLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Display does support punchthrough with identifier: %@", buf, 0xCu);
      }
    }
    else
    {
      double v11 = DBLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DBDashboard _supportsDisplayingPunchthroughWithIdentifier:]();
      }
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    double v12 = DBLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _supportsDisplayingPunchthroughWithIdentifier:]();
    }

    BOOL v10 = 0;
  }

  return v10;
}

void __61__DBDashboard__supportsDisplayingPunchthroughWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_presentPunchthroughWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DBDashboard *)self environmentConfiguration];
  int v6 = [v5 supportsGaugeCluster];

  if (v6
    && [(DBDashboard *)self _supportsDisplayingPunchthroughWithIdentifier:v4])
  {
    int v7 = DBLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Activating punch through with id: %@", (uint8_t *)&v10, 0xCu);
    }

    double v8 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v8 activateOEMPunchthrough:v4];
    id v9 = [(DBDashboard *)self workspace];
    [v9 requestStateChange:v8];
  }
  else
  {
    DBLogForCategory(0);
    double v8 = (DBMutableWorkspaceStateChangeRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _presentPunchthroughWithIdentifier:]();
    }
  }
}

- (void)_dismissPunchthroughWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing punch through with id: %@", buf, 0xCu);
  }

  int v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  [(DBMutableWorkspaceStateChangeRequest *)v6 deactivateOEMPunchthrough:v4];
  objc_initWeak((id *)buf, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __50__DBDashboard__dismissPunchthroughWithIdentifier___block_invoke;
  uint64_t v12 = &unk_2649B49E0;
  objc_copyWeak(&v14, (id *)buf);
  id v7 = v4;
  id v13 = v7;
  [(DBWorkspaceStateChangeRequest *)v6 setCompletionHandler:&v9];
  double v8 = [(DBDashboard *)self workspace];
  [v8 requestStateChange:v6];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __50__DBDashboard__dismissPunchthroughWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained punchThroughService];
  [v2 punchThroughIdentifierDidDismiss:*(void *)(a1 + 32)];
}

- (void)_notifyClimateWindowIsPunchthroughPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DBDashboard *)self climateWindow];
  id v7 = [v4 rootViewController];

  uint64_t v5 = v7;
  if (v7)
  {
    if (v3) {
      uint64_t v6 = 128;
    }
    else {
      uint64_t v6 = 0;
    }
    [v7 updateWithDeactivationReasons:v6];
    uint64_t v5 = v7;
  }
}

- (void)_handleOEMNotificationURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Handling OEM notification URL: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:0];
    id v7 = [v6 scheme];
    if ([v7 isEqualToString:@"inputStream"])
    {
      [(DBDashboard *)self _handleInputStreamURL:v6];
    }
    else if ([v7 isEqualToString:@"settings"])
    {
      [(DBDashboard *)self _handleAutoSettingsURL:v4];
    }
    else
    {
      double v8 = objc_alloc_init(DBActivationSettings);
      [(DBActivationSettings *)v8 setUrl:v4];
      [(DBDashboard *)self _handleAppSchemeURL:v4 activationSettings:v8];
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[DBDashboard _handleOEMNotificationURL:]();
  }
}

- (void)_handleInputStreamURL:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  uint64_t v5 = [v4 queryItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __37__DBDashboard__handleInputStreamURL___block_invoke;
  v7[3] = &unk_2649B4A08;
  v7[4] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  if (v9[5])
  {
    -[DBDashboard _presentPunchthroughWithIdentifier:](self, "_presentPunchthroughWithIdentifier:");
  }
  else
  {
    uint64_t v6 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleInputStreamURL:]();
    }
  }
  _Block_object_dispose(&v8, 8);
}

void __37__DBDashboard__handleInputStreamURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = [v11 name];
  int v7 = [v6 isEqualToString:@"identifier"];

  if (v7)
  {
    uint64_t v8 = [v11 value];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (void)_handleAutoSettingsURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Handling Auto Settings URL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  uint64_t v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  int v7 = [v6 queryItems];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__DBDashboard__handleAutoSettingsURL___block_invoke;
  v15[3] = &unk_2649B4A08;
  v15[4] = &buf;
  [v7 enumerateObjectsUsingBlock:v15];

  uint64_t v8 = [(NSDictionary *)self->_settingsCategoryToBundleID objectForKeyedSubscript:*(void *)(*((void *)&buf + 1) + 40)];
  if (!v8)
  {
    uint64_t v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Valid category not found. Defaulting to auto settings.", v14, 2u);
    }

    uint64_t v8 = @"com.apple.AutoSettings";
  }
  uint64_t v10 = +[DBApplicationController sharedInstance];
  id v11 = [v10 applicationWithBundleIdentifier:v8];

  if (v11)
  {
    uint64_t v12 = objc_alloc_init(DBActivationSettings);
    [(DBActivationSettings *)v12 setUrl:v4];
    id v13 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v13 activateApplication:v11 withSettings:v12];
    [(DBWorkspace *)self->_workspace requestStateChange:v13];
  }
  else
  {
    DBLogForCategory(6uLL);
    uint64_t v12 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleAutoSettingsURL:]();
    }
  }

  _Block_object_dispose(&buf, 8);
}

void __38__DBDashboard__handleAutoSettingsURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = [v11 name];
  int v7 = [v6 isEqualToString:@"category"];

  if (v7)
  {
    uint64_t v8 = [v11 value];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (void)_setupDualStatusBarWithScene:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [DBStatusBarWindow alloc];
  uint64_t v6 = [(DBDashboard *)self layoutEngine];
  [v6 primaryStatusBarWindowFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v4 identifier];
  id v16 = (DBStatusBarWindow *)-[DBStatusBarWindow _initWithFrame:debugName:scene:attached:](v5, "_initWithFrame:debugName:scene:attached:", v15, v4, 0, v8, v10, v12, v14);
  driverStatusBarWindow = self->_driverStatusBarWindow;
  self->_driverStatusBarWindow = v16;

  uint64_t v18 = DBLogForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = self->_driverStatusBarWindow;
    int v46 = 138412290;
    id v47 = v19;
    _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Creating driver status bar window: %@", (uint8_t *)&v46, 0xCu);
  }

  id v20 = [(DBDashboard *)self environmentConfiguration];
  -[DBStatusBarWindow setRightHandDrive:](self->_driverStatusBarWindow, "setRightHandDrive:", [v20 isRightHandDrive]);

  uint64_t v21 = [[DBStatusBarStateProvider alloc] initWithEnvironment:self];
  statusBarStateProvider = self->_statusBarStateProvider;
  self->_statusBarStateProvider = v21;

  [(DBWorkspace *)self->_workspace addObserver:self->_statusBarStateProvider];
  uint64_t v23 = [DBRootStatusBarViewController alloc];
  id v24 = [(DBDashboard *)self rootViewController];
  uint64_t v25 = [v24 homeViewController];
  uint64_t v26 = [(DBRootStatusBarViewController *)v23 initWithEnvironment:self iconProvider:v25 climateViewController:self->_climateViewController audioNotificationViewController:self->_audioViewController stateProvider:self->_statusBarStateProvider layout:1];
  driverStatusBarViewController = self->_driverStatusBarViewController;
  self->_driverStatusBarViewController = v26;

  [(DBRootStatusBarViewController *)self->_driverStatusBarViewController setTransitionControlType:0];
  [(DBWorkspace *)self->_workspace addObserver:self->_driverStatusBarViewController];
  [(DBStatusBarWindow *)self->_driverStatusBarWindow setRootViewController:self->_driverStatusBarViewController];
  [(DBStatusBarWindow *)self->_driverStatusBarWindow setHidden:0];
  [(CRSUIStatusBarStyleService *)self->_statusBarStyleService addObserver:self->_driverStatusBarViewController];
  double v28 = [DBStatusBarWindow alloc];
  double v29 = [(DBDashboard *)self layoutEngine];
  [v29 secondaryStatusBarWindowFrame];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  long long v38 = [v4 identifier];
  long long v39 = (DBStatusBarWindow *)-[DBStatusBarWindow _initWithFrame:debugName:scene:attached:](v28, "_initWithFrame:debugName:scene:attached:", v38, v4, 0, v31, v33, v35, v37);
  passengerStatusBarWindow = self->_passengerStatusBarWindow;
  self->_passengerStatusBarWindow = v39;

  id v41 = DBLogForCategory(0);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = self->_passengerStatusBarWindow;
    int v46 = 138412290;
    id v47 = v42;
    _os_log_impl(&dword_22D6F0000, v41, OS_LOG_TYPE_DEFAULT, "Creating passenger status bar window: %@", (uint8_t *)&v46, 0xCu);
  }

  uint64_t v43 = [(DBDashboard *)self environmentConfiguration];
  -[DBStatusBarWindow setRightHandDrive:](self->_passengerStatusBarWindow, "setRightHandDrive:", [v43 isRightHandDrive]);

  id v44 = [[DBRootStatusBarViewController alloc] initWithEnvironment:self iconProvider:0 climateViewController:0 audioNotificationViewController:0 stateProvider:self->_statusBarStateProvider layout:2];
  passengerStatusBarViewController = self->_passengerStatusBarViewController;
  self->_passengerStatusBarViewController = v44;

  [(DBRootStatusBarViewController *)self->_passengerStatusBarViewController setTransitionControlType:0];
  [(DBWorkspace *)self->_workspace addObserver:self->_passengerStatusBarViewController];
  [(DBStatusBarWindow *)self->_passengerStatusBarWindow setRootViewController:self->_passengerStatusBarViewController];
  [(DBStatusBarWindow *)self->_passengerStatusBarWindow setHidden:0];
  [(CRSUIStatusBarStyleService *)self->_statusBarStyleService addObserver:self->_passengerStatusBarViewController];
}

- (BOOL)_isStatusBarScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(DBDashboard *)self driverStatusBarWindow];
  double v7 = [v6 _scene];
  double v8 = [v7 identifier];
  if ([v5 isEqualToString:v8])
  {
    char v9 = 1;
  }
  else
  {
    double v10 = [v4 identifier];
    double v11 = [(DBDashboard *)self passengerStatusBarWindow];
    double v12 = [v11 _scene];
    double v13 = [v12 identifier];
    char v9 = [v10 isEqualToString:v13];
  }
  return v9;
}

- (void)handleFocusMovementAction:(id)a3 fromScene:(id)a4
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v91 = [v6 focusMovementInfo];
  uint64_t v8 = [v91 heading];
  v90 = [v6 inputDeviceInfo];
  int v89 = [v6 shouldPerformHapticFeedback];
  BOOL v9 = [(DBDashboard *)self _isStatusBarScene:v7];
  double v10 = [(DBDashboard *)self screen];
  double v11 = [v10 traitCollection];
  uint64_t v12 = [v11 layoutDirection];

  double v13 = [(DBDashboard *)self environmentConfiguration];
  int v14 = [v13 isRightHandDrive];

  id v15 = DBLogForCategory(0);
  BOOL v16 = v9;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
    {
      uint64_t v17 = [MEMORY[0x263F089D8] string];
      v93[0] = 0;
      v93[1] = v93;
      v93[2] = 0x2020000000;
      char v94 = 0;
      *(void *)uint64_t aBlock = MEMORY[0x263EF8330];
      *(void *)&aBlock[8] = 3221225472;
      *(void *)&aBlock[16] = ___DBStringFromFocusHeading_block_invoke;
      v98 = (__CFString *)&unk_2649B4EF0;
      id v18 = v17;
      id v99 = v18;
      v100 = v93;
      uint64_t v19 = _Block_copy(aBlock);
      id v20 = (void (**)(void, void))v19;
      if (v8) {
        (*((void (**)(void *, __CFString *))v19 + 2))(v19, @"Up");
      }
      if ((v8 & 2) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Down");
      }
      if ((v8 & 4) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Left");
      }
      if ((v8 & 8) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Right");
      }
      if ((v8 & 0x20) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Previous");
      }
      if ((v8 & 0x10) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Next");
      }
      if ((v8 & 0x100) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"First");
      }
      if ((v8 & 0x200) != 0) {
        ((void (**)(void, __CFString *))v20)[2](v20, @"Last");
      }
      uint64_t v21 = (__CFString *)v18;

      _Block_object_dispose(v93, 8);
    }
    else
    {
      uint64_t v21 = @"None";
    }
    uint64_t v22 = NSStringFromBOOL();
    uint64_t v23 = (void *)v22;
    id v24 = @"to status bar";
    *(_DWORD *)uint64_t aBlock = 138412802;
    *(void *)&aBlock[4] = v21;
    *(_WORD *)&aBlock[12] = 2112;
    if (v16) {
      id v24 = @"from status bar";
    }
    *(void *)&aBlock[14] = v22;
    *(_WORD *)&aBlock[22] = 2112;
    v98 = v24;
    _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "Handling focus movement action with heading: %@, shouldPerformHaptic: %@, direction: %@", aBlock, 0x20u);
  }
  uint64_t v25 = [(DBDashboard *)self environmentConfiguration];
  BOOL v26 = +[DBFocusMovementManager isMovementAllowedForHeading:direction:isRTL:isLeftHandDrive:statusBarEdge:](DBFocusMovementManager, "isMovementAllowedForHeading:direction:isRTL:isLeftHandDrive:statusBarEdge:", v8, v16, v12 == 1, v14 ^ 1u, [v25 currentStatusBarEdge]);

  if (v26)
  {
    double v27 = DBLogForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t aBlock = 0;
      _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Focus movement in direction is allowed", aBlock, 2u);
    }

    BOOL v28 = [(DBDashboard *)self _isStatusBarScene:v7];
    double v29 = DBLogForCategory(0);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        *(_WORD *)uint64_t aBlock = 0;
        _os_log_impl(&dword_22D6F0000, v29, OS_LOG_TYPE_DEFAULT, "Dropping status bar focus assertion", aBlock, 2u);
      }

      double v31 = [(DBDashboard *)self focusController];
      [v6 focusedFrame];
      objc_msgSend(v31, "dropReason:withHeading:focusedFrame:", @"statusbar", v8);
    }
    else
    {
      if (v30)
      {
        *(_WORD *)uint64_t aBlock = 0;
        _os_log_impl(&dword_22D6F0000, v29, OS_LOG_TYPE_DEFAULT, "Taking status bar focus assertion", aBlock, 2u);
      }

      v58 = [MEMORY[0x263F3F4F0] sharedInstance];
      id v59 = [(DBDashboard *)self driverStatusBarWindow];
      v60 = [v59 _scene];
      v61 = [v60 identifier];
      double v31 = [v58 sceneWithIdentifier:v61];

      v62 = [(DBDashboard *)self focusController];
      id v63 = [(DBDashboard *)self driverStatusBarWindow];
      v64 = FBSystemAppBundleID();
      uint64_t v65 = getpid();
      [v6 focusedFrame];
      objc_msgSend(v62, "takeWithPriority:reason:forWindow:bundleIdentifier:pid:scene:heading:focusedFrame:", @"statusbar", v63, v64, v65, v31, v8, 4.0, v66, v67, v68, v69);
    }
    if (v89) {
      -[DBFocusMovementManager performHapticFeedbackForSenderID:](self->_focusMovementManager, "performHapticFeedbackForSenderID:", [v90 senderID]);
    }
  }
  else
  {
    double v32 = [(DBDashboard *)self environmentConfiguration];
    int v33 = [v32 currentViewAreaSupportsFocusTransfer];

    double v34 = DBLogForCategory(0);
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (v33)
    {
      if (v35)
      {
        *(_WORD *)uint64_t aBlock = 0;
        _os_log_impl(&dword_22D6F0000, v34, OS_LOG_TYPE_DEFAULT, "Attempting focus transfer to OEM UI", aBlock, 2u);
      }

      id v36 = [(DBDashboard *)self _dashboardScene];
      BOOL v37 = v36 == v7;

      if (v37)
      {
        double v70 = [(DBDashboard *)self environmentConfiguration];
        [v70 screenScale];
        CGFloat v72 = v71;

        [v6 focusedFrame];
        CGFloat v74 = v73;
        CGFloat v76 = v75;
        CGFloat v78 = v77;
        CGFloat v80 = v79;
        CGAffineTransformMakeScale(&v92, v72, v72);
        v102.origin.double x = v74;
        v102.origin.double y = v76;
        v102.size.double width = v78;
        v102.size.double height = v80;
        CGRect v103 = CGRectApplyAffineTransform(v102, &v92);
        double x = v103.origin.x;
        double y = v103.origin.y;
        double width = v103.size.width;
        double height = v103.size.height;
      }
      else
      {
        [v6 focusedFrame];
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        int v46 = [(DBDashboard *)self rootViewController];
        id v47 = [v46 contentView];
        uint64_t v48 = [(DBDashboard *)self mainWindow];
        uint64_t v49 = [v48 screen];
        +[DBFocusMovementManager convertRect:fromView:toScreen:](DBFocusMovementManager, "convertRect:fromView:toScreen:", v47, v49, v39, v41, v43, v45);
        double x = v50;
        double y = v52;
        double width = v54;
        double height = v56;
      }
      v95[0] = @"originXPixels";
      v81 = [NSNumber numberWithDouble:x];
      v96[0] = v81;
      v95[1] = @"originYPixels";
      v82 = [NSNumber numberWithDouble:y];
      v96[1] = v82;
      v95[2] = @"widthPixels";
      v83 = [NSNumber numberWithDouble:width];
      v96[2] = v83;
      v95[3] = @"heightPixels";
      v84 = [NSNumber numberWithDouble:height];
      v96[3] = v84;
      v95[4] = @"focusHeading";
      v85 = [NSNumber numberWithUnsignedInteger:v8];
      v96[4] = v85;
      v86 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:5];

      uint64_t v87 = [(DBDashboard *)self environmentConfiguration];
      v88 = [v87 session];
      [v88 sendCommand:@"deviceOfferFocus" withParameters:v86];
    }
    else
    {
      if (v35)
      {
        *(_WORD *)uint64_t aBlock = 0;
        _os_log_impl(&dword_22D6F0000, v34, OS_LOG_TYPE_DEFAULT, "Focus movement in direction is not allowed", aBlock, 2u);
      }
    }
  }
}

- (DBScreenshotManager)screenshotManager
{
  screenshotManager = self->_screenshotManager;
  if (!screenshotManager)
  {
    id v4 = [DBScreenshotManager alloc];
    uint64_t v5 = [(DBDashboard *)self windowScene];
    id v6 = [(DBScreenshotManager *)v4 initWithWindowScene:v5];
    id v7 = self->_screenshotManager;
    self->_screenshotManager = v6;

    screenshotManager = self->_screenshotManager;
  }
  return screenshotManager;
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v43;
    *(void *)&long long v10 = 138543362;
    long long v40 = v10;
    id v41 = v7;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "UIActionType", v40);
        switch(v15)
        {
          case 7:
            uint64_t v22 = DBLogForCategory(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Tap received from status bar", buf, 2u);
            }

            id v23 = v14;
            uint64_t v24 = [v23 statusBarStyleOverride];
            switch(v24)
            {
              case 0x2000:
                double v38 = DBLogForCategory(0);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_DEFAULT, "Current override is sysdiagnose, sending TTR event", buf, 2u);
                }

                double v27 = +[DBEvent eventWithType:6 context:0];
                [(DBDashboard *)self handleEvent:v27];
                break;
              case 4:
                double v31 = DBLogForCategory(0);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22D6F0000, v31, OS_LOG_TYPE_DEFAULT, "Current override is recording", buf, 2u);
                }

                double v27 = [(DBDashboard *)self _nowRecordingBundleIdentifier];
                if (v27)
                {
                  double v32 = +[DBApplicationController sharedInstance];
                  int v33 = [v32 applicationWithBundleIdentifier:v27];

                  double v34 = [v33 appPolicy];
                  BOOL v35 = v34;
                  if (v33 && [v34 canDisplayOnCarScreen])
                  {
                    id v36 = DBLogForCategory(0);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = v40;
                      id v47 = v33;
                      _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "Recording app is CarPlay app, activating: %{public}@", buf, 0xCu);
                    }

                    BOOL v37 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
                    [(DBMutableWorkspaceStateChangeRequest *)v37 activateApplication:v33];
                    [(DBWorkspace *)self->_workspace requestStateChange:v37];
                  }
                  else
                  {
                    double v39 = DBLogForCategory(0);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl(&dword_22D6F0000, v39, OS_LOG_TYPE_DEFAULT, "Recording app is not a CarPlay app, displaying alert", buf, 2u);
                    }

                    [(DBDashboard *)self _displayRecordingAlert];
                  }

                  id v7 = v41;
                }
                break;
              case 1:
                uint64_t v25 = DBLogForCategory(0);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22D6F0000, v25, OS_LOG_TYPE_DEFAULT, "Current override is in call, activating InCallService", buf, 2u);
                }

                BOOL v26 = +[DBApplicationController sharedInstance];
                double v27 = [v26 inCallServiceApplication];

                BOOL v28 = objc_alloc_init(DBActivationSettings);
                double v29 = [NSURL faceTimeShowCarPlayInCallUIURL];
                [(DBActivationSettings *)v28 setUrl:v29];

                BOOL v30 = +[DBApplicationLaunchInfo launchInfoForApplication:v27 withActivationSettings:v28];
                [(DBDashboard *)self _handleBackgroundURLDeliveryForLaunchInfo:v30];

                break;
              default:
LABEL_43:

                continue;
            }

            goto LABEL_43;
          case 24:
            uint64_t v21 = DBLogForCategory(0);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Focus movement action received", buf, 2u);
            }

            [(DBDashboard *)self handleFocusMovementAction:v14 fromScene:v7];
            break;
          case 13:
            BOOL v16 = [v7 clientProcess];
            int v17 = [v16 pid];
            pid_t v18 = getpid();

            uint64_t v19 = DBLogForCategory(0);
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
            if (v17 == v18)
            {
              if (v20)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_INFO, "Received unhandled back from CarPlay.app, not handling", buf, 2u);
              }
            }
            else
            {
              if (v20)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_INFO, "Handling unhandled back action", buf, 2u);
              }

              [(DBDashboard *)self handleACHomeUp:2];
            }
            break;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v11);
  }
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 settings];
  id v7 = [v6 displayIdentity];
  id v8 = [(DBDashboard *)self displayIdentity];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    long long v10 = [v5 clientProcess];
    int v11 = [v10 pid];
    pid_t v12 = getpid();

    if (v11 != v12)
    {
      double v13 = [v5 definition];
      int v14 = [v13 clientIdentity];
      uint64_t v15 = [v14 processIdentity];
      BOOL v16 = [v15 embeddedApplicationIdentifier];

      int v17 = +[DBApplicationController sharedInstance];
      pid_t v18 = [v17 applicationWithBundleIdentifier:v16];

      uint64_t v19 = DBLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v5;
        _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_INFO, "didAddScene: %@", (uint8_t *)&v34, 0xCu);
      }

      BOOL v20 = DBLogForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v16;
        _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_INFO, "bundle ID: %@", (uint8_t *)&v34, 0xCu);
      }

      uint64_t v21 = DBLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v18;
        _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_INFO, "application: %@", (uint8_t *)&v34, 0xCu);
      }

      uint64_t v22 = [v5 workspaceIdentifier];
      char v23 = [v22 isEqualToString:*MEMORY[0x263F29B08]];

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [v5 workspaceIdentifier];
        char v25 = [v24 isEqualToString:@"com.apple.DashBoard.scene-workspace.user-alert"];

        if ((v25 & 1) == 0)
        {
          if (v18)
          {
            BOOL v26 = [v5 identifier];
            double v27 = [(DBDashboard *)self identifierToApplicationMap];
            [v27 setObject:v18 forKeyedSubscript:v26];

            BOOL v28 = [(DBDashboard *)self identifierToAppScenesMap];
            [v28 setObject:v5 forKeyedSubscript:v26];

            uint64_t v29 = [v5 settings];
            if (v29)
            {
              BOOL v30 = (void *)v29;
              double v31 = [v5 settings];
              int v32 = [v31 isForeground];

              if (v32)
              {
                int v33 = [(DBDashboard *)self identifierToForegroundAppScenesMap];
                [v33 setObject:v5 forKeyedSubscript:v26];
              }
            }
          }
        }
      }
    }
    [v5 addObserver:self];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v10 = [v4 identifier];
  id v5 = [(DBDashboard *)self identifierToAppScenesMap];
  id v6 = [v5 objectForKeyedSubscript:v10];

  if (v6 == v4)
  {
    id v7 = [(DBDashboard *)self identifierToApplicationMap];
    [v7 setObject:0 forKeyedSubscript:v10];

    id v8 = [(DBDashboard *)self identifierToAppScenesMap];
    [v8 setObject:0 forKeyedSubscript:v10];

    int v9 = [(DBDashboard *)self identifierToForegroundAppScenesMap];
    [v9 setObject:0 forKeyedSubscript:v10];

    [(DBDashboard *)self _updateDeferrals];
  }
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 identifier];
  id v8 = [(DBDashboard *)self identifierToAppScenesMap];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9 == v14)
  {
    id v10 = [v6 settings];
    int v11 = [v10 isForeground];

    pid_t v12 = [(DBDashboard *)self identifierToForegroundAppScenesMap];
    if (v11) {
      id v13 = v14;
    }
    else {
      id v13 = 0;
    }
    [v12 setObject:v13 forKeyedSubscript:v7];

    [(DBDashboard *)self _updateDeferrals];
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v5 = a3;
  id v6 = [(DBDashboard *)self identifierToAppScenesMap];
  id v7 = [v5 identifier];
  id v8 = [v6 objectForKey:v7];

  if (v8 == v5)
  {
    [(DBDashboard *)self _updateDeferrals];
  }
}

- (void)carManager:(id)a3 didUpdateCar:(id)a4
{
  id v5 = a4;
  id v6 = [v5 audioSettings];
  int v7 = [v6 receivedAllValues];

  if (v7)
  {
    audioNotificationManager = self->_audioNotificationManager;
    id v9 = DBLogForCategory(0);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (audioNotificationManager)
    {
      if (v10)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Update audio observers", buf, 2u);
      }

      [(DBAudioNotificationManager *)self->_audioNotificationManager updateObserversForCar:v5];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)int v34 = 0;
        _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Setup audio notification", v34, 2u);
      }

      pid_t v12 = [DBAudioWindow alloc];
      id v13 = [(DBDashboard *)self layoutEngine];
      [v13 notificationWindowFrame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      uint64_t v22 = NSString;
      char v23 = [(DBDashboard *)self displayConfiguration];
      uint64_t v24 = [v23 identity];
      char v25 = [v22 stringWithFormat:@"audioWindow-%@", v24];
      BOOL v26 = (DBAudioWindow *)-[DBAudioWindow _initWithFrame:debugName:windowScene:](v12, "_initWithFrame:debugName:windowScene:", v25, self->_windowScene, v15, v17, v19, v21);
      audioWindow = self->_audioWindow;
      self->_audioWindow = v26;

      [(DBAudioWindow *)self->_audioWindow setWindowLevel:*MEMORY[0x263F83C58] + 10.0];
      BOOL v28 = [[_TtC9DashBoard33DBAudioNotificationViewController alloc] initWithEnvironment:self];
      audioViewController = self->_audioViewController;
      self->_audioViewController = v28;

      [(DBRootStatusBarViewController *)self->_driverStatusBarViewController setAudioNotificationViewController:self->_audioViewController];
      [(DBAudioWindow *)self->_audioWindow setRootViewController:self->_audioViewController];
      [(DBAudioWindow *)self->_audioWindow setHidden:1];
      BOOL v30 = [[DBAudioNotificationManager alloc] initWithWindow:self->_audioWindow viewController:self->_audioViewController car:v5];
      double v31 = self->_audioNotificationManager;
      self->_audioNotificationManager = v30;
    }
  }
  else
  {
    int v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v32 = 0;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Car not ready for audio notification manager", v32, 2u);
    }
  }
  [(DBDashboard *)self _updateCameraObserverForCar:v5];
  if ([v5 hasAccessoryType:*MEMORY[0x263F30938]]) {
    [(DBDashboard *)self _setupClimateOverlayIfNeeded];
  }
}

- (void)_setupClimateOverlayIfNeeded
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (self->_climateWindow) {
    BOOL v3 = self->_climateViewController != 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (self->_driverStatusBarViewController
    && !v3
    && ([(DBDashboard *)self environmentConfiguration],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isVehicleDataSession],
        v4,
        (v5 & 1) != 0))
  {
    if ([(DBEnvironmentConfiguration *)self->_environmentConfiguration hasDualStatusBar]
      || ([(DBDashboard *)self environmentConfiguration],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 currentStatusBarEdge],
          v6,
          (v7 & 0xFFFFFFFFFFFFFFFDLL) == 1))
    {
      id v8 = DBLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Setup climate overlay", (uint8_t *)&buf, 2u);
      }

      id v9 = [DBClimateWindow alloc];
      BOOL v10 = [(DBDashboard *)self layoutEngine];
      [v10 climateWindowFrame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v19 = NSString;
      double v20 = [(DBDashboard *)self displayConfiguration];
      double v21 = [v20 identity];
      uint64_t v22 = [v19 stringWithFormat:@"climateWindow-%@", v21];
      char v23 = (DBClimateWindow *)-[DBClimateWindow _initWithFrame:debugName:windowScene:](v9, "_initWithFrame:debugName:windowScene:", v22, self->_windowScene, v12, v14, v16, v18);
      climateWindow = self->_climateWindow;
      self->_climateWindow = v23;

      [(DBClimateWindow *)self->_climateWindow setWindowLevel:*MEMORY[0x263F83C58] + 6.0];
      objc_initWeak(&buf, self);
      char v25 = [_TtC9DashBoard23DBClimateViewController alloc];
      BOOL v26 = [(DBDashboard *)self layoutEngine];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __43__DBDashboard__setupClimateOverlayIfNeeded__block_invoke;
      v32[3] = &unk_2649B4A30;
      objc_copyWeak(&v33, &buf);
      double v27 = [(DBClimateViewController *)v25 initWithEnvironment:self layoutEngine:v26 didUpdateInsets:v32];
      climateViewController = self->_climateViewController;
      self->_climateViewController = v27;

      [(DBClimateWindow *)self->_climateWindow setRootViewController:self->_climateViewController];
      [(DBClimateWindow *)self->_climateWindow setHidden:0];
      [(DBRootStatusBarViewController *)self->_driverStatusBarViewController setClimateViewController:self->_climateViewController];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    uint64_t v29 = DBLogForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v30 = self->_driverStatusBarViewController != 0;
      double v31 = [(DBDashboard *)self environmentConfiguration];
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v30;
      __int16 v35 = 1024;
      BOOL v36 = v3;
      __int16 v37 = 1024;
      int v38 = [v31 isVehicleDataSession];
      _os_log_impl(&dword_22D6F0000, v29, OS_LOG_TYPE_DEFAULT, "Can't setup climate overlay, is statusBar set: %d, is overlay set: %d, is IH session: %d", (uint8_t *)&buf, 0x14u);
    }
  }
}

void __43__DBDashboard__setupClimateOverlayIfNeeded__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained driverStatusBarViewController];
  objc_msgSend(v9, "setExtraSafeAreaInsets:", a2, a3, a4, a5);
}

- (void)_updateCameraObserverForCar:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = DBLogForCategory(0x15uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DBDashboard *)self camera];
    uint64_t v7 = [v4 automakerExteriorCamera];
    id v8 = [v7 cameraGeneral];
    int v18 = 136315906;
    double v19 = "-[DBDashboard _updateCameraObserverForCar:]";
    __int16 v20 = 2112;
    double v21 = v6;
    __int16 v22 = 2112;
    char v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "%s replacing self.cameraGeneral=%@ with car.cameraGeneral=%@ car=%@", (uint8_t *)&v18, 0x2Au);
  }
  id v9 = [(DBDashboard *)self camera];
  [v9 unregisterObserver:self];

  BOOL v10 = [v4 automakerExteriorCamera];
  double v11 = [v10 cameraGeneral];
  [(DBDashboard *)self setCamera:v11];

  double v12 = [(DBDashboard *)self camera];
  [v12 registerObserver:self];

  double v13 = [(DBDashboard *)self camera];

  if (v13)
  {
    double v14 = [(DBDashboard *)self camera];
    double v15 = [(DBDashboard *)self camera];
    -[DBDashboard cameraGeneralService:didUpdateOn:](self, "cameraGeneralService:didUpdateOn:", v14, [v15 on]);
  }
  else
  {
    double v16 = DBLogForCategory(0x15uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [(DBDashboard *)self cameraWindow];
      int v18 = 136315394;
      double v19 = "-[DBDashboard _updateCameraObserverForCar:]";
      __int16 v20 = 2048;
      double v21 = v17;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "%s hiding camera window (%p)", (uint8_t *)&v18, 0x16u);
    }
    double v14 = [(DBDashboard *)self cameraWindow];
    [v14 setHidden:1];
  }
}

- (void)_showBackupCameraApp
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_cameraViewController && !self->_cameraWindow)
  {
    BOOL v3 = [DBCameraWindow alloc];
    id v4 = [(DBDashboard *)self layoutEngine];
    [v4 cameraWindowFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = NSString;
    double v14 = [(DBDashboard *)self displayConfiguration];
    double v15 = [v14 identity];
    double v16 = [v13 stringWithFormat:@"cameraWindow-%@", v15];
    double v17 = (DBCameraWindow *)-[DBCameraWindow _initWithFrame:debugName:windowScene:](v3, "_initWithFrame:debugName:windowScene:", v16, self->_windowScene, v6, v8, v10, v12);
    cameraWindow = self->_cameraWindow;
    self->_cameraWindow = v17;

    [(DBCameraWindow *)self->_cameraWindow setWindowLevel:*MEMORY[0x263F83C58] + 100.0];
    double v19 = [[_TtC9DashBoard22DBCameraViewController alloc] initWithEnvironment:self];
    cameraViewController = self->_cameraViewController;
    self->_cameraViewController = v19;

    double v21 = self->_cameraWindow;
    __int16 v22 = [(DBDashboard *)self cameraViewController];
    [(DBCameraWindow *)v21 setRootViewController:v22];
  }
  char v23 = DBLogForCategory(0x15uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = self->_cameraWindow;
    *(_DWORD *)id buf = 136315394;
    double v27 = "-[DBDashboard _showBackupCameraApp]";
    __int16 v28 = 2048;
    uint64_t v29 = v24;
    _os_log_impl(&dword_22D6F0000, v23, OS_LOG_TYPE_DEFAULT, "%s showing camera window (%p)", buf, 0x16u);
  }

  id v25 = [(DBDashboard *)self cameraWindow];
  [v25 setHidden:0];
}

- (void)carManager:(id)a3 didUpdateAccessories:(id)a4
{
}

- (void)cameraGeneralService:(id)a3 didUpdateOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v6 = (DBCameraWindow *)a3;
  double v7 = DBLogForCategory(0x15uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = @"NO";
    int v12 = 136315650;
    double v13 = "-[DBDashboard cameraGeneralService:didUpdateOn:]";
    __int16 v14 = 2112;
    double v15 = v6;
    if (v4) {
      double v8 = @"YES";
    }
    __int16 v16 = 2112;
    double v17 = v8;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "%s service=%@ on=%@", (uint8_t *)&v12, 0x20u);
  }

  if (v4)
  {
    [(DBDashboard *)self _showBackupCameraApp];
  }
  else
  {
    double v9 = DBLogForCategory(0x15uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      cameraWindow = self->_cameraWindow;
      int v12 = 136315394;
      double v13 = "-[DBDashboard cameraGeneralService:didUpdateOn:]";
      __int16 v14 = 2048;
      double v15 = cameraWindow;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "%s hiding camera window (%p)", (uint8_t *)&v12, 0x16u);
    }

    double v11 = [(DBDashboard *)self cameraWindow];
    [v11 setHidden:1];
  }
}

- (void)volumeNotificationServiceUpdated:(id)a3
{
  BOOL v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Volume notification service updated", v5, 2u);
  }

  [(DBDashboard *)self _updateAudioNotificationBlocker];
}

- (void)_updateAudioNotificationBlocker
{
  BOOL v3 = [(DBDashboard *)self workspace];
  BOOL v4 = [v3 state];
  id v8 = [v4 activeBundleIdentifier];

  double v5 = [(DBDashboard *)self volumeNotificationService];
  uint64_t v6 = [v5 isNotificationBlockedForBundleIdentifier:v8];

  double v7 = [(DBDashboard *)self audioNotificationManager];
  [v7 setShouldSuspendNotification:v6];
}

- (void)punchThroughService:(id)a3 presentPunchThroughWithIdentifier:(id)a4
{
}

- (void)punchThroughService:(id)a3 dismissPunchThroughWithIdentifier:(id)a4
{
}

- (FBSDisplayIdentity)displayIdentity
{
  id v2 = [(DBDashboard *)self displayConfiguration];
  BOOL v3 = [v2 identity];

  return (FBSDisplayIdentity *)v3;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  id v2 = [(DBDashboard *)self environmentConfiguration];
  BOOL v3 = [v2 displayConfiguration];

  return (FBSDisplayConfiguration *)v3;
}

- (CRSIconLayoutVehicleDataProviding)iconLayoutDataProvider
{
  id v2 = [(DBDashboard *)self rootViewController];
  BOOL v3 = [v2 iconLayoutDataProvider];

  return (CRSIconLayoutVehicleDataProviding *)v3;
}

- (id)sceneIdentifierForApplication:(id)a3
{
  id v4 = a3;
  double v5 = [v4 appPolicy];
  if ([v5 launchUsingTemplateUI])
  {
    uint64_t v6 = NSString;
    double v7 = [(DBDashboard *)self displayIdentity];
    id v8 = DBTemplateUIHostBundleIdentifier;
LABEL_7:
    double v11 = *v8;
    int v12 = [v4 bundleIdentifier];
    [v6 stringWithFormat:@"%@:%@:%@", v7, v11, v12];
    goto LABEL_8;
  }
  if (([v5 launchUsingMusicUIService] & 1) != 0
    || ([v5 isCarPlaySupported] & 1) == 0
    && ([v4 info],
        double v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 supportsBackgroundMode:*MEMORY[0x263F833D0]],
        v9,
        v10))
  {
    uint64_t v6 = NSString;
    double v7 = [(DBDashboard *)self displayIdentity];
    id v8 = DBMusicUIServiceBundleIdentifier;
    goto LABEL_7;
  }
  double v15 = NSString;
  double v7 = [(DBDashboard *)self displayIdentity];
  int v12 = [v4 bundleIdentifier];
  [v15 stringWithFormat:@"%@:%@", v7, v12, v16];
  double v13 = LABEL_8:;

  return v13;
}

- (id)sceneForApplication:(id)a3
{
  id v4 = a3;
  double v5 = [(DBDashboard *)self identifierToAppScenesMap];
  uint64_t v6 = [(DBDashboard *)self sceneIdentifierForApplication:v4];

  double v7 = [v5 objectForKey:v6];

  return v7;
}

- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[DBApplicationController sharedInstance];
  id v9 = [v8 templateUIHostApplication];

  if (v7) {
    BOOL v10 = v9 == v7;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    id v11 = v6;
  }
  else {
    id v11 = v7;
  }
  [(DBDashboard *)self sceneFrameForApplication:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)sceneFrameForApplication:(id)a3
{
  id v4 = a3;
  double v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.CarPlayWallpaper"];

  id v7 = [(DBDashboard *)self layoutEngine];
  id v8 = v7;
  if (v6) {
    [v7 wallpaperWindowFrame];
  }
  else {
    [v7 sceneFrameForApplication:v4];
  }
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[DBApplicationController sharedInstance];
  id v9 = [v8 musicUIServiceApplication];

  if (v9 == v7) {
    id v10 = v7;
  }
  else {
    id v10 = v6;
  }
  [(DBDashboard *)self safeAreaInsetsForApplication:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  id v4 = a3;
  double v5 = [(DBDashboard *)self layoutEngine];
  [v5 safeAreaInsetsForApplication:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (int64_t)sceneInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = [(DBDashboard *)self environmentConfiguration];
  double v6 = [v5 vehicle];
  if (!v6)
  {
    double v7 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard sceneInterfaceStyleForApplication:proxyApplication:]();
    }
  }
  uint64_t v8 = [v6 appearanceModePreference];
  if (v8 == -1)
  {
    double v9 = [v5 session];
    double v10 = [v9 configuration];
    uint64_t v8 = [v10 userInterfaceStyle];

    double v11 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(DBEnvironmentConfiguration *)v8 _effectiveVehicleAppearancePreference];
    }
  }
  double v12 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    uint64_t v21 = v8;
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "InterfaceStylePreference is: %ld", (uint8_t *)&v20, 0xCu);
  }

  double v13 = [v5 themeController];
  int v14 = [v13 requiresDarkAppearanceInEnvironment:self];

  if (v14)
  {
    double v15 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      double v16 = "Theme controller requires dark appearance";
LABEL_17:
      int64_t v17 = 2;
      _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 2u);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v8 == 2)
  {
    double v15 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      double v16 = "Always dark enabled, returning dark style";
      goto LABEL_17;
    }
LABEL_18:
    int64_t v17 = 2;
    goto LABEL_21;
  }
  int64_t v17 = [v5 carUserInterfaceStyle];
  double v15 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = CPUIDescriptionForUserInterfaceStyle();
    int v20 = 138412290;
    uint64_t v21 = (uint64_t)v18;
    _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "Using car user interface style: %@", (uint8_t *)&v20, 0xCu);
  }
LABEL_21:

  return v17;
}

- (int64_t)sceneMapInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4
{
  id v4 = [(DBDashboard *)self environmentConfiguration];
  int64_t v5 = [v4 effectiveMapsUserInterfaceStyle];

  return v5;
}

- (UIEdgeInsets)statusBarInsets
{
  BOOL v3 = [(DBDashboard *)self environmentConfiguration];
  int v4 = [v3 hasDualStatusBar];

  if (v4)
  {
    double v5 = 45.0;
    double v6 = 0.0;
    double v7 = 45.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x263F834E8];
    double v7 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
    double v9 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v10 = [v9 currentStatusBarEdge];

    if (v10 == 1)
    {
      double v6 = v6 + 45.0;
    }
    else
    {
      double v11 = [(DBDashboard *)self environmentConfiguration];
      uint64_t v12 = [v11 currentStatusBarEdge];

      if (v12 == 3)
      {
        double v8 = v8 + 45.0;
      }
      else
      {
        double v13 = [(DBDashboard *)self environmentConfiguration];
        int v14 = [v13 isRightHandDrive];

        if (v14) {
          double v5 = v5 + 45.0;
        }
        else {
          double v7 = v7 + 45.0;
        }
      }
    }
  }
  double v15 = v8;
  double v16 = v7;
  double v17 = v6;
  double v18 = v5;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)applicationForScene:(id)a3
{
  id v4 = a3;
  double v5 = [(DBDashboard *)self identifierToApplicationMap];
  double v6 = [v4 identifier];

  double v7 = [v5 objectForKey:v6];

  return v7;
}

- (DBWorkspace)workspace
{
  return self->_workspace;
}

- (id)focusWindow
{
  return [(DBFocusController *)self->_focusController focusWindow];
}

- (id)systemGestureWindow
{
  BOOL v3 = [MEMORY[0x263F83118] sharedInstance];
  id v4 = [(DBDashboard *)self displayIdentity];
  double v5 = [v3 windowForSystemGesturesForDisplayWithIdentity:v4];

  return v5;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = [(DBDashboard *)self splashScreenAlert];
  [v4 invalidate];

  double v5 = [(DBDashboard *)self rootViewController];
  [v5 invalidate];

  double v6 = [(DBDashboard *)self serviceDomainActivationToken];
  [v6 invalidate];

  double v7 = [(DBDashboard *)self statusBarStyleService];
  [v7 invalidate];

  double v8 = [(DBDashboard *)self wallpaperRootViewController];
  [v8 invalidate];

  double v9 = [(DBDashboard *)self voiceControlViewController];
  [v9 invalidate];

  uint64_t v10 = [(DBDashboard *)self climateViewController];
  [v10 invalidate];

  [(DBDashboard *)self setCamera:0];
  double v11 = [(DBDashboard *)self volumeNotificationService];
  [v11 removeObserver:self];

  uint64_t v12 = [(DBDashboard *)self volumeNotificationServiceDomainActivationToken];
  [v12 invalidate];

  double v13 = [(DBDashboard *)self volumeNotificationService];
  [v13 invalidate];

  [(DBDashboard *)self setVolumeNotificationServiceDomainActivationToken:0];
  int v14 = [(DBDashboard *)self statusBarStyleAssertion];
  [v14 relinquishWithAnimationSettings:0];

  double v15 = [(DBDashboard *)self statusBarStyleAssertion];
  [v15 invalidate];

  [(DBDashboard *)self setStatusBarStyleAssertion:0];
  double v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v16 removeObserver:self forKeyPath:@"CARCornerRadius"];

  double v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  double v19 = [(DBDashboard *)self environmentConfiguration];
  int v20 = [v19 session];
  [v20 removeObserver:self];

  uint64_t v21 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v22 = [v21 thermalMonitor];
  [v22 removeObserver:self];

  double v23 = [(DBDashboard *)self environmentConfiguration];
  __int16 v24 = [v23 appHistory];
  [v24 _sessionDidDisconnect];

  id v25 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v26 = [v25 analytics];
  [v26 invalidate];

  double v27 = [(DBDashboard *)self userAlertServer];
  [v27 invalidate];

  __int16 v28 = [(DBDashboard *)self punchThroughServiceDomainActivationToken];
  [v28 invalidate];

  [(DBDashboard *)self setPunchThroughServiceDomainActivationToken:0];
  uint64_t v29 = [(DBDashboard *)self punchThroughService];
  [v29 invalidate];

  [(DBDashboard *)self setPunchThroughService:0];
  uint64_t v30 = [(DBDashboardWorkspaceOwner *)self->_workspaceOwner activeBaseApplicationBundleID];

  if (v30)
  {
    double v31 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v32 = [(DBDashboardWorkspaceOwner *)self->_workspaceOwner activeBaseApplicationBundleID];
    [v31 setObject:v32 forKey:@"CARStartApplicationBundleID"];
  }
  workspace = self->_workspace;
  int v34 = [(DBDashboard *)self environmentConfiguration];
  __int16 v35 = [v34 appHistory];
  [(DBWorkspace *)workspace removeObserver:v35];

  dashboardStateProvider = self->_dashboardStateProvider;
  __int16 v37 = [(DBDashboard *)self environmentConfiguration];
  int v38 = [v37 analytics];
  [(DBDashboardStateProvider *)dashboardStateProvider removeObserver:v38];

  uint64_t v39 = self->_dashboardStateProvider;
  long long v40 = [(DBDashboard *)self voiceControlViewController];
  [(DBDashboardStateProvider *)v39 removeObserver:v40];

  [(DBDashboardWorkspaceOwner *)self->_workspaceOwner invalidate];
  [(DBNotificationViewController *)self->_notificationViewController invalidate];
  notificationViewController = self->_notificationViewController;
  self->_notificationViewController = 0;

  long long v42 = [MEMORY[0x263F3F4F0] sharedInstance];
  long long v43 = (void *)[(NSMutableDictionary *)self->_identifierToAppScenesMap copy];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __25__DBDashboard_invalidate__block_invoke;
  v69[3] = &unk_2649B4A78;
  id v44 = v42;
  id v70 = v44;
  [v43 enumerateKeysAndObjectsUsingBlock:v69];

  long long v45 = [v44 sceneWithIdentifier:@"com.apple.CarPlayApp.url-delivery"];

  if (v45) {
    [v44 destroyScene:@"com.apple.CarPlayApp.url-delivery" withTransitionContext:0];
  }
  [(UIWindow *)self->_interestingWindow setHidden:1];
  interestingWindow = self->_interestingWindow;
  self->_interestingWindow = 0;

  [(UIWindow *)self->_mainWindow setHidden:1];
  mainWindow = self->_mainWindow;
  self->_mainWindow = 0;

  [(DBLocalSceneHostWindow *)self->_wallpaperHostWindow invalidate];
  [(DBWallpaperHostWindow *)self->_wallpaperHostWindow setHidden:1];
  wallpaperHostWindow = self->_wallpaperHostWindow;
  self->_wallpaperHostWindow = 0;

  [(DBWallpaperWindow *)self->_wallpaperWindow setHidden:1];
  wallpaperWindow = self->_wallpaperWindow;
  self->_wallpaperWindow = 0;

  [(DBLocalSceneHostWindow *)self->_statusBarHostWindow invalidate];
  [(DBStatusBarHostWindow *)self->_statusBarHostWindow setHidden:1];
  statusBarHostWindow = self->_statusBarHostWindow;
  self->_statusBarHostWindow = 0;

  [(DBStatusBarWindow *)self->_driverStatusBarWindow setHidden:1];
  driverStatusBarWindow = self->_driverStatusBarWindow;
  self->_driverStatusBarWindow = 0;

  driverStatusBarViewController = self->_driverStatusBarViewController;
  self->_driverStatusBarViewController = 0;

  [(DBStatusBarWindow *)self->_passengerStatusBarWindow setHidden:1];
  passengerStatusBarWindow = self->_passengerStatusBarWindow;
  self->_passengerStatusBarWindow = 0;

  passengerStatusBarViewController = self->_passengerStatusBarViewController;
  self->_passengerStatusBarViewController = 0;

  [(DBClimateWindow *)self->_climateWindow setHidden:1];
  climateWindow = self->_climateWindow;
  self->_climateWindow = 0;

  climateViewController = self->_climateViewController;
  self->_climateViewController = 0;

  [(DBLockOutController *)self->_lockOutController invalidate];
  lockOutController = self->_lockOutController;
  self->_lockOutController = 0;

  [(DBNotificationWindow *)self->_notificationWindow setHidden:1];
  notificationWindow = self->_notificationWindow;
  self->_notificationWindow = 0;

  [(DBSiriViewController *)self->_siriViewController setPaired:0];
  [(SiriLongPressButtonSource *)self->_siriButtonSource invalidate];
  [(SiriDirectActionSource *)self->_siriDirectActionSource invalidate];
  [(DBFocusController *)self->_focusController invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertion invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertionACBack invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertionACHome invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertionACSelect invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertionTelephonyDrop invalidate];
  [(BSInvalidatable *)self->_dispatchingAssertionRinger invalidate];
  [(RBSProcessMonitor *)self->_templateAppProcessMonitor invalidate];
  id v59 = [MEMORY[0x263F312E8] sharedInstance];
  [v59 removeObserver:self];

  windowScene = self->_windowScene;
  self->_windowScene = 0;

  v61 = DBLogForCategory(0);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v68 = 0;
    _os_log_impl(&dword_22D6F0000, v61, OS_LOG_TYPE_DEFAULT, "Invalidating preventPasscodeLockToken", v68, 2u);
  }

  v62 = [(DBDashboard *)self preventPasscodeLockToken];
  [v62 invalidate];

  [(DBDashboard *)self setPreventPasscodeLockToken:0];
  id v63 = DBLogForCategory(0);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v68 = 0;
    _os_log_impl(&dword_22D6F0000, v63, OS_LOG_TYPE_DEFAULT, "Invalidating preventSpuriousScreenUndimToken", v68, 2u);
  }

  v64 = [(DBDashboard *)self preventSpuriousScreenUndimToken];
  [v64 invalidate];

  [(DBDashboard *)self setPreventSpuriousScreenUndimToken:0];
  uint64_t v65 = DBLogForCategory(0);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v68 = 0;
    _os_log_impl(&dword_22D6F0000, v65, OS_LOG_TYPE_DEFAULT, "Invalidating OEM layout element", v68, 2u);
  }

  double v66 = [(DBDashboard *)self oemScreenLayoutElementAssertion];
  [v66 invalidate];

  [(DBDashboard *)self setOemScreenLayoutElementAssertion:0];
  int connectedNotifyToken = self->_connectedNotifyToken;
  if (connectedNotifyToken != -1)
  {
    notify_set_state(connectedNotifyToken, 0);
    notify_post("com.apple.carplay.connected");
  }
  self->_int connectedNotifyToken = -1;
}

void __25__DBDashboard_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  double v6 = [v5 workspaceIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.siri"];

  if ((v7 & 1) == 0)
  {
    [v5 updateSettingsWithBlock:&__block_literal_global_564];
    [*(id *)(a1 + 32) destroyScene:v8 withTransitionContext:0];
  }
}

uint64_t __25__DBDashboard_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (BOOL)shouldDisableFiveRowKeyboards
{
  BOOL v3 = [(DBDashboard *)self environmentConfiguration];
  id v4 = [v3 session];
  id v5 = [v4 configuration];
  double v6 = [v5 screens];
  char v7 = [v6 firstObject];
  [v7 physicalSize];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(DBDashboard *)self environmentConfiguration];
  double v13 = [v12 displayConfiguration];
  [v13 pixelSize];
  double v15 = v14;
  double v17 = v16;

  double v18 = [(DBDashboard *)self environmentConfiguration];
  [v18 screenScale];
  double v20 = v19;

  return DBFiveRowKeyboardKeySizeTooSmall(v9, v11, v15, v17, v20);
}

- (void)handleEvent:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 type])
  {
    case 1:
      id v5 = DBLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_INFO, "Taking screen for home event", v25, 2u);
      }

      double v6 = [(DBDashboard *)self environmentConfiguration];
      char v7 = [v6 session];
      [v7 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"User activated home"];

      [(DBDashboard *)self _handleHomeEvent:v4];
      goto LABEL_33;
    case 3:
      double v8 = [(DBDashboard *)self focusController];
      [v8 dropReason:@"statusbar"];

      goto LABEL_33;
    case 4:
      [(DBDashboard *)self _handleOpenApplicationEvent:v4];
      goto LABEL_33;
    case 5:
      double v9 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
      [(DBMutableWorkspaceStateChangeRequest *)v9 activateSiri];
      double v10 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Requesting Siri activation", v25, 2u);
      }

      [(DBWorkspace *)self->_workspace requestStateChange:v9];
      break;
    case 6:
      [(DBDashboard *)self _handleTapToRadarEvent];
      goto LABEL_33;
    case 7:
      double v11 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "CarPlay radar item long-pressed, gathering screenshots.", v25, 2u);
      }

      uint64_t v12 = (void *)MEMORY[0x263EFFA08];
      double v13 = [MEMORY[0x263F3F430] mainIdentity];
      v26[0] = v13;
      double v14 = [(DBDashboard *)self displayIdentity];
      v26[1] = v14;
      double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
      double v9 = [v12 setWithArray:v15];

      double v16 = [(DBDashboard *)self screenshotManager];
      [v16 saveScreenshotsForDisplayIdentifiers:v9 completion:&__block_literal_global_572];
      goto LABEL_31;
    case 8:
      [(DBDashboard *)self _handleReturnToHomeScreenEvent:v4];
      goto LABEL_33;
    case 9:
      double v17 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_DEFAULT, "Handling OEM notification activation", v25, 2u);
      }

      interruptedPunchthroughIdentifier = self->_interruptedPunchthroughIdentifier;
      self->_interruptedPunchthroughIdentifier = 0;

      objc_opt_class();
      id v19 = [v4 context];
      if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
        double v9 = (DBMutableWorkspaceStateChangeRequest *)v19;
      }
      else {
        double v9 = 0;
      }

      if (v9)
      {
        [(DBDashboard *)self _handleOEMNotificationURL:v9];
      }
      else
      {
        double v16 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[DBDashboard handleEvent:]();
        }
LABEL_31:
      }
      break;
    case 10:
      [(DBDashboard *)self _handleInterruptPunchthroughEvent:v4];
      goto LABEL_33;
    case 11:
      double v20 = [(DBDashboard *)self nowPlayingObserver];
      double v9 = [v20 nowPlayingLaunchInfoWithSource:0];

      uint64_t v21 = [v4 context];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_24;
      }
      uint64_t v22 = [v4 context];
      int v23 = [v22 isEqualToNumber:&unk_26E17EB28];

      if (v23)
      {
        uint64_t v21 = [(DBMutableWorkspaceStateChangeRequest *)v9 activationSettings];
        [v21 setLaunchSource:4];
LABEL_24:
      }
      __int16 v24 = +[DBEvent eventWithType:4 context:v9];
      [(DBDashboard *)self _handleOpenApplicationEvent:v24];

      break;
    default:
      goto LABEL_33;
  }

LABEL_33:
}

void __27__DBDashboard_handleEvent___block_invoke()
{
  os_log_t v0 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEFAULT, "Finished saving screenshots.", v1, 2u);
  }
}

- (void)inCallAssertionServiceDidPresent:(id)a3
{
  id v4 = [(DBDashboard *)self lockOutController];
  char v5 = [v4 isLockedOut];

  if (v5)
  {
    double v6 = DBLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v17 = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Pending InCall activation until after lock out", v17, 2u);
    }

    [(DBDashboard *)self setPendingInCallServiceActivation:1];
  }
  else
  {
    char v7 = +[DBApplicationController sharedInstance];
    double v8 = [v7 inCallServiceApplication];

    double v9 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    double v10 = v9;
    if (v8)
    {
      [(DBMutableWorkspaceStateChangeRequest *)v9 activateStackedApplication:v8];
    }
    else
    {
      double v11 = DBLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DBDashboard inCallAssertionServiceDidPresent:]();
      }
    }
    [(DBWorkspace *)self->_workspace requestStateChange:v10];
    uint64_t v12 = DBLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Borrowing screen for InCall", buf, 2u);
    }

    double v13 = [(DBDashboard *)self activeCallScreenBorrowToken];

    if (v13)
    {
      double v14 = DBLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v18 = 0;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Using existing screen borrow token for InCall", v18, 2u);
      }
    }
    else
    {
      double v14 = [(DBDashboard *)self environmentConfiguration];
      double v15 = [v14 session];
      double v16 = [v15 borrowScreenForClient:@"CarPlayApp" reason:@"InCall"];
      [(DBDashboard *)self setActiveCallScreenBorrowToken:v16];
    }
  }
}

- (void)inCallAssertionServiceDidDismiss:(id)a3
{
  id v4 = +[DBApplicationController sharedInstance];
  char v5 = [v4 inCallServiceApplication];

  double v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  char v7 = v6;
  if (v5) {
    [(DBMutableWorkspaceStateChangeRequest *)v6 deactivateApplication:v5];
  }
  [(DBWorkspace *)self->_workspace requestStateChange:v7];
  double v8 = [(DBDashboard *)self activeCallScreenBorrowToken];

  if (v8)
  {
    double v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Unborrowing screen for InCall", v10, 2u);
    }

    [(DBDashboard *)self setActiveCallScreenBorrowToken:0];
  }
}

- (void)inCallAssertionService:(id)a3 didSetBannersEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = @"DISABLED";
    if (v4) {
      char v7 = @"ENABLED";
    }
    int v9 = 138412290;
    double v10 = v7;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Setting banners %@ for InCallService", (uint8_t *)&v9, 0xCu);
  }

  double v8 = [(DBDashboard *)self notificationViewController];
  [v8 setSuspended:!v4 forReason:@"InCallService"];
}

- (id)wallpaperViewForLockOutController:(id)a3
{
  BOOL v3 = [(DBDashboard *)self wallpaperHostWindow];
  BOOL v4 = [v3 createAdditionalPresentationView];

  return v4;
}

- (void)lockOutController:(id)a3 didChangeFromLockoutMode:(int64_t)a4 toLockOutMode:(int64_t)a5 animated:(BOOL)a6 takeScreen:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v83 = a3;
  uint64_t v11 = [(DBDashboard *)self lockOutController];
  uint64_t v12 = [v11 isLockedOut];

  double v13 = [(DBDashboard *)self siriViewController];
  [v13 setPaired:v12 ^ 1];

  double v14 = [(DBDashboard *)self driverStatusBarWindow];
  [v14 setHidden:v12];

  double v15 = [(DBDashboard *)self passengerStatusBarWindow];
  [v15 setHidden:v12];

  double v16 = [(DBDashboard *)self climateWindow];
  [v16 setHidden:v12];

  double v17 = [(DBDashboard *)self audioWindow];
  [v17 setHidden:a5 == 9];

  double v18 = [(DBDashboard *)self mainWindow];
  [v18 setHidden:v12];

  id v19 = [(DBDashboard *)self notificationWindow];
  [v19 setHidden:v12];

  double v20 = [(DBDashboard *)self notificationViewController];
  [v20 setSuspended:v12 forReason:@"Locked out"];

  os_unfair_lock_lock(&self->_lock);
  BOOL lock_hasPendingRequestUITake = self->_lock_hasPendingRequestUITake;
  self->_BOOL lock_hasPendingRequestUITake = 0;
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v21 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v22 = [v21 session];

  if (!v12)
  {
    id v25 = [(DBDashboard *)self focusController];
    [v25 dropReason:@"lockout"];

    uint64_t v26 = [(DBDashboard *)self rootViewController];
    double v27 = [v26 homeViewController];
    __int16 v28 = [v27 todayViewController];
    [v28 setSmartWidgetCanChangeVisibilityDisabled:1 forRequester:@"DBConnectAnimationRequester"];

    uint64_t v29 = [(DBDashboard *)self rootViewController];
    uint64_t v30 = [v29 homeViewController];
    double v31 = [v30 todayViewController];
    [v31 setSceneWidgetsDisabled:1 forRequester:@"DBConnectAnimationRequester"];

    int v32 = [(DBDashboard *)self rootViewController];
    id v33 = [v32 homeViewController];
    int v34 = [v33 todayViewController];
    [v34 setSmartWidgetCanChangeVisibilityDisabled:0 forRequester:@"DBTodayViewSetupRequester"];

    __int16 v35 = [MEMORY[0x263EFFA40] standardUserDefaults];
    BOOL v36 = [v35 objectForKey:@"CARStartApplicationBundleID"];

    if (!v36)
    {
      if (![(DBDashboard *)self pendingInCallServiceActivation])
      {
        [(DBDashboard *)self setPendingInCallServiceActivation:0];
        goto LABEL_38;
      }
      goto LABEL_33;
    }
    __int16 v37 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138543362;
      v96 = v36;
      _os_log_impl(&dword_22D6F0000, v37, OS_LOG_TYPE_INFO, "Evaluating active app %{public}@ from previous session", buf, 0xCu);
    }

    int v38 = +[DBApplicationController sharedInstance];
    uint64_t v39 = [v38 applicationWithBundleIdentifier:v36];

    if (!v39)
    {
      int v46 = 0;
      id v47 = 0;
      goto LABEL_31;
    }
    long long v40 = [(DBDashboard *)self rootViewController];
    id v41 = [v40 homeViewController];

    v81 = [v41 iconForIdentifier:v36];
    long long v42 = +[DBApplicationController sharedInstance];
    int v43 = [v42 preflightRequiredForApplication:v39];

    if (v43)
    {
      DBLogForCategory(6uLL);
      id v44 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v44->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        v96 = v36;
        long long v45 = "Requested previous session app %{public}@ requires preflight; ignoring.";
LABEL_28:
        _os_log_impl(&dword_22D6F0000, &v44->super, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (!v81 || ([v41 isIconVisible:v81] & 1) == 0)
    {
      DBLogForCategory(6uLL);
      id v44 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v44->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        v96 = v36;
        long long v45 = "Requested previous session app %@ is not valid for current session; ignoring.";
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    uint64_t v48 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v49 = [v48 appHistory];
    BOOL v50 = [v49 appDockCategoryForBundleIdentifier:v36] == 2;

    if (v50)
    {
      DBLogForCategory(6uLL);
      id v44 = (DBActivationSettings *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v44->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        v96 = v36;
        long long v45 = "Requested previous session app %{public}@ is an audio app; ignoring.";
        goto LABEL_28;
      }
LABEL_29:
      int v46 = 0;
      id v47 = 0;
LABEL_30:

LABEL_31:
      v60 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v60 removeObjectForKey:@"CARStartApplicationBundleID"];

      if (![(DBDashboard *)self pendingInCallServiceActivation])
      {
        char v64 = 0;
LABEL_36:
        [(DBDashboard *)self setPendingInCallServiceActivation:0];
        if (v47)
        {
          objc_initWeak((id *)buf, self);
          uint64_t v65 = [(DBDashboard *)self mainWindow];
          [v65 setHidden:1];

          double v66 = [(DBDashboard *)self statusBarHostWindow];
          [v66 setHidden:1];

          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke_589;
          v84[3] = &unk_2649B4AC0;
          objc_copyWeak(&v86, (id *)buf);
          BOOL v87 = v7;
          BOOL v88 = lock_hasPendingRequestUITake;
          id v85 = v22;
          char v89 = v64;
          [(DBWorkspaceStateChangeRequest *)v47 setCompletionHandler:v84];
          kdebug_trace();
          double v67 = [(DBDashboard *)self workspace];
          [v67 requestStateChange:v47];

          objc_destroyWeak(&v86);
          objc_destroyWeak((id *)buf);

LABEL_47:
          goto LABEL_48;
        }
LABEL_38:
        if (v7)
        {
          double v68 = DBLogForCategory(0);
          BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
          if (lock_hasPendingRequestUITake)
          {
            if (v69)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_22D6F0000, v68, OS_LOG_TYPE_DEFAULT, "Taking screen for connection (requestUI), animating to home screen", buf, 2u);
            }

            [v22 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"iOS UI requested"];
          }
          else
          {
            if (v69)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_22D6F0000, v68, OS_LOG_TYPE_DEFAULT, "Taking screen for connection, animating to home screen", buf, 2u);
            }

            [v22 takeScreenForConnection];
          }
        }
        [(DBDashboard *)self _animateStartupToHomeScreen];
        goto LABEL_47;
      }
      if (v47)
      {
LABEL_34:
        v61 = objc_alloc_init(DBActivationSettings);
        [(DBActivationSettings *)v61 setAnimated:0];
        [(DBActivationSettings *)v61 setWaitForCommit:1];
        v62 = +[DBApplicationController sharedInstance];
        id v63 = [v62 inCallServiceApplication];

        [(DBMutableWorkspaceStateChangeRequest *)v47 activateStackedApplication:v63 withSettings:v61];
        char v64 = 1;
        goto LABEL_36;
      }
LABEL_33:
      id v47 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
      goto LABEL_34;
    }
    id v44 = objc_alloc_init(DBActivationSettings);
    [(DBActivationSettings *)v44 setAnimated:0];
    [(DBActivationSettings *)v44 setWaitForCommit:1];
    [(DBActivationSettings *)v44 setFailInterval:3.5];
    id v47 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v47 activateApplication:v39 withSettings:v44];
    CGFloat v80 = [v39 appPolicy];
    int v46 = +[DBAppHistory contextForApplicationCategory:](DBAppHistory, "contextForApplicationCategory:", [v80 applicationCategory]);
    if (v46)
    {
      os_log_t loga = [(DBDashboard *)self environmentConfiguration];
      CGFloat v76 = [loga appHistory];
      double v75 = [v76 sessionAppContextURLs];
      int v74 = [v75 containsObject:v46];

      if (v74)
      {
        os_log_t logb = [(DBDashboard *)self environmentConfiguration];
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke_588;
        v90[3] = &unk_2649B48C0;
        id v91 = v46;
        id v92 = v22;
        [logb fetchEnhancedIntegrationStatusWithCompletion:v90];

        id v70 = v91;
LABEL_58:

        goto LABEL_30;
      }
      log = DBLogForCategory(0);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        v96 = v46;
        double v71 = "Accessory does not support starting UIContext %{public}@";
        CGFloat v72 = log;
        uint32_t v73 = 12;
        goto LABEL_56;
      }
    }
    else
    {
      log = DBLogForCategory(0);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        double v71 = "No available UIContext for starting application.";
        CGFloat v72 = log;
        uint32_t v73 = 2;
LABEL_56:
        _os_log_impl(&dword_22D6F0000, v72, OS_LOG_TYPE_DEFAULT, v71, buf, v73);
      }
    }
    id v70 = log;
    goto LABEL_58;
  }
  if (v7)
  {
    int v23 = DBLogForCategory(0);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (lock_hasPendingRequestUITake)
    {
      if (v24)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v23, OS_LOG_TYPE_DEFAULT, "Taking screen for connection (requestUI), to lockout", buf, 2u);
      }

      [v22 takeScreenForClient:@"CarPlayApp" reason:@"iOS UI requested"];
    }
    else
    {
      if (v24)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v23, OS_LOG_TYPE_DEFAULT, "Taking screen for connection, to lockout", buf, 2u);
      }

      [v22 takeScreenForConnection];
    }
  }
  v51 = [(DBDashboard *)self lockOutController];
  double v52 = [v51 lockOutWindow];
  [v52 setHidden:0];

  objc_initWeak((id *)buf, self);
  v53 = [(DBDashboard *)self lockOutController];
  double v54 = [v53 lockOutViewController];
  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke;
  void v93[3] = &unk_2649B4738;
  objc_copyWeak(&v94, (id *)buf);
  [v54 setLockOutMode:a5 animated:v8 completion:v93];

  v55 = [(DBDashboard *)self _dashboardScene];
  double v56 = [(DBDashboard *)self focusController];
  v57 = [(DBDashboard *)self lockOutController];
  v58 = [v57 lockOutWindow];
  id v59 = FBSystemAppBundleID();
  [v56 takeWithPriority:@"lockout" reason:v58 forWindow:v59 bundleIdentifier:getpid() pid:v55 scene:7.0];

  objc_destroyWeak(&v94);
  objc_destroyWeak((id *)buf);
LABEL_48:
}

void __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained lockOutController];
  id v2 = [v1 lockOutWindow];

  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x263F82758];
    BOOL v4 = [WeakRetained lockOutController];
    char v5 = [v4 lockOutWindow];
    double v6 = [v3 focusSystemForEnvironment:v5];
    [v6 setNeedsFocusUpdate];
  }
}

void __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke_588(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = DBLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2 == 2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)id buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Notifying accessory about iOS ownership of starting UIContext %{public}@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void **)(a1 + 40);
    uint64_t v9 = 0x26E13C000;
    uint64_t v10 = v7;
    BOOL v4 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v8 sendCommand:@"changeUIContext" withParameters:v4];
  }
  else if (v5)
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "No enhanced integration consent; not notifying accessory about starting context.",
      buf,
      2u);
  }
}

void __92__DBDashboard_lockOutController_didChangeFromLockoutMode_toLockOutMode_animated_takeScreen___block_invoke_589(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48))
  {
    int v3 = *(unsigned __int8 *)(a1 + 49);
    BOOL v4 = DBLogForCategory(0);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Taking screen for connection (requestUI), animating scaled", buf, 2u);
      }

      [*(id *)(a1 + 32) takeScreenForClient:@"com.apple.CarPlayApp" reason:@"iOS UI requested"];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Taking screen for connection, animating scaled", v9, 2u);
      }

      [*(id *)(a1 + 32) takeScreenForConnection];
    }
  }
  if (*(unsigned char *)(a1 + 50))
  {
    uint64_t v6 = DBLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Borrowing screen for InCall", v8, 2u);
    }

    uint64_t v7 = [*(id *)(a1 + 32) borrowScreenForClient:@"CarPlayApp" reason:@"InCall"];
    [WeakRetained setActiveCallScreenBorrowToken:v7];
  }
  [WeakRetained _animateStartupFromScaledMainWindow];
}

- (void)_handleSiriPrewarmWithTimestamp:(double)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v5 = [(DBDashboard *)self lockOutController];
  int v6 = [v5 isLockedOut];

  if (v6)
  {
    uint64_t v7 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleSiriPrewarmWithTimestamp:](self);
    }
  }
  else
  {
    BOOL v8 = [(DBDashboard *)self siriPrewarmAssertion];

    if (v8)
    {
      uint64_t v9 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[DBDashboard _handleSiriPrewarmWithTimestamp:]();
      }

      uint64_t v10 = [(DBDashboard *)self siriPrewarmAssertion];
      [v10 invalidate];

      [(DBDashboard *)self setSiriPrewarmAssertion:0];
      [(DBDashboard *)self setSiriPrewarmTimestamp:-1.0];
    }
    uint64_t v11 = DBLogForCategory(3uLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (a3 <= -1.0)
    {
      if (v12)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Received Siri prewarm action", (uint8_t *)&v16, 2u);
      }

      uint64_t v13 = [(DBDashboard *)self siriButtonSource];
      uint64_t v14 = [v13 prepareForActivation];
    }
    else
    {
      if (v12)
      {
        int v16 = 134217984;
        double v17 = a3;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Received Siri prewarm action, sending accessory timestamp: %f", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v13 = [(DBDashboard *)self siriButtonSource];
      uint64_t v14 = [v13 prepareForActivationWithTimestamp:a3];
    }
    double v15 = (void *)v14;
    [(DBDashboard *)self setSiriPrewarmAssertion:v14];

    [(DBDashboard *)self setSiriPrewarmTimestamp:a3];
  }
}

- (void)_handleSiriButtonDownWithTimestamp:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v5 = [(DBDashboard *)self lockOutController];
  int v6 = [v5 isLockedOut];

  uint64_t v7 = DBLogForCategory(3uLL);
  BOOL v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleSiriButtonDownWithTimestamp:](self);
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v23 = 0;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Received external Siri button down action", v23, 2u);
  }

  uint64_t v9 = [(DBDashboard *)self siriButtonAssertion];

  if (v9)
  {
    uint64_t v10 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleSiriButtonDownWithTimestamp:]();
    }

    uint64_t v11 = [(DBDashboard *)self siriButtonAssertion];
    [v11 invalidate];

    [(DBDashboard *)self setSiriButtonAssertion:0];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(DBDashboard *)self siriPrewarmTimestamp];
  if (v13 > -1.0)
  {
    [(DBDashboard *)self siriPrewarmTimestamp];
    a3 = v14;
    double v15 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v23 = 134217984;
      *(double *)&v23[4] = a3;
      int v16 = "Using prewarm timestamp: %f";
LABEL_16:
      _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, v16, v23, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (a3 > -1.0)
  {
    double v15 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v23 = 134217984;
      *(double *)&v23[4] = a3;
      int v16 = "Using button down timestamp from accessory: %f";
      goto LABEL_16;
    }
LABEL_17:

    double Current = a3;
  }
  double v17 = [(DBDashboard *)self siriButtonSource];
  uint64_t v18 = [v17 speechInteractionActivityWithTimestamp:Current];
  [(DBDashboard *)self setSiriButtonAssertion:v18];

  id v19 = [(DBDashboard *)self siriPrewarmAssertion];

  if (v19)
  {
    double v20 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v23 = 0;
      _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating Siri prewarm assertion", v23, 2u);
    }

    uint64_t v21 = [(DBDashboard *)self siriPrewarmAssertion];
    [v21 invalidate];

    [(DBDashboard *)self setSiriPrewarmAssertion:0];
  }
  uint64_t v22 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v23 = 0;
    _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Sending Siri long press event", v23, 2u);
  }

  BOOL v8 = [(DBDashboard *)self siriButtonSource];
  [v8 didRecognizeLongPress];
LABEL_25:
}

- (void)_handleSiriButtonUpWithTimestamp:(double)a3
{
  BOOL v4 = [(DBDashboard *)self lockOutController];
  int v5 = [v4 isLockedOut];

  int v6 = DBLogForCategory(3uLL);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard _handleSiriButtonUpWithTimestamp:](self);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Received external Siri button up action", buf, 2u);
    }

    BOOL v8 = [(DBDashboard *)self siriPrewarmAssertion];

    if (v8)
    {
      uint64_t v9 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v14 = 0;
        _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating Siri prewarm assertion", v14, 2u);
      }

      uint64_t v10 = [(DBDashboard *)self siriPrewarmAssertion];
      [v10 invalidate];

      [(DBDashboard *)self setSiriPrewarmAssertion:0];
    }
    uint64_t v11 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_INFO, "Invalidating Siri button down assertion", v13, 2u);
    }

    BOOL v12 = [(DBDashboard *)self siriButtonAssertion];
    [v12 invalidatedAtTimestamp:CFAbsoluteTimeGetCurrent()];

    [(DBDashboard *)self setSiriButtonAssertion:0];
  }
  [(DBDashboard *)self setSiriPrewarmTimestamp:-1.0];
}

- (void)session:(id)a3 handleSiriRequestEvent:(int64_t)a4 withPayload:(id)a5
{
  id v9 = [a5 objectForKey:*MEMORY[0x263F01550]];
  char v7 = objc_opt_respondsToSelector();
  double v8 = -1.0;
  if (v7) {
    objc_msgSend(v9, "doubleValue", -1.0);
  }
  switch(a4)
  {
    case 3:
      [(DBDashboard *)self _handleSiriButtonUpWithTimestamp:v8];
      break;
    case 2:
      [(DBDashboard *)self _handleSiriButtonDownWithTimestamp:v8];
      break;
    case 1:
      [(DBDashboard *)self _handleSiriPrewarmWithTimestamp:v8];
      break;
  }
}

- (void)session:(id)a3 openURL:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [v5 absoluteString];
  char v7 = DBLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    BOOL v12 = v6;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Received openURL request for %@", buf, 0xCu);
  }

  if (v6)
  {
    [(DBDashboard *)self _handleSessionURL:v5];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_hasHandledConnect)
    {
      os_unfair_lock_unlock(&self->_lock);
      double v8 = DBLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Sending requestUI take immediately", buf, 2u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __31__DBDashboard_session_openURL___block_invoke;
      block[3] = &unk_2649B3E90;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      self->_BOOL lock_hasPendingRequestUITake = 1;
      os_unfair_lock_unlock(&self->_lock);
      id v9 = DBLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Deferring requestUI take until connect", buf, 2u);
      }
    }
  }
}

void __31__DBDashboard_session_openURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) environmentConfiguration];
  uint64_t v1 = [v2 session];
  [v1 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"iOS UI requested"];
}

- (void)_launchAppWithInfo:(id)a3 forURL:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 absoluteString];
  id v9 = [v6 application];
  uint64_t v10 = DBLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 bundleIdentifier];
    *(_DWORD *)id buf = 138412290;
    int v38 = v11;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Resolved URL request to %@", buf, 0xCu);
  }
  BOOL v12 = [(DBDashboard *)self activeBundleIdentifier];
  uint64_t v13 = [v9 bundleIdentifier];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    double v15 = [(DBDashboard *)self environmentConfiguration];
    double v27 = [v15 session];

    int v16 = [(DBDashboard *)self environmentConfiguration];
    [v16 appHistory];
    id v17 = v6;
    uint64_t v18 = v9;
    id v19 = v7;
    v21 = double v20 = v8;
    uint64_t v22 = [v21 sessionEchoContextURLs];
    char v23 = [v22 containsObject:v20];

    double v8 = v20;
    id v7 = v19;
    id v9 = v18;
    id v6 = v17;

    uint64_t v24 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __41__DBDashboard__launchAppWithInfo_forURL___block_invoke;
    double v31 = &unk_2649B4AE8;
    id v32 = v27;
    char v36 = v23;
    id v33 = v8;
    int v34 = self;
    id v35 = v7;
    id v25 = v27;
    [v24 fetchEnhancedIntegrationStatusWithCompletion:&v28];
  }
  uint64_t v26 = +[DBEvent eventWithType:context:](DBEvent, "eventWithType:context:", 4, v6, v27, v28, v29, v30, v31);
  [(DBDashboard *)self handleEvent:v26];
}

void __41__DBDashboard__launchAppWithInfo_forURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 != 2)
  {
    uint64_t v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      BOOL v12 = "Enhanced Integration is not enabled; skipping requestUI echo.";
      uint64_t v13 = v11;
      uint32_t v14 = 2;
LABEL_11:
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
LABEL_12:

    [*(id *)(a1 + 32) takeScreenForClient:@"com.apple.CarPlayApp" reason:@"iOS UI requested"];
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = 138543362;
      uint64_t v17 = v15;
      BOOL v12 = "Received Echo Context event %{public}@ for which the accessory did not declare support; dropping.";
      uint64_t v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v6 = [*(id *)(a1 + 48) environmentConfiguration];
  id v7 = [v6 session];
  char v8 = [v7 carOwnsScreen];

  id v9 = DBLogForCategory(0);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Car owns the screen, no requestUI sent.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Requested URL already visible on iOS. Requesting from accessory.", (uint8_t *)&v16, 2u);
    }

    [*(id *)(a1 + 32) requestCarUIForURL:*(void *)(a1 + 56)];
  }
LABEL_13:
}

- (void)_handleSessionURL:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 absoluteString];
  uint64_t v70 = 0;
  double v71 = &v70;
  uint64_t v72 = 0x3032000000;
  uint32_t v73 = __Block_byref_object_copy__1;
  int v74 = __Block_byref_object_dispose__1;
  id v75 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  double v67 = __Block_byref_object_copy__1;
  double v68 = __Block_byref_object_dispose__1;
  id v69 = 0;
  id v6 = [(DBDashboard *)self rootViewController];
  v53 = [v6 homeViewController];

  id v7 = objc_alloc_init(DBActivationSettings);
  char v8 = [(DBDashboard *)self environmentConfiguration];
  id v9 = [v8 session];
  -[DBActivationSettings setAnimated:](v7, "setAnimated:", [v9 carOwnsScreen] ^ 1);
  -[DBActivationSettings setWaitForCommit:](v7, "setWaitForCommit:", [v9 carOwnsScreen]);
  [(DBActivationSettings *)v7 setUrl:v4];
  BOOL v10 = +[DBApplicationController sharedInstance];
  if (([v5 hasPrefix:@"maps:"] & 1) != 0
    || [v5 hasPrefix:@"maps:/car/destinations"])
  {
    uint64_t v11 = [v8 navigationStateProvider];
    BOOL v12 = [v11 mostRecentNavigatingApp];

    if (v12)
    {
      uint64_t v13 = [v10 applicationWithBundleIdentifier:v12];
      uint64_t v14 = 0;
      uint64_t v15 = v71[5];
      v71[5] = v13;
    }
    else
    {
      uint64_t v15 = DBLogForCategory(0x13uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "No available now-navigating app; defaulting to nav category.",
          buf,
          2u);
      }
      uint64_t v14 = 1;
    }

    goto LABEL_9;
  }
  if ([v5 hasPrefix:@"nowplaying:"])
  {
    int v16 = [(DBDashboard *)self nowPlayingObserver];
    uint64_t v17 = [v16 nowPlayingLaunchInfoWithSource:0];
    uint64_t v18 = (void *)v65[5];
    v65[5] = v17;

    if (!v65[5])
    {
      BOOL v12 = DBLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        uint64_t v14 = 2;
        _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "No available now playing app; defaulting to audio category.",
          buf,
          2u);
      }
      else
      {
        uint64_t v14 = 2;
      }
      goto LABEL_9;
    }
LABEL_19:
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  if (![v5 hasPrefix:@"music:"])
  {
    if ([v5 hasPrefix:@"mobilephone:"])
    {
      if ([(DBDashboard *)self hasActiveCall])
      {
        uint64_t v26 = [v10 inCallServiceApplication];
        double v27 = (void *)v71[5];
        v71[5] = v26;

        uint64_t v28 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
        uint64_t v29 = v28;
        if (v71[5]) {
          -[DBMutableWorkspaceStateChangeRequest activateStackedApplication:](v28, "activateStackedApplication:");
        }
        [(DBWorkspace *)self->_workspace requestStateChange:v29];
        uint64_t v30 = DBLogForCategory(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_22D6F0000, v30, OS_LOG_TYPE_DEFAULT, "Taking screen for requestUI mobilephone, launching to in-call UI", buf, 2u);
        }

        [v9 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"iOS UI requested"];
        goto LABEL_11;
      }
      uint64_t v31 = [v10 phoneApplication];
      goto LABEL_31;
    }
    if ([v5 hasPrefix:@"messages:"])
    {
      uint64_t v31 = [v10 messagesApplication];
LABEL_31:
      uint64_t v14 = 0;
      BOOL v12 = v71[5];
      v71[5] = v31;
LABEL_9:

LABEL_10:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33__DBDashboard__handleSessionURL___block_invoke_620;
      block[3] = &unk_2649B4B80;
      v57 = &v70;
      void block[4] = self;
      v58 = &v64;
      uint64_t v59 = v14;
      id v55 = v4;
      double v56 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_11;
    }
    if ([v5 hasPrefix:@"app:"])
    {
      id v32 = [v5 stringByReplacingOccurrencesOfString:@"://" withString:@":"];

      id v33 = [v32 componentsSeparatedByString:@":"];
      BOOL v50 = [v33 lastObject];

      uint64_t v34 = [v10 applicationWithBundleIdentifier:v50];
      id v35 = (void *)v71[5];
      v71[5] = v34;

      if (v71[5])
      {
        uint64_t v48 = [(DBDashboard *)self environmentConfiguration];
        char v36 = [v48 appHistory];
        __int16 v37 = [(id)v71[5] bundleIdentifier];
        int v38 = [v36 applicationVisibleInCarPlay:v37 withIconProvider:v53];

        if (v38)
        {
          uint64_t v39 = [(DBDashboard *)self environmentConfiguration];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __33__DBDashboard__handleSessionURL___block_invoke;
          v60[3] = &unk_2649B4B38;
          v60[4] = self;
          id v63 = &v70;
          v61 = v7;
          id v62 = v4;
          [v39 fetchEnhancedIntegrationStatusWithCompletion:v60];
        }
      }
      else
      {
        int v43 = DBLogForCategory(0);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138543362;
          id v77 = v4;
          _os_log_impl(&dword_22D6F0000, v43, OS_LOG_TYPE_DEFAULT, "No available app for requestUI URL %{public}@", buf, 0xCu);
        }
      }
      id v5 = v32;
      goto LABEL_11;
    }
    if (![v5 hasPrefix:@"punchthrough:"]) {
      goto LABEL_45;
    }
    if (DBIsInternalInstall_onceToken_2 != -1) {
      dispatch_once(&DBIsInternalInstall_onceToken_2, &__block_literal_global_1539);
    }
    if (!DBIsInternalInstall_isInternal_2)
    {
LABEL_45:
      [(DBDashboard *)self _handleAppSchemeURL:v4 activationSettings:v7];
      goto LABEL_11;
    }
    BOOL v12 = [MEMORY[0x263F08BA0] componentsWithString:v5];
    id v41 = [v12 host];
    long long v42 = [v12 queryItems];
    uint64_t v51 = [v42 indexOfObjectPassingTest:&__block_literal_global_610];

    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v52 = @"present";
    }
    else
    {
      uint64_t v49 = [v12 queryItems];
      id v47 = [v49 objectAtIndex:v51];
      id v44 = [v47 value];
      double v52 = [v44 lowercaseString];
    }
    if ([v41 length])
    {
      if (![(__CFString *)v52 caseInsensitiveCompare:@"present"])
      {
        [(DBDashboard *)self _presentPunchthroughWithIdentifier:v41];
        goto LABEL_62;
      }
      if (![(__CFString *)v52 caseInsensitiveCompare:@"dismiss"])
      {
        [(DBDashboard *)self _dismissPunchthroughWithIdentifier:v41];
        goto LABEL_62;
      }
      long long v45 = DBLogForCategory(0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        int v46 = "Invalid punch through URL \"action\" query param.";
LABEL_58:
        _os_log_impl(&dword_22D6F0000, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
      }
    }
    else
    {
      long long v45 = DBLogForCategory(0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        int v46 = "Invalid punch through URL, missing identifier.";
        goto LABEL_58;
      }
    }

LABEL_62:
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  uint64_t v19 = [v10 musicApplication];
  double v20 = (void *)v71[5];
  v71[5] = v19;

  if (v71[5]) {
    goto LABEL_19;
  }
  uint64_t v21 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v22 = [v21 appHistory];
  char v23 = [v22 orderedAppsMatchingDockCategory:2];

  uint64_t v24 = [v23 firstObject];
  id v25 = (void *)v71[5];
  v71[5] = v24;

  if (v71[5]) {
    goto LABEL_19;
  }
  long long v40 = DBLogForCategory(0);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_22D6F0000, v40, OS_LOG_TYPE_DEFAULT, "No available audio app to launch from music: context.", buf, 2u);
  }

LABEL_11:
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
}

void __33__DBDashboard__handleSessionURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__DBDashboard__handleSessionURL___block_invoke_604;
    v6[3] = &unk_2649B4B10;
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    uint64_t v9 = v3;
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  else
  {
    id v5 = DBLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "No user consent for launching app by URL.", buf, 2u);
    }
  }
}

void __33__DBDashboard__handleSessionURL___block_invoke_604(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = +[DBApplicationLaunchInfo launchInfoForApplication:*(void *)(*(void *)(a1[7] + 8) + 40) withActivationSettings:a1[5]];
  [v2 _launchAppWithInfo:v3 forURL:a1[6]];
}

BOOL __33__DBDashboard__handleSessionURL___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = [a2 name];
  uint64_t v6 = [v5 caseInsensitiveCompare:@"action"];

  if (a4 && !v6) {
    *a4 = 1;
  }
  return v6 == 0;
}

void __33__DBDashboard__handleSessionURL___block_invoke_620(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    goto LABEL_2;
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v6 = [*(id *)(a1 + 32) environmentConfiguration];
    id v7 = [v6 appHistory];
    id v8 = [v7 orderedAppsMatchingDockCategory:*(void *)(a1 + 72)];

    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
LABEL_2:
      uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v2)
      {
        uint64_t v3 = +[DBApplicationLaunchInfo launchInfoForApplication:withActivationSettings:](DBApplicationLaunchInfo, "launchInfoForApplication:withActivationSettings:");
        uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
        id v5 = *(void **)(v4 + 40);
        *(void *)(v4 + 40) = v3;

        uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      goto LABEL_7;
    }
  }
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v2)
  {
LABEL_7:
    BOOL v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    [v12 _launchAppWithInfo:v2 forURL:v13];
    return;
  }
  uint64_t v14 = DBLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __33__DBDashboard__handleSessionURL___block_invoke_620_cold_1(a1, v14);
  }
}

- (void)_handleAppSchemeURL:(id)a3 activationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DBDashboard *)self rootViewController];
  uint64_t v9 = [v8 homeViewController];

  uint64_t v10 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v11 = [v10 appHistory];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__DBDashboard__handleAppSchemeURL_activationSettings___block_invoke;
  v13[3] = &unk_2649B4BA8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 openApplicationURL:v12 withIconProvider:v9 activationSettings:v7 completion:v13];
}

void __54__DBDashboard__handleAppSchemeURL_activationSettings___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__DBDashboard__handleAppSchemeURL_activationSettings___block_invoke_2;
    block[3] = &unk_2649B3ED8;
    void block[4] = *(void *)(a1 + 32);
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if ((a2 & 1) == 0)
  {
    uint64_t v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Unable to resolve a URL request for URL %{public}@: %@", buf, 0x16u);
    }
  }
}

uint64_t __54__DBDashboard__handleAppSchemeURL_activationSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchAppWithInfo:*(void *)(a1 + 40) forURL:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 receivedUnhandledRemoteEvent:(id)a4 withPayload:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__DBDashboard_session_receivedUnhandledRemoteEvent_withPayload___block_invoke;
  block[3] = &unk_2649B3ED8;
  id v12 = v7;
  id v13 = v8;
  id v14 = self;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__DBDashboard_session_receivedUnhandledRemoteEvent_withPayload___block_invoke(id *a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ([a1[4] isEqualToString:@"changeUIContext"])
  {
    uint64_t v2 = [a1[5] objectForKeyedSubscript:@"url"];
    uint64_t v3 = [a1[6] environmentConfiguration];
    uint64_t v4 = [v3 appHistory];
    id v5 = [v4 sessionAppContextURLs];
    char v6 = [v5 containsObject:v2];

    id v7 = DBLogForCategory(0);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)id buf = 138543362;
        BOOL v50 = v2;
        _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Received UIContext event %{public}@, updating ownership to accessory.", buf, 0xCu);
      }

      id v7 = [a1[6] environmentConfiguration];
      id v9 = [v7 appHistory];
      [v9 updateOwner:0 forContext:v2];
    }
    else if (v8)
    {
      *(_DWORD *)id buf = 138543362;
      BOOL v50 = v2;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Received UIContext event %{public}@ for which the accessory did not declare support; dropping.",
        buf,
        0xCu);
    }

LABEL_11:
    return;
  }
  if ([a1[4] isEqualToString:@"accessoryAcquireFocus"])
  {
    id v48 = [a1[6] focusController];
    [v48 takeWithPriority:@"oemFocus" reason:0 forWindow:*MEMORY[0x263F312A8] bundleIdentifier:0xFFFFFFFFLL pid:0 scene:9.0];
  }
  else
  {
    if (![a1[4] isEqualToString:@"accessoryGiveFocus"])
    {
      uint64_t v2 = DBLogForCategory(0);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        char v23 = a1[4];
        *(_DWORD *)id buf = 138543362;
        BOOL v50 = v23;
        _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Received unhandled remote event %{public}@; dropping.",
          buf,
          0xCu);
      }
      goto LABEL_11;
    }
    id v10 = [a1[5] objectForKey:@"focusHeading"];
    uint64_t v11 = [v10 unsignedIntegerValue];

    id v12 = [a1[6] environmentConfiguration];
    uint64_t v13 = [v12 isRightHandDrive] ^ 1;
    id v14 = [a1[6] environmentConfiguration];
    LODWORD(v10) = +[DBFocusMovementManager isOEMToiOSHeadingToStatusBar:isLeftHandDrive:statusBarEdge:](DBFocusMovementManager, "isOEMToiOSHeadingToStatusBar:isLeftHandDrive:statusBarEdge:", v11, v13, [v14 currentStatusBarEdge]);

    if (v10)
    {
      uint64_t v15 = [MEMORY[0x263F3F4F0] sharedInstance];
      __int16 v16 = [a1[6] driverStatusBarWindow];
      id v17 = [v16 _scene];
      uint64_t v18 = [v17 identifier];
      uint64_t v19 = [v15 sceneWithIdentifier:v18];

      double v20 = [a1[6] focusController];
      uint64_t v21 = [a1[6] driverStatusBarWindow];
      uint64_t v22 = FBSystemAppBundleID();
      [v20 takeWithPriority:@"statusbar" reason:v21 forWindow:v22 bundleIdentifier:getpid() pid:v19 scene:4.0];
    }
    else
    {
      uint64_t v19 = [a1[6] focusController];
      [v19 dropReason:@"statusbar"];
    }

    uint64_t v24 = [a1[5] objectForKey:@"originXPixels"];
    [v24 floatValue];
    double v26 = v25;

    double v27 = [a1[5] objectForKey:@"originYPixels"];
    [v27 floatValue];
    double v29 = v28;

    uint64_t v30 = [a1[5] objectForKey:@"widthPixels"];
    [v30 floatValue];
    double v32 = v31;

    id v33 = [a1[5] objectForKey:@"heightPixels"];
    [v33 floatValue];
    double v35 = v34;

    char v36 = [a1[6] rootViewController];
    __int16 v37 = [v36 contentView];
    int v38 = [a1[6] mainWindow];
    uint64_t v39 = [v38 screen];
    +[DBFocusMovementManager convertRect:toView:fromScreen:](DBFocusMovementManager, "convertRect:toView:fromScreen:", v37, v39, v26, v29, v32, v35);
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;

    id v48 = [a1[6] focusController];
    objc_msgSend(v48, "dropReason:withHeading:focusedFrame:", @"oemFocus", v11, v41, v43, v45, v47);
  }
}

- (CGRect)_rectForFocusedRectDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboard *)self environmentConfiguration];
  [v5 screenScale];
  double v7 = v6;

  BOOL v8 = [v4 objectForKeyedSubscript:@"originXPixels"];
  [v8 floatValue];
  double v10 = v9 / v7;
  uint64_t v11 = [v4 objectForKeyedSubscript:@"originYPixels"];
  [v11 floatValue];
  double v13 = v12 / v7;
  id v14 = [v4 objectForKeyedSubscript:@"widthPixels"];
  [v14 floatValue];
  double v16 = v15 / v7;
  id v17 = [v4 objectForKeyedSubscript:@"heightPixels"];

  [v17 floatValue];
  double v19 = v18 / v7;

  double v20 = v10;
  double v21 = v13;
  double v22 = v16;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)alertServer:(id)a3 wantsAppPresentationForAlert:(id)a4 bundleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(DBDashboard *)self workspaceOwner];
  [v11 alertServer:v10 wantsAppPresentationForAlert:v9 bundleID:v8];

  [(DBDashboard *)self _updateDeferrals];
}

- (void)alertServer:(id)a3 wantsAppDismissalForAlert:(id)a4 bundleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(DBDashboard *)self workspaceOwner];
  [v11 alertServer:v10 wantsAppDismissalForAlert:v9 bundleID:v8];

  [(DBDashboard *)self _updateDeferrals];
}

- (void)alertServer:(id)a3 wantsSystemPresentationForViewController:(id)a4
{
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[DBDashboard alertServer:wantsSystemPresentationForViewController:]();
  }
}

- (void)alertServer:(id)a3 wantsSystemDismissalForViewController:(id)a4
{
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[DBDashboard alertServer:wantsSystemPresentationForViewController:]();
  }
}

- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6
{
  double v7 = [(DBDashboard *)self identifierToApplicationMap];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__DBDashboard_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke;
  void v8[3] = &unk_2649B4BD0;
  void v8[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

void __95__DBDashboard_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  double v7 = [v4 identifierToAppScenesMap];
  id v19 = [v7 objectForKeyedSubscript:v6];

  int v8 = [v5 isLockedOrHidden];
  id v9 = [v19 settings];
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  id v10 = [v19 settings];
  if ((v5 & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      float v15 = 0;
      goto LABEL_11;
    }
    id v10 = [v19 settings];
  }
  uint64_t v12 = objc_opt_class();
  id v13 = v10;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v16 = v14;

  id v17 = [v16 proxiedApplicationBundleIdentifier];

  float v18 = +[DBApplicationController sharedInstance];
  float v15 = [v18 applicationWithBundleIdentifier:v17];

LABEL_11:
  if (([v15 isLockedOrHidden] | v8) == 1) {
    [v19 invalidate];
  }
}

- (void)willPresentPresentable:(id)a3 forNotificationViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 visibleNotificationScene];
  id v9 = &off_22D86E000;
  if (v8)
  {
    int64_t v10 = [(DBDashboard *)self _sceneInterfaceStyleForScene:v8];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __68__DBDashboard_willPresentPresentable_forNotificationViewController___block_invoke;
    v29[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    v29[4] = v10;
    [v8 updateUISettingsWithBlock:v29];
    uint64_t v11 = [(DBDashboard *)self focusController];
    uint64_t v12 = [v8 clientProcess];
    id v13 = [v12 bundleIdentifier];
    id v14 = [v8 clientProcess];
    -[NSObject takeWithPriority:reason:forWindow:bundleIdentifier:pid:scene:](v11, "takeWithPriority:reason:forWindow:bundleIdentifier:pid:scene:", @"notification", 0, v13, [v14 pid], v8, 5.0);
  }
  else if ([v7 presentableIsOEMNotification:v6])
  {
    uint64_t v11 = +[DBEvent eventWithType:10 context:0];
    [(DBDashboard *)self handleEvent:v11];
    float v15 = [(DBDashboard *)self focusController];
    id v16 = [(DBDashboard *)self notificationWindow];
    id v17 = FBSystemAppBundleID();
    uint64_t v18 = getpid();
    id v19 = [(DBDashboard *)self _dashboardScene];
    uint64_t v20 = v18;
    id v9 = &off_22D86E000;
    [v15 takeWithPriority:@"notification" reason:v16 forWindow:v17 bundleIdentifier:v20 pid:v19 scene:8.0];

    double v21 = (void *)MEMORY[0x263F82758];
    double v22 = [(DBDashboard *)self notificationWindow];
    double v23 = [v21 focusSystemForEnvironment:v22];
    [v23 setNeedsFocusUpdate];
  }
  else
  {
    uint64_t v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DBDashboard willPresentPresentable:forNotificationViewController:]();
    }
  }

  uint64_t v24 = [(DBDashboard *)self _foregroundActiveScene];
  objc_opt_class();
  id v25 = [v24 settings];
  if (v25 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }

  [v7 notificationHeight];
  if (v26)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = *((void *)v9 + 375);
    v28[2] = __68__DBDashboard_willPresentPresentable_forNotificationViewController___block_invoke_637;
    v28[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    v28[4] = v27;
    [v24 updateSettingsWithBlock:v28];
  }
}

uint64_t __68__DBDashboard_willPresentPresentable_forNotificationViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

void __68__DBDashboard_willPresentPresentable_forNotificationViewController___block_invoke_637(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }

  [v4 setBannerHeight:*(double *)(a1 + 32)];
}

- (void)didDismissPresentable:(id)a3 forNotificationViewController:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(DBDashboard *)self focusController];
  [v8 dropReason:@"notification"];

  id v9 = [(DBDashboard *)self identifierToAppScenesMap];
  int64_t v10 = [v9 allValues];
  [v10 enumerateObjectsUsingBlock:&__block_literal_global_641];

  LODWORD(v9) = [v6 presentableIsOEMNotification:v7];
  if (v9 && self->_interruptedPunchthroughIdentifier)
  {
    uint64_t v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      interruptedPunchthroughIdentifier = self->_interruptedPunchthroughIdentifier;
      int v14 = 138543362;
      float v15 = interruptedPunchthroughIdentifier;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing OEM Notification, re-presenting interrupted PT: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    [(DBDashboard *)self _presentPunchthroughWithIdentifier:self->_interruptedPunchthroughIdentifier];
    id v13 = self->_interruptedPunchthroughIdentifier;
    self->_interruptedPunchthroughIdentifier = 0;
  }
}

void __67__DBDashboard_didDismissPresentable_forNotificationViewController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  id v2 = [v4 settings];
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3) {
    [v4 updateSettingsWithBlock:&__block_literal_global_643];
  }
}

void __67__DBDashboard_didDismissPresentable_forNotificationViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }

  [v3 setBannerHeight:0.0];
}

- (void)environmentConfiguration:(id)a3 appearanceStyleDidChange:(int64_t)a4
{
  id v5 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Appearance style changed for environment, updating user interface style", v6, 2u);
  }

  [(DBDashboard *)self _updateUserInterfaceStyle];
}

- (void)environmentConfiguration:(id)a3 nightModeDidChange:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromBOOL();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Night mode changed for environment to: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)environmentConfiguration:(id)a3 mapsAppearanceStyleDidChange:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = CPUIDescriptionForUserInterfaceStyle();
    *(_DWORD *)id buf = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Maps style changed for environment to: %{public}@, updating user interface style on scenes that can use Maps style", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263F3F4F0] sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__DBDashboard_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke;
  v9[3] = &unk_2649B4C38;
  v9[4] = self;
  v9[5] = a4;
  [v8 enumerateScenesWithBlock:v9];
}

void __69__DBDashboard_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 settings];
  id v5 = [v4 displayIdentity];
  int v6 = [*(id *)(a1 + 32) displayIdentity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v3 settings];
    int v9 = [v8 conformsToProtocol:&unk_26E239760];

    int64_t v10 = DBLogForCategory(0x10uLL);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        uint64_t v12 = CPUIDescriptionForUserInterfaceStyle();
        *(_DWORD *)id buf = 138543618;
        id v15 = v12;
        __int16 v16 = 2114;
        id v17 = v3;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Updating map style to: %{public}@, for scene: %{public}@", buf, 0x16u);
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __69__DBDashboard_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke_690;
      v13[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
      v13[4] = *(void *)(a1 + 40);
      [v3 updateSettingsWithBlock:v13];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)id buf = 138543362;
        id v15 = v3;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring map style update for scene: %{public}@", buf, 0xCu);
      }
    }
  }
}

void __69__DBDashboard_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke_690(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_26E239858]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }

  [v3 setMapStyle:*(void *)(a1 + 32)];
}

- (void)environmentConfiguration:(double)a3 viewAreaDidChangeFromViewAreaFrame:(double)a4 safeAreaInsets:(double)a5 toViewAreaFrame:(double)a6 safeAreaInsets:(double)a7 duration:(double)a8 transitionControlType:(double)a9
{
  v168[2] = *MEMORY[0x263EF8340];
  uint64_t v30 = [a1 workspace];
  float v31 = [v30 state];
  double v32 = [v31 activeBundleIdentifier];

  id v33 = +[DBApplicationController sharedInstance];
  float v34 = [v33 applicationWithBundleIdentifier:v32];

  double v35 = [a1 layoutEngine];
  [v35 areaOfInterestFrameForApplication:v34];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = [a1 rootViewController];
  if (a21 <= 0.0)
  {
    id v62 = [a1 interestingView];
    objc_msgSend(v62, "setFrame:", v37, v39, v41, v43);

    id v63 = [a1 cornerRadiusView];
    uint64_t v64 = [a1 layoutEngine];
    [v64 cornerRadiusViewFrame];
    objc_msgSend(v63, "setFrame:");

    uint64_t v65 = [a1 cornerRadiusView];
    [v65 layoutIfNeeded];

    LODWORD(v64) = [a1[18] hasDualStatusBar];
    uint64_t v66 = [a1 driverStatusBarViewController];
    double v67 = v66;
    if (v64)
    {
      [v66 setTransitionControlType:0];

      uint64_t v66 = [a1 passengerStatusBarViewController];
      double v67 = v66;
      uint64_t v68 = 0;
    }
    else
    {
      uint64_t v68 = a12;
    }
    [v66 setTransitionControlType:v68];

    [a1 _updateWindowFrames];
    [a1 _updateMaskedCornersForStatusBarWindows];
    [a1 _updateAppScenesViewArea];
    uint64_t v101 = [v44 homeViewController];
    [v101 _setupIconModel];

    CGRect v102 = +[DBApplicationController sharedInstance];
    CGRect v103 = [v102 siriApplication];

    v104 = [a1 siriViewController];
    [a1 sceneFrameForApplication:v103];
    objc_msgSend(v104, "handleTransitionToFrame:");

    v105 = [a1 notificationViewController];
    v106 = [a1 notificationWindow];
    [v106 frame];
    double v108 = v107;
    double v110 = v109;
    double v112 = v111;
    double v114 = v113;
    v115 = [a1 layoutEngine];
    [v115 notificationWindowFrame];
    objc_msgSend(v105, "handleTransitionFromFrame:toFrame:", v108, v110, v112, v114, v116, v117, v118, v119);
  }
  else
  {
    uint64_t v131 = a12;
    double v133 = v37;
    double v134 = v39;
    v135 = v34;
    double v132 = a17 + a19;
    double v45 = a2 + a7;
    double v46 = a4 - (a7 + a9);
    double v47 = a5 - (a6 + a8);
    id v48 = objc_msgSend(a1, "_takeSnapshotOfFrame:", v45, a3 + a6, v46, v47);
    [v48 setAutoresizingMask:18];
    uint64_t v49 = (void *)[a1 _newResizeAnimationWindow];
    [a1 setResizeWindow:v49];
    id v50 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v51 = objc_msgSend(v50, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v51 setClipsToBounds:1];
    v146 = v49;
    [v49 addSubview:v51];
    objc_msgSend(v51, "setFrame:", v45, a3 + a6, v46, v47);
    double v52 = objc_alloc_init(DBAnimationView);
    [(DBAnimationView *)v52 setAutoresizingMask:18];
    v168[0] = @"filters.gaussianBlur.inputRadius";
    v168[1] = @"filters.saturation.inputAmount";
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:2];
    [(DBAnimationView *)v52 setKeysToAnimate:v53];

    double v54 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v54 setName:@"gaussianBlur"];
    [v54 setValue:&unk_26E17F060 forKey:@"inputRadius"];
    [v54 setValue:MEMORY[0x263EFFA88] forKey:@"inputHardEdges"];
    id v55 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v55 setName:@"saturation"];
    [v55 setValue:&unk_26E17F070 forKey:@"inputAmount"];
    double v56 = [(DBAnimationView *)v52 layer];
    id v140 = v55;
    v142 = v54;
    v167[0] = v54;
    v167[1] = v55;
    v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:2];
    [v56 setFilters:v57];

    [v51 addSubview:v52];
    [v51 bounds];
    -[DBAnimationView setFrame:](v52, "setFrame:");
    [(DBAnimationView *)v52 addSubview:v48];
    [(DBAnimationView *)v52 bounds];
    v144 = v48;
    objc_msgSend(v48, "setFrame:");
    [MEMORY[0x263F158F8] commit];
    [a1 _updateAppScenesViewArea];
    [a1 _updateWindowFrames];
    [a1 _updateMaskedCornersForStatusBarWindows];
    v58 = [a1 statusBarStateProvider];
    [v58 updateStatusBarData];

    LODWORD(v57) = [a1[18] hasDualStatusBar];
    uint64_t v59 = [a1 driverStatusBarViewController];
    v60 = v59;
    v136 = v32;
    v147 = v44;
    if (v57)
    {
      [v59 setTransitionControlType:0];

      uint64_t v59 = [a1 passengerStatusBarViewController];
      v60 = v59;
      uint64_t v61 = 0;
    }
    else
    {
      uint64_t v61 = v131;
    }
    [v59 setTransitionControlType:v61];

    id v69 = [a1 notificationViewController];
    uint64_t v70 = [a1 notificationWindow];
    [v70 frame];
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v79 = [a1 layoutEngine];
    [v79 notificationWindowFrame];
    objc_msgSend(v69, "handleTransitionFromFrame:toFrame:", v72, v74, v76, v78, v80, v81, v82, v83);

    v84 = +[DBApplicationController sharedInstance];
    uint64_t v85 = [v84 siriApplication];

    id v86 = [a1 siriViewController];
    v138 = (void *)v85;
    [a1 sceneFrameForApplication:v85];
    objc_msgSend(v86, "handleTransitionToFrame:");

    BOOL v87 = [a1 rootViewController];
    BOOL v88 = [v87 homeViewController];
    char v89 = [v88 folderController];
    v90 = [v89 folderControllers];
    id v91 = [v90 firstObject];

    uint64_t v92 = [v91 currentPageIndex];
    CGAffineTransform v93 = [v147 homeViewController];
    [v93 _setupIconModel];

    id v94 = [a1 rootViewController];
    CGAffineTransform v95 = [v94 homeViewController];
    v96 = [v95 folderController];
    uint64_t v97 = [v96 folderControllers];
    v98 = [v97 firstObject];

    if (v91 != v98)
    {
      if (v92 > [v98 maximumPageIndex]) {
        uint64_t v92 = [v98 maximumPageIndex];
      }
      [v98 setCurrentPageIndex:v92 animated:0];
    }
    [MEMORY[0x263F158F8] commit];
    id v99 = objc_msgSend(a1, "_takeSnapshotOfFrame:", a13 + a18, a14 + a17, a15 - (a18 + a20), a16 - v132);
    [v99 setAutoresizingMask:18];
    if (a21 >= 0.5)
    {
      double v120 = (void *)MEMORY[0x263F827E8];
      double v121 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      double v122 = [a1 mainWindow];
      double v123 = [v122 traitCollection];
      double v124 = [v120 imageNamed:@"CarPlayLogo" inBundle:v121 compatibleWithTraitCollection:v123];

      id v100 = objc_alloc_init(MEMORY[0x263F82828]);
      [v100 setContentMode:4];
      [v100 setAutoresizingMask:18];
      [v100 setImage:v124];
      [v51 bounds];
      objc_msgSend(v100, "setFrame:");
      [v100 setAlpha:0.0];
      [v51 addSubview:v100];
    }
    else
    {
      id v100 = 0;
    }
    double v32 = v136;
    double v125 = (void *)MEMORY[0x263F82E00];
    v164[0] = MEMORY[0x263EF8330];
    v164[1] = 3221225472;
    v164[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke;
    v164[3] = &unk_2649B3D30;
    v165 = v52;
    id v166 = v100;
    v148[0] = MEMORY[0x263EF8330];
    v148[1] = 3221225472;
    v148[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_708;
    v148[3] = &unk_2649B4CB0;
    v149 = v165;
    id v150 = v99;
    double v155 = a21;
    double v156 = a13 + a18;
    double v157 = a14 + a17;
    double v158 = a15 - (a18 + a20);
    id v151 = v51;
    v152 = a1;
    double v159 = a16 - v132;
    double v160 = v133;
    double v161 = v134;
    double v162 = v41;
    double v163 = v43;
    id v153 = v144;
    id v154 = v166;
    id v126 = v166;
    id v127 = v144;
    id v128 = v51;
    id v129 = v99;
    v130 = v165;
    [v125 animateWithDuration:v164 animations:v148 completion:0.25];

    float v34 = v135;
    double v44 = v147;
  }
}

uint64_t __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:&unk_26E17F080 forKeyPath:@"filters.saturation.inputAmount"];

  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setValue:&unk_26E17F090 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  id v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:1.0];
}

void __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_708(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v2, "setFrame:");
  id v3 = (void *)MEMORY[0x263F82E00];
  double v4 = *(double *)(a1 + 80);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_2;
  v14[3] = &unk_2649B4C60;
  id v15 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 56);
  id v16 = v5;
  uint64_t v17 = v6;
  long long v20 = *(_OWORD *)(a1 + 120);
  long long v21 = *(_OWORD *)(a1 + 136);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_3;
  v9[3] = &unk_2649B4C88;
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v13 = v8;
  [v3 animateWithDuration:0x20000 delay:v14 usingSpringWithDamping:v9 initialSpringVelocity:v4 options:0.0 animations:100.0 completion:0.0];
}

void __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = [*(id *)(a1 + 48) environmentConfiguration];
  int v3 = [v2 currentViewAreaSupportsUIOutsideSafeArea];

  double v4 = [*(id *)(a1 + 48) cornerRadiusWindow];
  id v5 = v4;
  double v6 = 0.0;
  if (!v3) {
    double v6 = 1.0;
  }
  [v4 setAlpha:v6];

  id v7 = [*(id *)(a1 + 48) cornerRadiusView];
  uint64_t v8 = [*(id *)(a1 + 48) layoutEngine];
  [v8 cornerRadiusViewFrame];
  objc_msgSend(v7, "setFrame:");

  int v9 = [*(id *)(a1 + 48) cornerRadiusView];
  [v9 layoutIfNeeded];

  id v10 = [*(id *)(a1 + 48) interestingView];
  objc_msgSend(v10, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = (void *)MEMORY[0x263F82E00];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_4;
  v4[3] = &unk_2649B3D30;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_5;
  v3[3] = &unk_2649B3FA8;
  v3[4] = *(void *)(a1 + 56);
  [v2 animateWithDuration:v4 animations:v3 completion:0.25];
}

uint64_t __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:&unk_26E17F070 forKeyPath:@"filters.saturation.inputAmount"];

  int v3 = [*(id *)(a1 + 32) layer];
  [v3 setValue:&unk_26E17F060 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  double v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:0.0];
}

uint64_t __152__DBDashboard_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setResizeWindow:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateWindowFrames];
}

- (void)_updateAppScenesViewArea
{
  int v3 = [(DBDashboard *)self identifierToAppScenesMap];
  double v4 = (void *)[v3 copy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__DBDashboard__updateAppScenesViewArea__block_invoke;
  v5[3] = &unk_2649B4A78;
  void v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __39__DBDashboard__updateAppScenesViewArea__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 workspaceIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.DashBoard.scene-workspace.app"];

  if (v8)
  {
    int v9 = [*(id *)(a1 + 32) identifierToApplicationMap];
    id v10 = [v9 objectForKey:v5];

    id v11 = +[DBApplicationController sharedInstance];
    id v12 = [v11 templateUIHostApplication];

    if (v10 == v12)
    {
      objc_opt_class();
      id v13 = [v6 settings];
      if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      id v15 = +[DBApplicationController sharedInstance];
      id v16 = [v14 proxiedApplicationBundleIdentifier];
      uint64_t v17 = [v15 applicationWithBundleIdentifier:v16];

      id v10 = (void *)v17;
    }
    [*(id *)(a1 + 32) sceneFrameForApplication:v10];
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    [*(id *)(a1 + 32) safeAreaInsetsForApplication:v10];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __39__DBDashboard__updateAppScenesViewArea__block_invoke_2;
    v30[3] = &__block_descriptor_96_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    v30[4] = v19;
    v30[5] = v21;
    v30[6] = v23;
    v30[7] = v25;
    v30[8] = v26;
    v30[9] = v27;
    v30[10] = v28;
    v30[11] = v29;
    [v6 updateUISettingsWithBlock:v30];
  }
}

void __39__DBDashboard__updateAppScenesViewArea__block_invoke_2(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "setSafeAreaInsetsPortrait:", a1[8], a1[9], a1[10], a1[11]);
}

- (void)_updateWindowFrames
{
  double v3 = [(DBDashboard *)self environmentConfiguration];
  [v3 currentSafeViewAreaFrame];
  double v46 = v4;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = [(DBDashboard *)self wallpaperHostWindow];
  id v12 = [v11 localScene];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __34__DBDashboard__updateWindowFrames__block_invoke;
  v48[3] = &unk_2649B4CF8;
  v48[4] = self;
  [v12 updateSettingsWithBlock:v48];

  id v13 = [(DBDashboard *)self layoutEngine];
  [v13 wallpaperWindowFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(DBDashboard *)self wallpaperWindow];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  uint64_t v23 = [(DBDashboard *)self environmentConfiguration];
  LODWORD(v22) = [v23 currentViewAreaSupportsUIOutsideSafeArea];

  uint64_t v24 = [(DBDashboard *)self rootViewController];
  double v25 = 0.0;
  if (v22) {
    [(DBDashboard *)self currentCornerRadius];
  }
  [v24 setContentCornerRadius:v25];

  uint64_t v26 = [(DBDashboard *)self layoutEngine];
  [v26 rootViewControllerContentInsets];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v35 = [(DBDashboard *)self rootViewController];
  objc_msgSend(v35, "setAdditionalSafeAreaInsets:", v28, v30, v32, v34);

  double v36 = [(DBDashboard *)self statusBarHostWindow];
  double v37 = [v36 localScene];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __34__DBDashboard__updateWindowFrames__block_invoke_2;
  v47[3] = &unk_2649B4CF8;
  v47[4] = self;
  [v37 updateSettingsWithBlock:v47];

  BOOL v38 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration hasDualStatusBar];
  double v39 = [(DBDashboard *)self driverStatusBarWindow];
  double v40 = [(DBDashboard *)self layoutEngine];
  [v40 primaryStatusBarWindowFrame];
  if (v38)
  {
    objc_msgSend(v39, "setFrame:");

    double v39 = [(DBDashboard *)self passengerStatusBarWindow];
    double v40 = [(DBDashboard *)self layoutEngine];
    [v40 secondaryStatusBarWindowFrame];
  }
  objc_msgSend(v39, "setFrame:");

  double v41 = [(DBDashboard *)self notificationWindow];
  double v42 = [(DBDashboard *)self layoutEngine];
  [v42 notificationWindowFrame];
  objc_msgSend(v41, "setFrame:");

  double v43 = [(DBDashboard *)self lockOutController];
  double v44 = [v43 lockOutWindow];
  objc_msgSend(v44, "setFrame:", v46, v6, v8, v10);

  double v45 = [(DBDashboard *)self userAlertServer];
  [(DBDashboard *)self statusBarInsets];
  objc_msgSend(v45, "updateAlertSceneFramesWithSafeAreaInsets:");
}

void __34__DBDashboard__updateWindowFrames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layoutEngine];
  [v4 wallpaperHostSceneFrame];
  objc_msgSend(v3, "setFrame:");
}

void __34__DBDashboard__updateWindowFrames__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layoutEngine];
  [v4 statusBarHostSceneFrame];
  objc_msgSend(v3, "setFrame:");
}

- (void)_updatePasscodeLockToken
{
  id v3 = [(DBDashboard *)self environmentConfiguration];
  int v4 = [v3 isPairedVehicle];

  if (v4)
  {
    double v5 = DBLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating preventPasscodeLockToken", buf, 2u);
    }

    double v6 = [(DBDashboard *)self preventPasscodeLockToken];
    [v6 invalidate];

    [(DBDashboard *)self setPreventPasscodeLockToken:0];
  }
  else
  {
    double v7 = [(DBDashboard *)self preventPasscodeLockToken];
    if (v7)
    {
    }
    else
    {
      double v8 = [(DBDashboard *)self environmentConfiguration];
      char v9 = [v8 isPairedVehicle];

      if ((v9 & 1) == 0)
      {
        double v10 = DBLogForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Taking preventPasscodeLockToken", v13, 2u);
        }

        id v11 = objc_alloc_init(MEMORY[0x263F793C8]);
        id v12 = [v11 preventPasscodeLockWithReason:@"CarPlay Active"];
        [(DBDashboard *)self setPreventPasscodeLockToken:v12];

        [v11 invalidate];
      }
    }
  }
}

- (void)_animateStartupToHomeScreen
{
  id v3 = [(DBDashboard *)self rootViewController];
  int v4 = [v3 homeViewController];
  double v5 = [v4 folderController];
  double v6 = [v5 folderControllers];
  id v12 = [v6 firstObject];

  uint64_t v7 = [v12 minimumPageIndex];
  if ([v12 currentPageIndex] == v7 && v7 != objc_msgSend(v12, "firstIconPageIndex"))
  {
    [(DBDashboard *)self _animateStartupFromScaledMainWindow];
  }
  else
  {
    double v8 = [(DBDashboard *)self rootViewController];
    char v9 = [v8 view];
    [v9 setNeedsLayout];

    double v10 = [(DBDashboard *)self rootViewController];
    id v11 = [v10 view];
    [v11 layoutIfNeeded];

    [(DBDashboard *)self _animateStartupToIcons];
  }
}

- (void)_animateStartupToIcons
{
  id v3 = [(DBDashboard *)self rootViewController];
  int v4 = [v3 homeViewController];
  double v5 = [v4 folderController];
  double v6 = [v5 folderControllers];
  uint64_t v7 = [v6 firstObject];

  double v8 = [(DBDashboard *)self driverStatusBarWindow];
  char v9 = [(DBDashboard *)self mainWindow];
  [v9 setHidden:0];

  [v8 setHidden:0];
  double v10 = [(DBDashboard *)self passengerStatusBarWindow];
  [v10 setHidden:0];
  double v67 = [(DBDashboard *)self climateWindow];
  [v67 setHidden:0];
  id v11 = [(DBDashboard *)self lockOutController];
  id v12 = [v11 lockOutWindow];

  [v12 setHidden:0];
  id v13 = [(DBDashboard *)self rootViewController];
  double v14 = [v13 homeViewController];

  double v15 = [v14 view];
  [v15 setClipsToBounds:0];

  double v16 = [(DBDashboard *)self environmentConfiguration];
  int v17 = [v16 isRightHandDrive];

  double v18 = [MEMORY[0x263EFF980] array];
  double v19 = [v7 iconListViews];
  if ((unint64_t)[v19 count] >= 2)
  {
    double v20 = [v19 objectAtIndex:1];
    [v18 addObject:v20];
  }
  uint64_t v64 = v19;
  double v21 = [v14 folderController];
  uint64_t v22 = [v21 todayViewController];

  id v69 = v18;
  if (v22)
  {
    uint64_t v23 = [v14 folderController];
    uint64_t v24 = [v23 todayViewController];
    double v25 = [v24 view];
    [v69 addObject:v25];

    double v18 = v69;
  }
  [v18 enumerateObjectsUsingBlock:&__block_literal_global_711];
  [v8 frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v34 = [(DBDashboard *)self environmentConfiguration];
  uint64_t v35 = [v34 currentStatusBarEdge];

  if (v35 == 1)
  {
    double v36 = *(double *)&v29 + 45.0;
    double v37 = *(double *)&v27;
  }
  else
  {
    BOOL v38 = [(DBDashboard *)self environmentConfiguration];
    uint64_t v39 = [v38 currentStatusBarEdge];

    double v37 = *(double *)&v27 - 45.0;
    if (v17) {
      double v37 = *(double *)&v27 + 45.0;
    }
    double v36 = *(double *)&v29 - 45.0;
    if (v39 == 3) {
      double v37 = *(double *)&v27;
    }
    else {
      double v36 = *(double *)&v29;
    }
  }
  double v66 = v31;
  objc_msgSend(v8, "setFrame:", v37, v36, v31, *(double *)&v33);
  [v10 frame];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = -45.0;
  if (!v17) {
    double v48 = 45.0;
  }
  uint64_t v49 = v10;
  [v10 setFrame:*(double *)&v41 + v48];
  uint64_t v65 = v7;
  id v50 = (void *)[objc_alloc(MEMORY[0x263F791B0]) initWithFolderController:v7];
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x263F79180]) initWithDefaultValues];
  [v51 setAnimationType:1];
  [v51 setMass:2.0];
  [v51 setStiffness:300.0];
  [v51 setDamping:50.0];
  [v51 setCurve:0x10000];
  double v52 = (void *)[objc_alloc(MEMORY[0x263F791D8]) initWithDefaultValues];
  [v52 setDistanceEffect:1];
  [v52 setFirstHopIncrement:2.0];
  [v52 setHopIncrementAcceleration:-1.0];
  [v52 setCentralAnimationSettings:v51];
  [v52 setPreferCenterOfIconGrid:1];
  [v50 setSettings:v52];
  [v50 prepare];
  [v50 setFraction:1.0];
  objc_initWeak(location, self);
  v53 = [(DBDashboard *)self lockOutController];
  double v54 = [v53 lockOutViewController];
  id v55 = [(DBDashboard *)self lockOutController];
  uint64_t v63 = [v55 lockOutMode];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __37__DBDashboard__animateStartupToIcons__block_invoke_2;
  v70[3] = &unk_2649B4D48;
  objc_copyWeak(v79, location);
  id v62 = v12;
  id v71 = v62;
  id v56 = v14;
  id v72 = v56;
  id v68 = v67;
  id v73 = v68;
  id v57 = v51;
  id v74 = v57;
  id v58 = v8;
  id v75 = v58;
  v79[1] = v27;
  v79[2] = v29;
  v79[3] = *(id *)&v66;
  v79[4] = v33;
  id v59 = v49;
  id v76 = v59;
  v79[5] = v41;
  v79[6] = v43;
  v79[7] = v45;
  v79[8] = v47;
  id v60 = v50;
  id v77 = v60;
  id v61 = v69;
  id v78 = v61;
  [v54 setLockOutMode:v63 animated:1 completion:v70];

  objc_destroyWeak(v79);
  objc_destroyWeak(location);
}

uint64_t __37__DBDashboard__animateStartupToIcons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:1];
}

void __37__DBDashboard__animateStartupToIcons__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  [*(id *)(a1 + 32) setHidden:1];
  kdebug_trace();
  int v4 = DBLogForCategory(0xBuLL);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CARPLAYAPP_SIGNPOST_CONNECT_ANIMATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }

  double v5 = [WeakRetained environmentConfiguration];
  double v6 = [v5 analytics];
  [v6 firstFrameSent];

  uint64_t v7 = [*(id *)(a1 + 40) hairlineView];
  [v7 setAlpha:0.0];

  [*(id *)(a1 + 48) setAlpha:0.0];
  double v8 = (void *)MEMORY[0x263F82E00];
  [*(id *)(a1 + 56) calculatedDuration];
  double v10 = v9;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __37__DBDashboard__animateStartupToIcons__block_invoke_715;
  v19[3] = &unk_2649B4C60;
  id v20 = *(id *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 104);
  long long v24 = *(_OWORD *)(a1 + 120);
  id v21 = *(id *)(a1 + 72);
  long long v25 = *(_OWORD *)(a1 + 136);
  long long v26 = *(_OWORD *)(a1 + 152);
  id v22 = *(id *)(a1 + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__DBDashboard__animateStartupToIcons__block_invoke_2_716;
  v17[3] = &unk_2649B3FA8;
  id v18 = *(id *)(a1 + 48);
  [v8 _animateUsingSpringWithDuration:0 delay:v19 options:v17 mass:v10 stiffness:0.2 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  id v11 = *(void **)(a1 + 80);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__DBDashboard__animateStartupToIcons__block_invoke_4;
  v12[3] = &unk_2649B4D20;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 88);
  id v15 = *(id *)(a1 + 80);
  objc_copyWeak(&v16, v2);
  [v11 animateToFraction:v12 afterDelay:0.0 withCompletion:0.0];
  objc_destroyWeak(&v16);
}

void __37__DBDashboard__animateStartupToIcons__block_invoke_715(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  id v2 = [*(id *)(a1 + 48) hairlineView];
  [v2 setAlpha:1.0];
}

void __37__DBDashboard__animateStartupToIcons__block_invoke_2_716(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (void *)MEMORY[0x263F82E00];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __37__DBDashboard__animateStartupToIcons__block_invoke_3;
    v3[3] = &unk_2649B3E90;
    id v4 = *(id *)(a1 + 32);
    [v2 animateWithDuration:v3 animations:0.15];
  }
}

uint64_t __37__DBDashboard__animateStartupToIcons__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __37__DBDashboard__animateStartupToIcons__block_invoke_4(id *a1)
{
  id v2 = [a1[4] view];
  [v2 setClipsToBounds:1];

  id v3 = [a1[4] todayViewController];
  [v3 setSmartWidgetCanChangeVisibilityDisabled:0 forRequester:@"DBConnectAnimationRequester"];

  id v4 = [a1[4] todayViewController];
  [v4 setSceneWidgetsDisabled:0 forRequester:@"DBConnectAnimationRequester"];

  [a1[5] enumerateObjectsUsingBlock:&__block_literal_global_718];
  [a1[6] cleanup];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  [WeakRetained _handleCarPlayUIReady];
}

uint64_t __37__DBDashboard__animateStartupToIcons__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

- (void)_animateStartupFromScaledMainWindow
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [(DBDashboard *)self mainWindow];
  double v5 = [(DBDashboard *)self statusBarHostWindow];
  double v6 = [(DBDashboard *)self wallpaperHostWindow];
  uint64_t v7 = [(DBDashboard *)self cornerRadiusWindow];
  double v8 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, 0);

  double v9 = [(DBDashboard *)self climateWindow];

  if (v9)
  {
    double v10 = [(DBDashboard *)self climateWindow];
    [v8 addObject:v10];
  }
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_721];
  id v11 = [(DBDashboard *)self lockOutController];
  id v12 = [v11 lockOutWindow];

  id v13 = [(DBDashboard *)self rootViewController];
  id v14 = [v13 homeViewController];

  id v15 = [v14 todayViewController];
  objc_initWeak(&location, self);
  id v16 = [(DBDashboard *)self lockOutController];
  int v17 = [v16 lockOutViewController];
  id v18 = [(DBDashboard *)self lockOutController];
  uint64_t v19 = [v18 lockOutMode];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_2;
  v24[3] = &unk_2649B4DB8;
  objc_copyWeak(&v29, &location);
  id v20 = v12;
  id v25 = v20;
  id v21 = v14;
  id v26 = v21;
  id v22 = v8;
  id v27 = v22;
  id v23 = v15;
  id v28 = v23;
  [v17 setLockOutMode:v19 animated:1 completion:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHidden:0];
  CGAffineTransformMakeScale(&v4, 4.0, 4.0);
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
  [v2 setAlpha:0.0];
}

void __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_2(id *a1)
{
  id v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  [a1[4] setHidden:1];
  kdebug_trace();
  CGAffineTransform v4 = DBLogForCategory(0xBuLL);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CARPLAYAPP_SIGNPOST_CONNECT_ANIMATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }

  double v5 = [WeakRetained environmentConfiguration];
  double v6 = [v5 analytics];
  [v6 firstFrameSent];

  uint64_t v7 = [a1[5] hairlineView];
  [v7 setAlpha:0.0];

  double v8 = (void *)MEMORY[0x263F29D20];
  double v9 = [MEMORY[0x263F29D20] factoryWithMass:3.0 stiffness:1000.0 damping:500.0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_723;
  v13[3] = &unk_2649B3D30;
  id v14 = a1[5];
  id v15 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_3;
  v10[3] = &unk_2649B4D90;
  id v11 = a1[7];
  objc_copyWeak(&v12, v2);
  [v8 animateWithFactory:v9 actions:v13 completion:v10];

  objc_destroyWeak(&v12);
}

uint64_t __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_723(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hairlineView];
  [v2 setAlpha:1.0];

  CGAffineTransform v3 = *(void **)(a1 + 40);
  return [v3 enumerateObjectsUsingBlock:&__block_literal_global_726];
}

void __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_2_724(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHidden:0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v4];
  [v2 setAlpha:1.0];
}

void __50__DBDashboard__animateStartupFromScaledMainWindow__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setSmartWidgetCanChangeVisibilityDisabled:0 forRequester:@"DBConnectAnimationRequester"];
  [*(id *)(a1 + 32) setSceneWidgetsDisabled:0 forRequester:@"DBConnectAnimationRequester"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleCarPlayUIReady];
}

+ (id)_stateChangeApplications
{
  if (_stateChangeApplications_onceToken != -1) {
    dispatch_once(&_stateChangeApplications_onceToken, &__block_literal_global_728);
  }
  id v2 = (void *)_stateChangeApplications___stateChangeApps;
  return v2;
}

void __39__DBDashboard__stateChangeApplications__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  os_log_t v0 = +[DBApplicationController sharedInstance];
  uint64_t v1 = [v0 settingsApplication];
  v6[0] = v1;
  id v2 = +[DBApplicationController sharedInstance];
  long long v3 = [v2 autoSettingsApplication];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  double v5 = (void *)_stateChangeApplications___stateChangeApps;
  _stateChangeApplications___stateChangeApps = v4;
}

- (void)_handleCarPlayUIReady
{
  uint64_t v7 = [a2 bundleIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_22D6F0000, a4, OS_LOG_TYPE_DEBUG, "DashBoard requesting state change for %{public}@", a1, 0xCu);
}

void __36__DBDashboard__handleCarPlayUIReady__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  long long v3 = [v10 appPolicy];
  if ([v3 launchUsingTemplateUI] && objc_msgSend(v3, "applicationCategory") == 8
    || (+[DBApplicationController sharedInstance],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 mapsApplication],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5 == v10))
  {
    double v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)MEMORY[0x263F645D8];
    double v8 = [v10 bundleIdentifier];
    double v9 = [v7 predicateMatchingBundleIdentifier:v8];
    [v6 addObject:v9];
  }
}

void __36__DBDashboard__handleCarPlayUIReady__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setServiceClass:9];
  [v3 setPredicates:*(void *)(a1 + 32)];
  uint64_t v4 = [MEMORY[0x263F645E8] descriptor];
  [v3 setStateDescriptor:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__DBDashboard__handleCarPlayUIReady__block_invoke_3;
  v5[3] = &unk_2649B4E08;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [v3 setUpdateHandler:v5];
  objc_destroyWeak(&v6);
}

void __36__DBDashboard__handleCarPlayUIReady__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__DBDashboard__handleCarPlayUIReady__block_invoke_4;
  void v8[3] = &unk_2649B3D30;
  void v8[4] = WeakRetained;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __36__DBDashboard__handleCarPlayUIReady__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _templateAppStateUpdated:*(void *)(a1 + 40)];
}

- (id)_applicationSceneForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v5 = [(DBDashboard *)self identifierToAppScenesMap];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__DBDashboard__applicationSceneForBundleID___block_invoke;
  v9[3] = &unk_2649B4E58;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__DBDashboard__applicationSceneForBundleID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v18 = a3;
  objc_opt_class();
  id v7 = [v18 settings];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  objc_opt_class();
  id v9 = [v18 settings];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v8)
  {
    id v11 = [v8 proxiedApplicationBundleIdentifier];
    int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

    if (v12)
    {
      uint64_t v13 = a1 + 40;
LABEL_14:
      objc_storeStrong((id *)(*(void *)(*(void *)v13 + 8) + 40), a3);
      *a4 = 1;
      goto LABEL_15;
    }
  }
  if (v10)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = a1 + 40;
    id v15 = [*(id *)(*(void *)(v14 + 8) + 40) clientProcess];
    id v16 = [v15 bundleIdentifier];
    int v17 = [v16 isEqualToString:*(void *)(v13 - 8)];

    if (v17) {
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_templateAppStateUpdated:(id)a3
{
  id v9 = a3;
  id v4 = [v9 process];
  id v5 = [v4 bundle];
  id v6 = [v5 identifier];

  id v7 = [v9 state];
  if ([v7 isRunning])
  {
    id v8 = [v9 previousState];

    if (!v8) {
      [(DBDashboard *)self _createBackgroundSceneForTemplateAppBundleID:v6];
    }
  }
  else
  {
  }
}

- (void)_createBackgroundSceneForTemplateAppBundleID:(id)a3
{
  id v13 = a3;
  id v4 = -[DBDashboard _applicationSceneForBundleID:](self, "_applicationSceneForBundleID:");
  if (!v4)
  {
    id v5 = [(DBDashboard *)self rootViewController];
    id v6 = [v5 homeViewController];
    int v7 = [v6 isIconVisibleForIdentifier:v13];

    if (v7)
    {
      id v8 = +[DBApplicationController sharedInstance];
      id v9 = [v8 applicationWithBundleIdentifier:v13];

      id v10 = objc_alloc_init(DBActivationSettings);
      [(DBActivationSettings *)v10 setSuspended:1];
      id v11 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
      [(DBMutableWorkspaceStateChangeRequest *)v11 activateApplication:v9 withSettings:v10];
      int v12 = [(DBDashboard *)self workspace];
      [v12 requestStateChange:v11];
    }
  }
}

- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    *(_DWORD *)id buf = 138543618;
    id v24 = v7;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Handling death of process with identifier: %{public}@ isCrash:%{public}@", buf, 0x16u);
  }

  if ([v7 isEqualToString:@"com.apple.CarPlayTemplateUIHost"])
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v11 = [MEMORY[0x263F3F4F0] sharedInstance];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __74__DBDashboard_processMonitor_shouldHandleDeathOfBundleIdentifier_isCrash___block_invoke;
    v21[3] = &unk_2649B4950;
    id v22 = v10;
    id v12 = v10;
    [v11 enumerateScenesWithBlock:v21];

    [v12 enumerateObjectsUsingBlock:&__block_literal_global_737];
  }
  id v13 = +[DBApplicationController sharedInstance];
  uint64_t v14 = [v13 applicationWithBundleIdentifier:v7];

  id v15 = [v14 appPolicy];
  if ([v15 launchUsingTemplateUI])
  {
    id v16 = DBLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v24 = v7;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Dead process is template app %{public}@", buf, 0xCu);
    }

    int v17 = [(DBDashboard *)self sceneForApplication:v14];
    if (v17)
    {
      id v18 = DBLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        id v24 = v7;
        _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Dead process had template host scene, destroying scene for identifier: %{public}@", buf, 0xCu);
      }

      [v17 updateSettingsWithBlock:&__block_literal_global_740];
      uint64_t v19 = [MEMORY[0x263F3F4F0] sharedInstance];
      id v20 = [v17 identifier];
      [v19 destroyScene:v20 withTransitionContext:0];
    }
  }
}

void __74__DBDashboard_processMonitor_shouldHandleDeathOfBundleIdentifier_isCrash___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 clientProcess];
  id v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.CarPlayTemplateUIHost"];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 identifier];
    [v6 addObject:v7];
  }
}

void __74__DBDashboard_processMonitor_shouldHandleDeathOfBundleIdentifier_isCrash___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F3F4F0];
  id v3 = a2;
  id v4 = [v2 sharedInstance];
  [v4 destroyScene:v3 withTransitionContext:0];
}

uint64_t __74__DBDashboard_processMonitor_shouldHandleDeathOfBundleIdentifier_isCrash___block_invoke_738(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)processMonitor:(id)a3 didHandleDeathOfBundleIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Handling post-death of process with identifier: %{public}@", buf, 0xCu);
  }

  if ([v5 isEqualToString:@"com.apple.CarPlayTemplateUIHost"])
  {
    id v7 = [(DBDashboard *)self templateAppProcessMonitor];
    id v8 = [v7 states];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__DBDashboard_processMonitor_didHandleDeathOfBundleIdentifier___block_invoke;
    v9[3] = &unk_2649B4EA0;
    void v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __63__DBDashboard_processMonitor_didHandleDeathOfBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 isRunning])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v7 process];
    id v5 = [v4 bundle];
    id v6 = [v5 identifier];
    [v3 _createBackgroundSceneForTemplateAppBundleID:v6];
  }
}

- (void)thermalMonitorLevelDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke;
  void v6[3] = &unk_2649B3D30;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromDBThermalLevel([*(id *)(a1 + 32) level]);
    *(_DWORD *)id buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "Thermal level changed to %@", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) suggestedFrameRateLimit];
  id v5 = [*(id *)(a1 + 40) identifierToAppScenesMap];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke_742;
  v7[3] = &unk_2649B4A78;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke_742(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 uiSettings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 conformsToProtocol:&unk_26E239948]
    && [v7 isForeground])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke_2;
    v10[3] = &unk_2649B4CF8;
    id v11 = *(id *)(a1 + 32);
    [v6 updateSettingsWithBlock:v10];
    id v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)id buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_INFO, "Updated frameRateLimit to %@ for %@", buf, 0x16u);
    }
  }
}

void __44__DBDashboard_thermalMonitorLevelDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_26E239A40]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }

  [v3 setFrameRateLimit:*(void *)(a1 + 32)];
}

- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(DBDashboard *)self workspace];
  id v10 = [v9 state];
  id v11 = [v10 activeBundleIdentifier];

  uint64_t v12 = +[DBApplicationController sharedInstance];
  uint64_t v13 = [v12 applicationWithBundleIdentifier:v11];

  if ([v13 presentsFullScreen])
  {
    __int16 v14 = [(DBDashboard *)self cornerRadiusWindow];
    [v14 setHidden:1];
  }
  else
  {
    id v15 = [(DBDashboard *)self environmentConfiguration];
    __int16 v14 = [v15 wallpaperPreferences];

    uint64_t v16 = [(DBDashboard *)self cornerRadiusWindow];
    int v17 = [v14 currentWallpaper];
    id v18 = [v17 traits];
    if ([v18 hideRoundedCorners])
    {
      [v16 setHidden:1];
    }
    else
    {
      uint64_t v19 = [(DBDashboard *)self environmentConfiguration];
      objc_msgSend(v16, "setHidden:", objc_msgSend(v19, "currentViewAreaSupportsUIOutsideSafeArea"));
    }
  }

  id v20 = [(DBDashboard *)self layoutEngine];
  [v20 areaOfInterestFrameForApplication:v13];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  id v29 = [(DBDashboard *)self interestingView];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  double v30 = [v8 stackedEntity];

  double v31 = [v7 stackedEntity];

  if (v31 != v30)
  {
    double v32 = [v31 identifier];
    double v33 = [v30 identifier];
    char v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
      if (self->_interruptedPunchthroughIdentifier)
      {
        uint64_t v35 = objc_opt_class();
        if ([v35 isEqual:objc_opt_class()])
        {
          double v36 = DBLogForCategory(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v46) = 0;
            _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "No longer saving interrupted PT", (uint8_t *)&v46, 2u);
          }

LABEL_24:
          interruptedPunchthroughIdentifier = self->_interruptedPunchthroughIdentifier;
          self->_interruptedPunchthroughIdentifier = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      if (v31)
      {
        double v37 = objc_opt_class();
        if ([v37 isEqual:objc_opt_class()])
        {
          BOOL v38 = objc_opt_class();
          if (([v38 isEqual:objc_opt_class()] & 1) == 0)
          {
            uint64_t v39 = [v30 identifier];
            double v40 = self->_interruptedPunchthroughIdentifier;
            self->_interruptedPunchthroughIdentifier = v39;

            interruptedPunchthroughIdentifier = DBLogForCategory(0);
            if (os_log_type_enabled(interruptedPunchthroughIdentifier, OS_LOG_TYPE_DEFAULT))
            {
              double v42 = self->_interruptedPunchthroughIdentifier;
              int v46 = 138543362;
              double v47 = v42;
              _os_log_impl(&dword_22D6F0000, interruptedPunchthroughIdentifier, OS_LOG_TYPE_DEFAULT, "Saving interrupted PT: %{public}@", (uint8_t *)&v46, 0xCu);
            }
            goto LABEL_25;
          }
        }
      }
      else if (self->_interruptedPunchthroughIdentifier)
      {
        double v43 = objc_opt_class();
        if (([v43 isEqual:objc_opt_class()] & 1) == 0)
        {
          double v44 = DBLogForCategory(0);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            double v45 = self->_interruptedPunchthroughIdentifier;
            int v46 = 138543362;
            double v47 = v45;
            _os_log_impl(&dword_22D6F0000, v44, OS_LOG_TYPE_DEFAULT, "Stacked entity dismissed without replacement, re-presenting interrupted PT: %{public}@", (uint8_t *)&v46, 0xCu);
          }

          [(DBDashboard *)self _presentPunchthroughWithIdentifier:self->_interruptedPunchthroughIdentifier];
          goto LABEL_24;
        }
      }
    }
  }
LABEL_26:
  objc_opt_class();
  [(DBDashboard *)self _notifyClimateWindowIsPunchthroughPresented:objc_opt_isKindOfClass() & 1];
  [(DBDashboard *)self _updateAudioNotificationBlocker];
}

- (void)willUpdateThemeData:(id)a3 withDuration:(double)a4 delay:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(DBDashboard *)self environmentConfiguration];
  id v13 = [v9 wallpaperPreferences];

  id v10 = [v13 wallpaperFromThemeData:v8];

  id v11 = [v13 currentWallpaper];
  char v12 = [v11 isEqual:v10];

  if ((v12 & 1) == 0)
  {
    [v13 setStagedWallpaper:v10];
    [(DBDashboard *)self _updateWallpaperWithAnimationDuration:a4 delay:a5];
  }
}

- (void)goToPageContainingBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBDashboard *)self rootViewController];
  uint64_t v9 = [v8 homeViewController];
  id v10 = [v9 folderController];
  id v11 = [v10 folderControllers];
  char v12 = [v11 firstObject];

  id v13 = [v12 iconModel];
  __int16 v14 = [v13 leafIconForIdentifier:v7];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__DBDashboard_goToPageContainingBundleIdentifier_completion___block_invoke;
  v16[3] = &unk_2649B4EC8;
  id v17 = v6;
  id v15 = v6;
  [v12 setCurrentPageIndexToListDirectlyContainingIcon:v14 animated:0 completion:v16];
}

uint64_t __61__DBDashboard_goToPageContainingBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (DBDashboardStateProvider)dashboardStateProvider
{
  return self->_dashboardStateProvider;
}

- (void)setDashboardStateProvider:(id)a3
{
}

- (CRSUIPunchThroughService)punchThroughService
{
  return self->_punchThroughService;
}

- (void)setPunchThroughService:(id)a3
{
}

- (BSInvalidatable)punchThroughServiceDomainActivationToken
{
  return self->_punchThroughServiceDomainActivationToken;
}

- (void)setPunchThroughServiceDomainActivationToken:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (NSMutableDictionary)identifierToAppScenesMap
{
  return self->_identifierToAppScenesMap;
}

- (void)setIdentifierToAppScenesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToForegroundAppScenesMap
{
  return self->_identifierToForegroundAppScenesMap;
}

- (void)setIdentifierToForegroundAppScenesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToApplicationMap
{
  return self->_identifierToApplicationMap;
}

- (void)setIdentifierToApplicationMap:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (UIWindow)mainWindow
{
  return self->_mainWindow;
}

- (void)setMainWindow:(id)a3
{
}

- (DBDashboardRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void)setWorkspace:(id)a3
{
}

- (DBDashboardWorkspaceOwner)workspaceOwner
{
  return self->_workspaceOwner;
}

- (void)setWorkspaceOwner:(id)a3
{
}

- (NSDictionary)settingsCategoryToBundleID
{
  return self->_settingsCategoryToBundleID;
}

- (void)setSettingsCategoryToBundleID:(id)a3
{
}

- (DBClimateWindow)climateWindow
{
  return self->_climateWindow;
}

- (void)setClimateWindow:(id)a3
{
}

- (_TtC9DashBoard23DBClimateViewController)climateViewController
{
  return self->_climateViewController;
}

- (void)setClimateViewController:(id)a3
{
}

- (DBAudioWindow)audioWindow
{
  return self->_audioWindow;
}

- (void)setAudioWindow:(id)a3
{
}

- (_TtC9DashBoard33DBAudioNotificationViewController)audioViewController
{
  return self->_audioViewController;
}

- (void)setAudioViewController:(id)a3
{
}

- (DBAudioNotificationManager)audioNotificationManager
{
  return self->_audioNotificationManager;
}

- (void)setAudioNotificationManager:(id)a3
{
}

- (CRSUIVolumeNotificationService)volumeNotificationService
{
  return self->_volumeNotificationService;
}

- (void)setVolumeNotificationService:(id)a3
{
}

- (BSInvalidatable)volumeNotificationServiceDomainActivationToken
{
  return self->_volumeNotificationServiceDomainActivationToken;
}

- (void)setVolumeNotificationServiceDomainActivationToken:(id)a3
{
}

- (DBCameraWindow)cameraWindow
{
  return self->_cameraWindow;
}

- (void)setCameraWindow:(id)a3
{
}

- (_TtC9DashBoard22DBCameraViewController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
}

- (DBStatusBarWindow)passengerStatusBarWindow
{
  return self->_passengerStatusBarWindow;
}

- (void)setPassengerStatusBarWindow:(id)a3
{
}

- (DBRootStatusBarViewController)passengerStatusBarViewController
{
  return self->_passengerStatusBarViewController;
}

- (void)setPassengerStatusBarViewController:(id)a3
{
}

- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion
{
  return self->_statusBarStyleAssertion;
}

- (void)setStatusBarStyleAssertion:(id)a3
{
}

- (DBStatusBarWindow)driverStatusBarWindow
{
  return self->_driverStatusBarWindow;
}

- (void)setDriverStatusBarWindow:(id)a3
{
}

- (DBRootStatusBarViewController)driverStatusBarViewController
{
  return self->_driverStatusBarViewController;
}

- (void)setDriverStatusBarViewController:(id)a3
{
}

- (DBStatusBarStateProvider)statusBarStateProvider
{
  return self->_statusBarStateProvider;
}

- (void)setStatusBarStateProvider:(id)a3
{
}

- (DBStatusBarHostWindow)statusBarHostWindow
{
  return self->_statusBarHostWindow;
}

- (void)setStatusBarHostWindow:(id)a3
{
}

- (CRSUIStatusBarStyleService)statusBarStyleService
{
  return self->_statusBarStyleService;
}

- (void)setStatusBarStyleService:(id)a3
{
}

- (BSInvalidatable)serviceDomainActivationToken
{
  return self->_serviceDomainActivationToken;
}

- (void)setServiceDomainActivationToken:(id)a3
{
}

- (DBLockOutController)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
}

- (BSInvalidatable)preventPasscodeLockToken
{
  return self->_preventPasscodeLockToken;
}

- (void)setPreventPasscodeLockToken:(id)a3
{
}

- (BSInvalidatable)preventSpuriousScreenUndimToken
{
  return self->_preventSpuriousScreenUndimToken;
}

- (void)setPreventSpuriousScreenUndimToken:(id)a3
{
}

- (DBNotificationWindow)notificationWindow
{
  return self->_notificationWindow;
}

- (void)setNotificationWindow:(id)a3
{
}

- (DBNotificationViewController)notificationViewController
{
  return self->_notificationViewController;
}

- (void)setNotificationViewController:(id)a3
{
}

- (_TtC9DashBoard21DBWallpaperHostWindow)wallpaperHostWindow
{
  return self->_wallpaperHostWindow;
}

- (void)setWallpaperHostWindow:(id)a3
{
}

- (_TtC9DashBoard17DBWallpaperWindow)wallpaperWindow
{
  return self->_wallpaperWindow;
}

- (void)setWallpaperWindow:(id)a3
{
}

- (_TtC9DashBoard29DBWallpaperRootViewController)wallpaperRootViewController
{
  return self->_wallpaperRootViewController;
}

- (void)setWallpaperRootViewController:(id)a3
{
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (void)setAlertViewController:(id)a3
{
}

- (DBSiriViewController)siriViewController
{
  return self->_siriViewController;
}

- (void)setSiriViewController:(id)a3
{
}

- (DBFocusController)focusController
{
  return self->_focusController;
}

- (void)setFocusController:(id)a3
{
}

- (DBFocusMovementManager)focusMovementManager
{
  return self->_focusMovementManager;
}

- (void)setFocusMovementManager:(id)a3
{
}

- (SiriLongPressButtonSource)siriButtonSource
{
  return self->_siriButtonSource;
}

- (void)setSiriButtonSource:(id)a3
{
}

- (SiriAssertion)siriPrewarmAssertion
{
  return self->_siriPrewarmAssertion;
}

- (void)setSiriPrewarmAssertion:(id)a3
{
}

- (SiriActivityAssertion)siriButtonAssertion
{
  return self->_siriButtonAssertion;
}

- (void)setSiriButtonAssertion:(id)a3
{
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
}

- (double)siriPrewarmTimestamp
{
  return self->_siriPrewarmTimestamp;
}

- (void)setSiriPrewarmTimestamp:(double)a3
{
  self->_siriPrewarmTimestamp = a3;
}

- (DBNowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (BOOL)isScreenAvailable
{
  return self->_screenAvailable;
}

- (void)setScreenAvailable:(BOOL)a3
{
  self->_screenAvailable = a3;
}

- (BOOL)showingApp
{
  return self->_showingApp;
}

- (void)setShowingApp:(BOOL)a3
{
  self->_showingApp = a3;
}

- (id)activeCallScreenBorrowToken
{
  return self->_activeCallScreenBorrowToken;
}

- (void)setActiveCallScreenBorrowToken:(id)a3
{
}

- (BOOL)pendingInCallServiceActivation
{
  return self->_pendingInCallServiceActivation;
}

- (void)setPendingInCallServiceActivation:(BOOL)a3
{
  self->_pendingInCallServiceActivation = a3;
}

- (DBStatusBarHomeButtonStateManager)homeButtonStateManager
{
  return self->_homeButtonStateManager;
}

- (void)setHomeButtonStateManager:(id)a3
{
}

- (void)setScreenshotManager:(id)a3
{
}

- (UIWindow)resizeWindow
{
  return self->_resizeWindow;
}

- (void)setResizeWindow:(id)a3
{
}

- (double)currentCornerRadius
{
  return self->_currentCornerRadius;
}

- (void)setCurrentCornerRadius:(double)a3
{
  self->_double currentCornerRadius = a3;
}

- (DBSplashScreenAlert)splashScreenAlert
{
  return self->_splashScreenAlert;
}

- (void)setSplashScreenAlert:(id)a3
{
}

- (BSInvalidatable)oemScreenLayoutElementAssertion
{
  return self->_oemScreenLayoutElementAssertion;
}

- (void)setOemScreenLayoutElementAssertion:(id)a3
{
}

- (UIWindow)interestingWindow
{
  return self->_interestingWindow;
}

- (void)setInterestingWindow:(id)a3
{
}

- (UIView)interestingView
{
  return self->_interestingView;
}

- (void)setInterestingView:(id)a3
{
}

- (UIWindow)cornerRadiusWindow
{
  return self->_cornerRadiusWindow;
}

- (void)setCornerRadiusWindow:(id)a3
{
}

- (UIView)cornerRadiusView
{
  return self->_cornerRadiusView;
}

- (void)setCornerRadiusView:(id)a3
{
}

- (UIWindow)voiceControlWindow
{
  return self->_voiceControlWindow;
}

- (void)setVoiceControlWindow:(id)a3
{
}

- (_TtC9DashBoard28DBVoiceControlViewController)voiceControlViewController
{
  return self->_voiceControlViewController;
}

- (void)setVoiceControlViewController:(id)a3
{
}

- (int)connectedNotifyToken
{
  return self->_connectedNotifyToken;
}

- (void)setConnectedNotifyToken:(int)a3
{
  self->_int connectedNotifyToken = a3;
}

- (RBSProcessMonitor)templateAppProcessMonitor
{
  return self->_templateAppProcessMonitor;
}

- (void)setTemplateAppProcessMonitor:(id)a3
{
}

- (DBUserAlertServer)userAlertServer
{
  return self->_userAlertServer;
}

- (void)setUserAlertServer:(id)a3
{
}

- (CARDisplayInfo)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)uisyncSessionCommandHandler
{
  return self->_uisyncSessionCommandHandler;
}

- (void)setUisyncSessionCommandHandler:(id)a3
{
}

- (_TtC9DashBoard15DBCAFCarManager)carManager
{
  return self->_carManager;
}

- (void)setCarManager:(id)a3
{
}

- (CAFCameraGeneral)camera
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_camera);
  return (CAFCameraGeneral *)WeakRetained;
}

- (void)setCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_camera);
  objc_storeStrong((id *)&self->_carManager, 0);
  objc_storeStrong((id *)&self->_uisyncSessionCommandHandler, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_userAlertServer, 0);
  objc_storeStrong((id *)&self->_templateAppProcessMonitor, 0);
  objc_storeStrong((id *)&self->_voiceControlViewController, 0);
  objc_storeStrong((id *)&self->_voiceControlWindow, 0);
  objc_storeStrong((id *)&self->_cornerRadiusView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusWindow, 0);
  objc_storeStrong((id *)&self->_interestingView, 0);
  objc_storeStrong((id *)&self->_interestingWindow, 0);
  objc_storeStrong((id *)&self->_oemScreenLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_splashScreenAlert, 0);
  objc_storeStrong((id *)&self->_resizeWindow, 0);
  objc_storeStrong((id *)&self->_screenshotManager, 0);
  objc_storeStrong((id *)&self->_homeButtonStateManager, 0);
  objc_storeStrong(&self->_activeCallScreenBorrowToken, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_siriButtonAssertion, 0);
  objc_storeStrong((id *)&self->_siriPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_siriButtonSource, 0);
  objc_storeStrong((id *)&self->_focusMovementManager, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_siriViewController, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_wallpaperRootViewController, 0);
  objc_storeStrong((id *)&self->_wallpaperWindow, 0);
  objc_storeStrong((id *)&self->_wallpaperHostWindow, 0);
  objc_storeStrong((id *)&self->_notificationViewController, 0);
  objc_storeStrong((id *)&self->_notificationWindow, 0);
  objc_storeStrong((id *)&self->_preventSpuriousScreenUndimToken, 0);
  objc_storeStrong((id *)&self->_preventPasscodeLockToken, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_serviceDomainActivationToken, 0);
  objc_storeStrong((id *)&self->_statusBarStyleService, 0);
  objc_storeStrong((id *)&self->_statusBarHostWindow, 0);
  objc_storeStrong((id *)&self->_statusBarStateProvider, 0);
  objc_storeStrong((id *)&self->_driverStatusBarViewController, 0);
  objc_storeStrong((id *)&self->_driverStatusBarWindow, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_passengerStatusBarViewController, 0);
  objc_storeStrong((id *)&self->_passengerStatusBarWindow, 0);
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_storeStrong((id *)&self->_cameraWindow, 0);
  objc_storeStrong((id *)&self->_volumeNotificationServiceDomainActivationToken, 0);
  objc_storeStrong((id *)&self->_volumeNotificationService, 0);
  objc_storeStrong((id *)&self->_audioNotificationManager, 0);
  objc_storeStrong((id *)&self->_audioViewController, 0);
  objc_storeStrong((id *)&self->_audioWindow, 0);
  objc_storeStrong((id *)&self->_climateViewController, 0);
  objc_storeStrong((id *)&self->_climateWindow, 0);
  objc_storeStrong((id *)&self->_settingsCategoryToBundleID, 0);
  objc_storeStrong((id *)&self->_workspaceOwner, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_mainWindow, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_identifierToApplicationMap, 0);
  objc_storeStrong((id *)&self->_identifierToForegroundAppScenesMap, 0);
  objc_storeStrong((id *)&self->_identifierToAppScenesMap, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_punchThroughServiceDomainActivationToken, 0);
  objc_storeStrong((id *)&self->_punchThroughService, 0);
  objc_storeStrong((id *)&self->_dashboardStateProvider, 0);
  objc_storeStrong((id *)&self->_interruptedPunchthroughIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionRinger, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionTelephonyDrop, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionACSelect, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionACHome, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionACBack, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertion, 0);
}

- (void)initWithWindowScene:environmentConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_FAULT, "Unexpected nil hardware identifier for display configuration: %{public}@", v1, 0xCu);
}

- (void)_handleOpenApplicationEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "App %{public}@ requires preflight! Showing alert.", v4, v5, v6, v7, v8);
}

- (void)_handleOpenApplicationEvent:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  uint64_t v4 = DBDescriptionForLaunchSource(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22D6F0000, v5, v6, "App %{public}@ requires preflight! Ignoring open application request from launch source %{public}@.", v7, v8, v9, v10, v11);
}

- (void)_handleOpenApplicationEvent:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Ignoring open application request for unknown application!", v2, v3, v4, v5, v6);
}

- (void)_handleOpenApplicationEvent:(void *)a1 .cold.4(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  uint64_t v4 = DBDescriptionForLaunchSource(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22D6F0000, v5, v6, "App %{public}@ is blocked! Ignoring open application request from launch source %{public}@.", v7, v8, v9, v10, v11);
}

- (void)_updateWallpaperWithAnimationDuration:delay:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "Automatic appearance enabled, but the current wallpaper selection doesn't allow it! %{public}@", v2, v3, v4, v5, v6);
}

- (void)_supportsDisplayingPunchthroughWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "Display does not support punchthrough with identifier: %@", v2, v3, v4, v5, v6);
}

- (void)_supportsDisplayingPunchthroughWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Display does not support ddp content", v2, v3, v4, v5, v6);
}

- (void)_presentPunchthroughWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "Unable to activate punchthrough with identifier: %@", v2, v3, v4, v5, v6);
}

- (void)_handleOEMNotificationURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempted to handle nil URL from OEM notification.", v2, v3, v4, v5, v6);
}

- (void)_handleInputStreamURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Input stream URL did not have a valid input stream identifier", v2, v3, v4, v5, v6);
}

- (void)_handleAutoSettingsURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Unable to find AutoSettings app info", v2, v3, v4, v5, v6);
}

- (void)sceneInterfaceStyleForApplication:proxyApplication:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Attempting to get style but no vehicle available", v2, v3, v4, v5, v6);
}

- (void)handleEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "No URL provided with OEM notification action", v2, v3, v4, v5, v6);
}

- (void)inCallAssertionServiceDidPresent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Unable to look up app info for InCallService", v2, v3, v4, v5, v6);
}

- (void)_handleSiriPrewarmWithTimestamp:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 lockOutController];
  uint64_t v2 = DBDescriptionForLockOutMode([v1 lockOutMode]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v3, v4, "Ignoring Siri prewarm action due to lockout mode: %@", v5, v6, v7, v8, v9);
}

- (void)_handleSiriPrewarmWithTimestamp:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Siri prewarm assertion being requested when one already exists", v2, v3, v4, v5, v6);
}

- (void)_handleSiriButtonDownWithTimestamp:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 lockOutController];
  uint64_t v2 = DBDescriptionForLockOutMode([v1 lockOutMode]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v3, v4, "Ignoring external Siri button down action due to lockout mode: %@", v5, v6, v7, v8, v9);
}

- (void)_handleSiriButtonDownWithTimestamp:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Home button assertion being requested when one already exists", v2, v3, v4, v5, v6);
}

- (void)_handleSiriButtonUpWithTimestamp:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 lockOutController];
  uint64_t v2 = DBDescriptionForLockOutMode([v1 lockOutMode]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v3, v4, "Ignoring external Siri button up action due to lockout mode: %@", v5, v6, v7, v8, v9);
}

void __33__DBDashboard__handleSessionURL___block_invoke_620_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "Couldn't resolve a URL request for %{public}@ to a bundle identifier.", (uint8_t *)&v3, 0xCu);
}

- (void)alertServer:wantsSystemPresentationForViewController:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "System UserAlerts are not supported in CarPlay", v2, v3, v4, v5, v6);
}

- (void)willPresentPresentable:forNotificationViewController:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Notification view controller is presenting a banner, but we have no banner scene!", v2, v3, v4, v5, v6);
}

@end