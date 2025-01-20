@interface BRItemCollectionGatherer
- (BOOL)_buildCollectionOnItemIfPossible:(id)a3;
- (BOOL)_canWatchItem:(id)a3;
- (BOOL)_isItemOwnedByAnyCollection:(id)a3;
- (BOOL)_signalDelegateIfNeededOnFinishGathering;
- (BRItemCollectionGatherer)initWithDelegate:(id)a3 query:(id)a4;
- (NSString)description;
- (id)_getAppLibraryURLFromConfig:(id)a3;
- (id)test_getQueue;
- (unint64_t)_itemID:(id)a3 becameOwnedByCollection:(id)a4;
- (unint64_t)_itemID:(id)a3 wasDeletedByCollection:(id)a4;
- (void)_addItemCollectionOnItem:(id)a3;
- (void)_boostAppLibraryOfItemIfNeeded:(id)a3;
- (void)_invalidateAndNotifyDelegate:(BOOL)a3;
- (void)_queueSignalDelegateIfNeededOnFinishGathering;
- (void)_removeCollectionFromGatherSet:(id)a3;
- (void)_signalDelegateIfNeededOnFinishGathering;
- (void)_startObservingAccountTokenDidChangeNotification;
- (void)_startWatchingAppLibraries:(id)a3;
- (void)_startWatchingNewSubItem:(id)a3;
- (void)_startWatchingRootItemWithConfig:(id)a3;
- (void)_startWatchingURLs:(id)a3;
- (void)_stopObservingAccountTokenDidChangeNotification;
- (void)_stopWatchingItemIDRecusively:(id)a3 itemIDsInItem:(id)a4;
- (void)_unboostApplibrariesIfNeeded;
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6;
- (void)collectionDidFinishGathering:(id)a3;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)dataForCollectionShouldBeReloaded:(id)a3 deleteItemsWithIDs:(id)a4;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)invalidate;
- (void)pauseWatchingWithCompletionBlock:(id)a3;
- (void)resumeWatching;
- (void)startWatchingRootItemWithScopes:(id)a3;
@end

@implementation BRItemCollectionGatherer

- (BRItemCollectionGatherer)initWithDelegate:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BRItemCollectionGatherer;
  v8 = [(BRItemCollectionGatherer *)&v29 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemIDToItemCollectionMap = v8->_itemIDToItemCollectionMap;
    v8->_itemIDToItemCollectionMap = v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.br.item-collection-gatherer", v12);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_query, a4);
    uint64_t v15 = [(NSMetadataQuery *)v8->_query predicate];
    predicate = v8->_predicate;
    v8->_predicate = (NSPredicate *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    watchedAppLibraryFPItemIDs = v8->_watchedAppLibraryFPItemIDs;
    v8->_watchedAppLibraryFPItemIDs = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    waitingToBeGatheredCollections = v8->_waitingToBeGatheredCollections;
    v8->_waitingToBeGatheredCollections = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    collectionsSet = v8->_collectionsSet;
    v8->_collectionsSet = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemOwnersMap = v8->_itemOwnersMap;
    v8->_itemOwnersMap = v23;

    v8->_finishedInitialGathering = 0;
    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    boostedAppLibraries = v8->_boostedAppLibraries;
    v8->_boostedAppLibraries = v25;

    accountTokenDidChangeNotificationObserver = v8->_accountTokenDidChangeNotificationObserver;
    v8->_accountTokenDidChangeNotificationObserver = 0;
  }
  return v8;
}

- (id)test_getQueue
{
  return self->_queue;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"BRItemCollectionGatherer<%p>", self);
}

- (void)_stopObservingAccountTokenDidChangeNotification
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - Stop observing BRAccountTokenDidChangeNotification%@", (void)v3, DWORD2(v3));
}

- (void)_startObservingAccountTokenDidChangeNotification
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - Already observing BRAccountTokenDidChangeNotification%@", (void)v3, DWORD2(v3));
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 293);
  long long v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_4();
  }

  id v29 = 0;
  v4 = +[BRAccount currentCachedLoggedInAccountWithError:&v29];
  id v5 = v29;
  if (v5)
  {
    id v6 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 298);
    id v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v28;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v34 = 2112;
      v35 = v6;
      _os_log_fault_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - Failed to get current cached logged in account with error [%@]%@", buf, 0x20u);
    }
  }
  else if (v4 {
         && ([v4 perAppAccountIdentifier],
  }
             v8 = objc_claimAutoreleasedReturnValue(),
             v8,
             v8))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v9 = (id *)(a1 + 32);
    v11 = *(void **)(v10 + 112);
    if (!v11
      || ([v4 perAppAccountIdentifier],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v11 isEqual:v12],
          v12,
          (v13 & 1) == 0))
    {
      v14 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 305);
      uint64_t v15 = brc_default_log(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_3();
      }

      v16 = (void *)*((void *)*v9 + 14);
      v17 = [v4 perAppAccountIdentifier];
      LOBYTE(v16) = [v16 isEqual:v17];

      if ((v16 & 1) == 0 && [*((id *)*v9 + 12) count])
      {
        v18 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 308);
        v19 = brc_default_log(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_2();
        }

        [*((id *)*v9 + 12) removeAllObjects];
      }
      v20 = [v4 perAppAccountIdentifier];
      uint64_t v21 = [v20 copy];
      v22 = (void *)*((void *)*v9 + 14);
      *((void *)*v9 + 14) = v21;

      [*v9 _startWatchingRootItemWithConfig:*((void *)*v9 + 6)];
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    v23 = (id *)(a1 + 32);
    if (*(void *)(v24 + 112))
    {
      v25 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 316);
      v26 = brc_default_log(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_1();
      }

      v27 = (void *)*((void *)*v23 + 14);
      *((void *)*v23 + 14) = 0;

      [*v23 _invalidateAndNotifyDelegate:1];
    }
  }
}

