@interface FPTrashUnionCollection
- (FPQueryCollection)trashQueryCollection;
- (FPTrashUnionCollection)initWithQueryCollection:(id)a3;
- (id)filterDomains:(id)a3;
- (id)scopedSearchQuery;
- (void)fetchTrashItemsFromProvider:(id)a3 completionHandler:(id)a4;
- (void)updateCollectionsForDomains:(id)a3;
@end

@implementation FPTrashUnionCollection

uint64_t __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCollections:*(void *)(a1 + 40)];
}

uint64_t __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCollectionsForDomains:*(void *)(a1 + 40)];
}

- (FPTrashUnionCollection)initWithQueryCollection:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v16.receiver = self;
  v16.super_class = (Class)FPTrashUnionCollection;
  v7 = [(FPUnionCollection *)&v16 initWithCollections:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_trashQueryCollection, a3);
    uint64_t v8 = [(FPItemCollection *)v7->_trashQueryCollection updateQueue];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    id location = 0;
    objc_initWeak(&location, v7);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke;
    v13[3] = &unk_1E5AF5070;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v13];
    id providerDomainChangesToken = v7->_providerDomainChangesToken;
    v7->_id providerDomainChangesToken = (id)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 allValues];
    v6 = [WeakRetained filterDomains:v5];

    v7 = WeakRetained[32];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke_2;
    v9[3] = &unk_1E5AF0748;
    uint64_t v10 = WeakRetained;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

- (id)filterDomains:(id)a3
{
  return (id)objc_msgSend(a3, "fp_filter:", &__block_literal_global_43);
}

BOOL __40__FPTrashUnionCollection_filterDomains___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 spotlightMountPoint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateCollectionsForDomains:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPTrashUnionCollection updateCollectionsForDomains:]((uint64_t)v4, v5);
  }

  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  [v6 addObject:self->_trashQueryCollection];
  v7 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke;
        v18[3] = &unk_1E5AF5108;
        v18[4] = v12;
        id v19 = v6;
        v20 = v7;
        [(FPTrashUnionCollection *)self fetchTrashItemsFromProvider:v12 completionHandler:v18];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_8;
  block[3] = &unk_1E5AF0748;
  block[4] = self;
  id v17 = v6;
  id v14 = v6;
  dispatch_group_notify(v7, queue, block);
}

- (FPQueryCollection)trashQueryCollection
{
  return self->_trashQueryCollection;
}

- (void)fetchTrashItemsFromProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[FPItemManager defaultManager];
  uint64_t v8 = [v6 identifier];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF50E0;
  id v11 = v5;
  id v9 = v5;
  [v7 fetchOperationServiceForProviderDomainID:v8 handler:v10];
}

void __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    id v4 = [a2 remoteObjectProxy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5AF50B8;
    id v7 = *(id *)(a1 + 32);
    [v4 fetchTrashIdentifiersWithCompletionHandler:v6];
  }
}

uint64_t __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v15 = a3;
  if (v15)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_2();
    }
  }
  else
  {
    id v5 = *(id *)(a1 + 40);
    objc_sync_enter(v5);
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_1();
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v16;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 40);
          v13 = +[FPItemManager defaultManager];
          id v14 = (void *)[v13 newCollectionWithItemID:v11];
          [v12 addObject:v14];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)scopedSearchQuery
{
  v2 = [[NSFileProviderSearchQuery alloc] initWithSearchScope:0];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trashQueryCollection, 0);

  objc_storeStrong(&self->_providerDomainChangesToken, 0);
}

- (void)updateCollectionsForDomains:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] updating trash collection with domains %@", (uint8_t *)&v2, 0xCu);
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] received trash items %@ for domain %@");
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] Received error %@ looking for trash items on domain %@");
}

@end