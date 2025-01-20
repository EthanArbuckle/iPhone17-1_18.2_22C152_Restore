@interface ASAccountAuthenticationModificationController
- (ASAccountAuthenticationModificationController)init;
- (id)_viewControllerToPresentFrom;
- (id)delegate;
- (id)presentationContextProvider;
- (void)_failRequestWithError:(id)a3;
- (void)_invalidate;
- (void)_performReplacePasswordWithSignInWithAppleRequest:(id)a3;
- (void)_performUpgradePasswordToStrongPasswordRequest:(id)a3;
- (void)_requestRemoteViewController:(id)a3;
- (void)_showUpgradeToStrongPasswordPromptForRequest:(id)a3;
- (void)accountModificationRemoteViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)accountModificationRemoteViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5;
- (void)accountModificationRemoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)accountModificationRemoteViewControllerDidFinishUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dismissAccountModificationRemoteViewController:(id)a3;
- (void)init;
- (void)performRequest:(ASAccountAuthenticationModificationRequest *)request;
- (void)presentAccountModificationRemoteViewController:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setPresentationContextProvider:(id)presentationContextProvider;
@end

@implementation ASAccountAuthenticationModificationController

- (ASAccountAuthenticationModificationController)init
{
  v14[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)ASAccountAuthenticationModificationController;
  v2 = [(ASAccountAuthenticationModificationController *)&v12 init];
  if (v2)
  {
    uint64_t v13 = *MEMORY[0x263F07FE0];
    v14[0] = @"com.apple.AuthenticationServicesUI.AccountAuthenticationModificationExtensionHelper";
    v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = 0;
    v4 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:v3 error:&v11];
    id v5 = v11;
    uint64_t v6 = [v4 firstObject];
    helperExtension = v2->_helperExtension;
    v2->_helperExtension = (NSExtension *)v6;

    if (v2->_helperExtension)
    {
      v8 = v2;
    }
    else
    {
      if (v5)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(ASAccountAuthenticationModificationController *)v9 init];
        }
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)performRequest:(ASAccountAuthenticationModificationRequest *)request
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = request;
  if (self->_request)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v7 = (void *)MEMORY[0x263F087E8];
      v15 = @"ASExtensionLocalizedFailureReasonErrorKey";
      v16[0] = @"Cannot start another Account Authentication Modification request until the current request finishes.";
      v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v9 = [v7 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v8];
      [WeakRetained accountAuthenticationModificationController:self didFailRequest:v5 withError:v9];
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_request, request);
  objc_storeStrong((id *)&self->_referenceToSelf, self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ASAccountAuthenticationModificationController *)self _performReplacePasswordWithSignInWithAppleRequest:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v13 = *MEMORY[0x263F08338];
        v14 = @"Received request is not a valid ASAccountAuthenticationModificationRequest subclass.";
        id v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        objc_super v12 = [v10 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v11];
        [WeakRetained accountAuthenticationModificationController:self didFailRequest:v5 withError:v12];
      }
      [(ASAccountAuthenticationModificationController *)self _invalidate];
      goto LABEL_11;
    }
    [(ASAccountAuthenticationModificationController *)self _showUpgradeToStrongPasswordPromptForRequest:v5];
  }
LABEL_12:
}

- (void)_requestRemoteViewController:(id)a3
{
  id v4 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke;
  v13[3] = &unk_264396128;
  id v5 = v4;
  id v14 = v5;
  uint64_t v6 = (void *)MEMORY[0x21D484070](v13);
  if ([MEMORY[0x263F662A0] hasInternalContent]
    && ([MEMORY[0x263EFFA40] standardUserDefaults],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLForKey:@"ASDebugASAccountAuthenticationModificationControllerUsesSafariViewService"], v7, v8))
  {
    id v9 = +[_ASAccountAuthenticationModificationRemoteViewController requestViewControllerWithConnectionHandler:v6];
  }
  else
  {
    helperExtension = self->_helperExtension;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke_2;
    v11[3] = &unk_264396150;
    id v12 = v6;
    [(NSExtension *)helperExtension _as_instantiateViewControllerWithConnectionHandler:v11];
  }
}

uint64_t __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performReplacePasswordWithSignInWithAppleRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke;
  v6[3] = &unk_264396178;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ASAccountAuthenticationModificationController *)self _requestRemoteViewController:v6];
}

