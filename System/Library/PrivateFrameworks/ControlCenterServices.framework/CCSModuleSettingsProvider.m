@interface CCSModuleSettingsProvider
+ (BOOL)_continuousExposeEnabled;
+ (id)_configurationDirectoryURL;
+ (id)_configurationFileURL;
+ (id)_defaultEnabledModuleOrder;
+ (id)_defaultFixedModuleIdentifiers;
+ (id)_defaultUserEnabledFixedModuleIdentifiers;
+ (id)_defaultUserEnabledModuleIdentifiers;
+ (id)_readSettingsWithVersion:(unint64_t *)a3;
+ (id)sharedProvider;
+ (void)_writeOrderedIdentifiers:(id)a3 userEnabledFixedIdentifiers:(id)a4 userDisabledIdentifiers:(id)a5;
- (CCSModuleSettingsProvider)init;
- (NSArray)orderedFixedModuleIdentifiers;
- (NSArray)orderedUserEnabledFixedModuleIdentifiers;
- (NSArray)orderedUserEnabledModuleIdentifiers;
- (NSArray)userDisabledModuleIdentifiers;
- (void)_queue_handleConfigurationFileUpdate;
- (void)_queue_loadSettings;
- (void)_queue_runBlockOnListeners:(id)a3;
- (void)_queue_saveSettings;
- (void)_queue_sendConfigurationFileUpdateMessageToObservers;
- (void)_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4;
- (void)_queue_startMonitoringConfigurationUpdates;
- (void)_queue_stopMonitoringConfigurationUpdates;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)legacyModuleMigration:(BOOL *)a3 versionNumber:(unint64_t)a4;
- (void)removeObserver:(id)a3;
- (void)setAndSaveOrderedUserEnabledFixedModuleIdentifiers:(id)a3;
- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3;
- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4;
@end

@implementation CCSModuleSettingsProvider

+ (id)sharedProvider
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CCSModuleSettingsProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, block);
  }
  v2 = (void *)sharedProvider_instance;

  return v2;
}

uint64_t __43__CCSModuleSettingsProvider_sharedProvider__block_invoke(uint64_t a1)
{
  sharedProvider_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (CCSModuleSettingsProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)CCSModuleSettingsProvider;
  v2 = [(CCSModuleSettingsProvider *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [(id)objc_opt_class() _defaultFixedModuleIdentifiers];
    orderedFixedModuleIdentifiers = v2->_orderedFixedModuleIdentifiers;
    v2->_orderedFixedModuleIdentifiers = (NSArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ControlCenter.ModuleSettingsProvider", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.ControlCenter.ModuleSettingsProvider.callout", v10);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v11;

    v13 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__CCSModuleSettingsProvider_init__block_invoke;
    block[3] = &unk_2645B6780;
    v16 = v2;
    dispatch_sync(v13, block);
  }
  return v2;
}

uint64_t __33__CCSModuleSettingsProvider_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadSettings");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_startMonitoringConfigurationUpdates");
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CCSModuleSettingsProvider_dealloc__block_invoke;
  block[3] = &unk_2645B6780;
  void block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CCSModuleSettingsProvider;
  [(CCSModuleSettingsProvider *)&v4 dealloc];
}

uint64_t __36__CCSModuleSettingsProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopMonitoringConfigurationUpdates");
}

- (NSArray)orderedFixedModuleIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleSettingsProvider_orderedFixedModuleIdentifiers__block_invoke;
  v5[3] = &unk_2645B67A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __58__CCSModuleSettingsProvider_orderedFixedModuleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (NSArray)orderedUserEnabledModuleIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__CCSModuleSettingsProvider_orderedUserEnabledModuleIdentifiers__block_invoke;
  v5[3] = &unk_2645B67A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __64__CCSModuleSettingsProvider_orderedUserEnabledModuleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x270F9A758]();
}

- (NSArray)orderedUserEnabledFixedModuleIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__CCSModuleSettingsProvider_orderedUserEnabledFixedModuleIdentifiers__block_invoke;
  v5[3] = &unk_2645B67A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __69__CCSModuleSettingsProvider_orderedUserEnabledFixedModuleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x270F9A758]();
}

- (NSArray)userDisabledModuleIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleSettingsProvider_userDisabledModuleIdentifiers__block_invoke;
  v5[3] = &unk_2645B67A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __58__CCSModuleSettingsProvider_userDisabledModuleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x270F9A758]();
}

- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __75__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:previousOrderedUserEnabledModuleIdentifiers:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48));
}

- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers_previousOrderedUserEnabledModuleIdentifiers___block_invoke;
  block[3] = &unk_2645B67F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __119__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers_previousOrderedUserEnabledModuleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:previousOrderedUserEnabledModuleIdentifiers:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    id v8 = [MEMORY[0x263EFFA08] setWithArray:v18];
    id v9 = (void *)[v7 mutableCopy];
    [v9 minusSet:v8];
    id v10 = (void *)[v8 mutableCopy];
    [v10 minusSet:v7];
    id v11 = (void *)[(NSArray *)self->_userDisabledModuleIdentifiers mutableCopy];
    id v12 = [v10 allObjects];
    [v11 removeObjectsInArray:v12];

    id v13 = [v9 allObjects];
    [v11 addObjectsFromArray:v13];

    [v11 sortUsingSelector:sel_caseInsensitiveCompare_];
    v14 = (NSArray *)[v18 copy];
    orderedUserEnabledModuleIdentifiers = self->_orderedUserEnabledModuleIdentifiers;
    self->_orderedUserEnabledModuleIdentifiers = v14;

    v16 = (NSArray *)[v11 copy];
    userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v16;

    [(CCSModuleSettingsProvider *)self _queue_stopMonitoringConfigurationUpdates];
    [(CCSModuleSettingsProvider *)self _queue_saveSettings];
    [(CCSModuleSettingsProvider *)self _queue_startMonitoringConfigurationUpdates];
    [(CCSModuleSettingsProvider *)self _queue_sendConfigurationFileUpdateMessageToObservers];
  }
}

- (void)setAndSaveOrderedUserEnabledFixedModuleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledFixedModuleIdentifiers___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __80__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledFixedModuleIdentifiers___block_invoke(uint64_t a1)
{
  if ((BSEqualObjects() & 1) == 0)
  {
    id v14 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(*(void *)(a1 + 32) + 56)];
    v2 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
    id v3 = (void *)[v14 mutableCopy];
    [v3 minusSet:v2];
    id v4 = (void *)[v2 mutableCopy];
    [v4 minusSet:v14];
    uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) mutableCopy];
    id v6 = [v4 allObjects];
    [v5 removeObjectsInArray:v6];

    id v7 = [v3 allObjects];
    [v5 addObjectsFromArray:v7];

    [v5 sortUsingSelector:sel_caseInsensitiveCompare_];
    uint64_t v8 = [*(id *)(a1 + 40) copy];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;

    uint64_t v11 = [v5 copy];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 64);
    *(void *)(v12 + 64) = v11;

    objc_msgSend(*(id *)(a1 + 32), "_queue_stopMonitoringConfigurationUpdates");
    objc_msgSend(*(id *)(a1 + 32), "_queue_saveSettings");
    objc_msgSend(*(id *)(a1 + 32), "_queue_startMonitoringConfigurationUpdates");
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendConfigurationFileUpdateMessageToObservers");
  }
}

