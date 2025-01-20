@interface MCMContainerCache
- (BOOL)_concurrent_setSandboxContainerMappingForUserIdentity:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 url:(id)a6;
- (BOOL)_concurrent_shouldRegisterSandboxMappingWithUserIdentity:(id)a3 identifier:(id)a4 childParentMapCache:(id)a5 containerClass:(unint64_t)a6;
- (BOOL)_sandboxSentinelExistsForContainerClass:(unint64_t)a3;
- (BOOL)isWellKnownIdentifier:(id)a3;
- (BOOL)removeContainerForUserIdentity:(id)a3 contentClass:(unint64_t)a4 identifier:(id)a5 transient:(BOOL)a6 error:(id *)a7;
- (Class)cacheEntryClass;
- (Class)classCacheClass;
- (MCMChildParentMapCache)childParentMapCache;
- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 error:(id *)a7;
- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 queue:(id)a7;
- (MCMUserIdentityCache)userIdentityCache;
- (OS_dispatch_queue)queue;
- (id)_containerClassPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5;
- (id)_queue_containerClassCacheForContainerClassPath:(id)a3;
- (id)_queue_containerClassCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5;
- (id)_sandboxSentinelForContainerClass:(unint64_t)a3;
- (id)addContainerMetadata:(id)a3 error:(id *)a4;
- (id)classCacheForContainerIdentity:(id)a3;
- (id)entriesForUserIdentities:(id)a3 contentClass:(unint64_t)a4 transient:(BOOL)a5 error:(id *)a6;
- (id)entryForContainerIdentity:(id)a3 classCache:(id)a4 error:(id *)a5;
- (id)entryForContainerIdentity:(id)a3 error:(id *)a4;
- (int64_t)countContainersForOtherUserIdentitiesWithIdentity:(id)a3 error:(id *)a4;
- (void)_queue_attachSandboxWriteThroughHandlerToContainerClassCache:(id)a3;
- (void)_queue_flush;
- (void)_queue_flushCacheForContainerClassPath:(id)a3;
- (void)_queue_invalidateUserIdentity:(id)a3;
- (void)_queue_setContainerClassCache:(id)a3;
- (void)_sandboxSetSentinelForContainerClass:(unint64_t)a3;
- (void)didInvalidateUserIdentity:(id)a3;
- (void)flush;
- (void)flushCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5;
- (void)invalidateUserIdentity:(id)a3;
- (void)setContainerClassCache:(id)a3;
@end

@implementation MCMContainerCache

void __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v8 = [v7 isNoSpecificPersona];
        v9 = *(void **)(a1 + 40);
        if (v8)
        {
          v10 = [v9 userIdentityCache];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_2;
          v16[3] = &unk_1E6A80668;
          uint64_t v11 = *(void *)(a1 + 64);
          v12 = *(void **)(a1 + 48);
          v16[4] = *(void *)(a1 + 40);
          uint64_t v19 = v11;
          char v20 = *(unsigned char *)(a1 + 72);
          id v13 = v12;
          uint64_t v14 = *(void *)(a1 + 56);
          id v17 = v13;
          uint64_t v18 = v14;
          [v10 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v16];
        }
        else
        {
          v15 = objc_msgSend(v9, "_queue_containerClassCacheForUserIdentity:containerClass:transient:", v7, *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
          if (v15) {
            [*(id *)(a1 + 48) addObject:v15];
          }
          else {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v4);
  }
}

uint64_t __52__MCMContainerCache_classCacheForContainerIdentity___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

  return MEMORY[0x1F41817F8]();
}

- (id)_queue_containerClassCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  BOOL v5 = a5;
  queue = self->_queue;
  id v9 = a3;
  dispatch_assert_queue_V2(queue);
  v10 = [(MCMContainerCache *)self _containerClassPathForUserIdentity:v9 containerClass:a4 transient:v5];

  uint64_t v11 = [(MCMContainerCache *)self _queue_containerClassCacheForContainerClassPath:v10];

  return v11;
}

- (id)_queue_containerClassCacheForContainerClassPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(NSMutableDictionary *)self->_queue_cache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = objc_alloc([(MCMContainerCache *)self classCacheClass]);
    v7 = [(MCMContainerCache *)self cacheEntryClass];
    int v8 = [(MCMContainerCache *)self userIdentityCache];
    BOOL v5 = (void *)[v6 initWithContainerClassPath:v4 cacheEntryClass:v7 targetQueue:0 userIdentityCache:v8];

    id v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Create cache for %@: %@", (uint8_t *)&v12, 0x16u);
    }

    if (v5)
    {
      [(MCMContainerCache *)self _queue_setContainerClassCache:v5];
    }
    else
    {
      v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_fault_impl(&dword_1D7739000, v10, OS_LOG_TYPE_FAULT, "Could not create cache for %@", (uint8_t *)&v12, 0xCu);
      }

      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)_containerClassPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  id v6 = a3;
  id v7 = containermanager_copy_global_configuration();
  int v8 = [v7 staticConfig];
  id v9 = [v8 configForContainerClass:a4];

  id v10 = containermanager_copy_global_configuration();
  uint64_t v11 = [v10 classPathCache];
  int v12 = [v11 containerClassPathForUserIdentity:v6 containerConfig:v9 typeClass:objc_opt_class()];

  return v12;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

