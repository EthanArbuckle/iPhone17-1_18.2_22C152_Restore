@interface FSModuleHost
+ (id)defaultHost;
+ (id)defaultInstanceUUID;
+ (id)defaultProbeOrderList;
+ (id)installedExtensionPropertiesSync;
+ (id)installedExtensionsSync;
- (BOOL)queryReceivedFirstDelegateCall;
- (FSModuleHost)init;
- (FSModuleHost)initWithProbeList:(BOOL)a3;
- (NSArray)modules;
- (NSCondition)queryLock;
- (NSDictionary)currentExtensionsByIdentifier;
- (NSDictionary)modulesByIdentifier;
- (_EXQueryController)queryController;
- (id)configurationForDefaultInstanceOf:(id)a3;
- (id)configurationForDefaultInstanceOfBundle:(id)a3;
- (id)configurationForInstance:(id)a3 ofBundle:(id)a4;
- (id)currentExtensions;
- (id)extensionPointRecords;
- (id)extensionTypes;
- (id)loadEnabledList;
- (id)loadProbeOrderList;
- (id)moduleForBundleID:(id)a3;
- (id)modulesLoaded;
- (id)modulesUnloaded;
- (unsigned)isValidModuleIdentifier:(id)a3 WithError:(id *)a4;
- (void)_updateProviderListForFilteredFSModileInstances:(id)a3;
- (void)_updateProviderListForMatchingExtensionRecords:(id)a3;
- (void)addBundleToEnableModules:(id)a3;
- (void)forceSynchronousProviderUpdate;
- (void)loadModulesAndMonitor;
- (void)loadModulesFromEKit;
- (void)loadModulesFromLSAndMonitor;
- (void)observerDidObserveDatabaseChange:(id)a3;
- (void)removeBundleFromEnabledModules:(id)a3;
- (void)saveEnabledList;
- (void)saveProbeOrderList;
- (void)setExtensions:(id)a3;
- (void)setExtensionsByIdentifierLocked:(id)a3;
- (void)setExtensionsLocked:(id)a3;
- (void)setModulesLoaded:(id)a3;
- (void)setModulesUnloaded:(id)a3;
- (void)setQueryController:(id)a3;
- (void)setQueryLock:(id)a3;
- (void)setQueryReceivedFirstDelegateCall:(BOOL)a3;
- (void)setupSyncronously;
@end

@implementation FSModuleHost

- (FSModuleHost)init
{
  v9.receiver = self;
  v9.super_class = (Class)FSModuleHost;
  v2 = [(FSModuleHost *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("FPDExtensionManager callback queue", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    moduleOrder = v2->_moduleOrder;
    v2->_moduleOrder = 0;

    enabledModules = v2->_enabledModules;
    v2->_enabledModules = 0;
  }
  return v2;
}

- (void)setExtensionsLocked:(id)a3
{
  dispatch_queue_t v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__FSModuleHost_setExtensionsLocked___block_invoke;
  v12[3] = &unk_26530B688;
  v7 = v6;
  v13 = v7;
  [v5 enumerateObjectsUsingBlock:v12];
  v8 = (NSArray *)[v5 copy];

  modules = self->_modules;
  self->_modules = v8;

  modulesByIdentifier = self->_modulesByIdentifier;
  self->_modulesByIdentifier = v7;
  v11 = v7;

  [(NSCondition *)self->_queryLock signal];
}

void __36__FSModuleHost_setExtensionsLocked___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  [v2 setObject:v3 forKey:v4];
}

+ (id)installedExtensionPropertiesSync
{
  v2 = +[FSModuleHost installedExtensionsSync];
  id v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke;
    v9[3] = &unk_26530B6B0;
    id v5 = v4;
    id v10 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
    v6 = v10;
    id v7 = v5;
  }
  else
  {
    id v7 = (id)MEMORY[0x263EFFA68];
  }

  return v7;
}

