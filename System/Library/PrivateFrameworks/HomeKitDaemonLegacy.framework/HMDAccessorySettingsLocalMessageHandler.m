@interface HMDAccessorySettingsLocalMessageHandler
+ (id)logCategory;
- (HMDAccessorySettingsLocalMessageHandler)initWithHomeUUID:(id)a3 languageValuesDataProvider:(id)a4;
- (HMDAccessorySettingsLocalMessageHandlerDataSource)dataSource;
- (HMDAccessorySettingsLocalMessageHandlerDelegate)delegate;
- (HMDLanguageValueListSettingDataProvider)languageValuesDataProvider;
- (NSUUID)homeUUID;
- (id)callerVersionForMessage:(id)a3;
- (id)siriAvailableLanguagesSetting;
- (unint64_t)dataSourceCallerPrivilegeWithMessage:(id)a3 error:(id *)a4;
- (void)handleAccessorySettingsFetchRequestMessage:(id)a3;
- (void)handleAccessorySettingsUpdateRequestMessage:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDAccessorySettingsLocalMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageValuesDataProvider, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDLanguageValueListSettingDataProvider)languageValuesDataProvider
{
  return (HMDLanguageValueListSettingDataProvider *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDAccessorySettingsLocalMessageHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessorySettingsLocalMessageHandlerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDAccessorySettingsLocalMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAccessorySettingsLocalMessageHandlerDataSource *)WeakRetained;
}

- (id)callerVersionForMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isRemote])
  {
    v5 = [v4 remoteSourceDevice];
    v6 = [v5 version];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get caller version from remote source device: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    v7 = +[HMDHomeKitVersion currentVersion];
  }

  return v7;
}

- (unint64_t)dataSourceCallerPrivilegeWithMessage:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HMDAccessorySettingsLocalMessageHandler *)self dataSource];
  id v8 = v7;
  if (v7)
  {
    unint64_t v9 = [v7 accessorySettingsLocalMessageHandler:self callerPrivilegeWithMessage:v6];
    if (v9 != 2) {
      goto LABEL_11;
    }
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v13;
      int v14 = "%{public}@Failed to get caller privilege from data source";
LABEL_7:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v13;
      int v14 = "%{public}@Failed to data source composite settings controller due to no data source";
      goto LABEL_7;
    }
  }

  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
  }
  unint64_t v9 = 2;
LABEL_11:

  return v9;
}

- (void)handleAccessorySettingsUpdateRequestMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory settings update request message: %@", buf, 0x16u);
  }
  unint64_t v9 = [v4 messagePayload];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F2E620]) initWithPayload:v9];
    if (v10)
    {
      v11 = [(HMDAccessorySettingsLocalMessageHandler *)v6 callerVersionForMessage:v4];
      if (v11)
      {
        v12 = [v10 settingValue];
        if (v12)
        {
          v13 = [(HMDAccessorySettingsLocalMessageHandler *)v6 delegate];
          if (v13)
          {
            int v14 = [(HMDAccessorySettingsLocalMessageHandler *)v6 homeUUID];
            v15 = [v10 accessoryUUID];
            int v16 = [v10 keyPath];
            [v13 accessorySettingsLocalMessageHandler:v6 didReceiveUpdateRequestMessage:v4 withHomeUUID:v14 accessoryUUID:v15 keyPath:v16 value:v12 callerVersion:v11];
          }
          else
          {
            v33 = (void *)MEMORY[0x1D9452090]();
            v34 = v6;
            v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v36 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v38 = v36;
              _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due to no delegate", buf, 0xCu);
            }
            int v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
            [v4 respondWithError:v14];
          }
        }
        else
        {
          v29 = (void *)MEMORY[0x1D9452090]();
          v30 = v6;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v38 = v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting as unable to determine setting value from payload", buf, 0xCu);
          }
          v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
          [v4 respondWithError:v13];
        }
      }
      else
      {
        v25 = (void *)MEMORY[0x1D9452090]();
        v26 = v6;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v38 = v28;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due no caller version", buf, 0xCu);
        }
        v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
        [v4 respondWithError:v12];
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = v6;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v24;
        __int16 v39 = 2112;
        id v40 = v9;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create update request payload with message payload: %@", buf, 0x16u);
      }
      v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      [v4 respondWithError:v11];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = v6;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings due to no payload found on message", buf, 0xCu);
    }
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v4 respondWithError:v10];
  }
}

