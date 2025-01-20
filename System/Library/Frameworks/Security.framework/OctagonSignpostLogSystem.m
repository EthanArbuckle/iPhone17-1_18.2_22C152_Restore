@interface OctagonSignpostLogSystem
@end

@implementation OctagonSignpostLogSystem

uint64_t ___OctagonSignpostLogSystem_block_invoke()
{
  _OctagonSignpostLogSystem_log = (uint64_t)os_log_create("com.apple.security.signposts", "signpost");

  return MEMORY[0x1F41817F8]();
}

@end