@interface ACDDatabaseConnection
+ (ACDDatabaseConnection)new;
- (ACDDatabaseConnection)init;
- (ACDDatabaseConnection)initWithPersistentStoreCoordinator:(id)a3;
- (ACDDatabaseConnectionDelegate)delegate;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)saveWithError:(id *)a3 rollbackOnFailure:(BOOL)a4;
- (NSManagedObjectContext)managedObjectContext;
- (NSNumber)keychainVersion;
- (NSNumber)version;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_accountPropertyWithKey:(id)a3 owner:(id)a4;
- (id)_managedObjectContextModificationDescription;
- (id)_managedObjectModel;
- (id)_managedObjectModificationDescription:(id)a3;
- (id)_persistentStore;
- (id)existingObjectWithURI:(id)a3;
- (id)fetchObjectsForEntityNamed:(id)a3;
- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4;
- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5;
- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5 prefetchKeypaths:(id)a6;
- (id)insertNewObjectForEntityForName:(id)a3;
- (id)managedObjectIDForURI:(id)a3;
- (id)objectForObjectURI:(id)a3;
- (unint64_t)countOfEntityNamed:(id)a3 withPredicate:(id)a4;
- (void)_beginObservingManagedObjectContextDidSaveNotifications;
- (void)_delegate_databaseConnectionEncounteredUnrecoverableError:(id)a3;
- (void)_endObservingManagedObjectContextDidSaveNotifications;
- (void)_handleManagedObjectContextError:(id)a3;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_setupManagedObjectContextWithPersistentStoreCoodinator:(id)a3;
- (void)_traceDatabaseEvents;
- (void)dealloc;
- (void)deleteAccountPropertyWithKey:(id)a3 owner:(id)a4;
- (void)deleteObject:(id)a3;
- (void)rollback;
- (void)setAccountPropertyWithKey:(id)a3 value:(id)a4 owner:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setKeychainVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ACDDatabaseConnection

void __81__ACDDatabaseConnection__setupManagedObjectContextWithPersistentStoreCoodinator___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF2B0]) initWithMergeType:2];
  [v2 setMergePolicy:v3];

  [*(id *)(*(void *)(a1 + 32) + 32) setPersistentStoreCoordinator:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) userInfo];
  [v4 setObject:MEMORY[0x263EFFA88] forKey:@"ACDManagedObjectContextIsAccountsContext"];
}

- (void)setDelegate:(id)a3
{
}

- (ACDDatabaseConnection)initWithPersistentStoreCoordinator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDDatabaseConnection;
  v6 = [(ACDDatabaseConnection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentStoreCoordinator, a3);
    uint64_t v8 = objc_opt_new();
    cache = v7->_cache;
    v7->_cache = (NSCache *)v8;

    [(NSCache *)v7->_cache setName:@"ACDDabaseConnectionCache"];
    [(ACDDatabaseConnection *)v7 _setupManagedObjectContextWithPersistentStoreCoodinator:v5];
    [(ACDDatabaseConnection *)v7 _beginObservingManagedObjectContextDidSaveNotifications];
  }

  return v7;
}

- (void)_setupManagedObjectContextWithPersistentStoreCoodinator:(id)a3
{
  id v4 = a3;
  id v5 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v5;

  v7 = self->_managedObjectContext;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ACDDatabaseConnection__setupManagedObjectContextWithPersistentStoreCoodinator___block_invoke;
  v9[3] = &unk_264320D40;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NSManagedObjectContext *)v7 performBlockAndWait:v9];
}

