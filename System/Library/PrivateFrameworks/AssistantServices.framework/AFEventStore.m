@interface AFEventStore
+ (id)sharedInstance;
- (BOOL)_filterAppleAudioEventsMoreThanADayOld:(id)a3;
- (BOOL)_filterHeadUnitEventsMoreThanADayOld:(id)a3;
- (BOOL)_isEvent:(id)a3 olderThan:(int64_t)a4;
- (id)_getPublisher;
- (id)_mapIDsToProduct:(id)a3;
- (id)_mapIDsToSELFEvents:(id)a3;
- (void)_populateBTCarEventOUID:(id)a3 carBluetoothHeadunit:(id)a4;
- (void)deleteAllBTEventsWithQueue:(id)a3 withCompletionHandler:(id)a4;
- (void)deleteAllSiriServiceEventsWithQueue:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler:(id)a3;
- (void)fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 withQueue:(id)a5 withCompletionHandler:(id)a6;
- (void)fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:(id)a3;
- (void)storeBTEvent:(id)a3 withQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)storeSiriServiceEvent:(id)a3 withQueue:(id)a4 atTime:(id)a5 withCompletionHandler:(id)a6;
- (void)storeSiriServiceEvent:(id)a3 withQueue:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation AFEventStore

- (void)deleteAllSiriServiceEventsWithQueue:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = SoftBiomeLibrary();
  v8 = [v7 Siri];
  v9 = [v8 Service];

  if (!v9)
  {
    v10 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[AFEventStore(SiriService) deleteAllSiriServiceEventsWithQueue:withCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Biome stream unavailable", buf, 0xCu);
    }
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
    v6[2](v6, v11);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__AFEventStore_SiriService__deleteAllSiriServiceEventsWithQueue_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E592C6E8;
  id v15 = v9;
  v16 = v6;
  v12 = v6;
  id v13 = v9;
  dispatch_async(v5, v14);
}

uint64_t __87__AFEventStore_SiriService__deleteAllSiriServiceEventsWithQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pruner];
  [v2 deleteWithPolicy:@"assistant.siriservice.delete" eventsPassingTest:&__block_literal_global_15_26895];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

BOOL __87__AFEventStore_SiriService__deleteAllSiriServiceEventsWithQueue_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return a2 != 0;
}

- (void)fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 withQueue:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[AFEventStore(SiriService) fetchEventsBetweenStartDate:endDate:withQueue:withCompletionHandler:]";
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s Fetching SiriServices Biome events between startData: %@, endDate: %@", buf, 0x20u);
  }
  v14 = SoftBiomeLibrary();
  id v15 = [v14 Siri];
  v16 = [v15 Service];

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v16)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5928E40;
    id v21 = v16;
    id v22 = v9;
    id v23 = v10;
    id v24 = v17;
    id v25 = v12;
    dispatch_async(v11, block);

    v18 = v21;
  }
  else
  {
    uint64_t v19 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[AFEventStore(SiriService) fetchEventsBetweenStartDate:endDate:withQueue:withCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_ERROR, "%s Biome stream unavailable", buf, 0xCu);
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v18);
  }
}

void __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) publisherWithUseCase:@"Assistant"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5928E68;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v3 = [v2 filterWithIsIncluded:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke_7;
  v5[3] = &unk_1E592BEA8;
  id v6 = *(id *)(a1 + 56);
  id v4 = (id)[v3 sinkWithCompletion:&__block_literal_global_26915 receiveInput:v5];

  (*(void (**)(void, id, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(id *)(a1 + 56), 0);
}

BOOL __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v3 timestamp];
  v5 = objc_msgSend(v4, "initWithTimeIntervalSinceReferenceDate:");
  id v6 = [v3 eventBody];
  v7 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315650;
    id v17 = "-[AFEventStore(SiriService) fetchEventsBetweenStartDate:endDate:withQueue:withCompletionHandler:]_block_invoke_2";
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    id v21 = v5;
  }
  [v3 timestamp];
  double v9 = v8;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v9 >= v10)
  {
    [v3 timestamp];
    double v13 = v12;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    BOOL v11 = v13 <= v14;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    double v9 = v4;
    double v10 = [v3 eventBody];
    int v11 = 136315650;
    double v12 = "-[AFEventStore(SiriService) fetchEventsBetweenStartDate:endDate:withQueue:withCompletionHandler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 1024;
    int v16 = [v10 dismissalReason];
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s Received event %@ {dismissal reason:%d}", (uint8_t *)&v11, 0x1Cu);
  }
  v5 = *(void **)(a1 + 32);
  id v6 = [AFSiriServiceEvent alloc];
  v7 = [v3 eventBody];
  double v8 = [(AFEvent *)v6 initWithBMEvent:v7];
  [v5 addObject:v8];
}

