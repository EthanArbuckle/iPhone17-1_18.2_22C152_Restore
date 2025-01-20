@interface FPSpotlightCollector
+ (id)_recursiveDescription;
+ (id)processingQueue;
- (BOOL)_areItemsTransientFromBundleIdentifier:(id)a3;
- (BOOL)_shouldFilterUpdatesForObserver:(id)a3;
- (BOOL)_shouldRemoveItemsFromObserver:(id)a3;
- (BOOL)isGathering;
- (BOOL)isQueryCancelled:(id)a3;
- (BOOL)isSuspended;
- (FPSpotlightCollector)init;
- (FPSpotlightCollector)initWithDescriptor:(id)a3;
- (FPSpotlightCollectorDelegate)delegate;
- (FPSpotlightQueryDescriptor)queryDescriptor;
- (NSMutableArray)queries;
- (NSMutableSet)observers;
- (OS_dispatch_queue)processingQueue;
- (id)_allItemsForMountPoint:(id)a3;
- (id)_createQueriesForMountPoints:(id)a3;
- (id)_createQueryForMountPoint:(id)a3;
- (id)_mountPointForExistingSearchQuery:(id)a3;
- (id)_mountPointsForDescriptor;
- (id)allItems;
- (id)allItemsForObserver:(id)a3;
- (id)allObservers;
- (id)description;
- (id)filterItems:(id)a3 forObserver:(id)a4 excludedItemIDs:(id *)a5;
- (unint64_t)_itemsOriginForItems:(id)a3;
- (unint64_t)itemsOrigin;
- (void)_addObserver:(id)a3;
- (void)_clear;
- (void)_regather;
- (void)_removeItemsForQuery:(id)a3 mountPoint:(id)a4;
- (void)_removeObserver:(id)a3;
- (void)_start;
- (void)_stop;
- (void)addObserver:(id)a3;
- (void)mountPointsDidChange:(id)a3;
- (void)query:(id)a3 didFinishWithError:(id)a4;
- (void)query:(id)a3 didRemoveItemsWithCSIdentifiers:(id)a4 inBundle:(id)a5;
- (void)query:(id)a3 didUpdateItems:(id)a4;
- (void)queryDidFinishGathering:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setGathering:(BOOL)a3;
- (void)setItemsOrigin:(unint64_t)a3;
- (void)setNeedsItemsOriginUpdate;
- (void)setObservers:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setQueries:(id)a3;
- (void)suspend;
@end

@implementation FPSpotlightCollector

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightCollector _removeObserver:]();
  }

  [(NSMutableSet *)self->_observers removeObject:v4];
  if (![(NSMutableSet *)self->_observers count])
  {
    v6 = [(FPSpotlightCollector *)self queryDescriptor];
    char v7 = [v6 keepCollectorsAlive];

    if ((v7 & 1) == 0)
    {
      [(FPSpotlightCollector *)self _stop];
      v8 = [(FPSpotlightCollector *)self delegate];
      [v8 collectorDidFinish:self];
    }
  }
}

uint64_t __39__FPSpotlightCollector_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

void __45__FPSpotlightCollector__itemsOriginForItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 providerIDForDeduplication];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  id v10 = v6;
  if (v9)
  {
    if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v8, v6);
  }
}

