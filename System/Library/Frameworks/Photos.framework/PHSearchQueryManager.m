@interface PHSearchQueryManager
+ (BOOL)_isValidQueryText:(id)a3;
+ (BOOL)currentSpotlightVersionSupportsExactMatchBehavior;
+ (BOOL)currentSpotlightVersionSupportsExactMatchBehaviorWithEmbeddingOnlyResults;
- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded;
- (BOOL)isTestingConfiguration;
- (NSMutableDictionary)queryLock_batchQueriesInProgress;
- (OS_dispatch_queue)batchQueryQueue;
- (OS_dispatch_queue)queryQueue;
- (PHPhotoLibrary)photoLibrary;
- (PHSearchQuery)currentSearchQuery;
- (PHSearchQuery)currentSuggestionsQuery;
- (PHSearchQueryManager)initWithPhotoLibrary:(id)a3;
- (id)_searchQueriesFromSearchTexts:(id)a3 searchOptions:(id)a4 batchQueryID:(int)a5;
- (id)initForTestingWithPhotoLibrary:(id)a3;
- (int)currentQueryId;
- (int)currentSuggestionsQueryId;
- (int)performBatchSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5;
- (int)performSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5;
- (int)queryLock_currentBatchQueryId;
- (int)suggestionsForSearchQuery:(id)a3 rangeOfSuggestionText:(_NSRange)a4 searchQueryResult:(id)a5 suggestionsHandler:(id)a6;
- (int)suggestionsForSearchText:(id)a3 options:(id)a4 suggestionsHandler:(id)a5;
- (void)_releaseSpotlightSandboxExtension;
- (void)cancelQueriesForBatchQueryId:(int)a3;
- (void)cancelQueryWithQueryId:(int)a3;
- (void)dealloc;
- (void)performSearch:(id)a3 resultsHandler:(id)a4;
- (void)preheatSearchWithCompletionBlock:(id)a3;
- (void)setCurrentQueryId:(int)a3;
- (void)setCurrentSearchQuery:(id)a3;
- (void)setCurrentSuggestionsQuery:(id)a3;
- (void)setCurrentSuggestionsQueryId:(int)a3;
- (void)setIsTestingConfiguration:(BOOL)a3;
- (void)setQueryLock_currentBatchQueryId:(int)a3;
@end

@implementation PHSearchQueryManager

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHSearchQueryManager)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 67, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PHSearchQueryManager;
  v7 = [(PHSearchQueryManager *)&v21 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v8->_spotlightSandboxExtensionHandle = -1;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryLock_batchQueriesInProgress = v8->_queryLock_batchQueriesInProgress;
    v8->_queryLock_batchQueriesInProgress = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.search.query_execution", v12);
    queryQueue = v8->_queryQueue;
    v8->_queryQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photos.search.query_execution", v16);
    batchQueryQueue = v8->_batchQueryQueue;
    v8->_batchQueryQueue = (OS_dispatch_queue *)v17;

    v8->_queryLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)performSearch:(id)a3 resultsHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    dispatch_queue_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHSearchQueryManager+SPI.m", 18, @"Invalid parameter not satisfying: %@", @"searchText" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHSearchQueryManager+SPI.m", 19, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = objc_alloc_init(PHSearchQueryOptions);
  [(PHSearchQueryOptions *)v10 setSuggestionLimit:5];
  [(PHSearchQueryOptions *)v10 setEnableQueryMatchDetails:1];
  [(PHSearchQueryOptions *)v10 setMaxRankedAssetSearchResults:10];
  [(PHSearchQueryOptions *)v10 setMaxRankedCollectionSearchResults:10];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__PHSearchQueryManager_SPI__performSearch_resultsHandler___block_invoke;
  v15[3] = &unk_1E58456C8;
  id v16 = v9;
  id v12 = v9;
  [(PHSearchQueryManager *)self performSearch:v11 searchOptions:v10 resultsHandler:v15];
}

void __58__PHSearchQueryManager_SPI__performSearch_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v25 = a4;
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = v5;
  id v8 = [v5 searchResults];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        dispatch_queue_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v14 = [v13 type];
        if ((unint64_t)(v14 - 2) < 3)
        {
          v15 = [v13 uuid];
          [v7 addObject:v15];

LABEL_11:
          id v16 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v13;
            _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Encountered result result with undefined type: %@", buf, 0xCu);
          }
          goto LABEL_13;
        }
        if (!v14) {
          goto LABEL_11;
        }
        if (v14 != 1) {
          continue;
        }
        id v16 = [v13 uuid];
        [v6 addObject:v16];
LABEL_13:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v10);
  }

  dispatch_queue_t v17 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v18 = [v26 rankedAssetSearchResults];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v27 + 1) + 8 * j) uuid];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLock_batchQueriesInProgress, 0);
  objc_storeStrong((id *)&self->_batchQueryQueue, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentSuggestionsQuery, 0);

  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
}

- (NSMutableDictionary)queryLock_batchQueriesInProgress
{
  return self->_queryLock_batchQueriesInProgress;
}

