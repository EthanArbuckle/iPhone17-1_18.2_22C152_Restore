@interface NSXPCInterface
@end

@implementation NSXPCInterface

void __89__NSXPCInterface_NSXPCInterface_AKRemoteViewServiceInterface__remoteViewServiceInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE461FF0];
  v1 = (void *)remoteViewServiceInterface_interface;
  remoteViewServiceInterface_interface = v0;

  v2 = (void *)remoteViewServiceInterface_interface;
  v3 = +[AKAuthorizationPresenterHostInterface XPCInterface];
  [v2 setInterface:v3 forSelector:sel_presentAuthorizationWithContext_usingHost_completionHandler_ argumentIndex:1 ofReply:0];

  v4 = (void *)remoteViewServiceInterface_interface;
  id v5 = +[AKPrivateEmailPresenterHostInterface XPCInterface];
  [v4 setInterface:v5 forSelector:sel_presentPrivateEmailWithContext_usingHost_completionHandler_ argumentIndex:1 ofReply:0];
}

uint64_t __89__NSXPCInterface_NSXPCInterface_AKRemoteViewSessionInterface__remoteViewSessionInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462170];
  v1 = (void *)remoteViewSessionInterface_interface;
  remoteViewSessionInterface_interface = v0;

  v2 = (void *)remoteViewSessionInterface_interface;
  uint64_t v3 = objc_opt_class();

  return [v2 setClass:v3 forSelector:sel_activateWithCompletionHandler_ argumentIndex:0 ofReply:1];
}

@end