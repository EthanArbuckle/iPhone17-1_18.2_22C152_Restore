@interface MCMContainerClassCache
- (BOOL)_checkExistanceOfCacheEntry:(id)a3 libraryRepair:(id)a4;
- (BOOL)_identifier:(id)a3 isEqualToOtherIdentifier:(id)a4 caseSensitive:(BOOL)a5;
- (BOOL)_isEntryA:(id)a3 olderThanEntryB:(id)a4;
- (BOOL)_queue_consumeResyncRequired;
- (BOOL)enumerateCacheEntriesWithEnumerator:(id)a3;
- (BOOL)writeThroughEnabled;
- (Class)cacheEntryClass;
- (MCMContainerClassCache)initWithContainerClassPath:(id)a3 cacheEntryClass:(Class)a4 targetQueue:(id)a5 userIdentityCache:(id)a6;
- (MCMContainerClassPath)containerClassPath;
- (MCMUserIdentityCache)userIdentityCache;
- (NSMutableDictionary)lock_cache;
- (NSUUID)lastCompletedDiskScanUUID;
- (NSUUID)targetDiskScanUUID;
- (OS_dispatch_queue)fsScanQueue;
- (id)_concurrent_generateCacheEntryWithURL:(id)a3 identifier:(id)a4 containerPath:(id)a5 schemaVersion:(id)a6 uuid:(id)a7 metadata:(id)a8;
- (id)_concurrent_slowGenerateCacheEntryWithFileHandle:(id)a3 URL:(id)a4 identifier:(id)a5 uuid:(id)a6 schemaVersion:(id)a7 containerPath:(id)a8;
- (id)_lock_rootEntryByResortingFromRootEntry:(id)a3 insertEntry:(id)a4;
- (id)_lock_rootEntryFromRootEntry:(id)a3 afterRemovingEntryForContainerPath:(id)a4;
- (id)_setEntry:(id)a3 forIdentifier:(id)a4 containerPath:(id)a5 writeThrough:(BOOL)a6 replace:(BOOL)a7;
- (id)cacheEntryForIdentifier:(id)a3;
- (id)concurrentWriteThroughHandler;
- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4;
- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4 writeThrough:(BOOL)a5;
- (unint64_t)containerClass;
- (void)_concurrent_processCorruptEntry:(id)a3 handler:(id)a4;
- (void)_concurrent_processURL:(id)a3 handler:(id)a4;
- (void)_handleUnrecoverableCorruptContainerPath:(id)a3;
- (void)_processCorruptEntries:(id)a3 handler:(id)a4;
- (void)_processURLs:(id)a3 handler:(id)a4;
- (void)_queue_syncWithDisk;
- (void)asyncStartSynchronization;
- (void)forceWriteThrough;
- (void)resyncRequired;
- (void)setConcurrentWriteThroughHandler:(id)a3;
- (void)setLastCompletedDiskScanUUID:(id)a3;
- (void)setTargetDiskScanUUID:(id)a3;
- (void)setWriteThroughEnabled:(BOOL)a3;
- (void)waitForSynchronizationToComplete;
@end

@implementation MCMContainerClassCache

uint64_t __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_syncWithDisk");
  }
  return result;
}

- (BOOL)_queue_consumeResyncRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fsScanQueue);
  os_unfair_lock_lock(&self->_resyncRequiredLock);
  BOOL lock_resyncRequired = self->_lock_resyncRequired;
  self->_BOOL lock_resyncRequired = 0;
  os_unfair_lock_unlock(&self->_resyncRequiredLock);
  return lock_resyncRequired;
}

