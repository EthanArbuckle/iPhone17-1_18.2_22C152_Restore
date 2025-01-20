@interface CPAnalyticsSignpostDestination
- (CPAnalytics)cpAnalyticsInstance;
- (CPAnalyticsSignpostDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSMutableIndexSet)startedSignpostIDs;
- (void)_checkSignpostsEndForEvent:(id)a3;
- (void)_sendCPAnalyticsEvent:(id)a3 withPayload:(id)a4 withDuration:(double)a5;
- (void)_trackSignpostsStartForEvent:(id)a3;
- (void)processEvent:(id)a3;
- (void)setCpAnalyticsInstance:(id)a3;
@end

@implementation CPAnalyticsSignpostDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedSignpostIDs, 0);
  objc_destroyWeak((id *)&self->_cpAnalyticsInstance);
}

- (NSMutableIndexSet)startedSignpostIDs
{
  return self->_startedSignpostIDs;
}

- (void)setCpAnalyticsInstance:(id)a3
{
}

- (CPAnalytics)cpAnalyticsInstance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
  return (CPAnalytics *)WeakRetained;
}

- (void)_sendCPAnalyticsEvent:(id)a3 withPayload:(id)a4 withDuration:(double)a5
{
  v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a3;
  id v12 = [v8 dictionaryWithDictionary:a4];
  [v12 removeObjectForKey:@"signpostID"];
  [v12 removeObjectForKey:@"signpostEventName"];
  v10 = [NSNumber numberWithDouble:a5];
  [v12 setObject:v10 forKey:@"signpostDuration"];

  v11 = [(CPAnalyticsSignpostDestination *)self cpAnalyticsInstance];
  [v11 sendEvent:v9 withPayload:v12];
}

- (void)_checkSignpostsEndForEvent:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"com.photos.CPAnalytics.signpost.end"];

  if (v6)
  {
    v7 = [v4 propertyForKey:@"signpostID"];
    v8 = [v4 propertyForKey:@"signpostEventName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v7 CPAnalyticsSignpostIDValue];
        v10 = [(CPAnalyticsSignpostDestination *)self startedSignpostIDs];
        if ([v10 containsIndex:v9])
        {
          [v10 removeIndex:v9];
          v11 = +[CPAnalytics creationDateForSignpost:v9];
          if (v11)
          {
            id v12 = [v4 timestamp];
            [v12 timeIntervalSinceDate:v11];
            double v14 = v13;

            v15 = [v4 propertyForKey:@"cpa_interval_startDate"];
            v16 = [v4 propertyForKey:@"cpa_interval_endDate"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v16 timeIntervalSinceDate:v15];
                double v14 = v17;
              }
            }
            if (v14 < 0.0)
            {
              v18 = [v4 timestamp];
              [v18 timeIntervalSinceReferenceDate];
              double v20 = v19;

              if (v20 >= 0.0) {
                double v14 = -v14;
              }
              else {
                double v14 = -(v14 - v20 * 2.0);
              }
            }
            if (v14 < 0.0)
            {
              v21 = CPAnalyticsLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v23 = [NSNumber numberWithDouble:v14];
                int v24 = 138412546;
                v25 = v23;
                __int16 v26 = 2112;
                v27 = v11;
                _os_log_error_impl(&dword_215355000, v21, OS_LOG_TYPE_ERROR, "signpost duration should not be negative. Duration: %@, start date: %@", (uint8_t *)&v24, 0x16u);
              }
              double v14 = 0.0;
            }
            v22 = (void *)[v4 copyRawPayload];
            [(CPAnalyticsSignpostDestination *)self _sendCPAnalyticsEvent:v8 withPayload:v22 withDuration:v14];
          }
        }
      }
    }
  }
}

- (void)_trackSignpostsStartForEvent:(id)a3
{
  id v10 = a3;
  id v4 = [v10 name];
  int v5 = [v4 isEqualToString:@"com.photos.CPAnalytics.signpost.start"];

  int v6 = v10;
  if (v5)
  {
    v7 = [v10 propertyForKey:@"signpostID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 CPAnalyticsSignpostIDValue];
      uint64_t v9 = [(CPAnalyticsSignpostDestination *)self startedSignpostIDs];
      [v9 addIndex:v8];
    }
    int v6 = v10;
  }
}

- (void)processEvent:(id)a3
{
  id v4 = a3;
  [(CPAnalyticsSignpostDestination *)self _trackSignpostsStartForEvent:v4];
  [(CPAnalyticsSignpostDestination *)self _checkSignpostsEndForEvent:v4];
}

- (CPAnalyticsSignpostDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPAnalyticsSignpostDestination;
  int v6 = [(CPAnalyticsSignpostDestination *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(CPAnalyticsSignpostDestination *)v6 setCpAnalyticsInstance:v5];
    uint64_t v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    startedSignpostIDs = v7->_startedSignpostIDs;
    v7->_startedSignpostIDs = v8;
  }
  return v7;
}

@end