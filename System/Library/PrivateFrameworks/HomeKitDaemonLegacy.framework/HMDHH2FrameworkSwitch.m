@interface HMDHH2FrameworkSwitch
+ (id)errorFromHMDCKAccountStatus:(int64_t)a3;
+ (id)logCategory;
+ (void)relaunchHomedAfterSettingEnvironmentTo:(BOOL)a3 blockToExecuteBeforeReLaunch:(id)a4;
+ (void)setHH2EnablementPreferenceKey:(BOOL)a3;
+ (void)setHH2SettingsMigrationKey:(BOOL)a3;
+ (void)switchBackToHH1AndDoNotLaunchDueToPrimaryAccountRemoval;
+ (void)switchBackToHH1AndRelaunch;
+ (void)switchBackToHH1AndRelaunchDueToHH2MigrationFailed;
+ (void)switchToHH2AndRelaunchHomed;
- (BOOL)_areWeRunningInRightEnvironment:(BOOL)a3;
- (BOOL)autoFrameworkSwitch;
- (BOOL)checkExistenceOfHH2SentinelZone;
- (BOOL)isTapToSetupOngoing;
- (BOOL)switchToSetupMode:(unint64_t)a3;
- (BOOL)waitForHH2SentinelZoneToBeCreated:(double)a3 error:(id *)a4;
- (BOOL)waitForHH2SentinelZoneToBeFetchedFromCloud;
- (HMBCloudDatabase)cloudDatabaseToDetectHH2Zone;
- (HMDHH2FrameworkSwitch)initWithAutoSwitch:(BOOL)a3 callBeforeFrameworkSwitch:(id)a4 homeManager:(id)a5 dataSource:(id)a6;
- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3;
- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3 dataSource:(id)a4;
- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 callBeforeFrameworkSwitchCompletionHandler:(id)a4;
- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 dataSource:(id)a4 callBeforeFrameworkSwitchCompletionHandler:(id)a5;
- (HMDHH2FrameworkSwitchDataSource)dataSource;
- (HMDHomeManager)homeManager;
- (NAFuture)fetchSentinelZoneDidFinishFuture;
- (OS_dispatch_queue)workQueue;
- (id)blockToBeCalledBeforeSwitchingFramework;
- (int64_t)areCloudKitServersReachableWithError:(id *)a3;
- (void)_clearSetupModeIfNeeded;
- (void)_makeSureWeAreRunningInRightEnvironment:(BOOL)a3;
- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4;
- (void)createHH2CloudDatabaseAndStartSyncing;
- (void)createHH2SentinelZoneWithCompletionHandler:(id)a3;
- (void)forceFetchSentinelZone;
- (void)handleTapToSetupFinished:(id)a3;
- (void)makeSureWeAreRunningInRightEnvironment:(BOOL)a3;
- (void)performInitialSync:(id)a3;
- (void)performInitialSyncAndSwitchFrameworkIfRequired;
- (void)removeHH2SentinelZoneWithCompletion:(id)a3;
- (void)setAutoFrameworkSwitch:(BOOL)a3;
- (void)setBlockToBeCalledBeforeSwitchingFramework:(id)a3;
- (void)setCloudDatabaseToDetectHH2Zone:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setIsTapToSetupOngoing:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)switchToHH2AfterPerformingHH2PreRebootTask;
- (void)switchToHH2AndRelaunchHomedToPerformHH2Migration;
- (void)waitForCloudKitAccountToBeAvailable;
- (void)waitForHH2SentinelZoneToBeRemoved;
@end

@implementation HMDHH2FrameworkSwitch

