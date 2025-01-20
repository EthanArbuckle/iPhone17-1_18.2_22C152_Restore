@interface HMDMainDriver
+ (id)driver;
+ (id)getLocalStoreFrom:(id)a3;
+ (id)loadHomeDataFromDemoModeStore:(id *)a3;
+ (id)loadHomeDataFromLocalStore:(id *)a3 decryptionFailed:(BOOL *)a4;
+ (id)loadHomeDataFromLocalStore:(id *)a3 fromLocation:(id)a4 decryptionFailed:(BOOL *)a5 forHH2Migration:(BOOL)a6;
+ (id)loadSQLArchiveWithDecryptionFail:(BOOL *)a3 fromLocation:(id)a4 forHH2Migration:(BOOL)a5 error:(id *)a6;
+ (id)logCategory;
- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5;
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
- (void)setCoreData:(id)a3;
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

- (void)setCoreData:(id)a3
{
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
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke;
  v8[3] = &unk_264A290E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 findAccessoriesNotOnWiFiWithCurrentWiFi:v6 completionHandler:v8];
}

void __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@wifi mismatch accessories %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)currentWiFiNetworkRSSI
{
  v2 = [MEMORY[0x263F42680] sharedManager];
  id v3 = [v2 currentNetworkRSSI];

  return v3;
}

- (id)currentWiFiNetworkInfo
{
  v2 = [MEMORY[0x263F42680] sharedManager];
  id v3 = [v2 MACAddress];
  id v4 = [v2 currentNetworkSSID];
  id v5 = [v2 currentNetworkAssociation];
  id v6 = objc_alloc(MEMORY[0x263F42688]);
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMainDriver *)self homeManager];
  id v4 = [v3 currentAccessorySetupMetricDispatcher];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from home manager", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [(HMDMainDriver *)v6 homeManager];
    [v9 setCurrentAccessorySetupMetricDispatcher:0];
  }
  __int16 v10 = [(HMDMainDriver *)self currentAccessorySetupMetricDispatcher];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from main driver", (uint8_t *)&v15, 0xCu);
    }
    [(HMDMainDriver *)v12 setCurrentAccessorySetupMetricDispatcher:0];
  }
}

- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(HMDMainDriver *)self homeManager];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 _homeWithUUID:v9];
    v13 = v12;
    if (!v12)
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = v8;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v31;
        __int16 v44 = 2112;
        id v45 = v9;
        v32 = "%{public}@Allowing cloud transform, no known home with modelID: %@";
LABEL_25:
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, v32, buf, 0x16u);
      }
LABEL_26:

      BOOL v23 = 1;
      goto LABEL_27;
    }
    BOOL v39 = v5;
    id v14 = v12;
    id v15 = v8;
    v16 = [v14 residentDeviceManager];
    v41 = [v16 residentDevices];
    if ([v41 count])
    {
      int v17 = [v16 isCurrentDeviceConfirmedPrimaryResident];
      context = (void *)MEMORY[0x230FBD990]();
      id v18 = v15;
      v19 = HMFGetOSLogHandle();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (!v20)
        {
          BOOL v23 = 1;
          goto LABEL_19;
        }
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v21;
        __int16 v44 = 2112;
        id v45 = v14;
        v22 = "%{public}@Allowing cloud operations, current device is the primary resident for home: %@";
        BOOL v23 = 1;
        goto LABEL_14;
      }
      if (v20)
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v34;
        __int16 v44 = 2112;
        id v45 = v14;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Denying cloud operations, current device is not the primary resident for home: %@", buf, 0x16u);
      }
      BOOL v23 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      id v33 = v15;
      v19 = HMFGetOSLogHandle();
      BOOL v23 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v21;
        __int16 v44 = 2112;
        id v45 = v14;
        v22 = "%{public}@Allowing cloud operations, no residents for home: %@";
LABEL_14:
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
      }
    }
LABEL_19:

    if (v23 || !v39) {
      goto LABEL_27;
    }
    v35 = [v14 residentDeviceManager];
    v36 = [v35 primaryResidentDevice];

    if (v36)
    {
      BOOL v23 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v28 = (void *)MEMORY[0x230FBD990]();
    id v37 = v15;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v31;
      __int16 v44 = 2112;
      id v45 = v9;
      v32 = "%{public}@Actually allowing cloud transform for import because the primary resident is unknown for modelID: %@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = v8;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v27;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Allowing cloud transform, no home manager", buf, 0xCu);
  }
  BOOL v23 = 1;
LABEL_28:

  return v23;
}

- (void)relaunchAfterDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  BOOL v5 = [(HMDMainDriver *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDMainDriver_relaunchAfterDelay___block_invoke;
  block[3] = &unk_264A2F7F8;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__HMDMainDriver_relaunch__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __25__HMDMainDriver_relaunch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relaunchHomed];
}

- (void)relaunchHomed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMainDriver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_time_t v4 = +[HMDLaunchHandler sharedHandler];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  [v4 registerRelaunchClientWithUUID:v5];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Exiting...", (uint8_t *)&v10, 0xCu);
  }
  _Exit(0);
}

