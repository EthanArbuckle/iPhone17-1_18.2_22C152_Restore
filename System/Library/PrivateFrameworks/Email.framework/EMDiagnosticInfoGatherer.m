@interface EMDiagnosticInfoGatherer
+ (OS_os_log)log;
+ (id)localDiagnosticsDirectoryURL;
+ (id)remoteInterface;
- (EFCancelable)providerCancelable;
- (EFLocked)providers;
- (EFScheduler)providerQueue;
- (EMDiagnosticInfoGatherer)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (id)_moveLocalDiagnosticsTo:(id)a3;
- (id)registerDiagnosticInfoProvider:(id)a3;
- (void)_logCategoryMetadataForMessageObjectIDs:(id)a3;
- (void)_registerSelfAsProviderIfRequired;
- (void)databaseStatisticsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fetchControllerStatusWithCompletionHandler:(id)a3;
- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setProviderCancelable:(id)a3;
- (void)setProviderQueue:(id)a3;
- (void)setProviders:(id)a3;
@end

@implementation EMDiagnosticInfoGatherer

+ (id)remoteInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86C78];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64B98];
  [v2 setInterface:v3 forSelector:sel_registerDiagnosticInfoProvider_completionHandler_ argumentIndex:0 ofReply:1];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A68FC8];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v4 setClasses:v7 forSelector:sel_provideDiagnosticsAt_options_completion_ argumentIndex:0 ofReply:1];

  [v2 setInterface:v4 forSelector:sel_registerDiagnosticInfoProvider_completionHandler_ argumentIndex:0 ofReply:0];
  return v2;
}

- (id)registerDiagnosticInfoProvider:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EMDiagnosticInfoGatherer *)self _registerSelfAsProviderIfRequired];
  v5 = [(EMDiagnosticInfoGatherer *)self providers];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke;
  v19[3] = &unk_1E63E3270;
  id v6 = v4;
  id v20 = v6;
  [v5 performWhileLocked:v19];

  id v7 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_2;
  v15 = &unk_1E63E3298;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v16 = v8;
  [v7 addCancelationBlock:&v12];
  v9 = +[EMDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v8 providerObjectID];
    *(_DWORD *)buf = 134218242;
    id v22 = v8;
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "Registerd EMDiagnosticInfoProviding: %p, objectID: %{public}@", buf, 0x16u);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v7;
}

- (EFLocked)providers
{
  return self->_providers;
}

- (void)_registerSelfAsProviderIfRequired
{
  p_providerCancelableLock = &self->_providerCancelableLock;
  os_unfair_lock_lock(&self->_providerCancelableLock);
  if (!self->_providerCancelable)
  {
    id v4 = [(EMDiagnosticInfoGatherer *)self connection];
    v5 = [v4 reattemptingRemoteObjectProxy];
    id v6 = [(EMDiagnosticInfoGatherer *)self providerQueue];
    id v7 = [(EMDiagnosticInfoGatherer *)self ef_onScheduler:v6];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__EMDiagnosticInfoGatherer__registerSelfAsProviderIfRequired__block_invoke;
    v8[3] = &unk_1E63E3248;
    v8[4] = self;
    [v5 registerDiagnosticInfoProvider:v7 completionHandler:v8];
  }
  os_unfair_lock_unlock(p_providerCancelableLock);
}

- (EFScheduler)providerQueue
{
  return self->_providerQueue;
}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EMDiagnosticInfoGatherer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1) {
    dispatch_once(&log_onceToken_12, block);
  }
  v2 = (void *)log_log_12;
  return (OS_os_log *)v2;
}

uint64_t __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (EMDiagnosticInfoGatherer)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EMDiagnosticInfoGatherer;
  id v6 = [(EMDiagnosticInfoGatherer *)&v22 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMDiagnosticInfoGatherer.queue"];
    providerQueue = v7->_providerQueue;
    v7->_providerQueue = (EFScheduler *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v11 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v12 = [v10 initWithObject:v11];
    providers = v7->_providers;
    v7->_providers = (EFLocked *)v12;

    v7->_providerCancelableLock._os_unfair_lock_opaque = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke;
    v19[3] = &unk_1E63E2688;
    objc_copyWeak(&v20, &location);
    [(EMRemoteConnection *)connection addResetHandler:v19];
    v15 = v7->_connection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke_2;
    v17[3] = &unk_1E63E2688;
    objc_copyWeak(&v18, &location);
    [(EMRemoteConnection *)v15 addRecoveryHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __61__EMDiagnosticInfoGatherer__registerSelfAsProviderIfRequired__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) setProviderCancelable:a2];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 12));
  return result;
}

- (void)setProviderCancelable:(id)a3
{
}

void __31__EMDiagnosticInfoGatherer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;
}

+ (id)localDiagnosticsDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = NSTemporaryDirectory();
  id v4 = [v2 fileURLWithPath:v3];
  id v5 = [v4 URLByAppendingPathComponent:@"DiagnosticLogs"];

  return v5;
}

void __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 2;
    id v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    [(os_unfair_lock_s *)v3 setProviderCancelable:0];
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }
}

void __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  unsigned __int8 v3 = atomic_load(WeakRetained + 12);
  if (v3)
  {
    [WeakRetained _registerSelfAsProviderIfRequired];
  }
  else
  {
    id v4 = +[EMDiagnosticInfoGatherer log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      id v6 = v2;
      _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "EMDiagnosticInfoProviding: %p, Not registered as provider - Skipping recovery", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)dealloc
{
  p_providerCancelableLock = &self->_providerCancelableLock;
  os_unfair_lock_lock(&self->_providerCancelableLock);
  id v4 = [(EMDiagnosticInfoGatherer *)self providerCancelable];
  [v4 cancel];

  os_unfair_lock_unlock(p_providerCancelableLock);
  v5.receiver = self;
  v5.super_class = (Class)EMDiagnosticInfoGatherer;
  [(EMDiagnosticInfoGatherer *)&v5 dealloc];
}

void __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained providers];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_3;
    v5[3] = &unk_1E63E3270;
    id v6 = *(id *)(a1 + 32);
    [v4 performWhileLocked:v5];
  }
}

