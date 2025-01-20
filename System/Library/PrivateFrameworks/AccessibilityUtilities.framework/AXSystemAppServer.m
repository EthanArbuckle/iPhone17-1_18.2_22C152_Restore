@interface AXSystemAppServer
+ (id)server;
- (id)focusedApps;
@end

@implementation AXSystemAppServer

+ (id)server
{
  if (server_onceToken_6 != -1) {
    dispatch_once(&server_onceToken_6, &__block_literal_global_39);
  }
  v2 = (void *)server__ServerClass;

  return (id)[v2 server];
}

uint64_t __27__AXSystemAppServer_server__block_invoke()
{
  v0 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  int v1 = [v0 isClarityBoardEnabled];

  if (v1) {
    uint64_t result = objc_opt_class();
  }
  else {
    uint64_t result = (uint64_t)NSClassFromString(&cfstr_Axspringboards_8.isa);
  }
  server__ServerClass = result;
  return result;
}

- (id)focusedApps
{
  return 0;
}

@end