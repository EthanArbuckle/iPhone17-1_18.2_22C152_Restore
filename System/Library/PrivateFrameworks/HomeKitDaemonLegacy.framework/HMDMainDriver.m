@interface HMDMainDriver
+ (id)driver;
+ (id)getLocalStoreFrom:(id)a3;
+ (id)loadHomeDataFromDemoModeStore:(id *)a3;
+ (id)loadHomeDataFromLocalStore:(id *)a3 decryptionFailed:(BOOL *)a4;
+ (id)loadHomeDataFromLocalStore:(id *)a3 fromLocation:(id)a4 decryptionFailed:(BOOL *)a5 forHH2Migration:(BOOL)a6;
+ (id)loadSQLArchiveWithDecryptionFail:(BOOL *)a3 fromLocation:(id)a4 forHH2Migration:(BOOL)a5 error:(id *)a6;
+ (id)logCategory;
- (HMDAccessoryBrowser)accessoryBrowser;
- (HMDAppleMediaAccessoryDiagnosticInfoController)appleMediaAccessoryDiagnosticInfoController;
- (HMDCoreData)coreData;
- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher;
- (HMDDeviceSetupConfiguringController)configuringStateController;
- (HMDHomeManager)homeManager;
- (HMDMainDriver)init;
- (HMDMetricsManager)metricsManager;
- (HMDNetworkInfoController)networkInfoController;
- (HMDRetailDemoModeRequestHandler)retailDemoModeRequestHandler;
- (HMDSymptomManager)symptomManager;
- (OS_dispatch_queue)workQueue;
- (id)currentWiFiNetworkInfo;
- (id)currentWiFiNetworkRSSI;
- (id)discoveryController;
- (void)_createCurrentAccessorySetupMetricDispatcher:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5;
- (void)createCurrentAccessorySetupMetricDispatcherForSession:(id)a3;
- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4;
- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4 setupLogEventFactory:(id)a5;
- (void)fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler:(id)a3;
- (void)localeChanged;
- (void)relaunch;
- (void)relaunchAfterDelay:(double)a3;
- (void)relaunchHomed;
- (void)removeCurrentAccessorySetupMetricDispatcherIfNeeded;
- (void)setAccessoryBrowser:(id)a3;
- (void)setAppleMediaAccessoryDiagnosticInfoController:(id)a3;
- (void)setConfiguringStateController:(id)a3;
- (void)setCurrentAccessorySetupMetricDispatcher:(id)a3;
- (void)setDiscoveryController:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setMetricsManager:(id)a3;
- (void)setNetworkInfoController:(id)a3;
- (void)setRetailDemoModeRequestHandler:(id)a3;
- (void)setSymptomManager:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
@end

@implementation HMDMainDriver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoveryController, 0);
  objc_storeStrong((id *)&self->_networkInfoController, 0);
  objc_storeStrong((id *)&self->_symptomManager, 0);
  objc_storeStrong((id *)&self->_currentAccessorySetupMetricDispatcher, 0);
  objc_storeStrong((id *)&self->_configuringStateController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfoController, 0);
  objc_storeStrong((id *)&self->_metricsManager, 0);
  objc_storeStrong((id *)&self->_retailDemoModeRequestHandler, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setDiscoveryController:(id)a3
{
}

- (id)discoveryController
{
  return self->_discoveryController;
}

- (void)setNetworkInfoController:(id)a3
{
}

- (HMDNetworkInfoController)networkInfoController
{
  return self->_networkInfoController;
}

- (void)setSymptomManager:(id)a3
{
}

- (HMDSymptomManager)symptomManager
{
  return self->_symptomManager;
}

- (void)setCurrentAccessorySetupMetricDispatcher:(id)a3
{
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  return self->_currentAccessorySetupMetricDispatcher;
}

- (void)setConfiguringStateController:(id)a3
{
}

- (HMDDeviceSetupConfiguringController)configuringStateController
{
  return self->_configuringStateController;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setAppleMediaAccessoryDiagnosticInfoController:(id)a3
{
}

- (HMDAppleMediaAccessoryDiagnosticInfoController)appleMediaAccessoryDiagnosticInfoController
{
  return self->_appleMediaAccessoryDiagnosticInfoController;
}

- (void)setMetricsManager:(id)a3
{
}

- (HMDMetricsManager)metricsManager
{
  return self->_metricsManager;
}

- (void)setRetailDemoModeRequestHandler:(id)a3
{
}

- (HMDRetailDemoModeRequestHandler)retailDemoModeRequestHandler
{
  return self->_retailDemoModeRequestHandler;
}

- (void)setAccessoryBrowser:(id)a3
{
}

- (HMDAccessoryBrowser)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (void)fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMainDriver *)self homeManager];
  v6 = [(HMDMainDriver *)self currentWiFiNetworkInfo];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6A14778;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 findAccessoriesNotOnWiFiWithCurrentWiFi:v6 completionHandler:v8];
}

void __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@wifi mismatch accessories %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)currentWiFiNetworkRSSI
{
  v2 = [MEMORY[0x1E4F65598] sharedManager];
  id v3 = [v2 currentNetworkRSSI];

  return v3;
}

- (id)currentWiFiNetworkInfo
{
  v2 = [MEMORY[0x1E4F65598] sharedManager];
  id v3 = [v2 MACAddress];
  id v4 = [v2 currentNetworkSSID];
  id v5 = [v2 currentNetworkAssociation];
  id v6 = objc_alloc(MEMORY[0x1E4F655A0]);
  id v7 = [v5 BSSID];
  int v8 = [v7 formattedString];
  id v9 = [v5 gatewayIPAddress];
  __int16 v10 = [v5 gatewayMACAddress];
  id v11 = [v10 formattedString];
  uint64_t v12 = (void *)[v6 initWithMACAddress:v3 SSID:v4 BSSID:v8 gatewayIPAddress:v9 gatewayMACAddress:v11];

  return v12;
}

- (void)removeCurrentAccessorySetupMetricDispatcherIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMainDriver *)self homeManager];
  id v4 = [v3 currentAccessorySetupMetricDispatcher];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from home manager", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [(HMDMainDriver *)v6 homeManager];
    [v9 setCurrentAccessorySetupMetricDispatcher:0];
  }
  __int16 v10 = [(HMDMainDriver *)self currentAccessorySetupMetricDispatcher];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from main driver", (uint8_t *)&v15, 0xCu);
    }
    [(HMDMainDriver *)v12 setCurrentAccessorySetupMetricDispatcher:0];
  }
}

- (void)relaunchAfterDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v5 = [(HMDMainDriver *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMDMainDriver_relaunchAfterDelay___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

uint64_t __36__HMDMainDriver_relaunchAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relaunchHomed];
}

- (void)relaunch
{
  id v3 = [(HMDMainDriver *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__HMDMainDriver_relaunch__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __25__HMDMainDriver_relaunch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relaunchHomed];
}

- (void)relaunchHomed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMainDriver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_time_t v4 = +[HMDLaunchHandler sharedHandler];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  [v4 registerRelaunchClientWithUUID:v5];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Exiting...", (uint8_t *)&v10, 0xCu);
  }
  _Exit(0);
}

