@interface HMDIDSFirewallManagerContext
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDIDSFirewallManager)firewallManager;
- (HMDIDSFirewallManagerContext)initWithHomeManager:(id)a3 IDSFirewall:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6;
- (IDSFirewall)firewall;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (void)addFirewallEntries:(id)a3;
- (void)addFirewallEntries:(id)a3 completion:(id)a4;
- (void)configure;
- (void)handleHomeAddedNotification:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handleHomeUserAddedNotification:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)registerForHomeUserNotifications;
- (void)replaceFireWallEntries:(id)a3;
- (void)setFirewallManager:(id)a3;
@end

@implementation HMDIDSFirewallManagerContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firewallManager);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_firewall, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setFirewallManager:(id)a3
{
}

- (HMDIDSFirewallManager)firewallManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firewallManager);
  return (HMDIDSFirewallManager *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (IDSFirewall)firewall
{
  return (IDSFirewall *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)addFirewallEntries:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDIDSFirewallManagerContext *)self firewall];
  [v8 donateEntries:v7 withCompletion:v6];
}

- (void)addFirewallEntries:(id)a3
{
  id v4 = a3;
  v5 = [(HMDIDSFirewallManagerContext *)self firewall];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMDIDSFirewallManagerContext_addFirewallEntries___block_invoke;
  v7[3] = &unk_1E6A196E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 donateEntries:v6 withCompletion:v7];
}

void __51__HMDIDSFirewallManagerContext_addFirewallEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543875;
      v10 = v7;
      __int16 v11 = 2117;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to add firewall entries: %{sensitive}@ with error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)replaceFireWallEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDIDSFirewallManagerContext *)self firewall];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HMDIDSFirewallManagerContext_replaceFireWallEntries___block_invoke;
  v7[3] = &unk_1E6A196E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 replaceDonatedEntriesWithEntries:v6 withCompletion:v7];
}

void __55__HMDIDSFirewallManagerContext_replaceFireWallEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543875;
      v10 = v7;
      __int16 v11 = 2117;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to replace firewall entries: %{sensitive}@ with error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDIDSFirewallManagerContext *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HMDIDSFirewallManagerContext_handleHomeUserRemovedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDIDSFirewallManagerContext_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v11 = 138543619;
    uint64_t v12 = v9;
    __int16 v13 = 2117;
    id v14 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %{sensitive}@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [*(id *)(a1 + 40) firewallManager];
  [v10 handleDidRemoveUser];
}

- (void)handleHomeUserAddedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDIDSFirewallManagerContext *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDIDSFirewallManagerContext_handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDIDSFirewallManagerContext_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling added user: %@", (uint8_t *)&v16, 0x16u);
  }
  v10 = [v5 userID];
  if (v10)
  {
    int v11 = [*(id *)(a1 + 40) firewallManager];
    [v11 handleDidAddUserWithUserID:v10];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543619;
      v17 = v15;
      __int16 v18 = 2117;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@User does not have userID. User: %{sensitive}@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDIDSFirewallManagerContext *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDIDSFirewallManagerContext_handleHomeRemovedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDIDSFirewallManagerContext_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification home removed: %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [*(id *)(a1 + 40) firewallManager];
  [v10 handleDidRemoveHome];
}

- (void)handleHomeAddedNotification:(id)a3
{
  id v4 = [(HMDIDSFirewallManagerContext *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDIDSFirewallManagerContext_handleHomeAddedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __60__HMDIDSFirewallManagerContext_handleHomeAddedNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) firewallManager];
  [v1 handleDidAddHome];
}

- (void)registerForHomeUserNotifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDIDSFirewallManagerContext *)self homeManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 homes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HMDIDSFirewallManagerContext_registerForHomeUserNotifications__block_invoke;
    v10[3] = &unk_1E6A11A70;
    v10[4] = self;
    objc_msgSend(v5, "na_each:", v10);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempted to register for home user notifications for HMDIDSFirewallManagerContext with nil homeManager", buf, 0xCu);
    }
  }
}

void __64__HMDIDSFirewallManagerContext_registerForHomeUserNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 notificationCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel_handleHomeUserAddedNotification_ name:@"HMDHomeUserAddedNotification" object:v4];

  id v6 = [*(id *)(a1 + 32) notificationCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v4];
}

- (void)configure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDIDSFirewallManagerContext *)self homeManager];
  if (v3)
  {
    id v4 = [(HMDIDSFirewallManagerContext *)self notificationCenter];
    [v4 addObserver:self selector:sel_handleHomeAddedNotification_ name:@"HMDHomeAddedNotification" object:v3];

    id v5 = [(HMDIDSFirewallManagerContext *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:v3];

    [(HMDIDSFirewallManagerContext *)self registerForHomeUserNotifications];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempted to configure HMDIDSFirewallManagerContext with nil homeManager", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (HMDIDSFirewallManagerContext)initWithHomeManager:(id)a3 IDSFirewall:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDIDSFirewallManagerContext;
  id v14 = [(HMDIDSFirewallManagerContext *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_homeManager, v10);
    objc_storeStrong((id *)&v15->_firewall, a4);
    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_69814 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_69814, &__block_literal_global_69815);
  }
  v2 = (void *)logCategory__hmf_once_v12_69816;
  return v2;
}

uint64_t __43__HMDIDSFirewallManagerContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12_69816;
  logCategory__hmf_once_v12_69816 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end