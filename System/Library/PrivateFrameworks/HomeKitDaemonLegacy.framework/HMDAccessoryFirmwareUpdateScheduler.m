@interface HMDAccessoryFirmwareUpdateScheduler
+ (id)logCategory;
- (BOOL)isIdle;
- (BOOL)isStagingInProgress;
- (BOOL)needsToScheduleApply;
- (BOOL)needsToScheduleRegister;
- (BOOL)needsToScheduleStaging;
- (BOOL)needsToStop;
- (HMDAccessoryFirmwareUpdatePolicy)updatePolicy;
- (HMDAccessoryFirmwareUpdateProfile)updateProfile;
- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 wingman:(id)a5 workQueue:(id)a6;
- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5;
- (HMDAccessoryFirmwareUpdateSchedulerWingman)wingman;
- (HMDAccessoryFirmwareUpdateSession)updateSession;
- (HMDAccessoryFirmwareUpdateTask)currentTask;
- (HMDHAPAccessory)accessory;
- (HMFTimer)deferCheckTimer;
- (HMFTimer)initialDelayTimer;
- (NSBackgroundActivityScheduler)backgroundScheduler;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)activityCompletion;
- (id)logIdentifier;
- (id)privateDescription;
- (int64_t)currentState;
- (void)_createUpdatePolicy;
- (void)_defer;
- (void)_handleSchedulingConditionChanged;
- (void)_invalidateExistingScheduling;
- (void)_logDebugStates:(const char *)a3;
- (void)_registerForNotifications;
- (void)_removeUpdatePolicy;
- (void)_scheduleCurrentTask;
- (void)_scheduleCurrentTaskBackgroundRun;
- (void)_startDeferCheckTimer;
- (void)_startTaskInitialDelayTimer;
- (void)_stop;
- (void)_stopDeferCheckTimer;
- (void)_stopInitialDelayTimer;
- (void)_taskCanRunInCurrentDevice:(id)a3;
- (void)dealloc;
- (void)handleAccessoryReachabilityChanged:(id)a3;
- (void)handleApplyNotReadyReasonsChanged:(id)a3;
- (void)handleBridgeUpdate:(id)a3;
- (void)handlePolicyStatusChange:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)handleStagingNotReadyReasonsChanged:(id)a3;
- (void)handleUpdateStateChanged:(id)a3;
- (void)removeUpdatePolicy;
- (void)scheduleWithDelay:(BOOL)a3;
- (void)setActivityCompletion:(id)a3;
- (void)setBackgroundScheduler:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentTask:(id)a3;
- (void)setDeferCheckTimer:(id)a3;
- (void)setInitialDelayTimer:(id)a3;
- (void)setUpdatePolicy:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePolicy, 0);
  objc_storeStrong((id *)&self->_deferCheckTimer, 0);
  objc_storeStrong(&self->_activityCompletion, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_initialDelayTimer, 0);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_destroyWeak((id *)&self->_updateSession);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
}

- (void)setUpdatePolicy:(id)a3
{
}

- (HMDAccessoryFirmwareUpdatePolicy)updatePolicy
{
  return self->_updatePolicy;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setDeferCheckTimer:(id)a3
{
}

- (HMFTimer)deferCheckTimer
{
  return self->_deferCheckTimer;
}

- (void)setActivityCompletion:(id)a3
{
}

- (id)activityCompletion
{
  return self->_activityCompletion;
}

- (void)setBackgroundScheduler:(id)a3
{
}

- (NSBackgroundActivityScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (void)setInitialDelayTimer:(id)a3
{
}

- (HMFTimer)initialDelayTimer
{
  return self->_initialDelayTimer;
}

- (HMDAccessoryFirmwareUpdateSchedulerWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateSchedulerWingman *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAccessoryFirmwareUpdateSession)updateSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateSession);
  return (HMDAccessoryFirmwareUpdateSession *)WeakRetained;
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentTask:(id)a3
{
}

- (HMDAccessoryFirmwareUpdateTask)currentTask
{
  return self->_currentTask;
}

- (void)handleBridgeUpdate:(id)a3
{
  v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessoryFirmwareUpdateScheduler_handleBridgeUpdate___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __58__HMDAccessoryFirmwareUpdateScheduler_handleBridgeUpdate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) updateSession];
  uint64_t v3 = [v2 sessionState];

  if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Bridge update received; rescheduling...",
        (uint8_t *)&v8,
        0xCu);
    }
    [*(id *)(a1 + 32) _removeUpdatePolicy];
    [*(id *)(a1 + 32) scheduleWithDelay:0];
  }
}

