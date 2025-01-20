@interface ANLogHandleHomeManager
@end

@implementation ANLogHandleHomeManager

uint64_t __ANLogHandleHomeManager_HomeContext_block_invoke()
{
  ANLogHandleHomeManager_HomeContext_logger = (uint64_t)os_log_create("com.apple.intercom", "HomeManager_HomeContext");
  return MEMORY[0x1F41817F8]();
}

@end