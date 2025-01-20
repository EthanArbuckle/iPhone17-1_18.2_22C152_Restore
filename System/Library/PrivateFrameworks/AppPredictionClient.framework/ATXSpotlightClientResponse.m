@interface ATXSpotlightClientResponse
+ (id)_createEmptyResultsWithCount:(unint64_t)a3;
+ (id)_limitingResults:(id)a3 scores:(id)a4 spotlightRecentIndex:(unint64_t)a5 limit:(unint64_t)a6;
+ (id)_removeDuplicates:(id)a3;
+ (id)_resultForError:(id)a3 subtitles:(id)a4 searchString:(id)a5;
+ (id)createSectionWithTitle:(id)a3 sectionBundleIdentifier:(id)a4 resultCount:(unint64_t)a5;
+ (unint64_t)_indexOfFirstSpotlightRecentInServerResults:(id)a3 withSections:(id)a4;
+ (unint64_t)_trialSuggestionsMaxCountWithDefault:(unint64_t)a3;
+ (void)_logWeatherResponsesWithTopics:(id)a3 serverResults:(id)a4;
- (ATXSpotlightClientResponse)initWithTopics:(id)a3 scores:(id)a4 sections:(id)a5;
- (NSArray)codePathIdTriggers;
- (NSArray)sections;
- (NSArray)topics;
- (NSUUID)codePathIdTrigger;
- (id)_addIdentifiersFromTopics:(id)a3 serverTopics:(id)a4;
- (id)_createSectionsFromServerResults:(id)a3;
- (id)_createSectionsFromServerResults:(id)a3 limit:(unint64_t)a4;
- (id)_removeDuplicateTopics:(id)a3;
- (id)_removeHidden:(id)a3;
- (id)_replaceMissingWithError:(id)a3;
- (id)createSectionsFromServerResults:(id)a3;
- (void)_updateSectionBundleIdentifiersWithServerResults:(id)a3;
- (void)addCodePathId:(id)a3;
- (void)dealloc;
@end

@implementation ATXSpotlightClientResponse

- (id)createSectionsFromServerResults:(id)a3
{
  return [(ATXSpotlightClientResponse *)self _createSectionsFromServerResults:a3 limit:10];
}

- (id)_createSectionsFromServerResults:(id)a3 limit:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = __atxlog_handle_metrics();
  v8 = v7;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v8, OS_SIGNPOST_INTERVAL_END, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", (uint8_t *)&v39, 2u);
  }

  self->_os_signpost_id_t signpostId = 0;
  v10 = __atxlog_handle_ui();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v11 = [(NSArray *)self->_topics count];
    NSUInteger v12 = [(NSArray *)self->_scores count];
    uint64_t v13 = [v6 count];
    int v39 = 134218496;
    NSUInteger v40 = v11;
    __int16 v41 = 2048;
    NSUInteger v42 = v12;
    __int16 v43 = 2048;
    uint64_t v44 = v13;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Create sections from server response - topics: %lu, scores: %lu, received: %lu", (uint8_t *)&v39, 0x20u);
  }

  NSUInteger v14 = [(NSArray *)self->_topics count];
  if (v14 != [(NSArray *)self->_scores count]
    || (NSUInteger v15 = -[NSArray count](self->_topics, "count"), v15 != [v6 count]))
  {
    v31 = __atxlog_handle_ui();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      NSUInteger v36 = [(NSArray *)self->_topics count];
      NSUInteger v37 = [(NSArray *)self->_scores count];
      uint64_t v38 = [v6 count];
      int v39 = 134218496;
      NSUInteger v40 = v36;
      __int16 v41 = 2048;
      NSUInteger v42 = v37;
      __int16 v43 = 2048;
      uint64_t v44 = v38;
      _os_log_fault_impl(&dword_1A790D000, v31, OS_LOG_TYPE_FAULT, "ZKW Server Result: Server did not send back same count. Sent topics: %lu, scores: %lu Received: %lu", (uint8_t *)&v39, 0x20u);
    }
    goto LABEL_20;
  }
  if (![(NSArray *)self->_topics count])
  {
    v31 = __atxlog_handle_ui();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v33 = [(NSArray *)self->_topics count];
      NSUInteger v34 = [(NSArray *)self->_scores count];
      uint64_t v35 = [v6 count];
      int v39 = 134218496;
      NSUInteger v40 = v33;
      __int16 v41 = 2048;
      NSUInteger v42 = v34;
      __int16 v43 = 2048;
      uint64_t v44 = v35;
      _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Requested no topics, returning. Sent topics: %lu, scores: %lu Received: %lu", (uint8_t *)&v39, 0x20u);
    }
