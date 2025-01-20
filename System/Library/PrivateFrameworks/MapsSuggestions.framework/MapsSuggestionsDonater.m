@interface MapsSuggestionsDonater
- (BOOL)donateETA:(id)a3 entry:(id)a4;
- (BOOL)donateFlightLookupWithFlightNumber:(id)a3 departureAirportCode:(id)a4 departureTime:(id)a5;
- (BOOL)donateSignalPack:(id)a3;
- (MapsSuggestionsDonater)init;
- (NSString)uniqueName;
- (void)_closeConnection;
- (void)_openConnectionIfNecessary;
- (void)_scheduleCloseConnection;
- (void)_unscheduleCloseConnection;
- (void)dealloc;
@end

@implementation MapsSuggestionsDonater

- (MapsSuggestionsDonater)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsDonater;
  v2 = [(MapsSuggestionsDonater *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsDonaterQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    closeTimer = v2->_closeTimer;
    v2->_closeTimer = 0;

    connection = v2->_connection;
    v2->_connection = 0;
  }
  return v2;
}

- (void)_openConnectionIfNecessary
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.maps.destinationd.donations" options:0];
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCA4870];
    [v2 setRemoteObjectInterface:v3];

    [v2 setExportedObject:a1];
    objc_initWeak(&location, (id)a1);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke;
    v12[3] = &unk_1E5CB8058;
    objc_copyWeak(&v13, &location);
    [v2 setInvalidationHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_197;
    v10[3] = &unk_1E5CB8058;
    objc_copyWeak(&v11, &location);
    [v2 setInterruptionHandler:v10];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_199;
    v8 = &unk_1E5CB80A8;
    objc_copyWeak(&v9, &location);
    id v4 = (id)[v2 remoteObjectProxyWithErrorHandler:&v5];
    objc_storeStrong((id *)(a1 + 16), v2);
    objc_msgSend(v2, "resume", v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__MapsSuggestionsDonater_donateSignalPack___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _openConnectionIfNecessary]((uint64_t)WeakRetained);
    uint64_t v5 = [v4[2] remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__MapsSuggestionsDonater_donateSignalPack___block_invoke_130;
    v8[3] = &unk_1E5CB8058;
    objc_copyWeak(&v9, v2);
    [v5 donateSignalPackData:v6 handler:v8];

    -[MapsSuggestionsDonater _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v11 = "MapsSuggestionsDonater.m";
      __int16 v12 = 1026;
      int v13 = 116;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsDonater donateSignalPack:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_scheduleCloseConnection
{
  dispatch_assert_queue_V2(a1[1]);
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", (uint8_t *)v13, 2u);
  }

  dispatch_assert_queue_V2(a1[1]);
  if (!a1[3])
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)v13, 2u);
    }

    objc_initWeak(&location, a1);
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1[1]);
    dispatch_queue_t v5 = a1[3];
    a1[3] = v4;

    dispatch_source_set_timer(a1[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v6 = a1[3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__MapsSuggestionsDonater__initCloseTimerIfNecessary__block_invoke;
    v13[3] = &unk_1E5CB8058;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v6, v13);
    dispatch_resume(a1[3]);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  GEOConfigGetDouble();
  double v8 = v7;
  GEOConfigGetDouble();
  double v10 = v9;
  id v11 = a1[3];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));
}

- (BOOL)donateSignalPack:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = (char *)a3;
  dispatch_queue_t v5 = GEOFindOrCreateLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v7 = [(MapsSuggestionsDonater *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      __int16 v19 = 2080;
      *(void *)v20 = "donateSignalPack";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    double v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "donateSignalPack", "", buf, 2u);
    }

    double v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "Donating SignalPack %@", buf, 0xCu);
    }

    double v10 = [v4 data];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__MapsSuggestionsDonater_donateSignalPack___block_invoke;
    v14[3] = &unk_1E5CB7BE0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v10;
    id v12 = v10;
    dispatch_async(queue, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      __int16 v19 = 1024;
      *(_DWORD *)v20 = 107;
      *(_WORD *)&v20[4] = 2082;
      *(void *)&v20[6] = "-[MapsSuggestionsDonater donateSignalPack:]";
      __int16 v21 = 2082;
      v22 = "nil == (signalPack)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. signalPack should not be nil", buf, 0x26u);
    }
  }
  return v4 != 0;
}

