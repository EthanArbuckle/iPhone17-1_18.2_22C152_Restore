@interface EDSyncableSettings
- (EDSyncableSettings)init;
- (EDSyncableSettings)initWithDefaults:(id)a3 store:(id)a4;
- (id)_registerDefaultsObservers;
- (id)observeChangesForKey:(id)a3 cloudKey:(id)a4 conflictResolver:(id)a5;
- (id)proxyChangeHandler;
- (id)syncableSettingsMap;
- (void)_changeActionForKey:(void *)a1;
- (void)_mergeExternalChangedKeys:(uint64_t)a1;
- (void)_mergeIntegerSetting:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:;
- (void)_mergeLocalChangeForKey:(void *)a3 value:;
- (void)_mergeTrackingSettings:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:;
- (void)_setChangeAction:(void *)a3 forKey:;
- (void)_storeChangedExternally:(id)a3;
- (void)beginSyncing;
- (void)dealloc;
- (void)setProxyChangeHandler:(id)a3;
@end

@implementation EDSyncableSettings

void ___ef_log_EDSyncableSettings_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDSyncableSettings");
  v1 = (void *)_ef_log_EDSyncableSettings_log;
  _ef_log_EDSyncableSettings_log = (uint64_t)v0;
}

- (EDSyncableSettings)initWithDefaults:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)EDSyncableSettings;
  v9 = [(EDSyncableSettings *)&v19 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = [v10 initWithObject:v11];
    changeActionsByKey = v9->_changeActionsByKey;
    v9->_changeActionsByKey = (EFLocked *)v12;

    uint64_t v14 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EDSyncableSettings" qualityOfService:17];
    scheduler = v9->_scheduler;
    v9->_scheduler = (EFAssertableScheduler *)v14;

    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v9->_store, a4);
    v16 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelable = v9->_cancelable;
    v9->_cancelable = v16;
  }
  return v9;
}

- (EDSyncableSettings)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29130]) _initWithStoreIdentifier:@"com.apple.mail" usingEndToEndEncryption:1];
  v5 = [(EDSyncableSettings *)self initWithDefaults:v3 store:v4];

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EFCancelationToken *)self->_cancelable cancel];
  v4.receiver = self;
  v4.super_class = (Class)EDSyncableSettings;
  [(EDSyncableSettings *)&v4 dealloc];
}

- (void)beginSyncing
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "failed to synchronize store", v1, 2u);
}

- (id)_registerDefaultsObservers
{
  if (a1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F60D40]) initWithLabel:@"EDSyncableSettings-Defaults"];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v3 = -[EDSyncableSettings syncableSettingsMap](a1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke;
    v8[3] = &unk_1E6C067A8;
    objc_copyWeak(v10, &location);
    v10[1] = sel__registerDefaultsObservers;
    v8[4] = a1;
    id v4 = v2;
    id v9 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v8];

    v5 = v9;
    id v6 = v4;

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)syncableSettingsMap
{
  if (val)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, val);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__EDSyncableSettings_syncableSettingsMap__block_invoke;
    v3[3] = &unk_1E6C00E78;
    objc_copyWeak(&v4, &location);
    if (syncableSettingsMap_onceToken != -1) {
      dispatch_once(&syncableSettingsMap_onceToken, v3);
    }
    id v1 = (id)syncableSettingsMap_syncableSettingsMap;
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void __48__EDSyncableSettings__registerDefaultsObservers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"cloudKey"];
  id v8 = [v6 objectForKeyedSubscript:@"mergeType"];
  uint64_t v9 = [v8 unsignedIntegerValue];
  if (v9 == 1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_2;
    aBlock[3] = &unk_1E6C06758;
    objc_copyWeak(&v20, (id *)(a1 + 48));
    id v10 = _Block_copy(aBlock);
    objc_destroyWeak(&v20);
    if (!v10)
    {
LABEL_6:
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"EDSyncableSettings.m", 118, @"No merge block found for default %@", v5 object file lineNumber description];

      id v10 = 0;
    }
  }
  else
  {
    if (v9 != 2) {
      goto LABEL_6;
    }
    id v10 = [v6 objectForKeyedSubscript:@"customMergeBlock"];
    if (!v10) {
      goto LABEL_6;
    }
  }
  uint64_t v14 = a1 + 32;
  uint64_t v12 = *(void **)(a1 + 32);
  v13 = *(void **)(v14 + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_3;
  v17[3] = &unk_1E6C06780;
  id v15 = v10;
  id v18 = v15;
  v16 = [v12 observeChangesForKey:v5 cloudKey:v7 conflictResolver:v17];
  [v13 addCancelable:v16];
}

