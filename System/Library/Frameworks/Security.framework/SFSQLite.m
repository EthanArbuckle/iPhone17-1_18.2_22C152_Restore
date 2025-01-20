@interface SFSQLite
- (BOOL)corrupt;
- (BOOL)executeSQL:(id)a3;
- (BOOL)hasMigrated;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)traced;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)oldDateFormatter;
- (NSMutableDictionary)statementsBySQL;
- (NSString)objectClassPrefix;
- (NSString)path;
- (NSString)schema;
- (NSString)schemaVersion;
- (SFSQLite)initWithPath:(id)a3 schema:(id)a4;
- (SFSQLiteDelegate)delegate;
- (id)_createSchemaHash;
- (id)_synchronousModeString;
- (id)_tableNameForClass:(Class)a3;
- (id)allTableNames;
- (id)columnNamesForTable:(id)a3;
- (id)creationDate;
- (id)datePropertyForKey:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)select:(id)a3 from:(id)a4;
- (id)select:(id)a3 from:(id)a4 mapEachRow:(id)a5;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6;
- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)statementForSQL:(id)a3;
- (int)autoVacuumSetting;
- (int)changes;
- (int)dbUserVersion;
- (int)userVersion;
- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4;
- (int64_t)lastInsertRowID;
- (int64_t)synchronousMode;
- (sqlite3)db;
- (unint64_t)openCount;
- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)analyze;
- (void)attemptProperDatabasePermissions;
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
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 forEachRow:(id)a9;
- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)setCorrupt:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectClassPrefix:(id)a3;
- (void)setOldDateFormatter:(id)a3;
- (void)setOpenCount:(unint64_t)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setSynchronousMode:(int64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setUserVersion:(int)a3;
- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7;
- (void)vacuum;
@end

@implementation SFSQLite

- (BOOL)executeSQL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  db = self->_db;
  if (db)
  {
    id v7 = v4;
    int v8 = sqlite3_exec(db, (const char *)[v7 UTF8String], 0, 0, 0);
    if (!v8)
    {
      BOOL v13 = 1;
      goto LABEL_14;
    }
    int v9 = v8;
    if (v8 != 8 && v8 != 23)
    {
      v11 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v7;
        __int16 v17 = 1024;
        int v18 = v9;
        _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error executing SQL: \"%@\" (%d)", (uint8_t *)&v15, 0x12u);
      }
    }
  }
  else
  {
    v12 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", (uint8_t *)&v15, 2u);
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (void)end
{
}

- (void)begin
{
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 allKeys];
  int v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [v9 objectAtIndexedSubscript:v11];
      BOOL v13 = [v7 objectForKeyedSubscript:v12];
      [v10 setObject:v13 atIndexedSubscript:v11];

      ++v11;
    }
    while (v11 < [v9 count]);
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"insert or replace into "];
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
        int v18 = @"?";
      }
      else {
        int v18 = @"?,";
      }
      [v14 appendString:v18];
      ++v17;
    }
    while (v17 < [v9 count]);
  }
  [v14 appendString:@""]);
  uint64_t v19 = [(SFSQLite *)self statementForSQL:v14];
  [v19 bindValues:v10];
  [v19 step];
  [v19 reset];
  int64_t v20 = [(SFSQLite *)self lastInsertRowID];

  return v20;
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
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
    }

    return -1;
  }
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v15 = (void *)MEMORY[0x1E4F28E78];
  id v16 = [v10 componentsJoinedByString:@", "];
  unint64_t v17 = [v15 stringWithFormat:@"select %@ from %@", v16, v11];

  if (v12) {
    [v17 appendFormat:@" where %@", v12];
  }
  int v18 = [(SFSQLite *)self statementForSQL:v17];
  [v18 bindValues:v13];
  if ([v18 step])
  {
    do
    {
      uint64_t v19 = [v18 allObjectsByColumnName];
      [v14 addObject:v19];
    }
    while (([v18 step] & 1) != 0);
  }
  [v18 reset];

  return v14;
}

