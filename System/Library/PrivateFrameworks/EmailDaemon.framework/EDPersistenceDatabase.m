@interface EDPersistenceDatabase
+ (OS_os_log)log;
- (BOOL)__performReadWithCaller:(id)a3 usingBlock:(id)a4;
- (BOOL)__performWriteWithCaller:(id)a3 usingBlock:(id)a4;
- (BOOL)_isIOError:(uint64_t)a1;
- (BOOL)databaseIsCorrupt;
- (BOOL)enforceDataProtection;
- (BOOL)isNestedDatabaseCall;
- (BOOL)performDatabaseSetupUsingTransaction:(BOOL)a3 block:(id)a4;
- (BOOL)performWithOptions:(unint64_t)a3 caller:(id)a4 block:(id)a5;
- (BOOL)protectedDatabaseIsAvailable;
- (BOOL)setupIsComplete;
- (BOOL)writersAreWaiting;
- (EDPersistenceDatabase)init;
- (EDPersistenceDatabase)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9;
- (EDProtectedDatabasePersistence)protectedDatabasePersistence;
- (EFSQLPropertyMapper)propertyMapper;
- (EFSQLQueryLogging)queryLogger;
- (EFSQLSchema)protectedSchema;
- (EFSQLSchema)schema;
- (NSString)basePath;
- (NSString)databaseName;
- (NSString)fullPath;
- (NSString)protectedDatabasePath;
- (id)_fileProtectionTypeForDatabaseType:(id)a1;
- (id)checkOutConnectionIsWriter:(BOOL)a3;
- (id)openConnectionIsWriter:(BOOL)a3;
- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4;
- (id)urlFileProtectionTypeForDatabaseType:(int64_t)a3;
- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4;
- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4 fileProtection:(id)a5;
- (void)_scheduleProcessSQLQueryPerformanceData;
- (void)checkInConnection:(id)a3;
- (void)closeAllConnections;
- (void)handleExceptionCreatingConnection:(id)a3;
- (void)performDatabaseWorkInBlockWithHighPriority:(id)a3;
- (void)reconcileJournalWithCompletionBlock:(id)a3;
- (void)scheduleRecurringActivity;
- (void)setSetupIsComplete:(BOOL)a3;
- (void)test_tearDown;
@end

@implementation EDPersistenceDatabase

- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = [(EDPersistenceDatabase *)self urlFileProtectionTypeForDatabaseType:a4];
  v8 = [(EDPersistenceDatabase *)self urlForDatabasePath:v6 type:a4 fileProtection:v7];

  return v8;
}

- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4 fileProtection:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v11 setScheme:@"file"];
  [v11 setPath:v9];
  if ((unint64_t)a4 >= 3)
  {
    if (a4 == 3)
    {
      v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"cache" value:@"shared"];
      v15 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"mode", @"memory", v14);
      v24[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      [v11 setQueryItems:v16];

      goto LABEL_10;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:427 description:@"Invalid database type"];
    goto LABEL_9;
  }
  if (v10 && [(EDPersistenceDatabase *)self enforceDataProtection])
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F1C570]])
    {
      v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"vfs" value:@"MailClassAVFS"];
      v27[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v11 setQueryItems:v13];

      goto LABEL_10;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4F1C578]])
    {
      v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"vfs" value:@"MailClassBVFS"];
      v26 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v11 setQueryItems:v21];

      goto LABEL_10;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4F1C580]])
    {
      v22 = [MEMORY[0x1E4F290C8] queryItemWithName:@"vfs" value:@"MailClassCVFS"];
      v25 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v11 setQueryItems:v23];

      goto LABEL_10;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:416 description:@"Unsupported file protection"];
LABEL_9:
  }
LABEL_10:
  v18 = [v11 URL];

  return v18;
}

- (id)urlFileProtectionTypeForDatabaseType:(int64_t)a3
{
  BOOL v4 = [(EDPersistenceDatabase *)self enforceDataProtection];
  id v5 = 0;
  if (v4 && (unint64_t)a3 <= 2) {
    id v5 = **((id **)&unk_1E6C043C0 + a3);
  }

  return v5;
}

- (BOOL)protectedDatabaseIsAvailable
{
  if (EFProtectedDataAvailable()) {
    return 1;
  }
  if (self) {
    protectedDatabaseFile = self->_protectedDatabaseFile;
  }
  else {
    protectedDatabaseFile = 0;
  }

  return [(EFProtectedFile *)protectedDatabaseFile backgroundProcessingIsAllowed];
}

