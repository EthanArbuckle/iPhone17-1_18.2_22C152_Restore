@interface HDCloudSyncOwnerIdentifierManager
- (HDCloudSyncOwnerIdentifierManager)initWithCloudSyncManager:(id)a3;
- (id)cachedOwnerIdentifierForContainer:(id)a3;
- (void)cacheOwnerIdentifiersForContainers:(id)a3 completion:(id)a4;
- (void)discardCachedIdentifiers;
- (void)fetchOwnerIdentifierForContainer:(id)a3 completion:(id)a4;
- (void)rollOwnerDifferentiatorAfterCloudSyncDisableWithCompletion:(id)a3;
- (void)rollOwnerDifferentiatorForReason:(id)a3 completion:(id)a4;
@end

@implementation HDCloudSyncOwnerIdentifierManager

- (HDCloudSyncOwnerIdentifierManager)initWithCloudSyncManager:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncOwnerIdentifierManager;
  v5 = [(HDCloudSyncOwnerIdentifierManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudSyncManager, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_deviceIDsByContainerIdentifier = v6->_lock_deviceIDsByContainerIdentifier;
    v6->_lock_deviceIDsByContainerIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_cachedOwnerIdentifiersByContainerIdentifier = v6->_lock_cachedOwnerIdentifiersByContainerIdentifier;
    v6->_lock_cachedOwnerIdentifiersByContainerIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_containersByIdentifier = v6->_lock_containersByIdentifier;
    v6->_lock_containersByIdentifier = v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    writeQueue = v6->_writeQueue;
    v6->_writeQueue = (OS_dispatch_queue *)v13;
  }
  return v6;
}

uint64_t __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    v7 = [WeakRetained profile];

    v8 = HDCloudSyncKeyValueDomainWithProfile(v7);
    id v30 = 0;
    v9 = [v8 dataForKey:@"HDCloudSyncDatabaseIdentifier" error:&v30];
    id v10 = v30;
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
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v9);
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
          id v16 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 129, @"Unable to get cloudSyncDatabaseIdentifier from databaseIdentifierData %@", v9);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          id v16 = v17;
          if (v17) {
            id v18 = v17;
          }
        }
        goto LABEL_16;
      }
      id v16 = 0;
    }
    else
    {
      id v16 = v10;
    }
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v16 = 0;
  v14 = 0;
LABEL_17:
  id v19 = v16;
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v14;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {

    v22 = HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 40));
    id v29 = 0;
    uint64_t v23 = [v22 stringForKey:@"OwnerDifferentiator" error:&v29];
    id v19 = v29;
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v19 == 0;
    }
    uint64_t v27 = v26;
    if (!v26)
    {
      if (a3) {
        *a3 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_33;
  }
  if (v19)
  {
    if (a3)
    {
      id v19 = v19;
      uint64_t v27 = 0;
      *a3 = v19;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v27 = 0;
    }
LABEL_33:

    return v27;
  }
  return 1;
}

void __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13;
  BOOL v26 = __Block_byref_object_dispose__13;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__13;
  uint64_t v20 = __Block_byref_object_dispose__13;
  id v21 = 0;
  v2 = [*(id *)(a1 + 32) database];
  v3 = +[HDDatabaseTransactionContext contextForWriting];
  id v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_3;
  v11[3] = &unk_1E62F4E18;
  uint64_t v13 = &v22;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  v14 = &v16;
  int v5 = [v2 performTransactionWithContext:v3 error:&v15 block:v11 inaccessibilityHandler:0];
  id v6 = v15;

  if (v5)
  {
    id v7 = 0;
    uint64_t v8 = v23[5];
    uint64_t v9 = v17[5];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v7 = v6;
  }
  (*(void (**)(void, uint64_t, uint64_t, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v8, v9, v7);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    id v7 = [WeakRetained profile];

    uint64_t v8 = HDCloudSyncKeyValueDomainWithProfile(v7);
    id v34 = 0;
    uint64_t v9 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:v7 error:&v34];
    id v10 = v34;
    id v11 = v10;
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12)
    {
      if (a3)
      {
        id v11 = v10;
        id v14 = 0;
        *a3 = v11;
LABEL_31:

        goto LABEL_32;
      }
      _HKLogDroppedError();
LABEL_30:
      id v14 = 0;
      goto LABEL_31;
    }
    if (v9)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v9);
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 129, @"Unable to get databaseIdentifier from databaseIdentifierData %@", v9);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (a3) {
            *a3 = v14;
          }
          else {
            _HKLogDroppedError();
          }
        }

LABEL_29:
        goto LABEL_30;
      }
      id v14 = (id)v13;
      _HKInitializeLogging();
      id v15 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v5;
        __int16 v36 = 2114;
        id v37 = v14;
        __int16 v38 = 2114;
        v39 = @"HDCloudSyncDatabaseIdentifier";
        uint64_t v16 = "%{public}@: Copy database UUID %{public}@ to %{public}@";
        id v17 = v15;
        uint32_t v18 = 32;
