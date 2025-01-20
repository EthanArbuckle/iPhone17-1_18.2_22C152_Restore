@interface _ATXHomeScreenStackState
- (ATXHomeScreenStackConfig)config;
- (BOOL)containsIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5;
- (BOOL)containsSuggestedWidgetForApp:(id)a3;
- (BOOL)containsWidgetForApp:(id)a3;
- (BOOL)containsWidgetForIntent:(id)a3;
- (BOOL)isStale;
- (BOOL)mostRecentRotationOfStackIsSystemInitiated;
- (BOOL)previousSuggestedWidgetsContainIdenticalContentOfSuggestion:(id)a3;
- (BOOL)previousTopWidgetWasShowingIdenticalContentOfSuggestion:(id)a3;
- (BOOL)sizeIsCompatibleWithWidgetSuggestion:(id)a3;
- (BOOL)topWidgetIsShowingIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5;
- (NSArray)previousSuggestedWidgets;
- (NSMutableArray)suggestedWidgets;
- (NSMutableDictionary)suggestionsWidgetSuggestionsByWidgetUniqueId;
- (_ATXHomeScreenPageState)page;
- (_ATXHomeScreenStackState)initWithPageState:(id)a3 stackConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7;
- (_ATXWidgetSuggesting)previousTopOfStackSuggestion;
- (_ATXWidgetSuggesting)topOfStackSuggestion;
- (id)_firstWidgetPassingTest:(id)a3 considerSuggestedWidgets:(BOOL)a4;
- (id)_previousSuggestionForMemberWidget:(id)a3;
- (id)previousTopWidget;
- (id)widgetForSuggestion:(id)a3 considerSuggestedWidgets:(BOOL)a4;
- (void)previousTopWidget;
- (void)setTopOfStackSuggestion:(id)a3;
@end

@implementation _ATXHomeScreenStackState

- (_ATXHomeScreenStackState)initWithPageState:(id)a3 stackConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v64.receiver = self;
  v64.super_class = (Class)_ATXHomeScreenStackState;
  v17 = [(_ATXHomeScreenStackState *)&v64 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_30;
  }
  id v52 = v16;
  objc_storeWeak((id *)&v17->_page, v12);
  p_config = (id *)&v18->_config;
  objc_storeStrong((id *)&v18->_config, a4);
  objc_storeStrong((id *)&v18->_stackStateTracker, a5);
  objc_storeStrong((id *)&v18->_suggestionDeduplicator, a6);
  objc_storeStrong((id *)&v18->_hyperParameters, a7);
  topOfStackSuggestion = v18->_topOfStackSuggestion;
  v18->_topOfStackSuggestion = 0;

  if (([(ATXHomeScreenStackConfig *)v18->_config isAppPredictionPanel] & 1) != 0
    || [*p_config isPinnedSuggestionsWidget])
  {
    v21 = [(ATXHomeScreenStackConfig *)v18->_config widgets];
    v22 = [v21 firstObject];
    uint64_t v23 = [(_ATXHomeScreenStackState *)v18 _previousSuggestionForMemberWidget:v22];
    previousTopOfStackSuggestion = v18->_previousTopOfStackSuggestion;
    v18->_previousTopOfStackSuggestion = (_ATXWidgetSuggesting *)v23;
  }
  else
  {
    if (([*p_config allowsSmartRotate] & 1) == 0
      && ![*p_config allowsNewWidget])
    {
      goto LABEL_6;
    }
    v21 = [(_ATXHomeScreenStackState *)v18 previousTopWidget];
    uint64_t v51 = [(_ATXHomeScreenStackState *)v18 _previousSuggestionForMemberWidget:v21];
    v22 = v18->_previousTopOfStackSuggestion;
    v18->_previousTopOfStackSuggestion = (_ATXWidgetSuggesting *)v51;
  }

