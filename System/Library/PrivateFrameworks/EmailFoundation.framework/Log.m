@interface Log
@end

@implementation Log

void ___Log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFContentProtectionObserver");
  v1 = (void *)_Log_log;
  _Log_log = (uint64_t)v0;
}

void ___Log_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFContentProtectionUtilities");
  v1 = (void *)_Log_log_0;
  _Log_log_0 = (uint64_t)v0;
}

@end