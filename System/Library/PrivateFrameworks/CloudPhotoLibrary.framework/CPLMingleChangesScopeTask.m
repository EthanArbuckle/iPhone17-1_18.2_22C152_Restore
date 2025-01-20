@interface CPLMingleChangesScopeTask
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (CPLMingleChangesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)_filteredBatchByStashingRecordsIfNecessary:(id)a3 error:(id *)a4;
- (id)taskIdentifier;
- (void)_acknownledgeFixUpTasks:(id)a3;
- (void)_finishMingling;
- (void)_fixUpPrivateRecordsPointingToRemappedSharedRecords:(id)a3;
- (void)_mingleOtherChanges;
- (void)_mingleRemappings;
- (void)_mingleSharedRemappings;
- (void)_noteBatchWasAddedInPullQueue:(id)a3 fromBatch:(id)a4 transaction:(id)a5;
- (void)_notifySchedulerPullQueueIsFullInTransaction:(id)a3;
- (void)_notifySchedulerPullQueueIsFullNowIfNecessary;
- (void)_reallyNotifySchedulerPullQueueIsFull;
- (void)_unstashRecordsForScope:(id)a3;
- (void)cancel;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
- (void)transientRepository:(id)a3 didResetMingledRecordsForScopesWithFiler:(id)a4;
@end

@implementation CPLMingleChangesScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fixUpTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_extractionStrategy, 0);
  objc_storeStrong((id *)&self->_batchStorage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)transientRepository:(id)a3 didResetMingledRecordsForScopesWithFiler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!self->_minglingHasBeenReset)
  {
    v6 = [(CPLEngineScopedTask *)self scope];
    v7 = [v6 scopeIdentifier];
    char v8 = [v5 filterOnScopeIdentifier:v7];

    if ((v8 & 1) != 0
      || (sharedScope = self->_sharedScope) != 0
      && ([(CPLEngineScope *)sharedScope scopeIdentifier],
          v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v5 filterOnScopeIdentifier:v10],
          v10,
          (v11 & 1) != 0))
    {
      self->_minglingHasBeenReset = 1;
    }
    else if (!self->_minglingHasBeenReset)
    {
      goto LABEL_12;
    }
    if (!_CPLSilentLogging)
    {
      v12 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(CPLEngineScopedTask *)self scope];
        int v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Mingling has been reset for %@ - will need to restart", (uint8_t *)&v14, 0xCu);
      }
    }
    [(CPLMingleChangesScopeTask *)self cancel];
  }
LABEL_12:
}

- (id)taskIdentifier
{
  return @"engine.sync.mingle";
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLMingleChangesScopeTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CPLMingleChangesScopeTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13375;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  id v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __35__CPLMingleChangesScopeTask_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) cancel];
}

- (void)launch
{
  v23.receiver = self;
  v23.super_class = (Class)CPLMingleChangesScopeTask;
  [(CPLEngineSyncTask *)&v23 launch];
  v3 = [(CPLEngineSyncTask *)self engineLibrary];
  v4 = [v3 scheduler];
  [v4 willRunEngineElement:CPLEngineElementMingling];

  id v5 = [(CPLEngineScopedTask *)self store];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_block_t v6 = [(CPLEngineScopedTask *)self scope];
  v7 = [v5 transientPullRepository];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke;
  v15[3] = &unk_1E60AAFF0;
  id v8 = v7;
  id v16 = v8;
  v17 = self;
  id v9 = v5;
  id v18 = v9;
  id v19 = v6;
  v20 = v21;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke_3;
  v12[3] = &unk_1E60AB040;
  v12[4] = self;
  int v14 = v21;
  id v10 = v19;
  id v13 = v10;
  id v11 = (id)[v9 performWriteTransactionWithBlock:v15 completionHandler:v12];

  _Block_object_dispose(v21, 8);
}

void __35__CPLMingleChangesScopeTask_launch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) checkScopeIsValidInTransaction:v3])
  {
    v4 = [*(id *)(a1 + 48) scopes];
    uint64_t v5 = [v4 sharingScopeForScope:*(void *)(a1 + 56)];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 128);
    *(void *)(v6 + 128) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    if (*(void *)(v8 + 128))
    {
      int v9 = objc_msgSend(v4, "valueForFlag:forScope:", 36);
      uint64_t v8 = *(void *)(a1 + 40);
      if (v9)
      {
        id v10 = *(void **)(v8 + 128);
        *(void *)(v8 + 128) = 0;

        uint64_t v8 = *(void *)(a1 + 40);
      }
    }
    if (*(void *)(v8 + 128) && !*(void *)(v8 + 136))
    {
      id v11 = [CPLTransportScopeMapping alloc];
      v12 = [*(id *)(a1 + 40) engineLibrary];
      id v13 = [v12 transport];
      uint64_t v14 = [(CPLTransportScopeMapping *)v11 initWithTranslator:v13];
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(v15 + 136);
      *(void *)(v15 + 136) = v14;

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke_2;
      v23[3] = &unk_1E60AAF20;
      v23[4] = *(void *)(a1 + 40);
      id v24 = *(id *)(a1 + 56);
      id v25 = *(id *)(a1 + 48);
      [v3 do:v23];
    }
    v17 = *(void **)(a1 + 32);
    id v18 = [*(id *)(a1 + 56) scopeIdentifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v17 hasStashedChangesForScopeWithIdentifier:v18];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v19 = *(void **)(*(void *)(a1 + 40) + 128);
      if (v19)
      {
        v20 = *(void **)(a1 + 32);
        v21 = [v19 scopeIdentifier];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v20 hasStashedChangesForScopeWithIdentifier:v21];
      }
    }
    if ([v4 shouldTrackAdditionalInitialSyncDatesForScope:*(void *)(a1 + 56)])
    {
      char v22 = [v4 initialMingleDateForScope:*(void *)(a1 + 56)];
      *(unsigned char *)(*(void *)(a1 + 40) + 184) = v22 == 0;
    }
  }
}

