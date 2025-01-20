@interface MapsSuggestionsSimpleStrategy
- (BOOL)postFiltersKept:(id)a3;
- (BOOL)preFiltersKept:(id)a3;
- (MapsSuggestionsManager)manager;
- (MapsSuggestionsSimpleStrategy)init;
- (NSString)uniqueName;
- (id)topSuggestionsWithSourceEntries:(id)a3 error:(id *)a4;
- (uint64_t)_dedupeByEnrichingEntries:(void *)a3 withEntry:;
- (void)_addFilter:(uint64_t)a3 processingType:;
- (void)addDeduper:(id)a3;
- (void)addImprover:(id)a3;
- (void)addPostFilter:(id)a3;
- (void)addPreFilter:(id)a3;
- (void)clearData;
- (void)removeAllDedupers;
- (void)removeAllFilters;
- (void)removeAllImprovers;
- (void)removeFilter:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation MapsSuggestionsSimpleStrategy

- (void)setManager:(id)a3
{
}

- (void)addImprover:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = v4;
  if (!v4)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    __int16 v16 = 1024;
    int v17 = 390;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addImprover:]";
    __int16 v20 = 2082;
    v21 = "nil == (improver)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an improver";
LABEL_12:
    v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 38;
LABEL_18:
    _os_log_impl(&dword_1A70DF000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_19;
  }
  if (([v4 conformsToProtocol:&unk_1EFC8C2F8] & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    __int16 v16 = 1024;
    int v17 = 391;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addImprover:]";
    __int16 v20 = 2082;
    v21 = "![improver conformsToProtocol:@protocol(MapsSuggestionsImprover)]";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Improver should conform to MapsSuggestionsImprover protocol";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      v15 = v5;
      v10 = "Improver:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_17:
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (([(id)objc_opt_class() isEnabled] & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      v15 = v5;
      v10 = "Improver:%@ is not enabled. Returning.";
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  improvers = self->_improvers;
  if (!improvers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_improvers;
    self->_improvers = v7;

    improvers = self->_improvers;
  }
  [(NSMutableArray *)improvers addObject:v5];
LABEL_20:
}

- (void)addDeduper:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = v4;
  if (!v4)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    __int16 v16 = 1024;
    int v17 = 419;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addDeduper:]";
    __int16 v20 = 2082;
    v21 = "nil == (deduper)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an deduper";
LABEL_12:
    v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 38;
LABEL_18:
    _os_log_impl(&dword_1A70DF000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_19;
  }
  if (([v4 conformsToProtocol:&unk_1EFC8C280] & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    __int16 v16 = 1024;
    int v17 = 420;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addDeduper:]";
    __int16 v20 = 2082;
    v21 = "![deduper conformsToProtocol:@protocol(MapsSuggestionsDeduper)]";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Deduper should conform to MapsSuggestionsDeduper protocol";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      v15 = v5;
      v10 = "Deduper:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_17:
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (([(id)objc_opt_class() isEnabled] & 1) == 0)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      v15 = v5;
      v10 = "Deduper:%@ is not enabled. Returning.";
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  dedupers = self->_dedupers;
  if (!dedupers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_dedupers;
    self->_dedupers = v7;

    dedupers = self->_dedupers;
  }
  [(NSMutableArray *)dedupers addObject:v5];
LABEL_20:
}

- (void)_addFilter:(uint64_t)a3 processingType:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
    {
      if ([v5 conformsToProtocol:&unk_1EFC8D080])
      {
        objc_opt_class();
        if (objc_opt_respondsToSelector())
        {
          if ([(id)objc_opt_class() isEnabled])
          {
            if (a3 == 2)
            {
              v7 = *(void **)(a1 + 32);
            }
            else
            {
              if (a3 != 1)
              {
                uint32_t v13 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  int v14 = 136446978;
                  v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
                  __int16 v16 = 1024;
                  int v17 = 73;
                  __int16 v18 = 2082;
                  v19 = "-[MapsSuggestionsSimpleStrategy _filtersForprocessingType:]";
                  __int16 v20 = 2082;
                  v21 = "YES";
                  _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported _ProcessingType!", (uint8_t *)&v14, 0x26u);
                }

                v8 = 0;
                goto LABEL_27;
              }
              v7 = *(void **)(a1 + 8);
            }
            v8 = v7;
LABEL_27:
            [v8 addObject:v6];
            goto LABEL_20;
          }
          v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v14 = 138412290;
            v15 = v6;
            v9 = "Filter:%@ is not enabled. Returning.";
            goto LABEL_18;
          }
        }
        else
        {
          v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v14 = 138412290;
            v15 = v6;
            v9 = "Filter:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_18:
            v10 = v8;
            os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
            uint32_t v12 = 12;
            goto LABEL_19;
          }
        }
