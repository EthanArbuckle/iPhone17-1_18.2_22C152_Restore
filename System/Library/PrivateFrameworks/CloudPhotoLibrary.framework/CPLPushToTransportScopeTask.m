@interface CPLPushToTransportScopeTask
- (BOOL)_shouldNotTrustCloudCacheAfterError:(id)a3;
- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5;
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (BOOL)highPriority;
- (BOOL)task:(id)a3 checkScopeIsValidInTransaction:(id)a4;
- (BOOL)task:(id)a3 shouldRetryImmediatelyInTransaction:(id)a4;
- (BOOL)task:(id)a3 shouldUploadBatchesWithDropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5 inTransaction:(id)a6;
- (CPLPushToTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (CPLUploadPushedChangesTask)currentSubtask;
- (id)_contributorsUpdatesInTransaction:(id)a3;
- (id)phaseDescription;
- (id)phaseDescriptionLastChangeDate:(id *)a3;
- (id)scopesForTask;
- (id)taskIdentifier;
- (void)_acknowledgeContributorUpdatesAndContinue:(id)a3;
- (void)_didFinishTaskWithKey:(id)a3 error:(BOOL)a4 cancelled:(BOOL)a5;
- (void)_didStartTaskWithKey:(id)a3 recordCount:(unint64_t)a4;
- (void)_discardCurrentSubtask;
- (void)_excludeScopeFromMingling;
- (void)_includeScopeInMingling;
- (void)_launch;
- (void)_launchSubTask:(id)a3;
- (void)_noteSuccessfulUpdateInTransaction:(id)a3;
- (void)_prepareTransportGroupForOneBatch;
- (void)_pushTaskDidFinishWithError:(id)a3;
- (void)_resetPriority;
- (void)_updateContributors:(id)a3;
- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3;
- (void)_uploadChangesWithPriority:(unint64_t)a3 maxBatchSize:(unint64_t)a4;
- (void)_uploadTask:(id)a3 didFinishWithError:(id)a4;
- (void)cancel;
- (void)cancel:(BOOL)a3;
- (void)launch;
- (void)setHighPriority:(BOOL)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5;
- (void)task:(id)a3 noteSuccessfulUpdateInTransaction:(id)a4;
@end

@implementation CPLPushToTransportScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubtask, 0);
  objc_storeStrong((id *)&self->_taskStartDate, 0);
  objc_storeStrong((id *)&self->_currentTaskKey, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_storedTransportGroup, 0);
  objc_storeStrong((id *)&self->_updateContributorsTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)task:(id)a3 shouldUploadBatchesWithDropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5 inTransaction:(id)a6
{
  return [(CPLPushToTransportScopeTask *)self _shouldUploadBatchesWithDropReason:a4 shouldQuarantineRecords:a5 inTransaction:a6];
}

- (void)task:(id)a3 noteSuccessfulUpdateInTransaction:(id)a4
{
}

- (BOOL)task:(id)a3 shouldRetryImmediatelyInTransaction:(id)a4
{
  if (self->_retryImmediately) {
    return 1;
  }
  pushRepository = self->_pushRepository;
  scopeIdentifier = self->_scopeIdentifier;
  id v7 = a3;
  unint64_t v8 = [(CPLEnginePushRepository *)pushRepository minimumPriorityForChangesInScopeWithIdentifier:scopeIdentifier];
  unint64_t v9 = [v7 pushRepositoryPriority];

  return v8 < v9;
}

- (BOOL)task:(id)a3 checkScopeIsValidInTransaction:(id)a4
{
  return [(CPLPushToTransportScopeTask *)self checkScopeIsValidInTransaction:a4];
}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"finishing subtask %@", objc_opt_class()];
  [(CPLEngineSyncTask *)self setPhaseDescription:v8];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m"];
    [v9 handleFailureInMethod:a2, self, v10, 888, @"Received completion for unknown %@", v11 object file lineNumber description];

    abort();
  }
  [(CPLPushToTransportScopeTask *)self _uploadTask:v11 didFinishWithError:v7];
}

- (void)_uploadTask:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke;
  v14[3] = &unk_1E60A6660;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  unint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  v10 = lock;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke(id *a1)
{
  [a1[4] _discardCurrentSubtask];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v34 = [a1[5] maxBatchSize];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = [a1[5] pushRepositoryPriority];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2;
  v28[3] = &unk_1E60AA7E0;
  v28[4] = a1[4];
  v28[5] = v29;
  v2 = (void *)MEMORY[0x1BA994060](v28);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_3;
  v27[3] = &unk_1E60A69C0;
  v27[4] = v37;
  v3 = (void *)MEMORY[0x1BA994060](v27);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_4;
  v26[3] = &unk_1E60A85B8;
  v26[4] = a1[4];
  v26[5] = v31;
  v26[6] = v33;
  v26[7] = v37;
  v26[8] = v35;
  v4 = (void *)MEMORY[0x1BA994060](v26);
  v5 = [a1[4] store];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_114;
  v17[3] = &unk_1E60A85E8;
  v17[4] = a1[4];
  id v18 = a1[6];
  id v6 = v4;
  id v20 = v6;
  v23 = v33;
  id v7 = v2;
  id v21 = v7;
  id v8 = v3;
  id v22 = v8;
  id v19 = a1[5];
  v24 = v31;
  v25 = v37;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2_117;
  v10[3] = &unk_1E60A8610;
  v10[4] = a1[4];
  id v12 = v35;
  dispatch_block_t v13 = v37;
  v14 = v31;
  id v15 = v33;
  id v16 = v29;
  id v11 = a1[6];
  id v9 = (id)[v5 performWriteTransactionWithBlock:v17 completionHandler:v10];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _excludeScopeFromMingling];
  v2 = [*(id *)(a1 + 32) session];
  if ([*(id *)(a1 + 32) highPriority]) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 8;
  }
  [v2 requestSyncStateAtEndOfSyncSession:v3 reschedule:0];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

