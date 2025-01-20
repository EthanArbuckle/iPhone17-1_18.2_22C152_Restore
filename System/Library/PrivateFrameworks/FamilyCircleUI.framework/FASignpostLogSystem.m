@interface FASignpostLogSystem
@end

@implementation FASignpostLogSystem

void ___FASignpostLogSystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.family", "signpost");
  v1 = (void *)_FASignpostLogSystem_log;
  _FASignpostLogSystem_log = (uint64_t)v0;
}

@end