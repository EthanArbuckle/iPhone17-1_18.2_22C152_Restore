@interface ATXMMAppPredictionExpert
+ (BOOL)isExpertEnabledForPredictions;
+ (BOOL)shouldHandleTriggerEventWithRateLimiter:(id)a3;
+ (BOOL)shouldPredicateOnStartDateForTrigger;
+ (Class)supportedAnchorClass;
+ (NSString)notificationIdentifier;
+ (NSString)pathToPredictionTable;
+ (id)anchorTypeForExpert;
+ (id)correlateTriggerEvents:(id)a3 withAppLaunches:(id)a4;
+ (id)createTrainingDataForSubExpertsWithCorrelatedEvents:(id)a3;
+ (id)fetchAnchorOccurrences;
+ (id)fetchPredictionsForTriggerEvent:(id)a3;
+ (id)predictionTable;
+ (id)predictionTableFromCache;
+ (id)sampleEventForExpert;
+ (id)trainSubExpertWithCorrelatedEvents:(id)a3 appLaunchCountedSet:(id)a4;
+ (int)mmAnchorTypeToMMProtobufAnchor:(int64_t)a3;
+ (int64_t)dateBufferForTriggerEvent;
+ (unsigned)predictionReasonForExpert;
+ (void)broadcastMMPredictionsForEvent:(id)a3 predictions:(id)a4;
+ (void)fetchAnchorOccurrences;
+ (void)fetchAndHandleTriggerEvent;
+ (void)logPredictedCountMMMetricsEntryForAnchorType:(int64_t)a3 numPredictions:(int)a4;
+ (void)logPredictedScoreMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 score:(double)a5;
+ (void)logTriggeredMMMetricsEntryForAnchorType:(int64_t)a3;
+ (void)predictionTableFromCache;
+ (void)serializeAndWritePredictionTable:(id)a3;
+ (void)setupEventListenerForInferenceWithContext:(id)a3 rateLimiter:(id)a4;
+ (void)tagEventWithLOIForEvent:(id)a3;
+ (void)trainExpertWithAppLaunchEvents:(id)a3 appLaunchCountedSet:(id)a4;
+ (void)trainSubExpertWithCorrelatedEvents:(id)a3 indices:(id)a4 predicates:(id)a5 appLaunchCountedSet:(id)a6 predictionTable:(id)a7;
+ (void)trainSubExpertsWithTrainingData:(id)a3 correlatedEvents:(id)a4 appLaunchCountedSet:(id)a5;
- (ATXMMAppPredictionExpert)init;
@end

@implementation ATXMMAppPredictionExpert

- (ATXMMAppPredictionExpert)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXMMAppPredictionExpert;
  v2 = [(ATXMMAppPredictionExpert *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_contextHelper;
    _contextHelper = v3;
  }
  return v2;
}

+ (Class)supportedAnchorClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXMMAppPredictionExpert.m" lineNumber:76 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (id)sampleEventForExpert
{
  [(id)objc_opt_class() supportedAnchorClass];
  v2 = objc_opt_new();
  uint64_t v3 = [(id)objc_opt_class() sampleEvent];

  return v3;
}

+ (id)anchorTypeForExpert
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType");
  return +[ATXAnchor anchorTypeToString:v2];
}

+ (unsigned)predictionReasonForExpert
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXMMAppPredictionExpert.m" lineNumber:93 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (NSString)pathToPredictionTable
{
  uint64_t v2 = [MEMORY[0x1E4F4B650] magicalMomentsPredictionTablesRootDirectory];
  uint64_t v3 = [(id)objc_opt_class() anchorTypeForExpert];
  v4 = (void *)[[NSString alloc] initWithFormat:@"ATXMMPredictionTable-%@", v3];
  v5 = [v2 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

+ (NSString)notificationIdentifier
{
  uint64_t v2 = [(id)objc_opt_class() anchorTypeForExpert];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"com.apple.duetexpertd.ATXMMAppPredictor.%@", v2];

  return (NSString *)v3;
}

+ (BOOL)isExpertEnabledForPredictions
{
  uint64_t v2 = +[_ATXGlobals sharedInstance];
  uint64_t v3 = [v2 magicalMomentsEnabledPredictionExperts];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 objectForKey:v5];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

+ (id)fetchAnchorOccurrences
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [(id)objc_opt_class() supportedAnchorClass];
  v4 = objc_opt_new();
  v17 = (void *)v3;
  v18 = (void *)v2;
  v5 = [(id)objc_opt_class() fetchAnchorOccurrencesBetweenStartDate:v2 endDate:v3];
  objc_super v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(id)objc_opt_class() anchorTypeForExpert];
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    __int16 v26 = 2048;
    uint64_t v27 = [v5 count];
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXMM: (%@) num anchor events: %lu.", buf, 0x16u);
  }
  v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ATXMMAppPredictionExpert fetchAnchorOccurrences]();
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        v15 = __atxlog_handle_default();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_debug_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEBUG, "ATXMM: %@", buf, 0xCu);
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v9;
}

