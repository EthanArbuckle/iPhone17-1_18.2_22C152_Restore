@interface HMDLowPowerModeProfile
+ (id)WoWLANInfoForSupportedSleepConfiguration:(id)a3;
+ (id)logCategory;
- (BOOL)_canEnterNewState:(unint64_t)a3;
- (BOOL)_shouldManageAccessoryLPM;
- (HAPSuspendedAccessory)suspendedAccessory;
- (HMDLowPowerModeProfile)initWithAccessory:(id)a3 powerManagementservice:(id)a4 workQueue:(id)a5;
- (HMDLowPowerModeProfileDelegate)delegate;
- (HMFTimer)backoffTimer;
- (HMFTimer)waitForWakeTimer;
- (NSString)clientIdentifier;
- (NSString)description;
- (id)connectivityInfo;
- (id)hapAccessory;
- (id)newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:(unint64_t)a3;
- (id)pendingWakeBlock;
- (id)powerManagementService;
- (id)selectedSleepConfigurationCharacteristic;
- (id)supportedSleepConfigurationCharacteristic;
- (unint64_t)internalOldState;
- (unint64_t)internalState;
- (unint64_t)retryCount;
- (unint64_t)suspendedState;
- (void)_configureAccessoryWithCompletion:(id)a3;
- (void)_enterState:(unint64_t)a3;
- (void)_processSelectedSleepConfigurationParametersWithCharacteristic:(id)a3;
- (void)_processSupportedSleepConfigurationParametersWithCharacteristic:(id)a3;
- (void)_queryAccessoryWithOperation:(int64_t)a3 completion:(id)a4;
- (void)_readAccessorySelectedConfigWithCompletion:(id)a3;
- (void)_readFromCharacteristic:(id)a3 completion:(id)a4;
- (void)_readInitialRequiredCharacteristics;
- (void)_resetStateMachine;
- (void)_runStateMachine;
- (void)_startTimerForType:(unint64_t)a3;
- (void)_stateMachine_Idle;
- (void)_stateMachine_backoffOperation;
- (void)_stateMachine_configureAccessory;
- (void)_stateMachine_readAccessoryConfiguration;
- (void)_stateMachine_unconfigureAccessory;
- (void)_stopBackoffTimerForType:(unint64_t)a3;
- (void)_unconfigureAccessoryWithCompletion:(id)a3;
- (void)_updateCharacteristicsNotifications:(BOOL)a3;
- (void)_wakeSuspendedAccessory:(id)a3 activity:(id)a4 completion:(id)a5;
- (void)_writeToCharacteristic:(id)a3 value:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)enterState:(unint64_t)a3;
- (void)handleAccessoryCharacteristicsChanged:(id)a3;
- (void)handleAccessoryConfigurationChanged:(id)a3;
- (void)handleInitialState;
- (void)registerForMessages;
- (void)setBackoffTimer:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalOldState:(unint64_t)a3;
- (void)setInternalState:(unint64_t)a3;
- (void)setPendingWakeBlock:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSuspendedAccessory:(id)a3;
- (void)setWaitForWakeTimer:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)unconfigure;
- (void)wakeAccessoryWithCompletion:(id)a3;
- (void)wakeAccessoryWithType:(unint64_t)a3 completion:(id)a4;
@end

@implementation HMDLowPowerModeProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForWakeTimer, 0);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_pendingWakeBlock, 0);
}

- (void)setWaitForWakeTimer:(id)a3
{
}

- (HMFTimer)waitForWakeTimer
{
  return self->_waitForWakeTimer;
}

- (void)setSuspendedAccessory:(id)a3
{
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (void)setDelegate:(id)a3
{
}

- (HMDLowPowerModeProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDLowPowerModeProfileDelegate *)WeakRetained;
}

- (void)setBackoffTimer:(id)a3
{
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setInternalOldState:(unint64_t)a3
{
  self->_internalOldState = a3;
}

- (unint64_t)internalOldState
{
  return self->_internalOldState;
}

- (void)setInternalState:(unint64_t)a3
{
  self->_internalState = a3;
}

- (unint64_t)internalState
{
  return self->_internalState;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setPendingWakeBlock:(id)a3
{
}

- (id)pendingWakeBlock
{
  return self->_pendingWakeBlock;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDLowPowerModeProfile *)self backoffTimer];

  if (v6 == v4)
  {
    uint64_t v11 = [(HMDLowPowerModeProfile *)self _stopBackoffTimerForType:1];
    if (self->_internalState == 4)
    {
      v12 = (void *)MEMORY[0x1D9452090](v11);
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        v16 = HMDLowPowerModeStateMachineDescription(v13->_internalOldState);
        int v17 = 138543874;
        v18 = v15;
        __int16 v19 = 2112;
        v20 = v16;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Resuming a backed-off state: %@ for %@", (uint8_t *)&v17, 0x20u);
      }
      [(HMDLowPowerModeProfile *)v13 _enterState:v13->_internalOldState];
    }
  }
  else
  {
    id v7 = [(HMDLowPowerModeProfile *)self waitForWakeTimer];

    if (v7 == v4)
    {
      [(HMDLowPowerModeProfile *)self _stopBackoffTimerForType:2];
      v8 = [(HMDLowPowerModeProfile *)self pendingWakeBlock];
      if (v8)
      {
        v9 = [(HMDLowPowerModeProfile *)self suspendedAccessory];

        if (v9)
        {
          v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:24];
          ((void (**)(void, void *))v8)[2](v8, v10);
        }
      }
      [(HMDLowPowerModeProfile *)self setPendingWakeBlock:0];
    }
  }
}

- (void)_stopBackoffTimerForType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 == 2)
  {
    v12 = [(HMDLowPowerModeProfile *)self waitForWakeTimer];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1D9452090]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v14;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Stopping wait for wake timer for %@", (uint8_t *)&v18, 0x16u);
      }
      int v17 = [(HMDLowPowerModeProfile *)v14 waitForWakeTimer];
      [v17 suspend];

      [(HMDLowPowerModeProfile *)v14 setWaitForWakeTimer:0];
    }
  }
  else if (a3 == 1)
  {
    id v6 = [(HMDLowPowerModeProfile *)self backoffTimer];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        int v18 = 138543618;
        __int16 v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v8;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Stopping backoff timer for %@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v11 = [(HMDLowPowerModeProfile *)v8 backoffTimer];
      [v11 suspend];

      [(HMDLowPowerModeProfile *)v8 setBackoffTimer:0];
    }
  }
}

