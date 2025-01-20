@interface _ATXSuggestionsWidgetSuggestion
- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5;
- (BOOL)containsIdenticalContentOfSuggestion:(id)a3;
- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6;
- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7;
- (id)initForPreviewOfSize:(unint64_t)a3 hyperParameters:(id)a4;
@end

@implementation _ATXSuggestionsWidgetSuggestion

- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 extensionBundleId];
  char v16 = [v15 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  if (v16)
  {
    v39.receiver = self;
    v39.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
    v17 = [(_ATXSuggestionsWidgetSuggestion *)&v39 init];
    self = v17;
    if (!v17)
    {
LABEL_13:
      self = self;
      v28 = self;
      goto LABEL_14;
    }
    objc_storeWeak((id *)&v17->super._stack, v12);
    p_widget = &self->super._widget;
    objc_storeStrong((id *)&self->super._widget, a3);
    objc_storeStrong((id *)&self->super._suggestionDeduplicator, a5);
    objc_storeStrong((id *)&self->super._hyperParameters, a6);
    if (![(ATXHomeScreenWidgetIdentifiable *)self->super._widget size])
    {
      int64_t v19 = 5;
      goto LABEL_12;
    }
    if ([(ATXHomeScreenWidgetIdentifiable *)*p_widget size] == 1)
    {
      int64_t v19 = 9;
LABEL_12:
      self->super._layoutType = v19;
      v29 = (NSMutableDictionary *)objc_opt_new();
      suggestionsBySuggestionLayoutTypes = self->super._suggestionsBySuggestionLayoutTypes;
      self->super._suggestionsBySuggestionLayoutTypes = v29;

      goto LABEL_13;
    }
    if ([(ATXHomeScreenWidgetIdentifiable *)*p_widget size] == 2)
    {
      int64_t v19 = 11;
      goto LABEL_12;
    }
    v20 = __atxlog_handle_blending();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:](v20, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  else
  {
    v20 = __atxlog_handle_blending();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }

  v28 = 0;
LABEL_14:

  return v28;
}

- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v13 = a5;
  id v14 = [(_ATXSuggestionsWidgetSuggestion *)self initWithSuggestionsWidget:a3 containingStack:a4 suggestionDeduplicator:a6 hyperParameters:a7];
  if (!v14) {
    goto LABEL_4;
  }
  if ([v13 layoutType] == v14->super._layoutType)
  {
    objc_storeStrong((id *)&v14->super._suggestionLayout, a5);
LABEL_4:
    v15 = v14;
    goto LABEL_8;
  }
  char v16 = __atxlog_handle_blending();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:](v16, v17, v18, v19, v20, v21, v22, v23);
  }

  v15 = 0;
LABEL_8:

  return v15;
}

- (id)initForPreviewOfSize:(unint64_t)a3 hyperParameters:(id)a4
{
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
  v8 = [(_ATXSuggestionsWidgetSuggestion *)&v28 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v8->super._hyperParameters, a4);
  uint64_t v10 = objc_opt_new();
  widget = v9->super._widget;
  v9->super._widget = (ATXHomeScreenWidgetIdentifiable *)v10;

  uint64_t v12 = *MEMORY[0x1E4F4B5F8];
  [(ATXHomeScreenWidgetIdentifiable *)v9->super._widget setAppBundleId:*MEMORY[0x1E4F4B5F8]];
  [(ATXHomeScreenWidgetIdentifiable *)v9->super._widget setExtensionBundleId:v12];
  id v13 = ATXSpecialWidgetKindSiriSuggestions();
  [(ATXHomeScreenWidgetIdentifiable *)v9->super._widget setWidgetKind:v13];

  [(ATXHomeScreenWidgetIdentifiable *)v9->super._widget setSize:a3];
  if (![(ATXHomeScreenWidgetIdentifiable *)v9->super._widget size])
  {
    id v14 = (void *)MEMORY[0x1E4F4B600];
    uint64_t v15 = 5;
    goto LABEL_8;
  }
  if ([(ATXHomeScreenWidgetIdentifiable *)v9->super._widget size] == 1)
  {
    id v14 = (void *)MEMORY[0x1E4F4B608];
    uint64_t v15 = 9;
LABEL_8:
    [(ATXHomeScreenWidgetIdentifiable *)v9->super._widget setWidgetUniqueId:*v14];
    v9->super._layoutType = v15;
    uint64_t v16 = objc_opt_new();
    suggestionsBySuggestionLayoutTypes = v9->super._suggestionsBySuggestionLayoutTypes;
    v9->super._suggestionsBySuggestionLayoutTypes = (NSMutableDictionary *)v16;

LABEL_9:
    uint64_t v18 = v9;
    goto LABEL_10;
  }
  if ([(ATXHomeScreenWidgetIdentifiable *)v9->super._widget size] == 2)
  {
    id v14 = (void *)MEMORY[0x1E4F4B610];
    uint64_t v15 = 11;
    goto LABEL_8;
  }
  uint64_t v20 = __atxlog_handle_blending();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[_ATXSuggestionsWidgetSuggestion initForPreviewOfSize:hyperParameters:](v20, v21, v22, v23, v24, v25, v26, v27);
  }

  uint64_t v18 = 0;
LABEL_10:

  return v18;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  suggestionDeduplicator = self->super._suggestionDeduplicator;
  id v5 = a3;
  v6 = [(_ATXCompositeLayoutWidgetSuggestionBase *)self _existingSuggestionsInLayout];
  LOBYTE(suggestionDeduplicator) = [(ATXSuggestionDeduplicatorProtocol *)suggestionDeduplicator suggestionIsDuplicate:v5 existingSuggestions:v6 shouldCompareAcrossTypes:1];

  return (char)suggestionDeduplicator;
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(_ATXCompositeLayoutWidgetSuggestionBase *)self isLayoutComplete]
    || ![(ATXBlendingLayerHyperParameters *)self->super._hyperParameters isSuggestionEligibleForSuggestionsWidget:v8])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
    BOOL v9 = [(_ATXCompositeLayoutWidgetSuggestionBase *)&v11 addSuggestion:v8 asMainSuggestion:v6 dryRun:v5];
  }

  return v9;
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionLayout:(uint64_t)a5 suggestionDeduplicator:(uint64_t)a6 hyperParameters:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initForPreviewOfSize:(uint64_t)a3 hyperParameters:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end