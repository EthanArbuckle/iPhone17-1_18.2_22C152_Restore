@interface HMDCloudGroup
+ (id)logCategory;
+ (id)shortDescription;
+ (void)createGroupWithRootRecordName:(id)a3 owner:(id)a4 subscriptionName:(id)a5 cloudZone:(id)a6 completion:(id)a7;
- (BOOL)doRecordsExistInCache;
- (BOOL)isRootRecord:(id)a3;
- (BOOL)isRootRecordName:(id)a3;
- (CKRecordID)privateZoneRootRecordID;
- (HMDBackingStoreCacheGroup)backingStoreGroup;
- (HMDCloudCache)cache;
- (HMDCloudGroup)init;
- (HMDCloudGroup)initWithBackingStoreCacheGroup:(id)a3 cloudZone:(id)a4;
- (HMDCloudRecord)rootRecord;
- (HMDCloudZone)cloudZone;
- (NSMutableDictionary)objectIDToRecordNameMap;
- (NSString)description;
- (NSString)rootRecordName;
- (NSUUID)identifier;
- (NSUUID)ownerID;
- (NSUUID)parentIdentifier;
- (NSUUID)rootRecordObjectID;
- (id)__cloudRecordWithObjectID:(id)a3;
- (id)cloudRecordWithName:(id)a3;
- (id)cloudRecordWithObjectID:(id)a3;
- (id)logIdentifier;
- (id)rootRecordModelObject;
- (id)shortDescription;
- (void)_cloudRecordsForParentIDs:(id)a3 recursive:(BOOL)a4 completionHandler:(id)a5;
- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4;
- (void)deleteCloudRecord:(id)a3;
- (void)deleteCloudRecordNames:(id)a3;
- (void)fetchCloudRecordMap:(id)a3;
- (void)rootRecordCompletionHandler:(id)a3;
- (void)setBackingStoreGroup:(id)a3;
- (void)setCache:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)updateCloudRecord:(id)a3;
- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDCloudGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDToRecordNameMap, 0);
  objc_storeStrong((id *)&self->_backingStoreGroup, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_destroyWeak((id *)&self->_cache);
}

- (NSMutableDictionary)objectIDToRecordNameMap
{
  return self->_objectIDToRecordNameMap;
}

- (void)setBackingStoreGroup:(id)a3
{
}

- (HMDBackingStoreCacheGroup)backingStoreGroup
{
  return self->_backingStoreGroup;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)ownerID
{
  return self->_ownerID;
}

- (void)setCloudZone:(id)a3
{
}

- (HMDCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMDCloudZone *)WeakRetained;
}

- (void)setCache:(id)a3
{
}

- (HMDCloudCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  return (HMDCloudCache *)WeakRetained;
}

- (void)deleteCloudRecord:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [a3 recordName];
    v6[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(HMDCloudGroup *)self deleteCloudRecordNames:v5];
  }
}

- (void)deleteCloudRecordNames:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    objc_initWeak(&location, self);
    v6 = [HMDBackingStoreCacheDeleteRecordOperation alloc];
    v7 = [(HMDCloudGroup *)self backingStoreGroup];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__HMDCloudGroup_deleteCloudRecordNames___block_invoke;
    v21[3] = &unk_1E6A17758;
    objc_copyWeak(&v23, &location);
    id v8 = v5;
    id v22 = v8;
    v9 = [(HMDBackingStoreCacheDeleteRecordOperation *)v6 initWithGroup:v7 recordNames:v8 resultBlock:v21];

    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = [(HMDCloudGroup *)v11 backingStoreGroup];
      *(_DWORD *)buf = 138543874;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Deleting cloud record names %@ in group %@", buf, 0x20u);
    }
    v15 = [(HMDCloudGroup *)v11 cache];
    v16 = [v15 backingStore];
    [v16 submit:v9];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Record names where not specified", buf, 0xCu);
    }
  }
}