LABEL_20:

    v30 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  [(id)objc_opt_class() _logWeatherResponsesWithTopics:self->_topics serverResults:v6];
  v16 = [(ATXSpotlightClientResponse *)self _replaceMissingWithError:v6];

  v17 = [(id)objc_opt_class() _removeDuplicates:v16];

  [(ATXSpotlightClientResponse *)self _updateSectionBundleIdentifiersWithServerResults:v17];
  v18 = [(ATXSpotlightClientResponse *)self _addIdentifiersFromTopics:self->_topics serverTopics:v17];

  int v19 = [MEMORY[0x1E4F4B628] isZKWHideContextsEnabled];
  self->_isZKWHideContextsEnabled = v19;
  if (v19)
  {
    v20 = (ATXSpotlightHidingUIController *)objc_opt_new();
    controller = self->_controller;
    self->_controller = v20;

    uint64_t v22 = [(ATXSpotlightClientResponse *)self _removeHidden:v18];

    v18 = (void *)v22;
  }
  v23 = [(ATXSpotlightClientResponse *)self _removeDuplicateTopics:v18];

  uint64_t v24 = [(id)objc_opt_class() _indexOfFirstSpotlightRecentInServerResults:v23 withSections:self->_sections];
  v25 = __atxlog_handle_ui();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 134217984;
    NSUInteger v40 = v24;
    _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Index of first spotlight recent: %lu", (uint8_t *)&v39, 0xCu);
  }

  v26 = [v23 indexesOfObjectsPassingTest:&__block_literal_global_70];
  unint64_t v27 = [v26 count];

  if (v27 >= 5)
  {
    v28 = +[ATXSpotlightZKWTrialClientWrapper sharedInstance];
    if ([v28 matchesSuggestionsMaxCount])
    {
      v29 = [v28 codePathIdForSuggestionsMaxCount];
      [(ATXSpotlightClientResponse *)self addCodePathId:v29];
    }
  }
  id v6 = [(id)objc_opt_class() _limitingResults:v23 scores:self->_scores spotlightRecentIndex:v24 limit:a4];

  v30 = [(ATXSpotlightClientResponse *)self _createSectionsFromServerResults:v6];
LABEL_21:

  return v30;
}

BOOL __69__ATXSpotlightClientResponse__createSectionsFromServerResults_limit___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 results];
  v3 = [v2 firstObject];

  return v3 != 0;
}

- (ATXSpotlightClientResponse)initWithTopics:(id)a3 scores:(id)a4 sections:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXSpotlightClientResponse;
  NSUInteger v12 = [(ATXSpotlightClientResponse *)&v22 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topics, a3);
    objc_storeStrong((id *)&v13->_scores, a4);
    objc_storeStrong((id *)&v13->_sections, a5);
    NSUInteger v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    codePathIdTriggers = v13->_codePathIdTriggers;
    v13->_codePathIdTriggers = v14;

    v16 = __atxlog_handle_metrics();
    v13->_os_signpost_id_t signpostId = os_signpost_id_generate(v16);

    if (![(NSArray *)v13->_topics count]) {
      v13->_os_signpost_id_t signpostId = 0;
    }
    v17 = __atxlog_handle_metrics();
    v18 = v17;
    os_signpost_id_t signpostId = v13->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", v21, 2u);
    }
  }
  return v13;
}

- (NSUUID)codePathIdTrigger
{
  return (NSUUID *)[(NSMutableArray *)self->_codePathIdTriggers firstObject];
}

- (void)addCodePathId:(id)a3
{
}

- (NSArray)codePathIdTriggers
{
  v2 = (void *)[(NSMutableArray *)self->_codePathIdTriggers copy];

  return (NSArray *)v2;
}

- (void)dealloc
{
  v3 = __atxlog_handle_metrics();
  v4 = v3;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v4, OS_SIGNPOST_INTERVAL_END, signpostId, "ATXSpotlightClientResponse", " enableTelemetry=YES ", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ATXSpotlightClientResponse;
  [(ATXSpotlightClientResponse *)&v6 dealloc];
}

+ (id)createSectionWithTitle:(id)a3 sectionBundleIdentifier:(id)a4 resultCount:(unint64_t)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F9A368];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  [v11 setSubtitle:v10];

  [v11 setBundleIdentifier:v9];
  NSUInteger v12 = [a1 _createEmptyResultsWithCount:a5];
  [v11 setResults:v12];

  return v11;
}

+ (id)_createEmptyResultsWithCount:(unint64_t)a3
{
  for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a3; --a3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
    [i addObject:v5];
  }
  objc_super v6 = (void *)[i copy];

  return v6;
}

- (void)_updateSectionBundleIdentifiersWithServerResults:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_sections;
  uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    unint64_t v5 = 0;
    uint64_t v20 = *(void *)v29;
    id v23 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v6;
        v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        v8 = [v7 results];
        if ([v8 count])
        {
          unint64_t v9 = 0;
          while (1)
          {
            unint64_t v10 = [v4 count];

            if (v5 >= v10) {
              break;
            }
            id v11 = [v4 objectAtIndexedSubscript:v5];
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            NSUInteger v12 = [v11 results];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v25;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v25 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                  v18 = [v7 bundleIdentifier];
                  [v17 setSectionBundleIdentifier:v18];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v14);
            }
            ++v5;

            ++v9;
            v8 = [v7 results];
            id v4 = v23;
            if (v9 >= [v8 count]) {
              goto LABEL_17;
            }
          }
        }
        else
        {
LABEL_17:
        }
        uint64_t v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }
}

