@interface ATXHomeScreenConfigurationDiffer
+ (BOOL)_widget:(id)a3 hasSamePersonalityAsOtherWidget:(id)a4;
- (ATXHomeScreenConfigurationDiffer)initWithPreviousConfigurations:(id)a3 currentConfigurations:(id)a4;
- (BOOL)currentConfigContainsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5;
- (NSArray)addedApps;
- (NSArray)addedPinnedWidgets;
- (NSArray)addedStacks;
- (NSArray)configuredWidgets;
- (NSArray)deletedPinnedWidgets;
- (NSArray)deletedStacks;
- (NSArray)removedApps;
- (NSArray)suggestedWidgetsAddedPermanentlyByUser;
- (NSArray)suggestedWidgetsRemoved;
- (NSArray)widgetsAddedToStacksByUser;
- (NSArray)widgetsDeletedFromStacksByUser;
- (id)stackInCurrentConfigurationsForStackedWidget:(id)a3;
- (id)stackInPreviousConfigurationsForStackedWidget:(id)a3;
- (void)_calculatePinnedWidgetChanges;
- (void)_calculateStackedWidgetChanges;
@end

@implementation ATXHomeScreenConfigurationDiffer

- (ATXHomeScreenConfigurationDiffer)initWithPreviousConfigurations:(id)a3 currentConfigurations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXHomeScreenConfigurationDiffer;
  v8 = [(ATXHomeScreenConfigurationDiffer *)&v16 init];
  if (v8)
  {
    v9 = [[ATXHomeScreenConfigurationComponents alloc] initWithConfigurations:v6];
    previousComponents = v8->_previousComponents;
    v8->_previousComponents = v9;

    v11 = [[ATXHomeScreenConfigurationComponents alloc] initWithConfigurations:v7];
    currentComponents = v8->_currentComponents;
    v8->_currentComponents = v11;

    v13 = [[ATXHomeScreenConfigurationComponentsDiffer alloc] initWithPreviousComponents:v8->_previousComponents currentComponents:v8->_currentComponents];
    componentsDiffer = v8->_componentsDiffer;
    v8->_componentsDiffer = v13;

    [(ATXHomeScreenConfigurationDiffer *)v8 _calculatePinnedWidgetChanges];
    [(ATXHomeScreenConfigurationDiffer *)v8 _calculateStackedWidgetChanges];
  }

  return v8;
}

- (void)_calculatePinnedWidgetChanges
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v4 = [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer addedPinnedWidgets];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v24 = self;
  id v7 = [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer deletedPinnedWidgets];
  v27 = (void *)[v6 initWithArray:v7];

  v8 = objc_opt_new();
  v9 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v12 = v27;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              if (+[ATXHomeScreenConfigurationDiffer _widget:hasSamePersonalityAsOtherWidget:](ATXHomeScreenConfigurationDiffer, "_widget:hasSamePersonalityAsOtherWidget:", v17, v11)&& ([v8 containsObject:v11] & 1) == 0&& (objc_msgSend(v9, "containsObject:", v17) & 1) == 0)
              {
                [v8 addObject:v11];
                [v9 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v14);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }

  [obj minusOrderedSet:v8];
  [v27 minusOrderedSet:v9];
  uint64_t v18 = [obj array];
  addedPinnedWidgets = v24->_addedPinnedWidgets;
  v24->_addedPinnedWidgets = (NSArray *)v18;

  uint64_t v20 = [v27 array];
  deletedPinnedWidgets = v24->_deletedPinnedWidgets;
  v24->_deletedPinnedWidgets = (NSArray *)v20;

  uint64_t v22 = [v8 array];
  configuredPinnedWidgets = v24->_configuredPinnedWidgets;
  v24->_configuredPinnedWidgets = (NSArray *)v22;
}

