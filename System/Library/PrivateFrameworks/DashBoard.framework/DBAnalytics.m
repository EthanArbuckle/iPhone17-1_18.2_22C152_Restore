@interface DBAnalytics
+ (BOOL)shouldSendAnalyticsEvents;
+ (id)_axColorFiltersIntensityStringForFloat:(double)a3;
+ (id)_axPhoneColorFiltersAnalyticsString;
+ (id)_axPhoneSoundRecognitionAnalyticsString:(unint64_t)a3;
+ (void)biome_CarPlayStarted:(BOOL)a3 wireless:(BOOL)a4;
- (BOOL)_queue_stateProviderIsReadyForAnalytics:(id)a3;
- (BOOL)accessorySupportsLocationChinaShifted;
- (BOOL)accessorySupportsLocationDeadReckoning;
- (BOOL)accessorySupportsLocationGPGGA;
- (BOOL)accessorySupportsLocationGPRMC;
- (BOOL)accessorySupportsLocationPASCDSpeed;
- (BOOL)sessionStartedEventSent;
- (CARAutomaticDNDStatus)dndStatus;
- (CARConnectionTimeStore)connectionTimeStore;
- (CRSSiriPreferences)siriPreferences;
- (DBAnalytics)initWithEnvironmentConfiguration:(id)a3;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBKeybagMonitor)keybagMonitor;
- (DBNowPlayingObserver)nowPlayingObserver;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSDate)audioOwnershipDate;
- (NSDate)firstFrameTimestamp;
- (NSDate)mediaserverdDiedDate;
- (NSDate)screenOwnershipDate;
- (NSDate)sessionStartDate;
- (NSDate)thermalTrapDate;
- (NSDate)wifiLinkDownDate;
- (NSDate)wifidDiedDate;
- (NSDictionary)vehicleAnalyticsRepresentation;
- (NSMutableArray)analyticsAppInfo;
- (NSMutableArray)analyticsLayoutInfo;
- (NSMutableArray)analyticsScreenInfo;
- (NSMutableDictionary)sessionAppLaunches;
- (NSMutableDictionary)sessionDeviceAppLaunches;
- (NSMutableDictionary)sessionNavigationOwners;
- (NSMutableString)sessionThermalLevels;
- (NSOperationQueue)analyticsQueue;
- (NSString)accessorySupportsLocation;
- (NSString)lastActiveBundleIdentifier;
- (NSString)lastDashboardAudioWidgetBundleIdentifier;
- (NSString)lastDashboardNavigationBundleIdentifier;
- (NSString)siriHostedBundleIdentifier;
- (NSString)startBundleIdentifier;
- (NSString)wifiLinkDownReason;
- (_DBAnalyticsChargeInfo)analyticsChargeInfo;
- (_DBAnalyticsTimeAccumulator)analyticsNavOwnershipInfo;
- (double)audioOwnershipDuration;
- (double)screenOwnershipDuration;
- (id)_analyticsInfoPassingTest:(id)a3;
- (id)_analyticsLayoutInfoPassingTest:(id)a3;
- (id)announceMessagesState;
- (id)appAnalyticsInfoForApp:(id)a3;
- (id)appAnalyticsInfoForBundleIdentifier:(id)a3;
- (id)dictionaryFromInterrupt;
- (id)nowPlayingAppAnalyticsInfo;
- (id)stringFromInterruptDictionary:(id)a3;
- (id)stringFromSessionSummary;
- (id)visibleAppsAnalyticsInfo;
- (id)visibleClusterAppsAnalyticsInfo;
- (id)visibleDashboardAppsAnalyticsInfo;
- (int64_t)currentChargingState;
- (int64_t)currentThermalLevel;
- (int64_t)mapsAppearanceStyle;
- (unint64_t)lastHomeScreenPageType;
- (unint64_t)sessionRequestUIBundleIdentifierCount;
- (unint64_t)sessionRequestUIMapsCount;
- (unint64_t)sessionRequestUIMessagesCount;
- (unint64_t)sessionRequestUIMusicCount;
- (unint64_t)sessionRequestUIPhoneCount;
- (unint64_t)sessionShowUIMapCount;
- (unint64_t)sessionShowUITurnCardCount;
- (unint64_t)sessionUnlockCount;
- (void)_DBLayoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)_appEndedNavigation:(id)a3;
- (void)_appStartedNavigation:(id)a3;
- (void)_applicationDidLaunch:(id)a3;
- (void)_carHasMainAudio:(id)a3;
- (void)_dashboardNowPlayingWidgetTapped:(id)a3;
- (void)_dashboardSmartWidgetUpdated:(id)a3;
- (void)_iosHasMainAudio:(id)a3;
- (void)_mediaserverdConnectionDied;
- (void)_queue_applicationWithBundleIdentifier:(id)a3 didStartNavigation:(BOOL)a4;
- (void)_queue_deviceDidChangeToBundleIdentifier:(id)a3;
- (void)_queue_didChangeToBundleIdentifier:(id)a3;
- (void)_queue_fetchLocationBits;
- (void)_queue_mediaserverdConnectionDied;
- (void)_queue_navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)_queue_nowPlayingUpdatedToApp:(id)a3 isPlaying:(BOOL)a4;
- (void)_queue_powerStateDidChange;
- (void)_queue_screenViewAreaChanged:(id)a3 screenInfo:(id)a4 configuration:(id)a5 duration:(double)a6;
- (void)_queue_sendAnnounceMessagesEvent;
- (void)_queue_sessionEnded;
- (void)_queue_sessionStarted;
- (void)_queue_thermalTrapOccurred;
- (void)_queue_wifidConnectionDied;
- (void)_screenBecameAvailable:(id)a3;
- (void)_screenBecameUnavailable:(id)a3;
- (void)addSessionAnalyticsValues:(id)a3 toEvent:(unint64_t)a4 completion:(id)a5;
- (void)applySessionStartedStorage:(id)a3;
- (void)changedLayout:(id)a3;
- (void)clusterForegroundElementDidChange:(id)a3;
- (void)dashboardAudioWidgetDidChangeToBundleIdentifier:(id)a3;
- (void)dashboardNavigationDidChangeToBundleIdentifier:(id)a3;
- (void)dashboardStateProvider:(id)a3 didChangeActiveBundleIdentifier:(id)a4;
- (void)dashboardStateProvider:(id)a3 didChangeHomeScreenPageType:(unint64_t)a4;
- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3;
- (void)firstFrameSent;
- (void)invalidate;
- (void)keybagMonitorLockStateDidChange:(id)a3;
- (void)navigationOwnershipChanged:(id)a3;
- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4;
- (void)nowPlayingObserver:(id)a3 didUpdatePlaybackState:(BOOL)a4 inApplication:(id)a5;
- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4;
- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4;
- (void)sendEvent:(unint64_t)a3 withParameters:(id)a4;
- (void)session:(id)a3 didSetViewArea:(id)a4 forScreenID:(id)a5 withDuration:(double)a6 transitionControlType:(unint64_t)a7;
- (void)session:(id)a3 openURL:(id)a4;
- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5;
- (void)setAccessorySupportsLocation:(id)a3;
- (void)setAccessorySupportsLocationChinaShifted:(BOOL)a3;
- (void)setAccessorySupportsLocationDeadReckoning:(BOOL)a3;
- (void)setAccessorySupportsLocationGPGGA:(BOOL)a3;
- (void)setAccessorySupportsLocationGPRMC:(BOOL)a3;
- (void)setAccessorySupportsLocationPASCDSpeed:(BOOL)a3;
- (void)setAnalyticsAppInfo:(id)a3;
- (void)setAnalyticsChargeInfo:(id)a3;
- (void)setAnalyticsLayoutInfo:(id)a3;
- (void)setAnalyticsNavOwnershipInfo:(id)a3;
- (void)setAnalyticsQueue:(id)a3;
- (void)setAnalyticsScreenInfo:(id)a3;
- (void)setAudioOwnershipDate:(id)a3;
- (void)setAudioOwnershipDuration:(double)a3;
- (void)setConnectionTimeStore:(id)a3;
- (void)setCurrentChargingState:(int64_t)a3;
- (void)setCurrentThermalLevel:(int64_t)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setDndStatus:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setFirstFrameTimestamp:(id)a3;
- (void)setKeybagMonitor:(id)a3;
- (void)setLastActiveBundleIdentifier:(id)a3;
- (void)setLastDashboardAudioWidgetBundleIdentifier:(id)a3;
- (void)setLastDashboardNavigationBundleIdentifier:(id)a3;
- (void)setLastHomeScreenPageType:(unint64_t)a3;
- (void)setMapsAppearanceStyle:(int64_t)a3;
- (void)setMediaserverdDiedDate:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setScreenOwnershipDate:(id)a3;
- (void)setScreenOwnershipDuration:(double)a3;
- (void)setSessionAppLaunches:(id)a3;
- (void)setSessionDeviceAppLaunches:(id)a3;
- (void)setSessionNavigationOwners:(id)a3;
- (void)setSessionRequestUIBundleIdentifierCount:(unint64_t)a3;
- (void)setSessionRequestUIMapsCount:(unint64_t)a3;
- (void)setSessionRequestUIMessagesCount:(unint64_t)a3;
- (void)setSessionRequestUIMusicCount:(unint64_t)a3;
- (void)setSessionRequestUIPhoneCount:(unint64_t)a3;
- (void)setSessionShowUIMapCount:(unint64_t)a3;
- (void)setSessionShowUITurnCardCount:(unint64_t)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSessionStartedEventSent:(BOOL)a3;
- (void)setSessionThermalLevels:(id)a3;
- (void)setSessionUnlockCount:(unint64_t)a3;
- (void)setSiriHostedBundleIdentifier:(id)a3;
- (void)setSiriPreferences:(id)a3;
- (void)setStartBundleIdentifier:(id)a3;
- (void)setThermalTrapDate:(id)a3;
- (void)setVehicleAnalyticsRepresentation:(id)a3;
- (void)setWifiLinkDownDate:(id)a3;
- (void)setWifiLinkDownReason:(id)a3;
- (void)setWifidDiedDate:(id)a3;
- (void)siriDidDismiss;
- (void)siriDidPresent;
- (void)siriDidStartHostingBundleIdentifier:(id)a3;
- (void)thermalMonitorLevelDidChange:(id)a3;
- (void)userPressedTransitionControl;
@end

@implementation DBAnalytics

- (DBAnalytics)initWithEnvironmentConfiguration:(id)a3
{
  id v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)DBAnalytics;
  v5 = [(DBAnalytics *)&v80 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environmentConfiguration, v4);
    [v4 addObserver:v6];
    v7 = [v4 thermalMonitor];
    [v7 addObserver:v6];

    v8 = [(DBAnalytics *)v6 environmentConfiguration];
    v9 = [v8 vehicle];
    v6->_mapsAppearanceStyle = [v9 mapsAppearancePreference];

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    analyticsAppInfo = v6->_analyticsAppInfo;
    v6->_analyticsAppInfo = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    analyticsScreenInfo = v6->_analyticsScreenInfo;
    v6->_analyticsScreenInfo = (NSMutableArray *)v12;

    v6->_screenOwnershipDuration = 0.0;
    v6->_sessionUnlockCount = 0;
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    sessionAppLaunches = v6->_sessionAppLaunches;
    v6->_sessionAppLaunches = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    sessionDeviceAppLaunches = v6->_sessionDeviceAppLaunches;
    v6->_sessionDeviceAppLaunches = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    sessionNavigationOwners = v6->_sessionNavigationOwners;
    v6->_sessionNavigationOwners = (NSMutableDictionary *)v18;

    v20 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    sessionThermalLevels = v6->_sessionThermalLevels;
    v6->_sessionThermalLevels = v20;

    v6->_audioOwnershipDuration = 0.0;
    v6->_sessionStartedEventSent = 0;
    uint64_t v22 = [MEMORY[0x263EFF980] array];
    analyticsLayoutInfo = v6->_analyticsLayoutInfo;
    v6->_analyticsLayoutInfo = (NSMutableArray *)v22;

    v24 = objc_alloc_init(_DBAnalyticsTimeAccumulator);
    analyticsNavOwnershipInfo = v6->_analyticsNavOwnershipInfo;
    v6->_analyticsNavOwnershipInfo = v24;

    v26 = (CRSSiriPreferences *)objc_alloc_init(MEMORY[0x263F312F8]);
    siriPreferences = v6->_siriPreferences;
    v6->_siriPreferences = v26;

    [(CRSSiriPreferences *)v6->_siriPreferences addObserver:v6];
    objc_initWeak(&location, v6);
    v28 = [v4 session];
    v29 = [v28 configuration];
    uint64_t v30 = [v29 transportType];

    if (v30 == 3)
    {
      v6->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
      v31 = (CWFInterface *)objc_alloc_init(MEMORY[0x263F386E0]);
      interface = v6->_interface;
      v6->_interface = v31;

      [(CWFInterface *)v6->_interface activate];
      v33 = v6->_interface;
      id v78 = 0;
      [(CWFInterface *)v33 startMonitoringEventType:6 error:&v78];
      id v34 = v78;
      if (v34)
      {
        v35 = DBLogForCategory(0xBuLL);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[DBAnalytics initWithEnvironmentConfiguration:]((uint64_t)v34, v35);
        }

        v36 = v6->_interface;
        v6->_interface = 0;
      }
    }
    if (v6->_wifiManager)
    {
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      WiFiManagerClientRegisterServerRestartCallback();
    }
    v37 = v6->_interface;
    if (v37)
    {
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke;
      v75[3] = &unk_2649B6560;
      v76 = v6;
      objc_copyWeak(&v77, &location);
      [(CWFInterface *)v37 setEventHandler:v75];
      objc_destroyWeak(&v77);
    }
    [(DBAnalytics *)v6 navigationOwnershipChanged:0];
    v38 = [[DBNowPlayingObserver alloc] initWithEnvironmentConfiguration:v4];
    nowPlayingObserver = v6->_nowPlayingObserver;
    v6->_nowPlayingObserver = v38;

    [(DBNowPlayingObserver *)v6->_nowPlayingObserver setDelegate:v6];
    v40 = objc_alloc_init(DBKeybagMonitor);
    keybagMonitor = v6->_keybagMonitor;
    v6->_keybagMonitor = v40;

    v42 = [(DBAnalytics *)v6 keybagMonitor];
    [v42 addObserver:v6];

    v43 = (CARAutomaticDNDStatus *)objc_alloc_init(MEMORY[0x263F30DF8]);
    dndStatus = v6->_dndStatus;
    v6->_dndStatus = v43;

    v45 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    analyticsQueue = v6->_analyticsQueue;
    v6->_analyticsQueue = v45;

    [(NSOperationQueue *)v6->_analyticsQueue setName:@"CarPlay Analytics Queue"];
    [(NSOperationQueue *)v6->_analyticsQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v6->_analyticsQueue setQualityOfService:25];
    v47 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    [v47 setNeedsUserInteractivePriority:1];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_3;
    v73[3] = &unk_2649B6588;
    objc_copyWeak(&v74, &location);
    [v47 setTransitionHandler:v73];
    uint64_t v48 = [MEMORY[0x263F3F728] monitorWithConfiguration:v47];
    displayLayoutMonitor = v6->_displayLayoutMonitor;
    v6->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v48;

    v50 = [MEMORY[0x263F08A00] defaultCenter];
    [v50 addObserver:v6 selector:sel__screenBecameAvailable_ name:*MEMORY[0x263F30DB8] object:0];

    v51 = [MEMORY[0x263F08A00] defaultCenter];
    [v51 addObserver:v6 selector:sel__screenBecameUnavailable_ name:*MEMORY[0x263F30DC0] object:0];

    v52 = [MEMORY[0x263F08A00] defaultCenter];
    [v52 addObserver:v6 selector:sel__dashboardSmartWidgetUpdated_ name:@"CARSmartWidgetPredictionUpdatedNotification" object:0];

    v53 = [MEMORY[0x263F08A00] defaultCenter];
    [v53 addObserver:v6 selector:sel__dashboardNowPlayingWidgetTapped_ name:@"CARNowPlayingWidgetInteractionNotification" object:0];

    v54 = [MEMORY[0x263F08A00] defaultCenter];
    [v54 addObserver:v6 selector:sel__applicationDidLaunch_ name:@"CARApplicationDidLaunchNotification" object:0];

    v55 = [MEMORY[0x263F087C8] defaultCenter];
    [v55 addObserver:v6 selector:sel__appStartedNavigation_ name:*MEMORY[0x263F30D88] object:0];

    v56 = [MEMORY[0x263F087C8] defaultCenter];
    [v56 addObserver:v6 selector:sel__appEndedNavigation_ name:*MEMORY[0x263F30D80] object:0];

    v57 = [MEMORY[0x263F08A00] defaultCenter];
    [v57 addObserver:v6 selector:sel__iosHasMainAudio_ name:*MEMORY[0x263F30DD0] object:0];

    v58 = [MEMORY[0x263F08A00] defaultCenter];
    [v58 addObserver:v6 selector:sel__carHasMainAudio_ name:*MEMORY[0x263F30D90] object:0];

    v59 = [MEMORY[0x263F08A00] defaultCenter];
    [v59 addObserver:v6 selector:sel__mediaserverdConnectionDied name:@"CARSessionServerConnectionDiedNotification" object:0];

    v60 = [MEMORY[0x263F08A00] defaultCenter];
    [v60 addObserver:v6 selector:sel_navigationOwnershipChanged_ name:*MEMORY[0x263F30DB0] object:0];

    v61 = [(DBAnalytics *)v6 analyticsQueue];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_4;
    v71[3] = &unk_2649B3E90;
    v62 = v6;
    v72 = v62;
    [v61 addOperationWithBlock:v71];

    CFDictionaryRef v63 = IOServiceMatching("IOPMPowerSource");
    LODWORD(v61) = *MEMORY[0x263F0EC90];
    v62->_powerSource = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v63);
    v64 = IONotificationPortCreate((mach_port_t)v61);
    v62->_powerNotificationPort = v64;
    if (!IOServiceAddInterestNotification(v64, v62->_powerSource, "IOGeneralInterest", (IOServiceInterestCallback)DBPowerChangeCallback, v62, &v62->_powerSourceNotification))
    {
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource(v62->_powerNotificationPort);
      CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      v67 = [(DBAnalytics *)v62 analyticsQueue];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_5;
      v69[3] = &unk_2649B3E90;
      v70 = v62;
      [v67 addOperationWithBlock:v69];
    }
    objc_destroyWeak(&v74);

    objc_destroyWeak(&location);
  }

  return v6;
}