void __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  int v8 = v7;
  if (!v6 || v7)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(v19, v8);
    }
    [*(id *)(a1 + 32) _failRequestWithError:v8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
    id v9 = [ASPasswordCredential alloc];
    v10 = [*(id *)(a1 + 40) user];
    uint64_t v11 = [*(id *)(a1 + 40) password];
    id v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    else {
      uint64_t v13 = &stru_26CA92B70;
    }
    id v14 = [(ASPasswordCredential *)v9 initWithUser:v10 password:v13];

    v15 = [*(id *)(*(void *)(a1 + 32) + 16) serviceIdentifier];
    v16 = *(void **)(*(void *)(a1 + 32) + 8);
    v17 = [*(id *)(a1 + 40) userInfo];
    v18 = [*(id *)(a1 + 40) extension];
    [v16 upgradeCredentialToSignInWithApple:v14 forServiceIdentifier:v15 userInfo:v17 extension:v18];
  }
}

- (void)_showUpgradeToStrongPasswordPromptForRequest:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F01868];
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 bundleIdentifier];
  int v8 = [v5 applicationProxyForIdentifier:v7];
  uint64_t v9 = [v8 localizedName];

  v10 = [MEMORY[0x263F66290] currentDevice];
  [v10 deviceClass];

  uint64_t v11 = NSString;
  id v12 = _WBSLocalizedString();
  uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", v12, v9);

  id v14 = _WBSLocalizedString();
  v15 = (void *)MEMORY[0x263F82418];
  v16 = (void *)v9;
  if (deviceAlertStyle_onceToken != -1) {
    dispatch_once(&deviceAlertStyle_onceToken, &__block_literal_global_12);
  }
  v33 = (void *)v13;
  v17 = [v15 alertControllerWithTitle:v13 message:v14 preferredStyle:deviceAlertStyle_style];
  v18 = (void *)MEMORY[0x263F82400];
  v19 = _WBSLocalizedString();
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke;
  v35[3] = &unk_2643961A0;
  v35[4] = self;
  id v20 = v4;
  id v36 = v20;
  v21 = [v18 actionWithTitle:v19 style:0 handler:v35];
  [v17 addAction:v21];

  v22 = (void *)MEMORY[0x263F82400];
  v23 = _WBSLocalizedString();
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke_2;
  v34[3] = &unk_2643961C8;
  v34[4] = self;
  v24 = [v22 actionWithTitle:v23 style:1 handler:v34];
  [v17 addAction:v24];

  v25 = [(ASAccountAuthenticationModificationController *)self _viewControllerToPresentFrom];
  v26 = v25;
  if (v25)
  {
    [v25 presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    v27 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ASAccountAuthenticationModificationController _showUpgradeToStrongPasswordPromptForRequest:](v27);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      request = self->_request;
      v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08338];
      v38[0] = @"No presentation anchor provided to show strong password upgrade UI.";
      v30 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
      v31 = [v32 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v30];
      [WeakRetained accountAuthenticationModificationController:self didFailRequest:request withError:v31];
    }
    [(ASAccountAuthenticationModificationController *)self _invalidate];
  }
}

uint64_t __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performUpgradePasswordToStrongPasswordRequest:*(void *)(a1 + 40)];
}

void __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 16);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1 userInfo:0];
    [WeakRetained accountAuthenticationModificationController:v2 didFailRequest:v3 withError:v4];
  }
  [*(id *)(a1 + 32) _invalidate];
}

- (void)_performUpgradePasswordToStrongPasswordRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __96__ASAccountAuthenticationModificationController__performUpgradePasswordToStrongPasswordRequest___block_invoke;
  v6[3] = &unk_264396178;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ASAccountAuthenticationModificationController *)self _requestRemoteViewController:v6];
}

void __96__ASAccountAuthenticationModificationController__performUpgradePasswordToStrongPasswordRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  int v8 = v7;
  if (!v6 || v7)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(v19, v8);
    }
    [*(id *)(a1 + 32) _failRequestWithError:v8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
    uint64_t v9 = [ASPasswordCredential alloc];
    v10 = [*(id *)(a1 + 40) user];
    uint64_t v11 = [*(id *)(a1 + 40) password];
    id v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    else {
      uint64_t v13 = &stru_26CA92B70;
    }
    id v14 = [(ASPasswordCredential *)v9 initWithUser:v10 password:v13];

    v15 = [*(id *)(*(void *)(a1 + 32) + 16) serviceIdentifier];
    v16 = *(void **)(*(void *)(a1 + 32) + 8);
    v17 = [*(id *)(a1 + 40) userInfo];
    v18 = [*(id *)(a1 + 40) extension];
    [v16 updateCredential:v14 forServiceIdentifier:v15 userInfo:v17 extension:v18];
  }
}

