@interface MapsSuggestionsRealBiomeConnector
- (BOOL)getFindMyStreamsWithHandler:(id)a3;
- (BOOL)getSmartRepliesStreamsWithHandler:(id)a3;
- (BOOL)registerForFindMyUpdatesWithHandler:(id)a3;
- (BOOL)registerForSmartRepliesUpdatesWithHandler:(id)a3;
- (MapsSuggestionsRealBiomeConnector)init;
- (NSString)uniqueName;
- (void)unregisterFindMyUpdates;
- (void)unregisterSmartRepliesUpdates;
@end

@implementation MapsSuggestionsRealBiomeConnector

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = BiomeLibrary();
  v3 = [v2 Maps];
  v4 = [v3 Suggestions];
  v5 = [v4 RecentConversationsIntent];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:a1[4] endDate:a1[5] maxEvents:a1[8] lastN:0 reversed:0];
  v7 = [v5 publisherWithOptions:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [v7 filterWithIsIncluded:&__block_literal_global_20];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_3;
  v21[3] = &unk_1E5CB9BD0;
  v21[4] = a1[7];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_19;
  v19 = &unk_1E5CB9BF8;
  id v10 = v8;
  id v20 = v10;
  id v11 = (id)[v9 sinkWithCompletion:v21 receiveInput:&v16];

  v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_msgSend(v10, "count", v16, v17, v18, v19);
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_INFO, "Sending %lu SmartReplies Streams", buf, 0xCu);
  }

  uint64_t v14 = a1[6];
  v15 = (void *)[v10 copy];
  (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, *(void *)(*(void *)(a1[7] + 8) + 40));
}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = BiomeLibrary();
  v3 = [v2 FindMy];
  v4 = [v3 ContactActivity];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:a1[4] endDate:a1[5] maxEvents:a1[8] lastN:0 reversed:0];
  v6 = [v4 publisherWithOptions:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 filterWithIsIncluded:&__block_literal_global_28_0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_3;
  v20[3] = &unk_1E5CB9BD0;
  v20[4] = a1[7];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_30;
  v18 = &unk_1E5CB9BF8;
  id v9 = v7;
  id v19 = v9;
  id v10 = (id)[v8 sinkWithCompletion:v20 receiveInput:&v15];

  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend(v9, "count", v15, v16, v17, v18);
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_INFO, "Sending %lu FindMy Streams", buf, 0xCu);
  }

  uint64_t v13 = a1[6];
  uint64_t v14 = (void *)[v9 copy];
  (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, *(void *)(*(void *)(a1[7] + 8) + 40));
}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v8 = [v3 error];
    id v9 = (void *)[v8 copy];
    [v4 addObject:v9];

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 error];
      uint64_t v12 = [v11 localizedDescription];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v8 = [v3 error];
    id v9 = (void *)[v8 copy];
    [v4 addObject:v9];

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 error];
      uint64_t v12 = [v11 localizedDescription];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)getSmartRepliesStreamsWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Querying Biome+SmartReplies for events", buf, 2u);
    }

    id v7 = MapsSuggestionsNowWithOffset(-self->_lookbackDuration);
    id v8 = MapsSuggestionsNow();
    int64_t v9 = self->_maxEvents & ~(self->_maxEvents >> 63);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__11;
    *(void *)&buf[32] = __Block_byref_object_dispose__11;
    id v20 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke;
    block[3] = &unk_1E5CB9C20;
    id v14 = v7;
    id v15 = v8;
    uint64_t v17 = buf;
    int64_t v18 = v9;
    id v16 = v4;
    id v11 = v8;
    uint64_t v6 = v7;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 69;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector getSmartRepliesStreamsWithHandler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (handler)";
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", buf, 0x26u);
  }

  return v4 != 0;
}

