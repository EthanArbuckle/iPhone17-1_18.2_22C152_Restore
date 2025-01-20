@interface BBDataProviderManager
- (BBDataProviderManager)initWithDelegate:(id)a3 queue:(id)a4;
- (NSString)debugDescription;
- (id)_configureDataProvider:(id)a3 performMigration:(BOOL)a4;
- (id)_configureSectionInfo:(id)a3 forDataProvider:(id)a4;
- (id)_queue_dataProvidersForUniversalSectionID:(id)a3;
- (id)_queue_getSectionInfoForSectionID:(id)a3;
- (id)dataProviderForSectionID:(id)a3;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (id)localSectionIdentifiersFromDismissalSectionIdentifer:(id)a3;
- (id)parentSectionDataProviderFactoryForSectionID:(id)a3;
- (id)rebuildSectionInfo:(id)a3 forSectionID:(id)a4;
- (id)universalSectionIDForSectionID:(id)a3;
- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6;
- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4;
- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4;
- (void)dealloc;
- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3;
- (void)noteSettingsChanged:(id)a3 forSectionID:(id)a4;
- (void)performBlockOnDataProviders:(id)a3;
- (void)reloadIdentityForSectionID:(id)a3 withCompletion:(id)a4;
@end

@implementation BBDataProviderManager

- (BBDataProviderManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(BBDataProviderManager *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderManager.loadDataProviderQueue", v11);
    loadDataProviderQueue = v10->_loadDataProviderQueue;
    v10->_loadDataProviderQueue = (OS_dispatch_queue *)v12;

    v10->_loadQueueSuspended = 1;
    dispatch_suspend((dispatch_object_t)v10->_loadDataProviderQueue);
    uint64_t v14 = +[BBRemoteDataProviderConnectionResolver resolverWithDelegate:v10];
    remoteDataProviderResolver = v10->_remoteDataProviderResolver;
    v10->_remoteDataProviderResolver = (BBRemoteDataProviderConnectionResolver *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parentFactoriesBySectionID = v10->_parentFactoriesBySectionID;
    v10->_parentFactoriesBySectionID = v16;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_loadQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_loadDataProviderQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderManager;
  [(BBDataProviderManager *)&v3 dealloc];
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
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

  dispatch_suspend((dispatch_object_t)self->_queue);
  if (self->_loadQueueSuspended) {
    [v10 appendFormat:@" [SUSPENDED]"];
  }
  if ([(NSMutableDictionary *)self->_parentFactoriesBySectionID count])
  {
    [v10 appendFormat:@"    %@Parent Sections", v5];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_parentFactoriesBySectionID;
    uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 appendFormat:@"        %@%@", v5, *(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v13 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  unint64_t v16 = a3 + 1;
  v17 = [(BBLocalDataProviderStore *)self->_localDataProviderStore debugDescriptionWithChildren:v16];
  [v10 appendFormat:@"\n%@", v17];

  v18 = [(BBRemoteDataProviderConnectionResolver *)self->_remoteDataProviderResolver debugDescriptionWithChildren:v16];
  [v10 appendFormat:@"\n%@", v18];

  dispatch_resume((dispatch_object_t)self->_queue);
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)[(BBDataProviderManager *)self debugDescriptionWithChildren:0];
}

- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3
{
  BOOL v3 = a3;
  self->_loadQueueSuspended = 0;
  dispatch_resume((dispatch_object_t)self->_loadDataProviderQueue);
  localDataProviderStore = self->_localDataProviderStore;
  [(BBLocalDataProviderStore *)localDataProviderStore loadAllDataProvidersAndPerformMigration:v3];
}

- (void)noteSettingsChanged:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProviderManager *)self dataProviderForSectionID:v7];
  v9 = v8;
  if (v8)
  {
    [v8 noteSectionInfoDidChange:v6];
  }
  else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
  {
    -[BBDataProviderManager noteSettingsChanged:forSectionID:]();
  }
}

