@interface _ASAccountAuthenticationModificationHostViewController
- (BOOL)_shouldUseNonUIRequestTimer;
- (_ASAccountAuthenticationModificationHostViewController)initWithExtension:(id)a3 serviceIdentifier:(id)a4;
- (_ASAccountAuthenticationModificationHostViewControllerDelegate)delegate;
- (void)_cancelButtonPressed;
- (void)_nonUIRequestDidRequireUserInteraction;
- (void)_requestDidFailWithError:(id)a3 completion:(id)a4;
- (void)dismissRequestUI:(id)a3;
- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5;
- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 updatedCredential:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateCredential:(id)a3 withNewPassword:(id)a4 userInfo:(id)a5;
- (void)upgradeCredentialToSignInWithApple:(id)a3 userInfo:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation _ASAccountAuthenticationModificationHostViewController

- (_ASAccountAuthenticationModificationHostViewController)initWithExtension:(id)a3 serviceIdentifier:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
  v8 = [(_ASExtensionViewController *)&v18 initWithExtension:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceIdentifier, a4);
    v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v9 action:sel__cancelButtonPressed];
    v11 = [(_ASExtensionViewController *)v9 extension];
    v12 = [v11 _plugIn];
    v13 = [v12 localizedContainingName];
    v14 = [(_ASAccountAuthenticationModificationHostViewController *)v9 navigationItem];
    [v14 setTitle:v13];

    v15 = [(_ASAccountAuthenticationModificationHostViewController *)v9 navigationItem];
    [v15 setRightBarButtonItem:v10];

    [(_ASAccountAuthenticationModificationHostViewController *)v9 setModalInPresentation:1];
    v16 = v9;
  }
  return v9;
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 userInfo:(id)a4
{
  v6 = (ASPasswordCredential *)a3;
  id v7 = a4;
  self->_accountModificationOperation = 1;
  existingCredential = self->_existingCredential;
  self->_existingCredential = v6;
  v9 = v6;

  objc_storeStrong((id *)&self->_userInfo, a4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __102___ASAccountAuthenticationModificationHostViewController_upgradeCredentialToSignInWithApple_userInfo___block_invoke;
  v11[3] = &unk_2643957F8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(_ASExtensionViewController *)self _beginNonUIRequest:1 connectionHandler:v11];
}

- (void)updateCredential:(id)a3 withNewPassword:(id)a4 userInfo:(id)a5
{
  v8 = (ASPasswordCredential *)a3;
  v9 = (NSString *)a4;
  id v10 = a5;
  self->_accountModificationOperation = 0;
  existingCredential = self->_existingCredential;
  self->_existingCredential = v8;
  id v12 = v8;

  newPassword = self->_newPassword;
  self->_newPassword = v9;
  v14 = v9;

  objc_storeStrong((id *)&self->_userInfo, a5);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __100___ASAccountAuthenticationModificationHostViewController_updateCredential_withNewPassword_userInfo___block_invoke;
  v16[3] = &unk_2643957F8;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [(_ASExtensionViewController *)self _beginNonUIRequest:1 connectionHandler:v16];
}

