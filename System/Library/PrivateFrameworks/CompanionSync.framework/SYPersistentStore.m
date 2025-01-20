@interface SYPersistentStore
+ (BOOL)_tableEmpty:(id)a3 db:(sqlite3 *)a4;
+ (id)_loadOrCreatePeerIDForDB:(sqlite3 *)a3;
+ (id)sharedPersistentStoreForService:(id)a3;
- (BOOL)_LOCKED_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4 db:(sqlite3 *)a5 error:(id *)a6;
- (BOOL)_inTransaction:(BOOL)a3 do:(id)a4;
- (BOOL)_openDBAtPath:(id)a3;
- (BOOL)cachedVersionStale;
- (BOOL)canStartNewSyncSession;
- (BOOL)completedSync;
- (BOOL)currentSyncSendComplete;
- (BOOL)ignoringFullSyncWithID:(id)a3;
- (BOOL)inFullSync;
- (BOOL)isPerformingDeltaSync;
- (BOOL)lastSyncFailed;
- (BOOL)logChanges:(id)a3 error:(id *)a4;
- (BOOL)logSyncCompletionToRemoteVersion:(unint64_t)a3;
- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4;
- (BOOL)reassignCurrentSyncID:(id)a3;
- (BOOL)sequenceNumberIsDuplicate:(unint64_t)a3 forPeer:(id)a4;
- (BOOL)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4 error:(id *)a5;
- (BOOL)shouldIgnoreMessageID:(id)a3;
- (NSDate)lastMessageReceived;
- (NSDate)overflowResyncTime;
- (NSDictionary)fullSyncIDSOptions;
- (NSDictionary)fullSyncUserInfo;
- (NSError)lastSyncError;
- (NSSet)cachedChangedSyncIDs;
- (NSString)currentFullSyncID;
- (NSString)lastSyncEndID;
- (NSString)path;
- (NSString)peerID;
- (NSString)vectorClockJSON;
- (NSString)waitingForSyncEndID;
- (SYPersistentStore)init;
- (SYPersistentStore)initWithPath:(id)a3 loggingFacility:(__CFString *)a4 changeTrackingEnabled:(BOOL)a5;
- (SYPersistentStore)initWithSharedDatabase:(id)a3;
- (_SYSharedServiceDB)sharedDB;
- (double)durationOfLastFullSync;
- (double)timeToLive;
- (double)unfinishedSyncTimeout;
- (id)_decodeIndexSet:(id)a3;
- (id)_encodeIndexSet:(id)a3;
- (id)_sequenceNumberSetForPeerID:(id)a3 inDB:(sqlite3 *)a4;
- (id)dbPath;
- (id)lastDBErrorInfo;
- (int)_getSchemaVersion;
- (sqlite3)_dbRef;
- (unint64_t)_lastSequenceNumberForPeerID_LOCKED:(id)a3 db:(sqlite3 *)a4;
- (unint64_t)_oldestVersion;
- (unint64_t)cachedChangedSyncIDsVersion;
- (unint64_t)changeCount;
- (unint64_t)currentLocalVersion;
- (unint64_t)lastSeenRemoteVersion;
- (unint64_t)lastSequenceNumberForPeerID:(id)a3;
- (unint64_t)nextSequenceNumber;
- (void)_cacheTTL;
- (void)_convertTimestamps;
- (void)_fixPeerInfo;
- (void)_getSchemaVersion;
- (void)_loadIgnoreList_LOCKED:(sqlite3 *)a3;
- (void)_saveIgnoreList_LOCKED:(sqlite3 *)a3;
- (void)_setupSharedDB;
- (void)_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4;
- (void)_verifyInTransactionForFullSync;
- (void)_withDB:(id)a3;
- (void)addMessageIDsToIgnore:(id)a3;
- (void)changeTrackingToggled:(BOOL)a3;
- (void)clearAllChanges;
- (void)dealloc;
- (void)enterFullSyncWithID:(id)a3 ignoring:(BOOL)a4;
- (void)exitFullSyncWithID:(id)a3 error:(id)a4;
- (void)removeMessageIDFromIgnoreList:(id)a3;
- (void)resetSequenceNumber:(unint64_t)a3;
- (void)resetSequenceNumbersForPeer:(id)a3;
- (void)sendCompletedForSyncWithID:(id)a3;
- (void)setCachedChangedSyncIDs:(id)a3;
- (void)setCachedChangedSyncIDsVersion:(unint64_t)a3;
- (void)setCachedVersionStale:(BOOL)a3;
- (void)setCompletedSync:(BOOL)a3;
- (void)setFullSyncIDSOptions:(id)a3;
- (void)setFullSyncUserInfo:(id)a3;
- (void)setLastMessageReceived:(id)a3;
- (void)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4;
- (void)setOverflowResyncTime:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPerformingDeltaSync:(BOOL)a3;
- (void)setSharedDB:(id)a3;
- (void)setTimeToLive:(double)a3;
- (void)setUnfinishedSyncTimeout:(double)a3;
- (void)setVectorClockJSON:(id)a3;
- (void)setWaitingForSyncEndID:(id)a3;
@end

@implementation SYPersistentStore

- (NSString)peerID
{
  peerID = self->_peerID;
  if (!peerID)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__SYPersistentStore_peerID__block_invoke;
    v5[3] = &unk_2644229D8;
    v5[4] = self;
    [(SYPersistentStore *)self _withDB:v5];
    peerID = self->_peerID;
  }
  return peerID;
}

- (void)_withDB:(id)a3
{
  id v4 = a3;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    [(_SYSharedServiceDB *)sharedDB withDBRef:v4];
  }
  else
  {
    v6 = (void *)os_transaction_create();
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__SYPersistentStore__withDB___block_invoke;
    block[3] = &unk_264423450;
    id v10 = v6;
    id v11 = v4;
    block[4] = self;
    id v8 = v6;
    dispatch_sync(syncQ, block);
  }
}

+ (id)sharedPersistentStoreForService:(id)a3
{
  id v4 = a3;
  if (sharedPersistentStoreForService__onceToken != -1) {
    dispatch_once(&sharedPersistentStoreForService__onceToken, &__block_literal_global_5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);
  v5 = [(id)sharedPersistentStoreForService____map objectForKey:v4];
  if (!v5)
  {
    v6 = +[_SYSharedServiceDB sharedInstanceForServiceName:v4];
    v5 = (void *)[objc_alloc((Class)a1) initWithSharedDatabase:v6];
    [(id)sharedPersistentStoreForService____map setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);

  return v5;
}

void __53__SYPersistentStore_sharedPersistentStoreForService___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0x10000 valueOptions:5 capacity:2];
  v1 = (void *)sharedPersistentStoreForService____map;
  sharedPersistentStoreForService____map = v0;

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = (id)[v3 addObserverForName:@"SYDeviceTargetedNewDeviceNotification" object:0 queue:0 usingBlock:&__block_literal_global_5];
}

void __53__SYPersistentStore_sharedPersistentStoreForService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);
  id v2 = (void *)MEMORY[0x21D4B1560]();
  [(id)sharedPersistentStoreForService____map removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);
}

- (SYPersistentStore)init
{
  return 0;
}

- (SYPersistentStore)initWithSharedDatabase:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYPersistentStore;
  v6 = [(SYPersistentStore *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_changeTrackingEnabled = 1;
    objc_storeStrong((id *)&v6->_sharedDB, a3);
    [(SYPersistentStore *)v7 setUnfinishedSyncTimeout:30.0];
    uint64_t v8 = objc_opt_new();
    peerSeqnoSets = v7->_peerSeqnoSets;
    v7->_peerSeqnoSets = (NSMutableDictionary *)v8;

    [(SYPersistentStore *)v7 _setupSharedDB];
    [(SYPersistentStore *)v7 _prepareStatements];
    id v10 = v7;
  }

  return v7;
}