- (void)_removeUpdatePolicy
{
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self updatePolicy];

  if (v3)
  {
    v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    id v5 = [v4 notificationCenter];
    [v5 removeObserver:self name:@"HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification" object:0];

    [(HMDAccessoryFirmwareUpdateScheduler *)self setUpdatePolicy:0];
  }
}

- (void)_createUpdatePolicy
{
  [(HMDAccessoryFirmwareUpdateScheduler *)self _removeUpdatePolicy];
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
  v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateSession];
  uint64_t v6 = [v5 sessionState];
  v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  int v8 = [v3 policyForAccessory:v4 sessionState:v6 workQueue:v7];
  [(HMDAccessoryFirmwareUpdateScheduler *)self setUpdatePolicy:v8];

  v9 = [(HMDAccessoryFirmwareUpdateScheduler *)self updatePolicy];

  if (v9)
  {
    id v12 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    uint64_t v10 = [v12 notificationCenter];
    v11 = [(HMDAccessoryFirmwareUpdateScheduler *)self updatePolicy];
    [v10 addObserver:self selector:sel_handlePolicyStatusChange_ name:@"HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification" object:v11];
  }
}

- (void)handlePolicyStatusChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAccessoryFirmwareUpdateScheduler_handlePolicyStatusChange___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDAccessoryFirmwareUpdateScheduler_handlePolicyStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  objc_msgSend(v2, "hmf_BOOLForKey:", @"HMDAccessoryFirmwareUpdatePolicyStatusChangedKey");

  uint64_t v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = HMFBooleanToString();
    id v8 = [*(id *)(a1 + 40) updateSession];
    uint64_t v9 = [v8 sessionState];
    if ((unint64_t)(v9 - 1) > 2) {
      uint64_t v10 = @"Up-To-Date";
    }
    else {
      uint64_t v10 = off_1E6A10920[v9 - 1];
    }
    v11 = v10;
    int v14 = 138543874;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Policy status - %@, Session State - %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [*(id *)(a1 + 40) updateSession];
  if ([v12 sessionState] == 2)
  {
    uint64_t v13 = [*(id *)(a1 + 40) currentState];

    if (!v13) {
      [*(id *)(a1 + 40) scheduleWithDelay:0];
    }
  }
  else
  {
  }
}

- (void)removeUpdatePolicy
{
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDAccessoryFirmwareUpdateScheduler_removeUpdatePolicy__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __57__HMDAccessoryFirmwareUpdateScheduler_removeUpdatePolicy__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeUpdatePolicy];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self initialDelayTimer];

  if (v6 == v4)
  {
    [(HMDAccessoryFirmwareUpdateScheduler *)self _scheduleCurrentTaskBackgroundRun];
  }
  else
  {
    id v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self deferCheckTimer];
    if (v7 == v4)
    {
      id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self backgroundScheduler];
      int v9 = [v8 shouldDefer];

      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x1D9452090]();
        v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          int v14 = 138543362;
          v15 = v13;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@System condition is no longer conducive to running scheduled task", (uint8_t *)&v14, 0xCu);
        }
        [(HMDAccessoryFirmwareUpdateScheduler *)v11 _defer];
      }
    }
    else
    {
    }
  }
}

- (void)_stopInitialDelayTimer
{
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self initialDelayTimer];
  [v4 suspend];

  [(HMDAccessoryFirmwareUpdateScheduler *)self setInitialDelayTimer:0];
}

- (void)_startTaskInitialDelayTimer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 currentTask];
    int v16 = 138543618;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting initial delay timer for task %@", (uint8_t *)&v16, 0x16u);
  }
  int v9 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 wingman];
  uint64_t v10 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 currentTask];
  [v10 initialDelay];
  v11 = objc_msgSend(v9, "newInitialDelayTimerWithDelay:options:", 1);
  [(HMDAccessoryFirmwareUpdateScheduler *)v5 setInitialDelayTimer:v11];

  id v12 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 initialDelayTimer];
  [v12 setDelegate:v5];

  uint64_t v13 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 workQueue];
  int v14 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 initialDelayTimer];
  [v14 setDelegateQueue:v13];

  v15 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 initialDelayTimer];
  [v15 resume];
}

- (void)_stopDeferCheckTimer
{
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self deferCheckTimer];
  [v4 suspend];

  [(HMDAccessoryFirmwareUpdateScheduler *)self setDeferCheckTimer:0];
}

