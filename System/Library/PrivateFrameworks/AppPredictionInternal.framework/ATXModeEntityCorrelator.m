@interface ATXModeEntityCorrelator
- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 appLaunchEventProvider:(id)a4 macPortableAppEventProvider:(id)a5 macDesktopAppEventProvider:(id)a6;
- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 entityEventProvider:(id)a4;
- (BOOL)eventOccurredWhileInModeForAggregationEvent:(id)a3 modeTransitionEvent:(id)a4;
- (id)entityFeaturesForModeEntityScoring;
- (id)entityFeaturesForWidgetScoring;
- (id)featuresForEntitiesFromCompleteCorrelatorState:(id)a3;
- (id)mergedWithLocalPublisher;
- (id)mergedWithRemotePublishers;
- (id)zerosArray;
- (int64_t)daysSinceDate:(id)a3 today:(id)a4;
- (void)populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:(id)a3 correlatorState:(id)a4;
- (void)trackNewModeTransitionEvent:(id)a3 correlatorState:(id)a4;
- (void)updateCorrelatorState:(id)a3 forAggregationEvents:(id)a4;
- (void)updateDateBasedHistogram:(id)a3 aggregationEvent:(id)a4 today:(id)a5;
- (void)updateInternalStateForGlobalOccurrenceEvent:(id)a3 correlatorState:(id)a4;
- (void)updateInternalStateForLocalOccurrenceEvent:(id)a3 correlatorState:(id)a4;
@end

@implementation ATXModeEntityCorrelator

- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 entityEventProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityCorrelator;
  v9 = [(ATXModeEntityCorrelator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeEventProvider, a3);
    objc_storeStrong((id *)&v10->_entityEventProvider, a4);
    uint64_t v11 = [MEMORY[0x1E4F4B0E8] sharedInstance];
    informationStore = v10->_informationStore;
    v10->_informationStore = (ATXInformationStore *)v11;
  }
  return v10;
}

- (ATXModeEntityCorrelator)initWithModeEventProvider:(id)a3 appLaunchEventProvider:(id)a4 macPortableAppEventProvider:(id)a5 macDesktopAppEventProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXModeEntityCorrelator;
  v15 = [(ATXModeEntityCorrelator *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modeEventProvider, a3);
    objc_storeStrong((id *)&v16->_localAppLaunchEventProvider, a4);
    objc_storeStrong((id *)&v16->_macPortableAppLaunchEventProvider, a5);
    objc_storeStrong((id *)&v16->_macDesktopAppLaunchEventProvider, a6);
    uint64_t v17 = [MEMORY[0x1E4F4B0E8] sharedInstance];
    informationStore = v16->_informationStore;
    v16->_informationStore = (ATXInformationStore *)v17;
  }
  return v16;
}

- (id)entityFeaturesForModeEntityScoring
{
  if (self->_modeEventProvider)
  {
    if (self->_localAppLaunchEventProvider
      && self->_macDesktopAppLaunchEventProvider
      && self->_macPortableAppLaunchEventProvider)
    {
      uint64_t v3 = [(ATXModeEntityCorrelator *)self mergedWithRemotePublishers];
    }
    else
    {
      uint64_t v3 = [(ATXModeEntityCorrelator *)self mergedWithLocalPublisher];
    }
    v4 = (void *)v3;
    v5 = objc_opt_new();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __61__ATXModeEntityCorrelator_entityFeaturesForModeEntityScoring__block_invoke_2;
    id v13 = &unk_1E68AD360;
    id v14 = self;
    id v15 = v5;
    id v6 = v5;
    id v7 = (id)[v4 sinkWithCompletion:&__block_literal_global_221 receiveInput:&v10];
    id v8 = -[ATXModeEntityCorrelator featuresForEntitiesFromCompleteCorrelatorState:](self, "featuresForEntitiesFromCompleteCorrelatorState:", v6, v10, v11, v12, v13, v14);
  }
  else
  {
    id v8 = objc_opt_new();
  }
  return v8;
}