- (void)setQueryLock_currentBatchQueryId:(int)a3
{
  self->_queryLock_currentBatchQueryId = a3;
}

- (int)queryLock_currentBatchQueryId
{
  return self->_queryLock_currentBatchQueryId;
}

- (void)setIsTestingConfiguration:(BOOL)a3
{
  self->_isTestingConfiguration = a3;
}

- (BOOL)isTestingConfiguration
{
  return self->_isTestingConfiguration;
}

- (void)setCurrentSuggestionsQueryId:(int)a3
{
  self->_currentSuggestionsQueryId = a3;
}

- (int)currentSuggestionsQueryId
{
  return self->_currentSuggestionsQueryId;
}

- (void)setCurrentQueryId:(int)a3
{
  self->_currentQueryId = a3;
}

- (int)currentQueryId
{
  return self->_currentQueryId;
}

- (OS_dispatch_queue)batchQueryQueue
{
  return self->_batchQueryQueue;
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (PHSearchQuery)currentSuggestionsQuery
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentSuggestionsQuery;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentSuggestionsQuery:(id)a3
{
  v4 = (PHSearchQuery *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  currentSuggestionsQuery = obj->_currentSuggestionsQuery;
  obj->_currentSuggestionsQuery = v4;

  objc_sync_exit(obj);
}

- (PHSearchQuery)currentSearchQuery
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentSearchQuery;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentSearchQuery:(id)a3
{
  v4 = (PHSearchQuery *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  currentSearchQuery = obj->_currentSearchQuery;
  obj->_currentSearchQuery = v4;

  objc_sync_exit(obj);
}

- (id)_searchQueriesFromSearchTexts:(id)a3 searchOptions:(id)a4 batchQueryID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count])
  {
    unint64_t v12 = 0;
    *(void *)&long long v11 = 67109120;
    long long v20 = v11;
    do
    {
      dispatch_queue_t v13 = objc_msgSend(v8, "objectAtIndexedSubscript:", v12, v20);
      if ([v13 length])
      {
        uint64_t v14 = [PHSearchQuery alloc];
        v15 = [(PHSearchQueryManager *)self photoLibrary];
        id v16 = [(PHSearchQuery *)v14 initWithSearchText:v13 searchOptions:v9 photoLibrary:v15 queryIdentifier:++v12 batchIdentifier:v5];

        [v10 addObject:v16];
      }
      else
      {
        dispatch_queue_t v17 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          int v22 = v12;
          _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Found empty search text in performBatchSearch for query %d, will not construct query", buf, 8u);
        }

        ++v12;
      }
    }
    while ([v8 count] > v12);
  }
  v18 = (void *)[v10 copy];

  return v18;
}

- (void)_releaseSpotlightSandboxExtension
{
  if ([MEMORY[0x1E4F8AC10] spotlightPrivateIndexEnabled]) {
    PLRunWithUnfairLock();
  }
}

void __57__PHSearchQueryManager__releaseSpotlightSandboxExtension__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    sandbox_extension_release();
    *(void *)(*(void *)(a1 + 32) + 16) = -1;
    v2 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEFAULT, "Released sandbox extension for Spotlight index.", v3, 2u);
    }
  }
}

- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded
{
  if ([MEMORY[0x1E4F8AC10] spotlightPrivateIndexEnabled]) {
    PLRunWithUnfairLock();
  }
  return self->_spotlightSandboxExtensionHandle != -1;
}

void __65__PHSearchQueryManager__acquireSpotlightSandboxExtensionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16) == -1)
  {
    v3 = [*(id *)(v1 + 56) pathManager];
    id v4 = [v3 spotlightSearchIndexPath];
    uint64_t v5 = [v4 fileSystemRepresentation];

    uint64_t v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      id v7 = (void *)v6;
      *(void *)(*(void *)(a1 + 32) + 16) = sandbox_extension_consume();
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
      id v9 = PLSearchBackendQueryGetLog();
      uint64_t v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v17 = *__error();
          int v18 = 67109378;
          int v19 = v17;
          __int16 v20 = 2080;
          uint64_t v21 = v5;
          long long v11 = "Failed to consume sandbox extension token for Spotlight index. errno: %{darwin.errno}d, path: %s";
          unint64_t v12 = v10;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          uint32_t v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        long long v11 = "Issued sandbox extension for Spotlight index.";
        unint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_19B043000, v12, v13, v11, (uint8_t *)&v18, v14);
      }

      free(v7);
      return;
    }
    v15 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *__error();
      int v18 = 67109378;
      int v19 = v16;
      __int16 v20 = 2080;
      uint64_t v21 = v5;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token to Spotlight index. errno: %{darwin.errno}d, path: %s", (uint8_t *)&v18, 0x12u);
    }
  }
}

- (void)cancelQueriesForBatchQueryId:(int)a3
{
}

