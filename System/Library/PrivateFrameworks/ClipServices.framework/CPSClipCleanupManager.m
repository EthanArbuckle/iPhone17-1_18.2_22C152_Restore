@interface CPSClipCleanupManager
+ (id)_parentBundleIDsFromAppRecord:(id)a3;
+ (id)sharedManager;
- (BOOL)_shouldDeleteClipWithRecord:(id)a3 parentRecord:(id)a4;
- (CPSClipCleanupManager)init;
- (id)_allAppClipsForPlaceholderOnly:(BOOL)a3;
- (void)_applicationsDidChange:(id)a3 operationHandler:(id)a4;
- (void)_deleteClipWhenBackgrounded:(id)a3 completionHandler:(id)a4;
- (void)_didReceiveApplicationChangedNotification:(id)a3 operationHandler:(id)a4;
- (void)_didReceiveApplicationRegisteredNotification:(id)a3;
- (void)_didReceiveApplicationUnregisteredNotification:(id)a3;
- (void)_didReceiveMCSettingsChangedNotification:(id)a3;
- (void)_handleNewInstalledAppWithBundleID:(id)a3;
- (void)_handleNewUninstalledAppWithBundleID:(id)a3;
- (void)_registerDistributedNotificationHandler;
- (void)_registerLocalNotifications;
- (void)_removeClipCancellingPendingRemovalIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)_transferTCCPermissionsFromClipWithBundleID:(id)a3 toParentAppWithBundleID:(id)a4;
- (void)_uninstallClipWithBundleIdentifier:(id)a3 deletionPromise:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
- (void)removeClipsByUser:(id)a3 completionHandler:(id)a4;
- (void)removeFailedClipInstallsWithCompletionHandler:(id)a3;
- (void)uninstallClipsWithParentAppInstalledWithCompletionHandler:(id)a3;
@end

@implementation CPSClipCleanupManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __38__CPSClipCleanupManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(CPSClipCleanupManager);

  return MEMORY[0x270F9A758]();
}

- (CPSClipCleanupManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)CPSClipCleanupManager;
  v2 = [(CPSClipCleanupManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ClipServices.CPSClipCleanupManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingTerminationAssertionsByBundleIDs = v2->_pendingTerminationAssertionsByBundleIDs;
    v2->_pendingTerminationAssertionsByBundleIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clipDeletionPromisesByBundleIDs = v2->_clipDeletionPromisesByBundleIDs;
    v2->_clipDeletionPromisesByBundleIDs = v8;

    [(CPSClipCleanupManager *)v2 _registerLocalNotifications];
    [(CPSClipCleanupManager *)v2 _registerDistributedNotificationHandler];
    v10 = [MEMORY[0x263F01880] defaultWorkspace];
    [v10 addObserver:v2];

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  dispatch_queue_t v4 = [(NSMutableDictionary *)self->_pendingTerminationAssertionsByBundleIDs allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v9 removeObserver:self];
        [v9 invalidate];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(NSMutableDictionary *)self->_clipDeletionPromisesByBundleIDs allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        v16 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 18);
        [v15 finishWithError:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  v17.receiver = self;
  v17.super_class = (Class)CPSClipCleanupManager;
  [(CPSClipCleanupManager *)&v17 dealloc];
}

- (void)removeClipsByUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v17 = v6;
    _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: user deleting clips (%{private}@)", buf, 0xCu);
  }
  v9 = +[CPSWebClipStore sharedStore];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke;
  v12[3] = &unk_26424E628;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 removeWebClipsWithApplicationBundleIdentifiers:v11 completionHandler:v12];
}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if ([v11 count])
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_cold_1();
    }
  }
  dispatch_queue_t v4 = dispatch_group_create();
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy_;
  long long v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        v9 = *(void **)(a1 + 40);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_8;
        v13[3] = &unk_26424E600;
        id v15 = &v20;
        v14 = v4;
        [v9 _removeClipCancellingPendingRemovalIfNeeded:v8 completionHandler:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v5);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v21[5]);
  }
  _Block_object_dispose(&v20, 8);
}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x263EFF980] array];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v3 addObject:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_removeClipCancellingPendingRemovalIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    [v2 removeObserver:*(void *)(a1 + 32)];
    [v3 invalidate];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)v4;
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    if (!v4)
    {
      uint64_t v5 = +[CPSPromise promise];
      id v6 = *(void **)(a1 + 48);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke_2;
    v9[3] = &unk_26424E650;
    id v10 = v6;
    [v5 addCompletionBlock:v9];
  }
  [*(id *)(a1 + 32) _uninstallClipWithBundleIdentifier:*(void *)(a1 + 40) deletionPromise:v5];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;
  }
}