- (void)start
{
  v564[1] = *MEMORY[0x263EF8340];
  v505 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"HMDMainDriver.start" parent:0 options:1];
  if (isFirstLaunchAfterBoot_onceToken != -1) {
    dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_917);
  }
  v497 = [[HMDLaunchEvent alloc] initWithFirstLaunchAfterBoot:isFirstLaunchAfterBoot_firstLaunchAfterBoot];
  id v3 = (void *)MEMORY[0x230FBD990]();
  dispatch_time_t v4 = self;
  HMFGetOSLogHandle();
  BOOL v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@homed launched with ROAR Enabled", buf, 0xCu);
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  v503 = v4;
  HMFGetOSLogHandle();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v524 = @"Starting homed";
    *(_WORD *)v525 = 2114;
    *(void *)&v525[2] = @"state";
    __int16 v526 = 2112;
    v527 = @"start";
    __int16 v528 = 2114;
    v529 = @"isHH2";
    __int16 v530 = 2112;
    id v531 = v10;
    __int16 v532 = 2114;
    v533 = @"isFirstLaunchAfterBoot";
    __int16 v534 = 2112;
    id v535 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
  }
  uint64_t v12 = [MEMORY[0x263F499E0] sharedInstance];
  id v13 = objc_alloc(MEMORY[0x263F499F0]);
  id v14 = HMFBooleanToString();
  id v15 = HMFBooleanToString();
  v16 = HMDTaggedLoggingCreateDictionary();
  int v17 = objc_msgSend(v13, "initWithTag:data:", @"mainDriverStart", v16, @"state", @"start", @"isHH2", v14, @"isFirstLaunchAfterBoot", v15);
  id v18 = [v505 tagProcessorList];
  [v12 submitTaggedEvent:v17 processorList:v18];

  v19 = v503[1];
  if (os_signpost_enabled(v19))
  {
    HMFBooleanToString();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v20;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MainDriverStart", "isRoarEnabled=%{signpost.description:attribute}@ ", buf, 0xCu);
  }
  signal(15, 0);
  uint64_t v21 = isInternalBuild();
  if (v21) {
    uint64_t v21 = +[HMDMemoryDiagnostic configureMemoryDiagnostic];
  }
  v22 = (void *)MEMORY[0x230FBD990](v21);
  uint64_t v23 = HMFUptime();
  double v25 = v24;
  v26 = (void *)MEMORY[0x230FBD990](v23);
  v27 = v503;
  HMFGetOSLogHandle();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v524 = @"Config cleanup start";
    *(_WORD *)v525 = 2114;
    *(void *)&v525[2] = @"state";
    __int16 v526 = 2112;
    v527 = @"mainDriverConfigCleanup";
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v30 = [MEMORY[0x263F499E0] sharedInstance];
  id v31 = objc_alloc(MEMORY[0x263F499F0]);
  v563 = @"state";
  v564[0] = @"mainDriverConfigCleanup";
  v32 = [NSDictionary dictionaryWithObjects:v564 forKeys:&v563 count:1];
  id v33 = (void *)[v31 initWithTag:@"mainDriverStart" data:v32];
  v34 = [v505 tagProcessorList];
  [v30 submitTaggedEvent:v33 processorList:v34];

  v35 = (void *)MEMORY[0x230FBD990](+[HMDResetConfigPostCleanup performAnyPostCleanupStepsIfNecessary]);
  v36 = v27;
  HMFGetOSLogHandle();
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v39 = NSString;
    HMFUptime();
    objc_msgSend(v39, "stringWithFormat:", @"%.3f", v40 - v25);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v524 = @"Config cleanup done";
    *(_WORD *)v525 = 2114;
    *(void *)&v525[2] = @"state";
    __int16 v526 = 2112;
    v527 = @"mainDriverConfigCleanupDone";
    __int16 v528 = 2114;
    v529 = @"duration";
    __int16 v530 = 2112;
    id v531 = v41;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  v42 = [MEMORY[0x263F499E0] sharedInstance];
  id v43 = objc_alloc(MEMORY[0x263F499F0]);
  __int16 v44 = NSString;
  HMFUptime();
  uint64_t v46 = objc_msgSend(v44, "stringWithFormat:", @"%.3f", v45 - v25);
  v47 = HMDTaggedLoggingCreateDictionary();
  v48 = objc_msgSend(v43, "initWithTag:data:", @"mainDriverStart", v47, @"state", @"mainDriverConfigCleanupDone", @"duration", v46);
  v49 = [v505 tagProcessorList];
  [v42 submitTaggedEvent:v48 processorList:v49];

  uint64_t v50 = HMFUptime();
  double v52 = v51;
  v53 = (void *)MEMORY[0x230FBD990](v50);
  v54 = v36;
  HMFGetOSLogHandle();
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"mainDriverStart";
    *(_WORD *)&buf[22] = 2112;
    v524 = @"Initialize paths and utilities";
    *(_WORD *)v525 = 2114;
    *(void *)&v525[2] = @"state";
    __int16 v526 = 2112;
    v527 = @"mainDriverSetupPaths";
    _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v57 = [MEMORY[0x263F499E0] sharedInstance];
  id v58 = objc_alloc(MEMORY[0x263F499F0]);
  v561 = @"state";
  v562 = @"mainDriverSetupPaths";
  v59 = [NSDictionary dictionaryWithObjects:&v562 forKeys:&v561 count:1];
  v60 = (void *)[v58 initWithTag:@"mainDriverStart" data:v59];
  v61 = [v505 tagProcessorList];
  [v57 submitTaggedEvent:v60 processorList:v61];

  v62 = MEMORY[0x263EF83A0];
  id v63 = MEMORY[0x263EF83A0];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v62, &__block_literal_global_140);

  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x263EF83A0], &__block_literal_global_143);
  xpc_set_event_stream_handler("com.apple.passd.matching", MEMORY[0x263EF83A0], &__block_literal_global_149);

  v64 = +[HMDBackgroundTaskManager sharedManager];
  [v64 configure];

  if (MKBDeviceUnlockedSinceBoot())
  {
    [MEMORY[0x263F425F0] setClassMappingForNSCoder];
    if (+[HMDDeviceCapabilities supportsLocalization])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__languageChanged, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (initializePaths_onceToken != -1) {
      dispatch_once(&initializePaths_onceToken, &__block_literal_global_78570);
    }
    +[HMDDatabase registerQueries];
    v66 = (void *)MEMORY[0x230FBD990](+[HMDHomeData configureKeyedArchiverClassMappings]);
    v67 = v54;
    HMFGetOSLogHandle();
    v68 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v69 = (id)objc_claimAutoreleasedReturnValue();
      v70 = NSString;
      HMFUptime();
      objc_msgSend(v70, "stringWithFormat:", @"%.3f", v71 - v52);
      id v72 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v69;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Initialized paths and utilities";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverSetupPathsDone";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v72;
      _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v73 = [MEMORY[0x263F499E0] sharedInstance];
    id v74 = objc_alloc(MEMORY[0x263F499F0]);
    v75 = NSString;
    HMFUptime();
    v77 = objc_msgSend(v75, "stringWithFormat:", @"%.3f", v76 - v52);
    v78 = HMDTaggedLoggingCreateDictionary();
    v79 = objc_msgSend(v74, "initWithTag:data:", @"mainDriverStart", v78, @"state", @"mainDriverSetupPathsDone", @"duration", v77);
    v80 = [v505 tagProcessorList];
    [v73 submitTaggedEvent:v79 processorList:v80];

    if (isInternalBuild())
    {
      v81 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v558 = @"com.apple.CoreData.ConcurrencyDebug";
      uint64_t v559 = MEMORY[0x263EFFA88];
      v82 = [NSDictionary dictionaryWithObjects:&v559 forKeys:&v558 count:1];
      [v81 registerDefaults:v82];
    }
    uint64_t v83 = HMFUptime();
    double v85 = v84;
    v86 = (void *)MEMORY[0x230FBD990](v83);
    v87 = v67;
    HMFGetOSLogHandle();
    v88 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v89;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Checked migration record";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverCheckMigrationRecord";
      _os_log_impl(&dword_22F52A000, v88, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v90 = [MEMORY[0x263F499E0] sharedInstance];
    id v91 = objc_alloc(MEMORY[0x263F499F0]);
    v556 = @"state";
    v557 = @"mainDriverCheckMigrationRecord";
    v92 = [NSDictionary dictionaryWithObjects:&v557 forKeys:&v556 count:1];
    v93 = (void *)[v91 initWithTag:@"mainDriverStart" data:v92];
    v94 = [v505 tagProcessorList];
    [v90 submitTaggedEvent:v93 processorList:v94];

    v499 = +[HMDHH2MigratorRecord singleRecord];
    int v501 = [v499 isMigrationInProgress];
    if (v501
      && (([v499 dryRun] & 1) != 0 || objc_msgSend(v499, "migrateFromTestDirectory")))
    {
      uint64_t v95 = +[HMDCoreData sharedInstanceWithoutLiveCloudKit];
      id v96 = v87[2];
      v87[2] = (id)v95;
    }
    v97 = (void *)MEMORY[0x230FBD990]();
    v98 = v87;
    HMFGetOSLogHandle();
    v99 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v100 = (id)objc_claimAutoreleasedReturnValue();
      v101 = NSString;
      HMFUptime();
      objc_msgSend(v101, "stringWithFormat:", @"%.3f", v102 - v85);
      id v103 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v104 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      *(void *)&uint8_t buf[4] = v100;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Checked migration record";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverCheckedMigrationRecord";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v103;
      __int16 v532 = 2114;
      v533 = @"migrationInProgress";
      __int16 v534 = 2112;
      id v535 = v104;
      _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
    }
    v105 = [MEMORY[0x263F499E0] sharedInstance];
    id v106 = objc_alloc(MEMORY[0x263F499F0]);
    v107 = NSString;
    HMFUptime();
    v109 = objc_msgSend(v107, "stringWithFormat:", @"%.3f", v108 - v85);
    v110 = HMFBooleanToString();
    v111 = HMDTaggedLoggingCreateDictionary();
    v112 = objc_msgSend(v106, "initWithTag:data:", @"mainDriverStart", v111, @"state", @"mainDriverCheckedMigrationRecord", @"duration", v109, @"migrationInProgress", v110);
    v113 = [v505 tagProcessorList];
    [v105 submitTaggedEvent:v112 processorList:v113];

    if (!v98[2])
    {
      uint64_t v114 = HMFUptime();
      double v116 = v115;
      v117 = (void *)MEMORY[0x230FBD990](v114);
      v118 = v98;
      HMFGetOSLogHandle();
      v119 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v120 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v120;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Setup CoreData";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverSetupCDDone";
        _os_log_impl(&dword_22F52A000, v119, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
      }
      v121 = [MEMORY[0x263F499E0] sharedInstance];
      id v122 = objc_alloc(MEMORY[0x263F499F0]);
      v554 = @"state";
      v555 = @"mainDriverSetupCDDone";
      v123 = [NSDictionary dictionaryWithObjects:&v555 forKeys:&v554 count:1];
      v124 = (void *)[v122 initWithTag:@"mainDriverStart" data:v123];
      v125 = [v505 tagProcessorList];
      [v121 submitTaggedEvent:v124 processorList:v125];

      uint64_t v126 = +[HMDCoreData sharedInstance];
      id v127 = v98[2];
      v98[2] = (id)v126;

      v128 = (void *)MEMORY[0x230FBD990]();
      v129 = v118;
      HMFGetOSLogHandle();
      v130 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v131 = (id)objc_claimAutoreleasedReturnValue();
        v132 = NSString;
        HMFUptime();
        objc_msgSend(v132, "stringWithFormat:", @"%.3f", v133 - v116);
        id v134 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        *(void *)&uint8_t buf[4] = v131;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Setup CoreData done";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverSetupCDDone";
        __int16 v528 = 2114;
        v529 = @"duration";
        __int16 v530 = 2112;
        id v531 = v134;
        _os_log_impl(&dword_22F52A000, v130, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
      }
      v135 = [MEMORY[0x263F499E0] sharedInstance];
      id v136 = objc_alloc(MEMORY[0x263F499F0]);
      v137 = NSString;
      HMFUptime();
      v139 = objc_msgSend(v137, "stringWithFormat:", @"%.3f", v138 - v116);
      v140 = HMDTaggedLoggingCreateDictionary();
      v141 = objc_msgSend(v136, "initWithTag:data:", @"mainDriverStart", v140, @"state", @"mainDriverSetupCDDone", @"duration", v139);
      v142 = [v505 tagProcessorList];
      [v135 submitTaggedEvent:v141 processorList:v142];
    }
    uint64_t v143 = HMFUptime();
    double v145 = v144;
    v146 = (void *)MEMORY[0x230FBD990](v143);
    v147 = v98;
    HMFGetOSLogHandle();
    v148 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v149 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v149;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Check working store for Home Manager";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverCheckWorkingStore";
      _os_log_impl(&dword_22F52A000, v148, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v150 = [MEMORY[0x263F499E0] sharedInstance];
    id v151 = objc_alloc(MEMORY[0x263F499F0]);
    v552 = @"state";
    v553 = @"mainDriverCheckWorkingStore";
    v152 = [NSDictionary dictionaryWithObjects:&v553 forKeys:&v552 count:1];
    v153 = (void *)[v151 initWithTag:@"mainDriverStart" data:v152];
    v154 = [v505 tagProcessorList];
    [v150 submitTaggedEvent:v153 processorList:v154];

    +[HMDHomeManager makeSureHomeManagerExistInWorkingStore:v98[2]];
    v155 = +[HMDCoreDataCloudTransform sharedInstance];
    v156 = (void *)MEMORY[0x230FBD990]([v155 setDelegate:v147]);
    v157 = v147;
    HMFGetOSLogHandle();
    v158 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v159 = (id)objc_claimAutoreleasedReturnValue();
      v160 = NSString;
      HMFUptime();
      objc_msgSend(v160, "stringWithFormat:", @"%.3f", v161 - v145);
      id v162 = (id)objc_claimAutoreleasedReturnValue();
      v163 = [NSNumber numberWithInt:v155 != 0];
      *(_DWORD *)buf = 138545410;
      *(void *)&uint8_t buf[4] = v159;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Checked working store for Home Manager";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverCheckWorkingStoreDone";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v162;
      __int16 v532 = 2114;
      v533 = @"success";
      __int16 v534 = 2112;
      id v535 = v163;
      _os_log_impl(&dword_22F52A000, v158, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
    }
    v164 = [MEMORY[0x263F499E0] sharedInstance];
    id v165 = objc_alloc(MEMORY[0x263F499F0]);
    v166 = NSString;
    HMFUptime();
    v168 = objc_msgSend(v166, "stringWithFormat:", @"%.3f", v167 - v145);
    v169 = [NSNumber numberWithInt:v155 != 0];
    v170 = HMDTaggedLoggingCreateDictionary();
    v171 = objc_msgSend(v165, "initWithTag:data:", @"mainDriverStart", v170, @"state", @"mainDriverCheckWorkingStoreDone", @"duration", v168, @"success", v169);
    v172 = [v505 tagProcessorList];
    [v164 submitTaggedEvent:v171 processorList:v172];

    v173 = [v157 coreData];
    [v173 applyInitialImportVoucherIfNeeded];

    v174 = (void *)MEMORY[0x230FBD990]();
    if (v501)
    {
      uint64_t v175 = HMFUptime();
      double v177 = v176;
      v178 = (void *)MEMORY[0x230FBD990](v175);
      v179 = v157;
      HMFGetOSLogHandle();
      v180 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v181 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v181;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Check for migration status";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverCheckMigrationStatus";
        _os_log_impl(&dword_22F52A000, v180, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
      }
      v182 = [MEMORY[0x263F499E0] sharedInstance];
      id v183 = objc_alloc(MEMORY[0x263F499F0]);
      v550 = @"state";
      v551 = @"mainDriverCheckMigrationStatus";
      v184 = [NSDictionary dictionaryWithObjects:&v551 forKeys:&v550 count:1];
      v185 = (void *)[v183 initWithTag:@"mainDriverStart" data:v184];
      v186 = [v505 tagProcessorList];
      [v182 submitTaggedEvent:v185 processorList:v186];

      v187 = objc_alloc_init(HMDHH2Migrator);
      if (![(HMDHH2Migrator *)v187 startMigrationIfNeeded])
      {
        +[HMDHH2MigrationStateLogger recordMigrationEnd:0];
        +[HMDResetConfigPostCleanup writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:3];
        v485 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2711];
        +[HMDHH2MigratorRecord recordMigrationFailureWithError:v485];

        _Exit(2);
      }
      v188 = (void *)MEMORY[0x230FBD990]();
      v189 = v179;
      HMFGetOSLogHandle();
      v190 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v191 = (id)objc_claimAutoreleasedReturnValue();
        v192 = NSString;
        HMFUptime();
        objc_msgSend(v192, "stringWithFormat:", @"%.3f", v193 - v177);
        id v194 = (id)objc_claimAutoreleasedReturnValue();
        v195 = [NSNumber numberWithBool:1];
        *(_DWORD *)buf = 138545410;
        *(void *)&uint8_t buf[4] = v191;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Checked for migration status";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverCheckedMigrationStatus";
        __int16 v528 = 2114;
        v529 = @"duration";
        __int16 v530 = 2112;
        id v531 = v194;
        __int16 v532 = 2114;
        v533 = @"success";
        __int16 v534 = 2112;
        id v535 = v195;
        _os_log_impl(&dword_22F52A000, v190, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
      }
      v196 = [MEMORY[0x263F499E0] sharedInstance];
      id v197 = objc_alloc(MEMORY[0x263F499F0]);
      v198 = NSString;
      HMFUptime();
      v200 = objc_msgSend(v198, "stringWithFormat:", @"%.3f", v199 - v177);
      v201 = [NSNumber numberWithBool:1];
      v202 = HMDTaggedLoggingCreateDictionary();
      v203 = objc_msgSend(v197, "initWithTag:data:", @"mainDriverStart", v202, @"state", @"mainDriverCheckedMigrationStatus", @"duration", v200, @"success", v201);
      v204 = [v505 tagProcessorList];
      [v196 submitTaggedEvent:v203 processorList:v204];
    }

    uint64_t v205 = HMFUptime();
    double v207 = v206;
    v208 = (void *)MEMORY[0x230FBD990](v205);
    v209 = v157;
    HMFGetOSLogHandle();
    v210 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v211 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v211;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Init capabilities";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverSetupCapabilities";
      _os_log_impl(&dword_22F52A000, v210, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v212 = [MEMORY[0x263F499E0] sharedInstance];
    id v213 = objc_alloc(MEMORY[0x263F499F0]);
    v548 = @"state";
    v549 = @"mainDriverSetupCapabilities";
    v214 = [NSDictionary dictionaryWithObjects:&v549 forKeys:&v548 count:1];
    v215 = (void *)[v213 initWithTag:@"mainDriverStart" data:v214];
    v216 = [v505 tagProcessorList];
    [v212 submitTaggedEvent:v215 processorList:v216];

    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __initializeCapabilitiesAndTimeouts_block_invoke;
    v524 = (__CFString *)&unk_264A2DFA0;
    *(void *)v525 = 0;
    if (initializeCapabilitiesAndTimeouts_onceToken != -1) {
      dispatch_once(&initializeCapabilitiesAndTimeouts_onceToken, buf);
    }

    initializeMappingsAndPaths();
    id v217 = (id)HMCreateHomeKitCacheDirectory();
    v218 = (void *)MEMORY[0x230FBD990](v217);
    v219 = v209;
    HMFGetOSLogHandle();
    v220 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v221 = (id)objc_claimAutoreleasedReturnValue();
      v222 = NSString;
      HMFUptime();
      objc_msgSend(v222, "stringWithFormat:", @"%.3f", v223 - v207);
      id v224 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v221;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Init capabilities done";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverSetupCapabilitiesDone";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v224;
      _os_log_impl(&dword_22F52A000, v220, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v225 = [MEMORY[0x263F499E0] sharedInstance];
    id v226 = objc_alloc(MEMORY[0x263F499F0]);
    v227 = NSString;
    HMFUptime();
    v229 = objc_msgSend(v227, "stringWithFormat:", @"%.3f", v228 - v207);
    v230 = HMDTaggedLoggingCreateDictionary();
    v231 = objc_msgSend(v226, "initWithTag:data:", @"mainDriverStart", v230, @"state", @"mainDriverSetupCapabilitiesDone", @"duration", v229);
    v232 = [v505 tagProcessorList];
    [v225 submitTaggedEvent:v231 processorList:v232];

    v233 = (void *)MEMORY[0x230FBD990]();
    v234 = v219;
    HMFGetOSLogHandle();
    v235 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v236 = (id)objc_claimAutoreleasedReturnValue();
      id v237 = [MEMORY[0x263F42608] sharedPreferences];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v236;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v237;
      _os_log_impl(&dword_22F52A000, v235, OS_LOG_TYPE_DEBUG, "%{public}@Preferences: %@", buf, 0x16u);
    }
    uint64_t v238 = HMFUptime();
    double v240 = v239;
    v241 = (void *)MEMORY[0x230FBD990](v238);
    v242 = v234;
    HMFGetOSLogHandle();
    v243 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v244 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v244;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Init accounts and transports";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverSetupAccountManagers";
      _os_log_impl(&dword_22F52A000, v243, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v245 = [MEMORY[0x263F499E0] sharedInstance];
    id v246 = objc_alloc(MEMORY[0x263F499F0]);
    v546 = @"state";
    v547 = @"mainDriverSetupAccountManagers";
    v247 = [NSDictionary dictionaryWithObjects:&v547 forKeys:&v546 count:1];
    v248 = (void *)[v246 initWithTag:@"mainDriverStart" data:v247];
    v249 = [v505 tagProcessorList];
    [v245 submitTaggedEvent:v248 processorList:v249];

    v490 = +[HMDIDSServiceManager sharedManager];
    v500 = +[HMDAppleAccountManager sharedManager];
    id v250 = +[HMDRemoteAccountManager sharedManager];
    v494 = +[HMDAccountRegistry sharedRegistry];
    [v505 markWithReason:@"Creating Message Transports"];
    v489 = +[HMDXPCMessageTransport defaultTransport];
    v488 = +[HMDSecureRemoteMessageTransport defaultTransport];
    v502 = +[HMDMessageDispatcher defaultDispatcher];
    v493 = +[HMDBulletinBoard sharedBulletinBoard];
    [v505 markWithReason:@"Initialize Metrics Manager"];
    v251 = [HMDMetricsManager alloc];
    v252 = [v493 notificationCenterSettingsProvider];
    v253 = [(HMDMetricsManager *)v251 initWithMessageDispatcher:v502 accountManager:v500 notificationSettingsProvider:v252];
    [v242 setMetricsManager:v253];

    v254 = [v242 metricsManager];
    [v254 startMetricsCollection];

    v255 = [v242 metricsManager];
    v256 = [v255 logEventSubmitter];
    [v256 submitLogEvent:v497];

    v257 = [HMDHelper alloc];
    v258 = objc_alloc_init(HMDHelperExternalProtocolImpl);
    v492 = [(HMDHelper *)v257 initWithExternalProtocol:v258];

    v259 = (void *)MEMORY[0x230FBD990](+[HMDHelper setSharedHelper:v492]);
    v260 = v242;
    HMFGetOSLogHandle();
    v261 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v262 = (id)objc_claimAutoreleasedReturnValue();
      v263 = NSString;
      HMFUptime();
      objc_msgSend(v263, "stringWithFormat:", @"%.3f", v264 - v240);
      id v265 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v262;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Init accounts and transports done";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverSetupAccountManagersDone";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v265;
      _os_log_impl(&dword_22F52A000, v261, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v266 = [MEMORY[0x263F499E0] sharedInstance];
    id v267 = objc_alloc(MEMORY[0x263F499F0]);
    v268 = NSString;
    HMFUptime();
    v270 = objc_msgSend(v268, "stringWithFormat:", @"%.3f", v269 - v240);
    v271 = HMDTaggedLoggingCreateDictionary();
    v272 = objc_msgSend(v267, "initWithTag:data:", @"mainDriverStart", v271, @"state", @"mainDriverSetupAccountManagersDone", @"duration", v270);
    v273 = [v505 tagProcessorList];
    [v266 submitTaggedEvent:v272 processorList:v273];

    +[HMDThreadMonitor start];
    v274 = (void *)MEMORY[0x230FBD990]([v505 markWithReason:@"Initiating Clips Quota Manager"]);
    v275 = +[HMDCameraClipsQuotaManager defaultManager];
    [v275 synchronize];

    if (enableNetworkLogging)
    {
      v276 = (void *)MEMORY[0x230FBD990]();
      v277 = v260;
      HMFGetOSLogHandle();
      v278 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v279 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v279;
        _os_log_impl(&dword_22F52A000, v278, OS_LOG_TYPE_INFO, "%{public}@Enabling CFNetwork diagnostics", buf, 0xCu);
      }
      setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    }
    [v505 markWithReason:@"Loading Persistent Store"];
    uint64_t v280 = objc_opt_class();
    v281 = (objc_class *)objc_opt_class();
    v282 = NSStringFromClass(v281);
    +[HMDBackingStoreSingleton setClass:v280 forClassName:v282];

    uint64_t v283 = HMFUptime();
    double v285 = v284;
    v286 = (void *)MEMORY[0x230FBD990](v283);
    v287 = v260;
    HMFGetOSLogHandle();
    v288 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v289 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v289;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Load Persistent Store";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverLoadPersistentStore";
      _os_log_impl(&dword_22F52A000, v288, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v290 = [MEMORY[0x263F499E0] sharedInstance];
    id v291 = objc_alloc(MEMORY[0x263F499F0]);
    v544 = @"state";
    v545 = @"mainDriverLoadPersistentStore";
    v292 = [NSDictionary dictionaryWithObjects:&v545 forKeys:&v544 count:1];
    v293 = (void *)[v291 initWithTag:@"mainDriverStart" data:v292];
    v294 = [v505 tagProcessorList];
    [v290 submitTaggedEvent:v293 processorList:v294];

    context = (void *)MEMORY[0x230FBD990]();
    +[HMDPersistentStore removeTransactionJournal];
    uint64_t v295 = +[HMDHAPMetadata prepareMetadata];
    int v296 = enableRetailDemoSetup;
    if (enableRetailDemoSetup && (uint64_t v295 = [0 demoFinalized], (v295 & 1) == 0))
    {
      id v517 = 0;
      id v301 = (id)[(id)objc_opt_class() loadHomeDataFromDemoModeStore:&v517];
      uint64_t v295 = (uint64_t)v517;
      v498 = (void *)v295;
    }
    else
    {
      v498 = 0;
    }
    v302 = (void *)MEMORY[0x230FBD990](v295);
    v303 = v287;
    HMFGetOSLogHandle();
    v304 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v304, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v305 = (id)objc_claimAutoreleasedReturnValue();
      v306 = NSString;
      HMFUptime();
      objc_msgSend(v306, "stringWithFormat:", @"%.3f", v307 - v285);
      id v308 = (id)objc_claimAutoreleasedReturnValue();
      v309 = [0 domain];
      v310 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(0, "code"));
      *(_DWORD *)buf = 138545922;
      *(void *)&uint8_t buf[4] = v305;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Loaded Persistent Store";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverLoadedPersistentStore";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v308;
      __int16 v532 = 2114;
      v533 = @"errorDomain";
      __int16 v534 = 2112;
      id v535 = v309;
      __int16 v536 = 2114;
      v537 = @"errorCode";
      __int16 v538 = 2112;
      v539 = v310;
      _os_log_impl(&dword_22F52A000, v304, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);
    }
    BOOL v311 = v296 != 0;

    v312 = [MEMORY[0x263F499E0] sharedInstance];
    id v313 = objc_alloc(MEMORY[0x263F499F0]);
    v314 = NSString;
    HMFUptime();
    v316 = objc_msgSend(v314, "stringWithFormat:", @"%.3f", v315 - v285);
    v317 = [0 domain];
    v318 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(0, "code"));
    v319 = HMDTaggedLoggingCreateDictionary();
    v320 = objc_msgSend(v313, "initWithTag:data:", @"mainDriverStart", v319, @"state", @"mainDriverLoadedPersistentStore", @"duration", v316, @"errorDomain", v317, @"errorCode", v318);
    v321 = [v505 tagProcessorList];
    [v312 submitTaggedEvent:v320 processorList:v321];

    if (v498) {
      char v322 = v311;
    }
    else {
      char v322 = 1;
    }
    if ((v322 & 1) == 0)
    {
      v323 = [MEMORY[0x263F35AD0] systemStore];
      [v323 ensureControllerKeyExistsForAllViews];
    }
    v324 = objc_alloc_init(HMDDeviceSetupConfiguringController);
    [v303 setConfiguringStateController:v324];

    v325 = [v303 configuringStateController];
    [v325 setupRPClient];

    v326 = objc_alloc_init(HMDNetworkInfoController);
    [v303 setNetworkInfoController:v326];

    v327 = [v303 networkInfoController];
    [v327 start];

    contexta = [[HMDDiscoveryController alloc] initWithDiscoveryNeedsAssertion:1];
    [v303 setDiscoveryController:contexta];
    [(HMDDiscoveryController *)contexta start];
    v328 = [[HMDSymptomManager alloc] initWithDataSource:v303];
    [v303 setSymptomManager:v328];

    [v505 markWithReason:@"Loading Accounts"];
    id v516 = 0;
    v491 = +[HMDBackingStore cdlsBackingStoreForHomeManagerWithError:&v516];
    id v329 = v516;
    *(void *)v560 = v329;
    if (!v491)
    {
      v481 = (void *)MEMORY[0x230FBD990]();
      id v482 = v303;
      HMFGetOSLogHandle();
      v483 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v483, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v484 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v484;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v329;
        _os_log_impl(&dword_22F52A000, v483, OS_LOG_TYPE_ERROR, "%{public}@Unable to open Home Manager BackingStore zone. Unsurvivable: %@", buf, 0x16u);
      }
      _Exit(1);
    }
    objc_msgSend(v500, "configureWithBackingStore:");
    [v505 markWithReason:@"Start Account registry and managers"];
    [v494 start];
    uint64_t v330 = [v500 isLoggedInToPrimaryAccount];
    v331 = (void *)MEMORY[0x230FBD990]();
    id v332 = v303;
    HMFGetOSLogHandle();
    v333 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v333, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v334 = (id)objc_claimAutoreleasedReturnValue();
      v335 = [NSNumber numberWithBool:v330];
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v334;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Load accounts";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverLoadAccounts";
      __int16 v528 = 2114;
      v529 = @"status";
      __int16 v530 = 2112;
      id v531 = v335;
      _os_log_impl(&dword_22F52A000, v333, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v336 = [MEMORY[0x263F499E0] sharedInstance];
    id v337 = objc_alloc(MEMORY[0x263F499F0]);
    v338 = [NSNumber numberWithBool:v330];
    v339 = HMDTaggedLoggingCreateDictionary();
    v340 = objc_msgSend(v337, "initWithTag:data:", @"mainDriverStart", v339, @"state", @"mainDriverLoadAccounts", @"status", v338);
    v341 = [v505 tagProcessorList];
    [v336 submitTaggedEvent:v340 processorList:v341];

    if (v330)
    {
      v342 = v503[1];
      if (os_signpost_enabled(v342))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"AccountDeviceSettled";
        _os_signpost_emit_with_name_impl(&dword_22F52A000, v342, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountDeviceSettled", "reason=%{signpost.description:attribute}@ ", buf, 0xCu);
      }

      v343 = (void *)MEMORY[0x230FBD990]([v505 markWithReason:@"Waiting for account to fully settle"]);
      id v344 = v332;
      HMFGetOSLogHandle();
      v345 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v346 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v346;
        _os_log_impl(&dword_22F52A000, v345, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting for account to fully settle", buf, 0xCu);
      }
      *(void *)out_token = 0;
      HMFUptime();
      double v348 = v347;
      v349 = [v500 deviceAccountSettled];
      unsigned int v486 = [v349 waitForResult:out_token orError:v560 withTimeout:1.79769313e308];

      v350 = (void *)MEMORY[0x230FBD990]();
      id v351 = v344;
      HMFGetOSLogHandle();
      v352 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v352, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v353 = (id)objc_claimAutoreleasedReturnValue();
        v354 = NSString;
        HMFUptime();
        objc_msgSend(v354, "stringWithFormat:", @"%.3f", v355 - v348);
        id v356 = (id)objc_claimAutoreleasedReturnValue();
        v357 = [NSNumber numberWithBool:v486];
        v358 = [*(id *)v560 domain];
        v359 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)v560, "code"));
        *(_DWORD *)buf = 138546434;
        *(void *)&uint8_t buf[4] = v353;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Settled account";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverSettledAccount";
        __int16 v528 = 2114;
        v529 = @"duration";
        __int16 v530 = 2112;
        id v531 = v356;
        __int16 v532 = 2114;
        v533 = @"success";
        __int16 v534 = 2112;
        id v535 = v357;
        __int16 v536 = 2114;
        v537 = @"errorDomain";
        __int16 v538 = 2112;
        v539 = v358;
        __int16 v540 = 2114;
        v541 = @"errorCode";
        __int16 v542 = 2112;
        v543 = v359;
        _os_log_impl(&dword_22F52A000, v352, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);
      }
      v360 = [MEMORY[0x263F499E0] sharedInstance];
      id v361 = objc_alloc(MEMORY[0x263F499F0]);
      v362 = NSString;
      HMFUptime();
      v364 = objc_msgSend(v362, "stringWithFormat:", @"%.3f", v363 - v348);
      v365 = [NSNumber numberWithBool:v486];
      v366 = [*(id *)v560 domain];
      v367 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)v560, "code"));
      v368 = HMDTaggedLoggingCreateDictionary();
      v369 = objc_msgSend(v361, "initWithTag:data:", @"mainDriverStart", v368, @"state", @"mainDriverSettledAccount", @"duration", v364, @"success", v365, @"errorDomain", v366, @"errorCode", v367);
      v370 = [v505 tagProcessorList];
      [v360 submitTaggedEvent:v369 processorList:v370];

      v371 = (void *)MEMORY[0x230FBD990]();
      id v372 = v351;
      HMFGetOSLogHandle();
      v373 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v374 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v375 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v374;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v375;
        *(_WORD *)&buf[22] = 2112;
        v524 = *(__CFString **)v560;
        _os_log_impl(&dword_22F52A000, v373, OS_LOG_TYPE_DEFAULT, "%{public}@Did account settle: %@ error: %@", buf, 0x20u);
      }
      HMFUptime();
      double v377 = v376;
      v378 = [v500 currentDeviceSettled];
      unsigned int v487 = [v378 waitForResult:out_token orError:v560 withTimeout:1.79769313e308];

      v379 = (void *)MEMORY[0x230FBD990]();
      id v380 = v372;
      HMFGetOSLogHandle();
      v381 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v381, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v382 = (id)objc_claimAutoreleasedReturnValue();
        v383 = NSString;
        HMFUptime();
        objc_msgSend(v383, "stringWithFormat:", @"%.3f", v384 - v377);
        id v385 = (id)objc_claimAutoreleasedReturnValue();
        v386 = [NSNumber numberWithBool:v487];
        v387 = [*(id *)v560 domain];
        v388 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)v560, "code"));
        *(_DWORD *)buf = 138546434;
        *(void *)&uint8_t buf[4] = v382;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"mainDriverStart";
        *(_WORD *)&buf[22] = 2112;
        v524 = @"Settled device";
        *(_WORD *)v525 = 2114;
        *(void *)&v525[2] = @"state";
        __int16 v526 = 2112;
        v527 = @"mainDriverSettledDevice";
        __int16 v528 = 2114;
        v529 = @"duration";
        __int16 v530 = 2112;
        id v531 = v385;
        __int16 v532 = 2114;
        v533 = @"success";
        __int16 v534 = 2112;
        id v535 = v386;
        __int16 v536 = 2114;
        v537 = @"errorDomain";
        __int16 v538 = 2112;
        v539 = v387;
        __int16 v540 = 2114;
        v541 = @"errorCode";
        __int16 v542 = 2112;
        v543 = v388;
        _os_log_impl(&dword_22F52A000, v381, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);
      }
      v389 = [MEMORY[0x263F499E0] sharedInstance];
      id v390 = objc_alloc(MEMORY[0x263F499F0]);
      v391 = NSString;
      HMFUptime();
      v393 = objc_msgSend(v391, "stringWithFormat:", @"%.3f", v392 - v377);
      v394 = [NSNumber numberWithBool:v487];
      v395 = [*(id *)v560 domain];
      v396 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)v560, "code"));
      v397 = HMDTaggedLoggingCreateDictionary();
      v398 = objc_msgSend(v390, "initWithTag:data:", @"mainDriverStart", v397, @"state", @"mainDriverSettledDevice", @"duration", v393, @"success", v394, @"errorDomain", v395, @"errorCode", v396);
      v399 = [v505 tagProcessorList];
      [v389 submitTaggedEvent:v398 processorList:v399];

      v400 = (void *)MEMORY[0x230FBD990]();
      id v401 = v380;
      HMFGetOSLogHandle();
      v402 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v403 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v404 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v403;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v404;
        *(_WORD *)&buf[22] = 2112;
        v524 = *(__CFString **)v560;
        _os_log_impl(&dword_22F52A000, v402, OS_LOG_TYPE_DEFAULT, "%{public}@Did current device settle: %@ error: %@", buf, 0x20u);
      }
      v405 = v503[1];
      if (os_signpost_enabled(v405))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F52A000, v405, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AccountDeviceSettled", "", buf, 2u);
      }
    }
    v406 = [v332 metricsManager];
    v407 = [v406 logEventSubmitter];
    v408 = objc_alloc_init(HMDDeviceAccountResolvedLogEvent);
    [v407 submitLogEvent:v408 error:*(void *)v560];

    [v505 markWithReason:@"Creating Accessory Browser"];
    v409 = [[HMDAccessoryBrowser alloc] initWithMessageDispatcher:v502];
    [v332 setAccessoryBrowser:v409];

    v410 = [v332 metricsManager];
    v411 = [MEMORY[0x263F35A00] sharedInstance];
    [v410 configureHAPMetricsDispatcher:v411];

    if (enableRetailDemoSetup || [v498 demoFinalized])
    {
      [v505 markWithReason:@"Loading Demo Mode"];
      v412 = [v332 accessoryBrowser];
      v413 = [v498 demoAccessories];
      objc_msgSend(v412, "configureDemoBrowserWithDemoAccessories:finalized:", v413, objc_msgSend(v498, "demoFinalized"));
    }
    v504 = [MEMORY[0x263EFF8C0] array];
    uint64_t v414 = HMFUptime();
    double v416 = v415;
    v417 = (void *)MEMORY[0x230FBD990](v414);
    id v418 = v332;
    HMFGetOSLogHandle();
    v419 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v419, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v420 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v420;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Initializing Home Manager";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverInitHomeManager";
      _os_log_impl(&dword_22F52A000, v419, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v421 = [MEMORY[0x263F499E0] sharedInstance];
    id v422 = objc_alloc(MEMORY[0x263F499F0]);
    v521 = @"state";
    v522 = @"mainDriverInitHomeManager";
    v423 = [NSDictionary dictionaryWithObjects:&v522 forKeys:&v521 count:1];
    v424 = (void *)[v422 initWithTag:@"mainDriverStart" data:v423];
    v425 = [v505 tagProcessorList];
    [v421 submitTaggedEvent:v424 processorList:v425];

    v426 = [HMDHomeManager alloc];
    v427 = [v418 accessoryBrowser];
    v428 = [v502 messageFilterChain];
    v429 = +[HMDIdentityRegistry sharedRegistry];
    v430 = [v418 metricsManager];
    v431 = [v418 configuringStateController];
    v432 = [v418 appleMediaAccessoryDiagnosticInfoController];
    v433 = [v418 currentAccessorySetupMetricDispatcher];
    v434 = [(HMDHomeManager *)v426 initWithMessageDispatcher:v502 accessoryBrowser:v427 messageFilterChain:v428 homeData:v498 localDataDecryptionFailed:0 identityRegistry:v429 accountRegistry:v494 metricsManager:v430 configuringStateController:v431 diagnosticInfoController:v432 currentAccessorySetupMetricDispatcher:v433 uncommittedTransactions:v504];
    [v418 setHomeManager:v434];

    v435 = (void *)MEMORY[0x230FBD990]();
    id v436 = v418;
    HMFGetOSLogHandle();
    v437 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v437, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v438 = (id)objc_claimAutoreleasedReturnValue();
      v439 = NSString;
      HMFUptime();
      objc_msgSend(v439, "stringWithFormat:", @"%.3f", v440 - v416);
      id v441 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v438;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Initialized Home Manager";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverInitializedHomeManager";
      __int16 v528 = 2114;
      v529 = @"duration";
      __int16 v530 = 2112;
      id v531 = v441;
      _os_log_impl(&dword_22F52A000, v437, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v442 = [MEMORY[0x263F499E0] sharedInstance];
    id v443 = objc_alloc(MEMORY[0x263F499F0]);
    v444 = NSString;
    HMFUptime();
    v446 = objc_msgSend(v444, "stringWithFormat:", @"%.3f", v445 - v416);
    v447 = HMDTaggedLoggingCreateDictionary();
    v448 = objc_msgSend(v443, "initWithTag:data:", @"mainDriverStart", v447, @"state", @"mainDriverInitializedHomeManager", @"duration", v446);
    v449 = [v505 tagProcessorList];
    [v442 submitTaggedEvent:v448 processorList:v449];

    [v505 markWithReason:@"Initialize Presence Monitor"];
    v450 = [HMDIDSActivityMonitorHomeManagerDataSource alloc];
    v451 = [v436 homeManager];
    v452 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v450 initWithHomeManager:v451];

    [v490 setActivityMonitorDataSource:v452];
    int v453 = isInternalBuild();
    if (enableRetailDemoSetup) {
      int v454 = v453;
    }
    else {
      int v454 = 0;
    }
    if (v454 == 1)
    {
      v455 = (void *)MEMORY[0x230FBD990]([v505 markWithReason:@"Creating Retail Demo Mode Request Handler"]);
      id v456 = v436;
      HMFGetOSLogHandle();
      v457 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v457, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v458 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v458;
        _os_log_impl(&dword_22F52A000, v457, OS_LOG_TYPE_INFO, "%{public}@Creating Retail Demo Mode Request Handler", buf, 0xCu);
      }
      v459 = [HMDRetailDemoModeRequestHandler alloc];
      v460 = [v456 homeManager];
      v461 = [(HMDRetailDemoModeRequestHandler *)v459 initWithHomeManager:v460 messageDispatcher:v502 relaunchHandler:v456];
      [v456 setRetailDemoModeRequestHandler:v461];

      v462 = [v456 retailDemoModeRequestHandler];
      [v462 configure];
    }
    uint64_t v463 = HMFUptime();
    uint64_t v465 = v464;
    v466 = (void *)MEMORY[0x230FBD990](v463);
    id v467 = v436;
    HMFGetOSLogHandle();
    v468 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v468, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v469 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v469;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"mainDriverStart";
      *(_WORD *)&buf[22] = 2112;
      v524 = @"Starting Home Manager";
      *(_WORD *)v525 = 2114;
      *(void *)&v525[2] = @"state";
      __int16 v526 = 2112;
      v527 = @"mainDriverStartHomeManager";
      _os_log_impl(&dword_22F52A000, v468, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
    }
    v470 = [MEMORY[0x263F499E0] sharedInstance];
    id v471 = objc_alloc(MEMORY[0x263F499F0]);
    v519 = @"state";
    v520 = @"mainDriverStartHomeManager";
    v472 = [NSDictionary dictionaryWithObjects:&v520 forKeys:&v519 count:1];
    v473 = (void *)[v471 initWithTag:@"mainDriverStart" data:v472];
    v474 = [v505 tagProcessorList];
    [v470 submitTaggedEvent:v473 processorList:v474];

    v475 = [v467 homeManager];
    v506[0] = MEMORY[0x263EF8330];
    v506[1] = 3221225472;
    v506[2] = __22__HMDMainDriver_start__block_invoke_303;
    v506[3] = &unk_264A17250;
    id v507 = v505;
    id v508 = v467;
    uint64_t v514 = v465;
    id v476 = v502;
    id v509 = v476;
    id v477 = v488;
    id v510 = v477;
    id v478 = v493;
    id v511 = v478;
    id v479 = v489;
    id v512 = v479;
    v480 = v452;
    v513 = v480;
    [v475 startWithCompletionHandler:v506];
  }
  else
  {
    out_token[0] = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v524) = 0;
    v297 = (void *)MEMORY[0x230FBD990]();
    v298 = v54;
    HMFGetOSLogHandle();
    v299 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      v300 = HMFGetLogIdentifier();
      *(_DWORD *)v560 = 138543362;
      *(void *)&v560[4] = v300;
      _os_log_impl(&dword_22F52A000, v299, OS_LOG_TYPE_INFO, "%{public}@Can't load data until unlocked -- stopping", v560, 0xCu);
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __22__HMDMainDriver_start__block_invoke_152;
    handler[3] = &unk_264A17A90;
    handler[4] = v298;
    handler[5] = buf;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", out_token, MEMORY[0x263EF83A0], handler);

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __22__HMDMainDriver_start__block_invoke_152(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 32);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = 138543362;
        id v11 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time", (uint8_t *)&v10, 0xCu);
      }
      [*(id *)(a1 + 32) start];
      return notify_cancel(a2);
    }
  }
  return result;
}

