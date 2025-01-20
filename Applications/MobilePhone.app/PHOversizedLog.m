@interface PHOversizedLog
@end

@implementation PHOversizedLog

void __PHOversizedLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.calls.mobilephone", "Oversized");
  uint64_t v2 = PHOversizedLog_PHOversizedLog;
  PHOversizedLog_PHOversizedLog = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

@end