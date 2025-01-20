@interface HMDNetworkRouterClientManager
+ (id)logCategory;
- (BOOL)managedNetworkEnabled;
- (BOOL)staleClientIdentifiersResetInProgress;
- (BOOL)staleClientIdentifiersResetNeeded;
- (BOOL)startPending;
- (BOOL)started;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (HMDHAPAccessory)networkRouterAccessory;
- (HMDHome)home;
- (HMDNetworkRouterClientManager)initWithNetworkRouterAccessory:(id)a3 workQueue:(id)a4 firewallRuleManager:(id)a5 notificationCenter:(id)a6;
- (HMDNetworkRouterController)routerController;
- (HMDNetworkRouterFirewallRuleManager)firewallRuleManager;
- (NSMutableSet)accessoriesInReconfiguration;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)_transactionBlockForAccessoriesWithStaleClientIdentifier;
- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3;
- (void)__deregisterForNetworkRouterAccessoryReachable:(id)a3;
- (void)__registerForNetworkRouterAccessoryReachable:(id)a3;
- (void)_createClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6;
- (void)_deregisterForChangesToManagedAccessory:(id)a3;
- (void)_evaluateManagement;
- (void)_fetchFirewallRulesForAccessory:(id)a3 completion:(id)a4;
- (void)_getNetworkConfigurationForAccessory:(id)a3 targetProtectionMode:(int64_t)a4 completion:(id)a5;
- (void)_handleRouterAccessoryReachable:(id)a3;
- (void)_migrateAccessory:(id)a3 withConfiguration:(id)a4 clientStatus:(id)a5 fromCredentialType:(int64_t)a6 toCredentialType:(int64_t)a7 rotate:(BOOL)a8 completion:(id)a9;
- (void)_reconcileClientConfigurationForAccessory:(id)a3 clientStatus:(id)a4 networkRouterUUID:(id)a5 clientReconfigurationAllowed:(BOOL)a6;
- (void)_reconcileClientConfigurationForReachableAccessory:(id)a3 clientReconfigurationAllowed:(BOOL)a4;
- (void)_registerForChangesToManagedAccessory:(id)a3;
- (void)_registerForNetworkProtectionChangesToGroup:(id)a3;
- (void)_replaceClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6;
- (void)_replaceNetworkClientIdentifierForAccessory:(id)a3 networkClientIdentifier:(id)a4 networkRouterUUID:(id)a5 clientStatus:(id)a6 clientReconfigurationAllowed:(BOOL)a7;
- (void)_resetStaleClientIdentifiersBeforeStart;
- (void)_start;
- (void)_startManagingAccessory:(id)a3 initialHomeSetup:(BOOL)a4;
- (void)_stop;
- (void)_unregisterForNetworkProtectionChangesToGroup:(id)a3;
- (void)_updateClientConfiguration:(id)a3 forAccessory:(id)a4 protectionMode:(int64_t)a5 clientStatus:(id)a6 skipIfFingerprintMatches:(BOOL)a7 clientReconfigurationAllowed:(BOOL)a8;
- (void)_updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:(BOOL)a3;
- (void)_updateExistingClientConfiguration:(id)a3 forAccessory:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6;
- (void)_updateOrCreateClientConfigurationForAccessory:(id)a3 preferReconcile:(BOOL)a4 clientReconfigurationAllowed:(BOOL)a5;
- (void)evaluateManagement;
- (void)handleAccessoryAdded:(id)a3;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleAccessoryFirmwareVersionUpdated:(id)a3;
- (void)handleAccessoryRemoved:(id)a3;
- (void)handleFirewallRulesUpdated:(id)a3;
- (void)handleHomeNetworkProtectionChanged:(id)a3;
- (void)handleNetworkProtectionGroupActivated:(id)a3;
- (void)handleNetworkProtectionGroupDeactivated:(id)a3;
- (void)handleNetworkProtectionGroupProtectionChanged:(id)a3;
- (void)handleRouterAccessoryReachable:(id)a3;
- (void)migrateAccessory:(id)a3 toCredentialType:(int64_t)a4 rotate:(BOOL)a5 completion:(id)a6;
- (void)replaceActiveNetworkRouterAccessory:(id)a3;
- (void)setManagedNetworkEnabled:(BOOL)a3;
- (void)setNetworkRouterAccessory:(id)a3;
- (void)setStaleClientIdentifiersResetInProgress:(BOOL)a3;
- (void)setStaleClientIdentifiersResetNeeded:(BOOL)a3;
- (void)setStartPending:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)stop;
@end

@implementation HMDNetworkRouterClientManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesInReconfiguration, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_networkRouterAccessory);
}

- (NSMutableSet)accessoriesInReconfiguration
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStartPending:(BOOL)a3
{
  self->_startPending = a3;
}

- (BOOL)startPending
{
  return self->_startPending;
}

- (void)setStaleClientIdentifiersResetInProgress:(BOOL)a3
{
  self->_staleClientIdentifiersResetInProgress = a3;
}

- (BOOL)staleClientIdentifiersResetInProgress
{
  return self->_staleClientIdentifiersResetInProgress;
}

- (void)setStaleClientIdentifiersResetNeeded:(BOOL)a3
{
  self->_staleClientIdentifiersResetNeeded = a3;
}

- (BOOL)staleClientIdentifiersResetNeeded
{
  return self->_staleClientIdentifiersResetNeeded;
}

- (void)setManagedNetworkEnabled:(BOOL)a3
{
  self->_managedNetworkEnabled = a3;
}

- (BOOL)managedNetworkEnabled
{
  return self->_managedNetworkEnabled;
}

- (HMDNetworkRouterFirewallRuleManager)firewallRuleManager
{
  return (HMDNetworkRouterFirewallRuleManager *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HMDNetworkRouterClientManager *)self home];
  v7 = [v3 stringWithFormat:@"<%@ %p Home = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return [a3 supportsRouterManagement];
}

- (id)_transactionBlockForAccessoriesWithStaleClientIdentifier
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
  v24 = self;
  v5 = [(HMDNetworkRouterClientManager *)self home];
  v6 = [v5 backingStore];
  v22 = (void *)v4;
  id v23 = [v6 transaction:@"Reset Stale Network Client Identifiers" options:v4];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = v5;
  v7 = [v5 accessories];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 networkClientIdentifier];
        if (v13)
        {
          v14 = (void *)v13;
          v15 = [(HMDNetworkRouterClientManager *)v24 networkRouterAccessory];
          v16 = [v15 uuid];
          v17 = [v12 networkRouterUUID];
          char v18 = [v16 isEqual:v17];

          if ((v18 & 1) == 0)
          {
            v19 = [v12 transactionWithObjectChangeType:2];
            [v19 setNetworkRouterUUID:0];
            [v19 setNetworkClientIdentifier:0];
            [v19 setNetworkClientProfileFingerprint:0];
            [v23 add:v19];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v23;
}

- (void)_unregisterForNetworkProtectionChangesToGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering for network protection change notification to group %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(HMDNetworkRouterClientManager *)v7 notificationCenter];
  [v10 removeObserver:v7 name:@"HMDAccessoryNetworkProtectionGroupProtectionModeUpdated" object:v4];
}

- (void)_registerForNetworkProtectionChangesToGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for network protection change notification to group %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(HMDNetworkRouterClientManager *)v7 notificationCenter];
  [v10 addObserver:v7 selector:sel_handleNetworkProtectionGroupProtectionChanged_ name:@"HMDAccessoryNetworkProtectionGroupProtectionModeUpdated" object:v4];
}

- (void)_deregisterForChangesToManagedAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v6 removeObserver:self name:@"HMDAccessoryConnectedNotification" object:v4];

  id v7 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v7 removeObserver:self name:@"HMDAccessoryFirmwareVersionUpdatedNotification" object:v4];
}

- (void)_registerForChangesToManagedAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v6 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v4];

  id v7 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v7 addObserver:self selector:sel_handleAccessoryFirmwareVersionUpdated_ name:@"HMDAccessoryFirmwareVersionUpdatedNotification" object:v4];
}

- (void)_fetchFirewallRulesForAccessory:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 metadataIdentifier];
  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  int v11 = self;
  v12 = HMFGetOSLogHandle();
  __int16 v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = logDescriptionForAccessory(v6);
      *(_DWORD *)buf = 138543874;
      long long v25 = v14;
      __int16 v26 = 2112;
      long long v27 = v15;
      __int16 v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching firewall rules for accessory %@ with identifier %@", buf, 0x20u);
    }
    v16 = [(HMDNetworkRouterClientManager *)v11 firewallRuleManager];
    v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__HMDNetworkRouterClientManager__fetchFirewallRulesForAccessory_completion___block_invoke;
    v20[3] = &unk_1E6A12120;
    id v21 = v6;
    id v22 = v9;
    id v23 = v7;
    [v16 fetchRulesForAccessories:v17 completion:v20];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v18 = HMFGetLogIdentifier();
      v19 = logDescriptionForAccessory(v6);
      *(_DWORD *)buf = 138543618;
      long long v25 = v18;
      __int16 v26 = 2112;
      long long v27 = v19;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch firewall rules due to failure to derive identifier for accessory %@", buf, 0x16u);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __76__HMDNetworkRouterClientManager__fetchFirewallRulesForAccessory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = logDescriptionForAccessory(*(void **)(a1 + 32));
      uint64_t v11 = *(void *)(a1 + 40);
      int v15 = 138544130;
      v16 = v9;
      __int16 v17 = 2112;
      char v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Fetched firewall rules for accessory %@ with identifier %@ failed with error %@", (uint8_t *)&v15, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    __int16 v13 = [v5 allObjects];
    id v14 = [v13 firstObject];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  }
}

