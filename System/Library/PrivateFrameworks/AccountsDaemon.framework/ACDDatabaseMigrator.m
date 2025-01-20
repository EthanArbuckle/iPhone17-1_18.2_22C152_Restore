@interface ACDDatabaseMigrator
+ (id)new;
- (ACDDatabaseMigrator)init;
- (BOOL)runReturningError:(id *)a3;
- (NSDictionary)storeOptions;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)databaseURL;
- (id)_compatibleModelForStoreAtURL:(id)a3;
- (id)_fetchAllAuthorizationEntitiesForModelVersion:(int64_t)a3;
- (id)_fetchAllDataclassEntitles;
- (id)_setUpContextForMigration;
- (id)initForDatabaseAtURL:(id)a3 persistentStoreCoordinator:(id)a4 storeOptions:(id)a5;
- (int64_t)_versionForModel:(id)a3;
- (void)_fetchAllDataclassEntitles;
- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:(int64_t)a3;
- (void)_migrateNameAttributeOfDataclassEntities;
- (void)_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:(int64_t)a3;
- (void)_postProcessMigrationFromVersion:(int64_t)a3 migrationData:(id)a4;
- (void)_setUpContextForMigration;
@end

@implementation ACDDatabaseMigrator

+ (id)new
{
  return 0;
}

- (ACDDatabaseMigrator)init
{
  return 0;
}

- (id)initForDatabaseAtURL:(id)a3 persistentStoreCoordinator:(id)a4 storeOptions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ACDDatabaseMigrator;
  v12 = [(ACDDatabaseMigrator *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseURL, a3);
    objc_storeStrong((id *)&v13->_persistentStoreCoordinator, a4);
    uint64_t v14 = [v11 copy];
    storeOptions = v13->_storeOptions;
    v13->_storeOptions = (NSDictionary *)v14;
  }
  return v13;
}

- (BOOL)runReturningError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator runReturningError:].cold.5();
  }

  v6 = [(ACDDatabaseMigrator *)self _setUpContextForMigration];
  migrationContext = self->_migrationContext;
  self->_migrationContext = v6;

  v8 = self->_migrationContext;
  if (!v8)
  {
    char v16 = 0;
    goto LABEL_15;
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  id v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41__ACDDatabaseMigrator_runReturningError___block_invoke;
  v21[3] = &unk_264320E80;
  v21[4] = self;
  v21[5] = &v28;
  v21[6] = &v22;
  [(NSManagedObjectContext *)v8 performBlockAndWait:v21];
  id v9 = (void *)[(NSDictionary *)self->_storeOptions mutableCopy];
  [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF070]];
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator runReturningError:].cold.4();
  }

  uint64_t v11 = *MEMORY[0x263EFF168];
  databaseURL = self->_databaseURL;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  id v20 = 0;
  uint64_t v14 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator addPersistentStoreWithType:v11 configuration:0 URL:databaseURL options:v9 error:&v20];
  id v15 = v20;
  if (v14)
  {

    [(ACDDatabaseMigrator *)self _postProcessMigrationFromVersion:v29[3] migrationData:v23[5]];
    char v16 = 1;
    if (!a3) {
      goto LABEL_14;
    }
  }
  else
  {
    objc_super v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseMigrator runReturningError:]();
    }

    char v16 = 0;
    if (!a3) {
      goto LABEL_14;
    }
  }
  *a3 = v15;
