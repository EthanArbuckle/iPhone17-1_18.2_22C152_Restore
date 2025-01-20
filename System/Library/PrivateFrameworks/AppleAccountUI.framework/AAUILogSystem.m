@interface AAUILogSystem
@end

@implementation AAUILogSystem

uint64_t ___AAUILogSystem_block_invoke()
{
  _AAUILogSystem_log = (uint64_t)os_log_create("com.apple.appleaccount", "ui");
  return MEMORY[0x270F9A758]();
}

@end