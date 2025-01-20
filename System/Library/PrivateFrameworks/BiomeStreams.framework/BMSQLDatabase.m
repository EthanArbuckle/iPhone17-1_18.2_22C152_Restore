@interface BMSQLDatabase
- (BMSQLDatabase)init;
- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5;
- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 useCase:(id)a6;
- (BMSQLDatabase)initWithPrivileges:(id)a3 isColumnAccessLoggingEnabled:(BOOL)a4;
- (BMSQLDatabase)initWithStreams:(id)a3 library:(id)a4 privileges:(id)a5 isColumnAccessLoggingEnabled:(BOOL)a6 error:(id *)a7;
- (BMSQLDatabase)initWithUseCase:(id)a3;
- (BMSQLDatabase)initWithVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 enableAuthorizer:(BOOL)a6 error:(id *)a7;
- (BOOL)_attachDatabase:(id)a3 name:(id)a4 error:(id *)a5;
- (BOOL)attachDatabase:(id)a3 name:(id)a4 error:(id *)a5;
- (BOOL)attachDatabaseWithResourceIdentifier:(id)a3 useCase:(id)a4 error:(id *)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)isColumnAccessLoggingEnabled;
- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 error:(id *)a6;
- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 userData:(id)a6 error:(id *)a7;
- (NSArray)accessedColumns;
- (NSArray)privileges;
- (NSArray)virtualTables;
- (id)SQLSchemaString;
- (id)_executeQuery:(id)a3;
- (id)description;
- (id)executeQuery:(id)a3;
- (id)virtualTableForName:(id)a3;
- (sqlite3)db;
- (void)dealloc;
- (void)logColumnAccess:(id)a3 tableName:(id)a4;
- (void)resetColumnAccessLog;
@end

@implementation BMSQLDatabase

- (BMSQLDatabase)init
{
  return [(BMSQLDatabase *)self initWithPrivileges:0 isColumnAccessLoggingEnabled:0];
}

- (BMSQLDatabase)initWithUseCase:(id)a3
{
  return [(BMSQLDatabase *)self initWithAdditionalVirtualTables:MEMORY[0x1E4F1CBF0] privileges:0 isColumnAccessLoggingEnabled:0 useCase:a3];
}

- (BMSQLDatabase)initWithPrivileges:(id)a3 isColumnAccessLoggingEnabled:(BOOL)a4
{
  return [(BMSQLDatabase *)self initWithAdditionalVirtualTables:MEMORY[0x1E4F1CBF0] privileges:a3 isColumnAccessLoggingEnabled:a4];
}

- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5
{
  return [(BMSQLDatabase *)self initWithAdditionalVirtualTables:a3 privileges:a4 isColumnAccessLoggingEnabled:a5 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 useCase:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)MEMORY[0x1E4F4FB38];
  v13 = (void *)MEMORY[0x1E4F4FB80];
  id v14 = a6;
  v15 = [v13 current];
  v16 = [v12 policyForProcess:v15 connectionFlags:0 useCase:v14];

  v17 = [v16 explicitlyAuthorizedResourcesOfType:1 withAccessMode:1];
  v18 = BiomeLibraryNodeBridge();
  id v27 = 0;
  v19 = BMSQLVirtualTables(v18, v17, v14, &v27);

  id v20 = v27;
  if (v20
    || (v10 ? (id v21 = v10) : (id v21 = (id)MEMORY[0x1E4F1CBF0]),
        [v19 arrayByAddingObjectsFromArray:v21],
        v22 = objc_claimAutoreleasedReturnValue(),
        id v26 = 0,
        self = [(BMSQLDatabase *)self initWithVirtualTables:v22 privileges:v11 isColumnAccessLoggingEnabled:v7 enableAuthorizer:1 error:&v26], id v20 = v26, v22, v20))
  {
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BMSQLDatabase initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:]();
    }

    v24 = 0;
  }
  else
  {
    self = self;
    v24 = self;
  }

  return v24;
}

- (BMSQLDatabase)initWithStreams:(id)a3 library:(id)a4 privileges:(id)a5 isColumnAccessLoggingEnabled:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  v13 = (void *)*MEMORY[0x1E4F4FAF8];
  id v19 = 0;
  id v14 = BMSQLVirtualTables(a4, a3, v13, &v19);
  id v15 = v19;
  v16 = v15;
  if (v15)
  {
    v17 = 0;
    if (a7) {
      *a7 = v15;
    }
  }
  else
  {
    self = [(BMSQLDatabase *)self initWithVirtualTables:v14 privileges:v12 isColumnAccessLoggingEnabled:v8 enableAuthorizer:1 error:a7];
    v17 = self;
  }

  return v17;
}