- (id)_addIdentifiersFromTopics:(id)a3 serverTopics:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke;
  v9[3] = &unk_1E5D08D68;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "_pas_mappedArrayWithIndexedTransform:", v9);

  return v7;
}

id __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v7 = [v5 results];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2;
  v11[3] = &unk_1E5D08D40;
  id v12 = v6;
  id v8 = v6;
  unint64_t v9 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v11);

  [v5 setResults:v9];

  return v5;
}

ATXSuggestionSearchResult *__69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  id v4 = [v3 sectionBundleIdentifier];
  BOOL v5 = +[ATXSpotlightContextAdapter isSpotlightRecentSectionIdentifier:v4];

  if (v5)
  {
    id v6 = __atxlog_handle_ui();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v7 = "ZKW Server Id: Skip recents";
LABEL_8:
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = __atxlog_handle_ui();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v7 = "ZKW Server Id: Skip contacts";
      goto LABEL_8;
    }
LABEL_9:

LABEL_10:
    id v8 = (ATXSuggestionSearchResult *)v3;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 32))
  {
    id v6 = __atxlog_handle_ui();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_1(v6);
    }
    goto LABEL_9;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F938D8]);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [v3 sectionBundleIdentifier];
  uint64_t v13 = (void *)[v10 initWithTopic:v11 sectionBundleIdentifier:v12];

  if (!v13)
  {
    uint64_t v14 = __atxlog_handle_ui();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_2(v14);
    }
  }
  id v8 = [[ATXSuggestionSearchResult alloc] initWithSearchResult:v3];
  [(ATXSuggestionSearchResult *)v8 setContextActionIdentifier:v13];
  uint64_t v15 = __atxlog_handle_ui();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ZKW Server Id: Converting %@", (uint8_t *)&v16, 0xCu);
  }

LABEL_11:

  return v8;
}

+ (id)_removeDuplicates:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v3 count];
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Removing duplicates in %lu serverResults", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke;
  v7[3] = &unk_1E5D08DB8;
  v7[4] = &buf;
  BOOL v5 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v7);
  _Block_object_dispose(&buf, 8);

  return v5;
}

id __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 results];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke_2;
  v7[3] = &unk_1E5D08D90;
  v7[4] = *(void *)(a1 + 32);
  BOOL v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);

  [v3 setResults:v5];

  return v3;
}

uint64_t __48__ATXSpotlightClientResponse__removeDuplicates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v3];
  BOOL v5 = __atxlog_handle_ui();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: - Removing duplicate", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: - Keeping", v8, 2u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return v4 ^ 1u;
}

- (id)_removeHidden:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Removing hidden in %lu results", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ATXSpotlightClientResponse__removeHidden___block_invoke;
  v8[3] = &unk_1E5D08E08;
  v8[4] = self;
  BOOL v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v8);

  return v6;
}

id __44__ATXSpotlightClientResponse__removeHidden___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 results];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATXSpotlightClientResponse__removeHidden___block_invoke_2;
  v7[3] = &unk_1E5D08DE0;
  v7[4] = *(void *)(a1 + 32);
  BOOL v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);

  [v3 setResults:v5];

  return v3;
}

uint64_t __44__ATXSpotlightClientResponse__removeHidden___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) shouldHideSearchResult:a2] ^ 1;
}

- (id)_removeDuplicateTopics:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v47 = [v3 count];
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: _removeDuplicateTopics in %lu results", buf, 0xCu);
  }

  BOOL v5 = objc_opt_new();
  BOOL v6 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obj = self->_sections;
  uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v26)
  {
    unint64_t v7 = 0;
    uint64_t v25 = *(void *)v41;
    id v28 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v8;
        long long v30 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        uint64_t v9 = [v30 results];
        if ([v9 count])
        {
          uint64_t v10 = 0;
          while (1)
          {
            unint64_t v11 = [v3 count];

            if (v7 >= v11) {
              break;
            }
            uint64_t v33 = v10;
            id v12 = [(NSArray *)self->_topics objectAtIndexedSubscript:v7];
            uint64_t v13 = [v3 objectAtIndexedSubscript:v7];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            v32 = v13;
            uint64_t v14 = [v13 results];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              unint64_t v31 = v7;
              char v17 = 0;
              uint64_t v18 = *(void *)v37;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v37 != v18) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                  if (+[ATXSpotlightClient topic:v12 isDuplicateComparingTopics:v5])
                  {
                    [v6 addObject:v20];
                  }
                  else
                  {
                    char v17 = 1;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v16);

              id v3 = v28;
              unint64_t v7 = v31;
              if (v17) {
                [v5 addObject:v12];
              }
            }
            else
            {
            }
            ++v7;

            uint64_t v10 = v33 + 1;
            uint64_t v9 = [v30 results];
            if (v33 + 1 >= (unint64_t)[v9 count]) {
              goto LABEL_25;
            }
          }
        }
        else
        {
LABEL_25:
        }
        uint64_t v8 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v26);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke;
  v34[3] = &unk_1E5D08E08;
  id v35 = v6;
  id v21 = v6;
  uint64_t v22 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v34);

  return v22;
}