- (void)_startTimerForType:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 == 1)
  {
    id v6 = @"lowPowerModeRetryInterval";
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    id v6 = @"lowPowerModeWaitForWakeInterval";
  }
  id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
  v8 = [v7 preferenceForKey:v6];
  v9 = [v8 numberValue];

  if (v9)
  {
    [v9 doubleValue];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v10];
    [v11 setDelegate:self];
    v12 = [(HMDAccessoryProfile *)self workQueue];
    [v11 setDelegateQueue:v12];

    if (a3 == 2)
    {
      v13 = (void *)MEMORY[0x1D9452090]([(HMDLowPowerModeProfile *)self setWaitForWakeTimer:v11]);
      int v18 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        int v19 = 138543618;
        __int16 v20 = v16;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        int v17 = "%{public}@Starting wait for wake timer for %@";
        goto LABEL_11;
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D9452090]([(HMDLowPowerModeProfile *)self setBackoffTimer:v11]);
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        int v19 = 138543618;
        __int16 v20 = v16;
        __int16 v21 = 2112;
        uint64_t v22 = v14;
        int v17 = "%{public}@Starting backoff timer for %@";
LABEL_11:
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);
      }
    }

    [v11 resume];
  }
}

- (NSString)description
{
  v3 = [(HMDAccessoryProfile *)self accessory];
  id v4 = NSString;
  v5 = [v3 identifier];
  id v6 = [v3 name];
  [(HMDLowPowerModeProfile *)self suspendedState];
  id v7 = HAPAccessorySuspendedStateDescription();
  v8 = HMDLowPowerModeStateMachineDescription([(HMDLowPowerModeProfile *)self internalState]);
  v9 = [v4 stringWithFormat:@"<LPM ID: %@/%@, Suspended State: '%@', Internal State: '%@'>", v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA48] array];
  v26 = v25 = self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [(HMDLowPowerModeProfile *)self connectivityInfo];
  id v6 = [v5 woWLANInfos];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (a3 != 2 || [*(id *)(*((void *)&v27 + 1) + 8 * i) wakeType] == 2)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F5BC50]);
          uint64_t v13 = [v11 wakePort];
          v14 = [v11 wakeAddressString];
          v15 = [v11 wakePattern];
          v16 = (void *)[v12 initWithPort:v13 wakeAddress:v14 wakePattern:v15];

          if (v16) {
            [v26 addObject:v16];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  if ([v26 count])
  {
    id v17 = objc_alloc(MEMORY[0x1E4F5BE40]);
    int v18 = [(HMDLowPowerModeProfile *)v25 hapAccessory];
    int v19 = [v18 name];
    __int16 v20 = [(HMDLowPowerModeProfile *)v25 hapAccessory];
    __int16 v21 = [v20 identifier];
    uint64_t v22 = [(HMDAccessoryProfile *)v25 workQueue];
    uint64_t v23 = (void *)[v17 initWithName:v19 identifier:v21 wakeTuples:v26 queue:v22];
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (unint64_t)suspendedState
{
  v2 = [(HMDLowPowerModeProfile *)self hapAccessory];
  unint64_t v3 = [v2 suspendedState];

  return v3;
}

- (id)supportedSleepConfigurationCharacteristic
{
  v2 = [(HMDLowPowerModeProfile *)self powerManagementService];
  unint64_t v3 = [v2 findCharacteristicWithType:@"00000251-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)selectedSleepConfigurationCharacteristic
{
  v2 = [(HMDLowPowerModeProfile *)self powerManagementService];
  unint64_t v3 = [v2 findCharacteristicWithType:@"00000252-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)powerManagementService
{
  return [(HMDAccessoryProfile *)self findServiceWithType:@"00000221-0000-1000-8000-0026BB765291"];
}

- (id)connectivityInfo
{
  v2 = [(HMDLowPowerModeProfile *)self hapAccessory];
  unint64_t v3 = [v2 connectivityInfo];

  return v3;
}

- (id)hapAccessory
{
  v2 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)handleAccessoryConfigurationChanged:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    *(_DWORD *)buf = 138543874;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %@ received by %@", buf, 0x20u);
  }
  double v10 = [v4 name];
  int v11 = [v10 isEqualToString:@"HMDAccessoryConnectedNotification"];

  if (v11)
  {
    id v12 = [(HMDAccessoryProfile *)v6 workQueue];
    uint64_t v13 = v12;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke;
    v18[3] = &unk_1E6A19B30;
    v18[4] = v6;
    v14 = v18;
LABEL_7:
    dispatch_async(v12, v14);

    goto LABEL_8;
  }
  v15 = [v4 name];
  int v16 = [v15 isEqualToString:@"HMDAccessoryDisconnectedNotification"];

  if (v16)
  {
    id v12 = [(HMDAccessoryProfile *)v6 workQueue];
    uint64_t v13 = v12;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke_2;
    v17[3] = &unk_1E6A19B30;
    v17[4] = v6;
    v14 = v17;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readInitialRequiredCharacteristics];
}

void __62__HMDLowPowerModeProfile_handleAccessoryConfigurationChanged___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) suspendedState] == 2)
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 profile:*(void *)(a1 + 32) didUpdateAccessoryState:3];
    }
  }
}

- (void)handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDLowPowerModeProfile_handleAccessoryCharacteristicsChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDLowPowerModeProfile_handleAccessoryCharacteristicsChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  objc_msgSend(v2, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v3 = findMatchingCharacteristic(@"00000251-0000-1000-8000-0026BB765291", v5);
  if (v3) {
    [*(id *)(a1 + 40) _processSupportedSleepConfigurationParametersWithCharacteristic:v3];
  }
  id v4 = findMatchingCharacteristic(@"00000252-0000-1000-8000-0026BB765291", v5);
  if (v4) {
    [*(id *)(a1 + 40) _processSelectedSleepConfigurationParametersWithCharacteristic:v4];
  }
}

- (BOOL)_shouldManageAccessoryLPM
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(HMDAccessoryProfile *)self accessory];
  unint64_t v3 = [v2 home];

  id v4 = [v3 residentDeviceManager];
  id v5 = [v4 primaryResidentDevice];

  if (__51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(v5))
  {
    char v6 = [v5 isCurrentDevice];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(v3, "residentDeviceManager", 0);
    id v8 = [v7 residentDevices];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (__51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(v13))
          {
            char v6 = [v13 isCurrentDevice];
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    char v6 = 1;
LABEL_13:
  }
  return v6;
}