uint64_t __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)entriesForUserIdentities:(id)a3 contentClass:(unint64_t)a4 transient:(BOOL)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v34 = [MEMORY[0x1E4F1CA48] array];
  v31 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v8 = container_class_normalized();
  context = (void *)MEMORY[0x1D9478DF0]();
  if (!+[MCMUserIdentity isUserIdentityRequiredForContainerClass:v8])
  {
    id v9 = [(MCMContainerCache *)self userIdentityCache];
    id v10 = [v9 defaultUserIdentity];

    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      uint64_t v11 = [(MCMContainerCache *)self userIdentityCache];
      uint64_t v12 = [v11 globalSystemUserIdentity];

      id v10 = (void *)v12;
    }
    if (v8 <= 8 && ((1 << v8) & 0x12A) != 0)
    {
      id v13 = [(MCMContainerCache *)self userIdentityCache];
      uint64_t v14 = [v13 globalBundleUserIdentity];

      id v10 = (void *)v14;
    }
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];

    id v32 = (id)v15;
  }
  if (v8 - 1 >= 0xE)
  {
    v29 = [[MCMError alloc] initWithErrorType:47 category:3];
    oslog = container_log_handle_for_category();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_1D7739000, oslog, OS_LOG_TYPE_ERROR, "Invalid Content Class: %ld", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_13;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke;
  block[3] = &unk_1E6A80690;
  id v38 = v32;
  v39 = self;
  unint64_t v42 = v8;
  BOOL v43 = a5;
  id v17 = v31;
  id v40 = v17;
  p_long long buf = &buf;
  dispatch_sync(queue, block);
  int v18 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    v29 = [[MCMError alloc] initWithErrorType:43 category:4];
  }
  else {
    v29 = 0;
  }

  _Block_object_dispose(&buf, 8);
  if (!v18)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    oslog = v17;
    uint64_t v21 = [oslog countByEnumeratingWithState:&v45 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v46;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(oslog);
          }
          long long v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
          [v25 resyncRequired];
          [v25 waitForSynchronizationToComplete];
          v35[0] = v23;
          v35[1] = 3221225472;
          v35[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_3;
          v35[3] = &unk_1E6A806B8;
          id v36 = v26;
          id v27 = v26;
          [v25 enumerateCacheEntriesWithEnumerator:v35];
          [v34 addObjectsFromArray:v27];
        }
        uint64_t v21 = [oslog countByEnumeratingWithState:&v45 objects:v44 count:16];
      }
      while (v21);
    }
LABEL_13:
  }
  if (a6 && !v34) {
    *a6 = v29;
  }
  uint64_t v19 = (void *)[v34 copy];

  return v19;
}

- (id)entryForContainerIdentity:(id)a3 classCache:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifier];
  char v10 = 0;
  uint64_t v25 = 138412290;
  while (1)
  {
    char v11 = v10;
    uint64_t v12 = objc_msgSend(v8, "cacheEntryForIdentifier:", v9, v25);
    if (!v12)
    {
LABEL_7:
      uint64_t v15 = [[MCMError alloc] initWithErrorType:21 category:3];
      id v13 = 0;
      if (!a5) {
        goto LABEL_14;
      }
LABEL_8:
      if (!v13)
      {
        uint64_t v15 = v15;
        *a5 = v15;
      }
      goto LABEL_14;
    }
    id v13 = v12;
    if ([v12 verify]) {
      break;
    }
    uint64_t v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = v25;
      v28 = v9;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Incoherent cache detected (stale cache entry) while looking up [%@]. Recovering by forcing cache resync.", buf, 0xCu);
    }

    [v8 resyncRequired];
    char v10 = 1;
    if (v11) {
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  id v16 = v7;
  id v17 = [v16 uuid];
  int v18 = [v13 uuid];
  char v19 = [v17 isEqual:v18];

  if (v19)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v16 uuid];
      uint64_t v22 = [v26 UUIDString];
      uint64_t v23 = [v13 uuid];
      long long v24 = [v23 UUIDString];
      *(_DWORD *)long long buf = 138412546;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v24;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Matching cache entry found, but UUIDs mismatch: requested = [%@] vs. cache entry = [%@]", buf, 0x16u);
    }
    uint64_t v15 = [[MCMError alloc] initWithErrorType:21];
    id v13 = 0;
  }

  if (a5) {
    goto LABEL_8;
  }
LABEL_14:

  return v13;
}

