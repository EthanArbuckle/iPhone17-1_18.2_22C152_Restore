@interface VSSubscriptionPersistentContainer
- (BOOL)_setupPersistenceIfNeeded:(id *)a3;
- (BOOL)didSetupPersistence;
- (BOOL)skipMigration;
- (NSOperationQueue)migrationQueue;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)persistentStoreType;
- (NSURL)persistentStoreURL;
- (NSURL)subscriptionsPropertyListURL;
- (VSOptional)viewContext;
- (VSSubscriptionPersistentContainer)init;
- (void)_performBlock:(id)a3 andWait:(BOOL)a4;
- (void)_removePersistentStore;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)setDidSetupPersistence:(BOOL)a3;
- (void)setMigrationQueue:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setPersistentStoreType:(id)a3;
- (void)setPersistentStoreURL:(id)a3;
- (void)setSkipMigration:(BOOL)a3;
- (void)setSubscriptionsPropertyListURL:(id)a3;
- (void)setViewContext:(id)a3;
@end

@implementation VSSubscriptionPersistentContainer

- (VSSubscriptionPersistentContainer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSSubscriptionPersistentContainer;
  v2 = [(VSSubscriptionPersistentContainer *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    migrationQueue = v2->_migrationQueue;
    v2->_migrationQueue = v3;

    [(NSOperationQueue *)v2->_migrationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_migrationQueue setName:@"com.apple.VideoSubscriberAccount.SubscriptionMigration"];
    v5 = objc_alloc_init(VSOptional);
    viewContext = v2->_viewContext;
    v2->_viewContext = v5;
  }
  return v2;
}

- (NSString)persistentStoreType
{
  v2 = self->_persistentStoreType;
  if (!v2) {
    v2 = (NSString *)(id)*MEMORY[0x1E4F1BF70];
  }

  return v2;
}

- (NSURL)persistentStoreURL
{
  v2 = self->_persistentStoreURL;
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v4 = [v3 URLsForDirectory:14 inDomains:1];
    v5 = [v4 firstObject];

    v6 = [v5 URLByAppendingPathComponent:@"videosubscriptionsd" isDirectory:1];
    v2 = [v6 URLByAppendingPathComponent:@"VSSubscriptions.sqlite" isDirectory:0];

    if (!v2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to determine persistent store URL."];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The persistentStoreURL parameter must not be nil."];
      v2 = 0;
    }
  }

  return v2;
}

- (NSURL)subscriptionsPropertyListURL
{
  v2 = self->_subscriptionsPropertyListURL;
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v4 = [v3 URLsForDirectory:14 inDomains:1];
    v5 = [v4 firstObject];

    v6 = [v5 URLByAppendingPathComponent:@"com.apple.spotlight" isDirectory:1];
    v2 = [v6 URLByAppendingPathComponent:@"subscriptions.plist" isDirectory:0];

    if (!v2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to determine subscription plist URL."];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The subscriptionsPropertyListURL parameter must not be nil."];
      v2 = 0;
    }
  }

  return v2;
}

- (void)_removePersistentStore
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke;
  v2[3] = &unk_1E6BD28D8;
  v2[4] = self;
  [(VSSubscriptionPersistentContainer *)self performBlockAndWait:v2];
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) didSetupPersistence]) {
    [v3 unwrapObject:&__block_literal_global_41 error:&__block_literal_global_35];
  }
}

uint64_t __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vs_removeAllPersistentStores");
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3_cold_1();
  }
}