void __53__PHSearchQueryManager_cancelQueriesForBatchQueryId___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 80);
  v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3 = [v1 objectForKeyedSubscript:v2];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v9 cancel];
        uint64_t v10 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          if ([v9 batchIdentifier]) {
            objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v9, "batchIdentifier"), objc_msgSend(v9, "queryIdentifier"));
          }
          else {
          long long v11 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v9, "queryIdentifier"), v16);
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v11;
          _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelled batch queries.", buf, 0xCu);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  unint64_t v12 = *(void **)(*(void *)(a1 + 32) + 80);
  os_log_type_t v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v12 setObject:0 forKeyedSubscript:v13];

  uint32_t v14 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[Batch: %d] Cancelled batch queries.", buf, 8u);
  }
}

- (void)cancelQueryWithQueryId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PHSearchQueryManager *)self currentSearchQuery];
  int v6 = [v5 queryIdentifier];

  if (v6 == v3)
  {
    uint64_t v7 = [(PHSearchQueryManager *)self currentSearchQuery];
    [v7 cancel];

    uint64_t v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v3);
      uint64_t v10 = [(PHSearchQueryManager *)self currentSearchQuery];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      long long v18 = v10;
      long long v11 = "%{public}@ Cancelled query: %@";
LABEL_7:
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
    }
  }
  else
  {
    unint64_t v12 = [(PHSearchQueryManager *)self currentSuggestionsQuery];
    int v13 = [v12 queryIdentifier];

    if (v13 != v3) {
      return;
    }
    uint32_t v14 = [(PHSearchQueryManager *)self currentSuggestionsQuery];
    [v14 cancel];

    uint64_t v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v3);
      uint64_t v10 = [(PHSearchQueryManager *)self currentSuggestionsQuery];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      long long v18 = v10;
      long long v11 = "%{public}@ Cancelled suggestions query: %@";
      goto LABEL_7;
    }
  }
}

- (int)suggestionsForSearchText:(id)a3 options:(id)a4 suggestionsHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, PHSearchSuggestionQueryResult *, uint64_t, void))a5;
  if (!v10)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 371, @"Invalid parameter not satisfying: %@", @"suggestionsHandler" object file lineNumber description];
  }
  long long v11 = [(PHSearchQueryManager *)self currentSuggestionsQuery];
  [v11 cancel];

  [(PHSearchQueryManager *)self setCurrentSuggestionsQueryId:[(PHSearchQueryManager *)self currentSuggestionsQueryId] + 1];
  [v9 setWantsUnscopedSuggestions:1];
  unint64_t v12 = [PHSearchQuery alloc];
  int v13 = [(PHSearchQueryManager *)self photoLibrary];
  uint32_t v14 = [(PHSearchQuery *)v12 initWithText:v30 suggestionOptions:v9 photoLibrary:v13 queryIdentifier:[(PHSearchQueryManager *)self currentSuggestionsQueryId]];

  [(PHSearchQueryManager *)self setCurrentSuggestionsQuery:v14];
  uint64_t v15 = [v30 length];
  if (!v9 || !v15)
  {
    if ([v30 length])
    {
      if (v9)
      {
LABEL_14:
        uint64_t v23 = [[PHSearchSuggestionQueryResult alloc] initWithSearchQuery:v14];
        v10[2](v10, v23, 3, 0);
        int v24 = [(PHSearchQueryManager *)self currentSuggestionsQueryId];

        goto LABEL_17;
      }
      long long v20 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", -[PHSearchQueryManager currentSuggestionsQueryId](self, "currentSuggestionsQueryId"));
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v21;
        __int16 v38 = 2112;
        id v39 = v30;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "%{public}@ No options provided for suggestions query: %@, suggestions will not be generated", location, 0x16u);
      }
    }
    else
    {
      long long v20 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", -[PHSearchQueryManager currentSuggestionsQueryId](self, "currentSuggestionsQueryId"));
        *(_DWORD *)location = 138543362;
        *(void *)&location[4] = v22;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ No search text provided for suggestions query, suggestions will not be generated", location, 0xCu);
      }
    }

    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  int v16 = [(PHSearchQuery *)v14 suggestionQueryIdentifier];
  __int16 v17 = [v9 suggestionsHandlerQueue];
  long long v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F14428];
    id v25 = MEMORY[0x1E4F14428];
  }

  v26 = [(PHSearchQueryManager *)self queryQueue];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke;
  v31[3] = &unk_1E5846290;
  objc_copyWeak(&v35, (id *)location);
  int v36 = v16;
  long long v32 = v14;
  long long v34 = v10;
  id v27 = v19;
  id v33 = v27;
  +[PHSearchQuery performSuggestionsSearch:v32 queryQueue:v26 suggestionsHandler:v31];

  int v24 = [(PHSearchQueryManager *)self currentSuggestionsQueryId];
  objc_destroyWeak(&v35);

  objc_destroyWeak((id *)location);
LABEL_17:

  return v24;
}

