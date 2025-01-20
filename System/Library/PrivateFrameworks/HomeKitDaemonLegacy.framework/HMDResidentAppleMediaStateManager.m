@interface HMDResidentAppleMediaStateManager
- (BOOL)hasRegistrationsForMediaProfileIdentifier:(uint64_t)a1;
- (HMDResidentAppleMediaStateManager)initWithDataSource:(id)a3 delegate:(id)a4;
- (void)configureWithNotificationRegistry:(id)a3 notificationCenter:(id)a4;
- (void)handleAppleMediaAccessoryReachabilityChanged:(id)a3;
- (void)mediaPropertyRegistrationsDidChangeForMediaProfiles:(id)a3;
- (void)refreshStateForMediaProfile:(void *)a1;
- (void)startRetryTimer;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentAppleMediaStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_mediaProfilesToRetry, 0);
  objc_storeStrong((id *)&self->_subscribedMediaProfiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)mediaPropertyRegistrationsDidChangeForMediaProfiles:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  v4 = (void *)MEMORY[0x1D9452090]();
  v96 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v87;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that media profile registrations did change: %@", buf, 0x16u);
  }
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke;
  v106[3] = &unk_1E6A196B8;
  v106[4] = v96;
  v8 = objc_msgSend(v87, "na_filter:", v106);
  v9 = [v7 setWithArray:v8];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke_2;
  v105[3] = &unk_1E6A196B8;
  v105[4] = v96;
  v11 = objc_msgSend(v87, "na_filter:", v105);
  v88 = [v10 setWithArray:v11];

  if (v96) {
    id WeakRetained = objc_loadWeakRetained((id *)&v96->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = v9;
  uint64_t v93 = [obj countByEnumeratingWithState:&v101 objects:v108 count:16];
  if (v93)
  {
    uint64_t v91 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v93; ++i)
      {
        if (*(void *)v102 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        v14 = [WeakRetained mediaProfileForUniqueIdentifier:v13];
        v15 = v14;
        if (v14)
        {
          id v16 = v14;
          if (v96)
          {
            v17 = (void *)MEMORY[0x1D9452090]();
            v18 = v96;
            v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = HMFGetLogIdentifier();
              v21 = [v16 uniqueIdentifier];
              *(_DWORD *)v113 = 138543618;
              id v114 = v20;
              __int16 v115 = 2112;
              v116 = v21;
              _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Subscribing to updates for media profile identifier: %@", v113, 0x16u);
            }
            p_lock = &v18->_lock;
            os_unfair_lock_lock_with_options();
            id v24 = objc_getProperty(v18, v23, 32, 1);
            v25 = [v16 uniqueIdentifier];
            int v26 = [v24 containsObject:v25];

            if (v26)
            {
              v28 = (void *)MEMORY[0x1D9452090]();
              v29 = v18;
              HMFGetOSLogHandle();
              v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v31 = (id)objc_claimAutoreleasedReturnValue();
                v32 = [v16 uniqueIdentifier];
                *(_DWORD *)v113 = 138543618;
                id v114 = v31;
                __int16 v115 = 2112;
                v116 = v32;
                _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Already registered for updates for media profile identifier: %@", v113, 0x16u);
              }
              os_unfair_lock_unlock(p_lock);
            }
            else
            {
              id v37 = objc_getProperty(v18, v27, 32, 1);
              v38 = [v16 uniqueIdentifier];
              [v37 addObject:v38];

              os_unfair_lock_unlock(&v18->_lock);
              v39 = [v16 accessory];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v40 = v39;
              }
              else {
                v40 = 0;
              }
              id v41 = v40;

              if ([v41 isCurrentAccessory])
              {
                v42 = (void *)MEMORY[0x1D9452090]();
                v43 = v18;
                v44 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  v45 = HMFGetLogIdentifier();
                  *(_DWORD *)v113 = 138543362;
                  id v114 = v45;
                  _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Subscribed for updates for media profile identifier on current device", v113, 0xCu);
                }
              }
              else
              {
                objc_initWeak((id *)v113, v18);
                id v46 = objc_loadWeakRetained((id *)&v18->_delegate);
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __71__HMDResidentAppleMediaStateManager_subscribeToUpdatesForMediaProfile___block_invoke;
                v110 = (id *)&unk_1E6A17758;
                objc_copyWeak(&v112, (id *)v113);
                id v47 = v16;
                id v111 = v47;
                [v46 enableMediaNotifications:1 directlyOnMediaAccessory:v41 forStateManager:v18 completion:buf];

                -[HMDResidentAppleMediaStateManager refreshStateForMediaProfile:](v18, v47);
                objc_destroyWeak(&v112);
                objc_destroyWeak((id *)v113);
              }
            }
          }
        }
        else
        {
          v33 = (void *)MEMORY[0x1D9452090]();
          v34 = v96;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find media profile with uniqueIdentifier: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v93 = [obj countByEnumeratingWithState:&v101 objects:v108 count:16];
    }
    while (v93);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  location = v88;
  uint64_t v94 = [location countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (v94)
  {
    uint64_t v92 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v94; ++j)
      {
        if (*(void *)v98 != v92) {
          objc_enumerationMutation(location);
        }
        uint64_t v49 = *(void *)(*((void *)&v97 + 1) + 8 * j);
        v50 = [WeakRetained mediaProfileForUniqueIdentifier:v49];
        v51 = v50;
        if (v50)
        {
          id v52 = v50;
          if (v96)
          {
            v53 = (void *)MEMORY[0x1D9452090]();
            v54 = v96;
            v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = HMFGetLogIdentifier();
              v57 = [v52 uniqueIdentifier];
              *(_DWORD *)v113 = 138543618;
              id v114 = v56;
              __int16 v115 = 2112;
              v116 = v57;
              _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to updates for media profile identifier: %@", v113, 0x16u);
            }
            v58 = &v54->_lock;
            os_unfair_lock_lock_with_options();
            id v60 = objc_getProperty(v54, v59, 32, 1);
            v61 = [v52 uniqueIdentifier];
            char v62 = [v60 containsObject:v61];

            if (v62)
            {
              id v64 = objc_getProperty(v54, v63, 32, 1);
              v65 = [v52 uniqueIdentifier];
              [v64 removeObject:v65];

              os_unfair_lock_unlock(&v54->_lock);
              v66 = [v52 accessory];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v67 = v66;
              }
              else {
                v67 = 0;
              }
              id v68 = v67;

              if ([v68 isCurrentAccessory])
              {
                v69 = (void *)MEMORY[0x1D9452090]();
                v70 = v54;
                v71 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  v72 = HMFGetLogIdentifier();
                  *(_DWORD *)v113 = 138543362;
                  id v114 = v72;
                  _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed for updates for media profile identifier on current device", v113, 0xCu);
                }
              }
              else
              {
                objc_initWeak((id *)v113, v54);
                id v82 = objc_loadWeakRetained((id *)&v54->_delegate);
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __73__HMDResidentAppleMediaStateManager_unsubscribeToUpdatesForMediaProfile___block_invoke;
                v110 = (id *)&unk_1E6A17758;
                objc_copyWeak(&v112, (id *)v113);
                id v111 = v52;
                [v82 enableMediaNotifications:0 directlyOnMediaAccessory:v68 forStateManager:v54 completion:buf];

                objc_destroyWeak(&v112);
                objc_destroyWeak((id *)v113);
              }
            }
            else
            {
              v77 = (void *)MEMORY[0x1D9452090]();
              v78 = v54;
              HMFGetOSLogHandle();
              v79 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v80 = (id)objc_claimAutoreleasedReturnValue();
                v81 = [v52 uniqueIdentifier];
                *(_DWORD *)v113 = 138543618;
                id v114 = v80;
                __int16 v115 = 2112;
                v116 = v81;
                _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_INFO, "%{public}@Already unsubscribed for updates for media profile identifier: %@", v113, 0x16u);
              }
              os_unfair_lock_unlock(v58);
            }
          }
        }
        else
        {
          v73 = (void *)MEMORY[0x1D9452090]();
          v74 = v96;
          v75 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v76 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v76;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v49;
            _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_ERROR, "%{public}@Could not find media profile with uniqueIdentifier: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v94 = [location countByEnumeratingWithState:&v97 objects:v107 count:16];
    }
    while (v94);
  }

  v83 = (void *)MEMORY[0x1D9452090]();
  v84 = v96;
  v85 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    v86 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v86;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = obj;
    *(_WORD *)&buf[22] = 2112;
    v110 = location;
    _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_INFO, "%{public}@Added %@ media profiles and removed: %@ media profiles from media state management", buf, 0x20u);
  }
}