void __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 attributes];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = NSString;
  id v7 = [v4 objectForKeyedSubscript:@"FSShortName"];
  v8 = [v6 stringWithFormat:@"%@_fskit", v7];

  objc_super v9 = [v4 objectForKeyedSubscript:@"FSSupportsBlockResources"];
  id v10 = v9;
  if (v8) {
    BOOL v11 = v5 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && [v9 BOOLValue])
  {
    [v5 setValue:v8 forKey:*MEMORY[0x263EFFB68]];
    v12 = [NSNumber numberWithBool:1];
    [v5 setValue:v12 forKey:@"FSIsFSModule"];

    [v5 setValue:&unk_26FFFA590 forKey:@"FSImplementation"];
    v13 = [v4 objectForKeyedSubscript:@"FSMediaTypes"];
    uint64_t v14 = [v4 objectForKeyedSubscript:@"FSPersonalities"];
    v15 = (void *)v14;
    if (v13 && v14)
    {
      [v5 setValue:v13 forKey:@"FSMediaTypes"];
      [v5 setValue:v15 forKey:@"FSPersonalities"];
      [*(id *)(a1 + 32) addObject:v5];
      v16 = fskit_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v5;
        _os_log_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEFAULT, "Found FSModule: %@", buf, 0xCu);
      }
    }
    else
    {
      v16 = fskit_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke_cold_1();
      }
    }
  }
}

- (NSArray)modules
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)modulesByIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSCondition)queryLock
{
  return (NSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueryLock:(id)a3
{
}

- (_EXQueryController)queryController
{
  return (_EXQueryController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQueryController:(id)a3
{
}

- (BOOL)queryReceivedFirstDelegateCall
{
  return self->_queryReceivedFirstDelegateCall;
}

- (void)setQueryReceivedFirstDelegateCall:(BOOL)a3
{
  self->_queryReceivedFirstDelegateCall = a3;
}

- (id)modulesLoaded
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setModulesLoaded:(id)a3
{
}

- (id)modulesUnloaded
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setModulesUnloaded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modulesUnloaded, 0);
  objc_storeStrong(&self->_modulesLoaded, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_queryLock, 0);
  objc_storeStrong((id *)&self->_modulesByIdentifier, 0);
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_enabledModules, 0);
  objc_storeStrong((id *)&self->_moduleOrder, 0);
  objc_storeStrong((id *)&self->_moduleUUIDs, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (FSModuleHost)initWithProbeList:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FSModuleHost *)self init];
  id v5 = v4;
  if (v4 && v3)
  {
    uint64_t v6 = [(FSModuleHost *)v4 loadProbeOrderList];
    moduleOrder = v5->_moduleOrder;
    v5->_moduleOrder = (NSArray *)v6;

    uint64_t v8 = [(FSModuleHost *)v5 loadEnabledList];
    enabledModules = v5->_enabledModules;
    v5->_enabledModules = (NSArray *)v8;
  }
  return v5;
}

+ (id)defaultHost
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__FSModuleHost_Project__defaultHost__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultHost_onceToken != -1) {
    dispatch_once(&defaultHost_onceToken, block);
  }
  v2 = (void *)defaultHost_defaultHost;
  return v2;
}

uint64_t __36__FSModuleHost_Project__defaultHost__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = defaultHost_defaultHost;
  defaultHost_defaultHost = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (id)defaultInstanceUUID
{
  return +[FSEntityIdentifier defaultInstanceUUID];
}

+ (id)installedExtensionsSync
{
  uint64_t v2 = [a1 defaultHost];
  if (_os_feature_enabled_impl()) {
    [v2 forceSynchronousProviderUpdate];
  }
  else {
    [v2 loadModulesFromEKit];
  }
  BOOL v3 = [v2 modulesByIdentifier];

  return v3;
}

- (void)setupSyncronously
{
  uint64_t v2 = [(id)objc_opt_class() installedExtensionsSync];
}

- (void)loadModulesFromEKit
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F04DE8] extensionPointIdentifierQuery:@"com.apple.fskit.fsmodule"];
  if (v3)
  {
    id v4 = [MEMORY[0x263F04DF0] executeQuery:v3];
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_24DDB2000, v5, OS_LOG_TYPE_DEFAULT, "Found Extensions %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v6 = [v4 fs_map:&__block_literal_global_9];
    [(FSModuleHost *)self setExtensions:v6];
  }
  else
  {
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FSModuleHost(Project) loadModulesFromEKit]();
    }
  }
}

