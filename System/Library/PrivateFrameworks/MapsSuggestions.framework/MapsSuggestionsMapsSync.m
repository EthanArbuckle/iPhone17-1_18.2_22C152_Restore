@interface MapsSuggestionsMapsSync
- (MapsSuggestionsMapsSync)initWithMapsSyncConnector:(id)a3;
- (NSString)uniqueName;
- (char)canProduceRatingRequestForMapItem:(id)a3 maxAge:(double)a4 handler:(id)a5;
- (char)deleteEntry:(id)a3 handler:(id)a4;
- (char)didProduceRatingRequestForMapItem:(id)a3 handler:(id)a4;
- (char)durationSinceLastTransitHistoryRoute:(id)a3;
- (char)entriesFromHistoryWithHandler:(id)a3;
- (char)mapItemsForHistoricPlaces:(BOOL)a3 routes:(BOOL)a4 maxAge:(double)a5 handler:(id)a6;
- (char)shortcutsFromFavoritesWithHandler:(id)a3;
- (char)userHasFavoriteTransitLinesWithHandler:(id)a3;
- (char)userHasFavoriteTransitPOIsWithHandler:(id)a3;
- (id).cxx_construct;
- (id)initFromResourceDepot:(id)a3;
- (void)_addFieldsToSuggestionsEntry:(void *)a1;
- (void)_updateEntry:(void *)a1 withEvInfo:(void *)a2;
- (void)addMapsSyncObserver:(id)a3 forContentType:(int64_t)a4;
- (void)mapsSyncDidChangeForType:(int64_t)a3;
- (void)removeMapsSyncObserver:(id)a3 forContentType:(int64_t)a4;
- (void)removeMapsSyncObserverForAllContentTypes:(id)a3;
@end

@implementation MapsSuggestionsMapsSync

void __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = [v3 count];
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Received %u Favorite items from MapsSync", buf, 8u);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke_294;
  block[3] = &unk_1E5CB8458;
  id v10 = v3;
  id v11 = v5;
  v6 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke_169;
    v8[3] = &unk_1E5CB8198;
    v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    id v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v12 = "MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1026;
      int v14 = 107;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitPOIsWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

uint64_t __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke_169(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = MapsSuggestionsShortcutFromMSFavoriteItem(*(void **)(*((void *)&v12 + 1) + 8 * i));
        if ([v6 type] == 1)
        {
          id v7 = [v6 geoMapItem];
          unsigned int v8 = MapsSuggestionsMapItemIsTransitStation(v7);

          if (v8)
          {
            v9 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)id v11 = 0;
              _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "User has at least one favorite transit stop", v11, 2u);
            }

            goto LABEL_16;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "User has no transit stops", v11, 2u);
  }
LABEL_16:

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke_294(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFCA4AB0, (void)v12) & 1) != 0)
        {
          id v7 = v6;
          if (([v7 hidden] & 1) == 0)
          {
            unsigned int v8 = *(void **)(a1 + 40);
            v9 = MapsSuggestionsShortcutFromMSFavoriteItem(v7);
            [v8 addObject:v9];
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)addMapsSyncObserver:(id)a3 forContentType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = 32;
    switch(a4)
    {
      case 0:
        unsigned int v8 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v10 = 136446978;
        id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 471;
        __int16 v14 = 2082;
        long long v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
        __int16 v16 = 2082;
        uint64_t v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_12;
      case 1:
        break;
      case 2:
        uint64_t v7 = 40;
        break;
      case 3:
        uint64_t v7 = 48;
        break;
      default:
        unsigned int v8 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v10 = 136446978;
        id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 487;
        __int16 v14 = 2082;
        long long v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
        __int16 v16 = 2082;
        uint64_t v17 = "YES";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
        goto LABEL_12;
    }
    [*(id *)((char *)&self->super.isa + v7) registerObserver:v6 handler:0];
  }
  else
  {
    unsigned int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v12 = 1024;
      int v13 = 467;
      __int16 v14 = 2082;
      long long v15 = "-[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:]";
      __int16 v16 = 2082;
      uint64_t v17 = "nil == (observer)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer";
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x26u);
    }
LABEL_13:
  }
}

void __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_21];

  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = [v4 count];
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Received %u RecentHistory items from MapsSync", buf, 8u);
  }

  id v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_178;
  block[3] = &unk_1E5CB8720;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke_170;
    v8[3] = &unk_1E5CB8198;
    id v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    id v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v12 = "MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1026;
      int v14 = 141;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync durationSinceLastTransitHistoryRoute:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke_170(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;

          id v10 = objc_msgSend(v9, "routeRequestStorage", (void)v22);
          BOOL v11 = [v10 transportType] == 1;

          v5 |= v11;
          uint64_t v4 = v9;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v3);

    if (v5)
    {
      __int16 v12 = MapsSuggestionsNow();
      __int16 v13 = [v4 createTime];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(v15);
      __int16 v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v27 = v15;
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Time since the transit history route: %f", buf, 0xCu);
      }
      goto LABEL_17;
    }
  }
  else
  {

    uint64_t v4 = 0;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = GEOErrorDomain();
  uint64_t v28 = *MEMORY[0x1E4F28588];
  v29 = @"There is no transit history route";
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  __int16 v16 = [v17 initWithDomain:v18 code:-8 userInfo:v19];

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
  GEOFindOrCreateLog();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = [v16 localizedDescription];
    *(_DWORD *)buf = 138412290;
    double v27 = *(double *)&v21;
    _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
LABEL_17:
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1024;
      int v14 = 72;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync initFromResourceDepot:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_9;
  }
  uint64_t v6 = [v4 oneMapsSyncConnector];

  if (!v6)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1024;
      int v14 = 73;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync initFromResourceDepot:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (resourceDepot.oneMapsSyncConnector)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One MapsSyncConnector!", (uint8_t *)&v11, 0x26u);
    }
LABEL_9:

    unsigned int v8 = 0;
    goto LABEL_10;
  }
  id v7 = [v5 oneMapsSyncConnector];
  self = [(MapsSuggestionsMapsSync *)self initWithMapsSyncConnector:v7];

  unsigned int v8 = self;
LABEL_10:

  return v8;
}