- (void)_queue_syncWithDisk
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fsScanQueue);
  v3 = [(MCMContainerClassCache *)self containerClassPath];
  v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v70 = (uint64_t)v3;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Resyncing container class cache: %@", buf, 0xCu);
  }

  v5 = container_log_handle_for_category();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  v7 = container_log_handle_for_category();
  v8 = v7;
  unint64_t v55 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = [v3 containerClass];
    *(_DWORD *)buf = 134349056;
    uint64_t v70 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ResyncingCache", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
  }
  os_signpost_id_t spid = v6;

  v10 = [(MCMContainerClassCache *)self userIdentityCache];
  v11 = [v3 userIdentity];
  v12 = [v10 libraryRepairForUserIdentity:v11];

  v13 = [MEMORY[0x1E4F1CA80] set];
  v57 = v3;
  v14 = [v3 classURL];
  id v68 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke;
  v66[3] = &unk_1E6A809E0;
  id v15 = v13;
  id v67 = v15;
  v56 = v12;
  LODWORD(v13) = [v12 fixAndRetryIfPermissionsErrorWithURL:v14 error:&v68 duringBlock:v66];
  id v54 = v68;

  if (v13)
  {
    v16 = [(MCMContainerClassCache *)self containerClassPath];
    [v16 setExists:1];
  }
  v17 = [MEMORY[0x1E4F1CA48] array];
  v62 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock(&self->_cacheLock);
  v18 = [(MCMContainerClassCache *)self lock_cache];
  v19 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v18, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v18;
  uint64_t v59 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v84 != v58) {
          objc_enumerationMutation(obj);
        }
        id v21 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v83 + 1) + 8 * i)];
        v61 = v21;
        do
        {
          v22 = [v21 containerPath];
          v23 = [v22 containerRootURL];

          if ([v15 containsObject:v23])
          {
            int v24 = [v21 corrupt];
            v25 = container_log_handle_for_category();
            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v26)
              {
                v31 = [v23 path];
                *(_DWORD *)buf = 138412290;
                uint64_t v70 = (uint64_t)v31;
                _os_log_debug_impl(&dword_1D7739000, v25, OS_LOG_TYPE_DEBUG, "Disk sync knows about corrupt [%@]", buf, 0xCu);
              }
              [v62 addObject:v21];
            }
            else
            {
              if (v26)
              {
                v32 = [v23 path];
                *(_DWORD *)buf = 138412290;
                uint64_t v70 = (uint64_t)v32;
                _os_log_debug_impl(&dword_1D7739000, v25, OS_LOG_TYPE_DEBUG, "Disk sync knows about [%@]", buf, 0xCu);
              }
            }
            [v19 addObject:v23];
          }
          else
          {
            v27 = container_log_handle_for_category();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [v23 path];
              *(_DWORD *)buf = 138412290;
              uint64_t v70 = (uint64_t)v28;
              _os_log_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEFAULT, "Disk sync has stale entry for [%@]", buf, 0xCu);
            }
            [v17 addObject:v21];
            v29 = [(MCMContainerClassCache *)self containerClassPath];
            [v29 setExists:0];
          }
          uint64_t v30 = [v21 next];

          id v21 = (id)v30;
        }
        while (v30);
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
    }
    while (v59);
  }

  os_unfair_lock_unlock(&self->_cacheLock);
  [v15 minusSet:v19];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v63 = v17;
  uint64_t v33 = [v63 countByEnumeratingWithState:&v78 objects:v77 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v79 != v35) {
          objc_enumerationMutation(v63);
        }
        v37 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        v38 = container_log_handle_for_category();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v70 = (uint64_t)v37;
          _os_log_impl(&dword_1D7739000, v38, OS_LOG_TYPE_DEFAULT, "Disk sync evicting stale entry: %@", buf, 0xCu);
        }

        v39 = [v37 identifier];
        v40 = [v37 containerPath];
        id v41 = [(MCMContainerClassCache *)self _setEntry:0 forIdentifier:v39 containerPath:v40 writeThrough:1 replace:0];
      }
      uint64_t v34 = [v63 countByEnumeratingWithState:&v78 objects:v77 count:16];
    }
    while (v34);
  }

  v42 = [v15 allObjects];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8;
  v65[3] = &unk_1E6A7F8B0;
  v65[4] = self;
  [(MCMContainerClassCache *)self _processURLs:v42 handler:v65];

  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10;
  v64[3] = &unk_1E6A7F8B0;
  v64[4] = self;
  [(MCMContainerClassCache *)self _processCorruptEntries:v62 handler:v64];
  uint64_t v43 = [v19 count];
  uint64_t v44 = [v15 count];
  uint64_t v45 = [v63 count];
  v46 = container_log_handle_for_category();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v47 = v44 + v43 - v45;
    uint64_t v48 = [v15 count];
    uint64_t v49 = [v63 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v70 = (uint64_t)v57;
    __int16 v71 = 2048;
    uint64_t v72 = v48;
    __int16 v73 = 2048;
    uint64_t v74 = v49;
    __int16 v75 = 2048;
    uint64_t v76 = v47;
    _os_log_impl(&dword_1D7739000, v46, OS_LOG_TYPE_DEFAULT, "Finished resyncing container class cache: %@, added = %lu, removed = %lu, total = %lu", buf, 0x2Au);
  }

  v50 = container_log_handle_for_category();
  v51 = v50;
  if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    uint64_t v52 = [v57 containerClass];
    *(_DWORD *)buf = 134349056;
    uint64_t v70 = v52;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v51, OS_SIGNPOST_INTERVAL_END, spid, "ResyncingCache", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
  }
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

