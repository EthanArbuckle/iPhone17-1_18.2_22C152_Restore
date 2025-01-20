@interface AMSURLTaskInfo
+ (NSMutableDictionary)sharedTaskStore;
+ (OS_dispatch_queue)sharedTaskQueue;
+ (id)createTaskInfoForTask:(id)a3;
+ (id)taskInfoForTask:(id)a3;
+ (void)removeTaskInfoForTask:(id)a3;
- (AMSContiguousActionPerformer)contiguousActionPerformer;
- (AMSURLAction)receivedAction;
- (AMSURLRequestProperties)properties;
- (AMSURLSession)session;
- (AMSURLTaskInfo)initWithTask:(id)a3;
- (NSData)data;
- (NSError)error;
- (NSSet)retryIdentifiers;
- (NSURLResponse)originalResponse;
- (NSURLResponse)response;
- (NSURLSessionTask)task;
- (NSURLSessionTaskMetrics)metrics;
- (OS_dispatch_queue)taskQueue;
- (id)completionBlock;
- (id)createMetricsContextForDecodedObject:(id)a3;
- (int64_t)retryCount;
- (os_unfair_recursive_lock_s)taskLock;
- (unint64_t)previousAuthorizationCredentialSource;
- (unint64_t)signpostID;
- (unint64_t)startContiguousAsyncActionWithInitialBlock:(id)a3;
- (unint64_t)startContiguousAsyncActionWithInitialDataBlock:(id)a3;
- (void)_performDataAccessUsingBlock:(id)a3;
- (void)addRetryIdentifier:(id)a3;
- (void)appendData:(id)a3;
- (void)assertHasExclusiveAccess;
- (void)assertIsOnPrivateQueue;
- (void)continueContiguousAsyncActionWithIdentifier:(unint64_t)a3 block:(id)a4;
- (void)finishContiguousAsyncActionWithIdentifier:(unint64_t)a3;
- (void)migrateFromTaskInfo:(id)a3;
- (void)performAsyncBlock:(id)a3;
- (void)performAsyncBlockWithData:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)performSyncBlockWithExclusiveAccess:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOriginalResponse:(id)a3;
- (void)setPreviousAuthorizationCredentialSource:(unint64_t)a3;
- (void)setProperties:(id)a3;
- (void)setReceivedAction:(id)a3;
- (void)setResponse:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
@end

@implementation AMSURLTaskInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contiguousActionPerformer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_originalResponse, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_receivedAction, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_retryIdentifiers, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (AMSURLRequestProperties)properties
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_properties;
  os_unfair_recursive_lock_unlock();
  return v3;
}

void __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke_2;
  v4[3] = &unk_1E55A8108;
  v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  [v3 _performDataAccessUsingBlock:v4];
}

- (void)_performDataAccessUsingBlock:(id)a3
{
  v4 = (void (**)(id, NSMutableData *))a3;
  os_unfair_recursive_lock_lock_with_options();
  self->_performingBlockWithDataAccess = 1;
  NSUInteger v5 = [(NSMutableData *)self->_data length];
  v4[2](v4, self->_data);

  if ([(NSMutableData *)self->_data length] != v5) {
    [MEMORY[0x1E4F1CA00] raise:@"AMSURLTaskInfoDisallowedDataMutation" format:@"Data length was modified while running data access block."];
  }
  self->_performingBlockWithDataAccess = 0;
  os_unfair_recursive_lock_unlock();
}

uint64_t __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void)setSession:(id)a3
{
  v4 = (AMSURLSession *)a3;
  os_unfair_recursive_lock_lock_with_options();
  session = self->_session;
  self->_session = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setProperties:(id)a3
{
  v4 = (AMSURLRequestProperties *)a3;
  os_unfair_recursive_lock_lock_with_options();
  properties = self->_properties;
  self->_properties = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  NSUInteger v5 = _Block_copy(v4);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)setResponse:(id)a3
{
  id v4 = (NSURLResponse *)a3;
  os_unfair_recursive_lock_lock_with_options();
  response = self->_response;
  self->_response = v4;

  os_unfair_recursive_lock_unlock();
}

- (unint64_t)startContiguousAsyncActionWithInitialDataBlock:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke;
  v9[3] = &unk_1E55A8130;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 performInitialContiguousActionWithBlock:v9];

  return v7;
}

- (unint64_t)startContiguousAsyncActionWithInitialBlock:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  unint64_t v6 = [v5 performInitialContiguousActionWithBlock:v4];

  return v6;
}

