@interface MCMDataProtectionManager
+ (id)defaultManager;
- (MCMDataProtectionManager)init;
- (OS_dispatch_queue)protectionOperationFileQueue;
- (int)desiredDataProtectionClassForMetadata:(id)a3 clientIdentity:(id)a4;
- (int)intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 info:(id)a6;
- (void)_startDataProtectionChangeOperation:(id)a3 withCompletion:(id)a4;
- (void)restartPendingDataProtectionOperations;
- (void)setDataProtectionOnDataContainerForMetadata:(id)a3 isSecondOrThirdPartyApp:(BOOL)a4 retryIfLocked:(BOOL)a5 deferUntilNextLaunch:(BOOL)a6 withCompletion:(id)a7;
@end

@implementation MCMDataProtectionManager

- (void).cxx_destruct
{
  p_protectionOperationFileQueue = &self->_protectionOperationFileQueue;

  objc_storeStrong((id *)p_protectionOperationFileQueue, 0);
}

- (OS_dispatch_queue)protectionOperationFileQueue
{
  return self->_protectionOperationFileQueue;
}

- (int)desiredDataProtectionClassForMetadata:(id)a3 clientIdentity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 containerPath];
  v8 = [v7 containerClassPath];
  int v9 = [v8 supportsDataProtection];

  if (v9)
  {
    v10 = +[MCMDataProtectionManager defaultManager];
    v11 = [v5 identifier];
    uint64_t v12 = [v5 containerClass];
    v13 = [v5 info];
    int v14 = [v10 intendedDataProtectionClassBasedOnEntitlementsForIdentifier:v11 clientIdentity:v6 containerClass:v12 info:v13];
  }
  else
  {
    int v14 = -1;
  }

  return v14;
}

- (int)intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 info:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = 0;
  if (a5 <= 0xB && ((1 << a5) & 0xE54) != 0)
  {
    v13 = [v10 codeSignInfo];
    int v14 = [v13 identifier];
    int v15 = [v9 isEqualToString:v14];

    if (v15)
    {
      v16 = [v10 codeSignInfo];
      id v17 = [v16 entitlements];
    }
    else
    {
      if (v11 && ([v10 isKernel] & 1) == 0)
      {
        v18 = [v11 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];
        objc_opt_class();
        id v19 = v18;
        id v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;

        if (v17)
        {
          int v20 = [v17 intValue];
LABEL_15:
          int v12 = v20;

          goto LABEL_16;
        }
      }
      uint64_t v21 = [(id)gCodeSigningMapping entitlementsForIdentifier:v9];
      if (!v21)
      {
        int v12 = 0;
        goto LABEL_16;
      }
      id v17 = (id)v21;
    }
    int v20 = [v17 intendedDataProtectionClass];
    goto LABEL_15;
  }
LABEL_16:

  return v12;
}

