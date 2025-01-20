@interface AFCoreAnalyticsLoggingService
+ (id)sharedLoggingService;
- (AFCoreAnalyticsLoggingService)init;
- (id)_init;
- (void)logToCoreAnalyticsCrossDeviceRequestEvent:(id)a3;
@end

@implementation AFCoreAnalyticsLoggingService

- (void).cxx_destruct
{
}

- (void)logToCoreAnalyticsCrossDeviceRequestEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke;
  block[3] = &unk_1E592C678;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nearbyDevicesPayloads];
  [v1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_5];
}

void __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[AFCoreAnalyticsLoggingService logToCoreAnalyticsCrossDeviceRequestEvent:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s log to CoreAnalytics nearby device context %@: %@", buf, 0x20u);
  }
  id v8 = v5;
  id v7 = v5;
  AnalyticsSendEventLazy();
}

uint64_t __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) buildDictionaryRepresentation];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)AFCoreAnalyticsLoggingService;
  v2 = [(AFCoreAnalyticsLoggingService *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.coreanalytics.client", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (AFCoreAnalyticsLoggingService)init
{
  return 0;
}

+ (id)sharedLoggingService
{
  if (sharedLoggingService_onceToken != -1) {
    dispatch_once(&sharedLoggingService_onceToken, &__block_literal_global_13887);
  }
  v2 = (void *)sharedLoggingService_analyticsService;
  return v2;
}

void __53__AFCoreAnalyticsLoggingService_sharedLoggingService__block_invoke()
{
  id v0 = [[AFCoreAnalyticsLoggingService alloc] _init];
  id v1 = (void *)sharedLoggingService_analyticsService;
  sharedLoggingService_analyticsService = (uint64_t)v0;
}

@end