FSModuleInstance *__44__FSModuleHost_Project__loadModulesFromEKit__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FSModuleInstance instanceWithExtensionIdentity:a2];
}

- (void)loadModulesAndMonitor
{
  BOOL v3 = fskit_std_log();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  id v5 = fskit_std_log();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24DDB2000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InitialEnumeration", "Initial enumeration of file system modules", buf, 2u);
  }

  if (_os_feature_enabled_impl()) {
    [(FSModuleHost *)self loadModulesFromLSAndMonitor];
  }
  else {
    [(FSModuleHost *)self loadModulesFromEKit];
  }
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__FSModuleHost_Project__loadModulesAndMonitor__block_invoke;
  v8[3] = &unk_26530B4F8;
  v8[4] = self;
  v8[5] = v4;
  dispatch_async(callbackQueue, v8);
}

void __46__FSModuleHost_Project__loadModulesAndMonitor__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) afterFirstDiscovery];
  uint64_t v2 = fskit_std_log();
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_24DDB2000, v3, OS_SIGNPOST_INTERVAL_END, v4, "InitialEnumeration", (const char *)&unk_24DDF773F, v5, 2u);
  }
}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  os_signpost_id_t v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "Got LS database change", buf, 2u);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__FSModuleHost_Project__observerDidObserveDatabaseChange___block_invoke;
  block[3] = &unk_26530B5D8;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __58__FSModuleHost_Project__observerDidObserveDatabaseChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceSynchronousProviderUpdate];
}

- (void)loadModulesFromLSAndMonitor
{
  BOOL v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24DDB2000, v3, OS_LOG_TYPE_DEFAULT, "Loading modules from LS", v8, 2u);
  }

  if (!self->_observer)
  {
    os_signpost_id_t v4 = (LSObserver *)objc_alloc_init(MEMORY[0x263F018B8]);
    observer = self->_observer;
    self->_observer = v4;

    [(LSObserver *)self->_observer setDelegate:self];
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    [(LSObserver *)self->_observer setName:v7];

    [(LSObserver *)self->_observer startObserving];
    [(FSModuleHost *)self forceSynchronousProviderUpdate];
  }
}

- (id)extensionTypes
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = @"com.apple.fskit.fsmodule";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  BOOL v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_impl(&dword_24DDB2000, v3, OS_LOG_TYPE_DEFAULT, "Returning extension types %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (id)extensionPointRecords
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FSModuleHost_Project__extensionPointRecords__block_invoke;
  block[3] = &unk_26530B5D8;
  block[4] = self;
  if (extensionPointRecords_onceToken != -1) {
    dispatch_once(&extensionPointRecords_onceToken, block);
  }
  uint64_t v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = extensionPointRecords_ret;
    _os_log_impl(&dword_24DDB2000, v2, OS_LOG_TYPE_DEFAULT, "returning ep records %@", buf, 0xCu);
  }

  return (id)extensionPointRecords_ret;
}

void __46__FSModuleHost_Project__extensionPointRecords__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [*(id *)(a1 + 32) extensionTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        id v11 = objc_alloc(MEMORY[0x263F018B0]);
        id v18 = v9;
        v12 = (void *)[v11 initWithIdentifier:v10 platform:2 error:&v18];
        id v6 = v18;

        v13 = fskit_std_log();
        uint64_t v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v12 debugDescription];
            *(_DWORD *)buf = 138412290;
            v24 = v15;
            _os_log_impl(&dword_24DDB2000, v14, OS_LOG_TYPE_DEFAULT, "Adding LS record %@", buf, 0xCu);
          }
          [v2 addObject:v12];
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v24 = v10;
            __int16 v25 = 1024;
            int v26 = 2;
            __int16 v27 = 2112;
            id v28 = v6;
            _os_log_error_impl(&dword_24DDB2000, v14, OS_LOG_TYPE_ERROR, "Extension record %@ for platform %d missing: %@", buf, 0x1Cu);
          }
        }
        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v16 = [v2 copy];
  v17 = (void *)extensionPointRecords_ret;
  extensionPointRecords_ret = v16;
}

