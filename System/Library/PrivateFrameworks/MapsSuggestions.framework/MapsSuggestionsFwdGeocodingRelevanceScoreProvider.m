@interface MapsSuggestionsFwdGeocodingRelevanceScoreProvider
- (BOOL)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6;
- (NSString)uniqueName;
- (id)initDecoratingRelevanceScoreProvider:(id)a3 networkRequester:(id)a4;
- (void)preLoad;
@end

@implementation MapsSuggestionsFwdGeocodingRelevanceScoreProvider

- (id)initDecoratingRelevanceScoreProvider:(id)a3 networkRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsFwdGeocodingRelevanceScoreProvider;
  v9 = [(MapsSuggestionsFwdGeocodingRelevanceScoreProvider *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkRequester, a4);
    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = a4;
  objc_super v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
      __int16 v50 = 1024;
      int v51 = 55;
      __int16 v52 = 2082;
      v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      __int16 v54 = 2082;
      v55 = "nil == (completion)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        __int16 v50 = 1024;
        int v51 = 57;
        __int16 v52 = 2082;
        v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        __int16 v54 = 2082;
        v55 = "[addresses isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for addresses results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        __int16 v50 = 1024;
        int v51 = 58;
        __int16 v52 = 2082;
        v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        __int16 v54 = 2082;
        v55 = "[mapItems isKindOfClass:[NSMutableArray class]]";
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for mapItems results in undefined behaviour", buf, 0x26u);
      }
      goto LABEL_16;
    }
    v17 = (void *)[v10 copy];

    v18 = [v11 copy];
    uint64_t v19 = [v12 copy];

    if (v19)
    {
      char v15 = [(MapsSuggestionsRelevanceScoreProvider *)self->_wrappedScoreProvider relevanceScoreForNames:v17 addresses:v18 mapItems:v19 completion:v13];
      objc_super v12 = v19;
LABEL_37:
      v11 = v18;
      id v10 = v17;
      goto LABEL_17;
    }
    uint64_t v20 = [v17 count];
    if (v20 != [v18 count])
    {
      objc_super v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
        __int16 v50 = 1024;
        int v51 = 72;
        __int16 v52 = 2082;
        v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
        __int16 v54 = 2082;
        v55 = "[names count] != [addresses count]";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Name and Address count did not match.", buf, 0x26u);
      }
      char v15 = 0;
      goto LABEL_37;
    }
    group = dispatch_group_create();
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v18, "count"));
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v11 = v18;
    uint64_t v21 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v11);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v30 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
              __int16 v50 = 1024;
              int v51 = 78;
              __int16 v52 = 2082;
              v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
              __int16 v54 = 2082;
              v55 = "! [address isKindOfClass:[CNPostalAddress class]]";
              _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Address is not of type CNPostalAddress!", buf, 0x26u);
            }

            v31 = v11;
            goto LABEL_41;
          }
          dispatch_group_enter(group);
          networkRequester = self->_networkRequester;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __106__MapsSuggestionsFwdGeocodingRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
          v35[3] = &unk_1E5CB9A98;
          id v36 = v33;
          v37 = group;
          v38 = &v43;
          [(MapsSuggestionsNetworkRequester *)networkRequester forwardGeocodePostalAddress:v24 completion:v35];
        }
        uint64_t v21 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    GEOConfigGetDouble();
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    if (dispatch_group_wait(group, v27))
    {
      v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_ERROR, "Timeout on getting mapItems from Fwd Geo", buf, 2u);
      }

      objc_super v12 = 0;
      *((unsigned char *)v44 + 24) = 0;
      v29 = v17;
    }
    else
    {
      v29 = v17;
      if (*((unsigned char *)v44 + 24))
      {
        uint64_t v32 = [v33 count];
        if (v32 != [v17 count])
        {
          v31 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
            __int16 v50 = 1024;
            int v51 = 111;
            __int16 v52 = 2082;
            v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
            __int16 v54 = 2082;
            v55 = "[mutablemapItems count] != [names count]";
            _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Count of mapItems is not the same as input", buf, 0x26u);
          }
LABEL_41:

          objc_super v12 = 0;
          char v15 = 0;
          goto LABEL_42;
        }
        objc_super v12 = [v33 copy];
      }
      else
      {
        objc_super v12 = 0;
      }
    }
    char v15 = [(MapsSuggestionsRelevanceScoreProvider *)self->_wrappedScoreProvider relevanceScoreForNames:v29 addresses:v11 mapItems:v12 completion:v13];
LABEL_42:
    _Block_object_dispose(&v43, 8);

    id v10 = v17;
    goto LABEL_17;
  }
  v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFwdGeocodingRelevanceScoreProvider.m";
    __int16 v50 = 1024;
    int v51 = 56;
    __int16 v52 = 2082;
    v53 = "-[MapsSuggestionsFwdGeocodingRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
    __int16 v54 = 2082;
    v55 = "[names isKindOfClass:[NSMutableArray class]]";
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for names results in undefined behaviour", buf, 0x26u);
  }
LABEL_16:

  char v15 = 0;
LABEL_17:

  return v15;
}

void __106__MapsSuggestionsFwdGeocodingRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v6;
      id v8 = "Error in forwardGeocodePostalAddress:%@";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_4:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
    }
  }
  else
  {
    if ([v5 count])
    {
      id v13 = *(void **)(a1 + 32);
      v14 = [v5 firstObject];
      [v13 addObject:v14];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_8;
    }
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      id v8 = "Recieved 0 mapItems in forwardGeocodePostalAddress";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_4;
    }
  }

  v11 = *(void **)(a1 + 32);
  objc_super v12 = [MEMORY[0x1E4F1CA98] null];
  [v11 addObject:v12];

LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)preLoad
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedScoreProvider, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
}

@end