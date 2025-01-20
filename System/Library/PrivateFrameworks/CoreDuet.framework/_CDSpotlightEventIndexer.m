@interface _CDSpotlightEventIndexer
- (BOOL)isIndexing;
- (_CDEventIndexerContext)context;
- (_CDSpotlightEventIndexer)initWithDataSource:(id)a3;
- (uint64_t)_beginIndexingFromLatestSpotlightClientState;
- (void)beginIndexingWithBatchSize:(unint64_t)a3 completion:(id)a4;
- (void)finishIndexing;
- (void)indexAdditionsAsBatch;
- (void)indexDeletionsAsBatch;
- (void)resetIndex;
- (void)setContext:(id)a3;
@end

@implementation _CDSpotlightEventIndexer

- (_CDSpotlightEventIndexer)initWithDataSource:(id)a3
{
  id v5 = a3;
  CSSearchableIndexClass = (objc_class *)getCSSearchableIndexClass();
  if (CSSearchableIndexClass
    && (v7 = CSSearchableIndexClass,
        ([(objc_class *)CSSearchableIndexClass isIndexingAvailable] & 1) != 0))
  {
    v19.receiver = self;
    v19.super_class = (Class)_CDSpotlightEventIndexer;
    v8 = [(_CDSpotlightEventIndexer *)&v19 init];
    if (v8)
    {
      v9 = NSString;
      v10 = [v5 stream];
      v11 = [v10 name];
      v12 = [v9 stringWithFormat:@"com.apple.coreduet:%@", v11];

      id v13 = [v7 alloc];
      uint64_t v14 = [v13 initWithName:v12 protectionClass:*MEMORY[0x1E4F28358]];
      index = v8->_index;
      v8->_index = (CSSearchableIndex *)v14;

      objc_storeStrong((id *)&v8->_dataSource, a3);
    }
    self = v8;
    v16 = self;
  }
  else
  {
    v17 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CDSpotlightEventIndexer initWithDataSource:]();
    }

    v16 = 0;
  }

  return v16;
}

- (BOOL)isIndexing
{
  v2 = [(_CDSpotlightEventIndexer *)self context];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)beginIndexingWithBatchSize:(unint64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if ([(_CDSpotlightEventIndexer *)v7 isIndexing])
  {
    v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Spotlight event indexer is already in the process of indexing", (uint8_t *)&v19, 2u);
    }

    objc_sync_exit(v7);
  }
  else
  {
    v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        dataSource = v7->_dataSource;
      }
      else {
        dataSource = 0;
      }
      v11 = dataSource;
      v12 = [(_CDSpotlightEventIndexerDataSource *)v11 stream];
      id v13 = [v12 name];
      int v19 = 138412290;
      v20 = v13;
      _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Begin indexing %@ events with spotlight", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v14 = objc_alloc_init(_CDEventIndexerContext);
    [(_CDSpotlightEventIndexer *)v7 setContext:v14];

    objc_sync_exit(v7);
    v15 = [(_CDSpotlightEventIndexer *)v7 context];
    if (v15) {
      v15[3] = a3;
    }

    v16 = [(_CDSpotlightEventIndexer *)v7 context];
    v18 = v16;
    if (v16) {
      objc_setProperty_nonatomic_copy(v16, v17, v6, 32);
    }

    -[_CDSpotlightEventIndexer _beginIndexingFromLatestSpotlightClientState]((uint64_t)v7);
  }
}

- (uint64_t)_beginIndexingFromLatestSpotlightClientState
{
  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke;
    v2[3] = &unk_1E5610428;
    v2[4] = result;
    return [v1 fetchLastClientStateWithCompletionHandler:v2];
  }
  return result;
}

- (void)finishIndexing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = v1[3];
      v4 = [v3 stream];
      id v5 = [v4 name];
      uint64_t v6 = [v1 context];
      v7 = (void *)v6;
      if (v6) {
        v8 = *(__CFString **)(v6 + 8);
      }
      else {
        v8 = 0;
      }
      if (!v8) {
        v8 = @"<never fetched>";
      }
      int v15 = 138412546;
      v16 = v5;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Finished indexing %@ events with spotlight, final bookmark: %@", (uint8_t *)&v15, 0x16u);
    }
    v9 = [v1 context];
    if (v9) {
      uint64_t v10 = v9[4];
    }
    else {
      uint64_t v10 = 0;
    }

    if (v10)
    {
      uint64_t v11 = [v1 context];
      v12 = (void *)v11;
      if (v11) {
        id v13 = *(void **)(v11 + 32);
      }
      else {
        id v13 = 0;
      }
      uint64_t v14 = v13;
      v14[2]();
    }
    [v1 setContext:0];
    objc_sync_exit(v1);
  }
}

- (void)indexDeletionsAsBatch
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Spotlight event indexer data source failed to fetch earliest event creation date: %@", v2, v3, v4, v5, v6);
}

- (void)resetIndex
{
  if (a1)
  {
    [*(id *)(a1 + 16) beginIndexBatch];
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v2 timeIntervalSinceReferenceDate];
    double v4 = v3;

    [*(id *)(a1 + 16) _deleteActionsBeforeTime:0 completionHandler:v4];
    uint64_t v5 = (void *)[(id)objc_opt_class() currentVersion];
    uint8_t v6 = +[_CDEventIndexerBookmark baseBookmarkWithVersion:]((uint64_t)_CDEventIndexerBookmark, v5);
    v7 = _CDClientStateFromEventIndexerBookmark((uint64_t)v6);
    v8 = *(void **)(a1 + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38___CDSpotlightEventIndexer_resetIndex__block_invoke;
    v10[3] = &unk_1E560D7A8;
    v10[4] = a1;
    id v11 = v6;
    id v9 = v6;
    [v8 endIndexBatchWithClientState:v7 completionHandler:v10];
  }
}

- (void)indexAdditionsAsBatch
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = *a1;
  uint8_t v6 = [v5 stream];
  v7 = [v6 name];
  OUTLINED_FUNCTION_1();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Spotlight event indexer data source failed to fetch %@ events: %@", v8, 0x16u);
}

- (_CDEventIndexerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithDataSource:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Spotlight indexing is not supported on this device", v1, 2u);
}

@end