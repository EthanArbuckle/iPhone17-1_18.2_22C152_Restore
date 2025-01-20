@interface BRCPendingChangesStream
- (BOOL)_dropExistingTablesWithDB:(id)a3;
- (BOOL)_finishedFetchingRecordMetadata:(id)a3 withDB:(id)a4;
- (BOOL)_saveSubResourceRecord:(id)a3 withDB:(id)a4;
- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)enumerateRecordsNeedingMetadataFetchWithBlock:(id)a3;
- (BOOL)enumerateRecordsNeedingXattrFetchWithBlock:(id)a3;
- (BOOL)enumerateRecordsOfType:(int64_t)a3 block:(id)a4;
- (BOOL)hasBeenCreated;
- (BOOL)hasFetchRecordByID:(id)a3;
- (BOOL)hasRecordDeletes;
- (BOOL)hasRecordIDBlockedOnSubResources:(id)a3;
- (BOOL)hasRecordIDsToDeserialize;
- (BOOL)hasSubResourceRecords;
- (BOOL)hasXattrsToFetch;
- (BOOL)saveEditedRecords:(id)a3 deletedRecordIDs:(id)a4 deletedShareIDs:(id)a5 subResourceEditedRecords:(id)a6 serverChangeToken:(id)a7 clientChangeToken:(int64_t)a8;
- (BOOL)saveEditedRecords:(id)a3 subResourceEditedRecords:(id)a4 queryCursor:(id)a5;
- (BOOL)saveSubResourceRecords:(id)a3 afterSavingMainTableItems:(id)a4 queryCursor:(id)a5;
- (BOOL)unblockRecord:(id)a3 waitingOnRecord:(id)a4;
- (BRCPendingChangesStream)initWithServerZone:(id)a3;
- (id)_getChangesStreamSafeDBHolder;
- (id)_initDeltaSyncWithChangeToken:(id)a3 serverZone:(id)a4;
- (id)initForListingWithParent:(id)a3 serverZone:(id)a4;
- (id)lastError;
- (int64_t)_recordTypeFromRecordID:(id)a3 isShare:(BOOL)a4 isDelete:(BOOL)a5;
- (int64_t)copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:(id)a3;
- (void)_closeChangeStream;
- (void)_createSchemaIfNecessary;
- (void)_dbBecameCorrupted:(id)a3 withDescription:(id)a4;
- (void)_getChangesStreamSafeDBHolder;
- (void)_openDB;
- (void)_wasClosed;
- (void)destroyDatabase;
- (void)fetchQueryCursor:(id)a3;
- (void)fetchTokenState:(id)a3;
- (void)finishedFetchingXattrSignatures:(id)a3;
- (void)unblockRecordSavesWaitingOnRecordID:(id)a3;
@end

@implementation BRCPendingChangesStream

- (id)_getChangesStreamSafeDBHolder
{
  if (_getChangesStreamSafeDBHolder_onceToken != -1) {
    dispatch_once(&_getChangesStreamSafeDBHolder_onceToken, &__block_literal_global_51);
  }
  id v3 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v3);
  v4 = [(id)_pendingChangesStreamPool objectForKey:self];

  if (!v4)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCPendingChangesStream _getChangesStreamSafeDBHolder]();
    }

    [(BRCPendingChangesStream *)self _openDB];
  }
  v7 = self->_dbSafeHolder;
  v8 = (void *)_pendingChangesStreamPool;
  v9 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v8 setObject:v9 forKey:self];

  v10 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v11 = [v10 pendingChangesStreamSoftOpenCount];

  v12 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v13 = [v12 pendingChangesStreamHardOpenCount];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_103;
  v35[3] = &__block_descriptor_40_e5_v8__0l;
  v35[4] = v11;
  v14 = (void (**)(void))MEMORY[0x1D94389C0](v35);
  if ([(id)_pendingChangesStreamPool count] <= v13)
  {
    if ([(id)_pendingChangesStreamPool count] > v11 && !_getChangesStreamSafeDBHolder__closeChangesTimer)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCPendingChangesStream _getChangesStreamSafeDBHolder]();
      }

      v19 = [(BRCClientZone *)self->_clientZone db];
      v20 = [v19 serialQueue];
      dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v20);
      v22 = (void *)_getChangesStreamSafeDBHolder__closeChangesTimer;
      _getChangesStreamSafeDBHolder__closeChangesTimer = (uint64_t)v21;

      v23 = +[BRCUserDefaults defaultsForMangledID:0];
      unint64_t v24 = [v23 pendingChangesStreamCloseDelay];

      v25 = _getChangesStreamSafeDBHolder__closeChangesTimer;
      dispatch_time_t v26 = dispatch_time(0, v24);
      dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, v24 / 0xA);
      id v27 = (id)_getChangesStreamSafeDBHolder__closeChangesTimer;
      v28 = v14;
      v29 = v27;
      v30 = v28;
      v31 = v30;
      v32 = v30;
      if (*MEMORY[0x1E4F59658])
      {
        v32 = ((void (*)(void))*MEMORY[0x1E4F59658])(v30);
      }
      dispatch_block_t v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v32);
      dispatch_source_set_event_handler(v29, v33);

      dispatch_resume((dispatch_object_t)_getChangesStreamSafeDBHolder__closeChangesTimer);
    }
  }
  else
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCPendingChangesStream _getChangesStreamSafeDBHolder]();
    }

    v14[2](v14);
  }

  objc_sync_exit(v3);
  return v7;
}

void __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)_pendingChangesStreamPool;
  _pendingChangesStreamPool = v0;
}

void __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_103(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v2);
  id v3 = NSAllMapTableKeys((NSMapTable *)_pendingChangesStreamPool);
  v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_106];
  uint64_t v5 = 0;
  *(void *)&long long v6 = 138412546;
  long long v12 = v6;
  while (1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5 + v7 >= (unint64_t)objc_msgSend(v4, "count", v12)) {
      break;
    }
    v8 = [v4 objectAtIndex:v5];
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v12;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Closing changes stream %@%@", buf, 0x16u);
    }

    [v8 _closeChangeStream];
    ++v5;
  }
  if (_getChangesStreamSafeDBHolder__closeChangesTimer)
  {
    dispatch_source_cancel((dispatch_source_t)_getChangesStreamSafeDBHolder__closeChangesTimer);
    unint64_t v11 = (void *)_getChangesStreamSafeDBHolder__closeChangesTimer;
    _getChangesStreamSafeDBHolder__closeChangesTimer = 0;
  }
  objc_sync_exit(v2);
}

uint64_t __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)_pendingChangesStreamPool;
  id v5 = a3;
  long long v6 = [v4 objectForKey:a2];
  uint64_t v7 = [(id)_pendingChangesStreamPool objectForKey:v5];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

- (void)_wasClosed
{
  self->_dbHasOpened = 0;
  id obj = (id)_pendingChangesStreamPool;
  objc_sync_enter(obj);
  [(id)_pendingChangesStreamPool removeObjectForKey:self];
  objc_sync_exit(obj);
}

