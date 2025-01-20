@interface ACCSQLite
- (ACCSQLite)initWithPath:(id)a3 schema:(id)a4;
- (ACCSQLiteDelegate)delegate;
- (BOOL)corrupt;
- (BOOL)executeSQL:(id)a3;
- (BOOL)executeSQL:(id)a3 arguments:(char *)a4;
- (BOOL)hasMigrated;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)shouldVacuum;
- (BOOL)traced;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)statementsBySQL;
- (NSString)objectClassPrefix;
- (NSString)path;
- (NSString)schema;
- (NSString)schemaVersion;
- (id)_createSchemaHash;
- (id)_synchronousModeString;
- (id)_tableNameForClass:(Class)a3;
- (id)allTableNames;
- (id)columnNamesForTable:(id)a3;
- (id)creationDate;
- (id)datePropertyForKey:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)select:(id)a3 from:(id)a4;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6;
- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)statementForSQL:(id)a3;
- (int)changes;
- (int)dbUserVersion;
- (int)userVersion;
- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4;
- (int64_t)lastInsertRowID;
- (int64_t)synchronousMode;
- (sqlite3)db;
- (unint64_t)openCount;
- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)_periodicVacuum;
- (void)_synchronousModeString;
- (void)analyze;
- (void)begin;
- (void)close;
- (void)dealloc;
- (void)deleteFrom:(id)a3 matchingValues:(id)a4;
- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)dropAllTables;
- (void)end;
- (void)open;
- (void)remove;
- (void)removeAllStatements;
- (void)removePropertyForKey:(id)a3;
- (void)rollback;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9;
- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)setCorrupt:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectClassPrefix:(id)a3;
- (void)setOpenCount:(unint64_t)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShouldVacuum:(BOOL)a3;
- (void)setSynchronousMode:(int64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setUserVersion:(int)a3;
- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7;
- (void)vacuum;
@end

@implementation ACCSQLite

- (ACCSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ACCSQLite;
  v9 = [(ACCSQLite *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_schema, a4);
    uint64_t v11 = [(ACCSQLite *)v10 _createSchemaHash];
    schemaVersion = v10->_schemaVersion;
    v10->_schemaVersion = (NSString *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    statementsBySQL = v10->_statementsBySQL;
    v10->_statementsBySQL = v13;

    objectClassPrefix = v10->_objectClassPrefix;
    v10->_objectClassPrefix = (NSString *)@"CK";

    v10->_synchronousMode = 1;
    *(_WORD *)&v10->_hasMigrated = 256;
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x223CA7860](self, a2);
  [(ACCSQLite *)self close];
  v4.receiver = self;
  v4.super_class = (Class)ACCSQLite;
  [(ACCSQLite *)&v4 dealloc];
}

- (int)userVersion
{
  v3 = [(ACCSQLite *)self delegate];

  if (!v3) {
    return self->_userVersion;
  }
  objc_super v4 = [(ACCSQLite *)self delegate];
  int v5 = [v4 userVersion];

  return v5;
}

- (id)_synchronousModeString
{
  unint64_t v2 = [(ACCSQLite *)self synchronousMode];
  if (v2 >= 3) {
    -[ACCSQLite _synchronousModeString]();
  }
  return off_26466BB18[v2];
}

- (id)_createSchemaHash
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  v3 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:32 freeWhenDone:0];
  objc_super v4 = [(ACCSQLite *)self schema];
  int v5 = [v4 dataUsingEncoding:4];

  CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  v6 = [v3 CKUppercaseHexStringWithoutSpaces];

  return v6;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)_periodicVacuum
{
  v3 = (void *)MEMORY[0x263EFF910];
  objc_super v4 = [(ACCSQLite *)self propertyForKey:@"LastVacuum"];
  [v4 floatValue];
  id v11 = [v3 dateWithTimeIntervalSinceReferenceDate:v5];

  [v11 timeIntervalSinceNow];
  if (v6 < -604800.0)
  {
    [(ACCSQLite *)self executeSQL:@"VACUUM"];
    id v7 = NSString;
    id v8 = [MEMORY[0x263EFF910] date];
    [v8 timeIntervalSinceReferenceDate];
    v10 = objc_msgSend(v7, "stringWithFormat:", @"%f", v9);

    [(ACCSQLite *)self setProperty:v10 forKey:@"LastVacuum"];
  }
}

