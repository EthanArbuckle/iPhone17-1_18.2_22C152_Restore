@interface CPLUploadComputeStatesScopeTask
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (CPLUploadComputeStatesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)taskIdentifier;
- (void)_deleteTempFolderForPayloads;
- (void)_discardExtractedBatchAndGetNextBatch;
- (void)_dropAllComputeStates;
- (void)_dropLocalComputeStates:(id)a3;
- (void)_getNextBatchAndUpload;
- (void)_requestMissingPayloads;
- (void)_updateComputeSyncUploadMetricsWithError:(id)a3;
- (void)_uploadComputeStatesTaskDidFinishWithError:(id)a3;
- (void)_uploadExtractedBatch;
- (void)cancel;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLUploadComputeStatesScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_knownRecords, 0);
  objc_storeStrong((id *)&self->_computeStatesAccumulator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestMissingPayloadsProgress, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_uploadComputeStatesTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

- (id)taskIdentifier
{
  return @"engine.sync.uploadcomputestates";
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (self->_didUploadSomeComputeStates)
  {
    v5 = [(CPLEngineSyncTask *)self session];
    [v5 requestSyncStateAtEndOfSyncSession:4 reschedule:v4 == 0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CPLUploadComputeStatesScopeTask;
  [(CPLEngineSyncTask *)&v6 taskDidFinishWithError:v4];
}

- (void)_updateComputeSyncUploadMetricsWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineSyncTask *)self engineLibrary];
  [v5 updateComputeSyncMetrics:0 silentDecryptionFailed:0 error:v4];
}

- (void)_uploadComputeStatesTaskDidFinishWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    objc_super v6 = __CPLTaskOSLogDomain_1318();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Upload finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }
  }
  v7 = [(CPLEngineSyncTask *)self engineLibrary];
  v8 = [v7 store];

  v9 = [v8 scopes];
  v10 = [(CPLEngineScopedTask *)self scope];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1320;
  v26 = __Block_byref_object_dispose__1321;
  id v11 = v5;
  id v27 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke;
  v17[3] = &unk_1E60A77C0;
  id v12 = v8;
  id v18 = v12;
  v19 = self;
  SEL v22 = a2;
  id v13 = v10;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2_50;
  v16[3] = &unk_1E60AB878;
  v16[4] = self;
  v16[5] = &buf;
  id v15 = (id)[v12 performWriteTransactionWithBlock:v17 completionHandler:v16];

  _Block_object_dispose(&buf, 8);
}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) recordComputeStatePushQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2;
  v15[3] = &unk_1E60A7108;
  v15[4] = *(void *)(a1 + 40);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v16 = v5;
  uint64_t v17 = v6;
  [v3 do:v15];
  if ([*(id *)(a1 + 40) isScopeValidInTransaction:v3])
  {
    v7 = [*(id *)(a1 + 48) scopeIdentifier];
    char v8 = [v5 hasChangesInScopeWithIdentifier:v7];

    if ((v8 & 1) == 0 && *(void *)(*(void *)(a1 + 40) + 184) != -1)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_49;
      v11[3] = &unk_1E60AAF20;
      id v12 = *(id *)(a1 + 56);
      id v9 = *(id *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 40);
      id v13 = v9;
      uint64_t v14 = v10;
      [v3 do:v11];
    }
  }
}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2_50(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _deleteTempFolderForPayloads];
  id v4 = *(void **)(a1 + 32);
  if (v4[25])
  {
    id v5 = [v4 session];
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = v6[25];
    char v8 = [v6 scope];
    id v9 = [v8 scopeIdentifier];
    [v5 noteSyncSessionInformation:@"%lu compute states for %@ have been dropped", v7, v9];

    id v4 = *(void **)(a1 + 32);
  }
  if (v4[24])
  {
    uint64_t v10 = [v4 session];
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = v11[24];
    id v13 = [v11 scope];
    uint64_t v14 = [v13 scopeIdentifier];
    [v10 noteSyncSessionInformation:@"%lu compute states for %@ have been put aside", v12, v14];

    id v4 = *(void **)(a1 + 32);
  }
  if (v4[26])
  {
    id v15 = [v4 session];
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = v16[26];
    id v18 = [v16 scope];
    v19 = [v18 scopeIdentifier];
    [v15 noteSyncSessionInformation:@"%lu compute state payloads for %@ has been requested and %lu have been provided", v17, v19, *(void *)(*(void *)(a1 + 32) + 216)];
  }
  id v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v20)
  {
    v29 = [v3 error];

    if (v29)
    {
      v30 = *(void **)(a1 + 32);
      v31 = [v3 error];
      [v30 taskDidFinishWithError:v31];

      goto LABEL_18;
    }
    id v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if ([v20 isCPLThrottlingError])
  {
    if (!_CPLSilentLogging)
    {
      id v21 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        SEL v22 = [*(id *)(a1 + 32) scope];
        v23 = [v22 scopeIdentifier];
        *(_DWORD *)long long buf = 138543362;
        v33 = v23;
        _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Uploading compute states for %{public}@ has been throttled, we will likely need to retry that", buf, 0xCu);
      }
    }
    uint64_t v24 = [*(id *)(a1 + 32) session];
    v25 = [*(id *)(a1 + 32) scope];
    v26 = [v25 scopeIdentifier];
    [v24 noteSyncSessionInformation:@"Uploading compute states for %@ has been throttled", v26];

    id v27 = *(void **)(a1 + 32);
    uint64_t v28 = 0;
  }
  else
  {
    id v27 = *(void **)(a1 + 32);
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v27 taskDidFinishWithError:v28];
LABEL_18:
}

