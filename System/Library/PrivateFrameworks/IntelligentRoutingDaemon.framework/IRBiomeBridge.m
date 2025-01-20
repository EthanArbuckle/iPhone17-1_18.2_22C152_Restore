@interface IRBiomeBridge
+ (void)_logCompletion:(id)a3;
- (IRBiomeBridge)initWithBiomeProvider:(id)a3 targetQueue:(id)a4;
- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4;
- (void)dealloc;
- (void)subscribeEvent:(int64_t)a3;
- (void)unsubscribeEvent:(int64_t)a3;
@end

@implementation IRBiomeBridge

- (IRBiomeBridge)initWithBiomeProvider:(id)a3 targetQueue:(id)a4
{
  id obj = a3;
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IRBiomeBridge;
  v7 = [(IRBiomeBridge *)&v23 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_biomeProvider, obj);
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
    eventTypeToSinkMap = v8->_eventTypeToSinkMap;
    v8->_eventTypeToSinkMap = (NSMutableDictionary *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
    eventTypeToSchedulerMap = v8->_eventTypeToSchedulerMap;
    v8->_eventTypeToSchedulerMap = (NSMutableDictionary *)v11;

    for (uint64_t i = 1; i != 4; ++i)
    {
      id v14 = objc_alloc(MEMORY[0x263F2A758]);
      v15 = NSString;
      v16 = ((void (*)(uint64_t))IRBiomeEventTypeToString)(i);
      v17 = [v15 stringWithFormat:@"com.apple.%@", v16];
      v18 = (void *)[v14 initWithIdentifier:v17 targetQueue:v6 waking:0];

      v19 = v8->_eventTypeToSchedulerMap;
      v20 = [NSNumber numberWithInt:i];
      [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];
    }
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_eventTypeToSinkMap;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_eventTypeToSinkMap objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 cancel];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)IRBiomeBridge;
  [(IRBiomeBridge *)&v9 dealloc];
}

- (void)subscribeEvent:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = (const void **)MEMORY[0x263F50120];
  uint64_t v6 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v7 = (os_log_t *)MEMORY[0x263F50090];
  v8 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    objc_super v9 = v8;
    ((void (*)(int64_t))IRBiomeEventTypeToString)(a3);
    id v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "#biome-bridge, ";
    __int16 v27 = 2112;
    v28 = v6;
    __int16 v29 = 2080;
    uint64_t v30 = [v10 UTF8String];
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_INFO, "%s[%@], IRBiomeBridge, subscribing a context notification of event type, %s", buf, 0x20u);
  }
  long long v11 = [[IRBiomeParameters alloc] initWithBiomeEventType:a3];
  long long v12 = [(IRBiomeParameters *)v11 contextPublisher];
  eventTypeToSchedulerMap = self->_eventTypeToSchedulerMap;
  id v14 = [NSNumber numberWithInteger:a3];
  uint64_t v15 = [(NSMutableDictionary *)eventTypeToSchedulerMap objectForKeyedSubscript:v14];

  v16 = [v12 subscribeOn:v15];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __32__IRBiomeBridge_subscribeEvent___block_invoke_9;
  v24[3] = &unk_2653A0570;
  v24[4] = self;
  v24[5] = a3;
  v17 = [v16 sinkWithCompletion:&__block_literal_global_13 receiveInput:v24];

  if (v17)
  {
    eventTypeToSinkMap = self->_eventTypeToSinkMap;
    v19 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)eventTypeToSinkMap setObject:v17 forKeyedSubscript:v19];
  }
  else
  {
    v19 = dispatch_get_specific(*v5);
    os_log_t v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      ((void (*)(int64_t))IRBiomeEventTypeToString)(a3);
      id v22 = objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v22 UTF8String];
      *(_DWORD *)buf = 136315650;
      v26 = "#biome-bridge, ";
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2080;
      uint64_t v30 = v23;
      _os_log_impl(&dword_25418E000, v21, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome subscribe error] Failed at subscribing a biome stream of event type: %s", buf, 0x20u);
    }
  }
}

void __32__IRBiomeBridge_subscribeEvent___block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v1 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    v3 = "#biome-bridge, ";
    __int16 v4 = 2112;
    uint64_t v5 = v0;
    _os_log_impl(&dword_25418E000, v1, OS_LOG_TYPE_INFO, "%s[%@], IRBiomeBridge, context stream comletion block called, possibly sink is cancelled", (uint8_t *)&v2, 0x16u);
  }
}

void __32__IRBiomeBridge_subscribeEvent___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v5 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    v8 = "#biome-bridge, ";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_DEBUG, "%s[%@], IRBiomeBridge, received a context biome event", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained notifyObserversOfEvent:*(void *)(a1 + 40) withValue:v3];
}

- (void)unsubscribeEvent:(int64_t)a3
{
  eventTypeToSinkMap = self->_eventTypeToSinkMap;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v9 = [(NSMutableDictionary *)eventTypeToSinkMap objectForKeyedSubscript:v6];

  [v9 cancel];
  int v7 = self->_eventTypeToSinkMap;
  v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v7 removeObjectForKey:v8];
}

- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  os_log_t v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = (id)objc_opt_new();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:0 maxEvents:a4 lastN:a4 reversed:0];
  int v7 = [[IRBiomeParameters alloc] initWithBiomeEventType:a3];
  v8 = [(IRBiomeParameters *)v7 queryPublisherWithOptions:v6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke;
  v16[3] = &unk_2653A0598;
  v16[5] = a4;
  v16[6] = a3;
  v16[4] = &v17;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke_14;
  v13[3] = &unk_2653A05C0;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v17;
  id v10 = (id)[v8 sinkWithCompletion:v16 receiveInput:v13];
  uint64_t v11 = (void *)[(id)v18[5] copy];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = a1[5];
    v8 = v5;
    id v9 = [v6 numberWithUnsignedInteger:v7];
    ((void (*)(void))IRBiomeEventTypeToString)(a1[6]);
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 UTF8String];
    long long v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "count"));
    int v13 = 136316162;
    id v14 = "#biome-bridge, ";
    __int16 v15 = 2112;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Fetching latest %@ events of eventType %s completed. Fetch returned %@ events", (uint8_t *)&v13, 0x34u);
  }
  +[IRBiomeBridge _logCompletion:v3];
}

void __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke_14(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 eventBody];
  [*(id *)(a1 + 32) biomeEventClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

+ (void)_logCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 state];
  id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v6 = *MEMORY[0x263F50090];
  uint64_t v7 = *MEMORY[0x263F50090];
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      id v9 = [v3 error];
      id v10 = [v9 description];
      int v11 = 136315650;
      long long v12 = "#biome-bridge, ";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2080;
      uint64_t v16 = [v10 UTF8String];
      _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome stream complete error] Stream operation completed with error, %s\n", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    long long v12 = "#biome-bridge, ";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Stream operation completed succesfully.", (uint8_t *)&v11, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypeToSchedulerMap, 0);
  objc_storeStrong((id *)&self->_eventTypeToSinkMap, 0);

  objc_destroyWeak((id *)&self->_biomeProvider);
}

@end