LABEL_20:

        goto LABEL_21;
      }
      v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      __int16 v16 = 1024;
      int v17 = 329;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsSimpleStrategy _addFilter:processingType:]";
      __int16 v20 = 2082;
      v21 = "![filter conformsToProtocol:@protocol(MapsSuggestionsFilter)]";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Filter should conform to MapsSuggestionsFilter protocol";
    }
    else
    {
      v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      __int16 v16 = 1024;
      int v17 = 328;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsSimpleStrategy _addFilter:processingType:]";
      __int16 v20 = 2082;
      v21 = "nil == (filter)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a filter";
    }
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 38;
LABEL_19:
    _os_log_impl(&dword_1A70DF000, v10, v11, v9, (uint8_t *)&v14, v12);
    goto LABEL_20;
  }
LABEL_21:
}

- (void)addPreFilter:(id)a3
{
}

- (void)addPostFilter:(id)a3
{
}

- (void)removeFilter:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_preFilters;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v5);
          }
          os_log_type_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint32_t v12 = v11;

            v8 = v12;
          }
        }
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);

      if (v8) {
        [(NSMutableSet *)self->_preFilters removeObject:v8];
      }
    }
    else
    {

      v8 = 0;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint32_t v13 = self->_postFilters;
    uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v14)
    {
      __int16 v16 = v13;
      goto LABEL_28;
    }
    uint64_t v15 = v14;
    __int16 v16 = 0;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v20 = v19;

          __int16 v16 = v20;
        }
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);

    if (v16)
    {
      -[NSMutableSet removeObject:](self->_postFilters, "removeObject:", v16, (void)v21);
LABEL_28:
    }
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      __int16 v33 = 1024;
      int v34 = 358;
      __int16 v35 = 2082;
      v36 = "-[MapsSuggestionsSimpleStrategy removeFilter:]";
      __int16 v37 = 2082;
      v38 = "nil == (filter)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a filter", buf, 0x26u);
    }
  }
}