- (void)_dbBecameCorrupted:(id)a3 withDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_error, a3);
  id v9 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v9);
  BOOL dbHasOpened = self->_dbHasOpened;
  [(BRCPendingChangesStream *)self _wasClosed];
  objc_sync_exit(v9);

  if (dbHasOpened)
  {
    unint64_t v11 = [0 db];
    char v12 = [v11 isInTransaction];

    if ((v12 & 1) == 0)
    {
      id v24 = 0;
      char v13 = [0 closeWithError:&v24];
      id v14 = v24;
      if ((v13 & 1) == 0)
      {
        __int16 v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:]();
        }

        uint64_t v17 = [v14 domain];
        if ([v17 isEqualToString:*MEMORY[0x1E4FBA910]])
        {
          uint64_t v18 = [v14 code];

          if (v18 == 5)
          {
            v19 = brc_bread_crumbs();
            v20 = brc_default_log();
            if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
              -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:]();
            }

            goto LABEL_16;
          }
        }
        else
        {
        }
      }
    }
  }
  dispatch_source_t v21 = [(BRCClientZone *)self->_clientZone session];
  id v14 = [v21 diskReclaimer];

  v19 = [(NSURL *)self->_databaseURL path];
  v22 = brc_bread_crumbs();
  v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:]();
  }

  [v14 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v19];
LABEL_16:
}

- (id)_initDeltaSyncWithChangeToken:(id)a3 serverZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BRCPendingChangesStream;
  id v9 = [(BRCPendingChangesStream *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingChangeToken, a3);
    uint64_t v11 = [v8 clientZone];
    clientZone = v10->_clientZone;
    v10->_clientZone = (BRCClientZone *)v11;

    objc_storeStrong((id *)&v10->_serverZone, a4);
    char v13 = [v8 session];
    id v14 = [v13 stageRegistry];
    startingChangeToken = v10->_startingChangeToken;
    v16 = [v8 zoneID];
    uint64_t v17 = [v14 pendingDeltaFetchRecordDirWithStartingChangeToken:startingChangeToken recordZoneID:v16];
    databaseURL = v10->_databaseURL;
    v10->_databaseURL = (NSURL *)v17;

    v10->_hasBeenCreated = [(NSURL *)v10->_databaseURL checkResourceIsReachableAndReturnError:0];
    v19 = [v8 mangledID];
    v20 = NSString;
    dispatch_source_t v21 = [v19 appLibraryOrZoneName];
    uint64_t v22 = [v20 stringWithFormat:@"change-stream/%@", v21];
    label = v10->_label;
    v10->_label = (NSString *)v22;
  }
  return v10;
}

- (BRCPendingChangesStream)initWithServerZone:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changeState];
  long long v6 = [v5 changeToken];
  id v7 = [(BRCPendingChangesStream *)self _initDeltaSyncWithChangeToken:v6 serverZone:v4];

  return v7;
}

- (id)initForListingWithParent:(id)a3 serverZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BRCPendingChangesStream;
  id v8 = [(BRCPendingChangesStream *)&v30 init];
  if (v8)
  {
    id v9 = [v7 changeState];
    uint64_t v10 = [v9 changeToken];
    startingChangeToken = v8->_startingChangeToken;
    v8->_startingChangeToken = (CKServerChangeToken *)v10;

    v29 = [v7 session];
    char v12 = [v29 stageRegistry];
    uint64_t v13 = [v12 pendingListRecordDirWithStartingChangeToken:v6];
    databaseURL = v8->_databaseURL;
    v8->_databaseURL = (NSURL *)v13;

    v8->_hasBeenCreated = [(NSURL *)v8->_databaseURL checkResourceIsReachableAndReturnError:0];
    uint64_t v15 = [v7 clientZone];
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v15;

    v28 = NSString;
    uint64_t v17 = [v6 recordName];
    uint64_t v18 = [v6 zoneID];
    v19 = [v18 zoneName];
    v20 = [v6 zoneID];
    dispatch_source_t v21 = [v20 ownerName];
    char v22 = [v21 isEqualToString:*MEMORY[0x1E4F19C08]];
    if (v22)
    {
      v23 = &stru_1F2AC7720;
    }
    else
    {
      id v27 = [v6 zoneID];
      v23 = [v27 ownerName];
    }
    uint64_t v24 = [v28 stringWithFormat:@"list-dir/%@/%@%@", v17, v19, v23];
    label = v8->_label;
    v8->_label = (NSString *)v24;

    if ((v22 & 1) == 0)
    {
    }
  }

  return v8;
}

- (BOOL)_dropExistingTablesWithDB:(id)a3
{
  id v3 = a3;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCPendingChangesStream _dropExistingTablesWithDB:]();
  }

  if ([v3 execute:@"DROP TABLE IF EXISTS fetch_state"]
    && [v3 execute:@"DROP TABLE IF EXISTS list_state"]
    && [v3 execute:@"DROP TABLE IF EXISTS record_changes"])
  {
    char v6 = [v3 execute:@"DROP INDEX IF EXISTS \"record_changes/record_type\""];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_createSchemaIfNecessary
{
  id v3 = [(BRCSafeDBHolder *)self->_dbSafeHolder db];
  id v4 = [v3 userVersion];
  int v5 = [v4 intValue];

  if (v5 <= 1)
  {
    char v6 = [(BRCSafeDBHolder *)self->_dbSafeHolder db];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke;
    v7[3] = &unk_1E6999E28;
    int v8 = v5;
    v7[4] = self;
    [v6 performWithFlags:8 action:v7];
  }
}

uint64_t __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(_DWORD *)(a1 + 40) != 1 || [*(id *)(a1 + 32) _dropExistingTablesWithDB:v3])
    && [v3 execute:@"CREATE TABLE fetch_state (server_token blob, client_token integer)"]&& objc_msgSend(v3, "execute:", @"CREATE TABLE list_state (cont_token blob, completed integer not null)")&& objc_msgSend(v3, "execute:", @"CREATE TABLE record_changes (record_id text primary key, record_type integer not null, record blob)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX \"record_changes/record_type\" ON record_changes (record_type)")&& objc_msgSend(v3, "execute:", @"INSERT INTO fetch_state (server_token, client_token) VALUES (%@, NULL)",
                       *(void *)(*(void *)(a1 + 32) + 32))
    && [v3 execute:@"INSERT INTO list_state (cont_token, completed) VALUES (NULL, 0)"]&& objc_msgSend(v3, "execute:", @"CREATE TABLE records_needing_subresources (record_id text PRIMARY KEY, record_type integer not null, record blob, xattr_sig BLOB, record_id_needing_fetch text, record_id_blocking_save text)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX \"records_needing_subresources/xattr_sig\" ON records_needing_subresources(xattr_sig) WHERE xattr_sig IS NOT NULL")&& objc_msgSend(v3, "execute:", @"CREATE INDEX \"records_needing_subresources/record_id_needing_fetch\" ON records_needing_subresources(record_id_needing_fetch) WHERE record_id_needing_fetch IS NOT NULL")&& objc_msgSend(v3, "execute:", @"CREATE INDEX \"records_needing_subresources/record_id_blocking_save\" ON records_needing_subresources(record_id_blocking_save) WHERE record_id_blocking_save IS NOT NULL")
    && [v3 execute:@"CREATE TRIGGER \"records_needing_subresources/resources_finished\" AFTER UPDATE ON records_needing_subresources BEGIN INSERT INTO record_changes (record_id, record_type, record)  SELECT record_id, record_type, record  FROM records_needing_subresources WHERE xattr_sig IS NULL AND record_id_needing_fetch IS NULL AND record_id_blocking_save IS NULL AND record IS NOT NULL AND record_id = new.record_id; DELETE FROM records_needing_subresources WHERE xattr_sig IS NULL AND record_id_needing_fetch IS NULL AND record_id_blocking_save IS NULL AND record IS NOT NULL AND record_id = new.record_id; END"])
  {
    uint64_t v4 = [v3 execute:@"CREATE TRIGGER \"records_needing_subresources/unblock_save\" AFTER INSERT ON record_changes BEGIN UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = new.record_id AND new.record IS NOT NULL; END"];
  }
  else
  {
    uint64_t v4 = 0;
  }
  int v5 = +[BRCUserDefaults defaultsForMangledID:0];
  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v5, "sqliteCacheSize"));
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v5, "sqliteCacheSpill"));
  int v8 = (void *)MEMORY[0x1E4FBA908];
  id v9 = v6;
  uint64_t v10 = objc_msgSend(v8, "rawInjection:length:", objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"));
  char v11 = [v3 execute:@"PRAGMA cache_size = %@", v10];

  if ((v11 & 1) == 0)
  {
    char v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_2();
    }
  }
  id v14 = (void *)MEMORY[0x1E4FBA908];
  id v15 = v7;
  v16 = objc_msgSend(v14, "rawInjection:length:", objc_msgSend(v15, "UTF8String"), objc_msgSend(v15, "length"));
  char v17 = [v3 execute:@"PRAGMA cache_spill = %@", v16];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_1();
    }
  }
  if (v4) {
    uint64_t v4 = [v3 setUserVersion:2];
  }

  return v4;
}