LABEL_6:
  id v53 = v14;
  id v54 = v13;
  id v55 = v12;
  uint64_t v25 = objc_opt_new();
  suggestedWidgets = v18->_suggestedWidgets;
  v18->_suggestedWidgets = (NSMutableArray *)v25;

  uint64_t v27 = objc_opt_new();
  previousSuggestedWidgets = v18->_previousSuggestedWidgets;
  v18->_previousSuggestedWidgets = (NSMutableArray *)v27;

  if ([(ATXHomeScreenStackConfig *)v18->_config allowsNewWidget])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v29 = [*p_config widgets];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v61 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ([v34 isSuggestedWidget])
          {
            v35 = [(_ATXHomeScreenStackState *)v18 _previousSuggestionForMemberWidget:v34];
            if (v35) {
              [(NSMutableArray *)v18->_previousSuggestedWidgets addObject:v35];
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v31);
    }
  }
  uint64_t v36 = objc_opt_new();
  suggestionsWidgetSuggestionsByWidgetUniqueId = v18->_suggestionsWidgetSuggestionsByWidgetUniqueId;
  v18->_suggestionsWidgetSuggestionsByWidgetUniqueId = (NSMutableDictionary *)v36;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v38 = [(ATXHomeScreenStackConfig *)v18->_config widgets];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v57;
    uint64_t v42 = *MEMORY[0x1E4F4B5F8];
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v57 != v41) {
          objc_enumerationMutation(v38);
        }
        v44 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        if (([v44 isSuggestedWidget] & 1) == 0)
        {
          v45 = [v44 extensionBundleId];
          int v46 = [v45 isEqualToString:v42];

          if (v46)
          {
            v47 = [[_ATXSuggestionsWidgetSuggestion alloc] initWithSuggestionsWidget:v44 containingStack:v18 suggestionDeduplicator:v18->_suggestionDeduplicator hyperParameters:v18->_hyperParameters];
            v48 = v18->_suggestionsWidgetSuggestionsByWidgetUniqueId;
            v49 = [v44 widgetUniqueId];
            [(NSMutableDictionary *)v48 setObject:v47 forKeyedSubscript:v49];
          }
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v40);
  }

  id v13 = v54;
  id v12 = v55;
  id v14 = v53;
  id v16 = v52;
LABEL_30:

  return v18;
}

- (_ATXWidgetSuggesting)topOfStackSuggestion
{
  return self->_topOfStackSuggestion;
}

- (void)setTopOfStackSuggestion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52___ATXHomeScreenStackState_setTopOfStackSuggestion___block_invoke;
    v19[3] = &unk_1E68ADB08;
    v7 = (_ATXWidgetSuggesting *)v5;
    v20 = v7;
    v8 = [(_ATXHomeScreenStackState *)self _firstWidgetPassingTest:v19 considerSuggestedWidgets:1];
    if (!v8)
    {
      uint64_t v9 = [(NSMutableArray *)self->_suggestedWidgets count];
      suggestedWidgets = self->_suggestedWidgets;
      if (v9 == 1)
      {
        v11 = [(NSMutableArray *)suggestedWidgets objectAtIndexedSubscript:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          suggestionsWidgetSuggestionsByWidgetUniqueId = self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
          id v13 = [v11 widget];
          id v14 = [v13 widgetUniqueId];
          [(NSMutableDictionary *)suggestionsWidgetSuggestionsByWidgetUniqueId removeObjectForKey:v14];
        }
        [(NSMutableArray *)self->_suggestedWidgets replaceObjectAtIndex:0 withObject:v7];
      }
      else
      {
        [(NSMutableArray *)suggestedWidgets addObject:v7];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
      v17 = [(_ATXWidgetSuggesting *)v7 widget];
      v18 = [v17 widgetUniqueId];
      [(NSMutableDictionary *)v16 setObject:v7 forKeyedSubscript:v18];
    }
    objc_storeStrong((id *)&self->_topOfStackSuggestion, a3);

    topOfStackSuggestion = v20;
  }
  else
  {
    topOfStackSuggestion = self->_topOfStackSuggestion;
    self->_topOfStackSuggestion = 0;
  }
}

- (BOOL)isStale
{
  stackStateTracker = self->_stackStateTracker;
  v3 = [(ATXHomeScreenStackConfig *)self->_config identifier];
  LOBYTE(stackStateTracker) = [(ATXStackStateTracker *)stackStateTracker stackIsStale:v3];

  return (char)stackStateTracker;
}

- (BOOL)mostRecentRotationOfStackIsSystemInitiated
{
  stackStateTracker = self->_stackStateTracker;
  v3 = [(ATXHomeScreenStackConfig *)self->_config identifier];
  LOBYTE(stackStateTracker) = [(ATXStackStateTracker *)stackStateTracker mostRecentRotationOfStackIsSystemInitiated:v3];

  return (char)stackStateTracker;
}

