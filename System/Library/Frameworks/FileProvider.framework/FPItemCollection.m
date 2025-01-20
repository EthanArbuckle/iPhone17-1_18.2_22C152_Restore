@interface FPItemCollection
+ (BOOL)isEnumerationSuspended;
+ (id)_bouncedItem:(id)a3 withinItems:(id)a4;
+ (id)activeCollections;
+ (void)addActiveCollection:(id)a3;
+ (void)consumeUpdates:(id)a3 deletes:(id)a4;
+ (void)initialize;
+ (void)refreshActiveCollectionsForDecorationChange;
+ (void)removeActiveCollection:(id)a3;
+ (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5;
+ (void)resumeVendorEnumeration;
+ (void)suspendVendorEnumeration;
- (BOOL)__isUsingDataSource:(id)a3;
- (BOOL)_isUsingDataSource:(id)a3;
- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3;
- (BOOL)hasMoreUpdates;
- (BOOL)isCollectionValidForItem:(id)a3;
- (BOOL)isGathering;
- (BOOL)isHiddenItem:(id)a3;
- (BOOL)isImmutable;
- (BOOL)isRegatheringAfterSignal;
- (BOOL)isRootItem:(id)a3;
- (BOOL)observing;
- (BOOL)recoverFromError:(id)a3;
- (BOOL)shouldConsiderUsingPlaceholder:(id)a3 forItem:(id)a4 skipForwardFormerID:(BOOL *)a5;
- (BOOL)shouldRetryError:(id)a3;
- (BOOL)showHiddenFiles;
- (FPCollectionDataSource)dataSource;
- (FPItemCollection)init;
- (FPItemCollection)initWithPacing:(BOOL)a3;
- (FPItemCollectionMinimalDelegate)delegate;
- (FPItemID)enumeratedItemID;
- (FPPacer)updatePacer;
- (NSArray)items;
- (NSArray)sortDescriptors;
- (NSPredicate)additionalItemFilteringPredicate;
- (NSPredicate)itemFilteringPredicate;
- (NSString)domainIdentifier;
- (NSString)providerIdentifier;
- (OS_dispatch_queue)updateQueue;
- (OS_dispatch_queue)workingQueue;
- (id)_itemsMutableCopy;
- (id)_reorderWithPlaceholdersLast:(id)a3;
- (id)_t_items;
- (id)computeIndexPathsBasedDiffsWithOldItems:(id)a3 futureItems:(id)a4;
- (id)computeItemIDBasedDiffs;
- (id)createDataSourceWithSortDescriptors:(id)a3;
- (id)indexPathFromIndex:(int64_t)a3;
- (id)indexPathsFromIndexSet:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)scopedSearchQuery;
- (int64_t)_numberOfItems;
- (int64_t)numberOfItems;
- (unint64_t)_indexOfItem:(id)a3;
- (unint64_t)_indexOfItemID:(id)a3;
- (unint64_t)lastForcedUpdate;
- (void)_cancelStartTime;
- (void)_flushPendingUpdates;
- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4;
- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 dropForReplacedPlaceholders:(BOOL)a5;
- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 forceFlush:(BOOL)a5 dropForReplacedPlaceholders:(BOOL)a6;
- (void)_replaceContentsWithVendorItems:(id)a3;
- (void)_restartObservation;
- (void)_restartObservationWithReason:(id)a3;
- (void)_setObserving:(BOOL)a3;
- (void)_startObserving;
- (void)_startRegathering;
- (void)_updateObservedItem:(id)a3;
- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6;
- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5;
- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4;
- (void)dealloc;
- (void)forceRefreshOfItemWithItemID:(id)a3;
- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4;
- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4;
- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 hasMoreChanges:(BOOL)a5;
- (void)reorderItemsWithSortDescriptors:(id)a3;
- (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5;
- (void)resumeUpdates;
- (void)sendIndexPathBasedDiffs:(id)a3;
- (void)sendItemIDBasedDiffs:(id)a3;
- (void)setAdditionalItemFilteringPredicate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGathering:(BOOL)a3;
- (void)setItemFilteringPredicate:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setShowHiddenFiles:(BOOL)a3;
- (void)setWorkingQueue:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)suspendUpdates;
@end

@implementation FPItemCollection

uint64_t __34__FPItemCollection_startObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (BOOL)isGathering
{
  return self->_gathering;
}

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
}

uint64_t __43__FPItemCollection_removeActiveCollection___block_invoke(uint64_t a1)
{
  [(id)_activeCollections removeObject:*(void *)(a1 + 32)];
  uint64_t result = [(id)_activeCollections count];
  if (!result)
  {
    v2 = (void *)_indexingAssertion;
    return [v2 stop];
  }
  return result;
}

void __40__FPItemCollection_addActiveCollection___block_invoke(uint64_t a1)
{
  [(id)_activeCollections addObject:*(void *)(a1 + 32)];
  if ([(id)_activeCollections count] == 1)
  {
    v1 = (void *)_indexingAssertion;
    if (_indexingAssertion)
    {
      [v1 start];
    }
    else if ((_isFetchingIndexingAssertion & 1) == 0)
    {
      _isFetchingIndexingAssertion = 1;
      id v2 = +[FPDaemonConnection sharedConnectionProxy];
      [v2 forceIndexingInForeground:0 completionHandler:&__block_literal_global_224];
    }
  }
}

uint64_t __34__FPItemCollection__numberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_flushPendingUpdates
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 128);
  int v4 = 134218498;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_debug_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx flushing pending updates for %@, generation %d", (uint8_t *)&v4, 0x1Cu);
}

