@interface CPAnalyticsMetricsDestination
- (CPAnalyticsMetricsDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSMapTable)eventRoutes;
- (id)_buildCustomCoreAnalyticsPayloadForEvent:(id)a3 withEventRoute:(id)a4;
- (id)_eventRoutesFromConfig:(id)a3;
- (void)processEvent:(id)a3;
- (void)sendCoreAnalyticsEventWithCustomConfig:(id)a3 eventRoute:(id)a4;
- (void)updateWithConfig:(id)a3;
@end

@implementation CPAnalyticsMetricsDestination

- (void).cxx_destruct
{
}

- (NSMapTable)eventRoutes
{
  return self->_eventRoutes;
}

- (id)_eventRoutesFromConfig:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKey:@"events"];
  if (v3)
  {
    [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v16 = v3;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "objectForKey:", @"sourceEventMatchCriteria", v16);
          v11 = +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:v10];
          v12 = [[CPAnalyticsMetricEventRoute alloc] initWithConfig:v9];
          v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v17 setObject:v12 forKey:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    v3 = v16;
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x263F08968]);
  }

  return v17;
}

- (id)_buildCustomCoreAnalyticsPayloadForEvent:(id)a3 withEventRoute:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v6 propertiesToInclude];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v14 = [v5 propertyForKey:v13];
        if (v14) {
          [v7 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  if ([v6 includeEventProperties])
  {
    v15 = (void *)[v5 copyRawPayload];
    [v7 addEntriesFromDictionary:v15];
  }
  return v7;
}

- (void)sendCoreAnalyticsEventWithCustomConfig:(id)a3 eventRoute:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 destinationEventKey];
  if ([v7 length]) {
    [v6 destinationEventKey];
  }
  else {
  v8 = [v10 name];
  }

  uint64_t v9 = [(CPAnalyticsMetricsDestination *)self _buildCustomCoreAnalyticsPayloadForEvent:v10 withEventRoute:v6];
  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:withPayload:shouldSanitize:](CPAnalyticsCoreAnalyticsHelper, "sendCoreAnalyticsEvent:withPayload:shouldSanitize:", v8, v9, [v6 includeEventProperties]);
}

- (void)updateWithConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [(CPAnalyticsMetricsDestination *)self _eventRoutesFromConfig:a3];
  if ([v4 count])
  {
    id v5 = [(CPAnalyticsMetricsDestination *)self eventRoutes];
    id v6 = (NSMapTable *)[v5 copy];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = objc_msgSend(v4, "keyEnumerator", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = [v4 objectForKey:v12];
          [(NSMapTable *)v6 setObject:v13 forKey:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    eventRoutes = self->_eventRoutes;
    self->_eventRoutes = v6;
  }
}

- (void)processEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CPAnalyticsMetricsDestination *)self eventRoutes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v5, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 doesMatch:v4])
        {
          uint64_t v12 = [v5 objectForKey:v11];
          [(CPAnalyticsMetricsDestination *)self sendCoreAnalyticsEventWithCustomConfig:v4 eventRoute:v12];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v6 = [v4 name];
  uint64_t v12 = (void *)[v4 copyRawPayload];
  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:v6 withPayload:v12 shouldSanitize:1];
LABEL_11:
}

- (CPAnalyticsMetricsDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPAnalyticsMetricsDestination;
  id v6 = [(CPAnalyticsMetricsDestination *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(CPAnalyticsMetricsDestination *)v6 _eventRoutesFromConfig:v5];
    uint64_t v9 = [v8 copy];
    eventRoutes = v7->_eventRoutes;
    v7->_eventRoutes = (NSMapTable *)v9;
  }
  return v7;
}

@end