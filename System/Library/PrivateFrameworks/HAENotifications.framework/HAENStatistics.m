@interface HAENStatistics
+ (id)sharedInstance;
- (HAENStatistics)init;
- (id)volumeActionString:(unsigned int)a3;
- (void)_sendMessage:(id)a3;
- (void)processMessage:(id)a3;
- (void)processStatsForEvent:(id)a3;
- (void)processStatsForLocationGating:(id *)a3;
@end

@implementation HAENStatistics

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __32__HAENStatistics_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(HAENStatistics);
  return MEMORY[0x270F9A758]();
}

- (HAENStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)HAENStatistics;
  v2 = [(HAENStatistics *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coreaudio.hae.notifications.stats", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)processStatsForEvent:(id)a3
{
  id v4 = a3;
  v5 = +[HAENVolumeControl sharedInstance];
  uint64_t v6 = [v5 getStats];
  int v8 = v7;

  eventQueue = self->_eventQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__HAENStatistics_processStatsForEvent___block_invoke;
  v11[3] = &unk_264527540;
  v13 = self;
  uint64_t v14 = v6;
  int v15 = v8;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(eventQueue, v11);
}

void __39__HAENStatistics_processStatsForEvent___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) eventType];
  dispatch_queue_t v3 = @"loud";
  if (v2 == 2003133803) {
    dispatch_queue_t v3 = @"weekly";
  }
  id v4 = NSNumber;
  v5 = *(void **)(a1 + 32);
  v30 = v3;
  [v5 level];
  v28 = objc_msgSend(v4, "numberWithDouble:");
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  int v7 = [NSNumber numberWithFloat:v6];
  LODWORD(v8) = *(_DWORD *)(a1 + 52);
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  id v10 = [*(id *)(a1 + 40) volumeActionString:*(unsigned int *)(a1 + 56)];
  v11 = NSNumber;
  id v12 = +[HAENDefaults sharedInstance];
  v29 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isHAENFeatureOptedIn"));

  v13 = NSNumber;
  uint64_t v14 = +[HAENDefaults sharedInstance];
  int v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isHAENFeatureMandatory"));

  v16 = NSNumber;
  v17 = +[HAENDefaults sharedInstance];
  v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isEUVolumeLimitOn"));

  v19 = NSNumber;
  v20 = +[HAENDefaults sharedInstance];
  v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "isSKVolumeLimitOn"));

  v22 = [*(id *)(a1 + 32) metadata];
  uint64_t v23 = [v22 objectForKey:@"_HAENMetadataIdentifierWeeklyDosage"];

  if (v23) {
    v24 = (void *)v23;
  }
  else {
    v24 = &unk_26D151FA8;
  }
  v31 = (void *)v9;
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v24, @"dose", v28, @"level", v30, @"event_type", v15, @"feature_mandatory", v18, @"eu_volume_limit", v21, @"sk_volume_lmit", v29, @"feature_opt_in", v7, @"current_volume", v9,
    @"target_volume",
    v10,
    @"volume_action",
  v25 = 0);

  [*(id *)(a1 + 40) _sendMessage:v25];
  v26 = HAENotificationsLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_21FABA000, v26, OS_LOG_TYPE_DEFAULT, "HAENStatistics sent %@", buf, 0xCu);
  }
}

- (id)volumeActionString:(unsigned int)a3
{
  dispatch_queue_t v3 = @"lowered";
  id v4 = @"unknown";
  if (a3 == 1986814576) {
    id v4 = @"bypassed";
  }
  if (a3 != 1986817143) {
    dispatch_queue_t v3 = v4;
  }
  if (a3 == 561409132) {
    return @"failed";
  }
  else {
    return v3;
  }
}

- (void)processStatsForLocationGating:(id *)a3
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3254779904;
  block[2] = __48__HAENStatistics_processStatsForLocationGating___block_invoke;
  block[3] = &unk_26D14ED70;
  __copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)v7, (uint64_t)a3);
  block[4] = self;
  dispatch_async(eventQueue, block);

  __destructor_8_s0_s8_s16((uint64_t)a3);
}

void __48__HAENStatistics_processStatsForLocationGating___block_invoke(uint64_t a1)
{
  int v2 = *(__CFString **)(a1 + 56);
  if (!v2) {
    int v2 = @"unknown";
  }
  dispatch_queue_t v3 = v2;
  id v4 = *(__CFString **)(a1 + 40);
  if (!v4) {
    id v4 = @"unknown";
  }
  v5 = v4;
  double v6 = *(__CFString **)(a1 + 48);
  if (!v6) {
    double v6 = @"unknown";
  }
  int v7 = NSNumber;
  double v8 = v6;
  uint64_t v9 = +[HAENDefaults sharedInstance];
  id v10 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "isSKVolumeLimitOn"));

  v11 = NSDictionary;
  id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  uint64_t v14 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"feature_mandatory", v3, @"disposition", v5, @"countryCode", v8, @"source", v13, @"eu_volume_limit", v10, @"sk_volume_limit", 0);

  [*(id *)(a1 + 32) _sendMessage:v14];
  int v15 = HAENotificationsLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_DEFAULT, "HAENStatistics location gating stats sent", buf, 2u);
  }
}

- (void)processMessage:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__HAENStatistics_processMessage___block_invoke;
  v7[3] = &unk_264527518;
  id v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __33__HAENStatistics_processMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40)];
}

- (void)_sendMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end