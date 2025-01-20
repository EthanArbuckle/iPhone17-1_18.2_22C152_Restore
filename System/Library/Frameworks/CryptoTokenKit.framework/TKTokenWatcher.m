@interface TKTokenWatcher
- (NSArray)tokenIDs;
- (NSXPCListenerEndpoint)endpoint;
- (TKClientToken)client;
- (TKTokenWatcher)init;
- (TKTokenWatcher)initWithClient:(id)a3;
- (TKTokenWatcher)initWithEndpoint:(id)a3;
- (TKTokenWatcher)initWithInsertionHandler:(void *)insertionHandler;
- (TKTokenWatcherTokenInfo)tokenInfoForTokenID:(NSString *)tokenID;
- (void)addRemovalHandler:(void *)removalHandler forTokenID:(NSString *)tokenID;
- (void)dealloc;
- (void)insertedToken:(id)a3;
- (void)removeAllTokens;
- (void)removedToken:(id)a3;
- (void)setInsertionHandler:(void *)insertionHandler;
- (void)startWatching;
@end

@implementation TKTokenWatcher

- (void)startWatching
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "Failed to get TKTokenWatcher endpoint, watcher will be mute.", v1, 2u);
}

void __31__TKTokenWatcher_startWatching__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;

    [v2 removeAllTokens];
  }
  v4 = TK_LOG_watcher();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__TKTokenWatcher_startWatching__block_invoke_cold_1(v4);
  }
}

void __31__TKTokenWatcher_startWatching__block_invoke_43(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = TK_LOG_watcher();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __31__TKTokenWatcher_startWatching__block_invoke_43_cold_1((uint64_t)v2, v3);
  }
}

void __31__TKTokenWatcher_startWatching__block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "firstObject", (void)v14);
        if (v10)
        {
          v11 = *(void **)(*(void *)(a1 + 32) + 24);
          v12 = [v9 firstObject];
          v13 = [v11 objectForKeyedSubscript:v12];
          LODWORD(v11) = v13 == 0;

          if (v11) {
            [*(id *)(a1 + 32) insertedToken:v9];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (TKTokenWatcher)initWithClient:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TKTokenWatcher;
  id v5 = [(TKTokenWatcher *)&v20 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = (TKClientToken *)v4;
    }
    else {
      uint64_t v6 = [[TKClientToken alloc] initWithTokenID:&stru_1F19EDBB0];
    }
    client = v5->_client;
    v5->_client = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    removalHandlers = v5->_removalHandlers;
    v5->_removalHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CC08] mutableCopy];
    tokenInfos = v5->_tokenInfos;
    v5->_tokenInfos = (NSMutableDictionary *)v10;

    [(TKTokenWatcher *)v5 startWatching];
    objc_initWeak(&location, v5);
    v12 = (const char *)[@"com.apple.ctkd.watcher-started" UTF8String];
    v13 = dispatch_queue_create("server-start-notify-q", 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__TKTokenWatcher_initWithClient___block_invoke;
    v17[3] = &unk_1E63C9300;
    objc_copyWeak(&v18, &location);
    uint32_t v14 = notify_register_dispatch(v12, &v5->_notifyToken, v13, v17);

    if (v14)
    {
      long long v15 = TK_LOG_watcher();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TKTokenWatcher initWithClient:](v14, v15);
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __33__TKTokenWatcher_initWithClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startWatching];
}

- (TKTokenWatcher)init
{
  return [(TKTokenWatcher *)self initWithClient:0];
}

- (TKTokenWatcher)initWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [[TKClientToken alloc] initWithTokenID:&stru_1F19EDBB0 serverEndpoint:v4 targetUID:0];

  uint64_t v6 = [(TKTokenWatcher *)self initWithClient:v5];
  return v6;
}

- (NSXPCListenerEndpoint)endpoint
{
  id v2 = [(TKTokenWatcher *)self client];
  id v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKTokenWatcher;
  [(TKTokenWatcher *)&v3 dealloc];
}

