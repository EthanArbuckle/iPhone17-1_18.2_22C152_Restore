@interface ACUILogSystem
@end

@implementation ACUILogSystem

void ___ACUILogSystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.accounts", "ui");
  v1 = (void *)_ACUILogSystem_log;
  _ACUILogSystem_log = (uint64_t)v0;
}

@end