- (BOOL)checkExistenceOfHH2SentinelZone
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];
  v5 = [v4 privateZoneIDs];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) zoneID];
        v11 = [v10 zoneName];
        char v12 = [v11 isEqualToString:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (HMBCloudDatabase)cloudDatabaseToDetectHH2Zone
{
  return self->_cloudDatabaseToDetectHH2Zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong(&self->_blockToBeCalledBeforeSwitchingFramework, 0);
  objc_storeStrong((id *)&self->_cloudDatabaseToDetectHH2Zone, 0);
  objc_storeStrong((id *)&self->_fetchSentinelZoneDidFinishFuture, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setDataSource:(id)a3
{
}

- (HMDHH2FrameworkSwitchDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setBlockToBeCalledBeforeSwitchingFramework:(id)a3
{
}

- (id)blockToBeCalledBeforeSwitchingFramework
{
  return self->_blockToBeCalledBeforeSwitchingFramework;
}

- (void)setCloudDatabaseToDetectHH2Zone:(id)a3
{
}

- (void)setIsTapToSetupOngoing:(BOOL)a3
{
  self->_isTapToSetupOngoing = a3;
}

- (BOOL)isTapToSetupOngoing
{
  return self->_isTapToSetupOngoing;
}

- (void)setAutoFrameworkSwitch:(BOOL)a3
{
  self->_autoFrameworkSwitch = a3;
}

- (BOOL)autoFrameworkSwitch
{
  return self->_autoFrameworkSwitch;
}

- (NAFuture)fetchSentinelZoneDidFinishFuture
{
  return self->_fetchSentinelZoneDidFinishFuture;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)handleTapToSetupFinished:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHH2FrameworkSwitch *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDHH2FrameworkSwitch_handleTapToSetupFinished___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDHH2FrameworkSwitch_handleTapToSetupFinished___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"TTSU.error"];

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v12 = 138543618;
    BOOL v13 = v7;
    __int16 v14 = 2112;
    long long v15 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Got TTSU finished notification with error: %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 40);
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    BOOL v13 = v11;
    __int16 v14 = 2112;
    long long v15 = v3;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring TTSU notification as either this is on a non-tvOS device or TTSU finished with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)waitForCloudKitAccountToBeAvailable
{
  v3 = [(HMDHH2FrameworkSwitch *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v14 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Wait for the CloudKit account to be available.", buf, 0xCu);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v6 = (id *)(a1 + 32);
  id v8 = [v7 cloudDatabaseToDetectHH2Zone];
  id v9 = [v8 waitForAccountAvailability];

  objc_initWeak((id *)buf, *v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_133;
  v11[3] = &unk_1E6A10B10;
  v11[4] = *v6;
  objc_copyWeak(&v12, (id *)buf);
  id v10 = (id)[v9 addCompletionBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Looks like CloudKit account is now available. Performing cloud sync. [%@]", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    __int16 v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v12;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error occurred : %@ / %@", buf, 0x20u);
    }
  }
  else
  {
    [WeakRetained _fastBootToHH2IfRequiredForTTSU];
    BOOL v13 = [v12 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_134;
    block[3] = &unk_1E6A19B30;
    block[4] = v12;
    dispatch_async(v13, block);
  }
}

uint64_t __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_134(uint64_t a1)
{
  return [*(id *)(a1 + 32) createHH2CloudDatabaseAndStartSyncing];
}

- (int64_t)areCloudKitServersReachableWithError:(id *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F19ED8]);
  id v6 = (void *)[v5 initWithContainerIdentifier:@"com.apple.homekit.config" environment:cloudKitContainerEnvironment];
  uint64_t v7 = objc_opt_new();
  [v7 setUseZoneWidePCS:1];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v6 options:v7];
  id v9 = dispatch_group_create();
  id v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Waiting to check whether CloudKit is reachable or not... Start", (uint8_t *)&buf, 0xCu);
  }
  dispatch_group_enter(v9);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__125136;
  v87 = __Block_byref_object_dispose__125137;
  id v88 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  uint64_t v79 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __62__HMDHH2FrameworkSwitch_areCloudKitServersReachableWithError___block_invoke;
  v62[3] = &unk_1E6A10AE8;
  v62[4] = v11;
  p_long long buf = &buf;
  v65 = &v76;
  v66 = &v72;
  v67 = &v68;
  __int16 v14 = v9;
  v63 = v14;
  [v8 accountInfoWithCompletionHandler:v62];
  dispatch_time_t v15 = dispatch_time(0, 60000000000);
  intptr_t v16 = dispatch_group_wait(v14, v15);
  BOOL v17 = v16 == 0;
  id v22 = (void *)MEMORY[0x1D9452090](v16, v18, v19, v20, v21);
  __int16 v23 = v11;
  if (!v17)
  {
    HMFGetOSLogHandle();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)v80 = 138543362;
      v81 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Fetching the CK account info operation timed out.", v80, 0xCu);
    }
