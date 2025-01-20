@interface ATXWidgetSuggestionsDenyList
- (ATXWidgetSuggestionsDenyList)init;
- (ATXWidgetSuggestionsDenyList)initWithAssets:(id)a3;
- (BOOL)containsInfoSuggestion:(id)a3;
@end

@implementation ATXWidgetSuggestionsDenyList

- (ATXWidgetSuggestionsDenyList)init
{
  v3 = [MEMORY[0x1E4F4AF08] dictionaryForClass:objc_opt_class()];
  v4 = [(ATXWidgetSuggestionsDenyList *)self initWithAssets:v3];

  return v4;
}

- (ATXWidgetSuggestionsDenyList)initWithAssets:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXWidgetSuggestionsDenyList;
  v5 = [(ATXWidgetSuggestionsDenyList *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"denyList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_bannedWidgets, v6);
    }
  }
  return v5;
}

- (BOOL)containsInfoSuggestion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_bannedWidgets;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"extensionBundleId", (void)v23);
      v12 = [v10 objectForKeyedSubscript:@"appBundleId"];
      v13 = [v10 objectForKeyedSubscript:@"widgetKind"];
      if (v11
        && ([v4 widgetBundleIdentifier],
            v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        v15 = [v4 widgetBundleIdentifier];
        int v16 = [v11 isEqualToString:v15];

        if (v12) {
          goto LABEL_11;
        }
      }
      else
      {
        int v16 = 1;
        if (v12)
        {
LABEL_11:
          v17 = [v4 appBundleIdentifier];

          if (v17)
          {
            v18 = [v4 appBundleIdentifier];
            v16 &= [v12 isEqualToString:v18];
          }
        }
      }
      if (v13)
      {
        v19 = [v4 widgetKind];

        if (v19)
        {
          v20 = [v4 widgetKind];
          LOBYTE(v16) = v16 & [v13 isEqualToString:v20];
        }
      }

      if (v16)
      {
        BOOL v21 = 1;
        goto LABEL_22;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

- (void).cxx_destruct
{
}

@end