void __97__AFEventStore_SiriService__fetchEventsBetweenStartDate_endDate_withQueue_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = (void *)AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      v5 = [v2 error];
      int v6 = 136315394;
      v7 = "-[AFEventStore(SiriService) fetchEventsBetweenStartDate:endDate:withQueue:withCompletionHandler:]_block_invoke";
      __int16 v8 = 2112;
      double v9 = v5;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching bluetooth event: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)storeSiriServiceEvent:(id)a3 withQueue:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)storeSiriServiceEvent:(id)a3 withQueue:(id)a4 atTime:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = [v9 bmEvent];

  if (v13)
  {
    id v14 = [v9 bmEvent];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    __int16 v15 = (void *)getBMSiriServiceClass_softClass_26924;
    uint64_t v40 = getBMSiriServiceClass_softClass_26924;
    if (!getBMSiriServiceClass_softClass_26924)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBMSiriServiceClass_block_invoke_26925;
      v42 = &unk_1E592C0B0;
      v43 = &v37;
      BiomeLibraryLibraryCore();
      Class Class = objc_getClass("BMSiriService");
      *(void *)(v43[1] + 24) = Class;
      getBMSiriServiceClass_softClass_26924 = *(void *)(v43[1] + 24);
      __int16 v15 = (void *)v38[3];
    }
    id v17 = v15;
    _Block_object_dispose(&v37, 8);
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v19 = SoftBiomeLibrary();
      __int16 v20 = [v19 Siri];
      id v21 = [v20 Service];

      if (v21)
      {
        uint64_t v22 = [v21 source];
        id v23 = AFSiriLogContextEvent;
        if (v22)
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_debug_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_DEBUG, "%s Dispatching event %@ to event source", buf, 0x16u);
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __90__AFEventStore_SiriService__storeSiriServiceEvent_withQueue_atTime_withCompletionHandler___block_invoke;
          block[3] = &unk_1E5928E40;
          id v32 = v9;
          id v33 = v11;
          id v34 = v22;
          id v35 = v21;
          id v36 = v12;
          dispatch_async(v10, block);

          id v24 = v32;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]";
            _os_log_error_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_ERROR, "%s Biome event stream unavailable", buf, 0xCu);
          }
          id v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10003 userInfo:0];
          (*((void (**)(id, void *))v12 + 2))(v12, v24);
        }
      }
      else
      {
        __int16 v30 = AFSiriLogContextEvent;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]";
          _os_log_error_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_ERROR, "%s Biome event stream unavailable", buf, 0xCu);
        }
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
        (*((void (**)(id, void *))v12 + 2))(v12, v22);
      }
    }
    else
    {
      id v25 = (void *)AFSiriLogContextEvent;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
      {
        v26 = v25;
        v27 = objc_opt_class();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        id v28 = v27;
      }
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10005 userInfo:0];
      (*((void (**)(id, void *))v12 + 2))(v12, v21);
    }
  }
  else
  {
    id v29 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_ERROR, "%s Biome base event unavailable for AFBTEvent", buf, 0xCu);
    }
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10002 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v21);
  }
}

void __90__AFEventStore_SiriService__storeSiriServiceEvent_withQueue_atTime_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) bmEvent];
  id v3 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    id v9 = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v2;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Sending event %@ to event source", (uint8_t *)&v8, 0x16u);
  }
  id v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "sendEvent:timestamp:", v2);
  }
  else
  {
    [*(id *)(a1 + 48) sendEvent:v2];
  }
  int v6 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = 136315650;
    id v9 = "-[AFEventStore(SiriService) storeSiriServiceEvent:withQueue:atTime:withCompletionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v2;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s Sent event %@ to stream %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_36769 != -1) {
    dispatch_once(&sharedInstance_onceToken_36769, &__block_literal_global_36770);
  }
  id v2 = (void *)sharedInstance_store;
  return v2;
}

void __30__AFEventStore_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AFEventStore);
  v1 = (void *)sharedInstance_store;
  sharedInstance_store = (uint64_t)v0;
}

- (void)fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  v5 = (void (**)(id, id, void))a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(AFEventStore *)self _getPublisher];
  int v8 = v7;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__AFEventStore_BluetoothEvent__fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E592BE10;
    v16[4] = self;
    id v9 = [v7 filterWithIsIncluded:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__AFEventStore_BluetoothEvent__fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler___block_invoke_32;
    v14[3] = &unk_1E592BEA8;
    id v10 = v6;
    id v15 = v10;
    id v11 = (id)[v9 sinkWithCompletion:&__block_literal_global_31 receiveInput:v14];

    v5[2](v5, v10, 0);
  }
  else
  {
    __int16 v12 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v18 = "-[AFEventStore(BluetoothEvent) fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Error creating Biome publisher", buf, 0xCu);
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
    ((void (**)(id, id, void *))v5)[2](v5, 0, v13);
  }
}

