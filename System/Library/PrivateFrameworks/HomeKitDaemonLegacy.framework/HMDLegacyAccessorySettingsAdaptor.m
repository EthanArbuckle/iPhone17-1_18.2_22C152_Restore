@interface HMDLegacyAccessorySettingsAdaptor
+ (id)logCategory;
+ (id)parsedBoolSettingEvent:(id)a3 topic:(id)a4;
+ (id)parsedIntegerSettingEvent:(id)a3 topic:(id)a4;
+ (id)parsedLanguageListSetting:(id)a3 topic:(id)a4;
+ (id)parsedLanguageSetting:(id)a3 topic:(id)a4;
- (HMDLegacyAccessorySettingsAdaptor)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 settingsController:(id)a6 subscriptionProvider:(id)a7;
- (HMDLegacyAccessorySettingsAdaptorDelegate)delegate;
- (HMDLegacyAccessorySettingsAdaptorSettingsOperationProvider)currentAccessorySettingsController;
- (HMESubscriptionProviding)subscriptionProvider;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)queue;
- (id)_settingValueForKeyPath:(id)a3 value:(id)a4;
- (id)_transformLegacyLanguageSettingValueToImmutableSetting:(id)a3;
- (id)languageValueList;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startup;
- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5;
@end

@implementation HMDLegacyAccessorySettingsAdaptor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentAccessorySettingsController);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (HMDLegacyAccessorySettingsAdaptorSettingsOperationProvider)currentAccessorySettingsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentAccessorySettingsController);
  return (HMDLegacyAccessorySettingsAdaptorSettingsOperationProvider *)WeakRetained;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return self->_subscriptionProvider;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDLegacyAccessorySettingsAdaptorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDLegacyAccessorySettingsAdaptorDelegate *)WeakRetained;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDLegacyAccessorySettingsAdaptor *)self delegate];
  if (v8)
  {
    v9 = [(id)objc_opt_class() parsedBoolSettingEvent:v6 topic:v7];
    if (v9)
    {
      v10 = (void *)MEMORY[0x1D9452090]();
      v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        v14 = [v9 keyPath];
        int v25 = 138543618;
        v26 = v13;
        __int16 v27 = 2114;
        id v28 = v14;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Forwarding decoded setting event for %{public}@", (uint8_t *)&v25, 0x16u);
      }
      v15 = [v9 keyPath];
      objc_msgSend(v8, "legacySettingsAdaptor:didUpdateSettingKeyPath:BOOLValue:", v11, v15, objc_msgSend(v9, "BOOLValue"));
    }
    else
    {
      v15 = [(id)objc_opt_class() parsedIntegerSettingEvent:v6 topic:v7];
      v16 = (void *)MEMORY[0x1D9452090]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v19)
        {
          v20 = HMFGetLogIdentifier();
          v21 = [0 keyPath];
          int v25 = 138543618;
          v26 = v20;
          __int16 v27 = 2114;
          id v28 = v21;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Forwarding decoded setting event for %{public}@", (uint8_t *)&v25, 0x16u);
        }
        v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
        v23 = [v15 keyPath];
        [v8 legacySettingsAdaptor:v17 didUpdateSettingKeyPath:v23 numberValue:v22];
      }
      else
      {
        if (v19)
        {
          v24 = HMFGetLogIdentifier();
          int v25 = 138543618;
          v26 = v24;
          __int16 v27 = 2114;
          id v28 = v7;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Parsed setting for topic%{public}@ is neither BOOL nor integer", (uint8_t *)&v25, 0x16u);
        }
        v15 = 0;
      }
    }
  }
}

