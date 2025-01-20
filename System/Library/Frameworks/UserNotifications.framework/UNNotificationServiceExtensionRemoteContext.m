@interface UNNotificationServiceExtensionRemoteContext
@end

@implementation UNNotificationServiceExtensionRemoteContext

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke(void **a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (atomic_exchange((atomic_uchar *volatile)a1[4] + 24, 1u))
  {
    v20 = (void *)UNLogRemoteNotifications;
    if (os_log_type_enabled((os_log_t)UNLogRemoteNotifications, OS_LOG_TYPE_ERROR)) {
      __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_2(a1 + 4, v20, (uint64_t)a1);
    }
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    v5 = (void *)[v3 copy];
    v6 = UNSafeCast(v4, v5);

    if (v3)
    {
      if (!v6)
      {
        v7 = (void *)UNLogRemoteNotifications;
        if (os_log_type_enabled((os_log_t)UNLogRemoteNotifications, OS_LOG_TYPE_ERROR)) {
          __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_1(a1 + 4, v7, (uint64_t)a1);
        }
      }
    }
    v8 = (void *)UNLogServiceExtension;
    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = v8;
      v11 = [v9 _UUID];
      v12 = [a1[5] identifier];
      v13 = objc_msgSend(v12, "un_logDigest");
      v14 = [v6 attachments];
      *(_DWORD *)buf = 138544130;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v13;
      __int16 v28 = 1024;
      BOOL v29 = v6 != 0;
      __int16 v30 = 2048;
      uint64_t v31 = [v14 count];
      _os_log_impl(&dword_1AE729000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received replacement content for notification request %{public}@ [ hasContent: %d attachments: %lu ]", buf, 0x26u);
    }
    v15 = [v6 attachments];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      uint64_t v17 = [a1[4] _stageAttachmentsForNotificationContent:v6];

      v6 = (void *)v17;
    }
    v18 = +[UNUserNotificationServiceConnection sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E5F05F20;
    id v22 = v6;
    id v23 = a1[6];
    id v19 = v6;
    [v18 performBlockOnConnectionQueue:v21];
  }
}

uint64_t __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addSecurityScope:@"com.apple.app-sandbox.read-write"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 removeSecurityScope];
}

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_1(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  id v5 = a2;
  v6 = [v4 _UUID];
  v7 = [*(id *)(a3 + 40) identifier];
  v8 = objc_msgSend(v7, "un_logDigest");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE729000, v9, v10, "[%{public}@] Ignoring unsafe replacement content for notification request %{public}@", v11, v12, v13, v14, v15);
}

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_2(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  id v5 = a2;
  v6 = [v4 _UUID];
  v7 = [*(id *)(a3 + 40) identifier];
  v8 = objc_msgSend(v7, "un_logDigest");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE729000, v9, v10, "[%{public}@] Ignoring additional replacement content replies for notification request %{public}@", v11, v12, v13, v14, v15);
}

@end