LABEL_14:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
LABEL_15:
  v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator runReturningError:](v16);
  }

  return v16;
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = *(id **)(a1 + 32);
  v3 = [v2[2] managedObjectModel];
  *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = [v2 _versionForModel:v3];

  v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_3(v1 + 40);
  }

  uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24);
  BOOL v6 = v5 < 9;
  if (v5 <= 8)
  {
    objc_msgSend(*(id *)(v1 + 32), "_migrateAccessAuthorizationsToTCCFromModelVersion:");
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24);
  }
  if (v5 == 2401802)
  {
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v7, OS_LOG_TYPE_DEFAULT, "\"Performing bridge migration on a database that was created on 6.1 or earlier. Pray to the deity of your choosing that this will work.\"", buf, 2u);
    }

    [*(id *)(v1 + 32) _migrateNameAttributeOfDataclassEntities];
    [*(id *)(v1 + 32) _migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24);
    BOOL v6 = 1;
  }
  if (v5 < 18 || v5 == 2401802)
  {
    id v9 = [MEMORY[0x263EFF240] entityForName:@"Account" inManagedObjectContext:*(void *)(*(void *)(v1 + 32) + 8)];
    id v10 = objc_alloc_init(MEMORY[0x263EFF260]);
    [v10 setEntity:v9];
    [v10 setReturnsObjectsAsFaults:0];
    uint64_t v11 = [*(id *)(*(void *)(v1 + 32) + 8) executeFetchRequest:v10 error:0];
    v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_2(v11);
    }

    if ([v11 count])
    {
      id v27 = v10;
      uint64_t v28 = v9;
      uint64_t v29 = v1;
      v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v26 = v11;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            id v20 = [v19 valueForKey:@"accountProperties"];
            if (v20)
            {
              v35[0] = @"objectID";
              v21 = [v19 objectID];
              v35[1] = @"properties";
              v36[0] = v21;
              v36[1] = v20;
              uint64_t v22 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
              [v13 addObject:v22];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v16);
      }

      uint64_t v1 = v29;
      uint64_t v23 = *(void *)(*(void *)(v29 + 48) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v13;

      id v10 = v27;
      id v9 = v28;
      uint64_t v11 = v26;
    }
  }
  v25 = _ACDLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_1();
  }

  if (v6) {
    [*(id *)(*(void *)(v1 + 32) + 8) save:0];
  }
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator _migrateAccessAuthorizationsToTCCFromModelVersion:]();
  }

  BOOL v6 = [(ACDDatabaseMigrator *)self _fetchAllAuthorizationEntitiesForModelVersion:a3];
  v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator _migrateAccessAuthorizationsToTCCFromModelVersion:](v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412290;
    long long v24 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "bundleID", v24, (void)v25);
        uint64_t v16 = _ACDLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v24;
          long long v30 = v15;
          _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "\"Found authorization for client: %@\"", buf, 0xCu);
        }

        if (v15)
        {
          uint64_t v17 = +[ACDClient clientWithBundleID:v15];
          id v18 = objc_alloc(MEMORY[0x263EFB220]);
          v19 = [v14 accountType];
          id v20 = (void *)[v18 initWithManagedAccountType:v19];

          v21 = [v14 valueForKey:@"granted"];
          uint64_t v22 = [v21 BOOLValue];

          uint64_t v23 = [v20 identifier];
          +[ACDTCCUtilities setTCCStateForClient:v17 accountTypeID:v23 toGranted:v22];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }
}

- (void)_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [(ACDDatabaseMigrator *)self _fetchAllAuthorizationEntitiesForModelVersion:a3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v18 = [v17 valueForKey:@"oldOptions"];
        v19 = (void *)[v18 mutableCopy];

        if (v19)
        {
          id v20 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v19 error:0];
          v21 = [v20 decodeObjectOfClasses:v11 forKey:@"options"];
          [v20 finishDecoding];
          if (v21)
          {
            [v17 setValue:v21 forKey:@"newOptions"];
          }
          else
          {
            uint64_t v22 = _ACDLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              [(ACDDatabaseMigrator *)&buf _migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:v22];
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)_migrateNameAttributeOfDataclassEntities
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [(ACDDatabaseMigrator *)self _fetchAllDataclassEntitles];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = [v7 valueForKey:@"oldName"];
        if (v8) {
          [v7 setValue:v8 forKey:@"newName"];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_fetchAllDataclassEntitles
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  uint64_t v3 = [MEMORY[0x263EFF240] entityForName:@"Dataclass" inManagedObjectContext:self->_migrationContext];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF260]);
    [v4 setEntity:v3];
    [v4 setReturnsObjectsAsFaults:0];
    migrationContext = self->_migrationContext;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__ACDDatabaseMigrator__fetchAllDataclassEntitles__block_invoke;
    v9[3] = &unk_264320A48;
    long long v11 = &v12;
    v9[4] = self;
    uint64_t v6 = v4;
    long long v10 = v6;
    [(NSManagedObjectContext *)migrationContext performBlockAndWait:v9];
  }
  else
  {
    uint64_t v6 = _ACDLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ACDDatabaseMigrator _fetchAllDataclassEntitles]();
    }
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __49__ACDDatabaseMigrator__fetchAllDataclassEntitles__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];

  return MEMORY[0x270F9A758]();
}

