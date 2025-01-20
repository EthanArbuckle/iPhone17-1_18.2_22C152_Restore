@interface HMDIDSActivityMonitorHomeManagerDataSource
+ (id)logCategory;
- (BOOL)homeHasCamera:(id)a3;
- (HMDHomeManager)homeManager;
- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate;
- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3;
- (id)currentDevice;
- (void)handleDeviceAdded:(id)a3;
- (void)handleDeviceRemoved:(id)a3;
- (void)handleRegistrationUpdated:(id)a3;
- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startObservingDevice:(id)a3 subActivity:(id)a4;
- (void)startWithNotificationCenter:(id)a3;
- (void)stopObservingDevice:(id)a3 subActivity:(id)a4;
@end

@implementation HMDIDSActivityMonitorHomeManagerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate *)WeakRetained;
}

- (void)handleRegistrationUpdated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registration information changed, calling delegate", (uint8_t *)&v10, 0xCu);
  }
  v9 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v6 delegate];
  [v9 dataSourceDidUpdate:v6];
}

- (void)handleDeviceRemoved:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    v13 = [v8 name];
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ was removed from account, reregistering IDS Activity and notifying delegate", buf, 0x16u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v10 homeManager];
  v15 = [v14 homes];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v22 + 1) + 8 * v19) currentUser];
        v21 = [v8 identifier];
        [v20 deregisterIDSActivityObserver:v21];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
}

- (void)handleDeviceAdded:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Device was added/updated on account, notifying delegate", buf, 0xCu);
  }
  v9 = [v4 userInfo];
  int v10 = [v9 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v6 currentDevice];
  if (v13)
  {
    if (HMFEqualObjects())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v14 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v6 homeManager];
      v15 = [v14 homes];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [*(id *)(*((void *)&v26 + 1) + 8 * i) currentUser];
            [v20 updateIDSActivityObserver:v12];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v17);
      }

      v21 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v6 delegate];
      [v21 dataSourceDidUpdate:v6];
    }
  }
  else
  {
    long long v22 = (void *)MEMORY[0x1D9452090]();
    long long v23 = v6;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to update IDS activity observer, currentDevice unavailable", buf, 0xCu);
    }
  }
}

- (void)stopObservingDevice:(id)a3 subActivity:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    id v12 = [v6 name];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v12;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering for IDS Activity on %@ for subActivity %@", buf, 0x20u);
  }
  v13 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v9 currentDevice];
  if (v13)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v9 homeManager];
    v15 = [v14 homes];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) currentUser];
          [v20 deregisterIDSActivityObserver:v13 subActivity:v7 subjectDevice:v6];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v9;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deregister for IDS Activity, currentDevice unavailable", buf, 0xCu);
    }
  }
}

- (void)startObservingDevice:(id)a3 subActivity:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    id v12 = [v6 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v12;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for IDS Activity on %@ for subActivity %@", buf, 0x20u);
  }
  v13 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v9 currentDevice];
  if (v13)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v9 homeManager];
    v15 = [v14 homes];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) currentUser];
          [v20 registerIDSActivityObserver:v13 subActivity:v7 subjectDevice:v6];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v9;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to registering for IDS Activity, currentDevice unavailable", buf, 0xCu);
    }
  }
}

