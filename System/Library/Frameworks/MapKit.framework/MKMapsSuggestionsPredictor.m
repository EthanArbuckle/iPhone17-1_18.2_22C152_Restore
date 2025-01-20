@interface MKMapsSuggestionsPredictor
+ (id)sharedPredictor;
- (BOOL)_openConnectionIfNecessary;
- (BOOL)transportModeForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (BOOL)transportModeForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (MKMapsSuggestionsPredictor)init;
- (MKMapsSuggestionsSignalPackCacheInterface)signalPackCacheInterface;
- (id)NSDataToMKMapsSuggestionsTransportModes:(id)a3 error:(id *)a4;
- (void)_closeConnection;
- (void)_initCloseTimerIfNecessary;
- (void)_scheduleCloseConnection;
- (void)_unscheduleCloseConnection;
- (void)dealloc;
- (void)setSignalPackCacheInterface:(id)a3;
@end

@implementation MKMapsSuggestionsPredictor

- (void)setSignalPackCacheInterface:(id)a3
{
}

+ (id)sharedPredictor
{
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_40);
  }
  v2 = (void *)qword_1EB315DC0;

  return v2;
}

void __45__MKMapsSuggestionsPredictor_sharedPredictor__block_invoke()
{
  v0 = objc_alloc_init(MKMapsSuggestionsPredictor);
  v1 = (void *)qword_1EB315DC0;
  qword_1EB315DC0 = (uint64_t)v0;
}

- (MKMapsSuggestionsPredictor)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKMapsSuggestionsPredictor;
  v2 = [(MKMapsSuggestionsPredictor *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MKMapsSuggestionsPredictorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    closeTimer = v2->_closeTimer;
    v2->_closeTimer = 0;

    connection = v2->_connection;
    v2->_connection = 0;
  }
  return v2;
}

- (id)NSDataToMKMapsSuggestionsTransportModes:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v7, objc_opt_class(), 0);
  objc_super v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v6 error:a4];

  return v9;
}

- (void)dealloc
{
  [(MKMapsSuggestionsPredictor *)self _unscheduleCloseConnection];
  [(MKMapsSuggestionsPredictor *)self _closeConnection];
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MKMapsSuggestionsPredictor;
  [(MKMapsSuggestionsPredictor *)&v4 dealloc];
}

- (BOOL)transportModeForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(void *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]";
      __int16 v21 = 2082;
      v22 = "handler == nil";
      __int16 v23 = 2082;
      v24 = "Requires a handler";
LABEL_8:
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }
LABEL_9:

    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(void *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]";
      __int16 v21 = 2082;
      v22 = "mapItemData == nil";
      __int16 v23 = 2082;
      v24 = "Requires a mapItem data object";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke;
  v15[3] = &unk_1E54BABB8;
  objc_copyWeak(&v19, (id *)location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

void __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _openConnectionIfNecessary];
    v5 = [v4[2] remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke_15;
    v9[3] = &unk_1E54BAB90;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    [v5 predictedTransportModeForDestinationMapItemData:v6 originCoordinateData:v7 handler:v9];

    [v4 _scheduleCloseConnection];
    objc_destroyWeak(&v12);
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 196;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v18 = 0;
    id v12 = [WeakRetained NSDataToMKMapsSuggestionsTransportModes:v7 error:&v18];
    v13 = v18;
    if (v13)
    {
      v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      __int16 v15 = [v11 signalPackCacheInterface];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [v11 signalPackCacheInterface];
        [v17 storeSignalPackData:v8 forMapItemData:*(void *)(a1 + 32)];
      }
      v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v14();
  }
  else
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 200;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

- (BOOL)transportModeForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)location = 136446722;
    *(void *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
    __int16 v22 = 2082;
    uint64_t v23 = "entryData == nil";
    __int16 v24 = 2082;
    uint64_t v25 = "Requires MSg Entry NSData";
LABEL_11:
    _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    goto LABEL_12;
  }
  if (!v9)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)location = 136446722;
    *(void *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
    __int16 v22 = 2082;
    uint64_t v23 = "coordinateData == nil";
    __int16 v24 = 2082;
    uint64_t v25 = "Requires coordinates NSData";
    goto LABEL_11;
  }
  if (!v10)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(void *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
      __int16 v22 = 2082;
      uint64_t v23 = "handler == nil";
      __int16 v24 = 2082;
      uint64_t v25 = "Handler cannot be nil";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v13 = 0;
    goto LABEL_13;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke;
  v16[3] = &unk_1E54BABB8;
  objc_copyWeak(&v20, (id *)location);
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)location);
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