- (id)statementForSQL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_db)
  {
    int v9 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", buf, 2u);
    }
    goto LABEL_11;
  }
  id v6 = [(NSMutableDictionary *)self->_statementsBySQL objectForKeyedSubscript:v5];
  if (!v6)
  {
    ppStmt = 0;
    int v9 = v5;
    if (!sqlite3_prepare_v2(self->_db, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
    {
      id v12 = [SFSQLiteStatement alloc];
      id v7 = [(SFSQLiteStatement *)v12 initWithSQLite:self SQL:v9 handle:ppStmt];
      [(NSMutableDictionary *)self->_statementsBySQL setObject:v7 forKeyedSubscript:v9];

      goto LABEL_12;
    }
    id v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v15 = v9;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "Error preparing statement: %@", buf, 0xCu);
    }

LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }
  id v7 = v6;
  if (![(SFSQLiteStatement *)v6 isReset])
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLite.m", 550, @"Statement not reset after last use: \"%@\"", v5 object file lineNumber description];
  }
LABEL_12:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_statementsBySQL, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setOldDateFormatter:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (NSMutableDictionary)statementsBySQL
{
  return self->_statementsBySQL;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_openCount = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setTraced:(BOOL)a3
{
  self->_traced = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (void)setObjectClassPrefix:(id)a3
{
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)path
{
  return self->_path;
}

- (void)setDelegate:(id)a3
{
}

- (SFSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (int)autoVacuumSetting
{
  v2 = [(SFSQLite *)self statementForSQL:@"pragma auto_vacuum"];
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

- (int)dbUserVersion
{
  v2 = [(SFSQLite *)self statementForSQL:@"pragma user_version"];
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

- (id)_tableNameForClass:(Class)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [(objc_class *)a3 SFSQLiteClassName];
  if ([v4 hasPrefix:self->_objectClassPrefix])
  {
    id v5 = objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objectClassPrefix = self->_objectClassPrefix;
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = objectClassPrefix;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "sfsqlite: Object class \"%@\" does not have prefix \"%@\"", (uint8_t *)&v9, 0x16u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  int v8 = NSString;
  id v9 = a5;
  id v11 = [v8 stringWithFormat:@"delete from %@ where %@", a3, a4];
  id v10 = [(SFSQLite *)self statementForSQL:v11];
  [v10 bindValues:v9];

  [v10 step];
  [v10 reset];
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  int v18 = self;
  id v19 = a3;
  id v5 = a4;
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v7 count])
  {
    unint64_t v10 = 0;
    int v11 = 0;
    do
    {
      id v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v18);
      uint64_t v13 = [v5 objectForKeyedSubscript:v12];

      id v14 = [v7 objectAtIndexedSubscript:v10];
      [v9 appendString:v14];

      if (v13
        && ([MEMORY[0x1E4F1CA98] null],
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
  -[SFSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v5 = [(SFSQLite *)self select:&unk_1ED86CB28 from:a3 where:a4 bindings:a5];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 objectForKeyedSubscript:@"n"];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return [(SFSQLite *)self selectFrom:a3 where:a4 bindings:a5 limit:0];
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 length])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v16 appendFormat:@"update %@", v18];
    [v16 appendFormat:@" set %@", v12];
    if ([v13 length]) {
      [v16 appendFormat:@" where %@", v13];
    }
    if (v15) {
      objc_msgSend(v16, "appendFormat:", @" limit %ld", objc_msgSend(v15, "integerValue"));
    }
    unint64_t v17 = [(SFSQLite *)self statementForSQL:v16];
    [v17 bindValues:v14];
    while (([v17 step] & 1) != 0)
      ;
    [v17 reset];
  }
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v14 appendFormat:@"select * from %@", v10];
  if ([v11 length]) {
    [v14 appendFormat:@" where %@", v11];
  }
  if (v13) {
    objc_msgSend(v14, "appendFormat:", @" limit %ld", objc_msgSend(v13, "integerValue"));
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = [(SFSQLite *)self statementForSQL:v14];
  [v16 bindValues:v12];
  if ([v16 step])
  {
    do
    {
      unint64_t v17 = [v16 allObjectsByColumnName];
      [v15 addObject:v17];
    }
    while (([v16 step] & 1) != 0);
  }
  [v16 reset];

  return v15;
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *, unsigned char *))a8;
  context = (void *)MEMORY[0x18C12E850]();
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v20 appendFormat:@"select * from %@", v14];
  if ([v15 length]) {
    [v20 appendFormat:@" where %@", v15, context];
  }
  if (v17)
  {
    v21 = [v17 componentsJoinedByString:@", "];
    [v20 appendFormat:@" order by %@", v21];
  }
  if (v18) {
    objc_msgSend(v20, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  v22 = [(SFSQLite *)self statementForSQL:v20];
  v23 = (void *)MEMORY[0x18C12E850]([v22 bindValues:v16]);
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

      v23 = (void *)MEMORY[0x18C12E850]();
      if (([v22 step] & 1) == 0) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:
  [v22 reset];
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 forEachRow:(id)a9
{
  id v15 = a3;
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void *, unsigned char *))a9;
  v21 = (void *)MEMORY[0x18C12E850]();
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v15 count])
  {
    v23 = [v15 componentsJoinedByString:@", "];
  }
  else
  {
    v23 = @"*";
  }
  v27 = v23;
  [v22 appendFormat:@"select %@ from %@", v23, v28];
  if ([v16 length]) {
    [v22 appendFormat:@" where %@", v16];
  }
  if (v18)
  {
    v24 = [v18 componentsJoinedByString:@", "];
    [v22 appendFormat:@" order by %@", v24];
  }
  if (v19) {
    objc_msgSend(v22, "appendFormat:", @" limit %ld", objc_msgSend(v19, "integerValue"));
  }
  v25 = [(SFSQLite *)self statementForSQL:v22];
  char v26 = (void *)MEMORY[0x18C12E850]([v25 bindValues:v17]);
  if ([v25 step])
  {
    do
    {
      if (v20)
      {
        char v29 = 0;
        v20[2](v20, v25, &v29);
        if (v29) {
          break;
        }
      }
      char v26 = (void *)MEMORY[0x18C12E850]();
    }
    while (([v25 step] & 1) != 0);
  }
  [v25 reset];
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v16 = a9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke;
  v18[3] = &unk_1E54755F0;
  id v19 = v16;
  id v17 = v16;
  [(SFSQLite *)self select:a3 from:a4 where:a5 bindings:a6 orderBy:a7 limit:a8 forEachRow:v18];
}