void __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v10 = [v7 searchQuery];
  long long v11 = [WeakRetained currentSuggestionsQuery];
  char v12 = [v10 isEqual:v11] ^ 1;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke_2;
  aBlock[3] = &unk_1E5846268;
  char v26 = v12;
  int v25 = *(_DWORD *)(a1 + 64);
  id v13 = v7;
  id v20 = v13;
  id v21 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 48);
  uint64_t v24 = a3;
  id v14 = v8;
  id v22 = v14;
  uint64_t v15 = (void (**)(void))_Block_copy(aBlock);
  if ([WeakRetained isTestingConfiguration])
  {
    v15[2](v15);
  }
  else
  {
    int v16 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke_93;
    block[3] = &unk_1E5848D50;
    long long v18 = v15;
    dispatch_async(v16, block);
  }
}

void __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 76);
  uint64_t v3 = PLSearchBackendQueryGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 72));
      int v6 = [*(id *)(a1 + 32) searchQuery];
      id v7 = [v6 searchText];
      *(_DWORD *)buf = 138543618;
      char v12 = v5;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestion query has changed and was cancelled: %@", buf, 0x16u);
    }
    id v8 = [[PHSearchSuggestionQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (v4)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 72));
      uint64_t v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      char v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestion Query completed with result: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __76__PHSearchQueryManager_suggestionsForSearchText_options_suggestionsHandler___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)suggestionsForSearchQuery:(id)a3 rangeOfSuggestionText:(_NSRange)a4 searchQueryResult:(id)a5 suggestionsHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger v54 = a4.location;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v11 = a5;
  id v55 = a6;
  if (!v55)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 296, @"Invalid parameter not satisfying: %@", @"suggestionsHandler" object file lineNumber description];
  }
  char v12 = [(PHSearchQueryManager *)self currentSuggestionsQuery];
  [v12 cancel];

  [(PHSearchQueryManager *)self setCurrentSuggestionsQueryId:[(PHSearchQueryManager *)self currentSuggestionsQueryId] + 1];
  __int16 v13 = [v11 searchQuery];
  uint64_t v14 = [v13 queryIdentifier];

  uint64_t v15 = [v11 searchQuery];
  uint64_t v53 = [v15 batchIdentifier];

  uint64_t v16 = [v57 length];
  if (v11 && v16)
  {
    v56 = +[PHSearchQueryAnnotation selectedSuggestionsFromQueryString:inRange:](PHSearchQueryAnnotation, "selectedSuggestionsFromQueryString:inRange:", v57, v54, length);
    if ([v56 count] == 1)
    {
      __int16 v17 = [v11 searchQuery];
      long long v18 = [v17 searchOptions];
      id v19 = (PHSearchSuggestionQueryResult *)[v18 copy];

      id v20 = objc_alloc_init(PHSearchSuggestionOptions);
      [(PHSearchSuggestionOptions *)v20 setLimitSuggestionsToExactTextMatches:1];
      [(PHSearchSuggestionOptions *)v20 setSuggestionLimit:[(PHSearchSuggestionQueryResult *)v19 suggestionLimit]];
      [(PHSearchSuggestionOptions *)v20 setSuggestionResultTypes:[(PHSearchSuggestionQueryResult *)v19 searchQueryResultTypes]];
      id v21 = [(PHSearchSuggestionQueryResult *)v19 resultsHandlerQueue];
      [(PHSearchSuggestionOptions *)v20 setSuggestionsHandlerQueue:v21];

      [(PHSearchSuggestionOptions *)v20 setWantsUnscopedSuggestions:0];
      v51 = [v56 firstObject];
      id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v23 = [v51 text];
      v52 = (void *)[v22 initWithString:v23];

      uint64_t v24 = [PHSearchQuery alloc];
      int v25 = [(PHSearchQueryManager *)self photoLibrary];
      uint64_t v26 = [(PHSearchQuery *)v24 initWithText:v52 suggestionOptions:v20 photoLibrary:v25 queryIdentifier:[(PHSearchQueryManager *)self currentSuggestionsQueryId]];

      [(PHSearchQueryManager *)self setCurrentSuggestionsQuery:v26];
      objc_initWeak((id *)location, self);
      PLPhotosSearchGetLog();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v28 = os_signpost_id_generate(v27);

      long long v29 = v27;
      id v30 = v29;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "PLSearchBackendSuggestionsQuery", (const char *)&unk_19B30018E, buf, 2u);
      }
      v50 = v30;

      long long v31 = (void *)v26;
      NSUInteger v32 = length;
      id v33 = [(PHSearchQueryManager *)self queryQueue];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3254779904;
      v58[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke;
      v58[3] = &unk_1EEAC0D48;
      v63 = v50;
      os_signpost_id_t v64 = v28;
      v49 = v63;
      v58[4] = self;
      int v65 = v14;
      objc_copyWeak(&v62, (id *)location);
      int v66 = v53;
      id v34 = v52;
      id v59 = v34;
      id v61 = v55;
      id v35 = v20;
      v60 = v35;
      +[PHSearchQuery suggestionsForSearchQuery:searchQueryResult:rangeOfSuggestionText:queryQueue:suggestionsHandler:](PHSearchQuery, "suggestionsForSearchQuery:searchQueryResult:rangeOfSuggestionText:queryQueue:suggestionsHandler:", v31, v11, v54, v32, v33, v58);

      int v36 = [(PHSearchQueryManager *)self currentSuggestionsQueryId];
      objc_destroyWeak(&v62);

      objc_destroyWeak((id *)location);
    }
    else
    {
      __int16 v38 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if (v53) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v53, v14);
        }
        else {
        v43 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v14);
        }
        uint64_t v44 = [v56 count];
        v45 = @"contained multiple";
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v43;
        if (!v44) {
          v45 = @"did not contain any";
        }
        __int16 v69 = 2114;
        v70 = v45;
        __int16 v71 = 2112;
        id v72 = v57;
        _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Unable to generate suggestions because the provided query string %{public}@ suggestions: \"%@\"", location, 0x20u);
      }
      v46 = [PHSearchSuggestionQueryResult alloc];
      id v19 = [(PHSearchQueryManager *)self currentSearchQuery];
      id v35 = [(PHSearchSuggestionQueryResult *)v46 initWithSearchQuery:v19];
      (*((void (**)(id, PHSearchSuggestionOptions *, uint64_t, void))v55 + 2))(v55, v35, 3, 0);
      int v36 = 0;
    }
  }
  else
  {
    v37 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      if (v53) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v53, v14);
      }
      else {
      id v39 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v14);
      }
      uint64_t v40 = [v57 length];
      v41 = @"search query result";
      if (!v40) {
        v41 = @"search text";
      }
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v39;
      __int16 v69 = 2114;
      v70 = v41;
      _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Unable to generate suggestions for previous query without %{public}@", location, 0x16u);
    }
    v42 = [PHSearchSuggestionQueryResult alloc];
    v56 = [(PHSearchQueryManager *)self currentSearchQuery];
    id v19 = [(PHSearchSuggestionQueryResult *)v42 initWithSearchQuery:v56];
    (*((void (**)(id, PHSearchSuggestionQueryResult *, uint64_t, void))v55 + 2))(v55, v19, 3, 0);
    int v36 = 0;
  }

  return v36;
}