- (MapsSuggestionsMapsSync)initWithMapsSyncConnector:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsMapsSync;
  uint64_t v6 = [(MapsSuggestionsMapsSync *)&v28 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsMapsSyncQueue", v7);
    unsigned int v8 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = v8;

    id v10 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    objc_storeStrong((id *)&v6->_connector, a3);
    [(MapsSuggestionsMapsSyncConnector *)v6->_connector setDelegate:v6];
    __int16 v12 = [MapsSuggestionsObservers alloc];
    __int16 v13 = v6->_queue._innerQueue;
    uint64_t v14 = [(MapsSuggestionsObservers *)v12 initWithCallbackQueue:v13 name:@"MapsSuggestionsMapsSyncHistoryObservers"];
    historyObservers = v6->_historyObservers;
    v6->_historyObservers = (MapsSuggestionsObservers *)v14;

    __int16 v16 = [MapsSuggestionsObservers alloc];
    __int16 v17 = v6->_queue._innerQueue;
    uint64_t v18 = [(MapsSuggestionsObservers *)v16 initWithCallbackQueue:v17 name:@"MapsSuggestionsMapsSyncTransitItemsObservers"];
    transitItemObservers = v6->_transitItemObservers;
    v6->_transitItemObservers = (MapsSuggestionsObservers *)v18;

    v20 = [MapsSuggestionsObservers alloc];
    v21 = v6->_queue._innerQueue;
    uint64_t v22 = [(MapsSuggestionsObservers *)v20 initWithCallbackQueue:v21 name:@"MapsSuggestionsMapsSyncFavoriteItemsObservers"];
    favoriteItemObservers = v6->_favoriteItemObservers;
    v6->_favoriteItemObservers = (MapsSuggestionsObservers *)v22;

    GEOFindOrCreateLog();
    long long v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      long long v25 = [(MapsSuggestionsMapsSync *)v6 uniqueName];
      v26 = [(MapsSuggestionsMapsSyncConnector *)v6->_connector uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "%@ is using %@", buf, 0x16u);
    }
  }

  return v6;
}

- (char)userHasFavoriteTransitLinesWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke;
    v9[3] = &unk_1E5CB9CE8;
    objc_copyWeak(&v11, (id *)location);
    id v10 = v4;
    char v6 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:2 handler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1024;
      int v14 = 80;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitLinesWithHandler:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsUserHasFavoriteTransitItemBlock handler cannot be nil!", location, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (char)durationSinceLastTransitHistoryRoute:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__MapsSuggestionsMapsSync_durationSinceLastTransitHistoryRoute___block_invoke;
    v9[3] = &unk_1E5CB9CE8;
    objc_copyWeak(&v11, (id *)location);
    id v10 = v4;
    char v6 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:1 handler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1024;
      int v14 = 136;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync durationSinceLastTransitHistoryRoute:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsDurationSinceLastTransitRouteBlock handler cannot be nil!", location, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (char)userHasFavoriteTransitPOIsWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MapsSuggestionsMapsSync_userHasFavoriteTransitPOIsWithHandler___block_invoke;
    v9[3] = &unk_1E5CB9CE8;
    objc_copyWeak(&v11, (id *)location);
    id v10 = v4;
    char v6 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:3 handler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1024;
      int v14 = 102;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitPOIsWithHandler:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsUserHasFavoriteTransitItemBlock handler cannot be nil!", location, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (char)entriesFromHistoryWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "entriesFromHistoryWithHandler", buf, 2u);
  }

  if (v4)
  {
    objc_initWeak((id *)buf, self);
    char v6 = self->_queue._innerQueue;
    connector = self->_connector;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke;
    v12[3] = &unk_1E5CB9D58;
    unsigned int v8 = v6;
    __int16 v13 = v8;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    char v9 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:1 handler:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v18 = 1024;
      int v19 = 180;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]";
      __int16 v22 = 2082;
      long long v23 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    char v9 = 0;
  }

  return v9;
}

- (char)shortcutsFromFavoritesWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "entriesFromFavoritesWithHandler", buf, 2u);
  }

  if (v4)
  {
    char v6 = self->_queue._innerQueue;
    connector = self->_connector;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__MapsSuggestionsMapsSync_shortcutsFromFavoritesWithHandler___block_invoke;
    v11[3] = &unk_1E5CB9E20;
    __int16 v12 = v6;
    id v13 = v4;
    unsigned int v8 = v6;
    char v9 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:3 handler:v11];
  }
  else
  {
    unsigned int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v16 = 1024;
      int v17 = 529;
      __int16 v18 = 2082;
      int v19 = "-[MapsSuggestionsMapsSync shortcutsFromFavoritesWithHandler:]";
      __int16 v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v9 = 0;
  }

  return v9;
}

void __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = WeakRetained[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke_165;
    v8[3] = &unk_1E5CB8198;
    char v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, v8);

    id v7 = v9;
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v12 = "MapsSuggestionsMapsSync.mm";
      __int16 v13 = 1026;
      int v14 = 85;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsMapsSync userHasFavoriteTransitLinesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

