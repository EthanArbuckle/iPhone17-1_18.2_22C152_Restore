@interface HMDThreadMonitor
+ (id)createWithRadarInitiator:(id)a3;
+ (id)logCategory;
+ (id)sharedInstance;
+ (void)start;
- (BOOL)setup;
- (HMMRadarInitiating)radarInitiator;
- (void)previousHook;
- (void)pthreadHookWithEvent:(unsigned int)a3;
- (void)resetWithRadarInitiator:(id)a3;
@end

@implementation HMDThreadMonitor

- (void)pthreadHookWithEvent:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_counterLock = &self->counterLock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  if (a3 == 1)
  {
    unint64_t v7 = self->currentCount + 1;
    self->unint64_t currentCount = v7;
    unint64_t threshold = self->threshold;
    if (v7 >= threshold)
    {
      v9 = (void *)MEMORY[0x230FBD990](v6);
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        unint64_t currentCount = self->currentCount;
        *(_DWORD *)buf = 138543618;
        v17 = v12;
        __int16 v18 = 2048;
        unint64_t v19 = currentCount;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Above thread count threshold: %zu", buf, 0x16u);
      }
      unint64_t v7 = self->currentCount;
      unint64_t threshold = self->threshold;
    }
    if (v7 == threshold && self->ttrEnabled)
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"homed thread count is above %zu", threshold);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_radarInitiator);
      [WeakRetained requestRadarWithDisplayReason:v14 radarTitle:v14 componentName:@"HomeKit" componentVersion:@"Performance - cpu" componentID:1653014];
    }
  }
  else if (a3 == 4)
  {
    --self->currentCount;
  }
  os_unfair_lock_unlock(p_counterLock);
}

- (void)previousHook
{
  return self->_previousHook;
}

+ (id)sharedInstance
{
  if (sharedInstance__hmf_once_t0 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0, &__block_literal_global_92122);
  }
  v2 = (void *)sharedInstance__hmf_once_v1;
  return v2;
}

- (void).cxx_destruct
{
}

- (HMMRadarInitiating)radarInitiator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radarInitiator);
  return (HMMRadarInitiating *)WeakRetained;
}

- (BOOL)setup
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v3 = HMFIsInternalBuild();
  if (!v3) {
    return v3;
  }
  v4 = +[HMDTTRManager sharedManager];
  [(HMDThreadMonitor *)self resetWithRadarInitiator:v4];

  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v33 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@starting thread monitoring", buf, 0xCu);
  }
  v9 = (ipc_space_t *)MEMORY[0x263EF8960];
  uint64_t v10 = *MEMORY[0x263EF8960];
  mach_msg_type_number_t act_listCnt = 0;
  thread_act_array_t v30 = 0;
  if (task_threads(v10, &v30, &act_listCnt))
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v33 = v14;
    v15 = "%{public}@Failed to get initial thread count";
    v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 12;
    goto LABEL_14;
  }
  if (act_listCnt)
  {
    for (unint64_t i = 0; i < act_listCnt; mach_port_deallocate(*v9, v30[i++]))
      ;
    uint64_t v20 = 4 * act_listCnt;
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = MEMORY[0x230FBE840](v10, v30, v20);
  v6->unint64_t currentCount = act_listCnt;
  v11 = (void *)MEMORY[0x230FBD990](v21);
  v12 = v6;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    unint64_t threshold = v12->threshold;
    BOOL ttrEnabled = v12->ttrEnabled;
    *(_DWORD *)buf = 138544130;
    v33 = v14;
    __int16 v34 = 1024;
    mach_msg_type_number_t v35 = act_listCnt;
    __int16 v36 = 2048;
    unint64_t v37 = threshold;
    __int16 v38 = 1024;
    BOOL v39 = ttrEnabled;
    v15 = "%{public}@initial thread count: %u (threshold: %zu, TTR enabled: %u)";
    v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    uint32_t v18 = 34;
LABEL_14:
    _os_log_impl(&dword_22F52A000, v16, v17, v15, buf, v18);
  }
LABEL_15:

  v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))pthread_introspection_hook_install((pthread_introspection_hook_t)HMDPthreadHook);
  v6->_previousHook = v24;
  if (v24 == HMDPthreadHook)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v6;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Reinstalling the same hook", buf, 0xCu);
    }
    v6->_previousHook = 0;
  }
  return v3;
}

- (void)resetWithRadarInitiator:(id)a3
{
  self->counterLock._os_unfair_lock_opaque = 0;
  self->unint64_t currentCount = 0;
  v4 = (void *)MEMORY[0x263F42608];
  id v5 = a3;
  id v11 = [v4 sharedPreferences];
  uint64_t v6 = [v11 preferenceForKey:@"threadMonitorThreshold"];
  unint64_t v7 = [v6 numberValue];
  int v8 = [v7 intValue];

  if (v8 <= 20) {
    unint64_t v9 = 20;
  }
  else {
    unint64_t v9 = v8;
  }
  self->unint64_t threshold = v9;
  uint64_t v10 = [v11 preferenceForKey:@"threadMonitorEnableTTR"];
  self->BOOL ttrEnabled = [v10 BOOLValue];

  self->_previousHook = 0;
  objc_storeWeak((id *)&self->_radarInitiator, v5);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_92117 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_92117, &__block_literal_global_12);
  }
  v2 = (void *)logCategory__hmf_once_v13_92118;
  return v2;
}

void __31__HMDThreadMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_92118;
  logCategory__hmf_once_v13_92118 = v0;
}

+ (void)start
{
  v2 = +[HMDThreadMonitor sharedInstance];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__HMDThreadMonitor_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  id v6 = v2;
  uint64_t v3 = start__hmf_once_t3;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&start__hmf_once_t3, block);
  }
}

uint64_t __25__HMDThreadMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setup];
}

+ (id)createWithRadarInitiator:(id)a3
{
  id v3 = a3;
  id v4 = +[HMDThreadMonitor sharedInstance];
  id v5 = v4;
  if (v4) {
    [v4 resetWithRadarInitiator:v3];
  }

  return v5;
}

void __34__HMDThreadMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDThreadMonitor);
  v1 = (void *)sharedInstance__hmf_once_v1;
  sharedInstance__hmf_once_v1 = (uint64_t)v0;
}

@end