- (void)_openDB
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] database is opening so creating at %@%@", buf, 0x16u);
}

void __34__BRCPendingChangesStream__openDB__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v6 = a4;
  id v7 = a3;
  int v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
    __34__BRCPendingChangesStream__openDB__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted:v7 withDescription:@"DB Corruption Handler of BRCPendingChangesStream"];

  v6[2](v6);
}

void __34__BRCPendingChangesStream__openDB__block_invoke_184(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  char v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    char v22 = v10;
    _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on pending sync db - %@ (%@)%@", (uint8_t *)&v17, 0x20u);
  }

  char v12 = [v9 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4FBA910]])
  {
    uint64_t v13 = [v9 code];

    if (v13 == 13)
    {
      id v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __34__BRCPendingChangesStream__openDB__block_invoke_184_cold_1();
      }

      exit(1);
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted:v9 withDescription:@"DB Error Handler of BRCPendingChangesStream"];
}

void __34__BRCPendingChangesStream__openDB__block_invoke_189(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  char v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    char v22 = v10;
    _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on pending sync db - %@ (%@)%@", (uint8_t *)&v17, 0x20u);
  }

  char v12 = [v9 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4FBA910]])
  {
    uint64_t v13 = [v9 code];

    if (v13 == 13)
    {
      id v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __34__BRCPendingChangesStream__openDB__block_invoke_184_cold_1();
      }

      exit(1);
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted:v9 withDescription:@"Auto Rollback Handler of BRCPendingChangesStream"];
}

- (void)_closeChangeStream
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ - Closing the database (setting to nil)%@");
}

- (void)fetchTokenState:(id)a3
{
  id v4 = a3;
  int v5 = (void (**)(void, void, void))v4;
  if (self->_hasBeenCreated)
  {
    char v6 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    id v7 = [(BRCClientZone *)self->_clientZone session];
    [v7 assertNotOnZoneMutex];

    if (!self->_error)
    {
      if (v6)
      {
        id v8 = [v6 db];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __43__BRCPendingChangesStream_fetchTokenState___block_invoke;
        v13[3] = &unk_1E6999E50;
        v13[4] = self;
        id v14 = v5;
        [v8 performWithFlags:1 action:v13];

        goto LABEL_7;
      }
      id v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCPendingChangesStream fetchTokenState:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Trying to fetch token state without a db");
      char v11 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v11;
    }
    v5[2](v5, 0, 0);
LABEL_7:

    goto LABEL_8;
  }
  (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
LABEL_8:
}

uint64_t __43__BRCPendingChangesStream_fetchTokenState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = (void *)[v4 fetch:@"SELECT server_token, client_token FROM fetch_state"];
  uint64_t v6 = [v5 next];
  if (v6)
  {
    id v7 = [v5 objectOfClass:objc_opt_class() atIndex:0];
    [v5 longLongAtIndex:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [v5 error];
    id v9 = (void *)v8;
    if (v8)
    {
      int v10 = 0;
      char v11 = (void *)v8;
    }
    else
    {
      uint64_t v12 = [v4 lastError];
      if (v12)
      {
        id v2 = (void *)v12;
        int v10 = 0;
        char v11 = (void *)v12;
      }
      else
      {
        uint64_t v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1();
        }

        char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: There should always be one entry");
        id v2 = 0;
        int v10 = 1;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v11);
    if (v10) {

    }
    if (!v9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }

  return v6;
}

- (void)fetchQueryCursor:(id)a3
{
  id v4 = a3;
  int v5 = (void (**)(void, void, void, void))v4;
  if (self->_hasBeenCreated)
  {
    uint64_t v6 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    id v7 = [(BRCClientZone *)self->_clientZone session];
    [v7 assertNotOnZoneMutex];

    if (!self->_error)
    {
      if (v6)
      {
        uint64_t v8 = [v6 db];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44__BRCPendingChangesStream_fetchQueryCursor___block_invoke;
        v13[3] = &unk_1E6999E50;
        v13[4] = self;
        id v14 = v5;
        [v8 performWithFlags:1 action:v13];

        goto LABEL_7;
      }
      id v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCPendingChangesStream fetchQueryCursor:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Trying to fetch query cursor without a db");
      char v11 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v11;
    }
    v5[2](v5, 0, 0, 0);
LABEL_7:

    goto LABEL_8;
  }
  (*((void (**)(id, void, void, void, void))v4 + 2))(v4, 0, 0, 0, 0);
LABEL_8:
}

uint64_t __44__BRCPendingChangesStream_fetchQueryCursor___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = (void *)[v4 fetch:@"SELECT cont_token, completed FROM list_state"];
  uint64_t v6 = [v5 next];
  if (v6)
  {
    id v7 = [v5 objectOfClass:objc_opt_class() atIndex:0];
    uint64_t v8 = [v5 objectOfClass:objc_opt_class() atIndex:1];
    [v8 BOOLValue];

    id v9 = (void *)[v4 fetchObjectOfClass:objc_opt_class() sql:@"SELECT server_token FROM fetch_state"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = [v5 error];
    char v11 = (void *)v10;
    if (v10)
    {
      int v12 = 0;
      uint64_t v13 = (void *)v10;
    }
    else
    {
      uint64_t v14 = [v4 lastError];
      if (v14)
      {
        id v2 = (void *)v14;
        int v12 = 0;
        uint64_t v13 = (void *)v14;
      }
      else
      {
        id v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1();
        }

        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: There should always be one entry");
        id v2 = 0;
        int v12 = 1;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v13);
    if (v12) {

    }
    if (!v11) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }

  return v6;
}

- (BOOL)enumerateRecordsOfType:(int64_t)a3 block:(id)a4
{
  id v6 = a4;
  if (self->_hasBeenCreated)
  {
    id v7 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v8 = [(BRCClientZone *)self->_clientZone session];
    [v8 assertNotOnZoneMutex];

    if (self->_error)
    {
      char v9 = 0;
    }
    else
    {
      if (v7)
      {
        error = [v7 db];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke;
        v15[3] = &unk_1E6999E78;
        int64_t v17 = a3;
        v15[4] = self;
        id v16 = v6;
        char v9 = [error performWithFlags:1 action:v15];
      }
      else
      {
        char v11 = brc_bread_crumbs();
        int v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BRCPendingChangesStream enumerateRecordsOfType:block:]();
        }

        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Trying to enumerate records without a db");
        uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue();
        char v9 = 0;
        error = self->_error;
        self->_error = v13;
      }
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

uint64_t __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 fetch:@"SELECT record_id, record FROM record_changes WHERE record_type = %d", a1[6]];
  while ([v4 next])
  {
    int v5 = (void *)MEMORY[0x1D9438760]();
    id v6 = [v4 objectOfClass:objc_opt_class() atIndex:0];
    id v7 = [v4 objectOfClass:objc_opt_class() atIndex:1];
    char v8 = (*(uint64_t (**)(void))(a1[5] + 16))();

    if ((v8 & 1) == 0) {
      goto LABEL_9;
    }
  }
  char v9 = [v4 error];

  if (v9)
  {
    uint64_t v10 = [v4 error];
    uint64_t v11 = a1[4];
    int v12 = *(void **)(v11 + 16);
    *(void *)(v11 + 16) = v10;

    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke_cold_1();
    }

LABEL_9:
    uint64_t v15 = 0;
    goto LABEL_10;
  }
  uint64_t v15 = 1;
LABEL_10:

  return v15;
}