+ (BOOL)shouldPredicateOnStartDateForTrigger
{
  uint64_t v2 = (void *)[(id)objc_opt_class() supportedAnchorClass];
  return [v2 shouldPredicateOnStartDate];
}

+ (int64_t)dateBufferForTriggerEvent
{
  return [(id)objc_opt_class() shouldPredicateOnStartDateForTrigger] ^ 1;
}

+ (id)correlateTriggerEvents:(id)a3 withAppLaunches:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    v7 = -[ATXCorrelatedEventsDateBuffer initWithBufferSeconds:andBufferType:]([ATXCorrelatedEventsDateBuffer alloc], "initWithBufferSeconds:andBufferType:", [(id)objc_opt_class() dateBufferForTriggerEvent], 120.0);
    v8 = [[ATXCorrelatedEventsDateBuffer alloc] initWithBufferSeconds:0 andBufferType:0.0];
    id v9 = [ATXCorrelatedEventsManager alloc];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(ATXCorrelatedEventsManager *)v9 initWithFirstEventType:v10 firstEventTypeDateBuffer:v7 secondEventType:objc_opt_class() secondEventTypeDateBuffer:v8];
    [(ATXCorrelatedEventsManager *)v11 insertEvents:v5 forEventType:0];
    [(ATXCorrelatedEventsManager *)v11 insertEvents:v6 forEventType:1];
    uint64_t v12 = [(ATXCorrelatedEventsManager *)v11 correlatedEvents];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (void)tagEventWithLOIForEvent:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldPredicateOnStartDateForTrigger]) {
    [v3 startDate];
  }
  else {
  v4 = [v3 endDate];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v4 sinceDate:-43200.0];
  v7 = (void *)[v5 initWithStartDate:v6 duration:86400.0];

  v8 = +[ATXMagicalMomentsContexts locationOfInterestForDate:v4 dateIntervalForSearch:v7];
  if (v8)
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[ATXMMAppPredictionExpert tagEventWithLOIForEvent:]();
    }

    uint64_t v10 = [v8 uuid];
    [v3 tagWithLocationOfInterestIdentifier:v10];
  }
}

