@interface SecureBackupSQLite
+ (sqlite3)openDBWithURL:(id)a3 truncate:(BOOL)a4;
- (BOOL)addItem:(id)a3 withKey:(id)a4 forClass:(id)a5 error:(id *)a6;
- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4;
- (BOOL)sqliteExec:(id)a3;
- (NSData)keybag;
- (NSData)keybagDigest;
- (NSData)manifestHash;
- (NSString)recordID;
- (NSURL)url;
- (SecureBackupSQLite)initWithURL:(id)a3 recordID:(id)a4;
- (id)sqliteErrorForDB:(sqlite3 *)a3;
- (int64_t)sqliteExecInteger:(id)a3;
- (sqlite3)db;
- (void)closeDB;
- (void)enumerateKeysAndItemsUsingBlock:(id)a3;
- (void)resetDBWithKeybag:(id)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setRecordID:(id)a3;
@end

@implementation SecureBackupSQLite

+ (sqlite3)openDBWithURL:(id)a3 truncate:(BOOL)a4
{
  ppDb = 0;
  id v4 = a3;
  if (sqlite3_open_v2((const char *)[v4 fileSystemRepresentation], &ppDb, 6, 0))
  {
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100048C2C((uint64_t)v4, &ppDb);
    }
  }
  else
  {
    int factor = _sqlite3_maintain_load_factor();
    if (factor)
    {
      int v7 = factor;
      v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100048BA4((uint64_t)v4, v7, v8);
      }
    }
    v12 = 0;
    if (!sqlite3_exec(ppDb, "pragma journal_mode = WAL;CREATE TABLE IF NOT EXISTS items(hash BLOB PRIMARY KEY NOT NULL,class TEXT NOT NUL"
            "L, data BLOB NOT NULL);CREATE TABLE IF NOT EXISTS keybag(digest BLOB PRIMARY KEY NOT NULL,recordID TEXT NOT"
            " NULL,data BLOB NOT NULL,timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);",
            0,
            0,
            (char **)&v12))
    {
      v10 = ppDb;
      goto LABEL_14;
    }
    v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100048B38();
    }

    sqlite3_free(v12);
  }
  sqlite3_close(ppDb);
  v10 = 0;
LABEL_14:

  return v10;
}

- (SecureBackupSQLite)initWithURL:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SecureBackupSQLite;
  v8 = [(SecureBackupSQLite *)&v16 init];
  if (!v8) {
    goto LABEL_9;
  }
  v9 = [v6 URLByAppendingPathComponent:@"backup"];
  uint64_t v10 = [v9 URLByAppendingPathExtension:@"sqlite3"];
  url = v8->_url;
  v8->_url = (NSURL *)v10;

  if (v8->_url)
  {
    v12 = (sqlite3 *)[(id)objc_opt_class() openDBWithURL:v8->_url truncate:0];
    v8->_db = v12;
    if (v8->_url && v12 != 0)
    {
      objc_storeStrong((id *)&v8->_recordID, a4);
LABEL_9:
      v14 = v8;
      goto LABEL_10;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)sqliteErrorForDB:(sqlite3 *)a3
{
  uint64_t v4 = +[NSString stringWithUTF8String:sqlite3_errmsg(a3)];
  v5 = (void *)v4;
  if (v4)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    uint64_t v10 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:sqlite3_errcode(a3) userInfo:v6];

  return v7;
}

- (BOOL)addItem:(id)a3 withKey:(id)a4 forClass:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  ppStmt = 0;
  v13 = [(SecureBackupSQLite *)self db];
  if (sqlite3_prepare_v2(v13, "INSERT OR IGNORE INTO items (hash, class, data) VALUES (?, ?, ?);", -1, &ppStmt, 0))
  {
    v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100048EDC();
    }
    goto LABEL_23;
  }
  v15 = ppStmt;
  id v16 = v11;
  if (sqlite3_bind_blob64(v15, 1, [v16 bytes], (sqlite3_uint64)objc_msgSend(v16, "length"), 0))
  {
    v17 = CloudServicesLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  if (sqlite3_bind_text(ppStmt, 2, (const char *)[v12 UTF8String], -1, 0))
  {
    v17 = CloudServicesLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100048E50();
    }
    goto LABEL_17;
  }
  v18 = ppStmt;
  id v19 = v10;
  if (sqlite3_bind_blob64(v18, 3, [v19 bytes], (sqlite3_uint64)objc_msgSend(v19, "length"), 0))
  {
    v17 = CloudServicesLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      if (a6)
      {
        [(SecureBackupSQLite *)self sqliteErrorForDB:v13];
        BOOL v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v20 = 0;
      }
      goto LABEL_20;
    }
LABEL_6:
    sub_100048DC4();
    goto LABEL_17;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    v17 = CloudServicesLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100048D38();
    }
    goto LABEL_17;
  }
  BOOL v20 = 1;
LABEL_20:
  if (!sqlite3_finalize(ppStmt)) {
    goto LABEL_26;
  }
  v14 = CloudServicesLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100048CAC();
  }
