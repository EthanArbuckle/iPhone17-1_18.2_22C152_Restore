@interface HDDeviceContextStoreManager
+ (HDDeviceContextStoreManager)new;
- (BOOL)deleteDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)enumerateAllEntriesWithError:(id *)a3 handler:(id)a4;
- (BOOL)ingestRemoteDeviceContexts:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)updateSoftwareVersionForCurrentSyncIdentityWithError:(id *)a3;
- (HDDeviceContextStoreManager)init;
- (HDDeviceContextStoreManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)fetchAllEntriesWithError:(id *)a3;
- (id)lookupOrCreateLocalDeviceContextWithError:(id *)a3;
- (id)numberOfDeviceContextsPerDeviceType:(id *)a3;
- (void)setProfile:(id)a3;
@end

@implementation HDDeviceContextStoreManager

- (HDDeviceContextStoreManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HDDeviceContextStoreManager)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HDDeviceContextStoreManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDeviceContextStoreManager;
  v5 = [(HDDeviceContextStoreManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)numberOfDeviceContextsPerDeviceType:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(HDDeviceContextStoreManager *)self fetchAllEntriesWithError:a3];
  v7 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      id obj = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = NSNumber;
          v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "type"));
          v15 = [v5 objectForKeyedSubscript:v14];
          v16 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
          v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "type"));
          [v5 setObject:v16 forKeyedSubscript:v17];
        }
        v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    id v18 = v5;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)enumerateAllEntriesWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = [(HDDeviceContextStoreManager *)self profile];
  uint64_t v8 = [v7 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke;
  v11[3] = &unk_1E62FA3D0;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a3 block:v11];

  return (char)a3;
}

BOOL __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke_2;
  v7[3] = &unk_1E62FD258;
  id v8 = *(id *)(a1 + 32);
  BOOL v5 = +[HDDeviceContextEntity enumerateDeviceContextWithTransaction:a2 error:a3 enumerationHandler:v7];

  return v5;
}

uint64_t __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchAllEntriesWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__71;
  id v12 = __Block_byref_object_dispose__71;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HDDeviceContextStoreManager_fetchAllEntriesWithError___block_invoke;
  v7[3] = &unk_1E62FD280;
  void v7[4] = &v8;
  if ([(HDDeviceContextStoreManager *)self enumerateAllEntriesWithError:a3 handler:v7])
  {
    id v5 = (id)v9[5];
  }
  else
  {
    id v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__HDDeviceContextStoreManager_fetchAllEntriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)lookupOrCreateLocalDeviceContextWithError:(id *)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__71;
  v14 = __Block_byref_object_dispose__71;
  id v15 = 0;
  id v5 = [(HDDeviceContextStoreManager *)self profile];
  id v6 = [v5 database];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HDDeviceContextStoreManager_lookupOrCreateLocalDeviceContextWithError___block_invoke;
  v9[3] = &unk_1E62F9108;
  v9[4] = self;
  v9[5] = &v10;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v9];

  if (a3) {
    id v7 = (id)v11[5];
  }
  else {
    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

BOOL __73__HDDeviceContextStoreManager_lookupOrCreateLocalDeviceContextWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 profile];
  uint64_t v8 = +[HDDeviceContextEntity lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:v7 transaction:v6 error:a3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)updateSoftwareVersionForCurrentSyncIdentityWithError:(id *)a3
{
  id v5 = [(HDDeviceContextStoreManager *)self profile];
  id v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HDDeviceContextStoreManager_updateSoftwareVersionForCurrentSyncIdentityWithError___block_invoke;
  v8[3] = &unk_1E62F6130;
  v8[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v8];

  return (char)a3;
}

