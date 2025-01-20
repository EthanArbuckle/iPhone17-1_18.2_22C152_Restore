@interface CPSClipDataSQLiteStore
+ (CPSClipDataSQLiteStore)defaultStore;
- (BOOL)_checkDatabaseIntegrity;
- (BOOL)_insertAppClipRecord:(id)a3;
- (BOOL)_insertOrReplaceEntryPointRecord:(id)a3;
- (BOOL)_isDatabaseOpen;
- (BOOL)_updateAppClipRecord:(id)a3;
- (CPSClipDataSQLiteStore)init;
- (CPSClipDataSQLiteStore)initWithDatabaseURL:(id)a3;
- (int)_createClipEntryPointsTable;
- (int)_createFreshDatabaseSchema;
- (int)_migrateToCurrentSchemaVersionIfNeeded;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (int)_migrateToSchemaVersion_5;
- (int)_migrateToSchemaVersion_6;
- (int)_migrateToSchemaVersion_7;
- (int)_migrateToSchemeVersion_8;
- (int)_schemaVersion;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (void)_checkDatabaseIntegrity;
- (void)_closeDatabase;
- (void)_createClipEntryPointsTable;
- (void)_createFreshDatabaseSchema;
- (void)_migrateToSchemaVersion_2;
- (void)_migrateToSchemaVersion_4;
- (void)_migrateToSchemaVersion_5;
- (void)_migrateToSchemaVersion_6;
- (void)_migrateToSchemaVersion_7;
- (void)_migrateToSchemeVersion_8;
- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3;
- (void)getAppClipRecordWithBundleID:(id)a3 completion:(id)a4;
- (void)getEntryPointRecordWithWebClipIdentifier:(id)a3 completion:(id)a4;
- (void)removeRecordWithBundleID:(id)a3;
- (void)saveAppClipRecord:(id)a3 completion:(id)a4;
- (void)saveClipEntryPointRecord:(id)a3 completion:(id)a4;
@end

@implementation CPSClipDataSQLiteStore

+ (CPSClipDataSQLiteStore)defaultStore
{
  if (+[CPSClipDataSQLiteStore defaultStore]::onceToken != -1) {
    dispatch_once(&+[CPSClipDataSQLiteStore defaultStore]::onceToken, &__block_literal_global_14);
  }
  v2 = (void *)+[CPSClipDataSQLiteStore defaultStore]::store;

  return (CPSClipDataSQLiteStore *)v2;
}

void __38__CPSClipDataSQLiteStore_defaultStore__block_invoke()
{
  v0 = [CPSClipDataSQLiteStore alloc];
  v1 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/com.apple.ClipServices.clipserviced/"];
  v2 = [MEMORY[0x263F08850] defaultManager];
  if (([v2 fileExistsAtPath:v1] & 1) == 0) {
    objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v1, 0);
  }
  v3 = NSURL;
  v4 = [v1 stringByAppendingPathComponent:@"ClipData.db"];
  v5 = [v4 stringByResolvingSymlinksInPath];
  id v8 = [v3 fileURLWithPath:v5 isDirectory:0];

  uint64_t v6 = [(CPSClipDataSQLiteStore *)v0 initWithDatabaseURL:v8];
  v7 = (void *)+[CPSClipDataSQLiteStore defaultStore]::store;
  +[CPSClipDataSQLiteStore defaultStore]::store = v6;
}

- (CPSClipDataSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPSClipDataSQLiteStore;
  v5 = [(CPSClipDataSQLiteStore *)&v22 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = (NSURL *)v4;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F66368] inMemoryDatabaseURL];
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ClipService.CPSClipDataSQLiteStore", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v11 = v5->_databaseQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__CPSClipDataSQLiteStore_initWithDatabaseURL___block_invoke;
    v15[3] = &unk_26424FA70;
    v12 = v5;
    v16 = v12;
    v17 = &v18;
    dispatch_sync(v11, v15);
    if (*((unsigned char *)v19 + 24)) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v7 = v13;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __46__CPSClipDataSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseAndCheckIntegrity:0];
  uint64_t result = [*(id *)(a1 + 32) _isDatabaseOpen];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CPSClipDataSQLiteStore)init
{
  return [(CPSClipDataSQLiteStore *)self initWithDatabaseURL:0];
}

