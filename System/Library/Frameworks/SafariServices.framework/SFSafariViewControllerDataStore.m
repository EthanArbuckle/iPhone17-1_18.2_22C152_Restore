@interface SFSafariViewControllerDataStore
+ (SFSafariViewControllerDataStore)defaultDataStore;
- (id)_init;
- (void)clearWebsiteDataWithCompletionHandler:(void *)completion;
@end

@implementation SFSafariViewControllerDataStore

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SFSafariViewControllerDataStore;
  return [(SFSafariViewControllerDataStore *)&v3 init];
}

+ (SFSafariViewControllerDataStore)defaultDataStore
{
  if (defaultDataStore_onceToken != -1) {
    dispatch_once(&defaultDataStore_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultDataStore_defaultDataStore;

  return (SFSafariViewControllerDataStore *)v2;
}

void __51__SFSafariViewControllerDataStore_defaultDataStore__block_invoke()
{
  id v0 = [[SFSafariViewControllerDataStore alloc] _init];
  v1 = (void *)defaultDataStore_defaultDataStore;
  defaultDataStore_defaultDataStore = (uint64_t)v0;
}

- (void)clearWebsiteDataWithCompletionHandler:(void *)completion
{
  v4 = completion;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void (**)(void))&__block_literal_global_2;
  }
  if (self->_remoteViewController)
  {
    v5[2](v5);
  }
  else
  {
    id v6 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E5C73328;
    v9[4] = self;
    v10 = v5;
    v7 = +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:v9];
    cancelViewServiceRequest = self->_cancelViewServiceRequest;
    self->_cancelViewServiceRequest = v7;
  }
}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    v10 = [*(id *)(*(void *)(a1 + 32) + 24) serviceViewControllerProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_4;
    v13[3] = &unk_1E5C73300;
    id v11 = *(id *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v11;
    [v10 clearWebsiteDataWithCompletionHandler:v13];
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXSVCDeletion();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(v12, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

void __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for website data deletion with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end