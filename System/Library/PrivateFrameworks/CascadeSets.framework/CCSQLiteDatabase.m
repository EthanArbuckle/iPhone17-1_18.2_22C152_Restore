@interface CCSQLiteDatabase
- (BOOL)_prepareSqliteStatement:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5;
- (BOOL)_validateAndBindSqliteStatementParameters:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5;
- (BOOL)_validateCommand:(id)a3 outError:(id *)a4;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)executeCommandString:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (CCSQLiteDatabase)init;
- (CCSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7;
- (NSString)path;
- (id)_cachedOrPreparedStatementFromCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)enumerateCommand:(id)a3 options:(unint64_t)a4;
- (id)executeCommand:(id)a3 options:(unint64_t)a4;
- (int)dataProtectionClass;
- (int)rowsModified:(id *)a3;
- (int64_t)accessPermission;
- (int64_t)databaseOptions;
- (int64_t)threadingMode;
@end

@implementation CCSQLiteDatabase

- (id)executeCommand:(id)a3 options:(unint64_t)a4
{
  v30[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = mach_absolute_time();
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v28 = 0;
  v9 = [(CCSQLiteDatabase *)self _cachedOrPreparedStatementFromCommand:v6 options:a4 error:&v28];
  id v10 = v28;
  if (!v9)
  {
    v17 = v6;
    uint64_t v18 = v7;
    goto LABEL_13;
  }
  uint64_t v27 = v7;
  uint64_t v11 = sqlite3_column_count((sqlite3_stmt *)[v9 stmt]);
  while (1)
  {
    int v12 = sqlite3_step((sqlite3_stmt *)[v9 stmt]);
    if (v12 != 100) {
      break;
    }
    if ((int)v11 < 1)
    {
      v13 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v11];
      uint64_t v14 = 0;
      do
      {
        v15 = _columnValueFromSQLiteStatement((sqlite3_stmt *)[v9 stmt], v14);
        [v13 addObject:v15];

        uint64_t v14 = (v14 + 1);
      }
      while (v11 != v14);
    }
    [v8 addObject:v13];
  }
  int v16 = v12;
  if (v12 == 101)
  {
    sqlite3_reset((sqlite3_stmt *)[v9 stmt]);
    sqlite3_clear_bindings((sqlite3_stmt *)[v9 stmt]);
    v17 = v6;
    uint64_t v18 = v27;
LABEL_13:
    v19 = _createExecutionResult(v17, v18, v8, v10);
    goto LABEL_15;
  }

  uint64_t v20 = sqlite3_extended_errcode(self->_handle);
  _errorDescriptionForCommand();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = objc_alloc(MEMORY[0x263F087E8]);
  path = self->_path;
  v29[0] = *MEMORY[0x263F08068];
  v29[1] = @"command";
  v30[0] = path;
  v30[1] = v6;
  v29[2] = *MEMORY[0x263F08608];
  v23 = _createSQLiteAPIErrorFromResultCode(v16, v20);
  v29[3] = *MEMORY[0x263F08320];
  v30[2] = v23;
  v30[3] = v8;
  v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
  v25 = (void *)[v21 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:v24];

  v19 = _createExecutionResult(v6, v27, 0, v25);
  id v10 = v25;
LABEL_15:

  return v19;
}

- (id)_cachedOrPreparedStatementFromCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = a3;
  v24 = 0;
  v9 = 0;
  if ([(CCSQLiteDatabase *)self _validateCommand:v8 outError:a5])
  {
    if ((v6 & 2) != 0)
    {
      cachedSQLiteStatements = self->_cachedSQLiteStatements;
      uint64_t v11 = [v8 commandString];
      int v12 = [(NSMutableDictionary *)cachedSQLiteStatements objectForKey:v11];

      if (v12)
      {
        v13 = (sqlite3_stmt *)[v12 stmt];
        if (!v13 || (uint64_t v14 = v13, sqlite3_reset(v13)) || (v15 = sqlite3_clear_bindings(v14), v16 = v12, v15))
        {
          int v16 = 0;
          uint64_t v14 = 0;
        }
        v24 = v14;
      }
      else
      {
        uint64_t v14 = 0;
        int v16 = 0;
      }
      v17 = v16;

      if (v14)
      {
        uint64_t v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v17 = 0;
    }
    if (![(CCSQLiteDatabase *)self _prepareSqliteStatement:&v24 usingCommand:v8 outError:a5])
    {
      v9 = 0;
      uint64_t v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v19 = [CCSQLitePreparedStatement alloc];
    uint64_t v18 = [(CCSQLitePreparedStatement *)v19 initWithStmt:v24];
    uint64_t v14 = v24;
LABEL_15:
    if ([(CCSQLiteDatabase *)self _validateAndBindSqliteStatementParameters:v14 usingCommand:v8 outError:a5])
    {
      if ((v6 & 2) != 0 && v18)
      {
        uint64_t v20 = self->_cachedSQLiteStatements;
        id v21 = [v8 commandString];
        [(NSMutableDictionary *)v20 setObject:v18 forKey:v21];
      }
      if (v18) {
        v22 = v18;
      }
      else {
        v22 = v17;
      }
      v9 = v22;
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_25;
  }
LABEL_26:

  return v9;
}

- (BOOL)_validateAndBindSqliteStatementParameters:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = [v8 parameters];
  unint64_t v10 = [v9 count];
  int v11 = sqlite3_bind_parameter_count(a3);
  if (v11 < 0 || v11 == v10)
  {
    if (!v10)
    {
LABEL_22:
      BOOL v16 = 1;
      goto LABEL_28;
    }
    v32 = self;
    BOOL v16 = 0;
    unint64_t v17 = 0;
    while (2)
    {
      objc_msgSend(v9, "objectAtIndex:", v17++, v29);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v12, "databaseValue_type"))
      {
        case 0:
          id v18 = [v12 description];
          int v19 = sqlite3_bind_text(a3, v17, (const char *)[v18 UTF8String], -1, 0);

          uint64_t v20 = __biome_log_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v30 = [NSNumber numberWithInt:v17];
            v29 = [NSNumber numberWithInteger:0];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v12;
            __int16 v38 = 2112;
            v39 = v30;
            __int16 v40 = 2112;
            v41 = v29;
            _os_log_error_impl(&dword_249B92000, v20, OS_LOG_TYPE_ERROR, "Bind parameter: %@ with unspecified type (sqlite_parameter_index: %@, valueType: %@)", buf, 0x20u);
          }
          goto LABEL_20;
        case 1:
          *(void *)buf = 0;
          id v21 = (const void *)objc_msgSend(v12, "databaseValue_blobRepresentationWithLength:", buf);
          if (*(void *)buf) {
            int v22 = sqlite3_bind_blob64(a3, v17, v21, *(sqlite3_uint64 *)buf, 0);
          }
          else {
            int v22 = sqlite3_bind_zeroblob(a3, v17, 0);
          }
          goto LABEL_19;
        case 2:
          objc_msgSend(v12, "databaseValue_doubleRepresentation");
          int v22 = sqlite3_bind_double(a3, v17, v23);
          goto LABEL_19;
        case 3:
          int v22 = sqlite3_bind_int64(a3, v17, objc_msgSend(v12, "databaseValue_integerRepresentation"));
          goto LABEL_19;
        case 4:
          int v22 = sqlite3_bind_null(a3, v17);
          goto LABEL_19;
        case 5:
          int v22 = sqlite3_bind_text(a3, v17, (const char *)objc_msgSend(v12, "databaseValue_textRepresentation"), -1, 0);
LABEL_19:
          int v19 = v22;
LABEL_20:

          if (!v19) {
            goto LABEL_21;
          }
          if (!a5) {
            goto LABEL_27;
          }
          uint64_t v24 = sqlite3_extended_errcode(v32->_handle);
          int v15 = _errorDescriptionForCommand();
          id v31 = objc_alloc(MEMORY[0x263F087E8]);
          path = v32->_path;
          v33[0] = *MEMORY[0x263F08068];
          v33[1] = @"command";
          v34[0] = path;
          v34[1] = v8;
          v33[2] = *MEMORY[0x263F08608];
          v26 = _createSQLiteAPIErrorFromResultCode(v19, v24);
          v33[3] = *MEMORY[0x263F08320];
          v34[2] = v26;
          v34[3] = v15;
          uint64_t v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
          *a5 = (id)[v31 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:v27];

          break;
        default:

LABEL_21:
          BOOL v16 = v17 >= v10;
          if (v10 == v17) {
            goto LABEL_22;
          }
          continue;
      }
      break;
    }
  }
  else
  {
    if (!a5)
    {
      BOOL v16 = 0;
      goto LABEL_28;
    }
    _errorDescriptionForCommand();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v14 = self->_path;
    v35[0] = *MEMORY[0x263F08068];
    v35[1] = @"command";
    v36[0] = v14;
    v36[1] = v8;
    v35[2] = *MEMORY[0x263F08320];
    v36[2] = v12;
    int v15 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    BOOL v16 = 0;
    *a5 = (id)[v13 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:9 userInfo:v15];
  }

