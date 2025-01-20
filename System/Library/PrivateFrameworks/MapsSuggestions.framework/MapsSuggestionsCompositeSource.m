@interface MapsSuggestionsCompositeSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)addChildSource:(id)a3;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeChildSource:(id)a3;
- (BOOL)running;
- (MapsSuggestionsCompositeSource)initWithDelegate:(id)a3 name:(id)a4;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)_updateChildSource:(void *)a3 handler:;
- (double)test_suppressionDurationForBehavior:(int64_t)a3 type:(int64_t)a4;
- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id).cxx_construct;
- (id)children;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (id)sources;
- (id)test_dateUntilSuppressedEntry:(id)a3;
- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4;
- (void)_initUpdateTimerIfNecessary;
- (void)_scheduleNextUpdateChildSourcesWithin:(uint64_t)a1;
- (void)_stopUpdateChildSources;
- (void)_updateChildSourcesForceAll:(void *)a3 handler:;
- (void)dealloc;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)test_awaitQueue;
- (void)test_resetSuppressions;
- (void)test_sync;
@end

@implementation MapsSuggestionsCompositeSource

- (MapsSuggestionsCompositeSource)initWithDelegate:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsCompositeSource;
  v8 = [(MapsSuggestionsBaseSource *)&v25 initWithDelegate:v6 name:v7];
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sources = v8->_sources;
    v8->_sources = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nextUpdateTimes = v8->_nextUpdateTimes;
    v8->_nextUpdateTimes = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v23, @"MapsSuggestionsCompositeSourceQueue", v13);
    dispatch_queue_t v14 = v23;
    dispatch_queue_t v23 = 0;
    innerQueue = v8->_queue._innerQueue;
    v8->_queue._innerQueue = (OS_dispatch_queue *)v14;

    v16 = v24;
    v24 = 0;
    name = v8->_queue._name;
    v8->_queue._name = v16;

    v18 = objc_alloc_init(MapsSuggestionsSuppressor);
    suppressor = v8->_suppressor;
    v8->_suppressor = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hasStarted = v8->_hasStarted;
    v8->_hasStarted = v20;
  }
  return v8;
}

- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  v18 = (char *)a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v25 = v18;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "passing on addOrUpdateSuggestionEntries for SOURCE{%@}", buf, 0xCu);
  }

  if (v17)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v17;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (-[MapsSuggestionsSuppressor isSuppressedEntry:](self->_suppressor, "isSuppressedEntry:", v11, v17))
          {
            [v11 setBoolean:1 forKey:@"MapsSuggestionsIsSuppressedKey"];
            GEOFindOrCreateLog();
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v13 = [v11 uniqueIdentifier];
              *(_DWORD *)buf = 138412290;
              objc_super v25 = v13;
              _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "isSuppressedEntry returned YES for %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    dispatch_queue_t v14 = [(MapsSuggestionsBaseSource *)self delegate];
    unint64_t v15 = [v14 addOrUpdateSuggestionEntries:v7 source:v18];
  }
  else
  {
    dispatch_queue_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      objc_super v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v26 = 1024;
      int v27 = 684;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsCompositeSource addOrUpdateSuggestionEntries:source:]";
      __int16 v30 = 2082;
      v31 = "nil == (entries)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries", buf, 0x26u);
    }
    unint64_t v15 = 0;
  }

  return v15;
}