- (BOOL)openWithError:(id *)a3
{
  v64[1] = *MEMORY[0x263EF8340];
  float v5 = self->_path;
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    id v7 = 0;
    id v8 = 0;
    id v9 = 0;
    self->_unint64_t openCount = openCount + 1;
LABEL_3:
    BOOL v10 = 1;
    goto LABEL_31;
  }
  id v8 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  id v11 = [MEMORY[0x263F08850] defaultManager];
  id v58 = 0;
  char v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v58];
  id v13 = v58;
  v14 = v13;
  if (v12) {
    goto LABEL_7;
  }
  v15 = [v13 domain];
  if (![v15 isEqualToString:*MEMORY[0x263F07F70]])
  {

    goto LABEL_11;
  }
  uint64_t v16 = [v14 code];

  if (v16 != 516)
  {
LABEL_11:
    id v25 = v14;
    int v26 = 0;
    id v19 = v25;
    goto LABEL_12;
  }
LABEL_7:
  v56 = a3;
  id v57 = v14;
  objc_super v17 = v5;
  v18 = [v11 attributesOfItemAtPath:v8 error:&v57];
  id v19 = v57;

  uint64_t v20 = *MEMORY[0x263F080A8];
  v21 = [v18 objectForKeyedSubscript:*MEMORY[0x263F080A8]];
  uint64_t v22 = *MEMORY[0x263F08098];
  char v23 = [v21 isEqualToString:*MEMORY[0x263F08098]];

  if ((v23 & 1) == 0)
  {
    uint64_t v63 = v20;
    v64[0] = v22;
    v24 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    [v11 setAttributes:v24 ofItemAtPath:v8 error:0];
  }
  id v25 = 0;
  int v26 = 1;
  float v5 = v17;
  a3 = v56;
