@interface FPDActionOperation
- (BOOL)hasFinishedPreflight;
- (FPActionOperationInfo)info;
- (FPDActionOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5;
- (FPDExtensionManager)manager;
- (FPDRequest)request;
- (NSError)error;
- (NSMutableArray)clientCompletions;
- (NSMutableArray)clients;
- (NSMutableDictionary)createdItemByRoot;
- (NSMutableDictionary)errorsByRoot;
- (NSMutableDictionary)progressByRoot;
- (NSMutableDictionary)progressCompletionsByRoot;
- (NSMutableSet)completedRoots;
- (NSProgress)progress;
- (id)progressForRoot:(id)a3 completion:(id)a4;
- (unint64_t)logSection;
- (void)cancel;
- (void)cancelRoot:(id)a3;
- (void)dumpStateTo:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)forAllClients:(id)a3;
- (void)registerFrameworkClient:(id)a3 operationCompletion:(id)a4;
- (void)sendPastUpdatesToClient:(id)a3;
- (void)setClientCompletions:(id)a3;
- (void)setClients:(id)a3;
- (void)setCompletedRoots:(id)a3;
- (void)setCreatedItemByRoot:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorsByRoot:(id)a3;
- (void)setHasFinishedPreflight:(BOOL)a3;
- (void)setLogSection:(unint64_t)a3;
- (void)setProgressByRoot:(id)a3;
- (void)setProgressCompletionsByRoot:(id)a3;
- (void)unregisterClientsAfterCompletion;
@end

@implementation FPDActionOperation

- (FPDActionOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)FPDActionOperation;
  v12 = [(FPOperation *)&v31 init];
  if (v12)
  {
    v13 = [v11 extensionManager];
    objc_storeWeak((id *)&v12->_manager, v13);

    objc_storeStrong((id *)&v12->_info, a3);
    objc_storeStrong((id *)&v12->_request, a4);
    uint64_t v14 = objc_opt_new();
    clients = v12->_clients;
    v12->_clients = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    clientCompletions = v12->_clientCompletions;
    v12->_clientCompletions = (NSMutableArray *)v16;

    id location = 0;
    objc_initWeak(&location, v12);
    uint64_t v18 = objc_opt_new();
    progressByRoot = v12->_progressByRoot;
    v12->_progressByRoot = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    errorsByRoot = v12->_errorsByRoot;
    v12->_errorsByRoot = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    completedRoots = v12->_completedRoots;
    v12->_completedRoots = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    progressCompletionsByRoot = v12->_progressCompletionsByRoot;
    v12->_progressCompletionsByRoot = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    createdItemByRoot = v12->_createdItemByRoot;
    v12->_createdItemByRoot = (NSMutableDictionary *)v26;

    v28 = [(FPOperation *)v12 callbackQueue];
    dispatch_activate(v28);

    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)progressForRoot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v8 = [(FPOperation *)self callbackQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__FPDActionOperation_progressForRoot_completion___block_invoke;
  v13[3] = &unk_1E6A74A80;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __49__FPDActionOperation_progressForRoot_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 360) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(v2, "completedUnitCount"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount"));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCancellable:1];
  id v6 = [v2 cancellationHandler];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCancellationHandler:v6];

  if ([*(id *)(*(void *)(a1 + 32) + 376) containsObject:*(void *)(a1 + 40)])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 392) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v7)
    {
      id v7 = objc_opt_new();
      [*(id *)(*(void *)(a1 + 32) + 392) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    v8 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v2 path:"fractionCompleted"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__FPDActionOperation_progressForRoot_completion___block_invoke_2;
    v18[3] = &unk_1E6A74A58;
    uint64_t v20 = *(void *)(a1 + 56);
    id v19 = v2;
    id v9 = [v8 addObserverBlock:v18];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __49__FPDActionOperation_progressForRoot_completion___block_invoke_3;
    id v15 = &unk_1E6A73878;
    id v16 = v9;
    id v17 = *(id *)(a1 + 48);
    id v10 = v9;
    id v11 = (void *)MEMORY[0x1D9471EC0](&v12);
    objc_msgSend(v7, "addObject:", v11, v12, v13, v14, v15);
  }
}

uint64_t __49__FPDActionOperation_progressForRoot_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completedUnitCount];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v3 setCompletedUnitCount:v2];
}

uint64_t __49__FPDActionOperation_progressForRoot_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) finishObserving];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)forAllClients:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  v5 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_clients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v9);

  objc_storeStrong((id *)&self->_error, a4);
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPDActionOperation finishWithResult:error:]((uint64_t)self, (uint64_t)v7, v10);
  }

  [(FPDActionOperation *)self unregisterClientsAfterCompletion];
  v11.receiver = self;
  v11.super_class = (Class)FPDActionOperation;
  [(FPOperation *)&v11 finishWithResult:v8 error:v7];
}

- (void)cancelRoot:(id)a3
{
  id v4 = a3;
  v5 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDActionOperation_cancelRoot___block_invoke;
  block[3] = &unk_1E6A73FE8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __33__FPDActionOperation_cancelRoot___block_invoke(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__FPDActionOperation_cancelRoot___block_invoke_cold_1(a1, v2);
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)FPDActionOperation;
  [(FPOperation *)&v2 cancel];
}

