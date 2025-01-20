@interface MEContentRuleListManager
+ (id)log;
- (MEContentRuleListManager)init;
- (MEContentRuleListManager)initWithExtensionsController:(id)a3;
- (id)_activeRuleLists;
- (id)_encodedContentRuleListForExtension:(id)a3;
- (id)addObserver:(id)a3 activeRuleLists:(id *)a4;
- (void)_compileAndAddContentRuleListForIdentifier:(id)a3 encodedContentRuleList:(id)a4;
- (void)_handleExtensionsAdded:(id)a3;
- (void)_handleExtensionsRemoved:(id)a3;
- (void)_notifyObserversOfNewContentRuleList:(id)a3;
- (void)_notifyObserversOfRemovedContentRuleList:(id)a3;
- (void)_notifyObserversOfUpdatedContentRuleList:(id)a3 oldContentRuleList:(id)a4;
- (void)_reloadContentRuleLists;
- (void)_scheduleContentRuleListReload;
- (void)dealloc;
@end

@implementation MEContentRuleListManager

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MEContentRuleListManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return v2;
}

void __31__MEContentRuleListManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (MEContentRuleListManager)init
{
  return [(MEContentRuleListManager *)self initWithExtensionsController:0];
}

- (MEContentRuleListManager)initWithExtensionsController:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MEContentRuleListManager;
  v6 = [(MEContentRuleListManager *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionsController, a3);
    v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x263F3B350]);
    extensionsObserverCancelable = v7->_extensionsObserverCancelable;
    v7->_extensionsObserverCancelable = v8;

    id v10 = objc_alloc(MEMORY[0x263F3B370]);
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v12 = [v10 initWithObject:v11];
    activeRuleListsByIdentifier = v7->_activeRuleListsByIdentifier;
    v7->_activeRuleListsByIdentifier = (EFLocked *)v12;

    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x263F3B3A0] serialDispatchQueueSchedulerWithName:@"com.apple.MEContentRuleListManager.observation"];
    observationScheduler = v7->_observationScheduler;
    v7->_observationScheduler = (EFAssertableScheduler *)v16;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_reload, @"MEContentBlockerMangerReload", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    id v19 = objc_alloc(MEMORY[0x263F3B358]);
    v20 = v7->_observationScheduler;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57__MEContentRuleListManager_initWithExtensionsController___block_invoke;
    v28[3] = &unk_264283248;
    objc_copyWeak(&v29, &location);
    uint64_t v21 = [v19 initWithTimeInterval:v20 scheduler:0 startAfter:v28 block:60.0];
    reloadDebouncer = v7->_reloadDebouncer;
    v7->_reloadDebouncer = (EFDebouncer *)v21;

    extensionsController = v7->_extensionsController;
    v32[0] = @"MEContentBlocker";
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2;
    v26[3] = &unk_264283100;
    objc_copyWeak(&v27, &location);
    [(MEAppExtensionsController *)extensionsController registerMailAppExtensionsObserver:v7 capabilities:v24 includeDisabled:0 completion:v26];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadContentRuleLists];
}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  v15[3] = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      v13 = +[MEContentRuleListManager log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_msgSend(v10, "ef_publicDescription");
        __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2_cold_1(v14, (uint64_t)v15, v13);
      }
    }
    else
    {
      [WeakRetained _handleExtensionsAdded:v9];
      [v12[3] addCancelable:v8];
    }
  }
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_extensionsObserverCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MEContentRuleListManager;
  [(MEContentRuleListManager *)&v3 dealloc];
}

- (id)_activeRuleLists
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  activeRuleListsByIdentifier = self->_activeRuleListsByIdentifier;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__MEContentRuleListManager__activeRuleLists__block_invoke;
  v5[3] = &unk_264283270;
  v5[4] = &v6;
  [(EFLocked *)activeRuleListsByIdentifier performWhileLocked:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__MEContentRuleListManager__activeRuleLists__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_handleExtensionsAdded:(id)a3
{
  id v4 = a3;
  observationScheduler = self->_observationScheduler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__MEContentRuleListManager__handleExtensionsAdded___block_invoke;
  v7[3] = &unk_264283298;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(EFAssertableScheduler *)observationScheduler performBlock:v7];
}

void __51__MEContentRuleListManager__handleExtensionsAdded___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = objc_msgSend(*(id *)(a1 + 40), "_encodedContentRuleListForExtension:", v6, (void)v10);
        if (v7)
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = [v6 extensionID];
          [v8 _compileAndAddContentRuleListForIdentifier:v9 encodedContentRuleList:v7];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)_handleExtensionsRemoved:(id)a3
{
  id v4 = a3;
  observationScheduler = self->_observationScheduler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke;
  v7[3] = &unk_264283298;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(EFAssertableScheduler *)observationScheduler performBlock:v7];
}

void __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_2;
  v5[3] = &unk_2642832E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performWhileLocked:v5];
}

void __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_4;
  v16[3] = &unk_2642832C0;
  id v5 = v4;
  id v17 = v5;
  id v6 = objc_msgSend(v3, "ef_filter:", v16);
  uint64_t v7 = [v6 allValues];

  [v3 removeObjectsForKeys:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfRemovedContentRuleList:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v9);
  }
}

id __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 extensionID];
  return v2;
}