- (id)rebuildSectionInfo:(id)a3 forSectionID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProviderManager *)self dataProviderForSectionID:v7];
  if (!v8)
  {
    v9 = [(BBDataProviderManager *)self _queue_getSectionInfoForSectionID:v7];
    v10 = v9;
    if (v9)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v11 = objc_msgSend(v9, "dataProviderIDs", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = [(BBDataProviderManager *)self rebuildSectionInfo:v6 forSectionID:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
    else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
    {
      -[BBDataProviderManager rebuildSectionInfo:forSectionID:]();
    }
  }
  v17 = [(BBDataProviderManager *)self _configureSectionInfo:v6 forDataProvider:v8];

  return v17;
}

- (void)reloadIdentityForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBDataProviderManager *)self dataProviderForSectionID:v6];
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke;
    v9[3] = &unk_2642972A0;
    v9[4] = self;
    id v11 = v7;
    id v10 = v8;
    [v10 reloadIdentityWithCompletion:v9];
  }
  else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
  {
    -[BBDataProviderManager reloadIdentityForSectionID:withCompletion:]();
  }
}

void __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke_2;
  v3[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)localSectionIdentifiersFromDismissalSectionIdentifer:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = [(BBDataProviderManager *)self _queue_dataProvidersForUniversalSectionID:v4];
  if ([v6 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sectionIdentifier", (void)v14);
          [v5 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else if ([v4 length])
  {
    [v5 addObject:v4];
  }

  return v5;
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BBDataProviderManager.m", 163, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  localDataProviderStore = self->_localDataProviderStore;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke;
  v13[3] = &unk_264297BB8;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  [(BBLocalDataProviderStore *)localDataProviderStore performBlockOnDataProviders:v13];
  remoteDataProviderResolver = self->_remoteDataProviderResolver;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_3;
  v11[3] = &unk_264297BB8;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  [(BBRemoteDataProviderConnectionResolver *)remoteDataProviderResolver performBlockOnDataProviders:v11];
}

void __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_4;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)dataProviderForSectionID:(id)a3
{
  id v4 = a3;
  id v5 = [(BBLocalDataProviderStore *)self->_localDataProviderStore dataProviderForSectionID:v4];
  if (!v5)
  {
    id v5 = [(BBRemoteDataProviderConnectionResolver *)self->_remoteDataProviderResolver dataProviderForSectionID:v4];
  }

  return v5;
}

- (id)parentSectionDataProviderFactoryForSectionID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parentFactoriesBySectionID objectForKey:a3];
}

- (id)universalSectionIDForSectionID:(id)a3
{
  id v4 = a3;
  id v5 = [(BBDataProviderManager *)self dataProviderForSectionID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 universalSectionIdentifier];
  }
  else
  {
    id v8 = [(BBDataProviderManager *)self parentSectionDataProviderFactoryForSectionID:v4];
    id v7 = [v8 universalSectionIdentifier];
  }
  return v7;
}

- (id)_queue_dataProvidersForUniversalSectionID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(BBLocalDataProviderStore *)self->_localDataProviderStore dataProvidersForUniversalSectionID:v5];
  id v8 = [(BBRemoteDataProviderConnectionResolver *)self->_remoteDataProviderResolver dataProvidersForUniversalSectionID:v5];

  [v6 unionSet:v7];
  [v6 unionSet:v8];

  return v6;
}

- (id)_queue_getSectionInfoForSectionID:(id)a3
{
  return (id)[(BBDataProviderManagerDelegate *)self->_delegate dpManager:self sectionInfoForSectionID:a3];
}

- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__BBDataProviderManager_dataProviderStore_didAddParentSectionFactory___block_invoke;
  v8[3] = &unk_264295E50;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __70__BBDataProviderManager_dataProviderStore_didAddParentSectionFactory___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sectionIdentifier];
  if (v2)
  {
    uint64_t v6 = v2;
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
    id v3 = objc_msgSend(*(id *)(a1 + 40), "_queue_getSectionInfoForSectionID:", v6);
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) sectionInfo];
      [v3 updateWithDefaultSectionInfo:v4];

      [*(id *)(a1 + 32) setSectionInfo:v3];
    }
    [*(id *)(*(void *)(a1 + 40) + 8) dpManager:*(void *)(a1 + 40) addParentSectionFactory:*(void *)(a1 + 32)];
  }
  return MEMORY[0x270F9A758]();
}

- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  loadDataProviderQueue = self->_loadDataProviderQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke;
  v14[3] = &unk_264297BE0;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(loadDataProviderQueue, v14);
}

void __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke_2;
  v4[3] = &unk_264297BE0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)id v9 = 138543618;
    *(void *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v5;
    id v6 = v4;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ adding data provider %{public}@ to BBServer", v9, 0x16u);
  }
  char v7 = objc_msgSend(*(id *)(a1 + 32), "_configureDataProvider:performMigration:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_OWORD *)v9, *(void *)&v9[16], v10);
  [*(id *)(a1 + 40) startWatchdog];
  [*(id *)(*(void *)(a1 + 32) + 8) dpManager:*(void *)(a1 + 32) addDataProvider:*(void *)(a1 + 40) withSectionInfo:v7];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__BBDataProviderManager_dataProviderStore_didRemoveDataProvider___block_invoke;
  v8[3] = &unk_264295E50;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __65__BBDataProviderManager_dataProviderStore_didRemoveDataProvider___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)v18 = 138543618;
    *(void *)&v18[4] = v4;
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v5;
    id v6 = v4;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing data provider %{public}@ from BBServer", v18, 0x16u);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier", *(_OWORD *)v18, *(void *)&v18[16], v19);
  id v9 = objc_msgSend(v7, "_queue_getSectionInfoForSectionID:", v8);

  uint64_t v10 = [v9 factorySectionID];

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v9 factorySectionID];
    id v13 = objc_msgSend(v11, "_queue_getSectionInfoForSectionID:", v12);

    if (v13) {
      [v13 _dissociateDataProviderSectionInfo:v9];
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v16 = *(void **)(v15 + 8);
  BOOL v17 = [v14 sectionIdentifier];
  [v16 dpManager:v15 removeDataProviderSectionID:v17];
}

- (id)_configureDataProvider:(id)a3 performMigration:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 sectionIdentifier];
  if (!a4)
  {
    uint64_t v10 = [(BBDataProviderManager *)self _queue_getSectionInfoForSectionID:v7];
    goto LABEL_5;
  }
  int v8 = [v6 canPerformMigration];
  id v9 = [(BBDataProviderManager *)self _queue_getSectionInfoForSectionID:v7];
  uint64_t v10 = v9;
  if (!v8)
  {
LABEL_5:
    int v12 = 0;
    id v11 = 0;
    goto LABEL_6;
  }
  id v11 = (void *)[v9 copy];
  int v12 = 1;
LABEL_6:
  id v13 = [(BBDataProviderManager *)self _configureSectionInfo:v10 forDataProvider:v6];
  id v14 = v13;
  if (v12 && v11)
  {
    uint64_t v15 = (void *)[v13 copy];
    if ([v6 migrateSectionInfo:v15 oldSectionInfo:v11])
    {
      id v16 = BBLogMigration;
      if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138544130;
        long long v20 = v7;
        __int16 v21 = 2114;
        long long v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Data provider <%{public}@> performed settings migration.\n\tPrevious build settings:   %{public}@\n\tPre-migration settings:    %{public}@\n\tMigrated (final) settings: %{public}@", (uint8_t *)&v19, 0x2Au);
      }

      goto LABEL_16;
    }
  }
  BOOL v17 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    long long v20 = v7;
    __int16 v21 = 2114;
    long long v22 = v14;
    _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Section settings for data provider %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v15 = v14;
LABEL_16:

  return v15;
}