void __22__HMDMainDriver_start__block_invoke_303(uint64_t a1)
{
  [*(id *)(a1 + 32) markWithReason:@"Started Home Manager"];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__HMDMainDriver_start__block_invoke_2_307;
  block[3] = &unk_264A17250;
  uint64_t v11 = *(void *)(a1 + 88);
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __22__HMDMainDriver_start__block_invoke_2_307(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  dispatch_time_t v4 = HMFGetOSLogHandle();
  unint64_t v5 = 0x263F08000;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = NSString;
    HMFUptime();
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%.3f", v8 - *(double *)(a1 + 88));
    *(_DWORD *)buf = 138544898;
    v92 = v6;
    __int16 v93 = 2114;
    v94 = @"mainDriverStart";
    __int16 v95 = 2112;
    id v96 = @"Home manager started. Configuring ...";
    __int16 v97 = 2114;
    v98 = @"state";
    __int16 v99 = 2112;
    id v100 = @"mainDriverStartedHomeManager";
    __int16 v101 = 2114;
    double v102 = @"duration";
    __int16 v103 = 2112;
    id v104 = v9;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);

    unint64_t v5 = 0x263F08000uLL;
  }

  id v10 = [MEMORY[0x263F499E0] sharedInstance];
  id v11 = objc_alloc(MEMORY[0x263F499F0]);
  uint64_t v12 = *(void **)(v5 + 2880);
  HMFUptime();
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"%.3f", v13 - *(double *)(a1 + 88));
  id v15 = HMDTaggedLoggingCreateDictionary();
  v16 = objc_msgSend(v11, "initWithTag:data:", @"mainDriverStart", v15, @"state", @"mainDriverStartedHomeManager", @"duration", v14);
  int v17 = [*(id *)(a1 + 40) tagProcessorList];
  [v10 submitTaggedEvent:v16 processorList:v17];

  id v18 = *(void **)(a1 + 48);
  v19 = [*(id *)(a1 + 32) homeManager];
  [v18 configureHomeManager:v19];

  id v20 = *(void **)(a1 + 56);
  uint64_t v21 = [*(id *)(a1 + 32) homeManager];
  v22 = [v21 cloudDataSyncStateFilter];
  uint64_t v23 = [*(id *)(a1 + 32) homeManager];
  [v20 configureWithCloudDataSyncStateFilter:v22 homeMembershipVerifier:v23];

  double v24 = *(void **)(a1 + 56);
  double v25 = [*(id *)(a1 + 32) homeManager];
  v26 = [v25 userDeviceCapabilitiesRequestManager];
  v27 = [*(id *)(a1 + 32) homeManager];
  v28 = [*(id *)(a1 + 32) homeManager];
  [v24 configureWithUserDeviceCapabilitiesRequestManager:v26 deviceResidencyProvider:v27 remoteMessageListener:v28];

  id v29 = [*(id *)(a1 + 32) accessoryBrowser];
  v30 = [*(id *)(a1 + 32) homeManager];
  [v29 configureWithHomeManager:v30];

  id v31 = *(void **)(a1 + 64);
  v32 = [*(id *)(a1 + 32) homeManager];
  [v31 configureWithHomeManager:v32];

  [*(id *)(a1 + 64) refreshHomeBadgeNumber];
  uint64_t v33 = HMFUptime();
  double v35 = v34;
  v36 = (void *)MEMORY[0x230FBD990](v33);
  id v37 = *(id *)(a1 + 32);
  id v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    BOOL v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v92 = v39;
    __int16 v93 = 2114;
    v94 = @"mainDriverStart";
    __int16 v95 = 2112;
    id v96 = @"Starting XPC message transport";
    __int16 v97 = 2114;
    v98 = @"state";
    __int16 v99 = 2112;
    id v100 = @"mainDriverStartXPCTransport";
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  double v40 = [MEMORY[0x263F499E0] sharedInstance];
  id v41 = objc_alloc(MEMORY[0x263F499F0]);
  id v89 = @"state";
  v90 = @"mainDriverStartXPCTransport";
  v42 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
  id v43 = (void *)[v41 initWithTag:@"mainDriverStart" data:v42];
  __int16 v44 = [*(id *)(a1 + 40) tagProcessorList];
  [v40 submitTaggedEvent:v43 processorList:v44];

  [*(id *)(a1 + 72) start];
  double v45 = +[HMDXPCMessageTransport accessorySetupTransport];
  [v45 start];

  uint64_t v46 = (void *)MEMORY[0x230FBD990]();
  id v47 = *(id *)(a1 + 32);
  v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = HMFGetLogIdentifier();
    uint64_t v50 = NSString;
    HMFUptime();
    double v52 = objc_msgSend(v50, "stringWithFormat:", @"%.3f", v51 - v35);
    *(_DWORD *)buf = 138544898;
    v92 = v49;
    __int16 v93 = 2114;
    v94 = @"mainDriverStart";
    __int16 v95 = 2112;
    id v96 = @"Started XPC message transport";
    __int16 v97 = 2114;
    v98 = @"state";
    __int16 v99 = 2112;
    id v100 = @"mainDriverStartXPCTransportDone";
    __int16 v101 = 2114;
    double v102 = @"duration";
    __int16 v103 = 2112;
    id v104 = v52;
    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  v53 = [MEMORY[0x263F499E0] sharedInstance];
  id v54 = objc_alloc(MEMORY[0x263F499F0]);
  v55 = NSString;
  HMFUptime();
  v57 = objc_msgSend(v55, "stringWithFormat:", @"%.3f", v56 - v35);
  id v58 = HMDTaggedLoggingCreateDictionary();
  v59 = objc_msgSend(v54, "initWithTag:data:", @"mainDriverStart", v58, @"state", @"mainDriverStartXPCTransportDone", @"duration", v57);
  v60 = [*(id *)(a1 + 40) tagProcessorList];
  [v53 submitTaggedEvent:v59 processorList:v60];

  v61 = [*(id *)(a1 + 32) metricsManager];
  v62 = [v61 logEventSubmitter];
  id v63 = objc_alloc_init(HMDXPCTransportStartedLogEvent);
  [v62 submitLogEvent:v63];

  v64 = [MEMORY[0x263F42560] memoryMonitor];
  [v64 start];

  [*(id *)(a1 + 80) start];
  v65 = +[HMDIdentityRegistry sharedRegistry];
  v66 = [*(id *)(a1 + 32) homeManager];
  [v65 configureWithHomeManager:v66];

  uint64_t v67 = HMFUptime();
  uint64_t v69 = v68;
  v70 = (void *)MEMORY[0x230FBD990](v67);
  id v71 = *(id *)(a1 + 32);
  id v72 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    v73 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v92 = v73;
    __int16 v93 = 2114;
    v94 = @"mainDriverStart";
    __int16 v95 = 2112;
    id v96 = @"Starting remote message transports";
    __int16 v97 = 2114;
    v98 = @"state";
    __int16 v99 = 2112;
    id v100 = @"mainDriverStartRemoteTransports";
    _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  id v74 = [MEMORY[0x263F499E0] sharedInstance];
  id v75 = objc_alloc(MEMORY[0x263F499F0]);
  v87 = @"state";
  v88 = @"mainDriverStartRemoteTransports";
  double v76 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
  v77 = (void *)[v75 initWithTag:@"mainDriverStart" data:v76];
  v78 = [*(id *)(a1 + 40) tagProcessorList];
  [v74 submitTaggedEvent:v77 processorList:v78];

  v79 = [*(id *)(a1 + 56) start];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __22__HMDMainDriver_start__block_invoke_322;
  v84[3] = &unk_264A15828;
  v80 = *(void **)(a1 + 40);
  v84[4] = *(void *)(a1 + 32);
  uint64_t v86 = v69;
  id v85 = v80;
  v81 = [v79 then:v84];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __22__HMDMainDriver_start__block_invoke_327;
  v83[3] = &unk_264A22E78;
  v83[4] = *(void *)(a1 + 32);
  id v82 = (id)[v81 finally:v83];
}