- (void)query:(id)a3 didUpdateItems:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (![(FPSpotlightCollector *)self isQueryCancelled:v6])
  {
    v8 = fp_current_or_default_log();
    v69 = self;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v54 = [(FPSpotlightCollector *)self description];
      uint64_t v55 = [v7 count];
      if (self->_gathering) {
        v56 = "initially gathered";
      }
      else {
        v56 = "updated";
      }
      id v57 = v7;
      unint64_t v58 = [v57 count];
      v59 = NSString;
      if (v58 > 0xA)
      {
        uint64_t v61 = objc_msgSend(v57, "subarrayWithRange:", 0, 10);

        v60 = [v59 stringWithFormat:@"%@...", v61];
        id v57 = (id)v61;
        self = v69;
      }
      else
      {
        v60 = [NSString stringWithFormat:@"%@", v57];
      }

      *(_DWORD *)buf = 138413314;
      v83 = v54;
      __int16 v84 = 2048;
      uint64_t v85 = v55;
      __int16 v86 = 2080;
      uint64_t v87 = (uint64_t)v56;
      __int16 v88 = 2112;
      id v89 = v6;
      __int16 v90 = 2112;
      v91 = v60;
      _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did receive %ld %s items from query:%@ -- %@", buf, 0x34u);
    }
    id v63 = v6;

    v68 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    v65 = self->_itemsByBundleAndCSID;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v62 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v81 count:16];
    v67 = v9;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v77;
      id v64 = v10;
      uint64_t v66 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v77 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          v16 = [[FPItem alloc] initWithSearchableItem:v15];
          v17 = v16;
          if (v16)
          {
            v18 = [(FPItem *)v16 itemIdentifier];
            char v19 = [v18 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

            if ((v19 & 1) == 0)
            {
              [v9 addObject:v17];
              v20 = [v15 bundleID];
              if (v20)
              {
                v21 = [(NSMutableDictionary *)v65 objectForKeyedSubscript:v20];
                if (!v21)
                {
                  v21 = objc_opt_new();
                  [(NSMutableDictionary *)v65 setObject:v21 forKeyedSubscript:v20];
                }
                v22 = [v15 uniqueIdentifier];
                if (v22) {
                  [v21 setObject:v17 forKeyedSubscript:v22];
                }
                v23 = [(FPItem *)v17 collaborationIdentifier];

                if (v23)
                {
                  itemsByProviderAndCollaborationIdentifier = self->_itemsByProviderAndCollaborationIdentifier;
                  v25 = [(FPItem *)v17 providerIDForDeduplication];
                  v26 = [(NSMutableDictionary *)itemsByProviderAndCollaborationIdentifier objectForKeyedSubscript:v25];
                  v27 = [(FPItem *)v17 collaborationIdentifier];
                  v28 = [v26 objectForKeyedSubscript:v27];

                  self = v69;
                  if (!v28
                    || ([v28 isEqual:v17] & 1) == 0
                    && ![(FPItem *)v17 isCollaborationInvitation])
                  {
                    v29 = v69->_itemsByProviderAndCollaborationIdentifier;
                    v30 = [(FPItem *)v17 providerIDForDeduplication];
                    v31 = [(NSMutableDictionary *)v29 objectForKeyedSubscript:v30];

                    if (!v31)
                    {
                      v31 = objc_opt_new();
                      v32 = v69->_itemsByProviderAndCollaborationIdentifier;
                      v33 = [(FPItem *)v17 providerIDForDeduplication];
                      [(NSMutableDictionary *)v32 setObject:v31 forKeyedSubscript:v33];
                    }
                    v34 = [(FPItem *)v17 collaborationIdentifier];
                    [v31 setObject:v17 forKeyedSubscript:v34];

                    if (v28)
                    {
                      v35 = [v28 itemID];
                      [v68 addObject:v35];
                    }
                    self = v69;
                  }

                  uint64_t v9 = v67;
                }

                id v10 = v64;
              }

              uint64_t v13 = v66;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v12);
    }

    if (!self->_gathering)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      obj = self->_observers;
      uint64_t v36 = [(NSMutableSet *)obj countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v73;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v73 != v38) {
              objc_enumerationMutation(obj);
            }
            v40 = *(void **)(*((void *)&v72 + 1) + 8 * v39);
            v41 = (void *)MEMORY[0x1A6248870]();
            if ([(FPSpotlightCollector *)self _shouldFilterUpdatesForObserver:v40])
            {
              id v71 = 0;
              v42 = [(FPSpotlightCollector *)self filterItems:v9 forObserver:v40 excludedItemIDs:&v71];
              id v43 = v71;
              uint64_t v44 = [v42 count];
              uint64_t v45 = [v43 count] + v44;
              uint64_t v46 = [v68 count];
              v47 = fp_current_or_default_log();
              BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG);
              if (v45 + v46)
              {
                self = v69;
                if (v48)
                {
                  v53 = [(FPSpotlightCollector *)v69 description];
                  *(_DWORD *)buf = 138413058;
                  v83 = v53;
                  __int16 v84 = 2112;
                  uint64_t v85 = (uint64_t)v40;
                  __int16 v86 = 2112;
                  uint64_t v87 = (uint64_t)v42;
                  __int16 v88 = 2112;
                  id v89 = v43;
                  _os_log_debug_impl(&dword_1A33AE000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ notifying updates: %@ removal: %@", buf, 0x2Au);
                }
                if ([v42 count]) {
                  [v40 collector:v69 didUpdateItems:v42];
                }
                uint64_t v9 = v67;
                if ([v43 count]) {
                  [v40 collector:v69 didRemoveItemIDs:v43];
                }
                if ([v68 count]) {
                  [v40 collector:v69 didRemoveItemIDs:v68];
                }
              }
              else
              {
                self = v69;
                if (v48)
                {
                  v52 = [(FPSpotlightCollector *)v69 description];
                  *(_DWORD *)buf = 138412546;
                  v83 = v52;
                  __int16 v84 = 2112;
                  uint64_t v85 = (uint64_t)v40;
                  _os_log_debug_impl(&dword_1A33AE000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Skipping observer %@", buf, 0x16u);
                }
                uint64_t v9 = v67;
              }
            }
            else
            {
              v49 = fp_current_or_default_log();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                v50 = [(FPSpotlightCollector *)self description];
                uint64_t v51 = [v67 count];
                *(_DWORD *)buf = 138412802;
                v83 = v50;
                __int16 v84 = 2112;
                uint64_t v85 = (uint64_t)v40;
                __int16 v86 = 2048;
                uint64_t v87 = v51;
                _os_log_debug_impl(&dword_1A33AE000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@: notifying with delta updates (%ld items)", buf, 0x20u);

                uint64_t v9 = v67;
              }

              [v40 collector:self didUpdateItems:v9];
            }
            ++v39;
          }
          while (v37 != v39);
          uint64_t v37 = [(NSMutableSet *)obj countByEnumeratingWithState:&v72 objects:v80 count:16];
        }
        while (v37);
      }

      [(FPSpotlightCollector *)self setNeedsItemsOriginUpdate];
    }

    id v7 = v62;
    id v6 = v63;
  }
}

void __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    int v5 = [v4 evaluateWithObject:v3] ^ 1;
  }
  else {
    int v5 = 0;
  }
  id v6 = [v3 collaborationIdentifier];

  if (v6)
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 16);
    v8 = [v3 providerIDForDeduplication];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    id v10 = [v3 collaborationIdentifier];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      int v12 = [v3 isEqual:v11] ^ 1;
    }
    else
    {
      uint64_t v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke_cold_1();
      }

      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }
  if ((v5 | v12))
  {
    v14 = *(void **)(a1 + 56);
    if (v14)
    {
      v15 = [v3 itemID];
      [v14 addObject:v15];
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPSpotlightCollector_addObserver___block_invoke;
  block[3] = &unk_1E5AF2190;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FPSpotlightCollector_removeObserver___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(processingQueue, v7);
}

- (unint64_t)itemsOrigin
{
  return self->_itemsOrigin;
}

- (void)setDelegate:(id)a3
{
}

- (FPSpotlightCollector)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPSpotlightCollector;
  id v6 = [(FPSpotlightCollector *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryDescriptor, a3);
    uint64_t v8 = [(id)objc_opt_class() processingQueue];
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    queries = v7->_queries;
    v7->_queries = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:261 valueOptions:256 capacity:10];
    queryToMountPoint = v7->_queryToMountPoint;
    v7->_queryToMountPoint = (NSMapTable *)v12;

    [(FPSpotlightCollector *)v7 _clear];
  }

  return v7;
}

- (void)_clear
{
  id v3 = (NSMutableSet *)objc_opt_new();
  observers = self->_observers;
  self->_observers = v3;

  self->_gathering = 1;
  id v5 = (NSMutableDictionary *)objc_opt_new();
  itemsByBundleAndCSID = self->_itemsByBundleAndCSID;
  self->_itemsByBundleAndCSID = v5;

  self->_itemsByProviderAndCollaborationIdentifier = (NSMutableDictionary *)objc_opt_new();

  MEMORY[0x1F41817F8]();
}

+ (id)processingQueue
{
  if (processingQueue_onceToken != -1) {
    dispatch_once(&processingQueue_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)processingQueue_processingQueue;

  return v2;
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained queryDidFinishGathering:v2];
}

