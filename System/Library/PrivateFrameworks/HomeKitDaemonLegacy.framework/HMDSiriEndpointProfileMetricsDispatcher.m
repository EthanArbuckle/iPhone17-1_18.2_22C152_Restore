@interface HMDSiriEndpointProfileMetricsDispatcher
+ (id)logCategory;
- (BOOL)dataSourceShouldSubmitRoutineConfigurationEvent;
- (HMDSiriEndpointProfileMetricsDispatcher)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 logEventSubmitter:(id)a5;
- (HMDSiriEndpointProfileMetricsDispatcherDataSource)dataSource;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (id)dataSourceAccessoryCategoryType;
- (id)dataSourceCompositeSettingsControllerManager;
- (id)dataSourceProfileFields;
- (id)fetchAccessorySettingFields;
- (id)logIdentifier;
- (void)setDataSource:(id)a3;
- (void)submitRoutineConfigurationEvent;
- (void)submitRoutineConfigurationEventWithAccessorySettingFields:(id)a3;
@end

@implementation HMDSiriEndpointProfileMetricsDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDSiriEndpointProfileMetricsDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSiriEndpointProfileMetricsDispatcherDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDSiriEndpointProfileMetricsDispatcher *)self accessoryUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceProfileFields
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 profileFieldsForSiriEndpointProfileMetricsDispatcher:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get profile fields due to no data source", buf, 0xCu);
    }
    v5 = [[HMDSiriEndpointProfileFields alloc] initWithNeedsOnboardingField:@"NoDataSource" supportsOnboardingField:@"NoDataSource" siriEnableField:@"NoDataSource" siriListeningField:@"NoDataSource" siriTouchToUseField:@"NoDataSource" siriLightOnUseField:@"NoDataSource" siriSoundOnUseField:@"NoDataSource"];
  }
  v10 = v5;

  return v10;
}

- (id)dataSourceCompositeSettingsControllerManager
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 compositeSettingsControllerManagerForSiriEndpointProfileMetricsDispatcher:self];
    if (v5)
    {
      v6 = [v4 compositeSettingsControllerManagerForSiriEndpointProfileMetricsDispatcher:self];
    }
    else
    {
      v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v16 = 138543618;
        v17 = v14;
        __int16 v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get composite settings controller manager from data source: %@", (uint8_t *)&v16, 0x16u);
      }
      v6 = 0;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory category type due to no data source", (uint8_t *)&v16, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)dataSourceAccessoryCategoryType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 accessoryCategoryTypeForSiriEndpointProfileMetricsDispatcher:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory category type due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = @"NoDataSource";
  }

  return v5;
}

- (BOOL)dataSourceShouldSubmitRoutineConfigurationEvent
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 shouldSubmitRoutineConfigurationEventForSiriEndpointProfileMetricsDispatcher:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get should submit routine configuration event due to no data source", (uint8_t *)&v11, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (id)fetchAccessorySettingFields
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v4 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSourceCompositeSettingsControllerManager];
  if (v4)
  {
    char v5 = [(HMDSiriEndpointProfileMetricsDispatcher *)self accessoryUUID];
    v6 = [(HMDSiriEndpointProfileMetricsDispatcher *)self homeUUID];
    v7 = +[HMDSiriEndpointProfileAccessorySettingFields keyPaths];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__HMDSiriEndpointProfileMetricsDispatcher_fetchAccessorySettingFields__block_invoke;
    v13[3] = &unk_1E6A0F528;
    v13[4] = self;
    id v8 = v3;
    id v14 = v8;
    [v4 localFetchSettingsForUUID:v5 homeUUID:v6 withKeyPaths:v7 completion:v13];

    id v9 = v8;
  }
  else
  {
    v10 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
    [v3 finishWithResult:v10];
    id v11 = v3;
  }
  return v3;
}