- (void)_updateChildSourcesForceAll:(void *)a3 handler:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v52 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    v68 = v6;
    __int16 v69 = 2080;
    *(void *)v70 = "_updateChildSourcesForceAll";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", "", buf, 2u);
  }

  uint64_t v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "NO";
    if (a2) {
      uint64_t v9 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v68 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Forcing all? %s", buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 80))
  {
    GEOConfigGetDouble();
    double v11 = v10;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    group = dispatch_group_create();
    v54 = v12;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = *(id *)(a1 + 24);
    uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (!v13) {
      goto LABEL_45;
    }
    uint64_t v14 = *(void *)v63;
    if (v52) {
      unint64_t v15 = "with";
    }
    else {
      unint64_t v15 = "without";
    }
    v53 = v15;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ((a2 & 1) == 0)
        {
          id v24 = v17;
          if (!v24)
          {
            int v27 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
              __int16 v69 = 1024;
              *(_DWORD *)v70 = 43;
              *(_WORD *)&v70[4] = 2082;
              *(void *)&v70[6] = "-[MapsSuggestionsCompositeSource _shouldUpdateSource:]";
              __int16 v71 = 2082;
              v72 = "nil == (source)";
              _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
            }
            goto LABEL_42;
          }
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
          objc_super v25 = *(void **)(a1 + 32);
          __int16 v26 = [v24 uniqueName];
          int v27 = [v25 objectForKeyedSubscript:v26];

          if (!v27)
          {
            GEOFindOrCreateLog();
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              v36 = [v24 uniqueName];
              *(_DWORD *)buf = 138412290;
              v68 = v36;
              _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, "SOURCE{%@} skip: lacking nextUpdateTime", buf, 0xCu);
            }
LABEL_41:

LABEL_42:
            continue;
          }
          if (!MapsSuggestionsIsInThePast(v27))
          {
            GEOFindOrCreateLog();
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              v37 = [v24 uniqueName];
              *(_DWORD *)buf = 138412290;
              v68 = v37;
              _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, "SOURCE{%@} skip: too early", buf, 0xCu);
            }
            goto LABEL_41;
          }
        }
        id v18 = v57;
        objc_sync_enter(v18);
        long long v19 = [v17 uniqueName];
        long long v20 = [v18 objectForKey:v19];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          __int16 v28 = [v17 uniqueName];
          [v18 setValue:&unk_1EFC89858 forKey:v28];

          objc_sync_exit(v18);
          dispatch_group_enter(group);
          GEOFindOrCreateLog();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            __int16 v30 = [v17 uniqueName];
            *(_DWORD *)buf = 138412546;
            v68 = v30;
            __int16 v69 = 2080;
            *(void *)v70 = v53;
            _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "_updateChildSourcesForceAll: SOURCE{%@} %s handler", buf, 0x16u);
          }
          v31 = v54;
          objc_sync_enter(v31);
          uint64_t v32 = [v17 uniqueName];
          [v31 addObject:v32];

          objc_sync_exit(v31);
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __70__MapsSuggestionsCompositeSource__updateChildSourcesForceAll_handler___block_invoke;
          v58[3] = &unk_1E5CB9AC0;
          v58[4] = v17;
          v59 = v31;
          id v60 = v18;
          v61 = group;
          double v33 = -[MapsSuggestionsCompositeSource _updateChildSource:handler:](a1, v17, v58);
          if (v33 >= v11) {
            double v34 = v11;
          }
          else {
            double v34 = v33;
          }
          if (v33 != 0.0) {
            double v11 = v34;
          }
        }
        else
        {
          GEOFindOrCreateLog();
          long long v22 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            dispatch_queue_t v23 = [v17 uniqueName];
            *(_DWORD *)buf = 138412290;
            v68 = v23;
            _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "_updateChildSourcesForceAll: SOURCE{%@} has already been added", buf, 0xCu);
          }
          objc_sync_exit(v18);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (!v13)
      {
LABEL_45:

        -[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:](a1, v11);
        if (_MergedGlobals_1 != -1) {
          dispatch_once(&_MergedGlobals_1, &__block_literal_global_329);
        }
        dispatch_time_t v38 = dispatch_time(0, qword_1EB6F00C0);
        if (dispatch_group_wait(group, v38))
        {
          if (v52) {
            v52[2]();
          }
          GEOFindOrCreateLog();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v40 = [(id)a1 uniqueName];
            *(_DWORD *)buf = 138412546;
            v68 = v40;
            __int16 v69 = 2080;
            *(void *)v70 = "_updateChildSourcesForceAll";
            _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
          }
          v41 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v41))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", "", buf, 2u);
          }

          v42 = v54;
          objc_sync_enter(v42);
          GEOFindOrCreateLog();
          v43 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = [v42 allObjects];
            v45 = [v44 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138543362;
            v68 = v45;
            _os_log_impl(&dword_1A70DF000, v43, OS_LOG_TYPE_ERROR, "Not all Sources called back in time: {%{public}@}", buf, 0xCu);
          }
          objc_sync_exit(v42);
        }
        else
        {
          if (v52) {
            v52[2]();
          }
          GEOFindOrCreateLog();
          v50 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v51 = [(id)a1 uniqueName];
            *(_DWORD *)buf = 138412546;
            v68 = v51;
            __int16 v69 = 2080;
            *(void *)v70 = "_updateChildSourcesForceAll";
            _os_log_impl(&dword_1A70DF000, v50, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
          }
          v42 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v42))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", "", buf, 2u);
          }
        }

        v49 = v54;
        goto LABEL_72;
      }
    }
  }
  v46 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_DEBUG, "Shortcutting. We should not be updating when stopped.", buf, 2u);
  }

  if (v52) {
    v52[2]();
  }
  GEOFindOrCreateLog();
  v47 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v48 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    v68 = v48;
    __int16 v69 = 2080;
    *(void *)v70 = "_updateChildSourcesForceAll";
    _os_log_impl(&dword_1A70DF000, v47, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
  }
  v49 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v49, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", "", buf, 2u);
  }