- (void)queryDidFinishGathering:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  BOOL v5 = [(FPSpotlightCollector *)self isQueryCancelled:v4];
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v19 = [(FPSpotlightCollector *)self description];
    v20 = @"NO";
    *(_DWORD *)buf = 138412802;
    v27 = v19;
    __int16 v28 = 2112;
    if (v5) {
      v20 = @"YES";
    }
    uint64_t v29 = (uint64_t)v20;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Query did finish gathering (cancelled: %@): %@", buf, 0x20u);
  }
  if (!v5)
  {
    [(FPSpotlightCollector *)self setNeedsItemsOriginUpdate];
    self->_gathering = 0;
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightCollector queryDidFinishGathering:]();
    }
    id v21 = v4;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = self->_observers;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1A6248870]();
          objc_super v15 = [(FPSpotlightCollector *)self allItemsForObserver:v13];
          v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = [(FPSpotlightCollector *)self description];
            uint64_t v18 = [v15 count];
            *(_DWORD *)buf = 138413058;
            v27 = v17;
            __int16 v28 = 2048;
            uint64_t v29 = v18;
            __int16 v30 = 2112;
            id v31 = v13;
            __int16 v32 = 2112;
            v33 = v15;
            _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → %ld item(s) to observer %@: %@", buf, 0x2Au);
          }
          [v13 collector:self didGatherItems:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v10);
    }

    id v4 = v21;
  }
}

- (BOOL)isQueryCancelled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FPSpotlightCollector *)self queries];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (void)setNeedsItemsOriginUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPSpotlightCollector *)self allItems];
  unint64_t v4 = [(FPSpotlightCollector *)self _itemsOriginForItems:v3];

  if (v4 != [(FPSpotlightCollector *)self itemsOrigin])
  {
    [(FPSpotlightCollector *)self setItemsOrigin:v4];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = self->_observers;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "collector:didUpdateItemsOrigin:", self, -[FPSpotlightCollector itemsOrigin](self, "itemsOrigin", (void)v10));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (unint64_t)_itemsOriginForItems:(id)a3
{
  id v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3;
  v11[4] = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__FPSpotlightCollector__itemsOriginForItems___block_invoke;
  v6[3] = &unk_1E5AF2370;
  v6[4] = v11;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

void __36__FPSpotlightCollector_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addObserver:*(void *)(a1 + 32)];
}

- (void)_addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (([(NSMutableSet *)self->_observers containsObject:v4] & 1) == 0) {
    [(NSMutableSet *)self->_observers addObject:v4];
  }
  if (self->_suspended)
  {
    BOOL v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightCollector _addObserver:]();
    }
  }
  else
  {
    if (!self->_gathering)
    {
      uint64_t v6 = [(FPSpotlightCollector *)self allItemsForObserver:v4];
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        char v10 = [(FPSpotlightCollector *)self description];
        int v11 = 138412802;
        id v12 = v10;
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2048;
        uint64_t v16 = [v6 count];
        _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Adding observer %@: gathering %ld items", (uint8_t *)&v11, 0x20u);
      }
      [v4 collector:self didGatherItems:v6];
    }
    uint64_t v8 = [(FPSpotlightCollector *)self queries];
    uint64_t v9 = [v8 count];

    if (!v9) {
      [(FPSpotlightCollector *)self _start];
    }
  }
}

- (NSMutableArray)queries
{
  return self->_queries;
}

- (id)allItemsForObserver:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(FPSpotlightCollector *)self allItems];
  uint64_t v6 = [(FPSpotlightCollector *)self filterItems:v5 forObserver:v4 excludedItemIDs:0];
  NSUInteger v7 = [v4 maximumNumberOfItems];

  if ([v6 count] > v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastUsedDate" ascending:0];
    v27[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contentModificationDate" ascending:0];
    v27[1] = v9;
    char v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"displayName" ascending:1];
    v27[2] = v10;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    [v6 sortUsingDescriptors:v11];

    NSUInteger v12 = [v6 count] - v7;
    __int16 v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [(FPSpotlightCollector *)self description];
      uint64_t v17 = [v6 count];
      v29.id location = v7;
      v29.length = v12;
      uint64_t v18 = NSStringFromRange(v29);
      int v19 = 138413058;
      v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      NSUInteger v24 = v7;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Too many results (%ld > %ld), will cut off the items in range %@.", (uint8_t *)&v19, 0x2Au);
    }
    id v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7, v12);
    [v6 removeObjectsAtIndexes:v14];
  }

  return v6;
}

- (id)allItems
{
  id v3 = objc_opt_new();
  itemsByBundleAndCSID = self->_itemsByBundleAndCSID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__FPSpotlightCollector_allItems__block_invoke;
  v7[3] = &unk_1E5AF2208;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)itemsByBundleAndCSID enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)filterItems:(id)a3 forObserver:(id)a4 excludedItemIDs:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    *a5 = v10;
  }
  else
  {
    id v10 = 0;
  }
  int v11 = [v9 itemPredicateForCollector:self];
  NSUInteger v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke;
  v19[3] = &unk_1E5AF21E0;
  id v20 = v11;
  __int16 v21 = self;
  id v13 = v12;
  id v22 = v13;
  id v23 = v10;
  id v14 = v10;
  id v15 = v11;
  [v8 enumerateObjectsUsingBlock:v19];
  uint64_t v16 = v23;
  id v17 = v13;

  return v17;
}

- (void)_start
{
  OUTLINED_FUNCTION_3_2();
  id v2 = [v1 description];
  id v3 = [v0 allObjects];
  id v4 = [v3 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v5, v6, "[DEBUG] %@: Mount point(s) for %{public}@: %@", v7, v8, v9, v10, v11);
}