LABEL_12:

  id v9 = v25;
  if (!v26) {
    goto LABEL_26;
  }
  p_db = &self->_db;
  uint64_t v28 = sqlite3_open_v2([(NSString *)v5 fileSystemRepresentation], &self->_db, 3145734, 0);
  if (v28)
  {
    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F07F70];
    uint64_t v61 = *MEMORY[0x263F08320];
    v31 = [NSString stringWithFormat:@"Error opening db at %@, rc=%d(0x%x)", self->_path, v28, v28];
    v62 = v31;
    v32 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v33 = [v29 errorWithDomain:v30 code:0 userInfo:v32];

    id v9 = (id)v33;
    goto LABEL_26;
  }
  sqlite3_extended_result_codes(*p_db, 1);
  if (!sqlite3_busy_timeout(*p_db, 300000))
  {
    if ([(ACCSQLite *)self executeSQL:@"pragma journal_mode = WAL"])
    {
      v34 = [(ACCSQLite *)self _synchronousModeString];
      BOOL v35 = [(ACCSQLite *)self executeSQL:@"pragma synchronous = %@", v34];

      if (v35)
      {
        if ([(ACCSQLite *)self executeSQL:@"pragma auto_vacuum = FULL"])
        {
          [(ACCSQLite *)self begin];
          v36 = [(ACCSQLite *)self select:&unk_26D5AF828 from:@"sqlite_master" where:@"type = ? AND name = ?" bindings:&unk_26D5AF840];
          if (![v36 count]) {
            [(ACCSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
          }
          id v7 = [(ACCSQLite *)self propertyForKey:@"SchemaVersion"];
          uint64_t v37 = [(ACCSQLite *)self dbUserVersion];
          if (v7)
          {
            uint64_t v38 = v37;
            v39 = [(ACCSQLite *)self schemaVersion];
            if ([v7 isEqualToString:v39])
            {
              if (![(ACCSQLite *)self userVersion])
              {
                char v50 = 0;
                goto LABEL_40;
              }
              int v40 = [(ACCSQLite *)self userVersion];

              if (v38 == v40)
              {
LABEL_37:
                char v50 = 0;
LABEL_41:
                [(ACCSQLite *)self end];
                if ([(ACCSQLite *)self shouldVacuum]) {
                  [(ACCSQLite *)self _periodicVacuum];
                }
                if ((v50 & 1) != 0 || self->_hasMigrated)
                {
                  v55 = [(ACCSQLite *)self schemaVersion];
                  [(ACCSQLite *)self setProperty:v55 forKey:@"SchemaVersion"];

                  if ([(ACCSQLite *)self userVersion]) {
                    [(ACCSQLite *)self executeSQL:@"pragma user_version = %ld", [(ACCSQLite *)self userVersion]];
                  }
                }
                ++self->_openCount;

                goto LABEL_3;
              }
            }
            else
            {
            }
            uint64_t v46 = [(ACCSQLite *)self delegate];
            if (v46)
            {
              v47 = (void *)v46;
              v48 = [(ACCSQLite *)self delegate];
              int v49 = [v48 migrateDatabase:self fromVersion:v38];

              if (v49) {
                self->_hasMigrated = 1;
              }
            }
            if (self->_hasMigrated) {
              goto LABEL_37;
            }
            [(ACCSQLite *)self removeAllStatements];
            [(ACCSQLite *)self dropAllTables];
            self->_hasMigrated = 1;
          }
          [(ACCSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
          v51 = [(ACCSQLite *)self schema];
          [(ACCSQLite *)self executeSQL:@"%@", v51];

          v52 = NSString;
          v53 = [MEMORY[0x263EFF910] date];
          [v53 timeIntervalSinceReferenceDate];
          v39 = objc_msgSend(v52, "stringWithFormat:", @"%f", v54);

          [(ACCSQLite *)self setProperty:v39 forKey:@"Created"];
          char v50 = 1;
LABEL_40:

          goto LABEL_41;
        }
      }
    }
  }
LABEL_26:
  sqlite3_close_v2(self->_db);
  self->_db = 0;
  if (a3)
  {
    if (!v9)
    {
      v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F07F70];
      uint64_t v59 = *MEMORY[0x263F08320];
      v43 = [NSString stringWithFormat:@"Error opening db at %@, ", self->_path];
      v60 = v43;
      v44 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id v9 = [v41 errorWithDomain:v42 code:0 userInfo:v44];
    }
    id v9 = v9;
    id v7 = 0;
    BOOL v10 = 0;
    *a3 = v9;
  }
  else
  {
    id v7 = 0;
    BOOL v10 = 0;
  }
LABEL_31:

  return v10;
}

- (void)open
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = 0;
  BOOL v3 = [(ACCSQLite *)self openWithError:&v6];
  id v4 = v6;
  if (!v3 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    float v5 = [(ACCSQLite *)self path];
    *(_DWORD *)buf = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error opening db at %@: %@", buf, 0x16u);
  }
}

- (void)close
{
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    if (openCount == 1)
    {
      [(ACCSQLite *)self removeAllStatements];
      if (sqlite3_close(self->_db))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v4 = 0;
          _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error closing database", v4, 2u);
        }
        return;
      }
      self->_db = 0;
      unint64_t openCount = self->_openCount;
    }
    self->_unint64_t openCount = openCount - 1;
  }
}

- (void)remove
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 removeItemAtPath:self->_path error:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [&unk_26D5AF810 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&unk_26D5AF810);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        __int16 v9 = [MEMORY[0x263F08850] defaultManager];
        id v10 = [(NSString *)self->_path stringByAppendingString:v8];
        [v9 removeItemAtPath:v10 error:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_26D5AF810 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)begin
{
}

- (void)end
{
}

- (void)rollback
{
}

- (void)analyze
{
}

- (void)vacuum
{
}

- (int64_t)lastInsertRowID
{
  db = self->_db;
  if (db)
  {
    return sqlite3_last_insert_rowid(db);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
    }
    return -1;
  }
}

- (int)changes
{
  db = self->_db;
  if (db)
  {
    return sqlite3_changes(db);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
    }
    return -1;
  }
}

- (BOOL)executeSQL:(id)a3
{
  return [(ACCSQLite *)self executeSQL:a3 arguments:&v4];
}