uint64_t __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFailedClipInstallsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  dispatch_group_t v6 = dispatch_group_create();
  uint64_t v7 = +[CPSWebClipStore sharedStore];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke;
  v11[3] = &unk_26424E6C8;
  dispatch_group_t v12 = v6;
  id v13 = v5;
  v14 = self;
  id v15 = v4;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  [v7 fetchAppClipsWithCompletionHandler:v11];
}

void __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v26;
    *(void *)&long long v5 = 138477827;
    long long v18 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isApplicationInstalled", v18) & 1) == 0)
        {
          id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v30 = v9;
            _os_log_impl(&dword_21559C000, v10, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found WebClip with failed app clip install: %{private}@", buf, 0xCu);
          }
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          id v11 = +[CPSWebClipStore sharedStore];
          dispatch_group_t v12 = [v9 identifier];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_15;
          v23[3] = &unk_26424E6A0;
          v23[4] = v9;
          id v24 = *(id *)(a1 + 32);
          [v11 removeWebClipWithIdentifier:v12 completionHandler:v23];

          id v13 = [v9 applicationBundleIdentifier];

          if (v13)
          {
            v14 = *(void **)(a1 + 40);
            id v15 = [v9 applicationBundleIdentifier];
            [v14 addObject:v15];
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
  long long v16 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_16;
  block[3] = &unk_26424E678;
  int8x16_t v19 = *(int8x16_t *)(a1 + 40);
  id v17 = (id)v19.i64[0];
  int8x16_t v21 = vextq_s8(v19, v19, 8uLL);
  id v22 = *(id *)(a1 + 56);
  dispatch_group_notify(v16, MEMORY[0x263EF83A0], block);
}

void __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 identifier];
    id v8 = objc_msgSend(v3, "cps_privacyPreservingDescription");
    int v9 = 138478083;
    id v10 = v7;
    __int16 v11 = 2114;
    dispatch_group_t v12 = v8;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Removed WebClip with failed AppClip install: %{private}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v1 = [*(id *)(a1 + 32) _allAppClipsForPlaceholderOnly:1];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v7 = [v6 bundleIdentifier];
        if (v7
          && [v6 isPlaceholder]
          && !+[CPSUtilities isBundleIdentifierBeingInstalled:v7])
        {
          id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int buf = 138477827;
            v31 = v7;
            _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found abandoned app clip placeholder: %{private}@", (uint8_t *)&buf, 0xCu);
          }
          [*(id *)(a1 + 40) addObject:v7];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v3);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        char v20 = 0;
        id v15 = +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:v14 isPlaceholder:&v20];
        if (v15) {
          BOOL v16 = v20 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          id v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int buf = 138477827;
            v31 = v14;
            _os_log_impl(&dword_21559C000, v17, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Removing AppClip that failed install: %{private}@", (uint8_t *)&buf, 0xCu);
          }
          +[CPSUtilities uninstallAppWithBundleIdentifier:v14 completion:0];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uninstallClipsWithParentAppInstalledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CPSClipCleanupManager_uninstallClipsWithParentAppInstalledWithCompletionHandler___block_invoke;
  v7[3] = &unk_26424E6F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __83__CPSClipCleanupManager_uninstallClipsWithParentAppInstalledWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v26 = [MEMORY[0x263EFF980] array];
  uint64_t v27 = a1;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) _allAppClipsForPlaceholderOnly:0];
  uint64_t v24 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v37;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v2;
        uint64_t v3 = *(void **)(*((void *)&v36 + 1) + 8 * v2);
        id v4 = +[CPSClipCleanupManager _parentBundleIDsFromAppRecord:v3];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v45 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v33 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
              if (v10)
              {
                char v11 = [*(id *)(v27 + 32) _shouldDeleteClipWithRecord:v3 parentRecord:v10];
                uint64_t v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
                BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
                if (v11)
                {
                  if (v13)
                  {
                    v14 = v12;
                    id v15 = [v3 bundleIdentifier];
                    *(_DWORD *)int buf = 138478083;
                    v42 = v15;
                    __int16 v43 = 2113;
                    uint64_t v44 = v9;
                    _os_log_impl(&dword_21559C000, v14, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found clip (%{private}@) with installed parent app %{private}@ to delete", buf, 0x16u);
                  }
                  BOOL v16 = [v3 bundleIdentifier];
                  [v26 addObject:v16];
                }
                else if (v13)
                {
                  *(_WORD *)int buf = 0;
                  _os_log_impl(&dword_21559C000, v12, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found installed parent app but clip should not be deleted", buf, 2u);
                }
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v45 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v24);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v26;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(v27 + 32) _deleteClipWhenBackgrounded:*(void *)(*((void *)&v28 + 1) + 8 * j) completionHandler:0];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v19);
  }

  (*(void (**)(void))(*(void *)(v27 + 40) + 16))();
}