- (void)forceSynchronousProviderUpdate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(FSModuleHost *)v2 extensionPointRecords];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [MEMORY[0x263F01858] enumeratorWithExtensionPointRecord:*(void *)(*((void *)&v13 + 1) + 8 * v7) options:0];
        uint64_t v9 = [v8 allObjects];
        [v3 addObjectsFromArray:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v10 = objc_msgSend(v3, "fs_map:", &__block_literal_global_147);
  moduleUUIDs = v2->_moduleUUIDs;
  v12 = [MEMORY[0x263EFFA08] setWithArray:v10];
  LOBYTE(moduleUUIDs) = [(NSSet *)moduleUUIDs isEqualToSet:v12];

  if ((moduleUUIDs & 1) == 0) {
    [(FSModuleHost *)v2 _updateProviderListForMatchingExtensionRecords:v3];
  }

  objc_sync_exit(v2);
}

uint64_t __55__FSModuleHost_Project__forceSynchronousProviderUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (unsigned)isValidModuleIdentifier:(id)a3 WithError:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/:"];
  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      long long v16 = @"/:";
      _os_log_impl(&dword_24DDB2000, v9, OS_LOG_TYPE_DEFAULT, "Provider identifier '%@' may not contain any of the characters '%@'", buf, 0x16u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "fskit_errorWithPOSIXCode:description:", 22, @"Provider identifier '%@' may not contain any of the characters '%@'", v5, @"/:");
      goto LABEL_12;
    }
LABEL_13:
    unsigned __int8 v10 = 0;
    goto LABEL_15;
  }
  if (([v5 isEqualToString:@"."] & 1) == 0
    && ![v5 isEqualToString:@".."])
  {
    unsigned __int8 v10 = 1;
    goto LABEL_15;
  }
  uint64_t v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
  }

  if (!a4) {
    goto LABEL_13;
  }
LABEL_12:
  unsigned __int8 v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

- (void)_updateProviderListForMatchingExtensionRecords:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__FSModuleHost_Project___updateProviderListForMatchingExtensionRecords___block_invoke;
  v5[3] = &unk_26530B718;
  v5[4] = self;
  uint64_t v4 = objc_msgSend(a3, "fs_map:", v5);
  [(FSModuleHost *)self _updateProviderListForFilteredFSModileInstances:v4];
}