+ (id)_readSettingsWithVersion:(unint64_t *)a3
{
  id v4 = [(id)objc_opt_class() _configurationFileURL];
  uint64_t v5 = [MEMORY[0x263EFF950] inputStreamWithURL:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 open];
    id v26 = 0;
    id v7 = [MEMORY[0x263F08AC0] propertyListWithStream:v6 options:0 format:0 error:&v26];
    id v8 = v26;
    [v6 close];
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
        +[CCSModuleSettingsProvider _readSettingsWithVersion:]();
      }
      id v9 = 0;
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v7;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
      id v14 = v13;

      v15 = objc_msgSend(v14, "bs_safeNumberForKey:", @"version");
      uint64_t v16 = [v15 unsignedIntegerValue];

      if (a3) {
        *a3 = v16;
      }
      if ((unint64_t)(v16 - 1) > 2)
      {
        v22 = CCSLogModuleSettings;
        if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
          +[CCSModuleSettingsProvider _readSettingsWithVersion:v22];
        }
        objc_super v17 = 0;
      }
      else
      {
        objc_super v17 = [MEMORY[0x263EFF9A0] dictionary];
        v25 = objc_msgSend(v14, "bs_safeArrayForKey:", @"module-identifiers");
        v24 = objc_msgSend(v25, "bs_mapNoNulls:", &__block_literal_global_3);
        objc_msgSend(v17, "bs_setSafeObject:forKey:", v24, @"module-identifiers");
        id v18 = objc_msgSend(v14, "bs_safeArrayForKey:", @"userenabled-fixed-module-identifiers");
        v19 = objc_msgSend(v18, "bs_mapNoNulls:", &__block_literal_global_58);
        objc_msgSend(v17, "bs_setSafeObject:forKey:", v19, @"userenabled-fixed-module-identifiers");
        v20 = objc_msgSend(v14, "bs_safeArrayForKey:", @"disabled-module-identifiers");
        v21 = objc_msgSend(v20, "bs_mapNoNulls:", &__block_literal_global_60);
        objc_msgSend(v17, "bs_setSafeObject:forKey:", v21, @"disabled-module-identifiers");
      }
      id v9 = v17;
    }
  }
  else
  {
    id v10 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
      +[CCSModuleSettingsProvider _readSettingsWithVersion:]((uint64_t)v4, v10);
    }
    id v9 = 0;
  }

  return v9;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (void)_writeOrderedIdentifiers:(id)a3 userEnabledFixedIdentifiers:(id)a4 userDisabledIdentifiers:(id)a5
{
  v25[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class() _configurationDirectoryURL];
  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  id v12 = [v10 path];
  char v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    id v14 = [MEMORY[0x263F08850] defaultManager];
    id v23 = 0;
    char v15 = [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v16 = v23;

    if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
      +[CCSModuleSettingsProvider _writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:]();
    }
  }
  objc_super v17 = [(id)objc_opt_class() _configurationFileURL];
  v24[0] = @"version";
  v24[1] = @"module-identifiers";
  v25[0] = &unk_26D39B6A8;
  v25[1] = v7;
  v24[2] = @"userenabled-fixed-module-identifiers";
  v24[3] = @"disabled-module-identifiers";
  v25[2] = v8;
  v25[3] = v9;
  id v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v19 = [MEMORY[0x263F08AC0] dataWithPropertyList:v18 format:100 options:0 error:0];
  id v22 = 0;
  char v20 = [v19 writeToURL:v17 options:268435457 error:&v22];
  id v21 = v22;
  if ((v20 & 1) == 0 && os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
    +[CCSModuleSettingsProvider _writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:]();
  }
}