- (SYPersistentStore)initWithPath:(id)a3 loggingFacility:(__CFString *)a4 changeTrackingEnabled:(BOOL)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SYPersistentStore;
  v9 = [(SYPersistentStore *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    v9->_changeTrackingEnabled = a5;
    if (a4) {
      v9->_loggingFacility = (__CFString *)CFRetain(a4);
    }
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("SYPersistentStore.SynqQ", v11);
    syncQ = v10->_syncQ;
    v10->_syncQ = (OS_dispatch_queue *)v12;

    v14 = [v8 stringByStandardizingPath];
    BOOL v15 = [(SYPersistentStore *)v10 _openDBAtPath:v14];

    v16 = 0;
    if (v15)
    {
      [(SYPersistentStore *)v10 setUnfinishedSyncTimeout:30.0];
      uint64_t v17 = objc_opt_new();
      peerSeqnoSets = v10->_peerSeqnoSets;
      v10->_peerSeqnoSets = (NSMutableDictionary *)v17;

      v16 = v10;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  loggingFacility = self->_loggingFacility;
  if (loggingFacility) {
    CFRelease(loggingFacility);
  }
  if (self->_db || self->_sharedDB)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28__SYPersistentStore_dealloc__block_invoke;
    v6[3] = &unk_2644229D8;
    v6[4] = self;
    [(SYPersistentStore *)self _withDB:v6];
    db = self->_db;
    if (db) {
      sqlite3_close(db);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SYPersistentStore;
  [(SYPersistentStore *)&v5 dealloc];
}

sqlite3_stmt *__28__SYPersistentStore_dealloc__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (sqlite3_stmt *)v2[11];
  if (v3)
  {
    sqlite3_finalize(v3);
    id v2 = *(void **)(a1 + 32);
  }
  id v4 = (sqlite3_stmt *)v2[12];
  if (v4)
  {
    sqlite3_finalize(v4);
    id v2 = *(void **)(a1 + 32);
  }
  objc_super v5 = (sqlite3_stmt *)v2[13];
  if (v5)
  {
    sqlite3_finalize(v5);
    id v2 = *(void **)(a1 + 32);
  }
  v6 = (sqlite3_stmt *)v2[14];
  if (v6)
  {
    sqlite3_finalize(v6);
    id v2 = *(void **)(a1 + 32);
  }
  v7 = (sqlite3_stmt *)v2[15];
  if (v7)
  {
    sqlite3_finalize(v7);
    id v2 = *(void **)(a1 + 32);
  }
  id v8 = (sqlite3_stmt *)v2[16];
  if (v8)
  {
    sqlite3_finalize(v8);
    id v2 = *(void **)(a1 + 32);
  }
  v9 = (sqlite3_stmt *)v2[17];
  if (v9)
  {
    sqlite3_finalize(v9);
    id v2 = *(void **)(a1 + 32);
  }
  id v10 = (sqlite3_stmt *)v2[18];
  if (v10)
  {
    sqlite3_finalize(v10);
    id v2 = *(void **)(a1 + 32);
  }
  id v11 = (sqlite3_stmt *)v2[19];
  if (v11)
  {
    sqlite3_finalize(v11);
    id v2 = *(void **)(a1 + 32);
  }
  dispatch_queue_t v12 = (sqlite3_stmt *)v2[20];
  if (v12)
  {
    sqlite3_finalize(v12);
    id v2 = *(void **)(a1 + 32);
  }
  v13 = (sqlite3_stmt *)v2[21];
  if (v13)
  {
    sqlite3_finalize(v13);
    id v2 = *(void **)(a1 + 32);
  }
  v14 = (sqlite3_stmt *)v2[22];
  if (v14)
  {
    sqlite3_finalize(v14);
    id v2 = *(void **)(a1 + 32);
  }
  BOOL v15 = (sqlite3_stmt *)v2[23];
  if (v15)
  {
    sqlite3_finalize(v15);
    id v2 = *(void **)(a1 + 32);
  }
  v16 = (sqlite3_stmt *)v2[24];
  if (v16)
  {
    sqlite3_finalize(v16);
    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v17 = (sqlite3_stmt *)v2[25];
  if (v17)
  {
    sqlite3_finalize(v17);
    id v2 = *(void **)(a1 + 32);
  }
  v18 = (sqlite3_stmt *)v2[26];
  if (v18)
  {
    sqlite3_finalize(v18);
    id v2 = *(void **)(a1 + 32);
  }
  v19 = (sqlite3_stmt *)v2[27];
  if (v19)
  {
    sqlite3_finalize(v19);
    id v2 = *(void **)(a1 + 32);
  }
  objc_super v20 = (sqlite3_stmt *)v2[28];
  if (v20)
  {
    sqlite3_finalize(v20);
    id v2 = *(void **)(a1 + 32);
  }
  v21 = (sqlite3_stmt *)v2[29];
  if (v21)
  {
    sqlite3_finalize(v21);
    id v2 = *(void **)(a1 + 32);
  }
  v22 = (sqlite3_stmt *)v2[30];
  if (v22)
  {
    sqlite3_finalize(v22);
    id v2 = *(void **)(a1 + 32);
  }
  v23 = (sqlite3_stmt *)v2[31];
  if (v23)
  {
    sqlite3_finalize(v23);
    id v2 = *(void **)(a1 + 32);
  }
  v24 = (sqlite3_stmt *)v2[32];
  if (v24)
  {
    sqlite3_finalize(v24);
    id v2 = *(void **)(a1 + 32);
  }
  v25 = (sqlite3_stmt *)v2[33];
  if (v25)
  {
    sqlite3_finalize(v25);
    id v2 = *(void **)(a1 + 32);
  }
  v26 = (sqlite3_stmt *)v2[34];
  if (v26)
  {
    sqlite3_finalize(v26);
    id v2 = *(void **)(a1 + 32);
  }
  v27 = (sqlite3_stmt *)v2[35];
  if (v27)
  {
    sqlite3_finalize(v27);
    id v2 = *(void **)(a1 + 32);
  }
  v28 = (sqlite3_stmt *)v2[36];
  if (v28)
  {
    sqlite3_finalize(v28);
    id v2 = *(void **)(a1 + 32);
  }
  v29 = (sqlite3_stmt *)v2[38];
  if (v29)
  {
    sqlite3_finalize(v29);
    id v2 = *(void **)(a1 + 32);
  }
  v30 = (sqlite3_stmt *)v2[37];
  if (v30)
  {
    sqlite3_finalize(v30);
    id v2 = *(void **)(a1 + 32);
  }
  v31 = (sqlite3_stmt *)v2[40];
  if (v31)
  {
    sqlite3_finalize(v31);
    id v2 = *(void **)(a1 + 32);
  }
  result = (sqlite3_stmt *)v2[39];
  if (result)
  {
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  return result;
}

- (sqlite3)_dbRef
{
  return self->_db;
}

+ (BOOL)_tableEmpty:(id)a3 db:(sqlite3 *)a4
{
  id v5 = a3;
  ppStmt = 0;
  id v6 = (id) [[NSString alloc] initWithFormat:@"SELECT COUNT(*) FROM %@", v5];
  v7 = (const char *)[v6 UTF8String];
  int v8 = strlen(v7);
  int v9 = sqlite3_prepare_v2(a4, v7, v8, &ppStmt, 0);
  if (v9)
  {
    BOOL v10 = v9;
    if (v9 != 1)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        +[SYPersistentStore _tableEmpty:db:]((uint64_t)v5);
      }
      BOOL v10 = 1;
    }
  }
  else
  {
    int v11 = sqlite3_step(ppStmt);
    BOOL v10 = 1;
    if (v11 && v11 != 101)
    {
      if (v11 == 100)
      {
        BOOL v10 = sqlite3_column_int(ppStmt, 0) == 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          +[SYPersistentStore _tableEmpty:db:]((uint64_t)v5);
        }
        BOOL v10 = 1;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v10;
}

+ (id)_loadOrCreatePeerIDForDB:(sqlite3 *)a3
{
  if ([a1 _tableEmpty:@"syncstate" db:a3])
  {
    id v4 = objc_opt_new();
    id v5 = [v4 UUIDString];

    id v6 = v5;
    [v6 UTF8String];
    ExecuteSQL_0(a3, "INSERT INTO syncstate (remoteversion, tstamp, peer_id) VALUES (0, datetime('now'), '%s')");
  }
  else
  {
    ppStmt = 0;
    sqlite3_prepare_v2(a3, "SELECT peer_id FROM syncstate LIMIT 1", 37, &ppStmt, 0);
    sqlite3_step(ppStmt);
    ReadString(ppStmt);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    if (![v6 length])
    {
      v7 = objc_opt_new();
      int v8 = [v7 UUIDString];

      id v6 = v8;
      [v6 UTF8String];
      ExecuteSQL_0(a3, "UPDATE syncstate SET peer_id='%s'");
    }
  }
  return v6;
}

- (int)_getSchemaVersion
{
  ppStmt = 0;
  int v2 = sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", 25, &ppStmt, 0);
  if (v2)
  {
    if (v2 != 1)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[SYPersistentStore _getSchemaVersion]();
      }
    }
    return 0;
  }
  else
  {
    int v4 = sqlite3_step(ppStmt);
    int v3 = 0;
    if (v4 && v4 != 101)
    {
      if (v4 == 100)
      {
        int v3 = sqlite3_column_int(ppStmt, 0);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          -[SYPersistentStore _getSchemaVersion]();
        }
        int v3 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

- (BOOL)_openDBAtPath:(id)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringByDeletingLastPathComponent];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:v4];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = *MEMORY[0x263F08028];
    v25[0] = *MEMORY[0x263F08060];
    v25[1] = v8;
    v26[0] = @"mobile";
    v26[1] = @"mobile";
    v25[2] = *MEMORY[0x263F08078];
    v26[2] = &unk_26CD338E0;
    int v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    BOOL v10 = [MEMORY[0x263F08850] defaultManager];
    [v10 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v9 error:0];
  }
  id v11 = v4;
  p_db = &self->_db;
  if (sqlite3_open_v2((const char *)[v11 fileSystemRepresentation], &self->_db, 4194310, 0) || !*p_db)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[SYPersistentStore _openDBAtPath:]((uint64_t)v11);
    }
    if (*p_db)
    {
      sqlite3_close(*p_db);
      BOOL v13 = 0;
      *p_db = 0;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    v14 = (NSString *)[v11 copy];
    path = self->_path;
    self->_path = v14;

    ExecuteSQL_0(self->_db, "PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(self->_db, 60000);
    sqlite3_extended_result_codes(self->_db, 1);
    sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
    int v16 = [(SYPersistentStore *)self _getSchemaVersion];
    unsigned int v17 = v16 - 1;
    unsigned int v18 = v16;
    switch(v16)
    {
      case 0:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp REAL)");
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS syncstate (remoteversion INTEGER, tstamp INTEGER, fullsync_sent INTEGER DEFAULT 0, in_full_sync INTEGER DEFAULT 0, ttl INTEGER DEFAULT 1209600)");
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS changes (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp INTEGER, type INTEGER, syncid TEXT, object BLOB)");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_13;
      case 1:
LABEL_13:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN vector_clock TEXT DEFAULT ''");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN peer_id TEXT DEFAULT ''");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_14;
      case 2:
LABEL_14:
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_15;
      case 3:
LABEL_15:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN msg_seqno INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_16;
      case 4:
LABEL_16:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS peer_info (peerID TEXT, last_seqno INTEGER, tstamp REAL)");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_17;
      case 5:
LABEL_17:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS full_sync_info (syncID TEXT, active INTEGER DEFAULT 1, time_started REAL, time_ended REAL, duration REAL)");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN waiting_for_sync_id TEXT");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN sync_user_info BLOB");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN sync_ids_options BLOB");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_uuid ON full_sync_info (syncID ASC, active)");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_start_time ON full_sync_info (time_started ASC, time_ended, syncID)");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_duration ON full_sync_info (duration ASC, syncID, time_started, time_ended)");
        ExecuteSQL_0(*p_db, "CREATE INDEX changes_by_time ON changes (tstamp ASC, version)");
        ExecuteSQL_0(*p_db, "CREATE INDEX changes_by_syncid ON changes (syncid ASC, tstamp ASC, version)");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER remove_prior_changes BEFORE INSERT ON changes BEGIN DELETE FROM changes WHERE syncid = new.syncid; END");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER remove_old_syncs BEFORE INSERT ON full_sync_info BEGIN DELETE FROM full_sync_info WHERE syncID NOT IN (SELECT syncID FROM full_sync_info ORDER BY syncID DESC LIMIT 1) AND active=0; END");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER compute_duration AFTER UPDATE OF time_ended ON full_sync_info BEGIN UPDATE full_sync_info SET duration = new.time_ended - old.time_started WHERE syncID = old.syncID; END");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_18;
      case 6:
LABEL_18:
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN send_complete INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN failed INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN error BLOB");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_19;
      case 7:
LABEL_19:
        ExecuteSQL_0(*p_db, "ALTER TABLE peer_info ADD COLUMN seqno_set TEXT DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_20;
      case 8:
LABEL_20:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN overflow_timeout REAL DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_21;
      case 9:
LABEL_21:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN last_message_time REAL DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_22;
      case 10:
LABEL_22:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN in_delta_sync INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        if (!v18) {
          goto LABEL_41;
        }
        v19 = *p_db;
        if (v18 <= 3) {
          goto LABEL_40;
        }
LABEL_27:
        pStmt = 0;
        if (sqlite3_prepare_v2(v19, "SELECT COUNT(*) FROM peer_info WHERE last_seqno IS NOT NULL AND last_seqno > 0", -1, &pStmt, 0))
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
          }
        }
        else if (sqlite3_step(pStmt) == 100)
        {
          int v20 = sqlite3_column_int(pStmt, 0);
          sqlite3_reset(pStmt);
          sqlite3_finalize(pStmt);
          if (v20 <= 0) {
            goto LABEL_41;
          }
        }
        else
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
          }
          sqlite3_reset(pStmt);
          sqlite3_finalize(pStmt);
        }
LABEL_40:
        ExecuteSQL_0(v19, "UPDATE syncstate SET fullsync_sent=1");
LABEL_41:
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
LABEL_42:
        v21 = +[SYPersistentStore _loadOrCreatePeerIDForDB:self->_db];
        peerID = self->_peerID;
        self->_peerID = v21;

        if (v17 <= 1) {
          [(SYPersistentStore *)self _convertTimestamps];
        }
        [(SYPersistentStore *)self _fixPeerInfo];
        [(SYPersistentStore *)self _prepareStatements];
        BOOL v13 = 1;
        break;
      case 11:
        v19 = *p_db;
        goto LABEL_27;
      default:
        goto LABEL_42;
    }
  }

  return v13;
}

uint64_t __27__SYPersistentStore_peerID__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 48) = +[SYPersistentStore _loadOrCreatePeerIDForDB:a2];
  return MEMORY[0x270F9A758]();
}

- (void)setPeerID:(id)a3
{
}

- (void)_setupSharedDB
{
  objc_initWeak(&location, self);
  sharedDB = self->_sharedDB;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SYPersistentStore__setupSharedDB__block_invoke;
  v6[3] = &unk_264423718;
  objc_copyWeak(&v7, &location);
  [(_SYSharedServiceDB *)sharedDB updateSchemaForClient:v5 usingBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __35__SYPersistentStore__setupSharedDB__block_invoke(uint64_t a1, sqlite3 *a2, uint64_t a3)
{
  if (a3 != 1)
  {
    uint64_t v5 = a3;
    if (a3) {
      goto LABEL_5;
    }
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS syncstate (remoteversion INTEGER, tstamp INTEGER, fullsync_sent INTEGER DEFAULT 0, in_full_sync INTEGER DEFAULT 0, ttl INTEGER DEFAULT 86400, vector_clock TEXT DEFAULT '', peer_id TEXT DEFAULT '', msg_seqno INTEGER DEFAULT 0, waiting_for_sync_id TEXT, sync_user_info BLOB, sync_ids_options BLOB, overflow_timeout REAL DEFAULT NIL, last_message_time REAL DEFAULT NIL, in_delta_sync INTEGER DEFAULT 0)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS changes (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp INTEGER, type INTEGER, syncid TEXT, object BLOB)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS peer_info (peerID TEXT, last_seqno INTEGER, tstamp REAL, seqno_set TEXT DEFAULT NIL)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS full_sync_info (syncID TEXT, active INTEGER DEFAULT 1, time_started REAL, time_ended REAL, duration REAL, send_complete INTEGER DEFAULT 0, failed INTEGER DEFAULT 0, error BLOB)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_uuid ON full_sync_info (syncID ASC, active)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_start_time ON full_sync_info (time_started ASC, time_ended, syncID)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_duration ON full_sync_info (duration ASC, syncID, time_started, time_ended)");
    ExecuteSQL_0(a2, "CREATE INDEX changes_by_time ON changes (tstamp ASC, version)");
    ExecuteSQL_0(a2, "CREATE INDEX changes_by_syncid ON changes (syncid ASC, tstamp ASC, version)");
    ExecuteSQL_0(a2, "CREATE TRIGGER remove_prior_changes BEFORE INSERT ON changes BEGIN DELETE FROM changes WHERE syncid = new.syncid; END");
    ExecuteSQL_0(a2, "CREATE TRIGGER remove_old_syncs BEFORE INSERT ON full_sync_info BEGIN DELETE FROM full_sync_info WHERE syncID NOT IN (SELECT syncID FROM full_sync_info ORDER BY syncID DESC LIMIT 1) AND active=0; END");
    ExecuteSQL_0(a2, "CREATE TRIGGER compute_duration AFTER UPDATE OF time_ended ON full_sync_info BEGIN UPDATE full_sync_info SET duration = new.time_ended - old.time_started WHERE syncID = old.syncID; END");
  }
  ExecuteSQL_0(a2, "ALTER TABLE syncstate ADD COLUMN ignored_message_id_set TEXT DEFAULT ''");
  uint64_t v5 = 2;
LABEL_5:
  id v6 = +[SYPersistentStore _loadOrCreatePeerIDForDB:a2];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 6, v6);
  }

  return v5;
}

- (void)_convertTimestamps
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to update timestamp format: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

uint64_t __29__SYPersistentStore__withDB___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 80));
}