- (void)_registerDistributedNotificationHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke;
  v4[3] = &unk_26424E718;
  objc_copyWeak(&v5, &location);
  uint64_t v3 = (void *)MEMORY[0x2166BE5C0](v4);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)self->_queue, v3);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_queue, v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2166BE7B0]();
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (const char *)*MEMORY[0x263EF86C8];
      id v8 = v6;
      int v33 = 136315138;
      string = xpc_dictionary_get_string(v3, v7);
      _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Received distributed notification via XPC event: %s", (uint8_t *)&v33, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained || MEMORY[0x2166BE7B0](v3) != v5) {
      goto LABEL_17;
    }
    uint64_t v10 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86C8]);
    if (!v10)
    {
      id v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_17;
    }
    char v11 = [NSString stringWithUTF8String:v10];
    uint64_t v12 = xpc_dictionary_get_value(v3, "UserInfo");
    BOOL v13 = (void *)v12;
    if (v12 && MEMORY[0x2166BE7B0](v12) == v5)
    {
      v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      if (!v14)
      {
        uint64_t v25 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
        }
        goto LABEL_14;
      }
    }
    id v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412546;
      string = v11;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      _os_log_impl(&dword_21559C000, v15, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Post notification with name: %@, userInfo: %@", (uint8_t *)&v33, 0x16u);
    }
    BOOL v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 postNotificationName:v11 object:0 userInfo:0];

LABEL_14:
LABEL_17:
  }
}

- (void)_registerLocalNotifications
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getMCEffectiveSettingsChangedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSClipCleanupManager.m", 29, @"%s", dlerror());

  __break(1u);
}

- (void)_didReceiveApplicationRegisteredNotification:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__CPSClipCleanupManager__didReceiveApplicationRegisteredNotification___block_invoke;
  v3[3] = &unk_26424E740;
  v3[4] = self;
  [(CPSClipCleanupManager *)self _didReceiveApplicationChangedNotification:a3 operationHandler:v3];
}

uint64_t __70__CPSClipCleanupManager__didReceiveApplicationRegisteredNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNewInstalledAppWithBundleID:a2];
}

- (void)_didReceiveApplicationUnregisteredNotification:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__CPSClipCleanupManager__didReceiveApplicationUnregisteredNotification___block_invoke;
  v3[3] = &unk_26424E740;
  v3[4] = self;
  [(CPSClipCleanupManager *)self _didReceiveApplicationChangedNotification:a3 operationHandler:v3];
}

uint64_t __72__CPSClipCleanupManager__didReceiveApplicationUnregisteredNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNewUninstalledAppWithBundleID:a2];
}