- (BOOL)getFindMyStreamsWithHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = MapsSuggestionsNowWithOffset(-self->_lookbackDuration);
    uint64_t v6 = MapsSuggestionsNow();
    int64_t maxEvents = self->_maxEvents;
    *(void *)uint64_t v21 = 0;
    *(void *)&v21[8] = v21;
    *(void *)&v21[16] = 0x3032000000;
    *(void *)&v21[24] = __Block_byref_object_copy__11;
    *(void *)&v21[32] = __Block_byref_object_dispose__11;
    id v22 = 0;
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Querying Biome+FindMy for events", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke;
    block[3] = &unk_1E5CB9C20;
    id v15 = v5;
    id v16 = v6;
    int64_t v18 = v21;
    uint64_t v19 = maxEvents & ~(maxEvents >> 63);
    id v17 = v4;
    id v10 = v6;
    id v11 = v5;
    dispatch_async(queue, block);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v21 = 136446978;
      *(void *)&v21[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 151;
      *(_WORD *)&v21[18] = 2082;
      *(void *)&v21[20] = "-[MapsSuggestionsRealBiomeConnector getFindMyStreamsWithHandler:]";
      *(_WORD *)&v21[28] = 2082;
      *(void *)&v21[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", v21, 0x26u);
    }
  }
  return v4 != 0;
}

- (MapsSuggestionsRealBiomeConnector)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRealBiomeConnector;
  v2 = [(MapsSuggestionsRealBiomeConnector *)&v12 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsRealBiomeConnector", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    GEOConfigGetDouble();
    v2->_lookbackDuration = v6;
    v2->_int64_t maxEvents = GEOConfigGetInteger();
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.maps.destinationd_smartReplies" targetQueue:v2->_queue];
    smartRepliesScheduler = v2->_smartRepliesScheduler;
    v2->_smartRepliesScheduler = (BMBiomeScheduler *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.maps.destinationd_findMy" targetQueue:v2->_queue];
    findMyScheduler = v2->_findMyScheduler;
    v2->_findMyScheduler = (BMBiomeScheduler *)v9;
  }
  return v2;
}

BOOL __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v2 actionType] == 18;

  return v3;
}

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    dispatch_queue_t v4 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v3 = v8;
    if (isKindOfClass)
    {
      double v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v8 eventBody];
      [v6 addObject:v7];

      id v3 = v8;
    }
  }
}

- (BOOL)registerForSmartRepliesUpdatesWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = BiomeLibrary();
    double v6 = [v5 Maps];
    uint64_t v7 = [v6 Suggestions];
    id v8 = [v7 RecentConversationsIntent];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__11;
    *(void *)&buf[32] = __Block_byref_object_dispose__11;
    id v20 = 0;
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke;
    block[3] = &unk_1E5CB9C70;
    objc_copyWeak(&v17, &location);
    id v14 = v8;
    id v15 = v4;
    id v16 = buf;
    id v10 = v8;
    dispatch_async(queue, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 110;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", buf, 0x26u);
    }
  }
  return v4 != 0;
}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    id v5 = (void *)WeakRetained[7];
    WeakRetained[7] = v4;

    if (!WeakRetained[6])
    {
      double v6 = [*(id *)(a1 + 32) DSLPublisher];
      uint64_t v7 = [v6 subscribeOn:WeakRetained[5]];
      id v8 = [v7 filterWithIsIncluded:&__block_literal_global_24_0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_2;
      v14[3] = &unk_1E5CB9BD0;
      v14[4] = *(void *)(a1 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_25;
      v12[3] = &unk_1E5CB9C48;
      objc_copyWeak(&v13, v2);
      v12[4] = *(void *)(a1 + 48);
      uint64_t v9 = [v8 sinkWithCompletion:v14 receiveInput:v12];
      id v10 = (void *)WeakRetained[6];
      WeakRetained[6] = v9;

      objc_destroyWeak(&v13);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v16 = "MapsSuggestionsRealBiomeConnector.m";
      __int16 v17 = 1026;
      int v18 = 117;
      __int16 v19 = 2082;
      id v20 = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

BOOL __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_22(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v2 actionType] == 18;

  return v3;
}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v8 = [v3 error];
    uint64_t v9 = (void *)[v8 copy];
    [v4 addObject:v9];

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 error];
      objc_super v12 = [v11 localizedDescription];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      objc_super v12 = "MapsSuggestionsRealBiomeConnector.m";
      __int16 v13 = 1026;
      int v14 = 128;
      __int16 v15 = 2082;
      id v16 = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    id v8 = v9;
    goto LABEL_8;
  }
  if (v3)
  {
    id v5 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = WeakRetained[7];
      id v8 = [v3 eventBody];
      id v10 = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      (*(void (**)(uint64_t, NSObject *, void))(v7 + 16))(v7, v9, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
LABEL_8:
    }
  }
}