void __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_2(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  -[EDSyncableSettings _mergeIntegerSetting:cloudKey:isLocalChange:newValue:]((uint64_t)WeakRetained, v11, v10, a4, v9);
}

- (void)_mergeIntegerSetting:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = @"cloud to device";
    if (a4) {
      uint64_t v12 = @"device to cloud";
    }
    v13 = v12;
    if (v11 || a4)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v11 integerValue];
        v16 = _ef_log_EDSyncableSettings();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v9;
          __int16 v26 = 2114;
          v27 = v13;
          _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "syncing setting %{public}@ from %{public}@", buf, 0x16u);
        }

        if (a4)
        {
          v17 = *(void **)(a1 + 32);
          id v18 = [NSNumber numberWithInteger:v15];
          [v17 setObject:v18 forKey:v10];

          objc_super v19 = *(void **)(a1 + 16);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke;
          v23[3] = &unk_1E6BFF2F0;
          v23[4] = a1;
          [v19 performBlock:v23];
        }
        else
        {
          [*(id *)(a1 + 24) setInteger:v15 forKey:v9];
        }
      }
      else if (v11)
      {
        id v20 = _ef_log_EDSyncableSettings();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[EDSyncableSettings _mergeIntegerSetting:cloudKey:isLocalChange:newValue:]();
        }
      }
      else
      {
        [*(id *)(a1 + 32) removeObjectForKey:v10];
        v21 = *(void **)(a1 + 16);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke_2;
        v22[3] = &unk_1E6BFF2F0;
        v22[4] = a1;
        [v21 performBlock:v22];
      }
    }
    else
    {
      uint64_t v14 = _ef_log_EDSyncableSettings();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v9;
        _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ was remove remotely", buf, 0xCu);
      }

      [*(id *)(a1 + 24) removeObjectForKey:v9];
    }
  }
}

uint64_t __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__EDSyncableSettings_syncableSettingsMap__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4F60138];
  v10[0] = @"cloudKey";
  v10[1] = @"mergeType";
  v11[0] = @"tp";
  v11[1] = &unk_1F35BB168;
  id v10[2] = @"customMergeBlock";
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __41__EDSyncableSettings_syncableSettingsMap__block_invoke_45;
  id v8 = &unk_1E6C06758;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v1 = _Block_copy(&v5);
  v11[2] = v1;
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, v10, 3, v5, v6, v7, v8);
  v13[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v4 = (void *)syncableSettingsMap_syncableSettingsMap;
  syncableSettingsMap_syncableSettingsMap = v3;

  objc_destroyWeak(&v9);
}

void __41__EDSyncableSettings_syncableSettingsMap__block_invoke_45(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:]((uint64_t)WeakRetained, v11, v10, a4, v9);
}

