@interface EDSearchableIndexManager
+ (BOOL)shouldCancelSearchQuery;
+ (NSString)searchableIndexBundleID;
+ (NSString)searchableIndexName;
+ (OS_os_log)log;
+ (id)searchableItemResultForExpression:(id)a3;
- (BOOL)needsToRedonate;
- (BOOL)needsToScheduleRecurringActivity;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceDatabase)database;
- (EDSearchableIndex)index;
- (EDSearchableIndexManager)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6;
- (EDSearchableIndexPersistence)persistence;
- (EDSearchableIndexScheduler)scheduler;
- (EDSpotlightDaemonClient)spotlightDaemonClient;
- (EFCancelable)turboModeObservationToken;
- (void)_removeItemsForPersistedMessages:(id)a3;
- (void)_startObservingTurboModeToggle;
- (void)enableIndexingAndBeginScheduling:(BOOL)a3;
- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4;
- (void)persistenceDidAddDataDetectionResults:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidAddLabels:(id)a3 removeLabels:(id)a4 messages:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidFinishUpdates;
- (void)persistenceDidUpdateData:(id)a3 message:(id)a4;
- (void)persistenceWillBeginUpdates;
- (void)resetIndexForNewLibrary;
- (void)scheduleRecurringActivity;
- (void)setNeedsToRedonate;
- (void)setNeedsToRedonate:(BOOL)a3;
- (void)setNeedsToScheduleRecurringActivity:(BOOL)a3;
- (void)setSpotlightDaemonClient:(id)a3;
- (void)setTurboModeObservationToken:(id)a3;
- (void)test_tearDown;
@end

@implementation EDSearchableIndexManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDSearchableIndexManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_82 != -1) {
    dispatch_once(&log_onceToken_82, block);
  }
  v2 = (void *)log_log_82;

  return (OS_os_log *)v2;
}

void __31__EDSearchableIndexManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_82;
  log_log_82 = (uint64_t)v1;
}

+ (NSString)searchableIndexBundleID
{
  return (NSString *)(id)*MEMORY[0x1E4F5FD38];
}

+ (NSString)searchableIndexName
{
  return (NSString *)@"com.apple.mobilemail.contentIndex";
}

+ (BOOL)shouldCancelSearchQuery
{
  return 0;
}

+ (id)searchableItemResultForExpression:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 shouldCancelSearchQuery])
  {
    v5 = +[EDSearchableIndexManager log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "searchableItemResultForExpression - canceling before querying Spotlight", buf, 2u);
    }
LABEL_20:

    v5 = 0;
    goto LABEL_21;
  }
  if ([v4 isValid])
  {
    v22 = [MEMORY[0x1E4F60E18] promise];
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v6);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke;
    aBlock[3] = &unk_1E6C059B8;
    id v31 = a1;
    id v8 = v6;
    id v28 = v8;
    id v23 = v7;
    id v29 = v23;
    id v9 = v22;
    id v30 = v9;
    v24 = _Block_copy(aBlock);
    v10 = [MEMORY[0x1E4F60480] queryWithExpression:v4 builder:v24];
    v11 = [v10 progress];
    [a1 addSearchQueryCancelable:v11];

    [v10 start];
    v12 = [v9 future];
    v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
    id v26 = 0;
    v5 = [v12 resultBeforeDate:v13 error:&v26];
    id v14 = v26;

    if (!v5 && objc_msgSend(v14, "ef_isTimeoutError"))
    {
      v15 = +[EDSearchableIndexManager log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v14, "ef_publicDescription");
        +[EDSearchableIndexManager searchableItemResultForExpression:v15];
      }

      [v10 cancel];
    }
    v17 = [v10 progress];
    [a1 removeSearchQueryCancelable:v17];

    if (!v5)
    {
      v18 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = objc_msgSend(v14, "ef_publicDescription");
        +[EDSearchableIndexManager searchableItemResultForExpression:v18];
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if ([a1 shouldCancelSearchQuery])
  {
    v20 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_INFO, "searchableItemResultForExpression - Canceling after querying Spotlight", v25, 2u);
    }

    goto LABEL_20;
  }
