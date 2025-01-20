@interface HMDHomeOwnerCloudShareManager
+ (id)logCategory;
- (HMDHomeOwnerCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6 cloudTransform:(id)a7 homeManager:(id)a8;
- (HMDHomeOwnerCloudShareManager)initWithShareService:(id)a3 homeManager:(id)a4 cloudTransform:(id)a5 modelSelectionBlock:(id)a6;
- (id)_allExistingSharesForHomeWithModelID:(id)a3 error:(id *)a4;
- (id)_canonicalModelFromSharedHomes:(id)a3;
- (id)_canonicalShareFromSharesToSharedHomes:(id)a3 shareMap:(id)a4;
- (id)_createShareForHome:(id)a3;
- (id)_existingShareForHomeWithModelID:(id)a3 error:(id *)a4;
- (id)_existingSharedHomeWithoutShareWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_existingSharedHomesWithModelID:(id)a3 error:(id *)a4;
- (id)_removeShare:(id)a3 usingShareService:(id)a4 forHomeWithUUID:(id)a5;
- (id)_shareForHome:(id)a3;
- (id)acceptShareInvitation:(id)a3;
- (id)auditAccessForUsers:(id)a3 home:(id)a4;
- (id)grantAccessForUser:(id)a3 home:(id)a4 logEventBuilder:(id)a5;
- (id)removeSharesForHome:(id)a3;
- (id)revokeAccessForUser:(id)a3 home:(id)a4;
- (void)didDeleteModelWithID:(id)a3 tombstone:(id)a4 context:(id)a5;
- (void)updateSharedOwnerAccountHandleForHome:(id)a3;
@end

@implementation HMDHomeOwnerCloudShareManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelSelectionBlock, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_shareService, 0);
}

- (void)didDeleteModelWithID:(id)a3 tombstone:(id)a4 context:(id)a5
{
  id v14 = a3;
  v7 = [a4 objectForKeyedSubscript:@"modelID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v14 entity];
    v11 = +[MKFCKSharedUserDataRoot entity];
    int v12 = [v10 isKindOfEntity:v11];

    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
      [WeakRetained auditAccessForUsersForHome:v9];
    }
  }
}

- (void)updateSharedOwnerAccountHandleForHome:(id)a3
{
  id v4 = a3;
  if ([v4 isOwnerUser])
  {
    v5 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__HMDHomeOwnerCloudShareManager_updateSharedOwnerAccountHandleForHome___block_invoke;
    v6[3] = &unk_264A2F820;
    v6[4] = self;
    id v7 = v4;
    [v5 performBlock:v6];
  }
}

void __71__HMDHomeOwnerCloudShareManager_updateSharedOwnerAccountHandleForHome___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v54 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) uuid];
  id v42 = 0;
  id v4 = [v2 _existingSharedHomesWithModelID:v3 error:&v42];
  id v5 = v42;

  if (v4 && (objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    v33 = v5;
    v6 = [*(id *)(v1 + 40) owner];
    id v7 = [v6 accountHandle];
    v8 = [v7 value];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v34 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v53 count:16];
    uint64_t v35 = v1;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        uint64_t v36 = v11;
        do
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
          v15 = [v14 ownerAccountHandle];
          char v16 = [v15 isEqualToString:v8];

          if ((v16 & 1) == 0)
          {
            v17 = (void *)MEMORY[0x230FBD990]();
            id v18 = *(id *)(v1 + 32);
            v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v20 = v12;
              v22 = id v21 = v9;
              v23 = [v14 homeModelID];
              *(_DWORD *)buf = 138544386;
              v44 = v22;
              __int16 v45 = 2160;
              uint64_t v46 = 1752392040;
              __int16 v47 = 2112;
              id v48 = v23;
              __int16 v49 = 2160;
              uint64_t v50 = 1752392040;
              __int16 v51 = 2112;
              v52 = v8;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating account handle on shared home model %{mask.hash}@ to %{mask.hash}@", buf, 0x34u);

              uint64_t v1 = v35;
              id v9 = v21;
              uint64_t v12 = v20;
              uint64_t v11 = v36;
            }

            [v14 setOwnerAccountHandle:v8];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v53 count:16];
      }
      while (v11);
    }

    v24 = [*(id *)(*(void *)(v1 + 32) + 8) managedObjectContext];
    int v25 = [v24 hasChanges];

    if (v25)
    {
      v26 = [*(id *)(*(void *)(v1 + 32) + 8) managedObjectContext];
      id v37 = v33;
      objc_msgSend(v26, "hmd_saveWithTransactionAuthor:error:", 9, &v37);
      id v5 = v37;

      if (v5)
      {
        v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = *(id *)(v1 + 32);
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          v31 = [*(id *)(v1 + 40) shortDescription];
          *(_DWORD *)buf = 138543874;
          v44 = v30;
          __int16 v45 = 2112;
          uint64_t v46 = (uint64_t)v31;
          __int16 v47 = 2114;
          id v48 = v5;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to update owner account handle on shared home model for home %@ due to %{public}@", buf, 0x20u);

          uint64_t v1 = v35;
        }
      }
    }
    else
    {
      id v5 = v33;
    }
    id v4 = v34;
    v32 = [*(id *)(*(void *)(v1 + 32) + 8) managedObjectContext];
    [v32 reset];
  }
}

