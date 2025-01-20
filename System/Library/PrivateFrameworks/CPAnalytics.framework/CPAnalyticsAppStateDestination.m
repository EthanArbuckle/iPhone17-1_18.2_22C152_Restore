@interface CPAnalyticsAppStateDestination
+ (BOOL)isValidSessionEndEvent:(id)a3;
- (BOOL)shouldSendSampleWithRate:(unint64_t)a3;
- (CPAnalyticsAppStateDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (CPAnalyticsScreenManager)screenManager;
- (NSArray)featureCounters;
- (NSArray)sessionCounters;
- (NSSet)appEventNames;
- (id)_computeSessionData:(id)a3;
- (id)_createCountersFromAppEvents:(id)a3;
- (id)_createCountersFromConfig:(id)a3 withKey:(id)a4;
- (id)_createCountersFromScreenNames:(id)a3;
- (id)_validateAndParseAppEvents:(id)a3;
- (id)allStandardProperties;
- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (void)_resetCounters;
- (void)_sendAppSessionEventFromSourceEvent:(id)a3 payload:(id)a4;
- (void)_sendDashboardErrorEventIfNeededForEvent:(id)a3;
- (void)_sendDashboardMediaEventIfNeededForEvent:(id)a3;
- (void)_sendFeatureCounts;
- (void)_updateDependenciesBeforeProcessingEvent:(id)a3;
- (void)processEvent:(id)a3;
- (void)registerSystemProperties:(id)a3;
- (void)sendDashboardAppEventForEvent:(id)a3;
- (void)sendDashboardErrorEventForEvent:(id)a3;
- (void)sendDashboardMediaEventForEvent:(id)a3;
- (void)sendDashboardScreenViewEventForEvent:(id)a3;
- (void)setAppEventNames:(id)a3;
- (void)setFeatureCounters:(id)a3;
- (void)setSessionCounters:(id)a3;
- (void)updateWithConfig:(id)a3;
@end

@implementation CPAnalyticsAppStateDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenManager, 0);
  objc_storeStrong((id *)&self->_appEventNames, 0);
  objc_storeStrong((id *)&self->_sessionCounters, 0);
  objc_storeStrong((id *)&self->_featureCounters, 0);
}

- (CPAnalyticsScreenManager)screenManager
{
  return self->_screenManager;
}

- (void)setAppEventNames:(id)a3
{
}

- (NSSet)appEventNames
{
  return self->_appEventNames;
}

- (void)setSessionCounters:(id)a3
{
}

- (NSArray)sessionCounters
{
  return self->_sessionCounters;
}

- (void)setFeatureCounters:(id)a3
{
}

- (NSArray)featureCounters
{
  return self->_featureCounters;
}

- (void)registerSystemProperties:(id)a3
{
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7 = a4;
  if ([a3 isEqualToString:@"cpa_isAppEvent"])
  {
    v8 = NSNumber;
    v9 = [(CPAnalyticsAppStateDestination *)self appEventNames];
    v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "containsObject:", v7));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)allStandardProperties
{
  v7[4] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsAppStateDestination;
  v2 = [(CPAnalyticsDashboardDestination *)&v6 allStandardProperties];
  v7[0] = @"cpa_common_appSection";
  v7[1] = @"cpa_common_currentScreen";
  v7[2] = @"cpa_common_priorScreen";
  v7[3] = @"cpa_common_numScreensViewed";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (void)sendDashboardErrorEventForEvent:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11 = @"cpa_event_name";
  v5 = [v4 name];
  v12[0] = v5;
  objc_super v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v7 = [(CPAnalyticsDashboardDestination *)self allErrorProperties];
  if ([(CPAnalyticsDashboardDestination *)self isMediaEvent:v4])
  {
    v8 = [(CPAnalyticsDashboardDestination *)self allMediaProperties];
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

    id v7 = (void *)v9;
  }
  v10 = [(CPAnalyticsDashboardDestination *)self buildCoreAnalyticsEventPayloadWithProperties:v7 fromSourceEvent:v4 intoTargetEventPayload:v6];
  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.errorEvent" fromSourceEvent:v4 payload:v10];
}