- (id)_fetchAllAuthorizationEntitiesForModelVersion:(int64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  id v4 = @"Authorization";
  if (a3 < 8) {
    id v4 = @"Permission";
  }
  if (a3 == 8) {
    uint64_t v5 = @"ClientAuthorization";
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = [MEMORY[0x263EFF240] entityForName:v5 inManagedObjectContext:self->_migrationContext];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF260]);
    [v7 setEntity:v6];
    [v7 setReturnsObjectsAsFaults:0];
    migrationContext = self->_migrationContext;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__ACDDatabaseMigrator__fetchAllAuthorizationEntitiesForModelVersion___block_invoke;
    v12[3] = &unk_264320A48;
    uint64_t v14 = &v15;
    v12[4] = self;
    long long v9 = v7;
    uint64_t v13 = v9;
    [(NSManagedObjectContext *)migrationContext performBlockAndWait:v12];
  }
  else
  {
    long long v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACDDatabaseMigrator _fetchAllAuthorizationEntitiesForModelVersion:]();
    }
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __69__ACDDatabaseMigrator__fetchAllAuthorizationEntitiesForModelVersion___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) executeFetchRequest:a1[5] error:0];

  return MEMORY[0x270F9A758]();
}

- (id)_setUpContextForMigration
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(ACDDatabaseMigrator *)(uint64_t)self _setUpContextForMigration];
  }

  id v4 = [(ACDDatabaseMigrator *)self _compatibleModelForStoreAtURL:self->_databaseURL];
  if (!v4)
  {
    uint64_t v8 = _ACDLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseMigrator _setUpContextForMigration]();
    }
    goto LABEL_10;
  }
  uint64_t v5 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v4];
  privateCoordinator = self->_privateCoordinator;
  self->_privateCoordinator = v5;

  uint64_t v7 = *MEMORY[0x263EFF008];
  v23[0] = *MEMORY[0x263EFF070];
  v23[1] = v7;
  v24[0] = MEMORY[0x263EFFA88];
  v24[1] = MEMORY[0x263EFFA88];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  long long v9 = self->_privateCoordinator;
  uint64_t v10 = *MEMORY[0x263EFF168];
  databaseURL = self->_databaseURL;
  id v22 = 0;
  id v12 = [(NSPersistentStoreCoordinator *)v9 addPersistentStoreWithType:v10 configuration:0 URL:databaseURL options:v8 error:&v22];
  id v13 = v22;
  if (v13)
  {
    uint64_t v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseMigrator _setUpContextForMigration]();
    }

LABEL_10:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  uint64_t v16 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  migrationContext = self->_migrationContext;
  self->_migrationContext = v16;

  id v18 = _ACDLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator _setUpContextForMigration]();
  }

  v19 = self->_migrationContext;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__ACDDatabaseMigrator__setUpContextForMigration__block_invoke;
  v21[3] = &unk_264320CF0;
  v21[4] = self;
  [(NSManagedObjectContext *)v19 performBlockAndWait:v21];
  uint64_t v15 = self->_migrationContext;
LABEL_14:

  return v15;
}

uint64_t __48__ACDDatabaseMigrator__setUpContextForMigration__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (id)_compatibleModelForStoreAtURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263EFF168];
  id v35 = 0;
  uint64_t v6 = [MEMORY[0x263EFF320] metadataForPersistentStoreOfType:v5 URL:a3 options:0 error:&v35];
  id v7 = v35;
  uint64_t v8 = 0;
  if (!v7)
  {
    uint64_t v30 = self;
    long long v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 pathForResource:@"accounts" ofType:@"momd"];

    long long v11 = [MEMORY[0x263F086E0] pathsForResourcesOfType:@"mom" inDirectory:v10];
    id v12 = _ACDLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACDDatabaseMigrator _compatibleModelForStoreAtURL:](v11);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v29 = v10;
      uint64_t v16 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v19 = _ACDLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            uint64_t v37 = v18;
            _os_log_debug_impl(&dword_2183AD000, v19, OS_LOG_TYPE_DEBUG, "\"Checking MOM at path: %@\"", buf, 0xCu);
          }

          id v20 = objc_alloc(MEMORY[0x263EFF298]);
          v21 = [NSURL fileURLWithPath:v18];
          uint64_t v8 = (void *)[v20 initWithContentsOfURL:v21];

          if ([v8 isConfiguration:0 compatibleWithStoreMetadata:v6])
          {
            id v22 = _ACDLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[ACDDatabaseMigrator _compatibleModelForStoreAtURL:]();
            }

            goto LABEL_18;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v38 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      uint64_t v8 = 0;