void __40__HMDCloudGroup_deleteCloudRecordNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(v5, "isRootRecordName:", *(void *)(*((void *)&v18 + 1) + 8 * v10), (void)v18))
          {
            v11 = [v5 cloudZone];
            [v11 setRecordsAvailable:0];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v8);
    }

    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v5;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = [v13 backingStoreGroup];
      *(_DWORD *)buf = 138544130;
      id v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      __int16 v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Completed deleting cloud record names %@ in group %@ with error %@", buf, 0x2Au);
    }
  }
}

- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [HMDBackingStoreCacheUpdateRecordOperation alloc];
    uint64_t v9 = [(HMDCloudGroup *)self backingStoreGroup];
    uint64_t v10 = [v6 record];
    v11 = [v6 cachedData];
    uint64_t v12 = [v6 objectEncoding];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__HMDCloudGroup_updateCloudRecord_completionHandler___block_invoke;
    v24[3] = &unk_1E6A18500;
    objc_copyWeak(&v27, &location);
    id v13 = v6;
    id v25 = v13;
    id v26 = v7;
    v14 = [(HMDBackingStoreCacheUpdateRecordOperation *)v8 initWithGroup:v9 record:v10 data:v11 encoding:v12 resultBlock:v24];

    v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      long long v19 = [v13 objectID];
      id v20 = [v19 UUIDString];
      long long v21 = [v13 recordName];
      *(_DWORD *)buf = 138543874;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v20;
      __int16 v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Caching cloud record %@/%@", buf, 0x20u);
    }
    id v22 = [(HMDCloudGroup *)v16 cache];
    id v23 = [v22 backingStore];
    [v23 submit:v14];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __53__HMDCloudGroup_updateCloudRecord_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = WeakRetained;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        uint64_t v9 = [v6 backingStoreGroup];
        int v19 = 138543874;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v3;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to cache cloud record in group %@ with error %@", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) recordName];
      int v11 = [WeakRetained isRootRecordName:v10];

      if (v11)
      {
        uint64_t v12 = [WeakRetained cloudZone];
        [v12 setRecordsAvailable:1];
      }
      v5 = (void *)MEMORY[0x1D9452090]();
      id v13 = WeakRetained;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [*(id *)(a1 + 32) objectID];
        uint64_t v16 = [v15 UUIDString];
        v17 = [*(id *)(a1 + 32) recordName];
        int v19 = 138544130;
        id v20 = v14;
        __int16 v21 = 2112;
        id v22 = v16;
        __int16 v23 = 2112;
        id v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = 0;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Completed caching cloud record %@/%@ with error %@", (uint8_t *)&v19, 0x2Au);
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v3);
  }
}