uint64_t __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)_compileAndAddContentRuleListForIdentifier:(id)a3 encodedContentRuleList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke;
  v11[3] = &unk_264283338;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  long long v14 = self;
  uint64_t v10 = [MEMORY[0x263F3B3A0] mainThreadScheduler];
  [v10 performSyncBlock:v11];
}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke(void *a1)
{
  id v2 = [(objc_class *)getWKContentRuleListStoreClass() defaultStore];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2;
  v5[3] = &unk_264283310;
  void v5[4] = a1[6];
  id v6 = v3;
  [v2 compileContentRuleListForIdentifier:v6 encodedContentRuleList:v4 completionHandler:v5];
}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    long long v14 = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_3;
    long long v15 = &unk_2642832E8;
    uint64_t v16 = *(id *)(a1 + 40);
    id v9 = v5;
    id v17 = v9;
    [v8 performWhileLocked:&v12];
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfNewContentRuleList:", v9, v12, v13, v14, v15);

    uint64_t v10 = v16;
  }
  else
  {
    if (v6)
    {
      uint64_t v11 = +[MEContentRuleListManager log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2();
      }
    }
    uint64_t v10 = +[MEContentRuleListManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1();
    }
  }
}

uint64_t __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)_encodedContentRuleListForExtension:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 synchronousContentBlockerInterface];
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__MEContentRuleListManager__encodedContentRuleListForExtension___block_invoke;
  v12[3] = &unk_264283360;
  v12[4] = &v13;
  [v4 contentRulesJSONWithCompletionHandler:v12];
  if (v14[5])
  {
    id v5 = [NSString alloc];
    id v6 = (void *)[v5 initWithData:v14[5] encoding:4];
    id v7 = +[MEContentRuleListManager log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 extensionID];
      uint64_t v9 = [v6 length];
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "Filter %{public}@ returned with text length:%lu", buf, 0x16u);
    }
  }
  else
  {
    id v7 = +[MEContentRuleListManager log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v3 extensionID];
      [(MEContentRuleListManager *)v10 _encodedContentRuleListForExtension:v7];
    }
    id v6 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __64__MEContentRuleListManager__encodedContentRuleListForExtension___block_invoke(uint64_t a1, void *a2)
{
}

- (id)addObserver:(id)a3 activeRuleLists:(id *)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  id v6 = objc_alloc_init(MEMORY[0x263F3B350]);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __56__MEContentRuleListManager_addObserver_activeRuleLists___block_invoke;
  uint64_t v13 = &unk_264282FF0;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  [v6 addCancelationBlock:&v10];
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  id v8 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v8, v10, v11, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
  if (a4)
  {
    *a4 = [(MEContentRuleListManager *)self _activeRuleLists];
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v6;
}

void __56__MEContentRuleListManager_addObserver_activeRuleLists___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 14;
    id v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 14);
    uint64_t v4 = *(void **)&v6[10]._os_unfair_lock_opaque;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 removeObject:v5];

    os_unfair_lock_unlock(v3);
    id WeakRetained = v6;
  }
}

- (void)_notifyObserversOfNewContentRuleList:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "contentRuleListManager:didAddRuleList:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversOfUpdatedContentRuleList:(id)a3 oldContentRuleList:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "contentRuleListManager:didUpdateContentRuleList:oldContentRuleList:", self, v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_notifyObserversOfRemovedContentRuleList:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "contentRuleListManager:didRemoveRuleList:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_scheduleContentRuleListReload
{
}

- (void)_reloadContentRuleLists
{
  [(EFAssertableScheduler *)self->_observationScheduler assertIsExecuting:1];
  id v3 = [(EFLocked *)self->_activeRuleListsByIdentifier getObject];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke;
  v4[3] = &unk_2642833D8;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) extensionForIdentifier:v5];
  uint64_t v8 = [*(id *)(a1 + 32) _encodedContentRuleListForExtension:v7];
  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2;
    v12[3] = &unk_2642833B0;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v6;
    long long v11 = objc_msgSend(MEMORY[0x263F3B3A0], "mainThreadScheduler", v12[0], 3221225472, __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2, &unk_2642833B0);
    [v11 performSyncBlock:v12];
  }
}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2(uint64_t a1)
{
  id v2 = [(objc_class *)getWKContentRuleListStoreClass() defaultStore];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_3;
  v5[3] = &unk_264283388;
  void v5[4] = *(void *)(a1 + 48);
  id v6 = v3;
  id v7 = *(id *)(a1 + 56);
  [v2 compileContentRuleListForIdentifier:v6 encodedContentRuleList:v4 completionHandler:v5];
}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_4;
    uint64_t v15 = &unk_2642832E8;
    id v16 = *(id *)(a1 + 40);
    id v9 = v5;
    id v17 = v9;
    [v8 performWhileLocked:&v12];
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdatedContentRuleList:oldContentRuleList:", v9, *(void *)(a1 + 48), v12, v13, v14, v15);

    uint64_t v10 = v16;
  }
  else
  {
    if (v6)
    {
      long long v11 = +[MEContentRuleListManager log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2();
      }
    }
    uint64_t v10 = +[MEContentRuleListManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1();
    }
  }
}

uint64_t __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeRuleListsByIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_2164DB000, a3, (uint64_t)a3, "Failed to register for app extensions changes error: %{public}@", (uint8_t *)a2);
}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v3 = 138543362;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3(&dword_2164DB000, v1, v2, "Rule list identifier:%{public}@ was not added to active the rule list", (uint8_t *)&v3);
}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2164DB000, v0, v1, "Error occured while compiling rule list for identifier:%{public}@ error:%{public}@");
}

- (void)_encodedContentRuleListForExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_2164DB000, a3, (uint64_t)a3, "Filter %{public}@ returned with no data", (uint8_t *)a2);
}

@end