uint64_t __22__HMDMainDriver_start__block_invoke_322(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v19 = a2;
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = NSString;
    HMFUptime();
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%.3f", v8 - *(double *)(a1 + 48));
    *(_DWORD *)buf = 138544898;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    uint64_t v23 = @"mainDriverStarted";
    __int16 v24 = 2112;
    double v25 = @"Started remote message transports. Started homed.";
    __int16 v26 = 2114;
    v27 = @"state";
    __int16 v28 = 2112;
    id v29 = @"end";
    __int16 v30 = 2114;
    id v31 = @"duration";
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  id v10 = [MEMORY[0x263F499E0] sharedInstance];
  id v11 = objc_alloc(MEMORY[0x263F499F0]);
  uint64_t v12 = NSString;
  HMFUptime();
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"%.3f", v13 - *(double *)(a1 + 48));
  id v15 = HMDTaggedLoggingCreateDictionary();
  v16 = objc_msgSend(v11, "initWithTag:data:", @"mainDriverStarted", v15, @"state", @"end", @"duration", v14);
  int v17 = [*(id *)(a1 + 40) tagProcessorList];
  [v10 submitTaggedEvent:v16 processorList:v17];

  [*(id *)(a1 + 40) invalidate];
  return 1;
}

uint64_t __22__HMDMainDriver_start__block_invoke_327(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 setHasFinishedStartingUp:1];

  id v3 = [*(id *)(a1 + 32) homeManager];
  logAndPostNotification(@"HMDHomeManagerHasFinishedStartingUpNotification", v3, 0);

  return 1;
}

