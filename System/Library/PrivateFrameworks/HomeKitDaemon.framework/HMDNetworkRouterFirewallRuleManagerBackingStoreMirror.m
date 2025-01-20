@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirror
+ (BOOL)__errorIsNotFound:(id)a3;
+ (id)__certificatesRecordID;
+ (id)__createSignatureVerificationPolicy;
+ (id)__overrideParentModelID;
+ (id)__publicKeyFromCertificateRecord:(id)a3 dataKey:(id)a4 assetKey:(id)a5;
+ (id)__recordKeyCertificatePrefix:(id)a3;
+ (id)logCategory;
+ (id)publicKeysFromCertificateRecord:(id)a3;
+ (unint64_t)__maxSizeForCKRecordSignatureVerificationCertificateChain;
- (BOOL)__addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 activity:(id)a6 error:(id *)a7;
- (BOOL)__canRecoverFromFetchDatabaseChangesError:(id)a3 fetchInfo:(id)a4;
- (BOOL)__canRecoverFromVerificationCertificatesError:(id)a3 fetchInfo:(id)a4;
- (BOOL)__createCloudZonesForFetchInfo:(id)a3 error:(id *)a4;
- (BOOL)__removeAllLocalRulesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5;
- (BOOL)__removeAllOverridesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5;
- (BOOL)__removeOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (BOOL)__removeOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (BOOL)__removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 activity:(id)a6 error:(id *)a7;
- (BOOL)__shouldFailCloudRecordFetchError:(id)a3 error:(id)a4;
- (BOOL)_removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 error:(id *)a6;
- (BOOL)isRunning;
- (BOOL)isShuttingDown;
- (BOOL)removeAllLocalRulesWithOptions:(id)a3 error:(id *)a4;
- (BOOL)removeAllOverridesWithOptions:(id)a3 error:(id *)a4;
- (BOOL)removeOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)useAnonymousRequests;
- (HMBCloudDatabase)cloudDatabase;
- (HMBLocalDatabase)localDatabase;
- (HMBLocalZone)localZone;
- (HMBLocalZoneID)zoneID;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 useAnonymousRequests:(BOOL)a5 ownerQueue:(id)a6;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)internalState;
- (NAFuture)lastAsyncFuture;
- (NAFuture)shutdownFuture;
- (NAFuture)startupFuture;
- (NAPromise)shutdownPromise;
- (NAPromise)startupPromise;
- (NAScheduler)workQueueScheduler;
- (OS_dispatch_queue)workQueue;
- (id)__asyncFutureWithActivity:(id)a3 ignoreErrors:(BOOL)a4 block:(id)a5;
- (id)__createCloudZoneIDForZoneID:(id)a3;
- (id)__fetchAllDataForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (id)__fetchAllDataForZoneID:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (id)__fetchAllDataForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (id)__fetchOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (id)__fetchOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6;
- (id)__loadOrCreateInternalStateModelWithLocalZone:(id)a3 activity:(id)a4;
- (id)__localZonesForRecordIDs:(id)a3 activity:(id)a4 error:(id *)a5;
- (id)__openLocalZoneForCloudZoneID:(id)a3 error:(id *)a4;
- (id)_fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_fetchOverridesForZoneName:(id)a3 options:(id)a4 error:(id *)a5;
- (id)cloudFetchNeededForRecordIDs:(id)a3 error:(id *)a4;
- (id)desiredKeys;
- (id)destroy;
- (id)fetchAllDataForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5;
- (id)fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5;
- (id)fetchAllDataWithOptions:(id)a3 error:(id *)a4;
- (id)fetchAllOverridesWithOptions:(id)a3 error:(id *)a4;
- (id)fetchOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5;
- (id)flush;
- (id)shutdown;
- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4;
- (void)__fetchCloudRecordsWithFetchInfo:(id)a3;
- (void)__fetchDatabaseChangesCompleted:(id)a3 error:(id)a4;
- (void)__fetchDatabaseChangesWithFetchInfo:(id)a3;
- (void)__fetchRecordByID:(id)a3;
- (void)__fetchRecordsByQuery:(id)a3;
- (void)__fetchVerificationCertificatesCompleted:(id)a3 record:(id)a4 error:(id)a5;
- (void)__fetchVerificationCertificatesWithFetchInfo:(id)a3;
- (void)__fetchZoneChangesWithFetchInfo:(id)a3;
- (void)__performCloudZonePullsWithFetchInfo:(id)a3;
- (void)__removeDeletedZonesWithFetchInfo:(id)a3;
- (void)__retryFetchDatabaseChangesWithFetchInfo:(id)a3;
- (void)__retryFetchVerificationCertificatesWithFetchInfo:(id)a3;
- (void)__saveInternalStateWithActivity:(id)a3;
- (void)__shutdownLocalZones:(id)a3 activity:(id)a4;
- (void)__shutdownWithActivity:(id)a3;
- (void)__startQueryOperation:(id)a3 operation:(id)a4;
- (void)__startUpCloudZonesWithFetchInfo:(id)a3;
- (void)__startupWithLocalZone:(id)a3 activity:(id)a4;
- (void)__updateChangeTokenWithFetchInfo:(id)a3;
- (void)_fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 desiredKeys:(id)a6 completion:(id)a7;
- (void)fetchCloudChangesForRecordIDs:(id)a3 options:(id)a4 ignoreLastSynchronizedRecords:(BOOL)a5 xpcActivity:(id)a6 completion:(id)a7;
- (void)fetchCloudRecordIDsForZoneID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 completion:(id)a6;
- (void)fetchVerificationCertificatesRecordWithOperationGroup:(id)a3 completion:(id)a4;
- (void)setInternalState:(id)a3;
- (void)setLastAsyncFuture:(id)a3;
- (void)setLocalZone:(id)a3;
- (void)setShuttingDown:(BOOL)a3;
- (void)startUpWithLocalZone:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirror

- (void)__startQueryOperation:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);
  [v7 setCallbackQueue:v8];
  v9 = [v6 operationGroup];
  [v7 setGroup:v9];

  v10 = [v6 desiredKeys];

  if (v10)
  {
    v11 = [v6 desiredKeys];
    [v7 setDesiredKeys:v11];
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke;
  v22[3] = &unk_264A14700;
  id v12 = v6;
  id v23 = v12;
  v13 = v8;
  v24 = v13;
  [v7 setRecordFetchedBlock:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_3;
  v18[3] = &unk_264A14728;
  id v19 = v12;
  v20 = v13;
  v21 = self;
  v14 = v13;
  id v15 = v12;
  [v7 setQueryCompletionBlock:v18];
  v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  v17 = [v16 publicDatabase];
  [v17 addOperation:v7];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) activity];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_2;
  v6[3] = &unk_264A2F2F8;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) activity];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_4;
  v10[3] = &unk_264A2E908;
  id v11 = *(id *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performBlock:v10];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(void *)(a1 + 40)
    && objc_msgSend(*(id *)(a1 + 48), "__shouldFailCloudRecordFetchError:error:", *(void *)(a1 + 56)))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 48);
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 56) finishWithError:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = *(void **)(a1 + 56);
    if (*(void *)(a1 + 64))
    {
      id v8 = [*(id *)(a1 + 56) activity];
      [v8 markWithFormat:@"Previous fetch completed successfully, now fetching more records from cursor"];

      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 48);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Previous fetch completed successfully, now fetching more records from cursor", buf, 0xCu);
      }
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithCursor:*(void *)(a1 + 64)];
      objc_msgSend(*(id *)(a1 + 48), "__startQueryOperation:operation:", *(void *)(a1 + 56), v13);
    }
    else
    {
      id v15 = [*(id *)(a1 + 56) records];
      id v14 = (void *)[v15 copy];
      [v7 finishWithResult:v14];
    }
  }
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = [*(id *)(a1 + 40) records];
  [v2 addObject:*(void *)(a1 + 48)];
}

- (void)__fetchRecordsByQuery:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 zoneID];

  id v7 = [v4 activity];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v4 zoneID];
    id v10 = [v9 hmbDescription];
    [v8 markWithFormat:@"Fetching records from zone %@", v10];

    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v14 = HMFGetLogIdentifier();
    id v15 = [v4 zoneID];
    v16 = [v15 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    __int16 v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records from zone %@", buf, 0x16u);
  }
  else
  {
    [v7 markWithFormat:@"Fetching all records"];

    id v11 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all records", buf, 0xCu);
  }

LABEL_7:
  __int16 v18 = [v4 desiredKeys];

  if (v18)
  {
    uint64_t v19 = [v4 activity];
    uint64_t v20 = [v4 desiredKeys];
    [v19 markWithFormat:@"Only fetching specific fields: %@", v20];

    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      v25 = [v4 desiredKeys];
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Only fetching specific fields: %@", buf, 0x16u);
    }
  }
  v26 = [MEMORY[0x263F08A98] predicateWithValue:1];
  v27 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:@"CD_CloudAccessory" predicate:v26];
  v28 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithQuery:v27];
  v29 = [v4 zoneID];

  if (v29)
  {
    v30 = [v4 zoneID];
    [v28 setZoneID:v30];
  }
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __startQueryOperation:v4 operation:v28];
}

- (void)__fetchRecordByID:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);
  uint64_t v6 = [v4 activity];
  id v7 = [v4 recordID];
  id v8 = [v7 hmbDescription];
  [v6 markWithFormat:@"Fetching record: %@", v8];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v4 recordID];
    id v14 = [v13 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    __int16 v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching record: %@", buf, 0x16u);
  }
  id v15 = objc_alloc(MEMORY[0x263EFD6D8]);
  v16 = [v4 recordID];
  v37 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  __int16 v18 = (void *)[v15 initWithRecordIDs:v17];

  [v18 setCallbackQueue:v5];
  uint64_t v19 = [v4 operationGroup];
  [v18 setGroup:v19];

  uint64_t v20 = [v4 desiredKeys];

  if (v20)
  {
    v21 = [v4 activity];
    v22 = [v4 desiredKeys];
    [v21 markWithFormat:@"Only fetching specific fields: %@", v22];

    id v23 = (void *)MEMORY[0x230FBD990]();
    v24 = v10;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [v4 desiredKeys];
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Only fetching specific fields: %@", buf, 0x16u);
    }
    v28 = [v4 desiredKeys];
    [v18 setDesiredKeys:v28];
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke;
  v33[3] = &unk_264A1BD18;
  id v34 = v4;
  uint64_t v35 = v5;
  v36 = v10;
  v29 = v5;
  id v30 = v4;
  [v18 setFetchRecordsCompletionBlock:v33];
  v31 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v10 cloudDatabase];
  v32 = [v31 publicDatabase];
  [v32 addOperation:v18];
}

void __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) activity];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke_2;
  v10[3] = &unk_264A2E908;
  id v11 = *(id *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performBlock:v10];
}

void __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(void *)(a1 + 40)
    && objc_msgSend(*(id *)(a1 + 48), "__shouldFailCloudRecordFetchError:error:", *(void *)(a1 + 56)))
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 48);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 56) finishWithError:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = *(void **)(a1 + 64);
    id v8 = (void *)MEMORY[0x263EFFA08];
    if (v7)
    {
      id v9 = [v7 allValues];
      id v10 = [v8 setWithArray:v9];
    }
    else
    {
      id v10 = [MEMORY[0x263EFFA08] set];
    }
    [*(id *)(a1 + 56) finishWithResult:v10];
  }
}

- (void)__fetchCloudRecordsWithFetchInfo:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v6 recordID];

  if (v5) {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __fetchRecordByID:v6];
  }
  else {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __fetchRecordsByQuery:v6];
  }
}

- (BOOL)__shouldFailCloudRecordFetchError:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hmbIsCKZoneDeletedError])
  {
    id v8 = [v6 activity];
    id v9 = [v6 zoneID];
    id v10 = [v9 hmbDescription];
    [v8 markWithFormat:@"Zone '%@' does not exist", v10];

    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v6 zoneID];
      v16 = [v15 hmbDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Zone '%@' does not exist", buf, 0x16u);
    }
LABEL_9:

    BOOL v23 = 0;
    goto LABEL_15;
  }
  if ([v7 hmbIsCloudKitError])
  {
    if ([v7 code] == 11)
    {
      v17 = [v6 activity];
      __int16 v18 = [v6 recordID];
      uint64_t v19 = [v18 hmbDescription];
      [v17 markWithFormat:@"Record '%@' does not exist", v19];

      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        v21 = [v6 recordID];
        v22 = [v21 hmbDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Record '%@' does not exist", buf, 0x16u);
      }
      goto LABEL_9;
    }
    if ([v7 code] == 2)
    {
      v24 = [v7 userInfo];
      v25 = [v24 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v37 = 0;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __116__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____shouldFailCloudRecordFetchError_error___block_invoke;
      v32[3] = &unk_264A146D8;
      id v33 = v6;
      id v34 = self;
      uint64_t v35 = buf;
      [v25 enumerateKeysAndObjectsUsingBlock:v32];
      BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

      _Block_object_dispose(buf, 8);
      goto LABEL_15;
    }
  }
  v26 = [v6 activity];
  [v26 markWithFormat:@"Failed to fetch records: %@", v7];

  v27 = (void *)MEMORY[0x230FBD990]();
  v28 = self;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);
  }
  BOOL v23 = 1;
LABEL_15:

  return v23;
}

void __116__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____shouldFailCloudRecordFetchError_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v6 hmbIsCloudKitError] && objc_msgSend(v6, "code") == 11)
  {
    id v7 = [*(id *)(a1 + 32) activity];
    id v8 = [v5 hmbDescription];
    [v7 markWithFormat:@"Record '%@' does not exist", v8];

    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      __int16 v13 = [v5 hmbDescription];
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Record '%@' does not exist", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = [*(id *)(a1 + 32) activity];
    uint64_t v15 = [v5 hmbDescription];
    [v14 markWithFormat:@"Failed to fetch record %@: %@", v15, v6];

    v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v5 hmbDescription];
      *(_DWORD *)buf = 138543874;
      v22 = v19;
      __int16 v23 = 2112;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch record %@: %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)__shutdownWithActivity:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);
  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self isShuttingDown])
  {
    id v6 = (void *)MEMORY[0x230FBD990]([v4 markWithFormat:@"Already shutting down"]);
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Already shutting down", buf, 0xCu);
    }
    id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v7 shutdownFuture];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke;
    v35[3] = &unk_264A2D1D0;
    id v36 = v4;
    id v11 = v4;
    id v12 = (id)[v10 addCompletionBlock:v35];

    id v13 = v36;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([v4 markWithFormat:@"Shutting down"]);
    uint64_t v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Shutting down", buf, 0xCu);
    }
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 setShuttingDown:1];
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 setLocalZone:0];
    __int16 v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 startupPromise];
    uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    int v20 = [v18 finishWithError:v19];

    if (v20)
    {
      v21 = (void *)MEMORY[0x230FBD990]([v4 markWithFormat:@"Shut down before startup completed"]);
      v22 = v15;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Shut down before startup completed", buf, 0xCu);
      }
    }
    __int16 v25 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 shutdownPromise];
    id v26 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 cloudDatabase];
    uint64_t v27 = [v26 shutdown];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_18;
    v30[3] = &unk_264A15E20;
    id v31 = v4;
    v32 = v5;
    id v33 = v15;
    id v34 = v25;
    id v13 = v25;
    id v28 = v4;
    id v29 = (id)[v27 addCompletionBlock:v30];
  }
}

uint64_t __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_2;
  v8[3] = &unk_264A2E908;
  id v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v6 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = v6;
  id v7 = v4;
  [v5 performBlock:v8];
}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_3;
  v6[3] = &unk_264A2E610;
  id v2 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 64);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  dispatch_async(v2, v6);
}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_3(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_4;
  v6[3] = &unk_264A2E610;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  [v2 performBlock:v6];
}

uint64_t __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) markWithFormat:@"Failed to shut down cloud database: %@", v2]);
    id v4 = *(id *)(a1 + 48);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down cloud database: %@", buf, 0x16u);
    }
  }
  id v8 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) markWithFormat:@"Shutdown completed"]);
  id v9 = *(id *)(a1 + 48);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Shutdown completed", buf, 0xCu);
  }
  [*(id *)(a1 + 56) finishWithNoResult];
  return [*(id *)(a1 + 40) invalidate];
}

- (void)__startupWithLocalZone:(id)a3 activity:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self isShuttingDown])
  {
    id v9 = (void *)MEMORY[0x230FBD990]([v7 markWithFormat:@"Already shutting down"]);
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Already shutting down", (uint8_t *)&v20, 0xCu);
    }
    id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v10 startupPromise];
    uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 finishWithError:v14];
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]([v7 markWithFormat:@"Starting up"]);
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Starting up", (uint8_t *)&v20, 0xCu);
    }
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 setLocalZone:v6];
    uint64_t v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 __loadOrCreateInternalStateModelWithLocalZone:v6 activity:v7];
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 setInternalState:v19];

    id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 startupPromise];
    [v13 finishWithNoResult];
  }

  [v7 invalidate];
}

- (id)__loadOrCreateInternalStateModelWithLocalZone:(id)a3 activity:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel modelID];
  id v27 = 0;
  id v10 = [v6 fetchModelWithModelID:v9 ofType:objc_opt_class() error:&v27];
  id v11 = v27;
  uint64_t v12 = v11;
  if (v10)
  {
    id v13 = (void *)MEMORY[0x230FBD990]([v7 markWithFormat:@"Loaded existing internal state model"]);
    uint64_t v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Loaded existing internal state model", buf, 0xCu);
    }
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = v14;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = HMFGetLogIdentifier();
      v21 = [v10 lastSynchronizedRecordIDs];
      *(_DWORD *)buf = 138543618;
      id v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Last synchronized recordIDs: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]([v7 markWithFormat:@"Creating new internal state model because existing one was not found: %@", v11]);
    __int16 v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v25;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating new internal state model because existing one was not found: %@", buf, 0x16u);
    }
    id v10 = objc_opt_new();
  }

  return v10;
}