void __61__ATXModeEntityCorrelator_entityFeaturesForModeEntityScoring__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 16)
    && (v5 = [*(id *)(v4 + 16) isEventFromProvider:v3], uint64_t v4 = *(void *)(a1 + 32), v5))
  {
    id v6 = [*(id *)(v4 + 16) aggregationEventsFromEvent:v3];
    uint64_t v7 = [v6 count];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v7)
    {
      [(id)v4 updateCorrelatorState:*(void *)(a1 + 40) forAggregationEvents:v6];
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = *(void **)(v4 + 24);
  if (v8 && [v8 isEventFromProvider:v3])
  {
    v9 = [*(id *)(*(void *)(a1 + 32) + 24) aggregationEventsFromEvent:v3];

    if ([v9 count])
    {
      id v60 = v3;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v6 = v9;
      uint64_t v10 = [v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v72;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v72 != v12) {
              objc_enumerationMutation(v6);
            }
            uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * v13);
            id v15 = (void *)MEMORY[0x1D25F6CC0]();
            [*(id *)(a1 + 40) setSeenAtLeastOneEntityEvent:1];
            v16 = *(void **)(a1 + 32);
            uint64_t v17 = [*(id *)(a1 + 40) localDeviceGlobalAppLaunchesHistogramPerEntity];
            v18 = [*(id *)(a1 + 40) today];
            [v16 updateDateBasedHistogram:v17 aggregationEvent:v14 today:v18];

            v19 = [*(id *)(a1 + 40) mostRecentModeEvent];

            if (v19)
            {
              objc_super v20 = *(void **)(a1 + 32);
              v21 = [*(id *)(a1 + 40) mostRecentModeEvent];
              LODWORD(v20) = [v20 eventOccurredWhileInModeForAggregationEvent:v14 modeTransitionEvent:v21];

              if (v20)
              {
                v22 = *(void **)(a1 + 32);
                v23 = [*(id *)(a1 + 40) localDeviceModeAppLaunchesHistogramPerEntity];
                v24 = [*(id *)(a1 + 40) today];
                [v22 updateDateBasedHistogram:v23 aggregationEvent:v14 today:v24];
              }
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
        }
        while (v11);
      }

      [*(id *)(a1 + 32) updateCorrelatorState:*(void *)(a1 + 40) forAggregationEvents:v6];
      id v3 = v60;
    }
    else
    {
      id v6 = v9;
    }
  }
  v25 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v25 && [v25 isEventFromProvider:v3])
  {
    v26 = [*(id *)(*(void *)(a1 + 32) + 32) aggregationEventsFromEvent:v3];

    if ([v26 count])
    {
      id v61 = v3;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v6 = v26;
      uint64_t v27 = [v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v68;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v68 != v29) {
              objc_enumerationMutation(v6);
            }
            uint64_t v31 = *(void *)(*((void *)&v67 + 1) + 8 * v30);
            v32 = (void *)MEMORY[0x1D25F6CC0]();
            [*(id *)(a1 + 40) setSeenAtLeastOneEntityEvent:1];
            v33 = *(void **)(a1 + 32);
            v34 = [*(id *)(a1 + 40) macPortableGlobalAppLaunchesHistogramPerEntity];
            v35 = [*(id *)(a1 + 40) today];
            [v33 updateDateBasedHistogram:v34 aggregationEvent:v31 today:v35];

            v36 = [*(id *)(a1 + 40) mostRecentModeEvent];

            if (v36)
            {
              v37 = *(void **)(a1 + 32);
              v38 = [*(id *)(a1 + 40) mostRecentModeEvent];
              LODWORD(v37) = [v37 eventOccurredWhileInModeForAggregationEvent:v31 modeTransitionEvent:v38];

              if (v37)
              {
                v39 = *(void **)(a1 + 32);
                v40 = [*(id *)(a1 + 40) macPortableModeAppLaunchesHistogramPerEntity];
                v41 = [*(id *)(a1 + 40) today];
                [v39 updateDateBasedHistogram:v40 aggregationEvent:v31 today:v41];
              }
            }
            ++v30;
          }
          while (v28 != v30);
          uint64_t v28 = [v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v28);
      }

      [*(id *)(a1 + 32) updateCorrelatorState:*(void *)(a1 + 40) forAggregationEvents:v6];
      id v3 = v61;
    }
    else
    {
      id v6 = v26;
    }
  }
  v42 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v42 && [v42 isEventFromProvider:v3])
  {
    v43 = [*(id *)(*(void *)(a1 + 32) + 40) aggregationEventsFromEvent:v3];

    if ([v43 count])
    {
      id v62 = v3;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v6 = v43;
      uint64_t v44 = [v6 countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v64;
        do
        {
          uint64_t v47 = 0;
          do
          {
            if (*(void *)v64 != v46) {
              objc_enumerationMutation(v6);
            }
            uint64_t v48 = *(void *)(*((void *)&v63 + 1) + 8 * v47);
            v49 = (void *)MEMORY[0x1D25F6CC0]();
            [*(id *)(a1 + 40) setSeenAtLeastOneEntityEvent:1];
            v50 = *(void **)(a1 + 32);
            v51 = [*(id *)(a1 + 40) macDesktopGlobalAppLaunchesHistogramPerEntity];
            v52 = [*(id *)(a1 + 40) today];
            [v50 updateDateBasedHistogram:v51 aggregationEvent:v48 today:v52];

            v53 = [*(id *)(a1 + 40) mostRecentModeEvent];

            if (v53)
            {
              v54 = *(void **)(a1 + 32);
              v55 = [*(id *)(a1 + 40) mostRecentModeEvent];
              LODWORD(v54) = [v54 eventOccurredWhileInModeForAggregationEvent:v48 modeTransitionEvent:v55];

              if (v54)
              {
                v56 = *(void **)(a1 + 32);
                v57 = [*(id *)(a1 + 40) macDesktopModeAppLaunchesHistogramPerEntity];
                v58 = [*(id *)(a1 + 40) today];
                [v56 updateDateBasedHistogram:v57 aggregationEvent:v48 today:v58];
              }
            }
            ++v47;
          }
          while (v45 != v47);
          uint64_t v45 = [v6 countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v45);
      }

      [*(id *)(a1 + 32) updateCorrelatorState:*(void *)(a1 + 40) forAggregationEvents:v6];
      id v3 = v62;
    }
    else
    {
      id v6 = v43;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) isEventFromProvider:v3])
  {
    uint64_t v59 = [*(id *)(*(void *)(a1 + 32) + 8) aggregationEventsFromEvent:v3];

    [*(id *)(a1 + 32) trackNewModeTransitionEvent:v59 correlatorState:*(void *)(a1 + 40)];
    id v6 = (id)v59;
  }
}