+ (id)createTrainingDataForSubExpertsWithCorrelatedEvents:(id)a3
{
  v58[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v52 = objc_opt_new();
  v56 = objc_opt_new();
  v4 = objc_opt_new();
  id v5 = objc_opt_new();
  v54 = objc_opt_new();
  id v6 = +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:](ATXMagicalMomentsContexts, "timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:", 6, [(id)objc_opt_class() shouldPredicateOnStartDateForTrigger]);
  v7 = +[ATXMagicalMomentsContexts partOfWeekPredicatesUsingStartDate:](ATXMagicalMomentsContexts, "partOfWeekPredicatesUsingStartDate:", [(id)objc_opt_class() shouldPredicateOnStartDateForTrigger]);
  if ([v3 count])
  {
    unint64_t v8 = 0;
    v50 = v3;
    v51 = v6;
    v53 = v4;
    v49 = v5;
    do
    {
      id v9 = (void *)MEMORY[0x1D25F6CC0]();
      v55 = [v3 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v55 firstEvent];
      v57 = [v10 identifier];
      if (([v52 containsObject:v10] & 1) == 0)
      {
        [v52 addObject:v10];
        [(id)objc_opt_class() tagEventWithLOIForEvent:v10];
      }
      uint64_t v11 = [v56 objectForKeyedSubscript:v57];

      if (!v11)
      {
        uint64_t v12 = objc_opt_new();
        [v56 setObject:v12 forKeyedSubscript:v57];

        uint64_t v13 = objc_opt_new();
        [v53 setObject:v13 forKeyedSubscript:v57];

        if ([v51 count])
        {
          unint64_t v14 = 0;
          do
          {
            v15 = objc_opt_new();
            v16 = [v53 objectForKeyedSubscript:v57];
            v17 = [NSNumber numberWithUnsignedInteger:v14];
            [v16 setObject:v15 forKeyedSubscript:v17];

            ++v14;
          }
          while (v14 < [v51 count]);
        }
        v18 = objc_opt_new();
        [v49 setObject:v18 forKeyedSubscript:v57];

        if ([v7 count])
        {
          unint64_t v19 = 0;
          do
          {
            long long v20 = objc_opt_new();
            long long v21 = [v49 objectForKeyedSubscript:v57];
            long long v22 = [NSNumber numberWithUnsignedInteger:v19];
            [v21 setObject:v20 forKeyedSubscript:v22];

            ++v19;
          }
          while (v19 < [v7 count]);
        }
        v23 = objc_opt_new();
        [v54 setObject:v23 forKeyedSubscript:v57];

        id v5 = v49;
      }
      uint64_t v24 = [v10 locationIdentifierUUIDString];
      if (v24)
      {
        v25 = (void *)v24;
        __int16 v26 = [v54 objectForKeyedSubscript:v57];
        uint64_t v27 = [v10 locationIdentifierUUIDString];
        uint64_t v28 = [v26 objectForKeyedSubscript:v27];

        if (!v28)
        {
          v29 = objc_opt_new();
          v30 = [v54 objectForKeyedSubscript:v57];
          v31 = [v10 locationIdentifierUUIDString];
          [v30 setObject:v29 forKeyedSubscript:v31];
        }
      }
      v32 = [v56 objectForKeyedSubscript:v57];
      [v32 addIndex:v8];

      id v6 = v51;
      if ([v51 count])
      {
        uint64_t v33 = 0;
        while (1)
        {
          v34 = [v51 objectAtIndexedSubscript:v33];
          if ([v34 evaluateWithObject:v10]) {
            break;
          }

          if (++v33 >= (unint64_t)[v51 count]) {
            goto LABEL_22;
          }
        }
        v35 = [v53 objectForKeyedSubscript:v57];
        v36 = [NSNumber numberWithUnsignedInteger:v33];
        v37 = [v35 objectForKeyedSubscript:v36];
        [v37 addIndex:v8];
      }
LABEL_22:
      if ([v7 count])
      {
        uint64_t v38 = 0;
        while (1)
        {
          v39 = [v7 objectAtIndexedSubscript:v38];
          if ([v39 evaluateWithObject:v10]) {
            break;
          }

          if (++v38 >= (unint64_t)[v7 count]) {
            goto LABEL_28;
          }
        }
        v40 = [v5 objectForKeyedSubscript:v57];
        v41 = [NSNumber numberWithUnsignedInteger:v38];
        v42 = [v40 objectForKeyedSubscript:v41];
        [v42 addIndex:v8];
      }
LABEL_28:
      v43 = [v10 locationIdentifierUUIDString];

      if (v43)
      {
        v44 = [v54 objectForKeyedSubscript:v57];
        v45 = [v10 locationIdentifierUUIDString];
        v46 = [v44 objectForKeyedSubscript:v45];
        [v46 addIndex:v8];
      }
      ++v8;
      id v3 = v50;
      v4 = v53;
    }
    while (v8 < [v50 count]);
  }
  v58[0] = v56;
  v58[1] = v4;
  v58[2] = v5;
  v58[3] = v54;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];

  return v47;
}

+ (void)trainSubExpertWithCorrelatedEvents:(id)a3 indices:(id)a4 predicates:(id)a5 appLaunchCountedSet:(id)a6 predictionTable:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [a3 objectsAtIndexes:a4];
  if (v15)
  {
    v16 = [a1 trainSubExpertWithCorrelatedEvents:v15 appLaunchCountedSet:v13];
    v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 count];
      unint64_t v19 = [v16 firstObject];
      int v20 = 134218242;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXMM: Got back %lu predictions for subexpert. Sample prediction: %@", (uint8_t *)&v20, 0x16u);
    }
    if (v12 && v16) {
      [v14 addPredictions:v16 withApplicablePredicates:v12];
    }
  }
}