LABEL_72:
}

- (double)_updateChildSource:(void *)a3 handler:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    double v11 = GEOFindOrCreateLog();
    double v10 = 0.0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v17 = 1024;
      int v18 = 176;
      __int16 v19 = 2082;
      long long v20 = "-[MapsSuggestionsCompositeSource _updateChildSource:handler:]";
      __int16 v21 = 2082;
      long long v22 = "nil == (source)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_8;
  }
  GEOFindOrCreateLog();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v5 uniqueName];
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "SOURCE{%@} update", (uint8_t *)&v15, 0xCu);
  }
  [v5 updateSuggestionEntriesWithHandler:v6];
  double v10 = v9;
  if (v9 != 0.0)
  {
    double v11 = MapsSuggestionsNowWithOffset(v9);
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v5 uniqueName];
    [v12 setObject:v11 forKeyedSubscript:v13];

LABEL_8:
  }

  return v10;
}

void __70__MapsSuggestionsCompositeSource__updateChildSourcesForceAll_handler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = [*(id *)(a1 + 32) uniqueName];
    int v19 = 138412290;
    long long v20 = v3;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_updateChildSourcesForceAll: SOURCE{%@} responded", (uint8_t *)&v19, 0xCu);
  }
  id v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) uniqueName];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) uniqueName];
      int v19 = 138412290;
      long long v20 = v8;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "❌ Missing Source: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  double v9 = *(void **)(a1 + 40);
  double v10 = [*(id *)(a1 + 32) uniqueName];
  [v9 removeObject:v10];

  objc_sync_exit(v4);
  id v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 32) uniqueName];
  uint64_t v14 = [v12 objectForKey:v13];
  LODWORD(v12) = v14 == 0;

  if (v12)
  {
    GEOFindOrCreateLog();
    __int16 v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v18 = [*(id *)(a1 + 32) uniqueName];
      int v19 = 138412290;
      long long v20 = v18;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_FAULT, "❌ SOURCE{%@} has already called back", (uint8_t *)&v19, 0xCu);
    }
    objc_sync_exit(v11);
  }
  else
  {
    int v15 = *(void **)(a1 + 48);
    v16 = [*(id *)(a1 + 32) uniqueName];
    [v15 setValue:0 forKey:v16];

    objc_sync_exit(v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)buf, 2u);
  }

  [(MapsSuggestionsSuppressor *)self->_suppressor purge];
  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MapsSuggestionsCompositeSource_start__block_invoke;
  block[3] = &unk_1E5CB7E78;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __39__MapsSuggestionsCompositeSource_start__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[5]);
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "_startUpdateChildSources", buf, 2u);
    }

    *(unsigned char *)(v2 + 80) = 1;
    -[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary]((dispatch_queue_t *)v2);
    [*(id *)(v2 + 32) removeAllObjects];
    GEOConfigGetDouble();
    double v5 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = *(id *)(v2 + 24);
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          GEOFindOrCreateLog();
          double v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [v9 uniqueName];
            *(_DWORD *)objc_super v25 = 138412290;
            __int16 v26 = v11;
            _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "SOURCE{%@} start", v25, 0xCu);
          }
          uint64_t v12 = *(void **)(v2 + 72);
          uint64_t v13 = [v9 uniqueName];
          uint64_t v14 = [v12 objectForKeyedSubscript:v13];
          char v15 = [v14 BOOLValue];

          if ((v15 & 1) == 0)
          {
            [v9 start];
            v16 = *(void **)(v2 + 72);
            __int16 v17 = [v9 uniqueName];
            [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v17];
          }
          if ([(id)objc_opt_class() disposition] == 1)
          {
            double v18 = -[MapsSuggestionsCompositeSource _updateChildSource:handler:](v2, v9, 0);
            if (v18 != 0.0 && v18 < v5) {
              double v5 = v18;
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:buf count:16];
      }
      while (v6);
    }

    -[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:](v2, v5);
  }
  else
  {
    GEOFindOrCreateLog();
    int v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v28 = "MapsSuggestionsCompositeSource.mm";
      __int16 v29 = 1026;
      int v30 = 382;
      __int16 v31 = 2082;
      uint64_t v32 = "-[MapsSuggestionsCompositeSource start]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_scheduleNextUpdateChildSourcesWithin:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  double v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134217984;
    double v9 = *(const char **)&a2;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "_scheduleNextUpdateChildSourcesWithin:%0.3f", (uint8_t *)&v8, 0xCu);
  }

  if (*(unsigned char *)(a1 + 80))
  {
    -[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary]((dispatch_queue_t *)a1);
    double v5 = *(NSObject **)(a1 + 56);
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      double v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v10 = 1024;
      int v11 = 133;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:]";
      __int16 v14 = 2082;
      char v15 = "NO == _running";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This should not be called unless we're running", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)_initUpdateTimerIfNecessary
{
  dispatch_assert_queue_V2(a1[5]);
  if (!a1[7])
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Re-initializing the _updateTimer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    v3 = a1[5];
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
    dispatch_queue_t v5 = a1[7];
    a1[7] = v4;

    dispatch_source_set_timer(a1[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_time_t v6 = a1[7];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__MapsSuggestionsCompositeSource__initUpdateTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v8, buf);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(a1[7]);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (BOOL)addChildSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    dispatch_queue_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      dispatch_time_t v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "addChildSource:SOURCE{%@}", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__MapsSuggestionsCompositeSource_addChildSource___block_invoke;
    v9[3] = &unk_1E5CB85B8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v14 = 1024;
      int v15 = 711;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsCompositeSource addChildSource:]";
      __int16 v18 = 2082;
      int v19 = "nil == (source)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
    }
  }
  return v4 != 0;
}

