@interface EDCloudMirroringPersistentStore
+ (OS_os_log)log;
- (EDCloudMirroringPersistentStore)init;
- (EDTaskScheduler)exportScheduler;
- (EDTaskScheduler)importScheduler;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentContainer)persistentContainer;
- (id)_schedulerForKind:(int)a3;
- (id)_wrapCompletion:(id)a3 forRequestKind:(int)a4;
- (void)_executeRequestWithKind:(int)a3 completionBlock:(id)a4;
- (void)_requestWithKind:(int)a3 completionBlock:(id)a4;
- (void)_setupCoreDataStack;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)requestExportWithCompletionBlock:(id)a3;
- (void)requestImportWithCompletionBlock:(id)a3;
- (void)setExportScheduler:(id)a3;
- (void)setImportScheduler:(id)a3;
@end

@implementation EDCloudMirroringPersistentStore

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDCloudMirroringPersistentStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1) {
    dispatch_once(&log_onceToken_23, block);
  }
  v2 = (void *)log_log_23;

  return (OS_os_log *)v2;
}

void __38__EDCloudMirroringPersistentStore_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;
}

- (EDCloudMirroringPersistentStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)EDCloudMirroringPersistentStore;
  v2 = [(EDCloudMirroringPersistentStore *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mail.EDCloudMirroringPersistentStore.schedulers", 0);
    [(EDCloudMirroringPersistentStore *)v2 _setupCoreDataStack];
    v4 = [[EDTaskScheduler alloc] initWithExecutionQueue:v3];
    exportScheduler = v2->_exportScheduler;
    v2->_exportScheduler = v4;

    [(EDTaskScheduler *)v2->_exportScheduler setObserveForNetworkReachability:1];
    [(EDTaskScheduler *)v2->_exportScheduler setInitialDelay:5.0];
    v6 = [[EDTaskScheduler alloc] initWithExecutionQueue:v3];
    importScheduler = v2->_importScheduler;
    v2->_importScheduler = v6;

    [(EDTaskScheduler *)v2->_importScheduler setObserveForNetworkReachability:1];
  }
  return v2;
}

- (void)_setupCoreDataStack
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to locate momd bundle in application. %@", (uint8_t *)&v1, 0xCu);
}

void __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = +[EDCloudMirroringPersistentStore log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(v3, "ef_publicDescription");
      __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke_cold_1(v5, (uint64_t)v6);
    }
  }
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v5 = [(EDCloudMirroringPersistentStore *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__EDCloudMirroringPersistentStore_performBlock___block_invoke;
  v8[3] = &unk_1E6C007D8;
  id v6 = v4;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [v7 performBlock:v8];
}

uint64_t __48__EDCloudMirroringPersistentStore_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  v5 = [(EDCloudMirroringPersistentStore *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__EDCloudMirroringPersistentStore_performBlockAndWait___block_invoke;
  v8[3] = &unk_1E6C007D8;
  id v6 = v4;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [v7 performBlockAndWait:v8];
}

uint64_t __55__EDCloudMirroringPersistentStore_performBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)requestImportWithCompletionBlock:(id)a3
{
}

- (void)requestExportWithCompletionBlock:(id)a3
{
}

- (void)_requestWithKind:(int)a3 completionBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(EDCloudMirroringPersistentStore *)self _schedulerForKind:v4];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke;
  v11[3] = &unk_1E6C009A0;
  objc_copyWeak(&v13, &location);
  int v14 = v4;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke_2;
  v9[3] = &unk_1E6C009C8;
  id v8 = v12;
  id v10 = v8;
  [v7 scheduleTask:v11 canceledCallback:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _executeRequestWithKind:*(unsigned int *)(a1 + 48) completionBlock:*(void *)(a1 + 32)];
}

uint64_t __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)_schedulerForKind:(int)a3
{
  if (a3) {
    [(EDCloudMirroringPersistentStore *)self exportScheduler];
  }
  else {
  id v3 = [(EDCloudMirroringPersistentStore *)self importScheduler];
  }

  return v3;
}

