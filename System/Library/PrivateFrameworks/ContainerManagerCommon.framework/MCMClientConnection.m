@interface MCMClientConnection
+ (id)privilegedClientConnectionWithUserIdentity:(id)a3;
+ (id)privilegedClientConnectionWithUserIdentity:(id)a3 kernel:(BOOL)a4;
+ (id)sharedClientConnection;
- (BOOL)_containerURL:(id)a3 isValidForContainerClass:(unint64_t)a4;
- (MCMClientConnection)init;
- (MCMClientConnection)initWithContext:(id)a3;
- (MCMCommandContext)context;
- (id)_commandForResumedDeleteOperationsWithResultPromise:(id)a3;
- (id)clientBundleIdentifier;
- (void)_cleanTransientContainersWithContainerConfig:(id)a3;
- (void)_cleanTransientUserContainersWithContainerConfig:(id)a3;
- (void)_cleanupOprhanedCodeSigningMappingData;
- (void)_cleanupOrphanedDataForDirectories:(id)a3 containerClass:(unint64_t)a4 forUserIdentity:(id)a5;
- (void)_regenerateContainerPaths;
- (void)_resumeDeleteOperations;
- (void)containerManagerCleanupWithCompletion:(id)a3;
- (void)containerManagerSetup;
- (void)rebootContainerManagerCleanupWithCompletion:(id)a3;
- (void)rebootContainerManagerSetup;
@end

@implementation MCMClientConnection

- (MCMCommandContext)context
{
  return self->_context;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  v5 = +[MCMClientIdentity privilegedClientIdentityWithUserIdentity:a3 kernel:a4];
  v6 = +[MCMUserIdentitySharedCache sharedInstance];
  v7 = [MCMContainerFactory alloc];
  v8 = [(MCMContainerFactory *)v7 initWithContainerCache:gContainerCache clientIdentity:v5 userIdentityCache:v6];
  v9 = [MCMCommandContext alloc];
  uint64_t v10 = gContainerCache;
  id v11 = containermanager_copy_global_configuration();
  v12 = [(MCMCommandContext *)v9 initWithClientIdentity:v5 containerCache:v10 containerFactory:v8 userIdentityCache:v6 kernelPersonaID:0 globalConfiguration:v11];

  v13 = (void *)[objc_alloc((Class)a1) initWithContext:v12];

  return v13;
}

- (MCMClientConnection)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMClientConnection;
  v6 = [(MCMClientConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  p_context = &self->_context;

  objc_storeStrong((id *)p_context, 0);
}

- (id)_commandForResumedDeleteOperationsWithResultPromise:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [(MCMClientConnection *)self context];
  v7 = [v6 userIdentityCache];
  v8 = +[MCMDeleteManifest deleteManifestsForGlobalContainersWithUserIdentityCache:v7];
  [v5 unionSet:v8];

  objc_super v9 = [(MCMClientConnection *)self context];
  uint64_t v10 = [v9 userIdentityCache];
  id v11 = +[MCMDeleteManifest deleteManifestsForUserContainersWithUserIdentityCache:v10];
  [v5 unionSet:v11];

  if ([v5 count])
  {
    v12 = [MCMCommandOperationDelete alloc];
    v13 = [(MCMClientConnection *)self context];
    v14 = [(MCMCommandOperationDelete *)v12 initWithManifests:v5 waitForDiskSpaceReclaim:0 removeAllCodeSignInfo:0 context:v13 resultPromise:v4];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_resumeDeleteOperations
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MCMResultPromise);
  id v4 = [(MCMClientConnection *)self _commandForResumedDeleteOperationsWithResultPromise:v3];
  id v5 = v4;
  if (v4)
  {
    [v4 execute];
    v6 = [(MCMResultPromise *)v3 result];
    v7 = [v6 error];

    if (v7)
    {
      v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during resumed delete; error = %@",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }
}

- (void)_regenerateContainerPaths
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7739000, v3, OS_LOG_TYPE_DEFAULT, "Rolling system container directory UUIDs on disk", buf, 2u);
  }

  id v4 = [(MCMClientConnection *)self context];
  id v5 = [v4 classIterator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke;
  v6[3] = &unk_1E6A7F3C8;
  v6[4] = self;
  [v5 selectAutorollingWithUserIdentityIterator:v6];
}

