@interface CESignpostLogSystem
@end

@implementation CESignpostLogSystem

uint64_t ___CESignpostLogSystem_block_invoke()
{
  _CESignpostLogSystem_log = (uint64_t)os_log_create("com.apple.cloudexperience", "core.signpost");
  return MEMORY[0x270F9A758]();
}

@end