void __35__CPLMingleChangesScopeTask_launch__block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v9 error];
    [v4 taskDidFinishWithError:v5];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v7];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [v8 _unstashRecordsForScope:*(void *)(a1 + 40)];
    }
    else {
      [v8 _mingleRemappings];
    }
  }
}

uint64_t __35__CPLMingleChangesScopeTask_launch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v5 = [*(id *)(a1 + 48) scopes];
  uint64_t v6 = [v4 addTransportScopeForScope:v3 scopes:v5 allowsTentativeTransportScope:0 useStagingScopeIfNecessary:0 error:a2];

  return v6;
}

- (void)_unstashRecordsForScope:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineScopedTask *)self store];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke;
  v11[3] = &unk_1E60AB040;
  v11[4] = self;
  id v12 = v4;
  id v13 = v14;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_3;
  v8[3] = &unk_1E60AB040;
  v8[4] = self;
  id v10 = v14;
  id v6 = v12;
  id v9 = v6;
  id v7 = (id)[v5 performWriteTransactionWithBlock:v11 completionHandler:v8];

  _Block_object_dispose(v14, 8);
}

void __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) store];
    uint64_t v5 = [v4 transientPullRepository];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_2;
    v9[3] = &unk_1E60AB850;
    id v10 = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = v6;
    uint64_t v12 = v7;
    id v8 = v5;
    [v3 do:v9];
  }
}

void __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v13 error];
    [v4 taskDidFinishWithError:v5];

    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v7];

    goto LABEL_11;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
LABEL_7:
    [v8 _unstashRecordsForScope:v9];
    goto LABEL_11;
  }
  id v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) scope];
  if (v10 == v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 128);

    if (v12)
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = v8[16];
      goto LABEL_7;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) _mingleRemappings];
LABEL_11:
}

uint64_t __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) scopeIdentifier];
  uint64_t v6 = [v4 unstashRecordsForScopeWithIdentifier:v5 maxCount:1000 hasMore:*(void *)(*(void *)(a1 + 48) + 8) + 24 error:a2];

  return v6;
}

- (void)_mingleRemappings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineSyncTask *)self diskPressureState] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28568];
    char v15 = @"Not enough disk space";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v6 = (id)[v4 initWithDomain:*MEMORY[0x1E4F281F8] code:640 userInfo:v5];

    [(CPLMingleChangesScopeTask *)self taskDidFinishWithError:v6];
  }
  else
  {
    uint64_t v7 = [(CPLEngineSyncTask *)self engineLibrary];
    id v8 = [v7 store];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke;
    v11[3] = &unk_1E60AB040;
    v11[4] = self;
    id v6 = v8;
    id v12 = v6;
    p_long long buf = &buf;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_4;
    v10[3] = &unk_1E60AB878;
    v10[4] = self;
    v10[5] = &buf;
    id v9 = (id)[v6 performWriteTransactionWithBlock:v11 completionHandler:v10];

    _Block_object_dispose(&buf, 8);
  }
}

void __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) store];
    uint64_t v5 = [v4 transientPullRepository];

    id v6 = [*(id *)(a1 + 32) scope];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_2;
    v12[3] = &unk_1E60A8E60;
    id v13 = v5;
    id v14 = v6;
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v7;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 48);
    id v17 = v8;
    uint64_t v18 = v9;
    id v10 = v6;
    id v11 = v5;
    [v8 do:v12];
  }
}

void __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[CPLErrors operationCancelledError];
LABEL_5:
    id v6 = (void *)v4;
    [v3 taskDidFinishWithError:v4];

    goto LABEL_6;
  }
  uint64_t v5 = [v8 error];

  if (v5)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v8 error];
    goto LABEL_5;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v7 _mingleRemappings];
  }
  else if (v7[16])
  {
    [v7 _mingleSharedRemappings];
  }
  else
  {
    [v7 _mingleOtherChanges];
  }
LABEL_6:
}

BOOL __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "nextBatchOfRemappedRecordsInScope:maximumCount:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "maximumCountOfRecordsInBatches"));
  if ([v4 count])
  {
    *(void *)(*(void *)(a1 + 48) + 176) += [v4 count];
    uint64_t v5 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_3;
    v9[3] = &unk_1E60A8DE8;
    uint64_t v6 = *(void *)(a1 + 40);
    void v9[4] = *(void *)(a1 + 48);
    id v10 = v4;
    id v11 = *(id *)(a1 + 64);
    BOOL v7 = +[CPLMingleUtility mingleRemappedBatch:v10 scope:v6 forStore:v5 onPutBatchInPullQueue:v9 error:a2];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)_mingleSharedRemappings
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineSyncTask *)self diskPressureState] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = @"Not enough disk space";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v6 = (id)[v4 initWithDomain:*MEMORY[0x1E4F281F8] code:640 userInfo:v5];

    [(CPLMingleChangesScopeTask *)self taskDidFinishWithError:v6];
  }
  else
  {
    BOOL v7 = [(CPLEngineSyncTask *)self engineLibrary];
    id v8 = [v7 store];

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__13388;
    char v22 = __Block_byref_object_dispose__13389;
    id v23 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke;
    v11[3] = &unk_1E60AB1F8;
    v11[4] = self;
    id v6 = v8;
    id v12 = v6;
    p_long long buf = &buf;
    id v14 = v15;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_4;
    v10[3] = &unk_1E60AB7F0;
    v10[4] = self;
    v10[5] = &buf;
    void v10[6] = v15;
    id v9 = (id)[v6 performWriteTransactionWithBlock:v11 completionHandler:v10];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v15, 8);
  }
}