- (void)setQueries:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (id)_mountPointsForDescriptor
{
  id v3 = [(FPSpotlightCollector *)self queryDescriptor];
  int v4 = [v3 supportsQueryingAllMountPoints];

  if (v4
    && ([(FPSpotlightCollector *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(FPSpotlightCollector *)self delegate];
    uint64_t v7 = [v6 mountPointsForCollector:self];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"FPQueryCollectionDefaultMountPointIdentifier"];
  }

  return v7;
}

- (FPSpotlightQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (FPSpotlightCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPSpotlightCollectorDelegate *)WeakRetained;
}

- (id)_createQueriesForMountPoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint8_t v11 = -[FPSpotlightCollector _createQueryForMountPoint:](self, "_createQueryForMountPoint:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_createQueryForMountPoint:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  uint64_t v5 = [(FPSpotlightCollector *)self queryDescriptor];
  uint64_t v39 = [v5 queryStringForMountPoint:v41];
  if (v39)
  {
    if ([v5 supportsSemanticSearch])
    {
      id from = 0;
      p_id from = &from;
      uint64_t v64 = 0x2050000000;
      id v6 = (id)getCSUserQueryContextClass_softClass;
      uint64_t v65 = getCSUserQueryContextClass_softClass;
      if (!getCSUserQueryContextClass_softClass)
      {
        *(void *)id location = MEMORY[0x1E4F143A8];
        *(void *)&location[8] = 3221225472;
        *(void *)&location[16] = __getCSUserQueryContextClass_block_invoke;
        v70 = &unk_1E5AF1950;
        id v71 = &from;
        __getCSUserQueryContextClass_block_invoke((uint64_t)location);
        id v6 = p_from[3];
      }
      uint64_t v7 = (objc_class *)v6;
      _Block_object_dispose(&from, 8);
      id v40 = objc_alloc_init(v7);
      [v40 setEnableRankedResults:0];
    }
    else
    {
      id from = 0;
      p_id from = &from;
      uint64_t v64 = 0x2050000000;
      id v9 = (id)getCSSearchQueryContextClass_softClass;
      uint64_t v65 = getCSSearchQueryContextClass_softClass;
      if (!getCSSearchQueryContextClass_softClass)
      {
        *(void *)id location = MEMORY[0x1E4F143A8];
        *(void *)&location[8] = 3221225472;
        *(void *)&location[16] = __getCSSearchQueryContextClass_block_invoke;
        v70 = &unk_1E5AF1950;
        id v71 = &from;
        __getCSSearchQueryContextClass_block_invoke((uint64_t)location);
        id v9 = p_from[3];
      }
      uint64_t v10 = (objc_class *)v9;
      _Block_object_dispose(&from, 8);
      id v40 = objc_alloc_init(v10);
    }
    uint8_t v11 = FPDefaultFetchedAttributes();
    [v40 setFetchAttributes:v11];

    [v40 setLive:1];
    if ([v5 desiredCount] != -1) {
      objc_msgSend(v40, "setMaxCount:", objc_msgSend(v5, "desiredCount"));
    }
    if (([v41 isEqualToString:@"FPQueryCollectionDefaultMountPointIdentifier"] & 1) == 0)
    {
      id v68 = v41;
      NSUInteger v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      [v40 setMountPoints:v12];
    }
    [v5 augmentQueryContext:v40];
    if ([v5 supportsSemanticSearch])
    {
      long long v13 = [v5 settings];
      long long v14 = [v13 searchQuery];
      long long v15 = [v14 userQueryString];

      id from = 0;
      p_id from = &from;
      uint64_t v64 = 0x2050000000;
      id v16 = (id)getCSUserQueryClass_softClass;
      uint64_t v65 = getCSUserQueryClass_softClass;
      if (!getCSUserQueryClass_softClass)
      {
        *(void *)id location = MEMORY[0x1E4F143A8];
        *(void *)&location[8] = 3221225472;
        *(void *)&location[16] = __getCSUserQueryClass_block_invoke;
        v70 = &unk_1E5AF1950;
        id v71 = &from;
        __getCSUserQueryClass_block_invoke((uint64_t)location);
        id v16 = p_from[3];
      }
      id v17 = (objc_class *)v16;
      _Block_object_dispose(&from, 8);
      uint64_t v18 = (void *)[[v17 alloc] initWithUserQueryString:v15 userQueryContext:v40];
      v67 = v39;
      int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [v18 setFilterQueries:v19];
    }
    else
    {
      id from = 0;
      p_id from = &from;
      uint64_t v64 = 0x2050000000;
      id v20 = (id)getCSSearchQueryClass_softClass;
      uint64_t v65 = getCSSearchQueryClass_softClass;
      if (!getCSSearchQueryClass_softClass)
      {
        *(void *)id location = MEMORY[0x1E4F143A8];
        *(void *)&location[8] = 3221225472;
        *(void *)&location[16] = __getCSSearchQueryClass_block_invoke;
        v70 = &unk_1E5AF1950;
        id v71 = &from;
        __getCSSearchQueryClass_block_invoke((uint64_t)location);
        id v20 = p_from[3];
      }
      __int16 v21 = (objc_class *)v20;
      _Block_object_dispose(&from, 8);
      uint64_t v18 = (void *)[[v21 alloc] initWithQueryString:v39 context:v40];
    }
    if (!v18)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v36 = [(FPSpotlightCollector *)self queryDescriptor];
      uint64_t v37 = (objc_class *)objc_opt_class();
      uint64_t v38 = NSStringFromClass(v37);
      [v35 handleFailureInMethod:a2, self, @"FPSpotlightCollector.m", 875, @"Unable to create query for descriptor '%@'", v38 object file lineNumber description];
    }
    id v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v34 = [(FPSpotlightCollector *)self description];
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = v34;
      *(_WORD *)&location[12] = 2112;
      *(void *)&location[14] = v41;
      *(_WORD *)&location[22] = 2112;
      v70 = v18;
      _os_log_debug_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Creating query for mount point '%@': %@", location, 0x20u);
    }
    [(NSMapTable *)self->_queryToMountPoint setObject:v41 forKey:v18];
    uint64_t v66 = *MEMORY[0x1E4F28358];
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    [v18 setProtectionClasses:v23];

    *(void *)id location = 0;
    objc_initWeak((id *)location, v18);
    id from = 0;
    objc_initWeak(&from, self);
    NSUInteger v24 = self->_processingQueue;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke;
    v57[3] = &unk_1E5AF2280;
    __int16 v25 = v24;
    unint64_t v58 = v25;
    id v26 = v41;
    id v59 = v26;
    objc_copyWeak(&v60, &from);
    objc_copyWeak(&v61, (id *)location);
    [v18 setFoundItemsHandler:v57];
    v27 = [v18 foundItemsHandler];
    [v18 setChangedItemsHandler:v27];

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_3;
    v52[3] = &unk_1E5AF22D0;
    __int16 v28 = v25;
    v53 = v28;
    id v29 = v26;
    id v54 = v29;
    objc_copyWeak(&v55, &from);
    objc_copyWeak(&v56, (id *)location);
    [v18 setRemovedItemsHandler:v52];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_5;
    v47[3] = &unk_1E5AF2320;
    __int16 v30 = v28;
    BOOL v48 = v30;
    id v31 = v29;
    id v49 = v31;
    objc_copyWeak(&v50, &from);
    objc_copyWeak(&v51, (id *)location);
    [v18 setGatherEndedHandler:v47];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_7;
    v42[3] = &unk_1E5AF2348;
    __int16 v32 = v30;
    id v43 = v32;
    id v44 = v31;
    objc_copyWeak(&v45, &from);
    objc_copyWeak(&v46, (id *)location);
    [v18 setCompletionHandler:v42];
    id v8 = v18;
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v45);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v55);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&v60);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __32__FPSpotlightCollector_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allValues];
  [v3 addObjectsFromArray:v4];
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_6;
  block[3] = &unk_1E5AF22F8;
  id v2 = *(NSObject **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  dispatch_async(v2, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained query:v2 didUpdateItems:*(void *)(a1 + 40)];
}

