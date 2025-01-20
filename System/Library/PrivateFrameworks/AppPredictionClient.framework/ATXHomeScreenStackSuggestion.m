@interface ATXHomeScreenStackSuggestion
+ (id)_widgetAndSuggestionsFromSuggestionLayout:(id)a3;
+ (id)_widgetProactiveSuggestionFromLayout:(id)a3;
+ (id)_widgetsFromSuggestionLayouts:(id)a3;
+ (id)stackSuggestionsFromCachedSuggestions:(id)a3;
+ (id)widgetFromSuggestionLayout:(id)a3;
+ (unint64_t)_stackLayoutSizeFromUILayoutType:(int64_t)a3;
- (ATXHomeScreenStackSuggestion)initWithStackIdentifier:(id)a3 layoutOfTopWidget:(id)a4 layoutOfSuggestedWidgets:(id)a5;
- (ATXHomeScreenWidgetIdentifiable)topWidget;
- (ATXInfoSuggestion)topWidgetInfoSuggestion;
- (ATXProactiveSuggestion)topWidgetProactiveSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidenceStackRotationForStaleStack;
- (BOOL)isTopWidgetSuggestionsWidget;
- (NSSet)suggestedWidgets;
- (NSString)stackId;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initForDebuggingWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5;
- (unint64_t)hash;
@end

@implementation ATXHomeScreenStackSuggestion

- (ATXHomeScreenStackSuggestion)initWithStackIdentifier:(id)a3 layoutOfTopWidget:(id)a4 layoutOfSuggestedWidgets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[ATXHomeScreenStackSuggestion _widgetAndSuggestionsFromSuggestionLayout:v10];
  v13 = +[ATXHomeScreenStackSuggestion _widgetsFromSuggestionLayouts:v11];

  if ([v10 isNPlusOne])
  {
    uint64_t v14 = [v12 first];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [v12 first];
      char v17 = [v13 containsObject:v16];

      if ((v17 & 1) == 0)
      {
        v18 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[ATXHomeScreenStackSuggestion initWithStackIdentifier:layoutOfTopWidget:layoutOfSuggestedWidgets:](v12, v18);
        }
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)ATXHomeScreenStackSuggestion;
  v19 = [(ATXHomeScreenStackSuggestion *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_stackId, a3);
    uint64_t v21 = [v12 first];
    topWidget = v20->_topWidget;
    v20->_topWidget = (ATXHomeScreenWidgetIdentifiable *)v21;

    uint64_t v23 = [v12 second];
    topWidgetSuggestions = v20->_topWidgetSuggestions;
    v20->_topWidgetSuggestions = (NSArray *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    suggestedWidgets = v20->_suggestedWidgets;
    v20->_suggestedWidgets = (NSSet *)v25;

    v20->_isLowConfidenceStackRotationForStaleStack = [v10 isLowConfidenceStackRotationForStaleStack];
  }

  return v20;
}

- (id)initForDebuggingWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXHomeScreenStackSuggestion;
  v12 = [(ATXHomeScreenStackSuggestion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stackId, a3);
    objc_storeStrong((id *)&v13->_topWidget, a4);
    if (v11) {
      uint64_t v14 = (NSSet *)v11;
    }
    else {
      uint64_t v14 = (NSSet *)objc_opt_new();
    }
    suggestedWidgets = v13->_suggestedWidgets;
    v13->_suggestedWidgets = v14;
  }
  return v13;
}

- (BOOL)isTopWidgetSuggestionsWidget
{
  v2 = [(ATXHomeScreenStackSuggestion *)self topWidget];
  v3 = [v2 extensionBundleId];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  return v4;
}

- (ATXInfoSuggestion)topWidgetInfoSuggestion
{
  v2 = [(ATXHomeScreenStackSuggestion *)self topWidgetProactiveSuggestion];
  v3 = [v2 executableSpecification];
  char v4 = [v3 executableObject];

  return (ATXInfoSuggestion *)v4;
}

- (ATXProactiveSuggestion)topWidgetProactiveSuggestion
{
  if ([(ATXHomeScreenStackSuggestion *)self isTopWidgetSuggestionsWidget])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(NSArray *)self->_topWidgetSuggestions firstObject];
  }

  return (ATXProactiveSuggestion *)v3;
}

- (id)description
{
  v2 = [(ATXHomeScreenStackSuggestion *)self dictionaryRepresentation];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v4 = [v2 descriptionWithLocale:v3];

  return v4;
}

