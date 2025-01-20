@interface BRCDiskSpaceReclaimer
+ (double)_onDiskAccessTimeDeltaForUrgency:(int)a3;
+ (double)accessTimeDeltaForUrgency:(int)a3;
+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3;
- (BOOL)documentUpdateEvictability:(id)a3;
- (BOOL)documentWasAccessedRecently:(id)a3;
- (BOOL)documentWasCreated:(id)a3;
- (BOOL)documentWasDeleted:(id)a3;
- (BOOL)documentWasUpdated:(id)a3 diffs:(unint64_t)a4;
- (BOOL)overwriteDocumentAccessTime:(id)a3 atime:(unint64_t)a4;
- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5;
- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4;
- (BOOL)renameAndUnlinkInBackgroundItemAtRelpath:(id)a3;
- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3;
- (OS_dispatch_queue)queue;
- (id)accessTimestampForDocument:(id)a3;
- (id)descriptionForItem:(id)a3 context:(id)a4;
- (int)urgencyForCacheDeleteUrgency:(int)a3;
- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3;
- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3;
- (int64_t)_dbSizeInBytes:(id)a3;
- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4;
- (int64_t)_fullVacuumIfPossible:(id)a3;
- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4;
- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5;
- (int64_t)cachedNonPurgeableSpace;
- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3;
- (int64_t)periodicReclaimSpace;
- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4;
- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3;
- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3;
- (unint64_t)totalSize;
- (void)_asyncAutovacuumIfNeeds:(id)a3;
- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withTimeDelta:(double)a4 onDiskAccessTimeDelta:(double)a5;
- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withUrgency:(int)a4;
- (void)_requestPurgeSpace;
- (void)_setupPurgePacer;
- (void)_updateNonPurgeableCachedSizeByAddingBytes:(int64_t)a3;
- (void)_updateNonPurgeableCachedSizeForDocument:(id)a3;
- (void)close;
- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3;
- (void)didAccessDocument:(id)a3;
- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4;
- (void)requestPurgeSpace;
@end

@implementation BRCDiskSpaceReclaimer

+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) >= 4) {
    return 3;
  }
  else {
    return a3;
  }
}

- (BOOL)documentWasCreated:(id)a3
{
  id v4 = a3;
  [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeForDocument:v4];
  unsigned int v5 = [v4 isAutomaticallyEvictable];
  v6 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v7 = [v4 dbRowID];
  v8 = [v4 currentVersion];

  LOBYTE(v4) = [v6 execute:@"INSERT INTO client_document_access (item_rowid, modify_access_time, properties) VALUES (%llu, %lld, %d)", v7, objc_msgSend(v8, "mtime"), v5];
  return (char)v4;
}

- (BOOL)documentWasDeleted:(id)a3
{
  id v4 = a3;
  [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeForDocument:v4];
  unsigned int v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = [v4 dbRowID];

  LOBYTE(v4) = objc_msgSend(v5, "execute:", @"DELETE FROM client_document_access WHERE item_rowid = %llu", v6);
  return (char)v4;
}

- (BOOL)documentWasUpdated:(id)a3 diffs:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  char v7 = [v6 isAutomaticallyEvictable];
  if (v4 & 0x20000) != 0 && (v7)
  {
    int v8 = 1;
  }
  else
  {
    int v9 = [v6 isAutomaticallyEvictable];
    v10 = [v6 orig];
    v11 = [v10 asDocument];
    int v8 = v9 ^ [v11 isAutomaticallyEvictable];
  }
  v12 = [v6 orig];
  v13 = [v12 asDocument];
  int v14 = [v13 hasLocalContent];
  int v15 = [v6 hasLocalContent];

  if ((*(void *)&v4 & 0xA0000) != 0 || (v8 & 1) != 0 || v14 != v15)
  {
    [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeForDocument:v6];
    if ((v4 & 0x20000) != 0)
    {
      v17 = [(BRCAccountSession *)self->_session clientDB];
      v18 = [v6 currentVersion];
      int v19 = [v17 execute:@"UPDATE client_document_access SET modify_access_time = MAX(access_time, %lld)  WHERE item_rowid = %llu", objc_msgSend(v18, "mtime"), objc_msgSend(v6, "dbRowID")];
    }
    else
    {
      int v19 = 1;
    }
    if ((v8 & v19) == 1) {
      char v16 = [(BRCDiskSpaceReclaimer *)self documentUpdateEvictability:v6];
    }
    else {
      char v16 = v19 & ~(_BYTE)v8;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (BOOL)documentUpdateEvictability:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isAutomaticallyEvictable];
  id v6 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v7 = [v4 dbRowID];

  if (v5) {
    int v8 = @"UPDATE client_document_access SET properties = (properties | 0x1) WHERE item_rowid = %llu";
  }
  else {
    int v8 = @"UPDATE client_document_access SET properties = (properties & ~0x1) WHERE item_rowid = %llu";
  }
  char v9 = objc_msgSend(v6, "execute:", v8, v7);

  return v9;
}

- (BOOL)overwriteDocumentAccessTime:(id)a3 atime:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 currentVersion];
  unint64_t v8 = [v7 mtime];

  if (v8 <= a4) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = v8;
  }
  unsigned int v10 = [v6 isAutomaticallyEvictable];
  v11 = [(BRCAccountSession *)self->_session clientDB];
  char v12 = [v11 execute:@"UPDATE client_document_access SET access_time = %lld, modify_access_time = %llu, properties = (properties | %d) WHERE item_rowid = %llu", a4, v9, v10, objc_msgSend(v6, "dbRowID")];

  [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeForDocument:v6];
  return v12;
}

- (void)didAccessDocument:(id)a3
{
  id v19 = a3;
  unint64_t v4 = time(0);
  int v5 = [v19 currentVersion];
  unint64_t v6 = [v5 mtime];

  unsigned int v7 = [v19 isAutomaticallyEvictable];
  unint64_t v8 = [v19 desiredVersion];
  char v9 = [v8 options];

  if ((v9 & 2) != 0)
  {
    unsigned int v10 = [v19 desiredVersion];
    char v11 = [v10 options];

    if ((v11 & 8) == 0)
    {
      char v12 = [v19 desiredVersion];
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 8);

      [v19 saveToDB];
    }
    v13 = [(BRCAccountSession *)self->_session clientDB];
    uint64_t v14 = [v19 dbRowID];
    int v15 = [v19 clientZone];
    char v16 = [v15 dbRowID];
    [v13 executeWithExpectedIndex:@"sqlite_autoindex_client_downloads_2", @"UPDATE OR IGNORE client_downloads SET download_priority = %ld, download_request_stamp = %lld WHERE throttle_id = %lld AND +zone_rowid = %@", 25, v4, v14, v16 sql];
  }
  if (v4 <= v6) {
    unint64_t v17 = v6;
  }
  else {
    unint64_t v17 = v4;
  }
  v18 = [(BRCAccountSession *)self->_session clientDB];
  [v18 execute:@"UPDATE client_document_access SET access_time = %lld, modify_access_time = %lld, properties = (properties | %d) WHERE item_rowid = %llu", v4, v17, v7, objc_msgSend(v19, "dbRowID")];

  [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeForDocument:v19];
}

