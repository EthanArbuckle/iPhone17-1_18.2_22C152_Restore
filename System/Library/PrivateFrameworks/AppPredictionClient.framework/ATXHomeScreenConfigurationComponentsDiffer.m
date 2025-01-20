@interface ATXHomeScreenConfigurationComponentsDiffer
- (ATXHomeScreenConfigurationComponentsDiffer)initWithPreviousComponents:(id)a3 currentComponents:(id)a4;
- (NSArray)addedApps;
- (NSArray)addedPinnedWidgets;
- (NSArray)addedStacks;
- (NSArray)deletedPinnedWidgets;
- (NSArray)deletedPreviousSuggestedWidgets;
- (NSArray)deletedStacks;
- (NSArray)removedApps;
- (NSArray)userAddedPreviousSuggestedWidgets;
- (NSArray)userAddedStackedWidgets;
- (NSArray)userDeletedStackedWidgets;
- (id)_widgetsByWidgetUniqueIds:(id)a3;
@end

@implementation ATXHomeScreenConfigurationComponentsDiffer

- (ATXHomeScreenConfigurationComponentsDiffer)initWithPreviousComponents:(id)a3 currentComponents:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)ATXHomeScreenConfigurationComponentsDiffer;
  v8 = [(ATXHomeScreenConfigurationComponentsDiffer *)&v76 init];
  if (v8)
  {
    v9 = [v7 pinnedWidgets];
    v10 = [v6 pinnedWidgets];
    uint64_t v11 = [v9 differenceFromArray:v10 withOptions:0 usingEquivalenceTest:&__block_literal_global_59];
    pinnedWidgetsDifference = v8->_pinnedWidgetsDifference;
    v8->_pinnedWidgetsDifference = (NSOrderedCollectionDifference *)v11;

    v13 = [v7 stacks];
    v14 = [v6 stacks];
    uint64_t v15 = [v13 differenceFromArray:v14 withOptions:0 usingEquivalenceTest:&__block_literal_global_7_2];
    stacksDifference = v8->_stacksDifference;
    v8->_stacksDifference = (NSOrderedCollectionDifference *)v15;

    obuint64_t j = (id)objc_opt_new();
    v57 = v6;
    v17 = [v6 stackedWidgets];
    v58 = v8;
    v18 = [(ATXHomeScreenConfigurationComponentsDiffer *)v8 _widgetsByWidgetUniqueIds:v17];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v59 = v7;
    v19 = [v7 stackedWidgets];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v73 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          if (([v24 isSuggestedWidget] & 1) == 0)
          {
            v25 = [v24 widgetUniqueId];
            v26 = [v18 objectForKeyedSubscript:v25];

            if (!v26 || [v26 isSuggestedWidget]) {
              [obj addObject:v24];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v21);
    }

    objc_storeStrong((id *)&v8->_userAddedStackedWidgets, obj);
    id v63 = (id)objc_opt_new();
    id v62 = (id)objc_opt_new();
    v27 = [v59 stackedWidgets];
    v28 = [(ATXHomeScreenConfigurationComponentsDiffer *)v8 _widgetsByWidgetUniqueIds:v27];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v29 = [v57 stackedWidgets];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v69 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          v35 = [v34 widgetUniqueId];
          v36 = [v28 objectForKeyedSubscript:v35];

          if (!v36)
          {
            if ([v34 isSuggestedWidget]) {
              v37 = v62;
            }
            else {
              v37 = v63;
            }
            [v37 addObject:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v31);
    }

    objc_storeStrong((id *)&v8->_userDeletedStackedWidgets, v63);
    objc_storeStrong((id *)&v8->_deletedPreviousSuggestedWidgets, v62);
    v60 = (NSArray *)objc_opt_new();
    v38 = [v59 stackedWidgets];
    v39 = [v59 pinnedWidgets];
    v40 = [v38 arrayByAddingObjectsFromArray:v39];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v65 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          if (([v46 isSuggestedWidget] & 1) == 0)
          {
            v47 = [v46 widgetUniqueId];
            v48 = [v18 objectForKeyedSubscript:v47];
            int v49 = [v48 isSuggestedWidget];

            if (v49) {
              [(NSArray *)v60 addObject:v46];
            }
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v43);
    }

    v8 = v58;
    userAddedPreviousSuggestedWidgets = v58->_userAddedPreviousSuggestedWidgets;
    v58->_userAddedPreviousSuggestedWidgets = v60;
    v51 = v60;

    id v7 = v59;
    v52 = [v59 apps];
    id v6 = v57;
    v53 = [v57 apps];
    uint64_t v54 = [v52 differenceFromArray:v53 withOptions:0 usingEquivalenceTest:&__block_literal_global_10_0];
    appsDifference = v58->_appsDifference;
    v58->_appsDifference = (NSOrderedCollectionDifference *)v54;
  }
  return v8;
}