uint64_t __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke(uint64_t a1, void *a2)
{
  [a2 allObjectsByColumnName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (id)select:(id)a3 from:(id)a4 mapEachRow:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__SFSQLite_select_from_mapEachRow___block_invoke;
  v18[3] = &unk_1E54755C8;
  id v20 = v8;
  id v13 = v12;
  id v19 = v13;
  id v14 = v8;
  [(SFSQLite *)self select:v11 from:v10 where:0 bindings:0 orderBy:0 limit:0 forEachRow:v18];

  id v15 = v19;
  id v16 = v13;

  return v16;
}

uint64_t __35__SFSQLite_select_from_mapEachRow___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

- (id)select:(id)a3 from:(id)a4
{
  return [(SFSQLite *)self select:a3 from:a4 where:0 bindings:0];
}

- (id)columnNamesForTable:(id)a3
{
  id v4 = [NSString stringWithFormat:@"pragma table_info(%@)", a3];
  id v5 = [(SFSQLite *)self statementForSQL:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v5 step])
  {
    do
    {
      id v7 = [v5 textAtIndex:1];
      [v6 addObject:v7];
    }
    while (([v5 step] & 1) != 0);
  }
  [v5 reset];

  return v6;
}

- (id)creationDate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v3 = [(SFSQLite *)self propertyForKey:@"Created"];
  [v3 floatValue];
  id v5 = [v2 dateWithTimeIntervalSinceReferenceDate:v4];

  return v5;
}

- (void)removePropertyForKey:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    float v4 = [(SFSQLite *)self statementForSQL:@"delete from Properties where key = ?"];
    [v4 bindText:v5 atIndex:0];
    [v4 step];
    [v4 reset];
  }
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = [(SFSQLite *)self dateFormatter];
    a3 = [v7 stringFromDate:v6];
  }
  [(SFSQLite *)self setProperty:a3 forKey:v8];
}