LABEL_7:
    int64_t v26 = 0;
    goto LABEL_8;
  }
  HMFGetOSLogHandle();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)v80 = 138543362;
    v81 = v29;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Waiting to check whether CloudKit is reachable or not... End", v80, 0xCu);
  }
  uint64_t v35 = v77[3];
  if (!v35 || *(void *)(*((void *)&buf + 1) + 40))
  {
    v36 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
    v37 = v23;
    HMFGetOSLogHandle();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      uint64_t v40 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v80 = 138543618;
      v81 = v39;
      __int16 v82 = 2112;
      uint64_t v83 = v40;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@CK account fetch info resulted into error : %@", v80, 0x16u);
    }
    if (a3)
    {
      int64_t v26 = 0;
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  switch(v35)
  {
    case 1:
      if (*((unsigned char *)v73 + 24)) {
        goto LABEL_19;
      }
      v54 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
      v55 = v23;
      HMFGetOSLogHandle();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = HMFGetLogIdentifier();
        *(_DWORD *)v80 = 138543362;
        v81 = v57;
        _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@CK account status available but need to verify terms", v80, 0xCu);
      }
      goto LABEL_35;
    case 2:
      v41 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
      v42 = v23;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)v80 = 138543362;
        v81 = v44;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@CK account status is restricted", v80, 0xCu);
      }
      int64_t v26 = 2;
      break;
    case 3:
      v45 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
      v46 = v23;
      HMFGetOSLogHandle();
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)v80 = 138543362;
        v81 = v48;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@CK account status is not signed in", v80, 0xCu);
      }
      int64_t v26 = 3;
      break;
    case 4:
      if (*((unsigned char *)v73 + 24))
      {
        BOOL v49 = *((unsigned char *)v69 + 24) == 0;
        v50 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
        v51 = v23;
        if (v49)
        {
          HMFGetOSLogHandle();
          v60 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = HMFGetLogIdentifier();
            *(_DWORD *)v80 = 138543362;
            v81 = v61;
            _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_ERROR, "%{public}@CK account status is temporarily unavailable", v80, 0xCu);
          }
          int64_t v26 = 4;
        }
        else
        {
          HMFGetOSLogHandle();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v53 = HMFGetLogIdentifier();
            *(_DWORD *)v80 = 138543362;
            v81 = v53;
            _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@CK account status is need to verify terms", v80, 0xCu);
          }
          int64_t v26 = 6;
        }
      }
      else
      {
        v54 = (void *)MEMORY[0x1D9452090](v30, v31, v32, v33, v34);
        v58 = v23;
        HMFGetOSLogHandle();
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v59 = HMFGetLogIdentifier();
          *(_DWORD *)v80 = 138543362;
          v81 = v59;
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@CK account status is invalid credentials", v80, 0xCu);
        }
LABEL_35:

        int64_t v26 = 5;
      }
      break;
    default:
LABEL_19:
      int64_t v26 = 1;
      break;
  }
LABEL_8:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&buf, 8);

  return v26;
}

void __62__HMDHH2FrameworkSwitch_areCloudKitServersReachableWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v14 = 138543618;
    dispatch_time_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@CK account fetch info completed with : %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 accountStatus];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v5 hasValidCredentials];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v5 needsToVerifyTerms];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)switchToSetupMode:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDHH2FrameworkSwitch *)self dataSource];
  uint64_t v6 = [v5 setupMode];

  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v20 = 138543874;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 2048;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Switching to setup mode: %lu, current mode: %lu", (uint8_t *)&v20, 0x20u);
  }
  if (v6 == a3 || a3 == 2 && !v6)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v8;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Already in requested setup mode", (uint8_t *)&v20, 0xCu);
    }
    return 1;
  }
  else
  {
    LOBYTE(v20) = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HHTTSUMode", @"com.apple.homed", (Boolean *)&v20);
    if ((_BYTE)v20) {
      BOOL v17 = AppIntegerValue == 0;
    }
    else {
      BOOL v17 = 1;
    }
    char v18 = v17;
    if (a3 != 2 || (v18 & 1) == 0)
    {
      uint64_t v19 = [NSNumber numberWithInteger:a3];
      CFPreferencesSetAppValue(@"HHTTSUMode", v19, @"com.apple.homed");
    }
    [(id)objc_opt_class() relaunchHomedAfterSettingEnvironmentTo:a3 == 1 blockToExecuteBeforeReLaunch:0];
    return 0;
  }
}

- (void)switchToHH2AfterPerformingHH2PreRebootTask
{
  id v3 = objc_opt_class();
  id v4 = [(HMDHH2FrameworkSwitch *)self blockToBeCalledBeforeSwitchingFramework];
  [v3 relaunchHomedAfterSettingEnvironmentTo:1 blockToExecuteBeforeReLaunch:v4];
}

- (void)switchToHH2AndRelaunchHomedToPerformHH2Migration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Switching to HH2 framework and relaunching homed in order to perform HH2 migration", (uint8_t *)&v7, 0xCu);
  }
  [(HMDHH2FrameworkSwitch *)v4 switchToHH2AfterPerformingHH2PreRebootTask];
}

- (void)_clearSetupModeIfNeeded
{
  v2 = [(HMDHH2FrameworkSwitch *)self workQueue];
  dispatch_assert_queue_V2(v2);
}