- (MapsSuggestionsSimpleStrategy)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsSimpleStrategy;
  v2 = [(MapsSuggestionsSimpleStrategy *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    preFilters = v2->_preFilters;
    v2->_preFilters = (NSMutableSet *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    postFilters = v2->_postFilters;
    v2->_postFilters = (NSMutableSet *)v5;
  }
  return v2;
}

- (BOOL)postFiltersKept:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    __int16 v31 = 2080;
    v32 = "post-filtering";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "post-filtering", "", buf, 2u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v8 = self->_postFilters;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint32_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v13, "shouldKeepEntry:", v4, (void)v25) & 1) == 0)
        {
          uint64_t v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            __int16 v18 = [v13 uniqueName];
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            int v19 = s_verbose;
            if (s_verbose)
            {
              __int16 v20 = [v4 serializedBase64String];
            }
            else
            {
              __int16 v20 = &stru_1EFC640F8;
            }
            *(_DWORD *)buf = 138413058;
            v30 = v18;
            __int16 v31 = 2048;
            v32 = (const char *)v4;
            __int16 v33 = 2112;
            int v34 = v20;
            __int16 v35 = 2112;
            id v36 = v4;
            _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v19) {
          }
            }
          long long v21 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            long long v22 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
            *(_DWORD *)buf = 138412546;
            v30 = v22;
            __int16 v31 = 2080;
            v32 = "post-filtering";
            _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
          }
          long long v23 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "post-filtering", "", buf, 2u);
          }

          BOOL v16 = 0;
          goto LABEL_32;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    __int16 v31 = 2080;
    v32 = "post-filtering";
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  GEOFindOrCreateLog();
  objc_super v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(&v8->super.super))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, &v8->super.super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "post-filtering", "", buf, 2u);
  }
  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (BOOL)preFiltersKept:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    __int16 v31 = 2080;
    v32 = "pre-filtering";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", "", buf, 2u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v8 = self->_preFilters;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint32_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v13, "shouldKeepEntry:", v4, (void)v25) & 1) == 0)
        {
          uint64_t v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            __int16 v18 = [v13 uniqueName];
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            int v19 = s_verbose;
            if (s_verbose)
            {
              __int16 v20 = [v4 serializedBase64String];
            }
            else
            {
              __int16 v20 = &stru_1EFC640F8;
            }
            *(_DWORD *)buf = 138413058;
            v30 = v18;
            __int16 v31 = 2048;
            v32 = (const char *)v4;
            __int16 v33 = 2112;
            int v34 = v20;
            __int16 v35 = 2112;
            id v36 = v4;
            _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v19) {
          }
            }
          long long v21 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            long long v22 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
            *(_DWORD *)buf = 138412546;
            v30 = v22;
            __int16 v31 = 2080;
            v32 = "pre-filtering";
            _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
          }
          long long v23 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", "", buf, 2u);
          }

          BOOL v16 = 0;
          goto LABEL_32;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    __int16 v31 = 2080;
    v32 = "pre-filtering";
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  GEOFindOrCreateLog();
  objc_super v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(&v8->super.super))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, &v8->super.super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", "", buf, 2u);
  }
  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (id)topSuggestionsWithSourceEntries:(id)a3 error:(id *)a4
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Requires sourceEntries."];
      id v86 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v86 = 0;
    }
    goto LABEL_153;
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_super v8 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v173 = v8;
    __int16 v174 = 2080;
    v175 = "topSuggestionsWithSourceEntries";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsWithSourceEntries", "", buf, 2u);
  }

  id v123 = v6;
  v111 = self;
  id v103 = v6;
  if (self)
  {
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v173 = v11;
      __int16 v174 = 2080;
      v175 = "_filteredPreviousResults";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    uint32_t v12 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_filteredPreviousResults", "", buf, 2u);
    }

    v109 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_previousResults, "count"));
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    uint32_t v13 = self->_previousResults;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v137 objects:v152 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v138;
      uint64_t v112 = *(void *)v138;
      v114 = v13;
      do
      {
        uint64_t v17 = 0;
        uint64_t v118 = v15;
        do
        {
          if (*(void *)v138 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(char **)(*((void *)&v137 + 1) + 8 * v17);
          if (![(MapsSuggestionsSimpleStrategy *)self preFiltersKept:v18])
          {
            __int16 v37 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v173 = v18;
              uint64_t v38 = v37;
              uint64_t v39 = "DROPPED pre-filtered previous result: %@";
              goto LABEL_39;
            }
LABEL_40:

            goto LABEL_41;
          }
          if (![(MapsSuggestionsSimpleStrategy *)self postFiltersKept:v18])
          {
            __int16 v37 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v173 = v18;
              uint64_t v38 = v37;
              uint64_t v39 = "DROPPED post-filtered previous result: %@";
LABEL_39:
              _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_DEBUG, v39, buf, 0xCu);
            }
            goto LABEL_40;
          }
          int v19 = v18;
          __int16 v20 = (__CFString *)v123;
          long long v21 = v20;
          if (v19)
          {
            long long v147 = 0u;
            long long v148 = 0u;
            long long v145 = 0u;
            long long v146 = 0u;
            long long v22 = v20;
            uint64_t v120 = [v22 countByEnumeratingWithState:&v145 objects:buf count:16];
            if (v120)
            {
              uint64_t v23 = *(void *)v146;
              v108 = v21;
              uint64_t v116 = *(void *)v146;
              do
              {
                uint64_t v24 = 0;
                do
                {
                  if (*(void *)v146 != v23)
                  {
                    uint64_t v25 = v24;
                    objc_enumerationMutation(v22);
                    uint64_t v24 = v25;
                  }
                  uint64_t v122 = v24;
                  long long v26 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v145 + 1) + 8 * v24)];
                  long long v141 = 0u;
                  long long v142 = 0u;
                  long long v143 = 0u;
                  long long v144 = 0u;
                  id v27 = v26;
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v141 objects:&v160 count:16];
                  if (v28)
                  {
                    uint64_t v29 = v28;
                    uint64_t v30 = *(void *)v142;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v29; ++i)
                      {
                        if (*(void *)v142 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        v32 = *(void **)(*((void *)&v141 + 1) + 8 * i);
                        __int16 v33 = [v19 uniqueIdentifier];
                        int v34 = [v32 uniqueIdentifier];
                        char v35 = [v33 isEqualToString:v34];

                        if (v35)
                        {

                          [v109 addObject:v19];
                          self = v111;
                          uint64_t v16 = v112;
                          uint32_t v13 = v114;
                          uint64_t v15 = v118;
                          goto LABEL_41;
                        }
                      }
                      uint64_t v29 = [v27 countByEnumeratingWithState:&v141 objects:&v160 count:16];
                      if (v29) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v24 = v122 + 1;
                  self = v111;
                  uint64_t v16 = v112;
                  uint32_t v13 = v114;
                  uint64_t v23 = v116;
                  uint64_t v15 = v118;
                  long long v21 = v108;
                }
                while (v122 + 1 != v120);
                uint64_t v36 = [v22 countByEnumeratingWithState:&v145 objects:buf count:16];
                uint64_t v23 = v116;
                uint64_t v120 = v36;
              }
              while (v36);
            }
          }
          else
          {
            long long v22 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v164 = 136446978;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
              __int16 v166 = 1024;
              int v167 = 170;
              __int16 v168 = 2082;
              v169 = "-[MapsSuggestionsSimpleStrategy _entry:existsInStorage:]";
              __int16 v170 = 2082;
              v171 = "nil == (entry)";
              _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", v164, 0x26u);
            }
          }

          v40 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v173 = v19;
            _os_log_impl(&dword_1A70DF000, v40, OS_LOG_TYPE_DEBUG, "DROPPED unaccounted previous result: %@", buf, 0xCu);
          }

