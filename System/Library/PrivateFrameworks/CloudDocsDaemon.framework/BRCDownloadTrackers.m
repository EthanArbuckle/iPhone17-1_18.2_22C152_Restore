@interface BRCDownloadTrackers
- (BOOL)hasPendingTrackerForFileObjectID:(id)a3;
- (BRCAccountSession)session;
- (BRCDownloadTrackers)initWithSession:(id)a3;
- (id)trackedFileObjectIDs;
- (unint64_t)spaceRequiredForTrackers;
- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5;
- (void)document:(id)a3 didCompleteDownloadWithError:(id)a4;
- (void)removeDownloadTracker:(id)a3;
@end

@implementation BRCDownloadTrackers

- (BRCDownloadTrackers)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadTrackers;
  v5 = [(BRCDownloadTrackers *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

- (id)trackedFileObjectIDs
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_trackersByFileObjectID allKeys];
  objc_sync_exit(v2);

  return v3;
}

- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = brc_bread_crumbs();
  v13 = brc_notifications_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 134219010;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] addDownloadTracker %p %@ forFileObjectID %@ withEtagIfLoser %@%@", (uint8_t *)&v22, 0x34u);
  }

  if (!v11->_trackersByFileObjectID)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackersByFileObjectID = v11->_trackersByFileObjectID;
    v11->_trackersByFileObjectID = v14;
  }
  v16 = +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v9, v10, [v8 kind]);
  id v17 = [(NSMutableDictionary *)v11->_trackersByFileObjectID objectForKeyedSubscript:v16];
  if (!v17)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)v11->_trackersByFileObjectID setObject:v17 forKeyedSubscript:v16];
  }
  [v17 addObject:v8];
  fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  if (!fileObjectIDsByTracker)
  {
    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v20 = v11->_fileObjectIDsByTracker;
    v11->_fileObjectIDsByTracker = (NSMapTable *)v19;

    fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  }
  id v21 = [(NSMapTable *)fileObjectIDsByTracker objectForKey:v8];
  if (!v21)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMapTable *)v11->_fileObjectIDsByTracker setObject:v21 forKey:v8];
  }
  [v21 addObject:v16];

  objc_sync_exit(v11);
}

- (void)removeDownloadTracker:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = brc_bread_crumbs();
  v7 = brc_notifications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(BRCDownloadTrackers *)(uint64_t)v4 removeDownloadTracker:v7];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = -[NSMapTable objectForKey:](v5->_fileObjectIDsByTracker, "objectForKey:", v4, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)v5->_trackersByFileObjectID objectForKeyedSubscript:v12];
        [v13 removeObject:v4];
        if (![v13 count]) {
          [(NSMutableDictionary *)v5->_trackersByFileObjectID removeObjectForKey:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if (![(NSMutableDictionary *)v5->_trackersByFileObjectID count])
  {
    trackersByFileObjectID = v5->_trackersByFileObjectID;
    v5->_trackersByFileObjectID = 0;
  }
  [(NSMapTable *)v5->_fileObjectIDsByTracker removeObjectForKey:v4];
  if (![(NSMapTable *)v5->_fileObjectIDsByTracker count])
  {
    fileObjectIDsByTracker = v5->_fileObjectIDsByTracker;
    v5->_fileObjectIDsByTracker = 0;
  }
  objc_sync_exit(v5);
}

- (void)document:(id)a3 didCompleteDownloadWithError:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 fileObjectID];
  if (v8
    || ([v6 orig],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 fileObjectID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    trackersByFileObjectID = v10->_trackersByFileObjectID;
    uint64_t v12 = +[BRCTrackedVersion trackedVersionFor:v8 withEtagIfLoser:0 kind:0];
    v13 = [(NSMutableDictionary *)trackersByFileObjectID objectForKeyedSubscript:v12];
    v14 = (void *)[v13 copy];

    objc_sync_exit(v10);
    if (v14)
    {
      v15 = brc_bread_crumbs();
      long long v16 = brc_notifications_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        id v27 = v6;
        __int16 v28 = 2112;
        uint64_t v29 = 0;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        v33 = v15;
        _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[NOTIF] document %@ didCompleteDownloadEtagIfLoser %@ withError %@ -- notifying trackers%@", buf, 0x2Au);
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v8, 0, v7, (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v18);
    }
  }
}

- (BRCAccountSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (BRCAccountSession *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDsByTracker, 0);
  objc_storeStrong((id *)&self->_trackersByFileObjectID, 0);

  objc_destroyWeak((id *)&self->_session);
}

- (unint64_t)spaceRequiredForTrackers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(BRCDownloadTrackers *)self session];
  id v4 = [v3 clientDB];
  [v4 assertOnQueue];

  v5 = self;
  objc_sync_enter(v5);
  [(BRCDownloadTrackers *)v5 trackedFileObjectIDs];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "fileObjectID", (void)v16);
        uint64_t v12 = [v3 itemByFileObjectID:v11];

        v13 = [v12 desiredVersion];
        uint64_t v14 = [v13 size];

        v7 += v14;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)hasPendingTrackerForFileObjectID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v6 = [(BRCDownloadTrackers *)v5 trackedFileObjectIDs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__BRCDownloadTrackers_LegacyAdditions__hasPendingTrackerForFileObjectID___block_invoke;
  v9[3] = &unk_1E69974C8;
  v11 = &v12;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v5);

  return (char)v6;
}

void __73__BRCDownloadTrackers_LegacyAdditions__hasPendingTrackerForFileObjectID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 fileObjectID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isEqual:*(void *)(a1 + 32)];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)removeDownloadTracker:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] Removing download tracker %p %@%@", (uint8_t *)&v3, 0x20u);
}

@end