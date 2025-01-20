@interface HMDUnifiedLanguageValueListSettingDataProvider
+ (id)logCategory;
+ (id)unifyLanguageValues:(id)a3 withValues:(id)a4;
- (HMDUnifiedLanguageValueListSettingDataProviderDataSource)dataSource;
- (id)dataSourceDataProviders;
- (id)languageValueList;
- (void)setDataSource:(id)a3;
@end

@implementation HMDUnifiedLanguageValueListSettingDataProvider

- (void).cxx_destruct
{
}

- (void)setDataSource:(id)a3
{
}

- (HMDUnifiedLanguageValueListSettingDataProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDUnifiedLanguageValueListSettingDataProviderDataSource *)WeakRetained;
}

- (id)languageValueList
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDUnifiedLanguageValueListSettingDataProvider *)self dataSourceDataProviders];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    v6 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v7 = 0;
      v8 = v6;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) languageValueList];
        v6 = +[HMDUnifiedLanguageValueListSettingDataProvider unifyLanguageValues:v8 withValues:v9];

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)dataSourceDataProviders
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDUnifiedLanguageValueListSettingDataProvider *)self dataSource];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 dataProvidersForUnifiedLanguageValueListSettingDataProvider:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      long long v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get host accessories due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_35273 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_35273, &__block_literal_global_35274);
  }
  v2 = (void *)logCategory__hmf_once_v2_35275;
  return v2;
}

uint64_t __61__HMDUnifiedLanguageValueListSettingDataProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_35275;
  logCategory__hmf_once_v2_35275 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)unifyLanguageValues:(id)a3 withValues:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  uint64_t v7 = [v5 setWithArray:a3];
  v8 = [v7 setByAddingObjectsFromArray:v6];

  v9 = [v8 allObjects];

  return v9;
}

@end