uint64_t __66__MapsSuggestionsMapsSync_userHasFavoriteTransitLinesWithHandler___block_invoke_165(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

void __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_178(uint64_t a1)
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v111 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsMapsSync.mm";
      __int16 v126 = 1026;
      int v127 = 195;
      __int16 v128 = 2082;
      v129 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v111, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v116 = v111;
    goto LABEL_129;
  }
  v116 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v120 objects:v124 count:16];
  if (v1)
  {
    int v3 = 0;
    int v119 = 0;
    uint64_t v118 = *(void *)v121;
    *(void *)&long long v2 = 138412290;
    long long v112 = v2;
LABEL_4:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v121 != v118) {
        objc_enumerationMutation(obj);
      }
      if (v119 & v3) {
        goto LABEL_121;
      }
      id v5 = *(void **)(*((void *)&v120 + 1) + 8 * v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || [v5 conformsToProtocol:&unk_1EFCA49F0]) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || [v5 conformsToProtocol:&unk_1EFC99AB8])
      {
        if ((v3 & 1) == 0)
        {
          id v28 = v5;
          if ([v28 navigationInterrupted])
          {
            id v29 = v28;
            uint64_t v30 = [[MapsSuggestionsEntry alloc] initWithType:11 title:&stru_1EFC640F8];
            uint64_t v31 = [v29 identifier];
            v32 = [v31 UUIDString];
            [(MapsSuggestionsEntry *)v30 setString:v32 forKey:@"MapsSuggestionsMapsSyncSourcePK"];

            [(MapsSuggestionsEntry *)v30 setString:@"MapsSuggestionsMapsSyncSourcePK" forKey:@"MapsSuggestionsPrimaryKey"];
            v33 = [v29 routeRequestStorage];
            v34 = [v33 waypoints];
            v35 = [v34 lastObject];
            v36 = [v35 mapItemStorage];
            [(MapsSuggestionsEntry *)v30 setGeoMapItem:v36];

            v37 = [(MapsSuggestionsEntry *)v30 geoMapItem];
            LODWORD(v34) = v37 == 0;

            if (v34)
            {
              v84 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446978;
                *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
                __int16 v126 = 1024;
                int v127 = 610;
                __int16 v128 = 2082;
                v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryRoute:]";
                __int16 v130 = 2082;
                v131 = "nil == (entry.geoMapItem)";
                _os_log_impl(&dword_1A70DF000, v84, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncDirectionsHistoryItem had no mapItem", buf, 0x26u);
              }
            }
            else
            {
              v38 = [v29 createTime];
              BOOL v39 = v38 == 0;

              if (!v39)
              {
                v40 = [v29 createTime];
                [(MapsSuggestionsEntry *)v30 setDate:v40 forKey:@"MapsSuggestionsWhenItHappenedKey"];

                GEOConfigGetDouble();
                -[MapsSuggestionsEntry setWeight:](v30, "setWeight:");
                -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v30);
                v41 = [v29 createTime];
                GEOConfigGetDouble();
                v42 = objc_msgSend(v41, "dateByAddingTimeInterval:");
                [(MapsSuggestionsEntry *)v30 setExpires:v42];

                [(MapsSuggestionsEntry *)v30 setBoolean:0 forKey:@"MapsSuggestionsIsResumingAnEVRoute"];
                v43 = [(MapsSuggestionsEntry *)v30 geoMapItem];
                GEOConfigGetDouble();
                double v45 = v44;
                id v46 = v43;
                v47 = v46;
                if (v46)
                {
                  *(void *)buf = 0;
                  BOOL v48 = MapsSuggestionsDistanceFromHereToMapItem(v46, buf);
                  BOOL v49 = *(double *)buf < v45 && v48;
                }
                else
                {
                  v96 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446978;
                    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
                    __int16 v126 = 1024;
                    int v127 = 700;
                    __int16 v128 = 2082;
                    v129 = "BOOL _isAlreadyThere(MapsSuggestionsMapItem *__strong, CLLocationDistance)";
                    __int16 v130 = 2082;
                    v131 = "nil == (mapItem)";
                    _os_log_impl(&dword_1A70DF000, v96, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
                  }

                  BOOL v49 = 0;
                }

                [(MapsSuggestionsEntry *)v30 setBoolean:v49 forKey:@"MapsSuggestionsAlreadyThereKey"];
                v97 = [v29 sharedETAData];
                [(MapsSuggestionsEntry *)v30 setData:v97 forKey:@"MapsSuggestionsResumeRouteRouteSharedETAData"];

                if ([v33 hasTransportType])
                {
                  uint64_t v98 = [v33 transportType];
                  if (v98 != 4)
                  {
                    v99 = [NSNumber numberWithInt:v98];
                    [(MapsSuggestionsEntry *)v30 setNumber:v99 forKey:@"MapsSuggestionsTransportTypeKey"];
                  }
                }
                [(MapsSuggestionsEntry *)v30 setRouteRequestStorage:v33, @"MapsSuggestionsResumeRouteRouteRequestStorage", v112 forKey];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  || [v29 conformsToProtocol:&unk_1EFC99B30])
                {
                  -[MapsSuggestionsMapsSync _updateEntry:withEvInfo:](v30, v29);
                }
                v88 = v30;
LABEL_108:

                if (v88)
                {
                  v73 = v88;
                  v100 = [v73 expires];
                  BOOL v101 = v100 == 0;

                  if (v101)
                  {
                    v105 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A70DF000, v105, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
                    }
                  }
                  else
                  {
                    v102 = [v73 expires];
                    BOOL v103 = MapsSuggestionsIsInThePast(v102);

                    if (v103)
                    {
                      GEOFindOrCreateLog();
                      v78 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                      {
                        v104 = [v73 title];
                        *(_DWORD *)buf = v112;
                        *(void *)&uint8_t buf[4] = v104;
                        _os_log_impl(&dword_1A70DF000, v78, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);
                      }
                      goto LABEL_58;
                    }
                  }
LABEL_68:

                  [v116 addObject:v73];
                  int v3 = 1;
                  goto LABEL_69;
                }
                v73 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v81 = v73;
                  v82 = "Could not create a ResumeRoute entry from the route data recieved from MapsSync";
LABEL_62:
                  _os_log_impl(&dword_1A70DF000, v81, OS_LOG_TYPE_ERROR, v82, buf, 2u);
                }
LABEL_63:
                v80 = 0;
                int v3 = 0;
                goto LABEL_64;
              }
              v84 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v84, OS_LOG_TYPE_ERROR, "usageDate was nil", buf, 2u);
              }
            }

            v88 = 0;
            goto LABEL_108;
          }
LABEL_29:
          int v3 = 0;
          goto LABEL_70;
        }
