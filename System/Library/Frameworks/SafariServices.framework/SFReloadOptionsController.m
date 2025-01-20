@interface SFReloadOptionsController
@end

@implementation SFReloadOptionsController

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didUpdateRequestDesktopSitePerSitePreference:*(void *)(a1 + 32)];
}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didUpdateRequestDesktopSiteDefaultValue:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_4;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

uint64_t __98___SFReloadOptionsController_customUserAgentSettingForMainFrameURL_withTimeout_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return [*(id *)(a1 + 32) _overrideSettingIfNeeded:a2 source:v3 domain:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke_cold_1(v7);
    }
  }
  v8 = [v5 objectForKeyedSubscript:@"desktopLinkURLString"];
  if ([v8 length])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"canonicalURLString"];
  }
  v10 = v9;
  uint64_t v11 = [v9 length];
  v12 = *(void **)(a1 + 32);
  if (v11)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v10);
    [v12 requestDesktopSiteWithURL:v13];
  }
  else
  {
    [*(id *)(a1 + 32) requestDesktopSiteWithURL:*(void *)(a1 + 40)];
  }
}

void __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A690B000, v1, OS_LOG_TYPE_ERROR, "Error occurred when trying to find a desktop website URL on webpage: %{public}@", v4, 0xCu);
}

@end