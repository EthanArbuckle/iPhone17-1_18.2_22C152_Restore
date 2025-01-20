@interface HDStaticSyncExportTask
- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4;
- (HDStaticSyncExportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6 batchSize:(unint64_t)a7;
- (NSURL)exportDirectoryURL;
- (id)runWithCompletion:(id)a3;
- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5;
- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5;
- (void)syncSessionWillBegin:(id)a3;
@end

@implementation HDStaticSyncExportTask

- (HDStaticSyncExportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6 batchSize:(unint64_t)a7
{
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDStaticSyncExportTask;
  v14 = [(HDStaticSyncTask *)&v18 initWithProfile:a3 options:a4 storeIdentifier:a5];
  if (v14)
  {
    uint64_t v15 = HKCreateSerialDispatchQueue();
    exportQueue = v14->_exportQueue;
    v14->_exportQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_exportDirectoryURL, a6);
    v14->_batchSize = a7;
  }

  return v14;
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
    v22 = "-[HDStaticSyncExportTask runWithCompletion:]";
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
  block[2] = __44__HDStaticSyncExportTask_runWithCompletion___block_invoke;
  block[3] = &unk_1E62F69F0;
  block[4] = self;
  id v18 = v4;
  id v11 = v5;
  id v17 = v11;
  id v12 = v4;
  dispatch_async(queue, block);
  id v13 = v17;
  id v14 = v11;

  return v14;
}

void __44__HDStaticSyncExportTask_runWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__49;
  v42 = __Block_byref_object_dispose__49;
  id v43 = 0;
  v2 = [_HDStaticSyncStore alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v3 = *(void *)(v3 + 24);
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  id v5 = (id)v3;
  v6 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  v7 = [(_HDStaticSyncStore *)v2 initWithProfile:WeakRetained storeIdentifier:v5 error:&obj];
  objc_storeStrong(v6, obj);

  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8 || (uint64_t v9 = *(void *)(v8 + 16), (v9 & 1) == 0))
  {
    v10 = objc_alloc_init(HDSyncAnchorMap);
    id v11 = (id *)(v39 + 5);
    id v36 = (id)v39[5];
    id v12 = v10;
    id v13 = objc_loadWeakRetained(v7 + 2);
    BOOL v14 = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:v12 store:v7 resetNext:1 resetInvalid:1 profile:v13 error:&v36];

    objc_storeStrong(v11, v36);
    if (!v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_32:

      goto LABEL_33;
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8)
    {
LABEL_21:
      objc_storeStrong((id *)(v8 + 64), *(id *)(a1 + 40));
      id v12 = [(HDSyncSession *)[_HDStaticSyncSession alloc] initWithSyncStore:v7 reason:@"Static Sync" delegate:*(void *)(a1 + 32)];
      [(HDSyncSession *)v12 setDatabaseAccessibilityTimeout:300.0];
      _HKInitializeLogging();
      __int16 v21 = (os_log_t *)MEMORY[0x1E4F29FA8];
      v22 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        __int16 v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          __int16 v25 = [(HDSyncSession *)v12 syncStore];
          *(_DWORD *)v50 = 138543618;
          *(void *)&v50[4] = v24;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v25;
          _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_INFO, "%{public}@: start performSyncSession: %{public}@", v50, 0x16u);
        }
      }
      uint64_t v26 = *(void *)(a1 + 32);
      if (v26) {
        id v27 = objc_loadWeakRetained((id *)(v26 + 8));
      }
      else {
        id v27 = 0;
      }
      v28 = [v27 syncEngine];
      v29 = (id *)(v39 + 5);
      id v34 = (id)v39[5];
      [v28 performSyncSession:v12 accessibilityAssertion:0 error:&v34];
      objc_storeStrong(v29, v34);

      _HKInitializeLogging();
      os_log_t v30 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
      {
        v31 = v30;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          v33 = [(HDSyncSession *)v12 syncStore];
          *(_DWORD *)v50 = 138543618;
          *(void *)&v50[4] = v32;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v33;
          _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_INFO, "%{public}@: finshed performSyncSession: %{public}@", v50, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_32;
    }
    uint64_t v9 = *(void *)(v8 + 16);
  }
  if ((v9 & 2) == 0) {
    goto LABEL_21;
  }
  *(void *)v50 = 0;
  *(void *)&v50[8] = v50;
  *(void *)&v50[16] = 0x2020000000;
  char v51 = 1;
  uint64_t v15 = *(NSObject **)(v8 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDStaticSyncExportTask_runWithCompletion___block_invoke_304;
  block[3] = &unk_1E62FA0E8;
  block[4] = v8;
  void block[5] = &v38;
  block[6] = v50;
  dispatch_sync(v15, block);
  int v16 = *(unsigned __int8 *)(*(void *)&v50[8] + 24);
  if (*(unsigned char *)(*(void *)&v50[8] + 24))
  {
    _HKInitializeLogging();
    id v17 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      id v18 = v17;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        v20 = [*(id *)(v19 + 112) path];
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v19;
        __int16 v46 = 2114;
        v47 = v7;
        __int16 v48 = 2114;
        v49 = v20;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: export static sync data to %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  _Block_object_dispose(v50, 8);
  if (v16)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    goto LABEL_21;
  }
LABEL_33:

  _Block_object_dispose(&v38, 8);
}

