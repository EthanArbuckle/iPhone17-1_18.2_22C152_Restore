@interface MapsSuggestionsCorrectedMapItemProvider
- (MapsSuggestionsCorrectedMapItemProvider)initWithMeCardReader:(id)a3 handler:(id)a4;
- (NSString)uniqueName;
- (id)mapItemFormShortcutForCNIdentifier:(id)a3;
- (void)dealloc;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
@end

@implementation MapsSuggestionsCorrectedMapItemProvider

- (MapsSuggestionsCorrectedMapItemProvider)initWithMeCardReader:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsCorrectedMapItemProvider;
  v9 = [(MapsSuggestionsCorrectedMapItemProvider *)&v17 init];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id updateHandler = v9->_updateHandler;
    v9->_id updateHandler = v10;

    objc_storeStrong((id *)&v9->_meCardReader, a3);
    [(MapsSuggestionsMeCardReader *)v9->_meCardReader registerMeCardObserver:v9];
    objc_initWeak(&location, v9);
    meCardReader = v9->_meCardReader;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__MapsSuggestionsCorrectedMapItemProvider_initWithMeCardReader_handler___block_invoke;
    v14[3] = &unk_1E5CB8858;
    objc_copyWeak(&v15, &location);
    [(MapsSuggestionsMeCardReader *)meCardReader readMeCardWithHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __72__MapsSuggestionsCorrectedMapItemProvider_initWithMeCardReader_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (id *)WeakRetained;
    objc_sync_enter(v10);
    if (v7)
    {
      id v11 = v10[1];
      v10[1] = 0;
    }
    objc_storeStrong(v10 + 1, a2);
    v12 = (void (**)(void))v10[3];
    if (v12) {
      v12[2]();
    }
    objc_sync_exit(v10);
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      id v15 = "MapsSuggestionsCorrectedMapItemProvider.m";
      __int16 v16 = 1026;
      int v17 = 38;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsCorrectedMapItemProvider initWithMeCardReader:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  [(MapsSuggestionsMeCardReader *)self->_meCardReader unregisterMeCardObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsCorrectedMapItemProvider;
  [(MapsSuggestionsCorrectedMapItemProvider *)&v3 dealloc];
}

- (id)mapItemFormShortcutForCNIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MapsSuggestionsMeCard *)v5->_meCard shortcutForCNPostalAddressIdentifier:v4];
  id v7 = [v6 identifier];

  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(MapsSuggestionsMeCard *)v5->_meCard shortcutsForAll];
    v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [v12 identifier];
          int v14 = [v7 isEqualToString:v13];

          if (v14)
          {
            v9 = [v12 geoMapItem];
            goto LABEL_12;
          }
        }
        v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_meCard, a4);
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"CorrectedMapItemsUpdated" object:0];

  id updateHandler = (void (**)(void))v7->_updateHandler;
  if (updateHandler) {
    updateHandler[2]();
  }
  objc_sync_exit(v7);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_meCardReader, 0);
  objc_storeStrong((id *)&self->_meCard, 0);
}

@end