- (void)legacyModuleMigration:(BOOL *)a3 versionNumber:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.control-center.CarModeModule"])
  {
    id v7 = (NSArray *)[(NSArray *)self->_userDisabledModuleIdentifiers mutableCopy];
    [(NSArray *)v7 removeObject:@"com.apple.control-center.CarModeModule"];
    userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v7;

    *a3 = 1;
  }
  p_orderedUserEnabledModuleIdentifiers = &self->_orderedUserEnabledModuleIdentifiers;
  if ([(NSArray *)self->_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.control-center.CarModeModule"])
  {
    id v10 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v10 removeObject:@"com.apple.control-center.CarModeModule"];
    uint64_t v11 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v10;

    *a3 = 1;
  }
  if ([(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.sleep.controlcenter.sleepmode"])
  {
    id v12 = (NSArray *)[(NSArray *)self->_userDisabledModuleIdentifiers mutableCopy];
    [(NSArray *)v12 removeObject:@"com.apple.sleep.controlcenter.sleepmode"];
    char v13 = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v12;

    *a3 = 1;
  }
  if ([(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.sleep.controlcenter.sleepmode"])
  {
    id v14 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v14 removeObject:@"com.apple.sleep.controlcenter.sleepmode"];
    char v15 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v14;

    *a3 = 1;
  }
  if ([(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.Home.ControlCenter"])
  {
    id v16 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_221518000, v16, OS_LOG_TYPE_DEFAULT, "Migrating home module from user enabled to enabled and fixed module", (uint8_t *)&v39, 2u);
    }
    objc_super v17 = (void *)[(NSArray *)self->_orderedUserEnabledModuleIdentifiers mutableCopy];
    [v17 removeObject:@"com.apple.Home.ControlCenter"];
    objc_storeStrong((id *)&self->_orderedUserEnabledModuleIdentifiers, v17);
    if (![(NSArray *)self->_orderedUserEnabledFixedModuleIdentifiers containsObject:@"com.apple.Home.ControlCenter"])
    {
      id v18 = (NSArray *)[(NSArray *)self->_orderedUserEnabledFixedModuleIdentifiers mutableCopy];
      [(NSArray *)v18 addObject:@"com.apple.Home.ControlCenter"];
      orderedUserEnabledFixedModuleIdentifiers = self->_orderedUserEnabledFixedModuleIdentifiers;
      self->_orderedUserEnabledFixedModuleIdentifiers = v18;
    }
    *a3 = 1;
  }
  if (![(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.BarcodeSupport.NFCControlCenterModule"]&& ![(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.BarcodeSupport.NFCControlCenterModule"])
  {
    char v20 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v20 addObject:@"com.apple.BarcodeSupport.NFCControlCenterModule"];
    id v21 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v20;

    *a3 = 1;
  }
  id v22 = [MEMORY[0x263F29CA0] sharedInstance];
  int v23 = [v22 deviceClass];

  if (a4 <= 1
    && !v23
    && [(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"])
  {
    v24 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 134217984;
      unint64_t v40 = a4;
      _os_log_impl(&dword_221518000, v24, OS_LOG_TYPE_DEFAULT, "Migrating mute module out of user-disabled list from settings with version: %lu", (uint8_t *)&v39, 0xCu);
    }
    v25 = (NSArray *)[(NSArray *)self->_userDisabledModuleIdentifiers mutableCopy];
    [(NSArray *)v25 removeObject:@"com.apple.control-center.MuteModule"];
    id v26 = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v25;

    *a3 = 1;
  }
  if (![(NSArray *)self->_orderedFixedModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"]&& ![(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"]&& ![(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"])
  {
    v27 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v27 insertObject:@"com.apple.control-center.MuteModule" atIndex:0];
    v28 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v27;

    *a3 = 1;
  }
  if ([(NSArray *)self->_orderedFixedModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"]&& [(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.control-center.MuteModule"])
  {
    v29 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v29 removeObject:@"com.apple.control-center.MuteModule"];
    v30 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v29;

    *a3 = 1;
  }
  if (![(NSArray *)self->_orderedFixedModuleIdentifiers containsObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"]&& ![(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"]&& ![(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"])
  {
    v31 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v31 addObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"];
    v32 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v31;

    *a3 = 1;
  }
  if ([(NSArray *)self->_orderedFixedModuleIdentifiers containsObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"]&& [(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"])
  {
    v33 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v33 removeObject:@"com.apple.mediaremote.controlcenter.airplaymirroring"];
    v34 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v33;

    *a3 = 1;
  }
  if (((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    && ![(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.springboard.SensitiveUIModule"]&& ![(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.springboard.SensitiveUIModule"])
  {
    v35 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v35 addObject:@"com.apple.springboard.SensitiveUIModule"];
    v36 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v35;

    *a3 = 1;
  }
  if ([(id)objc_opt_class() _continuousExposeEnabled]
    && ![(NSArray *)self->_userDisabledModuleIdentifiers containsObject:@"com.apple.springboard.ContinuousExposeModule"]&& ![(NSArray *)*p_orderedUserEnabledModuleIdentifiers containsObject:@"com.apple.springboard.ContinuousExposeModule"])
  {
    v37 = (NSArray *)[(NSArray *)*p_orderedUserEnabledModuleIdentifiers mutableCopy];
    [(NSArray *)v37 addObject:@"com.apple.springboard.ContinuousExposeModule"];
    v38 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v37;

    *a3 = 1;
  }
}

- (void)_queue_loadSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = 0;
  uint64_t v3 = [(id)objc_opt_class() _readSettingsWithVersion:&v15];
  id v4 = [v3 objectForKey:@"disabled-module-identifiers"];
  userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
  self->_userDisabledModuleIdentifiers = v4;

  if (!self->_userDisabledModuleIdentifiers)
  {
    self->_userDisabledModuleIdentifiers = (NSArray *)MEMORY[0x263EFFA68];
  }
  id v6 = [v3 objectForKey:@"userenabled-fixed-module-identifiers"];
  orderedUserEnabledFixedModuleIdentifiers = self->_orderedUserEnabledFixedModuleIdentifiers;
  self->_orderedUserEnabledFixedModuleIdentifiers = v6;

  id v8 = self->_orderedUserEnabledFixedModuleIdentifiers;
  if (!v8)
  {
    id v9 = [(id)objc_opt_class() _defaultUserEnabledFixedModuleIdentifiers];
    id v10 = self->_orderedUserEnabledFixedModuleIdentifiers;
    self->_orderedUserEnabledFixedModuleIdentifiers = v9;
  }
  uint64_t v11 = [v3 objectForKey:@"module-identifiers"];
  orderedUserEnabledModuleIdentifiers = self->_orderedUserEnabledModuleIdentifiers;
  self->_orderedUserEnabledModuleIdentifiers = v11;

  if (!self->_orderedUserEnabledModuleIdentifiers)
  {
    char v13 = [(id)objc_opt_class() _defaultUserEnabledModuleIdentifiers];
    id v14 = self->_orderedUserEnabledModuleIdentifiers;
    self->_orderedUserEnabledModuleIdentifiers = v13;

LABEL_9:
    [(CCSModuleSettingsProvider *)self _queue_saveSettings];
    goto LABEL_10;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_saveSettings
{
  uint64_t v3 = objc_opt_class();
  orderedUserEnabledModuleIdentifiers = self->_orderedUserEnabledModuleIdentifiers;
  orderedUserEnabledFixedModuleIdentifiers = self->_orderedUserEnabledFixedModuleIdentifiers;
  userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;

  [v3 _writeOrderedIdentifiers:orderedUserEnabledModuleIdentifiers userEnabledFixedIdentifiers:orderedUserEnabledFixedModuleIdentifiers userDisabledIdentifiers:userDisabledModuleIdentifiers];
}

- (void)_queue_startMonitoringConfigurationUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(id)objc_opt_class() _configurationFileURL];
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0x8000);
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8410], v4, 1uLL, (dispatch_queue_t)self->_queue);
  configurationChangedSource = self->_configurationChangedSource;
  self->_configurationChangedSource = v5;

  objc_initWeak(&location, self);
  id v7 = self->_configurationChangedSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke;
  handler[3] = &unk_2645B6840;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v7, handler);
  id v8 = self->_configurationChangedSource;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke_2;
  v9[3] = &__block_descriptor_36_e5_v8__0l;
  int v10 = v4;
  dispatch_source_set_cancel_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_configurationChangedSource);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_handleConfigurationFileUpdate");
}

uint64_t __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_queue_stopMonitoringConfigurationUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  configurationChangedSource = self->_configurationChangedSource;
  if (configurationChangedSource)
  {
    dispatch_source_cancel(configurationChangedSource);
    int v4 = self->_configurationChangedSource;
    self->_configurationChangedSource = 0;
  }
}

- (void)_queue_handleConfigurationFileUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CCSModuleSettingsProvider *)self _queue_stopMonitoringConfigurationUpdates];
  [(CCSModuleSettingsProvider *)self _queue_loadSettings];
  [(CCSModuleSettingsProvider *)self _queue_startMonitoringConfigurationUpdates];

  [(CCSModuleSettingsProvider *)self _queue_sendConfigurationFileUpdateMessageToObservers];
}

- (void)_queue_sendConfigurationFileUpdateMessageToObservers
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __81__CCSModuleSettingsProvider__queue_sendConfigurationFileUpdateMessageToObservers__block_invoke;
  v2[3] = &unk_2645B6888;
  v2[4] = self;
  [(CCSModuleSettingsProvider *)self _queue_runBlockOnListeners:v2];
}

uint64_t __81__CCSModuleSettingsProvider__queue_sendConfigurationFileUpdateMessageToObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 orderedEnabledModuleIdentifiersChangedForSettingsProvider:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CCSModuleSettingsProvider_addObserver___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__CCSModuleSettingsProvider_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CCSModuleSettingsProvider_removeObserver___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __44__CCSModuleSettingsProvider_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_runBlockOnListeners:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  callOutQueue = self->_callOutQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__CCSModuleSettingsProvider__queue_runBlockOnListeners___block_invoke;
  v9[3] = &unk_2645B64C0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(callOutQueue, v9);
}

uint64_t __56__CCSModuleSettingsProvider__queue_runBlockOnListeners___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(void *)(a1 + 40));
}