uint64_t __51__HMDLowPowerModeProfile__shouldManageAccessoryLPM__block_invoke(void *a1)
{
  id v1 = a1;
  if ([v1 isReachable] && objc_msgSend(v1, "isEnabled"))
  {
    id v2 = [v1 capabilities];
    uint64_t v3 = [v2 supportsWakeOnLAN];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_updateCharacteristicsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDLowPowerModeProfile *)self selectedSleepConfigurationCharacteristic];
  if (v5)
  {
    char v6 = [(HMDLowPowerModeProfile *)self hapAccessory];
    v9[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v8 = [(HMDLowPowerModeProfile *)self clientIdentifier];
    [v6 setNotificationsEnabled:v3 forCharacteristics:v7 clientIdentifier:v8];
  }
}

- (void)_readInitialRequiredCharacteristics
{
  BOOL v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(HMDLowPowerModeProfile *)self supportedSleepConfigurationCharacteristic];
  if (v5) {
    [(HMDLowPowerModeProfile *)self _processSupportedSleepConfigurationParametersWithCharacteristic:v5];
  }
  id v4 = [(HMDLowPowerModeProfile *)self selectedSleepConfigurationCharacteristic];
  if (v4) {
    [(HMDLowPowerModeProfile *)self _processSelectedSleepConfigurationParametersWithCharacteristic:v4];
  }
  [(HMDLowPowerModeProfile *)self _updateCharacteristicsNotifications:1];
}

- (void)_readFromCharacteristic:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = +[HMDCharacteristicRequest requestWithCharacteristic:v6];
  uint64_t v10 = [(HMDLowPowerModeProfile *)self hapAccessory];
  v18[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v12 = [(HMDAccessoryProfile *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HMDLowPowerModeProfile__readFromCharacteristic_completion___block_invoke;
  v15[3] = &unk_1E6A17640;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v10 readCharacteristicValues:v11 source:7 queue:v12 completionHandler:v15];
}

void __61__HMDLowPowerModeProfile__readFromCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 firstObject];
  id v5 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 error];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) instanceID];
      id v13 = v16 = v3;
      [*(id *)(a1 + 40) type];
      v14 = id v17 = v9;
      long long v15 = [v4 error];
      *(_DWORD *)buf = 138544130;
      int v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      __int16 v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Reading from characteristic: %@/%@ failed with error: %@", buf, 0x2Au);

      uint64_t v9 = v17;
      id v3 = v16;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_writeToCharacteristic:(id)a3 value:(id)a4 completion:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v8 value:v10 authorizationData:0 type:0];

  id v13 = [(HMDLowPowerModeProfile *)self hapAccessory];
  v21[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  long long v15 = [(HMDAccessoryProfile *)self workQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __66__HMDLowPowerModeProfile__writeToCharacteristic_value_completion___block_invoke;
  v18[3] = &unk_1E6A17640;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [v13 writeCharacteristicValues:v14 source:7 queue:v15 completionHandler:v18];
}

void __66__HMDLowPowerModeProfile__writeToCharacteristic_value_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 error];

    id v6 = [v3 firstObject];
    id v7 = [v6 value];

    if (v5)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v12 = [*(id *)(a1 + 40) instanceID];
        id v13 = [*(id *)(a1 + 40) type];
        int v16 = 138544130;
        id v17 = v11;
        __int16 v18 = 2112;
        id v19 = v12;
        __int16 v20 = 2112;
        __int16 v21 = v13;
        __int16 v22 = 2112;
        __int16 v23 = v5;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Writing to the characteristic: %@/%@ failed with error: %@", (uint8_t *)&v16, 0x2Au);
      }
    }
    else
    {
      id v14 = [v3 firstObject];
      uint64_t v15 = [v14 value];

      id v5 = 0;
      id v7 = (void *)v15;
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_processSelectedSleepConfigurationParametersWithCharacteristic:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = (objc_class *)objc_opt_class();
  id v10 = deserializeObject(v9, v8);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 operationStatus];
    unint64_t v13 = [v12 value];

    id v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      __int16 v18 = HMDLowPowerModeOperationStatusDescription(v13);
      int v24 = 138543874;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v18;
      __int16 v28 = 2112;
      long long v29 = v15;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing selected sleep configuration with status: '%@' for %@", (uint8_t *)&v24, 0x20u);
    }
    if (v13 <= 2)
    {
      id v19 = [(HMDLowPowerModeProfile *)v15 delegate];
      if (objc_opt_respondsToSelector()) {
        [v19 profile:v15 didUpdateAccessoryState:v13];
      }
    }
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = self;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v24 = 138543618;
      uint64_t v25 = v23;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse selected sleep configuration with data: %@", (uint8_t *)&v24, 0x16u);
    }
  }
}

