@interface BRCPQLConnection
- (BOOL)_registerStaticDBFunctionsWithError:(id *)a3;
- (BOOL)_shouldFlushWithChangeCount:(int)a3;
- (BOOL)_validateIsRunningWithCorrectPersona;
- (BOOL)attachDBAtPath:(id)a3 as:(id)a4 error:(id *)a5;
- (BOOL)brc_closeWithError:(id *)a3;
- (BOOL)execute:(id)a3;
- (BOOL)execute:(id)a3 args:(char *)a4;
- (BOOL)executeRaw:(id)a3;
- (BOOL)executeWithErrorHandler:(id)a3 sql:(id)a4;
- (BOOL)executeWithExpectedIndex:(id)a3 sql:(id)a4;
- (BOOL)executeWithSlowStatementRadar:(id)a3 sql:(id)a4;
- (BOOL)isReadonly;
- (BOOL)needsAutovacuum;
- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5;
- (BOOL)profilingEnabled;
- (BOOL)verboseProfilingEnabled;
- (BRCPQLConnection)init;
- (BRCPQLConnection)initWithLabel:(id)a3 dbCorruptionHandler:(id)a4;
- (NSString)assertionPersonaIdentifier;
- (id)fetch:(id)a3;
- (id)fetch:(id)a3 args:(char *)a4;
- (id)fetchObject:(id)a3 sql:(id)a4;
- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchWithSlowStatementRadar:(id)a3 objectOfClass:(Class)a4 sql:(id)a5;
- (id)fetchWithSlowStatementRadar:(id)a3 objectWithConstructor:(id)a4 sql:(id)a5;
- (id)fetchWithSlowStatementRadar:(id)a3 sql:(id)a4;
- (int64_t)changes;
- (int64_t)sizeInBytes;
- (unint64_t)vmStepsExecuted;
- (void)_setErrorHandlerWithDBCorruptionHandler:(id)a3;
- (void)_setLockedHandler;
- (void)_validateIsRunningWithCorrectPersona;
- (void)assertOnQueue;
- (void)autovacuumIfNeeded;
- (void)brc_close;
- (void)disableProfilingForQueriesInBlock:(id)a3;
- (void)flushToMakeEditsVisibleToIPCReaders;
- (void)scheduleFlushWithCheckpoint:(BOOL)a3 whenFlushed:(id)a4;
- (void)setAssertionPersonaIdentifier:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setProfilingHook:(id)a3;
- (void)setVerboseProfilingEnabled:(BOOL)a3;
- (void)usePacedBatchingOnTargetQueue:(id)a3 withInterval:(double)a4 changeCount:(int)a5;
@end

@implementation BRCPQLConnection

- (BRCPQLConnection)init
{
  return [(BRCPQLConnection *)self initWithLabel:0 dbCorruptionHandler:0];
}

- (BRCPQLConnection)initWithLabel:(id)a3 dbCorruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCPQLConnection;
  v8 = [(BRCPQLConnection *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(BRCPQLConnection *)v8 _setErrorHandlerWithDBCorruptionHandler:v7];
    [(BRCPQLConnection *)v9 _setLockedHandler];
    [(BRCPQLConnection *)v9 setLabel:v6];
    v10 = +[BRCUserDefaults defaultsForMangledID:0];
    -[BRCPQLConnection setTraced:](v9, "setTraced:", [v10 dbTraced]);

    [(BRCPQLConnection *)v9 setCrashIfUsedAfterClose:1];
  }

  return v9;
}

- (void)_setErrorHandlerWithDBCorruptionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke;
  v6[3] = &unk_1E6993B50;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(BRCPQLConnection *)self setSqliteErrorHandler:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)v21 = 138413058;
      *(void *)&v21[4] = v8;
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v7;
      *(_WORD *)&v21[22] = 2112;
      id v22 = v9;
      LOWORD(v23) = 2112;
      *(void *)((char *)&v23 + 2) = v10;
      objc_super v12 = "[ERROR] Sqlite request %@ failed on %@ with error [%@]%@";
      v13 = v11;
      uint32_t v14 = 42;