BOOL __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_4(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1[4] + 144) minimumPriorityForChangesInScopeWithIdentifier:*(void *)(a1[4] + 120)];
  unint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v2 < v5)
  {
    *(void *)(v4 + 24) = v2;
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v2 < +[CPLRecordPushContext minimumPriorityForLocalConflictResolution];
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLTaskOSLogDomain_10798();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1[4] + 120);
        if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
          id v8 = @" after resetting priority";
        }
        else {
          id v8 = &stru_1F0D5F858;
        }
        int v10 = 138543618;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        dispatch_block_t v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Changes have been pushed by client for %{public}@ - restarting uploads%@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  return v3 < v5;
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3]) {
    goto LABEL_46;
  }
  if ([*(id *)(a1 + 40) isCPLErrorWithCode:1012])
  {
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0)
    {
      unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      if (v4 <= +[CPLBatchExtractionStrategy minimumRecordCountPerBatch])
      {
        if (!_CPLSilentLogging)
        {
          id v15 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 120);
            v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
            *(_DWORD *)buf = 138543618;
            uint64_t v30 = v16;
            __int16 v31 = 2048;
            uint64_t v32 = v17;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Upload for %{public}@ failed because server finds that a batch size of %lu records is still too large. Will still continue synchronizing other scopes", buf, 0x16u);
          }
        }
        uint64_t v9 = *(void *)(a1 + 64);
      }
      else
      {
        unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >> 1;
        if (v5 < +[CPLBatchExtractionStrategy minimumRecordCountPerBatch](CPLBatchExtractionStrategy, "minimumRecordCountPerBatch"))unint64_t v5 = +[CPLBatchExtractionStrategy minimumRecordCountPerBatch]; {
        if (!_CPLSilentLogging)
        }
        {
          id v6 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
            id v8 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)buf = 134218498;
            uint64_t v30 = v7;
            __int16 v31 = 2112;
            uint64_t v32 = v8;
            __int16 v33 = 2048;
            unint64_t v34 = v5;
            _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Server finds %lu is too large to handle changes for %@, setting maximum batch size to %lu temporarily and retrying", buf, 0x20u);
          }
        }
        uint64_t v9 = *(void *)(a1 + 72);
      }
      (*(void (**)(void))(v9 + 16))();
    }
    goto LABEL_46;
  }
  if ([*(id *)(a1 + 40) isCPLErrorWithCode:30])
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))()) {
      goto LABEL_45;
    }
    if ([*(id *)(a1 + 48) didUseOverQuotaStrategy])
    {
      if ([*(id *)(a1 + 32) forceSync])
      {
        if (!_CPLSilentLogging)
        {
          int v10 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 120);
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v11;
            __int16 v12 = "Upload for %{public}@ failed because the scope is over quota. Will stop forced sync";
            dispatch_block_t v13 = v10;
            os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_32:
            _os_log_impl(&dword_1B4CAC000, v13, v14, v12, buf, 0xCu);
            goto LABEL_33;
          }
          goto LABEL_33;
        }
        goto LABEL_45;
      }
      if (!_CPLSilentLogging)
      {
        id v19 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 120);
          *(_DWORD *)buf = 138543362;
          uint64_t v30 = v20;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is over quota. Will still continue synchronizing other scopes", buf, 0xCu);
        }
      }
      uint64_t v21 = *(void *)(a1 + 64);
    }
    else
    {
      if (+[CPLPushToTransportTask dontAutoRetry])
      {
        if (!_CPLSilentLogging)
        {
          int v10 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 120);
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v18;
            __int16 v12 = "Upload for %{public}@ failed because the scope is over quota";
            dispatch_block_t v13 = v10;
            os_log_type_t v14 = OS_LOG_TYPE_ERROR;
            goto LABEL_32;
          }
LABEL_33:
        }
LABEL_45:
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_116;
        v26[3] = &unk_1E60AB750;
        id v24 = *(id *)(a1 + 40);
        uint64_t v25 = *(void *)(a1 + 32);
        id v27 = v24;
        uint64_t v28 = v25;
        [v3 do:v26];

        goto LABEL_46;
      }
      if (!_CPLSilentLogging)
      {
        id v22 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 120);
          *(_DWORD *)buf = 138543362;
          uint64_t v30 = v23;
          _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is over quota. Retrying with over-quota strategy", buf, 0xCu);
        }
      }
      uint64_t v21 = *(void *)(a1 + 72);
    }
    (*(void (**)(void))(v21 + 16))();
    goto LABEL_45;
  }
  if (!*(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 144) minimumPriorityForChangesInScopeWithIdentifier:*(void *)(*(void *)(a1 + 32) + 120)];
    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    }
  }
LABEL_46:
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2_117(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  unint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    unint64_t v5 = [v9 error];
    [v4 _pushTaskDidFinishWithError:v5];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[CPLErrors operationCancelledError];
    [v6 _pushTaskDidFinishWithError:v7];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) _resetPriority];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 32) _uploadChangesWithPriority:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) maxBatchSize:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = *(void *)(a1 + 40);
    }
    [*(id *)(a1 + 32) _pushTaskDidFinishWithError:v8];
  }
}

uint64_t __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_116(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) userInfo];
  unint64_t v5 = [v4 objectForKeyedSubscript:@"CPLErrorIsCausedBySharedSync"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0
    || (uint64_t v7 = *(void *)(a1 + 40), (v8 = *(void *)(v7 + 160)) == 0)
    || (uint64_t result = [*(id *)(v7 + 128) setValue:1 forFlag:2 forScope:v8 error:a2], result))
  {
    int v10 = *(void **)(a1 + 40);
    uint64_t v11 = (void *)v10[16];
    __int16 v12 = [v10 scope];
    uint64_t v13 = [v11 setValue:1 forFlag:2 forScope:v12 error:a2];

    return v13;
  }
  return result;
}

- (id)taskIdentifier
{
  if (self->_highPriority) {
    return @"engine.sync.pushtotransport.highpriority";
  }
  else {
    return @"engine.sync.pushtotransport";
  }
}

- (id)phaseDescription
{
  id v3 = [(CPLPushToTransportScopeTask *)self currentSubtask];
  unint64_t v4 = [v3 phaseDescription];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLPushToTransportScopeTask;
    id v6 = [(CPLEngineSyncTask *)&v9 phaseDescription];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  unint64_t v5 = [(CPLPushToTransportScopeTask *)self currentSubtask];
  id v6 = [v5 phaseDescriptionLastChangeDate:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLPushToTransportScopeTask;
    id v8 = [(CPLEngineSyncTask *)&v11 phaseDescriptionLastChangeDate:a3];
  }
  objc_super v9 = v8;

  return v9;
}

- (void)_pushTaskDidFinishWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CPLEngineSyncTask *)self setPhaseDescription:@"cleaning"];
  [(CPLPushToTransportScopeTask *)self hash];
  kdebug_trace();
  if (!_CPLSilentLogging)
  {
    unint64_t v5 = __CPLTaskOSLogDomain_10798();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Push to transport finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }
  }
  id v6 = [(CPLEngineScopedTask *)self store];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10852;
  uint64_t v18 = __Block_byref_object_dispose__10853;
  id v19 = v4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke;
  v10[3] = &unk_1E60AB040;
  v10[4] = self;
  id v7 = v19;
  id v11 = v7;
  __int16 v12 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2_102;
  v9[3] = &unk_1E60AB7F0;
  v9[4] = self;
  v9[5] = &buf;
  v9[6] = v13;
  id v8 = (id)[v6 performWriteTransactionWithBlock:v10 completionHandler:v9];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&buf, 8);
}

