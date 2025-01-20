@interface LSRegistrationLog
@end

@implementation LSRegistrationLog

void ___LSRegistrationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "registration");
  v1 = (void *)_LSRegistrationLog_log;
  _LSRegistrationLog_log = (uint64_t)v0;
}

@end