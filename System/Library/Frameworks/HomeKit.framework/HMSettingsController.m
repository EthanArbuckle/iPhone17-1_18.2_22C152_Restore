@interface HMSettingsController
+ (id)logCategory;
- (BOOL)hasSettingGroups;
- (BOOL)hasSettings;
- (HMSettingGroup)rootGroup;
- (HMSettings)settings;
- (HMSettingsController)initWithParentIdentifier:(id)a3 codingKey:(id)a4 messageHandler:(id)a5 settingsCreator:(id)a6;
- (HMSettingsController)initWithParentIdentifier:(id)a3 homeUUID:(id)a4 codingKey:(id)a5;
- (HMSettingsDelegate)delegate;
- (HMSettingsMessageHandler)messageHandler;
- (NSDictionary)encodedSettings;
- (NSString)codingKey;
- (NSUUID)parentIdentifier;
- (_HMContext)context;
- (id)logIdentifier;
- (id)settingForKeyPath:(id)a3;
- (id)settingGroupForKeyPath:(id)a3;
- (void)__notifyDelegateDidUpdateKeyPath:(id)a3;
- (void)__notifyDelegateSettingsDidUpdate;
- (void)configureWithContext:(id)a3;
- (void)decodeWithCoder:(id)a3;
- (void)mergeWith:(id)a3 settingsInitializedWasModified:(BOOL)a4;
- (void)notifyDelegateOfUpdate;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncodedSettings:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRootGroup:(id)a3;
- (void)setSetting:(id)a3 withGroupKeyPath:(id)a4;
- (void)setSettingGroup:(id)a3 withParentGroupKeyPath:(id)a4;
- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation HMSettingsController

- (HMSettings)settings
{
  return (HMSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)configureWithContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMSettingsController *)v6 settings];
    v10 = [v9 longDescription];
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Configure with settings: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMSettingsController *)v6 setContext:v4];
  v11 = [(HMSettingsController *)v6 messageHandler];
  [v11 configureWithContext:v4];
}

- (void)setContext:(id)a3
{
}

- (HMSettingsMessageHandler)messageHandler
{
  return (HMSettingsMessageHandler *)objc_getProperty(self, a2, 56, 1);
}

- (HMSettingsController)initWithParentIdentifier:(id)a3 homeUUID:(id)a4 codingKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [HMSettingsMessageHandler alloc];
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  if (v11)
  {
    v24.receiver = v11;
    v24.super_class = (Class)HMSettingsMessageHandler;
    v11 = [(HMSettingsController *)&v24 init];
    if (v11)
    {
      uint64_t v15 = [v12 copy];
      userTargetUUID = v11->_userTargetUUID;
      v11->_userTargetUUID = (NSUUID *)v15;

      uint64_t v17 = [v13 copy];
      homeTargetUUID = v11->_homeTargetUUID;
      v11->_homeTargetUUID = (NSUUID *)v17;

      uint64_t v19 = [v14 copy];
      targetSettingsType = v11->_targetSettingsType;
      v11->_targetSettingsType = (NSString *)v19;
    }
  }

  v21 = objc_alloc_init(HMSettingsCreator);
  v22 = [(HMSettingsController *)self initWithParentIdentifier:v12 codingKey:v14 messageHandler:v11 settingsCreator:v21];

  return v22;
}

- (HMSettingsController)initWithParentIdentifier:(id)a3 codingKey:(id)a4 messageHandler:(id)a5 settingsCreator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMSettingsController;
  uint64_t v15 = [(HMSettingsController *)&v24 init];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_parentIdentifier, a3);
    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    groupsMap = v16->_groupsMap;
    v16->_groupsMap = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    settingsMap = v16->_settingsMap;
    v16->_settingsMap = (NSMapTable *)v19;

    objc_storeStrong((id *)&v16->_messageHandler, a5);
    objc_storeStrong((id *)&v16->_codingKey, a4);
    uint64_t v21 = [v14 createSettingsWithOwner:v16];
    settings = v16->_settings;
    v16->_settings = (HMSettings *)v21;
  }
  return v16;
}

- (HMSettingGroup)rootGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rootGroup;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x19F3A64A0](v6);
  id v8 = self;
  HMFGetOSLogHandle();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting user settings delegate: %@", (uint8_t *)&v11, 0x16u);
  }
  objc_storeWeak((id *)&v8->_delegate, v4);
  os_unfair_lock_unlock(p_lock);
}

- (id)logIdentifier
{
  v2 = [(HMSettingsController *)self parentIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1) {
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_14099);
  }
  v2 = (void *)logCategory__hmf_once_v32;

  return v2;
}

uint64_t __35__HMSettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_encodedSettings, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_rootGroup, 0);
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncodedSettings:(id)a3
{
}

- (NSDictionary)encodedSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessageHandler:(id)a3
{
}

- (void)__notifyDelegateDidUpdateKeyPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMSettingsController *)self context];
  uint64_t v6 = [v5 delegateCaller];

  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Finished update", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__HMSettingsController___notifyDelegateDidUpdateKeyPath___block_invoke;
    v13[3] = &unk_1E59449A0;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    [v6 invokeBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v10)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);
    }
  }
}

