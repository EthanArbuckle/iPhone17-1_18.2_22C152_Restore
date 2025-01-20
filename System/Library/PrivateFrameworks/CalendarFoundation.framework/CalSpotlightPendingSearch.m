@interface CalSpotlightPendingSearch
+ (id)_createSearchQueryWithPredicate:(id)a3 options:(id)a4;
+ (id)_pendingSearches;
+ (id)_queue;
+ (id)_resultForSearchableItem:(id)a3;
+ (id)_resultsForSearchableItems:(id)a3;
- (CalSpotlightPendingSearch)initWithString:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (CalSpotlightPendingSearch)searchWithString:(id)a3;
- (MDSearchQuery)query;
- (NSMutableOrderedSet)searchableItemIdentifiers;
- (NSMutableOrderedSet)searchableItems;
- (NSString)clientBundleID;
- (id)completionHandler;
- (void)_searchEnded;
- (void)_startSearchWithQuery:(id)a3;
- (void)cancel;
- (void)searchQuery:(id)a3 didFailWithError:(id)a4;
- (void)searchQuery:(id)a3 didReturnItems:(id)a4;
- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4;
- (void)setClientBundleID:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchableItemIdentifiers:(id)a3;
- (void)setSearchableItems:(id)a3;
@end

@implementation CalSpotlightPendingSearch

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)_queue_queue;

  return v2;
}

uint64_t __35__CalSpotlightPendingSearch__queue__block_invoke()
{
  _queue_queue = (uint64_t)dispatch_queue_create("com.apple.calendar.foundation.spotlightquerycontroller.internalqueue", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)_createSearchQueryWithPredicate:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)EKWeakLinkClass(@"MDSearchQuery", 0xBuLL)), "initWithPredicate:options:", v6, v5);

  return v7;
}

- (CalSpotlightPendingSearch)initWithString:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CalSpotlightPendingSearch;
  v11 = [(CalSpotlightPendingSearch *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(CalSpotlightPendingSearch *)v11 setClientBundleID:v9];
    v13 = objc_opt_new();
    [(CalSpotlightPendingSearch *)v12 setSearchableItemIdentifiers:v13];

    v14 = objc_opt_new();
    [(CalSpotlightPendingSearch *)v12 setSearchableItems:v14];

    [(CalSpotlightPendingSearch *)v12 setCompletionHandler:v10];
    [(CalSpotlightPendingSearch *)v12 searchWithString:v8];
  }

  return v12;
}

+ (id)_pendingSearches
{
  v2 = (void *)_pendingSearches_pendingSearches;
  if (!_pendingSearches_pendingSearches)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4 = (void *)_pendingSearches_pendingSearches;
    _pendingSearches_pendingSearches = (uint64_t)v3;

    v2 = (void *)_pendingSearches_pendingSearches;
  }

  return v2;
}

- (void)_startSearchWithQuery:(id)a3
{
  id v5 = a3;
  v4 = [(id)objc_opt_class() _pendingSearches];
  [v4 addObject:self];

  [(CalSpotlightPendingSearch *)self setQuery:v5];
  [v5 start];
}

- (void)_searchEnded
{
  [(CalSpotlightPendingSearch *)self setQuery:0];
  id v3 = [(id)objc_opt_class() _pendingSearches];
  [v3 removeObject:self];
}