LABEL_27:
LABEL_28:

  return v16;
}

- (BOOL)_prepareSqliteStatement:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5
{
  v20[4] = *MEMORY[0x263EF8340];
  id v8 = a4;
  handle = self->_handle;
  id v10 = [v8 commandString];
  int v11 = sqlite3_prepare_v2(handle, (const char *)[v10 UTF8String], 0x80000000, a3, 0);

  if (v11)
  {
    uint64_t v12 = sqlite3_extended_errcode(self->_handle);
    if (a3) {
      sqlite3_finalize(*a3);
    }
    if (a5)
    {
      id v13 = _errorDescriptionForCommand();
      id v14 = objc_alloc(MEMORY[0x263F087E8]);
      path = self->_path;
      v19[0] = *MEMORY[0x263F08068];
      v19[1] = @"command";
      v20[0] = path;
      v20[1] = v8;
      v19[2] = *MEMORY[0x263F08608];
      BOOL v16 = _createSQLiteAPIErrorFromResultCode(v11, v12);
      v19[3] = *MEMORY[0x263F08320];
      v20[2] = v16;
      v20[3] = v13;
      unint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
      *a5 = (id)[v14 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:v17];
    }
  }

  return v11 == 0;
}

- (BOOL)_validateCommand:(id)a3 outError:(id *)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!self->_handle)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v9 = NSString;
    id v10 = _errorDescriptionForCommand();
    int v11 = [v9 stringWithFormat:@"Database is not open. %@", v10];

    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    path = self->_path;
    uint64_t v14 = *MEMORY[0x263F08320];
    v28[0] = *MEMORY[0x263F08068];
    v28[1] = v14;
    v29[0] = path;
    v29[1] = v11;
    int v15 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    BOOL v16 = v12;
    uint64_t v17 = 6;
LABEL_11:
    *a4 = (id)[v16 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:v17 userInfo:v15];

    LOBYTE(a4) = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    if (!a4) {
      goto LABEL_12;
    }
    int v11 = _errorDescriptionForCommand();
    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    int v19 = self->_path;
    uint64_t v20 = *MEMORY[0x263F08320];
    v26[0] = *MEMORY[0x263F08068];
    v26[1] = v20;
    v27[0] = v19;
    v27[1] = v11;
    int v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    BOOL v16 = v18;
    uint64_t v17 = 7;
    goto LABEL_11;
  }
  id v8 = [v6 commandString];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_12;
    }
    int v11 = _errorDescriptionForCommand();
    id v21 = objc_alloc(MEMORY[0x263F087E8]);
    int v22 = self->_path;
    v24[0] = *MEMORY[0x263F08068];
    v24[1] = @"command";
    v25[0] = v22;
    v25[1] = v7;
    v24[2] = *MEMORY[0x263F08320];
    v25[2] = v11;
    int v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    BOOL v16 = v21;
    uint64_t v17 = 8;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (id)enumerateCommand:(id)a3 options:(unint64_t)a4
{
  id v11 = 0;
  id v6 = a3;
  uint64_t v7 = [(CCSQLiteDatabase *)self _cachedOrPreparedStatementFromCommand:v6 options:a4 error:&v11];
  id v8 = v11;
  v9 = [[CCDatabaseEnumerationResult alloc] initWithStatement:v7 database:self command:v6 error:v8];

  return v9;
}

- (BOOL)closeWithError:(id *)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  if (!self->_handle) {
    return 1;
  }
  [(NSMutableDictionary *)self->_cachedSQLiteStatements removeAllObjects];
  int v5 = sqlite3_close_v2(self->_handle);
  BOOL v6 = v5 == 0;
  if (v5)
  {
    int v7 = v5;
    uint64_t v8 = sqlite3_extended_errcode(self->_handle);
    v9 = [NSString stringWithFormat:@"Failed to close database at path: %@", self->_path];
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08068];
    v18[0] = self->_path;
    uint64_t v12 = *MEMORY[0x263F08608];
    v17[0] = v11;
    v17[1] = v12;
    id v13 = _createSQLiteAPIErrorFromResultCode(v7, v8);
    v17[2] = *MEMORY[0x263F08320];
    v18[1] = v13;
    v18[2] = v9;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    int v15 = [v10 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:v14];
    CCSetAndReportError(a3, v15);
  }
  self->_handle = 0;
  return v6;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return [(CCSQLiteDatabase *)self executeCommandString:@"COMMIT TRANSACTION" error:a3];
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return [(CCSQLiteDatabase *)self executeCommandString:@"BEGIN TRANSACTION" error:a3];
}

