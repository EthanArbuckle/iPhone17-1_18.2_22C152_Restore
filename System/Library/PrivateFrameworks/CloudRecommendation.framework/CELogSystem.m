@interface CELogSystem
@end

@implementation CELogSystem

uint64_t ___CELogSystem_block_invoke()
{
  _CELogSystem_log = (uint64_t)os_log_create("com.apple.cloudexperience", "log");
  return MEMORY[0x270F9A758]();
}

@end