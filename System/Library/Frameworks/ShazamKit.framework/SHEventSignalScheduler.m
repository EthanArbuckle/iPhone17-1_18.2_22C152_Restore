@interface SHEventSignalScheduler
- (void)sendEventSignal:(id)a3;
@end

@implementation SHEventSignalScheduler

- (void)sendEventSignal:(id)a3
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 Discoverability];
  v6 = [v5 Signals];
  v7 = [v6 source];

  id v8 = [objc_alloc((Class)BMDiscoverabilitySignals) initWithContentIdentifier:v3 context:0 osBuild:0 userInfo:0];
  [v7 sendEvent:v8];
  v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Sent signal event: %@", (uint8_t *)&v10, 0xCu);
  }
}

@end