uint64_t __97__AFEventStore_BluetoothEvent__fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _filterAppleAudioEventsMoreThanADayOld:a2];
}

void __97__AFEventStore_BluetoothEvent__fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 eventBody];
  int v5 = [v4 hasProductID];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    int v8 = [v3 eventBody];
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"%d", objc_msgSend(v8, "productID"));
    [v6 addObject:v9];
  }
  else
  {
    id v10 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "-[AFEventStore(BluetoothEvent) fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s Received event '%@' with no product id", buf, 0x16u);
    }
    [*(id *)(a1 + 32) addObject:@"unknown_product_id"];
  }
}

void __97__AFEventStore_BluetoothEvent__fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = (void *)AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      int v5 = [v2 error];
      int v6 = 136315394;
      uint64_t v7 = "-[AFEventStore(BluetoothEvent) fetchAppleAudioDeviceConnectedInLast24HoursWithCompletionHandler:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching bluetooth event: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  int v5 = (void (**)(id, void *, void))a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(AFEventStore *)self _getPublisher];
  __int16 v8 = v7;
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E592BE10;
    v19[4] = self;
    id v9 = [v7 filterWithIsIncluded:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E592BE38;
    v18[4] = self;
    uint64_t v10 = [v9 mapWithTransform:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_28;
    v16[3] = &unk_1E592BE80;
    id v11 = v6;
    id v17 = v11;
    id v12 = (id)[v10 sinkWithCompletion:&__block_literal_global_27 receiveInput:v16];

    __int16 v13 = [v11 allObjects];
    v5[2](v5, v13, 0);
  }
  else
  {
    id v14 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[AFEventStore(BluetoothEvent) fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Error creating Biome publisher", buf, 0xCu);
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v15);
  }
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _filterHeadUnitEventsMoreThanADayOld:a2];
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mapIDsToSELFEvents:a2];
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = (void *)AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      int v5 = [v2 error];
      int v6 = 136315394;
      uint64_t v7 = "-[AFEventStore(BluetoothEvent) fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:]_block_invoke_3";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching bluetooth event: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)_getPublisher
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = SoftBiomeLibrary_45276();
  id v3 = [v2 Device];
  id v4 = [v3 Wireless];
  int v5 = [v4 Bluetooth];

  if (v5)
  {
    int v6 = [v5 publisherWithUseCase:@"Assistant"];
  }
  else
  {
    __int16 v8 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[AFEventStore(BluetoothEvent) _getPublisher]";
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Error creating Biome stream", (uint8_t *)&v9, 0xCu);
    }
    int v6 = 0;
  }

  return v6;
}

- (id)_mapIDsToProduct:(id)a3
{
  id v4 = [a3 eventBody];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA1270]);
  if ([v4 hasProductID])
  {
    int v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "productID"));
    [v5 setHeadUnitProductId:v6];
  }
  if ([v4 hasVendorID])
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "vendorID"));
    [v5 setHeadUnitVendorId:v7];
  }
  [(AFEventStore *)self _populateBTCarEventOUID:v4 carBluetoothHeadunit:v5];

  return v5;
}

- (id)_mapIDsToSELFEvents:(id)a3
{
  id v4 = [a3 eventBody];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA1270]);
  if ([v4 hasProductID])
  {
    int v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "productID"));
    [v5 setHeadUnitProductId:v6];
  }
  if ([v4 hasVendorID])
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "vendorID"));
    [v5 setHeadUnitVendorId:v7];
  }
  [(AFEventStore *)self _populateBTCarEventOUID:v4 carBluetoothHeadunit:v5];

  return v5;
}

- (void)_populateBTCarEventOUID:(id)a3 carBluetoothHeadunit:(id)a4
{
  id v10 = a4;
  id v5 = [a3 address];
  int v6 = [v5 dataUsingEncoding:4];

  if ((unint64_t)[v6 length] < 9)
  {
    [v10 setOrganizationallyUniqueId:@"N/A"];
  }
  else
  {
    uint64_t v7 = objc_msgSend(v6, "subdataWithRange:", 0, 9);
    __int16 v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    int v9 = [v8 stringByReplacingOccurrencesOfString:@":" withString:&stru_1EEE35D28];

    if (v9) {
      [v10 setOrganizationallyUniqueId:v9];
    }
  }
}

- (BOOL)_filterAppleAudioEventsMoreThanADayOld:(id)a3
{
  id v4 = a3;
  if ([(AFEventStore *)self _isEvent:v4 olderThan:24])
  {
    id v5 = [v4 eventBody];
    if (v5)
    {
      int v6 = [v4 eventBody];
      char v7 = [v6 hasAppleAudioDevice];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_filterHeadUnitEventsMoreThanADayOld:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventBody];
  if ([v5 deviceType] == 18)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [v4 eventBody];
    BOOL v6 = [v7 deviceType] == 23;
  }
  BOOL v8 = [(AFEventStore *)self _isEvent:v4 olderThan:24] && v6;

  return v8;
}

