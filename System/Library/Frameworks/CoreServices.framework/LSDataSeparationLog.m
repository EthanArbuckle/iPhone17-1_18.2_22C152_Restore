@interface LSDataSeparationLog
@end

@implementation LSDataSeparationLog

void ___LSDataSeparationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "datasep");
  v1 = (void *)_LSDataSeparationLog_log;
  _LSDataSeparationLog_log = (uint64_t)v0;
}

@end