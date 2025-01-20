@interface ACDDatabase
+ (id)new;
- (ACDDatabase)init;
- (ACDDatabase)initWithDatabaseURL:(id)a3;
- (ACDDatabase)initWithDatabaseURL:(id)a3 storeOptions:(id)a4;
- (BOOL)_performBackupToURL:(id)a3 unverifiedBackupURL:(id)a4 error:(id *)a5;
- (BOOL)_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:(id *)a3;
- (BOOL)_shouldResetPersistentStoreAfterError:(id)a3;
- (BOOL)performBackupReturningError:(id *)a3;
- (BOOL)resetReturningError:(id *)a3;
- (BOOL)restoreFromBackupReturningError:(id *)a3;
- (NSString)description;
- (NSURL)databaseURL;
- (id)_addPersistentStoreWithType:(id)a3 configuration:(id)a4 URL:(id)a5 options:(id)a6 error:(id *)a7;
- (id)_backupURL;
- (id)_unverifiedBackupURL;
- (id)createConnection;
- (void)databaseConnection:(id)a3 encounteredUnrecoverableError:(id)a4;
@end

@implementation ACDDatabase

- (id)createConnection
{
  v3 = [[ACDDatabaseConnection alloc] initWithPersistentStoreCoordinator:self->_persistentStoreCoordinator];
  [(ACDDatabaseConnection *)v3 setDelegate:self];

  return v3;
}

+ (id)new
{
  return 0;
}

- (ACDDatabase)init
{
  return 0;
}

- (ACDDatabase)initWithDatabaseURL:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263EFF070];
  v10[0] = *MEMORY[0x263EFF008];
  v10[1] = v4;
  v11[0] = MEMORY[0x263EFFA88];
  v11[1] = MEMORY[0x263EFFA80];
  v10[2] = *MEMORY[0x263EFF0E0];
  v11[2] = *MEMORY[0x263F080B0];
  v5 = NSDictionary;
  id v6 = a3;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];
  v8 = [(ACDDatabase *)self initWithDatabaseURL:v6 storeOptions:v7];

  return v8;
}

- (ACDDatabase)initWithDatabaseURL:(id)a3 storeOptions:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ACDDatabase.m", 90, @"Invalid parameter not satisfying: %@", @"databaseURL" object file lineNumber description];
  }
  if (([v8 isFileURL] & 1) == 0)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"ACDDatabase.m" lineNumber:92 description:@"Attempt to initialize database with non-file URL!"];
  }
  v47.receiver = self;
  v47.super_class = (Class)ACDDatabase;
  v10 = [(ACDDatabase *)&v47 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_databaseURL, a3);
    uint64_t v12 = [v9 copy];
    storeOptions = v11->_storeOptions;
    v11->_storeOptions = (NSDictionary *)v12;

    v14 = _ACDManagedObjectModel();
    uint64_t v15 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v14];
    persistentStoreCoordinator = v11->_persistentStoreCoordinator;
    v11->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v15;

    uint64_t v17 = *MEMORY[0x263EFF168];
    v18 = v11->_storeOptions;
    id v46 = 0;
    v19 = [(ACDDatabase *)v11 _addPersistentStoreWithType:v17 configuration:0 URL:v8 options:v18 error:&v46];
    id v20 = v46;
    v21 = _ACDLogSystem();
    v22 = v21;
    if (v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACDDatabase initWithDatabaseURL:storeOptions:].cold.4((uint64_t *)&v11->_storeOptions, v22);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ACDDatabase initWithDatabaseURL:storeOptions:]((uint64_t *)&v11->_storeOptions, (uint64_t)v20, v22);
      }

      BOOL v23 = [(ACDDatabase *)v11 _shouldResetPersistentStoreAfterError:v20];
      if (v20)
      {
        v24 = +[ACDEventLedger sharedLedger];
        v25 = [v20 description];
        [v24 recordEvent:v25];
      }
      if (!v23)
      {
LABEL_16:
        if (objc_msgSend(v20, "ac_isDiskFullSQLError"))
        {
          v35 = _ACDLogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[ACDDatabase initWithDatabaseURL:storeOptions:](v35, v36, v37, v38, v39, v40, v41, v42);
          }
        }
        else
        {
          id v43 = 0;
          v27 = [(ACDDatabase *)v11 createConnection];
          v28 = [[ACDDatabaseInitializer alloc] initWithDatabaseConnection:v27];
          BOOL v29 = [(ACDDatabaseInitializer *)v28 updateDefaultContentIfNecessary:&v43];

          id v30 = v43;
          uint64_t v31 = (uint64_t)v30;
          if (v29)
          {

            goto LABEL_19;
          }
          v35 = _ACDLogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[ACDDatabase initWithDatabaseURL:storeOptions:](v31, v35);
          }
        }

        exit(0);
      }
      v26 = v11->_persistentStoreCoordinator;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __48__ACDDatabase_initWithDatabaseURL_storeOptions___block_invoke;
      v44[3] = &unk_264320CF0;
      v45 = v11;
      [(NSPersistentStoreCoordinator *)v26 performBlockAndWait:v44];
      v22 = v45;
    }

    goto LABEL_16;
  }
