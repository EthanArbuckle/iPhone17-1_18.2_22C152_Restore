@interface ATXModeAppConfigurationMetricLogger
- (void)logMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXModeAppConfigurationMetricLogger

- (void)logMetricsWithXPCActivity:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v3 = [MEMORY[0x1E4F4AF78] sharedInstance];
  [v3 configuredModes];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v26 = long long v42 = 0u;
  id obj = [v26 allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    uint64_t v28 = *(void *)v40;
    v29 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v30 = v5;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D25F6CC0]();
        v10 = [v8 modeIdentifier];
        id v38 = 0;
        v11 = [v3 appConfigurationsForModeIdentifier:v10 error:&v38];
        id v12 = v38;

        v33 = v11;
        if (v12)
        {
          v13 = __atxlog_handle_metrics();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = v32 = v9;
          v16 = [v12 localizedDescription];
          [v8 semanticType];
          v17 = DNDModeSemanticTypeToString();
          *(_DWORD *)buf = 138412802;
          v45 = v15;
          __int16 v46 = 2112;
          v47 = v16;
          __int16 v48 = 2112;
          v49 = v17;
          _os_log_error_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_ERROR, "%@: Got error: %@, when getting AppConfigturation for %@", buf, 0x20u);

          uint64_t v5 = v30;
        }
        else
        {
          v32 = v9;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v13 = [v11 allKeys];
          uint64_t v18 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v13);
                }
                v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                v23 = objc_opt_new();
                v24 = [v22 bundleID];
                [v23 setBundleId:v24];

                [v8 semanticType];
                v25 = DNDModeSemanticTypeToString();
                [v23 setModeSemanticType:v25];

                [v23 logToCoreAnalytics];
              }
              uint64_t v19 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v19);
            uint64_t v6 = v28;
            v3 = v29;
            uint64_t v5 = v30;
          }
        }
        v9 = v32;
LABEL_18:

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v5);
  }
}

@end