FSModuleInstance *__72__FSModuleHost_Project___updateProviderListForMatchingExtensionRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:v4];
  if ([*(id *)(a1 + 32) isValidModuleIdentifier:v4 WithError:0]) {
    uint64_t v6 = [[FSModuleInstance alloc] initWithExtensionRecord:v3 enabled:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_updateProviderListForFilteredFSModileInstances:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x25332B920]();
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [(NSDictionary *)self->_modulesByIdentifier allValues];
  v71 = (void *)[v8 mutableCopy];

  uint64_t v9 = (void *)[v4 mutableCopy];
  unsigned __int8 v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = objc_msgSend(v9, "fs_map:", &__block_literal_global_169);
  uint64_t v12 = [v10 setWithArray:v11];
  moduleUUIDs = self->_moduleUUIDs;
  self->_moduleUUIDs = v12;

  objc_msgSend(v4, "fs_map:", &__block_literal_global_171);
  v69 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v95 = v69;
    _os_log_impl(&dword_24DDB2000, v14, OS_LOG_TYPE_DEFAULT, "New module list %@", buf, 0xCu);
  }
  v72 = (void *)v7;

  __int16 v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    modulesByIdentifier = self->_modulesByIdentifier;
    *(_DWORD *)buf = 138412290;
    v95 = modulesByIdentifier;
    _os_log_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEFAULT, "Old modules %@", buf, 0xCu);
  }
  v74 = self;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = v9;
  uint64_t v17 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v88 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(NSDictionary **)(*((void *)&v87 + 1) + 8 * i);
        long long v22 = [(NSDictionary *)v21 bundleIdentifier];
        if (v22)
        {
          v23 = [(NSDictionary *)v74->_modulesByIdentifier objectForKeyedSubscript:v22];
          v24 = v23;
          if (v23 && [v23 isEqual:v21])
          {
            [v6 setObject:v24 forKeyedSubscript:v22];
            [v71 removeObject:v24];
          }
          else
          {
            [v6 setObject:v21 forKeyedSubscript:v22];
            [v72 addObject:v22];
          }
        }
        else
        {
          v24 = fskit_std_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v21;
            _os_log_impl(&dword_24DDB2000, v24, OS_LOG_TYPE_DEFAULT, "%@: module has no bundle identifier", buf, 0xCu);
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
    }
    while (v18);
  }

  __int16 v25 = v74;
  [(FSModuleHost *)v74 setExtensionsByIdentifierLocked:v6];
  int v26 = &off_24DDF1000;
  unint64_t v27 = 0x263EFF000uLL;
  if (v74->_moduleOrder)
  {
    id v28 = v72;
    if ([v72 count] || objc_msgSend(v71, "count"))
    {
      v29 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v74->_moduleOrder];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_175;
      v85[3] = &unk_26530B688;
      id v30 = v29;
      id v86 = v30;
      [v71 enumerateObjectsUsingBlock:v85];
      v31 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v72];
      v32 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v74->_moduleOrder];
      [v31 minusSet:v32];

      uint64_t v33 = [v31 count];
      int v34 = v33 != 0;
      if (v33)
      {
        v65 = v5;
        id v67 = v4;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v70 = v31;
        uint64_t v35 = [v70 countByEnumeratingWithState:&v81 objects:v92 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v82;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              v39 = v31;
              if (*(void *)v82 != v37) {
                objc_enumerationMutation(v70);
              }
              uint64_t v40 = *(void *)(*((void *)&v81 + 1) + 8 * j);
              v41 = [v6 objectForKeyedSubscript:v40];
              v42 = [v41 identity];
              int v43 = [v42 isSystem];

              if (v43) {
                [v30 addObject:v40];
              }
              else {
                [v30 insertObject:v40 atIndex:0];
              }
              v31 = v39;
            }
            uint64_t v36 = [v70 countByEnumeratingWithState:&v81 objects:v92 count:16];
          }
          while (v36);
        }

        uint64_t v5 = v65;
        id v4 = v67;
        __int16 v25 = v74;
        id v28 = v72;
        int v34 = 1;
        unint64_t v27 = 0x263EFF000;
      }
      uint64_t v44 = [v30 copy];
      moduleOrder = v25->_moduleOrder;
      v25->_moduleOrder = (NSArray *)v44;

      int v26 = &off_24DDF1000;
    }
    else
    {
      int v34 = 0;
    }
  }
  else
  {
    int v34 = 0;
    id v28 = v72;
  }
  if (v25->_enabledModules && ([v28 count] || objc_msgSend(v71, "count")))
  {
    v46 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v25->_enabledModules];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = *((void *)v26 + 354);
    v79[2] = __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2_177;
    v79[3] = &unk_26530B688;
    id v47 = v46;
    id v80 = v47;
    [v71 enumerateObjectsUsingBlock:v79];
    v48 = (void *)[objc_alloc(*(Class *)(v27 + 2496)) initWithArray:v28];
    v49 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v25->_enabledModules];
    [v48 minusSet:v49];

    uint64_t v50 = [v48 count];
    BOOL v51 = v50 != 0;
    if (v50)
    {
      int v64 = v34;
      v66 = v5;
      id v68 = v4;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v63 = v48;
      id v52 = v48;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v75 objects:v91 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v76 != v55) {
              objc_enumerationMutation(v52);
            }
            uint64_t v57 = *(void *)(*((void *)&v75 + 1) + 8 * k);
            v58 = [v6 objectForKeyedSubscript:v57];
            v59 = [v58 identity];
            int v60 = [v59 isEnabled];

            if (v60) {
              [v47 addObject:v57];
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v75 objects:v91 count:16];
        }
        while (v54);
      }

      uint64_t v5 = v66;
      id v4 = v68;
      __int16 v25 = v74;
      id v28 = v72;
      int v34 = v64;
      BOOL v51 = 1;
      v48 = v63;
    }
    uint64_t v61 = [v47 copy];
    enabledModules = v25->_enabledModules;
    v25->_enabledModules = (NSArray *)v61;
  }
  else
  {
    BOOL v51 = 0;
  }
  if (v25->_modulesUnloaded && [v71 count]) {
    (*((void (**)(void))v25->_modulesUnloaded + 2))();
  }
  if (v25->_modulesLoaded && (([v28 count] == 0) & ~v34) == 0) {
    (*((void (**)(void))v25->_modulesLoaded + 2))();
  }
  if (v34) {
    [(FSModuleHost *)v25 saveProbeOrderList];
  }
  if (v51) {
    [(FSModuleHost *)v25 saveEnabledList];
  }
}

