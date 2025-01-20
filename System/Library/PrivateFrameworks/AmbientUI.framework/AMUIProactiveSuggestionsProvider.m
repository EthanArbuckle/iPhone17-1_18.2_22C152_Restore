@interface AMUIProactiveSuggestionsProvider
- (AMUIProactiveSuggestionsProvider)initWithIconListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5;
- (AMUIProactiveSuggestionsProviderDelegate)delegate;
- (NSArray)currentPredictions;
- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7;
- (id)_makeDataSourceForAtxWidget:(id)a3;
- (id)suggestionForStackIdentifier:(id)a3 amongSuggestions:(id)a4;
- (void)processUpdatedPredictions:(id)a3;
- (void)setCurrentPredictions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)suggestionProvider:(id)a3 didUpdateStackSuggestions:(id)a4;
@end

@implementation AMUIProactiveSuggestionsProvider

- (AMUIProactiveSuggestionsProvider)initWithIconListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMUIProactiveSuggestionsProvider;
  v12 = [(AMUIProactiveSuggestionsProvider *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proactiveClient, a5);
    [(ATXAmbientSuggestionProvider *)v13->_proactiveClient setDelegate:v13];
    objc_storeStrong((id *)&v13->_iconListModel, a3);
    objc_storeStrong((id *)&v13->_iconManager, a4);
    v14 = [(ATXAmbientSuggestionProvider *)v13->_proactiveClient stackSuggestions];
    [(AMUIProactiveSuggestionsProvider *)v13 processUpdatedPredictions:v14];
  }
  return v13;
}

- (void)suggestionProvider:(id)a3 didUpdateStackSuggestions:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__AMUIProactiveSuggestionsProvider_suggestionProvider_didUpdateStackSuggestions___block_invoke;
  v7[3] = &unk_265224858;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __81__AMUIProactiveSuggestionsProvider_suggestionProvider_didUpdateStackSuggestions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processUpdatedPredictions:*(void *)(a1 + 40)];
}

