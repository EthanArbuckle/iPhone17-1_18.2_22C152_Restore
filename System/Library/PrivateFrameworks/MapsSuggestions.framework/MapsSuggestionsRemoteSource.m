@interface MapsSuggestionsRemoteSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)Debug_updateGraph;
- (void)_q_closeConnection;
- (void)_q_openConnectionIfNecessary;
- (void)addOrUpdateSuggestionEntriesData:(id)a3 sourceNameData:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsRemoteSource

uint64_t __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addOrUpdateSuggestionEntriesData:(id)a3 sourceNameData:(id)a4 handler:(id)a5
{
  location[4] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(location, self);
  v11 = MapsSuggestionsEntriesFromNSData(v8);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke;
  block[3] = &unk_1E5CB8080;
  objc_copyWeak(&v20, location);
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  dispatch_async(queue, block);

  objc_destroyWeak(&v20);
  if (v10)
  {
    v14 = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke_233;
    v15[3] = &unk_1E5CB8C48;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
  objc_destroyWeak(location);
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      __int16 v21 = 1024;
      int v22 = 147;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsRemoteSource initFromResourceDepot:name:]";
      __int16 v25 = 2082;
      v26 = "nil == (resourceDepot)";
      id v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:

    v14 = 0;
    goto LABEL_12;
  }
  id v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      __int16 v21 = 1024;
      int v22 = 148;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsRemoteSource initFromResourceDepot:name:]";
      __int16 v25 = 2082;
      v26 = "nil == (resourceDepot.oneSourceDelegate)";
      id v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v9 = [v6 oneSourceDelegate];
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsRemoteSource;
  id v10 = [(MapsSuggestionsBaseSource *)&v18 initWithDelegate:v9 name:v7];

  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsXPCSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;
  }
  self = v10;
  v14 = self;
LABEL_12:

  return v14;
}

void __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)[[NSString alloc] initWithData:*(void *)(a1 + 32) encoding:4];
    v4 = [WeakRetained delegate];
    v5 = v4;
    if (*(void *)(a1 + 40)) {
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
    }
    [v4 addOrUpdateSuggestionEntries:v6 source:v3];
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsRemoteSource.m";
      __int16 v10 = 1026;
      int v11 = 479;
      __int16 v12 = 2082;
      id v13 = "-[MapsSuggestionsRemoteSource addOrUpdateSuggestionEntriesData:sourceNameData:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  [(MapsSuggestionsRemoteSource *)self updateSuggestionEntriesOfType:0 handler:a3];
  return result;
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a4;
  if (a3 && ![(MapsSuggestionsRemoteSource *)self canProduceEntriesOfType:a3])
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    id v7 = NSStringFromMapsSuggestionsEntryType(a3);
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(MapsSuggestionsBaseSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2080;
      __int16 v21 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    __int16 v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", "", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke;
    v14[3] = &unk_1E5CB9638;
    objc_copyWeak(v17, (id *)buf);
    id v15 = v7;
    id v16 = v6;
    v17[1] = (id)a3;
    id v12 = v7;
    dispatch_async(queue, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }

  return 0.0;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 2;
}