BOOL __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  os_signpost_id_t v6 = +[MCMFileManager defaultManager];
  v7 = [v6 urlsForItemsInDirectoryAtURL:v5 error:a3];

  [*(id *)(a1 + 32) addObjectsFromArray:v7];
  return v7 != 0;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (BOOL)enumerateCacheEntriesWithEnumerator:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, void *))a3;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  os_signpost_id_t v6 = [(MCMContainerClassCache *)self lock_cache];
  v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_cacheLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (([v14 corrupt] & 1) == 0 && (objc_msgSend(v14, "ignore") & 1) == 0)
        {
          if ((v4[2](v4, v14) & 1) == 0)
          {

            goto LABEL_14;
          }
          char v11 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_14:
    char v11 = 0;
  }

  return v11 & 1;
}

- (void)_processURLs:(id)a3 handler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MCMContainerClassCache__processURLs_handler___block_invoke;
  v8[3] = &unk_1E6A7F8D8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsWithOptions:0 usingBlock:v8];
}

- (void)_processCorruptEntries:(id)a3 handler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke;
  v8[3] = &unk_1E6A7F8D8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsWithOptions:0 usingBlock:v8];
}

- (void)resyncRequired
{
  p_resyncRequiredLock = &self->_resyncRequiredLock;
  os_unfair_lock_lock(&self->_resyncRequiredLock);
  self->_BOOL lock_resyncRequired = 1;

  os_unfair_lock_unlock(p_resyncRequiredLock);
}

- (id)cacheEntryForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCMContainerClassCache *)self waitForSynchronizationToComplete];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v6 = [(MCMContainerClassCache *)self lock_cache];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (([v7 corrupt] & 1) != 0 || objc_msgSend(v7, "ignore"))
  {

    id v7 = 0;
  }
  os_unfair_lock_unlock(p_cacheLock);
  id v8 = container_log_handle_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEBUG, "Retrieving cache entry; identifier = %@, cache entry = %@",
      (uint8_t *)&v10,
      0x16u);
  }

  return v7;
}

- (NSMutableDictionary)lock_cache
{
  return self->_lock_cache;
}

- (void)waitForSynchronizationToComplete
{
  v3[5] = *MEMORY[0x1E4F143B8];
  fsScanQueue = self->_fsScanQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke;
  v3[3] = &unk_1E6A80730;
  v3[4] = self;
  dispatch_async_and_wait(fsScanQueue, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_cacheEntryClass, 0);
  objc_storeStrong((id *)&self->_fsScanQueue, 0);
  objc_storeStrong((id *)&self->_lock_cache, 0);
  objc_storeStrong((id *)&self->_targetDiskScanUUID, 0);
  objc_storeStrong((id *)&self->_lastCompletedDiskScanUUID, 0);
  objc_storeStrong((id *)&self->_containerClassPath, 0);

  objc_storeStrong(&self->_lock_concurrentWriteThroughHandler, 0);
}

- (Class)cacheEntryClass
{
  return self->_cacheEntryClass;
}

- (void)setWriteThroughEnabled:(BOOL)a3
{
  self->_writeThroughEnabled = a3;
}

- (BOOL)writeThroughEnabled
{
  return self->_writeThroughEnabled;
}

- (OS_dispatch_queue)fsScanQueue
{
  return self->_fsScanQueue;
}

- (void)setTargetDiskScanUUID:(id)a3
{
  p_targetDiskScanUUID = &self->_targetDiskScanUUID;

  objc_storeStrong((id *)p_targetDiskScanUUID, a3);
}

- (NSUUID)targetDiskScanUUID
{
  return self->_targetDiskScanUUID;
}

- (void)setLastCompletedDiskScanUUID:(id)a3
{
  p_lastCompletedDiskScanUUID = &self->_lastCompletedDiskScanUUID;

  objc_storeStrong((id *)p_lastCompletedDiskScanUUID, a3);
}

