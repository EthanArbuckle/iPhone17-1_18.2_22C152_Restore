@interface LSDefaultLog
@end

@implementation LSDefaultLog

void ___LSDefaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "default");
  v1 = (void *)_LSDefaultLog_log;
  _LSDefaultLog_log = (uint64_t)v0;
}

@end