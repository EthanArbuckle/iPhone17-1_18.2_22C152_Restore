@interface AMUIProactiveUsageObserver
- (AMUIProactiveUsageObserver)initWithListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5;
- (id)_proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4;
- (id)_proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4;
- (id)_proactiveWidgetStackForWidgetIcon:(id)a3;
- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4;
- (void)pushStackConfigurationsToProactive;
@end

@implementation AMUIProactiveUsageObserver

- (AMUIProactiveUsageObserver)initWithListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMUIProactiveUsageObserver;
  v12 = [(AMUIProactiveUsageObserver *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listModel, a3);
    objc_storeStrong((id *)&v13->_iconManager, a4);
    objc_storeStrong((id *)&v13->_proactiveClient, a5);
  }

  return v13;
}

- (void)pushStackConfigurationsToProactive
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  listModel = self->_listModel;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke;
  id v9 = &unk_265224A50;
  id v10 = self;
  id v11 = v3;
  id v5 = v3;
  [(SBIconListModel *)listModel enumerateIconsUsingBlock:&v6];
  -[ATXAmbientSuggestionProvider writeStacks:completion:](self->_proactiveClient, "writeStacks:completion:", v5, &__block_literal_global_3, v6, v7, v8, v9, v10);
}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isWidgetIcon])
  {
    id v3 = [*(id *)(a1 + 32) _proactiveWidgetStackForWidgetIcon:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = AMUILogProactive();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)_proactiveWidgetStackForWidgetIcon:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = objc_msgSend(v4, "widgets", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForWidget:*(void *)(*((void *)&v18 + 1) + 8 * i) ofIcon:v4];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc(MEMORY[0x263F33BE0]);
  v13 = [v4 uniqueIdentifier];
  v14 = [v4 activeWidget];
  objc_super v15 = [v14 uniqueIdentifier];
  v16 = objc_msgSend(v12, "initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:", v13, v5, v15, 1, objc_msgSend(v4, "allowsExternalSuggestions"), objc_msgSend(v4, "allowsSuggestions"));

  return v16;
}

- (id)_proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4
{
  iconManager = self->_iconManager;
  id v6 = a3;
  uint64_t v7 = [(SBHIconManager *)iconManager intentForWidget:v6 ofIcon:a4];
  id v8 = objc_alloc(MEMORY[0x263F31E10]);
  uint64_t v9 = [v6 extensionBundleIdentifier];
  id v10 = [v6 containerBundleIdentifier];
  id v11 = (void *)[v8 initWithExtensionBundleIdentifier:v9 containerBundleIdentifier:v10 deviceIdentifier:0];

  id v12 = objc_alloc(MEMORY[0x263F31E70]);
  v13 = [v6 kind];
  v14 = (void *)[v12 initWithExtensionIdentity:v11 kind:v13 family:1 intent:v7 activityIdentifier:0];

  id v15 = objc_alloc(MEMORY[0x263F33BD8]);
  v16 = [v6 uniqueIdentifier];
  uint64_t v17 = [v6 suggestionSource];

  long long v18 = (void *)[v15 initWithIdentifier:v16 chsWidget:v14 suggestedWidget:v17 == 1];

  return v18;
}

- (id)_proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    id v12 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForWidget:v11 ofIcon:v7];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5
{
  uint64_t v6 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForIconDataSource:a4 ofIcon:a5];
  if (v6) {
    [(ATXAmbientSuggestionProvider *)self->_proactiveClient logWidgetDidAppear:v6];
  }

  MEMORY[0x270F9A758]();
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5
{
  uint64_t v6 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForIconDataSource:a4 ofIcon:a5];
  if (v6) {
    [(ATXAmbientSuggestionProvider *)self->_proactiveClient logWidgetDidDisappear:v6];
  }

  MEMORY[0x270F9A758]();
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v6 = a4;
  id v8 = [v6 activeWidget];
  id v7 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForWidget:v8 ofIcon:v6];

  [(ATXAmbientSuggestionProvider *)self->_proactiveClient logUserDidTapWidget:v7];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  id v11 = a4;
  id v5 = [v11 activeDataSource];
  unint64_t v6 = [v11 stackChangeReason] - 1;
  if (v6 > 5)
  {
    uint64_t v7 = 0;
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = qword_24786BF70[v6];
    if (!v5) {
      goto LABEL_7;
    }
  }
  uint64_t v8 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetForIconDataSource:v5 ofIcon:v11];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(AMUIProactiveUsageObserver *)self _proactiveWidgetStackForWidgetIcon:v11];
    [(ATXAmbientSuggestionProvider *)self->_proactiveClient logWidgetStack:v10 didChangeToWidget:v9 reason:v7];
  }
LABEL_7:
  [(AMUIProactiveUsageObserver *)self pushStackConfigurationsToProactive];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveClient, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);

  objc_storeStrong((id *)&self->_listModel, 0);
}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Could not write stack configurations: %@", (uint8_t *)&v2, 0xCu);
}

@end