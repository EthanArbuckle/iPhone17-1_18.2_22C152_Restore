@interface ATXUserEducationSuggestionFocusModeSetupTrigger
+ (id)sharedInstance;
- (ATXUserEducationSuggestionFocusModeSetupTrigger)init;
- (BOOL)modeHasPassedPastInferenceTest:(unint64_t)a3;
- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3;
- (void)processNewInferredModeEvent:(id)a3;
- (void)registerObserver:(id)a3;
- (void)resetUserDefaultsIfNecessaryForDNDSemanticType:(int64_t)a3;
- (void)resetUserDefaultsIfNecessaryForMode:(unint64_t)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXUserEducationSuggestionFocusModeSetupTrigger

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ATXUserEducationSuggestionFocusModeSetupTrigger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_34 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_34, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_45;
  return v2;
}

void __65__ATXUserEducationSuggestionFocusModeSetupTrigger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_45;
  sharedInstance__pasExprOnceResult_45 = v1;
}

- (ATXUserEducationSuggestionFocusModeSetupTrigger)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)ATXUserEducationSuggestionFocusModeSetupTrigger;
  v2 = [(ATXUserEducationSuggestionFocusModeSetupTrigger *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ATXUserEducationSuggestionFocusModeSetupTrigger.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]";
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Registering for real time inferred mode change events", buf, 0xCu);
    }

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.ATXUserEducationSuggestionFocusModeSetupServer" targetQueue:v2->_queue];
    inferredModeScheduler = v2->_inferredModeScheduler;
    v2->_inferredModeScheduler = (BMBiomeScheduler *)v9;

    objc_initWeak((id *)buf, v2);
    v11 = BiomeLibrary();
    v12 = [v11 UserFocus];
    v13 = [v12 InferredMode];

    v14 = objc_msgSend(v13, "atx_DSLPublisher");
    v15 = [v14 subscribeOn:v2->_inferredModeScheduler];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_17;
    v19[3] = &unk_1E68AE228;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v16 = [v15 sinkWithCompletion:&__block_literal_global_191 receiveInput:v19];
    inferredModeStreamSink = v2->_inferredModeStreamSink;
    v2->_inferredModeStreamSink = (BPSSink *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = __atxlog_handle_context_user_education_suggestions();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_cold_1(v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: ATXUserEducationSuggestionFocusModeSetupTrigger: Successfully completed listening to inferred mode change events for FocusModeSetupTrigger", (uint8_t *)&v6, 0xCu);
  }
}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_17(uint64_t a1, void *a2)
{
  id v11 = [a2 eventBody];
  if ([v11 modeType] != 2)
  {
    if ([v11 modeType])
    {
      if ([v11 isStart])
      {
        [v11 modeType];
        BMUserFocusInferredModeTypeToActivity();
        uint64_t v3 = ATXModeFromActivityType();
        v4 = (id *)(a1 + 32);
        id WeakRetained = objc_loadWeakRetained(v4);
        int v6 = [WeakRetained modeIsEligibleForSetupPrediction:v3];

        if (v6)
        {
          id v7 = objc_loadWeakRetained(v4);
          int v8 = [v7 modeHasPassedPastInferenceTest:v3];

          if (v8)
          {
            id v9 = objc_loadWeakRetained(v4);
            [v9 resetUserDefaultsIfNecessaryForMode:v3];

            id v10 = objc_loadWeakRetained(v4);
            [v10 processNewInferredModeEvent:v11];
          }
        }
      }
    }
  }
}

- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = allModesForModeSetupPrediction();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntegerValue", (void)v11) == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)modeHasPassedPastInferenceTest:(unint64_t)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__93;
  v20[4] = __Block_byref_object_dispose__93;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__93;
  v18[4] = __Block_byref_object_dispose__93;
  id v19 = 0;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__93;
  v16[3] = __Block_byref_object_dispose__93;
  id v17 = 0;
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  uint64_t v5 = BiomeLibrary();
  uint64_t v6 = [v5 UserFocus];
  uint64_t v7 = [v6 InferredMode];

  int v8 = objc_msgSend(v7, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 0, 0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke;
  v14[3] = &unk_1E68AC060;
  v14[4] = &v15;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke_2;
  v13[3] = &unk_1E68B4938;
  v13[4] = v20;
  v13[5] = v18;
  v13[6] = &v22;
  v13[7] = a3;
  id v9 = (id)[v8 sinkWithCompletion:v14 receiveInput:v13];
  if (*(void *)(v16[0] + 40))
  {
    id v10 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXUserEducationSuggestionFocusModeSetupTrigger modeHasPassedPastInferenceTest:]((uint64_t)v16, v10);
    }
  }
  BOOL v11 = v23[3] != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

uint64_t __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke_2(void *a1, void *a2)
{
  id obj = [a2 eventBody];
  if ([obj modeType] != 2)
  {
    if ([obj modeType])
    {
      [obj modeType];
      BMUserFocusInferredModeTypeToActivity();
      if (ATXModeFromActivityType() == a1[7])
      {
        if (*(void *)(*(void *)(a1[4] + 8) + 40))
        {
          if ([obj isStart])
          {
            objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), obj);
            uint64_t v3 = [obj absoluteTimestamp];
            uint64_t v4 = *(void *)(a1[5] + 8);
            uint64_t v5 = *(void **)(v4 + 40);
            *(void *)(v4 + 40) = v3;
          }
          else if (([obj isStart] & 1) == 0)
          {
            uint64_t v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
            uint64_t v7 = [obj absoluteTimestamp];
            [v6 timeIntervalSinceDate:v7];
            double v9 = fabs(v8);

            if (v9 >= 3600.0) {
              ++*(void *)(*(void *)(a1[6] + 8) + 24);
            }
          }
        }
      }
    }
  }
}

- (void)processNewInferredModeEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_observers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "processNewInferredModeEvent:", v4, (void)v10);
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

- (void)resetUserDefaultsIfNecessaryForMode:(unint64_t)a3
{
  id v7 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v5 = [v7 dndSemanticTypeForATXMode:a3];
  uint64_t v6 = [v5 integerValue];

  [(ATXUserEducationSuggestionFocusModeSetupTrigger *)self resetUserDefaultsIfNecessaryForDNDSemanticType:v6];
}

- (void)resetUserDefaultsIfNecessaryForDNDSemanticType:(int64_t)a3
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v17 = (id)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v4 = NSString;
  id v5 = DNDModeSemanticTypeToString();
  uint64_t v6 = [v4 stringWithFormat:@"%@.%@.%@", @"DiscoverySuggestions.FocusModeSetup", v5, @"MajorOSVersion"];

  id v7 = NSString;
  uint64_t v8 = DNDModeSemanticTypeToString();
  uint64_t v9 = [v7 stringWithFormat:@"%@.%@.%@", @"DiscoverySuggestions.FocusModeSetup", v8, @"MinorOSVersion"];

  long long v10 = NSString;
  long long v11 = DNDModeSemanticTypeToString();
  long long v12 = [v10 stringWithFormat:@"%@.%@.%@", @"DiscoverySuggestions.State", @"FocusModeSetup", v11];

  uint64_t v13 = [v17 integerForKey:*MEMORY[0x1E4F4B6D0]];
  uint64_t v14 = [v17 integerForKey:*MEMORY[0x1E4F4B6E0]];
  uint64_t v15 = [v17 integerForKey:v6];
  uint64_t v16 = [v17 integerForKey:v9];
  if (v13 > v15 || v14 > v16) {
    [v17 removeObjectForKey:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inferredModeStreamSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 136315394;
  id v5 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]_block_invoke";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: ATXUserEducationSuggestionFocusModeSetupTrigger: Error listening to inferred mode change events: %@", (uint8_t *)&v4, 0x16u);
}

- (void)modeHasPassedPastInferenceTest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXUserEducationSuggestionFocusModeSetupTrigger: Could not fetch inferred mode stream with error: %@", (uint8_t *)&v3, 0xCu);
}

@end