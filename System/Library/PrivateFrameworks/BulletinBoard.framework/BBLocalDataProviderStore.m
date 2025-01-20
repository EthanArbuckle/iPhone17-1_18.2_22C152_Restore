@interface BBLocalDataProviderStore
+ (id)localDataProviderStoreWithDelegate:(id)a3 dataProviderQueue:(id)a4;
- (BBLocalDataProviderStore)initWithDelegate:(id)a3 dataProviderQueue:(id)a4;
- (NSMutableArray)localFactories;
- (NSMutableDictionary)dataProvidersBySectionID;
- (NSMutableDictionary)dataProvidersByUniversalSectionID;
- (NSString)debugDescription;
- (id)dataProviderForSectionID:(id)a3;
- (id)dataProvidersForUniversalSectionID:(id)a3;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (void)_addDataProviderClass:(Class)a3 performMigration:(BOOL)a4;
- (void)_addLocalDataProviderFactoryOfClass:(Class)a3;
- (void)_loadDataProviderPluginBundle:(id)a3 performMigration:(BOOL)a4;
- (void)_queue_addDataProvider:(id)a3 performMigration:(BOOL)a4;
- (void)_queue_removeDataProvider:(id)a3;
- (void)addDataProvider:(id)a3 performMigration:(BOOL)a4;
- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5;
- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6;
- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3;
- (void)performBlockOnDataProviders:(id)a3;
- (void)removeDataProvider:(id)a3;
- (void)removeDataProviderWithSectionID:(id)a3;
- (void)setDataProvidersBySectionID:(id)a3;
- (void)setDataProvidersByUniversalSectionID:(id)a3;
- (void)setLocalFactories:(id)a3;
@end

@implementation BBLocalDataProviderStore

+ (id)localDataProviderStoreWithDelegate:(id)a3 dataProviderQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BBLocalDataProviderStore alloc] initWithDelegate:v6 dataProviderQueue:v5];

  return v7;
}

- (BBLocalDataProviderStore)initWithDelegate:(id)a3 dataProviderQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BBLocalDataProviderStore;
  v9 = [(BBLocalDataProviderStore *)&v20 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderStore", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_serverQueue, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProvidersBySectionID = v9->_dataProvidersBySectionID;
    v9->_dataProvidersBySectionID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProvidersByUniversalSectionID = v9->_dataProvidersByUniversalSectionID;
    v9->_dataProvidersByUniversalSectionID = v15;

    objc_storeStrong((id *)&v9->_delegate, a3);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    localFactories = v9->_localFactories;
    v9->_localFactories = v17;
  }
  return v9;
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  id v5 = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"    "];
      --v6;
    }
    while (v6);
  }
  id v7 = (void *)MEMORY[0x263F089D8];
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"%@<%@: %p>", v5, v9, self];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BBLocalDataProviderStore_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_2642962B0;
  block[4] = self;
  id v12 = v10;
  id v17 = v12;
  unint64_t v18 = a3;
  dispatch_sync(queue, block);
  v13 = v17;
  id v14 = v12;

  return v14;
}

void __57__BBLocalDataProviderStore_debugDescriptionWithChildren___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        id v8 = (void *)a1[5];
        v9 = [v7 debugDescriptionWithChildren:a1[6] + 1];
        [v8 appendFormat:@"\n%@", v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(BBLocalDataProviderStore *)self debugDescriptionWithChildren:0];
}

- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3
{
  BOOL v23 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BBLibraryDirectoriesForFolderNamed(@"BulletinBoardPlugins");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        uint64_t v4 = *(void **)(*((void *)&v28 + 1) + 8 * v3);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v6 = [v5 contentsOfDirectoryAtPath:v4 error:0];

        uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v25;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
              long long v12 = (void *)MEMORY[0x21D44A020]();
              long long v13 = [v11 pathExtension];
              uint64_t v14 = [v13 caseInsensitiveCompare:@"bundle"];

              if (!v14)
              {
                uint64_t v15 = (void *)MEMORY[0x263F086E0];
                v16 = [v4 stringByAppendingPathComponent:v11];
                id v17 = [v15 bundleWithPath:v16];

                if (v17 && BBHasRequiredCapabilitiesForBundle(v17)) {
                  [(BBLocalDataProviderStore *)self _loadDataProviderPluginBundle:v17 performMigration:v23];
                }
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v8);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)_loadDataProviderPluginBundle:(id)a3 performMigration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = 0;
  int v6 = [v5 loadAndReturnError:&v26];
  id v7 = v26;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v5 objectForInfoDictionaryKey:@"BBDataProviderClasses"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v9 count])
        {
          uint64_t v20 = v9;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(NSString **)(*((void *)&v22 + 1) + 8 * i);
                Class v16 = NSClassFromString(v15);
                if (v16
                  && (Class v17 = v16,
                      [(objc_class *)v16 conformsToProtocol:&unk_26C7C3038]))
                {
                  [(BBLocalDataProviderStore *)self _addDataProviderClass:v17 performMigration:v4];
                }
                else
                {
                  NSLog(&cfstr_NoConformingCl.isa, v15, v5);
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
            }
            while (v12);
          }

          uint64_t v9 = v20;
          goto LABEL_24;
        }
      }
    }
    unint64_t v18 = (void *)[v5 principalClass];
    if (v18)
    {
      uint64_t v19 = v18;
      if ([v18 conformsToProtocol:&unk_26C7C3038])
      {
        [(BBLocalDataProviderStore *)self _addDataProviderClass:v19 performMigration:v4];
LABEL_24:

        goto LABEL_25;
      }
      if ([v19 conformsToProtocol:&unk_26C7C3098])
      {
        [(BBLocalDataProviderStore *)self _addLocalDataProviderFactoryOfClass:v19];
        goto LABEL_24;
      }
    }
    NSLog(&cfstr_NoConformingPr.isa, v5);
    goto LABEL_24;
  }
  NSLog(&cfstr_UnableToLoadPl.isa, v5, v7);
LABEL_25:
}

- (void)_queue_addDataProvider:(id)a3 performMigration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 sectionIdentifier];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_dataProvidersBySectionID objectForKey:v7];
    if ([v6 isEqual:v8])
    {
      uint64_t v9 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        Class v17 = self;
        __int16 v18 = 2114;
        uint64_t v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_error_impl(&dword_217675000, v9, OS_LOG_TYPE_ERROR, "%{public}@ was asked to add a second data provider for section %{public}@. Please file a SpringBoard bug.\n\tOld: %@\n\tNew: %@", buf, 0x2Au);
      }
    }
    [(NSMutableDictionary *)self->_dataProvidersBySectionID setObject:v6 forKeyedSubscript:v7];
    id v10 = [v6 universalSectionIdentifier];
    if (v10)
    {
      id v11 = [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID objectForKey:v10];
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      [v11 addObject:v6];
      [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID setObject:v11 forKey:v10];
    }
    NSLog(&cfstr_AddingLocal.isa, v7, v6);
    delegate = self->_delegate;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__BBLocalDataProviderStore__queue_addDataProvider_performMigration___block_invoke;
    v14[3] = &unk_264295E28;
    id v15 = v6;
    [(BBDataProviderStoreDelegate *)delegate dataProviderStore:self didAddDataProvider:v15 performMigration:v4 completion:v14];
  }
  else
  {
    uint64_t v13 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBLocalDataProviderStore _queue_addDataProvider:performMigration:](v13);
    }
  }
}

uint64_t __68__BBLocalDataProviderStore__queue_addDataProvider_performMigration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataProviderDidLoad];
}

- (void)_addDataProviderClass:(Class)a3 performMigration:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BBLocalDataProviderStore__addDataProviderClass_performMigration___block_invoke;
  block[3] = &unk_2642970B8;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