- (void)_beginObservingManagedObjectContextDidSaveNotifications
{
  if (self->_managedObjectContextDidSaveObserver)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ACDDatabaseConnection.m" lineNumber:442 description:@"Attempt to begin observing MoC notifications with an existing observer!"];
  }
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFF040];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__ACDDatabaseConnection__beginObservingManagedObjectContextDidSaveNotifications__block_invoke;
  v9[3] = &unk_264321BC0;
  objc_copyWeak(&v10, &location);
  id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v9];
  managedObjectContextDidSaveObserver = self->_managedObjectContextDidSaveObserver;
  self->_managedObjectContextDidSaveObserver = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5 prefetchKeypaths:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x263EFF240];
  v13 = [(ACDDatabaseConnection *)self managedObjectContext];
  v14 = [v12 entityForName:v9 inManagedObjectContext:v13];

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x263EFF260]);
    [v15 setEntity:v14];
    [v15 setReturnsObjectsAsFaults:0];
    if (v10) {
      [v15 setPredicate:v10];
    }
    if (v11)
    {
      v16 = [MEMORY[0x263EFF8C0] arrayWithObject:v11];
      [v15 setSortDescriptors:v16];
    }
    v17 = NSString;
    v18 = [v10 predicateFormat];
    v19 = [v11 key];
    v20 = [v17 stringWithFormat:@"%@:%@:%@%d", v9, v18, v19, objc_msgSend(v11, "ascending")];

    id v21 = [(NSCache *)self->_cache objectForKey:v20];
    if (!v21)
    {
      v22 = [(ACDDatabaseConnection *)self managedObjectContext];
      id v39 = 0;
      id v21 = [v22 executeFetchRequest:v15 error:&v39];
      id v23 = v39;

      if (v21)
      {
        id v31 = v23;
        v32 = v20;
        id v33 = v10;
        id v34 = v9;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v21 = v21;
        uint64_t v24 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v36 != v26) {
                objc_enumerationMutation(v21);
              }
              uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              v29 = [(ACDDatabaseConnection *)self managedObjectContext];
              [v29 refreshObject:v28 mergeChanges:1];
            }
            uint64_t v25 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v25);
        }

        v20 = v32;
        [(NSCache *)self->_cache setObject:v21 forKey:v32];
        id v10 = v33;
        id v9 = v34;
        id v23 = v31;
      }
      else
      {
        [(ACDDatabaseConnection *)self _handleManagedObjectContextError:v23];
      }
    }
  }
  else
  {
    v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:]();
    }
    id v21 = 0;
  }

  return v21;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4
{
  return [(ACDDatabaseConnection *)self fetchObjectsForEntityNamed:a3 withPredicate:a4 sortDescriptor:0 prefetchKeypaths:0];
}

- (id)existingObjectWithURI:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDDatabaseConnection *)self managedObjectContext];
  v6 = [v5 persistentStoreCoordinator];
  v7 = [v6 managedObjectIDForURIRepresentation:v4];

  if (v7)
  {
    id v8 = [(ACDDatabaseConnection *)self managedObjectContext];
    id v16 = 0;
    id v9 = [v8 existingObjectWithID:v7 error:&v16];
    id v10 = v16;

    if (!v9) {
      [(ACDDatabaseConnection *)self _handleManagedObjectContextError:v10];
    }
    if (v10)
    {
      id v11 = _ACDLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ACDDatabaseConnection existingObjectWithURI:]();
      }
    }
    v12 = [(ACDDatabaseConnection *)self managedObjectContext];
    v13 = [v12 deletedObjects];
    int v14 = [v13 containsObject:v9];

    if (v14)
    {

      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)managedObjectIDForURI:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDDatabaseConnection *)self managedObjectContext];
  v6 = [v5 persistentStoreCoordinator];
  v7 = [v6 managedObjectIDForURIRepresentation:v4];

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_managedObjectContextDidSaveObserver, 0);
}

- (void)dealloc
{
  [(ACDDatabaseConnection *)self _endObservingManagedObjectContextDidSaveNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ACDDatabaseConnection;
  [(ACDDatabaseConnection *)&v3 dealloc];
}

- (void)_endObservingManagedObjectContextDidSaveNotifications
{
  if (!self->_managedObjectContextDidSaveObserver)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"ACDDatabaseConnection.m" lineNumber:480 description:@"Attempt to end observing MoC notifications without an observer!"];
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self->_managedObjectContextDidSaveObserver];
}

+ (ACDDatabaseConnection)new
{
  return 0;
}

- (ACDDatabaseConnection)init
{
  return 0;
}

- (NSNumber)version
{
  v2 = [(ACDDatabaseConnection *)self _persistentStore];
  objc_super v3 = [v2 metadata];

  id v4 = [v3 objectForKeyedSubscript:@"ACAccountTypeVersion"];

  return (NSNumber *)v4;
}

- (NSNumber)keychainVersion
{
  v2 = [(ACDDatabaseConnection *)self _persistentStore];
  objc_super v3 = [v2 metadata];

  id v4 = [v3 objectForKeyedSubscript:@"ACKeychainVersion"];

  return (NSNumber *)v4;
}

- (id)_managedObjectModel
{
  return [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator managedObjectModel];
}

- (id)_persistentStore
{
  id v4 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStores];
  if ([v4 count] != 1)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    [v7 handleFailureInMethod:a2, self, @"ACDDatabaseConnection.m", 95, @"Unexpected number of persistent stores (%@), expected 1", v8 object file lineNumber description];
  }
  id v5 = [v4 firstObject];

  return v5;
}