- (NSUUID)lastCompletedDiskScanUUID
{
  return self->_lastCompletedDiskScanUUID;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)_handleUnrecoverableCorruptContainerPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 containerRootURL];
  id v5 = [v3 userIdentity];
  uint64_t v6 = [v3 containerClass];
  id v7 = [v3 containerPathIdentifier];
  id v11 = 0;
  LODWORD(v6) = +[MCMCommandOperationDelete deleteContainerRootURL:v4 userIdentity:v5 containerClass:v6 containerPathIdentifier:v7 preferDirectDelete:0 error:&v11];
  id v8 = v11;

  id v9 = container_log_handle_for_category();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] (corrupt container)", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Could not delete corrupt container; path = %@, error = %@",
      buf,
      0x16u);
  }
}

- (BOOL)_isEntryA:(id)a3 olderThanEntryB:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v24 = 0;
  uint64_t v7 = [v5 birthtimeWithError:&v24];
  uint64_t v9 = v8;
  id v10 = v24;
  id v23 = 0;
  uint64_t v11 = [v6 birthtimeWithError:&v23];
  uint64_t v13 = v12;
  id v14 = v23;
  if (!(v7 | v9))
  {
    id v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime not available on A; entry = %@, error = %@",
        buf,
        0x16u);
    }
  }
  if (!(v11 | v13))
  {
    uint64_t v16 = container_log_handle_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime not available on B; entry = %@, error = %@",
        buf,
        0x16u);
    }
  }
  BOOL v17 = v7 < v11;
  if (v7 == v11 && (BOOL v17 = v9 < v13, v9 == v13))
  {
    long long v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime is the same; entryA = %@, entryB = %@",
        buf,
        0x16u);
    }

    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = v17;
  }
  long long v20 = container_log_handle_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = @"NO";
    *(_DWORD *)buf = 138413826;
    id v26 = v5;
    if (v19) {
      v22 = @"YES";
    }
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v9;
    __int16 v35 = 2048;
    uint64_t v36 = v11;
    __int16 v37 = 2048;
    uint64_t v38 = v13;
    _os_log_debug_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEBUG, "entryA %@ is older than entryB %@: %@; birthtimeA = %ld.%09ld, birthtimeB = %ld.%09ld",
      buf,
      0x48u);
  }

  return v19;
}

- (id)_lock_rootEntryByResortingFromRootEntry:(id)a3 insertEntry:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    uint64_t v9 = v8;
    if ([v7 ignore]
      || ![(MCMContainerClassCache *)self _isEntryA:v7 olderThanEntryB:v9])
    {
      id v12 = 0;
      id v14 = v9;
      while (1)
      {
        id v15 = v12;
        id v12 = v14;

        if (([v7 ignore] & 1) == 0)
        {
          uint64_t v16 = [v12 next];
          if (!v16) {
            break;
          }
          BOOL v17 = (void *)v16;
          BOOL v18 = [(MCMContainerClassCache *)self _isEntryA:v12 olderThanEntryB:v7];

          if (v18) {
            break;
          }
        }
        id v14 = [v12 next];

        if (!v14)
        {
          [v12 setNext:v7];
          BOOL v19 = container_log_handle_for_category();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v26 = 138412546;
            id v27 = v7;
            __int16 v28 = 2112;
            id v29 = v12;
            _os_log_debug_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEBUG, "Inserting entry %@ after entry %@", (uint8_t *)&v26, 0x16u);
          }

          uint64_t v13 = 0;
          goto LABEL_19;
        }
      }
      long long v20 = container_log_handle_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v24 = [v12 next];
        int v26 = 138412802;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2112;
        __int16 v31 = v24;
        _os_log_debug_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEBUG, "Inserting entry %@ after entry %@ but before entry %@", (uint8_t *)&v26, 0x20u);
      }
      uint64_t v21 = [v12 next];
      [v7 setNext:v21];

      [v12 setNext:v7];
      uint64_t v13 = v12;
LABEL_19:
      id v10 = v9;
    }
    else
    {
      [v7 setNext:v9];
      id v10 = v7;

      uint64_t v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v25 = [v10 next];
        int v26 = 138412546;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v25;
        _os_log_debug_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEBUG, "Inserting entry %@ as root entry; next = %@",
          (uint8_t *)&v26,
          0x16u);
      }
      id v12 = 0;
      uint64_t v13 = v9;
    }
  }
  else
  {
    id v10 = v7;
    id v12 = 0;
    uint64_t v13 = 0;
  }
  id v22 = v10;

  return v22;
}

