@interface HDStaticSyncImportTask
- (HDStaticSyncImportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6;
- (id)runWithCompletion:(id)a3;
@end

@implementation HDStaticSyncImportTask

- (HDStaticSyncImportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HDStaticSyncImportTask;
  v12 = [(HDStaticSyncTask *)&v15 initWithProfile:a3 options:a4 storeIdentifier:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_importDirectoryURL, a6);
  }

  return v13;
}

- (id)runWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1000];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    if (self) {
      v7 = self->super._storeIdentifier;
    }
    else {
      v7 = 0;
    }
    v8 = v6;
    v9 = HKStaticSyncOptionsToString();
    *(_DWORD *)buf = 138544130;
    v20 = self;
    __int16 v21 = 2080;
    v22 = "-[HDStaticSyncImportTask runWithCompletion:]";
    __int16 v23 = 2114;
    v24 = v7;
    __int16 v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "%{public}@: %s: storeIdentifier = %{public}@, options = %{public}@", buf, 0x2Au);
  }
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDStaticSyncImportTask_runWithCompletion___block_invoke;
  block[3] = &unk_1E62F69F0;
  block[4] = self;
  id v18 = v4;
  id v11 = v5;
  id v17 = v11;
  id v12 = v4;
  dispatch_async(queue, block);
  v13 = v17;
  id v14 = v11;

  return v14;
}

void __44__HDStaticSyncImportTask_runWithCompletion___block_invoke(void *a1)
{
  v72[1] = *MEMORY[0x1E4F143B8];
  v2 = [_HDStaticSyncStore alloc];
  uint64_t v3 = a1[4];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    uint64_t v3 = a1[4];
    if (v3) {
      uint64_t v3 = *(void *)(v3 + 24);
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  v55[0] = 0;
  id v5 = (id)v3;
  v6 = [(_HDStaticSyncStore *)v2 initWithProfile:WeakRetained storeIdentifier:v5 error:v55];
  id v7 = v55[0];

  if (v6)
  {
    uint64_t v8 = a1[4];
    if (!v8 || (*(unsigned char *)(v8 + 16) & 1) == 0)
    {
      id v54 = v7;
      id v9 = objc_loadWeakRetained(v6 + 2);
      BOOL v10 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:3 store:v6 profile:v9 error:&v54];

      id v11 = v54;
      if (!v10)
      {
        (*(void (**)(void))(a1[6] + 16))();
        id v7 = v11;
        goto LABEL_30;
      }
      uint64_t v8 = a1[4];
      id v7 = v11;
    }
    id v12 = (void *)a1[5];
    v13 = (void *)a1[6];
    id v14 = *(id *)(v8 + 40);
    objc_super v15 = v6;
    id v16 = v12;
    id v17 = v13;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 32));
    id v18 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v64 = 0;
    v19 = [v18 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:4 error:&v64];
    id v20 = v64;
    __int16 v21 = v20;
    if (v19)
    {
      id v47 = v20;
      id v48 = v18;
      v50 = v6;
      id v51 = v16;
      id v49 = v7;
      v22 = objc_msgSend(v19, "hk_filter:", &__block_literal_global_53);

      if ([v22 count])
      {
        v45 = v17;
        id v46 = v14;
        v44 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"path" ascending:1];
        v72[0] = v44;
        __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
        v24 = [v22 sortedArrayUsingDescriptors:v23];

        __int16 v25 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(v24, "count"), v16, 1000);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v26 = v24;
        uint64_t v53 = [v26 countByEnumeratingWithState:&v60 objects:v71 count:16];
        if (v53)
        {
          uint64_t v27 = *(void *)v61;
          uint64_t v52 = *(void *)v61;
          while (2)
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v61 != v27) {
                objc_enumerationMutation(v26);
              }
              v29 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              _HKInitializeLogging();
              v30 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
              {
                id v31 = v26;
                v32 = v15;
                id v33 = v15[3];
                v34 = v25;
                id v35 = v33;
                v36 = v30;
                v37 = [v29 path];
                *(_DWORD *)buf = 138543874;
                uint64_t v66 = v8;
                __int16 v67 = 2114;
                v68 = v33;
                objc_super v15 = v32;
                id v26 = v31;
                __int16 v69 = 2114;
                v70 = v37;
                _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: extract archive %{public}@", buf, 0x20u);

                __int16 v25 = v34;
                uint64_t v27 = v52;
              }
              id v59 = 0;
              v55[1] = (id)MEMORY[0x1E4F143A8];
              v55[2] = (id)3221225472;
              v55[3] = __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke_454;
              v55[4] = &unk_1E62FA130;
              v55[5] = v29;
              v56 = v15;
              uint64_t v57 = v8;
              id v58 = v25;
              char v38 = HKWithAutoreleasePool();
              id v39 = v59;
              if ((v38 & 1) == 0)
              {
                id v17 = v45;
                v45[2](v45, 0, v39);

                goto LABEL_26;
              }
            }
            uint64_t v53 = [v26 countByEnumeratingWithState:&v60 objects:v71 count:16];
            if (v53) {
              continue;
            }
            break;
          }
        }

        id v17 = v45;
        v45[2](v45, 1, 0);
LABEL_26:

        id v7 = v49;
        v6 = v50;
        id v14 = v46;
      }
      else
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = objc_opt_class();
        v42 = [v14 path];
        v43 = objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v41, sel__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion_, @"%@ contains no data files that can be imported"", v42);
        v17[2](v17, 0, v43);

        id v7 = v49;
        v6 = v50;
      }
      id v16 = v51;
      __int16 v21 = v47;
      id v18 = v48;
    }
    else
    {
      v17[2](v17, 0, v20);
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
LABEL_30:
}