- (void)_addItemCollectionOnItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 itemID];
  id v6 = [(NSMutableDictionary *)self->_itemIDToItemCollectionMap objectForKey:v5];

  if (!v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]", 332);
    v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v16 = [v4 providerItemIdentifier];
      *(_DWORD *)buf = 138413058;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Adding Item Collection on itemID = %@, providerItemIdentifier = %@%@", buf, 0x2Au);
    }
    v9 = [MEMORY[0x1E4F25D40] defaultManager];
    uint64_t v10 = (void *)[v9 newCollectionWithItemID:v5];

    v11 = (void *)MEMORY[0x1E4F28F60];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke;
    v17[3] = &unk_1E59AF950;
    v17[4] = self;
    id v12 = v5;
    id v18 = v12;
    id v19 = v4;
    char v13 = [v11 predicateWithBlock:v17];
    [v10 setItemFilteringPredicate:v13];

    [v10 setDelegate:self];
    [v10 setWorkingQueue:self->_queue];
    [v10 setShowHiddenFiles:1];
    v14 = [v10 settings];
    [v14 setRequireSandboxAccess:1];

    uint64_t v15 = [v10 settings];
    [v15 setUnbounded:1];

    [(NSMutableDictionary *)self->_itemIDToItemCollectionMap setObject:v10 forKey:v12];
    [(NSMutableSet *)self->_waitingToBeGatheredCollections addObject:v10];
    [(NSMutableSet *)self->_collectionsSet addObject:v10];
    [v10 startObserving];
  }
}

uint64_t __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (uint64_t *)(a1 + 32);
  if (([*(id *)(*(void *)(a1 + 32) + 48) watchTypes] & 0x40) == 0
    || [v3 isFolder])
  {
    if ([*(id *)(*v4 + 48) watchTypes])
    {
      uint64_t v28 = [v3 itemID];
      uint64_t v27 = [v28 isEqualToItemID:*(void *)(a1 + 40)];

      goto LABEL_26;
    }
    id v5 = [v3 parentItemID];

    if (!v5)
    {
      id v6 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]_block_invoke", 348);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = *v4;
        *(_DWORD *)buf = 138412802;
        uint64_t v39 = v36;
        __int16 v40 = 2112;
        id v41 = v3;
        __int16 v42 = 2112;
        v43 = v6;
        _os_log_fault_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - fp items should always have a parentItemID set on it - %@%@", buf, 0x20u);
      }
    }
    uint64_t v8 = [v3 parentItemID];
    if (!v8) {
      goto LABEL_15;
    }
    v9 = (void *)v8;
    uint64_t v10 = *(void **)(*v4 + 56);
    v11 = [v3 parentItemID];
    LODWORD(v10) = [v10 containsObject:v11];

    if (!v10) {
      goto LABEL_15;
    }
    id v12 = [v3 displayName];
    int v13 = [v12 isEqual:@"Documents"];

    if (([*(id *)(*v4 + 48) watchTypes] & 6) != 0 || v13)
    {
      v14 = [*(id *)(a1 + 48) providerItemIdentifier];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F25BF0]];

      if (!v15
        || (v13 & 1) == 0
        && ([v3 displayName],
            v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 isEqual:@"Desktop"],
            v16,
            (v17 & 1) == 0))
      {
LABEL_15:
        id v18 = [*(id *)(*v4 + 48) gatherPrefix];

        if (v18)
        {
          id v19 = (void *)MEMORY[0x1E4F28FD8];
          v20 = NSString;
          uint64_t v21 = [*(id *)(*v4 + 48) gatherPrefix];
          __int16 v22 = [v20 stringWithFormat:@"^%@", v21];
          id v37 = 0;
          v23 = [v19 regularExpressionWithPattern:v22 options:0 error:&v37];
          id v24 = v37;

          if (v24)
          {
            v25 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]_block_invoke", 387);
            __int16 v26 = brc_default_log(1);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
              __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke_cold_1();
            }

            goto LABEL_20;
          }
          id v29 = [v3 displayName];
          v30 = [v3 displayName];
          uint64_t v31 = objc_msgSend(v23, "numberOfMatchesInString:options:range:", v29, 0, 0, objc_msgSend(v30, "length"));

          if (!v31)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        __int16 v32 = [v3 fileURL];
        id v33 = [v32 lastPathComponent];
        int v34 = objc_msgSend(v33, "br_isExcludedWithMaximumDepth:", 1);

        uint64_t v27 = v34 ^ 1u;
        goto LABEL_26;
      }
    }
  }
LABEL_21:
  uint64_t v27 = 0;
LABEL_26:

  return v27;
}

- (BOOL)_canWatchItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemID];
  if (([(BRWatchingConfiguration *)self->_config watchTypes] & 2) != 0
    || ([(BRWatchingConfiguration *)self->_config watchTypes] & 1) != 0)
  {
    char v14 = [(NSMutableDictionary *)self->_itemIDToItemCollectionMap count] == 0;
  }
  else
  {
    id v6 = [(NSMutableDictionary *)self->_itemIDToItemCollectionMap objectForKey:v5];

    if (v6
      || ![v4 isFolder]
      || ![(BRWatchingConfiguration *)self->_config watchTypes])
    {
      goto LABEL_12;
    }
    watchedAppLibraryFPItemIDs = self->_watchedAppLibraryFPItemIDs;
    uint64_t v8 = [v4 parentItemID];
    LODWORD(watchedAppLibraryFPItemIDs) = [(NSMutableSet *)watchedAppLibraryFPItemIDs containsObject:v8];

    if (!watchedAppLibraryFPItemIDs
      || (([v4 displayName],
           v9 = objc_claimAutoreleasedReturnValue(),
           unsigned int v10 = [v9 isEqual:@"Documents"],
           v9,
           ([(BRWatchingConfiguration *)self->_config watchTypes] & 8) != 0)
       || (v10 & 1) == 0)
      && (([(BRWatchingConfiguration *)self->_config watchTypes] >> 2) & 1 | v10) == 1)
    {
      v11 = [v4 fileURL];
      id v12 = [v11 path];
      char v13 = objc_msgSend(v12, "br_isExcludedWithMaximumDepth:", 1024);

      char v14 = v13 ^ 1;
    }
    else
    {
LABEL_12:
      char v14 = 0;
    }
  }

  return v14;
}