- (void)__retryFetchVerificationCertificatesWithFetchInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 activity];
  [v4 retryIntervalSeconds];
  objc_msgSend(v6, "markWithFormat:", @"Will retry the fetch in %lu seconds", (unint64_t)v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    [v4 retryIntervalSeconds];
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    __int16 v22 = 2048;
    unint64_t v23 = (unint64_t)v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry the fetch in %lu seconds", buf, 0x16u);
  }
  [v4 retryIntervalSeconds];
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  [v4 setShouldRetry:0];
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v9);
  __int16 v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke;
  block[3] = &unk_264A2C148;
  id v18 = v4;
  id v16 = v4;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_after(v14, v15, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activity];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke_2;
  v3[3] = &unk_264A2C148;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 performBlock:v3];

  objc_destroyWeak(&v5);
}

void __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) activity];
    [v3 markWithFormat:@"Retrying fetch for verification certificates"];

    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = WeakRetained;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying fetch for verification certificates", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(v5, "__fetchVerificationCertificatesWithFetchInfo:", *(void *)(a1 + 32));
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    [*(id *)(a1 + 32) finishWithError:v8];
  }
}

- (BOOL)__canRecoverFromVerificationCertificatesError:(id)a3 fetchInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "hmd_isCKError")
    && (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) == 0
    && ([v6 hmbCloudKitRetryDelay],
        objc_msgSend(v7, "setRetryIntervalSeconds:"),
        [v7 shouldRetry]))
  {
    int v9 = [v7 activity];
    [v9 markWithFormat:@"Ignoring non-fatal error: %@", v6];

    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    double v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)__fetchVerificationCertificatesCompleted:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    double v12 = [(id)objc_opt_class() publicKeysFromCertificateRecord:v9];
    if ([v12 count])
    {
      [v8 setSignatureVerificationPublicKeys:v12];
      [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __fetchZoneChangesWithFetchInfo:v8];
    }
    else
    {
      double v13 = (void *)MEMORY[0x230FBD990]();
      BOOL v14 = self;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = [v9 recordID];
        __int16 v18 = [v17 hmbDescription];
        int v26 = 138543618;
        id v27 = v16;
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get any usable public keys from record: %@", (uint8_t *)&v26, 0x16u);
      }
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v8 finishWithError:v19];
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v10
    && ![(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __canRecoverFromVerificationCertificatesError:v10 fetchInfo:v8])
  {
    [v8 finishWithError:v10];
    goto LABEL_15;
  }
  if (![v8 shouldRetry])
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [0 recordID];
      __int16 v25 = [v24 hmbDescription];
      int v26 = 138543618;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Fetch returned no verification certificates record: %@", (uint8_t *)&v26, 0x16u);
    }
    double v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v8 finishWithError:v12];
    goto LABEL_14;
  }
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __retryFetchVerificationCertificatesWithFetchInfo:v8];
LABEL_15:
}

- (void)__fetchVerificationCertificatesWithFetchInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  id v6 = [v4 operationGroup];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke;
  double v13 = &unk_264A1CEE8;
  id v7 = v4;
  id v14 = v7;
  __int16 v15 = self;
  objc_copyWeak(&v16, &location);
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self fetchVerificationCertificatesRecordWithOperationGroup:v6 completion:&v10];

  id v8 = objc_msgSend(v7, "operationStartTime", v10, v11, v12, v13);

  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF910] now];
    [v7 setOperationStartTime:v9];
  }
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) activity];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke_2;
  v12[3] = &unk_264A1CEC0;
  id v8 = v6;
  id v13 = v8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v11 = v5;
  id v16 = v11;
  [v7 performBlock:v12];

  objc_destroyWeak(&v17);
}

void __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) activity];
  id v4 = v3;
  if (v2)
  {
    [v3 markWithFormat:@"Fetch records operation completed unsuccessfully: %@", *(void *)(a1 + 32)];

    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 48);
    id v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    unint64_t v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    uint64_t v10 = "%{public}@Fetch records operation completed unsuccessfully: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 22;
  }
  else
  {
    [v3 markWithFormat:@"Fetch records operation completed successfully"];

    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 48);
    id v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    unint64_t v23 = v8;
    uint64_t v10 = "%{public}@Fetch records operation completed successfully";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
  }
  _os_log_impl(&dword_22F52A000, v11, v12, v10, buf, v13);

LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "__fetchVerificationCertificatesCompleted:record:error:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 32));
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) activity];
    [v16 markWithFormat:@"Mirror has been deallocated"];

    id v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = objc_opt_class();
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unint64_t v23 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Mirror has been deallocated", buf, 0xCu);
    }
    id v21 = *(id *)(a1 + 32);
    if (!v21)
    {
      id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    }
    [*(id *)(a1 + 40) finishWithError:v21];
  }
}

- (void)fetchVerificationCertificatesRecordWithOperationGroup:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "__certificatesRecordID");
  id v10 = objc_alloc(MEMORY[0x263EFD6D8]);
  v21[0] = v9;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  os_log_type_t v12 = (void *)[v10 initWithRecordIDs:v11];

  [v12 setCallbackQueue:v8];
  if (v6) {
    [v12 setGroup:v6];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __153__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates__fetchVerificationCertificatesRecordWithOperationGroup_completion___block_invoke;
  v17[3] = &unk_264A1CE98;
  __int16 v18 = v8;
  id v19 = self;
  id v20 = v7;
  id v13 = v7;
  id v14 = v8;
  [v12 setFetchRecordsCompletionBlock:v17];
  uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v16 = [v15 publicDatabase];
  [v16 addOperation:v12];
}

void __153__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates__fetchVerificationCertificatesRecordWithOperationGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_assert_queue_V2(v5);
  id v7 = objc_msgSend((id)objc_opt_class(), "__certificatesRecordID");
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v10 = (uint64_t)v11;
    if (!v11)
    {
      uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    id v11 = (id)v10;
  }
  v9();
}

+ (id)publicKeysFromCertificateRecord:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v16 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend((id)objc_opt_class(), "__recordKeyCertificatePrefix:", *(void *)(*((void *)&v17 + 1) + 8 * i));
        id v11 = v10;
        if (v10)
        {
          os_log_type_t v12 = [v10 stringByAppendingString:@"_ckAsset"];
          id v13 = objc_msgSend(a1, "__publicKeyFromCertificateRecord:dataKey:assetKey:", v4, v11, v12);
          if (v13) {
            [v16 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if ([v16 count]) {
    id v14 = (void *)[v16 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (id)__publicKeyFromCertificateRecord:(id)a3 dataKey:(id)a4 assetKey:(id)a5
{
  v95[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v10;
  v95[0] = v9;
  v95[1] = v10;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:2];
  uint64_t v14 = objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordSignatureVerificationCertificateChain");
  id v90 = 0;
  uint64_t v15 = stringFromCKRecord(v11, v9, v12, v14, &v90);
  id v16 = v90;
  long long v17 = v16;
  if (v15)
  {
    v85 = v15;
    long long v18 = [v15 componentsSeparatedByString:@","];
    if ([v18 count])
    {
      v81 = v17;
      v83 = v11;
      v84 = v13;
      long long v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v18, "count"));
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v86 objects:v91 count:16];
      id v82 = v9;
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v87;
        v80 = v18;
LABEL_5:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v87 != v23) {
            objc_enumerationMutation(v20);
          }
          CFDataRef v25 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:*(void *)(*((void *)&v86 + 1) + 8 * v24) options:0];
          if (!v25) {
            break;
          }
          CFDataRef v26 = v25;
          SecCertificateRef v27 = SecCertificateCreateWithData(0, v25);
          if (!v27)
          {
            v79 = (void *)MEMORY[0x230FBD990]();
            id v58 = a1;
            v56 = HMFGetOSLogHandle();
            long long v17 = v81;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              v59 = HMFGetLogIdentifier();
              *(_DWORD *)trust = 138543618;
              *(void *)&trust[4] = v59;
              __int16 v93 = 2112;
              *(void *)v94 = v84;
              _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to create certificate from data using keys: %@", trust, 0x16u);
            }
LABEL_31:
            uint64_t v42 = v82;
            id v11 = v83;
            goto LABEL_33;
          }
          SecCertificateRef v28 = v27;
          [v19 addObject:v27];

          if (v22 == ++v24)
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v86 objects:v91 count:16];
            long long v18 = v80;
            if (v22) {
              goto LABEL_5;
            }
            goto LABEL_12;
          }
        }
        v79 = (void *)MEMORY[0x230FBD990]();
        id v55 = a1;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)trust = 138543874;
          *(void *)&trust[4] = v57;
          __int16 v93 = 2112;
          *(void *)v94 = v84;
          *(_WORD *)&v94[8] = 2112;
          long long v17 = v81;
          *(void *)&v94[10] = v81;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Invalid certificate data in record using keys: %@: %@", trust, 0x20u);

          CFDataRef v26 = 0;
          goto LABEL_31;
        }
        CFDataRef v26 = 0;
        uint64_t v42 = v82;
        id v11 = v83;
        long long v17 = v81;
LABEL_33:
        long long v18 = v80;

        __int16 v40 = 0;
        goto LABEL_49;
      }
LABEL_12:

      id v29 = objc_msgSend(a1, "__createSignatureVerificationPolicy");
      if (v29)
      {
        id v20 = v29;
        *(void *)trust = 0;
        OSStatus v30 = SecTrustCreateWithCertificates(v19, v29, (SecTrustRef *)trust);
        OSStatus v31 = v30;
        uint64_t v32 = *(__SecTrust **)trust;
        v78 = *(void **)trust;
        if (!*(void *)trust || v30)
        {
          v64 = (void *)MEMORY[0x230FBD990]();
          id v65 = a1;
          v66 = HMFGetOSLogHandle();
          long long v17 = v81;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)trust = 138543874;
            *(void *)&trust[4] = v67;
            __int16 v93 = 1024;
            *(_DWORD *)v94 = v31;
            *(_WORD *)&v94[4] = 2112;
            *(void *)&v94[6] = v84;
            _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to create trust (result %i) from certificate using keys: %@", trust, 0x1Cu);
          }
          __int16 v40 = 0;
          uint64_t v42 = v82;
          id v11 = v83;
        }
        else
        {
          *(void *)trust = 0;
          BOOL v33 = SecTrustEvaluateWithError(v32, (CFErrorRef *)trust);
          id v34 = *(void **)trust;
          context = (void *)MEMORY[0x230FBD990]();
          id v35 = a1;
          id v36 = HMFGetOSLogHandle();
          char v37 = v36;
          v77 = v34;
          if (!v33 || v34)
          {
            id v11 = v83;
            long long v17 = v81;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v68 = HMFGetLogIdentifier();
              *(_DWORD *)trust = 138543874;
              *(void *)&trust[4] = v68;
              __int16 v93 = 2112;
              *(void *)v94 = v84;
              *(_WORD *)&v94[8] = 2112;
              *(void *)&v94[10] = v77;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Certificate did not pass trust evaluation with keys: %@, error: %@", trust, 0x20u);

              id v11 = v83;
            }

            __int16 v40 = 0;
          }
          else
          {
            id v11 = v83;
            long long v17 = v81;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v38 = HMFGetLogIdentifier();
              *(_DWORD *)trust = 138543618;
              *(void *)&trust[4] = v38;
              __int16 v93 = 2112;
              *(void *)v94 = v84;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Trusted certificate found in record using keys: %@", trust, 0x16u);

              id v11 = v83;
            }

            uint64_t v39 = (void *)MEMORY[0x230FBC9D0](v32);
            __int16 v40 = v39;
            if (v39)
            {
              id v41 = v39;
            }
            else
            {
              v69 = (void *)MEMORY[0x230FBD990]();
              id v70 = v35;
              v71 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                contexta = v69;
                v73 = v72 = v11;
                *(_DWORD *)trust = 138543618;
                *(void *)&trust[4] = v73;
                __int16 v93 = 2112;
                *(void *)v94 = v84;
                _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to get public key from trust in record using keys: %@", trust, 0x16u);

                id v11 = v72;
                v69 = contexta;
              }
            }
          }
          uint64_t v42 = v82;
        }
      }
      else
      {
        v60 = (void *)MEMORY[0x230FBD990]();
        id v61 = a1;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v63 = HMFGetLogIdentifier();
          *(_DWORD *)trust = 138543362;
          *(void *)&trust[4] = v63;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to create security policy to verify certificates", trust, 0xCu);
        }
        id v20 = 0;
        __int16 v40 = 0;
        uint64_t v42 = v82;
        id v11 = v83;
        long long v17 = v81;
      }
LABEL_49:

      id v13 = v84;
    }
    else
    {
      uint64_t v42 = v9;
      v50 = (void *)MEMORY[0x230FBD990]();
      id v51 = a1;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = v53 = v11;
        *(_DWORD *)trust = 138543874;
        *(void *)&trust[4] = v54;
        __int16 v93 = 2112;
        *(void *)v94 = v13;
        *(_WORD *)&v94[8] = 2112;
        *(void *)&v94[10] = v17;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@No certificates found on record using keys: %@: %@", trust, 0x20u);

        id v11 = v53;
      }

      __int16 v40 = 0;
    }

    uint64_t v15 = v85;
  }
  else
  {
    uint64_t v42 = v9;
    id v43 = v12;
    id v44 = v16;
    v45 = (void *)MEMORY[0x230FBD990]();
    id v46 = a1;
    v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = v48 = v11;
      *(_DWORD *)trust = 138543874;
      *(void *)&trust[4] = v49;
      __int16 v93 = 2112;
      *(void *)v94 = v13;
      *(_WORD *)&v94[8] = 2112;
      *(void *)&v94[10] = v44;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to read data from certificate record using keys: %@: %@", trust, 0x20u);

      id v11 = v48;
    }

    __int16 v40 = 0;
    long long v17 = v44;
    id v12 = v43;
  }

  return v40;
}

+ (id)__recordKeyCertificatePrefix:(id)a3
{
  id v3 = a3;
  if (__recordKeyCertificatePrefix__onceToken != -1) {
    dispatch_once(&__recordKeyCertificatePrefix__onceToken, &__block_literal_global_23_79265);
  }
  id v4 = objc_msgSend((id)__recordKeyCertificatePrefix__prefixRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  id v5 = v4;
  if (v4 && (unint64_t)[v4 numberOfRanges] >= 2)
  {
    uint64_t v7 = [v5 rangeAtIndex:1];
    uint64_t v6 = objc_msgSend(v3, "substringWithRange:", v7, v8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____recordKeyCertificatePrefix___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(CD_certificate(?:\\d+|))(?:$|_ckAsset$)" options:0 error:0];
  v1 = (void *)__recordKeyCertificatePrefix__prefixRegex;
  __recordKeyCertificatePrefix__prefixRegex = v0;
}

+ (id)__certificatesRecordID
{
  if (__certificatesRecordID_onceToken != -1) {
    dispatch_once(&__certificatesRecordID_onceToken, &__block_literal_global_79270);
  }
  uint64_t v2 = (void *)__certificatesRecordID_certificatesRecordID;
  return v2;
}

void __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____certificatesRecordID__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  id v3 = (id)[v0 initWithZoneName:@"certificates" ownerName:*MEMORY[0x263EFD488]];
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:@"certificates" zoneID:v3];
  uint64_t v2 = (void *)__certificatesRecordID_certificatesRecordID;
  __certificatesRecordID_certificatesRecordID = v1;
}

+ (id)__createSignatureVerificationPolicy
{
  ApplePinned = (void *)SecPolicyCreateApplePinned();
  return ApplePinned;
}

+ (unint64_t)__maxSizeForCKRecordSignatureVerificationCertificateChain
{
  if (!isInternalBuild()) {
    return 0x200000;
  }
  uint64_t v2 = [MEMORY[0x263F42608] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorSignatureVerificationCertificateChainMaxSize"];

  id v4 = [v3 numberValue];

  if (v4)
  {
    id v5 = [v3 numberValue];
    unint64_t v6 = [v5 unsignedIntegerValue];
  }
  else
  {
    unint64_t v6 = 0x200000;
  }

  return v6;
}

- (BOOL)__removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 activity:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v16);

  if (v12 && v13)
  {
    id v17 = objc_alloc(MEMORY[0x263EFD808]);
    long long v18 = (void *)[v17 initWithZoneName:v12 ownerName:*MEMORY[0x263EFD488]];
    long long v19 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v13 zoneID:v18];
    id v20 = [MEMORY[0x263EFFA08] setWithObject:v19];
    BOOL v21 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __removeOverridesForRecordIDs:v20 options:v14 activity:v15 error:a7];
  }
  else
  {
    if (v12) {
      BOOL v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __removeOverridesForZoneName:v12 options:v14 activity:v15 error:a7];
    }
    else {
      BOOL v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __removeAllOverridesWithOptions:v14 activity:v15 error:a7];
    }
    BOOL v21 = v22;
  }

  return v21;
}

