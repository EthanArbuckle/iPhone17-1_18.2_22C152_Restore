@interface ATXUnifiedComputedAndInferredModeStream
+ (id)currentUnifiedModeEventAtGivenTime:(id)a3;
- (ATXUnifiedComputedAndInferredModeStream)initWithComputedModePublisher:(id)a3 inferredModePublisher:(id)a4 startTime:(id)a5 endTime:(id)a6;
- (ATXUnifiedComputedAndInferredModeStream)initWithStartTime:(id)a3 toEndTime:(id)a4;
- (BOOL)checkForOverlappingTimeRanges:(id)a3;
- (NSArray)unifiedModeEventsInTimeRange;
- (id)fetchUnifiedModeEvents;
- (void)addComputedModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5;
- (void)addInferredModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5;
- (void)computeUnifiedModeEventsFromStartTime:(id)a3 toEndTime:(id)a4;
@end

@implementation ATXUnifiedComputedAndInferredModeStream

- (ATXUnifiedComputedAndInferredModeStream)initWithStartTime:(id)a3 toEndTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = BiomeLibrary();
  v9 = [v8 UserFocus];
  v10 = [v9 ComputedMode];
  v11 = objc_msgSend(v10, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);

  v12 = BiomeLibrary();
  v13 = [v12 UserFocus];
  v14 = [v13 InferredMode];
  v15 = objc_msgSend(v14, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);

  v16 = [(ATXUnifiedComputedAndInferredModeStream *)self initWithComputedModePublisher:v11 inferredModePublisher:v15 startTime:v7 endTime:v6];
  return v16;
}

- (ATXUnifiedComputedAndInferredModeStream)initWithComputedModePublisher:(id)a3 inferredModePublisher:(id)a4 startTime:(id)a5 endTime:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXUnifiedComputedAndInferredModeStream;
  v15 = [(ATXUnifiedComputedAndInferredModeStream *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_computedModePublisher, a3);
    objc_storeStrong((id *)&v16->_inferredModePublisher, a4);
    uint64_t v17 = objc_opt_new();
    modeEvents = v16->_modeEvents;
    v16->_modeEvents = (NSMutableArray *)v17;

    [(ATXUnifiedComputedAndInferredModeStream *)v16 computeUnifiedModeEventsFromStartTime:v13 toEndTime:v14];
  }

  return v16;
}

- (void)computeUnifiedModeEventsFromStartTime:(id)a3 toEndTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__36;
  v19[4] = __Block_byref_object_dispose__36;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__36;
  v17[4] = __Block_byref_object_dispose__36;
  id v18 = 0;
  v8 = [(BPSPublisher *)self->_computedModePublisher orderedMergeWithOther:self->_inferredModePublisher comparator:&__block_literal_global_69];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2;
  v13[3] = &unk_1E68AF480;
  v15 = v19;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  v16 = v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_34;
  v12[3] = &unk_1E68AF4A8;
  v12[4] = self;
  v12[5] = v17;
  v12[6] = v19;
  id v10 = (id)[v8 sinkWithCompletion:v13 receiveInput:v12];
  [(NSMutableArray *)self->_modeEvents sortUsingComparator:&__block_literal_global_41];
  if ([(ATXUnifiedComputedAndInferredModeStream *)self checkForOverlappingTimeRanges:self->_modeEvents])
  {
    id v11 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXUnifiedComputedAndInferredModeStream computeUnifiedModeEventsFromStartTime:toEndTime:](v11);
    }
  }
  objc_storeStrong((id *)&self->_unifiedModeEventsInTimeRange, self->_modeEvents);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    id v5 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_cold_1(v3, v5);
    }
  }
  id v6 = [v3 error];
  if (v6 || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
  }
  else
  {
    double v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) eventBody];
    int v9 = [v8 starting];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      [v11 timestamp];
      double v13 = v12;
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      [v10 addComputedModeEventToArrayStream:v11 withStartTime:v13 endTime:v14];
      goto LABEL_9;
    }
  }
  id v7 = [v3 error];
  if (v7 || !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
  }
  else
  {
    v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) eventBody];
    int v16 = [v15 isStart];

    if (v16)
    {
      uint64_t v17 = *(void **)(a1 + 32);
      id v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      [v18 timestamp];
      double v20 = v19;
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      [v17 addInferredModeEventToArrayStream:v18 withStartTime:v20 endTime:v21];
    }
  }