- (BOOL)_buildCollectionOnItemIfPossible:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _buildCollectionOnItemIfPossible:]", 479);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v4 itemID];
    unsigned int v10 = [v4 providerItemIdentifier];
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2112;
    char v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - _buildCollectionOnItemIfPossible itemID = %@, providerItemIdentifier = %@%@", (uint8_t *)&v11, 0x2Au);
  }
  BOOL v7 = [(BRItemCollectionGatherer *)self _canWatchItem:v4];
  if (v7) {
    [(BRItemCollectionGatherer *)self _addItemCollectionOnItem:v4];
  }

  return v7;
}

- (id)_getAppLibraryURLFromConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(BRWatchingConfiguration *)self->_config appLibraryIDToURLMapOfSuppliedAppIDs];
  id v6 = [v5 valueForKey:v4];

  if (!v6)
  {
    BOOL v7 = [(BRWatchingConfiguration *)self->_config appLibraryIDToURLMapOfSuppliedURLs];
    id v6 = [v7 valueForKey:v4];
  }

  return v6;
}

- (void)_boostAppLibraryOfItemIfNeeded:(id)a3
{
  id v4 = [a3 fileURL];
  id v5 = objc_msgSend(v4, "br_containerID");

  if (([(NSMutableSet *)self->_boostedAppLibraries containsObject:v5] & 1) == 0)
  {
    id v6 = [(BRItemCollectionGatherer *)self _getAppLibraryURLFromConfig:v5];
    if (v6)
    {
      BOOL v7 = +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:v6];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__BRItemCollectionGatherer__boostAppLibraryOfItemIfNeeded___block_invoke;
      v8[3] = &unk_1E59AE1F8;
      id v9 = v5;
      unsigned int v10 = self;
      [v7 boostFilePresenter:v8];
    }
  }
}

void __59__BRItemCollectionGatherer__boostAppLibraryOfItemIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _boostAppLibraryOfItemIfNeeded:]_block_invoke", 512);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] boosted %@ with %@%@", (uint8_t *)&v7, 0x20u);
  }

  if (!v3) {
    [*(id *)(*(void *)(a1 + 40) + 96) addObject:*(void *)(a1 + 32)];
  }
}

- (void)_startWatchingURLs:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 520);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRItemCollectionGatherer _startWatchingURLs:]((uint64_t)self);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    id v25 = v7;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
      uint64_t v13 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 522);
      char v14 = brc_default_log(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v18 = [v12 path];
        uint64_t v19 = objc_msgSend(v18, "fp_obfuscatedPath");
        *(_DWORD *)buf = 138412802;
        id v33 = self;
        __int16 v34 = 2112;
        v35 = v19;
        __int16 v36 = 2112;
        id v37 = v13;
        _os_log_debug_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - -- _startWatchingURLsIfNeeded working on %@%@", buf, 0x20u);

        id v7 = v25;
      }

      if (v12)
      {
        if ((objc_msgSend(v12, "br_isInSyncedLocation") & 1) == 0)
        {
          brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 528);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = brc_default_log(0);
          if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
          {
            __int16 v22 = [v12 path];
            v23 = [v22 fp_obfuscatedPath];
            *(_DWORD *)buf = 138412802;
            id v33 = self;
            __int16 v34 = 2112;
            v35 = v23;
            __int16 v36 = 2112;
            id v37 = v17;
            _os_log_error_impl(&dword_19ED3F000, v21, (os_log_type_t)0x90u, "[ERROR] %@ - Can't Watch url %@ since its not in a synced location.%@", buf, 0x20u);
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        __int16 v15 = [MEMORY[0x1E4F25D40] defaultManager];
        id v27 = 0;
        v16 = [v15 itemForURL:v12 error:&v27];
        id v17 = v27;

        if (!v16)
        {
          uint64_t v21 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 535);
          __int16 v22 = brc_default_log(0);
          if (!os_log_type_enabled(v22, (os_log_type_t)0x90u)) {
            goto LABEL_20;
          }
          v23 = [v12 path];
          id v24 = objc_msgSend(v23, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138413058;
          id v33 = self;
          __int16 v34 = 2112;
          v35 = v24;
          __int16 v36 = 2112;
          id v37 = v17;
          __int16 v38 = 2112;
          uint64_t v39 = v21;
          _os_log_error_impl(&dword_19ED3F000, v22, (os_log_type_t)0x90u, "[ERROR] %@ - Can't build an fpItem for %@ - %@%@", buf, 0x2Au);

LABEL_24:
LABEL_20:

          goto LABEL_21;
        }
        [(BRItemCollectionGatherer *)self _boostAppLibraryOfItemIfNeeded:v16];
        [(BRItemCollectionGatherer *)self _startWatchingNewSubItem:v16];
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke;
  block[3] = &unk_1E59AD3B0;
  block[4] = self;
  dispatch_async(queue, block);
LABEL_22:
}

unint64_t __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  if (!result)
  {
    unint64_t result = [*((id *)*v1 + 6) watchTypes];
    if (result <= 3)
    {
      id v3 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]_block_invoke", 546);
      id v4 = brc_default_log(1);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke_cold_1();
      }

      return [*v1 _queueSignalDelegateIfNeededOnFinishGathering];
    }
  }
  return result;
}