- (int64_t)_recordTypeFromRecordID:(id)a3 isShare:(BOOL)a4 isDelete:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (_recordTypeFromRecordID_isShare_isDelete__onceToken == -1)
  {
    if (a4)
    {
LABEL_3:
      uint64_t v8 = 3;
      goto LABEL_14;
    }
  }
  else
  {
    dispatch_once(&_recordTypeFromRecordID_isShare_isDelete__onceToken, &__block_literal_global_230);
    if (a4) {
      goto LABEL_3;
    }
  }
  char v9 = [v7 recordName];
  uint64_t v10 = [v9 rangeOfString:@"/"];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  uint64_t v14 = [v9 substringToIndex:v10 + v11];
  if ([v14 isEqualToString:@"documentContent/"])
  {
    uint64_t v8 = 2;
LABEL_13:

    goto LABEL_14;
  }
  if ([(id)_recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes containsObject:v14])
  {
    uint64_t v8 = 1;
    goto LABEL_13;
  }

LABEL_6:
  int v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCPendingChangesStream _recordTypeFromRecordID:isShare:isDelete:]();
  }

  uint64_t v8 = 0;
LABEL_14:
  if (v5) {
    int64_t v15 = -v8;
  }
  else {
    int64_t v15 = v8;
  }

  return v15;
}

void __68__BRCPendingChangesStream__recordTypeFromRecordID_isShare_isDelete___block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"alias/";
  v2[1] = @"shareAlias/";
  v2[2] = @"symlink/";
  v2[3] = @"finderBookmark/";
  v2[4] = @"directory/";
  v2[5] = @"documentStructure/";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  os_log_t v1 = (void *)_recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes;
  _recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes = v0;
}

- (BOOL)saveEditedRecords:(id)a3 deletedRecordIDs:(id)a4 deletedShareIDs:(id)a5 subResourceEditedRecords:(id)a6 serverChangeToken:(id)a7 clientChangeToken:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  __int16 v19 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  id v20 = v19;
  if (self->_error)
  {
    char v21 = 0;
  }
  else
  {
    char v22 = [v19 db];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke;
    v24[3] = &unk_1E6999EA0;
    id v25 = v14;
    dispatch_time_t v26 = self;
    id v27 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    int64_t v31 = a8;
    char v21 = [v22 performWithFlags:25 action:v24];
  }
  return v21;
}

uint64_t __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (!v4)
  {
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  uint64_t v5 = v4;
  uint64_t v65 = *(void *)v80;
  uint64_t v63 = *MEMORY[0x1E4F19D78];
  LOBYTE(v6) = 1;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v80 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      char v9 = (void *)MEMORY[0x1D9438760]();
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = [v8 recordID];
      int v12 = [v8 recordType];
      uint64_t v13 = objc_msgSend(v10, "_recordTypeFromRecordID:isShare:isDelete:", v11, objc_msgSend(v12, "isEqualToString:", v63), 0);

      if ((v6 & 1) != 0
        && ([v8 recordID],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v3 execute:@"INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)", v14, v13, v8], v14, v15))
      {
        if ([v3 changes] == 1) {
          goto LABEL_9;
        }
        int v21 = 1;
      }
      else
      {
        int v21 = 0;
      }
      char v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v22;
        _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (!v21)
      {
LABEL_20:
        LOBYTE(v6) = 0;
        goto LABEL_21;
      }
LABEL_9:
      id v16 = [v8 recordID];
      int v17 = [v3 execute:@"DELETE FROM records_needing_subresources WHERE record_id = %@", v16];

      if (!v17) {
        goto LABEL_20;
      }
      if ([v3 changes])
      {
        id v18 = brc_bread_crumbs();
        __int16 v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v8 recordID];
          *(_DWORD *)buf = 138412546;
          v87 = v20;
          __int16 v88 = 2112;
          uint64_t v89 = (uint64_t)v18;
          _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was saved %@%@", buf, 0x16u);
        }
      }
      LOBYTE(v6) = 1;
LABEL_21:
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  }
  while (v5);
LABEL_25:

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v24 = *(id *)(a1 + 48);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (!v25) {
    goto LABEL_47;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v76;
  while (2)
  {
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v76 != v27) {
        objc_enumerationMutation(v24);
      }
      id v29 = *(void **)(*((void *)&v75 + 1) + 8 * v28);
      id v30 = (void *)MEMORY[0x1D9438760]();
      uint64_t v31 = [*(id *)(a1 + 40) _recordTypeFromRecordID:v29 isShare:0 isDelete:1];
      if ((v6 & 1) != 0
        && [v3 execute:@"INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)", v29, v31, 0])
      {
        if ([v3 changes] == 1) {
          goto LABEL_33;
        }
        int v64 = 1;
      }
      else
      {
        int v64 = 0;
      }
      dispatch_block_t v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v33;
        _os_log_fault_impl(&dword_1D353B000, v34, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (v64)
      {
LABEL_33:
        if (![v3 execute:@"DELETE FROM records_needing_subresources WHERE record_id = %@", v29])goto LABEL_44; {
        if ([v3 changes])
        }
        {
          uint64_t v6 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v87 = v29;
            __int16 v88 = 2112;
            uint64_t v89 = v6;
            _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was deleted %@%@", buf, 0x16u);
          }

          LOBYTE(v6) = 1;
        }
        else
        {
          LOBYTE(v6) = 1;
        }
      }
      else
      {
LABEL_44:
        LOBYTE(v6) = 0;
      }
      if (v26 != ++v28) {
        continue;
      }
      break;
    }
    uint64_t v26 = [v24 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v26) {
      continue;
    }
    break;
  }