- (void)_getNetworkConfigurationForAccessory:(id)a3 targetProtectionMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (a4 == 3)
  {
    uint64_t v11 = [v8 networkClientIdentifier];
    uint64_t v12 = +[HMDNetworkRouterClientConfiguration configurationForOpenProtectionWithClientIdentifier:v11];

    (*((void (**)(id, void, void *, void *, void))v9 + 2))(v9, 0, v12, &unk_1F2DC8FE0, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__HMDNetworkRouterClientManager__getNetworkConfigurationForAccessory_targetProtectionMode_completion___block_invoke;
    v13[3] = &unk_1E6A120F8;
    int64_t v17 = a4;
    id v14 = v8;
    int v15 = self;
    id v16 = v9;
    [(HMDNetworkRouterClientManager *)self _fetchFirewallRulesForAccessory:v14 completion:v13];
  }
}

void __102__HMDNetworkRouterClientManager__getNetworkConfigurationForAccessory_targetProtectionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == 1)
  {
    id v28 = v3;
    uint64_t v10 = [[HMDNetworkRouterHomeKitOnlyFirewallConfiguration alloc] initWithAccessory:*(void *)(a1 + 32) sourceConfiguration:v3];

    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 40);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = logDescriptionForAccessory(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      v31 = v14;
      __int16 v32 = 2112;
      v33 = v10;
      __int16 v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Using firewall configuration %@ for accessory %@", buf, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) needsAirplayAccess];
    int64_t v17 = [*(id *)(a1 + 32) networkClientIdentifier];
    char v18 = +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:v10 hapAccessory:1 airplayAccessory:v16 withClientIdentifier:v17];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (v5)
  {
    id v29 = v3;
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 40);
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      HMAccessoryNetworkProtectionModeAsString();
      uint64_t v23 = (HMDNetworkRouterHomeKitOnlyFirewallConfiguration *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unexpected target network protection mode %@", buf, 0x16u);
    }
    uint64_t v24 = *(void *)(a1 + 48);
    long long v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *, void, void, void))(v24 + 16))(v24, v25, 0, 0, 0);
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    if (v4)
    {
      id v27 = v4;
      uint64_t v7 = [v6 needsAirplayAccess];
      id v8 = [*(id *)(a1 + 32) networkClientIdentifier];
      id v9 = +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:v27 hapAccessory:1 airplayAccessory:v7 withClientIdentifier:v8];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      __int16 v26 = [v6 networkClientIdentifier];
      id v27 = +[HMDNetworkRouterClientConfiguration configurationForOpenProtectionWithClientIdentifier:v26];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_migrateAccessory:(id)a3 withConfiguration:(id)a4 clientStatus:(id)a5 fromCredentialType:(int64_t)a6 toCredentialType:(int64_t)a7 rotate:(BOOL)a8 completion:(id)a9
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  char v18 = (void (**)(id, void))a9;
  __int16 v19 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v19);

  id v20 = [v16 clientIdentifier];
  __int16 v21 = [v20 value];

  if (a7 == 3)
  {
    if (a6 != 3 || a8) {
      goto LABEL_8;
    }
LABEL_7:
    v18[2](v18, 0);
    goto LABEL_20;
  }
  if (a7 != 2)
  {
    uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
LABEL_19:
    __int16 v34 = (void *)v33;
    v18[2](v18, v33);

    goto LABEL_20;
  }
  if (a6 != 3) {
    goto LABEL_7;
  }
LABEL_8:
  if (([v15 supportsWiFiReconfiguration] & 1) == 0)
  {
    uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    goto LABEL_19;
  }
  if ([v15 isReachable])
  {
    id v22 = v15;
    v67 = v18;
    BOOL v23 = a8;
    id v24 = v16;
    id v25 = v15;
    __int16 v26 = v21;
    id v27 = v17;
    id v28 = v22;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
    id v30 = v29;
    v65 = v28;

    id v17 = v27;
    __int16 v21 = v26;
    id v15 = v25;
    id v16 = v24;
    BOOL v31 = v23;
    char v18 = v67;
    v69 = [v30 wiFiManagementController];

    if (v69)
    {
      __int16 v32 = [(HMDNetworkRouterClientManager *)self routerController];
      v68 = [v32 wiFiSSID];

      if (!v68) {
        goto LABEL_31;
      }
      if (a7 == 3)
      {
        v42 = generateWiFiUniquePreSharedKey();
        v64 = [v42 dataUsingEncoding:1];
      }
      else
      {
        v64 = +[HMDWiFiManagementController sharedPSKForNetworkWithSSID:v68];
      }
      if (v64)
      {
        objc_initWeak(&location, self);
        v43 = [(HMDNetworkRouterClientManager *)self networkRouterAccessory];
        v61 = [v43 uuid];

        if (v17 || a7 != 2)
        {
          contexta = (void *)MEMORY[0x1D9452090]();
          v51 = self;
          HMFGetOSLogHandle();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = (id *)(id)objc_claimAutoreleasedReturnValue();
            HMAccessoryWiFiCredentialTypeAsString();
            id v53 = (id)objc_claimAutoreleasedReturnValue();
            v54 = logDescriptionForAccessory(v65);
            *(_DWORD *)buf = 138543874;
            v87 = v60;
            __int16 v88 = 2112;
            id v89 = v53;
            __int16 v90 = 2112;
            v91 = v54;
            _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Attempting migration to %@ credential for accessory %@", buf, 0x20u);
          }
          v55 = [(HMDNetworkRouterClientManager *)v51 accessoriesInReconfiguration];
          v56 = [v65 uuid];
          [v55 addObject:v56];

          context = objc_alloc_init(HMDNetworkRouterCredential);
          if (a7 == 3)
          {
            [(HMDNetworkRouterCredential *)context setPsk:v64];
          }
          else
          {
            v57 = [v17 macAddress];
            [(HMDNetworkRouterCredential *)context setMacAddress:v57];
          }
          [v16 setCredential:context];
          [v16 setClientIdentifier:0];
          v58 = [(HMDNetworkRouterClientManager *)v51 routerController];
          v46 = v70;
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_50;
          v70[3] = &unk_1E6A120D0;
          v59 = v77;
          objc_copyWeak(v77, &location);
          id v71 = v61;
          v76 = v67;
          id v72 = v65;
          v77[1] = (id)a7;
          v73[0] = v69;
          v73[1] = v68;
          id v74 = v64;
          id v75 = v21;
          [v58 addClientConfiguration:v16 completion:v70];

          v66 = &v71;
          v47 = (id *)&v76;
          v48 = &v72;
          v49 = (id *)v73;
          v45 = v74;
        }
        else
        {
          context = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
          v44 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:v21];
          [(HMDNetworkRouterCredential *)context setClientIdentifier:v44];

          v45 = [(HMDNetworkRouterClientManager *)self routerController];
          v46 = v78;
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke;
          v78[3] = &unk_1E6A12008;
          v59 = v83;
          objc_copyWeak(v83, &location);
          id v79 = v61;
          v82 = v67;
          id v80 = v65;
          v81[0] = v21;
          v81[1] = v16;
          v83[1] = (id)a6;
          v83[2] = (id)2;
          BOOL v84 = v31;
          [v45 getClientStatusWithIdentifier:context completion:v78];
          v66 = &v79;
          v47 = (id *)&v82;
          v48 = &v80;
          v49 = (id *)v81;
        }

        objc_destroyWeak(v59);
        objc_destroyWeak(&location);
      }
      else
      {
LABEL_31:
        v50 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        ((void (**)(id, void *))v67)[2](v67, v50);
      }
    }
    else
    {
      v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      ((void (**)(id, void *))v67)[2](v67, v41);
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x1D9452090]();
    uint64_t v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (id *)objc_claimAutoreleasedReturnValue();
      v39 = logDescriptionForAccessory(v15);
      *(_DWORD *)buf = 138543618;
      v87 = v38;
      __int16 v88 = 2112;
      id v89 = v39;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Unable to perform Wi-Fi reconfiguration for unreachable accessory %@", buf, 0x16u);
    }
    v40 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
    ((void (**)(id, void *))v18)[2](v18, v40);
  }
