@interface ARPCorrelationTask
- (ARPCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4;
- (NSString)file;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)longFormVideoAppBundleIDs;
- (id)queryForMicroLocationsFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 overlappingNowPlayingEvents:(id)a6;
- (void)execute;
- (void)execute:(id)a3 microLocationEvents:(id)a4;
- (void)longFormVideoAppBundleIDs;
@end

@implementation ARPCorrelationTask

- (ARPCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARPCorrelationTask;
  v8 = [(ARPCorrelationTask *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    file = v8->_file;
    v8->_file = (NSString *)v9;

    objc_storeStrong((id *)&v8->_knowledgeStore, a4);
  }

  return v8;
}

- (id)queryForMicroLocationsFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 overlappingNowPlayingEvents:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v28 = a4;
  id v10 = a6;
  v11 = ARPLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = [v10 count];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: nowPlayingEvents.count: %lu, maxEvents: %lu", buf, 0x16u);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: startTime: %@, endTime: %@", buf, 0x16u);
  }

  if ([v10 count])
  {
    objc_super v12 = (void *)[objc_alloc((Class)getBMDKEventStreamClass()) initWithDKStreamIdentifier:@"/inferred/microLocationVisit" contentProtection:*MEMORY[0x263F08098]];
    v13 = NSNumber;
    [v9 timeIntervalSinceReferenceDate];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    v15 = NSNumber;
    [v28 timeIntervalSinceReferenceDate];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    v17 = [v12 publisherWithStartTime:v14 endTime:v16 maxEvents:0 lastN:0 reversed:1];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17 == 0;
      _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: publisherNil?:%d", buf, 8u);
    }

    +[ARPRoutingSession microLocationCorrelationGracePeriod];
    uint64_t v19 = v18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: microLocationCorrelationGracePeriod:%f", buf, 0xCu);
    }

    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__0;
    v46 = __Block_byref_object_dispose__0;
    id v47 = [v10 objectAtIndexedSubscript:0];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __104__ARPCorrelationTask_queryForMicroLocationsFromStartTime_endTime_maxEvents_overlappingNowPlayingEvents___block_invoke_2;
    v29[3] = &unk_2640B4248;
    uint64_t v35 = v19;
    v32 = buf;
    v33 = v41;
    id v30 = v10;
    id v21 = v20;
    id v31 = v21;
    v34 = &v37;
    unint64_t v36 = a5;
    id v22 = (id)[v17 sinkWithCompletion:&__block_literal_global_81 shouldContinue:v29];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v38[3];
      *(_DWORD *)v42 = 134217984;
      uint64_t v43 = v23;
      _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: found %lu microLocationEvents", v42, 0xCu);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v21 count];
      *(_DWORD *)v42 = 134217984;
      uint64_t v43 = v24;
      _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: results.count: %lu", v42, 0xCu);
    }

    v25 = v31;
    id v26 = v21;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    id v26 = (id)MEMORY[0x263EFFA68];
  }

  return v26;
}

BOOL __104__ARPCorrelationTask_queryForMicroLocationsFromStartTime_endTime_maxEvents_overlappingNowPlayingEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  v5 = [v4 dkEvent];
  while (1)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
    id v7 = [v5 endDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;
    double v10 = *(double *)(a1 + 72);

    if (v9 <= v10) {
      break;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void *)(v11 + 24) + 1;
    *(void *)(v11 + 24) = v12;
    if (v12 == [*(id *)(a1 + 32) count])
    {
      BOOL v21 = 0;
      goto LABEL_9;
    }
    uint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  v16 = [v5 startDate];
  v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];
  [v16 timeIntervalSinceDate:v17];
  double v19 = v18;
  double v20 = *(double *)(a1 + 72);

  if (v19 <= v20)
  {
    [*(id *)(a1 + 40) addObject:v5];
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v23 = *(void *)(v22 + 24) + 1;
    *(void *)(v22 + 24) = v23;
    BOOL v21 = v23 < *(void *)(a1 + 80);
  }
  else
  {
    BOOL v21 = 1;
  }
LABEL_9:

  return v21;
}

- (void)execute
{
  id v3 = _os_activity_create(&dword_20BE41000, "Duet: ARPCorrelationTask execute", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);

  [(ARPCorrelationTask *)self execute:0 microLocationEvents:0];
}

