@interface ATXSuggestedPagesHomeScreenWidgetDataSource
- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesHomeScreenWidgetDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  v6 = [v5 loadHomeScreenPageConfigurationsIncludingHidden:0 error:0];
  if ([v6 count])
  {
    id v34 = v5;
    id v43 = (id)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v33 = v6;
    id obj = v6;
    uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v54;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v54 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v7;
          v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          objc_msgSend(v8, "stacks", v33);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v41 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v41)
          {
            uint64_t v40 = *(void *)v50;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v50 != v40) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v42 = v9;
                v10 = *(void **)(*((void *)&v49 + 1) + 8 * v9);
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                id v44 = [v10 widgets];
                uint64_t v11 = [v44 countByEnumeratingWithState:&v45 objects:v57 count:16];
                if (v11)
                {
                  uint64_t v12 = v11;
                  uint64_t v13 = *(void *)v46;
                  do
                  {
                    for (uint64_t i = 0; i != v12; ++i)
                    {
                      if (*(void *)v46 != v13) {
                        objc_enumerationMutation(v44);
                      }
                      v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                      v16 = [v15 appBundleId];
                      uint64_t v17 = [v16 length];

                      if (v17)
                      {
                        v18 = [v15 appBundleId];
                        v19 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:v18];
                        v20 = [v4 suggestedApps];
                        int v21 = [v20 containsObject:v19];

                        if (v21)
                        {
                          v22 = [v4 appLaunchCounts];
                          v23 = [v22 objectForKeyedSubscript:v18];
                          id v24 = v4;
                          unint64_t v25 = [v23 rawLaunchCount];

                          BOOL v26 = v25 >= 0xA;
                          id v4 = v24;
                          if (v26)
                          {
                            id v27 = objc_alloc_init(MEMORY[0x1E4F4B0D0]);
                            v28 = [v15 intent];
                            [v27 setIntent:v28];

                            objc_msgSend(v27, "setSize:", objc_msgSend(v15, "size"));
                            v29 = [v15 widgetKind];
                            [v27 setWidgetKind:v29];

                            v30 = [v15 extensionBundleId];
                            [v27 setExtensionBundleId:v30];

                            id v4 = v24;
                            v31 = [v15 appBundleId];
                            [v27 setAppBundleId:v31];

                            [v27 setScore:0.25];
                            [v27 setPredictionSource:@"Home Screen"];
                            [v43 addObject:v27];
                          }
                        }
                      }
                    }
                    uint64_t v12 = [v44 countByEnumeratingWithState:&v45 objects:v57 count:16];
                  }
                  while (v12);
                }

                uint64_t v9 = v42 + 1;
              }
              while (v42 + 1 != v41);
              uint64_t v41 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }
            while (v41);
          }

          uint64_t v7 = v38 + 1;
        }
        while (v38 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v37);
    }

    v6 = v33;
    id v5 = v34;
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

@end