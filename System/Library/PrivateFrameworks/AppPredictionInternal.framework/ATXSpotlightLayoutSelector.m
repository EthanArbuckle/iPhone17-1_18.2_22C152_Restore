@interface ATXSpotlightLayoutSelector
+ (BOOL)_isCommuteMediaSuggestion:(id)a3;
+ (BOOL)_isCommuteWildCardSuggestion:(id)a3;
+ (id)_commuteWildcardReducer:(id)a3;
- (ATXSpotlightLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4;
- (BOOL)_hasNilTitleForContextCode:(int64_t)a3;
- (BOOL)_isValidForReasons:(unint64_t)a3;
- (double)_adaptedScoreForSuggestion:(id)a3;
- (id)_autoShortcutsForBundleId:(id)a3 provider:(id)a4;
- (id)_clearDuplicateContextsFromSuggestions:(id)a3 suggestionDict:(id)a4;
- (id)_collectionsWithSuggestions:(id)a3;
- (id)_createPOISuggestionWithMUID:(id)a3 fromHeroSuggestion:(id)a4;
- (id)_createTopAppShortcutCollectionsWithSuggestions:(id)a3;
- (id)_createTopAppShortcutSuggestions;
- (id)_heroDataReducer:(id)a3;
- (id)_insertMediaSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4;
- (id)_intervalStringWithCriteria:(id)a3;
- (id)_poiMUIDFromHero:(id)a3;
- (id)_preferredContextWithContextCode:(id)a3 contextCriteria:(id)a4;
- (id)_rankedReasonCodes;
- (id)_scoresFlattenForCollections:(id)a3;
- (id)_staticTitleForContextCode:(int64_t)a3;
- (id)_suggestionFromAutoShortcutContextualAction:(id)a3 title:(id)a4 predictionReasons:(unint64_t)a5;
- (id)_titleForContextCode:(int64_t)a3 suggestions:(id)a4;
- (id)_titleForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4;
- (id)_validAutoShortcutContextualActionsForBundleId:(id)a3 limit:(unint64_t)a4 provider:(id)a5;
- (id)nsuaFilteredLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (int64_t)_contextReasonCodeWithPredictionReasons:(unint64_t)a3;
- (unint64_t)_supportedContextReasons;
- (void)_dedupeSuggestions:(id)a3 suggestionDict:(id)a4;
- (void)_indexSpotlightActions:(id)a3;
@end

@implementation ATXSpotlightLayoutSelector

- (ATXSpotlightLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXSpotlightLayoutSelector;
  v9 = [(ATXSpotlightLayoutSelector *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deduplicator, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
    uint64_t v11 = objc_opt_new();
    adapter = v10->_adapter;
    v10->_adapter = (ATXSpotlightContextAdapter *)v11;
  }
  return v10;
}

- (id)_rankedReasonCodes
{
  return &unk_1F27F3990;
}

- (unint64_t)_supportedContextReasons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXSpotlightLayoutSelector *)self _rankedReasonCodes];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= 1 << [*(id *)(*((void *)&v9 + 1) + 8 * i) integerValue];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isValidForReasons:(unint64_t)a3
{
  unint64_t v3 = [(ATXSpotlightLayoutSelector *)self _supportedContextReasons] & a3;
  if (v3)
  {
    if ((v3 & (v3 - 1)) == 0) {
      return 1;
    }
    unint64_t v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightLayoutSelector _isValidForReasons:]();
    }
  }
  return 0;
}

- (void)_indexSpotlightActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F23838] isIndexingAvailable])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke;
    v16[3] = &unk_1E68B5A68;
    v17 = @"com.apple.duetexpertd.spotlightZKW";
    uint64_t v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v16);
    unint64_t v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "[Index] %lu items to index", buf, 0xCu);
    }

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F23838]) initWithName:@"com.apple.duetexpertd.spotlightZKW" bundleIdentifier:@"com.apple.shortcuts"];
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "indexSpotlightActions: Deleting", buf, 2u);
    }

    v18[0] = @"com.apple.duetexpertd.spotlightZKW";
    v18[1] = @"spotlightZKW";
    long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_116;
    v13[3] = &unk_1E68B5A90;
    id v14 = v4;
    id v15 = v7;
    id v10 = v7;
    id v11 = v4;
    [v10 deleteSearchableItemsWithDomainIdentifiers:v9 completionHandler:v13];

    long long v12 = v17;
  }
  else
  {
    long long v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "[Index] Indexing is not available on this device", buf, 2u);
    }
  }
}

id __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 atxShortcutsActionExecutableObject];
  unint64_t v5 = [v4 searchableItem];
  [v5 setDomainIdentifier:*(void *)(a1 + 32)];
  uint64_t v6 = __atxlog_handle_blending();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = [v3 uiSpecification];
    long long v9 = [v8 title];
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    v17 = v5;
    id v10 = "[Index] CSSearchableItem from suggestion %@ --> %@";
    id v11 = v6;
    uint32_t v12 = 22;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = [v3 uiSpecification];
    long long v9 = [v8 title];
    int v14 = 138412290;
    id v15 = v9;
    id v10 = "[Index] No search item from suggestion %@";
    id v11 = v6;
    uint32_t v12 = 12;
  }
  _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

LABEL_7:
  return v5;
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_blending();
  unint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_116_cold_1();
    }
LABEL_4:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "[Index] Deleting finished", (uint8_t *)&v9, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) count];
  unint64_t v5 = __atxlog_handle_blending();
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "[Index] No items to index", (uint8_t *)&v9, 2u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "[Index] Inserting %@", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 40) indexSearchableItems:*(void *)(a1 + 32) completionHandler:&__block_literal_global_227];
LABEL_11:
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_117(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_blending();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_117_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "[Index] Inserting finished", v5, 2u);
  }
}

- (id)nsuaFilteredLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector filtered nsua suggestions", buf, 2u);
  }

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F93918]) initWithSuggestionDeduplicator:self->_deduplicator hyperParameters:self->_hyperParameters];
  int v9 = [v8 validLayoutsForConsumerSubType:v4 rankedSuggestions:v6];
  uint64_t v10 = [v9 firstObject];

  if (v10)
  {
    uint64_t v11 = [v10 allSuggestionsInLayout];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __85__ATXSpotlightLayoutSelector_nsuaFilteredLayoutForConsumerSubType_rankedSuggestions___block_invoke;
    v25[3] = &unk_1E68AE0A0;
    v25[4] = self;
    uint32_t v12 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v25);

    if ([v12 count])
    {
      unint64_t v13 = [v12 count];
      if (v13 >= 4) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = v13;
      }
      id v15 = objc_msgSend(v12, "subarrayWithRange:", 0, v14);

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v15 count])
      {
        unint64_t v17 = 0;
        do
        {
          [v16 addObject:&unk_1F27F2808];
          ++v17;
        }
        while ([v15 count] > v17);
      }
      uint64_t v18 = [(ATXSpotlightContextAdapter *)self->_adapter nsuaSectionIdentifier];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F93998]) initWithSuggestions:v15 contextTitle:0 sectionIdentifier:v18];
      id v20 = objc_alloc(MEMORY[0x1E4F939A0]);
      v27[0] = v19;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      v22 = [MEMORY[0x1E4F29128] UUID];
      v23 = (void *)[v20 initWithCollections:v21 scores:v16 uuid:v22];
    }
    else
    {
      v23 = 0;
      id v15 = v12;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __85__ATXSpotlightLayoutSelector_nsuaFilteredLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  if (v5 == 5)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 uiSpecification];
    LOBYTE(v7) = objc_msgSend(v7, "_isValidForReasons:", objc_msgSend(v8, "predictionReasons"));

    if (v7)
    {
      BOOL v6 = 0;
    }
    else
    {
      int v9 = [v3 executableSpecification];
      BOOL v6 = [v9 executableType] == 2;
    }
  }

  return v6;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = (uint64_t)v8;
    __int16 v41 = 2048;
    uint64_t v42 = [v6 count];
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector asked to provide the selected layout for %{public}@ and %lu rankedSuggestions", buf, 0x16u);
  }
  int v9 = [MEMORY[0x1E4F4B348] sharedInstance];
  buf[0] = 0;
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F4B688];
  if (CFPreferencesGetAppBooleanValue(@"zkwShowNSUA", (CFStringRef)*MEMORY[0x1E4F4B688], buf)
    || (buf[0] = 0, CFPreferencesGetAppBooleanValue(@"zkwShowNSUAApp", v10, buf))
    || ([v9 nsuaSuggestions] & 1) != 0
    || [v9 showNSUASuggestionsAsAppLaunches])
  {
    uint64_t v11 = [(ATXSpotlightLayoutSelector *)self nsuaFilteredLayoutForConsumerSubType:v4 rankedSuggestions:v6];
  }
  else
  {
    unint64_t v13 = [(ATXSpotlightLayoutSelector *)self _insertMediaSuggestion:v6 consumerSubType:v4];

    id v6 = [(ATXSpotlightLayoutSelector *)self _heroDataReducer:v13];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __81__ATXSpotlightLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke;
    v37[3] = &unk_1E68AE358;
    v37[4] = self;
    char v38 = v4;
    uint64_t v14 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v37);
    id v15 = [(id)objc_opt_class() _commuteWildcardReducer:v14];

    id v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = v17;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector  %lu rankedSuggestions", buf, 0xCu);
    }

    [(ATXSpotlightLayoutSelector *)self _indexSpotlightActions:v15];
    uint64_t v18 = [(ATXSpotlightLayoutSelector *)self _collectionsWithSuggestions:v15];
    v19 = (void *)MEMORY[0x1D25F6CC0]();
    id v20 = [(ATXSpotlightLayoutSelector *)self _createTopAppShortcutSuggestions];
    unint64_t v21 = [v20 count];
    if (v21 >= 2) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = v21;
    }
    v23 = objc_msgSend(v20, "subarrayWithRange:", 0, v22);

    v24 = [(ATXSpotlightLayoutSelector *)self _createTopAppShortcutCollectionsWithSuggestions:v23];
    v25 = __atxlog_handle_blending();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v23 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v40 = v26;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v23;
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Adding suggestions: %lu, %@", buf, 0x16u);
    }

    v27 = [v24 arrayByAddingObjectsFromArray:v18];
    v28 = [(ATXSpotlightLayoutSelector *)self _scoresFlattenForCollections:v27];
    id v29 = objc_alloc(MEMORY[0x1E4F939A0]);
    v30 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = (void *)[v29 initWithCollections:v27 scores:v28 uuid:v30];

    v31 = __atxlog_handle_blending();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      [v11 collections];
      v36 = v24;
      v32 = v15;
      v34 = v33 = v18;
      uint64_t v35 = [v34 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = v35;
      _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector %lu collections", buf, 0xCu);

      uint64_t v18 = v33;
      id v15 = v32;
      v24 = v36;
    }
  }
  return v11;
}