- (void)removeHH2SentinelZoneWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v34 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to remove HH2 sentinel zone received", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHH2FrameworkSwitch *)v6 cloudDatabaseToDetectHH2Zone];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    int v20 = v6;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v34 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (c)", buf, 0xCu);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    if (v4) {
      v4[2](v4, v13);
    }
  }
  else
  {
    uint64_t v11 = [(HMDHH2FrameworkSwitch *)v6 cloudDatabaseToDetectHH2Zone];
    id v12 = [v11 privateZoneIDs];
    id v13 = objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_125155);

    if (v13)
    {
      int v14 = [(HMDHH2FrameworkSwitch *)v6 cloudDatabaseToDetectHH2Zone];
      dispatch_time_t v15 = [v14 removePrivateZoneWithID:v13];

      objc_initWeak((id *)buf, v6);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_106;
      v30[3] = &unk_1E6A109E0;
      objc_copyWeak(&v32, (id *)buf);
      __int16 v16 = v4;
      uint64_t v31 = v16;
      id v17 = (id)[v15 addSuccessBlock:v30];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_110;
      v27[3] = &unk_1E6A16F80;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v16;
      id v18 = (id)[v15 addFailureBlock:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      unint64_t v23 = (void *)MEMORY[0x1D9452090]();
      __int16 v24 = v6;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v34 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@HH2 Sentinel zone does not exist", buf, 0xCu);
      }
      dispatch_time_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
      if (v4) {
        v4[2](v4, v15);
      }
    }
  }
}

void __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    _HMFPreconditionFailure();
  }
  id v5 = WeakRetained;
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = v5;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removed successfully.", (uint8_t *)&v11, 0xCu);
  }
  [v7 waitForCloudKitAccountToBeAvailable];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
}

void __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    _HMFPreconditionFailure();
  }
  id v5 = WeakRetained;
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = v5;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to delete HH2 sentinel zone from cloud database.", (uint8_t *)&v11, 0xCu);
  }
  [v7 waitForCloudKitAccountToBeAvailable];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

uint64_t __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 zoneID];
  id v3 = [v2 zoneName];
  uint64_t v4 = [v3 isEqualToString:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"];

  return v4;
}

- (void)waitForHH2SentinelZoneToBeRemoved
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeRemoved__block_invoke;
  v5[3] = &unk_1E6A196E0;
  v5[4] = self;
  uint64_t v6 = v3;
  uint64_t v4 = v3;
  [(HMDHH2FrameworkSwitch *)self removeHH2SentinelZoneWithCompletion:v5];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __58__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeRemoved__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removal status : %@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_areWeRunningInRightEnvironment:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDHH2FrameworkSwitch *)self dataSource];
  if (v5)
  {
    int v6 = a3 || [(HMDHH2FrameworkSwitch *)self checkExistenceOfHH2SentinelZone];
    int v8 = [v5 isHH2Enabled];
    unint64_t v9 = [v5 setupMode];
    __int16 v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = HMFBooleanToString();
      dispatch_time_t v15 = HMFBooleanToString();
      int v24 = v6;
      if (v9 > 2) {
        __int16 v16 = @"Unexpected mode read";
      }
      else {
        __int16 v16 = off_1E6A0B8F8[v9];
      }
      id v17 = v16;
      *(_DWORD *)long long buf = 138544130;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to check our current environment: [doesSentinelZoneExist = %@] [current User HK Preference = %@] [setupMode = %@]", buf, 0x2Au);

      int v6 = v24;
    }

    int v18 = v8 ^ 1;
    if (v9 != 1) {
      int v18 = 1;
    }
    BOOL v7 = 1;
    if (v18 == 1 && v6 != v8)
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      int v20 = v11;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v26 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Looks like we are in wrong world. Let's make things right.", buf, 0xCu);
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_makeSureWeAreRunningInRightEnvironment:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDHH2FrameworkSwitch *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDHH2FrameworkSwitch *)self autoFrameworkSwitch])
  {
    int v6 = [(HMDHH2FrameworkSwitch *)self homeManager];
    if (![(HMDHH2FrameworkSwitch *)self _areWeRunningInRightEnvironment:v3])
    {
      if (v3 || [(HMDHH2FrameworkSwitch *)self checkExistenceOfHH2SentinelZone])
      {
        BOOL v7 = (void *)MEMORY[0x1D9452090]();
        int v8 = self;
        unint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          __int16 v10 = HMFGetLogIdentifier();
          int v20 = 138543362;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sentinel zone exist which mean we should be running HH2 world. Relaunching ourselves in HH2 world", (uint8_t *)&v20, 0xCu);
        }
        logger = v8->_logger;
        if (os_signpost_enabled(logger))
        {
          LOWORD(v20) = 0;
          _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReadyToSwitchToHH2", "", (uint8_t *)&v20, 2u);
        }
        uint64_t v12 = [v6 currentAccessorySetupMetricDispatcher];
        [v12 markSetupEndStage:9 error:0];

        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      int v18 = objc_opt_class();
      uint64_t v19 = [(HMDHH2FrameworkSwitch *)self blockToBeCalledBeforeSwitchingFramework];
      [v18 relaunchHomedAfterSettingEnvironmentTo:v13 blockToExecuteBeforeReLaunch:v19];
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    dispatch_time_t v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Not enforcing HK environment as auto-switch is OFF", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)makeSureWeAreRunningInRightEnvironment:(BOOL)a3
{
  id v5 = [(HMDHH2FrameworkSwitch *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__HMDHH2FrameworkSwitch_makeSureWeAreRunningInRightEnvironment___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __64__HMDHH2FrameworkSwitch_makeSureWeAreRunningInRightEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makeSureWeAreRunningInRightEnvironment:*(unsigned __int8 *)(a1 + 40)];
}

- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 zoneID];
  unint64_t v9 = [v8 zoneName];
  int v10 = [v9 isEqualToString:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      int v18 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@created / synced HH2 sentinel zone", buf, 0xCu);
    }
    dispatch_time_t v15 = [(HMDHH2FrameworkSwitch *)v12 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMDHH2FrameworkSwitch_cloudDatabase_didCreateZoneWithID___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = v12;
    dispatch_async(v15, block);
  }
}

void __59__HMDHH2FrameworkSwitch_cloudDatabase_didCreateZoneWithID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearSetupModeIfNeeded];
  [*(id *)(a1 + 32) _makeSureWeAreRunningInRightEnvironment:1];
  v2 = *(void **)(a1 + 32);
  logAndPostNotification(@"HMDHomeManagerHH2SentinelZonePresent", v2, 0);
}