- (void)_mergeTrackingSettings:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (!a1) {
    goto LABEL_20;
  }
  char v12 = [*(id *)(a1 + 24) integerForKey:v9];
  if (v11 || a4)
  {
    uint64_t v14 = @"cloud to device";
    if (a4) {
      uint64_t v14 = @"device to cloud";
    }
    v13 = v14;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v11 integerValue];
      v16 = _ef_log_EDSyncableSettings();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v26 = v13;
          _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "syncing tracking protection setting from %{public}@", buf, 0xCu);
        }

        if (a4)
        {
          v21 = *(void **)(a1 + 32);
          v22 = [NSNumber numberWithUnsignedInteger:v15];
          [v21 setObject:v22 forKey:v10];

          v23 = *(void **)(a1 + 16);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __77__EDSyncableSettings__mergeTrackingSettings_cloudKey_isLocalChange_newValue___block_invoke;
          v24[3] = &unk_1E6BFF2F0;
          v24[4] = a1;
          [v23 performBlock:v24];
        }
        else
        {
          [*(id *)(a1 + 24) setInteger:v15 forKey:v9];
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:]();
      }
    }
    else
    {
      id v18 = _ef_log_EDSyncableSettings();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:]();
      }
    }
  }
  else
  {
    v13 = _ef_log_EDSyncableSettings();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "skipping syncing tracking protection setting from cloud to device with no new value", buf, 2u);
    }
  }
  LOBYTE(v15) = v12;
LABEL_17:

  uint64_t v19 = [(id)a1 proxyChangeHandler];
  id v20 = (void *)v19;
  if (v19) {
    (*(void (**)(uint64_t, BOOL))(v19 + 16))(v19, (v15 & 4) == 0);
  }

LABEL_20:
}

- (void)_storeChangedExternally:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  unint64_t v7 = [v6 integerValue];

  if (v7 == 2)
  {
    id v8 = _ef_log_EDSyncableSettings();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EDSyncableSettings _storeChangedExternally:](v8);
    }
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];
    id v9 = _ef_log_EDSyncableSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v16 = v7;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "received external KVS change event: %ld, changed keys=%{public}@", buf, 0x16u);
    }

    if (v7 > 3 || v7 == 2)
    {
      char v12 = _ef_log_EDSyncableSettings();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EDSyncableSettings _storeChangedExternally:]();
      }
    }
    else
    {
      scheduler = self->_scheduler;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __46__EDSyncableSettings__storeChangedExternally___block_invoke;
      v13[3] = &unk_1E6BFFAF0;
      v13[4] = self;
      id v8 = v8;
      uint64_t v14 = v8;
      [(EFAssertableScheduler *)scheduler performSyncBlock:v13];
    }
  }
}

void __46__EDSyncableSettings__storeChangedExternally___block_invoke(uint64_t a1)
{
}

- (void)_mergeExternalChangedKeys:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 16) assertIsExecuting:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__EDSyncableSettings__mergeExternalChangedKeys___block_invoke;
    aBlock[3] = &unk_1E6C00D98;
    void aBlock[4] = a1;
    id v4 = (void (**)(void *, uint64_t, void *, char *))_Block_copy(aBlock);
    if ([v3 count])
    {
      char v16 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9, (void)v12);
          v4[2](v4, v9, v10, &v16);

          if (v16) {
            break;
          }
          if (v6 == ++v8)
          {
            uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
            if (v6) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) dictionaryRepresentation];
      [v11 enumerateKeysAndObjectsUsingBlock:v4];
    }
  }
}

void __48__EDSyncableSettings__mergeExternalChangedKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = -[EDSyncableSettings _changeActionForKey:](*(void **)(a1 + 32), a2);
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v7, 0);
  }
}

- (void)_changeActionForKey:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    long long v13 = __Block_byref_object_copy__40;
    long long v14 = __Block_byref_object_dispose__40;
    id v15 = 0;
    uint64_t v5 = (void *)a1[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__EDSyncableSettings__changeActionForKey___block_invoke;
    v7[3] = &unk_1E6C00760;
    uint64_t v9 = &v10;
    id v8 = v3;
    [v5 performWhileLocked:v7];
    a1 = _Block_copy((const void *)v11[5]);

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

- (void)_mergeLocalChangeForKey:(void *)a3 value:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    [*(id *)(a1 + 16) assertIsExecuting:1];
    uint64_t v6 = -[EDSyncableSettings _changeActionForKey:]((void *)a1, v8);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, 1);
    }
  }
}

