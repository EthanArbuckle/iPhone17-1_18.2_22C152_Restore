@interface EDMessageActionHandler
+ (OS_os_log)log;
- (EDMessageActionHandler)initWithExtensionsController:(id)a3;
- (NSArray)messageActionProviders;
- (NSArray)requiredHeaders;
- (id)actionDecisionForMessage:(id)a3 usingMessageActionProvider:(id)a4;
- (id)actionProviderInterfacesByExtensionID;
- (void)dealloc;
- (void)extensionsMatched:(id)a3;
- (void)extensionsNoLongerMatching:(id)a3;
@end

@implementation EDMessageActionHandler

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EDMessageActionHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_47 != -1) {
    dispatch_once(&log_onceToken_47, block);
  }
  v2 = (void *)log_log_47;

  return (OS_os_log *)v2;
}

void __29__EDMessageActionHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_47;
  log_log_47 = (uint64_t)v1;
}

- (EDMessageActionHandler)initWithExtensionsController:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDMessageActionHandler;
  v6 = [(EDMessageActionHandler *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionsController, a3);
    v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    extensionsObserverCancelable = v7->_extensionsObserverCancelable;
    v7->_extensionsObserverCancelable = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v10 initWithObject:v11];
    remoteExtensions = v7->_remoteExtensions;
    v7->_remoteExtensions = (EFLocked *)v12;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    extensionsController = v7->_extensionsController;
    v21[0] = *MEMORY[0x1E4F73A30];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__EDMessageActionHandler_initWithExtensionsController___block_invoke;
    v17[3] = &unk_1E6C01DC0;
    objc_copyWeak(&v18, &location);
    [(MEAppExtensionsController *)extensionsController registerMailAppExtensionsObserver:v7 capabilities:v15 includeDisabled:0 completion:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __55__EDMessageActionHandler_initWithExtensionsController___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      v13 = +[EDMessageActionHandler log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_cold_1((uint64_t)v10, v13);
      }
    }
    else
    {
      id v14 = WeakRetained[2];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_7;
      v16[3] = &unk_1E6C01D98;
      v17 = v9;
      [v14 performWhileLocked:v16];
      [v12[3] addCancelable:v8];
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"EDMessageActionHandlerProvidersChanged" object:0];

      v13 = v17;
    }
  }
}

uint64_t __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromArray:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_extensionsObserverCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)EDMessageActionHandler;
  [(EDMessageActionHandler *)&v3 dealloc];
}

- (id)actionProviderInterfacesByExtensionID
{
  v2 = [(EFLocked *)self->_remoteExtensions getObject];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__EDMessageActionHandler_actionProviderInterfacesByExtensionID__block_invoke;
  v6[3] = &unk_1E6C01DE8;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __63__EDMessageActionHandler_actionProviderInterfacesByExtensionID__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 synchronousMessageActionProviderInterface];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v6 extensionID];
  [v4 setObject:v3 forKeyedSubscript:v5];
}

- (NSArray)messageActionProviders
{
  v2 = [(EFLocked *)self->_remoteExtensions getObject];
  id v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_39);

  return (NSArray *)v3;
}

EDMessageActionProvider *__48__EDMessageActionHandler_messageActionProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [EDMessageActionProvider alloc];
  id v4 = [v2 extensionID];
  id v5 = [v2 displayName];
  id v6 = [(EDMessageActionProvider *)v3 initWithID:v4 name:v5];

  return v6;
}

- (id)actionDecisionForMessage:(id)a3 usingMessageActionProvider:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageActionHandler *)self actionProviderInterfacesByExtensionID];
  id v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__17;
  v33 = __Block_byref_object_dispose__17;
  id v34 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F60E18]);
  id v11 = [v10 future];
  uint64_t v12 = v11;
  if (v9)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __78__EDMessageActionHandler_actionDecisionForMessage_usingMessageActionProvider___block_invoke;
    v25[3] = &unk_1E6C01E30;
    v13 = v11;
    v26 = v13;
    v28 = &v29;
    id v27 = v10;
    [v9 decideActionForMessage:v6 completionHandler:v25];
    id v24 = 0;
    id v14 = (id)[v13 resultWithTimeout:&v24 error:2.0];
    id v15 = v24;
    if (v15)
    {
      [v13 cancel];
      v16 = +[EDMessageActionHandler log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v15, "ef_publicDescription");
        *(_DWORD *)buf = 138543618;
        id v36 = v7;
        __int16 v37 = 2114;
        v38 = v17;
        _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Error occured requesting action for extension:  %{public}@: Error: %{public}@", buf, 0x16u);
      }
    }

    id v18 = v26;
  }
  else
  {
    id v18 = +[EDMessageActionHandler log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[EDMessageActionHandler actionDecisionForMessage:usingMessageActionProvider:]((uint64_t)v7, v18);
    }
    id v15 = 0;
  }

  v19 = (void *)v30[5];
  if (v19)
  {
    objc_super v20 = +[EDMessageActionHandler log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)v30[5];
      *(_DWORD *)buf = 138543618;
      id v36 = v7;
      __int16 v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Received decision from action handler: %{public}@: %{public}@", buf, 0x16u);
    }

    v19 = (void *)v30[5];
  }
  id v22 = v19;

  _Block_object_dispose(&v29, 8);

  return v22;
}

void __78__EDMessageActionHandler_actionDecisionForMessage_usingMessageActionProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (void)extensionsMatched:(id)a3
{
  id v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__EDMessageActionHandler_extensionsMatched___block_invoke;
  v8[3] = &unk_1E6C01D98;
  id v6 = v4;
  id v9 = v6;
  [(EFLocked *)remoteExtensions performWhileLocked:v8];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"EDMessageActionHandlerProvidersChanged" object:0];
}

uint64_t __44__EDMessageActionHandler_extensionsMatched___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromArray:*(void *)(a1 + 32)];
}

- (void)extensionsNoLongerMatching:(id)a3
{
  id v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__EDMessageActionHandler_extensionsNoLongerMatching___block_invoke;
  v8[3] = &unk_1E6C01D98;
  id v6 = v4;
  id v9 = v6;
  [(EFLocked *)remoteExtensions performWhileLocked:v8];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"EDMessageActionHandlerProvidersChanged" object:0];
}

uint64_t __53__EDMessageActionHandler_extensionsNoLongerMatching___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectsInArray:*(void *)(a1 + 32)];
}

- (NSArray)requiredHeaders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(EDMessageActionHandler *)self actionProviderInterfacesByExtensionID];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __41__EDMessageActionHandler_requiredHeaders__block_invoke;
        v12[3] = &unk_1E6C01E58;
        id v13 = v3;
        [v9 requiredHeadersWithCompletion:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v10 = [v3 allObjects];

  return (NSArray *)v10;
}

uint64_t __41__EDMessageActionHandler_requiredHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);

  objc_storeStrong((id *)&self->_extensionsController, 0);
}

void __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to register for app extensions changes error:%@", (uint8_t *)&v2, 0xCu);
}

- (void)actionDecisionForMessage:(uint64_t)a1 usingMessageActionProvider:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Extension not found while attempting to find action: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end