- (void)_didReceiveApplicationChangedNotification:(id)a3 operationHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 userInfo];
  if ((objc_msgSend(v7, "safari_BOOLForKey:", @"isPlaceholder") & 1) == 0)
  {
    id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Received app registered (non-placeholder) notification", buf, 2u);
    }
    uint64_t v9 = objc_msgSend(v7, "safari_arrayForKey:", @"bundleIDs");
    uint64_t v10 = [v9 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      queue = self->_queue;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __84__CPSClipCleanupManager__didReceiveApplicationChangedNotification_operationHandler___block_invoke;
      v21[3] = &unk_26424E6F0;
      id v22 = v9;
      id v23 = v6;
      dispatch_async(queue, v21);
    }
    else
    {
      BOOL v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CPSClipCleanupManager _didReceiveApplicationChangedNotification:operationHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

void __84__CPSClipCleanupManager__didReceiveApplicationChangedNotification_operationHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_allAppClipsForPlaceholderOnly:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 64;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [MEMORY[0x263F01878] enumeratorWithOptions:v3];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_45];
  [v4 setPredicate:v5];

  return v4;
}

uint64_t __56__CPSClipCleanupManager__allAppClipsForPlaceholderOnly___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 appClipMetadata];

  if (v3)
  {
    uint64_t v4 = [v2 bundleIdentifier];
    uint64_t v3 = [v4 length] != 0;
  }
  return v3;
}

- (void)_didReceiveMCSettingsChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v1 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21559C000, v1, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Received MobileConfiguration settings change notificaion.", (uint8_t *)&buf, 2u);
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2050000000;
  id v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v36 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    long long v39 = __getMCProfileConnectionClass_block_invoke;
    v40 = &unk_26424E580;
    v41 = &v33;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&buf);
    id v2 = (void *)v34[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v33, 8);
  uint64_t v24 = [v3 sharedConnection];
  int v4 = [v24 isAppClipsAllowed];
  uint64_t v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"YES";
    if (v4) {
      uint64_t v6 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: appClipsRestricted: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  long long v7 = (void *)getMCFeatureMaximumAppsRatingSymbolLoc_ptr;
  uint64_t v36 = getMCFeatureMaximumAppsRatingSymbolLoc_ptr;
  if (!getMCFeatureMaximumAppsRatingSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    long long v39 = __getMCFeatureMaximumAppsRatingSymbolLoc_block_invoke;
    v40 = &unk_26424E580;
    v41 = &v33;
    long long v8 = (void *)ManagedConfigurationLibrary();
    long long v9 = dlsym(v8, "MCFeatureMaximumAppsRating");
    *(void *)(v41[1] + 24) = v9;
    getMCFeatureMaximumAppsRatingSymbolLoc_ptr = *(void *)(v41[1] + 24);
    long long v7 = (void *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v7) {
    __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_cold_1();
  }
  long long v10 = [v24 effectiveValueForSetting:*v7];
  id v22 = v10;
  if (v10) {
    unint64_t v11 = (int)objc_msgSend(v10, "intValue", v10);
  }
  else {
    unint64_t v11 = 0x7FFFFFFFLL;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allAppClipsForPlaceholderOnly:", 0, v22);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = [v15 iTunesMetadata];
        unint64_t v17 = [v16 ratingRank];

        if ((v4 ^ 1 | (v17 > v11)) == 1)
        {
          BOOL v18 = v17 > v11;
          uint64_t v19 = *(void **)(a1 + 32);
          uint64_t v20 = [v15 bundleIdentifier];
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_52;
          v27[3] = &unk_26424E788;
          v27[4] = v15;
          BOOL v28 = v18;
          [v19 _deleteClipWhenBackgrounded:v20 completionHandler:v27];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v12);
  }

  uint64_t v21 = +[CPSSessionManager sharedManager];
  [v21 handleManagedConfigurationChanged];
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v7) {
        goto LABEL_10;
      }
      long long v8 = *(void **)(a1 + 32);
      long long v9 = v6;
      long long v10 = [v8 bundleIdentifier];
      int v13 = 138477827;
      uint64_t v14 = v10;
      unint64_t v11 = "CPSClipCleanupManager: Deleted an app clip due to age restriction: %{private}@";
    }
    else
    {
      if (!v7) {
        goto LABEL_10;
      }
      uint64_t v12 = *(void **)(a1 + 32);
      long long v9 = v6;
      long long v10 = [v12 bundleIdentifier];
      int v13 = 138477827;
      uint64_t v14 = v10;
      unint64_t v11 = "CPSClipCleanupManager: Deleted an app clip due to content restriction: %{private}@";
    }
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_10;
  }
  int v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_52_cold_1(a1, v4, (uint64_t)v3);
  }
