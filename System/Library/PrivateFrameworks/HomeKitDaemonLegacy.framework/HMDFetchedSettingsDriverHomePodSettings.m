@interface HMDFetchedSettingsDriverHomePodSettings
+ (id)logCategory;
- (HMDFetchedSettingsDriverDelegate)delegate;
- (HMDFetchedSettingsDriverHomePodSettings)initWithQueue:(id)a3 settingsObjectFactory:(id)a4;
- (HMDHPSAccessorySettingService)service;
- (HMDHPSSettingsObjectFactoryProtocol)hmdhpsObjectFactory;
- (OS_dispatch_queue)queue;
- (id)_hpLanguageValueFromLanguageValue:(id)a3;
- (id)_languageValueList;
- (id)_transformPreferredMediaUserEvent:(id)a3;
- (id)_transformToImmutableSetting:(id)a3;
- (void)_processReadResults:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_readSettingsAtKeyPaths:(id)a3 completion:(id)a4;
- (void)_writeSetting:(id)a3 keyPath:(id)a4 completion:(id)a5;
- (void)didReconnect;
- (void)didUpdateSetting:(id)a3 forKeyPath:(id)a4;
- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4;
- (void)languageValueListWithCompletion:(id)a3;
- (void)serviceDidInitializeForCurrentAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5;
@end

@implementation HMDFetchedSettingsDriverHomePodSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmdhpsObjectFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDHPSSettingsObjectFactoryProtocol)hmdhpsObjectFactory
{
  return (HMDHPSSettingsObjectFactoryProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHPSAccessorySettingService)service
{
  return (HMDHPSAccessorySettingService *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDFetchedSettingsDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDFetchedSettingsDriverDelegate *)WeakRetained;
}

- (void)serviceDidInitializeForCurrentAccessory:(id)a3
{
  v4 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HMDFetchedSettingsDriverHomePodSettings_serviceDidInitializeForCurrentAccessory___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __83__HMDFetchedSettingsDriverHomePodSettings_serviceDidInitializeForCurrentAccessory___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@homepod settings did initialize", (uint8_t *)&v7, 0xCu);
  }
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 driverDidReload:*(void *)(a1 + 32)];
}

- (void)didReconnect
{
  id v3 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDFetchedSettingsDriverHomePodSettings_didReconnect__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __55__HMDFetchedSettingsDriverHomePodSettings_didReconnect__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@homepod settings did reconnect", (uint8_t *)&v7, 0xCu);
  }
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 driverDidReload:*(void *)(a1 + 32)];
}

- (void)didUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HMDFetchedSettingsDriverHomePodSettings_didUpdateSetting_forKeyPath___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__HMDFetchedSettingsDriverHomePodSettings_didUpdateSetting_forKeyPath___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = [*(id *)(a1 + 40) isEqualToString:@"root.home.primaryUser"];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v3)
  {
    id v6 = [v4 _transformPreferredMediaUserEvent:v5];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v23 = 138543874;
      v24 = v10;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Got primaryUserInfo update for keyPath: %{public}@, %@", (uint8_t *)&v23, 0x20u);
    }
    [v2 driver:*(void *)(a1 + 32) didUpdatePrimaryUserInfo:v6];
  }
  else
  {
    id v6 = [v4 _transformToImmutableSetting:v5];
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v23 = 138543618;
      v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Got Setting Update for keyPath: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    if (v6)
    {
      v29[0] = v6;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [v2 driver:*(void *)(a1 + 32) didUpdateSettings:v17];
    }
    else
    {
      v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = *(id *)(a1 + 32);
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        uint64_t v22 = *(void *)(a1 + 48);
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        uint64_t v26 = v22;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to transform %@ to immutable setting", (uint8_t *)&v23, 0x16u);
      }
      id v6 = 0;
    }
  }
}

- (id)_languageValueList
{
  char v3 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDFetchedSettingsDriverHomePodSettings *)self service];
  uint64_t v5 = [v4 settingForKeyPath:@"root.siri.availableLanguages"];

  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:v5])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v6 languages];
  id v8 = +[HMDFetchedSettingsUtilities transformHPLanguageItemsToLanguageListValue:v7];

  return v8;
}

