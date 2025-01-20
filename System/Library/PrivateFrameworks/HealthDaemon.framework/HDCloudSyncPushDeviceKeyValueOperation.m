@interface HDCloudSyncPushDeviceKeyValueOperation
- (id)_computeEntryHash:(uint64_t)a1;
- (void)_fetchLocalKeyValuesForProtectionCategory:(void *)a3 completion:;
- (void)main;
@end

@implementation HDCloudSyncPushDeviceKeyValueOperation

- (void)main
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__59;
  v68 = __Block_byref_object_dispose__59;
  id v69 = 0;
  v3 = [(HDCloudSyncOperation *)self profile];
  v4 = [v3 syncIdentityManager];
  v5 = [v4 currentSyncIdentity];
  v57 = [v5 identity];

  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 cachedCloudState];
  v8 = [(HDCloudSyncOperation *)self configuration];
  v9 = [v8 repository];
  v10 = [v9 primaryCKContainer];
  v11 = [v10 containerIdentifier];
  v12 = (id *)(v65 + 5);
  id obj = (id)v65[5];
  v13 = [v7 contextSyncZoneForContainerID:v11 error:&obj];
  objc_storeStrong(v12, obj);
  contextSyncZone = self->_contextSyncZone;
  self->_contextSyncZone = v13;

  v15 = self->_contextSyncZone;
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    v18 = (id *)(v65 + 5);
    v17 = (void *)v65[5];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke;
    v59[3] = &unk_1E62FB058;
    v61 = &v64;
    id v62 = v17;
    v59[4] = self;
    id v60 = v57;
    v56 = [(HDCloudSyncCachedZone *)v15 recordsForClass:v16 error:&v62 filter:v59];
    objc_storeStrong(v18, v62);
    if (v56)
    {
      if ((unint64_t)[v56 count] < 2)
      {
        v29 = [v56 firstObject];
        recordWithCurrentIdentity = self->_recordWithCurrentIdentity;
        self->_recordWithCurrentIdentity = v29;

        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke_288;
        v58[3] = &unk_1E62FB080;
        v58[4] = self;
        v31 = v58;
        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v81 = 0;
        v82 = (id *)&v81;
        uint64_t v83 = 0x3032000000;
        v84 = __Block_byref_object_copy__59;
        v85 = __Block_byref_object_dispose__59;
        id v86 = 0;
        id v34 = objc_alloc_init(MEMORY[0x1E4F65D90]);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke;
        v88 = &unk_1E62FB0A8;
        v89 = self;
        v93 = &v81;
        v54 = v31;
        id v92 = v54;
        id v35 = v32;
        id v90 = v35;
        id v36 = v33;
        id v91 = v36;
        [v34 setDidFinish:buf];
        v37 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
        v38 = [(HDCloudSyncOperation *)self configuration];
        v39 = [v38 accessibilityAssertion];
        uint64_t v40 = [v37 contextWithAccessibilityAssertion:v39];

        [v34 beginTask];
        v55 = [(HDCloudSyncOperation *)self configuration];
        v41 = [v55 repository];
        v42 = [v41 profile];
        v43 = [v42 database];
        v44 = v82;
        id v80 = v82[5];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_294;
        v75[3] = &unk_1E62FB0D0;
        id v45 = v34;
        id v76 = v45;
        v77 = self;
        id v46 = v35;
        id v78 = v46;
        id v47 = v36;
        v48 = (void *)v40;
        id v49 = v47;
        id v79 = v47;
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_4;
        v70[3] = &unk_1E62FB0F8;
        id v50 = v45;
        id v71 = v50;
        v72 = self;
        id v51 = v46;
        id v73 = v51;
        id v52 = v49;
        id v74 = v52;
        LOBYTE(v46) = [v43 performTransactionWithContext:v48 error:&v80 block:v75 inaccessibilityHandler:v70];
        objc_storeStrong(v44 + 5, v80);

        if (v46) {
          [v50 finishTask];
        }
        else {
          [v50 failTaskWithError:v82[5]];
        }

        _Block_object_dispose(&v81, 8);
        goto LABEL_18;
      }
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Multiple device contexts for same identity");
      v20 = (void *)v65[5];
      v65[5] = v19;

      _HKInitializeLogging();
      v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v22 = v65[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v22;
        _os_log_fault_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Error fetching context record for local identity %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (!v65[5])
      {
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"No context record for local device on the cloud");
        v27 = (void *)v65[5];
        v65[5] = v26;
      }
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v53 = v65[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching context record for local identity %{public}@", buf, 0x16u);
      }
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v65[5]];
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v23 = v65[5];
  if (!v23)
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Context zone not present.");
    v25 = (void *)v65[5];
    v65[5] = v24;

    uint64_t v23 = v65[5];
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v23];
LABEL_19:

  _Block_object_dispose(&v64, 8);
}

