@interface HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator
+ (BOOL)ckUseAnonymousAccount;
+ (NSString)ckContainerIdentifier;
+ (id)__createProcessingOptionsWithLabel:(id)a3;
+ (id)__createProcessingOptionsWithLabel:(id)a3 qualityOfService:(int64_t)a4;
+ (id)__jsonFromDeclarations:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5;
+ (id)__jsonFromPairedMetadata:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5;
+ (id)__jsonFromRecords:(id)a3 validateWithPublicKeys:(id)a4 rawOutput:(BOOL)a5 error:(id *)a6;
+ (id)__jsonStringFromDictionary:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5;
+ (id)__jsonValueForCKRecordValue:(id)a3;
+ (id)__networkDeclarationDataDictionaryFromOverrideObjectDictionary:(id)a3;
+ (id)__networkDeclarationDataDictionaryFromRecordDictionary:(id)a3;
+ (id)__networkDeclarationsFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5;
+ (id)__pairedMetadataDataDictionaryFromRecordDictionary:(id)a3;
+ (id)__pairedMetadataDictionaryFromOverrideObjectDictionary:(id)a3;
+ (id)__pairedMetadataFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5;
+ (id)logCategory;
+ (int64_t)ckContainerEnvironment;
- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 error:(id *)a5;
- (BOOL)isRunning;
- (BOOL)removeAllLocalRulesWithError:(id *)a3;
- (BOOL)removeAllOverridesWithError:(id *)a3;
- (BOOL)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 error:(id *)a5;
- (HMBLocalZone)mirroredLocalZone;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)cloudFetchScheduler;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchInterval:(double)a5 cloudFetchRetryInterval:(double)a6 ownerQueue:(id)a7;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchScheduler:(id)a5 ownerQueue:(id)a6;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 ownerQueue:(id)a5;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)mirror;
- (HMDNetworkRouterFirewallRuleManagerInternal)firewallRuleManager;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)ownerQueue;
- (id)_fetchAllDataForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_fetchAllOverridesForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_fetchNetworkDeclarationsForRecordIDs:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6;
- (id)_fetchPairedMetadataForAccessories:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6;
- (id)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8;
- (id)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8;
- (id)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6;
- (id)pairedMetadataVersionConfigurationForAccessory:(id)a3 pairedMetadata:(id)a4;
- (id)ruleConfigurationForAccessory:(id)a3 declarations:(id)a4;
- (void)__cloudFetchSchedulerFired:(id)a3;
- (void)__maybeStartOrStopCloudFetchScheduler;
- (void)__startupWithMirror:(id)a3 completion:(id)a4;
- (void)__startupWithMirroredLocalZone:(id)a3 completion:(id)a4;
- (void)__stopCloudFetchScheduler;
- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7;
- (void)_fetchCloudChangesIfNeededForRecordIDs:(id)a3 completion:(id)a4;
- (void)_fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 requiredRecordIDs:(id)a6 schedulerXpcActivity:(id)a7 completion:(id)a8;
- (void)_listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5;
- (void)cloudFetchSchedulerFired:(id)a3 completion:(id)a4;
- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8;
- (void)fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 completion:(id)a6;
- (void)fetchRulesForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 completion:(id)a6;
- (void)firewallRuleManagerClientsDidChange;
- (void)setMirror:(id)a3;
- (void)setMirroredLocalZone:(id)a3;
- (void)shutdownWithCompletion:(id)a3;
- (void)startupWithLocalDatabase:(id)a3 completion:(id)a4;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, 0);
  objc_storeStrong((id *)&self->_ownerQueue, 0);
  objc_storeStrong((id *)&self->_cloudFetchScheduler, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mirror, 0);
  objc_destroyWeak((id *)&self->_firewallRuleManager);
}

- (void)setMirroredLocalZone:(id)a3
{
}

- (HMBLocalZone)mirroredLocalZone
{
  return self->_mirroredLocalZone;
}

- (OS_dispatch_queue)ownerQueue
{
  return self->_ownerQueue;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)cloudFetchScheduler
{
  return self->_cloudFetchScheduler;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDNetworkRouterFirewallRuleManagerInternal)firewallRuleManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firewallRuleManager);
  return (HMDNetworkRouterFirewallRuleManagerInternal *)WeakRetained;
}

- (void)cloudFetchSchedulerFired:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_cloudFetchSchedulerFired_completion___block_invoke;
  v8[3] = &unk_264A2F870;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_cloudFetchSchedulerFired_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__cloudFetchSchedulerFired:", *(void *)(a1 + 40));
}

- (void)__cloudFetchSchedulerFired:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Cloud fetch scheduler fired", buf, 0xCu);
  }
  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v7 isRunning])
  {
    v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v7 cloudFetchScheduler];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      v13 = [v12 runningActivity];
    }
    else
    {
      v13 = 0;
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___cloudFetchSchedulerFired___block_invoke;
    v14[3] = &unk_264A26250;
    v14[4] = v7;
    id v15 = v4;
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v7 _fetchCloudChangesWithQualityOfService:9 ignoreLastFetchedAccessories:1 forceChangeNotifications:0 requiredRecordIDs:0 schedulerXpcActivity:v13 completion:v14];
  }
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___cloudFetchSchedulerFired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched cloud changes with poll timer: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud changes with poll timer: %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v13 = [*(id *)(a1 + 32) firewallRuleManager];
  [v13 didCompleteScheduledCloudFetch];
}

- (void)__stopCloudFetchScheduler
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconditionally stopping cloud fetch scheduler", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v5 cloudFetchScheduler];
  [v8 stop];
}

- (void)__maybeStartOrStopCloudFetchScheduler
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = &v23;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self firewallRuleManager];
    id v5 = [v4 activeClients];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __99__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___maybeStartOrStopCloudFetchScheduler__block_invoke;
    v20[3] = &unk_264A23568;
    v20[4] = &v23;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    id v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self cloudFetchScheduler];
    id v7 = v6;
    if (!*(unsigned char *)(*((void *)&v23 + 1) + 24)) {
      goto LABEL_18;
    }
    if (([v6 isRunning] & 1) == 0)
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      HMFGetOSLogHandle();
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v22 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting cloud fetch scheduler", buf, 0xCu);
      }
      [v7 start];
      goto LABEL_15;
    }
    if (!*(unsigned char *)(*((void *)&v23 + 1) + 24))
    {
LABEL_18:
      if ([v7 isRunning])
      {
        id v8 = (void *)MEMORY[0x230FBD990]();
        int v9 = self;
        HMFGetOSLogHandle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping cloud fetch scheduler", buf, 0xCu);
        }
        [v7 stop];
      }
    }
LABEL_15:

    _Block_object_dispose(&v23, 8);
    return;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = HMFGetLogIdentifier();
    LODWORD(v23) = 138543362;
    *(void *)((char *)&v23 + 4) = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not starting cloud fetch scheduler because we should not be running", (uint8_t *)&v23, 0xCu);
  }
}

uint64_t __99__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___maybeStartOrStopCloudFetchScheduler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 error:(id *)a5
{
  id v8 = (__CFString *)a4;
  id v9 = a3;
  v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = @"00000000";
  }
  v13 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v11 initWithProductGroup:v9 productNumber:v12 firmwareVersion:0];

  int v14 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v13 cloudKitZoneName];
  if (v8)
  {
    id v8 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v13 cloudKitRecordName];
  }

  id v15 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"RemoveOverrides");
  __int16 v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  char v17 = [v16 removeOverridesForZoneName:v14 recordName:v8 options:v15 error:a5];

  return v17;
}

- (BOOL)removeAllOverridesWithError:(id *)a3
{
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"RemoveAllOverrides");
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  LOBYTE(a3) = [v7 removeAllOverridesWithOptions:v6 error:a3];

  return (char)a3;
}

- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__172893;
  char v25 = __Block_byref_object_dispose__172894;
  id v26 = 0;
  v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_addOverrides_replace_error___block_invoke;
  v18[3] = &unk_264A23540;
  v18[4] = self;
  v20 = &v21;
  id v11 = v10;
  id v19 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:v18];
  id v12 = (void *)v22[5];
  if (v12)
  {
    char v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    int v14 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"AddOverrides");
    id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    __int16 v16 = (void *)[v11 copy];
    char v13 = [v15 addOverrides:v16 replace:v6 options:v14 error:a5];
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_addOverrides_replace_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v7 firmwareVersion];

  if (v9)
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = HMFGetLogIdentifier();
      int v26 = 138543618;
      v27 = v13;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Firmware version specified on %@", (uint8_t *)&v26, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
  else
  {
    char v17 = [v7 cloudKitRecordID];
    uint64_t v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];

    if (v18)
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        int v26 = 138543618;
        v27 = v22;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Multiple declarations given for the same identifier %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      char v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      *a4 = 1;
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v17];
    }
  }
}

- (id)_fetchAllOverridesForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v13);

  if (v10 && v11)
  {
    uint64_t v14 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v10 productNumber:v11 firmwareVersion:0];
    uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    __int16 v16 = (void *)MEMORY[0x263EFFA08];
    char v17 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 cloudKitRecordID];
    uint64_t v18 = [v16 setWithObject:v17];
    id v19 = [v15 fetchOverridesForRecordIDs:v18 options:v12 error:a6];

