@interface HMDCloudCache
- (BOOL)homeZoneExists:(id)a3;
- (CKServerChangeToken)databaseServerChangeToken;
- (HMDBackingStore)backingStore;
- (HMDCloudCache)init;
- (HMDCloudCache)initWithBackingStore:(id)a3 workQueue:(id)a4;
- (HMDCloudHomeManagerZone)homeManagerZone;
- (HMDCloudLegacyZone)legacyZone;
- (HMDCloudMetadataZone)metadataZone;
- (HMDCloudZone)homeDataInformation;
- (NSMutableDictionary)homeZones;
- (OS_dispatch_queue)workQueue;
- (id)_findStoreCacheZone:(id)a3 byName:(id)a4;
- (id)allHomeZones;
- (id)homeZoneWithName:(id)a3;
- (void)_createZones:(id)a3 completion:(id)a4;
- (void)createAndFetchZonesFromBackingStore:(id)a3;
- (void)deleteAllZones;
- (void)deleteHomeZoneWithName:(id)a3;
- (void)homeZoneWithName:(id)a3 owner:(id)a4 completion:(id)a5;
- (void)persistDatabaseServerChangeToken;
- (void)setBackingStore:(id)a3;
- (void)setDatabaseServerChangeToken:(id)a3;
- (void)setHomeDataInformation:(id)a3;
- (void)setHomeManagerZone:(id)a3;
- (void)setHomeZones:(id)a3;
- (void)setLegacyZone:(id)a3;
- (void)setMetadataZone:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDCloudCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_homeZones, 0);
  objc_storeStrong((id *)&self->_homeManagerZone, 0);
  objc_storeStrong((id *)&self->_metadataZone, 0);
  objc_storeStrong((id *)&self->_legacyZone, 0);
  objc_storeStrong((id *)&self->_homeDataInformation, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setBackingStore:(id)a3
{
}

- (HMDBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);
  return (HMDBackingStore *)WeakRetained;
}

- (void)setHomeZones:(id)a3
{
}

- (NSMutableDictionary)homeZones
{
  return self->_homeZones;
}

- (void)persistDatabaseServerChangeToken
{
  id v2 = [(HMDCloudCache *)self homeDataInformation];
  [v2 updateCurrentServerChangeToken];
}

- (void)setDatabaseServerChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudCache *)self homeDataInformation];
  [v5 setServerChangeToken:v4];
}

- (CKServerChangeToken)databaseServerChangeToken
{
  id v2 = [(HMDCloudCache *)self homeDataInformation];
  v3 = [v2 serverChangeToken];

  return (CKServerChangeToken *)v3;
}

- (void)deleteHomeZoneWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v6 = [(HMDCloudCache *)self homeZones];
    v7 = [v6 objectForKeyedSubscript:v4];

    v8 = [(HMDCloudCache *)self homeZones];
    [v8 setObject:0 forKeyedSubscript:v4];

    [v7 deleteZone];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Must specify zone name when deleting zone", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)deleteAllZones
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudCache *)self homeDataInformation];

  if (v3)
  {
    id v4 = [(HMDCloudCache *)self homeDataInformation];
    [v4 deleteZone];

    [(HMDCloudCache *)self setHomeDataInformation:0];
  }
  id v5 = [(HMDCloudCache *)self legacyZone];

  if (v5)
  {
    v6 = [(HMDCloudCache *)self legacyZone];
    [v6 deleteZone];

    [(HMDCloudCache *)self setLegacyZone:0];
  }
  v7 = [(HMDCloudCache *)self metadataZone];

  if (v7)
  {
    v8 = [(HMDCloudCache *)self metadataZone];
    [v8 deleteZone];

    [(HMDCloudCache *)self setMetadataZone:0];
  }
  v9 = [(HMDCloudCache *)self homeManagerZone];

  if (v9)
  {
    v10 = [(HMDCloudCache *)self homeManagerZone];
    [v10 deleteZone];

    [(HMDCloudCache *)self setHomeManagerZone:0];
  }
  os_unfair_lock_lock_with_options();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [(HMDCloudCache *)self homeZones];
  v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v15++) deleteZone];
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [(HMDCloudCache *)self setHomeZones:v16];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)homeZoneWithName:(id)a3 owner:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  os_unfair_lock_lock_with_options();
  v11 = [(HMDCloudCache *)self homeZones];
  v12 = [v11 objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    if (v10) {
      v10[2](v10, v12, 0);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__HMDCloudCache_homeZoneWithName_owner_completion___block_invoke;
    v13[3] = &unk_1E6A151A8;
    v13[4] = self;
    id v14 = v8;
    uint64_t v15 = v10;
    +[HMDCloudHomeZone createHomeZoneWithName:v14 owner:v9 cacheZone:0 cloudCache:self completion:v13];
  }
}