void __42__EDSyncableSettings__changeActionForKey___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_setChangeAction:(void *)a3 forKey:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__EDSyncableSettings__setChangeAction_forKey___block_invoke;
    v9[3] = &unk_1E6C067D0;
    id v10 = v6;
    id v11 = v5;
    [v8 performWhileLocked:v9];
  }
}

void __46__EDSyncableSettings__setChangeAction_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v4 = _Block_copy(v3);
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)observeChangesForKey:(id)a3 cloudKey:(id)a4 conflictResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke;
  aBlock[3] = &unk_1E6C067F8;
  id v11 = v8;
  id v32 = v11;
  id v22 = v10;
  id v34 = v22;
  id v12 = v9;
  id v33 = v12;
  long long v13 = _Block_copy(aBlock);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)self, v13, v11);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)self, v13, v12);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  long long v14 = (void *)MEMORY[0x1E4F60D40];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_2;
  v26[3] = &unk_1E6C03548;
  objc_copyWeak(&v29, &location);
  id v15 = v11;
  id v27 = v15;
  id v16 = v12;
  id v28 = v16;
  __int16 v17 = [v14 tokenWithLabel:v15 cancelationBlock:v26];
  defaults = self->_defaults;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3;
  v23[3] = &unk_1E6C06820;
  objc_copyWeak(&v25, &location);
  id v19 = v15;
  id v24 = v19;
  id v20 = [(NSUserDefaults *)defaults ef_observeKeyPath:v19 options:5 usingBlock:v23];
  [v17 addCancelable:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v17;
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v4 = [v3 threadDictionary];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v5)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
    {

      id v10 = 0;
    }
    id v6 = [MEMORY[0x1E4F29060] currentThread];
    id v7 = [v6 threadDictionary];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = [MEMORY[0x1E4F29060] currentThread];
    id v9 = [v8 threadDictionary];
    [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)WeakRetained, 0, a1[4]);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)WeakRetained, 0, a1[5]);
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F29060] currentThread];
    id v7 = [v6 threadDictionary];
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = (id *)(a1 + 32);
    id v10 = [v7 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = _ef_log_EDSyncableSettings();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3_cold_1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      id v18 = WeakRetained[2];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_51;
      v19[3] = &unk_1E6C03548;
      objc_copyWeak(&v22, v4);
      id v20 = *v8;
      id v21 = v3;
      [v18 performSyncBlock:v19];

      objc_destroyWeak(&v22);
    }
  }
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  -[EDSyncableSettings _mergeLocalChangeForKey:value:]((uint64_t)WeakRetained, v2, v3);
}

uint64_t __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) synchronize];
}

uint64_t __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) synchronize];
}

uint64_t __77__EDSyncableSettings__mergeTrackingSettings_cloudKey_isLocalChange_newValue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) synchronize];
}

- (id)proxyChangeHandler
{
  return self->_proxyChangeHandler;
}

- (void)setProxyChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxyChangeHandler, 0);
  objc_storeStrong((id *)&self->_changeActionsByKey, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_cancelable, 0);
}

- (void)_mergeIntegerSetting:cloudKey:isLocalChange:newValue:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1DB39C000, v1, OS_LOG_TYPE_ERROR, "Unexpected object set when syncing %{public}@ from %{public}@", v2, 0x16u);
}

- (void)_mergeTrackingSettings:cloudKey:isLocalChange:newValue:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "skipping syncing tracking protection setting from %{public}@ (not set by user)", v2, v3, v4, v5, v6);
}

- (void)_mergeTrackingSettings:cloudKey:isLocalChange:newValue:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "skipping syncing tracking protection setting from %{public}@ (unknown value type)", v2, v3, v4, v5, v6);
}

- (void)_storeChangedExternally:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "kvstorage reported quota exceeded", v1, 2u);
}

- (void)_storeChangedExternally:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "unhandled change reason: %ld", v2, v3, v4, v5, v6);
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end