- (void)_sendDashboardErrorEventIfNeededForEvent:(id)a3
{
  id v5 = a3;
  id v4 = [v5 propertyForKey:@"cpa_error"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CPAnalyticsAppStateDestination *)self sendDashboardErrorEventForEvent:v5];
    }
    else {
      [(CPAnalyticsDashboardDestination *)self reportMalformedEvent:v5, @"unexpected class for payload property %@", @"cpa_error" malformationDescriptionWithFormat];
    }
  }
}

- (void)sendDashboardMediaEventForEvent:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = @"cpa_event_name";
  id v5 = [v4 name];
  v10[0] = v5;
  objc_super v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(CPAnalyticsDashboardDestination *)self allMediaProperties];
  v8 = [(CPAnalyticsDashboardDestination *)self buildCoreAnalyticsEventPayloadWithProperties:v7 fromSourceEvent:v4 intoTargetEventPayload:v6];

  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.mediaEvent" fromSourceEvent:v4 payload:v8];
  if ([(CPAnalyticsAppStateDestination *)self shouldSendSampleWithRate:30]) {
    [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.mediaEvent.v2" fromSourceEvent:v4 payload:v8];
  }
}

- (void)_sendDashboardMediaEventIfNeededForEvent:(id)a3
{
  id v4 = a3;
  if (-[CPAnalyticsDashboardDestination isMediaEvent:](self, "isMediaEvent:")) {
    [(CPAnalyticsAppStateDestination *)self sendDashboardMediaEventForEvent:v4];
  }
}

- (void)sendDashboardAppEventForEvent:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = @"cpa_event_name";
  id v5 = [v4 name];
  v8[0] = v5;
  objc_super v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.event" fromSourceEvent:v4 payload:v6];
  if ([(CPAnalyticsAppStateDestination *)self shouldSendSampleWithRate:30]) {
    [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.event.v2" fromSourceEvent:v4 payload:v6];
  }
}

- (void)sendDashboardScreenViewEventForEvent:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[v5 copyRawPayload];
  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.screenView" fromSourceEvent:v5 payload:v4];
  if ([(CPAnalyticsAppStateDestination *)self shouldSendSampleWithRate:30]) {
    [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.screenView.v2" fromSourceEvent:v5 payload:v4];
  }
}

- (BOOL)shouldSendSampleWithRate:(unint64_t)a3
{
  return arc4random_uniform(a3) == 1;
}

- (void)_sendFeatureCounts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(CPAnalyticsAppStateDestination *)self featureCounters];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v6 = [(CPAnalyticsAppStateDestination *)self featureCounters];
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
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
          v13 = [v11 name];
          [v5 setObject:v12 forKey:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v14 = [(CPAnalyticsDashboardDestination *)self cpAnalyticsInstance];
    [v14 sendEvent:@"com.apple.photos.CPAnalytics.featureUsageCounts" withPayload:v5];
  }
}

- (void)_sendAppSessionEventFromSourceEvent:(id)a3 payload:(id)a4
{
  id v6 = a4;
  [(CPAnalyticsDashboardDestination *)self sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:@"com.apple.photos.cpa.session" fromSourceEvent:a3 payload:v6];
  id v7 = [(CPAnalyticsDashboardDestination *)self cpAnalyticsInstance];
  [v7 sendEvent:@"com.apple.photos.CPAnalytics.appSession" withPayload:v6];
}