- (void)_processSupportedSleepConfigurationParametersWithCharacteristic:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDLowPowerModeProfile *)self _shouldManageAccessoryLPM])
  {
    id v6 = [v4 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = (objc_class *)objc_opt_class();
    id v10 = deserializeObject(v9, v8);
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    unint64_t v13 = HMFGetOSLogHandle();
    id v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v21 = 138543618;
        __int16 v22 = v15;
        __int16 v23 = 2112;
        int v24 = v12;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing supported sleep configuration for %@.", (uint8_t *)&v21, 0x16u);
      }
      if (![(HMDLowPowerModeProfile *)v12 internalState]) {
        [(HMDLowPowerModeProfile *)v12 _enterState:1];
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        __int16 v22 = v20;
        __int16 v23 = 2112;
        int v24 = v8;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse supported sleep configuration with data: %@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      __int16 v22 = v19;
      __int16 v23 = 2112;
      int v24 = v17;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Skipping processing characteristic update since a resident is present for %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)_queryAccessoryWithOperation:(int64_t)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id, void))a4;
  id v7 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if ((unint64_t)(a3 - 1) >= 3)
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    int v21 = self;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      HMDLowPowerModeOperationTypeDescription(a3);
      int v24 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v23;
      __int16 v45 = 2112;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v21;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received invalid operation type: '%@' for %@", buf, 0x20u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v6[2](v6, v12, 0);
    goto LABEL_22;
  }
  id v8 = objc_alloc_init(HMDSelectedSleepConfigurationTLV);
  if (v8)
  {
    id v9 = v8;
    id v10 = [[HMDSleepConfigurationOperationTypeWrapper alloc] initWithValue:a3];
    [(HMDSelectedSleepConfigurationTLV *)v9 setOperationType:v10];

    uint64_t v11 = [(HMDLowPowerModeProfile *)self selectedSleepConfigurationCharacteristic];
    id v12 = v9;
    if ([(HMDSelectedSleepConfigurationTLV *)v12 conformsToProtocol:&unk_1F2DF7DB8])
    {
      id v42 = 0;
      id v13 = [(HMDSelectedSleepConfigurationTLV *)v12 serializeWithError:&v42];
      id v14 = (HMDLowPowerModeProfile *)v42;
      if (v14 || !v13)
      {
        uint64_t v15 = (void *)MEMORY[0x1D9452090]();
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = id v17 = v11;
          *(_DWORD *)buf = 138543874;
          v44 = v18;
          __int16 v45 = 2112;
          v46 = v12;
          __int16 v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize object: %@ with error: %@", buf, 0x20u);

          uint64_t v11 = v17;
        }

        id v19 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      id v13 = 0;
    }
    id v13 = v13;
    id v19 = v13;
LABEL_14:

    uint64_t v25 = (void *)MEMORY[0x1D9452090]();
    __int16 v26 = self;
    id v27 = HMFGetOSLogHandle();
    __int16 v28 = v27;
    if (v19)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        long long v29 = HMFGetLogIdentifier();
        HMDLowPowerModeOperationTypeDescription(a3);
        uint64_t v30 = (HMDSelectedSleepConfigurationTLV *)objc_claimAutoreleasedReturnValue();
        [(HMDAccessoryProfile *)v26 accessory];
        v31 = v39 = v11;
        uint64_t v32 = [v31 identifier];
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        __int16 v45 = 2112;
        v46 = v30;
        __int16 v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Requesting response to operation type: '%@' from accessory: %@", buf, 0x20u);

        uint64_t v11 = v39;
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HMDLowPowerModeProfile__queryAccessoryWithOperation_completion___block_invoke;
      aBlock[3] = &unk_1E6A0C550;
      v41 = v6;
      v33 = _Block_copy(aBlock);
      [(HMDLowPowerModeProfile *)v26 _writeToCharacteristic:v11 value:v19 completion:v33];

      v34 = v41;
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        v36 = [v11 instanceID];
        [v11 type];
        v37 = v11;
        v38 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v35;
        __int16 v45 = 2112;
        v46 = v36;
        __int16 v47 = 2112;
        v48 = v38;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize selected sleep configuration value for charactersitic %@/%@", buf, 0x20u);

        uint64_t v11 = v37;
      }

      v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v6[2](v6, v34, 0);
    }

LABEL_22:
  }
}

void __66__HMDLowPowerModeProfile__queryAccessoryWithOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = deserializeObject(v6, v5);

  id v8 = v9;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_unconfigureAccessoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDLowPowerModeProfile__unconfigureAccessoryWithCompletion___block_invoke;
  v7[3] = &unk_1E6A0C528;
  id v8 = v4;
  id v6 = v4;
  [(HMDLowPowerModeProfile *)self _queryAccessoryWithOperation:3 completion:v7];
}

void __62__HMDLowPowerModeProfile__unconfigureAccessoryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
  else
  {
    id v6 = [a3 operationStatus];
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, [v6 value]);
  }
}

- (void)_configureAccessoryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  id v6 = [(HMDLowPowerModeProfile *)self supportedSleepConfigurationCharacteristic];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke;
  v8[3] = &unk_1E6A0C500;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(HMDLowPowerModeProfile *)self _readFromCharacteristic:v6 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = deserializeObject(v8, v6);
    id v10 = v9;
    if (v9)
    {
      v37 = HMDLowPowerModeWoWLANInfoForSupportedSleepConfiguration(v9);
      uint64_t v11 = [v37 firstObject];
      id v12 = v11;
      if (v11)
      {
        BOOL v13 = [v11 version] > 1;
        context = (void *)MEMORY[0x1D9452090]();
        id v14 = WeakRetained;
        uint64_t v15 = HMFGetOSLogHandle();
        int v16 = v15;
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            __int16 v18 = NSNumber;
            uint64_t v19 = [v12 version];
            __int16 v20 = v18;
            int v21 = (void *)v17;
            __int16 v22 = [v20 numberWithUnsignedChar:v19];
            *(_DWORD *)buf = 138543874;
            v43 = v21;
            __int16 v44 = 2112;
            __int16 v45 = v22;
            __int16 v46 = 2112;
            __int16 v47 = &unk_1F2DC7EE8;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Accessory's supported LPM version: %@ is greater than the current version: %@.", buf, 0x20u);
          }
          uint64_t v23 = *(void *)(a1 + 32);
          int v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
          (*(void (**)(uint64_t, void *, void, uint64_t))(v23 + 16))(v23, v24, 0, 0x7FFFFFFFFFFFFFFFLL);
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v34 = HMFGetLogIdentifier();
            v35 = [v14 connectivityInfo];
            v33 = [v35 woWLANInfos];
            *(_DWORD *)buf = 138543874;
            v43 = v34;
            __int16 v44 = 2112;
            __int16 v45 = v33;
            __int16 v46 = 2112;
            __int16 v47 = v37;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to update WoWLANInfo: '%@' -> '%@'", buf, 0x20u);
          }
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke_61;
          v38[3] = &unk_1E6A0C4D8;
          objc_copyWeak(&v41, (id *)(a1 + 40));
          id v40 = *(id *)(a1 + 32);
          id v39 = v37;
          [v14 _queryAccessoryWithOperation:2 completion:v38];

          objc_destroyWeak(&v41);
        }
      }
      else
      {
        id v27 = (void *)MEMORY[0x1D9452090]();
        id v28 = WeakRetained;
        long long v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v43 = v30;
          __int16 v44 = 2112;
          __int16 v45 = v10;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create WoWLANInfo from supported sleep config: %@", buf, 0x16u);
        }
        uint64_t v31 = *(void *)(a1 + 32);
        uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        (*(void (**)(uint64_t, void *, void, uint64_t))(v31 + 16))(v31, v32, 0, 0x7FFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      uint64_t v25 = *(void *)(a1 + 32);
      __int16 v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      (*(void (**)(uint64_t, void *, void, uint64_t))(v25 + 16))(v25, v26, 0, 0x7FFFFFFFFFFFFFFFLL);
    }
  }
}

