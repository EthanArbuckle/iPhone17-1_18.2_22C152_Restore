@interface ANLogHandleAnnouncementDataItem
@end

@implementation ANLogHandleAnnouncementDataItem

uint64_t __ANLogHandleAnnouncementDataItem_AudioProcessing_block_invoke()
{
  ANLogHandleAnnouncementDataItem_AudioProcessing_logger = (uint64_t)os_log_create("com.apple.intercom", "AnnouncementDataItem_AudioProcessing");
  return MEMORY[0x1F41817F8]();
}

@end