- (id)classCacheForContainerIdentity:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 transient];
  uint64_t v6 = [v4 containerClass];
  id v7 = [v4 userIdentity];

  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__12355;
  uint64_t v21 = __Block_byref_object_dispose__12356;
  id v22 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__MCMContainerCache_classCacheForContainerIdentity___block_invoke;
  v12[3] = &unk_1E6A80618;
  v12[4] = self;
  id v13 = v7;
  uint64_t v14 = &v17;
  uint64_t v15 = v6;
  char v16 = v5;
  id v9 = v7;
  dispatch_sync(queue, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)entryForContainerIdentity:(id)a3 error:(id *)a4
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MCMContainerCache *)self classCacheForContainerIdentity:v6];
  if (v7)
  {
    v11[0] = 0;
    id v8 = [(MCMContainerCache *)self entryForContainerIdentity:v6 classCache:v7 error:v11];
    id v9 = (MCMError *)v11[0];
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = [[MCMError alloc] initWithErrorType:43];
    id v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a4 = v9;
  }
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classCacheClass, 0);
  objc_storeStrong((id *)&self->_cacheEntryClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_childParentMapCache, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);

  objc_storeStrong((id *)&self->_queue_cache, 0);
}

- (Class)classCacheClass
{
  return self->_classCacheClass;
}

- (Class)cacheEntryClass
{
  return self->_cacheEntryClass;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMChildParentMapCache)childParentMapCache
{
  return self->_childParentMapCache;
}

- (BOOL)_concurrent_shouldRegisterSandboxMappingWithUserIdentity:(id)a3 identifier:(id)a4 childParentMapCache:(id)a5 containerClass:(unint64_t)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!_os_feature_enabled_impl()
    || [(MCMContainerCache *)self isWellKnownIdentifier:v11])
  {
    if (a6 <= 0xB)
    {
      if (((1 << a6) & 0xE54) != 0)
      {
        if (MCMRequirePersona_onceToken != -1) {
          dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
        }
        if (!MCMRequirePersona_result) {
          goto LABEL_11;
        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
        }
        if (MCMRequirePersonaTelemetryOnly_result)
        {
LABEL_11:
          uint64_t v13 = [v12 parentIdentifierForChildIdentifier:v11];
          uint64_t v14 = (void *)v13;
          if (v13) {
            uint64_t v15 = (void *)v13;
          }
          else {
            uint64_t v15 = v11;
          }
          id v16 = v15;
          uint64_t v17 = [(MCMContainerCache *)self userIdentityCache];
          int v18 = [v17 userIdentitiesForBundleIdentifier:v16];

          if ((unint64_t)[v18 count] >= 2)
          {
            uint64_t v19 = [(MCMContainerCache *)self userIdentityCache];
            char v20 = [v19 userIdentityForPersonalPersona];
            char v21 = [v18 containsObject:v20];

            if (v21)
            {
              char v22 = [v10 isDataSeparated];

              BOOL v23 = 1;
              if ((v22 & 1) == 0) {
                goto LABEL_31;
              }
LABEL_27:
              uint64_t v26 = container_log_handle_for_category();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                id v27 = [v10 shortDescription];
                int v29 = 138413314;
                v30 = v27;
                __int16 v31 = 2112;
                id v32 = v11;
                __int16 v33 = 2112;
                id v34 = v16;
                __int16 v35 = 2048;
                unint64_t v36 = a6;
                __int16 v37 = 1024;
                BOOL v38 = v23;
                _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_INFO, "Deciding not to register userIdentity: %@, identifier: %@ (parent %@), containerClass: %llu with sandbox; isMultiPersona: %d",
                  (uint8_t *)&v29,
                  0x30u);
              }
              LOBYTE(v23) = 0;
              goto LABEL_31;
            }
          }
          char v24 = [v18 containsObject:v10];

          if (v24)
          {
LABEL_30:
            LOBYTE(v23) = 1;
LABEL_31:

            goto LABEL_32;
          }
LABEL_26:
          BOOL v23 = 0;
          goto LABEL_27;
        }
        int v25 = [v10 personaType];
LABEL_25:
        id v16 = 0;
        if (!v25) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      if (a6 == 7)
      {
        id v16 = 0;
        goto LABEL_30;
      }
    }
    int v25 = [v10 isDataSeparated];
    goto LABEL_25;
  }
  LOBYTE(v23) = 0;
LABEL_32:

  return v23;
}

- (BOOL)isWellKnownIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[MCMEntitlementBypassList sharedBypassList];
  char v5 = [v4 wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet];
  char v6 = [v5 containsObject:v3];

  return v6;
}

- (void)_queue_attachSandboxWriteThroughHandlerToContainerClassCache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 containerClassPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && [v5 containerClass] != 10)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__MCMContainerCache__queue_attachSandboxWriteThroughHandlerToContainerClassCache___block_invoke;
    v7[3] = &unk_1E6A80818;
    id v6 = v5;
    id v8 = v6;
    id v9 = self;
    [v4 setConcurrentWriteThroughHandler:v7];
    if (!-[MCMContainerCache _sandboxSentinelExistsForContainerClass:](self, "_sandboxSentinelExistsForContainerClass:", [v6 containerClass]))
    {
      [v4 forceWriteThrough];
      -[MCMContainerCache _sandboxSetSentinelForContainerClass:](self, "_sandboxSetSentinelForContainerClass:", [v6 containerClass]);
    }
  }
}

