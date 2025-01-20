@interface APPLEIDV
@end

@implementation APPLEIDV

uint64_t __APPLEIDV_LOG_CLIENT_block_invoke()
{
  APPLEIDV_LOG_CLIENT_log = (uint64_t)os_log_create("com.apple.CoreIDV", "AppleIDVClient");
  return MEMORY[0x1F41817F8]();
}

@end