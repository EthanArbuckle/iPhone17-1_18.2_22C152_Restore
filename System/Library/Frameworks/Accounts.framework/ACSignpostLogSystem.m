@interface ACSignpostLogSystem
@end

@implementation ACSignpostLogSystem

uint64_t ___ACSignpostLogSystem_block_invoke()
{
  _ACSignpostLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "signpost");

  return MEMORY[0x1F41817F8]();
}

@end