BOOL __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1320;
  id v21 = __Block_byref_object_dispose__1321;
  id v22 = 0;
  id v4 = *(void **)(*(void *)(a1 + 32) + 152);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_3;
  v11[3] = &unk_1E60A70E0;
  uint64_t v14 = &v23;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v15 = &v17;
  uint64_t v16 = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v7;
  [v4 enumerateUploadedComputeStateWithBlock:v11];
  int v8 = *((unsigned __int8 *)v24 + 24);
  if (a2 && !*((unsigned char *)v24 + 24))
  {
    *a2 = (id) v18[5];
    int v8 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v9;
}

uint64_t __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_49(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setScope:*(void *)(a1 + 40) hasCompletedUploadComputeStateTask:*(void *)(*(void *)(a1 + 48) + 184) error:a2];
}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = [v8 fileStorageIdentifier];

  if (v9)
  {
    uint64_t v10 = (void *)a1[4];
    id v11 = [v8 fileURL];
    uint64_t v12 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v12 + 40);
    LOBYTE(v10) = [v10 releaseFileURL:v11 forComputeState:v8 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v10;

    int v13 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = _CPLSilentLogging == 0;
    }
    if (!v14) {
      goto LABEL_19;
    }
    id v15 = __CPLTaskOSLogDomain_1318();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    uint64_t v16 = *(void *)(*(void *)(a1[7] + 8) + 40);
    *(_DWORD *)long long buf = 138412546;
    id v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    uint64_t v17 = "Failed to release file for %@: %@";
    goto LABEL_17;
  }
  id v18 = [v7 fileURL];

  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v24 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "Compute state with updated payload should have a file URL", buf, 2u);
      }
    }
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = a1[8];
    uint64_t v27 = a1[5];
    uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m"];
    [v25 handleFailureInMethod:v26 object:v27 file:v28 lineNumber:626 description:@"Compute state with updated payload should have a file URL"];

    abort();
  }
  uint64_t v19 = (void *)a1[4];
  uint64_t v20 = *(void *)(a1[7] + 8);
  id v29 = *(id *)(v20 + 40);
  char v21 = [v19 updateFileURLForComputeState:v7 error:&v29];
  objc_storeStrong((id *)(v20 + 40), v29);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v21;
  int v13 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = _CPLSilentLogging == 0;
  }
  if (v22)
  {
    id v15 = __CPLTaskOSLogDomain_1318();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      int v13 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      goto LABEL_19;
    }
    uint64_t v23 = *(void *)(*(void *)(a1[7] + 8) + 40);
    *(_DWORD *)long long buf = 138412546;
    id v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v23;
    uint64_t v17 = "Failed to update file for %@: %@";
LABEL_17:
    _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:
  if (!v13) {
    *a4 = 1;
  }
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLUploadComputeStatesScopeTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CPLUploadComputeStatesScopeTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1352;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __41__CPLUploadComputeStatesScopeTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  return [v2 cancel];
}

- (void)launch
{
  v12.receiver = self;
  v12.super_class = (Class)CPLUploadComputeStatesScopeTask;
  [(CPLEngineSyncTask *)&v12 launch];
  id v3 = [(CPLEngineScopedTask *)self store];
  id v4 = [v3 scopes];
  id v5 = [(CPLEngineScopedTask *)self scope];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CPLUploadComputeStatesScopeTask_launch__block_invoke;
  v9[3] = &unk_1E60AB068;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = (id)[v3 performReadTransactionWithBlock:v9];
}

void __41__CPLUploadComputeStatesScopeTask_launch__block_invoke(id *a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [a1[4] isScopeValidInTransaction:a2];
  id v4 = a1[4];
  if (v3)
  {
    id v5 = [a1[4] session];
    if ([v5 isComputeStateTaskUploadEnabled])
    {
      id v6 = a1[5];
      id v7 = a1[6];
      id v26 = 0;
      char v8 = [v6 shouldDropAllUploadsForScope:v7 dropReason:&v26 shouldQuarantineRecords:0];
      id v9 = v26;

      if ((v8 & 1) == 0)
      {
        id v10 = [a1[4] session];
        id v11 = [v10 scopeIdentifiersExcludedFromPushToTransport];
        objc_super v12 = [a1[6] scopeIdentifier];
        int v13 = [v11 containsObject:v12];

        if (v13)
        {
          if (!_CPLSilentLogging)
          {
            BOOL v14 = __CPLTaskOSLogDomain_1318();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = a1[6];
              *(_DWORD *)long long buf = 138412290;
              id v28 = v15;
              _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "%@ is temporarily excluded from pushing to transport - won't upload any compute states for this scope", buf, 0xCu);
            }
          }
          [a1[4] _uploadComputeStatesTaskDidFinishWithError:0];
        }
        else
        {
          id v18 = [a1[5] sharingScopeForScope:a1[6]];
          if (v18)
          {
            uint64_t v19 = [a1[5] transportScopeForScope:v18];
            if (v19)
            {
              uint64_t v20 = (void *)*((void *)a1[4] + 14);
              char v21 = [v18 scopeIdentifier];
              [v20 setObject:v19 forKeyedSubscript:v21];

              BOOL v22 = (void *)*((void *)a1[4] + 14);
              uint64_t v23 = [v18 scopeIdentifier];
              uint64_t v24 = [a1[6] scopeIdentifier];
              [v22 setSharedScopeIdentifier:v23 forScopeWithIdentifier:v24];
            }
            objc_storeStrong((id *)a1[4] + 21, v18);
          }
          *((void *)a1[4] + 23) = [a1[5] uploadComputeStateTaskForScope:a1[6]];
          [a1[4] _getNextBatchAndUpload];
        }
LABEL_19:

        return;
      }
    }
    else
    {

      id v9 = 0;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = a1[6];
        *(_DWORD *)long long buf = 138412546;
        id v28 = v17;
        __int16 v29 = 2112;
        id v30 = v9;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "We must drop all compute states for %@: %@", buf, 0x16u);
      }
    }
    *((void *)a1[4] + 23) = [a1[5] uploadComputeStateTaskForScope:a1[6]];
    [a1[4] _dropAllComputeStates];
    goto LABEL_19;
  }
  id v25 = +[CPLErrors operationCancelledError];
  objc_msgSend(v4, "_uploadComputeStatesTaskDidFinishWithError:");
}