LABEL_6:
    goto LABEL_8;
  }
  if (v10)
  {
    uint64_t v14 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v10 productNumber:@"00000000" firmwareVersion:0];
    uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    id v20 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 cloudKitZoneName];
    id v19 = [v15 fetchOverridesForZoneName:v20 options:v12 error:a6];

    goto LABEL_6;
  }
  uint64_t v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  id v19 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 fetchAllOverridesWithOptions:v12 error:a6];
LABEL_8:

  return v19;
}

- (id)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  __int16 v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v16);

  if (!v14 || [v14 length])
  {
    if (v15)
    {
      uint64_t v17 = [v15 length];
      if (v14 && v17)
      {
LABEL_6:
        uint64_t v18 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"DumpLocalPairedMetadata");
        id v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchAllDataForProductGroup:v14 productNumber:v15 options:v18 error:a8];
        uint64_t v20 = objc_msgSend((id)objc_opt_class(), "__pairedMetadataDataDictionaryFromRecordDictionary:", v19);
        if (!v20)
        {
          char v25 = 0;
LABEL_20:

          goto LABEL_21;
        }
        uint64_t v21 = (void *)v20;
        if (!a6)
        {
          uint64_t v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchAllOverridesForProductGroup:v14 productNumber:v15 options:v18 error:a8];
          if (!v22)
          {
            char v25 = 0;
            goto LABEL_19;
          }
          uint64_t v23 = (void *)v22;
          uint64_t v24 = objc_msgSend((id)objc_opt_class(), "__pairedMetadataDictionaryFromOverrideObjectDictionary:", v22);
          if ([v24 count])
          {
            v27 = (void *)[v21 mutableCopy];
            [v27 addEntriesFromDictionary:v24];

            uint64_t v21 = v27;
          }
        }
        char v25 = objc_msgSend((id)objc_opt_class(), "__jsonFromPairedMetadata:rawOutput:error:", v21, v9, a8);
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
  }
  if (a8)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    char v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v25 = 0;
  }
LABEL_21:

  return v25;
}

- (BOOL)removeAllLocalRulesWithError:(id *)a3
{
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"RemoveAllLocalRules");
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  LOBYTE(a3) = [v7 removeAllLocalRulesWithOptions:v6 error:a3];

  return (char)a3;
}

- (id)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  __int16 v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v16);

  if (!v14 || [v14 length])
  {
    if (v15)
    {
      uint64_t v17 = [v15 length];
      if (v14 && v17)
      {
LABEL_6:
        uint64_t v18 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"DumpLocalRules");
        id v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchAllDataForProductGroup:v14 productNumber:v15 options:v18 error:a8];
        uint64_t v20 = objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromRecordDictionary:", v19);
        if (!v20)
        {
          char v25 = 0;
LABEL_20:

          goto LABEL_21;
        }
        uint64_t v21 = (void *)v20;
        if (!a6)
        {
          uint64_t v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchAllOverridesForProductGroup:v14 productNumber:v15 options:v18 error:a8];
          if (!v22)
          {
            char v25 = 0;
            goto LABEL_19;
          }
          uint64_t v23 = (void *)v22;
          uint64_t v24 = objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromOverrideObjectDictionary:", v22);
          if ([v24 count])
          {
            v27 = (void *)[v21 mutableCopy];
            [v27 addEntriesFromDictionary:v24];

            uint64_t v21 = v27;
          }
        }
        char v25 = objc_msgSend((id)objc_opt_class(), "__jsonFromDeclarations:rawOutput:error:", v21, v9, a8);
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
  }
  if (a8)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    char v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v25 = 0;
  }
LABEL_21:

  return v25;
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  uint64_t v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v17);

  if (v14 && ![v14 length]) {
    goto LABEL_9;
  }
  if (v15)
  {
    uint64_t v18 = [v15 length];
    if (!v14 || !v18)
    {
LABEL_9:
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      uint64_t v20 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __155__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
      v22[3] = &unk_264A2F870;
      id v23 = v19;
      id v24 = v16;
      id v21 = v19;
      dispatch_async(v20, v22);

      goto LABEL_13;
    }
  }
  else if (!v14 && !v10)
  {
    goto LABEL_9;
  }
  if (v10) {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _listCloudRecordsForProductGroup:v14 rawOutput:v11 completion:v16];
  }
  else {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _dumpCloudRecordsForProductGroup:v14 productNumber:v15 rawOutput:v11 verifySignatures:v9 completion:v16];
  }
LABEL_13:
}

uint64_t __155__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v12 = (__CFString *)a4;
  id v13 = a7;
  id v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = @"00000000";
  }
  uint64_t v17 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v15 initWithProductGroup:v35 productNumber:v16 firmwareVersion:0];
  uint64_t v18 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v17 cloudKitRecordID];
  id v19 = [v18 zoneID];
  if (!v12)
  {

    uint64_t v18 = 0;
  }

  uint64_t v20 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"DumpCloudRecords");
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__172893;
  v47[4] = __Block_byref_object_dispose__172894;
  id v48 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke;
  aBlock[3] = &unk_264A234F0;
  aBlock[4] = self;
  id v21 = v19;
  id v41 = v21;
  id v22 = v18;
  id v42 = v22;
  id v23 = v20;
  id v43 = v23;
  id v24 = v13;
  id v44 = v24;
  v45 = v47;
  BOOL v46 = a5;
  char v25 = _Block_copy(aBlock);
  int v26 = v25;
  if (a6)
  {
    v27 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v28 = v27;
    }
    else {
      __int16 v28 = 0;
    }
    id v29 = v28;

    if (v29)
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_201;
      v36[3] = &unk_264A23518;
      v39 = v47;
      v36[4] = self;
      id v37 = v24;
      id v38 = v26;
      [v29 fetchVerificationCertificatesRecordWithOperationGroup:0 completion:v36];

      uint64_t v30 = v37;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@No idea how to validate signatures on another mirror class", buf, 0xCu);
      }
      uint64_t v30 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      (*((void (**)(id, void, void *))v24 + 2))(v24, 0, v30);
    }
  }
  else
  {
    (*((void (**)(void *))v25 + 2))(v25);
  }

  _Block_object_dispose(v47, 8);
}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mirror];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_2;
  v7[3] = &unk_264A234C8;
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 72);
  char v10 = *(unsigned char *)(a1 + 80);
  [v2 fetchCloudRecordsForZoneID:v3 recordID:v4 options:v5 completion:v7];
}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror publicKeysFromCertificateRecord:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    id v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = HMFGetLogIdentifier();
        uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
        id v16 = v11;
        if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] == 1) {
          uint64_t v17 = "";
        }
        else {
          uint64_t v17 = "s";
        }
        uint64_t v18 = [v5 recordID];
        id v19 = [v18 hmbDescription];
        *(_DWORD *)buf = 138544130;
        v27 = v15;
        __int16 v28 = 2048;
        uint64_t v29 = v25;
        __int16 v30 = 2080;
        v31 = v17;
        BOOL v11 = v16;
        __int16 v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Found %lu valid public key%s in record %@", buf, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        id v21 = [v5 recordID];
        id v22 = [v21 hmbDescription];
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v22;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@No valid public keys found in record %@", buf, 0x16u);
      }
      uint64_t v23 = *(void *)(a1 + 40);
      id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_opt_class();
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    id v11 = 0;
    uint64_t v9 = objc_msgSend(v6, "__jsonFromRecords:validateWithPublicKeys:rawOutput:error:", v5, v7, v8, &v11);
    id v10 = v11;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    id v11 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v8 productNumber:@"00000000" firmwareVersion:0];
    id v12 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v11 cloudKitRecordID];
    id v13 = [v12 zoneID];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", @"ListCloudRecords");
  id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __116__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__listCloudRecordsForProductGroup_rawOutput_completion___block_invoke;
  v17[3] = &unk_264A234A0;
  BOOL v19 = a4;
  v17[4] = self;
  id v18 = v9;
  id v16 = v9;
  [v15 fetchCloudRecordIDsForZoneID:v13 options:v14 completion:v17];
}

