@interface ATXHomeScreenLogWidgetEventDictionaries
+ (id)widgetEventDictionaryAccumulatorSplitByLocationKeys;
- (ATXHomeScreenLogWidgetEventDictionaries)init;
- (id)_createNewWidgetEventDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5;
- (id)_widgetEventDictionaryForATXHomeScreenWidgetIdentifiable:(id)a3;
- (id)_widgetEventDictionaryForHomeScreenEvent:(id)a3;
- (id)_widgetEventDictionaryForWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5;
- (id)_widgetEventDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5;
- (id)dryRunResult;
- (void)sendToCoreAnalytics;
- (void)updateUnlockSessionsWithWidgetDwell:(id)a3;
- (void)updateWidgetLevelSummaryForHomeScreenEvent:(id)a3 lastStackEvent:(id)a4;
- (void)updateWidgetLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3;
@end

@implementation ATXHomeScreenLogWidgetEventDictionaries

- (ATXHomeScreenLogWidgetEventDictionaries)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetEventDictionaries;
  v2 = [(ATXHomeScreenLogWidgetEventDictionaries *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetEventDictionaries = v2->_widgetEventDictionaries;
    v2->_widgetEventDictionaries = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)widgetEventDictionaryAccumulatorSplitByLocationKeys
{
  if (widgetEventDictionaryAccumulatorSplitByLocationKeys_onceToken != -1) {
    dispatch_once(&widgetEventDictionaryAccumulatorSplitByLocationKeys_onceToken, &__block_literal_global_226);
  }
  v2 = (void *)widgetEventDictionaryAccumulatorSplitByLocationKeys_array;
  return v2;
}

void __94__ATXHomeScreenLogWidgetEventDictionaries_widgetEventDictionaryAccumulatorSplitByLocationKeys__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"NumberOfPinnedWidgetViewsOn";
  v2[1] = @"NumberOfPinnedWidgetPseudoTapsOn";
  v2[2] = @"NumberOfPinnedWidgetTapsOn";
  v2[3] = @"NumberOfLockUnlockSessionsWithWidgetDwellOn";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)widgetEventDictionaryAccumulatorSplitByLocationKeys_array;
  widgetEventDictionaryAccumulatorSplitByLocationKeys_array = v0;
}

- (id)_widgetEventDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5
{
  objc_super v6 = [MEMORY[0x1E4F4B440] stringRepresentationForExtensionBundleId:a3 kind:a4];
  v7 = (void *)[[NSString alloc] initWithFormat:@"%@:%lu", v6, a5];

  return v7;
}

- (void)updateWidgetLevelSummaryForHomeScreenEvent:(id)a3 lastStackEvent:(id)a4
{
  id v11 = a3;
  v5 = -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForHomeScreenEvent:](self, "_widgetEventDictionaryForHomeScreenEvent:");
  if (!v5) {
    goto LABEL_56;
  }
  id v6 = [v11 eventTypeString];
  if ([v6 isEqualToString:@"Unknown"])
  {
    int v7 = 0;
LABEL_49:

    goto LABEL_50;
  }
  if ([v6 isEqualToString:@"HomeScreenPageShown"])
  {
    int v7 = 1;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"HomeScreenDisappeared"])
  {
    int v7 = 2;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"StackChanged"])
  {
    int v7 = 3;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"WidgetTapped"])
  {
    int v7 = 4;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"WidgetLongLook"])
  {
    int v7 = 5;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"WidgetUserFeedback"])
  {
    int v7 = 6;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"UserStackConfigChanged"])
  {
    int v7 = 7;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"DeviceLocked"])
  {
    int v7 = 8;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"DeviceUnlocked"])
  {
    int v7 = 9;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"PinnedWidgetAdded"])
  {
    int v7 = 10;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"PinnedWidgetDeleted"])
  {
    int v7 = 11;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"SpecialPageAppeared"])
  {
    int v7 = 12;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"SpecialPageDisappeared"])
  {
    int v7 = 13;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"StackShown"])
  {
    int v7 = 14;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"StackDisappeared"])
  {
    int v7 = 15;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"StackCreated"])
  {
    int v7 = 16;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"StackDeleted"])
  {
    int v7 = 17;
    goto LABEL_49;
  }
  if ([v6 isEqualToString:@"WidgetAddedToStack"])
  {
    int v7 = 18;
    goto LABEL_49;
  }
  if (([v6 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"StackVisibilityChanged"])
    {
      int v7 = 20;
    }
    else if ([v6 isEqualToString:@"AppAdded"])
    {
      int v7 = 21;
    }
    else if ([v6 isEqualToString:@"AppRemoved"])
    {
      int v7 = 22;
    }
    else
    {
      int v7 = 0;
    }
    goto LABEL_49;
  }

  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v5 forKey:@"NumberOfInstancesRemovedFromStack"];
  int v7 = 19;