+ (id)trainSubExpertWithCorrelatedEvents:(id)a3 appLaunchCountedSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ATXMagicalMomentsPredictionScorer alloc] initWithCorrelatedEvents:v6 andGlobalAppLaunchCountedSet:v5];

  unint64_t v8 = [(ATXMagicalMomentsPredictionScorer *)v7 generatePredictions];

  return v8;
}

+ (void)serializeAndWritePredictionTable:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v12 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v12];
  id v6 = v12;
  if (v5)
  {
    v7 = [(id)objc_opt_class() pathToPredictionTable];
    id v11 = 0;
    char v8 = [v5 writeToFile:v7 options:1073741825 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[ATXMMAppPredictionExpert serializeAndWritePredictionTable:]();
      }
    }
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXMMAppPredictionExpert serializeAndWritePredictionTable:]();
    }
  }
}

+ (void)trainSubExpertsWithTrainingData:(id)a3 correlatedEvents:(id)a4 appLaunchCountedSet:(id)a5
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v88 = a4;
  id v87 = a5;
  id v9 = [v8 objectAtIndexedSubscript:0];
  v83 = [v8 objectAtIndexedSubscript:1];
  v82 = [v8 objectAtIndexedSubscript:2];
  v75 = v8;
  v81 = [v8 objectAtIndexedSubscript:3];
  v86 = objc_opt_new();
  v85 = +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:](ATXMagicalMomentsContexts, "timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:", 6, [(id)objc_opt_class() shouldPredicateOnStartDateForTrigger]);
  id v89 = a1;
  v84 = +[ATXMagicalMomentsContexts partOfWeekPredicatesUsingStartDate:](ATXMagicalMomentsContexts, "partOfWeekPredicatesUsingStartDate:", [(id)objc_opt_class() shouldPredicateOnStartDateForTrigger]);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  obuint64_t j = v9;
  uint64_t v77 = [obj countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (v77)
  {
    uint64_t v76 = *(void *)v103;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v103 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = v10;
        uint64_t v11 = *(void *)(*((void *)&v102 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1D25F6CC0]();
        id v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = (void *)[(id)objc_opt_class() supportedAnchorClass];
          *(_DWORD *)buf = 138412546;
          v118 = v13;
          __int16 v119 = 2112;
          uint64_t v120 = v11;
          id v14 = v13;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training subexperts for event identifier %@", buf, 0x16u);
        }
        v15 = +[ATXMagicalMomentsContexts eventIdentifierPredicateForValue:v11];
        v16 = __atxlog_handle_default();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)[(id)objc_opt_class() supportedAnchorClass];
          *(_DWORD *)buf = 138412290;
          v118 = v17;
          id v18 = v17;
          _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Anchor ID expert", buf, 0xCu);
        }
        unint64_t v19 = __atxlog_handle_default();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v116 = v15;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
          *(_DWORD *)buf = 138412290;
          v118 = v71;
          _os_log_debug_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);
        }
        int v20 = [obj objectForKeyedSubscript:v11];
        v115 = v15;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
        [v89 trainSubExpertWithCorrelatedEvents:v88 indices:v20 predicates:v21 appLaunchCountedSet:v87 predictionTable:v86];

        __int16 v22 = __atxlog_handle_default();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)[(id)objc_opt_class() supportedAnchorClass];
          *(_DWORD *)buf = 138412290;
          v118 = v23;
          id v24 = v23;
          _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Time of Day experts", buf, 0xCu);
        }
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        v25 = [v83 objectForKeyedSubscript:v11];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v98 objects:v114 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v99 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              v31 = __atxlog_handle_default();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v113[0] = v15;
                v36 = objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v30, "integerValue"));
                v113[1] = v36;
                v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:2];
                *(_DWORD *)buf = 138412290;
                v118 = v37;
                _os_log_debug_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);
              }
              v32 = [v83 objectForKeyedSubscript:v11];
              uint64_t v33 = [v32 objectForKeyedSubscript:v30];
              v112[0] = v15;
              v34 = objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v30, "integerValue"));
              v112[1] = v34;
              v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
              [v89 trainSubExpertWithCorrelatedEvents:v88 indices:v33 predicates:v35 appLaunchCountedSet:v87 predictionTable:v86];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v98 objects:v114 count:16];
          }
          while (v27);
        }

        uint64_t v38 = __atxlog_handle_default();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)[(id)objc_opt_class() supportedAnchorClass];
          *(_DWORD *)buf = 138412290;
          v118 = v39;
          id v40 = v39;
          _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Part of Week experts", buf, 0xCu);
        }
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        v41 = [v82 objectForKeyedSubscript:v11];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v111 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v95 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              v47 = __atxlog_handle_default();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                v110[0] = v15;
                v52 = objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v46, "integerValue"));
                v110[1] = v52;
                v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
                *(_DWORD *)buf = 138412290;
                v118 = v53;
                _os_log_debug_impl(&dword_1D0FA3000, v47, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);
              }
              v48 = [v82 objectForKeyedSubscript:v11];
              v49 = [v48 objectForKeyedSubscript:v46];
              v109[0] = v15;
              v50 = objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v46, "integerValue"));
              v109[1] = v50;
              v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
              [v89 trainSubExpertWithCorrelatedEvents:v88 indices:v49 predicates:v51 appLaunchCountedSet:v87 predictionTable:v86];
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v94 objects:v111 count:16];
          }
          while (v43);
        }

        v54 = __atxlog_handle_default();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = (void *)[(id)objc_opt_class() supportedAnchorClass];
          *(_DWORD *)buf = 138412290;
          v118 = v55;
          id v56 = v55;
          _os_log_impl(&dword_1D0FA3000, v54, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training LOI experts", buf, 0xCu);
        }
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        v57 = [v81 objectForKeyedSubscript:v11];
        uint64_t v58 = [v57 countByEnumeratingWithState:&v90 objects:v108 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v91;
          do
          {
            uint64_t v61 = 0;
            do
            {
              if (*(void *)v91 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = *(void *)(*((void *)&v90 + 1) + 8 * v61);
              v63 = +[ATXMagicalMomentsContexts loiPredicateForUUIDString:v62];
              v64 = __atxlog_handle_default();
              v65 = v64;
              if (v63)
              {
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                {
                  v107[0] = v15;
                  v107[1] = v63;
                  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
                  *(_DWORD *)buf = 138412290;
                  v118 = v68;
                  _os_log_debug_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);
                }
                v65 = [v81 objectForKeyedSubscript:v11];
                id v66 = [v65 objectForKeyedSubscript:v62];
                v106[0] = v15;
                v106[1] = v63;
                v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
                [v89 trainSubExpertWithCorrelatedEvents:v88 indices:v66 predicates:v67 appLaunchCountedSet:v87 predictionTable:v86];

                goto LABEL_45;
              }
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                v69 = (void *)[(id)objc_opt_class() supportedAnchorClass];
                *(_DWORD *)buf = 138412546;
                v118 = v69;
                __int16 v119 = 2112;
                uint64_t v120 = v62;
                id v66 = v69;
                _os_log_fault_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_FAULT, "ATXMM: (%@) Couldn't produce a predicate for the provided LOI UUID string: %@", buf, 0x16u);
LABEL_45:
              }
              ++v61;
            }
            while (v59 != v61);
            uint64_t v70 = [v57 countByEnumeratingWithState:&v90 objects:v108 count:16];
            uint64_t v59 = v70;
          }
          while (v70);
        }

        uint64_t v10 = v80 + 1;
      }
      while (v80 + 1 != v77);
      uint64_t v77 = [obj countByEnumeratingWithState:&v102 objects:v121 count:16];
    }
    while (v77);
  }

  v72 = __atxlog_handle_default();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    v73 = (void *)[(id)objc_opt_class() supportedAnchorClass];
    *(_DWORD *)buf = 138412290;
    v118 = v73;
    id v74 = v73;
    _os_log_impl(&dword_1D0FA3000, v72, OS_LOG_TYPE_INFO, "ATXMM: (%@) Writing out prediction table.", buf, 0xCu);
  }
  [(id)objc_opt_class() serializeAndWritePredictionTable:v86];
}