void __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = (void *)v4[18];
  id v6 = [v4 taskIdentifier];
  [v5 removePushObserverWithIdentifier:v6];

  char v7 = [*(id *)(*(void *)(a1 + 32) + 144) hasChangesInScopeWithIdentifier:*(void *)(*(void *)(a1 + 32) + 120)];
  id v8 = *(id **)(a1 + 32);
  if (v7)
  {
    if ((objc_msgSend(v8[18], "hasChangesWithPriorityLowerThanPriority:inScopeWithIdentifier:", +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"), *(void *)(*(void *)(a1 + 32) + 120)) & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
LABEL_16:
        [*(id *)(a1 + 32) _includeScopeInMingling];
        goto LABEL_17;
      }
      uint64_t v13 = __CPLTaskOSLogDomain_10798();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 120);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v35 = v17;
      id v15 = "Push repository for %{public}@ only contains changes allowing local conflict resolution. Will allow mingling.";
LABEL_14:
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      goto LABEL_15;
    }
    if (*(void *)(a1 + 40)) {
      goto LABEL_17;
    }
    objc_super v9 = [*(id *)(a1 + 32) session];
    if ([v9 allowsLocalConflictResolutionWhenOverQuota])
    {
      int v10 = *(void **)(a1 + 32);
      id v11 = (void *)v10[16];
      __int16 v12 = [v10 scope];
      LODWORD(v11) = [v11 valueForFlag:2 forScope:v12];

      if (!v11) {
        goto LABEL_17;
      }
      if (_CPLSilentLogging) {
        goto LABEL_16;
      }
      uint64_t v13 = __CPLTaskOSLogDomain_10798();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 120);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v35 = v14;
      id v15 = "Push repository for %{public}@ contains changes but we are allowing local conflict resolution when over-quot"
            "a. Will allow mingling.";
      goto LABEL_14;
    }
  }
  else
  {
    [v8 _updateQuotaStrategyAfterSuccessInTransaction:v3];
    [*(id *)(a1 + 32) _includeScopeInMingling];
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(void *)(v16 + 208) != -1)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2;
      void v33[3] = &unk_1E60AB410;
      v33[4] = v16;
      [v3 do:v33];
    }
  }
LABEL_17:
  if ([*(id *)(a1 + 40) isCPLErrorWithCode:35])
  {
    uint64_t v18 = [*(id *)(a1 + 40) userInfo];
    id v19 = [v18 objectForKeyedSubscript:@"CPLErrorScopeBusy"];

    if (v19) {
      uint64_t v20 = [v19 integerValue];
    }
    else {
      uint64_t v20 = 1;
    }
    if ([*(id *)(a1 + 32) forceSync])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v21 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 120);
          uint64_t v23 = +[CPLScopeChange descriptionForBusyState:v20];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v35 = v22;
          __int16 v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is busy (%@). Will stop forced sync", buf, 0x16u);
        }
LABEL_34:
      }
    }
    else
    {
      id v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v25 = [v24 BOOLForKey:@"CPLFailSyncSessionOnScopeBusy"];

      if ((v25 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v26 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 120);
            uint64_t v28 = +[CPLScopeChange descriptionForBusyState:v20];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v35 = v27;
            __int16 v36 = 2112;
            v37 = v28;
            _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is busy (%@). Will still continue synchronizing other scopes", buf, 0x16u);
          }
        }
        [*(id *)(a1 + 32) _excludeScopeFromMingling];
        v29 = [*(id *)(a1 + 40) userInfo];
        uint64_t v21 = [v29 objectForKeyedSubscript:@"CPLErrorRetryAfterDate"];

        uint64_t v30 = [*(id *)(a1 + 32) session];
        if ([*(id *)(a1 + 32) highPriority]) {
          uint64_t v31 = 7;
        }
        else {
          uint64_t v31 = 8;
        }
        [v30 requestSyncStateAtEndOfSyncSession:v31 reschedule:v21 != 0 proposedRescheduleDate:v21];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_34;
      }
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_101;
    v32[3] = &unk_1E60A8590;
    v32[4] = *(void *)(a1 + 32);
    v32[5] = v20;
    [v3 do:v32];
  }
}

void __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || ([v3 error], unint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [*(id *)(a1 + 32) taskDidFinishWithError:v4];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    char v7 = [v8 error];
    [v6 taskDidFinishWithError:v7];
  }
}

uint64_t __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  unint64_t v5 = (void *)v4[16];
  id v6 = [v4 scope];
  uint64_t v7 = [v5 setScope:v6 hasCompletedPushToTransportTask:*(void *)(*(void *)(a1 + 32) + 208) error:a2];

  return v7;
}

uint64_t __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_101(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[16];
  uint64_t v7 = [v4 scope];
  uint64_t v8 = [v6 storeBusyState:v5 forScope:v7 error:a2];

  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 160)) {
    return v8;
  }
  int v10 = *(void **)(v9 + 128);
  uint64_t v11 = *(void *)(a1 + 40);

  return objc_msgSend(v10, "storeBusyState:forScope:error:", v11);
}

- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CPLPushToTransportScopeTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke;
  v3[3] = &unk_1E60AB410;
  v3[4] = self;
  [a3 do:v3];
}

uint64_t __77__CPLPushToTransportScopeTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 160))
  {
    int v5 = objc_msgSend(*(id *)(v4 + 128), "valueForFlag:forScope:", 2);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v5)
    {
      int v6 = [*(id *)(v4 + 128) setValue:0 forFlag:2 forScope:*(void *)(v4 + 160) error:a2];
      uint64_t result = 0;
      if (!v6) {
        return result;
      }
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  uint64_t v8 = *(void **)(v4 + 128);
  uint64_t v9 = [(id)v4 scope];
  LODWORD(v8) = [v8 valueForFlag:2 forScope:v9];

  if (!v8) {
    return 1;
  }
  int v10 = *(void **)(a1 + 32);
  uint64_t v11 = (void *)v10[16];
  __int16 v12 = [v10 scope];
  uint64_t v13 = [v11 setValue:0 forFlag:2 forScope:v12 error:a2];

  return v13;
}

