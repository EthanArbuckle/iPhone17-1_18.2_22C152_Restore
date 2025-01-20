@interface HDCloudSyncCreateZonesOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 zones:(id)a5 container:(id)a6;
- (void)main;
@end

@implementation HDCloudSyncCreateZonesOperation

- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 zones:(id)a5 container:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncCreateZonesOperation;
  v12 = [(HDCloudSyncOperation *)&v17 initWithConfiguration:a3 cloudState:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a6);
    uint64_t v14 = [v10 copy];
    zones = v13->_zones;
    v13->_zones = (NSArray *)v14;
  }
  return v13;
}

- (void)main
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E4F29FA8];
  v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    zones = self->_zones;
    uint64_t v6 = v4;
    v7 = [(NSArray *)zones hk_map:&__block_literal_global_54];
    v8 = [v7 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    v34 = self;
    __int16 v35 = 2114;
    id v36 = v8;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Verifying existence of zones: %{public}@", buf, 0x16u);
  }
  v9 = [(HDCloudSyncOperation *)self configuration];
  id v10 = [v9 cachedCloudState];
  id v32 = 0;
  id v11 = [v10 zonesByIdentifierWithError:&v32];
  id v12 = v32;

  if (v11 || !v12)
  {
    if (!v11 || ![v11 count])
    {
      _HKInitializeLogging();
      uint64_t v14 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = self;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ No cached zones found while verifying existence of zones.", buf, 0xCu);
      }
    }
    v15 = self->_zones;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__HDCloudSyncCreateZonesOperation_main__block_invoke_284;
    v29[3] = &unk_1E62FA358;
    id v30 = v11;
    v31 = self;
    v16 = [(NSArray *)v15 hk_filter:v29];
    if ([v16 count])
    {
      container = self->_container;
      v18 = [(HDCloudSyncOperation *)self configuration];
      v19 = [v18 repository];
      v20 = [v19 profileIdentifier];
      v21 = HDDatabaseForContainer(container, v20);

      if ([v21 databaseScope] == 2)
      {
        _HKInitializeLogging();
        os_log_t v22 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = objc_msgSend(v16, "hk_map:", &__block_literal_global_291);
          v25 = [v24 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          v34 = self;
          __int16 v35 = 2114;
          id v36 = v25;
          _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating zones: %{public}@", buf, 0x16u);
        }
        v26 = [HDCloudSyncModifyRecordZonesOperation alloc];
        v27 = [(HDCloudSyncOperation *)self configuration];
        v28 = [(HDCloudSyncModifyRecordZonesOperation *)v26 initWithConfiguration:v27 container:self->_container recordZonesToSave:v16 recordZoneIDsToDelete:0];

        [(HDCloudSyncOperation *)self delegateToOperation:v28];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 712, @"Unable to create zones in a non-private database.");
        v28 = (HDCloudSyncModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue();
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v28];
      }
    }
    else
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = self;
      __int16 v35 = 2114;
      id v36 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating pull targets, %{public}@", buf, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v12];
  }
}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke_284(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = [v3 zoneID];
        id v11 = [*(id *)(*(void *)(a1 + 40) + 104) containerIdentifier];
        LOBYTE(v9) = [v9 isEquivalentIgnoringOwnerToZone:v10 container:v11];

        if (v9)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end