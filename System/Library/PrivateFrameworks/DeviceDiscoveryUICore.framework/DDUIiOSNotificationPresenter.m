@interface DDUIiOSNotificationPresenter
@end

@implementation DDUIiOSNotificationPresenter

void __47___DDUIiOSNotificationPresenter__setupIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _DDUICoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Notification authorization granted? %d with error: %@", (uint8_t *)v6, 0x12u);
  }
}

void __97___DDUIiOSNotificationPresenter_showNotificationForApplication_deviceName_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      v6 = "Could not post local notification with error %@";
LABEL_6:
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    __int16 v7 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v7;
    v6 = "Local notification %@ posted successfully";
    goto LABEL_6;
  }
}

void __88___DDUIiOSNotificationPresenter_showContinuityCameraConfirmation_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      v6 = "Could not post local notification with error %@";
LABEL_6:
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    __int16 v7 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v7;
    v6 = "Local notification %@ posted successfully";
    goto LABEL_6;
  }
}

uint64_t __62___DDUIiOSNotificationPresenter__configureNotificationTimeout__block_invoke(uint64_t a1)
{
  v2 = _DDUICoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1CFC71000, v2, OS_LOG_TYPE_DEFAULT, "Notification timed out.  Removing from notification center.", v8, 2u);
  }

  id v3 = [*(id *)(a1 + 32) presentedNotification];
  id v4 = [v3 completion];

  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) presentedNotification];
    v6 = [v5 completion];
    v6[2](v6, 5);
  }
  return [*(id *)(a1 + 32) _clearPresentedNotificationIfNeeded];
}

void __87___DDUIiOSNotificationPresenter__handleContinuityCameraDisabledAlertResponseWithState___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  char v4 = [v2 openSensitiveURL:v3 withOptions:0 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    v6 = _DDUICoreLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1CFC71000, v6, OS_LOG_TYPE_DEFAULT, "### Launch URL failed: %@, %@\n", buf, 0x16u);
    }
  }
}

void __77___DDUIiOSNotificationPresenter__showContinuityCameraDisabledAlertWithState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int DeviceClass = GestaltGetDeviceClass();
  SInt32 error = 0;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1)
  {
    v14 = DDUICoreLocalizedString(@"CC_DISABLED_HEADER");
    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    v15 = DDUICoreLocalizedString(@"CC_DISABLED_CANCEL");
    [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

    v16 = DDUICoreLocalizedString(@"CC_DISABLED_SETTINGS");
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

    if (DeviceClass == 3)
    {
      v17 = @"CC_DISABLED_MESSAGE_IPAD";
    }
    else
    {
      if (DeviceClass != 1) {
        goto LABEL_16;
      }
      v17 = @"CC_DISABLED_MESSAGE_IPHONE";
    }
    DDUICoreLocalizedString(v17);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  else
  {
    if (v4) {
      goto LABEL_16;
    }
    id v5 = [*(id *)(a1 + 32) wirelessSettingsController];
    int v6 = [v5 deviceSupportsWAPI];
    uint64_t v7 = @"WIFI";
    if (v6) {
      uint64_t v7 = @"WLAN";
    }
    id v8 = v7;

    id v9 = [NSString stringWithFormat:@"CC_%@_OFF_HEADER", v8];
    uint64_t v10 = DDUICoreLocalizedString(v9);
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    __int16 v11 = DDUICoreLocalizedString(@"CC_WIFI_OFF_CANCEL");
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

    id v12 = DDUICoreLocalizedString(@"CC_WIFI_OFF_SETTINGS");
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

    if (DeviceClass == 1)
    {
      uint64_t v13 = @"CC_%@_OFF_MESSAGE_IPHONE";
      goto LABEL_12;
    }
    if (DeviceClass == 3)
    {
      uint64_t v13 = @"CC_%@_OFF_MESSAGE_IPAD";
LABEL_12:
      v18 = objc_msgSend(NSString, "stringWithFormat:", v13, v8);
      v19 = DDUICoreLocalizedString(v18);
      [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
    }
  }

LABEL_16:
  v20 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, (CFDictionaryRef)v3);
  if (error)
  {
    v21 = _DDUICoreLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = error;
      _os_log_impl(&dword_1CFC71000, v21, OS_LOG_TYPE_DEFAULT, "Error creating continuity camera disabled user notification (error: %d)\n", buf, 8u);
    }
  }
  else
  {
    v22 = v20;
    *(void *)buf = 0;
    CFUserNotificationReceiveResponse(v20, 0.0, (CFOptionFlags *)buf);
    if ((buf[0] & 3) == 0) {
      [*(id *)(a1 + 32) _handleContinuityCameraDisabledAlertResponseWithState:*(void *)(a1 + 40)];
    }
    CFRelease(v22);
  }
}

void __109___DDUIiOSNotificationPresenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _DDUICoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Finished launching application with error %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

@end