- (void)finishContiguousAsyncActionWithIdentifier:(unint64_t)a3
{
  id v4 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  [v4 finishContiguousActionWithIdentifier:a3];
}

- (void)continueContiguousAsyncActionWithIdentifier:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  [v7 continueContiguousActionWithIdentifier:a3 withBlock:v6];
}

- (AMSContiguousActionPerformer)contiguousActionPerformer
{
  return self->_contiguousActionPerformer;
}

+ (void)removeTaskInfoForTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSUInteger v5 = [a1 sharedTaskQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__AMSURLTaskInfo_removeTaskInfoForTask___block_invoke;
    v6[3] = &unk_1E55A1998;
    id v8 = a1;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

+ (id)createTaskInfoForTask:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__76;
  v17 = __Block_byref_object_dispose__76;
  id v18 = 0;
  NSUInteger v5 = [a1 sharedTaskQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AMSURLTaskInfo_createTaskInfoForTask___block_invoke;
  block[3] = &unk_1E55A2470;
  v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (id)taskInfoForTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__76;
    v16 = __Block_byref_object_dispose__76;
    id v17 = 0;
    NSUInteger v5 = [a1 sharedTaskQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__AMSURLTaskInfo_taskInfoForTask___block_invoke;
    block[3] = &unk_1E55A2470;
    id v10 = &v12;
    id v11 = a1;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (OS_dispatch_queue)sharedTaskQueue
{
  if (qword_1EB38E0B0 != -1) {
    dispatch_once(&qword_1EB38E0B0, &__block_literal_global_20_2);
  }
  v2 = (void *)qword_1EB38E0B8;
  return (OS_dispatch_queue *)v2;
}

- (id)completionBlock
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = _Block_copy(self->_completionBlock);
  os_unfair_recursive_lock_unlock();
  id v4 = _Block_copy(v3);

  return v4;
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_performingBlockWithDataAccess) {
    [MEMORY[0x1E4F1CA00] raise:@"AMSURLTaskInfoDisallowedDataMutation" format:@"Attempted to append data while running a data access block."];
  }
  [(NSMutableData *)self->_data appendData:v4];
  os_unfair_recursive_lock_unlock();
}

- (void)setMetrics:(id)a3
{
  id v4 = (NSURLSessionTaskMetrics *)a3;
  os_unfair_recursive_lock_lock_with_options();
  metrics = self->_metrics;
  self->_metrics = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSURLSessionTaskMetrics)metrics
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_metrics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)assertIsOnPrivateQueue
{
  v2 = [(AMSURLTaskInfo *)self taskQueue];
  dispatch_assert_queue_V2(v2);
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (NSURLResponse)response
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_response;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (NSData)data
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)[(NSMutableData *)self->_data copy];
  os_unfair_recursive_lock_unlock();
  return (NSData *)v3;
}

- (NSError)error
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_error;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSURLSession)session
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_session;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)performAsyncBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  [v5 async:v4];
}

- (AMSURLAction)receivedAction
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_receivedAction;
  os_unfair_recursive_lock_unlock();
  return v3;
}

void __40__AMSURLTaskInfo_removeTaskInfoForTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) sharedTaskStore];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

void __40__AMSURLTaskInfo_createTaskInfoForTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) sharedTaskStore];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = [[AMSURLTaskInfo alloc] initWithTask:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 48) sharedTaskStore];
    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

void __34__AMSURLTaskInfo_taskInfoForTask___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 48) sharedTaskStore];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (NSMutableDictionary)sharedTaskStore
{
  if (_MergedGlobals_155 != -1) {
    dispatch_once(&_MergedGlobals_155, &__block_literal_global_138);
  }
  uint64_t v2 = (void *)qword_1EB38E0A8;
  return (NSMutableDictionary *)v2;
}

- (AMSURLTaskInfo)initWithTask:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSURLTaskInfo;
  id v6 = [(AMSURLTaskInfo *)&v19 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    data = v6->_data;
    v6->_data = v7;

    v6->_performingBlockWithDataAccess = 0;
    id v9 = objc_alloc_init(AMSURLRequestProperties);
    properties = v6->_properties;
    v6->_properties = v9;

    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    retryIdentifiers = v6->_retryIdentifiers;
    v6->_retryIdentifiers = v11;

    v6->_signpostID = 0;
    objc_storeStrong((id *)&v6->_task, a3);
    v6->_taskLock = 0;
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.AppleMediaServices.TaskQueue", v13);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v14;

    v16 = [[AMSContiguousActionPerformer alloc] initWithQueue:v6->_taskQueue];
    contiguousActionPerformer = v6->_contiguousActionPerformer;
    v6->_contiguousActionPerformer = v16;
  }
  return v6;
}