- (BMSQLDatabase)initWithVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 enableAuthorizer:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v73.receiver = self;
  v73.super_class = (Class)BMSQLDatabase;
  id v14 = [(BMSQLDatabase *)&v73 init];
  if (!v14) {
    goto LABEL_49;
  }
  ppDb = 0;
  uint64_t module_v2 = sqlite3_open_v2(":memory:", &ppDb, 65538, 0);
  if (module_v2)
  {
    v16 = ppDb;
    v17 = "Failed to open in memory database";
    goto LABEL_4;
  }
  id v21 = (id *)bm_sqlite3_malloc(8);
  if (v21)
  {
    v22 = v21;
    objc_storeWeak(v21, v14);
    uint64_t module_v2 = sqlite3_create_module_v2(ppDb, "bmstream_vtab", &bmstream_vtab_module, v22, (void (__cdecl *)(void *))bmstream_vtab_destroy);
    if (module_v2)
    {
      v16 = ppDb;
      v17 = "Unable to load bmstream_vtab module";
      goto LABEL_4;
    }
    BOOL v57 = v8;
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_db = ppDb;
    v58 = v12;
    uint64_t v23 = [v12 copy];
    virtualTables = v14->_virtualTables;
    v14->_virtualTables = (NSArray *)v23;

    uint64_t v25 = [v13 copy];
    privileges = v14->_privileges;
    v14->_privileges = (NSArray *)v25;

    v14->_isColumnAccessLoggingEnabled = a5;
    id v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accessedColumns = v14->_accessedColumns;
    v14->_accessedColumns = v27;

    long long v71 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v68 = 0u;
    obuint64_t j = v14->_virtualTables;
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v83 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v69;
      uint64_t v59 = *MEMORY[0x1E4F28568];
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v69 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x192FB0D60]();
          v35 = [v33 schema];
          v36 = [v35 tableName];

          if (v36)
          {
            v37 = (void *)[[NSString alloc] initWithFormat:@"CREATE VIRTUAL TABLE IF NOT EXISTS \"%@\" USING bmstream_vtab", v36];
            id v67 = 0;
            [(BMSQLDatabase *)v14 executeStatement:v37 error:&v67];
            id v38 = v67;
          }
          else
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v81 = v59;
            v82 = @"virtual table is missing a schema/tableName";
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
            id v38 = (id)[v39 initWithDomain:@"BMSQLDatabaseErrorDomain" code:1 userInfo:v37];
          }
          v40 = v38;

          v41 = __biome_log_for_category();
          v42 = v41;
          if (v40)
          {
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v76 = v14;
              __int16 v77 = 2112;
              v78 = v36;
              __int16 v79 = 2112;
              v80 = v40;
              _os_log_error_impl(&dword_18E67D000, v42, OS_LOG_TYPE_ERROR, "BMSQLDatabase failed to add virtual table to %@ with name %@. %@", buf, 0x20u);
            }

            id v12 = v58;
            if (a7) {
              *a7 = v40;
            }
            sqlite3_close(ppDb);
            v14->_db = 0;

            goto LABEL_7;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v36;
            _os_log_debug_impl(&dword_18E67D000, v42, OS_LOG_TYPE_DEBUG, "BMSQLDatabase finished adding virtual table with name %@", buf, 0xCu);
          }
        }
        uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v83 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    if (a7) {
      *a7 = 0;
    }
    obja = a7;
    v43 = objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v44 = v58;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v64 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          v50 = [v49 stream];

          if (v50)
          {
            v51 = [v49 stream];
            v52 = [v51 configuration];
            v53 = (void *)[v52 eventClass];

            if ([v53 isSubclassOfClass:objc_opt_class()]) {
              [v43 addObject:v53];
            }
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v46);
    }

    id v62 = 0;
    +[BMSQLProtoUDFs registerProtoUDFsWithDatabase:v14 eventClasses:v43 error:&v62];
    id v54 = v62;
    v55 = v54;
    if (v54)
    {
      if (obja) {
        id *obja = v54;
      }

      id v20 = 0;
      id v12 = v58;
      goto LABEL_50;
    }
    if (v57) {
      sqlite3_set_authorizer(ppDb, (int (__cdecl *)(void *, int, const char *, const char *, const char *, const char *))bmstream_authorizer, v14);
    }

    id v12 = v58;
LABEL_49:
    id v20 = v14;
    goto LABEL_50;
  }
  v16 = ppDb;
  v17 = "Unable to alloc memory for bmstream_vtab_metadata";
  uint64_t module_v2 = 7;
