@interface LSIconsLog
@end

@implementation LSIconsLog

void ___LSIconsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "icons");
  v1 = (void *)_LSIconsLog_log;
  _LSIconsLog_log = (uint64_t)v0;
}

@end