- (void)_dropAllComputeStates
{
  char v3 = [(CPLEngineScopedTask *)self store];
  id v4 = [(CPLEngineScopedTask *)self scope];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke;
  v11[3] = &unk_1E60A70B8;
  void v11[4] = self;
  id v5 = v3;
  id v12 = v5;
  id v13 = v4;
  BOOL v14 = v15;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_2;
  v8[3] = &unk_1E60AB040;
  v8[4] = self;
  id v10 = v15;
  id v6 = v13;
  id v9 = v6;
  id v7 = (id)[v5 performWriteTransactionWithBlock:v11 completionHandler:v8];

  _Block_object_dispose(v15, 8);
}

void __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isScopeValidInTransaction:v3]
    && ![*(id *)(a1 + 32) isCancelled])
  {
    id v6 = [*(id *)(a1 + 32) session];
    int v7 = [v6 shouldDefer];

    if (!v7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_41;
      v13[3] = &unk_1E60AB638;
      id v14 = *(id *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      id v15 = v10;
      uint64_t v16 = v12;
      uint64_t v17 = v11;
      [v3 do:v13];

      goto LABEL_5;
    }
    if (!_CPLSilentLogging)
    {
      char v8 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v19 = (id)objc_opt_class();
        id v9 = v19;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);
      }
    }
    uint64_t v4 = +[CPLErrors sessionHasBeenDeferredError];
  }
  else
  {
    uint64_t v4 = +[CPLErrors operationCancelledError];
  }
  id v5 = (void *)v4;
  [v3 setError:v4];

LABEL_5:
}

void __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 error];
    [v5 _uploadComputeStatesTaskDidFinishWithError:v6];
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      int v7 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v10 = 134218242;
        uint64_t v11 = v9;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Dropped %ld compute states for %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _dropAllComputeStates];
  }
  else
  {
    [*(id *)(a1 + 32) _uploadComputeStatesTaskDidFinishWithError:0];
  }
}

uint64_t __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) recordComputeStatePushQueue];
  if (objc_msgSend(v4, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", objc_msgSend(*(id *)(a1 + 40), "localIndex"), 1000, *(void *)(*(void *)(a1 + 56) + 8) + 24, a2))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      || *(void *)(*(void *)(a1 + 48) + 184) == -1)
    {
      uint64_t v5 = 1;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) scopes];
      uint64_t v5 = [v6 setScope:*(void *)(a1 + 40) hasCompletedUploadComputeStateTask:*(void *)(*(void *)(a1 + 48) + 184) error:a2];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_discardExtractedBatchAndGetNextBatch
{
  id v3 = [(CPLEngineScopedTask *)self store];
  uint64_t v4 = [v3 recordComputeStatePushQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke;
  v8[3] = &unk_1E60AB550;
  v8[4] = self;
  id v9 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_3;
  v7[3] = &unk_1E60AB578;
  v7[4] = self;
  id v5 = v4;
  id v6 = (id)[v3 performWriteTransactionWithBlock:v8 completionHandler:v7];
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 isScopeValidInTransaction:v4])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2;
    v8[3] = &unk_1E60AB750;
    id v5 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 do:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2_40;
    v7[3] = &unk_1E60AB8A0;
    v7[4] = *(void *)(a1 + 32);
    [v4 addCleanupBlock:v7];
  }
  else
  {
    id v6 = +[CPLErrors operationCancelledError];
    [v4 setError:v6];
  }
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  [*(id *)(a1 + 32) _deleteTempFolderForPayloads];
  id v3 = [v9 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v9 error];
    [v4 _uploadComputeStatesTaskDidFinishWithError:v5];
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) isCancelled];
    int v7 = *(void **)(a1 + 32);
    if (v6)
    {
      uint64_t v8 = +[CPLErrors operationCancelledError];
      [v7 _uploadComputeStatesTaskDidFinishWithError:v8];
    }
    else
    {
      [v7 _getNextBatchAndUpload];
    }
  }
}

BOOL __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1320;
  id v15 = __Block_byref_object_dispose__1321;
  id v16 = 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 152);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_38;
  v7[3] = &unk_1E60A7090;
  id v9 = &v17;
  id v8 = *(id *)(a1 + 40);
  int v10 = &v11;
  [v3 enumerateUploadedComputeStateWithBlock:v7];
  int v4 = *((unsigned __int8 *)v18 + 24);
  if (a2 && !*((unsigned char *)v18 + 24))
  {
    *a2 = (id) v12[5];
    int v4 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v5 = v4 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v5;
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2_40(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 160);
    *(void *)(v6 + 160) = 0;
  }
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_38(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 fileStorageIdentifier];

  if (v9)
  {
    int v10 = (void *)a1[4];
    uint64_t v11 = [v8 fileURL];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v12 + 40);
    LOBYTE(v10) = [v10 releaseFileURL:v11 forComputeState:v8 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v10;
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)
    || (uint64_t v13 = (void *)a1[4],
        uint64_t v14 = *(void *)(a1[6] + 8),
        id v16 = *(id *)(v14 + 40),
        char v15 = [v13 removeComputeState:v7 error:&v16],
        objc_storeStrong((id *)(v14 + 40), v16),
        (*(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v15) == 0))
  {
    *a4 = 1;
  }
}

