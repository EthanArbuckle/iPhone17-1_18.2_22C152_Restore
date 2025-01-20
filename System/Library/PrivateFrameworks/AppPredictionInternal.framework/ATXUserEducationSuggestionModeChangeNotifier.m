@interface ATXUserEducationSuggestionModeChangeNotifier
+ (id)sharedInstance;
- (ATXUserEducationSuggestionModeChangeNotifier)init;
- (void)processModeChangeEvent:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXUserEducationSuggestionModeChangeNotifier

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ATXUserEducationSuggestionModeChangeNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_2, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  return v2;
}

void __62__ATXUserEducationSuggestionModeChangeNotifier_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = v1;
}

- (ATXUserEducationSuggestionModeChangeNotifier)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)ATXUserEducationSuggestionModeChangeNotifier;
  v2 = [(ATXUserEducationSuggestionModeChangeNotifier *)&v28 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    if (!v2->_queue)
    {
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.ATXUserEducationSuggestionServer.queue", v5);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v6;
    }
    v8 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ATXUserEducationSuggestionModeChangeNotifier init]";
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: registering for real time mode change events", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.ATXUserEducationSuggestionServer" targetQueue:v2->_queue];
    scheduler = v2->_scheduler;
    v2->_scheduler = (BMBiomeScheduler *)v9;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v11 = BiomeLibrary();
    v12 = [v11 UserFocus];
    v13 = [v12 ComputedMode];
    v14 = objc_msgSend(v13, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1F27F0090, &unk_1F27F0090, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_12;
    v27[3] = &unk_1E68AC690;
    v27[4] = &buf;
    id v15 = (id)[v14 sinkWithCompletion:&__block_literal_global_17 receiveInput:v27];

    objc_initWeak(&location, v2);
    v16 = BiomeLibrary();
    v17 = [v16 UserFocus];
    v18 = [v17 ComputedMode];
    v19 = objc_msgSend(v18, "atx_DSLPublisher");
    v20 = [v19 subscribeOn:v2->_scheduler];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_16;
    v24[3] = &unk_1E68AC6B8;
    v24[4] = &buf;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [v20 sinkWithCompletion:&__block_literal_global_15 receiveInput:v24];
    sink = v2->_sink;
    v2->_sink = (BPSSink *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  return v2;
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state])
  {
    uint64_t v3 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_cold_1(v2);
    }
  }
}

uint64_t __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t result = [a2 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  uint64_t v4 = __atxlog_handle_context_user_education_suggestions();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[ATXUserEducationSuggestionModeChangeNotifier init]_block_invoke_2";
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: done listening to mode change events", (uint8_t *)&v6, 0xCu);
  }
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 timestamp];
  if (v4 >= *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v13 = [v3 eventBody];

    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v14 = [v3 eventBody];
      [WeakRetained processModeChangeEvent:v14];
    }
    else
    {
      WeakRetained = __atxlog_handle_context_user_education_suggestions();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
        __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_16_cold_1();
      }
    }
  }
  else
  {
    WeakRetained = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [v3 eventBody];
      v7 = (void *)MEMORY[0x1E4F1C9C8];
      [v3 timestamp];
      uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      [v3 timestamp];
      uint64_t v10 = v9;
      v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v15 = 136316418;
      v16 = "-[ATXUserEducationSuggestionModeChangeNotifier init]_block_invoke";
      __int16 v17 = 2114;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      _os_log_impl(&dword_1D0FA3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s: Ignoring stale mode switch event: %{public}@ because it occurred on %{public}@ (%f), which was before the latest event in the stream at %{public}@ (%f)", (uint8_t *)&v15, 0x3Eu);
    }
  }
}

- (void)processModeChangeEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "processModeChangeEvent:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%s: error fetching mode change events from biome %@", v4, v5, v6, v7, 2u);
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%s: error listening to mode change events: %@", v4, v5, v6, v7, 2u);
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_16_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: not notifying observers of mode change event because the biome event had no eventBody: %@", (uint8_t *)v1, 0x16u);
}

@end