- (id)_configureSectionInfo:(id)a3 forDataProvider:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v55 = [v6 sectionIdentifier];
  v57 = v6;
  uint64_t v7 = +[BBSectionInfo defaultSectionInfoForSection:v6];
  int v8 = (void *)v7;
  if (v5 || !v7) {
    [v5 updateWithDefaultSectionInfo:v7];
  }
  if ([v8 suppressFromSettings])
  {

    id v5 = 0;
  }
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = [v57 defaultSubsectionInfos];
  if ([v11 count])
  {
  }
  else
  {
    int v12 = [v10 subsections];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      v56 = 0;
      goto LABEL_57;
    }
  }
  v54 = v8;
  v56 = [MEMORY[0x263EFF980] array];
  id v14 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = [MEMORY[0x263EFF9C0] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v16 = [v57 defaultSubsectionInfos];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        long long v22 = [v21 subsectionID];
        if (v22 && ([v15 containsObject:v22] & 1) == 0)
        {
          [v14 addObject:v21];
          [v15 addObject:v22];
        }
        else
        {
          __int16 v23 = BBLogDataProvider;
          if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v73 = v22;
            __int16 v74 = 2112;
            v75 = v55;
            _os_log_error_impl(&dword_217675000, v23, OS_LOG_TYPE_ERROR, "BBServer: Ignoring empty or duplicate subsectionID (%@) from data provider %@.", buf, 0x16u);
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v18);
  }

  uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  __int16 v25 = [v10 subsections];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        v31 = [v30 subsectionID];
        [v24 setObject:v30 forKey:v31];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v27);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v32 = v14;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v59 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v58 + 1) + 8 * k);
        v38 = [v37 subsectionID];
        if (!v38)
        {
          uint64_t v42 = BBLogDataProvider;
          if (!os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          *(_DWORD *)buf = 138412290;
          v73 = v55;
          v43 = v42;
          v44 = "BBServer: Ignoring subsection with no subsectionID, from data provider %@.";
          uint32_t v45 = 12;
LABEL_48:
          _os_log_error_impl(&dword_217675000, v43, OS_LOG_TYPE_ERROR, v44, buf, v45);
          goto LABEL_51;
        }
        if ([v37 sectionType] != 2)
        {
          uint64_t v46 = BBLogDataProvider;
          if (!os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          *(_DWORD *)buf = 138412546;
          v73 = v38;
          __int16 v74 = 2112;
          v75 = v55;
          v43 = v46;
          v44 = "BBServer: Ignoring subsection (%@) not flagged as BBSectionTypeSubsection from data provider %@.";
          uint32_t v45 = 22;
          goto LABEL_48;
        }
        v39 = [v24 objectForKey:v38];
        if (v37) {
          BOOL v40 = v39 == 0;
        }
        else {
          BOOL v40 = 0;
        }
        if (v40)
        {
          [v37 setSectionID:v55];
          [v10 _addSubsection:v37];
          id v41 = v37;
          [v24 removeObjectForKey:v38];
LABEL_50:
          [v56 addObject:v41];
          v47 = [v57 displayNameForSubsectionID:v38];
          [v41 setDisplayName:v47];

          goto LABEL_51;
        }
        id v41 = v39;
        [v39 updateWithDefaultSectionInfo:v37];
        [v24 removeObjectForKey:v38];
        if (v41) {
          goto LABEL_50;
        }
LABEL_51:
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v34);
  }

  if ([v24 count])
  {
    v48 = (void *)BBLogDataProvider;
    if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      v50 = [v24 allKeys];
      *(_DWORD *)buf = 138543618;
      v73 = v55;
      __int16 v74 = 2114;
      v75 = v50;
      _os_log_impl(&dword_217675000, v49, OS_LOG_TYPE_DEFAULT, "Abandoned subsections for data provider <%{public}@>, removing them: %{public}@", buf, 0x16u);
    }
  }

  int v8 = v54;
LABEL_57:
  if ([v56 count]) {
    v51 = v56;
  }
  else {
    v51 = 0;
  }
  [v10 setSubsections:v51];
  id v52 = v10;

  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFactoriesBySectionID, 0);
  objc_storeStrong((id *)&self->_loadDataProviderQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteDataProviderResolver, 0);
  objc_storeStrong((id *)&self->_localDataProviderStore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)noteSettingsChanged:forSectionID:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_217675000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
}

- (void)rebuildSectionInfo:forSectionID:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_217675000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
}

- (void)reloadIdentityForSectionID:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_217675000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
}

@end