- (id)_lock_rootEntryFromRootEntry:(id)a3 afterRemovingEntryForContainerPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = 0;
  uint64_t v9 = v7;
  while (1)
  {
    id v10 = [v9 containerPath];
    int v11 = [v10 isEqual:v6];

    if (v11) {
      break;
    }
    id v12 = v9;

    uint64_t v9 = [v12 next];

    id v8 = v12;
    if (!v9)
    {
      id v8 = v12;
      goto LABEL_11;
    }
  }
  uint64_t v13 = [v9 next];
  id v14 = (void *)v13;
  if (v8)
  {
    [v8 setNext:v13];
    id v15 = v14;
  }
  else
  {
    id v15 = v7;
    id v7 = (id)v13;
  }

  uint64_t v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412546;
    long long v20 = v9;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_debug_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEBUG, "Removing entry %@, new root is %@", (uint8_t *)&v19, 0x16u);
  }

LABEL_11:
  id v17 = v7;

  return v17;
}

- (id)_setEntry:(id)a3 forIdentifier:(id)a4 containerPath:(id)a5 writeThrough:(BOOL)a6 replace:(BOOL)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v12;
  if (v15) {
    [(MCMContainerClassCache *)self _lightweightAnnotateEntry:v15];
  }
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v17 = [(MCMContainerClassCache *)self lock_cache];
  BOOL v18 = v17;
  if (v17)
  {
    int v19 = [v17 objectForKeyedSubscript:v13];
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    int v19 = 0;
    if (v8)
    {
LABEL_5:
      long long v20 = (void (**)(void, void, void, void))MEMORY[0x1D9479020](self->_lock_concurrentWriteThroughHandler);
      if (v15) {
        goto LABEL_6;
      }
LABEL_11:
      if (v14) {
        [(MCMContainerClassCache *)self _lock_rootEntryFromRootEntry:v19 afterRemovingEntryForContainerPath:v14];
      }
      else {
      uint64_t v23 = [v19 next];
      }
      [v18 setObject:v23 forKeyedSubscript:v13];

      __int16 v21 = 0;
      goto LABEL_17;
    }
  }
  long long v20 = 0;
  if (!v15) {
    goto LABEL_11;
  }
LABEL_6:
  __int16 v21 = (void *)[v15 copyWithZone:0];

  [v21 setCache:self];
  if (!v19 || a7)
  {
    id v22 = [v19 next];
    [v21 setNext:v22];
  }
  else
  {
    [(MCMContainerClassCache *)self _lock_rootEntryByResortingFromRootEntry:v19 insertEntry:v15];
    __int16 v21 = v22 = v21;
  }

  [v18 setObject:v21 forKeyedSubscript:v13];
LABEL_17:
  id v24 = container_log_handle_for_category();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v26 = [v21 next];
    int v27 = 138412802;
    id v28 = v13;
    __int16 v29 = 2112;
    __int16 v30 = v21;
    __int16 v31 = 2112;
    uint64_t v32 = v26;
    _os_log_debug_impl(&dword_1D7739000, v24, OS_LOG_TYPE_DEBUG, "Setting cache entry; identifier = %@, cache entry = %@, next = %@",
      (uint8_t *)&v27,
      0x20u);
  }
  os_unfair_lock_unlock(p_cacheLock);
  if (v20) {
    ((void (**)(void, id, void *, id))v20)[2](v20, v13, v19, v15);
  }

  return v21;
}

- (BOOL)_identifier:(id)a3 isEqualToOtherIdentifier:(id)a4 caseSensitive:(BOOL)a5
{
  if (!a5) {
    return [a3 compare:a4 options:1] == 0;
  }

  return [a3 isEqualToString:a4];
}

- (id)_concurrent_generateCacheEntryWithURL:(id)a3 identifier:(id)a4 containerPath:(id)a5 schemaVersion:(id)a6 uuid:(id)a7 metadata:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = objc_alloc([(MCMContainerClassCache *)self cacheEntryClass]);
  int v19 = [(MCMContainerClassCache *)self userIdentityCache];
  long long v20 = (void *)[v18 initWithIdentifier:v17 containerPath:v16 schemaVersion:v15 uuid:v14 metadata:v13 userIdentityCache:v19];

  return v20;
}

