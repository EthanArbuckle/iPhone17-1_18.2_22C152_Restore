@interface HMDAppleMediaAccessoryDeleteSiriHistoryOperation
+ (id)logCategory;
- (AFSettingsConnection)settingsConnection;
- (HMDAppleMediaAccessoryDeleteSiriHistoryOperation)initWithSettingsConnection:(id)a3;
- (void)main;
@end

@implementation HMDAppleMediaAccessoryDeleteSiriHistoryOperation

- (void).cxx_destruct
{
}

- (AFSettingsConnection)settingsConnection
{
  return (AFSettingsConnection *)objc_getProperty(self, a2, 312, 1);
}

- (void)main
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Started delete siri history operation", buf, 0xCu);
  }
  v7 = [(HMDAppleMediaAccessoryDeleteSiriHistoryOperation *)v4 settingsConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HMDAppleMediaAccessoryDeleteSiriHistoryOperation_main__block_invoke;
  v8[3] = &unk_1E6A197F0;
  v8[4] = v4;
  [v7 deleteSiriHistoryWithCompletion:v8];
}

void __56__HMDAppleMediaAccessoryDeleteSiriHistoryOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) cancelWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history completed", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) finish];
  }
}

- (HMDAppleMediaAccessoryDeleteSiriHistoryOperation)initWithSettingsConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessoryDeleteSiriHistoryOperation;
  v6 = [(HMFOperation *)&v9 initWithTimeout:60.0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settingsConnection, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_104238 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_104238, &__block_literal_global_104239);
  }
  v2 = (void *)logCategory__hmf_once_v4_104240;
  return v2;
}

uint64_t __63__HMDAppleMediaAccessoryDeleteSiriHistoryOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_104240;
  logCategory__hmf_once_v4_104240 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end