void __44__HDStaticSyncExportTask_runWithCompletion___block_invoke_304(void *a1)
{
  *(unsigned char *)(a1[4] + 48) = 1;
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(v2 + 112);
  uint64_t v5 = *(void *)(a1[5] + 8);
  v7 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  id obj = v7;
  id v8 = v3;
  id v9 = v4;
  self;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v11 = v9;
  id v12 = v11;
  if (!v11)
  {
    id v12 = [v10 temporaryDirectory];
  }
  id v13 = [NSString stringWithFormat:@"staticSync-%@", v8];
  BOOL v14 = [v12 URLByAppendingPathComponent:v13 isDirectory:1];
  [v10 removeItemAtURL:v14 error:0];
  id v15 = 0;
  if ([v10 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&obj])id v15 = v14; {

  }
  objc_storeStrong(v6, obj);
  uint64_t v16 = a1[4];
  id v17 = *(void **)(v16 + 112);
  *(void *)(v16 + 112) = v15;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 112) != 0;
}

uint64_t __82__HDStaticSyncExportTask__estimateSyncEntityClassesWithChangesForSession_profile___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [a1[4] syncStore];
  v6 = [v5 orderedSyncEntities];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v22 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 syncEntityIdentifier];
        id v12 = [a1[4] syncStore];
        int64_t v13 = +[HDSyncAnchorEntity syncAnchorOfType:0 entityIdentifier:v11 store:v12 profile:a1[5] error:a3];

        id v14 = a1[4];
        id v15 = a1[5];
        id v16 = v14;
        self;
        if (objc_opt_respondsToSelector()) {
          uint64_t v17 = [v10 nextSyncAnchorWithSession:v16 startSyncAnchor:v13 profile:v15 error:a3];
        }
        else {
          uint64_t v17 = [v10 nextSyncAnchorWithSession:v16 predicate:0 startSyncAnchor:v13 profile:v15 error:a3];
        }
        uint64_t v18 = v17;

        if (v13 < 0 || v18 < 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Invalid anchor(s) (%lld, %lld) for %@", v13, v18, v10);
          uint64_t v19 = 0;
          goto LABEL_17;
        }
        if (v18 != v13) {
          [a1[6] addObject:v10];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 1;
LABEL_17:

  return v19;
}

- (void)syncSessionWillBegin:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    uint64_t v7 = [v4 syncStore];
    *(_DWORD *)buf = 138543874;
    int64_t v13 = self;
    __int16 v14 = 2080;
    id v15 = "-[HDStaticSyncExportTask syncSessionWillBegin:]";
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", buf, 0x20u);
  }
  exportQueue = self->_exportQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__HDStaticSyncExportTask_syncSessionWillBegin___block_invoke;
  v10[3] = &unk_1E62F31C0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(exportQueue, v10);
}

void __47__HDStaticSyncExportTask_syncSessionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    *(void *)(v2 + 96) = 0;
    *(void *)(*(void *)(a1 + 32) + 104) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    if (!v2)
    {
      id WeakRetained = 0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
LABEL_6:
  id v5 = v3;
  id v6 = WeakRetained;
  uint64_t v7 = self;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [v6 database];
  id v29 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__HDStaticSyncExportTask__estimateSyncEntityClassesWithChangesForSession_profile___block_invoke;
  v24[3] = &unk_1E62F2E18;
  id v10 = v5;
  id v25 = v10;
  id v11 = v6;
  id v26 = v11;
  uint64_t v28 = v7;
  id v12 = v8;
  id v27 = v12;
  BOOL v13 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:&v29 block:v24];
  id v14 = v29;

  if (v13)
  {
    id v23 = v12;
  }
  else
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v7;
      __int16 v32 = 2114;
      id v33 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: error estimating (for progress reporting) sync entity classes with changes to sync: %{public}@", buf, 0x16u);
    }
    __int16 v16 = [v10 syncStore];
    id v23 = [v16 orderedSyncEntities];
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(v23, "count"), *(void *)(*(void *)(a1 + 32) + 64), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "totalUnitCount"));
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 72);
  *(void *)(v18 + 72) = v17;

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 80);
  *(void *)(v21 + 80) = v20;
}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    BOOL v13 = [v8 syncStore];
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2080;
    id v25 = "-[HDStaticSyncExportTask syncSession:sendChanges:completion:]";
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", buf, 0x20u);
  }
  exportQueue = self->_exportQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__HDStaticSyncExportTask_syncSession_sendChanges_completion___block_invoke;
  v18[3] = &unk_1E62F2F48;
  v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(exportQueue, v18);
}

