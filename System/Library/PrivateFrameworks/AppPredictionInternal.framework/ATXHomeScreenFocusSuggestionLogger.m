@interface ATXHomeScreenFocusSuggestionLogger
- (ATXBiomeSuggestedHomePageStream)stream;
- (ATXHomeScreenFocusSuggestionLogger)init;
- (NSURL)suggestedHomePageStreamBookmarkURLPath;
- (id)generateSuggestedHomePageStreamBookmark;
- (id)generateSuggestedHomePageStreamBookmarkURLPath;
- (void)logHomeScreenFocusSuggestionMetrics;
- (void)setStream:(id)a3;
- (void)setSuggestedHomePageStreamBookmarkURLPath:(id)a3;
- (void)writeBookmarkToFile:(id)a3;
@end

@implementation ATXHomeScreenFocusSuggestionLogger

- (ATXHomeScreenFocusSuggestionLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenFocusSuggestionLogger;
  v2 = [(ATXHomeScreenFocusSuggestionLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXBiomeSuggestedHomePageStream *)v3;
  }
  return v2;
}

- (id)generateSuggestedHomePageStreamBookmarkURLPath
{
  suggestedHomePageStreamBookmarkURLPath = self->_suggestedHomePageStreamBookmarkURLPath;
  if (suggestedHomePageStreamBookmarkURLPath)
  {
    uint64_t v3 = suggestedHomePageStreamBookmarkURLPath;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    objc_super v6 = [MEMORY[0x1E4F4B650] metricsRootDirectory];
    id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v8 = [v6 stringByAppendingPathComponent:v5];
    uint64_t v3 = (NSURL *)[v7 initFileURLWithPath:v8];
  }
  return v3;
}

- (id)generateSuggestedHomePageStreamBookmark
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4B618];
  v4 = [(ATXHomeScreenFocusSuggestionLogger *)self generateSuggestedHomePageStreamBookmarkURLPath];
  v5 = [v3 bookmarkFromURLPath:v4 maxFileSize:3000000 versionNumber:&unk_1F27F2448];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v7 = [(ATXHomeScreenFocusSuggestionLogger *)self generateSuggestedHomePageStreamBookmarkURLPath];
    v5 = (void *)[v6 initWithURLPath:v7 versionNumber:&unk_1F27F2448 bookmark:0 metadata:0];
  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v6 = 0;
  [a3 saveBookmarkWithError:&v6];
  id v4 = v6;
  if (v4)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXModeSetupExperienceMetricsLogger *)(uint64_t)self writeBookmarkToFile:v5];
    }
  }
}

- (void)logHomeScreenFocusSuggestionMetrics
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [(ATXHomeScreenFocusSuggestionLogger *)self generateSuggestedHomePageStreamBookmark];
  v5 = [(ATXHomeScreenFocusSuggestionLogger *)self stream];
  id v6 = [v5 publisherFromStartTime:0.0];
  id v7 = [v4 bookmark];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke;
  v50[3] = &unk_1E68B3440;
  id v37 = v4;
  id v51 = v37;
  v52 = self;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_10;
  v48[3] = &unk_1E68ABB70;
  id v8 = v3;
  id v49 = v8;
  id v9 = (id)[v6 sinkWithBookmark:v7 completion:v50 receiveInput:v48];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v40 = v8;
  id obj = [v8 allKeys];
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D25F6CC0]();
        v13 = objc_opt_new();
        v14 = [v40 objectForKeyedSubscript:v11];
        uint64_t v15 = [v14 count];
        uint64_t v16 = v15 - 1;
        if (v15 < 1)
        {
          BOOL v20 = 0;
        }
        else
        {
          do
          {
            v17 = [v14 objectAtIndexedSubscript:--v15];
            v18 = [v17 eventBody];
            uint64_t v19 = [v18 action];

            BOOL v20 = v19 != 2;
            if (v19 != 2)
            {
              uint64_t v16 = v15;
              goto LABEL_12;
            }
          }
          while (v15 >= 1);
          uint64_t v16 = -1;
        }
LABEL_12:
        v21 = +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", [v11 integerValue]);
        [v21 integerValue];
        v22 = DNDModeSemanticTypeToString();
        [v13 setModeSemanticType:v22];

        if (v20
          && ([v14 objectAtIndexedSubscript:v16],
              v23 = objc_claimAutoreleasedReturnValue(),
              [v23 eventBody],
              v24 = objc_claimAutoreleasedReturnValue(),
              uint64_t v25 = [v24 action],
              v24,
              v23,
              v25 == 1))
        {
          v26 = [v14 objectAtIndexedSubscript:v16];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_2;
          v42[3] = &unk_1E68AF140;
          id v27 = v26;
          id v43 = v27;
          v28 = objc_msgSend(v14, "_pas_filteredArrayWithTest:", v42);
          v29 = [v28 firstObject];

          BOOL v33 = 0;
          if (v29)
          {
            [v29 timestamp];
            double v31 = v30;
            [v27 timestamp];
            if (v31 - v32 < 86400.0) {
              BOOL v33 = 1;
            }
          }
          [v13 setOutcome:v33];
        }
        else
        {
          v34 = objc_msgSend(v14, "_pas_filteredArrayWithTest:", &__block_literal_global_224);
          uint64_t v35 = [v34 count];

          if (v35) {
            uint64_t v36 = 2;
          }
          else {
            uint64_t v36 = 3;
          }
          [v13 setOutcome:v36];
        }
        [v13 logToCoreAnalytics];
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v41);
  }
}

void __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 error];
  if (v7)
  {
  }
  else if (![v5 state])
  {
    goto LABEL_7;
  }
  id v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(v5, v8);
  }

LABEL_7:
  [*(id *)(a1 + 32) setBookmark:v6];
  [*(id *)(a1 + 40) writeBookmarkToFile:*(void *)(a1 + 32)];
}

void __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_10(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 eventBody];
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "pageType"));
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 addObject:v9];
  }
  else
  {
    id v6 = objc_opt_new();
    [v6 addObject:v9];
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "pageType"));
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

BOOL __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  id v5 = [v4 identifier];
  id v6 = [*(id *)(a1 + 32) eventBody];
  id v7 = [v6 identifier];
  if ([v5 isEqualToString:v7])
  {
    id v8 = [v3 eventBody];
    BOOL v9 = [v8 action] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL __73__ATXHomeScreenFocusSuggestionLogger_logHomeScreenFocusSuggestionMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 action] == 2;

  return v3;
}

- (ATXBiomeSuggestedHomePageStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (NSURL)suggestedHomePageStreamBookmarkURLPath
{
  return self->_suggestedHomePageStreamBookmarkURLPath;
}

- (void)setSuggestedHomePageStreamBookmarkURLPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedHomePageStreamBookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end