LABEL_11:
        int v3 = 1;
        goto LABEL_71;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((v119 & 1) == 0) {
          goto LABEL_40;
        }
        int v119 = 1;
      }
      else if (!(v119 & 1 | (([v5 conformsToProtocol:&unk_1EFCA4A50] & 1) == 0)))
      {
LABEL_40:
        id v113 = v5;
        v52 = [[MapsSuggestionsEntry alloc] initWithType:5 title:&stru_1EFC640F8];
        v53 = [v113 identifier];
        v54 = [v53 UUIDString];
        [(MapsSuggestionsEntry *)v52 setString:v54 forKey:@"MapsSuggestionsMapsSyncSourcePK"];

        [(MapsSuggestionsEntry *)v52 setString:@"MapsSuggestionsMapsSyncSourcePK" forKey:@"MapsSuggestionsPrimaryKey"];
        v55 = [v113 mapItemStorage];
        v56 = MapsSuggestionsMapItemConvertIfNeeded(v55);
        [(MapsSuggestionsEntry *)v52 setGeoMapItem:v56];

        v57 = [(MapsSuggestionsEntry *)v52 geoMapItem];
        LODWORD(v55) = v57 == 0;

        if (v55)
        {
          v65 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
            __int16 v126 = 1024;
            int v127 = 719;
            __int16 v128 = 2082;
            v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryPlace:]";
            __int16 v130 = 2082;
            v131 = "nil == (entry.geoMapItem)";
            v85 = v65;
            v86 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncRecentHistoryItem had no mapItem   ";
            uint32_t v87 = 38;
            goto LABEL_83;
          }
        }
        else
        {
          v58 = [v113 createTime];
          BOOL v59 = v58 == 0;

          if (!v59)
          {
            v60 = [v113 createTime];
            [(MapsSuggestionsEntry *)v52 setDate:v60 forKey:@"MapsSuggestionsWhenItHappenedKey"];

            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v52, "setWeight:");
            -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v52);
            v61 = [v113 createTime];
            GEOConfigGetDouble();
            v62 = objc_msgSend(v61, "dateByAddingTimeInterval:");
            [(MapsSuggestionsEntry *)v52 setExpires:v62];

            GEOConfigGetDouble();
            double v64 = v63;
            v65 = MapsSuggestionsCurrentBestLocation();
            v66 = MapsSuggestionsLocationForEntry(v52);
            [v66 distanceFromLocation:v65];
            [(MapsSuggestionsEntry *)v52 setBoolean:v67 < v64 forKey:@"MapsSuggestionsAlreadyThereKey"];
            v68 = v52;

            goto LABEL_85;
          }
          v65 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v85 = v65;
            v86 = "usageDate was nil";
            uint32_t v87 = 2;
LABEL_83:
            _os_log_impl(&dword_1A70DF000, v85, OS_LOG_TYPE_ERROR, v86, buf, v87);
          }
        }
        v68 = 0;
LABEL_85:

        if (!v68)
        {
          v73 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v73, OS_LOG_TYPE_ERROR, "Could not create a RecentHistory entry from the place data recieved from MapsSync", buf, 2u);
          }
          v80 = 0;
          goto LABEL_64;
        }
        v73 = v68;
        v89 = [v73 expires];
        BOOL v90 = v89 == 0;

        if (v90)
        {
          v95 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v95, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
          }
        }
        else
        {
          v91 = [v73 expires];
          BOOL v92 = MapsSuggestionsIsInThePast(v91);

          if (v92)
          {
            GEOFindOrCreateLog();
            v93 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
            {
              v94 = [v73 title];
              *(_DWORD *)buf = v112;
              *(void *)&uint8_t buf[4] = v94;
              _os_log_impl(&dword_1A70DF000, v93, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);
            }
LABEL_59:
            v80 = v73;
LABEL_64:

            v73 = v80;
LABEL_69:

LABEL_70:
            goto LABEL_71;
          }
        }

        [v116 addObject:v73];
        int v119 = 1;
        goto LABEL_69;
      }
LABEL_71:
      if (v1 == ++v4)
      {
        uint64_t v106 = [obj countByEnumeratingWithState:&v120 objects:v124 count:16];
        uint64_t v1 = v106;
        if (v106) {
          goto LABEL_4;
        }
        goto LABEL_121;
      }
    }
    if ((v3 & 1) == 0)
    {
      id v6 = v5;
      if (![v6 navigationInterrupted]) {
        goto LABEL_29;
      }
      id v7 = v6;
      long long v8 = [[MapsSuggestionsEntry alloc] initWithType:11 title:&stru_1EFC640F8];
      long long v9 = [v7 identifier];
      long long v10 = [v9 UUIDString];
      [(MapsSuggestionsEntry *)v8 setString:v10 forKey:@"MapsSuggestionsMapsSyncSourcePK"];

      [(MapsSuggestionsEntry *)v8 setString:@"MapsSuggestionsMapsSyncSourcePK" forKey:@"MapsSuggestionsPrimaryKey"];
      id v11 = [v7 routeRequestStorage];
      uint64_t v12 = [v11 waypoints];
      __int16 v13 = [v12 lastObject];
      int v14 = [v13 mapItemStorage];
      [(MapsSuggestionsEntry *)v8 setGeoMapItem:v14];

      __int16 v15 = [(MapsSuggestionsEntry *)v8 geoMapItem];
      LODWORD(v12) = v15 == 0;

      if (v12)
      {
        v50 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
          __int16 v126 = 1024;
          int v127 = 655;
          __int16 v128 = 2082;
          v129 = "-[MapsSuggestionsMapsSync _createEntryFromRecentHistoryMultiPointRoute:]";
          __int16 v130 = 2082;
          v131 = "nil == (entry.geoMapItem)";
          _os_log_impl(&dword_1A70DF000, v50, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSyncHistoryMultiPointRoute had no mapItem", buf, 0x26u);
        }
      }
      else
      {
        __int16 v16 = [v7 createTime];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          __int16 v18 = [v7 createTime];
          [(MapsSuggestionsEntry *)v8 setDate:v18 forKey:@"MapsSuggestionsWhenItHappenedKey"];

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v8, "setWeight:");
          -[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:](v8);
          int v19 = [v7 createTime];
          GEOConfigGetDouble();
          __int16 v20 = objc_msgSend(v19, "dateByAddingTimeInterval:");
          [(MapsSuggestionsEntry *)v8 setExpires:v20];

          [(MapsSuggestionsEntry *)v8 setBoolean:0 forKey:@"MapsSuggestionsIsResumingAnEVRoute"];
          v21 = [(MapsSuggestionsEntry *)v8 geoMapItem];
          GEOConfigGetDouble();
          double v23 = v22;
          id v24 = v21;
          long long v25 = v24;
          if (v24)
          {
            *(void *)buf = 0;
            BOOL v26 = MapsSuggestionsDistanceFromHereToMapItem(v24, buf);
            BOOL v27 = *(double *)buf < v23 && v26;
          }
          else
          {
            v69 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
              __int16 v126 = 1024;
              int v127 = 700;
              __int16 v128 = 2082;
              v129 = "BOOL _isAlreadyThere(MapsSuggestionsMapItem *__strong, CLLocationDistance)";
              __int16 v130 = 2082;
              v131 = "nil == (mapItem)";
              _os_log_impl(&dword_1A70DF000, v69, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
            }

            BOOL v27 = 0;
          }

          [(MapsSuggestionsEntry *)v8 setBoolean:v27 forKey:@"MapsSuggestionsAlreadyThereKey"];
          if ([v11 hasTransportType])
          {
            uint64_t v70 = [v11 transportType];
            if (v70 != 4)
            {
              v71 = [NSNumber numberWithInt:v70];
              [(MapsSuggestionsEntry *)v8 setNumber:v71 forKey:@"MapsSuggestionsTransportTypeKey"];
            }
          }
          [(MapsSuggestionsEntry *)v8 setRouteRequestStorage:v11, @"MapsSuggestionsResumeRouteRouteRequestStorage", v112 forKey];
          -[MapsSuggestionsEntry setInteger:forKey:](v8, "setInteger:forKey:", (int)[v7 routeProgressWaypointIndex], @"MapsSuggestionsResumeRouteWaypointIndex");
          v72 = [v7 sharedETAData];
          [(MapsSuggestionsEntry *)v8 setData:v72 forKey:@"MapsSuggestionsResumeRouteRouteSharedETAData"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || [v7 conformsToProtocol:&unk_1EFC99B30])
          {
            -[MapsSuggestionsMapsSync _updateEntry:withEvInfo:](v8, v7);
          }
          v51 = v8;
LABEL_53:

          if (v51)
          {
            v73 = v51;
            v74 = [v73 expires];
            BOOL v75 = v74 == 0;

            if (v75)
            {
              v83 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v83, OS_LOG_TYPE_DEBUG, "Entry did not have an expiration set. Keeping it", buf, 2u);
              }
            }
            else
            {
              v76 = [v73 expires];
              BOOL v77 = MapsSuggestionsIsInThePast(v76);

              if (v77)
              {
                GEOFindOrCreateLog();
                v78 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  v79 = [v73 title];
                  *(_DWORD *)buf = v112;
                  *(void *)&uint8_t buf[4] = v79;
                  _os_log_impl(&dword_1A70DF000, v78, OS_LOG_TYPE_INFO, "Dropping expired entry %@", buf, 0xCu);
                }
LABEL_58:

                int v3 = 0;
                goto LABEL_59;
              }
            }
            goto LABEL_68;
          }
          v73 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v81 = v73;
            v82 = "Could not create a ResumeRoute entry from the MPR data recieved from MapsSync";
            goto LABEL_62;
          }
          goto LABEL_63;
        }
        v50 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v50, OS_LOG_TYPE_ERROR, "usageDate was nil", buf, 2u);
        }
      }

      v51 = 0;
      goto LABEL_53;
    }
    goto LABEL_11;
  }
