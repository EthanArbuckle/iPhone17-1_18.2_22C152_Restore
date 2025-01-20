@interface FLSignpostLogSystem
@end

@implementation FLSignpostLogSystem

uint64_t ___FLSignpostLogSystem_block_invoke()
{
  _FLSignpostLogSystem_log = (uint64_t)os_log_create("com.apple.followup", "signpost");

  return MEMORY[0x1F41817F8]();
}

@end