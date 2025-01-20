@interface CFOSLog
@end

@implementation CFOSLog

os_log_t ___CFOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.foundation", "general");
  _CFOSLog_logger = (uint64_t)result;
  return result;
}

@end