void __60__HMDLowPowerModeProfile__configureAccessoryWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v9 = a1 + 32;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v9 + 8);
    if (v11)
    {
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v11, v7, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v10 = [v5 operationStatus];
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 16))(v8, 0, v7, [v10 value]);
    }
  }
}

- (void)_readAccessorySelectedConfigWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMDLowPowerModeProfile__readAccessorySelectedConfigWithCompletion___block_invoke;
  v7[3] = &unk_1E6A0C4B0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(HMDLowPowerModeProfile *)self _queryAccessoryWithOperation:1 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__HMDLowPowerModeProfile__readAccessorySelectedConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v9)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v8 = [v5 operationStatus];
      (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, [v8 value]);
    }
  }
}

- (void)_stateMachine_unconfigureAccessory
{
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__HMDLowPowerModeProfile__stateMachine_unconfigureAccessory__block_invoke;
  v4[3] = &unk_1E6A0C460;
  objc_copyWeak(&v5, &location);
  [(HMDLowPowerModeProfile *)self _unconfigureAccessoryWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__HMDLowPowerModeProfile__stateMachine_unconfigureAccessory__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = HMDLowPowerModeOperationStatusDescription(a3);
      *(_DWORD *)uint64_t v25 = 138544130;
      *(void *)&v25[4] = v10;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v8;
      *(_WORD *)&v25[22] = 2112;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Did unconfigure %@ with status: '%@' and error: %@", v25, 0x2Au);
    }
    id v12 = [v8 delegate];
    if (a3)
    {
      if (a3 == 3)
      {
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = v8;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          int v16 = HMFGetLogIdentifier();
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "retryCount"));
          *(_DWORD *)uint64_t v25 = 138543874;
          *(void *)&v25[4] = v16;
          *(_WORD *)&v25[12] = 2112;
          *(void *)&v25[14] = v14;
          *(_WORD *)&v25[22] = 2112;
          __int16 v26 = v17;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry unconfiguring of %@. Retry count: %@", v25, 0x20u);
        }
LABEL_15:

        uint64_t v18 = 4;
LABEL_20:
        objc_msgSend(v8, "enterState:", v18, *(_OWORD *)v25, *(void *)&v25[16], v26);

        goto LABEL_21;
      }
      if (a3 == 1)
      {
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = v8;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v8;
      int v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        uint64_t v23 = HMDLowPowerModeOperationStatusDescription(a3);
        int v24 = HMDLowPowerModeOperationTypeDescription(2);
        *(_DWORD *)uint64_t v25 = 138544130;
        *(void *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2112;
        *(void *)&v25[14] = v23;
        *(_WORD *)&v25[22] = 2112;
        __int16 v26 = v24;
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: %@ to operation: %@ with error: %@", v25, 0x2Au);
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v12 profile:v8 didUpdateWoWLANInfos:0];
      }
      if (objc_opt_respondsToSelector()) {
        [v12 profile:v8 didUpdateAccessoryState:0];
      }
    }
    uint64_t v18 = 0;
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_stateMachine_configureAccessory
{
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HMDLowPowerModeProfile__stateMachine_configureAccessory__block_invoke;
  v4[3] = &unk_1E6A0C488;
  objc_copyWeak(&v5, &location);
  [(HMDLowPowerModeProfile *)self _configureAccessoryWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__HMDLowPowerModeProfile__stateMachine_configureAccessory__block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = WeakRetained;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      id v14 = HMDLowPowerModeOperationStatusDescription(a4);
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v13;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      v35 = v14;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Did configure %@ with status: '%@' and error: %@", buf, 0x2Au);
    }
    uint64_t v15 = [v11 delegate];
    if (a4)
    {
      if (a4 == 3)
      {
        uint64_t v16 = 4;
LABEL_19:
        [v11 enterState:v16];

        goto LABEL_20;
      }
      if (a4 != 1)
      {
        __int16 v22 = (void *)MEMORY[0x1D9452090]();
        id v23 = v11;
        int v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          __int16 v26 = HMDLowPowerModeOperationStatusDescription(a4);
          HMDLowPowerModeOperationTypeDescription(2);
          __int16 v27 = v29 = v22;
          *(_DWORD *)buf = 138544130;
          uint64_t v31 = v25;
          __int16 v32 = 2112;
          id v33 = v26;
          __int16 v34 = 2112;
          v35 = v27;
          __int16 v36 = 2112;
          id v37 = v7;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: %@ to operation: %@ with error: %@", buf, 0x2Au);

          __int16 v22 = v29;
        }

        uint64_t v16 = 0;
        goto LABEL_19;
      }
      if (objc_opt_respondsToSelector()) {
        [v15 profile:v11 didUpdateWoWLANInfos:v8];
      }
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v11;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = HMFGetLogIdentifier();
        id v28 = v17;
        int v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "retryCount"));
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v20;
        __int16 v32 = 2112;
        id v33 = v18;
        __int16 v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry configuring of %@. Retry count: %@", buf, 0x20u);

        uint64_t v17 = v28;
      }

      uint64_t v16 = 4;
    }
    if (objc_opt_respondsToSelector()) {
      [v15 profile:v11 didUpdateAccessoryState:a4];
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_stateMachine_readAccessoryConfiguration
{
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HMDLowPowerModeProfile__stateMachine_readAccessoryConfiguration__block_invoke;
  v4[3] = &unk_1E6A0C460;
  objc_copyWeak(&v5, &location);
  [(HMDLowPowerModeProfile *)self _readAccessorySelectedConfigWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__HMDLowPowerModeProfile__stateMachine_readAccessoryConfiguration__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = HMDLowPowerModeOperationStatusDescription(a3);
      int v38 = 138544130;
      id v39 = v10;
      __int16 v40 = 2112;
      id v41 = v8;
      __int16 v42 = 2112;
      v43 = v11;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Did read configuration of %@ with status: '%@' and error: %@", (uint8_t *)&v38, 0x2Au);
    }
    if (a3 == 3)
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v8;
      int v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        __int16 v22 = HMFGetLogIdentifier();
        id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "retryCount"));
        int v38 = 138543874;
        id v39 = v22;
        __int16 v40 = 2112;
        id v41 = v20;
        __int16 v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Need to backoff and retry reading configuration for %@. Retry count: %@", (uint8_t *)&v38, 0x20u);
      }
      uint64_t v18 = 4;
    }
    else if (a3 == 1)
    {
      int v24 = [v8 connectivityInfo];
      uint64_t v25 = [v24 woWLANInfo];

      if (v25)
      {
        uint64_t v18 = 0;
      }
      else
      {
        __int16 v32 = (void *)MEMORY[0x1D9452090]();
        id v33 = v8;
        __int16 v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v35 = HMFGetLogIdentifier();
          __int16 v36 = [v33 accessory];
          id v37 = [v36 identifier];
          int v38 = 138543874;
          id v39 = v35;
          __int16 v40 = 2112;
          id v41 = v37;
          __int16 v42 = 2112;
          v43 = 0;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Need to reconfigure the accessory: %@. Accessory has stale WoWLANInfo: %@.", (uint8_t *)&v38, 0x20u);
        }
        uint64_t v18 = 2;
      }
    }
    else if (a3)
    {
      __int16 v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = v8;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        uint64_t v30 = HMDLowPowerModeOperationStatusDescription(a3);
        uint64_t v31 = HMDLowPowerModeOperationTypeDescription(2);
        int v38 = 138544130;
        id v39 = v29;
        __int16 v40 = 2112;
        id v41 = v30;
        __int16 v42 = 2112;
        v43 = v31;
        __int16 v44 = 2112;
        id v45 = v5;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received invalid status: '%@' to operation: '%@' with error: %@", (uint8_t *)&v38, 0x2Au);
      }
      uint64_t v18 = 0;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v8;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        uint64_t v16 = [v13 accessory];
        uint64_t v17 = [v16 identifier];
        int v38 = 138543618;
        id v39 = v15;
        __int16 v40 = 2112;
        id v41 = v17;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Need to configure the accessory: %@. Accessory is unconfigured.", (uint8_t *)&v38, 0x16u);
      }
      uint64_t v18 = 2;
    }
    [v8 enterState:v18];
  }
}

