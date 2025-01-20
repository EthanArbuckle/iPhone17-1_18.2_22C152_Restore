@interface ATXHomeScreenLogWidgetSetupDictionaries
- (ATXHomeScreenLogWidgetSetupDictionaries)init;
- (id)dryRunResult;
- (void)_copyAllowedWidgetBundleIds;
- (void)_createNewWidgetSetupDictionaryForWidget:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 rowCoordinate:(int64_t)a6 columnCoordinate:(int64_t)a7;
- (void)_createStackConfigStatisticsForWidget:(id)a3 stackKind:(unint64_t)a4;
- (void)_finalizeWidgetSetupDictionaries;
- (void)_persistStackConfigStatistics;
- (void)_removeAuxiliaryFieldsFromWidgetSetupDictionaries;
- (void)sendToCoreAnalytics;
- (void)updateTotalUnlockSessions:(unint64_t)a3;
- (void)updateWidgetLevelParentAppLaunches:(id)a3;
- (void)updateWidgetSetupSummaryForHomeScreenPages:(id)a3;
@end

@implementation ATXHomeScreenLogWidgetSetupDictionaries

- (ATXHomeScreenLogWidgetSetupDictionaries)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXHomeScreenLogWidgetSetupDictionaries;
  v2 = [(ATXHomeScreenLogWidgetSetupDictionaries *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetSetupDictionaries = v2->_widgetSetupDictionaries;
    v2->_widgetSetupDictionaries = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    stackConfigDictionary = v2->_stackConfigDictionary;
    v2->_stackConfigDictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F4B0E8] sharedInstance];
    informationStore = v2->_informationStore;
    v2->_informationStore = (ATXInformationStore *)v7;
  }
  return v2;
}

- (void)updateWidgetSetupSummaryForHomeScreenPages:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__ATXHomeScreenLogWidgetSetupDictionaries_updateWidgetSetupSummaryForHomeScreenPages___block_invoke;
  v4[3] = &unk_1E68B3DB8;
  v4[4] = self;
  [a3 enumerateObjectsUsingBlock:v4];
  [(ATXHomeScreenLogWidgetSetupDictionaries *)self _persistStackConfigStatistics];
}

void __86__ATXHomeScreenLogWidgetSetupDictionaries_updateWidgetSetupSummaryForHomeScreenPages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v21 = ATXStackLocationForPageAndIndex();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [v3 stacks];
  v16 = v3;
  uint64_t v5 = [v3 panels];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  id obj = v6;
  uint64_t v19 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v7;
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        uint64_t v9 = ATXStackKindForStack();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        objc_super v10 = [v8 widgets];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 32), "_createNewWidgetSetupDictionaryForWidget:stackKind:stackLocation:rowCoordinate:columnCoordinate:", v15, v9, v21, objc_msgSend(v8, "coordinateRow"), objc_msgSend(v8, "coordinateColumn"));
              [*(id *)(a1 + 32) _createStackConfigStatisticsForWidget:v15 stackKind:v9];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        ++v7;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v19);
  }
}