- (id)_computeSessionData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [(CPAnalyticsAppStateDestination *)self screenManager];
  id v7 = [v6 currentScreenViewName];
  [v5 setObject:v7 forKey:@"cpa_session_exitScreen"];

  uint64_t v8 = NSNumber;
  uint64_t v9 = [(CPAnalyticsAppStateDestination *)self screenManager];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "screensViewCount"));
  [v5 setObject:v10 forKey:@"cpa_session_screenViewCount"];

  v11 = NSNumber;
  [v4 doubleValue];
  v13 = [v11 numberWithDouble:round(v12 * 100.0) / 100.0];
  [v5 setObject:v13 forKey:@"cpa_session_timeInApp"];

  v14 = [MEMORY[0x263F08C38] UUID];
  long long v15 = [v14 UUIDString];

  [v5 setObject:v15 forKey:@"cpa_session_id"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v16 = [(CPAnalyticsAppStateDestination *)self sessionCounters];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
        v23 = [v21 name];
        [v5 setObject:v22 forKey:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  return v5;
}

- (void)_updateDependenciesBeforeProcessingEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(CPAnalyticsAppStateDestination *)self screenManager];
  [v5 processEvent:v4];
}

- (id)_validateAndParseAppEvents:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKey:@"appEvents"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", @"com.apple.", (void)v12)) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_resetCounters
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(CPAnalyticsAppStateDestination *)self sessionCounters];
  id v4 = (void *)[v3 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) resetCount];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = [(CPAnalyticsAppStateDestination *)self featureCounters];
  v11 = (void *)[v10 copy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "resetCount", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)_createCountersFromScreenNames:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = @"<!--";
    do
    {
      uint64_t v9 = 0;
      uint64_t v20 = v6;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        if (([v10 hasPrefix:v8] & 1) == 0)
        {
          v11 = [NSString stringWithFormat:@"%@%@", @"screen_", v10];
          long long v28 = @"cpa_common_currentScreen";
          v29 = v10;
          id v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v13 = +[CPAnalyticsEventMatcher eventMatcherWithEventName:@"com.apple.photos.CPAnalytics.screenView" properties:v12];
          uint64_t v14 = [[CPAnalyticsEventCounter alloc] initWithName:v11 matcher:v13];
          if (v14)
          {
            [v21 addObject:v14];
          }
          else
          {
            uint64_t v15 = v7;
            uint64_t v16 = v8;
            id v17 = v4;
            long long v18 = CPAnalyticsLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v10;
              _os_log_error_impl(&dword_215355000, v18, OS_LOG_TYPE_ERROR, "Could not create screen counter from screen name: %@", buf, 0xCu);
            }

            id v4 = v17;
            uint64_t v8 = v16;
            uint64_t v7 = v15;
            uint64_t v6 = v20;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  return v21;
}

- (id)_createCountersFromAppEvents:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        v11 = [[CPAnalyticsEventCounter alloc] initWithEventName:v10];
        if (v11)
        {
          [v4 addObject:v11];
        }
        else
        {
          id v12 = CPAnalyticsLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v10;
            _os_log_error_impl(&dword_215355000, v12, OS_LOG_TYPE_ERROR, "Could not create AppEvent counter from event name: %@", buf, 0xCu);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_createCountersFromConfig:(id)a3 withKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = (void *)MEMORY[0x263EFFA68];
  }
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
        id v12 = [CPAnalyticsEventCounter alloc];
        uint64_t v13 = -[CPAnalyticsEventCounter initWithConfig:](v12, "initWithConfig:", v11, (void)v15);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)processEvent:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CPAnalyticsAppStateDestination *)self _updateDependenciesBeforeProcessingEvent:v4];
  id v5 = [v4 name];
  int v6 = [@"com.apple.photos.CPAnalytics.screenView" isEqualToString:v5];

  if (v6) {
    [(CPAnalyticsAppStateDestination *)self sendDashboardScreenViewEventForEvent:v4];
  }
  uint64_t v7 = [(CPAnalyticsAppStateDestination *)self appEventNames];
  uint64_t v8 = [v4 name];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    [(CPAnalyticsAppStateDestination *)self sendDashboardAppEventForEvent:v4];
    [(CPAnalyticsAppStateDestination *)self _sendDashboardMediaEventIfNeededForEvent:v4];
    [(CPAnalyticsAppStateDestination *)self _sendDashboardErrorEventIfNeededForEvent:v4];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [(CPAnalyticsAppStateDestination *)self sessionCounters];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v14++) countEvent:v4];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = [(CPAnalyticsAppStateDestination *)self featureCounters];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v19++) countEvent:v4];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  if (+[CPAnalyticsAppStateDestination isValidSessionEndEvent:v4])
  {
    uint64_t v20 = [v4 propertyForKey:@"signpostDuration"];
    uint64_t v21 = [(CPAnalyticsAppStateDestination *)self _computeSessionData:v20];
    [(CPAnalyticsAppStateDestination *)self _sendAppSessionEventFromSourceEvent:v4 payload:v21];
    [(CPAnalyticsAppStateDestination *)self _sendFeatureCounts];
    [(CPAnalyticsAppStateDestination *)self _resetCounters];
  }
}