- (int64_t)_numberOfItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__FPItemCollection__numberOfItems__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startRegathering
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_4(&dword_1A33AE000, v0, v1, "[DEBUG] regathering %@ (generation %d)");
}

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 forceFlush:(BOOL)a5 dropForReplacedPlaceholders:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v120 = a5;
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  obuint64_t j = v9;
  if (self->_observing)
  {
    uint64_t v11 = [v9 count];
    v121 = v10;
    uint64_t v12 = [v10 count];
    sectiouint64_t n = __fp_create_section();
    v13 = fp_current_or_default_log();
    uint64_t v14 = v12 + v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      *(void *)v178 = section;
      *(_WORD *)&v178[8] = 2048;
      uint64_t v179 = v14;
      *(_WORD *)v180 = 2048;
      *(void *)&v180[2] = [v10 count];
      __int16 v181 = 2112;
      v182 = self;
      __int16 v183 = 1024;
      BOOL v184 = v120;
      _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received %ld updates (deleted %ld) for %@ (forceFlush:%d)", buf, 0x30u);
    }
    uint64_t v119 = v14;
    v136 = self;

    v131 = objc_opt_new();
    v15 = self;
    if ([obj count] == 1 && !objc_msgSend(v10, "count"))
    {
      v24 = [obj objectAtIndexedSubscript:0];
      BOOL v16 = [(FPItemCollection *)self isRootItem:v24];

      v15 = self;
    }
    else
    {
      BOOL v16 = 0;
    }
    BOOL v118 = v16;
    int v17 = !v15->_regathering || v16;
    if (v17 != 1 || v6)
    {
      v18 = +[FPStitchingManager sharedInstance];
      v19 = [v18 allPlaceholderItemsByParentIdentifierAndName];

      if ([v19 count])
      {
        v20 = (void *)MEMORY[0x1E4F1CA48];
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          id v22 = v21;
        }
        else
        {
          id v21 = [v19 allValues];
          id v22 = [v20 arrayWithArray:v21];
        }
        long long v164 = 0u;
        long long v165 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        id v25 = obj;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v162 objects:v176 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v163;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v163 != v27) {
                objc_enumerationMutation(v25);
              }
              uint64_t v29 = *(void *)(*((void *)&v162 + 1) + 8 * i);
              v30 = +[FPStitchingManager parentIdNameKeyForItem:v29];
              v31 = [v19 objectForKey:v30];
              BOOL v32 = v31 == 0;

              if (v32) {
                [v22 addObject:v29];
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v162 objects:v176 count:16];
          }
          while (v26);
        }

        obuint64_t j = v22;
      }
      v33 = +[FPStitchingManager sharedInstance];
      v34 = [v33 allDeletedIDs];

      if ([v34 count])
      {
        uint64_t v35 = [v121 arrayByAddingObjectsFromArray:v34];

        v121 = (void *)v35;
      }
    }
    if (v6)
    {
      v137 = objc_opt_new();
      v36 = +[FPStitchingManager sharedInstance];
      v37 = [v36 allPlaceholderReplacementsIDs];

      v38 = objc_opt_new();
      long long v160 = 0u;
      long long v161 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v39 = obj;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v158 objects:v175 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v159;
        do
        {
          for (uint64_t j = 0; j != v40; ++j)
          {
            if (*(void *)v159 != v41) {
              objc_enumerationMutation(v39);
            }
            v43 = *(void **)(*((void *)&v158 + 1) + 8 * j);
            v44 = [v43 formerItemID];
            if (v44)
            {
              v45 = [v43 itemID];
              int v46 = [v37 containsObject:v45];

              if (v46)
              {
                v47 = [v43 formerItemID];
                [v38 addObject:v47];
              }
            }
          }
          uint64_t v40 = [v39 countByEnumeratingWithState:&v158 objects:v175 count:16];
        }
        while (v40);
      }

      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      id v48 = v39;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v154 objects:v174 count:16];
      if (v49)
      {
        uint64_t v50 = *(void *)v155;
        do
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v155 != v50) {
              objc_enumerationMutation(v48);
            }
            v52 = *(void **)(*((void *)&v154 + 1) + 8 * k);
            v53 = [v52 itemID];
            int v54 = [v38 containsObject:v53];

            if (v54)
            {
              v55 = fp_current_or_default_log();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v178 = v52;
                _os_log_debug_impl(&dword_1A33AE000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Dropping placeholder %@ as it has already been replaced.", buf, 0xCu);
              }
            }
            else
            {
              [v137 addObject:v52];
            }
          }
          uint64_t v49 = [v48 countByEnumeratingWithState:&v154 objects:v174 count:16];
        }
        while (v49);
      }

      obuint64_t j = v137;
    }
    v56 = +[FPStitchingManager sharedInstance];
    v127 = [v56 stitchedFieldsAndItemsByItemIDs];

    v57 = +[FPStitchingManager sharedInstance];
    v58 = [(FPItemCollection *)v136 enumeratedItemID];
    v122 = [v57 stitchedItemsForParentID:v58];

    if ([v122 count])
    {
      v59 = fp_current_or_default_log();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        v60 = [(FPItemCollection *)v136 enumeratedItemID];
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.6(v60, (uint64_t)v122, (uint64_t)v173, v59);
      }

      v61 = [MEMORY[0x1E4F1CA48] arrayWithArray:obj];
      v62 = objc_msgSend(obj, "fp_itemIDs");
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v63 = v122;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v150 objects:v172 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v151;
        do
        {
          for (uint64_t m = 0; m != v64; ++m)
          {
            if (*(void *)v151 != v65) {
              objc_enumerationMutation(v63);
            }
            v67 = *(void **)(*((void *)&v150 + 1) + 8 * m);
            v68 = [v67 itemID];
            char v69 = [v62 containsObject:v68];

            if (v69)
            {
              v70 = fp_current_or_default_log();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v178 = v67;
                _os_log_debug_impl(&dword_1A33AE000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] Dropping stitched item already in update: %@", buf, 0xCu);
              }
            }
            else
            {
              [v61 addObject:v67];
            }
          }
          uint64_t v64 = [v63 countByEnumeratingWithState:&v150 objects:v172 count:16];
        }
        while (v64);
      }

      id v71 = v61;
    }
    else
    {
      id v71 = obj;
    }
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    obuint64_t j = v71;
    uint64_t v72 = [obj countByEnumeratingWithState:&v146 objects:v171 count:16];
    if (v72)
    {
      unsigned int v123 = 0;
      uint64_t v126 = *(void *)v147;
      do
      {
        uint64_t v73 = 0;
        unsigned int v135 = v123;
        v123 += v72;
        uint64_t v128 = v72;
        do
        {
          if (*(void *)v147 != v126) {
            objc_enumerationMutation(obj);
          }
          uint64_t v134 = v73;
          v74 = *(void **)(*((void *)&v146 + 1) + 8 * v73);
          context = (void *)MEMORY[0x1A6248870]();
          if (v135 <= 0x13)
          {
            v75 = fp_current_or_default_log();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v178 = v74;
              _os_log_debug_impl(&dword_1A33AE000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item: %@", buf, 0xCu);
            }
          }
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          v76 = [v74 itemID];
          v77 = [v127 objectForKeyedSubscript:v76];

          uint64_t v78 = [v77 countByEnumeratingWithState:&v142 objects:v170 count:16];
          if (v78)
          {
            uint64_t v79 = *(void *)v143;
            do
            {
              for (uint64_t n = 0; n != v78; ++n)
              {
                if (*(void *)v143 != v79) {
                  objc_enumerationMutation(v77);
                }
                v81 = *(void **)(*((void *)&v142 + 1) + 8 * n);
                v82 = [v81 objectForKeyedSubscript:@"FPStitchingSessionFields"];
                v83 = [v81 objectForKeyedSubscript:@"FPStitchingSessionItemKey"];
                v84 = fp_current_or_default_log();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                {
                  v85 = [v74 itemID];
                  -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.5(v85, v168, &v169, v84);
                }

                [v74 overrideFields:v82 ofItem:v83];
              }
              uint64_t v78 = [v77 countByEnumeratingWithState:&v142 objects:v170 count:16];
            }
            while (v78);
          }

          v86 = [v74 itemID];
          v87 = [v86 providerID];

          v88 = [v131 objectForKeyedSubscript:v87];
          if (!v88)
          {
            v89 = NSNumber;
            v90 = +[FPReachabilityMonitor sharedReachabilityMonitor];
            v88 = objc_msgSend(v89, "numberWithBool:", objc_msgSend(v90, "isNetworkReachableForBundle:", v87));

            [v131 setObject:v88 forKeyedSubscript:v87];
          }
          objc_msgSend(v74, "setOffline:", objc_msgSend(v88, "BOOLValue") ^ 1);
          v91 = [v74 parentItemIdentifier];
          if (![v91 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
          {

LABEL_99:
            if ([(FPItemCollection *)v136 isRootItem:v74])
            {
              [(FPItemCollection *)v136 _updateObservedItem:v74];
              goto LABEL_121;
            }
            v132 = [v74 itemID];
            v95 = v136;
            objc_sync_enter(v95);
            v130 = v136->_itemFilteringPredicate;
            v129 = v136->_additionalItemFilteringPredicate;
            objc_sync_exit(v95);

            BOOL v96 = [(FPItemCollection *)v95 isCollectionValidForItem:v74];
            if (v96 && (!v130 || [(NSPredicate *)v130 evaluateWithObject:v74]))
            {
              if (v129)
              {
                HIDWORD(v125) = [(NSPredicate *)v129 evaluateWithObject:v74];
                LODWORD(v125) = 1;
              }
              else
              {
                uint64_t v125 = 0x100000001;
              }
            }
            else
            {
              uint64_t v125 = 0;
            }
            BOOL v97 = [(FPItemCollection *)v95 isHiddenItem:v74];
            v98 = [v74 formerItemID];
            if ((v96 & v125 & HIDWORD(v125)) == 1 && (!v97 || v136->_showHiddenFiles))
            {
              v99 = [(NSMutableDictionary *)v136->_formerItemsIdentifiers objectForKey:v132];

              if (v99)
              {
                v100 = fp_current_or_default_log();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v178 = v132;
                  v101 = v100;
                  v102 = "[DEBUG] not interested in superseded itemID %@";
                  uint32_t v103 = 12;
                  goto LABEL_129;
                }
                goto LABEL_119;
              }
              if (v98)
              {
                [(NSMutableDictionary *)v136->_formerItemsIdentifiers setObject:v132 forKey:v98];
                [(NSMutableDictionary *)v136->_updatedItemsByIdentifiers removeObjectForKey:v98];
              }
              [(NSMutableDictionary *)v136->_updatedItemsByIdentifiers setObject:v74 forKeyedSubscript:v132];
              [(NSMutableSet *)v136->_deletedItemsIdentifiers removeObject:v132];
            }
            else
            {
              if ([(FPItemCollection *)v95 _indexOfItem:v74] == 0x7FFFFFFFFFFFFFFFLL)
              {
                v100 = fp_current_or_default_log();
                if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_119;
                }
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)v178 = v96;
                *(_WORD *)&v178[4] = 1024;
                *(_DWORD *)&v178[6] = v125;
                LOWORD(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 2) = HIDWORD(v125);
                HIWORD(v179) = 1024;
                *(_DWORD *)v180 = v97;
                v101 = v100;
                v102 = "[DEBUG] not interested in item (validForCollection: %{BOOL}d, predicate1: %{BOOL}d, predicate2: %"
                       "{BOOL}d, hidden: %{BOOL}d)";
              }
              else
              {
                [(NSMutableDictionary *)v136->_updatedItemsByIdentifiers removeObjectForKey:v132];
                [(NSMutableSet *)v136->_deletedItemsIdentifiers addObject:v132];
                if (v98)
                {
                  [(NSMutableSet *)v136->_deletedItemsIdentifiers addObject:v98];
                  [(NSMutableDictionary *)v136->_formerItemsIdentifiers setObject:v132 forKey:v98];
                }
                v100 = fp_current_or_default_log();
                if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_119;
                }
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)v178 = v96;
                *(_WORD *)&v178[4] = 1024;
                *(_DWORD *)&v178[6] = v125;
                LOWORD(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 2) = HIDWORD(v125);
                HIWORD(v179) = 1024;
                *(_DWORD *)v180 = v97;
                v101 = v100;
                v102 = "[DEBUG] removing item because it isn't not interesting anymore (validForCollection: %{BOOL}d, pre"
                       "dicate1: %{BOOL}d, predicate2: %{BOOL}d, hidden: %{BOOL}d)";
              }
              uint32_t v103 = 26;
LABEL_129:
              _os_log_debug_impl(&dword_1A33AE000, v101, OS_LOG_TYPE_DEBUG, v102, buf, v103);
LABEL_119:
            }
            goto LABEL_121;
          }
          int v92 = [v74 isFolder];

          if (!v92) {
            goto LABEL_99;
          }
          v93 = [(FPAppRegistry *)v136->_appRegistry promoteItemToAppLibraryIfNeeded:v74];
          BOOL v94 = v93 == 0;

          if (!v94) {
            goto LABEL_99;
          }
