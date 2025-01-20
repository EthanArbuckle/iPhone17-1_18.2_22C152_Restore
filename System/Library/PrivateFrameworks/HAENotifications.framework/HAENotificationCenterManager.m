@interface HAENotificationCenterManager
+ (id)sharedInstance;
- (HAENotificationCenterManager)init;
- (id)addHAENotificationEvent:(id)a3;
- (id)sendBannerNotificationWithEvent:(id)a3 volumeLoweringAction:(unsigned int)a4;
- (id)sendLiveExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4;
- (id)sendWeeklyExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4;
- (void)donateSignalToTipsKit:(id)a3;
@end

@implementation HAENotificationCenterManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __46__HAENotificationCenterManager_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(HAENotificationCenterManager);
  return MEMORY[0x270F9A758]();
}

- (HAENotificationCenterManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HAENotificationCenterManager;
  v2 = [(HAENotificationCenterManager *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(NotificationCenter);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    dispatch_queue_t v5 = dispatch_queue_create((const char *)[@"com.apple.coreaudio.adam.hae.notification" UTF8String], 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v5;

    v7 = +[HAENDefaults sharedInstance];
    [v7 getLiveMonitoringThreshold];
    v2->_liveThresholdInDBA = v8;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    sem = v2->_sem;
    v2->_sem = (OS_dispatch_semaphore *)v9;
  }
  return v2;
}

- (id)addHAENotificationEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager starting event: [%@]", buf, 0xCu);
  }
  v7 = HAENotificationsLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  dispatch_semaphore_t v9 = HAENotificationsLog();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_signpost_emit_with_name_impl(&dword_21FABA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddHAENotificationEvent", "%@", buf, 0xCu);
  }
  eventQueue = self->_eventQueue;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke;
  v21 = &unk_264527518;
  id v13 = v4;
  id v22 = v13;
  v23 = self;
  dispatch_sync(eventQueue, &v18);
  v14 = HAENotificationsLog();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v16 = objc_msgSend(v13, "uuid", v18, v19, v20, v21);
    *(_DWORD *)buf = 138412290;
    v25 = v16;
    _os_signpost_emit_with_name_impl(&dword_21FABA000, v15, OS_SIGNPOST_INTERVAL_END, v8, "AddHAENotificationEvent", "%@", buf, 0xCu);
  }
  [(HAENotificationCenterManager *)self donateSignalToTipsKit:v13];

  return 0;
}

void __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke(uint64_t a1)
{
  v2 = +[HAENSystemSoundPlayer sharedInstance];
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke_2;
  v9[3] = &unk_2645274F0;
  id v10 = v3;
  id v4 = (id)[v2 playSystemSoundWithEvent:v10 completion:v9];

  dispatch_queue_t v5 = +[HAENVolumeControl sharedInstance];
  uint64_t v6 = [v5 limitVolume:*(void *)(a1 + 32)];

  id v7 = (id)[*(id *)(a1 + 40) sendBannerNotificationWithEvent:*(void *)(a1 + 32) volumeLoweringAction:v6];
  os_signpost_id_t v8 = +[HAENStatistics sharedInstance];
  [v8 processStatsForEvent:*(void *)(a1 + 32)];
}

void __56__HAENotificationCenterManager_addHAENotificationEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = HAENotificationsLog();
  v3 = [*(id *)(a1 + 32) uuid];
  os_signpost_id_t v4 = [v3 hash];

  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    dispatch_queue_t v5 = [*(id *)(a1 + 32) uuid];
    int v7 = 138412290;
    os_signpost_id_t v8 = v5;
    _os_signpost_emit_with_name_impl(&dword_21FABA000, v2, OS_SIGNPOST_INTERVAL_END, v4, "HAENSSPlayed", "%@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "finished playing system sound...", (uint8_t *)&v7, 2u);
  }
}