LABEL_47:

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v35 = *(id *)(a1 + 56);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (!v36) {
    goto LABEL_62;
  }
  uint64_t v37 = v36;
  uint64_t v38 = *(void *)v72;
  while (2)
  {
    uint64_t v39 = 0;
    while (2)
    {
      if (*(void *)v72 != v38) {
        objc_enumerationMutation(v35);
      }
      uint64_t v40 = *(void *)(*((void *)&v71 + 1) + 8 * v39);
      v41 = (void *)MEMORY[0x1D9438760]();
      uint64_t v42 = [*(id *)(a1 + 40) _recordTypeFromRecordID:v40 isShare:1 isDelete:1];
      if ((v6 & 1) != 0
        && [v3 execute:@"INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)", v40, v42, 0])
      {
        LOBYTE(v6) = 1;
        if ([v3 changes] == 1) {
          goto LABEL_55;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }
      v66 = brc_bread_crumbs();
      v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v66;
        _os_log_fault_impl(&dword_1D353B000, v43, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

LABEL_55:
      if (v37 != ++v39) {
        continue;
      }
      break;
    }
    uint64_t v44 = [v35 countByEnumeratingWithState:&v71 objects:v84 count:16];
    uint64_t v37 = v44;
    if (v44) {
      continue;
    }
    break;
  }
LABEL_62:

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v45 = *(id *)(a1 + 64);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = 0;
    uint64_t v49 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        v52 = (void *)MEMORY[0x1D9438760]();
        if (v6) {
          LODWORD(v6) = [*(id *)(a1 + 40) _saveSubResourceRecord:v51 withDB:v3];
        }
        else {
          LODWORD(v6) = 0;
        }
      }
      v48 += v47;
      uint64_t v47 = [v45 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v47);

    if (v6)
    {
      v53 = brc_bread_crumbs();
      v54 = brc_default_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_2();
      }

LABEL_77:
      if ([v3 execute:@"UPDATE fetch_state SET server_token = %@, client_token = %lld", *(void *)(a1 + 72), *(void *)(a1 + 80)])
      {
        uint64_t v55 = 1;
        goto LABEL_82;
      }
    }
  }
  else
  {

    if (v6) {
      goto LABEL_77;
    }
  }
  uint64_t v56 = [v3 lastError];
  uint64_t v57 = *(void *)(a1 + 40);
  v58 = *(void **)(v57 + 16);
  *(void *)(v57 + 16) = v56;

  v59 = brc_bread_crumbs();
  v60 = brc_default_log();
  if (os_log_type_enabled(v60, (os_log_type_t)0x90u)) {
    __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();
  }

  uint64_t v55 = 0;
LABEL_82:

  return v55;
}

- (BOOL)saveEditedRecords:(id)a3 subResourceEditedRecords:(id)a4 queryCursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  if (self->_error)
  {
    char v12 = 0;
  }
  else
  {
    uint64_t v13 = [(BRCClientZone *)self->_clientZone session];
    [v13 assertNotOnZoneMutex];

    id v14 = [v11 db];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke;
    v16[3] = &unk_1E6998040;
    id v17 = v8;
    id v18 = self;
    id v19 = v9;
    id v20 = v10;
    char v12 = [v14 performWithFlags:25 action:v16];
  }
  return v12;
}

uint64_t __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v46 = *(void *)v52;
  uint64_t v45 = *MEMORY[0x1E4F19D78];
  LOBYTE(v7) = 1;
  do
  {
    uint64_t v43 = v6;
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v52 != v46) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v51 + 1) + 8 * v8);
      id v10 = (void *)MEMORY[0x1D9438760]();
      uint64_t v11 = *(void **)(a1 + 40);
      char v12 = [v9 recordID];
      uint64_t v13 = [v9 recordType];
      uint64_t v14 = objc_msgSend(v11, "_recordTypeFromRecordID:isShare:isDelete:", v12, objc_msgSend(v13, "isEqualToString:", v45), 0);

      if ((v7 & 1) != 0
        && ([v9 recordID],
            int v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v3 execute:@"INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)", v15, v14, v9], v15, v16))
      {
        if ([v3 changes] == 1) {
          goto LABEL_9;
        }
        int v21 = 1;
      }
      else
      {
        int v21 = 0;
      }
      char v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v22;
        _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (!v21)
      {
        int v7 = 0;
        goto LABEL_15;
      }
LABEL_9:
      id v17 = [v9 recordID];
      int v7 = [v3 execute:@"DELETE FROM records_needing_subresources WHERE record_id = %@", v17];

      if (v7)
      {
        if ([v3 changes])
        {
          id v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v9 recordID];
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v20;
            __int16 v58 = 2112;
            v59 = v18;
            _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was saved %@%@", buf, 0x16u);
          }
        }
        int v7 = [*(id *)(a1 + 40) _finishedFetchingRecordMetadata:v9 withDB:v3];
      }
LABEL_15:
      ++v8;
    }
    while (v5 != v8);
    uint64_t v6 = v43 + v5;
    uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    uint64_t v5 = v24;
  }
  while (v24);

  if (v7)
  {
    brc_bread_crumbs();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_3();
    }

LABEL_28:
    LOBYTE(v7) = 1;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v26 = *(id *)(a1 + 48);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        dispatch_block_t v33 = (void *)MEMORY[0x1D9438760]();
        if (v7) {
          int v7 = [*(id *)(a1 + 40) _saveSubResourceRecord:v32 withDB:v3];
        }
        else {
          int v7 = 0;
        }
      }
      v29 += v28;
      uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v28);

    if (v7)
    {
      v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_2();
      }

LABEL_44:
      if ([v3 execute:@"UPDATE list_state SET cont_token = %@, completed = %d", *(void *)(a1 + 56), *(void *)(a1 + 56) == 0])
      {
        uint64_t v36 = 1;
        goto LABEL_49;
      }
    }
  }
  else
  {

    if (v7) {
      goto LABEL_44;
    }
  }
  uint64_t v37 = [v3 lastError];
  uint64_t v38 = *(void *)(a1 + 40);
  uint64_t v39 = *(void **)(v38 + 16);
  *(void *)(v38 + 16) = v37;

  uint64_t v40 = brc_bread_crumbs();
  v41 = brc_default_log();
  if (os_log_type_enabled(v41, (os_log_type_t)0x90u)) {
    __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();
  }

  uint64_t v36 = 0;
LABEL_49:

  return v36;
}

- (BOOL)saveSubResourceRecords:(id)a3 afterSavingMainTableItems:(id)a4 queryCursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  if (self->_error)
  {
    char v12 = 0;
  }
  else
  {
    uint64_t v13 = [(BRCClientZone *)self->_clientZone session];
    [v13 assertNotOnZoneMutex];

    uint64_t v14 = [v11 db];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke;
    v16[3] = &unk_1E6998040;
    id v17 = v8;
    id v18 = self;
    id v19 = v10;
    id v20 = v9;
    char v12 = [v14 performWithFlags:25 action:v16];
  }
  return v12;
}