void __48__MCMClientConnection__regenerateContainerPaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = containermanager_copy_global_configuration();
  uint64_t v8 = [v7 classPathCache];
  int v9 = [v8 containerClassPathForUserIdentity:v5 containerConfig:v6 typeClass:objc_opt_class()];

  uint64_t v10 = [MCMContainerClassCache alloc];
  uint64_t v11 = objc_opt_class();
  v12 = [*(id *)(a1 + 32) context];
  v13 = [v12 userIdentityCache];
  v14 = [(MCMContainerClassCache *)v10 initWithContainerClassPath:v9 cacheEntryClass:v11 targetQueue:0 userIdentityCache:v13];

  v15 = [MCMContainerClassCache alloc];
  uint64_t v16 = objc_opt_class();
  v17 = [*(id *)(a1 + 32) context];
  v18 = [v17 userIdentityCache];
  v19 = [(MCMContainerClassCache *)v15 initWithContainerClassPath:v9 cacheEntryClass:v16 targetQueue:0 userIdentityCache:v18];

  [(MCMContainerClassCache *)v14 waitForSynchronizationToComplete];
  v20 = [*(id *)(a1 + 32) context];
  v21 = [v20 containerCache];
  [v21 setContainerClassCache:v19];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2;
  v23[3] = &unk_1E6A7F3A0;
  v23[4] = *(void *)(a1 + 32);
  v24 = v19;
  v22 = v19;
  [(MCMContainerClassCache *)v14 enumerateCacheEntriesWithEnumerator:v23];
}

uint64_t __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = +[MCMEntitlementBypassList sharedBypassList];
  id v5 = [(MCMContainerCacheEntry *)v3 identifier];
  id v6 = [(MCMContainerCacheEntry *)v3 containerPath];
  id v7 = [v6 containerClassPath];
  char v8 = objc_msgSend(v4, "containerIdIsWellknown:class:", v5, objc_msgSend(v7, "containerClass"));

  int v9 = v3;
  if ((v8 & 1) == 0)
  {
    id v34 = 0;
    uint64_t v10 = [(MCMContainerCacheEntry *)v3 metadataWithError:&v34];
    id v11 = v34;
    if (v10)
    {
      v12 = [MCMCommandRegenerateDirectoryUUID alloc];
      v13 = [v10 containerIdentity];
      v14 = [*(id *)(a1 + 32) context];
      v15 = [(MCMCommandRegenerateDirectoryUUID *)v12 initWithConcreteContainerIdentity:v13 context:v14 resultPromise:0];

      id v33 = v11;
      uint64_t v16 = [v15 regenerateDirectoryUUIDNoCacheUpdateWithMetadata:v10 error:&v33];
      id v17 = v33;

      if (v16)
      {
        v18 = [MCMContainerCacheEntry alloc];
        v19 = [*(id *)(a1 + 32) context];
        v20 = [v19 userIdentityCache];
        int v9 = [(MCMContainerCacheEntry *)v18 initWithMetadata:v16 userIdentityCache:v20];
      }
      else
      {
        v19 = container_log_handle_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v29 = [(MCMContainerCacheEntry *)v3 identifier];
          v30 = [(MCMContainerCacheEntry *)v3 containerPath];
          v31 = [v30 containerClassPath];
          uint64_t v32 = [v31 containerClass];
          *(_DWORD *)buf = 138412802;
          v36 = v29;
          __int16 v37 = 2048;
          uint64_t v38 = v32;
          __int16 v39 = 2112;
          id v40 = v17;
          _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to regenerate directory UUID for identifier: %@, class: %llu, error = %@", buf, 0x20u);
        }
        int v9 = v3;
      }
    }
    else
    {
      v15 = container_log_handle_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [(MCMContainerCacheEntry *)v3 identifier];
        v26 = [(MCMContainerCacheEntry *)v3 containerPath];
        v27 = [v26 containerClassPath];
        uint64_t v28 = [v27 containerClass];
        *(_DWORD *)buf = 138412802;
        v36 = v25;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Failed to regenerate directory UUID (couldn't read metadata) for identifier: %@, class: %llu; error = %@",
          buf,
          0x20u);
      }
      id v17 = v11;
      int v9 = v3;
    }
  }
  v21 = *(void **)(a1 + 40);
  v22 = [(MCMContainerCacheEntry *)v9 identifier];
  id v23 = (id)[v21 setCacheEntry:v9 forIdentifier:v22];

  return 1;
}