- (BOOL)__performReadWithCaller:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![(EDPersistenceDatabase *)self setupIsComplete]
    && ![(EDPersistenceDatabase *)self isNestedDatabaseCall])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:164 description:@"performReadBlockInDatabase called before database setup is complete"];
  }
  BOOL v9 = [(EDPersistenceDatabase *)self performWithOptions:1 caller:v7 block:v8];

  return v9;
}

- (BOOL)setupIsComplete
{
  return self->_setupIsComplete;
}

- (EFSQLQueryLogging)queryLogger
{
  return self->_queryLogger;
}

- (BOOL)performWithOptions:(unint64_t)a3 caller:(id)a4 block:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v9 = a5;
  if ([(EDPersistenceDatabase *)self isNestedDatabaseCall])
  {
    id v10 = [MEMORY[0x1E4F29060] currentThread];
    id v11 = [v10 threadDictionary];

    v12 = [v11 objectForKeyedSubscript:@"_EDPersistenceActiveDatabaseConnection"];
    v13 = [v12 transactionLabel];
    [v12 setTransactionLabel:v36];
    if ((a3 & 2) != 0)
    {
      v14 = [v11 objectForKeyedSubscript:@"_EDPersistenceReadOnlyDatabaseConnection"];
      int v15 = [v14 BOOLValue];

      if (v15)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:186 description:@"Database write block nested inside a readblock."];
      }
    }
    id v40 = 0;
    char v17 = [v12 performWithOptions:a3 transactionError:&v40 block:v9];
    id v18 = v40;
    [v12 setTransactionLabel:v13];
    if ((v17 & 1) == 0) {
      [v12 handleError:v18 message:@"Committing transaction in nested block"];
    }
  }
  else
  {
    id v11 = [(EDPersistenceDatabase *)self checkOutConnectionIsWriter:(a3 >> 1) & 1];
    [v11 setTransactionLabel:v36];
    if (!v11)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:199 description:@"Couldn't get database connection in performBlock"];
    }
    uint64_t v20 = 2;
    *(void *)&long long v19 = 67109376;
    long long v35 = v19;
    while (1)
    {
      v21 = [(EDPersistenceDatabase *)self protectedDatabasePersistence];
      v22 = [(EDPersistenceDatabase *)self protectedSchema];
      [v21 attachProtectedOrJournalDatabaseToConnectionIfNecessary:v11 withSchema:v22];

      id v39 = 0;
      char v17 = [v11 performWithOptions:a3 transactionError:&v39 block:v9];
      id v23 = v39;
      [v11 setTransactionLabel:0];
      if (v17) {
        break;
      }
      if (![v11 protectedDatabaseAttached]
        || !-[EDPersistenceDatabase _isIOError:]((uint64_t)self, v23) && ![v11 hadIOError])
      {
        [v11 handleError:v23 message:@"Committing transaction"];
        goto LABEL_29;
      }
      if (!v20)
      {
        v32 = +[EDPersistenceDatabase log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          int v33 = EFProtectedDataAvailable();
          if (self) {
            protectedDatabaseFile = self->_protectedDatabaseFile;
          }
          else {
            protectedDatabaseFile = 0;
          }
          -[EDPersistenceDatabase performWithOptions:caller:block:]([(EFProtectedFile *)protectedDatabaseFile backgroundProcessingIsAllowed], buf, v33, v32);
        }

        abort();
      }
      v24 = +[EDPersistenceDatabase log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v26 = EFProtectedDataAvailable();
        if (self) {
          v27 = self->_protectedDatabaseFile;
        }
        else {
          v27 = 0;
        }
        v28 = v27;
        int v29 = [(EFProtectedFile *)v28 backgroundProcessingIsAllowed];
        *(_DWORD *)buf = v35;
        int v42 = v26;
        __int16 v43 = 1024;
        int v44 = v29;
        _os_log_error_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_ERROR, "Got IOError for transaction, retrying again, EFProtectedData = %d, backgroud processing = %d", buf, 0xEu);
      }
      [v11 setHadIOError:0];
      [v11 close];
      [v11 open];
      if ([(EDPersistenceDatabase *)self protectedDatabaseIsAvailable])
      {
        v25 = +[EDPersistenceDatabase log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[EDPersistenceDatabase performWithOptions:caller:block:](&v37, v38, v25);
        }
      }
      --v20;
    }
    if ([MEMORY[0x1E4F602A0] shouldBlockSQLQueries]) {
      [MEMORY[0x1E4F602A0] blockForRandomDurationWithMessage:@"Block SQL Query"];
    }