- (void)start
{
  v384[1] = *MEMORY[0x1E4F143B8];
  v338 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"HMDMainDriver.start" parent:0 options:1];
  if (isFirstLaunchAfterBoot_onceToken != -1) {
    dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_813);
  }
  v333 = [[HMDLaunchEvent alloc] initWithFirstLaunchAfterBoot:isFirstLaunchAfterBoot_firstLaunchAfterBoot];
  id v3 = (void *)MEMORY[0x1D9452090]();
  dispatch_time_t v4 = self;
  HMFGetOSLogHandle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@homed launched with ROAR Disabled", buf, 0xCu);
  }
  id v7 = (void *)MEMORY[0x1D9452090]();
  int v8 = v4;
  HMFGetOSLogHandle();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v357 = @"Starting homed";
    *(_WORD *)v358 = 2114;
    *(void *)&v358[2] = @"state";
    __int16 v359 = 2112;
    v360 = @"start";
    __int16 v361 = 2114;
    v362 = @"isHH2";
    __int16 v363 = 2112;
    id v364 = v11;
    __int16 v365 = 2114;
    v366 = @"isFirstLaunchAfterBoot";
    __int16 v367 = 2112;
    id v368 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
  }
  v13 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v14 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  int v15 = HMFBooleanToString();
  v16 = HMFBooleanToString();
  uint64_t v17 = HMDTaggedLoggingCreateDictionary();
  v18 = objc_msgSend(v14, "initWithTag:data:", @"mainDriverStart", v17, @"state", @"start", @"isHH2", v15, @"isFirstLaunchAfterBoot", v16);
  v19 = [v338 tagProcessorList];
  [v13 submitTaggedEvent:v18 processorList:v19];

  v20 = v8[1];
  if (os_signpost_enabled(v20))
  {
    HMFBooleanToString();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v21;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MainDriverStart", "isRoarEnabled=%{signpost.description:attribute}@ ", buf, 0xCu);
  }
  signal(15, 0);
  uint64_t v22 = isInternalBuild();
  if (v22) {
    uint64_t v22 = +[HMDMemoryDiagnostic configureMemoryDiagnostic];
  }
  v23 = (void *)MEMORY[0x1D9452090](v22);
  uint64_t v24 = HMFUptime();
  double v26 = v25;
  v27 = (void *)MEMORY[0x1D9452090](v24);
  v28 = v8;
  HMFGetOSLogHandle();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v357 = @"Config cleanup start";
    *(_WORD *)v358 = 2114;
    *(void *)&v358[2] = @"state";
    __int16 v359 = 2112;
    v360 = @"mainDriverConfigCleanup";
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v31 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v32 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  v383 = @"state";
  v384[0] = @"mainDriverConfigCleanup";
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v384 forKeys:&v383 count:1];
  v34 = (void *)[v32 initWithTag:@"mainDriverStart" data:v33];
  v35 = [v338 tagProcessorList];
  [v31 submitTaggedEvent:v34 processorList:v35];

  v36 = (void *)MEMORY[0x1D9452090](+[HMDResetConfigPostCleanup performAnyPostCleanupStepsIfNecessary]);
  v37 = v28;
  HMFGetOSLogHandle();
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    v40 = NSString;
    HMFUptime();
    objc_msgSend(v40, "stringWithFormat:", @"%.3f", v41 - v26);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(void *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v357 = @"Config cleanup done";
    *(_WORD *)v358 = 2114;
    *(void *)&v358[2] = @"state";
    __int16 v359 = 2112;
    v360 = @"mainDriverConfigCleanupDone";
    __int16 v361 = 2114;
    v362 = @"duration";
    __int16 v363 = 2112;
    id v364 = v42;
    _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  v43 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v44 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  v45 = NSString;
  HMFUptime();
  v47 = objc_msgSend(v45, "stringWithFormat:", @"%.3f", v46 - v26);
  v48 = HMDTaggedLoggingCreateDictionary();
  v49 = objc_msgSend(v44, "initWithTag:data:", @"mainDriverStart", v48, @"state", @"mainDriverConfigCleanupDone", @"duration", v47);
  v50 = [v338 tagProcessorList];
  [v43 submitTaggedEvent:v49 processorList:v50];

  uint64_t v51 = HMFUptime();
  double v53 = v52;
  v54 = (void *)MEMORY[0x1D9452090](v51);
  v55 = v37;
  HMFGetOSLogHandle();
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v357 = @"Initialize paths and utilities";
    *(_WORD *)v358 = 2114;
    *(void *)&v358[2] = @"state";
    __int16 v359 = 2112;
    v360 = @"mainDriverSetupPaths";
    _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v58 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v59 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  v381 = @"state";
  v382 = @"mainDriverSetupPaths";
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
  v61 = (void *)[v59 initWithTag:@"mainDriverStart" data:v60];
  v62 = [v338 tagProcessorList];
  [v58 submitTaggedEvent:v61 processorList:v62];

  v63 = MEMORY[0x1E4F14428];
  id v64 = MEMORY[0x1E4F14428];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v63, &__block_literal_global_140);

  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x1E4F14428], &__block_literal_global_143);
  xpc_set_event_stream_handler("com.apple.passd.matching", MEMORY[0x1E4F14428], &__block_literal_global_149);

  v65 = +[HMDBackgroundTaskManager sharedManager];
  [v65 configure];

  if (MKBDeviceUnlockedSinceBoot())
  {
    [MEMORY[0x1E4F65510] setClassMappingForNSCoder];
    if (+[HMDDeviceCapabilities supportsLocalization])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__languageChanged, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (initializePaths_onceToken != -1) {
      dispatch_once(&initializePaths_onceToken, &__block_literal_global_50516);
    }
    +[HMDDatabase registerQueries];
    v67 = (void *)MEMORY[0x1D9452090](+[HMDHomeData configureKeyedArchiverClassMappings]);
    v68 = v55;
    HMFGetOSLogHandle();
    v69 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      v71 = NSString;
      HMFUptime();
      objc_msgSend(v71, "stringWithFormat:", @"%.3f", v72 - v53);
      id v73 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Initialized paths and utilities";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverSetupPathsDone";
      __int16 v361 = 2114;
      v362 = @"duration";
      __int16 v363 = 2112;
      id v364 = v73;
      _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v74 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v75 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v76 = NSString;
    HMFUptime();
    v78 = objc_msgSend(v76, "stringWithFormat:", @"%.3f", v77 - v53);
    v79 = HMDTaggedLoggingCreateDictionary();
    v80 = objc_msgSend(v75, "initWithTag:data:", @"mainDriverStart", v79, @"state", @"mainDriverSetupPathsDone", @"duration", v78);
    v81 = [v338 tagProcessorList];
    [v74 submitTaggedEvent:v80 processorList:v81];

    uint64_t v82 = HMFUptime();
    double v84 = v83;
    v85 = (void *)MEMORY[0x1D9452090](v82);
    v86 = v68;
    HMFGetOSLogHandle();
    v87 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Init capabilities";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverSetupCapabilities";
      _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v89 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v90 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v377 = @"state";
    v378 = @"mainDriverSetupCapabilities";
    v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
    v92 = (void *)[v90 initWithTag:@"mainDriverStart" data:v91];
    v93 = [v338 tagProcessorList];
    [v89 submitTaggedEvent:v92 processorList:v93];

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __initializeCapabilitiesAndTimeouts_block_invoke;
    v357 = (__CFString *)&unk_1E6A186E0;
    *(void *)v358 = 0;
    if (initializeCapabilitiesAndTimeouts_onceToken != -1) {
      dispatch_once(&initializeCapabilitiesAndTimeouts_onceToken, buf);
    }

    initializeMappingsAndPaths();
    id v94 = (id)HMCreateHomeKitCacheDirectory();
    v95 = (void *)MEMORY[0x1D9452090](v94);
    v96 = v86;
    HMFGetOSLogHandle();
    v97 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v98 = (id)objc_claimAutoreleasedReturnValue();
      v99 = NSString;
      HMFUptime();
      objc_msgSend(v99, "stringWithFormat:", @"%.3f", v100 - v84);
      id v101 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = v98;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Init capabilities done";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverSetupCapabilitiesDone";
      __int16 v361 = 2114;
      v362 = @"duration";
      __int16 v363 = 2112;
      id v364 = v101;
      _os_log_impl(&dword_1D49D5000, v97, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v102 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v103 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v104 = NSString;
    HMFUptime();
    v106 = objc_msgSend(v104, "stringWithFormat:", @"%.3f", v105 - v84);
    v107 = HMDTaggedLoggingCreateDictionary();
    v108 = objc_msgSend(v103, "initWithTag:data:", @"mainDriverStart", v107, @"state", @"mainDriverSetupCapabilitiesDone", @"duration", v106);
    v109 = [v338 tagProcessorList];
    [v102 submitTaggedEvent:v108 processorList:v109];

    v110 = (void *)MEMORY[0x1D9452090]();
    v111 = v96;
    HMFGetOSLogHandle();
    v112 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v113 = (id)objc_claimAutoreleasedReturnValue();
      id v114 = [MEMORY[0x1E4F65530] sharedPreferences];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v113;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v114;
      _os_log_impl(&dword_1D49D5000, v112, OS_LOG_TYPE_DEBUG, "%{public}@Preferences: %@", buf, 0x16u);
    }
    uint64_t v115 = HMFUptime();
    double v117 = v116;
    v118 = (void *)MEMORY[0x1D9452090](v115);
    v119 = v111;
    HMFGetOSLogHandle();
    v120 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v121 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v121;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Init accounts and transports";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverSetupAccountManagers";
      _os_log_impl(&dword_1D49D5000, v120, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v122 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v123 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v375 = @"state";
    v376 = @"mainDriverSetupAccountManagers";
    v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v376 forKeys:&v375 count:1];
    v125 = (void *)[v123 initWithTag:@"mainDriverStart" data:v124];
    v126 = [v338 tagProcessorList];
    [v122 submitTaggedEvent:v125 processorList:v126];

    v325 = +[HMDIDSServiceManager sharedManager];
    v328 = +[HMDAppleAccountManager sharedManager];
    id v127 = +[HMDRemoteAccountManager sharedManager];
    v330 = +[HMDAccountRegistry sharedRegistry];
    [v338 markWithReason:@"Creating Message Transports"];
    v322 = +[HMDXPCMessageTransport defaultTransport];
    v321 = +[HMDSecureRemoteMessageTransport defaultTransport];
    v336 = +[HMDMessageDispatcher defaultDispatcher];
    v327 = +[HMDBulletinBoard sharedBulletinBoard];
    [v338 markWithReason:@"Initialize Metrics Manager"];
    v128 = [HMDMetricsManager alloc];
    v129 = [v327 notificationCenterSettingsProvider];
    v130 = [(HMDMetricsManager *)v128 initWithMessageDispatcher:v336 accountManager:v328 notificationSettingsProvider:v129];
    [v119 setMetricsManager:v130];

    v131 = [v119 metricsManager];
    [v131 startMetricsCollection];

    v132 = [v119 metricsManager];
    v133 = [v132 logEventSubmitter];
    [v133 submitLogEvent:v333];

    v134 = [HMDHelper alloc];
    v135 = objc_alloc_init(HMDHelperExternalProtocolImpl);
    v326 = [(HMDHelper *)v134 initWithExternalProtocol:v135];

    v136 = (void *)MEMORY[0x1D9452090](+[HMDHelper setSharedHelper:v326]);
    v137 = v119;
    HMFGetOSLogHandle();
    v138 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v139 = (id)objc_claimAutoreleasedReturnValue();
      v140 = NSString;
      HMFUptime();
      objc_msgSend(v140, "stringWithFormat:", @"%.3f", v141 - v117);
      id v142 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = v139;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Init accounts and transports done";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverSetupAccountManagersDone";
      __int16 v361 = 2114;
      v362 = @"duration";
      __int16 v363 = 2112;
      id v364 = v142;
      _os_log_impl(&dword_1D49D5000, v138, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v143 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v144 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v145 = NSString;
    HMFUptime();
    v147 = objc_msgSend(v145, "stringWithFormat:", @"%.3f", v146 - v117);
    v148 = HMDTaggedLoggingCreateDictionary();
    v149 = objc_msgSend(v144, "initWithTag:data:", @"mainDriverStart", v148, @"state", @"mainDriverSetupAccountManagersDone", @"duration", v147);
    v150 = [v338 tagProcessorList];
    [v143 submitTaggedEvent:v149 processorList:v150];

    [v338 markWithReason:@"Initiating Backing Store"];
    +[HMDBackingStore start];
    v151 = (void *)MEMORY[0x1D9452090]([v338 markWithReason:@"Initiating Clips Quota Manager"]);
    v152 = +[HMDCameraClipsQuotaManager defaultManager];
    [v152 synchronize];

    if (enableNetworkLogging)
    {
      v153 = (void *)MEMORY[0x1D9452090]();
      id v154 = v137;
      HMFGetOSLogHandle();
      v155 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v156 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v156;
        _os_log_impl(&dword_1D49D5000, v155, OS_LOG_TYPE_INFO, "%{public}@Enabling CFNetwork diagnostics", buf, 0xCu);
      }
      setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    }
    [v338 markWithReason:@"Loading Persistent Store"];
    uint64_t v157 = objc_opt_class();
    v158 = (objc_class *)objc_opt_class();
    v159 = NSStringFromClass(v158);
    +[HMDBackingStoreSingleton setClass:v157 forClassName:v159];

    v379[0] = 0;
    uint64_t v160 = HMFUptime();
    double v162 = v161;
    v163 = (void *)MEMORY[0x1D9452090](v160);
    id v164 = v137;
    HMFGetOSLogHandle();
    v165 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v166 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v166;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Load Persistent Store";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverLoadPersistentStore";
      _os_log_impl(&dword_1D49D5000, v165, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v167 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v168 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v373 = @"state";
    v374 = @"mainDriverLoadPersistentStore";
    v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v374 forKeys:&v373 count:1];
    v170 = (void *)[v168 initWithTag:@"mainDriverStart" data:v169];
    v171 = [v338 tagProcessorList];
    [v167 submitTaggedEvent:v170 processorList:v171];

    context = (void *)MEMORY[0x1D9452090]();
    +[HMDPersistentStore removeTransactionJournal];
    +[HMDHAPMetadata prepareMetadata];
    int v331 = enableRetailDemoSetup;
    if (enableRetailDemoSetup && ([0 demoFinalized] & 1) == 0)
    {
      uint64_t v349 = 0;
      id v178 = (id)[(id)objc_opt_class() loadHomeDataFromDemoModeStore:&v349];
      v172 = 0;
      v173 = (id *)&v349;
    }
    else
    {
      uint64_t v348 = 0;
      v172 = [(id)objc_opt_class() loadHomeDataFromLocalStore:&v348 decryptionFailed:v379];
      v173 = (id *)&v348;
    }
    id v337 = *v173;
    v179 = (void *)MEMORY[0x1D9452090]();
    id v180 = v164;
    HMFGetOSLogHandle();
    v181 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v182 = (id)objc_claimAutoreleasedReturnValue();
      v183 = NSString;
      HMFUptime();
      objc_msgSend(v183, "stringWithFormat:", @"%.3f", v184 - v162);
      id v185 = (id)objc_claimAutoreleasedReturnValue();
      v186 = [v172 domain];
      v187 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v172, "code"));
      *(_DWORD *)buf = 138545922;
      *(void *)&buf[4] = v182;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Loaded Persistent Store";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverLoadedPersistentStore";
      __int16 v361 = 2114;
      v362 = @"duration";
      __int16 v363 = 2112;
      id v364 = v185;
      __int16 v365 = 2114;
      v366 = @"errorDomain";
      __int16 v367 = 2112;
      id v368 = v186;
      __int16 v369 = 2114;
      v370 = @"errorCode";
      __int16 v371 = 2112;
      v372 = v187;
      _os_log_impl(&dword_1D49D5000, v181, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);
    }
    v188 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v189 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v190 = NSString;
    HMFUptime();
    v192 = objc_msgSend(v190, "stringWithFormat:", @"%.3f", v191 - v162);
    v193 = [v172 domain];
    v194 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v172, "code"));
    v195 = HMDTaggedLoggingCreateDictionary();
    v196 = objc_msgSend(v189, "initWithTag:data:", @"mainDriverStart", v195, @"state", @"mainDriverLoadedPersistentStore", @"duration", v192, @"errorDomain", v193, @"errorCode", v194);
    v197 = [v338 tagProcessorList];
    [v188 submitTaggedEvent:v196 processorList:v197];

    if (v172)
    {
      v198 = (void *)MEMORY[0x1D9452090]();
      id v199 = v180;
      HMFGetOSLogHandle();
      v200 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v201 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v201;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v172;
        _os_log_impl(&dword_1D49D5000, v200, OS_LOG_TYPE_ERROR, "%{public}@Unable to load home data configuration: %@", buf, 0x16u);
      }
    }
    else if (!(v331 | v379[0]) && v337)
    {
      v202 = [MEMORY[0x1E4F5BE48] systemStore];
      [v202 ensureControllerKeyExistsForAllViews];
    }
    v203 = objc_alloc_init(HMDDeviceSetupConfiguringController);
    [v180 setConfiguringStateController:v203];

    v204 = [v180 configuringStateController];
    [v204 setupRPClient];

    v205 = objc_alloc_init(HMDNetworkInfoController);
    [v180 setNetworkInfoController:v205];

    v206 = [v180 networkInfoController];
    [v206 start];

    v332 = [[HMDDiscoveryController alloc] initWithDiscoveryNeedsAssertion:1];
    [v180 setDiscoveryController:v332];
    [(HMDDiscoveryController *)v332 start];
    v207 = [[HMDSymptomManager alloc] initWithDataSource:v180];
    [v180 setSymptomManager:v207];

    [v338 markWithReason:@"Loading Accounts"];
    v208 = [v337 account];
    if (v208)
    {
      v209 = [v337 account];
      int v210 = [v209 isCurrentAccount];

      if (v210)
      {
        v211 = [v337 account];
        [v328 setAccount:v211];
      }
    }
    v323 = +[HMDRemoteAccountManager sharedManager];
    v212 = [v337 remoteAccounts];
    uint64_t v213 = [v212 count];

    if (v213)
    {
      v214 = [v337 remoteAccounts];
      [v323 setAccounts:v214];
    }
    v215 = [v180 metricsManager];
    v216 = [v215 logEventSubmitter];
    v217 = objc_alloc_init(HMDDeviceAccountResolvedLogEvent);
    [v216 submitLogEvent:v217 error:0];

    v218 = [v337 pendingUserManagementOperations];

    if (v218)
    {
      [v338 markWithReason:@"Loading User Management Operations"];
      v219 = [HMDUserManagementOperationManager alloc];
      v220 = [v337 pendingUserManagementOperations];
      v221 = [(HMDUserManagementOperationManager *)v219 initWithOperations:v220];

      +[HMDUserManagementOperationManager setSharedManager:v221];
    }
    [v338 markWithReason:@"Creating Accessory Browser"];
    v222 = [[HMDAccessoryBrowser alloc] initWithMessageDispatcher:v336];
    [v180 setAccessoryBrowser:v222];

    v223 = [v180 metricsManager];
    v224 = [MEMORY[0x1E4F5BD90] sharedInstance];
    [v223 configureHAPMetricsDispatcher:v224];

    if (enableRetailDemoSetup || [v337 demoFinalized])
    {
      [v338 markWithReason:@"Loading Demo Mode"];
      v225 = [v180 accessoryBrowser];
      v226 = [v337 demoAccessories];
      objc_msgSend(v225, "configureDemoBrowserWithDemoAccessories:finalized:", v226, objc_msgSend(v337, "demoFinalized"));
    }
    v329 = [MEMORY[0x1E4F1C978] array];
    v227 = +[HMDBackingStoreSingleton sharedInstance];
    contexta = [v227 local];

    if (contexta)
    {
      v228 = (void *)MEMORY[0x1D9452090]();
      id v229 = v180;
      HMFGetOSLogHandle();
      v230 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v231 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v231;
        _os_log_impl(&dword_1D49D5000, v230, OS_LOG_TYPE_DEFAULT, "%{public}@Checking backing store for uncommitted transactions...", buf, 0xCu);
      }
      uint64_t v232 = [contexta _numUncommittedTransactions];
      if (v232 >= 1)
      {
        v233 = (void *)MEMORY[0x1D9452090]();
        id v234 = v229;
        HMFGetOSLogHandle();
        v235 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v236 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v236;
          _os_log_impl(&dword_1D49D5000, v235, OS_LOG_TYPE_ERROR, "%{public}@Dropped transactions that were not pushed and not committed to disk.", buf, 0xCu);
        }
        id v237 = (id)[contexta _dropUncommittedUnpushedTransactions];
        uint64_t v238 = [contexta _numUncommittedTransactions];
        if (v238 >= 1)
        {
          v239 = [MEMORY[0x1E4F65530] sharedPreferences];
          v240 = [v239 preferenceForKey:@"shouldRunUncommittedTransactions"];
          int v241 = [v240 BOOLValue];

          if (v241)
          {
            v242 = [contexta _fetchUncommittedAndPushedTransactions];

            v243 = (void *)MEMORY[0x1D9452090]();
            id v244 = v234;
            HMFGetOSLogHandle();
            v245 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v246 = (id)objc_claimAutoreleasedReturnValue();
              char v247 = isInternalBuild();
              v248 = v242;
              if ((v247 & 1) == 0)
              {
                v248 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v242, "count"));
              }
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v246;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v248;
              _os_log_impl(&dword_1D49D5000, v245, OS_LOG_TYPE_ERROR, "%{public}@Have uncommitted transactions that were pushed %@.", buf, 0x16u);
              if ((v247 & 1) == 0) {
            }
              }
          }
          else
          {
            v243 = (void *)MEMORY[0x1D9452090]();
            id v249 = v234;
            HMFGetOSLogHandle();
            v245 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v250 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v250;
              _os_log_impl(&dword_1D49D5000, v245, OS_LOG_TYPE_ERROR, "%{public}@Ignoring uncommitted transactions, in data loss state", buf, 0xCu);
            }
            v242 = v329;
          }

          v329 = v242;
        }
        goto LABEL_88;
      }
    }
    else
    {
      uint64_t v232 = 0;
    }
    uint64_t v238 = 0;