- (BOOL)homeHasCamera:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [a3 accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v9 = [v8 accessoryProfiles];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(id *)(*((void *)&v19 + 1) + 8 * j);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0 && v14)
              {

                BOOL v16 = 1;
                goto LABEL_20;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v16 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v57 = a5;
  uint64_t v12 = (void (**)(id, void))a6;
  v13 = [(HMDIDSActivityMonitorHomeManagerDataSource *)self currentDevice];
  id v63 = v10;
  if (!v13)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v78 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch tokens, currentDevice unavailable", buf, 0xCu);

      v13 = 0;
    }

    v12[2](v12, MEMORY[0x1E4F1CBF0]);
    id v10 = v63;
  }
  v56 = (void (**)(void, void))v12;
  uint64_t v18 = (void *)MEMORY[0x1D9452090]();
  long long v19 = self;
  long long v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    long long v21 = HMFGetLogIdentifier();
    long long v22 = [v10 name];
    *(_DWORD *)buf = 138543874;
    v78 = v21;
    __int16 v79 = 2112;
    v80 = v22;
    __int16 v81 = 2112;
    id v82 = v11;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching tokens for observers of %@ on subActivity %@", buf, 0x20u);

    id v10 = v63;
  }

  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v24 = [(HMDIDSActivityMonitorHomeManagerDataSource *)v19 homeManager];
  long long v25 = [v24 homes];

  long long v26 = (void *)v23;
  obuint64_t j = v25;
  uint64_t v61 = [v25 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v72;
    v64 = v19;
    id v65 = v11;
    v58 = v13;
    v66 = (void *)v23;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(obj);
        }
        long long v28 = *(void **)(*((void *)&v71 + 1) + 8 * v27);
        uint64_t v29 = [v28 residentEnabledDevices];
        char v30 = [v29 containsObject:v13];

        uint64_t v62 = v27;
        if (v30)
        {
          long long v26 = v66;
          if (([v28 isResidentFirstAccessoryCommunicationEnabled] & 1) != 0
            || [(HMDIDSActivityMonitorHomeManagerDataSource *)v19 homeHasCamera:v28])
          {
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            uint64_t v31 = [v28 users];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v75 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v68;
              do
              {
                for (uint64_t i = 0; i != v33; ++i)
                {
                  if (*(void *)v68 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v36 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                  if (([v28 isResidentFirstAccessoryCommunicationEnabled] & 1) != 0
                    || ([v36 isRemoteAccessAllowed] & 1) != 0)
                  {
                    v37 = [v36 pushTokensForDevicesObservingSubjectDevice:v10 subActivity:v11];
                    [v26 addObjectsFromArray:v37];
                  }
                  else
                  {
                    v38 = (void *)MEMORY[0x1D9452090]();
                    v39 = v64;
                    v40 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      v41 = HMFGetLogIdentifier();
                      v42 = [v36 displayName];
                      *(_DWORD *)buf = 138543618;
                      v78 = v41;
                      __int16 v79 = 2112;
                      v80 = v42;
                      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@User %@ does not have remote access, filtering out", buf, 0x16u);
                    }
                    id v10 = v63;
                    id v11 = v65;
                    long long v26 = v66;
                  }
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v67 objects:v75 count:16];
              }
              while (v33);
            }

            v13 = v58;
            long long v19 = v64;
          }
          else
          {
            v49 = (void *)MEMORY[0x1D9452090]();
            v50 = v19;
            v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              v52 = HMFGetLogIdentifier();
              v53 = [v28 name];
              *(_DWORD *)buf = 138543618;
              v78 = v52;
              __int16 v79 = 2112;
              v80 = v53;
              _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Home %@ did not contain a camera capable of recording, filtering out", buf, 0x16u);

              id v10 = v63;
            }

            long long v26 = v66;
          }
        }
        else
        {
          v43 = (void *)MEMORY[0x1D9452090]();
          v44 = v19;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = HMFGetLogIdentifier();
            v47 = [v13 shortDescription];
            v48 = [v28 name];
            *(_DWORD *)buf = 138543874;
            v78 = v46;
            __int16 v79 = 2112;
            v80 = v47;
            __int16 v81 = 2112;
            id v82 = v48;
            _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Current device %@ is not a resident in home %@, filtering out", buf, 0x20u);

            id v10 = v63;
          }

          id v11 = v65;
          long long v26 = v66;
        }
        uint64_t v27 = v62 + 1;
      }
      while (v62 + 1 != v61);
      uint64_t v54 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      uint64_t v61 = v54;
    }
    while (v54);
  }

  v55 = (void *)[v26 copy];
  ((void (**)(void, void *))v56)[2](v56, v55);
}

- (id)currentDevice
{
  v2 = +[HMDAppleAccountManager sharedManager];
  v3 = [v2 account];
  uint64_t v4 = [v3 currentDevice];

  return v4;
}

- (void)startWithNotificationCenter:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[HMDAppleAccountManager sharedManager];
  uint64_t v6 = [v5 account];

  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting to monitor devices for account %@", (uint8_t *)&v11, 0x16u);
  }
  [v4 addObserver:v8 selector:sel_handleDeviceAdded_ name:@"HMDAccountAddedDeviceNotification" object:v6];
  [v4 addObserver:v8 selector:sel_handleDeviceAdded_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v6];
  [v4 addObserver:v8 selector:sel_handleDeviceRemoved_ name:@"HMDAccountRemovedDeviceNotification" object:v6];
  [v4 addObserver:v8 selector:sel_handleRegistrationUpdated_ name:@"HMDUserDidUpdateIDSActivityRegistration" object:0];
  [v4 addObserver:v8 selector:sel_handleRegistrationUpdated_ name:@"HMDUserRemoteAccessDidChangeNotification" object:0];
  [v4 addObserver:v8 selector:sel_handleRegistrationUpdated_ name:@"HMDNotificationHomeAddedAccessory" object:0];
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [(HMDIDSActivityMonitorHomeManagerDataSource *)self startWithNotificationCenter:v3];
}

- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDIDSActivityMonitorHomeManagerDataSource;
    id v7 = [(HMDIDSActivityMonitorHomeManagerDataSource *)&v12 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_homeManager, a3);
    }

    return v8;
  }
  else
  {
    id v10 = (void *)_HMFPreconditionFailure();
    return (HMDIDSActivityMonitorHomeManagerDataSource *)+[HMDIDSActivityMonitorHomeManagerDataSource logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_163362 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_163362, &__block_literal_global_163363);
  }
  v2 = (void *)logCategory__hmf_once_v18_163364;
  return v2;
}

uint64_t __57__HMDIDSActivityMonitorHomeManagerDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18_163364;
  logCategory__hmf_once_v18_163364 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end