- (BOOL)_isEvent:(id)a3 olderThan:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    char v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v8 = [v7 dateByAddingUnit:32 value:-a4 toDate:v6 options:0];

    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v6 timeIntervalSinceReferenceDate];
    double v12 = v11;
    [v5 timestamp];
    if (v13 >= v10)
    {
      [v5 timestamp];
      BOOL v14 = v15 <= v12;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)deleteAllBTEventsWithQueue:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = SoftBiomeLibrary_45276();
  BOOL v8 = [v7 Device];
  double v9 = [v8 Wireless];
  double v10 = [v9 Bluetooth];

  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__AFEventStore_BluetoothEvent__deleteAllBTEventsWithQueue_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E592C6E8;
    id v14 = v10;
    id v15 = v6;
    dispatch_async(v5, v13);

    double v11 = v14;
  }
  else
  {
    double v12 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[AFEventStore(BluetoothEvent) deleteAllBTEventsWithQueue:withCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Biome stream unavailable", buf, 0xCu);
    }
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

uint64_t __81__AFEventStore_BluetoothEvent__deleteAllBTEventsWithQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pruner];
  [v2 deleteWithPolicy:@"assistant.device.bt.delete" eventsPassingTest:&__block_literal_global_45308];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

BOOL __81__AFEventStore_BluetoothEvent__deleteAllBTEventsWithQueue_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return a2 != 0;
}

- (void)storeBTEvent:(id)a3 withQueue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = a4;
  id v9 = a5;
  double v10 = [v7 bmEvent];

  if (v10)
  {
    double v11 = [v7 bmEvent];
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x2050000000;
    double v12 = (void *)getBMDeviceBluetoothClass_softClass;
    uint64_t v36 = getBMDeviceBluetoothClass_softClass;
    if (!getBMDeviceBluetoothClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBMDeviceBluetoothClass_block_invoke;
      v38 = &unk_1E592C0B0;
      uint64_t v39 = &v33;
      BiomeLibraryLibraryCore_45290();
      Class Class = objc_getClass("BMDeviceBluetooth");
      *(void *)(v39[1] + 24) = Class;
      getBMDeviceBluetoothClass_softClass Class = *(void *)(v39[1] + 24);
      double v12 = (void *)v34[3];
    }
    id v14 = v12;
    _Block_object_dispose(&v33, 8);
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v16 = SoftBiomeLibrary_45276();
      id v17 = [v16 Device];
      uint64_t v18 = [v17 Wireless];
      uint64_t v19 = [v18 Bluetooth];

      if (v19)
      {
        __int16 v20 = [v19 source];
        id v21 = AFSiriLogContextEvent;
        if (v20)
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v7;
            _os_log_debug_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_DEBUG, "%s Dispatching event %@ to event source", buf, 0x16u);
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __77__AFEventStore_BluetoothEvent__storeBTEvent_withQueue_withCompletionHandler___block_invoke;
          block[3] = &unk_1E592C598;
          id v30 = v7;
          id v31 = v20;
          id v32 = v9;
          dispatch_async(v8, block);

          uint64_t v22 = v30;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]";
            _os_log_error_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_ERROR, "%s Biome event stream unavailable for bluetooth device", buf, 0xCu);
          }
          uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10003 userInfo:0];
          (*((void (**)(id, void *))v9 + 2))(v9, v22);
        }
      }
      else
      {
        id v25 = AFSiriLogContextEvent;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]";
          _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, "%s Biome event stream unavailable for bluetooth device", buf, 0xCu);
        }
        __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10001 userInfo:0];
        (*((void (**)(id, void *))v9 + 2))(v9, v20);
      }
    }
    else
    {
      id v24 = (void *)AFSiriLogContextEvent;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
      {
        v26 = v24;
        v27 = objc_opt_class();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        id v28 = v27;
      }
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10005 userInfo:0];
      (*((void (**)(id, void *))v9 + 2))(v9, v19);
    }
  }
  else
  {
    id v23 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]";
      _os_log_error_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_ERROR, "%s Biome base event unavailable for AFBTEvent", buf, 0xCu);
    }
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantEventDomain" code:10002 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v19);
  }
}

void __77__AFEventStore_BluetoothEvent__storeBTEvent_withQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) bmEvent];
  id v3 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    BOOL v8 = v2;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Sending event %@ to event source", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 40) sendEvent:v2];
  id v4 = AFSiriLogContextEvent;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFEventStore(BluetoothEvent) storeBTEvent:withQueue:withCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    BOOL v8 = v2;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Sent event %@ to stream Device.Wireless.Bluetooth", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end