LABEL_20:
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2;
  v12[3] = &unk_1E6A11FE0;
  id v13 = v5;
  id v19 = v9;
  id v14 = v6;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 80);
  char v21 = *(unsigned char *)(a1 + 96);
  id v10 = v6;
  id v11 = v5;
  ContinueRouterOperationOnWorkQueue(WeakRetained, v8, v19, v12);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v8 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 80);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2_51;
  v13[3] = &unk_1E6A120A8;
  id v10 = v5;
  id v14 = v10;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 80);
  id v11 = v6;
  id v12 = *(void **)(a1 + 96);
  id v17 = v11;
  v24[1] = v12;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  objc_copyWeak(v24, (id *)(a1 + 88));
  id v21 = *(id *)(a1 + 32);
  id v22 = *(id *)(a1 + 72);
  ContinueRouterOperationOnWorkQueue(WeakRetained, v8, v9, v13);

  objc_destroyWeak(v24);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2_51(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 accessoriesInReconfiguration];
    id v5 = [*(id *)(a1 + 48) uuid];
    [v4 removeObject:v5];

    id v6 = *(void (**)(void))(*(void *)(a1 + 104) + 16);
    v6();
  }
  else
  {
    uint64_t v7 = [v2 routerController];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_3;
    aBlock[3] = &unk_1E6A12058;
    id v26 = *(id *)(a1 + 56);
    id v8 = v7;
    id v27 = v8;
    id v9 = _Block_copy(aBlock);
    id v10 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
    id v11 = [*(id *)(a1 + 40) networkRouterAccessory];
    [(HMDWiFiReconfigurationLogEvent *)v10 setRouterAccessory:v11];

    [(HMDWiFiReconfigurationLogEvent *)v10 setCredentialType:*(void *)(a1 + 120)];
    id v12 = *(void **)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 80);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_5;
    v17[3] = &unk_1E6A15E80;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(void **)(a1 + 120);
    id v18 = v15;
    v24[1] = v16;
    id v19 = *(id *)(a1 + 80);
    objc_copyWeak(v24, (id *)(a1 + 112));
    id v20 = *(id *)(a1 + 88);
    id v23 = *(id *)(a1 + 104);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 96);
    [v12 safelyReconfigureWithSSID:v13 PSK:v14 verificationCallback:v9 logEvent:v10 completion:v17];

    objc_destroyWeak(v24);
  }
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:*(void *)(a1 + 32)];
  [(HMDNetworkRouterClientStatusIdentifier *)v4 setClientIdentifier:v5];

  id v6 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_4;
  v8[3] = &unk_1E6A12030;
  id v9 = v3;
  id v7 = v3;
  [v6 getClientStatusWithIdentifier:v4 completion:v8];
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    if (*(void *)(a1 + 88) == 3) {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v4 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "saveWiFiUniquePreSharedKey:credentialType:", v4);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v6 = *(void **)(a1 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_6;
  v10[3] = &unk_1E6A12080;
  id v7 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  uint64_t v8 = *(void *)(a1 + 88);
  id v13 = WeakRetained;
  uint64_t v18 = v8;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v9 = v3;
  ContinueRouterOperationOnWorkQueue(WeakRetained, v7, v6, v10);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!*(void *)(a1 + 40))
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 48);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = HMAccessoryWiFiCredentialTypeAsString();
      uint64_t v8 = logDescriptionForAccessory(*(void **)(a1 + 56));
      int v13 = 138543874;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Successfully completed migration to %@ credential for accessory %@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 56) saveNetworkClientIdentifier:*(void *)(a1 + 32) networkRouterUUID:*(void *)(a1 + 64) clearProfileFingerprint:0];
    id v9 = *(id *)(a1 + 72);

    id v2 = v9;
  }
  id v10 = [*(id *)(a1 + 48) routerController];
  [v10 removeClientConfigurationWithClientIdentifier:v2 completion:&__block_literal_global_56_136178];

  id v11 = [*(id *)(a1 + 48) accessoriesInReconfiguration];
  id v12 = [*(id *)(a1 + 56) uuid];
  [v11 removeObject:v12];

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

uint64_t __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 0;
  }
  uint64_t v5 = !v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v5);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      [*(id *)(a1 + 48) _migrateAccessory:*(void *)(a1 + 56) withConfiguration:*(void *)(a1 + 72) clientStatus:v3 fromCredentialType:*(void *)(a1 + 88) toCredentialType:*(void *)(a1 + 96) rotate:*(unsigned __int8 *)(a1 + 104) completion:*(void *)(a1 + 80)];
    }
    else
    {
      BOOL v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 48);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        uint64_t v8 = logDescriptionForAccessory(*(void **)(a1 + 56));
        uint64_t v9 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        int v13 = v7;
        __int16 v14 = 2112;
        __int16 v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Router did not return client status for accessory %@ with client identifier %@ (accessory offline or not connected to router?)", buf, 0x20u);
      }
      uint64_t v10 = *(void *)(a1 + 80);
      id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

- (void)_updateClientConfiguration:(id)a3 forAccessory:(id)a4 protectionMode:(int64_t)a5 clientStatus:(id)a6 skipIfFingerprintMatches:(BOOL)a7 clientReconfigurationAllowed:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v17 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v17);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke;
  v21[3] = &unk_1E6A11FB8;
  BOOL v27 = a7;
  id v22 = v15;
  id v23 = self;
  id v25 = v14;
  int64_t v26 = a5;
  BOOL v28 = a8;
  id v24 = v16;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  [(HMDNetworkRouterClientManager *)self _getNetworkConfigurationForAccessory:v20 targetProtectionMode:a5 completion:v21];
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v9 && v10)
  {
    uint64_t v36 = (void *)[v11 integerValue];
    int v13 = [v10 lanIdentifier];
    id v14 = [v13 value];
    v35 = (void *)[v14 integerValue];

    id v15 = (id)[v10 fingerprint];
    if (*(unsigned char *)(a1 + 72)
      && ([*(id *)(a1 + 32) networkClientProfileFingerprint],
          id v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 isEqual:v16],
          v16,
          v17))
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        id v20 = logDescriptionForAccessory(*(void **)(a1 + 32));
        id v21 = HMAccessoryNetworkProtectionModeAsString();
        *(_DWORD *)buf = 138543874;
        id v53 = v33;
        __int16 v54 = 2112;
        v55 = v20;
        __int16 v56 = 2112;
        v57 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping network configuration update for accessory %@ with mode %@ - fingerprint matches existing profile", buf, 0x20u);
      }
      if (v36 != (void *)[*(id *)(a1 + 32) currentNetworkProtectionMode])
      {
        id v22 = *(void **)(a1 + 32);
        id v23 = +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:v12];
        [v22 saveCurrentNetworkProtectionMode:v36 assignedLAN:v35 allowedWANHosts:v23 profileFingerprint:v15];
      }
      if (*(unsigned char *)(a1 + 73) && *(void *)(a1 + 64) != 3)
      {
        id v24 = [*(id *)(a1 + 40) workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_42;
        block[3] = &unk_1E6A18668;
        int8x16_t v37 = *(int8x16_t *)(a1 + 32);
        id v25 = (id)v37.i64[0];
        int8x16_t v49 = vextq_s8(v37, v37, 8uLL);
        id v50 = v10;
        id v51 = *(id *)(a1 + 48);
        dispatch_async(v24, block);
      }
    }
    else
    {
      int64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:*(void *)(a1 + 56)];
      [v10 setClientIdentifier:v26];

      BOOL v27 = [*(id *)(a1 + 40) networkRouterAccessory];
      BOOL v28 = [v27 uuid];

      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      id v29 = [*(id *)(a1 + 40) routerController];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_3;
      v38[3] = &unk_1E6A11F90;
      objc_copyWeak(v46, (id *)buf);
      id v30 = v28;
      id v39 = v30;
      id v40 = *(id *)(a1 + 32);
      v46[1] = v36;
      v46[2] = v35;
      id v41 = v12;
      id v42 = v15;
      id v31 = *(id *)(a1 + 56);
      char v47 = *(unsigned char *)(a1 + 73);
      __int16 v32 = *(void **)(a1 + 64);
      id v43 = v31;
      v46[3] = v32;
      id v44 = v10;
      id v45 = *(id *)(a1 + 48);
      [v29 updateClientConfiguration:v44 completion:v38];

      objc_destroyWeak(v46);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_42(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[7];
  id v5 = [v3 credential];
  [v1 _migrateAccessory:v2 withConfiguration:v3 clientStatus:v4 fromCredentialType:credentialTypeForCredential(v5) toCredentialType:3 rotate:0 completion:&__block_literal_global_44_136191];
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v5 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_4;
    v9[3] = &unk_1E6A11F68;
    v9[4] = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    long long v17 = *(_OWORD *)(a1 + 96);
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 64);
    char v19 = *(unsigned char *)(a1 + 120);
    uint64_t v8 = *(void *)(a1 + 112);
    id v14 = v7;
    uint64_t v18 = v8;
    id v15 = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 80);
    dispatch_async(v6, v9);
  }
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkRouterAccessory];
  uint64_t v3 = [v2 uuid];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 104);
    id v7 = *(void **)(a1 + 48);
    uint64_t v8 = +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:*(void *)(a1 + 56)];
    [v7 saveCurrentNetworkProtectionMode:v5 assignedLAN:v6 allowedWANHosts:v8 profileFingerprint:*(void *)(a1 + 64)];

    id v9 = *(void **)(a1 + 48);
    id v10 = +[HMDAccessoryNetworkAccessViolation noViolation];
    [v9 saveNetworkAccessViolation:v10];

    id v11 = [*(id *)(a1 + 32) routerController];
    [v11 resetAccessViolationForClientIdentifier:*(void *)(a1 + 72) completion:&__block_literal_global_46_136187];

    if (*(unsigned char *)(a1 + 120))
    {
      if (*(void *)(a1 + 112) != 3)
      {
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 48);
        id v15 = *(void **)(a1 + 80);
        uint64_t v14 = *(void *)(a1 + 88);
        id v16 = [v15 credential];
        [v12 _migrateAccessory:v13 withConfiguration:v15 clientStatus:v14 fromCredentialType:credentialTypeForCredential(v16) toCredentialType:3 rotate:0 completion:&__block_literal_global_48_136188];
      }
    }
  }
}

