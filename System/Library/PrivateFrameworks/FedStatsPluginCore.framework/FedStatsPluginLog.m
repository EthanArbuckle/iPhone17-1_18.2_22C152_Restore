@interface FedStatsPluginLog
+ (id)logger;
@end

@implementation FedStatsPluginLog

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger__framework;
  return v2;
}

uint64_t __27__FedStatsPluginLog_logger__block_invoke()
{
  logger__framework = (uint64_t)os_log_create("com.apple.FedStats", "Framework");
  return MEMORY[0x270F9A758]();
}

@end