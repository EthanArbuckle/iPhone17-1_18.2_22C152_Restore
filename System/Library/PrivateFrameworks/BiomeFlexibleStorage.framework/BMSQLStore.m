@interface BMSQLStore
+ (NSArray)migrations;
- (BMSQLStore)initWithFMDBHandle:(id)a3;
- (BMSQLStore)initWithURL:(id)a3;
- (BOOL)dbIsReady;
- (NSURL)dbURL;
- (_bmFMDatabase)db;
- (os_unfair_lock_s)dbLock;
- (void)db;
- (void)sqliteHandle;
@end

@implementation BMSQLStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (_bmFMDatabase)db
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (![(BMSQLStore *)self dbIsReady])
  {
    p_dbLock = &self->_dbLock;
    os_unfair_lock_lock(&self->_dbLock);
    if ([(BMSQLStore *)self dbIsReady])
    {
LABEL_55:
      os_unfair_lock_unlock(p_dbLock);
      goto LABEL_56;
    }
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    p_db = &self->_db;
    v6 = [(_bmFMDatabase *)self->_db databaseURL];
    v7 = [v6 URLByDeletingLastPathComponent];
    v8 = [v7 path];
    [v4 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    if (![(_bmFMDatabase *)self->_db open])
    {
      v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BMSQLStore db].cold.7((id *)&self->_db);
      }
      goto LABEL_54;
    }
    if (![(_bmFMDatabase *)*p_db executeUpdate:@"PRAGMA foreign_keys = ON"])
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMSQLStore db].cold.6((id *)&self->_db);
      }
    }
    if (![(_bmFMDatabase *)*p_db executeUpdate:@"CREATE TABLE IF NOT EXISTS BM_METADATA (bm_key TEXT UNIQUE PRIMARY KEY ON CONFLICT REPLACE NOT NULL, bm_value TEXT)"])
    {
      int v10 = 1;
      int v11 = -6;
      while (!__CFADD__(v11++, 1))
      {
        usleep(1000 * v10);
        int v10 = (int)(((double)arc4random_uniform(0x190u) / 100.0 + 1.7) * (double)v10);
        if ([(_bmFMDatabase *)*p_db executeUpdate:@"CREATE TABLE IF NOT EXISTS BM_METADATA (bm_key TEXT UNIQUE PRIMARY KEY ON CONFLICT REPLACE NOT NULL, bm_value TEXT)"])
        {
          goto LABEL_18;
        }
      }
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BMSQLStore db].cold.5((id *)&self->_db);
      }
    }