void __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) store];
    uint64_t v5 = [v4 transientPullRepository];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_2;
    v9[3] = &unk_1E60A8E38;
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = *(void **)(a1 + 40);
    id v10 = v5;
    uint64_t v11 = v6;
    id v12 = v7;
    id v13 = v3;
    long long v14 = *(_OWORD *)(a1 + 48);
    id v8 = v5;
    [v13 do:v9];
  }
}

void __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[CPLErrors operationCancelledError];
LABEL_5:
    uint64_t v6 = (void *)v4;
    [v3 taskDidFinishWithError:v4];

    goto LABEL_6;
  }
  uint64_t v5 = [v8 error];

  if (v5)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v8 error];
    goto LABEL_5;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    [*(id *)(a1 + 32) _fixUpPrivateRecordsPointingToRemappedSharedRecords:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [v7 _mingleSharedRemappings];
    }
    else {
      [v7 _mingleOtherChanges];
    }
  }
LABEL_6:
}

BOOL __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "nextBatchOfRemappedRecordsInScope:maximumCount:", *(void *)(*(void *)(a1 + 40) + 128), objc_msgSend(*(id *)(a1 + 32), "maximumCountOfRecordsInBatches"));
  if ([v4 count])
  {
    *(void *)(*(void *)(a1 + 40) + 176) += [v4 count];
    uint64_t v5 = [*(id *)(a1 + 40) scope];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(v6 + 128);
    id v16 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_3;
    v13[3] = &unk_1E60A8DE8;
    v13[4] = v6;
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    BOOL v9 = +[CPLMingleUtility mingleSharedRemappedBatch:v14 scope:v5 sharedScope:v8 forStore:v7 fixUpTasks:&v16 onPutBatchInPullQueue:v13 error:a2];
    id v10 = v16;
    id v11 = v16;

    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    BOOL v9 = 1;
  }

  return v9;
}

uint64_t __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)_fixUpPrivateRecordsPointingToRemappedSharedRecords:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke;
  v10[3] = &unk_1E60A6728;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13375;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = lock;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) engineLibrary];
  id v3 = [v2 transport];

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 136);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke_2;
  id v16 = &unk_1E60AB438;
  uint64_t v17 = v5;
  id v18 = v4;
  uint64_t v7 = [v3 fixUpSparseRecordsTaskWithTasks:v18 transportScopeMapping:v6 completionHandler:&v13];
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_block_t v9 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = v7;

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[18];
  id v12 = objc_msgSend(v3, "createGroupForFixUpTasks", v13, v14, v15, v16, v17);
  [v10 launchTransportTask:v11 withTransportGroup:v12];
}

void __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) engineLibrary];
  uint64_t v5 = [v4 scheduler];
  [v5 noteServerHasChanges];

  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138412546;
        uint64_t v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Failed to fix %@: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    [*(id *)(a1 + 32) taskDidFinishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 32) _acknownledgeFixUpTasks:*(void *)(a1 + 40)];
  }
}

- (void)_acknownledgeFixUpTasks:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CPLEngineSyncTask *)self diskPressureState] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = self;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    id v18 = @"Not enough disk space";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v9 = (id)[v6 initWithDomain:v7 code:640 userInfo:v8];

    [(CPLMingleChangesScopeTask *)self taskDidFinishWithError:v9];
  }
  else
  {
    __int16 v10 = [(CPLEngineSyncTask *)self engineLibrary];
    id v11 = [v10 store];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke;
    void v14[3] = &unk_1E60AB068;
    v14[4] = self;
    id v15 = v4;
    id v16 = v11;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_4;
    v13[3] = &unk_1E60AB578;
    v13[4] = self;
    id v9 = v11;
    id v12 = (id)[v9 performWriteTransactionWithBlock:v14 completionHandler:v13];
  }
}

void __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] checkScopeIsValidInTransaction:v3])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_2;
    v6[3] = &unk_1E60AB778;
    id v4 = a1[5];
    id v5 = a1[4];
    id v7 = v4;
    id v8 = v5;
    id v9 = a1[6];
    id v10 = v3;
    [v10 do:v6];
  }
}

void __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[CPLErrors operationCancelledError];
LABEL_5:
    id v6 = (void *)v4;
    [v3 taskDidFinishWithError:v4];

    goto LABEL_7;
  }
  id v5 = [v7 error];

  id v3 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v4 = [v7 error];
    goto LABEL_5;
  }
  [v3 _mingleSharedRemappings];
LABEL_7:
}

BOOL __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) scope];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_3;
  v9[3] = &unk_1E60A8E10;
  uint64_t v6 = *(void *)(a1 + 48);
  void v9[4] = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  BOOL v7 = +[CPLMingleUtility applyShareRemapFixUpTasks:v4 scope:v5 store:v6 onPutBatchInPullQueue:v9 error:a2];

  return v7;
}