- (id)suggestionForStackIdentifier:(id)a3 amongSuggestions:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "stackIdentifier", (void)v14);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)processUpdatedPredictions:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v21 = a3;
  v4 = AMUILogProactive();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247837000, v4, OS_LOG_TYPE_DEFAULT, "Updating stack predictions", buf, 2u);
  }

  v20 = [(AMUIProactiveSuggestionsProvider *)self currentPredictions];
  [(AMUIProactiveSuggestionsProvider *)self setCurrentPredictions:v21];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(SBIconListModel *)self->_iconListModel iconsOfClass:objc_opt_class()];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v6 = 138412546;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "uniqueIdentifier", v18);
        char v12 = [(AMUIProactiveSuggestionsProvider *)self suggestionForStackIdentifier:v11 amongSuggestions:v21];
        v13 = [(AMUIProactiveSuggestionsProvider *)self suggestionForStackIdentifier:v11 amongSuggestions:v20];
        long long v14 = AMUILogProactive();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v33 = v12;
          __int16 v34 = 2112;
          v35 = v11;
          _os_log_impl(&dword_247837000, v14, OS_LOG_TYPE_DEFAULT, "Suggestion %@ for stack with identifier: %@", buf, 0x16u);
        }

        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke;
        v22[3] = &unk_265224AC0;
        id v23 = v12;
        v24 = self;
        v25 = v10;
        id v26 = v11;
        id v27 = v13;
        id v15 = v13;
        id v16 = v11;
        id v17 = v12;
        [v10 performCoalescedDataSourceUpdate:v22];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v7);
  }
}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v36 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [*(id *)(a1 + 32) suggestedWidgets];
  uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v42;
    *(void *)&long long v2 = 138412290;
    long long v34 = v2;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v5 = *(void **)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = objc_msgSend(v4, "identifier", v34);
        uint64_t v8 = [v4 chsWidget];
        id v9 = [v8 extensionBundleIdentifier];
        id v10 = [v4 chsWidget];
        id v11 = [v10 kind];
        char v12 = [v5 _iconDataSourceInIcon:v6 withUniqueIdentifier:v7 extensionBundleIdentifier:v9 widgetKind:v11 suggestionSource:1];

        if (v12)
        {
          v13 = AMUILogProactive();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v34;
            v46 = v12;
            _os_log_impl(&dword_247837000, v13, OS_LOG_TYPE_DEFAULT, "Skipping adding data source because the suggested widget %@ is already suggested in stack", buf, 0xCu);
          }

          [v36 addObject:v12];
        }
        else
        {
          long long v14 = [*(id *)(a1 + 40) _makeDataSourceForAtxWidget:v4];
          if (v14)
          {
            id v15 = AMUILogProactive();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v46 = v14;
              _os_log_impl(&dword_247837000, v15, OS_LOG_TYPE_DEFAULT, "Adding new suggested widget data source %@", buf, 0xCu);
            }

            id v16 = [*(id *)(a1 + 40) delegate];
            uint64_t v17 = *(void *)(a1 + 40);
            long long v18 = [v4 chsWidget];
            uint64_t v19 = [v18 intent];
            uint64_t v20 = *(void *)(a1 + 56);
            id v21 = [v4 identifier];
            [v16 proactiveSuggestionsProvider:v17 willUseIntent:v19 forIconWithIdentifier:v20 widgetUniqueIdentifier:v21];

            int v22 = [*(id *)(a1 + 48) allowsSuggestions];
            id v23 = *(void **)(a1 + 48);
            if (v22)
            {
              [v23 addIconDataSource:v14];
            }
            else
            {
              v24 = [v23 activeDataSource];
              [*(id *)(a1 + 48) insertIconDataSource:v14 beforeIconDataSource:v24];
            }
            [v36 addObject:v14];
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v38);
  }

  v25 = *(void **)(a1 + 48);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_9;
  v39[3] = &unk_265224A98;
  id v26 = v36;
  id v40 = v26;
  [v25 removeIconDataSourcesPassingTest:v39];
  if ([*(id *)(*(void *)(a1 + 40) + 24) isShowingModalInteraction])
  {
    id v27 = AMUILogProactive();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_1(v27);
    }
  }
  else
  {
    long long v28 = [*(id *)(a1 + 32) topWidgetIdentifier];

    if (v28)
    {
      id v27 = [*(id *)(a1 + 32) topWidgetIdentifier];
      long long v29 = [*(id *)(a1 + 64) topWidgetIdentifier];
      if ([v27 isEqual:v29])
      {
        long long v30 = AMUILogProactive();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v29;
          __int16 v47 = 2112;
          v48 = v27;
          _os_log_impl(&dword_247837000, v30, OS_LOG_TYPE_DEFAULT, "Skipping active data source update because the old top widget (%@) we had was the same as the new one (%@)", buf, 0x16u);
        }
      }
      else
      {
        long long v30 = [*(id *)(a1 + 48) firstIconDataSourceWithUniqueIdentifier:v27];
        long long v31 = AMUILogProactive();
        v32 = v31;
        if (v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [*(id *)(a1 + 48) activeDataSource];
            *(_DWORD *)buf = 138412546;
            v46 = v30;
            __int16 v47 = 2112;
            v48 = v33;
            _os_log_impl(&dword_247837000, v32, OS_LOG_TYPE_DEFAULT, "Setting active data source to widget %@ (previously: %@)", buf, 0x16u);
          }
          [*(id *)(a1 + 48) setStackChangeReason:2];
          [*(id *)(a1 + 48) setActiveDataSource:v30];
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_2((uint64_t)v27, v32);
          }
        }
      }
    }
    else
    {
      id v27 = AMUILogProactive();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_247837000, v27, OS_LOG_TYPE_DEFAULT, "Skipping active data source update because suggested top widget is nil", buf, 2u);
      }
    }
  }
}

uint64_t __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v3 suggestionSource] == 1
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    uint64_t v6 = AMUILogProactive();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_247837000, v6, OS_LOG_TYPE_DEFAULT, "Removing suggested widget data source %@ because it's no longer suggested", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7
{
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    v13 = [a3 firstIconDataSourceWithUniqueIdentifier:a4];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __133__AMUIProactiveSuggestionsProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke;
    v15[3] = &unk_265224AE8;
    int64_t v18 = a7;
    id v16 = v11;
    id v17 = v12;
    v13 = [a3 firstWidgetPassingTest:v15];
  }

  return v13;
}

uint64_t __133__AMUIProactiveSuggestionsProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6] && [v3 suggestionSource] != a1[6])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v5 = [v4 extensionBundleIdentifier];
    if ([v5 isEqualToString:a1[4]])
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1 + 5;
      if (v7)
      {
        id v8 = [v4 kind];
        uint64_t v9 = [v8 isEqualToString:*v6];
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (id)_makeDataSourceForAtxWidget:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F79258];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [v4 chsWidget];
  id v8 = [v7 kind];
  uint64_t v9 = [v4 chsWidget];
  id v10 = [v9 extensionBundleIdentifier];
  id v11 = [v4 chsWidget];

  id v12 = [v11 containerBundleIdentifier];
  v13 = (void *)[v5 initWithUniqueIdentifier:v6 kind:v8 extensionBundleIdentifier:v10 containerBundleIdentifier:v12];

  long long v14 = (void *)[v13 copyWithSuggestionSource:1];

  return v14;
}

- (NSArray)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
}

- (AMUIProactiveSuggestionsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIProactiveSuggestionsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_iconListModel, 0);

  objc_storeStrong((id *)&self->_proactiveClient, 0);
}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Skipping active data source update because configuration UI is showing", v1, 2u);
}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Suggested top widget not found in stack for widget identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end