uint64_t __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 execute:@"DELETE FROM record_changes WHERE 1"];
  LOBYTE(v5) = v4;
  if (v4 && [v3 changes])
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_3();
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        int v15 = (void *)MEMORY[0x1D9438760]();
        if (v5) {
          int v5 = [*(id *)(a1 + 40) _saveSubResourceRecord:v14 withDB:v3];
        }
        else {
          int v5 = 0;
        }
      }
      v11 += v10;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v10);

    if (v5)
    {
      int v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_2();
      }

      goto LABEL_21;
    }
  }
  else
  {

    if (v5)
    {
LABEL_21:
      uint64_t v18 = [v3 execute:@"UPDATE list_state SET cont_token = %@, completed = %d", *(void *)(a1 + 48), *(void *)(a1 + 48) == 0];
      goto LABEL_23;
    }
  }
  uint64_t v18 = 0;
LABEL_23:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = *(id *)(a1 + 56);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        if ((v18 & 1) != 0
          && (uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * j),
              [v24 recordID],
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              int v26 = [v3 execute:@"DELETE FROM records_needing_subresources WHERE record_id = %@ AND record_id_needing_fetch = record_id", v25], v25, v26))
        {
          if ([v3 changes])
          {
            uint64_t v27 = brc_bread_crumbs();
            uint64_t v28 = brc_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              id v35 = [v24 recordID];
              *(_DWORD *)buf = 138412546;
              uint64_t v45 = v35;
              __int16 v46 = 2112;
              long long v47 = v27;
              _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted %@ from the pending subResources table because it was persisted directly to the server truth%@", buf, 0x16u);
            }
          }
          uint64_t v18 = [*(id *)(a1 + 40) _finishedFetchingRecordMetadata:v24 withDB:v3];
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v21);
  }

  if ((v18 & 1) == 0)
  {
    uint64_t v29 = [v3 lastError];
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void **)(v30 + 16);
    *(void *)(v30 + 16) = v29;

    uint64_t v32 = brc_bread_crumbs();
    dispatch_block_t v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
      __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_1();
    }
  }
  return v18;
}

- (int64_t)copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    int v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (self->_error)
    {
      int64_t v7 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      uint64_t v14 = 0;
      id v8 = [v5 db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__BRCPendingChangesStream_copyBlockingSaveRecordsToNeedingFetchIgnoringRecords___block_invoke;
      v10[3] = &unk_1E6999EC8;
      v10[4] = &v11;
      [v8 performWithFlags:9 action:v10];

      int64_t v7 = v12[3];
      _Block_object_dispose(&v11, 8);
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

uint64_t __80__BRCPendingChangesStream_copyBlockingSaveRecordsToNeedingFetchIgnoringRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 execute:@"UPDATE records_needing_subresources AS pr   SET record_id_needing_fetch = record_id_blocking_save WHERE record_id_blocking_save IS NOT NULL AND NOT EXISTS (SELECT 1 FROM records_needing_subresources AS sr WHERE pr.record_id_blocking_save = sr.record_id LIMIT 1)"];
  if (v4) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 changes];
  }

  return v4;
}

- (BOOL)enumerateRecordsNeedingXattrFetchWithBlock:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    int v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (self->_error)
    {
      char v7 = 0;
    }
    else
    {
      id v8 = [v5 db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__BRCPendingChangesStream_enumerateRecordsNeedingXattrFetchWithBlock___block_invoke;
      v10[3] = &unk_1E6999EF0;
      v10[4] = self;
      id v11 = v4;
      char v7 = [v8 performWithFlags:1 action:v10];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

BOOL __70__BRCPendingChangesStream_enumerateRecordsNeedingXattrFetchWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 fetch:@"SELECT record, xattr_sig FROM records_needing_subresources WHERE xattr_sig IS NOT NULL GROUP BY xattr_sig"];
  do
  {
    if (![v3 next]) {
      break;
    }
    id v4 = [v3 objectOfClass:objc_opt_class() atIndex:0];
    int v5 = [v3 dataAtIndex:1];
    uint64_t v6 = *(void *)(a1 + 40);
    char v7 = [v4 recordID];
    id v8 = [v4 etag];
    LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v5);
  }
  while ((v6 & 1) != 0);
  uint64_t v9 = [v3 error];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  [v3 close];
  BOOL v12 = *(void *)(*(void *)(a1 + 32) + 16) == 0;

  return v12;
}

- (BOOL)enumerateRecordsNeedingMetadataFetchWithBlock:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    int v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (self->_error)
    {
      char v7 = 0;
    }
    else
    {
      id v8 = [v5 db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__BRCPendingChangesStream_enumerateRecordsNeedingMetadataFetchWithBlock___block_invoke;
      v10[3] = &unk_1E6999EF0;
      v10[4] = self;
      id v11 = v4;
      char v7 = [v8 performWithFlags:1 action:v10];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

BOOL __73__BRCPendingChangesStream_enumerateRecordsNeedingMetadataFetchWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 fetch:@"SELECT record_id_needing_fetch FROM records_needing_subresources WHERE record_id_needing_fetch IS NOT NULL GROUP BY record_id_needing_fetch"];
  do
  {
    if (![v3 next]) {
      break;
    }
    id v4 = [v3 objectOfClass:objc_opt_class() atIndex:0];
    char v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  while ((v5 & 1) != 0);
  uint64_t v6 = [v3 error];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  [v3 close];
  BOOL v9 = *(void *)(*(void *)(a1 + 32) + 16) == 0;

  return v9;
}

- (BOOL)hasFetchRecordByID:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    char v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (self->_error)
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [v5 db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __46__BRCPendingChangesStream_hasFetchRecordByID___block_invoke;
      v10[3] = &unk_1E6993A60;
      id v11 = v4;
      char v7 = [v8 performWithFlags:1 action:v10];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __46__BRCPendingChangesStream_hasFetchRecordByID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM record_changes WHERE record_id = %@ LIMIT 1", *(void *)(a1 + 32)];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasRecordIDBlockedOnSubResources:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    char v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (self->_error)
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [v5 db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__BRCPendingChangesStream_hasRecordIDBlockedOnSubResources___block_invoke;
      v10[3] = &unk_1E6993A60;
      id v11 = v4;
      char v7 = [v8 performWithFlags:1 action:v10];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __60__BRCPendingChangesStream_hasRecordIDBlockedOnSubResources___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM records_needing_subresources WHERE record_id = %@ LIMIT 1", *(void *)(a1 + 32)];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasRecordIDsToDeserialize
{
  if (!self->_hasBeenCreated) {
    return 0;
  }
  uint64_t v3 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  id v4 = v3;
  if (self->_error)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 db];
    char v5 = [v6 performWithFlags:1 action:&__block_literal_global_269_0];
  }
  return v5;
}

uint64_t __52__BRCPendingChangesStream_hasRecordIDsToDeserialize__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM records_needing_subresources WHERE record_id_needing_fetch IS NOT NULL LIMIT 1"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasXattrsToFetch
{
  if (!self->_hasBeenCreated) {
    return 0;
  }
  uint64_t v3 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  id v4 = v3;
  if (self->_error)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 db];
    char v5 = [v6 performWithFlags:1 action:&__block_literal_global_274];
  }
  return v5;
}