- (BOOL)documentWasAccessedRecently:(id)a3
{
  id v4 = a3;
  int v5 = [v4 appLibrary];
  unint64_t v6 = [v5 mangledID];
  unsigned int v7 = +[BRCUserDefaults defaultsForMangledID:v6];
  [v7 documentAccessHighPriorityInterval];
  double v9 = v8;

  time_t v10 = time(0) - (uint64_t)v9;
  char v11 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v12 = [v4 dbRowID];

  v13 = objc_msgSend(v11, "numberWithSQL:", @"SELECT access_time > %lld FROM client_document_access WHERE item_rowid = %llu", v10, v12);
  LOBYTE(v12) = [v13 BOOLValue];

  return v12;
}

- (id)accessTimestampForDocument:(id)a3
{
  session = self->_session;
  id v4 = a3;
  int v5 = [(BRCAccountSession *)session clientDB];
  uint64_t v6 = [v4 dbRowID];

  unsigned int v7 = objc_msgSend(v5, "numberWithSQL:", @"SELECT access_time FROM client_document_access WHERE item_rowid = %llu", v6);
  return v7;
}

- (void)_updateNonPurgeableCachedSizeByAddingBytes:(int64_t)a3
{
  if (a3)
  {
    int v5 = [(BRCAccountSession *)self->_session clientState];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"purgeableSpaceDate"];

    if (v6)
    {
      unsigned int v7 = [MEMORY[0x1E4F1C9C8] date];
      [v7 timeIntervalSinceDate:v6];
      double v9 = v8;

      time_t v10 = +[BRCUserDefaults defaultsForMangledID:0];
      [v10 cacheDeleteRecomputeInterval];
      if (v9 < v11)
      {
        uint64_t v12 = [(BRCAccountSession *)self->_session clientDB];
        v13 = [v12 serialQueue];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke;
        v14[3] = &unk_1E6995308;
        v14[4] = self;
        v14[5] = a3;
        dispatch_async(v13, v14);
      }
    }
  }
}

void __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientState];
  v3 = [v2 objectForKeyedSubscript:@"nonPurgeableSpace"];
  id v4 = NSNumber;
  uint64_t v5 = [v3 integerValue];
  uint64_t v6 = [v4 numberWithLongLong:(*(void *)(a1 + 40) + v5) & ~((*(void *)(a1 + 40) + v5) >> 63)];

  [v2 setObject:v6 forKeyedSubscript:@"nonPurgeableSpace"];
  unsigned int v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v7 forceBatchStart];

  double v8 = brc_bread_crumbs();
  double v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke_cold_1();
  }
}

- (void)_updateNonPurgeableCachedSizeForDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = (void *)[v5 numberWithSQL:@"SELECT MAX(modify_access_time, access_time)   FROM client_document_access  WHERE item_rowid = %llu", objc_msgSend(v4, "dbRowID")];

  uint64_t v8 = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke(v7, v4);
  double v9 = [v4 orig];
  time_t v10 = [v9 asDocument];
  uint64_t v11 = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke((uint64_t)v10, v10);

  [(id)objc_opt_class() accessTimeDeltaForUrgency:3];
  v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v12];
  [v13 timeIntervalSince1970];
  uint64_t v15 = v14;

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke_2;
  v26[3] = &__block_descriptor_40_e38_B24__0__BRCDocumentItem_8__NSNumber_16l;
  v26[4] = v15;
  char v16 = (uint64_t (**)(void, void, void))MEMORY[0x1D94389C0](v26);
  char v17 = ((uint64_t (**)(void, id, void *))v16)[2](v16, v4, v6);
  v18 = [v4 orig];
  id v19 = [v18 asDocument];
  char v20 = ((uint64_t (**)(void, void *, void *))v16)[2](v16, v19, v6);

  if (v17)
  {
    if (v20) {
      goto LABEL_12;
    }
    v21 = [v4 orig];
    v22 = [v21 asDocument];
    int v23 = [v22 hasLocalContent];

    if (!v23) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ([v4 isDead])
  {
    v24 = [v4 orig];
    char v25 = [v24 isDead];

    if ((v25 & 1) == 0)
    {
LABEL_10:
      uint64_t v8 = -v11;
LABEL_11:
      [(BRCDiskSpaceReclaimer *)self _updateNonPurgeableCachedSizeByAddingBytes:v8];
      goto LABEL_12;
    }
  }
  if (v20) {
    goto LABEL_11;
  }
  v8 -= v11;
  if (v8) {
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasLocalContent])
  {
    v3 = [v2 currentVersion];
    uint64_t v4 = [v3 size];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = NSNumber;
  uint64_t v7 = [a3 longLongValue];
  if (!v7)
  {
    uint64_t v8 = [v5 st];
    uint64_t v7 = [v8 lastUsedTime];
  }
  double v9 = [v5 currentVersion];
  uint64_t v10 = [v9 mtime];

  if (v7 <= v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v7;
  }
  double v12 = [v6 numberWithLongLong:v11];
  if (*(double *)(a1 + 32) >= (double)[v12 longLongValue]
    && [v5 hasLocalContent])
  {
    uint64_t v13 = [v5 isAutomaticallyEvictable];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  session = self->_session;
  id v8 = a3;
  double v9 = [(BRCAccountSession *)session clientDB];
  uint64_t v10 = [v8 dbRowID];

  uint64_t v11 = (void *)[v9 fetch:@"SELECT access_time, document_is_evictable(properties) FROM client_document_access WHERE item_rowid = %llu", v10];
  if ([v11 next])
  {
    double v12 = (__CFString *)[v11 longLongAtIndex:0];
    uint64_t v13 = [v11 longLongAtIndex:1];
    if (v12)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(uint64_t)v12];
      [v14 timeIntervalSinceNow];
      char v16 = +[BRCDumpContext stringFromInterval:v6 context:-v15];
      double v12 = [NSString stringWithFormat:@" access:%@ ago", v16];
    }
    char v17 = "yes";
    if (!v13) {
      char v17 = "no";
    }
    v18 = &stru_1F2AC7720;
    if (v12) {
      v18 = v12;
    }
    id v19 = [NSString stringWithFormat:@"evictable:%s%@", v17, v18];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withTimeDelta:(double)a4 onDiskAccessTimeDelta:(double)a5
{
  id v7 = a3;
  id v8 = self->_session;
  double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a4];
  [v9 timeIntervalSince1970];
  unint64_t v11 = (unint64_t)v10;

  unint64_t v12 = v11 + 1;
  uint64_t v13 = [(BRCAccountSession *)v8 clientDB];
  uint64_t v14 = [v13 serialQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke;
  v17[3] = &unk_1E6995C20;
  v18 = v8;
  id v19 = self;
  id v20 = v7;
  unint64_t v21 = v12;
  id v15 = v7;
  char v16 = v8;
  dispatch_sync(v14, v17);
}

void __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke_2;
  v11[3] = &unk_1E699A4F0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v12 = v2;
  uint64_t v13 = v3;
  id v14 = v4;
  id v5 = (uint64_t (**)(void, void, void))MEMORY[0x1D94389C0](v11);
  id v6 = [*(id *)(a1 + 32) clientDB];
  id v7 = (void *)[v6 fetch:@"   SELECT dt.throttle_id, dt.zone_rowid      FROM client_downloads AS dt     WHERE dt.download_kind = %d       AND dt.throttle_state = 43", 0];
  int v8 = ((uint64_t (**)(void, void *, uint64_t))v5)[2](v5, v7, 1);

  if (v8)
  {
    double v9 = [*(id *)(a1 + 32) clientDB];
    double v10 = (void *)[v9 fetchWithSlowStatementRadar:@"<rdar://problem/34004579>", @"   SELECT da.item_rowid, ci.zone_rowid      FROM client_document_access AS da, client_items as ci     WHERE da.item_rowid = ci.rowid        AND document_is_evictable(da.properties)        AND access_time < %lld        AND NOT EXISTS(SELECT 1 FROM client_downloads AS dt                       WHERE dt.throttle_id = da.item_rowid                         AND dt.download_kind = %d                         AND dt.throttle_state = 43)  ORDER BY access_time ASC", *(void *)(a1 + 56), 0 sql];
    ((uint64_t (**)(void, void *, void))v5)[2](v5, v10, 0);
  }
}