BOOL __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  return -[HMDResidentAppleMediaStateManager hasRegistrationsForMediaProfileIdentifier:](*(void *)(a1 + 32), a2);
}

BOOL __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  return !-[HMDResidentAppleMediaStateManager hasRegistrationsForMediaProfileIdentifier:](*(void *)(a1 + 32), a2);
}

void __73__HMDResidentAppleMediaStateManager_unsubscribeToUpdatesForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = (os_unfair_lock_s *)WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    v10 = HMFBooleanToString();
    int v17 = 138544130;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed for updates for media profile identifier: %@ with success: %@ - %@", (uint8_t *)&v17, 0x2Au);
  }
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    if (v3)
    {
      id v12 = objc_getProperty(v6, v11, 32, 1);
      uint64_t v13 = [*(id *)(a1 + 32) uniqueIdentifier];
      [v12 addObject:v13];

      id v15 = objc_getProperty(v6, v14, 40, 1);
      id v16 = [*(id *)(a1 + 32) uniqueIdentifier];
      [v15 addObject:v16];

      os_unfair_lock_unlock(v6 + 2);
      -[HMDResidentAppleMediaStateManager startRetryTimer](v6);
    }
    else
    {
      *(void *)&v6[14]._os_unfair_lock_opaque = 0;
      os_unfair_lock_unlock(v6 + 2);
    }
  }
}

