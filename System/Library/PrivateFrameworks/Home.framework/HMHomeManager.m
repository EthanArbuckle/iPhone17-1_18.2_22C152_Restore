@interface HMHomeManager
@end

@implementation HMHomeManager

uint64_t __52__HMHomeManager_HFAdditions__hf_homeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __51__HMHomeManager_HFAdditions__hf_homeFutureForName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "name", (void)v15);
        char v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10)
        {
          v13 = [MEMORY[0x263F58190] futureWithResult:v8];
          v12 = v3;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v11 = (void *)MEMORY[0x263F58190];
  v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
  v13 = [v11 futureWithError:v12];
LABEL_11:

  return v13;
}

uint64_t __44__HMHomeManager_HFAdditions__hf_homeForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __45__HMHomeManager_HFAdditions__hf_homeForName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __65__HMHomeManager_HFAdditions__hf_setHasSeenOnboardingWelcomeView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  uint64_t v5 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 138412546;
    v11 = @"hasSeenOnboardingWelcomeView";
    __int16 v12 = 1024;
    int v13 = v9;
  }

  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_cached_hasSeenOnboardingWelcomeViewNumber");
  v7 = *(void **)(a1 + 40);

  if (v6 == v7) {
    objc_msgSend(*(id *)(a1 + 32), "set_cached_hasSeenOnboardingWelcomeViewNumber:", 0);
  }
  if (v4)
  {
    v8 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "*** Setting HasSeenOnboardingWelcomeView using hf_updateApplicationDataFuture has FAILED =  [%@]  ***", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __63__HMHomeManager_HFAdditions__hf_setSeenNewFeaturesViewVersion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 138412546;
    v7 = @"lastOnboardingNewFeaturesVersionSeen";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
  }

  id v3 = objc_msgSend(*(id *)(a1 + 32), "_cached_lastOnboardingNewFeaturesVersionSeenNumber");
  uint64_t v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    objc_msgSend(*(id *)(a1 + 32), "set_cached_lastOnboardingNewFeaturesVersionSeenNumber:", 0);
  }
}

void __60__HMHomeManager_HFAdditions__hf_updateApplicationDataFuture__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);
}

uint64_t __61__HMHomeManager_HFAdditions__hf_enableEventLogOnboardingFlag__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateDidOnboardEventLogWithCompletionHandler:&__block_literal_global_25_0];
}

void __61__HMHomeManager_HFAdditions__hf_enableEventLogOnboardingFlag__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = HFLogForCategory(0x45uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Error onboarding Activity History: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __91__HMHomeManager_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a2;
  int v4 = +[HFErrorHandler sharedHandler];
  id v5 = v4;
  if (v3) {
    [v4 handleError:v6 operationType:@"HFOperationUpdateApplicationDataCloudSync" options:0 retryBlock:0 cancelBlock:0];
  }
  else {
    [v4 logError:v6 operationDescription:@"HFOperationUpdateApplicationDataCloudSync"];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end