uint64_t __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if ([v4 next])
  {
    *(void *)&long long v5 = 138412546;
    long long v29 = v5;
    do
    {
      id v6 = (void *)MEMORY[0x1D9438760]();
      id v7 = *(void **)(a1 + 32);
      int v8 = [v4 numberAtIndex:1];
      double v9 = [v7 serverZoneByRowID:v8];
      double v10 = [v9 clientZone];

      unint64_t v11 = objc_msgSend(v10, "itemByRowID:", objc_msgSend(v4, "integerAtIndex:", 0));
      id v12 = [v11 asDocument];

      if (!v12)
      {
        unint64_t v21 = brc_bread_crumbs();
        v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = (uint64_t)v21;
          _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't fetch from the db%@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      memset(v31, 0, sizeof(v31));
      __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer(LegacyAdditions) _enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:]_block_invoke", 278, v31);
      uint64_t v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v33 = v31[0];
        __int16 v34 = 2112;
        v35 = v12;
        __int16 v36 = 2112;
        v37 = v13;
        _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx considering eviction for %@%@", buf, 0x20u);
      }

      if ([v12 isAutomaticallyEvictable] & 1) != 0 || a3 && (objc_msgSend(v12, "isEvictable"))
      {
        id v15 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "downloadTrackers", v29);
        char v16 = [v12 fileObjectID];
        int v17 = [v15 hasPendingTrackerForFileObjectID:v16];

        if (v17)
        {
          v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [v12 itemID];
            *(_DWORD *)buf = v29;
            uint64_t v33 = (uint64_t)v20;
            __int16 v34 = 2112;
            v35 = v18;
            _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't automatically evictable because has a pending read%@", buf, 0x16u);
          }
        }
        else
        {
          int v23 = [*(id *)(*(void *)(a1 + 40) + 8) notificationManager];
          v24 = [v12 st];
          char v25 = [v24 documentID];
          int v26 = [v23 hasWatcherForDocumentID:v25];

          if (!v26)
          {
            if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
            {
              [v4 close];
              __brc_leave_section(v31);

              break;
            }
            goto LABEL_21;
          }
          v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v27 = [v12 itemID];
            *(_DWORD *)buf = v29;
            uint64_t v33 = (uint64_t)v27;
            __int16 v34 = 2112;
            v35 = v18;
            _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't automatically evictable because has a registered file presenters%@", buf, 0x16u);
          }
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "documentUpdateEvictability:", v12, v29);
      }
LABEL_21:
      __brc_leave_section(v31);
LABEL_22:
    }
    while (([v4 next] & 1) != 0);
  }

  return 1;
}

+ (double)_onDiskAccessTimeDeltaForUrgency:(int)a3
{
  double v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 onDiskAccessTimeDeltaInLowUrgency];
      goto LABEL_6;
    case 2:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 onDiskAccessTimeDeltaInMedUrgency];
      goto LABEL_6;
    case 3:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 onDiskAccessTimeDeltaInHighUrgency];
      goto LABEL_6;
    case 4:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 onDiskAccessTimeDeltaInVeryHighUrgency];
LABEL_6:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:v4];
  double v7 = v6;
  +[BRCDiskSpaceReclaimer _onDiskAccessTimeDeltaForUrgency:v4];
  [(BRCDiskSpaceReclaimer *)self _enumerateItemsForEvictSyncWithBlock:v9 withTimeDelta:v7 onDiskAccessTimeDelta:v8];
}

- (BOOL)renameAndUnlinkInBackgroundItemAtRelpath:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__BRCDiskSpaceReclaimer_LegacyAdditions__renameAndUnlinkInBackgroundItemAtRelpath___block_invoke;
  v8[3] = &unk_1E6993E30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [v5 performOnOpenParentFileDescriptor:v8 error:0];

  return v6;
}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions__renameAndUnlinkInBackgroundItemAtRelpath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) fileUnlinker];
  id v5 = [*(id *)(a1 + 40) filename];
  LOBYTE(a2) = [v4 renameAndUnlinkInBackgroundItemAt:a2 path:v5];

  if (a2) {
    return 0;
  }
  else {
    return *__error();
  }
}

- (void)_setupPurgePacer
{
  double v3 = +[BRCUserDefaults defaultsForMangledID:0];
  [v3 purgePacerInterval];

  br_pacer_create();
  id v4 = (br_pacer *)objc_claimAutoreleasedReturnValue();
  purgePacer = self->_purgePacer;
  self->_purgePacer = v4;

  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  br_pacer_set_event_handler();
  br_pacer_resume();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__BRCDiskSpaceReclaimer_LegacyAdditions___setupPurgePacer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestPurgeSpace];
}