- (id)_transformLegacyLanguageSettingValueToImmutableSetting:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@","];
  if ((unint64_t)[v5 count] > 2)
  {
    v11 = [v5 objectAtIndex:0];
    v12 = [v5 objectAtIndex:1];
    v13 = [v5 objectAtIndex:2];
    v14 = 0;
    if ((unint64_t)[v5 count] >= 5)
    {
      v14 = [v5 objectAtIndex:4];
    }
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F2EAA8]) initWithInputLanguageCode:v11 outputVoiceLanguageCode:v12 outputVoiceGenderCode:v13 voiceName:v14];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get expected language code count from legacy language setting encoding: %@", (uint8_t *)&v16, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_settingValueForKeyPath:(id)a3 value:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F2E5F8] isKeyPathForBooleanSettingType:v6])
  {
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2EA98]), "initWithBoolValue:", objc_msgSend(v10, "BOOLValue"));
LABEL_31:
      v31 = (void *)v11;
LABEL_37:

      goto LABEL_38;
    }
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    v35 = HMFGetLogIdentifier();
    int v48 = 138543874;
    v49 = v35;
    __int16 v50 = 2112;
    id v51 = v8;
    __int16 v52 = 2114;
    id v53 = v6;
    v36 = "%{public}@Passed in value: %@ is not a number for BOOL setting: %{public}@";
LABEL_34:
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v48, 0x20u);

LABEL_35:
LABEL_36:

    id v10 = 0;
    v31 = 0;
    goto LABEL_37;
  }
  if ([MEMORY[0x1E4F2E5F8] isKeyPathForConstrainedNumberSettingType:v6])
  {
    id v12 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v10 = v13;

    if (v10)
    {
      v14 = [MEMORY[0x1E4F2E5F8] scaleUpNumberSettingValue:v12];
      uint64_t v15 = [v14 integerValue];

      int v16 = (void *)MEMORY[0x1D9452090]();
      v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = HMFGetLogIdentifier();
        uint64_t v20 = [NSNumber numberWithInteger:v15];
        int v48 = 138544130;
        v49 = v19;
        __int16 v50 = 2112;
        id v51 = v12;
        __int16 v52 = 2112;
        id v53 = v20;
        __int16 v54 = 2114;
        id v55 = v6;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating legacy integer value %@ to %@: %{public}@", (uint8_t *)&v48, 0x2Au);
      }
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F2EAA0]) initWithIntegerValue:v15];
      goto LABEL_31;
    }
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    v35 = HMFGetLogIdentifier();
    int v48 = 138543874;
    v49 = v35;
    __int16 v50 = 2112;
    id v51 = v12;
    __int16 v52 = 2114;
    id v53 = v6;
    v36 = "%{public}@Passed in value: %@ is not a number for integer setting: %{public}@";
    goto LABEL_34;
  }
  if ([MEMORY[0x1E4F2E5F8] isKeyPathForTapAssistanceSelectionSettingType:v6])
  {
    id v21 = v7;
    if (v21)
    {
      id v10 = v21;
      uint64_t v22 = [MEMORY[0x1E4F2E5F8] itemIndexWithTapAssistanceSelectionItem:v21];
      v23 = [NSNumber numberWithInteger:v22];
      v24 = [MEMORY[0x1E4F2E5F8] scaleUpNumberSettingValue:v23];
      uint64_t v25 = [v24 integerValue];

      v26 = (void *)MEMORY[0x1D9452090]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        v30 = [NSNumber numberWithInteger:v25];
        int v48 = 138544130;
        v49 = v29;
        __int16 v50 = 2112;
        id v51 = v10;
        __int16 v52 = 2112;
        id v53 = v30;
        __int16 v54 = 2114;
        id v55 = v6;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Updating legacy selection item index value %@ to %@: %{public}@", (uint8_t *)&v48, 0x2Au);
      }
      v31 = (void *)[objc_alloc(MEMORY[0x1E4F2EAA0]) initWithIntegerValue:v25];

      goto LABEL_37;
    }
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = HMFGetLogIdentifier();
      int v48 = 138543874;
      v49 = v47;
      __int16 v50 = 2112;
      id v51 = 0;
      __int16 v52 = 2114;
      id v53 = v6;
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Passed in value: %@ is not a selection item for setting: %{public}@", (uint8_t *)&v48, 0x20u);
    }
    goto LABEL_36;
  }
  v37 = [MEMORY[0x1E4F2E5F8] languageKeyPaths];
  int v38 = [v37 containsObject:v7];

  if (v38)
  {
    id v39 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v40 = v39;
    }
    else {
      v40 = 0;
    }
    id v10 = v40;

    if (!v10)
    {
      v41 = (void *)MEMORY[0x1D9452090]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = HMFGetLogIdentifier();
        int v48 = 138543618;
        v49 = v44;
        __int16 v50 = 2112;
        id v51 = v39;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Passed value = %@, is not a language setting", (uint8_t *)&v48, 0x16u);
      }
    }
    uint64_t v11 = [(HMDLegacyAccessorySettingsAdaptor *)self _transformLegacyLanguageSettingValueToImmutableSetting:v10];
    goto LABEL_31;
  }
  v31 = 0;
