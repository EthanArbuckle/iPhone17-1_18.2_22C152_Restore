@interface MapsSuggestionsPortraitRelevanceScoreProvider
- (MapsSuggestionsPortraitRelevanceScoreProvider)initWithPortrait:(id)a3;
- (NSString)uniqueName;
- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6;
- (id).cxx_construct;
- (uint64_t)_searchForName:(uint64_t)a1;
- (void)preLoad;
@end

@implementation MapsSuggestionsPortraitRelevanceScoreProvider

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsPortraitRelevanceScoreProvider)initWithPortrait:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MapsSuggestionsPortraitRelevanceScoreProvider;
  v6 = [(MapsSuggestionsPortraitRelevanceScoreProvider *)&v26 init];
  if (v6)
  {
    GEOConfigGetDouble();
    uint64_t v8 = MapsSuggestionsNowWithOffset(-v7);
    fetchEntriesFromDate = v6->_fetchEntriesFromDate;
    v6->_fetchEntriesFromDate = (NSDate *)v8;

    portraitData = v6->_portraitData;
    v6->_portraitData = (NSArray *)MEMORY[0x1E4F1CBF0];

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v24, @"MapsSuggestionsPortraitRelevanceScoreProviderQueue", v11);
    dispatch_queue_t v12 = v24;
    dispatch_queue_t v24 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v12;

    v14 = v25;
    v25 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA20] currentLocale];
    currentLocale = v6->_currentLocale;
    v6->_currentLocale = (NSLocale *)v16;

    uint64_t v18 = [(NSLocale *)v6->_currentLocale objectForKey:*MEMORY[0x1E4F1C438]];
    languageCode = v6->_languageCode;
    v6->_languageCode = (NSString *)v18;

    v20 = [MEMORY[0x1E4F64500] sharedConfiguration];
    uint64_t v21 = [v20 countryCode];
    currentCountryCode = v6->_currentCountryCode;
    v6->_currentCountryCode = (NSString *)v21;

    objc_storeStrong((id *)&v6->_portrait, a3);
  }

  return v6;
}

- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    dispatch_queue_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (!v11)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
      __int16 v30 = 1024;
      int v31 = 81;
      __int16 v32 = 2082;
      v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      __int16 v34 = 2082;
      v35 = "nil == (completion)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
        __int16 v30 = 1024;
        int v31 = 83;
        __int16 v32 = 2082;
        v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        __int16 v34 = 2082;
        v35 = "[addresses isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for addresses results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_27;
    }
    if (!+[MapsSuggestionsSiri isEnabled])
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using Siri Portrait", buf, 2u);
      }
      goto LABEL_27;
    }
    v14 = [v9 copy];

    v15 = (void *)[v10 copy];
    if (v15)
    {
      uint64_t v16 = [v14 count];
      if (v16 != [v15 count])
      {
        v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
          __int16 v30 = 1024;
          int v31 = 96;
          __int16 v32 = 2082;
          v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
          __int16 v34 = 2082;
          v35 = "[names count] != [addresses count]";
          _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Inconsistent array counts for name and address", buf, 0x26u);
        }
        goto LABEL_35;
      }
    }
    else if (!v14)
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
        __int16 v30 = 1024;
        int v31 = 98;
        __int16 v32 = 2082;
        v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        __int16 v34 = 2082;
        v35 = "(nil == names) && (nil == addresses)";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. names and addresses can't both be nil", buf, 0x26u);
      }
      goto LABEL_28;
    }
    uint64_t v20 = [v14 count];
    if (v20)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__MapsSuggestionsPortraitRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
      v22[3] = &unk_1E5CC3570;
      uint64_t v27 = v20;
      v23 = v14;
      dispatch_queue_t v24 = self;
      id v25 = v15;
      id v26 = v11;
      id v21 = v15;
      v9 = v14;
      MSg::Queue::async<MapsSuggestionsPortraitRelevanceScoreProvider>((NSObject **)&self->_queue, self, v22);

      char v18 = 1;
      goto LABEL_29;
    }
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "0 names passed", buf, 2u);
    }
LABEL_35:

    char v18 = 0;
    v9 = v14;
    goto LABEL_29;
  }
  v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
    __int16 v30 = 1024;
    int v31 = 82;
    __int16 v32 = 2082;
    v33 = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
    __int16 v34 = 2082;
    v35 = "[names isKindOfClass:[NSMutableArray class]]";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for names results in undefined behaviour", buf, 0x26u);
  }
LABEL_27:

LABEL_28:
  char v18 = 0;
LABEL_29:

  return v18;
}

void __102__MapsSuggestionsPortraitRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v41 = a2;
  uint64_t v36 = objc_alloc_init(MapsSuggestionsRelevanceScore);
  v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[8]];
  uint64_t v2 = -1;
  while ((unint64_t)++v2 < a1[8])
    [v40 addObject:v36];
  if (![v41[2] count]) {
    goto LABEL_54;
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "User Portrait Data:", buf, 2u);
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v4 = v41[2];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v51;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * v7);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            id v10 = [v8 name];
            id v11 = [v8 lastInteractionTime];
            *(_DWORD *)buf = 138412546;
            v55 = v10;
            __int16 v56 = 2112;
            *(void *)v57 = v11;
            _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "%@, %@\n", buf, 0x16u);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v5);
  }

  dispatch_queue_t v12 = (void *)a1[4];
  if (v12)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v18 = -[MapsSuggestionsPortraitRelevanceScoreProvider _searchForName:]((uint64_t)v41, *(void **)(*((void *)&v46 + 1) + 8 * i));
          if (v18 <= 0x7FFFFFFFFFFFFFFELL)
          {
            v19 = [[MapsSuggestionsRelevanceScore alloc] initWithConfidence:MapsSuggestionsConfidenceDefinitelyTrue()];
            uint64_t v20 = [*(id *)(a1[5] + 16) objectAtIndexedSubscript:v18];
            id v21 = [v20 lastInteractionTime];
            [(MapsSuggestionsRelevanceScore *)v19 setLastInteractionTime:v21];

            [v40 setObject:v19 atIndexedSubscript:v15 + i];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v61 count:16];
        v15 += i;
      }
      while (v14);
    }
  }
  v22 = (void *)a1[6];
  if (v22)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v22;
    uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v60 count:16];
    if (v23)
    {
      uint64_t v24 = 0;
      uint64_t v38 = *(void *)v43;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(obj);
          }
          id v26 = (void *)[objc_alloc(MEMORY[0x1E4F643C0]) initWithCNPostalAddress:*(void *)(*((void *)&v42 + 1) + 8 * v25) language:v41[6] country:v41[7] phoneticLocale:v41[6]];
          uint64_t v27 = [v26 shortAddress];
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          if (s_verbose)
          {
            v28 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v27;
              _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "Converted Address is %@", buf, 0xCu);
            }
          }
          v29 = [v40 objectAtIndexedSubscript:v24 + v25];
          [v29 confidence];
          if (v30 < MapsSuggestionsConfidenceDefinitelyTrue())
          {
            unint64_t v31 = -[MapsSuggestionsPortraitRelevanceScoreProvider _searchForName:](a1[5], v27);
            if (v31 <= 0x7FFFFFFFFFFFFFFELL)
            {
              __int16 v32 = [[MapsSuggestionsRelevanceScore alloc] initWithConfidence:MapsSuggestionsConfidenceDefinitelyTrue()];
              v33 = [*(id *)(a1[5] + 16) objectAtIndexedSubscript:v31];
              __int16 v34 = [v33 lastInteractionTime];
              [(MapsSuggestionsRelevanceScore *)v32 setLastInteractionTime:v34];

              [v40 setObject:v32 atIndexedSubscript:v24 + v25];
            }
          }

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v60 count:16];
        v24 += v25;
      }
      while (v23);
    }
  }
  if ([v40 count] != a1[8])
  {
    v35 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitRelevanceScoreProvider.mm";
      __int16 v56 = 1024;
      *(_DWORD *)v57 = 166;
      *(_WORD *)&v57[4] = 2082;
      *(void *)&v57[6] = "-[MapsSuggestionsPortraitRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:com"
                           "pletion:]_block_invoke";
      __int16 v58 = 2082;
      v59 = "[confidences count] != count";
      _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Return count must be same as input count!", buf, 0x26u);
    }
  }
  else
  {
LABEL_54:
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (uint64_t)_searchForName:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v17 = 0;
    goto LABEL_28;
  }
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v3)
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    id v13 = "Search String null";
LABEL_24:
    uint64_t v14 = v5;
    uint32_t v15 = 2;
    goto LABEL_25;
  }
  if (![*(id *)(a1 + 16) count])
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    id v13 = "No portrait data";
    goto LABEL_24;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = *(id *)(a1 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6 + v7;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v9), "name", (void)v19);
        BOOL v12 = [v11 caseInsensitiveCompare:v3] == 0;

        if (v12)
        {
          uint64_t v16 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v3;
            _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "String %@ was found in Portrait. Setting High Confidence", buf, 0xCu);
          }

          uint64_t v17 = v7 + v9;
          goto LABEL_27;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (!s_verbose)
  {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_28;
  }
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v3;
    id v13 = "String %@ was not found in Portrait";
    uint64_t v14 = v5;
    uint32_t v15 = 12;
LABEL_25:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, v13, buf, v15);
  }
LABEL_26:
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_27:

LABEL_28:
  return v17;
}

- (void)preLoad
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[MapsSuggestionsPortraitRelevanceScoreProvider preLoad]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  if (self)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      MSg::Queue::async<MapsSuggestionsPortraitRelevanceScoreProvider>((NSObject **)&self->_queue, self, &__block_literal_global_42);
    }
    else
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using Siri Portrait", (uint8_t *)&v5, 2u);
      }
    }
  }
}

void __74__MapsSuggestionsPortraitRelevanceScoreProvider__fetchStringsFromPortrait__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4[8] fetchNamedEntitiesFromDate:v4[1]];
  id v3 = v4[2];
  v4[2] = (id)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portrait, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);

  objc_storeStrong((id *)&self->_portraitData, 0);
  objc_storeStrong((id *)&self->_fetchEntriesFromDate, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end