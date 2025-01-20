@interface CPLCleanupTask
- (id)taskIdentifier;
- (void)_cleanupSharingFlags;
- (void)_doOneIteration;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLCleanupTask

- (id)taskIdentifier
{
  return @"engine.sync.cleanup";
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  +[CPLTransaction endTransactionWithIdentifier:@"cpl.cleanup"];
  v5.receiver = self;
  v5.super_class = (Class)CPLCleanupTask;
  [(CPLEngineSyncTask *)&v5 taskDidFinishWithError:v4];
}

- (void)launch
{
  +[CPLTransaction beginTransactionWithIdentifier:@"cpl.cleanup" description:@"cleaning store" keepPower:1];
  [(CPLCleanupTask *)self _doOneIteration];
}

- (void)_doOneIteration
{
  v3 = [(CPLEngineSyncTask *)self engineLibrary];
  id v4 = [v3 store];

  objc_super v5 = [v4 cleanupTasks];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CPLCleanupTask__doOneIteration__block_invoke;
  v10[3] = &unk_1E60A7470;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  v13 = v17;
  id v7 = v4;
  id v12 = v7;
  v14 = v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__CPLCleanupTask__doOneIteration__block_invoke_2;
  v9[3] = &unk_1E60AB7F0;
  v9[4] = self;
  v9[5] = v17;
  v9[6] = v15;
  id v8 = (id)[v7 performWriteTransactionWithBlock:v10 completionHandler:v9];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __33__CPLCleanupTask__doOneIteration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) session];
  int v5 = [v4 shouldDefer];

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLTaskOSLogDomain_5191();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = (id)objc_opt_class();
        id v7 = v19;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);
      }
    }
    id v8 = +[CPLErrors sessionHasBeenDeferredError];
    [v3 setError:v8];
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __33__CPLCleanupTask__doOneIteration__block_invoke_3;
    v15 = &unk_1E60AB500;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    id v16 = v9;
    uint64_t v17 = v10;
    [v3 do:&v12];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 48), "sharingScopeIdentifier", v12, v13, v14, v15);

      if (!v11) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    id v8 = v16;
  }
}

void __33__CPLCleanupTask__doOneIteration__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = [v9 error];
    [v4 taskDidFinishWithError:v5];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v7];
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) _doOneIteration];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [v8 _cleanupSharingFlags];
    }
    else {
      [v8 taskDidFinishWithError:0];
    }
  }
}

uint64_t __33__CPLCleanupTask__doOneIteration__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cleanupStepHasMore:*(void *)(*(void *)(a1 + 40) + 8) + 24 error:a2];
}

- (void)_cleanupSharingFlags
{
  id v3 = [(CPLEngineSyncTask *)self engineLibrary];
  id v4 = [v3 store];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke;
  v8[3] = &unk_1E60AB040;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = v11;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_2;
  v7[3] = &unk_1E60AB878;
  v7[4] = self;
  v7[5] = v11;
  id v6 = (id)[v5 performWriteTransactionWithBlock:v8 completionHandler:v7];

  _Block_object_dispose(v11, 8);
}

void __38__CPLCleanupTask__cleanupSharingFlags__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) session];
  int v5 = [v4 shouldDefer];

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLTaskOSLogDomain_5191();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = (id)objc_opt_class();
        id v7 = v16;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);
      }
    }
    id v8 = +[CPLErrors sessionHasBeenDeferredError];
    [v3 setError:v8];
    goto LABEL_9;
  }
  id v9 = [*(id *)(a1 + 40) sharingScopeIdentifier];

  if (!v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_1;
    v12[3] = &unk_1E60AB500;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v3 do:v12];
    id v8 = v13;
LABEL_9:
  }
}

void __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = [v9 error];
    [v4 taskDidFinishWithError:v5];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v7];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [v8 _cleanupSharingFlags];
    }
    else {
      [v8 taskDidFinishWithError:0];
    }
  }
}

uint64_t __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_1(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) pushRepository];
  uint64_t v7 = 0;
  uint64_t v5 = [v4 deleteSharingFlagsWithMaxCount:200 deletedCount:&v7 error:a2];
  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 != 0;
  }

  return v5;
}

@end