- (void)_persistStackConfigStatistics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(NSMutableDictionary *)self->_stackConfigDictionary allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F939B8]);
        objc_super v10 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v8];
        uint64_t v11 = (void *)[v9 initWithBuilder:v10];

        if (([(ATXInformationStore *)self->_informationStore addStackConfigStatistics:v11] & 1) == 0)
        {
          uint64_t v12 = __atxlog_handle_timeline();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v8;
            _os_log_error_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogWidgetSetupDictionaries: unable to persist stack config statistics for timeline (%@)", buf, 0xCu);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_createStackConfigStatisticsForWidget:(id)a3 stackKind:(unint64_t)a4
{
  id v19 = a3;
  id v6 = [NSString alloc];
  uint64_t v7 = [v19 extensionBundleId];
  uint64_t v8 = [v19 widgetKind];
  [v19 size];
  id v9 = ATXStringForStackLayoutSize();
  objc_super v10 = [v19 appBundleId];
  uint64_t v11 = (void *)[v6 initWithFormat:@"%@:%@:%@:%@", v7, v8, v9, v10];

  uint64_t v12 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F939C0]);
    long long v14 = [v19 extensionBundleId];
    long long v15 = [v19 widgetKind];
    long long v16 = [v19 appBundleId];
    [v19 size];
    v17 = (void *)[v13 initWithWidgetBundleId:v14 widgetKind:v15 containerBundleIdentifier:v16 widgetFamily:CHSWidgetFamilyFromATXStackLayoutSize()];

    [(NSMutableDictionary *)self->_stackConfigDictionary setObject:v17 forKeyedSubscript:v11];
  }
  switch(a4)
  {
    case 0uLL:
      uint64_t v18 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v11];
      objc_msgSend(v18, "setCountOfWidgetsWithUnknownStackKind:", objc_msgSend(v18, "countOfWidgetsWithUnknownStackKind") + 1);
      goto LABEL_8;
    case 1uLL:
      uint64_t v18 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v11];
      objc_msgSend(v18, "setCountOfStandaloneWidgets:", objc_msgSend(v18, "countOfStandaloneWidgets") + 1);
      goto LABEL_8;
    case 2uLL:
    case 4uLL:
    case 6uLL:
      uint64_t v18 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v11];
      objc_msgSend(v18, "setCountOfSmartStacksWithWidget:", objc_msgSend(v18, "countOfSmartStacksWithWidget") + 1);
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 7uLL:
      uint64_t v18 = [(NSMutableDictionary *)self->_stackConfigDictionary objectForKeyedSubscript:v11];
      objc_msgSend(v18, "setCountOfNonSmartStacksWithWidget:", objc_msgSend(v18, "countOfNonSmartStacksWithWidget") + 1);
LABEL_8:

      break;
    default:
      break;
  }
}

- (void)_createNewWidgetSetupDictionaryForWidget:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 rowCoordinate:(int64_t)a6 columnCoordinate:(int64_t)a7
{
  id v10 = a3;
  uint64_t v11 = [v10 extensionBundleId];
  uint64_t v12 = [v10 widgetKind];
  if ([v11 length] && objc_msgSend(v12, "length"))
  {
    int64_t v34 = a7;
    id v13 = objc_opt_new();
    long long v14 = (void *)MEMORY[0x1E4F4B440];
    [v10 extensionBundleId];
    long long v15 = v35 = self;
    long long v16 = [v10 widgetKind];
    v17 = [v14 stringRepresentationForExtensionBundleId:v15 kind:v16];
    [v13 setObject:v17 forKeyedSubscript:@"WidgetBundleIdAndKind"];

    uint64_t v18 = NSNumber;
    id v19 = [v10 extensionBundleId];
    uint64_t v20 = objc_msgSend(v18, "numberWithBool:", +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", v19));
    [v13 setObject:v20 forKeyedSubscript:@"widgetIsFirstParty"];

    [v10 size];
    uint64_t v21 = ATXStringForStackLayoutSize();
    [v13 setObject:v21 forKeyedSubscript:@"widgetSize"];

    long long v22 = ATXStringForStackKind();
    [v13 setObject:v22 forKeyedSubscript:@"stackKind"];

    long long v23 = ATXStringForStackLocation();
    [v13 setObject:v23 forKeyedSubscript:@"stackLocation"];

    long long v24 = [NSNumber numberWithInteger:a6];
    [v13 setObject:v24 forKeyedSubscript:@"stackLocationRowCoordinate"];

    long long v25 = [NSNumber numberWithInteger:v34];
    [v13 setObject:v25 forKeyedSubscript:@"stackLocationColumnCoordinate"];

    long long v26 = [v10 appBundleId];
    [v13 setObject:v26 forKeyedSubscript:@"ParentAppBundleId"];

    [v13 setObject:&unk_1F27F1CF8 forKeyedSubscript:@"NumberOfLaunchesOfParentApp"];
    long long v27 = +[ATXHomeScreenLogUploaderUtilities abGroup];
    [v13 setObject:v27 forKeyedSubscript:@"abGroup"];

    long long v28 = NSNumber;
    long long v29 = [v10 intent];
    v30 = [v28 numberWithInt:v29 != 0];
    [v13 setObject:v30 forKeyedSubscript:@"AcceptsIntent"];

    v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isOnboardingWidget"));
    [v13 setObject:v31 forKeyedSubscript:@"isOnboarding"];

    uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isSuggestedWidget"));
    [v13 setObject:v32 forKeyedSubscript:@"isSuggestedWidget"];

    [(NSMutableArray *)v35->_widgetSetupDictionaries addObject:v13];
  }
  else
  {
    v33 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLogWidgetSetupDictionaries _createNewWidgetSetupDictionaryForWidget:stackKind:stackLocation:rowCoordinate:columnCoordinate:]((uint64_t)v11, (uint64_t)v12, v33);
    }
  }
}