void __82__MCMContainerCache__queue_attachSandboxWriteThroughHandlerToContainerClassCache___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a4 containerPath];
  uint64_t v10 = [v8 containerPath];

  BOOL v11 = !v9 || !v10 || ([v9 isEqual:v10] & 1) == 0;
  id v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    int v28 = 138413314;
    *(void *)int v29 = v7;
    *(_WORD *)&v29[8] = 2112;
    *(void *)&v29[10] = v9;
    *(_WORD *)&v29[18] = 2112;
    *(void *)&v29[20] = v10;
    __int16 v30 = 1024;
    BOOL v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v23;
    _os_log_debug_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEBUG, "Cache write-through; identifier = %@, newPath = %@, oldPath = %@, updateSandbox = %d, containerClassPath = %@",
      (uint8_t *)&v28,
      0x30u);
  }

  if (v11)
  {
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) userIdentity];
    uint64_t v15 = [*(id *)(a1 + 40) childParentMapCache];
    int v16 = objc_msgSend(v13, "_concurrent_shouldRegisterSandboxMappingWithUserIdentity:identifier:childParentMapCache:containerClass:", v14, v7, v15, objc_msgSend(*(id *)(a1 + 32), "containerClass"));

    uint64_t v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      int v28 = 67109634;
      *(_DWORD *)int v29 = v16;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v7;
      *(_WORD *)&v29[14] = 2112;
      *(void *)&v29[16] = v24;
      _os_log_debug_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEBUG, "Cache write-through update = %d; identifier = %@, containerClassPath = %@",
        (uint8_t *)&v28,
        0x1Cu);
    }

    if (v16)
    {
      int v18 = *(void **)(a1 + 40);
      uint64_t v19 = [*(id *)(a1 + 32) userIdentity];
      uint64_t v20 = [*(id *)(a1 + 32) containerClass];
      char v21 = [v9 containerDataURL];
      LOBYTE(v18) = objc_msgSend(v18, "_concurrent_setSandboxContainerMappingForUserIdentity:identifier:containerClass:url:", v19, v7, v20, v21);

      if ((v18 & 1) == 0)
      {
        char v22 = container_log_handle_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = [*(id *)(a1 + 32) containerClass];
          uint64_t v26 = [v9 containerDataURL];
          id v27 = [v26 path];
          int v28 = 138412802;
          *(void *)int v29 = v7;
          *(_WORD *)&v29[8] = 2048;
          *(void *)&v29[10] = v25;
          *(_WORD *)&v29[18] = 2112;
          *(void *)&v29[20] = v27;
          _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Failed to update container mapping of [%@(%llu)] to [%@]", (uint8_t *)&v28, 0x20u);
        }
      }
    }
  }
}

- (BOOL)_concurrent_setSandboxContainerMappingForUserIdentity:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 url:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  int v12 = [v11 kernelPersonaID];
  uint64_t v13 = [v11 posixUser];

  uint64_t v14 = +[MCMContainerClassPath posixOwnerForContainerClass:a5 user:v13];

  int v15 = [v14 UID];
  BOOL v16 = 1;
  uint64_t v17 = 2;
  switch(a5)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 8uLL:
    case 0xEuLL:
      goto LABEL_7;
    case 2uLL:
    case 4uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      _os_feature_enabled_impl();
      uint64_t v17 = 1;
      goto LABEL_3;
    case 7uLL:
      goto LABEL_18;
    case 0xCuLL:
      int v15 = 0;
      uint64_t v17 = 4;
      goto LABEL_18;
    case 0xDuLL:
      int v15 = 0;
      uint64_t v17 = 8;
