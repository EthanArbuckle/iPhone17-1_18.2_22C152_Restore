@interface HMHomeManagerRegisterForNotifications
@end

@implementation HMHomeManagerRegisterForNotifications

void ____HMHomeManagerRegisterForNotifications_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained context];
    v4 = [v3 queue];
    dispatch_assert_queue_V2(v4);

    v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = v2;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Refreshing config from HomeKit daemon", (uint8_t *)&v9, 0xCu);
    }
    [v6 _setShouldConnectToDaemon];
    [v6 _fetchHomeConfigurationWithRefreshRequested:1];
  }
}

@end