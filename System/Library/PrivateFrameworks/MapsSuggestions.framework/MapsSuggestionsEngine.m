@interface MapsSuggestionsEngine
- (BOOL)loadStorageFromFile:(id)a3;
- (BOOL)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5;
- (BOOL)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (BOOL)saveStorageToFile:(id)a3 callback:(id)a4;
- (BOOL)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7;
- (BOOL)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6 callback:(id)a7 onQueue:(id)a8;
- (GEOAutomobileOptions)automobileOptions;
- (MapsSuggestionsEngine)initWithEntryManager:(id)a3 resourceDepot:(id)a4;
- (NSString)uniqueName;
- (id)manager;
- (id)oneAppGuardian;
- (id)oneBiome;
- (id)oneContactActivity;
- (id)oneContacts;
- (id)oneEventKit;
- (id)oneFavorites;
- (id)oneFinanceKit;
- (id)oneFindMy;
- (id)oneFlightUpdater;
- (id)oneInsights;
- (id)oneMapsSync;
- (id)oneNetworkRequester;
- (id)onePortrait;
- (id)oneRoutine;
- (id)oneSourceDelegate;
- (id)oneUser;
- (id)oneVirtualGarage;
- (id)strategy;
- (id)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5;
- (id)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6;
- (int)mapType;
- (void)addAdditionalFilter:(id)a3 forSink:(id)a4;
- (void)attachSink:(id)a3;
- (void)detachSink:(id)a3;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)hintRefreshOfType:(int64_t)a3;
- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4;
- (void)setAutomobileOptions:(id)a3;
- (void)setMapType:(int)a3;
@end

@implementation MapsSuggestionsEngine

- (id)oneInsights
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneInsights];
}

- (id)oneFavorites
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneFavorites];
}

- (MapsSuggestionsEngine)initWithEntryManager:(id)a3 resourceDepot:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v20 = 1024;
      int v21 = 52;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsEngine initWithEntryManager:resourceDepot:]";
      __int16 v24 = 2082;
      v25 = "nil == (resourceDepot)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    }
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v20 = 1024;
      int v21 = 53;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsEngine initWithEntryManager:resourceDepot:]";
      __int16 v24 = 2082;
      v25 = "nil == (entryManager)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an EntryManager";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsEngine;
  v9 = [(MapsSuggestionsEngine *)&v17 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Maps.SuggestionsEngine", v10);
    optionsSerialQueue = v9->_optionsSerialQueue;
    v9->_optionsSerialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_resourceDepot, a4);
    objc_storeStrong((id *)&v9->_entryManager, a3);
    v9->_mapType = 0;
  }
  self = v9;
  v13 = self;
LABEL_12:

  return v13;
}

- (id)oneAppGuardian
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneAppGuardian];
}

- (void)hintRefreshOfType:(int64_t)a3
{
}

- (void)attachSink:(id)a3
{
}

void __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [*(id *)(a1 + 32) uniqueName];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2080;
    v14 = "topSuggestionsFromStorageFileWithCallback";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v11, 0x16u);
  }
  v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", "", (uint8_t *)&v11, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (BOOL)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = v14;
  if (!v13)
  {
    objc_super v17 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v20 = 136446978;
    int v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
    __int16 v22 = 1024;
    int v23 = 221;
    __int16 v24 = 2082;
    v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
    __int16 v26 = 2082;
    v27 = "nil == (callback)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion callback";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x26u);
    goto LABEL_12;
  }
  if (!v14)
  {
    objc_super v17 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v20 = 136446978;
    int v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
    __int16 v22 = 1024;
    int v23 = 222;
    __int16 v24 = 2082;
    v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
    __int16 v26 = 2082;
    v27 = "nil == (callbackQueue)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue to call back on";
    goto LABEL_11;
  }
  if (!v12)
  {
    objc_super v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v22 = 1024;
      int v23 = 223;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
      __int16 v26 = 2082;
      v27 = "nil == (sink)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink delegate";
      goto LABEL_11;
    }