- (void)startRetryTimer
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 2;
  uint64_t v3 = os_unfair_lock_lock_with_options();
  if (*(void *)&a1[12]._os_unfair_lock_opaque)
  {
    v4 = (void *)MEMORY[0x1D9452090](v3);
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v21 = 138543362;
      id v22 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Not starting media state manager retry timer because one is already running", (uint8_t *)&v21, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v8 = *(void *)&a1[14]._os_unfair_lock_opaque;
  if (v8 > 8)
  {
    v4 = (void *)MEMORY[0x1D9452090](v3);
    __int16 v19 = a1;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      id v22 = v20;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Not starting media state manager retry timer due to too many failed retries", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_10;
  }
  unint64_t v9 = v8 + 1;
  *(void *)&a1[14]._os_unfair_lock_opaque = v9;
  unint64_t v10 = HMDResidentAppleMediaStateManagerRetryIntervals[v9];
  v11 = (void *)MEMORY[0x1D9452090](v3);
  id v12 = a1;
  HMFGetOSLogHandle();
  uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [NSNumber numberWithUnsignedInteger:v10];
    int v21 = 138543618;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting media state manager retry timer with fire interval: %@", (uint8_t *)&v21, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained(v12 + 2);
  uint64_t v17 = [WeakRetained timerWithTimerInterval:(double)v10];
  id v18 = v12[6];
  v12[6] = (id)v17;

  [v12[6] setDelegate:v12];
  [v12[6] resume];
LABEL_11:
  os_unfair_lock_unlock(v2);
}