LABEL_15:
      _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, v12, v21, v14);
    }
  }
  else
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)v21 = 138412802;
      *(void *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v9;
      *(_WORD *)&v21[22] = 2112;
      id v22 = v10;
      objc_super v12 = "[ERROR] Sqlite failed on %@ with error [%@]%@";
      v13 = v11;
      uint32_t v14 = 32;
      goto LABEL_15;
    }
  }

  unint64_t v15 = [v9 code];
  if (v15 <= 0x15 && ((1 << v15) & 0x380002) != 0)
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_cold_1();
    }
  }
  unsigned int v18 = objc_msgSend(v9, "code", *(_OWORD *)v21, *(void *)&v21[16], v22, v23);
  if (v18 <= 0x1A && ((1 << v18) & 0x5000800) != 0)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id, id, void *))(v19 + 16))(v19, WeakRetained, v9, &__block_literal_global_1);
  }
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"Sqlite database became corrupted, abort..."];
  objc_claimAutoreleasedReturnValue();
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    v2 = brc_append_system_info_to_message();
    int v4 = 138412546;
    id v5 = v2;
    __int16 v6 = 2112;
    id v7 = v0;
    _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);
  }
  brc_append_system_info_to_message();
  v3 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCPQLConnection _setErrorHandlerWithDBCorruptionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 100, v3);
}

- (void)_setLockedHandler
{
}

uint64_t __37__BRCPQLConnection__setLockedHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  [v6 currentOperationDuration];
  double v10 = v9;
  if (v9 >= 60.0)
  {
    if (v7)
    {
      v16 = [NSString stringWithFormat:@"(on statement %@)", v7];
    }
    else
    {
      v16 = &stru_1F2AC7720;
    }
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"%@ locked for more than 1 minute %@, aborting...", v6, v16];
    objc_claimAutoreleasedReturnValue();
    v17 = brc_bread_crumbs();
    unsigned int v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2();
    }

    brc_append_system_info_to_message();
    uint64_t v19 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCPQLConnection _setLockedHandler]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 118, v19);
  }
  v11 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ has been locked for %f seconds: %@", v6, *(void *)&v9, v8];
  objc_super v12 = v11;
  if (v7) {
    [v11 appendFormat:@" (for statement %@)", v7];
  }
  if (v10 >= 30.0)
  {
    v13 = brc_bread_crumbs();
    uint32_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_1();
    }
  }
  else
  {
    v13 = brc_bread_crumbs();
    uint32_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] %@%@", buf, 0x16u);
    }
  }

  usleep(0x2710u);
  return 1;
}