LABEL_19:

  return v11;
}

void __48__ACDDatabase_initWithDatabaseURL_storeOptions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v2 = objc_msgSend(v1, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &v6);
  id v3 = v6;
  uint64_t v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [NSNumber numberWithBool:v2];
    *(_DWORD *)buf = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_2183AD000, v4, OS_LOG_TYPE_DEFAULT, "\"Reset persistentStoreCoordinator, success: %@, error: %@\"", buf, 0x16u);
  }
}

- (id)_backupURL
{
  id v3 = [(ACDDatabase *)self databaseURL];
  uint64_t v4 = [v3 lastPathComponent];

  v5 = [(ACDDatabase *)self databaseURL];
  id v6 = [v5 URLByDeletingLastPathComponent];
  v7 = [v6 URLByAppendingPathComponent:@"VerifiedBackup" isDirectory:1];

  id v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:0];

  return v8;
}

- (id)_unverifiedBackupURL
{
  id v3 = [(ACDDatabase *)self databaseURL];
  uint64_t v4 = [v3 lastPathComponent];

  v5 = [(ACDDatabase *)self databaseURL];
  id v6 = [v5 URLByDeletingLastPathComponent];
  v7 = [v6 URLByAppendingPathComponent:@"UnverifiedBackup" isDirectory:1];

  id v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:0];

  return v8;
}

- (BOOL)performBackupReturningError:(id *)a3
{
  v5 = [(ACDDatabase *)self _backupURL];
  id v6 = [(ACDDatabase *)self _unverifiedBackupURL];
  v7 = [v5 URLByDeletingLastPathComponent];
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v10 = v19;

  if (v9)
  {
    uint64_t v11 = [v6 URLByDeletingLastPathComponent];
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    id v18 = v10;
    char v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v14 = v18;

    if (v13)
    {
      BOOL v15 = [(ACDDatabase *)self _performBackupToURL:v5 unverifiedBackupURL:v6 error:a3];
      v16 = [MEMORY[0x263F08850] defaultManager];
      [v16 removeItemAtURL:v11 error:0];
    }
    else
    {
      BOOL v15 = 0;
      if (a3) {
        *a3 = v14;
      }
    }
  }
  else if (a3)
  {
    id v14 = v10;
    BOOL v15 = 0;
    *a3 = v14;
  }
  else
  {
    BOOL v15 = 0;
    id v14 = v10;
  }

  return v15;
}

- (BOOL)restoreFromBackupReturningError:(id *)a3
{
  v5 = [(ACDDatabase *)self _backupURL];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    id v29 = 0;
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__ACDDatabase_restoreFromBackupReturningError___block_invoke;
    v20[3] = &unk_264320E58;
    v22 = &v30;
    v20[4] = self;
    id v21 = v5;
    BOOL v23 = &v24;
    [(NSPersistentStoreCoordinator *)persistentStoreCoordinator performBlockAndWait:v20];
    if (a3) {
      *a3 = (id) v25[5];
    }
    BOOL v10 = *((unsigned char *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v11 = _ACDLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabase restoreFromBackupReturningError:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    BOOL v10 = 0;
  }

  return v10;
}

void __47__ACDDatabase_restoreFromBackupReturningError___block_invoke(void *a1)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v5 = v3[2];
  uint64_t v4 = v3[3];
  id v6 = (void *)v3[1];
  uint64_t v7 = *MEMORY[0x263EFF168];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v6 replacePersistentStoreAtURL:v4 destinationOptions:v5 withPersistentStoreFromURL:v2 sourceOptions:v5 storeType:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v11 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v12 = *(void **)(v11 + 8);
    uint64_t v13 = *(void *)(v11 + 16);
    uint64_t v14 = *(void *)(a1[7] + 8);
    id v16 = *(id *)(v14 + 40);
    uint64_t v15 = [v12 addPersistentStoreWithType:v7 configuration:0 URL:v10 options:v13 error:&v16];
    objc_storeStrong((id *)(v14 + 40), v16);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v15 != 0;
  }
}