LABEL_121:

  GEOFindOrCreateLog();
  v107 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
  {
    v108 = NSStringFromMapsSuggestionsEntries(v116);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v108;
    _os_log_impl(&dword_1A70DF000, v107, OS_LOG_TYPE_DEBUG, "Sending %@", buf, 0xCu);
  }
  uint64_t v109 = *(void *)(a1 + 40);
  id v110 = [v116 copy];
  (*(void (**)(uint64_t, id, void))(v109 + 16))(v109, v110, 0);

  if ((unint64_t)[v116 count] >= 3)
  {
    v111 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v126 = 1024;
      int v127 = 258;
      __int16 v128 = 2082;
      v129 = "-[MapsSuggestionsMapsSync entriesFromHistoryWithHandler:]_block_invoke";
      __int16 v130 = 2082;
      v131 = "entriesToAdd.count > 2u";
      _os_log_impl(&dword_1A70DF000, v111, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. 1 RecentHistory + 1 ResumeRoute cannot be more than 2 in total", buf, 0x26u);
    }
LABEL_129:
  }
}

uint64_t __57__MapsSuggestionsMapsSync_entriesFromHistoryWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 createTime];
  id v6 = [v4 createTime];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (char)mapItemsForHistoricPlaces:(BOOL)a3 routes:(BOOL)a4 maxAge:(double)a5 handler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = "NO";
    if (v8) {
      __int16 v13 = "YES";
    }
    else {
      __int16 v13 = "NO";
    }
    *(_DWORD *)buf = 136315650;
    double v23 = v13;
    if (v7) {
      uint64_t v12 = "YES";
    }
    __int16 v24 = 2080;
    *(void *)long long v25 = v12;
    *(_WORD *)&v25[8] = 2048;
    *(double *)&v25[10] = a5;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "mapItemsForHistoricPlaces:%s routes:%s maxAge:%.1f", buf, 0x20u);
  }

  if (v10)
  {
    connector = self->_connector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__MapsSuggestionsMapsSync_mapItemsForHistoricPlaces_routes_maxAge_handler___block_invoke;
    v18[3] = &unk_1E5CB9D30;
    int v19 = v10;
    double v20 = a5;
    BOOL v21 = v8;
    char v15 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:1 handler:v18];
    __int16 v16 = v19;
  }
  else
  {
    __int16 v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v24 = 1024;
      *(_DWORD *)long long v25 = 273;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsMapsSync mapItemsForHistoricPlaces:routes:maxAge:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v15 = 0;
  }

  return v15;
}

void __75__MapsSuggestionsMapsSync_mapItemsForHistoricPlaces_routes_maxAge_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v25 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v4 = v25;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v5) {
        goto LABEL_26;
      }
      uint64_t v6 = *(void *)v28;
      while (1)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v4);
          }
          BOOL v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
          long long v9 = objc_msgSend(v8, "createTime", v25);
          double v10 = MapsSuggestionsSecondsTo(v9);

          if (*(double *)(a1 + 40) >= -v10 && *(unsigned char *)(a1 + 48))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || [v8 conformsToProtocol:&unk_1EFCA4A50])
            {
              id v11 = [v8 mapItemStorage];
              uint64_t v12 = MapsSuggestionsMapItemConvertIfNeeded(v11);

              if (v12) {
                [v26 addObject:v12];
              }
LABEL_14:

              goto LABEL_15;
            }
            if (*(unsigned char *)(a1 + 48))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || [v8 conformsToProtocol:&unk_1EFC99AB8])
              {
                __int16 v13 = [v8 routeRequestStorage];
                int v14 = [v13 waypoints];
                uint64_t v12 = [v14 lastObject];

                char v15 = [v12 geoMapItem];
                __int16 v16 = v15;
                if (v15)
                {
                  BOOL v17 = MapsSuggestionsMapItemConvertIfNeeded(v15);
                  if (v17) {
                    [v26 addObject:v17];
                  }
                }
                goto LABEL_14;
              }
            }
          }