- (BOOL)_registerStaticDBFunctionsWithError:(id *)a3
{
  id v25 = 0;
  BOOL v5 = [(PQLConnection *)self registerFunction:@"fetch_and_inc64" nArgs:1 handler:&__block_literal_global_30 error:&v25];
  id v6 = v25;
  id v7 = v6;
  if (!v5) {
    goto LABEL_15;
  }
  id v24 = v6;
  BOOL v8 = [(PQLConnection *)self registerFunction:@"inc_and_fetch64" nArgs:1 handler:&__block_literal_global_35 error:&v24];
  id v9 = v24;

  if (!v8) {
    goto LABEL_14;
  }
  id v23 = v9;
  BOOL v10 = [(PQLConnection *)self registerFunction:@"fetch_and_dec64" nArgs:1 handler:&__block_literal_global_40 error:&v23];
  id v7 = v23;

  if (v10)
  {
    id v22 = v7;
    BOOL v11 = [(PQLConnection *)self registerFunction:@"dec_and_fetch64" nArgs:1 handler:&__block_literal_global_45 error:&v22];
    id v9 = v22;

    if (!v11)
    {
LABEL_14:
      id v7 = v9;
      goto LABEL_15;
    }
    id v21 = v9;
    BOOL v12 = [(PQLConnection *)self registerFunction:@"call_block" nArgs:0xFFFFFFFFLL handler:&__block_literal_global_50 error:&v21];
    id v7 = v21;

    if (v12)
    {
      id v20 = v7;
      BOOL v13 = [(PQLConnection *)self registerFunction:@"indexset_contains" nArgs:2 handler:&__block_literal_global_56 error:&v20];
      id v9 = v20;

      if (v13
        && -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", @"item_id_is_root", 1, &__block_literal_global_63)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", @"item_id_is_documents", 1, &__block_literal_global_70)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", @"item_id_is_app_library_root", 1, &__block_literal_global_76)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self,
                           "registerFunction:nArgs:handler:",
                           @"item_id_is_shared_root",
                           1,
                           &__block_literal_global_82)
        && [(BRCPQLConnection *)self registerFunction:@"app_library_rowid_from_root_or_documents" nArgs:1 handler:&__block_literal_global_88])
      {
        id v19 = v9;
        BOOL v14 = 1;
        BOOL v15 = [(PQLConnection *)self registerFunction:@"validation_key" nArgs:1 handler:&__block_literal_global_93 error:&v19];
        id v7 = v19;

        if (v15) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  v16 = brc_bread_crumbs();
  v17 = brc_default_log();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
    -[BRCPQLConnection _registerStaticDBFunctionsWithError:]();
  }

  if (a3)
  {
    id v7 = v7;
    BOOL v14 = 0;
    *a3 = v7;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_20:

  return v14;
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke(uint64_t a1, sqlite3_context *a2)
{
  v3 = (void *)pql_sqlite3_value_pointer();
  if (v3)
  {
    sqlite3_int64 v4 = (*v3)++;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_2(uint64_t a1, sqlite3_context *a2)
{
  v3 = (void *)pql_sqlite3_value_pointer();
  if (v3)
  {
    sqlite3_int64 v4 = *v3 + 1;
    void *v3 = v4;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_3(uint64_t a1, sqlite3_context *a2)
{
  v3 = (void *)pql_sqlite3_value_pointer();
  if (v3)
  {
    sqlite3_int64 v4 = (*v3)--;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_4(uint64_t a1, sqlite3_context *a2)
{
  v3 = (void *)pql_sqlite3_value_pointer();
  if (v3)
  {
    sqlite3_int64 v4 = *v3 - 1;
    void *v3 = v4;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 <= 0)
  {
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_cold_1();
    }
  }
  pql_sqlite3_value_object();
  id v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  v7[2](v7, a2, (a3 - 1), a4 + 8);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_54(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  id v6 = pql_sqlite3_value_object();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_54_cold_1();
      }
    }
  }
  if (sqlite3_value_type(*a4) == 1) {
    int v7 = [v6 containsIndex:sqlite3_value_int64(a4[1])];
  }
  else {
    int v7 = 0;
  }
  sqlite3_result_int(a2, v7);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_61(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID isRootItemIDWithSQLiteValue:*a4];
  sqlite3_result_int(a2, v5);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_2_68(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID isDocumentsItemIDWithSQLiteValue:*a4];
  sqlite3_result_int(a2, v5);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_3_74(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID isAppLibraryRootItemIDWithSQLiteValue:*a4];
  sqlite3_result_int(a2, v5);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_4_80(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID isSharedZoneRootItemIDWithSQLiteValue:*a4];
  sqlite3_result_int(a2, v5);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_86(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID appLibraryRowIDFromRootOrDocumentsSQLiteValue:*a4];
  id v6 = v5;
  if (v5) {
    sqlite3_result_int64(a2, [v5 unsignedLongLongValue]);
  }
  else {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6(uint64_t a1, sqlite3_context *a2, int a3, void *a4)
{
  if (a3 != 1)
  {
    BOOL v10 = brc_bread_crumbs();
    BOOL v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6_cold_1();
    }
  }
  id v6 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteValue:*a4];
  int v7 = objc_msgSend(v6, "brc_truncatedSHA256");
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sqlite3_result_blob(a2, (const void *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  char v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BRCPQLConnection;
  BOOL v8 = -[BRCPQLConnection openAtURL:withFlags:error:](&v10, sel_openAtURL_withFlags_error_, a3);
  if (v8)
  {
    self->_isReadonly = v6 & 1;
    if (v6 & 1) != 0 || ([(BRCPQLConnection *)self setupPragmas])
    {
      if ([(BRCPQLConnection *)self _registerStaticDBFunctionsWithError:a5])
      {
        LOBYTE(v8) = 1;
        return v8;
      }
    }
    else if (a5)
    {
      *a5 = [(BRCPQLConnection *)self lastError];
    }
    [(BRCPQLConnection *)self brc_close];
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)profilingEnabled
{
  v2 = [(BRCPQLConnection *)self profilingHook];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)changes
{
  int64_t result = self->_changesOverride;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCPQLConnection;
    return [(BRCPQLConnection *)&v4 changes];
  }
  return result;
}

- (void)setProfilingEnabled:(BOOL)a3
{
  if (a3)
  {
    LOBYTE(v6) = self->_verboseProfilingEnabled;
    -[BRCPQLConnection setProfilingHook:](&v4, sel_setProfilingHook_, v5, v3.receiver, v3.super_class, self, BRCPQLConnection, MEMORY[0x1E4F143A8], 3221225472, __40__BRCPQLConnection_setProfilingEnabled___block_invoke, &unk_1E6993BB8, self, v6);
  }
  else
  {
    self->_changesOverride = 0;
    -[BRCPQLConnection setProfilingHook:](&v3, sel_setProfilingHook_, &__block_literal_global_111, self, BRCPQLConnection, v4.receiver, v4.super_class, v5[0], v5[1], v5[2], v5[3], v5[4], v6);
  }
}

void __40__BRCPQLConnection_setProfilingEnabled___block_invoke(uint64_t a1, void *a2, sqlite3_stmt *a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v7 = a2;
  int v8 = sqlite3_column_count(a3);
  int v9 = sqlite3_bind_parameter_count(a3);
  unsigned int v10 = sqlite3_stmt_status(a3, 4, 0);
  BOOL v11 = sqlite3_sql(a3);
  if (strncmp(v11, "explain query plan", 0x12uLL))
  {
    v7[38] += v10;
    *(void *)(*(void *)(a1 + 32) + 288) = 0;
    if (v8)
    {
      unint64_t v12 = (8 * v9 + 4 * v8) + (8 * v9 + 4 * v8) * a4 + 150;
      if (*(unsigned char *)(a1 + 40) || v12 < v10)
      {
        v26 = brc_bread_crumbs();
        BOOL v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          if (*(unsigned char *)(a1 + 40)) {
            BOOL v14 = "Verbose statement profile on";
          }
          else {
            BOOL v14 = "Possible slow statement on";
          }
          queryPlanForSQL(v11, v7);
          *(_DWORD *)buf = 136317442;
          *(void *)v29 = v14;
          *(_WORD *)&v29[8] = 2112;
          *(void *)&v29[10] = v7;
          *(_WORD *)&v29[18] = 1024;
          *(_DWORD *)&v29[20] = v9;
          __int16 v30 = 1024;
          *(_DWORD *)v31 = v8;
          *(_WORD *)&v31[4] = 2048;
          *(void *)&v31[6] = a4;
          __int16 v32 = 1024;
          *(_DWORD *)v33 = v10;
          *(_WORD *)&v33[4] = 2048;
          *(void *)&v33[6] = (8 * v9 + 4 * v8) + (8 * v9 + 4 * v8) * a4 + 150;
          *(_WORD *)&v33[14] = 2080;
          *(void *)&v33[16] = v11;
          BOOL v15 = *(_WORD *)&v33[24] = 2112;
          *(void *)&v33[26] = v15;
          *(_WORD *)&v33[34] = 2112;
          *(void *)&v33[36] = v26;
          _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %s %@:\n  binds:    %d\n  columns:  %d\n  rows:     %ld\n  vm steps: %d (max: %lu)\n  sql:      %s\n  %@%@", buf, 0x5Au);
        }
      }
    }
    else
    {
      uint64_t v16 = [v7 changes];
      unint64_t v12 = v16 * (8 * v9 + 175) + 175;
      if (*(unsigned char *)(a1 + 40) || v12 < v10)
      {
        v27 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          if (*(unsigned char *)(a1 + 40)) {
            unsigned int v18 = "Verbose statement profile on";
          }
          else {
            unsigned int v18 = "Possible slow statement on";
          }
          id v25 = v18;
          queryPlanForSQL(v11, v7);
          *(_DWORD *)buf = 136317186;
          *(void *)v29 = v25;
          *(_WORD *)&v29[8] = 2112;
          *(void *)&v29[10] = v7;
          *(_WORD *)&v29[18] = 1024;
          *(_DWORD *)&v29[20] = v9;
          __int16 v30 = 2048;
          *(void *)v31 = v16;
          *(_WORD *)&v31[8] = 1024;
          *(_DWORD *)&v31[10] = v10;
          __int16 v32 = 2048;
          *(void *)v33 = v16 * (8 * v9 + 175) + 175;
          *(_WORD *)&v33[8] = 2080;
          *(void *)&v33[10] = v11;
          id v19 = *(_WORD *)&v33[18] = 2112;
          *(void *)&v33[20] = v19;
          *(_WORD *)&v33[28] = 2112;
          *(void *)&v33[30] = v27;
          _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %s %@:\n  binds:    %d\n  changes:  %lld\n  vm steps: %d (max: %lu)\n  sql:      %s\n  %@%@", buf, 0x54u);
        }
        *(void *)(*(void *)(a1 + 32) + 288) = v16;
      }
    }
    if (10 * v12 < v10)
    {
      id v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v29 = v10;
        *(_WORD *)&v29[4] = 2048;
        *(void *)&v29[6] = v12;
        *(_WORD *)&v29[14] = 2080;
        *(void *)&v29[16] = v11;
        __int16 v30 = 2112;
        *(void *)v31 = v20;
        _os_log_fault_impl(&dword_1D353B000, v21, OS_LOG_TYPE_FAULT, "[CRIT] Significantly too slow SQL statement(vm steps: %u  max:%lu): %s%@", buf, 0x26u);
      }

      if (v11) {
        id v22 = v11;
      }
      else {
        id v22 = "(null)";
      }
      id v23 = objc_msgSend(NSString, "stringWithUTF8String:", v22, v25);
      id v24 = [@"Significantly too slow SQL statement: " stringByAppendingString:v23];
      abc_report_assert_with_signature();
    }
  }
}

void __40__BRCPQLConnection_setProfilingEnabled___block_invoke_109(uint64_t a1, void *a2, sqlite3_stmt *a3)
{
  objc_super v4 = a2;
  v4[38] += sqlite3_stmt_status(a3, 4, 0);
}

- (BOOL)attachDBAtPath:(id)a3 as:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = (void *)[[v8 alloc] initWithFormat:@"ATTACH \"%@\" AS %@", v10, v9];

  BOOL v12 = [(BRCPQLConnection *)self executeRaw:v11];
  if (!v12)
  {
    BOOL v13 = [(BRCPQLConnection *)self lastError];
    if (v13)
    {
      BOOL v14 = brc_bread_crumbs();
      BOOL v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v19 = "-[BRCPQLConnection attachDBAtPath:as:error:]";
        __int16 v20 = 2080;
        if (!a5) {
          v17 = "(ignored by caller)";
        }
        id v21 = v17;
        __int16 v22 = 2112;
        id v23 = v13;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v13;
    }
  }
  return v12;
}

- (void)flushToMakeEditsVisibleToIPCReaders
{
  if ([(BRCPQLConnection *)self isInTransaction])
  {
    self->_flushImmediately = 1;
    [(BRCPQLConnection *)self forceBatchStart];
  }
  else
  {
    [(BRCPQLConnection *)self flush];
  }
}

- (void)scheduleFlushWithCheckpoint:(BOOL)a3 whenFlushed:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke;
  v10[3] = &unk_1E6993C00;
  v10[4] = self;
  BOOL v11 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke_2;
  v8[3] = &unk_1E6993C28;
  id v9 = v6;
  id v7 = v6;
  [(BRCPQLConnection *)self performWithFlags:4 action:v10 whenFlushed:v8];
}

uint64_t __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "br_makeNextFlushCheckpoint");
  }
  return 1;
}