- (void)updateCorrelatorState:(id)a3 forAggregationEvents:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1D25F6CC0](v8);
        objc_msgSend(v6, "setSeenAtLeastOneEntityEvent:", 1, (void)v18);
        uint64_t v14 = [v12 entity];

        if (v14)
        {
          [(ATXModeEntityCorrelator *)self updateInternalStateForGlobalOccurrenceEvent:v12 correlatorState:v6];
          id v15 = [v6 mostRecentModeEvent];

          if (v15)
          {
            v16 = [v6 mostRecentModeEvent];
            BOOL v17 = [(ATXModeEntityCorrelator *)self eventOccurredWhileInModeForAggregationEvent:v12 modeTransitionEvent:v16];

            if (v17) {
              [(ATXModeEntityCorrelator *)self updateInternalStateForLocalOccurrenceEvent:v12 correlatorState:v6];
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }
}

- (id)entityFeaturesForWidgetScoring
{
  if (self->_modeEventProvider)
  {
    id v3 = objc_opt_new();
    uint64_t v4 = [[ATXWidgetModeEventProvider alloc] initWithInformationStore:self->_informationStore];
    [(ATXModeEntityCorrelator *)self populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:v4 correlatorState:v3];
    int v5 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2;
    v11[3] = &unk_1E68ACA68;
    v11[4] = self;
    uint64_t v12 = v4;
    id v13 = v3;
    id v6 = v3;
    id v7 = v4;
    id v8 = (id)[v5 sinkWithCompletion:&__block_literal_global_16_0 receiveInput:v11];

    uint64_t v9 = [(ATXModeEntityCorrelator *)self featuresForEntitiesFromCompleteCorrelatorState:v6];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  return v9;
}

void __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  BOOL v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aggregationEventsFromEvent:");
  id v3 = [v17 firstObject];
  uint64_t v4 = *(void **)(a1 + 40);
  int v5 = [v3 startDate];
  id v6 = [v3 endDate];
  id v7 = [v4 widgetModeEventsBetweenStartDate:v5 endDate:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
        [*(id *)(a1 + 48) setSeenAtLeastOneEntityEvent:1];
        id v15 = [v13 entity];

        if (v15)
        {
          [*(id *)(a1 + 32) updateInternalStateForLocalOccurrenceEvent:v13 correlatorState:*(void *)(a1 + 48)];
        }
        else
        {
          v16 = __atxlog_handle_modes();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2_cold_1(&buf, v20, v16);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) trackNewModeTransitionEvent:v17 correlatorState:*(void *)(a1 + 48)];
}

- (void)populateGlobalOccurencesForAllWidgetsWithWidgetModeEventProvider:(id)a3 correlatorState:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = [v7 dateByAddingTimeInterval:-2419200.0];

  long long v21 = v5;
  uint64_t v9 = [v5 widgetEngagementCountSinceStartDate:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [v9 objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 integerValue];

        if (v16 >= 1)
        {
          uint64_t v17 = 0;
          do
          {
            id v18 = [v6 globalEntityOccurrences];
            [v18 addObject:v14];

            ++v17;
            long long v19 = [v9 objectForKeyedSubscript:v14];
            uint64_t v20 = [v19 integerValue];
          }
          while (v17 < v20);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

- (BOOL)eventOccurredWhileInModeForAggregationEvent:(id)a3 modeTransitionEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 startDate];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  uint64_t v10 = [v6 startDate];
  [v10 timeIntervalSince1970];
  if (v9 <= v11)
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v12 = [v5 startDate];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    id v15 = [v6 endDate];
    [v15 timeIntervalSince1970];
    BOOL v17 = v14 < v16;
  }
  return v17;
}

