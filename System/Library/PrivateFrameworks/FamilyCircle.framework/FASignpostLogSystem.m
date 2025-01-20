@interface FASignpostLogSystem
@end

@implementation FASignpostLogSystem

uint64_t ___FASignpostLogSystem_block_invoke()
{
  _FASignpostLogSystem_log = (uint64_t)os_log_create("com.apple.family", "signpost");
  return MEMORY[0x1F41817F8]();
}

@end