@interface ATXBlendingLayerSessionLogger
- (ATXBlendingLayerSessionLogger)init;
- (ATXBlendingLayerSessionLogger)initWithTracker:(id)a3 hyperParameters:(id)a4;
- (BOOL)logCurrentSessionIfPossible;
- (BOOL)shouldLogSession;
- (NSArray)blendingEvents;
- (NSArray)clientModelEvents;
- (NSArray)ermEvents;
- (NSArray)predictionContextEvents;
- (NSArray)uiEvents;
- (NSDate)now;
- (id)clientModelCacheUpdatesFromBlendingCacheUpdate:(id)a3;
- (id)clientModelPublisher;
- (id)generateSessionLog;
- (id)orderedMergeERMBlendingContextUIPublisher;
- (id)sessionBlendingUpdateFromBlendingUICacheUpdate:(id)a3 deviceContext:(id)a4;
- (id)sessionClientModelUpdatesForUICacheUpdate:(id)a3;
- (id)sessionDeviceContextFromPredictionContext:(id)a3;
- (id)sessionERMEventFromERMEvent:(id)a3;
- (id)sessionSuggestionFromProactiveSuggestion:(id)a3;
- (id)sessionUICacheForUICacheUpdate:(id)a3;
- (int)locationTypeFromLocationOfInterest:(id)a3;
- (void)logSessionLogToPET:(id)a3;
- (void)setBlendingEvents:(id)a3;
- (void)setClientModelEvents:(id)a3;
- (void)setErmEvents:(id)a3;
- (void)setNow:(id)a3;
- (void)setPredictionContextEvents:(id)a3;
- (void)setUiEvents:(id)a3;
@end

@implementation ATXBlendingLayerSessionLogger

- (ATXBlendingLayerSessionLogger)init
{
  v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4F93550] sharedInstance];
  v5 = [(ATXBlendingLayerSessionLogger *)self initWithTracker:v3 hyperParameters:v4];

  return v5;
}

- (ATXBlendingLayerSessionLogger)initWithTracker:(id)a3 hyperParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXBlendingLayerSessionLogger;
  v9 = [(ATXBlendingLayerSessionLogger *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracker, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
    uint64_t v11 = objc_opt_new();
    mostRecentBlendingCacheUpdateByConsumerSubType = v10->_mostRecentBlendingCacheUpdateByConsumerSubType;
    v10->_mostRecentBlendingCacheUpdateByConsumerSubType = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (BOOL)logCurrentSessionIfPossible
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(ATXBlendingLayerSessionLogger *)self shouldLogSession];
  v5 = __atxlog_handle_blending();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Logging session because logger said we can.", (uint8_t *)&v15, 2u);
    }

    sel_getName(a2);
    v5 = os_transaction_create();
    id v7 = [(ATXBlendingLayerSessionLogger *)self generateSessionLog];
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "SessionLog: %@", (uint8_t *)&v15, 0xCu);
    }

    v9 = [v7 blendingUpdates];
    if ([v9 count])
    {
    }
    else
    {
      uint64_t v11 = [v7 ermEvents];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        objc_super v14 = __atxlog_handle_blending();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Not forwarding session log proto to PET because it was empty", (uint8_t *)&v15, 2u);
        }

        BOOL v10 = 0;
        goto LABEL_13;
      }
    }
    [(ATXBlendingLayerSessionLogger *)self logSessionLogToPET:v7];
    BOOL v10 = 1;
LABEL_13:

    goto LABEL_14;
  }
  if (v6)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Not logging session because session logger said not to.", (uint8_t *)&v15, 2u);
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)shouldLogSession
{
  [(ATXBlendingLayerHyperParameters *)self->_hyperParameters sessionLogSamplingRate];
  return +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:");
}

- (void)logSessionLogToPET:(id)a3
{
}