void __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke(uint64_t a1)
{
}

void __49__MapsSuggestionsCompositeSource_addChildSource___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setDelegate:v3];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      dispatch_time_t v6 = "MapsSuggestionsCompositeSource.mm";
      __int16 v7 = 1026;
      int v8 = 716;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsCompositeSource addChildSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __69__MapsSuggestionsCompositeSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [WeakRetained uniqueName];
      int v5 = NSStringFromMapsSuggestionsCurrentBestLocation();
      int v7 = 138412802;
      int v8 = v4;
      __int16 v9 = 2112;
      *(void *)id v10 = @"ALL";
      *(_WORD *)&v10[8] = 2112;
      *(void *)&v10[10] = v5;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", (uint8_t *)&v7, 0x20u);
    }
    -[MapsSuggestionsCompositeSource _updateChildSourcesForceAll:handler:]((uint64_t)WeakRetained, 1, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_time_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsCompositeSource.mm";
      __int16 v9 = 1026;
      *(_DWORD *)id v10 = 402;
      *(_WORD *)&v10[4] = 2082;
      *(void *)&v10[6] = "-[MapsSuggestionsCompositeSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  dispatch_time_t v6 = (void (**)(void))a4;
  if (a3)
  {
    if ([(MapsSuggestionsCompositeSource *)self canProduceEntriesOfType:a3])
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __72__MapsSuggestionsCompositeSource_updateSuggestionEntriesOfType_handler___block_invoke;
      v10[3] = &unk_1E5CB9AE8;
      objc_copyWeak(v12, &location);
      v12[1] = (id)a3;
      uint64_t v11 = v6;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v10);

      objc_destroyWeak(v12);
      objc_destroyWeak(&location);
      double v7 = 0.0;
    }
    else
    {
      double v7 = 0.0;
      if (v6) {
        v6[2](v6);
      }
    }
  }
  else
  {
    [(MapsSuggestionsCompositeSource *)self updateSuggestionEntriesWithHandler:v6];
    double v7 = v8;
  }

  return v7;
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsCompositeSource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E5CB84F0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  innerQueue = self->_queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 0.0;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MapsSuggestionsCompositeSource_canProduceEntriesOfType___block_invoke;
  v4[3] = &unk_1E5CB9B10;
  v4[4] = self;
  v4[5] = a3;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v4);
}