void __51__HMDCloudCache_homeZoneWithName_owner_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v14 || v5)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v5);
    }
  }
  else
  {
    id v6 = v14;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (isKindOfClass)
    {
      v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      v11 = [*(id *)(a1 + 32) homeZones];
      [v11 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

      os_unfair_lock_unlock(v10);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v9, 0);
    }
  }
}

- (id)homeZoneWithName:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudCache *)self homeZones];
  v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)homeZoneExists:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudCache *)self homeZones];
  v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (id)allHomeZones
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDCloudCache *)self homeZones];
  id v5 = [v4 allValues];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)createAndFetchZonesFromBackingStore:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [HMDBackingStoreCacheFetchZonesOperation alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HMDCloudCache_createAndFetchZonesFromBackingStore___block_invoke;
  v13[3] = &unk_1E6A151F8;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v14 = v6;
  v7 = [(HMDBackingStoreCacheFetchZonesOperation *)v5 initWithFetchResult:v13];
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v18 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud zones from disk", buf, 0xCu);
  }
  uint64_t v12 = [(HMDCloudCache *)v9 backingStore];
  [v12 submit:v7];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__HMDCloudCache_createAndFetchZonesFromBackingStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v8;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to load zones from disk with error %@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]([WeakRetained _createZones:v5 completion:*(void *)(a1 + 32)]);
      id v15 = v8;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v17;
        __int16 v20 = 2112;
        id v21 = 0;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Completed fetching cloud zones from disk with error %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)_createZones:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_homeDataInformation)
  {
    id v12 = [(HMDCloudCache *)self _findStoreCacheZone:v6 byName:@"HomeDataInfo"];
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v13 removeObject:v12];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__HMDCloudCache__createZones_completion___block_invoke;
    v32[3] = &unk_1E6A151A8;
    v32[4] = self;
    v33 = v13;
    id v34 = v7;
    id v14 = v13;
    +[HMDCloudZone createZoneWithName:@"HomeDataInfo" rootRecordName:@"DONOTUPLOAD" subscriptionName:@"HomeDataInfo" owner:@"__HomeKit_Default_Owner__" cacheZone:v12 cloudCache:self completion:v32];

    id v15 = v33;