- (void)rebootContainerManagerCleanupWithCompletion:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  id v44 = (id)os_transaction_create();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy_;
  v41[4] = __Block_byref_object_dispose_;
  id v42 = 0;
  id v5 = containermanager_copy_global_configuration();
  BOOL v6 = [v5 dispositionForContainerClass:1] == 1;

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/installd/Library/Caches/com.apple.containermanagerd" isDirectory:1];
    char v8 = +[MCMFileManager defaultManager];
    int v9 = [v8 itemExistsAtURL:v7];

    if (v9)
    {
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v7;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Sentencing legacy transient bundle directory [%@] to final deletion", buf, 0xCu);
      }

      id v11 = [(MCMClientConnection *)self context];
      v12 = [v11 containerFactory];
      id v40 = 0;
      char v13 = [v12 deleteURL:v7 forUserIdentity:0 error:&v40];
      id v14 = v40;

      if ((v13 & 1) == 0)
      {
        v15 = container_log_handle_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v7;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Failed to delete legacy shared transient bundle URL %@ : %@", buf, 0x16u);
        }
      }
    }
  }
  id v16 = containermanager_copy_global_configuration();
  id v17 = [v16 classIterator];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke;
  v39[3] = &unk_1E6A7FB80;
  v39[4] = self;
  [v17 selectWithIterator:v39];

  id v18 = containermanager_copy_global_configuration();
  LODWORD(v17) = [v18 dispositionForContainerClass:2] == 1;

  if (v17)
  {
    v19 = [(MCMClientConnection *)self context];
    v20 = [v19 userIdentityCache];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2;
    v38[3] = &unk_1E6A7F350;
    v38[4] = self;
    v38[5] = v41;
    [v20 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v38];
  }
  v21 = [(MCMClientConnection *)self context];
  v22 = [v21 userIdentityCache];
  id v23 = [v22 defaultUserIdentity];

  v24 = [(MCMClientConnection *)self context];
  uint64_t v25 = [v24 classIterator];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_31;
  v34[3] = &unk_1E6A7F328;
  id v26 = v23;
  v36 = self;
  __int16 v37 = v41;
  id v35 = v26;
  [v25 selectGlobalWithIterator:v34];

  v27 = MCMSharedBackgroundQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_33;
  block[3] = &unk_1E6A80730;
  block[4] = self;
  dispatch_async(v27, block);

  uint64_t v28 = MCMSharedBackgroundQueue();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_34;
  v30[3] = &unk_1E6A7F378;
  id v31 = v4;
  uint64_t v32 = v43;
  id v29 = v4;
  dispatch_async(v28, v30);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 cleanTransientsEachBoot]) {
    [*(id *)(a1 + 32) _cleanTransientContainersWithContainerConfig:v3];
  }
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 homeDirectoryExists])
  {
    id v4 = [*(id *)(a1 + 32) context];
    id v5 = [v4 classIterator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3;
    v7[3] = &unk_1E6A7F328;
    char v8 = v3;
    long long v9 = *(_OWORD *)(a1 + 32);
    [v5 selectUserWithIterator:v7];

    BOOL v6 = v8;
  }
  else
  {
    BOOL v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_debug_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEBUG, "Skipping orphan cleanup of data containers since home directory doesn't exist for %@", buf, 0xCu);
    }
  }
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_31(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = containermanager_copy_global_configuration();
  id v5 = [v4 classPathCache];
  BOOL v6 = [v5 containerClassPathForUserIdentity:a1[4] containerConfig:v3 typeClass:objc_opt_class()];

  id v7 = +[MCMFileManager defaultManager];
  char v8 = [v6 classURL];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v7 urlsForItemsInDirectoryAtURL:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    [v6 setExists:1];
    id v11 = MCMSharedBackgroundQueue();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_32;
    v16[3] = &unk_1E6A80270;
    v16[4] = a1[5];
    id v17 = v10;
    id v18 = v3;
    dispatch_async(v11, v16);
  }
  else
  {
    uint64_t v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v13 = [*(id *)(*(void *)(a1[6] + 8) + 40) code];

      if (v13 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v15;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to get items : %@", buf, 0xCu);
    }
  }
LABEL_10:
}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_33(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);

  return [v1 _cleanupOprhanedCodeSigningMappingData];
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_32(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) containerClass];

  return [v1 _cleanupOrphanedDataForDirectories:v2 containerClass:v3 forUserIdentity:0];
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = containermanager_copy_global_configuration();
  id v5 = [v4 classPathCache];
  BOOL v6 = [v5 containerClassPathForUserIdentity:*(void *)(a1 + 32) containerConfig:v3 typeClass:objc_opt_class()];

  id v7 = +[MCMFileManager defaultManager];
  char v8 = [v6 classURL];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v7 urlsForItemsInDirectoryAtURL:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    [v6 setExists:1];
    id v11 = MCMSharedBackgroundQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4;
    block[3] = &unk_1E6A7FB30;
    block[4] = *(void *)(a1 + 40);
    id v19 = v10;
    id v20 = v3;
    id v21 = *(id *)(a1 + 32);
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code];

      if (v13 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [v3 containerClass];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Skipping orphan cleanup of data containers for %@, %llu; error = %@",
        buf,
        0x20u);
    }
  }
