@interface MapsSuggestionsMapsSyncShortcutStorage
- (BOOL)addOrUpdateShortcuts:(id)a3 handler:(id)a4;
- (BOOL)loadAllShortcutsWithHandler:(id)a3;
- (BOOL)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5;
- (BOOL)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5;
- (BOOL)moveShortcut:(id)a3 toIndex:(int64_t)a4 handler:(id)a5;
- (BOOL)moveShortcutToBack:(id)a3 handler:(id)a4;
- (BOOL)moveShortcutToFront:(id)a3 handler:(id)a4;
- (BOOL)removeShortcuts:(id)a3 handler:(id)a4;
- (MapsSuggestionsMapsSyncShortcutStorage)init;
- (NSArray)storeSubscriptionTypes;
- (NSString)uniqueName;
- (OS_dispatch_queue)callbackQueue;
- (void)setCallbackQueue:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation MapsSuggestionsMapsSyncShortcutStorage

- (MapsSuggestionsMapsSyncShortcutStorage)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsMapsSyncShortcutStorage;
  v2 = [(MapsSuggestionsMapsSyncShortcutStorage *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsMapsSyncShortcutStorage.callbacks", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    v11[0] = objc_opt_class();
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v6;

    v8 = [MEMORY[0x1E4F74378] sharedStore];
    [v8 subscribe:v2];
  }
  return v2;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)setChangeHandler:(id)a3
{
  dispatch_queue_t v4 = (void *)[a3 copy];
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = v4;
}

- (BOOL)loadAllShortcutsWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = a3;
    if (self)
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F74370]) initWithOffset:0 limit:100];
      v7 = [MEMORY[0x1E4F74390] queryPredicateWithFormat:@"version < 2" argumentArray:0];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F74388]) initWithPredicate:v7 sortDescriptors:0 range:v6];
      id v9 = objc_alloc_init(MEMORY[0x1E4F74310]);
      *(void *)v11 = MEMORY[0x1E4F143A8];
      *(void *)&v11[8] = 3221225472;
      *(void *)&v11[16] = __71__MapsSuggestionsMapsSyncShortcutStorage__loadAllShortcutsWithHandler___block_invoke;
      *(void *)&v11[24] = &unk_1E5CB7EF0;
      *(void *)&v11[32] = v5;
      [v9 fetchWithOptions:v8 completionHandler:v11];
    }
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136446978;
      *(void *)&v11[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 84;
      *(_WORD *)&v11[18] = 2082;
      *(void *)&v11[20] = "-[MapsSuggestionsMapsSyncShortcutStorage loadAllShortcutsWithHandler:]";
      *(_WORD *)&v11[28] = 2082;
      *(void *)&v11[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v11, 0x26u);
    }
  }

  return a3 != 0;
}

void __71__MapsSuggestionsMapsSyncShortcutStorage__loadAllShortcutsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        v14 = [MapsSuggestionsShortcut alloc];
        v15 = -[MapsSuggestionsShortcut initWithFavoriteItem:](v14, "initWithFavoriteItem:", v13, (void)v16);
        if (MapsSuggestionsMapsSyncStorageShouldServeShortcut(v15)) {
          [v7 addObject:v15];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)addOrUpdateShortcuts:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 111;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsMapsSyncShortcutStorage addOrUpdateShortcuts:handler:]";
      __int16 v22 = 2082;
      v23 = "nil == (handler)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 112;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsMapsSyncShortcutStorage addOrUpdateShortcuts:handler:]";
      __int16 v22 = 2082;
      v23 = "nil == (shortcuts)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsMapsSyncShortcutStorage_addOrUpdateShortcuts_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  BOOL v10 = 1;
  uint64_t v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __71__MapsSuggestionsMapsSyncShortcutStorage_addOrUpdateShortcuts_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeShortcuts:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 124;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsMapsSyncShortcutStorage removeShortcuts:handler:]";
      __int16 v22 = 2082;
      v23 = "nil == (handler)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 125;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsMapsSyncShortcutStorage removeShortcuts:handler:]";
      __int16 v22 = 2082;
      v23 = "nil == (shortcuts)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsMapsSyncShortcutStorage_removeShortcuts_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  BOOL v10 = 1;
  uint64_t v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __66__MapsSuggestionsMapsSyncShortcutStorage_removeShortcuts_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 toIndex:(int64_t)a4 handler:(id)a5
{
  id v6 = a5;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_toIndex_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(callbackQueue, block);

  return 1;
}

uint64_t __71__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_toIndex_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    __int16 v21 = 1024;
    int v22 = 146;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
    __int16 v25 = 2082;
    v26 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    __int16 v21 = 1024;
    int v22 = 147;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
    __int16 v25 = 2082;
    v26 = "nil == (shortcut)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
    goto LABEL_11;
  }
  if (!v9)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v21 = 1024;
      int v22 = 148;
      __int16 v23 = 2082;
      uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (other)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_11;
    }
LABEL_12:
    BOOL v13 = 0;
    goto LABEL_13;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_afterShortcut_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  __int16 v18 = v10;
  dispatch_async(callbackQueue, block);
  BOOL v13 = 1;
  v14 = v18;
LABEL_13:

  return v13;
}

uint64_t __77__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_afterShortcut_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    __int16 v21 = 1024;
    int v22 = 160;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
    __int16 v25 = 2082;
    v26 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    __int16 v21 = 1024;
    int v22 = 161;
    __int16 v23 = 2082;
    uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
    __int16 v25 = 2082;
    v26 = "nil == (shortcut)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
    goto LABEL_11;
  }
  if (!v9)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v21 = 1024;
      int v22 = 162;
      __int16 v23 = 2082;
      uint64_t v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (other)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_11;
    }
LABEL_12:
    BOOL v13 = 0;
    goto LABEL_13;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_beforeShortcut_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  __int16 v18 = v10;
  dispatch_async(callbackQueue, block);
  BOOL v13 = 1;
  v14 = v18;
LABEL_13:

  return v13;
}

uint64_t __78__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_beforeShortcut_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcutToBack:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 174;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToBack:handler:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (handler)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 175;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToBack:handler:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (shortcut)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToBack_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  BOOL v10 = 1;
  id v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __69__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToBack_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcutToFront:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 187;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToFront:handler:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (handler)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v18 = 1024;
      int v19 = 188;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToFront:handler:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (shortcut)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToFront_handler___block_invoke;
  block[3] = &unk_1E5CB8C48;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  BOOL v10 = 1;
  id v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __70__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToFront_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  objc_initWeak(&location, self);
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__MapsSuggestionsMapsSyncShortcutStorage_storeDidChangeWithTypes___block_invoke;
  v5[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, &location);
  dispatch_async(callbackQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__MapsSuggestionsMapsSyncShortcutStorage_storeDidChangeWithTypes___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 1);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_queue_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsMapsSyncShortcutStorage.m";
      __int16 v7 = 1026;
      int v8 = 202;
      __int16 v9 = 2082;
      BOOL v10 = "-[MapsSuggestionsMapsSyncShortcutStorage storeDidChangeWithTypes:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end