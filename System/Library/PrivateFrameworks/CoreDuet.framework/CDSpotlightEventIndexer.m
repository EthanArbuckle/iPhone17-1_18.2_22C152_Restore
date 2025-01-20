@interface CDSpotlightEventIndexer
@end

@implementation CDSpotlightEventIndexer

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_5();
    }

    id v8 = *(id *)(a1 + 32);
LABEL_5:
    -[_CDSpotlightEventIndexer finishIndexing](v8);
    goto LABEL_34;
  }
  v9 = (id *)(a1 + 32);
  v10 = (void *)[(id)objc_opt_class() currentVersion];
  v11 = [*v9 context];
  if (v11) {
    v11[2] = v10;
  }

  id v12 = v5;
  v13 = v12;
  if (!v12 || ![v12 length]) {
    goto LABEL_15;
  }
  *(void *)v30 = 0;
  v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:v30];
  id v15 = *(id *)v30;
  if (v15)
  {
    v16 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_4();
    }
  }
  if (!v14)
  {
LABEL_15:
    v14 = +[_CDEventIndexerBookmark baseBookmarkWithVersion:]((uint64_t)_CDEventIndexerBookmark, v10);
  }

  v17 = [*v9 context];
  -[_DKPredictionTimeline setStartDate:]((uint64_t)v17, v14);

  v18 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = &stru_1EDDE58B8;
    if (v13 && [v13 length]) {
      v19 = @"non-";
    }
    uint64_t v20 = [*v9 context];
    v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = *(void *)(v20 + 8);
    }
    else {
      uint64_t v22 = 0;
    }
    *(_DWORD *)v30 = 138412546;
    *(void *)&v30[4] = v19;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Success fetching %@nil client state from spotlight, resulting bookmark: %@", v30, 0x16u);
  }
  v23 = [*v9 context];
  int v24 = -[_CDEventIndexerContext isBookmarkValid]((uint64_t)v23);

  if (v24)
  {
    -[_CDSpotlightEventIndexer indexDeletionsAsBatch]((uint64_t)*v9);
    goto LABEL_34;
  }
  v25 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_3(v9, v25);
  }

  v26 = [*v9 context];
  int v27 = -[_CDEventIndexerContext isBookmarkValidInRecoverableThreshold]((uint64_t)v26);

  v28 = +[_CDLogging knowledgeChannel];
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_1();
    }

    id v8 = *v9;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_2();
  }

  -[_CDSpotlightEventIndexer resetIndex]((uint64_t)*v9);
LABEL_34:
}

void __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) context];
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);

    v7 = [*(id *)(a1 + 32) context];
    if (v7)
    {
      uint64_t v8 = v7[3];

      if (v8)
      {
        -[_CDSpotlightEventIndexer indexAdditionsAsBatch](*(id **)(a1 + 32));
        goto LABEL_9;
      }
    }
  }
  -[_CDSpotlightEventIndexer finishIndexing](*(void **)(a1 + 32));
LABEL_9:
}

void __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) context];
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);

    if (*(unsigned char *)(a1 + 48))
    {
      -[_CDSpotlightEventIndexer indexAdditionsAsBatch](*(void *)(a1 + 32));
      goto LABEL_8;
    }
  }
  -[_CDSpotlightEventIndexer finishIndexing](*(void **)(a1 + 32));
LABEL_8:
}

void __38___CDSpotlightEventIndexer_resetIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38___CDSpotlightEventIndexer_resetIndex__block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) context];
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);
  }
  v7 = [*(id *)(a1 + 32) context];
  int v8 = -[_CDEventIndexerContext isBookmarkValid]((uint64_t)v7);

  v9 = *(void **)(a1 + 32);
  if (v8) {
    -[_CDSpotlightEventIndexer indexDeletionsAsBatch]((uint64_t)v9);
  }
  else {
    -[_CDSpotlightEventIndexer finishIndexing](v9);
  }
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "[Spotlight Indexer] Bookmark is within recoverable threshold", v1, 2u);
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Bookmark is outside of recoverable threshold or has an unknown version, resetting spotlight index", v1, 2u);
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_3(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 context];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Bookmark is invalid: %@", v4, 0xCu);
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Error unarchiving event indexer bookmark: %@", v2, v3, v4, v5, v6);
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Error fetching client state from spotlight: %@", v2, v3, v4, v5, v6);
}

void __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to index batch deletions: %@", v2, v3, v4, v5, v6);
}

void __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to index batch additions: %@", v2, v3, v4, v5, v6);
}

void __38___CDSpotlightEventIndexer_resetIndex__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to reset index: %@", v2, v3, v4, v5, v6);
}

@end