LABEL_4:
  v18 = BMSQLDatabaseError(module_v2, v16, v17);
  id v19 = v18;
  if (a7)
  {
    id v19 = v18;
    *a7 = v19;
  }
  sqlite3_close(ppDb);

LABEL_7:
  id v20 = 0;
LABEL_50:

  return v20;
}

- (void)dealloc
{
  db = self->_db;
  if (db)
  {
    sqlite3_set_authorizer(db, 0, 0);
    sqlite3_close(self->_db);
  }
  v4.receiver = self;
  v4.super_class = (Class)BMSQLDatabase;
  [(BMSQLDatabase *)&v4 dealloc];
}

- (id)virtualTableForName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_virtualTables;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "schema", (void)v14);
        id v11 = [v10 tableName];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)attachDatabase:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a5) = [(BMSQLDatabase *)self _attachDatabase:v8 name:v9 error:a5];
  os_unfair_lock_unlock(&self->_lock);

  return (char)a5;
}

- (BOOL)_attachDatabase:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_DEFAULT, "BMSQLDatabase attaching to %@ as %@", buf, 0x16u);
  }

  if ([v8 isFileURL])
  {
    id v11 = [NSString alloc];
    int v12 = [v8 path];
    id v13 = (void *)[v11 initWithFormat:@"ATTACH DATABASE \"%@\" AS \"%@\"", v12, v9];

    LOBYTE(a5) = [(BMSQLDatabase *)self executeStatement:v13 error:a5];
LABEL_7:

    goto LABEL_8;
  }
  if (a5)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithFormat:@"cannot open non file database"];
    v18 = v13;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a5 = (id)[v14 initWithDomain:@"BMSQLDatabaseErrorDomain" code:14 userInfo:v15];

    LOBYTE(a5) = 0;
    goto LABEL_7;
  }
LABEL_8:

  return (char)a5;
}

- (BOOL)attachDatabaseWithResourceIdentifier:(id)a3 useCase:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4FB98]) initWithType:3 name:v8];
  if (v11)
  {
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F4FB28]) initWithUseCase:v9];
    id v13 = [v12 requestAccessToResource:v11 mode:1 error:a5];
    id v14 = v13;
    if (v13)
    {
      long long v15 = [v13 path];

      if (v15)
      {
        id v26 = [v8 stringByAppendingPathExtension:@"sqlite3"];
        id v25 = v9;
        long long v16 = [v14 path];
        uint64_t v17 = [v16 stringByAppendingPathComponent:v26];

        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v17];
        BOOL v19 = [(BMSQLDatabase *)self _attachDatabase:v18 name:v8 error:a5];
        if (v19) {
          [(NSMutableDictionary *)self->_resourceAccessAssertions setObject:v14 forKeyedSubscript:v8];
        }

        id v9 = v25;
        goto LABEL_12;
      }
      if (a5)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v22 = (void *)[[NSString alloc] initWithFormat:@"Access assertion %@ has a nil path", v14];
        v28 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *a5 = (id)[v21 initWithDomain:@"BMSQLDatabaseErrorDomain" code:14 userInfo:v23];
      }
    }
    LOBYTE(v19) = 0;
  }
  else
  {
    if (!a5)
    {
      LOBYTE(v19) = 0;
      goto LABEL_13;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F28568];
    int v12 = (void *)[[NSString alloc] initWithFormat:@"Invalid identifier %@", v8];
    v30[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    LOBYTE(v19) = 0;
    *a5 = (id)[v20 initWithDomain:@"BMSQLDatabaseErrorDomain" code:14 userInfo:v14];
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  errmsg = 0;
  uint64_t v6 = sqlite3_exec(self->_db, (const char *)[a3 UTF8String], 0, 0, &errmsg);
  int v7 = v6;
  if (v6)
  {
    if (a4)
    {
      BMSQLDatabaseError(v6, self->_db, errmsg);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_free(errmsg);
  }
  return v7 == 0;
}

- (id)SQLSchemaString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_virtualTables, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_virtualTables;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "schema", (void)v13);
        id v10 = [v9 createTableSQL];
        [v4 addObject:v10];
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v4 componentsJoinedByString:@"\n"];

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)logColumnAccess:(id)a3 tableName:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  obuint64_t j = self->_accessedColumns;
  objc_sync_enter(obj);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_accessedColumns;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8)
  {

LABEL_13:
    long long v16 = [BMSQLColumnAccessSet alloc];
    uint64_t v17 = objc_opt_new();
    id v9 = [(BMSQLColumnAccessSet *)v16 initWithTable:v6 columns:v17];

    [(NSMutableArray *)self->_accessedColumns addObject:v9];
    goto LABEL_14;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      long long v13 = objc_msgSend(v12, "table", obj);
      int v14 = [v13 isEqual:v6];

      if (v14)
      {
        long long v15 = v12;

        id v9 = v15;
      }
    }
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v8);

  if (!v9) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = [(BMSQLColumnAccessSet *)v9 columns];
  [v18 addObject:v21];

  objc_sync_exit(obja);
}