- (id)generateSessionLog
{
  v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  v5 = objc_opt_new();
  BOOL v6 = objc_opt_new();
  id v7 = [(ATXBlendingLayerSessionLogger *)self orderedMergeERMBlendingContextUIPublisher];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2;
  v16 = &unk_1E68B0798;
  uint64_t v17 = self;
  id v18 = v4;
  id v19 = v6;
  id v20 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v4;
  id v11 = (id)[v7 sinkWithCompletion:&__block_literal_global_94 receiveInput:&v13];
  objc_msgSend(v3, "setErmEvents:", v10, v13, v14, v15, v16, v17);
  [v3 setBlendingUpdates:v8];

  return v3;
}

void __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5 = NSNumber;
    id v6 = v3;
    id v7 = objc_msgSend(v5, "numberWithUnsignedChar:", objc_msgSend(v6, "consumerSubType"));
    [v4 setObject:v6 forKey:v7];

LABEL_3:
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v3);
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v3 homeScreenEvent];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)[*(id *)(a1 + 40) count] > 0x13) {
      goto LABEL_23;
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) sessionERMEventFromERMEvent:v3];
    [v11 addObject:v12];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allValues", 0);
    uint64_t v13 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v18 = *(void **)(a1 + 48);
          id v19 = [v17 uuid];
          LOBYTE(v18) = [v18 containsObject:v19];

          if ((v18 & 1) == 0)
          {
            id v20 = [*(id *)(a1 + 32) sessionBlendingUpdateFromBlendingUICacheUpdate:v17 deviceContext:*(void *)(*(void *)(a1 + 32) + 16)];
            [*(id *)(a1 + 56) addObject:v20];
            v21 = *(void **)(a1 + 48);
            v22 = [v17 uuid];
            [v21 addObject:v22];
          }
        }
        uint64_t v14 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
    goto LABEL_3;
  }
  v23 = __atxlog_handle_blending();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2_cold_1(v23);
  }

LABEL_23:
}

- (id)orderedMergeERMBlendingContextUIPublisher
{
  v27[3] = *MEMORY[0x1E4F143B8];
  if (self->_ermEvents)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:self->_ermEvents];
  }
  else
  {
    BOOL v4 = objc_opt_new();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-1200.0];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;

    v3 = [v4 publisherFromStartTime:v7];
  }
  if (self->_blendingEvents)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:self->_blendingEvents];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2400.0];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    uint64_t v8 = [v9 publisherFromStartTime:v12];
  }
  if (self->_predictionContextEvents)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:self->_predictionContextEvents];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2400.0];
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;

    uint64_t v13 = [v14 publisherFromStartTime:v17];
  }
  if (self->_uiEvents)
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:self->_uiEvents];
  }
  else
  {
    id v19 = objc_opt_new();
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2400.0];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    id v18 = [v19 genericEventPublisherFromStartTime:v22];
  }
  v23 = [v18 filterWithIsIncluded:&__block_literal_global_30_0];
  v27[0] = v8;
  v27[1] = v13;
  v27[2] = v23;
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  long long v25 = [v3 orderedMergeWithOthers:v24 comparator:&__block_literal_global_34];

  return v25;
}

