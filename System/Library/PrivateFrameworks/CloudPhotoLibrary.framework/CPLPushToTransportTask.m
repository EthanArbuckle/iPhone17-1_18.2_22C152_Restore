@interface CPLPushToTransportTask
+ (BOOL)dontAutoRetry;
+ (void)setDontAutoRetry:(BOOL)a3;
- (BOOL)highPriority;
- (BOOL)shouldSkipScopesWithMissingTransportScope;
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)scopeFilterInTransaction:(id)a3;
- (id)taskIdentifier;
- (void)cancel:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLPushToTransportTask

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
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

- (void)taskDidFinishWithError:(id)a3
{
  BOOL highPriority = self->_highPriority;
  id v5 = a3;
  v6 = [(CPLEngineSyncTask *)self engineLibrary];
  v7 = [v6 scheduler];
  v8 = v7;
  v9 = &CPLEngineElementEndOfUpload;
  if (highPriority) {
    v9 = &CPLEngineElementEndOfUploadHighPriority;
  }
  [v7 willRunEngineElement:*v9];

  v10.receiver = self;
  v10.super_class = (Class)CPLPushToTransportTask;
  [(CPLEngineSyncTask *)&v10 taskDidFinishWithError:v5];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CPLPushToTransportTask_task_didFinishWithError___block_invoke;
  v7[3] = &unk_1E60A8440;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(CPLEngineMultiscopeSyncTask *)self dispatchAsyncWithCurrentSubtask:v7];
}

void __50__CPLPushToTransportTask_task_didFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 152)) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = +[CPLErrors operationCancelledError];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)CPLPushToTransportTask;
  objc_msgSendSuper2(&v8, sel_task_didFinishWithError_, v3, v6);
}

- (void)cancel:(BOOL)a3
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__CPLPushToTransportTask_cancel___block_invoke;
    v4[3] = &unk_1E60A8418;
    v4[4] = self;
    char v5 = 1;
    [(CPLEngineMultiscopeSyncTask *)self dispatchAsyncWithCurrentSubtask:v4];
  }
  else
  {
    [(CPLEngineMultiscopeSyncTask *)self cancel];
  }
}

uint64_t __33__CPLPushToTransportTask_cancel___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
  if (a2) {
    return [a2 cancel:*(unsigned __int8 *)(a1 + 40)];
  }
  else {
    return [*(id *)(a1 + 32) cancel];
  }
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [CPLPushToTransportScopeTask alloc];
  v15 = [(CPLEngineSyncTask *)self engineLibrary];
  v16 = [(CPLPushToTransportScopeTask *)v14 initWithEngineLibrary:v15 session:v12 clientCacheIdentifier:v10 scope:v13 transportScope:v11];

  [(CPLPushToTransportScopeTask *)v16 setHighPriority:self->_highPriority];
  return v16;
}

- (id)scopeFilterInTransaction:(id)a3
{
  v4 = [(CPLEngineSyncTask *)self session];
  char v5 = [v4 scopeIdentifiersExcludedFromPushToTransport];

  if (v5)
  {
    id v6 = [(CPLEngineMultiscopeSyncTask *)self scopes];
    v7 = [v6 filterForExcludedScopeIdentifiers:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  BOOL highPriority = self->_highPriority;
  v4 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  char v5 = v4;
  if (highPriority) {
    [v4 enumeratorForScopesNeedingToPushHighPriorityChangesToTransport];
  }
  else {
  id v6 = [v4 enumeratorForScopesNeedingToPushChangesToTransport];
  }

  return v6;
}

+ (void)setDontAutoRetry:(BOOL)a3
{
  _dontAutoRetry = a3;
}

+ (BOOL)dontAutoRetry
{
  if (_dontAutoRetry) {
    return 1;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"CPLDontAutoRetryPushToTransport"];

  return v4;
}

@end