@interface ASDAppLibrary
+ (id)interface;
+ (id)sharedInstance;
+ (int64_t)launchApp:(id)a3;
+ (int64_t)launchApp:(id)a3 onPairedDevice:(id)a4;
+ (int64_t)launchMessagesExtensionForApp:(id)a3;
+ (unsigned)openableStatusForExecutableAtPath:(id)a3;
+ (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5;
+ (void)launchApp:(id)a3 withResultHandler:(id)a4;
+ (void)launchMessagesExtensionForApp:(id)a3 withResultHandler:(id)a4;
+ (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withResultHandler:(id)a4;
+ (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withResultHandler:(id)a4;
+ (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withResultHandler:(id)a4;
+ (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withResultHandler:(id)a4;
+ (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5;
+ (void)uninstallApp:(id)a3 withResultHandler:(id)a4;
- (ASDAppLibrary)init;
@end

@implementation ASDAppLibrary

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BDF8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_executeQueryWithPredicate_withReplyHandler_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_executeQueryWithPredicate_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_executeQueryForUpdatesReloadingFromServer_withReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ASDAppLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6450 != -1) {
    dispatch_once(&qword_1EB4D6450, block);
  }
  v2 = (void *)_MergedGlobals_26;
  return v2;
}

uint64_t __31__ASDAppLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_26 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDAppLibrary)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  uint64_t v4 = +[ASDNotificationCenter defaultCenter];
  id v5 = v3;
  if (self)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASDAppLibrary;
    v6 = [(ASDAppLibrary *)&v8 init];
    self = v6;
    if (v6) {
      objc_storeWeak((id *)&v6->_serviceBroker, v5);
    }
  }

  return self;
}

+ (int64_t)launchApp:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  uint64_t v4 = +[ASDServiceBroker defaultBroker];
  id v5 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  v6 = [v4 getLibraryServiceWithError:&obj];
  objc_storeStrong(v5, obj);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __27__ASDAppLibrary_launchApp___block_invoke;
  v15[3] = &unk_1E58B3108;
  v15[4] = &v21;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__ASDAppLibrary_launchApp___block_invoke_2;
  v14[3] = &unk_1E58B3130;
  v14[4] = &v17;
  [v7 launchApp:v3 withReplyHandler:v14];

  int64_t v8 = v18[3];
  if (v8 == 2)
  {
    v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      uint64_t v12 = v22[5];
      *(_DWORD *)buf = 138543874;
      v28 = v11;
      __int16 v29 = 2114;
      id v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v12;
      id v13 = v11;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", buf, 0x20u);
    }
    int64_t v8 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __27__ASDAppLibrary_launchApp___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __27__ASDAppLibrary_launchApp___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (int64_t)launchApp:(id)a3 onPairedDevice:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  __int16 v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 2;
  uint64_t v7 = +[ASDServiceBroker defaultBroker];
  int64_t v8 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  v9 = [v7 getLibraryServiceWithError:&obj];
  objc_storeStrong(v8, obj);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke;
  v19[3] = &unk_1E58B3108;
  v19[4] = &v25;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v11 = [v6 pairingID];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke_2;
  v18[3] = &unk_1E58B3130;
  v18[4] = &v21;
  [v10 launchApp:v5 onPairedDevice:v11 withReplyHandler:v18];

  int64_t v12 = v22[3];
  if (v12 == 2)
  {
    id v13 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      uint64_t v16 = v26[5];
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v15;
      __int16 v33 = 2114;
      id v34 = v5;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      id v17 = v15;
      _os_log_error_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", buf, 0x2Au);
    }
    int64_t v12 = v22[3];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)launchApp:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_4;
    v12[3] = &unk_1E58B31A8;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 launchApp:v13 withReplyHandler:v12];
  }
  else
  {
    int64_t v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v5;
      id v11 = v9;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v3;
    id v9 = v7;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 2, v5, v6);
}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = a2;
      id v8 = v6;
      _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ status: %ld", buf, 0x20u);
    }
  }
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_5;
  v9[3] = &unk_1E58B3180;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  dispatch_async(v5, v9);
}

uint64_t __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

+ (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[ASDServiceBroker defaultBroker];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke;
  v15[3] = &unk_1E58B3248;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 getLibraryServiceWithCompletionHandler:v15];
}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_2;
    v19[3] = &unk_1E58B31F8;
    uint64_t v23 = *(void *)(a1 + 56);
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    uint64_t v6 = [a2 remoteObjectProxyWithErrorHandler:v19];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) pairingID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_7;
    v14[3] = &unk_1E58B3220;
    uint64_t v18 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v6 launchApp:v7 onPairedDevice:v8 withReplyHandler:v14];
  }
  else
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v25 = v10;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      __int16 v30 = 2114;
      id v31 = v5;
      id v13 = v10;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_opt_class();
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v13 = 138544130;
    id v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    id v20 = v3;
    id v12 = v9;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", (uint8_t *)&v13, 0x2Au);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], 2, v5, v6, v7, v8);
}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = a2;
      id v9 = v6;
      _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ status: %ld", buf, 0x2Au);
    }
  }
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_8;
  v10[3] = &unk_1E58B3180;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = a2;
  dispatch_async(v5, v10);
}

uint64_t __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

