@interface UNNotificationContentExtensionVendorContext
@end

@implementation UNNotificationContentExtensionVendorContext

void __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F3F608];
  v12[0] = *MEMORY[0x263F3F5E8];
  v12[1] = v2;
  v13[0] = MEMORY[0x263EFFA88];
  v13[1] = MEMORY[0x263EFFA88];
  v12[2] = *MEMORY[0x263F3F5C0];
  v13[2] = @"UNAppLaunchOriginContentExtension";
  v3 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = 0;
  char v6 = [v4 openSensitiveURL:v5 withOptions:v3 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR)) {
    __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_cold_1();
  }
  if (*(void *)(a1 + 40))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_12;
    v8[3] = &unk_264603770;
    id v9 = *(id *)(a1 + 40);
    char v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __71___UNNotificationContentExtensionVendorContext_setNotificationActions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  [*(id *)(a1 + 32) addObject:v3];
}

void __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) notificationExtensionContainer];
  if (objc_opt_respondsToSelector()) {
    [v1 preserveInputViews];
  }
}

void __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) notificationExtensionContainer];
  if (objc_opt_respondsToSelector()) {
    [v1 restoreInputViews];
  }
}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2;
  v2[3] = &unk_2646036E8;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_sync(MEMORY[0x263EF83A0], v2);
}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _notificationExtension];
  if (([*(id *)(a1 + 32) didCheckActionResponseDelegate] & 1) == 0)
  {
    [*(id *)(a1 + 32) _extensionWantsToReceiveActionResponses:objc_opt_respondsToSelector() & 1];
    [*(id *)(a1 + 32) setDidCheckActionResponseDelegate:1];
  }
  char v3 = objc_opt_respondsToSelector();
  v4 = (void *)UNLogExtensionsService;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      char v6 = v4;
      id v7 = [v5 _UUID];
      v8 = [*(id *)(a1 + 40) request];
      id v9 = [v8 identifier];
      char v10 = objc_msgSend(v9, "un_logDigest");
      int v12 = 138543618;
      v13 = v7;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_222224000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [v2 didReceiveNotification:*(void *)(a1 + 40)];
    id v11 = [*(id *)(a1 + 32) notificationExtensionContainer];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(*(id *)(a1 + 32), "_extensionWantsToBecomeFirstResponder:", objc_msgSend(v11, "canBecomeFirstResponder"));
    }
  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
  {
    __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2_cold_1(v4);
  }
}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2;
  v2[3] = &unk_2646036E8;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_sync(MEMORY[0x263EF83A0], v2);
}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) _notificationExtension];
  objc_initWeak(&location, *v2);
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = (id)UNLogExtensionsService;
  char v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) _UUID];
      v8 = [*(id *)(a1 + 40) notification];
      id v9 = [v8 request];
      char v10 = [v9 identifier];
      objc_msgSend(v10, "un_logDigest");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      int v12 = [*(id *)(a1 + 40) actionIdentifier];
      *(_DWORD *)buf = 138543874;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v11;
      __int16 v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_222224000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification response %{public}@ for @%{public}@", buf, 0x20u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_27;
    v16[3] = &unk_2646037E8;
    objc_copyWeak(&v18, &location);
    id v17 = *(id *)(a1 + 40);
    [v3 didReceiveNotificationResponse:v13 completionHandler:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2_cold_1(v15, buf, v6);
    }
  }
  objc_destroyWeak(&location);
}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_27(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _extensionDidCompleteNotificationResponse:*(void *)(a1 + 32) withOption:a2];
}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2;
  block[3] = &unk_264603838;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2(id *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] _notificationExtension];
  char v3 = objc_opt_respondsToSelector();
  id v4 = (void *)UNLogExtensionsService;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      char v6 = v4;
      id v7 = [v5 _UUID];
      v8 = [a1[5] notification];
      id v9 = [v8 request];
      char v10 = [v9 identifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v12 = [a1[5] actionIdentifier];
      *(_DWORD *)buf = 138543874;
      id v18 = v7;
      __int16 v19 = 2114;
      v20 = v11;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      _os_log_impl(&dword_222224000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification response %{public}@ for @%{public}@", buf, 0x20u);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_29;
    v14[3] = &unk_264603810;
    id v13 = a1[5];
    v14[4] = a1[4];
    id v15 = v13;
    id v16 = a1[6];
    [v2 didReceiveNotificationResponse:v15 completionHandler:v14];
  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
  {
    __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2_cold_1(v4);
  }
}

uint64_t __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_29(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (void *)UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    char v6 = v4;
    id v7 = [v5 _UUID];
    v8 = [*(id *)(a1 + 40) notification];
    id v9 = [v8 request];
    char v10 = [v9 identifier];
    id v11 = objc_msgSend(v10, "un_logDigest");
    int v12 = [*(id *)(a1 + 40) actionIdentifier];
    int v14 = 138544130;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = a2;
    _os_log_impl(&dword_222224000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension called completion notification response %{public}@ for @%{public}@: %ld", (uint8_t *)&v14, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _notificationExtension];
  if (objc_opt_respondsToSelector())
  {
    [v1 mediaPause];
  }
  else
  {
    uint64_t v2 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR)) {
      __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2_cold_1(v2);
    }
  }
}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _notificationExtension];
  if (objc_opt_respondsToSelector())
  {
    [v1 mediaPlay];
  }
  else
  {
    uint64_t v2 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR)) {
      __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2_cold_1(v2);
    }
  }
}

void __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMediaPlayPauseButton];
}

void __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_222224000, v0, OS_LOG_TYPE_ERROR, "openURL: failed: %@", v1, 0xCu);
}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  char v3 = (objc_class *)OUTLINED_FUNCTION_2();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222224000, v5, v6, "Extension class %{public}@ does not implement selector didReceiveNotification:", v7, v8, v9, v10, v11);
}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_222224000, log, OS_LOG_TYPE_ERROR, "Extension class %{public}@ does not implement selector didReceiveNotificationResponse:completionHandler:", buf, 0xCu);
}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  char v3 = (objc_class *)OUTLINED_FUNCTION_2();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222224000, v5, v6, "Extension class %{public}@ does not implement selector didReceiveNotificationResponse:completionHandler:", v7, v8, v9, v10, v11);
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  char v3 = (objc_class *)OUTLINED_FUNCTION_2();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222224000, v5, v6, "Extension class %{public}@ does not implement selector mediaPause", v7, v8, v9, v10, v11);
}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  char v3 = (objc_class *)OUTLINED_FUNCTION_2();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222224000, v5, v6, "Extension class %{public}@ does not implement selector mediaPlay", v7, v8, v9, v10, v11);
}

@end