uint64_t __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

id __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identity];
  uint64_t v5 = [v3 UUID];
  id v6 = [v2 stringWithFormat:@"Mod %p ID '%@' UUID %@", v3, v4, v5];

  return v6;
}

void __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 removeObject:v3];
}

void __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2_177(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 removeObject:v3];
}

+ (id)defaultProbeOrderList
{
  return &unk_26FFFA5A8;
}

- (id)loadProbeOrderList
{
  uint64_t v2 = +[FSSettings defaultSettings];
  id v3 = [v2 probeOrderArray];

  id v10 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfURL:v3 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() defaultProbeOrderList];
    if (v5)
    {
      id v6 = [v5 domain];
      if ([v6 isEqualToString:*MEMORY[0x263F07F70]])
      {
        uint64_t v7 = [v5 code];

        if (v7 == 260) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FSModuleHost(Project) loadProbeOrderList]();
      }
    }
    else
    {
      uint64_t v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FSModuleHost(Project) loadProbeOrderList]();
      }
    }
  }
LABEL_12:

  return v4;
}

- (void)saveProbeOrderList
{
  id v3 = +[FSSettings defaultSettings];
  id v4 = [v3 probeOrderArray];

  moduleOrder = self->_moduleOrder;
  id v8 = 0;
  [(NSArray *)moduleOrder writeToURL:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    uint64_t v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FSModuleHost(Project) saveProbeOrderList]();
    }
  }
}

- (id)loadEnabledList
{
  uint64_t v2 = +[FSSettings defaultSettings];
  id v3 = [v2 enabledModulesArray];

  id v10 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfURL:v3 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() defaultProbeOrderList];
    if (v5)
    {
      id v6 = [v5 domain];
      if ([v6 isEqualToString:*MEMORY[0x263F07F70]])
      {
        uint64_t v7 = [v5 code];

        if (v7 == 260) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FSModuleHost(Project) loadEnabledList]();
      }
    }
    else
    {
      id v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FSModuleHost(Project) loadEnabledList]();
      }
    }
  }
LABEL_12:

  return v4;
}

- (void)saveEnabledList
{
  id v3 = +[FSSettings defaultSettings];
  id v4 = [v3 enabledModulesArray];

  enabledModules = self->_enabledModules;
  id v8 = 0;
  [(NSArray *)enabledModules writeToURL:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    uint64_t v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FSModuleHost(Project) saveEnabledList]();
    }
  }
}

- (void)setExtensions:(id)a3
{
  queryLocuint64_t k = self->_queryLock;
  id v5 = a3;
  [(NSCondition *)queryLock lock];
  [(FSModuleHost *)self setExtensionsLocked:v5];

  id v6 = self->_queryLock;
  [(NSCondition *)v6 unlock];
}

- (void)setExtensionsByIdentifierLocked:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  modulesByIdentifier = self->_modulesByIdentifier;
  self->_modulesByIdentifier = v4;

  id v6 = [(NSDictionary *)self->_modulesByIdentifier allValues];
  modules = self->_modules;
  self->_modules = v6;
  MEMORY[0x270F9A758](v6, modules);
}

- (id)configurationForDefaultInstanceOf:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F04DD8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithExtensionIdentity:v4];

  return v5;
}