void __70__HMDSiriEndpointProfileMetricsDispatcher_fetchAccessorySettingFields__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v42 = a3;
  id v41 = a4;
  v48 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = v7;
  uint64_t v49 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v49)
  {
    uint64_t v9 = *(void *)v51;
    uint64_t v43 = a1;
    uint64_t v47 = *(void *)v51;
    id v46 = v8;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "setting", v41, v42);
        if (v12)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            id v14 = v12;
          }
          else {
            id v14 = 0;
          }
          id v15 = v14;
          if (isKindOfClass)
          {
            uint64_t v16 = [v12 BOOLValue];
            id v17 = [v11 keyPath];
            [(HMDSiriEndpointProfileAccessorySettingFields *)v48 setBoolValue:v16 forKeyPath:v17];
          }
          else
          {
            id v24 = v12;
            objc_opt_class();
            char v25 = objc_opt_isKindOfClass();
            if (v25) {
              v26 = v24;
            }
            else {
              v26 = 0;
            }
            id v17 = v26;

            if (v25)
            {
              id v27 = [v24 numberValue];
              v28 = [v11 keyPath];
              [(HMDSiriEndpointProfileAccessorySettingFields *)v48 setNumberValue:v27 forKeyPath:v28];
            }
            else
            {
              id v29 = v24;
              objc_opt_class();
              char v30 = objc_opt_isKindOfClass();
              if (v30) {
                v31 = v29;
              }
              else {
                v31 = 0;
              }
              id v27 = v31;

              if (v30)
              {
                id v45 = objc_alloc(MEMORY[0x1E4F2EAA8]);
                v44 = [v29 inputLanguageCode];
                v32 = [v29 outputVoiceLanguageCode];
                v33 = [v29 outputVoiceGenderCode];
                v34 = [v29 voiceName];
                v35 = (void *)[v45 initWithInputLanguageCode:v44 outputVoiceLanguageCode:v32 outputVoiceGenderCode:v33 voiceName:v34];

                a1 = v43;
                v36 = [v11 keyPath];
                [(HMDSiriEndpointProfileAccessorySettingFields *)v48 setLanguageValue:v35 forKeyPath:v36];
              }
              else
              {
                v37 = (void *)MEMORY[0x1D9452090]();
                id v38 = *(id *)(a1 + 32);
                v39 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  v40 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v55 = v40;
                  __int16 v56 = 2112;
                  v57 = v11;
                  _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to set setting from result: %@", buf, 0x16u);

                  a1 = v43;
                }
              }
              id v8 = v46;
            }

            uint64_t v9 = v47;
          }
        }
        else
        {
          __int16 v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = *(id *)(a1 + 32);
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = HMFGetLogIdentifier();
            v22 = [v11 keyPath];
            v23 = [v11 error];
            *(_DWORD *)buf = 138543874;
            v55 = v21;
            __int16 v56 = 2112;
            v57 = v22;
            __int16 v58 = 2112;
            v59 = v23;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to local fetch setting for key path: %@ error: %@", buf, 0x20u);

            uint64_t v9 = v47;
          }
        }
      }
      uint64_t v49 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v49);
  }

  [*(id *)(a1 + 40) finishWithResult:v48];
}

- (void)submitRoutineConfigurationEventWithAccessorySettingFields:(id)a3
{
  id v4 = a3;
  id v8 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSourceAccessoryCategoryType];
  char v5 = [(HMDSiriEndpointProfileMetricsDispatcher *)self dataSourceProfileFields];
  v6 = [[HMDSiriEndpointProfileRoutineConfigurationEvent alloc] initWithAccessoryCategoryType:v8 profileFields:v5 accessorySettingFields:v4];

  id v7 = [(HMDSiriEndpointProfileMetricsDispatcher *)self logEventSubmitter];
  [v7 submitLogEvent:v6];
}

- (void)submitRoutineConfigurationEvent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HMDSiriEndpointProfileMetricsDispatcher *)self dataSourceShouldSubmitRoutineConfigurationEvent])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    char v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting routine configuration event", buf, 0xCu);
    }
    id v7 = [(HMDSiriEndpointProfileMetricsDispatcher *)v4 fetchAccessorySettingFields];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke;
    v11[3] = &unk_1E6A197F0;
    v11[4] = v4;
    id v8 = (id)[v7 addFailureBlock:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke_5;
    v10[3] = &unk_1E6A0E288;
    v10[4] = v4;
    id v9 = (id)[v7 addSuccessBlock:v10];
  }
}

void __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Fetch accessory setting fields failed", (uint8_t *)&v9, 0xCu);
  }
  id v8 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
  [*(id *)(a1 + 32) submitRoutineConfigurationEventWithAccessorySettingFields:v8];
}

uint64_t __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) submitRoutineConfigurationEventWithAccessorySettingFields:a2];
}

- (HMDSiriEndpointProfileMetricsDispatcher)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 logEventSubmitter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_7:
    uint64_t v16 = (void *)_HMFPreconditionFailure();
    return (HMDSiriEndpointProfileMetricsDispatcher *)+[HMDSiriEndpointProfileMetricsDispatcher logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDSiriEndpointProfileMetricsDispatcher;
  uint64_t v13 = [(HMDSiriEndpointProfileMetricsDispatcher *)&v18 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeUUID, a4);
    objc_storeStrong((id *)&v14->_accessoryUUID, a3);
    objc_storeStrong((id *)&v14->_logEventSubmitter, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_91957 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_91957, &__block_literal_global_91958);
  }
  v2 = (void *)logCategory__hmf_once_v13_91959;
  return v2;
}

uint64_t __54__HMDSiriEndpointProfileMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v13_91959;
  logCategory__hmf_once_v13_91959 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end