- (BOOL)__removeOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Removing overrides for zone '%@'", v10]);
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v107 = v17;
    __int16 v108 = 2112;
    v109 = v10;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Removing overrides for zone '%@'", buf, 0x16u);
  }
  uint64_t v18 = objc_opt_class();
  long long v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 localZone];
  id v105 = 0;
  id v20 = [v19 fetchModelsOfType:v18 error:&v105];
  BOOL v21 = (char *)v105;

  if (!v20)
  {
    id v43 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to fetch override models: %@", v21]);
    id v44 = v15;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      id v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v107 = v46;
      __int16 v108 = 2112;
      v109 = v21;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch override models: %@", buf, 0x16u);
    }
    char v47 = 0;
    if (a6) {
      *a6 = v21;
    }
    goto LABEL_62;
  }
  if (![v20 count])
  {
    char v47 = 1;
    goto LABEL_62;
  }
  BOOL v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 localZone];
  uint64_t v23 = [v22 createMirrorInputWithError:a6];

  v91 = (void *)v23;
  if (!v23)
  {
    char v47 = 0;
    goto LABEL_61;
  }
  v96 = v15;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v24 = v20;
  long long v88 = v10;
  long long v87 = v21;
  uint64_t v93 = [v24 countByEnumeratingWithState:&v101 objects:v114 count:16];
  if (!v93)
  {

    CFDataRef v25 = 0;
    char v47 = 1;
    goto LABEL_50;
  }
  id obj = v24;
  v84 = v20;
  v85 = a6;
  id v86 = v11;
  v92 = 0;
  CFDataRef v25 = 0;
  uint64_t v94 = *(void *)v102;
  long long v89 = v12;
  while (2)
  {
    for (uint64_t i = 0; i != v93; ++i)
    {
      if (*(void *)v102 != v94) {
        objc_enumerationMutation(obj);
      }
      SecCertificateRef v27 = [*(id *)(*((void *)&v101 + 1) + 8 * i) hmbModelID];
      SecCertificateRef v28 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v96 localZone];
      id v100 = v25;
      id v29 = [v28 externalIDForModelID:v27 error:&v100];
      OSStatus v30 = (char *)v100;

      if (!v29)
      {
        v48 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to fetch externalID for modelID %@: %@", v27, v30]);
        v49 = v96;
        v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          id v51 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v107 = v51;
          __int16 v108 = 2112;
          v109 = v27;
          __int16 v110 = 2112;
          v111 = v30;
          _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch externalID for modelID %@: %@", buf, 0x20u);
        }
        BOOL v21 = v87;
        goto LABEL_40;
      }
      v99 = v30;
      OSStatus v31 = [MEMORY[0x263EFD7E8] recordIDFromExternalID:v29 error:&v99];
      id v32 = v99;

      if (!v31)
      {
        v52 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", v29, v27, v32]);
        v53 = v96;
        v54 = v96;
        id v55 = HMFGetOSLogHandle();
        BOOL v21 = v87;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v56 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v107 = v56;
          __int16 v108 = 2112;
          v109 = v29;
          __int16 v110 = 2112;
          v111 = v27;
          __int16 v112 = 2112;
          id v113 = v32;
          _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", buf, 0x2Au);
        }
        OSStatus v31 = 0;
LABEL_39:

        OSStatus v30 = (char *)v32;
        id v10 = v88;
LABEL_40:

        CFDataRef v25 = v30;
        goto LABEL_41;
      }
      BOOL v33 = [v31 zoneID];
      id v34 = [v33 zoneName];
      int v35 = [v34 isEqualToString:v10];

      if (v35)
      {
        id v36 = [v31 hmbDescription];
        [v12 markWithFormat:@"Removing override for %@", v36];

        char v37 = (void *)MEMORY[0x230FBD990]();
        uint64_t v38 = v96;
        uint64_t v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v40 = HMFGetLogIdentifier();
          id v41 = [v31 hmbDescription];
          *(_DWORD *)buf = 138543618;
          v107 = v40;
          __int16 v108 = 2112;
          v109 = v41;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Removing override for %@", buf, 0x16u);

          id v10 = v88;
        }

        id v98 = v32;
        char v42 = [v91 stageRemovalForModelWithID:v27 error:&v98];
        CFDataRef v25 = v98;

        if ((v42 & 1) == 0)
        {
          v57 = [v31 hmbDescription];
          [v89 markWithFormat:@"Failed to remove model %@: %@", v57, v25];

          uint64_t v95 = MEMORY[0x230FBD990]();
          id v58 = v38;
          id v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v59 = HMFGetLogIdentifier();
            v60 = [v31 hmbDescription];
            *(_DWORD *)buf = 138543874;
            v107 = v59;
            __int16 v108 = 2112;
            v109 = v60;
            __int16 v110 = 2112;
            v111 = (char *)v25;
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model %@: %@", buf, 0x20u);
          }
          id v32 = v25;
          id v12 = v89;
          BOOL v21 = v87;
          v52 = (void *)v95;
          v53 = v96;
          goto LABEL_39;
        }
        ++v92;
        id v12 = v89;
      }
      else
      {
        CFDataRef v25 = v32;
      }
    }
    BOOL v21 = v87;
    uint64_t v93 = [obj countByEnumeratingWithState:&v101 objects:v114 count:16];
    if (v93) {
      continue;
    }
    break;
  }
LABEL_41:

  char v47 = v25 == 0;
  if (!v25 && v92)
  {
    id v61 = (void *)MEMORY[0x230FBD990](objc_msgSend(v12, "markWithFormat:", @"Committing removal of %lu overrides", v92));
    v62 = v96;
    v63 = HMFGetOSLogHandle();
    id v11 = v86;
    id v20 = v84;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v65 = v64 = v12;
      *(_DWORD *)buf = 138543618;
      v107 = v65;
      __int16 v108 = 2048;
      v109 = v92;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@Committing removal of %lu overrides", buf, 0x16u);

      id v12 = v64;
    }

    id v97 = 0;
    char v47 = [v91 frmSyncCommitWithOptions:v86 error:&v97];
    v66 = (char *)v97;
    v67 = v66;
    if (v47)
    {
      v68 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Committed removal of overrides successfully"]);
      v69 = v62;
      id v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v72 = id v71 = v12;
        *(_DWORD *)buf = 138543362;
        v107 = v72;
        _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@Committed removal of overrides successfully", buf, 0xCu);

        id v12 = v71;
        BOOL v21 = v87;
      }
    }
    else
    {
      v78 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to commit: %@", v66]);
      v79 = v62;
      v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v82 = v81 = v12;
        *(_DWORD *)buf = 138543618;
        v107 = v82;
        __int16 v108 = 2112;
        v109 = v67;
        _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

        id v12 = v81;
        BOOL v21 = v87;
      }

      if (v85) {
        id *v85 = v67;
      }
    }

    CFDataRef v25 = 0;
    id v10 = v88;
    goto LABEL_60;
  }
  a6 = v85;
  id v11 = v86;
  id v20 = v84;
  if (!v92)
  {
LABEL_50:
    [v12 markWithFormat:@"No matching models found, aborting"];
    v73 = (void *)MEMORY[0x230FBD990]();
    v74 = v96;
    v75 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v77 = id v76 = v12;
      *(_DWORD *)buf = 138543362;
      v107 = v77;
      _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_INFO, "%{public}@No matching models found, aborting", buf, 0xCu);

      id v12 = v76;
      BOOL v21 = v87;
    }

    id v10 = v88;
  }
  [v91 abort];
  if (a6)
  {
    CFDataRef v25 = v25;
    *a6 = v25;
  }
LABEL_60:

LABEL_61:
LABEL_62:

  return v47;
}

- (BOOL)__removeOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Removing overrides for recordIDs: %@", v10]);
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v17;
    __int16 v69 = 2112;
    id v70 = v10;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Removing overrides for recordIDs: %@", buf, 0x16u);
  }
  uint64_t v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 localZone];
  uint64_t v19 = [v18 createMirrorInputWithError:a6];

  v60 = (void *)v19;
  if (v19)
  {
    v56 = a6;
    id v59 = v11;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v57 = v15;
      id v58 = v12;
      id v55 = v10;
      id v23 = 0;
      uint64_t v24 = *(void *)v64;
      while (2)
      {
        uint64_t v25 = 0;
        CFDataRef v26 = v23;
        do
        {
          if (*(void *)v64 != v24) {
            objc_enumerationMutation(v20);
          }
          SecCertificateRef v27 = *(void **)(*((void *)&v63 + 1) + 8 * v25);
          SecCertificateRef v28 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:v27];
          id v62 = v26;
          char v29 = [v60 stageRemovalForModelWithID:v28 error:&v62];
          id v23 = v62;

          if ((v29 & 1) == 0)
          {
            OSStatus v30 = [v27 hmbDescription];
            [v58 markWithFormat:@"Failed to remove model %@: %@", v30, v23];

            OSStatus v31 = (void *)MEMORY[0x230FBD990]();
            id v15 = v57;
            id v32 = v57;
            BOOL v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              id v34 = HMFGetLogIdentifier();
              int v35 = [v27 hmbDescription];
              *(_DWORD *)buf = 138543874;
              v68 = v34;
              __int16 v69 = 2112;
              id v70 = v35;
              __int16 v71 = 2112;
              id v72 = v23;
              _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model %@: %@", buf, 0x20u);
            }

            goto LABEL_16;
          }

          ++v25;
          CFDataRef v26 = v23;
        }
        while (v22 != v25);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
        id v15 = v57;
        if (v22) {
          continue;
        }
        break;
      }
LABEL_16:

      id v10 = v55;
      id v12 = v58;
      if (v23)
      {
        [v60 abort];
        id v11 = v59;
        if (v56)
        {
          id v23 = v23;
          char v36 = 0;
          id *v56 = v23;
        }
        else
        {
          char v36 = 0;
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
    }
    char v37 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Committing removal of overrides"]);
    uint64_t v38 = v15;
    uint64_t v39 = HMFGetOSLogHandle();
    id v11 = v59;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v41 = id v40 = v12;
      *(_DWORD *)buf = 138543362;
      v68 = v41;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Committing removal of overrides", buf, 0xCu);

      id v12 = v40;
    }

    id v61 = 0;
    char v36 = [v60 frmSyncCommitWithOptions:v59 error:&v61];
    id v42 = v61;
    id v43 = v42;
    if (v36)
    {
      id v44 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Committed removal of overrides successfully"]);
      v45 = v38;
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = id v47 = v12;
        *(_DWORD *)buf = 138543362;
        v68 = v48;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Committed removal of overrides successfully", buf, 0xCu);

        id v12 = v47;
      }
    }
    else
    {
      v49 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to commit: %@", v42]);
      v50 = v38;
      id v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = id v52 = v12;
        *(_DWORD *)buf = 138543618;
        v68 = v53;
        __int16 v69 = 2112;
        id v70 = v43;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

        id v12 = v52;
      }

      if (v56) {
        id *v56 = v43;
      }
    }

    id v23 = 0;
    goto LABEL_32;
  }
  char v36 = 0;
LABEL_33:

  return v36;
}

- (BOOL)__removeAllOverridesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x230FBD990]([v9 markWithFormat:@"Removing all overrides"]);
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v32 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all overrides", buf, 0xCu);
  }
  id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v12 localZone];
  v35[0] = objc_opt_class();
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  id v17 = [v15 removeAllModelsOfTypes:v16 options:v8];

  id v30 = 0;
  id v18 = (id)[v17 blockAndWaitForCompletionWithError:&v30];
  id v19 = v30;
  id v20 = v19;
  if (v19)
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]([v9 markWithFormat:@"Failed to remove all previous overrides: %@", v19]);
    uint64_t v22 = v12;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all previous overrides: %@", buf, 0x16u);
    }
    if (a5) {
      *a5 = v20;
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]([v9 markWithFormat:@"Successfully removed all previous overrides"]);
    CFDataRef v26 = v12;
    SecCertificateRef v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      SecCertificateRef v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v32 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all previous overrides", buf, 0xCu);
    }
  }

  return v20 == 0;
}

- (BOOL)__addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 activity:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if (v10) {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __removeAllOverridesWithOptions:v12 activity:v13 error:0];
  }
  id v15 = objc_msgSend((id)objc_opt_class(), "__overrideParentModelID");
  id v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self localZone];
  id v17 = [v16 createMirrorInputWithError:a7];

  if (v17)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    id v47 = __Block_byref_object_copy__138257;
    v48 = __Block_byref_object_dispose__138258;
    id v49 = 0;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____addOverrides_replace_options_activity_error___block_invoke;
    v38[3] = &unk_264A211C0;
    id v18 = v13;
    id v39 = v18;
    id v40 = self;
    id v43 = &v44;
    id v41 = v15;
    id v19 = v17;
    id v42 = v19;
    [v36 enumerateKeysAndObjectsUsingBlock:v38];
    if (v45[5])
    {
      [v19 abort];
      char v20 = 0;
      if (a7) {
        *a7 = (id) v45[5];
      }
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]([v18 markWithFormat:@"Committing overrides"]);
      uint64_t v21 = self;
      HMFGetOSLogHandle();
      uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v51 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Committing overrides", buf, 0xCu);
      }
      id v37 = 0;
      char v20 = [v19 frmSyncCommitWithOptions:v12 error:&v37];
      id v24 = v37;
      uint64_t v25 = v24;
      if (v20)
      {
        CFDataRef v26 = (void *)MEMORY[0x230FBD990]([v18 markWithFormat:@"Committed overrides successfully"]);
        SecCertificateRef v27 = v21;
        HMFGetOSLogHandle();
        SecCertificateRef v28 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          char v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v51 = v29;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Committed overrides successfully", buf, 0xCu);
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]([v18 markWithFormat:@"Failed to commit: %@", v24]);
        id v30 = v21;
        HMFGetOSLogHandle();
        OSStatus v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v51 = v32;
          __int16 v52 = 2112;
          v53 = v25;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);
        }
        if (a7) {
          *a7 = v25;
        }
      }
    }
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____addOverrides_replace_options_activity_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v39 = 0;
  id v9 = [v7 externalID:&v39];
  id v10 = v39;
  id v11 = v39;
  if (v9)
  {
    id v12 = [MEMORY[0x263EFF8F8] data];
    uint64_t v13 = [v8 objectForKeyedSubscript:@"networkDeclarations"];
    uint64_t v14 = [v8 objectForKeyedSubscript:@"pairedMetadata"];
    if (v13 | v14)
    {
      id v36 = a4;
      int v35 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:v7];
      id v15 = [[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel alloc] initWithModelID:v35 parentModelID:*(void *)(a1 + 48) networkDeclarationsData:v13 pairedMetadataData:v14];
      id v16 = *(void **)(a1 + 56);
      id v38 = v11;
      id v34 = v12;
      char v17 = [v16 stageAdditionForModel:v15 externalID:v9 externalData:v12 error:&v38];
      id obj = v38;
      id v18 = v38;

      if ((v17 & 1) == 0)
      {
        id v19 = *(void **)(a1 + 32);
        char v20 = [v7 hmbDescription];
        id v32 = v18;
        [v19 markWithFormat:@"Failed to update model for %@: %@", v20, v18];

        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = *(id *)(a1 + 40);
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v30 = HMFGetLogIdentifier();
          OSStatus v31 = v21;
          uint64_t v24 = [v7 hmbDescription];
          *(_DWORD *)buf = 138543874;
          id v41 = v30;
          __int16 v42 = 2112;
          uint64_t v43 = v24;
          uint64_t v25 = (void *)v24;
          __int16 v44 = 2112;
          id v45 = v32;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model for %@: %@", buf, 0x20u);

          uint64_t v21 = v31;
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
        unsigned char *v36 = 1;
        id v18 = v32;
      }

      id v11 = v18;
      id v12 = v34;
    }
  }
  else
  {
    CFDataRef v26 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Failed to determine externalID: %@", v11]);
    id v27 = *(id *)(a1 + 40);
    SecCertificateRef v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = id v37 = a4;
      *(_DWORD *)buf = 138543618;
      id v41 = v29;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v11;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);

      a4 = v37;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
    *a4 = 1;
  }
}

- (id)__fetchOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  long long v64 = self;
  if (v10)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Fetching overrides for zone '%@'", v10]);
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    char v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v75 = v17;
    __int16 v76 = 2112;
    id v77 = v10;
    id v18 = "%{public}@Fetching overrides for zone '%@'";
    id v19 = v16;
    uint32_t v20 = 22;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Fetching all overrides"]);
    uint64_t v21 = self;
    id v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    char v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v75 = v17;
    id v18 = "%{public}@Fetching all overrides";
    id v19 = v16;
    uint32_t v20 = 12;
  }
  _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

LABEL_7:
  uint64_t v22 = objc_opt_class();
  id v23 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self localZone];
  id v73 = 0;
  uint64_t v24 = [v23 fetchModelsOfType:v22 error:&v73];
  id v25 = v73;

  if (v24)
  {
    if ([v24 count])
    {
      id v58 = v25;
      long long v63 = v12;
      id v60 = v11;
      id v65 = v10;
      id v61 = [MEMORY[0x263EFF9A0] dictionary];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v59 = v24;
      id obj = v24;
      uint64_t v26 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      id v27 = self;
      if (v26)
      {
        uint64_t v28 = v26;
        uint64_t v66 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v70 != v66) {
              objc_enumerationMutation(obj);
            }
            id v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            OSStatus v31 = [v30 hmbModelID];
            id v32 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v27 localZone];
            id v68 = 0;
            __int16 v33 = [v32 externalIDForModelID:v31 error:&v68];
            id v34 = v68;

            if (v33)
            {
              id v67 = v34;
              int v35 = [MEMORY[0x263EFD7E8] recordIDFromExternalID:v33 error:&v67];
              id v36 = v67;

              if (v35)
              {
                if (!v65
                  || ([v35 zoneID],
                      id v37 = objc_claimAutoreleasedReturnValue(),
                      [v37 zoneName],
                      id v38 = objc_claimAutoreleasedReturnValue(),
                      int v39 = [v38 isEqualToString:v65],
                      v38,
                      v37,
                      v39))
                {
                  id v40 = [MEMORY[0x263EFF9A0] dictionary];
                  id v41 = [v30 networkDeclarationsData];
                  [v40 setObject:v41 forKeyedSubscript:@"networkDeclarations"];

                  __int16 v42 = [v30 pairedMetadataData];
                  [v40 setObject:v42 forKeyedSubscript:@"pairedMetadata"];

                  uint64_t v43 = (void *)[v40 copy];
                  [v61 setObject:v43 forKeyedSubscript:v35];
                }
              }
              else
              {
                v48 = (void *)MEMORY[0x230FBD990]([v63 markWithFormat:@"Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", v33, v31, v36]);
                id v49 = v27;
                v50 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  id v51 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  v75 = v51;
                  __int16 v76 = 2112;
                  id v77 = v33;
                  __int16 v78 = 2112;
                  id v79 = v31;
                  __int16 v80 = 2112;
                  id v81 = v36;
                  _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", buf, 0x2Au);
                }
              }

              id v27 = v64;
            }
            else
            {
              __int16 v44 = (void *)MEMORY[0x230FBD990]([v63 markWithFormat:@"Failed to fetch externalID for modelID %@: %@", v31, v34]);
              id v45 = v27;
              uint64_t v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                id v47 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v75 = v47;
                __int16 v76 = 2112;
                id v77 = v31;
                __int16 v78 = 2112;
                id v79 = v34;
                _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch externalID for modelID %@: %@", buf, 0x20u);
              }
              id v36 = v34;
            }
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
        }
        while (v28);
      }

      __int16 v52 = (void *)[v61 copy];
      id v10 = v65;
      uint64_t v24 = v59;
      id v11 = v60;
      id v12 = v63;
      id v25 = v58;
    }
    else
    {
      __int16 v52 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    v53 = (void *)MEMORY[0x230FBD990]([v12 markWithFormat:@"Failed to fetch override models: %@", v25]);
    uint64_t v54 = self;
    id v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v75 = v56;
      __int16 v76 = 2112;
      id v77 = v25;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch override models: %@", buf, 0x16u);
    }
    __int16 v52 = 0;
    if (a6) {
      *a6 = v25;
    }
  }

  return v52;
}

