@interface HDCloudSyncFetchSharesOperation
- (BOOL)fetchAllShares;
- (BOOL)performWithError:(id *)a3;
- (HDCloudSyncFetchSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)shares;
- (uint64_t)_fetchSharesForContainer:(void *)a3 database:(void *)a4 error:;
- (uint64_t)_fetchSharesForZones:(void *)a3 error:;
- (void)setFetchAllShares:(BOOL)a3;
@end

@implementation HDCloudSyncFetchSharesOperation

- (HDCloudSyncFetchSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncFetchSharesOperation;
  v4 = [(HDCloudSyncOperation *)&v9 initWithConfiguration:a3 cloudState:0];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    shares = v5->_shares;
    v5->_shares = v6;
  }
  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 allCKContainers];

  uint64_t v8 = [v7 count];
  objc_super v9 = [(HDCloudSyncOperation *)self progress];
  [v9 setTotalUnitCount:v8];

  if (self->_fetchAllShares)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v16 = [v15 privateCloudDatabase];
          int v17 = -[HDCloudSyncFetchSharesOperation _fetchSharesForContainer:database:error:](self, v15, v16, a3);

          if (!v17)
          {
            LOBYTE(v19) = 0;
            goto LABEL_26;
          }
          v18 = [v15 sharedCloudDatabase];
          int v19 = -[HDCloudSyncFetchSharesOperation _fetchSharesForContainer:database:error:](self, v15, v18, a3);

          if (!v19) {
            goto LABEL_26;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        LOBYTE(v19) = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v19) = 1;
    }
  }
  else
  {
    v20 = [(HDCloudSyncOperation *)self configuration];
    v21 = [v20 cachedCloudState];
    id v27 = 0;
    v22 = [v21 zonesByIdentifierWithError:&v27];
    id v10 = v27;

    if (v22 || !v10)
    {
      if (v22)
      {
        v24 = [v22 allValues];
        LOBYTE(v19) = -[HDCloudSyncFetchSharesOperation _fetchSharesForZones:error:]((uint64_t)self, v24, a3);
      }
      else
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E4F29FA8];
        LOBYTE(v19) = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v33 = self;
          _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_INFO, "%{public}@ No zones fetched.", buf, 0xCu);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v33 = self;
        __int16 v34 = 2114;
        id v35 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      if (a3)
      {
        LOBYTE(v19) = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        LOBYTE(v19) = 0;
      }
    }
  }
LABEL_26:

  return v19;
}

- (uint64_t)_fetchSharesForContainer:(void *)a3 database:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    objc_super v9 = [a1 configuration];
    id v10 = [v9 cachedCloudState];
    uint64_t v11 = [v7 containerIdentifier];
    id v26 = 0;
    uint64_t v12 = objc_msgSend(v10, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v11, objc_msgSend(v8, "databaseScope"), &v26);
    id v13 = v26;

    if (v12 || !v13)
    {
      if (v12 && [v12 count])
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __75__HDCloudSyncFetchSharesOperation__fetchSharesForContainer_database_error___block_invoke;
        v25[3] = &unk_1E62FE928;
        v25[4] = a1;
        v16 = objc_msgSend(v12, "hk_map:", v25);
        uint64_t v15 = -[HDCloudSyncFetchSharesOperation _fetchSharesForZones:error:]((uint64_t)a1, v16, a4);
      }
      else
      {
        _HKInitializeLogging();
        int v17 = (void *)*MEMORY[0x1E4F29FA8];
        uint64_t v15 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          int v19 = [v7 containerIdentifier];
          [v8 databaseScope];
          v20 = CKDatabaseScopeString();
          *(_DWORD *)buf = 138543874;
          long long v28 = a1;
          __int16 v29 = 2114;
          long long v30 = v19;
          __int16 v31 = 2114;
          v32 = v20;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "%{public}@ No zones fetched for container %{public}@, database %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v22 = v14;
        v23 = [v7 containerIdentifier];
        [v8 databaseScope];
        v24 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138544130;
        long long v28 = a1;
        __int16 v29 = 2114;
        long long v30 = v23;
        __int16 v31 = 2114;
        v32 = v24;
        __int16 v33 = 2114;
        id v34 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones for container %{public}@ ,database %{public}@, %{public}@", buf, 0x2Au);
      }
      if (a4)
      {
        uint64_t v15 = 0;
        *a4 = v13;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (uint64_t)_fetchSharesForZones:(void *)a3 error:
{
  v22 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v23 = 0;
          uint64_t v12 = objc_msgSend(v11, "zoneShareWithError:", &v23, v22);
          id v13 = v23;
          v14 = v13;
          if (v12) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v13 == 0;
          }
          if (!v15)
          {
            _HKInitializeLogging();
            int v17 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v20 = v17;
              v21 = [v11 zoneIdentifier];
              *(_DWORD *)buf = 138543874;
              uint64_t v29 = a1;
              __int16 v30 = 2114;
              __int16 v31 = v21;
              __int16 v32 = 2114;
              __int16 v33 = v14;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", buf, 0x20u);
            }
            if (v22) {
              void *v22 = v14;
            }
            else {
              _HKLogDroppedError();
            }

            uint64_t v16 = 0;
            goto LABEL_23;
          }
          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    [*(id *)(a1 + 112) addObjectsFromArray:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    uint64_t v16 = 1;
LABEL_23:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (NSArray)shares
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_shares;
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

id __75__HDCloudSyncFetchSharesOperation__fetchSharesForContainer_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HDCloudSyncCachedZone alloc];
  id v5 = [*(id *)(a1 + 32) configuration];
  id v6 = [v5 repository];
  uint64_t v7 = [*(id *)(a1 + 32) configuration];
  uint64_t v8 = [v7 accessibilityAssertion];
  id v9 = [(HDCloudSyncCachedZone *)v4 initForZoneIdentifier:v3 repository:v6 accessibilityAssertion:v8];

  return v9;
}

- (BOOL)fetchAllShares
{
  return self->_fetchAllShares;
}

- (void)setFetchAllShares:(BOOL)a3
{
  self->_fetchAllShares = a3;
}

- (void).cxx_destruct
{
}

@end