- (void)_requestPurgeSpace
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  double v3 = [(BRCAccountSession *)self->_session clientDB];
  id v4 = [v3 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke;
  block[3] = &unk_1E6996218;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(v4, block);

  unint64_t v5 = [(BRCAccountSession *)self->_session availableDiskSpace];
  unint64_t v6 = v19[3];
  uint64_t v7 = v6 - v5;
  if (v6 >= v5)
  {
    if (self->_purgeRequest)
    {
      double v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(BRCDiskSpaceReclaimer(LegacyAdditions) *)(uint64_t)v8 _requestPurgeSpace];
      }
    }
    else
    {
      id v12 = [(BRCAccountSession *)self->_session volume];
      double v8 = [v12 mountPath];

      br_pacer_suspend();
      v22[0] = @"CACHE_DELETE_VOLUME";
      v22[1] = @"CACHE_DELETE_AMOUNT";
      v23[0] = v8;
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v7];
      v23[1] = v13;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

      id v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BRCDiskSpaceReclaimer(LegacyAdditions) _requestPurgeSpace]();
      }

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_83;
      v16[3] = &unk_1E699A540;
      v16[4] = self;
      self->_purgeRequest = (CacheDeleteToken *)MEMORY[0x1D9437930](v9, v16);
    }
  }
  else
  {
    double v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = +[BRCDumpContext stringFromByteCount:v5 showActualByteCount:0 suffix:0 context:0];
      unint64_t v11 = +[BRCDumpContext stringFromByteCount:v19[3] showActualByteCount:0 suffix:0 context:0];
      *(_DWORD *)buf = 138412802;
      id v25 = v10;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      long long v29 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] not requesting space because we already have enough (available:%@ > required:%@)%@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke(uint64_t a1)
{
  id v2 = +[BRCUserDefaults defaultsForMangledID:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 minimumDiskSpaceRequiredToDownloadUserInitiated];

  long long v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_2;
  v6[3] = &unk_1E699A518;
  long long v7 = v3;
  return [v4 enumerateSupportedFolderTypes:v6];
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) downloadTrackers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 spaceRequiredForTrackers];

  return 1;
}

void __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_83(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  long long v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_83_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_84;
  block[3] = &unk_1E6993698;
  block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_84(uint64_t a1)
{
  id v2 = *(const void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  return br_pacer_resume();
}

- (void)requestPurgeSpace
{
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  if (!a4)
  {
    unint64_t v6 = [(BRCAccountSession *)self->_session volume];
    int v7 = [v6 deviceID];

    if (v7 == a3)
    {
      [(BRCDiskSpaceReclaimer *)self requestPurgeSpace];
    }
  }
}

- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCDiskSpaceReclaimer;
  unint64_t v6 = [(BRCDiskSpaceReclaimer *)&v23 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    double v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bird.cache-delete", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    [(BRCDiskSpaceReclaimer *)v7 _setupPurgePacer];
    objc_initWeak(&location, v5);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke;
    uint64_t v20 = &unk_1E6993C50;
    objc_copyWeak(&v21, &location);
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v17);
    uint64_t v13 = +[BRCSystemResourcesManager manager];
    int v14 = [v13 connectedToPowerSource];

    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0, 5000000000);
      dispatch_after(v15, (dispatch_queue_t)v7->_queue, v12);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke(uint64_t a1)
{
  id v2 = +[BRCSystemResourcesManager manager];
  int v3 = [v2 connectedToPowerSource];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained clientDB];

    if (v5)
    {
      unint64_t v6 = [WeakRetained clientDB];
      int v7 = [v6 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2;
      block[3] = &unk_1E6993698;
      id v14 = WeakRetained;
      dispatch_sync(v7, block);
    }
    double v8 = [WeakRetained serverDB];

    if (v8)
    {
      id v9 = [WeakRetained serverDB];
      dispatch_queue_t v10 = [v9 serialQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3;
      v11[3] = &unk_1E6993698;
      id v12 = WeakRetained;
      dispatch_sync(v10, v11);
    }
  }
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientDB];
  [v1 autovacuumIfNeeded];
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) serverDB];
  [v1 autovacuumIfNeeded];
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BRCDiskSpaceReclaimer_close__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_sync(queue, block);
  purgePacer = self->_purgePacer;
  self->_purgePacer = 0;
}