- (void)setReceivedAction:(id)a3
{
  uint64_t v4 = (AMSURLAction *)a3;
  os_unfair_recursive_lock_lock_with_options();
  receivedAction = self->_receivedAction;
  self->_receivedAction = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setError:(id)a3
{
  uint64_t v4 = (NSError *)a3;
  os_unfair_recursive_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)createMetricsContextForDecodedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [[AMSMetricsLoadURLContext alloc] initWithTaskInfo:self serverPayload:v5];
  return v6;
}

uint64_t __33__AMSURLTaskInfo_sharedTaskStore__block_invoke()
{
  qword_1EB38E0A8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

void __33__AMSURLTaskInfo_sharedTaskQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSURLTaskInfo.task", v2);
  v1 = (void *)qword_1EB38E0B8;
  qword_1EB38E0B8 = (uint64_t)v0;
}

- (unint64_t)previousAuthorizationCredentialSource
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t previousAuthorizationCredentialSource = self->_previousAuthorizationCredentialSource;
  os_unfair_recursive_lock_unlock();
  return previousAuthorizationCredentialSource;
}

- (int64_t)retryCount
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t retryCount = self->_retryCount;
  os_unfair_recursive_lock_unlock();
  return retryCount;
}

- (NSSet)retryIdentifiers
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = (void *)[(NSMutableSet *)self->_retryIdentifiers copy];
  os_unfair_recursive_lock_unlock();
  return (NSSet *)v3;
}

- (void)setPreviousAuthorizationCredentialSource:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_unint64_t previousAuthorizationCredentialSource = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setRetryCount:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_int64_t retryCount = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)addRetryIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(NSMutableSet *)self->_retryIdentifiers addObject:v4];

  os_unfair_recursive_lock_unlock();
}

- (void)assertHasExclusiveAccess
{
  uint64_t v3 = [(AMSURLTaskInfo *)self taskQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_taskLock);
}

- (void)migrateFromTaskInfo:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [v4 metrics];
  metrics = self->_metrics;
  self->_metrics = v5;

  self->_unint64_t previousAuthorizationCredentialSource = [v4 previousAuthorizationCredentialSource];
  uint64_t v7 = [v4 properties];
  id v8 = (AMSURLRequestProperties *)[v7 copy];
  properties = self->_properties;
  self->_properties = v8;

  self->_int64_t retryCount = [v4 retryCount];
  id v10 = [v4 retryIdentifiers];
  id v11 = (NSMutableSet *)[v10 mutableCopy];
  retryIdentifiers = self->_retryIdentifiers;
  self->_retryIdentifiers = v11;

  uint64_t v13 = [v4 session];
  session = self->_session;
  self->_session = v13;

  unint64_t v15 = [v4 signpostID];
  self->_signpostID = v15;
  os_unfair_recursive_lock_unlock();
}

- (void)performAsyncBlockWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AMSURLTaskInfo_performAsyncBlockWithData___block_invoke;
  v7[3] = &unk_1E559EAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 async:v7];
}

uint64_t __44__AMSURLTaskInfo_performAsyncBlockWithData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDataAccessUsingBlock:*(void *)(a1 + 40)];
}

- (void)performSyncBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLTaskInfo *)self taskQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  [v6 sync:v4];
}

- (void)performSyncBlockWithExclusiveAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLTaskInfo *)self taskQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(AMSURLTaskInfo *)self contiguousActionPerformer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__AMSURLTaskInfo_performSyncBlockWithExclusiveAccess___block_invoke;
  v8[3] = &unk_1E559EAE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 sync:v8];
}

uint64_t __54__AMSURLTaskInfo_performSyncBlockWithExclusiveAccess___block_invoke(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return os_unfair_recursive_lock_unlock();
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AMSURLTaskInfo_setAccount___block_invoke;
  v6[3] = &unk_1E559F1E0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AMSURLTaskInfo *)self performSyncBlockWithExclusiveAccess:v6];
}

void __29__AMSURLTaskInfo_setAccount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) properties];
  [v2 setAccount:v1];
}

- (NSURLResponse)originalResponse
{
  return self->_originalResponse;
}

- (void)setOriginalResponse:(id)a3
{
}

- (os_unfair_recursive_lock_s)taskLock
{
  return self->_taskLock;
}

@end