- (id)datePropertyForKey:(id)a3
{
  float v4 = [(SFSQLite *)self propertyForKey:a3];
  if ([v4 length])
  {
    id v5 = [(SFSQLite *)self dateFormatter];
    id v6 = [v5 dateFromString:v4];

    if (!v6)
    {
      id v7 = [(SFSQLite *)self oldDateFormatter];
      id v6 = [v7 dateFromString:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDateFormatter)oldDateFormatter
{
  oldDateFormatter = self->_oldDateFormatter;
  if (!oldDateFormatter)
  {
    float v4 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    id v5 = self->_oldDateFormatter;
    self->_oldDateFormatter = v4;

    oldDateFormatter = self->_oldDateFormatter;
  }

  return oldDateFormatter;
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    float v4 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (!v6)
    {
      [(SFSQLite *)self removePropertyForKey:v7];
      goto LABEL_8;
    }
    id v8 = [(SFSQLite *)self statementForSQL:@"insert or replace into Properties (key, value) values (?,?)"];
    [v8 bindText:v7 atIndex:0];
    [v8 bindText:v6 atIndex:1];
    [v8 step];
    [v8 reset];
  }
  else
  {
    id v8 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "SFSQLite: attempt to set property without a key", v9, 2u);
    }
  }

LABEL_8:
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(SFSQLite *)self statementForSQL:@"select value from Properties where key = ?"];
    [v5 bindText:v4 atIndex:0];
    id v6 = 0;
    if ([v5 step])
    {
      id v6 = [v5 textAtIndex:0];
    }
    [v5 reset];
  }
  else
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "SFSQLite: attempt to retrieve property without a key", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)dropAllTables
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(SFSQLite *)self allTableNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [NSString stringWithFormat:@"drop table %@", *(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [(SFSQLite *)self executeSQL:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)allTableNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(SFSQLite *)self statementForSQL:@"select name from sqlite_master where type = 'table'"];
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

- (void)removeAllStatements
{
  id v3 = [(NSMutableDictionary *)self->_statementsBySQL allValues];
  [v3 makeObjectsPerformSelector:sel_finalizeStatement];

  statementsBySQL = self->_statementsBySQL;

  [(NSMutableDictionary *)statementsBySQL removeAllObjects];
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
    uint64_t v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
    }

    return -1;
  }
}

- (void)vacuum
{
}

- (void)analyze
{
}

- (void)rollback
{
}

- (void)remove
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_openCount)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SFSQLite.m", 480, @"Trying to remove db at: %@ while it is open", self->_path object file lineNumber description];
  }
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtPath:self->_path error:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_1ED86CAE0 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(&unk_1ED86CAE0);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        long long v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v10 = [(NSString *)self->_path stringByAppendingString:v8];
        [v9 removeItemAtPath:v10 error:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_1ED86CAE0 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)close
{
  unint64_t openCount = self->_openCount;
  if (!openCount) {
    return;
  }
  if (openCount != 1)
  {
LABEL_10:
    self->_unint64_t openCount = openCount - 1;
    return;
  }
  if (!self->_db)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SFSQLite.m" lineNumber:465 description:@"Missing handle for open cache db"];
  }
  [(SFSQLite *)self removeAllStatements];
  if (!sqlite3_close(self->_db))
  {
    self->_db = 0;
    unint64_t openCount = self->_openCount;
    goto LABEL_10;
  }
  uint64_t v4 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error closing database", v7, 2u);
  }
}

- (void)open
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  BOOL v3 = [(SFSQLite *)self openWithError:&v8];
  id v4 = v8;
  uint64_t v5 = v4;
  if (!v3 && (!v4 || [v4 code] != 23))
  {
    uint64_t v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(SFSQLite *)self path];
      *(_DWORD *)buf = 138412546;
      long long v10 = v7;
      __int16 v11 = 2112;
      long long v12 = v5;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error opening db at %@: %@", buf, 0x16u);
    }
  }
}

