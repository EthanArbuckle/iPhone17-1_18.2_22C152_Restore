@interface _ATXCompositeLayoutWidgetSuggestionBase
- (ATXBlendingLayerHyperParameters)hyperParameters;
- (ATXHomeScreenWidgetIdentifiable)widget;
- (ATXProactiveSuggestion)mainSuggestionInLayout;
- (ATXSuggestionDeduplicatorProtocol)suggestionDeduplicator;
- (ATXSuggestionLayout)suggestionLayout;
- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4;
- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5;
- (BOOL)canAddSuggestion:(id)a3;
- (BOOL)containsIdenticalContentOfSuggestion:(id)a3;
- (BOOL)isLayoutComplete;
- (NSMutableDictionary)suggestionsBySuggestionLayoutTypes;
- (_ATXHomeScreenStackState)stack;
- (id)_existingSuggestionsInLayout;
- (int64_t)layoutType;
@end

@implementation _ATXCompositeLayoutWidgetSuggestionBase

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  suggestionDeduplicator = self->_suggestionDeduplicator;
  id v5 = a3;
  v6 = [(_ATXCompositeLayoutWidgetSuggestionBase *)self _existingSuggestionsInLayout];
  LOBYTE(suggestionDeduplicator) = [(ATXSuggestionDeduplicatorProtocol *)suggestionDeduplicator suggestionIsDuplicate:v5 existingSuggestions:v6 shouldCompareAcrossTypes:1];

  return (char)suggestionDeduplicator;
}

- (BOOL)isLayoutComplete
{
  return self->_suggestionLayout != 0;
}

- (BOOL)canAddSuggestion:(id)a3
{
  return [(_ATXCompositeLayoutWidgetSuggestionBase *)self addSuggestion:a3 asMainSuggestion:0 dryRun:1];
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4
{
  return [(_ATXCompositeLayoutWidgetSuggestionBase *)self addSuggestion:a3 asMainSuggestion:a4 dryRun:0];
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5
{
  BOOL v41 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  if ([(_ATXCompositeLayoutWidgetSuggestionBase *)self isLayoutComplete])
  {
    BOOL v6 = 0;
  }
  else
  {
    v45 = [MEMORY[0x1E4F939C8] minSuggestionLayoutTypesForUILayoutType:self->_layoutType];
    long long v57 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    v7 = [v43 uiSpecification];
    id obj = [v7 preferredLayoutConfigs];

    uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v8)
    {
      char v40 = 0;
      uint64_t v9 = *(void *)v55;
      p_mainSuggestionInLayout = &self->_mainSuggestionInLayout;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v54 + 1) + 8 * v10) applicableLayoutType];
        v12 = [NSNumber numberWithInteger:v11];
        v13 = [v45 objectForKeyedSubscript:v12];
        unint64_t v14 = [v13 unsignedIntegerValue];

        suggestionsBySuggestionLayoutTypes = self->_suggestionsBySuggestionLayoutTypes;
        v16 = [NSNumber numberWithInteger:v11];
        v17 = [(NSMutableDictionary *)suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:v16];

        unint64_t v18 = [v17 count];
        int v19 = v18 < v14;
        if (v18 < v14 && !a5)
        {
          if (!v17)
          {
            v17 = objc_opt_new();
            v20 = self->_suggestionsBySuggestionLayoutTypes;
            v21 = [NSNumber numberWithInteger:v11];
            [(NSMutableDictionary *)v20 setObject:v17 forKeyedSubscript:v21];
          }
          [v17 addObject:v43];
          if (v41) {
            objc_storeStrong((id *)p_mainSuggestionInLayout, a3);
          }
          int v19 = 2;
          char v40 = 1;
        }

        if (v18 < v14) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v8) {
            goto LABEL_5;
          }

          goto LABEL_20;
        }
      }

      if ((v19 | 2) != 2) {
        goto LABEL_26;
      }
LABEL_20:
      if ((v40 & 1) == 0) {
        goto LABEL_28;
      }
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      char v53 = 1;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __81___ATXCompositeLayoutWidgetSuggestionBase_addSuggestion_asMainSuggestion_dryRun___block_invoke;
      v46[3] = &unk_1E68AD758;
      id v47 = v45;
      v48 = self;
      v49 = &v50;
      [v47 enumerateKeysAndObjectsUsingBlock:v46];
      if (*((unsigned char *)v51 + 24))
      {
        id v22 = objc_alloc(MEMORY[0x1E4F939C8]);
        int64_t layoutType = self->_layoutType;
        v24 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F03F0];
        v25 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0408];
        v26 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0420];
        v27 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0438];
        v28 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0450];
        v29 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0468];
        v30 = [(NSMutableDictionary *)self->_suggestionsBySuggestionLayoutTypes objectForKeyedSubscript:&unk_1F27F0480];
        v31 = (ATXSuggestionLayout *)[v22 initWithLayoutType:layoutType oneByOneSuggestions:v24 oneByTwoSuggestions:v25 twoByTwoSuggestions:v26 oneByFourSuggestions:v27 twoByFourSuggestions:v28 fourByFourSuggestions:v29 fourByEightSuggestions:v30];
        suggestionLayout = self->_suggestionLayout;
        self->_suggestionLayout = v31;

        [(ATXSuggestionLayout *)self->_suggestionLayout setIsValidForSuggestionsWidget:1];
        v33 = [(ATXProactiveSuggestion *)*p_mainSuggestionInLayout uuid];
        [(ATXSuggestionLayout *)self->_suggestionLayout setUuidOfHighestConfidenceSuggestion:v33];

        v34 = __atxlog_handle_blending();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [(ATXHomeScreenWidgetIdentifiable *)self->_widget widgetUniqueId];
          v36 = self->_suggestionLayout;
          *(_DWORD *)buf = 138412546;
          v59 = v35;
          __int16 v60 = 2112;
          v61 = v36;
          _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, "Layout for widget %@ is complete: %@", buf, 0x16u);
        }
      }

      _Block_object_dispose(&v50, 8);
LABEL_26:
      BOOL v6 = 1;
    }
    else
    {

LABEL_28:
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (id)_existingSuggestionsInLayout
{
  suggestionLayout = self->_suggestionLayout;
  if (suggestionLayout)
  {
    id v4 = [(ATXSuggestionLayout *)suggestionLayout minSuggestionListInLayout];
  }
  else
  {
    id v5 = objc_opt_new();
    suggestionsBySuggestionLayoutTypes = self->_suggestionsBySuggestionLayoutTypes;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71___ATXCompositeLayoutWidgetSuggestionBase__existingSuggestionsInLayout__block_invoke;
    v8[3] = &unk_1E68AD780;
    id v4 = v5;
    id v9 = v4;
    [(NSMutableDictionary *)suggestionsBySuggestionLayoutTypes enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v4;
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

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (ATXSuggestionDeduplicatorProtocol)suggestionDeduplicator
{
  return self->_suggestionDeduplicator;
}

- (ATXBlendingLayerHyperParameters)hyperParameters
{
  return self->_hyperParameters;
}

- (NSMutableDictionary)suggestionsBySuggestionLayoutTypes
{
  return self->_suggestionsBySuggestionLayoutTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsBySuggestionLayoutTypes, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_mainSuggestionInLayout, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_destroyWeak((id *)&self->_stack);
}

@end