uint64_t __74__ATXBlendingLayerSessionLogger_orderedMergeERMBlendingContextUIPublisher__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 homeScreenEvent];
    BOOL v4 = v3;
    if (v3)
    {
      v5 = [v3 eventTypeString];
      uint64_t v6 = [v5 isEqualToString:@"DeviceLocked"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __74__ATXBlendingLayerSessionLogger_orderedMergeERMBlendingContextUIPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)sessionERMEventFromERMEvent:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 entry];
  uint64_t v7 = [v6 engagementRecordType];

  if (v7 <= 119)
  {
    if (v7 <= 15)
    {
      switch(v7)
      {
        case 1:
          double v8 = v5;
          uint64_t v9 = 0;
          goto LABEL_28;
        case 2:
          goto LABEL_27;
        case 4:
          double v8 = v5;
          uint64_t v9 = 3;
          goto LABEL_28;
        case 8:
          id v10 = (void *)MEMORY[0x1E4F4B680];
          uint64_t v11 = 36;
          goto LABEL_26;
        default:
          goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (v7 == 16)
    {
      id v10 = (void *)MEMORY[0x1E4F4B680];
      uint64_t v11 = 37;
      goto LABEL_26;
    }
    if (v7 != 32)
    {
      if (v7 != 64) {
        goto LABEL_29;
      }
      id v10 = (void *)MEMORY[0x1E4F4B680];
      uint64_t v11 = 35;
      goto LABEL_26;
    }
LABEL_17:
    id v10 = (void *)MEMORY[0x1E4F4B680];
    uint64_t v11 = 21;
LABEL_26:
    uint64_t v13 = [v10 stringForConsumerSubtype:v11];
    [v5 setConsumerSubType:v13];

LABEL_27:
    double v8 = v5;
    uint64_t v9 = 1;
LABEL_28:
    [v8 setEngagementType:v9];
    goto LABEL_29;
  }
  if (v7 <= 255)
  {
    if (v7 == 120) {
      goto LABEL_27;
    }
    if (v7 != 121)
    {
      if (v7 != 128) {
        goto LABEL_29;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (v7 <= 895)
    {
      if (v7 != 256 && v7 != 512) {
        goto LABEL_29;
      }
      goto LABEL_17;
    }
    if (v7 != 896 && v7 != 1021) {
      goto LABEL_29;
    }
  }
  double v12 = __atxlog_handle_blending();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[ATXBlendingLayerSessionLogger sessionERMEventFromERMEvent:](v4, v12);
  }

LABEL_29:
  uint64_t v14 = (void *)MEMORY[0x1E4F93938];
  uint64_t v15 = [v4 entry];
  double v16 = [v15 executable];
  double v17 = [v16 object];
  id v18 = [v14 genericStringForExecutableObject:v17];
  [v5 setExecutableId:v18];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = [(NSMutableDictionary *)self->_mostRecentBlendingCacheUpdateByConsumerSubType allValues];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = [*(id *)(*((void *)&v27 + 1) + 8 * i) uuid];
        long long v25 = [v24 UUIDString];
        [v5 addBlendingUpdateUUID:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v21);
  }

  return v5;
}

- (id)sessionBlendingUpdateFromBlendingUICacheUpdate:(id)a3 deviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_new();
  uint64_t v9 = [v6 uuid];
  id v10 = [v9 UUIDString];
  [v8 setBlendingUpdateUUID:v10];

  uint64_t v11 = [(ATXBlendingLayerHyperParameters *)self->_hyperParameters abGroup];
  [v8 setBlendingABGroup:v11];

  double v12 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v6, "consumerSubType"));
  [v8 setConsumerSubType:v12];

  uint64_t v13 = [(ATXBlendingLayerSessionLogger *)self sessionClientModelUpdatesForUICacheUpdate:v6];
  [v8 setClientModelUpdates:v13];

  uint64_t v14 = [(ATXBlendingLayerSessionLogger *)self sessionUICacheForUICacheUpdate:v6];
  [v8 setUiCache:v14];

  uint64_t v15 = [(ATXBlendingLayerSessionLogger *)self sessionDeviceContextFromPredictionContext:v7];
  [v8 setDeviceContext:v15];

  if (v7)
  {
    double v16 = [v6 cacheCreationDate];
    double v17 = [v7 timeContext];
    id v18 = [v17 date];
    [v16 timeIntervalSinceDate:v18];
    double v20 = v19;
    uint64_t v21 = [v8 deviceContext];
    [v21 setSecondsBeforeBlendingUpdate:v20];
  }
  else
  {
    double v16 = [v8 deviceContext];
    [v16 setSecondsBeforeBlendingUpdate:0.0];
  }

  return v8;
}