uint64_t __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)_mingleOtherChanges
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineSyncTask *)self diskPressureState] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = @"Not enough disk space";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v6 = (id)[v4 initWithDomain:*MEMORY[0x1E4F281F8] code:640 userInfo:v5];

    [(CPLMingleChangesScopeTask *)self taskDidFinishWithError:v6];
  }
  else
  {
    BOOL v7 = [(CPLEngineSyncTask *)self engineLibrary];
    id v8 = [v7 store];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke;
    v11[3] = &unk_1E60AB040;
    v11[4] = self;
    p_long long buf = &buf;
    id v6 = v8;
    id v12 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_61;
    v10[3] = &unk_1E60AB878;
    v10[4] = self;
    void v10[5] = &buf;
    id v9 = (id)[v6 performWriteTransactionWithBlock:v11 completionHandler:v10];

    _Block_object_dispose(&buf, 8);
  }
}

void __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) scope];
    id v5 = *(void **)(a1 + 32);
    if (!v5[15])
    {
      id v6 = [v5 store];
      BOOL v7 = [v6 transientPullRepository];

      uint64_t v8 = [v7 batchStorageForScope:v4];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 112);
      *(void *)(v9 + 112) = v8;

      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 112);
      id v12 = [v4 scopeIdentifier];
      uint64_t v13 = +[CPLBatchExtractionStrategy minglingStrategyWithStorage:coveringScopeIdentifier:maximumBatchSize:](CPLBatchExtractionStrategy, "minglingStrategyWithStorage:coveringScopeIdentifier:maximumBatchSize:", v11, v12, [v7 maximumCountOfRecordsInBatches]);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 120);
      *(void *)(v14 + 120) = v13;

      id v5 = *(void **)(a1 + 32);
    }
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__13388;
    v33[4] = __Block_byref_object_dispose__13389;
    id v34 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_2;
    v27[3] = &unk_1E60A8E38;
    v27[4] = v5;
    v31 = v33;
    uint64_t v32 = *(void *)(a1 + 48);
    id v16 = v4;
    id v28 = v16;
    id v29 = *(id *)(a1 + 40);
    id v17 = v3;
    id v30 = v17;
    [v17 do:v27];
    char v18 = [v17 error];
    if (!v18)
    {
      if (*(void *)(*(void *)(a1 + 32) + 128) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        char v20 = [v19 BOOLForKey:@"CPLDisableAutomaticReshare"];

        if (v20) {
          goto LABEL_9;
        }
        char v18 = +[CPLReshareTask cutoffDate];
        uint64_t v21 = [*(id *)(a1 + 40) ignoredRecords];
        char v22 = [*(id *)(*(void *)(a1 + 32) + 128) scopeIdentifier];
        int v23 = [v21 scopeIdentifier:v22 hasIgnoredRecordsBeforeDate:v18];

        if (v23)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v24 = __CPLTaskOSLogDomain_13362();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v26 = 0;
              _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "It seems some ignored records will need to be reshared after mingling", v26, 2u);
            }
          }
          id v25 = [*(id *)(a1 + 32) session];
          [v25 requestSyncStateAtEndOfSyncSession:9 reschedule:1];
        }
      }
      else
      {
        char v18 = 0;
      }
    }

LABEL_9:
    _Block_object_dispose(v33, 8);
  }
}

void __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_61(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[CPLErrors operationCancelledError];
LABEL_5:
    id v6 = (void *)v4;
    [v3 taskDidFinishWithError:v4];

    goto LABEL_6;
  }
  id v5 = [v8 error];

  if (v5)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v8 error];
    goto LABEL_5;
  }
  BOOL v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [v7 _mingleOtherChanges];
  }
  else {
    [v7 _finishMingling];
  }
LABEL_6:
}