- (void)_startDeferCheckTimer
{
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:5 options:10000.0];
  [(HMDAccessoryFirmwareUpdateScheduler *)self setDeferCheckTimer:v4];

  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self deferCheckTimer];
  [v5 setDelegate:self];

  id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  id v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self deferCheckTimer];
  [v7 setDelegateQueue:v6];

  id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self deferCheckTimer];
  [v8 resume];
}

- (void)_logDebugStates:(const char *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateProfile];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  v34 = v6;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v31 = HMFGetLogIdentifier();
    v32 = a3;
    uint64_t v10 = [NSString stringWithUTF8String:a3];
    [v6 stagingNotReadyReasons];
    v11 = HAPStagingNotReadyReasonsAsString();
    [v6 updateNotReadyReasons];
    id v12 = HAPUpdateNotReadyReasonsAsString();
    [v6 updateState];
    uint64_t v13 = HAPFirmwareUpdateStateAsString();
    int v14 = [(HMDAccessoryFirmwareUpdateScheduler *)v8 updateSession];
    uint64_t v15 = [v14 sessionState];
    if ((unint64_t)(v15 - 1) > 2) {
      int v16 = @"Up-To-Date";
    }
    else {
      int v16 = off_1E6A10920[v15 - 1];
    }
    v17 = v16;
    uint64_t v18 = [(HMDAccessoryFirmwareUpdateScheduler *)v8 currentState];
    if ((unint64_t)(v18 - 1) > 2) {
      v19 = @"Idle";
    }
    else {
      v19 = off_1E6A0C900[v18 - 1];
    }
    *(_DWORD *)buf = 138544898;
    v36 = v31;
    __int16 v37 = 2112;
    v38 = v10;
    __int16 v39 = 2114;
    v40 = v11;
    __int16 v41 = 2114;
    v42 = v12;
    __int16 v43 = 2112;
    v44 = v13;
    __int16 v45 = 2112;
    v46 = v17;
    __int16 v47 = 2112;
    v48 = v19;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@: Staging Not Ready Reasons = %{public}@, Apply Not Ready Reasons = %{public}@, Accessory State = %@, Session State = %@, Scheduler State = %@", buf, 0x48u);

    a3 = v32;
    id v6 = v34;
  }

  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  v21 = v8;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = HMFGetLogIdentifier();
    [NSString stringWithUTF8String:a3];
    v24 = v33 = v20;
    v25 = [(HMDAccessoryFirmwareUpdateScheduler *)v21 accessory];
    [v25 isReachable];
    v26 = HMFBooleanToString();
    v27 = [(HMDAccessoryFirmwareUpdateScheduler *)v21 updateSession];
    [v27 isUserInitiatedInstall];
    v28 = HMFBooleanToString();
    v29 = [(HMDAccessoryFirmwareUpdateScheduler *)v21 accessory];
    [v29 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    v30 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    v36 = v23;
    __int16 v37 = 2112;
    v38 = v24;
    __int16 v39 = 2112;
    v40 = v26;
    __int16 v41 = 2112;
    v42 = v28;
    __int16 v43 = 2112;
    v44 = v30;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@: Accessory Locally Reachable = %@, User Initiated Install = %@, Automatic Update = %@", buf, 0x34u);

    uint64_t v20 = v33;
    id v6 = v34;
  }
}