- (id)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  topWidget = self->_topWidget;
  v9[0] = self->_stackId;
  v8[0] = @"stackId";
  v8[1] = @"topWidget";
  if (topWidget)
  {
    char v4 = [(ATXHomeScreenWidgetIdentifiable *)topWidget dictionaryRepresentation];
  }
  else
  {
    char v4 = @"nil";
  }
  v9[1] = v4;
  v8[2] = @"suggestedWidgets";
  v5 = [(NSSet *)self->_suggestedWidgets description];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  if (topWidget) {

  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self->_stackId hash];
  unint64_t v4 = [(ATXHomeScreenWidgetIdentifiable *)self->_topWidget hash] - v3 + 32 * v3;
  unint64_t v5 = [(NSSet *)self->_suggestedWidgets hash] - v4 + 32 * v4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_topWidgetSuggestions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "executableSpecification", (void)v14);
        v12 = [v11 executableIdentifier];
        unint64_t v5 = [v12 hash] - v5 + 32 * v5;

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ATXHomeScreenStackSuggestion *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      stackId = self->_stackId;
      uint64_t v7 = (NSString *)v5[3];
      if (stackId == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = stackId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_14;
        }
      }
      NSUInteger v12 = [(NSArray *)self->_topWidgetSuggestions count];
      if (v12 != [v5[1] count])
      {
LABEL_14:
        char v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 1;
      topWidgetSuggestions = self->_topWidgetSuggestions;
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __40__ATXHomeScreenStackSuggestion_isEqual___block_invoke;
      uint64_t v25 = &unk_1E5D07D10;
      long long v14 = v5;
      v26 = v14;
      v27 = &v28;
      [(NSArray *)topWidgetSuggestions enumerateObjectsUsingBlock:&v22];
      if (!*((unsigned char *)v29 + 24)) {
        goto LABEL_13;
      }
      long long v15 = self->_topWidget;
      long long v16 = (ATXHomeScreenWidgetIdentifiable *)v14[4];
      if (v15 == v16)
      {
      }
      else
      {
        long long v17 = v16;
        BOOL v18 = -[ATXHomeScreenWidgetIdentifiable isEqual:](v15, "isEqual:", v16, v22, v23, v24, v25);

        if (!v18)
        {
LABEL_13:
          char v11 = 0;
LABEL_20:

          _Block_object_dispose(&v28, 8);
          goto LABEL_21;
        }
      }
      uint64_t v19 = self->_suggestedWidgets;
      v20 = (NSSet *)v14[5];
      if (v19 == v20) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSSet *)v19 isEqual:v20];
      }

      goto LABEL_20;
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

void __40__ATXHomeScreenStackSuggestion_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = a2;
  id v14 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 executableSpecification];

  char v10 = [v9 executableIdentifier];
  char v11 = [v14 executableSpecification];
  NSUInteger v12 = [v11 executableIdentifier];
  char v13 = [v10 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (id)stackSuggestionsFromCachedSuggestions:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  v6 = [v4 cachedTopOfStackLayouts];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke;
  v17[3] = &unk_1E5D09900;
  id v20 = a1;
  id v18 = v4;
  id v7 = v5;
  id v19 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v17];

  uint64_t v9 = [v8 cachedSuggestedWidgetsLayouts];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke_2;
  v14[3] = &unk_1E5D09928;
  id v10 = v7;
  id v15 = v10;
  id v16 = a1;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];

  char v11 = v15;
  id v12 = v10;

  return v12;
}

void __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  unint64_t v5 = *(objc_class **)(a1 + 48);
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [*(id *)(a1 + 32) cachedSuggestedWidgetsLayouts];
  uint64_t v9 = [v8 objectForKeyedSubscript:v11];
  id v10 = (void *)[v7 initWithStackIdentifier:v11 layoutOfTopWidget:v6 layoutOfSuggestedWidgets:v9];

  if (v10) {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

void __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (!v6)
  {
    id v7 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithStackIdentifier:v8 layoutOfTopWidget:0 layoutOfSuggestedWidgets:v5];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)widgetFromSuggestionLayout:(id)a3
{
  NSUInteger v3 = [a1 _widgetAndSuggestionsFromSuggestionLayout:a3];
  id v4 = [v3 first];

  return v4;
}