LABEL_10:
}

- (void)applicationsDidInstall:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__CPSClipCleanupManager_applicationsDidInstall___block_invoke;
  v3[3] = &unk_26424E740;
  v3[4] = self;
  [(CPSClipCleanupManager *)self _applicationsDidChange:a3 operationHandler:v3];
}

uint64_t __48__CPSClipCleanupManager_applicationsDidInstall___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNewInstalledAppWithBundleID:a2];
}

- (void)applicationsDidUninstall:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__CPSClipCleanupManager_applicationsDidUninstall___block_invoke;
  v3[3] = &unk_26424E740;
  v3[4] = self;
  [(CPSClipCleanupManager *)self _applicationsDidChange:a3 operationHandler:v3];
}

uint64_t __50__CPSClipCleanupManager_applicationsDidUninstall___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNewUninstalledAppWithBundleID:a2];
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke;
  v7[3] = &unk_26424E7D8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v3;
    _os_log_impl(&dword_21559C000, v2, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Assertion target process did exit %@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) invalidate];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 16) allKeysForObject:*(void *)(a1 + 32)];
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v11 = *(id **)(a1 + 40);
          uint64_t v12 = objc_msgSend(v11[3], "objectForKeyedSubscript:", v10, (void)v16);
          [v11 _uninstallClipWithBundleIdentifier:v10 deletionPromise:v12];

          [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:v10];
          [*(id *)(*(void *)(a1 + 40) + 24) setObject:0 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    if (![*(id *)(*(void *)(a1 + 40) + 24) count])
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(v13 + 32);
      *(void *)(v13 + 32) = 0;
    }
  }
  else
  {
    uint64_t v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke_cold_1();
    }
  }
}

- (void)_applicationsDidChange:(id)a3 operationHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke_2;
    v10[3] = &unk_26424E6F0;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    dispatch_async(queue, v10);
  }
}

uint64_t __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

void __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)_parentBundleIDsFromAppRecord:(id)a3
{
  uint64_t v3 = [a3 appClipMetadata];
  uint64_t v4 = [v3 parentApplicationIdentifiers];

  uint64_t v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_59);

  return v5;
}

id __55__CPSClipCleanupManager__parentBundleIDsFromAppRecord___block_invoke()
{
  CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();

  return 0;
}