- (id)_existingSharedHomeWithoutShareWithHomeModelID:(id)a3 error:(id *)a4
{
  v6 = -[HMDHomeOwnerCloudShareManager _existingSharedHomesWithModelID:error:](self, "_existingSharedHomesWithModelID:error:", a3);
  id v7 = v6;
  if (*a4 || ![v6 count])
  {
    v8 = 0;
  }
  else
  {
    id v9 = objc_msgSend(v7, "na_map:", &__block_literal_global_36_245375);
    uint64_t v10 = [(HMDCoreDataCloudShareService *)self->_shareService container];
    uint64_t v11 = [v10 fetchSharesMatchingObjectIDs:v9 error:a4];

    if (*a4)
    {
      v8 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke_2;
      v13[3] = &unk_264A2C000;
      id v14 = v11;
      v8 = objc_msgSend(v7, "na_filter:", v13);
    }
  }

  return v8;
}

BOOL __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 objectID];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

uint64_t __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)_createShareForHome:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 uuid];
  id v47 = 0;
  v6 = [(HMDHomeOwnerCloudShareManager *)self _existingSharedHomeWithoutShareWithHomeModelID:v5 error:&v47];
  id v7 = v47;

  if (v7)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v50 = 2114;
      id v51 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing shared home model failed with error: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = (void *)MEMORY[0x263F42538];
    uint64_t v13 = HMDSanitizeCoreDataError(v7);
    id v14 = [v12 futureWithError:v13];
  }
  else
  {
    uint64_t v15 = [v6 count];
    char v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    id v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        uint64_t v20 = HMFGetLogIdentifier();
        id v21 = [v4 uuid];
        uint64_t v22 = [v6 count];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v20;
        __int16 v50 = 2112;
        id v51 = v21;
        __int16 v52 = 2048;
        uint64_t v53 = v22;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Will attempt to re-share first MKFCKSharedHome for home %@ that doesn't have an associated share out of %lu found", buf, 0x20u);
      }
      uint64_t v13 = [(HMDHomeOwnerCloudShareManager *)v17 _canonicalModelFromSharedHomes:v6];
    }
    else
    {
      if (v19)
      {
        v23 = HMFGetLogIdentifier();
        v24 = [v4 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v50 = 2112;
        id v51 = v24;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedHome for home %@ since none was found", buf, 0x16u);
      }
      int v25 = [v4 uuid];
      v26 = [(HMDCoreDataCloudShareService *)v17->_shareService privateStore];
      v27 = [(HMDCoreDataCloudShareService *)v17->_shareService managedObjectContext];
      uint64_t v13 = +[MKFCKSharedHome createWithModelID:v25 persistentStore:v26 context:v27];

      id v28 = [v4 name];
      [v13 setName:v28];

      v29 = [v4 owner];
      v30 = [v29 uuid];
      [v13 setOwnerModelID:v30];

      v31 = [v4 owner];
      v32 = [v31 accountHandle];
      v33 = [v32 value];
      [v13 setOwnerAccountHandle:v33];

      v34 = [v4 roomForEntireHome];
      uint64_t v35 = [v34 uuid];
      [v13 setDefaultRoomModelID:v35];
    }
    uint64_t v36 = (void *)MEMORY[0x230FBD990]();
    id v37 = v17;
    long long v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      long long v39 = HMFGetLogIdentifier();
      long long v40 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v50 = 2112;
      id v51 = v40;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Creating share for home %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    id v14 = [MEMORY[0x263F42538] futureWithPromise:buf];
    long long v41 = [v37[1] container];
    id v48 = v13;
    id v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __53__HMDHomeOwnerCloudShareManager__createShareForHome___block_invoke;
    v44[3] = &unk_264A2BFD8;
    v44[4] = v37;
    id v45 = v4;
    id v46 = *(id *)buf;
    [v41 shareManagedObjects:v42 toShare:0 completion:v44];
  }
  return v14;
}