- (void)trackNewModeTransitionEvent:(id)a3 correlatorState:(id)a4
{
  id v7 = a4;
  id v5 = [a3 firstObject];
  [v7 setMostRecentModeEvent:v5];

  id v6 = objc_opt_new();
  [v7 setEntitiesSeenForMostRecentModeEvent:v6];

  objc_msgSend(v7, "setModeOccurrences:", objc_msgSend(v7, "modeOccurrences") + 1);
  if (([v7 seenAtLeastOneEntityEvent] & 1) == 0) {
    [v7 setModeOccurrences:1];
  }
}

- (id)featuresForEntitiesFromCompleteCorrelatorState:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x3E45798EE2308C3ALL;
  id v6 = [v4 modeLocalEntityOccurrences];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke;
  v26[3] = &unk_1E68B57E8;
  uint64_t v28 = v29;
  id v7 = v4;
  id v27 = v7;
  [v6 enumerateObjectsUsingBlock:v26];

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x3E45798EE2308C3ALL;
  double v8 = [v7 globalEntityOccurrences];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_2;
  v22[3] = &unk_1E68B57E8;
  long long v24 = v25;
  id v9 = v7;
  id v23 = v9;
  [v8 enumerateObjectsUsingBlock:v22];

  uint64_t v10 = [v9 globalEntityOccurrences];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_3;
  v16[3] = &unk_1E68B5810;
  id v11 = v9;
  id v17 = v11;
  id v18 = self;
  uint64_t v20 = v29;
  long long v21 = v25;
  id v12 = v5;
  id v19 = v12;
  [v10 enumerateObjectsUsingBlock:v16];

  double v13 = v19;
  id v14 = v12;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v29, 8);

  return v14;
}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 modeLocalEntityOccurrences];
  unint64_t v5 = [v6 countForObject:v4];

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + (double)v5;
}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 globalEntityOccurrences];
  unint64_t v5 = [v6 countForObject:v4];

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + (double)v5;
}