- (BOOL)executeSQL:(id)a3 arguments:(char *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

  db = self->_db;
  if (db)
  {
    int v10 = sqlite3_exec(db, (const char *)[v8 UTF8String], 0, 0, 0);
    if (!v10)
    {
      BOOL v12 = 1;
      goto LABEL_9;
    }
    int v11 = v10;
    BOOL v12 = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v8;
      __int16 v19 = 1024;
      int v20 = v11;
      long long v13 = MEMORY[0x263EF8438];
      long long v14 = "[#ACCEventLogger] accsqlite: Error executing SQL: \"%@\" (%d)";
      uint32_t v15 = 18;
LABEL_7:
      _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v15);
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      long long v13 = MEMORY[0x263EF8438];
      long long v14 = "[#ACCEventLogger] accsqlite: Database is closed";
      uint32_t v15 = 2;
      goto LABEL_7;
    }
  }
LABEL_9:

  return v12;
}

- (id)statementForSQL:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_db)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", buf, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_statementsBySQL objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_10;
  }
  ppStmt = 0;
  id v6 = v4;
  if (sqlite3_prepare_v2(self->_db, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Error preparing statement: %@", buf, 0xCu);
    }

LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [ACCSQLiteStatement alloc];
  uint64_t v5 = [(ACCSQLiteStatement *)v8 initWithSQLite:self SQL:v6 handle:ppStmt];
  [(NSMutableDictionary *)self->_statementsBySQL setObject:v5 forKeyedSubscript:v6];

LABEL_10:
  return v5;
}

- (void)removeAllStatements
{
  BOOL v3 = [(NSMutableDictionary *)self->_statementsBySQL allValues];
  [v3 makeObjectsPerformSelector:sel_finalizeStatement];

  statementsBySQL = self->_statementsBySQL;
  [(NSMutableDictionary *)statementsBySQL removeAllObjects];
}

- (id)allTableNames
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(ACCSQLite *)self statementForSQL:@"select name from sqlite_master where type = 'table'"];
  if ([v4 step])
  {
    do
    {
      uint64_t v5 = [v4 textAtIndex:0];
      [v3 addObject:v5];
    }
    while (([v4 step] & 1) != 0);
  }
  [v4 reset];

  return v3;
}

- (void)dropAllTables
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(ACCSQLite *)self allTableNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ACCSQLite *)self executeSQL:@"drop table %@", *(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCSQLite *)self statementForSQL:@"select value from Properties where key = ?"];
  [v5 bindText:v4 atIndex:0];

  uint64_t v6 = 0;
  if ([v5 step])
  {
    uint64_t v6 = [v5 textAtIndex:0];
  }
  [v5 reset];

  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    uint64_t v7 = [(ACCSQLite *)self statementForSQL:@"insert or replace into Properties (key, value) values (?,?)"];
    [v7 bindText:v6 atIndex:0];

    [v7 bindText:v8 atIndex:1];
    [v7 step];
    [v7 reset];
    id v6 = v7;
  }
  else
  {
    [(ACCSQLite *)self removePropertyForKey:v6];
  }
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    uint64_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = [(ACCSQLite *)self propertyForKey:a3];
  if ([v4 length])
  {
    uint64_t v5 = [(ACCSQLite *)self dateFormatter];
    id v6 = [v5 dateFromString:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [(ACCSQLite *)self dateFormatter];
    a3 = [v7 stringFromDate:v6];
  }
  [(ACCSQLite *)self setProperty:a3 forKey:v8];
}

- (void)removePropertyForKey:(id)a3
{
  id v4 = a3;
  [(ACCSQLite *)self statementForSQL:@"delete from Properties where key = ?"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 bindText:v4 atIndex:0];

  [v5 step];
  [v5 reset];
}

- (id)creationDate
{
  unint64_t v2 = (void *)MEMORY[0x263EFF910];
  id v3 = [(ACCSQLite *)self propertyForKey:@"Created"];
  [v3 floatValue];
  id v5 = [v2 dateWithTimeIntervalSinceReferenceDate:v4];

  return v5;
}