- (void)setDataProtectionOnDataContainerForMetadata:(id)a3 isSecondOrThirdPartyApp:(BOOL)a4 retryIfLocked:(BOOL)a5 deferUntilNextLaunch:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v43 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  int v12 = (void (**)(id, uint64_t))a7;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 1;
  uint64_t v13 = [v11 dataProtectionClass];
  unint64_t v14 = [v11 containerClass];
  if (v14 > 0xB || ((1 << v14) & 0xED4) == 0 || (uint64_t v15 = [v11 containerClass], v15 == 13) || v15 == 7)
  {
    v49[3] = 11;
    v16 = container_log_handle_for_category();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      id v17 = 0;
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v11;
    v27 = "Can't act on an invalid object: %@";
    goto LABEL_21;
  }
  v18 = [v11 containerPath];
  id v19 = [v18 containerClassPath];
  char v20 = [v19 supportsDataProtection];

  if ((v20 & 1) == 0)
  {
    v49[3] = 72;
    v16 = container_log_handle_for_category();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v26 = [v11 containerClass];
    *(_DWORD *)buf = 134217984;
    *(void *)v53 = v26;
    v27 = "Data protection not supported for containers of class [%llu]";
LABEL_21:
    v28 = v16;
    uint32_t v29 = 12;
LABEL_22:
    _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_6;
  }
  uint64_t v21 = [v11 info];

  if (v21)
  {
    v22 = [v11 info];
    v23 = [v22 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];
    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    if (v25) {
      uint64_t v21 = [v25 intValue];
    }
    else {
      uint64_t v21 = 0;
    }
  }
  v30 = [NSNumber numberWithInt:v21];
  v31 = [NSNumber numberWithInt:v13];
  int64_t v32 = +[MCMFileHandle compareDataProtectionClassTarget:v30 withExisting:v31];

  if (v32 == 3)
  {
    v33 = [(MCMDataProtectionManager *)self protectionOperationFileQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke;
    block[3] = &unk_1E6A80180;
    v46 = v11;
    v47 = &v48;
    dispatch_sync(v33, block);

    if (v12 && v49[3] == 1) {
      v12[2](v12, 1);
    }
    id v17 = 0;
    v16 = v46;
  }
  else
  {
    if (!v32)
    {
      v49[3] = 72;
      v16 = container_log_handle_for_category();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v53 = v21;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v13;
      v27 = "Unable to determine precedence of data protection; desired = %d, original = %d";
      v28 = v16;
      uint32_t v29 = 14;
      goto LABEL_22;
    }
    if (v21 == 2)
    {
      v49[3] = 38;
      v16 = container_log_handle_for_category();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = 2;
      v27 = "Data protection class %d is not allowed";
      goto LABEL_36;
    }
    if (v9 && (v21 > 7 || ((1 << v21) & 0x8B) == 0))
    {
      v49[3] = 38;
      v16 = container_log_handle_for_category();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = v21;
      v27 = "Data protection class %d is invalid for 2nd and 3rd party apps";
LABEL_36:
      v28 = v16;
      uint32_t v29 = 8;
      goto LABEL_22;
    }
    int v34 = v21;
    v35 = [(MCMDataProtectionManager *)self protectionOperationFileQueue];
    if (v32 == 1) {
      uint64_t v36 = 7;
    }
    else {
      uint64_t v36 = 1;
    }
    id v17 = +[MCMDataProtectionChangeOperation dataProtectionChangeOperationWithContainerMetadata:v11 settingClass:v21 retryingIfLocked:v8 changeType:v36 queue:v35];

    id v44 = 0;
    char v37 = [v17 writeToDiskWithError:&v44];
    v38 = v44;
    v16 = v38;
    if (v37)
    {
      if (!v43)
      {
        [(MCMDataProtectionManager *)self _startDataProtectionChangeOperation:v17 withCompletion:v12];
        goto LABEL_7;
      }
      v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [v11 identifier];
        uint64_t v41 = [v11 containerClass];
        *(_DWORD *)buf = 138413058;
        *(void *)v53 = v40;
        *(_WORD *)&v53[8] = 2048;
        uint64_t v54 = v41;
        __int16 v55 = 1024;
        int v56 = v13;
        __int16 v57 = 1024;
        int v58 = v34;
        _os_log_impl(&dword_1D7739000, v39, OS_LOG_TYPE_DEFAULT, "Wrote DP class update operation for [%@(%llu)] %d → %d, deferred until next daemon launch.", buf, 0x22u);
      }
    }
    else
    {
      uint64_t v42 = [v38 type];
      v49[3] = v42;
      v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v53 = v16;
        _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Failed to write data protection update file to disk: %@", buf, 0xCu);
      }
    }
  }
LABEL_7:

  if (v12 && v49[3] != 1) {
    ((void (*)(void (**)(id, uint64_t)))v12[2])(v12);
  }

  _Block_object_dispose(&v48, 8);
}

void __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) containerIdentity];
  id v6 = 0;
  BOOL v3 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:v2 error:&v6];
  id v4 = v6;

  if (!v3)
  {
    id v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "Failed to delete existing data protection update file: %@", buf, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 type];
  }
}

