@interface LSProgressLog
@end

@implementation LSProgressLog

void ___LSProgressLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "progress");
  v1 = (void *)_LSProgressLog_log;
  _LSProgressLog_log = (uint64_t)v0;
}

@end