void __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) analyticsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_2;
  v6[3] = &unk_2649B49E0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v5 = v3;
  id v7 = v5;
  [v4 addOperationWithBlock:v6];

  objc_destroyWeak(&v8);
}

void __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) type] == 6)
  {
    v2 = [*(id *)(a1 + 32) info];
    id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F386A8]];

    if ([v3 isLinkDown] && objc_msgSend(v3, "isInvoluntaryLinkDown"))
    {
      id v4 = [v3 timestamp];
      [WeakRetained setWifiLinkDownDate:v4];

      int v5 = [v3 reason];
      uint64_t v6 = [v3 subreason];
      id v7 = CFSTR("wifiLinkDown(Unknown,");
      if (v5 == 2) {
        id v7 = CFSTR("wifiLinkDown(BeaconLost,");
      }
      if (v5 == 1) {
        id v8 = CFSTR("wifiLinkDown(DEAUTH,");
      }
      else {
        id v8 = v7;
      }
      [WeakRetained setWifiLinkDownReason:v8];
      v9 = [WeakRetained wifiLinkDownReason];
      uint64_t v10 = [v9 stringByAppendingFormat:@"%ld"], v6);
      [WeakRetained setWifiLinkDownReason:v10];
    }
  }
}

void __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _DBLayoutMonitor:v9 didUpdateDisplayLayout:v8 withContext:v7];
}

void __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) environmentConfiguration];
  id v4 = [v2 session];

  id v3 = v4;
  if (v4)
  {
    [v4 addObserver:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_sessionStarted");
    id v3 = v4;
  }
}

uint64_t __48__DBAnalytics_initWithEnvironmentConfiguration___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_powerStateDidChange");
}

+ (BOOL)shouldSendAnalyticsEvents
{
  Class v2 = NSClassFromString(&cfstr_Xctestcase.isa);
  if (v2)
  {
    id v3 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Not recording events due to testing context.", v5, 2u);
    }
  }
  return v2 == 0;
}

- (id)dictionaryFromInterrupt
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  IOPSGetPercentRemaining();
  id v4 = [NSNumber numberWithInteger:0];
  [v3 setObject:v4 forKey:@"batteryPercentage"];

  uint64_t v5 = NSStringFromDBThermalLevel(self->_currentThermalLevel);
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"(no value)";
  }
  [v3 setObject:v7 forKey:@"thermalLevel"];

  id v8 = [(DBAnalytics *)self mediaserverdDiedDate];

  if (v8)
  {
    id v9 = [(DBAnalytics *)self mediaserverdDiedDate];
    [v3 setObject:v9 forKey:@"mediaserverd"];
  }
  uint64_t v10 = [(DBAnalytics *)self thermalTrapDate];

  if (v10)
  {
    v11 = [(DBAnalytics *)self thermalTrapDate];
    [v3 setObject:v11 forKey:@"thermalTrap"];
  }
  uint64_t v12 = [(DBAnalytics *)self wifiLinkDownDate];

  if (v12)
  {
    v13 = [(DBAnalytics *)self wifiLinkDownDate];
    uint64_t v14 = [(DBAnalytics *)self wifiLinkDownReason];
    [v3 setObject:v13 forKey:v14];
  }
  if ([v3 count]) {
    v15 = v3;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (id)stringFromInterruptDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    v23 = 0;
    goto LABEL_25;
  }
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"CARAnalyticsPreviousSessionEnd"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  id v7 = [MEMORY[0x263EFF910] date];
  [v6 DBSecondsToDate:v7];
  double v9 = v8;

  if (v9 >= 300.0) {
    goto LABEL_20;
  }
  v25 = v6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [v3 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v27;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      if (([v15 isEqualToString:@"batteryPercentage"] & 1) != 0
        || [v15 isEqualToString:@"thermalLevel"])
      {
        id v16 = NSString;
        v17 = [v3 objectForKey:v15];
        [v16 stringWithFormat:@"%@:%@", v15, v17];
        uint64_t v18 = LABEL_12:;
        [v4 addObject:v18];

        goto LABEL_13;
      }
      v17 = [v3 objectForKey:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [MEMORY[0x263EFF910] date];
        [v17 DBSecondsToDate:v19];
        double v21 = v20;

        if (v21 < 300.0)
        {
          [NSString stringWithFormat:@"%@:%fsecondsAgo", v15, *(void *)&v21];
          goto LABEL_12;
        }
      }
LABEL_13:

      ++v14;
    }
    while (v12 != v14);
    uint64_t v22 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    uint64_t v12 = v22;
  }
  while (v22);
LABEL_19:

  uint64_t v6 = v25;
LABEL_20:
  if ([v4 count])
  {
    v23 = [v4 componentsJoinedByString:@" "];
    goto LABEL_23;
  }
LABEL_22:
  v23 = 0;
LABEL_23:

LABEL_25:
  return v23;
}

- (id)stringFromSessionSummary
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(DBAnalytics *)self wifidDiedDate];

  if (v4)
  {
    uint64_t v5 = [(DBAnalytics *)self wifidDiedDate];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    [v5 DBSecondsToDate:v6];
    uint64_t v8 = v7;

    double v9 = objc_msgSend(NSString, "stringWithFormat:", @"wifid:%fsecondsAgo", v8);
    [v3 addObject:v9];
  }
  if ([v3 count])
  {
    uint64_t v10 = [v3 componentsJoinedByString:@" "];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)addSessionAnalyticsValues:(id)a3 toEvent:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(DBAnalytics *)self analyticsQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__DBAnalytics_addSessionAnalyticsValues_toEvent_completion___block_invoke;
  v13[3] = &unk_2649B65B0;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 addOperationWithBlock:v13];
}

void __60__DBAnalytics_addSessionAnalyticsValues_toEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48)) {
    Class v2 = @"DBDefaultsSessionEndedStorageKey";
  }
  else {
    Class v2 = @"DBDefaultsSessionStartedStorageKey";
  }
  id v3 = v2;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = [v4 dictionaryForKey:v3];

  if (v5)
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v7 = v6;
  [v6 setValuesForKeysWithDictionary:*(void *)(a1 + 32)];
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 setObject:v7 forKey:v3];

  id v9 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Stored %@ objects into user defaults for %@.", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
}

- (void)applySessionStartedStorage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__DBAnalytics_applySessionStartedStorage___block_invoke;
  v7[3] = &unk_2649B3D30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __42__DBAnalytics_applySessionStartedStorage___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) sessionStartedEventSent])
  {
    Class v2 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Already sent sessionStarted Event", buf, 2u);
    }
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = [*(id *)(a1 + 32) vehicleAnalyticsRepresentation];
    uint64_t v5 = [v3 dictionaryWithDictionary:v4];

    id v6 = NSNumber;
    uint64_t v7 = [*(id *)(a1 + 32) dndStatus];
    id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "shouldActivateWithCarPlay"));
    [v5 setObject:v8 forKeyedSubscript:@"DNDWDCarPlay"];

    id v9 = [MEMORY[0x263F30E80] fetchCarCapabilities];
    if ([v9 disabledFeature])
    {
      __int16 v14 = @"Restricted";
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) environmentConfiguration];
      uint64_t v11 = [v10 session];
      int v12 = [v11 configuration];
      uint64_t v13 = [v12 nowPlayingAlbumArtMode];

      if (v13 == 2) {
        __int16 v14 = @"On";
      }
      else {
        __int16 v14 = @"Off";
      }
    }
    [v5 setObject:v14 forKeyedSubscript:@"AlbumArtAllowed"];
    id v15 = [*(id *)(a1 + 32) environmentConfiguration];
    uint64_t v16 = [v15 vehicle];
    uint64_t v17 = [v16 appearanceModePreference];

    if (v17)
    {
      if (v17 == 1)
      {
        int v18 = 0;
        v19 = @"Always Light";
      }
      else if (v17 == 2)
      {
        int v18 = 0;
        v19 = @"Always Dark";
      }
      else
      {
        v19 = 0;
        int v18 = 1;
      }
    }
    else
    {
      int v18 = 0;
      v19 = @"Automatic";
    }
    *(_DWORD *)buf = 0;
    IOPSGetPercentRemaining();
    double v20 = [NSNumber numberWithInteger:0];
    double v21 = (id *)(a1 + 32);
    uint64_t v22 = [*(id *)(a1 + 32) analyticsChargeInfo];
    [v22 setStartingBatteryPercentage:v20];

    v23 = [*(id *)(a1 + 32) analyticsChargeInfo];
    v24 = [v23 startingBatteryPercentage];
    [v5 setObject:v24 forKeyedSubscript:@"batteryPercentage"];

    if (v18) {
      v25 = @"(no value)";
    }
    else {
      v25 = v19;
    }
    [v5 setObject:v25 forKeyedSubscript:@"Appearance"];
    long long v26 = [*v21 environmentConfiguration];
    long long v27 = [v26 wallpaperPreferences];
    long long v28 = [v27 currentWallpaper];
    uint64_t v29 = [v28 identifier];
    uint64_t v30 = (void *)v29;
    if (v29) {
      uint64_t v31 = (__CFString *)v29;
    }
    else {
      uint64_t v31 = @"(no value)";
    }
    [v5 setObject:v31 forKeyedSubscript:@"Wallpaper"];

    v32 = [*v21 vehicleAnalyticsRepresentation];
    uint64_t v33 = [v32 objectForKeyedSubscript:@"SourceVersion"];
    id v34 = (void *)v33;
    if (v33) {
      v35 = (__CFString *)v33;
    }
    else {
      v35 = @"(no value)";
    }
    [v5 setObject:v35 forKeyedSubscript:@"SourceVersion"];

    v36 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v37 = [v36 BOOLForKey:@"CARSmartWidgetHidden"];

    if (v37) {
      uint64_t v38 = MEMORY[0x263EFFA80];
    }
    else {
      uint64_t v38 = MEMORY[0x263EFFA88];
    }
    [v5 setObject:v38 forKeyedSubscript:@"DashboardSuggestions"];
    if (*(void *)(a1 + 40)) {
      objc_msgSend(v5, "addEntriesFromDictionary:");
    }
    *(void *)buf = 0;
    v67 = buf;
    uint64_t v68 = 0x2020000000;
    char v69 = 0;
    v39 = [*(id *)(a1 + 32) environmentConfiguration];
    v40 = [v39 session];
    v41 = [v40 configuration];
    v42 = [v41 screens];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __42__DBAnalytics_applySessionStartedStorage___block_invoke_316;
    v63[3] = &unk_2649B65D8;
    v63[4] = *(void *)(a1 + 32);
    Class v2 = v5;
    v64 = v2;
    v65 = buf;
    [v42 enumerateObjectsUsingBlock:v63];

    if (v67[24]) {
      v43 = @"YES";
    }
    else {
      v43 = @"NO";
    }
    v44 = v43;
    [v2 setObject:v44 forKeyedSubscript:@"secondVideoStream"];

    v45 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v46 = [v45 objectForKey:@"CARAnalyticsSessionInterruptKey"];

    uint64_t v47 = [*(id *)(a1 + 32) stringFromInterruptDictionary:v46];
    uint64_t v48 = (void *)v47;
    if (v47) {
      v49 = (__CFString *)v47;
    }
    else {
      v49 = @"(no value)";
    }
    v50 = v49;
    [v2 setObject:v50 forKeyedSubscript:@"previousSessionInterrupt"];

    v51 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v51 removeObjectForKey:@"CARAnalyticsSessionInterruptKey"];

    v52 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v52 removeObjectForKey:@"CARAnalyticsPreviousSessionEnd"];

    v53 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v54 = [v53 dictionaryForKey:@"DBDefaultsSessionStartedStorageKey"];

    if ([v54 count])
    {
      v55 = DBLogForCategory(0xBuLL);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v70 = 138412290;
        v71 = v56;
        _os_log_impl(&dword_22D6F0000, v55, OS_LOG_TYPE_DEFAULT, "Applying %@ donated values to sessionStarted event", v70, 0xCu);
      }
      [v2 setValuesForKeysWithDictionary:v54];
      v57 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v57 removeObjectForKey:@"DBDefaultsSessionStartedStorageKey"];
    }
    else
    {
      v57 = DBLogForCategory(0xBuLL);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v70 = 138412290;
        v71 = @"DBDefaultsSessionStartedStorageKey";
        _os_log_impl(&dword_22D6F0000, v57, OS_LOG_TYPE_DEFAULT, "No available donated analytics events for key %@", v70, 0xCu);
      }
    }

    v58 = [*(id *)(a1 + 32) sessionStartDate];

    if (v58) {
      [*(id *)(a1 + 32) sendEvent:0 withParameters:v2];
    }
    v59 = objc_opt_class();
    v60 = [*(id *)(a1 + 32) environmentConfiguration];
    v61 = [v60 session];
    v62 = [v61 configuration];
    objc_msgSend(v59, "biome_CarPlayStarted:wireless:", 1, objc_msgSend(v62, "transportType") == 3);

    [*(id *)(a1 + 32) setSessionStartedEventSent:1];
    _Block_object_dispose(buf, 8);
  }
}

void __42__DBAnalytics_applySessionStartedStorage___block_invoke_316(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = NSString;
  id v6 = [NSNumber numberWithUnsignedInteger:a3 + 1];
  uint64_t v7 = [v5 stringWithFormat:@"Display%@", v6];

  id v8 = [v13 viewAreas];
  id v9 = [v8 firstObject];

  uint64_t v10 = [[_DBAnalyticsScreenInfo alloc] initWithScreenInfo:v13 analyticsPrefix:v7 sessionStartViewArea:v9];
  uint64_t v11 = [*(id *)(a1 + 32) analyticsScreenInfo];
  [v11 addObject:v10];

  if (v9) {
    [(_DBAnalyticsScreenInfo *)v10 startCountingTimeForViewArea:v9];
  }
  int v12 = [(_DBAnalyticsScreenInfo *)v10 analytics_sessionStartedDictionaryRepresentation];
  if (v12) {
    [*(id *)(a1 + 40) addEntriesFromDictionary:v12];
  }
  if ([v13 screenType] == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)userPressedTransitionControl
{
  id v3 = [(DBAnalytics *)self analyticsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__DBAnalytics_userPressedTransitionControl__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

void __43__DBAnalytics_userPressedTransitionControl__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "analyticsScreenInfo", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v6 isAccumulatingTimeForAnyKey]) {
          objc_msgSend(v6, "setViewAreaChangeUsingTransitionControlCount:", objc_msgSend(v6, "viewAreaChangeUsingTransitionControlCount") + 1);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (void)biome_CarPlayStarted:(BOOL)a3 wireless:(BOOL)a4
{
  id v6 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__DBAnalytics_biome_CarPlayStarted_wireless___block_invoke;
  block[3] = &__block_descriptor_34_e5_v8__0l;
  BOOL v8 = a4;
  BOOL v9 = a3;
  dispatch_async(v6, block);
}

void __45__DBAnalytics_biome_CarPlayStarted_wireless___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F2A9B8] carPlayStream];
  id v2 = objc_alloc(MEMORY[0x263F2A760]);
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = (void *)[v2 initWithReason:v3 isStart:*(unsigned __int8 *)(a1 + 33)];
  uint64_t v5 = [v6 source];
  [v5 sendEvent:v4];
}

- (void)_screenBecameAvailable:(id)a3
{
  uint64_t v4 = [(DBAnalytics *)self analyticsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__DBAnalytics__screenBecameAvailable___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

void __38__DBAnalytics__screenBecameAvailable___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) screenOwnershipDate];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _analyticsInfoPassingTest:&__block_literal_global_38];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v8 setWasVisibleBeforeCarScreen:0];
          [v8 startCountingVisibleTime];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v5);
    }
    BOOL v9 = [*(id *)(a1 + 32) _analyticsInfoPassingTest:&__block_literal_global_332];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          [v14 setWasVisibleInDashboardBeforeCarScreen:0];
          [v14 startCountingDashboardVisibleTime];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v11);
    }
    id v15 = [*(id *)(a1 + 32) _analyticsInfoPassingTest:&__block_literal_global_334];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v25 + 1) + 8 * k);
          [v20 setWasVisibleInClusterBeforeCarScreen:0];
          [v20 startCountingClusterVisibleTime];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v17);
    }
    double v21 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 32) setScreenOwnershipDate:v21];

    uint64_t v22 = [*(id *)(a1 + 32) lastActiveBundleIdentifier];

    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      v24 = [v23 lastActiveBundleIdentifier];
      objc_msgSend(v23, "_queue_didChangeToBundleIdentifier:", v24);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_fetchLocationBits");
  }
}

uint64_t __38__DBAnalytics__screenBecameAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 wasVisibleBeforeCarScreen];
}

uint64_t __38__DBAnalytics__screenBecameAvailable___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 wasVisibleInDashboardBeforeCarScreen];
}

uint64_t __38__DBAnalytics__screenBecameAvailable___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 wasVisibleInClusterBeforeCarScreen];
}

- (void)_screenBecameUnavailable:(id)a3
{
  uint64_t v4 = [(DBAnalytics *)self analyticsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__DBAnalytics__screenBecameUnavailable___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

void __40__DBAnalytics__screenBecameUnavailable___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v2 = [*(id *)(a1 + 32) visibleAppsAnalyticsInfo];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v7 stopCountingVisibleTime];
        [v7 setWasVisibleBeforeCarScreen:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v8 = [*(id *)(a1 + 32) visibleDashboardAppsAnalyticsInfo];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        [v13 stopCountingDashboardVisibleTime];
        [v13 setWasVisibleInDashboardBeforeCarScreen:1];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v14 = objc_msgSend(*(id *)(a1 + 32), "visibleClusterAppsAnalyticsInfo", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v27 + 1) + 8 * k);
        [v19 stopCountingClusterVisibleTime];
        [v19 setWasVisibleInClusterBeforeCarScreen:1];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v16);
  }

  double v20 = [*(id *)(a1 + 32) screenOwnershipDate];

  if (v20)
  {
    double v21 = *(void **)(a1 + 32);
    uint64_t v22 = [v21 screenOwnershipDate];
    v23 = [MEMORY[0x263EFF910] date];
    [v22 DBSecondsToDate:v23];
    double v25 = v24;
    [v21 screenOwnershipDuration];
    [v21 setScreenOwnershipDuration:v25 + v26];

    [*(id *)(a1 + 32) setScreenOwnershipDate:0];
  }
}

