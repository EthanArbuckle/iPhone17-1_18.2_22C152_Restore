@interface CPAnalyticsLogEventMatcher
- (BOOL)doesMatch:(id)a3;
- (BOOL)shouldLogEventName;
- (CPAnalyticsLogEventMatcher)init;
- (CPAnalyticsLogEventMatcher)initWithConfig:(id)a3;
- (NSArray)eventPropertiesToLog;
- (NSArray)eventPublicPropertiesToLog;
- (NSString)eventTypeLabel;
@end

@implementation CPAnalyticsLogEventMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublicPropertiesToLog, 0);
  objc_storeStrong((id *)&self->_eventPropertiesToLog, 0);
  objc_storeStrong((id *)&self->_eventTypeLabel, 0);
  objc_storeStrong((id *)&self->_eventMatcher, 0);
}

- (NSArray)eventPublicPropertiesToLog
{
  return self->_eventPublicPropertiesToLog;
}

- (NSArray)eventPropertiesToLog
{
  return self->_eventPropertiesToLog;
}

- (BOOL)shouldLogEventName
{
  return self->_shouldLogEventName;
}

- (NSString)eventTypeLabel
{
  return self->_eventTypeLabel;
}

- (BOOL)doesMatch:(id)a3
{
  return [(CPAnalyticsEventMatcher *)self->_eventMatcher doesMatch:a3];
}

- (CPAnalyticsLogEventMatcher)initWithConfig:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"label"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
  {
    v6 = [v4 objectForKeyedSubscript:@"shouldLogEventName"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = CPAnalyticsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v4;
        _os_log_error_impl(&dword_215355000, v7, OS_LOG_TYPE_ERROR, "Malformed shouldLogEventName in log event matcher configuration %@", buf, 0xCu);
      }
      v18 = 0;
    }
    else
    {
      v7 = [v4 objectForKeyedSubscript:@"eventPropertiesToLog"];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v13 = CPAnalyticsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v4;
          _os_log_error_impl(&dword_215355000, v13, OS_LOG_TYPE_ERROR, "Malformed eventPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
        }
        v18 = 0;
      }
      else
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v31 = v7;
        v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v39 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v27 = CPAnalyticsLog();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v45 = v4;
                  _os_log_error_impl(&dword_215355000, v27, OS_LOG_TYPE_ERROR, "Malformed eventPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
                }

                v18 = 0;
                v13 = v8;
                v7 = v31;
                goto LABEL_50;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        v13 = [v4 objectForKeyedSubscript:@"eventPublicPropertiesToLog"];
        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          obuint64_t j = CPAnalyticsLog();
          v7 = v31;
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v4;
            _os_log_error_impl(&dword_215355000, obj, OS_LOG_TYPE_ERROR, "Malformed eventPublicPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
          }
          v18 = 0;
        }
        else
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v30 = v13;
          obuint64_t j = v13;
          uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v35;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(obj);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v28 = CPAnalyticsLog();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v45 = v4;
                    _os_log_error_impl(&dword_215355000, v28, OS_LOG_TYPE_ERROR, "Malformed eventPublicPropertyToLog in log event matcher configuration %@", buf, 0xCu);
                  }

                  v18 = 0;
                  goto LABEL_44;
                }
              }
              uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          v18 = +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:v4];
          if (v18)
          {
            v33.receiver = self;
            v33.super_class = (Class)CPAnalyticsLogEventMatcher;
            v19 = [(CPAnalyticsLogEventMatcher *)&v33 init];
            v20 = v19;
            v7 = v31;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_eventMatcher, v18);
              uint64_t v21 = [v5 copy];
              eventTypeLabel = v20->_eventTypeLabel;
              v20->_eventTypeLabel = (NSString *)v21;

              v20->_shouldLogEventName = [v6 BOOLValue];
              uint64_t v23 = [v8 copy];
              eventPropertiesToLog = v20->_eventPropertiesToLog;
              v20->_eventPropertiesToLog = (NSArray *)v23;

              uint64_t v25 = [obj copy];
              eventPublicPropertiesToLog = v20->_eventPublicPropertiesToLog;
              v20->_eventPublicPropertiesToLog = (NSArray *)v25;
            }
            self = v20;
            obuint64_t j = &v18->super.super;
            v18 = self;
          }
          else
          {
            obuint64_t j = 0;
LABEL_44:
            v7 = v31;
          }
          v13 = v30;
        }
      }
LABEL_50:
    }
  }
  else
  {
    v6 = CPAnalyticsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v4;
      _os_log_error_impl(&dword_215355000, v6, OS_LOG_TYPE_ERROR, "Malformed label in log event matcher configuration %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (CPAnalyticsLogEventMatcher)init
{
}

@end