- (void)_getNextBatchAndUpload
{
  uint64_t v4 = [(CPLEngineScopedTask *)self store];
  BOOL v5 = [(CPLEngineScopedTask *)self scope];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke;
  v10[3] = &unk_1E60AB528;
  v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  SEL v13 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_3;
  v9[3] = &unk_1E60AB578;
  v9[4] = self;
  id v6 = v5;
  id v7 = v4;
  id v8 = (id)[v7 performWriteTransactionWithBlock:v10 completionHandler:v9];
}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    if (*(void *)(*(void *)(a1 + 32) + 152))
    {
      if (!_CPLSilentLogging)
      {
        id v25 = __CPLTaskOSLogDomain_1318();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "There should not be any compute states dequeued here", buf, 2u);
        }
      }
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v27 = *(void *)(a1 + 56);
      uint64_t v28 = *(void *)(a1 + 32);
      __int16 v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m"];
      [v26 handleFailureInMethod:v27 object:v28 file:v29 lineNumber:278 description:@"There should not be any compute states dequeued here"];

      abort();
    }
    uint64_t v4 = [*(id *)(a1 + 40) recordComputeStatePushQueue];
    BOOL v5 = [*(id *)(a1 + 40) idMapping];
    id v6 = [*(id *)(a1 + 40) cloudCache];
    id v7 = [*(id *)(a1 + 40) transactionClientCacheView];
    id v8 = [*(id *)(a1 + 40) transientPullRepository];
    id v9 = [*(id *)(a1 + 40) ignoredRecords];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_30;
    v41[3] = &unk_1E60A6FF0;
    id v10 = v4;
    id v42 = v10;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v43 = v11;
    uint64_t v44 = v12;
    id v13 = v7;
    id v45 = v13;
    id v14 = v5;
    id v46 = v14;
    id v15 = v6;
    id v47 = v15;
    [v3 do:v41];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_31;
    v30[3] = &unk_1E60A7068;
    id v31 = v10;
    id v16 = *(id *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(a1 + 40);
    id v32 = v16;
    uint64_t v33 = v17;
    id v34 = v13;
    id v35 = v14;
    id v36 = v8;
    id v37 = v9;
    id v38 = v15;
    id v39 = v18;
    id v40 = v3;
    id v19 = v15;
    id v20 = v9;
    id v21 = v8;
    id v22 = v14;
    id v23 = v13;
    id v24 = v10;
    [v40 do:v30];
  }
}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 144);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_4;
  v10[3] = &unk_1E60A6728;
  v10[4] = v4;
  id v11 = v3;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1352;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) engineLibrary];
  id v3 = [v2 scheduler];
  [v3 willRunEngineElement:CPLEngineElementUploadComputeStates];

  uint64_t v4 = [*(id *)(a1 + 40) error];

  BOOL v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v8 = [*(id *)(a1 + 40) error];
    [v5 _uploadComputeStatesTaskDidFinishWithError:v8];
  }
  else if (v5[19])
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _requestMissingPayloads];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    [v7 _uploadComputeStatesTaskDidFinishWithError:0];
  }
}

uint64_t __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_30(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) scopeIdentifier];
  uint64_t v4 = [*(id *)(a1 + 48) session];
  uint64_t v5 = 1;
  id v6 = objc_msgSend(v2, "computeStatesToUploadWithScopeIdentifier:localState:maximumCount:", v3, 1, objc_msgSend(v4, "maximumComputeStatesToUploadPerBatch"));

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    id v11 = 0;
    uint64_t v12 = *(void *)v34;
    id v13 = &unk_1E9D43000;
    *(void *)&long long v9 = 138412290;
    long long v29 = v9;
    id v30 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v7);
        }
        id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v16 = *(void **)(a1 + 56);
        uint64_t v17 = objc_msgSend(v15, "itemScopedIdentifier", v29);
        LODWORD(v16) = [v16 hasRecordWithScopedIdentifier:v17];

        if (v16)
        {
          char v32 = 0;
          id v18 = *(void **)(a1 + 64);
          id v19 = [v15 itemScopedIdentifier];
          id v20 = [v18 cloudScopedIdentifierForLocalScopedIdentifier:v19 isFinal:&v32];

          if (v20 && [*(id *)(a1 + 72) hasRecordWithScopedIdentifier:v20])
          {
            if (!v13[2752])
            {
              id v21 = __CPLTaskOSLogDomain_1318();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                [v15 itemScopedIdentifier];
                id v22 = v11;
                id v24 = v23 = v13;
                *(_DWORD *)long long buf = v29;
                id v38 = v24;
                _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Setting compute state for %@ back to pending as the record is now in the cloud cache", buf, 0xCu);

                id v13 = v23;
                id v11 = v22;
                id v7 = v30;
              }
            }
            id v25 = *(void **)(a1 + 32);
            id v31 = v11;
            int v26 = [v25 updateLocalStateForComputeState:v15 newLocalState:0 error:&v31];
            id v27 = v31;

            if (!v26)
            {

              uint64_t v5 = 0;
              goto LABEL_21;
            }
            id v11 = v27;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    uint64_t v5 = 1;
    id v27 = v11;
  }
  else
  {
    id v27 = 0;
  }
LABEL_21:

  return v5;
}