void __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _openConnectionIfNecessary];
    v5 = [v4[2] remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke_23;
    v9[3] = &unk_1E54BAB90;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    [v5 predictedTransportModeForDestinationEntryData:v6 originCoordinateData:v7 handler:v9];

    [v4 _scheduleCloseConnection];
    objc_destroyWeak(&v12);
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 234;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v18 = 0;
    id v12 = [WeakRetained NSDataToMKMapsSuggestionsTransportModes:v7 error:&v18];
    BOOL v13 = v18;
    if (v13)
    {
      v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      __int16 v15 = [v11 signalPackCacheInterface];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [v11 signalPackCacheInterface];
        [v17 storeSignalPackData:v8 forEntryData:*(void *)(a1 + 32)];
      }
      v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v14();
  }
  else
  {
    BOOL v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 238;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

- (BOOL)_openConnectionIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA433D8];
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v4 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:0 ofReply:1];

    v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v5 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:1 ofReply:1];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:2 ofReply:1];

    id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:0 ofReply:0];

    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v8 forSelector:sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_ argumentIndex:1 ofReply:0];

    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v9 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:0 ofReply:1];

    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v10 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:1 ofReply:1];

    id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:2 ofReply:1];

    id v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v12 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:0 ofReply:0];

    BOOL v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v13 forSelector:sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_ argumentIndex:1 ofReply:0];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.maps.destinationd.predictions" options:0];
    [v14 setRemoteObjectInterface:v3];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke;
    v21[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v22, &location);
    [v14 setInvalidationHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_29;
    v19[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v20, &location);
    [v14 setInterruptionHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_31;
    v17[3] = &unk_1E54B8F58;
    objc_copyWeak(&v18, &location);
    id v15 = (id)[v14 remoteObjectProxyWithErrorHandler:v17];
    objc_storeStrong((id *)&self->_connection, v14);
    [v14 resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_28;
    block[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 280;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_28(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = (const char *)WeakRetained[2];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v6, 0xCu);
    }

    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    [WeakRetained _unscheduleCloseConnection];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 282;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_29(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_30;
    block[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v9 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 290;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_30(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = (const char *)WeakRetained[2];
      int v5 = 138412290;
      int v6 = v4;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained _closeConnection];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      int v6 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 292;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }
  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v7 = WeakRetained[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_32;
    v9[3] = &unk_1E54B8C68;
    objc_copyWeak(&v11, v4);
    id v10 = v3;
    dispatch_async(v7, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v13 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 299;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_32(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  objc_super v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (const char *)WeakRetained[2];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      int v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v7, 0x16u);
    }

    [WeakRetained _closeConnection];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      int v8 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      __int16 v9 = 1024;
      LODWORD(v10) = 301;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (void)_closeConnection
{
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    objc_super v4 = connection;

    [(NSXPCConnection *)v4 setInterruptionHandler:0];
    [(NSXPCConnection *)v4 setInvalidationHandler:0];
    [(NSXPCConnection *)v4 invalidate];
  }

  [(MKMapsSuggestionsPredictor *)self _unscheduleCloseConnection];
}

- (void)_initCloseTimerIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_closeTimer)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_super v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    closeTimer = self->_closeTimer;
    self->_closeTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v6 = self->_closeTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__MKMapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v8, buf);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_closeTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __56__MKMapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _closeConnection];
  }
  else
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      int v5 = "-[MKMapsSuggestionsPredictor _initCloseTimerIfNecessary]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 348;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (void)_scheduleCloseConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", v10, 2u);
  }

  [(MKMapsSuggestionsPredictor *)self _initCloseTimerIfNecessary];
  GEOConfigGetDouble();
  double v5 = v4;
  GEOConfigGetDouble();
  double v7 = v6;
  closeTimer = self->_closeTimer;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(closeTimer, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v7 * 1000000000.0));
}

- (void)_unscheduleCloseConnection
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v6, 2u);
  }

  closeTimer = self->_closeTimer;
  if (closeTimer)
  {
    dispatch_source_set_timer(closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_closeTimer);
    double v5 = self->_closeTimer;
    self->_closeTimer = 0;
  }
}

- (MKMapsSuggestionsSignalPackCacheInterface)signalPackCacheInterface
{
  return self->_signalPackCacheInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalPackCacheInterface, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end