@interface CPS
@end

@implementation CPS

uint64_t __CPS_LOG_CHANNEL_PREFIXClipUIServices_block_invoke()
{
  CPS_LOG_CHANNEL_PREFIXClipUIServices_log = (uint64_t)os_log_create("com.apple.ClipUIServices", "ClipUIServices");

  return MEMORY[0x1F41817F8]();
}

@end