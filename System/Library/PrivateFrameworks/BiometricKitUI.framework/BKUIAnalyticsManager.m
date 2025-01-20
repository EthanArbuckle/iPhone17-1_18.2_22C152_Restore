@interface BKUIAnalyticsManager
- (BKUIAnalyticsManager)init;
- (void)traceEvent:(id)a3 withPayload:(id)a4;
@end

@implementation BKUIAnalyticsManager

- (BKUIAnalyticsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIAnalyticsManager;
  return [(BKUIAnalyticsManager *)&v3 init];
}

- (void)traceEvent:(id)a3 withPayload:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "Tracing event: %@ payload: %@", (uint8_t *)&v8, 0x16u);
  }

  AnalyticsSendEvent();
}

@end