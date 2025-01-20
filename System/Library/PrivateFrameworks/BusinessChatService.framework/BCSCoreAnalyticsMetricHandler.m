@interface BCSCoreAnalyticsMetricHandler
- (void)handleSubmittedMetric:(id)a3;
@end

@implementation BCSCoreAnalyticsMetricHandler

- (void)handleSubmittedMetric:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26C636550])
  {
    id v4 = v3;
    if (qword_26ACEFCD0 != -1) {
      dispatch_once(&qword_26ACEFCD0, &__block_literal_global_5);
    }
    v5 = (id)_MergedGlobals_37;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = [v4 coreAnalyticsEventName];
      v9 = [v4 coreAnalyticsPayload];
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_debug_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEBUG, "%@ - %@", buf, 0x16u);
    }
    v6 = [v4 coreAnalyticsEventName];
    v10 = v4;
    id v7 = v4;
    AnalyticsSendEventLazy();
  }
}

uint64_t __55__BCSCoreAnalyticsMetricHandler_handleSubmittedMetric___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) coreAnalyticsPayload];
}

@end