void __72__MapsSuggestionsCompositeSource_updateSuggestionEntriesOfType_handler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = [WeakRetained uniqueName];
      id v4 = NSStringFromMapsSuggestionsEntryType(*(void *)(a1 + 48));
      int v5 = NSStringFromMapsSuggestionsCurrentBestLocation();
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v3;
      __int16 v30 = 2112;
      *(void *)__int16 v31 = v4;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v5;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    __int16 v18 = (void (**)(void))*(id *)(a1 + 32);
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 5));
    if (*((unsigned char *)WeakRetained + 80))
    {
      double v7 = dispatch_group_create();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = *((id *)WeakRetained + 3);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:buf count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v8);
            }
            __int16 v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v12 canProduceEntriesOfType:v6])
            {
              dispatch_group_enter(v7);
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke;
              v22[3] = &unk_1E5CB85E0;
              long long v23 = v7;
              -[MapsSuggestionsCompositeSource _updateChildSource:handler:]((uint64_t)WeakRetained, v12, v22);
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:buf count:16];
        }
        while (v9);
      }

      uint64_t v13 = *((void *)WeakRetained + 5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke_2;
      block[3] = &unk_1E5CB8EA0;
      void block[4] = WeakRetained;
      long long v21 = v18;
      dispatch_group_notify(v7, v13, block);
    }
    else
    {
      int v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Shortcutting. We should not be updating when stopped.", buf, 2u);
      }

      if (v18) {
        v18[2]();
      }
      GEOFindOrCreateLog();
      __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v17 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        __int16 v29 = v17;
        __int16 v30 = 2080;
        *(void *)__int16 v31 = "_updateChildSourcesForType";
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      double v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForType", "", buf, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v29 = "MapsSuggestionsCompositeSource.mm";
      __int16 v30 = 1026;
      *(_DWORD *)__int16 v31 = 425;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsCompositeSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

uint64_t __58__MapsSuggestionsCompositeSource_canProduceEntriesOfType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "canProduceEntriesOfType:", *(void *)(a1 + 40), (void)v8))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

void __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  GEOFindOrCreateLog();
  uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(a1 + 32) uniqueName];
    int v6 = 138412546;
    double v7 = v4;
    __int16 v8 = 2080;
    long long v9 = "_updateChildSourcesForType";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForType", "", (uint8_t *)&v6, 2u);
  }
}

void __38__MapsSuggestionsCompositeSource_stop__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsCompositeSource _stopUpdateChildSources]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsCompositeSource.mm";
      __int16 v6 = 1026;
      int v7 = 393;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsCompositeSource stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)stop
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "stop", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MapsSuggestionsCompositeSource_stop__block_invoke;
  block[3] = &unk_1E5CB7E78;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)_stopUpdateChildSources
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(unsigned char *)(a1 + 80) = 0;
    uint64_t v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
      uint64_t v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id obj = *(id *)(a1 + 24);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v18 != v5) {
              objc_enumerationMutation(obj);
            }
            int v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            GEOFindOrCreateLog();
            __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              long long v9 = [v7 uniqueName];
              *(_DWORD *)buf = 138412290;
              long long v22 = v9;
              _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "SOURCE{%@} stop", buf, 0xCu);
            }
            uint64_t v10 = *(void **)(a1 + 72);
            long long v11 = [v7 uniqueName];
            __int16 v12 = [v10 objectForKeyedSubscript:v11];
            int v13 = [v12 BOOLValue];

            if (v13)
            {
              [v7 stop];
              __int16 v14 = *(void **)(a1 + 72);
              int v15 = [v7 uniqueName];
              [v14 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v15];
            }
          }
          uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v4);
      }
    }
  }
}