LABEL_12:

    char v16 = 0;
    goto LABEL_13;
  }
  char v16 = [(MapsSuggestionsManager *)self->_entryManager oneShotTopSuggestionsForSink:v12 count:a4 transportType:v9 callback:v13 onQueue:v14];
LABEL_13:

  return v16;
}

void __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke(uint64_t a1, char a2)
{
  *(void *)&v24[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v22 = "MapsSuggestionsEngine.m";
      __int16 v23 = 1026;
      *(_DWORD *)__int16 v24 = 141;
      v24[2] = 2082;
      *(void *)&v24[3] = "-[MapsSuggestionsEngine topSuggestionsFromStorageFile:sink:count:transportType:callback:onQue"
                           "ue:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_19;
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      __int16 v22 = v16;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "Could not read from %@", buf, 0xCu);
    }

    objc_super v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v22 = v18;
      __int16 v23 = 2080;
      *(void *)__int16 v24 = "topSuggestionsFromStorageFileWithCallback";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    id v14 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", "", buf, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke_129;
  v19[3] = &unk_1E5CB7F40;
  uint64_t v7 = *(void *)(a1 + 40);
  v19[4] = *(void *)(a1 + 48);
  id v20 = *(id *)(a1 + 64);
  if (([WeakRetained topSuggestionsForSink:v7 count:v5 transportType:v6 callback:v19 onQueue:*(void *)(a1 + 56)] & 1) == 0)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = [*(id *)(a1 + 40) uniqueName];
    uint64_t v10 = (char *)[v8 initWithFormat:@"Could not call topSuggestionsForSink:%@", v9];

    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v22 = v10;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 64);
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:v10];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }

LABEL_20:
}

- (BOOL)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return [(MapsSuggestionsManager *)self->_entryManager topSuggestionsForSink:a3 count:a4 transportType:*(void *)&a5 callback:a6 onQueue:a7];
}

uint64_t __36__MapsSuggestionsEngine_setMapType___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    return [*(id *)(*(void *)(result + 32) + 16) setMapType:*(unsigned int *)(*(void *)(result + 32) + 32)];
  }
  return result;
}

- (void)addAdditionalFilter:(id)a3 forSink:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v15 = 1024;
      int v16 = 234;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngine addAdditionalFilter:forSink:]";
      __int16 v19 = 2082;
      id v20 = "nil == (filter)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter to add";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v7)
  {
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v15 = 1024;
      int v16 = 235;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngine addAdditionalFilter:forSink:]";
      __int16 v19 = 2082;
      id v20 = "nil == (sink)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sink to add it for";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  entryManager = self->_entryManager;
  uint64_t v10 = [v7 uniqueName];
  [(MapsSuggestionsManager *)entryManager addAdditionalFilter:v6 forSink:v10];

LABEL_10:
}

id *__46__MapsSuggestionsEngine_setAutomobileOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 40);
  result = (id *)(v2 + 40);
  if (v5 != v3)
  {
    objc_storeStrong(result, v3);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(*(void *)(a1 + 32) + 16);
    return (id *)[v7 setAutomobileOptions:v6];
  }
  return result;
}

- (void)setMapType:(int)a3
{
  optionsSerialQueue = self->_optionsSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MapsSuggestionsEngine_setMapType___block_invoke;
  v4[3] = &unk_1E5CB7D98;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(optionsSerialQueue, v4);
}

- (void)setAutomobileOptions:(id)a3
{
  id v4 = a3;
  optionsSerialQueue = self->_optionsSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MapsSuggestionsEngine_setAutomobileOptions___block_invoke;
  v7[3] = &unk_1E5CB8C20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(optionsSerialQueue, v7);
}

- (BOOL)saveStorageToFile:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (qword_1EB6F01A0 != -1) {
      dispatch_once(&qword_1EB6F01A0, &__block_literal_global_7);
    }
    id v6 = (id)_MergedGlobals_33;
  }
  char v8 = [(MapsSuggestionsManager *)self->_entryManager saveStorageToFile:v6 callback:v7];

  return v8;
}