- (void)_taskCanRunInCurrentDevice:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
  char v7 = [v6 shouldRun];

  if (v7)
  {
    id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
    int v9 = [v8 home];
    v26 = [v9 primaryResident];
    uint64_t v10 = [v26 capabilities];
    int v11 = [v10 supportsResidentFirmwareUpdate];

    int v12 = [v9 isResidentSupported] & v11;
    int v13 = [v9 isCurrentDeviceConfirmedPrimaryResident];
    int v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = v25 = v8;
      uint64_t v18 = HMFBooleanToString();
      [v9 isResidentSupported];
      HMFBooleanToString();
      v19 = v24 = v14;
      uint64_t v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      v31 = v17;
      __int16 v32 = 2112;
      v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2112;
      __int16 v37 = v20;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Resident parameters: supports AFU=%@, enabled=%@, current device is resident=%@", buf, 0x2Au);

      int v14 = v24;
      id v8 = v25;
    }

    if (((v12 ^ 1 | v13) & 1) != 0
      || ([(HMDAccessoryFirmwareUpdateScheduler *)v15 updateSession],
          v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isUserInitiatedInstall],
          v21,
          (v22 & 1) != 0))
    {
      v4[2](v4, 1);
    }
    else
    {
      v29 = v8;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke;
      v27[3] = &unk_1E6A14778;
      v27[4] = v15;
      v28 = v4;
      [v9 queryPrimaryResidentReachabilityForAccessories:v23 completion:v27];
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke_2;
  v6[3] = &unk_1E6A10B58;
  objc_copyWeak(&v9, &location);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(a1 + 32) count] == 1)
  {
    id v3 = [*(id *)(a1 + 32) firstObject];
    int v4 = objc_msgSend(v3, "hmf_BOOLForKey:", @"kAccessoryIsReachableKey");
  }
  else
  {
    int v4 = 0;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = (void *)v8;
    uint64_t v10 = @"unreachable";
    if (v4) {
      uint64_t v10 = @"reachable";
    }
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Accessory is %@ from the resident", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_defer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 activityCompletion];
    id v9 = HMFBooleanToString();
    int v13 = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    int v16 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Deferring active task, activityCompletion %@", (uint8_t *)&v13, 0x16u);
  }
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v5, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _defer]");
  uint64_t v10 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 updateSession];
  [v10 pause];

  int v11 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 activityCompletion];

  if (v11)
  {
    uint64_t v12 = [(HMDAccessoryFirmwareUpdateScheduler *)v5 activityCompletion];
    v12[2](v12, 2);
  }
}

- (void)_stop
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v15 = 138543362;
    int v16 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping current task", (uint8_t *)&v15, 0xCu);
  }
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v5, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _stop]");
  if ([(HMDAccessoryFirmwareUpdateScheduler *)v5 currentState])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v5;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Stopping active task", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v12 = [(HMDAccessoryFirmwareUpdateScheduler *)v9 activityCompletion];

    if (v12)
    {
      int v13 = [(HMDAccessoryFirmwareUpdateScheduler *)v9 activityCompletion];
      v13[2](v13, 1);
    }
    [(HMDAccessoryFirmwareUpdateScheduler *)v9 _invalidateExistingScheduling];
    [(HMDAccessoryFirmwareUpdateScheduler *)v9 setCurrentState:0];
    int v14 = [(HMDAccessoryFirmwareUpdateScheduler *)v9 updateSession];
    [v14 pause];
  }
}

- (void)_scheduleCurrentTaskBackgroundRun
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
  char v5 = [v4 shouldRun];

  if (v5)
  {
    id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
    [(HMDAccessoryFirmwareUpdateScheduler *)self _invalidateExistingScheduling];
    [(HMDAccessoryFirmwareUpdateScheduler *)self setCurrentTask:v6];
    id v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
    uint64_t v8 = [v7 uniqueIdentifier];
    id v9 = [@"com.apple.homed.firmwareUpdate.scheduler." stringByAppendingString:v8];

    uint64_t v10 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    int v11 = (void *)[v10 newBackgroundSchedulerWithIdentifier:v9];
    [(HMDAccessoryFirmwareUpdateScheduler *)self setBackgroundScheduler:v11];

    uint64_t v12 = [(HMDAccessoryFirmwareUpdateScheduler *)self backgroundScheduler];
    int v13 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
    int v14 = [v13 criteria];
    [v12 _setAdditionalXPCActivityProperties:v14];

    id inited = objc_initWeak(&location, self);
    int v16 = (void *)MEMORY[0x1D9452090](inited);
    uint64_t v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [(HMDAccessoryFirmwareUpdateScheduler *)v17 currentTask];
      *(_DWORD *)buf = 138543874;
      id v33 = v19;
      __int16 v34 = 2112;
      v35 = v9;
      __int16 v36 = 2112;
      __int16 v37 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Scheduling background task %@ %@", buf, 0x20u);
    }
    v21 = [(HMDAccessoryFirmwareUpdateScheduler *)v17 backgroundScheduler];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke;
    v28[3] = &unk_1E6A0C8E0;
    objc_copyWeak(&v30, &location);
    id v22 = v9;
    id v29 = v22;
    [v21 scheduleWithBlock:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [(HMDAccessoryFirmwareUpdateScheduler *)v24 currentTask];
      *(_DWORD *)buf = 138543618;
      id v33 = v26;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Aborting task %@ after initial delay because required conditions are no longer satisfied", buf, 0x16u);
    }
    [(HMDAccessoryFirmwareUpdateScheduler *)v24 _stop];
  }
}

void __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_2;
    block[3] = &unk_1E6A193D0;
    block[4] = v5;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, block);
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

