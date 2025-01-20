@interface AMUIWidgetHostManager
- (AMUIWidgetHostManager)init;
- (AMUIWidgetHostManagerDelegate)delegate;
- (CHSWidgetHost)widgetHost;
- (SBHIconManager)iconManager;
- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5;
- (id)_descriptionForArray:(id)a3 name:(id)a4;
- (id)_rateLimitPolicies;
- (id)_refreshStrategyForIdentifier:(id)a3;
- (unint64_t)widgetDataGeneration;
- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3;
- (void)dealloc;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4;
- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWidgetDataGeneration:(unint64_t)a3;
@end

@implementation AMUIWidgetHostManager

- (AMUIWidgetHostManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)AMUIWidgetHostManager;
  v2 = [(AMUIWidgetHostManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F79218]);
    v4 = objc_alloc_init(AMUIInfographListLayoutProvider);
    [v3 setListLayoutProvider:v4];
    [v3 setUsageMonitoringEnabled:1];
    v5 = [v3 usageMonitor];
    [v5 addObserver:v2];

    iconManager = v2->_iconManager;
    v2->_iconManager = (SBHIconManager *)v3;
    id v7 = v3;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F31EC0]) initWithIdentifier:@"Ambient-Infograph"];
    widgetHost = v2->_widgetHost;
    v2->_widgetHost = (CHSWidgetHost *)v8;

    [(AMUIWidgetHostManager *)v2 _rebuildAndTransmitConfiguredWidgetData:v7];
  }
  return v2;
}

- (void)dealloc
{
  [(CHSWidgetHost *)self->_widgetHost deactivate];
  [(CHSWidgetHost *)self->_widgetHost invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIWidgetHostManager;
  [(AMUIWidgetHostManager *)&v3 dealloc];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = AMUILogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 widgets];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon added: %@", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 iconManager];

  [(AMUIWidgetHostManager *)self _rebuildAndTransmitConfiguredWidgetData:v10];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = AMUILogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 widgets];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon removed: %@", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 iconManager];

  [(AMUIWidgetHostManager *)self _rebuildAndTransmitConfiguredWidgetData:v10];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = AMUILogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 activeDataSource];
    v10 = [v6 widgets];
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon stack changed active widget: %@ all widgets: %@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [v7 iconManager];

  [(AMUIWidgetHostManager *)self _rebuildAndTransmitConfiguredWidgetData:v11];
  v12 = [(AMUIWidgetHostManager *)self delegate];
  [v12 widgetHostManager:self didNoteStackChangedActiveWidget:v6];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = AMUILogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user added suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = AMUILogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user dislike of suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = AMUILogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted dislike of Siri Suggestion on suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = AMUILogWidgets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 widgets];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_247837000, v6, OS_LOG_TYPE_DEFAULT, "Widget icon tapped: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3
{
  id v4 = AMUILogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_247837000, v4, OS_LOG_TYPE_DEFAULT, "Add Widget sheet will present", v8, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263F31E28]);
  id v6 = [(AMUIWidgetHostManager *)self widgetHost];
  int v7 = [v6 identifier];
  [v5 userEnteredAddGalleryForHost:v7];
}

- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AMUIWidgetHostManager *)self widgetDataGeneration] + 1;
  [(AMUIWidgetHostManager *)self setWidgetDataGeneration:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke;
  v7[3] = &unk_265224CF0;
  id v8 = v4;
  unint64_t v9 = v5;
  v7[4] = self;
  id v6 = v4;
  [v6 performAfterCachingWidgetIntentsUsingBlock:v7];
}

void __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == [*(id *)(a1 + 32) widgetDataGeneration])
  {
    objc_super v3 = [MEMORY[0x263EFF980] array];
    id v4 = [*(id *)(a1 + 40) rootFolder];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke_2;
    v15[3] = &unk_265224CC8;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    id v16 = v5;
    uint64_t v17 = v6;
    id v7 = v3;
    id v18 = v7;
    [v5 enumerateAllIconsWithOptions:2 usingBlock:v15];
    id v8 = AMUILogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = [*(id *)(a1 + 32) _descriptionForArray:v7 name:@"containers"];
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "Configured widgets changed: %@", buf, 0xCu);
    }
    uint64_t v10 = [*(id *)(a1 + 32) iconManager];
    int v11 = [v10 widgetMetricsProvider];

    if (objc_opt_respondsToSelector()) {
      [v11 systemDefaultMetricsSpecificationForFamilies:2];
    }
    else {
    v12 = [v11 systemDefaultMetricsSpecification];
    }
    int v13 = (void *)[objc_alloc(MEMORY[0x263F31E48]) initWithContainerDescriptors:v7 metricsSpecification:v12];
    v14 = [*(id *)(a1 + 32) _rateLimitPolicies];
    [v13 setRateLimitPolicies:v14];

    [*(id *)(*(void *)(a1 + 32) + 16) setConfiguration:v13];
  }
}