LABEL_18:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
LABEL_3:
        id v18 = v9;
        uint64_t v28 = [v18 UTF8String];
        uint64_t v29 = 0;
        int v19 = sandbox_set_user_state_item_with_persona();
        if (v19)
        {
          int v20 = v19;
          char v21 = container_log_handle_for_category();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_5;
          }
          *(_DWORD *)long long buf = 67110402;
          *(_DWORD *)BOOL v31 = v15;
          *(_WORD *)&v31[4] = 2048;
          *(void *)&v31[6] = v17;
          __int16 v32 = 2080;
          uint64_t v33 = v28;
          __int16 v34 = 2048;
          unint64_t v35 = a5;
          __int16 v36 = 2080;
          *(void *)__int16 v37 = 0;
          *(_WORD *)&v37[8] = 1024;
          *(_DWORD *)&v37[10] = v20;
          uint64_t v25 = "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, class: %llu, path: %s : %d";
        }
        else
        {
          if (!v10
            || (uint64_t v28 = [v18 UTF8String],
                uint64_t v29 = [v10 fileSystemRepresentation],
                (int v23 = sandbox_set_user_state_item_with_persona()) == 0))
          {
            char v21 = container_log_handle_for_category();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67110402;
              *(_DWORD *)BOOL v31 = v15;
              *(_WORD *)&v31[4] = 2048;
              *(void *)&v31[6] = v17;
              __int16 v32 = 2080;
              uint64_t v33 = v28;
              __int16 v34 = 2048;
              unint64_t v35 = a5;
              __int16 v36 = 1024;
              *(_DWORD *)__int16 v37 = v12;
              *(_WORD *)&v37[4] = 2080;
              *(void *)&v37[6] = v29;
              _os_log_impl(&dword_1D7739000, v21, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, class: %llu, persona id: %d, path: %s", buf, 0x36u);
            }
            goto LABEL_6;
          }
          int v24 = v23;
          char v21 = container_log_handle_for_category();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
LABEL_5:
            BOOL v16 = 0;
LABEL_6:

            goto LABEL_7;
          }
          *(_DWORD *)long long buf = 67110402;
          *(_DWORD *)BOOL v31 = v15;
          *(_WORD *)&v31[4] = 2048;
          *(void *)&v31[6] = v17;
          __int16 v32 = 2080;
          uint64_t v33 = v28;
          __int16 v34 = 2048;
          unint64_t v35 = a5;
          __int16 v36 = 2080;
          *(void *)__int16 v37 = v29;
          *(_WORD *)&v37[8] = 1024;
          *(_DWORD *)&v37[10] = v24;
          uint64_t v25 = "Failed to set mapping for user: %u, itemType: %llu, identifier %s, class: %llu, path: %s : %d";
        }
        uint64_t v26 = v21;
        uint32_t v27 = 54;
LABEL_22:
        _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_5;
      }
      BOOL v16 = 0;
LABEL_7:

      return v16;
    default:
      char v21 = container_log_handle_for_category();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_DWORD *)long long buf = 134217984;
      *(void *)BOOL v31 = a5;
      uint64_t v25 = "Unsupported class for setting sandbox container mapping: %llu";
      uint64_t v26 = v21;
      uint32_t v27 = 12;
      goto LABEL_22;
  }
}

- (void)_sandboxSetSentinelForContainerClass:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  -[MCMContainerCache _sandboxSentinelForContainerClass:](self, "_sandboxSentinelForContainerClass:");
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = containermanager_copy_global_configuration();
  id v6 = [v5 defaultUser];
  [v6 UID];
  int v7 = sandbox_set_user_state_item_with_persona();

  if (v7)
  {
    id v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v10 = a3;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to set sandbox sentinel; class = %llu, result = %d",
        buf,
        0x12u);
    }
  }
}

- (BOOL)_sandboxSentinelExistsForContainerClass:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = -[MCMContainerCache _sandboxSentinelForContainerClass:](self, "_sandboxSentinelForContainerClass:");
  id v5 = containermanager_copy_global_configuration();
  id v6 = [v5 defaultUser];
  [v6 UID];
  id v7 = v4;
  int v8 = sandbox_user_state_iterate_items();

  if (v8)
  {
    id v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v17 = a3;
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache; class = %llu, result = %d",
        buf,
        0x12u);
    }
  }
  BOOL v10 = *((unsigned char *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v10;
}

void __61__MCMContainerCache__sandboxSentinelExistsForContainerClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (a4)
    {
      if (a3 != 1) {
        return;
      }
      if (*(void *)a4 && *(void *)(a4 + 8))
      {
        if (!strncmp(*(const char **)a4, (const char *)[*(id *)(a1 + 32) UTF8String], 0x400uLL))*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1; {
        return;
        }
      }
      id v6 = container_log_handle_for_category();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        return;
      }
      int v8 = 134217984;
      uint64_t v9 = 1;
      id v7 = "Sandbox.kext: Got an item with no identifier or path; itemType = %llu";
    }
    else
    {
      id v6 = container_log_handle_for_category();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      int v8 = 134217984;
      uint64_t v9 = a3;
      id v7 = "Sandbox.kext: Got an item iteration with no item struct; itemType = %llu";
    }
    _os_log_debug_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v8, 0xCu);
    goto LABEL_11;
  }
}

- (id)_sandboxSentinelForContainerClass:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.containermanagerd.%llu", a3);
}

- (void)_queue_setContainerClassCache:(id)a3
{
  id v4 = a3;
  [(MCMContainerCache *)self _queue_attachSandboxWriteThroughHandlerToContainerClassCache:v4];
  queue_cache = self->_queue_cache;
  id v6 = [v4 containerClassPath];
  -[NSMutableDictionary setObject:forKeyedSubscript:](queue_cache, "setObject:forKeyedSubscript:", v4);
}

- (void)_queue_flush
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v3 = containermanager_copy_global_configuration();
    id v4 = [v3 defaultUser];
    [v4 UID];

    int v5 = sandbox_user_state_iterate_items();
    if (v5)
    {
      int v6 = v5;
      id v7 = container_log_handle_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9[0] = 67109120;
        v9[1] = v6;
        _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache when trying to flush it; result = %d",
          (uint8_t *)v9,
          8u);
      }
    }
  }
  [(NSMutableDictionary *)self->_queue_cache removeAllObjects];
  int v8 = container_log_handle_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "All caches flushed", (uint8_t *)v9, 2u);
  }
}