LABEL_10:
}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) containerClass];
  uint64_t v5 = *(void *)(a1 + 56);

  return [v2 _cleanupOrphanedDataForDirectories:v3 containerClass:v4 forUserIdentity:v5];
}

- (void)_cleanTransientContainersWithContainerConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 usesGlobalBundleUserIdentity] & 1) != 0
    || [v4 usesGlobalSystemUserIdentity])
  {
    uint64_t v5 = +[MCMContainerClassTransientPath transientGlobalURL];
    if ([v4 usesGlobalBundleUserIdentity])
    {
      uint64_t v6 = +[MCMContainerClassTransientPath transientGlobalBundleURL];

      uint64_t v5 = (void *)v6;
    }
    if (v5)
    {
      id v7 = [(MCMClientConnection *)self context];
      char v8 = [v7 containerFactory];
      id v12 = 0;
      char v9 = [v8 deleteURL:v5 forUserIdentity:0 error:&v12];
      id v10 = v12;

      if ((v9 & 1) == 0)
      {
        id v11 = container_log_handle_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v14 = v5;
          __int16 v15 = 2112;
          id v16 = v10;
          _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to delete shared transient bundle URL %@ : %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    [(MCMClientConnection *)self _cleanTransientUserContainersWithContainerConfig:v4];
  }
}

- (void)_cleanTransientUserContainersWithContainerConfig:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MCMClientConnection *)self context];
  uint64_t v6 = [v5 userIdentityCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke;
  v8[3] = &unk_1E6A7F928;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v8];
}

void __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if ([v3 homeDirectoryExists])
  {
    id v4 = +[MCMContainerClassTransientPath transientURLWithUserIdentity:withContainerClass:](MCMContainerClassTransientPath, "transientURLWithUserIdentity:withContainerClass:", v3, [*(id *)(a1 + 32) containerClass]);
    uint64_t v5 = [*(id *)(a1 + 40) context];
    uint64_t v6 = [v5 containerFactory];
    id v10 = 0;
    char v7 = [v6 deleteURL:v4 forUserIdentity:v3 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to delete per-user transient URL %@ : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_debug_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEBUG, "Skipping cleanup of transient data containers since home directory doesn't exist for %@", buf, 0xCu);
    }
  }
}

- (void)rebootContainerManagerSetup
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if ([v3 isBuildUpgrade])
  {
    [(MCMClientConnection *)self _regenerateContainerPaths];
    id v4 = +[MCMContainerMigrator sharedInstance];
    uint64_t v5 = [(MCMClientConnection *)self context];
    id v19 = 0;
    char v6 = [v4 performSynchronousBuildUpgradeMigration:v3 context:v5 error:&v19];
    id v7 = v19;

    if ((v6 & 1) == 0)
    {
      id v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v21 = v7;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to perform build upgrade migration : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }
    }
    [v3 writeCurrentBuildInfoToDisk];
  }
  int v18 = 0;
  id v17 = 0;
  char v9 = [(id)gCodeSigningMapping removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:&v18 error:&v17];
  id v10 = v17;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint32_t multiuser_flags = 138412290;
      id v21 = v10;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to remove invalid plugin codesign entries; error = %@",
        (uint8_t *)&multiuser_flags,
        0xCu);
    }
  }
  id v12 = containermanager_copy_global_configuration();
  int v13 = [v12 dispositionForContainerClass:7];

  if (v13 == 1)
  {
    if (v18 > 0
      || (multiuser_flags = 0, host_t v14 = MEMORY[0x1D9478CB0](), !host_get_multiuser_config_flags(v14, &multiuser_flags))
      && (multiuser_flags & 0x80000000) != 0)
    {
      uint64_t v15 = +[MCMGroupManager defaultManager];
      id v16 = [(MCMClientConnection *)self context];
      [v15 reconcileGroupContainersForContainerClass:7 context:v16];
    }
  }
}