- (void)_updateExistingClientConfiguration:(id)a3 forAccessory:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t ProtectionModeForAccessory = getProtectionModeForAccessory(v11);
  id v15 = v11;
  unint64_t v16 = getProtectionModeForAccessory(v15);
  if (v16 < 2)
  {

LABEL_5:
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    char v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = logDescriptionForAccessory(v15);
      HMAccessoryNetworkProtectionModeAsString();
      __int16 v34 = v18;
      uint64_t v23 = ProtectionModeForAccessory;
      id v24 = v12;
      id v25 = v10;
      v27 = BOOL v26 = v6;
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v21;
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      id v40 = v27;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating existing client configuration for accessory %@ to comply with target network protection mode %@", buf, 0x20u);

      BOOL v6 = v26;
      id v10 = v25;
      id v12 = v24;
      uint64_t ProtectionModeForAccessory = v23;
      uint64_t v18 = v34;
    }
    [(HMDNetworkRouterClientManager *)v19 _updateClientConfiguration:v10 forAccessory:v15 protectionMode:ProtectionModeForAccessory clientStatus:v12 skipIfFingerprintMatches:1 clientReconfigurationAllowed:v6];
    goto LABEL_12;
  }
  if (v16 == 3)
  {
    uint64_t v17 = [v15 currentNetworkProtectionMode];

    if (v17 != 3) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  BOOL v28 = (void *)MEMORY[0x1D9452090]();
  id v29 = self;
  id v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = HMFGetLogIdentifier();
    __int16 v32 = logDescriptionForAccessory(v15);
    uint64_t v33 = HMAccessoryNetworkProtectionModeAsString();
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v31;
    __int16 v37 = 2112;
    v38 = v32;
    __int16 v39 = 2112;
    id v40 = v33;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@No network configuration update necessary for accessory %@ with protection mode %@", buf, 0x20u);
  }
LABEL_12:
}

- (void)_updateOrCreateClientConfigurationForAccessory:(id)a3 preferReconcile:(BOOL)a4 clientReconfigurationAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 networkClientIdentifier];
  uint64_t v14 = (void *)v13;
  if (!v6)
  {
    if (v13) {
      goto LABEL_9;
    }
    if (![v12 isReachable]) {
      goto LABEL_12;
    }
LABEL_11:
    [(HMDNetworkRouterClientManager *)self _reconcileClientConfigurationForReachableAccessory:v12 clientReconfigurationAllowed:v5];
    goto LABEL_17;
  }
  if ([v12 isReachable]) {
    goto LABEL_11;
  }
  if (v14)
  {
LABEL_9:
    [(HMDNetworkRouterClientManager *)self _updateExistingClientConfiguration:v14 forAccessory:v12 clientStatus:0 clientReconfigurationAllowed:v5];
    goto LABEL_17;
  }
LABEL_12:
  id v15 = [v10 wiFiUniquePreSharedKey];

  if (v15)
  {
    unint64_t v16 = objc_alloc_init(HMDNetworkRouterCredential);
    uint64_t v17 = [v10 wiFiUniquePreSharedKey];
    [(HMDNetworkRouterCredential *)v16 setPsk:v17];

    [(HMDNetworkRouterClientManager *)self _createClientConfigurationForAccessory:v10 credential:v16 clientStatus:0 clientReconfigurationAllowed:0];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    char v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = logDescriptionForAccessory(v10);
      int v23 = 138543618;
      id v24 = v21;
      __int16 v25 = 2112;
      BOOL v26 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Unable to apply client configuration for unreachable accessory %@ with no prior client configuration and no saved PSK", (uint8_t *)&v23, 0x16u);
    }
  }
LABEL_17:
}

- (void)_updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v6 = [(HMDNetworkRouterClientManager *)self home];
  id v7 = [v6 accessories];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (shouldManageAccessory(v12)) {
          [(HMDNetworkRouterClientManager *)self _updateOrCreateClientConfigurationForAccessory:v12 preferReconcile:0 clientReconfigurationAllowed:v3];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_createClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  long long v14 = (void *)MEMORY[0x1D9452090]();
  long long v15 = self;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    uint64_t v18 = logDescriptionForAccessory(v10);
    *(_DWORD *)buf = 138543618;
    id v31 = v17;
    __int16 v32 = 2112;
    uint64_t v33 = v18;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Creating new client configuration for %@", buf, 0x16u);
  }
  uint64_t ProtectionModeForAccessory = (void *)getProtectionModeForAccessory(v10);
  objc_initWeak((id *)buf, v15);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke;
  v23[3] = &unk_1E6A11F40;
  id v20 = v11;
  id v24 = v20;
  __int16 v25 = v15;
  objc_copyWeak(v28, (id *)buf);
  id v21 = v10;
  BOOL v29 = a6;
  id v26 = v21;
  v28[1] = ProtectionModeForAccessory;
  id v22 = v12;
  id v27 = v22;
  [(HMDNetworkRouterClientManager *)v15 _getNetworkConfigurationForAccessory:v21 targetProtectionMode:ProtectionModeForAccessory completion:v23];

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);
}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v9)
  {
    [v10 setClientIdentifier:0];
    [v10 setCredential:*(void *)(a1 + 32)];
    long long v13 = [*(id *)(a1 + 40) networkRouterAccessory];
    long long v14 = [v13 uuid];

    long long v15 = [*(id *)(a1 + 40) routerController];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    v19[3] = &unk_1E6A11F18;
    objc_copyWeak(v27, (id *)(a1 + 64));
    id v16 = v14;
    id v20 = v16;
    id v21 = *(id *)(a1 + 48);
    id v22 = v11;
    id v23 = v10;
    id v17 = v12;
    char v28 = *(unsigned char *)(a1 + 80);
    uint64_t v18 = *(void **)(a1 + 72);
    id v24 = v17;
    v27[1] = v18;
    id v25 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 32);
    [v15 addClientConfiguration:v23 completion:v19];

    objc_destroyWeak(v27);
  }
}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v7 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    uint64_t v8 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_3;
    block[3] = &unk_1E6A11EF0;
    void block[4] = v7;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 64);
    char v21 = *(unsigned char *)(a1 + 104);
    uint64_t v10 = *(void *)(a1 + 96);
    id v17 = v9;
    uint64_t v20 = v10;
    id v18 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 80);
    dispatch_async(v8, block);
  }
}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkRouterAccessory];
  BOOL v3 = [v2 uuid];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    [*(id *)(a1 + 48) saveNetworkClientIdentifier:*(void *)(a1 + 56) networkRouterUUID:*(void *)(a1 + 40) clearProfileFingerprint:0];
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 64) integerValue];
    id v7 = [*(id *)(a1 + 72) lanIdentifier];
    uint64_t v8 = [v7 value];
    uint64_t v9 = [v8 integerValue];
    uint64_t v10 = +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:*(void *)(a1 + 80)];
    objc_msgSend(v5, "saveCurrentNetworkProtectionMode:assignedLAN:allowedWANHosts:profileFingerprint:", v6, v9, v10, objc_msgSend(*(id *)(a1 + 72), "fingerprint"));

    id v11 = *(void **)(a1 + 48);
    id v12 = +[HMDAccessoryNetworkAccessViolation noViolation];
    [v11 saveNetworkAccessViolation:v12];

    if (*(unsigned char *)(a1 + 112))
    {
      if (*(void *)(a1 + 104) != 3)
      {
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:*(void *)(a1 + 56)];
        [*(id *)(a1 + 72) setClientIdentifier:v13];

        [*(id *)(a1 + 32) _migrateAccessory:*(void *)(a1 + 48) withConfiguration:*(void *)(a1 + 72) clientStatus:*(void *)(a1 + 88) fromCredentialType:credentialTypeForCredential(*(void **)(a1 + 96)) toCredentialType:3 rotate:0 completion:&__block_literal_global_136197];
      }
    }
  }
}

- (void)_replaceClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    id v17 = [v10 networkClientIdentifier];
    id v18 = logDescriptionForAccessory(v10);
    *(_DWORD *)buf = 138543874;
    id v31 = v16;
    __int16 v32 = 2112;
    uint64_t v33 = v17;
    __int16 v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Replacing client configuration with identifier %@ with a new client configuration for %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v14);
  id v19 = [(HMDNetworkRouterClientManager *)v14 routerController];
  uint64_t v20 = [v10 networkClientIdentifier];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v24[2] = __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke;
  v24[3] = &unk_1E6A11EC8;
  objc_copyWeak(&v28, (id *)buf);
  id v21 = v10;
  id v25 = v21;
  id v22 = v11;
  id v26 = v22;
  id v23 = v12;
  id v27 = v23;
  BOOL v29 = a6;
  [v19 removeClientConfigurationWithClientIdentifier:v20 completion:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    block[3] = &unk_1E6A154B0;
    void block[4] = v3;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    char v9 = *(unsigned char *)(a1 + 64);
    dispatch_async(v4, block);
  }
}