+ (BOOL)_continuousExposeEnabled
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return MGGetBoolAnswer();
}

+ (id)_defaultEnabledModuleOrder
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CCSModuleSettingsProvider__defaultEnabledModuleOrder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_defaultEnabledModuleOrder_onceToken != -1) {
    dispatch_once(&_defaultEnabledModuleOrder_onceToken, block);
  }
  id v2 = (void *)_defaultEnabledModuleOrder_moduleOrderDict;

  return v2;
}

void __55__CCSModuleSettingsProvider__defaultEnabledModuleOrder__block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F29CA0] sharedInstance];
  int v3 = [v2 deviceClass];

  if (v3)
  {
    char v4 = MGGetBoolAnswer();
    int v5 = [*(id *)(a1 + 32) _continuousExposeEnabled];
    if (v4)
    {
      if (v5)
      {
        v13[0] = @"fixed";
        v13[1] = @"user-enabled-fixed";
        v14[0] = &unk_26D39B780;
        v14[1] = MEMORY[0x263EFFA68];
        v13[2] = @"user-enabled";
        v14[2] = &unk_26D39B798;
        id v6 = NSDictionary;
        id v7 = v14;
        id v8 = v13;
      }
      else
      {
        v11[0] = @"fixed";
        v11[1] = @"user-enabled-fixed";
        v12[0] = &unk_26D39B7B0;
        v12[1] = MEMORY[0x263EFFA68];
        v11[2] = @"user-enabled";
        v12[2] = &unk_26D39B7C8;
        id v6 = NSDictionary;
        id v7 = v12;
        id v8 = v11;
      }
    }
    else
    {
      v15[0] = @"fixed";
      v15[1] = @"user-enabled-fixed";
      v16[0] = &unk_26D39B750;
      v16[1] = MEMORY[0x263EFFA68];
      v15[2] = @"user-enabled";
      v16[2] = &unk_26D39B768;
      id v6 = NSDictionary;
      id v7 = v16;
      id v8 = v15;
    }
  }
  else if (MGGetBoolAnswer())
  {
    v17[0] = @"fixed";
    v17[1] = @"user-enabled-fixed";
    v18[0] = &unk_26D39B720;
    v18[1] = MEMORY[0x263EFFA68];
    v17[2] = @"user-enabled";
    v18[2] = &unk_26D39B738;
    id v6 = NSDictionary;
    id v7 = v18;
    id v8 = v17;
  }
  else
  {
    v19[0] = @"fixed";
    v19[1] = @"user-enabled-fixed";
    v20[0] = &unk_26D39B6F0;
    v20[1] = MEMORY[0x263EFFA68];
    v19[2] = @"user-enabled";
    v20[2] = &unk_26D39B708;
    id v6 = NSDictionary;
    id v7 = v20;
    id v8 = v19;
  }
  uint64_t v9 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:3];
  id v10 = (void *)_defaultEnabledModuleOrder_moduleOrderDict;
  _defaultEnabledModuleOrder_moduleOrderDict = v9;
}