void __116__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__listCloudRecordsForProductGroup_rawOutput_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "zoneID", v27);
          id v12 = [v11 zoneName];

          id v13 = [v10 recordName];
          if (!*(unsigned char *)(a1 + 48))
          {
            id v14 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v10];
            uint64_t v15 = [v14 productGroup];

            uint64_t v16 = [v14 productNumber];

            id v13 = (void *)v16;
            id v12 = (void *)v15;
          }
          uint64_t v17 = [v4 objectForKeyedSubscript:v12];
          if (!v17)
          {
            uint64_t v17 = [MEMORY[0x263EFF980] array];
            [v4 setObject:v17 forKeyedSubscript:v12];
          }
          [v17 addObject:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = [v4 allValues];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "sortUsingSelector:", sel_compare_, v27);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = *(unsigned __int8 *)(a1 + 48);
    id v28 = 0;
    uint64_t v25 = objc_msgSend(v23, "__jsonStringFromDictionary:rawOutput:error:", v4, v24, &v28);
    id v26 = v28;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v3 = v27;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_fetchCloudChangesIfNeededForRecordIDs:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  id v19 = 0;
  id v10 = [v9 cloudFetchNeededForRecordIDs:v6 error:&v19];
  id v11 = v19;

  if (v10)
  {
    if ([v10 BOOLValue])
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cloud fetch is needed for (some of) %@", buf, 0x16u);
      }
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesIfNeededForRecordIDs_completion___block_invoke;
      v17[3] = &unk_264A253E8;
      id v18 = v7;
      [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v13 _fetchCloudChangesWithQualityOfService:17 ignoreLastFetchedAccessories:0 forceChangeNotifications:0 requiredRecordIDs:v6 schedulerXpcActivity:0 completion:v17];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else if (v11)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesIfNeededForRecordIDs_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  if (a2)
  {
    id v7 = 0;
LABEL_4:
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    goto LABEL_5;
  }
  id v7 = v5;
  if (v5) {
    goto LABEL_4;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

LABEL_5:
}

- (id)ruleConfigurationForAccessory:(id)a3 declarations:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v53 = self;
  uint64_t v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  v58 = [v6 firmwareVersion];
  if (!v58)
  {
    BOOL v46 = (void *)MEMORY[0x230FBD990]();
    v47 = self;
    id v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v64 = v49;
      __int16 v65 = 2112;
      id v66 = v6;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have firmware version on %@", buf, 0x16u);
    }
    v50 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must have firmware version on %@", v6];
    uint64_t v51 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v51 submitLogEvent:v50];
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v52 = v7;
  obuint64_t j = [v7 ruleConfigurations];
  uint64_t v57 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (!v57)
  {
    id v55 = 0;
    id v9 = 0;
    goto LABEL_36;
  }
  id v9 = 0;
  id v55 = 0;
  uint64_t v56 = *(void *)v60;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v60 != v56) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v59 + 1) + 8 * v10);
      id v12 = [v11 accessoryIdentifier];
      id v13 = [v12 productGroup];
      id v14 = [v6 productGroup];
      if ([v13 isEqualToString:v14])
      {
        uint64_t v15 = [v12 productNumber];
        uint64_t v16 = [v6 productNumber];
        char v17 = [v15 isEqualToString:v16];

        if (v17) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = v53;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v64 = v21;
        __int16 v65 = 2112;
        id v66 = v12;
        __int16 v67 = 2112;
        id v68 = v6;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Rule configuration contains identifier %@ that does not match requested identifier %@", buf, 0x20u);
      }
      __int16 v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"Rule configuration contains identifier %@ that does not match requested identifier %@", v12, v6];
      id v23 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v23 submitLogEvent:v22];

LABEL_12:
      uint64_t v24 = [v11 accessoryIdentifier];
      uint64_t v25 = [v24 firmwareVersion];

      uint64_t v26 = [v25 compare:v58];
      if (v26 == -1)
      {
        if (v9)
        {
          long long v33 = [v9 accessoryIdentifier];
          long long v34 = [v33 firmwareVersion];
          uint64_t v35 = [v25 compare:v34];

          if (v35 != 1)
          {
            if (v35) {
              goto LABEL_29;
            }
            long long v30 = (void *)MEMORY[0x230FBD990]();
            long long v31 = v53;
            long long v32 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
              goto LABEL_24;
            }
LABEL_23:
            long long v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v64 = v36;
            __int16 v65 = 2112;
            id v66 = v12;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple rule configurations with the same version for %@", buf, 0x16u);

LABEL_24:
            id v37 = [[HMDAssertionLogEvent alloc] initWithReason:@"Multiple rule configurations with the same version for %@", v12];
            id v38 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v38 submitLogEvent:v37];

            goto LABEL_29;
          }
          id v40 = v11;

          id v9 = v40;
        }
        else
        {
          id v9 = v11;
        }
      }
      else
      {
        if (!v26)
        {
          id v42 = v11;

          id v43 = v55;
          goto LABEL_40;
        }
        if (v55)
        {
          id v27 = [v55 accessoryIdentifier];
          id v28 = [v27 firmwareVersion];
          uint64_t v29 = [v25 compare:v28];

          if (v29 != -1)
          {
            if (v29) {
              goto LABEL_29;
            }
            long long v30 = (void *)MEMORY[0x230FBD990]();
            long long v31 = v53;
            long long v32 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
              goto LABEL_24;
            }
            goto LABEL_23;
          }
          id v39 = v11;

          id v55 = v39;
        }
        else
        {
          id v55 = v11;
        }
      }
LABEL_29:

      ++v10;
    }
    while (v57 != v10);
    uint64_t v41 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    uint64_t v57 = v41;
  }
  while (v41);
LABEL_36:

  id v43 = v55;
  if (v9) {
    id v44 = v9;
  }
  else {
    id v44 = v55;
  }
  id v42 = v44;
LABEL_40:

  return v42;
}

- (void)fetchRulesForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 completion:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v11);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        char v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v18 = [v17 firmwareVersion];

        if (!v18)
        {
          id v28 = (void *)MEMORY[0x230FBD990]();
          uint64_t v29 = self;
          long long v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v49 = v31;
            __int16 v50 = 2112;
            uint64_t v51 = v17;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Firmware version not specified on %@", buf, 0x16u);
          }
          id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          v10[2](v10, 0, v27);
          id v26 = v12;
          goto LABEL_20;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v19 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v12, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v39 + 1) + 8 * j) cloudKitRecordID];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v22);
  }

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __131__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchRulesForAccessories_qualityOfService_ignoreOverrides_completion___block_invoke;
  v33[3] = &unk_264A29A08;
  long long v36 = v10;
  int64_t v37 = a4;
  v33[4] = self;
  id v34 = v19;
  BOOL v38 = a5;
  id v35 = v20;
  id v26 = v19;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchCloudChangesIfNeededForRecordIDs:v26 completion:v33];

  id v27 = v36;
LABEL_20:
}