uint64_t __43__BRCPendingChangesStream_hasXattrsToFetch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM records_needing_subresources WHERE xattr_sig IS NOT NULL LIMIT 1"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasSubResourceRecords
{
  if (!self->_hasBeenCreated) {
    return 0;
  }
  uint64_t v3 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  id v4 = v3;
  if (self->_error)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 db];
    char v5 = [v6 performWithFlags:1 action:&__block_literal_global_279];
  }
  return v5;
}

uint64_t __48__BRCPendingChangesStream_hasSubResourceRecords__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM records_needing_subresources LIMIT 1"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  if (self->_hasBeenCreated)
  {
    BOOL v9 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    error = self->_error;
    BOOL v11 = error == 0;
    if (error)
    {
      if (a5) {
        *a5 = error;
      }
    }
    else
    {
      BOOL v12 = [v9 db];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__BRCPendingChangesStream_dumpTablesToContext_includeAllItems_error___block_invoke;
      v14[3] = &unk_1E6993C00;
      BOOL v16 = a4;
      id v15 = v8;
      [v12 performWithFlags:1 action:v14];
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

uint64_t __69__BRCPendingChangesStream_dumpTablesToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 40);
  [*(id *)(a1 + 32) writeLineWithFormat:@"%@", @"records_needing_subresources"];
  [*(id *)(a1 + 32) writeLineWithFormat:@"============"];
  uint64_t v5 = 1000;
  if (v4) {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v6 = 1000;
  }
  uint64_t v23 = v6;
  uint64_t v24 = v3;
  if (v4) {
    uint64_t v5 = -1;
  }
  char v7 = (void *)[v3 fetch:@"SELECT record_id, xattr_sig, record_id_needing_fetch, record_id_blocking_save FROM records_needing_subresources LIMIT %u", v5];
  if ([v7 next])
  {
    while (([*(id *)(a1 + 32) shouldKeepDumpingWithItemCount:0 includeAllItems:*(unsigned __int8 *)(a1 + 40)] & 1) != 0)
    {
      id v8 = [v7 objectOfClass:objc_opt_class() atIndex:0];
      BOOL v9 = [v7 dataAtIndex:1];
      uint64_t v10 = [v7 objectOfClass:objc_opt_class() atIndex:2];
      BOOL v11 = [v7 objectOfClass:objc_opt_class() atIndex:3];
      BOOL v12 = NSString;
      uint64_t v13 = [v8 recordName];
      uint64_t v14 = [v10 recordName];
      id v15 = [v11 recordName];
      BOOL v16 = [v12 stringWithFormat:@"+ recordID:%@ xattrSig:%@ NF:%@ BS:%@", v13, v9, v14, v15];

      [*(id *)(a1 + 32) writeLineWithFormat:@"%@", v16];
      if (([v7 next] & 1) == 0) {
        goto LABEL_11;
      }
    }
    [v7 close];
  }
LABEL_11:
  [*(id *)(a1 + 32) writeLineWithFormat:@"%@", @"record_changes"];
  [*(id *)(a1 + 32) writeLineWithFormat:@"============"];
  id v17 = objc_msgSend(v24, "fetch:", @"SELECT record_id FROM record_changes LIMIT %u", v23);

  if ([v17 next])
  {
    while (([*(id *)(a1 + 32) shouldKeepDumpingWithItemCount:0 includeAllItems:*(unsigned __int8 *)(a1 + 40)] & 1) != 0)
    {
      uint64_t v18 = [v17 objectOfClass:objc_opt_class() atIndex:0];
      id v19 = NSString;
      uint64_t v20 = [v18 recordName];
      uint64_t v21 = [v19 stringWithFormat:@"+ recordID:%@", v20];

      [*(id *)(a1 + 32) writeLineWithFormat:@"%@", v21];
      if (([v17 next] & 1) == 0) {
        goto LABEL_16;
      }
    }
    [v17 close];
  }
LABEL_16:

  return 1;
}

- (BOOL)hasRecordDeletes
{
  if (!self->_hasBeenCreated) {
    return 0;
  }
  id v3 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
  int v4 = v3;
  if (self->_error)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 db];
    char v5 = [v6 performWithFlags:1 action:&__block_literal_global_308];
  }
  return v5;
}

uint64_t __43__BRCPendingChangesStream_hasRecordDeletes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM record_changes WHERE record IS NULL LIMIT 1"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_saveSubResourceRecord:(id)a3 withDB:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordID];
  int v9 = [v7 execute:@"DELETE FROM record_changes WHERE record_id = %@", v8];

  if (v9)
  {
    if ([v7 changes])
    {
      uint64_t v10 = brc_bread_crumbs();
      BOOL v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = [v6 recordID];
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = (uint64_t)v12;
        __int16 v31 = 2112;
        uint64_t v32 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed recordID %@ from record changes table because it now needs sub resources%@", buf, 0x16u);
      }
    }
    uint64_t v13 = [v6 recordID];
    uint64_t v14 = [v6 recordType];
    id v15 = [v6 record];
    BOOL v16 = [v6 xattrSignature];
    id v17 = [v6 recordIDNeedingFetch];
    uint64_t v18 = [v6 recordIDBlockingSave];
    int v9 = [v7 execute:@"INSERT OR REPLACE INTO records_needing_subresources (record_id, record_type, record, xattr_sig, record_id_needing_fetch, record_id_blocking_save) VALUES (%@, %ld, %@, %@, %@, %@)", v13, v14, v15, v16, v17, v18];
  }
  id v19 = [v6 record];

  if (!v19)
  {
    if (v9) {
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v25 = [v7 lastError];
    BOOL v24 = 0;
    error = self->_error;
    self->_error = v25;
LABEL_17:

    goto LABEL_18;
  }
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v20 = [v6 recordID];
  int v21 = [v7 execute:@"UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@", v20];

  if (!v21) {
    goto LABEL_16;
  }
  if ([v7 changes])
  {
    error = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = [v7 changes];
      uint64_t v28 = [v6 recordID];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v27;
      __int16 v31 = 2112;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      v34 = error;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Unblocked %lld records waiting on save of %@ even though it's a sub-resource record%@", buf, 0x20u);
    }
    BOOL v24 = 1;
    goto LABEL_17;
  }
LABEL_15:
  BOOL v24 = 1;
LABEL_18:

  return v24;
}

- (void)finishedFetchingXattrSignatures:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    char v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    id v6 = v5;
    if (!self->_error)
    {
      id v7 = [v5 db];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__BRCPendingChangesStream_finishedFetchingXattrSignatures___block_invoke;
      v8[3] = &unk_1E6993A88;
      id v9 = v4;
      uint64_t v10 = self;
      [v7 performWithFlags:9 action:v8];
    }
  }
}