- (id)configurationForDefaultInstanceOfBundle:(id)a3
{
  id v3 = [(FSModuleHost *)self moduleForBundleID:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F04DC0]);
    id v5 = [v3 record];
    id v6 = (void *)[v4 initWithApplicationExtensionRecord:v5];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F04DD8]) initWithExtensionIdentity:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)configurationForInstance:(id)a3 ofBundle:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(FSModuleHost *)self moduleForBundleID:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F04DC0]);
    uint64_t v9 = [v7 record];
    id v10 = (void *)[v8 initWithApplicationExtensionRecord:v9];

    id v11 = (void *)[objc_alloc(MEMORY[0x263F04DD8]) initWithExtensionIdentity:v10 instanceIdentifier:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)currentExtensions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
  [(NSCondition *)self->_queryLock lock];
  modules = self->_modules;
  id v5 = modules;
  if (!modules)
  {
    do
    {
      BOOL v6 = [(NSCondition *)self->_queryLock waitUntilDate:v3];
      modules = self->_modules;
    }
    while (!modules && v6);
    if (modules) {
      id v5 = self->_modules;
    }
    else {
      id v5 = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  queryLocuint64_t k = self->_queryLock;
  id v8 = modules;
  [(NSCondition *)queryLock unlock];
  uint64_t v9 = v5;

  id v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    long long v13 = v9;
    _os_log_impl(&dword_24DDB2000, v10, OS_LOG_TYPE_DEFAULT, "Returning module array %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (id)moduleForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
  [(NSCondition *)self->_queryLock lock];
  if (!self->_modules)
  {
    do
      BOOL v6 = [(NSCondition *)self->_queryLock waitUntilDate:v5];
    while (!self->_modules && v6);
  }
  modulesByIdentifier = self->_modulesByIdentifier;
  if (modulesByIdentifier)
  {
    id v8 = [(NSDictionary *)modulesByIdentifier objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = 0;
  }
  [(NSCondition *)self->_queryLock unlock];

  return v8;
}

- (NSDictionary)currentExtensionsByIdentifier
{
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
  [(NSCondition *)self->_queryLock lock];
  if (!self->_modules)
  {
    do
      BOOL v4 = [(NSCondition *)self->_queryLock waitUntilDate:v3];
    while (!self->_modules && v4);
  }
  id v5 = self->_modulesByIdentifier;
  [(NSCondition *)self->_queryLock unlock];
  if (v5)
  {
    BOOL v6 = (void *)[(NSDictionary *)v5 copy];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v6;
}

- (void)addBundleToEnableModules:(id)a3
{
  id v4 = a3;
  enabledModules = self->_enabledModules;
  id v12 = v4;
  BOOL v6 = [v4 bundleIdentifier];
  LOBYTE(enabledModules) = [(NSArray *)enabledModules containsObject:v6];

  if ((enabledModules & 1) == 0)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_enabledModules];
    id v8 = [v12 bundleIdentifier];
    [v7 addObject:v8];

    uint64_t v9 = (NSArray *)[v7 copy];
    id v10 = self->_enabledModules;
    self->_enabledModules = v9;

    id v11 = [v12 identity];
    [v11 setEnabled:1];

    [(FSModuleHost *)self saveEnabledList];
  }
}

- (void)removeBundleFromEnabledModules:(id)a3
{
  id v4 = a3;
  enabledModules = self->_enabledModules;
  id v12 = v4;
  BOOL v6 = [v4 bundleIdentifier];
  LODWORD(enabledModules) = [(NSArray *)enabledModules containsObject:v6];

  if (enabledModules)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_enabledModules];
    id v8 = [v12 bundleIdentifier];
    [v7 removeObject:v8];

    uint64_t v9 = (NSArray *)[v7 copy];
    id v10 = self->_enabledModules;
    self->_enabledModules = v9;

    id v11 = [v12 identity];
    [v11 setEnabled:0];

    [(FSModuleHost *)self saveEnabledList];
  }
}

void __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24DDB2000, v0, v1, "FSModule missing information", v2, v3, v4, v5, v6);
}

@end