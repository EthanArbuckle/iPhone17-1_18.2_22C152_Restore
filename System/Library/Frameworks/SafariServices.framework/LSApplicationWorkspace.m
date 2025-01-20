@interface LSApplicationWorkspace
@end

@implementation LSApplicationWorkspace

void __104__LSApplicationWorkspace_SafariServicesExtras___sf_openURL_inApplication_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 64)) {
    v6 = [[_SFOpenURLOperationDelegate alloc] initWithCompletionHandler:*(void *)(a1 + 64)];
  }
  else {
    v6 = 0;
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) bundleIdentifier];
  v5 = [v2 operationToOpenResource:v3 usingApplication:v4 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:*(void *)(a1 + 56) delegate:v6];

  [v5 start];
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E4F25D68];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5;
    v9[3] = &unk_1E5C743C8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    char v13 = *(unsigned char *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v7 fetchProviderDomainForItem:v10 completionHandler:v9];
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2_cold_1(a1, v8, v6);
    }
    tryOpeningInDefaultApp(*(void **)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 48), 0, 0, *(void **)(a1 + 40));
  }
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5_cold_1(v7, v6);
    }
  }
  char v8 = objc_opt_respondsToSelector();
  v9 = *(void **)(a1 + 32);
  if (v8) {
    objc_msgSend(v9, "fp_appContainerBundleIdentifier");
  }
  else {
  id v10 = [v9 appContainerBundleIdentifier];
  }
  if (v5)
  {
    id v11 = [v5 topLevelBundleIdentifier];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v5 providerID];
    }
    v14 = v13;

    tryOpeningInDefaultApp(*(void **)(a1 + 40), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v14, v10, *(void **)(a1 + 48));
  }
  else
  {
    tryOpeningInDefaultApp(*(void **)(a1 + 40), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 56), 0, 0, *(void **)(a1 + 48));
  }
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v6, v7, "Did not find FPItem for %{sensitive}@: %{public}@", v8, v9, v10, v11, 3u);
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Error fetching provider domain: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end