- (BOOL)waitForHH2SentinelZoneToBeCreated:(double)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D9452090](self, a2);
  int v8 = self;
  unint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Going to create sentinel Zone", (uint8_t *)&buf, 0xCu);
  }
  id v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__125136;
  v46 = __Block_byref_object_dispose__125137;
  id v47 = 0;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  uint64_t v35 = __65__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeCreated_error___block_invoke;
  v36 = &unk_1E6A10A30;
  uint64_t v12 = v11;
  v37 = v12;
  p_long long buf = &buf;
  [(HMDHH2FrameworkSwitch *)v8 createHH2SentinelZoneWithCompletionHandler:&v33];
  dispatch_time_t v13 = dispatch_time(0, (unint64_t)a3);
  intptr_t v14 = dispatch_group_wait(v12, v13);
  if (v14)
  {
    int v18 = (void *)MEMORY[0x1D9452090](v14, v15, v16, v17);
    uint64_t v19 = v8;
    HMFGetOSLogHandle();
    int v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)v39 = 138543362;
      uint64_t v40 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Timed out while creating the HH2 sentinel zone.", v39, 0xCu);
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hmErrorWithCode:", 8, v33, v34, v35, v36);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      BOOL v29 = 0;
      *a4 = v22;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  BOOL v23 = *(void *)(*((void *)&buf + 1) + 40) == 0;
  int v24 = (void *)MEMORY[0x1D9452090](0, v15, v16, v17);
  uint64_t v25 = v8;
  if (!v23)
  {
    HMFGetOSLogHandle();
    uint64_t v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v39 = 138543618;
      uint64_t v40 = v27;
      __int16 v41 = 2112;
      uint64_t v42 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to create Sentinel zone due to %@", v39, 0x16u);
    }
    if (a4)
    {
      id v22 = *(id *)(*((void *)&buf + 1) + 40);
      goto LABEL_13;
    }
LABEL_14:
    BOOL v29 = 0;
    goto LABEL_18;
  }
  HMFGetOSLogHandle();
  uint64_t v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    *(_DWORD *)v39 = 138543362;
    uint64_t v40 = v31;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully created sentinel Zone", v39, 0xCu);
  }
  BOOL v29 = 1;
LABEL_18:

  _Block_object_dispose(&buf, 8);
  return v29;
}