- (BOOL)_shouldNotTrustCloudCacheAfterError:(id)a3
{
  id v3 = a3;
  if ([v3 isCPLError])
  {
    uint64_t v4 = [v3 code];
    BOOL v6 = v4 == 25 || v4 == 80;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_includeScopeInMingling
{
  id v3 = [(CPLEngineSyncTask *)self session];
  [v3 includeScopeIdentifierInMingling:self->_scopeIdentifier];

  if (self->_sharedScope)
  {
    id v5 = [(CPLEngineSyncTask *)self session];
    uint64_t v4 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    [v5 includeScopeIdentifierInMingling:v4];
  }
}

- (void)_excludeScopeFromMingling
{
  id v3 = [(CPLEngineSyncTask *)self session];
  [v3 excludeScopeIdentifierFromMingling:self->_scopeIdentifier];

  if (self->_sharedScope)
  {
    id v5 = [(CPLEngineSyncTask *)self session];
    uint64_t v4 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    [v5 excludeScopeIdentifierFromMingling:v4];
  }
}

- (void)cancel
{
}

- (void)cancel:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLPushToTransportScopeTask;
  [(CPLEngineSyncTask *)&v11 cancel];
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__CPLPushToTransportScopeTask_cancel___block_invoke;
  v9[3] = &unk_1E60AA7B8;
  v9[4] = self;
  BOOL v10 = a3;
  BOOL v6 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = lock;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

void __38__CPLPushToTransportScopeTask_cancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentSubtask];
  if (objc_opt_respondsToSelector()) {
    [v2 cancel:*(unsigned __int8 *)(a1 + 40)];
  }
  else {
    [v2 cancel];
  }
  [*(id *)(*(void *)(a1 + 32) + 184) cancel];
}

- (void)launch
{
  [(CPLPushToTransportScopeTask *)self hash];
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLPushToTransportScopeTask;
  [(CPLEngineSyncTask *)&v3 launch];
  [(CPLPushToTransportScopeTask *)self _launch];
}

- (void)_launch
{
  [(CPLEngineSyncTask *)self setPhaseDescription:@"launching"];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v9 = v4;
  id v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __38__CPLPushToTransportScopeTask__launch__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) engineLibrary];
  objc_super v3 = [v2 store];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__10852;
  v17[4] = __Block_byref_object_dispose__10853;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_2;
  v8[3] = &unk_1E60A8558;
  v8[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v9 = v4;
  id v5 = v2;
  id v10 = v5;
  objc_super v11 = v17;
  __int16 v12 = v15;
  id v13 = v14;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_2_89;
  v7[3] = &unk_1E60A8508;
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v17;
  v7[6] = v15;
  v7[7] = v14;
  id v6 = (id)[v4 performWriteTransactionWithBlock:v8 completionHandler:v7];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) scope];
    *(void *)(*(void *)(a1 + 32) + 208) = [*(id *)(*(void *)(a1 + 32) + 128) pushToTransportTaskForScope:v4];
    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)v5[16];
    uint64_t v7 = [v5 scope];
    uint64_t v8 = [v6 uploadTransportGroupForScope:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 192);
    *(void *)(v9 + 192) = v8;

    if (([*(id *)(*(void *)(a1 + 32) + 128) hasFinishedInitialSyncForScope:v4] & 1) == 0) {
      *(void *)(*(void *)(a1 + 32) + 168) |= 1uLL;
    }
    if (([*(id *)(*(void *)(a1 + 32) + 128) hasFinishedAFullSyncForScope:v4] & 1) == 0) {
      *(void *)(*(void *)(a1 + 32) + 168) |= 2uLL;
    }
    if ([*(id *)(a1 + 40) hasPendingResetSync]) {
      *(void *)(*(void *)(a1 + 32) + 168) |= 4uLL;
    }
    objc_super v11 = [CPLTransportScopeMapping alloc];
    __int16 v12 = [*(id *)(a1 + 48) transport];
    uint64_t v13 = [(CPLTransportScopeMapping *)v11 initWithTranslator:v12];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 176);
    *(void *)(v14 + 176) = v13;

    char v16 = [*(id *)(a1 + 32) transportScope];
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 176);
    id v18 = [v4 scopeIdentifier];
    [v17 setObject:v16 forKeyedSubscript:v18];

    id v19 = *(void **)(*(void *)(a1 + 32) + 176);
    uint64_t v20 = [v4 scopeIdentifier];
    uint64_t v21 = [v19 objectForKeyedSubscript:v20];

    if (!v21)
    {
      v48 = [*(id *)(a1 + 32) transportScope];

      if (v48)
      {
        if (!_CPLSilentLogging)
        {
          v49 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = [*(id *)(a1 + 32) transportScope];
            *(_DWORD *)long long buf = 138412546;
            v67 = v4;
            __int16 v68 = 2112;
            v69 = v50;
            _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_ERROR, "Failed to create concrete scope of %@ from %@", buf, 0x16u);
          }
        }
        uint64_t v22 = +[CPLErrors unknownError];
        [v3 setError:v22];