uint64_t __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setProfilingHook:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"setting profiling hook is not supported on %@", objc_opt_class()];
  objc_claimAutoreleasedReturnValue();
  objc_super v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    id v6 = brc_append_system_info_to_message();
    *(_DWORD *)buf = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    BOOL v11 = v4;
    _os_log_fault_impl(&dword_1D353B000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);
  }
  brc_append_system_info_to_message();
  id v7 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCPQLConnection setProfilingHook:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 392, v7);
}

- (id)fetchWithSlowStatementRadar:(id)a3 sql:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BRCPQLConnection *)self assertOnQueue];
  v17 = 0;
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v9 = brc_bread_crumbs();
    __int16 v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:]();
    }
  }
  v17 = &v18;
  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  BOOL v11 = [(BRCPQLConnection *)&v16 profilingHook];
  v15.receiver = self;
  v15.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v15 setProfilingHook:0];
  id v12 = [(BRCPQLConnection *)self fetch:v6 args:v17];

  v14.receiver = self;
  v14.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v14 setProfilingHook:v11];

  return v12;
}

- (id)fetchWithSlowStatementRadar:(id)a3 objectOfClass:(Class)a4 sql:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(BRCPQLConnection *)self assertOnQueue];
  id v19 = 0;
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    BOOL v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:]();
    }
  }
  id v19 = &v20;
  v18.receiver = self;
  v18.super_class = (Class)BRCPQLConnection;
  BOOL v13 = [(BRCPQLConnection *)&v18 profilingHook];
  v17.receiver = self;
  v17.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v17 setProfilingHook:0];
  id v14 = [(BRCPQLConnection *)self fetchObjectOfClass:a4 sql:v8 args:v19];

  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v16 setProfilingHook:v13];

  return v14;
}

