@interface HMDAccountRegistry
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (HMDAccountRegistry)sharedRegistry;
+ (id)logCategory;
- (BOOL)accountExistsForHandle:(id)a3;
- (BOOL)deviceExistsForDevice:(id)a3;
- (BOOL)started;
- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDRemoteAccountManager)remoteAccountManager;
- (NSArray)accounts;
- (OS_dispatch_queue)clientQueue;
- (id)accountForHandle:(id)a3;
- (id)accountForHandle:(id)a3 exists:(BOOL *)a4;
- (id)attributeDescriptions;
- (id)deviceForAddress:(id)a3;
- (id)deviceForDevice:(id)a3;
- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4;
- (id)deviceForHandle:(id)a3;
- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForIdentifier:(id)a3;
- (id)deviceForPushToken:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__handleAddedRemoteAccount:(id)a3;
- (void)__handleAppleAccountDeviceAdded:(id)a3;
- (void)__handleAppleAccountHandlesUpdated:(id)a3;
- (void)__handleAppleAccountUpdate:(id)a3;
- (void)__handleRemovedRemoteAccount:(id)a3;
- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)start;
- (void)stop;
@end

@implementation HMDAccountRegistry

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_41136 != -1) {
    dispatch_once(&logCategory__hmf_once_t26_41136, &__block_literal_global_34_41137);
  }
  v2 = (void *)logCategory__hmf_once_v27_41138;
  return v2;
}

uint64_t __33__HMDAccountRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27_41138;
  logCategory__hmf_once_v27_41138 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDAccountRegistry)sharedRegistry
{
  if (sharedRegistry__hmf_once_t0 != -1) {
    dispatch_once(&sharedRegistry__hmf_once_t0, &__block_literal_global_41143);
  }
  v2 = (void *)sharedRegistry__hmf_once_v1;
  return (HMDAccountRegistry *)v2;
}

void __36__HMDAccountRegistry_sharedRegistry__block_invoke()
{
  uint64_t v0 = [HMDAccountRegistry alloc];
  id v4 = +[HMDAppleAccountManager sharedManager];
  uint64_t v1 = +[HMDRemoteAccountManager sharedManager];
  uint64_t v2 = [(HMDAccountRegistry *)v0 initWithAppleAccountManager:v4 remoteAccountManager:v1];
  v3 = (void *)sharedRegistry__hmf_once_v1;
  sharedRegistry__hmf_once_uint64_t v1 = v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAccountManager);
  return (HMDRemoteAccountManager *)WeakRetained;
}

- (HMDAppleAccountManager)appleAccountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appleAccountManager);
  return (HMDAppleAccountManager *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(HMDAccountRegistry *)self accounts];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  if (v6)
  {
    v8 = [(HMDAccountRegistry *)self appleAccountManager];
    unint64_t v9 = [v8 account];

    v10 = [v9 handles];
    int v11 = [v10 containsObject:v6];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = HMFGetLogIdentifier();
        v16 = [v6 shortDescription];
        int v17 = 138543618;
        v18 = v15;
        __int16 v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not resolving handle, %@, on our account", (uint8_t *)&v17, 0x16u);
      }
      if (v7) {
        v7[2](v7, v9, 0);
      }
    }
    else
    {

      unint64_t v9 = [(HMDAccountRegistry *)self remoteAccountManager];
      [v9 _resolveAccountForHandle:v6 completionHandler:v7];
    }
  }
}

- (void)__handleRemovedRemoteAccount:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  if (v8)
  {
    v5 = [*(id *)(a1 + 40) appleAccountManager];
    id v6 = [v5 account];
    char v7 = [v8 isRelatedToAccount:v6];

    if ((v7 & 1) == 0) {
      __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v8);
    }
  }
}

- (void)__handleAddedRemoteAccount:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  if (v8)
  {
    v5 = [*(id *)(a1 + 40) appleAccountManager];
    id v6 = [v5 account];
    char v7 = [v8 isRelatedToAccount:v6];

    if ((v7 & 1) == 0) {
      __notifyDelegateAccountAdded(*(void **)(a1 + 40), v8);
    }
  }
}