void __33__MCMContainerCache__queue_flush__block_invoke(uint64_t a1, int a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0 && a4 != 0)
  {
    uint64_t v13 = *a4;
    int v8 = sandbox_set_user_state_item_with_persona();
    if (v8)
    {
      int v9 = v8;
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = *((_DWORD *)a4 + 4);
        *(_DWORD *)long long buf = 67110402;
        int v15 = a2;
        __int16 v16 = 2048;
        unint64_t v17 = a3;
        __int16 v18 = 2080;
        uint64_t v19 = v13;
        __int16 v20 = 1024;
        int v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = 0;
        __int16 v24 = 1024;
        int v25 = v9;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, persona id: %d, path: %s : %d", buf, 0x32u);
      }
    }
    else
    {
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *((_DWORD *)a4 + 4);
        *(_DWORD *)long long buf = 67110146;
        int v15 = a2;
        __int16 v16 = 2048;
        unint64_t v17 = a3;
        __int16 v18 = 2080;
        uint64_t v19 = v13;
        __int16 v20 = 1024;
        int v21 = v12;
        __int16 v22 = 2080;
        uint64_t v23 = 0;
        _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, persona id: %d, path: %s", buf, 0x2Cu);
      }
    }
  }
}

- (void)_queue_flushCacheForContainerClassPath:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v5 = [v4 containerClass];
    int v6 = [v4 userIdentity];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [v6 posixUser];
      int v8 = +[MCMContainerClassPath posixOwnerForContainerClass:v5 user:v7];

      int v9 = [MEMORY[0x1E4F1CA80] set];
      int v10 = [v8 UID];
      uint64_t v11 = 1;
      switch(v5)
      {
        case 2:
        case 4:
        case 6:
        case 9:
        case 10:
        case 11:
          break;
        case 7:
          if (_os_feature_enabled_impl()) {
            goto LABEL_21;
          }
          uint64_t v11 = 2;
          break;
        case 12:
          if (_os_feature_enabled_impl()) {
            goto LABEL_21;
          }
          int v10 = 0;
          uint64_t v11 = 4;
          break;
        case 13:
          if (_os_feature_enabled_impl()) {
            goto LABEL_21;
          }
          int v10 = 0;
          uint64_t v11 = 8;
          break;
        default:
          goto LABEL_21;
      }
      id v31 = v4;
      uint64_t v29 = v6;
      id v12 = v6;
      __int16 v34 = v12;
      id v13 = v9;
      unint64_t v35 = v13;
      int v14 = sandbox_user_state_iterate_items();
      if (v14)
      {
        int v15 = v14;
        __int16 v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)__int16 v37 = v15;
          _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache when trying to flush it; result = %d",
            buf,
            8u);
        }
      }
      uint32_t v27 = v9;
      uint64_t v28 = v8;
      uint64_t v32 = v5;
      __int16 v30 = self;
      int v17 = [v12 kernelPersonaID];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v46 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v33 = [*(id *)(*((void *)&v45 + 1) + 8 * i) UTF8String];
            int v23 = sandbox_set_user_state_item_with_persona();
            if (v23)
            {
              int v24 = v23;
              int v25 = container_log_handle_for_category();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67110402;
                *(_DWORD *)__int16 v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(void *)&v37[6] = v11;
                __int16 v38 = 2080;
                uint64_t v39 = v33;
                __int16 v40 = 2048;
                uint64_t v41 = v32;
                __int16 v42 = 2080;
                *(void *)BOOL v43 = 0;
                *(_WORD *)&v43[8] = 1024;
                *(_DWORD *)&v43[10] = v24;
                _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, class: %llu, path: %s : %d", buf, 0x36u);
              }
            }
            else
            {
              int v25 = container_log_handle_for_category();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67110402;
                *(_DWORD *)__int16 v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(void *)&v37[6] = v11;
                __int16 v38 = 2080;
                uint64_t v39 = v33;
                __int16 v40 = 2048;
                uint64_t v41 = v32;
                __int16 v42 = 1024;
                *(_DWORD *)BOOL v43 = v17;
                *(_WORD *)&v43[4] = 2080;
                *(void *)&v43[6] = 0;
                _os_log_impl(&dword_1D7739000, v25, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, class: %llu, persona id: %d, path: %s", buf, 0x36u);
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v44 count:16];
        }
        while (v20);
      }

      self = v30;
      id v4 = v31;
      int v8 = v28;
      int v6 = v29;
      int v9 = v27;
LABEL_21:
    }
  }
  [(NSMutableDictionary *)self->_queue_cache removeObjectForKey:v4];
  uint64_t v26 = container_log_handle_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)__int16 v37 = v4;
    _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_DEFAULT, "Cache: %@: Flushed", buf, 0xCu);
  }
}