void __61__HDStaticSyncExportTask_syncSession_sendChanges_completion___block_invoke(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    id v5 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 40));
    if (!*(void *)(v2 + 88))
    {
      *(void *)(v2 + 96) = 0;
      id v6 = *(void **)(v2 + 112);
      uint64_t v7 = *(void *)(v2 + 104);
      id v8 = v5;
      id v9 = v6;
      self;
      id v10 = NSString;
      id v11 = [v8 sessionUUID];

      id v12 = [v10 stringWithFormat:@"syncarchive-%@-%llu", v11, v7];

      BOOL v13 = [v9 URLByAppendingPathComponent:v12];

      id v14 = [v13 URLByAppendingPathExtension:@"zip"];

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F2B850]) initWithURL:v14 archiveType:0];
      id v16 = *(void **)(v2 + 88);
      *(void *)(v2 + 88) = v15;

      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = v17;
        id v19 = [v8 syncStore];
        id v20 = [*(id *)(v2 + 88) archiveURL];
        id v21 = [v20 path];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        __int16 v94 = 2114;
        v95 = v21;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: create archive %{public}@", buf, 0x20u);
      }
    }
    uint64_t v22 = *(void **)(v2 + 88);
    id v23 = v4;
    self;
    __int16 v24 = +[HDCodableStaticSyncChangeSet changeSetWithChanges:v23];

    id v25 = [v24 data];

    uint64_t v26 = *(void *)(v2 + 96);
    self;
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"/changeset-%04llu", v26);
    uint64_t v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27 isDirectory:0];

    [v22 addDataToArchive:v25 pathInArchive:v28];
    ++*(void *)(v2 + 96);
    if (*(void *)(v2 + 56))
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      os_log_t v30 = [*(id *)(v2 + 88) archiveURL];
      uint64_t v31 = [v30 path];
      *(void *)buf = 0;
      __int16 v32 = [v29 attributesOfItemAtPath:v31 error:buf];
      id v33 = *(id *)buf;

      if (v32)
      {
        if ((unint64_t)[v32 fileSize] <= *(void *)(v2 + 56))
        {
          v35 = 0;
          uint64_t v36 = 1;
        }
        else
        {
          [*(id *)(v2 + 88) closeArchive];
          uint64_t v34 = *(void **)(v2 + 88);
          *(void *)(v2 + 88) = 0;

          v35 = 0;
          ++*(void *)(v2 + 104);
          uint64_t v36 = 2;
        }
      }
      else
      {
        id v37 = v33;
        v35 = v37;
        if (v37) {
          id v38 = v37;
        }

        uint64_t v36 = 0;
      }
    }
    else
    {
      v35 = 0;
      uint64_t v36 = 1;
    }

    v39 = v35;
    uint64_t v40 = v39;
    if (!v36)
    {
      v83 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_48;
    }
  }
  uint64_t v40 = objc_alloc_init(HDSyncAnchorRangeMap);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v41 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
  if (!v41) {
    goto LABEL_43;
  }
  uint64_t v42 = v41;
  id v43 = &selRef_startFakingWithHKWorkoutActivityType_;
  uint64_t v87 = *(void *)v89;
  v85 = v40;
  while (2)
  {
    uint64_t v44 = 0;
    v84 = v43[294];
    do
    {
      if (*(void *)v89 != v87) {
        objc_enumerationMutation(obj);
      }
      uint64_t v45 = *(void **)(*((void *)&v88 + 1) + 8 * v44);
      __int16 v46 = *(void **)(*(void *)(a1 + 32) + 80);
      v47 = [v45 syncEntityIdentifier];
      LOBYTE(v46) = [v46 containsObject:v47];

      if ((v46 & 1) == 0)
      {
        __int16 v48 = *(void **)(*(void *)(a1 + 32) + 80);
        v49 = [v45 syncEntityIdentifier];
        [v48 addObject:v49];

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "count"));
      }
      v50 = v40;
      id v51 = v45;
      self;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v52 = [v51 syncEntityIdentifier];
      BOOL v53 = [(HDSyncAnchorRangeMap *)v50 getAnchorRange:buf forSyncEntityIdentifier:v52];

      if (!v53)
      {
        uint64_t v55 = [v51 syncAnchorRange];
        uint64_t v57 = v56;
        v58 = [v51 syncEntityIdentifier];
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v50, "setAnchorRange:forSyncEntityIdentifier:", v55, v57, v58);
        v59 = 0;
        char v60 = 1;
        goto LABEL_40;
      }
      v54 = [v51 sequenceNumber];
      if ([v54 integerValue])
      {
      }
      else
      {
        uint64_t v61 = [v51 syncAnchorRange];
        uint64_t v62 = *(void *)&buf[8];

        if (v61 != v62)
        {
          v73 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v74 = objc_opt_class();
          uint64_t v75 = [v51 syncAnchorRange];
          uint64_t v76 = *(void *)&buf[8];
          v58 = [v51 sequenceNumber];
          objc_msgSend(v73, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v74, v84, @"startAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"", v75, v76, v58);
LABEL_36:
          id v77 = (id)objc_claimAutoreleasedReturnValue();
          v59 = v77;
          if (v77) {
            id v78 = v77;
          }

          char v60 = 0;
          goto LABEL_39;
        }
      }
      v63 = [v51 sequenceNumber];
      if ([v63 integerValue] < 1)
      {
      }
      else
      {
        [v51 syncAnchorRange];
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)&buf[8];

        if (v65 != v66)
        {
          v67 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v68 = objc_opt_class();
          [v51 syncAnchorRange];
          uint64_t v70 = v69;
          uint64_t v71 = *(void *)&buf[8];
          v58 = [v51 sequenceNumber];
          objc_msgSend(v67, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v68, v84, @"endAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"", v70, v71, v58);
          goto LABEL_36;
        }
      }
      [v51 syncAnchorRange];
      *(void *)&buf[8] = v72;
      v58 = [v51 syncEntityIdentifier];
      -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v50, "setAnchorRange:forSyncEntityIdentifier:", *(void *)buf, *(void *)&buf[8], v58);
      v59 = 0;
      char v60 = 1;
