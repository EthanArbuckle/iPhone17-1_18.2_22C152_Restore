@interface MapsSuggestionsLocaleChangedTrigger
- (MapsSuggestionsLocaleChangedTrigger)init;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
@end

@implementation MapsSuggestionsLocaleChangedTrigger

- (MapsSuggestionsLocaleChangedTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsLocaleChangedTrigger;
  return [(MapsSuggestionsBaseTrigger *)&v3 initWithName:@"MapsSuggestionsLocaleChangedTrigger"];
}

- (void)didAddFirstObserver
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v3 = [MEMORY[0x1E4F28F08] currentQueue];
  uint64_t v4 = *MEMORY[0x1E4F1C370];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MapsSuggestionsLocaleChangedTrigger_didAddFirstObserver__block_invoke;
  v6[3] = &unk_1E5CBA828;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v2 addObserverForName:v4 object:0 queue:v3 usingBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__MapsSuggestionsLocaleChangedTrigger_didAddFirstObserver__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained triggerMyObservers];
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      v8 = "MapsSuggestionsLocaleChangedTrigger.m";
      __int16 v9 = 1026;
      int v10 = 32;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsLocaleChangedTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)didRemoveLastObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

@end