- (id)_concurrent_slowGenerateCacheEntryWithFileHandle:(id)a3 URL:(id)a4 identifier:(id)a5 uuid:(id)a6 schemaVersion:(id)a7 containerPath:(id)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v38 = a5;
  id v16 = a6;
  id v40 = a7;
  id v17 = a8;
  id v18 = [(MCMContainerClassCache *)self containerClassPath];
  uint64_t v19 = [v18 containerClass];
  uint64_t v20 = [v18 userIdentity];
  __int16 v21 = [MCMMetadata alloc];
  id v22 = [(MCMContainerClassCache *)self userIdentityCache];
  id v41 = 0;
  __int16 v37 = (void *)v20;
  id v23 = [(MCMMetadataMinimal *)v21 initByReadingAndValidatingMetadataAtContainerPath:v17 userIdentity:v20 containerClass:v19 userIdentityCache:v22 error:&v41];
  id v39 = v41;

  if (v23)
  {
    id v24 = [v23 identifier];
    v25 = [v23 schemaVersion];
    int v26 = [v23 uuid];
    int v27 = [(MCMContainerClassCache *)self _concurrent_generateCacheEntryWithURL:v15 identifier:v24 containerPath:v17 schemaVersion:v25 uuid:v26 metadata:v23];

    [v27 setXattrsWithFileHandle:v14];
    id v28 = v38;
    goto LABEL_16;
  }
  id v29 = containermanager_copy_global_configuration();
  __int16 v30 = [v29 staticConfig];
  if ([v30 attemptMetadataReconstructionIfMissing])
  {
  }
  else
  {
    int v31 = [v39 POSIXerrno];

    if (v31 == 2)
    {
      int v27 = container_log_handle_for_category();
      id v28 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413570;
        id v43 = v38;
        __int16 v44 = 2112;
        id v45 = v17;
        __int16 v46 = 2112;
        id v47 = v38;
        __int16 v48 = 2112;
        id v49 = v16;
        __int16 v50 = 2112;
        id v51 = v40;
        __int16 v52 = 2112;
        id v53 = v39;
        _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Could not read metadata for [(%@) %@]; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
          buf,
          0x3Eu);
      }
      goto LABEL_15;
    }
  }
  uint64_t v32 = container_log_handle_for_category();
  id v28 = v38;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413570;
    id v43 = v38;
    __int16 v44 = 2112;
    id v45 = v17;
    __int16 v46 = 2112;
    id v47 = v38;
    __int16 v48 = 2112;
    id v49 = v16;
    __int16 v50 = 2112;
    id v51 = v40;
    __int16 v52 = 2112;
    id v53 = v39;
    _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Could not read metadata for [(%@) %@], attempting recovery; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
      buf,
      0x3Eu);
  }

  uint64_t v33 = [MCMContainerCacheEntry alloc];
  uint64_t v34 = [(MCMContainerClassCache *)self userIdentityCache];
  int v27 = [(MCMContainerCacheEntry *)v33 initFromContainerPath:v17 identifier:v38 uuid:v16 schemaVersion:v40 userIdentityCache:v34];

  if (v27 && ([v27 verify] & 1) == 0)
  {
    __int16 v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v43 = v38;
      __int16 v44 = 2112;
      id v45 = v16;
      __int16 v46 = 2112;
      id v47 = v40;
      _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Attempted to recover, but verification failed; identifier = [%@], uuid = %@, schemaVersion = %@",
        buf,
        0x20u);
    }

LABEL_15:
    int v27 = 0;
  }
LABEL_16:

  return v27;
}

- (void)_concurrent_processCorruptEntry:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void, NSObject *))a4;
  BOOL v8 = [v6 containerPath];
  uint64_t v9 = [v8 containerRootURL];
  id v10 = [MCMFileHandle alloc];
  int v11 = [v9 path];
  LOBYTE(v22) = 0;
  id v12 = [(MCMFileHandle *)v10 initWithPath:v11 relativeToFileHandle:0 direction:9 symlinks:0 createMode:0 createDPClass:0 openLazily:v22];

  id v24 = 0;
  BOOL v13 = [(MCMFileHandle *)v12 openWithError:&v24];
  id v14 = v24;
  id v15 = container_log_handle_for_category();
  id v16 = v15;
  if (v13)
  {
    id v23 = v7;
    id v17 = self;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v26 = v8;
      _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_INFO, "Attempting to repair corrupt container (slow); path = %@",
        buf,
        0xCu);
    }

    id v18 = [v6 identifier];
    uint64_t v19 = [v6 uuid];
    uint64_t v20 = [v6 schemaVersion];
    id v16 = [(MCMContainerClassCache *)v17 _concurrent_slowGenerateCacheEntryWithFileHandle:v12 URL:v9 identifier:v18 uuid:v19 schemaVersion:v20 containerPath:v8];

    if (!v16)
    {
      [(MCMContainerClassCache *)v17 _handleUnrecoverableCorruptContainerPath:v8];
      id v7 = v23;
      goto LABEL_9;
    }
    id v7 = v23;
    v23[2](v23, v16);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = [v9 path];
    *(_DWORD *)buf = 138412546;
    int v26 = v21;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to open [%@] for container scan, skipping; error = %@",
      buf,
      0x16u);
  }