void __53__HMDHomeOwnerCloudShareManager__createShareForHome___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = a1[4];
  uint64_t v15 = HMFGetOSLogHandle();
  char v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      id v18 = [a1[5] shortDescription];
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create share for home %@ due to %@. Leaving model alone to reuse next time we share it.", (uint8_t *)&v21, 0x20u);
    }
    [a1[6] rejectWithError:v12];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = HMFGetLogIdentifier();
      uint64_t v20 = [a1[5] shortDescription];
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully created share for home %@", (uint8_t *)&v21, 0x16u);
    }
    [a1[6] fulfillWithValue:v10];
  }
}

- (id)_existingSharedHomesWithModelID:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[MKFCKSharedHome fetchRequest];
  v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"modelID", v6];
  [v7 setPredicate:v8];

  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v27[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v7 setAffectedStores:v10];

  id v11 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v12 = [v11 executeFetchRequest:v7 error:a4];

  if (*a4)
  {
    uint64_t v13 = 0;
  }
  else
  {
    if (objc_msgSend(v12, "hmf_isEmpty"))
    {
      id v14 = [MEMORY[0x263EFF8C0] array];
    }
    else
    {
      if ((unint64_t)[v12 count] >= 2)
      {
        uint64_t v15 = (void *)MEMORY[0x230FBD990]();
        char v16 = self;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          BOOL v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
          *(_DWORD *)buf = 138543874;
          uint64_t v22 = v18;
          __int16 v23 = 2112;
          v24 = v19;
          __int16 v25 = 2112;
          id v26 = v6;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Found multiple (%@) shared homes with modelID %@", buf, 0x20u);
        }
      }
      id v14 = v12;
    }
    uint64_t v13 = v14;
  }

  return v13;
}

- (id)_allExistingSharesForHomeWithModelID:(id)a3 error:(id *)a4
{
  id v6 = -[HMDHomeOwnerCloudShareManager _existingSharedHomesWithModelID:error:](self, "_existingSharedHomesWithModelID:error:", a3);
  id v7 = v6;
  if (*a4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v9 = [MEMORY[0x263EFF8C0] array];
  }
  else
  {
    id v10 = objc_msgSend(v7, "na_map:", &__block_literal_global_25_245395);
    id v11 = [(HMDCoreDataCloudShareService *)self->_shareService container];
    id v12 = [v11 fetchSharesMatchingObjectIDs:v10 error:a4];

    id v9 = [v12 allValues];
  }
  return v9;
}

uint64_t __76__HMDHomeOwnerCloudShareManager__allExistingSharesForHomeWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)_canonicalModelFromSharedHomes:(id)a3
{
  if (self) {
    self = (HMDHomeOwnerCloudShareManager *)self->_modelSelectionBlock;
  }
  return (id)((uint64_t (*)(HMDHomeOwnerCloudShareManager *, id))self->_cloudTransform)(self, a3);
}