BOOL __84__HDDeviceContextStoreManager_updateSoftwareVersionForCurrentSyncIdentityWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) profile];
  id v7 = +[HDDeviceContextEntity deviceContextForLocalSyncIdentityWithProfile:v6 transaction:v5 error:a3];

  if (v7) {
    BOOL v8 = +[HDDeviceContextEntity updateSoftwareVersionForDeviceContext:v7 transaction:v5 error:a3];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)insertOrUpdateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v16 = 0;
  uint64_t v9 = +[HDDeviceContextEntity lookupDeviceContext:v7 transaction:v8 error:&v16];
  id v10 = v16;
  v11 = v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    if (v9)
    {
      BOOL v13 = +[HDDeviceContextEntity updateDeviceContext:v7 transaction:v8 error:a5];
    }
    else
    {
      v14 = +[HDDeviceContextEntity insertDeviceContext:v7 transaction:v8 error:a5];
      BOOL v13 = v14 != 0;
    }
  }
  else if (a5)
  {
    BOOL v13 = 0;
    *a5 = v10;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)deleteDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HDDeviceContextStoreManager *)self profile];
  v11 = [v10 syncIdentityManager];
  BOOL v12 = [v9 syncIdentity];

  BOOL v13 = [v11 concreteIdentityForIdentity:v12 shouldCreate:0 transaction:v8 error:a5];

  if (v13)
  {
    v14 = [v13 entity];
    uint64_t v15 = [v14 persistentID];
    id v16 = [(HDDeviceContextStoreManager *)self profile];
    BOOL v17 = +[HDDeviceContextEntity deleteDeviceContextWithSyncIdentity:v15 profile:v16 error:a5];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)ingestRemoteDeviceContexts:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v53 = self;
  id v9 = [(HDDeviceContextStoreManager *)self profile];
  id v10 = [v9 syncIdentityManager];
  v11 = [v10 currentSyncIdentity];
  BOOL v12 = [v11 identity];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __76__HDDeviceContextStoreManager_ingestRemoteDeviceContexts_transaction_error___block_invoke;
  v54[3] = &unk_1E62FD2A8;
  id v55 = v12;
  id v48 = v12;
  BOOL v13 = objc_msgSend(v8, "hk_filter:", v54);

  id v14 = v13;
  id v15 = v7;
  v49 = v14;
  v47 = v15;
  if (!v53)
  {

LABEL_43:
    char v50 = 0;
    goto LABEL_44;
  }
  *(void *)&long long v57 = 0;
  *((void *)&v57 + 1) = &v57;
  *(void *)&long long v58 = 0x3032000000;
  *((void *)&v58 + 1) = __Block_byref_object_copy__71;
  *(void *)&long long v59 = __Block_byref_object_dispose__71;
  *((void *)&v59 + 1) = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v62 = 1;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __79__HDDeviceContextStoreManager__insertOrUpdateDeviceContexts_transaction_error___block_invoke;
  v63[3] = &unk_1E62FD2D0;
  v65 = buf;
  v63[4] = v53;
  id v16 = v15;
  id v64 = v16;
  v66 = &v57;
  [v14 enumerateObjectsUsingBlock:v63];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = *(id *)(*((void *)&v57 + 1) + 40);
    v19 = v18;
    if (v18)
    {
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v57, 8);

  if (!v17) {
    goto LABEL_43;
  }
  id v20 = v14;
  id v51 = v16;
  long long v21 = [(HDDeviceContextStoreManager *)v53 profile];
  long long v22 = [v21 deviceContextManager];
  v46 = [v22 fetchAllEntriesWithError:a5];

  if (!v46)
  {
    char v50 = 0;
    goto LABEL_41;
  }
  long long v23 = [(HDDeviceContextStoreManager *)v53 profile];
  long long v24 = [v23 syncIdentityManager];
  v25 = [v24 currentSyncIdentity];
  uint64_t v26 = [v25 identity];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v27 = v46;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (!v28)
  {
    char v50 = 1;
    goto LABEL_40;
  }
  uint64_t v29 = *(void *)v58;
  char v50 = 1;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v58 != v29) {
        objc_enumerationMutation(v27);
      }
      v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      v32 = [v31 syncIdentity];
      char v33 = [v32 isEqual:v26];

      if ((v33 & 1) == 0 && ([v20 containsObject:v31] & 1) == 0)
      {
        id v56 = 0;
        BOOL v34 = [(HDDeviceContextStoreManager *)v53 deleteDeviceContext:v31 transaction:v51 error:&v56];
        id v35 = v56;
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E4F29FA8];
        v37 = *MEMORY[0x1E4F29FA8];
        if (v34)
        {
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = v36;
            v39 = [v31 description];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v39;
            _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "Successfully deleted local context record %@", buf, 0xCu);
          }
          v40 = [(HDDeviceContextStoreManager *)v53 profile];
          v41 = [v40 deviceKeyValueStoreManager];
          char v42 = [v41 deleteProtectedKVEntriesForDeviceContext:v31 error:a5];

          if ((v42 & 1) == 0)
          {
            _HKInitializeLogging();
            v43 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v35;
              _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete protected device key value pairs for record: %{public}@", buf, 0x16u);
            }
            id v44 = v35;
            if (v44)
            {
              if (a5)
              {
LABEL_31:
                *a5 = v44;
                goto LABEL_33;
              }
LABEL_32:
              _HKLogDroppedError();
            }
            goto LABEL_33;
          }
        }
        else
        {
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v35;
            _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete local context record: %{public}@", buf, 0x16u);
          }
          id v44 = v35;
          if (v44)
          {
            if (a5) {
              goto LABEL_31;
            }
            goto LABEL_32;
          }
LABEL_33:

          char v50 = 0;
        }

        continue;
      }
    }
    uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v63 count:16];
  }
  while (v28);
LABEL_40:

LABEL_41:
LABEL_44:

  return v50 & 1;
}

uint64_t __76__HDDeviceContextStoreManager_ingestRemoteDeviceContexts_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 syncIdentity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void __79__HDDeviceContextStoreManager__insertOrUpdateDeviceContexts_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) profile];
  id v5 = [v4 deviceContextManager];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v5 insertOrUpdateDeviceContext:v3 transaction:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v3;
      __int16 v17 = 2114;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end