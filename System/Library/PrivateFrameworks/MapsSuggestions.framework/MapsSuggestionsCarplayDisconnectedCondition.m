@interface MapsSuggestionsCarplayDisconnectedCondition
- (BOOL)isInitialized;
- (BOOL)isTrue;
- (MapsSuggestionsCarplayDisconnectedCondition)initWithDisconnectDelay:(double)a3;
- (NSDate)disconnectTime;
- (void)sessionDidDisconnect:(id)a3;
- (void)setDisconnectTime:(id)a3;
- (void)setIsInitialized:(BOOL)a3;
@end

@implementation MapsSuggestionsCarplayDisconnectedCondition

- (MapsSuggestionsCarplayDisconnectedCondition)initWithDisconnectDelay:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsCarplayDisconnectedCondition;
  v4 = [(MapsSuggestionsBaseCondition *)&v11 initWithName:@"MapsSuggestionsCarplayDisconnectedCondition"];
  v5 = v4;
  if (v4)
  {
    v4->_disconnectDelay = a3;
    v4->_isInitialized = 0;
    objc_initWeak(&location, v4);
    v6 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__MapsSuggestionsCarplayDisconnectedCondition_initWithDisconnectDelay___block_invoke;
    v8[3] = &unk_1E5CB8058;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __71__MapsSuggestionsCarplayDisconnectedCondition_initWithDisconnectDelay___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v2 = (void *)_MergedGlobals_1_0;
    uint64_t v11 = _MergedGlobals_1_0;
    if (!_MergedGlobals_1_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCARSessionStatusClass_block_invoke;
      *(void *)&buf[24] = &unk_1E5CB9F00;
      v13 = &v8;
      __getCARSessionStatusClass_block_invoke((uint64_t)buf);
      v2 = (void *)v9[3];
    }
    v3 = v2;
    _Block_object_dispose(&v8, 8);
    id v4 = [v3 alloc];
    uint64_t v5 = objc_msgSend(v4, "initAndWaitUntilSessionUpdated", v8);
    id v6 = WeakRetained[2];
    WeakRetained[2] = (id)v5;

    [WeakRetained[2] addSessionObserver:WeakRetained];
    v7 = WeakRetained;
    objc_sync_enter(v7);
    LOBYTE(v7[4].isa) = 1;
    objc_sync_exit(v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "MapsSuggestionsCarplayDisconnectedCondition.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 41;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsCarplayDisconnectedCondition initWithDisconnectDelay:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (BOOL)isTrue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_isInitialized)
  {
    objc_sync_exit(v2);

    v3 = [(CARSessionStatus *)v2->_carSessionStatus currentSession];

    if (v3)
    {
      GEOFindOrCreateLog();
      id v4 = (MapsSuggestionsCarplayDisconnectedCondition *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A70DF000, &v4->super.super, OS_LOG_TYPE_DEBUG, "Failed because still connected to carplay", (uint8_t *)&v11, 2u);
      }
      BOOL v5 = 0;
    }
    else
    {
      id v4 = v2;
      objc_sync_enter(v4);
      disconnectTime = v4->_disconnectTime;
      if (disconnectTime && MapsSuggestionsSecondsSince(disconnectTime) <= v4->_disconnectDelay)
      {
        uint64_t v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          id v9 = v4->_disconnectTime;
          int v11 = 138412290;
          v12 = v9;
          _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Failed because disconnected only at %@", (uint8_t *)&v11, 0xCu);
        }

        BOOL v5 = 0;
      }
      else
      {
        BOOL v5 = 1;
      }
      objc_sync_exit(v4);
    }
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Carplay session not yet initialized", (uint8_t *)&v11, 2u);
    }

    objc_sync_exit(v2);
    BOOL v5 = 0;
    id v4 = v2;
  }

  return v5;
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MapsSuggestionsCarplayDisconnectedCondition sessionDidDisconnect:]";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = MapsSuggestionsNow();
  disconnectTime = v6->_disconnectTime;
  v6->_disconnectTime = (NSDate *)v7;

  objc_sync_exit(v6);
}

- (NSDate)disconnectTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisconnectTime:(id)a3
{
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectTime, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end