LABEL_88:
    v324 = [[HMDTransactionArchiveReplayLogEvent alloc] initWithNumUncommittedRecords:v232 numUncommittedAndPushedRecords:v238];
    v251 = [v180 metricsManager];
    v252 = [v251 logEventSubmitter];
    [v252 submitLogEvent:v324];

    uint64_t v253 = HMFUptime();
    double v255 = v254;
    v256 = (void *)MEMORY[0x1D9452090](v253);
    id v257 = v180;
    HMFGetOSLogHandle();
    v258 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v258, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v259 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v259;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Initializing Home Manager";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverInitHomeManager";
      _os_log_impl(&dword_1D49D5000, v258, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v260 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v261 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v354 = @"state";
    v355 = @"mainDriverInitHomeManager";
    v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v355 forKeys:&v354 count:1];
    v263 = (void *)[v261 initWithTag:@"mainDriverStart" data:v262];
    v264 = [v338 tagProcessorList];
    [v260 submitTaggedEvent:v263 processorList:v264];

    v265 = [HMDHomeManager alloc];
    v266 = [v257 accessoryBrowser];
    v267 = [v336 messageFilterChain];
    BOOL v268 = v379[0] != 0;
    v269 = +[HMDIdentityRegistry sharedRegistry];
    v270 = [v257 metricsManager];
    v271 = [v257 configuringStateController];
    v272 = [v257 appleMediaAccessoryDiagnosticInfoController];
    v273 = [v257 currentAccessorySetupMetricDispatcher];
    v274 = [(HMDHomeManager *)v265 initWithMessageDispatcher:v336 accessoryBrowser:v266 messageFilterChain:v267 homeData:v337 localDataDecryptionFailed:v268 identityRegistry:v269 accountRegistry:v330 metricsManager:v270 configuringStateController:v271 diagnosticInfoController:v272 currentAccessorySetupMetricDispatcher:v273 uncommittedTransactions:v329];
    [v257 setHomeManager:v274];

    v275 = (void *)MEMORY[0x1D9452090]();
    id v276 = v257;
    HMFGetOSLogHandle();
    v277 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v278 = (id)objc_claimAutoreleasedReturnValue();
      v279 = NSString;
      HMFUptime();
      objc_msgSend(v279, "stringWithFormat:", @"%.3f", v280 - v255);
      id v281 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = v278;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Initialized Home Manager";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverInitializedHomeManager";
      __int16 v361 = 2114;
      v362 = @"duration";
      __int16 v363 = 2112;
      id v364 = v281;
      _os_log_impl(&dword_1D49D5000, v277, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v282 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v283 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v284 = NSString;
    HMFUptime();
    v286 = objc_msgSend(v284, "stringWithFormat:", @"%.3f", v285 - v255);
    v287 = HMDTaggedLoggingCreateDictionary();
    v288 = objc_msgSend(v283, "initWithTag:data:", @"mainDriverStart", v287, @"state", @"mainDriverInitializedHomeManager", @"duration", v286);
    v289 = [v338 tagProcessorList];
    [v282 submitTaggedEvent:v288 processorList:v289];

    [v338 markWithReason:@"Starting Account registry and managers"];
    [v330 start];
    [v338 markWithReason:@"Initialize Presence Monitor"];
    v290 = [HMDIDSActivityMonitorHomeManagerDataSource alloc];
    v291 = [v276 homeManager];
    v292 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v290 initWithHomeManager:v291];

    [v325 setActivityMonitorDataSource:v292];
    int v293 = isInternalBuild();
    if (enableRetailDemoSetup) {
      int v294 = v293;
    }
    else {
      int v294 = 0;
    }
    if (v294 == 1)
    {
      v295 = (void *)MEMORY[0x1D9452090]([v338 markWithReason:@"Creating Retail Demo Mode Request Handler"]);
      id v296 = v276;
      HMFGetOSLogHandle();
      v297 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v297, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v298 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v298;
        _os_log_impl(&dword_1D49D5000, v297, OS_LOG_TYPE_INFO, "%{public}@Creating Retail Demo Mode Request Handler", buf, 0xCu);
      }
      v299 = [HMDRetailDemoModeRequestHandler alloc];
      v300 = [v296 homeManager];
      v301 = [(HMDRetailDemoModeRequestHandler *)v299 initWithHomeManager:v300 messageDispatcher:v336 relaunchHandler:v296];
      [v296 setRetailDemoModeRequestHandler:v301];

      v302 = [v296 retailDemoModeRequestHandler];
      [v302 configure];
    }
    uint64_t v303 = HMFUptime();
    uint64_t v305 = v304;
    v306 = (void *)MEMORY[0x1D9452090](v303);
    id v307 = v276;
    HMFGetOSLogHandle();
    v308 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v308, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v309 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v309;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v357 = @"Starting Home Manager";
      *(_WORD *)v358 = 2114;
      *(void *)&v358[2] = @"state";
      __int16 v359 = 2112;
      v360 = @"mainDriverStartHomeManager";
      _os_log_impl(&dword_1D49D5000, v308, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v310 = [MEMORY[0x1E4F6A2A0] sharedInstance];
    id v311 = objc_alloc(MEMORY[0x1E4F6A2B0]);
    v352 = @"state";
    v353 = @"mainDriverStartHomeManager";
    v312 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v353 forKeys:&v352 count:1];
    v313 = (void *)[v311 initWithTag:@"mainDriverStart" data:v312];
    v314 = [v338 tagProcessorList];
    [v310 submitTaggedEvent:v313 processorList:v314];

    v315 = [v307 homeManager];
    v339[0] = MEMORY[0x1E4F143A8];
    v339[1] = 3221225472;
    v339[2] = __22__HMDMainDriver_start__block_invoke_264;
    v339[3] = &unk_1E6A07618;
    id v340 = v338;
    id v341 = v307;
    uint64_t v347 = v305;
    id v316 = v336;
    id v342 = v316;
    id v317 = v321;
    id v343 = v317;
    id v318 = v327;
    id v344 = v318;
    id v319 = v322;
    id v345 = v319;
    v320 = v292;
    v346 = v320;
    [v315 startWithCompletionHandler:v339];

    goto LABEL_102;
  }
  int out_token = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v357) = 0;
  v174 = (void *)MEMORY[0x1D9452090]();
  v175 = v55;
  HMFGetOSLogHandle();
  v176 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
  {
    v177 = HMFGetLogIdentifier();
    *(_DWORD *)v379 = 138543362;
    v380 = v177;
    _os_log_impl(&dword_1D49D5000, v176, OS_LOG_TYPE_INFO, "%{public}@Can't load data until unlocked -- stopping", v379, 0xCu);
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __22__HMDMainDriver_start__block_invoke_152;
  handler[3] = &unk_1E6A078D0;
  handler[4] = v175;
  handler[5] = buf;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, MEMORY[0x1E4F14428], handler);

  _Block_object_dispose(buf, 8);