- (void)updateCloudRecord:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    objc_initWeak(&location, self);
    id v6 = [HMDBackingStoreCacheUpdateRecordOperation alloc];
    id v7 = [(HMDCloudGroup *)self backingStoreGroup];
    uint64_t v8 = [v4 record];
    uint64_t v9 = [v4 cachedData];
    uint64_t v10 = [v4 objectEncoding];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    __int16 v28 = __35__HMDCloudGroup_updateCloudRecord___block_invoke;
    uint64_t v29 = &unk_1E6A15888;
    objc_copyWeak(&v32, &location);
    id v11 = v4;
    id v30 = v11;
    uint64_t v12 = v5;
    __int16 v31 = v12;
    id v13 = [(HMDBackingStoreCacheUpdateRecordOperation *)v6 initWithGroup:v7 record:v8 data:v9 encoding:v10 resultBlock:&v26];

    uint64_t v18 = (void *)MEMORY[0x1D9452090](v14, v15, v16, v17);
    int v19 = self;
    HMFGetOSLogHandle();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = objc_msgSend(v11, "recordName", v26, v27, v28, v29, v30);
      __int16 v23 = [(HMDCloudGroup *)v19 backingStoreGroup];
      *(_DWORD *)buf = 138543874;
      id v35 = v21;
      __int16 v36 = 2112;
      v37 = v22;
      __int16 v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Caching cloud record %@ in group %@", buf, 0x20u);
    }
    id v24 = [(HMDCloudGroup *)v19 cache];
    __int16 v25 = [v24 backingStore];
    [v25 submit:v13];

    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __35__HMDCloudGroup_updateCloudRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = WeakRetained;
      id v7 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [v6 backingStoreGroup];
      int v17 = 138543874;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      uint64_t v10 = "%{public}@Failed to cache cloud record in group %@ with error %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) recordName];
      int v14 = [WeakRetained isRootRecordName:v13];

      if (v14)
      {
        uint64_t v15 = [WeakRetained cloudZone];
        [v15 setRecordsAvailable:1];
      }
      v5 = (void *)MEMORY[0x1D9452090]();
      id v16 = WeakRetained;
      id v7 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [v16 backingStoreGroup];
      int v17 = 138543874;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = 0;
      uint64_t v10 = "%{public}@Completed caching cloud record in group %@ with error %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v17, 0x20u);

    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)__cloudRecordWithObjectID:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDCloudGroup *)self cache];
    id v6 = [v5 backingStore];
    id v7 = [(HMDCloudGroup *)self backingStoreGroup];
    v26[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v19 = 0;
    uint64_t v9 = objc_msgSend(v6, "__fetchWithGroup:uuids:error:", v7, v8, &v19);
    id v10 = v19;

    id v11 = 0;
    if (!v10)
    {
      if ([v9 count])
      {
        os_log_type_t v12 = [v9 firstObject];
        if (v12)
        {
          id v13 = [(HMDCloudGroup *)self cloudZone];
          id v11 = [v13 createCloudRecordWithFetchResult:v12];
        }
        else
        {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
    }
    int v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for ID %@ with error %@", buf, 0x20u);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)cloudRecordWithObjectID:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__58284;
  __int16 v38 = __Block_byref_object_dispose__58285;
  id v39 = 0;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = [HMDBackingStoreCacheFetchRecords alloc];
    id v7 = [(HMDCloudGroup *)self backingStoreGroup];
    v44[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    __int16 v28 = __41__HMDCloudGroup_cloudRecordWithObjectID___block_invoke;
    uint64_t v29 = &unk_1E6A0C410;
    __int16 v33 = &v34;
    id v30 = self;
    id v9 = v4;
    id v31 = v9;
    id v10 = v5;
    id v32 = v10;
    id v11 = [(HMDBackingStoreCacheFetchRecords *)v6 initWithGroup:v7 uuids:v8 fetchResult:&v26];

    int v17 = (void *)MEMORY[0x1D9452090](v12, v13, v14, v15, v16);
    uint64_t v18 = self;
    HMFGetOSLogHandle();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud record for ID %@", buf, 0x16u);
    }
    __int16 v21 = [(HMDCloudGroup *)v18 cache];
    __int16 v22 = [v21 backingStore];
    [v22 submit:v11];

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    id v23 = (void *)v35[5];
  }
  else
  {
    id v23 = 0;
  }
  id v24 = v23;
  _Block_object_dispose(&v34, 8);

  return v24;
}

void __41__HMDCloudGroup_cloudRecordWithObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if ([v5 count])
    {
      id v7 = [v5 firstObject];
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) cloudZone];
        uint64_t v9 = [v8 createCloudRecordWithFetchResult:v7];
        uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138543874;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for ID %@ with error %@", (uint8_t *)&v17, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)cloudRecordWithName:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__58284;
  __int16 v38 = __Block_byref_object_dispose__58285;
  id v39 = 0;
  if (v4)
  {
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = [HMDBackingStoreCacheFetchRecords alloc];
    id v7 = [(HMDCloudGroup *)self backingStoreGroup];
    v44[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    __int16 v28 = __37__HMDCloudGroup_cloudRecordWithName___block_invoke;
    uint64_t v29 = &unk_1E6A0C410;
    __int16 v33 = &v34;
    id v30 = self;
    id v9 = v4;
    id v31 = v9;
    uint64_t v10 = v5;
    id v32 = v10;
    id v11 = [(HMDBackingStoreCacheFetchRecords *)v6 initWithGroup:v7 records:v8 fetchResult:&v26];

    int v17 = (void *)MEMORY[0x1D9452090](v12, v13, v14, v15, v16);
    uint64_t v18 = self;
    HMFGetOSLogHandle();
    __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud record for %@", buf, 0x16u);
    }
    __int16 v21 = [(HMDCloudGroup *)v18 cache];
    uint64_t v22 = [v21 backingStore];
    [v22 submit:v11];

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = (void *)v35[5];
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = v23;
  _Block_object_dispose(&v34, 8);

  return v24;
}