- (void)_startWatchingAppLibraries:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v5 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]", 554);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v26 = self;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    long long v30 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ -  _startWatchingAppLibrariesIfNeeded(%@)%@", buf, 0x20u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke;
  v18[3] = &unk_1E59AF978;
  v18[4] = self;
  id v7 = (void *)MEMORY[0x19F3C48D0](v18);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2;
  v15[3] = &unk_1E59AF9A0;
  id v8 = v7;
  v15[4] = self;
  id v16 = v8;
  id v17 = &v19;
  [v4 enumerateKeysAndObjectsUsingBlock:v15];
  if ([(id)v20[5] count])
  {
    unint64_t v9 = self->_appLibrariesLookupAttempts + 1;
    self->_appLibrariesLookupAttempts = v9;
    self->_finishedLookingUpAppLibraries = 0;
    dispatch_time_t v10 = dispatch_time(0, 1000000000 * (1 << v9));
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_55;
    v14[3] = &unk_1E59AF340;
    v14[4] = self;
    v14[5] = &v19;
    dispatch_after(v10, queue, v14);
  }
  else
  {
    id v12 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]", 582);
    uint64_t v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRItemCollectionGatherer _startWatchingAppLibraries:]();
    }

    self->_finishedLookingUpAppLibraries = 1;
    [(BRItemCollectionGatherer *)self _queueSignalDelegateIfNeededOnFinishGathering];
  }

  _Block_object_dispose(&v19, 8);
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 _boostAppLibraryOfItemIfNeeded:v6];
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [v6 itemID];
  [v4 addObject:v5];

  [*(id *)(a1 + 32) _startWatchingNewSubItem:v6];
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F25D40] defaultManager];
  id v8 = [v7 itemForURL:v6 error:0];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (*(void *)(*(void *)(a1 + 32) + 128) < 7uLL)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setValue:v6 forKey:v5];
  }
  else
  {
    unint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]_block_invoke_2", 566);
    dispatch_time_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2_cold_1((uint64_t)v9, v10);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
    [*(id *)(a1 + 32) _queueSignalDelegateIfNeededOnFinishGathering];
  }
}

uint64_t __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_55(uint64_t a1)
{
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]_block_invoke", 578);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_55_cold_1();
  }

  return [*(id *)(a1 + 32) _startWatchingAppLibraries:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)startWatchingRootItemWithScopes:(id)a3
{
  id v4 = a3;
  id v5 = [[BRWatchingConfiguration alloc] initWithScopes:v4 predicate:self->_predicate];

  [(BRItemCollectionGatherer *)self _startWatchingRootItemWithConfig:v5];
  [(BRItemCollectionGatherer *)self _startObservingAccountTokenDidChangeNotification];
}

- (void)_startWatchingRootItemWithConfig:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke(uint64_t a1)
{
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingRootItemWithConfig:]_block_invoke", 612);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_2();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v6 = (id **)(a1 + 32);
  objc_storeStrong((id *)(v5 + 48), v4);
  id v7 = [(*v6)[6] urls];
  if ((unint64_t)[v7 count] < 2)
  {
    dispatch_time_t v10 = *v6;
    uint64_t v11 = [(*v6)[6] urls];
    [v10 _startWatchingURLs:v11];

    id v12 = *v6;
    id v8 = [v12[6] appLibraryIDToURLMapOfSuppliedAppIDs];
    [v12 _startWatchingAppLibraries:v8];
  }
  else
  {
    id v8 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingRootItemWithConfig:]_block_invoke", 616);
    unint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_1();
    }
  }
}

- (void)_startWatchingNewSubItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__BRItemCollectionGatherer__startWatchingNewSubItem___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__BRItemCollectionGatherer__startWatchingNewSubItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildCollectionOnItemIfPossible:*(void *)(a1 + 40)];
}

- (void)_stopWatchingItemIDRecusively:(id)a3 itemIDsInItem:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 635);
  id v8 = brc_default_log(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = self;
    __int16 v36 = 2112;
    id v37 = v6;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)v7;
    _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - stop watching itemID %@ recursively%@", buf, 0x20u);
  }

  if (v6)
  {
    [v28 addObject:v6];
    unint64_t v9 = [(NSMutableDictionary *)self->_itemIDToItemCollectionMap objectForKey:v6];
    dispatch_time_t v10 = v9;
    if (v9)
    {
      [v9 stopObserving];
      [(NSMutableSet *)self->_collectionsSet removeObject:v10];
      uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 649);
      id v12 = brc_default_log(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __int16 v26 = [v10 items];
        *(_DWORD *)buf = 138413058;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v6;
        __int16 v38 = 2112;
        unint64_t v39 = (unint64_t)v26;
        __int16 v40 = 2112;
        uint64_t v41 = v11;
        _os_log_debug_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item %@ collection childs %@%@", buf, 0x2Au);
      }
      id v27 = v6;

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v13 = [v10 items];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v19 = [v18 itemID];
            unint64_t v20 = [(BRItemCollectionGatherer *)self _itemID:v19 wasDeletedByCollection:v10];

            if (v20)
            {
              uint64_t v21 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 656);
              __int16 v22 = brc_default_log(1);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v23 = [v18 itemID];
                *(_DWORD *)buf = 138413058;
                v35 = self;
                __int16 v36 = 2112;
                id v37 = v23;
                __int16 v38 = 2048;
                unint64_t v39 = v20;
                __int16 v40 = 2112;
                uint64_t v41 = v21;
                _os_log_debug_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is owned by %lu other collections. Stopping the recursive traverse%@", buf, 0x2Au);
              }
            }
            else
            {
              uint64_t v21 = [v18 itemID];
              [(BRItemCollectionGatherer *)self _stopWatchingItemIDRecusively:v21 itemIDsInItem:v28];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      id v6 = v27;
      [(NSMutableDictionary *)self->_itemIDToItemCollectionMap removeObjectForKey:v27];
      [(BRItemCollectionGatherer *)self _removeCollectionFromGatherSet:v10];
    }
    else
    {
      id v24 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 643);
      id v25 = brc_default_log(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v6;
        __int16 v38 = 2112;
        unint64_t v39 = (unint64_t)v24;
        _os_log_debug_impl(&dword_19ED3F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - No collection found for item %@%@", buf, 0x20u);
      }
    }
  }
}

