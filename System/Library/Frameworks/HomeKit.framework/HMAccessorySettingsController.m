@interface HMAccessorySettingsController
+ (id)logCategory;
- (HMAccessorySettingsController)initWithContext:(id)a3 messengerFactory:(id)a4 metricsDispatcher:(id)a5;
- (HMAccessorySettingsControllerDataSource)dataSource;
- (HMAccessorySettingsMessengerFactory)messengerFactory;
- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher;
- (_HMContext)context;
- (id)dataSourceHomeWithHomeIdentifier:(id)a3;
- (id)messengerWithHomeUUID:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMessengerFactory:(id)a3;
- (void)updateAccessorySettingWithAccessoryIdentifier:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6;
- (void)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 settingValue:(id)a6 completionHandler:(id)a7;
@end

@implementation HMAccessorySettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_messengerFactory);

  objc_storeStrong((id *)&self->_messenger, 0);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMAccessorySettingsControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMAccessorySettingsControllerDataSource *)WeakRetained;
}

- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessengerFactory:(id)a3
{
}

- (HMAccessorySettingsMessengerFactory)messengerFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messengerFactory);

  return (HMAccessorySettingsMessengerFactory *)WeakRetained;
}

- (id)dataSourceHomeWithHomeIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessorySettingsController *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 accessorySettingsController:self homeWithHomeIdentifier:v4];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source accessory UUID due to no data source", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)messengerWithHomeUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessorySettingsController *)self messengerFactory];
  os_unfair_lock_lock_with_options();
  messenger = self->_messenger;
  if (!messenger)
  {
    v7 = [v5 createAccessorySettingsMessengerWithHomeUUID:v4];
    v8 = self->_messenger;
    self->_messenger = v7;

    messenger = self->_messenger;
  }
  v9 = messenger;
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory settings messenger with factory: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v9;
}

- (void)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 settingValue:(id)a6 completionHandler:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
  v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v60 = v20;
    __int16 v61 = 2112;
    id v62 = v12;
    __int16 v63 = 2112;
    id v64 = v13;
    __int16 v65 = 2114;
    id v66 = v14;
    __int16 v67 = 2112;
    id v68 = v15;
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating accessory setting with home identifier: %@ accessory identifier: %@ key path: %{public}@ value: %@", buf, 0x34u);
  }
  v21 = [(HMAccessorySettingsController *)v18 dataSourceHomeWithHomeIdentifier:v12];
  v22 = v21;
  if (v21)
  {
    uint64_t v23 = [v21 accessoryWithUniqueIdentifier:v13];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [v22 uuid];
      v26 = [(HMAccessorySettingsController *)v18 messengerWithHomeUUID:v25];

      if (v26)
      {
        v27 = [v24 uuid];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __133__HMAccessorySettingsController_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke;
        v55[3] = &unk_1E5943B08;
        v55[4] = v18;
        id v56 = v14;
        id v28 = v15;
        v53 = v22;
        id v29 = v12;
        id v30 = v13;
        id v31 = v15;
        id v32 = v14;
        id v33 = v28;
        id v57 = v28;
        id v58 = v16;
        id v34 = v33;
        id v14 = v32;
        id v15 = v31;
        id v13 = v30;
        id v12 = v29;
        v22 = v53;
        [v26 sendUpdateAccessorySettingRequestWithAccessoryUUID:v27 keyPath:v56 settingValue:v34 completionHandler:v55];
      }
      else
      {
        v46 = (void *)MEMORY[0x19F3A64A0]();
        v47 = v18;
        v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = v54 = v46;
          *(_DWORD *)buf = 138543362;
          v60 = v49;
          _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to no messenger", buf, 0xCu);

          v46 = v54;
        }

        v50 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
        v51 = [(HMAccessorySettingsController *)v47 context];
        v52 = [v51 delegateCaller];
        [v52 callCompletion:v16 error:v50];

        v26 = 0;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x19F3A64A0]();
      v41 = v18;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        __int16 v61 = 2112;
        id v62 = v13;
        _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to unknown accessory identifier: %@", buf, 0x16u);
      }
      v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v44 = [(HMAccessorySettingsController *)v41 context];
      v45 = [v44 delegateCaller];
      [v45 callCompletion:v16 error:v26];

      v24 = 0;
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x19F3A64A0]();
    v36 = v18;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v38;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to unknown home identifier: %@", buf, 0x16u);
    }
    v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v26 = [(HMAccessorySettingsController *)v36 context];
    v39 = [v26 delegateCaller];
    [v39 callCompletion:v16 error:v24];
  }
}

void __133__HMAccessorySettingsController_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543874;
      v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      v10 = "%{public}@Update accessory setting completed keyPath: %{public}@, with error: %@";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v11, v12, v10, (uint8_t *)&v17, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = *(void **)(a1 + 48);
    int v17 = 138543874;
    v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v14;
    v10 = "%{public}@Update accessory setting completed keyPath: %{public}@, value: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  id v15 = [*(id *)(a1 + 32) context];
  id v16 = [v15 delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 56) error:v3];
}

- (HMAccessorySettingsController)initWithContext:(id)a3 messengerFactory:(id)a4 metricsDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  os_log_type_t v12 = v11;
  if (!v11)
  {
LABEL_9:
    id v16 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingsController *)+[HMAccessorySettingsController logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMAccessorySettingsController;
  uint64_t v13 = [(HMAccessorySettingsController *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeWeak((id *)&v14->_messengerFactory, v10);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1) {
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_4117);
  }
  v2 = (void *)logCategory__hmf_once_v10;

  return v2;
}

uint64_t __44__HMAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10;
  logCategory__hmf_once_id v10 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)updateAccessorySettingWithAccessoryIdentifier:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMAccessorySettingsController *)self context];
  id v15 = [v14 delegateCaller];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __132__HMAccessorySettingsController_Deprecations__updateAccessorySettingWithAccessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke;
  v20[3] = &unk_1E5944900;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 invokeBlock:v20];
}

void __132__HMAccessorySettingsController_Deprecations__updateAccessorySettingWithAccessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v10 = 138544130;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Updating accessory setting with accessory identifier: %@ key path: %@ value: %@", (uint8_t *)&v10, 0x2Au);
  }
  id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

@end