- (BOOL)openWithError:(id *)a3
{
  v78[1] = *MEMORY[0x263EF8340];
  p_handle = &self->_handle;
  if (self->_handle)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CCSQLiteDatabase openWithError:](v4);
    }
    goto LABEL_4;
  }
  uint64_t v8 = [NSString stringWithFormat:@"Failed to open database at path: %@", self->_path];
  v4 = v8;
  if (!self->_path)
  {
    BOOL v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v77 = *MEMORY[0x263F08320];
    v78[0] = v8;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v78 forKeys:&v77 count:1];
    id v18 = [v16 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:3 userInfo:v17];
    CCSetAndReportError(a3, v18);

LABEL_39:
    goto LABEL_40;
  }
  char v66 = 0;
  v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:self->_path isDirectory:&v66];

  if (!v10)
  {
    uint64_t v17 = [(NSString *)self->_path stringByDeletingLastPathComponent];
    int v19 = [MEMORY[0x263F08850] defaultManager];
    int v20 = [v19 fileExistsAtPath:v17 isDirectory:&v66];

    if (v20)
    {
      if (!v66)
      {
        id v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v22 = *MEMORY[0x263F08320];
        v73[0] = *MEMORY[0x263F08068];
        v73[1] = v22;
        v74[0] = v17;
        v74[1] = v4;
        id v23 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
        uint64_t v24 = [v21 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:5 userInfo:v23];
        CCSetAndReportError(a3, v24);
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      v25 = [MEMORY[0x263F08850] defaultManager];
      id v65 = 0;
      char v26 = [v25 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v65];
      id v23 = v65;

      if ((v26 & 1) == 0)
      {
        v52 = (void *)MEMORY[0x263F087E8];
        uint64_t v53 = *MEMORY[0x263F08068];
        v72[0] = self->_path;
        uint64_t v54 = *MEMORY[0x263F08608];
        v71[0] = v53;
        v71[1] = v54;
        uint64_t v24 = _NSNullIfNilObject(v23);
        v71[2] = *MEMORY[0x263F08320];
        v72[1] = v24;
        v72[2] = v4;
        v55 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
        v56 = [v52 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:1 userInfo:v55];
        CCSetAndReportError(a3, v56);

        goto LABEL_38;
      }
    }
    goto LABEL_16;
  }
  if (v66)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    path = self->_path;
    uint64_t v13 = *MEMORY[0x263F08320];
    v75[0] = *MEMORY[0x263F08068];
    v75[1] = v13;
    v76[0] = path;
    v76[1] = v4;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
    int v15 = [v11 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:4 userInfo:v14];
    CCSetAndReportError(a3, v15);

LABEL_40:
    BOOL v5 = 0;
    goto LABEL_41;
  }