- (id)sendBannerNotificationWithEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = HAENotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v8 = [v6 uuid];
    int v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendBannerNotificationWithEvent [%@]", (uint8_t *)&v13, 0xCu);
  }
  if ([v6 eventType] == 1818850917)
  {
    uint64_t v9 = [(HAENotificationCenterManager *)self sendLiveExposureEvent:v6 volumeLoweringAction:v4];
  }
  else if ([v6 eventType] == 2003133803)
  {
    uint64_t v9 = [(HAENotificationCenterManager *)self sendWeeklyExposureEvent:v6 volumeLoweringAction:v4];
  }
  else
  {
    id v10 = HAENotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HAENotificationCenterManager sendBannerNotificationWithEvent:volumeLoweringAction:](v6, v10);
    }

    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"pyt!" userInfo:0];
  }
  v11 = (void *)v9;

  return v11;
}

- (id)sendLiveExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = HAENotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v8 = [v6 uuid];
    int v19 = 138412290;
    double v20 = *(double *)&v8;
    _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendLiveExposureEvent [%@]", (uint8_t *)&v19, 0xCu);
  }
  [v6 level];
  if (v9 >= self->_liveThresholdInDBA + -2.22044605e-16)
  {
    notificationCenter = self->_notificationCenter;
    [v6 level];
    double v15 = v14;
    v16 = [v6 dateInterval];
    [v16 duration];
    [(NotificationCenter *)notificationCenter sendNotificationWithExposureLevel:1818850917 duration:v4 eventType:v15 volumeLoweringAction:v17];

    objc_super v12 = 0;
  }
  else
  {
    id v10 = HAENotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double liveThresholdInDBA = self->_liveThresholdInDBA;
      int v19 = 134217984;
      double v20 = liveThresholdInDBA;
      _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_INFO, "live exposure level did not reach threshold %.2f", (uint8_t *)&v19, 0xCu);
    }

    objc_super v12 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"lbel" userInfo:0];
  }

  return v12;
}

- (id)sendWeeklyExposureEvent:(id)a3 volumeLoweringAction:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = HAENotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v8 = [v6 uuid];
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "HAENotificationCenterManager sendWeeklyExposureEvent [%@]", (uint8_t *)&v15, 0xCu);
  }
  notificationCenter = self->_notificationCenter;
  [v6 level];
  double v11 = v10;
  objc_super v12 = [v6 dateInterval];
  [v12 duration];
  [(NotificationCenter *)notificationCenter sendNotificationWithExposureLevel:2003133803 duration:v4 eventType:v11 volumeLoweringAction:v13];

  return 0;
}

- (void)donateSignalToTipsKit:(id)a3
{
  int v3 = [a3 eventType];
  if (v3 == 1818850917)
  {
    uint64_t v4 = @"com.apple.coreaudio.hae.notifications.loud";
    goto LABEL_5;
  }
  if (v3 == 2003133803)
  {
    uint64_t v4 = @"com.apple.coreaudio.hae.notifications.weekly";
LABEL_5:
    dispatch_queue_t v5 = [MEMORY[0x263F086E0] mainBundle];
    id v10 = [v5 bundleIdentifier];

    id v6 = [MEMORY[0x263F2A9C0] discoverabilitySignal];
    int v7 = [v6 source];
    os_signpost_id_t v8 = (void *)[objc_alloc(MEMORY[0x263F2A788]) initWithIdentifier:v4 bundleID:v10 context:0];
    [v7 sendEvent:v8];

    return;
  }
  double v9 = HAENotificationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[HAENotificationCenterManager donateSignalToTipsKit:](v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)sendBannerNotificationWithEvent:(void *)a1 volumeLoweringAction:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 eventType];
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "Unknown event type %u", (uint8_t *)v3, 8u);
}

- (void)donateSignalToTipsKit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FABA000, log, OS_LOG_TYPE_ERROR, "unknown event type", v1, 2u);
}

@end