- (id)fetchWithSlowStatementRadar:(id)a3 objectWithConstructor:(id)a4 sql:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(BRCPQLConnection *)self assertOnQueue];
  uint64_t v20 = 0;
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    id v12 = brc_bread_crumbs();
    BOOL v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:]();
    }
  }
  uint64_t v20 = &v21;
  v19.receiver = self;
  v19.super_class = (Class)BRCPQLConnection;
  id v14 = [(BRCPQLConnection *)&v19 profilingHook];
  v18.receiver = self;
  v18.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v18 setProfilingHook:0];
  id v15 = [(BRCPQLConnection *)self fetchObject:v9 sql:v8 args:v20];

  v17.receiver = self;
  v17.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v17 setProfilingHook:v14];

  return v15;
}

- (BOOL)executeWithExpectedIndex:(id)a3 sql:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BRCPQLConnection *)self assertOnQueue];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection executeWithExpectedIndex:sql:]();
    }
  }
  BOOL v11 = [(BRCPQLConnection *)self execute:v6 args:&v13];

  return v11;
}

- (BOOL)executeWithSlowStatementRadar:(id)a3 sql:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BRCPQLConnection *)self assertOnQueue];
  objc_super v17 = 0;
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:]();
    }
  }
  objc_super v17 = &v18;
  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  BOOL v11 = [(BRCPQLConnection *)&v16 profilingHook];
  v15.receiver = self;
  v15.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v15 setProfilingHook:0];
  BOOL v12 = [(BRCPQLConnection *)self execute:v6 args:v17];

  v14.receiver = self;
  v14.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v14 setProfilingHook:v11];

  return v12;
}