void __37__HMDCloudGroup_cloudRecordWithName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if ([v5 count])
    {
      id v7 = [v5 firstObject];
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) cloudZone];
        uint64_t v9 = [v8 createCloudRecordWithFetchResult:v7];
        uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138543874;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for %@ with error %@", (uint8_t *)&v17, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)doRecordsExistInCache
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_doRecordsExistInCache) {
    return 1;
  }
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = [HMDBackingStoreCacheFetchGroupInformation alloc];
  id v6 = [(HMDCloudGroup *)self backingStoreGroup];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__HMDCloudGroup_doRecordsExistInCache__block_invoke;
  v16[3] = &unk_1E6A0C3E8;
  __int16 v19 = &v20;
  id v7 = v4;
  int v17 = v7;
  uint64_t v18 = self;
  uint64_t v8 = [(HMDBackingStoreCacheFetchGroupInformation *)v5 initWithGroup:v6 fetchResult:v16];

  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  HMFGetOSLogHandle();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v25 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud group information", buf, 0xCu);
  }
  id v13 = [(HMDCloudGroup *)v10 cache];
  uint64_t v14 = [v13 backingStore];
  [v14 submit:v8];

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v2 = *((unsigned char *)v21 + 24) != 0;
  self->_doRecordsExistInCache = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v2;
}

void __38__HMDCloudGroup_doRecordsExistInCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 >= 1 && !v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud group information with error %@", (uint8_t *)&v11, 0x16u);
  }
}

- (HMDCloudRecord)rootRecord
{
  id v3 = [(HMDCloudGroup *)self rootRecordName];
  id v4 = [(HMDCloudGroup *)self cloudRecordWithName:v3];

  if (!v4)
  {
    id v5 = [HMDCloudRecord alloc];
    id v6 = [(HMDCloudGroup *)self rootRecordObjectID];
    id v7 = [(HMDCloudGroup *)self rootRecordName];
    id v8 = [(HMDCloudGroup *)self cloudZone];
    id v4 = [(HMDCloudRecord *)v5 initWithObjectID:v6 recordName:v7 cloudZone:v8];
  }
  return v4;
}

- (void)rootRecordCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudGroup *)self rootRecordName];
  [(HMDCloudGroup *)self cloudRecordWithName:v5 completionHandler:v4];
}

- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v10 = a3;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    uint64_t v9 = [v7 arrayWithObjects:&v10 count:1];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  -[HMDCloudGroup _cloudRecordsForParentIDs:recursive:completionHandler:](self, "_cloudRecordsForParentIDs:recursive:completionHandler:", v9, 1, v6, v10, v11);
}

- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v10 = a3;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    uint64_t v9 = [v7 arrayWithObjects:&v10 count:1];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  -[HMDCloudGroup _cloudRecordsForParentIDs:recursive:completionHandler:](self, "_cloudRecordsForParentIDs:recursive:completionHandler:", v9, 0, v6, v10, v11);
}