void __74__ATXModeEntityCorrelator_featuresForEntitiesFromCompleteCorrelatorState___block_invoke_3(uint64_t a1, void *a2)
{
  id v61 = a2;
  id v3 = [*(id *)(a1 + 32) globalEntityOccurrences];
  unint64_t v4 = [v3 countForObject:v61];

  unint64_t v5 = [*(id *)(a1 + 32) modeLocalEntityOccurrences];
  unint64_t v6 = [v5 countForObject:v61];

  id v7 = [*(id *)(a1 + 32) uniqueModeOccurrences];
  unint64_t v8 = [v7 countForObject:v61];

  id v9 = objc_opt_new();
  uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 8) description];
  [v9 setModeDescription:v10];

  id v11 = [v61 identifier];
  [v9 setEntityDescription:v11];

  uint64_t v12 = [*(id *)(a1 + 32) modeOccurrences];
  double v13 = 0.0;
  double v14 = 0.0;
  if (v12) {
    double v14 = (double)v8 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "modeOccurrences", 0.0);
  }
  [v9 setPosteriorProbability:v14];
  if (v4) {
    double v13 = (double)v6 / (double)v4;
  }
  [v9 setClassConditionalProbability:v13];
  [v9 setUniqueOccurrencesInMode:v8];
  objc_msgSend(v9, "setModeOccurrences:", objc_msgSend(*(id *)(a1 + 32), "modeOccurrences"));
  [v9 setGlobalOccurrences:v4];
  [v9 setLocalOccurrences:v6];
  [v9 setLocalOccurrencesAcrossAllEntities:(unint64_t)*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  double v15 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v16 = 0.0;
  double v17 = 0.0;
  if (v15 != 0.0) {
    double v17 = (double)v6 / v15;
  }
  [v9 setModePopularity:v17];
  double v18 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v18 != 0.0) {
    double v16 = (double)v4 / v18;
  }
  [v9 setGlobalPopularity:v16];
  [v9 globalPopularity];
  double v19 = 0.0;
  if (v20 > 0.0)
  {
    [v9 modePopularity];
    double v22 = v21;
    [v9 globalPopularity];
    double v19 = v22 / v23 + -1.0;
  }
  objc_msgSend(v9, "setRatioModeAndGlobalPopularity:", fmin(v19, 5.0));
  long long v24 = [*(id *)(a1 + 32) entityToEntityFeaturesDict];
  long long v25 = [v24 objectForKeyedSubscript:v61];
  [v9 setEntitySpecificFeatures:v25];

  uint64_t v26 = [*(id *)(a1 + 32) totalModeLaunchesHistogramPerEntity];
  uint64_t v27 = [v26 objectForKeyedSubscript:v61];
  uint64_t v28 = (void *)v27;
  uint64_t v29 = MEMORY[0x1E4F1CBF0];
  if (v27) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = MEMORY[0x1E4F1CBF0];
  }
  [v9 setTotalModeLaunchesHistogramForLast28Days:v30];

  uint64_t v31 = [*(id *)(a1 + 32) totalGlobalLaunchesHistogramPerEntity];
  uint64_t v32 = [v31 objectForKeyedSubscript:v61];
  v33 = (void *)v32;
  if (v32) {
    uint64_t v34 = v32;
  }
  else {
    uint64_t v34 = v29;
  }
  [v9 setTotalGlobalLaunchesHistogramForLast28Days:v34];

  v35 = [*(id *)(a1 + 32) macPortableGlobalAppLaunchesHistogramPerEntity];
  uint64_t v36 = [v35 objectForKeyedSubscript:v61];
  v37 = (void *)v36;
  if (v36) {
    uint64_t v38 = v36;
  }
  else {
    uint64_t v38 = v29;
  }
  [v9 setMacPortableGlobalAppLaunchesHistogramForLast28Days:v38];

  v39 = [*(id *)(a1 + 32) macPortableModeAppLaunchesHistogramPerEntity];
  uint64_t v40 = [v39 objectForKeyedSubscript:v61];
  v41 = (void *)v40;
  if (v40) {
    uint64_t v42 = v40;
  }
  else {
    uint64_t v42 = v29;
  }
  [v9 setMacPortableModeAppLaunchesHistogramForLast28Days:v42];

  v43 = [*(id *)(a1 + 32) macDesktopGlobalAppLaunchesHistogramPerEntity];
  uint64_t v44 = [v43 objectForKeyedSubscript:v61];
  uint64_t v45 = (void *)v44;
  if (v44) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = v29;
  }
  [v9 setMacDesktopGlobalAppLaunchesHistogramForLast28Days:v46];

  uint64_t v47 = [*(id *)(a1 + 32) macDesktopModeAppLaunchesHistogramPerEntity];
  uint64_t v48 = [v47 objectForKeyedSubscript:v61];
  v49 = (void *)v48;
  if (v48) {
    uint64_t v50 = v48;
  }
  else {
    uint64_t v50 = v29;
  }
  [v9 setMacDesktopModeAppLaunchesHistogramForLast28Days:v50];

  v51 = [*(id *)(a1 + 32) localDeviceGlobalAppLaunchesHistogramPerEntity];
  uint64_t v52 = [v51 objectForKeyedSubscript:v61];
  v53 = (void *)v52;
  if (v52) {
    uint64_t v54 = v52;
  }
  else {
    uint64_t v54 = v29;
  }
  [v9 setLocalDeviceGlobalAppLaunchesHistogramForLast28Days:v54];

  v55 = [*(id *)(a1 + 32) localDeviceModeAppLaunchesHistogramPerEntity];
  uint64_t v56 = [v55 objectForKeyedSubscript:v61];
  v57 = (void *)v56;
  if (v56) {
    uint64_t v58 = v56;
  }
  else {
    uint64_t v58 = v29;
  }
  [v9 setLocalDeviceModeAppLaunchesHistogramForLast28Days:v58];

  [v9 setEntity:v61];
  uint64_t v59 = *(void **)(a1 + 48);
  id v60 = [v61 identifier];
  [v59 setObject:v9 forKey:v60];
}