- (BOOL)executeWithErrorHandler:(id)a3 sql:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self assertOnQueue];
  objc_super v14 = &v15;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCPQLConnection;
    uint64_t v8 = [(BRCPQLConnection *)&v13 sqliteErrorHandler];
    v12.receiver = self;
    v12.super_class = (Class)BRCPQLConnection;
    [(BRCPQLConnection *)&v12 setSqliteErrorHandler:v6];
    BOOL v9 = [(BRCPQLConnection *)self execute:v7 args:v14];
    v11.receiver = self;
    v11.super_class = (Class)BRCPQLConnection;
    [(BRCPQLConnection *)&v11 setSqliteErrorHandler:v8];
  }
  else
  {
    BOOL v9 = [(BRCPQLConnection *)self execute:v7 args:v14];
  }

  return v9;
}

- (void)disableProfilingForQueriesInBlock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  [(BRCPQLConnection *)self assertOnQueue];
  if (!v4)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCPQLConnection disableProfilingForQueriesInBlock:]();
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCPQLConnection;
  int v5 = [(BRCPQLConnection *)&v10 profilingHook];
  v9.receiver = self;
  v9.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v9 setProfilingHook:0];
  v4[2](v4);

  v8.receiver = self;
  v8.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v8 setProfilingHook:v5];
}

- (BOOL)_shouldFlushWithChangeCount:(int)a3
{
  [(BRCPQLConnection *)self assertOnQueue];
  if (a3 == -2)
  {
    if (!self->_batchingPacer)
    {
      id v6 = [(BRCPQLConnection *)self serialQueue];
      br_pacer_create();
      id v7 = (br_pacer *)objc_claimAutoreleasedReturnValue();
      batchingPacer = self->_batchingPacer;
      self->_batchingPacer = v7;

      objc_initWeak(&location, self);
      objc_copyWeak(&v14, &location);
      br_pacer_set_event_handler();
      br_pacer_resume();
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    br_pacer_signal_at_most_after_min_interval();
  }
  else if (a3 == -1)
  {
    int v5 = self->_batchingPacer;
    if (!v5) {
      return (char)v5;
    }
    br_pacer_pretend_event_handler_fired();
  }
  else
  {
    int changeCount = self->_changeCount;
    if (changeCount) {
      BOOL v10 = changeCount <= a3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10 || self->_flushImmediately)
    {
      self->_flushImmediately = 0;
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    if (!self->_batchingPacer)
    {
      objc_super v11 = brc_bread_crumbs();
      objc_super v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCPQLConnection _shouldFlushWithChangeCount:]();
      }
    }
    br_pacer_signal();
  }
  LOBYTE(v5) = 0;
  return (char)v5;
}