uint64_t __30__BRCDiskSpaceReclaimer_close__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  id v2 = *(const void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  return br_pacer_cancel();
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  v7[3] = &unk_1E6994600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 40) && !*(unsigned char *)(v2 + 41))
  {
    id v4 = [*(id *)(v2 + 8) clientState];
    id v5 = [v4 dictionary];

    id v6 = [v5 objectForKeyedSubscript:@"purgeableSpaceDate"];
    int v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    dispatch_queue_t v10 = +[BRCUserDefaults defaultsForMangledID:0];
    [v10 cacheDeleteRecomputeInterval];
    double v12 = v11;

    if (v6 && v9 < v12)
    {
      uint64_t v13 = [v5 objectForKeyedSubscript:@"purgeableSpace"];
      uint64_t v14 = [v5 objectForKeyedSubscript:@"nonPurgeableSpace"];
      dispatch_time_t v15 = (void *)v14;
      if (v13 && v14)
      {
        char v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2112;
          v62 = v16;
          _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] returning purgeable info from cache\npurgeableSpaceByUrgency:%@\nnonPurgeableSpace:%@%@", buf, 0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:

        return;
      }
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] could not retrieve cached purgeable space%@", buf, 0xCu);
      }
    }
    memset(v60, 0, sizeof(v60));
    __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer computePurgeableSpaceForAllUrgenciesWithReply:]_block_invoke", 145, v60);
    uint64_t v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(v60, (uint64_t)v20, v21);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v62 = 0;
    v22 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    objc_super v23 = [v22 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15;
    block[3] = &unk_1E6996218;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = buf;
    dispatch_sync(v23, block);

    v24 = [*(id *)(*(void *)(a1 + 32) + 8) serverDB];
    id v25 = [v24 serialQueue];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2;
    v58[3] = &unk_1E6996218;
    v58[4] = *(void *)(a1 + 32);
    v58[5] = buf;
    dispatch_sync(v25, v58);

    __int16 v26 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v27 = [v26 dbReclaimableSpaceThreshold];

    *(void *)(*(void *)&buf[8] + 24) = (*(void *)(*(void *)&buf[8] + 24) - v27) & ~((*(void *)(*(void *)&buf[8] + 24)
                                                                                               - v27) >> 63);
    __int16 v28 = brc_bread_crumbs();
    long long v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)&buf[8] + 24) context:0];
      objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3();
    }

    uint64_t v30 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
    uint64_t v31 = [v30 purgableSpace];

    v32 = brc_bread_crumbs();
    uint64_t v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:v31 context:0];
      objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2();
    }

    uint64_t v34 = [*(id *)(a1 + 32) _computeCiconiaSizeInBytes:0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_18;
    v57[3] = &unk_1E699BB58;
    v57[4] = *(void *)(a1 + 32);
    v35 = (void (**)(void, void, void))MEMORY[0x1D94389C0](v57);
    __int16 v36 = [*(id *)(*(void *)(a1 + 32) + 8) expensiveReadOnlyDB];
    if ([*(id *)(*(void *)(a1 + 32) + 8) hasOptimizeStorageEnabled])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
      v37 = [v36 serialQueue];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_3;
      v50[3] = &unk_1E699BBD0;
      v50[4] = *(void *)(a1 + 32);
      id v51 = v36;
      v54 = buf;
      uint64_t v55 = v31;
      uint64_t v56 = v34;
      v52 = v35;
      id v53 = *(id *)(a1 + 40);
      dispatch_async(v37, v50);
    }
    else
    {
      uint64_t v38 = brc_bread_crumbs();
      v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1();
      }

      v40 = objc_opt_new();
      uint64_t v41 = v34 + v31;
      v42 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
      [v40 setObject:v42 forKeyedSubscript:&unk_1F2B276C0];

      v43 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
      [v40 setObject:v43 forKeyedSubscript:&unk_1F2B276D8];

      v44 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
      [v40 setObject:v44 forKeyedSubscript:&unk_1F2B276F0];

      uint64_t v45 = [*(id *)(a1 + 32) nonPurgeableSizeWithPurgeableSize:v41 + *(void *)(*(void *)&buf[8] + 24)];
      v46 = [NSNumber numberWithUnsignedLongLong:v45];
      ((void (**)(void, void *, void *))v35)[2](v35, v40, v46);

      uint64_t v47 = *(void *)(a1 + 40);
      v48 = [NSNumber numberWithUnsignedLongLong:v45];
      (*(void (**)(uint64_t, void *, void *, void))(v47 + 16))(v47, v40, v48, 0);
    }
    _Block_object_dispose(buf, 8);
    __brc_leave_section(v60);
    goto LABEL_28;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 autovacuumableSpaceInBytes];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) serverDB];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 autovacuumableSpaceInBytes];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  double v8 = [v7 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_19;
  block[3] = &unk_1E6993600;
  void block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v8, block);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_19(void *a1)
{
  id v4 = [*(id *)(a1[4] + 8) clientState];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setObject:v2 forKeyedSubscript:@"purgeableSpaceDate"];

  [v4 setObject:a1[5] forKeyedSubscript:@"purgeableSpace"];
  [v4 setObject:a1[6] forKeyedSubscript:@"nonPurgeableSpace"];
  uint64_t v3 = [*(id *)(a1[4] + 8) clientDB];
  [v3 forceBatchStart];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) computeTotalLiveDocumentSizeWithDb:*(void *)(a1 + 40)];
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:1];
  double v4 = v3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:2];
  double v6 = v5;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:3];
  double v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  double v11 = *(void **)(v9 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_4;
  v13[3] = &unk_1E699BBA8;
  uint64_t v12 = *(void *)(a1 + 64);
  v13[4] = v9;
  uint64_t v16 = v12;
  long long v17 = *(_OWORD *)(a1 + 72);
  uint64_t v18 = v2;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  [v11 computeTotalEvictableSizeWithAccessLowTimeDelta:v10 medTimeDelta:v13 highTimeDelta:v4 db:v6 reply:v8];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5;
  block[3] = &unk_1E699BB80;
  uint64_t v11 = *(void *)(a1 + 56);
  id v17 = v9;
  uint64_t v21 = v11;
  long long v22 = *(_OWORD *)(a1 + 64);
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v25 = a4;
  uint64_t v26 = v12;
  id v19 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v20 = v13;
  uint64_t v18 = v14;
  id v15 = v9;
  dispatch_async(v10, block);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    uint64_t v2 = objc_opt_new();
    double v3 = [NSNumber numberWithUnsignedLongLong:a1[9] + a1[10] + a1[11] + *(void *)(*(void *)(a1[8] + 8) + 24)];
    [v2 setObject:v3 forKeyedSubscript:&unk_1F2B276C0];

    double v4 = [NSNumber numberWithUnsignedLongLong:a1[9] + a1[10] + a1[12] + *(void *)(*(void *)(a1[8] + 8) + 24)];
    [v2 setObject:v4 forKeyedSubscript:&unk_1F2B276D8];

    double v5 = [NSNumber numberWithUnsignedLongLong:a1[9] + a1[10] + a1[13] + *(void *)(*(void *)(a1[8] + 8) + 24)];
    [v2 setObject:v5 forKeyedSubscript:&unk_1F2B276F0];

    uint64_t v6 = a1[14] - a1[13];
    if (v6 < 0)
    {
      double v7 = brc_bread_crumbs();
      double v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        uint64_t v15 = a1[13];
        uint64_t v16 = a1[14];
        int v17 = 134218498;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        long long v22 = v7;
        _os_log_fault_impl(&dword_1D353B000, v8, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: purgeable size is greater than non purgeable size (%lld > %lld)%@", (uint8_t *)&v17, 0x20u);
      }

      uint64_t v6 = 0;
    }
    uint64_t v9 = a1[6];
    uint64_t v10 = [NSNumber numberWithLongLong:v6];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v2, v10);

    uint64_t v11 = a1[7];
    uint64_t v12 = [NSNumber numberWithLongLong:v6];
    (*(void (**)(uint64_t, void *, void *, void))(v11 + 16))(v11, v2, v12, 0);

    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5_cold_1();
    }
  }
  *(unsigned char *)(a1[5] + 41) = 0;
}

- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "brc_ciconiaDumpDirForCurrentPersona");
  unsigned __int8 v41 = 0;
  uint64_t v6 = [v5 path];
  int v7 = [v4 fileExistsAtPath:v6 isDirectory:&v41];
  int v8 = v41;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = [v5 path];
    uint64_t v12 = [v4 attributesOfItemAtPath:v11 error:0];
    id v13 = [v12 fileCreationDate];

    [v13 timeIntervalSinceNow];
    int64_t v10 = 0;
    if (fabs(v14) > 86400.0)
    {
      BOOL v32 = v3;
      uint64_t v33 = v13;
      uint64_t v15 = *MEMORY[0x1E4F1C5F8];
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C5F8]];
      uint64_t v34 = v4;
      int v17 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v16 options:0 errorHandler:0];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id v21 = 0;
        int64_t v10 = 0;
        uint64_t v22 = *(void *)v38;
        do
        {
          uint64_t v23 = 0;
          uint64_t v24 = v21;
          do
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v18);
            }
            uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
            id v36 = 0;
            int v26 = [v25 getResourceValue:&v36 forKey:v15 error:0];
            id v21 = v36;

            if (v26) {
              v10 += [v21 unsignedLongLongValue];
            }
            ++v23;
            uint64_t v24 = v21;
          }
          while (v20 != v23);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v20);
      }
      else
      {
        id v21 = 0;
        int64_t v10 = 0;
      }

      if (v32)
      {
        id v35 = 0;
        double v4 = v34;
        char v27 = [v34 removeItemAtURL:v5 error:&v35];
        id v28 = v35;
        if ((v27 & 1) == 0)
        {
          long long v29 = brc_bread_crumbs();
          uint64_t v30 = brc_default_log();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u)) {
            -[BRCDiskSpaceReclaimer _computeCiconiaSizeInBytes:]();
          }

          int64_t v10 = 0;
        }
      }
      else
      {
        double v4 = v34;
      }

      id v13 = v33;
    }
  }
  return v10;
}

- (int64_t)_dbSizeInBytes:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    double v5 = [v3 serialQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke;
    v8[3] = &unk_1E6996218;
    int64_t v10 = &v11;
    id v9 = v4;
    dispatch_sync(v5, v8);

    int64_t v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

uint64_t __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) sizeInBytes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3
{
  id v3 = a3;
  double v4 = [v3 serialQueue];

  if (v4)
  {
    double v5 = [v3 serialQueue];
    dispatch_assert_queue_not_V2(v5);
  }
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    int64_t v6 = [v3 serialQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke;
    v9[3] = &unk_1E6996218;
    uint64_t v11 = &v12;
    id v10 = v3;
    dispatch_sync(v6, v9);

    int64_t v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

uint64_t __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) autovacuumableSpaceInBytes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_fullVacuumIfPossible:(id)a3
{
  id v4 = a3;
  double v5 = [v4 serialQueue];

  if (v5)
  {
    int64_t v6 = [v4 serialQueue];
    dispatch_assert_queue_not_V2(v6);
  }
  if (v4) {
    int64_t v7 = [(BRCDiskSpaceReclaimer *)self _doIncrementalVacuum:v4 amount:[(BRCDiskSpaceReclaimer *)self _dbAutovacuumableSpaceInBytes:v4]];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [v6 serialQueue];

  if (v7)
  {
    int v8 = [v6 serialQueue];
    dispatch_assert_queue_not_V2(v8);
  }
  uint64_t v22 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v9 = [v22 dbAutovacuumBatchSize];
  if (v9) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = a4;
  }
  mach_absolute_time();
  uint64_t v11 = [(BRCDiskSpaceReclaimer *)self _dbSizeInBytes:v6];
  if (a4 >= 1)
  {
    int64_t v12 = 0;
    do
    {
      uint64_t v13 = [v6 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke;
      block[3] = &unk_1E6997600;
      id v24 = v6;
      int64_t v25 = a4;
      int64_t v26 = v12;
      int64_t v27 = v10;
      dispatch_sync(v13, block);

      v12 += v10;
    }
    while (v12 < a4);
  }
  int64_t v14 = v11 - [(BRCDiskSpaceReclaimer *)self _dbSizeInBytes:v6];
  mach_absolute_time();
  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [v6 label];
    brc_monotonic_time_diff_to_interval();
    uint64_t v19 = v18;
    uint64_t v20 = +[BRCDumpContext stringFromByteCount:v14 context:0];
    *(_DWORD *)buf = 138413314;
    long long v29 = v17;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    __int16 v32 = 2112;
    uint64_t v33 = v20;
    __int16 v34 = 2048;
    double v35 = (double)v14 * 100.0 / (double)v11;
    __int16 v36 = 2112;
    long long v37 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] Incremental vacuuming %@ took %f seconds reclaimed %@ (size reduction %.2f percent)%@", buf, 0x34u);
  }
  return v14;
}

uint64_t __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 40) - v1 >= *(void *)(a1 + 56)) {
    uint64_t v2 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v2 = *(void *)(a1 + 40) - v1;
  }
  return [*(id *)(a1 + 32) incrementalVacuum:v2];
}

- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5
{
  id v8 = a3;
  int64_t v9 = [(BRCDiskSpaceReclaimer *)self _dbAutovacuumableSpaceInBytes:v8];
  if (v8)
  {
    if (a5 < 3 || 2 * v9 >= a4) {
      int64_t v10 = [(BRCDiskSpaceReclaimer *)self _doIncrementalVacuum:v8 amount:a4];
    }
    else {
      int64_t v10 = [(BRCDiskSpaceReclaimer *)self _fullVacuumIfPossible:v8];
    }
    int64_t v11 = v10;
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)_asyncAutovacuumIfNeeds:(id)a3
{
  id v4 = a3;
  double v5 = [v4 serialQueue];
  if (v5)
  {
    session = self->_session;
    if (session)
    {
      if (![(BRCAccountSession *)session isCancelled])
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke;
        block[3] = &unk_1E6993698;
        id v8 = v4;
        dispatch_async(v5, block);
      }
    }
  }
}