uint64_t __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  int v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) currentTask];
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    int v16 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Running background task %@ %@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) setActivityCompletion:*(void *)(a1 + 48)];
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_50;
  v10[3] = &unk_1E6A18288;
  v10[4] = v8;
  return [v8 _taskCanRunInCurrentDevice:v10];
}

uint64_t __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_50(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) currentTask];
      int v14 = 138543618;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Running task %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) currentTask];
    [v10 run];

    return [*(id *)(a1 + 32) _startDeferCheckTimer];
  }
  else
  {
    if (v7)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      __int16 v13 = [*(id *)(a1 + 32) currentTask];
      int v14 = 138543618;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Aborting background running because required conditions are no longer satisfied for task=%@", (uint8_t *)&v14, 0x16u);
    }
    return [*(id *)(a1 + 32) _stop];
  }
}

- (void)_scheduleCurrentTask
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
  if ([v4 isUserInitiated])
  {

LABEL_4:
    id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v8, block);

    return;
  }
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
  [v5 initialDelay];
  double v7 = v6;

  if (v7 == 0.0) {
    goto LABEL_4;
  }
  [(HMDAccessoryFirmwareUpdateScheduler *)self _startTaskInitialDelayTimer];
}

uint64_t __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke_2;
  v3[3] = &unk_1E6A18288;
  v3[4] = v1;
  return [v1 _taskCanRunInCurrentDevice:v3];
}

void __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) currentTask];

    int v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    double v6 = HMFGetOSLogHandle();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        id v8 = HMFGetLogIdentifier();
        id v9 = [*(id *)(a1 + 32) currentTask];
        int v17 = 138543618;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Running current task now %@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v10 = [*(id *)(a1 + 32) currentTask];
      [v10 run];
    }
    else
    {
      if (v7)
      {
        __int16 v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Task was invalidated", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      __int16 v15 = [*(id *)(a1 + 32) currentTask];
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Aborting background run of task %@ because required conditions are no longer satisfied", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) _stop];
  }
}

- (void)_invalidateExistingScheduling
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self backgroundScheduler];
  [v4 invalidate];

  [(HMDAccessoryFirmwareUpdateScheduler *)self setBackgroundScheduler:0];
  [(HMDAccessoryFirmwareUpdateScheduler *)self setActivityCompletion:0];
  [(HMDAccessoryFirmwareUpdateScheduler *)self setCurrentTask:0];
  [(HMDAccessoryFirmwareUpdateScheduler *)self _stopInitialDelayTimer];
  [(HMDAccessoryFirmwareUpdateScheduler *)self _stopDeferCheckTimer];
}

- (BOOL)isStagingInProgress
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return [(HMDAccessoryFirmwareUpdateScheduler *)self currentState] == 1;
}

- (BOOL)isIdle
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return [(HMDAccessoryFirmwareUpdateScheduler *)self currentState] == 0;
}

- (BOOL)needsToScheduleApply
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateSession];
  if ([v4 sessionState] == 2
    && ![(HMDAccessoryFirmwareUpdateScheduler *)self currentState])
  {
    if ([v4 isUserInitiatedInstall])
    {
      char v5 = 1;
    }
    else
    {
      BOOL v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
      char v5 = [v7 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)needsToScheduleStaging
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateSession];
  BOOL v5 = [v4 sessionState] == 1
    && [(HMDAccessoryFirmwareUpdateScheduler *)self currentState] == 0;

  return v5;
}

- (BOOL)needsToScheduleRegister
{
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateSession];
  BOOL v5 = [v4 sessionState] == 3
    && [(HMDAccessoryFirmwareUpdateScheduler *)self currentState] == 0;

  return v5;
}

- (BOOL)needsToStop
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  if ([v3 isReachable]) {
    int v4 = 0;
  }
  else {
    int v4 = ![(HMDAccessoryFirmwareUpdateScheduler *)self isIdle];
  }

  BOOL v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self updateProfile];
  if ([v5 stagingNotReadyReasons]) {
    BOOL v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self isStagingInProgress];
  }
  else {
    BOOL v6 = 0;
  }

  BOOL v7 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
  if (v7)
  {
    id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self currentTask];
    int v9 = [v8 shouldRun] ^ 1;
  }
  else
  {
    int v9 = 0;
  }

  int v10 = v4 | v6 | v9;
  if (v10 == 1)
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      __int16 v15 = [(HMDAccessoryFirmwareUpdateScheduler *)v12 currentTask];
      __int16 v16 = HMFBooleanToString();
      int v17 = HMFBooleanToString();
      uint64_t v18 = [(HMDAccessoryFirmwareUpdateScheduler *)v12 updateProfile];
      [v18 stagingNotReadyReasons];
      HAPStagingNotReadyReasonsAsString();
      v19 = id v22 = v11;
      uint64_t v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138544642;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v15;
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2114;
      id v30 = v17;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      __int16 v33 = 2112;
      __int16 v34 = v20;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Task %@ needs to stop - notReachable %@, StagingNotReady %{public}@ (%@), shouldn't run %@", buf, 0x3Eu);

      int v11 = v22;
    }
  }
  return v10;
}