void __39__FPSpotlightCollector_processingQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.DocumentManager.Spotlight.processingQueue", v2);
  id v1 = (void *)processingQueue_processingQueue;
  processingQueue_processingQueue = (uint64_t)v0;
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_2;
  v6[3] = &unk_1E5AF2258;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

+ (id)_recursiveDescription
{
  id v2 = +[FPSpotlightCollectorManager sharedInstance];
  id v3 = [v2 _recursiveDescription];

  return v3;
}

- (FPSpotlightCollector)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPSpotlightCollector.m" lineNumber:119 description:@"UNREACHABLE: call -initWithDescriptor: instead"];

  return [(FPSpotlightCollector *)self initWithDescriptor:0];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(FPSpotlightCollector *)self queryDescriptor];
  id v7 = [v6 name];
  id v8 = [v3 stringWithFormat:@"<%@:%p n:%@>", v5, self, v7];

  return v8;
}

- (BOOL)isSuspended
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FPSpotlightCollector_isSuspended__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__FPSpotlightCollector_isSuspended__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (id)allObservers
{
  id v2 = (void *)[(NSMutableSet *)self->_observers copy];

  return v2;
}

- (void)_stop
{
  OUTLINED_FUNCTION_3_2();
  char v3 = [v2 description];
  id v4 = [v1 queries];
  [v4 count];
  id v5 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v6, v7, "[DEBUG] %@: About to cancel %ld queries (%@).", v8, v9, v10, v11, 2u);
}

- (void)suspend
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__FPSpotlightCollector_suspend__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_sync(processingQueue, block);
}

unsigned char *__31__FPSpotlightCollector_suspend__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[24])
  {
    result = (unsigned char *)[result _stop];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
  return result;
}

- (void)resume
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPSpotlightCollector_resume__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_sync(processingQueue, block);
}

unsigned char *__30__FPSpotlightCollector_resume__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[24])
  {
    result = (unsigned char *)[result _start];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
  return result;
}

- (void)mountPointsDidChange:(id)a3
{
  id v5 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPSpotlightCollector_mountPointsDidChange___block_invoke;
  block[3] = &unk_1E5AF21B8;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(processingQueue, block);
}

void __45__FPSpotlightCollector_mountPointsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v42 = [*(id *)(a1 + 32) observers];
  if ([v42 count] && (id v2 = *(unsigned char **)(a1 + 32), !v2[24]))
  {
    char v3 = [v2 queryDescriptor];
    int v4 = [v3 supportsQueryingAllMountPoints];

    if (v4)
    {
      id v41 = (void *)[*(id *)(a1 + 40) mutableCopy];
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      id v43 = (id)objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v6 = [*(id *)(a1 + 32) queries];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v66 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v53;
        uint64_t v39 = v6;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v53 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            NSUInteger v12 = [*(id *)(a1 + 32) _mountPointForExistingSearchQuery:v11];
            if (!v12)
            {
              long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
              [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"FPSpotlightCollector.m" lineNumber:288 description:@"Shouldn't be nil."];
            }
            if ([*(id *)(a1 + 40) containsObject:v12])
            {
              [v41 removeObject:v12];
            }
            else
            {
              if ([v12 isEqualToString:@"FPQueryCollectionDefaultMountPointIdentifier"])
              {
                id v16 = [MEMORY[0x1E4F28B00] currentHandler];
                [v16 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"FPSpotlightCollector.m" lineNumber:296 description:@"The default mount point should never be removed."];
              }
              long long v13 = fp_current_or_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                long long v14 = [*(id *)(a1 + 32) description];
                id v40 = NSStringFromSelector(*(SEL *)(a1 + 48));
                *(_DWORD *)buf = 138412802;
                id v57 = v14;
                __int16 v58 = 2112;
                uint64_t v59 = (uint64_t)v11;
                __int16 v60 = 2112;
                uint64_t v61 = (uint64_t)v40;
                _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Cancelling query %@ (%@)", buf, 0x20u);

                uint64_t v6 = v39;
              }

              [v11 cancel];
              [v43 addObject:v11];
              [*(id *)(a1 + 32) _removeItemsForQuery:v11 mountPoint:v12];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }
        while (v8);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v17 = v41;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v65 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = [*(id *)(a1 + 32) _createQueryForMountPoint:*(void *)(*((void *)&v48 + 1) + 8 * j)];
            [v5 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v65 count:16];
        }
        while (v19);
      }

      id v23 = [*(id *)(a1 + 32) queries];
      [v23 removeObjectsInArray:v43];

      NSUInteger v24 = [*(id *)(a1 + 32) queries];
      [v24 addObjectsFromArray:v5];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = v5;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v64 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(v25);
            }
            __int16 v30 = *(void **)(*((void *)&v44 + 1) + 8 * k);
            id v31 = fp_current_or_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              __int16 v32 = [*(id *)(a1 + 32) description];
              *(_DWORD *)buf = 138412546;
              id v57 = v32;
              __int16 v58 = 2048;
              uint64_t v59 = (uint64_t)v30;
              _os_log_debug_impl(&dword_1A33AE000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Starting query %p", buf, 0x16u);
            }
            [v30 start];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v64 count:16];
        }
        while (v27);
      }

      v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = [*(id *)(a1 + 32) description];
        uint64_t v35 = [*(id *)(a1 + 32) queries];
        uint64_t v36 = [v35 count];
        uint64_t v37 = [v43 count];
        uint64_t v38 = [v25 count];
        *(_DWORD *)buf = 138413058;
        id v57 = v34;
        __int16 v58 = 2048;
        uint64_t v59 = v36;
        __int16 v60 = 2048;
        uint64_t v61 = v37;
        __int16 v62 = 2048;
        uint64_t v63 = v38;
        _os_log_debug_impl(&dword_1A33AE000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Number of queries after mount points changed: %ld (cancelled %ld old query/ies, started %ld new query/ies).", buf, 0x2Au);
      }
    }
  }
  else
  {
  }
}