LABEL_29:

    if (v11) {
      [(EDPersistenceDatabase *)self checkInConnection:v11];
    }
  }

  return v17;
}

- (BOOL)isNestedDatabaseCall
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  BOOL v4 = [v3 objectForKeyedSubscript:@"_EDPersistenceActiveDatabaseConnection"];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (EFSQLSchema)protectedSchema
{
  return self->_protectedSchema;
}

- (void)checkInConnection:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(EDPersistenceDatabase *)self protectedDatabasePersistence];
  [v4 detachProtectedOrJournalDatabaseFromConnectionIfNecessary:v9];

  id v5 = [v9 sqlConnection];
  [v5 finalizeStatementsWithError:0];

  id v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];

  [v7 removeObjectForKey:@"_EDPersistenceActiveDatabaseConnection"];
  [v7 removeObjectForKey:@"_EDPersistenceReadOnlyDatabaseConnection"];
  [v9 setHadIOError:0];

  if (self) {
    connectionPool = self->_connectionPool;
  }
  else {
    connectionPool = 0;
  }
  [(EDPersistenceDatabaseConnectionPool *)connectionPool checkInConnection:v9];
}

- (EDProtectedDatabasePersistence)protectedDatabasePersistence
{
  return self->_protectedDatabasePersistence;
}

- (id)checkOutConnectionIsWriter:(BOOL)a3
{
  if ([(EDPersistenceDatabase *)self isNestedDatabaseCall])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:271 description:@"We should not be checking out a connection on a nested call"];
  }
  id v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];

  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  id v9 = [v8 serviceName];
  char v10 = [v9 isEqual:*MEMORY[0x1E4F5FCC0]];

  if (v10)
  {
    if (a3)
    {
      id v11 = +[EDPersistenceDatabase log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[EDPersistenceDatabase checkOutConnectionIsWriter:](v11);
      }

      v12 = [MEMORY[0x1E4F60D58] currentDevice];
      int v13 = [v12 isInternal];

      if (v13) {
        triedToCheckoutWriterWhileOnXPCQueue();
      }
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  v14 = [v7 objectForKeyedSubscript:@"_EDPersistenceNeedsHighPriority"];
  if (v14)
  {

    if (!a3) {
      goto LABEL_17;
    }
LABEL_13:
    if (self) {
      connectionPool = self->_connectionPool;
    }
    else {
      connectionPool = 0;
    }
    char v17 = [(EDPersistenceDatabaseConnectionPool *)connectionPool writerConnection];
    [v17 setIsWriter:1];
    goto LABEL_20;
  }
  int v15 = [MEMORY[0x1E4F29060] isMainThread];

  if (a3) {
    goto LABEL_13;
  }
  if (v15)
  {
LABEL_17:
    if (self) {
      id v18 = self->_connectionPool;
    }
    else {
      id v18 = 0;
    }
    char v17 = [(EDPersistenceDatabaseConnectionPool *)v18 readerConnection];
    [v17 setIsWriter:0];
    goto LABEL_20;
  }
  if (self) {
    uint64_t v20 = self->_connectionPool;
  }
  else {
    uint64_t v20 = 0;
  }
  char v17 = [(EDPersistenceDatabaseConnectionPool *)v20 backgroundReaderConnection];
  [v17 setIsWriter:0];
LABEL_20:
  if (v17)
  {
    [v7 setObject:v17 forKeyedSubscript:@"_EDPersistenceActiveDatabaseConnection"];
    if (!a3) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_EDPersistenceReadOnlyDatabaseConnection"];
    }
    [v17 setHadIOError:0];
  }

  return v17;
}

- (EFSQLPropertyMapper)propertyMapper
{
  return self->_propertyMapper;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)basePath
{
  return self->_basePath;
}

- (void)performDatabaseWorkInBlockWithHighPriority:(id)a3
{
  id v6 = (void (**)(void))a3;
  v3 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v4 = [v3 threadDictionary];

  id v5 = [v4 objectForKeyedSubscript:@"_EDPersistenceNeedsHighPriority"];

  if (v5)
  {
    v6[2]();
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_EDPersistenceNeedsHighPriority"];
    v6[2]();
    [v4 removeObjectForKey:@"_EDPersistenceNeedsHighPriority"];
  }
}

- (NSString)protectedDatabasePath
{
  return self->_protectedDatabasePath;
}