LABEL_55:

        goto LABEL_56;
      }
    }
    uint64_t v22 = [*(id *)(a1 + 40) scopes];
    uint64_t v23 = [v22 sharingScopeForScope:v4];
    uint64_t v24 = *(void *)(a1 + 32);
    char v25 = *(void **)(v24 + 160);
    *(void *)(v24 + 160) = v23;

    uint64_t v26 = *(void *)(a1 + 32);
    if (!*(void *)(v26 + 160)) {
      goto LABEL_27;
    }
    uint64_t v27 = objc_msgSend(v22, "flagsForScope:");
    if ([v27 valueForFlag:36] && (objc_msgSend(v27, "valueForFlag:", 64) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v28 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(void **)(*(void *)(a1 + 32) + 160);
          *(_DWORD *)long long buf = 138412290;
          v67 = v29;
          _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
        }
      }
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void **)(v30 + 160);
      *(void *)(v30 + 160) = 0;
    }
    uint64_t v26 = *(void *)(a1 + 32);
    if (*(void *)(v26 + 160))
    {
      v63 = v21;
      uint64_t v32 = objc_msgSend(*(id *)(v26 + 128), "transportScopeForScope:");
      if (v32)
      {
        uint64_t v33 = *(void *)(a1 + 32);
        unint64_t v34 = *(void **)(v33 + 176);
        uint64_t v35 = [*(id *)(v33 + 160) scopeIdentifier];
        [v34 setObject:v32 forKeyedSubscript:v35];

        uint64_t v36 = *(void *)(a1 + 32);
        v62 = *(void **)(v36 + 176);
        v37 = [*(id *)(v36 + 160) scopeIdentifier];
        [v4 scopeIdentifier];
        uint64_t v38 = v22;
        v40 = id v39 = v3;
        [v62 setSharedScopeIdentifier:v37 forScopeWithIdentifier:v40];

        id v3 = v39;
        uint64_t v22 = v38;
      }
      uint64_t v41 = *(void *)(a1 + 32);
      v42 = *(void **)(v41 + 176);
      v43 = [*(id *)(v41 + 160) scopeIdentifier];
      v44 = [v42 objectForKeyedSubscript:v43];

      if (v32 && !v44)
      {
        uint64_t v21 = v63;
        if (!_CPLSilentLogging)
        {
          v45 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = *(void **)(*(void *)(a1 + 32) + 160);
            *(_DWORD *)long long buf = 138412546;
            v67 = v46;
            __int16 v68 = 2112;
            v69 = v32;
            _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "Failed to create concrete scope of %@ from %@", buf, 0x16u);
          }
        }
        v47 = +[CPLErrors unknownError];
        [v3 setError:v47];

        goto LABEL_55;
      }
      if (!_CPLSilentLogging)
      {
        v51 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = *(NSObject **)(*(void *)(a1 + 32) + 160);
          *(_DWORD *)long long buf = 138413058;
          v67 = v4;
          __int16 v68 = 2112;
          v69 = v52;
          __int16 v70 = 2112;
          v71 = v63;
          __int16 v72 = 2112;
          v73 = v44;
          _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_DEFAULT, "Will upload to %@/%@ concrete scopes: %@/%@", buf, 0x2Au);
        }
      }
      uint64_t v21 = v63;
    }
    else
    {
LABEL_27:
      if (_CPLSilentLogging) {
        goto LABEL_42;
      }
      uint64_t v32 = __CPLTaskOSLogDomain_10798();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        v67 = v4;
        __int16 v68 = 2112;
        v69 = v21;
        _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_DEFAULT, "Will upload to %@ concrete scope: %@", buf, 0x16u);
      }
    }

    uint64_t v26 = *(void *)(a1 + 32);
LABEL_42:
    uint64_t v53 = [*(id *)(v26 + 128) busyStateForScope:v4];
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)(a1 + 32);
    if (*(void *)(v55 + 160) && !v53) {
      uint64_t v54 = objc_msgSend(*(id *)(v55 + 128), "busyStateForScope:");
    }
    if (v54)
    {
      if (!_CPLSilentLogging)
      {
        v56 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = +[CPLScopeChange descriptionForBusyState:v54];
          *(_DWORD *)long long buf = 138412546;
          v67 = v4;
          __int16 v68 = 2112;
          v69 = v57;
          _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_DEFAULT, "Previous push-to-transport attempt for %@ failed because the scope was busy (%@)", buf, 0x16u);
        }
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 241) = 1;
    }
    v58 = *(void **)(a1 + 32);
    if (v58[20])
    {
      uint64_t v59 = [v58 _contributorsUpdatesInTransaction:v3];
      uint64_t v60 = *(void *)(*(void *)(a1 + 56) + 8);
      v61 = *(void **)(v60 + 40);
      *(void *)(v60 + 40) = v59;
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_87;
      v64[3] = &unk_1E60A8468;
      v64[4] = *(void *)(a1 + 32);
      long long v65 = *(_OWORD *)(a1 + 64);
      [v3 do:v64];
    }
    goto LABEL_55;
  }
LABEL_56:
}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_2_89(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 32);
  v10[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_3;
  v10[3] = &unk_1E60A84E0;
  id v11 = v3;
  long long v13 = v5;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  uint64_t v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) error];
LABEL_5:
    uint64_t v6 = v4;
    id v15 = (id)v4;
    uint64_t v7 = v3;
LABEL_6:
    [v7 _pushTaskDidFinishWithError:v6];

    return;
  }
  int v5 = [*(id *)(a1 + 40) isCancelled];
  id v3 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v4 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  id v8 = [*(id *)(a1 + 40) session];
  int v9 = [v8 shouldDefer];

  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v6 = +[CPLErrors sessionHasBeenDeferredError];
    id v15 = (id)v6;
    uint64_t v7 = v10;
    goto LABEL_6;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v11 _updateContributors:v12];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v13 = *(void **)(a1 + 40);
    [v13 _resetPriority];
  }
  else
  {
    uint64_t v14 = *(void **)(a1 + 40);
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 taskDidFinishWithError:0];
    }
    else
    {
      objc_msgSend(v14, "_uploadChangesWithPriority:maxBatchSize:");
    }
  }
}

uint64_t __38__CPLPushToTransportScopeTask__launch__block_invoke_87(void *a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1[4] + 144), "hasChangesWithPriorityLowerThanPriority:inScopeWithIdentifier:", +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"), *(void *)(a1[4] + 120)))
  {
    uint64_t result = [*(id *)(a1[4] + 144) resetPriorityForScopeWithIdentifier:*(void *)(a1[4] + 120) maxCount:10000 hasMore:*(void *)(a1[5] + 8) + 24 error:a2];
    if (!result) {
      return result;
    }
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 144) minimumPriorityForChangesInScopeWithIdentifier:*(void *)(a1[4] + 120)];
    }
  }
  return 1;
}

- (id)_contributorsUpdatesInTransaction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v18 = 0;
  id v17 = 0;
  BOOL v4 = [(CPLPushToTransportScopeTask *)self _shouldUploadBatchesWithDropReason:&v17 shouldQuarantineRecords:&v18 inTransaction:a3];
  id v5 = v17;
  if (v4)
  {
    uint64_t v6 = [(CPLEngineScopedTask *)self scope];
    uint64_t v7 = [v6 scopeIdentifier];

    id v8 = [(CPLEnginePushRepository *)self->_pushRepository contributorsUpdatesForScopeWithIdentifier:v7 maxCount:+[CPLBatchExtractionStrategy maximumRecordCountPerBatch]];
    if (![v8 count])
    {
      pushRepository = self->_pushRepository;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v7 = v7;
      id v15 = v7;
      char v16 = self;
      id v10 = [(CPLPushToTransportScopeTask *)self taskIdentifier];
      [(CPLEnginePushRepository *)pushRepository addPushObserver:&v14 withIdentifier:v10];
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLTaskOSLogDomain_10798();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CPLEngineScopedTask *)self scope];
      uint64_t v12 = [v11 scopeIdentifier];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Won't try to update contributors because %{public}@ is read-only: %@", buf, 0x16u);
    }
    id v8 = 0;
    goto LABEL_8;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

