@interface ASAccountAuthenticationModificationHostViewController
@end

@implementation ASAccountAuthenticationModificationHostViewController

uint64_t __102___ASAccountAuthenticationModificationHostViewController_upgradeCredentialToSignInWithApple_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 upgradeCredentialToSignInWithApple:*(void *)(*(void *)(a1 + 32) + 1024) serviceIdentifier:*(void *)(*(void *)(a1 + 32) + 1016) userInfo:*(void *)(a1 + 40)];
}

uint64_t __100___ASAccountAuthenticationModificationHostViewController_updateCredential_withNewPassword_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePasswordForServiceIdentifier:*(void *)(*(void *)(a1 + 32) + 1016) existingCredential:*(void *)(*(void *)(a1 + 32) + 1024) newPassword:*(void *)(*(void *)(a1 + 32) + 1032) userInfo:*(void *)(a1 + 40)];
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2;
  v8[3] = &unk_264395360;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v5 = (void *)MEMORY[0x21D484070](v8);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), a2);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[130];
  if (v7 == 1)
  {
    [v4 prepareInterfaceToUpgradeCredentialToSignInWithApple:v6[128] serviceIdentifier:v6[127] userInfo:v6[133] completion:v5];
  }
  else if (!v7)
  {
    [v4 prepareInterfaceToUpdatePasswordForServiceIdentifier:v6[127] existingCredential:v6[128] newPassword:v6[129] userInfo:v6[133] completion:v5];
  }

  objc_destroyWeak(&v9);
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3;
  block[3] = &unk_264395360;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 134);
    if (objc_opt_respondsToSelector()) {
      [v2 presentUIForAccountModificationHostViewController:v3];
    }

    WeakRetained = v3;
  }
}

void __142___ASAccountAuthenticationModificationHostViewController_prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext_userInfo_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1072));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationHostViewControllerDidCompleteUpgradeToSignInWithApple:a1[4] userInfo:a1[5] completion:a1[6]];
  }
  else {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __136___ASAccountAuthenticationModificationHostViewController_prepareToCompleteRequestWithHostContext_updatedCredential_userInfo_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1072));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationHostViewController:a1[4] didFinishWithCredential:a1[5] userInfo:a1[6] completion:a1[7]];
  }
  else {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21918F000, v7, OS_LOG_TYPE_DEFAULT, "Authorization controller successfully revoked the upgrade authorization.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke_cold_1(v7, v5);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
  objc_msgSendSuper2(&v10, sel_prepareToCancelRequestWithHostContext_error_completion_, v8, v5, v9);
}

void __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 131, a2);
      objc_super v10 = [v6 credential];
      v11 = [v10 authenticationServicesCredential];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      if (v7)
      {
        v16 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke_cold_1(v16, v7);
        }
      }
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *MEMORY[0x263F28F30];
      id v19 = v7;
      int v20 = objc_msgSend(v19, "safari_matchesErrorDomain:andCode:", v18, -7003);
      v21 = (void *)MEMORY[0x263F087E8];
      if (v20)
      {
        uint64_t v22 = *MEMORY[0x263F08608];
        v28[0] = *MEMORY[0x263F08338];
        v28[1] = v22;
        v29[0] = @"User tapped cancel on Sign in with Apple sheet.";
        v29[1] = v19;
        v23 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
        v24 = v21;
        uint64_t v25 = 1;
      }
      else
      {
        v28[0] = *MEMORY[0x263F08608];
        v29[0] = v19;
        v23 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:1];
        v24 = v21;
        uint64_t v25 = 0;
      }
      v11 = [v24 errorWithDomain:@"ASExtensionErrorDomain" code:v25 userInfo:v23];

      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v11);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    v27 = @"Host view controller deallocated.";
    v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v15 = [v13 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v14];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v15);
  }
}

void __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Authorization controller attempted to revoke upgrade authorization and failed with error: %@", v7, v8, v9, v10, v11);
}

void __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Error when creating Sign in with Apple Authorization: %{public}@", v7, v8, v9, v10, v11);
}

@end