- (id)_canonicalShareFromSharesToSharedHomes:(id)a3 shareMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (self) {
      id modelSelectionBlock = self->_modelSelectionBlock;
    }
    else {
      id modelSelectionBlock = 0;
    }
    id v9 = modelSelectionBlock;
    id v10 = [v6 allValues];
    id v11 = (*((void (**)(id, void *))modelSelectionBlock + 2))(v9, v10);

    id v12 = [v11 objectID];
    uint64_t v13 = [v7 objectForKeyedSubscript:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_existingShareForHomeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDHomeOwnerCloudShareManager *)self _existingSharedHomesWithModelID:v6 error:a4];
  BOOL v8 = v7;
  if (*a4 || (objc_msgSend(v7, "hmf_isEmpty") & 1) != 0)
  {
    id v9 = 0;
  }
  else
  {
    id v30 = v6;
    v34 = objc_opt_new();
    uint64_t v11 = objc_msgSend(v8, "na_map:", &__block_literal_global_23_245398);
    id v12 = [(HMDCoreDataCloudShareService *)self->_shareService container];
    id v28 = (void *)v11;
    uint64_t v13 = [v12 fetchSharesMatchingObjectIDs:v11 error:a4];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v29 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      v31 = self;
      id v32 = v14;
      v33 = v13;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          if (!*a4)
          {
            BOOL v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v20 = [v19 objectID];
            int v21 = [v13 objectForKeyedSubscript:v20];

            if (v21)
            {
              [v34 setObject:v19 forKeyedSubscript:v21];
            }
            else
            {
              uint64_t v22 = (void *)MEMORY[0x230FBD990]();
              __int16 v23 = self;
              v24 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                __int16 v25 = HMFGetLogIdentifier();
                id v26 = [v19 objectID];
                *(_DWORD *)buf = 138543618;
                long long v40 = v25;
                __int16 v41 = 2112;
                id v42 = v26;
                _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@No CKShare for objectID %@ in map", buf, 0x16u);

                self = v31;
              }

              id v14 = v32;
              uint64_t v13 = v33;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v16);
    }

    uint64_t v27 = (void *)[v34 copy];
    id v9 = [(HMDHomeOwnerCloudShareManager *)self _canonicalShareFromSharesToSharedHomes:v27 shareMap:v13];

    BOOL v8 = v29;
    id v6 = v30;
  }

  return v9;
}

uint64_t __72__HMDHomeOwnerCloudShareManager__existingShareForHomeWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)_shareForHome:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 uuid];
  id v11 = 0;
  id v6 = [(HMDHomeOwnerCloudShareManager *)self _existingShareForHomeWithModelID:v5 error:&v11];
  id v7 = v11;

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F42538] futureWithError:v7];
  }
  else
  {
    if (v6) {
      [MEMORY[0x263F42538] futureWithValue:v6];
    }
    else {
    uint64_t v8 = [(HMDHomeOwnerCloudShareManager *)self _createShareForHome:v4];
    }
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)_removeShare:(id)a3 usingShareService:(id)a4 forHomeWithUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v24 = 0;
  id v10 = (void *)MEMORY[0x263F42538];
  id v11 = a4;
  id v12 = [v10 futureWithPromise:&v24];
  uint64_t v13 = [v11 container];
  id v14 = [v8 recordID];
  uint64_t v15 = [v14 zoneID];
  uint64_t v16 = [v11 privateStore];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__HMDHomeOwnerCloudShareManager__removeShare_usingShareService_forHomeWithUUID___block_invoke;
  v20[3] = &unk_264A2BF90;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v24;
  id v17 = v9;
  id v18 = v8;
  [v13 purgeObjectsAndRecordsInZoneWithID:v15 inPersistentStore:v16 completion:v20];

  return v12;
}

void __80__HMDHomeOwnerCloudShareManager__removeShare_usingShareService_forHomeWithUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v17 = 138544130;
      id v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Removing share %@ for home %@ failed with %@", (uint8_t *)&v17, 0x2Au);
    }
    [*(id *)(a1 + 56) rejectWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      int v17 = 138543874;
      id v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed share %@ for home %@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(a1 + 56) fulfillWithNoValue];
  }
}