- (void)updateWithConfig:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CPAnalyticsAppStateDestination *)self screenManager];
  [v5 updateWithConfig:v4];

  int v6 = [(CPAnalyticsAppStateDestination *)self _validateAndParseAppEvents:v4];
  id v67 = v4;
  v68 = v6;
  v66 = self;
  if ([v6 count])
  {
    uint64_t v7 = [(CPAnalyticsAppStateDestination *)self appEventNames];
    uint64_t v8 = [v7 copy];

    int v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v10 = [(CPAnalyticsAppStateDestination *)self featureCounters];
    uint64_t v11 = (void *)[v10 copy];

    uint64_t v12 = (void *)v8;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v91;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v91 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v90 + 1) + 8 * i);
          if ([v12 containsObject:v18])
          {
            v47 = CPAnalyticsLog();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v96 = v18;
              _os_log_error_impl(&dword_215355000, v47, OS_LOG_TYPE_ERROR, "AppEvent, %@, already exists in AppState whitelist", buf, 0xCu);
            }
LABEL_57:
            id v4 = v67;
            goto LABEL_62;
          }
          v89[0] = MEMORY[0x263EF8330];
          v89[1] = 3221225472;
          v89[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke;
          v89[3] = &unk_26423C848;
          v89[4] = v18;
          if ([v11 indexOfObjectPassingTest:v89] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v19 = [[CPAnalyticsEventCounter alloc] initWithEventName:v18];
            if (v19)
            {
              p_super = &v19->super;
              [v9 addObject:v19];
            }
            else
            {
              uint64_t v21 = v13;
              long long v22 = v11;
              long long v23 = v9;
              long long v24 = v12;
              long long v25 = CPAnalyticsLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v96 = v18;
                _os_log_error_impl(&dword_215355000, v25, OS_LOG_TYPE_ERROR, "Could not create AppEvent counter from event name: %@", buf, 0xCu);
              }

              p_super = 0;
              uint64_t v12 = v24;
              int v9 = v23;
              uint64_t v11 = v22;
              uint64_t v13 = v21;
            }
          }
          else
          {
            p_super = CPAnalyticsLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v96 = v18;
              _os_log_error_impl(&dword_215355000, p_super, OS_LOG_TYPE_ERROR, "AppEvent Counter, %@, already exists in AppState counters config", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v90 objects:v99 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v26 = [v12 setByAddingObjectsFromSet:v13];
    self = v66;
    appEventNames = v66->_appEventNames;
    v66->_appEventNames = (NSSet *)v26;

    uint64_t v28 = [(NSArray *)v66->_featureCounters arrayByAddingObjectsFromArray:v9];
    featureCounters = v66->_featureCounters;
    v66->_featureCounters = (NSArray *)v28;

    id v4 = v67;
    int v6 = v68;
  }
  uint64_t v30 = [(CPAnalyticsAppStateDestination *)self _createCountersFromConfig:v4 withKey:@"counters"];
  v65 = v30;
  if ([v30 count])
  {
    int v9 = [(CPAnalyticsAppStateDestination *)self sessionCounters];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v85 objects:v98 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v86;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v86 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v85 + 1) + 8 * j) name];
          v83[0] = MEMORY[0x263EF8330];
          v83[1] = 3221225472;
          v83[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_49;
          v83[3] = &unk_26423C848;
          v37 = v36;
          v84 = v37;
          if ([v9 indexOfObjectPassingTest:v83] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v61 = CPAnalyticsLog();
            uint64_t v13 = v37;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v96 = v37;
              _os_log_error_impl(&dword_215355000, v61, OS_LOG_TYPE_ERROR, "Counter, %@, already exists in AppState config", buf, 0xCu);
            }

            v47 = v84;
            uint64_t v11 = v31;
            uint64_t v12 = v31;
            goto LABEL_57;
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v85 objects:v98 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    uint64_t v38 = [v9 arrayByAddingObjectsFromArray:v31];
    self = v66;
    sessionCounters = v66->_sessionCounters;
    v66->_sessionCounters = (NSArray *)v38;

    id v4 = v67;
    int v6 = v68;
  }
  int v9 = [(CPAnalyticsAppStateDestination *)self _createCountersFromConfig:v4 withKey:@"activeUserFeatures"];
  if ([v9 count])
  {
    v40 = [(CPAnalyticsAppStateDestination *)self featureCounters];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v41 = v9;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v79 objects:v97 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v80;
      obuint64_t j = v41;
      while (2)
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v80 != v44) {
            objc_enumerationMutation(obj);
          }
          v46 = [*(id *)(*((void *)&v79 + 1) + 8 * k) name];
          v77[0] = MEMORY[0x263EF8330];
          v77[1] = 3221225472;
          v77[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_50;
          v77[3] = &unk_26423C848;
          v47 = v46;
          v78 = v47;
          if ([v40 indexOfObjectPassingTest:v77] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v62 = CPAnalyticsLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v96 = v47;
              _os_log_error_impl(&dword_215355000, v62, OS_LOG_TYPE_ERROR, "Feature, %@, already exists in AppState config", buf, 0xCu);
            }

            v60 = (NSArray *)v78;
            uint64_t v12 = v65;
            id v4 = v67;
            uint64_t v11 = v40;
            uint64_t v13 = obj;
            goto LABEL_61;
          }
        }
        v41 = obj;
        uint64_t v43 = [obj countByEnumeratingWithState:&v79 objects:v97 count:16];
        if (v43) {
          continue;
        }
        break;
      }
    }

    v48 = CPAnalyticsLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      int v63 = [v41 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v96 = v63;
      *(_WORD *)&v96[4] = 2112;
      *(void *)&v96[6] = v41;
      _os_log_debug_impl(&dword_215355000, v48, OS_LOG_TYPE_DEBUG, "[AppStateDestination] Updated %d featureCounters %@", buf, 0x12u);
    }

    uint64_t v49 = [v40 arrayByAddingObjectsFromArray:v41];
    self = v66;
    v50 = v66->_featureCounters;
    v66->_featureCounters = (NSArray *)v49;

    id v4 = v67;
    int v6 = v68;
  }
  v51 = [(CPAnalyticsScreenManager *)self->_screenManager namesOfViewsToTrack];
  uint64_t v11 = [(CPAnalyticsAppStateDestination *)self _createCountersFromScreenNames:v51];

  uint64_t v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v11 count])
  {
    v64 = v9;
    v47 = [(CPAnalyticsAppStateDestination *)self featureCounters];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v70 = v11;
    uint64_t v52 = [v70 countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v53; ++m)
        {
          if (*(void *)v74 != v54) {
            objc_enumerationMutation(v70);
          }
          v56 = *(void **)(*((void *)&v73 + 1) + 8 * m);
          v57 = [v56 name];
          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v71[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_51;
          v71[3] = &unk_26423C848;
          id v58 = v57;
          id v72 = v58;
          if ([v47 indexOfObjectPassingTest:v71] == 0x7FFFFFFFFFFFFFFFLL) {
            [v13 addObject:v56];
          }
        }
        uint64_t v53 = [v70 countByEnumeratingWithState:&v73 objects:v94 count:16];
      }
      while (v53);
    }
    uint64_t v11 = v70;

    uint64_t v59 = [v47 arrayByAddingObjectsFromArray:v13];
    id v4 = v67;
    v60 = v66->_featureCounters;
    v66->_featureCounters = (NSArray *)v59;
    int v9 = v64;
    uint64_t v12 = v65;