LABEL_21:

  return v5;
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke(id *a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[7] searchableIndexBundleID];
  [v3 setBundleID:v4];

  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *MEMORY[0x1E4F23770];
    v17[0] = *MEMORY[0x1E4F234E0];
    v17[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F234E0];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  v7 = (void *)v6;
  [v3 setFetchAttributes:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_2;
  v12[3] = &unk_1E6BFF7A8;
  id v13 = a1[4];
  id v14 = a1[5];
  id v15 = a1[6];
  [v3 setCompletionBlock:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_4;
  v9[3] = &unk_1E6C023F0;
  id v10 = a1[4];
  id v11 = a1[5];
  [v3 setResultsBlock:v9];
  id v8 = [a1[6] errorOnlyCompletionHandlerAdapter];
  [v3 setFailureBlock:v8];
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_3;
  id v11 = &unk_1E6C05968;
  id v3 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v4 = v2;
  id v13 = v4;
  [v3 enumerateObjectsUsingBlock:&v8];
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = objc_alloc(MEMORY[0x1E4F60488]);
  v7 = objc_msgSend(v6, "initWithIdentifiers:snippetData:", *(void *)(a1 + 32), v4, v8, v9, v10, v11);
  [v5 finishWithResult:v7];
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  uint64_t v5 = objc_opt_new();
  if (a3 <= 0x1F3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x1E4F603D0];
          id v12 = [v10 attribute];
          id v13 = [v11 snippetHintZoneFromString:v12];

          id v14 = [v10 tokens];
          [v5 setObject:v14 forKeyedSubscript:v13];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  if ([v5 count])
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F60490]) initWithSearchableItemIdentifier:v16 snippetHints:v5];
    [*(id *)(a1 + 40) addObject:v15];
  }
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_5;
  id v13 = &unk_1E6C05990;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:&v10];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "allValues", v10, v11, v12, v13, v14);
    id v6 = +[EDSearchableIndexManager log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [v5 count];
      if (v7)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F60220];
        v2 = [v5 firstObject];
        uint64_t v8 = [v9 publicDescriptionForSnippetHintsArray:v2];
      }
      else
      {
        uint64_t v8 = @"No values found.";
      }
      *(_DWORD *)buf = 138412290;
      long long v17 = v8;
      _os_log_debug_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEBUG, "Regular query collected snippet hints first value: %@", buf, 0xCu);
      if (v7)
      {
      }
    }
  }
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_5(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 uniqueIdentifier];
  id v4 = [v10 uniqueIdentifier];
  uint64_t v5 = +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:v4];

  if (v5)
  {
    id v6 = [v10 attributeSet];
    uint64_t v7 = [v6 relatedUniqueIdentifier];

    id v3 = (void *)v7;
  }
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    if ((unint64_t)[*(id *)(a1 + 32) count] <= 0x1F3)
    {
      uint64_t v8 = [v10 attributeSet];
      uint64_t v9 = [v8 matchingHints];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v3];
    }
  }
}

- (EDSearchableIndexManager)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EDSearchableIndexManager;
  uint64_t v11 = [(EDSearchableIndexManager *)&v17 init];
  id v12 = v11;
  id v13 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    objc_storeStrong((id *)&v12->_messagePersistence, a4);
  }
  id v14 = [MEMORY[0x1E4F60D58] currentDevice];
  int v15 = [v14 isInternal];

  if (v15) {
    [(EDSearchableIndexManager *)v13 _startObservingTurboModeToggle];
  }

  return v13;
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDSearchableIndexManager.m", 162, @"%s can only be called from unit tests", "-[EDSearchableIndexManager test_tearDown]");
  }
  id v4 = [(EDSearchableIndexManager *)self index];
  objc_msgSend(v4, "test_tearDown");
}

- (void)scheduleRecurringActivity
{
  id v3 = [(EDSearchableIndexManager *)self index];

  if (v3)
  {
    id v4 = [(EDSearchableIndexManager *)self index];
    [v4 scheduleRecurringActivity];
  }
  else
  {
    [(EDSearchableIndexManager *)self setNeedsToScheduleRecurringActivity:1];
  }
}

- (void)_startObservingTurboModeToggle
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F602E0];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __58__EDSearchableIndexManager__startObservingTurboModeToggle__block_invoke;
  uint64_t v8 = &unk_1E6C059E0;
  objc_copyWeak(&v9, &location);
  id v4 = [v3 observeChangesForPreference:27 usingBlock:&v5];
  -[EDSearchableIndexManager setTurboModeObservationToken:](self, "setTurboModeObservationToken:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__EDSearchableIndexManager__startObservingTurboModeToggle__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a3)
  {
    id v6 = WeakRetained;
    uint64_t v5 = [WeakRetained index];
    [v5 refresh];

    id WeakRetained = v6;
  }
}

- (EDSearchableIndex)index
{
}

- (EDSearchableIndexPersistence)persistence
{
}