- (BOOL)_checkDatabaseIntegrity
{
  v2 = [(WBSSQLiteDatabase *)self->_database fetchQuery:@"PRAGMA integrity_check(1)"];
  v3 = [v2 nextObject];
  id v4 = [v3 stringAtIndex:0];
  v5 = [v2 statement];
  [v5 invalidate];

  if (!v3)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CPSClipDataSQLiteStore *)v7 _checkDatabaseIntegrity];
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"ok"] & 1) == 0)
  {
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(CPSClipDataSQLiteStore *)(uint64_t)v4 _checkDatabaseIntegrity];
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x263F66368]) initWithURL:self->_databaseURL queue:self->_databaseQueue];
  database = self->_database;
  self->_database = v5;

  if ([(WBSSQLiteDatabase *)self->_database openWithAccessType:3 error:0])
  {
    if (v3 && ![(CPSClipDataSQLiteStore *)self _checkDatabaseIntegrity])
    {
      goto LABEL_17;
    }
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA journal_mode = WAL") != 100)
    {
      v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CPSClipDataSQLiteStore _openDatabaseAndCheckIntegrity:]((uint64_t)&self->_databaseURL, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = ON");
    int v14 = [(CPSClipDataSQLiteStore *)self _migrateToCurrentSchemaVersionIfNeeded];
    if (v14 != 8)
    {
      int v15 = v14;
      uint64_t v16 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(CPSClipDataSQLiteStore *)(uint64_t *)&self->_databaseURL _openDatabaseAndCheckIntegrity:v16];
      }
LABEL_17:
      [(CPSClipDataSQLiteStore *)self _closeDatabase];
    }
  }
  else
  {
    uint64_t v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CPSClipDataSQLiteStore _openDatabaseAndCheckIntegrity:]((uint64_t)&self->_databaseURL, v17, v18, v19, v20, v21, v22, v23);
    }
    v24 = self->_database;
    self->_database = 0;
  }
}

- (void)_closeDatabase
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (int)_schemaVersion
{
  v2 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  BOOL v3 = [v2 nextObject];
  int v4 = [v3 intAtIndex:0];

  v5 = [v2 statement];
  [v5 invalidate];

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  database = self->_database;
  BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    uint64_t v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2114;
      int v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_21559C000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  unsigned int v3 = [(CPSClipDataSQLiteStore *)self _schemaVersion];
  int v4 = v3;
  if (v3 <= 7)
  {
    if (v3)
    {
      uint64_t v5 = v3 + 1;
      while (v5 != 9)
      {
        int v6 = [(CPSClipDataSQLiteStore *)self _migrateToSchemaVersion:v5];
        uint64_t v5 = (v5 + 1);
        if (v6 != 101) {
          return v4;
        }
      }
    }
    else if ([(CPSClipDataSQLiteStore *)self _createFreshDatabaseSchema] != 101)
    {
      return 0;
    }
    int v4 = 8;
    [(CPSClipDataSQLiteStore *)self _setDatabaseSchemaVersion:8];
  }
  return v4;
}

- (int)_createFreshDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE app_clips (id INTEGER PRIMARY KEY AUTOINCREMENT,bundle_id TEXT NOT NULL UNIQUE,user_notification_consent INTEGER DEFAULT NULL,location_confirmation_consent INTEGER DEFAULT NULL,allows_location_confirmation_after_launch BOOL DEFAULT 0,last_user_notification_request_time REAL DEFAULT NULL,last_version_check_time REAL DEFAULT NULL,last_install_time REAL DEFAULT NULL,parent_app_name TEXT DEFAULT NULL,parent_app_caption TEXT DEFAULT NULL,parent_app_store_url TEXT DEFAULT NULL)");
  if (v3 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX app_clips__bundle_id ON app_clips (bundle_id)") != 101)
    {
      int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _createFreshDatabaseSchema]();
      }
    }
    return [(CPSClipDataSQLiteStore *)self _createClipEntryPointsTable];
  }
  else
  {
    int v5 = v3;
    int v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createFreshDatabaseSchema]();
    }
  }
  return v5;
}

