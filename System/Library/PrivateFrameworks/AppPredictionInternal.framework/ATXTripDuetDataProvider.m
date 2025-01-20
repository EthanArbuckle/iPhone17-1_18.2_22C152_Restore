@interface ATXTripDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7;
- (id)groupTripsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5;
@end

@implementation ATXTripDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 13;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  id v9 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v11 = v10;
  [v9 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = BiomeLibrary();
  v15 = [v14 Location];
  v16 = [v15 Semantic];
  v17 = [NSNumber numberWithDouble:v11];
  v18 = objc_msgSend(v16, "atx_publisherFromStartTime:", v17);

  v19 = [(ATXTripDuetDataProvider *)self groupTripsFromPublisher:v18 startTimestamp:v11 endTimestamp:v13];

  return v19;
}

- (id)groupTripsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  id v7 = a3;
  v8 = objc_opt_new();
  id v9 = [MEMORY[0x1E4F93BB8] tupleWithFirst:0 second:0];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__91;
  v29[4] = __Block_byref_object_dispose__91;
  id v30 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke;
  v28[3] = &__block_descriptor_48_e22_B16__0__BMStoreEvent_8l;
  *(double *)&v28[4] = a4;
  *(double *)&v28[5] = a5;
  double v10 = [v7 filterWithIsIncluded:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_2;
  v27[3] = &unk_1E68B4698;
  v27[4] = v29;
  double v11 = [v10 scanWithInitial:v9 nextPartialResult:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_3;
  v26[3] = &unk_1E68B46C0;
  v26[4] = v29;
  double v12 = [v11 filterWithIsIncluded:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_4;
  v25[3] = &unk_1E68B46E8;
  v25[4] = v29;
  double v13 = [v12 mapWithTransform:v25];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5;
  v21[3] = &unk_1E68B4710;
  id v22 = v8;
  double v23 = a4;
  double v24 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_19;
  v19[3] = &unk_1E68B4738;
  id v14 = v22;
  id v20 = v14;
  id v15 = (id)[v13 sinkWithCompletion:v21 receiveInput:v19];

  v16 = v20;
  id v17 = v14;

  _Block_object_dispose(v29, 8);
  return v17;
}

BOOL __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  if (v4 >= *(double *)(a1 + 32))
  {
    [v3 timestamp];
    BOOL v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 eventBody];
  int v8 = [v7 starting];

  if (!v8)
  {
    double v10 = (void *)MEMORY[0x1E4F93BB8];
    id v11 = v6;
    goto LABEL_5;
  }
  id v9 = [v5 second];

  if (v9)
  {
    double v10 = (void *)MEMORY[0x1E4F93BB8];
    id v11 = 0;
LABEL_5:
    double v12 = [v10 tupleWithFirst:v11 second:0];
    goto LABEL_6;
  }
  id v14 = [v5 first];

  if (!v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 timestamp];
    uint64_t v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  v19 = (void *)MEMORY[0x1E4F93BB8];
  id v20 = [v5 first];
  double v12 = [v19 tupleWithFirst:v20 second:v6];

LABEL_6:
  return v12;
}

uint64_t __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 first];
  if (!v4) {
    goto LABEL_6;
  }
  id v5 = (void *)v4;
  id v6 = [v3 second];

  if (!v6) {
    goto LABEL_6;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v9 = [v3 second];
    [v9 timestamp];
    uint64_t v10 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    double v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_7:

  return v7;
}

ATXTripDuetEvent *__79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 first];
  [v6 timestamp];
  uint64_t v7 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");

  id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  id v9 = [v4 second];
  [v9 timestamp];
  uint64_t v10 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");

  [v7 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  double v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  id v14 = [v4 second];
  [v14 timestamp];
  uint64_t v15 = objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v18 = [ATXTripDuetEvent alloc];
  v19 = [v4 first];
  id v20 = [v19 eventBody];
  uint64_t v21 = [v20 userSpecificPlaceType];
  id v22 = [v4 second];

  double v23 = [v22 eventBody];
  double v24 = -[ATXTripDuetEvent initWithOrigin:destination:durationAtOrigin:startDate:endDate:](v18, "initWithOrigin:destination:durationAtOrigin:startDate:endDate:", v21, [v23 userSpecificPlaceType], v7, v10, v12);

  return v24;
}

void __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_anchor();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138412802;
    double v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events for semantic location between %f and %f", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v7 = v3;
    int v5 = [v3 origin];
    id v3 = (id)[v7 destination];
    id v4 = v7;
    if (v5 != v3)
    {
      id v3 = (id)[*(id *)(a1 + 32) addObject:v7];
      id v4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

void __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [a2 error];
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for semantic location between %f and %f: %@", (uint8_t *)&v7, 0x20u);
}

@end