- (id)mergedWithRemotePublishers
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
  unint64_t v4 = [(ATXModeEntityEventProviderProtocol *)self->_localAppLaunchEventProvider biomePublisherWithBookmark:0];
  v11[0] = v4;
  unint64_t v5 = [(ATXModeEntityEventProviderProtocol *)self->_macPortableAppLaunchEventProvider biomePublisherWithBookmark:0];
  v11[1] = v5;
  unint64_t v6 = [(ATXModeEntityEventProviderProtocol *)self->_macDesktopAppLaunchEventProvider biomePublisherWithBookmark:0];
  v11[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke;
  v10[3] = &unk_1E68AC7A0;
  v10[4] = self;
  unint64_t v8 = [v3 orderedMergeWithOthers:v7 comparator:v10];

  return v8;
}

uint64_t __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) dateIntervalFromEvent:v5];
  if (!v7)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 32) dateIntervalFromEvent:v5];
    if (!v7)
    {
      unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 40) dateIntervalFromEvent:v5];
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v5];
      }
      id v7 = v10;

      if (!v7)
      {
        id v11 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();
        }

        id v7 = 0;
      }
    }
  }
  uint64_t v12 = [v7 startDate];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  double v15 = [*(id *)(*(void *)(a1 + 32) + 24) dateIntervalFromEvent:v6];
  if (!v15)
  {
    double v15 = [*(id *)(*(void *)(a1 + 32) + 32) dateIntervalFromEvent:v6];
    if (!v15)
    {
      double v16 = [*(id *)(*(void *)(a1 + 32) + 40) dateIntervalFromEvent:v6];
      double v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v6];
      }
      double v15 = v18;

      if (!v15)
      {
        double v19 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();
        }

        double v15 = 0;
      }
    }
  }
  double v20 = [v15 startDate];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;

  double v23 = [NSNumber numberWithDouble:v14];
  long long v24 = [NSNumber numberWithDouble:v22];
  uint64_t v25 = [v23 compare:v24];

  return v25;
}

- (id)mergedWithLocalPublisher
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
  unint64_t v4 = [(ATXModeEntityEventProviderProtocol *)self->_entityEventProvider biomePublisherWithBookmark:0];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXModeEntityCorrelator_mergedWithLocalPublisher__block_invoke;
  v8[3] = &unk_1E68AC7A0;
  v8[4] = self;
  id v6 = [v3 orderedMergeWithOthers:v5 comparator:v8];

  return v6;
}

uint64_t __51__ATXModeEntityCorrelator_mergedWithLocalPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) dateIntervalFromEvent:v5];
  if (!v7)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v5];
    if (!v7)
    {
      unint64_t v8 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();
      }

      id v7 = 0;
    }
  }
  id v9 = [v7 startDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) dateIntervalFromEvent:v6];
  if (!v12)
  {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v6];
    if (!v12)
    {
      double v13 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1();
      }

      uint64_t v12 = 0;
    }
  }
  double v14 = [v12 startDate];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  double v17 = [NSNumber numberWithDouble:v11];
  id v18 = [NSNumber numberWithDouble:v16];
  uint64_t v19 = [v17 compare:v18];

  return v19;
}