uint64_t __81__ATXSpotlightLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 16) uiSupportsSuggestion:v3 consumerSubType:*(unsigned __int8 *)(a1 + 40)])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 uiSpecification];
    uint64_t v6 = objc_msgSend(v4, "_isValidForReasons:", objc_msgSend(v5, "predictionReasons"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (double)_adaptedScoreForSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uiSpecification];
  int v5 = [v4 predictionReasons];

  if ((v5 & 0x800000) != 0)
  {
    *(double *)&uint64_t v9 = 50.0;
LABEL_11:
    double v8 = *(double *)&v9;
    goto LABEL_12;
  }
  uint64_t v6 = [v3 uiSpecification];
  uint64_t v7 = [v6 predictionReasons] & 0x1E000000;

  if (v7)
  {
    double v8 = 70.0;
    goto LABEL_12;
  }
  CFStringRef v10 = [v3 uiSpecification];
  int v11 = [v10 predictionReasons];

  if ((v11 & 0x20000000) != 0
    || ([v3 uiSpecification],
        uint32_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 predictionReasons],
        v12,
        (v13 & 0x40000000) != 0))
  {
    *(double *)&uint64_t v9 = 40.0;
    goto LABEL_11;
  }
  double v8 = 30.0;
  if (([(id)objc_opt_class() _isCommuteMediaSuggestion:v3] & 1) == 0
    && ([(id)objc_opt_class() _isCommuteWildCardSuggestion:v3] & 1) == 0)
  {
    uint64_t v14 = [v3 scoreSpecification];
    [v14 rawScore];
    double v8 = v15;
  }
LABEL_12:

  return v8;
}

- (id)_collectionsWithSuggestions:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __58__ATXSpotlightLayoutSelector__collectionsWithSuggestions___block_invoke;
  v80[3] = &unk_1E68B5AB8;
  v80[4] = self;
  [a3 sortedArrayUsingComparator:v80];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v77 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        double v8 = __atxlog_handle_blending();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 uiSpecification];
          CFStringRef v10 = [v9 title];
          uint64_t v11 = [v10 hash];
          uint32_t v12 = [v7 scoreSpecification];
          uint64_t v13 = [v12 suggestedConfidenceCategory];
          [(ATXSpotlightLayoutSelector *)self _adaptedScoreForSuggestion:v7];
          *(_DWORD *)buf = 134218496;
          uint64_t v84 = v11;
          __int16 v85 = 2048;
          uint64_t v86 = v13;
          __int16 v87 = 2048;
          uint64_t v88 = v14;
          _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions rankedAndFilteredSuggestions [%lu] = %ld %f", buf, 0x20u);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v4);
  }

  double v15 = __atxlog_handle_blending();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [obj count];
    *(_DWORD *)buf = 134217984;
    uint64_t v84 = v16;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions %lu rankedAndFilteredSuggestions", buf, 0xCu);
  }

  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = __atxlog_handle_blending();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [obj count];
    *(_DWORD *)buf = 134217984;
    uint64_t v84 = v19;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector  %lu rankedAndFilteredSuggestions", buf, 0xCu);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obja = obj;
  uint64_t v20 = [obja countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v73;
    unint64_t v23 = 0x1E4F28000uLL;
    do
    {
      uint64_t v24 = 0;
      uint64_t v62 = v21;
      do
      {
        if (*(void *)v73 != v22) {
          objc_enumerationMutation(obja);
        }
        v25 = *(void **)(*((void *)&v72 + 1) + 8 * v24);
        uint64_t v26 = [v25 uiSpecification];
        int64_t v27 = -[ATXSpotlightLayoutSelector _contextReasonCodeWithPredictionReasons:](self, "_contextReasonCodeWithPredictionReasons:", [v26 predictionReasons]);

        v28 = __atxlog_handle_blending();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v25 uiSpecification];
          v30 = [v29 title];
          [v25 uiSpecification];
          uint64_t v31 = v22;
          v32 = v17;
          v34 = unint64_t v33 = v23;
          uint64_t v35 = [v34 predictionReasons];
          *(_DWORD *)buf = 138412802;
          uint64_t v84 = (uint64_t)v30;
          __int16 v85 = 2048;
          uint64_t v86 = v27;
          __int16 v87 = 2048;
          uint64_t v88 = v35;
          _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector suggestion =[%@] contextCode found: %ld for reasons %llu", buf, 0x20u);

          unint64_t v23 = v33;
          uint64_t v17 = v32;
          uint64_t v22 = v31;
          uint64_t v21 = v62;
        }
        v36 = [*(id *)(v23 + 3792) numberWithInteger:v27];
        v37 = [v17 objectForKeyedSubscript:v36];

        if (v37)
        {
          [v37 addObject:v25];
        }
        else
        {
          v37 = [MEMORY[0x1E4F1CA48] arrayWithObject:v25];
          char v38 = [*(id *)(v23 + 3792) numberWithInteger:v27];
          [v17 setObject:v37 forKeyedSubscript:v38];
        }
        ++v24;
      }
      while (v21 != v24);
      uint64_t v21 = [obja countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v21);
  }

  uint64_t v39 = [(ATXSpotlightLayoutSelector *)self _clearDuplicateContextsFromSuggestions:obja suggestionDict:v17];

  v61 = (void *)v39;
  [(ATXSpotlightLayoutSelector *)self _dedupeSuggestions:v39 suggestionDict:v17];
  v63 = objc_opt_new();
  uint64_t v40 = [(ATXSpotlightLayoutSelector *)self _rankedReasonCodes];
  __int16 v41 = __atxlog_handle_blending();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [v40 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    uint64_t v84 = (uint64_t)v42;
    _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "SLS: rankedReasonKeys = %@", buf, 0xCu);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id objb = v40;
  uint64_t v43 = [objb countByEnumeratingWithState:&v68 objects:v81 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v69 != v45) {
          objc_enumerationMutation(objb);
        }
        v47 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        v48 = [v17 objectForKeyedSubscript:v47];
        v49 = v48;
        if (v48 && [v48 count])
        {
          v50 = -[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:](self, "_titleForContextCode:suggestions:", [v47 integerValue], v49);
          v51 = __atxlog_handle_blending();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = [v17 objectForKeyedSubscript:v47];
            uint64_t v53 = [v52 count];
            uint64_t v54 = [v50 hash];
            *(_DWORD *)buf = 138412802;
            uint64_t v84 = (uint64_t)v47;
            __int16 v85 = 2048;
            uint64_t v86 = v53;
            __int16 v87 = 2048;
            uint64_t v88 = v54;
            _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions reasonCode=%@ count=%lu contextTitle.hash=%lu", buf, 0x20u);
          }
          v55 = -[ATXSpotlightContextAdapter sectionIdentifierForContextCode:](self->_adapter, "sectionIdentifierForContextCode:", [v47 integerValue]);
          v56 = (void *)[objc_alloc(MEMORY[0x1E4F93998]) initWithSuggestions:v49 contextTitle:v50 sectionIdentifier:v55];
          v57 = __atxlog_handle_blending();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v58 = [v50 hash];
            uint64_t v59 = [v49 count];
            *(_DWORD *)buf = 134218498;
            uint64_t v84 = v58;
            __int16 v85 = 2112;
            uint64_t v86 = (uint64_t)v55;
            __int16 v87 = 2048;
            uint64_t v88 = v59;
            _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions collection created contextTitle.hash=%lu sectionIdentifier=%@ with %lu suggestions", buf, 0x20u);
          }

          [v63 addObject:v56];
        }
      }
      uint64_t v44 = [objb countByEnumeratingWithState:&v68 objects:v81 count:16];
    }
    while (v44);
  }

  return v63;
}