BOOL __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 120);
  id v5 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  int v6 = [v4 extractBatch:&obj maximumResourceSize:-1 error:a2];
  objc_storeStrong(v5, obj);
  if (!v6) {
    return 0;
  }
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) batch];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v7 count] != 0;
  if (v7
    && (id v8 = *(unsigned char **)(a1 + 32), v8[152])
    && ([v8 _filteredBatchByStashingRecordsIfNecessary:v7 error:a2],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v7,
        (id v7 = (id)v9) == 0))
  {
    BOOL v12 = 0;
  }
  else if ([v7 count])
  {
    *(void *)(*(void *)(a1 + 32) + 176) += [v7 count];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_3;
    void v14[3] = &unk_1E60A8DE8;
    v14[4] = *(void *)(a1 + 32);
    id v7 = v7;
    id v15 = v7;
    id v16 = *(id *)(a1 + 56);
    BOOL v12 = +[CPLMingleUtility mingleChangeBatch:v7 scope:v10 forStore:v11 onPutBatchInPullQueue:v14 error:a2];
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

uint64_t __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_filteredBatchByStashingRecordsIfNecessary:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v37 = self;
  uint64_t v32 = [(CPLEngineScopedTask *)self store];
  id v34 = [v32 pushRepository];
  v36 = [v32 cloudCache];
  v35 = [v32 idMapping];
  v31 = [(CPLEngineScopedTask *)self scope];
  uint64_t v6 = [v31 localIndex];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13388;
  v59 = __Block_byref_object_dispose__13389;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__13388;
  v53 = __Block_byref_object_dispose__13389;
  id v29 = v5;
  id v54 = v29;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v8 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)v50[5], "count"));
  do
  {
    uint64_t v9 = (void *)v50[5];
    if (!v9 || ![v9 count]) {
      break;
    }
    uint64_t v10 = (void *)MEMORY[0x1BA993DF0]();
    uint64_t v11 = [(id)v50[5] records];
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __78__CPLMingleChangesScopeTask__filteredBatchByStashingRecordsIfNecessary_error___block_invoke;
    v38[3] = &unk_1E60A8DC0;
    id v39 = v35;
    uint64_t v47 = v6;
    id v40 = v34;
    id v41 = v36;
    id v42 = v8;
    v43 = v37;
    v45 = &v49;
    id v13 = v12;
    SEL v48 = a2;
    id v44 = v13;
    v46 = &v55;
    [v11 enumerateObjectsUsingBlock:v38];
    uint64_t v14 = v50[5];
    if (!v14) {
      goto LABEL_8;
    }
    if ([v13 count])
    {
      id v15 = (void *)[v11 mutableCopy];
      [v15 removeObjectsAtIndexes:v13];
      uint64_t v16 = [v15 count];
      uint64_t v17 = [v13 count];
      if (v17 + v16 != [v11 count])
      {
        if (!_CPLSilentLogging)
        {
          int v23 = __CPLTaskOSLogDomain_13362();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [v13 count];
            uint64_t v25 = [v11 count];
            uint64_t v26 = [v15 count];
            *(_DWORD *)long long buf = 134218496;
            uint64_t v62 = v24;
            __int16 v63 = 2048;
            uint64_t v64 = v25;
            __int16 v65 = 2048;
            uint64_t v66 = v26;
            _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Trying to remove objects at %lu indexes from an array of %lu elements returned %lu elements", buf, 0x20u);
          }
        }
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        id v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleChangesTask.m"];
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v37, v28, 430, @"Trying to remove objects at %lu indexes from an array of %lu elements returned %lu elements", objc_msgSend(v13, "count"), objc_msgSend(v11, "count"), objc_msgSend(v15, "count"), v29);

        abort();
      }
      [(id)v50[5] _setRecords:v15];

      char v18 = 0;
    }
    else
    {
LABEL_8:
      char v18 = 1;
    }

    char v19 = v18 ^ 1;
    if (!v14) {
      char v19 = 0;
    }
  }
  while ((v19 & 1) != 0);
  char v20 = (void *)v50[5];
  if (a4 && !v20)
  {
    *a4 = (id) v56[5];
    char v20 = (void *)v50[5];
  }
  id v21 = v20;

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v21;
}

void __78__CPLMingleChangesScopeTask__filteredBatchByStashingRecordsIfNecessary_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [v7 scopedIdentifier];
  char v61 = 0;
  uint64_t v9 = [*(id *)(a1 + 32) localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v61];
  if (!v9) {
    uint64_t v9 = [v8 copy];
  }
  [v9 setScopeIndex:*(void *)(a1 + 96)];
  if ([v7 isDelete])
  {
    if ([v7 isMasterChange])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLTaskOSLogDomain_13362();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_67;
        }
        *(_DWORD *)long long buf = 138412290;
        id v64 = v7;
        uint64_t v11 = "%@ is a master delete - stashing change";
        id v12 = v10;
        uint32_t v13 = 12;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_67;
      }
      goto LABEL_92;
    }
    uint64_t v14 = [*(id *)(a1 + 40) changeWithScopedIdentifier:v9];
    uint64_t v10 = v14;
    if (v14)
    {
      if (([v14 isDelete] & 1) == 0)
      {
        if (([v7 isFullRecord] & 1) == 0)
        {
          if (_CPLSilentLogging)
          {
            int v27 = 0;
            LOBYTE(v19) = 1;
            goto LABEL_71;
          }
          id v15 = __CPLTaskOSLogDomain_13362();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            id v64 = v7;
            __int16 v65 = 2112;
            uint64_t v66 = v9;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "%@ conflicts with update on change %@ in push repository - deleting the local change", buf, 0x16u);
          }
          int v27 = 0;
          LOBYTE(v19) = 1;
LABEL_56:

          goto LABEL_71;
        }
        if (_CPLSilentLogging) {
          goto LABEL_67;
        }
        id v15 = __CPLTaskOSLogDomain_13362();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_43:
          LOBYTE(v19) = 0;
          int v27 = 1;
          goto LABEL_56;
        }
        *(_DWORD *)long long buf = 138412546;
        id v64 = v7;
        __int16 v65 = 2112;
        uint64_t v66 = v9;
        uint64_t v16 = "%@ conflicts with non-delete change %@ in push repository - stashing change";
        uint64_t v17 = v15;
        uint32_t v18 = 22;
LABEL_42:
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_43;
      }
    }
    else
    {
      if (([*(id *)(a1 + 48) hasAnyRecordWithRelatedScopedIdentifier:v8] & 1) != 0
        || [*(id *)(a1 + 40) hasAnyChangeWithRelatedScopedIdentifier:v9])
      {
        if (_CPLSilentLogging)
        {
          uint64_t v10 = 0;
          goto LABEL_67;
        }
        id v15 = __CPLTaskOSLogDomain_13362();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_DWORD *)long long buf = 138412290;
        id v64 = v7;
        uint64_t v16 = "%@ has a conflicting change pointing to that record in the cloud cache or push repository - stashing change";
        uint64_t v17 = v15;
        uint32_t v18 = 12;
        goto LABEL_42;
      }
      uint64_t v10 = 0;
    }
    LOBYTE(v19) = 0;
LABEL_70:
    int v27 = 0;
    goto LABEL_71;
  }
  if ([*(id *)(a1 + 40) hasSomeChangeWithScopedIdentifier:v9])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = __CPLTaskOSLogDomain_13362();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      *(_DWORD *)long long buf = 138412546;
      id v64 = v7;
      __int16 v65 = 2112;
      uint64_t v66 = v9;
      uint64_t v11 = "%@ conflicts with change %@ in push repository - stashing change";
      id v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_12;
    }