- (int)locationTypeFromLocationOfInterest:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (unint64_t v5 = [v3 type], v5 <= 3)) {
    int v6 = dword_1D142B250[v5];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (id)sessionDeviceContextFromPredictionContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXHomeScreenEvent *)self->_mostRecentScreenLockEvent date];
  if (v5)
  {
    int v6 = [(ATXBlendingLayerSessionLogger *)self now];
    [v6 timeIntervalSinceDate:v5];
    BOOL v8 = v7 > 3600.0;

    uint64_t v9 = [(ATXBlendingLayerSessionLogger *)self now];
    [v9 timeIntervalSinceDate:v5];
    BOOL v11 = v10 > 1800.0;
  }
  else
  {
    BOOL v11 = 0;
    BOOL v8 = 0;
  }
  double v12 = objc_opt_new();
  [v12 setLastUnlockMoreThan1HourAgo:v8];
  [v12 setLastUnlockMoreThan30MinutesAgo:v11];
  uint64_t v13 = [v4 locationMotionContext];
  uint64_t v14 = [v13 currentLOI];
  objc_msgSend(v12, "setCurrentLOIType:", -[ATXBlendingLayerSessionLogger locationTypeFromLocationOfInterest:](self, "locationTypeFromLocationOfInterest:", v14));

  if (v4)
  {
    uint64_t v15 = [v4 timeContext];
    objc_msgSend(v12, "setDayOfWeek:", objc_msgSend(v15, "dayOfWeek"));

    double v16 = [v4 timeContext];
    objc_msgSend(v12, "setTimeOfDay:", objc_msgSend(v16, "timeOfDay"));

    double v17 = [v4 timeContext];
    objc_msgSend(v12, "setDateInWeekend:", objc_msgSend(v17, "dateInWeekend"));
  }
  else
  {
    double v17 = [(ATXBlendingLayerSessionLogger *)self now];
    id v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v19 = [v18 components:544 fromDate:v17];
    objc_msgSend(v12, "setDayOfWeek:", objc_msgSend(v19, "weekday") - 1);
    objc_msgSend(v12, "setTimeOfDay:", objc_msgSend(v19, "hour"));
    objc_msgSend(v12, "setDateInWeekend:", objc_msgSend(v18, "isDateInWeekend:", v17));
  }
  return v12;
}

- (id)sessionClientModelUpdatesForUICacheUpdate:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = (id)objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v26 = v4;
  id obj = [(ATXBlendingLayerSessionLogger *)self clientModelCacheUpdatesFromBlendingCacheUpdate:v4];
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        int v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1D25F6CC0]();
        double v7 = objc_opt_new();
        BOOL v8 = [v6 clientModelId];
        [v7 setClientModelId:v8];

        uint64_t v9 = [v6 suggestions];
        double v10 = [v9 firstObject];
        BOOL v11 = [v10 clientModelSpecification];
        uint64_t v12 = [v11 clientModelVersion];
        uint64_t v13 = (void *)v12;
        if (v12) {
          uint64_t v14 = (__CFString *)v12;
        }
        else {
          uint64_t v14 = @"EmptyPredictions";
        }
        [v7 setClientModelVersion:v14];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v15 = [v6 suggestions];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
              uint64_t v22 = [v7 suggestions];
              unint64_t v23 = [v22 count];

              if (v23 <= 0x13)
              {
                long long v24 = [(ATXBlendingLayerSessionLogger *)self sessionSuggestionFromProactiveSuggestion:v20];
                [v7 addSuggestion:v24];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v17);
        }

        [v29 addObject:v7];
        uint64_t v5 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }

  return v29;
}

- (id)clientModelCacheUpdatesFromBlendingCacheUpdate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [v5 clientModelCacheUpdateUUIDs];

  BOOL v8 = [v7 allValues];
  uint64_t v9 = (void *)[v6 initWithArray:v8];

  double v10 = objc_opt_new();
  BOOL v11 = [(ATXBlendingLayerSessionLogger *)self clientModelPublisher];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke;
  v23[3] = &unk_1E68AF140;
  id v24 = v9;
  id v12 = v9;
  uint64_t v13 = [v11 filterWithIsIncluded:v23];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke_3;
  uint64_t v21 = &unk_1E68ABB70;
  id v22 = v10;
  id v14 = v10;
  id v15 = (id)[v13 sinkWithCompletion:&__block_literal_global_48_0 receiveInput:&v18];
  uint64_t v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);

  return v16;
}

