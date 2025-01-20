@interface HDCloudSyncPreparePushZoneForStoreOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)operationTagDependencies;
- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 store:(id)a5;
- (HDCloudSyncTarget)pushTarget;
- (void)_finishWithZone:(uint64_t)a1;
- (void)main;
@end

@implementation HDCloudSyncPreparePushZoneForStoreOperation

+ (id)operationTagDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 store:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPreparePushZoneForStoreOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_store, a5);
  }

  return v11;
}

- (void)main
{
  v2 = self;
  v80[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v4 = [v3 repository];
  v5 = [(id)v4 primaryCKContainer];
  uint64_t v6 = [v5 containerIdentifier];

  v7 = [(HDCloudSyncStore *)v2->_store containerIdentifier];
  v63 = (void *)v6;
  LOBYTE(v4) = [v7 isEqualToString:v6];

  if (v4)
  {
    v8 = [(HDCloudSyncOperation *)v2 configuration];
    id v9 = [v8 repository];
    char v10 = [v9 shouldPushToUnifiedZone];

    v11 = (void *)MEMORY[0x1E4F1A320];
    v12 = [(HDCloudSyncOperation *)v2 configuration];
    objc_super v13 = [v12 syncContainerPrefix];
    char v59 = v10;
    if (v10)
    {
      v62 = objc_msgSend(v11, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v13);
    }
    else
    {
      v15 = [(HDCloudSyncStore *)v2->_store storeIdentifier];
      v62 = objc_msgSend(v11, "hd_individualSyncZoneIDWithSyncCircleIdentifier:storeIdentifier:", v13, v15);
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v16 = [(HDCloudSyncOperation *)v2 configuration];
    v17 = [v16 computedState];
    id v18 = [v17 targets];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v72 count:16];
    uint64_t v61 = (uint64_t)v2;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v24 = [v23 store];
          v25 = [v24 storeIdentifier];
          v26 = [(HDCloudSyncStore *)v2->_store storeIdentifier];
          if ([v25 isEqual:v26])
          {
            v27 = [v23 zoneIdentifier];
            int v28 = [v27 isEquivalentToZone:v62 container:v63];

            v2 = (HDCloudSyncPreparePushZoneForStoreOperation *)v61;
            if (v28)
            {
              objc_storeStrong((id *)(v61 + 112), v23);
              [(id)v61 finishWithSuccess:1 error:0];
              v33 = v62;
              goto LABEL_35;
            }
          }
          else
          {
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v20);
    }

    v29 = [(HDCloudSyncOperation *)v2 configuration];
    v30 = [v29 cachedCloudState];
    id v66 = 0;
    v31 = [v30 zonesByIdentifierWithError:&v66];
    id v18 = v66;

    if (v31 || !v18)
    {
      v33 = v62;
      if (!v31)
      {
        _HKInitializeLogging();
        v34 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v61;
          _os_log_debug_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found.", buf, 0xCu);
        }
      }
      v35 = [v31 allValues];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __51__HDCloudSyncPreparePushZoneForStoreOperation_main__block_invoke;
      v64[3] = &unk_1E62F5B00;
      char v65 = v59;
      v64[4] = v63;
      v64[5] = v62;
      v36 = objc_msgSend(v35, "hk_firstObjectPassingTest:", v64);

      if (v36)
      {
        -[HDCloudSyncPreparePushZoneForStoreOperation _finishWithZone:](v61, v36);
      }
      else
      {
        id v60 = v18;
        id v37 = v62;
        v38 = [(id)v61 configuration];
        v39 = [v38 repository];
        v40 = [v39 primaryCKContainer];

        v41 = [(id)v61 configuration];
        v42 = [v41 repository];
        v43 = [v42 profileIdentifier];
        v44 = HDDatabaseForContainer(v40, v43);

        if ([v44 databaseScope] == 2)
        {
          v58 = v44;
          v45 = v40;
          _HKInitializeLogging();
          v46 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v47 = *(void **)(v61 + 104);
            v48 = v46;
            v49 = [v47 storeIdentifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v61;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v49;
            *(_WORD *)&buf[22] = 2114;
            v74 = v37;
            _os_log_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: No zone found for store %{public}@; creating zone %{public}@",
              buf,
              0x20u);
          }
          v50 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v37];
          v51 = [HDCloudSyncModifyRecordZonesOperation alloc];
          v52 = [(id)v61 configuration];
          v80[0] = v50;
          v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
          v54 = v51;
          v55 = v45;
          v56 = [(HDCloudSyncModifyRecordZonesOperation *)v54 initWithConfiguration:v52 container:v45 recordZonesToSave:v53 recordZoneIDsToDelete:0];

          v40 = v55;
          v71[0] = MEMORY[0x1E4F143A8];
          v71[1] = 3221225472;
          v71[2] = __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke;
          v71[3] = &unk_1E62F2950;
          v71[4] = v61;
          [(HDCloudSyncOperation *)v56 setOnError:v71];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke_293;
          v74 = &unk_1E62F5B28;
          uint64_t v75 = v61;
          id v76 = v50;
          id v77 = v37;
          id v78 = v55;
          v44 = v58;
          id v79 = v58;
          id v57 = v50;
          [(HDCloudSyncOperation *)v56 setOnSuccess:buf];
          [(HDCloudSyncOperation *)v56 start];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 712, @"Unable to create zones in a non-private database.");
          v56 = (HDCloudSyncModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue();
          [(id)v61 finishWithSuccess:0 error:v56];
        }

        id v18 = v60;
      }
    }
    else
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E4F29FA8];
      v33 = v62;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers, %{public}@", buf, 0x16u);
      }
      [(id)v61 finishWithSuccess:0 error:v18];
    }

