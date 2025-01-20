@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo
- (BOOL)zonesHaveChanged;
- (BOOL)zonesWereDeleted;
- (CKServerChangeToken)databaseChangeToken;
- (CKServerChangeToken)originalDatabaseChangeToken;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo)initWithActivity:(id)a3 options:(id)a4 databaseChangeToken:(id)a5 promise:(id)a6 xpcActivity:(id)a7 database:(id)a8 useAnonymousRequests:(BOOL)a9 recordIDs:(id)a10 lastSynchronizedRecordIDs:(id)a11;
- (NSArray)signatureVerificationPublicKeys;
- (NSDictionary)zoneInfoMap;
- (NSMutableSet)modifiedRecordIDs;
- (NSSet)requestedRecordIDs;
- (void)__cleanupMirroredZones:(id)a3 cloudZones:(id)a4 result:(id)a5 error:(id)a6;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)markZonesChanged;
- (void)markZonesDeleted;
- (void)setDatabaseChangeToken:(id)a3;
- (void)setOriginalDatabaseChangeToken:(id)a3;
- (void)setSignatureVerificationPublicKeys:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureVerificationPublicKeys, 0);
  objc_storeStrong((id *)&self->_modifiedRecordIDs, 0);
  objc_storeStrong((id *)&self->_originalDatabaseChangeToken, 0);
  objc_storeStrong((id *)&self->_databaseChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneInfoMap, 0);
  objc_storeStrong((id *)&self->_requestedRecordIDs, 0);
}

- (void)setSignatureVerificationPublicKeys:(id)a3
{
}

- (NSArray)signatureVerificationPublicKeys
{
  return self->_signatureVerificationPublicKeys;
}

- (BOOL)zonesWereDeleted
{
  return self->_zonesWereDeleted;
}

- (BOOL)zonesHaveChanged
{
  return self->_zonesHaveChanged;
}

- (NSMutableSet)modifiedRecordIDs
{
  return self->_modifiedRecordIDs;
}

- (void)setOriginalDatabaseChangeToken:(id)a3
{
}

- (CKServerChangeToken)originalDatabaseChangeToken
{
  return self->_originalDatabaseChangeToken;
}

- (void)setDatabaseChangeToken:(id)a3
{
}

- (CKServerChangeToken)databaseChangeToken
{
  return self->_databaseChangeToken;
}

- (NSDictionary)zoneInfoMap
{
  return self->_zoneInfoMap;
}

- (NSSet)requestedRecordIDs
{
  return self->_requestedRecordIDs;
}

- (void)__cleanupMirroredZones:(id)a3 cloudZones:(id)a4 result:(id)a5 error:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v47 = a5;
  id v46 = a6;
  v48 = v11;
  v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count") + objc_msgSend(v10, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v61;
    v15 = @"Shutting down mirrored zone %@";
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self activity];
        objc_msgSend(v18, "markWithFormat:", v15, v17);

        v19 = (void *)MEMORY[0x1D9452090]();
        v20 = self;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v22 = v13;
          v24 = v23 = v15;
          *(_DWORD *)buf = 138543618;
          v66 = v24;
          __int16 v67 = 2112;
          v68 = v17;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Shutting down mirrored zone %@", buf, 0x16u);

          v15 = v23;
          uint64_t v13 = v22;
        }

        v25 = [v17 shutdown];
        [v51 addObject:v25];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v13);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v49 = v48;
  uint64_t v26 = [v49 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v57;
    v29 = @"Shutting down cloud zone %@";
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v57 != v28) {
          objc_enumerationMutation(v49);
        }
        v31 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        v32 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self activity];
        objc_msgSend(v32, "markWithFormat:", v29, v31);

        v33 = (void *)MEMORY[0x1D9452090]();
        v34 = self;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = v36 = v29;
          *(_DWORD *)buf = 138543618;
          v66 = v37;
          __int16 v67 = 2112;
          v68 = v31;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Shutting down cloud zone %@", buf, 0x16u);

          v29 = v36;
        }

        v38 = [v31 shutdown];
        [v51 addObject:v38];
      }
      uint64_t v27 = [v49 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v27);
  }

  v39 = (void *)MEMORY[0x1E4F7A0D8];
  v40 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  v41 = [v39 combineAllFutures:v51 ignoringErrors:1 scheduler:v40];

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke;
  v52[3] = &unk_1E6A19020;
  v52[4] = self;
  id v53 = v49;
  id v54 = v47;
  id v55 = v46;
  id v42 = v46;
  id v43 = v47;
  id v44 = v49;
  id v45 = (id)[v41 addSuccessBlock:v52];
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke_2;
  v8[3] = &unk_1E6A114E0;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
  objc_msgSendSuper2(&v7, sel_finishWithResult_error_, v5, v6);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) activity];
    id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    [v8 markWithFormat:@"Failed to shut down zone %@: %@", v9, v7];

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      *(_DWORD *)buf = 138543874;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down zone %@: %@", buf, 0x20u);
    }
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *)self zoneInfoMap];
  id v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 mirroredLocalZone];

        if (v16)
        {
          __int16 v17 = [v15 mirroredLocalZone];
          [v7 addObject:v17];

          [v15 setMirroredLocalZone:0];
        }
        else
        {
          v18 = [v15 cloudZone];

          if (!v18) {
            continue;
          }
          __int16 v19 = [v15 cloudZone];
          [v8 addObject:v19];
        }
        [v15 setCloudZone:0];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    id v20 = (void *)[v7 copy];
    uint64_t v21 = (void *)[v8 copy];
    uint64_t v22 = v23;
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *)self __cleanupMirroredZones:v20 cloudZones:v21 result:v23 error:v6];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
    uint64_t v22 = v23;
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v24 finishWithResult:v23 error:v6];
  }
}

