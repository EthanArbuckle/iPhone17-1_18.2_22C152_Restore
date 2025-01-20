@interface CPAnalyticsIntervalDestination
- (CPAnalyticsIntervalDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSSet)ignoredIntervalNames;
- (NSSet)trackedIntervalNames;
- (id)_intervalNamesForKey:(id)a3 inConfiguration:(id)a4;
- (void)_handleEvent:(id)a3 withUnknownIntervalName:(id)a4;
- (void)processEvent:(id)a3;
- (void)sendDashboardIntervalEventForEvent:(id)a3;
- (void)setIgnoredIntervalNames:(id)a3;
- (void)setTrackedIntervalNames:(id)a3;
- (void)updateWithConfig:(id)a3;
@end

@implementation CPAnalyticsIntervalDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredIntervalNames, 0);
  objc_storeStrong((id *)&self->_trackedIntervalNames, 0);
}

- (void)setIgnoredIntervalNames:(id)a3
{
}

- (NSSet)ignoredIntervalNames
{
  return self->_ignoredIntervalNames;
}

- (void)setTrackedIntervalNames:(id)a3
{
}

- (NSSet)trackedIntervalNames
{
  return self->_trackedIntervalNames;
}

- (void)_handleEvent:(id)a3 withUnknownIntervalName:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = CPAnalyticsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_debug_impl(&dword_215355000, v8, OS_LOG_TYPE_DEBUG, "Unknown interval: %@. Add this interval to 'interval' destination in CP Analytics config.", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(CPAnalyticsDashboardDestination *)self cpAnalyticsInstance];
  v10 = (void *)[v7 copyRawPayload];

  [v9 sendEvent:@"com.apple.photos.CPAnalytics.unknownInterval" withPayload:v10];
}

- (id)_intervalNamesForKey:(id)a3 inConfiguration:(id)a4
{
  v4 = [a4 objectForKeyedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];

  return v5;
}

- (void)sendDashboardIntervalEventForEvent:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke;
  v9[3] = &unk_26423C2A8;
  id v5 = v4;
  id v10 = v5;
  id v6 = __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke((uint64_t)v9);
  if ([(CPAnalyticsDashboardDestination *)self isMediaEvent:v5])
  {
    id v7 = [(CPAnalyticsDashboardDestination *)self allMediaProperties];
    uint64_t v8 = [(CPAnalyticsDashboardDestination *)self buildCoreAnalyticsEventPayloadWithProperties:v7 fromSourceEvent:v5 intoTargetEventPayload:v6];

    id v6 = (void *)v8;
  }
  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.interval" fromSourceEvent:v5 payload:v6];
}

id __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  v3 = [*(id *)(a1 + 32) propertyForKey:@"cpa_interval_name"];
  [v2 setObject:v3 forKeyedSubscript:@"cpa_interval_name"];

  id v4 = [*(id *)(a1 + 32) propertyForKey:@"signpostDuration"];
  [v2 setObject:v4 forKeyedSubscript:@"signpostDuration"];

  return v2;
}

- (void)processEvent:(id)a3
{
  id v12 = a3;
  id v4 = [v12 name];
  int v5 = [v4 isEqualToString:@"com.apple.photos.CPAnalytics.interval"];

  id v6 = v12;
  if (v5)
  {
    id v7 = [v12 propertyForKey:@"cpa_interval_name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(CPAnalyticsIntervalDestination *)self trackedIntervalNames];
      int v9 = [v8 containsObject:v7];

      if (v9)
      {
        [(CPAnalyticsIntervalDestination *)self sendDashboardIntervalEventForEvent:v12];
      }
      else
      {
        id v10 = [(CPAnalyticsIntervalDestination *)self ignoredIntervalNames];
        int v11 = [v10 containsObject:v7];

        if ((v11 & 1) == 0) {
          [(CPAnalyticsIntervalDestination *)self _handleEvent:v12 withUnknownIntervalName:v7];
        }
      }
    }
    else
    {
      [(CPAnalyticsDashboardDestination *)self reportMalformedEvent:v12, @"unexpected class for payload property %@", @"cpa_interval_name" malformationDescriptionWithFormat];
    }

    id v6 = v12;
  }
}

- (void)updateWithConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CPAnalyticsIntervalDestination *)self _intervalNamesForKey:@"trackIntervals" inConfiguration:v4];
  id v6 = [(CPAnalyticsIntervalDestination *)self ignoredIntervalNames];
  int v7 = [v5 intersectsSet:v6];

  if (!v7)
  {
    uint64_t v8 = [(CPAnalyticsIntervalDestination *)self _intervalNamesForKey:@"ignoreIntervals" inConfiguration:v4];
    id v10 = [(CPAnalyticsIntervalDestination *)self trackedIntervalNames];
    int v11 = [v8 intersectsSet:v10];

    if (!v11)
    {
      id v12 = [(NSSet *)self->_trackedIntervalNames setByAddingObjectsFromSet:v5];
      trackedIntervalNames = self->_trackedIntervalNames;
      self->_trackedIntervalNames = v12;

      v14 = [(NSSet *)self->_ignoredIntervalNames setByAddingObjectsFromSet:v8];
      ignoredIntervalNames = self->_ignoredIntervalNames;
      self->_ignoredIntervalNames = v14;

      goto LABEL_9;
    }
    int v9 = CPAnalyticsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = [v8 allObjects];
      int v17 = 138412290;
      v18 = v16;
      _os_log_error_impl(&dword_215355000, v9, OS_LOG_TYPE_ERROR, "Ignored intervals names: %@ intersect with tracked interval names.", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t v8 = CPAnalyticsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = [v5 allObjects];
    int v17 = 138412290;
    v18 = v9;
    _os_log_error_impl(&dword_215355000, v8, OS_LOG_TYPE_ERROR, "Tracked intervals names: %@ intersect with ignored interval names.", (uint8_t *)&v17, 0xCu);
LABEL_7:
  }
LABEL_9:
}

- (CPAnalyticsIntervalDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsIntervalDestination;
  int v7 = [(CPAnalyticsDashboardDestination *)&v14 initWithConfig:v6 cpAnalyticsInstance:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(CPAnalyticsIntervalDestination *)v7 _intervalNamesForKey:@"trackIntervals" inConfiguration:v6];
    trackedIntervalNames = v8->_trackedIntervalNames;
    v8->_trackedIntervalNames = (NSSet *)v9;

    uint64_t v11 = [(CPAnalyticsIntervalDestination *)v8 _intervalNamesForKey:@"ignoreIntervals" inConfiguration:v6];
    ignoredIntervalNames = v8->_ignoredIntervalNames;
    v8->_ignoredIntervalNames = (NSSet *)v11;
  }
  return v8;
}

@end