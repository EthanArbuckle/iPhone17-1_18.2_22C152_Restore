@interface HAPPowerManager
+ (HAPPowerManager)sharedInstance;
+ (id)logCategory;
- (HAPPowerManager)init;
- (IONotificationPort)systemPowerPort;
- (NSMapTable)delegatesMap;
- (unsigned)systemPowerMgr;
- (unsigned)systemPowerNotifier;
- (void)deRegisterFromSleepWake:(id)a3;
- (void)dealloc;
- (void)registerForSleepWake:(id)a3 queue:(id)a4;
- (void)setDelegatesMap:(id)a3;
- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4;
@end

@implementation HAPPowerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesMap, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setDelegatesMap:(id)a3
{
}

- (NSMapTable)delegatesMap
{
  return self->_delegatesMap;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (unsigned)systemPowerMgr
{
  return self->_systemPowerMgr;
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1D944E080](self, a2);
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = StringForSystemPowerChangedMessage(v5);
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@System power changed: %@", buf, 0x16u);
  }
  switch(v5)
  {
    case 0xE0000270:
      goto LABEL_14;
    case 0xE0000320:
      uint64_t v12 = 2;
      [(HAPPowerManager *)v8 delegatesMap];
      break;
    case 0xE0000280:
      uint64_t v12 = 1;
      [(HAPPowerManager *)v8 delegatesMap];
      break;
    default:
      return;
  v13 = };
  v14 = [v13 keyEnumerator];

  uint64_t v15 = [v14 nextObject];
  if (v15)
  {
    v16 = (void *)v15;
    do
    {
      v17 = [(HAPPowerManager *)v8 delegatesMap];
      v18 = [v17 objectForKey:v16];

      if (v18)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__HAPPowerManager_systemPowerChanged_notificationID___block_invoke;
        block[3] = &unk_1E69F3A58;
        id v30 = v16;
        uint64_t v31 = v12;
        dispatch_async(v18, block);
      }
      uint64_t v19 = [v14 nextObject];

      v16 = (void *)v19;
    }
    while (v19);
  }

  a4 = v28;
  if (v27)
  {
LABEL_14:
    IOReturn v20 = IOAllowPowerChange([(HAPPowerManager *)v8 systemPowerMgr], (intptr_t)a4);
    if (v20)
    {
      IOReturn v21 = v20;
      v22 = (void *)MEMORY[0x1D944E080]();
      v23 = v8;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        v26 = StringForSystemPowerChangedMessage(v5);
        *(_DWORD *)buf = 138543874;
        v33 = v25;
        __int16 v34 = 2112;
        v35 = v26;
        __int16 v36 = 1024;
        IOReturn v37 = v21;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to allow for %@ with error: %d", buf, 0x1Cu);
      }
    }
  }
}

uint64_t __53__HAPPowerManager_systemPowerChanged_notificationID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) devicePowerStateChanged:*(void *)(a1 + 40)];
}

- (void)deRegisterFromSleepWake:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HAPPowerManager_deRegisterFromSleepWake___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __43__HAPPowerManager_deRegisterFromSleepWake___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegatesMap];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)registerForSleepWake:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HAPPowerManager_registerForSleepWake_queue___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __46__HAPPowerManager_registerForSleepWake_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegatesMap];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegatesMap];
  [v3 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  kern_return_t v12;
  kern_return_t v13;
  void *v14;
  HAPPowerManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HAPPowerManager *v19;
  NSObject *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  IOReturn v26;
  uint64_t v27;

  int v27 = *MEMORY[0x1E4F143B8];
  p_systemPowerNotifier = &self->_systemPowerNotifier;
  if (self->_systemPowerNotifier)
  {
    IOReturn v4 = IODeregisterForSystemPower(&self->_systemPowerNotifier);
    if (v4)
    {
      IOReturn v5 = v4;
      id v6 = (void *)MEMORY[0x1D944E080]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        v25 = 1024;
        v26 = v5;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to deregister from system power with error: %d", buf, 0x12u);
      }
    }
    unsigned int *p_systemPowerNotifier = 0;
  }
  systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort)
  {
    IONotificationPortDestroy(systemPowerPort);
    self->_systemPowerPort = 0;
  }
  io_connect_t systemPowerMgr = self->_systemPowerMgr;
  if (systemPowerMgr)
  {
    id v12 = IOServiceClose(systemPowerMgr);
    if (v12)
    {
      id v13 = v12;
      v14 = (void *)MEMORY[0x1D944E080]();
      uint64_t v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        v25 = 1024;
        v26 = v13;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to close power IO Service with error: %d", buf, 0x12u);
      }
    }
    self->_io_connect_t systemPowerMgr = 0;
  }
  v18 = (void *)MEMORY[0x1D944E080]();
  uint64_t v19 = self;
  IOReturn v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    IOReturn v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Deallocating Power Manager", buf, 0xCu);
  }
  v22.receiver = v19;
  v22.super_class = (Class)HAPPowerManager;
  [(HAPPowerManager *)&v22 dealloc];
}

- (HAPPowerManager)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HAPPowerManager;
  id v2 = [(HAPPowerManager *)&v18 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("HAPPowerManager", v3);
    IOReturn v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    io_connect_t v8 = IORegisterForSystemPower(v2, (IONotificationPortRef *)v2 + 3, (IOServiceInterestCallback)PowerChangedCallback, (io_object_t *)v2 + 5);
    *((_DWORD *)v2 + 4) = v8;
    if (v8)
    {
      IONotificationPortSetDispatchQueue((IONotificationPortRef)[v2 systemPowerPort], *((dispatch_queue_t *)v2 + 1));
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D944E080]();
      id v10 = v2;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        IOReturn v20 = v12;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error registering for system power", buf, 0xCu);
      }
    }
  }
  id v13 = (void *)MEMORY[0x1D944E080]();
  v14 = (HAPPowerManager *)v2;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    IOReturn v20 = v16;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Initialized Power Manager.", buf, 0xCu);
  }
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1) {
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_6);
  }
  id v2 = (void *)logCategory__hmf_once_v8;

  return v2;
}

uint64_t __30__HAPPowerManager_logCategory__block_invoke()
{
  logCategory__hmf_once_io_connect_t v8 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

+ (HAPPowerManager)sharedInstance
{
  if (sharedInstance_onceToken_15472 != -1) {
    dispatch_once(&sharedInstance_onceToken_15472, &__block_literal_global_15473);
  }
  id v2 = (void *)sharedInstance_powerManager;

  return (HAPPowerManager *)v2;
}

uint64_t __33__HAPPowerManager_sharedInstance__block_invoke()
{
  sharedInstance_powerManager = objc_alloc_init(HAPPowerManager);

  return MEMORY[0x1F41817F8]();
}

@end