- (BOOL)resetReturningError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ACDDatabase_resetReturningError___block_invoke;
  v7[3] = &unk_264320E80;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  [(NSPersistentStoreCoordinator *)persistentStoreCoordinator performBlockAndWait:v7];
  if (a3) {
    *a3 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __35__ACDDatabase_resetReturningError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = objc_msgSend(v2, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (id)_addPersistentStoreWithType:(id)a3 configuration:(id)a4 URL:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator addPersistentStoreWithType:v12 configuration:v13 URL:v14 options:v15 error:a7];

  return v16;
}

- (BOOL)_shouldResetPersistentStoreAfterError:(id)a3
{
  id v4 = a3;
  if ([v4 code] == 134100)
  {
    char v5 = _ACDLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting to migrate persistentStore...\"", buf, 2u);
    }

    id v6 = [[ACDDatabaseMigrator alloc] initForDatabaseAtURL:self->_databaseURL persistentStoreCoordinator:self->_persistentStoreCoordinator storeOptions:self->_storeOptions];
    uint64_t v25 = 0;
    int v7 = [v6 runReturningError:&v25];
    uint64_t v8 = _ACDLogSystem();
    char v9 = v8;
    if (!v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ACDDatabase _shouldResetPersistentStoreAfterError:](v9, v11, v12, v13, v14, v15, v16, v17);
      }

      goto LABEL_13;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v9, OS_LOG_TYPE_DEFAULT, "\"Successfully migrated existing persistentStore!\"", buf, 2u);
    }
  }
  if (!objc_msgSend(v4, "ac_isUnrecoverableDatabaseError"))
  {
    BOOL v10 = 0;
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEFAULT, "\"Attempting to restore persistentStore...\"", buf, 2u);
  }

  id v24 = 0;
  BOOL v19 = [(ACDDatabase *)self restoreFromBackupReturningError:&v24];
  id v20 = v24;
  id v21 = _ACDLogSystem();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v22, OS_LOG_TYPE_DEFAULT, "\"Successfully restored persistentStore!\"", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[ACDDatabase _shouldResetPersistentStoreAfterError:]((uint64_t)v20, v22);
  }

  BOOL v10 = !v19;
LABEL_21:

  return v10;
}

- (BOOL)_performBackupToURL:(id)a3 unverifiedBackupURL:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ACDDatabase.m", 300, @"Invalid parameter not satisfying: %@", @"backupURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"ACDDatabase.m", 301, @"Invalid parameter not satisfying: %@", @"unverifiedBackupURL" object file lineNumber description];

LABEL_3:
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke;
  v27[3] = &unk_264320E58;
  id v29 = &v37;
  v27[4] = self;
  id v13 = v11;
  id v28 = v13;
  uint64_t v30 = &v31;
  [(NSPersistentStoreCoordinator *)persistentStoreCoordinator performBlockAndWait:v27];
  if (!*((unsigned char *)v38 + 24))
  {
    if (a5)
    {
      id v16 = (id) v32[5];
      goto LABEL_9;
    }
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  id v14 = v13;
  [v14 fileSystemRepresentation];
  int v15 = _sqlite3_integrity_check();
  if (v15)
  {
    if (a5)
    {
      id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:v15 userInfo:0];
LABEL_9:
      BOOL v17 = 0;
      *a5 = v16;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  uint64_t v18 = self->_persistentStoreCoordinator;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke_2;
  v22[3] = &unk_264320EA8;
  uint64_t v25 = &v37;
  v22[4] = self;
  id v23 = v9;
  id v24 = v14;
  uint64_t v26 = &v31;
  [(NSPersistentStoreCoordinator *)v18 performBlockAndWait:v22];
  BOOL v17 = *((unsigned char *)v38 + 24) != 0;
  if (a5 && !*((unsigned char *)v38 + 24)) {
    *a5 = (id) v32[5];
  }

LABEL_15:
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v17;
}

void __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  id v4 = (void *)v3[1];
  uint64_t v5 = v3[2];
  uint64_t v6 = v3[3];
  uint64_t v7 = *MEMORY[0x263EFF168];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 replacePersistentStoreAtURL:v2 destinationOptions:v5 withPersistentStoreFromURL:v6 sourceOptions:v5 storeType:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
}