LABEL_38:

  return v31;
}

- (id)languageValueList
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(HMDLegacyAccessorySettingsAdaptor *)self _settingValueForKeyPath:v8 value:v9];
  if (v11)
  {
    id v12 = [(HMDLegacyAccessorySettingsAdaptor *)self currentAccessorySettingsController];
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    int v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        int v24 = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        id v27 = v8;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update %{public}@ to controller", (uint8_t *)&v24, 0x16u);
      }
      [v12 updateSettingWithKeyPath:v8 settingValue:v11 completion:v10];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v24 = 138543362;
        uint64_t v25 = v22;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@No current settings controller.", (uint8_t *)&v24, 0xCu);
      }
      v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v10[2](v10, v23);

      id v12 = 0;
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain setting value from given legacy value.", (uint8_t *)&v24, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v10[2](v10, v12);
  }
}

- (void)startup
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDLegacyAccessorySettingsAdaptor *)v4 homeUUID];
    id v8 = [(HMDLegacyAccessorySettingsAdaptor *)v4 accessoryUUID];
    *(_DWORD *)buf = 138543874;
    v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing to home: %@, accessory: %@ keyPaths on startup.", buf, 0x20u);
  }
  id v9 = [MEMORY[0x1E4F2E5F8] defaultSettingsAllKeyPaths];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke;
  v21[3] = &unk_1E6A0E0B0;
  v21[4] = v4;
  id v10 = objc_msgSend(v9, "na_map:", v21);

  uint64_t v11 = [MEMORY[0x1E4F2E5F8] languageKeyPaths];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2;
  v20[3] = &unk_1E6A0E0B0;
  v20[4] = v4;
  id v12 = objc_msgSend(v11, "na_map:", v20);
  v13 = [v12 arrayByAddingObjectsFromArray:v10];

  if (v13 && [v13 count])
  {
    v14 = [(HMDLegacyAccessorySettingsAdaptor *)v4 subscriptionProvider];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3;
    v19[3] = &unk_1E6A18CB8;
    v19[4] = v4;
    [v14 changeRegistrationsForConsumer:v4 topicFilterAdditions:v13 topicFilterRemovals:MEMORY[0x1E4F1CBF0] completion:v19];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = v4;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@No default settings keypaths are found", buf, 0xCu);
    }
  }
}

id __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 homeUUID];
  id v6 = [*(id *)(a1 + 32) accessoryUUID];
  id v7 = MEMORY[0x1D94507C0](v5, v6, v4);

  return v7;
}

id __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 homeUUID];
  id v6 = [*(id *)(a1 + 32) accessoryUUID];
  id v7 = MEMORY[0x1D94507C0](v5, v6, v4);

  return v7;
}

void __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2_4;
  block[3] = &unk_1E6A19668;
  block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = *(void *)(a1 + 40);
      int v16 = 138543618;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@available language fetch returned Error =%@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    id v12 = *(void *)(a1 + 32);
    v13 = *(void **)(a1 + 48);
    v14 = [*(id *)(a1 + 56) keyPath];
    uint64_t v15 = [*(id *)(a1 + 56) languageValue];
    [v13 legacySettingsAdaptor:v12 didLoadSettingKeyPath:v14 selectedLanguageValue:v15 availableLanguageList:v5];
  }
}