LABEL_39:
      uint64_t v40 = v85;
LABEL_40:

      id v79 = v59;
      v80 = v79;
      if ((v60 & 1) == 0)
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        uint64_t v40 = v50;
        goto LABEL_49;
      }

      ++v44;
    }
    while (v42 != v44);
    uint64_t v42 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
    id v43 = &selRef_startFakingWithHKWorkoutActivityType_;
    if (v42) {
      continue;
    }
    break;
  }
LABEL_43:

  _HKInitializeLogging();
  v81 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    uint64_t v82 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v82;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v40;
    _os_log_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_INFO, "%{public}@: sendChanges for anchor ranges %{public}@", buf, 0x16u);
  }
  v83 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_48:
  v83();
LABEL_49:
}

- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    id v8 = [v5 syncStore];
    int v10 = 138543874;
    id v11 = self;
    __int16 v12 = 2080;
    BOOL v13 = "-[HDStaticSyncExportTask syncSession:didEndTransactionWithError:]";
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  return 1;
}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  int v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    uint64_t v12 = [v8 syncStore];
    BOOL v13 = (void *)v12;
    __int16 v14 = @"NO";
    *(_DWORD *)buf = 138544386;
    __int16 v19 = 2080;
    id v20 = "-[HDStaticSyncExportTask syncSession:didFinishSuccessfully:error:]";
    uint64_t v18 = self;
    __int16 v21 = 2114;
    if (v6) {
      __int16 v14 = @"YES";
    }
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    __int16 v24 = v14;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@: success: %{public}@, error: %{public}@", buf, 0x34u);
  }
  exportQueue = self->_exportQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HDStaticSyncExportTask_syncSession_didFinishSuccessfully_error___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(exportQueue, block);
}

uint64_t __66__HDStaticSyncExportTask_syncSession_didFinishSuccessfully_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    [*(id *)(v2 + 88) closeArchive];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = [*(id *)(v2 + 72) totalUnitCount];
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v6 setCompletedUnitCount:v5];
}

- (NSURL)exportDirectoryURL
{
  return self->_exportDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportDirectoryURL, 0);
  objc_storeStrong((id *)&self->_archiveCreator, 0);
  objc_storeStrong((id *)&self->_syncEntityIdentifiersWithProcessedChanges, 0);
  objc_storeStrong((id *)&self->_syncSessionProgress, 0);
  objc_storeStrong((id *)&self->_exportProgress, 0);

  objc_storeStrong((id *)&self->_exportQueue, 0);
}

@end