LABEL_41:
          ++v17;
        }
        while (v17 != v15);
        uint64_t v41 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v137 objects:v152 count:16];
        uint64_t v15 = v41;
      }
      while (v41);
    }

    v42 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v43 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v173 = v43;
      __int16 v174 = 2080;
      v175 = "_filteredPreviousResults";
      _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    v44 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_filteredPreviousResults", "", buf, 2u);
    }

    v45 = v109;
  }
  else
  {
    v45 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  obuint64_t j = v123;
  v110 = v45;
  uint64_t v105 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
  if (!v105) {
    goto LABEL_126;
  }
  uint64_t v104 = *(void *)v134;
  do
  {
    uint64_t v46 = 0;
    do
    {
      if (*(void *)v134 != v104)
      {
        uint64_t v47 = v46;
        objc_enumerationMutation(obj);
        uint64_t v46 = v47;
      }
      uint64_t v107 = v46;
      v119 = *(void **)(*((void *)&v133 + 1) + 8 * v46);
      v48 = objc_msgSend(obj, "objectForKeyedSubscript:");
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v129 objects:v150 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v130;
        v115 = v48;
        uint64_t v117 = *(void *)v130;
        do
        {
          uint64_t v52 = 0;
          uint64_t v121 = v50;
          do
          {
            if (*(void *)v130 != v51) {
              objc_enumerationMutation(v48);
            }
            v53 = *(void **)(*((void *)&v129 + 1) + 8 * v52);
            if (([v45 containsObject:v53] & 1) == 0)
            {
              if (![(MapsSuggestionsSimpleStrategy *)self preFiltersKept:v53])
              {
                -[MapsSuggestionsManager removeEntry:sourceName:](WeakRetained, v53, v119);
                goto LABEL_122;
              }
              uint64_t v124 = v52;
              id v54 = v53;
              if (self)
              {
                v55 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v56 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
                  *(_DWORD *)buf = 138412546;
                  v173 = v56;
                  __int16 v174 = 2080;
                  v175 = "improving";
                  _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
                }
                v57 = GEOFindOrCreateLog();
                if (os_signpost_enabled(v57))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A70DF000, v57, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "improving", "", buf, 2u);
                }

                long long v163 = 0u;
                long long v162 = 0u;
                long long v161 = 0u;
                long long v160 = 0u;
                v58 = self->_improvers;
                uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v160 objects:buf count:16];
                if (v59)
                {
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void *)v161;
                  do
                  {
                    uint64_t v62 = 0;
                    do
                    {
                      if (*(void *)v161 != v61) {
                        objc_enumerationMutation(v58);
                      }
                      v63 = *(void **)(*((void *)&v160 + 1) + 8 * v62);
                      if ([v63 improveEntry:v54])
                      {
                        GEOFindOrCreateLog();
                        v64 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                        {
                          v65 = [v63 uniqueName];
                          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                          }
                          int v66 = s_verbose;
                          if (s_verbose)
                          {
                            v57 = [v54 serializedBase64String];
                            v67 = (__CFString *)v57;
                          }
                          else
                          {
                            v67 = &stru_1EFC640F8;
                          }
                          *(_DWORD *)v152 = 138413058;
                          v153 = v65;
                          __int16 v154 = 2048;
                          v155 = (const char *)v54;
                          __int16 v156 = 2112;
                          v157 = v67;
                          __int16 v158 = 2112;
                          id v159 = v54;
                          _os_log_impl(&dword_1A70DF000, v64, OS_LOG_TYPE_DEBUG, "{MSgDebug} IMPROVED by IMPROVER{%@} {%p:%@}:\n%@", v152, 0x2Au);
                          if (v66) {
                        }
                          }
                      }
                      ++v62;
                    }
                    while (v60 != v62);
                    uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v160 objects:buf count:16];
                  }
                  while (v60);
                }

                v68 = GEOFindOrCreateLog();
                v45 = v110;
                self = v111;
                v48 = v115;
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  v69 = [(MapsSuggestionsSimpleStrategy *)v111 uniqueName];
                  *(_DWORD *)v152 = 138412546;
                  v153 = v69;
                  __int16 v154 = 2080;
                  v155 = "improving";
                  _os_log_impl(&dword_1A70DF000, v68, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v152, 0x16u);
                }
                v70 = GEOFindOrCreateLog();
                if (os_signpost_enabled(v70))
                {
                  *(_WORD *)v152 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A70DF000, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "improving", "", v152, 2u);
                }
              }
              if ([v45 containsObject:v54]) {
                goto LABEL_121;
              }
              v71 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                v72 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
                *(_DWORD *)buf = 138412546;
                v173 = v72;
                __int16 v174 = 2080;
                v175 = "deduping";
                _os_log_impl(&dword_1A70DF000, v71, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
              }
              v73 = GEOFindOrCreateLog();
              if (os_signpost_enabled(v73))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A70DF000, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deduping", "", buf, 2u);
              }

              int v74 = -[MapsSuggestionsSimpleStrategy _dedupeByEnrichingEntries:withEntry:]((uint64_t)self, v45, v54);
              v75 = GEOFindOrCreateLog();
              BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG);
              if (!v74)
              {
                if (v76)
                {
                  v79 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
                  *(_DWORD *)buf = 138412546;
                  v173 = v79;
                  __int16 v174 = 2080;
                  v175 = "deduping";
                  _os_log_impl(&dword_1A70DF000, v75, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
                }
                v80 = GEOFindOrCreateLog();
                if (os_signpost_enabled(v80))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A70DF000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deduping", "", buf, 2u);
                }

                GEOFindOrCreateLog();
                v81 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                {
                  v82 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
                  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                  }
                  int v83 = s_verbose;
                  if (s_verbose)
                  {
                    v108 = [v54 serializedBase64String];
                    v84 = v108;
                  }
                  else
                  {
                    v84 = &stru_1EFC640F8;
                  }
                  *(_DWORD *)buf = 136316162;
                  v173 = "KEPT";
                  __int16 v174 = 2112;
                  v175 = v82;
                  __int16 v176 = 2048;
                  id v177 = v54;
                  __int16 v178 = 2112;
                  v179 = v84;
                  __int16 v180 = 2112;
                  id v181 = v54;
                  _os_log_impl(&dword_1A70DF000, v81, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
                  if (v83) {
                }
                  }
                [v45 addObject:v54];
LABEL_121:
                uint64_t v51 = v117;
                uint64_t v50 = v121;
                uint64_t v52 = v124;
                goto LABEL_122;
              }
              if (v76)
              {
                v77 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
                *(_DWORD *)buf = 138412546;
                v173 = v77;
                __int16 v174 = 2080;
                v175 = "deduping";
                _os_log_impl(&dword_1A70DF000, v75, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
              }
              v78 = GEOFindOrCreateLog();
              uint64_t v51 = v117;
              uint64_t v50 = v121;
              uint64_t v52 = v124;
              if (os_signpost_enabled(v78))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A70DF000, v78, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deduping", "", buf, 2u);
              }
            }
