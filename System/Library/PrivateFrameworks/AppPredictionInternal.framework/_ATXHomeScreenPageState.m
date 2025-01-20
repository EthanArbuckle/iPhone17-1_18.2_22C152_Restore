@interface _ATXHomeScreenPageState
- (ATXHomeScreenPage)config;
- (BOOL)_isShowingApp:(id)a3 allowFolder:(BOOL)a4;
- (BOOL)containsSGWidget;
- (BOOL)containsSuggestedWidgetForApp:(id)a3;
- (BOOL)containsWidgetForIntent:(id)a3;
- (BOOL)isSeldomVisited;
- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7;
- (BOOL)suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:(id)a3;
- (NSArray)stacks;
- (_ATXHomeScreenPageState)initWithHomeScreenState:(id)a3 pageConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7;
- (_ATXHomeScreenState)homeScreen;
- (id)pinnedAPPs;
- (id)pinnedSGWidgets;
@end

@implementation _ATXHomeScreenPageState

- (_ATXHomeScreenPageState)initWithHomeScreenState:(id)a3 pageConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v46.receiver = self;
  v46.super_class = (Class)_ATXHomeScreenPageState;
  v17 = [(_ATXHomeScreenPageState *)&v46 init];
  if (v17)
  {
    id v34 = a4;
    id v35 = a5;
    id obj = v12;
    v18 = (NSArray *)objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v37 = v13;
    v19 = [v13 stacks];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v43;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = -[_ATXHomeScreenStackState initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenStackState alloc], "initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:", v17, *(void *)(*((void *)&v42 + 1) + 8 * v23), v14, v15, v16, v34, v35);
          [(NSArray *)v18 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v21);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v25 = [v37 panels];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [[_ATXHomeScreenStackState alloc] initWithPageState:v17 stackConfig:*(void *)(*((void *)&v38 + 1) + 8 * v29) stackStateTracker:v14 suggestionDeduplicator:v15 hyperParameters:v16];
          [(NSArray *)v18 addObject:v30];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v27);
    }

    id v12 = obj;
    objc_storeWeak((id *)&v17->_homeScreen, obj);
    objc_storeStrong((id *)&v17->_config, v34);
    stacks = v17->_stacks;
    v17->_stacks = v18;
    v32 = v18;

    objc_storeStrong((id *)&v17->_stackStateTracker, v35);
    id v13 = v37;
  }

  return v17;
}

- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = [v12 executableSpecification];
  uint64_t v14 = [v13 executableType];

  if (v14 != 1) {
    goto LABEL_18;
  }
  id v15 = [v12 executableSpecification];
  id v16 = [v15 executableObject];

  if (![(NSArray *)v16 length])
  {
    __atxlog_handle_blending();
    id obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obj->super, OS_LOG_TYPE_FAULT)) {
      -[_ATXHomeScreenPageState isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:](&obj->super);
    }
LABEL_16:

    goto LABEL_17;
  }
  p_config = &self->_config;
  uint64_t v18 = [(ATXHomeScreenPage *)self->_config pageIndex];
  if (v18 != *MEMORY[0x1E4F4B540])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreen);
    v31 = [WeakRetained appsOnDock];
    char v32 = [v31 containsObject:v16];

    if ((v32 & 1) == 0)
    {
      p_config = &self->_config;
      if (![(_ATXHomeScreenPageState *)self _isShowingApp:v16 allowFolder:0]) {
        goto LABEL_4;
      }
      __atxlog_handle_blending();
      id obj = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&obj->super, OS_LOG_TYPE_DEBUG)) {
        -[_ATXHomeScreenPageState isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:]((uint64_t)v16, (id *)&self->_config, &obj->super);
      }
LABEL_37:
    }
LABEL_38:
    BOOL v29 = 1;
    goto LABEL_39;
  }