void __65__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeCreated_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)createHH2SentinelZoneWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A320]);
    id v7 = (void *)[v6 initWithZoneName:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71" ownerName:*MEMORY[0x1E4F19C08]];
    id v8 = objc_alloc(MEMORY[0x1E4F69E58]);
    unint64_t v9 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];
    int v10 = [v9 containerID];
    id v11 = (void *)[v8 initWithContainerID:v10 scope:2 zoneID:v7];

    uint64_t v12 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];
    dispatch_time_t v13 = [v12 createPrivateZoneWithID:v11];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E6A10A08;
    id v14 = v4;
    id v24 = v14;
    id v15 = (id)[v13 addSuccessBlock:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E6A19358;
    id v22 = v14;
    id v16 = (id)[v13 addFailureBlock:v21];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (b)", buf, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

uint64_t __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performInitialSync:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];

  if (v5)
  {
    id v6 = [(HMDHH2FrameworkSwitch *)self cloudDatabaseToDetectHH2Zone];
    id v7 = [v6 performInitialCloudSync];

    objc_initWeak(location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke;
    v18[3] = &unk_1E6A109E0;
    objc_copyWeak(&v20, location);
    id v8 = v4;
    id v19 = v8;
    id v9 = (id)[v7 addSuccessBlock:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke_104;
    v15[3] = &unk_1E6A16F80;
    objc_copyWeak(&v17, location);
    id v16 = v8;
    id v10 = (id)[v7 addFailureBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    dispatch_time_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (a)", (uint8_t *)location, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

void __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Initial cloud sync finished on HH2 cloud database.", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

void __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to perform initial sync on cloud database to determine sentinel zone.", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (BOOL)waitForHH2SentinelZoneToBeFetchedFromCloud
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = dispatch_group_create();
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Waiting for Initial sync to finish... Start", buf, 0xCu);
  }
  dispatch_group_enter(v3);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeFetchedFromCloud__block_invoke;
  v24[3] = &unk_1E6A196E0;
  v24[4] = v5;
  id v8 = v3;
  uint64_t v25 = v8;
  [(HMDHH2FrameworkSwitch *)v5 performInitialSync:v24];
  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  intptr_t v10 = dispatch_group_wait(v8, v9);
  id v15 = (void *)MEMORY[0x1D9452090](v10, v11, v12, v13, v14);
  id v16 = v5;
  id v17 = HMFGetOSLogHandle();
  int v18 = v17;
  if (v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v19;
      id v20 = "%{public}@Could not finish initial sync and timed out.";
      uint64_t v21 = v18;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v21, v22, v20, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v27 = v19;
    id v20 = "%{public}@Waiting for Initial sync to finish... End";
    uint64_t v21 = v18;
    os_log_type_t v22 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  return v10 == 0;
}

void __67__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeFetchedFromCloud__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    dispatch_time_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removal status : %@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)forceFetchSentinelZone
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Force fetching sentinel zone", buf, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1A320]);
  int v8 = (void *)[v7 initWithZoneName:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71" ownerName:*MEMORY[0x1E4F19C08]];
  id v9 = objc_alloc(MEMORY[0x1E4F69E58]);
  __int16 v10 = [(HMDHH2FrameworkSwitch *)v4 cloudDatabaseToDetectHH2Zone];
  id v11 = [v10 containerID];
  uint64_t v12 = (void *)[v9 initWithContainerID:v11 scope:2 zoneID:v8];

  uint64_t v13 = [(HMDHH2FrameworkSwitch *)v4 cloudDatabaseToDetectHH2Zone];
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  id v15 = [v13 synchronizeZoneStateForZoneIDs:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__HMDHH2FrameworkSwitch_forceFetchSentinelZone__block_invoke;
  v17[3] = &unk_1E6A17A30;
  v17[4] = v4;
  id v16 = (id)[v15 addCompletionBlock:v17];
}

void __47__HMDHH2FrameworkSwitch_forceFetchSentinelZone__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Force fetch sentinel zone on HH1 container finished with error: %@", (uint8_t *)&v14, 0x16u);
  }
  [*(id *)(a1 + 32) makeSureWeAreRunningInRightEnvironment:0];
  if (v5)
  {
    id v11 = [*(id *)(a1 + 32) fetchSentinelZoneDidFinishFuture];
    [v11 finishWithNoResult];
  }
  if (v6)
  {
    uint64_t v12 = [*(id *)(a1 + 32) homeManager];
    uint64_t v13 = [v12 currentAccessorySetupMetricDispatcher];
    [v13 markSetupEndStage:9 error:v6];
  }
}

- (void)performInitialSyncAndSwitchFrameworkIfRequired
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke;
  v2[3] = &unk_1E6A197F0;
  v2[4] = self;
  [(HMDHH2FrameworkSwitch *)self performInitialSync:v2];
}

