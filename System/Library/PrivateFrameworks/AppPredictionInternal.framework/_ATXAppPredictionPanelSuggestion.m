@interface _ATXAppPredictionPanelSuggestion
- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5;
- (BOOL)containsIdenticalContentOfSuggestion:(id)a3;
- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6;
- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7;
- (id)initForPreviewWithHyperParameters:(id)a3;
@end

@implementation _ATXAppPredictionPanelSuggestion

- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 extensionBundleId];
  char v16 = [v15 isEqualToString:*MEMORY[0x1E4F4AD48]];

  if ((v16 & 1) == 0)
  {
    v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)_ATXAppPredictionPanelSuggestion;
  v17 = [(_ATXAppPredictionPanelSuggestion *)&v37 init];
  self = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->super._stack, v12);
    objc_storeStrong((id *)&self->super._widget, a3);
    objc_storeStrong((id *)&self->super._suggestionDeduplicator, a5);
    objc_storeStrong((id *)&self->super._hyperParameters, a6);
    if ([(ATXHomeScreenWidgetIdentifiable *)self->super._widget size] == 1)
    {
      self->super._layoutType = 0;
      v18 = (NSMutableDictionary *)objc_opt_new();
      suggestionsBySuggestionLayoutTypes = self->super._suggestionsBySuggestionLayoutTypes;
      self->super._suggestionsBySuggestionLayoutTypes = v18;

      goto LABEL_5;
    }
    v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:](v21, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_10:

    v20 = 0;
    goto LABEL_11;
  }
LABEL_5:
  self = self;
  v20 = self;
LABEL_11:

  return v20;
}

- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v13 = a5;
  id v14 = [(_ATXAppPredictionPanelSuggestion *)self initWithAppPredictionPanel:a3 containingStack:a4 suggestionDeduplicator:a6 hyperParameters:a7];
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
    -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:](v16, v17, v18, v19, v20, v21, v22, v23);
  }

  v15 = 0;
LABEL_8:

  return v15;
}

- (id)initForPreviewWithHyperParameters:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXAppPredictionPanelSuggestion;
  v6 = [(_ATXAppPredictionPanelSuggestion *)&v14 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    widget = v6->super._widget;
    v6->super._widget = (ATXHomeScreenWidgetIdentifiable *)v7;

    uint64_t v9 = *MEMORY[0x1E4F4AD48];
    [(ATXHomeScreenWidgetIdentifiable *)v6->super._widget setAppBundleId:*MEMORY[0x1E4F4AD48]];
    [(ATXHomeScreenWidgetIdentifiable *)v6->super._widget setExtensionBundleId:v9];
    v10 = ATXSpecialWidgetKindAppPredictions();
    [(ATXHomeScreenWidgetIdentifiable *)v6->super._widget setWidgetKind:v10];

    [(ATXHomeScreenWidgetIdentifiable *)v6->super._widget setSize:1];
    [(ATXHomeScreenWidgetIdentifiable *)v6->super._widget setWidgetUniqueId:*MEMORY[0x1E4F4B598]];
    objc_storeStrong((id *)&v6->super._hyperParameters, a3);
    v6->super._layoutType = 0;
    uint64_t v11 = objc_opt_new();
    suggestionsBySuggestionLayoutTypes = v6->super._suggestionsBySuggestionLayoutTypes;
    v6->super._suggestionsBySuggestionLayoutTypes = (NSMutableDictionary *)v11;
  }
  return v6;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 executableSpecification];
  uint64_t v6 = [v5 executableType];

  if (v6 == 1)
  {
    suggestionDeduplicator = self->super._suggestionDeduplicator;
    v8 = [(_ATXCompositeLayoutWidgetSuggestionBase *)self _existingSuggestionsInLayout];
    char v9 = [(ATXSuggestionDeduplicatorProtocol *)suggestionDeduplicator suggestionIsDuplicate:v4 existingSuggestions:v8 shouldCompareAcrossTypes:0];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(_ATXCompositeLayoutWidgetSuggestionBase *)self isLayoutComplete]
    || ![(ATXBlendingLayerHyperParameters *)self->super._hyperParameters isSuggestionEligibleForAppPredictionPanel:v8])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_ATXAppPredictionPanelSuggestion;
    BOOL v9 = [(_ATXCompositeLayoutWidgetSuggestionBase *)&v11 addSuggestion:v8 asMainSuggestion:v6 dryRun:v5];
  }

  return v9;
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionLayout:(uint64_t)a5 suggestionDeduplicator:(uint64_t)a6 hyperParameters:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end