void __65__CPLPushToTransportScopeTask__contributorsUpdatesInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 updateSharingContributorUserIdentifiers];
  if ([v4 count])
  {
    id v5 = [v3 scopedIdentifier];
    uint64_t v6 = [v5 scopeIdentifier];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v9 = 0;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Client pushed contributors updates while uploading records - will retry immediately", v9, 2u);
        }
      }
      *(unsigned char *)(*(void *)(a1 + 40) + 243) = 1;
    }
  }
  else
  {
  }
}

- (void)_acknowledgeContributorUpdatesAndContinue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  id v5 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v6 = [v5 store];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__10852;
  v18[4] = __Block_byref_object_dispose__10853;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  void v15[3] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke;
  v10[3] = &unk_1E60A84B8;
  void v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = v18;
  long long v13 = v16;
  uint64_t v14 = v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_4;
  v9[3] = &unk_1E60A8508;
  v9[4] = self;
  void v9[5] = v18;
  v9[6] = v16;
  void v9[7] = v15;
  id v8 = (id)[v6 performWriteTransactionWithBlock:v10 completionHandler:v9];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_2;
    v10[3] = &unk_1E60AB638;
    id v4 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 48);
    id v11 = v5;
    uint64_t v13 = v6;
    id v7 = v3;
    id v12 = v7;
    [v7 do:v10];
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_3;
      v8[3] = &unk_1E60A8468;
      v8[4] = *(void *)(a1 + 32);
      long long v9 = *(_OWORD *)(a1 + 56);
      [v7 do:v8];
    }
  }
}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 32);
  v10[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_5;
  v10[3] = &unk_1E60A84E0;
  id v11 = v3;
  long long v13 = v5;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  id v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) error];
LABEL_5:
    uint64_t v6 = v4;
    id v15 = (id)v4;
    id v7 = v3;
LABEL_6:
    [v7 _pushTaskDidFinishWithError:v6];

    return;
  }
  int v5 = [*(id *)(a1 + 40) isCancelled];
  id v3 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v4 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  id v8 = [*(id *)(a1 + 40) session];
  int v9 = [v8 shouldDefer];

  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v6 = +[CPLErrors sessionHasBeenDeferredError];
    id v15 = (id)v6;
    id v7 = v10;
    goto LABEL_6;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v11 _updateContributors:v12];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v13 = *(void **)(a1 + 40);
    [v13 _resetPriority];
  }
  else
  {
    uint64_t v14 = *(void **)(a1 + 40);
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 taskDidFinishWithError:0];
    }
    else
    {
      objc_msgSend(v14, "_uploadChangesWithPriority:maxBatchSize:");
    }
  }
}

uint64_t __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 144) acknowledgeContributorsUpdates:*(void *)(a1 + 40) error:a2];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _contributorsUpdatesInTransaction:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return v3;
}

uint64_t __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 144) resetPriorityForScopeWithIdentifier:*(void *)(a1[4] + 120) maxCount:10000 hasMore:*(void *)(a1[5] + 8) + 24 error:a2];
  if (v3 && !*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 144) minimumPriorityForChangesInScopeWithIdentifier:*(void *)(a1[4] + 120)];
  }
  return v3;
}

- (void)_updateContributors:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  [(CPLEngineSyncTask *)self setPhaseDescription:@"updating contributors"];
  [(CPLPushToTransportScopeTask *)self _prepareTransportGroupForOneBatch];
  -[CPLPushToTransportScopeTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", @"update-contributors", [v4 count]);
  transport = self->_transport;
  sharedScope = self->_sharedScope;
  transportScopeMapping = self->_transportScopeMapping;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke;
  uint64_t v14 = &unk_1E60AB438;
  id v15 = self;
  id v8 = v4;
  id v16 = v8;
  int v9 = [(CPLEngineTransport *)transport updateContributorsTaskWithSharedScope:sharedScope contributorsUpdates:v8 transportScopeMapping:transportScopeMapping completionHandler:&v11];
  updateContributorsTask = self->_updateContributorsTask;
  self->_updateContributorsTask = v9;

  if (self->_highPriority) {
    -[CPLEngineTransportUpdateContributorsTask setHighPriorityBackground:](self->_updateContributorsTask, "setHighPriorityBackground:", 1, v11, v12, v13, v14, v15);
  }
  -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_updateContributorsTask, self->_transportGroup, v11, v12, v13, v14, v15);
}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_2;
  v10[3] = &unk_1E60A6660;
  void v10[4] = v4;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if ([v4 isCPLOperationCancelledError])
    {
      uint64_t v5 = 0;
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v5 = 1;
      uint64_t v6 = 0;
    }
    [*(id *)(a1 + 32) _didFinishTaskWithKey:@"update-contributors" error:v5 cancelled:v6];
    id v9 = *(id *)(a1 + 40);
    if ([v9 isCPLErrorWithCode:18])
    {
      id v10 = [v9 userInfo];
      id v11 = [v10 objectForKeyedSubscript:@"CPLErrorRejectedRecordIdentifiersAndReasons"];

      if (!_CPLSilentLogging)
      {
        id v12 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Failed to update contributors: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v24 = 0x3032000000;
      char v25 = __Block_byref_object_copy__10852;
      uint64_t v26 = __Block_byref_object_dispose__10853;
      id v27 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_66;
      v18[3] = &unk_1E60A8490;
      v18[4] = &v19;
      void v18[5] = &buf;
      [v11 enumerateKeysAndObjectsUsingBlock:v18];
      long long v13 = [*(id *)(a1 + 40) cplUnderlyingError];
      id v14 = v13;
      if (!v13) {
        id v14 = *(void **)(a1 + 40);
      }
      id v15 = v14;

      if (*((unsigned char *)v20 + 24))
      {
        uint64_t v16 = +[CPLErrors cplErrorWithCode:255 description:@"Server does not support contributors updates yet"];
      }
      else
      {
        if (*(void *)(*((void *)&buf + 1) + 40)) {
          +[CPLErrors cplErrorWithCode:150, @"%@", *(void *)(*((void *)&buf + 1) + 40) description];
        }
        else {
        uint64_t v16 = +[CPLErrors cplErrorWithCode:150 underlyingError:v15 description:@"Server rejected contributors updates with no particular reason"];
        }
      }
      char v17 = (void *)v16;

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      char v17 = v9;
    }
    [*(id *)(a1 + 32) _pushTaskDidFinishWithError:v17];
  }
  else
  {
    [*(id *)(a1 + 32) _didFinishTaskWithKey:@"update-contributors" error:0 cancelled:0];
    [*(id *)(*(void *)(a1 + 32) + 152) resetBackoffInterval];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    [v7 _acknowledgeContributorUpdatesAndContinue:v8];
  }
}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 hasPrefix:@"Cannot create or modify field"];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)_resetPriority
{
  id v3 = [(CPLEngineScopedTask *)self store];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke;
  v6[3] = &unk_1E60AB7F0;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_3;
  v5[3] = &unk_1E60AB7F0;
  v5[4] = self;
  v5[5] = v8;
  v5[6] = v7;
  id v4 = (id)[v3 performWriteTransactionWithBlock:v6 completionHandler:v5];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v8, 8);
}