void __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v11 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v11;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = objc_msgSend(a1[5], "_containerDescriptorForWidgetIcon:atLocation:page:", v9, 5, objc_msgSend(a1[4], "visibleIndexForIndex:", objc_msgSend(v6, "indexAtPosition:", 0)));
    if (v10) {
      [a1[6] addObject:v10];
    }
  }
}

- (id)_rateLimitPolicies
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F31EE0]) initWithMaximumRefreshes:1 perWindow:600.0];
  id v3 = objc_alloc(MEMORY[0x263F31EE8]);
  id v4 = [MEMORY[0x263EFFA08] setWithObject:v2];
  id v5 = (void *)[v3 initWithIdentifier:@"AMUIActiveWidgetRateLimitPolicyIdentifier" rateLimits:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F31EE0]) initWithMaximumRefreshes:1 perWindow:1200.0];
  id v7 = objc_alloc(MEMORY[0x263F31EE8]);
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  id v9 = (void *)[v7 initWithIdentifier:@"AMUIInactiveWidgetRateLimitPolicyIdentifier" rateLimits:v8];

  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v5, v9, 0);

  return v10;
}

- (id)_refreshStrategyForIdentifier:(id)a3
{
  return (id)[MEMORY[0x263F31EF0] rateLimitedWithPolicyIdentifier:a3];
}

- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38 = [MEMORY[0x263EFF980] array];
  v36 = [v6 gridSizeClass];
  uint64_t v41 = CHSWidgetFamilyForSBHIconGridSizeClass();
  id v7 = [v6 widgets];
  id v8 = [v6 activeWidget];
  uint64_t v42 = [v8 uniqueIdentifier];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v43)
  {
    uint64_t v39 = *(void *)v45;
    id v40 = v6;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v11 = [(AMUIWidgetHostManager *)self iconManager];
        v12 = [v11 intentForWidget:v10 ofIcon:v6];

        id v13 = objc_alloc(MEMORY[0x263F31E70]);
        v14 = [v10 extensionBundleIdentifier];
        __int16 v15 = [v10 containerBundleIdentifier];
        id v16 = [v10 kind];
        uint64_t v17 = (void *)[v13 initWithExtensionBundleIdentifier:v14 containerBundleIdentifier:v15 kind:v16 family:v41 intent:v12];

        id v18 = [(AMUIWidgetHostManager *)self iconManager];
        v19 = [v18 widgetMetricsProvider];
        v20 = [v19 systemMetricsForWidget:v17];

        id v21 = objc_alloc(MEMORY[0x263F31E38]);
        v22 = [v10 uniqueIdentifier];
        v23 = (void *)[v21 initWithUniqueIdentifier:v22 widget:v17 metrics:v20];

        objc_msgSend(v23, "setSuggestion:", objc_msgSend(v10, "suggestionSource") == 1);
        objc_msgSend(v23, "setSystemConfigured:", objc_msgSend(v10, "suggestionSource") == 2);
        [v23 setSupportedColorSchemes:2];
        v24 = (void *)[objc_alloc(MEMORY[0x263F31EF8]) initWithRenderingMode:1 backgroundViewPolicy:1];
        v25 = (void *)[objc_alloc(MEMORY[0x263F31EF8]) initWithRenderingMode:0 backgroundViewPolicy:1];
        v50[0] = v24;
        v50[1] = v25;
        v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
        [v23 setSupportedRenderSchemes:v26];

        v27 = [v10 uniqueIdentifier];
        LODWORD(v10) = [v27 isEqualToString:v42];

        if (v10) {
          v28 = @"AMUIActiveWidgetRateLimitPolicyIdentifier";
        }
        else {
          v28 = @"AMUIInactiveWidgetRateLimitPolicyIdentifier";
        }
        v29 = [(AMUIWidgetHostManager *)self _refreshStrategyForIdentifier:v28];
        [v23 setRefreshStrategy:v29];
        if (v23)
        {
          [v38 addObject:v23];
          v30 = AMUILogWidgets();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v23;
            _os_log_impl(&dword_247837000, v30, OS_LOG_TYPE_DEFAULT, "Found configured widget: %@", buf, 0xCu);
          }
        }
        id v6 = v40;
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v43);
  }

  if ([v38 count])
  {
    id v31 = objc_alloc(MEMORY[0x263F31DE0]);
    v32 = [v6 uniqueIdentifier];
    v33 = (void *)v42;
    v34 = objc_msgSend(v31, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", v32, v42);
  }
  else
  {
    v34 = 0;
    v33 = (void *)v42;
  }

  return v34;
}

- (id)_descriptionForArray:(id)a3 name:(id)a4
{
  id v5 = (void *)MEMORY[0x263F29C40];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 builderWithObject:0];
  [v8 appendArraySection:v7 withName:v6 skipIfEmpty:0];

  id v9 = [v8 build];

  return v9;
}

- (AMUIWidgetHostManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIWidgetHostManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHSWidgetHost)widgetHost
{
  return self->_widgetHost;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (unint64_t)widgetDataGeneration
{
  return self->_widgetDataGeneration;
}

- (void)setWidgetDataGeneration:(unint64_t)a3
{
  self->_widgetDataGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end