- (BOOL)_setupPersistenceIfNeeded:(id *)a3
{
  v63[1] = *MEMORY[0x1E4F143B8];
  if (![(VSSubscriptionPersistentContainer *)self didSetupPersistence])
  {
    v49 = a3;
    v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will setup persistence.", buf, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    objc_super v8 = [(VSSubscriptionPersistentContainer *)self subscriptionsPropertyListURL];
    v9 = [(VSSubscriptionPersistentContainer *)self persistentStoreURL];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C120], "vs_subscriptionModelForVersion:", 3);
    v54 = [(VSSubscriptionPersistentContainer *)self persistentStoreType];
    v11 = [v9 path];
    v53 = v8;
    uint64_t v12 = [v8 path];
    v13 = (void *)v12;
    if (v11 && v12)
    {
      id v14 = v11;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to obtain path for sqlite or plist stores."];
      if (!v11) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The sqlitePathOrNil parameter must not be nil."];
      }
      id v15 = v11;
      if (!v13) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The plistPathOrNil parameter must not be nil."];
      }
    }
    id v55 = v13;
    v16 = [v9 URLByDeletingLastPathComponent];
    if (!v16) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to determine container for SQL store."];
    }
    v17 = &off_1E6BD2000;
    v51 = v16;
    v18 = [v16 path];
    v19 = +[VSOptional optionalWithObject:v18];
    uint64_t v20 = [v19 forceUnwrapObject];

    char v60 = 0;
    v50 = (void *)v20;
    if ([v7 fileExistsAtPath:v20 isDirectory:&v60])
    {
      if (v60)
      {
        id v21 = 0;
        goto LABEL_26;
      }
      v24 = VSErrorLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.4(v24);
      }
      id v21 = 0;
    }
    else
    {
      v22 = VSDefaultLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v22, OS_LOG_TYPE_DEFAULT, "Will create container directory.", buf, 2u);
      }

      id v59 = 0;
      char v23 = [v7 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v59];
      id v21 = v59;
      if (v23)
      {
LABEL_26:
        v52 = (void *)v10;
        if (![v7 fileExistsAtPath:v55]
          || ([v7 fileExistsAtPath:v11] & 1) != 0
          || [(VSSubscriptionPersistentContainer *)self skipMigration])
        {
          v25 = VSDefaultLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v25, OS_LOG_TYPE_DEFAULT, "Did NOT migrate plist data.", buf, 2u);
          }
        }
        else
        {
          v37 = VSDefaultLogObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v37, OS_LOG_TYPE_DEFAULT, "Will migrate plist data.", buf, 2u);
          }

          v25 = objc_msgSend(MEMORY[0x1E4F1C120], "vs_subscriptionModelForVersion:", 0);
          id v58 = v21;
          v31 = [MEMORY[0x1E4F1C128] inferredMappingModelForSourceModel:v25 destinationModel:v10 error:&v58];
          id v38 = v58;

          if (!v31)
          {
            v45 = VSErrorLogObject();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:]();
            }

            BOOL v5 = 0;
            if (v49) {
              id *v49 = v38;
            }
            id v21 = v38;
            goto LABEL_39;
          }
          v39 = v38;
          v47 = v38;
          v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C138]) initWithSourceModel:v25 destinationModel:v10];
          uint64_t v41 = VSSubscriptionPropertyListStoreType();
          uint64_t v62 = *MEMORY[0x1E4F1BF20];
          v63[0] = MEMORY[0x1E4F1CC38];
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
          id v57 = v39;
          v48 = v40;
          v43 = (void *)v41;
          LODWORD(v40) = [v40 migrateStoreFromURL:v53 type:v41 options:v42 withMappingModel:v31 toDestinationURL:v9 destinationType:v54 destinationOptions:0 error:&v57];
          id v21 = v57;

          if (!v40)
          {
            v46 = VSErrorLogObject();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:]();
            }

            if (v49) {
              id *v49 = v21;
            }

            BOOL v5 = 0;
            goto LABEL_39;
          }
          v44 = VSDefaultLogObject();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v44, OS_LOG_TYPE_DEFAULT, "Migration of plist data completed successfully.", buf, 2u);
          }

          uint64_t v10 = (uint64_t)v52;
          v17 = &off_1E6BD2000;
        }
        v26 = v21;

        v27 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v10];
        persistentStoreCoordinator = self->_persistentStoreCoordinator;
        self->_persistentStoreCoordinator = v27;

        v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v29 = MEMORY[0x1E4F1CC38];
        [v25 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BDE8]];
        [v25 setObject:v29 forKey:*MEMORY[0x1E4F1BE50]];
        v30 = self->_persistentStoreCoordinator;
        id v56 = v21;
        v31 = [(NSPersistentStoreCoordinator *)v30 addPersistentStoreWithType:v54 configuration:0 URL:v9 options:v25 error:&v56];
        id v21 = v56;

        BOOL v5 = v31 != 0;
        if (v31)
        {
          v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
          [v32 setPersistentStoreCoordinator:self->_persistentStoreCoordinator];
          v33 = [v17[137] optionalWithObject:v32];
          [(VSSubscriptionPersistentContainer *)self setViewContext:v33];

          [(VSSubscriptionPersistentContainer *)self setDidSetupPersistence:1];
          v34 = VSDefaultLogObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v34, OS_LOG_TYPE_DEFAULT, "Did setup persistence.", buf, 2u);
          }
        }
        else
        {
          v35 = VSErrorLogObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:]();
          }

          if (v49) {
            id *v49 = v21;
          }
        }
