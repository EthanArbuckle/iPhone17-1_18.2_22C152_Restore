@interface HMDDeviceSetupManagerRegisterForProxSetupNotifications
@end

@implementation HMDDeviceSetupManagerRegisterForProxSetupNotifications

void ____HMDDeviceSetupManagerRegisterForProxSetupNotifications_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (os_unfair_lock_s *)WeakRetained;
    v4 = v3 + 2;
    os_unfair_lock_lock_with_options();
    BOOL IsProxSetupRunning = __HMDDeviceSetupManagerIsProxSetupRunning(v3);
    BOOL v6 = IsProxSetupRunning;
    if (LOBYTE(v3[4]._os_unfair_lock_opaque) == IsProxSetupRunning)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      LOBYTE(v3[4]._os_unfair_lock_opaque) = IsProxSetupRunning;
      os_unfair_lock_unlock(v4);
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = v3;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        v11 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v10;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification ProxSetup is running: %@", buf, 0x16u);
      }
      v12 = [(os_unfair_lock_s *)v8 notificationCenter];
      v15 = @"running";
      v13 = [NSNumber numberWithBool:v6];
      *(void *)buf = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v15 count:1];
      [v12 postNotificationName:@"HMDDeviceSetupManagerUpdatedRunningNotification" object:v8 userInfo:v14];
    }
  }
}

@end