- (BOOL)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    if (qword_1EB6F01A0 != -1) {
      dispatch_once(&qword_1EB6F01A0, &__block_literal_global_7);
    }
    id v8 = (id)_MergedGlobals_33;
  }
  char v11 = [(MapsSuggestionsManager *)self->_entryManager loadStorageFromFile:v8 callback:v9 callbackQueue:v10];

  return v11;
}

- (BOOL)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6 callback:(id)a7 onQueue:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v18 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = [(MapsSuggestionsEngine *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v37 = v19;
    __int16 v38 = 2080;
    v39 = "topSuggestionsFromStorageFileWithCallback";
    _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v20 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", "", buf, 2u);
  }

  if (!v14)
  {
    if (qword_1EB6F01A0 != -1) {
      dispatch_once(&qword_1EB6F01A0, &__block_literal_global_7);
    }
    id v14 = (id)_MergedGlobals_33;
  }
  objc_initWeak((id *)buf, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke;
  v28[3] = &unk_1E5CB8BD0;
  objc_copyWeak(v34, (id *)buf);
  id v21 = v14;
  id v29 = v21;
  id v22 = v15;
  v34[1] = (id)a5;
  int v35 = a6;
  id v30 = v22;
  v31 = self;
  id v23 = v16;
  id v33 = v23;
  id v24 = v17;
  id v32 = v24;
  v25 = dispatch_get_global_queue(0, 0);
  BOOL v26 = [(MapsSuggestionsEngine *)self loadStorageFromFile:v21 callback:v28 callbackQueue:v25];

  objc_destroyWeak(v34);
  objc_destroyWeak((id *)buf);

  return v26;
}

- (NSString)uniqueName
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)detachSink:(id)a3
{
}

- (id)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("MapsSuggestionsEngineSynced1", v10);

  uint64_t v12 = dispatch_group_create();
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__5;
  id v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  dispatch_group_enter(v12);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__MapsSuggestionsEngine_topSuggestionsForSink_count_transportType___block_invoke;
  v19[3] = &unk_1E5CB8BA8;
  id v21 = &v29;
  id v22 = &v23;
  int v13 = v12;
  id v20 = v13;
  [(MapsSuggestionsEngine *)self topSuggestionsForSink:v9 count:a4 transportType:v5 callback:v19 onQueue:v11];
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    GEOFindOrCreateLog();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      uint64_t v16 = v30[5];
      *(_DWORD *)buf = 138412546;
      v36 = v15;
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%@ received error: %@", buf, 0x16u);
    }
  }
  id v17 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __67__MapsSuggestionsEngine_topSuggestionsForSink_count_transportType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  objc_initWeak(&location, a4);
  GEOFindOrCreateLog();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = [(MapsSuggestionsEngine *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "topSuggestionsFromStorageFile";
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v14 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", "", buf, 2u);
  }

  if (!v11)
  {
    if (qword_1EB6F01A0 != -1) {
      dispatch_once(&qword_1EB6F01A0, &__block_literal_global_7);
    }
    id v11 = (id)_MergedGlobals_33;
  }
  if ([(MapsSuggestionsEngine *)self loadStorageFromFile:v11])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__5;
    v43 = __Block_byref_object_dispose__5;
    id v44 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    id v16 = objc_loadWeakRetained(&location);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __80__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType___block_invoke;
    id v32 = &unk_1E5CB8BF8;
    SEL v35 = a2;
    id v17 = v15;
    id v33 = v17;
    id v34 = buf;
    v18 = dispatch_get_global_queue(17, 0);
    [(MapsSuggestionsEngine *)self topSuggestionsForSink:v16 count:a5 transportType:v6 callback:&v29 onQueue:v18];

    dispatch_time_t v19 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v17, v19);
    GEOFindOrCreateLog();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [(MapsSuggestionsEngine *)self uniqueName];
      *(_DWORD *)__int16 v37 = 138412546;
      uint64_t v38 = v21;
      __int16 v39 = 2080;
      uint64_t v40 = "topSuggestionsFromStorageFile";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v37, 0x16u);
    }
    id v22 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)__int16 v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", "", v37, 2u);
    }

    id v23 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "Could not read from %@", buf, 0xCu);
    }

    GEOFindOrCreateLog();
    uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      BOOL v26 = [(MapsSuggestionsEngine *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "topSuggestionsFromStorageFile";
      _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v27 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", "", buf, 2u);
    }

    id v23 = 0;
  }
  objc_destroyWeak(&location);

  return v23;
}