id __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 results];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke_2;
  v7[3] = &unk_1E5D08DE0;
  id v8 = *(id *)(a1 + 32);
  BOOL v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);

  [v3 setResults:v5];

  return v3;
}

uint64_t __53__ATXSpotlightClientResponse__removeDuplicateTopics___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (unint64_t)_indexOfFirstSpotlightRecentInServerResults:(id)a3 withSections:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    uint64_t v26 = *(void *)v28;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        uint64_t v13 = [v12 bundleIdentifier];
        int v14 = [v13 isEqual:@"com.apple.spotlight.dec.zkw.recents"];

        uint64_t v15 = [v12 results];
        uint64_t v16 = [v15 count];
        if (v14)
        {
          if (v16)
          {
            id v17 = v6;
            unint64_t v18 = 0;
            while (1)
            {
              unint64_t v19 = [v5 count];

              if (v9 + v18 >= v19)
              {
                v9 += v18;
                id v6 = v17;
                uint64_t v10 = v26;
                goto LABEL_15;
              }
              uint64_t v20 = [v5 objectAtIndexedSubscript:v9 + v18];
              id v21 = [v20 results];
              uint64_t v22 = [v21 firstObject];

              if (v22) {
                break;
              }
              ++v18;
              uint64_t v15 = [v12 results];
              if (v18 >= [v15 count])
              {
                v9 += v18;
                id v6 = v17;
                uint64_t v10 = v26;
                goto LABEL_14;
              }
            }
            unint64_t v24 = v9 + v18;
            id v6 = v17;
            goto LABEL_22;
          }
        }
        else
        {
          v9 += v16;
        }
LABEL_14:

LABEL_15:
        ++v11;
      }
      while (v11 != v8);
      uint64_t v23 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v8 = v23;
      unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      if (v23) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_22:

  return v24;
}

+ (id)_limitingResults:(id)a3 scores:(id)a4 spotlightRecentIndex:(unint64_t)a5 limit:(unint64_t)a6
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwShowAllContexts", (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat))
  {
    id v12 = __atxlog_handle_ui();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
    }

    id v13 = v10;
  }
  else
  {
    unint64_t v14 = [a1 _trialSuggestionsMaxCountWithDefault:a6];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke;
    v39[3] = &unk_1E5D08E30;
    id v15 = v10;
    id v40 = v15;
    long long v28 = objc_msgSend(v11, "_pas_mappedArrayWithIndexedTransform:", v39);
    uint64_t v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
    v49[0] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    unint64_t v18 = [v28 sortedArrayUsingDescriptors:v17];

    unint64_t v19 = [v18 count];
    if (v14 >= v19) {
      unint64_t v20 = v19;
    }
    else {
      unint64_t v20 = v14;
    }
    unint64_t v21 = v20 - (a5 != 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_msgSend(v18, "subarrayWithRange:", 0, v21);
    unint64_t v24 = [v22 setWithArray:v23];

    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    BOOL v37 = a5 != 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = __atxlog_handle_ui();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)keyExistsAndHasValidFormat = 134218754;
      unint64_t v42 = v21;
      __int16 v43 = 2112;
      id v44 = v11;
      __int16 v45 = 2112;
      v46 = v28;
      __int16 v47 = 2112;
      uint64_t v48 = v24;
      _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Fill slots %lu, scores: %@, omit empty: %@, allowed: %@", keyExistsAndHasValidFormat, 0x2Au);
    }

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke_48;
    v29[3] = &unk_1E5D08E58;
    id v30 = v11;
    uint64_t v32 = v38;
    unint64_t v34 = v14;
    unint64_t v35 = a5;
    uint64_t v33 = v36;
    id v26 = v24;
    id v31 = v26;
    objc_msgSend(v15, "_pas_mappedArrayWithIndexedTransform:", v29);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
  }

  return v13;
}

id __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 results];
  uint64_t v8 = [v7 firstObject];

  if (v8) {
    id v9 = v5;
  }
  else {
    id v9 = &unk_1EFDF43E0;
  }

  return v9;
}

