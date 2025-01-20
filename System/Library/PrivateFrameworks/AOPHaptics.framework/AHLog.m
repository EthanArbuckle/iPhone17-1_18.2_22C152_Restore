@interface AHLog
@end

@implementation AHLog

os_log_t ___AHLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.AOPHaptics", "default");
  _AHLog_log = (uint64_t)result;
  return result;
}

@end