uint64_t __58__ATXSpotlightLayoutSelector__collectionsWithSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSNumber;
  double v8 = [v6 scoreSpecification];
  uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "suggestedConfidenceCategory"));
  CFStringRef v10 = NSNumber;
  uint64_t v11 = [v5 scoreSpecification];
  uint32_t v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "suggestedConfidenceCategory"));
  uint64_t v13 = [v9 compare:v12];

  if (!v13)
  {
    uint64_t v14 = NSNumber;
    [*(id *)(a1 + 32) _adaptedScoreForSuggestion:v6];
    double v15 = objc_msgSend(v14, "numberWithDouble:");
    uint64_t v16 = NSNumber;
    [*(id *)(a1 + 32) _adaptedScoreForSuggestion:v5];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    uint64_t v13 = [v15 compare:v17];
  }
  return v13;
}

- (id)_clearDuplicateContextsFromSuggestions:(id)a3 suggestionDict:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v54 = (void *)[a3 mutableCopy];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v5;
  uint64_t v56 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v78;
    *(void *)&long long v6 = 134217984;
    long long v53 = v6;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v78 != v55) {
          objc_enumerationMutation(obj);
        }
        v60 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v8 = 1 << objc_msgSend(v60, "integerValue", v53);
        uint64_t v9 = __atxlog_handle_blending();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)uint64_t v84 = v60;
          *(_WORD *)&v84[8] = 1024;
          *(_DWORD *)__int16 v85 = (v8 & 0x700000) != 0;
          *(_WORD *)&v85[4] = 1024;
          *(_DWORD *)&v85[6] = (v8 & 0x380000000) != 0;
          _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "SLS: contextCode = %@ isEventContext= %{BOOL}i, isFlightContext= %{BOOL}i  ", buf, 0x18u);
        }

        if ((v8 & 0x380700000) != 0)
        {
          uint64_t v57 = i;
          CFStringRef v10 = objc_opt_new();
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v62 = [obj objectForKeyedSubscript:v60];
          uint64_t v11 = [v62 countByEnumeratingWithState:&v73 objects:v88 count:16];
          uint64_t v59 = v10;
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v64 = *(void *)v74;
            do
            {
              uint64_t v13 = 0;
              uint64_t v61 = v12;
              do
              {
                if (*(void *)v74 != v64) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v14 = *(void **)(*((void *)&v73 + 1) + 8 * v13);
                double v15 = __atxlog_handle_blending();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v16 = [v14 uiSpecification];
                  uint64_t v17 = [v16 title];
                  *(_DWORD *)buf = 138412546;
                  *(void *)uint64_t v84 = v60;
                  *(_WORD *)&v84[8] = 2112;
                  *(void *)__int16 v85 = v17;
                  _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions suggestionDict[%@] =[%@]", buf, 0x16u);
                }
                uint64_t v18 = [v14 uiSpecification];
                uint64_t v19 = [v18 predictionReasons] & 0x700000;

                uint64_t v20 = [v14 uiSpecification];
                uint64_t v21 = [v20 predictionReasons] & 0x380000000;

                uint64_t v22 = [v14 atxActionCriteria];
                unint64_t v23 = [v14 uiSpecification];
                uint64_t v24 = [v23 reason];

                v25 = __atxlog_handle_blending();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v26 = [v24 hash];
                  int64_t v27 = [(ATXSpotlightLayoutSelector *)self _intervalStringWithCriteria:v22];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)uint64_t v84 = v19 != 0;
                  CFStringRef v10 = v59;
                  *(_WORD *)&v84[4] = 1024;
                  *(_DWORD *)&v84[6] = v21 != 0;
                  *(_WORD *)__int16 v85 = 2048;
                  *(void *)&v85[2] = v26;
                  __int16 v86 = 2112;
                  __int16 v87 = v27;
                  _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "SLS: isSuggestionEventContext: %{BOOL}i isSuggestionFlightContext: %{BOOL}i  reason.hash=[%lu] criteria[%@]", buf, 0x22u);

                  uint64_t v12 = v61;
                }

                if ([v24 length] && v19 | v21) {
                  [v10 setObject:v22 forKeyedSubscript:v24];
                }

                ++v13;
              }
              while (v12 != v13);
              uint64_t v12 = [v62 countByEnumeratingWithState:&v73 objects:v88 count:16];
            }
            while (v12);
          }

          v28 = __atxlog_handle_blending();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = [v10 count];
            *(_DWORD *)buf = v53;
            *(void *)uint64_t v84 = v29;
            _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "SLS: _cleanUpCollections %lu contexts", buf, 0xCu);
          }

          if ((unint64_t)[v10 count] >= 2)
          {
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v30 = v10;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v69 objects:v82 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v70;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v70 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * j);
                  v36 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    v37 = [v30 objectForKeyedSubscript:v35];
                    char v38 = [(ATXSpotlightLayoutSelector *)self _intervalStringWithCriteria:v37];
                    *(_DWORD *)buf = 138412546;
                    *(void *)uint64_t v84 = v35;
                    *(_WORD *)&v84[8] = 2112;
                    *(void *)__int16 v85 = v38;
                    _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "SLS: context=[%@] criteria[%@]", buf, 0x16u);
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v69 objects:v82 count:16];
              }
              while (v32);
            }

            uint64_t v39 = [(ATXSpotlightLayoutSelector *)self _preferredContextWithContextCode:v60 contextCriteria:v30];
            uint64_t v40 = objc_opt_new();
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            __int16 v41 = [obj objectForKeyedSubscript:v60];
            uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v81 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v66;
              do
              {
                for (uint64_t k = 0; k != v43; ++k)
                {
                  if (*(void *)v66 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  v46 = *(void **)(*((void *)&v65 + 1) + 8 * k);
                  v47 = [v46 uiSpecification];
                  v48 = [v47 reason];
                  char v49 = [v39 isEqualToString:v48];

                  if ((v49 & 1) == 0) {
                    [v40 addObject:v46];
                  }
                }
                uint64_t v43 = [v41 countByEnumeratingWithState:&v65 objects:v81 count:16];
              }
              while (v43);
            }

            v50 = [obj objectForKeyedSubscript:v60];
            [v50 removeObjectsInArray:v40];

            [v54 removeObjectsInArray:v40];
            CFStringRef v10 = v59;
          }

          uint64_t i = v57;
        }
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v56);
  }

  v51 = (void *)[v54 copy];
  return v51;
}