LABEL_121:

          ++v135;
          uint64_t v73 = v134 + 1;
        }
        while (v134 + 1 != v128);
        uint64_t v72 = [obj countByEnumeratingWithState:&v146 objects:v171 count:16];
      }
      while (v72);
    }

    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v10 = v121;
    uint64_t v104 = [v10 countByEnumeratingWithState:&v138 objects:v167 count:16];
    if (v104)
    {
      uint64_t v105 = *(void *)v139;
      do
      {
        for (iuint64_t i = 0; ii != v104; ++ii)
        {
          if (*(void *)v139 != v105) {
            objc_enumerationMutation(v10);
          }
          uint64_t v107 = *(void *)(*((void *)&v138 + 1) + 8 * ii);
          v108 = (void *)MEMORY[0x1A6248870]();
          [(NSMutableDictionary *)v136->_updatedItemsByIdentifiers removeObjectForKey:v107];
          [(NSMutableSet *)v136->_deletedItemsIdentifiers addObject:v107];
          v109 = fp_current_or_default_log();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v178 = v107;
            _os_log_debug_impl(&dword_1A33AE000, v109, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted item: %@", buf, 0xCu);
          }

          v110 = [(NSMutableDictionary *)v136->_formerItemsIdentifiers objectForKey:v107];
          if (v110)
          {
            [(NSMutableDictionary *)v136->_updatedItemsByIdentifiers removeObjectForKey:v110];
            [(NSMutableSet *)v136->_deletedItemsIdentifiers addObject:v110];
            v111 = fp_current_or_default_log();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v178 = v110;
              _os_log_debug_impl(&dword_1A33AE000, v111, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted item: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v104 = [v10 countByEnumeratingWithState:&v138 objects:v167 count:16];
      }
      while (v104);
    }

    v112 = +[FPProgressManager defaultManager];
    [v112 attachProgressToItemsIfNeeded:obj];

    int v113 = !v118;
    if (!v119) {
      int v113 = 0;
    }
    if (!v136->_gathering)
    {
      if (!v136->_regathering) {
        goto LABEL_150;
      }
      int v113 = 0;
    }
    if (!v136->_hasMoreUpdates)
    {
      v115 = fp_current_or_default_log();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.4();
      }

      goto LABEL_156;
    }
LABEL_150:
    if (!v113)
    {
      uint64_t v114 = fp_current_or_default_log();
      if (os_log_type_enabled((os_log_t)v114, OS_LOG_TYPE_DEBUG)) {
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:]();
      }
      goto LABEL_160;
    }
LABEL_156:
    v116 = fp_current_or_default_log();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
      -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:]();
    }

    v136->_flushableRegatheringGeneratiouint64_t n = v136->_regatheringGeneration;
    updatePacer = v136->_updatePacer;
    if (!v120)
    {
      [(FPPacer *)updatePacer signalWithTransferredQoSIfImmediate];
      goto LABEL_162;
    }
    uint64_t v114 = [(FPPacer *)updatePacer eventBlock];
    (*(void (**)(void))(v114 + 16))();
LABEL_160:

LABEL_162:
    __fp_leave_section_Debug((uint64_t)&section);
    goto LABEL_163;
  }
  v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:]();
  }

LABEL_163:
}

- (BOOL)isRootItem:(id)a3
{
  return 0;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  return 1;
}

- (BOOL)isHiddenItem:(id)a3
{
  id v3 = a3;
  if (([v3 fileSystemFlags] & 8) != 0) {
    goto LABEL_5;
  }
  uint64_t v4 = [v3 creationDate];
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = (void *)v4;
  BOOL v6 = [v3 creationDate];
  [v6 timeIntervalSinceNow];
  double v8 = fabs(v7);

  if (v8 >= 10.0) {
    goto LABEL_6;
  }
  id v9 = [v3 filename];
  id v10 = [v9 pathExtension];
  char v11 = [v10 hasPrefix:@"sb-"];

  if (v11) {
LABEL_5:
  }
    BOOL v12 = 1;
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (FPItemID)enumeratedItemID
{
  return (FPItemID *)objc_getProperty(self, a2, 200, 1);
}

- (id)_reorderWithPlaceholdersLast:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "state", (void)v12))
        {

          id v9 = objc_msgSend(v3, "fp_filter:", &__block_literal_global_172);
          id v10 = objc_msgSend(v3, "fp_filter:", &__block_literal_global_174);
          id v8 = [v9 arrayByAddingObjectsFromArray:v10];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = v3;
LABEL_11:

  return v8;
}

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 dropForReplacedPlaceholders:(BOOL)a5
{
}

