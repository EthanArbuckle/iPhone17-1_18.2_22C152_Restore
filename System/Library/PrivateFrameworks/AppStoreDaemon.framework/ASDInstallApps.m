@interface ASDInstallApps
+ (BOOL)initialContentDownloadsEnabled;
+ (BOOL)shouldPostNotificationOnDefaultBrowserInstallation;
+ (id)interface;
+ (void)_installApps:(void *)a3 onPairedDevice:(void *)a4 withCompletionHandler:;
+ (void)installApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5;
+ (void)installApp:(id)a3 withCompletionHandler:(id)a4;
+ (void)installApps:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5;
+ (void)installApps:(id)a3 withCompletionHandler:(id)a4;
+ (void)setInitialContentDownloadsEnabled:(BOOL)a3;
+ (void)setShouldPostNotificationOnDefaultBrowserInstallation:(BOOL)a3;
@end

@implementation ASDInstallApps

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C458];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_installAppReviewApps_withReplyHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_installAppReviewApps_withReplyHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_installEnterpriseApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_installEnterpriseApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_installSystemApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_installSystemApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_installTestFlightApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:0];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_installTestFlightApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v2 setClasses:v29 forSelector:sel_installWatchApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:0];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  [v2 setClasses:v32 forSelector:sel_installWatchApps_onPairedDevice_withReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (BOOL)initialContentDownloadsEnabled
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = +[ASDServiceBroker defaultBroker];
  v3 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  uint64_t v4 = [v2 getInstallationServiceWithError:&obj];
  objc_storeStrong(v3, obj);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke;
  v11[3] = &unk_1E58B3108;
  v11[4] = &v17;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke_2;
  v10[3] = &unk_1E58B3628;
  v10[4] = &v13;
  [v5 areInitialContentDownloadsEnabledWithReplyHandler:v10];

  if (v18[5])
  {
    v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v18[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v9;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "Error getting initial content download value: %{public}@", buf, 0xCu);
    }
  }
  BOOL v7 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setInitialContentDownloadsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[ASDServiceBroker defaultBroker];
  id v8 = 0;
  v5 = [v4 getInstallationServiceWithError:&v8];
  id v6 = v8;
  [v5 setInitialContentDownloadsEnabled:v3];

  if (v6)
  {
    BOOL v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v10 = v3;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error setting initial content download to %{BOOL}d: %{public}@", buf, 0x12u);
    }
  }
}

+ (BOOL)shouldPostNotificationOnDefaultBrowserInstallation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = +[ASDServiceBroker defaultBroker];
  BOOL v3 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  uint64_t v4 = [v2 getInstallationServiceWithError:&obj];
  objc_storeStrong(v3, obj);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__ASDInstallApps_shouldPostNotificationOnDefaultBrowserInstallation__block_invoke;
  v11[3] = &unk_1E58B3108;
  v11[4] = &v17;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ASDInstallApps_shouldPostNotificationOnDefaultBrowserInstallation__block_invoke_2;
  v10[3] = &unk_1E58B3628;
  v10[4] = &v13;
  [v5 shouldPostNotificationOnDefaultBrowserInstallationWithReplyHandler:v10];

  if (v18[5])
  {
    id v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v18[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v9;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "Error getting should post notification on default browser installation value: %{public}@", buf, 0xCu);
    }
  }
  BOOL v7 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __68__ASDInstallApps_shouldPostNotificationOnDefaultBrowserInstallation__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __68__ASDInstallApps_shouldPostNotificationOnDefaultBrowserInstallation__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setShouldPostNotificationOnDefaultBrowserInstallation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[ASDServiceBroker defaultBroker];
  id v8 = 0;
  v5 = [v4 getInstallationServiceWithError:&v8];
  id v6 = v8;
  [v5 setShouldPostNotificationOnDefaultBrowserInstallation:v3];

  if (v6)
  {
    BOOL v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v10 = v3;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error setting should post notification on default browser installation to %{BOOL}d: %{public}@", buf, 0x12u);
    }
  }
}

+ (void)installApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v16[0] = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ASDInstallApps_installApp_onPairedDevice_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E58B2D30;
  id v15 = v8;
  id v13 = v8;
  [a1 installApps:v12 onPairedDevice:v10 withCompletionHandler:v14];
}

void __66__ASDInstallApps_installApp_onPairedDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)installApp:(id)a3 withCompletionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13[0] = a3;
  BOOL v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__ASDInstallApps_installApp_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E58B2D30;
  id v12 = v6;
  id v10 = v6;
  +[ASDInstallApps _installApps:onPairedDevice:withCompletionHandler:]((uint64_t)a1, v9, 0, v11);
}

void __51__ASDInstallApps_installApp_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)_installApps:(void *)a3 onPairedDevice:(void *)a4 withCompletionHandler:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  uint64_t v9 = [v6 firstObject];
  uint64_t v10 = objc_opt_class();

  self;
  if (qword_1EB4D6598 != -1) {
    dispatch_once(&qword_1EB4D6598, &__block_literal_global_19);
  }
  id v11 = (id)_MergedGlobals_45;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v40 != v15) {
        objc_enumerationMutation(v12);
      }
      if (([v11 containsObject:objc_opt_class()] & 1) == 0) {
        break;
      }
      if (objc_opt_class() != v10)
      {
        uint64_t v25 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          v29 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v44 = v29;
          __int16 v45 = 2112;
          uint64_t v46 = v10;
          id v30 = v29;

        v23 = };
        uint64_t v24 = 507;