uint64_t __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 pathExtension];
  if ([v3 isEqualToString:@"zip"])
  {
    id v4 = [v2 path];
    id v5 = [v4 lastPathComponent];
    uint64_t v6 = [v5 hasPrefix:@"syncarchive-"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke_454(void *a1, void *a2)
{
  id v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  uint64_t v6 = a1[6];
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v8 = (void *)a1[7];
  id v9 = v5;
  id v10 = v4;
  id v11 = WeakRetained;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F2B9C8]) initWithURL:v9];
  objc_super v15 = [v14 numberOfEntriesWithError:0];
  uint64_t v16 = [v15 integerValue];

  id v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v16 parent:v12 pendingUnitCount:1];
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__49;
  char v38 = __Block_byref_object_dispose__49;
  id v39 = 0;
  uint64_t v32 = v13;
  id v33 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__HDStaticSyncImportTask__extractChangeArchive_syncStore_profile_progress_error___block_invoke;
  v26[3] = &unk_1E62FA158;
  id v18 = v10;
  id v27 = v18;
  v30 = &v40;
  id v31 = &v34;
  id v19 = v11;
  id v28 = v19;
  id v20 = v17;
  id v29 = v20;
  uint64_t v21 = [v14 enumerateEntriesWithError:&v33 block:v26];
  id v22 = v33;
  *((unsigned char *)v41 + 24) = v21;
  if ((v21 & 1) == 0)
  {
    id v23 = (id)v35[5];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        *a2 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v21;
}

void __81__HDStaticSyncImportTask__extractChangeArchive_syncStore_profile_progress_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    if (v6) {
      id v7 = *(void **)(v6 + 24);
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = a1[9];
    id v9 = v7;
    id v10 = v5;
    id v11 = [v4 pathname];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v34 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: ingest file %{public}@", buf, 0x20u);
  }
  id v12 = v4;
  self;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__49;
  id v35 = __Block_byref_object_dispose__49;
  id v36 = 0;
  id v13 = v12;
  if (HKWithAutoreleasePool()) {
    id v14 = *(id *)(*(void *)&buf[8] + 40);
  }
  else {
    id v14 = 0;
  }

  _Block_object_dispose(buf, 8);
  id v15 = 0;
  uint64_t v16 = v15;
  if (v14)
  {
    id v17 = (void *)a1[4];
    id v18 = (void *)a1[5];
    id v19 = (void *)a1[6];
    id v20 = v14;
    id v21 = v17;
    id v22 = v18;
    id v23 = v19;
    uint64_t v24 = self;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __73__HDStaticSyncImportTask__applySyncChanges_store_profile_progress_error___block_invoke;
    uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62FA180;
    id v35 = v22;
    id v36 = v20;
    id v38 = v21;
    uint64_t v39 = v24;
    id v37 = v23;
    id v25 = v21;
    id v26 = v23;
    id v27 = v20;
    id v28 = v22;
    LOBYTE(v20) = HKWithAutoreleasePool();

    id v29 = 0;
    if ((v20 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      *a3 = 1;
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), 0);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
    uint64_t v30 = *(void *)(a1[8] + 8);
    id v31 = v15;
    id v29 = *(id *)(v30 + 40);
    *(void *)(v30 + 40) = v31;
  }
}

BOOL __57__HDStaticSyncImportTask__extractChangesFromEntry_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  id v12 = 0;
  id v5 = [v4 dataWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    if (a2) {
      *a2 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }
  else
  {
    id v7 = [[HDCodableStaticSyncChangeSet alloc] initWithData:v5];
    uint64_t v8 = [(HDCodableStaticSyncChangeSet *)v7 changes];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return v6 == 0;
}

uint64_t __73__HDStaticSyncImportTask__applySyncChanges_store_profile_progress_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = [*(id *)(a1 + 32) syncEngine];
  uint64_t v4 = 1;
  id v26 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(*(id *)(a1 + 40), "count"), *(void *)(a1 + 48), 1);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v24 = a2;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = [*(id *)(a1 + 32) syncEngine];
        id v12 = [v11 allSyncEntitiesByIdentifier];
        id v13 = [v10 syncEntityIdentifier];
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        if (v14)
        {
          uint64_t v15 = *(void *)(a1 + 56);
          id v28 = 0;
          char v16 = [v27 applySyncChange:v10 forStore:v15 error:&v28];
          id v17 = v28;
          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            id v20 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v34 = v10;
              __int16 v35 = 2114;
              id v36 = v17;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "failed to apply request change %{public}@: %{public}@", buf, 0x16u);
            }
            id v21 = v17;
            id v22 = v21;
            if (v21)
            {
              if (v24) {
                void *v24 = v21;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v4 = 0;
            goto LABEL_21;
          }
          [v26 setCompletedUnitCount:v7 + i + 1];
        }
        else
        {
          _HKInitializeLogging();
          id v18 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            id v19 = *(void **)(a1 + 64);
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v19;
            __int16 v35 = 2114;
            id v36 = v10;
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: cannot apply change %{public}@ because it is for an unknown (possibly future) sync entity.", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      v7 += i;
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v4 = 1;
  }
LABEL_21:

  return v4;
}

- (void).cxx_destruct
{
}

@end