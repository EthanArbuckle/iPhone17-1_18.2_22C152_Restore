@interface AAFAnalyticsTransportCA
- (void)sendEvent:(id)a3;
@end

@implementation AAFAnalyticsTransportCA

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (MEMORY[0x1E4F5B1E0])
  {
    v6 = [v4 eventName];
    v7 = [v5 reportData];
    AnalyticsSendEvent();
  }
  else
  {
    v8 = _AAFLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAFAnalyticsTransportCA sendEvent:]((uint64_t)self, v8);
    }
  }
}

- (void)sendEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  id v6 = (id)objc_opt_class();
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  id v4 = v6;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "<%@: %p> CoreAnalytics is not avaiable.", (uint8_t *)&v5, 0x16u);
}

@end