@interface CPAnalyticsLogDestination
- (CPAnalyticsLogDestination)init;
- (CPAnalyticsLogDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSArray)logEventMatchers;
- (OS_os_log)log;
- (id)_descriptionComponentsForEvent:(id)a3 forProperties:(id)a4;
- (id)_logEventMatchersInConfiguration:(id)a3;
- (void)logEvent:(id)a3 withLabel:(id)a4 shouldLogEventName:(BOOL)a5 propertiesToLog:(id)a6 publicPropertiesToLog:(id)a7;
- (void)processEvent:(id)a3;
@end

@implementation CPAnalyticsLogDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logEventMatchers, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSArray)logEventMatchers
{
  return self->_logEventMatchers;
}

- (id)_descriptionComponentsForEvent:(id)a3 forProperties:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v5 propertyForKey:v13];
        if (v14)
        {
          id v15 = [NSString alloc];
          v16 = [v14 description];
          v17 = (void *)[v15 initWithFormat:@"%@: %@", v13, v16, (void)v19];
          [v7 addObject:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)logEvent:(id)a3 withLabel:(id)a4 shouldLogEventName:(BOOL)a5 propertiesToLog:(id)a6 publicPropertiesToLog:(id)a7
{
  BOOL v9 = a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v31 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v9)
  {
    id v16 = [NSString alloc];
    v17 = [v12 name];
    v18 = (void *)[v16 initWithFormat:@"eventName: %@", v17];
    [v15 addObject:v18];
  }
  long long v19 = [(CPAnalyticsLogDestination *)self _descriptionComponentsForEvent:v12 forProperties:v13];
  [v15 addObjectsFromArray:v19];

  if ([v15 count])
  {
    id v20 = [NSString alloc];
    long long v21 = [v15 componentsJoinedByString:@", "];
    long long v22 = (__CFString *)[v20 initWithFormat:@" { %@ }", v21];
  }
  else
  {
    long long v22 = &stru_26C5F0040;
  }
  v23 = [(CPAnalyticsLogDestination *)self _descriptionComponentsForEvent:v12 forProperties:v14];
  if ([v23 count])
  {
    id v24 = [NSString alloc];
    v25 = [v23 componentsJoinedByString:@", "];
    v26 = (__CFString *)[v24 initWithFormat:@" { %@ }", v25];
  }
  else
  {
    v26 = &stru_26C5F0040;
  }
  if (logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__onceToken != -1) {
    dispatch_once(&logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__onceToken, &__block_literal_global_523);
  }
  v27 = [(CPAnalyticsLogDestination *)self log];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = (void *)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter;
    v29 = [v12 timestamp];
    v30 = [v28 stringFromDate:v29];
    *(_DWORD *)buf = 138544130;
    id v33 = v31;
    __int16 v34 = 2112;
    v35 = v22;
    __int16 v36 = 2114;
    v37 = v26;
    __int16 v38 = 2114;
    v39 = v30;
    _os_log_impl(&dword_215355000, v27, OS_LOG_TYPE_INFO, "%{public}@:%@%{public}@, (@ %{public}@)", buf, 0x2Au);
  }
}

uint64_t __105__CPAnalyticsLogDestination_logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter;
  logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter = (uint64_t)v0;

  v2 = (void *)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSZ"];
}

- (id)_logEventMatchersInConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"logEvents"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = CPAnalyticsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v3;
      _os_log_error_impl(&dword_215355000, v6, OS_LOG_TYPE_ERROR, "Malformed logEvents in configuration %@", buf, 0xCu);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [CPAnalyticsLogEventMatcher alloc];
          id v13 = -[CPAnalyticsLogEventMatcher initWithConfig:](v12, "initWithConfig:", v11, (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (void)processEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CPAnalyticsLogDestination *)self logEventMatchers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 doesMatch:v4])
        {
          uint64_t v11 = [v10 eventTypeLabel];
          uint64_t v12 = [v10 shouldLogEventName];
          id v13 = [v10 eventPropertiesToLog];
          id v14 = [v10 eventPublicPropertiesToLog];
          [(CPAnalyticsLogDestination *)self logEvent:v4 withLabel:v11 shouldLogEventName:v12 propertiesToLog:v13 publicPropertiesToLog:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (CPAnalyticsLogDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAnalyticsLogDestination;
  uint64_t v6 = [(CPAnalyticsLogDestination *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(CPAnalyticsLogDestination *)v6 _logEventMatchersInConfiguration:v5];
    logEventMatchers = v7->_logEventMatchers;
    v7->_logEventMatchers = (NSArray *)v8;

    os_log_t v10 = os_log_create("com.apple.photos.CPAnalytics", "CPAnalyticsLogs");
    log = v7->_log;
    v7->_log = (OS_os_log *)v10;
  }
  return v7;
}

- (CPAnalyticsLogDestination)init
{
}

@end