- (void)_stateMachine_Idle
{
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDLowPowerModeProfile *)self _stopBackoffTimerForType:1];
}

- (void)_stateMachine_backoffOperation
{
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDLowPowerModeProfile *)self _startTimerForType:1];
}

- (void)_enterState:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDLowPowerModeProfile *)self _canEnterNewState:a3])
  {
    if (a3 == 4 || (unint64_t internalState = self->_internalState, internalState == a3))
    {
      ++self->_retryCount;
      unint64_t internalState = self->_internalState;
    }
    self->_internalOldState = internalState;
    self->_unint64_t internalState = a3;
    if (self->_internalOldState == 4) {
      self->_internalOldState = 0;
    }
    id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v8 = [v7 preferenceForKey:@"lowPowerModeRetryCount"];
    id v9 = [v8 numberValue];

    unint64_t retryCount = self->_retryCount;
    if (retryCount > [v9 unsignedIntegerValue])
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_retryCount - 1];
        uint64_t v16 = HMDLowPowerModeStateMachineDescription(a3);
        int v23 = 138544130;
        int v24 = v14;
        __int16 v25 = 2112;
        __int16 v26 = v15;
        __int16 v27 = 2112;
        id v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v12;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Resetting state machine. Tried '%@' times for operation: '%@' for %@", (uint8_t *)&v23, 0x2Au);
      }
      self->_unint64_t retryCount = 0;
      [(HMDLowPowerModeProfile *)v12 _resetStateMachine];
    }
    [(HMDLowPowerModeProfile *)self _runStateMachine];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = HMDLowPowerModeStateMachineDescription(v18->_internalState);
      __int16 v22 = HMDLowPowerModeStateMachineDescription(a3);
      int v23 = 138543874;
      int v24 = v20;
      __int16 v25 = 2112;
      __int16 v26 = v21;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid machine state: %@ -> %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)enterState:(unint64_t)a3
{
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__HMDLowPowerModeProfile_enterState___block_invoke;
  v6[3] = &unk_1E6A189D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __37__HMDLowPowerModeProfile_enterState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enterState:*(void *)(a1 + 40)];
}

- (BOOL)_canEnterNewState:(unint64_t)a3
{
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  switch(self->_internalState)
  {
    case 0uLL:
      if (a3 < 2) {
        goto LABEL_12;
      }
      goto LABEL_13;
    case 1uLL:
      if (a3 >= 5) {
        goto LABEL_13;
      }
      unsigned int v6 = 29;
      goto LABEL_10;
    case 2uLL:
      if (a3 >= 5) {
        goto LABEL_13;
      }
      LOBYTE(v7) = (a3 & 1) == 0;
      return v7;
    case 3uLL:
      if (a3 >= 5) {
        goto LABEL_13;
      }
      unsigned int v6 = 25;
LABEL_10:
      BOOL v7 = (v6 >> a3) & 1;
      break;
    case 4uLL:
      if (a3 - 1 >= 3) {
        goto LABEL_13;
      }
LABEL_12:
      LOBYTE(v7) = 1;
      break;
    default:
LABEL_13:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (void)_resetStateMachine
{
  self->_unint64_t internalState = 0;
  self->_internalOldState = 0;
  self->_unint64_t retryCount = 0;
}

- (void)_runStateMachine
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  unsigned int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = HMFGetLogIdentifier();
    HMDLowPowerModeStateMachineDescription(v5->_internalOldState);
    id v8 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    HMDLowPowerModeStateMachineDescription(v5->_internalState);
    id v9 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    int v20 = 138544130;
    int v21 = v7;
    __int16 v22 = 2112;
    int v23 = v8;
    __int16 v24 = 2112;
    __int16 v25 = v9;
    __int16 v26 = 2112;
    __int16 v27 = v5;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@LPM running state: '%@' -> '%@' for %@", (uint8_t *)&v20, 0x2Au);
  }
  if (v5->_internalState)
  {
    uint64_t v10 = [(HMDLowPowerModeProfile *)v5 _shouldManageAccessoryLPM];
    if ((v10 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v5;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        int v20 = 138543618;
        int v21 = v14;
        __int16 v22 = 2112;
        int v23 = v12;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping processing state machine update since a resident is present for %@", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v10 = [(HMDLowPowerModeProfile *)v12 _enterState:0];
    }
    switch(v5->_internalState)
    {
      case 0uLL:
        goto LABEL_9;
      case 1uLL:
        [(HMDLowPowerModeProfile *)v5 _stateMachine_readAccessoryConfiguration];
        break;
      case 2uLL:
        [(HMDLowPowerModeProfile *)v5 _stateMachine_configureAccessory];
        break;
      case 3uLL:
        [(HMDLowPowerModeProfile *)v5 _stateMachine_unconfigureAccessory];
        break;
      case 4uLL:
        [(HMDLowPowerModeProfile *)v5 _stateMachine_backoffOperation];
        break;
      default:
        uint64_t v15 = (void *)MEMORY[0x1D9452090](v10);
        uint64_t v16 = v5;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v5->_internalState];
          int v20 = 138543874;
          int v21 = v18;
          __int16 v22 = 2112;
          int v23 = v19;
          __int16 v24 = 2112;
          __int16 v25 = v16;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid LPM state: %@ for %@", (uint8_t *)&v20, 0x20u);
        }
        break;
    }
  }
  else
  {
LABEL_9:
    [(HMDLowPowerModeProfile *)v5 _stateMachine_Idle];
  }
}

