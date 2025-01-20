@interface MapsSuggestionsPredictor
+ (id)sharedPredictor;
- (BOOL)predictedTransportModeForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (BOOL)predictedTransportModeForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (MapsSuggestionsPredictor)init;
- (NSString)uniqueName;
- (void)_closeConnection;
- (void)_openConnectionIfNecessary;
- (void)_scheduleCloseConnection;
- (void)_unscheduleCloseConnection;
- (void)cancelCapturingAnalytics;
- (void)captureActualTransportationMode:(int)a3 originMapItem:(id)a4 destinationMapItem:(id)a5;
- (void)capturePredictedTransportationMode:(int)a3;
- (void)dealloc;
- (void)storeSignalPack:(id)a3 forMapItem:(id)a4 andEntry:(id)a5;
@end

@implementation MapsSuggestionsPredictor

+ (id)sharedPredictor
{
  if (_MergedGlobals_40 != -1) {
    dispatch_once(&_MergedGlobals_40, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB6F0288;
  return v2;
}

void __64__MapsSuggestionsPredictor_storeSignalPack_forMapItem_andEntry___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      [WeakRetained[4] insertMapItem:v4 signalPack:*(void *)(a1 + 40) entry:*(void *)(a1 + 48)];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      v7 = "MapsSuggestionsPredictor.m";
      __int16 v8 = 1026;
      int v9 = 123;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsPredictor storeSignalPack:forMapItem:andEntry:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)storeSignalPack:(id)a3 forMapItem:(id)a4 andEntry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MapsSuggestionsPredictor_storeSignalPack_forMapItem_andEntry___block_invoke;
  block[3] = &unk_1E5CB9980;
  objc_copyWeak(&v19, &location);
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __43__MapsSuggestionsPredictor_sharedPredictor__block_invoke()
{
  v0 = objc_alloc_init(MapsSuggestionsPredictor);
  v1 = (void *)qword_1EB6F0288;
  qword_1EB6F0288 = (uint64_t)v0;
}

- (MapsSuggestionsPredictor)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsPredictor;
  v2 = [(MapsSuggestionsPredictor *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsPredictorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    closeTimer = v2->_closeTimer;
    v2->_closeTimer = 0;

    connection = v2->_connection;
    v2->_connection = 0;

    id v8 = objc_alloc_init(MapsSuggestionsSignalPackCache);
    signalPackCache = v2->_signalPackCache;
    v2->_signalPackCache = v8;

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int BOOL = GEOConfigGetBOOL();
      id v12 = @"NO";
      if (BOOL) {
        id v12 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Are we collecting CarPlay Analytics? %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsPredictor _closeConnection](self);
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsPredictor;
  [(MapsSuggestionsPredictor *)&v4 dealloc];
}

- (void)_unscheduleCloseConnection
{
  if (a1)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
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
      v11 = v3;
      __int16 v12 = 2080;
      id v13 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v10, 0x16u);
    }
    objc_super v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v10, 2u);
    }

    v5 = (void *)a1[2];
    if (v5)
    {
      a1[2] = 0;
      id v6 = v5;

      [v6 setInterruptionHandler:0];
      [v6 setInvalidationHandler:0];
      [v6 invalidate];
    }
    -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)a1);
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a1 uniqueName];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2080;
      id v13 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v10, 2u);
    }
  }
}

- (BOOL)predictedTransportModeForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v27 = 1024;
      *(_DWORD *)v28 = 74;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]";
      __int16 v29 = 2082;
      v30 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }

    goto LABEL_16;
  }
  v11 = GEOFindOrCreateLog();
  __int16 v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v27 = 1024;
      *(_DWORD *)v28 = 75;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]";
      __int16 v29 = 2082;
      v30 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an MSg entry", buf, 0x26u);
    }

LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(MapsSuggestionsPredictor *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v26 = v13;
    __int16 v27 = 2080;
    *(void *)v28 = "predictedTransportModeForDestinationEntry";
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v14 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", "", buf, 2u);
  }

  v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [v9 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Predicting transport type for Entry %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke;
  block[3] = &unk_1E5CB9958;
  objc_copyWeak(v24, (id *)buf);
  id v22 = v9;
  v24[1] = *(id *)&latitude;
  v24[2] = *(id *)&longitude;
  id v23 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

void __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsPredictor _openConnectionIfNecessary]((uint64_t)WeakRetained);
    v5 = [v4[2] remoteObjectProxy];
    id v6 = [*(id *)(a1 + 32) data];
    v7 = NSDataFromCLLocationCoordinate(*(double *)(a1 + 56), *(double *)(a1 + 64));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke_26;
    v9[3] = &unk_1E5CB9930;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    [v5 predictedTransportModeForDestinationEntryData:v6 originCoordinateData:v7 handler:v9];

    -[MapsSuggestionsPredictor _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v14 = "MapsSuggestionsPredictor.m";
      __int16 v15 = 1026;
      int v16 = 82;
      __int16 v17 = 2082;
      BOOL v18 = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_openConnectionIfNecessary
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(void *)(a1 + 16))
  {
    v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCA4990];
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v3 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:0 ofReply:1];

    objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v4 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:1 ofReply:1];

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v5 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:2 ofReply:1];

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v6 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:0 ofReply:0];

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v7 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:1 ofReply:0];

    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v8 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:0 ofReply:1];

    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v9 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:1 ofReply:1];

    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v10 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:2 ofReply:1];

    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v11 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:0 ofReply:0];

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v2 setClasses:v12 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:1 ofReply:0];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.maps.destinationd.predictions" options:0];
    [v13 setRemoteObjectInterface:v2];
    objc_initWeak(&location, (id)a1);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke;
    v19[3] = &unk_1E5CB8058;
    objc_copyWeak(&v20, &location);
    [v13 setInvalidationHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_44;
    v17[3] = &unk_1E5CB8058;
    objc_copyWeak(&v18, &location);
    [v13 setInterruptionHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_46;
    v15[3] = &unk_1E5CB80A8;
    objc_copyWeak(&v16, &location);
    id v14 = (id)[v13 remoteObjectProxyWithErrorHandler:v15];
    objc_storeStrong((id *)(a1 + 16), v13);
    [v13 resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke_26(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7 && !v9)
    {
      id v23 = 0;
      id v11 = NSDataToMapsSuggestionsTransportModes(v7, (uint64_t)&v23);
      id v12 = v23;
      if (v12)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [WeakRetained uniqueName];
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          __int16 v26 = 2080;
          *(void *)__int16 v27 = "predictedTransportModeForDestinationEntry";
          _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        __int16 v15 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v15)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
      }
      else
      {
        uint64_t v19 = +[MapsSuggestionsSignalPack signalPackFromData:v8];
        id v20 = [*(id *)(a1 + 32) geoMapItem];
        [WeakRetained storeSignalPack:v19 forMapItem:v20 andEntry:*(void *)(a1 + 32)];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        v21 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          id v22 = [WeakRetained uniqueName];
          *(_DWORD *)buf = 138412546;
          v25 = v22;
          __int16 v26 = 2080;
          *(void *)__int16 v27 = "predictedTransportModeForDestinationEntry";
          _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        __int16 v15 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v15)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", "", buf, 2u);
LABEL_23:

      goto LABEL_24;
    }
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "Error when predicting TransportType for Entry: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      __int16 v26 = 2080;
      *(void *)__int16 v27 = "predictedTransportModeForDestinationEntry";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    id v12 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "MapsSuggestionsPredictor.m";
      __int16 v26 = 1026;
      *(_DWORD *)__int16 v27 = 86;
      v27[2] = 2082;
      *(void *)&v27[3] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_24:
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
    id v6 = a1[3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__MapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke;
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

- (BOOL)predictedTransportModeForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = 136;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]";
      __int16 v32 = 2082;
      v33 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }

    goto LABEL_16;
  }
  id v11 = GEOFindOrCreateLog();
  dispatch_time_t v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = 137;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]";
      __int16 v32 = 2082;
      v33 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }

LABEL_16:
    BOOL v21 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(MapsSuggestionsPredictor *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v29 = v13;
    __int16 v30 = 2080;
    *(void *)uint64_t v31 = "predictedTransportModeForDestinationMapItem";
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v14 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", "", buf, 2u);
  }

  __int16 v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [v9 coordinate];
    id v18 = [NSString stringWithFormat:@"%+.8f, %+.8f", v16, v17];
    uint64_t v19 = [v9 addressDictionary];
    *(_DWORD *)buf = 138412546;
    __int16 v29 = v18;
    __int16 v30 = 2112;
    *(void *)uint64_t v31 = v19;
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Predicting transport type for mapItem %@, %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke;
  block[3] = &unk_1E5CB9958;
  objc_copyWeak(v27, (id *)buf);
  id v25 = v9;
  v27[1] = *(id *)&latitude;
  v27[2] = *(id *)&longitude;
  id v26 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);
  BOOL v21 = 1;
LABEL_17:

  return v21;
}

void __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_source_t v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsPredictor _openConnectionIfNecessary]((uint64_t)WeakRetained);
    dispatch_queue_t v5 = [v4[2] remoteObjectProxy];
    id v6 = [*(id *)(a1 + 32) data];
    double v7 = NSDataFromCLLocationCoordinate(*(double *)(a1 + 56), *(double *)(a1 + 64));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke_31;
    v9[3] = &unk_1E5CB9930;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    [v5 predictedTransportModeForDestinationMapItemData:v6 originCoordinateData:v7 handler:v9];

    -[MapsSuggestionsPredictor _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    double v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v14 = "MapsSuggestionsPredictor.m";
      __int16 v15 = 1026;
      int v16 = 144;
      __int16 v17 = 2082;
      id v18 = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(void *)&v26[13] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7 && !v9)
    {
      id v22 = 0;
      id v11 = NSDataToMapsSuggestionsTransportModes(v7, (uint64_t)&v22);
      id v12 = v22;
      if (v12)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [WeakRetained uniqueName];
          *(_DWORD *)buf = 138412546;
          v24 = v14;
          __int16 v25 = 2080;
          *(void *)id v26 = "predictedTransportModeForDestinationMapItem";
          _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
        }
        __int16 v15 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v15)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
      }
      else
      {
        uint64_t v19 = +[MapsSuggestionsSignalPack signalPackFromData:v8];
        [WeakRetained storeSignalPack:v19 forMapItem:*(void *)(a1 + 32) andEntry:0];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v20 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          BOOL v21 = [WeakRetained uniqueName];
          *(_DWORD *)buf = 138412546;
          v24 = v21;
          __int16 v25 = 2080;
          *(void *)id v26 = "predictedTransportModeForDestinationMapItem";
          _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        __int16 v15 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v15)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", "", buf, 2u);
LABEL_23:

      goto LABEL_24;
    }
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "Error when predicting TransportType for Entry: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      __int16 v25 = 2080;
      *(void *)id v26 = "predictedTransportModeForDestinationMapItem";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    id v12 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "MapsSuggestionsPredictor.m";
      __int16 v25 = 1026;
      *(_DWORD *)id v26 = 149;
      v26[2] = 2082;
      *(void *)&v26[3] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handl"
                           "er:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_24:
}

void __74__MapsSuggestionsPredictor__overrideTempPredictedTransportModeForCarPlay___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (int *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsPredictor.m";
      __int16 v9 = 1026;
      int v10 = 187;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsPredictor _overrideTempPredictedTransportModeForCarPlay:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_13;
  }
  if ([*(id *)(a1 + 32) hasType:20])
  {
    [*(id *)(a1 + 32) valueForSignalType:20];
    if (v3 != 0.0)
    {
      if (WeakRetained[10])
      {
        dispatch_source_t v4 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          MapsSuggestionsLocalizedStringFromGEOTransportType(WeakRetained[10]);
          dispatch_queue_t v5 = (char *)objc_claimAutoreleasedReturnValue();
          int v7 = 138412290;
          id v8 = v5;
          _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "_tempPredictedTransportMode is not GEOTransportType_AUTOMOBILE. It is %@. Fixing it.", (uint8_t *)&v7, 0xCu);
        }
      }
      WeakRetained[10] = 0;
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Forcing _tempPredictedTransportMode to be GEOTransportType_AUTOMOBILE", (uint8_t *)&v7, 2u);
      }
