@interface LSAppProtectionLog
@end

@implementation LSAppProtectionLog

void ___LSAppProtectionLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "appprotection");
  v1 = (void *)_LSAppProtectionLog_result;
  _LSAppProtectionLog_result = (uint64_t)v0;
}

@end