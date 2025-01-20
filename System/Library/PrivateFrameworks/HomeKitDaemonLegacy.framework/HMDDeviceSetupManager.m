@interface HMDDeviceSetupManager
+ (id)sharedManager;
- (BOOL)isRunning;
- (HMDCoreFollowUpManager)followUpManager;
- (HMDDeviceSetupManager)initWithNotificationCenter:(id)a3 followUpManager:(id)a4 darwinNotificationProvider:(id)a5;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (NSNotificationCenter)notificationCenter;
- (void)dealloc;
@end

@implementation HMDDeviceSetupManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_followUpManager, 0);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 40, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCoreFollowUpManager)followUpManager
{
  return (HMDCoreFollowUpManager *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isRunning
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_running;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = (unsigned int *)v2;
  if (v2)
  {
    v4 = [(HMDDeviceSetupManager *)v2 darwinNotificationProvider];
    int v5 = [v4 notifyIsValidToken:v3[3]];

    if (v5)
    {
      v6 = [v3 darwinNotificationProvider];
      int v7 = [v6 notifyCancel:v3[3]];

      if (v7)
      {
        v8 = (void *)MEMORY[0x1D9452090]();
        v9 = v3;
        v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v14 = v11;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unregister for ProxSetup notifications", buf, 0xCu);
        }
      }
      else
      {
        v3[3] = -1;
      }
    }
  }

  v12.receiver = v3;
  v12.super_class = (Class)HMDDeviceSetupManager;
  [(HMDDeviceSetupManager *)&v12 dealloc];
}

- (HMDDeviceSetupManager)initWithNotificationCenter:(id)a3 followUpManager:(id)a4 darwinNotificationProvider:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HMDDeviceSetupManager;
  objc_super v12 = [(HMDDeviceSetupManager *)&v26 init];
  v13 = v12;
  if (v12)
  {
    p_proxSetupNotificationToken = &v12->_proxSetupNotificationToken;
    v12->_proxSetupNotificationToken = -1;
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong((id *)&v13->_followUpManager, a4);
    objc_storeStrong((id *)&v13->_darwinNotificationProvider, a5);
    uint64_t v15 = v13;
    v16 = v15;
    if (*p_proxSetupNotificationToken == -1)
    {
      objc_initWeak(&location, v15);
      v17 = [(HMDDeviceSetupManager *)v16 darwinNotificationProvider];
      uint64_t v18 = [@"com.apple.sharing.wha-prox-setup" UTF8String];
      id v19 = MEMORY[0x1E4F14428];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = ____HMDDeviceSetupManagerRegisterForProxSetupNotifications_block_invoke;
      v27[3] = &unk_1E6A13E10;
      objc_copyWeak(&v28, &location);
      int v20 = [v17 notifyRegisterDispatch:v18 outToken:&v13->_proxSetupNotificationToken queue:MEMORY[0x1E4F14428] handler:v27];

      if (v20)
      {
        v21 = (void *)MEMORY[0x1D9452090]();
        v22 = v16;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v31 = v24;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for ProxSetup notifications", buf, 0xCu);
        }
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);

        v16->_running = __HMDDeviceSetupManagerIsProxSetupRunning(v16);
      }
    }
    else
    {
    }
  }

  return v13;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_154688 != -1) {
    dispatch_once(&sharedManager_onceToken_154688, &__block_literal_global_154689);
  }
  v2 = (void *)sharedManager_sharedManager_154690;
  return v2;
}

void __38__HMDDeviceSetupManager_sharedManager__block_invoke()
{
  int v5 = objc_alloc_init(HMDCoreFollowUpManager);
  v0 = [HMDDeviceSetupManager alloc];
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = objc_alloc_init(MEMORY[0x1E4F2E788]);
  uint64_t v3 = [(HMDDeviceSetupManager *)v0 initWithNotificationCenter:v1 followUpManager:v5 darwinNotificationProvider:v2];
  v4 = (void *)sharedManager_sharedManager_154690;
  sharedManager_sharedManager_154690 = v3;
}

@end