- (id)_preferredContextWithContextCode:(id)a3 contextCriteria:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 integerValue];
  uint64_t v9 = v8;
  if (v8 > 0x21) {
    goto LABEL_41;
  }
  if (((1 << v8) & 0x80100000) != 0)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v7;
    uint64_t v24 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v24)
    {
      uint64_t v54 = self;
      id v55 = v7;
      id v56 = v6;
      uint64_t v58 = 0;
      uint64_t v12 = 0;
      uint64_t v25 = *(void *)v68;
      uint64_t v26 = v24;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v68 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v29 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v28, v54, v55, v56);
          if (!v12) {
            goto LABEL_25;
          }
          uint64_t v30 = [v58 endDate];
          if (v30)
          {
            uint64_t v31 = (void *)v30;
            [v29 startDate];
            uint64_t v33 = v32 = v26;
            v34 = [v58 startDate];
            uint64_t v35 = [v33 compare:v34];

            uint64_t v26 = v32;
            if (v35 == -1)
            {
LABEL_25:
              id v36 = v28;

              id v37 = v29;
              uint64_t v58 = v37;
              uint64_t v12 = v36;
            }
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v26);
      goto LABEL_40;
    }
    goto LABEL_43;
  }
  if (((1 << v8) & 0x100200000) == 0)
  {
    if (((1 << v8) & 0x200400000) != 0)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      obuint64_t j = v7;
      uint64_t v10 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v54 = self;
        id v55 = v7;
        id v56 = v6;
        uint64_t v58 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v64 != v13) {
              objc_enumerationMutation(obj);
            }
            double v15 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            uint64_t v16 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v15, v54, v55, v56);
            if (!v12) {
              goto LABEL_13;
            }
            uint64_t v17 = [v58 endDate];
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              uint64_t v19 = [v16 endDate];
              uint64_t v20 = [v58 endDate];
              uint64_t v21 = [v19 compare:v20];

              if (v21 == 1)
              {
LABEL_13:
                id v22 = v15;

                id v23 = v16;
                uint64_t v58 = v23;
                uint64_t v12 = v22;
              }
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
        }
        while (v11);
LABEL_40:
        id v7 = v55;
        id v6 = v56;
        self = v54;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
LABEL_41:
    obuint64_t j = __atxlog_handle_blending();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightLayoutSelector _preferredContextWithContextCode:contextCriteria:](v9, obj);
    }
    goto LABEL_43;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v7;
  uint64_t v38 = [obj countByEnumeratingWithState:&v59 objects:v75 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v54 = self;
    id v55 = v7;
    id v56 = v6;
    uint64_t v58 = 0;
    uint64_t v12 = 0;
    uint64_t v40 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v60 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = *(void **)(*((void *)&v59 + 1) + 8 * k);
        uint64_t v43 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v42, v54, v55, v56);
        if (!v12) {
          goto LABEL_37;
        }
        uint64_t v44 = [v58 endDate];
        if (v44)
        {
          uint64_t v45 = (void *)v44;
          v46 = [v43 endDate];
          v47 = [v58 endDate];
          uint64_t v48 = [v46 compare:v47];

          if (v48 == 1)
          {
LABEL_37:
            id v49 = v42;

            id v50 = v43;
            uint64_t v58 = v50;
            uint64_t v12 = v49;
          }
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v59 objects:v75 count:16];
    }
    while (v39);
    goto LABEL_40;
  }
LABEL_43:
  uint64_t v58 = 0;
  uint64_t v12 = 0;
LABEL_44:

  v51 = __atxlog_handle_blending();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = [(ATXSpotlightLayoutSelector *)self _intervalStringWithCriteria:v58];
    *(_DWORD *)buf = 138412546;
    long long v72 = v12;
    __int16 v73 = 2112;
    long long v74 = v52;
    _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_DEFAULT, "SLS: preferredContext=[%@] preferredCriteria[%@]", buf, 0x16u);
  }
  return v12;
}

- (id)_intervalStringWithCriteria:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 startDate];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C10];
      id v7 = [v4 startDate];
      unint64_t v8 = [v6 localizedStringFromDate:v7 dateStyle:0 timeStyle:1];
    }
    else
    {
      unint64_t v8 = @"no-date";
    }

    uint64_t v10 = [v4 endDate];
    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C10];
      uint64_t v12 = [v4 endDate];
      uint64_t v13 = [v11 localizedStringFromDate:v12 dateStyle:0 timeStyle:1];
    }
    else
    {
      uint64_t v13 = @"no-date";
    }

    uint64_t v9 = [NSString stringWithFormat:@"%@-%@", v8, v13];
  }
  else
  {
    uint64_t v9 = @"no-criteria";
  }

  return v9;
}

- (id)_scoresFlattenForCollections:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v10 = [v9 suggestions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              [(ATXSpotlightLayoutSelector *)self _adaptedScoreForSuggestion:*(void *)(*((void *)&v19 + 1) + 8 * j)];
              double v15 = objc_msgSend(NSNumber, "numberWithDouble:");
              [v5 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)_dedupeSuggestions:(id)a3 suggestionDict:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v47 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v12 = [v11 uiSpecification];
        uint64_t v13 = [v12 title];

        if ([v13 length])
        {
          uint64_t v14 = [v6 objectForKeyedSubscript:v13];
          if (v14)
          {
            double v15 = v14;
            [v14 addObject:v11];
          }
          else
          {
            double v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
            [v6 setObject:v15 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v8);
  }

  uint64_t v16 = self;
  v46 = [(ATXSpotlightLayoutSelector *)self _rankedReasonCodes];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v60;
    uint64_t v44 = *(void *)v60;
    id v45 = v17;
    do
    {
      uint64_t v21 = 0;
      uint64_t v48 = v19;
      do
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v59 + 1) + 8 * v21);
        long long v23 = __atxlog_handle_blending();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [v17 objectForKeyedSubscript:v22];
          uint64_t v25 = [v24 count];
          *(_DWORD *)buf = 138412546;
          long long v69 = v22;
          __int16 v70 = 2048;
          uint64_t v71 = v25;
          _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "SLS: _collectionsWithSuggestions dedupSuggestionTable[%@] : %ld", buf, 0x16u);
        }
        long long v26 = [v17 objectForKeyedSubscript:v22];
        unint64_t v27 = [v26 count];

        if (v27 >= 2)
        {
          uint64_t v50 = v21;
          v28 = [v17 objectForKeyedSubscript:v22];
          uint64_t v29 = (void *)[v28 mutableCopy];

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __64__ATXSpotlightLayoutSelector__dedupeSuggestions_suggestionDict___block_invoke;
          v56[3] = &unk_1E68B5AE0;
          v56[4] = v16;
          id v30 = v47;
          id v57 = v30;
          id v58 = v46;
          [v29 sortUsingComparator:v56];
          [v29 removeLastObject];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v31 = v29;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v67 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v53 != v34) {
                  objc_enumerationMutation(v31);
                }
                id v36 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                id v37 = [v36 uiSpecification];
                uint64_t v38 = -[ATXSpotlightLayoutSelector _contextReasonCodeWithPredictionReasons:](v16, "_contextReasonCodeWithPredictionReasons:", [v37 predictionReasons]);

                uint64_t v39 = __atxlog_handle_blending();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v40 = [v36 uiSpecification];
                  __int16 v41 = [v40 title];
                  *(_DWORD *)buf = 138412546;
                  long long v69 = v41;
                  __int16 v70 = 2048;
                  uint64_t v71 = v38;

                  uint64_t v16 = self;
                }

                uint64_t v42 = [NSNumber numberWithInteger:v38];
                uint64_t v43 = [v30 objectForKeyedSubscript:v42];
                [v43 removeObject:v36];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v52 objects:v67 count:16];
            }
            while (v33);
          }

          uint64_t v20 = v44;
          id v17 = v45;
          uint64_t v19 = v48;
          uint64_t v21 = v50;
        }
        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v19);
  }
}