uint64_t __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autovacuumIfNeeded];
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:](a3, (uint64_t)v15, v16);
    }

    int v17 = +[BRCSystemResourcesManager manager];
    int v18 = [v17 connectedToPowerSource];

    if (v18)
    {
      uint64_t v19 = [(BRCAccountSession *)self->_session clientDB];
      [(BRCDiskSpaceReclaimer *)self _asyncAutovacuumIfNeeds:v19];

      uint64_t v20 = [(BRCAccountSession *)self->_session serverDB];
      [(BRCDiskSpaceReclaimer *)self _asyncAutovacuumIfNeeds:v20];
    }
    return 0;
  }
  else
  {
    uint64_t v6 = *(void *)&a4;
    int64_t v7 = [(BRCAccountSession *)self->_session stageRegistry];
    int64_t v8 = [v7 purgeSpace:a3 withUrgency:v6];

    if (v8 >= a3)
    {
      id v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.5(v8, (uint64_t)v21, v22);
      }
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2020000000;
      uint64_t v45 = 0;
      if ([(BRCAccountSession *)self->_session hasOptimizeStorageEnabled])
      {
        int64_t v9 = brc_task_tracker_create("com.apple.bird.eviction");
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        __int16 v36 = __59__BRCDiskSpaceReclaimer__purgeSpaceUnderQueue_withUrgency___block_invoke;
        long long v37 = &unk_1E699BBF8;
        int64_t v10 = v9;
        uint64_t v38 = v10;
        long long v39 = &v42;
        int64_t v40 = v8;
        int64_t v41 = a3;
        [(BRCDiskSpaceReclaimer *)self _enumerateItemsForEvictSyncWithBlock:&v34 withUrgency:v6];
        dispatch_time_t v11 = dispatch_time(0, 60000000000);
        if (brc_task_tracker_wait_timeout((uint64_t)v10, v11))
        {
          int64_t v12 = brc_bread_crumbs();
          uint64_t v13 = brc_default_log();
          if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
            -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:]();
          }

          v43[3] = 0;
        }
        int64_t v14 = v38;
      }
      else
      {
        int64_t v10 = brc_bread_crumbs();
        int64_t v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.4();
        }
      }

      uint64_t v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:v43[3] context:0];
        objc_claimAutoreleasedReturnValue();
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:]();
      }

      v8 += v43[3];
      if (a3 > v8)
      {
        int64_t v25 = [(BRCAccountSession *)self->_session clientDB];
        int64_t v26 = [(BRCDiskSpaceReclaimer *)self _vacuumDB:v25 amount:a3 - v8 withUrgency:v6];

        v8 += v26;
      }
      int64_t v27 = a3 - v8;
      if (a3 > v8)
      {
        id v28 = [(BRCAccountSession *)self->_session serverDB];
        int64_t v29 = [(BRCDiskSpaceReclaimer *)self _vacuumDB:v28 amount:v27 withUrgency:v6];

        v8 += v29;
      }
      __int16 v30 = [(BRCAccountSession *)self->_session clientState];
      [v30 setObject:0 forKeyedSubscript:@"purgeableSpaceDate"];

      uint64_t v31 = [(BRCAccountSession *)self->_session clientState];
      [v31 setObject:0 forKeyedSubscript:@"purgeableSpace"];

      __int16 v32 = [(BRCAccountSession *)self->_session clientState];
      [v32 setObject:0 forKeyedSubscript:@"nonPurgeableSpace"];

      _Block_object_dispose(&v42, 8);
    }
  }
  return v8;
}

BOOL __59__BRCDiskSpaceReclaimer__purgeSpaceUnderQueue_withUrgency___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v11 = 0;
  int v5 = [v3 evictInTask:v4 options:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    int64_t v7 = [v3 currentVersion];
    *(void *)(*(void *)(a1[5] + 8) + 24) += [v7 size];
  }
  else
  {
    int64_t v7 = brc_bread_crumbs();
    int64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      int v17 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't evict %@: %@%@", buf, 0x20u);
    }
  }
  BOOL v9 = *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6] < a1[7];

  return v9;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v9 = 0;
  int64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_1E699BC20;
  v7[4] = self;
  void v7[5] = &v9;
  v7[6] = a3;
  int v8 = a4;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[40])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 _purgeSpaceUnderQueue:*(void *)(a1 + 48) withUrgency:*(unsigned int *)(a1 + 56)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) _computeCiconiaSizeInBytes:1];
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int64_t v5 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) context:0];
      id v6 = +[BRCDumpContext stringFromByteCount:*(void *)(a1 + 48) context:0];
      int v7 = *(_DWORD *)(a1 + 56);
      int v8 = 138413058;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Purged %@ when asked to purge %@ for urgency %d%@", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (int64_t)periodicReclaimSpace
{
  id v3 = self->_session;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke;
  block[3] = &unk_1E69935B0;
  uint64_t v9 = v3;
  __int16 v10 = &v11;
  void block[4] = self;
  int64_t v5 = v3;
  dispatch_sync(queue, block);
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    id v3 = [*(id *)(v1 + 8) stageRegistry];
    uint64_t v4 = [v3 purgeSpace:0x7FFFFFFFFFFFFFFFLL withUrgency:4294967294];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = a1 + 48;
    *(void *)(*(void *)(v6 + 8) + 24) += v4;

    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [*(id *)(v5 - 16) _computeCiconiaSizeInBytes:1];
    int v7 = [*(id *)(v5 - 8) clientDB];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2;
    v14[3] = &unk_1E6993A60;
    id v15 = *(id *)(v5 - 8);
    [v7 performWithFlags:1 action:v14];

    int v8 = *(void **)(v5 - 16);
    uint64_t v9 = [*(id *)(v5 - 8) clientDB];
    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [v8 _fullVacuumIfPossible:v9];

    __int16 v10 = *(void **)(v5 - 16);
    uint64_t v11 = [*(id *)(v5 - 8) serverDB];
    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [v10 _fullVacuumIfPossible:v11];

    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(v5, (uint64_t)v12, v13);
    }
  }
}

uint64_t __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fsReader];
  [v2 deleteExpiredJobs];

  id v3 = [*(id *)(a1 + 32) fsUploader];
  [v3 deleteExpiredJobs];

  uint64_t v4 = [*(id *)(a1 + 32) fsDownloader];
  [v4 deleteExpiredJobs];

  uint64_t v5 = [*(id *)(a1 + 32) applyScheduler];
  [v5 deleteExpiredJobs];

  uint64_t v6 = [*(id *)(a1 + 32) syncUpScheduler];
  [v6 deleteExpiredJobs];

  int v7 = [*(id *)(a1 + 32) analyticsReporter];
  [v7 deleteMissingErrorThrottles];

  return 1;
}

- (int)urgencyForCacheDeleteUrgency:(int)a3
{
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  [v5 assertOnQueue];

  if ((a3 - 1) >= 2 && a3 != 4)
  {
    if (a3 == 3)
    {
      uint64_t v6 = +[BRCUserDefaults defaultsForMangledID:0];
      uint64_t v7 = [v6 minimumDiskSpaceRequiredToDownload];

      session = self->_session;
      a3 = 3;
      if (session)
      {
        uint64_t v9 = [(BRCAccountSession *)session downloadTrackers];
        unint64_t v10 = [v9 spaceRequiredForTrackers] + v7;
        BOOL v11 = v10 > [(BRCAccountSession *)self->_session availableDiskSpaceUsingCache:0];

        if (v11) {
          return 4;
        }
        else {
          return 3;
        }
      }
    }
    else
    {
      return 3;
    }
  }
  return a3;
}

+ (double)accessTimeDeltaForUrgency:(int)a3
{
  double v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInLowUrgency];
      goto LABEL_6;
    case 2:
      uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInMedUrgency];
      goto LABEL_6;
    case 3:
      uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInHighUrgency];
      goto LABEL_6;
    case 4:
      uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInVeryHighUrgency];
