@interface HMAccessorySettings
+ (id)localizationKeyForKeyPath:(id)a3;
+ (id)logCategory;
- (BOOL)isControllable;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMAccessorySettingGroup)rootGroup;
- (HMAccessorySettings)initWithSettingsContainer:(id)a3 settingsControl:(id)a4 rootGroup:(id)a5;
- (HMAccessorySettingsContainerInternal)settingsContainerInternal;
- (HMAccessorySettingsDelegate)delegate;
- (HMControllable)settingsControl;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (void)_configureWithContext:(id)a3;
- (void)_notifyDelegateDidUpdateKeyPath:(id)a3;
- (void)_updateSettingsWithBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingsContainerInternal:(id)a3;
- (void)setSettingsControl:(id)a3;
@end

@implementation HMAccessorySettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_settingsContainerInternal);

  objc_destroyWeak((id *)&self->_settingsControl);
}

- (_HMContext)context
{
  return self->_context;
}

- (HMAccessorySettingGroup)rootGroup
{
  return (HMAccessorySettingGroup *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(HMAccessorySettings *)self rootGroup];
    v8 = [v6 rootGroup];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __42__HMAccessorySettings_mergeFromNewObject___block_invoke;
      v17[3] = &unk_1E5941960;
      objc_copyWeak(&v20, &location);
      id v18 = v7;
      id v19 = v6;
      [(HMAccessorySettings *)self _updateSettingsWithBlock:v17];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v10 = [v6 rootGroup];
    char v11 = [v7 isReflectedEqual:v10];

    if (v11)
    {
      char v12 = v9 ^ 1;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __42__HMAccessorySettings_mergeFromNewObject___block_invoke_24;
      v14[3] = &unk_1E5945628;
      id v15 = v7;
      id v16 = v6;
      [(HMAccessorySettings *)self _updateSettingsWithBlock:v14];

      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

void __42__HMAccessorySettings_mergeFromNewObject___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = [a1[4] internal];
  id v4 = [a1[5] rootGroup];
  v5 = [v4 internal];
  char v6 = [v3 mergeObject:v5];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = WeakRetained;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      char v12 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@The merge unexpectedly did not result in a change.", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __42__HMAccessorySettings_mergeFromNewObject___block_invoke_24(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) rootGroup];
  [v1 mergeReflected:v2];
}

- (NSUUID)uniqueIdentifier
{
  return 0;
}

- (void)_notifyDelegateDidUpdateKeyPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessorySettings *)self rootGroup];
  char v6 = [v5 internal];
  v7 = [v6 context];
  id v8 = [v7 delegateCaller];

  char v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Finished update", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v10);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__HMAccessorySettings__notifyDelegateDidUpdateKeyPath___block_invoke;
    v15[3] = &unk_1E59449A0;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v4;
    [v8 invokeBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v12)
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);
    }
  }
}

void __55__HMAccessorySettings__notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = WeakRetained;
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      id v8 = [v5 accessory];
      char v9 = [v8 uniqueIdentifier];
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138544130;
      v14 = v7;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@", (uint8_t *)&v13, 0x2Au);
    }
    int v11 = [v5 accessory];
    BOOL v12 = [v11 uniqueIdentifier];
    [v3 settings:v5 didUpdateForIdentifier:v12 keyPath:*(void *)(a1 + 32)];
  }
}

- (void)_updateSettingsWithBlock:(id)a3
{
  v27[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v18 = __48__HMAccessorySettings__updateSettingsWithBlock___block_invoke;
  __int16 v19 = &unk_1E59454E8;
  uint64_t v20 = self;
  id v21 = v4;
  id v5 = v4;
  char v6 = v17;
  if (self)
  {
    v7 = [(HMAccessorySettings *)self rootGroup];
    id v8 = [v7 internal];
    char v9 = [v8 context];
    uint64_t v10 = [v9 delegateCaller];

    int v11 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v12 = self;
    int v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        __int16 v15 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Starting update", (uint8_t *)&buf, 0xCu);
      }
      objc_initWeak(&location, v12);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v24 = __79__HMAccessorySettings___notifyDelegateSettingsWillUpdateWithCompletionHandler___block_invoke;
      v25 = &unk_1E5941938;
      objc_copyWeak(v27, &location);
      v26 = v6;
      [v10 invokeBlock:&buf];

      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v14)
      {
        id v16 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updating settings", (uint8_t *)&buf, 0xCu);
      }
      v18((uint64_t)v6);
    }
  }
}