void __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke(int32x2_t *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = *(id *)&a1[9];
  uint64_t v10 = v9;
  os_signpost_id_t v11 = (os_signpost_id_t)a1[10];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = [*(id *)&a1[4] currentSuggestionsQueryId];
    __int32 v13 = a1[11].i32[0];
    uint64_t v14 = [v7 searchSuggestions];
    *(_DWORD *)buf = 67109888;
    int v38 = v12;
    __int16 v39 = 1024;
    __int32 v40 = v13;
    __int16 v41 = 1024;
    int v42 = 0;
    __int16 v43 = 2048;
    uint64_t v44 = [v14 count];
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PLSearchBackendSuggestionsQuery", "Suggestion Query: %d, for related Query: %d Batch: %d, Suggestions: %tu", buf, 0x1Eu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&a1[8]);
  uint64_t v16 = [v7 searchQuery];
  __int16 v17 = [WeakRetained currentSuggestionsQuery];
  char v18 = [v16 isEqual:v17] ^ 1;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_89;
  aBlock[3] = &unk_1E5846240;
  char v36 = v18;
  id v19 = (void *)a1[5];
  void aBlock[4] = a1[4];
  int32x2_t v35 = vrev64_s32(a1[11]);
  id v30 = v19;
  id v33 = *(id *)&a1[7];
  id v20 = v7;
  id v31 = v20;
  uint64_t v34 = a3;
  id v21 = v8;
  id v32 = v21;
  id v22 = (void (**)(void))_Block_copy(aBlock);
  if ([WeakRetained isTestingConfiguration])
  {
    v22[2](v22);
  }
  else
  {
    id v23 = [*(id *)&a1[6] suggestionsHandlerQueue];
    uint64_t v24 = v23;
    if (v23)
    {
      int v25 = v23;
    }
    else
    {
      int v25 = MEMORY[0x1E4F14428];
      id v26 = MEMORY[0x1E4F14428];
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_90;
    block[3] = &unk_1E5848D50;
    os_signpost_id_t v28 = v22;
    dispatch_async(v25, block);
  }
}

uint64_t __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_89(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v3 = PLSearchBackendQueryGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v5 = [*(id *)(a1 + 32) currentSuggestionsQueryId];
      if (*(_DWORD *)(a1 + 80)) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84));
      }
      else {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 84), v11);
      }
      id v8 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      int v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      __int16 v17 = v8;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "Suggestions query: %d for related query: %{public}@ has changed and was cancelled: %@", buf, 0x1Cu);