+ (int64_t)launchMessagesExtensionForApp:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  uint64_t v4 = +[ASDServiceBroker defaultBroker];
  uint64_t v5 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  uint64_t v6 = [v4 getLibraryServiceWithError:&obj];
  objc_storeStrong(v5, obj);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke;
  v15[3] = &unk_1E58B3108;
  void v15[4] = &v21;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke_2;
  v14[3] = &unk_1E58B3130;
  void v14[4] = &v17;
  [v7 launchApp:v3 extensionType:1 withReplyHandler:v14];

  if (v22[5])
  {
    uint64_t v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      uint64_t v12 = v22[5];
      *(_DWORD *)buf = 138543874;
      __int16 v28 = v11;
      __int16 v29 = 2114;
      id v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v12;
      id v13 = v11;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
  int64_t v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)launchMessagesExtensionForApp:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_9;
    v12[3] = &unk_1E58B31A8;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 launchApp:v13 extensionType:1 withReplyHandler:v12];
  }
  else
  {
    uint64_t v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v5;
      id v11 = v9;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v3;
    id v9 = v7;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 2, v5, v6);
}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = a2;
      id v8 = v6;
      _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ status: %ld", buf, 0x20u);
    }
  }
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_10;
  v9[3] = &unk_1E58B3180;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  dispatch_async(v5, v9);
}

uint64_t __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

+ (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_11;
    v12[3] = &unk_1E58B3270;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 lookupBundleIDsForDeletableSystemAppsWithItemIDs:v13 withReplyHandler:v12];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = *(void **)(a1 + 32);
      id v11 = v9;
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v10 count];
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_opt_class();
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = [v13 count];
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);
    }
  }
  int v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_12;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v9;
  id v16 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_12(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_14;
    v12[3] = &unk_1E58B3270;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 lookupItemIDsForDeletableSystemAppsWithBundleIDs:v13 withReplyHandler:v12];
  }
  else
  {
    int v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = *(void **)(a1 + 32);
      id v11 = v9;
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v10 count];
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu bundleID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_opt_class();
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = [v13 count];
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu bundleID(s) error: %{public}@", buf, 0x20u);
    }
  }
  int v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_15;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v9;
  id v16 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_15(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_16;
    v12[3] = &unk_1E58B3270;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:v13 withReplyHandler:v12];
  }
  else
  {
    int v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = *(void **)(a1 + 32);
      id v11 = v9;
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v10 count];
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch itemID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_opt_class();
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = [v13 count];
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch itemID(s) error: %{public}@", buf, 0x20u);
    }
  }
  int v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_17;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v9;
  id v16 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_17(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B31D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 getLibraryServiceWithCompletionHandler:v11];
}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E58B3158;
    uint64_t v19 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_18;
    v12[3] = &unk_1E58B3270;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v6 lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:v13 withReplyHandler:v12];
  }
  else
  {
    int v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = *(void **)(a1 + 32);
      id v11 = v9;
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v10 count];
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch bundleID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_opt_class();
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = [v13 count];
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch bundleID(s) error: %{public}@", buf, 0x20u);
    }
  }
  int v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_19;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v9;
  id v16 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_19(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (unsigned)openableStatusForExecutableAtPath:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v4 = +[ASDServiceBroker defaultBroker];
  id v5 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  id v6 = [v4 getLibraryServiceWithError:&obj];
  objc_storeStrong(v5, obj);

  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke;
    v13[3] = &unk_1E58B3108;
    v13[4] = &v15;
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke_2;
    v12[3] = &unk_1E58B3298;
    void v12[4] = &v21;
    v12[5] = &v15;
    [v7 openableStatusForExecutableAtPath:v3 withReplyHandler:v12];
  }
  LODWORD(v8) = *((unsigned __int8 *)v22 + 24);
  if (v8 == 255)
  {
    int v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v3 lastPathComponent];
      uint64_t v11 = v16[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[Library] Status for %{public}@ unknown: %{public}@", buf, 0x16u);
    }
    LOBYTE(v8) = *((unsigned char *)v22 + 24);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke(uint64_t a1, void *a2)
{
}

void __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

+ (void)uninstallApp:(id)a3 withResultHandler:(id)a4
{
}

+ (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[ASDServiceBroker defaultBroker];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke;
  v13[3] = &unk_1E58B32C0;
  id v15 = v9;
  id v16 = a1;
  id v14 = v8;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  [v10 getLibraryServiceWithCompletionHandler:v13];
}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E58B3158;
    uint64_t v20 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v17];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_21;
    v13[3] = &unk_1E58B3158;
    uint64_t v16 = *(void *)(a1 + 48);
    id v14 = v7;
    id v15 = *(id *)(a1 + 40);
    [v6 uninstallApp:v14 requestUserConfirmation:v8 withReplyHandler:v13];
  }
  else
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      id v26 = v5;
      id v12 = v10;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v3;
    id v9 = v7;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v5, v6);
}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v3;
      id v10 = v8;
      _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_22;
  v11[3] = &unk_1E58B2E18;
  id v6 = *(id *)(a1 + 40);
  id v12 = v3;
  id v13 = v6;
  id v7 = v3;
  dispatch_async(v5, v11);
}

uint64_t __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_serviceBroker);
}

@end