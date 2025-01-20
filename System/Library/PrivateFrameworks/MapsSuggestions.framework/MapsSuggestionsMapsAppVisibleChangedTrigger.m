@interface MapsSuggestionsMapsAppVisibleChangedTrigger
- (BOOL)isTrue;
- (MapsSuggestionsMapsAppVisibleChangedTrigger)init;
- (id)objectForJSON;
@end

@implementation MapsSuggestionsMapsAppVisibleChangedTrigger

void __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(void *)&v23[13] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 state];
  v11 = [v10 endowmentNamespaces];

  int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    if (WeakRetained[40] == v12)
    {
      objc_sync_exit(v14);
    }
    else
    {
      v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = @"YES";
        if (WeakRetained[40]) {
          v18 = @"YES";
        }
        else {
          v18 = @"NO";
        }
        if (!v12) {
          v17 = @"NO";
        }
        int v20 = 138412546;
        v21 = (char *)v18;
        __int16 v22 = 2112;
        *(void *)v23 = v17;
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Maps app visibility changed from %@ to %@", (uint8_t *)&v20, 0x16u);
      }

      WeakRetained[40] = v12;
      objc_sync_exit(v14);

      v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Triggering observers", (uint8_t *)&v20, 2u);
      }

      [WeakRetained triggerMyObservers];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446722;
      v21 = "MapsSuggestionsMapsAppVisibleChangedTrigger.mm";
      __int16 v22 = 1026;
      *(_DWORD *)v23 = 43;
      v23[2] = 2082;
      *(void *)&v23[3] = "-[MapsSuggestionsMapsAppVisibleChangedTrigger init]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (MapsSuggestionsMapsAppVisibleChangedTrigger)init
{
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsMapsAppVisibleChangedTrigger;
  v2 = [(MapsSuggestionsBaseTrigger *)&v13 initWithName:@"MapsSuggestionsMapsAppVisibleChangedTrigger"];
  if (v2)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Initializing", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v2->_isVisible = 0;
    v4 = (void *)MEMORY[0x1E4F96418];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke;
    v9[3] = &unk_1E5CB9A70;
    objc_copyWeak(&v11, buf);
    v5 = v2;
    v10 = v5;
    uint64_t v6 = [v4 monitorWithConfiguration:v9];
    processMonitor = v5->_processMonitor;
    v5->_processMonitor = (RBSProcessMonitor *)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F96448] descriptor];
  [v4 setEndowmentNamespaces:&unk_1EFC89EE8];
  [v3 setStateDescriptor:v4];
  v5 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:@"com.apple.Maps"];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setPredicates:v6];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MapsSuggestionsMapsAppVisibleChangedTrigger_init__block_invoke_2;
  v7[3] = &unk_1E5CB9A48;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v7];

  objc_destroyWeak(&v9);
}

- (BOOL)isTrue
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isVisible = v2->_isVisible;
  objc_sync_exit(v2);

  return isVisible;
}

- (id)objectForJSON
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MapsSuggestionsBaseTrigger *)self uniqueName];
  id v7 = v3;
  v4 = MSg::jsonFor((MSg *)[(MapsSuggestionsMapsAppVisibleChangedTrigger *)self isTrue]);
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void).cxx_destruct
{
}

@end