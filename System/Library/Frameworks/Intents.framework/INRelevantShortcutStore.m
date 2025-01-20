@interface INRelevantShortcutStore
+ (INRelevantShortcutStore)defaultStore;
- (CSSearchableIndex)index;
- (INRelevantShortcutStore)initWithSearchableIndex:(id)a3;
- (void)setRelevantShortcuts:(NSArray *)shortcuts completionHandler:(void *)completionHandler;
- (void)setRelevantShortcuts:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation INRelevantShortcutStore

- (void).cxx_destruct
{
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void)setRelevantShortcuts:(NSArray *)shortcuts completionHandler:(void *)completionHandler
{
}

- (void)setRelevantShortcuts:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] > 0x64)
  {
    NSLog((NSString *)@"WARNING: Too many INRelevantShortcuts; only using the first %lu", 100);
    objc_msgSend(v8, "subarrayWithRange:", 0, 100);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v8;
  }
  v12 = v11;
  dispatch_group_t v13 = dispatch_group_create();
  v14 = objc_opt_new();
  v15 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
  objc_msgSend(v15, "setCount:", objc_msgSend(v12, "count"));
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke;
  v28[3] = &unk_1E55168D8;
  dispatch_group_t v29 = v13;
  v30 = self;
  id v31 = v14;
  id v16 = v15;
  id v32 = v16;
  id v17 = v14;
  v18 = v13;
  [v12 enumerateObjectsUsingBlock:v28];
  v19 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_12;
  block[3] = &unk_1E551DC80;
  id v24 = v16;
  v25 = self;
  id v26 = v9;
  id v27 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = v16;
  dispatch_group_notify(v18, v19, block);
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"\"%@\" is not the expected INRelevantShortcut", v9];

    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E55168B0;
  v6 = *(void **)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  id v13 = v6;
  id v14 = *(id *)(a1 + 56);
  uint64_t v16 = a3;
  id v15 = *(id *)(a1 + 32);
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v5, 0x15u, 0, 1, 0, v12, 180.0, 180.0);
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) compact];
  v2 = [*(id *)(a1 + 40) index];
  v3 = [*(id *)(a1 + 32) allObjects];
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2_13;
  v5[3] = &unk_1E5516900;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v2 donateRelevantShortcuts:v3 bundleID:v4 completionHandler:v5];
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2_13(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = INSiriLogContextIntents;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke_2";
      __int16 v11 = 2114;
      uint64_t v12 = (uint64_t)v3;
      _os_log_error_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to set new relevant shortcuts: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 allObjects];
    int v9 = 136315394;
    uint64_t v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke";
    __int16 v11 = 2050;
    uint64_t v12 = [v7 count];
    _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Updated relevant shortcuts with %{public}lu shortcuts", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 136315650;
      uint64_t v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke_2";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  [*(id *)(a1 + 40) lock];
  [*(id *)(a1 + 48) replacePointerAtIndex:*(void *)(a1 + 64) withPointer:v5];
  [*(id *)(a1 + 40) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (INRelevantShortcutStore)initWithSearchableIndex:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INRelevantShortcutStore;
  id v6 = [(INRelevantShortcutStore *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_index, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

+ (INRelevantShortcutStore)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__INRelevantShortcutStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, block);
  }
  v2 = (void *)defaultStore_defaultStore;

  return (INRelevantShortcutStore *)v2;
}

void __39__INRelevantShortcutStore_defaultStore__block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getCSSearchableIndexClass_softClass_5743;
  uint64_t v13 = getCSSearchableIndexClass_softClass_5743;
  if (!getCSSearchableIndexClass_softClass_5743)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCSSearchableIndexClass_block_invoke_5744;
    v9[3] = &unk_1E5520EB8;
    v9[4] = &v10;
    __getCSSearchableIndexClass_block_invoke_5744((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = [v3 alloc];
  id v5 = NSStringFromClass(*(Class *)(a1 + 32));
  id v6 = (void *)[v4 initWithName:v5 protectionClass:*MEMORY[0x1E4F28358]];

  id v7 = [[INRelevantShortcutStore alloc] initWithSearchableIndex:v6];
  uint64_t v8 = (void *)defaultStore_defaultStore;
  defaultStore_defaultStore = (uint64_t)v7;
}

@end