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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      v13 = (void *)MEMORY[0x1D9452090]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine user readable string from language code", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not showing new language RMV notification because home is nil", (uint8_t *)&v17, 0xCu);
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F65530] sharedPreferences];
  v6 = [v5 preferenceForKey:@"forceSiriRMVNewLanguageToEnglish"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@forceSiriRMVNewLanguageToEnglish is enabled, so forcing to english", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"en-US"];
  }
  else
  {
    v13 = [v4 shortVersionString];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = [v4 shortVersionString];
      v16 = AFPreferencesMultiUserCompanionNotificationLanguageCodesForHomePodVersion();
      int v17 = [v14 setWithArray:v16];

      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@The software version is nil", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  int v17 = (void *)v12;
LABEL_11:

  return v17;
}

- (NSString)currentDeviceSiriLanguage
{
  v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v3 = [v2 languageCode];

  return (NSString *)v3;
}

- (BOOL)isRMVEnabledForCurrentUser
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 userDataController];
    char v6 = [v5 isRecognizeMyVoiceEnabled];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", (uint8_t *)&v12, 0xCu);
    }
    char v6 = 0;
  }

  return v6;
}

- (void)setCurrentUserHasSeenNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 userDataController];
    [v5 setHasUserSeenRMVNewLanguageNotification:1];

    [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self setCachedHasCurrentUserSeenNotification:1];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)hasCurrentUserSeenNotification
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self cachedHasCurrentUserSeenNotification])
  {
    return 1;
  }
  id v4 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 userDataController];
    char v3 = [v6 hasUserSeenRMVNewLanguageNotification];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasCurrentUserSeenNotification because user is nil", (uint8_t *)&v12, 0xCu);
    }
    char v3 = 1;
  }

  return v3;
}

- (NSArray)mediaAccessories
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self user];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 home];
    char v6 = v5;
    if (v5)
    {
      int v7 = [v5 appleMediaAccessories];
    }
    else
    {
      int v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because home is nil", (uint8_t *)&v17, 0xCu);
      }
      int v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because user is nil", (uint8_t *)&v17, 0xCu);
    }
    int v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (void)handleMediaAccessorySoftwareVersionUpdated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self delegate];
    if (v8)
    {
      v9 = [v7 softwareVersion];
      [v8 mediaAccessory:v7 didUpdateSoftwareToVersion:v9];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@delegate is nil", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received softwareVersion update notification with nil HMDAppleMediaAccessory", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)configure
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleMediaAccessorySoftwareVersionUpdated_ name:@"HMDAppleMediaAccessorySoftwareVersionUpdatedNotification" object:0];
}

- (HMDSiriMultiUserNewLanguageNotificationManagerContext)initWithUser:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)self init];
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
  if (logCategory__hmf_once_t17_167385 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_167385, &__block_literal_global_167386);
  }
  v2 = (void *)logCategory__hmf_once_v18_167387;
  return v2;
}

uint64_t __68__HMDSiriMultiUserNewLanguageNotificationManagerContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18_167387;
  logCategory__hmf_once_v18_167387 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)userReadableLanguageFromCode:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@languageCode: %@", (uint8_t *)&v30, 0x16u);
  }
  v9 = [MEMORY[0x1E4F1CA20] deviceLanguage];
  int v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = v6;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v13;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@preferredLocalization: %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
  v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = v11;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v18;
    __int16 v32 = 2112;
    id v33 = v14;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@appLocale: %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v4];
  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  id v21 = v16;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v23;
    __int16 v32 = 2112;
    id v33 = v19;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@shortCode: %@", (uint8_t *)&v30, 0x16u);
  }
  v24 = [v14 localizedStringForLanguage:v19 context:1];
  uint64_t v25 = (void *)MEMORY[0x1D9452090]();
  id v26 = v21;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v28;
    __int16 v32 = 2112;
    id v33 = v24;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@languageName: %@", (uint8_t *)&v30, 0x16u);
  }

  return v24;
}

@end