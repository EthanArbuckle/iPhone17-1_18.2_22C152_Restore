@interface _ATXHomeScreenState
- (BOOL)containsSuggestedWidgetForApp:(id)a3;
- (BOOL)containsWidgetForIntent:(id)a3;
- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 ignoreTodayPage:(BOOL)a8;
- (NSArray)sortedPagesByUserLastVisit;
- (NSSet)appsOnDock;
- (_ATXHomeScreenState)initWithSortedHomeScreenPagesByUserLastVisit:(id)a3 appsOnDock:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7;
@end

@implementation _ATXHomeScreenState

- (_ATXHomeScreenState)initWithSortedHomeScreenPagesByUserLastVisit:(id)a3 appsOnDock:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)_ATXHomeScreenState;
  v17 = [(_ATXHomeScreenState *)&v35 init];
  if (v17)
  {
    id v27 = a4;
    id v28 = v13;
    v18 = (NSArray *)objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v29 = v12;
    id obj = v12;
    uint64_t v19 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = -[_ATXHomeScreenPageState initWithHomeScreenState:pageConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenPageState alloc], "initWithHomeScreenState:pageConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:", v17, *(void *)(*((void *)&v31 + 1) + 8 * v22), v14, v15, v16, v27);
          [(NSArray *)v18 addObject:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v20);
    }

    sortedPagesByUserLastVisit = v17->_sortedPagesByUserLastVisit;
    v17->_sortedPagesByUserLastVisit = v18;
    v25 = v18;

    objc_storeStrong((id *)&v17->_appsOnDock, v27);
    id v13 = v28;
    id v12 = v29;
  }

  return v17;
}

- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 ignoreTodayPage:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v24 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = self->_sortedPagesByUserLastVisit;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    uint64_t v22 = *MEMORY[0x1E4F4B540];
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v8)
        {
          v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) config];
          uint64_t v19 = [v18 pageIndex];

          if (v19 == v22) {
            continue;
          }
        }
        if (objc_msgSend(v17, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v25, v11, v10, v9, v24, v22))
        {
          BOOL v20 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 0;
LABEL_13:

  return v20;
}

- (BOOL)containsWidgetForIntent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sortedPagesByUserLastVisit;
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
  v5 = self->_sortedPagesByUserLastVisit;
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

- (NSArray)sortedPagesByUserLastVisit
{
  return self->_sortedPagesByUserLastVisit;
}

- (NSSet)appsOnDock
{
  return self->_appsOnDock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsOnDock, 0);
  objc_storeStrong((id *)&self->_sortedPagesByUserLastVisit, 0);
}

@end