- (void)unregisterSmartRepliesUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsRealBiomeConnector_unregisterSmartRepliesUpdates__block_invoke;
  block[3] = &unk_1E5CB8D10;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void *__66__MapsSuggestionsRealBiomeConnector_unregisterSmartRepliesUpdates__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (void *)[result cancel];
  }
  return result;
}

BOOL __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v2 actionType] != 0;

  return v3;
}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    uint64_t v4 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v3 = v8;
    if (isKindOfClass)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v8 eventBody];
      [v6 addObject:v7];

      id v3 = v8;
    }
  }
}

- (BOOL)registerForFindMyUpdatesWithHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = BiomeLibrary();
    uint64_t v6 = [v5 FindMy];
    uint64_t v7 = [v6 ContactActivity];

    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke;
    block[3] = &unk_1E5CB95E8;
    objc_copyWeak(&v15, (id *)location);
    id v13 = v7;
    id v14 = v4;
    id v9 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      __int16 v17 = 1024;
      int v18 = 192;
      __int16 v19 = 2082;
      id v20 = "-[MapsSuggestionsRealBiomeConnector registerForFindMyUpdatesWithHandler:]";
      __int16 v21 = 2082;
      id v22 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }
  }
  return v4 != 0;
}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[5] copy];
    id v4 = (void *)WeakRetained[11];
    WeakRetained[11] = v3;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__11;
    id v14 = __Block_byref_object_dispose__11;
    id v15 = 0;
    if (!WeakRetained[10])
    {
      id v5 = [a1[4] DSLPublisher];
      uint64_t v6 = [v5 subscribeOn:WeakRetained[9]];
      uint64_t v7 = [v6 filterWithIsIncluded:&__block_literal_global_33];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_2;
      v12[3] = &unk_1E5CB9BD0;
      v12[4] = buf;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_34;
      v11[3] = &unk_1E5CB9C98;
      v11[4] = WeakRetained;
      v11[5] = buf;
      uint64_t v8 = [v7 sinkWithCompletion:v12 receiveInput:v11];
      id v9 = (void *)WeakRetained[10];
      WeakRetained[10] = v8;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector registerForFindMyUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

BOOL __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_31(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v2 actionType] != 0;

  return v3;
}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    uint64_t v8 = [v3 error];
    id v9 = (void *)[v8 copy];
    [v4 addObject:v9];

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 error];
      objc_super v12 = [v11 localizedDescription];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_34(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 88);
      uint64_t v8 = [v4 eventBody];
      v10[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
  }
}

- (void)unregisterFindMyUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MapsSuggestionsRealBiomeConnector_unregisterFindMyUpdates__block_invoke;
  block[3] = &unk_1E5CB8D10;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void *__60__MapsSuggestionsRealBiomeConnector_unregisterFindMyUpdates__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 80);
  if (result) {
    return (void *)[result cancel];
  }
  return result;
}

- (NSString)uniqueName
{
  return self->uniqueName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uniqueName, 0);
  objc_storeStrong(&self->_findMyUpdateHandler, 0);
  objc_storeStrong((id *)&self->_findMySink, 0);
  objc_storeStrong((id *)&self->_findMyScheduler, 0);
  objc_storeStrong(&self->_smartRepliesUpdateHandler, 0);
  objc_storeStrong((id *)&self->_smartRepliesSink, 0);
  objc_storeStrong((id *)&self->_smartRepliesScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end