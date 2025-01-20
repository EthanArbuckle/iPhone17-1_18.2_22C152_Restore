@interface LSInstallLog
@end

@implementation LSInstallLog

void ___LSInstallLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "appinstallation");
  v1 = (void *)_LSInstallLog_log;
  _LSInstallLog_log = (uint64_t)v0;
}

@end