- (int)_createClipEntryPointsTable
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE clip_entry_points (id INTEGER PRIMARY KEY AUTOINCREMENT,app_clip_bundle_id TEXT DEFAULT NULL,web_clip_id TEXT NOT NULL UNIQUE,last_abr_fetch_time REAL DEFAULT 0,FOREIGN KEY(app_clip_bundle_id) REFERENCES app_clips(bundle_id) ON DELETE CASCADE ON UPDATE CASCADE)");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createClipEntryPointsTable]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke;
  v13[3] = &unk_26424FA98;
  v13[4] = self;
  int v5 = (void (**)(void))MEMORY[0x2166BE5C0](v13, a2);
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION");
  if (v6 == 101)
  {
    switch((int)v3)
    {
      case 1:
        goto LABEL_8;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        int v7 = [(CPSClipDataSQLiteStore *)self _migrateToSchemaVersion];
        goto LABEL_7;
      case 8:
        int v7 = [(CPSClipDataSQLiteStore *)self _migrateToSchemeVersion];
LABEL_7:
        int v6 = v7;
        if (v7 != 101) {
          goto LABEL_17;
        }
LABEL_8:
        int v6 = [(CPSClipDataSQLiteStore *)self _setDatabaseSchemaVersion:v3];
        if (v6 != 101) {
          goto LABEL_19;
        }
        int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION");
        if (v6 != 101)
        {
          uint64_t v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[CPSClipDataSQLiteStore _migrateToSchemaVersion:]();
          }
LABEL_19:
          v5[2](v5);
        }
        break;
      default:
        uint64_t v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CPSClipDataSQLiteStore _migrateToSchemaVersion:]();
        }
        int v6 = 1;
LABEL_17:
        uint64_t v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CPSClipDataSQLiteStore _migrateToSchemaVersion:]();
        }
        goto LABEL_19;
    }
  }
  else
  {
    uint64_t v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion:].cold.4();
    }
  }

  return v6;
}

void __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 16), 0, @"ROLLBACK TRANSACTION") != 101)
  {
    v1 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE app_clips ADD COLUMN parent_app_name TEXT DEFAULT NULL");
  if (v3 != 101)
  {
    int v4 = v3;
    uint64_t v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_2]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE app_clips ADD COLUMN parent_app_caption TEXT DEFAULT NULL");
  if (v4 != 101)
  {
    uint64_t v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_2]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE clip_entry_points (id INTEGER PRIMARY KEY AUTOINCREMENT,app_clip_bundle_id TEXT DEFAULT NULL REFERENCES app_clips(bundle_id) ON DELETE SET NULL,web_clip_id TEXT NOT NULL UNIQUE,last_abr_fetch_time REAL DEFAULT 0)");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createClipEntryPointsTable]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_4
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE app_clips ADD COLUMN location_confirmation_consent BOOL DEFAULT 0");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_4]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_5
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE app_clips ADD COLUMN parent_app_store_url TEXT DEFAULT NULL");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_5]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_6
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE app_clips ADD COLUMN allows_location_confirmation_after_launch BOOL DEFAULT 0");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_6]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_7
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"UPDATE app_clips SET user_notification_consent = NULL, location_confirmation_consent = NULL");
  if (v3 != 101)
  {
    int v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_7]();
    }
  }
  return v3;
}

- (int)_migrateToSchemeVersion_8
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE clip_entry_points RENAME TO clip_entry_points_old");
  if (v3 != 101)
  {
    int v4 = v3;
    uint64_t v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8]();
    }
    goto LABEL_12;
  }
  int v4 = [(CPSClipDataSQLiteStore *)self _createClipEntryPointsTable];
  if (v4 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"INSERT INTO clip_entry_points (id, app_clip_bundle_id, web_clip_id, last_abr_fetch_time)SELECT clip_entry_points_old.id, clip_entry_points_old.app_clip_bundle_id, clip_entry_points_old.web_clip_id, clip_entry_points_old.last_abr_fetch_time FROM clip_entry_points_old") != 101)
    {
      uint64_t v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8]();
      }
    }
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE clip_entry_points_old");
    if (v4 != 101)
    {
      uint64_t v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8]();
      }
LABEL_12:
    }
  }
  return v4;
}

- (void)saveAppClipRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleID];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CPSClipDataSQLiteStore_saveAppClipRecord_completion___block_invoke;
    block[3] = &unk_26424FAC0;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(databaseQueue, block);
  }
  else
  {
    uint64_t v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21559C000, v11, OS_LOG_TYPE_DEFAULT, "Not saving app clip record because bundle ID is nil", buf, 2u);
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __55__CPSClipDataSQLiteStore_saveAppClipRecord_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _updateAppClipRecord:*(void *)(a1 + 40)];
  int v3 = [*(id *)(a1 + 40) fullApplicationName];
  objc_msgSend(v3, "cps_privacyPreservingDescription");
  int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = v4;
      _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated existing app clip record with full app named %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) _insertAppClipRecord:*(void *)(a1 + 40)];
    id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"Failed to insert";
      if (v6) {
        uint64_t v8 = @"Successfully inserted";
      }
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_DEFAULT, "%@ new app clip record with full app named %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v6);
  }
}

