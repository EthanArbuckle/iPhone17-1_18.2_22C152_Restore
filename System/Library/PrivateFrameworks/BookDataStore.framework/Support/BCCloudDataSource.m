@interface BCCloudDataSource
+ (id)_documentsDirectoryURL;
+ (id)_sharedLegacyRootDirectoryURL;
+ (id)_sharedRootDirectoryURL;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4 delegate:(id)a5;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6 delegate:(id)a7;
- (BCCloudDataSourceDelegate)delegate;
- (BOOL)_addStoreAtURL:(id)a3;
- (BOOL)_deleteDirectoryForStoreAtURL:(id)a3;
- (BOOL)_directoryExistsForStoreAtURL:(id)a3;
- (BOOL)_setupPersistentStoreWithRootDirectoryURL:(id)a3 legacyRootDirectoryURL:(id)a4 nameOnDisk:(id)a5;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_persistentStoreOptions;
- (void)_createDirectoryForStoreAtURL:(id)a3;
- (void)_logIf:(BOOL)a3 error:(id)a4 operation:(id)a5;
- (void)_migrateAndDestroyStoreAtLegacyURL:(id)a3 toModernURL:(id)a4;
- (void)_setupManagedObjectContext;
- (void)setDelegate:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation BCCloudDataSource

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCCloudDataSource;
  v5 = [(BCCloudDataSource *)&v12 init];
  if (v5)
  {
    v6 = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v4];
    persistentStoreCoordinator = v5->_persistentStoreCoordinator;
    v5->_persistentStoreCoordinator = v6;

    v8 = v5->_persistentStoreCoordinator;
    v9 = [(BCCloudDataSource *)v5 _persistentStoreOptions];
    id v10 = [(NSPersistentStoreCoordinator *)v8 addPersistentStoreWithType:NSInMemoryStoreType configuration:0 URL:0 options:v9 error:0];

    [(BCCloudDataSource *)v5 _setupManagedObjectContext];
  }

  return v5;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4
{
  return [(BCCloudDataSource *)self initWithManagedObjectModel:a3 nameOnDisk:a4 delegate:0];
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[BCCloudDataSource _sharedRootDirectoryURL];
  objc_super v12 = +[BCCloudDataSource _sharedLegacyRootDirectoryURL];
  v13 = [(BCCloudDataSource *)self initWithManagedObjectModel:v10 rootDirectoryURL:v11 legacyRootDirectoryURL:v12 nameOnDisk:v9 delegate:v8];

  return v13;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6
{
  return [(BCCloudDataSource *)self initWithManagedObjectModel:a3 rootDirectoryURL:a4 legacyRootDirectoryURL:a5 nameOnDisk:a6 delegate:0];
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  kdebug_trace();
  v24.receiver = self;
  v24.super_class = (Class)BCCloudDataSource;
  id v17 = [(BCCloudDataSource *)&v24 init];
  if (v17)
  {
    id v18 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v12];
    v19 = (void *)*((void *)v17 + 2);
    *((void *)v17 + 2) = v18;

    objc_storeWeak((id *)v17 + 3, v16);
    if ([v17 _setupPersistentStoreWithRootDirectoryURL:v13 legacyRootDirectoryURL:v14 nameOnDisk:v15]&& (objc_msgSend(*((id *)v17 + 2), "persistentStores"), v20 = objc_claimAutoreleasedReturnValue(), id v21 = objc_msgSend(v20, "count"), v20, v21))
    {
      [v17 _setupManagedObjectContext];
    }
    else
    {
      v22 = sub_1000083A0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1001E6F58((uint64_t *)v17 + 2, v22);
      }
    }
  }
  kdebug_trace();

  return (BCCloudDataSource *)v17;
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  v6 = [a1 _sharedLegacyRootDirectoryURL];
  [v5 removeItemAtURL:v6 error:0];

  v7 = +[NSFileManager defaultManager];
  id v8 = [a1 _sharedRootDirectoryURL];
  id v12 = 0;
  id v9 = [v7 removeItemAtURL:v8 error:&v12];
  id v10 = v12;

  v11 = (void (**)(id, id, id))objc_retainBlock(v4);
  if (v11) {
    v11[2](v11, v9, v10);
  }
}