- (EDSearchableIndexScheduler)scheduler
{
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[EDSearchableIndexBudgetConfiguration defaultConfiguration];
  -[EDSearchableIndexManager enableIndexingAndBeginScheduling:budgetConfiguration:](self, "enableIndexingAndBeginScheduling:budgetConfiguration:", v3);
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4
{
  BOOL v4 = a3;
  if (objc_msgSend(MEMORY[0x1E4F602E0], "preferenceEnabled:", 37, a4))
  {
    id v6 = +[EDSearchableIndexManager log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndexManager enableIndexingAndBeginScheduling:budgetConfiguration:](v6);
    }

    uint64_t v7 = [(EDSearchableIndexManager *)self index];
    [v7 setIndexingDisabledForPPT:1];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = [(EDSearchableIndexManager *)self index];
      [v8 setPersistenceAvailable:1];

      id v9 = [(EDSearchableIndexManager *)self scheduler];
      [v9 setScheduling:1];
    }
    else
    {
      id v9 = [(EDSearchableIndexManager *)self scheduler];
      [v9 setScheduling:0];
    }

    if ([(EDSearchableIndexManager *)self needsToRedonate])
    {
      id v10 = [(EDSearchableIndexManager *)self index];
      [v10 redonateAllItemsWithAcknowledgementHandler:0];

      [(EDSearchableIndexManager *)self setNeedsToRedonate:0];
    }
    if ([(EDSearchableIndexManager *)self needsToScheduleRecurringActivity])
    {
      [(EDSearchableIndexManager *)self scheduleRecurringActivity];
      [(EDSearchableIndexManager *)self setNeedsToScheduleRecurringActivity:0];
    }
  }
}

- (void)resetIndexForNewLibrary
{
  [(EDSearchableIndexManager *)self setNeedsToRedonate:0];
  [(EDSearchableIndexManager *)self enableIndexingAndBeginScheduling:0];
  id v3 = [(EDSearchableIndexManager *)self index];
  [v3 resetIndexForNewLibraryWithCompletionHandler:0];
}

- (void)setNeedsToRedonate
{
  if (![(EDSearchableIndexManager *)self needsToRedonate])
  {
    id v3 = +[EDSearchableIndexManager log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Setting needs to redonate", v4, 2u);
    }

    [(EDSearchableIndexManager *)self setNeedsToRedonate:1];
  }
}

- (void)persistenceWillBeginUpdates
{
  id v2 = [(EDSearchableIndexManager *)self index];
  [v2 beginUpdatesAffectingDataSourceAndIndex];
}

- (void)persistenceDidFinishUpdates
{
  id v2 = [(EDSearchableIndexManager *)self index];
  [v2 endUpdatesAffectingDataSourceAndIndex];
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v6 = a3;
  id v5 = [(EDSearchableIndexManager *)self index];
  [v5 indexMessages:v6 includeBody:0 indexingType:0];
}

- (void)persistenceDidUpdateData:(id)a3 message:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 persistentID];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [(EDSearchableIndexManager *)self index];
    v10[0] = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 indexMessages:v9 includeBody:1 indexingType:0];
  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 deleted])
  {
    [(EDSearchableIndexManager *)self _removeItemsForPersistedMessages:v7];
  }
  else
  {
    uint64_t v8 = [(EDSearchableIndexManager *)self index];
    [v8 indexMessages:v7 includeBody:0 indexingType:1];
  }
}

- (void)persistenceDidAddDataDetectionResults:(id)a3 generationWindow:(id)a4
{
  id v6 = a3;
  id v5 = [(EDSearchableIndexManager *)self index];
  [v5 indexMessages:v6 includeBody:0 indexingType:4];
}

- (void)persistenceDidAddLabels:(id)a3 removeLabels:(id)a4 messages:(id)a5 generationWindow:(id)a6
{
  id v8 = a5;
  id v7 = [(EDSearchableIndexManager *)self index];
  [v7 indexMessages:v8 includeBody:0 indexingType:2];
}

- (void)_removeItemsForPersistedMessages:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(EDSearchableIndexManager *)self index];
  id v5 = objc_msgSend(v6, "ef_map:", &__block_literal_global_71);
  [v4 removeItemsWithIdentifiers:v5];
}

id __61__EDSearchableIndexManager__removeItemsForPersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 persistentID];

  return v2;
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  id v6 = a3;
  id v5 = [(EDSearchableIndexManager *)self index];
  [v5 indexMessages:v6 includeBody:0 indexingType:7];
}

- (BOOL)needsToRedonate
{
  return self->_needsToRedonate;
}

- (void)setNeedsToRedonate:(BOOL)a3
{
  self->_needsToRedonate = a3;
}

- (BOOL)needsToScheduleRecurringActivity
{
  return self->_needsToScheduleRecurringActivity;
}

- (void)setNeedsToScheduleRecurringActivity:(BOOL)a3
{
  self->_needsToScheduleRecurringActivity = a3;
}

- (EFCancelable)turboModeObservationToken
{
  return self->_turboModeObservationToken;
}

- (void)setTurboModeObservationToken:(id)a3
{
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDSpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (void)setSpotlightDaemonClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightDaemonClient, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_turboModeObservationToken, 0);
}

+ (void)searchableItemResultForExpression:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "searchableItemResultForExpression - search failed: %{public}@", buf, 0xCu);
}

+ (void)searchableItemResultForExpression:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "searchableItemResultForExpression - Timed out waiting for results from spotlight: %{public}@", buf, 0xCu);
}

- (void)enableIndexingAndBeginScheduling:(os_log_t)log budgetConfiguration:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "WARNING: Indexing is disabled using internal settings. This is intended for testing purposes only.", v1, 2u);
}

@end