void __48__BRCPQLConnection__shouldFlushWithChangeCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[280] = 0;
    v2 = WeakRetained;
    [WeakRetained flush];
    id WeakRetained = v2;
  }
}

- (void)usePacedBatchingOnTargetQueue:(id)a3 withInterval:(double)a4 changeCount:(int)a5
{
  self->_int changeCount = a5;
  self->_flushInterval = a4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__BRCPQLConnection_usePacedBatchingOnTargetQueue_withInterval_changeCount___block_invoke;
  v5[3] = &unk_1E6993C78;
  v5[4] = self;
  [(BRCPQLConnection *)self useBatchingOnTargetQueue:a3 withPolicyHandler:v5];
}

uint64_t __75__BRCPQLConnection_usePacedBatchingOnTargetQueue_withInterval_changeCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldFlushWithChangeCount:");
}

- (BOOL)brc_closeWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_batchingPacer)
  {
    br_pacer_cancel();
    batchingPacer = self->_batchingPacer;
    self->_batchingPacer = 0;
  }
  id v11 = 0;
  char v6 = [(BRCPQLConnection *)self close:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    objc_super v8 = brc_bread_crumbs();
    objc_super v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      objc_super v13 = self;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      objc_super v17 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] error closing connection %@: %@%@", buf, 0x20u);
    }
  }
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (void)brc_close
{
  id v9 = 0;
  BOOL v3 = [(BRCPQLConnection *)self brc_closeWithError:&v9];
  id v4 = v9;
  id v5 = v4;
  if (!v3)
  {
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"error closing connection %@: %@", self, v5];
    objc_claimAutoreleasedReturnValue();
    char v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2();
    }

    brc_append_system_info_to_message();
    objc_super v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCPQLConnection brc_close]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 615, v8);
  }
}

- (int64_t)sizeInBytes
{
  [(BRCPQLConnection *)self assertOnQueue];
  id v3 = [(PQLConnection *)self numberWithSQL:@"pragma page_count"];
  id v4 = [(PQLConnection *)self numberWithSQL:@"pragma page_size"];
  uint64_t v5 = [v3 integerValue];
  int64_t v6 = [v4 integerValue] * v5;

  return v6;
}

- (BOOL)needsAutovacuum
{
  [(BRCPQLConnection *)self assertOnQueue];
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  [v3 dbAutovacuumRatio];
  BOOL v5 = v4 != 0.0
    && [v3 dbAutovacuumBatchSize]
    && (uint64_t v7 = [(BRCPQLConnection *)self autovacuumableSpaceInBytes],
        double v8 = (double)v7 * 100.0 / (double)[(BRCPQLConnection *)self sizeInBytes],
        [v3 dbAutovacuumRatio],
        v8 >= v9)
    && v7 >= [v3 dbAutovacuumBatchSize];

  return v5;
}

