@interface BRCSyncContextProvider
- (BRCSyncContextProvider)initWithAccountSession:(id)a3;
- (id)_syncContextForContextIdentifier:(id)a3 isShared:(BOOL)a4 createIfNeeded:(BOOL)a5;
- (id)_syncContextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4;
- (id)allSyncContexts;
- (id)defaultSyncContext;
- (id)metadataSyncContextForMangledID:(id)a3;
- (id)sharedMetadataSyncContext;
- (id)sideCarSyncContext;
- (id)transferSyncContextForMangledID:(id)a3;
- (id)transferSyncContextForMangledID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)zoneHealthSyncContext;
- (void)closeSyncContexts;
@end

@implementation BRCSyncContextProvider

- (BRCSyncContextProvider)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncContextProvider;
  v6 = [(BRCSyncContextProvider *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    syncContexts = v6->_syncContexts;
    v6->_syncContexts = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v6;
}

- (id)_syncContextForContextIdentifier:(id)a3 isShared:(BOOL)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = [(NSMutableDictionary *)v9->_syncContexts objectForKeyedSubscript:v8];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v5;
  }
  if (!v11)
  {
    if (v9->_syncContexts)
    {
      objc_super v10 = [[BRCSyncContext alloc] initWithSession:v9->_session contextIdentifier:v8 isShared:v6];
      [(NSMutableDictionary *)v9->_syncContexts setObject:v10 forKeyedSubscript:v8];
      [(BRCSyncContext *)v10 resume];
    }
    else
    {
      objc_super v10 = 0;
    }
  }
  objc_sync_exit(v9);

  return v10;
}

- (id)_syncContextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isShared])
  {
    if (v4)
    {
      id v6 = (id)*MEMORY[0x1E4F59458];
    }
    else
    {
      id v6 = [v5 aliasTargetContainerString];
    }
  }
  else
  {
    if (v4 && [v5 isCloudDocsMangledID])
    {
      uint64_t v7 = NSString;
      id v8 = [v5 appLibraryOrZoneName];
      v9 = [v7 stringWithFormat:@"%@-metadata", v8];

      goto LABEL_10;
    }
    id v6 = [v5 appLibraryOrZoneName];
  }
  v9 = v6;
LABEL_10:

  return v9;
}

- (id)defaultSyncContext
{
  return [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:*MEMORY[0x1E4F59408] isShared:0 createIfNeeded:1];
}

- (id)sharedMetadataSyncContext
{
  return [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:*MEMORY[0x1E4F59458] isShared:1 createIfNeeded:1];
}

- (id)zoneHealthSyncContext
{
  return [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:*MEMORY[0x1E4F59480] isShared:0 createIfNeeded:1];
}

- (id)sideCarSyncContext
{
  return [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:*MEMORY[0x1E4F596D8] isShared:0 createIfNeeded:1];
}

- (id)transferSyncContextForMangledID:(id)a3
{
  return [(BRCSyncContextProvider *)self transferSyncContextForMangledID:a3 createIfNeeded:1];
}

- (id)transferSyncContextForMangledID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(BRCSyncContextProvider *)self _syncContextIdentifierForMangledID:v6 metadata:0];
  uint64_t v8 = [v6 isShared];

  v9 = [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:v7 isShared:v8 createIfNeeded:v4];

  return v9;
}

- (id)metadataSyncContextForMangledID:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCSyncContextProvider *)self _syncContextIdentifierForMangledID:v4 metadata:1];
  uint64_t v6 = [v4 isShared];

  uint64_t v7 = [(BRCSyncContextProvider *)self _syncContextForContextIdentifier:v5 isShared:v6 createIfNeeded:1];

  return v7;
}

- (id)allSyncContexts
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_syncContexts allValues];
  objc_sync_exit(v2);

  return v3;
}

- (void)closeSyncContexts
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(BRCSyncContextProvider *)v2 allSyncContexts];
  syncContexts = v2->_syncContexts;
  v2->_syncContexts = 0;

  objc_sync_exit(v2);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncContextProvider closeSyncContexts]", 107, &v23);
        objc_super v10 = brc_bread_crumbs();
        BOOL v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v32 = v23;
          __int16 v33 = 2112;
          v34 = v9;
          __int16 v35 = 2112;
          v36 = v10;
          _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling %@...%@", buf, 0x20u);
        }

        [v9 cancel];
        __brc_leave_section(&v23);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncContextProvider closeSyncContexts]", 112, &v23);
        v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v32 = v23;
          __int16 v33 = 2112;
          v34 = v16;
          __int16 v35 = 2112;
          v36 = v17;
          _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing %@...%@", buf, 0x20u);
        }

        [v16 close];
        __brc_leave_section(&v23);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_syncContexts, 0);
}

@end