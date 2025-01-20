@interface MapsSuggestionsNavigationStateChangedTrigger
- (BOOL)isTrue;
- (MapsSuggestionsNavigationStateChangedTrigger)init;
- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5;
@end

@implementation MapsSuggestionsNavigationStateChangedTrigger

- (MapsSuggestionsNavigationStateChangedTrigger)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsNavigationStateChangedTrigger;
  v2 = [(MapsSuggestionsBaseTrigger *)&v8 initWithName:@"MapsSuggestionsNavigationStateChangedTrigger"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F64770]);
    v4 = [(MapsSuggestionsBaseTrigger *)v2 dispatchQueue];
    uint64_t v5 = [v3 initWithQueue:v4];
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = (GEONavigationListener *)v5;

    [(GEONavigationListener *)v2->_navigationListener setDelegate:v2];
  }
  return v2;
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  objc_initWeak(&location, self);
  v7 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__MapsSuggestionsNavigationStateChangedTrigger_navigationListener_didChangeNavigationState_transportType___block_invoke;
  block[3] = &unk_1E5CB8590;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  dispatch_async(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __106__MapsSuggestionsNavigationStateChangedTrigger_navigationListener_didChangeNavigationState_transportType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained[4] == 2;
    WeakRetained[4] = *(void *)(a1 + 40);
    if ((v4 ^ (*(void *)(a1 + 40) == 2))) {
      [WeakRetained triggerMyObservers];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      v7 = "MapsSuggestionsNavigationStateChangedTrigger.mm";
      __int16 v8 = 1026;
      int v9 = 56;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsNavigationStateChangedTrigger navigationListener:didChangeNavigationState:transportType:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (BOOL)isTrue
{
  v2 = self;
  id v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MapsSuggestionsNavigationStateChangedTrigger_isTrue__block_invoke;
  v6[3] = &unk_1E5CB89A8;
  v6[4] = v2;
  BOOL v4 = v6;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN3MSg13dispatch_syncIbEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  block[3] = &unk_1E5CB7EC8;
  id v8 = v4;
  int v9 = &v10;
  dispatch_sync(v3, block);
  LOBYTE(v2) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v2;
}

BOOL __54__MapsSuggestionsNavigationStateChangedTrigger_isTrue__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) navigationState] == 2;
}

- (void).cxx_destruct
{
}

@end