LABEL_16:
  unint64_t v27 = self->_accessPermission - 1;
  if (v27 > 2) {
    int v28 = 0;
  }
  else {
    int v28 = dword_249BE08B0[v27];
  }
  int64_t threadingMode = self->_threadingMode;
  if (threadingMode == 3) {
    int v30 = 0x10000;
  }
  else {
    int v30 = (threadingMode == 2) << 15;
  }
  int v31 = v30 | v28;
  int v32 = self->_dataProtectionClass - 1;
  if (v32 > 5) {
    int v33 = 0;
  }
  else {
    int v33 = dword_249BE08BC[v32];
  }
  int v34 = sqlite3_open_v2([(NSString *)self->_path fileSystemRepresentation], p_handle, v31 | v33, 0);
  if (v34)
  {
    int v35 = v34;
    uint64_t v36 = sqlite3_extended_errcode(self->_handle);
    v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08068];
    v70[0] = self->_path;
    uint64_t v39 = *MEMORY[0x263F08608];
    v69[0] = v38;
    v69[1] = v39;
    __int16 v40 = _createSQLiteAPIErrorFromResultCode(v35, v36);
    v69[2] = *MEMORY[0x263F08320];
    v70[1] = v40;
    v70[2] = v4;
    v41 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];
    uint64_t v42 = [v37 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:v41];
    CCSetAndReportError(a3, v42);

    BOOL v5 = 0;
    self->_handle = 0;
    goto LABEL_41;
  }
  if ((v10 & 1) == 0)
  {
    if ((self->_databaseOptions & 2) != 0)
    {
      uint64_t v43 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = sqlite3_extended_errcode(*p_handle);
        v46 = __biome_log_for_category();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          [(CCSQLiteDatabase *)v44 openWithError:v46];
        }
      }
    }
    if ((self->_accessPermission & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v47 = [NSURL fileURLWithPath:self->_path];
      v48 = [NSNumber numberWithInt:self->_databaseOptions & 1];
      uint64_t v49 = *MEMORY[0x263EFF6B0];
      id v64 = 0;
      char v50 = [v47 setResourceValue:v48 forKey:v49 error:&v64];
      id v51 = v64;

      if ((v50 & 1) == 0)
      {
        v58 = (void *)MEMORY[0x263F087E8];
        uint64_t v59 = *MEMORY[0x263F08068];
        v68[0] = self->_path;
        uint64_t v60 = *MEMORY[0x263F08608];
        v67[0] = v59;
        v67[1] = v60;
        v61 = _NSNullIfNilObject(v51);
        v67[2] = *MEMORY[0x263F08320];
        v68[1] = v61;
        v68[2] = v4;
        v62 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
        v63 = [v58 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:1 userInfo:v62];
        CCSetAndReportError(a3, v63);

        sqlite3_close_v2(self->_handle);
        self->_handle = 0;

        goto LABEL_40;
      }
    }
  }
  [(NSMutableDictionary *)self->_cachedSQLiteStatements removeAllObjects];
LABEL_4:
  BOOL v5 = 1;
LABEL_41:

  return v5;
}

- (BOOL)executeCommandString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [[CCDatabaseCommand alloc] initWithCommandString:v6 parameters:0];

  LOBYTE(a4) = [(CCSQLiteDatabase *)self executeCommand:v7 options:0 error:a4];
  return (char)a4;
}

- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6 = [(CCSQLiteDatabase *)self executeCommand:a3 options:a4];
  int v7 = [v6 error];
  if (v7) {
    CCSetAndReportError(a5, v7);
  }

  return v7 == 0;
}

- (CCSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7
{
  id v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CCSQLiteDatabase;
  uint64_t v13 = [(CCSQLiteDatabase *)&v22 init];
  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v14 = [v12 stringByStandardizingPath];
  uint64_t v15 = [v14 copy];
  path = v13->_path;
  v13->_path = (NSString *)v15;

  if ([(NSString *)v13->_path length])
  {
    v13->_accessPermission = a4;
    v13->_int64_t threadingMode = a5;
    v13->_dataProtectionClass = a6;
    v13->_databaseOptions = a7;
    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedSQLiteStatements = v13->_cachedSQLiteStatements;
    v13->_cachedSQLiteStatements = v17;

LABEL_4:
    int v19 = v13;
    goto LABEL_8;
  }
  int v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CCSQLiteDatabase initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:](v20);
  }

  int v19 = 0;
LABEL_8:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_cachedSQLiteStatements, 0);
}

- (CCSQLiteDatabase)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (BOOL)cleanup:(id *)a3
{
  return [(CCSQLiteDatabase *)self executeCommandString:@"VACUUM" error:a3];
}

- (int)rowsModified:(id *)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  handle = self->_handle;
  if (handle)
  {
    return sqlite3_changes(handle);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = @"Invalid sqlite handle.";
    int v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = (void *)[v6 initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:6 userInfo:v7];

    CCSetError(a3, v8);
    return -1;
  }
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return [(CCSQLiteDatabase *)self executeCommandString:@"ROLLBACK TRANSACTION" error:a3];
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)accessPermission
{
  return self->_accessPermission;
}

- (int64_t)threadingMode
{
  return self->_threadingMode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (int64_t)databaseOptions
{
  return self->_databaseOptions;
}

- (void)initWithPath:(os_log_t)log accessPermission:threadingMode:dataProtectionClass:databaseOptions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Cannot create CCSQLiteDatabase with nil path", v1, 2u);
}

- (void)openWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = [NSNumber numberWithInt:a1];
  id v6 = [NSNumber numberWithInt:a2];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl(&dword_249B92000, a3, OS_LOG_TYPE_ERROR, "Failed to enable WAL journal_mode with errorCode: %@, extendedCode: %@", (uint8_t *)&v7, 0x16u);
}

- (void)openWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_249B92000, log, OS_LOG_TYPE_DEBUG, "Try to open a valid SQLite database handle, skipping open.", v1, 2u);
}

@end