- (void)languageValueListWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__HMDFetchedSettingsDriverHomePodSettings_languageValueListWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__HMDFetchedSettingsDriverHomePodSettings_languageValueListWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _languageValueList];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_writeSetting:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    int v23 = v15;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Updating %{public}@ to %@", buf, 0x20u);
  }
  uint64_t v16 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 service];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__HMDFetchedSettingsDriverHomePodSettings__writeSetting_keyPath_completion___block_invoke;
  v19[3] = &unk_1E6A13370;
  v19[4] = v13;
  id v20 = v9;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [v16 updateSettingForKeyPath:v18 setting:v8 completionHandler:v19];
}

void __76__HMDFetchedSettingsDriverHomePodSettings__writeSetting_keyPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Update %{public}@ completion error: %@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_processReadResults:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v35 = (void (**)(id, void *, void *))a5;
  id v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v46 = v13;
    __int16 v47 = 2112;
    id v48 = v8;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Fetched settings: %@, error: %@", buf, 0x20u);
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = v9;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v8;
  id v17 = (void *)v14;
  id v18 = v16;
  uint64_t v19 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  id v20 = v15;
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v41;
    id v20 = v15;
    id v36 = v18;
    uint64_t v37 = *(void *)v41;
    do
    {
      uint64_t v23 = 0;
      uint64_t v38 = v21;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v18);
        }
        __int16 v24 = [*(id *)(*((void *)&v40 + 1) + 8 * v23) setting];
        if (v24)
        {
          id v25 = [(HMDFetchedSettingsDriverHomePodSettings *)v11 _transformToImmutableSetting:v24];
          if (v25)
          {
            [v17 addObject:v25];
          }
          else
          {
            v39 = v20;
            __int16 v26 = (void *)MEMORY[0x1D9452090]();
            id v27 = v11;
            uint64_t v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = v17;
              v30 = v11;
              v32 = id v31 = v15;
              *(_DWORD *)buf = 138543618;
              v46 = v32;
              __int16 v47 = 2112;
              id v48 = v24;
              _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Returned value %@ not of expected type.", buf, 0x16u);

              id v15 = v31;
              uint64_t v11 = v30;
              id v17 = v29;
              id v18 = v36;
            }

            if (v15)
            {
              id v33 = v15;
            }
            else
            {
              id v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            }
            id v20 = v33;

            uint64_t v22 = v37;
            uint64_t v21 = v38;
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v21);
  }

  v34 = (void *)[v17 copy];
  v35[2](v35, v34, v20);
}

- (void)_readSettingsAtKeyPaths:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = [(HMDFetchedSettingsDriverHomePodSettings *)v9 service];
    *(_DWORD *)buf = 138543874;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch setting keyPaths: %{public}@ on service: %@", buf, 0x20u);
  }
  id v13 = [(HMDFetchedSettingsDriverHomePodSettings *)v9 service];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke;
  v15[3] = &unk_1E6A187D0;
  v15[4] = v9;
  id v16 = v7;
  id v14 = v7;
  [v13 settingsForKeyPaths:v6 completionHandler:v15];
}