uint64_t __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createClientConfigurationForAccessory:*(void *)(a1 + 40) credential:*(void *)(a1 + 48) clientStatus:*(void *)(a1 + 56) clientReconfigurationAllowed:*(unsigned __int8 *)(a1 + 64)];
}

- (void)_replaceNetworkClientIdentifierForAccessory:(id)a3 networkClientIdentifier:(id)a4 networkRouterUUID:(id)a5 clientStatus:(id)a6 clientReconfigurationAllowed:(BOOL)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    id v19 = [v11 networkClientIdentifier];
    uint64_t v20 = logDescriptionForAccessory(v11);
    *(_DWORD *)buf = 138544130;
    uint64_t v36 = v18;
    __int16 v37 = 2112;
    v38 = v19;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v20;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Replacing saved network client identifier %@ with %@ found on router for %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, v16);
  id v21 = [(HMDNetworkRouterClientManager *)v16 routerController];
  id v22 = [v11 networkClientIdentifier];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  id v28[2] = __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke;
  v28[3] = &unk_1E6A11EA0;
  objc_copyWeak(&v33, (id *)buf);
  id v23 = v13;
  id v29 = v23;
  id v24 = v11;
  id v30 = v24;
  id v25 = v12;
  id v31 = v25;
  id v26 = v14;
  id v32 = v26;
  BOOL v34 = a7;
  [v21 removeClientConfigurationWithClientIdentifier:v22 completion:v28];

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);
}

void __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    v5[3] = &unk_1E6A11E78;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    char v10 = *(unsigned char *)(a1 + 72);
    dispatch_async(v4, v5);
  }
}

void __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkRouterAccessory];
  BOOL v3 = [v2 uuid];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    [*(id *)(a1 + 48) saveNetworkClientIdentifier:*(void *)(a1 + 56) networkRouterUUID:*(void *)(a1 + 40) clearProfileFingerprint:1];
    id v5 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t ProtectionModeForAccessory = getProtectionModeForAccessory(v7);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
    [v5 _updateClientConfiguration:v6 forAccessory:v7 protectionMode:ProtectionModeForAccessory clientStatus:v9 skipIfFingerprintMatches:0 clientReconfigurationAllowed:v10];
  }
}

- (void)_reconcileClientConfigurationForAccessory:(id)a3 clientStatus:(id)a4 networkRouterUUID:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = [v11 macAddress];

  id v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  id v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = logDescriptionForAccessory(v10);
      *(_DWORD *)buf = 138543618;
      id v45 = v19;
      __int16 v46 = 2112;
      char v47 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Reconciling client configuration for accessory %@", buf, 0x16u);
    }
    id v21 = [v10 networkClientIdentifier];
    id v22 = [v11 clientIdentifier];

    if (v21)
    {
      id v23 = [v11 clientIdentifier];
      id v24 = v23;
      if (v22)
      {
        id v25 = [v23 value];
        char v26 = [v21 isEqualToNumber:v25];

        if (v26)
        {
          [(HMDNetworkRouterClientManager *)v16 _updateExistingClientConfiguration:v21 forAccessory:v10 clientStatus:v11 clientReconfigurationAllowed:v6];
LABEL_22:

          goto LABEL_23;
        }
        id v33 = [v11 clientIdentifier];
        __int16 v41 = [v33 value];
        [(HMDNetworkRouterClientManager *)v16 _replaceNetworkClientIdentifierForAccessory:v10 networkClientIdentifier:v41 networkRouterUUID:v12 clientStatus:v11 clientReconfigurationAllowed:v6];

LABEL_19:
        goto LABEL_22;
      }

      if (!v24)
      {
        id v42 = [v11 macAddress];
        id v40 = networkRouterCredentialForAccessory(v10, v42);

        [(HMDNetworkRouterClientManager *)v16 _replaceClientConfigurationForAccessory:v10 credential:v40 clientStatus:v11 clientReconfigurationAllowed:v6];
        goto LABEL_21;
      }
    }
    else if (v22)
    {
      id v29 = [(HMDNetworkRouterClientManager *)v16 networkRouterAccessory];
      id v30 = [v29 uuid];
      int v31 = [v30 isEqual:v12];

      if (!v31) {
        goto LABEL_22;
      }
      id v32 = [v11 clientIdentifier];
      id v33 = [v32 value];

      BOOL v34 = (void *)MEMORY[0x1D9452090]();
      v35 = v16;
      uint64_t v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = HMFGetLogIdentifier();
        logDescriptionForAccessory(v10);
        v38 = uint64_t v43 = v34;
        *(_DWORD *)buf = 138543874;
        id v45 = v37;
        __int16 v46 = 2112;
        char v47 = v33;
        __int16 v48 = 2112;
        int8x16_t v49 = v38;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Saving found network client identifier %@ for %@", buf, 0x20u);

        BOOL v34 = v43;
      }

      [v10 saveNetworkClientIdentifier:v33 networkRouterUUID:v12 clearProfileFingerprint:1];
      [(HMDNetworkRouterClientManager *)v35 _updateClientConfiguration:v33 forAccessory:v10 protectionMode:getProtectionModeForAccessory(v10) clientStatus:v11 skipIfFingerprintMatches:0 clientReconfigurationAllowed:v6];
      goto LABEL_19;
    }
    __int16 v39 = [v11 macAddress];
    id v40 = networkRouterCredentialForAccessory(v10, v39);

    [(HMDNetworkRouterClientManager *)v16 _createClientConfigurationForAccessory:v10 credential:v40 clientStatus:v11 clientReconfigurationAllowed:v6];
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v27 = HMFGetLogIdentifier();
    id v28 = logDescriptionForAccessory(v10);
    *(_DWORD *)buf = 138543618;
    id v45 = v27;
    __int16 v46 = 2112;
    char v47 = v28;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Router failed to report MAC address for accessory %@", buf, 0x16u);
  }
LABEL_23:
}

- (void)_reconcileClientConfigurationForReachableAccessory:(id)a3 clientReconfigurationAllowed:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = v6;
  uint64_t v9 = [v8 primaryIPServer];
  id v10 = [v9 peerAddress];

  if (v10)
  {
    id v46 = 0;
    id v11 = +[HMDNetworkRouterIPAddress ipAddressFromNetAddress:v10 error:&v46];
    id v12 = v46;
    if (v12)
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        logDescriptionForAccessory(v8);
        id v16 = (HMDNetworkRouterClientStatusIdentifier *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        __int16 v48 = v15;
        __int16 v49 = 2112;
        uint64_t v50 = v10;
        __int16 v51 = 2112;
        v52 = v16;
        __int16 v53 = 2112;
        id v54 = v12;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get translate IP address %@ for accessory %@ because of %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = logDescriptionForAccessory(v8);
      *(_DWORD *)buf = 138543618;
      __int16 v48 = v19;
      __int16 v49 = 2112;
      uint64_t v50 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to get IP address for accessory %@ because we don't have a connection", buf, 0x16u);
    }
    id v11 = 0;
  }

  id v21 = [v11 v4];
  if (v21)
  {

LABEL_13:
    id v24 = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
    id v25 = (void *)MEMORY[0x1D9452090]([(HMDNetworkRouterClientStatusIdentifier *)v24 setIpAddress:v11]);
    char v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = logDescriptionForAccessory(v8);
      *(_DWORD *)buf = 138543874;
      __int16 v48 = v28;
      __int16 v49 = 2112;
      uint64_t v50 = v29;
      __int16 v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Querying the router for the status of accessory %@ with %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v26);
    id v30 = [(HMDNetworkRouterClientManager *)v26 networkRouterAccessory];
    int v31 = [v30 uuid];

    id v32 = [(HMDNetworkRouterClientManager *)v26 routerController];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke;
    v40[3] = &unk_1E6A11E50;
    objc_copyWeak(&v44, (id *)buf);
    id v41 = v8;
    id v33 = v24;
    id v42 = v33;
    id v34 = v31;
    id v43 = v34;
    BOOL v45 = a4;
    [v32 getClientStatusWithIdentifier:v33 completion:v40];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);

    goto LABEL_16;
  }
  id v22 = [v11 v6];
  BOOL v23 = v22 == 0;

  if (!v23) {
    goto LABEL_13;
  }
  v35 = (void *)MEMORY[0x1D9452090]();
  uint64_t v36 = self;
  __int16 v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = HMFGetLogIdentifier();
    __int16 v39 = logDescriptionForAccessory(v8);
    *(_DWORD *)buf = 138543618;
    __int16 v48 = v38;
    __int16 v49 = 2112;
    uint64_t v50 = v39;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract any IP address for accessory %@", buf, 0x16u);
  }
LABEL_16:
}