LABEL_12:
    }
  }
  else if (v4)
  {
    int v6 = [*(id *)(a1 + 32) currentSuggestionsQueryId];
    if (*(_DWORD *)(a1 + 80)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84));
    }
    else {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 84), v11);
    }
    id v9 = [*(id *)(a1 + 48) searchSuggestions];
    *(_DWORD *)buf = 67109634;
    int v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "Completed suggestions query: %d for related query: %{public}@ with suggestions: %@", buf, 0x1Cu);

    goto LABEL_12;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)performBatchSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v49 = a4;
  id v10 = a5;
  __int16 v41 = v9;
  v47 = v10;
  if ([v9 count])
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 209, @"Invalid parameter not satisfying: %@", @"searchTexts.count > 0" object file lineNumber description];

    if (v47) {
      goto LABEL_3;
    }
  }
  __int32 v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 210, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];

LABEL_3:
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  int v85 = 0;
  uint64_t v76 = MEMORY[0x1E4F143A8];
  uint64_t v77 = 3221225472;
  v78 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke;
  v79 = &unk_1E5848D28;
  v80 = self;
  v81 = &v82;
  PLRunWithUnfairLock();
  [(PHSearchQueryManager *)self _acquireSpotlightSandboxExtensionIfNeeded];
  uint64_t v11 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *((_DWORD *)v83 + 6);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[Batch: %d] ----- BEGIN BATCH SEARCH -----", buf, 8u);
  }

  PLPhotosSearchGetLog();
  int v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v13);

  __int16 v14 = v13;
  uint64_t v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendBatchQuery", (const char *)&unk_19B30018E, buf, 2u);
  }

  __int16 v16 = [(PHSearchQueryManager *)self _searchQueriesFromSearchTexts:v9 searchOptions:v49 batchQueryID:*((unsigned int *)v83 + 6)];
  v46 = (void *)[v16 count];
  *(void *)buf = 0;
  v92 = buf;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v69 = MEMORY[0x1E4F143A8];
  uint64_t v70 = 3221225472;
  __int16 v71 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_61;
  id v72 = &unk_1E5848318;
  uint64_t v73 = self;
  v75 = &v82;
  id v74 = v16;
  PLRunWithUnfairLock();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v17 = v74;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v65 objects:v90 count:16];
  if (v18)
  {
    uint64_t v52 = *(void *)v66;
    id v44 = v17;
    uint64_t v45 = v15;
    do
    {
      uint64_t v53 = v18;
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v66 != v52) {
          objc_enumerationMutation(v17);
        }
        id v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v21 = [v20 queryIdentifier];
        id v22 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = *((_DWORD *)v83 + 6);
          if (v23)
          {
            uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *((unsigned int *)v83 + 6), v21);
            v51 = (void *)v24;
          }
          else
          {
            uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v21);
            v50 = (void *)v24;
          }
          int v25 = [v20 searchText];
          id v26 = [v25 string];
          *(_DWORD *)v86 = 138543618;
          uint64_t v87 = v24;
          __int16 v88 = 2112;
          v89 = v26;
          _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Begin query: \"%@\"", v86, 0x16u);

          id v17 = v44;
          uint64_t v15 = v45;

          id v27 = v51;
          if (!v23) {
            id v27 = v50;
          }
        }
        objc_initWeak(&location, self);
        os_signpost_id_t v28 = [v20 searchText];
        BOOL v29 = [v28 length] == 0;

        if (v29)
        {
          id v31 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v32 = *((_DWORD *)v83 + 6);
            if (v32)
            {
              uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *((unsigned int *)v83 + 6), v21);
              uint64_t v34 = (void *)v33;
              int32x2_t v35 = v43;
            }
            else
            {
              uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v21);
              int32x2_t v35 = (void *)v33;
              uint64_t v34 = v42;
            }
            *(_DWORD *)v86 = 138543362;
            uint64_t v87 = v33;
            _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Encountered empty query, moving on to next query.", v86, 0xCu);
            int v42 = v34;
            __int16 v43 = v35;
            if (v32) {
              char v36 = v34;
            }
            else {
              char v36 = v35;
            }
          }
          ++*((void *)v92 + 3);
        }
        else
        {
          id v30 = [(PHSearchQueryManager *)self batchQueryQueue];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3254779904;
          v54[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_66;
          v54[3] = &unk_1EEABE0B0;
          id v59 = &v82;
          int v63 = v21;
          v58 = buf;
          v54[4] = v20;
          objc_copyWeak(v60, &location);
          v60[1] = v46;
          v54[5] = self;
          id v61 = v15;
          os_signpost_id_t v62 = spid;
          id v55 = v17;
          id v57 = v47;
          id v56 = v49;
          +[PHSearchQuery performSearch:v20 queryQueue:v30 resultsHandler:v54];

          objc_destroyWeak(v60);
        }
        objc_destroyWeak(&location);
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v65 objects:v90 count:16];
    }
    while (v18);
  }

  int v37 = *((_DWORD *)v83 + 6);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v82, 8);
  return v37;
}

