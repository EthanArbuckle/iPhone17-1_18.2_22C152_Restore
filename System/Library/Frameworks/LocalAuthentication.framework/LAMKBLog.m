@interface LAMKBLog
@end

@implementation LAMKBLog

uint64_t __16___LAMKBLog_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.LocalAuthentication", "mkbshim");
  uint64_t v1 = log_log;
  log_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end