LABEL_92:
    LOBYTE(v19) = 0;
    goto LABEL_72;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v10 = [v7 scopedIdentifiersForMapping];
  uint64_t v19 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v19) {
    goto LABEL_70;
  }
  v53 = a4;
  id v54 = a3;
  v52 = v9;
  uint64_t v20 = *(void *)v58;
LABEL_21:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v58 != v20) {
      objc_enumerationMutation(v10);
    }
    char v22 = *(NSObject **)(*((void *)&v57 + 1) + 8 * v21);
    if ([v22 isEqual:v8]) {
      goto LABEL_33;
    }
    int v23 = [*(id *)(a1 + 56) objectForKeyedSubscript:v22];

    if (v23)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v24 = __CPLTaskOSLogDomain_13362();
        a3 = v54;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v64 = v7;
          __int16 v65 = 2112;
          uint64_t v66 = v22;
          id v28 = "%@ points to %@ which has been stashed in the same batch - stashing change";
LABEL_50:
          _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
        }
LABEL_51:
        uint64_t v9 = v52;
        a4 = v53;
        goto LABEL_66;
      }
LABEL_98:
      LOBYTE(v19) = 0;
      int v27 = 1;
LABEL_36:
      uint64_t v9 = v52;
      a4 = v53;
      a3 = v54;
      goto LABEL_71;
    }
    if ([*(id *)(*(void *)(a1 + 64) + 112) isRecordWithScopedIdentifierStashed:v22])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v24 = __CPLTaskOSLogDomain_13362();
        a3 = v54;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v64 = v7;
          __int16 v65 = 2112;
          uint64_t v66 = v22;
          id v28 = "%@ points to %@ which has been stashed - stashing change";
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      goto LABEL_98;
    }
    uint64_t v24 = [*(id *)(a1 + 32) localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v22];
    if (!v24) {
      uint64_t v24 = [v22 copy];
    }
    [v24 setScopeIndex:*(void *)(a1 + 96)];
    uint64_t v25 = [*(id *)(a1 + 40) changeWithScopedIdentifier:v24];
    uint64_t v26 = v25;
    if (v25) {
      break;
    }
LABEL_32:

LABEL_33:
    if (v19 == ++v21)
    {
      uint64_t v19 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v19) {
        goto LABEL_21;
      }
      int v27 = 0;
      goto LABEL_36;
    }
  }
  if (![v25 isDelete])
  {
    if (([*(id *)(a1 + 48) hasRecordWithScopedIdentifier:v22] & 1) == 0)
    {
      uint64_t v9 = v52;
      a4 = v53;
      a3 = v54;
      if (!_CPLSilentLogging)
      {
        id v29 = __CPLTaskOSLogDomain_13362();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v64 = v7;
          __int16 v65 = 2112;
          uint64_t v66 = v26;
          id v30 = "%@ points to %@ which is in push repository and has not yet been uploaded - stashing change";
LABEL_63:
          _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
        }
        goto LABEL_64;
      }
      goto LABEL_65;
    }
    goto LABEL_32;
  }
  uint64_t v9 = v52;
  a4 = v53;
  a3 = v54;
  if (!_CPLSilentLogging)
  {
    id v29 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v64 = v7;
      __int16 v65 = 2112;
      uint64_t v66 = v24;
      id v30 = "%@ points to a deleted %@ in push repository - stashing change";
      goto LABEL_63;
    }
LABEL_64:
  }
LABEL_65:

LABEL_66:
LABEL_67:
  LOBYTE(v19) = 0;
  int v27 = 1;
LABEL_71:

  if (v27)
  {
LABEL_72:
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v8];
      [*(id *)(a1 + 72) addIndex:a3];
      if (![*(id *)(a1 + 72) count])
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v47 = __CPLTaskOSLogDomain_13362();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134217984;
            id v64 = a3;
            _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_ERROR, "Adding %lu to index set failed", buf, 0xCu);
          }
        }
        SEL v48 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v49 = *(void *)(a1 + 104);
        uint64_t v50 = *(void *)(a1 + 64);
        uint64_t v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleChangesTask.m"];
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v49, v50, v51, 407, @"Adding %lu to index set failed", a3);

        abort();
      }
      v31 = *(void **)(*(void *)(a1 + 64) + 112);
      uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8);
      id obj = *(id *)(v32 + 40);
      char v33 = [v31 stashChange:v7 error:&obj];
      objc_storeStrong((id *)(v32 + 40), obj);
      if ((v33 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          id v34 = __CPLTaskOSLogDomain_13362();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = *(NSObject **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            *(_DWORD *)long long buf = 138412546;
            id v64 = v7;
            __int16 v65 = 2112;
            uint64_t v66 = v35;
            _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_ERROR, "Failed to stash %@ : %@", buf, 0x16u);
          }
        }
        uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8);
        v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = 0;
      }
    }
  }
  char v38 = v19 ^ 1;
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) {
    char v38 = 1;
  }
  if ((v38 & 1) == 0)
  {
    id v39 = *(void **)(a1 + 40);
    uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
    id v55 = *(id *)(v40 + 40);
    char v41 = [v39 discardChangeWithScopedIdentifier:v9 error:&v55];
    objc_storeStrong((id *)(v40 + 40), v55);
    if ((v41 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v42 = __CPLTaskOSLogDomain_13362();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = objc_opt_class();
          *(_DWORD *)long long buf = 138412546;
          id v64 = v43;
          __int16 v65 = 2112;
          uint64_t v66 = v9;
          id v44 = v43;
          _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_ERROR, "Failed to discard local change <%@ %@>", buf, 0x16u);
        }
      }
      uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8);
      v46 = *(void **)(v45 + 40);
      *(void *)(v45 + 40) = 0;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)_finishMingling
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineSyncTask *)self diskPressureState] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = self;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }
    }
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = @"Not enough disk space";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v7 = (id)[v4 initWithDomain:v5 code:640 userInfo:v6];

    [(CPLMingleChangesScopeTask *)self taskDidFinishWithError:v7];
  }
  else
  {
    id v8 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v9 = [v8 store];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke;
    v12[3] = &unk_1E60AB550;
    void v12[4] = self;
    id v13 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_34;
    v11[3] = &unk_1E60AB578;
    v11[4] = self;
    id v7 = v9;
    id v10 = (id)[v7 performWriteTransactionWithBlock:v12 completionHandler:v11];
  }
}