- (void)setVersion:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACDDatabaseConnection.m", 103, @"Invalid parameter not satisfying: %@", @"version" object file lineNumber description];
  }
  id v5 = [(ACDDatabaseConnection *)self _persistentStore];
  v6 = [v5 metadata];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v10 forKeyedSubscript:@"ACAccountTypeVersion"];
  id v8 = [(ACDDatabaseConnection *)self _persistentStore];
  [v8 setMetadata:v7];
}

- (void)setKeychainVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDDatabaseConnection *)self _persistentStore];
  v6 = [v5 metadata];
  id v8 = (id)[v6 mutableCopy];

  [v8 setObject:v4 forKeyedSubscript:@"ACKeychainVersion"];
  v7 = [(ACDDatabaseConnection *)self _persistentStore];
  [v7 setMetadata:v8];
}

- (id)fetchObjectsForEntityNamed:(id)a3
{
  return [(ACDDatabaseConnection *)self fetchObjectsForEntityNamed:a3 withPredicate:0 sortDescriptor:0 prefetchKeypaths:0];
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5
{
  return [(ACDDatabaseConnection *)self fetchObjectsForEntityNamed:a3 withPredicate:a4 sortDescriptor:a5 prefetchKeypaths:0];
}

- (id)objectForObjectURI:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDDatabaseConnection *)self managedObjectContext];
  v6 = [v5 persistentStoreCoordinator];
  v7 = [v6 managedObjectIDForURIRepresentation:v4];

  if (v7)
  {
    id v8 = [(ACDDatabaseConnection *)self managedObjectContext];
    id v9 = [v8 objectWithID:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfEntityNamed:(id)a3 withPredicate:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263EFF240];
  id v8 = a3;
  id v9 = [(ACDDatabaseConnection *)self managedObjectContext];
  id v10 = [v7 entityForName:v8 inManagedObjectContext:v9];

  id v11 = objc_alloc_init(MEMORY[0x263EFF260]);
  [v11 setEntity:v10];
  if (v6) {
    [v11 setPredicate:v6];
  }
  v12 = [(ACDDatabaseConnection *)self managedObjectContext];
  id v16 = 0;
  unint64_t v13 = [v12 countForFetchRequest:v11 error:&v16];
  id v14 = v16;

  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    [(ACDDatabaseConnection *)self _handleManagedObjectContextError:v14];
  }

  return v13;
}

- (id)_accountPropertyWithKey:(id)a3 owner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"key = %@ AND owner = %@", v6, v7];
  id v9 = [(ACDDatabaseConnection *)self fetchObjectsForEntityNamed:@"AccountProperty" withPredicate:v8];

  if ([v9 count])
  {
    if ((unint64_t)[v9 count] >= 2)
    {
      id v10 = _ACDLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ACDDatabaseConnection _accountPropertyWithKey:owner:]((uint64_t)v6, v7, v10);
      }

      if ((unint64_t)[v9 count] >= 2)
      {
        unint64_t v11 = 1;
        do
        {
          v12 = [v9 objectAtIndexedSubscript:v11];
          [(ACDDatabaseConnection *)self deleteObject:v12];

          unint64_t v13 = [v9 objectAtIndexedSubscript:v11];
          [v7 removeCustomPropertiesObject:v13];

          ++v11;
        }
        while ([v9 count] > v11);
      }
    }
    id v14 = [v9 objectAtIndexedSubscript:0];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)insertNewObjectForEntityForName:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  id v6 = [(ACDDatabaseConnection *)self managedObjectContext];
  id v7 = [v4 insertNewObjectForEntityForName:v5 inManagedObjectContext:v6];

  [(NSCache *)self->_cache removeAllObjects];

  return v7;
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDDatabaseConnection *)self managedObjectContext];
  [v5 deleteObject:v4];

  cache = self->_cache;

  [(NSCache *)cache removeAllObjects];
}

- (void)deleteAccountPropertyWithKey:(id)a3 owner:(id)a4
{
  id v7 = a4;
  id v6 = -[ACDDatabaseConnection _accountPropertyWithKey:owner:](self, "_accountPropertyWithKey:owner:", a3);
  if (v6)
  {
    [(ACDDatabaseConnection *)self deleteObject:v6];
    [v7 removeCustomPropertiesObject:v6];
  }
}

