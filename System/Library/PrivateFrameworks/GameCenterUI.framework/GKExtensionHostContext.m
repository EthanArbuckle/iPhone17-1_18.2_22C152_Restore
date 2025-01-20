@interface GKExtensionHostContext
- (GKExtensionRemoteViewController)remoteViewController;
- (void)messageFromExtension:(id)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation GKExtensionHostContext

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__GKExtensionHostContext_messageFromExtension___block_invoke;
  v6[3] = &unk_1E5F63350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__GKExtensionHostContext_messageFromExtension___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteViewController];
  [v2 messageFromExtension:*(void *)(a1 + 40)];
}

- (GKExtensionRemoteViewController)remoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);

  return (GKExtensionRemoteViewController *)WeakRetained;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end