- (void)_cloudRecordsForParentIDs:(id)a3 recursive:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8 && [v8 count])
    {
      objc_initWeak(&location, self);
      id v10 = [HMDBackingStoreCacheFetchRecords alloc];
      uint64_t v11 = [(HMDCloudGroup *)self backingStoreGroup];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __71__HMDCloudGroup__cloudRecordsForParentIDs_recursive_completionHandler___block_invoke;
      uint64_t v27 = &unk_1E6A0F760;
      objc_copyWeak(&v30, &location);
      id v12 = v8;
      id v28 = v12;
      id v29 = v9;
      __int16 v13 = [(HMDBackingStoreCacheFetchRecords *)v10 initWithGroup:v11 parentUuids:v12 fetchResult:&v24];

      uint64_t v14 = (void *)MEMORY[0x1D9452090](-[HMDBackingStoreCacheFetchRecords setRecursive:](v13, "setRecursive:", v6, v24, v25, v26, v27));
      uint64_t v15 = self;
      HMFGetOSLogHandle();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v33 = v17;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Fetching child cloud records for parents %@", buf, 0x16u);
      }
      uint64_t v18 = [(HMDCloudGroup *)v15 cache];
      __int16 v19 = [v18 backingStore];
      [v19 submit:v13];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v33 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@cloudRecordsForParentID called without completionHandler", buf, 0xCu);
    }
  }
}

void __71__HMDCloudGroup__cloudRecordsForParentIDs_recursive_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  id v9 = 0;
  if (!v6 && WeakRetained)
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
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
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
          uint64_t v16 = [v8 cloudZone];
          int v17 = [v16 createCloudRecordWithFetchResult:v15];

          if (v17) {
            [v9 addObject:v17];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v12);
    }

    id v5 = v23;
  }
  uint64_t v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = v8;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = HMFGetLogIdentifier();
    uint64_t v22 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v22;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching child cloud records for parents %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v13[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__HMDCloudGroup_cloudRecordWithObjectID_completionHandler___block_invoke;
    v10[3] = &unk_1E6A0C3C0;
    id v11 = v6;
    id v12 = v8;
    [(HMDCloudGroup *)self cloudRecordWithObjectIDs:v9 completionHandler:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __59__HMDCloudGroup_cloudRecordWithObjectID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  if ([v9 count])
  {
    id v7 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v6);
  }
}

- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [HMDBackingStoreCacheFetchRecords alloc];
    id v9 = [(HMDCloudGroup *)self backingStoreGroup];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __60__HMDCloudGroup_cloudRecordWithObjectIDs_completionHandler___block_invoke;
    long long v24 = &unk_1E6A0F760;
    objc_copyWeak(&v27, &location);
    id v26 = v7;
    id v25 = v6;
    id v10 = [(HMDBackingStoreCacheFetchRecords *)v8 initWithGroup:v9 uuids:v25 fetchResult:&v21];

    uint64_t v15 = (void *)MEMORY[0x1D9452090](v11, v12, v13, v14);
    uint64_t v16 = self;
    HMFGetOSLogHandle();
    int v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v30 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud records from cache", buf, 0xCu);
    }
    id v19 = [(HMDCloudGroup *)v16 cache];
    uint64_t v20 = [v19 backingStore];
    [v20 submit:v10];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CBF0], 0);
  }
}

void __60__HMDCloudGroup_cloudRecordWithObjectIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a1 + 32)];
    id v10 = (void *)v9;
    if (!v6)
    {
      id v28 = (void *)v9;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v29 = v5;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            int v17 = (void *)MEMORY[0x1D9452090]();
            uint64_t v18 = [WeakRetained cloudZone];
            id v19 = [v18 createCloudRecordWithFetchResult:v16];

            if (v19)
            {
              uint64_t v20 = [v19 objectID];
              [v8 setObject:v19 forKeyedSubscript:v20];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v13);
      }

      uint64_t v21 = [v8 allKeys];
      id v10 = v28;
      [v28 removeObjectsInArray:v21];

      id v6 = 0;
      id v5 = v29;
    }
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = WeakRetained;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v25;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching cloud records from cache with error %@", buf, 0x16u);
    }
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26) {
      (*(void (**)(uint64_t, void *, void *, id))(v26 + 16))(v26, v8, v10, v6);
    }
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
    (*(void (**)(uint64_t, void, void, void *))(v27 + 16))(v27, 0, 0, v8);
  }
}

- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    v13[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__HMDCloudGroup_cloudRecordWithName_completionHandler___block_invoke;
    v10[3] = &unk_1E6A0C3C0;
    id v11 = v6;
    id v12 = v8;
    [(HMDCloudGroup *)self cloudRecordWithNames:v9 completionHandler:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __55__HMDCloudGroup_cloudRecordWithName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  if ([v9 count])
  {
    id v7 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v6);
  }
}

- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [HMDBackingStoreCacheFetchRecords alloc];
    id v9 = [(HMDCloudGroup *)self backingStoreGroup];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __56__HMDCloudGroup_cloudRecordWithNames_completionHandler___block_invoke;
    long long v24 = &unk_1E6A0F760;
    objc_copyWeak(&v27, &location);
    id v26 = v7;
    id v25 = v6;
    id v10 = [(HMDBackingStoreCacheFetchRecords *)v8 initWithGroup:v9 records:v25 fetchResult:&v21];

    uint64_t v15 = (void *)MEMORY[0x1D9452090](v11, v12, v13, v14);
    uint64_t v16 = self;
    HMFGetOSLogHandle();
    int v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v30 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud records from cache", buf, 0xCu);
    }
    id v19 = [(HMDCloudGroup *)v16 cache];
    uint64_t v20 = [v19 backingStore];
    [v20 submit:v10];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CBF0], 0);
  }
}

void __56__HMDCloudGroup_cloudRecordWithNames_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    if (!v6)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v26 = v5;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v15 = [WeakRetained cloudZone];
            uint64_t v16 = [v15 createCloudRecordWithFetchResult:v14];

            if (v16)
            {
              int v17 = [v16 recordName];
              [v8 setObject:v16 forKeyedSubscript:v17];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v11);
      }

      id v5 = v26;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a1 + 32)];
    id v19 = [v8 allKeys];
    [v18 removeObjectsInArray:v19];

    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = WeakRetained;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v32 = v23;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching cloud records from cache with error %@", buf, 0x16u);
    }
    uint64_t v24 = *(void *)(a1 + 40);
    if (v24) {
      (*(void (**)(uint64_t, void *, void *, id))(v24 + 16))(v24, v8, v18, v6);
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
    (*(void (**)(uint64_t, void, void, void *))(v25 + 16))(v25, 0, 0, v8);
  }
}

- (void)fetchCloudRecordMap:(id)a3
{
  id v4 = a3;
  id v5 = [HMDBackingStoreCacheFetchRecordMappings alloc];
  id v6 = [(HMDCloudGroup *)self backingStoreGroup];
  id v9 = [(HMDBackingStoreCacheFetchRecordMappings *)v5 initWithGroup:v6 fetchResult:v4];

  id v7 = [(HMDCloudGroup *)self cache];
  uint64_t v8 = [v7 backingStore];
  [v8 submit:v9];
}

- (BOOL)isRootRecord:(id)a3
{
  id v4 = [a3 recordID];
  id v5 = [v4 recordName];
  LOBYTE(self) = [(HMDCloudGroup *)self isRootRecordName:v5];

  return (char)self;
}

- (BOOL)isRootRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudGroup *)self rootRecordName];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (CKRecordID)privateZoneRootRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v4 = [(HMDCloudGroup *)self rootRecordName];
  id v5 = [(HMDCloudGroup *)self cloudZone];
  char v6 = [v5 zone];
  id v7 = [v6 zoneID];
  uint64_t v8 = (void *)[v3 initWithRecordName:v4 zoneID:v7];

  return (CKRecordID *)v8;
}