uint64_t __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = ++*(_DWORD *)(*(void *)(result + 32) + 36);
  return result;
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_61(void *a1)
{
  uint64_t v1 = a1[5];
  int v2 = *(void **)(a1[4] + 80);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_66(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  id v9 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(unsigned int *)(a1 + 120));
    }
    else {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 120), v35);
    }
    uint64_t v11 = [*(id *)(a1 + 32) searchText];
    int v12 = [v11 string];
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v52 = v10;
    *(_WORD *)&v52[8] = 2112;
    *(void *)&v52[10] = v12;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed query: \"%@\".", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v15 = *(void *)(a1 + 96);
  BOOL v16 = v14 == v15;
  if (v14 == v15)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_67;
    v48 = &unk_1E5848D28;
    uint64_t v18 = *(void *)(a1 + 80);
    uint64_t v49 = v17;
    uint64_t v50 = v18;
    PLRunWithUnfairLock();
    id v19 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v52 = v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "[Batch: %d] ----- COMPLETED BATCH SEARCH -----", buf, 8u);
    }

    uint64_t v21 = *(id *)(a1 + 104);
    id v22 = v21;
    os_signpost_id_t v23 = *(void *)(a1 + 112);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v25 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v52 = v24;
      *(_WORD *)&v52[4] = 2048;
      *(void *)&v52[6] = v25;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLSearchBackendBatchQuery", "Batch: %d, Queries: %tu", buf, 0x12u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_68;
  aBlock[3] = &unk_1E5846218;
  id v26 = v7;
  id v39 = v26;
  id v27 = *(id *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 32);
  id v42 = v27;
  uint64_t v43 = a3;
  uint64_t v40 = v28;
  BOOL v44 = v16;
  id v29 = v8;
  id v41 = v29;
  id v30 = (void (**)(void))_Block_copy(aBlock);
  if ([WeakRetained isTestingConfiguration])
  {
    v30[2](v30);
  }
  else
  {
    id v31 = [*(id *)(a1 + 56) resultsHandlerQueue];
    int v32 = v31;
    if (v31)
    {
      uint64_t v33 = v31;
    }
    else
    {
      uint64_t v33 = MEMORY[0x1E4F14428];
      id v34 = MEMORY[0x1E4F14428];
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_2;
    block[3] = &unk_1E5848D50;
    int v37 = v30;
    dispatch_async(v33, block);
  }
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_67(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 80);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v1 setObject:0 forKeyedSubscript:v2];
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchQuery];
  int v3 = [v2 isCancelled];

  uint64_t v4 = *(void *)(a1 + 56);
  if (v3)
  {
    uint64_t v11 = [[PHSearchQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, void, void))(v4 + 16))(v4, v11, 2, 0, 0);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v10 = *(void *)(a1 + 56);
    v9(v10, v5, v6, v7, v8);
  }
}