void __45__CPLPushToTransportScopeTask__resetPriority__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_2;
    v4[3] = &unk_1E60A8468;
    long long v5 = *(_OWORD *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    [v3 do:v4];
  }
}

void __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_3(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v14 error];
LABEL_5:
    uint64_t v7 = (void *)v5;
    [v4 _pushTaskDidFinishWithError:v5];

    goto LABEL_6;
  }
  int v6 = [*(id *)(a1 + 32) isCancelled];
  id v4 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v5 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  uint64_t v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 shouldDefer];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = +[CPLErrors sessionHasBeenDeferredError];
    [v10 _pushTaskDidFinishWithError:v11];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) _resetPriority];
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    long long v13 = *(void **)(a1 + 32);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      [v13 taskDidFinishWithError:0];
    }
    else {
      [v13 _uploadChangesWithPriority:v12 maxBatchSize:0];
    }
  }
LABEL_6:
}

uint64_t __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 144) resetPriorityForScopeWithIdentifier:*(void *)(a1[4] + 120) maxCount:10000 hasMore:*(void *)(a1[5] + 8) + 24 error:a2];
  if (v3 && !*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 144) minimumPriorityForChangesInScopeWithIdentifier:*(void *)(a1[4] + 120)];
  }
  return v3;
}

- (void)_uploadChangesWithPriority:(unint64_t)a3 maxBatchSize:(unint64_t)a4
{
  if (!a4) {
    a4 = +[CPLBatchExtractionStrategy maximumRecordCountPerBatch];
  }
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CPLPushToTransportScopeTask__uploadChangesWithPriority_maxBatchSize___block_invoke;
  v10[3] = &unk_1E60AAE80;
  void v10[4] = self;
  void v10[5] = a4;
  v10[6] = a3;
  uint64_t v7 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10794;
  block[3] = &unk_1E60A6978;
  id v12 = v7;
  uint64_t v8 = lock;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);
}

void __71__CPLPushToTransportScopeTask__uploadChangesWithPriority_maxBatchSize___block_invoke(uint64_t a1)
{
  long long v13 = [CPLUploadPushedChangesTask alloc];
  uint64_t v2 = [*(id *)(a1 + 32) engineLibrary];
  uint64_t v3 = [*(id *)(a1 + 32) session];
  id v4 = [*(id *)(a1 + 32) clientCacheIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) scope];
  int v6 = [*(id *)(a1 + 32) transportScope];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[24];
  uint64_t v9 = v7[20];
  uint64_t v10 = v7[22];
  uint64_t v11 = v7[21];
  LOBYTE(v12) = [v7 highPriority];
  id v14 = [(CPLUploadPushedChangesTask *)v13 initWithEngineLibrary:v2 session:v3 clientCacheIdentifier:v4 scope:v5 transportScope:v6 storedTransportGroup:v8 sharedScope:v9 transportScopeMapping:v10 ruleGroup:v11 highPriority:v12 maxBatchSize:*(void *)(a1 + 40) pushRepositoryPriority:*(void *)(a1 + 48) pushRepository:*(void *)(*(void *)(a1 + 32) + 144)];

  [*(id *)(a1 + 32) _launchSubTask:v14];
}

- (void)_noteSuccessfulUpdateInTransaction:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_wasBusy)
  {
    uint64_t v5 = [(CPLEngineScopedTask *)self scope];
    if (!_CPLSilentLogging)
    {
      int v6 = __CPLTaskOSLogDomain_10798();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "It seems like %@ is not busy any more", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__CPLPushToTransportScopeTask__noteSuccessfulUpdateInTransaction___block_invoke;
    void v8[3] = &unk_1E60AB750;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [v4 do:v8];
  }
}

uint64_t __66__CPLPushToTransportScopeTask__noteSuccessfulUpdateInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 128) storeBusyState:0 forScope:*(void *)(a1 + 40) error:a2];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 160);
    if (v6)
    {
      uint64_t result = [*(id *)(v5 + 128) storeBusyState:0 forScope:v6 error:a2];
      if (!result) {
        return result;
      }
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v5 + 241) = 0;
    return 1;
  }
  return result;
}

- (void)_prepareTransportGroupForOneBatch
{
  storedTransportGroup = self->_storedTransportGroup;
  if (storedTransportGroup)
  {
    id v4 = storedTransportGroup;
  }
  else
  {
    id v4 = [(CPLEngineTransport *)self->_transport createGroupForChangeUpload];
  }
  transportGroup = self->_transportGroup;
  self->_transportGroup = v4;

  MEMORY[0x1F41817F8](v4, transportGroup);
}

- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5
{
  uint64_t v5 = a4;
  scopes = self->_scopes;
  uint64_t v8 = [(CPLEngineScopedTask *)self scope];
  LOBYTE(v5) = ![(CPLEngineScopeStorage *)scopes shouldDropAllUploadsForScope:v8 dropReason:a3 shouldQuarantineRecords:v5];

  return (char)v5;
}

- (void)_didFinishTaskWithKey:(id)a3 error:(BOOL)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  currentTaskKey = self->_currentTaskKey;
  if (!currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLTaskOSLogDomain_10798();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        char v22 = v16;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "%@ called without any started task", buf, 0xCu);
      }
    }
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    char v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m"];
    uint64_t v19 = NSStringFromSelector(a2);
    [v17 handleFailureInMethod:a2, self, v18, 286, @"%@ called without any started task", v19 object file lineNumber description];

    abort();
  }
  id v20 = v9;
  pushRepository = self->_pushRepository;
  [(NSDate *)self->_taskStartDate timeIntervalSinceNow];
  [(CPLEnginePushRepository *)pushRepository updateTimingStatisticForKey:currentTaskKey duration:self->_recordCount recordCount:v6 error:v5 cancelled:-v12];
  long long v13 = self->_currentTaskKey;
  self->_currentTaskKey = 0;

  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = 0;
}

