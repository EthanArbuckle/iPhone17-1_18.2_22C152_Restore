@interface ATXPeopleDiscovery
- (ATXPeopleDiscovery)init;
- (id)fetchPeopleWithProximityFromStartDate:(id)a3 toEndDate:(id)a4;
@end

@implementation ATXPeopleDiscovery

- (ATXPeopleDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXPeopleDiscovery;
  v2 = [(ATXPeopleDiscovery *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v3;
  }
  return v2;
}

- (id)fetchPeopleWithProximityFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__95;
  v32 = __Block_byref_object_dispose__95;
  id v33 = (id)objc_opt_new();
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__95;
  v26 = __Block_byref_object_dispose__95;
  id v27 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  routineManager = self->_routineManager;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__ATXPeopleDiscovery_fetchPeopleWithProximityFromStartDate_toEndDate___block_invoke;
  v18[3] = &unk_1E68B2B10;
  v20 = &v22;
  v21 = &v28;
  v10 = v8;
  v19 = v10;
  [(RTRoutineManager *)routineManager fetchProximityHistoryFromStartDate:v6 endDate:v7 completionHandler:v18];
  if (v23[5])
  {
    v11 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:](v11);
    }
  }
  v12 = v10;
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  intptr_t v14 = dispatch_semaphore_wait(v12, v13);

  if (v14)
  {
    v15 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:](v15);
    }

    v16 = 0;
  }
  else
  {
    v16 = [(id)v29[5] bpsPublisher];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __70__ATXPeopleDiscovery_fetchPeopleWithProximityFromStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

- (void)fetchPeopleWithProximityFromStartDate:(os_log_t)log toEndDate:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for proximity history semaphore", (uint8_t *)&v1, 0xCu);
}

- (void)fetchPeopleWithProximityFromStartDate:(os_log_t)log toEndDate:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Error fetching nearby people", (uint8_t *)&v1, 0xCu);
}

@end