- (BOOL)_updateAppClipRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:self->_database, @"UPDATE app_clips SET user_notification_consent = ?, location_confirmation_consent = ?, allows_location_confirmation_after_launch = ?, last_user_notification_request_time = ?, last_version_check_time = ?, last_install_time = ?, parent_app_name = ?, parent_app_caption = ?, parent_app_store_url = ? WHERE bundle_id = ?" query];
    uint64_t v6 = [v4 userNotificationGranted];

    if (v6)
    {
      id v7 = [v4 userNotificationGranted];
      objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v7, "BOOLValue"), 1);
    }
    else
    {
      [v5 bindNullAtParameterIndex:1];
    }
    uint64_t v9 = [v4 locationConfirmationGranted];

    if (v9)
    {
      int v10 = [v4 locationConfirmationGranted];
      objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v10, "BOOLValue"), 2);
    }
    else
    {
      [v5 bindNullAtParameterIndex:2];
    }
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v4, "locationConfirmationState"), 3);
    [v4 lastProxCardLaunchTime];
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 4);
    [v4 lastVersionCheckTime];
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 5);
    [v4 lastInstallTime];
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 6);
    uint64_t v11 = [v4 fullApplicationName];
    [v5 bindString:v11 atParameterIndex:7];

    __int16 v12 = [v4 fullApplicationCaption];
    [v5 bindString:v12 atParameterIndex:8];

    id v13 = [v4 fullApplicationStoreURL];
    uint64_t v14 = [v13 absoluteString];
    [v5 bindString:v14 atParameterIndex:9];

    __int16 v15 = [v4 bundleID];
    [v5 bindString:v15 atParameterIndex:10];

    int v16 = [v5 execute];
    if (v16 != 101)
    {
      uint64_t v17 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _updateAppClipRecord:]();
      }
    }
    [v5 invalidate];
    BOOL v8 = v16 == 101 && [(WBSSQLiteDatabase *)self->_database changedRowCount] != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_insertAppClipRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:self->_database, @"INSERT INTO app_clips (bundle_id, user_notification_consent, location_confirmation_consent, allows_location_confirmation_after_launch, last_user_notification_request_time, last_version_check_time, last_install_time, parent_app_name, parent_app_caption, parent_app_store_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" query];
  uint64_t v6 = [v4 bundleID];
  [v5 bindString:v6 atParameterIndex:1];

  id v7 = [v4 userNotificationGranted];

  if (v7)
  {
    BOOL v8 = [v4 userNotificationGranted];
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v8, "BOOLValue"), 2);
  }
  else
  {
    [v5 bindNullAtParameterIndex:2];
  }
  uint64_t v9 = [v4 locationConfirmationGranted];

  if (v9)
  {
    int v10 = [v4 locationConfirmationGranted];
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v10, "BOOLValue"), 3);
  }
  else
  {
    [v5 bindNullAtParameterIndex:3];
  }
  objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v4, "locationConfirmationState"), 4);
  [v4 lastProxCardLaunchTime];
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 5);
  [v4 lastVersionCheckTime];
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 6);
  [v4 lastInstallTime];
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 7);
  uint64_t v11 = [v4 fullApplicationName];
  [v5 bindString:v11 atParameterIndex:8];

  __int16 v12 = [v4 fullApplicationCaption];
  [v5 bindString:v12 atParameterIndex:9];

  id v13 = [v4 fullApplicationStoreURL];
  uint64_t v14 = [v13 absoluteString];
  [v5 bindString:v14 atParameterIndex:10];

  int v15 = [v5 execute];
  if (v15 != 101)
  {
    int v16 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _insertAppClipRecord:]();
    }
  }
  [v5 invalidate];
  BOOL v17 = v15 == 101 && [(WBSSQLiteDatabase *)self->_database changedRowCount] != 0;

  return v17;
}

