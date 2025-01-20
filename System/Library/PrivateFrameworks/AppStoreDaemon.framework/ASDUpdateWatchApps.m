@interface ASDUpdateWatchApps
+ (BOOL)shouldPromptBeforeUpdating;
+ (BOOL)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 error:(id *)a5;
+ (void)shouldPromptBeforeUpdatingWithResultHandler:(id)a3;
+ (void)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 withResultHandler:(id)a5;
@end

@implementation ASDUpdateWatchApps

+ (BOOL)shouldPromptBeforeUpdating
{
  return CFPreferencesGetAppBooleanValue(@"AutoUpdatesEnabled", @"com.apple.itunesstored", 0) != 0;
}

+ (void)shouldPromptBeforeUpdatingWithResultHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, [a1 shouldPromptBeforeUpdating], 0);
}

+ (BOOL)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v8 = +[ASDServiceBroker defaultBroker];
  v9 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  v10 = [v8 getUpdatesServiceWithError:&obj];
  objc_storeStrong(v9, obj);

  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke;
    v16[3] = &unk_1E58B3108;
    v16[4] = &v18;
    v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke_2;
    v15[3] = &unk_1E58B3108;
    v15[4] = &v18;
    [v11 compatibilityUpdateForBundleIDs:v7 userInitiated:v6 withReplyHandler:v15];
  }
  v12 = (void *)v19[5];
  if (a5 && v12)
  {
    *a5 = v12;
    v12 = (void *)v19[5];
  }
  BOOL v13 = v12 == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 withResultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[ASDServiceBroker defaultBroker];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke;
  v12[3] = &unk_1E58B4A10;
  id v13 = v7;
  id v14 = v8;
  BOOL v15 = a4;
  id v10 = v7;
  id v11 = v8;
  [v9 getUpdatesServiceWithCompletionHandler:v12];
}

void __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 40);
    v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E58B2CB8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v4 compatibilityUpdateForBundleIDs:v6 userInitiated:v5 withReplyHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

uint64_t __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end