- (void)setAccountPropertyWithKey:(id)a3 value:(id)a4 owner:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACDDatabaseConnection *)self _accountPropertyWithKey:v11 owner:v9];
  if (v10
    || (-[ACDDatabaseConnection insertNewObjectForEntityForName:](self, "insertNewObjectForEntityForName:", @"AccountProperty"), id v10 = objc_claimAutoreleasedReturnValue(), [v10 setValue:v11 forKey:@"key"], objc_msgSend(v10, "setValue:forKey:", v9, @"owner"), objc_msgSend(v9, "addCustomPropertiesObject:", v10), v10))
  {
    [v10 setValue:v8 forKey:@"value"];
  }
  [(NSCache *)self->_cache removeAllObjects];
}

- (BOOL)saveWithError:(id *)a3
{
  return [(ACDDatabaseConnection *)self saveWithError:a3 rollbackOnFailure:0];
}

- (BOOL)saveWithError:(id *)a3 rollbackOnFailure:(BOOL)a4
{
  BOOL v4 = a4;
  v12[3] = *(id *)MEMORY[0x263EF8340];
  [(ACDDatabaseConnection *)self _traceDatabaseEvents];
  managedObjectContext = self->_managedObjectContext;
  v12[0] = 0;
  BOOL v8 = [(NSManagedObjectContext *)managedObjectContext save:v12];
  id v9 = v12[0];
  if (v9)
  {
    id v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseConnection saveWithError:rollbackOnFailure:](v9, v10);
    }

    [(ACDDatabaseConnection *)self _handleManagedObjectContextError:v9];
    if (a3) {
      *a3 = v9;
    }
    if (v4) {
      [(NSManagedObjectContext *)self->_managedObjectContext rollback];
    }
  }
  [(NSCache *)self->_cache removeAllObjects];

  return v8;
}

- (void)rollback
{
  objc_super v3 = [(ACDDatabaseConnection *)self managedObjectContext];
  [v3 rollback];

  cache = self->_cache;

  [(NSCache *)cache removeAllObjects];
}

- (void)_handleManagedObjectContextError:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "ac_isUnrecoverableDatabaseError"))
  {
    BOOL v4 = [v5 localizedDescription];
    +[ACDAutoBugCapture triggerAutoBugCaptureWithType:0x26C992EA0 subType:0x26C992EE0 subtypeContext:v4 detectedProcess:0];

    [(ACDDatabaseConnection *)self _delegate_databaseConnectionEncounteredUnrecoverableError:v5];
  }
}

- (void)_traceDatabaseEvents
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v3 = +[ACDEventLedger sharedLedger];
  BOOL v4 = [(ACDDatabaseConnection *)self _managedObjectContextModificationDescription];
  [v3 recordEvent:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(NSManagedObjectContext *)self->_managedObjectContext deletedObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v12 = [MEMORY[0x263EFB220] allIdentifiers];
          unint64_t v13 = [v11 identifier];
          int v14 = [v12 containsObject:v13];

          if (v14)
          {
            v15 = [v11 accounts];
            uint64_t v16 = [v15 count];

            if (v16)
            {
              v17 = NSString;
              v18 = [v11 identifier];
              v19 = [v17 stringWithFormat:@"Attempted to remove account type '%@' while an account with that type still exists", v18];

              v20 = +[ACDEventLedger sharedLedger];
              [v20 simulateCrashWithMessage:v19];
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (id)_managedObjectContextModificationDescription
{
  objc_super v3 = objc_opt_new();
  BOOL v4 = [(NSManagedObjectContext *)self->_managedObjectContext insertedObjects];
  id v5 = [v4 allObjects];

  if ([v5 count])
  {
    [v3 appendString:@"Inserted:\n"];
    if ([v5 count])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
        uint64_t v8 = [(ACDDatabaseConnection *)self _managedObjectModificationDescription:v7];
        [v3 appendString:v8];

        if ([v5 count] - 1 > v6) {
          [v3 appendString:@",\n"];
        }
        ++v6;
      }
      while ([v5 count] > v6);
    }
  }
  uint64_t v9 = [(NSManagedObjectContext *)self->_managedObjectContext deletedObjects];
  id v10 = [v9 allObjects];

  if ([v10 count])
  {
    if ([v3 length]) {
      [v3 appendString:@"\n"];
    }
    [v3 appendString:@"Deleted:\n"];
    if ([v10 count])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [v10 objectAtIndexedSubscript:v11];
        unint64_t v13 = [(ACDDatabaseConnection *)self _managedObjectModificationDescription:v12];
        [v3 appendString:v13];

        if ([v10 count] - 1 > v11) {
          [v3 appendString:@", "];
        }
        ++v11;
      }
      while ([v10 count] > v11);
    }
  }
  int v14 = [(NSManagedObjectContext *)self->_managedObjectContext updatedObjects];
  v15 = [v14 allObjects];

  if ([v15 count])
  {
    if ([v3 length]) {
      [v3 appendString:@"\n"];
    }
    [v3 appendString:@"Updated:\n"];
    if ([v15 count])
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v15 objectAtIndexedSubscript:v16];
        v18 = [(ACDDatabaseConnection *)self _managedObjectModificationDescription:v17];
        [v3 appendString:v18];

        if ([v15 count] - 1 > v16) {
          [v3 appendString:@",\n"];
        }
        ++v16;
      }
      while ([v15 count] > v16);
    }
  }

  return v3;
}

