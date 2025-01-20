@interface GKMatchmakerExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)shareMatchWithRequest:(id)a3 handler:(id)a4;
@end

@implementation GKMatchmakerExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface matchmakerServiceViewControllerInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface matchmakerHostViewControllerInterface];
}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKMatchmakerExtensionHostContext_shareMatchWithRequest_handler___block_invoke;
  block[3] = &unk_1E5F647F8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__GKMatchmakerExtensionHostContext_shareMatchWithRequest_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteViewController];
  [v2 shareMatchWithRequest:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

@end