- (void)_iosHasMainAudio:(id)a3
{
  uint64_t v4 = [(DBAnalytics *)self analyticsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__DBAnalytics__iosHasMainAudio___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

void __32__DBAnalytics__iosHasMainAudio___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioOwnershipDate];

  if (!v2)
  {
    uint64_t v3 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "iOS now owns main audio.", v5, 2u);
    }

    uint64_t v4 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 32) setAudioOwnershipDate:v4];

    objc_msgSend(*(id *)(a1 + 32), "_queue_fetchLocationBits");
  }
}

- (void)_carHasMainAudio:(id)a3
{
  uint64_t v4 = [(DBAnalytics *)self analyticsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__DBAnalytics__carHasMainAudio___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

void __32__DBAnalytics__carHasMainAudio___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioOwnershipDate];

  if (v2)
  {
    uint64_t v3 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Accessory now owns main audio.", v10, 2u);
    }

    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 audioOwnershipDate];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    [v5 DBSecondsToDate:v6];
    double v8 = v7;
    [v4 audioOwnershipDuration];
    [v4 setAudioOwnershipDuration:v8 + v9];

    [*(id *)(a1 + 32) setAudioOwnershipDate:0];
  }
}

- (void)_queue_sessionStarted
{
  uint64_t v3 = [(DBAnalytics *)self sessionStartDate];

  if (!v3)
  {
    uint64_t v4 = [(DBAnalytics *)self environmentConfiguration];
    id v26 = [v4 session];

    uint64_t v5 = [MEMORY[0x263EFF910] date];
    [(DBAnalytics *)self setSessionStartDate:v5];

    uint64_t v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v7 = [v6 objectForKey:@"CARStartApplicationBundleID"];
    [(DBAnalytics *)self setStartBundleIdentifier:v7];

    double v8 = objc_alloc_init(_DBAnalyticsChargeInfo);
    [(DBAnalytics *)self setAnalyticsChargeInfo:v8];

    if (([v26 carOwnsScreen] & 1) == 0)
    {
      double v9 = [(DBAnalytics *)self sessionStartDate];
      uint64_t v10 = (void *)[v9 copy];
      [(DBAnalytics *)self setScreenOwnershipDate:v10];
    }
    if (([v26 carOwnsMainAudio] & 1) == 0)
    {
      uint64_t v11 = [(DBAnalytics *)self sessionStartDate];
      uint64_t v12 = (void *)[v11 copy];
      [(DBAnalytics *)self setAudioOwnershipDate:v12];
    }
    id v13 = [(DBAnalytics *)self environmentConfiguration];
    __int16 v14 = [v13 vehicle];
    uint64_t v15 = objc_msgSend(v26, "analytics_dictionaryRepresentationWithVehicle:", v14);
    [(DBAnalytics *)self setVehicleAnalyticsRepresentation:v15];

    [(DBAnalytics *)self setSessionRequestUIMapsCount:0];
    [(DBAnalytics *)self setSessionRequestUIMusicCount:0];
    [(DBAnalytics *)self setSessionRequestUIPhoneCount:0];
    [(DBAnalytics *)self setSessionRequestUIMessagesCount:0];
    [(DBAnalytics *)self setSessionRequestUIBundleIdentifierCount:0];
    [(DBAnalytics *)self setSessionShowUIMapCount:0];
    [(DBAnalytics *)self setSessionShowUITurnCardCount:0];
    uint64_t v16 = [(DBAnalytics *)self analyticsAppInfo];
    [v16 removeAllObjects];

    uint64_t v17 = [(DBAnalytics *)self analyticsScreenInfo];
    [v17 removeAllObjects];

    uint64_t v18 = [(DBAnalytics *)self analyticsLayoutInfo];
    [v18 removeAllObjects];

    v19 = [(DBAnalytics *)self sessionAppLaunches];
    [v19 removeAllObjects];

    double v20 = [(DBAnalytics *)self sessionDeviceAppLaunches];
    [v20 removeAllObjects];

    double v21 = [(DBAnalytics *)self sessionNavigationOwners];
    [v21 removeAllObjects];

    uint64_t v22 = [(DBAnalytics *)self environmentConfiguration];
    v23 = [v22 thermalMonitor];
    -[DBAnalytics setCurrentThermalLevel:](self, "setCurrentThermalLevel:", [v23 level]);

    double v24 = [(DBAnalytics *)self sessionThermalLevels];
    double v25 = objc_msgSend(NSString, "stringWithFormat:", @"(0,%li)", -[DBAnalytics currentThermalLevel](self, "currentThermalLevel"));
    [v24 setString:v25];

    [(DBAnalytics *)self setCurrentChargingState:-1];
    [(DBAnalytics *)self setSessionUnlockCount:0];
    [(DBAnalytics *)self setSiriHostedBundleIdentifier:0];
    [(DBAnalytics *)self setAccessorySupportsLocation:@"Unknown"];
    [(DBAnalytics *)self setAccessorySupportsLocationGPGGA:0];
    [(DBAnalytics *)self setAccessorySupportsLocationGPRMC:0];
    [(DBAnalytics *)self setAccessorySupportsLocationPASCDSpeed:0];
    [(DBAnalytics *)self setAccessorySupportsLocationDeadReckoning:0];
    [(DBAnalytics *)self setAccessorySupportsLocationChinaShifted:0];
    [(DBAnalytics *)self setFirstFrameTimestamp:0];
  }
}

- (void)_queue_sessionEnded
{
  id v2 = self;
  uint64_t v353 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBAnalytics *)self sessionStartDate];

  if (v3)
  {
    uint64_t v4 = [(DBAnalytics *)v2 sessionStartDate];
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    [v4 DBSecondsToDate:v5];
    double v7 = v6;

    if (v7 >= 1.0)
    {
      long long v340 = 0u;
      long long v341 = 0u;
      long long v338 = 0u;
      long long v339 = 0u;
      double v8 = [(DBAnalytics *)v2 analyticsAppInfo];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v338 objects:v352 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v339;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v339 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v338 + 1) + 8 * i) stopCountingTimeForAllKeys];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v338 objects:v352 count:16];
        }
        while (v10);
      }

      id v13 = [(DBAnalytics *)v2 analyticsChargeInfo];
      [v13 stopCountingTimeForAllKeys];

      __int16 v14 = [(DBAnalytics *)v2 analyticsNavOwnershipInfo];
      [v14 stopCountingTimeForAllKeys];

      uint64_t v15 = [(DBAnalytics *)v2 screenOwnershipDate];

      if (v15)
      {
        uint64_t v16 = [(DBAnalytics *)v2 screenOwnershipDate];
        uint64_t v17 = [MEMORY[0x263EFF910] date];
        [v16 DBSecondsToDate:v17];
        double v19 = v18;
        [(DBAnalytics *)v2 screenOwnershipDuration];
        [(DBAnalytics *)v2 setScreenOwnershipDuration:v19 + v20];
      }
      double v21 = [(DBAnalytics *)v2 audioOwnershipDate];

      if (v21)
      {
        uint64_t v22 = [(DBAnalytics *)v2 audioOwnershipDate];
        v23 = [MEMORY[0x263EFF910] date];
        [v22 DBSecondsToDate:v23];
        double v25 = v24;
        [(DBAnalytics *)v2 audioOwnershipDuration];
        [(DBAnalytics *)v2 setAudioOwnershipDuration:v25 + v26];
      }
      long long v336 = 0u;
      long long v337 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      obuint64_t j = [(DBAnalytics *)v2 analyticsAppInfo];
      uint64_t v27 = [obj countByEnumeratingWithState:&v334 objects:v351 count:16];
      v319 = v2;
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v335;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v335 != v29) {
              objc_enumerationMutation(obj);
            }
            long long v32 = *(void **)(*((void *)&v334 + 1) + 8 * v31);
            long long v33 = [MEMORY[0x263EFF9A0] dictionary];
            long long v34 = [v32 bundleIdentifier];
            if (v34)
            {
              id v35 = v34;
            }
            else
            {
              long long v36 = [v32 appInfo];
              id v35 = [v36 bundleIdentifier];

              if (!v35) {
                goto LABEL_49;
              }
            }
            [v32 accumulatedTimeForKey:@"CARAnalyticsAppVisibilityTime"];
            double v38 = v37;
            [v32 accumulatedTimeForKey:@"CARAnalyticsPlaybackTime"];
            double v40 = v39;
            [v32 accumulatedTimeForKey:@"CARAnalyticsDashboardVisibilityTime"];
            double v42 = v41;
            [v32 accumulatedTimeForKey:@"CARAnalyticsClusterVisibilityTime"];
            double v44 = v43;
            [v32 accumulatedTimeForKey:@"DBAnalyticsNavOwnershipTime"];
            double v46 = v45;
            if (v38 != 0.0
              || v42 != 0.0
              || v40 != 0.0
              || v44 != 0.0
              || v45 != 0.0
              || [v32 numberOfSiriPresentations])
            {
              id v35 = v35;
              [v33 setObject:v35 forKeyedSubscript:@"bundleIdentifier"];

              *(float *)&double v47 = v40;
              uint64_t v48 = [NSNumber numberWithFloat:v47];
              [v33 setObject:v48 forKeyedSubscript:@"playbackTime"];

              *(float *)&double v49 = v38;
              v50 = [NSNumber numberWithFloat:v49];
              [v33 setObject:v50 forKeyedSubscript:@"visibleTime"];

              *(float *)&double v51 = v42;
              v52 = [NSNumber numberWithFloat:v51];
              [v33 setObject:v52 forKeyedSubscript:@"dashboardVisibleTime"];

              *(float *)&double v53 = v44;
              v54 = [NSNumber numberWithFloat:v53];
              [v33 setObject:v54 forKeyedSubscript:@"clusterVisibleTime"];

              *(float *)&double v55 = v46;
              v56 = [NSNumber numberWithFloat:v55];
              [v33 setObject:v56 forKeyedSubscript:@"navTime"];

              uint64_t v57 = [v32 numberOfSiriPresentations];
              v58 = [NSNumber numberWithInteger:v57];
              [v33 setObject:v58 forKeyedSubscript:@"siriPresentationCount"];

              float v30 = v7;
              *(float *)&double v59 = v30;
              v60 = [NSNumber numberWithFloat:v59];
              [v33 setObject:v60 forKeyedSubscript:@"sessionDuration"];

              if ([v32 category])
              {
                __int16 v61 = [v32 category];
                v62 = [MEMORY[0x263EFF980] array];
                CFDictionaryRef v63 = v62;
                if (v61)
                {
                  [v62 addObject:@"All"];
                  if ((v61 & 2) != 0) {
                    goto LABEL_52;
                  }
LABEL_31:
                  if ((v61 & 4) == 0) {
                    goto LABEL_32;
                  }
LABEL_53:
                  [v63 addObject:@"Calling"];
                  if ((v61 & 8) != 0) {
                    goto LABEL_54;
                  }
LABEL_33:
                  if ((v61 & 0x10) == 0) {
                    goto LABEL_34;
                  }
LABEL_55:
                  [v63 addObject:@"Audio"];
                  if ((v61 & 0x20) != 0) {
                    goto LABEL_56;
                  }
LABEL_35:
                  if ((v61 & 0x80) == 0) {
                    goto LABEL_36;
                  }
LABEL_57:
                  [v63 addObject:@"QuickOrdering"];
                  if ((v61 & 0x100) != 0) {
                    goto LABEL_58;
                  }
LABEL_37:
                  if ((v61 & 0x200) == 0) {
                    goto LABEL_38;
                  }
LABEL_59:
                  [v63 addObject:@"Parking"];
                  if ((v61 & 0x400) != 0) {
                    goto LABEL_60;
                  }
LABEL_39:
                  if ((v61 & 0x800) == 0) {
                    goto LABEL_40;
                  }
LABEL_61:
                  [v63 addObject:@"Fueling"];
                  if ((v61 & 0x1000) != 0) {
LABEL_41:
                  }
                    [v63 addObject:@"DrivingTask"];
                }
                else
                {
                  if ((v61 & 2) == 0) {
                    goto LABEL_31;
                  }
LABEL_52:
                  [v63 addObject:@"Messaging"];
                  if ((v61 & 4) != 0) {
                    goto LABEL_53;
                  }
LABEL_32:
                  if ((v61 & 8) == 0) {
                    goto LABEL_33;
                  }
LABEL_54:
                  [v63 addObject:@"Navigation"];
                  if ((v61 & 0x10) != 0) {
                    goto LABEL_55;
                  }
LABEL_34:
                  if ((v61 & 0x20) == 0) {
                    goto LABEL_35;
                  }
LABEL_56:
                  [v63 addObject:@"Automaker"];
                  if ((v61 & 0x80) != 0) {
                    goto LABEL_57;
                  }
LABEL_36:
                  if ((v61 & 0x100) == 0) {
                    goto LABEL_37;
                  }
LABEL_58:
                  [v63 addObject:@"Charging"];
                  if ((v61 & 0x200) != 0) {
                    goto LABEL_59;
                  }
LABEL_38:
                  if ((v61 & 0x400) == 0) {
                    goto LABEL_39;
                  }
LABEL_60:
                  [v63 addObject:@"Productivity"];
                  if ((v61 & 0x800) != 0) {
                    goto LABEL_61;
                  }
LABEL_40:
                  if ((v61 & 0x1000) != 0) {
                    goto LABEL_41;
                  }
                }
                v64 = [v63 componentsJoinedByString:@" "];

                v65 = @"(no value)";
                if (v64) {
                  v65 = v64;
                }
                v66 = v65;
                [v33 setObject:v66 forKeyedSubscript:@"appCategory"];
              }
              else
              {
                [v33 setObject:v35 forKeyedSubscript:@"appCategory"];
              }
              double v67 = round(v38 * 100.0 / v7);
              *(float *)&double v67 = v67;
              uint64_t v68 = [NSNumber numberWithFloat:v67];
              [v33 setObject:v68 forKeyedSubscript:@"visiblePercentage"];

              double v69 = round(v40 * 100.0 / v7);
              *(float *)&double v69 = v69;
              v70 = [NSNumber numberWithFloat:v69];
              [v33 setObject:v70 forKeyedSubscript:@"playbackPercentage"];

              [(DBAnalytics *)v2 screenOwnershipDuration];
              *(float *)&double v71 = v71;
              uint64_t v72 = [NSNumber numberWithFloat:v71];
              [v33 setObject:v72 forKeyedSubscript:@"sessionVisibilityDuration"];

              v73 = [(DBAnalytics *)v2 environmentConfiguration];
              id v74 = [v73 session];
              v75 = [v74 configuration];
              int v76 = [v75 supportsVehicleData];
              id v77 = (void *)MEMORY[0x263EFFA80];
              if (v76) {
                id v77 = (void *)MEMORY[0x263EFFA88];
              }
              id v78 = v77;
              [v33 setObject:v78 forKeyedSubscript:@"nextGenCarPlaySession"];

              id v2 = v319;
              [(DBAnalytics *)v319 sendEvent:1 withParameters:v33];
            }