- (id)siriAvailableLanguagesSetting
{
  v2 = [(HMDAccessorySettingsLocalMessageHandler *)self languageValuesDataProvider];
  v3 = [v2 languageValueList];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2E880]) initWithKeyPath:@"root.siri.availableLanguages" readOnly:1 languageValues:v3];
  return v4;
}

- (void)handleAccessorySettingsFetchRequestMessage:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = (uint64_t)v8;
    __int16 v52 = 2112;
    id v53 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory settings fetch request message: %@", buf, 0x16u);
  }
  unint64_t v9 = [v4 messagePayload];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F2E608]) initWithPayload:v9];
    if (!v10)
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = v6;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = (uint64_t)v26;
        __int16 v52 = 2112;
        id v53 = v9;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch request payload with message payload: %@", buf, 0x16u);
      }
      v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      [v4 respondWithError:v11];
      goto LABEL_32;
    }
    v11 = [(HMDAccessorySettingsLocalMessageHandler *)v6 callerVersionForMessage:v4];
    if (v11)
    {
      id v49 = 0;
      uint64_t v12 = [(HMDAccessorySettingsLocalMessageHandler *)v6 dataSourceCallerPrivilegeWithMessage:v4 error:&v49];
      id v13 = v49;
      if (!v13)
      {
        v48 = [(HMDAccessorySettingsLocalMessageHandler *)v6 delegate];
        if (v48)
        {
          v31 = [v10 keyPaths];
          v32 = (void *)[v31 mutableCopy];

          if ([v32 containsObject:@"root.siri.availableLanguages"])
          {
            v33 = (void *)MEMORY[0x1D9452090]();
            v34 = v6;
            v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              uint64_t v36 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v51 = v36;
              v47 = v33;
              v37 = (void *)v36;
              _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching siri available language setting", buf, 0xCu);

              v33 = v47;
            }

            v38 = [(HMDAccessorySettingsLocalMessageHandler *)v34 siriAvailableLanguagesSetting];
          }
          else
          {
            v38 = 0;
          }
          v44 = [(HMDAccessorySettingsLocalMessageHandler *)v6 homeUUID];
          v45 = [v10 accessoryUUID];
          uint64_t v46 = v12;
          v43 = v48;
          [v48 accessorySettingsLocalMessageHandler:v6 didReceiveFetchRequestMessage:v4 withHomeUUID:v44 accessoryUUID:v45 keyPaths:v32 callerVersion:v11 callerPrivilege:v46 siriAvailableLanguagesSetting:v38];
        }
        else
        {
          __int16 v39 = (void *)MEMORY[0x1D9452090]();
          id v40 = v6;
          uint64_t v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v51 = (uint64_t)v42;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due to no delegate", buf, 0xCu);
          }
          v32 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
          [v4 respondWithError:v32];
          v43 = 0;
        }

        int v14 = 0;
        goto LABEL_31;
      }
      int v14 = v13;
      v15 = (void *)MEMORY[0x1D9452090]();
      int v16 = v6;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = (uint64_t)v18;
        __int16 v52 = 2112;
        id v53 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due caller privilege data sourcing error: %@", buf, 0x16u);
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = v6;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v51 = (uint64_t)v30;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due no caller version", buf, 0xCu);
      }
      int v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    }
    [v4 respondWithError:v14];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  v20 = v6;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v51 = (uint64_t)v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload on fetch request message", buf, 0xCu);
  }
  v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
  [v4 respondWithError:v10];
LABEL_33:
}

- (HMDAccessorySettingsLocalMessageHandler)initWithHomeUUID:(id)a3 languageValuesDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessorySettingsLocalMessageHandler;
  unint64_t v9 = [(HMDAccessorySettingsLocalMessageHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUUID, a3);
    objc_storeStrong((id *)&v10->_languageValuesDataProvider, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_87879 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_87879, &__block_literal_global_87880);
  }
  v2 = (void *)logCategory__hmf_once_v17_87881;
  return v2;
}

uint64_t __54__HMDAccessorySettingsLocalMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_87881;
  logCategory__hmf_once_v17_87881 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end