- (void)_cleanupOprhanedCodeSigningMappingData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = 0;
  char v2 = [(id)gCodeSigningMapping removeAllAdvanceCopiesWithError:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {
    id v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "Could not remove advance copies of code sign data: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_containerURL:(id)a3 isValidForContainerClass:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v7 = [v5 lastPathComponent];
  uint64_t v8 = (void *)[v6 initWithUUIDString:v7];

  if (a4 == 12)
  {
    char v9 = +[MCMEntitlementBypassList sharedBypassList];
    id v10 = [v5 lastPathComponent];
    char v11 = [v9 systemContainerIdIsWellknown:v10];
  }
  else
  {
    if (a4 != 13)
    {
LABEL_7:
      BOOL v13 = v8 != 0;
      goto LABEL_8;
    }
    char v9 = +[MCMEntitlementBypassList sharedBypassList];
    id v10 = [v5 lastPathComponent];
    char v11 = [v9 systemGroupContainerIdIsWellknown:v10];
  }
  char v12 = v11;

  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (void)_cleanupOrphanedDataForDirectories:(id)a3 containerClass:(unint64_t)a4 forUserIdentity:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = a5;
  id obj = v8;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v50;
    p_info = MCMContainerSchemaActionMkdir.info;
    *(void *)&long long v10 = 138412546;
    long long v40 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        BOOL v16 = -[MCMClientConnection _containerURL:isValidForContainerClass:](self, "_containerURL:isValidForContainerClass:", v15, a4, v40);
        id v17 = [p_info + 66 defaultManager];
        int v18 = [v17 itemExistsAtURL:v15];

        if (v18)
        {
          if (v16)
          {
            id v19 = [v15 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];
            id v20 = [p_info + 66 defaultManager];
            int v21 = [v20 itemDoesNotExistAtURL:v19];

            if (!v21) {
              goto LABEL_32;
            }
            if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
            {
              uint64_t v22 = [v15 lastPathComponent];
              id v23 = +[MCMEntitlementBypassList sharedBypassList];
              uint64_t v24 = v23;
              char v25 = a4 == 13
                  ? [v23 systemGroupContainerIdIsWellknown:v22]
                  : [v23 systemContainerIdIsWellknown:v22];
              char v27 = v25;

              if (v27)
              {
LABEL_28:
                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
                goto LABEL_32;
              }
            }
            uint64_t v28 = container_log_handle_for_category();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              __int16 v39 = [v15 path];
              *(_DWORD *)buf = 138412290;
              v45 = v39;
              _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Deleting orphaned data missing a metadata file at: %@", buf, 0xCu);
            }
          }
          id v29 = containermanager_copy_global_configuration();
          int v30 = [v29 isInternalImage];

          if (v30)
          {
            id v31 = container_log_handle_for_category();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "***INTERNAL BUILD REQUEST: If you see this, file a Radar in \"MobileContainerManager | all\" with the following data:", buf, 2u);
            }

            uint64_t v32 = container_log_handle_for_category();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "\tSomeone is writing invalid data to a container, which has now been orphaned. Here are the invalid files:", buf, 2u);
            }

            id v33 = +[MCMFileManager defaultManager];
            [v33 printDirectoryStructureAtURL:v15];

            id v34 = container_log_handle_for_category();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "***END INTERNAL BUILD REQUEST", buf, 2u);
            }
          }
          id v35 = [(MCMClientConnection *)self context];
          v36 = [v35 containerFactory];
          id v43 = 0;
          char v37 = [v36 deleteURL:v15 forUserIdentity:v41 error:&v43];
          id v19 = v43;

          if (v37) {
            goto LABEL_28;
          }
          uint64_t v26 = container_log_handle_for_category();
          p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v38 = [v15 path];
            *(_DWORD *)buf = v40;
            v45 = v38;
            __int16 v46 = 2112;
            __int16 v47 = v19;
            _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Failed to delete [%@]; error = %@",
              buf,
              0x16u);

            p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
          }
        }
        else
        {
          id v19 = container_log_handle_for_category();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          uint64_t v26 = [v15 path];
          *(_DWORD *)buf = 138412290;
          v45 = v26;
          _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring deleted container path during cleanup: [%@]", buf, 0xCu);
        }

LABEL_32:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v48 count:16];
    }
    while (v11);
  }
}