void __131__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchRulesForAccessories_qualityOfService_ignoreOverrides_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", @"FetchRules", *(void *)(a1 + 64));
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    id v68 = 0;
    uint64_t v8 = [v5 _fetchNetworkDeclarationsForRecordIDs:v6 options:v4 ignoreOverrides:v7 error:&v68];
    id v9 = v68;
    if (v8)
    {
      uint64_t v56 = a1;
      if ([v8 count])
      {
        id v51 = v9;
        uint64_t v53 = v4;
        uint64_t v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v52 = v8;
        obuint64_t j = v8;
        uint64_t v11 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v65 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              uint64_t v16 = [v15 baseAccessoryIdentifier];
              char v17 = [v10 objectForKeyedSubscript:v16];

              if (v17)
              {
                id v18 = (void *)MEMORY[0x230FBD990]();
                id v19 = *(id *)(v56 + 32);
                id v20 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v21 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v70 = v21;
                  __int16 v71 = 2112;
                  v72 = v16;
                  _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@More than one rule configuration for %@", buf, 0x16u);
                }
              }
              [v10 setObject:v15 forKeyedSubscript:v16];
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
          }
          while (v12);
        }

        uint64_t v22 = v56;
        v54 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(*(id *)(v56 + 48), "count"));
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v55 = *(id *)(v56 + 48);
        id obja = (id)[v55 countByEnumeratingWithState:&v60 objects:v75 count:16];
        if (obja)
        {
          uint64_t v57 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v61 != v57) {
                objc_enumerationMutation(v55);
              }
              uint64_t v24 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
              uint64_t v25 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
              id v26 = [v24 productGroup];
              id v27 = [v24 productNumber];
              id v28 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v25 initWithProductGroup:v26 productNumber:v27 firmwareVersion:0];

              uint64_t v29 = [v10 objectForKeyedSubscript:v28];
              if (v29)
              {
                long long v30 = [*(id *)(v22 + 32) ruleConfigurationForAccessory:v24 declarations:v29];
                long long v31 = (void *)MEMORY[0x230FBD990]();
                id v32 = *(id *)(v22 + 32);
                long long v33 = HMFGetOSLogHandle();
                BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
                if (v30)
                {
                  if (v34)
                  {
                    id v35 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    uint64_t v70 = v35;
                    __int16 v71 = 2112;
                    v72 = v24;
                    __int16 v73 = 2112;
                    v74 = v30;
                    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Found rule configuration for %@: %@", buf, 0x20u);

                    uint64_t v22 = v56;
                  }

                  [v54 addObject:v30];
                }
                else
                {
                  if (v34)
                  {
                    long long v40 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    uint64_t v70 = v40;
                    __int16 v71 = 2112;
                    v72 = v24;
                    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEBUG, "%{public}@No declaration for %@", buf, 0x16u);

                    uint64_t v22 = v56;
                  }
                }
              }
              else
              {
                long long v36 = (void *)MEMORY[0x230FBD990]();
                id v37 = *(id *)(v22 + 32);
                BOOL v38 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  long long v39 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v70 = v39;
                  __int16 v71 = 2112;
                  v72 = v24;
                  _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No declarations for %@", buf, 0x16u);
                }
              }
            }
            id obja = (id)[v55 countByEnumeratingWithState:&v60 objects:v75 count:16];
          }
          while (obja);
        }

        uint64_t v41 = *(void *)(v22 + 56);
        long long v42 = (void *)[v54 copy];
        (*(void (**)(uint64_t, void *, void))(v41 + 16))(v41, v42, 0);

        uint64_t v4 = v53;
        id v3 = 0;
        id v9 = v51;
        uint64_t v8 = v52;
      }
      else
      {
        long long v43 = v8;
        long long v44 = (void *)MEMORY[0x230FBD990]();
        id v45 = *(id *)(v56 + 32);
        long long v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v47 = HMFGetLogIdentifier();
          id v48 = *(void **)(v56 + 48);
          *(_DWORD *)buf = 138543618;
          uint64_t v70 = v47;
          __int16 v71 = 2112;
          v72 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@No declarations for %@", buf, 0x16u);
        }
        uint64_t v49 = *(void *)(v56 + 56);
        __int16 v50 = [MEMORY[0x263EFFA08] set];
        (*(void (**)(uint64_t, void *, void))(v49 + 16))(v49, v50, 0);

        uint64_t v8 = v43;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (id)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v10 = a3;
  __int16 v73 = self;
  uint64_t v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v11);

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v85 objects:v97 count:16];
  obuint64_t j = v12;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v86;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v86 != v15) {
          objc_enumerationMutation(obj);
        }
        char v17 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        id v18 = [v17 firmwareVersion];

        if (!v18)
        {
          v54 = (void *)MEMORY[0x230FBD990]();
          id v55 = v73;
          uint64_t v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v92 = v57;
            __int16 v93 = 2112;
            id v94 = v17;
            _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Firmware version not specified on %@", buf, 0x16u);
          }
          id v12 = obj;
          if (a6)
          {
            [MEMORY[0x263F087E8] hmErrorWithCode:3];
            uint64_t v53 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v53 = 0;
          }
          id v19 = obj;
          goto LABEL_55;
        }
      }
      id v12 = obj;
      uint64_t v14 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v19 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", @"FetchPairedMetadata", a4);
  id v20 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v73 _fetchPairedMetadataForAccessories:v12 options:v19 ignoreOverrides:v7 error:a6];
  uint64_t v21 = v20;
  if (v20)
  {
    if ([v20 count])
    {
      v69 = v19;
      uint64_t v22 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v68 = v21;
      id v75 = v21;
      uint64_t v23 = [v75 countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v82 != v25) {
              objc_enumerationMutation(v75);
            }
            id v27 = *(void **)(*((void *)&v81 + 1) + 8 * j);
            id v28 = [v27 baseAccessoryIdentifier];
            uint64_t v29 = [v22 objectForKeyedSubscript:v28];

            if (v29)
            {
              long long v30 = (void *)MEMORY[0x230FBD990]();
              long long v31 = v73;
              id v32 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                long long v33 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v92 = v33;
                __int16 v93 = 2112;
                id v94 = v28;
                _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@More than one rule configuration for %@", buf, 0x16u);
              }
            }
            [v22 setObject:v27 forKeyedSubscript:v28];
          }
          uint64_t v24 = [v75 countByEnumeratingWithState:&v81 objects:v90 count:16];
        }
        while (v24);
      }

      __int16 v71 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(obj, "count"));
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v72 = obj;
      BOOL v34 = v73;
      id v76 = (id)[v72 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v76)
      {
        uint64_t v74 = *(void *)v78;
        do
        {
          for (k = 0; k != v76; k = (char *)k + 1)
          {
            if (*(void *)v78 != v74) {
              objc_enumerationMutation(v72);
            }
            long long v36 = *(void **)(*((void *)&v77 + 1) + 8 * (void)k);
            id v37 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
            BOOL v38 = [v36 productGroup];
            long long v39 = [v36 productNumber];
            long long v40 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v37 initWithProductGroup:v38 productNumber:v39 firmwareVersion:0];

            uint64_t v41 = [v22 objectForKeyedSubscript:v40];
            if (v41)
            {
              long long v42 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v34 pairedMetadataVersionConfigurationForAccessory:v36 pairedMetadata:v41];
              long long v43 = (void *)MEMORY[0x230FBD990]();
              long long v44 = v34;
              id v45 = HMFGetOSLogHandle();
              BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
              if (v42)
              {
                if (v46)
                {
                  v47 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v92 = v47;
                  __int16 v93 = 2112;
                  id v94 = v36;
                  __int16 v95 = 2112;
                  id v96 = v42;
                  _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Found pairedMetadata version configuration for %@: %@", buf, 0x20u);

                  BOOL v34 = v73;
                }

                [v71 addObject:v42];
              }
              else
              {
                if (v46)
                {
                  v52 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v92 = v52;
                  __int16 v93 = 2112;
                  id v94 = v36;
                  _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEBUG, "%{public}@No pairedMetadata version configuration for %@", buf, 0x16u);

                  BOOL v34 = v73;
                }
              }
            }
            else
            {
              id v48 = (void *)MEMORY[0x230FBD990]();
              uint64_t v49 = v34;
              __int16 v50 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                id v51 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v92 = v51;
                __int16 v93 = 2112;
                id v94 = v36;
                _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_DEBUG, "%{public}@No pairedMetadata present for %@", buf, 0x16u);
              }
            }
          }
          id v76 = (id)[v72 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v76);
      }

      uint64_t v53 = (void *)[v71 copy];
      id v19 = v69;
      id v12 = obj;
      uint64_t v21 = v68;
    }
    else
    {
      long long v63 = (void *)MEMORY[0x230FBD990]();
      long long v64 = v73;
      long long v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        long long v66 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        __int16 v93 = 2112;
        id v94 = v12;
        _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@No pairedMetadata present for %@", buf, 0x16u);
      }
      uint64_t v53 = [MEMORY[0x263EFFA08] set];
    }
  }
  else
  {
    v58 = (void *)MEMORY[0x230FBD990]();
    long long v59 = v73;
    long long v60 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      long long v61 = HMFGetLogIdentifier();
      id v62 = *a6;
      *(_DWORD *)buf = 138543874;
      v92 = v61;
      __int16 v93 = 2112;
      id v94 = v12;
      __int16 v95 = 2112;
      id v96 = v62;
      _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Nil pairedMetadata for %@ with error %@", buf, 0x20u);
    }
    uint64_t v53 = 0;
  }

LABEL_55:
  return v53;
}

