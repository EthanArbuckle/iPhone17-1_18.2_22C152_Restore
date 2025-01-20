@interface ARPHomeControlMicrolocationCorrelationTask
- (ARPHomeControlCorrelationUtilities)utilities;
- (ARPHomeControlMicrolocationCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4;
- (NSString)file;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)queryForMicroLocationsOverlappingEvents:(id)a3 maxEvents:(unint64_t)a4;
- (void)execute;
- (void)registerARPHomeControlNotificationTask;
- (void)setUtilities:(id)a3;
@end

@implementation ARPHomeControlMicrolocationCorrelationTask

- (ARPHomeControlMicrolocationCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARPHomeControlMicrolocationCorrelationTask;
  v8 = [(ARPHomeControlMicrolocationCorrelationTask *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    file = v8->_file;
    v8->_file = (NSString *)v9;

    objc_storeStrong((id *)&v8->_knowledgeStore, a4);
    v11 = [[ARPHomeControlCorrelationUtilities alloc] initWithKnowledgeStore:v7];
    utilities = v8->_utilities;
    v8->_utilities = v11;
  }
  return v8;
}

- (id)queryForMicroLocationsOverlappingEvents:(id)a3 maxEvents:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    id v7 = [v6 startDate];
    v8 = [v7 dateByAddingTimeInterval:2.0];

    uint64_t v9 = [v5 lastObject];
    v10 = [v9 startDate];
    v11 = [v10 dateByAddingTimeInterval:-2.0];

    if ([v8 compare:v11] == 1)
    {
      id v12 = objc_alloc((Class)getBMDKEventStreamClass());
      v13 = [MEMORY[0x263F35148] microLocationVisitStream];
      objc_super v14 = [v13 name];
      v15 = (void *)[v12 initWithDKStreamIdentifier:v14 contentProtection:*MEMORY[0x263F08098]];

      v16 = NSNumber;
      [v8 timeIntervalSinceReferenceDate];
      v17 = objc_msgSend(v16, "numberWithDouble:");
      v18 = NSNumber;
      [v11 timeIntervalSinceReferenceDate];
      v19 = objc_msgSend(v18, "numberWithDouble:");
      v20 = [v15 publisherWithStartTime:v17 endTime:v19 maxEvents:0 lastN:0 reversed:1];

      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v37[3] = 0;
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__1;
      v35[4] = __Block_byref_object_dispose__1;
      id v36 = [v5 objectAtIndexedSubscript:0];
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v34[3] = 0;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __96__ARPHomeControlMicrolocationCorrelationTask_queryForMicroLocationsOverlappingEvents_maxEvents___block_invoke_2;
      v27[3] = &unk_2640B4298;
      v30 = v35;
      v31 = v37;
      id v28 = v5;
      id v22 = v21;
      id v29 = v22;
      v32 = v34;
      unint64_t v33 = a4;
      id v23 = (id)[v20 sinkWithCompletion:&__block_literal_global_4 shouldContinue:v27];
      v24 = v29;
      id v25 = v22;

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(v35, 8);

      _Block_object_dispose(v37, 8);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[ARPHomeControlMicrolocationCorrelationTask queryForMicroLocationsOverlappingEvents:maxEvents:]();
      }
      id v25 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v25 = (id)MEMORY[0x263EFFA68];
  }

  return v25;
}

BOOL __96__ARPHomeControlMicrolocationCorrelationTask_queryForMicroLocationsOverlappingEvents_maxEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  id v5 = [v4 dkEvent];
  while (1)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
    id v7 = [v5 endDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 <= 2.0) {
      break;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void *)(v10 + 24) + 1;
    *(void *)(v10 + 24) = v11;
    if (v11 == [*(id *)(a1 + 32) count])
    {
      BOOL v19 = 0;
      goto LABEL_9;
    }
    uint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    objc_super v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  v15 = [v5 startDate];
  v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
  [v15 timeIntervalSinceDate:v16];
  double v18 = v17;

  if (v18 <= 2.0)
  {
    [*(id *)(a1 + 40) addObject:v5];
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v21 = *(void *)(v20 + 24) + 1;
    *(void *)(v20 + 24) = v21;
    BOOL v19 = v21 < *(void *)(a1 + 72);
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_9:

  return v19;
}

- (void)execute
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE41000, a2, OS_LOG_TYPE_ERROR, "Error reading persisted microlocation home controls archive file: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)registerARPHomeControlNotificationTask
{
}

void __84__ARPHomeControlMicrolocationCorrelationTask_registerARPHomeControlNotificationTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state)
  {
    if (state == 2)
    {
      notify_post((const char *)[@"com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery" UTF8String]);
      id v4 = ARPLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20BE41000, v4, OS_LOG_TYPE_DEFAULT, "ARPHomeControl Suggester Notification After MicroLocations Correlation Notification", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263EF82A0];
    *(void *)buf = *MEMORY[0x263EF81A0];
    uint64_t v15 = v5;
    uint64_t v6 = *MEMORY[0x263EF8180];
    uint64_t v16 = *MEMORY[0x263EF8280];
    uint64_t v17 = v6;
    v13[0] = xpc_int64_create(2 * *MEMORY[0x263EF8210]);
    uint64_t v7 = (void *)MEMORY[0x263EF8690];
    id v8 = MEMORY[0x263EF8690];
    v13[1] = v7;
    v13[2] = xpc_string_create((const char *)*MEMORY[0x263EF8290]);
    double v9 = (void *)MEMORY[0x263EF8698];
    id v10 = MEMORY[0x263EF8698];
    v13[3] = v9;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)buf, v13, 4uLL);
    xpc_activity_set_criteria(v2, v11);

    for (uint64_t i = 3; i != -1; --i)
  }
}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (ARPHomeControlCorrelationUtilities)utilities
{
  return self->_utilities;
}

- (void)setUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (void)queryForMicroLocationsOverlappingEvents:maxEvents:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_20BE41000, &_os_log_internal, OS_LOG_TYPE_FAULT, "queryForMicroLocationsOverlappingEvents: events not in descending order", v0, 2u);
}

@end