- (NSPredicate)itemFilteringPredicate
{
  return self->_itemFilteringPredicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setItemFilteringPredicate:(id)a3
{
}

uint64_t __63__FPItemCollection_refreshActiveCollectionsForDecorationChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartObservationWithReason:@"decorations updated"];
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v27 = *(void *)(a1 + 64);
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_3();
  }

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__17;
  id v25 = __Block_byref_object_dispose__17;
  id v26 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 40);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __40__FPItemCollection__flushPendingUpdates__block_invoke_187;
  uint64_t v17 = &unk_1E5AF17F8;
  v20 = &v21;
  uint64_t v18 = v3;
  id v19 = *(id *)(a1 + 40);
  dispatch_sync(v4, &v14);
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_2();
  }

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_msgSend((id)v22[5], "itemIDsDifferenceWithList:", *(void *)(a1 + 40), v14, v15, v16, v17, v18);
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
      [v10 dataForCollectionShouldBeReloaded:*(void *)(a1 + 32) deleteItemsWithIDs:v9];
    }
    else
    {
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
      objc_msgSend(v9, "dataForCollectionShouldBeReloaded:", *(void *)(a1 + 32), v14, v15, v16, v17, v18);
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "containsChanges", v14, v15, v16, v17, v18))
    {
      id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));

      if (v11) {
        [*(id *)(a1 + 32) sendIndexPathBasedDiffs:*(void *)(a1 + 48)];
      }
    }
    if ([*(id *)(a1 + 56) containsChanges])
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));

      if (v12) {
        [*(id *)(a1 + 32) sendItemIDBasedDiffs:*(void *)(a1 + 56)];
      }
    }
  }
  if (*(unsigned char *)(a1 + 73))
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"gathering"];
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = 0;
    [*(id *)(a1 + 32) didChangeValueForKey:@"gathering"];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    if (objc_opt_respondsToSelector()) {
      [v13 collectionDidFinishGathering:*(void *)(a1 + 32)];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 224) resume];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 216));

  _Block_object_dispose(&v21, 8);
  __fp_leave_section_Debug((uint64_t)&v27);
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_187(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  uint64_t v2 = a1 + 48;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  [*v1 willChangeValueForKey:@"_t_items"];
  objc_storeStrong((id *)*v1 + 3, v1[1]);
  [*v1 didChangeValueForKey:@"_t_items"];
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __40__FPItemCollection__flushPendingUpdates__block_invoke_187_cold_1((uint64_t *)v1, v2, v3);
  }
}

void __33__FPItemCollection_stopObserving__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 180))
  {
    *(unsigned char *)(v1 + 180) = 0;
    id v7 = *(id *)(*(void *)(a1 + 32) + 16);
    [v7 invalidate];
    [v7 setDelegate:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    +[FPItemCollection removeActiveCollection:*(void *)(a1 + 32)];
    uint64_t v5 = +[FPReachabilityMonitor sharedReachabilityMonitor];
    [v5 removeObserver:*(void *)(a1 + 32)];

    [*(id *)(*(void *)(a1 + 32) + 224) suspend];
  }
  else
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __33__FPItemCollection_stopObserving__block_invoke_cold_1();
    }
  }
}

- (void)_startObserving
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] collection is already being observed", v2, v3, v4, v5, v6);
}

+ (void)addActiveCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _collectionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FPItemCollection_addActiveCollection___block_invoke;
  block[3] = &unk_1E5AF0FF0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (void)setAdditionalItemFilteringPredicate:(id)a3
{
}

+ (void)removeActiveCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _collectionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FPItemCollection_removeActiveCollection___block_invoke;
  block[3] = &unk_1E5AF0FF0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (FPItemCollection)initWithPacing:(BOOL)a3
{
  BOOL v3 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FPItemCollection;
  uint64_t v4 = [(FPItemCollection *)&v40 init];
  id v5 = v4;
  if (v4)
  {
    v4->_gathering = 1;
    v4->_regathering = 1;
    v4->_hasMoreUpdates = 1;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByDisplayName");
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v6;

    v5->_shouldRetryOnceAfterCrash = 1;
    uint64_t v8 = objc_opt_new();
    updatedItemsByIdentifiers = v5->_updatedItemsByIdentifiers;
    v5->_updatedItemsByIdentifiers = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    deletedItemsIdentifiers = v5->_deletedItemsIdentifiers;
    v5->_deletedItemsIdentifiers = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    formerItemsIdentifiers = v5->_formerItemsIdentifiers;
    v5->_formerItemsIdentifiers = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    pendingItemsStitching = v5->_pendingItemsStitching;
    v5->_pendingItemsStitching = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    pendingItemsFields = v5->_pendingItemsFields;
    v5->_pendingItemsFields = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_alloc_init(_FPItemList);
    currentItems = v5->_currentItems;
    v5->_currentItems = v18;

    objc_storeStrong((id *)&v5->_workingQueue, MEMORY[0x1E4F14428]);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.item-access-queue", v20);
    itemAccessQueue = v5->_itemAccessQueue;
    v5->_itemAccessQueue = (OS_dispatch_queue *)v21;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.FileProvider.ItemCollection.update-queue (%p)", v5);
    id v23 = objc_claimAutoreleasedReturnValue();
    v24 = (const char *)[v23 UTF8String];
    id v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (itemCollectionUpdateQueue_once != -1) {
      dispatch_once(&itemCollectionUpdateQueue_once, &__block_literal_global_427);
    }
    id v26 = (id)itemCollectionUpdateQueue_updateQueue;
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = (OS_dispatch_queue *)v27;

    if (v3) {
      double v29 = 0.5;
    }
    else {
      double v29 = 0.0;
    }
    v30 = [[FPPacer alloc] initWithName:@"com.apple.FileProvider.ItemCollection.update-pacer" queue:v5->_updateQueue minFireInterval:v29];
    updatePacer = v5->_updatePacer;
    v5->_updatePacer = v30;

    locatiouint64_t n = 0;
    objc_initWeak(&location, v5);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __35__FPItemCollection_initWithPacing___block_invoke;
    v37[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v38, &location);
    [(FPPacer *)v5->_updatePacer setEventBlock:v37];
    uint64_t v32 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    itemFilteringPredicate = v5->_itemFilteringPredicate;
    v5->_itemFilteringPredicate = (NSPredicate *)v32;

    uint64_t v34 = +[FPAppRegistry sharedRegistry];
    appRegistry = v5->_appRegistry;
    v5->_appRegistry = (FPAppRegistry *)v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v8 = a3;
  objc_storeWeak((id *)&self->_delegate, v8);
  if (v8)
  {
    if ([v8 conformsToProtocol:&unk_1EF6D5348]) {
      uint64_t v4 = v8;
    }
    else {
      uint64_t v4 = 0;
    }
    objc_storeWeak((id *)&self->_itemIDBasedDelegate, v4);
    int v5 = [v8 conformsToProtocol:&unk_1EF6DDD08];
    p_indexPathBasedDelegate = &self->_indexPathBasedDelegate;
    if (v5)
    {
      id v7 = v8;
      goto LABEL_9;
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_itemIDBasedDelegate, 0);
    p_indexPathBasedDelegate = &self->_indexPathBasedDelegate;
  }
  id v7 = 0;
LABEL_9:
  objc_storeWeak((id *)p_indexPathBasedDelegate, v7);
}

- (NSArray)items
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  id v11 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__FPItemCollection_items__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __70__FPItemCollection_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isRegatheringAfterSignal] & 1) == 0)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allObjects", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 setOffline:*(unsigned char *)(a1 + 40) == 0];
          if (([v8 isDownloading] & 1) != 0 || objc_msgSend(v8, "isUploading")) {
            [v2 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    if ([v2 count]) {
      [*(id *)(a1 + 32) receivedBatchWithUpdatedItems:v2 deletedItemsIdentifiers:MEMORY[0x1E4F1CBF0]];
    }
  }
}

void __25__FPItemCollection_items__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isRegatheringAfterSignal
{
  return !self->_gathering && self->_regathering;
}

- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  updateQueue = self->_updateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__FPItemCollection_dataSource_replaceContentsWithItems_hasMoreChanges___block_invoke;
  v13[3] = &unk_1E5AF2F60;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a5;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(updateQueue, v13);
}

+ (void)initialize
{
  if (initialize_once_0 != -1) {
    dispatch_once(&initialize_once_0, &__block_literal_global_33);
  }
}

uint64_t __50__FPItemCollection__restartObservationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__FPItemCollection__restartObservationWithReason___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _restartObservation];
}

- (void)_restartObservation
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ restarting observation", v2, v3, v4, v5, v6);
}

- (void)startObserving
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: don't start immediately, start is throttled", v2, v3, v4, v5, v6);
}

- (void)stopObserving
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] stop observing %@", v2, v3, v4, v5, v6);
}

- (void)_cancelStartTime
{
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    dispatch_source_cancel(restartTimer);
    uint64_t v4 = self->_restartTimer;
    self->_restartTimer = 0;
  }
}