uint64_t __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)performSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v37 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v32 = v10;
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 144, @"Invalid parameter not satisfying: %@", @"searchText" object file lineNumber description];

    id v10 = v32;
  }
  char v36 = v10;
  if (!v10)
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PHSearchQueryManager.m", 145, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];
  }
  uint64_t v11 = [(PHSearchQueryManager *)self currentSearchQuery];
  [v11 cancel];

  [(PHSearchQueryManager *)self setCurrentQueryId:[(PHSearchQueryManager *)self currentQueryId] + 1];
  int v12 = [PHSearchQuery alloc];
  int v13 = [(PHSearchQueryManager *)self photoLibrary];
  uint64_t v14 = [(PHSearchQuery *)v12 initWithSearchText:v9 searchOptions:v37 photoLibrary:v13 queryIdentifier:[(PHSearchQueryManager *)self currentQueryId] batchIdentifier:0];

  [(PHSearchQueryManager *)self setCurrentSearchQuery:v14];
  uint64_t v15 = [(PHSearchQuery *)v14 queryIdentifier];
  BOOL v16 = [v37 resultsHandlerQueue];
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v18 = v16;
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F14428];
    id v19 = MEMORY[0x1E4F14428];
  }

  if ([(id)objc_opt_class() _isValidQueryText:v9])
  {
    [(PHSearchQueryManager *)self _acquireSpotlightSandboxExtensionIfNeeded];
    objc_initWeak(&location, self);
    int v20 = PLPhotosSearchGetLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);
    id v22 = v20;
    os_signpost_id_t v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PLSearchBackendQuery", (const char *)&unk_19B30018E, buf, 2u);
    }
    uint64_t v35 = v23;

    int v24 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v15);
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v25;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ ----- BEGIN SEARCH -----", buf, 0xCu);
    }
    id v26 = [(PHSearchQueryManager *)self queryQueue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3254779904;
    v38[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_54;
    v38[3] = &unk_1EEABE120;
    id v27 = v35;
    id v42 = v27;
    os_signpost_id_t v43 = v21;
    int v44 = v15;
    objc_copyWeak(&v41, &location);
    id v40 = v36;
    id v39 = v18;
    +[PHSearchQuery performSearch:v14 queryQueue:v26 resultsHandler:v38];

    int v28 = [(PHSearchQueryManager *)self currentQueryId];
    objc_destroyWeak(&v41);

    objc_destroyWeak(&location);
  }
  else
  {
    id v29 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v15);
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v30;
      __int16 v51 = 2112;
      id v52 = v9;
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Query is invalid, returning early: %@.", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke;
    block[3] = &unk_1E5848790;
    id v48 = v36;
    v47 = v14;
    dispatch_async(v18, block);
    int v28 = [(PHSearchQueryManager *)self currentQueryId];
  }
  return v28;
}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [[PHSearchQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, void))(v1 + 16))(v1, v2, 1, 0);
}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_54(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = *(id *)(a1 + 56);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v26 = *(_DWORD *)(a1 + 72);
    int v28 = [v7 searchResults];
    uint64_t v25 = [v28 count];
    id v27 = [v7 rankedAssetSearchResults];
    uint64_t v12 = [v27 count];
    int v13 = [v7 queryMatchDetails];
    uint64_t v14 = [v13 queryEmbedding];
    uint64_t v15 = @"YES";
    if (!v14) {
      uint64_t v15 = @"NO";
    }
    BOOL v16 = v15;
    *(_DWORD *)buf = 67110146;
    int v39 = v26;
    __int16 v40 = 1024;
    int v41 = 0;
    __int16 v42 = 2048;
    uint64_t v43 = v25;
    __int16 v44 = 2048;
    uint64_t v45 = v12;
    __int16 v46 = 2112;
    v47 = v16;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PLSearchBackendQuery", "Query: %d, Batch: %d, PHSearchResults: %tu, Top Assets: %tu, Query Embedding: %@", buf, 0x2Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v18 = [v7 searchQuery];
  id v19 = [WeakRetained currentSearchQuery];
  char v20 = [v18 isEqual:v19] ^ 1;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_55;
  aBlock[3] = &unk_1E58461F0;
  char v37 = v20;
  int v36 = *(_DWORD *)(a1 + 72);
  id v21 = v7;
  id v32 = v21;
  id v34 = *(id *)(a1 + 40);
  id v22 = v8;
  id v33 = v22;
  uint64_t v35 = a3;
  os_signpost_id_t v23 = (void (**)(void))_Block_copy(aBlock);
  if ([WeakRetained isTestingConfiguration])
  {
    v23[2](v23);
  }
  else
  {
    int v24 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_56;
    block[3] = &unk_1E5848D50;
    id v30 = v23;
    dispatch_async(v24, block);
  }
}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 68);
  int v3 = PLSearchBackendQueryGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 64));
      uint64_t v6 = [*(id *)(a1 + 32) searchQuery];
      id v7 = [v6 searchText];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Query has changed and was cancelled: %@", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [PHSearchQueryResult alloc];
    id v10 = [*(id *)(a1 + 32) searchQuery];
    os_signpost_id_t v11 = [(PHSearchQueryResult *)v9 initWithSearchQuery:v10];
    (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, void))(v8 + 16))(v8, v11, 2, *(void *)(a1 + 40));
  }
  else
  {
    if (v4)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 64));
      int v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Query result: %@", buf, 0x16u);
    }
    uint64_t v14 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 64));
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ ----- COMPLETED SEARCH -----", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preheatSearchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHSearchQueryManager *)self photoLibrary];
  uint64_t v6 = [(PHSearchQueryManager *)self queryQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PHSearchQueryManager_preheatSearchWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E5848790;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v10);
  dispatch_async(v6, v9);
}

uint64_t __57__PHSearchQueryManager_preheatSearchWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) wellKnownPhotoLibraryIdentifier];
    id v4 = [*(id *)(a1 + 32) photoLibraryURL];
    int v11 = 134349314;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEFAULT, "Preheat Search for PhotoLibrary identifier %{public}td, url: %@", (uint8_t *)&v11, 0x16u);
  }
  if ([MEMORY[0x1E4F8AC10] spotlightPrivateIndexEnabled])
  {
    uint64_t v5 = [*(id *)(a1 + 32) pathManager];
    uint64_t v6 = [v5 spotlightSearchIndexPath];

    id v7 = (void *)MEMORY[0x1E4F23800];
    id v8 = PLSearchFileProtectionTypes();
    [v7 prepareProtectionClasses:v8 path:v6];
  }
  else
  {
    dispatch_block_t v9 = (void *)MEMORY[0x1E4F23890];
    uint64_t v6 = PLSearchFileProtectionTypes();
    [v9 prepareProtectionClasses:v6];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  [(PHSearchQueryManager *)self _releaseSpotlightSandboxExtension];
  v3.receiver = self;
  v3.super_class = (Class)PHSearchQueryManager;
  [(PHSearchQueryManager *)&v3 dealloc];
}

- (id)initForTestingWithPhotoLibrary:(id)a3
{
  objc_super v3 = [(PHSearchQueryManager *)self initWithPhotoLibrary:a3];
  [(PHSearchQueryManager *)v3 setIsTestingConfiguration:1];
  return v3;
}

+ (BOOL)_isValidQueryText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [v3 string];
    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)currentSpotlightVersionSupportsExactMatchBehaviorWithEmbeddingOnlyResults
{
  return 1;
}

+ (BOOL)currentSpotlightVersionSupportsExactMatchBehavior
{
  return 1;
}

@end