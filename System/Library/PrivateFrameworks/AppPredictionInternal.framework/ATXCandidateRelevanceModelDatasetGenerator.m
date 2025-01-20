@interface ATXCandidateRelevanceModelDatasetGenerator
+ (BOOL)isContextMismatchForPreviousContext:(id)a3 currentContext:(id)a4;
+ (id)candidateDataPointsForSession:(id)a3 candidate:(id)a4;
+ (id)candidateDataPointsForSessions:(id)a3 candidate:(id)a4;
+ (id)dataPointPublisher:(id)a3;
+ (id)eventAndRecentContextPublisher:(id)a3;
- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3;
- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 contextPublisher:(id)a4 modePublisher:(id)a5 poiCategoryPublisher:(id)a6 bluetoothPublisher:(id)a7 userFocusComputedModePublisher:(id)a8 microlocationVisitPublisher:(id)a9;
- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 inferredModeStream:(id)a4 computedModeStream:(id)a5 pointOfInterestStream:(id)a6;
- (ATXCandidateRelevanceModelDatasetGeneratorConfig)config;
- (BPSPublisher)bluetoothPublisher;
- (BPSPublisher)contextPublisher;
- (BPSPublisher)microlocationVisitPublisher;
- (BPSPublisher)modePublisher;
- (BPSPublisher)poiCategoryPublisher;
- (BPSPublisher)userFocusComputedModePublisher;
- (id)candidateDatasetStream;
- (void)candidateDatasetStream;
- (void)receiveCandidateDataPoint:(id)a3 completion:(id)a4 candidate:(id)a5;
- (void)receiveDataPoint:(id)a3 completion:(id)a4;
- (void)receiveDatasetSession:(id)a3 completion:(id)a4;
- (void)setBluetoothPublisher:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContextPublisher:(id)a3;
- (void)setMicrolocationVisitPublisher:(id)a3;
- (void)setModePublisher:(id)a3;
- (void)setPoiCategoryPublisher:(id)a3;
- (void)setUserFocusComputedModePublisher:(id)a3;
@end

@implementation ATXCandidateRelevanceModelDatasetGenerator

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3
{
  id v4 = a3;
  v16 = BiomeLibrary();
  v15 = [v16 UserFocus];
  v5 = [v15 InferredMode];
  v6 = BiomeLibrary();
  v7 = [v6 UserFocus];
  v8 = [v7 ComputedMode];
  v9 = BiomeLibrary();
  v10 = [v9 Location];
  v11 = [v10 PointOfInterest];
  v12 = [v11 Category];
  v13 = [(ATXCandidateRelevanceModelDatasetGenerator *)self initWithConfig:v4 inferredModeStream:v5 computedModeStream:v8 pointOfInterestStream:v12];

  return v13;
}

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 inferredModeStream:(id)a4 computedModeStream:(id)a5 pointOfInterestStream:(id)a6
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v39 = a3;
  v13 = (void *)[[v9 alloc] initWithTimeIntervalSinceNow:-2592000.0];
  v14 = objc_opt_new();
  [v13 timeIntervalSinceReferenceDate];
  v38 = objc_msgSend(v14, "publisherFromStartTime:");

  v15 = objc_msgSend(v12, "atx_publisherFromStartDate:", v13);

  v37 = [v15 filterWithIsIncluded:&__block_literal_global_111_0];

  v16 = objc_msgSend(v10, "atx_publisherFromStartDate:", v13);

  v36 = [v16 filterWithIsIncluded:&__block_literal_global_113];

  v17 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithIntegerValue:1];
  v42[0] = v17;
  v18 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithMinimumDuration:60.0];
  v42[1] = v18;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];

  v19 = objc_opt_new();
  v20 = [MEMORY[0x1E4F1C9C8] now];
  v21 = [v19 fetchEventsBetweenStartDate:v13 andEndDate:v20 withPredicates:v35];
  v22 = [v21 bpsPublisher];
  v23 = [v22 mapWithTransform:&__block_literal_global_118];

  v24 = objc_msgSend(v11, "atx_publisherFromStartDate:", v13);

  v25 = [v24 filterWithIsIncluded:&__block_literal_global_120];

  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"confidence >= %@", &unk_1F27F3C88];
  v41 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];

  v28 = objc_opt_new();
  v29 = [MEMORY[0x1E4F1C9C8] now];
  v30 = [v28 fetchEventsBetweenStartDate:v13 andEndDate:v29 withPredicates:v27];
  v31 = [v30 bpsPublisher];
  v32 = [v31 mapWithTransform:&__block_literal_global_129];

  v33 = [(ATXCandidateRelevanceModelDatasetGenerator *)self initWithConfig:v39 contextPublisher:v38 modePublisher:v37 poiCategoryPublisher:v36 bluetoothPublisher:v23 userFocusComputedModePublisher:v25 microlocationVisitPublisher:v32];
  return v33;
}

