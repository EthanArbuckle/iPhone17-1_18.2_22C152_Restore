@interface HMDSiriMultiUserNewLanguageNotificationManagerContext
+ (id)logCategory;
+ (id)userReadableLanguageFromCode:(id)a3;
- (BOOL)cachedHasCurrentUserSeenNotification;
- (BOOL)hasCurrentUserSeenNotification;
- (BOOL)isRMVEnabledForCurrentUser;
- (HMDSiriMultiUserNewLanguageNotificationManagerContext)initWithUser:(id)a3 workQueue:(id)a4;
- (HMDSiriMultiUserNewLanguageNotificationManagerContextDelegate)delegate;
- (HMDUser)user;
- (NSArray)mediaAccessories;
- (NSString)currentDeviceSiriLanguage;
- (OS_dispatch_queue)workQueue;
- (id)siriLanguageForMediaAccessory:(id)a3;
- (id)siriLanguagesRequiringNotificationForVersion:(id)a3;
- (void)configure;
- (void)handleMediaAccessorySoftwareVersionUpdated:(id)a3;
- (void)setCachedHasCurrentUserSeenNotification:(BOOL)a3;
- (void)setCurrentUserHasSeenNotification;
- (void)setDelegate:(id)a3;
- (void)showNotificationForNewlySupportedLanguage:(id)a3;
- (void)submitLogEventForShownNotificationWithLanguage:(id)a3;
@end

@implementation HMDSiriMultiUserNewLanguageNotificationManagerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  return (HMDUser *)WeakRetained;
}

- (void)setCachedHasCurrentUserSeenNotification:(BOOL)a3
{
  self->_cachedHasCurrentUserSeenNotification = a3;
}

- (BOOL)cachedHasCurrentUserSeenNotification
{
  return self->_cachedHasCurrentUserSeenNotification;
}

- (void)setDelegate:(id)a3
{
}

- (HMDSiriMultiUserNewLanguageNotificationManagerContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDSiriMultiUserNewLanguageNotificationManagerContextDelegate *)WeakRetained;
}

- (void)submitLogEventForShownNotificationWithLanguage:(id)a3
{
  id v3 = a3;
  v5 = [[HMDMultiUserNewLanguageNotificationLogEvent alloc] initWithLanguage:v3];

  v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v4 submitLogEvent:v5];
}

- (void)showNotificationForNewlySupportedLanguage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  v6 = [v5 home];

  if (v6)
  {
    v7 = +[HMDSiriMultiUserNewLanguageNotificationManagerContext userReadableLanguageFromCode:v4];
    if (v7)
    {
      v8 = +[HMDBulletinBoard sharedBulletinBoard];
      [v8 insertNewRMVLanguageBulletinForHome:v6 language:v7];
    }
    else
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine user readable string from language code", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not showing new language RMV notification because home is nil", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)siriLanguageForMediaAccessory:(id)a3
{
  id v3 = [a3 settingsController];
  id v4 = [v3 siriLanguage];

  return v4;
}

- (id)siriLanguagesRequiringNotificationForVersion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F42608] sharedPreferences];
  v6 = [v5 preferenceForKey:@"forceSiriRMVNewLanguageToEnglish"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@forceSiriRMVNewLanguageToEnglish is enabled, so forcing to english", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x263EFFA08] setWithObject:@"en-US"];
  }
  else
  {
    v13 = [v4 shortVersionString];

    if (v13)
    {
      v14 = (void *)MEMORY[0x263EFFA08];
      v15 = [v4 shortVersionString];
      v16 = AFPreferencesMultiUserCompanionNotificationLanguageCodesForHomePodVersion();
      int v17 = [v14 setWithArray:v16];

      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@The software version is nil", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x263EFFA08] set];
  }
  int v17 = (void *)v12;
LABEL_11:

  return v17;
}

- (NSString)currentDeviceSiriLanguage
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  id v3 = [v2 languageCode];

  return (NSString *)v3;
}