BOOL __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  objc_opt_class();
  BOOL v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 uuid];
    LOBYTE(v4) = [v4 containsObject:v5];

    if (v4) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

void __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)clientModelPublisher
{
  if (self->_clientModelEvents)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:self->_clientModelEvents];
  }
  else
  {
    id v3 = objc_opt_new();
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2400.0];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v5;

    v2 = [v3 publisherFromStartTime:v6];
  }
  return v2;
}

- (id)sessionUICacheForUICacheUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = objc_opt_new();
  double v6 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
  [v5 setConsumerSubType:v6];

  double v7 = [v4 uiCache];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v9 = [v4 uiCache];
  double v10 = v9;
  long long v26 = v4;
  if (isKindOfClass)
  {
    uint64_t v11 = [v9 minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks];
LABEL_5:
    uint64_t v13 = (void *)v11;

    goto LABEL_9;
  }
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    double v10 = [v4 uiCache];
    uint64_t v11 = [v10 minSuggestionListInLayout];
    goto LABEL_5;
  }
  id v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    -[ATXBlendingLayerSessionLogger sessionUICacheForUICacheUpdate:](v4, v14);
  }

  uint64_t v13 = 0;
LABEL_9:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
        id v22 = [v5 suggestions];
        unint64_t v23 = [v22 count];

        if (v23 <= 0x3B)
        {
          id v24 = [(ATXBlendingLayerSessionLogger *)self sessionSuggestionFromProactiveSuggestion:v20];
          [v5 addSuggestion:v24];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }

  return v5;
}

- (id)sessionSuggestionFromProactiveSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  double v5 = [v3 genericStringForSuggestionExecutableObject];
  [v4 setExecutableId:v5];

  double v6 = [v3 scoreSpecification];
  [v6 rawScore];
  objc_msgSend(v4, "setRawScore:");

  double v7 = [v3 scoreSpecification];

  unint64_t v8 = [v7 suggestedConfidenceCategory];
  if (v8 <= 4) {
    [v4 setSuggestedConfidenceCategory:v8];
  }
  return v4;
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    id v3 = now;
  }
  else {
    id v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (NSArray)uiEvents
{
  return self->_uiEvents;
}

- (void)setUiEvents:(id)a3
{
}

- (NSArray)ermEvents
{
  return self->_ermEvents;
}

- (void)setErmEvents:(id)a3
{
}

- (NSArray)blendingEvents
{
  return self->_blendingEvents;
}

- (void)setBlendingEvents:(id)a3
{
}

- (NSArray)clientModelEvents
{
  return self->_clientModelEvents;
}

- (void)setClientModelEvents:(id)a3
{
}

- (NSArray)predictionContextEvents
{
  return self->_predictionContextEvents;
}

- (void)setPredictionContextEvents:(id)a3
{
}

- (void)setNow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_predictionContextEvents, 0);
  objc_storeStrong((id *)&self->_clientModelEvents, 0);
  objc_storeStrong((id *)&self->_blendingEvents, 0);
  objc_storeStrong((id *)&self->_ermEvents, 0);
  objc_storeStrong((id *)&self->_uiEvents, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_mostRecentScreenLockEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentPredictionContext, 0);
  objc_storeStrong((id *)&self->_mostRecentBlendingCacheUpdateByConsumerSubType, 0);
}

void __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Encountered an unkonwn event type.", v1, 2u);
}

- (void)sessionERMEventFromERMEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 entry];
  int v4 = 134217984;
  uint64_t v5 = [v3 engagementRecordType];
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Encountered an unknown engagement record type that should only be used for querying: %lu", (uint8_t *)&v4, 0xCu);
}

- (void)sessionUICacheForUICacheUpdate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 uiCache];
  if (v5)
  {
    v2 = [a1 uiCache];
    double v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = @"nil";
  }
  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(a1, "consumerSubType"));
  int v9 = 138412546;
  double v10 = v6;
  __int16 v11 = 2112;
  char v12 = v8;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Encountered an unknown ui cache class of %@, consumerSubType = %@", (uint8_t *)&v9, 0x16u);
  if (v5)
  {
  }
}

@end