- (id)removeSharesForHome:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 isOwnerUser];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing shares for home: %@", buf, 0x16u);
    }
    uint64_t v12 = v7->_shareService;
    uint64_t v13 = (void *)MEMORY[0x263F42538];
    id v14 = [(HMDCoreDataCloudShareService *)v12 managedObjectContext];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke;
    v19[3] = &unk_264A2BEC8;
    v19[4] = v7;
    id v20 = v4;
    __int16 v21 = v12;
    uint64_t v15 = v12;
    uint64_t v16 = [v13 inContext:v14 perform:v19];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v17;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not removing the home as this is not owner user", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v16;
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke(id *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  v3 = [a1[5] uuid];
  id v43 = 0;
  id v28 = [v2 _allExistingSharesForHomeWithModelID:v3 error:&v43];
  v29 = (uint64_t (*)(uint64_t, uint64_t))v43;

  if (v29)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = a1[4];
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      id v46 = v29;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Fetching existing shares for home %@ failed with %@", buf, 0x20u);
    }
    id v9 = v29;
    uint64_t v10 = 2;
  }
  else if (v28 && (objc_msgSend(v28, "hmf_isEmpty") & 1) == 0)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v46 = __Block_byref_object_copy__245407;
    id v47 = __Block_byref_object_dispose__245408;
    id v48 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v28;
    uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    int v17 = 0;
    if (v16)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          if (v17)
          {
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 3221225472;
            v36[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_16;
            v36[3] = &unk_264A2BF18;
            v36[4] = a1[4];
            v36[5] = v20;
            id v37 = a1[6];
            id v38 = a1[5];
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2;
            v32[3] = &unk_264A2BF40;
            long long v35 = buf;
            v32[4] = a1[4];
            v32[5] = v20;
            id v33 = a1[6];
            id v34 = a1[5];
            uint64_t v21 = [v17 then:v36 orRecover:v32];

            int v17 = (void *)v21;
          }
          else
          {
            id v22 = a1[6];
            id v23 = a1[4];
            __int16 v24 = [a1[5] uuid];
            int v17 = [v23 _removeShare:v20 usingShareService:v22 forHomeWithUUID:v24];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v16);
    }

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3;
    v31[3] = &unk_264A2BF68;
    v31[4] = buf;
    id v25 = [v17 then:v31];
    if (!v25)
    {
      _HMFPreconditionFailure();
      __break(1u);
    }
    uint64_t v26 = v25;

    _Block_object_dispose(buf, 8);
    uint64_t v10 = 3;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1[4];
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@No share for home %@ to remove", buf, 0x16u);
    }
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 56) uuid];
  id v8 = [v4 _removeShare:v5 usingShareService:v6 forHomeWithUUID:v7];
  if (v8)
  {
    id v9 = v8;

    return 3;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2(v11);
  }
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 56) uuid];
  id v11 = [v7 _removeShare:v8 usingShareService:v9 forHomeWithUUID:v10];
  if (v11)
  {
    id v12 = v11;

    return 3;
  }
  else
  {
    uint64_t v14 = _HMFPreconditionFailure();
    return __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3(v14);
  }
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v1) {
    return 1;
  }
  id v2 = v1;
  return 2;
}

- (id)acceptShareInvitation:(id)a3
{
  return [(HMDCoreDataCloudShareService *)self->_shareService acceptShareInvitation:a3];
}