- (void)markZonesDeleted
{
  self->_zonesWereDeleted = 1;
}

- (void)markZonesChanged
{
  self->_zonesHaveChanged = 1;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo)initWithActivity:(id)a3 options:(id)a4 databaseChangeToken:(id)a5 promise:(id)a6 xpcActivity:(id)a7 database:(id)a8 useAnonymousRequests:(BOOL)a9 recordIDs:(id)a10 lastSynchronizedRecordIDs:(id)a11
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  obuint64_t j = a5;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  objc_super v24 = [a8 container];
  v72.receiver = self;
  v72.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
  long long v63 = v20;
  long long v25 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v72 initWithActivity:v17 options:v18 container:v24 useAnonymousRequests:a9 promise:v20];

  if (v25)
  {
    id v62 = v23;
    id v58 = v19;
    id v59 = v18;
    id v60 = v17;
    if (v21)
    {
      long long v26 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)v25 operationGroup];
      long long v27 = [v26 defaultConfiguration];
      [v27 setXpcActivity:v21];
    }
    long long v56 = v25;
    id v57 = v21;
    long long v28 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v55 = v22;
    id v29 = v22;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v69 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v35 = [v34 zoneID];
          v36 = [v28 objectForKeyedSubscript:v35];
          if (!v36)
          {
            v36 = [[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo alloc] initWithZoneID:v35];
            [v28 setObject:v36 forKeyedSubscript:v35];
          }
          v37 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *)v36 recordIDs];
          [v37 addObject:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v31);
    }

    v38 = (void *)[v29 mutableCopy];
    [v38 minusSet:v23];
    uint64_t v39 = [v38 count];
    if (v39)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v40 = v38;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v65 != v43) {
              objc_enumerationMutation(v40);
            }
            id v45 = [*(id *)(*((void *)&v64 + 1) + 8 * j) zoneID];
            id v46 = [v28 objectForKeyedSubscript:v45];
            [v46 forceRefresh];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }
        while (v42);
      }

      id v23 = v62;
    }
    uint64_t v47 = [v29 copy];
    long long v25 = v56;
    requestedRecordIDs = v56->_requestedRecordIDs;
    v56->_requestedRecordIDs = (NSSet *)v47;

    uint64_t v49 = [v28 copy];
    zoneInfoMap = v56->_zoneInfoMap;
    v56->_zoneInfoMap = (NSDictionary *)v49;

    objc_storeStrong((id *)&v56->_databaseChangeToken, obj);
    objc_storeStrong((id *)&v56->_originalDatabaseChangeToken, obj);
    uint64_t v51 = [MEMORY[0x1E4F1CA80] set];
    modifiedRecordIDs = v56->_modifiedRecordIDs;
    v56->_modifiedRecordIDs = (NSMutableSet *)v51;

    v56->_zonesHaveChanged = v39 != 0;
    id v53 = v56;

    id v18 = v59;
    id v17 = v60;
    id v21 = v57;
    id v19 = v58;
    id v22 = v55;
  }

  return v25;
}

@end