- (id)_fetchPairedMetadataForAccessories:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v10, "count"));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v86 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = [*(id *)(*((void *)&v85 + 1) + 8 * i) cloudKitRecordID];
        [v13 addObject:v18];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
    }
    while (v15);
  }

  id v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  id v84 = 0;
  uint64_t v70 = [v19 fetchAllDataForRecordIDs:v13 options:v11 error:&v84];
  id v20 = (__CFString *)v84;

  if (v20)
  {
    if (a6) {
      *a6 = v20;
    }
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v90 = (uint64_t)v24;
      __int16 v91 = 2112;
      v92 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Fetch paired metadata for record failed with error %@", buf, 0x16u);
    }
    uint64_t v25 = 0;
    goto LABEL_60;
  }
  id v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = self;
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v90 = (uint64_t)v29;
    __int16 v91 = 2112;
    v92 = v70;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Fetched paired metadata dictionary %@", buf, 0x16u);
  }
  if (a5)
  {
    __int16 v73 = v27;
    id v68 = v11;
    id v75 = (__CFString *)MEMORY[0x263EFFA78];
LABEL_27:
    id v72 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[__CFString count](v70, "count"));
    v69 = [MEMORY[0x263EFF9C0] set];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v71 = v13;
    uint64_t v76 = [v71 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (!v76) {
      goto LABEL_52;
    }
    uint64_t v74 = *(void *)v80;
    while (1)
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v80 != v74) {
          objc_enumerationMutation(v71);
        }
        uint64_t v41 = *(HMDCloudPairedMetadata **)(*((void *)&v79 + 1) + 8 * v40);
        uint64_t v42 = [(__CFString *)v75 objectForKeyedSubscript:v41];
        long long v43 = (void *)v42;
        if (v42
          || ([(__CFString *)v70 objectForKeyedSubscript:v41],
              long long v44 = objc_claimAutoreleasedReturnValue(),
              [v44 objectForKeyedSubscript:@"pairedMetadata"],
              long long v43 = objc_claimAutoreleasedReturnValue(),
              v44,
              v43))
        {
          id v45 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v41];
          BOOL v46 = [[HMDCloudPairedMetadata alloc] initWithBaseAccessoryIdentifier:v45 data:v43 allowUnzippedData:v42 != 0];
          v47 = (void *)MEMORY[0x230FBD990]();
          id v48 = v73;
          uint64_t v49 = HMFGetOSLogHandle();
          __int16 v50 = v49;
          if (v46)
          {
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              uint64_t v51 = HMFGetLogIdentifier();
              v52 = (void *)v51;
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = @"Cloud";
              if (v42) {
                uint64_t v53 = @"Override";
              }
              uint64_t v90 = v51;
              __int16 v91 = 2112;
              v92 = v53;
              __int16 v93 = 2112;
              id v94 = v45;
              _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@%@ data for %@ parsed successfully", buf, 0x20u);
            }
            v54 = v72;
            id v55 = v46;
            goto LABEL_44;
          }
          BOOL v56 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
          if (v42)
          {
            if (v56)
            {
              uint64_t v57 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v90 = (uint64_t)v57;
              __int16 v91 = 2112;
              v92 = v45;
              _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Override data for %@ failed to parse successfully, removing", buf, 0x16u);
            }
            v54 = v69;
            id v55 = v41;
LABEL_44:
            [v54 addObject:v55];
          }
          else
          {
            if (v56)
            {
              v58 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v90 = (uint64_t)v58;
              __int16 v91 = 2112;
              v92 = v45;
              _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Cloud data for %@ failed to parse successfully", buf, 0x16u);
            }
          }
        }
        ++v40;
      }
      while (v76 != v40);
      uint64_t v59 = [v71 countByEnumeratingWithState:&v79 objects:v95 count:16];
      uint64_t v76 = v59;
      if (!v59)
      {
LABEL_52:

        id v11 = v68;
        if ([v69 count])
        {
          long long v60 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v73 mirror];
          id v78 = 0;
          char v61 = [v60 removeOverridesForRecordIDs:v69 options:v68 error:&v78];
          id v62 = (__CFString *)v78;

          if ((v61 & 1) == 0)
          {
            long long v63 = (void *)MEMORY[0x230FBD990]();
            long long v64 = v73;
            long long v65 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              long long v66 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v90 = (uint64_t)v66;
              __int16 v91 = 2112;
              v92 = v62;
              _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove invalid override data: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v25 = (void *)[v72 copy];

        id v20 = 0;
        long long v31 = v75;
        goto LABEL_59;
      }
    }
  }
  long long v30 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v27 mirror];
  id v83 = 0;
  long long v31 = [v30 fetchOverridesForRecordIDs:v13 options:v11 error:&v83];
  id v20 = (__CFString *)v83;

  if (!v20)
  {
    objc_msgSend((id)objc_opt_class(), "__pairedMetadataDictionaryFromOverrideObjectDictionary:", v31);
    id v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v36 = (void *)MEMORY[0x230FBD990]();
    id v37 = v27;
    BOOL v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      long long v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v90 = (uint64_t)v39;
      __int16 v91 = 2112;
      v92 = v75;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Fetched overrides dictionary %@", buf, 0x16u);
    }
    __int16 v73 = v27;
    id v68 = v11;

    goto LABEL_27;
  }
  if (a6) {
    *a6 = v20;
  }
  id v32 = (void *)MEMORY[0x230FBD990]();
  long long v33 = v27;
  BOOL v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v90 = (uint64_t)v35;
    __int16 v91 = 2112;
    v92 = v20;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Fetch overrides for paired metadata failed with error %@", buf, 0x16u);
  }
  uint64_t v25 = 0;
LABEL_59:

LABEL_60:
  return v25;
}

- (id)pairedMetadataVersionConfigurationForAccessory:(id)a3 pairedMetadata:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v58 = self;
  uint64_t v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  long long v63 = [v6 firmwareVersion];
  if (!v63)
  {
    uint64_t v51 = (void *)MEMORY[0x230FBD990]();
    v52 = self;
    uint64_t v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      v54 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v69 = v54;
      __int16 v70 = 2112;
      id v71 = v6;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have firmware version on %@", buf, 0x16u);
    }
    id v55 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must have firmware version on %@", v6];
    BOOL v56 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v56 submitLogEvent:v55];
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v57 = v7;
  obuint64_t j = [v7 versionConfigurations];
  uint64_t v62 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (!v62)
  {
    id v60 = 0;
    id v9 = 0;
    goto LABEL_38;
  }
  id v9 = 0;
  id v60 = 0;
  uint64_t v61 = *(void *)v65;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v65 != v61) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v64 + 1) + 8 * v10);
      id v12 = [v11 accessoryIdentifier];
      uint64_t v13 = [v12 productGroup];
      uint64_t v14 = [v6 productGroup];
      if ([v13 isEqualToString:v14])
      {
        uint64_t v15 = [v12 productNumber];
        uint64_t v16 = [v6 productNumber];
        char v17 = [v15 isEqualToString:v16];

        if (v17) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = v58;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v69 = v21;
        __int16 v70 = 2112;
        id v71 = v12;
        __int16 v72 = 2112;
        id v73 = v6;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Version configuration contains identifier %@ that does not match requested identifier %@", buf, 0x20u);
      }
      uint64_t v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"Version configuration contains identifier %@ that does not match requested identifier %@", v12, v6];
      uint64_t v23 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v23 submitLogEvent:v22];

LABEL_12:
      uint64_t v24 = [v11 accessoryIdentifier];
      uint64_t v25 = [v24 firmwareVersion];

      uint64_t v26 = [v25 compare:v63];
      if (v26 == -1)
      {
        if (v9)
        {
          id v35 = [v9 accessoryIdentifier];
          long long v36 = [v35 firmwareVersion];
          uint64_t v37 = [v25 compare:v36];

          if (v37 != 1)
          {
            if (v37) {
              goto LABEL_31;
            }
            BOOL v38 = (void *)MEMORY[0x230FBD990]();
            long long v39 = v58;
            uint64_t v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              uint64_t v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v69 = v41;
              __int16 v70 = 2112;
              id v71 = v12;
              _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple rule configurations with the same version for %@", buf, 0x16u);
            }
            BOOL v34 = [[HMDAssertionLogEvent alloc] initWithReason:@"Multiple rule configurations with the same version for %@", v12];
            goto LABEL_26;
          }
          id v45 = v11;

          id v9 = v45;
        }
        else
        {
          id v9 = v11;
        }
      }
      else
      {
        if (!v26)
        {
          id v47 = v11;

          id v48 = v60;
          goto LABEL_42;
        }
        if (v60)
        {
          id v27 = [v60 accessoryIdentifier];
          id v28 = [v27 firmwareVersion];
          uint64_t v29 = [v25 compare:v28];

          if (v29 != -1)
          {
            if (v29) {
              goto LABEL_31;
            }
            long long v30 = (void *)MEMORY[0x230FBD990]();
            long long v31 = v58;
            id v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              long long v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v69 = v33;
              __int16 v70 = 2112;
              id v71 = v12;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple version configurations with the same version for %@", buf, 0x16u);
            }
            BOOL v34 = [[HMDAssertionLogEvent alloc] initWithReason:@"Multiple version configurations with the same version for %@", v12];
LABEL_26:
            uint64_t v42 = v34;
            long long v43 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v43 submitLogEvent:v42];

            goto LABEL_31;
          }
          id v44 = v11;

          id v60 = v44;
        }
        else
        {
          id v60 = v11;
        }
      }
LABEL_31:

      ++v10;
    }
    while (v62 != v10);
    uint64_t v46 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    uint64_t v62 = v46;
  }
  while (v46);
LABEL_38:

  id v48 = v60;
  if (v9) {
    uint64_t v49 = v9;
  }
  else {
    uint64_t v49 = v60;
  }
  id v47 = v49;
LABEL_42:

  return v47;
}

- (id)_fetchNetworkDeclarationsForRecordIDs:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  id v64 = 0;
  v52 = [v13 fetchAllDataForRecordIDs:v10 options:v11 error:&v64];
  id v14 = v64;

  if (v14)
  {
    if (a6)
    {
      id v14 = v14;
      uint64_t v15 = 0;
      *a6 = v14;
    }
    else
    {
      uint64_t v15 = 0;
    }
    goto LABEL_44;
  }
  if (a5)
  {
    id v55 = self;
    id v48 = v11;
    uint64_t v16 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    char v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    id v63 = 0;
    uint64_t v16 = [v17 fetchOverridesForRecordIDs:v10 options:v11 error:&v63];
    id v14 = v63;

    if (v14)
    {
      if (a6)
      {
        id v14 = v14;
        uint64_t v15 = 0;
        *a6 = v14;
      }
      else
      {
        uint64_t v15 = 0;
      }
      goto LABEL_43;
    }
    id v48 = v11;
    id v55 = self;
    uint64_t v18 = objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromOverrideObjectDictionary:", v16);

    uint64_t v16 = (void *)v18;
  }
  v54 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v52, "count", v48));
  uint64_t v51 = [MEMORY[0x263EFF9C0] set];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v50 = v10;
  obuint64_t j = v10;
  uint64_t v57 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (!v57) {
    goto LABEL_36;
  }
  uint64_t v56 = *(void *)v60;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v60 != v56) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations **)(*((void *)&v59 + 1) + 8 * v19);
      uint64_t v21 = [v16 objectForKeyedSubscript:v20];
      uint64_t v22 = (void *)v21;
      if (v21
        || ([v52 objectForKeyedSubscript:v20],
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            [v23 objectForKeyedSubscript:@"networkDeclarations"],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            v23,
            v22))
      {
        uint64_t v24 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v20];
        uint64_t v25 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v24 data:v22 allowUnzippedData:v21 != 0];
        uint64_t v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = v55;
        id v28 = HMFGetOSLogHandle();
        uint64_t v29 = v28;
        if (v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = HMFGetLogIdentifier();
            long long v31 = (void *)v30;
            *(_DWORD *)buf = 138543874;
            id v32 = @"Cloud";
            if (v21) {
              id v32 = @"Override";
            }
            uint64_t v66 = v30;
            __int16 v67 = 2112;
            id v68 = v32;
            __int16 v69 = 2112;
            __int16 v70 = v24;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@%@ data for %@ parsed successfully", buf, 0x20u);
          }
          long long v33 = v54;
          BOOL v34 = v25;
          goto LABEL_28;
        }
        BOOL v35 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if (v21)
        {
          if (v35)
          {
            long long v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v66 = (uint64_t)v36;
            __int16 v67 = 2112;
            id v68 = v24;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Override data for %@ failed to parse successfully, removing", buf, 0x16u);
          }
          long long v33 = v51;
          BOOL v34 = v20;
LABEL_28:
          [v33 addObject:v34];
        }
        else
        {
          if (v35)
          {
            uint64_t v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v66 = (uint64_t)v37;
            __int16 v67 = 2112;
            id v68 = v24;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cloud data for %@ failed to parse successfully", buf, 0x16u);
          }
        }
      }
      ++v19;
    }
    while (v57 != v19);
    uint64_t v38 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
    uint64_t v57 = v38;
  }
  while (v38);