LABEL_35:
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 712, @"Unable to create push zones in a non-primary container.");
    [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v14];
  }
}

uint64_t __51__HDCloudSyncPreparePushZoneForStoreOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 zoneIdentifier];
  v5 = [v4 containerIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    if (*(unsigned char *)(a1 + 48) && [v3 zoneType] == 2)
    {
      uint64_t v7 = 1;
    }
    else
    {
      v8 = [v3 zoneIdentifier];
      uint64_t v7 = [v8 isEquivalentToZone:*(void *)(a1 + 40) container:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_finishWithZone:(uint64_t)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__20;
    v54 = __Block_byref_object_dispose__20;
    id v55 = 0;
    uint64_t v4 = objc_opt_class();
    v48[5] = &v50;
    id v49 = 0;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __63__HDCloudSyncPreparePushZoneForStoreOperation__finishWithZone___block_invoke;
    v48[3] = &unk_1E62F5B50;
    v48[4] = a1;
    uint64_t v5 = [v3 recordsForClass:v4 epoch:0 error:&v49 enumerationHandler:v48];
    id v46 = v49;
    if (v5)
    {
      if (!v51[5])
      {
        int v6 = [(id)a1 configuration];
        uint64_t v7 = [v6 repository];
        v8 = [(id)a1 configuration];
        id v9 = [v8 repository];
        char v10 = [v9 primaryCKContainer];
        v11 = [v7 cachedOwnerIdentifierForContainer:v10];
        v45 = [v11 string];

        v12 = [(id)a1 configuration];
        objc_super v13 = [v12 repository];
        v14 = [v13 profile];
        v15 = [v14 cloudSyncManager];
        unsigned int v41 = [v15 isChild];

        v40 = [HDCloudSyncStoreRecord alloc];
        v44 = [(id)a1 configuration];
        v43 = [v44 syncContainerPrefix];
        v42 = [*(id *)(a1 + 104) storeIdentifier];
        v16 = [(id)a1 configuration];
        v17 = [v16 repository];
        id v18 = [v17 syncIdentityManager];
        uint64_t v19 = [v18 currentSyncIdentity];
        uint64_t v20 = [v19 identity];
        uint64_t v21 = [v3 zoneIdentifier];
        uint64_t v22 = [v21 zoneIdentifier];
        uint64_t v23 = [(HDCloudSyncStoreRecord *)v40 initInSyncCircle:v43 ownerIdentifier:v45 storeIdentifier:v42 syncIdentity:v20 isChild:v41 zoneID:v22];
        v24 = (void *)v51[5];
        v51[5] = v23;

        v25 = (void *)v51[5];
        id v47 = 0;
        LOBYTE(v22) = [v25 validateWithError:&v47];
        id v26 = v47;
        if ((v22 & 1) == 0)
        {
          _HKInitializeLogging();
          v27 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v58 = v26;
            _os_log_fault_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_FAULT, "Failed to validate store record after creation: %{public}@", buf, 0xCu);
          }
          [(id)a1 finishWithSuccess:0 error:v26];
        }
      }
      int v28 = [HDCloudSyncTarget alloc];
      v29 = [(id)a1 configuration];
      v30 = [v29 repository];
      v31 = [v30 primaryCKContainer];
      v32 = [v3 zoneIdentifier];
      uint64_t v33 = [(HDCloudSyncTarget *)v28 initWithPurpose:0 container:v31 zoneIdentifier:v32 storeRecord:v51[5] store:*(void *)(a1 + 104) options:0];
      v34 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v33;

      v35 = [(id)a1 configuration];
      v36 = [v35 computedState];
      uint64_t v56 = *(void *)(a1 + 112);
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      [v36 replaceTargets:v37];

      id v38 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v35 = (id)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v39 = [v3 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        id v58 = (id)a1;
        __int16 v59 = 2114;
        id v60 = v39;
        __int16 v61 = 2114;
        id v62 = v46;
        _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
      }
      id v38 = v46;
    }

    [(id)a1 finishWithSuccess:v5 error:v38];
    _Block_object_dispose(&v50, 8);
  }
}

void __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 104);
    v8 = v5;
    id v9 = [v7 storeIdentifier];
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    objc_super v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create zone for store: %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke_293(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = v2;
    uint64_t v6 = [v3 zoneID];
    uint64_t v7 = objc_msgSend(v6, "hd_storeIdentifier");
    int v18 = 138543618;
    uint64_t v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created zone for store: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  v8 = [HDCloudSyncZoneIdentifier alloc];
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = [*(id *)(a1 + 56) containerIdentifier];
  id v11 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v8, "initForZone:container:scope:", v9, v10, [*(id *)(a1 + 64) databaseScope]);

  __int16 v12 = [HDCloudSyncCachedZone alloc];
  objc_super v13 = [*(id *)(a1 + 32) configuration];
  __int16 v14 = [v13 repository];
  id v15 = [*(id *)(a1 + 32) configuration];
  uint64_t v16 = [v15 accessibilityAssertion];
  id v17 = [(HDCloudSyncCachedZone *)v12 initForZoneIdentifier:v11 repository:v14 accessibilityAssertion:v16];

  -[HDCloudSyncPreparePushZoneForStoreOperation _finishWithZone:](*(void *)(a1 + 32), v17);
}

uint64_t __63__HDCloudSyncPreparePushZoneForStoreOperation__finishWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 storeIdentifier];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 104) storeIdentifier];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v7 ^ 1u;
}

- (HDCloudSyncTarget)pushTarget
{
  return self->_pushTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTarget, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end