void __22__HMDMainDriver_start__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]);
  id v3 = xdict;
  if (string)
  {
    if (!strcmp(string, "com.apple.home.messaging"))
    {
      id v4 = +[HMDRapportMessaging sharedInstance];
      [v4 configureDiscoveryClientWithCompletion:0];
    }
    BOOL v5 = xpc_dictionary_get_BOOL(xdict, "replyRequired");
    id v3 = xdict;
    if (v5)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(xdict);
      if (reply) {
        xpc_dictionary_send_reply();
      }

      id v3 = xdict;
    }
  }
}

- (void)localeChanged
{
  id v3 = [(HMDMainDriver *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMDMainDriver_localeChanged__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __30__HMDMainDriver_localeChanged__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - clearing followup items before restarting", buf, 0xCu);
  }
  id v6 = +[HMDDeviceSetupManager sharedManager];
  id v7 = [v6 followUpManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__HMDMainDriver_localeChanged__block_invoke_109;
  v8[3] = &unk_264A2ED68;
  v8[4] = *(void *)(a1 + 32);
  [v7 removeAllFollowUpItemsWithCompletion:v8];
}

void __30__HMDMainDriver_localeChanged__block_invoke_109(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - restarting", (uint8_t *)&v9, 0xCu);
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

    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.hmd.mdrv", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50 != -1) {
    dispatch_once(&logCategory__hmf_once_t50, &__block_literal_global_332);
  }
  id v2 = (void *)logCategory__hmf_once_v51;
  return v2;
}

void __28__HMDMainDriver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v51;
  logCategory__hmf_once_double v51 = v0;
}