- (id)rootRecordModelObject
{
  id v3 = [HMDCloudGroupRootRecordModelObject alloc];
  id v4 = [(HMDCloudGroup *)self rootRecordObjectID];
  id v5 = [(HMDCloudGroup *)self parentIdentifier];
  char v6 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:1 uuid:v4 parentUUID:v5];

  return v6;
}

- (NSUUID)rootRecordObjectID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(HMDCloudGroup *)self rootRecordName];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  if (!v5)
  {
    char v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Root record objectID cannot be determined, generating a random", buf, 0xCu);
    }
    id v5 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v10 = [(HMDCloudGroup *)self cloudZone];
  uint64_t v11 = [v10 zone];
  uint64_t v12 = [v11 zoneID];
  uint64_t v13 = [v12 zoneName];

  uint64_t v14 = (void *)MEMORY[0x1E4F29128];
  uint64_t v18 = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v16 = objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, 0, v15);

  return (NSUUID *)v16;
}

- (NSUUID)parentIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(HMDCloudGroup *)self cloudZone];
  id v5 = [v4 zone];
  char v6 = [v5 zoneID];
  id v7 = [v6 zoneName];
  uint64_t v8 = (void *)[v3 initWithUUIDString:v7];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  }
  return (NSUUID *)v8;
}

- (NSString)rootRecordName
{
  BOOL v2 = [(HMDCloudGroup *)self backingStoreGroup];
  id v3 = [v2 rootRecordName];

  return (NSString *)v3;
}

- (id)logIdentifier
{
  BOOL v2 = [(HMDCloudGroup *)self rootRecordName];
  id v3 = v2;
  if (!v2) {
    BOOL v2 = @"UnknownRoot";
  }
  id v4 = v2;

  return v4;
}

- (NSString)description
{
  BOOL v2 = NSString;
  id v3 = [(HMDCloudGroup *)self shortDescription];
  id v4 = [v2 stringWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDCloudGroup *)self rootRecordName];
  char v6 = [v3 stringWithFormat:@"%@ Root Record = %@", v4, v5];

  return v6;
}

- (HMDCloudGroup)initWithBackingStoreCacheGroup:(id)a3 cloudZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudGroup;
  id v9 = [(HMDCloudGroup *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreGroup, a3);
    objc_storeWeak((id *)&v10->_cloudZone, v8);
    uint64_t v11 = [v8 cache];
    objc_storeWeak((id *)&v10->_cache, v11);
  }
  return v10;
}

- (HMDCloudGroup)init
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  char v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_58333 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_58333, &__block_literal_global_33_58334);
  }
  BOOL v2 = (void *)logCategory__hmf_once_v2_58335;
  return v2;
}

uint64_t __28__HMDCloudGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_58335;
  logCategory__hmf_once_v2_58335 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  BOOL v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (void)createGroupWithRootRecordName:(id)a3 owner:(id)a4 subscriptionName:(id)a5 cloudZone:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  int v17 = [HMDBackingStoreCacheCreateGroupOperation alloc];
  uint64_t v18 = [v13 backingStoreZone];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  long long v27 = __91__HMDCloudGroup_createGroupWithRootRecordName_owner_subscriptionName_cloudZone_completion___block_invoke;
  long long v28 = &unk_1E6A0C398;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = a1;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  uint64_t v22 = [(HMDBackingStoreCacheCreateGroupOperation *)v17 initWithZone:v18 owner:v16 rootRecord:v21 subscriptionName:v15 subscription:0 creationBlock:&v25];

  id v23 = objc_msgSend(v20, "cache", v25, v26, v27, v28);
  uint64_t v24 = [v23 backingStore];
  [v24 submit:v22];
}

void __91__HMDCloudGroup_createGroupWithRootRecordName_owner_subscriptionName_cloudZone_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 56);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create group %@ with error %@", (uint8_t *)&v14, 0x20u);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackingStoreCacheGroup:v5 cloudZone:*(void *)(a1 + 40)];
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v12, v6);
  }
}

@end