@interface AIDASOSLog
@end

@implementation AIDASOSLog

os_log_t ___AIDASOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.AppleIDAuthSupport", "general");
  _AIDASOSLog_log = (uint64_t)result;
  return result;
}

@end