void __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke_cold_1();
  }

  if (([*(id *)(a1 + 40) isEqualToArray:v2] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    if ([*(id *)(a1 + 32) _numberOfItems])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
      int v4 = [*(id *)(a1 + 32) hasMoreUpdates];
      uint64_t v5 = *(void **)(a1 + 32);
      if (v4) {
        [v5 _restartObservationWithReason:@"sort order changed"];
      }
      else {
        [v5 _flushPendingUpdates];
      }
    }
  }
}

- (void)reorderItemsWithSortDescriptors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    updateQueue = self->_updateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke;
    v7[3] = &unk_1E5AF0748;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(updateQueue, v7);
  }
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (FPItemCollection)init
{
  return [(FPItemCollection *)self initWithPacing:1];
}

+ (void)refreshActiveCollectionsForDecorationChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [a1 activeCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v7 workingQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__FPItemCollection_refreshActiveCollectionsForDecorationChange__block_invoke;
        block[3] = &unk_1E5AF0FF0;
        void block[4] = v7;
        dispatch_async(v8, block);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

+ (id)activeCollections
{
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__17;
  id v9 = __Block_byref_object_dispose__17;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FPItemCollection_activeCollections__block_invoke;
  block[3] = &unk_1E5AF1950;
  void block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__FPItemCollection_initWithPacing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _flushPendingUpdates];
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(void *)(a1 + 40)))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 48), "fp_isSyncAnchorExpiredError");
    uint64_t v3 = *(void **)(a1 + 32);
    if (v2)
    {
      [v3 _startRegathering];
      uint64_t v4 = *(void **)(a1 + 32);
      [v4 _restartObservationWithReason:@"sync anchor expired"];
    }
    else
    {
      uint64_t v5 = v3[4];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2;
      v6[3] = &unk_1E5AF0748;
      v6[4] = v3;
      id v7 = *(id *)(a1 + 48);
      dispatch_async(v5, v6);
    }
  }
}

uint64_t __71__FPItemCollection_dataSource_replaceContentsWithItems_hasMoreChanges___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(void *)(a1 + 40));
  if (result)
  {
    [*(id *)(a1 + 32) _startRegathering];
    *(unsigned char *)(*(void *)(a1 + 32) + 178) = *(unsigned char *)(a1 + 56);
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    return [v3 _receivedBatchWithUpdatedItems:v4 deletedItemsIdentifiers:v5];
  }
  return result;
}

- (BOOL)__isUsingDataSource:(id)a3
{
  return self->_observing && self->_dataSource == a3;
}

- (void)_restartObservationWithReason:(id)a3
{
  id v4 = a3;
  workingQueue = self->_workingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__FPItemCollection__restartObservationWithReason___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workingQueue, v7);
}

- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4
{
  updateQueue = self->_updateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__FPItemCollection_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke;
  v5[3] = &unk_1E5AF25D0;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(updateQueue, v5);
}

- (BOOL)observing
{
  return self->_observing;
}

- (FPCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"FPItemCollection.m", 608, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(updateQueue, block);
}

uint64_t __37__FPItemCollection_activeCollections__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)_activeCollections copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __40__FPItemCollection_addActiveCollection___block_invoke_3(uint64_t a1)
{
  _isFetchingIndexingAssertiouint64_t n = 0;
  objc_storeStrong((id *)&_indexingAssertion, *(id *)(a1 + 32));
  uint64_t result = [(id)_activeCollections count];
  if (result)
  {
    int v2 = (void *)_indexingAssertion;
    return [v2 start];
  }
  return result;
}

void __30__FPItemCollection_initialize__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_activeCollections;
  _activeCollections = v0;

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("collections-queue", v4);
  uint64_t v3 = (void *)_collectionsQueue;
  _collectionsQueue = (uint64_t)v2;
}

void __40__FPItemCollection_addActiveCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _collectionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FPItemCollection_addActiveCollection___block_invoke_3;
  block[3] = &unk_1E5AF0FF0;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

- (void)setWorkingQueue:(id)a3
{
}

void __34__FPItemCollection_startObserving__block_invoke_135(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __34__FPItemCollection_startObserving__block_invoke_135_cold_1();
    }

    [WeakRetained _cancelStartTime];
    uint64_t v3 = WeakRetained[27];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__FPItemCollection_startObserving__block_invoke_136;
    block[3] = &unk_1E5AF0FF0;
    void block[4] = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __34__FPItemCollection_startObserving__block_invoke_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (BOOL)recoverFromError:(id)a3
{
  return 0;
}

- (BOOL)shouldRetryError:(id)a3
{
  return objc_msgSend(a3, "fp_isRemoteCrashError");
}

- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__FPItemCollection_dataSource_receivedUpdatedItems_deletedItems_hasMoreChanges___block_invoke;
  block[3] = &unk_1E5AF4208;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a6;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(updateQueue, block);
}

uint64_t __80__FPItemCollection_dataSource_receivedUpdatedItems_deletedItems_hasMoreChanges___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(void *)(a1 + 40));
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 178) = *(unsigned char *)(a1 + 64);
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _receivedBatchWithUpdatedItems:v4 deletedItemsIdentifiers:v5];
  }
  return result;
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[136] && (uint64_t v4 = (id *)(a1 + 40), [v2 shouldRetryError:*(void *)(a1 + 40)]))
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_2((uint64_t)v3, v4);
    }

    *((unsigned char *)*v3 + 136) = 0;
    [*v3 _restartObservation];
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_1((uint64_t)v3, a1);
    }

    if (([*(id *)(a1 + 32) recoverFromError:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v7 = [*v3 delegate];
      [*v3 stopObserving];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "fp_unwrappedInternalError");
        [v7 collection:v8 didEncounterError:v9];
      }
    }
  }
}

- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3
{
  return 0;
}

- (void)suspendUpdates
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPItemCollection_suspendUpdates__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __34__FPItemCollection_suspendUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) suspend];
}

- (void)resumeUpdates
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPItemCollection_resumeUpdates__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __33__FPItemCollection_resumeUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) resume];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] dealloc %@", v2, v3, v4, v5, v6);
}

- (int64_t)numberOfItems
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);

  return [(FPItemCollection *)self _numberOfItems];
}

- (unint64_t)_indexOfItemID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FPItemCollection__indexOfItemID___block_invoke;
  block[3] = &unk_1E5AF17F8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(itemAccessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __35__FPItemCollection__indexOfItemID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) indexOfItemID:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)_indexOfItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPItemCollection__indexOfItem___block_invoke;
  block[3] = &unk_1E5AF17F8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(itemAccessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __33__FPItemCollection__indexOfItem___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) indexOfObject:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__17;
  uint64_t v14 = __Block_byref_object_dispose__17;
  id v15 = 0;
  uint64_t v5 = [v4 indexAtPosition:0];
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPItemCollection_itemAtIndexPath___block_invoke;
  block[3] = &unk_1E5AF4230;
  void block[5] = &v10;
  block[6] = v5;
  void block[4] = self;
  dispatch_sync(itemAccessQueue, block);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