+ (id)driver
{
  if (driver_onceToken != -1) {
    dispatch_once(&driver_onceToken, &__block_literal_global_8706);
  }
  id v2 = (void *)driver_singletonDriver;
  return v2;
}

void __23__HMDMainDriver_driver__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDMainDriver);
  v1 = (void *)driver_singletonDriver;
  driver_singletonDriver = (uint64_t)v0;
}

- (void)_createCurrentAccessorySetupMetricDispatcher:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[HMDCurrentAccessorySetupMetricDispatcher alloc] initWithDataSource:self setupLogEvent:v9 logEventSubmitter:v10];
  [(HMDMainDriver *)self setCurrentAccessorySetupMetricDispatcher:v11];

  uint64_t v12 = [(HMDMainDriver *)self homeManager];

  double v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      int v17 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting current accessory metric dispatcher for home manager", (uint8_t *)&v21, 0xCu);
    }
    id v18 = [(HMDMainDriver *)v14 currentAccessorySetupMetricDispatcher];
    id v19 = [(HMDMainDriver *)v14 homeManager];
    [v19 setCurrentAccessorySetupMetricDispatcher:v18];
  }
  else
  {
    if (v16)
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v20;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Home manager is not created yet", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4 setupLogEventFactory:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
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
  double v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      int v17 = HMFGetLogIdentifier();
      id v18 = [v12 coreAnalyticsEventDictionary];
      uint64_t v19 = [v12 savedEventState];
      id v20 = @"HH1Initial";
      int v21 = @"Submitted";
      __int16 v22 = @"Unknown";
      if (v19 != 0x10000) {
        __int16 v22 = @"HH1Initial";
      }
      if (v19 != 3) {
        int v21 = v22;
      }
      if (v19 == 2) {
        id v20 = @"HH2Initial";
      }
      if (v19 == 1) {
        id v20 = @"HH2SentinelFetched";
      }
      if (v19 > 2) {
        id v20 = v21;
      }
      uint64_t v23 = v20;
      int v26 = 138543874;
      v27 = v17;
      __int16 v28 = 2112;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Loading saved log event: %@ with event state: %@", (uint8_t *)&v26, 0x20u);
    }
    switch([v12 savedEventState])
    {
      case 0:
      case 2:
        [v12 setSavedEventState:3];
        +[HMDCurrentAccessorySetupMetricDispatcher saveSetupLogEventIntoUserDefaults:v8 setupLogEvent:v12];
        __int16 v24 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3400];
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
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@No saved log event saved before", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4
{
}