LABEL_15:
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F29128] UUID];
      _HKInitializeLogging();
      id v19 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v5;
        __int16 v36 = 2114;
        id v37 = v14;
        uint64_t v16 = "%{public}@: No database UUID present yet; healthd has not yet launched while the device is unlocked on thi"
              "s device. Create a cloud sync database identifier: %{public}@";
        id v17 = v19;
        uint32_t v18 = 22;
        goto LABEL_15;
      }
    }
    uint64_t v20 = objc_msgSend(v14, "hk_dataForUUIDBytes");
    *(void *)buf = v11;
    char v21 = [v8 setData:v20 forKey:@"HDCloudSyncDatabaseIdentifier" error:buf];
    id v22 = *(id *)buf;

    if (v21)
    {
      id v11 = v22;
      goto LABEL_31;
    }
    id v11 = v22;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_29;
  }
  id v14 = 0;
LABEL_32:
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v14;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return 0;
  }
  v25 = HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 40));
  id v33 = 0;
  uint64_t v26 = [v25 stringForKey:@"OwnerDifferentiator" error:&v33];
  id v27 = v33;
  uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
  id v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v26;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = v27 == 0;
  }
  uint64_t v31 = v30;
  if (!v30)
  {
    if (a3) {
      *a3 = v27;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v31;
}

- (void)fetchOwnerIdentifierForContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke;
  uint64_t v23 = &unk_1E62F4E90;
  id v25 = v6;
  id v26 = v7;
  uint64_t v24 = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = &v20;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSyncManager);
    BOOL v12 = objc_msgSend(WeakRetained, "profile", v20, v21);

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__13;
    v46 = __Block_byref_object_dispose__13;
    id v47 = 0;
    uint64_t v36 = 0;
    id v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__13;
    uint64_t v40 = __Block_byref_object_dispose__13;
    id v41 = 0;
    uint64_t v13 = [v12 database];
    id v14 = +[HDDatabaseTransactionContext contextForReading];
    id v35 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke;
    v31[3] = &unk_1E62F4E18;
    id v33 = &v42;
    v31[4] = self;
    id v15 = v12;
    id v32 = v15;
    id v34 = &v36;
    char v16 = [v13 performTransactionWithContext:v14 error:&v35 block:v31 inaccessibilityHandler:0];
    id v17 = v35;

    if (v16)
    {
      uint64_t v18 = v43[5];
      if (v18)
      {
        ((void (*)(uint64_t *, uint64_t, uint64_t, void))v22)(v10, v18, v37[5], 0);
      }
      else
      {
        writeQueue = self->_writeQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_2;
        block[3] = &unk_1E62F4E40;
        id v28 = v15;
        id v29 = self;
        BOOL v30 = v10;
        dispatch_async(writeQueue, block);
      }
    }
    else
    {
      ((void (*)(uint64_t *, void, void, id))v22)(v10, 0, 0, v17);
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
}

void __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v18 = __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke_2;
    id v19 = &unk_1E62F4E68;
    id v22 = *(id *)(a1 + 48);
    id v20 = v5;
    id v21 = v6;
    id v9 = v7;
    id v10 = v17;
    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v8 + 16));
      id v11 = *(void **)(v8 + 32);
      BOOL v12 = [v9 containerIdentifier];
      uint64_t v13 = [v11 objectForKeyedSubscript:v12];

      uint64_t v14 = *(void *)(v8 + 24);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 16));
      if (v13)
      {
        ((void (*)(void *, void *, void))v18)(v10, v13, 0);
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __75__HDCloudSyncOwnerIdentifierManager__fetchDeviceIDForContainer_completion___block_invoke;
        v23[3] = &unk_1E62F4F08;
        id v15 = v9;
        id v24 = v15;
        char v16 = v10;
        uint64_t v25 = v8;
        id v26 = v16;
        uint64_t v27 = v14;
        [v15 fetchCurrentDeviceIDWithCompletionHandler:v23];
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[HDCloudSyncOwnerIdentifier alloc] _initWithDatabaseIdentifer:a1[4] deviceIdentifier:v4 ownerDifferentiator:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)cacheOwnerIdentifiersForContainers:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        lock_cachedOwnerIdentifiersByContainerIdentifier = self->_lock_cachedOwnerIdentifiersByContainerIdentifier;
        uint64_t v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) containerIdentifier];
        id v15 = [(NSMutableDictionary *)lock_cachedOwnerIdentifiersByContainerIdentifier objectForKeyedSubscript:v14];

        if (!v15)
        {
          char v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  char v16 = 0;
LABEL_11:

  int64_t lock_fetchEpoch = self->_lock_fetchEpoch;
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F65D90]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke;
    v33[3] = &unk_1E62F4EB8;
    id v24 = v7;
    id v34 = v7;
    [v18 setDidFinish:v33];
    [v18 beginTask];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v8;
    uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          [v18 beginTask];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke_2;
          v26[3] = &unk_1E62F4EE0;
          int64_t v28 = lock_fetchEpoch;
          v26[4] = self;
          v26[5] = v23;
          id v27 = v18;
          [(HDCloudSyncOwnerIdentifierManager *)self fetchOwnerIdentifierForContainer:v23 completion:v26];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v20);
    }

    [v18 finishTask];
    id v7 = v24;
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v5 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 1, 0);
  }
  else
  {
    id v7 = [a4 firstObject];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
}