+ (void)trainExpertWithAppLaunchEvents:(id)a3 appLaunchCountedSet:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25F6CC0]();
  if (v6)
  {
    uint64_t v9 = [v6 count];
    if (v7)
    {
      if (v9 && [v7 count])
      {
        uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v11 = [a1 pathToPredictionTable];
        id v33 = 0;
        id v12 = [v10 attributesOfItemAtPath:v11 error:&v33];
        id v13 = v33;

        if (v12 && !v13)
        {
          id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
          if (v14)
          {
            v15 = objc_opt_new();
            [v15 timeIntervalSinceDate:v14];
            double v17 = v16;

            if (v17 < 43200.0)
            {
              id v18 = __atxlog_handle_default();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v19 = [(id)objc_opt_class() anchorTypeForExpert];
                *(_DWORD *)buf = 138412802;
                v35 = v19;
                __int16 v36 = 2112;
                uint64_t v37 = (uint64_t)v14;
                __int16 v38 = 2048;
                uint64_t v39 = 0x40E5180000000000;
                _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) prediction table was last written to on %@, which is less than %f seconds ago. Skipping training", buf, 0x20u);
              }
LABEL_21:

              goto LABEL_22;
            }
          }
        }
        id v14 = [(id)objc_opt_class() fetchAnchorOccurrences];
        id v18 = [(id)objc_opt_class() correlateTriggerEvents:v14 withAppLaunches:v6];
        int v20 = __atxlog_handle_default();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [(id)objc_opt_class() anchorTypeForExpert];
          uint64_t v22 = [v18 count];
          *(_DWORD *)buf = 138412546;
          v35 = v21;
          __int16 v36 = 2048;
          uint64_t v37 = v22;
          _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_INFO, "ATXMM: (%@) num correlated events: %lu.", buf, 0x16u);
        }
        v23 = [(id)objc_opt_class() createTrainingDataForSubExpertsWithCorrelatedEvents:v18];
        id v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          [(id)objc_opt_class() anchorTypeForExpert];
          v32 = v23;
          v25 = v18;
          uint64_t v26 = v14;
          v28 = uint64_t v27 = v12;
          *(_DWORD *)buf = 138412290;
          v35 = v28;
          _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_INFO, "ATXMM: (%@) Finished generating data for training sub-experts.", buf, 0xCu);

          id v12 = v27;
          id v14 = v26;
          id v18 = v25;
          v23 = v32;
        }

        [(id)objc_opt_class() trainSubExpertsWithTrainingData:v23 correlatedEvents:v18 appLaunchCountedSet:v7];
        v29 = __atxlog_handle_default();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          [(id)objc_opt_class() anchorTypeForExpert];
          v31 = v30 = v12;
          *(_DWORD *)buf = 138412290;
          v35 = v31;
          _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "ATXMM: (%@) Completed training of all sub-experts, and, thus, of the expert.", buf, 0xCu);

          id v12 = v30;
        }

        goto LABEL_21;
      }
    }
  }
  id v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:]();
  }