LABEL_15:
          ++v7;
        }
        while (v5 != v7);
        uint64_t v18 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
        uint64_t v5 = v18;
        if (!v18)
        {
LABEL_26:

          uint64_t v19 = *(void *)(a1 + 32);
          double v20 = (void *)[v26 copy];
          (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v20, 0);

          BOOL v21 = v26;
          goto LABEL_30;
        }
      }
    }
    __int16 v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "Received 0 historyItems from Sync", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    double v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[MapsSuggestionsMapsSync mapItemsForHistoricPlaces:routes:maxAge:handler:]_block_invoke";
      __int16 v34 = 2112;
      v35 = @"We didn't expect to get nil from allContentOfType:, but we did!";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "Error in %s: %@", buf, 0x16u);
    }

    uint64_t v23 = *(void *)(a1 + 32);
    BOOL v21 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11, @"We didn't expect to get nil from allContentOfType:, but we did!" reason];
    (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v21);
LABEL_30:
  }
}

- (char)deleteEntry:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    __int16 v25 = 1024;
    int v26 = 331;
    __int16 v27 = 2082;
    long long v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
    __int16 v29 = 2082;
    long long v30 = "nil == (handler)";
    char v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v15, location, 0x26u);
    goto LABEL_18;
  }
  if (!v6)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    __int16 v25 = 1024;
    int v26 = 332;
    __int16 v27 = 2082;
    long long v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
    __int16 v29 = 2082;
    long long v30 = "nil == (entry)";
    char v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestions entry";
    goto LABEL_11;
  }
  uint64_t v8 = [v6 type];
  if (v8 == 5 || v8 == 11)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    double v10 = [v6 uniqueIdentifier];
    id v11 = (void *)[v9 initWithUUIDString:v10];

    if (v11)
    {
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __47__MapsSuggestionsMapsSync_deleteEntry_handler___block_invoke;
      v20[3] = &unk_1E5CB9D58;
      objc_copyWeak(&v23, (id *)location);
      __int16 v13 = v11;
      BOOL v21 = v13;
      id v22 = v7;
      char v14 = [(MapsSuggestionsMapsSyncConnector *)connector allContentOfType:1 handler:v20];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v25 = 1024;
      int v26 = 348;
      __int16 v27 = 2082;
      long long v28 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]";
      __int16 v29 = 2082;
      long long v30 = "nil == (uuid)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Invalid entry without a UUID?!", location, 0x26u);
    }

    __int16 v13 = 0;
LABEL_18:
    char v14 = 0;
    goto LABEL_19;
  }
  GEOFindOrCreateLog();
  __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    BOOL v17 = NSStringFromMapsSuggestionsEntryType([v6 type]);
    *(_DWORD *)location = 138412290;
    *(void *)&location[4] = v17;
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Cannot remove entries of type %@", location, 0xCu);
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
  char v14 = 1;
LABEL_20:

  return v14;
}

void __47__MapsSuggestionsMapsSync_deleteEntry_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v10 = [v9 identifier];
          int v11 = [v10 isEqual:*(void *)(a1 + 32)];

          if (v11)
          {
            char v15 = (void *)WeakRetained[3];
            double v20 = v9;
            char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
            [v15 deleteObjects:v14 completion:*(void *)(a1 + 40)];
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = [[NSString alloc] initWithFormat:@"Can't find anything in MapsSync with UUID=%@", *(void *)(a1 + 32)];
    char v14 = [v13 GEOErrorWithCode:-13 reason:v5];
    (*(void (**)(uint64_t, NSObject *))(v12 + 16))(v12, v14);
  }
  else
  {
    GEOFindOrCreateLog();
    char v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v23 = "MapsSuggestionsMapsSync.mm";
      __int16 v24 = 1026;
      int v25 = 352;
      __int16 v26 = 2082;
      __int16 v27 = "-[MapsSuggestionsMapsSync deleteEntry:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    uint64_t v5 = v14;
  }
LABEL_15:
}

- (char)canProduceRatingRequestForMapItem:(id)a3 maxAge:(double)a4 handler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  GEOFindOrCreateLog();
  double v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [v8 name];
    *(_DWORD *)buf = 138412546;
    BOOL v49 = v11;
    __int16 v50 = 2048;
    *(double *)v51 = a4;
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Checking canProduceRatingRequestForMapItem:'%@' maxAge:%.1f", buf, 0x16u);
  }
  if (v9)
  {
    if (v8)
    {
      uint64_t v12 = [v8 _muid];
      connector = self->_connector;
      char v14 = [NSNumber numberWithUnsignedLongLong:v12];
      v47 = v14;
      char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      long long v16 = [(MapsSuggestionsMapsSyncConnector *)connector MapsSyncReviewedPlace_fetchWithMuids:v15];

      long long v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v49 = (const char *)v16;
        _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "MapsSyncReviewedPlace: %@", buf, 0xCu);
      }

      if (v16)
      {
        if ([v16 hasUserReviewed])
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_282;
          v41[3] = &unk_1E5CB9D80;
          long long v18 = &v42;
          id v42 = v8;
          v43[1] = v12;
          long long v19 = (id *)v43;
          v43[0] = v9;
          innerQueue = self->_queue._innerQueue;
          BOOL v21 = v41;
        }
        else
        {
          __int16 v24 = [v16 lastSuggestedReviewDate];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            __int16 v26 = [v16 lastSuggestedReviewDate];
            double v27 = MapsSuggestionsSecondsSince(v26);

            if (v27 >= a4)
            {
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_285;
              v29[3] = &unk_1E5CB9DA8;
              id v30 = v8;
              v32[1] = v12;
              *(double *)&v32[2] = a4;
              *(double *)&v32[3] = v27;
              v32[0] = v9;
              uint64_t v31 = v16;
              dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v29);

              long long v18 = &v30;
              long long v19 = (id *)v32;
            }
            else
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_284;
              block[3] = &unk_1E5CB9DD0;
              id v34 = v8;
              uint64_t v37 = v12;
              v35 = v16;
              id v36 = v9;
              dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

              long long v18 = &v34;
              long long v19 = (id *)&v35;
            }
            goto LABEL_22;
          }
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_283;
          v38[3] = &unk_1E5CB9D80;
          long long v18 = &v39;
          id v39 = v8;
          v40[1] = v12;
          long long v19 = (id *)v40;
          v40[0] = v9;
          innerQueue = self->_queue._innerQueue;
          BOOL v21 = v38;
        }
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke;
        v44[3] = &unk_1E5CB9D80;
        long long v18 = &v45;
        id v45 = v8;
        v46[1] = v12;
        long long v19 = (id *)v46;
        v46[0] = v9;
        innerQueue = self->_queue._innerQueue;
        BOOL v21 = v44;
      }
      dispatch_async(innerQueue, v21);
