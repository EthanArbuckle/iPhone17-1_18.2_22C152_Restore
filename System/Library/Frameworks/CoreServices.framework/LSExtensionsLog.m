@interface LSExtensionsLog
@end

@implementation LSExtensionsLog

void ___LSExtensionsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "extensions");
  v1 = (void *)_LSExtensionsLog_log;
  _LSExtensionsLog_log = (uint64_t)v0;
}

@end