- (void)__handleAppleAccountDeviceAdded:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [*(id *)(a1 + 40) appleAccountManager];
  id v6 = [v5 account];
  int v7 = [v4 isEqualToAccount:v6];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) userInfo];
    unint64_t v9 = [v8 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 40);
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        v16 = [v11 shortDescription];
        int v21 = 138543618;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that device was added to our account: %@", (uint8_t *)&v21, 0x16u);
      }
      int v17 = *(void **)(a1 + 40);
      v18 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v19 = [v11 handles];
      v20 = [v18 setWithArray:v19];
      __cleanupRemoteDevicesWithHandles(v17, v20);
    }
  }
}

- (void)__handleAppleAccountHandlesUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v7 = v3;

  id v4 = [*(id *)(a1 + 40) appleAccountManager];
  v5 = [v4 account];
  int v6 = [v7 isEqualToAccount:v5];

  if (v6) {
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v7);
  }
}

- (void)__handleAppleAccountUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"HMDPreviousAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v5)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 40);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification current account added", buf, 0xCu);
    }
    __registerForAccountUpdates(*(void **)(a1 + 40), v5);
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v5);
    v14 = [v5 devices];
    v15 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 2 * objc_msgSend(v14, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v20), "handles", (void)v26);
          [v15 addObjectsFromArray:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 40), v15);
    __notifyDelegateAccountAdded(*(void **)(a1 + 40), v5);
  }
  else if (v9)
  {
    v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = *(id *)(a1 + 40);
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Received notification current account removed", buf, 0xCu);
    }
    __registerForAccountUpdates(*(void **)(a1 + 40), 0);
    __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v9);
  }
}

- (id)deviceForIDSIdentifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self;
  uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    v24 = v5;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = [v10 devices];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          uint64_t v23 = v7;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v17 = [v16 idsIdentifier];
              if ([v17 isEqual:v4])
              {

LABEL_20:
                id v20 = v16;

                id v5 = v24;
                goto LABEL_21;
              }
              uint64_t v18 = [v16 sharedUserIDSIdentifier];
              char v19 = [v18 isEqual:v4];

              if (v19) {
                goto LABEL_20;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            uint64_t v7 = v23;
            id v5 = v24;
            uint64_t v8 = v22;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v20 = 0;
    }
    while (v7);
  }
  else
  {
    id v20 = 0;
  }
LABEL_21:

  return v20;
}

- (id)deviceForPushToken:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = self;
  uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    long long v26 = v5;
    uint64_t v23 = *(void *)v36;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
          uint64_t v25 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              id v16 = objc_msgSend(v15, "globalHandles", v23);
              uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v28;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v28 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    if ([*(id *)(*((void *)&v27 + 1) + 8 * j) matchesPushToken:v4])
                    {
                      id v21 = v15;

                      id v5 = v26;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v13 = v25;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
            id v5 = v26;
            uint64_t v7 = v23;
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v24);
      uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
      id v21 = 0;
    }
    while (v6);
  }
  else
  {
    id v21 = 0;
  }
LABEL_26:

  return v21;
}

- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __deviceForDevice(self, v6);
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = v7;
    }
    if (v8 && a4)
    {
      *a4 = 1;
      id v10 = (void *)v8;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)deviceForDevice:(id)a3
{
  return [(HMDAccountRegistry *)self deviceForDevice:a3 exists:0];
}

- (BOOL)deviceExistsForDevice:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = __deviceForDevice(self, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __deviceForHandle(self, v6);
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = 1;
      }
      id v10 = v8;
    }
    else
    {
      id v11 = [HMDDevice alloc];
      uint64_t v12 = [v7 identifier];
      v15[0] = v7;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      id v10 = [(HMDDevice *)v11 initWithIdentifier:v12 handles:v13 name:0 productInfo:0 version:0 capabilities:0];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)deviceForHandle:(id)a3
{
  return [(HMDAccountRegistry *)self deviceForHandle:a3 exists:0];
}