LABEL_22:
}

+ (id)predictionTable
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 predictionTableFromCache];
}

+ (id)predictionTableFromCache
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v3 = [(id)objc_opt_class() pathToPredictionTable];
  id v15 = 0;
  v4 = [v2 dataWithContentsOfFile:v3 options:0 error:&v15];
  id v5 = v15;

  if (v4)
  {
    id v6 = (void *)MEMORY[0x1D25F6CC0]();
    id v14 = v5;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v14];
    id v8 = v14;

    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[ATXMMAppPredictionExpert predictionTableFromCache]();
      }

      id v9 = (id)objc_opt_new();
    }
    uint64_t v11 = v9;

    id v5 = v8;
  }
  else
  {
    if ([v5 code] != 260)
    {
      uint64_t v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[ATXMMAppPredictionExpert predictionTableFromCache]();
      }
    }
    uint64_t v11 = objc_opt_new();
  }

  return v11;
}

+ (BOOL)shouldHandleTriggerEventWithRateLimiter:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [(id)objc_opt_class() supportedAnchorClass];
  v4 = objc_opt_new();
  int v5 = [v3 tryToIncrementCountAndReturnSuccess];

  int v6 = [(id)objc_opt_class() shouldProcessContextStoreNotification];
  int v7 = [(id)objc_opt_class() isExpertEnabledForPredictions];
  int v8 = v7;
  if (v5)
  {
    if (v6 & v7)
    {
      BOOL v9 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[ATXMMAppPredictionExpert shouldHandleTriggerEventWithRateLimiter:]();
    }
  }
  uint64_t v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(id)objc_opt_class() anchorTypeForExpert];
    id v13 = (void *)v12;
    id v14 = @"NO";
    if (v6) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    int v18 = 138413058;
    uint64_t v19 = v12;
    if (v8) {
      double v16 = @"YES";
    }
    else {
      double v16 = @"NO";
    }
    uint64_t v21 = v15;
    __int16 v20 = 2112;
    __int16 v22 = 2112;
    if (v5) {
      id v14 = @"YES";
    }
    v23 = v16;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) shouldHandleTriggerEvent returned NO for reasons: shouldProcessContextStoreNotification - %@ predictionExpertIsEnabled - %@ notRateLimited - %@", (uint8_t *)&v18, 0x2Au);
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

