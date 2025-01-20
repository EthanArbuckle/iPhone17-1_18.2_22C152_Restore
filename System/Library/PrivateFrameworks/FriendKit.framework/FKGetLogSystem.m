@interface FKGetLogSystem
@end

@implementation FKGetLogSystem

void ___FKGetLogSystem_block_invoke()
{
  FriendKitBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 bundleIdentifier];
  os_log_t v1 = os_log_create((const char *)[v0 UTF8String], "main");
  v2 = (void *)_FKGetLogSystem_log;
  _FKGetLogSystem_log = (uint64_t)v1;
}

@end