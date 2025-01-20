@interface ASCredentialAuthenticationViewController
@end

@implementation ASCredentialAuthenticationViewController

uint64_t __87___ASCredentialAuthenticationViewController_initWithExtension_passkeyAssertionRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 provideCredentialWithoutUserInteractionForRequest:*(void *)(*(void *)(a1 + 32) + 1016)];
}

uint64_t __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performPasskeyRegistrationWithoutUserInteractionIfPossible:*(void *)(a1 + 32)];
}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[127];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_3;
  v5[3] = &unk_264395388;
  v6 = v3;
  [a2 prepareInterfaceForPasskeyRegistration:v4 completionHandler:v5];
}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_4;
  block[3] = &unk_264395388;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentUIForPasswordCredentialAuthenticationViewController:*(void *)(a1 + 32)];
  }
}

void __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) credentialIdentityStoreIdentifier];
  v5 = [*(id *)(a1 + 40) nonUIHostContext];
  v6 = [v5 _auxiliaryConnection];
  v7 = SFCredentialIdentityStoreIdentifierCreateWithConnectionToExtension();

  if ([v4 isEqual:v7])
  {
    [v3 provideCredentialWithoutUserInteractionForRequest:*(void *)(*(void *)(a1 + 40) + 1016)];
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke_cold_1((uint64_t)v4, (uint64_t)v7, v8);
    }
    v9 = [*(id *)(a1 + 40) extension];
    [v9 _kill:9];
  }
}

uint64_t __92___ASCredentialAuthenticationViewController_initWithExtension_oneTimeCodeCredentialRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 provideCredentialWithoutUserInteractionForRequest:*(void *)(a1 + 32)];
}

uint64_t __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 1016);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2;
  v5[3] = &unk_264395388;
  void v5[4] = v2;
  return [a2 prepareInterfaceToProvideCredentialForRequest:v3 completionHandler:v5];
}

void __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3;
  block[3] = &unk_264395388;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentUIForPasswordCredentialAuthenticationViewController:*(void *)(a1 + 32)];
  }
}

void __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke_cold_1(v6, v5);
    }
  }
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __107___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithCredential:*(void *)(a1 + 40) error:0 completion:*(void *)(a1 + 48)];
}

uint64_t __123___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithPasskeyAssertionCredential:*(void *)(a1 + 40) error:0 completion:*(void *)(a1 + 48)];
}

uint64_t __126___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyRegistrationCredential_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithPasskeyRegistrationCredential:*(void *)(a1 + 40) error:0 completion:*(void *)(a1 + 48)];
}

uint64_t __118___ASCredentialAuthenticationViewController_prepareToCompleteOneTimeCodeRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithOneTimeCodeCredential:*(void *)(a1 + 40) error:0 completion:*(void *)(a1 + 48)];
}

void __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Refusing to send credential identity with store identifier [%{public}@] to to extension with store identifier [%{public}@]", (uint8_t *)&v3, 0x16u);
}

void __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21918F000, v3, OS_LOG_TYPE_ERROR, "Failed to remove credential identity store with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end