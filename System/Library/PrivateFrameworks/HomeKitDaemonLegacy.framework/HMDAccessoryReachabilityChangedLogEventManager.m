@interface HMDAccessoryReachabilityChangedLogEventManager
+ (id)logCategory;
- (HMDAccessoryReachabilityChangedLogEventManager)initWithHome:(id)a3;
- (HMDHome)home;
- (OS_dispatch_queue)workQueue;
- (id)logEventSubmitter;
- (id)logIdentifier;
- (void)_disable;
- (void)_enable;
- (void)_reset;
- (void)_submit;
- (void)_submitDailyUpdateForAccessory:(id)a3 withTransportReport:(id)a4;
- (void)_submitForAccessory:(id)a3;
- (void)_submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5 changed:(BOOL)a6;
- (void)configure;
- (void)handlePrimaryResidentUpdatedNotification:(id)a3;
- (void)runDailyTask;
- (void)submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5;
@end

@implementation HMDAccessoryReachabilityChangedLogEventManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_transportReachabilityChangeDatesByUUID, 0);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryReachabilityChangedLogEventManager *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)runDailyTask
{
  v3 = [(HMDAccessoryReachabilityChangedLogEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HMDAccessoryReachabilityChangedLogEventManager_runDailyTask__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__HMDAccessoryReachabilityChangedLogEventManager_runDailyTask__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@action=submit reason=periodic", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _submit];
}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  v4 = [(HMDAccessoryReachabilityChangedLogEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__HMDAccessoryReachabilityChangedLogEventManager_handlePrimaryResidentUpdatedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __91__HMDAccessoryReachabilityChangedLogEventManager_handlePrimaryResidentUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) home];
  int v3 = [v2 isCurrentDeviceConfirmedPrimaryResident];

  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@action=enable reason=primary", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 32) _enable];
  }
  else
  {
    if (v7)
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@action=disable reason=not_primary", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 32) _disable];
  }
}

- (void)_disable
{
  if (self->_enabled)
  {
    [(HMDAccessoryReachabilityChangedLogEventManager *)self _submit];
    self->_enabled = 0;
  }
}

- (void)_enable
{
  if (!self->_enabled)
  {
    [(HMDAccessoryReachabilityChangedLogEventManager *)self _reset];
    self->_enabled = 1;
  }
}

- (void)_submit
{
  if (self->_enabled)
  {
    int v3 = [(HMDAccessoryReachabilityChangedLogEventManager *)self home];
    v4 = [v3 accessories];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__HMDAccessoryReachabilityChangedLogEventManager__submit__block_invoke;
    v5[3] = &unk_1E6A08E80;
    v5[4] = self;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
  }
}

uint64_t __57__HMDAccessoryReachabilityChangedLogEventManager__submit__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _submitForAccessory:a2];
}

- (void)_reset
{
  int v3 = [MEMORY[0x1E4F1C9C8] now];
  v4 = [(HMDAccessoryReachabilityChangedLogEventManager *)self home];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v6 = [v4 accessories];
  BOOL v7 = (NSMutableDictionary *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  transportReachabilityChangeDatesByUUID = self->_transportReachabilityChangeDatesByUUID;
  self->_transportReachabilityChangeDatesByUUID = v7;

  uint64_t v9 = [v4 accessories];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke;
  v11[3] = &unk_1E6A08E58;
  v11[4] = self;
  id v12 = v3;
  id v10 = v3;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);
}

void __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v6 = [v3 uuid];
  [v5 setObject:v4 forKeyedSubscript:v6];

  BOOL v7 = [v3 transportReports];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke_2;
  v10[3] = &unk_1E6A08E30;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);
}

void __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[5];
  uint64_t v2 = a1[6];
  v4 = *(void **)(a1[4] + 8);
  id v5 = a2;
  id v8 = [v3 uuid];
  v6 = [v4 objectForKeyedSubscript:v8];
  BOOL v7 = [v5 linkType];

  [v6 setObject:v2 forKeyedSubscript:v7];
}