uint64_t __64__ATXSpotlightLayoutSelector__dedupeSuggestions_suggestionDict___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  uint64_t v7 = [a2 uiSpecification];
  uint64_t v8 = objc_msgSend(v5, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v7, "predictionReasons"));

  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = [v6 uiSpecification];

  uint64_t v11 = objc_msgSend(v9, "_contextReasonCodeWithPredictionReasons:", objc_msgSend(v10, "predictionReasons"));
  uint64_t v12 = (void *)a1[5];
  uint64_t v13 = [NSNumber numberWithInteger:v8];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v15 = [v14 count];

  uint64_t v16 = (void *)a1[5];
  id v17 = [NSNumber numberWithInteger:v11];
  uint64_t v18 = [v16 objectForKeyedSubscript:v17];
  uint64_t v19 = [v18 count];

  uint64_t v20 = [NSNumber numberWithUnsignedInteger:v15];
  uint64_t v21 = [NSNumber numberWithUnsignedInteger:v19];
  uint64_t v22 = [v20 compare:v21];

  if (v22) {
    return v22;
  }
  long long v24 = (void *)a1[6];
  uint64_t v25 = [NSNumber numberWithInteger:v8];
  uint64_t v26 = [v24 indexOfObject:v25];

  unint64_t v27 = (void *)a1[6];
  v28 = [NSNumber numberWithInteger:v11];
  uint64_t v29 = [v27 indexOfObject:v28];

  id v30 = [NSNumber numberWithUnsignedInteger:v29];
  id v31 = [NSNumber numberWithUnsignedInteger:v26];
  uint64_t v32 = [v30 compare:v31];

  return v32;
}

- (id)_createTopAppShortcutSuggestions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4AF40] clientForConsumerType:1];
  id v4 = objc_opt_new();
  id v5 = [v3 appPredictionsForConsumerSubType:9 blackList:v4 limit:8 runningDiagnostics:0];

  id v6 = objc_alloc_init(MEMORY[0x1E4F72B48]);
  uint64_t v7 = [v5 error];

  if (v7)
  {
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 error];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] ATXResponse error: %@", buf, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v8 = [v5 predictedApps];
    uint64_t v11 = __atxlog_handle_blending();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Query top apps for auto shortcuts: %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__ATXSpotlightLayoutSelector__createTopAppShortcutSuggestions__block_invoke;
    v13[3] = &unk_1E68B5B08;
    void v13[4] = self;
    id v14 = v6;
    uint64_t v10 = [v8 _pas_mappedArrayWithTransform:v13];
  }
  return v10;
}

id __62__ATXSpotlightLayoutSelector__createTopAppShortcutSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = [*(id *)(a1 + 32) _validAutoShortcutContextualActionsForBundleId:v3 limit:1 provider:*(void *)(a1 + 40)];
  id v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v8 = [*(id *)(a1 + 32) _titleForParameterizedAutoShortcutContextualAction:v6 provider:*(void *)(a1 + 40)];
    uint64_t v9 = [*(id *)(a1 + 32) _suggestionFromAutoShortcutContextualAction:v6 title:v8 predictionReasons:0];
    uint64_t v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 autoShortcut];
      uint64_t v12 = [v11 localizedAutoShortcutDescription];
      int v14 = 138412802;
      id v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] Created auto shortcut for bundle: %@ [%@] suggestion: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "SLS: [AppShortcut] No valid auto shortcuts found for bundle: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_createTopAppShortcutCollectionsWithSuggestions:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(ATXSpotlightContextAdapter *)self->_adapter topAutoShortcutSectionIdentifier];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F93998]) initWithSuggestions:v4 contextTitle:0 sectionIdentifier:v5];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)_titleForContextCode:(int64_t)a3 suggestions:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  stringForATXSuggestionPredictionReasonCode();
  uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = v7;
    __int16 v44 = 2048;
    int64_t v45 = a3;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title requested for %@, code: %lu", buf, 0x16u);
  }

  if ([(ATXSpotlightLayoutSelector *)self _hasNilTitleForContextCode:a3])
  {
    uint64_t v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v7;
      __int16 v44 = 2048;
      int64_t v45 = a3;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is nil for %@, code: %lu", buf, 0x16u);
    }
    uint64_t v10 = 0;
    goto LABEL_35;
  }
  uint64_t v9 = [(ATXSpotlightLayoutSelector *)self _staticTitleForContextCode:a3];
  uint64_t v11 = __atxlog_handle_blending();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v7;
      __int16 v44 = 2048;
      int64_t v45 = a3;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title dynamic, calculating: %@, code: %lu", buf, 0x16u);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      obuint64_t j = v13;
      uint64_t v34 = v7;
      id v35 = v6;
      uint64_t v10 = 0;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(obj);
          }
          __int16 v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          stringForATXSuggestionPredictionReasonCode();
          uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = __atxlog_handle_blending();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v18 uiSpecification];
            uint64_t v22 = [v21 reason];
            uint64_t v23 = [v22 hash];
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v19;
            __int16 v44 = 2048;
            int64_t v45 = v23;
            _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "SLS: reasonKey:%@ suggestion.uiSpecification.reason.hash = %lu", buf, 0x16u);
          }
          if (v10
            && ([v18 uiSpecification],
                long long v24 = objc_claimAutoreleasedReturnValue(),
                [v24 reason],
                uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                char v26 = [v10 isEqualToString:v25],
                v25,
                v24,
                (v26 & 1) == 0))
          {
            unint64_t v27 = __atxlog_handle_blending();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              uint64_t v29 = [v18 uiSpecification];
              id v30 = [v29 reason];
              *(_DWORD *)buf = 136446722;
              uint64_t v43 = "-[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:]";
              __int16 v44 = 2112;
              int64_t v45 = (int64_t)v10;
              __int16 v46 = 2112;
              int64_t v47 = (int64_t)v30;
              _os_log_fault_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_FAULT, "SLS: %{public}s %@ and %@ are two different suggestion reason for the same context. The resulting title might be wrong", buf, 0x20u);
            }
          }
          else
          {
            unint64_t v27 = [v18 uiSpecification];
            uint64_t v28 = [v27 reason];

            uint64_t v10 = (void *)v28;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v15);

      uint64_t v7 = v34;
      id v6 = v35;
      uint64_t v9 = 0;
      if (v10)
      {
        id v31 = __atxlog_handle_blending();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [v10 hash];
          *(_DWORD *)buf = 134218498;
          uint64_t v43 = (const char *)v32;
          __int16 v44 = 2112;
          int64_t v45 = (int64_t)v34;
          __int16 v46 = 2048;
          int64_t v47 = a3;
          _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is dynamic [%lu] for %@, code: %lu", buf, 0x20u);
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
    }
    id v31 = __atxlog_handle_blending();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ATXSpotlightLayoutSelector _titleForContextCode:suggestions:]();
    }
    uint64_t v10 = 0;
    goto LABEL_34;
  }
  if (v12)
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v43 = (const char *)v9;
    __int16 v44 = 2112;
    int64_t v45 = (int64_t)v7;
    __int16 v46 = 2048;
    int64_t v47 = a3;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "SLS: ATXSpotlightLayoutSelector Section title is static[%@] for %@, code: %lu", buf, 0x20u);
  }

  uint64_t v9 = v9;
  uint64_t v10 = v9;
LABEL_35:

  return v10;
}

- (id)_staticTitleForContextCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  id v6 = 0;
  switch(a3)
  {
    case 19:
      uint64_t v7 = @"CONTEXT_TITLE_ONGOING_CALL";
      goto LABEL_16;
    case 23:
      uint64_t v7 = @"CONTEXT_TITLE_NEARBY";
      goto LABEL_16;
    case 25:
      uint64_t v7 = @"CONTEXT_TITLE_FROM_CLIPBOARD";
      goto LABEL_16;
    case 26:
      uint64_t v7 = @"CONTEXT_TITLE_TRACKING_NUMBER_FROM_CLIPBOARD";
      goto LABEL_16;
    case 27:
      uint64_t v7 = @"CONTEXT_TITLE_URL_FROM_CLIPBOARD";
      goto LABEL_16;
    case 28:
      uint64_t v7 = @"CONTEXT_TITLE_PHONE_NUMBER_FROM_CLIPBOARD";
      goto LABEL_16;
    case 34:
      uint64_t v7 = @"CONTEXT_TITLE_UPCOMING_MEDIA";
      goto LABEL_16;
    case 36:
      uint64_t v7 = @"CONTEXT_TITLE_UPCOMING_TO_WORK_COMMUTE";
      goto LABEL_16;
    case 37:
      uint64_t v7 = @"CONTEXT_TITLE_UPCOMING_FROM_WORK_COMMUTE";
      goto LABEL_16;
    case 38:
      uint64_t v7 = @"CONTEXT_TITLE_UNUSUAL_EARLY_EVENT";
      goto LABEL_16;
    case 39:
      id v6 = @"Debug";
      break;
    case 40:
      uint64_t v7 = @"CONTEXT_TITLE_GOOD_MORNING";
      goto LABEL_16;
    case 41:
      uint64_t v7 = @"CONTEXT_TITLE_WIND_DOWN";
      goto LABEL_16;
    case 42:
      uint64_t v7 = @"CONTEXT_TITLE_SPORTS";
LABEL_16:
      id v6 = [v4 localizedStringForKey:v7 value:&stru_1F2740B58 table:0];
      break;
    default:
      break;
  }

  return v6;
}