LABEL_18:
    v13 = [(_bmFMDatabase *)*p_db executeQuery:@"SELECT bm_value FROM BM_METADATA WHERE bm_key='schema_version'"];
    if ([v13 next]) {
      uint64_t v15 = [v13 intForColumn:@"bm_value"];
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = [(id)objc_opt_class() migrations];
    if ([v16 count] <= (unint64_t)(int)v15)
    {
      self->_dbIsReady = 1;
LABEL_53:

LABEL_54:
      goto LABEL_55;
    }
    v49 = v13;
    v17 = *p_db;
    id v57 = 0;
    BOOL v18 = [(_bmFMDatabase *)v17 startSavePointWithName:@"migration" error:&v57];
    id v50 = v57;
    if (!v18)
    {
      v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[BMSQLStore db].cold.4();
      }
    }
    v20 = objc_msgSend(v16, "subarrayWithRange:", (int)v15, objc_msgSend(v16, "count") - (int)v15);

    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v4;
      v23 = [NSNumber numberWithInt:v15];
      v24 = NSNumber;
      uint64_t v25 = [v20 count] + (int)v15;
      v26 = v24;
      v4 = v22;
      v27 = [v26 numberWithUnsignedInteger:v25];
      *(_DWORD *)buf = 138412546;
      v60 = v23;
      __int16 v61 = 2112;
      v62 = v27;
      _os_log_impl(&dword_1B87BE000, v21, OS_LOG_TYPE_DEFAULT, "Migrating managed store from schema %@ to %@", buf, 0x16u);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v16 = v20;
    uint64_t v28 = [v16 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      v48 = v4;
      uint64_t v30 = *(void *)v54;
LABEL_30:
      uint64_t v31 = 0;
      uint64_t v32 = v15;
      while (1)
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v16);
        }
        BOOL v33 = [(_bmFMDatabase *)*p_db executeStatements:*(void *)(*((void *)&v53 + 1) + 8 * v31)];
        v34 = __biome_log_for_category();
        v35 = v34;
        if (!v33) {
          break;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [NSNumber numberWithInt:v32 + v31 + 1];
          *(_DWORD *)buf = 138412290;
          v60 = v36;
          _os_log_impl(&dword_1B87BE000, v35, OS_LOG_TYPE_DEFAULT, "Successful schema migration to version %@.", buf, 0xCu);
        }
        if (v29 == ++v31)
        {
          uint64_t v29 = [v16 countByEnumeratingWithState:&v53 objects:v58 count:16];
          LODWORD(v15) = v32 + v31;
          if (v29) {
            goto LABEL_30;
          }
          uint64_t v15 = (v32 + v31);
          v4 = v48;
          goto LABEL_39;
        }
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        [(BMSQLStore *)v32 + v31 + 1 db];
      }

      v42 = __biome_log_for_category();
      v4 = v48;
      p_dbLock = &self->_dbLock;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[BMSQLStore db](v42);
      }

      v43 = *p_db;
      id v51 = 0;
      BOOL v44 = [(_bmFMDatabase *)v43 rollbackToSavePointWithName:@"migration" error:&v51];
      id v40 = v51;
      if (!v44)
      {
        char v41 = 0;
        goto LABEL_49;
      }
    }
    else
    {
LABEL_39:

      v37 = *p_db;
      v38 = [NSNumber numberWithInt:v15];
      -[_bmFMDatabase executeUpdate:](v37, "executeUpdate:", @"INSERT INTO BM_METADATA (bm_key, bm_value) VALUES ('schema_version', ?); ",
        v38);

      v39 = *p_db;
      id v52 = 0;
      LOBYTE(v37) = [(_bmFMDatabase *)v39 releaseSavePointWithName:@"migration" error:&v52];
      id v40 = v52;
      p_dbLock = &self->_dbLock;
      if ((v37 & 1) == 0)
      {
        char v41 = 1;
LABEL_49:
        v45 = __biome_log_for_category();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
          [(BMSQLStore *)v41 db];
        }

        goto LABEL_52;
      }
    }
    self->_dbIsReady = 1;
LABEL_52:
    v13 = v49;

    goto LABEL_53;
  }
LABEL_56:
  db = self->_db;
  return db;
}

- (BOOL)dbIsReady
{
  return self->_dbIsReady;
}

- (BMSQLStore)initWithFMDBHandle:(id)a3
{
  id v5 = a3;
  v6 = [v5 databaseURL];

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)BMSQLStore;
    v7 = [(BMSQLStore *)&v13 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_db, a3);
      uint64_t v9 = [v5 databaseURL];
      dbURL = v8->_dbURL;
      v8->_dbURL = (NSURL *)v9;

      v8->_dbIsReady = 0;
      v8->_dbLock._os_unfair_lock_opaque = 0;
    }
    self = v8;
    int v11 = self;
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (BMSQLStore)initWithURL:(id)a3
{
  v4 = +[_bmFMDatabase databaseWithURL:a3];
  id v5 = [(BMSQLStore *)self initWithFMDBHandle:v4];

  return v5;
}

- (void)sqliteHandle
{
  v2 = [(BMSQLStore *)self db];
  v3 = (void *)[v2 sqliteHandle];

  return v3;
}

+ (NSArray)migrations
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v2 raise:v3, @"%@ not implemented by child class %@", v4, v6 format];

  return 0;
}

- (NSURL)dbURL
{
  return self->_dbURL;
}

- (os_unfair_lock_s)dbLock
{
  return self->_dbLock;
}

- (void)db
{
  v1 = [*a1 lastError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1B87BE000, v2, v3, "Failed to open database. %@", v4, v5, v6, v7, v8);
}

@end