LABEL_39:

        return v5;
      }
      v24 = VSErrorLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.5();
      }
    }

    goto LABEL_26;
  }
  return 1;
}

- (void)_performBlock:(id)a3 andWait:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E0173AA0]();
  objc_super v8 = [(VSSubscriptionPersistentContainer *)self migrationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke;
  v10[3] = &unk_1E6BD4298;
  v10[4] = self;
  BOOL v12 = v4;
  id v9 = v6;
  id v11 = v9;
  [v8 addOperationWithBlock:v10];
  if (v4) {
    [v8 waitUntilAllOperationsAreFinished];
  }
}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E0173AA0]();
  id v3 = *(void **)(a1 + 32);
  id v21 = 0;
  int v4 = [v3 _setupPersistenceIfNeeded:&v21];
  id v5 = v21;
  id v6 = v5;
  if (v4)
  {
    id v7 = [*(id *)(a1 + 32) viewContext];
    objc_super v8 = [v7 forceUnwrapObject];

    if (*(unsigned char *)(a1 + 48))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_2;
      v18[3] = &unk_1E6BD2C88;
      id v9 = &v20;
      id v10 = *(id *)(a1 + 40);
      id v11 = &v19;
      v19 = v8;
      id v20 = v10;
      [v8 performBlockAndWait:v18];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_3;
      v15[3] = &unk_1E6BD2C88;
      id v9 = &v17;
      id v14 = *(id *)(a1 + 40);
      id v11 = &v16;
      v16 = v8;
      id v17 = v14;
      [v8 performBlock:v15];
    }

    id v13 = *v9;
  }
  else
  {
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
    }
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = v6;
    objc_super v8 = +[VSFailable failableWithError:v13];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);
  }
}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[VSFailable failableWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[VSFailable failableWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)performBlock:(id)a3
{
}

- (void)performBlockAndWait:(id)a3
{
}

- (NSOperationQueue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
}

- (BOOL)didSetupPersistence
{
  return self->_didSetupPersistence;
}

- (void)setDidSetupPersistence:(BOOL)a3
{
  self->_didSetupPersistence = a3;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (VSOptional)viewContext
{
  return self->_viewContext;
}

- (void)setViewContext:(id)a3
{
}

- (BOOL)skipMigration
{
  return self->_skipMigration;
}

- (void)setSkipMigration:(BOOL)a3
{
  self->_skipMigration = a3;
}

- (void)setPersistentStoreType:(id)a3
{
}

- (void)setPersistentStoreURL:(id)a3
{
}

- (void)setSubscriptionsPropertyListURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsPropertyListURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreType, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->_migrationQueue, 0);
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error unwrapping context: %@", v2, v3, v4, v5, v6);
}

- (void)_setupPersistenceIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error adding persistent store: %@", v2, v3, v4, v5, v6);
}

- (void)_setupPersistenceIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to infer mapping model: %@", v2, v3, v4, v5, v6);
}

- (void)_setupPersistenceIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to migrate store: %@", v2, v3, v4, v5, v6);
}

- (void)_setupPersistenceIfNeeded:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Container file exists, but is not a directory.", v1, 2u);
}

- (void)_setupPersistenceIfNeeded:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to create container directory: %@", v2, v3, v4, v5, v6);
}

@end