- (void)unregisterClientsAfterCompletion
{
  id v7 = (void *)MEMORY[0x1D9471EC0](a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D744C000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] unregisterClientsAfterCompletion calling completion %@", a1, 0xCu);
}

- (void)sendPastUpdatesToClient:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: should be overriden"];
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_fault_impl(&dword_1D744C000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v6, 0xCu);
  }

  __assert_rtn("-[FPDActionOperation sendPastUpdatesToClient:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDActionOperation.m", 165, (const char *)[v4 UTF8String]);
}

- (void)registerFrameworkClient:(id)a3 operationCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPOperation *)self callbackQueue];
  dispatch_activate(v8);

  uint64_t v9 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__FPDActionOperation_registerFrameworkClient_operationCompletion___block_invoke;
  block[3] = &unk_1E6A73E38;
  id v13 = v6;
  long long v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __66__FPDActionOperation_registerFrameworkClient_operationCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCancellationHandler:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  [*(id *)(*(void *)(a1 + 40) + 344) addObject:v4];
  objc_super v2 = *(void **)(*(void *)(a1 + 40) + 352);
  id v3 = (void *)MEMORY[0x1D9471EC0](*(void *)(a1 + 48));
  [v2 addObject:v3];

  [*(id *)(a1 + 40) sendPastUpdatesToClient:v4];
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  v5 = [(FPOperation *)self callbackQueue];
  dispatch_activate(v5);

  id v6 = [(FPOperation *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__FPDActionOperation_dumpStateTo___block_invoke;
  v8[3] = &unk_1E6A736C0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __34__FPDActionOperation_dumpStateTo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) write:@"************************\n"];
  [*(id *)(a1 + 32) write:@"info=[[%@]]\n\n", *(void *)(*(void *)(a1 + 40) + 336)];
  [*(id *)(a1 + 32) write:@"+ clients: %@\n\n", *(void *)(*(void *)(a1 + 40) + 344)];
  [*(id *)(a1 + 32) write:@"+ progress by root: %@\n\n", *(void *)(*(void *)(a1 + 40) + 360)];
  [*(id *)(a1 + 32) write:@"+ created items by root: %@\n\n", *(void *)(*(void *)(a1 + 40) + 384)];
  [*(id *)(a1 + 32) write:@"+ errors by root: %@\n", *(void *)(*(void *)(a1 + 40) + 368)];
  [*(id *)(a1 + 32) write:@"+ completed roots: %@\n", *(void *)(*(void *)(a1 + 40) + 376)];
  [*(id *)(a1 + 32) write:@"\n"];
  if (*(void *)(*(void *)(a1 + 40) + 400))
  {
    [*(id *)(a1 + 32) startFgColor:1];
    [*(id *)(a1 + 32) write:@"+ error: %@\n", *(void *)(*(void *)(a1 + 40) + 400)];
    [*(id *)(a1 + 32) reset];
  }
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 write:@"************************\n"];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (FPDExtensionManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (FPDExtensionManager *)WeakRetained;
}

- (FPDRequest)request
{
  return self->_request;
}

- (FPActionOperationInfo)info
{
  return self->_info;
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableArray)clientCompletions
{
  return self->_clientCompletions;
}

- (void)setClientCompletions:(id)a3
{
}

- (BOOL)hasFinishedPreflight
{
  return self->_hasFinishedPreflight;
}

- (void)setHasFinishedPreflight:(BOOL)a3
{
  self->_hasFinishedPreflight = a3;
}

- (NSMutableDictionary)progressByRoot
{
  return self->_progressByRoot;
}

- (void)setProgressByRoot:(id)a3
{
}

- (NSMutableDictionary)errorsByRoot
{
  return self->_errorsByRoot;
}

- (void)setErrorsByRoot:(id)a3
{
}

- (NSMutableSet)completedRoots
{
  return self->_completedRoots;
}

- (void)setCompletedRoots:(id)a3
{
}

- (NSMutableDictionary)createdItemByRoot
{
  return self->_createdItemByRoot;
}

- (void)setCreatedItemByRoot:(id)a3
{
}

- (NSMutableDictionary)progressCompletionsByRoot
{
  return self->_progressCompletionsByRoot;
}

- (void)setProgressCompletionsByRoot:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)logSection
{
  return self->_logSection;
}

- (void)setLogSection:(unint64_t)a3
{
  self->_logSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progressCompletionsByRoot, 0);
  objc_storeStrong((id *)&self->_createdItemByRoot, 0);
  objc_storeStrong((id *)&self->_completedRoots, 0);
  objc_storeStrong((id *)&self->_errorsByRoot, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_clientCompletions, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)finishWithResult:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 368);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] action operation finished with errors-by-root:%@; %@",
    (uint8_t *)&v4,
    0x16u);
}

void __33__FPDActionOperation_cancelRoot___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling root: %@", (uint8_t *)&v3, 0xCu);
}

@end