+ (id)_documentsDirectoryURL
{
  return +[BDSAppGroupContainer documentsURL];
}

+ (id)_sharedRootDirectoryURL
{
  v2 = [a1 _documentsDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"BCCloudData-BookDataStoreService" isDirectory:1];

  return v3;
}

+ (id)_sharedLegacyRootDirectoryURL
{
  v2 = [a1 _documentsDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"BCCloudAsset-BookDataStoreService" isDirectory:1];

  return v3;
}

- (id)_persistentStoreOptions
{
  v4[0] = NSInferMappingModelAutomaticallyOption;
  v4[1] = NSMigratePersistentStoresAutomaticallyOption;
  v5[0] = &__kCFBooleanTrue;
  v5[1] = &__kCFBooleanTrue;
  v4[2] = NSPersistentHistoryTrackingKey;
  v5[2] = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (void)_logIf:(BOOL)a3 error:(id)a4 operation:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v6)
  {
    id v9 = sub_1000083A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001E6FD4((uint64_t)v8, v7, v9);
    }
  }
}

- (BOOL)_setupPersistentStoreWithRootDirectoryURL:(id)a3 legacyRootDirectoryURL:(id)a4 nameOnDisk:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 URLByAppendingPathComponent:v9 isDirectory:1];
  v11 = [v10 URLByAppendingPathComponent:v9 isDirectory:0];
  if (![(BCCloudDataSource *)self _directoryExistsForStoreAtURL:v11])
  {
    id v12 = [v8 URLByAppendingPathComponent:v9];
    [(BCCloudDataSource *)self _createDirectoryForStoreAtURL:v11];
    if ([(BCCloudDataSource *)self _directoryExistsForStoreAtURL:v12])
    {
      [(BCCloudDataSource *)self _migrateAndDestroyStoreAtLegacyURL:v12 toModernURL:v11];
    }
    else
    {
      id v13 = sub_1000083A0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to migrate legacy database since file does not exist at URL %@", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  if (!sub_10000C01C()) {
    goto LABEL_14;
  }
  id v14 = +[BUAppGroup books];
  id v15 = [v14 userDefaults];

  id v16 = [v15 stringForKey:@"BDSDevelopmentForceAddStoreFailureOnce"];
  if (![v16 isEqual:v9])
  {

LABEL_14:
    unsigned int v18 = [(BCCloudDataSource *)self _addStoreAtURL:v11];
    int v19 = 0;
    goto LABEL_15;
  }
  id v17 = sub_1000083A0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138543874;
    id v28 = v9;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL -- Forcing store failure once for %{public}@, url: %{mask.hash}@", (uint8_t *)&v27, 0x20u);
  }

  [v15 removeObjectForKey:@"BDSDevelopmentForceAddStoreFailureOnce"];
  unsigned int v18 = 0;
  int v19 = 1;
LABEL_15:
  v20 = sub_1000083A0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v11;
    __int16 v29 = 1024;
    LODWORD(v30) = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL: %@, storeAdded: %d", (uint8_t *)&v27, 0x12u);
  }

  if (v18) {
    goto LABEL_26;
  }
  id v21 = sub_1000083A0();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1001E70E4(v22);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    sub_1001E7128(v22);
  }

  if ([(BCCloudDataSource *)self _deleteDirectoryForStoreAtURL:v11])
  {
    [(BCCloudDataSource *)self _createDirectoryForStoreAtURL:v11];
    v23 = [(BCCloudDataSource *)self delegate];
    [v23 dataSource:self storeDidReset:v9];
  }
  if ([(BCCloudDataSource *)self _addStoreAtURL:v11])
  {
LABEL_26:
    BOOL v24 = 1;
  }
  else
  {
    v25 = sub_1000083A0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1001E70A0(v25);
    }

    BOOL v24 = 0;
  }

  return v24;
}