LABEL_49:

            ++v31;
          }
          while (v28 != v31);
          uint64_t v79 = [obj countByEnumeratingWithState:&v334 objects:v351 count:16];
          uint64_t v28 = v79;
        }
        while (v79);
      }

      long long v332 = 0u;
      long long v333 = 0u;
      long long v330 = 0u;
      long long v331 = 0u;
      objc_super v80 = [(DBAnalytics *)v2 analyticsLayoutInfo];
      uint64_t v81 = [v80 countByEnumeratingWithState:&v330 objects:v350 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v331;
        do
        {
          for (uint64_t j = 0; j != v82; ++j)
          {
            if (*(void *)v331 != v83) {
              objc_enumerationMutation(v80);
            }
            v85 = *(void **)(*((void *)&v330 + 1) + 8 * j);
            [v85 accumulatedTimeForKey:@"DBAnalyticsLayoutVisibilityTime"];
            double v87 = v86;
            v88 = [MEMORY[0x263EFF9A0] dictionary];
            v89 = [v85 layoutDisplayName];
            [v88 setObject:v89 forKeyedSubscript:@"layout"];

            *(float *)&double v90 = v87;
            v91 = [NSNumber numberWithFloat:v90];
            [v88 setObject:v91 forKeyedSubscript:@"visibleTime"];

            id v2 = v319;
            [(DBAnalytics *)v319 sendEvent:10 withParameters:v88];
          }
          uint64_t v82 = [v80 countByEnumeratingWithState:&v330 objects:v350 count:16];
        }
        while (v82);
      }

      v92 = [(DBAnalytics *)v2 sessionDeviceAppLaunches];
      uint64_t v93 = [v92 count];

      if (v93)
      {
        v94 = [(DBAnalytics *)v2 sessionDeviceAppLaunches];
        v329[0] = MEMORY[0x263EF8330];
        v329[1] = 3221225472;
        v329[2] = __34__DBAnalytics__queue_sessionEnded__block_invoke;
        v329[3] = &unk_2649B6640;
        *(double *)&v329[5] = v7;
        v329[4] = v2;
        [v94 enumerateKeysAndObjectsUsingBlock:v329];
      }
      else
      {
        v349[0] = @"None";
        v348[0] = @"bundleIdentifier";
        v348[1] = @"launchCount";
        v94 = [NSNumber numberWithInteger:0];
        v349[1] = v94;
        v348[2] = @"sessionDuration";
        *(float *)&double v95 = v7;
        v96 = [NSNumber numberWithFloat:v95];
        v349[2] = v96;
        v348[3] = @"nextGenCarPlaySession";
        v97 = [(DBAnalytics *)v2 environmentConfiguration];
        v98 = [v97 session];
        v99 = [v98 configuration];
        int v100 = [v99 supportsVehicleData];
        v101 = (void *)MEMORY[0x263EFFA80];
        if (v100) {
          v101 = (void *)MEMORY[0x263EFFA88];
        }
        id v102 = v101;
        v349[3] = v102;
        v103 = [NSDictionary dictionaryWithObjects:v349 forKeys:v348 count:4];
        [(DBAnalytics *)v319 sendEvent:6 withParameters:v103];

        id v2 = v319;
      }

      v104 = [(DBAnalytics *)v2 sessionNavigationOwners];
      uint64_t v105 = [v104 count];

      if (v105)
      {
        v106 = [(DBAnalytics *)v2 sessionNavigationOwners];
        v328[0] = MEMORY[0x263EF8330];
        v328[1] = 3221225472;
        v328[2] = __34__DBAnalytics__queue_sessionEnded__block_invoke_2;
        v328[3] = &unk_2649B6668;
        v328[4] = v2;
        [v106 enumerateKeysAndObjectsUsingBlock:v328];
      }
      else
      {
        v347[0] = @"None";
        v346[0] = @"bundleIdentifier";
        v346[1] = @"sessionCount";
        v106 = [NSNumber numberWithInteger:0];
        v347[1] = v106;
        v346[2] = @"nextGenCarPlaySession";
        v107 = [(DBAnalytics *)v2 environmentConfiguration];
        v108 = [v107 session];
        v109 = [v108 configuration];
        int v110 = [v109 supportsVehicleData];
        v111 = (void *)MEMORY[0x263EFFA80];
        if (v110) {
          v111 = (void *)MEMORY[0x263EFFA88];
        }
        id v112 = v111;
        v347[2] = v112;
        v113 = [NSDictionary dictionaryWithObjects:v347 forKeys:v346 count:3];
        [(DBAnalytics *)v319 sendEvent:7 withParameters:v113];

        id v2 = v319;
      }

      v114 = [MEMORY[0x263EFF9A0] dictionary];
      if (CRIsInternalInstall())
      {
        v115 = [MEMORY[0x263F30E28] allowSessionDurationRecordingEvents];
        int v116 = [v115 internalSettingsState];

        if (v116)
        {
          v117 = DBLogForCategory(0xBuLL);
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v117, OS_LOG_TYPE_DEFAULT, "Preparing CARConnectionEventSessionDetails by creating Time Store", buf, 2u);
          }

          id v118 = objc_alloc_init(MEMORY[0x263F30E08]);
          [(DBAnalytics *)v2 setConnectionTimeStore:v118];
        }
      }
      v119 = [(DBAnalytics *)v2 sessionAppLaunches];
      v120 = [v119 objectForKeyedSubscript:&unk_26E17ED50];

      if (v120)
      {
        v121 = [(DBAnalytics *)v2 sessionAppLaunches];
        v122 = [v121 objectForKeyedSubscript:&unk_26E17ED50];
        uint64_t v123 = [v122 integerValue];
        v124 = [NSNumber numberWithInteger:v123];
        [v114 setObject:v124 forKeyedSubscript:@"dock"];
      }
      else
      {
        v121 = [NSNumber numberWithInteger:0];
        [v114 setObject:v121 forKeyedSubscript:@"dock"];
      }

      v125 = [(DBAnalytics *)v2 sessionAppLaunches];
      v126 = [v125 objectForKeyedSubscript:&unk_26E17ED68];

      if (v126)
      {
        v127 = [(DBAnalytics *)v2 sessionAppLaunches];
        v128 = [v127 objectForKeyedSubscript:&unk_26E17ED68];
        uint64_t v129 = [v128 integerValue];
        v130 = [NSNumber numberWithInteger:v129];
        [v114 setObject:v130 forKeyedSubscript:@"siri"];
      }
      else
      {
        v127 = [NSNumber numberWithInteger:0];
        [v114 setObject:v127 forKeyedSubscript:@"siri"];
      }

      v131 = [(DBAnalytics *)v2 sessionAppLaunches];
      v132 = [v131 objectForKeyedSubscript:&unk_26E17ED80];

      if (v132)
      {
        v133 = [(DBAnalytics *)v2 sessionAppLaunches];
        v134 = [v133 objectForKeyedSubscript:&unk_26E17ED80];
        uint64_t v135 = [v134 integerValue];
        v136 = [NSNumber numberWithInteger:v135];
        [v114 setObject:v136 forKeyedSubscript:@"homescreen"];
      }
      else
      {
        v133 = [NSNumber numberWithInteger:0];
        [v114 setObject:v133 forKeyedSubscript:@"homescreen"];
      }

      v137 = [(DBAnalytics *)v2 sessionAppLaunches];
      v138 = [v137 objectForKeyedSubscript:&unk_26E17ED98];

      if (v138)
      {
        v139 = [(DBAnalytics *)v2 sessionAppLaunches];
        v140 = [v139 objectForKeyedSubscript:&unk_26E17ED98];
        uint64_t v141 = [v140 integerValue];
        v142 = [NSNumber numberWithInteger:v141];
        [v114 setObject:v142 forKeyedSubscript:@"dashboard"];
      }
      else
      {
        v139 = [NSNumber numberWithInteger:0];
        [v114 setObject:v139 forKeyedSubscript:@"dashboard"];
      }

      v143 = [(DBAnalytics *)v2 sessionAppLaunches];
      v144 = [v143 objectForKeyedSubscript:@"total"];

      if (v144)
      {
        v145 = [(DBAnalytics *)v2 sessionAppLaunches];
        v146 = [v145 objectForKeyedSubscript:@"total"];
        uint64_t v147 = [v146 integerValue];
        v148 = [NSNumber numberWithInteger:v147];
        [v114 setObject:v148 forKeyedSubscript:@"total"];
      }
      else
      {
        v145 = [NSNumber numberWithInteger:0];
        [v114 setObject:v145 forKeyedSubscript:@"total"];
      }

      long long v326 = 0u;
      long long v327 = 0u;
      long long v324 = 0u;
      long long v325 = 0u;
      uint64_t v149 = [&unk_26E17F008 countByEnumeratingWithState:&v324 objects:v345 count:16];
      if (v149)
      {
        uint64_t v150 = v149;
        uint64_t v151 = *(void *)v325;
        do
        {
          for (uint64_t k = 0; k != v150; ++k)
          {
            if (*(void *)v325 != v151) {
              objc_enumerationMutation(&unk_26E17F008);
            }
            uint64_t v153 = *(void *)(*((void *)&v324 + 1) + 8 * k);
            v154 = [(DBAnalytics *)v319 vehicleAnalyticsRepresentation];
            uint64_t v155 = [v154 objectForKeyedSubscript:v153];
            v156 = (void *)v155;
            v157 = @"(no value)";
            if (v155) {
              v157 = (__CFString *)v155;
            }
            v158 = v157;
            [v114 setObject:v158 forKeyedSubscript:v153];
          }
          uint64_t v150 = [&unk_26E17F008 countByEnumeratingWithState:&v324 objects:v345 count:16];
        }
        while (v150);
      }
      v159 = [(DBAnalytics *)v319 analyticsNavOwnershipInfo];
      [v159 accumulatedTimeForKey:@"DBAnalyticsNavOwnershipTimeiOS"];
      *(float *)&double v160 = v160;
      v161 = [NSNumber numberWithFloat:v160];
      [v114 setObject:v161 forKeyedSubscript:@"iosNavTime"];

      v162 = [(DBAnalytics *)v319 analyticsNavOwnershipInfo];
      [v162 accumulatedTimeForKey:@"DBAnalyticsNavOwnershipTimeOEM"];
      *(float *)&double v163 = v163;
      v164 = [NSNumber numberWithFloat:v163];
      [v114 setObject:v164 forKeyedSubscript:@"oemNavTime"];

      uint64_t v165 = [(DBAnalytics *)v319 announceMessagesState];
      v166 = (void *)v165;
      if (v165) {
        v167 = (__CFString *)v165;
      }
      else {
        v167 = @"(no value)";
      }
      v168 = v167;
      [v114 setObject:v168 forKeyedSubscript:@"announceMessages"];

      *(float *)&double v169 = v7;
      v170 = [NSNumber numberWithFloat:v169];
      [v114 setObject:v170 forKeyedSubscript:@"sessionDuration"];

      uint64_t v171 = [(DBAnalytics *)v319 sessionRequestUIMapsCount];
      v172 = [NSNumber numberWithInteger:v171];
      [v114 setObject:v172 forKeyedSubscript:@"requestUIMapsCount"];

      uint64_t v173 = [(DBAnalytics *)v319 sessionRequestUIMusicCount];
      v174 = [NSNumber numberWithInteger:v173];
      [v114 setObject:v174 forKeyedSubscript:@"requestUIMusicCount"];

      uint64_t v175 = [(DBAnalytics *)v319 sessionRequestUIMessagesCount];
      v176 = [NSNumber numberWithInteger:v175];
      [v114 setObject:v176 forKeyedSubscript:@"requestUIMessagesCount"];

      uint64_t v177 = [(DBAnalytics *)v319 sessionRequestUIPhoneCount];
      v178 = [NSNumber numberWithInteger:v177];
      [v114 setObject:v178 forKeyedSubscript:@"requestUIPhoneCount"];

      uint64_t v179 = [(DBAnalytics *)v319 sessionRequestUIBundleIdentifierCount];
      v180 = [NSNumber numberWithInteger:v179];
      [v114 setObject:v180 forKeyedSubscript:@"requestUIBundleIdentifierCount"];

      uint64_t v181 = [(DBAnalytics *)v319 sessionShowUIMapCount];
      v182 = [NSNumber numberWithInteger:v181];
      [v114 setObject:v182 forKeyedSubscript:@"showUIMapCount"];

      uint64_t v183 = [(DBAnalytics *)v319 sessionShowUITurnCardCount];
      v184 = [NSNumber numberWithInteger:v183];
      [v114 setObject:v184 forKeyedSubscript:@"showUITurnCardCount"];

      [(DBAnalytics *)v319 screenOwnershipDuration];
      *(float *)&double v185 = v185;
      v186 = [NSNumber numberWithFloat:v185];
      [v114 setObject:v186 forKeyedSubscript:@"screenTime"];

      [(DBAnalytics *)v319 audioOwnershipDuration];
      *(float *)&double v187 = v187;
      v188 = [NSNumber numberWithFloat:v187];
      [v114 setObject:v188 forKeyedSubscript:@"mainAudioTime"];

      [(DBAnalytics *)v319 screenOwnershipDuration];
      double v190 = v189 * 100.0 / v7;
      *(float *)&double v190 = v190;
      v191 = [NSNumber numberWithFloat:v190];
      [v114 setObject:v191 forKeyedSubscript:@"screenPercentage"];

      [(DBAnalytics *)v319 audioOwnershipDuration];
      double v193 = v192 * 100.0 / v7;
      *(float *)&double v193 = v193;
      v194 = [NSNumber numberWithFloat:v193];
      [v114 setObject:v194 forKeyedSubscript:@"mainAudioPercentage"];

      uint64_t v195 = [(DBAnalytics *)v319 sessionUnlockCount];
      v196 = [NSNumber numberWithInteger:v195];
      [v114 setObject:v196 forKeyedSubscript:@"unlockCount"];

      uint64_t v197 = [(DBAnalytics *)v319 accessorySupportsLocation];
      v198 = (void *)v197;
      if (v197) {
        v199 = (__CFString *)v197;
      }
      else {
        v199 = @"(no value)";
      }
      v200 = v199;
      [v114 setObject:v200 forKeyedSubscript:@"supportsLocationCapability"];

      BOOL v201 = [(DBAnalytics *)v319 accessorySupportsLocationPASCDSpeed];
      v202 = (void *)MEMORY[0x263EFFA80];
      v203 = (void *)MEMORY[0x263EFFA88];
      if (v201) {
        v204 = (void *)MEMORY[0x263EFFA88];
      }
      else {
        v204 = (void *)MEMORY[0x263EFFA80];
      }
      id v205 = v204;
      [v114 setObject:v205 forKeyedSubscript:@"supportsLocationPASCD"];

      if ([(DBAnalytics *)v319 accessorySupportsLocationGPGGA]) {
        v206 = v203;
      }
      else {
        v206 = v202;
      }
      id v207 = v206;
      [v114 setObject:v207 forKeyedSubscript:@"supportsLocationGPGGA"];

      if ([(DBAnalytics *)v319 accessorySupportsLocationGPRMC]) {
        v208 = v203;
      }
      else {
        v208 = v202;
      }
      id v209 = v208;
      [v114 setObject:v209 forKeyedSubscript:@"supportsLocationGPRMC"];

      if ([(DBAnalytics *)v319 accessorySupportsLocationDeadReckoning]) {
        v210 = v203;
      }
      else {
        v210 = v202;
      }
      id v211 = v210;
      [v114 setObject:v211 forKeyedSubscript:@"supportsLocationDeadReckoning"];

      if ([(DBAnalytics *)v319 accessorySupportsLocationChinaShifted]) {
        v212 = v203;
      }
      else {
        v212 = v202;
      }
      id v213 = v212;
      [v114 setObject:v213 forKeyedSubscript:@"supportsLocationChinaShifted"];

      v214 = [(DBAnalytics *)v319 analyticsChargeInfo];
      if ([v214 didChargeDuringSession]) {
        v215 = v203;
      }
      else {
        v215 = v202;
      }
      id v216 = v215;
      [v114 setObject:v216 forKeyedSubscript:@"deviceChargedDuringSession"];

      v217 = [(DBAnalytics *)v319 analyticsChargeInfo];
      if ([v217 isWireless]) {
        v218 = v203;
      }
      else {
        v218 = v202;
      }
      id v219 = v218;
      [v114 setObject:v219 forKeyedSubscript:@"deviceChargedWirelessly"];

      v220 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v221 = [v220 voltage];
      v222 = (void *)v221;
      if (v221) {
        v223 = (__CFString *)v221;
      }
      else {
        v223 = @"(no value)";
      }
      v224 = v223;
      [v114 setObject:v224 forKeyedSubscript:@"adapterVoltage"];

      v225 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v226 = [v225 wattage];
      v227 = (void *)v226;
      if (v226) {
        v228 = (__CFString *)v226;
      }
      else {
        v228 = @"(no value)";
      }
      v229 = v228;
      [v114 setObject:v229 forKeyedSubscript:@"adapterWattage"];

      v230 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v231 = [v230 adapterDescription];
      v232 = (void *)v231;
      if (v231) {
        v233 = (__CFString *)v231;
      }
      else {
        v233 = @"(no value)";
      }
      v234 = v233;
      [v114 setObject:v234 forKeyedSubscript:@"adapterDescription"];

      v235 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v236 = [v235 PMUConfiguration];
      v237 = (void *)v236;
      if (v236) {
        v238 = (__CFString *)v236;
      }
      else {
        v238 = @"(no value)";
      }
      v239 = v238;
      [v114 setObject:v239 forKeyedSubscript:@"adapterPMUConfiguration"];

      v240 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v241 = [v240 current];
      v242 = (void *)v241;
      if (v241) {
        v243 = (__CFString *)v241;
      }
      else {
        v243 = @"(no value)";
      }
      v244 = v243;
      [v114 setObject:v244 forKeyedSubscript:@"adapterCurrent"];

      v245 = [(DBAnalytics *)v319 analyticsChargeInfo];
      [v245 accumulatedTimeForKey:@"CARAnalyticsChargingTime"];
      *(float *)&double v246 = v246;
      v247 = [NSNumber numberWithFloat:v246];
      [v114 setObject:v247 forKeyedSubscript:@"deviceChargeDuration"];

      v248 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v249 = [v248 sessionChargingStates];
      v250 = (void *)v249;
      if (v249) {
        v251 = (__CFString *)v249;
      }
      else {
        v251 = @"(no value)";
      }
      v252 = v251;
      [v114 setObject:v252 forKeyedSubscript:@"sessionChargingStates"];

      v253 = [(DBAnalytics *)v319 analyticsChargeInfo];
      uint64_t v254 = [v253 adapterFamily];
      v255 = (void *)v254;
      if (v254) {
        v256 = (__CFString *)v254;
      }
      else {
        v256 = @"(no value)";
      }
      v257 = v256;
      [v114 setObject:v257 forKeyedSubscript:@"deviceChargingAdapterFamily"];

      v258 = [(DBAnalytics *)v319 analyticsChargeInfo];
      v259 = [v258 startingBatteryPercentage];
      [v114 setObject:v259 forKeyedSubscript:@"startingBatteryPercentage"];

      *(_DWORD *)buf = 0;
      IOPSGetPercentRemaining();
      v260 = [NSNumber numberWithInteger:*(int *)buf];
      [v114 setObject:v260 forKeyedSubscript:@"batteryPercentage"];

      uint64_t v261 = [(DBAnalytics *)v319 dictionaryFromInterrupt];
      uint64_t v262 = [(DBAnalytics *)v319 stringFromInterruptDictionary:v261];
      v263 = (void *)v262;
      if (v262) {
        v264 = (__CFString *)v262;
      }
      else {
        v264 = @"(no value)";
      }
      v265 = v264;
      [v114 setObject:v265 forKeyedSubscript:@"sessionInterrupt"];

      uint64_t v266 = [(DBAnalytics *)v319 stringFromSessionSummary];
      v267 = (void *)v266;
      if (v266) {
        v268 = (__CFString *)v266;
      }
      else {
        v268 = @"(no value)";
      }
      v269 = v268;
      [v114 setObject:v269 forKeyedSubscript:@"sessionSummary"];

      uint64_t v270 = objc_msgSend(MEMORY[0x263F30E48], "descriptionForUserInterfaceStyle:", -[DBAnalytics mapsAppearanceStyle](v319, "mapsAppearanceStyle"));
      v271 = (void *)v270;
      if (v270) {
        v272 = (__CFString *)v270;
      }
      else {
        v272 = @"(no value)";
      }
      v273 = v272;
      [v114 setObject:v273 forKeyedSubscript:@"preferredMapsAppearance"];

      uint64_t v274 = [(DBAnalytics *)v319 sessionThermalLevels];
      v275 = (void *)v274;
      if (v274) {
        v276 = (__CFString *)v274;
      }
      else {
        v276 = @"(no value)";
      }
      v277 = v276;
      [v114 setObject:v277 forKeyedSubscript:@"sessionThermalLevels"];

      uint64_t v278 = [(DBAnalytics *)v319 connectionTimeStore];
      if (v278)
      {
        v279 = (void *)v278;
        int v280 = CRIsInternalInstall();

        if (v280)
        {
          v281 = (void *)MEMORY[0x263F30E00];
          v282 = [MEMORY[0x263EFF910] date];
          v283 = (void *)[v114 copy];
          v284 = [v281 eventWithName:@"CARConnectionEventSessionDetails" type:0 date:v282 payload:v283];

          v285 = [(DBAnalytics *)v319 connectionTimeStore];
          [v285 sendConnectionEvent:v284 completion:&__block_literal_global_550];
        }
      }
      v286 = [(DBAnalytics *)v319 firstFrameTimestamp];

      if (v286)
      {
        v287 = NSString;
        v288 = [(DBAnalytics *)v319 sessionStartDate];
        v289 = [(DBAnalytics *)v319 firstFrameTimestamp];
        [v288 DBSecondsToDate:v289];
        objc_msgSend(v287, "stringWithFormat:", @"%.03f", v290);
        v291 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v292 = @"(no value)";
        if (v291) {
          v292 = v291;
        }
        v293 = v292;
        [v114 setObject:v293 forKeyedSubscript:@"firstVideoFrameOffsetFromEndpointActivation"];
      }
      unint64_t v294 = 0x263EFF000uLL;
      v295 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id obja = (id)v261;
      [v295 setObject:v261 forKey:@"CARAnalyticsSessionInterruptKey"];

      long long v322 = 0u;
      long long v323 = 0u;
      long long v320 = 0u;
      long long v321 = 0u;
      v296 = [(DBAnalytics *)v319 analyticsScreenInfo];
      uint64_t v297 = [v296 countByEnumeratingWithState:&v320 objects:v344 count:16];
      if (v297)
      {
        uint64_t v298 = v297;
        char v299 = 0;
        uint64_t v300 = *(void *)v321;
        do
        {
          for (uint64_t m = 0; m != v298; ++m)
          {
            if (*(void *)v321 != v300) {
              objc_enumerationMutation(v296);
            }
            v302 = *(void **)(*((void *)&v320 + 1) + 8 * m);
            [v302 stopCountingTimeForAllKeys];
            v303 = objc_msgSend(v302, "analytics_sessionEndedDictionaryRepresentation");
            if (v303) {
              [v114 addEntriesFromDictionary:v303];
            }
            v304 = [v302 screenInfo];
            BOOL v305 = [v304 screenType] == 1;

            v299 |= v305;
          }
          uint64_t v298 = [v296 countByEnumeratingWithState:&v320 objects:v344 count:16];
        }
        while (v298);

        v306 = @"NO";
        if (v299) {
          v306 = @"YES";
        }
        unint64_t v294 = 0x263EFF000;
      }
      else
      {

        v306 = @"NO";
      }
      v307 = v306;
      [v114 setObject:v307 forKeyedSubscript:@"secondVideoStream"];

      v308 = [*(id *)(v294 + 2624) standardUserDefaults];
      v309 = [v308 dictionaryForKey:@"DBDefaultsSessionEndedStorageKey"];

      uint64_t v310 = [v309 count];
      v311 = DBLogForCategory(0xBuLL);
      BOOL v312 = os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT);
      if (v310)
      {
        v313 = v319;
        if (v312)
        {
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v309, "count"));
          v314 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v343 = v314;
          _os_log_impl(&dword_22D6F0000, v311, OS_LOG_TYPE_DEFAULT, "Applying %@ donated values to sessionEnded event", buf, 0xCu);
        }
        [v114 setValuesForKeysWithDictionary:v309];
        v311 = [*(id *)(v294 + 2624) standardUserDefaults];
        [v311 removeObjectForKey:@"DBDefaultsSessionEndedStorageKey"];
      }
      else
      {
        v313 = v319;
        if (v312)
        {
          *(_DWORD *)buf = 138412290;
          v343 = @"DBDefaultsSessionEndedStorageKey";
          _os_log_impl(&dword_22D6F0000, v311, OS_LOG_TYPE_DEFAULT, "No available donated analytics events for key %@", buf, 0xCu);
        }
      }

      [(DBAnalytics *)v313 sendEvent:5 withParameters:v114];
      v315 = objc_opt_class();
      v316 = [v114 objectForKeyedSubscript:@"transports"];
      objc_msgSend(v315, "biome_CarPlayStarted:wireless:", 0, objc_msgSend(v316, "isEqualToString:", @"Wireless"));

      [(DBAnalytics *)v313 setSessionStartDate:0];
      [(DBAnalytics *)v313 setScreenOwnershipDate:0];
      [(DBAnalytics *)v313 setScreenOwnershipDuration:0.0];
      [(DBAnalytics *)v313 setAudioOwnershipDate:0];
      [(DBAnalytics *)v313 setAudioOwnershipDuration:0.0];
      [(DBAnalytics *)v313 setAnalyticsChargeInfo:0];
      [(DBAnalytics *)v313 setAnalyticsNavOwnershipInfo:0];
    }
  }
}

