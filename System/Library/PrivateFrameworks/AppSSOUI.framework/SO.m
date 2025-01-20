@interface SO
@end

@implementation SO

uint64_t __SO_LOG_SOUIAuthorizationViewController_block_invoke()
{
  SO_LOG_SOUIAuthorizationViewController_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOUIAuthorizationViewController");

  return MEMORY[0x270F9A758]();
}

@end