- (BOOL)openWithError:(id *)a3
{
  v73[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = self->_path;
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    if (!self->_db)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:a2 object:self file:@"SFSQLite.m" lineNumber:324 description:@"Missing handle for open cache db"];

      unint64_t openCount = self->_openCount;
    }
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    self->_unint64_t openCount = openCount + 1;
    BOOL v11 = 1;
    goto LABEL_34;
  }
  id v9 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v67 = 0;
  char v13 = [v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v67];
  id v14 = v67;
  long long v15 = v14;
  if (v13) {
    goto LABEL_8;
  }
  long long v16 = [v14 domain];
  if (![v16 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_12;
  }
  uint64_t v17 = [v15 code];

  if (v17 != 516)
  {
LABEL_12:
    id v27 = v15;
    int v28 = 0;
    id v21 = v27;
    goto LABEL_13;
  }
LABEL_8:
  v65 = a3;
  id v66 = v15;
  uint64_t v18 = v6;
  id v19 = v9;
  id v20 = [v12 attributesOfItemAtPath:v9 error:&v66];
  id v21 = v66;

  uint64_t v22 = *MEMORY[0x1E4F28370];
  v23 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
  uint64_t v24 = *MEMORY[0x1E4F28358];
  char v25 = [v23 isEqualToString:*MEMORY[0x1E4F28358]];

  if ((v25 & 1) == 0)
  {
    uint64_t v72 = v22;
    v73[0] = v24;
    char v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
    [v12 setAttributes:v26 ofItemAtPath:v19 error:0];
  }
  id v27 = 0;
  int v28 = 1;
  uint64_t v6 = v18;
  a3 = v65;
  id v9 = v19;
LABEL_13:

  id v10 = v27;
  if (!v28) {
    goto LABEL_29;
  }
  uint64_t v29 = sqlite3_open_v2([(NSString *)v6 fileSystemRepresentation], &self->_db, 3145734, 0);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = sqlite3_system_errno(self->_db);
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F281F8];
    uint64_t v34 = (int)v30;
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v35 = [NSString stringWithFormat:@"Error opening db at %@, rc=%d(0x%x), errno=%d(0x%x)", self->_path, v30, v30, v31, v31];
    v71 = v35;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v37 = id v36 = v9;
    uint64_t v38 = [v32 errorWithDomain:v33 code:v34 userInfo:v37];

    id v9 = v36;
    id v10 = (id)v38;
    goto LABEL_29;
  }
  [(SFSQLite *)self attemptProperDatabasePermissions];
  sqlite3_extended_result_codes(self->_db, 1);
  if (!sqlite3_busy_timeout(self->_db, 300000))
  {
    if ([(SFSQLite *)self executeSQL:@"pragma journal_mode = WAL"])
    {
      v39 = NSString;
      v40 = [(SFSQLite *)self _synchronousModeString];
      v41 = [v39 stringWithFormat:@"pragma synchronous = %@", v40];
      BOOL v42 = [(SFSQLite *)self executeSQL:v41];

      if (v42
        && ([(SFSQLite *)self autoVacuumSetting] == 1
         || [(SFSQLite *)self executeSQL:@"pragma auto_vacuum = FULL"]
         && [(SFSQLite *)self executeSQL:@"VACUUM"]))
      {
        [(SFSQLite *)self begin];
        v43 = [(SFSQLite *)self select:&unk_1ED86CAF8 from:@"sqlite_master" where:@"type = ? AND name = ?" bindings:&unk_1ED86CB10];
        if (![v43 count]) {
          [(SFSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
        }
        id v8 = [(SFSQLite *)self propertyForKey:@"SchemaVersion"];
        uint64_t v44 = [(SFSQLite *)self dbUserVersion];
        if (v8)
        {
          uint64_t v45 = v44;
          v46 = [(SFSQLite *)self schemaVersion];
          if ([v8 isEqualToString:v46])
          {
            if (![(SFSQLite *)self userVersion])
            {

              goto LABEL_43;
            }
            int v47 = [(SFSQLite *)self userVersion];

            if (v45 == v47)
            {
LABEL_43:
              [(SFSQLite *)self end];
              if (!self->_hasMigrated)
              {
LABEL_46:
                ++self->_openCount;

                BOOL v11 = 1;
                goto LABEL_34;
              }
LABEL_44:
              v62 = [(SFSQLite *)self schemaVersion];
              [(SFSQLite *)self setProperty:v62 forKey:@"SchemaVersion"];

              if ([(SFSQLite *)self userVersion])
              {
                v63 = objc_msgSend(NSString, "stringWithFormat:", @"pragma user_version = %ld", -[SFSQLite userVersion](self, "userVersion"));
                [(SFSQLite *)self executeSQL:v63];
              }
              goto LABEL_46;
            }
          }
          else
          {
          }
          uint64_t v53 = [(SFSQLite *)self delegate];
          if (v53)
          {
            v54 = (void *)v53;
            v55 = [(SFSQLite *)self delegate];
            int v56 = [v55 migrateDatabase:self fromVersion:v45];

            if (v56) {
              self->_hasMigrated = 1;
            }
          }
          if (self->_hasMigrated) {
            goto LABEL_43;
          }
          [(SFSQLite *)self removeAllStatements];
          [(SFSQLite *)self dropAllTables];
          self->_hasMigrated = 1;
        }
        [(SFSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
        v57 = [(SFSQLite *)self schema];
        [(SFSQLite *)self executeSQL:v57];

        v58 = NSString;
        v59 = [MEMORY[0x1E4F1C9C8] date];
        [v59 timeIntervalSinceReferenceDate];
        v61 = objc_msgSend(v58, "stringWithFormat:", @"%f", v60);

        [(SFSQLite *)self setProperty:v61 forKey:@"Created"];
        [(SFSQLite *)self end];
        goto LABEL_44;
      }
    }
  }
LABEL_29:
  sqlite3_close_v2(self->_db);
  self->_db = 0;
  if (a3)
  {
    if (!v10)
    {
      v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F281F8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v50 = [NSString stringWithFormat:@"Error opening db at %@", self->_path];
      v69 = v50;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id v10 = [v48 errorWithDomain:v49 code:0 userInfo:v51];
    }
    id v10 = v10;
    id v8 = 0;
    BOOL v11 = 0;
    *a3 = v10;
  }
  else
  {
    id v8 = 0;
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (void)attemptProperDatabasePermissions
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = *MEMORY[0x1E4F28330];
  uint64_t v4 = v17;
  uint64_t v5 = [NSNumber numberWithShort:438];
  v18[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [v3 setAttributes:v6 ofItemAtPath:self->_path error:0];

  uint64_t v15 = v4;
  uint64_t v7 = [NSNumber numberWithShort:438];
  long long v16 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v9 = [NSString stringWithFormat:@"%@-wal", self->_path];
  [v3 setAttributes:v8 ofItemAtPath:v9 error:0];

  uint64_t v13 = v4;
  id v10 = [NSNumber numberWithShort:438];
  id v14 = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  long long v12 = [NSString stringWithFormat:@"%@-shm", self->_path];
  [v3 setAttributes:v11 ofItemAtPath:v12 error:0];
}

- (id)_createSchemaHash
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  BOOL v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:32 freeWhenDone:0];
  uint64_t v4 = [(SFSQLite *)self schema];
  uint64_t v5 = [v4 dataUsingEncoding:4];

  CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  uint64_t v6 = [v3 CKUppercaseHexStringWithoutSpaces];

  return v6;
}

- (id)_synchronousModeString
{
  unint64_t v2 = [(SFSQLite *)self synchronousMode];
  if (v2 < 3) {
    return off_1E5475610[v2];
  }
  __security_simulatecrash(@"Execution has encountered an unexpected state", 0x53C0000Eu);
  return @"normal";
}

- (int)userVersion
{
  BOOL v3 = [(SFSQLite *)self delegate];

  if (!v3) {
    return self->_userVersion;
  }
  uint64_t v4 = [(SFSQLite *)self delegate];
  int v5 = [v4 userVersion];

  return v5;
}

- (void)dealloc
{
  BOOL v3 = (void *)MEMORY[0x18C12E850](self, a2);
  [(SFSQLite *)self close];
  v4.receiver = self;
  v4.super_class = (Class)SFSQLite;
  [(SFSQLite *)&v4 dealloc];
}

- (SFSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    uint64_t v17 = secLogObjForScope("SecCritical");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Cannot init db with empty path";
LABEL_10:
      _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_11:

    long long v16 = 0;
    goto LABEL_12;
  }
  if (![v8 length])
  {
    uint64_t v17 = secLogObjForScope("SecCritical");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Cannot init db without schema";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v20.receiver = self;
  v20.super_class = (Class)SFSQLite;
  uint64_t v9 = [(SFSQLite *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_schema, a4);
    uint64_t v11 = [(SFSQLite *)v10 _createSchemaHash];
    schemaVersion = v10->_schemaVersion;
    v10->_schemaVersion = (NSString *)v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statementsBySQL = v10->_statementsBySQL;
    v10->_statementsBySQL = v13;

    objectClassPrefix = v10->_objectClassPrefix;
    v10->_objectClassPrefix = (NSString *)@"CK";

    v10->_synchronousMode = 1;
    v10->_hasMigrated = 0;
  }
  self = v10;
  long long v16 = self;
LABEL_12:

  return v16;
}

@end