void __34__DBAnalytics__queue_sessionEnded__block_invoke(uint64_t a1, __CFString *a2, void *a3)
{
  v22[4] = *MEMORY[0x263EF8340];
  double v6 = @"(no value)";
  if (a2) {
    double v6 = a2;
  }
  v22[0] = v6;
  v21[0] = @"bundleIdentifier";
  v21[1] = @"launchCount";
  double v7 = v6;
  double v8 = a2;
  uint64_t v9 = [a3 integerValue];
  uint64_t v10 = [NSNumber numberWithInteger:v9];
  v22[1] = v10;
  v21[2] = @"sessionDuration";
  double v11 = *(double *)(a1 + 40);
  *(float *)&double v11 = v11;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  v22[2] = v12;
  v21[3] = @"nextGenCarPlaySession";
  id v13 = [*(id *)(a1 + 32) environmentConfiguration];
  __int16 v14 = [v13 session];
  uint64_t v15 = [v14 configuration];
  int v16 = [v15 supportsVehicleData];
  uint64_t v17 = (void *)MEMORY[0x263EFFA80];
  if (v16) {
    uint64_t v17 = (void *)MEMORY[0x263EFFA88];
  }
  v22[3] = v17;
  double v18 = NSDictionary;
  id v19 = v17;
  double v20 = [v18 dictionaryWithObjects:v22 forKeys:v21 count:4];

  [*(id *)(a1 + 32) sendEvent:6 withParameters:v20];
}

void __34__DBAnalytics__queue_sessionEnded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = @"bundleIdentifier";
  v16[1] = @"sessionCount";
  v17[0] = a2;
  v17[1] = a3;
  v16[2] = @"nextGenCarPlaySession";
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 environmentConfiguration];
  uint64_t v9 = [v8 session];
  uint64_t v10 = [v9 configuration];
  int v11 = [v10 supportsVehicleData];
  uint64_t v12 = (void *)MEMORY[0x263EFFA80];
  if (v11) {
    uint64_t v12 = (void *)MEMORY[0x263EFFA88];
  }
  v17[2] = v12;
  id v13 = NSDictionary;
  id v14 = v12;
  uint64_t v15 = [v13 dictionaryWithObjects:v17 forKeys:v16 count:3];

  [*(id *)(a1 + 32) sendEvent:7 withParameters:v15];
}

void __34__DBAnalytics__queue_sessionEnded__block_invoke_547(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0xBuLL);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "CARConnectionEventSessionDetails sent.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __34__DBAnalytics__queue_sessionEnded__block_invoke_547_cold_1(v4);
  }
}

- (void)preferences:(id)a3 carPlayAnnounceEnablementTypeChanged:(int64_t)a4
{
  id v6 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__DBAnalytics_preferences_carPlayAnnounceEnablementTypeChanged___block_invoke;
  v7[3] = &unk_2649B6068;
  v7[4] = self;
  void v7[5] = a4;
  [v6 addOperationWithBlock:v7];
}

uint64_t __64__DBAnalytics_preferences_carPlayAnnounceEnablementTypeChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Announce Messages: AFSiriCarPlayAnnounceEnablementType changed %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendAnnounceMessagesEvent");
}

- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4
{
  id v6 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__DBAnalytics_preferences_announceNotificationsInCarPlayTemporarilyDisabledChanged___block_invoke;
  v7[3] = &unk_2649B4110;
  BOOL v8 = a4;
  v7[4] = self;
  [v6 addOperationWithBlock:v7];
}

uint64_t __84__DBAnalytics_preferences_announceNotificationsInCarPlayTemporarilyDisabledChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Announce Messages: announce notifications temporarily disabled changed %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendAnnounceMessagesEvent");
}

- (void)_queue_sendAnnounceMessagesEvent
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBAnalytics *)self announceMessagesState];
  v15[0] = @"announceSettings";
  v15[1] = @"nextGenCarPlaySession";
  v16[0] = v3;
  id v4 = [(DBAnalytics *)self environmentConfiguration];
  int v5 = [v4 session];
  id v6 = [v5 configuration];
  int v7 = [v6 supportsVehicleData];
  BOOL v8 = (void *)MEMORY[0x263EFFA80];
  if (v7) {
    BOOL v8 = (void *)MEMORY[0x263EFFA88];
  }
  v16[1] = v8;
  uint64_t v9 = NSDictionary;
  id v10 = v8;
  int v11 = [v9 dictionaryWithObjects:v16 forKeys:v15 count:2];

  [(DBAnalytics *)self sendEvent:8 withParameters:v11];
  uint64_t v12 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Announce Messages: %@", (uint8_t *)&v13, 0xCu);
  }
}

- (id)announceMessagesState
{
  uint64_t v3 = [(DBAnalytics *)self siriPreferences];
  [v3 carPlayAnnounceEnablementType];
  uint64_t v4 = AFSiriCarPlayAnnounceEnablementTypeGetName();
  int v5 = (void *)v4;
  id v6 = @"unknown";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  int v7 = v6;

  BOOL v8 = [(DBAnalytics *)self siriPreferences];
  int v9 = [v8 announceNotificationsInCarPlayTemporarilyDisabled];

  if (v9) {
    id v10 = @":Muted";
  }
  else {
    id v10 = @":Unmuted";
  }
  int v11 = [(__CFString *)v7 stringByAppendingString:v10];

  return v11;
}

- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__DBAnalytics_environmentConfigurationPairedVehiclesDidChange___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __63__DBAnalytics_environmentConfigurationPairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) vehicle];
  uint64_t v3 = [v2 mapsAppearancePreference];
  uint64_t v4 = [*(id *)(a1 + 40) mapsAppearanceStyle];

  if (v3 != v4)
  {
    int v5 = [*(id *)(a1 + 32) vehicle];
    objc_msgSend(*(id *)(a1 + 40), "setMapsAppearanceStyle:", objc_msgSend(v5, "mapsAppearancePreference"));

    id v6 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = objc_msgSend(MEMORY[0x263F30E48], "descriptionForUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 40), "mapsAppearanceStyle"));
      *(_DWORD *)buf = 138412290;
      double v21 = v7;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Maps appearance preference changed: %@", buf, 0xCu);
    }
    id v8 = *(void **)(a1 + 40);
    int v9 = objc_msgSend(MEMORY[0x263F30E48], "descriptionForUserInterfaceStyle:", objc_msgSend(v8, "mapsAppearanceStyle", @"preferredMapsAppearance"));
    v18[1] = @"nextGenCarPlaySession";
    v19[0] = v9;
    id v10 = [*(id *)(a1 + 40) environmentConfiguration];
    int v11 = [v10 session];
    uint64_t v12 = [v11 configuration];
    int v13 = [v12 supportsVehicleData];
    id v14 = (void *)MEMORY[0x263EFFA80];
    if (v13) {
      id v14 = (void *)MEMORY[0x263EFFA88];
    }
    v19[1] = v14;
    uint64_t v15 = NSDictionary;
    id v16 = v14;
    uint64_t v17 = [v15 dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v8 sendEvent:9 withParameters:v17];
  }
}

- (void)_queue_deviceDidChangeToBundleIdentifier:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(DBAnalytics *)self sessionDeviceAppLaunches];
  int v5 = [v4 objectForKey:v8];

  if (v5)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + 1);
  }
  else
  {
    id v6 = &unk_26E17EDB0;
  }
  int v7 = [(DBAnalytics *)self sessionDeviceAppLaunches];
  [v7 setObject:v6 forKey:v8];
}

- (void)_queue_didChangeToBundleIdentifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DBAnalytics *)self setLastActiveBundleIdentifier:v4];
  uint64_t v37 = 0;
  double v38 = &v37;
  uint64_t v39 = 0x3032000000;
  double v40 = __Block_byref_object_copy__7;
  double v41 = __Block_byref_object_dispose__7;
  id v42 = v4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__DBAnalytics__queue_didChangeToBundleIdentifier___block_invoke;
  block[3] = &unk_2649B6690;
  void block[4] = &v37;
  id v5 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v6 = (id)v38[5];

  if ([v6 isEqualToString:@"com.apple.CarPlay.dashboard"])
  {
    int v7 = [(DBAnalytics *)self lastDashboardNavigationBundleIdentifier];
    [(DBAnalytics *)self dashboardNavigationDidChangeToBundleIdentifier:v7];

    id v8 = [(DBAnalytics *)self lastDashboardAudioWidgetBundleIdentifier];
    [(DBAnalytics *)self dashboardAudioWidgetDidChangeToBundleIdentifier:v8];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [(DBAnalytics *)self visibleDashboardAppsAnalyticsInfo];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v11++) stopCountingDashboardVisibleTime];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v9);
    }
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = [(DBAnalytics *)self visibleAppsAnalyticsInfo];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v15++) stopCountingVisibleTime];
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v43 count:16];
    }
    while (v13);
  }

  if (!v6)
  {
    id v19 = 0;
    goto LABEL_27;
  }
  id v16 = +[DBApplicationController sharedInstance];
  uint64_t v17 = [v16 applicationWithBundleIdentifier:v6];

  if (v17)
  {
    double v18 = [v17 info];
    id v19 = [(DBAnalytics *)self appAnalyticsInfoForApp:v18];

    if (!v19)
    {
      double v20 = [_DBAnalyticsAppInfo alloc];
      double v21 = [v17 info];
      uint64_t v22 = +[DBApplicationController sharedInstance];
      v23 = [v22 _appPolicyEvaluator];
      id v19 = [(_DBAnalyticsAppInfo *)v20 initWithAppInfo:v21 policyEvaluator:v23];

      double v24 = [(DBAnalytics *)self analyticsAppInfo];
      [v24 addObject:v19];
      goto LABEL_25;
    }
LABEL_23:

LABEL_26:
    [(_DBAnalyticsAppInfo *)v19 startCountingVisibleTime];
    goto LABEL_27;
  }
  id v19 = [(DBAnalytics *)self appAnalyticsInfoForBundleIdentifier:v6];
  if (v19) {
    goto LABEL_23;
  }
  double v25 = [_DBAnalyticsAppInfo alloc];
  double v26 = +[DBApplicationController sharedInstance];
  uint64_t v27 = [v26 _appPolicyEvaluator];
  id v19 = [(_DBAnalyticsAppInfo *)v25 initWithBundleIdentifier:v6 appDeclaration:0 policyEvaluator:v27];

  double v24 = [(DBAnalytics *)self analyticsAppInfo];
  [v24 addObject:v19];
LABEL_25:

  if (v19) {
    goto LABEL_26;
  }
LABEL_27:

  _Block_object_dispose(&v37, 8);
}

uint64_t __50__DBAnalytics__queue_didChangeToBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isEqualToString:@"com.apple.InCallService"];
  if (result)
  {
    uint64_t v3 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v4 = [v3 displayedAudioAndVideoCalls];

    if ((unint64_t)[v4 count] < 2) {
      [v4 firstObject];
    }
    else {
    id v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_1565);
    }
    id v6 = [v5 provider];
    uint64_t v12 = [v6 displayAppBundleIdentifier];

    uint64_t v8 = v12;
    if (v12)
    {
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@":%@", v12];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v8 = v12;
    }
    return MEMORY[0x270F9A758](v7, v8);
  }
  return result;
}

- (void)_queue_nowPlayingUpdatedToApp:(id)a3 isPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(DBAnalytics *)self nowPlayingAppAnalyticsInfo];
  uint64_t v7 = v6;
  if (v6) {
    [v6 stopCountingTimeForKey:@"CARAnalyticsPlaybackTime"];
  }
  if (v4)
  {
    uint64_t v8 = [v15 info];
    uint64_t v9 = [(DBAnalytics *)self appAnalyticsInfoForApp:v8];

    if (!v9)
    {
      uint64_t v10 = [_DBAnalyticsAppInfo alloc];
      uint64_t v11 = [v15 info];
      uint64_t v12 = +[DBApplicationController sharedInstance];
      uint64_t v13 = [v12 _appPolicyEvaluator];
      uint64_t v9 = [(_DBAnalyticsAppInfo *)v10 initWithAppInfo:v11 policyEvaluator:v13];

      uint64_t v14 = [(DBAnalytics *)self analyticsAppInfo];
      [v14 addObject:v9];
    }
    [(_DBAnalyticsTimeAccumulator *)v9 startCountingTimeForKey:@"CARAnalyticsPlaybackTime"];
  }
}

- (void)_queue_screenViewAreaChanged:(id)a3 screenInfo:(id)a4 configuration:(id)a5 duration:(double)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v11 = [(DBAnalytics *)self analyticsScreenInfo];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v17 = [v16 screenInfo];
        int v18 = [v17 isEqual:v10];

        if (v18)
        {
          id v19 = [MEMORY[0x263EFF9A0] dictionary];
          if ([v10 screenType]) {
            double v20 = @"Other";
          }
          else {
            double v20 = @"Main";
          }
          [v19 setObject:v20 forKeyedSubscript:@"screenType"];
          *(float *)&double v21 = a6;
          uint64_t v22 = [NSNumber numberWithFloat:v21];
          [v19 setObject:v22 forKeyedSubscript:@"duration"];

          uint64_t v23 = [v16 indexOfLargestViewArea];
          uint64_t v24 = MEMORY[0x263EFFA80];
          uint64_t v25 = MEMORY[0x263EFFA88];
          uint64_t v26 = MEMORY[0x263EFFA80];
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v27 = v23;
            long long v28 = objc_msgSend(v10, "viewAreas", MEMORY[0x263EFFA80]);
            long long v29 = [v28 objectAtIndexedSubscript:v27];
            [v29 visibleFrame];
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            CGFloat v37 = v36;

            [v9 visibleFrame];
            v69.origin.x = v38;
            v69.origin.y = v39;
            v69.size.width = v40;
            v69.size.height = v41;
            v68.origin.x = v31;
            v68.origin.y = v33;
            v68.size.width = v35;
            v68.size.height = v37;
            if (CGRectEqualToRect(v68, v69)) {
              uint64_t v26 = v25;
            }
            else {
              uint64_t v26 = v24;
            }
          }
          [v19 setObject:v26 forKeyedSubscript:@"isFullScreen"];
          id v42 = [v10 viewAreas];
          uint64_t v43 = [v42 count];
          double v44 = [NSNumber numberWithInteger:v43];
          [v19 setObject:v44 forKeyedSubscript:@"viewAreaCount"];

          uint64_t v45 = [(DBAnalytics *)self environmentConfiguration];
          double v46 = [v45 session];
          double v47 = [v46 configuration];
          if ([v47 supportsVehicleData]) {
            uint64_t v48 = v25;
          }
          else {
            uint64_t v48 = v24;
          }
          [v19 setObject:v48 forKeyedSubscript:@"nextGenCarPlaySession"];

          [(DBAnalytics *)self sendEvent:2 withParameters:v19];
          goto LABEL_21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  double v49 = [(DBAnalytics *)self analyticsScreenInfo];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v58 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        double v55 = [v54 screenInfo];
        int v56 = [v55 isEqual:v10];

        if (v56)
        {
          objc_msgSend(v54, "setViewAreaChangeCount:", objc_msgSend(v54, "viewAreaChangeCount") + 1);
          [v54 stopCountingTimeForAllKeys];
          [v54 startCountingTimeForViewArea:v9];
        }
        else
        {
          [v54 stopCountingTimeForAllKeys];
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v51);
  }
}