uint64_t __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) scopeIdentifier];
  uint64_t v6 = a1;
  id v7 = [*(id *)(a1 + 48) session];
  uint64_t v8 = objc_msgSend(v4, "computeStatesToUploadWithScopeIdentifier:localState:maximumCount:", v5, 0, objc_msgSend(v7, "maximumComputeStatesToUploadPerBatch"));

  v68 = -[CPLUploadComputeStatesAccumulator initWithCapacity:maximumPayloadRequestsBatchSize:]([CPLUploadComputeStatesAccumulator alloc], "initWithCapacity:maximumPayloadRequestsBatchSize:", [v8 count], 50);
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  id obj = objc_alloc_init(CPLRecordTargetMapping);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v9 = v8;
  uint64_t v72 = [v9 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v72)
  {
    v60 = a2;
    uint64_t v10 = 0;
    unint64_t v73 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v71 = *(void *)v84;
    uint64_t v13 = v6;
    id v61 = v9;
LABEL_3:
    uint64_t v66 = v11;
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v84 != v71) {
        objc_enumerationMutation(v9);
      }
      if (v73 > 0xA00000)
      {
        uint64_t v11 = v66;
        goto LABEL_42;
      }
      id v15 = *(void **)(*((void *)&v83 + 1) + 8 * v14);
      id v16 = [v15 itemScopedIdentifier];
      if (([*(id *)(v13 + 56) hasRecordWithScopedIdentifier:v16] & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          id v23 = __CPLTaskOSLogDomain_1318();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v88 = v16;
            _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Dropping compute state for %@ as the record is not known from the client cache view", buf, 0xCu);
          }
        }
        id v24 = *(void **)(v13 + 32);
        id v82 = v10;
        char v25 = [v24 removeComputeState:v15 error:&v82];
        id v26 = v82;

        if ((v25 & 1) == 0)
        {
          if (_CPLSilentLogging)
          {
            v57 = v60;
          }
          else
          {
            v56 = __CPLTaskOSLogDomain_1318();
            v57 = v60;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              v88 = v16;
              __int16 v89 = 2112;
              id v90 = v26;
              _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_ERROR, "Failed to remove compute state for %@: %@", buf, 0x16u);
            }
          }
          goto LABEL_62;
        }
        ++v12;
        uint64_t v10 = v26;
        goto LABEL_37;
      }
      char v81 = 0;
      uint64_t v17 = [*(id *)(v13 + 64) cloudScopedIdentifierForLocalScopedIdentifier:v16 isFinal:&v81];
      id v18 = v17;
      if (!v17) {
        break;
      }
      v70 = v16;
      id v19 = *(void **)(v13 + 72);
      id v20 = (void *)[v17 copy];
      id v21 = [v19 changeWithScopedIdentifier:v20];

      if ([v21 isDelete])
      {
        id v16 = v70;
        if (!_CPLSilentLogging)
        {
          id v22 = __CPLTaskOSLogDomain_1318();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v88 = v18;
            _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "%@ appears to have been deleted - will need to check directly with the cloud", buf, 0xCu);
          }
        }
        id v21 = 0;
      }
      else
      {
        id v16 = v70;
        if (!v21)
        {
          id v21 = [*(id *)(v13 + 80) recordWithScopedIdentifier:v18];
          if (!v21)
          {
            id v21 = [*(id *)(v13 + 88) recordWithScopedIdentifier:v18 isFinal:1];
            if (!v21) {
              break;
            }
          }
        }
        [v63 setObject:v21 forKeyedSubscript:v18];
      }
      id v27 = [v15 fileStorageIdentifier];

      uint64_t v69 = v12;
      if (v27)
      {
        v64 = v21;
        uint64_t v28 = v18;
        long long v29 = *(void **)(v13 + 32);
        id v79 = v10;
        id v30 = [v29 retainFileURLForComputeState:v15 error:&v79];
        id v26 = v79;

        if (!v30)
        {
          if (_CPLSilentLogging)
          {
            v57 = v60;
          }
          else
          {
            v59 = __CPLTaskOSLogDomain_1318();
            v57 = v60;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              v88 = v16;
              __int16 v89 = 2112;
              id v90 = v26;
              _os_log_impl(&dword_1B4CAC000, v59, OS_LOG_TYPE_ERROR, "Failed to find compute state payload for %@: %@", buf, 0x16u);
            }
          }
          goto LABEL_60;
        }
        id v31 = *(void **)(v13 + 32);
        id v78 = v26;
        uint64_t v62 = [v31 fileSizeForComputeStatePayloadFileURL:v30 error:&v78];
        id v67 = v78;

        [v15 setFileURL:v30];
        char v32 = [CPLRecordComputeState alloc];
        long long v33 = [v15 fileStorageIdentifier];
        [v15 version];
        v35 = uint64_t v34 = v13;
        long long v36 = [v15 adjustmentFingerprint];
        id v37 = [v15 lastUpdatedDate];
        id v38 = [(CPLRecordComputeState *)v32 initWithItemScopedIdentifier:v28 fileStorageIdentifier:v33 version:v35 fileURL:v30 adjustmentFingerprint:v36 lastUpdatedDate:v37];

        uint64_t v39 = v34;
        uint64_t v40 = v62;

        id v9 = v61;
        [(CPLUploadComputeStatesAccumulator *)v68 addLocalComputeStateToUpload:v15 cloudComputeState:v38];

        id v18 = v28;
        id v21 = v64;
      }
      else
      {
        id v67 = v10;
        uint64_t v44 = [CPLRecordComputeState alloc];
        id v45 = [v15 version];
        id v46 = [v15 adjustmentFingerprint];
        [v15 lastUpdatedDate];
        v47 = uint64_t v39 = v13;
        id v30 = [(CPLRecordComputeState *)v44 initWithItemScopedIdentifier:v18 version:v45 fileURL:0 adjustmentFingerprint:v46 lastUpdatedDate:v47];

        [(CPLUploadComputeStatesAccumulator *)v68 requestPayloadForLocalComputeState:v15 cloudComputeState:v30];
        uint64_t v40 = 10240;
      }

      v73 += v40;
      v48 = [*(id *)(v39 + 96) cloudCache];
      v49 = [v48 targetForRecordWithCloudScopedIdentifier:v18];

      [(CPLRecordTargetMapping *)obj setTarget:v49 forRecordWithScopedIdentifier:v18];
      uint64_t v13 = v39;
      uint64_t v12 = v69;
      id v16 = v70;
      uint64_t v10 = v67;