id __81__ATXSpotlightClientResponse__limitingResults_scores_spotlightRecentIndex_limit___block_invoke_48(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218242;
    unint64_t v22 = a3;
    __int16 v23 = 2112;
    unint64_t v24 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Consider result %lu with score: %@", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v8 = [v5 results];
  id v9 = [v8 firstObject];

  if (!v9)
  {
    [v5 setResults:MEMORY[0x1E4F1CBF0]];
    id v12 = __atxlog_handle_ui();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v21 = 134217984;
    unint64_t v22 = a3;
    id v13 = "ZKW Server Limit: Remove %lu, result is nil";
    goto LABEL_13;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64))
  {
    [v5 setResults:MEMORY[0x1E4F1CBF0]];
    id v12 = __atxlog_handle_ui();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v16 = *(void **)(a1 + 64);
    int v21 = 134218240;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = v16;
    id v13 = "ZKW Server Limit: Remove %lu. Already included limit of %lu";
    goto LABEL_24;
  }
  if (*(void *)(a1 + 72) > a3)
  {
    if (([*(id *)(a1 + 40) containsObject:v6] & 1) == 0)
    {
      [v5 setResults:MEMORY[0x1E4F1CBF0]];
      id v12 = __atxlog_handle_ui();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      int v21 = 134218498;
      unint64_t v22 = a3;
      __int16 v23 = 2112;
      unint64_t v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      id v13 = "ZKW Server Limit: Remove %lu, score %@ isn't high enough, %@";
      unint64_t v14 = v12;
      uint32_t v15 = 32;
      goto LABEL_25;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void *)(v10 + 24) + 1;
    if (v11 == *(void *)(a1 + 64) && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [v5 setResults:MEMORY[0x1E4F1CBF0]];
      id v12 = __atxlog_handle_ui();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      int v21 = 134217984;
      unint64_t v22 = a3;
      id v13 = "ZKW Server Limit: Remove %lu. One slot left and need to add Spotlight Recent";
LABEL_13:
      unint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_25:
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
      goto LABEL_26;
    }
    *(void *)(v10 + 24) = v11;
    id v12 = __atxlog_handle_ui();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  id v17 = __atxlog_handle_ui();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134217984;
    unint64_t v22 = a3;
    _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ZKW Server Limit: Found Spotlight Recent %lu", (uint8_t *)&v21, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v12 = __atxlog_handle_ui();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
LABEL_23:
    unint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v21 = 134218240;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = v19;
    id v13 = "ZKW Server Limit: Added %lu. Count is now %lu";
LABEL_24:
    unint64_t v14 = v12;
    uint32_t v15 = 22;
    goto LABEL_25;
  }
LABEL_26:

  return v5;
}

- (id)_createSectionsFromServerResults:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obj = self->_sections;
  uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v43)
  {
    unint64_t v6 = 0;
    uint64_t v42 = *(void *)v56;
    *(void *)&long long v5 = 134217984;
    long long v39 = v5;
    __int16 v45 = self;
    id v46 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v56 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v7;
        uint64_t v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
        id v9 = __atxlog_handle_ui();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 subtitle];
          uint64_t v11 = [v10 hash];
          *(_DWORD *)long long buf = v39;
          uint64_t v60 = v11;
          _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Section considered with title.hash %lu", buf, 0xCu);
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v13 = [v8 results];
        if ([v13 count])
        {
          uint64_t v14 = 0;
          __int16 v47 = v8;
          while (1)
          {
            unint64_t v15 = objc_msgSend(v4, "count", v39);

            if (v6 >= v15) {
              break;
            }
            uint64_t v49 = v14;
            uint64_t v16 = [(NSArray *)self->_topics objectAtIndexedSubscript:v6];
            id v17 = [v4 objectAtIndexedSubscript:v6];
            unint64_t v50 = v6 + 1;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v48 = v17;
            uint64_t v18 = [v17 results];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v65 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v52;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v52 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v51 + 1) + 8 * i);
                  unint64_t v24 = __atxlog_handle_ui();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    __int16 v25 = (objc_class *)objc_opt_class();
                    uint64_t v26 = NSStringFromClass(v25);
                    [v16 identifier];
                    v28 = id v27 = v12;
                    *(_DWORD *)long long buf = 134218499;
                    uint64_t v60 = v50;
                    __int16 v61 = 2112;
                    v62 = v26;
                    __int16 v63 = 2117;
                    v64 = v28;
                    _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Result %lu added: %@ %{sensitive}@", buf, 0x20u);

                    id v12 = v27;
                  }

                  [v12 addObject:v23];
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v65 count:16];
              }
              while (v20);
            }

            long long v29 = [v48 results];
            id v30 = [v29 firstObject];

            unint64_t v6 = v50;
            uint64_t v8 = v47;
            if (!v30)
            {
              id v31 = __atxlog_handle_ui();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = (objc_class *)objc_opt_class();
                uint64_t v33 = NSStringFromClass(v32);
                unint64_t v34 = [v16 identifier];
                *(_DWORD *)long long buf = 134218499;
                uint64_t v60 = v50;
                __int16 v61 = 2112;
                v62 = v33;
                __int16 v63 = 2117;
                v64 = v34;
                _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Result %lu empty: %@ %{sensitive}@", buf, 0x20u);
              }
            }

            uint64_t v14 = v49 + 1;
            id v13 = [v47 results];
            self = v45;
            id v4 = v46;
            if (v49 + 1 >= (unint64_t)[v13 count]) {
              goto LABEL_25;
            }
          }
        }
        else
        {
LABEL_25:
        }
        if (objc_msgSend(v12, "count", v39))
        {
          unint64_t v35 = [v8 copy];
          long long v36 = (void *)[v12 copy];
          [v35 setResults:v36];

          [v41 addObject:v35];
        }
        else
        {
          unint64_t v35 = __atxlog_handle_ui();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1A790D000, v35, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Section not added", buf, 2u);
          }
        }

        uint64_t v7 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v43);
  }

  if (self->_isZKWHideContextsEnabled)
  {
    [(ATXSpotlightHidingUIController *)self->_controller addHidingPreviewButtonItemsToServerResultSections:v41];
  }
  else
  {
    BOOL v37 = __atxlog_handle_ui();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
    }
  }

  return v41;
}

