@interface HMDIDSFirewallManager
+ (id)firewallEntriesForUserIDs:(id)a3;
+ (id)logCategory;
- (HMDIDSFirewallManager)initWithContext:(id)a3;
- (HMDIDSFirewallManagerContext)context;
- (NSArray)userIDs;
- (void)addFireWallEntryForUserIDs:(id)a3;
- (void)handleDidAddHome;
- (void)handleDidAddUserWithUserID:(id)a3;
- (void)handleDidAddUserWithUserID:(id)a3 completion:(id)a4;
- (void)handleDidRemoveHome;
- (void)handleDidRemoveUser;
- (void)replaceFireWallEntriesWithUserIDs:(id)a3;
- (void)start;
@end

@implementation HMDIDSFirewallManager

- (void).cxx_destruct
{
}

- (HMDIDSFirewallManagerContext)context
{
  return (HMDIDSFirewallManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleDidRemoveUser
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDIDSFirewallManager *)self context];
  v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did remove user", (uint8_t *)&v10, 0xCu);
  }
  v9 = [(HMDIDSFirewallManager *)v6 userIDs];
  [(HMDIDSFirewallManager *)v6 replaceFireWallEntriesWithUserIDs:v9];
}

- (void)handleDidAddUserWithUserID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDIDSFirewallManager *)self context];
  v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  int v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543619;
    v19 = v13;
    __int16 v20 = 2117;
    id v21 = v6;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding firewall entry for userID: %{sensitive}@", buf, 0x16u);
  }
  v14 = [(HMDIDSFirewallManager *)v11 context];
  id v17 = v6;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v16 = +[HMDIDSFirewallManager firewallEntriesForUserIDs:v15];
  [v14 addFirewallEntries:v16 completion:v7];
}

- (void)handleDidAddUserWithUserID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDIDSFirewallManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543619;
    v14 = v10;
    __int16 v15 = 2117;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling did add user with userID: %{sensitive}@", buf, 0x16u);
  }
  id v12 = v4;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [(HMDIDSFirewallManager *)v8 addFireWallEntryForUserIDs:v11];
}

- (void)handleDidRemoveHome
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDIDSFirewallManager *)self context];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did remove home", (uint8_t *)&v10, 0xCu);
  }
  v9 = [(HMDIDSFirewallManager *)v6 userIDs];
  [(HMDIDSFirewallManager *)v6 replaceFireWallEntriesWithUserIDs:v9];
}

- (void)handleDidAddHome
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDIDSFirewallManager *)self context];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did add home", (uint8_t *)&v11, 0xCu);
  }
  v9 = [(HMDIDSFirewallManager *)v6 context];
  [v9 registerForHomeUserNotifications];

  int v10 = [(HMDIDSFirewallManager *)v6 userIDs];
  [(HMDIDSFirewallManager *)v6 replaceFireWallEntriesWithUserIDs:v10];
}

- (void)addFireWallEntryForUserIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDIDSFirewallManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v13 = 138543619;
    v14 = v10;
    __int16 v15 = 2117;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding firewall entries for userIDs: %{sensitive}@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [(HMDIDSFirewallManager *)v8 context];
  uint64_t v12 = +[HMDIDSFirewallManager firewallEntriesForUserIDs:v4];
  [v11 addFirewallEntries:v12];
}

- (void)replaceFireWallEntriesWithUserIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDIDSFirewallManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v13 = 138543619;
    v14 = v10;
    __int16 v15 = 2117;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Replacing firewall entries with userIDs: %{sensitive}@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [(HMDIDSFirewallManager *)v8 context];
  uint64_t v12 = +[HMDIDSFirewallManager firewallEntriesForUserIDs:v4];
  [v11 replaceFireWallEntries:v12];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDIDSFirewallManager *)self context];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting HMDIDSFirewallManager", (uint8_t *)&v11, 0xCu);
  }
  v9 = [(HMDIDSFirewallManager *)v6 context];
  [v9 configure];

  int v10 = [(HMDIDSFirewallManager *)v6 userIDs];
  [(HMDIDSFirewallManager *)v6 replaceFireWallEntriesWithUserIDs:v10];
}

- (NSArray)userIDs
{
  v2 = [(HMDIDSFirewallManager *)self context];
  v3 = [v2 homeManager];
  uint64_t v4 = [v3 homes];
  v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_109_69852);

  int v10 = [v8 setWithArray:v9];
  int v11 = [v10 allObjects];

  return (NSArray *)v11;
}

id __32__HMDIDSFirewallManager_userIDs__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 users];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_112_69855);

  return v3;
}

uint64_t __32__HMDIDSFirewallManager_userIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 userID];
}

- (HMDIDSFirewallManager)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDIDSFirewallManager;
  id v6 = [(HMDIDSFirewallManager *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    [(HMDIDSFirewallManagerContext *)v7->_context setFirewallManager:v7];
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_69860 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_69860, &__block_literal_global_116);
  }
  v2 = (void *)logCategory__hmf_once_v22_69861;
  return v2;
}

uint64_t __36__HMDIDSFirewallManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22_69861;
  logCategory__hmf_once_v22_69861 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)firewallEntriesForUserIDs:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_102_69865);
}

id __51__HMDIDSFirewallManager_firewallEntriesForUserIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F6ABD0] URIWithUnprefixedURI:a2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F6AB18]) initWithURI:v2];

  return v3;
}

@end