- (void)_unboostApplibrariesIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_boostedAppLibraries count])
  {
    id v3 = (void *)[(NSMutableSet *)self->_boostedAppLibraries copy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v19;
      *(void *)&long long v5 = 138412290;
      long long v14 = v5;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
          dispatch_time_t v10 = -[BRItemCollectionGatherer _getAppLibraryURLFromConfig:](self, "_getAppLibraryURLFromConfig:", v9, v14);
          if (!v10)
          {
            uint64_t v15 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _unboostApplibrariesIfNeeded]", 671);
            id v12 = brc_default_log(0);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v14;
              v23 = v15;
              _os_log_fault_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibraryURL%@", buf, 0xCu);
            }
          }
          uint64_t v11 = +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:v10];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke;
          v17[3] = &unk_1E59AE1F8;
          v17[4] = v9;
          void v17[5] = self;
          [v11 unboostFilePresenter:v17];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v13 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
        uint64_t v6 = v13;
      }
      while (v13);
    }
  }
}

void __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _unboostApplibrariesIfNeeded]_block_invoke", 675);
    id v3 = brc_default_log(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    long long v5 = *(void **)(*(void *)(a1 + 40) + 96);
    [v5 removeObject:v4];
  }
}

- (void)_invalidateAndNotifyDelegate:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke;
  v4[3] = &unk_1E59AE420;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _invalidateAndNotifyDelegate:]_block_invoke", 685);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke_cold_1();
  }

  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained itemCollectionGathererDidInvalidate];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v9++), "stopObserving", (void)v24);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 80);
  *(void *)(v16 + 80) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  uint64_t v18 = *(void *)(a1 + 32);
  long long v19 = *(void **)(v18 + 96);
  *(void *)(v18 + 96) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  long long v21 = *(void **)(v20 + 120);
  *(void *)(v20 + 120) = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 16);
  *(void *)(v22 + 16) = 0;
}

- (void)invalidate
{
}

- (void)disableUpdates
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - Disabling Updates of collections of %@%@");
}

- (void)enableUpdates
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - Enabling Updates of collections of %@%@");
}

- (void)pauseWatchingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E59AF408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer pauseWatchingWithCompletionBlock:]_block_invoke", 727);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke_cold_1();
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) stopObserving];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resumeWatching
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__BRItemCollectionGatherer_resumeWatching__block_invoke;
  block[3] = &unk_1E59AD3B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__BRItemCollectionGatherer_resumeWatching__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer resumeWatching]_block_invoke", 737);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__BRItemCollectionGatherer_resumeWatching__block_invoke_cold_1();
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) startObserving];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_queueSignalDelegateIfNeededOnFinishGathering
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BRItemCollectionGatherer__queueSignalDelegateIfNeededOnFinishGathering__block_invoke;
  block[3] = &unk_1E59AD3B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__BRItemCollectionGatherer__queueSignalDelegateIfNeededOnFinishGathering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _signalDelegateIfNeededOnFinishGathering];
}

- (BOOL)_signalDelegateIfNeededOnFinishGathering
{
  if (self->_finishedInitialGathering
    || [(NSMutableSet *)self->_waitingToBeGatheredCollections count]
    || !self->_finishedLookingUpAppLibraries)
  {
    return 0;
  }
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _signalDelegateIfNeededOnFinishGathering]", 755);
  BOOL v3 = 1;
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRItemCollectionGatherer _signalDelegateIfNeededOnFinishGathering]((uint64_t)self);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained itemCollectionGathererFinishedGathering];

  self->_finishedInitialGathering = 1;
  return v3;
}

- (void)_removeCollectionFromGatherSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_waitingToBeGatheredCollections removeObject:a3];
  if (![(BRItemCollectionGatherer *)self _signalDelegateIfNeededOnFinishGathering])
  {
    if (!self->_finishedLookingUpAppLibraries)
    {
      id v4 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _removeCollectionFromGatherSet:]", 768);
      uint64_t v5 = brc_default_log(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[BRItemCollectionGatherer _removeCollectionFromGatherSet:]();
      }
    }
    if ([(NSMutableSet *)self->_waitingToBeGatheredCollections count])
    {
      uint64_t v6 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _removeCollectionFromGatherSet:]", 771);
      uint64_t v7 = brc_default_log(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [(NSMutableSet *)self->_waitingToBeGatheredCollections anyObject];
        uint64_t v9 = [(NSMutableSet *)self->_waitingToBeGatheredCollections count];
        int v10 = 138413058;
        long long v11 = self;
        __int16 v12 = 2112;
        long long v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = v9 - 1;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - still waiting on %@ (and %lu more collections) to finish gathering%@", (uint8_t *)&v10, 0x2Au);
      }
    }
  }
}

- (unint64_t)_itemID:(id)a3 becameOwnedByCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_itemOwnersMap objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)self->_itemOwnersMap setObject:v8 forKey:v6];
  }
  [v8 addObject:v7];
  unint64_t v9 = [v8 count];

  return v9;
}