LABEL_36:

LABEL_37:
      if (v72 == ++v14)
      {
        uint64_t v11 = v66;
        uint64_t v72 = [v9 countByEnumeratingWithState:&v83 objects:v91 count:16];
        if (v72) {
          goto LABEL_3;
        }
        goto LABEL_42;
      }
    }
    if (!_CPLSilentLogging)
    {
      v41 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v88 = v16;
        _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_DEFAULT, "Putting compute state for %@ aside as the record is not in the cloud cache yet", buf, 0xCu);
      }
    }
    uint64_t v28 = v18;
    id v42 = *(void **)(v13 + 32);
    id v80 = v10;
    char v43 = [v42 updateLocalStateForComputeState:v15 newLocalState:1 error:&v80];
    id v26 = v80;

    if ((v43 & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
        v57 = v60;
      }
      else
      {
        v58 = __CPLTaskOSLogDomain_1318();
        v57 = v60;
        v64 = v58;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          v88 = v16;
          __int16 v89 = 2112;
          id v90 = v26;
          _os_log_impl(&dword_1B4CAC000, v58, OS_LOG_TYPE_ERROR, "Failed to put compute state for %@ aside: %@", buf, 0x16u);
        }
LABEL_60:
      }
LABEL_62:

      if (v57)
      {
        id v26 = v26;
        uint64_t v54 = 0;
        void *v57 = v26;
      }
      else
      {
        uint64_t v54 = 0;
      }
      goto LABEL_48;
    }
    ++v66;
    uint64_t v10 = v26;
    id v18 = v28;
    goto LABEL_36;
  }
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v13 = v6;
LABEL_42:
  id v26 = v10;

  if ([(CPLUploadComputeStatesAccumulator *)v68 hasEnqueuedComputeStatesToUpload]
    || v12
    || v11)
  {
    v52 = *(void **)(v13 + 104);
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_36;
    v75[3] = &unk_1E60A7018;
    v75[4] = *(void *)(v13 + 48);
    v76 = v68;
    id v77 = v63;
    [v52 addCleanupBlock:v75];
    objc_storeStrong((id *)(*(void *)(v13 + 48) + 104), obj);
  }
  else
  {
    uint64_t v50 = *(void *)(v13 + 48);
    v51 = *(void **)(v50 + 104);
    *(void *)(v50 + 104) = 0;
  }
  v53 = *(void **)(v13 + 104);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_2;
  v74[3] = &unk_1E60A7040;
  v74[4] = *(void *)(v13 + 48);
  v74[5] = v11;
  v74[6] = v12;
  [v53 addCleanupBlock:v74];
  uint64_t v54 = 1;
LABEL_48:

  return v54;
}