void __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2_4(id *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] delegate];
  if (v2)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = a1[5];
    uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (!v3) {
      goto LABEL_20;
    }
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v34;
    *(void *)&long long v4 = 138543618;
    long long v25 = v4;
    id v27 = v2;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * v7);
        id v9 = objc_msgSend(a1[5], "objectForKeyedSubscript:", v8, v25);
        id v10 = [(id)objc_opt_class() parsedBoolSettingEvent:v9 topic:v8];
        id v11 = v10;
        id v12 = a1[4];
        if (v10)
        {
          v13 = [v10 keyPath];
          objc_msgSend(v2, "legacySettingsAdaptor:didLoadSettingKeyPath:BOOLValue:", v12, v13, objc_msgSend(v11, "BOOLValue"));

          goto LABEL_14;
        }
        v14 = [(id)objc_opt_class() parsedLanguageSetting:v9 topic:v8];
        if (v14)
        {
          uint64_t v15 = [a1[4] currentAccessorySettingsController];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3;
          v29[3] = &unk_1E6A0E0D8;
          v29[4] = a1[4];
          id v30 = a1[6];
          id v31 = v2;
          id v32 = v14;
          id v16 = v14;
          [v15 languageValueListWithCompletion:v29];

LABEL_13:
          goto LABEL_14;
        }
        v17 = [(id)objc_opt_class() parsedIntegerSettingEvent:v9 topic:v8];
        if (v17)
        {
          id v16 = v17;
          __int16 v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
          id v19 = a1[4];
          uint64_t v20 = [v16 keyPath];
          [v27 legacySettingsAdaptor:v19 didLoadSettingKeyPath:v20 numberValue:v18];

          v2 = v27;
          goto LABEL_13;
        }
        context = (void *)MEMORY[0x1D9452090]();
        id v21 = a1[4];
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v25;
          int v38 = v23;
          __int16 v39 = 2114;
          uint64_t v40 = v8;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Parsed setting for topic%{public}@ is not of {Integer, Bool, Language}", buf, 0x16u);

          v2 = v27;
        }

LABEL_14:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      uint64_t v5 = v24;
      if (!v24)
      {
LABEL_20:

        break;
      }
    }
  }
}

- (HMDLegacyAccessorySettingsAdaptor)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 settingsController:(id)a6 subscriptionProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDLegacyAccessorySettingsAdaptor;
  __int16 v18 = [(HMDLegacyAccessorySettingsAdaptor *)&v21 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_homeUUID, a4);
    objc_storeStrong((id *)&v19->_accessoryUUID, a5);
    objc_storeWeak((id *)&v19->_currentAccessorySettingsController, v16);
    objc_storeStrong((id *)&v19->_subscriptionProvider, a7);
  }

  return v19;
}

+ (id)parsedLanguageListSetting:(id)a3 topic:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  id v9 = [v8 asAccessorySettingTopic];
  id v10 = v9;
  if (!v9
    || ([v9 accessorySettingKeyPath],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [@"root.siri.availableLanguages" isEqual:v11],
        v11,
        !v12))
  {
    id v19 = 0;
    goto LABEL_18;
  }
  id v30 = 0;
  id v13 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v6 error:&v30];
  id v14 = v30;
  id v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = a1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    __int16 v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v32 = v18;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@unable to decode event:%@ %@", buf, 0x20u);
  }
  if (v13)
  {
    id v19 = v13;
    objc_opt_class();
    int v20 = objc_opt_isKindOfClass() & 1;
    if (v20) {
      objc_super v21 = v19;
    }
    else {
      objc_super v21 = 0;
    }
    id v22 = v21;

    if (v20) {
      goto LABEL_17;
    }
    v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = v16;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v26;
      __int16 v33 = 2114;
      id v34 = v7;
      id v27 = "%{public}@Obtained setting but not of Language type. %{public}@";
LABEL_15:
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    id v28 = v16;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v26;
      __int16 v33 = 2114;
      id v34 = v7;
      id v27 = "%{public}@Received setting change event but could not decode. %{public}@";
      goto LABEL_15;
    }
  }

  id v19 = 0;