- (unint64_t)_itemID:(id)a3 wasDeletedByCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_itemOwnersMap objectForKey:v6];
  if (!v8)
  {
    long long v11 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _itemID:wasDeletedByCollection:]", 788);
    __int16 v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRItemCollectionGatherer _itemID:wasDeletedByCollection:]((uint64_t)v11, v12);
    }
  }
  [v8 removeObject:v7];
  if (![v8 count]) {
    [(NSMutableDictionary *)self->_itemOwnersMap removeObjectForKey:v6];
  }
  unint64_t v9 = [v8 count];

  return v9;
}

- (BOOL)_isItemOwnedByAnyCollection:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_itemOwnersMap objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(BRItemCollectionGatherer *)self dataForCollectionShouldBeReloaded:v5 deleteItemsWithIDs:MEMORY[0x1E4F1CBF0]];
}

- (void)dataForCollectionShouldBeReloaded:(id)a3 deleteItemsWithIDs:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableSet *)self->_collectionsSet containsObject:v6])
  {
    id v8 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer dataForCollectionShouldBeReloaded:deleteItemsWithIDs:]", 815);
    unint64_t v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412802;
      long long v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - dataForCollectionShouldBeReloaded on collection %@ - forwarding it to the didUpdate method%@", (uint8_t *)&v12, 0x20u);
    }

    int v10 = [v6 items];
    [(BRItemCollectionGatherer *)self collection:v6 didUpdateItems:v10 replaceItemsByFormerID:MEMORY[0x1E4F1CC08] deleteItemsWithIDs:v7];
  }
  else
  {
    int v10 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer dataForCollectionShouldBeReloaded:deleteItemsWithIDs:]", 812);
    long long v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      long long v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)collectionDidFinishGathering:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_collectionsSet containsObject:v4] & 1) == 0)
  {
    id WeakRetained = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 821);
    uint64_t v18 = brc_default_log(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      long long v26 = self;
      __int16 v27 = 2112;
      id v28 = v4;
      __int16 v29 = 2112;
      long long v30 = WeakRetained;
      _os_log_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  id v5 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 828);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    long long v26 = self;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    long long v30 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - collectionDidFinishGathering on %@%@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [v4 items];
  [WeakRetained itemCollectionGathererGatheredItems:v8];

  uint64_t v9 = [(NSMutableDictionary *)self->_itemIDToItemCollectionMap count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v10 = objc_msgSend(v4, "items", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        __int16 v16 = [v15 itemID];
        [(BRItemCollectionGatherer *)self _itemID:v16 becameOwnedByCollection:v4];

        [(BRItemCollectionGatherer *)self _buildCollectionOnItemIfPossible:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  BOOL finishedInitialGathering = self->_finishedInitialGathering;
  [(BRItemCollectionGatherer *)self _removeCollectionFromGatherSet:v4];
  if (!finishedInitialGathering
    && self->_finishedInitialGathering
    && v9 != [(NSMutableDictionary *)self->_itemIDToItemCollectionMap count])
  {
    uint64_t v18 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 845);
    long long v19 = brc_default_log(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRItemCollectionGatherer collectionDidFinishGathering:]((uint64_t)v18, v19);
    }

LABEL_19:
  }
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if ([(NSMutableSet *)self->_collectionsSet containsObject:v6])
  {
    int v8 = [(NSMutableSet *)self->_waitingToBeGatheredCollections containsObject:v6];
    uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 857);
    int v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      __int16 v38 = &stru_1EF11DA20;
      *(_DWORD *)v57 = 138413314;
      *(void *)&v57[4] = self;
      if (v8) {
        __int16 v38 = @" while gathering";
      }
      *(_WORD *)&v57[12] = 2112;
      *(void *)&v57[14] = v6;
      *(_WORD *)&v57[22] = 2112;
      v58 = v7;
      *(_WORD *)v59 = 2112;
      *(void *)&v59[2] = v38;
      *(_WORD *)&v59[10] = 2112;
      *(void *)&v59[12] = v9;
      _os_log_error_impl(&dword_19ED3F000, v10, (os_log_type_t)0x90u, "[ERROR] %@ - collection %@ did encounter error %@%@%@", v57, 0x34u);
    }

    *(void *)v57 = 0;
    *(void *)&v57[8] = v57;
    *(void *)&v57[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__12;
    *(void *)v59 = __Block_byref_object_dispose__12;
    *(void *)&v59[8] = 0;
    itemIDToItemCollectionMap = self->_itemIDToItemCollectionMap;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke;
    v46[3] = &unk_1E59AF9C8;
    id v12 = v6;
    id v47 = v12;
    v48 = v57;
    [(NSMutableDictionary *)itemIDToItemCollectionMap enumerateKeysAndObjectsUsingBlock:v46];
    uint64_t v13 = *(void *)(*(void *)&v57[8] + 40);
    if (!v13)
    {
      __int16 v27 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 909);
      id v28 = brc_default_log(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = self;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v12;
        __int16 v53 = 2112;
        v54 = v27;
        _os_log_fault_impl(&dword_19ED3F000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - Couldn't locate itemID for collection %@%@", buf, 0x20u);
      }

      if (v8) {
        [(BRItemCollectionGatherer *)self _removeCollectionFromGatherSet:v12];
      }
      goto LABEL_27;
    }
    failureCountByItemID = self->_failureCountByItemID;
    if (!failureCountByItemID)
    {
      id v15 = (NSMutableDictionary *)objc_opt_new();
      __int16 v16 = self->_failureCountByItemID;
      self->_failureCountByItemID = v15;

      failureCountByItemID = self->_failureCountByItemID;
      uint64_t v13 = *(void *)(*(void *)&v57[8] + 40);
    }
    id v17 = [(NSMutableDictionary *)failureCountByItemID objectForKeyedSubscript:v13];
    uint64_t v18 = [v17 longLongValue];
    long long v19 = [NSNumber numberWithUnsignedLongLong:v18];
    [(NSMutableDictionary *)self->_failureCountByItemID setObject:v19 forKeyedSubscript:*(void *)(*(void *)&v57[8] + 40)];

    uint64_t v20 = v18 + 1;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    if ((unint64_t)(v18 + 1) < 6)
    {
      if (objc_msgSend(v7, "br_isFileProviderErrorCode:", -1005))
      {
        long long v21 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 880);
        long long v22 = brc_default_log(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v29 = *(void *)(*(void *)&v57[8] + 40);
          *(_DWORD *)buf = 138412802;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = v29;
          __int16 v53 = 2112;
          v54 = v21;
          _os_log_debug_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Looks like item %@ got deleted -> recursive delete.%@", buf, 0x20u);
        }
        goto LABEL_22;
      }
      if (!objc_msgSend(v7, "br_isCocoaErrorCode:", 257))
      {
        __int16 v34 = [MEMORY[0x1E4F25D40] defaultManager];
        uint64_t v35 = *(void *)(*(void *)&v57[8] + 40);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_65;
        v41[3] = &unk_1E59AF9F0;
        v41[4] = self;
        v41[5] = v57;
        v41[6] = &v42;
        [v34 fetchItemForItemID:v35 completionHandler:v41];

        if (!*((unsigned char *)v43 + 24))
        {
          __int16 v36 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 898);
          id v37 = brc_default_log(1);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v50 = self;
            __int16 v51 = 2048;
            uint64_t v52 = v20;
            __int16 v53 = 2112;
            v54 = v36;
            _os_log_debug_impl(&dword_19ED3F000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - restart observing the collection. Failure count [%llu]%@", buf, 0x20u);
          }

          [v12 startObserving];
          goto LABEL_26;
        }
LABEL_23:
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(BRItemCollectionGatherer *)self _stopWatchingItemIDRecusively:*(void *)(*(void *)&v57[8] + 40) itemIDsInItem:v30];
        uint64_t v31 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 904);
        long long v32 = brc_default_log(1);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v39 = *(void **)(*(void *)&v57[8] + 40);
          *(_DWORD *)buf = 138413058;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v30;
          __int16 v53 = 2112;
          v54 = v39;
          __int16 v55 = 2112;
          v56 = v31;
          _os_log_debug_impl(&dword_19ED3F000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - All these items [%@] found under this item [%@] and should be deleted.%@", buf, 0x2Au);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained itemCollectionGathererDidReceiveUpdates:0 deleteItemsWithIDs:v30];

LABEL_26:
        _Block_object_dispose(&v42, 8);

LABEL_27:
        _Block_object_dispose(v57, 8);

        goto LABEL_28;
      }
      long long v21 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 883);
      long long v22 = brc_default_log(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        uint64_t v40 = *(void *)(*(void *)&v57[8] + 40);
        *(_DWORD *)buf = 138412802;
        v50 = self;
        __int16 v51 = 2112;
        uint64_t v52 = v40;
        __int16 v53 = 2112;
        v54 = v21;
        long long v24 = "[CRIT] UNREACHABLE: %@ - Looks like we don't have permission to view %@%@";
        goto LABEL_9;
      }
    }
    else
    {
      long long v21 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 877);
      long long v22 = brc_default_log(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = *(void *)(*(void *)&v57[8] + 40);
        *(_DWORD *)buf = 138412802;
        v50 = self;
        __int16 v51 = 2112;
        uint64_t v52 = v23;
        __int16 v53 = 2112;
        v54 = v21;
        long long v24 = "[CRIT] UNREACHABLE: %@ - BRItemCollectionGatherer - Repeatedly can't watch item %@%@";
LABEL_9:
        _os_log_fault_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_FAULT, v24, buf, 0x20u);
      }
    }
