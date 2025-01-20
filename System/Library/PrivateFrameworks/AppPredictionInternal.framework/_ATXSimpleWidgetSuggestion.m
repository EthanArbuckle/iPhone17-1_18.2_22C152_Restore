@interface _ATXSimpleWidgetSuggestion
+ (BOOL)_isSuggestion:(id)a3 compatibleWithStack:(id)a4;
- (ATXHomeScreenWidgetIdentifiable)widget;
- (ATXProactiveSuggestion)mainSuggestionInLayout;
- (ATXSuggestionLayout)suggestionLayout;
- (BOOL)containsIdenticalContentOfSuggestion:(id)a3;
- (_ATXHomeScreenStackState)stack;
- (_ATXSimpleWidgetSuggestion)initWithSuggestion:(id)a3 stack:(id)a4 suggestionDeduplicator:(id)a5;
- (_ATXSimpleWidgetSuggestion)initWithWidget:(id)a3 suggestion:(id)a4 stack:(id)a5 suggestionDeduplicator:(id)a6;
- (void)_setSuggestion:(id)a3;
@end

@implementation _ATXSimpleWidgetSuggestion

- (_ATXSimpleWidgetSuggestion)initWithWidget:(id)a3 suggestion:(id)a4 stack:(id)a5 suggestionDeduplicator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ATXSimpleWidgetSuggestion;
  v15 = [(_ATXSimpleWidgetSuggestion *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_stack, v13);
    objc_storeStrong((id *)&v16->_widget, a3);
    objc_storeStrong((id *)&v16->_suggestionDeduplicator, a6);
    if (v12) {
      [(_ATXSimpleWidgetSuggestion *)v16 _setSuggestion:v12];
    }
  }

  return v16;
}

- (_ATXSimpleWidgetSuggestion)initWithSuggestion:(id)a3 stack:(id)a4 suggestionDeduplicator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[_ATXSimpleWidgetSuggestion _isSuggestion:v8 compatibleWithStack:v9])goto LABEL_6; {
  id v11 = [v9 widgetForSuggestion:v8 considerSuggestedWidgets:1];
  }
  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v8];
    if (v12)
    {
      id v13 = (void *)v12;
      id v11 = objc_opt_new();
      id v14 = [v13 appBundleIdentifier];
      [v11 setAppBundleId:v14];

      v15 = [v13 widgetBundleIdentifier];
      [v11 setExtensionBundleId:v15];

      v16 = [v13 widgetKind];
      [v11 setWidgetKind:v16];

      v17 = [v9 config];
      objc_msgSend(v11, "setSize:", objc_msgSend(v17, "stackLayoutSize"));

      objc_super v18 = [v13 intent];
      [v11 setIntent:v18];

      v19 = [MEMORY[0x1E4F29128] UUID];
      v20 = [v19 UUIDString];
      [v11 setWidgetUniqueId:v20];

      [v11 setSuggestedWidget:1];
      goto LABEL_5;
    }
LABEL_6:
    v21 = 0;
    goto LABEL_7;
  }
LABEL_5:
  self = [(_ATXSimpleWidgetSuggestion *)self initWithWidget:v11 suggestion:v8 stack:v9 suggestionDeduplicator:v10];

  v21 = self;
LABEL_7:

  return v21;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 executableSpecification];
  uint64_t v6 = [v5 executableType];

  if (v6 == 1) {
    char v7 = 0;
  }
  else {
    char v7 = [(ATXSuggestionDeduplicatorProtocol *)self->_suggestionDeduplicator isWidget:self->_widget showingIdenticalContentOfSuggestion:v4];
  }

  return v7;
}

- (void)_setSuggestion:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stack);
  BOOL v7 = +[_ATXSimpleWidgetSuggestion _isSuggestion:v5 compatibleWithStack:WeakRetained];

  if (v7)
  {
    objc_storeStrong((id *)&self->_suggestion, a3);
    objc_storeStrong((id *)&self->_mainSuggestionInLayout, a3);
    switch([(ATXHomeScreenWidgetIdentifiable *)self->_widget size])
    {
      case 0:
        id v8 = objc_alloc(MEMORY[0x1E4F939C8]);
        v31[0] = v5;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
        v26 = 0;
        v27 = 0;
        id v10 = v8;
        uint64_t v11 = 5;
        uint64_t v12 = v9;
        goto LABEL_10;
      case 1:
        id v13 = objc_alloc(MEMORY[0x1E4F939C8]);
        id v30 = v5;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        id v14 = (ATXSuggestionLayout *)[v13 initWithLayoutType:3 oneByOneSuggestions:0 oneByTwoSuggestions:0 twoByTwoSuggestions:0 oneByFourSuggestions:0 twoByFourSuggestions:v9 fourByFourSuggestions:0 fourByEightSuggestions:0];
        goto LABEL_11;
      case 2:
        id v15 = objc_alloc(MEMORY[0x1E4F939C8]);
        id v29 = v5;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        v26 = v9;
        v27 = 0;
        id v10 = v15;
        uint64_t v11 = 10;
        goto LABEL_9;
      case 3:
        v16 = __atxlog_handle_blending();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[_ATXSimpleWidgetSuggestion _setSuggestion:](v16, v17, v18, v19, v20, v21, v22, v23);
        }
        goto LABEL_13;
      case 4:
        id v24 = objc_alloc(MEMORY[0x1E4F939C8]);
        id v28 = v5;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        v26 = 0;
        v27 = v9;
        id v10 = v24;
        uint64_t v11 = 16;
LABEL_9:
        uint64_t v12 = 0;
LABEL_10:
        id v14 = (ATXSuggestionLayout *)[v10 initWithLayoutType:v11 oneByOneSuggestions:0 oneByTwoSuggestions:0 twoByTwoSuggestions:v12 oneByFourSuggestions:0 twoByFourSuggestions:0 fourByFourSuggestions:v26 fourByEightSuggestions:v27];
LABEL_11:
        suggestionLayout = self->_suggestionLayout;
        self->_suggestionLayout = v14;

        break;
      default:
        break;
    }
    v16 = [(ATXProactiveSuggestion *)self->_mainSuggestionInLayout uuid];
    [(ATXSuggestionLayout *)self->_suggestionLayout setUuidOfHighestConfidenceSuggestion:v16];
LABEL_13:
  }
}

+ (BOOL)_isSuggestion:(id)a3 compatibleWithStack:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 executableSpecification];
  uint64_t v8 = [v7 executableType];

  if (v8 != 3)
  {
    id v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_8;
  }
  if (([v6 sizeIsCompatibleWithWidgetSuggestion:v5] & 1) == 0)
  {
    id v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:](v10, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_8:

    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (_ATXHomeScreenStackState)stack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stack);
  return (_ATXHomeScreenStackState *)WeakRetained;
}

- (ATXHomeScreenWidgetIdentifiable)widget
{
  return self->_widget;
}

- (ATXSuggestionLayout)suggestionLayout
{
  return self->_suggestionLayout;
}

- (ATXProactiveSuggestion)mainSuggestionInLayout
{
  return self->_mainSuggestionInLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSuggestionInLayout, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_destroyWeak((id *)&self->_stack);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
}

- (void)_setSuggestion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_isSuggestion:(uint64_t)a3 compatibleWithStack:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_isSuggestion:(uint64_t)a3 compatibleWithStack:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end