LABEL_9:
}

- (void)_concurrent_processURL:(id)a3 handler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  uint64_t v7 = [(MCMContainerClassCache *)self containerClassPath];
  BOOL v8 = [v6 lastPathComponent];
  v25 = (void *)v7;
  uint64_t v9 = +[MCMContainerPath containerPathForContainerClassPath:v7 containerPathIdentifier:v8];
  id v10 = [MCMFileHandle alloc];
  int v11 = [v6 path];
  LOBYTE(v24) = 0;
  id v12 = [(MCMFileHandle *)v10 initWithPath:v11 relativeToFileHandle:0 direction:9 symlinks:0 createMode:0 createDPClass:0 openLazily:v24];

  id v27 = 0;
  LOBYTE(v10) = [(MCMFileHandle *)v12 openWithError:&v27];
  id v13 = v27;
  if ((v10 & 1) == 0)
  {
    uint64_t v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v6 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to open [%@] for container scan, skipping; error = %@",
        buf,
        0x16u);
    }
    id v17 = 0;
    id v15 = 0;
    id v14 = 0;
    uint64_t v20 = 0;
    goto LABEL_15;
  }
  id v14 = +[MCMContainerCacheEntry identifierForFileHandle:v12];
  id v15 = +[MCMContainerCacheEntry UUIDForFileHandle:v12];
  uint64_t v16 = +[MCMContainerCacheEntry schemaVersionForFileHandle:v12];
  id v17 = (void *)v16;
  if (v14 && v15 && v16)
  {
    uint64_t v18 = [(MCMContainerClassCache *)self _concurrent_generateCacheEntryWithURL:v6 identifier:v14 containerPath:v9 schemaVersion:v16 uuid:v15 metadata:0];
  }
  else
  {
    __int16 v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      __int16 v35 = v9;
      _os_log_impl(&dword_1D7739000, v21, OS_LOG_TYPE_INFO, "Container did not have xattr (%@|%@|%@), reading plist (slow); path = %@",
        buf,
        0x2Au);
    }

    uint64_t v18 = [(MCMContainerClassCache *)self _concurrent_slowGenerateCacheEntryWithFileHandle:v12 URL:v6 identifier:v14 uuid:v15 schemaVersion:v17 containerPath:v9];
  }
  uint64_t v20 = (void *)v18;
  if (!v18)
  {
    [(MCMContainerClassCache *)self _handleUnrecoverableCorruptContainerPath:v9];
LABEL_15:
    uint64_t v22 = v26;
    goto LABEL_16;
  }
  uint64_t v22 = v26;
  (*((void (**)(id, uint64_t))v26 + 2))(v26, v18);
LABEL_16:
}

void __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1D9478DF0]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processCorruptEntry:handler:", v4, *(void *)(a1 + 40));
}

void __47__MCMContainerClassCache__processURLs_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1D9478DF0]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processURL:handler:", v4, *(void *)(a1 + 40));
}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Disk sync reporting on new entry: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 identifier];
  uint64_t v7 = [v3 containerPath];
  id v8 = (id)[v5 _setEntry:v3 forIdentifier:v6 containerPath:v7 writeThrough:1 replace:0];
}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Disk sync reporting on repaired entry: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 identifier];
  uint64_t v7 = [v3 containerPath];
  id v8 = (id)[v5 _setEntry:v3 forIdentifier:v6 containerPath:v7 writeThrough:1 replace:1];
}

- (BOOL)_checkExistanceOfCacheEntry:(id)a3 libraryRepair:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v8 = [(MCMContainerClassCache *)self containerClassPath];
  int v9 = [v8 classURL];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke;
  v12[3] = &unk_1E6A809B8;
  v12[4] = &v14;
  id v13 = 0;
  [v7 fixAndRetryIfPermissionsErrorWithURL:v9 error:&v13 duringBlock:v12];
  id v10 = v13;

  LODWORD(v8) = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8 != 0;
}

uint64_t __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 itemAtURL:v5 exists:*(void *)(*(void *)(a1 + 32) + 8) + 24 error:a3];

  return v7;
}