- (void)createCurrentAccessorySetupMetricDispatcherForSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  dispatch_queue_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    double v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating current accessory setup metric dispatcher for session: %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [[HMDHomePodSetupLatencyLogEvent alloc] initLogEventWithInitialState:0];
  id v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v11 = +[HMDMetricsManager sharedLogEventSubmitter];
  [(HMDMainDriver *)v6 _createCurrentAccessorySetupMetricDispatcher:v10 setupLogEvent:v9 logEventSubmitter:v11];
}

+ (id)getLocalStoreFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = (id)sqlitePath;
      int v20 = 138543618;
      int v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to use default location : %@", (uint8_t *)&v20, 0x16u);
    }
    id v4 = (id)sqlitePath;
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = HMFGetLogIdentifier();
    int v20 = 138543618;
    int v21 = v13;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Using archive from %@", (uint8_t *)&v20, 0x16u);
  }
  __int16 v14 = [[HMDBackingStoreLocal alloc] initWithDatastore:v4];
  if (!v14)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v11;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v20 = 138543618;
      int v21 = v18;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage from path [%@]", (uint8_t *)&v20, 0x16u);
    }
  }

  return v14;
}

+ (id)loadSQLArchiveWithDecryptionFail:(BOOL *)a3 fromLocation:(id)a4 forHH2Migration:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v68 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Loading Home data from table.", buf, 0xCu);
  }
  double v13 = [(id)objc_opt_class() getLocalStoreFrom:v8];
  id v65 = 0;
  id v66 = 0;
  id v64 = 0;
  int v14 = [v13 _selectArchiveWithIdentifier:@"homedata" archive:&v66 controllerUserName:&v65 error:&v64];
  id v15 = v66;
  id v16 = v65;
  id v17 = v64;

  id v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = v10;
  int v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v68 = v21;
    __int16 v69 = 2112;
    id v70 = v16;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Controller user name : %@", buf, 0x16u);
  }
  if (v15) {
    int v22 = v14;
  }
  else {
    int v22 = 0;
  }
  unint64_t v23 = 0x263F42000;
  if (v22 == 1)
  {
    v60 = v15;
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v19;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      id v28 = v17;
      id v29 = v16;
      id v30 = v8;
      BOOL v31 = v6;
      uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v60, "length"));
      *(_DWORD *)buf = 138543618;
      uint64_t v68 = v27;
      __int16 v69 = 2112;
      id v70 = v32;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded Home data from table size: %@", buf, 0x16u);

      BOOL v6 = v31;
      id v8 = v30;
      id v16 = v29;
      id v17 = v28;
    }
    uint64_t v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = v25;
    double v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Found controller key for loaded home data", buf, 0xCu);
    }
    id v37 = [MEMORY[0x263F35AD0] systemStore];
    [v37 updateActiveControllerPairingIdentifier:v16];

    id v63 = 0;
    id v15 = v60;
    +[HMDPersistentStore deserializeHomeData:&v63 usingLocalStorage:1 fromData:v60 forHH2Migration:v6];
    id v38 = v63;
    if (v38)
    {
      BOOL v39 = v38;
      double v40 = [MEMORY[0x263F42608] sharedPreferences];
      id v41 = [v40 preferenceForKey:@"CreateArchiveShadowCopy"];
      int v42 = [v41 BOOLValue];

      if (v42 && isInternalBuild()) {
        id v43 = +[HMDPersistentStore archiveHomeDataLegacy:v39 toLocation:@"/tmp/legacyhomedatashadow.data"];
      }
    }
    else
    {
      __int16 v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = v34;
      uint64_t v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v68 = v47;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Have home archive in table but could not decrypt. Home archive is corrupt.", buf, 0xCu);
      }
      uint64_t v48 = [MEMORY[0x263F087E8] hmErrorWithCode:2];

      BOOL v39 = 0;
      *a3 = 1;
      id v17 = (id)v48;
    }
    unint64_t v23 = 0x263F42000uLL;
  }
  else
  {
    BOOL v39 = 0;
  }
  v49 = [*(id *)(v23 + 1544) sharedPreferences];
  uint64_t v50 = [v49 preferenceForKey:@"ForceDecryptionFailed"];
  int v51 = [v50 BOOLValue];

  if (v51 && isInternalBuild())
  {
    double v52 = (void *)MEMORY[0x230FBD990]();
    id v53 = v19;
    id v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = v55;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Forcing decryption failed state due to preference.", buf, 0xCu);
    }

    uint64_t v56 = [MEMORY[0x263F087E8] hmErrorWithCode:2];

    BOOL v39 = 0;
    *a3 = 1;
    id v17 = (id)v56;
  }
  id v57 = v17;
  *a6 = v57;
  id v58 = v39;

  return v58;
}