- (void)restartPendingDataProtectionOperations
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = containermanager_copy_global_configuration();
  id v4 = [v3 managedPathRegistry];
  id v5 = [v4 containermanagerPendingUpdates];

  id v6 = [v5 url];
  if (v6)
  {
    v7 = +[MCMFileManager defaultManager];
    id v45 = 0;
    id v8 = [v7 urlsForItemsInDirectoryAtURL:v6 error:&v45];
    id v9 = v45;

    if (v8)
    {
      id v35 = v9;
      uint64_t v36 = v6;
      char v37 = v5;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v10 = v8;
      uint64_t v41 = [v10 countByEnumeratingWithState:&v51 objects:v50 count:16];
      if (v41)
      {
        uint64_t v11 = *(void *)v52;
        uint64_t v38 = *(void *)v52;
        v39 = self;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v10);
            }
            uint64_t v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
            unint64_t v14 = container_log_handle_for_category();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v13 path];
              *(_DWORD *)buf = 138412290;
              *(void *)v47 = v15;
              _os_log_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEFAULT, "Found pending data protection operation at %@", buf, 0xCu);
            }
            v16 = [(MCMDataProtectionManager *)self protectionOperationFileQueue];
            id v44 = 0;
            id v17 = +[MCMDataProtectionChangeOperation dataProtectionChangeOperationAtURL:v13 queue:v16 error:&v44];
            id v18 = v44;

            if (v17)
            {
              id v19 = container_log_handle_for_category();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                int v20 = [v17 newDataProtectionClass];
                v40 = [v17 dataContainerMetadata];
                uint64_t v21 = [v40 userIdentity];
                v22 = [v17 dataContainerMetadata];
                v23 = [v22 identifier];
                [v17 dataContainerMetadata];
                id v24 = v18;
                v26 = id v25 = v10;
                uint64_t v27 = [v26 containerClass];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v47 = v20;
                *(_WORD *)&v47[4] = 2112;
                *(void *)&v47[6] = v21;
                *(_WORD *)&v47[14] = 2112;
                *(void *)&v47[16] = v23;
                __int16 v48 = 2048;
                uint64_t v49 = v27;
                _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "Starting pending data protection update to protection class %d for user: %@, ID: %@, containerClass: %llu", buf, 0x26u);

                id v10 = v25;
                id v18 = v24;

                self = v39;
                uint64_t v11 = v38;
              }
              v28 = MCMDataProtectionQueue();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke;
              block[3] = &unk_1E6A805F0;
              void block[4] = self;
              id v43 = v17;
              dispatch_async(v28, block);
            }
            else
            {
              uint32_t v29 = container_log_handle_for_category();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v30 = [v13 path];
                *(_DWORD *)buf = 138412546;
                *(void *)v47 = v30;
                *(_WORD *)&v47[8] = 2112;
                *(void *)&v47[10] = v18;
                _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to read data protection change operation at %@ : %@", buf, 0x16u);
              }
            }

            ++v12;
          }
          while (v41 != v12);
          uint64_t v41 = [v10 countByEnumeratingWithState:&v51 objects:v50 count:16];
        }
        while (v41);
      }

      id v6 = v36;
      id v5 = v37;
      id v9 = v35;
    }
    else
    {
      v31 = [v9 domain];
      if ([v31 isEqualToString:*MEMORY[0x1E4F28798]])
      {
        uint64_t v32 = [v9 code];

        if (v32 == 2) {
          goto LABEL_30;
        }
      }
      else
      {
      }
      id v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v33 = [v5 url];
        int v34 = [v33 path];
        *(_DWORD *)buf = 138412546;
        *(void *)v47 = v34;
        *(_WORD *)&v47[8] = 2112;
        *(void *)&v47[10] = v9;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Failed to get items at pendingUpdates URL %@ : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    id v9 = 0;
  }

LABEL_30:
}

uint64_t __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _startDataProtectionChangeOperation:v3 withCompletion:0];
}

- (void)_startDataProtectionChangeOperation:(id)a3 withCompletion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8533;
  v31 = __Block_byref_object_dispose__8534;
  id v32 = 0;
  v7 = [v5 dataContainerMetadata];
  objc_initWeak(&location, v7);

  LODWORD(v7) = [v5 newDataProtectionClass];
  char v8 = [v5 retryIfLocked];
  id v9 = [MCMApplicationTerminationAssertion alloc];
  id v10 = objc_loadWeakRetained(&location);
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [(MCMApplicationTerminationAssertion *)v9 initWithBundleIdentifier:v11 reason:@"preventing app launch during container data protection class change"];
  uint64_t v13 = (void *)v28[5];
  v28[5] = v12;

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke;
  v24[3] = &unk_1E6A80130;
  v24[4] = &v27;
  objc_copyWeak(&v25, &location);
  [v5 setRetryStartBlock:v24];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2;
  id v18 = &unk_1E6A80158;
  objc_copyWeak(&v21, &location);
  int v22 = (int)v7;
  char v23 = v8;
  int v20 = &v27;
  id v14 = v6;
  id v19 = v14;
  [v5 setCompletionBlock:&v15];
  objc_msgSend(v5, "performChangeOperation", v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);
}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2) {
    [v2 invalidate];
  }
  uint64_t v3 = [MCMApplicationTerminationAssertion alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained identifier];
  uint64_t v5 = [(MCMApplicationTerminationAssertion *)v3 initWithBundleIdentifier:v4 reason:@"preventing app launch during container data protection class change"];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    uint64_t v5 = [v3 type];
    uint64_t v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [WeakRetained identifier];
      uint64_t v12 = [WeakRetained containerPath];
      uint64_t v13 = [v12 containerDataURL];
      id v14 = [v13 path];
      int v15 = *(_DWORD *)(a1 + 56);
      int v16 = 138413058;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 1024;
      int v21 = v15;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Failed to set data protection on container with identifier %@ at %@ to %d: %@", (uint8_t *)&v16, 0x26u);
    }
    if (v5 == 61)
    {
      if (*(unsigned char *)(a1 + 60))
      {
        v7 = container_log_handle_for_category();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Unexpectedly got completion block called while locked", (uint8_t *)&v16, 2u);
        }
      }
      uint64_t v5 = 61;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v5);
  }
}

- (MCMDataProtectionManager)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MCMDataProtectionManager;
  v2 = [(MCMDataProtectionManager *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileContainerManager.ProtectionOperationFileQueue", v3);
    protectionOperationFileQueue = v2->_protectionOperationFileQueue;
    v2->_protectionOperationFileQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)defaultManager
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MCMDataProtectionManager_defaultManager__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, v4);
  }
  v2 = (void *)defaultManager_defaultManager;

  return v2;
}

uint64_t __42__MCMDataProtectionManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

@end