- (void)_applicationDidLaunch:(id)a3
{
  BOOL v4 = [a3 object];
  if (![v4 integerValue])
  {

    BOOL v4 = &unk_26E17ED80;
  }
  id v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__DBAnalytics__applicationDidLaunch___block_invoke;
  v7[3] = &unk_2649B3D30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __37__DBAnalytics__applicationDidLaunch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionAppLaunches];
  id v11 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = [v11 unsignedIntegerValue];
  BOOL v4 = [NSNumber numberWithInteger:v3 + 1];
  id v5 = [*(id *)(a1 + 32) sessionAppLaunches];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) sessionAppLaunches];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"total"];

  uint64_t v8 = [v7 unsignedIntegerValue];
  id v9 = [NSNumber numberWithInteger:v8 + 1];
  id v10 = [*(id *)(a1 + 32) sessionAppLaunches];
  [v10 setObject:v9 forKeyedSubscript:@"total"];
}

- (void)_dashboardSmartWidgetUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__DBAnalytics__dashboardSmartWidgetUpdated___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __44__DBAnalytics__dashboardSmartWidgetUpdated___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) object];
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v11 events];
    uint64_t v4 = [v3 count];
    id v5 = [NSNumber numberWithInteger:v4];
    [v2 setObject:v5 forKeyedSubscript:@"eventCount"];

    id v6 = @"Calendar";
LABEL_5:
    [v2 setObject:v6 forKeyedSubscript:@"type"];
    [v2 setObject:@"(no value)" forKeyedSubscript:@"bundleIdentifier"];
    uint64_t v7 = [*(id *)(a1 + 40) environmentConfiguration];
    id v8 = [v7 session];
    id v9 = [v8 configuration];
    if ([v9 supportsVehicleData]) {
      uint64_t v10 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v10 = MEMORY[0x263EFFA80];
    }
    [v2 setObject:v10 forKeyedSubscript:@"nextGenCarPlaySession"];

    [*(id *)(a1 + 40) sendEvent:3 withParameters:v2];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = @"Home";
    goto LABEL_5;
  }
LABEL_9:
}

- (void)_dashboardNowPlayingWidgetTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__DBAnalytics__dashboardNowPlayingWidgetTapped___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __48__DBAnalytics__dashboardNowPlayingWidgetTapped___block_invoke(uint64_t a1)
{
  void v15[2] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) object];
  unint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 > 2) {
    id v4 = @"(no value)";
  }
  else {
    id v4 = off_2649B6830[v3];
  }
  id v5 = *(void **)(a1 + 40);
  v15[0] = v4;
  v14[0] = @"type";
  v14[1] = @"nextGenCarPlaySession";
  id v6 = [v5 environmentConfiguration];
  uint64_t v7 = [v6 session];
  id v8 = [v7 configuration];
  int v9 = [v8 supportsVehicleData];
  uint64_t v10 = (void *)MEMORY[0x263EFFA80];
  if (v9) {
    uint64_t v10 = (void *)MEMORY[0x263EFFA88];
  }
  v15[1] = v10;
  id v11 = NSDictionary;
  id v12 = v10;
  uint64_t v13 = [v11 dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v5 sendEvent:4 withParameters:v13];
}

- (void)_appStartedNavigation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  id v5 = v4;
  if (v4 && ([v4 isEqualToString:@"None"] & 1) == 0)
  {
    id v6 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Application started navigation: %{public}@", buf, 0xCu);
    }

    uint64_t v7 = [(DBAnalytics *)self analyticsQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__DBAnalytics__appStartedNavigation___block_invoke;
    v8[3] = &unk_2649B3D30;
    v8[4] = self;
    id v9 = v5;
    [v7 addOperationWithBlock:v8];
  }
}

uint64_t __37__DBAnalytics__appStartedNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationWithBundleIdentifier:didStartNavigation:", *(void *)(a1 + 40), 1);
}

- (void)_appEndedNavigation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  id v5 = v4;
  if (v4 && ([v4 isEqualToString:@"None"] & 1) == 0)
  {
    id v6 = DBLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Application ended navigation: %{public}@", buf, 0xCu);
    }

    uint64_t v7 = [(DBAnalytics *)self analyticsQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__DBAnalytics__appEndedNavigation___block_invoke;
    v8[3] = &unk_2649B3D30;
    v8[4] = self;
    id v9 = v5;
    [v7 addOperationWithBlock:v8];
  }
}

uint64_t __35__DBAnalytics__appEndedNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationWithBundleIdentifier:didStartNavigation:", *(void *)(a1 + 40), 0);
}

- (void)navigationOwnershipChanged:(id)a3
{
  id v4 = [(DBAnalytics *)self analyticsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__DBAnalytics_navigationOwnershipChanged___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

uint64_t __42__DBAnalytics_navigationOwnershipChanged___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) environmentConfiguration];
  unint64_t v3 = [v2 session];
  uint64_t v4 = [v3 navigationOwner];

  id v5 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"None";
    if (v4 == 1) {
      id v6 = @"iOS";
    }
    if (v4 == 2) {
      id v6 = @"Car";
    }
    uint64_t v7 = v6;
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Navigation ownership changed to %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_navigationOwnershipChangedToOwner:", v4);
}

- (void)_queue_applicationWithBundleIdentifier:(id)a3 didStartNavigation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(DBAnalytics *)self sessionNavigationOwners];
  id v8 = [v7 objectForKey:v6];

  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [(DBAnalytics *)self sessionNavigationOwners];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v9 + 1];
  [v10 setObject:v11 forKey:v6];

  uint64_t v12 = [(DBAnalytics *)self appAnalyticsInfoForBundleIdentifier:v6];
  if (!v12)
  {
    uint64_t v13 = [_DBAnalyticsAppInfo alloc];
    uint64_t v14 = +[DBApplicationController sharedInstance];
    id v15 = [v14 _appPolicyEvaluator];
    uint64_t v12 = [(_DBAnalyticsAppInfo *)v13 initWithBundleIdentifier:v6 appDeclaration:0 policyEvaluator:v15];

    id v16 = [(DBAnalytics *)self analyticsAppInfo];
    [v16 addObject:v12];
  }
  if (v4)
  {
    [(_DBAnalyticsAppInfo *)v12 startCountingNavOwnershipTime];
  }
  else
  {
    [(_DBAnalyticsAppInfo *)v12 stopCountingNavOwnershipTime];
    uint64_t v17 = [(DBAnalytics *)self _analyticsInfoPassingTest:&__block_literal_global_622];
    if (![v17 count])
    {
      int v18 = DBLogForCategory(0xBuLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v20 = 0;
        _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "No remaining navigating apps.", v20, 2u);
      }

      id v19 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
      [v19 stopCountingTimeForKey:@"DBAnalyticsNavOwnershipTimeiOS"];
    }
  }
}

uint64_t __73__DBAnalytics__queue_applicationWithBundleIdentifier_didStartNavigation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"DBAnalyticsNavOwnershipTime"];
}

- (void)_queue_navigationOwnershipChangedToOwner:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
    [v5 stopCountingTimeForKey:@"DBAnalyticsNavOwnershipTimeiOS"];

    id v6 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
    uint64_t v7 = @"DBAnalyticsNavOwnershipTimeOEM";
LABEL_7:
    id v9 = v6;
    [v6 startCountingTimeForKey:v7];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    id v8 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
    [v8 stopCountingTimeForKey:@"DBAnalyticsNavOwnershipTimeOEM"];

    id v6 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
    uint64_t v7 = @"DBAnalyticsNavOwnershipTimeiOS";
    goto LABEL_7;
  }
  if (a3) {
    return;
  }
  BOOL v4 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
  [v4 stopCountingTimeForKey:@"DBAnalyticsNavOwnershipTimeOEM"];

  id v9 = [(DBAnalytics *)self analyticsNavOwnershipInfo];
  [v9 stopCountingTimeForKey:@"DBAnalyticsNavOwnershipTimeiOS"];
LABEL_8:
}

- (void)_mediaserverdConnectionDied
{
  unint64_t v3 = [(DBAnalytics *)self analyticsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__DBAnalytics__mediaserverdConnectionDied__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

uint64_t __42__DBAnalytics__mediaserverdConnectionDied__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_mediaserverdConnectionDied");
}

- (void)_queue_mediaserverdConnectionDied
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(DBAnalytics *)self setMediaserverdDiedDate:v3];
}

- (void)_queue_wifidConnectionDied
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(DBAnalytics *)self setWifidDiedDate:v3];
}

- (void)_queue_thermalTrapOccurred
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(DBAnalytics *)self setThermalTrapDate:v3];
}

- (void)invalidate
{
  id v3 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating analytics.", buf, 2u);
  }

  BOOL v4 = [(DBAnalytics *)self analyticsQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __25__DBAnalytics_invalidate__block_invoke;
  void v16[3] = &unk_2649B3E90;
  v16[4] = self;
  [v4 addOperationWithBlock:v16];

  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterServerRestartCallback();
    CFRelease(self->_wifiManager);
  }
  interface = self->_interface;
  if (interface)
  {
    [(CWFInterface *)interface stopMonitoringEventType:6];
    [(CWFInterface *)self->_interface invalidate];
  }
  id v6 = [(DBAnalytics *)self displayLayoutMonitor];
  [v6 invalidate];

  uint64_t v7 = [(DBAnalytics *)self keybagMonitor];
  [v7 removeObserver:self];

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];

  id v9 = [MEMORY[0x263F087C8] defaultCenter];
  [v9 removeObserver:self];

  Current = CFRunLoopGetCurrent();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_powerNotificationPort);
  CFRunLoopRemoveSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  IONotificationPortDestroy(self->_powerNotificationPort);
  self->_powerNotificationPort = 0;
  IOObjectRelease(self->_powerSourceNotification);
  self->_powerSourceNotification = 0;
  IOObjectRelease(self->_powerSource);
  self->_powerSource = 0;
  [(DBAnalytics *)self setConnectionTimeStore:0];
  uint64_t v12 = [(DBAnalytics *)self environmentConfiguration];
  uint64_t v13 = [v12 session];
  [v13 removeObserver:self];

  uint64_t v14 = [(DBAnalytics *)self environmentConfiguration];
  id v15 = [v14 thermalMonitor];
  [v15 removeObserver:self];
}

uint64_t __25__DBAnalytics_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [MEMORY[0x263EFF910] date];
  [v2 setObject:v3 forKey:@"CARAnalyticsPreviousSessionEnd"];

  BOOL v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_sessionEnded");
}

- (void)keybagMonitorLockStateDidChange:(id)a3
{
  if (![a3 currentState])
  {
    BOOL v4 = [(DBAnalytics *)self analyticsQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__DBAnalytics_keybagMonitorLockStateDidChange___block_invoke;
    v5[3] = &unk_2649B3E90;
    v5[4] = self;
    [v4 addOperationWithBlock:v5];
  }
}

uint64_t __47__DBAnalytics_keybagMonitorLockStateDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 sessionUnlockCount] + 1;
  return [v1 setSessionUnlockCount:v2];
}

- (BOOL)_queue_stateProviderIsReadyForAnalytics:(id)a3
{
  id v3 = a3;
  if ([v3 connectionReady]) {
    BOOL v4 = [v3 lockoutState] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)dashboardStateProvider:(id)a3 didChangeHomeScreenPageType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(DBAnalytics *)self analyticsQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__DBAnalytics_dashboardStateProvider_didChangeHomeScreenPageType___block_invoke;
  v9[3] = &unk_2649B4138;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [v7 addOperationWithBlock:v9];
}

void __66__DBAnalytics_dashboardStateProvider_didChangeHomeScreenPageType___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_stateProviderIsReadyForAnalytics:", *(void *)(a1 + 40)))
  {
    uint64_t v2 = [*(id *)(a1 + 32) startBundleIdentifier];
    if (!v2)
    {
      id v3 = DBHomeScreenBundleIdentifier;
      if (*(void *)(a1 + 48) != 2) {
        id v3 = DBDashboardBundleIdentifier;
      }
      uint64_t v2 = *v3;
    }
    BOOL v4 = v2;
    [*(id *)(a1 + 32) setLastHomeScreenPageType:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeToBundleIdentifier:", v4);
  }
}

- (void)dashboardStateProvider:(id)a3 didChangeActiveBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DBAnalytics *)self analyticsQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__DBAnalytics_dashboardStateProvider_didChangeActiveBundleIdentifier___block_invoke;
  v11[3] = &unk_2649B3ED8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __70__DBAnalytics_dashboardStateProvider_didChangeActiveBundleIdentifier___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_stateProviderIsReadyForAnalytics:", *(void *)(a1 + 40)))
  {
    [*(id *)(a1 + 32) setStartBundleIdentifier:0];
    id v3 = (__CFString *)*(id *)(a1 + 48);
    if ([(__CFString *)v3 isEqualToString:@"com.apple.CarPlay.dashboard"]
      && [*(id *)(a1 + 32) lastHomeScreenPageType] == 2)
    {
      uint64_t v2 = @"com.apple.CarPlay.homescreen";

      id v3 = v2;
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeToBundleIdentifier:", v3);
  }
}

- (void)session:(id)a3 openURL:(id)a4
{
  id v5 = objc_msgSend(a4, "absoluteString", a3);
  if ([v5 length])
  {
    id v6 = [(DBAnalytics *)self analyticsQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__DBAnalytics_session_openURL___block_invoke;
    v7[3] = &unk_2649B3D30;
    id v8 = v5;
    id v9 = self;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __31__DBAnalytics_session_openURL___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasPrefix:@"maps:"] & 1) != 0
    || [*(id *)(a1 + 32) hasPrefix:@"maps:/car/destinations"])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = [v2 sessionRequestUIMapsCount] + 1;
    return [v2 setSessionRequestUIMapsCount:v3];
  }
  else if (([*(id *)(a1 + 32) hasPrefix:@"mobilephone:"] & 1) != 0 {
         || [*(id *)(a1 + 32) hasPrefix:@"tel:"])
  }
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 sessionRequestUIPhoneCount] + 1;
    return [v5 setSessionRequestUIPhoneCount:v6];
  }
  else if ([*(id *)(a1 + 32) hasPrefix:@"messages:"])
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v7 sessionRequestUIMessagesCount] + 1;
    return [v7 setSessionRequestUIMessagesCount:v8];
  }
  else if (([*(id *)(a1 + 32) hasPrefix:@"nowplaying:"] & 1) != 0 {
         || ([*(id *)(a1 + 32) hasPrefix:@"music:"] & 1) != 0
  }
         || [*(id *)(a1 + 32) hasPrefix:@"podcasts:"])
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v9 sessionRequestUIMusicCount] + 1;
    return [v9 setSessionRequestUIMusicCount:v10];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) hasPrefix:@"app:"];
    if (result)
    {
      unint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = [v11 sessionRequestUIBundleIdentifierCount] + 1;
      return [v11 setSessionRequestUIBundleIdentifierCount:v12];
    }
  }
  return result;
}

- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5
{
  uint64_t v6 = objc_msgSend(a5, "absoluteString", a3, a4);
  if ([v6 length])
  {
    id v7 = [(DBAnalytics *)self analyticsQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__DBAnalytics_session_showUIForScreenInfo_withURL___block_invoke;
    v8[3] = &unk_2649B3D30;
    id v9 = v6;
    uint64_t v10 = self;
    [v7 addOperationWithBlock:v8];
  }
}

uint64_t __51__DBAnalytics_session_showUIForScreenInfo_withURL___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSuffix:@"instructioncard"];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = [v3 sessionShowUITurnCardCount] + 1;
    return [v3 setSessionShowUITurnCardCount:v4];
  }
  else
  {
    uint64_t v6 = [v3 sessionShowUIMapCount] + 1;
    return [v3 setSessionShowUIMapCount:v6];
  }
}

- (void)session:(id)a3 didSetViewArea:(id)a4 forScreenID:(id)a5 withDuration:(double)a6 transitionControlType:(unint64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = [a3 configuration];
  uint64_t v14 = [v13 screenInfoForScreenID:v12];

  id v15 = [(DBAnalytics *)self analyticsQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __85__DBAnalytics_session_didSetViewArea_forScreenID_withDuration_transitionControlType___block_invoke;
  v19[3] = &unk_2649B66B8;
  v19[4] = self;
  id v20 = v11;
  id v21 = v14;
  id v22 = v13;
  double v23 = a6;
  id v16 = v13;
  id v17 = v14;
  id v18 = v11;
  [v15 addOperationWithBlock:v19];
}

uint64_t __85__DBAnalytics_session_didSetViewArea_forScreenID_withDuration_transitionControlType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_screenViewAreaChanged:screenInfo:configuration:duration:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)thermalMonitorLevelDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__DBAnalytics_thermalMonitorLevelDidChange___block_invoke;
  v9[3] = &unk_2649B3D30;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 addOperationWithBlock:v9];

  if ([v6 level] == 3)
  {
    id v7 = [(DBAnalytics *)self analyticsQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__DBAnalytics_thermalMonitorLevelDidChange___block_invoke_2;
    v8[3] = &unk_2649B3E90;
    void v8[4] = self;
    [v7 addOperationWithBlock:v8];
  }
}

void __44__DBAnalytics_thermalMonitorLevelDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentThermalLevel];
  if (v2 != [*(id *)(a1 + 40) level])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentThermalLevel:", objc_msgSend(*(id *)(a1 + 40), "level"));
    id v6 = [*(id *)(a1 + 32) sessionThermalLevels];
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    id v4 = [*(id *)(a1 + 32) sessionStartDate];
    [v3 timeIntervalSinceDate:v4];
    objc_msgSend(v6, "appendFormat:", @"(%0.0f,%li)", v5, objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel"));
  }
}

uint64_t __44__DBAnalytics_thermalMonitorLevelDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_thermalTrapOccurred");
}

- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = [a3 isPlaying];
  id v7 = [(DBAnalytics *)self analyticsQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__DBAnalytics_nowPlayingObserver_didChangeNowPlayingApplication___block_invoke;
  v9[3] = &unk_2649B66E0;
  v9[4] = self;
  id v10 = v6;
  char v11 = (char)a3;
  id v8 = v6;
  [v7 addOperationWithBlock:v9];
}

uint64_t __65__DBAnalytics_nowPlayingObserver_didChangeNowPlayingApplication___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_nowPlayingUpdatedToApp:isPlaying:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)nowPlayingObserver:(id)a3 didUpdatePlaybackState:(BOOL)a4 inApplication:(id)a5
{
  id v7 = a5;
  id v8 = [(DBAnalytics *)self analyticsQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__DBAnalytics_nowPlayingObserver_didUpdatePlaybackState_inApplication___block_invoke;
  v10[3] = &unk_2649B66E0;
  v10[4] = self;
  id v11 = v7;
  BOOL v12 = a4;
  id v9 = v7;
  [v8 addOperationWithBlock:v10];
}

uint64_t __71__DBAnalytics_nowPlayingObserver_didUpdatePlaybackState_inApplication___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_nowPlayingUpdatedToApp:isPlaying:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_DBLayoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_msgSend(a4, "elements", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      if ([v11 isUIApplicationElement])
      {
        if ([v11 layoutRole] == 1) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    BOOL v12 = [v11 bundleIdentifier];

    if (!v12) {
      return;
    }
    id v13 = [(DBAnalytics *)self analyticsQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __67__DBAnalytics__DBLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
    v14[3] = &unk_2649B3D30;
    v14[4] = self;
    id v15 = v12;
    id v6 = v12;
    [v13 addOperationWithBlock:v14];
  }
LABEL_13:
}

uint64_t __67__DBAnalytics__DBLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deviceDidChangeToBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)clusterForegroundElementDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__DBAnalytics_clusterForegroundElementDidChange___block_invoke;
  v7[3] = &unk_2649B3D30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __49__DBAnalytics_clusterForegroundElementDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "visibleClusterAppsAnalyticsInfo", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) stopCountingClusterVisibleTime];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appAnalyticsInfoForBundleIdentifier:");
    uint64_t v7 = (_DBAnalyticsAppInfo *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      id v8 = +[DBApplicationController sharedInstance];
      uint64_t v9 = [v8 applicationWithBundleIdentifier:*(void *)(a1 + 40)];

      uint64_t v10 = [_DBAnalyticsAppInfo alloc];
      if (v9)
      {
        id v11 = [v9 info];
        BOOL v12 = +[DBApplicationController sharedInstance];
        id v13 = [v12 _appPolicyEvaluator];
        uint64_t v7 = [(_DBAnalyticsAppInfo *)v10 initWithAppInfo:v11 policyEvaluator:v13];
      }
      else
      {
        uint64_t v14 = *(void *)(a1 + 40);
        id v11 = +[DBApplicationController sharedInstance];
        BOOL v12 = [v11 _appPolicyEvaluator];
        uint64_t v7 = [(_DBAnalyticsAppInfo *)v10 initWithBundleIdentifier:v14 appDeclaration:0 policyEvaluator:v12];
      }

      id v15 = [*(id *)(a1 + 32) analyticsAppInfo];
      [v15 addObject:v7];
    }
    [(_DBAnalyticsAppInfo *)v7 startCountingClusterVisibleTime];
  }
}

- (void)dashboardNavigationDidChangeToBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(DBAnalytics *)self analyticsQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__DBAnalytics_dashboardNavigationDidChangeToBundleIdentifier___block_invoke;
    v6[3] = &unk_2649B3D30;
    void v6[4] = self;
    id v7 = v4;
    [v5 addOperationWithBlock:v6];
  }
}

void __62__DBAnalytics_dashboardNavigationDidChangeToBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLastDashboardNavigationBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) appAnalyticsInfoForBundleIdentifier:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = +[DBApplicationController sharedInstance];
    id v4 = [v3 applicationWithBundleIdentifier:*(void *)(a1 + 40)];

    uint64_t v5 = [_DBAnalyticsAppInfo alloc];
    if (v4)
    {
      uint64_t v6 = [v4 info];
      id v7 = +[DBApplicationController sharedInstance];
      id v8 = [v7 _appPolicyEvaluator];
      uint64_t v2 = [(_DBAnalyticsAppInfo *)v5 initWithAppInfo:v6 policyEvaluator:v8];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v6 = +[DBApplicationController sharedInstance];
      id v7 = [v6 _appPolicyEvaluator];
      uint64_t v2 = [(_DBAnalyticsAppInfo *)v5 initWithBundleIdentifier:v9 appDeclaration:0 policyEvaluator:v7];
    }

    uint64_t v10 = [*(id *)(a1 + 32) analyticsAppInfo];
    [v10 addObject:v2];
  }
  [(_DBAnalyticsAppInfo *)v2 setDashboardWidgetType:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = objc_msgSend(*(id *)(a1 + 32), "visibleDashboardAppsAnalyticsInfo", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v17 = [v16 bundleIdentifier];
        if ([v17 isEqual:*(void *)(a1 + 40)])
        {
        }
        else
        {
          uint64_t v18 = [v16 dashboardWidgetType];
          uint64_t v19 = [(_DBAnalyticsAppInfo *)v2 dashboardWidgetType];

          if (v18 == v19) {
            [v16 stopCountingDashboardVisibleTime];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v20 = [*(id *)(a1 + 32) lastActiveBundleIdentifier];
  int v21 = [v20 isEqualToString:@"com.apple.CarPlay.dashboard"];

  if (v21) {
    [(_DBAnalyticsAppInfo *)v2 startCountingDashboardVisibleTime];
  }
}

- (void)dashboardAudioWidgetDidChangeToBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(DBAnalytics *)self analyticsQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__DBAnalytics_dashboardAudioWidgetDidChangeToBundleIdentifier___block_invoke;
    v6[3] = &unk_2649B3D30;
    void v6[4] = self;
    id v7 = v4;
    [v5 addOperationWithBlock:v6];
  }
}

void __63__DBAnalytics_dashboardAudioWidgetDidChangeToBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLastDashboardAudioWidgetBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) appAnalyticsInfoForBundleIdentifier:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = [_DBAnalyticsAppInfo alloc];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = +[DBApplicationController sharedInstance];
    uint64_t v6 = [v5 _appPolicyEvaluator];
    uint64_t v2 = [(_DBAnalyticsAppInfo *)v3 initWithBundleIdentifier:v4 appDeclaration:0 policyEvaluator:v6];

    id v7 = [*(id *)(a1 + 32) analyticsAppInfo];
    [v7 addObject:v2];
  }
  [(_DBAnalyticsAppInfo *)v2 setDashboardWidgetType:2];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "visibleDashboardAppsAnalyticsInfo", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 bundleIdentifier];
        if ([v14 isEqual:*(void *)(a1 + 40)])
        {
        }
        else
        {
          uint64_t v15 = [v13 dashboardWidgetType];
          uint64_t v16 = [(_DBAnalyticsAppInfo *)v2 dashboardWidgetType];

          if (v15 == v16) {
            [v13 stopCountingDashboardVisibleTime];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  long long v17 = [*(id *)(a1 + 32) lastActiveBundleIdentifier];
  int v18 = [v17 isEqualToString:@"com.apple.CarPlay.dashboard"];

  if (v18) {
    [(_DBAnalyticsAppInfo *)v2 startCountingDashboardVisibleTime];
  }
}

- (void)siriDidPresent
{
  uint64_t v3 = [(DBAnalytics *)self analyticsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__DBAnalytics_siriDidPresent__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

void __29__DBAnalytics_siriDidPresent__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) visibleAppsAnalyticsInfo];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_643_0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeToBundleIdentifier:", @"com.apple.siri");
}

void __29__DBAnalytics_siriDidPresent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setWasVisibleBeforeSiri:1];
  [v2 stopCountingVisibleTime];
}

- (void)siriDidStartHostingBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__DBAnalytics_siriDidStartHostingBundleIdentifier___block_invoke;
  v7[3] = &unk_2649B3D30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __51__DBAnalytics_siriDidStartHostingBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriHostedBundleIdentifier];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setSiriHostedBundleIdentifier:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 32) appAnalyticsInfoForBundleIdentifier:*(void *)(a1 + 40)];
    if (!v4)
    {
      uint64_t v5 = [_DBAnalyticsAppInfo alloc];
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = +[DBApplicationController sharedInstance];
      id v8 = [v7 _appPolicyEvaluator];
      uint64_t v10 = [(_DBAnalyticsAppInfo *)v5 initWithBundleIdentifier:v6 appDeclaration:0 policyEvaluator:v8];

      uint64_t v9 = [*(id *)(a1 + 32) analyticsAppInfo];
      [v9 addObject:v10];

      id v4 = v10;
    }
    id v11 = v4;
    objc_msgSend(v4, "setNumberOfSiriPresentations:", objc_msgSend(v4, "numberOfSiriPresentations") + 1);
  }
}

- (void)siriDidDismiss
{
  char v3 = [(DBAnalytics *)self analyticsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__DBAnalytics_siriDidDismiss__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

void __29__DBAnalytics_siriDidDismiss__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSiriHostedBundleIdentifier:0];
  id v3 = [*(id *)(a1 + 32) appAnalyticsInfoForBundleIdentifier:@"com.apple.siri"];
  [v3 stopCountingVisibleTime];
  id v2 = [*(id *)(a1 + 32) _analyticsInfoPassingTest:&__block_literal_global_645];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_647];
}

uint64_t __29__DBAnalytics_siriDidDismiss__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 wasVisibleBeforeSiri];
}

void __29__DBAnalytics_siriDidDismiss__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setWasVisibleBeforeSiri:0];
  [v2 startCountingVisibleTime];
}

- (void)firstFrameSent
{
  id v3 = [(DBAnalytics *)self analyticsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__DBAnalytics_firstFrameSent__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

void __29__DBAnalytics_firstFrameSent__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setFirstFrameTimestamp:v2];
}

- (void)_queue_fetchLocationBits
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = CLGetAccessoryTypeBitSet();
  id v4 = DBLogForCategory(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithInt:v3];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Received location bitset %@", (uint8_t *)&v7, 0xCu);
  }
  if (v3)
  {
    if ((v3 & 0x20) != 0) {
      uint64_t v6 = @"No";
    }
    else {
      uint64_t v6 = @"Yes";
    }
    [(DBAnalytics *)self setAccessorySupportsLocation:v6];
    if (v3)
    {
      [(DBAnalytics *)self setAccessorySupportsLocationPASCDSpeed:1];
      if ((v3 & 2) == 0)
      {
LABEL_9:
        if ((v3 & 4) == 0) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_9;
    }
    [(DBAnalytics *)self setAccessorySupportsLocationGPGGA:1];
    if ((v3 & 4) == 0)
    {
LABEL_10:
      if ((v3 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
LABEL_16:
    [(DBAnalytics *)self setAccessorySupportsLocationGPRMC:1];
    if ((v3 & 8) == 0)
    {
LABEL_11:
      if ((v3 & 0x10) == 0) {
        return;
      }
      goto LABEL_12;
    }
LABEL_17:
    [(DBAnalytics *)self setAccessorySupportsLocationDeadReckoning:1];
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_12:
    [(DBAnalytics *)self setAccessorySupportsLocationChinaShifted:1];
  }
}

+ (id)_axPhoneColorFiltersAnalyticsString
{
  if (MADisplayFilterPrefGetCategoryEnabled())
  {
    id v2 = @"Undefined";
    switch(MADisplayFilterPrefGetType())
    {
      case 1:
        uint64_t v3 = objc_opt_class();
        MADisplayFilterPrefGetGrayscaleCorrectionIntensity();
        id v4 = objc_msgSend(v3, "_axColorFiltersIntensityStringForFloat:");
        uint64_t v5 = @"Gray";
        if (v4) {
          goto LABEL_11;
        }
        break;
      case 2:
        uint64_t v6 = objc_opt_class();
        MADisplayFilterPrefGetRedColorCorrectionIntensity();
        id v4 = objc_msgSend(v6, "_axColorFiltersIntensityStringForFloat:");
        uint64_t v5 = @"RedGreen";
        if (v4) {
          goto LABEL_11;
        }
        break;
      case 4:
        int v7 = objc_opt_class();
        MADisplayFilterPrefGetGreenColorCorrectionIntensity();
        id v4 = objc_msgSend(v7, "_axColorFiltersIntensityStringForFloat:");
        uint64_t v5 = @"GreenRed";
        if (v4) {
          goto LABEL_11;
        }
        break;
      case 8:
        id v8 = objc_opt_class();
        MADisplayFilterPrefGetBlueColorCorrectionIntensity();
        id v4 = objc_msgSend(v8, "_axColorFiltersIntensityStringForFloat:");
        uint64_t v5 = @"BlueYellow";
        if (v4)
        {
LABEL_11:
          id v2 = [NSString stringWithFormat:@"%@-%@", v5, v4];
        }
        break;
      default:
        break;
    }
  }
  else
  {
    id v2 = @"Off";
  }
  return v2;
}

+ (id)_axColorFiltersIntensityStringForFloat:(double)a3
{
  if (a3 <= 0.330000013) {
    return @"Low";
  }
  if (a3 <= 0.660000026) {
    return @"Medium";
  }
  if (a3 >= 1.0) {
    return @"High";
  }
  return @"Undefined";
}

+ (id)_axPhoneSoundRecognitionAnalyticsString:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 addObject:@"Enabled"];
    if ((v3 & 2) != 0) {
      [v5 addObject:@"CarHorns"];
    }
    if ((v3 & 4) != 0) {
      [v5 addObject:@"Siren"];
    }
    uint64_t v6 = [v5 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v6 = @"Off";
  }

  return v6;
}

- (void)sendEvent:(unint64_t)a3 withParameters:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(id)objc_opt_class() shouldSendAnalyticsEvents])
  {
    if (a3 >= 0xB)
    {
      int v7 = DBLogForCategory(0xBuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[DBAnalytics sendEvent:withParameters:](a3);
      }
      goto LABEL_9;
    }
    uint64_t v6 = [NSString stringWithFormat:@"com.apple.CarPlay.%@", off_2649B6848[a3]];
    if (v6)
    {
      int v7 = v6;
      id v8 = DBLogForCategory(0xBuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        id v12 = v5;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Sending CA event %@ with %@", buf, 0x16u);
      }

      AnalyticsSendEvent();
LABEL_9:
    }
  }
}

- (id)_analyticsLayoutInfoPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsLayoutInfo];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__DBAnalytics__analyticsLayoutInfoPassingTest___block_invoke;
  v11[3] = &unk_2649B6728;
  id v12 = v4;
  id v6 = v4;
  int v7 = [v5 indexesOfObjectsPassingTest:v11];

  id v8 = [(DBAnalytics *)self analyticsLayoutInfo];
  uint64_t v9 = [v8 objectsAtIndexes:v7];

  return v9;
}

uint64_t __47__DBAnalytics__analyticsLayoutInfoPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_analyticsInfoPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsAppInfo];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__DBAnalytics__analyticsInfoPassingTest___block_invoke;
  v11[3] = &unk_2649B6750;
  id v12 = v4;
  id v6 = v4;
  int v7 = [v5 indexesOfObjectsPassingTest:v11];

  id v8 = [(DBAnalytics *)self analyticsAppInfo];
  uint64_t v9 = [v8 objectsAtIndexes:v7];

  return v9;
}

uint64_t __41__DBAnalytics__analyticsInfoPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)nowPlayingAppAnalyticsInfo
{
  id v2 = [(DBAnalytics *)self _analyticsInfoPassingTest:&__block_literal_global_696];
  char v3 = [v2 firstObject];

  return v3;
}

uint64_t __41__DBAnalytics_nowPlayingAppAnalyticsInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"CARAnalyticsPlaybackTime"];
}

- (id)visibleAppsAnalyticsInfo
{
  return [(DBAnalytics *)self _analyticsInfoPassingTest:&__block_literal_global_698];
}

uint64_t __39__DBAnalytics_visibleAppsAnalyticsInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"CARAnalyticsAppVisibilityTime"];
}

- (id)visibleDashboardAppsAnalyticsInfo
{
  return [(DBAnalytics *)self _analyticsInfoPassingTest:&__block_literal_global_700];
}

uint64_t __48__DBAnalytics_visibleDashboardAppsAnalyticsInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"CARAnalyticsDashboardVisibilityTime"];
}

- (id)visibleClusterAppsAnalyticsInfo
{
  return [(DBAnalytics *)self _analyticsInfoPassingTest:&__block_literal_global_702];
}

uint64_t __46__DBAnalytics_visibleClusterAppsAnalyticsInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"CARAnalyticsClusterVisibilityTime"];
}

- (id)appAnalyticsInfoForApp:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__DBAnalytics_appAnalyticsInfoForApp___block_invoke;
  v9[3] = &unk_2649B6778;
  id v10 = v4;
  id v5 = v4;
  id v6 = [(DBAnalytics *)self _analyticsInfoPassingTest:v9];
  int v7 = [v6 firstObject];

  return v7;
}

uint64_t __38__DBAnalytics_appAnalyticsInfoForApp___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 appInfo];
  id v4 = [v3 bundleIdentifier];
  id v5 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)appAnalyticsInfoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__DBAnalytics_appAnalyticsInfoForBundleIdentifier___block_invoke;
  v9[3] = &unk_2649B6778;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(DBAnalytics *)self _analyticsInfoPassingTest:v9];
  int v7 = [v6 firstObject];

  return v7;
}

