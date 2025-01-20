@interface NUILog
@end

@implementation NUILog

os_log_t ___NUILog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.AppSupportUI", "NUIContainerView");
  _NUILog::log = (uint64_t)result;
  return result;
}

@end