- (void)containerManagerCleanupWithCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = 0;
  id v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  char v37 = __Block_byref_object_copy_;
  uint64_t v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  [(MCMClientConnection *)self _resumeDeleteOperations];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke;
  v33[3] = &unk_1E6A7F2B0;
  v33[4] = self;
  id v5 = (void *)MEMORY[0x1D9479020](v33);
  id v6 = containermanager_copy_global_configuration();
  BOOL v7 = [v6 dispositionForContainerClass:1] == 1;

  if (v7)
  {
    id v8 = +[MCMContainerClassStagingPath stagingGlobalURL];
    uint64_t v9 = +[MCMFileManager defaultManager];
    long long v10 = v35;
    id obj = v35[5];
    uint64_t v11 = [v9 urlsForItemsInDirectoryAtURL:v8 error:&obj];
    objc_storeStrong(v10 + 5, obj);

    if (v11)
    {
      uint64_t v12 = MCMSharedBackgroundQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10;
      block[3] = &unk_1E6A801D0;
      id v31 = v5;
      id v30 = v11;
      dispatch_async(v12, block);

      BOOL v13 = v31;
    }
    else
    {
      host_t v14 = [v35[5] domain];
      if ([v14 isEqualToString:*MEMORY[0x1E4F28798]])
      {
        BOOL v15 = [v35[5] code] == 2;

        if (v15) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      BOOL v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [v8 path];
        id v23 = v35[5];
        *(_DWORD *)buf = 138412546;
        id v41 = v22;
        __int16 v42 = 2112;
        id v43 = v23;
        _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to get items at global staging URL: %@ : %@", buf, 0x16u);
      }
    }

LABEL_11:
  }
  id v16 = containermanager_copy_global_configuration();
  BOOL v17 = [v16 dispositionForContainerClass:2] == 1;

  if (v17)
  {
    int v18 = [(MCMClientConnection *)self context];
    id v19 = [v18 userIdentityCache];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2;
    v26[3] = &unk_1E6A7F2D8;
    uint64_t v28 = &v34;
    id v27 = v5;
    [v19 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v26];
  }
  id v20 = MCMSharedBackgroundQueue();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13;
  v24[3] = &unk_1E6A801D0;
  v24[4] = self;
  id v25 = v4;
  id v21 = v4;
  dispatch_async(v20, v24);

  _Block_object_dispose(&v34, 8);
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v28;
    *(void *)&long long v8 = 138412546;
    long long v19 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        BOOL v13 = objc_msgSend(*(id *)(a1 + 32), "context", v19);
        host_t v14 = [v13 containerFactory];
        id v21 = 0;
        char v15 = [v14 deleteURL:v12 forUserIdentity:v6 error:&v21];
        id v16 = v21;

        if ((v15 & 1) == 0)
        {
          BOOL v17 = container_log_handle_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v18 = [v12 path];
            *(_DWORD *)buf = v19;
            id v23 = v18;
            __int16 v24 = 2112;
            id v25 = v16;
            _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Failed to delete [%@]; error = %@",
              buf,
              0x16u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v9);
  }
}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v1();
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MCMContainerClassStagingPath stagingURLWithUserIdentity:v3];
  id v5 = +[MCMFileManager defaultManager];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 urlsForItemsInDirectoryAtURL:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    long long v8 = MCMSharedBackgroundQueue();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11;
    v14[3] = &unk_1E6A803C0;
    BOOL v17 = *(id *)(a1 + 32);
    id v15 = v7;
    id v16 = v3;
    dispatch_async(v8, v14);

    uint64_t v9 = v17;
  }
  else
  {
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code];

      if (v11 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v4 path];
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to get items at per-user staging URL: %@ : %@", buf, 0x16u);
    }
  }

LABEL_10:
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = [MCMResultPromise alloc];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3;
  uint64_t v10 = &unk_1E6A7F300;
  id v11 = *(id *)(a1 + 40);
  id v3 = [(MCMResultPromise *)v2 initWithCompletion:&v7];
  id v4 = [MCMCommandOperationReclaimDiskSpace alloc];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "context", v7, v8, v9, v10);
  uint64_t v6 = [(MCMCommandOperationReclaimDiskSpace *)v4 initWithAsynchronously:1 context:v5 resultPromise:v3];

  [(MCMCommandOperationReclaimDiskSpace *)v6 execute];
}

id __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }

  return v3;
}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v1();
}