- (id)auditAccessForUsers:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 isOwnerUser];
  uint64_t v9 = (void *)MEMORY[0x263F42538];
  if (v8)
  {
    uint64_t v10 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke;
    v13[3] = &unk_264A2BEC8;
    id v14 = v7;
    id v15 = v6;
    uint64_t v16 = self;
    id v11 = [v9 inContext:v10 perform:v13];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    id v11 = [v9 futureWithError:v10];
  }

  return v11;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFF9C0];
  id v3 = [a1[4] users];
  uint64_t v4 = objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = a1[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v10 isOwner] & 1) == 0)
        {
          id v11 = [v10 accountHandle];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  id v12 = a1[6];
  uint64_t v13 = [a1[4] uuid];
  id v30 = 0;
  id v14 = [v12 _existingShareForHomeWithModelID:v13 error:&v30];
  id v15 = v30;

  if (v15 || !v14)
  {
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = a1[6];
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = [a1[4] shortDescription];
      *(_DWORD *)buf = 138543618;
      long long v36 = v25;
      __int16 v37 = 2112;
      id v38 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch share, cannot audit shared users for home %@", buf, 0x16u);
    }
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v16 = (void *)*((void *)a1[6] + 1);
    int v17 = [v4 allObjects];
    uint64_t v18 = [v16 auditUsersForRevokedAccessWithAccountHandles:v17 share:v14];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke_14;
    v28[3] = &unk_264A2BEF0;
    id v29 = a1[5];
    id v19 = [v18 then:v28];
    if (!v19) {
      _HMFPreconditionFailure();
    }
    uint64_t v20 = v19;
    uint64_t v21 = 3;
  }
  return v21;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "accountHandle", (void)v14);
        int v12 = [v3 containsObject:v11];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 allObjects];
  objc_claimAutoreleasedReturnValue();

  return 1;
}

- (id)revokeAccessForUser:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 isOwnerUser];
  uint64_t v9 = (void *)MEMORY[0x263F42538];
  if (v8)
  {
    uint64_t v10 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__HMDHomeOwnerCloudShareManager_revokeAccessForUser_home___block_invoke;
    v14[3] = &unk_264A2BEC8;
    v14[4] = self;
    id v15 = v7;
    id v16 = v6;
    id v11 = [v9 inContext:v10 perform:v14];
  }
  else
  {
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    id v11 = [v9 futureWithError:v12];
  }
  return v11;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_revokeAccessForUser_home___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  id v3 = [a1[5] uuid];
  id v37 = 0;
  uint64_t v4 = [v2 _allExistingSharesForHomeWithModelID:v3 error:&v37];
  id v5 = v37;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    char v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v9;
      __int16 v41 = 2112;
      long long v42 = v10;
      __int16 v43 = 2112;
      id v44 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Fetching existing share for home %@ failed with %@", buf, 0x20u);
    }
    id v11 = v5;
    uint64_t v12 = 2;
  }
  else if (v4 && (objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v32 = v4;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v25 = (void *)*((void *)a1[4] + 1);
          uint64_t v26 = [a1[6] accountHandle];
          uint64_t v27 = [v25 revokeAccessForUserWithAccountHandle:v26 share:v24];
          [v18 addObject:v27];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v21);
    }

    id v28 = [MEMORY[0x263F42538] all:v18];
    id v29 = [v28 ignoreResult];
    if (!v29) {
      _HMFPreconditionFailure();
    }
    id v30 = v29;
    uint64_t v12 = 3;

    uint64_t v4 = v32;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1[4];
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      long long v17 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v16;
      __int16 v41 = 2112;
      long long v42 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Nothing to do, no existing share for home %@", buf, 0x16u);
    }
    uint64_t v12 = 1;
  }

  return v12;
}

- (id)grantAccessForUser:(id)a3 home:(id)a4 logEventBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isOwnerUser])
  {
    id v11 = (void *)MEMORY[0x263F42538];
    uint64_t v12 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__HMDHomeOwnerCloudShareManager_grantAccessForUser_home_logEventBuilder___block_invoke;
    v15[3] = &unk_264A2BEA0;
    id v16 = v10;
    long long v17 = self;
    id v18 = v9;
    id v19 = v8;
    uint64_t v13 = [v11 inContext:v12 perform:v15];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    [v10 markError:v12];
    uint64_t v13 = [MEMORY[0x263F42538] futureWithError:v12];
  }

  return v13;
}

