@interface ANLogHandleHome
@end

@implementation ANLogHandleHome

uint64_t __ANLogHandleHome_Announce_block_invoke()
{
  ANLogHandleHome_Announce_logger = (uint64_t)os_log_create("com.apple.intercom", "Home_Announce");
  return MEMORY[0x1F41817F8]();
}

@end