unint64_t __36__FPItemCollection_itemAtIndexPath___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  unint64_t result = [*(id *)(a1[4] + 24) count];
  if (v2 < result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 24) objectAtIndex:a1[6]];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)_t_items
{
  unint64_t v2 = [(_FPItemList *)self->_currentItems allObjects];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)_itemsMutableCopy
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  id v11 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__FPItemCollection__itemsMutableCopy__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __37__FPItemCollection__itemsMutableCopy__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isUsingDataSource:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FPItemCollection__isUsingDataSource___block_invoke;
  block[3] = &unk_1E5AF17F8;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(updateQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __39__FPItemCollection__isUsingDataSource___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  updateQueue = self->_updateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke;
  v15[3] = &unk_1E5AF0DC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(updateQueue, v15);
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  sectiouint64_t n = __fp_create_section();
  unint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_3();
  }

  if ([*(id *)(a1 + 32) isRegatheringAfterSignal])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_1();
    }
  }
  else
  {
    v24 = [*(id *)(a1 + 40) mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v28;
      *(void *)&long long v6 = 134218498;
      long long v23 = v6;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "formerIdentifier", v23);
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            uint64_t v12 = [*(id *)(a1 + 32) _indexOfItem:v9];
            if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v13 = fp_current_or_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                id v20 = [v9 formerIdentifier];
                *(_DWORD *)buf = v23;
                uint64_t v33 = v12;
                __int16 v34 = 2112;
                uint64_t v35 = v20;
                __int16 v36 = 2112;
                v37 = v9;
                _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] replacing placeholder at index %ld with ID %@ with %@", buf, 0x20u);
              }
              if ([v9 isBusy])
              {
                id v14 = fp_current_or_default_log();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
                  __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_2(&v25, v26, v14);
                }

                id v15 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndex:v12];
                id v16 = [v15 creationDate];
                [v9 setCreationDate:v16];

                id v17 = [v15 documentSize];
                [v9 setDocumentSize:v17];

                id v18 = [v15 contentModificationDate];
                [v9 setContentModificationDate:v18];
              }
              id v19 = [v9 formerItemID];
              [v24 removeObject:v19];
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v5);
    }

    BOOL v21 = [v24 allObjects];
    id v22 = [v21 arrayByAddingObjectsFromArray:*(void *)(a1 + 56)];

    ++*(void *)(*(void *)(a1 + 32) + 184);
    [*(id *)(a1 + 32) _receivedBatchWithUpdatedItems:*(void *)(a1 + 48) deletedItemsIdentifiers:v22 dropForReplacedPlaceholders:0];
    [*(id *)(a1 + 32) _flushPendingUpdates];

    id v3 = v24;
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

- (void)_updateObservedItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  [(FPItemCollection *)self updateRootItem:v4];
  if (self->_observing)
  {
    workingQueue = self->_workingQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__FPItemCollection__updateObservedItem___block_invoke;
    v6[3] = &unk_1E5AF0748;
    id v7 = v4;
    id v8 = self;
    dispatch_async(workingQueue, v6);
  }
}

void __40__FPItemCollection__updateObservedItem___block_invoke(uint64_t a1)
{
  unint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__FPItemCollection__updateObservedItem___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 40) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) delegate];
    [v5 collection:*(void *)(a1 + 40) didUpdateObservedItem:*(void *)(a1 + 32)];
  }
}

- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 hasMoreChanges:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  updateQueue = self->_updateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers_hasMoreChanges___block_invoke;
  v13[3] = &unk_1E5AF2F60;
  BOOL v16 = a5;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(updateQueue, v13);
}

uint64_t __89__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers_hasMoreChanges___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 178) = *(unsigned char *)(a1 + 56);
  return [*(id *)(a1 + 32) _receivedBatchWithUpdatedItems:*(void *)(a1 + 40) deletedItemsIdentifiers:*(void *)(a1 + 48)];
}

- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(updateQueue, block);
}

uint64_t __74__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedBatchWithUpdatedItems:*(void *)(a1 + 40) deletedItemsIdentifiers:*(void *)(a1 + 48)];
}

- (void)forceRefreshOfItemWithItemID:(id)a3
{
  id v4 = a3;
  updateQueue = self->_updateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(updateQueue, v7);
}

void __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__17;
  id v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  id v16 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v12[5]) {
    goto LABEL_3;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_2;
  block[3] = &unk_1E5AF17F8;
  id v10 = &v11;
  void block[4] = v2;
  id v9 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
  LOBYTE(v3) = v12[5] == 0;

  if ((v3 & 1) == 0)
  {
LABEL_3:
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_cold_1();
    }

    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = (void *)[(id)v12[5] copy];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v5 _receivedBatchWithUpdatedItems:v7 deletedItemsIdentifiers:MEMORY[0x1E4F1CBF0]];
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) itemWithItemID:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)indexPathFromIndex:(int64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPItemCollection.m" lineNumber:1266 description:@"invalid index"];
  }
  v9[0] = 0;
  v9[1] = a3;
  id v7 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v9 length:2];

  return v7;
}

- (id)indexPathsFromIndexSet:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__FPItemCollection_indexPathsFromIndexSet___block_invoke;
  v10[3] = &unk_1E5AF4258;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v5 enumerateIndexesUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __43__FPItemCollection_indexPathsFromIndexSet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) indexPathFromIndex:a2];
  [v2 addObject:v3];
}

+ (id)_bouncedItem:(id)a3 withinItems:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = [v7 filename];
  id v37 = 0;
  id v9 = objc_msgSend(v8, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v37, 0, objc_msgSend(v7, "isFolder"));
  id v10 = v37;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  uint64_t v13 = v11;
  id v14 = v7;
  if (!v12) {
    goto LABEL_17;
  }
  uint64_t v15 = v12;
  id v31 = v10;
  unint64_t v16 = 0;
  uint64_t v17 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v11);
      }
      id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v20 = objc_msgSend(v19, "filename", v31);
      id v32 = 0;
      BOOL v21 = objc_msgSend(v20, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v32, 0, objc_msgSend(v19, "isFolder"));
      id v22 = v32;

      if (![v9 localizedCaseInsensitiveCompare:v21])
      {
        unint64_t v23 = [v22 unsignedIntValue];
        if (v16 > v23) {
          unint64_t v23 = v16;
        }
        if (v23 <= 1) {
          unint64_t v16 = 1;
        }
        else {
          unint64_t v16 = v23;
        }
      }
    }
    uint64_t v15 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  }
  while (v15);

  id v14 = v7;
  id v10 = v31;
  if (v16)
  {
    id v14 = (void *)[v7 copy];

    v24 = objc_msgSend(v9, "fp_bouncedNameWithIndex:isDir:", v16 + 1, objc_msgSend(v14, "isFolder"));
    [v14 setDisplayName:v24];

    uint8_t v25 = [v14 displayName];
    [v14 setFilename:v25];

    id v26 = [v14 fileURL];

    if (v26)
    {
      long long v27 = [v14 fileURL];
      uint64_t v13 = [v27 URLByDeletingLastPathComponent];

      long long v28 = [v14 filename];
      long long v29 = [v13 URLByAppendingPathComponent:v28];
      [v14 setFileURL:v29];

LABEL_17:
    }
  }

  return v14;
}

BOOL __49__FPItemCollection__reorderWithPlaceholdersLast___block_invoke(uint64_t a1, void *a2)
{
  return ([a2 state] & 1) == 0;
}

uint64_t __49__FPItemCollection__reorderWithPlaceholdersLast___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 state] & 1;
}

- (BOOL)shouldConsiderUsingPlaceholder:(id)a3 forItem:(id)a4 skipForwardFormerID:(BOOL *)a5
{
  id v8 = a3;
  *a5 = 0;
  pendingItemsStitching = self->_pendingItemsStitching;
  id v10 = a4;
  id v11 = [v8 itemID];
  uint64_t v12 = [(NSMutableDictionary *)pendingItemsStitching objectForKey:v11];

  uint64_t v13 = [v8 itemID];
  id v14 = [v10 itemID];

  int v15 = [v13 isEqual:v14];
  unint64_t v16 = [v8 formerItemID];

  if ([v8 isPlaceholder])
  {
    char v17 = v15 ^ 1;
    if ((v15 ^ 1)) {
      goto LABEL_9;
    }
LABEL_6:
    if (v16)
    {
      char v17 = 1;
      *a5 = 1;
    }
    goto LABEL_9;
  }
  if (!((v12 == 0) & ~[v8 isBusy] | v15 & 1))
  {
    char v17 = 1;
    goto LABEL_9;
  }
  char v17 = 0;
  if (v15) {
    goto LABEL_6;
  }
LABEL_9:

  return v17;
}