void __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial sync on HH1 container finished with error: %@", buf, 0x16u);
  }
  if (v3)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not perform initial sync : %@", buf, 0x16u);
    }
    uint64_t v12 = [v3 domain];
    int v13 = HMFEqualObjects();

    if (v13 && [v3 code] == 1)
    {
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      id v15 = [*(id *)(a1 + 32) workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke_96;
      block[3] = &unk_1E6A19B30;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v14, v15, block);
    }
    else
    {
      [*(id *)(a1 + 32) waitForCloudKitAccountToBeAvailable];
    }
    __int16 v16 = [*(id *)(a1 + 32) homeManager];
    id v17 = [v16 currentAccessorySetupMetricDispatcher];
    [v17 markSetupEndStage:9 error:v3];
  }
  else if ([*(id *)(a1 + 32) autoFrameworkSwitch])
  {
    [*(id *)(a1 + 32) forceFetchSentinelZone];
  }
}

uint64_t __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke_96(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForCloudKitAccountToBeAvailable];
}

- (void)createHH2CloudDatabaseAndStartSyncing
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    [(HMDHH2FrameworkSwitch *)v4 autoFrameworkSwitch];
    id v7 = HMFBooleanToString();
    int v22 = 138543618;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating the Cloud database to detect HH2 cloud zone & will start sync after that. [Auto Switch: %@]", (uint8_t *)&v22, 0x16u);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F19ED8]);
  id v9 = (void *)[v8 initWithContainerIdentifier:@"com.apple.willow.config" environment:cloudKitContainerEnvironment];
  __int16 v10 = [(HMDHH2FrameworkSwitch *)v4 dataSource];
  id v11 = [v10 controller:v4 cloudDatabaseWithContainerID:v9];

  if (v11)
  {
    [(HMDHH2FrameworkSwitch *)v4 setCloudDatabaseToDetectHH2Zone:v11];
    uint64_t v12 = [(HMDHH2FrameworkSwitch *)v4 cloudDatabaseToDetectHH2Zone];
    [v12 setDelegate:v4];

    int v13 = [(HMDHH2FrameworkSwitch *)v4 cloudDatabaseToDetectHH2Zone];
    id v14 = (id)[v13 registerPrivateSubscriptionForExternalRecordType:0];

    [(HMDHH2FrameworkSwitch *)v4 performInitialSyncAndSwitchFrameworkIfRequired];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = v4;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_FAULT, "%{public}@Failed to create cloud database with containerID %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2 reason:@"Failed to create cloud database"];
    uint64_t v20 = [(HMDHH2FrameworkSwitch *)v16 homeManager];
    __int16 v21 = [v20 currentAccessorySetupMetricDispatcher];
    [v21 markSetupEndStage:9 error:v19];
  }
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitch:(BOOL)a3 callBeforeFrameworkSwitch:(id)a4 homeManager:(id)a5 dataSource:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (HMDHH2FrameworkSwitchDefaultDataSource *)a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDHH2FrameworkSwitch;
  int v13 = [(HMDHH2FrameworkSwitch *)&v28 init];
  if (v13)
  {
    uint64_t v14 = HMFGetOSLogHandle();
    logger = v13->_logger;
    v13->_logger = (OS_os_log *)v14;

    v13->_autoFrameworkSwitch = a3;
    objc_storeWeak((id *)&v13->_homeManager, v11);
    __int16 v16 = v12;
    if (!v12) {
      __int16 v16 = objc_alloc_init(HMDHH2FrameworkSwitchDefaultDataSource);
    }
    objc_storeStrong((id *)&v13->_dataSource, v16);
    if (!v12) {

    }
    id v17 = _Block_copy(v10);
    id blockToBeCalledBeforeSwitchingFramework = v13->_blockToBeCalledBeforeSwitchingFramework;
    v13->_id blockToBeCalledBeforeSwitchingFramework = v17;

    HMDispatchQueueNameString();
    id v19 = objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (const char *)[v19 UTF8String];
    __int16 v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v22;

    __int16 v24 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    fetchSentinelZoneDidFinishFuture = v13->_fetchSentinelZoneDidFinishFuture;
    v13->_fetchSentinelZoneDidFinishFuture = v24;

    if (v11)
    {
      uint64_t v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v26 addObserver:v13 selector:sel_handleTapToSetupFinished_ name:@"TTSU.Finished.NotificationKey" object:0];
    }
    [(HMDHH2FrameworkSwitch *)v13 createHH2CloudDatabaseAndStartSyncing];
  }

  return v13;
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3 dataSource:(id)a4
{
  return [(HMDHH2FrameworkSwitch *)self initWithAutoSwitch:0 callBeforeFrameworkSwitch:0 homeManager:a3 dataSource:a4];
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3
{
  return [(HMDHH2FrameworkSwitch *)self initWithAutoSwitch:0 callBeforeFrameworkSwitch:0 homeManager:a3 dataSource:0];
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 callBeforeFrameworkSwitchCompletionHandler:(id)a4
{
  return [(HMDHH2FrameworkSwitch *)self initWithAutoSwitch:1 callBeforeFrameworkSwitch:a4 homeManager:a3 dataSource:0];
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 dataSource:(id)a4 callBeforeFrameworkSwitchCompletionHandler:(id)a5
{
  return [(HMDHH2FrameworkSwitch *)self initWithAutoSwitch:1 callBeforeFrameworkSwitch:a5 homeManager:a3 dataSource:a4];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t45_125218 != -1) {
    dispatch_once(&logCategory__hmf_once_t45_125218, &__block_literal_global_126);
  }
  v2 = (void *)logCategory__hmf_once_v46_125219;
  return v2;
}

uint64_t __36__HMDHH2FrameworkSwitch_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v46_125219;
  logCategory__hmf_once_v46_125219 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)errorFromHMDCKAccountStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hmPrivateErrorWithCode:", qword_1D54D3FC8[a3 - 2], v3);
  }
  return v5;
}