void __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v8;
      id v11 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        goto LABEL_9;
      }
      id v12 = HMFGetLogIdentifier();
      id v13 = logDescriptionForAccessory(*(void **)(a1 + 32));
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      id v33 = v5;
      id v15 = "%{public}@Failed to get client status of accessory %@ with %@: %@";
      id v16 = v11;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 42;
    }
    else
    {
      if (v6)
      {
        id v19 = [WeakRetained workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke_38;
        block[3] = &unk_1E6A154B0;
        void block[4] = v8;
        id v22 = *(id *)(a1 + 32);
        id v23 = v6;
        id v24 = *(id *)(a1 + 48);
        char v25 = *(unsigned char *)(a1 + 64);
        dispatch_async(v19, block);

        goto LABEL_9;
      }
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v8;
      id v11 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      id v12 = HMFGetLogIdentifier();
      id v13 = logDescriptionForAccessory(*(void **)(a1 + 32));
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      id v15 = "%{public}@Router did not return client status for accessory %@ with %@ (accessory offline or not connected to router?)";
      id v16 = v11;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 32;
    }
    _os_log_impl(&dword_1D49D5000, v16, v17, v15, buf, v18);

    goto LABEL_6;
  }
LABEL_9:
}

uint64_t __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileClientConfigurationForAccessory:*(void *)(a1 + 40) clientStatus:*(void *)(a1 + 48) networkRouterUUID:*(void *)(a1 + 56) clientReconfigurationAllowed:*(unsigned __int8 *)(a1 + 64)];
}

- (void)_startManagingAccessory:(id)a3 initialHomeSetup:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = logDescriptionForAccessory(v9);
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      uint32_t v18 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Managing accessory %@ as a Network Router client", (uint8_t *)&v15, 0x16u);
    }
    [(HMDNetworkRouterClientManager *)v11 _registerForChangesToManagedAccessory:v9];
    [(HMDNetworkRouterClientManager *)v11 _updateOrCreateClientConfigurationForAccessory:v9 preferReconcile:1 clientReconfigurationAllowed:0];
  }
}

- (void)handleFirewallRulesUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMDNetworkRouterClientManager_handleFirewallRulesUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HMDNetworkRouterClientManager_handleFirewallRulesUpdated___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) home];
  uint64_t v3 = [v2 protectionMode];
  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v27 = a1;
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  char v26 = v2;
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v2 name];
      id v10 = [*(id *)(v27 + 40) userInfo];
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v8;
      __int16 v35 = 2112;
      uint64_t v36 = v9;
      __int16 v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling firewall rules update notification for home %@: %@", buf, 0x20u);
    }
    id v11 = [*(id *)(v27 + 40) userInfo];
    id v12 = objc_msgSend(v11, "hmf_setForKey:", @"HMDNotificationNetworkRouterFirewallRulesUpdatedAccessoriesKey");

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = [v2 accessories];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint32_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v18, "supportsNetworkProtection", v26))
          {
            uint64_t v19 = [v18 metadataIdentifier];
            if (v19)
            {
              uint64_t v20 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
              id v21 = [v19 productGroup];
              id v22 = [v19 productNumber];
              id v23 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v20 initWithProductGroup:v21 productNumber:v22 firmwareVersion:0];

              if (![v12 count] || objc_msgSend(v12, "containsObject:", v23)) {
                [*(id *)(v27 + 32) _updateOrCreateClientConfigurationForAccessory:v18 preferReconcile:0 clientReconfigurationAllowed:0];
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }
  }
  else
  {
    if (v7)
    {
      id v24 = HMFGetLogIdentifier();
      char v25 = [v26 name];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring firewall rules update since network protection is disabled for home %@", buf, 0x16u);
    }
  }
}

- (void)handleHomeNetworkProtectionChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HMDNetworkRouterClientManager_handleHomeNetworkProtectionChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDNetworkRouterClientManager_handleHomeNetworkProtectionChanged___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) networkRouterAccessory];
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = [v4 name];
        [v4 protectionMode];
        id v11 = HMNetworkProtectionModeAsString();
        id v12 = [v5 shortDescription];
        int v13 = 138544130;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        uint32_t v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Network protection for home %@ changed to %@. Network router Accessory: %@", (uint8_t *)&v13, 0x2Au);
      }
      if ([v5 isReachable]) {
        [*(id *)(a1 + 32) _updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:1];
      }
    }
  }
}

- (void)handleNetworkProtectionGroupProtectionChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HMDNetworkRouterClientManager_handleNetworkProtectionGroupProtectionChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__HMDNetworkRouterClientManager_handleNetworkProtectionGroupProtectionChanged___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F2C4A8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    id v6 = [*(id *)(a1 + 40) userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F2C488]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v5) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      id v11 = [*(id *)(a1 + 32) home];
      uint64_t v12 = [v11 protectionMode];
      int v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      __int16 v15 = HMFGetOSLogHandle();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v12 == 1)
      {
        if (v16)
        {
          __int16 v17 = HMFGetLogIdentifier();
          [v9 integerValue];
          uint32_t v18 = HMAccessoryNetworkProtectionModeAsString();
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v17;
          __int16 v35 = 2112;
          uint64_t v36 = v18;
          __int16 v37 = 2112;
          id v38 = v5;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating accessory network configurations because protection mode changed to %@ for network protection group %@", buf, 0x20u);
        }
        __int16 v19 = [v11 networkProtectionGroupRegistry];
        uint64_t v20 = [v19 accessoriesForGroupWithUUID:v5];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v30;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v30 != v24) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(*(id *)(a1 + 32), "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", *(void *)(*((void *)&v29 + 1) + 8 * v25++), 0, 1, (void)v29);
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v23);
        }
      }
      else
      {
        if (v16)
        {
          char v26 = HMFGetLogIdentifier();
          [v9 integerValue];
          uint64_t v27 = HMAccessoryNetworkProtectionModeAsString();
          long long v28 = HMNetworkProtectionModeAsString();
          *(_DWORD *)buf = 138544130;
          uint64_t v34 = v26;
          __int16 v35 = 2112;
          uint64_t v36 = v27;
          __int16 v37 = 2112;
          id v38 = v5;
          __int16 v39 = 2112;
          id v40 = v28;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring protection mode change to %@ for network protection group %@ because home network protection is %@", buf, 0x2Au);
        }
      }
    }
  }
}

- (void)handleNetworkProtectionGroupDeactivated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HMDNetworkRouterClientManager_handleNetworkProtectionGroupDeactivated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__HMDNetworkRouterClientManager_handleNetworkProtectionGroupDeactivated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F2C478]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) _unregisterForNetworkProtectionChangesToGroup:v6];
    id v5 = v6;
  }
}

- (void)handleNetworkProtectionGroupActivated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterClientManager_handleNetworkProtectionGroupActivated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDNetworkRouterClientManager_handleNetworkProtectionGroupActivated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F2C478]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) _registerForNetworkProtectionChangesToGroup:v6];
    id v5 = v6;
  }
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDNetworkRouterClientManager_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDNetworkRouterClientManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) accessoriesInReconfiguration];
      id v6 = [v4 uuid];
      int v7 = [v5 containsObject:v6];

      if (v7)
      {
        id v8 = (void *)MEMORY[0x1D9452090]();
        id v9 = *(id *)(a1 + 32);
        BOOL v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = HMFGetLogIdentifier();
          uint64_t v12 = logDescriptionForAccessory(v4);
          int v13 = 138543618;
          id v14 = v11;
          __int16 v15 = 2112;
          BOOL v16 = v12;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not reconciling client configuration for accessory %@ -- currently being reconfigured", (uint8_t *)&v13, 0x16u);
        }
      }
      else
      {
        [*(id *)(a1 + 32) _reconcileClientConfigurationForReachableAccessory:v4 clientReconfigurationAllowed:0];
      }
    }
  }
}

- (void)handleAccessoryFirmwareVersionUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterClientManager_handleAccessoryFirmwareVersionUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDNetworkRouterClientManager_handleAccessoryFirmwareVersionUpdated___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;

    if (v4 && [v4 supportsNetworkProtection])
    {
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = *(id *)(a1 + 32);
      int v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = HMFGetLogIdentifier();
        id v9 = logDescriptionForAccessory(v4);
        int v10 = 138543618;
        id v11 = v8;
        __int16 v12 = 2112;
        int v13 = v9;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling firmware version update for accessory %@", (uint8_t *)&v10, 0x16u);
      }
      [*(id *)(a1 + 32) _updateOrCreateClientConfigurationForAccessory:v4 preferReconcile:0 clientReconfigurationAllowed:1];
    }
  }
}