void *__91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 widgetUniqueId];

  if (v6)
  {
    id v7 = [v4 widgetUniqueId];
    v8 = [v5 widgetUniqueId];
    id v6 = (void *)[v7 isEqualToString:v8];
  }
  return v6;
}

uint64_t __91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

BOOL __91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isEqual:v5])
  {
    id v6 = [v4 page];
    uint64_t v7 = [v6 pageIndex];
    v8 = [v5 page];
    BOOL v9 = v7 == [v8 pageIndex];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSArray)addedApps
{
  v2 = [(NSOrderedCollectionDifference *)self->_appsDifference insertions];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_13_2);

  return (NSArray *)v3;
}

uint64_t __55__ATXHomeScreenConfigurationComponentsDiffer_addedApps__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)removedApps
{
  v2 = [(NSOrderedCollectionDifference *)self->_appsDifference removals];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);

  return (NSArray *)v3;
}

uint64_t __57__ATXHomeScreenConfigurationComponentsDiffer_removedApps__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)addedPinnedWidgets
{
  v2 = [(NSOrderedCollectionDifference *)self->_pinnedWidgetsDifference insertions];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_17);

  return (NSArray *)v3;
}

uint64_t __64__ATXHomeScreenConfigurationComponentsDiffer_addedPinnedWidgets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)deletedPinnedWidgets
{
  v2 = [(NSOrderedCollectionDifference *)self->_pinnedWidgetsDifference removals];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);

  return (NSArray *)v3;
}

uint64_t __66__ATXHomeScreenConfigurationComponentsDiffer_deletedPinnedWidgets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)addedStacks
{
  v2 = [(NSOrderedCollectionDifference *)self->_stacksDifference insertions];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_21_2);

  return (NSArray *)v3;
}

uint64_t __57__ATXHomeScreenConfigurationComponentsDiffer_addedStacks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)deletedStacks
{
  v2 = [(NSOrderedCollectionDifference *)self->_stacksDifference removals];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_23_0);

  return (NSArray *)v3;
}

uint64_t __59__ATXHomeScreenConfigurationComponentsDiffer_deletedStacks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (id)_widgetsByWidgetUniqueIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "widgetUniqueId", (void)v14);

        if (v11)
        {
          v12 = [v10 widgetUniqueId];
          [v4 setObject:v10 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)userAddedStackedWidgets
{
  return self->_userAddedStackedWidgets;
}

- (NSArray)userDeletedStackedWidgets
{
  return self->_userDeletedStackedWidgets;
}

- (NSArray)userAddedPreviousSuggestedWidgets
{
  return self->_userAddedPreviousSuggestedWidgets;
}

- (NSArray)deletedPreviousSuggestedWidgets
{
  return self->_deletedPreviousSuggestedWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedPreviousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_userAddedPreviousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_userDeletedStackedWidgets, 0);
  objc_storeStrong((id *)&self->_userAddedStackedWidgets, 0);
  objc_storeStrong((id *)&self->_appsDifference, 0);
  objc_storeStrong((id *)&self->_stacksDifference, 0);

  objc_storeStrong((id *)&self->_pinnedWidgetsDifference, 0);
}

@end