LABEL_4:
  if (v9)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = self->_stacks;
    uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      long long v38 = (id *)p_config;
      uint64_t v21 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v23, "containsWidgetForApp:", v16, v38))
          {
            v33 = __atxlog_handle_blending();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v35 = [*v38 pageIndex];
              v36 = [v23 config];
              v37 = [v36 identifier];
              *(_DWORD *)buf = 138412802;
              v50 = v16;
              __int16 v51 = 2048;
              uint64_t v52 = v35;
              __int16 v53 = 2112;
              v54 = v37;
              _os_log_debug_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEBUG, "[HSLS] Bundle id %@ is duplicate on page %ld due to widget in stack %@", buf, 0x20u);
            }
            goto LABEL_37;
          }
        }
        uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = self->_stacks;
  uint64_t v24 = [(NSArray *)v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v16);
        }
        uint64_t v28 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        if (v10)
        {
          if ([v28 containsIdenticalContentOfSuggestion:v12 ignoreDuplicatesInSGWidget:v8 ignoreDuplicatesInPanels:v7])goto LABEL_38; {
        }
          }
        else if ([v28 topWidgetIsShowingIdenticalContentOfSuggestion:v12 ignoreDuplicatesInSGWidget:v8 ignoreDuplicatesInPanels:v7])
        {
          goto LABEL_38;
        }
      }
      uint64_t v25 = [(NSArray *)v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v25);
  }
  BOOL v29 = 0;
LABEL_39:

  return v29;
}

- (BOOL)containsWidgetForIntent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_stacks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsWidgetForIntent:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsSuggestedWidgetForApp:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_stacks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsSuggestedWidgetForApp:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsSGWidget
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(_ATXHomeScreenPageState *)self config];
  char v4 = [v3 containsSuggestionsWidget];

  if (v4) {
    return 1;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self->_stacks;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v12 = objc_msgSend(v11, "suggestedWidgets", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 && ([v17 isLayoutComplete])
              {

                BOOL v5 = 1;
                goto LABEL_22;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v5 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v5 = 0;
  }
LABEL_22:

  return v5;
}

- (BOOL)suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v5 = self->_stacks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v11 = objc_msgSend(v10, "suggestionsWidgetSuggestionsByWidgetUniqueId", 0);
        long long v12 = [v11 allValues];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([*(id *)(*((void *)&v19 + 1) + 8 * j) containsIdenticalContentOfSuggestion:v4])
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v17 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)isSeldomVisited
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXStackStateTracker *)self->_stackStateTracker lastThreeUserVisitDatesOfPage:[(ATXHomeScreenPage *)self->_config pageIndex]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) timeIntervalSinceNow];
        if (v8 > -86400.0) {
          ++v5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
    BOOL v9 = v5 < 3;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)pinnedSGWidgets
{
  return (id)[(NSArray *)self->_stacks _pas_filteredArrayWithTest:&__block_literal_global_154];
}

- (id)pinnedAPPs
{
  return (id)[(NSArray *)self->_stacks _pas_filteredArrayWithTest:&__block_literal_global_14_0];
}

- (BOOL)_isShowingApp:(id)a3 allowFolder:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  config = self->_config;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___ATXHomeScreenPageState__isShowingApp_allowFolder___block_invoke;
  v10[3] = &unk_1E68B38A0;
  id v8 = v6;
  id v11 = v8;
  long long v12 = &v13;
  [(ATXHomeScreenPage *)config enumerateAppsConsideringFolders:v4 block:v10];
  LOBYTE(v4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (_ATXHomeScreenState)homeScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreen);
  return (_ATXHomeScreenState *)WeakRetained;
}

- (ATXHomeScreenPage)config
{
  return self->_config;
}

- (NSArray)stacks
{
  return self->_stacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_homeScreen);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
}

- (void)isShowingDuplicatedContentForSuggestion:(os_log_t)log considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Found nil or empty string from ATXProactiveSuggestion with executable type App.", v1, 2u);
}

- (void)isShowingDuplicatedContentForSuggestion:(NSObject *)a3 considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a2 pageIndex];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "[HSLS] Bundle id %@ is duplicate on page %ld", (uint8_t *)&v6, 0x16u);
}

@end