- (void)updateTotalUnlockSessions:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_widgetSetupDictionaries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, (void)v11);
        [v9 setObject:v10 forKeyedSubscript:@"NumberOfLockUnlockSessions"];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)updateWidgetLevelParentAppLaunches:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_widgetSetupDictionaries;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"ParentAppBundleId", (void)v14);
        if ([v11 length])
        {
          long long v12 = [v4 objectForKeyedSubscript:v11];

          if (v12)
          {
            long long v13 = [v4 objectForKeyedSubscript:v11];
            [v10 setObject:v13 forKeyedSubscript:@"NumberOfLaunchesOfParentApp"];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)sendToCoreAnalytics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(ATXHomeScreenLogWidgetSetupDictionaries *)self _finalizeWidgetSetupDictionaries];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_widgetSetupDictionaries;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v8 objectForKeyedSubscript:@"WidgetBundleIdAndKind"];
          *(_DWORD *)buf = 138412546;
          long long v16 = v10;
          __int16 v17 = 2112;
          uint64_t v18 = v8;
          _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget Setup dictionary for %@: %@", buf, 0x16u);
        }
        AnalyticsSendEvent();
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_finalizeWidgetSetupDictionaries
{
  [(ATXHomeScreenLogWidgetSetupDictionaries *)self _removeAuxiliaryFieldsFromWidgetSetupDictionaries];
  [(ATXHomeScreenLogWidgetSetupDictionaries *)self _copyAllowedWidgetBundleIds];
}

- (void)_copyAllowedWidgetBundleIds
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_widgetSetupDictionaries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1E4F4B440];
        long long v11 = objc_msgSend(v9, "objectForKeyedSubscript:", @"WidgetBundleIdAndKind", (void)v14);
        long long v12 = [v10 widgetBundleIdForWidgetPersonalityStringRepresentation:v11];

        if ([v3 logUploadAllowedForWidgetBundleId:v12])
        {
          long long v13 = [v9 objectForKeyedSubscript:@"WidgetBundleIdAndKind"];
          [v9 setObject:v13 forKeyedSubscript:@"AllowedWidgetBundleIdAndKind"];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_removeAuxiliaryFieldsFromWidgetSetupDictionaries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_widgetSetupDictionaries;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeObjectForKey:", @"ParentAppBundleId", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)dryRunResult
{
  [(ATXHomeScreenLogWidgetSetupDictionaries *)self _finalizeWidgetSetupDictionaries];
  uint64_t v3 = objc_opt_new();
  widgetSetupDictionaries = self->_widgetSetupDictionaries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ATXHomeScreenLogWidgetSetupDictionaries_dryRunResult__block_invoke;
  v7[3] = &unk_1E68B3DE0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)widgetSetupDictionaries enumerateObjectsUsingBlock:v7];

  return v5;
}

void __55__ATXHomeScreenLogWidgetSetupDictionaries_dryRunResult__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = [v5 alloc];
  id v10 = [v6 objectForKeyedSubscript:@"WidgetBundleIdAndKind"];
  id v8 = [v6 objectForKeyedSubscript:@"stackLocation"];
  long long v9 = (void *)[v7 initWithFormat:@"Widget Setup Dictionary (%lu) for %@, location:%@", a3, v10, v8];
  [v4 setObject:v6 forKeyedSubscript:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_stackConfigDictionary, 0);
  objc_storeStrong((id *)&self->_widgetSetupDictionaries, 0);
}

- (void)_createNewWidgetSetupDictionaryForWidget:(os_log_t)log stackKind:stackLocation:rowCoordinate:columnCoordinate:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget setup dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end