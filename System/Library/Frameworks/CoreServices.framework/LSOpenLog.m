@interface LSOpenLog
@end

@implementation LSOpenLog

void ___LSOpenLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "open");
  v1 = (void *)_LSOpenLog_result;
  _LSOpenLog_result = (uint64_t)v0;
}

@end