LABEL_18:
      uint64_t v10 = v29;
      id v7 = 0;
    }
    else
    {
      uint64_t v8 = 0;
    }

    if ([(ACDDatabaseMigrator *)v30 _versionForModel:v8] == 9)
    {
      [MEMORY[0x263F086E0] pathForResource:@"accounts-brighton-bridge" ofType:@"mom" inDirectory:v10];
      long long v24 = v23 = v10;
      id v25 = objc_alloc(MEMORY[0x263EFF298]);
      long long v26 = [NSURL fileURLWithPath:v24];
      uint64_t v27 = [v25 initWithContentsOfURL:v26];

      uint64_t v10 = v23;
      uint64_t v8 = (void *)v27;
    }
  }

  return v8;
}

- (int64_t)_versionForModel:(id)a3
{
  uint64_t v3 = [a3 versionIdentifiers];
  id v4 = [v3 anyObject];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)_postProcessMigrationFromVersion:(int64_t)a3 migrationData:(id)a4
{
  id v6 = a4;
  id v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseMigrator _postProcessMigrationFromVersion:migrationData:]();
  }

  if (a3 < 18 || a3 == 2401802)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke;
    v10[3] = &unk_264320E08;
    id v11 = v8;
    id v12 = self;
    id v13 = v6;
    id v9 = v8;
    [v9 performBlockAndWait:v10];
  }
}

void __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 40) + 32)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF2B0]) initWithMergeType:2];
  [v2 setMergePolicy:v3];

  id v4 = *(id *)(a1 + 48);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v23 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = [v6 objectForKeyedSubscript:@"objectID"];
        id v9 = [v7 existingObjectWithID:v8 error:0];

        if (v9)
        {
          uint64_t v24 = i;
          uint64_t v10 = [v6 objectForKeyedSubscript:@"properties"];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                uint64_t v16 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"AccountProperty" inManagedObjectContext:*(void *)(a1 + 32)];
                [v16 setKey:v15];
                uint64_t v17 = [v10 objectForKeyedSubscript:v15];
                [v16 setValue:v17];

                [v16 setOwner:v9];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v12);
          }

          uint64_t i = v24;
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }
  uint64_t v18 = *(void **)(a1 + 32);
  id v25 = 0;
  [v18 save:&v25];
  id v19 = v25;
  if (v19)
  {
    id v20 = _ACDLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke_cold_1();
    }
  }
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeOptions, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_privateCoordinator, 0);

  objc_storeStrong((id *)&self->_migrationContext, 0);
}

- (void)runReturningError:(char)a1 .cold.1(char a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"ACDDatabaseMigrator finished running! Result: %@\"", v4, v5, v6, v7, v8);
}

- (void)runReturningError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Unable to open database post-migration: %@\"", v2, v3, v4, v5, v6);
}

- (void)runReturningError:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Caught an exception while opening the persistent store post-migration: %@\"", v2, v3, v4, v5, v6);
}

- (void)runReturningError:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Attempting to open the store with auto-migration on.\"", v2, v3, v4, v5, v6);
}

- (void)runReturningError:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"ACDDatabaseMigrator will begin running...\"", v2, v3, v4, v5, v6);
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"All migrations are done. Saving context now.\"", v2, v3, v4, v5, v6);
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"There are %@ accounts.\"", v4, v5, v6, v7, v8);
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)a1 + 8) + 24)];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"The model version compatible with the pre-migration store is: %@.\"", v4, v5, v6, v7, v8);
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"Found %@ authorization entities.\"", v4, v5, v6, v7, v8);
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Moving all permission bits over to TCC...\"", v2, v3, v4, v5, v6);
}

- (void)_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Failed to transform old options attribute!\"", buf, 2u);
}

- (void)_fetchAllDataclassEntitles
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"No entity was found with name Dataclass.\"", v2, v3, v4, v5, v6);
}

- (void)_fetchAllAuthorizationEntitiesForModelVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"No entity was found with name: %@\"", v1, 0xCu);
}

- (void)_setUpContextForMigration
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "\"Setting up a context to migrate DB at path: %@\"", (uint8_t *)&v3, 0xCu);
}

- (void)_compatibleModelForStoreAtURL:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"That's the one!\"", v2, v3, v4, v5, v6);
}

- (void)_compatibleModelForStoreAtURL:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"Found %@ MOMs. Looking for match...\"", v4, v5, v6, v7, v8);
}

- (void)_postProcessMigrationFromVersion:migrationData:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Post-processing migration.\"", v2, v3, v4, v5, v6);
}

void __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Unable to save database post-migration: %@\"", v2, v3, v4, v5, v6);
}

@end