- (void)scheduleWithDelay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    HMFBooleanToString();
    int v10 = (HMDAccessoryFirmwareUpdateStagingTask *)objc_claimAutoreleasedReturnValue();
    int v48 = 138543618;
    uint64_t v49 = v9;
    __int16 v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@scheduleWithDelay: %@", (uint8_t *)&v48, 0x16u);
  }
  [(HMDAccessoryFirmwareUpdateScheduler *)v7 _invalidateExistingScheduling];
  int v11 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updateSession];
  switch([v11 sessionState])
  {
    case 0:
      [(HMDAccessoryFirmwareUpdateScheduler *)v7 _removeUpdatePolicy];
      goto LABEL_5;
    case 1:
      int v14 = [HMDAccessoryFirmwareUpdateStagingTask alloc];
      __int16 v15 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updateProfile];
      __int16 v13 = -[HMDAccessoryFirmwareUpdateStagingTask initWithSession:profile:userInitiated:delay:](v14, "initWithSession:profile:userInitiated:delay:", v11, v15, [v11 isUserInitiatedStaging], v3);

      [(HMDAccessoryFirmwareUpdateScheduler *)v7 _removeUpdatePolicy];
      uint64_t v12 = 1;
      break;
    case 2:
      __int16 v16 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 accessory];
      char v17 = [v11 isUserInitiatedInstall];
      int v18 = [v16 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
      __int16 v19 = [v16 home];
      int v20 = [v19 isCurrentDeviceConfirmedPrimaryResident];

      if (v17 & 1) != 0 || (v18 & v20)
      {
        if ([v11 isUserInitiatedInstall])
        {
          __int16 v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = v7;
          __int16 v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            __int16 v32 = HMFGetLogIdentifier();
            int v48 = 138543362;
            uint64_t v49 = v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@User initiated install; removing policy...",
              (uint8_t *)&v48,
              0xCu);
          }
          [(HMDAccessoryFirmwareUpdateScheduler *)v30 _removeUpdatePolicy];
        }
        else
        {
          __int16 v33 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updatePolicy];

          if (!v33)
          {
            __int16 v34 = (void *)MEMORY[0x1D9452090]();
            uint64_t v35 = v7;
            __int16 v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              __int16 v37 = HMFGetLogIdentifier();
              int v48 = 138543362;
              uint64_t v49 = v37;
              _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Auto install; creating policy...",
                (uint8_t *)&v48,
                0xCu);
            }
            [(HMDAccessoryFirmwareUpdateScheduler *)v35 _createUpdatePolicy];
          }
        }
        uint64_t v38 = [HMDAccessoryFirmwareUpdateApplyTask alloc];
        __int16 v39 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updateProfile];
        v40 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updatePolicy];
        __int16 v13 = -[HMDAccessoryFirmwareUpdateApplyTask initWithSession:profile:policy:userInitiated:delay:](v38, "initWithSession:profile:policy:userInitiated:delay:", v11, v39, v40, [v11 isUserInitiatedInstall], v3);

        uint64_t v12 = 2;
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = v7;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          HMFBooleanToString();
          __int16 v25 = (HMDAccessoryFirmwareUpdateStagingTask *)objc_claimAutoreleasedReturnValue();
          v26 = HMFBooleanToString();
          int v48 = 138543874;
          uint64_t v49 = v24;
          __int16 v50 = 2112;
          v51 = v25;
          __int16 v52 = 2112;
          v53 = v26;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Automatic update not allowed in current device: allowed=%@, current device is resident=%@", (uint8_t *)&v48, 0x20u);
        }
        [(HMDAccessoryFirmwareUpdateScheduler *)v22 _removeUpdatePolicy];
        uint64_t v12 = 0;
        __int16 v13 = 0;
      }

      break;
    case 3:
      __int16 v27 = [HMDAccessoryFirmwareUpdateRegisterTask alloc];
      v28 = [(HMDAccessoryFirmwareUpdateScheduler *)v7 updateProfile];
      __int16 v13 = [(HMDAccessoryFirmwareUpdateRegisterTask *)v27 initWithSession:v11 profile:v28 initialDelay:0.0];

      uint64_t v12 = 3;
      break;
    default:
LABEL_5:
      uint64_t v12 = 0;
      __int16 v13 = 0;
      break;
  }
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v7, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler scheduleWithDelay:]");
  BOOL v41 = [(HMDAccessoryFirmwareUpdateStagingTask *)v13 shouldRun];
  v42 = (void *)MEMORY[0x1D9452090]();
  __int16 v43 = v7;
  v44 = HMFGetOSLogHandle();
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
  if (v41)
  {
    if (v45)
    {
      v46 = HMFGetLogIdentifier();
      int v48 = 138543618;
      uint64_t v49 = v46;
      __int16 v50 = 2112;
      v51 = v13;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Scheduling new task %@", (uint8_t *)&v48, 0x16u);
    }
    [(HMDAccessoryFirmwareUpdateScheduler *)v43 setCurrentState:v12];
    [(HMDAccessoryFirmwareUpdateScheduler *)v43 setCurrentTask:v13];
    [(HMDAccessoryFirmwareUpdateScheduler *)v43 _scheduleCurrentTask];
  }
  else
  {
    if (v45)
    {
      __int16 v47 = HMFGetLogIdentifier();
      int v48 = 138543618;
      uint64_t v49 = v47;
      __int16 v50 = 2112;
      v51 = v13;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Skip scheduling unready task %@", (uint8_t *)&v48, 0x16u);
    }
    [(HMDAccessoryFirmwareUpdateScheduler *)v43 setCurrentState:0];
    if ([v11 isUserInitiatedInstall]) {
      [v11 updateAvailableSoftwareUpdateState:2];
    }
  }
}

- (void)_handleSchedulingConditionChanged
{
  BOOL v3 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _handleSchedulingConditionChanged]");
  if ([(HMDAccessoryFirmwareUpdateScheduler *)self needsToStop])
  {
    [(HMDAccessoryFirmwareUpdateScheduler *)self _stop];
  }
  else if ([(HMDAccessoryFirmwareUpdateScheduler *)self needsToScheduleApply] {
         || [(HMDAccessoryFirmwareUpdateScheduler *)self needsToScheduleStaging]
  }
         || [(HMDAccessoryFirmwareUpdateScheduler *)self needsToScheduleRegister])
  {
    [(HMDAccessoryFirmwareUpdateScheduler *)self scheduleWithDelay:0];
  }
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HMDAccessoryFirmwareUpdateScheduler_handlePrimaryResidentChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDAccessoryFirmwareUpdateScheduler_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  BOOL v3 = [v2 objectForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    int v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed to %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) _handleSchedulingConditionChanged];
}

- (void)handleApplyNotReadyReasonsChanged:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HMDAccessoryFirmwareUpdateScheduler_handleApplyNotReadyReasonsChanged___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __73__HMDAccessoryFirmwareUpdateScheduler_handleApplyNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) updateProfile];
    [v6 updateNotReadyReasons];
    BOOL v7 = HAPUpdateNotReadyReasonsAsString();
    int v9 = 138543618;
    __int16 v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory apply not ready reasons changed to %{public}@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) _handleSchedulingConditionChanged];
}

- (void)handleStagingNotReadyReasonsChanged:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryFirmwareUpdateScheduler_handleStagingNotReadyReasonsChanged___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __75__HMDAccessoryFirmwareUpdateScheduler_handleStagingNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) updateProfile];
    [v6 stagingNotReadyReasons];
    BOOL v7 = HAPStagingNotReadyReasonsAsString();
    int v9 = 138543618;
    __int16 v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory staging not ready reasons changed to %{public}@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) _handleSchedulingConditionChanged];
}

- (void)handleUpdateStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAccessoryFirmwareUpdateScheduler_handleUpdateStateChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDAccessoryFirmwareUpdateScheduler_handleUpdateStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "hmf_numberForKey:", @"HMDAccessoryFirmwareUpdateStateKey");

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    [v3 unsignedIntegerValue];
    id v8 = HAPFirmwareUpdateStateAsString();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory firmware update status changed to %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 40) _handleSchedulingConditionChanged];
}

