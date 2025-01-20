@interface SFRequestDesktopSitePreferenceManager
@end

@implementation SFRequestDesktopSitePreferenceManager

void __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if ((a3 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke_cold_1(v6);
    }
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke_13;
  v13 = &unk_1E5C74728;
  id v7 = v5;
  id v14 = v7;
  id v15 = *(id *)(a1 + 40);
  v8 = (void (**)(void, void))MEMORY[0x1AD0C36A0](&v10);
  v9 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v9) {
    objc_msgSend(v9, "getAllQuirkValuesWithCompletionHandler:", v8, v10, v11, v12, v13, v14);
  }
  else {
    v8[2](v8, 0);
  }
}

void __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[a2 mutableCopy];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v6 = v5;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "value", (void)v15);
        id v14 = [v12 domain];
        [v6 setObject:v13 forKey:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __113___SFRequestDesktopSitePreferenceManager_getRequestDesktopSitePreferenceForDomain_withTimeout_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v3[8];
  v6 = [MEMORY[0x1E4F98CD0] timeoutWithInterval:a2 fallbackValue:*(double *)(a1 + 56)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113___SFRequestDesktopSitePreferenceManager_getRequestDesktopSitePreferenceForDomain_withTimeout_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5C74298;
  id v8 = *(id *)(a1 + 48);
  [v3 getValueOfPreference:v5 forDomain:v4 withTimeout:v6 usingBlock:v7];
}

uint64_t __113___SFRequestDesktopSitePreferenceManager_getRequestDesktopSitePreferenceForDomain_withTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 integerValue];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Request Desktop Website preference value was just default value, checking quirks list", buf, 2u);
    }
    v6 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_cold_1(a1, v6);
    }
    id v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10;
    v11[3] = &unk_1E5C75D08;
    id v12 = v9;
    id v13 = *(id *)(a1 + 56);
    char v14 = a3;
    [v8 getDefaultPreferenceValueIfNotCustomizedForPreference:v7 domain:v12 completionHandler:v11];
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_3(a1, v5, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_2(v5);
    }
    v6 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDefaultValueUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDefaultValueUpdate__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDefaultValueUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = WeakRetained[6];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "didUpdateRequestDesktopSiteDefaultValue:", objc_msgSend(*(id *)(a1 + 32), "integerValue", (void)v9));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDomainValuesUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDomainValuesUpdate__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDomainValuesUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = WeakRetained[6];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "didUpdateRequestDesktopSitePerSitePreference:", *(void *)(a1 + 32), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

uint64_t __121___SFRequestDesktopSitePreferenceManager_getDefaultPreferenceValueIfNotCustomizedForPreference_domain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) getDefaultPreferenceValueForPreference:*(void *)(*(void *)(a1 + 32) + 64) completionHandler:*(void *)(a1 + 40)];
  }
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "Request Desktop Website preference value for domain %{private}@ was just default value, checking quirks list", (uint8_t *)&v3, 0xCu);
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "Default preference value for domain '%{private}@' is nil", (uint8_t *)&v3, 0xCu);
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Default preference value for domain is nil, which shouldn't happen", v1, 2u);
}

void __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_10_cold_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  int v6 = 138478083;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = [a3 longValue];
  _os_log_debug_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEBUG, "Default preference value for domain '%{private}@' is %ld", (uint8_t *)&v6, 0x16u);
}

void __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to retreive all preferences for Request Desktop Website preference", v1, 2u);
}

@end