- (void)_setupManagedObjectContext
{
  v3 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v3;

  [(NSManagedObjectContext *)self->_managedObjectContext setPersistentStoreCoordinator:self->_persistentStoreCoordinator];
  v5 = self->_managedObjectContext;
  [(NSManagedObjectContext *)v5 setUndoManager:0];
}

- (BOOL)_directoryExistsForStoreAtURL:(id)a3
{
  v3 = [a3 URLByDeletingLastPathComponent];
  unsigned __int8 v4 = [v3 checkResourceIsReachableAndReturnError:0];

  return v4;
}

- (void)_createDirectoryForStoreAtURL:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  BOOL v6 = [v4 URLByDeletingLastPathComponent];

  id v8 = 0;
  LODWORD(v4) = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v7 = v8;

  [(BCCloudDataSource *)self _logIf:v4 ^ 1 error:v7 operation:@"creating directory for store"];
}

- (BOOL)_deleteDirectoryForStoreAtURL:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  BOOL v6 = [v4 URLByDeletingLastPathComponent];

  id v9 = 0;
  LODWORD(v4) = [v5 removeItemAtURL:v6 error:&v9];
  id v7 = v9;

  [(BCCloudDataSource *)self _logIf:v4 ^ 1 error:v7 operation:@"deleting directory for store"];
  return (char)v4;
}

- (void)_migrateAndDestroyStoreAtLegacyURL:(id)a3 toModernURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Migrating legacy cloud data source from %@ to %@", buf, 0x16u);
  }

  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  id v10 = [(BCCloudDataSource *)self _persistentStoreOptions];
  v11 = [(BCCloudDataSource *)self _persistentStoreOptions];
  id v19 = 0;
  unsigned int v12 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator replacePersistentStoreAtURL:v7 destinationOptions:v10 withPersistentStoreFromURL:v6 sourceOptions:v11 storeType:NSSQLiteStoreType error:&v19];
  id v13 = v19;

  [(BCCloudDataSource *)self _logIf:v12 ^ 1 error:v13 operation:@"[MIGRATE] migrate legacy store"];
  id v14 = sub_1000083A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Destroying legacy cloud data source at %@", buf, 0xCu);
  }

  id v15 = self->_persistentStoreCoordinator;
  id v18 = 0;
  unsigned int v16 = [(NSPersistentStoreCoordinator *)v15 destroyPersistentStoreAtURL:v6 withType:NSSQLiteStoreType options:0 error:&v18];
  id v17 = v18;
  [(BCCloudDataSource *)self _logIf:v16 ^ 1 error:v17 operation:@"[MIGRATE] destroy legacy store"];
}

- (BOOL)_addStoreAtURL:(id)a3
{
  id v4 = a3;
  v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding cloud data source persistent store for %@", buf, 0xCu);
  }
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  id v8 = [(BCCloudDataSource *)self _persistentStoreOptions];
  id v17 = 0;
  id v9 = [(NSPersistentStoreCoordinator *)persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v4 options:v8 error:&v17];
  id v10 = v17;

  if ([v9 isReadOnly])
  {
    v11 = self->_persistentStoreCoordinator;
    id v16 = 0;
    unsigned int v12 = [(NSPersistentStoreCoordinator *)v11 removePersistentStore:v9 error:&v16];
    id v13 = v16;
    [(BCCloudDataSource *)self _logIf:v12 ^ 1 error:v13 operation:@"removing read-only cloud data source persistent store"];

    uint64_t v14 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1002 userInfo:0];

    id v9 = 0;
    id v10 = (id)v14;
  }
  [(BCCloudDataSource *)self _logIf:v9 == 0 error:v10 operation:@"adding cloud data source persistent store"];

  return v9 != 0;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (BCCloudDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end