LABEL_23:

  if (a6)
  {
    [(SecureBackupSQLite *)self sqliteErrorForDB:v13];
    BOOL v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_26:

  return v20;
}

- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ppStmt = 0;
  id v7 = [(SecureBackupSQLite *)self db];
  if (sqlite3_prepare_v2(v7, "DELETE FROM items where hash = ?;", -1, &ppStmt, 0))
  {
    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004900C();
    }
    goto LABEL_21;
  }
  NSErrorUserInfoKey v9 = ppStmt;
  id v10 = v6;
  if (sqlite3_bind_blob64(v9, 1, [v10 bytes], (sqlite3_uint64)objc_msgSend(v10, "length"), 0))
  {
    id v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100048DC4();
    }
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      if (sqlite3_changes(v7) != 1)
      {
        id v12 = CloudServicesLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100048F68((uint64_t)v10, self);
        }
      }
      BOOL v13 = 1;
      goto LABEL_18;
    }
    id v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100048D38();
    }
  }

  if (a4)
  {
    [(SecureBackupSQLite *)self sqliteErrorForDB:v7];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_18:
  if (!sqlite3_finalize(ppStmt)) {
    goto LABEL_24;
  }
  v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100048CAC();
  }
LABEL_21:

  if (a4)
  {
    [(SecureBackupSQLite *)self sqliteErrorForDB:v7];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_24:

  return v13;
}

- (NSData)manifestHash
{
  ppStmt = 0;
  if (sqlite3_prepare_v2([(SecureBackupSQLite *)self db], "SELECT hash from items ORDER BY hash;",
         -1,
         &ppStmt,
         0))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10004900C();
    }
    id v3 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v3 = objc_alloc_init((Class)NSMutableData);
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    if ((v4 - 102) < 0xFFFFFFFE) {
      break;
    }
    if (v4 == 100)
    {
      v5 = sqlite3_column_blob(ppStmt, 0);
      if (v5) {
        objc_msgSend(v3, "appendBytes:length:", v5, sqlite3_column_bytes(ppStmt, 0));
      }
    }
    else if (v4 == 101)
    {
      goto LABEL_15;
    }
  }
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100048D38();
  }

LABEL_15:
  if (sqlite3_finalize(ppStmt))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100048CAC();
    }
    goto LABEL_18;
  }
LABEL_19:

  return (NSData *)v3;
}

- (NSData)keybagDigest
{
  ppStmt = 0;
  if (sqlite3_prepare_v2([(SecureBackupSQLite *)self db], "SELECT digest from keybag;", -1, &ppStmt, 0))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100049098();
    }
    id v3 = 0;
LABEL_16:

    goto LABEL_17;
  }
  int v4 = sqlite3_step(ppStmt);
  if (v4 == 100)
  {
    id v3 = (id)sqlite3_column_blob(ppStmt, 0);
    if (v3) {
      id v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v3, sqlite3_column_bytes(ppStmt, 0));
    }
  }
  else
  {
    if (v4 != 101)
    {
      v5 = CloudServicesLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100048D38();
      }
    }
    id v3 = 0;
  }
  if (sqlite3_finalize(ppStmt))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100048CAC();
    }
    goto LABEL_16;
  }
LABEL_17:

  return (NSData *)v3;
}

- (NSData)keybag
{
  ppStmt = 0;
  if (sqlite3_prepare_v2([(SecureBackupSQLite *)self db], "SELECT data from keybag;", -1, &ppStmt, 0))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100049130();
    }
    id v3 = 0;
LABEL_16:

    goto LABEL_17;
  }
  int v4 = sqlite3_step(ppStmt);
  if (v4 == 100)
  {
    id v3 = (id)sqlite3_column_blob(ppStmt, 0);
    if (v3) {
      id v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v3, sqlite3_column_bytes(ppStmt, 0));
    }
  }
  else
  {
    if (v4 != 101)
    {
      v5 = CloudServicesLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100048D38();
      }
    }
    id v3 = 0;
  }
  if (sqlite3_finalize(ppStmt))
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100048CAC();
    }
    goto LABEL_16;
  }
LABEL_17:

  return (NSData *)v3;
}

- (void)enumerateKeysAndItemsUsingBlock:(id)a3
{
  int v4 = (void (**)(id, id, unsigned __int8 *, id))a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2([(SecureBackupSQLite *)self db], "SELECT hash, class, data from items;",
         -1,
         &ppStmt,
         0))
  {
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004900C();
    }
LABEL_22:

    goto LABEL_23;
  }
  for (int i = sqlite3_step(ppStmt); (i - 102) >= 0xFFFFFFFE; int i = sqlite3_step(ppStmt))
  {
    if (i == 100)
    {
      id v7 = (id)sqlite3_column_blob(ppStmt, 0);
      if (v7) {
        id v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v7, sqlite3_column_bytes(ppStmt, 0));
      }
      v8 = (unsigned __int8 *)sqlite3_column_text(ppStmt, 1);
      if (v8) {
        v8 = (unsigned __int8 *)[objc_alloc((Class)NSString) initWithUTF8String:v8];
      }
      id v9 = (id)sqlite3_column_blob(ppStmt, 2);
      if (v9) {
        id v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v9, sqlite3_column_bytes(ppStmt, 2));
      }
      v4[2](v4, v7, v8, v9);
    }
    else if (i == 101)
    {
      goto LABEL_19;
    }
  }
  id v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100048D38();
  }