- (BOOL)_shouldFilterUpdatesForObserver:(id)a3
{
  id v4 = a3;
  if ([(FPSpotlightCollector *)self _shouldRemoveItemsFromObserver:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [v4 itemPredicateForCollector:self];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)_shouldRemoveItemsFromObserver:(id)a3
{
  return [a3 maximumNumberOfItems] == -1;
}

- (id)_mountPointForExistingSearchQuery:(id)a3
{
  processingQueue = self->_processingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(processingQueue);
  uint64_t v6 = [(NSMapTable *)self->_queryToMountPoint objectForKey:v5];

  return v6;
}

- (id)_allItemsForMountPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_itemsByBundleAndCSID objectForKeyedSubscript:@"com.apple.filesystems.UserFS.FileProvider"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 allValues];
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__FPSpotlightCollector__allItemsForMountPoint___block_invoke;
    v12[3] = &unk_1E5AF2230;
    id v13 = v4;
    uint64_t v9 = [v8 predicateWithBlock:v12];
    SEL v10 = [v7 filteredArrayUsingPredicate:v9];
  }
  else
  {
    SEL v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __47__FPSpotlightCollector__allItemsForMountPoint___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 domainIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)query:(id)a3 didRemoveItemsWithCSIdentifiers:(id)a4 inBundle:(id)a5
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  id v89 = self;
  if (![(FPSpotlightCollector *)self isQueryCancelled:v8])
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v79 = [(FPSpotlightCollector *)self description];
      *(_DWORD *)buf = 138413314;
      v116 = v79;
      __int16 v117 = 2112;
      id v118 = v8;
      __int16 v119 = 2080;
      v120 = "removed";
      __int16 v121 = 2048;
      uint64_t v122 = [v9 count];
      __int16 v123 = 2112;
      id v124 = v9;
      _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did remove items for query:%@ (%s %ld items) %@", buf, 0x34u);
    }
    if (v10)
    {
      if (!self->_gathering)
      {
        id v81 = v8;
        id v82 = v10;
        NSUInteger v12 = [(NSMutableDictionary *)self->_itemsByBundleAndCSID objectForKeyedSubscript:v10];
        __int16 v88 = objc_opt_new();
        uint64_t v87 = objc_opt_new();
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v80 = v9;
        obuint64_t j = v9;
        uint64_t v13 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
        __int16 v84 = v12;
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v107 != v15) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(void **)(*((void *)&v106 + 1) + 8 * i);
              uint64_t v18 = [v12 objectForKeyedSubscript:v17];
              uint64_t v19 = v18;
              if (v18)
              {
                uint64_t v20 = [v18 itemID];
                [v88 addObject:v20];

                [v87 addObject:v19];
                __int16 v21 = [v19 providerIDForDeduplication];
                id v22 = [v19 collaborationIdentifier];
                uint64_t v23 = [v19 collaborationIdentifier];
                if (v23)
                {
                  NSUInteger v24 = (void *)v23;
                  id v25 = [(NSMutableDictionary *)v89->_itemsByProviderAndCollaborationIdentifier objectForKeyedSubscript:v21];
                  uint64_t v26 = [v25 objectForKeyedSubscript:v22];
                  int v27 = [v26 isEqual:v19];

                  NSUInteger v12 = v84;
                  if (v27)
                  {
                    uint64_t v28 = [(NSMutableDictionary *)v89->_itemsByProviderAndCollaborationIdentifier objectForKeyedSubscript:v21];
                    [v28 setObject:0 forKeyedSubscript:v22];
                  }
                }
              }
              else
              {
                __int16 v21 = fp_current_or_default_log();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  id v29 = [(FPSpotlightCollector *)v89 description];
                  *(_DWORD *)buf = 138412546;
                  v116 = v29;
                  __int16 v117 = 2112;
                  id v118 = v17;
                  _os_log_error_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_ERROR, "[ERROR] %@: Unable to obtain item for identifier %@ when items have been removed from query results.", buf, 0x16u);
                }
              }
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
          }
          while (v14);
        }

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v30 = obj;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v102 objects:v113 count:16];
        id v10 = v82;
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v103;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v103 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v102 + 1) + 8 * j);
              uint64_t v36 = [(NSMutableDictionary *)v89->_itemsByBundleAndCSID objectForKeyedSubscript:v82];
              [v36 setObject:0 forKeyedSubscript:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v102 objects:v113 count:16];
          }
          while (v32);
        }

        if ([v88 count])
        {
          uint64_t v37 = v89;
          if (![(FPSpotlightCollector *)v89 _areItemsTransientFromBundleIdentifier:v82])
          {
            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            uint64_t v38 = v89->_observers;
            uint64_t v39 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v98 objects:v112 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v99;
              while (2)
              {
                for (uint64_t k = 0; k != v40; ++k)
                {
                  if (*(void *)v99 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  if (![(FPSpotlightCollector *)v89 _shouldRemoveItemsFromObserver:*(void *)(*((void *)&v98 + 1) + 8 * k)])
                  {

                    [(FPSpotlightCollector *)v89 _regather];
                    goto LABEL_73;
                  }
                }
                uint64_t v40 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v98 objects:v112 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
            }

            uint64_t v37 = v89;
          }
          id v43 = objc_opt_new();
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v44 = [(FPSpotlightCollector *)v37 allItems];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v111 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v95;
            do
            {
              for (uint64_t m = 0; m != v46; ++m)
              {
                if (*(void *)v95 != v47) {
                  objc_enumerationMutation(v44);
                }
                long long v49 = *(void **)(*((void *)&v94 + 1) + 8 * m);
                long long v50 = [v49 collaborationIdentifier];

                if (v50)
                {
                  itemsByProviderAndCollaborationIdentifier = v89->_itemsByProviderAndCollaborationIdentifier;
                  long long v52 = [v49 providerIDForDeduplication];
                  long long v53 = [(NSMutableDictionary *)itemsByProviderAndCollaborationIdentifier objectForKeyedSubscript:v52];
                  long long v54 = [v49 collaborationIdentifier];
                  long long v55 = [v53 objectForKeyedSubscript:v54];

                  if (!v55)
                  {
                    id v56 = v89->_itemsByProviderAndCollaborationIdentifier;
                    id v57 = [v49 providerIDForDeduplication];
                    __int16 v58 = [(NSMutableDictionary *)v56 objectForKeyedSubscript:v57];

                    if (!v58)
                    {
                      __int16 v58 = objc_opt_new();
                      uint64_t v59 = v89->_itemsByProviderAndCollaborationIdentifier;
                      __int16 v60 = [v49 providerIDForDeduplication];
                      [(NSMutableDictionary *)v59 setObject:v58 forKeyedSubscript:v60];
                    }
                    uint64_t v61 = [v49 collaborationIdentifier];
                    [v58 setObject:v49 forKeyedSubscript:v61];

                    [v43 addObject:v49];
                  }
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v94 objects:v111 count:16];
            }
            while (v46);
          }

          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          obja = v89->_observers;
          uint64_t v62 = [(NSMutableSet *)obja countByEnumeratingWithState:&v90 objects:v110 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v91;
            do
            {
              uint64_t v65 = 0;
              uint64_t v83 = v63;
              do
              {
                if (*(void *)v91 != v64) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v66 = *(void **)(*((void *)&v90 + 1) + 8 * v65);
                uint64_t v67 = (void *)MEMORY[0x1A6248870]();
                if ([(FPSpotlightCollector *)v89 _shouldFilterUpdatesForObserver:v66])
                {
                  id v68 = v43;
                  uint64_t v69 = v64;
                  v70 = [(FPSpotlightCollector *)v89 filterItems:v87 forObserver:v66 excludedItemIDs:0];
                  id v71 = objc_msgSend(v70, "fp_itemIDs");
                  uint64_t v72 = [v71 count];
                  long long v73 = fp_current_or_default_log();
                  BOOL v74 = os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG);
                  if (v72)
                  {
                    if (v74)
                    {
                      long long v77 = [(FPSpotlightCollector *)v89 description];
                      *(_DWORD *)buf = 138412802;
                      v116 = v77;
                      __int16 v117 = 2112;
                      id v118 = v66;
                      __int16 v119 = 2112;
                      v120 = (const char *)v71;
                      _os_log_debug_impl(&dword_1A33AE000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ to remove: %@", buf, 0x20u);
                    }
                    [v66 collector:v89 didRemoveItemIDs:v71];
                  }
                  else
                  {
                    if (v74)
                    {
                      long long v78 = [(FPSpotlightCollector *)v89 description];
                      *(_DWORD *)buf = 138412546;
                      v116 = v78;
                      __int16 v117 = 2112;
                      id v118 = v66;
                      _os_log_debug_impl(&dword_1A33AE000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Nothing to send to observer:%@", buf, 0x16u);
                    }
                  }

                  uint64_t v64 = v69;
                  id v43 = v68;
                  uint64_t v63 = v83;
                }
                else
                {
                  long long v75 = fp_current_or_default_log();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                  {
                    long long v76 = [(FPSpotlightCollector *)v89 description];
                    *(_DWORD *)buf = 138412802;
                    v116 = v76;
                    __int16 v117 = 2112;
                    id v118 = v66;
                    __int16 v119 = 2112;
                    v120 = (const char *)v88;
                    _os_log_debug_impl(&dword_1A33AE000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ to receive delta deletion updates: %@", buf, 0x20u);
                  }
                  [v66 collector:v89 didRemoveItemIDs:v88];
                }
                if ([v43 count]) {
                  [v66 collector:v89 didUpdateItems:v43];
                }
                ++v65;
              }
              while (v63 != v65);
              uint64_t v63 = [(NSMutableSet *)obja countByEnumeratingWithState:&v90 objects:v110 count:16];
            }
            while (v63);
          }

          [(FPSpotlightCollector *)v89 setNeedsItemsOriginUpdate];
          id v10 = v82;
          NSUInteger v12 = v84;
        }
LABEL_73:

        id v9 = v80;
        id v8 = v81;
      }
    }
  }
}