LABEL_22:

      char v23 = 1;
      goto LABEL_23;
    }
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v50 = 1024;
      *(_DWORD *)v51 = 373;
      *(_WORD *)&v51[4] = 2082;
      *(void *)&v51[6] = "-[MapsSuggestionsMapsSync canProduceRatingRequestForMapItem:maxAge:handler:]";
      __int16 v52 = 2082;
      v53 = "nil == (mapItem)";
      id v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_14;
    }
  }
  else
  {
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v50 = 1024;
      *(_DWORD *)v51 = 372;
      *(_WORD *)&v51[4] = 2082;
      *(void *)&v51[6] = "-[MapsSuggestionsMapsSync canProduceRatingRequestForMapItem:maxAge:handler:]";
      __int16 v52 = 2082;
      v53 = "nil == (handler)";
      id v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_14:
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v22, buf, 0x26u);
    }
  }
  char v23 = 0;
LABEL_23:

  return v23;
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "No prior Rating record for %@ (%llu). Can show Suggestion.", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_282(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Already have Rating for %@ (%llu). Will not show Suggestion", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_283(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "User reviewed without explicit suggestion %@ (%llu). Can show Suggestion.", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_284(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 40) lastSuggestedReviewDate];
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Already asked for Rating %@ (%llu) on %@. Can show Suggestion.", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) lastSuggestedReviewDate];
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 1, v7);
}

void __76__MapsSuggestionsMapsSync_canProduceRatingRequestForMapItem_maxAge_handler___block_invoke_285(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 56);
    double v5 = *(double *)(a1 + 64) - *(double *)(a1 + 72);
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Time limit for this Rating %@ (%llu) is over. It has %.3f sec left. Will not show Suggestion.", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) lastSuggestedReviewDate];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (char)didProduceRatingRequestForMapItem:(id)a3 handler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  GEOFindOrCreateLog();
  int v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v6 name];
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "didProduceRatingRequestForMapItem:'%@'", buf, 0xCu);
  }
  if (!v7)
  {
    long long v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    __int16 v42 = 1024;
    *(_DWORD *)v43 = 429;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "nil == (handler)";
    long long v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v6)
  {
    long long v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    __int16 v42 = 1024;
    *(_DWORD *)v43 = 430;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "nil == (mapItem)";
    long long v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
    goto LABEL_11;
  }
  uint64_t v10 = [v6 _muid];
  connector = self->_connector;
  __int16 v12 = [NSNumber numberWithUnsignedLongLong:v10];
  id v39 = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  uint64_t v14 = [(MapsSuggestionsMapsSyncConnector *)connector MapsSyncReviewedPlace_fetchWithMuids:v13];

  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke;
    block[3] = &unk_1E5CB9DD0;
    id v34 = v6;
    uint64_t v37 = v10;
    id v35 = v14;
    id v36 = v7;
    innerQueue = self->_queue._innerQueue;
    long long v16 = v14;
    dispatch_async(innerQueue, block);

LABEL_17:
    char v18 = 1;
    goto LABEL_18;
  }
  long long v19 = self->_connector;
  double v20 = MapsSuggestionsNow();
  BOOL v21 = [(MapsSuggestionsMapsSyncConnector *)v19 saveNewReviewedPlaceWithMuid:v10 lastSuggestedReviewDate:v20];

  GEOFindOrCreateLog();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    char v23 = [v6 name];
    __int16 v24 = [v21 lastSuggestedReviewDate];
    *(_DWORD *)buf = 138412802;
    v41 = v23;
    __int16 v42 = 2048;
    *(void *)v43 = v10;
    *(_WORD *)&v43[8] = 2112;
    *(void *)&v43[10] = v24;
    _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "Creating a new reviewedPlace for %@ (%llu) with lastSuggestedReviewDate of %@", buf, 0x20u);
  }
  if (v21)
  {
    BOOL v25 = [MEMORY[0x1E4F74378] sharedStore];
    v38 = v21;
    __int16 v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke_288;
    v28[3] = &unk_1E5CB9DF8;
    id v31 = v7;
    id v29 = v6;
    uint64_t v32 = v10;
    long long v16 = v21;
    id v30 = v16;
    [v25 saveWithObjects:v26 completionHandler:v28];

    goto LABEL_17;
  }
  long long v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
    __int16 v42 = 1024;
    *(_DWORD *)v43 = 448;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsMapsSync didProduceRatingRequestForMapItem:handler:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "nil == (reviewedPlace)";
    long long v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. We have no MapsSyncReviewedPlace and couldn't make one either";
    goto LABEL_11;
  }
LABEL_12:
  char v18 = 0;
LABEL_18:

  return v18;
}

void __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  long long v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 56);
    int v7 = 138412546;
    int v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Not creating a new reviewedPlace. Already suggested this Rating before for %@ (%llu)", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) lastSuggestedReviewDate];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

void __69__MapsSuggestionsMapsSync_didProduceRatingRequestForMapItem_handler___block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Error during commit of Rating: %@", v3];
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v13 = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      int v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:17 reason:v4];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  int v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = [*(id *)(a1 + 32) name];
    uint64_t v10 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    double v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Added record for Rating %@ (%llu)", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    uint64_t v4 = [*(id *)(a1 + 40) lastSuggestedReviewDate];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v4, 0);