- (void)resetColumnAccessLog
{
  obuint64_t j = self->_accessedColumns;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_accessedColumns removeAllObjects];
  objc_sync_exit(obj);
}

- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__BMSQLDatabase_registerFunctionWithName_numArgs_function_error___block_invoke;
  v13[3] = &unk_1E55D7C78;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = [(BMSQLDatabase *)self registerFunctionWithName:a3 numArgs:v7 function:v13 userData:0 error:a6];

  return (char)a6;
}

uint64_t __65__BMSQLDatabase_registerFunctionWithName_numArgs_function_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 userData:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = __biome_log_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BMSQLDatabase registerFunctionWithName:numArgs:function:userData:error:]();
  }

  long long v16 = (id *)bm_sqlite3_malloc(16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = _Block_copy(v13);
    id v19 = *v17;
    id *v17 = v18;

    objc_storeStrong(v17 + 1, a6);
    BOOL v20 = 1;
    uint64_t function_v2 = sqlite3_create_function_v2(self->_db, (const char *)[v12 UTF8String], a4, 1, v17, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))bmstream_udf_callback, 0, 0, (void (__cdecl *)(void *))bmstream_udf_destructor_callback);
    if (!function_v2) {
      goto LABEL_10;
    }
    db = self->_db;
    long long v23 = "BMSQLDatabase failed to register user-defined function";
  }
  else
  {
    db = self->_db;
    long long v23 = "Unable to alloc memory for udf_user_data";
    uint64_t function_v2 = 7;
  }
  BMSQLDatabaseError(function_v2, db, v23);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    id v24 = v24;
    *a7 = v24;
  }

  BOOL v20 = 0;
LABEL_10:

  return v20;
}

- (id)executeQuery:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];

  uint64_t v7 = [(BMSQLDatabase *)self _executeQuery:v6];

  return v7;
}

- (id)_executeQuery:(id)a3
{
  id v4 = a3;
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BMSQLDatabase _executeQuery:]();
  }

  ppStmt = 0;
  db = self->_db;
  id v7 = v4;
  uint64_t v8 = sqlite3_prepare_v2(db, (const char *)[v7 UTF8String], -1, &ppStmt, 0);
  if (v8)
  {
    id v9 = BMSQLDatabaseError(v8, self->_db, 0);
    uint64_t v10 = [[BMSQLResultSet alloc] initWithQuery:v7 error:v9 database:self];
  }
  else
  {
    id v11 = [BMSQLResultSet alloc];
    uint64_t v10 = [(BMSQLResultSet *)v11 initWithStatement:ppStmt database:self];
  }

  return v10;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_virtualTables, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_virtualTables;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) schema];
        uint64_t v10 = [v9 tableName];

        if (v10) {
          id v11 = (__CFString *)v10;
        }
        else {
          id v11 = @"<unknown>";
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v12 = [NSString alloc];
  uint64_t v13 = objc_opt_class();
  id v14 = [v3 componentsJoinedByString:@", "];
  long long v15 = (void *)[v12 initWithFormat:@"<%@ %p> tables: %@", v13, self, v14];

  if (self->_privileges)
  {
    uint64_t v16 = [v15 stringByAppendingFormat:@", privileges: %@", self->_privileges];

    long long v15 = (void *)v16;
  }

  return v15;
}

- (NSArray)privileges
{
  return self->_privileges;
}

- (BOOL)isColumnAccessLoggingEnabled
{
  return self->_isColumnAccessLoggingEnabled;
}

- (NSArray)accessedColumns
{
  return &self->_accessedColumns->super;
}

- (sqlite3)db
{
  return self->_db;
}

- (NSArray)virtualTables
{
  return self->_virtualTables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualTables, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_resourceAccessAssertions, 0);

  objc_storeStrong((id *)&self->_accessedColumns, 0);
}

- (void)initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Error initializing SQL database %@", v1, 0xCu);
}

- (void)registerFunctionWithName:numArgs:function:userData:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_10(&dword_18E67D000, v0, v1, "BMSQLDatabase registering user-defined function %@", v2, v3, v4, v5, v6);
}

- (void)_executeQuery:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_10(&dword_18E67D000, v0, v1, "BMSQLDatabase executing query %@", v2, v3, v4, v5, v6);
}

@end