- (BOOL)_hasNilTitleForContextCode:(int64_t)a3
{
  return ((unint64_t)a3 < 0x24) & (0x841000000uLL >> a3);
}

- (int64_t)_contextReasonCodeWithPredictionReasons:(unint64_t)a3
{
  [(ATXSpotlightLayoutSelector *)self _supportedContextReasons];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  int64_t v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __70__ATXSpotlightLayoutSelector__contextReasonCodeWithPredictionReasons___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_insertMediaSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwHideOftenPlayed", (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat))
  {
    uint64_t v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Debug: Don't suggest Upcoming media suggestion (Often played at this time)", keyExistsAndHasValidFormat, 2u);
    }

    id v54 = v6;
  }
  else
  {
    id v54 = (id)objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v49 = v6;
    obuint64_t j = v6;
    uint64_t v53 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v53)
    {
      int v55 = 0;
      id v8 = 0;
      uint64_t v52 = *(void *)v57;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v57 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
          uint64_t v11 = v4;
          int v12 = [(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_hyperParameters uiSupportsSuggestion:v10 consumerSubType:v4];
          id v13 = [v10 uiSpecification];
          BOOL v14 = -[ATXSpotlightLayoutSelector _isValidForReasons:](self, "_isValidForReasons:", [v13 predictionReasons]);

          uint64_t v15 = (void *)MEMORY[0x1E4F93940];
          uint64_t v16 = [v10 clientModelSpecification];
          uint64_t v17 = [v16 clientModelId];
          uint64_t v18 = [v15 clientModelTypeFromClientModelId:v17];

          int v19 = v12 ^ 1;
          if (v8) {
            int v19 = 1;
          }
          if (!v19) {
            id v8 = 0;
          }
          if ((v19 & 1) != 0 || v14)
          {
            uint64_t v4 = v11;
          }
          else
          {
            uint64_t v20 = [v10 atxActionExecutableObject];
            uint64_t v21 = [v20 intent];
            if (!v21) {
              goto LABEL_34;
            }

            if (v18 != 1 && v55 > 2) {
              goto LABEL_34;
            }
            uint64_t v22 = __atxlog_handle_blending();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = [v10 uiSpecification];
              long long v24 = [v23 title];
              uint64_t v25 = [v20 intent];
              uint64_t v26 = objc_opt_class();
              *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
              *(void *)long long v61 = v24;
              *(_WORD *)&v61[8] = 2112;
              *(void *)&v61[10] = v26;
              _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "SLS: Checking suggestion '%@' for media intent. Intent of class%@", keyExistsAndHasValidFormat, 0x16u);
            }
            unint64_t v27 = [v20 intent];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v29 = __atxlog_handle_blending();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)keyExistsAndHasValidFormat = 67109378;
                *(_DWORD *)long long v61 = v55;
                *(_WORD *)&v61[4] = 2112;
                *(void *)&v61[6] = v10;
                _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "SLS: Found media suggestion [%i]\n%@", keyExistsAndHasValidFormat, 0x12u);
              }

              id v30 = [MEMORY[0x1E4F494D8] suggestionWithAction:v20 predictionReasons:0x400000000 localizedReason:0 score:0 dateInterval:20.0];
              id v31 = [v10 executableSpecification];
              uint64_t v32 = [v31 executableIdentifier];
              uint64_t v50 = v30;
              uint64_t v33 = [v30 executableSpecification];
              uint64_t v34 = [v33 executableIdentifier];
              char v35 = [v32 isEqualToString:v34];

              if ((v35 & 1) == 0)
              {
                id v36 = __atxlog_handle_blending();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v43 = [v10 executableSpecification];
                  __int16 v44 = [v43 executableIdentifier];
                  int64_t v45 = [v50 executableSpecification];
                  __int16 v46 = [v45 executableIdentifier];
                  *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
                  *(void *)long long v61 = v44;
                  *(_WORD *)&v61[8] = 2112;
                  *(void *)&v61[10] = v46;
                  _os_log_fault_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_FAULT, "SLS: [Upcoming Media] Replicated suggestion does not have the same exec identifier %@ -> %@", keyExistsAndHasValidFormat, 0x16u);
                }
              }
              uint64_t v37 = [v20 routeInfo];
              if (v37
                && (long long v38 = (void *)v37,
                    [v20 routeInfo],
                    long long v39 = objc_claimAutoreleasedReturnValue(),
                    int v40 = [v39 isExternalRoute],
                    v39,
                    v38,
                    v40))
              {
                __int16 v41 = __atxlog_handle_blending();
                uint64_t v4 = v11;
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)keyExistsAndHasValidFormat = 0;
                  _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "SLS: [Upcoming Media] Media suggestion is external route (Airplay). Skipping suggestion", keyExistsAndHasValidFormat, 2u);
                }

                id v8 = 0;
                uint64_t v42 = v50;
              }
              else
              {
                id v8 = v20;
                uint64_t v42 = v50;
                [v54 addObject:v50];
                uint64_t v4 = v11;
              }
            }
            else
            {
LABEL_34:
              id v8 = 0;
              uint64_t v4 = v11;
            }
            ++v55;
          }
          [v54 addObject:v10];
          ++v9;
        }
        while (v53 != v9);
        uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
        uint64_t v53 = v47;
      }
      while (v47);
    }
    else
    {
      id v8 = 0;
    }

    id v6 = v49;
  }

  return v54;
}

+ (BOOL)_isCommuteWildCardSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uiSpecification];
  uint64_t v5 = [v4 predictionReasons];

  id v6 = [v3 uiSpecification];
  uint64_t v7 = [v6 predictionReasons];

  id v8 = (void *)MEMORY[0x1E4F93940];
  uint64_t v9 = [v3 clientModelSpecification];

  uint64_t v10 = [v9 clientModelId];
  uint64_t v11 = [v8 clientModelTypeFromClientModelId:v10];

  return v11 == 1 && (v5 & 0x1000000000 | v7 & 0x2000000000) != 0;
}

+ (BOOL)_isCommuteMediaSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uiSpecification];
  uint64_t v5 = [v4 predictionReasons];

  id v6 = [v3 uiSpecification];
  uint64_t v7 = [v6 predictionReasons];

  id v8 = [v3 atxActionExecutableObject];

  uint64_t v9 = [v8 intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && (v5 & 0x1000000000 | v7 & 0x2000000000) != 0;
}

+ (id)_commuteWildcardReducer:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = (id)objc_opt_new();
  uint64_t v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "SLS: [Wildcard] considering commute wildcard suggestions", buf, 2u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v24 = 1;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (![a1 _isCommuteMediaSuggestion:v11])
        {
          if (![a1 _isCommuteWildCardSuggestion:v11])
          {
            [v26 addObject:v11];
            continue;
          }
          if (v24 < 1)
          {
            uint64_t v17 = __atxlog_handle_blending();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v18 = v17;
              int v19 = "SLS: [Wildcard] skipping other from anchor";
LABEL_23:
              _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
            }
          }
          else
          {
            [v26 addObject:v11];
            uint64_t v17 = __atxlog_handle_blending();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v18 = v17;
              int v19 = "SLS: [Wildcard] including wildcard from anchor";
              goto LABEL_23;
            }
          }

          uint64_t v24 = 0;
          continue;
        }
        int v12 = [v11 atxActionExecutableObject];
        id v13 = [v12 intent];
        BOOL v14 = [v13 launchId];
        int v15 = [v14 isEqualToString:@"com.apple.tv"];

        if (!v15)
        {
          if (v9 < 1)
          {
            uint64_t v20 = __atxlog_handle_blending();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v21 = v20;
              uint64_t v22 = "SLS: [Wildcard] skipping media for commute";
LABEL_27:
              _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
            }
          }
          else
          {
            [v26 addObject:v11];
            uint64_t v20 = __atxlog_handle_blending();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v21 = v20;
              uint64_t v22 = "SLS: [Wildcard] including media for commute ";
              goto LABEL_27;
            }
          }

          uint64_t v9 = 0;
          continue;
        }
        uint64_t v16 = __atxlog_handle_blending();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "SLS: [Wildcard] skipping media video", buf, 2u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  return v26;
}

