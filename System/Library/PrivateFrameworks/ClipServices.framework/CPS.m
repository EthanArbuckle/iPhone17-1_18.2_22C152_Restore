@interface CPS
@end

@implementation CPS

uint64_t __CPS_LOG_CHANNEL_PREFIXClipServices_block_invoke()
{
  CPS_LOG_CHANNEL_PREFIXClipServices_log = (uint64_t)os_log_create("com.apple.ClipServices", "ClipServices");

  return MEMORY[0x270F9A758]();
}

@end