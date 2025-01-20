@interface CPAnalyticsDevLogger
- (BOOL)disabled;
- (CPAnalyticsDevLogger)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (void)processEvent:(id)a3;
@end

@implementation CPAnalyticsDevLogger

- (BOOL)disabled
{
  return 1;
}

- (void)processEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (processEvent__devLoggerOnce != -1) {
    dispatch_once(&processEvent__devLoggerOnce, &__block_literal_global);
  }
  v4 = (void *)processEvent__devLogger;
  if (os_log_type_enabled((os_log_t)processEvent__devLogger, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    v6 = [v3 timestamp];
    v7 = [v3 name];
    v8 = (void *)[v3 copyRawPayload];
    int v9 = 138412802;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_215355000, v5, OS_LOG_TYPE_DEBUG, "%@: %@ payload: %@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __37__CPAnalyticsDevLogger_processEvent___block_invoke()
{
  processEvent__devLogger = (uint64_t)os_log_create("com.apple.photos.CPAnalytics", "CPAnalyticsDevLogger");
  return MEMORY[0x270F9A758]();
}

- (CPAnalyticsDevLogger)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CPAnalyticsDevLogger;
  return [(CPAnalyticsDevLogger *)&v5 init];
}

@end