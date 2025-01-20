@interface ATXNotificationAdjacentSuggestionMetricsLogger
- (ATXNotificationAdjacentSuggestionMetricsLogger)init;
- (ATXNotificationAdjacentSuggestionMetricsLogger)initWithDatastore:(id)a3;
- (void)logNotificationAdjacentSuggestionMetrics;
- (void)logNotificationAdjacentSuggestionMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXNotificationAdjacentSuggestionMetricsLogger

- (ATXNotificationAdjacentSuggestionMetricsLogger)init
{
  v3 = objc_opt_new();
  v4 = [(ATXNotificationAdjacentSuggestionMetricsLogger *)self initWithDatastore:v3];

  return v4;
}

- (ATXNotificationAdjacentSuggestionMetricsLogger)initWithDatastore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationAdjacentSuggestionMetricsLogger;
  v6 = [(ATXNotificationAdjacentSuggestionMetricsLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_datastore, a3);
  }

  return v7;
}

- (void)logNotificationAdjacentSuggestionMetricsWithXPCActivity:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "%@ - Updating the database", buf, 0xCu);
  }
  [(ATXNotificationAndSuggestionDatastore *)self->_datastore updateDatabase];
  if ([v4 didDefer])
  {
    v8 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412290;
      v50 = v10;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v8 = [v11 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    [v8 doubleForKey:@"suggestionsMetricsTimestamp"];
    double v13 = v12;
    v14 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412546;
      v50 = v16;
      __int16 v51 = 2048;
      double v52 = v13;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "%@ - Fetching metrics objects with previous timestamp %f", buf, 0x16u);
    }
    v17 = [(ATXNotificationAndSuggestionDatastore *)self->_datastore metricsForSuggestionsSinceCompletionTimestamp:v13];
    int v18 = [v4 didDefer];
    v19 = __atxlog_handle_metrics();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138412290;
        v50 = v22;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);
      }
    }
    else
    {
      if (v20)
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138412290;
        v50 = v24;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "%@ - logging fetched metrics", buf, 0xCu);
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v44 = v17;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0;
        uint64_t v29 = *(void *)v46;
        while (2)
        {
          uint64_t v30 = 0;
          uint64_t v43 = v28 + v27;
          do
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v45 + 1) + 8 * v30);
            v32 = (void *)MEMORY[0x1D25F6CC0]();
            [v31 suggestionCompletionTimestamp];
            if (v33 > v13)
            {
              [v31 suggestionCompletionTimestamp];
              double v13 = v34;
            }
            objc_msgSend(v31, "logToCoreAnalytics", v43);
            if ([v4 didDefer])
            {
              v36 = __atxlog_handle_metrics();
              uint64_t v35 = v28 + v30 + 1;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                v37 = (objc_class *)objc_opt_class();
                v38 = NSStringFromClass(v37);
                *(_DWORD *)buf = 138412290;
                v50 = v38;
                _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);
              }
              goto LABEL_29;
            }
            ++v30;
          }
          while (v27 != v30);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
          uint64_t v35 = v43;
          uint64_t v28 = v43;
          if (v27) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v35 = 0;
      }
LABEL_29:

      v39 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v40);
        uint64_t v42 = [v25 count];
        *(_DWORD *)buf = 138413058;
        v50 = v41;
        __int16 v51 = 2048;
        double v52 = *(double *)&v35;
        __int16 v53 = 2048;
        uint64_t v54 = v42;
        __int16 v55 = 2048;
        double v56 = v13;
        _os_log_impl(&dword_1D0FA3000, v39, OS_LOG_TYPE_INFO, "%@ - Logged %ld out of %ld metrics.  New metric timestamp is %f.", buf, 0x2Au);
      }
      [v8 setDouble:@"suggestionsMetricsTimestamp" forKey:v13];
      v17 = v44;
    }
  }
}

- (void)logNotificationAdjacentSuggestionMetrics
{
}

- (void).cxx_destruct
{
}

@end