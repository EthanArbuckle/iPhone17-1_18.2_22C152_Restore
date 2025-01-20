@interface HSTCoreAnalyticsStage
- (void)handleConsume:(id)a3;
@end

@implementation HSTCoreAnalyticsStage

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 name];
    v7 = [v5 payload];
    AnalyticsSendEvent();

    v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = [v5 name];
      v10 = [v5 payload];
      -[HSTCoreAnalyticsStage handleConsume:](v9, v10, buf, v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)HSTCoreAnalyticsStage;
  [(HSStage *)&v11 handleConsume:v4];
}

- (void)handleConsume:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "HSTCoreAnalyticsStage:\n%@:\n%@", buf, 0x16u);
}

@end