+ (id)loadHomeDataFromDemoModeStore:(id *)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)MEMORY[0x263EFF8F8];
  BOOL v6 = HMDHomeKitDaemonDemoModePersistencePath();
  id v28 = 0;
  id v7 = [v5 dataWithContentsOfURL:v6 options:0 error:&v28];
  id v8 = v28;

  if (v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not read demo accessory data.", buf, 0xCu);
    }
    id v13 = v8;
  }
  else
  {
    int v14 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    id v16 = [v14 setWithArray:v15];

    id v27 = 0;
    id v17 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v16 fromData:v7 error:&v27];
    id v13 = v27;
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    int v20 = HMFGetOSLogHandle();
    int v21 = v20;
    if (v13 || !v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v24;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@No demo accessory data.", buf, 0xCu);
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
        uint64_t v32 = v17;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Decoded demo accessories: %@", buf, 0x16u);
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
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  if (!a3) {
    _HMFPreconditionFailure();
  }
  id v11 = v10;
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
      int v14 = v13;
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v29 = v18;
        __int16 v30 = 2112;
        __int16 v31 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to load the home data from SQL : %@", buf, 0x16u);
      }
      goto LABEL_14;
    }
    if (v27)
    {
LABEL_13:
      id v12 = v12;
      int v14 = 0;
      *a3 = v12;
      goto LABEL_14;
    }
  }
  if (v12) {
    goto LABEL_13;
  }
  id v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = a1;
  int v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v29 = v22;
    __int16 v30 = 2112;
    __int16 v31 = v11;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Since we could not load the keyed archive from SQL table we are going to load it from location: %@", buf, 0x16u);
  }
  id v25 = 0;
  int v14 = +[HMDPersistentStore unarchiveHomeData:&v25 decryptionFailed:&v27 fromLocation:v11 successfulKeyUserName:0 forHH2Migration:v6];
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