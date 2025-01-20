@interface ATXDailyPhubbingAccumulator
- (ATXDailyPhubbingAccumulator)init;
- (ATXDailyPhubbingAccumulator)initWithProximityEventPublisher:(id)a3 screenLockedPublisher:(id)a4 appLaunchPublisher:(id)a5;
- (BOOL)appInFocusEventOccured:(id)a3 whileNearPeople:(id)a4;
- (BOOL)screenEventOccured:(id)a3 whileNearPeople:(id)a4;
- (BOOL)successfullyAccumulatedPhubbingEvents;
- (NSArray)phubbingSessions;
- (RTProximityEvent)mostRecentProximityPeopleEvent;
- (id)dateIntervalFromAppInFocusEvent:(id)a3;
- (id)dateIntervalFromPeopleEvent:(id)a3;
- (id)dateIntervalFromScreenLockEvent:(id)a3;
- (void)addAppSession:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7;
- (void)recordAppLaunchEndEvent:(id)a3;
- (void)recordAppLaunchStartEvent:(id)a3;
- (void)successfullyAccumulatedPhubbingEvents;
- (void)trackMostRecentDiscoveredPeopleEvent:(id)a3;
- (void)trackScreenEndingEvent:(id)a3;
- (void)trackScreenStartingEvent:(id)a3;
@end

@implementation ATXDailyPhubbingAccumulator

- (ATXDailyPhubbingAccumulator)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = [v4 fetchPeopleWithProximityFromStartDate:v3 toEndDate:v5];

  v7 = BiomeLibrary();
  v8 = [v7 Device];
  v9 = [v8 ScreenLocked];

  v10 = BiomeLibrary();
  v11 = [v10 App];
  v12 = [v11 InFocus];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  uint64_t v14 = *MEMORY[0x1E4F4B5A0];
  v15 = [v9 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v13];
  v16 = [v12 publisherWithUseCase:v14 options:v13];
  v17 = [(ATXDailyPhubbingAccumulator *)self initWithProximityEventPublisher:v6 screenLockedPublisher:v15 appLaunchPublisher:v16];

  return v17;
}

- (ATXDailyPhubbingAccumulator)initWithProximityEventPublisher:(id)a3 screenLockedPublisher:(id)a4 appLaunchPublisher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXDailyPhubbingAccumulator;
  v12 = [(ATXDailyPhubbingAccumulator *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proximityPublisher, a3);
    objc_storeStrong((id *)&v13->_deviceScreenLockedPublisher, a4);
    objc_storeStrong((id *)&v13->_appLaunchPublisher, a5);
    uint64_t v14 = objc_opt_new();
    phubbingSessionEvents = v13->_phubbingSessionEvents;
    v13->_phubbingSessionEvents = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    appInFocusStartingEvents = v13->_appInFocusStartingEvents;
    v13->_appInFocusStartingEvents = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    appSessionsWithinPhubbingEvent = v13->_appSessionsWithinPhubbingEvent;
    v13->_appSessionsWithinPhubbingEvent = (NSMutableArray *)v18;
  }
  return v13;
}

- (BOOL)successfullyAccumulatedPhubbingEvents
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = +[_ATXAppIconState sharedInstance];
  v5 = [v4 allInstalledAppsKnownToSpringBoard];
  v6 = (void *)[v3 initWithArray:v5];

  proximityPublisher = self->_proximityPublisher;
  appLaunchPublisher = self->_appLaunchPublisher;
  v27[0] = self->_deviceScreenLockedPublisher;
  v27[1] = appLaunchPublisher;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke;
  v24[3] = &unk_1E68AC7A0;
  v24[4] = self;
  id v10 = [(BPSPublisher *)proximityPublisher orderedMergeWithOthers:v9 comparator:v24];

  uint64_t v21 = 0;
  v22[0] = &v21;
  v22[1] = 0x3032000000;
  v22[2] = __Block_byref_object_copy__73;
  v22[3] = __Block_byref_object_dispose__73;
  id v23 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_12;
  v20[3] = &unk_1E68AC060;
  v20[4] = &v21;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_2;
  v18[3] = &unk_1E68AD7A8;
  v18[4] = self;
  id v11 = v6;
  id v19 = v11;
  id v12 = (id)[v10 sinkWithCompletion:v20 receiveInput:v18];
  uint64_t v13 = *(void *)(v22[0] + 40);
  if (v13)
  {
    p_super = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      [(ATXDailyPhubbingAccumulator *)(uint64_t)v22 successfullyAccumulatedPhubbingEvents];
    }
  }
  else
  {
    v15 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[ATXDailyPhubbingAccumulator successfullyAccumulatedPhubbingEvents]";
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "%s: Successfully accumulated phubbing session events", buf, 0xCu);
    }

    uint64_t v16 = self->_phubbingSessionEvents;
    p_super = &self->_phubbingSessions->super;
    self->_phubbingSessions = &v16->super;
  }

  _Block_object_dispose(&v21, 8);
  return v13 == 0;
}