uint64_t __51__DBAnalytics_appAnalyticsInfoForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_queue_powerStateDidChange
{
  CFMutableDictionaryRef properties = 0;
  if (!IORegistryEntryCreateCFProperties(self->_powerSource, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0))
  {
    char v3 = [(DBAnalytics *)self analyticsChargeInfo];

    if (!v3)
    {
      uint64_t v4 = objc_alloc_init(_DBAnalyticsChargeInfo);
      [(DBAnalytics *)self setAnalyticsChargeInfo:v4];
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(properties, @"AdapterDetails");
    if (Value)
    {
      CFDictionaryRef v6 = Value;
      int v7 = CFDictionaryGetValue(properties, @"IsCharging");
      int v8 = [v7 BOOLValue];
      if (v8)
      {
        uint64_t v9 = CFDictionaryGetValue(v6, @"Description");
        id v10 = [(DBAnalytics *)self analyticsChargeInfo];
        [v10 setAdapterDescription:v9];

        uint64_t v11 = objc_msgSend((id)CFDictionaryGetValue(v6, @"FamilyCode"), "integerValue");
        if (v11 > -536838145)
        {
          switch(v11)
          {
            case -536723456:
              id v12 = @"AC";
              break;
            case -536723455:
              id v12 = @"External1Puck";
              break;
            case -536723454:
              id v12 = @"External2";
              break;
            case -536723453:
              id v12 = @"Qi";
              break;
            case -536723452:
              id v12 = @"External4";
              break;
            case -536723451:
              id v12 = @"External5";
              break;
            case -536723450:
              id v12 = @"MagSafeCharger";
              break;
            case -536723449:
              id v12 = @"MagSafeAccessory";
              break;
            case -536723448:
              id v12 = @"External8";
              break;
            default:
              if (v11 == -536838144)
              {
                id v12 = @"Firewire";
              }
              else if (v11)
              {
LABEL_35:
                objc_msgSend(NSString, "stringWithFormat:", @"UnknownFamilyCode:%ld", v11);
                id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v12 = @"Disconnected";
              }
              break;
          }
        }
        else
        {
          switch(v11)
          {
            case -536854528:
              id v12 = @"USBHost";
              break;
            case -536854527:
              id v12 = @"USBHostSuspended";
              break;
            case -536854526:
              id v12 = @"USBDevice";
              break;
            case -536854525:
              id v12 = @"USBAdapter";
              break;
            case -536854524:
              id v12 = @"USBChargingPortDedicated";
              break;
            case -536854523:
              id v12 = @"USBChargingPortDownstream";
              break;
            case -536854522:
              id v12 = @"USBChargingPort";
              break;
            case -536854521:
              id v12 = @"USBUnknown";
              break;
            case -536854520:
              id v12 = @"USBCBrick";
              break;
            case -536854519:
              id v12 = @"USBCTypeC";
              break;
            case -536854518:
              id v12 = @"USBCPD";
              break;
            default:
              if (v11 != -536870201) {
                goto LABEL_35;
              }
              id v12 = @"Unsupported";
              break;
          }
        }
        uint64_t v13 = [(DBAnalytics *)self analyticsChargeInfo];
        [v13 setAdapterFamily:v12];

        if (objc_msgSend((id)CFDictionaryGetValue(v6, @"IsWireless"), "BOOLValue"))
        {
          uint64_t v14 = [(DBAnalytics *)self analyticsChargeInfo];
          [v14 setWireless:1];
        }
        int v15 = objc_msgSend((id)CFDictionaryGetValue(v6, @"AdapterVoltage"), "intValue");
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d V", (v15 / 1000), (v15 / 100 % 10));
        long long v17 = [(DBAnalytics *)self analyticsChargeInfo];
        [v17 setVoltage:v16];

        uint64_t v18 = objc_msgSend((id)CFDictionaryGetValue(v6, @"Current"), "intValue");
        long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d mA", v18);
        long long v20 = [(DBAnalytics *)self analyticsChargeInfo];
        [v20 setCurrent:v19];

        uint64_t v21 = objc_msgSend((id)CFDictionaryGetValue(v6, @"PMUConfiguration"), "intValue");
        long long v22 = NSString;
        long long v23 = [NSNumber numberWithInt:v21];
        uint64_t v24 = [v22 stringWithFormat:@"%@ mA", v23];
        long long v25 = [(DBAnalytics *)self analyticsChargeInfo];
        [v25 setPMUConfiguration:v24];

        uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d W", ((int)v18 * v15 / 1000000), (__int16)(((351843721 * (int)v18 * v15) >> 45) + ((unint64_t)(351843721 * (int)v18 * v15) >> 63))% 10);
        uint64_t v27 = [(DBAnalytics *)self analyticsChargeInfo];
        [v27 setWattage:v26];
      }
      int64_t v28 = [(DBAnalytics *)self currentChargingState];
      BOOL v29 = [(DBAnalytics *)self currentChargingState] != 1;
      if (v28 == -1 || ((v8 ^ v29) & 1) == 0)
      {
        double v30 = [(DBAnalytics *)self analyticsChargeInfo];
        CGFloat v31 = v30;
        if (v8)
        {
          [v30 setDidChargeDuringSession:1];

          double v32 = [(DBAnalytics *)self analyticsChargeInfo];
          [v32 startCountingTimeForKey:@"CARAnalyticsChargingTime"];

          [(DBAnalytics *)self setCurrentChargingState:1];
          CGFloat v33 = [(DBAnalytics *)self analyticsChargeInfo];
          double v34 = [v33 sessionChargingStates];
          CGFloat v35 = [MEMORY[0x263EFF910] date];
          double v36 = [(DBAnalytics *)self sessionStartDate];
          [v35 timeIntervalSinceDate:v36];
          uint64_t v38 = v37;
          CGFloat v39 = [(DBAnalytics *)self analyticsChargeInfo];
          CGFloat v40 = [v39 adapterFamily];
          [v34 appendFormat:@"(%0.0f,1,%@)", v38, v40];
        }
        else
        {
          [v30 stopCountingTimeForKey:@"CARAnalyticsChargingTime"];

          [(DBAnalytics *)self setCurrentChargingState:0];
          CGFloat v33 = [(DBAnalytics *)self analyticsChargeInfo];
          double v34 = [v33 sessionChargingStates];
          CGFloat v35 = [MEMORY[0x263EFF910] date];
          double v36 = [(DBAnalytics *)self sessionStartDate];
          [v35 timeIntervalSinceDate:v36];
          objc_msgSend(v34, "appendFormat:", @"(%0.0f,0,None)", v41);
        }
      }
    }
    CFRelease(properties);
  }
}

- (void)changedLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAnalytics *)self analyticsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__DBAnalytics_changedLayout___block_invoke;
  v7[3] = &unk_2649B3D30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __29__DBAnalytics_changedLayout___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _analyticsLayoutInfoPassingTest:&__block_literal_global_747];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v6++) stopCountingVisibleTime];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  int v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __29__DBAnalytics_changedLayout___block_invoke_3;
    v12[3] = &unk_2649B67C0;
    id v13 = v7;
    uint64_t v9 = [v8 _analyticsLayoutInfoPassingTest:v12];
    id v10 = [v9 firstObject];

    if (!v10)
    {
      id v10 = [[_DBAnalyticsLayoutInfo alloc] initWithLayout:*(void *)(a1 + 40)];
      uint64_t v11 = [*(id *)(a1 + 32) analyticsLayoutInfo];
      [v11 addObject:v10];
    }
    [(_DBAnalyticsLayoutInfo *)v10 startCountingVisibleTime];
  }
}

uint64_t __29__DBAnalytics_changedLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAccumulatingTimeForKey:@"DBAnalyticsLayoutVisibilityTime"];
}

uint64_t __29__DBAnalytics_changedLayout___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 layoutDisplayName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environmentConfiguration);
  return (DBEnvironmentConfiguration *)WeakRetained;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (CARAutomaticDNDStatus)dndStatus
{
  return self->_dndStatus;
}

- (void)setDndStatus:(id)a3
{
}

- (NSOperationQueue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (DBNowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (DBKeybagMonitor)keybagMonitor
{
  return self->_keybagMonitor;
}

- (void)setKeybagMonitor:(id)a3
{
}

- (CRSSiriPreferences)siriPreferences
{
  return self->_siriPreferences;
}

- (void)setSiriPreferences:(id)a3
{
}

- (NSDate)firstFrameTimestamp
{
  return self->_firstFrameTimestamp;
}

- (void)setFirstFrameTimestamp:(id)a3
{
}

- (BOOL)sessionStartedEventSent
{
  return self->_sessionStartedEventSent;
}

- (void)setSessionStartedEventSent:(BOOL)a3
{
  self->_sessionStartedEventSent = a3;
}

- (int64_t)currentChargingState
{
  return self->_currentChargingState;
}

- (void)setCurrentChargingState:(int64_t)a3
{
  self->_currentChargingState = a3;
}

- (unint64_t)lastHomeScreenPageType
{
  return self->_lastHomeScreenPageType;
}

- (void)setLastHomeScreenPageType:(unint64_t)a3
{
  self->_lastHomeScreenPageType = a3;
}

- (NSString)lastActiveBundleIdentifier
{
  return self->_lastActiveBundleIdentifier;
}

- (void)setLastActiveBundleIdentifier:(id)a3
{
}

- (NSDictionary)vehicleAnalyticsRepresentation
{
  return self->_vehicleAnalyticsRepresentation;
}

- (void)setVehicleAnalyticsRepresentation:(id)a3
{
}

- (unint64_t)sessionUnlockCount
{
  return self->_sessionUnlockCount;
}

- (void)setSessionUnlockCount:(unint64_t)a3
{
  self->_sessionUnlockCount = a3;
}

- (NSMutableArray)analyticsAppInfo
{
  return self->_analyticsAppInfo;
}

- (void)setAnalyticsAppInfo:(id)a3
{
}

- (NSMutableArray)analyticsScreenInfo
{
  return self->_analyticsScreenInfo;
}

- (void)setAnalyticsScreenInfo:(id)a3
{
}

- (_DBAnalyticsChargeInfo)analyticsChargeInfo
{
  return self->_analyticsChargeInfo;
}

- (void)setAnalyticsChargeInfo:(id)a3
{
}

- (NSMutableArray)analyticsLayoutInfo
{
  return self->_analyticsLayoutInfo;
}

- (void)setAnalyticsLayoutInfo:(id)a3
{
}

- (_DBAnalyticsTimeAccumulator)analyticsNavOwnershipInfo
{
  return self->_analyticsNavOwnershipInfo;
}

- (void)setAnalyticsNavOwnershipInfo:(id)a3
{
}

- (double)screenOwnershipDuration
{
  return self->_screenOwnershipDuration;
}

- (void)setScreenOwnershipDuration:(double)a3
{
  self->_screenOwnershipDuration = a3;
}

- (NSDate)screenOwnershipDate
{
  return self->_screenOwnershipDate;
}

- (void)setScreenOwnershipDate:(id)a3
{
}

- (double)audioOwnershipDuration
{
  return self->_audioOwnershipDuration;
}

- (void)setAudioOwnershipDuration:(double)a3
{
  self->_audioOwnershipDuration = a3;
}

- (NSDate)audioOwnershipDate
{
  return self->_audioOwnershipDate;
}

- (void)setAudioOwnershipDate:(id)a3
{
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
}

- (NSMutableDictionary)sessionAppLaunches
{
  return self->_sessionAppLaunches;
}

- (void)setSessionAppLaunches:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (NSMutableDictionary)sessionDeviceAppLaunches
{
  return self->_sessionDeviceAppLaunches;
}

- (void)setSessionDeviceAppLaunches:(id)a3
{
}

- (NSMutableDictionary)sessionNavigationOwners
{
  return self->_sessionNavigationOwners;
}

- (void)setSessionNavigationOwners:(id)a3
{
}

- (NSString)lastDashboardNavigationBundleIdentifier
{
  return self->_lastDashboardNavigationBundleIdentifier;
}

- (void)setLastDashboardNavigationBundleIdentifier:(id)a3
{
}

- (NSString)lastDashboardAudioWidgetBundleIdentifier
{
  return self->_lastDashboardAudioWidgetBundleIdentifier;
}

- (void)setLastDashboardAudioWidgetBundleIdentifier:(id)a3
{
}

- (unint64_t)sessionRequestUIMapsCount
{
  return self->_sessionRequestUIMapsCount;
}

- (void)setSessionRequestUIMapsCount:(unint64_t)a3
{
  self->_sessionRequestUIMapsCount = a3;
}

- (unint64_t)sessionRequestUIMessagesCount
{
  return self->_sessionRequestUIMessagesCount;
}

- (void)setSessionRequestUIMessagesCount:(unint64_t)a3
{
  self->_sessionRequestUIMessagesCount = a3;
}

- (unint64_t)sessionRequestUIPhoneCount
{
  return self->_sessionRequestUIPhoneCount;
}

- (void)setSessionRequestUIPhoneCount:(unint64_t)a3
{
  self->_sessionRequestUIPhoneCount = a3;
}

- (unint64_t)sessionRequestUIMusicCount
{
  return self->_sessionRequestUIMusicCount;
}

- (void)setSessionRequestUIMusicCount:(unint64_t)a3
{
  self->_sessionRequestUIMusicCount = a3;
}

- (unint64_t)sessionRequestUIBundleIdentifierCount
{
  return self->_sessionRequestUIBundleIdentifierCount;
}

- (void)setSessionRequestUIBundleIdentifierCount:(unint64_t)a3
{
  self->_sessionRequestUIBundleIdentifierCount = a3;
}

- (unint64_t)sessionShowUIMapCount
{
  return self->_sessionShowUIMapCount;
}

- (void)setSessionShowUIMapCount:(unint64_t)a3
{
  self->_sessionShowUIMapCount = a3;
}

- (unint64_t)sessionShowUITurnCardCount
{
  return self->_sessionShowUITurnCardCount;
}

- (void)setSessionShowUITurnCardCount:(unint64_t)a3
{
  self->_sessionShowUITurnCardCount = a3;
}

- (NSString)startBundleIdentifier
{
  return self->_startBundleIdentifier;
}

- (void)setStartBundleIdentifier:(id)a3
{
}

- (NSString)siriHostedBundleIdentifier
{
  return self->_siriHostedBundleIdentifier;
}

- (void)setSiriHostedBundleIdentifier:(id)a3
{
}

- (NSString)accessorySupportsLocation
{
  return self->_accessorySupportsLocation;
}

- (void)setAccessorySupportsLocation:(id)a3
{
}

- (BOOL)accessorySupportsLocationPASCDSpeed
{
  return self->_accessorySupportsLocationPASCDSpeed;
}

- (void)setAccessorySupportsLocationPASCDSpeed:(BOOL)a3
{
  self->_accessorySupportsLocationPASCDSpeed = a3;
}

- (BOOL)accessorySupportsLocationGPGGA
{
  return self->_accessorySupportsLocationGPGGA;
}

- (void)setAccessorySupportsLocationGPGGA:(BOOL)a3
{
  self->_accessorySupportsLocationGPGGA = a3;
}

- (BOOL)accessorySupportsLocationGPRMC
{
  return self->_accessorySupportsLocationGPRMC;
}

- (void)setAccessorySupportsLocationGPRMC:(BOOL)a3
{
  self->_accessorySupportsLocationGPRMC = a3;
}

- (BOOL)accessorySupportsLocationDeadReckoning
{
  return self->_accessorySupportsLocationDeadReckoning;
}

- (void)setAccessorySupportsLocationDeadReckoning:(BOOL)a3
{
  self->_accessorySupportsLocationDeadReckoning = a3;
}

- (BOOL)accessorySupportsLocationChinaShifted
{
  return self->_accessorySupportsLocationChinaShifted;
}

- (void)setAccessorySupportsLocationChinaShifted:(BOOL)a3
{
  self->_accessorySupportsLocationChinaShifted = a3;
}

- (NSDate)mediaserverdDiedDate
{
  return self->_mediaserverdDiedDate;
}

- (void)setMediaserverdDiedDate:(id)a3
{
}

- (NSDate)wifidDiedDate
{
  return self->_wifidDiedDate;
}

- (void)setWifidDiedDate:(id)a3
{
}

- (NSDate)thermalTrapDate
{
  return self->_thermalTrapDate;
}

- (void)setThermalTrapDate:(id)a3
{
}

- (NSDate)wifiLinkDownDate
{
  return self->_wifiLinkDownDate;
}

- (void)setWifiLinkDownDate:(id)a3
{
}

- (NSString)wifiLinkDownReason
{
  return self->_wifiLinkDownReason;
}

- (void)setWifiLinkDownReason:(id)a3
{
}

- (NSMutableString)sessionThermalLevels
{
  return self->_sessionThermalLevels;
}

- (void)setSessionThermalLevels:(id)a3
{
}

- (int64_t)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int64_t)a3
{
  self->_currentThermalLevel = a3;
}

- (CARConnectionTimeStore)connectionTimeStore
{
  return self->_connectionTimeStore;
}

- (void)setConnectionTimeStore:(id)a3
{
}

- (int64_t)mapsAppearanceStyle
{
  return self->_mapsAppearanceStyle;
}

- (void)setMapsAppearanceStyle:(int64_t)a3
{
  self->_mapsAppearanceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimeStore, 0);
  objc_storeStrong((id *)&self->_sessionThermalLevels, 0);
  objc_storeStrong((id *)&self->_wifiLinkDownReason, 0);
  objc_storeStrong((id *)&self->_wifiLinkDownDate, 0);
  objc_storeStrong((id *)&self->_thermalTrapDate, 0);
  objc_storeStrong((id *)&self->_wifidDiedDate, 0);
  objc_storeStrong((id *)&self->_mediaserverdDiedDate, 0);
  objc_storeStrong((id *)&self->_accessorySupportsLocation, 0);
  objc_storeStrong((id *)&self->_siriHostedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDashboardAudioWidgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDashboardNavigationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionNavigationOwners, 0);
  objc_storeStrong((id *)&self->_sessionDeviceAppLaunches, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_sessionAppLaunches, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_audioOwnershipDate, 0);
  objc_storeStrong((id *)&self->_screenOwnershipDate, 0);
  objc_storeStrong((id *)&self->_analyticsNavOwnershipInfo, 0);
  objc_storeStrong((id *)&self->_analyticsLayoutInfo, 0);
  objc_storeStrong((id *)&self->_analyticsChargeInfo, 0);
  objc_storeStrong((id *)&self->_analyticsScreenInfo, 0);
  objc_storeStrong((id *)&self->_analyticsAppInfo, 0);
  objc_storeStrong((id *)&self->_vehicleAnalyticsRepresentation, 0);
  objc_storeStrong((id *)&self->_lastActiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_firstFrameTimestamp, 0);
  objc_storeStrong((id *)&self->_siriPreferences, 0);
  objc_storeStrong((id *)&self->_keybagMonitor, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_dndStatus, 0);
  objc_destroyWeak((id *)&self->_environmentConfiguration);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (void)initWithEnvironmentConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Failed to start monitoring link change events: %@", (uint8_t *)&v2, 0xCu);
}

void __34__DBAnalytics__queue_sessionEnded__block_invoke_547_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Unable to send CARConnectionEventSessionDetails due to error %@", v4, v5, v6, v7, 2u);
}

- (void)sendEvent:(uint64_t)a1 withParameters:.cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Unrecognized analytics event %@", v4, v5, v6, v7, 2u);
}

@end