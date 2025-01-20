@interface IQFMapsCoreAnalyticsLogger
+ (id)BOOLeanCoreAnalyticsKeys;
+ (id)_createCoreAnalyticsEventForLocation:(id)a3 index:(unint64_t)a4 muidsToResults:(id)a5;
+ (id)logCoreAnalyticsEventsWithResults:(id)a3 locations:(id)a4;
@end

@implementation IQFMapsCoreAnalyticsLogger

+ (id)logCoreAnalyticsEventsWithResults:(id)a3 locations:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = a4;
  v6 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v12 = [v11 muid];
        v13 = [v6 objectForKey:v12];
        v14 = (void *)[v13 mutableCopy];

        if (v14)
        {
          [v14 addObject:v11];
        }
        else
        {
          v14 = [MEMORY[0x263EFF980] arrayWithObject:v11];
        }
        [v6 setObject:v14 forKey:v12];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v8);
  }

  v15 = objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke;
  v31[3] = &unk_265386850;
  id v35 = a1;
  id v16 = v6;
  id v32 = v16;
  id v17 = v15;
  id v33 = v17;
  v34 = v36;
  [v26 enumerateObjectsUsingBlock:v31];
  v18 = objc_opt_new();
  v19 = [MEMORY[0x263F08AB0] processInfo];
  v20 = [v19 environment];
  v21 = [v20 objectForKey:@"XCTestConfigurationFilePath"];
  BOOL v22 = v21 != 0;

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke_2;
  v27[3] = &unk_265386878;
  v29 = v36;
  BOOL v30 = v22;
  id v23 = v18;
  id v28 = v23;
  [v17 enumerateObjectsUsingBlock:v27];

  _Block_object_dispose(v36, 8);

  return v23;
}

void __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 56) _createCoreAnalyticsEventForLocation:a2 index:a3 muidsToResults:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v5];
  v4 = [v5 objectForKey:IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals];
  if ([v4 BOOLValue]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v4 setValue:v3 forKey:IQFMapsCoreAnalyticsFieldName_queryResultsHavePersonalizationSignals];

  if (!*(unsigned char *)(a1 + 48)) {
    AnalyticsSendEvent();
  }
  [*(id *)(a1 + 32) addObject:v4];
}