void __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  id v4 = *(void **)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = a1[6];
  uint64_t v7 = *MEMORY[0x263EFF168];
  uint64_t v8 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 replacePersistentStoreAtURL:v2 destinationOptions:v5 withPersistentStoreFromURL:v6 sourceOptions:v5 storeType:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v9;
}

- (BOOL)_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:(id *)a3
{
  databaseURL = self->_databaseURL;
  uint64_t v6 = *MEMORY[0x263EFF168];
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  storeOptions = self->_storeOptions;
  id v19 = 0;
  BOOL v9 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator destroyPersistentStoreAtURL:databaseURL withType:v6 options:storeOptions error:&v19];
  id v10 = v19;
  uint64_t v11 = v10;
  if (v9)
  {
    id v13 = self->_storeOptions;
    uint64_t v12 = self->_databaseURL;
    id v18 = v10;
    id v14 = [(ACDDatabase *)self _addPersistentStoreWithType:v6 configuration:0 URL:v12 options:v13 error:&v18];
    id v15 = v18;

    BOOL v16 = v14 != 0;
    uint64_t v11 = v15;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v16 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v11;
LABEL_6:

  return v16;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACDDatabase *)self databaseURL];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p { %@ }>", v5, self, v6];

  return (NSString *)v7;
}

- (void)databaseConnection:(id)a3 encounteredUnrecoverableError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ACDDatabase.m", 371, @"Invalid parameter not satisfying: %@", @"databaseConnection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"ACDDatabase.m", 372, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke;
  v14[3] = &unk_264320CF0;
  v14[4] = self;
  [(NSPersistentStoreCoordinator *)persistentStoreCoordinator performBlockAndWait:v14];
  [NSString stringWithFormat:@"Fatal database error encountered: %@", v9];
  id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v11);
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  id v18 = 0;
  int v3 = [v1 restoreFromBackupReturningError:&v18];
  id v4 = v18;
  uint64_t v5 = _ACDLogSystem();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*v2 _backupURL];
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"Successfully restored with backup at URL: %@\"", buf, 0xCu);
    }
    id v8 = +[ACDEventLedger sharedLedger];
    [v8 recordEvent:@"Restored database from backup"];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_2(v2);
    }

    id v9 = *v2;
    id v17 = 0;
    int v10 = objc_msgSend(v9, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &v17);
    id v8 = v17;
    id v11 = _ACDLogSystem();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*v2 databaseURL];
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEFAULT, "\"Successfully reset the database at URL: %@\"", buf, 0xCu);
      }
      id v14 = +[ACDEventLedger sharedLedger];
      id v15 = v14;
      BOOL v16 = @"Reset database";
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_1(v2);
      }

      id v14 = +[ACDEventLedger sharedLedger];
      id v15 = v14;
      BOOL v16 = @"Failed to reset database";
    }
    [v14 recordEvent:v16];
  }
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);

  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

- (void)initWithDatabaseURL:(uint64_t)a3 storeOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDatabaseURL:(uint64_t)a1 storeOptions:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Unable to initialize the database: %@. Exiting.\"", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDatabaseURL:(os_log_t)log storeOptions:.cold.3(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Failed to add persistentStore with options: %{private}@, error: %@\"", (uint8_t *)&v4, 0x16u);
}

- (void)initWithDatabaseURL:(uint64_t *)a1 storeOptions:(NSObject *)a2 .cold.4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "\"Successfully added persistentStore with options: %{private}@\"", (uint8_t *)&v3, 0xCu);
}

- (void)restoreFromBackupReturningError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_shouldResetPersistentStoreAfterError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to restore persistentStore, error: %@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_shouldResetPersistentStoreAfterError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 databaseURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Failed to reset the database at URL: %@, error: %@\"", v4, v5, v6, v7, v8);
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_2(id *a1)
{
  v1 = [*a1 _backupURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Failed to restore with backup at URL: %@, error: %@\"", v4, v5, v6, v7, v8);
}

@end