LABEL_19:
  if (sqlite3_finalize(ppStmt))
  {
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100048CAC();
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (BOOL)sqliteExec:(id)a3
{
  id v4 = a3;
  v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SecureBackupSQLite sqliteExec:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  errmsg = 0;
  id v6 = [(SecureBackupSQLite *)self db];
  id v7 = v4;
  int v8 = sqlite3_exec(v6, (const char *)[v7 UTF8String], 0, 0, &errmsg);
  if (v8)
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(SecureBackupSQLite *)self url];
      *(_DWORD *)buf = 138412802;
      v14 = (const char *)v7;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2080;
      v18 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ on %@ failed: %s", buf, 0x20u);
    }
    sqlite3_free(errmsg);
  }

  return v8 == 0;
}

- (void)resetDBWithKeybag:(id)a3
{
  id v4 = a3;
  errmsg = 0;
  v5 = [(SecureBackupSQLite *)self db];
  if (!sqlite3_exec(v5, "DROP TABLE items; DROP TABLE keybag;", 0, 0, &errmsg))
  {
    if (sqlite3_exec(v5, "pragma journal_mode = WAL;CREATE TABLE IF NOT EXISTS items(hash BLOB PRIMARY KEY NOT NULL,class TEXT NOT NULL"
           ", data BLOB NOT NULL);CREATE TABLE IF NOT EXISTS keybag(digest BLOB PRIMARY KEY NOT NULL,recordID TEXT NOT N"
           "ULL,data BLOB NOT NULL,timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);",
           0,
           0,
           &errmsg))
    {
      id v6 = CloudServicesLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100049258();
      }
      goto LABEL_7;
    }
    id v7 = [v4 sha1Digest];
    pStmt = 0;
    if (sqlite3_prepare_v2(v5, "INSERT INTO keybag (digest, recordID, data) VALUES (?, ?, ?);", -1, &pStmt, 0))
    {
      int v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100048EDC();
      }

LABEL_34:
      goto LABEL_8;
    }
    id v9 = pStmt;
    id v10 = v7;
    if (sqlite3_bind_blob64(v9, 1, [v10 bytes], (sqlite3_uint64)objc_msgSend(v10, "length"), 0))
    {
      id v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_100048DC4();
    }
    else
    {
      id v12 = pStmt;
      id v13 = [(SecureBackupSQLite *)self recordID];
      LODWORD(v12) = sqlite3_bind_text(v12, 2, (const char *)[v13 UTF8String], -1, 0);

      if (v12)
      {
        id v11 = CloudServicesLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100048E50();
        }
        goto LABEL_25;
      }
      v14 = pStmt;
      id v15 = v4;
      if (sqlite3_bind_blob64(v14, 3, [v15 bytes], (sqlite3_uint64)objc_msgSend(v15, "length"), 0))
      {
        id v11 = CloudServicesLog();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        goto LABEL_15;
      }
      if (sqlite3_step(pStmt) == 101) {
        goto LABEL_26;
      }
      id v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100048D38();
      }
    }
LABEL_25:

LABEL_26:
    if (sqlite3_finalize(pStmt))
    {
      id v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100048CAC();
      }

      if (sqlite3_close(v5))
      {
        __int16 v17 = CloudServicesLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000491C8(self);
        }
      }
      [(SecureBackupSQLite *)self setDb:0];
    }
    goto LABEL_34;
  }
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000492E8();
  }
LABEL_7:

  sqlite3_free(errmsg);
LABEL_8:
}

- (int64_t)sqliteExecInteger:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  v5 = [(SecureBackupSQLite *)self db];
  id v6 = v4;
  if (sqlite3_prepare_v2(v5, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004900C();
    }
    int64_t v8 = -1;
LABEL_16:

    goto LABEL_17;
  }
  int64_t v8 = -1;
  while (1)
  {
    int v9 = sqlite3_step(ppStmt);
    if ((v9 - 102) <= 0xFFFFFFFD) {
      break;
    }
    if (v9 != 100) {
      goto LABEL_13;
    }
    int v10 = sqlite3_column_int(ppStmt, 0);
    int64_t v8 = v10;
    if (v10 == -1)
    {
      int64_t v8 = -1;
      goto LABEL_13;
    }
  }
  id v11 = CloudServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100048D38();
  }

LABEL_13:
  if (sqlite3_finalize(ppStmt))
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100048CAC();
    }
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (void)closeDB
{
  if (sqlite3_close([(SecureBackupSQLite *)self db]))
  {
    id v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000491C8(self);
    }
  }
  [(SecureBackupSQLite *)self setDb:0];
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end