- (id)previousTopWidget
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_config = &self->_config;
  if ([(ATXHomeScreenStackConfig *)self->_config isPinnedWidget])
  {
    v4 = [(ATXHomeScreenStackConfig *)*p_config widgets];
    id v5 = [v4 firstObject];
  }
  else
  {
    stackStateTracker = self->_stackStateTracker;
    v7 = [(ATXHomeScreenStackConfig *)self->_config identifier];
    v4 = [(ATXStackStateTracker *)stackStateTracker topWidgetUniqueIdOfStack:v7];

    if (v4)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v8 = [(ATXHomeScreenStackConfig *)*p_config widgets];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            id v14 = [v13 widgetUniqueId];
            char v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              id v5 = v13;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(_ATXHomeScreenStackState *)(id *)p_config previousTopWidget];
    }
    id v5 = 0;
LABEL_17:
  }
  return v5;
}

- (BOOL)containsWidgetForIntent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(ATXHomeScreenStackConfig *)self->_config widgets];
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      if (([v10 isSuggestedWidget] & 1) == 0)
      {
        uint64_t v11 = [v10 intent];

        if (v11)
        {
          id v12 = [v10 intent];
          BOOL v13 = +[ATXActionToWidgetConverter isWidgetIntent:v12 validConversionFromActionIntent:v4];

          if (v13) {
            goto LABEL_20;
          }
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_suggestedWidgets;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v5);
      }
      long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "widget", (void)v21);
      long long v18 = [v17 intent];
      BOOL v19 = +[ATXActionToWidgetConverter isWidgetIntent:v18 validConversionFromActionIntent:v4];

      if (v19) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v14) = 1;
  }
LABEL_21:

  return v14;
}

- (BOOL)containsWidgetForApp:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(ATXHomeScreenStackConfig *)self->_config widgets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v10 isSuggestedWidget] & 1) == 0)
        {
          uint64_t v11 = [v10 appBundleId];
          char v12 = [v11 isEqualToString:v4];

          if (v12)
          {

            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = [(_ATXHomeScreenStackState *)self containsSuggestedWidgetForApp:v4];
LABEL_12:

  return v13;
}

- (BOOL)containsSuggestedWidgetForApp:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_suggestedWidgets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "widget", (void)v13);
        uint64_t v10 = [v9 appBundleId];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(ATXHomeScreenStackConfig *)self->_config isAppPredictionPanel])
  {
    BOOL v9 = [(_ATXHomeScreenStackState *)self topWidgetIsShowingIdenticalContentOfSuggestion:v8 ignoreDuplicatesInSGWidget:v6 ignoreDuplicatesInPanels:v5];
    goto LABEL_35;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [(ATXHomeScreenStackConfig *)self->_config widgets];
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
      if (([v15 isSuggestedWidget] & 1) == 0
        && ([(ATXSuggestionDeduplicatorProtocol *)self->_suggestionDeduplicator isWidget:v15 showingIdenticalContentOfSuggestion:v8] & 1) != 0)
      {
        goto LABEL_33;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = self->_suggestedWidgets;
  uint64_t v16 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
LABEL_14:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v32 != v18) {
        objc_enumerationMutation(v10);
      }
      uint64_t v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if ([v20 containsIdenticalContentOfSuggestion:v8]) {
          break;
        }
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v17) {
          goto LABEL_14;
        }
        goto LABEL_22;
      }
    }
LABEL_33:

LABEL_34:
    BOOL v9 = 1;
    goto LABEL_35;
  }
