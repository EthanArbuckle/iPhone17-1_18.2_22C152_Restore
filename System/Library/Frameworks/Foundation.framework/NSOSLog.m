@interface NSOSLog
@end

@implementation NSOSLog

os_log_t ___NSOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "general");
  _MergedGlobals_111 = (uint64_t)result;
  return result;
}

@end