HMDHomeOwnerCloudShareManager *__73__HMDHomeOwnerCloudShareManager_grantAccessForUser_home_logEventBuilder___block_invoke(id *a1)
{
  [a1[4] markCreateShareBegin];
  id v2 = [a1[5] _shareForHome:a1[6]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HMDHomeOwnerCloudShareManager_grantAccessForUser_home_logEventBuilder___block_invoke_2;
  v10[3] = &unk_264A2BE78;
  id v11 = a1[4];
  id v3 = a1[6];
  id v4 = a1[5];
  id v12 = v3;
  id v13 = v4;
  id v14 = a1[7];
  id v5 = [v2 then:v10];
  if (v5)
  {
    id v6 = v5;

    return (HMDHomeOwnerCloudShareManager *)3;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return __73__HMDHomeOwnerCloudShareManager_grantAccessForUser_home_logEventBuilder___block_invoke_2(v8, v9);
  }
}

HMDHomeOwnerCloudShareManager *__73__HMDHomeOwnerCloudShareManager_grantAccessForUser_home_logEventBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) markCreateShareEnd];
  id v4 = +[HMDCoreData sharedInstance];
  id v5 = +[MKFCKSharedHome entity];
  id v6 = [*(id *)(a1 + 40) uuid];
  [v4 applyVoucherForModel:v5 withModelID:v6 eventType:2 storeType:0];

  id v7 = *(void **)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = [*(id *)(a1 + 56) accountHandle];
  id v9 = [v7 grantAccessForUserWithAccountHandle:v8 share:v3 logEventBuilder:*(void *)(a1 + 32)];
  if (v9)
  {
    id v10 = v9;

    return (HMDHomeOwnerCloudShareManager *)3;
  }
  else
  {
    id v12 = (HMDHomeOwnerCloudShareManager *)_HMFPreconditionFailure();
    return [(HMDHomeOwnerCloudShareManager *)v12 initWithContainer:v14 sharedStore:v15 privateStore:v16 moc:v17 cloudTransform:v18 homeManager:v19];
  }
}

- (HMDHomeOwnerCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6 cloudTransform:(id)a7 homeManager:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [[HMDCoreDataCloudShareService alloc] initWithContainer:v19 sharedStore:v18 privateStore:v17 moc:v16];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__HMDHomeOwnerCloudShareManager_initWithContainer_sharedStore_privateStore_moc_cloudTransform_homeManager___block_invoke;
  aBlock[3] = &unk_264A2BE50;
  uint64_t v26 = v20;
  uint64_t v21 = v20;
  uint64_t v22 = _Block_copy(aBlock);
  id v23 = [(HMDHomeOwnerCloudShareManager *)self initWithShareService:v21 homeManager:v14 cloudTransform:v15 modelSelectionBlock:v22];

  return v23;
}

id __107__HMDHomeOwnerCloudShareManager_initWithContainer_sharedStore_privateStore_moc_cloudTransform_homeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  id v5 = +[MKFCKModel canonicalModelForModels:v3 context:v4];

  return v5;
}

- (HMDHomeOwnerCloudShareManager)initWithShareService:(id)a3 homeManager:(id)a4 cloudTransform:(id)a5 modelSelectionBlock:(id)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeOwnerCloudShareManager;
  id v15 = [(HMDHomeOwnerCloudShareManager *)&v22 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shareService, a3);
    objc_storeStrong((id *)&v16->_cloudTransform, a5);
    objc_storeWeak((id *)&v16->_homeManager, v12);
    id v17 = _Block_copy(v14);
    id modelSelectionBlock = v16->_modelSelectionBlock;
    v16->_id modelSelectionBlock = v17;

    id v19 = +[MKFCKSharedUserDataRoot entity];
    v23[0] = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [v13 registerCloudChangeListener:v16 forEntities:v20];
  }
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_245433 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_245433, &__block_literal_global_245434);
  }
  id v2 = (void *)logCategory__hmf_once_v1_245435;
  return v2;
}

void __44__HMDHomeOwnerCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_245435;
  logCategory__hmf_once_v1_245435 = v0;
}

@end