- (BOOL)_inTransaction:(BOOL)a3 do:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    if (v4) {
      BOOL v8 = [(_SYSharedServiceDB *)sharedDB inExclusiveTransaction:v6];
    }
    else {
      BOOL v8 = [(_SYSharedServiceDB *)sharedDB inTransaction:v6];
    }
    BOOL v12 = v8;
  }
  else
  {
    uint64_t v19 = 0;
    int v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    int v9 = (void *)os_transaction_create();
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SYPersistentStore__inTransaction_do___block_invoke;
    block[3] = &unk_264423740;
    BOOL v18 = v4;
    block[4] = self;
    unsigned int v17 = &v19;
    id v15 = v9;
    id v16 = v6;
    id v11 = v9;
    dispatch_sync(syncQ, block);
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

void __39__SYPersistentStore__inTransaction_do___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(sqlite3 **)(*(void *)(a1 + 32) + 80);
  if (v2) {
    int v4 = ExecuteSQL_0(v3, "BEGIN TRANSACTION");
  }
  else {
    int v4 = ExecuteSQL_0(v3, "BEGIN EXCLUSIVE TRANSACTION");
  }
  if (v4)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __39__SYPersistentStore__inTransaction_do___block_invoke_cold_3();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      && ExecuteSQL_0(*(sqlite3 **)(*(void *)(a1 + 32) + 80), "COMMIT TRANSACTION"))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __39__SYPersistentStore__inTransaction_do___block_invoke_cold_2();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      && ExecuteSQL_0(*(sqlite3 **)(*(void *)(a1 + 32) + 80), "ROLLBACK TRANSACTION"))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __39__SYPersistentStore__inTransaction_do___block_invoke_cold_1();
      }
    }
  }
}

- (void)_fixPeerInfo
{
  if (![(SYPersistentStore *)self _inTransaction:0 do:&__block_literal_global_76])
  {
    [(SYPersistentStore *)self _withDB:&__block_literal_global_82];
  }
}

uint64_t __33__SYPersistentStore__fixPeerInfo__block_invoke(int a1, sqlite3 *db)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT DISTINCT peerID FROM peer_info", -1, &ppStmt, 0))
  {
    int v4 = objc_opt_new();
    int v5 = sqlite3_step(ppStmt);
    if (v5 == 100)
    {
      do
      {
        id v6 = ReadString(ppStmt);
        if (v6) {
          [v4 addObject:v6];
        }

        int v7 = sqlite3_step(ppStmt);
      }
      while (v7 == 100);
      int v5 = v7;
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
    if (!v5 || v5 == 101)
    {
      if ([v4 count])
      {
        if (sqlite3_prepare_v2(db, "DELETE FROM peer_info WHERE peerID=? AND last_seqno < (SELECT max(last_seqno) FROM peer_info WHERE peerID=?)", -1, &ppStmt, 0))
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v4;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
LABEL_27:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
            BindString_0(ppStmt, 1, v13);
            BindString_0(ppStmt, 2, v13);
            int v14 = sqlite3_step(ppStmt);
            sqlite3_reset(ppStmt);
            sqlite3_clear_bindings(ppStmt);
            if (v14 != 101 && v14 != 0) {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
              if (v10) {
                goto LABEL_27;
              }
              break;
            }
          }

          sqlite3_finalize(ppStmt);
          uint64_t v3 = 1;
          if (!v14 || v14 == 101) {
            goto LABEL_45;
          }
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
          }
          goto LABEL_24;
        }

        sqlite3_finalize(ppStmt);
      }
      uint64_t v3 = 1;
      goto LABEL_45;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
LABEL_23:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_24:
    uint64_t v3 = 0;
LABEL_45:

    return v3;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return 0;
}

uint64_t __33__SYPersistentStore__fixPeerInfo__block_invoke_80(int a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM peer_info");
}

- (id)_encodeIndexSet:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SYPersistentStore__encodeIndexSet___block_invoke;
  v8[3] = &unk_264423788;
  id v9 = v4;
  id v5 = v4;
  [v3 enumerateRangesUsingBlock:v8];

  id v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

void __37__SYPersistentStore__encodeIndexSet___block_invoke(uint64_t a1, NSRange range)
{
  int v2 = *(void **)(a1 + 32);
  NSStringFromRange(range);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)_decodeIndexSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = objc_opt_new();
  if ([v3 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v3, "componentsSeparatedByString:", @",", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(NSString **)(*((void *)&v13 + 1) + 8 * i);
          if ([(NSString *)v10 length])
          {
            NSRange v11 = NSRangeFromString(v10);
            objc_msgSend(v4, "addIndexesInRange:", v11.location, v11.length);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)_sequenceNumberSetForPeerID:(id)a3 inDB:(sqlite3 *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_peerSeqnoSets objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = objc_opt_new();
    ppStmt = 0;
    if (sqlite3_prepare_v2(a4, "SELECT seqno_set FROM peer_info WHERE peerID=?", -1, &ppStmt, 0))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    else
    {
      BindString_0(ppStmt, 1, v6);
      if (sqlite3_step(ppStmt) == 100)
      {
        uint64_t v10 = ReadString(ppStmt);
        NSRange v11 = [(SYPersistentStore *)self _decodeIndexSet:v10];
        [v9 addIndexes:v11];
      }
      sqlite3_finalize(ppStmt);
      [(NSMutableDictionary *)self->_peerSeqnoSets setObject:v9 forKeyedSubscript:v6];
    }
    id v8 = v9;
  }
  uint64_t v12 = v8;

  return v12;
}

- (BOOL)_LOCKED_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4 db:(sqlite3 *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  p_setPeerSeqNoSet = &self->_setPeerSeqNoSet;
  if (!self->_setPeerSeqNoSet
    && sqlite3_prepare_v2(a5, "UPDATE peer_info SET seqno_set=? WHERE peerID=?", -1, &self->_setPeerSeqNoSet, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    BOOL v14 = 0;
    goto LABEL_25;
  }
  if (v10)
  {
    long long v13 = [(SYPersistentStore *)self _encodeIndexSet:v10];
  }
  else
  {
    long long v13 = &stru_26CD1C9A0;
  }
  BindString_0(*p_setPeerSeqNoSet, 1, v13);
  BindString_0(*p_setPeerSeqNoSet, 2, v11);
  int v15 = sqlite3_step(*p_setPeerSeqNoSet);
  if (v15) {
    BOOL v16 = (v15 & 0xFFFFFFFE) == 100;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v14 = v16;
  if ((v15 - 100) >= 2 && v15 != 0)
  {
    int v19 = v15;
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR))
    {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      if (!a6) {
        goto LABEL_22;
      }
      goto LABEL_30;
    }
    if (a6)
    {
LABEL_30:
      NSErrorFromSQLiteError(v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_22:
  sqlite3_reset(*p_setPeerSeqNoSet);
  sqlite3_clear_bindings(*p_setPeerSeqNoSet);
  if (!v10) {
    [(NSMutableDictionary *)self->_peerSeqnoSets removeObjectForKey:v11];
  }

LABEL_25:
  return v14;
}

- (void)_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__SYPersistentStore__storeSequenceNumberSet_forPeerID___block_invoke;
  v10[3] = &unk_2644237B0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SYPersistentStore *)self _withDB:v10];
}

uint64_t __55__SYPersistentStore__storeSequenceNumberSet_forPeerID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), a2, 0);
}

- (void)_cacheTTL
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__SYPersistentStore__cacheTTL__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(SYPersistentStore *)self _withDB:v2];
}

uint64_t __30__SYPersistentStore__cacheTTL__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  sqlite3_prepare_v2(db, "SELECT MAX(ttl) FROM syncstate", 30, &ppStmt, 0);
  if (sqlite3_step(ppStmt) == 100) {
    *(double *)(*(void *)(a1 + 32) + 24) = (double)sqlite3_column_int(ppStmt, 0);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(double *)(v3 + 24) == 0.0) {
    *(void *)(v3 + 24) = 0x4132750000000000;
  }
  return sqlite3_finalize(ppStmt);
}

- (void)resetSequenceNumber:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__SYPersistentStore_resetSequenceNumber___block_invoke;
  v3[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
  v3[4] = a3;
  [(SYPersistentStore *)self _withDB:v3];
}