LABEL_102:
}

uint64_t __22__HMDMainDriver_start__block_invoke_152(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = 138543362;
        id v11 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time", (uint8_t *)&v10, 0xCu);
      }
      [*(id *)(a1 + 32) start];
      return notify_cancel(a2);
    }
  }
  return result;
}

void __22__HMDMainDriver_start__block_invoke_264(uint64_t a1)
{
  [*(id *)(a1 + 32) markWithReason:@"Started Home Manager"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__HMDMainDriver_start__block_invoke_2_268;
  block[3] = &unk_1E6A07618;
  uint64_t v11 = *(void *)(a1 + 88);
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __22__HMDMainDriver_start__block_invoke_2_268(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  dispatch_time_t v4 = HMFGetOSLogHandle();
  unint64_t v5 = 0x1E4F29000;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = NSString;
    HMFUptime();
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%.3f", v8 - *(double *)(a1 + 88));
    *(_DWORD *)buf = 138544898;
    v87 = v6;
    __int16 v88 = 2114;
    v89 = @"mainDriverStart";
    __int16 v90 = 2112;
    v91 = @"Home manager started. Configuring ...";
    __int16 v92 = 2114;
    v93 = @"state";
    __int16 v94 = 2112;
    v95 = @"mainDriverStartedHomeManager";
    __int16 v96 = 2114;
    v97 = @"duration";
    __int16 v98 = 2112;
    v99 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);

    unint64_t v5 = 0x1E4F29000uLL;
  }

  id v10 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v11 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  uint64_t v12 = *(void **)(v5 + 24);
  HMFUptime();
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"%.3f", v13 - *(double *)(a1 + 88));
  int v15 = HMDTaggedLoggingCreateDictionary();
  v16 = objc_msgSend(v11, "initWithTag:data:", @"mainDriverStart", v15, @"state", @"mainDriverStartedHomeManager", @"duration", v14);
  uint64_t v17 = [*(id *)(a1 + 40) tagProcessorList];
  [v10 submitTaggedEvent:v16 processorList:v17];

  v18 = *(void **)(a1 + 48);
  v19 = [*(id *)(a1 + 32) homeManager];
  [v18 configureHomeManager:v19];

  v20 = *(void **)(a1 + 56);
  id v21 = [*(id *)(a1 + 32) homeManager];
  uint64_t v22 = [v21 cloudDataSyncStateFilter];
  v23 = [*(id *)(a1 + 32) homeManager];
  [v20 configureWithCloudDataSyncStateFilter:v22 homeMembershipVerifier:v23];

  uint64_t v24 = [*(id *)(a1 + 32) accessoryBrowser];
  double v25 = [*(id *)(a1 + 32) homeManager];
  [v24 configureWithHomeManager:v25];

  double v26 = *(void **)(a1 + 64);
  v27 = [*(id *)(a1 + 32) homeManager];
  [v26 configureWithHomeManager:v27];

  [*(id *)(a1 + 64) refreshHomeBadgeNumber];
  uint64_t v28 = HMFUptime();
  double v30 = v29;
  v31 = (void *)MEMORY[0x1D9452090](v28);
  id v32 = *(id *)(a1 + 32);
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v87 = v34;
    __int16 v88 = 2114;
    v89 = @"mainDriverStart";
    __int16 v90 = 2112;
    v91 = @"Starting XPC message transport";
    __int16 v92 = 2114;
    v93 = @"state";
    __int16 v94 = 2112;
    v95 = @"mainDriverStartXPCTransport";
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v35 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v36 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  double v84 = @"state";
  v85 = @"mainDriverStartXPCTransport";
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  v38 = (void *)[v36 initWithTag:@"mainDriverStart" data:v37];
  id v39 = [*(id *)(a1 + 40) tagProcessorList];
  [v35 submitTaggedEvent:v38 processorList:v39];

  [*(id *)(a1 + 72) start];
  v40 = +[HMDXPCMessageTransport accessorySetupTransport];
  [v40 start];

  double v41 = (void *)MEMORY[0x1D9452090]();
  id v42 = *(id *)(a1 + 32);
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    id v44 = HMFGetLogIdentifier();
    v45 = NSString;
    HMFUptime();
    v47 = objc_msgSend(v45, "stringWithFormat:", @"%.3f", v46 - v30);
    *(_DWORD *)buf = 138544898;
    v87 = v44;
    __int16 v88 = 2114;
    v89 = @"mainDriverStart";
    __int16 v90 = 2112;
    v91 = @"Started XPC message transport";
    __int16 v92 = 2114;
    v93 = @"state";
    __int16 v94 = 2112;
    v95 = @"mainDriverStartXPCTransportDone";
    __int16 v96 = 2114;
    v97 = @"duration";
    __int16 v98 = 2112;
    v99 = v47;
    _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  v48 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v49 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  v50 = NSString;
  HMFUptime();
  double v52 = objc_msgSend(v50, "stringWithFormat:", @"%.3f", v51 - v30);
  double v53 = HMDTaggedLoggingCreateDictionary();
  v54 = objc_msgSend(v49, "initWithTag:data:", @"mainDriverStart", v53, @"state", @"mainDriverStartXPCTransportDone", @"duration", v52);
  v55 = [*(id *)(a1 + 40) tagProcessorList];
  [v48 submitTaggedEvent:v54 processorList:v55];

  v56 = [*(id *)(a1 + 32) metricsManager];
  id v57 = [v56 logEventSubmitter];
  v58 = objc_alloc_init(HMDXPCTransportStartedLogEvent);
  [v57 submitLogEvent:v58];

  id v59 = [MEMORY[0x1E4F65478] memoryMonitor];
  [v59 start];

  [*(id *)(a1 + 80) start];
  v60 = +[HMDIdentityRegistry sharedRegistry];
  v61 = [*(id *)(a1 + 32) homeManager];
  [v60 configureWithHomeManager:v61];

  uint64_t v62 = HMFUptime();
  uint64_t v64 = v63;
  v65 = (void *)MEMORY[0x1D9452090](v62);
  id v66 = *(id *)(a1 + 32);
  v67 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    v68 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v87 = v68;
    __int16 v88 = 2114;
    v89 = @"mainDriverStart";
    __int16 v90 = 2112;
    v91 = @"Starting remote message transports";
    __int16 v92 = 2114;
    v93 = @"state";
    __int16 v94 = 2112;
    v95 = @"mainDriverStartRemoteTransports";
    _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v69 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v70 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  uint64_t v82 = @"state";
  double v83 = @"mainDriverStartRemoteTransports";
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
  double v72 = (void *)[v70 initWithTag:@"mainDriverStart" data:v71];
  id v73 = [*(id *)(a1 + 40) tagProcessorList];
  [v69 submitTaggedEvent:v72 processorList:v73];

  v74 = [*(id *)(a1 + 56) start];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __22__HMDMainDriver_start__block_invoke_283;
  v79[3] = &unk_1E6A06258;
  id v75 = *(void **)(a1 + 40);
  v79[4] = *(void *)(a1 + 32);
  uint64_t v81 = v64;
  id v80 = v75;
  v76 = [v74 then:v79];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __22__HMDMainDriver_start__block_invoke_288;
  v78[3] = &unk_1E6A06280;
  v78[4] = *(void *)(a1 + 32);
  id v77 = (id)[v76 finally:v78];
}