- (void)_wakeSuspendedAccessory:(id)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v11);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke;
  aBlock[3] = &unk_1E6A18500;
  objc_copyWeak(&v22, &location);
  id v12 = v8;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  id v14 = _Block_copy(aBlock);
  [(HMDLowPowerModeProfile *)self setPendingWakeBlock:v14];
  [v9 markWithReason:@"Waking Suspended Accessory"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke_50;
  v16[3] = &unk_1E6A16F80;
  objc_copyWeak(&v18, &location);
  id v15 = v14;
  id v17 = v15;
  [v12 wakeWithCompletion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v6 = [WeakRetained pendingWakeBlock];

    if (v6)
    {
      [v5 setSuspendedAccessory:0];
      [v5 setPendingWakeBlock:0];
      BOOL v7 = (void *)MEMORY[0x1D9452090]([v5 _stopBackoffTimerForType:2]);
      id v8 = v5;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = 138543874;
        id v13 = v10;
        __int16 v14 = 2112;
        id v15 = v3;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Pending wake block was called with error: %@ for %@", (uint8_t *)&v12, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __70__HMDLowPowerModeProfile__wakeSuspendedAccessory_activity_completion___block_invoke_50(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    [WeakRetained _startTimerForType:2];
  }
}

- (void)wakeAccessoryWithType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v10 = NSString;
  uint64_t v11 = MEMORY[0x1D94505D0](self, a2);
  int v12 = [v10 stringWithFormat:@"%@, %s:%ld", v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/PowerManagement/WakeOnLAN/HMDLowPowerModeProfile.m", 177];
  id v13 = (void *)[v9 initWithName:v12];

  __int16 v14 = [(HMDLowPowerModeProfile *)self suspendedAccessory];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = [(HMDLowPowerModeProfile *)v16 suspendedAccessory];
      *(_DWORD *)buf = 138543874;
      v83 = v18;
      __int16 v84 = 2112;
      v85 = v16;
      __int16 v86 = 2112;
      v87 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Wake operation is in progress for %@ with suspended accessory: %@", buf, 0x20u);
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 15;
LABEL_9:
    __int16 v27 = [v20 hmErrorWithCode:v21];
    v7[2](v7, 0, v27);
    goto LABEL_10;
  }
  if (a3 >= 2)
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    int v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      __int16 v26 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138543874;
      v83 = v25;
      __int16 v84 = 2112;
      v85 = v26;
      __int16 v86 = 2112;
      v87 = v23;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake type is used '%@' for accessory %@", buf, 0x20u);
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = 3;
    goto LABEL_9;
  }
  uint64_t v28 = [(HMDLowPowerModeProfile *)self connectivityInfo];
  __int16 v27 = [v28 woWLANInfo];

  id v74 = [(HMDLowPowerModeProfile *)self newHAPSuspendedAccessoryFromAccessoryConnectivityInfoWithType:a3];
  __int16 v29 = [(HMDAccessoryProfile *)self accessory];
  uint64_t v30 = [v29 home];
  uint64_t v31 = [v30 availableBSPsCount];
  uint64_t v76 = [v31 unsignedIntegerValue];

  __int16 v32 = (void *)MEMORY[0x1D9452090]();
  id v33 = self;
  __int16 v34 = HMFGetOSLogHandle();
  v75 = v29;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v72 = HMFGetLogIdentifier();
    v66 = [v29 identifier];
    [NSNumber numberWithUnsignedInteger:a3];
    v70 = v32;
    v35 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v27, "version"));
    __int16 v36 = v68 = v33;
    id v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "wakePacketType"));
    int v38 = [NSNumber numberWithUnsignedInteger:v76];
    *(_DWORD *)buf = 138544642;
    v83 = v72;
    __int16 v84 = 2112;
    v85 = v66;
    __int16 v86 = 2112;
    v87 = v35;
    __int16 v88 = 2112;
    id v89 = v36;
    __int16 v90 = 2112;
    v91 = v37;
    __int16 v92 = 2112;
    v93 = v38;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Waking suspended accessory: %@, wakeType: %@, version: %@, wakePacketType: %@, numBSP: %@", buf, 0x3Eu);

    __int16 v29 = v75;
    id v33 = v68;

    __int16 v32 = v70;
  }

  v73 = v13;
  id v39 = v13;
  [v29 uuid];

  id v40 = (id)[NSNumber numberWithUnsignedInteger:a3];
  id v41 = (id)objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v27, "version"));
  id v42 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "wakePacketType"));
  id v43 = (id)[NSNumber numberWithUnsignedInteger:v76];

  __int16 v44 = [(HMDLowPowerModeProfile *)v33 hapAccessory];
  id v45 = [(HMDLowPowerModeProfile *)v33 hapAccessory];
  [v45 identifier];
  __int16 v47 = v46 = v29;
  uint64_t v48 = [v44 matchingHAPAccessoryWithServerIdentifier:v47 linkType:1];

  v71 = v48;
  uint64_t v49 = [(HMDLowPowerModeProfile *)v48 server];
  if ([v49 wakeNumber])
  {
    id v50 = v39;
    [v46 uuid];

    id v51 = (id)[NSNumber numberWithUnsignedInteger:a3];
    id v52 = (id)[NSNumber numberWithUnsignedInteger:v76];

    v53 = v74;
    v54 = (void *)MEMORY[0x1D9452090]([v49 setSuspendedAccessory:v74]);
    v55 = v33;
    v56 = HMFGetOSLogHandle();
    v57 = v71;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v67 = HMFGetLogIdentifier();
      [v75 identifier];
      v69 = v49;
      v58 = (HMDLowPowerModeProfile *)objc_claimAutoreleasedReturnValue();
      v59 = [NSNumber numberWithUnsignedInteger:a3];
      v60 = [NSNumber numberWithUnsignedInteger:v76];
      *(_DWORD *)buf = 138544642;
      v83 = v67;
      __int16 v84 = 2112;
      v85 = v58;
      __int16 v86 = 2112;
      v87 = v71;
      __int16 v88 = 2112;
      id v89 = v74;
      __int16 v90 = 2112;
      v91 = v59;
      __int16 v92 = 2112;
      v93 = v60;
      _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Found accessory server for %@. Returning the HAPAccessory: %@. Wake will be via suspended accessory: %@, wakeType: %@, numBSP: %@", buf, 0x3Eu);

      uint64_t v49 = v69;
      v53 = v74;
    }
    ((void (**)(id, HMDLowPowerModeProfile *, void *))v7)[2](v7, v71, 0);
    id v13 = v73;
  }
  else
  {
    v53 = v74;
    [(HMDLowPowerModeProfile *)v33 setSuspendedAccessory:v74];
    v61 = [(HMDLowPowerModeProfile *)v33 hapAccessory];
    v62 = [v61 home];
    v63 = [v62 accessoryBrowser];

    v64 = [(HMDLowPowerModeProfile *)v33 hapAccessory];
    v65 = [v64 identifier];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __59__HMDLowPowerModeProfile_wakeAccessoryWithType_completion___block_invoke;
    v77[3] = &unk_1E6A0C438;
    id v78 = v74;
    v79 = v33;
    id v80 = v39;
    v81 = v7;
    [v63 currentlyFoundHAPAccessoryServerWithIdentifier:v65 linkType:1 completion:v77];

    v57 = v71;
    id v13 = v73;
  }