+ (void)_logWeatherResponsesWithTopics:(id)a3 serverResults:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke;
  v7[3] = &unk_1E5D08E80;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    id v8 = [v7 results];
    id v9 = [v8 firstObject];

    if (!v9)
    {
      id v41 = __atxlog_handle_ui();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_1A790D000, v41, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response empty", (uint8_t *)&v83, 2u);
      }

      uint64_t v10 = __atxlog_handle_metrics();
      uint64_t v42 = __atxlog_handle_metrics();
      os_signpost_id_t v43 = os_signpost_id_generate(v42);

      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        int v83 = 134349056;
        uint64_t v84 = 1;
        _os_signpost_emit_with_name_impl(&dword_1A790D000, v10, OS_SIGNPOST_EVENT, v43, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
      }
      goto LABEL_43;
    }
    uint64_t v10 = [v9 normalizedTopic];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v44 = __atxlog_handle_ui();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke_cold_1((uint64_t)v10, v44);
      }

      id v17 = __atxlog_handle_metrics();
      __int16 v45 = __atxlog_handle_metrics();
      os_signpost_id_t v46 = os_signpost_id_generate(v45);

      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        int v83 = 134349056;
        uint64_t v84 = 2;
        _os_signpost_emit_with_name_impl(&dword_1A790D000, v17, OS_SIGNPOST_EVENT, v46, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
      }
      goto LABEL_42;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v12 = [v6 location];
    [v12 lat];
    double v14 = v13;
    unint64_t v15 = [v6 location];
    [v15 lng];
    id v17 = [v11 initWithLatitude:v14 longitude:v16];

    uint64_t v18 = v10;
    id v19 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v20 = [v18 location];
    [v20 lat];
    double v22 = v21;
    uint64_t v23 = [v18 location];
    [v23 lng];
    __int16 v25 = (void *)[v19 initWithLatitude:v22 longitude:v24];

    [v25 distanceFromLocation:v17];
    double v27 = v26;
    if (v26 >= 1000.0)
    {
      if (v26 >= 8000.0)
      {
        long long v58 = __atxlog_handle_ui();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);
        if (v27 >= 24000.0)
        {
          if (v59)
          {
            v74 = [v6 query];
            v75 = [v18 query];
            [v17 coordinate];
            uint64_t v77 = v76;
            [v17 coordinate];
            uint64_t v79 = v78;
            [v25 coordinate];
            uint64_t v81 = v80;
            [v25 coordinate];
            int v83 = 134219523;
            *(double *)&uint64_t v84 = v27 / 1000.0;
            __int16 v85 = 2112;
            v86 = v74;
            __int16 v87 = 2112;
            v88 = v75;
            __int16 v89 = 2049;
            uint64_t v90 = v77;
            __int16 v91 = 2049;
            uint64_t v92 = v79;
            __int16 v93 = 2049;
            uint64_t v94 = v81;
            __int16 v95 = 2049;
            uint64_t v96 = v82;
            _os_log_fault_impl(&dword_1A790D000, v58, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response fail.far: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);
          }
          long long v38 = __atxlog_handle_metrics();
          __int16 v61 = __atxlog_handle_metrics();
          os_signpost_id_t v40 = os_signpost_id_generate(v61);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38)) {
            goto LABEL_38;
          }
          int v83 = 134349056;
          uint64_t v84 = 6;
        }
        else
        {
          if (v59)
          {
            v65 = [v6 query];
            v66 = [v18 query];
            [v17 coordinate];
            uint64_t v68 = v67;
            [v17 coordinate];
            uint64_t v70 = v69;
            [v25 coordinate];
            uint64_t v72 = v71;
            [v25 coordinate];
            int v83 = 134219523;
            *(double *)&uint64_t v84 = v27 / 1000.0;
            __int16 v85 = 2112;
            v86 = v65;
            __int16 v87 = 2112;
            v88 = v66;
            __int16 v89 = 2049;
            uint64_t v90 = v68;
            __int16 v91 = 2049;
            uint64_t v92 = v70;
            __int16 v93 = 2049;
            uint64_t v94 = v72;
            __int16 v95 = 2049;
            uint64_t v96 = v73;
            _os_log_fault_impl(&dword_1A790D000, v58, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response fail.near: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);
          }
          long long v38 = __atxlog_handle_metrics();
          uint64_t v60 = __atxlog_handle_metrics();
          os_signpost_id_t v40 = os_signpost_id_generate(v60);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38)) {
            goto LABEL_38;
          }
          int v83 = 134349056;
          uint64_t v84 = 5;
        }
      }
      else
      {
        __int16 v47 = __atxlog_handle_ui();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v48 = [v6 query];
          uint64_t v49 = [v18 query];
          [v17 coordinate];
          uint64_t v51 = v50;
          [v17 coordinate];
          uint64_t v53 = v52;
          [v25 coordinate];
          uint64_t v55 = v54;
          [v25 coordinate];
          int v83 = 134219523;
          *(double *)&uint64_t v84 = v27 / 1000.0;
          __int16 v85 = 2112;
          v86 = v48;
          __int16 v87 = 2112;
          v88 = v49;
          __int16 v89 = 2049;
          uint64_t v90 = v51;
          __int16 v91 = 2049;
          uint64_t v92 = v53;
          __int16 v93 = 2049;
          uint64_t v94 = v55;
          __int16 v95 = 2049;
          uint64_t v96 = v56;
          _os_log_impl(&dword_1A790D000, v47, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response pass.far: %.2f km (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);
        }
        long long v38 = __atxlog_handle_metrics();
        long long v57 = __atxlog_handle_metrics();
        os_signpost_id_t v40 = os_signpost_id_generate(v57);

        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38)) {
          goto LABEL_38;
        }
        int v83 = 134349056;
        uint64_t v84 = 4;
      }
    }
    else
    {
      long long v28 = __atxlog_handle_ui();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [v6 query];
        id v30 = [v18 query];
        [v17 coordinate];
        uint64_t v32 = v31;
        [v17 coordinate];
        uint64_t v34 = v33;
        [v25 coordinate];
        uint64_t v36 = v35;
        [v25 coordinate];
        int v83 = 134219523;
        *(double *)&uint64_t v84 = v27;
        __int16 v85 = 2112;
        v86 = v29;
        __int16 v87 = 2112;
        v88 = v30;
        __int16 v89 = 2049;
        uint64_t v90 = v32;
        __int16 v91 = 2049;
        uint64_t v92 = v34;
        __int16 v93 = 2049;
        uint64_t v94 = v36;
        __int16 v95 = 2049;
        uint64_t v96 = v37;
        _os_log_impl(&dword_1A790D000, v28, OS_LOG_TYPE_DEFAULT, "ZKW Weather: Weather response pass.near: %.2f m (%@ -> %@) (%{private}f, %{private}f) -> (%{private}f, %{private}f)", (uint8_t *)&v83, 0x48u);
      }
      long long v38 = __atxlog_handle_metrics();
      long long v39 = __atxlog_handle_metrics();
      os_signpost_id_t v40 = os_signpost_id_generate(v39);

      if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38)) {
        goto LABEL_38;
      }
      int v83 = 134349056;
      uint64_t v84 = 3;
    }
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v38, OS_SIGNPOST_EVENT, v40, "ATXSpotlightWeatherResponse", "result=%{public, signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
LABEL_38:

    v62 = __atxlog_handle_metrics();
    __int16 v63 = __atxlog_handle_metrics();
    os_signpost_id_t v64 = os_signpost_id_generate(v63);

    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      int v83 = 134349056;
      *(double *)&uint64_t v84 = v27;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v62, OS_SIGNPOST_EVENT, v64, "ATXSpotlightWeatherResponse", "distance=%{public, signpost.telemetry:number2}.0f enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
    }