- (void)updateInternalStateForGlobalOccurrenceEvent:(id)a3 correlatorState:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 globalEntityOccurrences];
  unint64_t v8 = [v13 entity];
  [v7 addObject:v8];

  id v9 = [v6 totalGlobalLaunchesHistogramPerEntity];
  double v10 = [v6 today];
  [(ATXModeEntityCorrelator *)self updateDateBasedHistogram:v9 aggregationEvent:v13 today:v10];

  localAppLaunchEventProvider = self->_localAppLaunchEventProvider;
  if (!localAppLaunchEventProvider) {
    localAppLaunchEventProvider = self->_entityEventProvider;
  }
  uint64_t v12 = [v6 entityToEntityFeaturesDict];

  [(ATXModeEntityEventProviderProtocol *)localAppLaunchEventProvider updateEntitySpecificFeaturesDict:v12 aggregationEvent:v13 isLocalToMode:0];
}

- (void)updateInternalStateForLocalOccurrenceEvent:(id)a3 correlatorState:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [v6 modeLocalEntityOccurrences];
  unint64_t v8 = [v20 entity];
  [v7 addObject:v8];

  id v9 = [v6 totalModeLaunchesHistogramPerEntity];
  double v10 = [v6 today];
  [(ATXModeEntityCorrelator *)self updateDateBasedHistogram:v9 aggregationEvent:v20 today:v10];

  localAppLaunchEventProvider = self->_localAppLaunchEventProvider;
  if (!localAppLaunchEventProvider) {
    localAppLaunchEventProvider = self->_entityEventProvider;
  }
  uint64_t v12 = [v6 entityToEntityFeaturesDict];
  [(ATXModeEntityEventProviderProtocol *)localAppLaunchEventProvider updateEntitySpecificFeaturesDict:v12 aggregationEvent:v20 isLocalToMode:1];

  id v13 = [v6 entitiesSeenForMostRecentModeEvent];
  double v14 = [v20 entity];
  char v15 = [v13 containsObject:v14];

  if ((v15 & 1) == 0)
  {
    double v16 = [v6 uniqueModeOccurrences];
    double v17 = [v20 entity];
    [v16 addObject:v17];
  }
  id v18 = [v6 entitiesSeenForMostRecentModeEvent];
  uint64_t v19 = [v20 entity];
  [v18 addObject:v19];
}

- (void)updateDateBasedHistogram:(id)a3 aggregationEvent:(id)a4 today:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 entity];
  double v11 = [v22 objectForKeyedSubscript:v10];

  if (!v11)
  {
    uint64_t v12 = [(ATXModeEntityCorrelator *)self zerosArray];
    id v13 = [v8 entity];
    [v22 setObject:v12 forKeyedSubscript:v13];
  }
  double v14 = [v8 startDate];
  unint64_t v15 = [(ATXModeEntityCorrelator *)self daysSinceDate:v14 today:v9];

  if (v15 <= 0x1B)
  {
    double v16 = [v8 entity];
    double v17 = [v22 objectForKeyedSubscript:v16];
    id v18 = [v17 objectAtIndexedSubscript:v15];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    id v20 = [v8 entity];
    double v21 = [v22 objectForKeyedSubscript:v20];
    [v21 setObject:v19 atIndexedSubscript:v15];
  }
}

- (id)zerosArray
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:28];
  for (uint64_t i = 0; i != 28; ++i)
    [v2 setObject:&unk_1F27F2370 atIndexedSubscript:i];
  return v2;
}

- (int64_t)daysSinceDate:(id)a3 today:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentCalendar];
  id v9 = [v8 components:16 fromDate:v7 toDate:v6 options:0];

  int64_t v10 = [v9 day];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_macDesktopAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_macPortableAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_localAppLaunchEventProvider, 0);
  objc_storeStrong((id *)&self->_entityEventProvider, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

void __57__ATXModeEntityCorrelator_entityFeaturesForWidgetScoring__block_invoke_2_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Encountered widget engagement mode event in ModeEntityCorrelator without a valid entity.", buf, 2u);
}

void __53__ATXModeEntityCorrelator_mergedWithRemotePublishers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "During ordered merge, encountered unknown event: %@", v2, v3, v4, v5, v6);
}

@end