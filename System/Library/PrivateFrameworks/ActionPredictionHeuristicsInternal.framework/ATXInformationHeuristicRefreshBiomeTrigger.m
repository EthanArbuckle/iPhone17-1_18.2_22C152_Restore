@interface ATXInformationHeuristicRefreshBiomeTrigger
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshBiomeTrigger)initWithCoder:(id)a3;
- (ATXInformationHeuristicRefreshBiomeTrigger)initWithStreamType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXInformationHeuristicRefreshBiomeTrigger:(id)a3;
- (id)_publisher;
- (id)description;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshBiomeTrigger

- (ATXInformationHeuristicRefreshBiomeTrigger)initWithStreamType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  result = [(ATXInformationHeuristicRefreshTrigger *)&v5 init];
  if (result) {
    result->_streamType = a3;
  }
  return result;
}

- (void)_start
{
  if (!self->_sink)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.proactive.ActionPredictionHeuristicsInternal.BiomeTrigger.%ld", self->_streamType);
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    queue = self->_queue;
    self->_queue = v6;

    v8 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:v3 targetQueue:self->_queue];
    scheduler = self->_scheduler;
    self->_scheduler = v8;

    objc_initWeak(&location, self);
    v10 = [(ATXInformationHeuristicRefreshBiomeTrigger *)self _publisher];
    v11 = [v10 subscribeOn:self->_scheduler];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke;
    v16[3] = &unk_1E68A5100;
    objc_copyWeak(&v17, &location);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_181;
    v14[3] = &unk_1E68A5128;
    objc_copyWeak(&v15, &location);
    v12 = [v11 sinkWithCompletion:v16 receiveInput:v14];
    sink = self->_sink;
    self->_sink = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_7;
  }
  objc_super v5 = [v3 error];

  if (v5)
  {
    v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_2((uint64_t)WeakRetained, v3);
    }
LABEL_7:
  }
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_181(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = __atxlog_handle_gi();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[3];
      int v6 = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshBiomeTrigger: new event in stream: %ld. Triggering heuristics refresh.", (uint8_t *)&v6, 0xCu);
    }

    v4 = [WeakRetained delegate];
    objc_super v5 = [WeakRetained registeredHeuristics];
    [v4 informationHeuristicRefreshTrigger:WeakRetained didTriggerRefreshForHeuristics:v5];
  }
}

- (id)_publisher
{
  int64_t streamType = self->_streamType;
  if (streamType == 2)
  {
    v4 = BiomeLibrary();
    objc_super v5 = [v4 IntelligencePlatform];
    uint64_t v7 = [v5 Views];
    uint64_t v8 = [v7 Updated];
    uint64_t v9 = [v8 DSLPublisherWithUseCase:@"FutureLifeEvent"];
    v2 = [v9 filterWithKeyPath:@"eventBody.viewName" value:@"futureLifeEventMap"];
  }
  else
  {
    if (streamType == 1)
    {
      v4 = BiomeLibrary();
      objc_super v5 = [v4 UserFocus];
      int v6 = [v5 InferredMode];
    }
    else
    {
      if (streamType) {
        goto LABEL_9;
      }
      v4 = BiomeLibrary();
      objc_super v5 = [v4 UserFocus];
      int v6 = [v5 ComputedMode];
    }
    uint64_t v7 = v6;
    v2 = objc_msgSend(v6, "atx_DSLPublisher");
  }

LABEL_9:

  return v2;
}

- (void)_stop
{
}

- (unint64_t)hash
{
  return self->_streamType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXInformationHeuristicRefreshBiomeTrigger *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXInformationHeuristicRefreshBiomeTrigger *)self isEqualToATXInformationHeuristicRefreshBiomeTrigger:v5];

  return v6;
}

- (BOOL)isEqualToATXInformationHeuristicRefreshBiomeTrigger:(id)a3
{
  return self->_streamType == *((void *)a3 + 3);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"ATXInformationHeuristicRefreshBiomeTrigger for %ld", self->_streamType);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  id v4 = a3;
  [(ATXInformationHeuristicRefreshTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_streamType, @"streamType", v5.receiver, v5.super_class);
}

- (ATXInformationHeuristicRefreshBiomeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  objc_super v5 = [(ATXInformationHeuristicRefreshTrigger *)&v10 initWithCoder:v4];
  if (!v5
    || ([v4 error], BOOL v6 = objc_claimAutoreleasedReturnValue(), v6, v6)
    || (v5->_int64_t streamType = [v4 decodeIntegerForKey:@"streamType"],
        [v4 error],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 error];
  OUTLINED_FUNCTION_1_2(&dword_1D0F43000, v2, v3, "ATXInformationHeuristicRefreshBiomeTrigger: error subscribing to stream: %ld: %@", v4, v5, v6, v7, 2u);
}

@end