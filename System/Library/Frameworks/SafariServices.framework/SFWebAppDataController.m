@interface SFWebAppDataController
- (SFWebAppDataController)initWithWebClipIdentifier:(id)a3;
- (void)clearWebsiteDataWithCompletion:(id)a3;
- (void)didCreatePlaceholderBundle;
@end

@implementation SFWebAppDataController

- (SFWebAppDataController)initWithWebClipIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFWebAppDataController;
  v6 = [(SFWebAppDataController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClipIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didCreatePlaceholderBundle
{
}

- (void)clearWebsiteDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &__block_literal_global_44;
  }
  v6 = (void *)MEMORY[0x1AD0C36A0](v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2;
  v14[3] = &unk_1E5C72CB0;
  id v15 = v6;
  id v7 = v6;
  v8 = (void (**)(void))MEMORY[0x1AD0C36A0](v14);

  if (self->_remoteViewController)
  {
    v8[2](v8);
  }
  else
  {
    id v9 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3;
    v12[3] = &unk_1E5C73328;
    v12[4] = self;
    v13 = v8;
    objc_super v10 = +[_SFWebAppViewController requestViewControllerWithConnectionHandler:v12];
    cancelViewServiceRequest = self->_cancelViewServiceRequest;
    self->_cancelViewServiceRequest = v10;
  }
}

uint64_t __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return notify_post("com.apple.webclip.uninstalled");
}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    objc_super v10 = [*(id *)(*(void *)(a1 + 32) + 24) serviceViewControllerProxy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3;
    v14[3] = &unk_1E5C73300;
    id v12 = *(id *)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    id v15 = v12;
    [v10 clearWebsiteDataWithWebClipIdentifier:v11 completion:v14];
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSVCDeletion();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3_cold_1(v13, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

void __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to get remote view for web clip data clearing with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end