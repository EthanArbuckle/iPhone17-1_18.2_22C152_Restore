@interface HMDAppleAccountSettings
+ (BOOL)supportsCloudSettings;
+ (id)logCategory;
+ (id)sharedSettings;
- (BOOL)isEducationMode;
- (BOOL)isEphemeral;
- (BOOL)isHomeEnabled;
- (BOOL)isKeychainSyncEnabled;
- (BOOL)isManaged;
- (BOOL)migrated;
- (HMDAppleAccountSettings)init;
- (OS_dispatch_queue)clientQueue;
- (id)attributeDescriptions;
- (void)__migrateHomePreferences;
- (void)__registerForKeychainChangeNotifications;
- (void)__synchronize;
- (void)__updateHomeEnabled:(BOOL)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5;
- (void)_notifyClientsOfUpdatedHomeState:(BOOL)a3 userInitiated:(BOOL)a4;
- (void)_notifyClientsOfUpdatedKeychainSyncState:(BOOL)a3;
- (void)enableHome:(BOOL)a3 userInitiated:(BOOL)a4;
- (void)handleManateeAvailabilityNotification:(id)a3;
- (void)setMigrated:(BOOL)a3;
- (void)synchronize;
- (void)updateHomeEnabled:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMDAppleAccountSettings

- (BOOL)isEducationMode
{
  if ([(HMDAppleAccountSettings *)self isManaged]) {
    return 1;
  }
  return [(HMDAppleAccountSettings *)self isEphemeral];
}

- (BOOL)isManaged
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_managed;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (BOOL)isEphemeral
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_ephemeral;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_26545);
  }
  v2 = (void *)sharedSettings_sharedSettings;
  return v2;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAppleAccountSettings *)self isHomeEnabled];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"HME" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAppleAccountSettings *)self isKeychainSyncEnabled];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"KSE" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAppleAccountSettings *)self isManaged];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"MA" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAppleAccountSettings *)self isEphemeral];
  v13 = HMFBooleanToString();
  v14 = (void *)[v12 initWithName:@"EDU" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12216 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_12216, &__block_literal_global_12217);
  }
  v2 = (void *)logCategory__hmf_once_v1_12218;
  return v2;
}

uint64_t __46__HMDAppleAccountSettings_Common__logCategory__block_invoke()
{
  logCategory__hmf_once_v1_12218 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (void)setMigrated:(BOOL)a3
{
  self->_migrated = a3;
}

- (BOOL)migrated
{
  return self->_migrated;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)handleManateeAvailabilityNotification:(id)a3
{
  v4 = [(HMDAppleAccountSettings *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDAppleAccountSettings_handleManateeAvailabilityNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __65__HMDAppleAccountSettings_handleManateeAvailabilityNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received Manatee availability notification", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__synchronize");
}

- (void)__updateHomeEnabled:(BOOL)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, void *))a5;
  if (+[HMDAppleAccountSettings supportsCloudSettings])
  {
    context = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = +[HMDAppleAccountManager sharedManager];
    v10 = [v9 accountStore];

    v11 = objc_msgSend(v10, "aa_primaryAppleAccount");
    id v12 = v11;
    if (v11)
    {
      v13 = (void *)MEMORY[0x1E4F17AC0];
      if (v6
        && (v14 = (__CFString *)*MEMORY[0x1E4F17AC0],
            ([v11 isProvisionedForDataclass:*MEMORY[0x1E4F17AC0]] & 1) == 0))
      {
        v28 = (void *)MEMORY[0x1D9452090]();
        v29 = self;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = (uint64_t)v31;
          __int16 v41 = 2112;
          v42 = v14;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to enable iCloud switch for account. Account currently unprovisioned for %@", buf, 0x16u);
        }
        if (v8)
        {
          v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
          v8[2](v8, v32);
        }
      }
      else
      {
        v15 = (void *)MEMORY[0x1D9452090]();
        v16 = self;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          v19 = (void *)v18;
          v20 = @"disabled";
          if (v6) {
            v20 = @"enabled";
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v18;
          __int16 v41 = 2112;
          v42 = v20;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating iCloud setting to %@", buf, 0x16u);
        }
        v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v21 postNotificationName:@"kCloudDataSyncInProgressUpdatedNotification" object:v16];

        [v12 setEnabled:v6 forDataclass:*v13];
        objc_initWeak((id *)buf, v16);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __79__HMDAppleAccountSettings___updateHomeEnabled_userInitiated_completionHandler___block_invoke;
        v34[3] = &unk_1E6A08B98;
        objc_copyWeak(&v36, (id *)buf);
        BOOL v37 = v6;
        BOOL v38 = a4;
        v35 = v8;
        [v10 saveVerifiedAccount:v12 withCompletionHandler:v34];

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = (uint64_t)v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to update iCloud setting, there is no primary account", buf, 0xCu);
      }
      if (v8)
      {
        v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        v8[2](v8, v27);
      }
    }
  }
  else if (v8)
  {
    v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v8[2](v8, v22);
  }
}

