@interface DVUI
@end

@implementation DVUI

uint64_t __DVUI_LOG_CLIENT_block_invoke()
{
  DVUI_LOG_CLIENT_log = (uint64_t)os_log_create("com.apple.CoreIDV", "CoreIDVUI");

  return MEMORY[0x270F9A758]();
}

@end