LABEL_36:

  long long v39 = v51;
  id v11 = v49;
  id v10 = v50;
  if ([v51 count])
  {
    uint64_t v40 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v55 mirror];
    id v58 = 0;
    char v41 = [v40 removeOverridesForRecordIDs:v51 options:v49 error:&v58];
    uint64_t v42 = (__CFString *)v58;

    if ((v41 & 1) == 0)
    {
      long long v43 = (void *)MEMORY[0x230FBD990]();
      id v44 = v55;
      id v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = (uint64_t)v46;
        __int16 v67 = 2112;
        id v68 = v42;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove invalid override data: %@", buf, 0x16u);

        long long v39 = v51;
      }
    }
  }
  uint64_t v15 = (void *)[v54 copy];

  id v14 = 0;
LABEL_43:

LABEL_44:
  return v15;
}

- (id)_fetchAllDataForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v13);

  if (v10 && v11)
  {
    id v14 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v10 productNumber:v11 firmwareVersion:0];
    uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    char v17 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 cloudKitRecordID];
    uint64_t v18 = [v16 setWithObject:v17];
    uint64_t v19 = [v15 fetchAllDataForRecordIDs:v18 options:v12 error:a6];

LABEL_6:
    goto LABEL_8;
  }
  if (v10)
  {
    id v14 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v10 productNumber:@"00000000" firmwareVersion:0];
    uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    id v20 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 cloudKitZoneName];
    uint64_t v19 = [v15 fetchAllDataForZoneName:v20 options:v12 error:a6];

    goto LABEL_6;
  }
  id v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
  uint64_t v19 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v14 fetchAllDataWithOptions:v12 error:a6];
LABEL_8:

  return v19;
}

- (void)_fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 requiredRecordIDs:(id)a6 schedulerXpcActivity:(id)a7 completion:(id)a8
{
  BOOL v11 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a6;
  id v31 = a7;
  uint64_t v15 = (void (**)(id, void, void *))a8;
  uint64_t v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v16);

  char v17 = [MEMORY[0x263EFF9C0] set];
  uint64_t v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self firewallRuleManager];
  uint64_t v19 = [v18 activeClients];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke;
  v38[3] = &unk_264A23400;
  id v20 = v18;
  id v39 = v20;
  id v21 = v17;
  id v40 = v21;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);

  if (v14 && ([v14 isSubsetOfSet:v21] & 1) == 0)
  {
    uint64_t v22 = (void *)[v14 mutableCopy];
    id v27 = (void *)MEMORY[0x230FBD990]([v22 minusSet:v21]);
    id v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      id v44 = v22;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cloud fetch triggered but required records are not watched: %@", buf, 0x16u);
    }
    uint64_t v26 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v15[2](v15, 0, v26);
    uint64_t v25 = v31;
  }
  else
  {
    uint64_t v22 = objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", @"FetchCloudChanges", a3);
    uint64_t v23 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    uint64_t v24 = (void *)[v21 copy];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_152;
    v32[3] = &unk_264A23450;
    long long v36 = v15;
    id v33 = v14;
    BOOL v34 = self;
    BOOL v37 = a5;
    uint64_t v25 = v31;
    id v35 = v31;
    [v23 fetchCloudChangesForRecordIDs:v24 options:v22 ignoreLastSynchronizedRecords:v11 xpcActivity:v35 completion:v32];

    uint64_t v26 = v36;
  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 watchedAccessoryIdentifiersForFirewallRuleManager:*(void *)(a1 + 32)];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2;
    v5[3] = &unk_264A233D8;
    id v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_152(uint64_t a1, char a2, void *a3, void *a4)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    if ([v7 count])
    {
      id v9 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count"));
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2_153;
      uint64_t v22 = &unk_264A23428;
      id v23 = *(id *)(a1 + 32);
      id v24 = v9;
      id v10 = v9;
      objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v19);
      BOOL v11 = objc_msgSend(v10, "copy", v19, v20, v21, v22);
    }
    else
    {
      BOOL v11 = [MEMORY[0x263EFFA08] set];
    }
    id v12 = [*(id *)(a1 + 40) firewallRuleManager];
    if (*(unsigned char *)(a1 + 64) || [v11 count])
    {
      id v27 = @"HMDNotificationNetworkRouterFirewallRulesUpdatedAccessoriesKey";
      v28[0] = v11;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      id v14 = [*(id *)(a1 + 40) notificationCenter];
      [v14 postNotificationName:@"HMDNotificationNetworkRouterFirewallRulesUpdated" object:v12 userInfo:v13];
    }
    if (!*(void *)(a1 + 48))
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 40);
      char v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting the cloud fetch scheduler after a successful force fetch", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "__stopCloudFetchScheduler");
      objc_msgSend(*(id *)(a1 + 40), "__maybeStartOrStopCloudFetchScheduler");
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2_153(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v5];
    [v3 addObject:v4];
  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 cloudKitRecordID];
  [v2 addObject:v3];
}

- (void)fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  BOOL v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v11);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self _fetchCloudChangesWithQualityOfService:a3 ignoreLastFetchedAccessories:v7 forceChangeNotifications:v6 requiredRecordIDs:0 schedulerXpcActivity:0 completion:v10];
  }
  else
  {
    id v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __165__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_completion___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v14 = v10;
    dispatch_async(v12, block);
  }
}

void __165__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)firewallRuleManagerClientsDidChange
{
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self __maybeStartOrStopCloudFetchScheduler];
}

- (void)shutdownWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    BOOL v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self setMirror:0];
    BOOL v7 = [v6 shutdownFuture];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_2;
    v18[3] = &unk_264A2D158;
    v18[4] = self;
    id v19 = v4;
    id v8 = (id)[v7 addCompletionBlock:v18];

    id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirroredLocalZone];

    if (v9)
    {
      id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirroredLocalZone];
      [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self setMirroredLocalZone:0];
      BOOL v11 = [v10 shutdown];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_4;
      v17[3] = &unk_264A2D1D0;
      void v17[4] = self;
      id v12 = (id)[v11 addCompletionBlock:v17];
    }
    else
    {
      id v14 = v6;
      if ([v14 conformsToProtocol:&unk_26E519578]) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      id v10 = v15;

      id v16 = (id)[v10 shutdown];
    }
  }
  else
  {
    uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v21 = v4;
    dispatch_async(v13, block);

    BOOL v6 = v21;
  }
}

uint64_t __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) ownerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_3;
  v8[3] = &unk_264A2F870;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

void __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

uint64_t __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)__startupWithMirror:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirror];
    char v10 = HMFEqualObjects();

    if (v10)
    {
      int v11 = 0;
    }
    else
    {
      int v11 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
    }
    id v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke;
    block[3] = &unk_264A2F870;
    id v23 = v11;
    id v24 = v7;
    id v15 = v11;
    dispatch_async(v14, block);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    id v12 = [v6 startupFuture];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_2;
    v16[3] = &unk_264A233B0;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    objc_copyWeak(&v19, &from);
    id v13 = (id)[v12 addCompletionBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

uint64_t __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained ownerQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_3;
    v10[3] = &unk_264A2D310;
    id v11 = v4;
    id v13 = a1[4];
    objc_copyWeak(&v14, a1 + 6);
    id v12 = v6;
    dispatch_async(v7, v10);

    objc_destroyWeak(&v14);
  }
  else
  {
    id v8 = (void (**)(id, void *))a1[4];
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    v8[2](v8, v9);
  }
}

void __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      [*(id *)(a1 + 40) setMirror:WeakRetained];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    }
  }
}

