@interface LABKLog
@end

@implementation LABKLog

uint64_t __15___LABKLog_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LocalAuthentication", "bkshim");
  uint64_t v1 = log_log_0;
  log_log_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end