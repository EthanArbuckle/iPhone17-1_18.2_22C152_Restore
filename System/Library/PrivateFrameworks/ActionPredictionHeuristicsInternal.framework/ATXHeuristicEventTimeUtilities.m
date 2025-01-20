@interface ATXHeuristicEventTimeUtilities
- (ATXEventTravelTimeDataSource)dataSource;
- (ATXHeuristicEventTimeUtilities)init;
- (CLPlacemark)destination;
- (EKEvent)event;
- (NSDictionary)resolvedTimeInformation;
- (NSString)transportType;
- (OS_dispatch_semaphore)semaphore;
- (id)travelTimeToEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6;
- (void)setDataSource:(id)a3;
- (void)setDestination:(id)a3;
- (void)setEvent:(id)a3;
- (void)setResolvedTimeInformation:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)setTransportType:(id)a3;
@end

@implementation ATXHeuristicEventTimeUtilities

- (ATXHeuristicEventTimeUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicEventTimeUtilities;
  return [(ATXHeuristicEventTimeUtilities *)&v3 init];
}

- (id)travelTimeToEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v43 = a4;
  id v42 = a5;
  id v12 = a6;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__17;
  v52 = __Block_byref_object_dispose__17;
  id v53 = 0;
  uint64_t v45 = 0;
  v46[0] = &v45;
  v46[1] = 0x3032000000;
  v46[2] = __Block_byref_object_copy__17;
  v46[3] = __Block_byref_object_dispose__17;
  id v47 = 0;
  if (v11)
  {
    v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = [v11 startDate];
    BOOL v15 = [v13 compare:v14] == 1;

    if (v15)
    {
      v16 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:](v16);
      }
    }
    v17 = [v11 startDate];
    v18 = [v17 dateByAddingTimeInterval:-600.0];

LABEL_12:
    v23 = [[ATXEventTravelTimeDataSource alloc] initWithDevice:v12];
    objc_storeStrong((id *)&self->_event, a3);
    objc_storeStrong((id *)&self->_dataSource, v23);
    p_destination = &self->_destination;
    objc_storeStrong((id *)&self->_destination, a4);
    objc_storeStrong((id *)&self->_transportType, a5);
    v25 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    semaphore = self->_semaphore;
    self->_semaphore = v25;

    v27 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v11 eventIdentifier];
      v29 = [(CLPlacemark *)*p_destination name];
      *(_DWORD *)buf = 138412546;
      v55 = v28;
      __int16 v56 = 2112;
      v57 = v29;
      _os_log_impl(&dword_1D0F43000, v27, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Calling datasource for time (Eid: %@), D:(%@)", buf, 0x16u);
    }
    v30 = [(EKEvent *)self->_event eventIdentifier];
    v31 = [(CLPlacemark *)*p_destination location];
    transportType = self->_transportType;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __94__ATXHeuristicEventTimeUtilities_travelTimeToEvent_destination_transportType_heuristicDevice___block_invoke;
    v44[3] = &unk_1E68A5728;
    v44[5] = &v48;
    v44[6] = &v45;
    v44[4] = self;
    [(ATXEventTravelTimeDataSource *)v23 travelTimeInfoForEventID:v30 location:v31 expectedArrivalDate:v18 transportType:transportType localOnlyAfterFirstUpdate:1 callback:v44];

    [MEMORY[0x1E4F93B18] waitForSemaphore:self->_semaphore timeoutSeconds:1.0];
    if (*(void *)(v46[0] + 40))
    {
      v33 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:]((uint64_t)v46, v33, v34, v35, v36, v37, v38, v39);
      }
    }
    id v40 = (id)v49[5];
    goto LABEL_19;
  }
  v19 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v19, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Event is nil, setting destination expiry time to an hour from now", buf, 2u);
  }

  v20 = [MEMORY[0x1E4F1C9C8] date];
  v18 = [v20 dateByAddingTimeInterval:3600.0];

  v21 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v43 name];
    *(_DWORD *)buf = 138412290;
    v55 = v22;
    _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Determining travel time: (event is nil), D:(%@)", buf, 0xCu);
  }
  if (v43) {
    goto LABEL_12;
  }
  __atxlog_handle_context_heuristic();
  v23 = (ATXEventTravelTimeDataSource *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR)) {
    -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:](&v23->super);
  }
  id v40 = 0;
LABEL_19:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v48, 8);

  return v40;
}

void __94__ATXHeuristicEventTimeUtilities_travelTimeToEvent_destination_transportType_heuristicDevice___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 40));
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (ATXEventTravelTimeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CLPlacemark)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSDictionary)resolvedTimeInformation
{
  return self->_resolvedTimeInformation;
}

- (void)setResolvedTimeInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedTimeInformation, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)travelTimeToEvent:(os_log_t)log destination:transportType:heuristicDevice:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "ATXHeuristicEventTimeUtilities: Error: Unable to resolve time to travel destination (nil)", v1, 2u);
}

- (void)travelTimeToEvent:(uint64_t)a3 destination:(uint64_t)a4 transportType:(uint64_t)a5 heuristicDevice:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)travelTimeToEvent:(os_log_t)log destination:transportType:heuristicDevice:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "ATXHeuristicEventTimeUtilities: While computing time, current time is later than event start time. Will still compute time", v1, 2u);
}

@end