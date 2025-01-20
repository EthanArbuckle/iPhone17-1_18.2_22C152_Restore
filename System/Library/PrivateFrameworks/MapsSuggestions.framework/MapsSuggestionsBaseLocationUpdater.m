@interface MapsSuggestionsBaseLocationUpdater
- (BOOL)hasObservers;
- (MapsSuggestionsBaseLocationUpdater)initWithName:(id)a3 queue:(id)a4;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)dispatchQueue;
- (id)restartLocationUpdatesForDelegate:(id)a3;
- (id)startLocationUpdatesForDelegate:(id)a3;
- (unint64_t)countLocationObservers;
- (void)awaitQueue;
- (void)considerMyAllowanceAsLimited:(BOOL)a3;
- (void)considerMyNewLocation:(id)a3;
- (void)considerMyNewVisit:(id)a3;
- (void)dealloc;
- (void)onStartImplementation;
- (void)onStopImplementation;
- (void)stopLocationUpdatesForDelegate:(id)a3;
@end

@implementation MapsSuggestionsBaseLocationUpdater

- (id)dispatchQueue
{
  return self->_queue._innerQueue;
}

- (void)considerMyNewLocation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  MapsSuggestionsSetMostRecentLocation(a3);
  v4 = MapsSuggestionsCurrentBestLocation();
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Chose best location: %@", buf, 0xCu);
    }
  }
  locationObservers = self->_locationObservers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MapsSuggestionsBaseLocationUpdater_considerMyNewLocation___block_invoke;
  v8[3] = &unk_1E5CB9E70;
  id v7 = v4;
  id v9 = v7;
  [(MapsSuggestionsObservers *)locationObservers callBlock:v8];
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (MapsSuggestionsBaseLocationUpdater)initWithName:(id)a3 queue:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 41;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsBaseLocationUpdater initWithName:queue:]";
      __int16 v33 = 2082;
      v34 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v7)
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 42;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsBaseLocationUpdater initWithName:queue:]";
      __int16 v33 = 2082;
      v34 = "nil == (queue)";
      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue", buf, 0x26u);
    }
LABEL_11:

    v26 = 0;
    goto LABEL_12;
  }
  v29.receiver = self;
  v29.super_class = (Class)MapsSuggestionsBaseLocationUpdater;
  id v9 = [(MapsSuggestionsBaseLocationUpdater *)&v29 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    MSg::Queue::Queue((NSObject **)buf, v8);
    uint64_t v12 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v12;

    v14 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    v15 = v9->_queue._name;
    v9->_queue._name = v14;

    v16 = [MapsSuggestionsObservers alloc];
    v17 = v9->_queue._innerQueue;
    v18 = (void *)[[NSString alloc] initWithFormat:@"%@LocationObservers", v9->_name];
    uint64_t v19 = [(MapsSuggestionsObservers *)v16 initWithCallbackQueue:v17 name:v18];
    locationObservers = v9->_locationObservers;
    v9->_locationObservers = (MapsSuggestionsObservers *)v19;

    v21 = [MapsSuggestionsObservers alloc];
    v22 = v9->_queue._innerQueue;
    v23 = (void *)[[NSString alloc] initWithFormat:@"%@VisitObservers", v9->_name];
    uint64_t v24 = [(MapsSuggestionsObservers *)v21 initWithCallbackQueue:v22 name:v23];
    visitObservers = v9->_visitObservers;
    v9->_visitObservers = (MapsSuggestionsObservers *)v24;
  }
  self = v9;
  v26 = self;
LABEL_12:

  return v26;
}

void __60__MapsSuggestionsBaseLocationUpdater_considerMyNewLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [v3 uniqueName];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didUpdateLocation:%@", (uint8_t *)&v7, 0x16u);
    }
  }
  [v3 didUpdateLocation:*(void *)(a1 + 32)];
}

- (void)considerMyAllowanceAsLimited:(BOOL)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = MapsSuggestionsIsInCoarseLocation();
  if (v5 == v3)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      uint64_t v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "Location allowance is the same. Doing nothing.", (uint8_t *)&v13, 2u);
      }
    }
  }
  else
  {
    int v6 = v5;
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(MapsSuggestionsBaseLocationUpdater *)self uniqueName];
      __int16 v9 = (void *)v8;
      uint64_t v10 = "Precise";
      if (v6) {
        uint64_t v11 = "Coarse";
      }
      else {
        uint64_t v11 = "Precise";
      }
      int v13 = 138412802;
      uint64_t v14 = v8;
      v16 = v11;
      __int16 v15 = 2080;
      if (v3) {
        uint64_t v10 = "Coarse";
      }
      __int16 v17 = 2080;
      v18 = v10;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%@ is switched from %s to %s", (uint8_t *)&v13, 0x20u);
    }
    MapsSuggestionsSetInCoarseLocation(v3);
    if (v3)
    {
      MapsSuggestionsResetCurrentLocation();
      [(MapsSuggestionsObservers *)self->_locationObservers callBlock:&__block_literal_global_22];
    }
  }
}

