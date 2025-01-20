@interface HMDSiriMultiUserNewLanguageNotificationManager
+ (id)logCategory;
- (HMDSiriMultiUserNewLanguageNotificationManager)initWithContext:(id)a3;
- (HMDSiriMultiUserNewLanguageNotificationManagerContext)context;
- (void)_postNotificationIfNecessaryForMediaAccessory:(id)a3;
- (void)checkAllMediaAccessoriesAndPostNotificationIfNecessary;
- (void)mediaAccessory:(id)a3 didUpdateSoftwareToVersion:(id)a4;
@end

@implementation HMDSiriMultiUserNewLanguageNotificationManager

- (void).cxx_destruct
{
}

- (HMDSiriMultiUserNewLanguageNotificationManagerContext)context
{
  return (HMDSiriMultiUserNewLanguageNotificationManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)_postNotificationIfNecessaryForMediaAccessory:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if ([v4 isHomePod])
  {
    v7 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
    int v8 = [v7 hasCurrentUserSeenNotification];

    if (v8)
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v12;
        v13 = "%{public}@Not posting RMV new language notification because current user has already seen the notification";
LABEL_8:
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, v13, buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v14 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
    int v15 = [v14 isRMVEnabledForCurrentUser];

    if (v15)
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v12;
        v13 = "%{public}@Not posting RMV new language notification because RMV is already enabled for the current user";
        goto LABEL_8;
      }
LABEL_9:

      goto LABEL_36;
    }
    v16 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
    v17 = [v16 currentDeviceSiriLanguage];

    v18 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
    v19 = [v18 siriLanguageForMediaAccessory:v4];

    v20 = [v4 softwareVersion];
    v21 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
    v22 = [v21 siriLanguagesRequiringNotificationForVersion:v20];

    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    v26 = v25;
    if (v17 && v19)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v27;
        __int16 v62 = 2112;
        v63 = v17;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Current device siri language: %@", buf, 0x16u);
      }
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v24;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v31;
        __int16 v62 = 2112;
        v63 = v19;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Media accessory siri language: %@", buf, 0x16u);
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = v29;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        v36 = [v20 shortVersionString];
        *(_DWORD *)buf = 138543618;
        v61 = v35;
        __int16 v62 = 2112;
        v63 = v36;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Media accessory software version: %@", buf, 0x16u);
      }
      char v37 = [v19 isEqualToString:v17];
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = v33;
      v26 = HMFGetOSLogHandle();
      BOOL v38 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v37)
      {
        if (v38)
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v61 = v39;
          __int16 v62 = 2112;
          v63 = v22;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Siri languages requiring notification: %@", buf, 0x16u);
        }
        if ([v22 containsObject:v19])
        {
          v40 = [(HMDSiriMultiUserNewLanguageNotificationManager *)v24 context];
          v41 = [v40 mediaAccessories];
          v42 = objc_msgSend(v41, "na_filter:", &__block_literal_global_117);
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke_2;
          v58[3] = &unk_1E6A18D10;
          id v59 = v20;
          char v43 = objc_msgSend(v42, "na_all:", v58);

          v44 = (void *)MEMORY[0x1D9452090]();
          v45 = v24;
          v46 = HMFGetOSLogHandle();
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
          if (v43)
          {
            if (v47)
            {
              v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v61 = v48;
              __int16 v62 = 2112;
              v63 = v19;
              _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Posting notification for language: %@", buf, 0x16u);
            }
            v49 = [(HMDSiriMultiUserNewLanguageNotificationManager *)v45 context];
            [v49 showNotificationForNewlySupportedLanguage:v19];

            v50 = [(HMDSiriMultiUserNewLanguageNotificationManager *)v45 context];
            [v50 setCurrentUserHasSeenNotification];

            v51 = [(HMDSiriMultiUserNewLanguageNotificationManager *)v45 context];
            [v51 submitLogEventForShownNotificationWithLanguage:v19];
          }
          else
          {
            if (v47)
            {
              v57 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v61 = v57;
              _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Not posting RMV new language notification because at least one homepod is on a lower software version", buf, 0xCu);
            }
          }

          goto LABEL_35;
        }
        v23 = (void *)MEMORY[0x1D9452090]();
        v24 = v24;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v52 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v61 = v52;
          v53 = "%{public}@Not posting RMV new language notification because media accessory siri language is not in the "
                "set of siri languages requiring notification";
          goto LABEL_32;
        }
      }
      else if (v38)
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v52;
        v53 = "%{public}@Not posting RMV new language notification media accessory language does not match current device siri language";
LABEL_32:
        v54 = v26;
        os_log_type_t v55 = OS_LOG_TYPE_INFO;
        uint32_t v56 = 12;
        goto LABEL_33;
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v61 = v52;
      __int16 v62 = 2112;
      v63 = v17;
      __int16 v64 = 2112;
      v65 = v19;
      v53 = "%{public}@Encountered unexpected missing value. currentDeviceSiriLanguage: %@, mediaAccessorySiriLanguage: %@";
      v54 = v26;
      os_log_type_t v55 = OS_LOG_TYPE_ERROR;
      uint32_t v56 = 32;
LABEL_33:
      _os_log_impl(&dword_1D49D5000, v54, v55, v53, buf, v56);
    }
LABEL_35:
  }
LABEL_36:
}

uint64_t __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 softwareVersion];
  uint64_t v4 = [v3 isAtLeastVersion:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHomePod];
}

- (void)mediaAccessory:(id)a3 didUpdateSoftwareToVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
  v9 = [v8 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDSiriMultiUserNewLanguageNotificationManager_mediaAccessory_didUpdateSoftwareToVersion___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __92__HMDSiriMultiUserNewLanguageNotificationManager_mediaAccessory_didUpdateSoftwareToVersion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Media accessory: %@, did update to software version: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _postNotificationIfNecessaryForMediaAccessory:*(void *)(a1 + 40)];
}

- (void)checkAllMediaAccessoriesAndPostNotificationIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSiriMultiUserNewLanguageNotificationManager *)self context];
  uint64_t v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking all media accessories for RMV new language notification", buf, 0xCu);
  }
  int v9 = [(HMDSiriMultiUserNewLanguageNotificationManager *)v6 context];
  id v10 = [v9 mediaAccessories];

  if (objc_msgSend(v10, "hmf_isEmpty"))
  {
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v6;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@No media accessories in home", buf, 0xCu);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__HMDSiriMultiUserNewLanguageNotificationManager_checkAllMediaAccessoriesAndPostNotificationIfNecessary__block_invoke;
    v15[3] = &unk_1E6A153B0;
    v15[4] = v6;
    objc_msgSend(v10, "na_each:", v15);
  }
}

uint64_t __104__HMDSiriMultiUserNewLanguageNotificationManager_checkAllMediaAccessoriesAndPostNotificationIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _postNotificationIfNecessaryForMediaAccessory:a2];
}

- (HMDSiriMultiUserNewLanguageNotificationManager)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriMultiUserNewLanguageNotificationManager;
  uint64_t v6 = [(HMDSiriMultiUserNewLanguageNotificationManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)v7->_context setDelegate:v7];
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_167432 != -1) {
    dispatch_once(&logCategory__hmf_once_t33_167432, &__block_literal_global_119_167433);
  }
  v2 = (void *)logCategory__hmf_once_v34_167434;
  return v2;
}

uint64_t __61__HMDSiriMultiUserNewLanguageNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v34_167434;
  logCategory__hmf_once_v34_167434 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end