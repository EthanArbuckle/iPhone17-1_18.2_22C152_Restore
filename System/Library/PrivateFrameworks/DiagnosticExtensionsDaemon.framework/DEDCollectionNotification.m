@interface DEDCollectionNotification
+ (BOOL)shouldFireNotificationForTransport:(int64_t)a3;
+ (id)log;
+ (void)configureEventStream;
+ (void)fireNotificationWithFinishingMove:(int64_t)a3;
+ (void)handleDistributedNotification:(id)a3;
+ (void)postNotificationToNotificationCenterForFinishingMove:(int64_t)a3;
@end

@implementation DEDCollectionNotification

+ (id)log
{
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, &__block_literal_global_31);
  }
  v2 = (void *)log_log_4;
  return v2;
}

void __32__DEDCollectionNotification_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "collect-notify");
  v1 = (void *)log_log_4;
  log_log_4 = (uint64_t)v0;
}

+ (BOOL)shouldFireNotificationForTransport:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = +[DEDUtils platform];
  int v6 = [v5 isEqualToString:@"macos"];

  if (!v6) {
    return 0;
  }
  v7 = [MEMORY[0x263F08AB0] processInfo];
  v8 = [v7 environment];
  v9 = [v8 objectForKey:@"DED_FORCE_COLLECT_NOTIFY"];

  if (!v9) {
    return (unint64_t)a3 > 2;
  }
  v10 = [a1 log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "+[DEDCollectionNotification shouldFireNotificationForTransport:]";
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "%s is forced on, notifications will be forcibly delivered.", (uint8_t *)&v12, 0xCu);
  }

  return 1;
}

+ (void)fireNotificationWithFinishingMove:(int64_t)a3
{
  v3 = objc_msgSend(a1, "log", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[DEDCollectionNotification fireNotificationWithFinishingMove:](v3);
  }
}

+ (void)handleDistributedNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"com.apple.diagnosticextensionsd.collection-started"];

  if (v6)
  {
    v7 = [a1 log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[DEDCollectionNotification handleDistributedNotification:](v7);
    }

    id v8 = [v4 object];
    uint64_t v9 = [v8 UTF8String];
    v10 = [NSString stringWithUTF8String:v9];
    if ([v10 isEqualToString:@"FBA"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"TTR"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"CloudKit"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"Testing"])
    {
      uint64_t v11 = 4;
    }
    else
    {
      uint64_t v11 = 0;
    }

    [a1 postNotificationToNotificationCenterForFinishingMove:v11];
  }
}

+ (void)postNotificationToNotificationCenterForFinishingMove:(int64_t)a3
{
  v3 = objc_msgSend(a1, "log", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[DEDCollectionNotification fireNotificationWithFinishingMove:](v3);
  }
}

+ (void)configureEventStream
{
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__DEDCollectionNotification_configureEventStream__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x263EF83A0], handler);
}

void __49__DEDCollectionNotification_configureEventStream__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && MEMORY[0x223C60270](v3) == MEMORY[0x263EF8708])
  {
    v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "XPC Event for distnoted received.", v10, 2u);
    }

    string = xpc_dictionary_get_string(v4, "Object");
    v7 = *(void **)(a1 + 32);
    id v8 = [NSString stringWithUTF8String:string];
    if ([v8 isEqualToString:@"FBA"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"TTR"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"CloudKit"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"Testing"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    [v7 postNotificationToNotificationCenterForFinishingMove:v9];
  }
}

+ (void)fireNotificationWithFinishingMove:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Notifications are unsupported.", v1, 2u);
}

+ (void)handleDistributedNotification:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "Received dist notif for collection.", v1, 2u);
}

@end