void __57__HMSettingsController___notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x1E4F29128];
    v5 = [WeakRetained parentIdentifier];
    uint64_t v6 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v5);

    v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v11 = [v8 settings];
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138544386;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@ delegate: %@", (uint8_t *)&v14, 0x34u);
    }
    __int16 v13 = [v8 settings];
    [v3 settings:v13 didUpdateForIdentifier:v6 keyPath:*(void *)(a1 + 32)];
  }
}

- (void)__notifyDelegateSettingsDidUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMSettingsController *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    v5 = [(HMSettingsController *)self delegate];
    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__HMSettingsController___notifyDelegateSettingsDidUpdate__block_invoke;
    v11[3] = &unk_1E59449A0;
    objc_copyWeak(&v13, (id *)location);
    id v6 = v5;
    id v12 = v6;
    [v4 invokeBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v10;
      __int16 v15 = 2112;
      __int16 v16 = v3;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify clients of updated settings due to no delegate caller in context: %@", location, 0x16u);
    }
  }
}

void __57__HMSettingsController___notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = WeakRetained;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [v4 settings];
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138543874;
    id v12 = v6;
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update settings: %@ delegate: %@", (uint8_t *)&v11, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = *(void **)(a1 + 32);
    BOOL v10 = [v4 settings];
    [v9 settingsDidUpdate:v10];
  }
}

- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMSettingsController *)self context];
  if (!v10)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSettingsController updateValueForSetting:value:completionHandler:]", @"completionHandler"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v12 = (void *)v11;
  if (v11)
  {
    __int16 v13 = (void *)[v9 copy];
    int v14 = [v12 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    id v27 = v8;
    v28 = self;
    id v31 = v10;
    id v29 = v13;
    id v30 = v9;
    id v15 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      __int16 v34 = 2080;
      v35 = "-[HMSettingsController updateValueForSetting:value:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v10 + 2))(v10, v15);
  }
}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (([a1[4] properties] & 2) == 0)
  {
    v23 = [a1[5] context];
    v2 = [v23 delegateCaller];
    id v3 = a1[8];
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Setting is not writable" reason:@"Setting is not writable" suggestion:0];
    [v2 callCompletion:v3 error:v4];

LABEL_5:

    return;
  }
  v5 = [a1[4] value];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    v23 = [a1[5] context];
    v2 = [v23 delegateCaller];
    [v2 callCompletion:a1[8] error:0];
    goto LABEL_5;
  }
  v7 = [a1[4] valueForUpdate:a1[7]];
  id v29 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v29];
  id v9 = v29;
  if (v8)
  {
    id v10 = [a1[5] messageHandler];
    uint64_t v11 = [a1[4] keyPath];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_81;
    v25[3] = &unk_1E5943B08;
    *(_OWORD *)uint64_t v24 = *((_OWORD *)a1 + 2);
    id v12 = v24[0];
    int8x16_t v26 = vextq_s8(*(int8x16_t *)v24, *(int8x16_t *)v24, 8uLL);
    id v27 = a1[7];
    id v28 = a1[8];
    [v10 sendUpdateValueMessage:v11 value:v8 completionHandler:v25];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[5];
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = a1[7];
      id v18 = a1[4];
      *(_DWORD *)buf = 138544130;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      __int16 v34 = 2112;
      id v35 = v18;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain encoded setting value %@ for setting %@. Error : %@", buf, 0x2Au);
    }
    uint64_t v19 = [a1[5] context];
    uint64_t v20 = [v19 delegateCaller];
    id v21 = a1[8];
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Could not encode value" reason:@"Could not encode value" suggestion:0];
    [v20 callCompletion:v21 error:v22];
  }
}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 context];
  int v6 = [v5 delegateCaller];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5943B08;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v6 callCompletion:v8 error:v4];
}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 40) setValue:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)decodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int v6 = [(HMSettingsController *)self codingKey];
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  [(HMSettingsController *)self setRootGroup:v7];
}

- (void)notifyDelegateOfUpdate
{
  id v3 = [(HMSettingsController *)self context];
  id v4 = [v3 delegateCaller];

  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__HMSettingsController_notifyDelegateOfUpdate__block_invoke;
    v5[3] = &unk_1E59455B8;
    objc_copyWeak(&v6, &location);
    [v4 invokeBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __46__HMSettingsController_notifyDelegateOfUpdate__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = WeakRetained;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling delegate settings did update: %@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [v4 settings];
    [v2 settingsDidUpdate:v7];
  }
}

