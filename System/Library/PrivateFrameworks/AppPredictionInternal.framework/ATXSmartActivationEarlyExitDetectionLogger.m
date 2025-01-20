@interface ATXSmartActivationEarlyExitDetectionLogger
+ (id)sharedInstance;
- (ATXSmartActivationEarlyExitDetectionLogger)init;
- (BOOL)_logEventIfEarlyExit:(id)a3;
- (void)_processNewUserFocusComputedModeEvent:(id)a3;
- (void)_registerForModeChangeNotifications;
- (void)stopListening;
@end

@implementation ATXSmartActivationEarlyExitDetectionLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_24 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_24, &__block_literal_global_133);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_30;
  return v2;
}

void __60__ATXSmartActivationEarlyExitDetectionLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_30;
  sharedInstance__pasExprOnceResult_30 = v1;
}

- (ATXSmartActivationEarlyExitDetectionLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXSmartActivationEarlyExitDetectionLogger;
  v2 = [(ATXSmartActivationEarlyExitDetectionLogger *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXSmartActivationEarlyExitDetectionLogger *)v2 _registerForModeChangeNotifications];
  }
  return v3;
}

- (void)_registerForModeChangeNotifications
{
  if (!self->_queue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SmartActivationEarlyExitDetection.queue", v3);
    queue = self->_queue;
    self->_queue = v4;
  }
  v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: registering for real time mode change events", (uint8_t *)buf, 2u);
  }

  v7 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.SmartActivationEarlyExitDetection" targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  objc_initWeak(buf, self);
  v9 = BiomeLibrary();
  v10 = [v9 UserFocus];
  v11 = [v10 ComputedMode];
  v12 = objc_msgSend(v11, "atx_DSLPublisher");
  v13 = [v12 subscribeOn:self->_scheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_13;
  v16[3] = &unk_1E68AE228;
  objc_copyWeak(&v17, buf);
  v14 = [v13 sinkWithCompletion:&__block_literal_global_12_0 receiveInput:v16];
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = __atxlog_handle_modes();
  objc_super v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_cold_1(v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: done listening to mode change events", v6, 2u);
  }
}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [v3 eventBody];
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: processing new userFocusComputedModeEvent: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processNewUserFocusComputedModeEvent:v3];
}

- (void)_processNewUserFocusComputedModeEvent:(id)a3
{
  id v6 = a3;
  v4 = [v6 eventBody];

  if (v4)
  {
    objc_super v5 = [v6 eventBody];
    [(ATXSmartActivationEarlyExitDetectionLogger *)self _logEventIfEarlyExit:v5];
  }
}

- (BOOL)_logEventIfEarlyExit:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 starting] & 1) != 0 || objc_msgSend(v3, "updateReason") != 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F93658] currentMode];
    objc_super v5 = [v4 modeIdentifier];

    if (v5)
    {
      id v6 = [v4 modeIdentifier];
      int v7 = [v3 mode];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F4AE78]) initWithBiomeInferredModeEvent:v4];
        id v9 = objc_alloc(MEMORY[0x1E4F4AE88]);
        v10 = [MEMORY[0x1E4F1C9C8] now];
        v11 = (void *)[v9 initWithEventDate:v10 activity:v5 acceptedTriggers:MEMORY[0x1E4F1CBF0] eventType:5 suggestionType:1 location:2];

        v12 = __atxlog_handle_modes();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v4 modeIdentifier];
          int v17 = 138543874;
          v18 = v13;
          __int16 v19 = 2048;
          uint64_t v20 = (int)[v4 modeType];
          __int16 v21 = 2112;
          v22 = v11;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: Early exit detected for modeUUID: %{public}@, type:%ld. Sending feedback event to Biome: %@", (uint8_t *)&v17, 0x20u);
        }
        v14 = objc_opt_new();
        v15 = [v14 source];
        [v15 sendEvent:v11];

        LOBYTE(v5) = 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return (char)v5;
}

- (void)stopListening
{
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  objc_super v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSmartActivationEarlyExitDetectionLogger: error listening to mode change events: %@", (uint8_t *)&v4, 0xCu);
}

@end