uint64_t __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)fetchControllerStatusWithCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(EMDiagnosticInfoGatherer *)self connection];
  objc_super v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 fetchControllerStatusWithCompletionHandler:v6];
}

- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(EMDiagnosticInfoGatherer *)self connection];
  uint64_t v8 = [v7 reattemptingRemoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__EMDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E63E32C0;
  id v9 = v6;
  id v11 = v9;
  [v8 gatherDiagnosticsWithOptions:a3 completionHandler:v10];
}

void __75__EMDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 url];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)databaseStatisticsWithCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(EMDiagnosticInfoGatherer *)self connection];
  objc_super v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 databaseStatisticsWithCompletionHandler:v6];
}

- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(EMDiagnosticInfoGatherer *)self connection];
  objc_super v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 searchableIndexDatabaseStatisticsWithCompletionHandler:v6];
}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v22 = a5;
  v29 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(EMDiagnosticInfoGatherer *)self providers];
  v24 = [v7 getObject];

  v28 = [v25 url];
  char v21 = [v28 startAccessingSecurityScopedResource];
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__3;
  v46[4] = __Block_byref_object_dispose__3;
  id v47 = (id)0xAAAAAAAAAAAAAAAALL;
  id v8 = objc_alloc(MEMORY[0x1E4F60DA0]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v47 = (id)[v8 initWithObject:v9];

  __int16 v23 = [(EMDiagnosticInfoGatherer *)self _moveLocalDiagnosticsTo:v28];
  objc_msgSend(v29, "addObject:");
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v24;
  uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v14 = [MEMORY[0x1E4F60E18] promise];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke;
        v39[3] = &unk_1E63E32E8;
        v41 = v46;
        v39[4] = self;
        id v15 = v14;
        id v40 = v15;
        [v13 provideDiagnosticsAt:v28 options:a4 completion:v39];
        id v16 = [v15 future];
        [v29 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }

  id v17 = [MEMORY[0x1E4F60D70] combine:v29];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_3;
  v36[3] = &unk_1E63E3310;
  id v18 = v22;
  id v37 = v18;
  v38 = v46;
  [v17 addSuccessBlock:v36];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_4;
  v33[3] = &unk_1E63E3338;
  id v19 = v18;
  id v34 = v19;
  v35 = v46;
  [v17 addFailureBlock:v33];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_5;
  v30[3] = &unk_1E63E3360;
  char v32 = v21;
  id v20 = v28;
  id v31 = v20;
  [v17 always:v30];

  _Block_object_dispose(v46, 8);
}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_2;
    v13[3] = &unk_1E63E3270;
    id v8 = v5;
    id v14 = v8;
    [v7 performWhileLocked:v13];
    if (_os_feature_enabled_impl())
    {
      id v9 = (void *)a1[4];
      uint64_t v10 = [v8 allObjects];
      [v9 _logCategoryMetadataForMessageObjectIDs:v10];
    }
  }
  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  [v11 finishWithResult:v12 error:v6];
}

uint64_t __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 unionSet:*(void *)(a1 + 32)];
}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) getObject];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) getObject];
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v5);
}

uint64_t __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_5(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

- (void)_logCategoryMetadataForMessageObjectIDs:(id)a3
{
}

void __68__EMDiagnosticInfoGatherer__logCategoryMetadataForMessageObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[EMDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134218242;
    uint64_t v5 = [v2 globalMessageID];
    __int16 v6 = 2112;
    uint64_t v7 = MEMORY[0x1E4F1CC08];
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Recategorization metadata ID:%lld metadata:%@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)_moveLocalDiagnosticsTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v25 = [MEMORY[0x1E4F60E18] promise];
  v24 = [(id)objc_opt_class() localDiagnosticsDirectoryURL];
  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v24 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v31 = 0;
    uint64_t v7 = [v4 contentsOfDirectoryAtURL:v24 includingPropertiesForKeys:0 options:0 error:&v31];
    id v8 = v31;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v14 = [v13 lastPathComponent];
          id v15 = [v3 URLByAppendingPathComponent:v14];

          id v26 = v8;
          [v4 moveItemAtURL:v13 toURL:v15 error:&v26];
          id v16 = v26;

          if (v16)
          {
            id v18 = +[EMDiagnosticInfoGatherer log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v22 = [v13 path];
              __int16 v23 = [v15 path];
              *(_DWORD *)buf = 138543874;
              v33 = v22;
              __int16 v34 = 2114;
              v35 = v23;
              __int16 v36 = 2112;
              id v37 = v16;
              _os_log_error_impl(&dword_1BEFDB000, v18, OS_LOG_TYPE_ERROR, "Error moving file from %{public}@ to %{public}@, error: %{error}@", buf, 0x20u);
            }
            goto LABEL_16;
          }

          id v8 = 0;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
        id v8 = 0;
        id v16 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v16 = v8;
    }
LABEL_16:

    id v19 = [MEMORY[0x1E4F1CA98] null];
    [v25 finishWithResult:v19 error:v16];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
    [v25 finishWithResult:v17];
  }
  id v20 = [v25 future];

  return v20;
}

- (void)setProviders:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setProviderQueue:(id)a3
{
}

- (EFCancelable)providerCancelable
{
  return self->_providerCancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCancelable, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end