- (BOOL)__performWriteWithCaller:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![(EDPersistenceDatabase *)self setupIsComplete]
    && ![(EDPersistenceDatabase *)self isNestedDatabaseCall])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabase.m" lineNumber:169 description:@"performWriteBlockInDatabase called before database setup is complete"];
  }
  BOOL v9 = [(EDPersistenceDatabase *)self performWithOptions:3 caller:v7 block:v8];

  return v9;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EDPersistenceDatabase_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_67 != -1) {
    dispatch_once(&log_onceToken_67, block);
  }
  v2 = (void *)log_log_67;

  return (OS_os_log *)v2;
}

void __28__EDPersistenceDatabase_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_67;
  log_log_67 = (uint64_t)v1;
}

- (EDPersistenceDatabase)init
{
}

- (EDPersistenceDatabase)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v47 = a4;
  id v43 = a6;
  id v44 = a7;
  id v45 = a8;
  id v46 = a9;
  v48.receiver = self;
  v48.super_class = (Class)EDPersistenceDatabase;
  int v15 = [(EDPersistenceDatabase *)&v48 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    basePath = v15->_basePath;
    v15->_basePath = (NSString *)v16;

    uint64_t v18 = [v47 copy];
    databaseName = v15->_databaseName;
    v15->_databaseName = (NSString *)v18;

    if (v14)
    {
      uint64_t v20 = objc_msgSend(v14, "stringByAppendingPathComponent:", @"Protected Index", a9);
      protectedDatabasePath = v15->_protectedDatabasePath;
      v15->_protectedDatabasePath = (NSString *)v20;

      v22 = [@"Protected Index" stringByAppendingString:@"-wal"];
      id v23 = [v14 stringByAppendingPathComponent:v22];
      id v24 = objc_alloc(MEMORY[0x1E4F60E28]);
      v49[0] = v15->_protectedDatabasePath;
      v49[1] = v23;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      int v26 = -[EDPersistenceDatabase _fileProtectionTypeForDatabaseType:](v15, 1uLL);
      uint64_t v27 = [v24 initWithFilePaths:v25 protectionType:v26];
      protectedDatabaseFile = v15->_protectedDatabaseFile;
      v15->_protectedDatabaseFile = (EFProtectedFile *)v27;
    }
    else
    {
      int v29 = v15->_protectedDatabasePath;
      v15->_protectedDatabasePath = (NSString *)@"Protected Index";

      id v30 = objc_alloc(MEMORY[0x1E4F60E20]);
      v31 = v15->_protectedDatabasePath;
      v22 = -[EDPersistenceDatabase _fileProtectionTypeForDatabaseType:](v15, 1uLL);
      uint64_t v32 = objc_msgSend(v30, "initWithFilePath:protectionType:", v31, v22, a9);
      id v23 = v15->_protectedDatabaseFile;
      v15->_protectedDatabaseFile = (EFProtectedFile *)v32;
    }

    uint64_t v33 = [v14 stringByAppendingPathComponent:v47];
    fullPath = v15->_fullPath;
    v15->_fullPath = (NSString *)v33;

    objc_storeStrong((id *)&v15->_schema, a6);
    objc_storeStrong((id *)&v15->_protectedSchema, a7);
    objc_storeStrong((id *)&v15->_propertyMapper, a8);
    long long v35 = [[EDPersistenceDatabaseConnectionPool alloc] initWithDelegate:v15 maxConcurrentBackgroundReaders:a5];
    connectionPool = v15->_connectionPool;
    v15->_connectionPool = v35;

    queryLogger = v15->_queryLogger;
    v15->_queryLogger = 0;

    if (_os_feature_enabled_impl())
    {
      v38 = objc_alloc_init(EDSQLQueryLogger);
      id v39 = v15->_queryLogger;
      v15->_queryLogger = (EFSQLQueryLogging *)v38;
    }
    objc_storeStrong((id *)&v15->_protectedDatabasePersistence, obj);
    [v46 setDatabase:v15];
    if ([(EDPersistenceDatabase *)v15 enforceDataProtection]
      && registerVFSModulesIfNeeded_onceToken != -1)
    {
      dispatch_once(&registerVFSModulesIfNeeded_onceToken, &__block_literal_global_253);
    }
  }

  return v15;
}