LABEL_22:

  if (!v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v21 = [(NSMutableDictionary *)self->_suggestionsWidgetSuggestionsByWidgetUniqueId allValues];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          if ([*(id *)(*((void *)&v27 + 1) + 8 * i) containsIdenticalContentOfSuggestion:v8])
          {

            goto LABEL_34;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v9 = 0;
LABEL_35:

  return v9;
}

- (BOOL)topWidgetIsShowingIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (([(ATXHomeScreenStackConfig *)self->_config allowsSmartRotate] & 1) == 0
    && ([(ATXHomeScreenStackConfig *)self->_config allowsNewWidget] & 1) == 0
    && ([(ATXHomeScreenStackConfig *)self->_config isPinnedSuggestionsWidget] & 1) == 0
    && ![(ATXHomeScreenStackConfig *)self->_config isAppPredictionPanel])
  {
    char v10 = [(_ATXHomeScreenStackState *)self previousTopWidgetWasShowingIdenticalContentOfSuggestion:v8];
    goto LABEL_11;
  }
  if (!v5 || ([(ATXHomeScreenStackConfig *)self->_config isAppPredictionPanel] & 1) == 0)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      char v10 = [(_ATXWidgetSuggesting *)self->_topOfStackSuggestion containsIdenticalContentOfSuggestion:v8];
LABEL_11:
      BOOL v9 = v10;
      goto LABEL_12;
    }
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)previousTopWidgetWasShowingIdenticalContentOfSuggestion:(id)a3
{
  id v4 = a3;
  if (([(ATXHomeScreenStackConfig *)self->_config isPinnedSuggestionsWidget] & 1) != 0
    || [(ATXHomeScreenStackConfig *)self->_config isAppPredictionPanel])
  {
    char v5 = [(_ATXWidgetSuggesting *)self->_previousTopOfStackSuggestion containsIdenticalContentOfSuggestion:v4];
  }
  else
  {
    BOOL v6 = [(_ATXHomeScreenStackState *)self previousTopWidget];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 extensionBundleId];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F4B5F8]];

      if (v9) {
        char v10 = [(_ATXWidgetSuggesting *)self->_previousTopOfStackSuggestion containsIdenticalContentOfSuggestion:v4];
      }
      else {
        char v10 = [(ATXSuggestionDeduplicatorProtocol *)self->_suggestionDeduplicator isWidget:v7 showingIdenticalContentOfSuggestion:v4];
      }
      char v5 = v10;
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)previousSuggestedWidgetsContainIdenticalContentOfSuggestion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = self->_previousSuggestedWidgets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsIdenticalContentOfSuggestion:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)widgetForSuggestion:(id)a3 considerSuggestedWidgets:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 executableSpecification];
  uint64_t v8 = [v7 executableType];

  if (v8 == 3)
  {
    if ([(_ATXHomeScreenStackState *)self sizeIsCompatibleWithWidgetSuggestion:v6])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke;
      v14[3] = &unk_1E68ADB30;
      v14[4] = self;
      id v15 = v6;
      int v9 = [(_ATXHomeScreenStackState *)self _firstWidgetPassingTest:v14 considerSuggestedWidgets:v4];

      goto LABEL_10;
    }
  }
  else
  {
    int v10 = [(ATXHomeScreenStackConfig *)self->_config isAppPredictionPanel];
    hyperParameters = self->_hyperParameters;
    if (v10)
    {
      if ([(ATXBlendingLayerHyperParameters *)hyperParameters isSuggestionEligibleForAppPredictionPanel:v6])
      {
        long long v12 = [(ATXHomeScreenStackConfig *)self->_config widgets];
        int v9 = [v12 firstObject];

        goto LABEL_10;
      }
    }
    else if ([(ATXBlendingLayerHyperParameters *)hyperParameters isSuggestionEligibleForSuggestionsWidget:v6])
    {
      int v9 = [(_ATXHomeScreenStackState *)self _firstWidgetPassingTest:&__block_literal_global_45 considerSuggestedWidgets:v4];
      goto LABEL_10;
    }
  }
  int v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)sizeIsCompatibleWithWidgetSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXHomeScreenStackConfig *)self->_config stackLayoutSize];
  char v6 = 0;
  uint64_t v7 = 3;
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t v7 = 4;
      goto LABEL_6;
    case 2:
      uint64_t v7 = 6;
      goto LABEL_6;
    case 3:
      goto LABEL_8;
    case 4:
      uint64_t v7 = 7;
LABEL_6:
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F93960]) initWithApplicableSuggestionLayout:v7];
      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  int v9 = [v4 uiSpecification];
  int v10 = [v9 preferredLayoutConfigs];
  char v6 = [v10 containsObject:v8];

LABEL_8:
  return v6;
}

- (id)_previousSuggestionForMemberWidget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    long long v12 = 0;
    goto LABEL_19;
  }
  char v6 = [v4 extensionBundleId];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F4AD48]];

  if (!v7)
  {
    long long v13 = [v5 extensionBundleId];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F4B5F8]];

    if (!v14)
    {
      long long v12 = [[_ATXSimpleWidgetSuggestion alloc] initWithWidget:v5 suggestion:0 stack:self suggestionDeduplicator:self->_suggestionDeduplicator];
      goto LABEL_19;
    }
    id v15 = [(ATXStackStateTracker *)self->_stackStateTracker currentSuggestionsWidgetLayouts];
    uint64_t v16 = [v5 widgetUniqueId];
    int v10 = [v15 objectForKeyedSubscript:v16];

    if (v10)
    {
      long long v11 = [[_ATXSuggestionsWidgetSuggestion alloc] initWithSuggestionsWidget:v5 containingStack:self suggestionLayout:v10 suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];
      goto LABEL_9;
    }
    uint64_t v18 = __atxlog_handle_blending();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:]((uint64_t)self);
    }

