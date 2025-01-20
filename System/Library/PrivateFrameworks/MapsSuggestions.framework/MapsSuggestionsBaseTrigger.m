@interface MapsSuggestionsBaseTrigger
- (BOOL)hasObservers;
- (MapsSuggestionsBaseTrigger)initWithName:(id)a3;
- (MapsSuggestionsBaseTrigger)initWithName:(id)a3 queue:(id)a4;
- (NSString)description;
- (NSString)uniqueName;
- (id)dispatchQueue;
- (id)objectForJSON;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
- (void)registerObserver:(id)a3;
- (void)triggerMyObservers;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsSuggestionsBaseTrigger

- (MapsSuggestionsBaseTrigger)initWithName:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsBaseTrigger;
  v8 = [(MapsSuggestionsBaseTrigger *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = [MapsSuggestionsObservers alloc];
    queue = v8->_queue;
    id v13 = [NSString alloc];
    v14 = [(MapsSuggestionsBaseTrigger *)v8 uniqueName];
    v15 = (void *)[v13 initWithFormat:@"%@Observers", v14];
    uint64_t v16 = [(MapsSuggestionsObservers *)v11 initWithCallbackQueue:queue name:v15];
    observers = v8->_observers;
    v8->_observers = (MapsSuggestionsObservers *)v16;
  }
  return v8;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (MapsSuggestionsBaseTrigger)initWithName:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (id) [[v4 alloc] initWithFormat:@"%@Queue", v5];
  id v7 = (const char *)[v6 UTF8String];
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
  v10 = [(MapsSuggestionsBaseTrigger *)self initWithName:v5 queue:v9];

  return v10;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MapsSuggestionsBaseTrigger_registerObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers registerObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)triggerMyObservers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(MapsSuggestionsBaseTrigger *)self uniqueName];
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v9 = v4;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "FIRING %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MapsSuggestionsBaseTrigger_triggerMyObservers__block_invoke;
  v6[3] = &unk_1E5CBA850;
  objc_copyWeak(&v7, (id *)buf);
  [(MapsSuggestionsObservers *)observers callBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __47__MapsSuggestionsBaseTrigger_registerObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    v3 = GEOFindOrCreateLog();
    id v4 = v3;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id v5 = [(dispatch_queue_t *)WeakRetained uniqueName];
        int v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "First observer added for %@", (uint8_t *)&v7, 0xCu);
      }
      dispatch_assert_queue_V2(WeakRetained[1]);
      [(dispatch_queue_t *)WeakRetained didAddFirstObserver];
    }
    else
    {
      id v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        v8 = "MapsSuggestionsTrigger.m";
        __int16 v9 = 1026;
        int v10 = 83;
        __int16 v11 = 2082;
        v12 = "-[MapsSuggestionsBaseTrigger registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (id)dispatchQueue
{
  return self->_queue;
}

void __48__MapsSuggestionsBaseTrigger_triggerMyObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 triggerFired:WeakRetained];
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "MapsSuggestionsTrigger.m";
      __int16 v8 = 1026;
      int v9 = 66;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsBaseTrigger triggerMyObservers]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (NSString)description
{
  return (NSString *)NSStringFromMapsSuggestionsJSON(self, 0);
}

- (BOOL)hasObservers
{
  return [(MapsSuggestionsObservers *)self->_observers count] != 0;
}

- (void)didAddFirstObserver
{
}

- (void)didRemoveLastObserver
{
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MapsSuggestionsBaseTrigger_unregisterObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers unregisterObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsBaseTrigger_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = GEOFindOrCreateLog();
    id v4 = v3;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id v5 = [(dispatch_queue_t *)WeakRetained uniqueName];
        int v7 = 138412290;
        __int16 v8 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Last observer removed for %@", (uint8_t *)&v7, 0xCu);
      }
      dispatch_assert_queue_V2(WeakRetained[1]);
      [(dispatch_queue_t *)WeakRetained didRemoveLastObserver];
    }
    else
    {
      int v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        __int16 v8 = "MapsSuggestionsTrigger.m";
        __int16 v9 = 1026;
        int v10 = 96;
        __int16 v11 = 2082;
        uint64_t v12 = "-[MapsSuggestionsBaseTrigger unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (id)objectForJSON
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end