- (void)_nonUIRequestDidRequireUserInteraction
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke;
  v3[3] = &unk_264395820;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(_ASExtensionViewController *)self _beginRequestWithConnectionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldUseNonUIRequestTimer
{
  return 0;
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (a4) {
    id v6 = a4;
  }
  else {
    id v6 = &__block_literal_global_0;
  }
  id v7 = (void (**)(void))MEMORY[0x21D484070](v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationHostViewController:self requestCanceledWithError:v9 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F825C8], "systemBackgroundColor", a3);
  v5 = [(_ASAccountAuthenticationModificationHostViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  [v6 setBackgroundColor:v4];

  id v8 = [(_ASAccountAuthenticationModificationHostViewController *)self navigationController];
  id v7 = [v8 navigationBar];
  [v7 setTranslucent:0];
}

- (void)_cancelButtonPressed
{
}

- (void)prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __142___ASAccountAuthenticationModificationHostViewController_prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext_userInfo_completion___block_invoke;
  block[3] = &unk_2643954E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 updatedCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __136___ASAccountAuthenticationModificationHostViewController_prepareToCompleteRequestWithHostContext_updatedCredential_userInfo_completion___block_invoke;
  v15[3] = &unk_264395530;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if (self->_signInWithAppleAuthorization)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F29168]);
    id v11 = objc_alloc(MEMORY[0x263F01878]);
    id v12 = [(_ASExtensionViewController *)self extension];
    id v13 = [v12 _plugIn];
    id v14 = [v13 containingUrl];
    id v28 = 0;
    id v15 = (void *)[v11 initWithURL:v14 allowPlaceholder:0 error:&v28];
    id v16 = v28;

    if (v16)
    {
      id v17 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_ASAccountAuthenticationModificationHostViewController prepareToCancelRequestWithHostContext:error:completion:](v17, v16);
      }
      v9[2](v9);
    }
    else
    {
      id v18 = [(AKAuthorization *)self->_signInWithAppleAuthorization authorizedRequest];
      v19 = [v18 requestIdentifier];
      v20 = [v19 UUIDString];
      [v10 setTransactionID:v20];

      v21 = [v15 bundleIdentifier];
      [v10 setBundleID:v21];

      v22 = [v15 teamIdentifier];
      [v10 setTeamID:v22];

      id v23 = objc_alloc_init(MEMORY[0x263F29138]);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke;
      v24[3] = &unk_264395848;
      id v25 = v8;
      v26 = self;
      v27 = v9;
      [v23 revokeAuthorizationWithContext:v10 completion:v24];
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
    [(_ASExtensionViewController *)&v29 prepareToCancelRequestWithHostContext:v8 error:a4 completion:v9];
  }
}

- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_accountModificationOperation == 1)
  {
    id v11 = [(_ASAccountAuthenticationModificationHostViewController *)self navigationController];

    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained dismissUIForAccountModificationHostViewController:self];
      }
    }
    id v13 = objc_alloc_init(MEMORY[0x263F29178]);
    id v14 = objc_alloc(MEMORY[0x263F01878]);
    id v15 = [(_ASExtensionViewController *)self extension];
    id v16 = [v15 _plugIn];
    id v17 = [v16 containingUrl];
    id v35 = 0;
    id v18 = (void *)[v14 initWithURL:v17 allowPlaceholder:0 error:&v35];
    id v19 = v35;

    if (v19)
    {
      v20 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_ASAccountAuthenticationModificationHostViewController getSignInWithAppleAuthorizationWithState:nonce:completion:](v20, v19);
      }
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08338];
      v37 = @"Couldn't get application record while fetching authorization.";
      v22 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v23 = [v21 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v22];
      v10[2](v10, 0, v23);
    }
    else
    {
      objc_initWeak(&location, self);
      [v13 setState:v8];
      [v13 setNonce:v9];
      id v25 = [v18 entitlements];
      v26 = [v25 objectForKey:@"application-identifier" ofClass:objc_opt_class()];
      [v13 setAppID:v26];

      v27 = [v18 bundleIdentifier];
      [v13 setBundleID:v27];

      id v28 = [v18 teamIdentifier];
      [v13 setTeamID:v28];

      objc_super v29 = (void *)[objc_alloc(MEMORY[0x263F291B8]) initWithUpgradeContext:v13];
      id v30 = objc_alloc_init(MEMORY[0x263F29138]);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke;
      v31[3] = &unk_264395870;
      objc_copyWeak(&v33, &location);
      v32 = v10;
      [v30 performAuthorizationWithContext:v29 completion:v31];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08338];
    v39[0] = @"Cannot request Sign in with Apple authorization in the middle of a strong password upgrade.";
    id v19 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v13 = [v24 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v19];
    v10[2](v10, 0, v13);
  }
}

- (void)dismissRequestUI:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dismissUIForAccountModificationHostViewController:self];
  }
}

- (_ASAccountAuthenticationModificationHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASAccountAuthenticationModificationHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accountModificationExtensionContextProxy, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAuthorization, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_existingCredential, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)prepareToCancelRequestWithHostContext:(void *)a1 error:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to get application record to revoke authorization with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)getSignInWithAppleAuthorizationWithState:(void *)a1 nonce:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to get application record to request authorization due to error: %{public}@", v7, v8, v9, v10, v11);
}

@end