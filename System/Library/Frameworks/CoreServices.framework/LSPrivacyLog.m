@interface LSPrivacyLog
@end

@implementation LSPrivacyLog

void ___LSPrivacyLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "privacy");
  v1 = (void *)_LSPrivacyLog_log;
  _LSPrivacyLog_log = (uint64_t)v0;
}

@end