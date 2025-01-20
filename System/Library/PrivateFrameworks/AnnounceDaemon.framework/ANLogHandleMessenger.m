@interface ANLogHandleMessenger
@end

@implementation ANLogHandleMessenger

uint64_t __ANLogHandleMessenger_Announcement_block_invoke()
{
  ANLogHandleMessenger_Announcement_logger = (uint64_t)os_log_create("com.apple.intercom", "Messenger_Announcement");
  return MEMORY[0x1F41817F8]();
}

@end