LABEL_22:

    *((unsigned char *)v43 + 24) = 1;
    goto LABEL_23;
  }
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 852);
  long long v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  long long v26 = brc_default_log(1);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v57 = 138412802;
    *(void *)&v57[4] = self;
    *(_WORD *)&v57[12] = 2112;
    *(void *)&v57[14] = v6;
    *(_WORD *)&v57[22] = 2112;
    v58 = v25;
    _os_log_impl(&dword_19ED3F000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", v57, 0x20u);
  }

LABEL_28:
}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_65(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]_block_invoke", 888);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v11 = 138413058;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %@ - Couldn't refresh itemID %@ error [%@]%@", (uint8_t *)&v11, 0x2Au);
    }
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v7 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]_block_invoke", 891);
    id v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_65_cold_1();
    }
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_6:
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([(NSMutableSet *)self->_collectionsSet containsObject:v9])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 932);
    __int16 v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]((uint64_t)self);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v43 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v20 = [v19 itemID];
          [(BRItemCollectionGatherer *)self _itemID:v20 becameOwnedByCollection:v9];

          [(BRItemCollectionGatherer *)self _startWatchingNewSubItem:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v16);
    }
    id v40 = v14;

    uint64_t v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v42 = v11;
    id obj = v11;
    uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v47;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(NSObject **)(*((void *)&v46 + 1) + 8 * v24);
          if (!-[BRItemCollectionGatherer _isItemOwnedByAnyCollection:](self, "_isItemOwnedByAnyCollection:", v25, v40))
          {
            id v28 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 944);
            id v30 = brc_default_log(1);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              __int16 v55 = self;
              __int16 v56 = 2112;
              v57 = v25;
              __int16 v58 = 2112;
              unint64_t v59 = (unint64_t)v28;
              _os_log_debug_impl(&dword_19ED3F000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is not known by us, ignoring it%@", buf, 0x20u);
            }

            goto LABEL_24;
          }
          unint64_t v26 = [(BRItemCollectionGatherer *)self _itemID:v25 wasDeletedByCollection:v9];
          if (v26)
          {
            unint64_t v27 = v26;
            id v28 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 952);
            uint64_t v29 = brc_default_log(1);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              __int16 v55 = self;
              __int16 v56 = 2112;
              v57 = v25;
              __int16 v58 = 2048;
              unint64_t v59 = v27;
              __int16 v60 = 2112;
              v61 = v28;
              _os_log_debug_impl(&dword_19ED3F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is being owned by %lu other collections%@", buf, 0x2Au);
            }