uint64_t __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 isStart];

  return v3;
}

BOOL __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 rank] == 0;

  return v3;
}

id __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B620];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 startDate];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "initWithEventBody:timestamp:", v3);

  return v6;
}

uint64_t __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

id __121__ATXCandidateRelevanceModelDatasetGenerator_initWithConfig_inferredModeStream_computedModeStream_pointOfInterestStream___block_invoke_126(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B620];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 startDate];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "initWithEventBody:timestamp:", v3);

  return v6;
}

- (ATXCandidateRelevanceModelDatasetGenerator)initWithConfig:(id)a3 contextPublisher:(id)a4 modePublisher:(id)a5 poiCategoryPublisher:(id)a6 bluetoothPublisher:(id)a7 userFocusComputedModePublisher:(id)a8 microlocationVisitPublisher:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ATXCandidateRelevanceModelDatasetGenerator;
  v18 = [(ATXCandidateRelevanceModelDatasetGenerator *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_config, a3);
    objc_storeStrong((id *)&v19->_contextPublisher, a4);
    objc_storeStrong((id *)&v19->_modePublisher, a5);
    objc_storeStrong((id *)&v19->_poiCategoryPublisher, a6);
    objc_storeStrong((id *)&v19->_bluetoothPublisher, a7);
    objc_storeStrong((id *)&v19->_userFocusComputedModePublisher, a8);
    objc_storeStrong((id *)&v19->_microlocationVisitPublisher, a9);
  }

  return v19;
}

- (void)receiveDataPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = [(ATXCandidateRelevanceModelDatasetGenerator *)self candidateDatasetStream];
  if (v8)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke;
    v12[3] = &unk_1E68B1EA8;
    v12[4] = &v13;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke_2;
    v10[3] = &unk_1E68B2918;
    id v11 = v6;
    id v9 = (id)[v8 sinkWithBookmark:0 completion:v12 receiveInput:v10];
    v7[2](v7, *((unsigned __int8 *)v14 + 24));

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7[2](v7, 0);
  }
}

uint64_t __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

void __74__ATXCandidateRelevanceModelDatasetGenerator_receiveDataPoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 candidate];

  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)receiveDatasetSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__61;
  v23[4] = __Block_byref_object_dispose__61;
  id v24 = (id)objc_opt_new();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__61;
  v17[4] = __Block_byref_object_dispose__61;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke;
  v13[3] = &unk_1E68B2940;
  uint64_t v15 = v17;
  id v14 = v6;
  char v16 = v23;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke_2;
  v9[3] = &unk_1E68B2968;
  id v8 = v14;
  id v10 = v8;
  id v11 = v23;
  id v12 = &v19;
  [(ATXCandidateRelevanceModelDatasetGenerator *)self receiveDataPoint:v13 completion:v9];
  v7[2](v7, *((unsigned __int8 *)v20 + 24));

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

void __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 contextDefinedSessionId];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  if (v5)
  {
    if ([v5 isEqual:v3]) {
      goto LABEL_6;
    }
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v3);
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = v3;
    id v8 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;
  }

LABEL_6:
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
}

uint64_t __79__ATXCandidateRelevanceModelDatasetGenerator_receiveDatasetSession_completion___block_invoke_2(uint64_t result, int a2)
{
  char v2 = a2;
  uint64_t v3 = result;
  if (a2) {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) = v2;
  return result;
}

- (void)receiveCandidateDataPoint:(id)a3 completion:(id)a4 candidate:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a4;
  id v10 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke;
  v14[3] = &unk_1E68B2990;
  v14[4] = self;
  id v11 = v10;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke_2;
  v13[3] = &unk_1E68B29B8;
  void v13[4] = &v17;
  [(ATXCandidateRelevanceModelDatasetGenerator *)self receiveDatasetSession:v14 completion:v13];
  v9[2](v9, *((unsigned __int8 *)v18 + 24));

  _Block_object_dispose(&v17, 8);
}