LABEL_122:
            ++v52;
          }
          while (v52 != v50);
          uint64_t v50 = [v48 countByEnumeratingWithState:&v129 objects:v150 count:16];
        }
        while (v50);
      }

      uint64_t v46 = v107 + 1;
    }
    while (v107 + 1 != v105);
    uint64_t v105 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
  }
  while (v105);
LABEL_126:

  id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v86 = v45;
  uint64_t v87 = [v86 countByEnumeratingWithState:&v125 objects:v149 count:16];
  if (!v87) {
    goto LABEL_137;
  }
  uint64_t v88 = v87;
  uint64_t v89 = *(void *)v126;
  while (2)
  {
    uint64_t v90 = 0;
    while (2)
    {
      if (*(void *)v126 != v89) {
        objc_enumerationMutation(v86);
      }
      v91 = *(void **)(*((void *)&v125 + 1) + 8 * v90);
      if ([v91 deleted])
      {
LABEL_134:
        [v85 addObject:v91];
      }
      else if (![(MapsSuggestionsSimpleStrategy *)self postFiltersKept:v91])
      {
        v92 = [v91 originatingSourceName];
        -[MapsSuggestionsManager removeEntry:sourceName:](WeakRetained, v91, v92);

        goto LABEL_134;
      }
      if (v88 != ++v90) {
        continue;
      }
      break;
    }
    uint64_t v88 = [v86 countByEnumeratingWithState:&v125 objects:v149 count:16];
    if (v88) {
      continue;
    }
    break;
  }