LABEL_42:
LABEL_43:
  }
}

- (id)_replaceMissingWithError:(id)a3
{
  id v4 = a3;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwShowErrorTopicResponse", (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat))
  {
    id v5 = __atxlog_handle_ui();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Debug: Replacing empty response with debug ui", keyExistsAndHasValidFormat, 2u);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ATXSpotlightClientResponse__replaceMissingWithError___block_invoke;
    v9[3] = &unk_1E5D08D68;
    void v9[4] = self;
    objc_msgSend(v4, "_pas_mappedArrayWithIndexedTransform:", v9);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

id __55__ATXSpotlightClientResponse__replaceMissingWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 results];
  uint64_t v7 = [v6 firstObject];

  if (!v7)
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 48) objectAtIndexedSubscript:a3];
    id v9 = [v5 results];
    uint64_t v10 = [v9 firstObject];
    id v11 = [v10 normalizedTopic];

    id v12 = NSString;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    uint64_t v44 = [v12 stringWithFormat:@"Missing: %@", v14];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = [v8 identifier];
    id v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    else {
      uint64_t v18 = @"nil";
    }
    [v15 addObject:v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v8;
      uint64_t v20 = [v19 query];
      double v21 = (void *)v20;
      if (v20) {
        double v22 = (__CFString *)v20;
      }
      else {
        double v22 = @"nil";
      }
      [v15 addObject:v22];

      uint64_t v23 = NSString;
      uint64_t v24 = [v19 queryType];

      __int16 v25 = objc_msgSend(v23, "stringWithFormat:", @"%d", v24);
      [v15 addObject:v25];
    }
    uint64_t v26 = [v11 identifier];
    double v27 = (void *)v26;
    if (v26) {
      long long v28 = (__CFString *)v26;
    }
    else {
      long long v28 = @"nil";
    }
    [v15 addObject:v28];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = v11;
      uint64_t v30 = [v29 query];
      uint64_t v31 = (void *)v30;
      if (v30) {
        uint64_t v32 = (__CFString *)v30;
      }
      else {
        uint64_t v32 = @"nil";
      }
      [v15 addObject:v32];

      uint64_t v33 = NSString;
      uint64_t v34 = [v29 queryType];

      uint64_t v35 = objc_msgSend(v33, "stringWithFormat:", @"%d", v34);
      [v15 addObject:v35];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v8;
      if ([v36 queryType] == 2 || objc_msgSend(v36, "queryType") == 3)
      {
        uint64_t v37 = [v36 identifier];
      }
      else if ([v36 queryType] == 1)
      {
        id v42 = [NSString alloc];
        os_signpost_id_t v43 = [v36 identifier];
        uint64_t v37 = (void *)[v42 initWithFormat:@"%@ site:music.apple.com", v43];
      }
      else
      {
        uint64_t v37 = 0;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    long long v38 = __atxlog_handle_ui();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v47 = a3;
      __int16 v48 = 2112;
      id v49 = v15;
      _os_log_impl(&dword_1A790D000, v38, OS_LOG_TYPE_DEFAULT, "ZKW Server Result: Debug: [%lu] %@", buf, 0x16u);
    }

    long long v39 = [(id)objc_opt_class() _resultForError:v44 subtitles:v15 searchString:v37];
    __int16 v45 = v39;
    os_signpost_id_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v5 setResults:v40];
  }

  return v5;
}

