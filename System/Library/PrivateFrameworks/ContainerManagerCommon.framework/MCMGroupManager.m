@interface MCMGroupManager
+ (id)defaultManager;
- (MCMGroupManager)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (id)groupContainerIdentifiersForOwnerIdentifier:(id)a3 groupContainerClass:(unint64_t)a4 codeSignInfo:(id)a5 withError:(id *)a6;
- (void)_cleanupUnreferencedGroupContainersForUserIdentity:(id)a3 containerClass:(unint64_t)a4 referenceCounts:(id)a5 context:(id)a6;
- (void)reconcileGroupContainersForContainerClass:(unint64_t)a3 context:(id)a4;
@end

@implementation MCMGroupManager

- (id)groupContainerIdentifiersForOwnerIdentifier:(id)a3 groupContainerClass:(unint64_t)a4 codeSignInfo:(id)a5 withError:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = [v10 identifier];
  char v12 = [v9 isEqualToString:v11];

  objc_opt_class();
  id v13 = v9;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v14)
  {
    if (v10) {
      char v15 = v12;
    }
    else {
      char v15 = 0;
    }
    if (v15)
    {
      v16 = [v10 entitlements];
      v17 = v16;
      if (a4 == 13) {
        [v16 systemGroupIdentifiers];
      }
      else {
      v20 = [v16 appGroupIdentifiers];
      }
    }
    else
    {
      if (a4 == 13) {
        [(id)gCodeSigningMapping systemGroupIdentifiersForIdentifier:v13];
      }
      else {
      v20 = [(id)gCodeSigningMapping appGroupIdentifiersForIdentifier:v13];
      }
    }
    if (!v20)
    {
      id v21 = [MEMORY[0x1E4F1CAD0] set];
LABEL_26:
      v19 = 0;
      goto LABEL_33;
    }
    objc_opt_class();
    id v21 = v20;
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }

    if (v22) {
      goto LABEL_26;
    }
    v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412546;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v21;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Wrong group id obj type for ID: %@ : %@", (uint8_t *)&v25, 0x16u);
    }

    v19 = [[MCMError alloc] initWithErrorType:11 category:3];
  }
  else
  {
    v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      id v26 = v13;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Can't act on an invalid object: ID: %@", (uint8_t *)&v25, 0xCu);
    }

    v19 = [[MCMError alloc] initWithErrorType:11 category:3];
  }
  id v21 = 0;
  if (a6 && v19)
  {
    v19 = v19;
    id v21 = 0;
    *a6 = v19;
  }
LABEL_33:

  return v21;
}

+ (id)defaultManager
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__MCMGroupManager_defaultManager__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  if (defaultManager_onceToken_8651 != -1) {
    dispatch_once(&defaultManager_onceToken_8651, v4);
  }
  v2 = (void *)defaultManager_sharedInstance;

  return v2;
}

- (void).cxx_destruct
{
  p_userIdentityCache = &self->_userIdentityCache;

  objc_storeStrong((id *)p_userIdentityCache, 0);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)_cleanupUnreferencedGroupContainersForUserIdentity:(id)a3 containerClass:(unint64_t)a4 referenceCounts:(id)a5 context:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v42 = objc_opt_new();
  char v12 = [v11 containerCache];
  v41 = v9;
  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  id v43 = 0;
  id v14 = [v12 entriesForUserIdentities:v13 contentClass:a4 transient:0 error:&v43];
  id v15 = v43;

  if (v14)
  {
    id v39 = v15;
    id v40 = v11;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v38 = v14;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v50 count:16];
    v18 = v42;
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v52;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = [*(id *)(*((void *)&v51 + 1) + 8 * v21) metadataMinimal];
          v23 = [v22 identifier];
          uint64_t v24 = [v10 countForObject:v23];
          if (v24)
          {
            uint64_t v25 = v24;
            id v26 = container_log_handle_for_category();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v23;
              __int16 v46 = 2048;
              uint64_t v47 = v25;
              _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %lu", buf, 0x16u);
            }
          }
          else
          {
            __int16 v27 = [v22 containerIdentity];
            [v18 addObject:v27];

            id v26 = container_log_handle_for_category();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v28 = [v41 shortDescription];
              uint64_t v29 = [v22 containerPath];
              *(_DWORD *)buf = 138412802;
              v45 = v23;
              __int16 v46 = 2112;
              uint64_t v47 = (uint64_t)v28;
              __int16 v48 = 2112;
              v49 = v29;
              _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Removing group container [%@] for %@ at %@", buf, 0x20u);

              v18 = v42;
            }
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v16 countByEnumeratingWithState:&v51 objects:v50 count:16];
      }
      while (v19);
    }

    v30 = v18;
    v31 = objc_alloc_init(MCMResultPromise);
    if ([v30 count])
    {
      v32 = [v30 allObjects];
      id v11 = v40;
      v33 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v32 removeAllCodeSignInfo:0 context:v40 resultPromise:v31];

      [v33 execute];
      v34 = [(MCMResultPromise *)v31 result];
      v35 = [v34 error];

      id v14 = v38;
      if (v35)
      {
        v36 = container_log_handle_for_category();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_error_impl(&dword_1D7739000, v36, OS_LOG_TYPE_ERROR, "Failed to destroy group container(s) during reconciliation; error = %@",
            buf,
            0xCu);
        }
      }
      id v15 = v39;
    }
    else
    {
      id v15 = v39;
      id v11 = v40;
      id v14 = v38;
    }
  }
  else
  {
    container_log_handle_for_category();
    v31 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_ERROR))
    {
      v37 = [v41 shortDescription];
      *(_DWORD *)buf = 138412546;
      v45 = v37;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v15;
      _os_log_error_impl(&dword_1D7739000, &v31->super, OS_LOG_TYPE_ERROR, "Failed to fetch group container list for %@: %@", buf, 0x16u);
    }
  }
}

- (void)reconcileGroupContainersForContainerClass:(unint64_t)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)[(id)gCodeSigningMapping copyReferenceCountSetForContainerClass:a3];
  if (v7)
  {
    if (a3 == 7)
    {
      id v11 = [(MCMGroupManager *)self userIdentityCache];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke;
      v12[3] = &unk_1E6A801A8;
      v12[4] = self;
      uint64_t v15 = 7;
      id v13 = v7;
      id v14 = v6;
      [v11 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v12];
    }
    else if (a3 == 13)
    {
      v8 = [(MCMGroupManager *)self userIdentityCache];
      id v9 = [v8 globalSystemUserIdentity];

      [(MCMGroupManager *)self _cleanupUnreferencedGroupContainersForUserIdentity:v9 containerClass:13 referenceCounts:v7 context:v6];
    }
  }
  else
  {
    id v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Failed to get reference count information for group type: %llu", buf, 0xCu);
    }
  }
}

void __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 homeDirectoryExists])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v4 _cleanupUnreferencedGroupContainersForUserIdentity:v6 containerClass:v3 referenceCounts:v5 context:*(void *)(a1 + 48)];
  }
}

- (MCMGroupManager)initWithUserIdentityCache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMGroupManager;
  id v6 = [(MCMGroupManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v7;
}

void __33__MCMGroupManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[MCMUserIdentitySharedCache sharedInstance];
  uint64_t v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  uint64_t v3 = (void *)defaultManager_sharedInstance;
  defaultManager_sharedInstance = v2;
}

@end