+ (id)_createCoreAnalyticsEventForLocation:(id)a3 index:(unint64_t)a4 muidsToResults:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_new();
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  [v9 setObject:v10 forKey:IQFMapsCoreAnalyticsFieldName_startingRank];

  v11 = [MEMORY[0x263F08AB0] processInfo];
  v12 = [v11 processName];
  [v9 setObject:v12 forKey:IQFMapsCoreAnalyticsFieldName_client];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v13 = [(id)objc_opt_class() BOOLeanCoreAnalyticsKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v53;
    uint64_t v17 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v13);
        }
        [v9 setObject:v17 forKey:*(void *)(*((void *)&v52 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v15);
  }

  v47 = v7;
  v19 = [v7 muid];
  v46 = v8;
  v20 = [v8 objectForKey:v19];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    char v24 = 0;
    uint64_t v25 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v28 = [v27 startEventDate];
        int v29 = [v28 isDateInTodayOrFuture];

        BOOL v30 = [v27 startEventDate];
        [v30 timeIntervalSinceNow];
        double v32 = v31;

        id v33 = [v27 dateOfLastVisit];
        [v33 timeIntervalSinceNow];
        double v35 = v34;

        double v36 = v32 / 3600.0;
        double v37 = v35 / -3600.0;
        switch([v27 resultType])
        {
          case 1:
            [v9 setObject:MEMORY[0x263EFFA88] forKey:IQFMapsCoreAnalyticsFieldName_hasLifeEvent];
            long long v38 = [v27 numberOfVisits];
            long long v39 = IQFMapsCoreAnalyticsFieldName_rawLifeEventVisitCount;
            long long v40 = IQFMapsCoreAnalyticsFieldName_lifeEventTimeSinceLastVisit;
            goto LABEL_29;
          case 2:
          case 3:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = IQFMapsCoreAnalyticsFieldName_hasUpcomingFlightReservation;
            break;
          case 4:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = IQFMapsCoreAnalyticsFieldName_hasUpcomingRestaurantReservation;
            break;
          case 5:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = IQFMapsCoreAnalyticsFieldName_hasUpcomingHotelReservation;
            break;
          case 6:
          case 7:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = IQFMapsCoreAnalyticsFieldName_hasUpcomingCarReservation;
            break;
          case 8:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingTicketReservation;
            break;
          case 9:
            if (!v29) {
              continue;
            }
            long long v38 = [NSNumber numberWithBool:1];
            long long v39 = IQFMapsCoreAnalyticsFieldName_hasUpcomingGenericCalendarEvent;
            break;
          case 10:
            [v9 setObject:MEMORY[0x263EFFA88] forKey:IQFMapsCoreAnalyticsFieldName_hasEntityRelevance];
            long long v41 = [v27 numberOfVisits];
            [v9 setObject:v41 forKey:IQFMapsCoreAnalyticsFieldName_decayedVisitCount];

            v42 = [v27 numberOfVisitsGivenLocation];
            [v9 setObject:v42 forKey:IQFMapsCoreAnalyticsFieldName_decayedVisitCountGivenCurrentLocation];

            long long v38 = [v27 entityRelevanceScore];
            long long v39 = IQFMapsCoreAnalyticsFieldName_entityRelevanceScore;
            long long v40 = IQFMapsCoreAnalyticsFieldName_timeSinceLastVisit;
            goto LABEL_29;
          default:
            continue;
        }
        double v37 = v36;
        long long v40 = IQFMapsCoreAnalyticsFieldName_timeToUpcomingEvent;
LABEL_29:
        [v9 setObject:v38 forKey:*v39];

        uint64_t v43 = [NSNumber numberWithDouble:v37];
        [v9 setObject:v43 forKey:*v40];

        char v24 = 1;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v23);
  }
  else
  {
    char v24 = 0;
  }

  v44 = [NSNumber numberWithBool:v24 & 1];
  [v9 setObject:v44 forKey:IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals];

  return v9;
}

+ (id)BOOLeanCoreAnalyticsKeys
{
  if (BOOLeanCoreAnalyticsKeys_onceToken != -1) {
    dispatch_once(&BOOLeanCoreAnalyticsKeys_onceToken, &__block_literal_global);
  }
  v2 = (void *)BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys;

  return v2;
}

void __54__IQFMapsCoreAnalyticsLogger_BOOLeanCoreAnalyticsKeys__block_invoke()
{
  v2[10] = *MEMORY[0x263EF8340];
  v2[0] = IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals;
  v2[1] = IQFMapsCoreAnalyticsFieldName_queryResultsHavePersonalizationSignals;
  v2[2] = IQFMapsCoreAnalyticsFieldName_hasLifeEvent;
  v2[3] = IQFMapsCoreAnalyticsFieldName_hasEntityRelevance;
  v2[4] = IQFMapsCoreAnalyticsFieldName_hasUpcomingCarReservation[0];
  v2[5] = IQFMapsCoreAnalyticsFieldName_hasUpcomingFlightReservation[0];
  v2[6] = IQFMapsCoreAnalyticsFieldName_hasUpcomingGenericCalendarEvent[0];
  v2[7] = IQFMapsCoreAnalyticsFieldName_hasUpcomingHotelReservation[0];
  v2[8] = IQFMapsCoreAnalyticsFieldName_hasUpcomingRestaurantReservation[0];
  v2[9] = IQFMapsCoreAnalyticsFieldName_hasUpcomingTicketReservation;
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:10];
  v1 = (void *)BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys;
  BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys = v0;
}

@end