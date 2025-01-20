@interface MapsSuggestionsRealAppProtectionConnector
- (MapsSuggestionsAppProtectionStatusMonitoring)delegate;
- (void)addMonitor:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MapsSuggestionsRealAppProtectionConnector

- (void)setDelegate:(id)a3
{
}

- (void)addMonitor:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F4B800], "subjectMonitorRegistry", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v5 addMonitor:self];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__MapsSuggestionsRealAppProtectionConnector_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v12[3] = &unk_1E5CBA498;
  id v9 = v8;
  id v13 = v9;
  [v6 enumerateObjectsUsingBlock:v12];
  v10 = [(MapsSuggestionsRealAppProtectionConnector *)self delegate];
  if (v10)
  {
    if (objc_opt_respondsToSelector()) {
      [v10 appProtectionStatusChanged:v9];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsRealAppProtectionConnector.m";
      __int16 v16 = 1026;
      int v17 = 78;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsRealAppProtectionConnector appProtectionSubjectsChanged:forSubscription:]";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __90__MapsSuggestionsRealAppProtectionConnector_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v5 bundleIdentifier];
    [v3 addObject:v4];
  }
}

- (MapsSuggestionsAppProtectionStatusMonitoring)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (MapsSuggestionsAppProtectionStatusMonitoring *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end