- (BOOL)_shouldDeleteClipWithRecord:(id)a3 parentRecord:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [&unk_26C632B70 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(&unk_26C632B70);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v5 iTunesMetadata];
        uint64_t v13 = [v12 sourceApp];
        if ([v13 isEqualToString:v11])
        {
          uint64_t v14 = [v6 iTunesMetadata];
          uint64_t v15 = [v14 sourceApp];
          char v16 = [v15 isEqualToString:v11];

          if (v16)
          {
            BOOL v17 = 0;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [&unk_26C632B70 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (void)_handleNewInstalledAppWithBundleID:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v38 = (void *)os_transaction_create();
  id v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v53 = (uint64_t)v4;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Detected installation of new app (%{private}@)", buf, 0xCu);
  }
  uint64_t v7 = [v5 appClipMetadata];

  if (v7)
  {
    uint64_t v8 = +[CPSWebClipStore sharedStore];
    uint64_t v9 = [v5 localizedName];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke;
    v49[3] = &unk_26424E840;
    id v50 = v4;
    [v8 updateWebClipTitle:v9 forAppClipBundleIdentifier:v50 completionHandler:v49];
  }
  long long v10 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_69];
  [v10 setPredicate:v11];

  uint64_t v35 = [MEMORY[0x263EFF980] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    uint64_t v33 = 134217984;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        BOOL v17 = objc_msgSend(v16, "bundleIdentifier", v33);
        if ([v17 hasPrefix:v4])
        {
          long long v18 = +[CPSClipCleanupManager _parentBundleIDsFromAppRecord:v16];
          if ([v18 containsObject:v4])
          {
            BOOL v19 = [(CPSClipCleanupManager *)self _shouldDeleteClipWithRecord:v16 parentRecord:v5];
            long long v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v21)
              {
                *(_DWORD *)long long buf = 138478083;
                uint64_t v53 = (uint64_t)v17;
                __int16 v54 = 2113;
                id v55 = v4;
                _os_log_impl(&dword_21559C000, v20, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found clip (%{private}@) matching %{private}@ to delete", buf, 0x16u);
              }
              [v35 addObject:v17];
            }
            else if (v21)
            {
              *(_DWORD *)long long buf = 138478083;
              uint64_t v53 = (uint64_t)v17;
              __int16 v54 = 2113;
              id v55 = v4;
              _os_log_impl(&dword_21559C000, v20, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Clip (%{private}@) matching %{private}@ should not be deleted", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = v23;
              uint64_t v25 = [v18 count];
              *(_DWORD *)long long buf = v33;
              uint64_t v53 = v25;
              _os_log_impl(&dword_21559C000, v24, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Found no match for parent bundle IDs (count: %lu) from clip", buf, 0xCu);
            }
          }
        }
        else
        {
          long long v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138478083;
            uint64_t v53 = (uint64_t)v17;
            __int16 v54 = 2117;
            id v55 = v4;
            _os_log_impl(&dword_21559C000, v22, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Clip bundleID (%{private}@) prefix does not match %{sensitive}@", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v13);
  }
  long long v34 = v5;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v36 = v35;
  uint64_t v26 = [v36 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v36);
        }
        uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        long long v31 = +[CPSAnalyticsLogger sharedLogger];
        [v31 didUpgradeToFullAppFromClip:v30];

        long long v32 = +[CPSWebClipStore sharedStore];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_71;
        v39[3] = &unk_26424E868;
        id v40 = v38;
        [v32 redirectPoweredByWebClipsWithApplicationBundleIdentifier:v30 toParentApplicationBundleIdentifier:v4 completionHandler:v39];

        [(CPSClipCleanupManager *)self _transferTCCPermissionsFromClipWithBundleID:v30 toParentAppWithBundleID:v4];
        [(CPSClipCleanupManager *)self _deleteClipWhenBackgrounded:v30 completionHandler:0];
      }
      uint64_t v27 = [v36 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v27);
  }
}

void __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_cold_1(a1, v4, v3);
    }
  }
}

BOOL __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_67(uint64_t a1, void *a2)
{
  id v2 = [a2 appClipMetadata];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_transferTCCPermissionsFromClipWithBundleID:(id)a3 toParentAppWithBundleID:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = *MEMORY[0x263F7C598];
  v28[0] = *MEMORY[0x263F7C510];
  v28[1] = v8;
  v28[2] = *MEMORY[0x263F7C500];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  long long v10 = [v7 setWithArray:v9];

  long long v22 = v5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = (id)TCCAccessCopyInformationForBundleId();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    uint64_t v15 = (void *)MEMORY[0x263F7C4E8];
    char v16 = (void *)MEMORY[0x263F7C4D8];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v19 = [v18 objectForKeyedSubscript:*v15];
        if (v19 && [v10 containsObject:v19])
        {
          long long v20 = [v18 objectForKeyedSubscript:*v16];
          BOOL v21 = v20;
          if (v20)
          {
            [v20 BOOLValue];
            TCCAccessSetForBundleId();
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  if ([MEMORY[0x263F00A60] authorizationStatusForBundleIdentifier:v22] == 2) {
    [MEMORY[0x263F00A60] setAuthorizationStatusByType:2 forBundleIdentifier:v6];
  }
}

- (void)_handleNewUninstalledAppWithBundleID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)os_transaction_create();
  id v6 = +[CPSWebClipStore sharedStore];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke;
  v19[3] = &unk_26424E890;
  id v7 = v4;
  id v20 = v7;
  id v8 = v5;
  id v21 = v8;
  [v6 removeWebClipsWithApplicationBundleIdentifier:v7 completionHandler:v19];

  id v9 = objc_alloc_init(MEMORY[0x263F2BD30]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_77;
  char v16 = &unk_26424E8B8;
  id v17 = v7;
  id v18 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 clearCachesForLinkItemsAssociatedWithBundleID:v11 completion:&v13];
  uint64_t v12 = +[CPSClipDataSQLiteStore defaultStore];
  [v12 removeRecordWithBundleID:v11];
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    BOOL v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_cold_1();
    }
  }
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_77_cold_1();
    }
  }
}