void __43__MapsSuggestionsDonater_donateSignalPack___block_invoke_130(uint64_t a1)
{
  *(void *)&v9[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      dispatch_source_t v4 = [WeakRetained uniqueName];
      int v6 = 138412546;
      double v7 = v4;
      __int16 v8 = 2080;
      *(void *)double v9 = "donateSignalPack";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
    }
    dispatch_queue_t v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "donateSignalPack", "", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    dispatch_queue_t v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      double v7 = "MapsSuggestionsDonater.m";
      __int16 v8 = 1026;
      *(_DWORD *)double v9 = 120;
      v9[2] = 2082;
      *(void *)&v9[3] = "-[MapsSuggestionsDonater donateSignalPack:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsDonater _closeConnection](self);
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsDonater;
  [(MapsSuggestionsDonater *)&v4 dealloc];
}

- (void)_unscheduleCloseConnection
{
  if (a1)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v5, 2u);
    }

    v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 24));
      objc_super v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
  }
}

- (void)_closeConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = [a1 uniqueName];
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2080;
      int v13 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v10, 0x16u);
    }
    objc_super v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v10, 2u);
    }

    dispatch_queue_t v5 = (void *)a1[2];
    if (v5)
    {
      a1[2] = 0;
      id v6 = v5;

      [v6 setInterruptionHandler:0];
      [v6 setInvalidationHandler:0];
      [v6 invalidate];
    }
    -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)a1);
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = [a1 uniqueName];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      int v13 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
    }
    double v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v10, 2u);
    }
  }
}

- (BOOL)donateETA:(id)a3 entry:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  if (!v6)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      __int16 v26 = 1024;
      *(_DWORD *)v27 = 82;
      *(_WORD *)&v27[4] = 2082;
      *(void *)&v27[6] = "-[MapsSuggestionsDonater donateETA:entry:]";
      __int16 v28 = 2082;
      v29 = "nil == (eta)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA", buf, 0x26u);
    }

    goto LABEL_16;
  }
  __int16 v8 = GEOFindOrCreateLog();
  double v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      __int16 v26 = 1024;
      *(_DWORD *)v27 = 83;
      *(_WORD *)&v27[4] = 2082;
      *(void *)&v27[6] = "-[MapsSuggestionsDonater donateETA:entry:]";
      __int16 v28 = 2082;
      v29 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestions entry", buf, 0x26u);
    }

LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = [(MapsSuggestionsDonater *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    __int16 v26 = 2080;
    *(void *)v27 = "donateETA:entry:";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v11 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "donateETA:entry:", "", buf, 2u);
  }

  __int16 v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    __int16 v26 = 2112;
    *(void *)v27 = v13;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "Donating ETA %@ for Entry %@", buf, 0x16u);
  }
  uint64_t v14 = [v6 data];
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MapsSuggestionsDonater_donateETA_entry___block_invoke;
  block[3] = &unk_1E5CB8080;
  objc_copyWeak(&v23, (id *)buf);
  id v21 = v14;
  id v22 = v7;
  id v16 = v14;
  dispatch_async(queue, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

void __42__MapsSuggestionsDonater_donateETA_entry___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _openConnectionIfNecessary]((uint64_t)WeakRetained);
    dispatch_queue_t v5 = [v4[2] remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = MapsSuggestionsDestinationKey(*(void **)(a1 + 40));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MapsSuggestionsDonater_donateETA_entry___block_invoke_126;
    v9[3] = &unk_1E5CB8058;
    objc_copyWeak(&v10, v2);
    [v5 donateETAData:v6 destinationKey:v7 handler:v9];

    -[MapsSuggestionsDonater _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v10);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v12 = "MapsSuggestionsDonater.m";
      __int16 v13 = 1026;
      int v14 = 92;
      __int16 v15 = 2082;
      id v16 = "-[MapsSuggestionsDonater donateETA:entry:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __42__MapsSuggestionsDonater_donateETA_entry___block_invoke_126(uint64_t a1)
{
  *(void *)&v9[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = [WeakRetained uniqueName];
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 2080;
      *(void *)double v9 = "donateETA:entry:";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
    }
    dispatch_queue_t v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "donateETA:entry:", "", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    dispatch_queue_t v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsDonater.m";
      __int16 v8 = 1026;
      *(_DWORD *)double v9 = 97;
      v9[2] = 2082;
      *(void *)&v9[3] = "-[MapsSuggestionsDonater donateETA:entry:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (BOOL)donateFlightLookupWithFlightNumber:(id)a3 departureAirportCode:(id)a4 departureTime:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
    __int16 v27 = 1024;
    int v28 = 133;
    __int16 v29 = 2082;
    uint64_t v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
    __int16 v31 = 2082;
    v32 = "nil == (fullFlightNumber)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a full flight number";
LABEL_14:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v8)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
    __int16 v27 = 1024;
    int v28 = 134;
    __int16 v29 = 2082;
    uint64_t v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
    __int16 v31 = 2082;
    v32 = "nil == (departureAirportCode)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a departure airport IATA code";
    goto LABEL_14;
  }
  if (!v9)
  {
    __int16 v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      __int16 v27 = 1024;
      int v28 = 135;
      __int16 v29 = 2082;
      uint64_t v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
      __int16 v31 = 2082;
      v32 = "nil == (departureTime)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a scheduled departure time";
      goto LABEL_14;
    }
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_21;
  }
  v23[0] = @"fullFlightNumber";
  v23[1] = @"departureAirportCode";
  v24[0] = v7;
  v24[1] = v8;
  v23[2] = @"departureTimeSince1970";
  id v11 = NSNumber;
  [v9 timeIntervalSince1970];
  __int16 v12 = objc_msgSend(v11, "numberWithDouble:");
  v24[2] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  int v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v22 = 0;
    __int16 v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v22];
    id v16 = (char *)v22;
    if (v16 || !v15)
    {
      v20 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v26 = v16;
        _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "Failed to encode to JSON: %@", buf, 0xCu);
      }

      uint64_t v17 = &stru_1EFC640F8;
    }
    else
    {
      uint64_t v17 = (__CFString *)[[NSString alloc] initWithData:v15 encoding:4];
    }

    *(_DWORD *)buf = 138412290;
    __int16 v26 = (const char *)v17;
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Donated: %@", buf, 0xCu);
  }
  BOOL v19 = 1;
LABEL_21:

  return v19;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_196;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_queue_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v9 = "MapsSuggestionsDonater.m";
      __int16 v10 = 1026;
      int v11 = 176;
      __int16 v12 = 2082;
      __int16 v13 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_196(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = (char *)WeakRetained[2];
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v7, 0xCu);
    }

    dispatch_queue_t v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    int v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsDonater.m";
      __int16 v9 = 1026;
      int v10 = 178;
      __int16 v11 = 2082;
      __int16 v12 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_197(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_198;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_queue_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v9 = "MapsSuggestionsDonater.m";
      __int16 v10 = 1026;
      int v11 = 186;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_198(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = (char *)WeakRetained[2];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v6, 0xCu);
    }

    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    dispatch_queue_t v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsDonater.m";
      __int16 v8 = 1026;
      int v9 = 188;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_199(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_200;
    v9[3] = &unk_1E5CB7BE0;
    objc_copyWeak(&v11, v4);
    id v10 = v3;
    dispatch_async(v7, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v13 = "MapsSuggestionsDonater.m";
      __int16 v14 = 1026;
      int v15 = 195;
      __int16 v16 = 2082;
      uint64_t v17 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_200(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  objc_super v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      dispatch_queue_t v5 = (char *)WeakRetained[2];
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      int v9 = v5;
      __int16 v10 = 2112;
      *(void *)id v11 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v8, 0x16u);
    }

    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    id v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      int v9 = "MapsSuggestionsDonater.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 197;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsDonater__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      dispatch_queue_t v5 = "MapsSuggestionsDonater.m";
      __int16 v6 = 1026;
      int v7 = 248;
      __int16 v8 = 2082;
      int v9 = "-[MapsSuggestionsDonater _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end