- (id)__fetchOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v35 = a4;
  id v41 = a5;
  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v40 = objc_opt_class();
  id v38 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v9;
  uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v42)
  {
    uint64_t v39 = *(void *)v46;
    id v36 = self;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v14 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:v12];
        id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self localZone];
        id v44 = 0;
        id v16 = [v15 fetchModelWithModelID:v14 ofType:v40 error:&v44];
        id v17 = v44;

        uint64_t v18 = [v12 hmbDescription];
        id v19 = (void *)v18;
        if (v16)
        {
          id v43 = v17;
          [v41 markWithFormat:@"Model %@ (%@) found in override zone", v14, v18];

          uint32_t v20 = (void *)MEMORY[0x230FBD990]();
          uint64_t v21 = self;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            id v23 = HMFGetLogIdentifier();
            uint64_t v24 = [v12 hmbDescription];
            *(_DWORD *)buf = 138543874;
            v50 = v23;
            __int16 v51 = 2112;
            __int16 v52 = v14;
            __int16 v53 = 2112;
            uint64_t v54 = v24;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Model %@ (%@) found in override zone", buf, 0x20u);

            self = v36;
          }

          id v25 = [v16 networkDeclarationsData];
          [v13 setObject:v25 forKeyedSubscript:@"networkDeclarations"];

          uint64_t v26 = [v16 pairedMetadataData];
          [v13 setObject:v26 forKeyedSubscript:@"pairedMetadata"];

          id v27 = (void *)[v13 copy];
          [v38 setObject:v27 forKeyedSubscript:v12];

          id v17 = v43;
        }
        else
        {
          [v41 markWithFormat:@"No model %@ (%@) found in override zone: %@", v14, v18, v17, v35];

          uint64_t v28 = (void *)MEMORY[0x230FBD990]();
          char v29 = self;
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            OSStatus v31 = HMFGetLogIdentifier();
            id v32 = [v12 hmbDescription];
            *(_DWORD *)buf = 138544130;
            v50 = v31;
            __int16 v51 = 2112;
            __int16 v52 = v14;
            __int16 v53 = 2112;
            uint64_t v54 = v32;
            __int16 v55 = 2112;
            id v56 = v17;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEBUG, "%{public}@No model %@ (%@) found in override zone: %@", buf, 0x2Au);

            self = v36;
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v42);
  }

  __int16 v33 = (void *)[v38 copy];
  return v33;
}

- (BOOL)__removeAllLocalRulesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v11 = [v10 publicZoneIDs];

  if ([v11 count])
  {
    id v12 = (void *)MEMORY[0x230FBD990]([v8 markWithFormat:@"Removing cloud zones: %@", v11]);
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v15;
      __int16 v28 = 2112;
      char v29 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing cloud zones: %@", buf, 0x16u);
    }
    id v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v13 cloudDatabase];
    id v17 = [v11 allObjects];
    [v16 handleRemovedZoneIDs:v17 userInitiated:1];
  }
  uint64_t v18 = (void *)MEMORY[0x230FBD990]([v8 markWithFormat:@"Resetting database change token"]);
  id v19 = self;
  uint32_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v27 = v21;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting database change token", buf, 0xCu);
  }
  uint64_t v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v19 cloudDatabase];
  id v23 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v19 cloudDatabase];
  uint64_t v24 = [v23 publicDatabase];
  objc_msgSend(v22, "updateServerChangeToken:forDatabaseWithScope:", 0, objc_msgSend(v24, "scope"));

  return 1;
}

- (id)__fetchAllDataForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v49 = a4;
  id v51 = a5;
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v9);

  if (v46)
  {
    id v10 = objc_alloc(MEMORY[0x263EFD808]);
    id v11 = (void *)[v10 initWithZoneName:v46 ownerName:*MEMORY[0x263EFD488]];
    id v12 = [MEMORY[0x263EFFA08] setWithObject:v11];

LABEL_12:
    id v25 = (void *)MEMORY[0x230FBD990]([v51 markWithFormat:@"Fetching models from zones: %@", v12]);
    v50 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v62 = v27;
      __int16 v63 = 2112;
      long long v64 = v12;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching models from zones: %@", buf, 0x16u);
    }
    long long v48 = [MEMORY[0x263EFF9A0] dictionary];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v12;
    uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(obj);
          }
          OSStatus v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v52 = 0;
          id v32 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v50 __fetchAllDataForZoneID:v31 options:v49 activity:v51 error:&v52];
          id v33 = v52;
          if (v32)
          {
            [v48 addEntriesFromDictionary:v32];
          }
          else
          {
            id v34 = [v31 hmbDescription];
            [v51 markWithFormat:@"Failed to fetch models for zone %@: %@", v34, v33];

            id v35 = (void *)MEMORY[0x230FBD990]();
            id v36 = v50;
            id v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              id v38 = HMFGetLogIdentifier();
              uint64_t v39 = [v31 hmbDescription];
              *(_DWORD *)buf = 138543874;
              id v62 = v38;
              __int16 v63 = 2112;
              long long v64 = v39;
              __int16 v65 = 2112;
              id v66 = v33;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch models for zone %@: %@", buf, 0x20u);
            }
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
      }
      while (v28);
    }

    uint64_t v40 = (void *)[v48 copy];
    goto LABEL_27;
  }
  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  uint64_t v14 = (os_unfair_lock_s *)&v13[*MEMORY[0x263F49348]];
  os_unfair_lock_lock_with_options();

  id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v16 = [v15 zoneStateByZoneID];
  id v17 = [v16 allValues];

  os_unfair_lock_unlock(v14);
  if ([v17 count])
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v17, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v58 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = [*(id *)(*((void *)&v57 + 1) + 8 * j) zoneID];
          uint64_t v24 = [v23 zoneID];
          [v18 addObject:v24];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v20);
    }

    id v12 = (void *)[v18 copy];
    goto LABEL_12;
  }
  id obj = v17;
  uint64_t v42 = (void *)MEMORY[0x230FBD990]([v51 markWithFormat:@"No local zones exist"]);
  id v43 = self;
  id v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    long long v45 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v62 = v45;
    _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_DEBUG, "%{public}@No local zones exist", buf, 0xCu);
  }
  uint64_t v40 = (void *)MEMORY[0x263EFFA78];
LABEL_27:

  return v40;
}

- (id)__fetchAllDataForZoneID:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [v9 hmbDescription];
  v120 = v11;
  [v11 markWithFormat:@"Fetching all models for zone %@", v13];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    uint64_t v18 = v17 = v15;
    id v19 = [v9 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v133 = v18;
    __int16 v134 = 2112;
    v135 = v19;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all models for zone %@", buf, 0x16u);

    id v15 = v17;
  }

  uint64_t v20 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 __createCloudZoneIDForZoneID:v9];
  id v131 = 0;
  uint64_t v21 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v15 __openLocalZoneForCloudZoneID:v20 error:&v131];
  id v22 = v131;
  if (v21)
  {
    __int16 v112 = v20;
    v119 = [MEMORY[0x263EFF9A0] dictionary];
    id v130 = v22;
    uint64_t v23 = [v21 fetchModelsOfType:objc_opt_class() error:&v130];
    id v24 = v130;

    uint64_t v25 = [v9 hmbDescription];
    uint64_t v26 = (void *)v25;
    v111 = (void *)v23;
    if (v23)
    {
      id v110 = v10;
      id v121 = v24;
      id v27 = (void *)v23;
      [v120 markWithFormat:@"Found models in local zone for %@: %@", v25, v23];

      uint64_t v28 = (void *)MEMORY[0x230FBD990]();
      uint64_t v29 = v15;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v32 = OSStatus v31 = v15;
        id v33 = [v9 hmbDescription];
        *(_DWORD *)buf = 138543874;
        v133 = v32;
        __int16 v134 = 2112;
        v135 = v33;
        __int16 v136 = 2112;
        id v137 = v27;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Found models in local zone for %@: %@", buf, 0x20u);

        id v15 = v31;
      }

      v114 = v29;
      id v34 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id obj = v27;
      uint64_t v118 = [obj countByEnumeratingWithState:&v126 objects:v140 count:16];
      if (v118)
      {
        uint64_t v116 = *(void *)v127;
        id v35 = v121;
        __int16 v108 = v15;
        v109 = v9;
        v117 = v21;
        while (2)
        {
          uint64_t v36 = 0;
          id v37 = v114;
          do
          {
            if (*(void *)v127 != v116) {
              objc_enumerationMutation(obj);
            }
            id v38 = *(void **)(*((void *)&v126 + 1) + 8 * v36);
            uint64_t v39 = [v38 hmbModelID];
            id v125 = v35;
            uint64_t v40 = [v21 externalIDForModelID:v39 error:&v125];
            id v41 = v125;

            if (!v40)
            {
              id v79 = [v38 hmbModelID];
              id v9 = v109;
              __int16 v80 = [v109 hmbDescription];
              [v120 markWithFormat:@"Failed to fetch external id for model %@ in %@: %@", v79, v80, v41];

              id v81 = (void *)MEMORY[0x230FBD990]();
              id v82 = v37;
              uint64_t v83 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                v84 = HMFGetLogIdentifier();
                v85 = [v38 hmbModelID];
                id v86 = [v109 hmbDescription];
                *(_DWORD *)buf = 138544130;
                v133 = v84;
                __int16 v134 = 2112;
                v135 = v85;
                __int16 v136 = 2112;
                id v137 = v86;
                __int16 v138 = 2112;
                id v139 = v41;
                _os_log_impl(&dword_22F52A000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch external id for model %@ in %@: %@", buf, 0x2Au);
              }
              id v35 = v41;
              id v10 = v110;
              uint64_t v21 = v117;
              id v15 = v108;
              goto LABEL_41;
            }
            id v124 = v41;
            uint64_t v42 = [MEMORY[0x263EFD7E8] recordIDFromExternalID:v40 error:&v124];
            id v35 = v124;

            if (!v42)
            {
              long long v87 = [v38 hmbModelID];
              id v9 = v109;
              long long v88 = [v109 hmbDescription];
              id v89 = v35;
              [v120 markWithFormat:@"Failed to convert external id for model %@ in %@: %@", v87, v88, v35];

              id v90 = (void *)MEMORY[0x230FBD990]();
              v91 = v37;
              v92 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v94 = uint64_t v93 = v40;
                uint64_t v95 = [v38 hmbModelID];
                v96 = [v109 hmbDescription];
                *(_DWORD *)buf = 138544130;
                v133 = v94;
                __int16 v134 = 2112;
                v135 = v95;
                __int16 v136 = 2112;
                id v137 = v96;
                __int16 v138 = 2112;
                id v139 = v89;
                _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert external id for model %@ in %@: %@", buf, 0x2Au);

                id v9 = v109;
                uint64_t v40 = v93;
              }

              id v10 = v110;
              uint64_t v21 = v117;
              id v15 = v108;
              id v35 = v89;
              goto LABEL_41;
            }
            v122 = v40;
            id v43 = [v42 hmbDescription];
            [v120 markWithFormat:@"Fetched model for %@", v43];

            id v44 = (void *)MEMORY[0x230FBD990]();
            long long v45 = v37;
            id v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              long long v47 = v34;
              id v49 = v48 = v35;
              v50 = [v42 hmbDescription];
              *(_DWORD *)buf = 138543618;
              v133 = v49;
              __int16 v134 = 2112;
              v135 = v50;
              _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Fetched model for %@", buf, 0x16u);

              id v35 = v48;
              id v34 = v47;
              id v37 = v114;
            }

            id v51 = [v38 networkDeclarationsData];

            if (v51)
            {
              id v52 = [v38 networkDeclarationsData];
              [v34 setObject:v52 forKeyedSubscript:@"networkDeclarations"];
            }
            long long v53 = [v38 pairedMetadataData];

            uint64_t v21 = v117;
            if (v53)
            {
              long long v54 = [v38 pairedMetadataData];
              [v34 setObject:v54 forKeyedSubscript:@"pairedMetadata"];
            }
            [v119 setObject:v34 forKeyedSubscript:v42];

            ++v36;
          }
          while (v118 != v36);
          id v9 = v109;
          id v10 = v110;
          id v15 = v108;
          uint64_t v118 = [obj countByEnumeratingWithState:&v126 objects:v140 count:16];
          if (v118) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v35 = v121;
        id v10 = v110;
      }
LABEL_41:
    }
    else
    {
      [v120 markWithFormat:@"Failed to fetch models from local zone for %@: %@", v25, v24];

      id v66 = (void *)MEMORY[0x230FBD990]();
      id v67 = v15;
      id v68 = v15;
      uint64_t v69 = HMFGetOSLogHandle();
      id v35 = v24;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v71 = id v70 = v24;
        long long v72 = [v9 hmbDescription];
        *(_DWORD *)buf = 138543874;
        v133 = v71;
        __int16 v134 = 2112;
        v135 = v72;
        __int16 v136 = 2112;
        id v137 = v70;
        _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch models from local zone for %@: %@", buf, 0x20u);

        id v35 = v70;
      }

      id v15 = v67;
    }
    id v97 = [v21 shutdown];
    id v123 = 0;
    id v98 = (id)[v97 blockAndWaitForCompletionWithError:&v123];
    id v99 = v123;

    if (v99)
    {
      id v100 = v35;
      long long v101 = [v9 hmbDescription];
      [v120 markWithFormat:@"Failed to shut down local zone for %@: %@", v101, v99];

      long long v102 = (void *)MEMORY[0x230FBD990]();
      long long v103 = v15;
      long long v104 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        id v105 = HMFGetLogIdentifier();
        v106 = [v9 hmbDescription];
        *(_DWORD *)buf = 138543874;
        v133 = v105;
        __int16 v134 = 2112;
        v135 = v106;
        __int16 v136 = 2112;
        id v137 = v99;
        _os_log_impl(&dword_22F52A000, v104, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone for %@: %@", buf, 0x20u);
      }
      id v35 = v100;
      if (!v100) {
        id v35 = v99;
      }
    }
    else if (!v35)
    {
      __int16 v65 = (void *)[v119 copy];
LABEL_52:

      id v22 = v35;
      uint64_t v20 = v112;
      goto LABEL_53;
    }
    if (a6)
    {
      id v35 = v35;
      __int16 v65 = 0;
      *a6 = v35;
    }
    else
    {
      __int16 v65 = 0;
    }
    goto LABEL_52;
  }
  long long v55 = v15;
  int v56 = objc_msgSend((id)objc_opt_class(), "__errorIsNotFound:", v22);
  uint64_t v57 = [v9 hmbDescription];
  long long v58 = (void *)v57;
  if (v56)
  {
    [v120 markWithFormat:@"Local zone does not exist for %@", v57];

    long long v59 = (void *)MEMORY[0x230FBD990]();
    long long v60 = v55;
    id v61 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v63 = id v62 = v20;
      long long v64 = [v9 hmbDescription];
      *(_DWORD *)buf = 138543618;
      v133 = v63;
      __int16 v134 = 2112;
      v135 = v64;
      _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_DEBUG, "%{public}@Local zone does not exist for %@", buf, 0x16u);

      uint64_t v20 = v62;
    }

    __int16 v65 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    [v120 markWithFormat:@"Failed to open local zone for %@: %@", v57, v22];

    id v73 = (void *)MEMORY[0x230FBD990]();
    uint64_t v74 = v55;
    v75 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v77 = __int16 v76 = v20;
      __int16 v78 = [v9 hmbDescription];
      *(_DWORD *)buf = 138543874;
      v133 = v77;
      __int16 v134 = 2112;
      v135 = v78;
      __int16 v136 = 2112;
      id v137 = v22;
      _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone for %@: %@", buf, 0x20u);

      uint64_t v20 = v76;
    }

    if (a6)
    {
      id v22 = v22;
      __int16 v65 = 0;
      *a6 = v22;
    }
    else
    {
      __int16 v65 = 0;
    }
  }
LABEL_53:

  return v65;
}