uint64_t __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) dateIntervalFromPeopleEvent:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) dateIntervalFromScreenLockEvent:v5];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) dateIntervalFromAppInFocusEvent:v5];
    }
    id v9 = v12;
  }
  uint64_t v13 = [*(id *)(a1 + 32) dateIntervalFromPeopleEvent:v6];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) dateIntervalFromScreenLockEvent:v6];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [*(id *)(a1 + 32) dateIntervalFromAppInFocusEvent:v6];
    }
    id v15 = v18;
  }
  if (v9)
  {
    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  id v19 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1((uint64_t)v5, v19);
  }

  if (!v15)
  {
LABEL_19:
    v20 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1((uint64_t)v6, v20);
    }
  }
LABEL_22:
  uint64_t v21 = [v9 startDate];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  v24 = [v15 startDate];
  [v24 timeIntervalSinceReferenceDate];
  double v26 = v25;

  v27 = [NSNumber numberWithDouble:v23];
  v28 = [NSNumber numberWithDouble:v26];
  uint64_t v29 = [v27 compare:v28];

  return v29;
}

uint64_t __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) trackMostRecentDiscoveredPeopleEvent:v13];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v13;
    uint64_t v4 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [v3 eventBody];
      if ([v6 starting])
      {
        if ([v6 starting])
        {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v6);
          [*(id *)(a1 + 32) trackScreenEndingEvent:v3];
        }
      }
      else
      {
        if ([*(id *)(*(void *)(a1 + 32) + 48) starting]) {
          [*(id *)(a1 + 32) trackScreenStartingEvent:v3];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v6);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    v8 = [v7 eventBody];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9)
    {
      id v10 = [v7 eventBody];
      id v11 = *(void **)(a1 + 40);
      id v12 = [v10 bundleID];
      LODWORD(v11) = [v11 containsObject:v12];

      if (v11)
      {
        if ([v10 starting])
        {
          [*(id *)(a1 + 32) recordAppLaunchStartEvent:v10];
        }
        else if (([v10 starting] & 1) == 0)
        {
          [*(id *)(a1 + 32) recordAppLaunchEndEvent:v10];
        }
      }
    }
  }
}

- (id)dateIntervalFromPeopleEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 endDate];

    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v7 = [v4 startDate];
    if (v5) {
      [v4 endDate];
    }
    else {
    char v9 = [v4 startDate];
    }
    v8 = (void *)[v6 initWithStartDate:v7 endDate:v9];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dateIntervalFromScreenLockEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v4 timestamp];
      v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
      char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)dateIntervalFromAppInFocusEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [v4 eventBody];
      id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
      char v9 = [v7 absoluteTimestamp];
      id v10 = [v7 absoluteTimestamp];
      id v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)trackScreenStartingEvent:(id)a3
{
  id v8 = a3;
  id v4 = [v8 eventBody];
  if (([v4 starting] & 1) == 0
    && [(ATXDailyPhubbingAccumulator *)self screenEventOccured:v8 whileNearPeople:self->_mostRecentProximityPeopleEvent])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v8 timestamp];
    id v6 = (NSDate *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    phubbingStartTime = self->_phubbingStartTime;
    self->_phubbingStartTime = v6;
  }
}

- (void)trackScreenEndingEvent:(id)a3
{
  id v16 = a3;
  id v4 = [v16 eventBody];
  if ([v4 starting]
    && self->_phubbingStartTime
    && [(ATXDailyPhubbingAccumulator *)self screenEventOccured:v16 whileNearPeople:self->_mostRecentProximityPeopleEvent])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v16 timestamp];
    id v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    objc_storeStrong((id *)&self->_phubbingEndTime, v6);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:self->_phubbingStartTime endDate:self->_phubbingEndTime];
    if ([(RTProximityEvent *)self->_mostRecentProximityPeopleEvent relationship] == 1)
    {
      id v8 = @"Family";
    }
    else if ([(RTProximityEvent *)self->_mostRecentProximityPeopleEvent relationship] == 2)
    {
      id v8 = @"Friend";
    }
    else
    {
      id v8 = @"Unknown";
    }
    id v9 = objc_alloc(MEMORY[0x1E4F4B3B0]);
    phubbingStartTime = self->_phubbingStartTime;
    phubbingEndTime = self->_phubbingEndTime;
    [v7 duration];
    id v12 = objc_msgSend(v9, "initWithRelationshipType:startTime:endTime:duration:appSessions:", v8, phubbingStartTime, phubbingEndTime, self->_appSessionsWithinPhubbingEvent);
    [(NSMutableArray *)self->_phubbingSessionEvents addObject:v12];
    id v13 = (NSMutableArray *)objc_opt_new();
    appSessionsWithinPhubbingEvent = self->_appSessionsWithinPhubbingEvent;
    self->_appSessionsWithinPhubbingEvent = v13;

    id v15 = self->_phubbingStartTime;
    self->_phubbingStartTime = 0;
  }
}