uint64_t __22__HMDMainDriver_start__block_invoke_283(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = NSString;
    HMFUptime();
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%.3f", v8 - *(double *)(a1 + 48));
    *(_DWORD *)buf = 138544898;
    id v21 = v6;
    __int16 v22 = 2114;
    v23 = @"mainDriverStarted";
    __int16 v24 = 2112;
    double v25 = @"Started remote message transports. Started homed.";
    __int16 v26 = 2114;
    v27 = @"state";
    __int16 v28 = 2112;
    double v29 = @"end";
    __int16 v30 = 2114;
    v31 = @"duration";
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  id v10 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  id v11 = objc_alloc(MEMORY[0x1E4F6A2B0]);
  uint64_t v12 = NSString;
  HMFUptime();
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"%.3f", v13 - *(double *)(a1 + 48));
  int v15 = HMDTaggedLoggingCreateDictionary();
  v16 = objc_msgSend(v11, "initWithTag:data:", @"mainDriverStarted", v15, @"state", @"end", @"duration", v14);
  uint64_t v17 = [*(id *)(a1 + 40) tagProcessorList];
  [v10 submitTaggedEvent:v16 processorList:v17];

  [*(id *)(a1 + 40) invalidate];
  return 1;
}

uint64_t __22__HMDMainDriver_start__block_invoke_288(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 setHasFinishedStartingUp:1];

  id v3 = [*(id *)(a1 + 32) homeManager];
  logAndPostNotification(@"HMDHomeManagerHasFinishedStartingUpNotification", v3, 0);

  return 1;
}