- (id)__fetchAllDataForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v56 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __localZonesForRecordIDs:v10 activity:v12 error:a6];
  if (v56)
  {
    id v54 = v11;
    uint64_t v60 = objc_opt_class();
    long long v58 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v55 = v10;
    id obj = v10;
    uint64_t v14 = (void *)v56;
    uint64_t v63 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v63)
    {
      uint64_t v61 = *(void *)v67;
      id v62 = self;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v67 != v61) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          id v17 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:v16];
          uint64_t v18 = [v16 zoneID];
          id v19 = [v14 objectForKeyedSubscript:v18];

          if (v19)
          {
            id v65 = 0;
            uint64_t v20 = [v19 fetchModelWithModelID:v17 ofType:v60 error:&v65];
            id v21 = v65;
            uint64_t v22 = [v16 hmbDescription];
            uint64_t v23 = (void *)v22;
            long long v64 = v21;
            if (v20)
            {
              [v12 markWithFormat:@"Model %@ found for record %@", v17, v22];

              id v24 = (void *)MEMORY[0x230FBD990]();
              uint64_t v25 = self;
              uint64_t v26 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                id v27 = HMFGetLogIdentifier();
                [v16 hmbDescription];
                uint64_t v57 = v24;
                v29 = id v28 = v12;
                *(_DWORD *)buf = 138543874;
                long long v71 = v27;
                __int16 v72 = 2112;
                id v73 = v17;
                __int16 v74 = 2112;
                v75 = v29;
                _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Model %@ found for record %@", buf, 0x20u);

                id v12 = v28;
                id v24 = v57;

                uint64_t v14 = (void *)v56;
              }

              uint64_t v30 = [MEMORY[0x263EFF9A0] dictionary];
              OSStatus v31 = [v20 networkDeclarationsData];

              if (v31)
              {
                id v32 = [v20 networkDeclarationsData];
                [v30 setObject:v32 forKeyedSubscript:@"networkDeclarations"];
              }
              id v33 = [v20 pairedMetadataData];

              self = v62;
              if (v33)
              {
                id v34 = [v20 pairedMetadataData];
                [v30 setObject:v34 forKeyedSubscript:@"pairedMetadata"];
              }
              [v58 setObject:v30 forKeyedSubscript:v16];
            }
            else
            {
              [v12 markWithFormat:@"No model %@ for record %@ found: %@", v17, v22, v21];

              id v41 = (void *)MEMORY[0x230FBD990]();
              uint64_t v42 = self;
              id v43 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                id v44 = HMFGetLogIdentifier();
                long long v45 = [v16 hmbDescription];
                *(_DWORD *)buf = 138544130;
                long long v71 = v44;
                __int16 v72 = 2112;
                id v73 = v17;
                __int16 v74 = 2112;
                v75 = v45;
                __int16 v76 = 2112;
                id v77 = v64;
                _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEBUG, "%{public}@No model %@ for record %@ found: %@", buf, 0x2Au);

                uint64_t v14 = (void *)v56;
              }

              self = v62;
            }
          }
          else
          {
            id v35 = [v16 hmbDescription];
            [v12 markWithFormat:@"No local zone for model %@ for record %@ found", v17, v35];

            uint64_t v36 = (void *)MEMORY[0x230FBD990]();
            id v37 = self;
            id v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v39 = HMFGetLogIdentifier();
              uint64_t v40 = [v16 hmbDescription];
              *(_DWORD *)buf = 138543874;
              long long v71 = v39;
              __int16 v72 = 2112;
              id v73 = v17;
              __int16 v74 = 2112;
              v75 = v40;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No local zone for model %@ for record %@ found", buf, 0x20u);
            }
            self = v62;
          }
        }
        uint64_t v63 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v63);
    }

    id v46 = [v14 allValues];
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __shutdownLocalZones:v46 activity:v12];

    long long v47 = (void *)[v58 copy];
    id v48 = v14;
    id v11 = v54;
    id v10 = v55;
  }
  else
  {
    id v49 = (void *)MEMORY[0x230FBD990]();
    v50 = self;
    id v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      id v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v71 = v52;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@localZones is nil, can't fetch paired metadata", buf, 0xCu);
    }
    long long v47 = 0;
    id v48 = 0;
  }

  return v47;
}

- (id)__localZonesForRecordIDs:(id)a3 activity:(id)a4 error:(id *)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v50 = self;
  id v51 = a4;
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (!v12)
  {

LABEL_26:
    id v44 = (void *)[v10 copy];
    id v14 = 0;
    goto LABEL_27;
  }
  uint64_t v13 = v12;
  id v46 = a5;
  id v14 = 0;
  uint64_t v15 = *(void *)v54;
  long long v47 = v10;
  uint64_t v48 = *(void *)v54;
  id v16 = v50;
  id v49 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v54 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v18 = [*(id *)(*((void *)&v53 + 1) + 8 * i) zoneID];
      id v19 = [v10 objectForKeyedSubscript:v18];

      if (!v19)
      {
        uint64_t v20 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 __createCloudZoneIDForZoneID:v18];
        id v52 = v14;
        id v21 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 __openLocalZoneForCloudZoneID:v20 error:&v52];
        id v22 = v52;

        if (v21)
        {
          uint64_t v23 = [v18 hmbDescription];
          [v51 markWithFormat:@"Opened local zone for %@", v23];

          id v24 = (void *)MEMORY[0x230FBD990]();
          uint64_t v25 = v16;
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            id v27 = HMFGetLogIdentifier();
            id v28 = [v18 hmbDescription];
            *(_DWORD *)buf = 138543618;
            long long v58 = v27;
            __int16 v59 = 2112;
            uint64_t v60 = v28;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Opened local zone for %@", buf, 0x16u);

            uint64_t v15 = v48;
            id v10 = v47;
          }

          [v10 setObject:v21 forKeyedSubscript:v18];
        }
        else
        {
          uint64_t v29 = v16;
          int v30 = objc_msgSend((id)objc_opt_class(), "__errorIsNotFound:", v22);
          uint64_t v31 = [v18 hmbDescription];
          id v32 = (void *)v31;
          if (!v30)
          {
            [v51 markWithFormat:@"Failed to open local zone for %@: %@", v31, v22];

            id v38 = (void *)MEMORY[0x230FBD990]();
            uint64_t v39 = v29;
            uint64_t v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              id v41 = HMFGetLogIdentifier();
              uint64_t v42 = [v18 hmbDescription];
              *(_DWORD *)buf = 138543874;
              long long v58 = v41;
              __int16 v59 = 2112;
              uint64_t v60 = v42;
              __int16 v61 = 2112;
              id v62 = v22;
              _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone for %@: %@", buf, 0x20u);

              id v10 = v47;
            }

            id v14 = v22;
            id v11 = v49;
            id v16 = v50;
            goto LABEL_22;
          }
          [v51 markWithFormat:@"No local zone for %@, skipping", v31];

          id v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = v29;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v36 = HMFGetLogIdentifier();
            id v37 = [v18 hmbDescription];
            *(_DWORD *)buf = 138543618;
            long long v58 = v36;
            __int16 v59 = 2112;
            uint64_t v60 = v37;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEBUG, "%{public}@No local zone for %@, skipping", buf, 0x16u);

            id v10 = v47;
          }

          id v22 = 0;
          uint64_t v15 = v48;
        }

        id v14 = v22;
        id v11 = v49;
        id v16 = v50;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_22:

  if (!v14) {
    goto LABEL_26;
  }
  id v43 = [v10 allValues];
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 __shutdownLocalZones:v43 activity:v51];

  if (v46)
  {
    id v14 = v14;
    id v44 = 0;
    *id v46 = v14;
  }
  else
  {
    id v44 = 0;
  }
LABEL_27:

  return v44;
}

- (void)__shutdownLocalZones:(id)a3 activity:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v6 count])
  {
    id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v24 + 1) + 8 * v14) shutdown];
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v16 = (void *)MEMORY[0x263F58190];
    id v17 = [MEMORY[0x263F581B8] globalAsyncScheduler];
    uint64_t v18 = [v16 combineAllFutures:v9 ignoringErrors:1 scheduler:v17];

    id v19 = [v18 blockAndWaitForCompletionWithError:0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____shutdownLocalZones_activity___block_invoke;
    v20[3] = &unk_264A21198;
    id v21 = v7;
    id v22 = v10;
    uint64_t v23 = self;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
  }
}

void __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____shutdownLocalZones_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
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
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    id v10 = [v9 zoneID];
    uint64_t v11 = [v10 name];
    [v8 markWithFormat:@"Failed to shut down local zone %@", v11];

    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      id v17 = [v16 zoneID];
      uint64_t v18 = [v17 name];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v18;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone %@", buf, 0x16u);
    }
  }
}

- (id)__openLocalZoneForCloudZoneID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self localDatabase];
  id v9 = objc_alloc_init(MEMORY[0x263F49290]);
  id v10 = [v8 openZoneWithZoneID:v6 configuration:v9 error:a4];

  [v10 startUp];
  return v10;
}

- (id)__createCloudZoneIDForZoneID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F49278];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v8 = [v7 containerID];
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v10 = [v9 publicDatabase];
  uint64_t v11 = objc_msgSend(v6, "initWithContainerID:scope:zoneID:", v8, objc_msgSend(v10, "scope"), v5);

  return v11;
}

+ (BOOL)__errorIsNotFound:(id)a3
{
  id v3 = a3;
  if ([v3 isHMFError] && objc_msgSend(v3, "code") == 2)
  {
    BOOL v4 = 1;
  }
  else if ([v3 isHMError])
  {
    BOOL v4 = [v3 code] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)__overrideParentModelID
{
  if (__overrideParentModelID_onceToken != -1) {
    dispatch_once(&__overrideParentModelID_onceToken, &__block_literal_global_138379);
  }
  uint64_t v2 = (void *)__overrideParentModelID_overrideParentModelID;
  return v2;
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____overrideParentModelID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"56e3068a-cb39-4cef-b4a3-78d7cc58e7d5"];
  uint64_t v1 = (void *)__overrideParentModelID_overrideParentModelID;
  __overrideParentModelID_overrideParentModelID = v0;
}

- (void)__updateChangeTokenWithFetchInfo:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 originalDatabaseChangeToken];
  id v7 = [v4 databaseChangeToken];
  int v8 = HMFEqualObjects();

  if (v8)
  {
    id v9 = [v4 activity];
    id v10 = [v4 databaseChangeToken];
    uint64_t v11 = [v10 hmbDescription];
    [v9 markWithFormat:@"Database change token has not been updated: %@", v11];

    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = [v4 databaseChangeToken];
      id v17 = [v16 hmbDescription];
      *(_DWORD *)buf = 138543618;
      long long v58 = v15;
      __int16 v59 = 2112;
      uint64_t v60 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Database change token has not been updated: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v18 = [v4 databaseChangeToken];

    if (!v18)
    {
      v50 = (void *)MEMORY[0x230FBD990]();
      id v51 = self;
      id v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        long long v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v58 = v53;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Should never have a nil change token here", buf, 0xCu);
      }
      long long v54 = [[HMDAssertionLogEvent alloc] initWithReason:@"Should never have a nil change token here"];
      long long v55 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v55 submitLogEvent:v54];
    }
    id v19 = [v4 activity];
    uint64_t v20 = [v4 databaseChangeToken];
    __int16 v21 = [v20 hmbDescription];
    [v19 markWithFormat:@"Updating database change token: %@", v21];

    id v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = self;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = HMFGetLogIdentifier();
      long long v26 = [v4 databaseChangeToken];
      long long v27 = [v26 hmbDescription];
      *(_DWORD *)buf = 138543618;
      long long v58 = v25;
      __int16 v59 = 2112;
      uint64_t v60 = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updating database change token: %@", buf, 0x16u);
    }
    id v28 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v23 cloudDatabase];
    uint64_t v29 = (os_unfair_lock_s *)&v28[*MEMORY[0x263F49348]];
    os_unfair_lock_lock_with_options();

    int v30 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v23 cloudDatabase];
    uint64_t v31 = [v30 databaseStateForDatabaseScope:1];

    id v32 = [v4 databaseChangeToken];
    [v31 setServerChangeToken:v32];

    id v33 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v23 cloudDatabase];
    id v34 = [v33 stateZone];
    long long v56 = v31;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    uint64_t v36 = [v34 update:v35];

    os_unfair_lock_unlock(v29);
    id v37 = [v4 activity];
    id v38 = v37;
    if (v36)
    {
      [v37 markWithFormat:@"Failed to update database state model: %@", v36];

      uint64_t v39 = (void *)MEMORY[0x230FBD990]();
      uint64_t v40 = v23;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v58 = v42;
        __int16 v59 = 2112;
        uint64_t v60 = v36;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state model: %@", buf, 0x16u);
      }
    }
    else
    {
      [v37 markWithFormat:@"Updated database change token successfully"];

      uint64_t v39 = (void *)MEMORY[0x230FBD990]();
      id v43 = v23;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        id v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v58 = v44;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Updated database change token successfully", buf, 0xCu);
      }
    }
  }
  long long v45 = [v4 requestedRecordIDs];
  id v46 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self internalState];
  [v46 setLastSynchronizedRecordIDs:v45];

  long long v47 = [v4 activity];
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __saveInternalStateWithActivity:v47];

  uint64_t v48 = [v4 modifiedRecordIDs];
  id v49 = (void *)[v48 copy];
  [v4 finishWithResult:v49];
}

- (void)__removeDeletedZonesWithFetchInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v4 zoneInfoMap];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __111__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_RemoveDeletedZones____removeDeletedZonesWithFetchInfo___block_invoke;
  uint64_t v14 = &unk_264A23960;
  uint64_t v15 = self;
  id v16 = v6;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:&v11];

  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self cloudDatabase];
  id v10 = (void *)[v8 copy];
  [v9 handleRemovedZoneIDs:v10 userInitiated:0];

  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __updateChangeTokenWithFetchInfo:v4];
}

void __111__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_RemoveDeletedZones____removeDeletedZonesWithFetchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if ([a3 zoneWasDeleted])
  {
    id v5 = objc_alloc(MEMORY[0x263F49278]);
    id v6 = [*(id *)(a1 + 32) cloudDatabase];
    id v7 = [v6 containerID];
    id v8 = [*(id *)(a1 + 32) cloudDatabase];
    id v9 = [v8 publicDatabase];
    id v10 = objc_msgSend(v5, "initWithContainerID:scope:zoneID:", v7, objc_msgSend(v9, "scope"), v11);

    [*(id *)(a1 + 40) addObject:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueueScheduler, 0);
  objc_storeStrong((id *)&self->_shutdownPromise, 0);
  objc_storeStrong((id *)&self->_startupPromise, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_cloudDatabase, 0);
  objc_storeStrong((id *)&self->_internalState, 0);
  objc_storeStrong((id *)&self->_lastAsyncFuture, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (NAScheduler)workQueueScheduler
{
  return self->_workQueueScheduler;
}

- (NAPromise)shutdownPromise
{
  return self->_shutdownPromise;
}

- (NAPromise)startupPromise
{
  return self->_startupPromise;
}

- (BOOL)useAnonymousRequests
{
  return self->_useAnonymousRequests;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (HMBCloudDatabase)cloudDatabase
{
  return self->_cloudDatabase;
}

- (void)setShuttingDown:(BOOL)a3
{
  self->_shuttingDown = a3;
}

- (void)setInternalState:(id)a3
{
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return self->_localZone;
}

- (HMBLocalZoneID)zoneID
{
  return self->_zoneID;
}

- (void)__saveInternalStateWithActivity:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self internalState];

  if (!v6)
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    long long v24 = self;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      long long v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v30 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have internal state", buf, 0xCu);
    }
    long long v27 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must have internal state"];
    id v28 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v28 submitLogEvent:v27];
  }
  id v7 = (void *)MEMORY[0x230FBD990]([v4 markWithFormat:@"Saving internal state model"]);
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v30 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Saving internal state model", buf, 0xCu);
  }
  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v8 localZone];
  uint64_t v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v8 internalState];
  v35[0] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  uint64_t v14 = [v11 update:v13];

  if (v14)
  {
    uint64_t v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v8 internalState];
    id v16 = [v15 hmbModelID];
    [v4 markWithFormat:@"Failed to save internal state model %@: %@", v16, v14];

    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v8;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      __int16 v21 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v18 internalState];
      id v22 = [v21 hmbModelID];
      *(_DWORD *)buf = 138543874;
      int v30 = v20;
      __int16 v31 = 2112;
      id v32 = v22;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to save internal state model %@: %@", buf, 0x20u);
    }
  }
}

- (BOOL)_removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__192327;
  id v32 = __Block_byref_object_dispose__192328;
  id v33 = 0;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"RemoveOverrides"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__removeOverridesForZoneName_recordName_options_error___block_invoke;
  v21[3] = &unk_264A29EF8;
  v21[4] = self;
  long long v26 = &v34;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v14;
  id v25 = v18;
  long long v27 = &v28;
  [v18 performBlock:v21];
  int v19 = *((unsigned __int8 *)v35 + 24);
  if (a6 && !*((unsigned char *)v35 + 24)) {
    *a6 = (id) v29[5];
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19 != 0;
}

uint64_t __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__removeOverridesForZoneName_recordName_options_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = objc_msgSend(v2, "__removeOverridesForZoneName:recordName:options:activity:error:", v3, v4, v5, v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return [*(id *)(a1 + 64) invalidate];
}

- (BOOL)removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v13);

  LOBYTE(a6) = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _removeOverridesForZoneName:v12 recordName:v11 options:v10 error:a6];
  return (char)a6;
}

- (BOOL)removeAllOverridesWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  LOBYTE(a4) = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _removeOverridesForZoneName:0 recordName:0 options:v6 error:a4];
  return (char)a4;
}

- (BOOL)removeOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__192327;
  long long v27 = __Block_byref_object_dispose__192328;
  id v28 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"RemoveOverridesForRecordIDs"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeOverridesForRecordIDs_options_error___block_invoke;
  v17[3] = &unk_264A25410;
  void v17[4] = self;
  __int16 v21 = &v29;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  id v22 = &v23;
  [v14 performBlock:v17];
  int v15 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((unsigned char *)v30 + 24)) {
    *a5 = (id) v24[5];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15 != 0;
}

uint64_t __99__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeOverridesForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v6 + 40);
    char v7 = objc_msgSend(v2, "__removeOverridesForRecordIDs:options:activity:error:", v3, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return [*(id *)(a1 + 56) invalidate];
}

- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__192327;
  uint64_t v31 = __Block_byref_object_dispose__192328;
  id v32 = 0;
  id v13 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"AddOverrides"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __92__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_addOverrides_replace_options_error___block_invoke;
  v19[3] = &unk_264A25438;
  id v14 = v13;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  id v22 = self;
  id v24 = &v33;
  BOOL v26 = a4;
  id v16 = v11;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v14 performBlock:v19];
  int v17 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((unsigned char *)v34 + 24)) {
    *a6 = (id) v28[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17 != 0;
}

uint64_t __92__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_addOverrides_replace_options_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allKeys];
  uint64_t v4 = __descriptionsForRecordIDArray(v3);
  [v2 markWithFormat:@"Applying overrides for recordIDs: %@", v4];

  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 48);
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [*(id *)(a1 + 40) allKeys];
    id v10 = __descriptionsForRecordIDArray(v9);
    *(_DWORD *)buf = 138543618;
    id v24 = v8;
    __int16 v25 = 2112;
    BOOL v26 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Applying overrides for recordIDs: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 48) isRunning])
  {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 80);
    id v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v16 + 40);
    char v17 = objc_msgSend(v12, "__addOverrides:replace:options:activity:error:", v14, v11, v13, v15, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17;
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  return [*(id *)(a1 + 32) invalidate];
}

