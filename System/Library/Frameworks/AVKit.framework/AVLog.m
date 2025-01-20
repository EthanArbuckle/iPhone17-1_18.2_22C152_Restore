@interface AVLog
@end

@implementation AVLog

uint64_t ___AVLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.avkit", "AVKit");
  uint64_t v1 = _log;
  _log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end