- (void)handleAccessoryReachabilityChanged:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDAccessoryFirmwareUpdateScheduler_handleAccessoryReachabilityChanged___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __74__HMDAccessoryFirmwareUpdateScheduler_handleAccessoryReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) accessory];
    [v6 isReachable];
    BOOL v7 = HMFBooleanToString();
    int v9 = 138543618;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory reachability changes to %@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) _handleSchedulingConditionChanged];
}

- (void)_registerForNotifications
{
  id v24 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v3 = [v24 firmwareUpdateProfile];
  if (v3)
  {
    id v4 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    id v5 = [v4 notificationCenter];
    [v5 addObserver:self selector:sel_handleUpdateStateChanged_ name:@"HMDAccessoryFirmwareUpdateStateChangedNotification" object:v3];

    id v6 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    BOOL v7 = [v6 notificationCenter];
    [v7 addObserver:self selector:sel_handleStagingNotReadyReasonsChanged_ name:@"HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification" object:v3];

    id v8 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    int v9 = [v8 notificationCenter];
    [v9 addObserver:self selector:sel_handleApplyNotReadyReasonsChanged_ name:@"HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification" object:v3];

    __int16 v10 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    __int16 v11 = [v10 notificationCenter];
    [v11 addObserver:self selector:sel_handleAccessoryReachabilityChanged_ name:@"HMDAccessoryIsReachableNotification" object:v24];

    uint64_t v12 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
    uint64_t v13 = [v12 notificationCenter];
    [v13 addObserver:self selector:sel_handleAccessoryReachabilityChanged_ name:@"HMDAccessoryIsNotReachableNotification" object:v24];
  }
  int v14 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
  __int16 v15 = [v14 notificationCenter];
  __int16 v16 = [v24 home];
  char v17 = [v16 residentDeviceManager];
  [v15 addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v17];

  int v18 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
  __int16 v19 = [v18 notificationCenter];
  [v19 addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  int v20 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
  uint64_t v21 = [v20 notificationCenter];
  [v21 addObserver:self selector:sel_handleBridgeUpdate_ name:@"HMDAccessoryBridgedAccessoryAddedNotification" object:v24];

  id v22 = [(HMDAccessoryFirmwareUpdateScheduler *)self wingman];
  v23 = [v22 notificationCenter];
  [v23 addObserver:self selector:sel_handleBridgeUpdate_ name:@"HMDAccessoryBridgedAccessoryRemovedNotification" object:v24];
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfile
{
  v2 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v3 = [v2 firmwareUpdateProfile];

  return (HMDAccessoryFirmwareUpdateProfile *)v3;
}

- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 wingman:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (HMDAccessoryFirmwareUpdateSchedulerWingman *)a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateScheduler;
  int v14 = [(HMDAccessoryFirmwareUpdateScheduler *)&v18 init];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_updateSession, v11);
    __int16 v16 = v12;
    if (!v12) {
      __int16 v16 = objc_alloc_init(HMDAccessoryFirmwareUpdateSchedulerWingman);
    }
    objc_storeStrong((id *)&v15->_wingman, v16);
    if (!v12) {

    }
    objc_storeStrong((id *)&v15->_workQueue, a6);
    v15->_currentState = 0;
  }

  return v15;
}

- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5
{
  return [(HMDAccessoryFirmwareUpdateScheduler *)self initWithAccessory:a3 firmwareUpdateSession:a4 wingman:0 workQueue:a5];
}

- (void)dealloc
{
  [(NSBackgroundActivityScheduler *)self->_backgroundScheduler invalidate];
  id v3 = [(HMDAccessoryFirmwareUpdateSchedulerWingman *)self->_wingman notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateScheduler;
  [(HMDAccessoryFirmwareUpdateScheduler *)&v4 dealloc];
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v3 = [v2 logIdentifier];

  return v3;
}

- (id)privateDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v6 = [v5 uuid];
  BOOL v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"<%@ %@>", v4, v7];

  return v8;
}

- (NSString)description
{
  v2 = [(HMDAccessoryFirmwareUpdateScheduler *)self accessory];
  id v3 = NSString;
  uint64_t v4 = [v2 name];
  id v5 = [v2 uniqueIdentifier];
  id v6 = [v3 stringWithFormat:@"Accessory Firmware Update Scheduler %@, %@", v4, v5];

  return (NSString *)v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_66601 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_66601, &__block_literal_global_66602);
  }
  v2 = (void *)logCategory__hmf_once_v1_66603;
  return v2;
}

uint64_t __50__HMDAccessoryFirmwareUpdateScheduler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_66603;
  logCategory__hmf_once_v1_66603 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end