LABEL_24:
            goto LABEL_25;
          }
          uint64_t v31 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 949);
          long long v32 = brc_default_log(1);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v55 = self;
            __int16 v56 = 2112;
            v57 = v25;
            __int16 v58 = 2112;
            unint64_t v59 = (unint64_t)v31;
            _os_log_debug_impl(&dword_19ED3F000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is not owned by any other collection, reporting a deletion for this item%@", buf, 0x20u);
          }

          [(BRItemCollectionGatherer *)self _stopWatchingItemIDRecusively:v25 itemIDsInItem:v44];
LABEL_25:
          ++v24;
        }
        while (v22 != v24);
        uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
        uint64_t v22 = v33;
      }
      while (v33);
    }

    __int16 v34 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 956);
    uint64_t v35 = brc_default_log(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]((uint64_t)self);
    }

    __int16 v36 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 959);
    id v37 = brc_default_log(1);
    id v10 = v43;
    __int16 v38 = v44;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v55 = self;
      __int16 v56 = 2112;
      v57 = v44;
      __int16 v58 = 2112;
      unint64_t v59 = (unint64_t)obj;
      __int16 v60 = 2112;
      v61 = v36;
      _os_log_debug_impl(&dword_19ED3F000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - All these items [%@] found under these items [%@] and should be deleted.%@", buf, 0x2Au);
    }

    unint64_t v39 = WeakRetained;
    [WeakRetained itemCollectionGathererDidReceiveUpdates:v40 deleteItemsWithIDs:v44];
    id v11 = v42;
  }
  else
  {
    unint64_t v39 = brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 921);
    __int16 v38 = brc_default_log(1);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v55 = self;
      __int16 v56 = 2112;
      v57 = v9;
      __int16 v58 = 2112;
      unint64_t v59 = (unint64_t)v39;
      _os_log_impl(&dword_19ED3F000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", buf, 0x20u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTokenDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_perAppAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_failureCountByItemID, 0);
  objc_storeStrong((id *)&self->_boostedAppLibraries, 0);
  objc_storeStrong((id *)&self->_itemOwnersMap, 0);
  objc_storeStrong((id *)&self->_collectionsSet, 0);
  objc_storeStrong((id *)&self->_waitingToBeGatheredCollections, 0);
  objc_storeStrong((id *)&self->_watchedAppLibraryFPItemIDs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemIDToItemCollectionMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - Account logged out%@", (void)v3, DWORD2(v3));
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 96);
  int v4 = 138413058;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  __int16 v8 = 2112;
  uint64_t v9 = v0;
  __int16 v10 = 2112;
  uint64_t v11 = v2;
  _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - remove boosted app libraries [%@] from [%@]%@", (uint8_t *)&v4, 0x2Au);
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - Account logged in%@", (void)v3, DWORD2(v3));
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - received token change notification%@", (void)v3, DWORD2(v3));
}

void __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - NSRegularExpression matching prefix is malformed.%@", (void)v3, DWORD2(v3));
}

- (void)_startWatchingURLs:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - -- _startWatchingURLsIfNeeded%@", (void)v3, DWORD2(v3));
}

void __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ -  did not create any collection for the given urls -> signal delegate%@", (void)v3, DWORD2(v3));
}

- (void)_startWatchingAppLibraries:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - Managed to watch all the app libraries after %llu attempts%@");
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19ED3F000, a2, (os_log_type_t)0x90u, "[ERROR] Reached maximum retry attempts, giving up on retrying...%@", (uint8_t *)&v2, 0xCu);
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - Another attempt to watch the missing app libraries%@", (void)v3, DWORD2(v3));
}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] %@ - Can't watch more than one url at the same time.%@", (void)v3, DWORD2(v3));
}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - Start Watching Config %@%@");
}

void __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] Can't unboost app library %@%@", (void)v3, DWORD2(v3));
}

void __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 40);
  int v6 = 138413058;
  uint64_t v7 = v0;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  __int16 v10 = 1024;
  int v11 = v3;
  __int16 v12 = 2112;
  uint64_t v13 = v4;
  _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Invalidating the gatherer of %@ , notifyDelegate = %d%@", (uint8_t *)&v6, 0x26u);
}

void __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - stop watching the built collections%@", (void)v3, DWORD2(v3));
}

void __42__BRItemCollectionGatherer_resumeWatching__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - resume watching the built collections%@", (void)v3, DWORD2(v3));
}

- (void)_signalDelegateIfNeededOnFinishGathering
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - signaling delegate that we finished gathering on all of the initial collections.%@", (void)v3, DWORD2(v3));
}

- (void)_removeCollectionFromGatherSet:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - Still trying to lookup the app libraries with %llu attempts so far%@");
}

- (void)_itemID:(uint64_t)a1 wasDeletedByCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: itemOwners%@", (uint8_t *)&v2, 0xCu);
}

- (void)collectionDidFinishGathering:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: numberOfWatchedItemsBefore == numberOfWatchedItemsAfter%@", (uint8_t *)&v2, 0xCu);
}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - No error and no item so seems the itemID %@ got deleted -> recursive delete.%@");
}

- (void)collection:(uint64_t)a1 didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - signaling delegate about updates.%@", (void)v3, DWORD2(v3));
}

- (void)collection:(uint64_t)a1 didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - updating the internal watchers before notifying the delegate%@", (void)v3, DWORD2(v3));
}

@end