uint64_t __22__HMDMainDriver_start__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    if (!strcmp(string, "com.apple.home.messaging"))
    {
      id v3 = +[HMDRapportMessaging sharedInstance];
      [v3 configureDiscoveryClientWithCompletion:0];
    }
    if (xpc_dictionary_get_BOOL(xdict, "replyRequired"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(xdict);
      if (reply) {
        xpc_dictionary_send_reply();
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)localeChanged
{
  id v3 = [(HMDMainDriver *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HMDMainDriver_localeChanged__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __30__HMDMainDriver_localeChanged__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - clearing followup items before restarting", buf, 0xCu);
  }
  id v6 = +[HMDDeviceSetupManager sharedManager];
  id v7 = [v6 followUpManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__HMDMainDriver_localeChanged__block_invoke_109;
  v8[3] = &unk_1E6A166E0;
  v8[4] = *(void *)(a1 + 32);
  [v7 removeAllFollowUpItemsWithCompletion:v8];
}

void __30__HMDMainDriver_localeChanged__block_invoke_109(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - restarting", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) relaunch];
}

- (HMDMainDriver)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMainDriver;
  id v2 = [(HMDMainDriver *)&v9 init];
  if (v2)
  {
    uint64_t v3 = HMFGetOSLogHandle();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    unint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.hmd.mdrv", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35 != -1) {
    dispatch_once(&logCategory__hmf_once_t35, &__block_literal_global_293);
  }
  id v2 = (void *)logCategory__hmf_once_v36;
  return v2;
}

uint64_t __28__HMDMainDriver_logCategory__block_invoke()
{
  logCategory__hmf_once_id v36 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)driver
{
  if (driver_onceToken != -1) {
    dispatch_once(&driver_onceToken, &__block_literal_global_6671);
  }
  id v2 = (void *)driver_singletonDriver;
  return v2;
}

uint64_t __23__HMDMainDriver_driver__block_invoke()
{
  driver_singletonDriver = objc_alloc_init(HMDMainDriver);
  return MEMORY[0x1F41817F8]();
}

- (void)_createCurrentAccessorySetupMetricDispatcher:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[HMDCurrentAccessorySetupMetricDispatcher alloc] initWithDataSource:self setupLogEvent:v9 logEventSubmitter:v10];
  [(HMDMainDriver *)self setCurrentAccessorySetupMetricDispatcher:v11];

  uint64_t v12 = [(HMDMainDriver *)self homeManager];

  double v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  int v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting current accessory metric dispatcher for home manager", (uint8_t *)&v21, 0xCu);
    }
    v18 = [(HMDMainDriver *)v14 currentAccessorySetupMetricDispatcher];
    id v19 = [(HMDMainDriver *)v14 homeManager];
    [v19 setCurrentAccessorySetupMetricDispatcher:v18];
  }
  else
  {
    if (v16)
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v20;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Home manager is not created yet", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4 setupLogEventFactory:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10) {
    (*((void (**)(id))v10 + 2))(v10);
  }
  else {
  uint64_t v12 = +[HMDCurrentAccessorySetupMetricDispatcher readSetupLogEventFromUserDefaults:v8];
  }
  double v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  int v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      uint64_t v17 = HMFGetLogIdentifier();
      v18 = [v12 coreAnalyticsEventDictionary];
      uint64_t v19 = [v12 savedEventState];
      v20 = @"HH1Initial";
      int v21 = @"Submitted";
      __int16 v22 = @"Unknown";
      if (v19 != 0x10000) {
        __int16 v22 = @"HH1Initial";
      }
      if (v19 != 3) {
        int v21 = v22;
      }
      if (v19 == 2) {
        v20 = @"HH2Initial";
      }
      if (v19 == 1) {
        v20 = @"HH2SentinelFetched";
      }
      if (v19 > 2) {
        v20 = v21;
      }
      uint64_t v23 = v20;
      int v26 = 138543874;
      v27 = v17;
      __int16 v28 = 2112;
      double v29 = v18;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Loading saved log event: %@ with event state: %@", (uint8_t *)&v26, 0x20u);
    }
    switch([v12 savedEventState])
    {
      case 0:
      case 2:
        [v12 setSavedEventState:3];
        +[HMDCurrentAccessorySetupMetricDispatcher saveSetupLogEventIntoUserDefaults:v8 setupLogEvent:v12];
        __int16 v24 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3400];
        [v9 submitLogEvent:v12 error:v24];
        [(HMDMainDriver *)v14 removeCurrentAccessorySetupMetricDispatcherIfNeeded];

        break;
      case 1:
        [(HMDMainDriver *)v14 _createCurrentAccessorySetupMetricDispatcher:v8 setupLogEvent:v12 logEventSubmitter:v9];
        break;
      case 3:
        +[HMDCurrentAccessorySetupMetricDispatcher removeLastAccessorySetupInfoFromUserDefaults:v8];
        [(HMDMainDriver *)v14 removeCurrentAccessorySetupMetricDispatcherIfNeeded];
        break;
      default:
        break;
    }
  }
  else
  {
    if (v16)
    {
      double v25 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@No saved log event saved before", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4
{
}

- (void)createCurrentAccessorySetupMetricDispatcherForSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  dispatch_queue_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    double v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating current accessory setup metric dispatcher for session: %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [[HMDHomePodSetupLatencyLogEvent alloc] initLogEventWithInitialState:0];
  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v11 = +[HMDMetricsManager sharedLogEventSubmitter];
  [(HMDMainDriver *)v6 _createCurrentAccessorySetupMetricDispatcher:v10 setupLogEvent:v9 logEventSubmitter:v11];
}

+ (id)getLocalStoreFrom:(id)a3
{
  uint64_t v3 = +[HMDBackingStoreSingleton sharedInstance];
  id v4 = [v3 local];

  return v4;
}

+ (id)loadSQLArchiveWithDecryptionFail:(BOOL *)a3 fromLocation:(id)a4 forHH2Migration:(BOOL)a5 error:(id *)a6
{
  LODWORD(v63) = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    double v72 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Loading Home data from table.", buf, 0xCu);
  }
  int v12 = [(id)objc_opt_class() getLocalStoreFrom:v7];
  id v69 = 0;
  id v70 = 0;
  id v68 = 0;
  int v13 = [v12 _selectArchiveWithIdentifier:@"homedata" archive:&v70 controllerUserName:&v69 error:&v68];
  id v14 = v70;
  id v15 = v69;
  id v16 = v68;

  uint64_t v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = v9;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v72 = v20;
    __int16 v73 = 2112;
    id v74 = v15;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Controller user name : %@", buf, 0x16u);
  }
  int v21 = 0;
  if (v14) {
    int v22 = v13;
  }
  else {
    int v22 = 0;
  }
  unint64_t v23 = 0x1E4F65000;
  if (v22 == 1 && v15)
  {
    __int16 v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v18;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      __int16 v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
      *(_DWORD *)buf = 138543618;
      double v72 = v27;
      __int16 v73 = 2112;
      id v74 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded Home data from table size: %@", buf, 0x16u);

      unint64_t v23 = 0x1E4F65000uLL;
    }

    id v67 = v16;
    BOOL v29 = +[HMDPersistentStore hasControllerKeyWithUsername:v15 error:&v67];
    id v30 = v67;

    if (v29)
    {
      v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = v25;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        double v72 = v34;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Found controller key for loaded home data", buf, 0xCu);
      }
      v35 = [MEMORY[0x1E4F5BE48] systemStore];
      [v35 updateActiveControllerPairingIdentifier:v15];

      id v66 = 0;
      +[HMDPersistentStore deserializeHomeData:&v66 usingLocalStorage:1 fromData:v14 forHH2Migration:v63];
      id v36 = v66;
      if (v36)
      {
        int v21 = v36;
        id v63 = v7;
        unint64_t v37 = v23;
        v38 = [*(id *)(v23 + 1328) sharedPreferences];
        id v39 = [v38 preferenceForKey:@"CreateArchiveShadowCopy"];
        int v40 = [v39 BOOLValue];

        double v41 = a6;
        if (v40 && isInternalBuild()) {
          id v42 = +[HMDPersistentStore archiveHomeDataLegacy:v21 toLocation:@"/tmp/legacyhomedatashadow.data"];
        }
        unint64_t v23 = v37;
        id v7 = v63;
      }
      else
      {
        v47 = (void *)MEMORY[0x1D9452090]();
        id v48 = v32;
        id v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          double v72 = v50;
          _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Have home archive in table but could not decrypt. Home archive is corrupt.", buf, 0xCu);
        }
        uint64_t v51 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];

        int v21 = 0;
        double v41 = a6;
        *a3 = 1;
        id v30 = (id)v51;
        unint64_t v23 = 0x1E4F65000uLL;
      }
    }
    else
    {
      double v41 = a6;
      if (!v30)
      {
        v43 = (void *)MEMORY[0x1D9452090]();
        id v44 = v25;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          double v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          double v72 = v46;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@No error while finding controller key but couldn't find controller key", buf, 0xCu);
        }
        id v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        unint64_t v23 = 0x1E4F65000;
      }
      int v21 = 0;
      *a3 = 1;
    }
  }
  else
  {
    id v30 = v16;
    double v41 = a6;
  }
  double v52 = objc_msgSend(*(id *)(v23 + 1328), "sharedPreferences", v63);
  double v53 = [v52 preferenceForKey:@"ForceDecryptionFailed"];
  int v54 = [v53 BOOLValue];

  if (v54 && isInternalBuild())
  {
    v55 = (void *)MEMORY[0x1D9452090]();
    id v56 = v18;
    id v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      double v72 = v58;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Forcing decryption failed state due to preference.", buf, 0xCu);
    }

    uint64_t v59 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];

    int v21 = 0;
    *a3 = 1;
    id v30 = (id)v59;
  }
  id v60 = v30;
  *double v41 = v60;
  id v61 = v21;

  return v61;
}

