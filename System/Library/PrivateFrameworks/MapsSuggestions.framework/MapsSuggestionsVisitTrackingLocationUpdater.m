@interface MapsSuggestionsVisitTrackingLocationUpdater
+ (BOOL)_isDefinitelyOutsideOfVisit:(id)a3 location:(id)a4 allowingBuffer:(double)a5;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)initDecoratingLocationUpdater:(id)a3;
- (id)restartLocationUpdatesForDelegate:(id)a3;
- (id)startLocationUpdatesForDelegate:(id)a3;
- (void)awaitQueue;
- (void)dealloc;
- (void)didEnterVisit:(id)a3;
- (void)didLeaveVisit:(id)a3;
- (void)didLoseLocationPermission;
- (void)didUpdateLocation:(id)a3;
- (void)stopLocationUpdatesForDelegate:(id)a3;
@end

@implementation MapsSuggestionsVisitTrackingLocationUpdater

- (id)initDecoratingLocationUpdater:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsVisitTrackingLocationUpdater;
  v6 = [(MapsSuggestionsVisitTrackingLocationUpdater *)&v25 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v23, @"MapsSuggestionsVisitTrackingLocationUpdaterQueue", v7);
    dispatch_queue_t v8 = v23;
    dispatch_queue_t v23 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v24;
    v24 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    objc_storeStrong((id *)&v6->_wrappedLocationUpdater, a3);
    currentVisit = v6->_currentVisit;
    v6->_currentVisit = 0;

    v13 = [MapsSuggestionsObservers alloc];
    v14 = v6->_queue._innerQueue;
    uint64_t v15 = [(MapsSuggestionsObservers *)v13 initWithCallbackQueue:v14 name:@"MapsSuggestionsVisitTrackingLocationUpdaterLocationObservers"];
    locationObservers = v6->_locationObservers;
    v6->_locationObservers = (MapsSuggestionsObservers *)v15;

    v17 = [MapsSuggestionsObservers alloc];
    v18 = v6->_queue._innerQueue;
    uint64_t v19 = [(MapsSuggestionsObservers *)v17 initWithCallbackQueue:v18 name:@"MapsSuggestionsVisitTrackingLocationUpdaterVisitObservers"];
    visitObservers = v6->_visitObservers;
    v6->_visitObservers = (MapsSuggestionsObservers *)v19;

    GEOConfigGetDouble();
    v6->_distanceBuffer = v21;
  }

  return v6;
}

- (void)dealloc
{
  locationObservers = self->_locationObservers;
  self->_locationObservers = 0;

  visitObservers = self->_visitObservers;
  self->_visitObservers = 0;

  innerQueue = self->_queue._innerQueue;
  self->_queue._innerQueue = 0;

  name = self->_queue._name;
  self->_queue._name = 0;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsVisitTrackingLocationUpdater;
  [(MapsSuggestionsVisitTrackingLocationUpdater *)&v7 dealloc];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (id)restartLocationUpdatesForDelegate:(id)a3
{
  id v4 = a3;
  [(MapsSuggestionsVisitTrackingLocationUpdater *)self stopLocationUpdatesForDelegate:v4];
  id v5 = [(MapsSuggestionsVisitTrackingLocationUpdater *)self startLocationUpdatesForDelegate:v4];

  return v5;
}

- (id)startLocationUpdatesForDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "VisitTrackingLocationUpdater startLocationUpdatesForDelegate:%@", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke;
    v13[3] = &unk_1E5CBA4E8;
    v13[4] = self;
    id v14 = v4;
    objc_copyWeak(&v15, &location);
    objc_super v7 = v13;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__17;
    *(void *)&buf[32] = __Block_byref_object_dispose__17;
    id v21 = 0;
    innerQueue = self->_queue._innerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZNK3MSg5Queue4syncIU8__strongP10CLLocationEET_U13block_pointerFS5_vE_block_invoke;
    block[3] = &unk_1E5CB7EC8;
    id v18 = v7;
    uint64_t v19 = buf;
    v9 = v7;
    dispatch_sync(innerQueue, block);
    id v10 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitTrackingLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 107;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsVisitTrackingLocationUpdater startLocationUpdatesForDelegate:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (delegate)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a delegate", buf, 0x26u);
    }

    id v10 = 0;
  }

  return v10;
}

id __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke_2;
  v6[3] = &unk_1E5CB8238;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  [v3 registerObserver:v2 handler:v6];
  if ([*(id *)(a1 + 40) conformsToProtocol:&unk_1EFC91720]) {
    [*(id *)(*(void *)(a1 + 32) + 56) registerObserver:*(void *)(a1 + 40) handler:0];
  }
  id v4 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_destroyWeak(&v7);
  return v4;
}