LABEL_6:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  session = self->_session;
  id v6 = a4;
  uint64_t v7 = [(BRCAccountSession *)session fileUnlinker];
  LOBYTE(v4) = [v7 renameAndUnlinkInBackgroundItemAt:v4 path:v6];

  return v4;
}

- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(BRCAccountSession *)self->_session clientState];
  double v5 = [v4 objectForKeyedSubscript:@"purgeableSpace"];
  id v6 = [NSNumber numberWithInt:v3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 longLongValue];

  return v8;
}

- (int64_t)cachedNonPurgeableSpace
{
  uint64_t v2 = [(BRCAccountSession *)self->_session clientState];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"nonPurgeableSpace"];
  int64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = brc_task_tracker_create("com.apple.bird.eviction");
  brc_bread_crumbs();
  unint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v25 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting for storage optimization%@", buf, 0xCu);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __89__BRCDiskSpaceReclaimer_performOptimizeStorageWithTimeDelta_onDiskAccessTimeDelta_error___block_invoke;
  v22[3] = &unk_1E699BC48;
  id v12 = v9;
  id v23 = v12;
  [(BRCDiskSpaceReclaimer *)self _enumerateItemsForEvictSyncWithBlock:v22 withTimeDelta:a3 onDiskAccessTimeDelta:a4];
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  intptr_t v14 = brc_task_tracker_wait_timeout((uint64_t)v12, v13);
  if (v14)
  {
    id v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:]();
    }

    int v17 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"timed out waiting for eviction");
    if (v17)
    {
      uint64_t v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        id v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int64_t v25 = "-[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:]";
        __int16 v26 = 2080;
        if (!a5) {
          id v21 = "(ignored by caller)";
        }
        int64_t v27 = v21;
        __int16 v28 = 2112;
        int64_t v29 = v17;
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v17;
    }
  }
  return v14 == 0;
}

uint64_t __89__BRCDiskSpaceReclaimer_performOptimizeStorageWithTimeDelta_onDiskAccessTimeDelta_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  char v5 = [v3 evictInTask:v4 options:1 error:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = brc_bread_crumbs();
    int64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v12 = v3;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't evict %@: %@%@", buf, 0x20u);
    }
  }
  return 1;
}

- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]((uint64_t)v12, v13);
    }

LABEL_14:
    unint64_t v6 = 0;
    goto LABEL_24;
  }
  id v4 = v3;
  char v5 = (const char *)[v4 fileSystemRepresentation];
  unint64_t v6 = (unint64_t)v5;
  if (v5)
  {
    int v7 = open(v5, 1048832);
    if ((v7 & 0x80000000) == 0)
    {
      int v8 = v7;
      long long v18 = 0u;
      *(_OWORD *)&buf[8] = 0u;
      *(void *)buf = 1;
      if (ffsctl(v7, 0xC0284A20uLL, buf, 0) < 0
        && (*__error() != 45
         || (v16[0] = 0, ffsctl(v8, 0x80084A02uLL, v16, 0) < 0)
         || ffsctl(v8, 0xC0284A20uLL, buf, 0) < 0))
      {
        v16[0] = 0;
        v16[1] = 0;
        if (dirstat_np())
        {
          uint64_t v9 = brc_bread_crumbs();
          id v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            [(BRCDiskSpaceReclaimer *)(uint64_t)v4 _recursivelySizeDirectoryAtPath:v10];
          }
          unint64_t v6 = 0;
          goto LABEL_23;
        }
        unint64_t v6 = v16[0];
        uint64_t v9 = brc_bread_crumbs();
        id v10 = brc_default_log();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_23:

          close(v8);
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&long long v18 = v9;
        BOOL v11 = "[DEBUG] space for %@ is %llu bytes (hfs compat. dirstat)%@";
      }
      else
      {
        unint64_t v6 = v18;
        uint64_t v9 = brc_bread_crumbs();
        id v10 = brc_default_log();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&long long v18 = v9;
        BOOL v11 = "[DEBUG] space for %@ is %llu bytes (apfs dirstat)%@";
      }
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0x20u);
      goto LABEL_23;
    }
    id v12 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]();
    }

    goto LABEL_14;
  }
LABEL_24:

  return v6;
}

- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3
{
  unint64_t v4 = [(BRCDiskSpaceReclaimer *)self totalSize];
  if (v4 >= a3) {
    return v4 - a3;
  }
  else {
    return 0;
  }
}

- (unint64_t)totalSize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(BRCAccountSession *)self->_session sessionDirPath];
  unint64_t v4 = [(BRCDiskSpaceReclaimer *)self _recursivelySizeDirectoryAtPath:v3];

  char v5 = [(BRCAccountSession *)self->_session cacheDirPath];
  unint64_t v6 = [(BRCDiskSpaceReclaimer *)self _recursivelySizeDirectoryAtPath:v5] + v4;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v7 = [(BRCAccountSession *)self->_session roots];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) absolutePath];
        v6 += [(BRCDiskSpaceReclaimer *)self _recursivelySizeDirectoryAtPath:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_purgePacer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] non-purgeable space was updated to %@%@");
}

void __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] CacheDelete purge request succeeded: %@%@");
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] not account for local document because optimize storage is set to off%@", v1, 0xCu);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] reclaimable size from stage is %@%@", v5);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] reclaimable size from db is %@%@", v5);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, (uint64_t)a3, "[DEBUG] ┏%llx recomputing purgeable space for all urgencies%@", (uint8_t *)&v4);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, (uint64_t)v0, "[DEBUG] computed purgable space by urgency: %@%@", v1);
}

- (void)_computeCiconiaSizeInBytes:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed removing ciconia_diagnose: %@%@", v1, 0x16u);
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = +[BRCDumpContext stringFromByteCount:a1 context:0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v5, "[DEBUG] no need to evict, amount requested is %@%@", v6);
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.2()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] evicted %@ from stage and containers%@", v5);
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Timed out waiting for eviction!%@", v1, 0xCu);
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] not evicting document because optimize storage is off%@", v1, 0xCu);
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[BRCDumpContext stringFromByteCount:a1 context:0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v5, "[DEBUG] evicted %@ from stage%@", v6);
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(*(void *)a1 + 8) + 24) context:0];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v6, "[DEBUG] Periodicly reclaimed %@%@", (uint8_t *)&v7);
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: calling %s with empty path%@", (uint8_t *)&v2, 0x16u);
}

- (void)_recursivelySizeDirectoryAtPath:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't open %@%@", v1, 0x16u);
}

- (void)_recursivelySizeDirectoryAtPath:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __error();
  int v7 = strerror(*v6);
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't get size for %@ : %s%@", (uint8_t *)&v8, 0x20u);
}

@end