void __41__SYPersistentStore_resetSequenceNumber___block_invoke(uint64_t a1, sqlite3 *a2)
{
  if (ExecuteSQL_0(a2, "UPDATE syncstate SET msg_seqno=%llu", *(void *)(a1 + 32)))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (unint64_t)nextSequenceNumber
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SYPersistentStore_nextSequenceNumber__block_invoke;
  v6[3] = &unk_264422A28;
  void v6[4] = &v7;
  [(SYPersistentStore *)self _withDB:v6];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v2 = qword_26AB04798;
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = v8[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = v3;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Returning next sequence number: %llu", buf, 0xCu);
  }
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SYPersistentStore_nextSequenceNumber__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t result = ExecuteSQL_0(a2, "UPDATE syncstate SET msg_seqno=(msg_seqno+1)");
  if (!result)
  {
    ppStmt = 0;
    uint64_t result = sqlite3_prepare_v2(a2, "SELECT msg_seqno FROM syncstate LIMIT 1", -1, &ppStmt, 0);
    if (!result)
    {
      if ((sqlite3_step(ppStmt) & 0xFFFFFFFE) == 0x64)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __39__SYPersistentStore_nextSequenceNumber__block_invoke_cold_1();
        }
      }
      return sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

- (BOOL)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = v8;
  if (a3)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 1;
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    char v22 = __Block_byref_object_copy__7;
    uint64_t v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke;
    v14[3] = &unk_2644237F8;
    v14[4] = self;
    id v15 = v8;
    BOOL v16 = &v19;
    long long v17 = &v25;
    unint64_t v18 = a3;
    [(SYPersistentStore *)self _withDB:v14];
    if (a5)
    {
      uint64_t v10 = (void *)v20[5];
      if (v10) {
        *a5 = v10;
      }
    }
    LOBYTE(a5) = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[SYPersistentStore setLastSequenceNumber:fromPeer:error:]();
    }
    if (a5)
    {
      id v11 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v29 = *MEMORY[0x263F08320];
      v30[0] = @"Cannot store sequence number == 0; that value is invalid";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *a5 = (id)[v11 initWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v12];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  unint64_t v4 = *(sqlite3_stmt ***)(a1 + 32);
  if (v4[23])
  {
LABEL_2:
    id v5 = [v4 _sequenceNumberSetForPeerID:*(void *)(a1 + 40) inDB:db];
    [v5 addIndex:*(void *)(a1 + 64)];
    if (objc_msgSend(*(id *)(a1 + 32), "_lastSequenceNumberForPeerID_LOCKED:db:", *(void *)(a1 + 40), db))
    {
      sqlite3_bind_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 184), 1, *(void *)(a1 + 64));
      id v6 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 184);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      sqlite3_bind_double(v6, 2, Current + *MEMORY[0x263EFFAF8]);
      BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 184), 3, *(id *)(a1 + 40));
      int v8 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 184));
      if (v8)
      {
        int v9 = v8;
        if (v8 != 101)
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
            __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_3();
          }
          uint64_t v10 = NSErrorFromSQLiteError(v9);
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        }
      }
      sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 184));
      sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 184));
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id obj = 0;
      char v15 = objc_msgSend(v13, "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", v5, v14, db, &obj);
      id v16 = obj;
    }
    else
    {
      ppStmt = 0;
      int v17 = sqlite3_prepare_v2(db, "INSERT INTO peer_info (peerID, last_seqno, tstamp) VALUES (?, ?, ?)", -1, &ppStmt, 0);
      if (v17)
      {
        int v18 = v17;
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_2();
        }
        uint64_t v19 = NSErrorFromSQLiteError(v18);
        uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_23;
      }
      BindString_0(ppStmt, 1, *(id *)(a1 + 40));
      sqlite3_bind_int64(ppStmt, 2, *(void *)(a1 + 64));
      char v22 = ppStmt;
      CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent();
      sqlite3_bind_double(v22, 3, v23 + *MEMORY[0x263EFFAF8]);
      int v24 = sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
      if (v24 && v24 != 101)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_1();
        }
        uint64_t v25 = NSErrorFromSQLiteError(v24);
        uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
      char v28 = *(void **)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 40);
      v31 = 0;
      char v15 = objc_msgSend(v28, "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", v5, v29, db, &v31);
      id v16 = v31;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v16);
LABEL_23:

    return;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE peer_info SET last_seqno=?, tstamp=? WHERE peerID=?", -1, v4 + 23, 0))
  {
    unint64_t v4 = *(sqlite3_stmt ***)(a1 + 32);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4
{
}

- (unint64_t)_lastSequenceNumberForPeerID_LOCKED:(id)a3 db:(sqlite3 *)a4
{
  id v6 = a3;
  if (self->_db) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQ);
  }
  getPeerSeqNo = self->_getPeerSeqNo;
  p_getPeerSeqNo = &self->_getPeerSeqNo;
  uint64_t v7 = getPeerSeqNo;
  if (getPeerSeqNo)
  {
LABEL_4:
    BindString_0(v7, 1, v6);
    int v10 = sqlite3_step(*p_getPeerSeqNo);
    if (v10 == 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v12 = qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "No peer seqno recorded, returning special value zero", v14, 2u);
      }
    }
    else
    {
      if (v10 == 100)
      {
        sqlite3_int64 v11 = sqlite3_column_int64(*p_getPeerSeqNo, 0);
LABEL_22:
        sqlite3_reset(*p_getPeerSeqNo);
        goto LABEL_23;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[SYPersistentStore _lastSequenceNumberForPeerID_LOCKED:db:]();
      }
    }
    sqlite3_int64 v11 = 0;
    goto LABEL_22;
  }
  if (!sqlite3_prepare_v2(a4, "SELECT last_seqno FROM peer_info WHERE peerID=?", -1, p_getPeerSeqNo, 0))
  {
    uint64_t v7 = *p_getPeerSeqNo;
    goto LABEL_4;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_int64 v11 = 0;
LABEL_23:

  return v11;
}

- (unint64_t)lastSequenceNumberForPeerID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SYPersistentStore_lastSequenceNumberForPeerID___block_invoke;
  v8[3] = &unk_264423820;
  int v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(SYPersistentStore *)self _withDB:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __49__SYPersistentStore_lastSequenceNumberForPeerID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_lastSequenceNumberForPeerID_LOCKED:db:", *(void *)(a1 + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)sequenceNumberIsDuplicate:(unint64_t)a3 forPeer:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__SYPersistentStore_sequenceNumberIsDuplicate_forPeer___block_invoke;
  v9[3] = &unk_264423848;
  v9[4] = self;
  id v7 = v6;
  uint64_t v11 = &v13;
  unint64_t v12 = a3;
  id v10 = v7;
  [(SYPersistentStore *)self _withDB:v9];
  LOBYTE(a3) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a3;
}

void __55__SYPersistentStore_sequenceNumberIsDuplicate_forPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _sequenceNumberSetForPeerID:*(void *)(a1 + 40) inDB:a2];
  if ([v3 containsIndex:*(void *)(a1 + 56)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)resetSequenceNumbersForPeer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SYPersistentStore_resetSequenceNumbersForPeer___block_invoke;
  v6[3] = &unk_2644229D8;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

uint64_t __49__SYPersistentStore_resetSequenceNumbersForPeer___block_invoke(uint64_t a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM peer_info WHERE peerID='%s'", (const char *)[*(id *)(a1 + 32) UTF8String]);
}

- (BOOL)isPerformingDeltaSync
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SYPersistentStore_isPerformingDeltaSync__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__SYPersistentStore_isPerformingDeltaSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT in_delta_sync FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    int v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int(ppStmt, 0) != 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setPerformingDeltaSync:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SYPersistentStore_setPerformingDeltaSync___block_invoke;
  v3[3] = &__block_descriptor_33_e18_v16__0__sqlite3__8l;
  BOOL v4 = a3;
  [(SYPersistentStore *)self _withDB:v3];
}

