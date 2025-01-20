@interface ACPLogSystem
@end

@implementation ACPLogSystem

uint64_t ___ACPLogSystem_block_invoke()
{
  _ACPLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "persona");

  return MEMORY[0x1F41817F8]();
}

@end