- (id)_heroDataReducer:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v47 = objc_opt_new();
  uint64_t v48 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x1E4F72B48]);
  uint64_t v6 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = v4;
  uint64_t v50 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v50)
  {
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v52;
    *(void *)&long long v8 = 138412290;
    long long v40 = v8;
    id v42 = v7;
    uint64_t v43 = self;
    int64_t v45 = v6;
    id v46 = v5;
    uint64_t v44 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "uiSpecification", v40);
        char v14 = [v13 allowedOnSpotlight];

        if (v14)
        {
          int v15 = [(ATXSpotlightLayoutSelector *)self _poiMUIDFromHero:v12];
          if (v15)
          {
            uint64_t v16 = [(ATXSpotlightLayoutSelector *)self _createPOISuggestionWithMUID:v15 fromHeroSuggestion:v12];
            uint64_t v17 = __atxlog_handle_blending();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [v15 unsignedLongLongValue];
              *(_DWORD *)buf = 134218498;
              uint64_t v56 = v18;
              __int16 v57 = 2112;
              long long v58 = v16;
              __int16 v59 = 2112;
              long long v60 = v12;
              _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: Created POI [%llu] suggestion: %@, from hero suggestion: %@", buf, 0x20u);
            }

            int v19 = [v16 clientModelSpecification];
            uint64_t v20 = [v19 clientModelId];

            uint64_t v21 = [v47 objectForKeyedSubscript:v20];

            if (!v21)
            {
              uint64_t v22 = objc_opt_new();
              [v47 setObject:v22 forKeyedSubscript:v20];
            }
            uint64_t v23 = [v47 objectForKeyedSubscript:v20];
            [v23 addObject:v16];

            [v6 addObject:v16];
            ++v9;
            [v48 addObject:v12];
          }
          [v6 addObject:v12];
          unint64_t v49 = v9;
          if (v9 >= 2)
          {
            [v6 removeObjectsInArray:v48];
            uint64_t v24 = objc_opt_new();

            uint64_t v48 = (void *)v24;
          }
          uint64_t v25 = [v12 bundleIdExecutableObject];
          id v26 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:23];
          if (v25)
          {
            long long v27 = [v12 clientModelSpecification];
            long long v28 = [v27 clientModelId];
            int v29 = [v28 isEqual:v26];

            if (v29)
            {
              long long v30 = (void *)MEMORY[0x1D25F6CC0]();
              id v31 = [(ATXSpotlightLayoutSelector *)self _validAutoShortcutContextualActionsForBundleId:v25 limit:1 provider:v46];
              [v31 firstObject];
              uint64_t v33 = v32 = self;

              if (v33)
              {
                uint64_t v34 = (void *)MEMORY[0x1D25F6CC0]();
                char v35 = [(ATXSpotlightLayoutSelector *)v32 _titleForParameterizedAutoShortcutContextualAction:v33 provider:v46];
                id v36 = [(ATXSpotlightLayoutSelector *)v32 _suggestionFromAutoShortcutContextualAction:v33 title:v35 predictionReasons:0x800000];
                uint64_t v37 = __atxlog_handle_blending();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v41 = [v33 autoShortcut];
                  long long v38 = [v41 localizedAutoShortcutDescription];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v56 = (uint64_t)v25;
                  __int16 v57 = 2112;
                  long long v58 = v38;
                  __int16 v59 = 2112;
                  long long v60 = v36;
                  __int16 v61 = 2112;
                  long long v62 = v12;
                  _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: Created auto shortcut for bundle: %@ [%@] suggestion: %@, from hero suggestion: %@", buf, 0x2Au);
                }
                if (v36) {
                  [v45 addObject:v36];
                }
              }
              else
              {
                char v35 = __atxlog_handle_blending();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v40;
                  uint64_t v56 = (uint64_t)v25;
                  _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: No auto shortcuts found for bundle: %@", buf, 0xCu);
                }
              }
              id v7 = v42;

              self = v43;
            }
          }

          uint64_t v6 = v45;
          id v5 = v46;
          unint64_t v9 = v49;
          uint64_t v10 = v44;
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v50 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v50);
  }

  return v6;
}

- (id)_poiMUIDFromHero:(id)a3
{
  id v3 = [a3 appClipHeroAppPredictionExecutableObject];
  id v4 = v3;
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_16;
  }
  id v5 = [v3 poiMuid];
  if (!v5)
  {
    id v7 = [v4 clipMetadata];

    if (v7)
    {
      long long v8 = [v4 clipMetadata];
      id v5 = [v8 clipMapItemMUID];

      if (v5)
      {
        unint64_t v9 = __atxlog_handle_hero();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[ATXSpotlightLayoutSelector _poiMUIDFromHero:](v5);
        }
LABEL_15:

        goto LABEL_16;
      }
LABEL_12:
      unint64_t v9 = __atxlog_handle_blending();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXSpotlightLayoutSelector _poiMUIDFromHero:](v9);
      }
      id v5 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v6 = __atxlog_handle_hero();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXSpotlightLayoutSelector _poiMUIDFromHero:](v5);
  }

  if (!v5) {
    goto LABEL_12;
  }
LABEL_16:

  return v5;
}

- (id)_createPOISuggestionWithMUID:(id)a3 fromHeroSuggestion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 appClipHeroAppPredictionExecutableObject];
  uint64_t v8 = [v7 bundleId];
  unint64_t v9 = __atxlog_handle_blending();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 adamId];
    uint64_t v11 = [v7 bundleId];
    uint64_t v12 = [v5 unsignedLongLongValue];
    id v13 = [v7 clipMetadata];
    char v14 = [v13 clipURLHash];
    *(_DWORD *)buf = 134218754;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    __int16 v38 = 2048;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    __int16 v41 = v14;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "_heroDataReducer: found POI adam: %lu, bundle: %@, muid: %llu, clipURLHash: %@, ", buf, 0x2Au);
  }
  int v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithPOIName:v8 muid:v5 criteria:0];
  id v31 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
  uint64_t v32 = v5;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v31 clientModelVersion:@"1.0" engagementResetPolicy:1];
  id v17 = objc_alloc(MEMORY[0x1E4F93950]);
  uint64_t v18 = [v15 actionDescription];
  int v19 = [v15 actionIdentifier];
  uint64_t v20 = (void *)[v17 initWithExecutableObject:v15 executableDescription:v18 executableIdentifier:v19 suggestionExecutableType:8];

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F93960]) initWithApplicableSuggestionLayout:5];
  uint64_t v33 = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];

  LOWORD(v30) = 1;
  uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", 0, 0, 0, v22, 0, 0, v30, 0x800000);
  [v6 scoreSpecification];
  uint64_t v24 = v7;
  id v26 = v25 = (void *)v8;

  long long v27 = (void *)[v26 copy];
  long long v28 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v16 executableSpecification:v20 uiSpecification:v23 scoreSpecification:v27];

  return v28;
}