void __44__SYPersistentStore_setPerformingDeltaSync___block_invoke(uint64_t a1, sqlite3 *a2)
{
  int v2 = ExecuteSQL_0(a2, "UPDATE syncstate SET in_delta_sync=%d", *(unsigned __int8 *)(a1 + 32));
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (void)_loadIgnoreList_LOCKED:(sqlite3 *)a3
{
  uint64_t v5 = (void *)MEMORY[0x21D4B1560](self, a2);
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, "SELECT ignored_message_id_set FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    int v6 = sqlite3_step(ppStmt);
    if (v6 != 101)
    {
      if (v6 == 100)
      {
        uint64_t v7 = ReadString(ppStmt);
        char v8 = [v7 componentsSeparatedByString:@","];
        id v9 = (NSMutableSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v8];
        ignoringMessageIDs = self->_ignoringMessageIDs;
        self->_ignoringMessageIDs = v9;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)_saveIgnoreList_LOCKED:(sqlite3 *)a3
{
  uint64_t v5 = (void *)MEMORY[0x21D4B1560](self, a2);
  if ([(NSMutableSet *)self->_ignoringMessageIDs count])
  {
    int v6 = [(NSMutableSet *)self->_ignoringMessageIDs allObjects];
    id v7 = (id)[v6 componentsJoinedByString:@","];

    char v8 = 0;
  }
  else
  {
    char v8 = &stru_26CD1C9A0;
  }
  int v9 = ExecuteSQL_0(a3, "UPDATE syncstate SET ignored_message_id_set=%s", (const char *)[(__CFString *)v8 UTF8String]);
  if (v9 && v9 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (void)addMessageIDsToIgnore:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_addMessageIDsToIgnore___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

uint64_t __43__SYPersistentStore_addMessageIDsToIgnore___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[8];
  if (!v5)
  {
    objc_msgSend(v4, "_loadIgnoreList_LOCKED:", a2);
    id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  uint64_t v6 = [v5 count];
  [*(id *)(*(void *)(a1 + 32) + 64) unionSet:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (v6 != result)
  {
    char v8 = *(void **)(a1 + 32);
    return objc_msgSend(v8, "_saveIgnoreList_LOCKED:", a2);
  }
  return result;
}

- (BOOL)shouldIgnoreMessageID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SYPersistentStore_shouldIgnoreMessageID___block_invoke;
  v7[3] = &unk_264423890;
  v7[4] = self;
  int v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(SYPersistentStore *)self _withDB:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__SYPersistentStore_shouldIgnoreMessageID___block_invoke(void *a1, uint64_t a2)
{
  int v3 = (void *)a1[4];
  id v4 = (void *)v3[8];
  if (!v4)
  {
    objc_msgSend(v3, "_loadIgnoreList_LOCKED:", a2);
    id v4 = *(void **)(a1[4] + 64);
  }
  uint64_t result = [v4 containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)removeMessageIDFromIgnoreList:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SYPersistentStore_removeMessageIDFromIgnoreList___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

uint64_t __51__SYPersistentStore_removeMessageIDFromIgnoreList___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[8];
  if (!v5)
  {
    objc_msgSend(v4, "_loadIgnoreList_LOCKED:", a2);
    id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  uint64_t v6 = [v5 count];
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (v6 != result)
  {
    id v8 = *(void **)(a1 + 32);
    return objc_msgSend(v8, "_saveIgnoreList_LOCKED:", a2);
  }
  return result;
}

- (NSString)path
{
  return self->_path;
}

- (double)timeToLive
{
  return self->_timeToLiveCache;
}

- (void)setTimeToLive:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__SYPersistentStore_setTimeToLive___block_invoke;
  v3[3] = &unk_2644238B8;
  void v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(SYPersistentStore *)self _withDB:v3];
}

void __35__SYPersistentStore_setTimeToLive___block_invoke(uint64_t a1, sqlite3 *a2)
{
  int v2 = (void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  if (ExecuteSQL_0(a2, "UPDATE syncstate SET ttl=%d", (int)*(double *)(a1 + 40)))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __35__SYPersistentStore_setTimeToLive___block_invoke_cold_1(v2);
    }
  }
}

- (unint64_t)changeCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SYPersistentStore_changeCount__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__SYPersistentStore_changeCount__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 96);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 96);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM changes", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 96);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSString)vectorClockJSON
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SYPersistentStore_vectorClockJSON__block_invoke;
  v5[3] = &unk_264422A28;
  v5[4] = &v6;
  [(SYPersistentStore *)self _withDB:v5];
  unint64_t v2 = (__CFString *)v7[5];
  if (!v2) {
    unint64_t v2 = @"{}";
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__SYPersistentStore_vectorClockJSON__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT vector_clock FROM syncstate LIMIT 1", 42, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      uint64_t v3 = ReadString(ppStmt);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setVectorClockJSON:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SYPersistentStore_setVectorClockJSON___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __40__SYPersistentStore_setVectorClockJSON___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 176);
  id v5 = (sqlite3_stmt **)(v3 + 176);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET vector_clock=?", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 176);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 176)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 176));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 176));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSDate)overflowResyncTime
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  int v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SYPersistentStore_overflowResyncTime__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __39__SYPersistentStore_overflowResyncTime__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT overflow_timeout FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    int v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        uint64_t v4 = ReadDate(ppStmt);
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setOverflowResyncTime:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_setOverflowResyncTime___block_invoke;
  v6[3] = &unk_2644229D8;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __43__SYPersistentStore_setOverflowResyncTime___block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE syncstate SET overflow_timeout=?", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    BindDate(ppStmt, *(void **)(a1 + 32));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (NSDate)lastMessageReceived
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  int v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SYPersistentStore_lastMessageReceived__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __40__SYPersistentStore_lastMessageReceived__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT last_message_time FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    int v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        uint64_t v4 = ReadDate(ppStmt);
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setLastMessageReceived:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SYPersistentStore_setLastMessageReceived___block_invoke;
  v6[3] = &unk_2644229D8;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __44__SYPersistentStore_setLastMessageReceived___block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE syncstate SET last_message_time=?", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  else
  {
    BindDate(ppStmt, *(void **)(a1 + 32));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)canStartNewSyncSession
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SYPersistentStore_canStartNewSyncSession__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__SYPersistentStore_canStartNewSyncSession__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 240);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 240);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT time_started FROM full_sync_info WHERE time_ended IS NULL ORDER BY time_started DESC LIMIT 1", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 240);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      uint64_t v7 = ReadDate(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 240));
      [v7 timeIntervalSinceNow];
      if (v8 <= -30.0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 240));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)enterFullSyncWithID:(id)a3 ignoring:(BOOL)a4
{
  id v6 = a3;
  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047A0, OS_LOG_TYPE_DEBUG)) {
      -[SYPersistentStore enterFullSyncWithID:ignoring:]();
    }
    uint64_t v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SYPersistentStore_enterFullSyncWithID_ignoring___block_invoke;
  v10[3] = &unk_2644238E0;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [(SYPersistentStore *)self _withDB:v10];
}

void __50__SYPersistentStore_enterFullSyncWithID_ignoring___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = *(sqlite3_stmt **)(v3 + 208);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 208);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "INSERT INTO full_sync_info (syncID, active, time_started) VALUES (?, ?, (julianday('now') - 2440587.5)*86400.0)", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 208);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 208), 2, *(unsigned char *)(a1 + 48) == 0);
    if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 208)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 208));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 208));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)exitFullSyncWithID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    double v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  }
  else
  {
    double v8 = 0;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__SYPersistentStore_exitFullSyncWithID_error___block_invoke;
  v13[3] = &unk_264423908;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v11 = v6;
  id v16 = v11;
  [(SYPersistentStore *)self _withDB:v13];
  if (self->_transaction)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047A0, OS_LOG_TYPE_DEBUG)) {
      -[SYPersistentStore exitFullSyncWithID:error:]();
    }
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047A0, OS_LOG_TYPE_ERROR)) {
      -[SYPersistentStore exitFullSyncWithID:error:]();
    }
  }
}

void __46__SYPersistentStore_exitFullSyncWithID_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = *(sqlite3_stmt **)(v3 + 216);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 216);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE full_sync_info SET active=0, failed=?, error=?, time_ended=(julianday('now')-2440587.5)*86400.0 WHERE syncID=?", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 216);
LABEL_2:
    sqlite3_bind_int(v4, 1, *(void *)(a1 + 40) != 0);
    BindData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 216), 2, *(void **)(a1 + 48));
    BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 216), 3, *(id *)(a1 + 56));
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 216)) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 216));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 216));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)reassignCurrentSyncID:(id)a3
{
  id v4 = a3;
  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v5 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Reassigning sync id, starting XPC transaction to stop us being Jetsammed until it's done.", buf, 2u);
    }
    id v6 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v6;
  }
  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__SYPersistentStore_reassignCurrentSyncID___block_invoke;
  v10[3] = &unk_264423930;
  BOOL v12 = buf;
  id v8 = v4;
  id v11 = v8;
  [(SYPersistentStore *)self _withDB:v10];

  _Block_object_dispose(buf, 8);
  return 1;
}

void __43__SYPersistentStore_reassignCurrentSyncID___block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE full_sync_info SET syncID=? WHERE active=1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 32));
    if (sqlite3_step(ppStmt) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)ignoringFullSyncWithID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SYPersistentStore_ignoringFullSyncWithID___block_invoke;
  v7[3] = &unk_264423958;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SYPersistentStore *)self _withDB:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__SYPersistentStore_ignoringFullSyncWithID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = *(sqlite3_stmt **)(v3 + 224);
  id v5 = (sqlite3_stmt **)(v3 + 224);
  id v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE active=0 AND time_ended IS NULL AND syncID=?", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 224);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 224)) - 102) > 0xFFFFFFFD)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 224), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 224));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 224));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)sendCompletedForSyncWithID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SYPersistentStore_sendCompletedForSyncWithID___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __48__SYPersistentStore_sendCompletedForSyncWithID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 272);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE full_sync_info SET send_complete=1 WHERE syncID=?", -1, (sqlite3_stmt **)(v3 + 272), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 272);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 272)) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 272));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 272));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)currentSyncSendComplete
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SYPersistentStore_currentSyncSendComplete__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__SYPersistentStore_currentSyncSendComplete__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 280);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE time_ended IS NULL AND send_complete=1 LIMIT 1", -1, (sqlite3_stmt **)(v3 + 280), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 280);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 280), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 280));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)lastSyncFailed
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SYPersistentStore_lastSyncFailed__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__SYPersistentStore_lastSyncFailed__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 288);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT error FROM full_sync_info WHERE time_ended IS NOT NULL ORDER BY time_started DESC LIMIT 1", -1, (sqlite3_stmt **)(v3 + 288), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 288);
LABEL_2:
    int v5 = sqlite3_step(v4);
    if ((v5 - 102) > 0xFFFFFFFD)
    {
      if (v5 != 101)
      {
        id v6 = ReadData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 288));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6 != 0;
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 288));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSError)lastSyncError
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__7;
  id v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_lastSyncError__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

uint64_t __34__SYPersistentStore_lastSyncError__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 288)) == 100)
  {
    id v2 = ReadData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 288));
    if (v2)
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x263F08928], "sy_unarchivedObjectFromData:", v2);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 288));
}

- (void)_verifyInTransactionForFullSync
{
  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v3 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Current sync ID is non-nil but we're not in a transaction. Must be left-over from a dead process? Either way, I'm entering a new transaction now. Yes, it's hacky. Hackiness is inversely proportional to the amount of coffee ingested.", v6, 2u);
    }
    uint64_t v4 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v4;
  }
}