- (void)getAppClipRecordWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke;
  block[3] = &unk_26424FAC0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v2 = (CPSAppClipRecord **)(a1 + 5);
  int v3 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 16), @"SELECT user_notification_consent, location_confirmation_consent, allows_location_confirmation_after_launch, last_user_notification_request_time, last_version_check_time, last_install_time, parent_app_name, parent_app_caption, parent_app_store_url FROM app_clips WHERE bundle_id = ?", a1 + 5);
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *v2;
    int v22 = 138739971;
    uint64_t v23 = v5;
    _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_DEFAULT, "Getting app clip record with bundle ID %{sensitive}@", (uint8_t *)&v22, 0xCu);
  }
  id v6 = [v3 nextObject];
  if (v6)
  {
    id v7 = [[CPSAppClipRecord alloc] initWithSQLiteRow:v6 bundleID:*v2];
    BOOL v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CPSAppClipRecord *)v7 fullApplicationName];
      id v10 = objc_msgSend(v9, "cps_privacyPreservingDescription");
      uint64_t v11 = [(CPSAppClipRecord *)v7 fullApplicationCaption];
      id v12 = objc_msgSend(v11, "cps_privacyPreservingDescription");
      int v22 = 138740483;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      v25 = v10;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved app clip record %{sensitive}@, name is %{public}@, caption is %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
  else
  {
    id v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    id v7 = 0;
  }

  uint64_t v21 = [v3 statement];
  [v21 invalidate];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)saveClipEntryPointRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CPSClipDataSQLiteStore_saveClipEntryPointRecord_completion___block_invoke;
  block[3] = &unk_26424FAC0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __62__CPSClipDataSQLiteStore_saveClipEntryPointRecord_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertOrReplaceEntryPointRecord:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_insertOrReplaceEntryPointRecord:(id)a3
{
  v12[3] = *(double *)MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:self->_database, @"INSERT OR REPLACE INTO clip_entry_points (app_clip_bundle_id, web_clip_id, last_abr_fetch_time) VALUES (?, ?, ?)" query];
  id v11 = [v4 appClipBundleID];
  id v10 = [v4 webClipIdentifier];
  [v4 lastABRFetchTime];
  v12[0] = v6;
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSString * {__strong},double>(v5, &v11, &v10, v12);

  int v7 = [v5 execute];
  if (v7 != 101)
  {
    BOOL v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _insertOrReplaceEntryPointRecord:]();
    }
  }
  [v5 invalidate];

  return v7 == 101;
}

- (void)getEntryPointRecordWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__CPSClipDataSQLiteStore_getEntryPointRecordWithWebClipIdentifier_completion___block_invoke;
  block[3] = &unk_26424FAC0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __78__CPSClipDataSQLiteStore_getEntryPointRecordWithWebClipIdentifier_completion___block_invoke(void *a1)
{
  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 16), @"SELECT app_clip_bundle_id, web_clip_id, last_abr_fetch_time FROM clip_entry_points WHERE web_clip_id = ?", a1 + 5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v2 = [v5 nextObject];
  if (v2) {
    int v3 = [[CPSClipEntryPointRecord alloc] initWithSQLiteRow:v2];
  }
  else {
    int v3 = 0;
  }

  id v4 = [v5 statement];
  [v4 invalidate];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)removeRecordWithBundleID:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke;
  v7[3] = &unk_26424FAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke(uint64_t a1)
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 16) query:@"DELETE FROM app_clips WHERE bundle_id = ?"];
  [v2 bindString:*(void *)(a1 + 40) atParameterIndex:1];
  if ([v2 execute] != 101)
  {
    int v3 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke_cold_1();
    }
  }
  [v2 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_checkDatabaseIntegrity
{
}

- (void)_openDatabaseAndCheckIntegrity:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = 8;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "CPSClip Data SQLite schema version (%d) does not match our supported schema version (%d) in store at %{public}@", (uint8_t *)v4, 0x18u);
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createFreshDatabaseSchema
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to create app_clips table: %{public}@ (%d)", v4, v5);
}

- (void)_createClipEntryPointsTable
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to create clip_entry_points table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21559C000, v0, v1, "Failed to migrate the database to schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21559C000, v0, v1, "Not migrating to an unsupported schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21559C000, v0, v1, "Failed to commit the transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21559C000, v0, v1, "Failed to start a transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
}

void __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to add parent_app_name column to app_clips table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_4
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to add location_confirmation_consent column to app_clips table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_5
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to add parent_app_store_url column to app_clips table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_6
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to add allows_location_confirmation_after_launch column to app_clips table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_7
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to set user_notification_consent and location_confirmation_consent to NULL: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemeVersion_8
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to rename clip_entry_points tabs to clip_entry_points_old: %{public}@ (%d)", v4, v5);
}

- (void)_updateAppClipRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to update a clip record in the app_clips table: %@ (%d)", v4, v5);
}

- (void)_insertAppClipRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to insert a clip data into the app_clips table: %@ (%d)", v4, v5);
}

void __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_insertOrReplaceEntryPointRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to save entry point into the clip_entry_points table: %@ (%d)", v4, v5);
}

void __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_21559C000, "Failed to remove a row from the app_clips table: %@ (%d)", v4, v5);
}

@end