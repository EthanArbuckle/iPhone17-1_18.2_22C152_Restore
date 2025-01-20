@interface ISURLCacheLog
@end

@implementation ISURLCacheLog

uint64_t ___ISURLCacheLog_block_invoke()
{
  _ISURLCacheLog_log = (uint64_t)os_log_create("com.apple.iconservices", "url-cache");
  return MEMORY[0x1F41817F8]();
}

@end