- (BOOL)isRMVEnabledForCurrentUser
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 siriIdentifyVoiceEnabled];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", (uint8_t *)&v11, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (void)setCurrentUserHasSeenNotification
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 setHasUserSeenRMVNewLanguageNotification:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__HMDSiriMultiUserNewLanguageNotificationManagerContext_setCurrentUserHasSeenNotification__block_invoke;
    v10[3] = &unk_264A172E8;
    v10[4] = self;
    [v5 getResultWithCompletion:v10];
    [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self setCachedHasCurrentUserSeenNotification:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", buf, 0xCu);
    }
  }
}

void __90__HMDSiriMultiUserNewLanguageNotificationManagerContext_setCurrentUserHasSeenNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v11;
      uint64_t v12 = "%{public}@Asynchronously setCurrentUserHasSeenNotification succeeded";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = HMFGetLogIdentifier();
    int v16 = 138543618;
    int v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    uint64_t v12 = "%{public}@Asynchronously setCurrentUserHasSeenNotification failed with error: %@";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_6;
  }
}

- (BOOL)hasCurrentUserSeenNotification
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self cachedHasCurrentUserSeenNotification])
  {
    return 1;
  }
  id v4 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v5 = v4;
  if (v4)
  {
    char v3 = [v4 ownerHasUserSeenRMVNewLanguageNotification];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasCurrentUserSeenNotification because user is nil", (uint8_t *)&v11, 0xCu);
    }
    char v3 = 1;
  }

  return v3;
}

- (NSArray)mediaAccessories
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 home];
    id v6 = v5;
    if (v5)
    {
      int v7 = [v5 appleMediaAccessories];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = self;
      os_log_type_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint32_t v15 = HMFGetLogIdentifier();
        int v17 = 138543362;
        __int16 v18 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because home is nil", (uint8_t *)&v17, 0xCu);
      }
      int v7 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      __int16 v18 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because user is nil", (uint8_t *)&v17, 0xCu);
    }
    int v7 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v7;
}

- (void)handleMediaAccessorySoftwareVersionUpdated:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self delegate];
    if (v8)
    {
      v9 = [v7 softwareVersion];
      [v8 mediaAccessory:v7 didUpdateSoftwareToVersion:v9];
    }
    else
    {
      os_log_type_t v14 = (void *)MEMORY[0x230FBD990]();
      uint32_t v15 = self;
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@delegate is nil", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received softwareVersion update notification with nil HMDAppleMediaAccessory", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)configure
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleMediaAccessorySoftwareVersionUpdated_ name:@"HMDAppleMediaAccessorySoftwareVersionUpdatedNotification" object:0];
}

- (HMDSiriMultiUserNewLanguageNotificationManagerContext)initWithUser:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_user, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1) {
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_14906);
  }
  v2 = (void *)logCategory__hmf_once_v20;
  return v2;
}

void __68__HMDSiriMultiUserNewLanguageNotificationManagerContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v20;
  logCategory__hmf_once_uint64_t v20 = v0;
}

+ (id)userReadableLanguageFromCode:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@languageCode: %@", (uint8_t *)&v30, 0x16u);
  }
  v9 = [MEMORY[0x263EFF960] deviceLanguage];
  v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = v6;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v13;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@preferredLocalization: %@", (uint8_t *)&v30, 0x16u);
  }
  os_log_type_t v14 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v9];
  uint32_t v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = v11;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v18;
    __int16 v32 = 2112;
    id v33 = v14;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@appLocale: %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v19 = [MEMORY[0x263EFF960] baseLanguageFromLanguage:v4];
  uint64_t v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = v16;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v23;
    __int16 v32 = 2112;
    id v33 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@shortCode: %@", (uint8_t *)&v30, 0x16u);
  }
  v24 = [v14 localizedStringForLanguage:v19 context:1];
  uint64_t v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = v21;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v28;
    __int16 v32 = 2112;
    id v33 = v24;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@languageName: %@", (uint8_t *)&v30, 0x16u);
  }

  return v24;
}

@end