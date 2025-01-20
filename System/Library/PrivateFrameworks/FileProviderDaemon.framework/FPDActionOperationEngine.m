@interface FPDActionOperationEngine
- (FPDActionOperationEngine)init;
- (FPDActionOperationEngine)initWithServer:(id)a3;
- (id)inFlightOperations;
- (void)dumpStateTo:(id)a3;
- (void)scheduleActionOperationWithInfo:(id)a3 request:(id)a4 completionHandler:(id)a5;
@end

@implementation FPDActionOperationEngine

- (id)inFlightOperations
{
  return [(NSOperationQueue *)self->_operationQueue operations];
}

- (FPDActionOperationEngine)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should not call this"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDActionOperationEngine init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDActionOperationEngine.m", 62, (const char *)[v2 UTF8String]);
}

- (FPDActionOperationEngine)initWithServer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPDActionOperationEngine;
  v5 = [(FPDActionOperationEngine *)&v13 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("FileProvider.action-operation-engine", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v10;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:8];
  }

  return v6;
}

- (void)scheduleActionOperationWithInfo:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke;
  v15[3] = &unk_1E6A738F0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke(void *a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke_cold_1(v2);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = @"FPDMoveOperation";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    v3 = @"FPDDownloadOperation";
  }
  NSClassFromString(&v3->isa);
  id v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 alloc];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  id v9 = (void *)[v5 initWithActionInfo:v6 request:v7 server:WeakRetained];

  if (v9)
  {
    [*(id *)(a1[6] + 24) addOperation:v9];
    (*(void (**)(void))(a1[7] + 16))();
    objc_msgSend(@"com.apple.fileprovider.daemon-op-created", "fp_libnotifyPerUserNotificationName");
    id v10 = objc_claimAutoreleasedReturnValue();
    notify_post((const char *)[v10 UTF8String]);
  }
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FPDActionOperationEngine_dumpStateTo___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __40__FPDActionOperationEngine_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) write:@"== action operation engine ==\n"];
  [*(id *)(a1 + 32) write:@"=================\n"];
  objc_msgSend(*(id *)(a1 + 32), "write:", @"%lu operations\n", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "operationCount"));
  [*(id *)(a1 + 32) write:@"\n"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 40) + 24) operations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) dumpStateTo:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_server);
}

void __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] enqueueing action operation", v1, 2u);
}

@end