- (id)computeIndexPathsBasedDiffsWithOldItems:(id)a3 futureItems:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v60 = a4;
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  [v6 setMovedSourceIndexPaths:v7];

  id v8 = objc_opt_new();
  [v6 setMovedDestinationIndexPaths:v8];

  id v9 = objc_opt_new();
  [v6 setDeletedIndexes:v9];

  id v10 = objc_opt_new();
  [v6 setInsertedIndexes:v10];

  id v11 = objc_opt_new();
  [v6 setUpdatedIndexes:v11];

  v53 = [v6 movedSourceIndexPaths];
  v52 = [v6 movedDestinationIndexPaths];
  v57 = [v6 deletedIndexes];
  v56 = [v6 insertedIndexes];
  id v51 = v6;
  v58 = [v6 updatedIndexes];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v12 = self->_deletedItemsIdentifiers;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v70 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x1A6248870]();
        unint64_t v19 = [(FPItemCollection *)self _indexOfItemID:v17];
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v20 = v19;
          [v59 removeObjectWithID:v17];
          [v57 addIndex:v20];
        }
      }
      uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v14);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_updatedItemsByIdentifiers allValues];
  uint64_t v21 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v66 != v23) {
          objc_enumerationMutation(obj);
        }
        uint8_t v25 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        id v26 = (void *)MEMORY[0x1A6248870]();
        long long v27 = [v25 itemID];
        [v59 removeObjectWithID:v27];

        uint64_t v28 = [v60 indexOfObject:v25];
        unint64_t v29 = [(FPItemCollection *)self _indexOfItem:v25];
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v30 = v56;
          if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_23;
          }
          id v31 = [MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInMethod:a2, self, @"FPItemCollection.m", 1687, @"item %@ doesn't belong in collection %@?", v25, self object file lineNumber description];
          long long v30 = v56;
          goto LABEL_22;
        }
        unint64_t v32 = v29;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
          [v33 handleFailureInMethod:a2 object:self file:@"FPItemCollection.m" lineNumber:1694 description:@"we just inserted this item"];
        }
        long long v30 = v58;
        if (v32 != v28)
        {
          long long v34 = [(FPItemCollection *)self indexPathFromIndex:v32];
          [v53 addObject:v34];

          id v31 = [(FPItemCollection *)self indexPathFromIndex:v28];
          [v52 addObject:v31];
          long long v30 = v58;
LABEL_22:
        }
LABEL_23:
        [v30 addIndex:v28];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v22);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v35 = [v59 allObjects];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v61 + 1) + 8 * k);
        uint64_t v41 = (void *)MEMORY[0x1A6248870]();
        unint64_t v42 = [(FPItemCollection *)self _indexOfItem:v40];
        uint64_t v43 = [v60 indexOfObject:v40];
        if (v43 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v42 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v44 = [MEMORY[0x1E4F28B00] currentHandler];
            [v44 handleFailureInMethod:a2 object:self file:@"FPItemCollection.m" lineNumber:1714 description:@"item doesn't belong anywhere"];
          }
          v45 = v57;
          unint64_t v46 = v42;
        }
        else
        {
          uint64_t v47 = v43;
          if (v42 != v43)
          {
            id v48 = [(FPItemCollection *)self indexPathFromIndex:v42];
            [v53 addObject:v48];

            uint64_t v49 = [(FPItemCollection *)self indexPathFromIndex:v47];
            [v52 addObject:v49];
          }
          v45 = v58;
          unint64_t v46 = v47;
        }
        [v45 addIndex:v46];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v37);
  }

  return v51;
}

- (void)sendIndexPathBasedDiffs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 movedSourceIndexPaths];
  id v6 = [v4 movedDestinationIndexPaths];
  id v7 = [v4 deletedIndexes];
  id v8 = [v4 insertedIndexes];
  id v9 = [v4 updatedIndexes];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexPathBasedDelegate);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke;
  v23[3] = &unk_1E5AF42C8;
  id v11 = v7;
  id v24 = v11;
  id v12 = WeakRetained;
  id v25 = v12;
  id v26 = self;
  id v13 = v8;
  id v27 = v13;
  id v14 = v5;
  id v28 = v14;
  id v15 = v6;
  id v29 = v15;
  unint64_t v16 = (void *)MEMORY[0x1A6248B00](v23);
  uint64_t v17 = [v11 count];
  uint64_t v18 = [v13 count] + v17;
  if (v18 + [v14 count]) {
    [v12 collection:self didPerformBatchUpdateWithReplayBlock:v16];
  }
  if ([v9 count])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_207;
    v19[3] = &unk_1E5AF17D0;
    id v20 = v9;
    id v21 = v12;
    uint64_t v22 = self;
    [v21 collection:self didPerformBatchUpdateWithReplayBlock:v19];
  }
}

uint64_t __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_3();
    }

    id v4 = *(void **)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    id v5 = [v3 indexPathsFromIndexSet:*(void *)(a1 + 32)];
    [v4 collection:v3 didDeleteItemsAtIndexPaths:v5];
  }
  if ([*(id *)(a1 + 56) count])
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_2();
    }

    id v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v9 = [v8 indexPathsFromIndexSet:*(void *)(a1 + 56)];
    [v7 collection:v8 didInsertItemsAtIndexPaths:v9];
  }
  uint64_t result = [*(id *)(a1 + 64) count];
  if (result)
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_1();
    }

    return [*(id *)(a1 + 40) collection:*(void *)(a1 + 48) didMoveItemsFromIndexPaths:*(void *)(a1 + 64) toIndexPaths:*(void *)(a1 + 72)];
  }
  return result;
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_207(void *a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_207_cold_1();
  }

  id v4 = (void *)a1[5];
  id v3 = (void *)a1[6];
  id v5 = [v3 indexPathsFromIndexSet:a1[4]];
  [v4 collection:v3 didUpdateItemsAtIndexPaths:v5 changes:0];
}

- (id)computeItemIDBasedDiffs
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(NSMutableSet *)self->_deletedItemsIdentifiers allObjects];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setDeletedItemIDs:v5];

  id v6 = [(NSMutableDictionary *)self->_updatedItemsByIdentifiers allValues];
  id v7 = (void *)[v6 mutableCopy];
  [v3 setUpdatedItems:v7];

  id v8 = objc_opt_new();
  [v3 setReplacedItemsByFormerID:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(NSMutableDictionary *)self->_updatedItemsByIdentifiers allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = [v14 formerItemID];
        if (v15)
        {
          unint64_t v16 = (void *)v15;
          currentItems = self->_currentItems;
          uint64_t v18 = [v14 formerItemID];
          uint64_t v19 = [(_FPItemList *)currentItems indexOfItemID:v18];

          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v20 = [v3 replacedItemsByFormerID];
            id v21 = [v14 formerItemID];
            [v20 setObject:v14 forKeyedSubscript:v21];

            uint64_t v22 = [v3 updatedItems];
            [v22 removeObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  return v3;
}

- (void)sendItemIDBasedDiffs:(id)a3
{
  p_itemIDBasedDelegate = &self->_itemIDBasedDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemIDBasedDelegate);
  id v6 = [v5 updatedItems];
  id v7 = [v5 replacedItemsByFormerID];
  id v8 = [v5 deletedItemIDs];

  [WeakRetained collection:self didUpdateItems:v6 replaceItemsByFormerID:v7 deleteItemsWithIDs:v8];
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"FPItemCollection.m" lineNumber:1803 description:@"UNREACHABLE: should be overriden"];

  return 0;
}

- (id)scopedSearchQuery
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPItemCollection.m" lineNumber:1808 description:@"UNREACHABLE: should be overriden"];

  return 0;
}

+ (void)consumeUpdates:(id)a3 deletes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  sectiouint64_t n = __fp_create_section();
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = section;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx stitching notifications (updated:%@ deleted:%@)", buf, 0x20u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [a1 activeCollections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 updateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__FPItemCollection_consumeUpdates_deletes___block_invoke;
        block[3] = &unk_1E5AF17D0;
        void block[4] = v13;
        id v16 = v6;
        id v17 = v7;
        dispatch_async(v14, block);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

void __43__FPItemCollection_consumeUpdates_deletes___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRegatheringAfterSignal])
  {
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __43__FPItemCollection_consumeUpdates_deletes___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 _receivedBatchWithUpdatedItems:v4 deletedItemsIdentifiers:v5 forceFlush:1 dropForReplacedPlaceholders:0];
  }
}