- (id)_fileProtectionTypeForDatabaseType:(id)a1
{
  if (a1)
  {
    int v4 = [a1 enforceDataProtection];
    a1 = 0;
    if (v4 && a2 <= 2) {
      a1 = **((id **)&unk_1E6C043A8 + a2);
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPersistenceDatabase.m", 138, @"%s can only be called from unit tests", "-[EDPersistenceDatabase test_tearDown]");
  }
  id v4 = [(EDPersistenceDatabase *)self protectedDatabasePersistence];
  objc_msgSend(v4, "test_tearDown");
}

- (BOOL)writersAreWaiting
{
  if (self) {
    self = (EDPersistenceDatabase *)self->_connectionPool;
  }
  return [(EDPersistenceDatabase *)self writersWaiting] != 0;
}

- (BOOL)performDatabaseSetupUsingTransaction:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithUTF8String:"-[EDPersistenceDatabase performDatabaseSetupUsingTransaction:block:]"];
  if (v4) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 2;
  }
  BOOL v9 = [(EDPersistenceDatabase *)self performWithOptions:v8 caller:v7 block:v6];

  return v9;
}

- (BOOL)_isIOError:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F60D10]]) {
      BOOL v6 = [v4 code] == 10;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)closeAllConnections
{
  if (self) {
    self = (EDPersistenceDatabase *)self->_connectionPool;
  }
  [(EDPersistenceDatabase *)self flush];
}

- (id)openConnectionIsWriter:(BOOL)a3
{
}

- (BOOL)databaseIsCorrupt
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(NSString *)self->_fullPath fileSystemRepresentation];
  int v2 = _sqlite3_integrity_check();
  id v3 = +[EDPersistenceDatabase log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Integrity check result: %d", (uint8_t *)v5, 8u);
  }

  return v2 == 11;
}

- (void)reconcileJournalWithCompletionBlock:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(EDPersistenceDatabase *)self protectedDatabasePersistence];
  id v5 = [(EDPersistenceDatabase *)self protectedSchema];
  [v4 reconcileJournalsWithSchema:v5 completionBlock:v6];
}

- (BOOL)enforceDataProtection
{
}

- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  if (self) {
    self = (EDPersistenceDatabase *)self->_protectedDatabaseFile;
  }
  BOOL v4 = [(EDPersistenceDatabase *)self requestBackgroundProcessingForDuration:a4 error:a3];

  return v4;
}

- (void)scheduleRecurringActivity
{
  id v3 = [(EDPersistenceDatabase *)self protectedDatabasePersistence];
  [v3 scheduleRecurringActivity];

  -[EDPersistenceDatabase _scheduleProcessSQLQueryPerformanceData](self);
}

- (void)_scheduleProcessSQLQueryPerformanceData
{
  if (a1)
  {
    int v2 = [a1 queryLogger];

    if (v2)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke_2;
      aBlock[3] = &unk_1E6C008D8;
      aBlock[4] = a1;
      id v3 = _Block_copy(aBlock);
      ef_xpc_activity_register();
    }
  }
}

void __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
}

void __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) queryLogger];
  [v1 submitQueryLogData];
}

- (void)handleExceptionCreatingConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v3 callStackReturnAddresses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "appendFormat:", @"\t%p\n", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "unsignedIntegerValue"));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  BOOL v9 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v9 isInternal]) {
    [v3 reason];
  }
  else {
  char v10 = [v3 name];
  }

  id v11 = +[EDPersistenceDatabase log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    [(EDPersistenceDatabase *)(uint64_t)v10 handleExceptionCreatingConnection:v11];
  }
}

- (EFSQLSchema)schema
{
  return self->_schema;
}

- (NSString)fullPath
{
  return self->_fullPath;
}

- (void)setSetupIsComplete:(BOOL)a3
{
  self->_setupIsComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullPath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_protectedDatabasePersistence, 0);
  objc_storeStrong((id *)&self->_blankCellsController, 0);
  objc_storeStrong((id *)&self->_connectionPool, 0);
  objc_storeStrong((id *)&self->_protectedDatabaseFile, 0);
  objc_storeStrong((id *)&self->_propertyMapper, 0);
  objc_storeStrong((id *)&self->_protectedSchema, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);

  objc_storeStrong((id *)&self->_protectedDatabasePath, 0);
}

- (void)performWithOptions:(int)a3 caller:(os_log_t)log block:.cold.1(char a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a1 & 1;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Got IOError three times in a row, aborting, EFProtectedData = %d, backgroud processing = %d", buf, 0xEu);
}

- (void)performWithOptions:(uint8_t *)buf caller:(unsigned char *)a2 block:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Got IOError for transaction", buf, 2u);
}

- (void)checkOutConnectionIsWriter:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Trying to get a database write connection while servicing an XPC request.", v1, 2u);
}

- (void)handleExceptionCreatingConnection:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Exception raised during transaction, %{public}@\nStack:\n%{public}@", (uint8_t *)&v3, 0x16u);
}

@end