LABEL_137:

  [v86 removeObjectsInArray:v85];
  v93 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    v94 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v173 = v94;
    __int16 v174 = 2080;
    v175 = "sorting";
    _os_log_impl(&dword_1A70DF000, v93, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v95 = GEOFindOrCreateLog();
  id v6 = v103;
  if (os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v95, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "sorting", "", buf, 2u);
  }

  [v86 sortUsingComparator:&__block_literal_global_28];
  v96 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    v97 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v173 = v97;
    __int16 v174 = 2080;
    v175 = "sorting";
    _os_log_impl(&dword_1A70DF000, v96, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  v98 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v98))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v98, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "sorting", "", buf, 2u);
  }

  objc_storeStrong((id *)&self->_previousResults, v110);
  v99 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    v100 = [(MapsSuggestionsSimpleStrategy *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v173 = v100;
    __int16 v174 = 2080;
    v175 = "topSuggestionsWithSourceEntries";
    _os_log_impl(&dword_1A70DF000, v99, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  v101 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsWithSourceEntries", "", buf, 2u);
  }

LABEL_153:
  return v86;
}

- (uint64_t)_dedupeByEnrichingEntries:(void *)a3 withEntry:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v7 = (id)[v5 copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      v32 = v5;
      uint64_t v33 = a1;
      int v34 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          if (v12 != v6)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v13 = *(id *)(a1 + 24);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v51 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v36;
              while (2)
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v36 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  __int16 v18 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  if ([v18 dedupeByEnrichingEntry:v12 withEntry:v6])
                  {
                    __int16 v20 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      long long v21 = [v18 uniqueName];
                      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                      }
                      int v22 = s_verbose;
                      if (s_verbose)
                      {
                        uint64_t v23 = [v6 serializedBase64String];
                      }
                      else
                      {
                        uint64_t v23 = &stru_1EFC640F8;
                      }
                      *(_DWORD *)buf = 138413058;
                      v44 = v21;
                      __int16 v45 = 2048;
                      id v46 = v6;
                      __int16 v47 = 2112;
                      v48 = v23;
                      __int16 v49 = 2112;
                      id v50 = v6;
                      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} DUPED by DEDUPER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                      if (v22) {
                    }
                      }
                    uint64_t v24 = GEOFindOrCreateLog();
                    id v5 = v32;
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v25 = [v18 uniqueName];
                      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                      }
                      int v26 = s_verbose;
                      if (s_verbose)
                      {
                        id v27 = [v12 serializedBase64String];
                      }
                      else
                      {
                        id v27 = &stru_1EFC640F8;
                      }
                      *(_DWORD *)buf = 138413058;
                      v44 = v25;
                      __int16 v45 = 2048;
                      id v46 = v12;
                      __int16 v47 = 2112;
                      v48 = v27;
                      __int16 v49 = 2112;
                      id v50 = v12;
                      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} ENRICHED by DEDUPER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                      if (v26) {
                    }
                      }
                    id WeakRetained = objc_loadWeakRetained((id *)(v33 + 48));
                    [WeakRetained removeEntry:v6];

                    [v32 removeObjectIdenticalTo:v6];
                    if ((unint64_t)[v32 count] >= 2)
                    {
                      uint64_t v29 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "Calling recursive _dedupeByEnrichingEntries", buf, 2u);
                      }

                      -[MapsSuggestionsSimpleStrategy _dedupeByEnrichingEntries:withEntry:](v33, v32, v12);
                    }
                    uint64_t v30 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "Returning YES from Deduping", buf, 2u);
                    }

                    a1 = 1;
                    uint64_t v7 = v34;
                    int v19 = v34;
                    goto LABEL_47;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v51 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            a1 = v33;
            uint64_t v7 = v34;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v52 count:16];
        id v5 = v32;
      }
      while (v9);
    }

    int v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Returning NO from Deduping", buf, 2u);
    }
    a1 = 0;