LABEL_61:

LABEL_62:
    int v6 = v68;
  }
  else
  {
    uint64_t v12 = v65;
  }
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_49(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_50(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_51(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (CPAnalyticsAppStateDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CPAnalyticsAppStateDestination;
  uint64_t v8 = [(CPAnalyticsDashboardDestination *)&v27 initWithConfig:v6 cpAnalyticsInstance:v7];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(CPAnalyticsAppStateDestination *)v8 _createCountersFromConfig:v6 withKey:@"counters"];
    sessionCounters = v9->_sessionCounters;
    v9->_sessionCounters = (NSArray *)v10;

    uint64_t v12 = [(CPAnalyticsAppStateDestination *)v9 _createCountersFromConfig:v6 withKey:@"activeUserFeatures"];
    featureCounters = v9->_featureCounters;
    v9->_featureCounters = (NSArray *)v12;

    uint64_t v14 = [(CPAnalyticsAppStateDestination *)v9 _validateAndParseAppEvents:v6];
    appEventNames = v9->_appEventNames;
    v9->_appEventNames = (NSSet *)v14;

    if ([(NSSet *)v9->_appEventNames count])
    {
      uint64_t v16 = [(CPAnalyticsAppStateDestination *)v9 _createCountersFromAppEvents:v9->_appEventNames];
      uint64_t v17 = [(NSArray *)v9->_featureCounters arrayByAddingObjectsFromArray:v16];
      uint64_t v18 = v9->_featureCounters;
      v9->_featureCounters = (NSArray *)v17;
    }
    else
    {
      uint64_t v16 = v9->_featureCounters;
      v9->_featureCounters = (NSArray *)MEMORY[0x263EFFA68];
    }

    uint64_t v19 = [[CPAnalyticsScreenManager alloc] initWithConfig:v6 cpAnalyticsInstance:v7];
    screenManager = v9->_screenManager;
    v9->_screenManager = v19;

    uint64_t v21 = [(CPAnalyticsScreenManager *)v9->_screenManager namesOfViewsToTrack];
    long long v22 = [(CPAnalyticsAppStateDestination *)v9 _createCountersFromScreenNames:v21];

    uint64_t v23 = [(NSArray *)v9->_featureCounters arrayByAddingObjectsFromArray:v22];
    long long v24 = v9->_featureCounters;
    v9->_featureCounters = (NSArray *)v23;

    long long v25 = [v7 systemProperties];
    [(CPAnalyticsAppStateDestination *)v9 registerSystemProperties:v25];
  }
  return v9;
}

+ (BOOL)isValidSessionEndEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 name];
  int v5 = [@"com.apple.photos.CPAnalytics.signpost.appVisiblePeriod" isEqualToString:v4];

  if (v5)
  {
    id v6 = [v3 propertyForKey:@"className"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 propertyForKey:@"signpostDuration"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      int v9 = CPAnalyticsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [v3 name];
        int v12 = 138412546;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_debug_impl(&dword_215355000, v9, OS_LOG_TYPE_DEBUG, "Signpost duration '%@' is not a number for event %@.", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      id v7 = CPAnalyticsLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:
        BOOL v8 = 0;
        goto LABEL_12;
      }
      int v9 = [v3 name];
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_debug_impl(&dword_215355000, v7, OS_LOG_TYPE_DEBUG, "Class name '%@' is not a string for event %@.", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_11;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

@end