+ (id)loadHomeDataFromDemoModeStore:(id *)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)MEMORY[0x1E4F1C9B8];
  dispatch_queue_t v6 = HMDHomeKitDaemonDemoModePersistencePath();
  id v28 = 0;
  id v7 = [v5 dataWithContentsOfURL:v6 options:0 error:&v28];
  id v8 = v28;

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not read demo accessory data.", buf, 0xCu);
    }
    id v13 = v8;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    id v16 = [v14 setWithArray:v15];

    id v27 = 0;
    uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v16 fromData:v7 error:&v27];
    id v13 = v27;
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1;
    v20 = HMFGetOSLogHandle();
    int v21 = v20;
    if (v13 || !v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v24;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@No demo accessory data.", buf, 0xCu);
      }
      id v25 = v13;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v22;
        __int16 v31 = 2112;
        id v32 = v17;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Decoded demo accessories: %@", buf, 0x16u);
      }
      unint64_t v23 = objc_alloc_init(HMDMutableHomeData);
      [(HMDHomeData *)v23 setDemoAccessories:v17];
      *a3 = (id)[(HMDMutableHomeData *)v23 copy];
    }
  }

  return v13;
}

+ (id)loadHomeDataFromLocalStore:(id *)a3 fromLocation:(id)a4 decryptionFailed:(BOOL *)a5 forHH2Migration:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (!a3) {
    _HMFPreconditionFailure();
  }
  uint64_t v11 = v10;
  BOOL v27 = 0;
  if (retailDemoDataEncoded)
  {
    id v12 = 0;
  }
  else
  {
    id v26 = 0;
    id v12 = [(id)objc_opt_class() loadSQLArchiveWithDecryptionFail:&v27 fromLocation:v10 forHH2Migration:v6 error:&v26];
    id v13 = v26;
    if (v13)
    {
      id v14 = v13;
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = a1;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        BOOL v29 = v18;
        __int16 v30 = 2112;
        __int16 v31 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to load the home data from SQL : %@", buf, 0x16u);
      }
      goto LABEL_14;
    }
    if (v27)
    {
LABEL_13:
      id v12 = v12;
      id v14 = 0;
      *a3 = v12;
      goto LABEL_14;
    }
  }
  if (v12) {
    goto LABEL_13;
  }
  id v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = a1;
  int v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v29 = v22;
    __int16 v30 = 2112;
    __int16 v31 = v11;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Since we could not load the keyed archive from SQL table we are going to load it from location: %@", buf, 0x16u);
  }
  id v25 = 0;
  id v14 = +[HMDPersistentStore unarchiveHomeData:&v25 decryptionFailed:&v27 fromLocation:v11 successfulKeyUserName:0 forHH2Migration:v6];
  id v12 = v25;
  if (!v14) {
    goto LABEL_13;
  }
LABEL_14:
  if (a5) {
    *a5 = v27;
  }
  id v23 = v14;

  return v23;
}

+ (id)loadHomeDataFromLocalStore:(id *)a3 decryptionFailed:(BOOL *)a4
{
  BOOL v6 = objc_opt_class();
  return (id)[v6 loadHomeDataFromLocalStore:a3 fromLocation:0 decryptionFailed:a4 forHH2Migration:0];
}

@end