LABEL_19:
        v26 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", v24, v23);
        v8[2](v8, 0, v26);

        v21 = v12;
        goto LABEL_20;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v14) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    id v22 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v44 = v27;
      id v28 = v27;

    v23 = };
    uint64_t v24 = 909;
    goto LABEL_19;
  }
LABEL_12:

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke;
  v36[3] = &unk_1E58B2E68;
  id v17 = v12;
  id v37 = v17;
  v38 = v8;
  v18 = (void *)MEMORY[0x19F393180](v36);
  uint64_t v19 = +[ASDServiceBroker defaultBroker];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_94;
  v31[3] = &unk_1E58B46A8;
  id v34 = v18;
  uint64_t v35 = v10;
  id v32 = v17;
  id v33 = v7;
  id v20 = v18;
  [v19 getInstallationServiceWithCompletionHandler:v31];

  v21 = v37;
LABEL_20:
}

+ (void)installApps:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 pairingID];
  if (v9)
  {
    +[ASDInstallApps _installApps:onPairedDevice:withCompletionHandler:]((uint64_t)a1, v11, v9, v8);
  }
  else
  {
    uint64_t v10 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 507, @"Paired device has no identifier, did you mean to install locally?");
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
  }
}

+ (void)installApps:(id)a3 withCompletionHandler:(id)a4
{
}

uint64_t __43__ASDInstallApps__availableMetadataClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  _MergedGlobals_45 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = ASDLogHandleForCategory(13);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v6;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "Installation request for %lu app(s) failed with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v10)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_86;
      v18 = &unk_1E58B4680;
      id v8 = v11;
      uint64_t v19 = v8;
      id v20 = *(id *)(a1 + 32);
      [v5 enumerateObjectsUsingBlock:&v15];
      [v8 appendString:@"\n]", v15, v16, v17, v18];
      id v12 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [*(id *)(a1 + 32) count];
        *(_DWORD *)buf = 134218242;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        uint64_t v24 = v8;
        _os_log_debug_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_DEBUG, "Installation request for %lu app(s) completed: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v8 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [*(id *)(a1 + 32) count];
        *(_DWORD *)buf = 134218242;
        uint64_t v22 = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v5;
        _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Installation request for %lu app(s) completed with identifiers: %{public}@", buf, 0x16u);
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_86(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v4 appendFormat:@"\n%@: %@", v6, v7];
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 == objc_opt_class())
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_2;
      v38[3] = &unk_1E58B2CB8;
      id v39 = *(id *)(a1 + 48);
      __int16 v23 = [v5 remoteObjectProxyWithErrorHandler:v38];
      [v23 installEnterpriseApps:*(void *)(a1 + 32) onPairedDevice:*(void *)(a1 + 40) withReplyHandler:*(void *)(a1 + 48)];

      uint64_t v24 = v39;
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 56);
      if (v8 == objc_opt_class())
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_3;
        v36[3] = &unk_1E58B2CB8;
        id v37 = *(id *)(a1 + 48);
        uint64_t v25 = [v5 remoteObjectProxyWithErrorHandler:v36];
        [v25 installAppReviewApps:*(void *)(a1 + 32) withReplyHandler:*(void *)(a1 + 48)];

        uint64_t v24 = v37;
      }
      else
      {
        uint64_t v9 = *(void *)(a1 + 56);
        if (v9 == objc_opt_class())
        {
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_4;
          v34[3] = &unk_1E58B2CB8;
          id v35 = *(id *)(a1 + 48);
          v26 = [v5 remoteObjectProxyWithErrorHandler:v34];
          [v26 installSystemApps:*(void *)(a1 + 32) onPairedDevice:*(void *)(a1 + 40) withReplyHandler:*(void *)(a1 + 48)];

          uint64_t v24 = v35;
        }
        else
        {
          uint64_t v10 = *(void *)(a1 + 56);
          if (v10 == objc_opt_class())
          {
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_5;
            v32[3] = &unk_1E58B2CB8;
            id v33 = *(id *)(a1 + 48);
            v27 = [v5 remoteObjectProxyWithErrorHandler:v32];
            [v27 installTestFlightApps:*(void *)(a1 + 32) onPairedDevice:*(void *)(a1 + 40) withReplyHandler:*(void *)(a1 + 48)];

            uint64_t v24 = v33;
          }
          else
          {
            uint64_t v11 = *(void *)(a1 + 56);
            if (v11 != objc_opt_class())
            {
              uint64_t v12 = *(void *)(a1 + 48);
              uint64_t v13 = NSStringFromClass(*(Class *)(a1 + 56));
              uint64_t v19 = ASDErrorWithUserInfoAndFormat(507, 0, @"Attempting installation with invalid metadata class: %@", v14, v15, v16, v17, v18, (uint64_t)v13);
              (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v19);

              goto LABEL_17;
            }
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_6;
            v30[3] = &unk_1E58B2CB8;
            id v31 = *(id *)(a1 + 48);
            id v28 = [v5 remoteObjectProxyWithErrorHandler:v30];
            [v28 installWatchApps:*(void *)(a1 + 32) onPairedDevice:*(void *)(a1 + 40) withReplyHandler:*(void *)(a1 + 48)];

            uint64_t v24 = v31;
          }
        }
      }
    }

    goto LABEL_17;
  }
  id v20 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v41 = v29;
    __int16 v42 = 2114;
    id v43 = v6;
    _os_log_error_impl(&dword_19BF6A000, v20, OS_LOG_TYPE_ERROR, "Installation request for %lu app(s) failed with error: %{public}@", buf, 0x16u);
  }

  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = ASDErrorWithSafeUserInfo(v6);
  (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);

LABEL_17:
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

@end