+ (void)switchToHH2AndRelaunchHomed
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = a1;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Switching to HH2 framework and relaunching homed", (uint8_t *)&v7, 0xCu);
  }
  [(id)objc_opt_class() relaunchHomedAfterSettingEnvironmentTo:1 blockToExecuteBeforeReLaunch:0];
}

+ (void)switchBackToHH1AndRelaunch
{
  [(id)objc_opt_class() setHH2SettingsMigrationKey:0];
  v2 = objc_opt_class();
  [v2 relaunchHomedAfterSettingEnvironmentTo:0 blockToExecuteBeforeReLaunch:0];
}

+ (void)switchBackToHH1AndRelaunchDueToHH2MigrationFailed
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = a1;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Switching back to HK 1.0 framework as migration to HH2 failed", (uint8_t *)&v7, 0xCu);
  }
  [(id)objc_opt_class() switchBackToHH1AndRelaunch];
}

+ (void)switchBackToHH1AndDoNotLaunchDueToPrimaryAccountRemoval
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = a1;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Switching back to HK 1.0 framework as primary account got removed. HomeKitDaemon will not be relaunched.", (uint8_t *)&v7, 0xCu);
  }
  [(id)objc_opt_class() setHH2EnablementPreferenceKey:0];
  [(id)objc_opt_class() setHH2SettingsMigrationKey:0];
}

+ (void)relaunchHomedAfterSettingEnvironmentTo:(BOOL)a3 blockToExecuteBeforeReLaunch:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = (void *)v10;
    uint64_t v12 = @"HH1";
    if (v4) {
      uint64_t v12 = @"HH2";
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Going to relaunch homed in : [%@]", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke;
  aBlock[3] = &__block_descriptor_41_e5_v8__0l;
  aBlock[4] = v8;
  BOOL v29 = v4;
  int v13 = _Block_copy(aBlock);
  uint64_t v14 = v13;
  if (v6)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v8;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = (__CFString *)_Block_copy(v6);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = (uint64_t)v18;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Calling block : %@", buf, 0x16u);
    }
    uint64_t v20 = dispatch_get_global_queue(0, 0);
    __int16 v21 = (void *)[objc_alloc(MEMORY[0x1E4F65420]) initWithQueue:v20];
    dispatch_queue_t v22 = v6[2](v6);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_121;
    v26[3] = &unk_1E6A10A98;
    id v27 = v14;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2_123;
    v24[3] = &unk_1E6A10AC0;
    id v25 = v27;
    id v23 = (id)[v22 inContext:v21 then:v26 orRecover:v24];
  }
  else
  {
    (*((void (**)(void *))v13 + 2))(v13);
  }
}

void __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2;
  v4[3] = &__block_descriptor_41_e5_v8__0l;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_after(v2, v3, v4);
}

uint64_t __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_121(uint64_t a1)
{
  return 1;
}

uint64_t __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2_123(uint64_t a1)
{
  return 1;
}

void __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() setHH2EnablementPreferenceKey:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](v2);
  id v4 = *(id *)(a1 + 32);
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@See you on the other side - restarting...", (uint8_t *)&v8, 0xCu);
  }
  int v7 = +[HMDMainDriver driver];
  [v7 relaunch];
}

+ (void)setHH2SettingsMigrationKey:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v6 = a1;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = HMFBooleanToString();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting HH2 settings migration key to %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v10 setBool:v3 forKey:@"mi.hh2"];
}

+ (void)setHH2EnablementPreferenceKey:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v6 = a1;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = HMFBooleanToString();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting HH2 preference value to %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v10 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"isHH2Enabled", *v10, @"com.apple.homed");
}

@end