LABEL_10:
  }
}

- (void)removeMapsSyncObserver:(id)a3 forContentType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = 32;
    switch(a4)
    {
      case 0:
        int v8 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v10 = 136446978;
        uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 497;
        __int16 v14 = 2082;
        uint64_t v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
        __int16 v16 = 2082;
        long long v17 = "YES";
        __int16 v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_12;
      case 1:
        break;
      case 2:
        uint64_t v7 = 40;
        break;
      case 3:
        uint64_t v7 = 48;
        break;
      default:
        int v8 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v10 = 136446978;
        uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 513;
        __int16 v14 = 2082;
        uint64_t v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
        __int16 v16 = 2082;
        long long v17 = "YES";
        __int16 v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
        goto LABEL_12;
    }
    [*(id *)((char *)&self->super.isa + v7) unregisterObserver:v6 handler:0];
  }
  else
  {
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v12 = 1024;
      int v13 = 493;
      __int16 v14 = 2082;
      uint64_t v15 = "-[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:]";
      __int16 v16 = 2082;
      long long v17 = "nil == (observer)";
      __int16 v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer";
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x26u);
    }
LABEL_13:
  }
}

- (void)removeMapsSyncObserverForAllContentTypes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(MapsSuggestionsMapsSync *)self removeMapsSyncObserver:v4 forContentType:1];
    [(MapsSuggestionsMapsSync *)self removeMapsSyncObserver:v4 forContentType:2];
    [(MapsSuggestionsMapsSync *)self removeMapsSyncObserver:v4 forContentType:3];
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v8 = 1024;
      int v9 = 518;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsMapsSync removeMapsSyncObserverForAllContentTypes:]";
      __int16 v12 = 2082;
      int v13 = "nil == (observer)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)mapsSyncDidChangeForType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 32;
  switch(a3)
  {
    case 0:
      int v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 562;
        __int16 v14 = 2082;
        uint64_t v15 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]";
        __int16 v16 = 2082;
        long long v17 = "YES";
        uint64_t v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_10;
      }
      break;
    case 1:
      goto LABEL_6;
    case 2:
      uint64_t v5 = 40;
      goto LABEL_6;
    case 3:
      uint64_t v5 = 48;
LABEL_6:
      __int16 v8 = *(id *)((char *)&self->super.isa + v5);
      if (!v8) {
        goto LABEL_8;
      }
      int v6 = v8;
      objc_initWeak((id *)location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__MapsSuggestionsMapsSync_mapsSyncDidChangeForType___block_invoke;
      v9[3] = &unk_1E5CB9E48;
      objc_copyWeak(v10, (id *)location);
      v10[1] = (id)a3;
      [v6 callBlock:v9];
      objc_destroyWeak(v10);
      objc_destroyWeak((id *)location);
      break;
    default:
LABEL_8:
      int v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
        __int16 v12 = 1024;
        int v13 = 578;
        __int16 v14 = 2082;
        uint64_t v15 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]";
        __int16 v16 = 2082;
        long long v17 = "nil == (observers)";
        uint64_t v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMapsSyncConnectorType!";
LABEL_10:
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, v7, location, 0x26u);
      }
      break;
  }
}

void __52__MapsSuggestionsMapsSync_mapsSyncDidChangeForType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 mapsSync:WeakRetained didChangeForContentType:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      uint64_t v7 = "MapsSuggestionsMapsSync.mm";
      __int16 v8 = 1026;
      int v9 = 582;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsMapsSync mapsSyncDidChangeForType:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (NSString)uniqueName
{
  long long v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)_addFieldsToSuggestionsEntry:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v2 = v1;
  if (!v1)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v15 = 1024;
      int v16 = 766;
      __int16 v17 = 2082;
      uint64_t v18 = "-[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:]";
      __int16 v19 = 2082;
      double v20 = "nil == (entry)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  id v3 = [v1 geoMapItem];

  if (!v3)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSync.mm";
      __int16 v15 = 1024;
      int v16 = 767;
      __int16 v17 = 2082;
      uint64_t v18 = "-[MapsSuggestionsMapsSync _addFieldsToSuggestionsEntry:]";
      __int16 v19 = 2082;
      double v20 = "nil == (entry.geoMapItem)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem to be set in advance";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v4 = NSNumber;
  uint64_t v5 = [v2 geoMapItem];
  [v5 centerCoordinate];
  int v6 = objc_msgSend(v4, "numberWithDouble:");
  [v2 setNumber:v6 forKey:@"MapsSuggestionsLatitudeKey"];

  uint64_t v7 = NSNumber;
  __int16 v8 = [v2 geoMapItem];
  [v8 centerCoordinate];
  __int16 v10 = [v7 numberWithDouble:v9];
  [v2 setNumber:v10 forKey:@"MapsSuggestionsLongitudeKey"];

  [v2 setNumber:&unk_1EFC89870 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
LABEL_10:
}

- (void)_updateEntry:(void *)a1 withEvInfo:(void *)a2
{
  id v11 = a1;
  id v3 = a2;
  [v3 requiredBatteryCharge];
  if (v4 > 0.0)
  {
    uint64_t v5 = [v3 vehicleIdentifier];
    if (v5)
    {
      int v6 = [v3 vehicleIdentifier];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        [v11 setBoolean:1 forKey:@"MapsSuggestionsIsResumingAnEVRoute"];
        __int16 v8 = [v3 vehicleIdentifier];
        [v11 setString:v8 forKey:@"MapsSuggestionsVehicleIdentifierKey"];

        double v9 = NSNumber;
        [v3 requiredBatteryCharge];
        __int16 v10 = objc_msgSend(v9, "numberWithDouble:");
        [v11 setNumber:v10 forKey:@"MapsSuggestionsRequiredChargeForEVKey"];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteItemObservers, 0);
  objc_storeStrong((id *)&self->_transitItemObservers, 0);
  objc_storeStrong((id *)&self->_historyObservers, 0);
  objc_storeStrong((id *)&self->_connector, 0);

  innerQueue = self->_queue._innerQueue;
}

@end