- (void)_executeRequestWithKind:(int)a3 completionBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(EDCloudMirroringPersistentStore *)self _wrapCompletion:v6 forRequestKind:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke;
  v9[3] = &unk_1E6C009F0;
  int v11 = v4;
  id v10 = v7;
  id v8 = v7;
  [(EDCloudMirroringPersistentStore *)self performBlockAndWait:v9];
}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (objc_class *)(id)objc_opt_class();
  v5 = (void *)[[v4 alloc] initWithOptions:0 completionBlock:*(void *)(a1 + 32)];
  id v11 = 0;
  id v6 = [v3 executeRequest:v5 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      id v8 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = objc_msgSend(v7, "ef_publicDescription");
        __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_2(v9, (uint64_t)v12);
      }
    }
    else
    {
      id v8 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_msgSend(v7, "ef_publicDescription");
        __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_1(v10, (uint64_t)v12);
      }
    }
  }
}

- (id)_wrapCompletion:(id)a3 forRequestKind:(int)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke;
  v10[3] = &unk_1E6C00A18;
  objc_copyWeak(&v12, &location);
  int v13 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = _Block_copy(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [v3 success];
  int v6 = *(_DWORD *)(a1 + 48);
  if (v5)
  {
    if (v6)
    {
      id v7 = +[EDCloudMirroringPersistentStore log];
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      LOWORD(v29) = 0;
      id v8 = "Successfully exported CloudKit content.";
    }
    else
    {
      id v7 = +[EDCloudMirroringPersistentStore log];
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      LOWORD(v29) = 0;
      id v8 = "Successfully imported CloudKit content.";
    }
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v29, 2u);
LABEL_11:

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
    }
    goto LABEL_29;
  }
  if (v6)
  {
    id v9 = +[EDCloudMirroringPersistentStore log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_4(v9);
    }
  }
  else
  {
    id v9 = +[EDCloudMirroringPersistentStore log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_3(v9);
    }
  }

  id v11 = [v3 error];
  id v12 = [v11 userInfo];
  int v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  CKRetryAfterSecondsForError();
  double v15 = v14;

  int v16 = *(_DWORD *)(a1 + 48);
  if (v15 <= 0.0)
  {
    if (v16)
    {
      v20 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [v3 error];
        v22 = objc_msgSend(v21, "ef_publicDescription");
        __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_2(v22, (uint64_t)&v29, (uint64_t)v20, v21);
      }
    }
    else
    {
      v20 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = [v3 error];
        v25 = objc_msgSend(v24, "ef_publicDescription");
        __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_1(v25, (uint64_t)&v29, (uint64_t)v20, v24);
      }
    }

    uint64_t v26 = *(void *)(a1 + 32);
    if (v26) {
      (*(void (**)(uint64_t, void))(v26 + 16))(v26, 0);
    }
  }
  else
  {
    if (v16)
    {
      v17 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v3 error];
        v19 = objc_msgSend(v18, "ef_publicDescription");
        int v29 = 134218242;
        double v30 = v15;
        __int16 v31 = 2114;
        v32 = v19;
        _os_log_error_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_ERROR, "Failed to export CloudKit content. Rescheduling (%g). %{public}@", (uint8_t *)&v29, 0x16u);
      }
    }
    else
    {
      v17 = +[EDCloudMirroringPersistentStore log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v27 = [v3 error];
        v28 = objc_msgSend(v27, "ef_publicDescription");
        int v29 = 134218242;
        double v30 = v15;
        __int16 v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_ERROR, "Failed to import CloudKit content. Rescheduling (%g). %{public}@", (uint8_t *)&v29, 0x16u);
      }
    }

    v23 = [WeakRetained _schedulerForKind:*(unsigned int *)(a1 + 48)];
    [v23 rescheduleTask];
  }
LABEL_29:
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (EDTaskScheduler)importScheduler
{
  return self->_importScheduler;
}

- (void)setImportScheduler:(id)a3
{
}

- (EDTaskScheduler)exportScheduler
{
  return self->_exportScheduler;
}

- (void)setExportScheduler:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_exportScheduler, 0);
  objc_storeStrong((id *)&self->_importScheduler, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

void __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke_cold_1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to load persistent stores. %{public}@", v5);
}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Import request failed to execute: %{public}@", v5);
}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_2(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Export request failed to execute: %{public}@", v5);
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v6, v7, "Failed to import CloudKit content: %{public}@", v8);
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v6, v7, "Failed to export CloudKit content: %{public}@", v8);
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Request import failed", v1, 2u);
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Request export failed", v1, 2u);
}

@end