- (id)_validAutoShortcutContextualActionsForBundleId:(id)a3 limit:(unint64_t)a4 provider:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F4B330] isAutoShortcutsEnabledForSpotlightForBundleId:v7])
  {
    id v34 = v8;
    unint64_t v9 = [(ATXSpotlightLayoutSelector *)self _autoShortcutsForBundleId:v7 provider:v8];
    uint64_t v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412803;
      id v46 = v7;
      __int16 v47 = 2048;
      uint64_t v48 = [v9 count];
      __int16 v49 = 2117;
      uint64_t v50 = v9;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] list all for %@ [%lu] %{sensitive}@", buf, 0x20u);
    }

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke;
    v42[3] = &unk_1E68B5B58;
    id v35 = v7;
    id v11 = v7;
    id v43 = v11;
    uint64_t v33 = v9;
    uint64_t v12 = [v9 _pas_mappedArrayWithTransform:v42];
    id v13 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_228);

    char v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v38 + 1) + 8 * v18);
        uint64_t v20 = (void *)MEMORY[0x1E4F4B330];
        uint64_t v21 = [v19 phrase];
        uint64_t v22 = [v21 signature];
        int v23 = [v20 isAutoShortcutEnabledForSpotlightForBundleId:v11 signature:v22];

        uint64_t v24 = __atxlog_handle_blending();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
        if (v23)
        {
          if (v25)
          {
            id v26 = [v19 autoShortcut];
            *(_DWORD *)buf = 138739971;
            id v46 = v26;
            _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] enabled: %{sensitive}@", buf, 0xCu);
          }
          [v14 addObject:v19];
        }
        else
        {
          if (v25)
          {
            long long v27 = [v19 autoShortcut];
            *(_DWORD *)buf = 138739971;
            id v46 = v27;
            _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_INFO, "SLS: [AutoShortcut] disabled: %{sensitive}@", buf, 0xCu);
          }
        }
        if ([v14 count] >= a4) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v16) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    long long v28 = __atxlog_handle_blending();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v14 count];
      *(_DWORD *)buf = 138412803;
      id v46 = v11;
      __int16 v47 = 2048;
      uint64_t v48 = v29;
      __int16 v49 = 2117;
      uint64_t v50 = v14;
      _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] filtered for %@ [%lu] %{sensitive}@", buf, 0x20u);
    }

    id v30 = [v14 copy];
    id v8 = v34;
    id v7 = v35;
    id v31 = v33;
  }
  else
  {
    id v31 = __atxlog_handle_blending();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v7;
      _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] Shortcuts setting off for bundle %@", buf, 0xCu);
    }
    id v30 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

id __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB45A8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithAutoShortcut:v4 bundleIdentifier:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __92__ATXSpotlightLayoutSelector__validAutoShortcutContextualActionsForBundleId_limit_provider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB4590];
  id v3 = [a2 autoShortcut];
  LODWORD(v2) = [v2 isAppShortcutDenyListed:v3 inEnvironment:2];

  return v2 ^ 1;
}

- (id)_autoShortcutsForBundleId:(id)a3 provider:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v7 localeIdentifier];

  unint64_t v9 = __atxlog_handle_blending();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] searching %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__101;
  uint64_t v29 = __Block_byref_object_dispose__101;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke;
  v18[3] = &unk_1E68ADBA0;
  id v11 = v5;
  id v19 = v11;
  p_long long buf = &buf;
  uint64_t v12 = v10;
  uint64_t v20 = v12;
  [v6 autoShortcutsForBundleIdentifier:v11 localeIdentifier:v8 completion:v18];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v12 timeoutSeconds:5.0] == 1)
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXSpotlightLayoutSelector _autoShortcutsForBundleId:provider:]();
    }
  }
  char v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v22 = 138412547;
    id v23 = v11;
    __int16 v24 = 2117;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] found for %@, %{sensitive}@", v22, 0x16u);
  }

  id v16 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v16;
}

void __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke_cold_1(a1, (uint64_t)v7, v8);
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_titleForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 phrase];
  id v8 = [v7 parameterIdentifier];

  if (v8)
  {
    uint64_t v29 = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    id v28 = 0;
    dispatch_semaphore_t v10 = [v6 propertiesForIdentifiers:v9 error:&v28];
    id v11 = v28;

    if (v11)
    {
      uint64_t v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXSpotlightLayoutSelector _titleForParameterizedAutoShortcutContextualAction:provider:](v5, (uint64_t)v11, v12);
      }
    }
    else
    {
      if (v10)
      {
        id v16 = [v10 objectForKeyedSubscript:v8];
        uint64_t v12 = v16;
        if (v16)
        {
          uint64_t v17 = [v16 value];
          uint64_t v18 = [v17 displayRepresentation];

          id v19 = [v18 title];

          if (v19)
          {
            uint64_t v20 = [v18 title];
            id v13 = [v20 atx_efficientLocalizedString];
          }
          else
          {
            uint64_t v20 = __atxlog_handle_blending();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [v5 bundleIdentifier];
              id v26 = [v5 actionIdentifier];
              *(_DWORD *)long long buf = 138412546;
              uint64_t v31 = v25;
              __int16 v32 = 2112;
              uint64_t v33 = v26;
              _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] displayRepresentation or title nil for %@, %@", buf, 0x16u);
            }
            id v13 = 0;
          }
        }
        else
        {
          uint64_t v18 = __atxlog_handle_blending();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v5 bundleIdentifier];
            __int16 v24 = [v5 actionIdentifier];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v31 = v23;
            __int16 v32 = 2112;
            uint64_t v33 = v24;
            _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] property nil for %@, %@", buf, 0x16u);
          }
          id v13 = 0;
        }

        goto LABEL_23;
      }
      uint64_t v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v5 bundleIdentifier];
        uint64_t v22 = [v5 actionIdentifier];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        uint64_t v33 = v22;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] all properties nil for %@, %@", buf, 0x16u);
      }
    }
    id v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [v5 bundleIdentifier];
    uint64_t v15 = [v5 actionIdentifier];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "SLS: [AutoShortcut] not a phrase with parameters, use short title %@, %@", buf, 0x16u);
  }
  id v13 = 0;
LABEL_24:

  return v13;
}

- (id)_suggestionFromAutoShortcutContextualAction:(id)a3 title:(id)a4 predictionReasons:(unint64_t)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v7 criteria:0];
  if (!v8)
  {
    dispatch_semaphore_t v10 = [v7 autoShortcut];
    id v11 = [v10 localizedShortTitle];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v7 displayString];
    }
    id v8 = v13;
  }
  char v14 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v14 clientModelVersion:@"1.0" engagementResetPolicy:1];
  id v16 = objc_alloc(MEMORY[0x1E4F93950]);
  uint64_t v17 = [v7 displayString];
  uint64_t v18 = [v7 uniqueIdentifier];
  id v19 = (void *)[v16 initWithExecutableObject:v9 executableDescription:v17 executableIdentifier:v18 suggestionExecutableType:9];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F93960]) initWithApplicableSuggestionLayout:5];
  v27[0] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

  LOWORD(v26) = 1;
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v8, 0, 0, v21, 0, 0, v26, a5);
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:15.0];
  __int16 v24 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v15 executableSpecification:v19 uiSpecification:v22 scoreSpecification:v23];

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
}

- (void)_isValidForReasons:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "SLS: ATXSpotlightLayoutSelector suggestion not valid: More than one Context set for reasons %llu", v1, 0xCu);
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_116_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "[Index] Deleting Error deleteSearchableItems: %@", v2, v3, v4, v5, v6);
}

void __53__ATXSpotlightLayoutSelector__indexSpotlightActions___block_invoke_117_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "[Index] Inserting Error indexSearchableItems: %@", v2, v3, v4, v5, v6);
}

- (void)_preferredContextWithContextCode:(uint64_t)a1 contextCriteria:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = stringForATXSuggestionPredictionReasonCode();
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "SLS: contextCode %@ is not an event context. We shouldn't be here", v4, 0xCu);
}

- (void)_titleForContextCode:suggestions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v0, v1, "SLS: ATXSpotlightLayoutSelector Section title is nil and should be dynamic: %@, code: %lu");
}

- (void)_poiMUIDFromHero:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "_heroDataReducer: ATXHeroData does not have poiMuid or clipMapItemMUID", v1, 2u);
}

- (void)_poiMUIDFromHero:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 stringValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Got POI MUID from tile server: %@", v4, v5, v6, v7, v8);
}

- (void)_poiMUIDFromHero:(void *)a1 .cold.3(void *a1)
{
  os_log_t v1 = [a1 stringValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Got POI MUID from Clips Metadata: %@", v4, v5, v6, v7, v8);
}

- (void)_autoShortcutsForBundleId:provider:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "SLS: [AutoShortcut] lookup timeout for %@", v2, v3, v4, v5, v6);
}

void __65__ATXSpotlightLayoutSelector__autoShortcutsForBundleId_provider___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, a2, a3, "SLS: [AutoShortcut] lookup for %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_titleForParameterizedAutoShortcutContextualAction:(NSObject *)a3 provider:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 bundleIdentifier];
  uint64_t v7 = [a1 actionIdentifier];
  int v8 = 138412802;
  unint64_t v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "SLS: [AutoShortcut] title lookup error for %@, %@: %@", (uint8_t *)&v8, 0x20u);
}

@end