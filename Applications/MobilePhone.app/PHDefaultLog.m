@interface PHDefaultLog
@end

@implementation PHDefaultLog

void __PHDefaultLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.calls.mobilephone", "Default");
  uint64_t v2 = PHDefaultLog_PHDefaultLog;
  PHDefaultLog_PHDefaultLog = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

@end