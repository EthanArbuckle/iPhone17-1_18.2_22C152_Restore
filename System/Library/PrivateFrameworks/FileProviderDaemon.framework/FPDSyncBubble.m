@interface FPDSyncBubble
- (FPDSyncBubble)initWithExtensionManager:(id)a3;
- (void)createSyncBubbleTasksIfNecessary;
- (void)retryLaterWithError:(id)a3;
- (void)start;
- (void)startupFinished;
- (void)uploadContent;
- (void)willSwitchUser;
@end

@implementation FPDSyncBubble

- (FPDSyncBubble)initWithExtensionManager:(id)a3
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FPDSyncBubble;
  v7 = [(FPDSyncBubble *)&v20 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_extensionManager, a3);
    dispatch_group_t v9 = dispatch_group_create();
    startupGroup = v8->_startupGroup;
    v8->_startupGroup = (OS_dispatch_group *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("sync bubble task queue", v11);
    syncQueue = v8->_syncQueue;
    v8->_syncQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F28F80] processInfo];
    v15 = [v14 environment];
    v16 = [v15 objectForKey:@"FILEPROVIDER_SYNC_BUBBLE"];
    int v17 = [v16 BOOLValue];

    if (v17 != [MEMORY[0x1E4F25CE0] runningInSyncBubble])
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v8, @"FPDSyncBubble.m", 39, @"UserManager thinks we're running in the sync bubble, but environment variables disagree" object file lineNumber description];
    }
  }

  return v8;
}

- (void)startupFinished
{
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  dispatch_group_enter((dispatch_group_t)self->_startupGroup);
  if ([v3 isSharedIPad])
  {
    int v4 = [MEMORY[0x1E4F25CE0] runningInSyncBubble];
    v5 = fp_current_or_default_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
        v8 = objc_msgSend(v7, "fp_shortDescription");
        *(_DWORD *)buf = 138412290;
        int v17 = v8;
        dispatch_group_t v9 = "[INFO] shared iPad: running in sync bubble, checking in. Home directory is %@";
LABEL_7:
        _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
      }
    }
    else if (v6)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
      v8 = objc_msgSend(v7, "fp_shortDescription");
      *(_DWORD *)buf = 138412290;
      int v17 = v8;
      dispatch_group_t v9 = "[INFO] shared iPad: checking in for running in sync bubble later. Home directory is %@";
      goto LABEL_7;
    }

    [v3 registerUserSyncStakeholder:self withMachServiceName:@"com.apple.FileProvider.usermanager.sync"];
    v10 = [MEMORY[0x1E4FB3728] taskWithName:@"com.apple.FileProvider.startup" reason:@"checking if there's anything to sync"];
    [v10 begin];
    startupGroup = self->_startupGroup;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__FPDSyncBubble_start__block_invoke;
    block[3] = &unk_1E6A73FE8;
    id v15 = v10;
    id v13 = v10;
    dispatch_group_notify(startupGroup, syncQueue, block);
  }
}

uint64_t __22__FPDSyncBubble_start__block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: sync bubble checkin finished", v4, 2u);
  }

  return [*(id *)(a1 + 32) end];
}

- (void)retryLaterWithError:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__FPDSyncBubble_retryLaterWithError___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  dispatch_group_t v9 = self;
  uint64_t v5 = retryLaterWithError__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&retryLaterWithError__onceToken, v7);
  }
}

void __37__FPDSyncBubble_retryLaterWithError___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37__FPDSyncBubble_retryLaterWithError___block_invoke_cold_1(a1, v2);
  }

  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) domain];
  v7 = [v4 stringWithFormat:@"encountered error domain %@ code %ld", v6, objc_msgSend(*(id *)(a1 + 32), "code")];
  [v3 unregisterStakeHolder:v5 status:1 reason:v7];
}

- (void)createSyncBubbleTasksIfNecessary
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: creating sync bubble tasks", buf, 2u);
  }

  v3 = [MEMORY[0x1E4F29268] currentConnection];
  v33 = +[FPDRequest requestForXPCConnection:v3];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  id obj = [(FPDExtensionManager *)self->_extensionManager allProviders];
  uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v42;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v4;
        uint64_t v5 = *(void **)(*((void *)&v41 + 1) + 8 * v4);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v6 = [v5 relevantDomainsByID];
        v7 = [v6 allValues];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v38 != v10) {
                objc_enumerationMutation(v7);
              }
              dispatch_queue_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              if (([v12 isUsingFPFS] & 1) == 0)
              {
                uint64_t v18 = fp_current_or_default_log();
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
                  goto LABEL_29;
                }
                v25 = [v12 providerDomainID];
                *(_DWORD *)buf = 138412290;
                v46 = v25;
                v26 = v18;
                v27 = "[INFO] shared iPad: skipping %@ (doesn't use FPFS)";
