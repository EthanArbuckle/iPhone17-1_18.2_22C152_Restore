@interface SFExternalPasswordCredentialViewController
@end

@implementation SFExternalPasswordCredentialViewController

void __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 992), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setDelegate:");
    v8 = [*(id *)(*(void *)(a1 + 32) + 992) serviceViewControllerProxy];
    [*(id *)(*(void *)(a1 + 32) + 1000) setTarget:v8];

    if ([*(id *)(a1 + 32) isViewLoaded]) {
      [*(id *)(a1 + 32) _addRemoteViewAsChild];
    }
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke_cold_1(v9, v7);
    }
  }
}

void __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to get donated password view controller with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end