LABEL_17:
    long long v12 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = [(ATXStackStateTracker *)self->_stackStateTracker currentAppPredictionPanelLayouts];
  int v9 = [(ATXHomeScreenStackConfig *)self->_config identifier];
  int v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    uint64_t v17 = __atxlog_handle_blending();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:]((uint64_t)self, (id *)&self->_config);
    }

    goto LABEL_17;
  }
  long long v11 = [[_ATXAppPredictionPanelSuggestion alloc] initWithAppPredictionPanel:v5 containingStack:self suggestionLayout:v10 suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];
LABEL_9:
  long long v12 = (_ATXSimpleWidgetSuggestion *)v11;
LABEL_18:

LABEL_19:
  return v12;
}

- (id)_firstWidgetPassingTest:(id)a3 considerSuggestedWidgets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v6 = (uint64_t (**)(id, void *))a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v7 = [(ATXHomeScreenStackConfig *)self->_config widgets];
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v12 isSuggestedWidget] & 1) == 0 && (v6[2](v6, v12))
        {
          id v19 = v12;
LABEL_21:
          long long v13 = v19;
          goto LABEL_22;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v7 = self->_suggestedWidgets;
    long long v13 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v7);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
          uint64_t v17 = objc_msgSend(v16, "widget", (void)v21);
          char v18 = v6[2](v6, v17);

          if (v18)
          {
            id v19 = [v16 widget];
            goto LABEL_21;
          }
        }
        long long v13 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (_ATXHomeScreenPageState)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  return (_ATXHomeScreenPageState *)WeakRetained;
}

- (ATXHomeScreenStackConfig)config
{
  return self->_config;
}

- (_ATXWidgetSuggesting)previousTopOfStackSuggestion
{
  return self->_previousTopOfStackSuggestion;
}

- (NSMutableArray)suggestedWidgets
{
  return self->_suggestedWidgets;
}

- (NSArray)previousSuggestedWidgets
{
  return &self->_previousSuggestedWidgets->super;
}

- (NSMutableDictionary)suggestionsWidgetSuggestionsByWidgetUniqueId
{
  return self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_suggestionsWidgetSuggestionsByWidgetUniqueId, 0);
  objc_storeStrong((id *)&self->_previousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_suggestedWidgets, 0);
  objc_storeStrong((id *)&self->_previousTopOfStackSuggestion, 0);
  objc_storeStrong((id *)&self->_topOfStackSuggestion, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
}

- (void)previousTopWidget
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 identifier];
  int v6 = 136315650;
  int v7 = "-[_ATXHomeScreenStackState previousTopWidget]";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%s: Unable to find previous top widget for stack %@ (stackStateTracker returned topWidgetUniqueId %@)", (uint8_t *)&v6, 0x20u);
}

- (void)_previousSuggestionForMemberWidget:(uint64_t)a1 .cold.1(uint64_t a1, id *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  BOOL v4 = [WeakRetained config];
  [v4 pageIndex];
  uint64_t v5 = [*a2 identifier];
  int v6 = [*a2 widgets];
  int v7 = [v6 firstObject];
  __int16 v8 = [v7 widgetUniqueId];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1D0FA3000, v9, v10, "_ATXHomeScreenStackState: Unable to get layout for AppPredictionPanel on screen: page %lu, stackId %{public}@, widgetUniqueId %{public}@", v11, v12, v13, v14, v15);
}

- (void)_previousSuggestionForMemberWidget:(uint64_t)a1 .cold.2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = [WeakRetained config];
  [v3 pageIndex];
  BOOL v4 = [*(id *)(a1 + 80) identifier];
  uint64_t v5 = [*(id *)(a1 + 80) widgets];
  int v6 = [v5 firstObject];
  int v7 = [v6 widgetUniqueId];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_7(&dword_1D0FA3000, v8, v9, "_ATXHomeScreenStackState: Unable to get layout for SuggestionsWidget on screen: page %lu, stackId %{public}@, widgetUniqueId %{public}@", v10, v11, v12, v13, v14);
}

@end