+ (void)setupEventListenerForInferenceWithContext:(id)a3 rateLimiter:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:]();
  }

  objc_initWeak(&location, a1);
  objc_initWeak(&from, v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__ATXMMAppPredictionExpert_setupEventListenerForInferenceWithContext_rateLimiter___block_invoke;
  aBlock[3] = &unk_1E68AC818;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(v21, &from);
  v21[1] = a1;
  BOOL v9 = _Block_copy(aBlock);
  uint64_t v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [(id)objc_opt_class() anchorTypeForExpert];
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "ATXMM: (%@) Registering for trigger callbacks", buf, 0xCu);
  }
  [(id)objc_opt_class() supportedAnchorClass];
  uint64_t v12 = objc_opt_new();
  id v13 = [(id)objc_opt_class() predicateForContextStoreRegistration];
  id v14 = (void *)MEMORY[0x1E4F5B6C8];
  id v15 = [(id)objc_opt_class() notificationIdentifier];
  double v16 = [v14 localWakingRegistrationWithIdentifier:v15 contextualPredicate:v13 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v9];

  [v6 registerCallback:v16];
  double v17 = __atxlog_handle_default();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [(id)objc_opt_class() anchorTypeForExpert];
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Done registering with the ContextStore.", buf, 0xCu);
  }
  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __82__ATXMMAppPredictionExpert_setupEventListenerForInferenceWithContext_rateLimiter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(id)objc_opt_class() anchorTypeForExpert];
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Trigger listener called, %@", (uint8_t *)&v9, 0x16u);
  }
  +[ATXMMAppPredictionExpert logTriggeredMMMetricsEntryForAnchorType:](ATXMMAppPredictionExpert, "logTriggeredMMMetricsEntryForAnchorType:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType"));
  if (WeakRetained
    && v6
    && [(id)objc_opt_class() shouldHandleTriggerEventWithRateLimiter:v6])
  {
    [(id)objc_opt_class() fetchAndHandleTriggerEvent];
  }
}

+ (id)fetchPredictionsForTriggerEvent:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() predictionTable];
  int v5 = [v4 predictionsForTriggerEvent:v3];

  return v5;
}

+ (void)broadcastMMPredictionsForEvent:(id)a3 predictions:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() predictionReasonForExpert];
  int v8 = +[ATXMagicalMomentsPrediction convertPredictionsToPMMPredictionItems:reason:anchor:triggerEvent:](ATXMagicalMomentsPrediction, "convertPredictionsToPMMPredictionItems:reason:anchor:triggerEvent:", v5, v7, objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType"), v6);

  int v9 = [MEMORY[0x1E4F93880] sharedInstance];
  [v9 handlePredictedApplications:v8];
  uint64_t v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [(id)objc_opt_class() anchorTypeForExpert];
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Broadcast MM predictions to all listeners.", (uint8_t *)&v12, 0xCu);
  }
}