- (void)handleAccessoryRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    uint64_t v3 = [v2 objectForKey:@"HMDAccessoryNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    id v6 = [*(id *)(a1 + 32) networkRouterAccessory];
    int v7 = HMFEqualObjects();

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = *(id *)(a1 + 32);
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        __int16 v12 = logDescriptionForAccessory(v5);
        *(_DWORD *)buf = 138543618;
        long long v32 = v11;
        __int16 v33 = 2112;
        uint64_t v34 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping client manager due to removal of currently active network router accessory %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _stop];
    }
    else
    {
      int v13 = [v5 networkClientIdentifier];

      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      BOOL v16 = HMFGetOSLogHandle();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v17)
        {
          uint32_t v18 = HMFGetLogIdentifier();
          __int16 v19 = [v5 networkClientIdentifier];
          uint64_t v20 = logDescriptionForAccessory(v5);
          *(_DWORD *)buf = 138543874;
          long long v32 = v18;
          __int16 v33 = 2112;
          uint64_t v34 = v19;
          __int16 v35 = 2112;
          uint64_t v36 = v20;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing client configuration with identifier %@ from router for removed accessory %@", buf, 0x20u);
        }
        id v21 = [*(id *)(a1 + 32) routerController];
        uint64_t v22 = [v5 networkClientIdentifier];
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        uint64_t v27 = __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke_31;
        long long v28 = &unk_1E6A196E0;
        uint64_t v29 = *(void *)(a1 + 32);
        id v30 = v5;
        [v21 removeClientConfigurationWithClientIdentifier:v22 completion:&v25];
      }
      else
      {
        if (v17)
        {
          uint64_t v23 = HMFGetLogIdentifier();
          uint64_t v24 = logDescriptionForAccessory(v5);
          *(_DWORD *)buf = 138543618;
          long long v32 = v23;
          __int16 v33 = 2112;
          uint64_t v34 = v24;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@No saved client identifier on removed accessory %@", buf, 0x16u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_deregisterForChangesToManagedAccessory:", v5, v25, v26, v27, v28, v29);
    }
  }
}

void __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) networkClientIdentifier];
    int v9 = 138543874;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Remove client configuration with identifier %@ completed with error %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)handleAccessoryAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HMDNetworkRouterClientManager_handleAccessoryAdded___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDNetworkRouterClientManager_handleAccessoryAdded___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKey:@"HMDNotificationAddedAccessoryKey"];

    if ([v3 supportsNetworkProtection])
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = HMFGetLogIdentifier();
        id v8 = logDescriptionForAccessory(v3);
        int v14 = 138543618;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        BOOL v17 = v8;
        int v9 = "%{public}@Will manage new accessory %@ because it supports network protection";
LABEL_8:
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      int v10 = [v3 wiFiUniquePreSharedKey];

      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      BOOL v11 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v11)
        {
          __int16 v12 = HMFGetLogIdentifier();
          __int16 v13 = logDescriptionForAccessory(v3);
          int v14 = 138543618;
          uint64_t v15 = v12;
          __int16 v16 = 2112;
          BOOL v17 = v13;
          _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Will not manage new accessory %@", (uint8_t *)&v14, 0x16u);
        }
        goto LABEL_10;
      }
      if (v11)
      {
        int v7 = HMFGetLogIdentifier();
        id v8 = logDescriptionForAccessory(v3);
        int v14 = 138543618;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        BOOL v17 = v8;
        int v9 = "%{public}@Will manage new accessory %@ because it has a per-accessory credential";
        goto LABEL_8;
      }
    }

    [*(id *)(a1 + 32) _startManagingAccessory:v3 initialHomeSetup:0];
LABEL_10:
  }
}

- (void)_handleRouterAccessoryReachable:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDNetworkRouterClientManager *)self home];
  int v7 = [v6 isActiveNetworkRouterInitialSetupNeeded];
  BOOL v8 = [(HMDNetworkRouterClientManager *)self managedNetworkEnabled];
  int v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  int v12 = v8 & (v7 ^ 1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    int v14 = HMFBooleanToString();
    uint64_t v15 = logDescriptionForAccessory(v4);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Managed network enabled assume to be %@ for network router accessory %@", buf, 0x20u);
  }
  if (v12)
  {
    [(HMDNetworkRouterClientManager *)v10 _updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:0];
  }
  else
  {
    objc_initWeak((id *)buf, v10);
    __int16 v16 = [(HMDNetworkRouterClientManager *)v10 routerController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke;
    v17[3] = &unk_1E6A11E28;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v4;
    char v21 = v7;
    id v19 = v6;
    [v16 writeManagedNetworkEnable:1 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v9 = logDescriptionForAccessory(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      BOOL v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Managed network enable for network router accessory %@ completed with error: %@", buf, 0x20u);
    }
    int v10 = [v6 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke_30;
    block[3] = &unk_1E6A18708;
    void block[4] = v6;
    char v13 = *(unsigned char *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v10, block);
  }
}

void __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke_30(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) setManagedNetworkEnabled:1];
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = (void *)MEMORY[0x1D9452090](v2);
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Initial Home-level protection setup is required", buf, 0xCu);
    }
    [*(id *)(a1 + 40) setActiveNetworkRouterInitialSetupNeeded:0];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v7 = objc_msgSend(*(id *)(a1 + 32), "home", 0);
  BOOL v8 = [v7 accessories];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (shouldManageAccessory(v13)) {
          [*(id *)(a1 + 32) _startManagingAccessory:v13 initialHomeSetup:*(unsigned __int8 *)(a1 + 48)];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)handleRouterAccessoryReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDNetworkRouterClientManager_handleRouterAccessoryReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDNetworkRouterClientManager_handleRouterAccessoryReachable___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v5 = v3;

    id v4 = v5;
    if (v5)
    {
      [*(id *)(a1 + 32) _handleRouterAccessoryReachable:v5];
      id v4 = v5;
    }
  }
}

- (void)_stop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDNetworkRouterClientManager *)self started])
  {
    id v4 = [(HMDNetworkRouterClientManager *)self networkRouterAccessory];
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = logDescriptionForAccessory(v4);
      int v15 = 138543618;
      long long v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping network router client manager - active network router accessory %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v10 = [(HMDNetworkRouterClientManager *)v6 notificationCenter];
    [v10 removeObserver:v6];

    [(HMDNetworkRouterClientManager *)v6 setStarted:0];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      long long v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      long long v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already stopped", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_start
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDNetworkRouterClientManager *)self setStartPending:0];
  if ([(HMDNetworkRouterClientManager *)self started])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v44 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already started", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(HMDNetworkRouterClientManager *)self networkRouterAccessory];
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      char v13 = logDescriptionForAccessory(v8);
      *(_DWORD *)buf = 138543618;
      id v44 = v12;
      __int16 v45 = 2112;
      id v46 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting network router client manager with network router accessory %@", buf, 0x16u);
    }
    [(HMDNetworkRouterClientManager *)v10 __registerForNetworkRouterAccessoryReachable:v8];
    long long v14 = [(HMDNetworkRouterClientManager *)v10 home];
    if (v14)
    {
      int v15 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      [v15 addObserver:v10 selector:sel_handleAccessoryAdded_ name:@"HMDNotificationHomeAddedAccessory" object:v14];

      long long v16 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      [v16 addObserver:v10 selector:sel_handleAccessoryRemoved_ name:@"HMDHomeAccessoryRemovedNotification" object:v14];

      __int16 v17 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      [v17 addObserver:v10 selector:sel_handleHomeNetworkProtectionChanged_ name:@"HMDHomeNetworkProtectionUpdatedNotificationKey" object:v14];

      __int16 v18 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      [v18 addObserver:v10 selector:sel_handleFirewallRulesUpdated_ name:@"HMDNotificationNetworkRouterFirewallRulesUpdated" object:0];

      uint64_t v19 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      uint64_t v20 = [v14 networkProtectionGroupRegistry];
      [v19 addObserver:v10 selector:sel_handleNetworkProtectionGroupActivated_ name:@"HMDAccessoryNetworkProtectionGroupProtectionModeActivated" object:v20];

      uint64_t v21 = [(HMDNetworkRouterClientManager *)v10 notificationCenter];
      uint64_t v22 = [v14 networkProtectionGroupRegistry];
      [v21 addObserver:v10 selector:sel_handleNetworkProtectionGroupDeactivated_ name:@"HMDAccessoryNetworkProtectionGroupProtectionModeDeactivated" object:v22];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v23 = objc_msgSend(v14, "networkProtectionGroupRegistry", 0);
      __int16 v24 = [v23 activeGroups];

      uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            [(HMDNetworkRouterClientManager *)v10 _registerForNetworkProtectionChangesToGroup:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v26);
      }

      if ([v8 isReachable])
      {
        [(HMDNetworkRouterClientManager *)v10 _handleRouterAccessoryReachable:v8];
      }
      else
      {
        __int16 v33 = (void *)MEMORY[0x1D9452090]();
        uint64_t v34 = v10;
        __int16 v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          uint64_t v37 = [v8 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v44 = v36;
          __int16 v45 = 2112;
          id v46 = v37;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Network router: %@ is not reachable, waiting until it is", buf, 0x16u);
        }
      }
      [(HMDNetworkRouterClientManager *)v10 setStarted:1];
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = v10;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v44 = v32;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@No home to register for notifications on", buf, 0xCu);
      }
    }
  }
}

