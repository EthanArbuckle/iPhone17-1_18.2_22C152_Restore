@interface LogIOAnalytics
@end

@implementation LogIOAnalytics

void __LogIOAnalytics_block_invoke(id a1)
{
  LogIOAnalytics_logIOAnalytics = (uint64_t)os_log_create("com.apple.ioanalytics", "default");
}

@end