+ (id)_widgetAndSuggestionsFromSuggestionLayout:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_9;
  }
  if ([v4 isValidForSuggestionsWidget])
  {
    id v6 = objc_opt_new();
    uint64_t v7 = *MEMORY[0x1E4F4B5F8];
    [v6 setAppBundleId:*MEMORY[0x1E4F4B5F8]];
    [v6 setExtensionBundleId:v7];
    id v8 = ATXSpecialWidgetKindSiriSuggestions();
    [v6 setWidgetKind:v8];

    uint64_t v9 = [v5 minSuggestionListInLayout];
  }
  else
  {
    id v6 = [a1 _widgetProactiveSuggestionFromLayout:v5];
    uint64_t v11 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v6];
    if (!v11)
    {
      uint64_t v9 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXHomeScreenStackSuggestion _widgetAndSuggestionsFromSuggestionLayout:](v9, v20, v21, v22, v23, v24, v25, v26);
      }
      id v10 = 0;
      goto LABEL_8;
    }
    id v12 = (void *)v11;
    char v13 = objc_opt_new();
    id v14 = [v12 appBundleIdentifier];
    [v13 setAppBundleId:v14];

    id v15 = [v12 widgetBundleIdentifier];
    [v13 setExtensionBundleId:v15];

    id v16 = [v12 widgetKind];
    [v13 setWidgetKind:v16];

    long long v17 = [v12 intent];
    [v13 setIntent:v17];

    v27[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

    id v6 = v13;
  }
  id v18 = [v5 widgetUniqueId];
  [v6 setWidgetUniqueId:v18];

  objc_msgSend(v6, "setSize:", objc_msgSend(a1, "_stackLayoutSizeFromUILayoutType:", objc_msgSend(v5, "layoutType")));
  objc_msgSend(v6, "setSuggestedWidget:", objc_msgSend(v5, "isNPlusOne"));
  id v10 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v6 second:v9];
LABEL_8:

LABEL_9:

  return v10;
}

+ (id)_widgetProactiveSuggestionFromLayout:(id)a3
{
  id v3 = a3;
  if ([v3 layoutType] == 5)
  {
    id v4 = [v3 twoByTwoSuggestions];
  }
  else if ([v3 layoutType] == 3)
  {
    id v4 = [v3 twoByFourSuggestions];
  }
  else if ([v3 layoutType] == 10)
  {
    id v4 = [v3 fourByFourSuggestions];
  }
  else
  {
    if ([v3 layoutType] != 16) {
      goto LABEL_14;
    }
    id v4 = [v3 fourByEightSuggestions];
  }
  id v5 = v4;
  id v6 = [v4 firstObject];

  if (!v6)
  {
LABEL_14:
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXHomeScreenStackSuggestion _widgetProactiveSuggestionFromLayout:](v6, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_16;
  }
  uint64_t v7 = [v6 executableSpecification];
  uint64_t v8 = [v7 executableType];

  if (v8 == 3) {
    goto LABEL_17;
  }
  uint64_t v9 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[ATXHomeScreenStackSuggestion _widgetProactiveSuggestionFromLayout:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

LABEL_16:
  id v6 = 0;
LABEL_17:

  return v6;
}

+ (id)_widgetsFromSuggestionLayouts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          uint64_t v12 = (void *)MEMORY[0x1AD0D3C30](v7);
          uint64_t v13 = objc_msgSend(a1, "_widgetAndSuggestionsFromSuggestionLayout:", v11, (void)v17);
          uint64_t v14 = [v13 first];

          if (v14)
          {
            uint64_t v15 = [v13 first];
            [v5 addObject:v15];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v8 = v7;
      }
      while (v7);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (unint64_t)_stackLayoutSizeFromUILayoutType:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  if (a3 != 5)
  {
    if (a3 == 9) {
      return 1;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
      return 2;
    }
    if (a3 == 16) {
      return 4;
    }
    id v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[ATXHomeScreenStackSuggestion _stackLayoutSizeFromUILayoutType:](a3, v5);
    }
  }
  return 0;
}

- (NSString)stackId
{
  return self->_stackId;
}

- (ATXHomeScreenWidgetIdentifiable)topWidget
{
  return self->_topWidget;
}

- (NSSet)suggestedWidgets
{
  return self->_suggestedWidgets;
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  return self->_isLowConfidenceStackRotationForStaleStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedWidgets, 0);
  objc_storeStrong((id *)&self->_topWidget, 0);
  objc_storeStrong((id *)&self->_stackId, 0);

  objc_storeStrong((id *)&self->_topWidgetSuggestions, 0);
}

- (void)initWithStackIdentifier:(void *)a1 layoutOfTopWidget:(NSObject *)a2 layoutOfSuggestedWidgets:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 first];
  id v5 = [v4 compactDescription];
  id v6 = [a1 first];
  uint64_t v7 = [v6 widgetUniqueId];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenStackSuggestion: TopWidget %@ (uniqueID %{public}@) is a suggested widget but it does not exist in the suggestedWidgets list. Aborting init.", (uint8_t *)&v8, 0x16u);
}

+ (void)_widgetAndSuggestionsFromSuggestionLayout:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_widgetProactiveSuggestionFromLayout:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_widgetProactiveSuggestionFromLayout:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_stackLayoutSizeFromUILayoutType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "+[ATXHomeScreenStackSuggestion _stackLayoutSizeFromUILayoutType:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: Could not convert ATXUILayoutType %lu to ATXStackLayoutSize", (uint8_t *)&v2, 0x16u);
}

@end