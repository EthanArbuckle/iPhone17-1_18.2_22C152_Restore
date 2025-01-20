@interface SFNavigationResult
@end

@implementation SFNavigationResult

uint64_t __92___SFNavigationResult_resultWithRedirectToExternalURL_preferredApplicationBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __177___SFNavigationResult_determineResultOfLoadingRequest_isMainFrame_disallowRedirectToExternalApps_preferredApplicationBundleIdentifier_redirectDecisionHandler_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 64) resultOfLoadingRequest:*(void *)(a1 + 32) isMainFrame:*(unsigned __int8 *)(a1 + 72) disallowRedirectToExternalApps:*(unsigned __int8 *)(a1 + 73) preferredApplicationBundleIdentifier:*(void *)(a1 + 40) redirectDecisionHandler:*(void *)(a1 + 48)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __177___SFNavigationResult_determineResultOfLoadingRequest_isMainFrame_disallowRedirectToExternalApps_preferredApplicationBundleIdentifier_redirectDecisionHandler_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5C76C40;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __177___SFNavigationResult_determineResultOfLoadingRequest_isMainFrame_disallowRedirectToExternalApps_preferredApplicationBundleIdentifier_redirectDecisionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

@end