@interface APKInspectorLogger
+ (id)inspectorLogger;
+ (void)log:(id)a3;
@end

@implementation APKInspectorLogger

+ (id)inspectorLogger
{
  dispatch_once_t predicate = 0;
  dispatch_once(&predicate, &__block_literal_global_0);
  id v2 = (id)inspectorLogger_logger;
  return v2;
}

uint64_t __37__APKInspectorLogger_inspectorLogger__block_invoke()
{
  inspectorLogger_logger = (uint64_t)os_log_create((const char *)[@"com.apple.AirPlayKit" cStringUsingEncoding:4], "inspector");
  return MEMORY[0x270F9A758]();
}

+ (void)log:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [(id)objc_opt_class() inspectorLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23903B000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);
  }
}

@end