void __60__MCMContainerCache__queue_flushCacheForContainerClassPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a4)
  {
    if (*(void *)(a1 + 48) == a3)
    {
      uint64_t v6 = *a4;
      if (*a4)
      {
        if (*(void *)(a1 + 56) == 7)
        {
          int v7 = *((_DWORD *)a4 + 4);
          if (v7 != [*(id *)(a1 + 32) kernelPersonaID]) {
            return;
          }
          uint64_t v6 = *a4;
        }
        id v8 = [NSString stringWithUTF8String:v6];
        objc_msgSend(*(id *)(a1 + 40), "addObject:");
      }
    }
  }
}

- (void)_queue_invalidateUserIdentity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Clearing container cache entries corresponding to invalidated user identity; identity = %@",
      buf,
      0xCu);
  }

  id v6 = containermanager_copy_global_configuration();
  int v7 = [v6 classIterator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke;
  v12[3] = &unk_1E6A80780;
  v12[4] = self;
  id v13 = v4;
  id v8 = v4;
  [v7 selectUserWithIterator:v12];

  uint32_t v9 = notify_post((const char *)*MEMORY[0x1E4F14050]);
  if (v9)
  {
    uint32_t v10 = v9;
    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v15) = v10;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Could not post user-invalidated notification: %u", buf, 8u);
    }
  }
}

void __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v24;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        uint32_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint32_t v10 = objc_msgSend(v9, "userIdentity", v15);
        int v11 = [v10 isStrictlyEqualToUserIdentity:*(void *)(a1 + 40)];

        if (v11)
        {
          id v12 = container_log_handle_for_category();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v15;
            uint64_t v21 = v9;
            _os_log_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEFAULT, "Invalidating container class path; %@", buf, 0xCu);
          }

          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            id v13 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
            [v13 waitForSynchronizationToComplete];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke_13;
            v17[3] = &unk_1E6A80758;
            int v14 = *(void **)(a1 + 40);
            v17[4] = *(void *)(a1 + 32);
            id v18 = v14;
            id v19 = v16;
            [v13 enumerateCacheEntriesWithEnumerator:v17];
          }
          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v6);
  }
}

uint64_t __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 identifier];
  LOBYTE(v4) = objc_msgSend(v4, "_concurrent_setSandboxContainerMappingForUserIdentity:identifier:containerClass:url:", v5, v6, objc_msgSend(*(id *)(a1 + 48), "containerClass"), 0);

  if ((v4 & 1) == 0)
  {
    uint64_t v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint32_t v9 = [v3 identifier];
      uint64_t v10 = [*(id *)(a1 + 48) containerClass];
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to remove container mapping of [%@], class: %llu", (uint8_t *)&v11, 0x16u);
    }
  }

  return 1;
}

- (void)didInvalidateUserIdentity:(id)a3
{
  [(MCMContainerCache *)self invalidateUserIdentity:a3];
}

- (void)invalidateUserIdentity:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCMContainerCache_invalidateUserIdentity___block_invoke;
  block[3] = &unk_1E6A805F0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __44__MCMContainerCache_invalidateUserIdentity___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_queue_invalidateUserIdentity:", v3);
}

- (void)flush
{
  v3[5] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__MCMContainerCache_flush__block_invoke;
  v3[3] = &unk_1E6A80730;
  v3[4] = self;
  dispatch_sync(queue, v3);
}

uint64_t __26__MCMContainerCache_flush__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);

  return objc_msgSend(v1, "_queue_flush");
}

- (void)flushCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = container_class_normalized();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MCMContainerCache_flushCacheForUserIdentity_containerClass_transient___block_invoke;
  block[3] = &unk_1E6A80708;
  void block[4] = self;
  id v12 = v7;
  uint64_t v13 = v8;
  BOOL v14 = a5;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __72__MCMContainerCache_flushCacheForUserIdentity_containerClass_transient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _containerClassPathForUserIdentity:*(void *)(a1 + 40) containerClass:*(void *)(a1 + 48) transient:*(unsigned __int8 *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_flushCacheForContainerClassPath:");
}

- (BOOL)removeContainerForUserIdentity:(id)a3 contentClass:(unint64_t)a4 identifier:(id)a5 transient:(BOOL)a6 error:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__12355;
  __int16 v30 = __Block_byref_object_dispose__12356;
  id v31 = 0;
  if (a4 - 1 >= 0xE)
  {
    int v17 = [[MCMError alloc] initWithErrorType:47 category:3];
    id v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v33 = a4;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Invalid Content Class: %ld", buf, 0xCu);
    }

    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__MCMContainerCache_removeContainerForUserIdentity_contentClass_identifier_transient_error___block_invoke;
  block[3] = &unk_1E6A80618;
  long long v23 = &v26;
  void block[4] = self;
  id v22 = v12;
  unint64_t v24 = a4;
  BOOL v25 = a6;
  dispatch_sync(queue, block);

  uint64_t v15 = (void *)v27[5];
  if (!v15)
  {
    int v17 = [[MCMError alloc] initWithErrorType:43 category:4];
    if (!a7)
    {
LABEL_9:
      BOOL v18 = 0;
      goto LABEL_10;
    }
LABEL_7:
    int v17 = v17;
    BOOL v18 = 0;
    *a7 = v17;
    goto LABEL_10;
  }
  id v16 = (id)[v15 setCacheEntry:0 forIdentifier:v13];
  int v17 = 0;
  BOOL v18 = 1;