void __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke_2;
  v11[3] = &unk_1E6A18398;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReadResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (id)_transformPreferredMediaUserEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringValue];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F2E598]) initWithUUIDString:v5 selectionType:v5 != 0];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Transform hpSetting to primaryUserInfo: %@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (id)_transformToImmutableSetting:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSBooleanSettingProtocolMethods:v4])
  {
    id v5 = v4;
    if (v5)
    {
      id v6 = v5;
      id v7 = objc_alloc(MEMORY[0x1E4F2E680]);
      id v8 = [v6 keyPath];
      id v9 = objc_msgSend(v7, "initWithKeyPath:readOnly:BOOLValue:", v8, 0, objc_msgSend(v6, "BOOLeanValue"));
LABEL_4:

LABEL_9:
      goto LABEL_23;
    }
  }
  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSConstrainedNumberSettingProtocolMethods:v4])
  {
    id v6 = v4;
    id v10 = (void *)MEMORY[0x1E4F2E5F8];
    uint64_t v11 = [v6 numberValue];
    int v12 = [v10 scaleUpNumberSettingValue:v11];
    uint64_t v13 = [v12 integerValue];

    __int16 v14 = (void *)MEMORY[0x1E4F2E5F8];
    id v15 = [v6 maximumValue];
    uint64_t v16 = [v14 scaleUpNumberSettingValue:v15];
    uint64_t v17 = [v16 integerValue];

    id v18 = (void *)MEMORY[0x1E4F2E5F8];
    __int16 v19 = [v6 minimumValue];
    id v20 = [v18 scaleUpNumberSettingValue:v19];
    uint64_t v21 = [v20 integerValue];

    uint64_t v22 = (void *)MEMORY[0x1E4F2E5F8];
    uint64_t v23 = [v6 stepValue];
    __int16 v24 = [v22 scaleUpNumberSettingValue:v23];
    uint64_t v25 = [v24 integerValue];

    __int16 v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      int v47 = 138544386;
      id v48 = v29;
      __int16 v49 = 2048;
      uint64_t v50 = v13;
      __int16 v51 = 2048;
      uint64_t v52 = v17;
      __int16 v53 = 2048;
      uint64_t v54 = v21;
      __int16 v55 = 2048;
      uint64_t v56 = v25;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Transform constrained number setting (after scaling up) with value: %ld, max: %ld, min: %ld, step: %ld", (uint8_t *)&v47, 0x34u);
    }
    id v30 = objc_alloc(MEMORY[0x1E4F2E688]);
    id v31 = [v6 keyPath];
    id v9 = (void *)[v30 initWithKeyPath:v31 readOnly:0 integerValue:v13 maxValue:v17 minValue:v21 valueStepSize:v25];

    goto LABEL_9;
  }
  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:v4])
  {
    v32 = [v4 keyPath];
    int v33 = [v32 isEqual:@"root.siri.availableLanguages"];

    if (v33)
    {
      id v34 = v4;
      if (v34)
      {
        id v6 = v34;
        id v35 = objc_alloc(MEMORY[0x1E4F2E880]);
        id v8 = [v6 keyPath];
        id v36 = [v6 languages];
        uint64_t v37 = +[HMDFetchedSettingsUtilities transformHPLanguageItemsToLanguageListValue:v36];
        id v9 = (void *)[v35 initWithKeyPath:v8 readOnly:1 languageValues:v37];

        goto LABEL_4;
      }
    }
  }
  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriLanguageSettingProtocolMethods:v4])
  {
    id v6 = v4;
    uint64_t v38 = [v6 languageValue];
    id v8 = (void *)v38;
    if (v6)
    {
      if (v38)
      {
        id v39 = objc_alloc(MEMORY[0x1E4F2E878]);
        long long v40 = [v6 keyPath];
        long long v41 = +[HMDFetchedSettingsUtilities languageValueFromHPLanguageValue:v8];
        id v9 = (void *)[v39 initWithKeyPath:v40 readOnly:0 languageValue:v41];

        goto LABEL_4;
      }
      long long v42 = (void *)MEMORY[0x1D9452090]();
      long long v43 = self;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = HMFGetLogIdentifier();
        int v47 = 138543362;
        id v48 = v45;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Nil Language Value", (uint8_t *)&v47, 0xCu);
      }
    }
  }
  id v9 = 0;
LABEL_23:

  return v9;
}

- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    int v24 = 138543874;
    uint64_t v25 = v15;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Primary User setting %{public}@ to %@", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v16 = [v9 uuidString];
  uint64_t v17 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 hmdhpsObjectFactory];
  id v18 = [v17 createHPSStringSettingWithKeyPath:v8 stringValue:v16];

  if (v18)
  {
    [(HMDFetchedSettingsDriverHomePodSettings *)v13 _writeSetting:v18 keyPath:v8 completion:v10];
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v13;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v10[2](v10, v23);
  }
}

- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)MEMORY[0x1E4F2E5F8];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
  __int16 v14 = [v12 scaleDownNumberSettingValue:v13];

  id v15 = (void *)MEMORY[0x1D9452090]();
  uint64_t v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = HMFGetLogIdentifier();
    __int16 v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    int v27 = 138544130;
    __int16 v28 = v18;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2112;
    v32 = v14;
    __int16 v33 = 2112;
    id v34 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@ (integer value: %@)", (uint8_t *)&v27, 0x2Au);
  }
  id v20 = [(HMDFetchedSettingsDriverHomePodSettings *)v16 hmdhpsObjectFactory];
  uint64_t v21 = [v20 createHPSNumberSettingWithKeyPath:v8 numberValue:v14];

  if (v21)
  {
    [(HMDFetchedSettingsDriverHomePodSettings *)v16 _writeSetting:v21 keyPath:v8 completion:v10];
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = v16;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v27 = 138543618;
      __int16 v28 = v25;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v27, 0x16u);
    }
    __int16 v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v10[2](v10, v26);
  }
}

- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    int v23 = 138543874;
    int v24 = v15;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", (uint8_t *)&v23, 0x20u);
  }
  uint64_t v16 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 hmdhpsObjectFactory];
  uint64_t v17 = objc_msgSend(v16, "createHPSBooleanSettingWithKeyPath:BOOLeanValue:", v8, objc_msgSend(v9, "BOOLValue"));

  if (v17)
  {
    [(HMDFetchedSettingsDriverHomePodSettings *)v13 _writeSetting:v17 keyPath:v8 completion:v10];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v13;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      int v24 = v21;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v10[2](v10, v22);
  }
}

- (id)_hpLanguageValueFromLanguageValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDFetchedSettingsDriverHomePodSettings *)self hmdhpsObjectFactory];
  id v6 = [v4 inputLanguageCode];
  id v7 = [v4 outputVoiceLanguageCode];
  id v8 = [v4 outputVoiceGenderCode];
  int64_t v9 = +[HMDFetchedSettingsUtilities _outputGenderFromString:v8];
  id v10 = [v4 voiceName];

  uint64_t v11 = [v5 createHPSSiriLanguageValueWithRecognitionLanguage:v6 outputLanguage:v7 gender:v9 voiceName:v10];

  return v11;
}

- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v30 = v15;
    __int16 v31 = 2114;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);
  }
  uint64_t v16 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 hmdhpsObjectFactory];
  uint64_t v17 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 _hpLanguageValueFromLanguageValue:v9];
  id v18 = [v16 createHPSSiriLanguageSettingWithKeyPath:v8 languageValue:v17];

  if (v18)
  {
    __int16 v19 = [(HMDFetchedSettingsDriverHomePodSettings *)v13 queue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __100__HMDFetchedSettingsDriverHomePodSettings_updateSettingWithKeyPath_languageSettingValue_completion___block_invoke;
    v25[3] = &unk_1E6A18398;
    v25[4] = v13;
    id v26 = v18;
    id v27 = v8;
    id v28 = v10;
    dispatch_async(v19, v25);
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v13;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", buf, 0x16u);
    }
    int v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*((void (**)(id, void *))v10 + 2))(v10, v24);
  }
}

uint64_t __100__HMDFetchedSettingsDriverHomePodSettings_updateSettingWithKeyPath_languageSettingValue_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeSetting:*(void *)(a1 + 40) keyPath:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  dispatch_assert_queue_V2(v8);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__4697;
  v26[4] = __Block_byref_object_dispose__4698;
  id v27 = (id)MEMORY[0x1E4F1CBF0];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__4697;
  v24[4] = __Block_byref_object_dispose__4698;
  id v25 = 0;
  id v9 = dispatch_group_create();
  if ([v6 count])
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    HMFGetOSLogHandle();
    int v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Fetching settings using local api keyPaths: %@", buf, 0x16u);
    }
    dispatch_group_enter(v9);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke;
    v20[3] = &unk_1E6A05DE0;
    uint64_t v22 = v26;
    int v23 = v24;
    uint64_t v21 = v9;
    [(HMDFetchedSettingsDriverHomePodSettings *)v11 _readSettingsAtKeyPaths:v6 completion:v20];
  }
  __int16 v14 = [(HMDFetchedSettingsDriverHomePodSettings *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke_2;
  v16[3] = &unk_1E6A106B8;
  id v17 = v7;
  id v18 = v26;
  __int16 v19 = v24;
  id v15 = v7;
  dispatch_group_notify(v9, v14, v16);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (HMDFetchedSettingsDriverHomePodSettings)initWithQueue:(id)a3 settingsObjectFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDFetchedSettingsDriverHomePodSettings;
  uint64_t v9 = [(HMDFetchedSettingsDriverHomePodSettings *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 createHPSAccessorySettingServiceWithDelegate:v10];
    service = v10->_service;
    v10->_service = (HMDHPSAccessorySettingService *)v11;

    objc_storeStrong((id *)&v10->_hmdhpsObjectFactory, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_4705 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_4705, &__block_literal_global_4706);
  }
  id v2 = (void *)logCategory__hmf_once_v1_4707;
  return v2;
}

uint64_t __54__HMDFetchedSettingsDriverHomePodSettings_logCategory__block_invoke()
{
  logCategory__hmf_once_v1_4707 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end