- (void)_submitForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transportReports];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAccessoryReachabilityChangedLogEventManager__submitForAccessory___block_invoke;
  v7[3] = &unk_1E6A08E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
}

uint64_t __70__HMDAccessoryReachabilityChangedLogEventManager__submitForAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _submitDailyUpdateForAccessory:*(void *)(a1 + 40) withTransportReport:a2];
}

- (void)_submitDailyUpdateForAccessory:(id)a3 withTransportReport:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[HMDAccessoryReachabilityChangedLogEventManager _submitForAccessory:withTransportReport:reachable:changed:](self, "_submitForAccessory:withTransportReport:reachable:changed:", v7, v6, [v7 isReachable], 0);
}

- (void)_submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5 changed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v27 = a3;
  id v10 = a4;
  if (v27)
  {
    if (v10)
    {
      if (self->_enabled)
      {
        transportReachabilityChangeDatesByUUID = self->_transportReachabilityChangeDatesByUUID;
        id v12 = [v27 uuid];
        uint64_t v13 = [(NSMutableDictionary *)transportReachabilityChangeDatesByUUID objectForKeyedSubscript:v12];
        v14 = [v10 linkType];
        v15 = [v13 objectForKeyedSubscript:v14];

        if (v15
          || ([v10 reachableLastChangedTime], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v16 = [MEMORY[0x1E4F1C9C8] now];
          [v16 timeIntervalSinceDate:v15];
          double v18 = v17;
          v19 = self->_transportReachabilityChangeDatesByUUID;
          v20 = [v27 uuid];
          v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];

          if (!v21)
          {
            v21 = objc_opt_new();
            v22 = self->_transportReachabilityChangeDatesByUUID;
            v23 = [v27 uuid];
            [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];
          }
          v24 = [v10 linkType];
          [v21 setObject:v16 forKeyedSubscript:v24];

          v25 = +[HMDAccessoryReachabilityChangedLogEvent eventWithReachable:v7 changed:v6 duration:v27 accessory:v10 transportReport:v18];
          v26 = [(HMDAccessoryReachabilityChangedLogEventManager *)self logEventSubmitter];
          [v26 submitLogEvent:v25 error:0];
        }
      }
    }
  }
}

- (void)submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDAccessoryReachabilityChangedLogEventManager *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__HMDAccessoryReachabilityChangedLogEventManager_submitForAccessory_withTransportReport_reachable___block_invoke;
  v13[3] = &unk_1E6A15B38;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __99__HMDAccessoryReachabilityChangedLogEventManager_submitForAccessory_withTransportReport_reachable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitForAccessory:*(void *)(a1 + 40) withTransportReport:*(void *)(a1 + 48) reachable:*(unsigned __int8 *)(a1 + 56) changed:1];
}

- (void)configure
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  id v5 = [(HMDAccessoryReachabilityChangedLogEventManager *)self home];
  id v4 = [v5 dailyScheduler];
  [v4 registerDailyTaskRunner:self];
}

- (HMDAccessoryReachabilityChangedLogEventManager)initWithHome:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryReachabilityChangedLogEventManager;
  id v5 = [(HMDAccessoryReachabilityChangedLogEventManager *)&v13 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_home, v4);
    v6->_enabled = 0;
    uint64_t v7 = objc_opt_new();
    transportReachabilityChangeDatesByUUID = v6->_transportReachabilityChangeDatesByUUID;
    v6->_transportReachabilityChangeDatesByUUID = (NSMutableDictionary *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("HMDReachabilityChangedLogEventManagerWorkQueue", v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v6;
}

- (id)logEventSubmitter
{
  return +[HMDMetricsManager sharedLogEventSubmitter];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_27447 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_27447, &__block_literal_global_27448);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v4_27449;
  return v2;
}

uint64_t __61__HMDAccessoryReachabilityChangedLogEventManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_27449;
  logCategory__hmf_once_v4_27449 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end