@interface MapsSuggestionsShortcutSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsShortcutSource)initWithShortcutManager:(id)a3 delegate:(id)a4 name:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)_renameDuplicateMeCardTypes:(id)a3;
- (void)_treatShortcuts:(void *)a3 error:(void *)a4 handler:;
- (void)_updateSuggestionEntriesWithHandler:(uint64_t)a1;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsShortcutSource

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
    __int16 v18 = 1024;
    int v19 = 62;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  v8 = [v6 oneFavorites];

  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
    __int16 v18 = 1024;
    int v19 = 63;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot.oneFavorites)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Favorites!";
    goto LABEL_11;
  }
  v9 = [v6 oneSourceDelegate];

  if (!v9)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      __int16 v18 = 1024;
      int v19 = 64;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsShortcutSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.oneSourceDelegate)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  v10 = [v6 oneFavorites];
  v11 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsShortcutSource *)self initWithShortcutManager:v10 delegate:v11 name:v7];

  v12 = self;
LABEL_13:

  return v12;
}

- (MapsSuggestionsShortcutSource)initWithShortcutManager:(id)a3 delegate:(id)a4 name:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10)
  {
    uint64_t v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      __int16 v30 = 1024;
      int v31 = 35;
      __int16 v32 = 2082;
      v33 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]";
      __int16 v34 = 2082;
      v35 = "nil == (delegate)";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source delegate", location, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    uint64_t v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutSource.m";
      __int16 v30 = 1024;
      int v31 = 36;
      __int16 v32 = 2082;
      v33 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]";
      __int16 v34 = 2082;
      v35 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", location, 0x26u);
    }
LABEL_11:

    v23 = 0;
    goto LABEL_12;
  }
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsShortcutSource;
  v13 = [(MapsSuggestionsBaseSource *)&v28 initWithDelegate:v10 name:v11];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MapsSuggestionsShortcutSourceQueue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_shortcutManager, a3);
    objc_initWeak((id *)location, v13);
    v17 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    double v19 = v18;
    __int16 v20 = v13->_queue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__MapsSuggestionsShortcutSource_initWithShortcutManager_delegate_name___block_invoke;
    v26[3] = &unk_1E5CB8058;
    objc_copyWeak(&v27, (id *)location);
    uint64_t v21 = [(MapsSuggestionsCanKicker *)v17 initWithName:@"MapsSuggestionsShortcutSourceCanKicker" time:v20 queue:v26 block:v19];
    updateForcer = v13->_updateForcer;
    v13->_updateForcer = (MapsSuggestionsCanKicker *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);
  }
  self = v13;
  v23 = self;
LABEL_12:

  return v23;
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[MapsSuggestionsShortcutSource updateSuggestionEntriesWithHandler:]";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__MapsSuggestionsShortcutSource_updateSuggestionEntriesWithHandler___block_invoke;
  v9[3] = &unk_1E5CB8A98;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
  return 0.0;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