uint64_t __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  v4 = [a2 deviceContextWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = [v4 syncIdentity];
    uint64_t v6 = [v5 isEqual:a1[5]];
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

void __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke_288(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(*(void *)(a1 + 32) + 112);
      v12 = v10;
      uint64_t v13 = [v11 count];
      uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 120) count];
      *(_DWORD *)buf = 134218240;
      uint64_t v30 = v13;
      __int16 v31 = 2048;
      uint64_t v32 = v14;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to save %lu key-value records, delete %lu key-value records", buf, 0x16u);
    }
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = [v7 allObjects];
    v27 = v9;
    v17 = [v9 allObjects];
    if (v15)
    {
      id v28 = v17;
      id v18 = v17;
      id v19 = v16;
      v20 = [HDCloudSyncModifyRecordsOperation alloc];
      v21 = [v15 configuration];
      uint64_t v22 = [v15 configuration];
      [v22 repository];
      v24 = uint64_t v23 = v16;
      v25 = [v24 primaryCKContainer];
      uint64_t v26 = [(HDCloudSyncModifyRecordsOperation *)v20 initWithConfiguration:v21 container:v25 recordsToSave:v19 recordIDsToDelete:v18];

      uint64_t v16 = v23;
      [v15 delegateToOperation:v26];

      v17 = v28;
    }

    uint64_t v9 = v27;
  }
  else
  {
    [*(id *)(a1 + 32) finishWithSuccess:0 error:a4];
  }
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = *(void *)(*(void *)(a1[8] + 8) + 40);
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Error in fetching local entries %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v7 = a1[7];
    id v8 = [v5 firstObject];
    (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, 0, 0, v8);
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_294(uint64_t a1)
{
  [*(id *)(a1 + 32) beginTask];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_2;
  v9[3] = &unk_1E62F6688;
  v2 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v2, 0, v9);
  [*(id *)(a1 + 32) beginTask];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_3;
  v5[3] = &unk_1E62F6688;
  uint64_t v3 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v3, 1, v5);

  return 1;
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    [a1[4] failTaskWithError:a4];
  }
  else
  {
    [a1[5] addObjectsFromArray:a2];
    [a1[6] addObjectsFromArray:v7];
    [a1[4] finishTask];
  }
}

- (void)_fetchLocalKeyValuesForProtectionCategory:(void *)a3 completion:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = [a1 configuration];
    id v7 = [v6 repository];
    id v8 = [v7 cloudSyncShimProvider];
    uint64_t v9 = [v8 contextSyncShim];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__HDCloudSyncPushDeviceKeyValueOperation__fetchLocalKeyValuesForProtectionCategory_completion___block_invoke;
    v10[3] = &unk_1E62FB120;
    v10[4] = a1;
    uint64_t v12 = a2;
    id v11 = v5;
    [v9 fetchLocalKeyValueForProtectionCategory:a2 completion:v10];
  }
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_3(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    [a1[4] failTaskWithError:a4];
  }
  else
  {
    [a1[5] addObjectsFromArray:a2];
    [a1[6] addObjectsFromArray:v7];
    [a1[4] finishTask];
  }
}

uint64_t __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) beginTask];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_5;
  v4[3] = &unk_1E62F6688;
  v2 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v2, 1, v4);

  return 1;
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_5(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    [a1[4] failTaskWithError:a4];
  }
  else
  {
    [a1[5] addObjectsFromArray:a2];
    [a1[6] addObjectsFromArray:v7];
    [a1[4] finishTask];
  }
}