+ (id)_configurationDirectoryURL
{
  v7[3] = *MEMORY[0x263EF8340];
  id v2 = NSURL;
  int v3 = BSCurrentUserDirectory();
  v7[0] = v3;
  v7[1] = @"Library";
  v7[2] = @"ControlCenter";
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  int v5 = [v2 fileURLWithPathComponents:v4];

  return v5;
}

+ (id)_configurationFileURL
{
  id v2 = [(id)objc_opt_class() _configurationDirectoryURL];
  int v3 = [v2 URLByAppendingPathComponent:@"ModuleConfiguration.plist"];

  return v3;
}

+ (id)_defaultFixedModuleIdentifiers
{
  id v2 = [(id)objc_opt_class() _defaultEnabledModuleOrder];
  int v3 = [v2 objectForKey:@"fixed"];

  return v3;
}

+ (id)_defaultUserEnabledFixedModuleIdentifiers
{
  id v2 = [(id)objc_opt_class() _defaultEnabledModuleOrder];
  int v3 = [v2 objectForKey:@"user-enabled-fixed"];

  return v3;
}

+ (id)_defaultUserEnabledModuleIdentifiers
{
  id v2 = [(id)objc_opt_class() _defaultEnabledModuleOrder];
  int v3 = [v2 objectForKey:@"user-enabled"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDisabledModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedUserEnabledFixedModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedUserEnabledModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedFixedModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configurationChangedSource, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)_readSettingsWithVersion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221518000, a2, OS_LOG_TYPE_ERROR, "Could not load configuration file (NSInputStream is nil) at %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_readSettingsWithVersion:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = 3;
  _os_log_error_impl(&dword_221518000, log, OS_LOG_TYPE_ERROR, "Configuration file at %{public}@ has an invalid version number, %lu (current version = %lu)", (uint8_t *)&v3, 0x20u);
}

+ (void)_readSettingsWithVersion:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_221518000, v0, v1, "Could not load configuration file (NSPropertyListSerialization error) at %{public}@, plist error %{public}@");
}

+ (void)_writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_221518000, v0, v1, "Error writing configuration file %{public}@, %{public}@");
}

+ (void)_writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_221518000, v0, v1, "Error creating directory for configuration file %{public}@, %{public}@");
}

@end