void __44__CPLMingleChangesScopeTask__finishMingling__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_2;
    v6[3] = &unk_1E60AB750;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 do:v6];
  }
}

void __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_34(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[CPLErrors operationCancelledError];
LABEL_5:
    uint64_t v6 = (void *)v4;
    [v3 taskDidFinishWithError:v4];

    goto LABEL_7;
  }
  uint64_t v5 = [v7 error];

  id v3 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v4 = [v7 error];
    goto LABEL_5;
  }
  [v3 taskDidFinishWithError:0];
LABEL_7:
}

uint64_t __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) scopes];
  uint64_t v5 = [*(id *)(a1 + 40) scope];
  uint64_t v6 = [v4 transientSyncAnchorForScope:v5];
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 cplSyncAnchorDescription];
      int v15 = 138412546;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "New sync anchor for %@: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (!v6) {
    goto LABEL_13;
  }
  if (![v4 setSyncAnchor:v6 forScope:v5 error:a2]) {
    goto LABEL_14;
  }
  if ([v4 hasStagedSyncAnchorForScope:v5]) {
    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v9 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 scopeIdentifier];
      int v15 = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "No changes or staged sync anchor for %@ after mingling - discarding transient sync anchor", (uint8_t *)&v15, 0xCu);
    }
  }
  if ([v4 storeTransientSyncAnchor:0 forScope:v5 error:a2])
  {
LABEL_13:
    uint64_t v11 = [*(id *)(a1 + 32) idMapping];
    id v12 = [v5 scopeIdentifier];
    uint64_t v13 = [v11 markAllPendingIdentifiersForScopeWithIdentifier:v12 asFinalWithError:a2];
  }
  else
  {
LABEL_14:
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_noteBatchWasAddedInPullQueue:(id)a3 fromBatch:(id)a4 transaction:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLTaskOSLogDomain_13362();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v8 summaryDescription];
          uint64_t v13 = [v9 summaryDescription];
          int v14 = 138543618;
          int v15 = v12;
          __int16 v16 = 2114;
          __int16 v17 = v13;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to pull queue from %{public}@", (uint8_t *)&v14, 0x16u);

LABEL_9:
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v8 summaryDescription];
        int v14 = 138412290;
        int v15 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to pull queue", (uint8_t *)&v14, 0xCu);
        goto LABEL_9;
      }
LABEL_10:
    }
    [(CPLMingleChangesScopeTask *)self _notifySchedulerPullQueueIsFullInTransaction:v10];
  }
}

- (void)taskDidFinishWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t minglingCount = self->_minglingCount;
      id v7 = [(CPLEngineScopedTask *)self scope];
      *(_DWORD *)long long buf = 134218242;
      unint64_t v23 = minglingCount;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Mingled %lu changes for %@", buf, 0x16u);
    }
  }
  [(CPLMingleChangesScopeTask *)self _notifySchedulerPullQueueIsFullNowIfNecessary];
  id v8 = [(CPLEngineScopedTask *)self scope];
  id v9 = [(CPLEngineScopedTask *)self store];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke;
  v17[3] = &unk_1E60AA170;
  id v18 = v9;
  uint64_t v19 = self;
  id v20 = v4;
  id v21 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_33;
  void v14[3] = &unk_1E60AB550;
  id v15 = v20;
  __int16 v16 = self;
  id v10 = v20;
  id v11 = v8;
  id v12 = v9;
  id v13 = (id)[v12 performWriteTransactionWithBlock:v17 completionHandler:v14];
}

void __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) transientPullRepository];
  [v4 removeObserver:*(void *)(a1 + 40)];

  if (!*(void *)(a1 + 48))
  {
    uint64_t v5 = *(unsigned char **)(a1 + 40);
    if (v5[184])
    {
      if ([v5 isScopeValidInTransaction:v3])
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_2;
        v6[3] = &unk_1E60AAF20;
        id v7 = *(id *)(a1 + 32);
        id v8 = *(id *)(a1 + 56);
        id v9 = v3;
        [v9 do:v6];
      }
    }
  }
}

void __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = v5;
  if (!v5)
  {
    id v7 = [v3 error];
  }
  v8.receiver = v6;
  v8.super_class = (Class)CPLMingleChangesScopeTask;
  objc_msgSendSuper2(&v8, sel_taskDidFinishWithError_, v7);
  if (!v5) {
}
  }