- (id)_fetchOverridesForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__192327;
  char v36 = __Block_byref_object_dispose__192328;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__192327;
  uint64_t v30 = __Block_byref_object_dispose__192328;
  id v31 = 0;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  id v12 = [v9 label];
  uint64_t v13 = (void *)[v11 initWithName:v12];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchOverridesForZoneName_options_error___block_invoke;
  v20[3] = &unk_264A25410;
  void v20[4] = self;
  id v24 = &v32;
  id v14 = v8;
  id v21 = v14;
  id v15 = v9;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  __int16 v25 = &v26;
  [v16 performBlock:v20];
  char v17 = (void *)v33[5];
  if (v17)
  {
    id v18 = v17;
  }
  else if (a5)
  {
    *a5 = (id) v27[5];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchOverridesForZoneName_options_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = objc_msgSend(v2, "__fetchOverridesForZoneName:options:activity:error:", v3, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  return [*(id *)(a1 + 56) invalidate];
}

- (id)fetchAllOverridesWithOptions:(id)a3 error:(id *)a4
{
  return [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _fetchOverridesForZoneName:0 options:a3 error:a4];
}

- (id)fetchOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__192327;
  id v43 = __Block_byref_object_dispose__192328;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__192327;
  id v37 = __Block_byref_object_dispose__192328;
  id v38 = 0;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  id v12 = [v9 label];
  uint64_t v13 = (void *)[v11 initWithName:v12];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchOverridesForRecordIDs_options_error___block_invoke;
  v26[3] = &unk_264A25410;
  id v14 = v13;
  id v27 = v14;
  id v15 = v8;
  id v28 = v15;
  uint64_t v29 = self;
  id v31 = &v39;
  id v16 = v9;
  id v30 = v16;
  uint64_t v32 = &v33;
  id v17 = (id)[v14 performBlock:v26];
  id v18 = (void *)v40[5];
  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    if (a5)
    {
      id v17 = (id) v34[5];
      *a5 = v17;
    }
    id v20 = (void *)MEMORY[0x230FBD990](v17);
    id v21 = self;
    HMFGetOSLogHandle();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      uint64_t v24 = v34[5];
      *(_DWORD *)buf = 138543618;
      id v46 = v23;
      __int16 v47 = 2112;
      uint64_t v48 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@No overrides fetched with error %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchOverridesForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = __descriptionsForRecordIDSet(*(void **)(a1 + 40));
  [v2 markWithFormat:@"Fetching overrides for recordIDs: %@", v3];

  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = __descriptionsForRecordIDSet(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching overrides for recordIDs: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 48) isRunning])
  {
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = objc_msgSend(v9, "__fetchOverridesForRecordIDs:options:activity:error:", v11, v10, v12, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 48);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@No local zone, can't fetch overrides", buf, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)removeAllLocalRulesWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__192327;
  __int16 v25 = __Block_byref_object_dispose__192328;
  id v26 = 0;
  id v8 = objc_alloc(MEMORY[0x263F424F0]);
  id v9 = [v6 label];
  uint64_t v10 = (void *)[v8 initWithName:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeAllLocalRulesWithOptions_error___block_invoke;
  v15[3] = &unk_264A2D248;
  id v11 = v10;
  id v16 = v11;
  id v17 = self;
  id v19 = &v27;
  id v12 = v6;
  id v18 = v12;
  id v20 = &v21;
  [v11 performBlock:v15];
  if (a4) {
    *a4 = (id) v22[5];
  }
  char v13 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeAllLocalRulesWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Removing all local rules"]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all local rules", buf, 0xCu);
  }
  if ([*(id *)(a1 + 40) isRunning])
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v9 + 40);
    char v10 = objc_msgSend(v6, "__removeAllLocalRulesWithOptions:activity:error:", v7, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
    id v11 = [MEMORY[0x263EFFA08] set];
    id v12 = [*(id *)(a1 + 40) internalState];
    [v12 setLastSynchronizedRecordIDs:v11];

    objc_msgSend(*(id *)(a1 + 40), "__saveInternalStateWithActivity:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  return [*(id *)(a1 + 32) invalidate];
}

- (id)fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _fetchAllDataForZoneName:v9 options:v8 error:a5];

  return v11;
}

- (id)fetchAllDataWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _fetchAllDataForZoneName:0 options:v6 error:a4];

  return v8;
}

- (id)_fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__192327;
  id v37 = __Block_byref_object_dispose__192328;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = __Block_byref_object_copy__192327;
  id v31 = __Block_byref_object_dispose__192328;
  id v32 = 0;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  id v12 = [v9 label];
  uint64_t v13 = (void *)[v11 initWithName:v12];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchAllDataForZoneName_options_error___block_invoke;
  v20[3] = &unk_264A25410;
  id v14 = v13;
  id v21 = v14;
  id v15 = v8;
  id v22 = v15;
  uint64_t v23 = self;
  __int16 v25 = &v33;
  id v16 = v9;
  id v24 = v16;
  id v26 = &v27;
  [v14 performBlock:v20];
  id v17 = (void *)v34[5];
  if (v17)
  {
    id v18 = v17;
  }
  else if (a5)
  {
    *a5 = (id) v28[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

uint64_t __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchAllDataForZoneName_options_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Fetching records with zone name '%@'", *(void *)(a1 + 40)]);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records with zone name '%@'", buf, 0x16u);
  }
  if ([*(id *)(a1 + 48) isRunning])
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v12 = objc_msgSend(v7, "__fetchAllDataForZoneName:options:activity:error:", v9, v8, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    id v14 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (id)fetchAllDataForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__192327;
  id v43 = __Block_byref_object_dispose__192328;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__192327;
  id v37 = __Block_byref_object_dispose__192328;
  id v38 = 0;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  uint64_t v12 = [v9 label];
  uint64_t v13 = (void *)[v11 initWithName:v12];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchAllDataForRecordIDs_options_error___block_invoke;
  v26[3] = &unk_264A25410;
  id v14 = v13;
  id v27 = v14;
  id v15 = v8;
  id v28 = v15;
  uint64_t v29 = self;
  id v31 = &v39;
  id v16 = v9;
  id v30 = v16;
  id v32 = &v33;
  id v17 = (id)[v14 performBlock:v26];
  id v18 = (void *)v40[5];
  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    if (a5)
    {
      id v17 = (id) v34[5];
      *a5 = v17;
    }
    uint64_t v20 = (void *)MEMORY[0x230FBD990](v17);
    __int16 v21 = self;
    HMFGetOSLogHandle();
    uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = v34[5];
      *(_DWORD *)buf = 138543618;
      id v46 = v23;
      __int16 v47 = 2112;
      uint64_t v48 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch paired metadata dictionary with error %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

uint64_t __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchAllDataForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = __descriptionsForRecordIDSet(*(void **)(a1 + 40));
  [v2 markWithFormat:@"Fetching records for recordIDs: %@", v3];

  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = __descriptionsForRecordIDSet(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138543618;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records for recordIDs: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 48) isRunning])
  {
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = objc_msgSend(v9, "__fetchAllDataForRecordIDs:options:activity:error:", v11, v10, v12, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 48);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch paired metadata dictionary due to nil local zone", buf, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (void)fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self desiredKeys];
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _fetchCloudRecordsForZoneID:v13 recordID:v12 options:v11 desiredKeys:v15 completion:v10];
}

- (id)desiredKeys
{
  v4[12] = *MEMORY[0x263EF8340];
  v4[0] = @"CD_productGroup";
  v4[1] = @"CD_productGroup_ckAsset";
  v4[2] = @"CD_productNumber";
  v4[3] = @"CD_productNumber_ckAsset";
  v4[4] = @"CD_networkDeclarations";
  v4[5] = @"CD_networkDeclarations_ckAsset";
  v4[6] = @"CD_networkDeclarationsSignature";
  v4[7] = @"CD_networkDeclarationsSignature_ckAsset";
  v4[8] = @"CD_pairedMetadata";
  v4[9] = @"CD_pairedMetadata_ckAsset";
  v4[10] = @"CD_pairedMetadataSignature";
  v4[11] = @"CD_pairedMetadataSignature_ckAsset";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:12];
  return v2;
}

- (void)fetchCloudRecordIDsForZoneID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __105__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudRecordIDsForZoneID_options_completion___block_invoke;
  v13[3] = &unk_264A253E8;
  id v14 = v8;
  id v12 = v8;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self _fetchCloudRecordsForZoneID:v10 recordID:0 options:v9 desiredKeys:MEMORY[0x263EFFA68] completion:v13];
}

void __105__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudRecordIDsForZoneID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "recordID", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = (void *)[v5 copy];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 desiredKeys:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v17);

  id v18 = objc_alloc(MEMORY[0x263F424F0]);
  uint64_t v19 = [v14 label];
  uint64_t v20 = (void *)[v18 initWithName:v19];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke;
  v27[3] = &unk_264A2C9E0;
  id v28 = v20;
  uint64_t v29 = self;
  id v30 = v14;
  id v31 = v12;
  id v32 = v13;
  id v33 = v15;
  id v34 = v16;
  id v21 = v16;
  id v22 = v15;
  id v23 = v13;
  id v24 = v12;
  id v25 = v14;
  id v26 = v20;
  [v26 performBlock:v27];
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([a1[4] markWithFormat:@"Scheduling cloud fetch"]);
  id v3 = a1[5];
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling cloud fetch", buf, 0xCu);
  }
  id v6 = a1[4];
  id v7 = a1[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_212;
  v16[3] = &unk_264A253C0;
  id v17 = v6;
  id v18 = a1[6];
  id v19 = a1[7];
  id v20 = a1[8];
  id v21 = a1[9];
  uint64_t v8 = objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v17, 0, v16);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_2;
  v12[3] = &unk_264A26130;
  id v9 = a1[4];
  id v10 = a1[5];
  id v13 = v9;
  id v14 = v10;
  id v15 = a1[10];
  id v11 = (id)[v8 addCompletionBlock:v12];
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_212(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo alloc];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  id v10 = [v6 cloudDatabase];
  id v11 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo initWithActivity:options:promise:database:useAnonymousRequests:zoneID:recordID:desiredKeys:](v7, "initWithActivity:options:promise:database:useAnonymousRequests:zoneID:recordID:desiredKeys:", v8, v9, v5, v10, [v6 useAnonymousRequests], a1[6], a1[7], a1[8]);

  objc_msgSend(v6, "__fetchCloudRecordsWithFetchInfo:", v11);
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_3;
  v12[3] = &unk_264A2DDC0;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = v5;
  id v8 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  [v7 performBlock:v12];
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_3(id *a1)
{
  uint64_t v2 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_4;
  block[3] = &unk_264A2DDC0;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v10 = a1[8];
  id v9 = a1[7];
  dispatch_async(v2, block);
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_4(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_5;
  v5[3] = &unk_264A2DDC0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v10 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  [v2 performBlock:v5];
}

uint64_t __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]([v2 markWithFormat:@"Cloud fetch completed successfully"]);
    id v5 = *(id *)(a1 + 48);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud fetch completed successfully", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]([v2 markWithFormat:@"Cloud fetch completed unsuccessfully: %@", *(void *)(a1 + 56)]);
    id v5 = *(id *)(a1 + 48);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cloud fetch completed unsuccessfully: %@", buf, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  return [*(id *)(a1 + 40) invalidate];
}

- (void)fetchCloudChangesForRecordIDs:(id)a3 options:(id)a4 ignoreLastSynchronizedRecords:(BOOL)a5 xpcActivity:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v16);

  id v17 = (void *)[v15 copy];
  id v18 = objc_alloc(MEMORY[0x263F424F0]);
  id v19 = [v12 label];
  id v20 = (void *)[v18 initWithName:v19];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke;
  v26[3] = &unk_264A2B510;
  id v27 = v20;
  id v28 = self;
  BOOL v33 = a5;
  id v29 = v17;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v17;
  id v25 = v20;
  [v25 performBlock:v26];
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Scheduling cloud sync"]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling cloud sync", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_184;
  v16[3] = &unk_264A25398;
  id v17 = v6;
  id v18 = *(id *)(a1 + 48);
  char v21 = *(unsigned char *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  uint64_t v8 = objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v17, 0, v16);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_201;
  v12[3] = &unk_264A273B8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = *(id *)(a1 + 72);
  id v11 = (id)[v8 addCompletionBlock:v12];
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v47 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Beginning cloud sync"]);
  id v7 = v5;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v49 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning cloud sync", buf, 0xCu);
  }
  if ([*(id *)(a1 + 40) count])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v10 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Ignoring last fetched accessories"]);
      id v11 = v7;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring last fetched accessories", buf, 0xCu);
      }
LABEL_15:
      id v27 = [v7 cloudDatabase];
      id v28 = (os_unfair_lock_s *)&v27[*MEMORY[0x263F49348]];
      os_unfair_lock_lock_with_options();

      id v29 = [v7 cloudDatabase];
      id v30 = [v29 databaseStateForDatabaseScope:1];

      id v46 = [v30 serverChangeToken];

      os_unfair_lock_unlock(v28);
      id v31 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo alloc];
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(a1 + 48);
      uint64_t v33 = *(void *)(a1 + 56);
      uint64_t v35 = [v7 cloudDatabase];
      char v36 = [v7 useAnonymousRequests];
      uint64_t v37 = *(void *)(a1 + 40);
      id v38 = [v7 internalState];
      uint64_t v39 = [v38 lastSynchronizedRecordIDs];
      LOBYTE(v45) = v36;
      uint64_t v40 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *)v31 initWithActivity:v32 options:v34 databaseChangeToken:v46 promise:v47 xpcActivity:v33 database:v35 useAnonymousRequests:v45 recordIDs:v37 lastSynchronizedRecordIDs:v39];

      objc_msgSend(v7, "__fetchDatabaseChangesWithFetchInfo:", v40);
      goto LABEL_16;
    }
    id v18 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v19 = [v7 internalState];
    id v20 = [v19 lastSynchronizedRecordIDs];
    [v18 minusSet:v20];

    uint64_t v21 = [v18 count];
    id v22 = *(void **)(a1 + 32);
    if (v21)
    {
      id v23 = (void *)MEMORY[0x230FBD990]([v22 markWithFormat:@"Set of interested accessories has grown since last fetch: %@", v18]);
      id v24 = v7;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v26;
        __int16 v50 = 2112;
        id v51 = v18;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Set of interested accessories has grown since last fetch: %@", buf, 0x16u);
      }

      goto LABEL_15;
    }
    uint64_t v41 = (void *)MEMORY[0x230FBD990]([v22 markWithFormat:@"Set of interested accessories has not grown, skipping fetch"]);
    id v42 = v7;
    id v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v44;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Set of interested accessories has not grown, skipping fetch", buf, 0xCu);
    }
    [v47 finishWithNoResult];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Not interested in any records, skipping fetch"]);
    id v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Not interested in any records, skipping fetch", buf, 0xCu);
    }
    [v47 finishWithNoResult];
  }
LABEL_16:
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_2;
  v11[3] = &unk_264A2DDC0;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  id v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  [v7 performBlock:v11];
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_3;
  block[3] = &unk_264A2DDC0;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v9 = a1[7];
  id v10 = a1[8];
  dispatch_async(v2, block);
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_3(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_4;
  v6[3] = &unk_264A2DDC0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 64);
  [v2 performBlock:v6];
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = NAEmptyResult();
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void **)(a1 + 32);
  }
  id v5 = v4;

  id v6 = *(void **)(a1 + 40);
  if (v2)
  {
    id v7 = (void *)MEMORY[0x230FBD990]([v6 markWithFormat:@"Cloud sync completed successfully: %@", v5]);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud sync completed successfully: %@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]([v6 markWithFormat:@"Cloud sync completed unsuccessfully: %@", *(void *)(a1 + 56)]);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int8x16_t v12 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cloud sync completed unsuccessfully: %@", buf, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

- (id)cloudFetchNeededForRecordIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self isRunning])
  {
    if (v6)
    {
      id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self internalState];
      uint64_t v9 = [v8 lastSynchronizedRecordIDs];
      uint64_t v10 = [v6 isSubsetOfSet:v9] ^ 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = [NSNumber numberWithInt:v10];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:23];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (NAFuture)shutdownFuture
{
  uint64_t v2 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self shutdownPromise];
  id v3 = [v2 future];

  return (NAFuture *)v3;
}

- (NAFuture)startupFuture
{
  uint64_t v2 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self startupPromise];
  id v3 = [v2 future];

  return (NAFuture *)v3;
}

- (id)shutdown
{
  uint64_t v11 = 0;
  int8x16_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__192327;
  __int16 v15 = __Block_byref_object_dispose__192328;
  id v16 = 0;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Shutdown"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke;
  v7[3] = &unk_264A2F698;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  [v4 performBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Scheduling shutdown"]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling shutdown", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke_179;
  v11[3] = &unk_264A25370;
  id v12 = v6;
  uint64_t v8 = objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v12, 1, v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v9 = a2;
  id v6 = [v9 shutdownFuture];
  id v7 = [v5 completionHandlerAdapter];

  id v8 = (id)[v6 addCompletionBlock:v7];
  objc_msgSend(v9, "__shutdownWithActivity:", *(void *)(a1 + 32));
}

- (id)flush
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__192327;
  uint64_t v15 = __Block_byref_object_dispose__192328;
  id v16 = 0;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Flush"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke;
  v7[3] = &unk_264A2F698;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  uint64_t v10 = &v11;
  [v4 performBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Scheduling flush"]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling flush", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke_168;
  v11[3] = &unk_264A25370;
  id v12 = v6;
  uint64_t v8 = objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v12, 1, v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Flushed"]);
  id v8 = v5;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Flushed", (uint8_t *)&v11, 0xCu);
  }
  [v6 finishWithNoResult];
  [*(id *)(a1 + 32) invalidate];
}

- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  id v4 = (void *)MEMORY[0x263F58190];
  id v5 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", 58, a4);
  id v6 = [v4 futureWithError:v5];

  return v6;
}

- (id)destroy
{
  uint64_t v2 = (void *)MEMORY[0x263F58190];
  id v3 = [MEMORY[0x263F087E8] hmErrorWithCode:58];
  id v4 = [v2 futureWithError:v3];

  return v4;
}

- (void)startUpWithLocalZone:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Startup"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke;
  v8[3] = &unk_264A2F2F8;
  id v9 = v5;
  uint64_t v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 performBlock:v8];
}

void __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) markWithFormat:@"Scheduling startup"]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling startup", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_161;
  block[3] = &unk_264A2F2F8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  dispatch_async(v6, block);
}

void __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_161(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_2;
  v4[3] = &unk_264A2F2F8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  [v2 performBlock:v4];
}

uint64_t __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__startupWithLocalZone:activity:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)__asyncFutureWithActivity:(id)a3 ignoreErrors:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__192327;
  id v27 = __Block_byref_object_dispose__192328;
  id v28 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke;
  v19[3] = &unk_264A2C428;
  id v22 = &v23;
  void v19[4] = self;
  id v10 = v8;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  [v10 performBlock:v19];
  if (v6)
  {
    uint64_t v12 = (void *)v24[5];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_150;
    v17[3] = &unk_264A28900;
    id v18 = v10;
    uint64_t v13 = [v12 recover:v17];
    id v14 = (void *)v24[5];
    v24[5] = v13;
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [v2 future];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2;
  block[3] = &unk_264A25348;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v2;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = v2;
  dispatch_async(v6, block);
}

id __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2_151;
  v8[3] = &unk_264A2F7F8;
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v8];
  BOOL v6 = [MEMORY[0x263F58190] futureWithNoResult];

  return v6;
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2_151(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = objc_opt_class();
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring error from promise: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_3;
  v6[3] = &unk_264A25348;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v9 = v3;
  uint64_t v10 = v4;
  [v2 performBlock:v6];
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_3(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) lastAsyncFuture];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_4;
  v7[3] = &unk_264A25320;
  id v3 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  objc_copyWeak(&v12, &location);
  id v9 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v10 = v4;
  uint64_t v11 = v5;
  uint64_t v6 = [v2 flatMap:v7];
  [*(id *)(a1 + 32) setLastAsyncFuture:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_5;
  id v10 = &unk_264A2D310;
  id v11 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  dispatch_async(v4, &v7);

  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "recoverIgnoringError", v7, v8, v9, v10);

  objc_destroyWeak(&v14);
  return v5;
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_5(id *a1)
{
  id v2 = a1[4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_6;
  v3[3] = &unk_264A2D310;
  objc_copyWeak(&v7, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[4];
  id v6 = a1[6];
  [v2 performBlock:v3];

  objc_destroyWeak(&v7);
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_6(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isShuttingDown])
    {
      id v4 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) markWithFormat:@"Not running block because we're already shutting down"]);
      id v5 = v3;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v7;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not running block because we're already shutting down", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v5;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Not running block because we're already shutting down", (uint8_t *)&v16, 0xCu);
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      [v12 finishWithError:v13];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    [v14 finishWithError:v15];
  }
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)internalState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self isRunning])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Should only get internal state while running", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [[HMDAssertionLogEvent alloc] initWithReason:@"Should only get internal state while running"];
    id v11 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v11 submitLogEvent:v10];
  }
  internalState = self->_internalState;
  return internalState;
}

- (void)setLastAsyncFuture:(id)a3
{
  id v4 = (NAFuture *)a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  lastAsyncFuture = self->_lastAsyncFuture;
  self->_lastAsyncFuture = v4;
}

- (NAFuture)lastAsyncFuture
{
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v3);

  lastAsyncFuture = self->_lastAsyncFuture;
  return lastAsyncFuture;
}

- (BOOL)isShuttingDown
{
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_shuttingDown;
}

- (BOOL)isRunning
{
  id v2 = self;
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v2 localZone];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 useAnonymousRequests:(BOOL)a5 ownerQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirror;
  uint64_t v14 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)&v29 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cloudDatabase, a4);
    objc_storeStrong((id *)&v15->_localDatabase, a3);
    v15->_useAnonymousRequests = a5;
    objc_storeStrong((id *)&v15->_workQueue, a6);
    uint64_t v16 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v13];
    workQueueScheduler = v15->_workQueueScheduler;
    v15->_workQueueScheduler = (NAScheduler *)v16;

    localZone = v15->_localZone;
    v15->_localZone = 0;

    uint64_t v19 = +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID sharedInstance];
    zoneID = v15->_zoneID;
    v15->_zoneID = (HMBLocalZoneID *)v19;

    uint64_t v21 = [MEMORY[0x263F58190] futureWithNoResult];
    lastAsyncFuture = v15->_lastAsyncFuture;
    v15->_lastAsyncFuture = (NAFuture *)v21;

    uint64_t v23 = objc_opt_new();
    startupPromise = v15->_startupPromise;
    v15->_startupPromise = (NAPromise *)v23;

    uint64_t v25 = objc_opt_new();
    shutdownPromise = v15->_shutdownPromise;
    v15->_shutdownPromise = (NAPromise *)v25;

    id v27 = v15;
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_192460 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_192460, &__block_literal_global_192461);
  }
  id v2 = (void *)logCategory__hmf_once_v5_192462;
  return v2;
}

void __68__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v5_192462;
  logCategory__hmf_once_v5_192462 = v0;
}

- (void)__retryFetchDatabaseChangesWithFetchInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [v4 retryIntervalSeconds];
  double v7 = v6;
  BOOL v8 = v6 > 0.0;
  id v9 = [v4 activity];
  if (v8) {
    id v10 = "retry the fetch";
  }
  else {
    id v10 = "fetch the next batch of changed zones";
  }
  [v4 retryIntervalSeconds];
  objc_msgSend(v9, "markWithFormat:", @"Will %s in %lu seconds", v10, (unint64_t)v11);

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    [v4 retryIntervalSeconds];
    *(_DWORD *)buf = 138543874;
    id v26 = v15;
    __int16 v27 = 2080;
    id v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = (unint64_t)v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Will %s in %lu seconds", buf, 0x20u);
  }
  [v4 retryIntervalSeconds];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  [v4 setShouldRetry:0];
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v13);
  uint64_t v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v13 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke;
  block[3] = &unk_264A27518;
  id v22 = v4;
  id v20 = v4;
  objc_copyWeak(&v23, (id *)buf);
  BOOL v24 = v7 > 0.0;
  dispatch_after(v18, v19, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activity];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke_2;
  v3[3] = &unk_264A27518;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  [v2 performBlock:v3];

  objc_destroyWeak(&v5);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) activity];
    if (*(unsigned char *)(a1 + 48)) {
      id v4 = "Retrying";
    }
    else {
      id v4 = "Fetching the next batch of changed zones";
    }
    id v5 = [*(id *)(a1 + 32) databaseChangeToken];
    char v6 = [v5 hmbDescription];
    [v3 markWithFormat:@"%s, token: %@", v4, v6];

    double v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      if (*(unsigned char *)(a1 + 48)) {
        double v11 = "Retrying";
      }
      else {
        double v11 = "Fetching the next batch of changed zones";
      }
      id v12 = [*(id *)(a1 + 32) databaseChangeToken];
      id v13 = [v12 hmbDescription];
      *(_DWORD *)buf = 138543874;
      double v16 = v10;
      __int16 v17 = 2080;
      dispatch_time_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@%s, token: %@", buf, 0x20u);
    }
    objc_msgSend(v8, "__fetchDatabaseChangesWithFetchInfo:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    [*(id *)(a1 + 32) finishWithError:v14];
  }
}

- (BOOL)__canRecoverFromFetchDatabaseChangesError:(id)a3 fetchInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (!objc_msgSend(v6, "hmd_isCKError") || (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) != 0) {
    goto LABEL_11;
  }
  if ([v6 code] == 21)
  {
    id v9 = [v7 activity];
    [v9 markWithFormat:@"Change token has expired: %@", v6];

    id v10 = (void *)MEMORY[0x230FBD990]();
    double v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Change token has expired: %@", buf, 0x16u);
    }
    [v7 setDatabaseChangeToken:0];
    BOOL v14 = 1;
    [v7 setShouldRetry:1];
    goto LABEL_12;
  }
  [v6 hmbCloudKitRetryDelay];
  objc_msgSend(v7, "setRetryIntervalSeconds:");
  if (![v7 shouldRetry])
  {
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  id v15 = [v7 activity];
  [v15 markWithFormat:@"Ignoring non-fatal error: %@", v6];

  double v16 = (void *)MEMORY[0x230FBD990]();
  __int16 v17 = self;
  dispatch_time_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v19;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)__fetchDatabaseChangesCompleted:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6
    && ![(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __canRecoverFromFetchDatabaseChangesError:v6 fetchInfo:v8])
  {
    [v8 finishWithError:v6];
  }
  else if ([v8 shouldRetry])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __retryFetchDatabaseChangesWithFetchInfo:v8];
  }
  else if ([v8 zonesHaveChanged])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __fetchVerificationCertificatesWithFetchInfo:v8];
  }
  else if ([v8 zonesWereDeleted])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __removeDeletedZonesWithFetchInfo:v8];
  }
  else
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __updateChangeTokenWithFetchInfo:v8];
  }
}

- (void)__fetchDatabaseChangesWithFetchInfo:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);
  id v6 = [v4 activity];
  id v7 = [v4 databaseChangeToken];
  id v8 = [v7 hmbDescription];
  [v6 markWithFormat:@"Checking for database changes with change token: %@", v8];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  double v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v4 databaseChangeToken];
    BOOL v14 = [v13 hmbDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v50 = v12;
    __int16 v51 = 2112;
    uint64_t v52 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Checking for database changes with change token: %@", buf, 0x16u);
  }
  id v15 = objc_alloc(MEMORY[0x263EFD698]);
  double v16 = [v4 databaseChangeToken];
  __int16 v17 = (void *)[v15 initWithPreviousServerChangeToken:v16];

  [v17 setCallbackQueue:v5];
  dispatch_time_t v18 = [v4 operationGroup];
  [v17 setGroup:v18];

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke;
  v45[3] = &unk_264A27478;
  id v19 = v4;
  id v46 = v19;
  id v20 = v5;
  id v47 = v20;
  uint64_t v48 = v10;
  [v17 setRecordZoneWithIDChangedBlock:v45];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_14;
  aBlock[3] = &unk_264A27478;
  id v21 = v19;
  id v42 = v21;
  id v22 = v20;
  id v43 = v22;
  id v44 = v10;
  __int16 v23 = _Block_copy(aBlock);
  [v17 setRecordZoneWithIDWasDeletedBlock:v23];
  [v17 setRecordZoneWithIDWasPurgedBlock:v23];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_22;
  v37[3] = &unk_264A274A0;
  id v24 = v21;
  id v38 = v24;
  uint64_t v25 = v22;
  uint64_t v39 = v25;
  uint64_t v40 = v10;
  [v17 setChangeTokenUpdatedBlock:v37];
  objc_initWeak((id *)buf, v10);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_28;
  v32[3] = &unk_264A274F0;
  id v26 = v24;
  id v33 = v26;
  __int16 v27 = v25;
  uint64_t v34 = v27;
  uint64_t v35 = v10;
  objc_copyWeak(&v36, (id *)buf);
  [v17 setFetchDatabaseChangesCompletionBlock:v32];
  id v28 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v10 cloudDatabase];
  __int16 v29 = [v28 publicDatabase];
  [v29 addOperation:v17];

  unint64_t v30 = [v26 operationStartTime];
  LODWORD(v28) = v30 == 0;

  if (v28)
  {
    uint64_t v31 = [MEMORY[0x263EFF910] now];
    [v26 setOperationStartTime:v31];
  }
  objc_destroyWeak(&v36);

  objc_destroyWeak((id *)buf);
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2;
  v6[3] = &unk_264A2E610;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 48);
  id v5 = v3;
  [v4 performBlock:v6];
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_15;
  v6[3] = &unk_264A2E610;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 48);
  id v5 = v3;
  [v4 performBlock:v6];
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_23;
  v6[3] = &unk_264A2E610;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 48);
  id v5 = v3;
  [v4 performBlock:v6];
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_28(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) activity];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_29;
  v13[3] = &unk_264A274C8;
  id v14 = *(id *)(a1 + 40);
  id v10 = v8;
  id v15 = v10;
  id v16 = *(id *)(a1 + 32);
  id v11 = v7;
  char v20 = a3;
  uint64_t v12 = *(void *)(a1 + 48);
  id v17 = v11;
  uint64_t v18 = v12;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  [v9 performBlock:v13];

  objc_destroyWeak(&v19);
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_29(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) activity];
  id v4 = [*(id *)(a1 + 56) hmbDescription];
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    [v3 markWithFormat:@"Database changes operation completed unsuccessfully, token: %@, error: %@, moreComing: %@", v4, v5, v6];

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 64);
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v10 = HMFGetLogIdentifier();
    id v11 = [*(id *)(a1 + 56) hmbDescription];
    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    *(_DWORD *)buf = 138544130;
    id v28 = v10;
    __int16 v29 = 2112;
    unint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    __int16 v33 = 2112;
    uint64_t v34 = v13;
    id v14 = "%{public}@Database changes operation completed unsuccessfully, token: %@, error: %@, moreComing: %@";
    id v15 = v9;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 42;
  }
  else
  {
    uint64_t v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    [v3 markWithFormat:@"Database changes operation completed successfully, token: %@, moreComing: %@", v4, v18];

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 64);
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v10 = HMFGetLogIdentifier();
    id v11 = [*(id *)(a1 + 56) hmbDescription];
    id v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    *(_DWORD *)buf = 138543874;
    id v28 = v10;
    __int16 v29 = 2112;
    unint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v13;
    id v14 = "%{public}@Database changes operation completed successfully, token: %@, moreComing: %@";
    id v15 = v9;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 32;
  }
  _os_log_impl(&dword_22F52A000, v15, v16, v14, buf, v17);

LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v20 = *(void *)(a1 + 56);
    if (!*(void *)(a1 + 40) || v20) {
      [*(id *)(a1 + 48) setDatabaseChangeToken:v20];
    }
    if (*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 48) setShouldRetry:1];
    }
    objc_msgSend(WeakRetained, "__fetchDatabaseChangesCompleted:error:", *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
  else
  {
    id v21 = [*(id *)(a1 + 48) activity];
    [v21 markWithFormat:@"Mirror has been deallocated"];

    id v22 = (void *)MEMORY[0x230FBD990]();
    __int16 v23 = objc_opt_class();
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Mirror has been deallocated", buf, 0xCu);
    }
    id v26 = *(id *)(a1 + 40);
    if (!v26)
    {
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    }
    [*(id *)(a1 + 48) finishWithError:v26];
  }
}

uint64_t __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_23(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 40) activity];
  id v3 = [*(id *)(a1 + 48) hmbDescription];
  [v2 markWithFormat:@"Change token was updated: %@", v3];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 56);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 48) hmbDescription];
    *(_DWORD *)buf = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Change token was updated: %@", buf, 0x16u);
  }
  return [*(id *)(a1 + 40) setDatabaseChangeToken:*(void *)(a1 + 48)];
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_15(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 40) zoneInfoMap];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 40) activity];
  uint64_t v5 = [*(id *)(a1 + 48) hmbDescription];
  id v6 = (void *)v5;
  if (v3)
  {
    [v4 markWithFormat:@"Zone was deleted: %@", v5];

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 56);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 48) hmbDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Zone was deleted: %@", buf, 0x16u);
    }
    [v3 markDeleted];
    [*(id *)(a1 + 40) markZonesDeleted];
  }
  else
  {
    [v4 markWithFormat:@"Ignoring deleted zone: %@", v5];

    __int16 v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      os_log_type_t v16 = [*(id *)(a1 + 48) hmbDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring deleted zone: %@", buf, 0x16u);
    }
  }
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 40) zoneInfoMap];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v3
    || ([*(id *)(a1 + 48) zoneName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"certificates"],
        v4,
        v5))
  {
    id v6 = [*(id *)(a1 + 40) activity];
    id v7 = [*(id *)(a1 + 48) hmbDescription];
    [v6 markWithFormat:@"Zone has changes: %@", v7];

    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 56);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      __int16 v12 = [*(id *)(a1 + 48) hmbDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v11;
      __int16 v28 = 2112;
      __int16 v29 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Zone has changes: %@", buf, 0x16u);
    }
    if (v3)
    {
      [v3 markChanged];
    }
    else
    {
      id v13 = [*(id *)(a1 + 40) activity];
      [v13 markWithFormat:@"Forcing all zones to drop change tokens and refresh"];

      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 56);
      os_log_type_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint32_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v27 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Forcing all zones to drop change tokens and refresh", buf, 0xCu);
      }
      uint64_t v18 = [*(id *)(a1 + 40) zoneInfoMap];
      [v18 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_213117];
    }
    [*(id *)(a1 + 40) markZonesChanged];
  }
  else
  {
    __int16 v19 = [*(id *)(a1 + 40) activity];
    uint64_t v20 = [*(id *)(a1 + 48) hmbDescription];
    [v19 markWithFormat:@"Ignoring changes from zone: %@", v20];

    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 56);
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = [*(id *)(a1 + 48) hmbDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v24;
      __int16 v28 = 2112;
      __int16 v29 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changes from zone: %@", buf, 0x16u);
    }
  }
}

uint64_t __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 forceRefresh];
}

- (void)__fetchZoneChangesWithFetchInfo:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v8 = 0;
  BOOL v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __createCloudZonesForFetchInfo:v4 error:&v8];
  id v7 = v8;
  if (v6) {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self __startUpCloudZonesWithFetchInfo:v4];
  }
  else {
    [v4 finishWithError:v7];
  }
}

- (void)__performCloudZonePullsWithFetchInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [v4 activity];
  [v6 markWithFormat:@"Starting to pull from cloud zones"];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting to pull from cloud zones", buf, 0xCu);
  }
  id v11 = (void *)MEMORY[0x263EFF980];
  __int16 v12 = [v4 zoneInfoMap];
  id v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  uint64_t v14 = [v4 zoneInfoMap];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke;
  v37[3] = &unk_264A2CE58;
  void v37[4] = v8;
  id v15 = v4;
  id v38 = v15;
  id v16 = v13;
  id v39 = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v37];

  uint64_t v17 = [v16 count];
  uint64_t v18 = [v15 activity];
  __int16 v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "markWithFormat:", @"Waiting for %lu cloud zones to pull", objc_msgSend(v16, "count"));

    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v8;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v16 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v23;
      __int16 v42 = 2048;
      uint64_t v43 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for %lu cloud zones to pull", buf, 0x16u);
    }
    uint64_t v25 = (void *)MEMORY[0x263F58190];
    id v26 = [MEMORY[0x263F581B8] globalAsyncScheduler];
    __int16 v27 = [v25 combineAllFutures:v16 ignoringErrors:1 scheduler:v26];
  }
  else
  {
    [v18 markWithFormat:@"Not waiting for any cloud zones to pull"];

    __int16 v28 = (void *)MEMORY[0x230FBD990]();
    __int16 v29 = v8;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Not waiting for any cloud zones to pull", buf, 0xCu);
    }
    __int16 v27 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_76;
  v34[3] = &unk_264A2CEA8;
  id v35 = v15;
  id v36 = v8;
  id v32 = v15;
  id v33 = (id)[v27 addSuccessBlock:v34];
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 cloudZone];
  if (v7)
  {
    id v8 = [v6 mirroredLocalZone];

    if (v8)
    {
      id v9 = [a1[4] cloudDatabase];
      id v10 = [v7 cloudZoneID];
      id v11 = [v9 serverChangeTokenForZoneWithID:v10];

      int v12 = [v6 ignoreChangeToken];
      id v13 = [a1[5] activity];
      uint64_t v14 = [v5 hmbDescription];
      id v15 = (void *)v14;
      if (v12)
      {
        [v13 markWithFormat:@"Fetching changes for zone %@ but ignoring change token", v14];

        id v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = a1[4];
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = HMFGetLogIdentifier();
          uint64_t v20 = [v5 hmbDescription];
          *(_DWORD *)buf = 138543618;
          id v36 = v19;
          __int16 v37 = 2112;
          id v38 = v20;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching changes for zone %@ but ignoring change token", buf, 0x16u);
        }

        id v11 = 0;
      }
      else
      {
        [v13 markWithFormat:@"Fetching changes for zone %@", v14];

        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = a1[4];
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          uint64_t v25 = [v5 hmbDescription];
          *(_DWORD *)buf = 138543618;
          id v36 = v24;
          __int16 v37 = 2112;
          id v38 = v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Fetching changes for zone %@", buf, 0x16u);
        }
      }
      id v26 = [a1[5] options];
      __int16 v27 = [v7 fetchChangesWithToken:v11 options:v26];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_62;
      v31[3] = &unk_264A2CED0;
      id v32 = a1[5];
      id v28 = v5;
      id v29 = a1[4];
      id v33 = v28;
      id v34 = v29;
      id v30 = (id)[v27 addCompletionBlock:v31];
      [a1[6] addObject:v27];
    }
  }
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_2;
  v8[3] = &unk_264A2F2F8;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  id v10 = v3;
  id v6 = v3;
  [v4 performBlock:v8];
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_3;
  block[3] = &unk_264A2F2F8;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  dispatch_async(v2, block);
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activity];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_4;
  v5[3] = &unk_264A2F2F8;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlock:v5];
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) zoneInfoMap];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_5;
  v11[3] = &unk_264A2CEF8;
  id v12 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v11];

  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__253440;
  int8x16_t v9 = __Block_byref_object_dispose__253441;
  id v10 = 0;
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_6;
  v4[3] = &unk_264A2CE80;
  v4[4] = &v5;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v4);
  if (v6[5]) {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else {
    objc_msgSend(*(id *)(a1 + 48), "__removeDeletedZonesWithFetchInfo:", *(void *)(a1 + 32));
  }
  _Block_object_dispose(&v5, 8);
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 cloudZone];
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 modifiedRecordIDsFromLastPull];
    id v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v7 = [*(id *)(a1 + 32) modifiedRecordIDs];
      [v7 unionSet:v6];
    }
    uint64_t v4 = v8;
  }
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
    *a4 = 1;
  }
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_62(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] activity];
  uint64_t v8 = [a1[5] hmbDescription];
  int8x16_t v9 = (void *)v8;
  if (v6)
  {
    [v7 markWithFormat:@"Failed to fetch changes for zone %@: %@", v8, v6];

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1[6];
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] hmbDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      id v15 = "%{public}@Failed to fetch changes for zone %@: %@";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v16, v17, v15, buf, v18);
    }
  }
  else
  {
    [v7 markWithFormat:@"Successfully fetched changes for zone %@", v8];

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1[6];
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] hmbDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      id v15 = "%{public}@Successfully fetched changes for zone %@";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 22;
      goto LABEL_6;
    }
  }
}

- (void)__startUpCloudZonesWithFetchInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 activity];
  [v6 markWithFormat:@"Starting up cloud zones"];

  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  int8x16_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting up cloud zones", buf, 0xCu);
  }
  id v11 = (void *)MEMORY[0x263EFF980];
  id v12 = [v4 zoneInfoMap];
  id v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  uint64_t v14 = [v4 zoneInfoMap];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke;
  v37[3] = &unk_264A2CE58;
  void v37[4] = v8;
  id v15 = v4;
  id v38 = v15;
  id v16 = v13;
  id v39 = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v37];

  uint64_t v17 = [v16 count];
  uint32_t v18 = [v15 activity];
  __int16 v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "markWithFormat:", @"Waiting for %lu cloud zones to start up", objc_msgSend(v16, "count"));

    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = v8;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v16 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v23;
      __int16 v42 = 2048;
      uint64_t v43 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for %lu cloud zones to start up", buf, 0x16u);
    }
    uint64_t v25 = (void *)MEMORY[0x263F58190];
    id v26 = [MEMORY[0x263F581B8] globalAsyncScheduler];
    __int16 v27 = [v25 combineAllFutures:v16 ignoringErrors:1 scheduler:v26];
  }
  else
  {
    [v18 markWithFormat:@"Not waiting for any cloud zones to start up"];

    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = v8;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Not waiting for any cloud zones to start up", buf, 0xCu);
    }
    __int16 v27 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_49;
  v34[3] = &unk_264A2CEA8;
  id v35 = v15;
  id v36 = v8;
  id v32 = v15;
  id v33 = (id)[v27 addSuccessBlock:v34];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 cloudZone];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F49308]);
    [v8 setCreateIfNeeded:1];
    int8x16_t v9 = [a1[4] localDatabase];
    id v46 = 0;
    id v10 = [v9 openZoneWithMirror:v7 configuration:v8 error:&v46];
    id v11 = v46;

    if (v10)
    {
      [v10 startUp];
      id v12 = [v7 startUp];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_32;
      v40[3] = &unk_264A2CE30;
      id v41 = a1[5];
      id v13 = v5;
      id v14 = a1[4];
      id v42 = v13;
      id v43 = v14;
      id v44 = v6;
      id v45 = v10;
      id v15 = [v12 flatMap:v40];

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_37;
      v36[3] = &unk_264A2E210;
      id v37 = a1[5];
      id v16 = v13;
      id v17 = a1[4];
      id v38 = v16;
      id v39 = v17;
      id v18 = (id)[v15 addFailureBlock:v36];
      [a1[6] addObject:v15];

      __int16 v19 = v41;
    }
    else
    {
      id v34 = v5;
      uint64_t v20 = [a1[5] activity];
      __int16 v21 = [v7 cloudZoneID];
      id v22 = [v21 zoneID];
      __int16 v23 = [v22 hmbDescription];
      id v35 = v11;
      [v20 markWithFormat:@"Failed to create mirrored local zone for %@: %@", v23, v11];

      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1[4];
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = id v33 = v24;
        id v32 = [v7 cloudZoneID];
        id v28 = [v32 zoneID];
        id v29 = [v28 hmbDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v48 = v27;
        __int16 v49 = 2112;
        __int16 v50 = v29;
        __int16 v51 = 2112;
        id v52 = v35;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create mirrored local zone for %@: %@", buf, 0x20u);

        uint64_t v24 = v33;
      }

      id v30 = [v7 startUp];
      [v30 cancel];

      id v31 = a1[6];
      id v11 = v35;
      __int16 v19 = [MEMORY[0x263F58190] futureWithError:v35];
      [v31 addObject:v19];
      id v5 = v34;
    }
  }
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_2;
  v8[3] = &unk_264A2F2F8;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  id v10 = v3;
  id v6 = v3;
  [v4 performBlock:v8];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_3;
  block[3] = &unk_264A2F2F8;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  dispatch_async(v2, block);
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activity];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_4;
  v5[3] = &unk_264A2F2F8;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlock:v5];
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_4(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__253440;
  uint64_t v8 = __Block_byref_object_dispose__253441;
  id v9 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_5;
  v3[3] = &unk_264A2CE80;
  void v3[4] = &v4;
  objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  if (v5[5]) {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:");
  }
  else {
    objc_msgSend(*(id *)(a1 + 48), "__performCloudZonePullsWithFetchInfo:", *(void *)(a1 + 40));
  }
  _Block_object_dispose(&v4, 8);
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v8;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
    *a4 = 1;
  }
}

id __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) activity];
  id v5 = [*(id *)(a1 + 40) hmbDescription];
  [v4 markWithFormat:@"Zone %@ started up", v5];

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 48);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [*(id *)(a1 + 40) hmbDescription];
    *(_DWORD *)buf = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ started up", buf, 0x16u);
  }
  [*(id *)(a1 + 56) setMirroredLocalZone:*(void *)(a1 + 64)];
  id v11 = [MEMORY[0x263F58190] futureWithNoResult];

  return v11;
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_37(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [a1[4] activity];
  id v5 = [a1[5] hmbDescription];
  [v4 markWithFormat:@"Zone %@ failed to start up: %@", v5, v3];

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[6];
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [a1[5] hmbDescription];
    *(_DWORD *)buf = 138543874;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Zone %@ failed to start up: %@", buf, 0x20u);
  }
}

- (BOOL)__createCloudZonesForFetchInfo:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 zoneInfoMap];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [v6 activity];
    [v10 markWithFormat:@"Creating cloud zones"];

    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating cloud zones", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000;
    id v30 = __Block_byref_object_copy__253440;
    id v31 = __Block_byref_object_dispose__253441;
    id v32 = 0;
    __int16 v15 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v12 cloudDatabase];
    id v16 = (os_unfair_lock_s *)&v15[*MEMORY[0x263F49348]];
    os_unfair_lock_lock_with_options();

    uint64_t v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v12 cloudDatabase];
    id v18 = [v17 databaseStateForDatabaseScope:1];

    __int16 v19 = [v6 zoneInfoMap];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____createCloudZonesForFetchInfo_error___block_invoke;
    v23[3] = &unk_264A2CE08;
    id v24 = v6;
    id v25 = v12;
    p_long long buf = &buf;
    id v20 = v18;
    id v26 = v20;
    [v19 enumerateKeysAndObjectsUsingBlock:v23];

    os_unfair_lock_unlock(v16);
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v21 = *(void *)(*((void *)&buf + 1) + 40) == 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____createCloudZonesForFetchInfo_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v8 zoneHasChanged])
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "__createCloudZoneIDForZoneID:", v7);
    id v10 = [*(id *)(a1 + 40) cloudDatabase];
    id v11 = [v10 zoneStateByZoneID];
    id v12 = [v11 objectForKeyedSubscript:v9];

    __int16 v13 = [*(id *)(a1 + 32) activity];
    uint64_t v14 = [v7 hmbDescription];
    __int16 v15 = (void *)v14;
    if (v12)
    {
      id v89 = v7;
      [v13 markWithFormat:@"Already have a model for zone %@", v14];

      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v19 = v12;
        id v20 = v8;
        BOOL v21 = v9;
        __int16 v23 = v22 = a4;
        id v24 = [v89 hmbDescription];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v93 = v23;
        __int16 v94 = 2112;
        uint64_t v95 = v24;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Already have a model for zone %@", buf, 0x16u);

        a4 = v22;
        uint64_t v9 = v21;
        id v8 = v20;
        id v12 = v19;
      }

      id v25 = [v12 cloudZone];
      if (v25)
      {
        id v26 = v25;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          id v28 = v26;
        }
        else {
          id v28 = 0;
        }
        id v88 = v28;

        uint64_t v29 = [*(id *)(a1 + 32) activity];
        id v7 = v89;
        uint64_t v30 = [v89 hmbDescription];
        id v31 = (void *)v30;
        if (isKindOfClass)
        {
          [v29 markWithFormat:@"Already have an open HMDNetworkRouterFirewallRuleCloudZone for zone %@", v30];

          id v32 = (void *)MEMORY[0x230FBD990]();
          id v33 = *(id *)(a1 + 40);
          id v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            id v35 = HMFGetLogIdentifier();
            id v36 = [v89 hmbDescription];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v93 = v35;
            __int16 v94 = 2112;
            uint64_t v95 = v36;
            _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Already have an open HMDNetworkRouterFirewallRuleCloudZone for zone %@", buf, 0x16u);
          }
          [v8 setCloudZone:v26];
        }
        else
        {
          long long v87 = a4;
          [v29 markWithFormat:@"Another HMBCloudZone open for %@ that isn't one of ours: %@", v30, v26];

          id v70 = (void *)MEMORY[0x230FBD990]();
          id v71 = *(id *)(a1 + 40);
          __int16 v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v73 = id v86 = v70;
            __int16 v74 = [v89 hmbDescription];
            *(_DWORD *)long long buf = 138543874;
            uint64_t v93 = v73;
            __int16 v94 = 2112;
            uint64_t v95 = v74;
            __int16 v96 = 2112;
            id v97 = v26;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_ERROR, "%{public}@Another HMBCloudZone open for %@ that isn't one of ours: %@", buf, 0x20u);

            id v70 = v86;
          }

          uint64_t v75 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          uint64_t v76 = *(void *)(*(void *)(a1 + 56) + 8);
          id v77 = *(void **)(v76 + 40);
          *(void *)(v76 + 40) = v75;

          *long long v87 = 1;
        }

        goto LABEL_29;
      }
      id v7 = v89;
    }
    else
    {
      [v13 markWithFormat:@"Saving new cloud zone model for zone %@", v14];

      id v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = *(id *)(a1 + 40);
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = HMFGetLogIdentifier();
        uint64_t v48 = [v7 hmbDescription];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v93 = v47;
        __int16 v94 = 2112;
        uint64_t v95 = v48;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Saving new cloud zone model for zone %@", buf, 0x16u);
      }
      id v49 = objc_alloc(MEMORY[0x263F49280]);
      __int16 v50 = [v9 modelID];
      __int16 v51 = [*(id *)(a1 + 48) hmbModelID];
      id v12 = (void *)[v49 initWithModelID:v50 parentModelID:v51];

      [v12 setZoneID:v9];
      [v12 setNeedsZoneCreation:MEMORY[0x263EFFA80]];
      id v52 = [*(id *)(a1 + 40) cloudDatabase];
      uint64_t v53 = [v52 stateZone];
      v91 = v12;
      long long v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
      uint64_t v55 = [v53 update:v54];
      uint64_t v56 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v57 = *(void **)(v56 + 40);
      *(void *)(v56 + 40) = v55;

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        long long v58 = [*(id *)(a1 + 32) activity];
        __int16 v59 = [v7 hmbDescription];
        [v58 markWithFormat:@"Failed to save new cloud zone model for zone %@: %@", v59, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

        uint64_t v60 = (void *)MEMORY[0x230FBD990]();
        id v61 = *(id *)(a1 + 40);
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          uint64_t v63 = HMFGetLogIdentifier();
          [v7 hmbDescription];
          id v90 = v7;
          uint64_t v64 = v12;
          id v65 = v8;
          long long v66 = v9;
          v68 = long long v67 = a4;
          long long v69 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)long long buf = 138543874;
          uint64_t v93 = v63;
          __int16 v94 = 2112;
          uint64_t v95 = v68;
          __int16 v96 = 2112;
          id v97 = v69;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new cloud zone model for zone %@: %@", buf, 0x20u);

          a4 = v67;
          uint64_t v9 = v66;
          id v8 = v65;
          id v12 = v64;
          id v7 = v90;
        }
        *a4 = 1;
        goto LABEL_29;
      }
      __int16 v78 = [*(id *)(a1 + 40) cloudDatabase];
      uint64_t v79 = [v78 zoneStateByZoneID];
      [v79 setObject:v12 forKeyedSubscript:v9];
    }
    __int16 v80 = [HMDNetworkRouterFirewallRuleCloudZone alloc];
    id v81 = [*(id *)(a1 + 40) cloudDatabase];
    uint64_t v82 = [*(id *)(a1 + 40) useAnonymousRequests];
    uint64_t v83 = [v8 recordIDs];
    v84 = [*(id *)(a1 + 32) signatureVerificationPublicKeys];
    v85 = [(HMDNetworkRouterFirewallRuleCloudZone *)v80 initWithCloudDatabase:v81 state:v12 useAnonymousRequests:v82 watchedRecordIDs:v83 signatureVerificationPublicKeys:v84];

    [v12 setCloudZone:v85];
    [v8 setCloudZone:v85];

LABEL_29:
    goto LABEL_30;
  }
  id v37 = [*(id *)(a1 + 32) activity];
  id v38 = [v7 hmbDescription];
  [v37 markWithFormat:@"Ignoring zone %@ that has no changes", v38];

  id v39 = (void *)MEMORY[0x230FBD990]();
  id v40 = *(id *)(a1 + 40);
  id v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    id v42 = HMFGetLogIdentifier();
    id v43 = [v7 hmbDescription];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v93 = v42;
    __int16 v94 = 2112;
    uint64_t v95 = v43;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring zone %@ that has no changes", buf, 0x16u);
  }
LABEL_30:
}

@end