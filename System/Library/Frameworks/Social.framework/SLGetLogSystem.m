@interface SLGetLogSystem
@end

@implementation SLGetLogSystem

uint64_t ___SLGetLogSystem_block_invoke()
{
  _SLGetLogSystem_log = (uint64_t)os_log_create("com.apple.social", "core");

  return MEMORY[0x1F41817F8]();
}

@end