- (void)query:(id)a3 didFinishWithError:(id)a4
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (![(FPSpotlightCollector *)self isQueryCancelled:v6])
  {
    if (!self->_gathering) {
      [(FPSpotlightCollector *)self queryDidFinishGathering:v6];
    }
    id v8 = [(FPSpotlightCollector *)self _mountPointForExistingSearchQuery:v6];
    id v9 = v8;
    if (v8) {
      int v10 = [v8 isEqualToString:@"FPQueryCollectionDefaultMountPointIdentifier"];
    }
    else {
      int v10 = 1;
    }
    uint64_t v11 = [v7 domain];
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    NSUInteger v12 = (void *)getCSSearchQueryErrorDomainSymbolLoc_ptr;
    uint64_t v49 = getCSSearchQueryErrorDomainSymbolLoc_ptr;
    if (!getCSSearchQueryErrorDomainSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCSSearchQueryErrorDomainSymbolLoc_block_invoke;
      long long v54 = &unk_1E5AF1950;
      v55[0] = &v46;
      uint64_t v13 = (void *)CoreSpotlightLibrary_0();
      uint64_t v14 = dlsym(v13, "CSSearchQueryErrorDomain");
      *(void *)(*(void *)(v55[0] + 8) + 24) = v14;
      getCSSearchQueryErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(v55[0] + 8) + 24);
      NSUInteger v12 = (void *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v12) {
      -[FPSpotlightCollector query:didFinishWithError:]();
    }
    int v15 = [v11 isEqualToString:*v12];

    id v16 = [v7 domain];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F281F8]];

    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = [(FPSpotlightCollector *)self description];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      long long v54 = v7;
      _os_log_debug_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did finish query:%p with error: %@", buf, 0x20u);
    }
    if (v15)
    {
      if ([v7 code] == -2003)
      {
        uint64_t v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[FPSpotlightCollector query:didFinishWithError:]();
        }
LABEL_32:

        [(FPSpotlightCollector *)self _removeItemsForQuery:v6 mountPoint:v9];
        int v27 = [(FPSpotlightCollector *)self queries];
        [v27 removeObject:v6];

LABEL_33:
        goto LABEL_34;
      }
      if ([v7 code] == -2002)
      {
        uint64_t v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = [(FPSpotlightCollector *)self description];
          uint64_t v40 = [(FPSpotlightCollector *)self description];
          uint64_t v41 = [v6 queryString];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v39;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2114;
          long long v54 = v7;
          LOWORD(v55[0]) = 2114;
          *(void *)((char *)v55 + 2) = v41;
          _os_log_debug_impl(&dword_1A33AE000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Stopped searching for %{public}@: %{public}@, since query seems invalid: %{public}@", buf, 0x2Au);
        }
LABEL_24:

        __int16 v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        id v52 = v7;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        uint64_t v19 = [v21 errorWithDomain:@"com.apple.FileProvider.Spotlight" code:0 userInfo:v22];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v23 = self->_observers;
        uint64_t v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v23);
              }
              objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "collector:didEncounterError:", self, v19, (void)v42);
            }
            uint64_t v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v24);
        }

        goto LABEL_32;
      }
    }
    else if (!v17 || [v7 code] != 4097)
    {
      uint64_t v20 = fp_current_or_default_log();
      uint64_t v19 = v20;
      if (!v7)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[FPSpotlightCollector query:didFinishWithError:].cold.6(self);
        }
        goto LABEL_32;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[FPSpotlightCollector query:didFinishWithError:].cold.7();
      }
      goto LABEL_24;
    }
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightCollector query:didFinishWithError:].cold.5();
    }

    if (v15)
    {
      int v29 = [v7 code] == -2000 ? v10 : 1;
      if (v29 != 1) {
        goto LABEL_33;
      }
    }
    lastStartOfRecovery = self->_lastStartOfRecovery;
    if (lastStartOfRecovery
      && ([(NSDate *)lastStartOfRecovery timeIntervalSinceNow], v31 >= -15.0))
    {
      p_unint64_t numberOfRecoveryAttempts = &self->_numberOfRecoveryAttempts;
      unint64_t numberOfRecoveryAttempts = self->_numberOfRecoveryAttempts;
      if (numberOfRecoveryAttempts > 5)
      {
        uint64_t v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[FPSpotlightCollector query:didFinishWithError:].cold.4();
        }
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v33 = self->_lastStartOfRecovery;
      self->_lastStartOfRecovery = v32;

      unint64_t numberOfRecoveryAttempts = 0;
      self->_unint64_t numberOfRecoveryAttempts = 0;
      p_unint64_t numberOfRecoveryAttempts = &self->_numberOfRecoveryAttempts;
    }
    *p_unint64_t numberOfRecoveryAttempts = numberOfRecoveryAttempts + 1;
    uint64_t v36 = fp_current_or_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightCollector query:didFinishWithError:]();
    }

    [(FPSpotlightCollector *)self _removeItemsForQuery:v6 mountPoint:v9];
    uint64_t v37 = [(FPSpotlightCollector *)self queries];
    [v37 removeObject:v6];

    [(FPSpotlightCollector *)self _regather];
    goto LABEL_33;
  }