- (void)mergeWith:(id)a3 settingsInitializedWasModified:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 rootGroup];
  int v8 = [(HMSettingsController *)self rootGroup];
  uint64_t v9 = [v8 identifier];
  __int16 v10 = [v7 identifier];
  char v11 = HMFEqualObjects();

  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v24 = 0;
    uint64_t v12 = [v6 rootGroup];
    uint64_t v13 = v12;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_47;
    v21[3] = &unk_1E593F5D0;
    v21[4] = self;
    v21[5] = buf;
    if (v12) {
      _PreorderTraverseGroupsWithBlock(v12, 0, v21);
    }

    if (*(unsigned char *)(*(void *)&buf[8] + 24) || v4) {
      [(HMSettingsController *)self __notifyDelegateSettingsDidUpdate];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v7 longDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Merging new root group: %@", buf, 0x16u);
    }
    [(HMSettingsController *)v15 setRootGroup:v7];
    [(HMSettingsController *)v15 __notifyDelegateSettingsDidUpdate];
    uint64_t v19 = [v6 rootGroup];
    uint64_t v20 = v19;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke;
    v22[3] = &unk_1E593F580;
    v22[4] = v15;
    if (v19) {
      _PreorderTraverseGroupsWithBlock(v19, 0, v22);
    }
  }
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = [a2 keyPath];
  uint64_t v5 = [v3 settingGroupForKeyPath:v4];

  id v6 = [v5 settings];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_2;
  v7[3] = &unk_1E5940350;
  v7[4] = *(void *)(a1 + 32);
  objc_msgSend(v6, "na_each:", v7);
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  int v8 = [v5 keyPath];
  uint64_t v9 = [v7 settingGroupForKeyPath:v8];

  if (!v9)
  {
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      __int16 v14 = [v5 longDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      char v24 = v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging new setting group: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setSettingGroup:v5 withParentGroupKeyPath:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v15 = [v5 settings];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_48;
  v18[3] = &unk_1E593F5A8;
  uint64_t v16 = *(void *)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v5;
  uint64_t v20 = v16;
  id v17 = v5;
  objc_msgSend(v15, "na_each:", v18);
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v3 keyPath];
  id v6 = [v4 settingForKeyPath:v5];

  if (!v6)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging new setting: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = [*(id *)(a1 + 40) keyPath];
    [v15 setSetting:v3 withGroupKeyPath:v16];

    goto LABEL_9;
  }
  if (([v6 isEqual:v3] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging setting: %@", (uint8_t *)&v19, 0x16u);
    }
    [v6 merge:v3];
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v17 = *(void **)(a1 + 32);
    id v18 = [v3 keyPath];
    objc_msgSend(v17, "__notifyDelegateDidUpdateKeyPath:", v18);
  }
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = [v3 keyPath];
    int v12 = 138544130;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial notify delegate = %@ for keyPath = %@ with setting = %@", (uint8_t *)&v12, 0x2Au);
  }
  __int16 v10 = *(void **)(a1 + 32);
  id v11 = [v3 keyPath];
  objc_msgSend(v10, "__notifyDelegateDidUpdateKeyPath:", v11);
}

- (id)settingGroupForKeyPath:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_groupsMap objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setSettingGroup:(id)a3 withParentGroupKeyPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  uint64_t v9 = [(HMSettingsController *)self settingGroupForKeyPath:v7];
  __int16 v10 = v9;
  if (v9)
  {
    [v9 addGroup:v6];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    groupsMap = self->_groupsMap;
    uint64_t v13 = [v6 keyPath];
    [(NSMapTable *)groupsMap setObject:v6 forKey:v13];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v17;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to get parent group with key path: %@ for setting group: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (BOOL)hasSettingGroups
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(NSMapTable *)v2->_groupsMap count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMSettingsDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMSettingsDelegate *)WeakRetained;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_settingsMap objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setSetting:(id)a3 withGroupKeyPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v9 = [(HMSettingsController *)self settingGroupForKeyPath:v7];
  __int16 v10 = v9;
  if (v9)
  {
    [v9 addSetting:v6];
    [v6 setSettingManager:self];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    settingsMap = self->_settingsMap;
    uint64_t v13 = [v6 keyPath];
    [(NSMapTable *)settingsMap setObject:v6 forKey:v13];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v17;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to get group with key path: %@ for setting: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (BOOL)hasSettings
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(NSMapTable *)v2->_settingsMap count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRootGroup:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  groupsMap = self->_groupsMap;
  self->_groupsMap = v6;

  id v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  settingsMap = self->_settingsMap;
  self->_settingsMap = v8;

  objc_storeStrong((id *)&self->_rootGroup, a3);
  __int16 v10 = self->_groupsMap;
  id v11 = [v5 keyPath];
  [(NSMapTable *)v10 setObject:v5 forKey:v11];

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__HMSettingsController_setRootGroup___block_invoke;
  v12[3] = &unk_1E593F580;
  v12[4] = self;
  if (v5) {
    _PreorderTraverseGroupsWithBlock(v5, 0, v12);
  }
}

void __37__HMSettingsController_setRootGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) setSettingGroup:v5 withParentGroupKeyPath:a3];
  }
  id v6 = [v5 settings];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__HMSettingsController_setRootGroup___block_invoke_2;
  v8[3] = &unk_1E593F558;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "na_each:", v8);
}

void __37__HMSettingsController_setRootGroup___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 keyPath];
  [v2 setSetting:v4 withGroupKeyPath:v5];
}

@end