uint64_t __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_36(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    objc_storeStrong((id *)(*(void *)(result + 32) + 152), *(id *)(result + 40));
    uint64_t v4 = [*(id *)(v3 + 48) copy];
    uint64_t v5 = *(void *)(v3 + 32);
    uint64_t v6 = *(void *)(v5 + 160);
    *(void *)(v5 + 160) = v4;
    return MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

void *__57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_2(void *result, uint64_t a2)
{
  if (!a2)
  {
    *(void *)(result[4] + 192) += result[5];
    *(void *)(result[4] + 200) += result[6];
  }
  return result;
}

- (void)_requestMissingPayloads
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(CPLEngineSyncTask *)self session];
  int v4 = [v3 shouldDefer];

  if (v4)
  {
    uint64_t v5 = +[CPLErrors sessionHasBeenDeferredError];
LABEL_5:
    -[CPLUploadComputeStatesScopeTask _uploadComputeStatesTaskDidFinishWithError:](self, "_uploadComputeStatesTaskDidFinishWithError:", v5, v5);

    return;
  }
  if ([(CPLEngineSyncTask *)self isCancelled])
  {
    uint64_t v5 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  uint64_t v6 = [(CPLUploadComputeStatesAccumulator *)self->_computeStatesAccumulator popNextBatchOfLocalComputeStatesNeedingPayload];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    requestMissingPayloadsProgress = self->_requestMissingPayloadsProgress;
    self->_requestMissingPayloadsProgress = v7;

    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 0;
    id v9 = self->_requestMissingPayloadsProgress;
    uint64_t v10 = [(CPLEngineSyncTask *)self session];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke;
    v29[3] = &unk_1E60A6F78;
    v29[4] = self;
    uint64_t v11 = v9;
    id v30 = v11;
    id v31 = v32;
    uint64_t v12 = [v10 addDeferHandler:v29];

    uint64_t v13 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v14 = [v13 store];
    id v15 = [v14 recordComputeStatePushQueue];
    id v28 = 0;
    id v16 = [v15 createTempUploadFolderWithError:&v28];
    id v17 = v28;

    if (v16)
    {
      if (!_CPLSilentLogging)
      {
        id v18 = __CPLTaskOSLogDomain_1318();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v6 count];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v35 = v19;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Requesting %lu payloads to client", buf, 0xCu);
        }
      }
      id v20 = self->_requestMissingPayloadsProgress;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_21;
      v23[3] = &unk_1E60A6FC8;
      v23[4] = self;
      id v24 = v6;
      id v25 = v16;
      id v26 = v12;
      id v27 = v32;
      [(NSProgress *)v20 performAsCurrentWithPendingUnitCount:1 usingBlock:v23];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v21 = __CPLTaskOSLogDomain_1318();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v35 = (uint64_t)v17;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Failed to create temp folder to get compute state payloads: %@", buf, 0xCu);
        }
      }
      [(CPLUploadComputeStatesScopeTask *)self _uploadComputeStatesTaskDidFinishWithError:v17];
    }

    _Block_object_dispose(v32, 8);
  }
  else
  {
    [(CPLUploadComputeStatesScopeTask *)self _uploadExtractedBatch];
  }
}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2;
  v8[3] = &unk_1E60AA830;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1352;
  block[3] = &unk_1E60A6978;
  id v13 = v5;
  uint64_t v6 = v2;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_21(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 208) += [*(id *)(a1 + 40) count];
  uint64_t v2 = [*(id *)(a1 + 32) engineLibrary];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2_22;
  v7[3] = &unk_1E60A6FA0;
  void v7[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 providePayloadForComputeStates:v3 inFolderWithURL:v4 completionHandler:v7];
}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_block_t v7 = v6;
  if (v6 && [v6 isCPLErrorWithCode:255])
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Lazy compute state payloads are not implemented by client - dropping compute states", buf, 2u);
      }
    }
    dispatch_block_t v7 = 0;
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 144);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_23;
  v18[3] = &unk_1E60A6FC8;
  v18[4] = v9;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v19 = v11;
  id v20 = v5;
  id v21 = v7;
  uint64_t v22 = v12;
  id v13 = v18;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __cpl_dispatch_async_block_invoke_1352;
  id v26 = &unk_1E60A6978;
  id v27 = v13;
  uint64_t v14 = v10;
  id v15 = v7;
  id v16 = v5;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v14, v17);
}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_23(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "totalUnitCount"));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) session];
  [v4 removeDeferHandler:*(void *)(a1 + 40)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v5 = *(void **)(a1 + 32);
    id v18 = +[CPLErrors sessionHasBeenDeferredError];
    objc_msgSend(v5, "_uploadComputeStatesTaskDidFinishWithError:");
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v7 = __CPLTaskOSLogDomain_1318();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [*(id *)(a1 + 48) count];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v20 = v8;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Client provided %lu payloads", buf, 0xCu);
        }

        uint64_t v6 = *(void *)(a1 + 48);
      }
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 152) localComputeStatesToDropAfterClientProvidedPayloadForLocalComputeStates:v6];
      *(void *)(*(void *)(a1 + 32) + 216) += [*(id *)(a1 + 48) count];
      [*(id *)(a1 + 32) _dropLocalComputeStates:v9];
      [*(id *)(a1 + 32) _requestMissingPayloads];
    }
    else if (([*(id *)(a1 + 56) isCPLOperationDeferredError] & 1) != 0 {
           || [*(id *)(a1 + 56) isCPLOperationCancelledError])
    }
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 56);
      [v10 _uploadComputeStatesTaskDidFinishWithError:v11];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v12 = __CPLTaskOSLogDomain_1318();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = *(void *)(a1 + 56);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v20 = v13;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Failed to request payloads for compute states - will retry later: %@", buf, 0xCu);
        }
      }
      uint64_t v14 = [*(id *)(a1 + 32) session];
      id v15 = [*(id *)(a1 + 32) scope];
      id v16 = [v15 scopeIdentifier];
      [v14 noteSyncSessionInformation:@"Uploading compute states for %@ needs compute state payloads from client", v16];

      dispatch_block_t v17 = [*(id *)(a1 + 32) session];
      [v17 requestSyncStateAtEndOfSyncSession:12 reschedule:0];

      [*(id *)(a1 + 32) _uploadComputeStatesTaskDidFinishWithError:0];
    }
  }
}

uint64_t __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 136))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 1;
    return [*(id *)(result + 32) cancel];
  }
  return result;
}

- (void)_deleteTempFolderForPayloads
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v3 = [v2 store];
  uint64_t v4 = [v3 recordComputeStatePushQueue];
  id v8 = 0;
  char v5 = [v4 deleteTempUploadFolderWithError:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0 && !_CPLSilentLogging)
  {
    dispatch_block_t v7 = __CPLTaskOSLogDomain_1318();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Failed to remove temp folder: %@", buf, 0xCu);
    }
  }
}

- (void)_dropLocalComputeStates:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    self->_countOfDroppedComputeStates += [v4 count];
    if (!_CPLSilentLogging)
    {
      char v5 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        id v14 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Dropping %lu compute states with no payload", buf, 0xCu);
      }
    }
    id v6 = [(CPLEngineSyncTask *)self engineLibrary];
    dispatch_block_t v7 = [v6 store];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke;
    v10[3] = &unk_1E60AB550;
    id v11 = v7;
    id v12 = v4;
    id v8 = v7;
    id v9 = (id)[v8 performWriteTransactionWithBlock:v10 completionHandler:&__block_literal_global_1387];
  }
}

void __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 recordComputeStatePushQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_2;
  v7[3] = &unk_1E60AB750;
  id v8 = *(id *)(a1 + 40);
  id v9 = v5;
  id v6 = v5;
  [v4 do:v7];
}

void __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3 && !_CPLSilentLogging)
  {
    id v4 = __CPLTaskOSLogDomain_1318();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      char v5 = [v2 error];
      int v6 = 138412290;
      dispatch_block_t v7 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Failed to drop compute states with no payload: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        id v12 = *(void **)(a1 + 40);
        id v16 = v10;
        int v13 = [v12 removeComputeState:v11 error:&v16];
        id v7 = v16;

        if (!v13)
        {

          if (a2)
          {
            id v7 = v7;
            uint64_t v14 = 0;
            *a2 = v7;
          }
          else
          {
            uint64_t v14 = 0;
          }
          goto LABEL_15;
        }
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v14 = 1;
LABEL_15:

  return v14;
}