LABEL_10:
}

void __59__HMDLowPowerModeProfile_wakeAccessoryWithType_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if ([v5 wakeNumber])
  {
    id v14 = 0;
    [v5 getBonjourDeviceDNSName:&v14];
    id v6 = v14;
    [a1[4] setDnsName:v6];
  }
  BOOL v7 = [a1[5] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HMDLowPowerModeProfile_wakeAccessoryWithType_completion___block_invoke_2;
  block[3] = &unk_1E6A18398;
  int8x16_t v9 = *((int8x16_t *)a1 + 2);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  id v12 = a1[6];
  id v13 = a1[7];
  dispatch_async(v7, block);
}

uint64_t __59__HMDLowPowerModeProfile_wakeAccessoryWithType_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wakeSuspendedAccessory:*(void *)(a1 + 40) activity:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)wakeAccessoryWithCompletion:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDLowPowerModeProfile *)self connectivityInfo];
  id v5 = [v4 woWLANInfo];
  BOOL v6 = [v5 wakeType] == 2;

  [(HMDLowPowerModeProfile *)self wakeAccessoryWithType:v6 completion:v7];
}

- (void)dealloc
{
  [(HMDLowPowerModeProfile *)self unconfigure];
  v3.receiver = self;
  v3.super_class = (Class)HMDLowPowerModeProfile;
  [(HMDLowPowerModeProfile *)&v3 dealloc];
}

- (void)unconfigure
{
  v4.receiver = self;
  v4.super_class = (Class)HMDLowPowerModeProfile;
  [(HMDAccessoryProfile *)&v4 unconfigure];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(HMDLowPowerModeProfile *)self _updateCharacteristicsNotifications:0];
}

- (void)handleInitialState
{
  objc_super v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDLowPowerModeProfile;
  [(HMDAccessoryProfile *)&v4 handleInitialState];
  [(HMDLowPowerModeProfile *)self _readInitialRequiredCharacteristics];
}

- (void)registerForMessages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v13.receiver = self;
  v13.super_class = (Class)HMDLowPowerModeProfile;
  [(HMDAccessoryProfile *)&v13 registerForMessages];
  objc_super v4 = [(HMDAccessoryProfile *)self accessory];
  id v5 = [v4 home];
  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int8x16_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for messages with home: %@ for %@", buf, 0x20u);
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:v7 selector:sel_handleAccessoryCharacteristicsChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v4];

  int8x16_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v7 selector:sel_handleAccessoryConfigurationChanged_ name:@"HMDAccessoryConnectedNotification" object:v4];

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:v7 selector:sel_handleAccessoryConfigurationChanged_ name:@"HMDAccessoryDisconnectedNotification" object:v4];
}

- (HMDLowPowerModeProfile)initWithAccessory:(id)a3 powerManagementservice:(id)a4 workQueue:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (HMDLowPowerModeUUIDFromAccessory_onceToken != -1) {
    dispatch_once(&HMDLowPowerModeUUIDFromAccessory_onceToken, &__block_literal_global_242);
  }
  int8x16_t v11 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  id v12 = [v8 uuid];
  id v13 = v11;
  objc_msgSend(v12, "getUUIDBytes:", objc_msgSend(v13, "mutableBytes"));

  id v14 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", HMDLowPowerModeUUIDFromAccessory_namespace, v13);

  v24[0] = v9;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v23.receiver = self;
  v23.super_class = (Class)HMDLowPowerModeProfile;
  __int16 v16 = [(HMDAccessoryProfile *)&v23 initWithAccessory:v8 uniqueIdentifier:v14 services:v15 workQueue:v10];

  if (v16)
  {
    uint64_t v17 = NSString;
    __int16 v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v18 UUIDString];
    uint64_t v20 = [v17 stringWithFormat:@"%@.HMDLowPowerMode.%@", @"com.apple.HomeKitDaemon", v19];
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v20;

    objc_storeWeak((id *)&v16->_delegate, v8);
    [(HMDLowPowerModeProfile *)v16 _resetStateMachine];
  }

  return v16;
}

+ (id)WoWLANInfoForSupportedSleepConfiguration:(id)a3
{
  return HMDLowPowerModeWoWLANInfoForSupportedSleepConfiguration(a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46 != -1) {
    dispatch_once(&logCategory__hmf_once_t46, &__block_literal_global_78);
  }
  id v2 = (void *)logCategory__hmf_once_v47;
  return v2;
}

uint64_t __37__HMDLowPowerModeProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v47;
  logCategory__hmf_once___int16 v47 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end