- (NSString)currentFullSyncID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7;
  id v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SYPersistentStore_currentFullSyncID__block_invoke;
  v5[3] = &unk_2644236E8;
  v5[4] = self;
  void v5[5] = &v6;
  [(SYPersistentStore *)self _withDB:v5];
  if ([(id)v7[5] length]) {
    [(SYPersistentStore *)self _verifyInTransactionForFullSync];
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__SYPersistentStore_currentFullSyncID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 232);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 232);
  uint64_t v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT syncID FROM full_sync_info WHERE time_ended IS NULL ORDER BY time_started DESC LIMIT 1", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 232);
LABEL_2:
    int v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      if (v7 == 100)
      {
        uint64_t v8 = ReadString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 232));
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 232));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)inFullSync
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SYPersistentStore_inFullSync__block_invoke;
  v5[3] = &unk_2644236E8;
  v5[4] = self;
  void v5[5] = &v6;
  [(SYPersistentStore *)self _withDB:v5];
  if (*((unsigned char *)v7 + 24))
  {
    [(SYPersistentStore *)self _verifyInTransactionForFullSync];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__SYPersistentStore_inFullSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 88);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 88);
  uint64_t v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE time_ended IS NULL", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 88);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __31__SYPersistentStore_inFullSync__block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSString)lastSyncEndID
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  char v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_lastSyncEndID__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __34__SYPersistentStore_lastSyncEndID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 248);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 248);
  uint64_t v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT syncID FROM full_sync_info WHERE time_ended IS NOT NULL ORDER BY time_ended DESC LIMIT 1", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 248);
LABEL_2:
    int v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      if (v7 == 100)
      {
        uint64_t v8 = ReadString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 248));
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 248));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSString)waitingForSyncEndID
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SYPersistentStore_waitingForSyncEndID__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__SYPersistentStore_waitingForSyncEndID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(sqlite3_stmt **)(v3 + 256);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT waiting_for_sync_id FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 256), 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 256);
LABEL_2:
    int v5 = sqlite3_step(v4);
    if (v5 != 101)
    {
      if (v5 == 100)
      {
        uint64_t v6 = ReadString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 256));
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 256));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)setWaitingForSyncEndID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SYPersistentStore_setWaitingForSyncEndID___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __44__SYPersistentStore_setWaitingForSyncEndID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 264);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET waiting_for_sync_id=?", -1, (sqlite3_stmt **)(v3 + 264), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 264);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 264)) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 264));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 264));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSDictionary)fullSyncUserInfo
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__SYPersistentStore_fullSyncUserInfo__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__SYPersistentStore_fullSyncUserInfo__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 304);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT sync_user_info FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 304), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 304);
LABEL_2:
    if (sqlite3_step(v4) == 100)
    {
      uint64_t v5 = ReadData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 304));
      uint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = _DictionaryFromData(v5);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 304));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)setFullSyncUserInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SYPersistentStore_setFullSyncUserInfo___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __41__SYPersistentStore_setFullSyncUserInfo___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 296)
    || !sqlite3_prepare_v2(db, "UPDATE syncstate SET sync_user_info=?", -1, (sqlite3_stmt **)(v3 + 296), 0))
  {
    id v4 = _DataFromDictionary(*(void **)(a1 + 40));
    BindData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 296), 1, v4);
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 296)) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 296));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 296));
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (NSDictionary)fullSyncIDSOptions
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SYPersistentStore_fullSyncIDSOptions__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __39__SYPersistentStore_fullSyncIDSOptions__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(sqlite3_stmt **)(v3 + 320);
  if (v4) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT sync_ids_options FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 320), 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 320);
LABEL_2:
    if (sqlite3_step(v4) == 100)
    {
      uint64_t v5 = ReadData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 320));
      uint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = _DictionaryFromData(v5);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 320));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)setFullSyncIDSOptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_setFullSyncIDSOptions___block_invoke;
  v6[3] = &unk_2644236C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYPersistentStore *)self _withDB:v6];
}

void __43__SYPersistentStore_setFullSyncIDSOptions___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 312)
    || !sqlite3_prepare_v2(db, "UPDATE syncstate SET sync_ids_options=?", -1, (sqlite3_stmt **)(v3 + 312), 0))
  {
    id v4 = _DataFromDictionary(*(void **)(a1 + 40));
    BindData(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 312), 1, v4);
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 312)) != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 312));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 312));
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (BOOL)completedSync
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_completedSync__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__SYPersistentStore_completedSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 128);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 128);
  id v4 = v6;
  if (v6)
  {
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 128), 0) != 0;
      uint64_t v7 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 128);
      sqlite3_reset(v7);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    return;
  }
  if (!sqlite3_prepare_v2(db, "SELECT MAX(fullsync_sent) FROM syncstate", -1, v5, 0))
  {
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 128);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)setCompletedSync:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__SYPersistentStore_setCompletedSync___block_invoke;
  v3[3] = &unk_264423980;
  void v3[4] = self;
  BOOL v4 = a3;
  [(SYPersistentStore *)self _withDB:v3];
}

void __38__SYPersistentStore_setCompletedSync___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 136);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 136);
  BOOL v4 = v6;
  if (!v6)
  {
    if (sqlite3_prepare_v2(db, "UPDATE syncstate SET fullsync_sent=?", -1, v5, 0))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      return;
    }
    BOOL v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 136);
  }
  sqlite3_bind_int(v4, 1, *(unsigned __int8 *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 136)) - 102) > 0xFFFFFFFD)
  {
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 136));
    uint64_t v7 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 136);
    sqlite3_clear_bindings(v7);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
LABEL_14:
    }
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (double)durationOfLastFullSync
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SYPersistentStore_durationOfLastFullSync__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

sqlite3_stmt *__43__SYPersistentStore_durationOfLastFullSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT duration FROM full_sync_info ORDER BY time_ended DESC LIMIT 1", -1, &ppStmt, 0))
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_double(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    uint64_t result = ppStmt;
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  uint64_t result = ppStmt;
  if (ppStmt) {
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  return result;
}

- (unint64_t)currentLocalVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SYPersistentStore_currentLocalVersion__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__SYPersistentStore_currentLocalVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 160);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 160);
  BOOL v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT seq FROM sqlite_sequence WHERE name='changes'", -1, v5, 0))
  {
    BOOL v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 160);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 160), 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 160));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (unint64_t)lastSeenRemoteVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SYPersistentStore_lastSeenRemoteVersion__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

sqlite3_stmt *__42__SYPersistentStore_lastSeenRemoteVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT MAX(remoteversion) FROM syncstate", 40, &ppStmt, 0))
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    uint64_t result = ppStmt;
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  uint64_t result = ppStmt;
  if (ppStmt) {
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  return result;
}

- (BOOL)logChanges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__SYPersistentStore_logChanges_error___block_invoke;
  v10[3] = &unk_2644239A8;
  void v10[4] = self;
  id v11 = v6;
  uint64_t v12 = a4;
  id v7 = v6;
  BOOL v8 = [(SYPersistentStore *)self _inTransaction:1 do:v10];
  [(SYPersistentStore *)self setCachedChangedSyncIDsVersion:0];

  return v8;
}

uint64_t __38__SYPersistentStore_logChanges_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 120);
  uint64_t v5 = (sqlite3_stmt **)(v4 + 120);
  if (v6 || !sqlite3_prepare_v2(db, "INSERT INTO changes (tstamp, type, syncid) VALUES (?, ?, ?)", -1, v5, 0))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      double v11 = *MEMORY[0x263EFFAF8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          char v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v14 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 120);
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          sqlite3_bind_double(v14, 1, Current + v11);
          sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 120), 2, objc_msgSend(v13, "type", (void)v26));
          char v16 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 120);
          int v17 = [v13 objectId];
          BindString_0(v16, 3, v17);

          int v18 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 120));
          sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 120));
          sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 120));
          if ((v18 & 0xFFFFFFFE) != 0x64)
          {
            uint64_t v20 = sqlite3_errmsg(db);
            if (*(void *)(a1 + 48))
            {
              uint64_t v21 = (void *)MEMORY[0x263F087E8];
              uint64_t v22 = v18;
              uint64_t v30 = *MEMORY[0x263F08320];
              CFAbsoluteTime v23 = [NSString stringWithUTF8String:v20];
              v31 = v23;
              int v24 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
              **(void **)(a1 + 48) = [v21 errorWithDomain:@"SYPersistentStoreErrorDomain" code:v22 userInfo:v24];
            }
            uint64_t v19 = 0;
            goto LABEL_14;
          }
          [v13 setVersion:sqlite3_last_insert_rowid(db)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v19 = 1;
LABEL_14:
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    return 0;
  }
  return v19;
}