LABEL_34:
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_4;
  block[3] = &unk_1E5AF22A8;
  id v7 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_copyWeak(&v15, (id *)(a1 + 56));
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained query:v2 didRemoveItemsWithCSIdentifiers:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_8;
  v6[3] = &unk_1E5AF2258;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained query:v2 didFinishWithError:*(void *)(a1 + 40)];
}

- (void)_regather
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Regathering", (uint8_t *)&v4, 0xCu);
}

- (void)_removeItemsForQuery:(id)a3 mountPoint:(id)a4
{
  id v6 = a3;
  processingQueue = self->_processingQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(processingQueue);
  id v9 = [(FPSpotlightCollector *)self _allItemsForMountPoint:v8];

  id v10 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke;
  v15[3] = &unk_1E5AF2398;
  id v16 = v10;
  id v11 = v10;
  [v9 enumerateObjectsUsingBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke_2;
  v13[3] = &unk_1E5AF23C0;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 enumerateKeysAndObjectsUsingBlock:v13];
}

void __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v11 = v3;
  id v5 = [v3 providerID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_opt_new();
    id v7 = *(void **)(a1 + 32);
    id v8 = [v11 providerID];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  id v9 = [v11 itemID];
  id v10 = [v9 coreSpotlightIdentifier];
  [v6 addObject:v10];
}

uint64_t __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) query:*(void *)(a1 + 40) didRemoveItemsWithCSIdentifiers:a3 inBundle:a2];
}

- (BOOL)_areItemsTransientFromBundleIdentifier:(id)a3
{
  return [a3 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"];
}

- (void)setItemsOrigin:(unint64_t)a3
{
  self->_itemsOrigin = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isGathering
{
  return self->_gathering;
}

- (void)setGathering:(BOOL)a3
{
  self->_gathering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryToMountPoint, 0);
  objc_storeStrong((id *)&self->_lastStartOfRecovery, 0);
  objc_storeStrong((id *)&self->_itemsByProviderAndCollaborationIdentifier, 0);

  objc_storeStrong((id *)&self->_itemsByBundleAndCSID, 0);
}

- (void)_addObserver:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  id v2 = [v1 description];
  id v3 = [v0 description];
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v4, v5, "[DEBUG] %@: Adding observer %{public}@, but not delivering items or starting query, since collector is suspended; %@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

- (void)_removeObserver:.cold.1()
{
  OUTLINED_FUNCTION_16_0();
  id v1 = [v0 description];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] %@: Removing observer %@", v4, v5, v6, v7, v8);
}

void __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 description];
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] %@: Cannot find entry for %@ in _itemsByCollaborationIdentifier map", v3, 0x16u);
}

- (void)queryDidFinishGathering:.cold.1()
{
  OUTLINED_FUNCTION_16_0();
  id v1 = [v0 description];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] %@: Did finish gathering items for query:%@", v4, v5, v6, v7, v8);
}

- (void)query:didFinishWithError:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getCSSearchQueryErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightCollector.m", 33, @"%s", dlerror());

  __break(1u);
}

- (void)query:didFinishWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  [v1 description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10_2() description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v3, v4, "[DEBUG] %@: Stopped searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)query:didFinishWithError:.cold.3()
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v2 = [v1 description];
  uint64_t v3 = [v0 description];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v4, v5, "[DEBUG] %@: Will attempt (attempt #%ld) to relaunch query for %{public}@", v6, v7, v8, v9, v10);
}

- (void)query:didFinishWithError:.cold.4()
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v2 = [v1 description];
  uint64_t v3 = [v0 description];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v4, v5, "[DEBUG] %@: Will NOT attempt (attempt #%ld) to relaunch query for %{public}@", v6, v7, v8, v9, v10);
}

- (void)query:didFinishWithError:.cold.5()
{
  OUTLINED_FUNCTION_3_4();
  [v1 description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10_2() description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %@: Spotlight error occured while searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)query:(void *)a1 didFinishWithError:.cold.6(void *a1)
{
  [a1 description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(id)OUTLINED_FUNCTION_10_2() description];
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v2, v3, "[DEBUG] %@: Finished searching for %{public}@: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)query:didFinishWithError:.cold.7()
{
  OUTLINED_FUNCTION_3_4();
  [v1 description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10_2() description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %@: Unknown error occured while searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

@end