- (void)_calculateStackedWidgetChanges
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v4 = [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer userAddedStackedWidgets];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F1CA70]);
  id v7 = [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer userDeletedStackedWidgets];
  v8 = (void *)[v6 initWithArray:v7];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v9 = [(ATXHomeScreenConfigurationDiffer *)self addedStacks];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v54 + 1) + 8 * i) widgets];
        [v5 removeObjectsInArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v11);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v15 = [(ATXHomeScreenConfigurationDiffer *)self deletedStacks];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v50 + 1) + 8 * j) widgets];
        [v8 removeObjectsInArray:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v17);
  }
  v37 = self;

  v21 = objc_opt_new();
  uint64_t v22 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v47;
    v40 = v8;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v25 = v8;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v58 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v43;
          do
          {
            for (uint64_t m = 0; m != v27; ++m)
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * m);
              if (+[ATXHomeScreenConfigurationDiffer _widget:hasSamePersonalityAsOtherWidget:](ATXHomeScreenConfigurationDiffer, "_widget:hasSamePersonalityAsOtherWidget:", v30, v24)&& ([v21 containsObject:v24] & 1) == 0&& (objc_msgSend(v22, "containsObject:", v30) & 1) == 0)
              {
                [v21 addObject:v24];
                [v22 addObject:v30];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v58 count:16];
          }
          while (v27);
        }

        v8 = v40;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v41);
  }

  [obj minusOrderedSet:v21];
  [v8 minusOrderedSet:v22];
  uint64_t v31 = [obj array];
  widgetsAddedToStacksByUser = v37->_widgetsAddedToStacksByUser;
  v37->_widgetsAddedToStacksByUser = (NSArray *)v31;

  uint64_t v33 = [v8 array];
  widgetsDeletedFromStacksByUser = v37->_widgetsDeletedFromStacksByUser;
  v37->_widgetsDeletedFromStacksByUser = (NSArray *)v33;

  uint64_t v35 = [v21 array];
  configuredStackedWidgets = v37->_configuredStackedWidgets;
  v37->_configuredStackedWidgets = (NSArray *)v35;
}

- (NSArray)addedApps
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer addedApps];
}

- (NSArray)removedApps
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer removedApps];
}

- (NSArray)addedStacks
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer addedStacks];
}

- (NSArray)deletedStacks
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer deletedStacks];
}

- (NSArray)suggestedWidgetsAddedPermanentlyByUser
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer userAddedPreviousSuggestedWidgets];
}

- (NSArray)suggestedWidgetsRemoved
{
  return [(ATXHomeScreenConfigurationComponentsDiffer *)self->_componentsDiffer deletedPreviousSuggestedWidgets];
}

- (NSArray)configuredWidgets
{
  return [(NSArray *)self->_configuredPinnedWidgets arrayByAddingObjectsFromArray:self->_configuredStackedWidgets];
}

- (id)stackInPreviousConfigurationsForStackedWidget:(id)a3
{
  return [(ATXHomeScreenConfigurationComponents *)self->_previousComponents stackForStackedWidget:a3];
}

- (id)stackInCurrentConfigurationsForStackedWidget:(id)a3
{
  return [(ATXHomeScreenConfigurationComponents *)self->_currentComponents stackForStackedWidget:a3];
}

- (BOOL)currentConfigContainsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  return [(ATXHomeScreenConfigurationComponents *)self->_currentComponents containsWidgetWithBundleId:a3 kind:a4 size:a5];
}

+ (BOOL)_widget:(id)a3 hasSamePersonalityAsOtherWidget:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [ATXWidgetPersonality alloc];
  v8 = [v6 extensionBundleId];
  v9 = [v6 widgetKind];

  uint64_t v10 = [(ATXWidgetPersonality *)v7 initWithExtensionBundleId:v8 kind:v9];
  uint64_t v11 = [ATXWidgetPersonality alloc];
  uint64_t v12 = [v5 extensionBundleId];
  uint64_t v13 = [v5 widgetKind];

  uint64_t v14 = [(ATXWidgetPersonality *)v11 initWithExtensionBundleId:v12 kind:v13];
  LOBYTE(v11) = [(ATXWidgetPersonality *)v10 isEqual:v14];

  return (char)v11;
}

- (NSArray)addedPinnedWidgets
{
  return self->_addedPinnedWidgets;
}

- (NSArray)deletedPinnedWidgets
{
  return self->_deletedPinnedWidgets;
}

- (NSArray)widgetsAddedToStacksByUser
{
  return self->_widgetsAddedToStacksByUser;
}

- (NSArray)widgetsDeletedFromStacksByUser
{
  return self->_widgetsDeletedFromStacksByUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetsDeletedFromStacksByUser, 0);
  objc_storeStrong((id *)&self->_widgetsAddedToStacksByUser, 0);
  objc_storeStrong((id *)&self->_deletedPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_addedPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_configuredStackedWidgets, 0);
  objc_storeStrong((id *)&self->_configuredPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_componentsDiffer, 0);
  objc_storeStrong((id *)&self->_currentComponents, 0);

  objc_storeStrong((id *)&self->_previousComponents, 0);
}

@end