- (void)_didStartTaskWithKey:(id)a3 recordCount:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = (NSString *)a3;
  if (self->_currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLTaskOSLogDomain_10798();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v12 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        char v17 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ called too many times", buf, 0xCu);
      }
    }
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m"];
    id v15 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, v14, 279, @"%@ called too many times", v15 object file lineNumber description];

    abort();
  }
  self->_currentTaskKey = v7;
  uint64_t v8 = v7;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = v9;

  self->_recordCount = a4;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CPLPushToTransportScopeTask;
  BOOL v4 = [(CPLEngineScopedTask *)&v17 checkScopeIsValidInTransaction:a3];
  if (v4)
  {
    if (self->_sharedScope)
    {
      BOOL v5 = [(CPLEngineScopedTask *)self store];
      BOOL v6 = [v5 scopes];
      id v7 = [v6 validLocalScopeIndexes];
      char v8 = objc_msgSend(v7, "containsIndex:", -[CPLEngineScope localIndex](self->_sharedScope, "localIndex"));

      if ((v8 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          double v12 = __CPLTaskOSLogDomain_10798();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            sharedScope = self->_sharedScope;
            id v14 = objc_opt_class();
            *(_DWORD *)long long buf = 138412546;
            uint64_t v19 = sharedScope;
            __int16 v20 = 2112;
            uint64_t v21 = v14;
            id v15 = v14;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Scope %@ is invalid, stopping %@ now", buf, 0x16u);
          }
          goto LABEL_12;
        }
LABEL_13:
        [(CPLPushToTransportScopeTask *)self cancel];
        LOBYTE(v4) = 0;
        return v4;
      }
    }
    id v9 = [(CPLEngineScopedTask *)self store];
    uint64_t v10 = [v9 cleanupTasks];
    int v11 = [v10 hasCleanupTasks];

    if (v11)
    {
      if (!_CPLSilentLogging)
      {
        double v12 = __CPLTaskOSLogDomain_10798();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Can't upload records until cleanup tasks have been done", buf, 2u);
        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)scopesForTask
{
  if (self->_sharedScope)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLPushToTransportScopeTask;
    uint64_t v3 = [(CPLEngineScopedTask *)&v7 scopesForTask];
    BOOL v4 = [v3 arrayByAddingObject:self->_sharedScope];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLPushToTransportScopeTask;
    BOOL v4 = [(CPLEngineScopedTask *)&v6 scopesForTask];
  }

  return v4;
}

- (void)_discardCurrentSubtask
{
  p_currentSubtaskLock = &self->_currentSubtaskLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  BOOL v5 = __53__CPLPushToTransportScopeTask__discardCurrentSubtask__block_invoke;
  objc_super v6 = &unk_1E60A5DD8;
  objc_super v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_currentSubtaskLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_currentSubtaskLock);
}

void __53__CPLPushToTransportScopeTask__discardCurrentSubtask__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 248);
  *(void *)(v1 + 248) = 0;
}

- (void)_launchSubTask:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __46__CPLPushToTransportScopeTask__launchSubTask___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  int v11 = self;
  id v5 = v4;
  id v12 = v5;
  objc_super v6 = v8;
  os_unfair_lock_lock(&self->_currentSubtaskLock);
  v9((uint64_t)v6);
  os_unfair_lock_unlock(&self->_currentSubtaskLock);

  objc_super v7 = (void *)[[NSString alloc] initWithFormat:@"launching subtask %@", objc_opt_class()];
  [(CPLEngineSyncTask *)self setPhaseDescription:v7];

  if ([(CPLEngineSyncTask *)self isCancelled]) {
    [(CPLUploadPushedChangesTask *)self->_currentSubtask cancel];
  }
}

uint64_t __46__CPLPushToTransportScopeTask__launchSubTask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setForeground:", objc_msgSend(*(id *)(a1 + 32), "foreground"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setForceSync:", objc_msgSend(*(id *)(a1 + 32), "forceSync"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setDelegate:");
  uint64_t v2 = [*(id *)(a1 + 32) transportUserIdentifier];
  [*(id *)(*(void *)(a1 + 32) + 248) setTransportUserIdentifier:v2];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 248);

  return [v3 launch];
}

- (CPLUploadPushedChangesTask)currentSubtask
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10852;
  id v15 = __Block_byref_object_dispose__10853;
  id v16 = 0;
  p_currentSubtaskLock = &self->_currentSubtaskLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  objc_super v7 = __45__CPLPushToTransportScopeTask_currentSubtask__block_invoke;
  char v8 = &unk_1E60A5CE8;
  id v9 = self;
  uint64_t v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_currentSubtaskLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_currentSubtaskLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLUploadPushedChangesTask *)v4;
}

void __45__CPLPushToTransportScopeTask_currentSubtask__block_invoke(uint64_t a1)
{
}

- (CPLPushToTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)CPLPushToTransportScopeTask;
  id v14 = [(CPLEngineScopedTask *)&v34 initWithEngineLibrary:v12 session:a4 clientCacheIdentifier:a5 scope:v13 transportScope:a7];
  if (v14)
  {
    id v15 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.cpl.pushtotransport", v15);
    lock = v14->_lock;
    v14->_lock = (OS_dispatch_queue *)v16;

    v14->_currentSubtaskLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [(CPLEngineSyncTask *)v14 engineLibrary];
    uint64_t v19 = [v18 transport];
    transport = v14->_transport;
    v14->_transport = (CPLEngineTransport *)v19;

    uint64_t v21 = [(CPLEngineSyncTask *)v14 engineLibrary];
    uint64_t v22 = [v21 store];
    uint64_t v23 = [v22 pushRepository];
    pushRepository = v14->_pushRepository;
    v14->_pushRepository = (CPLEnginePushRepository *)v23;

    char v25 = [(CPLEngineSyncTask *)v14 engineLibrary];
    uint64_t v26 = [v25 store];
    uint64_t v27 = [v26 scopes];
    scopes = v14->_scopes;
    v14->_scopes = (CPLEngineScopeStorage *)v27;

    uint64_t v29 = [v12 scheduler];
    scheduler = v14->_scheduler;
    v14->_scheduler = (CPLEngineScheduler *)v29;

    v14->_taskItem = -1;
    uint64_t v31 = [v13 scopeIdentifier];
    scopeIdentifier = v14->_scopeIdentifier;
    v14->_scopeIdentifier = (NSString *)v31;
  }
  return v14;
}

@end