LABEL_11:

    goto LABEL_12;
  }
  if (!self->_legacyZone)
  {
    id v12 = [(HMDCloudCache *)self _findStoreCacheZone:v6 byName:@"HomeDataBlobZone"];
    v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v16 removeObject:v12];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__HMDCloudCache__createZones_completion___block_invoke_2;
    v29[3] = &unk_1E6A151A8;
    v29[4] = self;
    v30 = v16;
    id v31 = v7;
    id v14 = v16;
    +[HMDCloudLegacyZone createLegacyZoneWithName:@"HomeDataBlobZone" owner:@"__HomeKit_Default_Owner__" cacheZone:v12 cloudCache:self completion:v29];

    id v15 = v30;
    goto LABEL_11;
  }
  if (!self->_metadataZone)
  {
    id v12 = [(HMDCloudCache *)self _findStoreCacheZone:v6 byName:@"CCF7D3D1-0C20-4207-97D0-9E565EB5E323"];
    long long v17 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v17 removeObject:v12];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __41__HMDCloudCache__createZones_completion___block_invoke_3;
    v26[3] = &unk_1E6A151A8;
    v26[4] = self;
    v27 = v17;
    id v28 = v7;
    id v14 = v17;
    +[HMDCloudMetadataZone createMetadataZoneWithName:@"CCF7D3D1-0C20-4207-97D0-9E565EB5E323" owner:@"__HomeKit_Default_Owner__" cacheZone:v12 cloudCache:self completion:v26];

    id v15 = v27;
    goto LABEL_11;
  }
  if (!self->_homeManagerZone)
  {
    id v12 = [(HMDCloudCache *)self _findStoreCacheZone:v6 byName:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5"];
    int v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v18 removeObject:v12];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__HMDCloudCache__createZones_completion___block_invoke_4;
    v23[3] = &unk_1E6A151A8;
    v23[4] = self;
    v24 = v18;
    id v25 = v7;
    id v14 = v18;
    +[HMDCloudHomeManagerZone createHomeManagerZoneWithName:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5" owner:@"__HomeKit_Default_Owner__" cacheZone:v12 cloudCache:self completion:v23];

    id v15 = v24;
    goto LABEL_11;
  }
  if ([v6 count])
  {
    id v8 = [v6 firstObject];
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [v9 removeObject:v8];
    id v10 = [v8 zoneName];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__HMDCloudCache__createZones_completion___block_invoke_5;
    v19[3] = &unk_1E6A151D0;
    v19[4] = self;
    id v20 = v8;
    id v21 = v9;
    id v22 = v7;
    id v11 = v9;
    id v12 = v8;
    +[HMDCloudHomeZone createHomeZoneWithName:v10 owner:@"__HomeKit_Default_Owner__" cacheZone:v12 cloudCache:self completion:v19];

LABEL_12:
    goto LABEL_13;
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_13:
}

void __41__HMDCloudCache__createZones_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v7 || v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setHomeDataInformation:v7];
    [*(id *)(a1 + 32) _createZones:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void __41__HMDCloudCache__createZones_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        id v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    [*(id *)(a1 + 32) setLegacyZone:v10];
    [*(id *)(a1 + 32) _createZones:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
  }
}

void __41__HMDCloudCache__createZones_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        id v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    [*(id *)(a1 + 32) setMetadataZone:v10];
    [*(id *)(a1 + 32) _createZones:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
  }
}

void __41__HMDCloudCache__createZones_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        id v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    [*(id *)(a1 + 32) setHomeManagerZone:v10];
    [*(id *)(a1 + 32) _createZones:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
  }
}

void __41__HMDCloudCache__createZones_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14
    && !v5
    && ((id v6 = v14, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0)
      ? (id v8 = 0)
      : (id v8 = v6),
        id v9 = v8,
        v6,
        (isKindOfClass & 1) != 0))
  {
    id v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v11 = [*(id *)(a1 + 32) homeZones];
    id v12 = [*(id *)(a1 + 40) zoneName];
    [v11 setObject:v6 forKeyedSubscript:v12];

    os_unfair_lock_unlock(v10);
    [*(id *)(a1 + 32) _createZones:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
    }
  }
}

- (id)_findStoreCacheZone:(id)a3 byName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "zoneName", (void)v15);
          char v13 = [v6 isEqualToString:v12];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (HMDCloudHomeManagerZone)homeManagerZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_homeManagerZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHomeManagerZone:(id)a3
{
  id v4 = (HMDCloudHomeManagerZone *)a3;
  os_unfair_lock_lock_with_options();
  homeManagerZone = self->_homeManagerZone;
  self->_homeManagerZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudMetadataZone)metadataZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_metadataZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMetadataZone:(id)a3
{
  id v4 = (HMDCloudMetadataZone *)a3;
  os_unfair_lock_lock_with_options();
  metadataZone = self->_metadataZone;
  self->_metadataZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudLegacyZone)legacyZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_legacyZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLegacyZone:(id)a3
{
  id v4 = (HMDCloudLegacyZone *)a3;
  os_unfair_lock_lock_with_options();
  legacyZone = self->_legacyZone;
  self->_legacyZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudZone)homeDataInformation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_homeDataInformation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHomeDataInformation:(id)a3
{
  id v4 = (HMDCloudZone *)a3;
  os_unfair_lock_lock_with_options();
  homeDataInformation = self->_homeDataInformation;
  self->_homeDataInformation = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudCache)initWithBackingStore:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudCache;
  id v8 = [(HMDCloudCache *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_backingStore, v6);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    homeZones = v9->_homeZones;
    v9->_homeZones = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (HMDCloudCache)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end