- (BOOL)logSyncCompletionToRemoteVersion:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SYPersistentStore_logSyncCompletionToRemoteVersion___block_invoke;
  v5[3] = &unk_2644239D0;
  void v5[5] = &v6;
  void v5[6] = a3;
  v5[4] = self;
  [(SYPersistentStore *)self _withDB:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__SYPersistentStore_logSyncCompletionToRemoteVersion___block_invoke(void *a1, sqlite3 *db)
{
  uint64_t v3 = a1[4];
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 144);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 144);
  uint64_t v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET tstamp=(julianday('now')-2440587.5)*86400.0, remoteversion=?", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(a1[4] + 144);
LABEL_2:
    sqlite3_bind_int64(v4, 1, a1[6]);
    if ((sqlite3_step(*(sqlite3_stmt **)(a1[4] + 144)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
    sqlite3_reset(*(sqlite3_stmt **)(a1[4] + 144));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1[4] + 144));
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (unint64_t)_oldestVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SYPersistentStore__oldestVersion__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  void v4[5] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__SYPersistentStore__oldestVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 168);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 168);
  uint64_t v4 = v6;
  if (v6)
  {
LABEL_2:
    sqlite3_step(v4);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 168), 0);
    uint64_t v7 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 168);
    sqlite3_reset(v7);
    return;
  }
  if (!sqlite3_prepare_v2(db, "SELECT MIN(version) FROM changes", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 168);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4
{
  id v6 = a3;
  if ([(SYPersistentStore *)self cachedChangedSyncIDsVersion] != a4
    || ([(SYPersistentStore *)self cachedChangedSyncIDs],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    unint64_t v8 = [(SYPersistentStore *)self currentLocalVersion];
    unint64_t v9 = [(SYPersistentStore *)self _oldestVersion];
    BOOL v11 = v8 < a4 && v9 > a4 + 1;
    [(SYPersistentStore *)self setCachedVersionStale:v11];
    id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if (![(SYPersistentStore *)self cachedVersionStale])
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __48__SYPersistentStore_objectChanged_sinceVersion___block_invoke;
      v17[3] = &unk_2644239F8;
      v17[4] = self;
      unint64_t v19 = a4;
      id v18 = v12;
      [(SYPersistentStore *)self _withDB:v17];
    }
    [(SYPersistentStore *)self setCachedChangedSyncIDs:v12];
    [(SYPersistentStore *)self setCachedChangedSyncIDsVersion:a4];
  }
  if ([(SYPersistentStore *)self cachedVersionStale])
  {
    char v13 = 1;
  }
  else
  {
    id v14 = [(SYPersistentStore *)self cachedChangedSyncIDs];
    uint64_t v15 = [v6 syncId];
    char v13 = [v14 containsObject:v15];
  }
  return v13;
}

void __48__SYPersistentStore_objectChanged_sinceVersion___block_invoke(void *a1, sqlite3 *db)
{
  uint64_t v3 = a1[4];
  id v6 = *(sqlite3_stmt **)(v3 + 152);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 152);
  uint64_t v4 = v6;
  if (v6) {
    goto LABEL_2;
  }
  if (!sqlite3_prepare_v2(db, "SELECT DISTINCT syncid FROM changes WHERE version > ?", -1, v5, 0))
  {
    uint64_t v4 = *(sqlite3_stmt **)(a1[4] + 152);
LABEL_2:
    sqlite3_bind_int64(v4, 1, a1[6]);
    while (sqlite3_step(*(sqlite3_stmt **)(a1[4] + 152)) == 100)
    {
      uint64_t v7 = (void *)a1[5];
      unint64_t v8 = ReadString(*(sqlite3_stmt **)(a1[4] + 152));
      [v7 addObject:v8];
    }
    sqlite3_reset(*(sqlite3_stmt **)(a1[4] + 152));
    unint64_t v9 = *(sqlite3_stmt **)(a1[4] + 152);
    sqlite3_clear_bindings(v9);
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)clearAllChanges
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__SYPersistentStore_clearAllChanges__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(SYPersistentStore *)self _withDB:v2];
}

void __36__SYPersistentStore_clearAllChanges__block_invoke(uint64_t a1, sqlite3 *a2)
{
  [*(id *)(a1 + 32) setCachedChangedSyncIDs:0];
  int v3 = ExecuteSQL_0(a2, "DELETE FROM changes");
  if (v3 && v3 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (void)changeTrackingToggled:(BOOL)a3
{
  if (self->_changeTrackingEnabled != a3)
  {
    self->_changeTrackingEnabled = a3;
    if (!a3) {
      [(SYPersistentStore *)self _withDB:&__block_literal_global_153];
    }
  }
}

uint64_t __43__SYPersistentStore_changeTrackingToggled___block_invoke(int a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM changes");
}

- (double)unfinishedSyncTimeout
{
  return self->_unfinishedSyncTimeout;
}

- (void)setUnfinishedSyncTimeout:(double)a3
{
  self->_unfinishedSyncTimeout = a3;
}

- (NSSet)cachedChangedSyncIDs
{
  return self->_cachedChangedSyncIDs;
}

- (void)setCachedChangedSyncIDs:(id)a3
{
}

- (unint64_t)cachedChangedSyncIDsVersion
{
  return self->_cachedChangedSyncIDsVersion;
}

- (void)setCachedChangedSyncIDsVersion:(unint64_t)a3
{
  self->_cachedChangedSyncIDsVersion = a3;
}

- (BOOL)cachedVersionStale
{
  return self->_cachedVersionStale;
}

- (void)setCachedVersionStale:(BOOL)a3
{
  self->_cachedVersionStale = a3;
}

- (_SYSharedServiceDB)sharedDB
{
  return self->_sharedDB;
}

- (void)setSharedDB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_cachedChangedSyncIDs, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_ignoringMessageIDs, 0);
  objc_storeStrong((id *)&self->_peerSeqnoSets, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)lastDBErrorInfo
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = __Block_byref_object_copy__7;
  unint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SYPersistentStore_UnitTestHelper__lastDBErrorInfo__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(SYPersistentStore *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__SYPersistentStore_UnitTestHelper__lastDBErrorInfo__block_invoke(uint64_t a1, sqlite3 *db)
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = sqlite3_errcode(db);
  uint64_t v5 = sqlite3_errmsg(db);
  if (v5)
  {
    if (v4)
    {
      id v6 = v5;
      v12[0] = @"code";
      uint64_t v7 = [NSNumber numberWithInt:v4];
      v12[1] = @"message";
      v13[0] = v7;
      unint64_t v8 = [NSString stringWithUTF8String:v6];
      v13[1] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      BOOL v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (id)dbPath
{
  if (self->_sharedDB)
  {
    id v2 = [(_SYSharedServiceDB *)self->_sharedDB _dbPath];
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    unint64_t v8 = __Block_byref_object_copy__7;
    uint64_t v9 = __Block_byref_object_dispose__7;
    id v10 = 0;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __43__SYPersistentStore_UnitTestHelper__dbPath__block_invoke;
    v4[3] = &unk_264422A28;
    v4[4] = &v5;
    [(SYPersistentStore *)self _withDB:v4];
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v2;
}

const char *__43__SYPersistentStore_UnitTestHelper__dbPath__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t result = sqlite3_db_filename(db, "main");
  if (result)
  {
    uint64_t v4 = [[NSString alloc] initWithUTF8String:result];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void *)(v5 + 40);
    *(void *)(v5 + 40) = v4;
    return (const char *)MEMORY[0x270F9A758](v4, v6);
  }
  return result;
}

+ (void)_tableEmpty:(uint64_t)a1 db:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v1, v2, "Error checking for empty table %{public}@: %{companionsync:sqlite3err}d", (void)v3, DWORD2(v3));
}

- (void)_getSchemaVersion
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error fetching schema version: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

- (void)_openDBAtPath:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v1, v2, "Error opening SQLite3 DB at (%@): %{companionsync:sqlite3err}d", (void)v3, DWORD2(v3));
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Failed to rollback %s transaction: %{companionsync:sqlite3err}d");
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Failed to commit %s transaction: %{companionsync:sqlite3err}d");
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Failed to begin %s transaction: %{companionsync:sqlite3err}d");
}

void __39__SYPersistentStore_nextSequenceNumber__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error fetching incremented sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

- (void)setLastSequenceNumber:fromPeer:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "SYPersistentStore asked to store a seqno == 0, which is INVALID.", v1, 2u);
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error inserting new Peer Sequence Number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error creating peer_info insert statement: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error updating peer message sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

- (void)_lastSequenceNumberForPeerID_LOCKED:db:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error fetching peer message sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

void __35__SYPersistentStore_setTimeToLive___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v1, v2, "SQLite error while storing new TTL value %f: %{companionsync:sqlite3err}d", (void)v3, DWORD2(v3));
}

- (void)enterFullSyncWithID:ignoring:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_DEBUG, "Beginning XPC transaction for full-sync, to stop us being Jetsammed until it's done.", v1, 2u);
}

- (void)exitFullSyncWithID:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Did not end full-sync xpc transaction as it was never opened.", v1, 2u);
}

- (void)exitFullSyncWithID:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_DEBUG, "Ending XPC transaction for full-sync", v1, 2u);
}

void __31__SYPersistentStore_inFullSync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQLite error: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

@end