void __80__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v12 = 138412546;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%@ returned with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v5)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v15 = 1024;
      int v16 = 241;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngine removeAdditionalFilter:forSink:]";
      __int16 v19 = 2082;
      id v20 = "nil == (filter)";
      int v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter to remove";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v7)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v15 = 1024;
      int v16 = 242;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngine removeAdditionalFilter:forSink:]";
      __int16 v19 = 2082;
      id v20 = "nil == (sink)";
      int v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sink to remove it for";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  entryManager = self->_entryManager;
  uint64_t v10 = [v7 uniqueName];
  [(MapsSuggestionsManager *)entryManager removeAdditionalFilter:v6 forSink:v10];

LABEL_10:
}

- (BOOL)loadStorageFromFile:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (qword_1EB6F01A0 != -1) {
      dispatch_once(&qword_1EB6F01A0, &__block_literal_global_7);
    }
    id v4 = (id)_MergedGlobals_33;
  }
  BOOL v5 = [(MapsSuggestionsManager *)self->_entryManager loadStorageFromFile:v4];

  return v5;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(MapsSuggestionsManager *)self->_entryManager removeEntry:a3 behavior:a4 handler:a5];
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v10 = 1024;
      int v11 = 315;
      __int16 v12 = 2082;
      int v13 = "-[MapsSuggestionsEngine removeEntry:behavior:handler:]";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v8, 0x26u);
    }
  }
  return a3 != 0;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    entryManager = self->_entryManager;
    -[MapsSuggestionsManager feedbackForEntry:action:](entryManager, "feedbackForEntry:action:");
  }
  else
  {
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v8 = 1024;
      int v9 = 326;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsEngine feedbackForEntry:action:]";
      __int16 v12 = 2082;
      int v13 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    entryManager = self->_entryManager;
    -[MapsSuggestionsManager feedbackForMapItem:action:](entryManager, "feedbackForMapItem:action:");
  }
  else
  {
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v8 = 1024;
      int v9 = 333;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsEngine feedbackForMapItem:action:]";
      __int16 v12 = 2082;
      int v13 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    entryManager = self->_entryManager;
    -[MapsSuggestionsManager feedbackForContact:action:](entryManager, "feedbackForContact:action:");
  }
  else
  {
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      __int16 v8 = 1024;
      int v9 = 341;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsEngine feedbackForContact:action:]";
      __int16 v12 = 2082;
      int v13 = "nil == (contact)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (id)manager
{
  return self->_entryManager;
}

- (id)strategy
{
  return [(MapsSuggestionsManager *)self->_entryManager strategy];
}

- (id)oneSourceDelegate
{
  return self->_entryManager;
}

- (id)oneNetworkRequester
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneNetworkRequester];
}

- (id)oneRoutine
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneRoutine];
}

- (id)onePortrait
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot onePortrait];
}

- (id)oneEventKit
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneEventKit];
}

- (id)oneMapsSync
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneMapsSync];
}

- (id)oneContacts
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneContacts];
}

- (id)oneFlightUpdater
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneFlightUpdater];
}

- (id)oneUser
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneUser];
}

- (id)oneVirtualGarage
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneVirtualGarage];
}

- (id)oneBiome
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneBiome];
}

- (id)oneFindMy
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneFindMy];
}

- (id)oneFinanceKit
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneFinanceKit];
}

- (id)oneContactActivity
{
  return (id)[(MapsSuggestionsResourceDepot *)self->_resourceDepot oneContactActivity];
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_optionsSerialQueue, 0);
  objc_storeStrong((id *)&self->_entryManager, 0);
  objc_storeStrong((id *)&self->_resourceDepot, 0);
}

@end