void __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v6 = *(void *)(a1 + 32);
  if (v12 && *(void *)(a1 + 56) == *(void *)(v6 + 24))
  {
    id v7 = *(void **)(v6 + 40);
    id v8 = [*(id *)(a1 + 40) containerIdentifier];
    [v7 setObject:v12 forKeyedSubscript:v8];

    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v11 = [v9 containerIdentifier];
    [v10 setObject:v9 forKeyedSubscript:v11];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    [*(id *)(a1 + 48) finishTask];
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 128, @"Epoch mismatch; owner identifier has changed since fetch began.");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 48) failTaskWithError:v5];
  }
}

- (id)cachedOwnerIdentifierForContainer:(id)a3
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  lock_cachedOwnerIdentifiersByContainerIdentifier = self->_lock_cachedOwnerIdentifiersByContainerIdentifier;
  id v8 = [v6 containerIdentifier];

  uint64_t v9 = [(NSMutableDictionary *)lock_cachedOwnerIdentifiersByContainerIdentifier objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
  if (lock_cachedOwnerIdentifiersByContainerIdentifier)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDCloudSyncOwnerIdentifierManager.m", 230, @"Invalid parameter not satisfying: %@", @"hasFetched" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"HDCloudSyncOwnerIdentifierManager.m", 231, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:

  return v9;
}

void __75__HDCloudSyncOwnerIdentifierManager__fetchDeviceIDForContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 56) == *(void *)(v8 + 24))
    {
      uint64_t v9 = *(void **)(v8 + 32);
      uint64_t v10 = [*(id *)(a1 + 32) containerIdentifier];
      [v9 setObject:v7 forKeyedSubscript:v10];
    }
    else
    {

      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 128, @"Epoch mismatch; account information has changed since fetch began.");
      id v7 = 0;
      uint64_t v10 = v6;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve device identifier for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)discardCachedIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_deviceIDsByContainerIdentifier = self->_lock_deviceIDsByContainerIdentifier;
  ++self->_lock_fetchEpoch;
  [(NSMutableDictionary *)lock_deviceIDsByContainerIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_lock_cachedOwnerIdentifiersByContainerIdentifier removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)rollOwnerDifferentiatorForReason:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSyncManager);
  uint64_t v9 = [WeakRetained profile];

  uint64_t v10 = [v9 daemon];
  uint64_t v11 = [v10 analyticsSubmissionCoordinator];
  objc_msgSend(v11, "cloudSync_reportOwnershipChangeForProfile:reason:", v9, v6);

  _HKInitializeLogging();
  uint64_t v12 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: ownership change required: %{public}@", buf, 0x16u);
  }
  int v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v13, "hk_removeObjectsForKeysWithPrefix:", @"HDLastLongTimeWithoutSuccessfulCloudSyncReportDate");

  uint64_t v14 = HDCloudSyncKeyValueDomainWithProfile(v9);
  __int16 v15 = [MEMORY[0x1E4F29128] UUID];
  id v16 = [v15 UUIDString];
  id v21 = 0;
  int v17 = [v14 setString:v16 forKey:@"OwnerDifferentiator" error:&v21];
  id v18 = v21;

  if (v17)
  {
    [(HDCloudSyncOwnerIdentifierManager *)self discardCachedIdentifiers];
    if (self)
    {
      id v19 = v7;
      os_unfair_lock_lock(&self->_lock);
      uint64_t v20 = [(NSMutableDictionary *)self->_lock_containersByIdentifier allValues];
      os_unfair_lock_unlock(&self->_lock);
      [(HDCloudSyncOwnerIdentifierManager *)self cacheOwnerIdentifiersForContainers:v20 completion:v19];
    }
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v18);
  }
}

- (void)rollOwnerDifferentiatorAfterCloudSyncDisableWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_lock_containersByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_cachedOwnerIdentifiersByContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_deviceIDsByContainerIdentifier, 0);

  objc_destroyWeak((id *)&self->_cloudSyncManager);
}

@end