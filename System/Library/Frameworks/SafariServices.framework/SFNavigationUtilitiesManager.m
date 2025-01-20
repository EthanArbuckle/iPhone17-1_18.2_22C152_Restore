@interface SFNavigationUtilitiesManager
@end

@implementation SFNavigationUtilitiesManager

void __62___SFNavigationUtilitiesManager__sharedUserAgentQuirksManager__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F98F80]);
  v1 = (void *)_sharedUserAgentQuirksManager_quirksManager;
  _sharedUserAgentQuirksManager_quirksManager = (uint64_t)v0;
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (a2 == 1) {
    a2 = [*(id *)(a1 + 32) _shouldOverrideUserAgentSettingForFacebookAuthURL:*(void *)(a1 + 40)] ^ 1;
  }
  if (a2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [*(id *)(a1 + 48) setPreferredContentMode:v7];
  if (a2 == 1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleString");
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v9 = +[_SFNavigationUtilitiesManager _sharedUserAgentQuirksManager];
    v10 = _SFMacSafariUserAgentString();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5C76A80;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v9 getQuirksForURLString:v8 withDefaultUserAgent:v10 completionHandler:v15];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3;
  v14[3] = &__block_descriptor_48_e5_B8__0l;
  v14[4] = a3;
  v14[5] = a2;
  v11 = (unsigned int (**)(void))MEMORY[0x1AD0C36A0](v14);
  if (v11[2]())
  {
    [*(id *)(a1 + 48) setPreferredContentMode:0];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 48) _setAllowSiteSpecificQuirksToOverrideCompatibilityMode:1];
    }
  }
  [*(id *)(a1 + 32) _applyAutoplayQuirksToWebsitePolicies:*(void *)(a1 + 48) desktopSiteSetting:a2];
  if (objc_opt_respondsToSelector())
  {
    v12 = *(void **)(a1 + 48);
    v13 = _SFApplicationNameForDesktopUserAgent();
    [v12 _setApplicationNameForUserAgentWithModernCompatibility:v13];
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _setCustomUserAgentAsSiteSpecificQuirks:a2];
  }
  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40) != 1) {
    return 0;
  }
  else {
    return _SFDeviceSupportsDesktopSitesByDefault();
  }
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 40) _setVisibilityAdjustmentSelectorsIncludingShadowHosts:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (a2) {
      id v6 = @"On";
    }
    else {
      id v6 = @"Off";
    }
    uint64_t v7 = v4;
    CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    int v10 = 141558787;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2117;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2048;
    CFAbsoluteTime v17 = v8;
    _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_INFO, "Fetched content blocker enabled state for %{sensitive, mask.hash}@: %@ - time: %f", (uint8_t *)&v10, 0x2Au);
  }
  id v9 = *(id *)(a1 + 40);
  objc_sync_enter(v9);
  [*(id *)(a1 + 48) _setContentBlockersEnabled:a2];
  *(unsigned char *)(*(void *)(a1 + 40) + 32) = a2;
  objc_sync_exit(v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_19(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(a1 + 40) _setCaptivePortalModeEnabled:a2];
  objc_sync_exit(v4);

  uint64_t v5 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v5);
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_sync_exit(obj);
  }
}

uint64_t __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2_21(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_22(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_22_cold_1(v2);
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_22_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to set up all website preferences before timeout", v1, 2u);
}

@end