void __79__HMDAppleAccountSettings___updateHomeEnabled_userInitiated_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = WeakRetained;
  if (a2)
  {
    [WeakRetained enableHome:*(unsigned __int8 *)(a1 + 48) userInitiated:*(unsigned __int8 *)(a1 + 49)];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v7;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save iCloud setting with error: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v5);
  }
}

- (void)updateHomeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(HMDAppleAccountSettings *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDAppleAccountSettings_updateHomeEnabled_completionHandler___block_invoke;
  block[3] = &unk_1E6A113D0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __63__HMDAppleAccountSettings_updateHomeEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__updateHomeEnabled:userInitiated:completionHandler:", *(unsigned __int8 *)(a1 + 48), 1, *(void *)(a1 + 40));
}

- (void)__migrateHomePreferences
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"kDisplayiCloudSwitch", @"com.apple.homed");
  if (v3)
  {
    v4 = v3;
    CFPreferencesSetAppValue(@"kDisplayiCloudSwitch", 0, @"com.apple.homed");
    CFRelease(v4);
  }
  id v5 = (void *)CFPreferencesCopyAppValue(@"kiCloudSwitchStateKey", @"com.apple.homed");
  CFTypeID TypeID = CFBooleanGetTypeID();
  objc_opt_class();
  if (v5 && CFGetTypeID(v5) != TypeID)
  {
    CFRelease(v5);
    id v5 = 0;
  }
  if (objc_opt_isKindOfClass()) {
    int v7 = v5;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    CFPreferencesSetAppValue(@"kiCloudSwitchStateKey", 0, @"com.apple.homed");
    -[HMDAppleAccountSettings __updateHomeEnabled:userInitiated:completionHandler:](self, "__updateHomeEnabled:userInitiated:completionHandler:", [v8 BOOLValue], 0, 0);
  }
  [(HMDAppleAccountSettings *)self setMigrated:1];
}

- (void)__registerForKeychainChangeNotifications
{
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  CFPropertyListRef v3 = [NSString stringWithUTF8String:*MEMORY[0x1E4F5B2C8]];
  [v4 addObserver:self selector:sel_handleManateeAvailabilityNotification_ name:v3 object:0];
}

- (void)__synchronize
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (+[HMDAppleAccountSettings supportsCloudSettings])
  {
    uint64_t v3 = os_unfair_lock_lock_with_options();
    context = (void *)MEMORY[0x1D9452090](v3);
    id v4 = +[HMDAppleAccountManager sharedManager];
    id v5 = [v4 accountStore];
    __int16 v41 = objc_msgSend(v5, "aa_primaryAppleAccount");

    if (v41) {
      uint64_t v6 = [v41 isEnabledForDataclass:*MEMORY[0x1E4F17AC0]];
    }
    else {
      uint64_t v6 = 0;
    }
    int homeEnabled = self->_homeEnabled;
    BOOL v8 = homeEnabled != v6;
    if (homeEnabled != v6)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = self;
      HMFGetOSLogHandle();
      BOOL v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        int v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        id v44 = v12;
        __int16 v45 = 2112;
        id v46 = v13;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated to home enabled: %@", buf, 0x16u);
      }
      self->_int homeEnabled = v6;
      [(HMDAppleAccountSettings *)v10 _notifyClientsOfUpdatedHomeState:v6 userInitiated:0];
    }
    if (![(HMDAppleAccountSettings *)self migrated]) {
      [(HMDAppleAccountSettings *)self __migrateHomePreferences];
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F5B2F0]);
    id v42 = 0;
    uint64_t v15 = [v14 isManateeAvailable:&v42];
    id v16 = v42;
    if ((v15 & 1) == 0)
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v44 = v20;
        __int16 v45 = 2112;
        id v46 = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@The v0 keychain is not enabled: %@", buf, 0x16u);
      }
    }
    if (self->_keychainSyncEnabled != v15)
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        id v44 = v24;
        __int16 v45 = 2112;
        id v46 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updated to keychain sync enabled: %@", buf, 0x16u);
      }
      self->_keychainSyncEnabled = v15;
      [(HMDAppleAccountSettings *)v22 _notifyClientsOfUpdatedKeychainSyncState:v15];
      BOOL v8 = 1;
    }

    int v26 = objc_msgSend(v41, "aa_isManagedAppleID");
    BOOL v27 = v26;
    if (self->_managed != v26)
    {
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        id v44 = v31;
        __int16 v45 = 2112;
        id v46 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Updated to managed account: %@", buf, 0x16u);
      }
      self->_managed = v27;
      BOOL v8 = 1;
    }
    v33 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v34 = [v33 isMultiUser];

    if (self->_ephemeral != v34)
    {
      v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = self;
      HMFGetOSLogHandle();
      BOOL v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        id v44 = v38;
        __int16 v45 = 2112;
        id v46 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Updated to ephemeral account: %@", buf, 0x16u);
      }
      self->_ephemeral = v34;
      BOOL v8 = 1;
    }

    os_unfair_lock_unlock(&self->_lock.lock);
    if (v8) {
      __HMDAppleAccountSettingsPostUpdatedNotification(self);
    }
  }
}

