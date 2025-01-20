@interface HMHomeManagerRegisterForGenerationCounterNotifications
@end

@implementation HMHomeManagerRegisterForGenerationCounterNotifications

void ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = WeakRetained;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      int v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching home configuration due to generation counter update after delayed cache policy", (uint8_t *)&v6, 0xCu);
    }
    [v3 _setShouldConnectToDaemon];
    [v3 _fetchHomeConfigurationWithRefreshRequested:1];
  }
}

@end