- (void)containerManagerSetup
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v3 = containermanager_copy_global_configuration();
  int v4 = [v3 dispositionForContainerClass:12];

  if (v4 == 1)
  {
    id v5 = [(MCMClientConnection *)self context];
    id v6 = containermanager_copy_global_configuration();
    int v7 = [v6 systemContainerMode];

    if (!v7)
    {
LABEL_60:

      goto LABEL_61;
    }
    uint64_t v8 = +[MCMFileManager defaultManager];
    id v9 = containermanager_copy_global_configuration();
    int v10 = [v9 systemContainerMode];

    if (v10 == 1)
    {
      id v11 = +[MCMUserIdentitySharedCache sharedInstance];
      uint64_t v12 = [v11 globalSystemUserIdentity];
    }
    else
    {
      if (v10 != 2)
      {
LABEL_59:

        goto LABEL_60;
      }
      id v11 = +[MCMUserIdentitySharedCache sharedInstance];
      uint64_t v12 = [v11 userIdentityForCurrentContext];
    }
    uint64_t v13 = (void *)v12;

    host_t v14 = +[MCMContainerClassBackupPath systemContainerBackupBaseDirectoryWithUserIdentity:v13];
    id v15 = +[MCMContainerClassBackupPath systemContainerBackupDirectoryWithUserIdentity:v13];
    id v16 = +[MCMContainerClassBackupPath systemGroupContainerBackupDirectoryWithUserIdentity:v13];
    v60 = v16;
    v61 = v15;
    if ([v8 itemDoesNotExistAtURL:v14])
    {
      BOOL v17 = container_log_handle_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEFAULT, "There are no system/system group containers staged for restore, skipping.", buf, 2u);
      }
      v62 = 0;
      v63 = 0;
      int v18 = 0;
      id v19 = 0;
LABEL_11:

LABEL_54:
      id v65 = v19;
      char v42 = [v8 removeItemAtURL:v14 error:&v65];
      id v43 = v65;

      if ((v42 & 1) == 0)
      {
        uint64_t v44 = container_log_handle_for_category();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v58 = [v14 path];
          *(_DWORD *)v70 = 138412546;
          v71 = v58;
          __int16 v72 = 2112;
          id v73 = v43;
          _os_log_error_impl(&dword_1D7739000, v44, OS_LOG_TYPE_ERROR, "Failed to remove system container base dir %@: %@", v70, 0x16u);
        }
      }

      goto LABEL_59;
    }
    if ([v8 itemExistsAtURL:v15])
    {
      [v15 URLByAppendingPathExtension:@"inprogress"];
      v63 = v69[1] = 0;
      char v20 = objc_msgSend(v8, "removeItemAtURL:error:");
      id v21 = 0;
      if ((v20 & 1) == 0)
      {
        uint64_t v22 = v16;
        uint64_t v23 = container_log_handle_for_category();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v83 = v21;
          _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to remove existing inprogress system containers: %@", buf, 0xCu);
        }

        id v16 = v22;
      }
      v69[0] = v21;
      char v24 = [v8 moveItemAtURL:v15 toURL:v63 error:v69];
      id v19 = v69[0];

      if (v24)
      {
        int v25 = 1;
        goto LABEL_24;
      }
      uint64_t v26 = container_log_handle_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v19;
        _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Failed to move system containers to inprogress: %@", buf, 0xCu);
      }
    }
    else
    {
      v63 = 0;
      id v19 = 0;
    }
    int v25 = 0;
LABEL_24:
    if ([v8 itemExistsAtURL:v16])
    {
      [v16 URLByAppendingPathExtension:@"inprogress"];
      v62 = v68[1] = v19;
      char v27 = objc_msgSend(v8, "removeItemAtURL:error:");
      id v28 = v19;

      if ((v27 & 1) == 0)
      {
        long long v29 = v16;
        long long v30 = container_log_handle_for_category();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v83 = v28;
          _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to remove existing inprogress system containers: %@", buf, 0xCu);
        }

        id v16 = v29;
      }
      v68[0] = v28;
      char v31 = [v8 moveItemAtURL:v16 toURL:v62 error:v68];
      id v19 = v68[0];

      if (v31)
      {
        if (!v25)
        {
          int v18 = 0;
          id v35 = v19;
LABEL_69:
          long long v52 = container_log_handle_for_category();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v74 = 0;
            _os_log_impl(&dword_1D7739000, v52, OS_LOG_TYPE_DEFAULT, "Installing system group containers", v74, 2u);
          }

          id v66 = v35;
          uint64_t v53 = [v8 urlsForItemsInDirectoryAtURL:v62 error:&v66];
          id v19 = v66;

          if (v53)
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            BOOL v17 = v53;
            uint64_t v54 = [v17 countByEnumeratingWithState:&v78 objects:v74 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v79;
              do
              {
                for (uint64_t i = 0; i != v55; ++i)
                {
                  if (*(void *)v79 != v56) {
                    objc_enumerationMutation(v17);
                  }
                  _moveSystemContainerIntoPlace(*(void **)(*((void *)&v78 + 1) + 8 * i), 13, v5, v13);
                }
                uint64_t v55 = [v17 countByEnumeratingWithState:&v78 objects:v74 count:16];
              }
              while (v55);
              int v18 = v17;
            }
            else
            {
              int v18 = v17;
            }
          }
          else
          {
            BOOL v17 = container_log_handle_for_category();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v74 = 138412546;
              v75 = v62;
              __int16 v76 = 2112;
              id v77 = v19;
              _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Couldn't find any system shared containers at %@: %@", v74, 0x16u);
            }
            int v18 = 0;
          }
          goto LABEL_11;
        }
        int v32 = 1;