void __70__MapsSuggestionsBaseLocationUpdater_startLocationUpdatesForDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    int v3 = WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(WeakRetained[2]);
      [(dispatch_queue_t *)v3 onStartImplementation];
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        int v6 = "MapsSuggestionsBaseLocationUpdater.mm";
        __int16 v7 = 1026;
        int v8 = 180;
        __int16 v9 = 2082;
        uint64_t v10 = "-[MapsSuggestionsBaseLocationUpdater startLocationUpdatesForDelegate:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (id)startLocationUpdatesForDelegate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater startLocationUpdatesForDelegate:%@", buf, 0xCu);
    }
    __int16 v7 = MapsSuggestionsCurrentBestLocation();
    objc_initWeak((id *)buf, self);
    locationObservers = self->_locationObservers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__MapsSuggestionsBaseLocationUpdater_startLocationUpdatesForDelegate___block_invoke;
    v11[3] = &unk_1E5CB8238;
    objc_copyWeak(&v12, (id *)buf);
    [(MapsSuggestionsObservers *)locationObservers registerObserver:v4 handler:v11];
    if ([v4 conformsToProtocol:&unk_1EFC91720]) {
      [(MapsSuggestionsObservers *)self->_visitObservers registerObserver:v4 handler:0];
    }
    [(MapsSuggestionsBaseLocationUpdater *)self considerMyNewLocation:v7];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      __int16 v15 = 1024;
      int v16 = 172;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsBaseLocationUpdater startLocationUpdatesForDelegate:]";
      __int16 v19 = 2082;
      v20 = "nil == (strongDelegate)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a delegate", buf, 0x26u);
    }

    __int16 v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  locationObservers = self->_locationObservers;
  self->_locationObservers = 0;

  visitObservers = self->_visitObservers;
  self->_visitObservers = 0;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsBaseLocationUpdater;
  [(MapsSuggestionsBaseLocationUpdater *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitObservers, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)hasObservers
{
  return [(MapsSuggestionsObservers *)self->_locationObservers count] != 0;
}

- (void)onStartImplementation
{
}

- (void)onStopImplementation
{
}

- (void)considerMyNewVisit:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MapsSuggestionsIsValidVisit(v4))
  {
    id v5 = v4;
    int v6 = v5;
    if (v5)
    {
      __int16 v7 = [v5 departureDate];
      if (v7
        && ([MEMORY[0x1E4F1C9C8] distantFuture],
            int v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v7 isEqualToDate:v8],
            v8,
            !v9))
      {
        uint64_t v10 = 2;
      }
      else
      {
        uint64_t v10 = 1;
      }
    }
    else
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
        __int16 v21 = 1024;
        int v22 = 93;
        __int16 v23 = 2082;
        uint64_t v24 = "_MapsSuggestionsVisitEventType _visitEventType(CLVisit *__strong)";
        __int16 v25 = 2082;
        v26 = "nil == (visit)";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a visit", buf, 0x26u);
      }

      uint64_t v10 = 0;
    }

    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      int v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = "arrival";
        if (v10 == 2) {
          uint64_t v14 = "departure";
        }
        *(_DWORD *)buf = 136315138;
        v20 = v14;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater visit %s", buf, 0xCu);
      }
    }
    visitObservers = self->_visitObservers;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__MapsSuggestionsBaseLocationUpdater_considerMyNewVisit___block_invoke;
    v16[3] = &unk_1E5CB9E98;
    uint64_t v18 = v10;
    __int16 v17 = v6;
    [(MapsSuggestionsObservers *)visitObservers callBlock:v16];
    uint64_t v11 = v17;
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (const char *)v4;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Dropping invalid visit: %@", buf, 0xCu);
    }
  }
}

void __57__MapsSuggestionsBaseLocationUpdater_considerMyNewVisit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 2)
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = [v3 uniqueName];
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLeaveVisit:%@", (uint8_t *)&v12, 0x16u);
    }
    [v3 didLeaveVisit:*(void *)(a1 + 32)];
  }
  else if (v4 == 1)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [v3 uniqueName];
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138412546;
      int v13 = v6;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v7;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "CALLING{%@} didEnterVisit:%@", (uint8_t *)&v12, 0x16u);
    }
    [v3 didEnterVisit:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 131;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&v15[6] = "-[MapsSuggestionsBaseLocationUpdater considerMyNewVisit:]_block_invoke";
      __int16 v16 = 2082;
      __int16 v17 = "YES";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsVisitEventType!", (uint8_t *)&v12, 0x26u);
    }
  }
}

void __67__MapsSuggestionsBaseLocationUpdater_considerMyAllowanceAsLimited___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [v2 uniqueName];
      int v5 = 138412290;
      int v6 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLoseLocationPermission", (uint8_t *)&v5, 0xCu);
    }
  }
  [v2 didLoseLocationPermission];
}

- (void)stopLocationUpdatesForDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  int v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4 uniqueName];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater stopLocationUpdatesForDelegate:%@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  locationObservers = self->_locationObservers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MapsSuggestionsBaseLocationUpdater_stopLocationUpdatesForDelegate___block_invoke;
  v8[3] = &unk_1E5CB8238;
  objc_copyWeak(&v9, (id *)buf);
  [(MapsSuggestionsObservers *)locationObservers unregisterObserver:v4 handler:v8];
  if ([v4 conformsToProtocol:&unk_1EFC91720]) {
    [(MapsSuggestionsObservers *)self->_visitObservers unregisterObserver:v4 handler:0];
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __69__MapsSuggestionsBaseLocationUpdater_stopLocationUpdatesForDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained onStopImplementation];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        int v6 = "MapsSuggestionsBaseLocationUpdater.mm";
        __int16 v7 = 1026;
        int v8 = 203;
        __int16 v9 = 2082;
        uint64_t v10 = "-[MapsSuggestionsBaseLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (id)restartLocationUpdatesForDelegate:(id)a3
{
  id v4 = a3;
  [(MapsSuggestionsBaseLocationUpdater *)self stopLocationUpdatesForDelegate:v4];
  int v5 = [(MapsSuggestionsBaseLocationUpdater *)self startLocationUpdatesForDelegate:v4];

  return v5;
}

- (void)awaitQueue
{
}

void __48__MapsSuggestionsBaseLocationUpdater_awaitQueue__block_invoke()
{
}

- (unint64_t)countLocationObservers
{
  return [(MapsSuggestionsObservers *)self->_locationObservers count];
}

@end