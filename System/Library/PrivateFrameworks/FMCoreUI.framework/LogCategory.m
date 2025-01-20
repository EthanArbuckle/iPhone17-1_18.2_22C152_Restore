@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Unspecified_block_invoke()
{
  LogCategory_Unspecified_log = (uint64_t)os_log_create("com.apple.icloud.FMCoreUI", "_");
  return MEMORY[0x270F9A758]();
}

uint64_t __LogCategory_ViewControllerLifecyle_block_invoke()
{
  LogCategory_ViewControllerLifecyle_log = (uint64_t)os_log_create("com.apple.icloud.FMCoreUI", "vc");
  return MEMORY[0x270F9A758]();
}

uint64_t __LogCategory_FMSlidingPaneViewController_block_invoke()
{
  LogCategory_FMSlidingPaneViewController_log = (uint64_t)os_log_create("com.apple.icloud.FMCoreUI", "FMSlidingPaneViewController");
  return MEMORY[0x270F9A758]();
}

@end