+ (id)_resultForError:(id)a3 subtitles:(id)a4 searchString:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  [v9 setResultBundleId:&stru_1EFD9B408];
  uint64_t v10 = objc_opt_new();
  [v10 setText:v7];
  [v9 setTitle:v10];
  [v9 setCompletion:v7];
  id v11 = objc_opt_new();
  [v11 setSymbolName:@"exclamationmark.triangle.fill"];
  [v11 setPunchThroughBackground:0];
  [v11 setPrimaryColor:5];
  id v12 = objc_opt_new();
  [v12 setShouldUseCompactDisplay:1];
  [v12 setThumbnail:v11];
  uint64_t v26 = v7;
  double v13 = [MEMORY[0x1E4F9A378] textWithString:v7];
  [v12 setTitle:v13];

  double v14 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [MEMORY[0x1E4F9A378] textWithString:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v17);
  }

  [v12 setDescriptions:v14];
  if (v25)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F9A3E0]);
    [v21 setSearchString:v25];
    [v12 setCommand:v21];
  }
  double v22 = objc_opt_new();
  uint64_t v31 = v12;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v22 setCardSections:v23];

  [v9 setInlineCard:v22];

  return v9;
}

+ (unint64_t)_trialSuggestionsMaxCountWithDefault:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB0098] clientWithIdentifier:232];
  id v5 = [v4 levelForFactor:@"ZKWSuggestionsMaxCount" withNamespaceName:@"SPOTLIGHT_UI"];
  id v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    unint64_t v10 = (unint64_t)v5;
    __int16 v11 = 2112;
    id v12 = @"ZKWSuggestionsMaxCount";
    __int16 v13 = 2048;
    uint64_t v14 = [v5 longValue];
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "+[ATXSpotlightClientResponse _trialSuggestionsMaxCount]: level(%@)=%@ level.longValue=%lld", (uint8_t *)&v9, 0x20u);
  }

  if (v5)
  {
    a3 = [v5 longValue];
  }
  else
  {
    id v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "+[ATXSpotlightClientResponse _trialSuggestionsMaxCount]: level is null. returning default value of %lu", (uint8_t *)&v9, 0xCu);
    }
  }
  return a3;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_codePathIdTriggers, 0);

  objc_storeStrong((id *)&self->_scores, 0);
}

void __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ZKW Server Id: Skip requestedTopic nil", v1, 2u);
}

void __69__ATXSpotlightClientResponse__addIdentifiersFromTopics_serverTopics___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ZKW Server Id: Skip identifier nil", v1, 2u);
}

void __75__ATXSpotlightClientResponse__logWeatherResponsesWithTopics_serverResults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ZKW Weather: Weather response mismatch: %@", (uint8_t *)&v5, 0xCu);
}

@end