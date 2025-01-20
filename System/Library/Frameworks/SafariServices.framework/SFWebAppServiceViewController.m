@interface SFWebAppServiceViewController
@end

@implementation SFWebAppServiceViewController

void __56___SFWebAppServiceViewController_serviceViewControllers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)serviceViewControllers_serviceViewControllers;
  serviceViewControllers_serviceViewControllers = v0;
}

uint64_t __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXWebApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_cold_1(v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_126(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_126_cold_1(v3, v2);
    }
  }
}

uint64_t __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_132(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (void *)*MEMORY[0x1E4FB2608];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return [v2 endBackgroundTask:v3];
}

uint64_t __67___SFWebAppServiceViewController_setNeedsStatusBarAppearanceUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 2096) setBackgroundColor:*(void *)(a1 + 40)];
}

void __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FA6CB8];
    v4 = [*(id *)(*(void *)(a1 + 32) + 2088) identifier];
    [v3 launchWebClipWithIdentifier:v4];

    *(unsigned char *)(*(void *)(a1 + 32) + 2208) = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
    [v5 destroyScene];
  }
}

void __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXWebPush();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_cold_1(a2, v7, v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = a2;
    _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Push notification permission request finished with result %i", buf, 8u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_156;
  v8[3] = &unk_1E5C74520;
  id v9 = *(id *)(a1 + 32);
  char v10 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) _navigationUtilitiesManager];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
  v8[3] = &unk_1E5C74570;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = a2;
  [v4 websitePoliciesForURL:v7 isForMainFrameNavigation:v5 navigationType:v6 completionHandler:v8];
}

uint64_t __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t __52___SFWebAppServiceViewController__updateDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 URL];
  int v6 = [v4 _isURLOutOfScope:v5 withLoginURLExempted:0];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    v8 = [v3 URL];
    int v6 = [v7 isEqual:v8];
  }
  return v6 ^ 1u;
}

uint64_t __67___SFWebAppServiceViewController_navigationBarDoneButtonWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 URL];
  uint64_t v4 = [v2 _isURLOutOfScope:v3 withLoginURLExempted:0] ^ 1;

  return v4;
}

void __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleHostStateUpdate:*(void *)(a1 + 32)];
}

void __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke_2;
  v4[3] = &unk_1E5C74610;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 getNotificationSettingsWithCompletionHandler:v4];
}

void __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    long long v3 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke_cold_1(v3, v2);
    }
  }
}

void __110___SFWebAppServiceViewController_websiteDataStore_getDisplayedNotificationsForWorkerOrigin_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "request", (void)v13);
        v11 = [v10 content];
        int v12 = [v11 userInfo];
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_cold_1(a1, v2, v3);
  }
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_273(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v3);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    getAndProcessPendingPushMessage(*(void **)(a1 + 40), WeakRetained);
  }
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)buf = 67109120;
    int v23 = [v3 count];
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Processing %i push messages", buf, 8u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        CFRetain(*(CFTypeRef *)(a1 + 40));
        int v12 = *(void **)(a1 + 40);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_274;
        v14[3] = &unk_1E5C74660;
        v14[4] = v11;
        id v13 = v12;
        id v15 = v13;
        id v16 = *(id *)(a1 + 32);
        [v13 _processPushMessage:v11 completionHandler:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_274(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"FAILURE";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      id v5 = @"SUCCESS";
    }
    int v7 = 138740227;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Push message delivered: %{sensitive}@, %{public}@", (uint8_t *)&v7, 0x16u);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_281(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 40)];
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_cold_1(a1, v2, v3);
  }
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_282(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Push notification activation event handler done. Result: %i", (uint8_t *)v5, 8u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_283(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 40)];
}

uint64_t __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[_SFWebAppMediaCaptureStatusBarManager sharedManager];
  [v2 cancelStatusBarOverride];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v6 && WeakRetained)
  {
    objc_msgSend(WeakRetained[261], "_sf_setApplicationManifest:", v6);
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:0 error:0];
    id v5 = objc_msgSend(WeakRetained[261], "_sf_applicationManifestPath");
    [v4 writeToURL:v5 atomically:1];
  }
}

void __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v5 count])
  {
    id v4 = objc_msgSend(v5, "_web_stringForKey:", *MEMORY[0x1E4FB3150]);
    [WeakRetained[261] setWebClipStatusBarStyle:UIWebClipStatusBarStyleForMetaTagContent()];

    [WeakRetained[261] updateOnDisk];
    [WeakRetained setNeedsStatusBarAppearanceUpdate];
  }
}

uint64_t __51___SFWebAppServiceViewController__updateThemeColor__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 2184) = 0;
  return result;
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Background task expired while waiting to delete web app data", v1, 2u);
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_126_cold_1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v6 = 138543362;
  int v7 = v4;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v3, v5, "Error removing network process from WKWebsiteDataStore. Error: %{public}@", (uint8_t *)&v6);
}

void __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_cold_1(char a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = a1 & 1;
  uint64_t v5 = a2;
  int v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7[0] = 67109379;
  v7[1] = v4;
  __int16 v8 = 2113;
  __int16 v9 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Push notification permission request finished with result %i. Error: %{private}@", (uint8_t *)v7, 0x12u);
}

void __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v6 = 138477827;
  int v7 = v4;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v3, v5, "Failed to add web push notfication request: %{private}@", (uint8_t *)&v6);
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a2, a3, "Took too long to handle push for Web clip with identifier: '%@'", (uint8_t *)&v4);
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a2, a3, "Took too long to handle notification activation for Web clip with identifier: '%@'", (uint8_t *)&v4);
}

@end