void __67__BBLocalDataProviderStore__addDataProviderClass_performMigration___block_invoke(uint64_t a1)
{
  id v2 = +[BBLocalDataProvider dataProviderWithPrincipalClass:*(void *)(a1 + 40) serverQueue:*(void *)(*(void *)(a1 + 32) + 16) initializationCompletion:0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_addDataProvider:performMigration:", v2, *(unsigned __int8 *)(a1 + 48));
}

- (id)dataProviderForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9;
  Class v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__BBLocalDataProviderStore_dataProviderForSectionID___block_invoke;
  block[3] = &unk_264296198;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__BBLocalDataProviderStore_dataProviderForSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (id)dataProvidersForUniversalSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9;
  Class v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBLocalDataProviderStore_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_264296198;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __63__BBLocalDataProviderStore_dataProvidersForUniversalSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)_queue_removeDataProvider:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  if (v5)
  {
    [(NSMutableDictionary *)self->_dataProvidersBySectionID removeObjectForKey:v5];
    id v6 = [v4 universalSectionIdentifier];
    if (v6)
    {
      id v7 = [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID objectForKey:v6];
      [v7 removeObject:v4];
      if (![v7 count]) {
        [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID removeObjectForKey:v6];
      }
    }
    [(BBDataProviderStoreDelegate *)self->_delegate dataProviderStore:self didRemoveDataProvider:v4];
  }
  else
  {
    uint64_t v8 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBLocalDataProviderStore _queue_removeDataProvider:](v8);
    }
  }
}

- (void)removeDataProvider:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__BBLocalDataProviderStore_removeDataProvider___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __47__BBLocalDataProviderStore_removeDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", *(void *)(a1 + 40));
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BBDataProviderStore.m", 193, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BBLocalDataProviderStore_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_2642964F8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __56__BBLocalDataProviderStore_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v2;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_addLocalDataProviderFactoryOfClass:(Class)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__BBLocalDataProviderStore__addLocalDataProviderFactoryOfClass___block_invoke;
  v4[3] = &unk_2642970E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __64__BBLocalDataProviderStore__addLocalDataProviderFactoryOfClass___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  [v2 setFactoryStore:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
}

- (void)addDataProvider:(id)a3 performMigration:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BBLocalDataProviderStore_addDataProvider_performMigration___block_invoke;
  block[3] = &unk_2642962D8;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __61__BBLocalDataProviderStore_addDataProvider_performMigration___block_invoke(uint64_t a1)
{
  id v2 = +[BBLocalDataProvider dataProviderWithDataProvider:*(void *)(a1 + 32) serverQueue:*(void *)(*(void *)(a1 + 40) + 16)];
  objc_msgSend(*(id *)(a1 + 40), "_queue_addDataProvider:performMigration:", v2, *(unsigned __int8 *)(a1 + 48));
}

- (void)removeDataProviderWithSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BBLocalDataProviderStore_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__BBLocalDataProviderStore_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", v2);
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5
{
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = (void *)[a3 copy];
  [v13 setDisplayName:v12];

  [v13 setIcon:v11];
  long long v14 = +[BBParentSectionDataProviderFactory factoryFromSectionInfo:v13];
  [v14 setUniversalSectionIdentifier:v10];

  long long v15 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = v15;
    long long v17 = (objc_class *)objc_opt_class();
    long long v18 = NSStringFromClass(v17);
    long long v19 = [v14 sectionIdentifier];
    int v20 = 138543618;
    long long v21 = v18;
    __int16 v22 = 2114;
    id v23 = v19;
    _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ adding parent section factory for section %{public}@", (uint8_t *)&v20, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(BBDataProviderStoreDelegate *)self->_delegate dataProviderStore:self didAddParentSectionFactory:v14];
  }
}

- (NSMutableDictionary)dataProvidersBySectionID
{
  return self->_dataProvidersBySectionID;
}

- (void)setDataProvidersBySectionID:(id)a3
{
}

- (NSMutableDictionary)dataProvidersByUniversalSectionID
{
  return self->_dataProvidersByUniversalSectionID;
}

- (void)setDataProvidersByUniversalSectionID:(id)a3
{
}

- (NSMutableArray)localFactories
{
  return self->_localFactories;
}

- (void)setLocalFactories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFactories, 0);
  objc_storeStrong((id *)&self->_dataProvidersByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_queue_addDataProvider:(void *)a1 performMigration:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_0(&dword_217675000, v4, v5, "%{public}@: Data provider %{public}@ specified no sectionID. Ignoring.", v6, v7, v8, v9, v10);
}

- (void)_queue_removeDataProvider:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_0(&dword_217675000, v4, v5, "%{public}@ Asked to remove a data provider (%{public}@) without a sectionID. Ignoring.", v6, v7, v8, v9, v10);
}

@end