- (void)_deleteClipWhenBackgrounded:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    id v23 = v6;
    _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: will delete clip when backgrounded: %{private}@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = [(NSMutableDictionary *)self->_clipDeletionPromisesByBundleIDs objectForKeyedSubscript:v6];
  id v10 = (void *)v9;
  if (!v9)
  {
    id v10 = +[CPSPromise promise];
  }
  if (v7)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__CPSClipCleanupManager__deleteClipWhenBackgrounded_completionHandler___block_invoke;
    v20[3] = &unk_26424E650;
    id v21 = v7;
    [v10 addCompletionBlock:v20];
  }
  if (!v9)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F64638]);
    [v11 setExplanation:@"Terminate clip before uninstallation"];
    [v11 setMaximumTerminationResistance:30];
    uint64_t v12 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:v6];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F64648]) initWithPredicate:v12 context:v11];
    [v13 addObserver:self];
    id v19 = 0;
    char v14 = [v13 acquireWithError:&v19];
    id v15 = v19;
    if (v14)
    {
      [(NSMutableDictionary *)self->_pendingTerminationAssertionsByBundleIDs setObject:v13 forKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_clipDeletionPromisesByBundleIDs setObject:v10 forKeyedSubscript:v6];
      if (!self->_deletionTransaction)
      {
        char v16 = (OS_os_transaction *)os_transaction_create();
        deletionTransaction = self->_deletionTransaction;
        self->_deletionTransaction = v16;
      }
    }
    else
    {
      id v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CPSClipCleanupManager _deleteClipWhenBackgrounded:completionHandler:]((uint64_t)v6);
      }
      [(CPSClipCleanupManager *)self _uninstallClipWithBundleIdentifier:v6 deletionPromise:v10];
      [v13 removeObserver:self];
      [v13 invalidate];
    }
  }
}

uint64_t __71__CPSClipCleanupManager__deleteClipWhenBackgrounded_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_uninstallClipWithBundleIdentifier:(id)a3 deletionPromise:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke;
  v9[3] = &unk_26424E6A0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[CPSUtilities uninstallAppWithBundleIdentifier:v8 completion:v9];
}

void __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke_cold_1(a1, v5, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: successfully deleted clip %{private}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionTransaction, 0);
  objc_storeStrong((id *)&self->_clipDeletionPromisesByBundleIDs, 0);
  objc_storeStrong((id *)&self->_pendingTerminationAssertionsByBundleIDs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "CPSClipCleanupManager: failed to delete web clips before their backing app clips %{private}@ are uninstalled: %{private}@");
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_didReceiveApplicationChangedNotification:(uint64_t)a3 operationHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"NSString *getMCFeatureMaximumAppsRating(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSClipCleanupManager.m", 30, @"%s", dlerror());

  __break(1u);
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_52_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  int v7 = [v5 bundleIdentifier];
  int v8 = *(unsigned __int8 *)(a1 + 40);
  int v10 = 138478339;
  id v11 = v7;
  if (v8) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a3;
  _os_log_error_impl(&dword_21559C000, v6, OS_LOG_TYPE_ERROR, "CPSClipCleanupManager: Error ocurred when deleting %{private}@, ageRestricted: %@, error: %@", (uint8_t *)&v10, 0x20u);
}

void __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21559C000, v0, OS_LOG_TYPE_ERROR, "CPSClipCleanupManager: Clip not found for assertion %@", v1, 0xCu);
}

void __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21559C000, v6, v7, "CPSClipCleanupManager: Failed to update web clip title for %{private}@ due to %{public}@", v8, v9, v10, v11, v12);
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "CPSClipCleanupManager: failed to delete web clips %{private}@ when its backing app clip is uninstalled: %{sensitive}@");
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_77_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "CPSClipCleanupManager: failed to delete ABR cached items for bundleID %{private}@, Error: %@");
}

- (void)_deleteClipWhenBackgrounded:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v1, v2, "CPSClipCleanupManager: Unable to acquire termination assertion for bundle ID %@ with error %@", (void)v3, DWORD2(v3));
}

void __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21559C000, v6, v7, "CPSClipCleanupManager: failed to delete clip %{private}@: %{public}@", v8, v9, v10, v11, v12);
}

@end