- (void)__startupWithMirroredLocalZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self mirroredLocalZone];
    char v10 = HMFEqualObjects();

    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
    }
    id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke;
    block[3] = &unk_264A2F870;
    id v21 = v11;
    id v22 = v7;
    id v14 = v11;
    dispatch_async(v15, block);

    id v16 = v22;
    goto LABEL_12;
  }
  id v12 = [v6 mirror];
  if ([v12 conformsToProtocol:&unk_26E574848]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (!v14)
  {
    id v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke_2;
    v18[3] = &unk_264A2DFA0;
    id v19 = v7;
    dispatch_async(v17, v18);

    id v16 = v19;
LABEL_12:

    goto LABEL_13;
  }
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self setMirroredLocalZone:v6];
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self __startupWithMirror:v14 completion:v7];
LABEL_13:
}

uint64_t __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startupWithLocalDatabase:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self isRunning])
  {
    id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v31 = v7;
    dispatch_async(v9, block);

    char v10 = v31;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFD620]);
    id v12 = [(id)objc_opt_class() ckContainerIdentifier];
    char v10 = objc_msgSend(v11, "initWithContainerIdentifier:environment:", v12, objc_msgSend((id)objc_opt_class(), "ckContainerEnvironment"));

    id v13 = (void *)[objc_alloc(MEMORY[0x263F49260]) initWithContainerID:v10];
    id v14 = (void *)[objc_alloc(MEMORY[0x263F49258]) initWithLocalDatabase:v6 configuration:v13];
    if (v14)
    {
      id v15 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirror alloc];
      uint64_t v16 = [(id)objc_opt_class() ckUseAnonymousAccount];
      id v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
      id v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 initWithLocalDatabase:v6 cloudDatabase:v14 useAnonymousRequests:v16 ownerQueue:v17];

      id v19 = objc_alloc_init(MEMORY[0x263F49308]);
      [v19 setCreateIfNeeded:1];
      id v27 = 0;
      uint64_t v20 = [v6 openZoneWithMirror:v18 configuration:v19 error:&v27];
      id v21 = v27;
      if (v20)
      {
        [v20 startUp];
        [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self __startupWithMirroredLocalZone:v20 completion:v7];
      }
      else
      {
        id v23 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_3;
        v24[3] = &unk_264A2F870;
        id v26 = v7;
        id v25 = v21;
        dispatch_async(v23, v24);
      }
    }
    else
    {
      id v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      void v28[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_2;
      v28[3] = &unk_264A2DFA0;
      uint64_t v29 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v7;
      dispatch_async(v22, v28);

      id v18 = v29;
    }
  }
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setMirror:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v5);

  mirror = self->_mirror;
  self->_mirror = v4;

  if (v4)
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self __maybeStartOrStopCloudFetchScheduler];
  }
  else
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self __stopCloudFetchScheduler];
  }
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)mirror
{
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v3);

  mirror = self->_mirror;
  return mirror;
}

- (BOOL)isRunning
{
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self ownerQueue];
  dispatch_assert_queue_V2(v3);

  return self->_mirror != 0;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchInterval:(double)a5 cloudFetchRetryInterval:(double)a6 ownerQueue:(id)a7
{
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self initWithFirewallRuleManager:a3 notificationCenter:a4 ownerQueue:a7];
  char v10 = [[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler alloc] initWithIdentifier:@"com.apple.homed.firewall-rule-manager.cloud-fetch-scheduler" interval:v9 retryInterval:a5 delegate:a6];
  cloudFetchScheduler = v9->_cloudFetchScheduler;
  v9->_cloudFetchScheduler = v10;

  return v9;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchScheduler:(id)a5 ownerQueue:(id)a6
{
  char v10 = (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)a5;
  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)self initWithFirewallRuleManager:a3 notificationCenter:a4 ownerQueue:a6];
  cloudFetchScheduler = v11->_cloudFetchScheduler;
  v11->_cloudFetchScheduler = v10;

  return v11;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 ownerQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator;
  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_firewallRuleManager, v8);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    objc_storeStrong((id *)&v12->_ownerQueue, a5);
    id v13 = v12;
  }

  return v12;
}

+ (id)__pairedMetadataDataDictionaryFromRecordDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __113__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDataDictionaryFromRecordDictionary___block_invoke;
  v9[3] = &unk_264A23478;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

void __113__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDataDictionaryFromRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"pairedMetadata"];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"pairedMetadata"];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)__networkDeclarationDataDictionaryFromRecordDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromRecordDictionary___block_invoke;
  v9[3] = &unk_264A23478;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"networkDeclarations"];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"networkDeclarations"];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)__pairedMetadataDictionaryFromOverrideObjectDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDictionaryFromOverrideObjectDictionary___block_invoke;
  v9[3] = &unk_264A23478;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v6 count]) {
    id v7 = (void *)[v6 copy];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDictionaryFromOverrideObjectDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"pairedMetadata"];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"pairedMetadata"];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)__networkDeclarationDataDictionaryFromOverrideObjectDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromOverrideObjectDictionary___block_invoke;
  v9[3] = &unk_264A23478;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v6 count]) {
    id v7 = (void *)[v6 copy];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromOverrideObjectDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"networkDeclarations"];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"networkDeclarations"];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)__createProcessingOptionsWithLabel:(id)a3
{
  return (id)objc_msgSend(a1, "__createProcessingOptionsWithLabel:qualityOfService:", a3, 17);
}

+ (id)__createProcessingOptionsWithLabel:(id)a3 qualityOfService:(int64_t)a4
{
  id v5 = [MEMORY[0x263F49318] optionsWithLabel:a3];
  [v5 setShouldEnqueueMirrorOutput:0];
  [v5 setQualityOfService:a4];
  return v5;
}

+ (id)__jsonFromRecords:(id)a3 validateWithPublicKeys:(id)a4 rawOutput:(BOOL)a5 error:(id *)a6
{
  BOOL v64 = a5;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v10 = v7;
  id v11 = (void *)v9;
  obuint64_t j = v10;
  uint64_t v55 = [v10 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v55)
  {
    id v53 = v8;
    uint64_t v54 = *(void *)v72;
    v52 = (void *)v9;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v14 = [v13 recordID];
        objc_super v15 = [v14 zoneID];
        uint64_t v16 = [v15 zoneName];

        id v17 = [v14 recordName];
        long long v60 = v14;
        id v18 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v14];
        id v19 = v18;
        if (!v64)
        {
          uint64_t v20 = [v18 productGroup];

          uint64_t v21 = [v19 productNumber];

          id v17 = (void *)v21;
          uint64_t v16 = (void *)v20;
        }
        long long v62 = v19;
        id v22 = [v11 objectForKeyedSubscript:v16];
        if (!v22)
        {
          id v22 = [MEMORY[0x263EFF9A0] dictionary];
          [v11 setObject:v22 forKeyedSubscript:v16];
        }
        long long v59 = v16;
        id v23 = [MEMORY[0x263EFF9A0] dictionary];
        id v58 = v17;
        [v22 setObject:v23 forKeyedSubscript:v17];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v63 = [v13 allKeys];
        uint64_t v24 = [v63 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (!v24)
        {
          BOOL v37 = v59;
          uint64_t v42 = v60;
          goto LABEL_51;
        }
        uint64_t v25 = v24;
        uint64_t v56 = v22;
        uint64_t v57 = i;
        int v61 = 0;
        int v26 = 0;
        uint64_t v27 = *(void *)v68;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v68 != v27) {
              objc_enumerationMutation(v63);
            }
            uint64_t v29 = *(void **)(*((void *)&v67 + 1) + 8 * v28);
            if (([v29 isEqualToString:@"CD_networkDeclarations_ckAsset"] & 1) != 0
              || [v29 isEqualToString:@"CD_networkDeclarations"])
            {
              if (!v64)
              {
                uint64_t v30 = objc_msgSend((id)objc_opt_class(), "__networkDeclarationsFromRecord:recordKey:identifier:", v13, v29, v62);
                if (v30)
                {
                  id v31 = v30;
                  id v32 = [v30 prettyJSONDictionary];
                  int v26 = 1;
                  goto LABEL_22;
                }
              }
              int v26 = 1;
              goto LABEL_21;
            }
            if ([v29 isEqualToString:@"CD_pairedMetadata_ckAsset"])
            {
              if (v64) {
                goto LABEL_31;
              }
            }
            else
            {
              int v34 = [v29 isEqualToString:@"CD_pairedMetadata"];
              if (!v34 || v64)
              {
                v61 |= v34;
                goto LABEL_21;
              }
            }
            id v35 = objc_msgSend((id)objc_opt_class(), "__pairedMetadataFromRecord:recordKey:identifier:", v13, v29, v62);
            if (!v35)
            {
LABEL_31:
              int v61 = 1;
LABEL_21:
              id v33 = objc_opt_class();
              id v31 = [v13 objectForKeyedSubscript:v29];
              id v32 = objc_msgSend(v33, "__jsonValueForCKRecordValue:", v31);
              goto LABEL_22;
            }
            id v31 = v35;
            id v32 = [v35 prettyJSONDictionary];
            int v61 = 1;
LABEL_22:
            [v23 setObject:v32 forKeyedSubscript:v29];

            ++v28;
          }
          while (v25 != v28);
          uint64_t v36 = [v63 countByEnumeratingWithState:&v67 objects:v75 count:16];
          uint64_t v25 = v36;
        }
        while (v36);

        id v8 = v53;
        if (v53)
        {
          uint64_t i = v57;
          BOOL v37 = v59;
          if ((v26 ^ 1))
          {
            id v11 = v52;
          }
          else
          {
            id v66 = 0;
            BOOL v38 = +[HMDNetworkRouterFirewallRuleCloudZone verifyNetworkDeclarationsFromRecord:v13 signatureVerificationPublicKeys:v53 error:&v66];
            id v39 = v66;
            id v40 = @"VALID";
            id v11 = v52;
            if (!v38)
            {
              id v40 = [NSString stringWithFormat:@"INVALID: %@", v39];
              id v50 = v40;
            }
            char v41 = [@"CD_networkDeclarationsSignature" stringByAppendingString:@"[VALIDATION_RESULT]"];
            [v23 setObject:v40 forKeyedSubscript:v41];

            if (!v38) {
            uint64_t i = v57;
            }
          }
        }
        else
        {
          id v11 = v52;
          uint64_t i = v57;
          BOOL v37 = v59;
        }
        id v22 = v56;
        if (!v53 || ((v61 ^ 1) & 1) != 0)
        {
          uint64_t v42 = v60;
        }
        else
        {
          id v65 = 0;
          BOOL v43 = +[HMDNetworkRouterFirewallRuleCloudZone verifyPairedMetadataFromRecord:v13 signatureVerificationPublicKeys:v53 error:&v65];
          id v63 = v65;
          id v44 = @"VALID";
          if (!v43)
          {
            id v44 = [NSString stringWithFormat:@"INVALID: %@", v63];
            uint64_t v49 = v44;
          }
          uint64_t v45 = [@"CD_pairedMetadataSignature" stringByAppendingString:@"[VALIDATION_RESULT]"];
          [v23 setObject:v44 forKeyedSubscript:v45];

          if (!v43) {
          uint64_t v42 = v60;
          }
LABEL_51:
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v55);
  }

  uint64_t v46 = objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v64, a6);

  return v46;
}