- (void)start
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2080;
    __int16 v21 = "start";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "start", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v6 = self->_queue;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke;
  aBlock[3] = &unk_1E5CB95C0;
  id v7 = v6;
  id v16 = v7;
  objc_copyWeak(&v17, (id *)buf);
  int v8 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_210;
  block[3] = &unk_1E5CB95E8;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  __int16 v10 = v7;
  dispatch_async(v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_210(uint64_t a1)
{
  *(void *)&v22[13] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
    if (*((unsigned char *)v4 + 40))
    {
      v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "WARNING: already started. Doing it again from the same XPC peer might confuse the daemon.", buf, 2u);
      }
    }
    else
    {
      *((unsigned char *)v4 + 40) = 1;
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        __int16 v20 = v7;
        __int16 v21 = 2080;
        *(void *)uint64_t v22 = "QoS";
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
      }
      int v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "QoS", "", buf, 2u);
      }

      id v9 = [*((id *)v4 + 3) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __36__MapsSuggestionsRemoteSource_start__block_invoke_211;
      id v16 = &unk_1E5CB8CE8;
      id v17 = *(id *)(a1 + 32);
      objc_copyWeak(&v18, v2);
      [v9 startMonitoringWithHandler:&v13];

      GEOFindOrCreateLog();
      __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName", v13, v14, v15, v16);
        int v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        __int16 v20 = v11;
        __int16 v21 = 2080;
        *(void *)uint64_t v22 = "start";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v12 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "start", "", buf, 2u);
      }

      objc_destroyWeak(&v18);
      v5 = v17;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v20 = "MapsSuggestionsRemoteSource.m";
      __int16 v21 = 1026;
      *(_DWORD *)uint64_t v22 = 184;
      v22[2] = 2082;
      *(void *)&v22[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = *((unsigned char *)WeakRetained + 40) == 0;
    uint64_t v6 = GEOFindOrCreateLog();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Cannot update if we haven't been started.", buf, 2u);
      }

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        (*(void (**)(void))(v15 + 16))();
      }
      id v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        v26 = v17;
        __int16 v27 = 2080;
        *(void *)v28 = "updateSuggestionEntriesOfType:";
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v18 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", "", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v8 = [v4 uniqueName];
        uint64_t v9 = *(void *)(a1 + 32);
        __int16 v10 = NSStringFromMapsSuggestionsCurrentBestLocation();
        *(_DWORD *)buf = 138412802;
        v26 = v8;
        __int16 v27 = 2112;
        *(void *)v28 = v9;
        *(_WORD *)&v28[8] = 2112;
        *(void *)&v28[10] = v10;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
      }
      -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_216;
      aBlock[3] = &unk_1E5CB7C08;
      objc_copyWeak(&v24, v2);
      id v23 = *(id *)(a1 + 40);
      int v11 = _Block_copy(aBlock);
      id v12 = [v4[3] remoteObjectProxyWithErrorHandler:v11];
      uint64_t v13 = *(void *)(a1 + 56);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_217;
      v19[3] = &unk_1E5CB8A98;
      objc_copyWeak(&v21, v2);
      id v20 = *(id *)(a1 + 40);
      [v12 forceEarlyUpdateForType:v13 handler:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v24);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "MapsSuggestionsRemoteSource.m";
      __int16 v27 = 1026;
      *(_DWORD *)v28 = 261;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_q_openConnectionIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(void *)(a1 + 24))
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v3;
      __int16 v23 = 2080;
      id v24 = "openingConnection";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "openingConnection", "", buf, 2u);
    }

    BOOL v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCA4930];
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v5 setClasses:v6 forSelector:sel_feedbackForMapItem_action_ argumentIndex:0 ofReply:0];

    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v5 setClasses:v7 forSelector:sel_feedbackForContact_action_ argumentIndex:0 ofReply:0];

    int v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC91AB8];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v8 setClasses:v9 forSelector:sel_addOrUpdateSuggestionEntriesData_sourceNameData_handler_ argumentIndex:0 ofReply:0];

    __int16 v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v8 setClasses:v10 forSelector:sel_addOrUpdateSuggestionEntriesData_sourceNameData_handler_ argumentIndex:1 ofReply:0];

    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.maps.destinationd.sources" options:0];
    id v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCA4930];
    [v11 setRemoteObjectInterface:v12];

    [v11 setExportedInterface:v8];
    [v11 setExportedObject:a1];
    objc_initWeak(&location, (id)a1);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke;
    v18[3] = &unk_1E5CB8058;
    objc_copyWeak(&v19, &location);
    [v11 setInvalidationHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_196;
    v16[3] = &unk_1E5CB8058;
    objc_copyWeak(&v17, &location);
    [v11 setInterruptionHandler:v16];
    objc_storeStrong((id *)(a1 + 24), v11);
    [v11 resume];
    GEOFindOrCreateLog();
    uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v14;
      __int16 v23 = 2080;
      id v24 = "openingConnection";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "openingConnection", "", buf, 2u);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 0x19)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      __int16 v8 = 1024;
      int v9 = 334;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRemoteSource canProduceEntriesOfType:]";
      __int16 v12 = 2082;
      uint64_t v13 = "YES";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x1FFFDBEu >> a3) & 1;
  }
  return v3;
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_217(uint64_t a1)
{
  *(void *)&v10[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = [WeakRetained uniqueName];
      int v7 = 138412546;
      __int16 v8 = v5;
      __int16 v9 = 2080;
      *(void *)__int16 v10 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
    }
    int v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", "", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "MapsSuggestionsRemoteSource.m";
      __int16 v9 = 1026;
      *(_DWORD *)__int16 v10 = 280;
      v10[2] = 2082;
      *(void *)&v10[3] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_2(uint64_t a1)
{
  *(void *)&v9[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)WeakRetained);
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [v2 uniqueName];
      int v6 = 138412546;
      int v7 = v4;
      __int16 v8 = 2080;
      *(void *)__int16 v9 = "QoS";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
    }
    BOOL v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QoS", "", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "MapsSuggestionsRemoteSource.m";
      __int16 v8 = 1026;
      *(_DWORD *)__int16 v9 = 201;
      v9[2] = 2082;
      *(void *)&v9[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_211(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_2;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke_214(uint64_t a1)
{
  *(void *)&v9[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [WeakRetained uniqueName];
      int v6 = 138412546;
      int v7 = v4;
      __int16 v8 = 2080;
      *(void *)__int16 v9 = "stop";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
    }
    BOOL v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", "", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    BOOL v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "MapsSuggestionsRemoteSource.m";
      __int16 v8 = 1026;
      *(_DWORD *)__int16 v9 = 235;
      v9[2] = 2082;
      *(void *)&v9[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke(uint64_t a1)
{
  *(void *)&v18[13] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 40))
    {
      *((unsigned char *)WeakRetained + 40) = 0;
      -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke_213;
      aBlock[3] = &unk_1E5CB80A8;
      objc_copyWeak(&v14, v1);
      id v4 = _Block_copy(aBlock);
      BOOL v5 = [v3[3] remoteObjectProxyWithErrorHandler:v4];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke_214;
      v11[3] = &unk_1E5CB8058;
      objc_copyWeak(&v12, v1);
      [v5 stopMonitoringWithHandler:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
    }
    else
    {
      int v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "WARNING: already stopped.", buf, 2u);
      }

      __int16 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = [v3 uniqueName];
        *(_DWORD *)buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2080;
        *(void *)id v18 = "stop";
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      __int16 v10 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", "", buf, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v16 = "MapsSuggestionsRemoteSource.m";
      __int16 v17 = 1026;
      *(_DWORD *)id v18 = 216;
      v18[2] = 2082;
      *(void *)&v18[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v10 = v4;
    __int16 v11 = 2080;
    id v12 = "stop";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  BOOL v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "stop", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_q_closeConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [(id)a1 uniqueName];
      int v9 = 138412546;
      __int16 v10 = v3;
      __int16 v11 = 2080;
      id v12 = "_q_closeConnection";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v9, 0x16u);
    }
    id v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_closeConnection", "", (uint8_t *)&v9, 2u);
    }

    [*(id *)(a1 + 24) setInterruptionHandler:0];
    [*(id *)(a1 + 24) setInvalidationHandler:0];
    [*(id *)(a1 + 24) invalidate];
    BOOL v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    *(unsigned char *)(a1 + 40) = 0;
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(id)a1 uniqueName];
      int v9 = 138412546;
      __int16 v10 = v7;
      __int16 v11 = 2080;
      id v12 = "_q_closeConnection";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v9, 0x16u);
    }
    id v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_closeConnection", "", (uint8_t *)&v9, 2u);
    }
  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_194;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v9 = "MapsSuggestionsRemoteSource.m";
      __int16 v10 = 1026;
      int v11 = 88;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_194(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)WeakRetained[3];
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v7, 0xCu);
    }

    BOOL v5 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    *((unsigned char *)WeakRetained + 40) = 0;
  }
  else
  {
    int v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsRemoteSource.m";
      __int16 v9 = 1026;
      int v10 = 90;
      __int16 v11 = 2082;
      __int16 v12 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_196(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_197;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v9 = "MapsSuggestionsRemoteSource.m";
      __int16 v10 = 1026;
      int v11 = 98;
      __int16 v12 = 2082;
      uint64_t v13 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_197(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)WeakRetained[3];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v6, 0xCu);
    }

    -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)WeakRetained);
  }
  else
  {
    BOOL v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRemoteSource.m";
      __int16 v8 = 1026;
      int v9 = 100;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)self);
  connection = self->_connection;
  self->_connection = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsRemoteSource;
  [(MapsSuggestionsRemoteSource *)&v5 dealloc];
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "start failed with error: %@", buf, 0xCu);
  }

  objc_super v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_207;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_207(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [WeakRetained uniqueName];
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2080;
      *(void *)int v11 = "QoS";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v8, 0x16u);
    }
    objc_super v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QoS", "", (uint8_t *)&v8, 2u);
    }

    int v6 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;

    *((unsigned char *)WeakRetained + 40) = 0;
  }
  else
  {
    id v7 = v2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsRemoteSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)int v11 = 176;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke_213(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    int v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "stop failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = GEOFindOrCreateLog();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2080;
      *(void *)uint64_t v13 = "stop";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    id v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      int v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)uint64_t v13 = 230;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_216(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    int v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "updateSuggestionEntriesOfType: failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2080;
      *(void *)uint64_t v13 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      int v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)uint64_t v13 = 274;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v11;
    __int16 v23 = 2080;
    id v24 = "removeEntry:behavior:";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke;
  v17[3] = &unk_1E5CB9638;
  objc_copyWeak(v20, (id *)buf);
  id v18 = v8;
  id v19 = v9;
  v20[1] = (id)a4;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 40))
    {
      objc_super v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "Cannot removeEntry if we haven't been started. Still continuing.", buf, 2u);
      }
    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    uint64_t v6 = [*(id *)(a1 + 32) data];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_220;
    aBlock[3] = &unk_1E5CB7C08;
    objc_copyWeak(&v15, v2);
    id v14 = *(id *)(a1 + 40);
    id v7 = _Block_copy(aBlock);
    id v8 = [v4[3] remoteObjectProxyWithErrorHandler:v7];
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_221;
    v10[3] = &unk_1E5CB9610;
    id v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v12, v2);
    [v8 removeEntryData:v6 behavior:v9 handler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v17 = "MapsSuggestionsRemoteSource.m";
      __int16 v18 = 1026;
      int v19 = 345;
      __int16 v20 = 2082;
      id v21 = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_220(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "removeEntry:behavior: failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      *(void *)uint64_t v13 = "removeEntry:behavior:";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)uint64_t v13 = 354;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_221(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = GEOFindOrCreateLog();
  objc_super v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [WeakRetained uniqueName];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "removeEntry:behavior:";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    id v7 = v4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      uint64_t v9 = "MapsSuggestionsRemoteSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 361;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "feedbackForEntryData";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke;
  block[3] = &unk_1E5CB9660;
  objc_copyWeak(v14, (id *)buf);
  id v13 = v6;
  v14[1] = (id)a4;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke(uint64_t a1)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 40))
    {
      objc_super v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForEntry", buf, 2u);
      }
    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    id v6 = [*(id *)(a1 + 32) data];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke_223;
    aBlock[3] = &unk_1E5CB80A8;
    objc_copyWeak(&v13, v2);
    id v7 = _Block_copy(aBlock);
    int v8 = [v4[3] remoteObjectProxyWithErrorHandler:v7];
    [v8 feedbackForEntryData:v6 action:*(void *)(a1 + 48)];

    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = [v4 uniqueName];
      *(_DWORD *)buf = 138412546;
      id v15 = v10;
      __int16 v16 = 2080;
      *(void *)__int16 v17 = "feedbackForEntryData";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    id v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", "", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "MapsSuggestionsRemoteSource.m";
      __int16 v16 = 1026;
      *(_DWORD *)__int16 v17 = 375;
      id v17[2] = 2082;
      *(void *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke_223(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "feedbackForEntryData failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = GEOFindOrCreateLog();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      *(void *)id v13 = "feedbackForEntryData";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)id v13 = 384;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "feedbackForMapItem";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke;
  block[3] = &unk_1E5CB9660;
  objc_copyWeak(v14, (id *)buf);
  id v13 = v6;
  v14[1] = (id)a4;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke(uint64_t a1)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 40))
    {
      objc_super v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForMapItem", buf, 2u);
      }
    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke_225;
    aBlock[3] = &unk_1E5CB80A8;
    objc_copyWeak(&v13, v2);
    id v6 = _Block_copy(aBlock);
    id v7 = [v4[3] remoteObjectProxyWithErrorHandler:v6];
    [v7 feedbackForMapItem:*(void *)(a1 + 32) action:*(void *)(a1 + 48)];

    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v4 uniqueName];
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2080;
      *(void *)__int16 v17 = "feedbackForMapItem";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    int v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", "", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "MapsSuggestionsRemoteSource.m";
      __int16 v16 = 1026;
      *(_DWORD *)__int16 v17 = 400;
      id v17[2] = 2082;
      *(void *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke_225(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "feedbackForMapItem failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = GEOFindOrCreateLog();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      *(void *)id v13 = "feedbackForMapItem";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)id v13 = 408;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "feedbackForContact";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  uint64_t v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke;
  block[3] = &unk_1E5CB9660;
  objc_copyWeak(v14, (id *)buf);
  id v13 = v6;
  v14[1] = (id)a4;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke(uint64_t a1)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 40))
    {
      objc_super v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForContact", buf, 2u);
      }
    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke_227;
    aBlock[3] = &unk_1E5CB80A8;
    objc_copyWeak(&v13, v2);
    id v6 = _Block_copy(aBlock);
    id v7 = [v4[3] remoteObjectProxyWithErrorHandler:v6];
    [v7 feedbackForContact:*(void *)(a1 + 32) action:*(void *)(a1 + 48)];

    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v4 uniqueName];
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2080;
      *(void *)__int16 v17 = "feedbackForContact";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    int v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", "", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "MapsSuggestionsRemoteSource.m";
      __int16 v16 = 1026;
      *(_DWORD *)__int16 v17 = 424;
      id v17[2] = 2082;
      *(void *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke_227(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "feedbackForContact failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = GEOFindOrCreateLog();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      *(void *)id v13 = "feedbackForContact";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)id v13 = 432;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)Debug_updateGraph
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    int v10 = v4;
    __int16 v11 = 2080;
    __int16 v12 = "Debug_updateGraph";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  objc_super v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_229;
    aBlock[3] = &unk_1E5CB80A8;
    objc_copyWeak(&v10, v1);
    id v4 = _Block_copy(aBlock);
    objc_super v5 = [v3[3] remoteObjectProxyWithErrorHandler:v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_230;
    v7[3] = &unk_1E5CB8A48;
    objc_copyWeak(&v8, v1);
    [v5 updateGraphWithHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v12 = "MapsSuggestionsRemoteSource.m";
      __int16 v13 = 1026;
      int v14 = 447;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_229(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    __int16 v11 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Debug_updateGraph failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = GEOFindOrCreateLog();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [WeakRetained uniqueName];
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2080;
      *(void *)__int16 v13 = "Debug_updateGraph";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      __int16 v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)__int16 v13 = 452;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_230(uint64_t a1, char a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = GEOFindOrCreateLog();
  objc_super v5 = v4;
  if (WeakRetained)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (a2)
    {
      if (v6)
      {
        id v7 = [WeakRetained uniqueName];
        int v10 = 138412546;
        __int16 v11 = v7;
        __int16 v12 = 2080;
        *(void *)__int16 v13 = "Debug_updateGraph";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v10) = 0;
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", "", (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v9 = [WeakRetained uniqueName];
        int v10 = 138412546;
        __int16 v11 = v9;
        __int16 v12 = 2080;
        *(void *)__int16 v13 = "Debug_updateGraph";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v10) = 0;
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      __int16 v11 = "MapsSuggestionsRemoteSource.m";
      __int16 v12 = 1026;
      *(_DWORD *)__int16 v13 = 457;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end