+ (void)fetchAndHandleTriggerEvent
{
  v0 = [(id)objc_opt_class() anchorTypeForExpert];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v1, v2, "ATXMM: (%@) - fetchAndHandleTriggerEvent. Failed to initialize a DuetEvent for the trigger from the ContextStore. Exiting before vending predictions.", v3, v4, v5, v6, v7);
}

+ (void)logTriggeredMMMetricsEntryForAnchorType:(int64_t)a3
{
  id v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a3));
  uint64_t v4 = +[_ATXAppPredictor sharedInstance];
  uint64_t v5 = [v4 abGroupIdentifiers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:16];

  [v8 setAbGroup:v6];
  uint8_t v7 = [MEMORY[0x1E4F93728] sharedInstance];
  [v7 trackScalarForMessage:v8];
}

+ (void)logPredictedScoreMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 score:(double)a5
{
  id v7 = a3;
  id v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
  [v12 setTopBundleId:v7];

  id v8 = +[_ATXAppPredictor sharedInstance];
  int v9 = [v8 abGroupIdentifiers];
  uint64_t v10 = [v9 objectAtIndexedSubscript:16];

  [v12 setAbGroup:v10];
  __int16 v11 = [MEMORY[0x1E4F93728] sharedInstance];
  [v11 trackDistributionForMessage:v12 value:a5];
}

+ (void)logPredictedCountMMMetricsEntryForAnchorType:(int64_t)a3 numPredictions:(int)a4
{
  id v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a3));
  uint64_t v6 = +[_ATXAppPredictor sharedInstance];
  id v7 = [v6 abGroupIdentifiers];
  id v8 = [v7 objectAtIndexedSubscript:16];

  [v10 setAbGroup:v8];
  int v9 = [MEMORY[0x1E4F93728] sharedInstance];
  [v9 trackDistributionForMessage:v10 value:(double)a4];
}

+ (int)mmAnchorTypeToMMProtobufAnchor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0x11) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (void)fetchAnchorOccurrences
{
  v0 = [(id)objc_opt_class() anchorTypeForExpert];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "ATXMM: (%@) Descriptions of found anchors:", v3, v4, v5, v6, v7);
}

+ (void)tagEventWithLOIForEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() anchorTypeForExpert];
  uint64_t v3 = [v1 uuid];
  [v1 type];
  OUTLINED_FUNCTION_4_1();
  uint8_t v7 = v1;
  __int16 v8 = v4;
  int v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXMM: (%@) Fetching LOI for anchor event. LOI found for event: %@, uuid: %@, type: %ld", v6, 0x2Au);
}

+ (void)serializeAndWritePredictionTable:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (void *)[(id)objc_opt_class() supportedAnchorClass];
  id v1 = OUTLINED_FUNCTION_2_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "ATXMM: (%@) Unable to serialize prediction table. Error: %@", v4, v5, v6, v7, v8);
}

+ (void)serializeAndWritePredictionTable:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = (void *)[(id)objc_opt_class() supportedAnchorClass];
  id v2 = OUTLINED_FUNCTION_2_2(v1);
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXMM: (%@) Could not write prediction table data for expert. Error: %@", v3, 0x16u);
}

+ (void)trainExpertWithAppLaunchEvents:appLaunchCountedSet:.cold.1()
{
  [(id)objc_opt_class() supportedAnchorClass];
  OUTLINED_FUNCTION_1();
  id v1 = v0;
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "ATXMM: (%@) Error: Tried to initialize training for expert without providing App Launch Events or App Launch Counted Set", v4, v5, v6, v7, v8);
}

+ (void)predictionTableFromCache
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXMM: Unable to get prediction table: %@", v1, 0xCu);
}

+ (void)shouldHandleTriggerEventWithRateLimiter:.cold.1()
{
  os_log_t v0 = [(id)objc_opt_class() anchorTypeForExpert];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v1, v2, "ATXMM: Encountered rate limit when trying to process %@ anchor occurrence.", v3, v4, v5, v6, v7);
}

+ (void)setupEventListenerForInferenceWithContext:rateLimiter:.cold.1()
{
  os_log_t v0 = [(id)objc_opt_class() anchorTypeForExpert];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "ATXMM: (%@) Setting up the trigger event listener.", v3, v4, v5, v6, v7);
}

@end