- (id)_managedObjectModificationDescription:(id)a3
{
  objc_super v3 = NSString;
  id v4 = a3;
  id v5 = [v4 entity];
  unint64_t v6 = [v5 managedObjectClassName];
  uint64_t v7 = [v4 objectID];
  uint64_t v8 = [v7 URIRepresentation];
  uint64_t v9 = [v8 absoluteString];
  char v10 = ACIsInternal();
  unint64_t v11 = [v4 changedValues];

  if (v10)
  {
    v12 = [v3 stringWithFormat:@"<%@:%@> changes:(%@)", v6, v9, v11];
  }
  else
  {
    unint64_t v13 = [v11 allKeys];
    int v14 = [v13 componentsJoinedByString:@", "];
    v12 = [v3 stringWithFormat:@"<%@:%@> changes:(%@)", v6, v9, v14];
  }

  return v12;
}

void __80__ACDDatabaseConnection__beginObservingManagedObjectContextDidSaveNotifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _managedObjectContextDidSave:v3];
}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ACDDatabaseConnection.m", 452, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  unint64_t v6 = [v5 object];
  uint64_t v7 = [(ACDDatabaseConnection *)self managedObjectContext];

  if (v6 != v7)
  {
    uint64_t v8 = [v5 object];
    uint64_t v9 = [v8 userInfo];
    char v10 = [v9 objectForKey:@"ACDManagedObjectContextIsAccountsContext"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      v12 = [v5 userInfo];
      unint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFF018]];
      if ([v13 count])
      {
      }
      else
      {
        int v14 = [v5 userInfo];
        v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263EFEFE8]];
        uint64_t v16 = [v15 count];

        if (!v16)
        {
          char v17 = 0;
          goto LABEL_9;
        }
      }
      [(NSCache *)self->_cache removeAllObjects];
      char v17 = 1;
LABEL_9:
      v18 = [(ACDDatabaseConnection *)self managedObjectContext];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __54__ACDDatabaseConnection__managedObjectContextDidSave___block_invoke;
      v20[3] = &unk_264321BE8;
      v20[4] = self;
      char v22 = v17;
      id v21 = v5;
      [v18 performBlock:v20];
    }
  }
}

void __54__ACDDatabaseConnection__managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) managedObjectContext];
    [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
  }
}

- (void)_delegate_databaseConnectionEncounteredUnrecoverableError:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    unint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"ACDDatabaseConnection.m", 488, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v5 = [(ACDDatabaseConnection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 databaseConnection:self encounteredUnrecoverableError:v7];
  }
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (ACDDatabaseConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACDDatabaseConnectionDelegate *)WeakRetained;
}

- (void)fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Got nil entityDescription for %@\"", v2, v3, v4, v5, v6);
}

- (void)existingObjectWithURI:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"-[ACDDatabaseConnection existingObjectWithURI:] failed to fetch managed object at %@\"", v2, v3, v4, v5, v6);
}

- (void)existingObjectWithURI:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"-[ACDDatabaseConnection existingObjectWithURI:] called with an invalid URI %@. \"", v2, v3, v4, v5, v6);
}

- (void)_accountPropertyWithKey:(NSObject *)a3 owner:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 objectID];
  uint8_t v6 = [v5 URIRepresentation];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  char v10 = v6;
  _os_log_error_impl(&dword_2183AD000, a3, OS_LOG_TYPE_ERROR, "\"There are more than one account property with the key '%@' for object '%@'. Deleting duplicates...\"", (uint8_t *)&v7, 0x16u);
}

- (void)saveWithError:(void *)a1 rollbackOnFailure:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Could not save context: %@\"", v4, 0xCu);
}

@end