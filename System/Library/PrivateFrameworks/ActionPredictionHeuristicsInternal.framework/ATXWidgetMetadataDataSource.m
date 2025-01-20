@interface ATXWidgetMetadataDataSource
- (ATXWidgetMetadataDataSource)initWithDevice:(id)a3;
- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4;
@end

@implementation ATXWidgetMetadataDataSource

- (ATXWidgetMetadataDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetMetadataDataSource;
  v6 = [(ATXWidgetMetadataDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)MEMORY[0x1D25F43D0]();
  if (v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F4B078]);
    id v57 = 0;
    objc_super v9 = [v8 loadHomeScreenAndTodayPageConfigurationsWithError:&v57];
    id v10 = v57;
    v11 = v10;
    if (v9)
    {
      id v30 = v10;
      id v32 = v8;
      v33 = v7;
      v34 = v6;
      id v35 = v5;
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
      v44 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v31 = v9;
      id obj = v9;
      uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (!v38) {
        goto LABEL_39;
      }
      uint64_t v37 = *(void *)v54;
      while (1)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v13;
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * v13);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          objc_msgSend(v14, "stacks", v30);
          id v40 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v63 count:16];
          if (v42)
          {
            uint64_t v41 = *(void *)v50;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v50 != v41) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v43 = v15;
                v16 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                v17 = [v16 widgets];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v62 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v46;
                  do
                  {
                    for (uint64_t i = 0; i != v19; ++i)
                    {
                      if (*(void *)v46 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                      v23 = [v22 appBundleId];
                      if (v23)
                      {
                        v24 = [v22 widgetKind];
                        if (v24)
                        {
                          v25 = [v22 extensionBundleId];
                          if (v25)
                          {
                            if ([v12 containsObject:v23])
                            {
                              v58[0] = @"widgetBundleId";
                              v58[1] = @"widgetKind";
                              v59[0] = v25;
                              v59[1] = v24;
                              v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
                              v27 = [v44 objectForKeyedSubscript:v23];
                              if (!v27)
                              {
                                v27 = objc_opt_new();
                                [v44 setObject:v27 forKeyedSubscript:v23];
                              }
                              if (([v27 containsObject:v26] & 1) == 0) {
                                [v27 addObject:v26];
                              }

                              goto LABEL_31;
                            }
                          }
                          else
                          {
                            v26 = __atxlog_handle_heuristic();
                            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              v61 = v22;
                              _os_log_error_impl(&dword_1D0F43000, v26, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no widget bundle id for widget: %@", buf, 0xCu);
                            }
LABEL_31:
                          }
                        }
                        else
                        {
                          v25 = __atxlog_handle_heuristic();
                          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v61 = v22;
                            _os_log_error_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no widget kind for widget: %@", buf, 0xCu);
                          }
                        }
                      }
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v62 count:16];
                  }
                  while (v19);
                }

                uint64_t v15 = v43 + 1;
              }
              while (v43 + 1 != v42);
              uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v63 count:16];
            }
            while (v42);
          }

          uint64_t v13 = v39 + 1;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (!v38)
        {
LABEL_39:

          v6 = v34;
          ((void (**)(id, void *, void *))v34)[2](v34, v44, 0);

          id v5 = v35;
          id v8 = v32;
          v7 = v33;
          v11 = v30;
          objc_super v9 = v31;
          goto LABEL_46;
        }
      }
    }
    v29 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetMetadataDataSource fetchWidgetMetadataForAppBundleIds:callback:]((uint64_t)v11, v29);
    }

    v6[2](v6, 0, v11);
LABEL_46:
  }
  else
  {
    v28 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetMetadataDataSource fetchWidgetMetadataForAppBundleIds:callback:](v28);
    }

    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v6[2](v6, 0, v8);
  }
}

- (void).cxx_destruct
{
}

- (void)fetchWidgetMetadataForAppBundleIds:(os_log_t)log callback:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no bundle ids passed in", v1, 2u);
}

- (void)fetchWidgetMetadataForAppBundleIds:(uint64_t)a1 callback:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: could not fetch page configs with error: %@", (uint8_t *)&v2, 0xCu);
}

@end