void __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() candidateDataPointsForSession:v3 candidate:*(void *)(a1 + 40)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __93__ATXCandidateRelevanceModelDatasetGenerator_receiveCandidateDataPoint_completion_candidate___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)candidateDataPointsForSessions:(id)a3 candidate:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = [(id)objc_opt_class() candidateDataPointsForSession:*(void *)(*((void *)&v23 + 1) + 8 * i) candidate:v6];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [v7 addObject:*(void *)(*((void *)&v19 + 1) + 8 * j)];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)candidateDataPointsForSession:(id)a3 candidate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9)
  {

LABEL_13:
    if (objc_msgSend(v8, "count", (void)v19))
    {
      uint64_t v17 = [v8 objectAtIndexedSubscript:0];
      [v17 setCandidate:v6];
      [v17 setEngaged:0];
      [v7 addObject:v17];
    }
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v15 = objc_msgSend(v14, "candidate", (void)v19);
      int v16 = [v15 isEqual:v6];

      if (v16)
      {
        [v7 addObject:v14];
        char v11 = 1;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_15:

  return v7;
}

- (id)candidateDatasetStream
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() candidatePublisher];
  if (v3
    && self->_contextPublisher
    && (modePublisher = self->_modePublisher) != 0
    && (poiCategoryPublisher = self->_poiCategoryPublisher) != 0
    && (bluetoothPublisher = self->_bluetoothPublisher) != 0
    && (userFocusComputedModePublisher = self->_userFocusComputedModePublisher) != 0
    && (microlocationVisitPublisher = self->_microlocationVisitPublisher) != 0)
  {
    v14[0] = self->_contextPublisher;
    v14[1] = modePublisher;
    v14[2] = poiCategoryPublisher;
    v14[3] = bluetoothPublisher;
    v14[4] = userFocusComputedModePublisher;
    void v14[5] = microlocationVisitPublisher;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
    uint64_t v10 = [v3 orderedMergeWithOthers:v9 comparator:&__block_literal_global_137_0];

    char v11 = [(id)objc_opt_class() eventAndRecentContextPublisher:v10];
    uint64_t v12 = [(id)objc_opt_class() dataPointPublisher:v11];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(ATXCandidateRelevanceModelDatasetGenerator *)(uint64_t)self candidateDatasetStream];
    }
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __68__ATXCandidateRelevanceModelDatasetGenerator_candidateDatasetStream__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

+ (id)eventAndRecentContextPublisher:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F93BB8];
  id v5 = a3;
  id v6 = [v4 tupleWithFirst:0 second:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke;
  v9[3] = &__block_descriptor_40_e70____PASTuple2_24__0___PASTuple2_8__NSObject_ATXBMStoreEventProtocol__16l;
  void v9[4] = a1;
  uint64_t v7 = [v5 scanWithInitial:v6 nextPartialResult:v9];

  return v7;
}

id __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D25F6CC0]();
  double v8 = [v6 eventBody];
  if (v8)
  {
    double v9 = [v5 second];
    uint64_t v10 = [v9 inferredModeEvent];
    uint64_t v11 = [v9 userFocusComputedModeEvent];
    uint64_t v12 = [v9 poiCategory];
    uint64_t v13 = [v9 bluetoothEvent];
    uint64_t v14 = [v9 microlocationVisitEvent];
    objc_opt_class();
    long long v21 = v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (void *)v10;
      id v16 = v8;

      [v16 setInferredModeEvent:v15];
      [v16 setPoiCategory:v12];
      [v16 setBluetoothEvent:v13];
      [v16 setUserFocusComputedModeEvent:v11];
      [v16 setMicrolocationVisitEvent:v14];
      double v9 = v16;
LABEL_16:
      id v18 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v6 second:v9];

      uint64_t v7 = v21;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 setInferredModeEvent:v8];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 setUserFocusComputedModeEvent:v8];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 poiCategory];
          v19 = uint64_t v15 = (void *)v10;
          [v9 setPoiCategory:v19];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v15 = (void *)v10;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 setMicrolocationVisitEvent:v8];
          }
          goto LABEL_16;
        }
        [v9 setBluetoothEvent:v8];
      }
    }
    uint64_t v15 = (void *)v10;
    goto LABEL_16;
  }
  uint64_t v17 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke_cold_1(a1, v17);
  }

  id v18 = v5;
LABEL_17:

  return v18;
}

+ (id)dataPointPublisher:(id)a3
{
  id v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__61;
  v17[4] = __Block_byref_object_dispose__61;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__61;
  v15[4] = __Block_byref_object_dispose__61;
  id v16 = 0;
  id v5 = objc_opt_new();
  id v6 = [v4 filterWithIsIncluded:&__block_literal_global_150];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke_2;
  v10[3] = &unk_1E68B29E0;
  id v14 = a1;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = v17;
  uint64_t v13 = v15;
  double v8 = [v6 mapWithTransform:v10];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

  return v8;
}