void __95__HDCloudSyncPushDeviceKeyValueOperation__fetchLocalKeyValuesForProtectionCategory_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v8 = a2;
    id v9 = objc_alloc_init(v7);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = a1[4];
    uint64_t v45 = a1[6];
    id v48 = v6;
    id v12 = v9;
    id v13 = v10;
    id v14 = v8;
    if (v11)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke;
      v59[3] = &unk_1E62FB148;
      v59[4] = v11;
      uint64_t v16 = objc_msgSend(v14, "hk_mapToDictionary:", v59);
      v17 = *(void **)(v11 + 104);
      uint64_t v18 = objc_opt_class();
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke_2;
      v53[3] = &unk_1E62FB170;
      uint64_t v47 = v11;
      v53[4] = v11;
      uint64_t v58 = v45;
      id v19 = v16;
      id v54 = v19;
      id v55 = v13;
      id v20 = v15;
      id v56 = v20;
      id v46 = v12;
      id v57 = v46;
      if ([v17 recordsForClass:v18 epoch:0 error:&v48 enumerationHandler:v53])
      {
        id v39 = v14;
        id v40 = v13;
        v41 = v6;
        id v42 = v12;
        v43 = a1;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v38 = v19;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v60 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v50;
          id v44 = v20;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v50 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              if (([v20 containsObject:v26] & 1) == 0)
              {
                uint64_t v27 = v24;
                id v28 = [HDCloudSyncDeviceKeyValueRecord alloc];
                v29 = [*(id *)(v47 + 104) zoneIdentifier];
                uint64_t v30 = [v29 zoneIdentifier];
                __int16 v31 = [v21 objectForKeyedSubscript:v26];
                uint64_t v32 = *(void *)(v47 + 128);
                [MEMORY[0x1E4F29128] UUID];
                v34 = id v33 = v21;
                id v35 = [(HDCloudSyncDeviceKeyValueRecord *)v28 initInZone:v30 deviceKeyValueEntry:v31 deviceContextRecord:v32 UUID:v34];
                id v36 = [v35 record];
                [v46 addObject:v36];

                uint64_t v24 = v27;
                id v21 = v33;

                id v20 = v44;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v60 count:16];
          }
          while (v23);
        }

        id v12 = v42;
        a1 = v43;
        id v13 = v40;
        id v6 = v41;
        id v14 = v39;
        id v19 = v38;
      }
    }
    id v37 = v48;

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v37 = v5;
  }
}

- (id)_computeEntryHash:(uint64_t)a1
{
  if (a1)
  {
    v2 = NSNumber;
    id v3 = a2;
    v4 = [v3 key];
    uint64_t v5 = [v4 hash];
    id v6 = [v3 domain];
    uint64_t v7 = [v6 hash] ^ v5;
    id v8 = NSNumber;
    uint64_t v9 = [v3 protectionCategory];

    id v10 = [v8 numberWithInteger:v9];
    uint64_t v11 = objc_msgSend(v2, "numberWithUnsignedInteger:", v7 ^ objc_msgSend(v10, "hash"));
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  -[HDCloudSyncPushDeviceKeyValueOperation _computeEntryHash:](v5, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a3)[2](v6, v8, v7);
}

uint64_t __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v24 = 0;
  v4 = [v3 deviceKeyValueEntry:&v24];
  id v5 = v24;
  if (v4)
  {
    id v6 = [v4 syncIdentity];
    id v7 = [*(id *)(a1 + 32) profile];
    id v8 = [v7 syncIdentityManager];
    uint64_t v9 = [v8 currentSyncIdentity];
    id v10 = [v9 identity];
    int v11 = [v6 isEqual:v10];

    if (v11 && [v4 protectionCategory] == *(void *)(a1 + 72))
    {
      id v12 = -[HDCloudSyncPushDeviceKeyValueOperation _computeEntryHash:](*(void *)(a1 + 32), v4);
      id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];

      if (v13)
      {
        id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
        [*(id *)(a1 + 56) addObject:v12];
        id v15 = [v14 value];
        uint64_t v16 = [v4 value];
        char v17 = [v15 isEqual:v16];

        if ((v17 & 1) == 0)
        {
          [v3 updateDeviceKeyValueEntry:v14];
          uint64_t v18 = *(void **)(a1 + 64);
          id v19 = [v3 record];
          [v18 addObject:v19];
        }
      }
      else
      {
        uint64_t v22 = *(void **)(a1 + 48);
        id v14 = [v3 recordID];
        [v22 addObject:v14];
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v20 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching key value entry for remote record during computing updated records %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordWithCurrentIdentity, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);

  objc_storeStrong((id *)&self->_contextSyncZone, 0);
}

@end