- (void)autovacuumIfNeeded
{
  [(BRCPQLConnection *)self assertOnQueue];
  if (!self->_autovacuumInProgress && [(BRCPQLConnection *)self needsAutovacuum])
  {
    id v3 = +[BRCUserDefaults defaultsForMangledID:0];
    -[BRCPQLConnection incrementalVacuum:](self, "incrementalVacuum:", [v3 dbAutovacuumBatchSize]);
    float v4 = +[BRCSystemResourcesManager manager];
    int v5 = [v4 connectedToPowerSource];

    if (v5)
    {
      objc_initWeak(&location, self);
      self->_autovacuumInProgress = 1;
      int64_t v6 = [(BRCPQLConnection *)self serialQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __38__BRCPQLConnection_autovacuumIfNeeded__block_invoke;
      v7[3] = &unk_1E6993C50;
      objc_copyWeak(&v8, &location);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __38__BRCPQLConnection_autovacuumIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[281] = 0;
  [WeakRetained autovacuumIfNeeded];
}

- (BOOL)_validateIsRunningWithCorrectPersona
{
  if (!self->_assertionPersonaIdentifier) {
    return 1;
  }
  v2 = self;
  id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  float v4 = objc_msgSend(v3, "br_currentPersonaID");
  LOBYTE(v2) = [v4 isEqualToString:v2->_assertionPersonaIdentifier];

  if (v2) {
    return 1;
  }
  int64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[BRCPQLConnection _validateIsRunningWithCorrectPersona]();
  }

  return 0;
}

- (void)assertOnQueue
{
  v3.receiver = self;
  v3.super_class = (Class)BRCPQLConnection;
  [(BRCPQLConnection *)&v3 assertOnQueue];
  [(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona];
}

- (BOOL)execute:(id)a3
{
  return [(BRCPQLConnection *)self execute:a3 args:&v4];
}

- (BOOL)execute:(id)a3 args:(char *)a4
{
  id v6 = a3;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCPQLConnection;
    BOOL v7 = [(BRCPQLConnection *)&v9 execute:v6 args:a4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)executeRaw:(id)a3
{
  id v4 = a3;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCPQLConnection;
    BOOL v5 = [(BRCPQLConnection *)&v7 executeRaw:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)fetch:(id)a3
{
  return [(BRCPQLConnection *)self fetch:a3 args:&v4];
}

- (id)fetch:(id)a3 args:(char *)a4
{
  id v6 = a3;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCPQLConnection;
    id v7 = [(BRCPQLConnection *)&v9 fetch:v6 args:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  return [(BRCPQLConnection *)self fetchObjectOfClass:a3 initializer:a4 sql:a5 args:&v6];
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6
{
  id v10 = a5;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCPQLConnection;
    id v11 = [(BRCPQLConnection *)&v13 fetchObjectOfClass:a3 initializer:a4 sql:v10 args:a6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4
{
  return [(BRCPQLConnection *)self fetchObjectOfClass:a3 sql:a4 args:&v5];
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5
{
  id v8 = a4;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v11.receiver = self;
    v11.super_class = (Class)BRCPQLConnection;
    id v9 = [(BRCPQLConnection *)&v11 fetchObjectOfClass:a3 sql:v8 args:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)fetchObject:(id)a3 sql:(id)a4
{
  return [(BRCPQLConnection *)self fetchObject:a3 sql:a4 args:&v5];
}

- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(BRCPQLConnection *)self _validateIsRunningWithCorrectPersona])
  {
    v12.receiver = self;
    v12.super_class = (Class)BRCPQLConnection;
    id v10 = [(BRCPQLConnection *)&v12 fetchObject:v8 sql:v9 args:a5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)vmStepsExecuted
{
  return self->_vmStepsExecuted;
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (BOOL)verboseProfilingEnabled
{
  return self->_verboseProfilingEnabled;
}

- (void)setVerboseProfilingEnabled:(BOOL)a3
{
  self->_verboseProfilingEnabled = a3;
}

- (NSString)assertionPersonaIdentifier
{
  return self->_assertionPersonaIdentifier;
}

- (void)setAssertionPersonaIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionPersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_batchingPacer, 0);
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Got really unexpected error: %@%@", v1, 0x16u);
}

void __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] %@%@");
}

void __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2()
{
  uint64_t v0 = brc_append_system_info_to_message();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] %@%@", v3, v4, v5, v6, v7);
}

- (void)_registerStaticDBFunctionsWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] _registerStaticDBFunctions failed with %@%@");
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: argc >= 1%@", v2, v3, v4, v5, v6);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !set || [set isKindOfClass:[NSIndexSet class]]%@", v2, v3, v4, v5, v6);
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: argc == 1%@", v2, v3, v4, v5, v6);
}

- (void)fetchWithSlowStatementRadar:sql:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: you need to provide a radar%@", v2, v3, v4, v5, v6);
}

- (void)executeWithExpectedIndex:sql:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: you need to an index to use%@", v2, v3, v4, v5, v6);
}

- (void)disableProfilingForQueriesInBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
}

- (void)_shouldFlushWithChangeCount:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _batchingPacer%@", v2, v3, v4, v5, v6);
}

- (void)_validateIsRunningWithCorrectPersona
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Running on the connection with the wrong persona%@", v2, v3, v4, v5, v6);
}

@end