uint64_t __59__BRCPendingChangesStream_finishedFetchingXattrSignatures___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = a1;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (![v3 execute:@"UPDATE records_needing_subresources SET xattr_sig = NULL WHERE xattr_sig = %@", v9])
        {
          uint64_t v14 = [v3 lastError];
          uint64_t v15 = *(void *)(v18 + 40);
          BOOL v16 = *(void **)(v15 + 16);
          *(void *)(v15 + 16) = v14;

          uint64_t v13 = 0;
          goto LABEL_15;
        }
        if ([v3 changes])
        {
          uint64_t v10 = brc_bread_crumbs();
          BOOL v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = [v3 changes];
            *(_DWORD *)buf = 134218498;
            uint64_t v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v9;
            __int16 v27 = 2112;
            uint64_t v28 = v10;
            _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items which no longer need to fetch xattr %@%@", buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_15:

  return v13;
}

- (void)unblockRecordSavesWaitingOnRecordID:(id)a3
{
  id v4 = a3;
  if (self->_hasBeenCreated)
  {
    uint64_t v5 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    uint64_t v6 = v5;
    if (!self->_error)
    {
      uint64_t v7 = [v5 db];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__BRCPendingChangesStream_unblockRecordSavesWaitingOnRecordID___block_invoke;
      v8[3] = &unk_1E6993A88;
      id v9 = v4;
      uint64_t v10 = self;
      [v7 performWithFlags:9 action:v8];
    }
  }
}

uint64_t __63__BRCPendingChangesStream_unblockRecordSavesWaitingOnRecordID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 execute:@"DELETE FROM records_needing_subresources WHERE record_id = %@ AND record IS NULL", *(void *)(a1 + 32)];
  if ([v3 changes])
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = [v3 changes];
      __int16 v24 = 2112;
      __int16 v25 = v5;
      _os_log_error_impl(&dword_1D353B000, v6, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We deleted %lld items from pending subresources table for this%@", buf, 0x20u);
    }
  }
  if (v4) {
    uint64_t v4 = [v3 execute:@"UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@", *(void *)(a1 + 32)];
  }
  if ([v3 changes])
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [v3 changes];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      __int16 v25 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We marked %lld as not needing fetch anymore%@", buf, 0x20u);
    }
  }
  if (v4) {
    uint64_t v4 = [v3 execute:@"UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = %@", *(void *)(a1 + 32)];
  }
  if ([v3 changes])
  {
    id v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = [v3 changes];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      __int16 v25 = v9;
      _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We marked %lld as not blocked for save anymore%@", buf, 0x20u);
    }
  }
  if ((v4 & 1) == 0)
  {
    uint64_t v11 = [v3 lastError];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;
  }
  return v4;
}

- (BOOL)unblockRecord:(id)a3 waitingOnRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_hasBeenCreated)
  {
    id v8 = [(BRCPendingChangesStream *)self _getChangesStreamSafeDBHolder];
    id v9 = v8;
    if (self->_error)
    {
      char v10 = 0;
    }
    else
    {
      uint64_t v11 = [v8 db];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__BRCPendingChangesStream_unblockRecord_waitingOnRecord___block_invoke;
      v13[3] = &unk_1E6993A88;
      id v14 = v6;
      id v15 = v7;
      char v10 = [v11 performWithFlags:9 action:v13];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __57__BRCPendingChangesStream_unblockRecord_waitingOnRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 execute:@"UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id = %@ AND record_id_blocking_save = %@", *(void *)(a1 + 32), *(void *)(a1 + 40)]&& objc_msgSend(v3, "changes"))
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [*(id *)(a1 + 32) recordName];
      id v9 = [*(id *)(a1 + 40) recordName];
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Unblocked record %@ blocked on record %@%@", buf, 0x20u);
    }
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_finishedFetchingRecordMetadata:(id)a3 withDB:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 assertOnQueue];
  if (([v6 isInTransaction] & 1) == 0)
  {
    id v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCPendingChangesStream _finishedFetchingRecordMetadata:withDB:]();
    }
  }
  id v7 = [v5 recordID];
  if (![v6 execute:@"UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@", v7])goto LABEL_13; {
  if ([v6 changes])
  }
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v18 = [v6 changes];
      __int16 v19 = 2112;
      long long v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be unblocked for fetching %@%@", buf, 0x20u);
    }
  }
  if ([v6 execute:@"UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = %@", v7])
  {
    if ([v6 changes])
    {
      char v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v6 changes];
        *(_DWORD *)buf = 134218498;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        long long v20 = v7;
        __int16 v21 = 2112;
        __int16 v22 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be unblocked for saving %@%@", buf, 0x20u);
      }
    }
    BOOL v12 = 1;
  }
  else
  {
LABEL_13:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)hasBeenCreated
{
  return self->_hasBeenCreated;
}

- (void)destroyDatabase
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ - Destroying the database%@");
}

- (id)lastError
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_startingChangeToken, 0);
  objc_storeStrong((id *)&self->_dbSafeHolder, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_getChangesStreamSafeDBHolder
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Opening changes stream %@%@");
}

- (void)_dbBecameCorrupted:withDescription:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Deleting database at path: %@%@");
}

- (void)_dbBecameCorrupted:withDescription:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] We are in an error scenario, trying to close the DB, but it's busy - let's avoid dealloc it%@", v1, 0xCu);
}

- (void)_dbBecameCorrupted:withDescription:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] error closing BRCPendingChangesStream DB connection: %@%@");
}

- (void)_dropExistingTablesWithDB:.cold.1()
{
  OUTLINED_FUNCTION_8();
  os_log_t v1 = [*(id *)(v0 + 8) path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Dropping pending fetch table at %@%@", v4, v5, v6, v7, v8);
}

void __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  os_log_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: Failed to set the cache spill - %@%@", v4, v5, v6, v7, v8);
}

void __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  os_log_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: Failed to set the cache size - %@%@", v4, v5, v6, v7, v8);
}

void __34__BRCPendingChangesStream__openDB__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] db corruption handler called on pending sync db%@", v1, 0xCu);
}

void __34__BRCPendingChangesStream__openDB__block_invoke_184_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] disk is full - exiting%@", v2, v3, v4, v5, v6);
}

- (void)fetchTokenState:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Trying to fetch token state without a db%@", v2, v3, v4, v5, v6);
}

void __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: There should always be one entry%@", v2, v3, v4, v5, v6);
}

- (void)fetchQueryCursor:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Trying to fetch query cursor without a db%@", v2, v3, v4, v5, v6);
}

- (void)enumerateRecordsOfType:block:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Trying to enumerate records without a db%@", v2, v3, v4, v5, v6);
}

void __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: Failed enumerating records - %@%@", v4, v5, v6, v7, v8);
}

- (void)_recordTypeFromRecordID:isShare:isDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: recordType != 0%@", v2, v3, v4, v5, v6);
}

void __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Failed saving to the pending changes stream - %@%@", (void)v3, DWORD2(v3));
}

void __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Persisted %llu records needing subResource fetch%@");
}

void __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Persisted %llu sub resource records which need fetch%@");
}

void __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Persisted %llu records which are fully fetched%@");
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Failed to save subResource records after saving main table items - %@%@", (void)v3, DWORD2(v3));
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Persisted %lld subResource records to the pending changes db%@");
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Removed %llu records from the pending fetches table because we should have just saved them%@", v3, v4, v5, v6, v7);
}

- (void)_finishedFetchingRecordMetadata:withDB:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: db.isInTransaction%@", v2, v3, v4, v5, v6);
}

@end