uint64_t __65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 first];
  id v4 = [v3 eventBody];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [v2 second];

  return isKindOfClass & (v6 != 0);
}

ATXCandidateRelevanceModelDataPoint *__65__ATXCandidateRelevanceModelDatasetGenerator_dataPointPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 second];
  id v5 = (void *)[v4 copy];

  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v3 first];
  [v7 timestamp];
  double v8 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");

  double v9 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v21 = (objc_class *)objc_opt_class();
    long long v22 = NSStringFromClass(v21);
    [v8 timeIntervalSinceReferenceDate];
    double v24 = v23;
    long long v25 = [v5 timeContext];
    long long v26 = [v25 date];
    [v26 timeIntervalSinceReferenceDate];
    int v28 = 138412546;
    uint64_t v29 = v22;
    __int16 v30 = 2048;
    double v31 = v24 - v27;
    _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "%@ - New time context for candidate is %f seconds newer", (uint8_t *)&v28, 0x16u);
  }
  uint64_t v10 = [[ATXPredictionTimeContext alloc] initWithDate:v8];
  [v5 setTimeContext:v10];
  id v11 = (void *)[*(id *)(a1 + 32) copy];
  [v5 setCandidateIdentifiersLaunchAge:v11];

  if ([(id)objc_opt_class() isContextMismatchForPreviousContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) currentContext:v5])
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
  uint64_t v15 = [v3 first];
  id v16 = [v15 eventBody];

  uint64_t v17 = [[ATXCandidateRelevanceModelDataPoint alloc] initWithContext:v5 candidate:v16 engaged:1 contextDefinedSessionId:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v18 = *(void **)(a1 + 32);
  long long v19 = [v16 identifier];
  [v18 setObject:v8 forKeyedSubscript:v19];

  return v17;
}

+ (BOOL)isContextMismatchForPreviousContext:(id)a3 currentContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 1;
  if (v5 && v6)
  {
    double v9 = [v6 timeContext];
    uint64_t v10 = [v9 date];
    id v11 = [v5 timeContext];
    uint64_t v12 = [v11 date];
    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 > 1800.0)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]();
      }
LABEL_54:

      BOOL v8 = 1;
      goto LABEL_55;
    }
    id v16 = [v7 timeContext];
    int v17 = [v16 dayOfWeek];
    id v18 = [v5 timeContext];
    int v19 = [v18 dayOfWeek];

    if (v17 != v19)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]4();
      }
      goto LABEL_54;
    }
    long long v20 = [v7 deviceStateContext];
    long long v21 = [v20 wifiSSID];
    long long v22 = [v5 deviceStateContext];
    double v23 = [v22 wifiSSID];
    id v24 = v21;
    id v25 = v23;
    if (v24 == v25)
    {
    }
    else
    {
      long long v26 = v25;
      if (!v24 || !v25)
      {

        goto LABEL_19;
      }
      char v27 = [v24 isEqualToString:v25];

      if ((v27 & 1) == 0)
      {
LABEL_19:
        uint64_t v15 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]3();
        }
        goto LABEL_54;
      }
    }
    int v28 = [v7 deviceStateContext];
    int v29 = [v28 inAirplaneMode];
    __int16 v30 = [v5 deviceStateContext];
    int v31 = [v30 inAirplaneMode];

    if (v29 != v31)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]();
      }
      goto LABEL_54;
    }
    uint64_t v32 = [v7 locationMotionContext];
    v33 = [v32 currentLOI];
    v34 = [v5 locationMotionContext];
    v35 = [v34 currentLOI];
    id v36 = v33;
    id v37 = v35;
    if (v36 == v37)
    {
    }
    else
    {
      v38 = v37;
      if (!v36 || !v37)
      {

        goto LABEL_31;
      }
      char v39 = [v36 isEqual:v37];

      if ((v39 & 1) == 0)
      {
LABEL_31:
        uint64_t v15 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]2();
        }
        goto LABEL_54;
      }
    }
    v40 = [v7 locationMotionContext];
    int v41 = [v40 locationEnabled];
    v42 = [v5 locationMotionContext];
    int v43 = [v42 locationEnabled];

    if (v41 != v43)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]();
      }
      goto LABEL_54;
    }
    v44 = [v7 locationMotionContext];
    uint64_t v45 = [v44 geohash];
    v46 = [v5 locationMotionContext];
    uint64_t v47 = [v46 geohash];

    if (v45 != v47)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]1();
      }
      goto LABEL_54;
    }
    v48 = [v7 locationMotionContext];
    uint64_t v49 = [v48 motionType];
    v50 = [v5 locationMotionContext];
    uint64_t v51 = [v50 motionType];

    if (v49 != v51)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:]0();
      }
      goto LABEL_54;
    }
    v52 = [v7 ambientLightContext];
    int v53 = [v52 ambientLightType];
    v54 = [v5 ambientLightContext];
    int v55 = [v54 ambientLightType];

    if (v53 != v55)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.9();
      }
      goto LABEL_54;
    }
    v56 = [v7 bluetoothEvent];
    uint64_t v57 = [v5 bluetoothEvent];
    if (v56 == (void *)v57)
    {
    }
    else
    {
      v58 = (void *)v57;
      v59 = [v7 bluetoothEvent];
      v60 = [v5 bluetoothEvent];
      char v61 = [v59 isEqual:v60];

      if ((v61 & 1) == 0)
      {
        uint64_t v15 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.8();
        }
        goto LABEL_54;
      }
    }
    v62 = [v7 inferredModeEvent];
    int v63 = [v62 modeType];
    v64 = [v5 inferredModeEvent];
    int v65 = [v64 modeType];

    if (v63 != v65)
    {
      uint64_t v15 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.7();
      }
      goto LABEL_54;
    }
    v66 = [v7 userFocusComputedModeEvent];
    int v67 = [v66 semanticType];
    v68 = [v5 userFocusComputedModeEvent];
    int v69 = [v68 semanticType];

    if (v67 == v69)
    {
      v70 = [v7 poiCategory];
      v71 = [v5 poiCategory];

      if (v70 != v71)
      {
        uint64_t v15 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.5();
        }
        goto LABEL_54;
      }
      v73 = [v7 microlocationVisitEvent];
      uint64_t v74 = [v5 microlocationVisitEvent];
      if (v73 != v74)
      {
        v75 = (void *)v74;
        v76 = [v7 microlocationVisitEvent];
        v77 = [v5 microlocationVisitEvent];
        char v78 = [v76 isEqual:v77];

        if ((v78 & 1) == 0)
        {
          uint64_t v15 = __atxlog_handle_relevance_model();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.4();
          }
          goto LABEL_54;
        }