LABEL_34:
        id v33 = container_log_handle_for_category();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D7739000, v33, OS_LOG_TYPE_DEFAULT, "Installing system containers", buf, 2u);
        }

        id v67 = v19;
        uint64_t v34 = [v8 urlsForItemsInDirectoryAtURL:v63 error:&v67];
        id v35 = v67;

        if (v34)
        {
          char v59 = v32;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          int v18 = v34;
          uint64_t v36 = [v18 countByEnumeratingWithState:&v86 objects:buf count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v87;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v87 != v38) {
                  objc_enumerationMutation(v18);
                }
                _moveSystemContainerIntoPlace(*(void **)(*((void *)&v86 + 1) + 8 * j), 12, v5, v13);
              }
              uint64_t v37 = [v18 countByEnumeratingWithState:&v86 objects:buf count:16];
            }
            while (v37);
          }

          if (v59) {
            goto LABEL_69;
          }
        }
        else
        {
          id v41 = container_log_handle_for_category();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v83 = v63;
            __int16 v84 = 2112;
            id v85 = v35;
            _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Couldn't find any system containers at %@: %@", buf, 0x16u);
          }

          int v18 = 0;
          if (v32) {
            goto LABEL_69;
          }
        }
        id v19 = v35;
        goto LABEL_54;
      }
      long long v40 = container_log_handle_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v19;
        _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Failed to move shared system containers to inprogress: %@", buf, 0xCu);
      }

      if ((v25 & 1) == 0)
      {
LABEL_49:
        int v18 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      v62 = 0;
      if ((v25 & 1) == 0) {
        goto LABEL_49;
      }
    }
    int v32 = 0;
    goto LABEL_34;
  }
LABEL_61:
  v45 = [(MCMClientConnection *)self context];
  id v64 = 0;
  BOOL v46 = +[MCMCommandReplaceContainer recoverFromReplaceOperationsWithContext:v45 error:&v64];
  id v47 = v64;

  if (!v46)
  {
    id v48 = container_log_handle_for_category();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v83 = v47;
      _os_log_error_impl(&dword_1D7739000, v48, OS_LOG_TYPE_ERROR, "Failed recovering from replace operations: %@", buf, 0xCu);
    }
  }
  id v49 = containermanager_copy_global_configuration();
  int v50 = [v49 runmode];

  if (v50)
  {
    long long v51 = +[MCMDataProtectionManager defaultManager];
    [v51 restartPendingDataProtectionOperations];
  }
}

- (id)clientBundleIdentifier
{
  char v2 = [(MCMClientConnection *)self context];
  id v3 = [v2 clientIdentity];
  int v4 = [v3 codeSignInfo];
  id v5 = [v4 identifier];

  return v5;
}

- (MCMClientConnection)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MCMClientConnection;
  char v2 = [(MCMClientConnection *)&v14 init];
  if (v2)
  {
    id v3 = +[MCMUserIdentitySharedCache sharedInstance];
    int v4 = [v3 defaultUserIdentity];
    id v5 = +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:v4];
    id v6 = [MCMContainerFactory alloc];
    int v7 = [(MCMContainerFactory *)v6 initWithContainerCache:gContainerCache clientIdentity:v5 userIdentityCache:v3];
    uint64_t v8 = [MCMCommandContext alloc];
    uint64_t v9 = gContainerCache;
    id v10 = containermanager_copy_global_configuration();
    uint64_t v11 = [(MCMCommandContext *)v8 initWithClientIdentity:v5 containerCache:v9 containerFactory:v7 userIdentityCache:v3 kernelPersonaID:0 globalConfiguration:v10];
    context = v2->_context;
    v2->_context = (MCMCommandContext *)v11;
  }
  return v2;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3
{
  return (id)[a1 privilegedClientConnectionWithUserIdentity:a3 kernel:0];
}

+ (id)sharedClientConnection
{
  if (sharedClientConnection_onceToken != -1) {
    dispatch_once(&sharedClientConnection_onceToken, &__block_literal_global_922);
  }
  char v2 = (void *)sharedClientConnection_sharedConnection;

  return v2;
}

uint64_t __45__MCMClientConnection_sharedClientConnection__block_invoke()
{
  sharedClientConnection_sharedConnection = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end