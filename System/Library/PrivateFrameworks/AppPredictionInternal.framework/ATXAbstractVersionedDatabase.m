@interface ATXAbstractVersionedDatabase
- (ATXAbstractVersionedDatabase)initWithDbPath:(id)a3;
- (ATXAbstractVersionedDatabase)initWithDefaultPath:(id)a3;
- (BOOL)_configureDatabase;
- (BOOL)_initializeTables;
- (BOOL)migrate;
- (_PASSqliteDatabase)db;
- (id)createCustomSchema;
- (id)createSchema;
- (int64_t)countRowsOfTable:(id)a3;
- (int64_t)currentSchemaVersion;
- (int64_t)latestVersion;
- (void)_disconnectFromDb;
- (void)_initializeSchemaVersion:(int64_t)a3;
- (void)_runMigration;
- (void)_startDatabase;
@end

@implementation ATXAbstractVersionedDatabase

- (ATXAbstractVersionedDatabase)initWithDefaultPath:(id)a3
{
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:a3];
  v5 = [(ATXAbstractVersionedDatabase *)self initWithDbPath:v4];

  return v5;
}

- (ATXAbstractVersionedDatabase)initWithDbPath:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXAbstractVersionedDatabase initWithDbPath:](v6);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot call _ATXNotificationDatabase init until class c unlocked"];
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"Cannot call _ATXNotificationDatabase init until class c unlocked"];
  }
  v15.receiver = self;
  v15.super_class = (Class)ATXAbstractVersionedDatabase;
  v7 = [(ATXAbstractVersionedDatabase *)&v15 init];
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ATXAbstractVersionedDatabase_initWithDbPath___block_invoke;
    block[3] = &unk_1E68AB818;
    v9 = v7;
    v14 = v9;
    if (initWithDbPath___pasOnceToken3 != -1) {
      dispatch_once(&initWithDbPath___pasOnceToken3, block);
    }
    v10 = (OS_dispatch_queue *)(id)initWithDbPath___pasExprOnceResult;

    queue = v9->_queue;
    v9->_queue = v10;

    objc_storeStrong((id *)&v9->_path, a3);
  }

  return v8;
}

void __47__ATXAbstractVersionedDatabase_initWithDbPath___block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], v2);

  v6 = (void *)initWithDbPath___pasExprOnceResult;
  initWithDbPath___pasExprOnceResult = (uint64_t)v5;
}

- (_PASSqliteDatabase)db
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_dbInitialized)
  {
    self->_dbInitialized = 1;
    [(ATXAbstractVersionedDatabase *)self _startDatabase];
  }
  db = self->_db;
  return db;
}

- (void)_startDatabase
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Not enough space on volume. Opening in-memory datastore.", v1, 2u);
}

- (void)_disconnectFromDb
{
  db = self->_db;
  if (db)
  {
    [(_PASSqliteDatabase *)db closePermanently];
    id v4 = self->_db;
    self->_db = 0;
  }
}

- (BOOL)_configureDatabase
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [&unk_1F27F2C10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(&unk_1F27F2C10);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        uint64_t v11 = 0;
        v12 = &v11;
        uint64_t v13 = 0x2020000000;
        char v14 = 0;
        db = self->_db;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __50__ATXAbstractVersionedDatabase__configureDatabase__block_invoke;
        v10[3] = &unk_1E68AEB20;
        v10[4] = &v11;
        [(_PASSqliteDatabase *)db prepAndRunQuery:v6 onPrep:0 onRow:0 onError:v10];
        int v8 = *((unsigned __int8 *)v12 + 24);
        _Block_object_dispose(&v11, 8);
        if (v8) {
          return 0;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F2C10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  return 1;
}

uint64_t __50__ATXAbstractVersionedDatabase__configureDatabase__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (int64_t)latestVersion
{
  return 0;
}

- (id)createCustomSchema
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)createSchema
{
  v2 = [(ATXAbstractVersionedDatabase *)self createCustomSchema];
  uint64_t v3 = [v2 arrayByAddingObject:@"CREATE TABLE IF NOT EXISTS meta (id INTEGER PRIMARY KEY, version INT)"];

  return v3;
}

- (int64_t)currentSchemaVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ATXAbstractVersionedDatabase *)self db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke;
  v5[3] = &unk_1E68AD228;
  v5[4] = &v6;
  [v2 prepAndRunQuery:@"SELECT version FROM meta" onPrep:0 onRow:v5 onError:&__block_literal_global_81];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke_2()
{
  return *MEMORY[0x1E4F93C10];
}

- (void)_initializeSchemaVersion:(int64_t)a3
{
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4[4] = a3;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT OR REPLACE INTO meta (id, version) VALUES (1,?)" onPrep:v4 onRow:0 onError:&__block_literal_global_35_1];
}

uint64_t __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(a1 + 32)];
}

uint64_t __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2_cold_1((uint64_t)v2, v3);
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)migrate
{
  return 1;
}

- (void)_runMigration
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ATXAbstractVersionedDatabase__runMigration__block_invoke;
  v4[3] = &unk_1E68AFCD0;
  v4[4] = self;
  void v4[5] = &v5;
  [(_PASSqliteDatabase *)db frailWriteTransaction:v4];
  if (!*((unsigned char *)v6 + 24))
  {
    [(_PASSqliteDatabase *)self->_db placeCorruptionMarker];
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F93C00] format:@"_ATXNotificationsDatabase migration failed. Marking as corrupt."];
  }
  _Block_object_dispose(&v5, 8);
}

BOOL __45__ATXAbstractVersionedDatabase__runMigration__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) migrate];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _initializeTables];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeSchemaVersion:", objc_msgSend(*(id *)(a1 + 32), "latestVersion"));
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)_initializeTables
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(ATXAbstractVersionedDatabase *)self createSchema];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", MEMORY[0x1E4F143A8], 3221225472, __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke, &unk_1E68AD188, *(void *)(*((void *)&v9 + 1) + 8 * i), &v13);
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
    }
    while (v4);
  }

  char v7 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (int64_t)countRowsOfTable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXAbstractVersionedDatabase *)self db];
  int64_t v6 = objc_msgSend(v5, "atx_countRowsOfTable:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithDbPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Cannot call _ATXNotificationDatabase init until class c unlocked", v1, 2u);
}

void __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error initializing meta table: %@", (uint8_t *)&v2, 0xCu);
}

void __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_10();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Error initializing schema: %@ %@", v1, 0x16u);
}

@end