- (void)recordAppLaunchStartEvent:(id)a3
{
  id v4 = a3;
  if (-[ATXDailyPhubbingAccumulator appInFocusEventOccured:whileNearPeople:](self, "appInFocusEventOccured:whileNearPeople:")&& self->_phubbingStartTime)
  {
    [(NSMutableArray *)self->_appInFocusStartingEvents addObject:v4];
  }
}

- (void)recordAppLaunchEndEvent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_appInFocusStartingEvents copy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = objc_msgSend(v4, "bundleID", (void)v23);
        id v13 = [v11 bundleID];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          if ([(ATXDailyPhubbingAccumulator *)self appInFocusEventOccured:v4 whileNearPeople:self->_mostRecentProximityPeopleEvent])
          {
            id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
            id v16 = [v11 absoluteTimestamp];
            v17 = [v4 absoluteTimestamp];
            id v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];

            id v19 = [v4 bundleID];
            v20 = [v11 launchReason];
            uint64_t v21 = [v11 absoluteTimestamp];
            double v22 = [v4 absoluteTimestamp];
            [v18 duration];
            -[ATXDailyPhubbingAccumulator addAppSession:launchReason:startTime:endTime:duration:](self, "addAppSession:launchReason:startTime:endTime:duration:", v19, v20, v21, v22);
          }
          [(NSMutableArray *)self->_appInFocusStartingEvents removeObject:v11];
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)addAppSession:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v15];
  uint64_t v17 = [v16 unsignedIntegerValue];

  id v18 = objc_alloc(MEMORY[0x1E4F4B398]);
  id v19 = [MEMORY[0x1E4F4B398] usageInsightsAppLaunchReasonFromBMAppInFocus:v14];

  id v20 = (id)[v18 initWithBundleID:v15 category:v17 launchReason:v19 startTime:v13 endTime:v12 duration:a7];
  [(NSMutableArray *)self->_appSessionsWithinPhubbingEvent addObject:v20];
}

- (void)trackMostRecentDiscoveredPeopleEvent:(id)a3
{
}

- (BOOL)screenEventOccured:(id)a3 whileNearPeople:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 alloc];
  [v7 timestamp];
  double v10 = v9;

  id v11 = (void *)[v8 initWithTimeIntervalSinceReferenceDate:v10];
  [v11 timeIntervalSince1970];
  double v13 = v12;
  id v14 = [v5 startDate];
  [v14 timeIntervalSince1970];
  if (v13 <= v15)
  {
    BOOL v20 = 0;
  }
  else
  {
    [v11 timeIntervalSince1970];
    double v17 = v16;
    id v18 = [v5 endDate];
    [v18 timeIntervalSince1970];
    BOOL v20 = v17 < v19;
  }
  return v20;
}

- (BOOL)appInFocusEventOccured:(id)a3 whileNearPeople:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 absoluteTimestamp];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  double v10 = [v6 startDate];
  [v10 timeIntervalSince1970];
  if (v9 <= v11)
  {
    BOOL v17 = 0;
  }
  else
  {
    double v12 = [v5 absoluteTimestamp];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    double v15 = [v6 endDate];
    [v15 timeIntervalSince1970];
    BOOL v17 = v14 < v16;
  }
  return v17;
}

- (RTProximityEvent)mostRecentProximityPeopleEvent
{
  return self->_mostRecentProximityPeopleEvent;
}

- (NSArray)phubbingSessions
{
  return self->_phubbingSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phubbingSessions, 0);
  objc_storeStrong((id *)&self->_mostRecentProximityPeopleEvent, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_deviceScreenLockedPublisher, 0);
  objc_storeStrong((id *)&self->_proximityPublisher, 0);
  objc_storeStrong((id *)&self->_lastLoggedScreenEvent, 0);
  objc_storeStrong((id *)&self->_appSessionsWithinPhubbingEvent, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
  objc_storeStrong((id *)&self->_phubbingEndTime, 0);
  objc_storeStrong((id *)&self->_phubbingStartTime, 0);
  objc_storeStrong((id *)&self->_phubbingSessionEvents, 0);
}

- (void)successfullyAccumulatedPhubbingEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[ATXDailyPhubbingAccumulator successfullyAccumulatedPhubbingEvents]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error from merged publishers: %@", (uint8_t *)&v3, 0x16u);
}

void __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXDailyPhubbingAccumulator: During ordered merge, encountered unknown event: %@", (uint8_t *)&v2, 0xCu);
}

@end