LABEL_10:
  _Block_object_dispose(&v26, 8);

  return v18;
}

uint64_t __92__MCMContainerCache_removeContainerForUserIdentity_contentClass_identifier_transient_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

  return MEMORY[0x1F41817F8]();
}

- (id)addContainerMetadata:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 containerPath];
  uint64_t v8 = [v7 containerClassPath];

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__12355;
  __int16 v30 = __Block_byref_object_dispose__12356;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MCMContainerCache_addContainerMetadata_error___block_invoke;
  block[3] = &unk_1E6A806E0;
  BOOL v25 = &v26;
  void block[4] = self;
  id v10 = v8;
  id v24 = v10;
  dispatch_sync(queue, block);
  if (!v27[5])
  {
    BOOL v18 = [[MCMError alloc] initWithErrorType:43 category:4];
    id v16 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  int v11 = [MCMContainerCacheEntry alloc];
  id v12 = [(MCMContainerCache *)self userIdentityCache];
  id v13 = [(MCMContainerCacheEntry *)v11 initWithMetadata:v6 userIdentityCache:v12];

  BOOL v14 = (void *)v27[5];
  uint64_t v15 = [v6 identifier];
  id v16 = [v14 setCacheEntry:v13 forIdentifier:v15];

  int v17 = container_log_handle_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v6 containerPath];
    uint64_t v21 = [v20 containerClassPath];
    id v22 = [v6 identifier];
    *(_DWORD *)long long buf = 138412546;
    unint64_t v33 = v21;
    __int16 v34 = 2112;
    unint64_t v35 = v22;
    _os_log_debug_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEBUG, "Cache: %@: Added Identifier: %@", buf, 0x16u);
  }
  BOOL v18 = 0;
  if (a4)
  {
LABEL_7:
    if (!v16) {
      *a4 = v18;
    }
  }
LABEL_9:

  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __48__MCMContainerCache_addContainerMetadata_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForContainerClassPath:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

void __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", a2, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  id v4 = (id)v3;
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (int64_t)countContainersForOtherUserIdentitiesWithIdentity:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__12355;
  uint64_t v20 = __Block_byref_object_dispose__12356;
  id v21 = 0;
  id v7 = [(MCMContainerCache *)self userIdentityCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __77__MCMContainerCache_countContainersForOtherUserIdentitiesWithIdentity_error___block_invoke;
  v11[3] = &unk_1E6A80640;
  BOOL v14 = &v16;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  uint64_t v15 = &v22;
  [v7 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v11];

  int64_t v9 = v23[3];
  if (a4 && v9 < 0)
  {
    *a4 = (id) v17[5];
    int64_t v9 = v23[3];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __77__MCMContainerCache_countContainersForOtherUserIdentitiesWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v4 = [*(id *)(a1 + 32) userIdentity];
    char v5 = [v4 isEqual:v3];

    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 32) containerIdentity];
      id v7 = [v6 identityByChangingUserIdentity:v3];

      id v8 = *(void **)(a1 + 40);
      id v14 = 0;
      int64_t v9 = [v8 entryForContainerIdentity:v7 error:&v14];
      id v10 = v14;
      id v11 = v14;
      id v12 = v11;
      if (v9)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
      else if (v11 && [v11 type] != 21)
      {
        id v13 = container_log_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v16 = v7;
          __int16 v17 = 2112;
          uint64_t v18 = v12;
          _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Could not check whether other data containers of the same identifier exist; identity = %@, error = %@",
            buf,
            0x16u);
        }

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -1;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
      }
    }
  }
}

- (void)setContainerClassCache:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCMContainerCache_setContainerClassCache___block_invoke;
  block[3] = &unk_1E6A805F0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __44__MCMContainerCache_setContainerClassCache___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_queue_setContainerClassCache:", v3);
}

- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a3;
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.containermanagerd.cache", 0);
  id v14 = [(MCMContainerCache *)self initWithUserIdentityCache:v12 childParentMapCache:v11 classCacheClass:a5 cacheEntryClass:a6 queue:v13];

  uint64_t v15 = v14;
  return v15;
}

- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 queue:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MCMContainerCache;
  uint64_t v16 = [(MCMContainerCache *)&v21 init];
  __int16 v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_classCacheClass, a5);
    objc_storeStrong((id *)&v17->_cacheEntryClass, a6);
    objc_storeStrong((id *)&v17->_childParentMapCache, a4);
    uint64_t v18 = objc_opt_new();
    queue_cache = v17->_queue_cache;
    v17->_queue_cache = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v17->_userIdentityCache, a3);
    objc_storeStrong((id *)&v17->_queue, a7);
  }

  return v17;
}

@end