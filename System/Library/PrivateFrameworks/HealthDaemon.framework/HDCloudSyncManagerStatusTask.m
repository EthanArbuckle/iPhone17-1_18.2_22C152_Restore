@interface HDCloudSyncManagerStatusTask
- (HDCloudSyncManagerStatusTask)initWithManager:(id)a3 completion:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncManagerStatusTask

- (HDCloudSyncManagerStatusTask)initWithManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncManagerStatusTask;
  v8 = [(HDCloudSyncManagerTask *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    uint64_t v10 = [v7 copy];
    id completion = v9->_completion;
    v9->_id completion = (id)v10;
  }
  return v9;
}

- (void)main
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__94;
    v16[4] = __Block_byref_object_dispose__94;
    id v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__94;
    v14[4] = __Block_byref_object_dispose__94;
    id v15 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__94;
    v12[4] = __Block_byref_object_dispose__94;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__HDCloudSyncManagerStatusTask_main__block_invoke;
    v7[3] = &unk_1E6300490;
    v7[4] = self;
    id v8 = WeakRetained;
    v9 = v16;
    uint64_t v10 = v14;
    v11 = v12;
    [v8 containerIdentifiersForCurrentAccountWithCompletion:v7];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v14, 8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    id completion = (void (**)(id, void, void *))self->_completion;
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 2000, @"Cloud sync manager unexpectedly nil");
    completion[2](completion, 0, v6);

    [(HDCloudSyncManagerTask *)self finish];
  }
}

void __36__HDCloudSyncManagerStatusTask_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = +[HDDatabaseTransactionContext contextForReading];
    v5 = [*(id *)(a1 + 40) profile];
    id v6 = [v5 database];
    id v23 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__HDCloudSyncManagerStatusTask_main__block_invoke_2;
    v18[3] = &unk_1E6300468;
    v18[4] = *(void *)(a1 + 32);
    id v19 = v3;
    id v20 = *(id *)(a1 + 40);
    long long v21 = *(_OWORD *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 64);
    int v7 = [v6 performTransactionWithContext:v4 error:&v23 block:v18 inaccessibilityHandler:0];
    id v8 = v23;

    if (v7)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v14 = *(void *)(a1 + 32);
        id v13 = *(void **)(a1 + 40);
        id v15 = v9;
        v16 = [v13 profile];
        *(_DWORD *)buf = 138544386;
        uint64_t v25 = v14;
        __int16 v26 = 2114;
        uint64_t v27 = v10;
        __int16 v28 = 2114;
        uint64_t v29 = v11;
        __int16 v30 = 2114;
        uint64_t v31 = v12;
        __int16 v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched Status: Push: %{public}@, Lite Push: %{public}@, Pull: %{public}@, Profile:%{public}@", buf, 0x34u);
      }
      id v17 = objc_alloc_init(HDCloudSyncStatus);
      [(HDCloudSyncStatus *)v17 setLastSuccessfulPullDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [(HDCloudSyncStatus *)v17 setLastSuccessfulPushDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [(HDCloudSyncStatus *)v17 setLastSuccessfulLitePushDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
    [*(id *)(a1 + 32) finish];
  }
}

uint64_t __36__HDCloudSyncManagerStatusTask_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) profile];
  if (!v6)
  {
    id v16 = 0;
    goto LABEL_62;
  }
  id v8 = v5;
  v9 = HDCloudSyncKeyValueDomainWithProfile(v7);
  uint64_t v10 = HDCloudSyncLastSuccessfulPushKeyForContainerIdentifier((uint64_t)v8);

  id v44 = 0;
  uint64_t v11 = [v9 dateForKey:v10 error:&v44];
  id v12 = v44;

  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v12 == 0;
  }
  int v14 = v13;
  if (v13)
  {
    id v15 = v11;
  }
  else if (a3)
  {
    id v15 = 0;
    *a3 = v12;
  }
  else
  {
    _HKLogDroppedError();
    id v15 = 0;
  }

  id v16 = v15;
  if (v14)
  {
    if (!v16) {
      goto LABEL_20;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    if (v18)
    {
      if (!objc_msgSend(v18, "hk_isAfterDate:", v16)) {
        goto LABEL_20;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v17 + 40), v15);
    [*(id *)(a1 + 48) didCompleteSuccessfulPushWithDate:v16];
LABEL_20:
    uint64_t v20 = *(void *)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    id v21 = [*(id *)(a1 + 48) profile];
    if (!v20)
    {
      id v7 = 0;
      goto LABEL_60;
    }
    id v22 = v19;
    id v23 = HDCloudSyncKeyValueDomainWithProfile(v21);
    v24 = HDCloudSyncLastSuccessfulPullKeyForContainerIdentifier((uint64_t)v22);

    id v44 = 0;
    uint64_t v25 = [v23 dateForKey:v24 error:&v44];
    id v26 = v44;

    if (v25) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = v26 == 0;
    }
    int v28 = v27;
    if (v27)
    {
      id v29 = v25;
    }
    else if (a3)
    {
      id v29 = 0;
      *a3 = v26;
    }
    else
    {
      _HKLogDroppedError();
      id v29 = 0;
    }

    id v7 = v29;
    if (v28)
    {
      if (!v7) {
        goto LABEL_40;
      }
      uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      if (v31)
      {
        if (!objc_msgSend(v31, "hk_isAfterDate:", v7)) {
          goto LABEL_40;
        }
        uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      }
      objc_storeStrong((id *)(v30 + 40), v29);
      [*(id *)(a1 + 48) didCompleteSuccessfulPullWithDate:v7];
LABEL_40:
      uint64_t v20 = *(void *)(a1 + 32);
      __int16 v32 = *(void **)(a1 + 40);
      v33 = [*(id *)(a1 + 48) profile];
      if (v20)
      {
        id v34 = v32;
        v35 = HDCloudSyncKeyValueDomainWithProfile(v33);
        v36 = HDCloudSyncLastSuccessfulLitePushKeyForContainerIdentifier((uint64_t)v34);

        id v44 = 0;
        v37 = [v35 dateForKey:v36 error:&v44];
        id v38 = v44;

        if (v37) {
          BOOL v39 = 1;
        }
        else {
          BOOL v39 = v38 == 0;
        }
        uint64_t v20 = v39;
        if (v39)
        {
          id v40 = v37;
        }
        else if (a3)
        {
          id v40 = 0;
          *a3 = v38;
        }
        else
        {
          _HKLogDroppedError();
          id v40 = 0;
        }
      }
      else
      {
        id v40 = 0;
      }
      id v21 = v40;

      if (!v20 || !v21) {
        goto LABEL_60;
      }
      uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
      v42 = *(void **)(v41 + 40);
      if (v42)
      {
        if (!objc_msgSend(v42, "hk_isAfterDate:", v21))
        {
LABEL_60:

LABEL_63:
          goto LABEL_64;
        }
        uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
      }
      objc_storeStrong((id *)(v41 + 40), v40);
      [*(id *)(a1 + 48) didCompleteSuccessfulLitePushWithDate:v21];
      goto LABEL_60;
    }
LABEL_62:
    uint64_t v20 = 0;
    goto LABEL_63;
  }
  uint64_t v20 = 0;
LABEL_64:

  return v20;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong(&self->_completion, 0);
}

@end