- (void)execute:(id)a3 microLocationEvents:(id)a4
{
  v57[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
  unint64_t v9 = 0x2640B3000uLL;
  if (v6)
  {
    id v10 = v6;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F35110];
    v15 = [MEMORY[0x263F350F0] playing];
    id v13 = [v14 predicateForObjectsWithMetadataKey:v15 andIntegerValue:1];

    v16 = [(ARPCorrelationTask *)self longFormVideoAppBundleIDs];
    [MEMORY[0x263F35110] predicateForEventsWithStringValueInValues:v16];
    v17 = v46 = self;
    +[ARPRoutingSession minimumRoutingEventDuration];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F35110], "predicateForEventsWithMinimumDuration:");
    double v18 = (void *)MEMORY[0x263F08730];
    v57[0] = v17;
    v57[1] = v13;
    v57[2] = v11;
    double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
    double v20 = [v18 andPredicateWithSubpredicates:v19];

    BOOL v21 = (void *)MEMORY[0x263F35090];
    uint64_t v22 = [MEMORY[0x263F35148] nowPlayingStream];
    v56 = v22;
    unint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    v45 = v8;
    v55 = v8;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    v25 = [v21 eventQueryWithPredicate:v20 eventStreams:v23 offset:0 limit:512 sortDescriptors:v24];

    id v26 = [NSString stringWithUTF8String:"ARPCorrelationTask.m"];
    v27 = objc_msgSend(v26, "stringByAppendingFormat:", @":%d", 283);
    [v25 setClientName:v27];

    [v25 setTracker:&__block_literal_global_95];
    id v28 = [(ARPCorrelationTask *)v46 knowledgeStore];
    id v48 = 0;
    id v10 = [v28 executeQuery:v25 error:&v48];
    id v29 = v48;

    if (v29)
    {
      id v30 = ARPLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[ARPCorrelationTask execute:microLocationEvents:]();
      }

      double v8 = v45;
      id v6 = 0;
      goto LABEL_28;
    }

    double v8 = v45;
    id v6 = 0;
    unint64_t v9 = 0x2640B3000;
    self = v46;
  }
  uint64_t v11 = ARPLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v12;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "-[ARPCorrelationTask execute:microLocationEvents:] nowPlayingEvents.count:%lu", buf, 0xCu);
  }

  if (v7)
  {
    id v13 = v7;
  }
  else if ([v10 count])
  {
    id v31 = v8;
    [*(id *)(v9 + 3736) microLocationCorrelationGracePeriod];
    double v33 = v32;
    v34 = [v10 lastObject];
    uint64_t v35 = [v34 startDate];
    unint64_t v36 = [v35 dateByAddingTimeInterval:-v33];

    uint64_t v37 = [v10 firstObject];
    v38 = [v37 startDate];
    uint64_t v39 = [v38 dateByAddingTimeInterval:v33];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "Calling queryForMicroLocationsFromStartTime v1.0a:", buf, 2u);
    }

    -[ARPCorrelationTask queryForMicroLocationsFromStartTime:endTime:maxEvents:overlappingNowPlayingEvents:](self, "queryForMicroLocationsFromStartTime:endTime:maxEvents:overlappingNowPlayingEvents:", v39, v36, 2 * [v10 count], v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    double v8 = v31;
    unint64_t v9 = 0x2640B3000;
  }
  else
  {
    id v13 = 0;
  }
  [*(id *)(v9 + 3736) routingSessionTimeout];
  double v41 = v40;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v42 = [v10 count];
    uint64_t v43 = [v13 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v50 = v42;
    __int16 v51 = 2048;
    uint64_t v52 = v43;
    __int16 v53 = 2048;
    double v54 = v41;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "nowPlayingEventsArg microLocationEvents: nowPlayingEvents.count: %lu microLocationEvents.count: %lu, routingSessionTimeout: %f", buf, 0x20u);
  }

  if ([v10 count] && objc_msgSend(v13, "count"))
  {
    v16 = [*(id *)(v9 + 3736) routingSessionsFromNowPlayingEvents:v10 microLocationEvents:v13 routingSessionTimeout:v41];
  }
  else
  {
    v16 = (void *)MEMORY[0x263EFFA68];
  }
  v17 = [(ARPCorrelationTask *)self file];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ARPCorrelationTask execute:microLocationEvents:](v16, (uint64_t)v17, v11);
  }

  v44 = *(void **)(v9 + 3736);
  id v47 = 0;
  [v44 writeSessions:v16 routingSessionTimeout:v17 file:&v47 error:v41];
  id v29 = v47;
  if (v29)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ARPCorrelationTask execute:microLocationEvents:]();
    }
LABEL_28:
  }
}

uint64_t __50__ARPCorrelationTask_execute_microLocationEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)longFormVideoAppBundleIDs
{
  v28[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F35148] nowPlayingStream];
  v28[0] = v3;
  os_activity_scope_state_s v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

  v5 = [MEMORY[0x263F35090] eventQueryWithPredicate:0 eventStreams:v4 offset:0 limit:0 sortDescriptors:0];
  id v6 = [NSString stringWithUTF8String:"ARPCorrelationTask.m"];
  id v7 = objc_msgSend(v6, "stringByAppendingFormat:", @":%d", 340);
  [v5 setClientName:v7];

  [v5 setTracker:&__block_literal_global_97];
  [v5 setGroupByProperties:&unk_26C0FF788];
  [v5 setResultType:3];
  double v8 = [(ARPCorrelationTask *)self knowledgeStore];
  id v26 = 0;
  unint64_t v9 = [v8 executeQuery:v5 error:&v26];
  id v10 = v26;

  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (v10)
  {
    uint64_t v12 = ARPLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ARPCorrelationTask longFormVideoAppBundleIDs]();
    }
  }
  else
  {
    BOOL v21 = v4;
    uint64_t v12 = [getAVSystemControllerClass() sharedAVSystemController];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = [v9 valueForKey:@"valueString"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (-[NSObject hasRouteSharingPolicyLongFormVideo:](v12, "hasRouteSharingPolicyLongFormVideo:", v18))[v11 addObject:v18]; {
        }
          }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }

    os_activity_scope_state_s v4 = v21;
  }

  double v19 = [v11 allObjects];

  return v19;
}

uint64_t __47__ARPCorrelationTask_longFormVideoAppBundleIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (void)execute:microLocationEvents:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20BE41000, v0, v1, "Error archiving sessions to file: %@", v2, v3, v4, v5, v6);
}

- (void)execute:(NSObject *)a3 microLocationEvents:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_20BE41000, a3, OS_LOG_TYPE_DEBUG, "Archiving %@ sessions to %@ for correlation task.", v6, 0x16u);
}

- (void)execute:microLocationEvents:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20BE41000, v0, v1, "Error fetching now playing for correlation task: %@", v2, v3, v4, v5, v6);
}

- (void)longFormVideoAppBundleIDs
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20BE41000, v0, v1, "Error fetching long form video bundle IDs from knowledge store: %@", v2, v3, v4, v5, v6);
}

@end