- (void)_invalidate
{
  [(_ASAccountAuthenticationModificationRemoteViewController *)self->_accountAuthenticationModificationRemoteViewController setDelegate:0];
  accountAuthenticationModificationRemoteViewController = self->_accountAuthenticationModificationRemoteViewController;
  self->_accountAuthenticationModificationRemoteViewController = 0;

  request = self->_request;
  self->_request = 0;

  referenceToSelf = self->_referenceToSelf;
  self->_referenceToSelf = 0;
}

- (void)_failRequestWithError:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountAuthenticationModificationController:self didFailRequest:self->_request withError:v5];
  }
  [(ASAccountAuthenticationModificationController *)self _invalidate];
}

- (id)_viewControllerToPresentFrom
{
  uint64_t v3 = [(ASAccountAuthenticationModificationController *)self presentationContextProvider];
  id v4 = [v3 presentationAnchorForAccountAuthenticationModificationController:self];
  id v5 = [v4 rootViewController];

  id v6 = objc_msgSend(v5, "_as_viewControllerToPresentFrom");

  return v6;
}

- (void)accountModificationRemoteViewControllerDidFinishUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(void))a5;
  int v8 = [(_ASAccountAuthenticationModificationRemoteViewController *)self->_accountAuthenticationModificationRemoteViewController presentingViewController];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 dismissViewControllerAnimated:1 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountAuthenticationModificationController:self didSuccessfullyCompleteRequest:self->_request withUserInfo:v11];
  }
  [(ASAccountAuthenticationModificationController *)self _invalidate];
}

- (void)accountModificationRemoteViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v12 = a5;
  int v8 = (void (**)(void))a6;
  uint64_t v9 = [(_ASAccountAuthenticationModificationRemoteViewController *)self->_accountAuthenticationModificationRemoteViewController presentingViewController];
  v10 = v9;
  if (v9)
  {
    [v9 dismissViewControllerAnimated:1 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountAuthenticationModificationController:self didSuccessfullyCompleteRequest:self->_request withUserInfo:v12];
  }
  [(ASAccountAuthenticationModificationController *)self _invalidate];
}

- (void)presentAccountModificationRemoteViewController:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = [(ASAccountAuthenticationModificationController *)self _viewControllerToPresentFrom];
  id v5 = v4;
  if (v4)
  {
    [v4 presentViewController:self->_accountAuthenticationModificationRemoteViewController animated:1 completion:0];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ASAccountAuthenticationModificationController presentAccountModificationRemoteViewController:](v6);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      request = self->_request;
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08338];
      v13[0] = @"No presentation anchor provided to show extension UI.";
      v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v11 = [v9 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v10];
      [WeakRetained accountAuthenticationModificationController:self didFailRequest:request withError:v11];
    }
    [(ASAccountAuthenticationModificationController *)self _invalidate];
  }
}

- (void)accountModificationRemoteViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(void))a5;
  int v8 = [(_ASAccountAuthenticationModificationRemoteViewController *)self->_accountAuthenticationModificationRemoteViewController presentingViewController];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 dismissViewControllerAnimated:1 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountAuthenticationModificationController:self didFailRequest:self->_request withError:v11];
  }
  [(ASAccountAuthenticationModificationController *)self _invalidate];
}

- (void)accountModificationRemoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountAuthenticationModificationController:self didFailRequest:self->_request withError:v6];
  }
  [(ASAccountAuthenticationModificationController *)self _invalidate];
}

- (void)dismissAccountModificationRemoteViewController:(id)a3
{
  id v4 = [(ASAccountAuthenticationModificationController *)self presentationContextProvider];
  id v5 = [v4 presentationAnchorForAccountAuthenticationModificationController:self];
  id v6 = [v5 rootViewController];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (id)presentationContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);

  return WeakRetained;
}

- (void)setPresentationContextProvider:(id)presentationContextProvider
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_helperExtension, 0);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_accountAuthenticationModificationRemoteViewController, 0);
}

- (void)init
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to find helper extension to perform Account Authentication Modification Extension requests with error %{public}@.", v7, v8, v9, v10, 2u);
}

void __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to get remote view controller from helper extension: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_showUpgradeToStrongPasswordPromptForRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "No presentation anchor provided to strong password upgrade UI.", v1, 2u);
}

- (void)presentAccountModificationRemoteViewController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "No presentation anchor provided to show extension UI.", v1, 2u);
}

@end