void __48__HMAccessorySettings__updateSettingsWithBlock___block_invoke(uint64_t a1)
{
  v24[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) rootGroup];
    id v5 = [v4 internal];
    char v6 = [v5 context];
    v7 = [v6 delegateCaller];

    if (v7)
    {
      id v8 = [v3 rootGroup];
      char v9 = [v8 internal];
      uint64_t v10 = [v9 identifier];

      int v11 = (void *)MEMORY[0x19F3A64A0]();
      id v12 = v3;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@%@: Finished update", buf, 0x16u);
      }
      objc_initWeak(&location, v12);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __56__HMAccessorySettings___notifyDelegateSettingsDidUpdate__block_invoke;
      v22 = &unk_1E59449A0;
      objc_copyWeak(v24, &location);
      id v15 = v10;
      id v23 = v15;
      [v7 invokeBlock:buf];

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);
    }
    else
    {
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = v3;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);
      }
    }
  }
}

void __79__HMAccessorySettings___notifyDelegateSettingsWillUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = WeakRetained;
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings will update: %@", (uint8_t *)&v9, 0x16u);
    }
    [v3 settingsWillUpdate:v5];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

void __56__HMAccessorySettings___notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = WeakRetained;
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v13 = 138543618;
      BOOL v14 = v7;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", (uint8_t *)&v13, 0x16u);
    }
    [v3 settingsDidUpdate:v5];
  }
  else if (v3)
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 32);
      int v13 = 138543618;
      BOOL v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@%@: Delegate does not implement settingsDidUpdate:", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)isControllable
{
  uint64_t v2 = [(HMAccessorySettings *)self settingsControl];
  char v3 = [v2 isControllable];

  return v3;
}

- (HMAccessorySettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAccessorySettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  char v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = [(HMAccessorySettings *)v6 rootGroup];
    uint64_t v10 = [(HMAccessorySettings *)v6 settingsContainer];
    int v11 = 138544130;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting delegate %@ on settings %@ for %@", (uint8_t *)&v11, 0x2Au);
  }
  objc_storeWeak((id *)&v6->_delegate, v4);
}

- (void)setSettingsControl:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_settingsControl, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMControllable)settingsControl
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsControl);
  os_unfair_lock_unlock(p_lock);

  return (HMControllable *)WeakRetained;
}

- (void)setSettingsContainerInternal:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_settingsContainerInternal, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMAccessorySettingsContainerInternal)settingsContainerInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContainerInternal);
  os_unfair_lock_unlock(p_lock);

  return (HMAccessorySettingsContainerInternal *)WeakRetained;
}

- (HMAccessory)accessory
{
  uint64_t v2 = [(HMAccessorySettings *)self settingsContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  id v4 = v3;

  return (HMAccessory *)v4;
}

- (void)_configureWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  id v5 = a3;
  id v7 = [(HMAccessorySettings *)self rootGroup];
  char v6 = [v7 internal];
  [v6 configureWithAccessorySettings:self context:v5];
}

- (HMAccessorySettings)initWithSettingsContainer:(id)a3 settingsControl:(id)a4 rootGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySettings;
  int v11 = [(HMAccessorySettings *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_settingsContainerInternal, v8);
    objc_storeWeak((id *)&v12->_settingsControl, v9);
    objc_storeStrong((id *)&v12->_rootGroup, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_29426);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v17;

  return v2;
}

uint64_t __34__HMAccessorySettings_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17;
  logCategory__hmf_once___int16 v17 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)localizationKeyForKeyPath:(id)a3
{
  char v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1EEE9DD88, 1, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @".", @"_", 1, 0, objc_msgSend(v3, "length"));
  id v4 = [v3 uppercaseString];

  return v4;
}

@end