LABEL_47:
  }
  return a1;
}

- (void)clearData
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "CLEAR data", v5, 2u);
  }

  previousResults = self->_previousResults;
  self->_previousResults = 0;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

uint64_t __71__MapsSuggestionsSimpleStrategy_topSuggestionsWithSourceEntries_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 weight];
  double v7 = v6;
  [v5 weight];
  if (v7 >= v8)
  {
    [v4 weight];
    double v11 = v10;
    [v5 weight];
    if (v11 <= v12)
    {
      id v13 = [v4 numberForKey:@"MapsSuggestionsOriginalPositionKey"];
      uint64_t v14 = [v5 numberForKey:@"MapsSuggestionsOriginalPositionKey"];
      uint64_t v15 = (void *)v14;
      if (v13 && v14)
      {
        uint64_t v9 = [v13 compare:v14];
      }
      else
      {
        uint64_t v16 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        uint64_t v17 = [v5 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        __int16 v18 = (void *)v17;
        uint64_t v9 = 0;
        if (v16 && v17) {
          uint64_t v9 = [v16 compare:v17];
        }
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)removeAllFilters
{
  [(NSMutableSet *)self->_preFilters removeAllObjects];
  postFilters = self->_postFilters;
  [(NSMutableSet *)postFilters removeAllObjects];
}

- (void)removeAllImprovers
{
  [(NSMutableArray *)self->_improvers removeAllObjects];
  improvers = self->_improvers;
  self->_improvers = 0;
}

- (void)removeAllDedupers
{
  [(NSMutableArray *)self->_dedupers removeAllObjects];
  dedupers = self->_dedupers;
  self->_dedupers = 0;
}

- (MapsSuggestionsManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (MapsSuggestionsManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_previousResults, 0);
  objc_storeStrong((id *)&self->_postFilters, 0);
  objc_storeStrong((id *)&self->_dedupers, 0);
  objc_storeStrong((id *)&self->_improvers, 0);
  objc_storeStrong((id *)&self->_preFilters, 0);
}

@end