void __63__MapsSuggestionsShortcutSource__treatShortcuts_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Treating Shortcut %@", (uint8_t *)&v9, 0xCu);
  }

  if (([v5 isHidden] & 1) == 0)
  {
    id v7 = MapsSuggestionsEntryFromShortcut(v5, a3);
    if (v7)
    {
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412546;
        id v10 = v5;
        __int16 v11 = 1024;
        int v12 = a3;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Made Entry out of Shortcut '%@' at pos %u", (uint8_t *)&v9, 0x12u);
      }

      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

- (void)_renameDuplicateMeCardTypes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) type];
        if (v11 == 2) {
          ++v7;
        }
        if (v11 == 3) {
          ++v8;
        }
        if (v11 == 5) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        double v18 = objc_msgSend(v17, "customName", (void)v24);

        if (!v18)
        {
          double v19 = [v17 geoMapItem];

          if (v19)
          {
            BOOL v20 = [v17 type] == 2 && v7 > 1;
            if (v20
              || ([v17 type] == 3 ? (BOOL v21 = v8 > 1) : (BOOL v21 = 0),
                  v21 || [v17 type] == 5 && v6 >= 2))
            {
              __int16 v22 = [v17 geoMapItem];
              v23 = MapsSuggestionsMapItemStreetName(v22);
              [v17 setCustomName:v23];
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }
}

+ (unint64_t)disposition
{
  return 2;
}

void __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke_153(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = [a1[4] shortcutsForAll];
    -[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]((uint64_t)WeakRetained, v3, a1[5], a1[6]);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      unint64_t v6 = "MapsSuggestionsShortcutSource.m";
      __int16 v7 = 1026;
      int v8 = 157;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)_treatShortcuts:(void *)a3 error:(void *)a4 handler:
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  __int16 v9 = a4;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)BOOL v21 = "-[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uint64_t v11 = [*(id *)(a1 + 40) kickCanBySameTime];
  if (!v7 || v8)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)BOOL v21 = v8;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "Error getting Shortcuts: %@", buf, 0xCu);
    }

    [(id)a1 addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1AD0C8E80](v11);
    uint64_t v13 = [v7 count];
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v21[0] = v13;
      LOWORD(v21[1]) = 2112;
      *(void *)((char *)&v21[1] + 2) = v7;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Received %u Shortcuts: %@", buf, 0x12u);
    }

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    [(id)a1 _renameDuplicateMeCardTypes:v7];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__MapsSuggestionsShortcutSource__treatShortcuts_error_handler___block_invoke;
    v18[3] = &unk_1E5CBA760;
    id v16 = v15;
    id v19 = v16;
    [v7 enumerateObjectsUsingBlock:v18];
    [(id)a1 addOrUpdateMySuggestionEntries:v16];
    if (v9) {
      v9[2](v9);
    }
  }
}

void __68__MapsSuggestionsShortcutSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      unint64_t v6 = "MapsSuggestionsShortcutSource.m";
      __int16 v7 = 1026;
      int v8 = 196;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)_updateSuggestionEntriesWithHandler:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  objc_initWeak((id *)buf, (id)a1);
  int v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke;
  v7[3] = &unk_1E5CBA788;
  objc_copyWeak(&v9, (id *)buf);
  id v6 = v3;
  id v8 = v6;
  [v5 readMeCardWithHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return MapsSuggestionsEntryTypeCouldBeShortcut(a3);
}

void __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__MapsSuggestionsShortcutSource__updateSuggestionEntriesWithHandler___block_invoke_153;
    v11[3] = &unk_1E5CB91D8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v12 = v5;
    id v13 = v6;
    id v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsShortcutSource.m";
      __int16 v18 = 1026;
      int v19 = 155;
      __int16 v20 = 2082;
      BOOL v21 = "-[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[MapsSuggestionsShortcutSource start]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(MapsSuggestionsShortcutManager *)self->_shortcutManager registerMeCardObserver:self];
  [(MapsSuggestionsShortcutSource *)self updateSuggestionEntriesWithHandler:0];
}

void __71__MapsSuggestionsShortcutSource_initWithShortcutManager_delegate_name___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Reloading because of timeout", (uint8_t *)&v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsShortcutSource _updateSuggestionEntriesWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsShortcutSource.m";
      __int16 v8 = 1026;
      int v9 = 52;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsShortcutSource initWithShortcutManager:delegate:name:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[MapsSuggestionsShortcutSource stop]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(MapsSuggestionsShortcutManager *)self->_shortcutManager unregisterMeCardObserver:self];
  [(MapsSuggestionsCanKicker *)self->_updateForcer cancel];
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [v6 uniqueName];
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Reloading because of changes from %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MapsSuggestionsShortcutSource_meCardReader_didUpdateMeCard___block_invoke;
  v12[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v7;
  id v11 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __62__MapsSuggestionsShortcutSource_meCardReader_didUpdateMeCard___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) shortcutsForAll];
    -[MapsSuggestionsShortcutSource _treatShortcuts:error:handler:]((uint64_t)WeakRetained, v3, 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsShortcutSource.m";
      __int16 v6 = 1026;
      int v7 = 224;
      __int16 v8 = 2082;
      int v9 = "-[MapsSuggestionsShortcutSource meCardReader:didUpdateMeCard:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateForcer, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end