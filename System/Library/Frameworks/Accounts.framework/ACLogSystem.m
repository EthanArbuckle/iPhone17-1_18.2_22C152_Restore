@interface ACLogSystem
@end

@implementation ACLogSystem

uint64_t ___ACLogSystem_block_invoke()
{
  _ACLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "core");

  return MEMORY[0x1F41817F8]();
}

@end