LABEL_9:
}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_34(void *a1, void *a2)
{
  id v48 = a2;
  id v3 = [v48 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [v48 eventBody];
  id v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0) {
      goto LABEL_27;
    }
    id v6 = [v48 eventBody];
    if ([v6 isStart])
    {
      if (!*(void *)(*(void *)(a1[6] + 8) + 40))
      {
        uint64_t v17 = a1[5];
        goto LABEL_11;
      }
      goto LABEL_26;
    }
    v34 = *(void **)(*(void *)(a1[5] + 8) + 40);
    if (v34)
    {
      v35 = [v34 eventBody];
      int v36 = [v35 modeType];
      if (v36 == [v6 modeType])
      {
        [v48 timestamp];
        double v38 = v37;
        [*(id *)(*(void *)(a1[5] + 8) + 40) timestamp];
        double v40 = v39;

        if (v38 > v40)
        {
          v41 = (void *)a1[4];
          v42 = *(void **)(*(void *)(a1[5] + 8) + 40);
          [v42 timestamp];
          double v44 = v43;
          [v48 timestamp];
          [v41 addInferredModeEventToArrayStream:v42 withStartTime:v44 endTime:v45];
        }
      }
      else
      {
      }
    }
    uint64_t v46 = a1[5];
LABEL_24:
    uint64_t v47 = *(void *)(v46 + 8);
    double v21 = *(void **)(v47 + 40);
    *(void *)(v47 + 40) = 0;
    goto LABEL_25;
  }
  if (![v5 starting])
  {
    v22 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v22)
    {
      v23 = [v22 eventBody];
      int v24 = [v23 semanticType];
      if (v24 == [v6 semanticType])
      {
        [v48 timestamp];
        double v26 = v25;
        [*(id *)(*(void *)(a1[6] + 8) + 40) timestamp];
        double v28 = v27;

        if (v26 > v28)
        {
          v29 = (void *)a1[4];
          v30 = *(void **)(*(void *)(a1[6] + 8) + 40);
          [v30 timestamp];
          double v32 = v31;
          [v48 timestamp];
          [v29 addComputedModeEventToArrayStream:v30 withStartTime:v32 endTime:v33];
        }
      }
      else
      {
      }
    }
    uint64_t v46 = a1[6];
    goto LABEL_24;
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
LABEL_6:
    uint64_t v17 = a1[6];
LABEL_11:
    uint64_t v19 = *(void *)(v17 + 8);
    id v20 = v48;
    double v21 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
LABEL_25:

    goto LABEL_26;
  }
  [v6 semanticType];
  int v7 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
  double v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) eventBody];
  int v9 = [v8 modeType];

  if (v9 != v7)
  {
    id v10 = (void *)a1[4];
    uint64_t v11 = *(void **)(*(void *)(a1[5] + 8) + 40);
    [v11 timestamp];
    double v13 = v12;
    [v48 timestamp];
    [v10 addInferredModeEventToArrayStream:v11 withStartTime:v13 endTime:v14];
    uint64_t v15 = *(void *)(a1[5] + 8);
    int v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    goto LABEL_6;
  }
LABEL_26:

LABEL_27:
}

uint64_t __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_38(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startTime];
  id v6 = [v4 startTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)addComputedModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5
{
  double v8 = [a3 eventBody];
  uint64_t v9 = objc_msgSend(v8, "atx_dndModeSemanticType");

  id v10 = [MEMORY[0x1E4F4AF78] sharedInstance];
  uint64_t v11 = [v10 atxModeForDNDSemanticType:v9];

  id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a4];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a5];
  double v13 = [[ATXUnifiedModeEvent alloc] initWithMode:v11 startTime:v14 endTime:v12];
  [(NSMutableArray *)self->_modeEvents addObject:v13];
}

- (void)addInferredModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5
{
  double v8 = [a3 eventBody];
  [v8 modeType];
  BMUserFocusInferredModeTypeToActivity();
  uint64_t v9 = ATXModeFromActivityType();

  id v12 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a4];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a5];
  uint64_t v11 = [[ATXUnifiedModeEvent alloc] initWithMode:v9 startTime:v12 endTime:v10];
  [(NSMutableArray *)self->_modeEvents addObject:v11];
}

- (BOOL)checkForOverlappingTimeRanges:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v4;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v11 = objc_msgSend(v10, "startTime", (void)v15);
        if ([v9 compare:v11] == -1)
        {
        }
        else
        {
          id v12 = [v10 startTime];
          uint64_t v13 = [v9 compare:v12];

          if (v13)
          {
            LOBYTE(v6) = 1;
            id v4 = v9;
            goto LABEL_12;
          }
        }
        id v4 = [v10 endTime];

        ++v8;
        uint64_t v9 = v4;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (id)fetchUnifiedModeEvents
{
  return (id)[(NSMutableArray *)self->_modeEvents bpsPublisher];
}

+ (id)currentUnifiedModeEventAtGivenTime:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F93650] currrentModeEventAtGivenTime:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 eventBody];
    objc_msgSend(v6, "atx_dndModeSemanticType");
    uint64_t v7 = ATXModeForDNDSemanticType();

    uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v5 timestamp];
    uint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = [[ATXUnifiedModeEvent alloc] initWithMode:v7 startTime:v9 endTime:0];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F93658] currentModeEventAtGivenTime:v3];
    uint64_t v11 = [v9 eventBody];
    [v11 modeType];
    BMUserFocusInferredModeTypeToActivity();
    uint64_t v12 = ATXModeFromActivityType();

    uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
    [v9 timestamp];
    id v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = [[ATXUnifiedModeEvent alloc] initWithMode:v12 startTime:v14 endTime:0];
  }
  return v10;
}

- (NSArray)unifiedModeEventsInTimeRange
{
  return self->_unifiedModeEventsInTimeRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedModeEventsInTimeRange, 0);
  objc_storeStrong((id *)&self->_modeEvents, 0);
  objc_storeStrong((id *)&self->_inferredModePublisher, 0);
  objc_storeStrong((id *)&self->_computedModePublisher, 0);
}

- (void)computeUnifiedModeEventsFromStartTime:(os_log_t)log toEndTime:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXUnifiedComputedAndInferredModeStream: Unified Mode events should be mutually exclusive with no overlapping time ranges.", v1, 2u);
}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXUnifiedComputedAndInferredModeStream: Error fetching mode streams: %@", (uint8_t *)&v4, 0xCu);
}

@end