- (TKTokenWatcher)initWithInsertionHandler:(void *)insertionHandler
{
  id v4 = insertionHandler;
  id v5 = [(TKTokenWatcher *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(NSXPCConnection *)v5->_connection _queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__TKTokenWatcher_initWithInsertionHandler___block_invoke;
    v9[3] = &unk_1E63C8380;
    uint64_t v10 = v6;
    id v11 = v4;
    dispatch_async(v7, v9);
  }
  return v6;
}

uint64_t __43__TKTokenWatcher_initWithInsertionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInsertionHandler:*(void *)(a1 + 40)];
}

- (void)setInsertionHandler:(void *)insertionHandler
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = insertionHandler;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = MEMORY[0x1C189CA40](v4);
  id v7 = v5->_insertionHandler;
  v5->_insertionHandler = (id)v6;

  if (v5->_insertionHandler)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = v5->_tokenInfos;
    uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          (*((void (**)(id))v5->_insertionHandler + 2))(v5->_insertionHandler);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  objc_sync_exit(v5);
}

- (void)addRemovalHandler:(void *)removalHandler forTokenID:(NSString *)tokenID
{
  uint64_t v11 = removalHandler;
  uint64_t v6 = tokenID;
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableDictionary *)v7->_tokenInfos objectForKeyedSubscript:v6];

  if (v8)
  {
    removalHandlers = v7->_removalHandlers;
    uint64_t v10 = (void *)MEMORY[0x1C189CA40](v11);
    [(NSMutableDictionary *)removalHandlers setObject:v10 forKey:v6];
  }
  else
  {
    v11[2](v11, v6);
  }
  objc_sync_exit(v7);
}

- (void)insertedToken:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [[TKTokenWatcherTokenInfo alloc] initWithTokenInfo:v12];
  uint64_t v6 = NSStringFromSelector(sel_tokenIDs);
  [(TKTokenWatcher *)v4 willChangeValueForKey:v6];

  tokenInfos = v4->_tokenInfos;
  uint64_t v8 = [(TKTokenWatcherTokenInfo *)v5 tokenID];
  [(NSMutableDictionary *)tokenInfos setObject:v5 forKeyedSubscript:v8];

  uint64_t v9 = NSStringFromSelector(sel_tokenIDs);
  [(TKTokenWatcher *)v4 didChangeValueForKey:v9];

  insertionHandler = (void (**)(id, void *))v4->_insertionHandler;
  if (insertionHandler)
  {
    uint64_t v11 = [(TKTokenWatcherTokenInfo *)v5 tokenID];
    insertionHandler[2](insertionHandler, v11);
  }
  objc_sync_exit(v4);
}

- (void)removedToken:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_tokenInfos objectForKeyedSubscript:v10];

  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_tokenIDs);
    [(TKTokenWatcher *)v4 willChangeValueForKey:v6];

    [(NSMutableDictionary *)v4->_tokenInfos removeObjectForKey:v10];
    id v7 = NSStringFromSelector(sel_tokenIDs);
    [(TKTokenWatcher *)v4 didChangeValueForKey:v7];

    uint64_t v8 = [(NSMutableDictionary *)v4->_removalHandlers objectForKey:v10];
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
      [(NSMutableDictionary *)v4->_removalHandlers removeObjectForKey:v10];
    }
  }
  objc_sync_exit(v4);
}

- (void)removeAllTokens
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "all tokens removed", v1, 2u);
}

- (NSArray)tokenIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_tokenInfos allKeys];
}

- (TKTokenWatcherTokenInfo)tokenInfoForTokenID:(NSString *)tokenID
{
  id v4 = tokenID;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_tokenInfos objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return (TKTokenWatcherTokenInfo *)v6;
}

- (TKClientToken)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_insertionHandler, 0);
  objc_storeStrong((id *)&self->_removalHandlers, 0);
  objc_storeStrong((id *)&self->_tokenInfos, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __31__TKTokenWatcher_startWatching__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "connection to the watcher endpoint invalidated/interrupted!", v1, 2u);
}

void __31__TKTokenWatcher_startWatching__block_invoke_43_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "failed to register TKTokenWatcher, error %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithClient:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.ctkd.watcher-started";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "registering notification '%@' failed with status %u", (uint8_t *)&v2, 0x12u);
}

@end