uint64_t __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) scopes];
  uint64_t v5 = *(void *)(a1 + 40);
  id v14 = 0;
  uint64_t v6 = [v4 setScope:v5 hasCompletedInitialMinglingWithError:&v14];
  id v7 = v14;

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      objc_super v8 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Stored initial mingling date for %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        id v12 = [*(id *)(a1 + 48) error];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Failed to store initial mingling date for %@: %@", buf, 0x16u);
      }
    }
    if (a2) {
      *a2 = v7;
    }
  }

  return v6;
}

- (void)_notifySchedulerPullQueueIsFullNowIfNecessary
{
  notifyQueue = self->_notifyQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13375;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = notifyQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 169))
  {
    v2 = (void *)MEMORY[0x1BA993DF0]();
    *(unsigned char *)(*(void *)(a1 + 32) + 169) = 0;
    [*(id *)(a1 + 32) _reallyNotifySchedulerPullQueueIsFull];
  }
}

- (void)_notifySchedulerPullQueueIsFullInTransaction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke;
  v3[3] = &unk_1E60AB8A0;
  v3[4] = self;
  [a3 addCleanupBlock:v3];
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 168))
    {
      dispatch_block_t v5 = *(void **)(v4 + 160);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_2;
      v9[3] = &unk_1E60A5DD8;
      void v9[4] = v4;
      uint64_t v6 = v9;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_13375;
      block[3] = &unk_1E60A6978;
      id v11 = v6;
      id v7 = v5;
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v7, v8);
    }
    else
    {
      [(id)v4 _reallyNotifySchedulerPullQueueIsFull];
      *(unsigned char *)(*(void *)(a1 + 32) + 168) = 1;
    }
  }
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 169))
  {
    *(unsigned char *)(v1 + 169) = 1;
    id v3 = [*(id *)(a1 + 32) session];
    [v3 resetNoteClientNeedsToPull];

    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 160);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_3;
    block[3] = &unk_1E60A5DD8;
    void block[4] = v5;
    dispatch_after(v4, v6, block);
  }
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 169))
  {
    v2 = (void *)MEMORY[0x1BA993DF0]();
    *(unsigned char *)(*(void *)(a1 + 32) + 169) = 0;
    [*(id *)(a1 + 32) _reallyNotifySchedulerPullQueueIsFull];
  }
}

- (void)_reallyNotifySchedulerPullQueueIsFull
{
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Notifying scheduler that there is some change in the pull queue", v5, 2u);
    }
  }
  dispatch_time_t v4 = [(CPLEngineSyncTask *)self session];
  [v4 noteClientNeedsToPullIfNecessary];
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)CPLMingleChangesScopeTask;
  if (![(CPLEngineScopedTask *)&v26 checkScopeIsValidInTransaction:a3]
    || self->_minglingHasBeenReset)
  {
    return 0;
  }
  if (self->_sharedScope)
  {
    uint64_t v6 = [(CPLEngineScopedTask *)self store];
    id v7 = [v6 scopes];
    dispatch_block_t v8 = [v7 validLocalScopeIndexes];
    char v9 = objc_msgSend(v8, "containsIndex:", -[CPLEngineScope localIndex](self->_sharedScope, "localIndex"));

    if ((v9 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v21 = __CPLTaskOSLogDomain_13362();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          sharedScope = self->_sharedScope;
          unint64_t v23 = objc_opt_class();
          *(_DWORD *)long long buf = 138412546;
          id v28 = sharedScope;
          __int16 v29 = 2112;
          id v30 = v23;
          id v24 = v23;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Scope %@ is invalid, stopping %@ now", buf, 0x16u);
        }
      }
      [(CPLMingleChangesScopeTask *)self cancel];
      return 0;
    }
  }
  id v10 = [(CPLEngineScopedTask *)self store];
  id v11 = [v10 pushRepository];
  id v12 = [(CPLEngineScopedTask *)self scope];
  id v13 = [v12 scopeIdentifier];
  unint64_t v14 = [v11 minimumPriorityForChangesInScopeWithIdentifier:v13];
  if (v14 >= +[CPLRecordPushContext minimumPriorityForLocalConflictResolution])goto LABEL_11; {
  id v15 = [(CPLEngineSyncTask *)self session];
  }
  char v16 = [v15 allowsLocalConflictResolution];

  if (v16) {
    goto LABEL_11;
  }
  __int16 v17 = [(CPLEngineSyncTask *)self session];
  int v18 = [v17 allowsLocalConflictResolutionWhenOverQuota];

  if (!v18) {
    goto LABEL_19;
  }
  uint64_t v19 = [v10 scopes];
  char v20 = [v19 valueForFlag:2 forScope:v12];

  if (v20)
  {
LABEL_11:
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_shouldStashRecordsIfNecessary = 0;
      BOOL v4 = 1;
    }
    else
    {
      BOOL v4 = 1;
      self->_shouldStashRecordsIfNecessary = 1;
    }
  }
  else
  {
LABEL_19:
    if (!_CPLSilentLogging)
    {
      uint64_t v25 = __CPLTaskOSLogDomain_13362();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v13;
        _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_DEFAULT, "Push repository contains changes for %@, stopping mingle now", buf, 0xCu);
      }
    }
    [(CPLMingleChangesScopeTask *)self cancel];
    BOOL v4 = 0;
  }

  return v4;
}

- (CPLMingleChangesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)CPLMingleChangesScopeTask;
  id v7 = [(CPLEngineScopedTask *)&v15 initWithEngineLibrary:a3 session:a4 clientCacheIdentifier:a5 scope:a6 transportScope:a7];
  if (v7)
  {
    dispatch_block_t v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.mingling.lock", v8);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_queue *)v9;

    id v11 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cpl.mingling.notify", v11);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

@end