+ (unint64_t)disposition
{
  return 2;
}

void __61__MapsSuggestionsCompositeSource__initUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsCompositeSource _updateChildSourcesForceAll:handler:]((uint64_t)WeakRetained, 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsCompositeSource.mm";
      __int16 v6 = 1026;
      int v7 = 81;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v16 = 1024;
      int v17 = 324;
      __int16 v18 = 2082;
      long long v19 = "-[MapsSuggestionsCompositeSource initFromResourceDepot:name:]";
      __int16 v20 = 2082;
      long long v21 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_11;
  }
  __int16 v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v16 = 1024;
      int v17 = 325;
      __int16 v18 = 2082;
      long long v19 = "-[MapsSuggestionsCompositeSource initFromResourceDepot:name:]";
      __int16 v20 = 2082;
      long long v21 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v14, 0x26u);
    }
LABEL_11:

    long long v11 = 0;
    goto LABEL_12;
  }
  long long v9 = [v6 oneSourceDelegate];
  uint64_t v10 = [(MapsSuggestionsCompositeSource *)self initWithDelegate:v9 name:v7];

  if (v10) {
    [v6 setOneSourceDelegate:v10];
  }
  self = v10;
  long long v11 = self;
LABEL_12:

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[MapsSuggestionsCompositeSource _stopUpdateChildSources]((uint64_t)self);
  [(NSMutableSet *)self->_sources removeAllObjects];
  sources = self->_sources;
  self->_sources = 0;

  nextUpdateTimes = self->_nextUpdateTimes;
  self->_nextUpdateTimes = 0;

  if (self->_updateTimer)
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v9 = 1024;
      int v10 = 369;
      __int16 v11 = 2082;
      __int16 v12 = "-[MapsSuggestionsCompositeSource dealloc]";
      __int16 v13 = 2082;
      int v14 = "_updateTimer != nil";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The timer is still there. Are you sure -stop was called before?", buf, 0x26u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsCompositeSource;
  [(MapsSuggestionsCompositeSource *)&v6 dealloc];
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 578;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 579;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handle cannot be nil", buf, 0x26u);
    }
LABEL_11:

    char v14 = 0;
    goto LABEL_12;
  }
  int v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__MapsSuggestionsCompositeSource_removeEntry_behavior_handler___block_invoke;
  v17[3] = &unk_1E5CB9B38;
  int64_t v20 = a4;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  __int16 v11 = v17;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  innerQueue = self->_queue._innerQueue;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZNK3MSg5Queue4syncI18MSgCallbackPromiseEET_U13block_pointerFS3_vE_block_invoke;
  *(void *)&buf[24] = &unk_1E5CB7EC8;
  *(void *)&buf[32] = v11;
  long long v26 = &v21;
  __int16 v13 = v11;
  dispatch_sync(innerQueue, buf);
  char v14 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
LABEL_12:

  return v14;
}

uint64_t __63__MapsSuggestionsCompositeSource_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    BOOL v2 = (*(void *)(a1 + 56) & 3) == 0;
    uint64_t v3 = GEOFindOrCreateLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "About to suppress entry with Delete/Forget in all sources", buf, 2u);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = *(id *)(*(void *)(a1 + 32) + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "removeEntry:behavior:handler:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48), (void)v20);
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }

      return 1;
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "About to suppress entry with Hide/Snooze", buf, 2u);
      }

      uint64_t v5 = *(void *)(a1 + 56);
      objc_super v6 = *(void **)(*(void *)(a1 + 32) + 64);
      id v7 = *(id *)(a1 + 40);
      id v8 = v7;
      if ((v5 & 1) == 0)
      {
        double v9 = 0.0;
        switch([v7 type])
        {
          case 0:
            goto LABEL_28;
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
            goto LABEL_27;
          default:
            int v17 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = 136446978;
            long long v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
            __int16 v27 = 1024;
            int v28 = 563;
            __int16 v29 = 2082;
            __int16 v30 = "NSTimeInterval _hideTimeForEntryType(MapsSuggestionsEntryType)";
            __int16 v31 = 2082;
            uint64_t v32 = "YES";
            goto LABEL_25;
        }
      }
      double v9 = 0.0;
      switch([v7 type])
      {
        case 0:
          break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
LABEL_27:
          GEOConfigGetDouble();
          double v9 = v18;
          break;
        default:
          int v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            long long v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
            __int16 v27 = 1024;
            int v28 = 504;
            __int16 v29 = 2082;
            __int16 v30 = "NSTimeInterval _snoozeTimeForEntryType(MapsSuggestionsEntryType)";
            __int16 v31 = 2082;
            uint64_t v32 = "YES";
LABEL_25:
            _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", buf, 0x26u);
          }
