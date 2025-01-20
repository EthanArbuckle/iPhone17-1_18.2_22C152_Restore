@interface ATXHomeScreenLogWidgetAddSheetDictionaries
+ (id)rankKeysSplitBySize;
- (ATXHomeScreenLogWidgetAddSheetDictionaries)init;
- (id)_createNewWidgetAddSheetDictionaryForBundleId:(id)a3 kind:(id)a4;
- (id)_widgetAddSheetDictionaryForDescriptor:(id)a3;
- (id)_widgetAddSheetDictionaryForStack;
- (id)_widgetAddSheetDictionaryForWidgetId:(id)a3 widgetKind:(id)a4;
- (id)dryRunResult;
- (id)widgetAddSheetDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4;
- (void)_updateWidgetAddSheetDictionariesForDescriptor:(id)a3 inStack:(BOOL)a4 rank:(unint64_t)a5;
- (void)_updateWidgetAddSheetDictionariesForStack:(id)a3 suggestedSize:(unint64_t)a4;
- (void)_updateWidgetAddSheetDictionariesWithDictionary:(id)a3 suggestedSize:(unint64_t)a4 inStack:(BOOL)a5 rank:(unint64_t)a6;
- (void)sendToCoreAnalytics;
- (void)updateWidgetAddSheetSummaryForDefaultStack:(id)a3;
- (void)updateWidgetAddSheetSummaryForSuggestions:(id)a3;
@end

@implementation ATXHomeScreenLogWidgetAddSheetDictionaries

- (ATXHomeScreenLogWidgetAddSheetDictionaries)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetAddSheetDictionaries;
  v2 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetAddSheetDictionaries = v2->_widgetAddSheetDictionaries;
    v2->_widgetAddSheetDictionaries = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)rankKeysSplitBySize
{
  if (rankKeysSplitBySize__pasOnceToken6 != -1) {
    dispatch_once(&rankKeysSplitBySize__pasOnceToken6, &__block_literal_global_155);
  }
  v2 = (void *)rankKeysSplitBySize__pasExprOnceResult;
  return v2;
}

void __65__ATXHomeScreenLogWidgetAddSheetDictionaries_rankKeysSplitBySize__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v3[0] = @"RankInGallery";
  v3[1] = @"RankInStack";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)rankKeysSplitBySize__pasExprOnceResult;
  rankKeysSplitBySize__pasExprOnceResult = v1;
}

- (id)_createNewWidgetAddSheetDictionaryForBundleId:(id)a3 kind:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v18 = v6;
  v8 = [MEMORY[0x1E4F4B440] stringRepresentationForExtensionBundleId:v5 kind:v6];
  [v7 setObject:v8 forKeyedSubscript:@"WidgetBundleIdAndKind"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(id)objc_opt_class() rankKeysSplitBySize];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        do
        {
          v16 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v15 withSize:v14];
          [v7 setObject:&unk_1F27F1B60 forKeyedSubscript:v16];

          ++v14;
        }
        while (v14 != 3);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void)updateWidgetAddSheetSummaryForSuggestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          uint64_t v11 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _widgetAddSheetDictionaryForStack];
          uint64_t v12 = [v10 suggestedSize];

          [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesWithDictionary:v11 suggestedSize:v12 inStack:0 rank:v6 + v8 + 1];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesForDescriptor:v9 inStack:0 rank:v6 + v8 + 1];
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      v6 += v8;
    }
    while (v5);
  }
}

- (void)updateWidgetAddSheetSummaryForDefaultStack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 smallDefaultStack];
  [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesForStack:v5 suggestedSize:0];

  uint64_t v6 = [v4 mediumDefaultStack];
  [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesForStack:v6 suggestedSize:1];

  id v7 = [v4 largeDefaultStack];

  [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesForStack:v7 suggestedSize:2];
}

- (void)_updateWidgetAddSheetDictionariesForStack:(id)a3 suggestedSize:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10++);
        [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesForDescriptor:v11 inStack:1 rank:v10 + v8];
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v8 += v10;
    }
    while (v7);
  }
}

- (void)_updateWidgetAddSheetDictionariesForDescriptor:(id)a3 inStack:(BOOL)a4 rank:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v10 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _widgetAddSheetDictionaryForDescriptor:v8];
  uint64_t v9 = [v8 suggestedSize];

  [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _updateWidgetAddSheetDictionariesWithDictionary:v10 suggestedSize:v9 inStack:v6 rank:a5];
}

- (void)_updateWidgetAddSheetDictionariesWithDictionary:(id)a3 suggestedSize:(unint64_t)a4 inStack:(BOOL)a5 rank:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"WidgetBundleIdAndKind"];
    long long v12 = ATXCAStringForStackLayoutSize();
    int v16 = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    unint64_t v21 = a6;
    __int16 v22 = 1024;
    BOOL v23 = v7;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: suggested: %@ of size %{public}@ in pos %lu in stack? %d", (uint8_t *)&v16, 0x26u);
  }
  if (v9)
  {
    long long v13 = [NSNumber numberWithUnsignedInteger:a6];
    if (v7) {
      long long v14 = @"RankInStack";
    }
    else {
      long long v14 = @"RankInGallery";
    }
    long long v15 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v14 withSize:a4];
    [v9 setObject:v13 forKeyedSubscript:v15];
  }
}

- (id)_widgetAddSheetDictionaryForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionBundleIdForMetrics];
  BOOL v6 = [v4 widgetKind];

  BOOL v7 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _widgetAddSheetDictionaryForWidgetId:v5 widgetKind:v6];

  return v7;
}

- (id)_widgetAddSheetDictionaryForStack
{
  return [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _widgetAddSheetDictionaryForWidgetId:@"stack" widgetKind:@"stack"];
}

- (id)_widgetAddSheetDictionaryForWidgetId:(id)a3 widgetKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    id v8 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self widgetAddSheetDictionaryKeyWithWidgetId:v6 widgetKind:v7];
    id v9 = [(NSMutableDictionary *)self->_widgetAddSheetDictionaries objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v10 = [(ATXHomeScreenLogWidgetAddSheetDictionaries *)self _createNewWidgetAddSheetDictionaryForBundleId:v6 kind:v7];
      [(NSMutableDictionary *)self->_widgetAddSheetDictionaries setObject:v10 forKeyedSubscript:v8];
    }
    uint64_t v11 = [(NSMutableDictionary *)self->_widgetAddSheetDictionaries objectForKeyedSubscript:v8];
  }
  else
  {
    long long v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForWidgetId:widgetKind:]((uint64_t)v6, (uint64_t)v7, v12);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)widgetAddSheetDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4
{
  return (id)[MEMORY[0x1E4F4B440] stringRepresentationForExtensionBundleId:a3 kind:a4];
}

- (id)dryRunResult
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_widgetAddSheetDictionaries;
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
        id v10 = [(NSMutableDictionary *)self->_widgetAddSheetDictionaries objectForKeyedSubscript:v9];
        uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Widget Add Sheet Dictionary For %@", v9];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)sendToCoreAnalytics
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_widgetAddSheetDictionaries;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetAddSheetDictionaries, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        AnalyticsSendEvent();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

- (void)_widgetAddSheetDictionaryForWidgetId:(os_log_t)log widgetKind:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget add sheet dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end