void __71__HMDResidentAppleMediaStateManager_subscribeToUpdatesForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = (os_unfair_lock_s *)WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = HMFGetLogIdentifier();
    unint64_t v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    unint64_t v10 = HMFBooleanToString();
    int v17 = 138544130;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Subscribed for updates for media profile identifier: %@ with success: %@ - %@", (uint8_t *)&v17, 0x2Au);
  }
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    if (v3)
    {
      id v12 = objc_getProperty(v6, v11, 32, 1);
      uint64_t v13 = [*(id *)(a1 + 32) uniqueIdentifier];
      [v12 removeObject:v13];

      id v15 = objc_getProperty(v6, v14, 40, 1);
      id v16 = [*(id *)(a1 + 32) uniqueIdentifier];
      [v15 addObject:v16];

      os_unfair_lock_unlock(v6 + 2);
      -[HMDResidentAppleMediaStateManager startRetryTimer](v6);
    }
    else
    {
      *(void *)&v6[14]._os_unfair_lock_opaque = 0;
      os_unfair_lock_unlock(v6 + 2);
    }
  }
}

- (void)refreshStateForMediaProfile:(void *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    v5 = a1;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      unint64_t v8 = [v3 uniqueIdentifier];
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v7;
      __int16 v22 = 2112;
      __int16 v23 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Refreshing state for media profile with unique identifier: %@", buf, 0x16u);
    }
    unint64_t v9 = [v3 accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = 0;
    }
    id v11 = v10;

    id v12 = [v11 device];
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained(v5 + 3);
      id v19 = v3;
      SEL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [WeakRetained readProfileState:v14 viaDevice:v12 forStateManager:v5];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v5;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v21 = v18;
        __int16 v22 = 2112;
        __int16 v23 = 0;
        __int16 v24 = 2112;
        id v25 = v11;
        __int16 v26 = 2112;
        id v27 = v3;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to refresh state either device: %@ for accessory: %@, mediaProfile: %@ is nil", buf, 0x2Au);
      }
    }
  }
}

- (BOOL)hasRegistrationsForMediaProfileIdentifier:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = (id *)(a1 + 16);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained propertiesRegisteredForMediaProfileUniqueIdentifier:v3];

  BOOL v6 = [v5 count] != 0;
  return v6;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (HMFTimer *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_retryTimer == v4)
  {
    self->_retryTimer = 0;

    v5 = [(NSMutableSet *)self->_mediaProfilesToRetry allObjects];
    [(NSMutableSet *)self->_mediaProfilesToRetry removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    unint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Retrying media subscription for profiles: %@", (uint8_t *)&v10, 0x16u);
    }
    [(HMDResidentAppleMediaStateManager *)v7 mediaPropertyRegistrationsDidChangeForMediaProfiles:v5];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)handleAppleMediaAccessoryReachabilityChanged:(id)a3
{
  id v14 = a3;
  v4 = [v14 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unint64_t v8 = [v7 mediaProfile];
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      id v10 = self ? objc_getProperty(self, v9, 32, 1) : 0;
      id v11 = v10;
      __int16 v12 = [v8 uniqueIdentifier];
      char v13 = [v11 containsObject:v12];

      os_unfair_lock_unlock(&self->_lock);
      if (v13) {
        -[HMDResidentAppleMediaStateManager refreshStateForMediaProfile:](self, v8);
      }
    }
  }
}

- (void)configureWithNotificationRegistry:(id)a3 notificationCenter:(id)a4
{
  id v6 = a4;
  [a3 addDelegate:self];
  [v6 addObserver:self selector:sel_handleAppleMediaAccessoryReachabilityChanged_ name:@"HMDAppleMediaAccessoryDeviceIsReachableNotification" object:0];
}

- (HMDResidentAppleMediaStateManager)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentAppleMediaStateManager;
  unint64_t v8 = [(HMDResidentAppleMediaStateManager *)&v15 init];
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    subscribedMediaProfiles = v9->_subscribedMediaProfiles;
    v9->_subscribedMediaProfiles = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    mediaProfilesToRetry = v9->_mediaProfilesToRetry;
    v9->_mediaProfilesToRetry = (NSMutableSet *)v12;

    v9->_retryCount = 0;
  }

  return v9;
}

@end