- (void)_resetStaleClientIdentifiersBeforeStart
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDNetworkRouterClientManager *)self started])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already started", buf, 0xCu);
    }
  }
  else
  {
    BOOL v8 = [(HMDNetworkRouterClientManager *)self staleClientIdentifiersResetInProgress];
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    id v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        char v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Stale network client identifiers reset is already in progress", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v14 = HMFGetLogIdentifier();
        int v15 = [(HMDNetworkRouterClientManager *)v10 home];
        long long v16 = [v15 name];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting stale network client identifiers for accessories in the home %@ before starting", buf, 0x16u);
      }
      [(HMDNetworkRouterClientManager *)v10 setStaleClientIdentifiersResetNeeded:0];
      [(HMDNetworkRouterClientManager *)v10 setStaleClientIdentifiersResetInProgress:1];
      [(HMDNetworkRouterClientManager *)v10 setStartPending:1];
      objc_initWeak((id *)buf, v10);
      __int16 v17 = [(HMDNetworkRouterClientManager *)v10 _transactionBlockForAccessoriesWithStaleClientIdentifier];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke;
      v18[3] = &unk_1E6A18528;
      objc_copyWeak(&v19, (id *)buf);
      [v17 run:v18];
      objc_destroyWeak(&v19);

      objc_destroyWeak((id *)buf);
    }
  }
}

void __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke_2;
    block[3] = &unk_1E6A19B30;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) setStaleClientIdentifiersResetInProgress:0]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) home];
    int v7 = [v6 name];
    [*(id *)(a1 + 32) staleClientIdentifiersResetNeeded];
    BOOL v8 = HMFBooleanToString();
    [*(id *)(a1 + 32) startPending];
    uint64_t v9 = HMFBooleanToString();
    int v13 = 138544130;
    long long v14 = v5;
    __int16 v15 = 2112;
    long long v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting stale network client identifiers completed for home %@, staleClientIdentifiersResetNeeded = %@, startPending = %@", (uint8_t *)&v13, 0x2Au);
  }
  int v10 = [*(id *)(a1 + 32) staleClientIdentifiersResetNeeded];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v10) {
    return [v11 _resetStaleClientIdentifiersBeforeStart];
  }
  uint64_t result = [v11 startPending];
  if (result) {
    return [*(id *)(a1 + 32) _start];
  }
  return result;
}

- (void)_evaluateManagement
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDNetworkRouterClientManager *)self home];
  [v4 isResidentSupported];
  int v5 = [v4 isCurrentDevicePrimaryResident];
  id v6 = [v4 primaryNetworkRouterManagingDeviceUUID];
  int v7 = (void *)MEMORY[0x1D9452090]();
  BOOL v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMFBooleanToString();
    id v12 = HMFBooleanToString();
    [(HMDNetworkRouterClientManager *)v8 started];
    int v13 = HMFBooleanToString();
    int v15 = 138544386;
    long long v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    __int16 v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Evaluating network router management responsibility. Resident Available: %@, Current Device Primary Resident: %@, Current Device Management Active: %@, Primary Managing Device: %@", (uint8_t *)&v15, 0x34u);
  }
  if (v6) {
    int v14 = 0;
  }
  else {
    int v14 = v5;
  }
  if (v14 == 1)
  {
    [(HMDNetworkRouterClientManager *)v8 _resetStaleClientIdentifiersBeforeStart];
  }
  else
  {
    [(HMDNetworkRouterClientManager *)v8 setStartPending:0];
    [(HMDNetworkRouterClientManager *)v8 _stop];
  }
}

- (void)__deregisterForNetworkRouterAccessoryReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v5 removeObserver:self name:@"HMDAccessoryIsReachableNotification" object:v4];
}

- (void)__registerForNetworkRouterAccessoryReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleRouterAccessoryReachable_ name:@"HMDAccessoryIsReachableNotification" object:v4];
}

- (HMDHome)home
{
  uint64_t v2 = [(HMDNetworkRouterClientManager *)self networkRouterAccessory];
  id v3 = [v2 home];

  return (HMDHome *)v3;
}

- (void)setNetworkRouterAccessory:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_networkRouterAccessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setStarted:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_started = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self firewallRuleManager];

  if (v5 == v4)
  {
    int v7 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v8 = [(HMDNetworkRouterClientManager *)self home];
    uint64_t v9 = [v8 accessories];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 supportsNetworkProtection])
          {
            int v15 = [v14 metadataIdentifier];
            if (v15) {
              [v7 addObject:v15];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    id v6 = (void *)[v7 copy];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (HMDNetworkRouterController)routerController
{
  uint64_t v2 = [(HMDNetworkRouterClientManager *)self networkRouterAccessory];
  id v3 = [v2 networkRouterController];

  return (HMDNetworkRouterController *)v3;
}

- (void)migrateAccessory:(id)a3 toCredentialType:(int64_t)a4 rotate:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(HMDNetworkRouterClientManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke;
  block[3] = &unk_1E6A11E00;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a4;
  BOOL v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, block);
}

void __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) started])
  {
    uint64_t v2 = [*(id *)(a1 + 40) networkClientIdentifier];
    if (v2)
    {
      uint64_t ProtectionModeForAccessory = getProtectionModeForAccessory(*(void **)(a1 + 40));
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_11;
      v21[3] = &unk_1E6A11DD8;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      id v24 = v6;
      void v21[4] = v7;
      id v22 = v2;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 56);
      id v23 = v8;
      uint64_t v25 = v9;
      char v26 = *(unsigned char *)(a1 + 64);
      [v4 _getNetworkConfigurationForAccessory:v5 targetProtectionMode:ProtectionModeForAccessory completion:v21];

      id v10 = v24;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = *(id *)(a1 + 32);
      int64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        BOOL v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Migration not possible, accessory has no existing client profile", buf, 0xCu);
      }
      uint64_t v20 = *(void *)(a1 + 48);
      id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v10);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Migration not possible, client manager is not running", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v2);
  }
}

void __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_2;
    block[3] = &unk_1E6A11DB0;
    id v13 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = v8;
    id v9 = *(id *)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    id v16 = v9;
    uint64_t v18 = v10;
    char v19 = *(unsigned char *)(a1 + 72);
    id v17 = v11;
    dispatch_async(v6, block);
  }
}

uint64_t __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setClientIdentifier:v2];

  return objc_msgSend(*(id *)(a1 + 48), "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", *(void *)(a1 + 56), *(void *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 56), "wiFiCredentialType"), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 64));
}

- (void)replaceActiveNetworkRouterAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterClientManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMDNetworkRouterClientManager_replaceActiveNetworkRouterAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__HMDNetworkRouterClientManager_replaceActiveNetworkRouterAccessory___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) networkRouterAccessory];
  if (HMFEqualObjects())
  {
    [*(id *)(a1 + 32) _evaluateManagement];
  }
  else
  {
    if (v2)
    {
      id v3 = [*(id *)(a1 + 40) home];
      [v2 home];
    }
    if (*(void *)(a1 + 40))
    {
      [*(id *)(a1 + 32) _stop];
      [*(id *)(a1 + 32) setNetworkRouterAccessory:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setManagedNetworkEnabled:0];
      if ([*(id *)(a1 + 32) staleClientIdentifiersResetInProgress]) {
        [*(id *)(a1 + 32) setStaleClientIdentifiersResetNeeded:1];
      }
      id v4 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) _evaluateManagement]);
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = logDescriptionForAccessory(*(void **)(a1 + 40));
        id v9 = logDescriptionForAccessory(v2);
        int v13 = 138543874;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = v9;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Activated network router accessory %@ - previous active network router accessory was %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to activate a nil network router accessory", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)stop
{
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMDNetworkRouterClientManager_stop__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__HMDNetworkRouterClientManager_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)evaluateManagement
{
  id v3 = [(HMDNetworkRouterClientManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDNetworkRouterClientManager_evaluateManagement__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__HMDNetworkRouterClientManager_evaluateManagement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateManagement];
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

- (HMDHAPAccessory)networkRouterAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkRouterAccessory);
  os_unfair_lock_unlock(p_lock);
  return (HMDHAPAccessory *)WeakRetained;
}

- (HMDNetworkRouterClientManager)initWithNetworkRouterAccessory:(id)a3 workQueue:(id)a4 firewallRuleManager:(id)a5 notificationCenter:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDNetworkRouterClientManager;
  id v14 = [(HMDNetworkRouterClientManager *)&v27 init];
  if (v14)
  {
    __int16 v15 = [v10 networkRouterController];

    if (!v15)
    {
      id v22 = 0;
      goto LABEL_8;
    }
    context = (void *)MEMORY[0x1D9452090]();
    id v16 = v14;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      uint64_t v18 = v25 = v11;
      logDescriptionForAccessory(v10);
      uint64_t v19 = v24 = v12;
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      long long v31 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Initializing with network router accessory %@", buf, 0x16u);

      id v12 = v24;
      id v11 = v25;
    }

    objc_storeWeak((id *)&v16->_networkRouterAccessory, v10);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_notificationCenter, a6);
    objc_storeStrong((id *)&v16->_firewallRuleManager, a5);
    *(_DWORD *)&v16->_started = 0x10000;
    v16->_startPending = 0;
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    accessoriesInReconfiguration = v16->_accessoriesInReconfiguration;
    v16->_accessoriesInReconfiguration = (NSMutableSet *)v20;
  }
  id v22 = v14;
LABEL_8:

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t79 != -1) {
    dispatch_once(&logCategory__hmf_once_t79, &__block_literal_global_78_136264);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v80;
  return v2;
}

uint64_t __44__HMDNetworkRouterClientManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v80;
  logCategory__hmf_once_id v80 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end