- (CalSpotlightPendingSearch)searchWithString:(id)a3
{
  id v5 = a3;
  id v6 = [(CalSpotlightPendingSearch *)self query];

  if (v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CalSpotlightQueryController.m" lineNumber:110 description:@"searchWithString: called multiple times"];
  }
  v7 = [(id)objc_opt_class() _queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__CalSpotlightPendingSearch_searchWithString___block_invoke;
  v11[3] = &unk_1E56CD858;
  id v12 = v5;
  v13 = self;
  id v8 = v5;
  dispatch_async(v7, v11);

  return result;
}

void __46__CalSpotlightPendingSearch_searchWithString___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    v2 = EKWeakLinkStringConstant("MDSearchQueryOptionFetchAttributes", 0xBuLL);
    v14 = v2;
    id v3 = EKWeakLinkStringConstant("MDItemIdentifier", 0xBuLL);
    v13[0] = v3;
    v4 = EKWeakLinkStringConstant("MDItemTitle", 0xBuLL);
    v13[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v15[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

    v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [(id)*MEMORY[0x1E4F44358] identifier];
    id v9 = [v7 predicateWithFormat:@"kMDItemContentType == %@ && kMDItemTitle contains[cd] %@", v8, *(void *)(a1 + 32)];

    id v10 = [(id)objc_opt_class() _createSearchQueryWithPredicate:v9 options:v6];
    v11 = [*(id *)(a1 + 40) clientBundleID];
    [v10 setClientBundleID:v11];

    [v10 setDelegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) _startSearchWithQuery:v10];
  }
  else
  {
    id v12 = [*(id *)(a1 + 40) completionHandler];
    (*((void (**)(id, void, void))v12 + 2))(v12, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void)cancel
{
  id v3 = [(id)objc_opt_class() _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CalSpotlightPendingSearch_cancel__block_invoke;
  block[3] = &unk_1E56CD9A0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __35__CalSpotlightPendingSearch_cancel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) query];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) query];
    [v3 cancel];

    v4 = *(void **)(a1 + 32);
    [v4 _searchEnded];
  }
}

+ (id)_resultForSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];
    uint64_t v6 = [v4 title];
    v7 = (void *)v6;
    id v8 = 0;
    if (v5 && v6)
    {
      id v8 = objc_opt_new();
      [v8 setIdentifier:v5];
      [v8 setTitle:v7];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_resultsForSearchableItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
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
        v11 = objc_msgSend(a1, "_resultForSearchableItem:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)searchQuery:(id)a3 didReturnItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke;
  block[3] = &unk_1E56CE5C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) query];

  if (v2)
  {
    id v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke_cold_1(a1);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "attributeSet", (void)v16);
          v11 = [v10 identifier];

          if (v11)
          {
            id v12 = [*(id *)(a1 + 32) searchableItemIdentifiers];
            char v13 = [v12 containsObject:v11];

            if ((v13 & 1) == 0)
            {
              long long v14 = [*(id *)(a1 + 32) searchableItemIdentifiers];
              [v14 addObject:v11];

              long long v15 = [*(id *)(a1 + 32) searchableItems];
              [v15 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
}

- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke;
  block[3] = &unk_1E56CE5F0;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) query];

  if (v2)
  {
    id v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke_cold_1(a1);
    }

    if (*(void *)(a1 + 48) == 3)
    {
      [*(id *)(a1 + 32) _searchEnded];
      id v4 = objc_opt_class();
      uint64_t v5 = [*(id *)(a1 + 32) searchableItems];
      id v6 = [v5 array];
      uint64_t v7 = [v4 _resultsForSearchableItems:v6];

      id v8 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, void *, void))v8)[2](v8, v7, 0);
    }
  }
}

- (void)searchQuery:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke;
  block[3] = &unk_1E56CE5C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) query];

  if (v2)
  {
    [*(id *)(a1 + 32) _searchEnded];
    id v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke_cold_1(a1, v3);
    }

    id v4 = [*(id *)(a1 + 32) completionHandler];
    v4[2](v4, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 48));
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableOrderedSet)searchableItemIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchableItemIdentifiers:(id)a3
{
}

- (NSMutableOrderedSet)searchableItems
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchableItems:(id)a3
{
}

- (MDSearchQuery)query
{
  return (MDSearchQuery *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

void __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_4(a1) predicate];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_8(&dword_190D88000, v2, v3, "Spotlight query %@ with predicate %@ did return items: %@", v4, v5, v6, v7, v8);
}

void __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [(id)OUTLINED_FUNCTION_1_4(a1) predicate];
  id v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_8(&dword_190D88000, v3, v4, "Spotlight query %@ with predicate %@ did change status: [%@]", v5, v6, v7, v8, 2u);
}

void __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_4(a1) predicate];
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Spotlight query %@ with predicate %@ failed with error: %@", v4, 0x20u);
}

@end