+ (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = objc_msgSend(a1, "activeCollections", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) replacePlaceholders:v8 withActualItems:v9 deletedIDs:v10];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (BOOL)isEnumerationSuspended
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FPItemCollection_isEnumerationSuspended__block_invoke;
  block[3] = &unk_1E5AF1950;
  void block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__FPItemCollection_isEnumerationSuspended__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = _enumerationSuspendCount != 0;
  return result;
}

+ (void)suspendVendorEnumeration
{
}

void __44__FPItemCollection_suspendVendorEnumeration__block_invoke()
{
  ++_enumerationSuspendCount;
  uint64_t v0 = fp_current_or_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __44__FPItemCollection_suspendVendorEnumeration__block_invoke_cold_1();
  }
}

+ (void)resumeVendorEnumeration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__17;
  uint64_t v22 = __Block_byref_object_dispose__17;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FPItemCollection_resumeVendorEnumeration__block_invoke;
  block[3] = &unk_1E5AF42F0;
  block[6] = a2;
  void block[7] = a1;
  void block[4] = &v14;
  void block[5] = &v18;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  if (!v15[3])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = (id)v19[5];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v2);
          }
          id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          uint64_t v7 = [v6 updateQueue];
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __43__FPItemCollection_resumeVendorEnumeration__block_invoke_220;
          v8[3] = &unk_1E5AF0FF0;
          v8[4] = v6;
          dispatch_sync(v7, v8);
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
      }
      while (v3);
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke(void *a1)
{
  uint64_t v2 = _enumerationSuspendCount;
  if (!_enumerationSuspendCount)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[7] file:@"FPItemCollection.m" lineNumber:1911 description:@"over resume!"];

    uint64_t v2 = _enumerationSuspendCount;
  }
  _enumerationSuspendCount = v2 - 1;
  *(void *)(*(void *)(a1[4] + 8) + 24) = v2 - 1;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __43__FPItemCollection_resumeVendorEnumeration__block_invoke_cold_1();
  }

  uint64_t v5 = [(id)_activeCollections copy];
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke_220(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dataSource];
  [v1 enumerationMightHaveResumed];
}

- (void)_replaceContentsWithVendorItems:(id)a3
{
  id v4 = a3;
  updateQueue = self->_updateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FPItemCollection__replaceContentsWithVendorItems___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(updateQueue, v7);
}

void __52__FPItemCollection__replaceContentsWithVendorItems___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = v6;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v6, "fp_map:", &__block_literal_global_228);

    id v4 = (id)v5;
  }
  id v7 = v4;
  [*(id *)(a1 + 32) _receivedBatchWithUpdatedItems:v4 deletedItemsIdentifiers:MEMORY[0x1E4F1CBF0]];
}

FPItem *__52__FPItemCollection__replaceContentsWithVendorItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[FPItem alloc] initWithSearchableItem:v2];

  return v3;
}

- (void)_setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void)setGathering:(BOOL)a3
{
  self->_gathering = a3;
}

- (unint64_t)lastForcedUpdate
{
  return self->_lastForcedUpdate;
}

- (FPItemCollectionMinimalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPItemCollectionMinimalDelegate *)WeakRetained;
}

- (BOOL)isImmutable
{
  return self->_immutable;
}

- (BOOL)hasMoreUpdates
{
  return self->_hasMoreUpdates;
}

- (BOOL)showHiddenFiles
{
  return self->_showHiddenFiles;
}

- (void)setShowHiddenFiles:(BOOL)a3
{
  self->_showHiddenFiles = a3;
}

- (NSPredicate)additionalItemFilteringPredicate
{
  return self->_additionalItemFilteringPredicate;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (FPPacer)updatePacer
{
  return self->_updatePacer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePacer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_additionalItemFilteringPredicate, 0);
  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_indexPathBasedDelegate);
  objc_destroyWeak((id *)&self->_itemIDBasedDelegate);
  objc_storeStrong((id *)&self->_appRegistry, 0);
  objc_storeStrong((id *)&self->_itemFilteringPredicate, 0);
  objc_storeStrong((id *)&self->_pendingItemsFields, 0);
  objc_storeStrong((id *)&self->_pendingItemsStitching, 0);
  objc_storeStrong((id *)&self->_formerItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedItemsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastInvalidationOnError, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_itemAccessQueue, 0);
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

- (NSString)providerIdentifier
{
  return (NSString *)&stru_1EF68D1F8;
}

- (NSString)domainIdentifier
{
  return (NSString *)&stru_1EF68D1F8;
}

void __34__FPItemCollection_startObserving__block_invoke_135_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: start timer expired", v2, v3, v4, v5, v6);
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a2 + 40), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] %@ received an error from data source: %@", v5, v6, v7, v8, v9);
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_2(uint64_t a1, id *a2)
{
  uint64_t v2 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] %@ received a retriable error from data source: %@", v5, v6, v7, v8, v9);
}

void __33__FPItemCollection_stopObserving__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] collection is not being observed, nothing to do", v2, v3, v4, v5, v6);
}

void __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] changing sort descriptors: \"%@\" -> \"%@\"");
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] not doing anything because we're regathering", v2, v3, v4, v5, v6);
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Item isBusy, absorbing info from placeHolder", buf, 2u);
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┏%llx %@: replacing placeholders and sending updates");
}

void __40__FPItemCollection__updateObservedItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] updating observed item: %@", v2, v3, v4, v5, v6);
}

void __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] force refresh item %@", v2, v3, v4, v5, v6);
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] not observing, ignoring update", v2, v3, v4, v5, v6);
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.2()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_10_4(&dword_1A33AE000, v0, v1, "[DEBUG] will flush%s for generation %d", v2, v3);
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.3()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] not flushing", v2, v3, v4, v5, v6);
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.4()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] we need to clear the gathering bit", v2, v3, v4, v5, v6);
}

- (void)_receivedBatchWithUpdatedItems:(void *)a1 deletedItemsIdentifiers:(uint8_t *)buf forceFlush:(void *)a3 dropForReplacedPlaceholders:(os_log_t)log .cold.5(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a stitched item for itemID %@, overriding if needed.", buf, 0xCu);
}

- (void)_receivedBatchWithUpdatedItems:(void *)a1 deletedItemsIdentifiers:(uint64_t)a2 forceFlush:(uint64_t)a3 dropForReplacedPlaceholders:(NSObject *)a4 .cold.6(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v7 = a1;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = v7;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  _os_log_debug_impl(&dword_1A33AE000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] Found stitched child items of (%@): %@", (uint8_t *)a3, 0x16u);
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] data should be reloaded", v2, v3, v4, v5, v6);
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] notify delegate of changes", v2, v3, v4, v5, v6);
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┳%llx exchange future state with current one for %@");
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_187_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *a1;
  int v7 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) count];
  int v8 = [*(id *)(*a1 + 24) count];
  uint64_t v9 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  uint64_t v10 = *(void *)(*a1 + 24);
  int v11 = 138413314;
  uint64_t v12 = v6;
  __int16 v13 = 1024;
  int v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  __int16 v17 = 2112;
  uint64_t v18 = v9;
  __int16 v19 = 2112;
  uint64_t v20 = v10;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] calling delegates for %@ (old count=%d, new count=%d)\nold items: %@\nnew items: %@", (uint8_t *)&v11, 0x2Cu);
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] moved %@ to %@");
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] inserted %@", v2, v3, v4, v5, v6);
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] deleted %@", v2, v3, v4, v5, v6);
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_207_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] updated %@", v2, v3, v4, v5, v6);
}

void __43__FPItemCollection_consumeUpdates_deletes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] skipping %@ because it's regathering", v2, v3, v4, v5, v6);
}

void __44__FPItemCollection_suspendVendorEnumeration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] suspended vendor notifications (suspend count:%lu)", v2, v3, v4, v5, v6);
}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] resumed vendor notifications (suspend count:%lu)", v2, v3, v4, v5, v6);
}

void __50__FPItemCollection__restartObservationWithReason___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_33();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Restarting observation %@ (%@)", v1, 0x16u);
}

@end