LABEL_26:

          double v9 = 0.0;
          break;
      }
LABEL_28:

      uint64_t v12 = [v6 suppressEntry:v8 forTime:v9];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromMapsSuggestionsRemovalBehavior(*(void *)(a1 + 56));
      __int16 v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      long long v26 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_INFO, "Cannot suppress entry because removal behavior is %@", buf, 0xCu);
    }
    return 0;
  }
  return v12;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "About to send feedback to all sources", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__MapsSuggestionsCompositeSource_feedbackForEntry_action___block_invoke;
      block[3] = &unk_1E5CB7E50;
      objc_copyWeak(v14, (id *)buf);
      id v13 = v6;
      v14[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      int v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        __int16 v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        __int16 v16 = v11;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);
      }
    }
  }
  else
  {
    double v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v17 = 1024;
      int v18 = 618;
      __int16 v19 = 2082;
      long long v20 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]";
      __int16 v21 = 2082;
      long long v22 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
  }
}

void __58__MapsSuggestionsCompositeSource_feedbackForEntry_action___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v4 = WeakRetained[3];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "feedbackForEntry:action:", *(void *)(a1 + 32), *(void *)(a1 + 48), (void)v8);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v14 = "MapsSuggestionsCompositeSource.mm";
      __int16 v15 = 1026;
      int v16 = 629;
      __int16 v17 = 2082;
      int v18 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__MapsSuggestionsCompositeSource_feedbackForMapItem_action___block_invoke;
      block[3] = &unk_1E5CB7E50;
      objc_copyWeak(v13, (id *)buf);
      id v12 = v6;
      v13[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      long long v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        long long v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        __int16 v15 = v10;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v16 = 1024;
      int v17 = 640;
      __int16 v18 = 2082;
      uint64_t v19 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]";
      __int16 v20 = 2082;
      __int16 v21 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", buf, 0x26u);
    }
  }
}

void __60__MapsSuggestionsCompositeSource_feedbackForMapItem_action___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v4 = WeakRetained[3];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "feedbackForMapItem:action:", *(void *)(a1 + 32), *(void *)(a1 + 48), (void)v8);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v14 = "MapsSuggestionsCompositeSource.mm";
      __int16 v15 = 1026;
      int v16 = 649;
      __int16 v17 = 2082;
      __int16 v18 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__MapsSuggestionsCompositeSource_feedbackForContact_action___block_invoke;
      block[3] = &unk_1E5CB7E50;
      objc_copyWeak(v13, (id *)buf);
      id v12 = v6;
      v13[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      long long v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        long long v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        __int16 v15 = v10;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v16 = 1024;
      int v17 = 660;
      __int16 v18 = 2082;
      uint64_t v19 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]";
      __int16 v20 = 2082;
      __int16 v21 = "nil == (contact)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", buf, 0x26u);
    }
  }
}

void __60__MapsSuggestionsCompositeSource_feedbackForContact_action___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v4 = WeakRetained[3];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "feedbackForContact:action:", *(void *)(a1 + 32), *(void *)(a1 + 48), (void)v8);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v14 = "MapsSuggestionsCompositeSource.mm";
      __int16 v15 = 1026;
      int v16 = 669;
      __int16 v17 = 2082;
      __int16 v18 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (BOOL)removeChildSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "removeChildSource:SOURCE{%@}", buf, 0xCu);
    }
    [v4 stop];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MapsSuggestionsCompositeSource_removeChildSource___block_invoke;
    v9[3] = &unk_1E5CB9548;
    void v9[4] = self;
    id v10 = v4;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v9);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      __int16 v13 = 1024;
      int v14 = 725;
      __int16 v15 = 2082;
      int v16 = "-[MapsSuggestionsCompositeSource removeChildSource:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (source)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
    }
  }
  return v4 != 0;
}