- (void)_uploadExtractedBatch
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(CPLUploadComputeStatesAccumulator *)self->_computeStatesAccumulator countOfCloudComputeStatesToUpload])
  {
    id v4 = [(CPLEngineScopedTask *)self scope];
    if ([(CPLEngineSyncTask *)self isCancelled])
    {
      uint64_t v5 = +[CPLErrors operationCancelledError];
      [(CPLUploadComputeStatesScopeTask *)self _uploadComputeStatesTaskDidFinishWithError:v5];
    }
    else
    {
      uint64_t v8 = [(CPLEngineSyncTask *)self engineLibrary];
      uint64_t v9 = [v8 transport];

      id v10 = [v9 createGroupForComputeStateUpload];
      transportGroup = self->_transportGroup;
      self->_transportGroup = v10;

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      int v13 = self->_knownRecords;
      uint64_t v14 = [(CPLUploadComputeStatesAccumulator *)self->_computeStatesAccumulator cloudComputeStatesToUpload];
      sharedScope = self->_sharedScope;
      targetMapping = self->_targetMapping;
      transportScopeMapping = self->_transportScopeMapping;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke;
      v26[3] = &unk_1E60A6F50;
      v26[4] = self;
      *(CFAbsoluteTime *)&v26[5] = Current;
      long long v18 = [v9 uploadComputeStates:v14 scope:v4 sharedScope:sharedScope targetMapping:targetMapping transportScopeMapping:transportScopeMapping knownRecords:v13 completionHandler:v26];
      uploadComputeStatesTask = self->_uploadComputeStatesTask;
      self->_uploadComputeStatesTask = v18;

      long long v20 = self->_uploadComputeStatesTask;
      if (!v20)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v21 = __CPLTaskOSLogDomain_1318();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [(CPLUploadComputeStatesAccumulator *)self->_computeStatesAccumulator cloudComputeStatesToUpload];
            *(_DWORD *)long long buf = 138412290;
            id v28 = v22;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Failed to create a task for %@", buf, 0xCu);
          }
        }
        id v23 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m"];
        id v25 = [(CPLUploadComputeStatesAccumulator *)self->_computeStatesAccumulator cloudComputeStatesToUpload];
        [v23 handleFailureInMethod:a2, self, v24, 145, @"Failed to create a task for %@", v25 object file lineNumber description];

        abort();
      }
      [(CPLEngineSyncTask *)self launchTransportTask:v20 withTransportGroup:self->_transportGroup];
    }
  }
  else
  {
    computeStatesAccumulator = self->_computeStatesAccumulator;
    self->_computeStatesAccumulator = 0;

    knownRecords = self->_knownRecords;
    self->_knownRecords = 0;

    [(CPLUploadComputeStatesScopeTask *)self _getNextBatchAndUpload];
  }
}

void __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 144);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke_2;
  v14[3] = &unk_1E60A67C8;
  v14[4] = v7;
  id v15 = v6;
  id v16 = v5;
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1352;
  block[3] = &unk_1E60A6978;
  id v19 = v9;
  id v10 = v8;
  id v11 = v5;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

uint64_t __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  [*(id *)(a1 + 32) _updateComputeSyncUploadMetricsWithError:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) countOfCloudComputeStatesToUpload];
        uint64_t v7 = *(void *)(a1 + 40);
        int v15 = 134218242;
        uint64_t v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Failed to upload %lu compute states: %@", (uint8_t *)&v15, 0x16u);
      }

      uint64_t v4 = *(void *)(a1 + 40);
    }
    return [*(id *)(a1 + 32) _uploadComputeStatesTaskDidFinishWithError:v4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 48) count];
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 152) countOfCloudComputeStatesToUpload];
        uint64_t v12 = v11 - [*(id *)(a1 + 48) count];
        CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 48);
        int v15 = 134218754;
        uint64_t v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        CFAbsoluteTime v20 = v13;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Uploaded %lu compute states (dropped %lu) successfully in %.1fs:\n%{public}@", (uint8_t *)&v15, 0x2Au);
      }
    }
    if ([*(id *)(a1 + 48) count]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
    }
    return [*(id *)(a1 + 32) _discardExtractedBatchAndGetNextBatch];
  }
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPLEngineSyncTask *)self session];
  int v6 = [v5 shouldDefer];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLTaskOSLogDomain_1318();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CFAbsoluteTime v13 = 138412290;
        *(void *)&void v13[4] = objc_opt_class();
        id v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);
      }
    }
    uint64_t v9 = +[CPLErrors sessionHasBeenDeferredError];
    [v4 setError:v9];

    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = [v4 error];
    BOOL v10 = v11 == 0;
  }
  return v10;
}

- (CPLUploadComputeStatesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CPLUploadComputeStatesScopeTask;
  CFAbsoluteTime v13 = [(CPLEngineScopedTask *)&v26 initWithEngineLibrary:a3 session:a4 clientCacheIdentifier:a5 scope:v12 transportScope:a7];
  if (v13)
  {
    uint64_t v14 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v15 = dispatch_queue_create("engine.sync.uploadcomputestates", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    __int16 v17 = [CPLTransportScopeMapping alloc];
    uint64_t v18 = [(CPLEngineSyncTask *)v13 engineLibrary];
    __int16 v19 = [v18 transport];
    uint64_t v20 = [(CPLTransportScopeMapping *)v17 initWithTranslator:v19];
    transportScopeMapping = v13->_transportScopeMapping;
    v13->_transportScopeMapping = (CPLTransportScopeMapping *)v20;

    uint64_t v22 = [(CPLEngineScopedTask *)v13 transportScope];
    uint64_t v23 = v13->_transportScopeMapping;
    uint64_t v24 = [v12 scopeIdentifier];
    [(CPLTransportScopeMapping *)v23 setObject:v22 forKeyedSubscript:v24];

    v13->_taskItem = -1;
  }

  return v13;
}

@end