- (id)deviceForAddress:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 idsIdentifier];
    uint64_t v7 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v6];

    uint64_t v8 = __deviceForHandle(self, v7);
    if (v8)
    {
      id v9 = v8;
      id v10 = v9;
    }
    else
    {
      id v11 = [v5 idsDestination];
      uint64_t v12 = +[HMDDeviceHandle deviceHandleForDestination:v11];

      __deviceForHandle(self, v12);
      uint64_t v13 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
      id v9 = v13;
      if (v13)
      {
        uint64_t v14 = v13;
      }
      else
      {
        v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          int v20 = 138543618;
          id v21 = v18;
          __int16 v22 = 2112;
          uint64_t v23 = v5;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing HMDDevice for %@", (uint8_t *)&v20, 0x16u);
        }
        uint64_t v14 = [[HMDDevice alloc] initWithDeviceAddress:v5];
      }
      id v10 = v14;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)deviceForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self;
    uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "deviceForIdentifier:", v4, (void)v13);
          if (v10)
          {
            id v11 = (void *)v10;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)accountForHandle:(id)a3 exists:(BOOL *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __accountForHandle(self, v6);
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = 1;
      }
      uint64_t v10 = v8;
    }
    else
    {
      id v11 = [HMDAccount alloc];
      uint64_t v12 = +[HMDAccountIdentifier accountIdentifierForAccountHandle:v7];
      v15[0] = v7;
      long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      uint64_t v10 = [(HMDAccount *)v11 initWithIdentifier:v12 handles:v13 devices:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)accountForHandle:(id)a3
{
  return [(HMDAccountRegistry *)self accountForHandle:a3 exists:0];
}

- (BOOL)accountExistsForHandle:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = __accountForHandle(self, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)accounts
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(HMDAccountRegistry *)self appleAccountManager];
  id v5 = [v4 account];

  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(HMDAccountRegistry *)self remoteAccountManager];
  uint64_t v7 = [v6 accounts];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = (void *)[v3 copy];
  return (NSArray *)v8;
}

- (void)reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(HMDAccountRegistry *)v4 remoteAccountManager];
  [v7 reset];
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);
  }
  __registerForAccountUpdates(v4, 0);
  uint64_t v7 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 willChangeValueForKey:v7];

  os_unfair_lock_lock_with_options();
  v4->_started = 0;
  os_unfair_lock_unlock(&v4->_lock);
  int v8 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 didChangeValueForKey:v8];
}

- (void)start
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v20 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
  }
  uint64_t v7 = [(HMDAccountRegistry *)v4 appleAccountManager];
  int v8 = [v7 account];
  if (v8)
  {
    __registerForAccountUpdates(v4, v8);
    int v9 = [(HMDAccountRegistry *)v4 clientQueue];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __27__HMDAccountRegistry_start__block_invoke;
    long long v16 = &unk_1E6A197C8;
    uint64_t v17 = v4;
    id v18 = v8;
    dispatch_async(v9, &v13);
  }
  objc_msgSend(v7, "start", v13, v14, v15, v16, v17);
  uint64_t v10 = [(HMDAccountRegistry *)v4 remoteAccountManager];
  [v10 start];

  uint64_t v11 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 willChangeValueForKey:v11];

  os_unfair_lock_lock_with_options();
  v4->_started = 1;
  os_unfair_lock_unlock(&v4->_lock);
  uint64_t v12 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 didChangeValueForKey:v12];
}

void __27__HMDAccountRegistry_start__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 40) devices];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "handles", (void)v10);
        [v3 addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 32), v3);
}

- (BOOL)started
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDAccountRegistry *)self accounts];
  uint64_t v5 = (void *)[v3 initWithName:@"AC" value:v4];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDAccountRegistry;
  uint64_t v8 = [(HMDAccountRegistry *)&v19 init];
  int v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v10 = objc_claimAutoreleasedReturnValue();
    long long v11 = (const char *)[v10 UTF8String];
    long long v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_appleAccountManager, v6);
    objc_storeWeak((id *)&v9->_remoteAccountManager, v7);
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v9 selector:sel___handleAppleAccountUpdate_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v6];

    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel___handleAddedRemoteAccount_ name:@"HMDRemoteAccountManagerAddedAccountNotification" object:v7];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v9 selector:sel___handleRemovedRemoteAccount_ name:@"HMDRemoteAccountManagerRemovedAccountNotification" object:v7];
  }
  return v9;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_started);
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___HMDAccountRegistry;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

@end