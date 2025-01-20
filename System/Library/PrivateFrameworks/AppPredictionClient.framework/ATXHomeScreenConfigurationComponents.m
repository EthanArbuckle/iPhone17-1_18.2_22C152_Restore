@interface ATXHomeScreenConfigurationComponents
- (ATXHomeScreenConfigurationComponents)initWithConfigurations:(id)a3;
- (BOOL)containsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5;
- (NSArray)apps;
- (NSArray)pinnedWidgets;
- (NSArray)stackedWidgets;
- (NSArray)stacks;
- (id)stackForStackedWidget:(id)a3;
@end

@implementation ATXHomeScreenConfigurationComponents

- (ATXHomeScreenConfigurationComponents)initWithConfigurations:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)ATXHomeScreenConfigurationComponents;
  v5 = [(ATXHomeScreenConfigurationComponents *)&v80 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    stackForStackedWidgetIdDictionary = v5->_stackForStackedWidgetIdDictionary;
    v5->_stackForStackedWidgetIdDictionary = (NSMutableDictionary *)v6;

    v52 = objc_opt_new();
    v8 = objc_opt_new();
    v9 = objc_opt_new();
    v57 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v49 = v4;
    obuint64_t j = v4;
    uint64_t v53 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v53)
    {
      uint64_t v51 = *(void *)v77;
      v56 = v8;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v77 != v51) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v76 + 1) + 8 * v10);
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          uint64_t v54 = v10;
          v55 = v11;
          v12 = objc_msgSend(v11, "stacks", v49);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v85 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v73;
            uint64_t v58 = *(void *)v73;
            v59 = v12;
            do
            {
              uint64_t v16 = 0;
              uint64_t v60 = v14;
              do
              {
                if (*(void *)v73 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v72 + 1) + 8 * v16);
                v18 = [v17 widgets];
                uint64_t v19 = [v18 count];

                v20 = [v17 widgets];
                v21 = v20;
                if (v19 == 1)
                {
                  v22 = [v20 firstObject];

                  [v8 addObject:v22];
                }
                else
                {
                  unint64_t v23 = [v20 count];

                  if (v23 >= 2)
                  {
                    uint64_t v61 = v16;
                    long long v70 = 0u;
                    long long v71 = 0u;
                    long long v68 = 0u;
                    long long v69 = 0u;
                    v24 = [v17 widgets];
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v84 count:16];
                    if (v25)
                    {
                      uint64_t v26 = v25;
                      uint64_t v27 = *(void *)v69;
                      do
                      {
                        for (uint64_t i = 0; i != v26; ++i)
                        {
                          if (*(void *)v69 != v27) {
                            objc_enumerationMutation(v24);
                          }
                          v29 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                          [v9 addObject:v29];
                          v30 = [v29 widgetUniqueId];

                          if (v30)
                          {
                            v31 = v5->_stackForStackedWidgetIdDictionary;
                            v32 = [v29 widgetUniqueId];
                            [(NSMutableDictionary *)v31 setObject:v17 forKeyedSubscript:v32];
                          }
                          else
                          {
                            v32 = __atxlog_handle_home_screen();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v83 = v29;
                              _os_log_fault_impl(&dword_1A790D000, v32, OS_LOG_TYPE_FAULT, "ATXHomeScreenConfigurationComponents: stacked widget has no widgetUniqueId: %@", buf, 0xCu);
                            }
                          }
                        }
                        uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v84 count:16];
                      }
                      while (v26);
                    }

                    [v57 addObject:v17];
                    v8 = v56;
                    uint64_t v15 = v58;
                    v12 = v59;
                    uint64_t v14 = v60;
                    uint64_t v16 = v61;
                  }
                }
                ++v16;
              }
              while (v16 != v14);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v85 count:16];
            }
            while (v14);
          }

          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v33 = [v55 panels];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v65 != v36) {
                  objc_enumerationMutation(v33);
                }
                v38 = [*(id *)(*((void *)&v64 + 1) + 8 * j) widgets];
                v39 = [v38 firstObject];

                [v8 addObject:v39];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v35);
          }

          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __63__ATXHomeScreenConfigurationComponents_initWithConfigurations___block_invoke;
          v62[3] = &unk_1E5D08140;
          v62[4] = v55;
          id v63 = v52;
          [v55 enumerateApps:v62];

          uint64_t v10 = v54 + 1;
        }
        while (v54 + 1 != v53);
        uint64_t v53 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v53);
    }

    uint64_t v40 = [v9 copy];
    stackedWidgets = v5->_stackedWidgets;
    v5->_stackedWidgets = (NSArray *)v40;

    uint64_t v42 = [v8 copy];
    pinnedWidgets = v5->_pinnedWidgets;
    v5->_pinnedWidgets = (NSArray *)v42;

    uint64_t v44 = [v57 copy];
    stacks = v5->_stacks;
    v5->_stacks = (NSArray *)v44;

    uint64_t v46 = [v52 copy];
    apps = v5->_apps;
    v5->_apps = (NSArray *)v46;

    id v4 = v49;
  }

  return v5;
}

void __63__ATXHomeScreenConfigurationComponents_initWithConfigurations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPage:v3];
  [*(id *)(a1 + 40) addObject:v4];
}

- (id)stackForStackedWidget:(id)a3
{
  id v4 = a3;
  v5 = [v4 widgetUniqueId];

  if (v5)
  {
    stackForStackedWidgetIdDictionary = self->_stackForStackedWidgetIdDictionary;
    v7 = [v4 widgetUniqueId];
    v8 = [(NSMutableDictionary *)stackForStackedWidgetIdDictionary objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(NSArray *)self->_pinnedWidgets arrayByAddingObjectsFromArray:self->_stackedWidgets];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend(v15, "extensionBundleId", (void)v21);
      if (![v16 isEqualToString:v8]) {
        goto LABEL_11;
      }
      v17 = [v15 widgetKind];
      if (([v17 isEqualToString:v9] & 1) == 0)
      {

LABEL_11:
        continue;
      }
      uint64_t v18 = [v15 size];

      if (v18 == a5)
      {
        BOOL v19 = 1;
        goto LABEL_15;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v12);
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (NSArray)apps
{
  return self->_apps;
}

- (NSArray)pinnedWidgets
{
  return self->_pinnedWidgets;
}

- (NSArray)stackedWidgets
{
  return self->_stackedWidgets;
}

- (NSArray)stacks
{
  return self->_stacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_stackedWidgets, 0);
  objc_storeStrong((id *)&self->_pinnedWidgets, 0);
  objc_storeStrong((id *)&self->_apps, 0);

  objc_storeStrong((id *)&self->_stackForStackedWidgetIdDictionary, 0);
}

@end