+ (id)__pairedMetadataFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEqualToString:@"CD_pairedMetadata_ckAsset"])
  {
    id v10 = [v7 objectForKeyedSubscript:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (!v12)
    {
      objc_super v15 = 0;
      goto LABEL_16;
    }
    id v13 = (void *)MEMORY[0x263EFF8F8];
    id v14 = [(HMDCloudPairedMetadata *)v12 fileURL];
    objc_super v15 = [v13 dataWithContentsOfURL:v14];
  }
  else
  {
    if (![v8 isEqualToString:@"CD_pairedMetadata"])
    {
LABEL_14:
      id v12 = 0;
      goto LABEL_17;
    }
    id v12 = [v7 objectForKeyedSubscript:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = 0;
    }
    objc_super v15 = v16;
  }

  if (!v15) {
    goto LABEL_14;
  }
  id v12 = [[HMDCloudPairedMetadata alloc] initWithBaseAccessoryIdentifier:v9 data:v15];
LABEL_16:

LABEL_17:
  return v12;
}

+ (id)__networkDeclarationsFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEqualToString:@"CD_networkDeclarations_ckAsset"])
  {
    id v10 = [v7 objectForKeyedSubscript:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (!v12)
    {
      objc_super v15 = 0;
      goto LABEL_16;
    }
    id v13 = (void *)MEMORY[0x263EFF8F8];
    id v14 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v12 fileURL];
    objc_super v15 = [v13 dataWithContentsOfURL:v14];
  }
  else
  {
    if (![v8 isEqualToString:@"CD_networkDeclarations"])
    {
LABEL_14:
      id v12 = 0;
      goto LABEL_17;
    }
    id v12 = [v7 objectForKeyedSubscript:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = 0;
    }
    objc_super v15 = v16;
  }

  if (!v15) {
    goto LABEL_14;
  }
  id v12 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v9 data:v15];
LABEL_16:

LABEL_17:
  return v12;
}

+ (id)__jsonFromPairedMetadata:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a3;
  id v10 = [v8 dictionary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromPairedMetadata_rawOutput_error___block_invoke;
  v14[3] = &unk_264A23388;
  BOOL v17 = v6;
  id v15 = v10;
  id v16 = a1;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];

  id v12 = objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v6, a5);

  return v12;
}

void __103__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromPairedMetadata_rawOutput_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v5];
  id v8 = [v5 zoneID];
  id v9 = [v8 zoneName];

  id v10 = [v5 recordName];
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v11 = [v7 productGroup];

    uint64_t v12 = [v7 productNumber];

    id v10 = (void *)v12;
    id v9 = (void *)v11;
  }
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (!v13)
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v9];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v15 = [[HMDCloudPairedMetadata alloc] initWithBaseAccessoryIdentifier:v7 data:v6 allowUnzippedData:1];
    if (v15)
    {
      id v16 = v15;
      BOOL v17 = [(HMDCloudPairedMetadata *)v15 prettyJSONDictionary];
      [v13 setObject:v17 forKeyedSubscript:v10];

      goto LABEL_9;
    }
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v21;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse declaration for %@", (uint8_t *)&v22, 0x16u);
    }
  }
  id v14 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  [v13 setObject:v14 forKeyedSubscript:v10];

LABEL_9:
}

+ (id)__jsonFromDeclarations:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a3;
  id v10 = [v8 dictionary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromDeclarations_rawOutput_error___block_invoke;
  v14[3] = &unk_264A23388;
  BOOL v17 = v6;
  id v15 = v10;
  id v16 = a1;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v6, a5);

  return v12;
}

void __101__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromDeclarations_rawOutput_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:v5];
  id v8 = [v5 zoneID];
  id v9 = [v8 zoneName];

  id v10 = [v5 recordName];
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v11 = [v7 productGroup];

    uint64_t v12 = [v7 productNumber];

    id v10 = (void *)v12;
    id v9 = (void *)v11;
  }
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (!v13)
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v9];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v15 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v7 data:v6 allowUnzippedData:1];
    if (v15)
    {
      id v16 = v15;
      BOOL v17 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v15 prettyJSONDictionary];
      [v13 setObject:v17 forKeyedSubscript:v10];

      goto LABEL_9;
    }
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v21;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse declaration for %@", (uint8_t *)&v22, 0x16u);
    }
  }
  id v14 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  [v13 setObject:v14 forKeyedSubscript:v10];

LABEL_9:
}

+ (id)__jsonStringFromDictionary:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:v5 error:a5];
  if (v6) {
    id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)__jsonValueForCKRecordValue:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
LABEL_4:
    id v6 = v5;
    goto LABEL_5;
  }
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v10 base64EncodedStringWithOptions:1];
    }
    goto LABEL_26;
  }
  id v14 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    id v6 = [v16 description];
LABEL_19:

    goto LABEL_5;
  }
  id v17 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v10 = v18;

  if (!v10)
  {
    id v21 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v22 = v21;
    }
    else {
      int v22 = 0;
    }
    id v23 = v22;

    if (!v23)
    {
      id v5 = [v21 description];
      goto LABEL_4;
    }
    __int16 v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v23;
    uint64_t v25 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v16);
          }
          uint64_t v29 = objc_msgSend(a1, "__jsonValueForCKRecordValue:", *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
          [v24 addObject:v29];
        }
        uint64_t v26 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v26);
    }

    id v6 = (void *)[v24 copy];
    goto LABEL_19;
  }
  id v19 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v20 = [v10 fileURL];
  uint64_t v12 = [v19 dataWithContentsOfURL:v20];

  objc_msgSend(a1, "__jsonValueForCKRecordValue:", v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
  id v6 = v13;

LABEL_5:
  return v6;
}

+ (BOOL)ckUseAnonymousAccount
{
  id v2 = [a1 ckContainerIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.willow.engrave"];

  return v3;
}

+ (int64_t)ckContainerEnvironment
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F42608] sharedPreferences];
  id v4 = [v3 preferenceForKey:@"engraveContainerEnvironment"];

  if (!v4)
  {
LABEL_6:
    int64_t v6 = 1;
    goto LABEL_7;
  }
  id v5 = [v4 numberValue];
  int64_t v6 = [v5 integerValue];

  if ((unint64_t)(v6 - 1) >= 2)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2048;
      int64_t v15 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Unknown container environment value %ld, ignoring", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

+ (NSString)ckContainerIdentifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F42608] sharedPreferences];
  id v4 = [v3 preferenceForKey:@"engraveContainerIdentifier"];

  if (!v4
    || ([v4 numberValue],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 unsignedIntegerValue],
        v5,
        !v6))
  {
LABEL_8:
    id v7 = @"com.apple.willow.engrave";
    goto LABEL_9;
  }
  if (v6 != 1)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Unknown container target value %lu, ignoring", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  id v7 = @"com.apple.willow.engrave.staging";
LABEL_9:

  return &v7->isa;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_173126 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_173126, &__block_literal_global_173127);
  }
  id v2 = (void *)logCategory__hmf_once_v1_173128;
  return v2;
}

void __73__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_173128;
  logCategory__hmf_once_v1_173128 = v0;
}

@end