- (id)concurrentWriteThroughHandler
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = (void *)MEMORY[0x1D9479020](self->_lock_concurrentWriteThroughHandler);
  os_unfair_lock_unlock(p_cacheLock);
  id v5 = (void *)MEMORY[0x1D9479020](v4);

  return v5;
}

- (void)setConcurrentWriteThroughHandler:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  id v6 = (void *)MEMORY[0x1D9479020](v5);

  id lock_concurrentWriteThroughHandler = self->_lock_concurrentWriteThroughHandler;
  self->_id lock_concurrentWriteThroughHandler = v6;

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)forceWriteThrough
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = (void *)MEMORY[0x1D9479020](self->_lock_concurrentWriteThroughHandler);
  id v5 = [(MCMContainerClassCache *)self lock_cache];
  id v6 = (void *)[v5 copy];

  os_unfair_lock_unlock(p_cacheLock);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__MCMContainerClassCache_forceWriteThrough__block_invoke;
    v7[3] = &unk_1E6A7F888;
    id v8 = v4;
    [v6 enumerateKeysAndObjectsWithOptions:1 usingBlock:v7];
  }
}

uint64_t __43__MCMContainerClassCache_forceWriteThrough__block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v1();
}

- (void)asyncStartSynchronization
{
  v3[5] = *MEMORY[0x1E4F143B8];
  fsScanQueue = self->_fsScanQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke;
  v3[3] = &unk_1E6A80730;
  v3[4] = self;
  dispatch_async(fsScanQueue, v3);
}

uint64_t __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_syncWithDisk");
  }
  return result;
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4 writeThrough:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    [v8 setXattrs];
  }
  id v10 = [v8 containerPath];
  uint64_t v11 = [(MCMContainerClassCache *)self _setEntry:v8 forIdentifier:v9 containerPath:v10 writeThrough:v5 replace:1];

  return v11;
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4
{
  return [(MCMContainerClassCache *)self setCacheEntry:a3 forIdentifier:a4 writeThrough:1];
}

- (MCMContainerClassCache)initWithContainerClassPath:(id)a3 cacheEntryClass:(Class)a4 targetQueue:(id)a5 userIdentityCache:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MCMContainerClassCache;
  uint64_t v14 = [(MCMContainerClassCache *)&v32 init];
  id v15 = v14;
  if (!v14)
  {
LABEL_10:
    id v28 = v15;
    goto LABEL_11;
  }
  v14->_BOOL lock_resyncRequired = 1;
  id lock_concurrentWriteThroughHandler = v14->_lock_concurrentWriteThroughHandler;
  v14->_id lock_concurrentWriteThroughHandler = 0;
  *(void *)&v14->_cacheLock._os_unfair_lock_opaque = 0;

  objc_storeStrong((id *)&v15->_cacheEntryClass, a4);
  v15->_unint64_t containerClass = [v11 containerClass];
  id v17 = containermanager_copy_global_configuration();
  int v18 = [v17 dispositionForContainerClass:v15->_containerClass];

  if (v18 == 1)
  {
    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    targetDiskScanUUID = v15->_targetDiskScanUUID;
    v15->_targetDiskScanUUID = (NSUUID *)v19;

    lastCompletedDiskScanUUID = v15->_lastCompletedDiskScanUUID;
    v15->_lastCompletedDiskScanUUID = 0;

    objc_storeStrong((id *)&v15->_containerClassPath, a3);
    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    lock_cache = v15->_lock_cache;
    v15->_lock_cache = (NSMutableDictionary *)v22;

    uint64_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);

    if (v12) {
      dispatch_queue_t v26 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.fsScan", v25, v12);
    }
    else {
      dispatch_queue_t v26 = dispatch_queue_create("com.apple.containermanagerd.fsScan", v25);
    }
    fsScanQueue = v15->_fsScanQueue;
    v15->_fsScanQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v15->_userIdentityCache, a6);
    goto LABEL_10;
  }
  id v27 = container_log_handle_for_category();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    unint64_t containerClass = v15->_containerClass;
    *(_DWORD *)buf = 134217984;
    unint64_t v34 = containerClass;
    _os_log_fault_impl(&dword_1D7739000, v27, OS_LOG_TYPE_FAULT, "Attempting to build cache for class not supported by this daemon: %llu", buf, 0xCu);
  }

  id v28 = 0;
LABEL_11:

  return v28;
}

@end