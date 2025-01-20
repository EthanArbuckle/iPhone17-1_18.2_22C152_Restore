@interface AFDeviceStateConnection
- (void)fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:(id)a3;
- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4;
@end

@implementation AFDeviceStateConnection

- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFDeviceStateConnection getPersonalSettingsForSharedUserID:completion:]";
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v8 = +[AFFlowServiceConnection sharedConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke;
  v13[3] = &unk_1E5924BE8;
  id v14 = v5;
  id v15 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_3;
  v11[3] = &unk_1E592B9A0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v5;
  [v8 invokeMethodOnRemoteWithBlock:v13 onError:v11];
}

void __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_2;
  v8[3] = &unk_1E5924BC0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 getPersonalSettingsForSharedUserID:v6 completion:v8];
}

void __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[AFDeviceStateConnection getPersonalSettingsForSharedUserID:completion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[AFDeviceStateConnection fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:]";
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  int v5 = +[AFFlowServiceConnection sharedConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke;
  v9[3] = &unk_1E5924B98;
  id v10 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_3;
  v7[3] = &unk_1E592B9A0;
  id v8 = v10;
  id v6 = v10;
  [v5 invokeMethodOnRemoteWithBlock:v9 onError:v7];
}

void __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5924B70;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:v7];
}

void __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[AFDeviceStateConnection fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end