LABEL_25:
                _os_log_impl(&dword_1D744C000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);

                goto LABEL_29;
              }
              id v13 = [v12 provider];
              v14 = [v13 identifier];
              char v15 = objc_msgSend(v14, "fp_isiCloudDriveIdentifier");

              if ((v15 & 1) == 0)
              {
                uint64_t v18 = fp_current_or_default_log();
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
                  goto LABEL_29;
                }
                v25 = [v12 providerDomainID];
                *(_DWORD *)buf = 138412290;
                v46 = v25;
                v26 = v18;
                v27 = "[INFO] shared iPad: skipping %@ (not supported in sync bubble)";
                goto LABEL_25;
              }
              v16 = (void *)MEMORY[0x1E4FB3728];
              int v17 = [v12 providerDomainID];
              uint64_t v18 = [v16 taskWithName:@"com.apple.FileProvider.uploads" reason:@"syncup to server" forBundleID:v17];

              LODWORD(v17) = [MEMORY[0x1E4F25CE0] runningInSyncBubble];
              v19 = fp_current_or_default_log();
              BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
              if (v17)
              {
                if (v20)
                {
                  v21 = [v12 providerDomainID];
                  *(_DWORD *)buf = 138412290;
                  v46 = v21;
                  _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_INFO, "[INFO] shared iPad: requesting stabilization in sync bubble for domain %@", buf, 0xCu);
                }
                [v18 begin];
                v22 = fp_current_or_default_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  v23 = [v12 defaultBackend];
                  *(_DWORD *)buf = 138412546;
                  v46 = v12;
                  __int16 v47 = 2112;
                  v48 = v23;
                  _os_log_impl(&dword_1D744C000, v22, OS_LOG_TYPE_INFO, "[INFO] domain: %@, backend: %@", buf, 0x16u);
                }
                v24 = [v12 defaultBackend];
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v35[2] = __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke;
                v35[3] = &unk_1E6A73530;
                v35[4] = v12;
                v35[5] = self;
                uint64_t v18 = v18;
                v36 = v18;
                [v24 waitForStabilizationForRequest:v33 completionHandler:v35];
              }
              else
              {
                if (v20)
                {
                  v28 = [v12 providerDomainID];
                  *(_DWORD *)buf = 138412290;
                  v46 = v28;
                  _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_INFO, "[INFO] shared iPad: scheduling finalization in sync bubble for domain %@", buf, 0xCu);
                }
                [v18 begin];
              }
LABEL_29:
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v31);
  }
}

void __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }

    [*(id *)(a1 + 40) retryLaterWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] shared iPad: sync bubble stabilization finished successfully for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 48) end];
}

- (void)willSwitchUser
{
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: received notification that we're switching users", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4FB3728] taskWithName:@"com.apple.FileProvider.check" reason:@"check for upload task creation during user switch"];
  [v4 begin];
  startupGroup = self->_startupGroup;
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__FPDSyncBubble_willSwitchUser__block_invoke;
  v8[3] = &unk_1E6A736C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(startupGroup, syncQueue, v8);
}

uint64_t __31__FPDSyncBubble_willSwitchUser__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) createSyncBubbleTasksIfNecessary];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: tasks for switching users created", v4, 2u);
  }

  return [*(id *)(a1 + 40) end];
}

- (void)uploadContent
{
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: received request to sync", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4FB3728] taskWithName:@"com.apple.FileProvider.check" reason:@"check for upload task creation during upload request"];
  [v4 begin];
  startupGroup = self->_startupGroup;
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__FPDSyncBubble_uploadContent__block_invoke;
  v8[3] = &unk_1E6A736C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(startupGroup, syncQueue, v8);
}

uint64_t __30__FPDSyncBubble_uploadContent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) createSyncBubbleTasksIfNecessary];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: tasks for request to sync created", v4, 2u);
  }

  return [*(id *)(a1 + 40) end];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_startupGroup, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
}

void __37__FPDSyncBubble_retryLaterWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] shared iPad: Encountered an error forcing us to try to retry the sync bubble later - %@", (uint8_t *)&v3, 0xCu);
}

void __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] shared iPad: sync bubble stabilization finished for %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end