void __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v5 = [*((id *)WeakRetained + 3) startLocationUpdatesForDelegate:WeakRetained];
      v6 = (void *)v4[4];
      v4[4] = v5;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v10 = 1026;
      int v11 = 115;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsVisitTrackingLocationUpdater startLocationUpdatesForDelegate:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)stopLocationUpdatesForDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 uniqueName];
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "VisitTrackingLocationUpdater stopLocationUpdatesForDelegate:%@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke;
  v9[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  innerQueue = self->_queue._innerQueue;
  id v8 = v4;
  dispatch_async(innerQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[6];
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke_68;
    v8[3] = &unk_1E5CB8238;
    objc_copyWeak(&v9, v2);
    [v5 unregisterObserver:v6 handler:v8];
    if ([*(id *)(a1 + 32) conformsToProtocol:&unk_1EFC91720]) {
      [v4[7] unregisterObserver:*(void *)(a1 + 32) handler:0];
    }
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v12 = 1026;
      int v13 = 135;
      __int16 v14 = 2082;
      id v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke_68(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2) {
      [WeakRetained[3] stopLocationUpdatesForDelegate:WeakRetained];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v8 = 1026;
      int v9 = 137;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsVisitTrackingLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke;
  block[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  innerQueue = self->_queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke(uint64_t a1)
{
  *(void *)&v16[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) copy];
    id v4 = (void *)WeakRetained[4];
    WeakRetained[4] = v3;

    id v5 = (void *)WeakRetained[6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke_70;
    v11[3] = &unk_1E5CB9E70;
    uint64_t v12 = *(id *)(a1 + 32);
    [v5 callBlock:v11];
    uint64_t v6 = WeakRetained[5];
    if (v6
      && +[MapsSuggestionsVisitTrackingLocationUpdater _isDefinitelyOutsideOfVisit:v6 location:*(void *)(a1 + 32) allowingBuffer:*((double *)WeakRetained + 8)])
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (char *)WeakRetained[5];
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        __int16 v14 = v8;
        __int16 v15 = 2112;
        *(void *)uint64_t v16 = v9;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_INFO, "DETECTED EXIT (visit=%@ location=%@)", buf, 0x16u);
      }

      [WeakRetained didLeaveVisit:WeakRetained[5]];
    }
    __int16 v10 = v12;
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v15 = 1026;
      *(_DWORD *)uint64_t v16 = 155;
      v16[2] = 2082;
      *(void *)&v16[3] = "-[MapsSuggestionsVisitTrackingLocationUpdater didUpdateLocation:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 uniqueName];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didUpdateLocation:%@", (uint8_t *)&v7, 0x16u);
    }
  }
  [v3 didUpdateLocation:*(void *)(a1 + 32)];
}

- (void)didLoseLocationPermission
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke;
  v3[3] = &unk_1E5CB7E78;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Wiping latest location", (uint8_t *)&v5, 2u);
    }

    id v3 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = 0;

    [*((id *)WeakRetained + 7) callBlock:&__block_literal_global_27];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v7 = 1026;
      int v8 = 180;
      __int16 v9 = 2082;
      uint64_t v10 = "-[MapsSuggestionsVisitTrackingLocationUpdater didLoseLocationPermission]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  GEOFindOrCreateLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [v2 uniqueName];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLoseLocationPermission", (uint8_t *)&v5, 0xCu);
  }
  [v2 didLoseLocationPermission];
}

- (void)didEnterVisit:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke;
  block[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  innerQueue = self->_queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[5])
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitTrackingLocationUpdater.mm";
        __int16 v12 = 1024;
        int v13 = 197;
        __int16 v14 = 2082;
        __int16 v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didEnterVisit:]_block_invoke";
        __int16 v16 = 2082;
        v17 = "nil != strongSelf->_currentVisit";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We were already in a Visit! CoreRoutine says that is not possible!", buf, 0x26u);
      }
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) copy];
      id v6 = (void *)v3[5];
      v3[5] = v5;

      uint64_t v7 = (void *)v3[7];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke_76;
      v8[3] = &unk_1E5CBA530;
      id v9 = *(id *)(a1 + 32);
      [v7 callBlock:v8];
      id v4 = v9;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v12 = 1026;
      int v13 = 196;
      __int16 v14 = 2082;
      __int16 v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didEnterVisit:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 uniqueName];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didEnterVisit:%@", (uint8_t *)&v7, 0x16u);
  }
  [v3 didEnterVisit:*(void *)(a1 + 32)];
}

- (void)didLeaveVisit:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke;
  block[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  innerQueue = self->_queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[5];
    if (v4)
    {
      WeakRetained[5] = 0;

      uint64_t v5 = (void *)v3[7];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke_77;
      v8[3] = &unk_1E5CBA530;
      id v9 = *(id *)(a1 + 32);
      [v5 callBlock:v8];
      id v6 = v9;
    }
    else
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = *(char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_INFO, "IGNORED LATE EXIT (visit=%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      __int16 v12 = 1026;
      int v13 = 213;
      __int16 v14 = 2082;
      __int16 v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didLeaveVisit:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 uniqueName];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLeaveVisit:%@", (uint8_t *)&v7, 0x16u);
  }
  [v3 didLeaveVisit:*(void *)(a1 + 32)];
}

+ (BOOL)_isDefinitelyOutsideOfVisit:(id)a3 location:(id)a4 allowingBuffer:(double)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!MapsSuggestionsIsValidVisit(v7))
  {
    uint64_t v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "Cannot use invalid visit: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!MapsSuggestionsIsValidLocation(v8))
  {
    uint64_t v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "Cannot use invalid location: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_9:

    BOOL v18 = 0;
    goto LABEL_10;
  }
  [v7 coordinate];
  *(void *)&long long buf = v9;
  *((void *)&buf + 1) = v10;
  [v8 coordinate];
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  CLLocationCoordinate2DGetDistanceFrom();
  double v14 = v13;
  objc_msgSend(v8, "horizontalAccuracy", v21, v22);
  double v16 = v15;
  [v7 horizontalAccuracy];
  BOOL v18 = v14 > v16 + v17 + a5;
LABEL_10:

  return v18;
}

- (void)awaitQueue
{
}

void __57__MapsSuggestionsVisitTrackingLocationUpdater_awaitQueue__block_invoke()
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitObservers, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_currentVisit, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_wrappedLocationUpdater, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end