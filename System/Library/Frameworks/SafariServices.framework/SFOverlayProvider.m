@interface SFOverlayProvider
@end

@implementation SFOverlayProvider

void __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke_2;
  block[3] = &unk_1E5C77F20;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [(id)objc_opt_class() alwaysShowOverlayForDebug];
  }
  [*(id *)(a1 + 32) setAvailable:v2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __78__SFOverlayProvider_SafariServicesExtras___updateAppClipOverlayPreferenceHook__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAppStoreBanner();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "User disallows showing app clip info overlay for domain %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

@end