LABEL_13:
    }
  }
}

- (void)captureActualTransportationMode:(int)a3 originMapItem:(id)a4 destinationMapItem:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v19 = 1024;
      int v20 = 225;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]";
      __int16 v23 = 2082;
      v24 = "nil == (destinationMapItem)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. destinationMapItem cannot be nil";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v8)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      __int16 v19 = 1024;
      int v20 = 226;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]";
      __int16 v23 = 2082;
      v24 = "nil == (originMapItem)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. originMapItem cannot be nil";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke;
  v13[3] = &unk_1E5CB99F8;
  objc_copyWeak(&v16, (id *)location);
  id v14 = v9;
  id v15 = v8;
  int v17 = a3;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)location);
LABEL_10:
}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__9;
    uint64_t v31 = __Block_byref_object_dispose__9;
    dispatch_queue_t v5 = [WeakRetained[4] signalPackForMapItem:*(void *)(a1 + 32)];
    id v32 = (id)[v5 mutableCopy];

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    id v6 = dispatch_group_create();
    [*(id *)(a1 + 40) coordinate];
    id v9 = NSDataFromCLLocationCoordinate(v7, v8);
    dispatch_group_enter(v6);
    -[MapsSuggestionsPredictor _openConnectionIfNecessary](v4);
    int v10 = [*(id *)(v4 + 16) remoteObjectProxy];
    __int16 v11 = [*(id *)(a1 + 32) data];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_34;
    v23[3] = &unk_1E5CB99A8;
    objc_copyWeak(&v27, v2);
    uint64_t v25 = v28;
    id v12 = v6;
    v24 = v12;
    id v26 = buf;
    [v10 predictedTransportModeForDestinationMapItemData:v11 originCoordinateData:v9 handler:v23];

    uint64_t v13 = *(NSObject **)(v4 + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_36;
    v16[3] = &unk_1E5CB99D0;
    objc_copyWeak(&v21, v2);
    __int16 v19 = v28;
    id v14 = *(id *)(a1 + 32);
    int v22 = *(_DWORD *)(a1 + 56);
    int v20 = buf;
    id v17 = v14;
    uint64_t v18 = v4;
    dispatch_group_notify(v12, v13, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v27);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsPredictor.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 230;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4)
{
  v26[2] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    __int16 v11 = +[MapsSuggestionsSignalPack signalPackFromData:v8];
    id v12 = [v11 mutableCopy];

    if (v9 || !v12)
    {
      id v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "Could not submit analytics because either the incomingSignalPack is nil for this mapItem OR because of this error: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        goto LABEL_15;
      }
      -[NSObject mergeIntoSignalPack:](v12, "mergeIntoSignalPack:");
      uint64_t v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Merged incomingSignalPack into the cached signalPack for this mapItem", buf, 2u);
      }

      id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v14)
      {
LABEL_15:
        uint64_t v16 = [v12 mutableCopy];
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        __int16 v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Made a copy of incomingSignalpack and assigned to signalPack", buf, 2u);
        }

        id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      id v20 = v14;
      objc_initWeak(&location, WeakRetained);
      id v21 = WeakRetained[1];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __74__MapsSuggestionsPredictor__overrideTempPredictedTransportModeForCarPlay___block_invoke;
      *(void *)&buf[24] = &unk_1E5CB7BE0;
      objc_copyWeak(v26, &location);
      id v22 = v20;
      id v25 = v22;
      dispatch_async(v21, buf);

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsPredictor.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 252;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_36(uint64_t a1)
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  float v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v5 = [*(id *)(a1 + 32) shortAddress];
        id v6 = v5;
        if (!v5)
        {
          [*(id *)(a1 + 32) coordinate];
          id v6 = [NSString stringWithFormat:@"%+.8f, %+.8f", v7, v8];
        }
        *(_DWORD *)buf = 138412290;
        v142 = v6;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error generating a signalPack for mapItem \"%@", buf, 0xCu);
        if (!v5) {
      }
        }
    }
    else
    {
      if (*((_DWORD *)WeakRetained + 10) == 4)
      {
        GEOFindOrCreateLog();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = [*(id *)(a1 + 32) shortAddress];
          __int16 v11 = v10;
          if (!v10)
          {
            [*(id *)(a1 + 32) coordinate];
            __int16 v11 = [NSString stringWithFormat:@"%+.8f, %+.8f", v12, v13];
          }
          *(_DWORD *)buf = 138412290;
          v142 = v11;
          _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Predicted transport mode is UNKNOWN. \"%@", buf, 0xCu);
          if (!v10) {
        }
          }
      }
      GEOFindOrCreateLog();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        MapsSuggestionsLocalizedStringFromGEOTransportType(*(_DWORD *)(a1 + 72));
        id v15 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v142 = v15;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Captured the Actual Transportation Mode %@", buf, 0xCu);
      }
      uint64_t v16 = MapsSuggestionsCurrentBestLocation();
      [v16 coordinate];
      double v18 = v17;
      double v20 = v19;

      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F64638]) initWithLatitude:v18 longitude:v20];
      id v22 = (void *)MEMORY[0x1E4F63E30];
      id v23 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v23 hasType:7])
      {
        [v23 valueForSignalType:7];
        MapsSuggestionsBucketizedValueForType(7, v24);
        v140 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v140 = 0;
      }

      id v25 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v25 hasType:8])
      {
        [v25 valueForSignalType:8];
        MapsSuggestionsBucketizedValueForType(8, v26);
        v139 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v139 = 0;
      }

      id v27 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v27 hasType:9])
      {
        [v27 valueForSignalType:9];
        MapsSuggestionsBucketizedValueForType(9, v28);
        v138 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v138 = 0;
      }

      id v29 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v29 hasType:5])
      {
        [v29 valueForSignalType:5];
        MapsSuggestionsBucketizedValueForType(5, v30);
        v137 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v137 = 0;
      }

      id v31 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v31 hasType:3])
      {
        [v31 valueForSignalType:3];
        MapsSuggestionsBucketizedValueForType(3, v32);
        v136 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v136 = 0;
      }

      id v33 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v33 hasType:2])
      {
        [v33 valueForSignalType:2];
        MapsSuggestionsBucketizedValueForType(2, v34);
        v132 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v132 = 0;
      }

      id v35 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v35 hasType:4])
      {
        [v35 valueForSignalType:4];
        MapsSuggestionsBucketizedValueForType(4, v36);
        v135 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v135 = 0;
      }

      id v37 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v37 hasType:6])
      {
        [v37 valueForSignalType:6];
        MapsSuggestionsBucketizedValueForType(6, v38);
        v131 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v131 = 0;
      }

      id v39 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v39 hasType:10])
      {
        [v39 valueForSignalType:10];
        MapsSuggestionsBucketizedValueForType(10, v40);
        v130 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v130 = 0;
      }

      id v41 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v41 hasType:23])
      {
        [v41 valueForSignalType:23];
        MapsSuggestionsBucketizedValueForType(23, v42);
        v129 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v129 = 0;
      }

      int v43 = *(_DWORD *)(a1 + 72) - 1;
      if (v43 > 5) {
        int v44 = 1;
      }
      else {
        int v44 = dword_1A72271F0[v43];
      }
      int v123 = v44;
      id v45 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v45 hasType:11])
      {
        [v45 valueForSignalType:11];
        MapsSuggestionsBucketizedValueForType(11, v46);
        v128 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v128 = 0;
      }

      id v47 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v48 = v22;
      if ([v47 hasType:16])
      {
        [v47 valueForSignalType:16];
        MapsSuggestionsBucketizedValueForType(16, v49);
        v50 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v50 = 0;
      }

      [v50 floatValue];
      float v52 = v51;
      id v53 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v53 hasType:14])
      {
        [v53 valueForSignalType:14];
        MapsSuggestionsBucketizedValueForType(14, v54);
        v55 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v55 = 0;
      }

      [v55 floatValue];
      float v57 = v56;
      id v58 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v58 hasType:18])
      {
        [v58 valueForSignalType:18];
        MapsSuggestionsBucketizedValueForType(18, v59);
        v60 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v60 = 0;
      }

      [v60 floatValue];
      float v62 = v61;
      id v63 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v64 = v21;
      if ([v63 hasType:17])
      {
        [v63 valueForSignalType:17];
        MapsSuggestionsBucketizedValueForType(17, v65);
        v66 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v66 = 0;
      }

      v124 = v66;
      [v66 floatValue];
      float v68 = v67;
      id v69 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v69 hasType:13])
      {
        [v69 valueForSignalType:13];
        MapsSuggestionsBucketizedValueForType(13, v70);
        v71 = v64;
        v72 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v71 = v64;
        v72 = 0;
      }

      [v72 floatValue];
      float v74 = v73;
      id v75 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v127 = v50;
      if ([v75 hasType:15])
      {
        [v75 valueForSignalType:15];
        MapsSuggestionsBucketizedValueForType(15, v76);
        v77 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v77 = 0;
      }

      v121 = v77;
      [v77 floatValue];
      float v79 = v78;
      id v80 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v80 hasType:1])
      {
        [v80 valueForSignalType:1];
        MapsSuggestionsBucketizedValueForType(1, v81);
        v82 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v82 = 0;
      }

      unsigned int v119 = [v82 intValue];
      id v83 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v133 = v48;
      v122 = v72;
      if ([v83 hasType:27])
      {
        [v83 valueForSignalType:27];
        MapsSuggestionsBucketizedValueForType(27, v84);
        v85 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v85 = 0;
      }

      unsigned int v86 = [v85 intValue];
      id v87 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v125 = v60;
      if ([v87 hasType:21])
      {
        [v87 valueForSignalType:21];
        MapsSuggestionsBucketizedValueForType(21, v88);
        v89 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v89 = 0;
      }

      unsigned int v90 = [v89 intValue];
      int v91 = *(_DWORD *)(*(void *)(a1 + 40) + 40) - 1;
      v117 = v89;
      unsigned int v116 = v90;
      if (v91 > 5) {
        int v92 = 1;
      }
      else {
        int v92 = dword_1A72271F0[v91];
      }
      int v115 = v92;
      unint64_t v93 = GEOGetUserTransportTypePreference();
      if (v93 < 5) {
        int v94 = v93 + 1;
      }
      else {
        int v94 = 0;
      }
      id v95 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v95 hasType:12])
      {
        [v95 valueForSignalType:12];
        MapsSuggestionsBucketizedValueForType(12, v96);
        v114 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v114 = 0;
      }

      id v97 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v126 = v55;
      if ([v97 hasType:20])
      {
        [v97 valueForSignalType:20];
        MapsSuggestionsBucketizedValueForType(20, v98);
        v99 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v99 = 0;
      }

      id v100 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v134 = v3;
      v120 = v82;
      v118 = v85;
      if ([v100 hasType:39])
      {
        [v100 valueForSignalType:39];
        MapsSuggestionsBucketizedValueForType(39, v101);
        v102 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v102 = 0;
      }

      id v103 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if ([v103 hasType:38])
      {
        [v103 valueForSignalType:38];
        MapsSuggestionsBucketizedValueForType(38, v104);
        v105 = objc_msgSend(NSNumber, "numberWithFloat:");
      }
      else
      {
        v105 = 0;
      }

      uint64_t v4 = v71;
      LODWORD(v113) = v94;
      LODWORD(v112) = v123;
      objc_msgSend(v133, "capturePredExTrainingWithChanceOfPrecipitation:chanceOfRain:chanceOfSnow:endTime:durationUntilEventEnd:durationUntilEventStart:startTime:temperature:timeOfDay:timeSinceBackgrounded:actualTransportMode:dayOfWeek:distanceFromHereToHome:distanceFromHereToOrigin:distanceFromHereToParkedCar:distanceFromHereToWork:distanceFromHere:distanceFromOriginToDestination:entryType:weatherType:mapType:predictedTransportMode:preferredTransportMode:isTourist:isCarplayConnected:isTransitPossible:userLocation:isVehicleBluetoothConnected:weatherAqi:", v140, v139, v138, v137, v136, v132, v135, v131, v130, v129, v112, v128, __PAIR64__((int)v57, (int)v52),
        __PAIR64__((int)v68, (int)v62),
        __PAIR64__((int)v79, (int)v74),
        __PAIR64__(v86, v119),
        __PAIR64__(v115, v116),
        v113,
        v114,
        v99,
        0,
        v71,
        v102,
        v105);

      GEOFindOrCreateLog();
      v106 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        v107 = *(char **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        v108 = [*(id *)(a1 + 32) shortAddress];
        [*(id *)(a1 + 32) coordinate];
        id v111 = [NSString stringWithFormat:@"%+.8f, %+.8f", v109, v110];
        *(_DWORD *)buf = 138412802;
        v142 = v107;
        __int16 v143 = 2112;
        *(void *)v144 = v108;
        *(_WORD *)&v144[8] = 2112;
        *(void *)&v144[10] = v111;
        _os_log_impl(&dword_1A70DF000, v106, OS_LOG_TYPE_INFO, "Submitted analytics for Transport Mode Prediction %@ to %@ at %@", buf, 0x20u);
      }
      float v3 = v134;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v142 = "MapsSuggestionsPredictor.m";
      __int16 v143 = 1026;
      *(_DWORD *)v144 = 286;
      *(_WORD *)&v144[4] = 2082;
      *(void *)&v144[6] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)capturePredictedTransportationMode:(int)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsPredictor_capturePredictedTransportationMode___block_invoke;
  block[3] = &unk_1E5CB9A20;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__MapsSuggestionsPredictor_capturePredictedTransportationMode___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v3 = GEOFindOrCreateLog();
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      MapsSuggestionsLocalizedStringFromGEOTransportType(*(_DWORD *)(a1 + 40));
      dispatch_queue_t v5 = (char *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Captured the Predicted Transportation Mode %@", (uint8_t *)&v7, 0xCu);
    }
    WeakRetained[10] = *(_DWORD *)(a1 + 40);
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsPredictor.m";
      __int16 v9 = 1026;
      int v10 = 341;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsPredictor capturePredictedTransportationMode:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)cancelCapturingAnalytics
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MapsSuggestionsPredictor_cancelCapturingAnalytics__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsPredictor_cancelCapturingAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  float v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Cancelled capturing analytics for PTM", (uint8_t *)&v5, 2u);
    }

    WeakRetained[10] = 4;
  }
  else
  {
    uint64_t v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsPredictor.m";
      __int16 v7 = 1026;
      int v8 = 351;
      __int16 v9 = 2082;
      int v10 = "-[MapsSuggestionsPredictor cancelCapturingAnalytics]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  float v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_43;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v9 = "MapsSuggestionsPredictor.m";
      __int16 v10 = 1026;
      int v11 = 384;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_43(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  float v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = (char *)WeakRetained[2];
      int v7 = 138412290;
      int v8 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v7, 0xCu);
    }

    int v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    id v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsPredictor.m";
      __int16 v9 = 1026;
      int v10 = 386;
      __int16 v11 = 2082;
      __int16 v12 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_44(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  float v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_45;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v9 = "MapsSuggestionsPredictor.m";
      __int16 v10 = 1026;
      int v11 = 394;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_45(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  float v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = (char *)WeakRetained[2];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v6, 0xCu);
    }

    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    int v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsPredictor.m";
      __int16 v8 = 1026;
      int v9 = 396;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_47;
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
      uint64_t v13 = "MapsSuggestionsPredictor.m";
      __int16 v14 = 1026;
      int v15 = 403;
      __int16 v16 = 2082;
      double v17 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_47(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)WeakRetained[2];
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      int v9 = v5;
      __int16 v10 = 2112;
      *(void *)id v11 = v6;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v8, 0x16u);
    }

    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    id v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      int v9 = "MapsSuggestionsPredictor.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 405;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsPredictor.m";
      __int16 v6 = 1026;
      int v7 = 456;
      __int16 v8 = 2082;
      int v9 = "-[MapsSuggestionsPredictor _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalPackCache, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end