LABEL_17:

LABEL_18:
  return v19;
}

+ (id)parsedLanguageSetting:(id)a3 topic:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  id v9 = [v8 asAccessorySettingTopic];
  id v10 = v9;
  if (!v9
    || ([v9 accessorySettingKeyPath],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [@"root.siri.language" isEqual:v11],
        v11,
        !v12))
  {
    id v15 = 0;
    goto LABEL_16;
  }
  id v26 = 0;
  id v13 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v6 error:&v26];
  id v14 = v26;
  if (v13)
  {
    id v15 = v13;
    objc_opt_class();
    int v16 = objc_opt_isKindOfClass() & 1;
    if (v16) {
      id v17 = v15;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v16) {
      goto LABEL_15;
    }
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = a1;
    objc_super v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v22;
      __int16 v29 = 2114;
      id v30 = v7;
      v23 = "%{public}@Obtained setting but not of Language type. %{public}@";
LABEL_13:
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v24 = a1;
    objc_super v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v22;
      __int16 v29 = 2114;
      id v30 = v7;
      v23 = "%{public}@Received setting change event but could not decode. %{public}@";
      goto LABEL_13;
    }
  }

  id v15 = 0;
LABEL_15:

LABEL_16:
  return v15;
}

+ (id)parsedIntegerSettingEvent:(id)a3 topic:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  id v9 = [v8 asAccessorySettingTopic];
  id v10 = v9;
  if (!v9) {
    goto LABEL_10;
  }
  id v11 = (void *)MEMORY[0x1E4F2E5F8];
  int v12 = [v9 accessorySettingKeyPath];
  if (![v11 isKeyPathForConstrainedNumberSettingType:v12])
  {
    id v13 = (void *)MEMORY[0x1E4F2E5F8];
    id v14 = [v10 accessorySettingKeyPath];
    LODWORD(v13) = [v13 isKeyPathForTapAssistanceSelectionSettingType:v14];

    if (v13) {
      goto LABEL_5;
    }
LABEL_10:
    id v19 = 0;
    goto LABEL_15;
  }

LABEL_5:
  id v25 = 0;
  id v15 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v6 error:&v25];
  id v16 = v25;
  if (v15)
  {
    id v17 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v23;
      __int16 v28 = 2114;
      id v29 = v7;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Obtained setting but not of bounded integer type. %{public}@", buf, 0x16u);
    }
    id v19 = 0;
  }

LABEL_15:
  return v19;
}

+ (id)parsedBoolSettingEvent:(id)a3 topic:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  id v9 = [v8 asAccessorySettingTopic];
  id v10 = v9;
  if (v9
    && (id v11 = (void *)MEMORY[0x1E4F2E5F8],
        [v9 accessorySettingKeyPath],
        int v12 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v11) = [v11 isKeyPathForBooleanSettingType:v12],
        v12,
        v11))
  {
    id v30 = 0;
    id v13 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v6 error:&v30];
    id v14 = v30;
    if (v13)
    {
      id v15 = v13;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v17 = v15;
      }
      else {
        id v17 = 0;
      }
      id v18 = v17;

      if (isKindOfClass)
      {
        id v19 = v15;
      }
      else
      {
        id v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = a1;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v27 = v29 = v24;
          *(_DWORD *)buf = 138543618;
          id v32 = v27;
          __int16 v33 = 2114;
          id v34 = v7;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Obtained setting but not of BOOL type. %{public}@", buf, 0x16u);

          id v24 = v29;
        }

        id v19 = 0;
      }
    }
    else
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = a1;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v32 = v23;
        __int16 v33 = 2114;
        id v34 = v7;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received setting change event but could not decode. %{public}@", buf, 0x16u);
      }
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_89626 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_89626, &__block_literal_global_89627);
  }
  v2 = (void *)logCategory__hmf_once_v1_89628;
  return v2;
}

uint64_t __48__HMDLegacyAccessorySettingsAdaptor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_89628;
  logCategory__hmf_once_v1_89628 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end