- (void)synchronize
{
  if (+[HMDAppleAccountSettings supportsCloudSettings])
  {
    uint64_t v3 = [(HMDAppleAccountSettings *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HMDAppleAccountSettings_synchronize__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __38__HMDAppleAccountSettings_synchronize__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    BOOL v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing apple account settings", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__synchronize");
}

- (void)_notifyClientsOfUpdatedKeychainSyncState:(BOOL)a3
{
  id v4 = [(HMDAppleAccountSettings *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDAppleAccountSettings__notifyClientsOfUpdatedKeychainSyncState___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __68__HMDAppleAccountSettings__notifyClientsOfUpdatedKeychainSyncState___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey" object:*(void *)(a1 + 32)];
}

- (BOOL)isKeychainSyncEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_keychainSyncEnabled;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)_notifyClientsOfUpdatedHomeState:(BOOL)a3 userInitiated:(BOOL)a4
{
  int v7 = [(HMDAppleAccountSettings *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HMDAppleAccountSettings__notifyClientsOfUpdatedHomeState_userInitiated___block_invoke;
  v8[3] = &unk_1E6A0F918;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = a4;
  dispatch_async(v7, v8);
}

void __74__HMDAppleAccountSettings__notifyClientsOfUpdatedHomeState_userInitiated___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isHomeEnabled to %@", buf, 0x16u);
  }
  int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 41), @"kIsUserInitiated");
  id v12 = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v7 postNotificationName:@"HMDAppleAccountSettingsHomeStateUpdatedNotification" object:v8 userInfo:v10];
}

- (void)enableHome:(BOOL)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_homeEnabled == v5)
  {
    os_unfair_lock_unlock(&p_lock->lock);
  }
  else
  {
    self->_int homeEnabled = v5;
    os_unfair_lock_unlock(&p_lock->lock);
    [(HMDAppleAccountSettings *)self _notifyClientsOfUpdatedHomeState:v4 userInitiated:v4];
    __HMDAppleAccountSettingsPostUpdatedNotification(self);
  }
}

- (BOOL)isHomeEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_homeEnabled;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (HMDAppleAccountSettings)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccountSettings;
  id v2 = [(HMDAppleAccountSettings *)&v18 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v4 = objc_claimAutoreleasedReturnValue();
    BOOL v5 = (const char *)[v4 UTF8String];
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v7;

    v3->_int homeEnabled = 1;
    v3->_keychainSyncEnabled = 1;
    [(HMDAppleAccountSettings *)v3 __registerForKeychainChangeNotifications];
    BOOL v9 = (void *)MEMORY[0x1D9452090]([(HMDAppleAccountSettings *)v3 __synchronize]);
    BOOL v10 = v3;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      [(HMDAppleAccountSettings *)v10 isHomeEnabled];
      int v13 = HMFBooleanToString();
      [(HMDAppleAccountSettings *)v10 isKeychainSyncEnabled];
      id v14 = HMFBooleanToString();
      [(HMDAppleAccountSettings *)v10 isManaged];
      __int16 v15 = HMFBooleanToString();
      [(HMDAppleAccountSettings *)v10 isEphemeral];
      id v16 = HMFBooleanToString();
      *(_DWORD *)buf = 138544386;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      int v26 = v15;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Initialized Apple account settings with isHomeEnabled: %@, isKeychainSyncEnabled: %@, isManaged: %@, isEphemeral: %@", buf, 0x34u);
    }
  }
  return v3;
}

+ (BOOL)supportsCloudSettings
{
  id v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x26u >> v3);
}

uint64_t __41__HMDAppleAccountSettings_sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(HMDAppleAccountSettings);
  uint64_t v1 = sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end