LABEL_59:
        BOOL v8 = 0;
        goto LABEL_55;
      }
    }
    else
    {
      v73 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        +[ATXCandidateRelevanceModelDatasetGenerator isContextMismatchForPreviousContext:currentContext:].cold.6();
      }
    }

    goto LABEL_59;
  }
LABEL_55:

  return v8;
}

- (BPSPublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
}

- (BPSPublisher)modePublisher
{
  return self->_modePublisher;
}

- (void)setModePublisher:(id)a3
{
}

- (BPSPublisher)userFocusComputedModePublisher
{
  return self->_userFocusComputedModePublisher;
}

- (void)setUserFocusComputedModePublisher:(id)a3
{
}

- (BPSPublisher)poiCategoryPublisher
{
  return self->_poiCategoryPublisher;
}

- (void)setPoiCategoryPublisher:(id)a3
{
}

- (BPSPublisher)bluetoothPublisher
{
  return self->_bluetoothPublisher;
}

- (void)setBluetoothPublisher:(id)a3
{
}

- (BPSPublisher)microlocationVisitPublisher
{
  return self->_microlocationVisitPublisher;
}

- (void)setMicrolocationVisitPublisher:(id)a3
{
}

- (ATXCandidateRelevanceModelDatasetGeneratorConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_microlocationVisitPublisher, 0);
  objc_storeStrong((id *)&self->_bluetoothPublisher, 0);
  objc_storeStrong((id *)&self->_poiCategoryPublisher, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModePublisher, 0);
  objc_storeStrong((id *)&self->_modePublisher, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
}

- (void)candidateDatasetStream
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@ - Could not create candidateDatasetStream because one of the biome publishers needed is nil.", (uint8_t *)&v5, 0xCu);
}

void __77__ATXCandidateRelevanceModelDatasetGenerator_eventAndRecentContextPublisher___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Event can't be deserialized in eventAndRecentContextPublisher", (uint8_t *)&v5, 0xCu);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "date mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "inAirplaneMode mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "locationEnabled mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "microlocation mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "poiCategory mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "userFocusComputedModeType mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "modeType mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "bluetoothState mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ambientLightType mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "motionType mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "geohash mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "currentLOI mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "wifiSSID mismatch", v2, v3, v4, v5, v6);
}

+ (void)isContextMismatchForPreviousContext:currentContext:.cold.14()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "dayOfWeek mismatch", v2, v3, v4, v5, v6);
}

@end