LABEL_50:
  if ([v11 stackKind] != 1) {
    goto LABEL_56;
  }
  if (v7 == 14)
  {
    uint64_t v8 = [v11 stackLocation];
    v9 = @"NumberOfPinnedWidgetViewsOn";
  }
  else
  {
    if (v7 != 4) {
      goto LABEL_56;
    }
    uint64_t v8 = [v11 stackLocation];
    v9 = @"NumberOfPinnedWidgetTapsOn";
  }
  v10 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v9 withLocation:v8];
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v5 forKey:v10];

LABEL_56:
}

- (id)_widgetEventDictionaryForATXHomeScreenWidgetIdentifiable:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionBundleId];
  id v6 = [v4 widgetKind];
  uint64_t v7 = [v4 size];

  uint64_t v8 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _widgetEventDictionaryForWidgetId:v5 widgetKind:v6 widgetSize:v7];

  return v8;
}

- (id)_widgetEventDictionaryForHomeScreenEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 widgetBundleId];
  id v6 = [v4 widgetKind];
  uint64_t v7 = [v4 widgetSize];

  uint64_t v8 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _widgetEventDictionaryForWidgetId:v5 widgetKind:v6 widgetSize:v7];

  return v8;
}

- (id)_widgetEventDictionaryForWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    v10 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _widgetEventDictionaryKeyWithWidgetId:v8 widgetKind:v9 widgetSize:a5];
    id v11 = [(NSMutableDictionary *)self->_widgetEventDictionaries objectForKeyedSubscript:v10];

    if (!v11)
    {
      v12 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _createNewWidgetEventDictionaryForBundleId:v8 kind:v9 size:a5];
      [(NSMutableDictionary *)self->_widgetEventDictionaries setObject:v12 forKeyedSubscript:v10];
    }
    v13 = [(NSMutableDictionary *)self->_widgetEventDictionaries objectForKeyedSubscript:v10];
  }
  else
  {
    v14 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForWidgetId:widgetKind:widgetSize:]((uint64_t)v8, (uint64_t)v9, v14);
    }

    v13 = 0;
  }

  return v13;
}

- (id)_createNewWidgetEventDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v20 = v7;
  id v9 = [MEMORY[0x1E4F4B440] stringRepresentationForExtensionBundleId:v6 kind:v7];
  [v8 setObject:v9 forKeyedSubscript:@"WidgetBundleIdAndKind"];

  v10 = ATXStringForStackLayoutSize();
  [v8 setObject:v10 forKeyedSubscript:@"widgetSize"];

  [v8 setObject:&unk_1F27F2598 forKeyedSubscript:@"NumberOfInstancesRemovedFromStack"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [(id)objc_opt_class() widgetEventDictionaryAccumulatorSplitByLocationKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        do
        {
          v18 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v17 withLocation:v16];
          [v8 setObject:&unk_1F27F2598 forKeyedSubscript:v18];

          ++v16;
        }
        while (v16 != 6);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v8;
}

- (void)updateWidgetLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3
{
  id v6 = a3;
  if ([v6 stackKind] == 1)
  {
    id v4 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _widgetEventDictionaryForHomeScreenEvent:v6];
    if (v4)
    {
      v5 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", @"NumberOfPinnedWidgetPseudoTapsOn", [v6 stackLocation]);
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v4 forKey:v5];
    }
  }
}

- (void)updateUnlockSessionsWithWidgetDwell:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [(ATXHomeScreenLogWidgetEventDictionaries *)self _widgetEventDictionaryForHomeScreenEvent:v9];
        if (v10)
        {
          id v11 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", @"NumberOfLockUnlockSessionsWithWidgetDwellOn", [v9 stackLocation]);
          +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v10 forKey:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)sendToCoreAnalytics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_widgetEventDictionaries;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138412546;
    long long v12 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetEventDictionaries, "objectForKeyedSubscript:", v9, v12, (void)v13);
        id v11 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v9;
          __int16 v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget level dictionary for %@: %@", buf, 0x16u);
        }

        AnalyticsSendEvent();
      }
      uint64_t v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)dryRunResult
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_widgetEventDictionaries;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_widgetEventDictionaries objectForKeyedSubscript:v9];
        id v11 = (void *)[[NSString alloc] initWithFormat:@"Widget Level Dictionary For %@", v9];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_widgetEventDictionaryForWidgetId:(uint64_t)a1 widgetKind:(uint64_t)a2 widgetSize:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget event dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end