uint64_t __52__MapsSuggestionsCompositeSource_removeChildSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (id)children
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MapsSuggestionsCompositeSource_children__block_invoke;
  v8[3] = &unk_1E5CB9B60;
  v8[4] = self;
  uint64_t v3 = v8;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__10;
  int v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  innerQueue = self->_queue._innerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZNK3MSg5Queue4syncIU8__strongP11objc_objectEET_U13block_pointerFS5_vE_block_invoke;
  block[3] = &unk_1E5CB7EC8;
  id v10 = v3;
  long long v11 = &v12;
  uint64_t v5 = v3;
  dispatch_sync(innerQueue, block);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

id __42__MapsSuggestionsCompositeSource_children__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  return v1;
}

- (id)sources
{
  return self->_sources;
}

- (void)test_sync
{
}

void __43__MapsSuggestionsCompositeSource_test_sync__block_invoke()
{
  v0 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A70DF000, v0, OS_LOG_TYPE_DEBUG, "Test synced", v1, 2u);
  }
}

- (id)test_dateUntilSuppressedEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __64__MapsSuggestionsCompositeSource_test_dateUntilSuppressedEntry___block_invoke;
    v12[3] = &unk_1E5CB9B88;
    v12[4] = self;
    id v13 = v4;
    id v6 = v12;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__10;
    *(void *)&buf[32] = __Block_byref_object_dispose__10;
    id v18 = 0;
    innerQueue = self->_queue._innerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZNK3MSg5Queue4syncIU8__strongP6NSDateEET_U13block_pointerFS5_vE_block_invoke;
    block[3] = &unk_1E5CB7EC8;
    id v15 = v6;
    int v16 = buf;
    long long v8 = v6;
    dispatch_sync(innerQueue, block);
    id v9 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 758;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsCompositeSource test_dateUntilSuppressedEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    id v9 = 0;
  }

  return v9;
}

uint64_t __64__MapsSuggestionsCompositeSource_test_dateUntilSuppressedEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "test_dateUntilSuppressedEntry:", *(void *)(a1 + 40));
}

- (double)test_suppressionDurationForBehavior:(int64_t)a3 type:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    switch(a4)
    {
      case 0:
        return 0.0;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
LABEL_12:
        GEOConfigGetDouble();
        return result;
      default:
        id v4 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        int v6 = 136446978;
        id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
        __int16 v8 = 1024;
        int v9 = 504;
        __int16 v10 = 2082;
        long long v11 = "NSTimeInterval _snoozeTimeForEntryType(MapsSuggestionsEntryType)";
        __int16 v12 = 2082;
        id v13 = "YES";
        goto LABEL_9;
    }
  }
  if (a3 == 2)
  {
    switch(a4)
    {
      case 0:
        return 0.0;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_12;
      default:
        id v4 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        int v6 = 136446978;
        id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
        __int16 v8 = 1024;
        int v9 = 563;
        __int16 v10 = 2082;
        long long v11 = "NSTimeInterval _hideTimeForEntryType(MapsSuggestionsEntryType)";
        __int16 v12 = 2082;
        id v13 = "YES";
        break;
    }
LABEL_9:
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
LABEL_10:
  }
  return 0.0;
}

- (void)test_resetSuppressions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MapsSuggestionsCompositeSource_test_resetSuppressions__block_invoke;
  block[3] = &unk_1E5CB85E0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
}

uint64_t __56__MapsSuggestionsCompositeSource_test_resetSuppressions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "test_deleteSuppressedEntriesFile");
}

- (void)test_awaitQueue
{
}

void __49__MapsSuggestionsCompositeSource_test_awaitQueue__block_invoke()
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasStarted, 0);
  objc_storeStrong((id *)&self->_suppressor, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_nextUpdateTimes, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

@end