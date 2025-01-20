@interface AFKUserLog
@end

@implementation AFKUserLog

uint64_t ___AFKUserLog_block_invoke()
{
  _AFKUserLog::log = (uint64_t)os_log_create("com.apple.afk", "user");
  return MEMORY[0x1F41817F8]();
}

@end