- (id)columnNamesForTable:(id)a3
{
  float v4 = [NSString stringWithFormat:@"pragma table_info(%@)", a3];
  id v5 = [(ACCSQLite *)self statementForSQL:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([v5 step])
  {
    do
    {
      uint64_t v7 = [v5 textAtIndex:1];
      [v6 addObject:v7];
    }
    while (([v5 step] & 1) != 0);
  }
  [v5 reset];

  return v6;
}

- (id)select:(id)a3 from:(id)a4
{
  return [(ACCSQLite *)self select:a3 from:a4 where:0 bindings:0];
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint32_t v15 = (void *)MEMORY[0x263F089D8];
  uint64_t v16 = [v10 componentsJoinedByString:@", "];
  int v17 = [v15 stringWithFormat:@"select %@ from %@", v16, v11];

  if (v12) {
    [v17 appendFormat:@" where %@", v12];
  }
  v18 = [(ACCSQLite *)self statementForSQL:v17];
  [v18 bindValues:v13];
  if ([v18 step])
  {
    do
    {
      __int16 v19 = [v18 allObjectsByColumnName];
      [v14 addObject:v19];
    }
    while (([v18 step] & 1) != 0);
  }
  [v18 reset];

  return v14;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v15 = a3;
  id v30 = a4;
  id v16 = a5;
  id v29 = a6;
  id v17 = a7;
  id v18 = a8;
  __int16 v19 = (void (**)(id, void *, unsigned char *))a9;
  int v20 = (void *)MEMORY[0x223CA7860]();
  id v21 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v28 = v15;
  if ([v15 count])
  {
    uint64_t v22 = [v15 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v22 = @"*";
  }
  [v21 appendFormat:@"select %@ from %@", v22, v30];
  if ([v16 length]) {
    [v21 appendFormat:@" where %@", v16];
  }
  if (v17)
  {
    char v23 = [v17 componentsJoinedByString:@", "];
    [v21 appendFormat:@" order by %@", v23];
  }
  if (v18) {
    objc_msgSend(v21, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  v24 = [(ACCSQLite *)self statementForSQL:v21];
  id v25 = (void *)MEMORY[0x223CA7860]([v24 bindValues:v29]);
  int v26 = v17;
  if ([v24 step])
  {
    while (1)
    {
      v27 = [v24 allObjectsByColumnName];
      if (v19)
      {
        char v31 = 0;
        v19[2](v19, v27, &v31);
        if (v31) {
          break;
        }
      }

      id v25 = (void *)MEMORY[0x223CA7860]();
      if (([v24 step] & 1) == 0) {
        goto LABEL_16;
      }
    }
  }
LABEL_16:
  [v24 reset];
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  __int16 v19 = (void (**)(id, void *, unsigned char *))a8;
  context = (void *)MEMORY[0x223CA7860]();
  id v20 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v20 appendFormat:@"select * from %@", v14];
  if ([v15 length]) {
    [v20 appendFormat:@" where %@", v15, context];
  }
  if (v17)
  {
    id v21 = [v17 componentsJoinedByString:@", "];
    [v20 appendFormat:@" order by %@", v21];
  }
  if (v18) {
    objc_msgSend(v20, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  uint64_t v22 = [(ACCSQLite *)self statementForSQL:v20];
  char v23 = (void *)MEMORY[0x223CA7860]([v22 bindValues:v16]);
  if ([v22 step])
  {
    while (1)
    {
      v24 = [v22 allObjectsByColumnName];
      if (v19)
      {
        char v26 = 0;
        v19[2](v19, v24, &v26);
        if (v26) {
          break;
        }
      }

      char v23 = (void *)MEMORY[0x223CA7860]();
      if (([v22 step] & 1) == 0) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:
  [v22 reset];
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v14 appendFormat:@"select * from %@", v10];
  if ([v11 length]) {
    [v14 appendFormat:@" where %@", v11];
  }
  if (v13) {
    objc_msgSend(v14, "appendFormat:", @" limit %ld", objc_msgSend(v13, "integerValue"));
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v16 = [(ACCSQLite *)self statementForSQL:v14];
  [v16 bindValues:v12];
  if ([v16 step])
  {
    do
    {
      id v17 = [v16 allObjectsByColumnName];
      [v15 addObject:v17];
    }
    while (([v16 step] & 1) != 0);
  }
  [v16 reset];

  return v15;
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v16 appendFormat:@"update %@", v18];
  [v16 appendFormat:@" set %@", v12];
  if ([v13 length]) {
    [v16 appendFormat:@" where %@", v13];
  }
  if (v15) {
    objc_msgSend(v16, "appendFormat:", @" limit %ld", objc_msgSend(v15, "integerValue"));
  }
  id v17 = [(ACCSQLite *)self statementForSQL:v16];
  [v17 bindValues:v14];
  while (([v17 step] & 1) != 0)
    ;
  [v17 reset];
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return [(ACCSQLite *)self selectFrom:a3 where:a4 bindings:a5 limit:0];
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v5 = [(ACCSQLite *)self select:&unk_26D5AF858 from:a3 where:a4 bindings:a5];
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"n"];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 allKeys];
  long long v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v9 objectAtIndexedSubscript:v11];
      id v13 = [v7 objectForKeyedSubscript:v12];
      [v10 setObject:v13 atIndexedSubscript:v11];

      ++v11;
    }
    while (v11 < [v9 count]);
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"insert or replace into "];
  [v14 appendString:v6];
  objc_msgSend(v14, "appendString:", @" (");
  if ([v9 count])
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = [v9 objectAtIndexedSubscript:v15];
      [v14 appendString:v16];

      if (v15 != [v9 count] - 1) {
        [v14 appendString:@","];
      }
      ++v15;
    }
    while (v15 < [v9 count]);
  }
  [v14 appendString:@") values ("];
  if ([v9 count])
  {
    unint64_t v17 = 0;
    do
    {
      if (v17 == [v9 count] - 1) {
        id v18 = @"?";
      }
      else {
        id v18 = @"?,";
      }
      [v14 appendString:v18];
      ++v17;
    }
    while (v17 < [v9 count]);
  }
  [v14 appendString:@""]);
  __int16 v19 = [(ACCSQLite *)self statementForSQL:v14];
  [v19 bindValues:v10];
  [v19 step];
  [v19 reset];
  int64_t v20 = [(ACCSQLite *)self lastInsertRowID];

  return v20;
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  id v18 = self;
  id v19 = a3;
  id v5 = a4;
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v7 count])
  {
    unint64_t v10 = 0;
    int v11 = 0;
    do
    {
      id v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v18);
      id v13 = [v5 objectForKeyedSubscript:v12];

      id v14 = [v7 objectAtIndexedSubscript:v10];
      [v9 appendString:v14];

      if (v13
        && ([MEMORY[0x263EFF9D0] null],
            unint64_t v15 = objc_claimAutoreleasedReturnValue(),
            char v16 = [v15 isEqual:v13],
            v15,
            (v16 & 1) == 0))
      {
        [v8 setObject:v13 atIndexedSubscript:v11];
        unint64_t v17 = @"=?";
        ++v11;
      }
      else
      {
        unint64_t v17 = @" is NULL";
      }
      [v9 appendString:v17];
      if (v10 != [v7 count] - 1) {
        [v9 appendString:@" AND "];
      }

      ++v10;
    }
    while (v10 < [v7 count]);
  }
  -[ACCSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = NSString;
  id v9 = a5;
  id v11 = [v8 stringWithFormat:@"delete from %@ where %@", a3, a4];
  unint64_t v10 = [(ACCSQLite *)self statementForSQL:v11];
  [v10 bindValues:v9];

  [v10 step];
  [v10 reset];
}

- (id)_tableNameForClass:(Class)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  float v4 = [(objc_class *)a3 ACCSQLiteClassName];
  if ([v4 hasPrefix:self->_objectClassPrefix])
  {
    id v5 = objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [NSString stringWithFormat:@"Object class \"%@\" does not have prefix \"%@\"", v4, self->_objectClassPrefix];
      *(_DWORD *)buf = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: %@", buf, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

- (int)dbUserVersion
{
  unint64_t v2 = [(ACCSQLite *)self statementForSQL:@"pragma user_version"];
  if ([v2 step])
  {
    do
      int v3 = [v2 intAtIndex:0];
    while (([v2 step] & 1) != 0);
  }
  else
  {
    int v3 = 0;
  }
  [v2 reset];

  return v3;
}

- (ACCSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setTraced:(BOOL)a3
{
  self->_traced = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_unint64_t openCount = a3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (NSMutableDictionary)statementsBySQL
{
  return self->_statementsBySQL;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_statementsBySQL, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_synchronousModeString
{
}

@end