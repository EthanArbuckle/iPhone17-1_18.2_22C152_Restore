@interface IRPersistenceManager
+ (id)defaultModelsDirectory;
- (BOOL)_isStoreConnected;
- (BOOL)connectToStore;
- (BOOL)disconnectFromStore;
- (IRPersistenceManager)init;
- (IRPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4;
- (IRPersistenceStore)persistenceStore;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_getDefaultStoresDirectory;
- (id)createManagedObjectContext;
- (id)getLocalStoreURL;
- (void)_getDefaultStoresDirectory;
- (void)setPersistenceStore:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation IRPersistenceManager

- (IRPersistenceManager)init
{
  v3 = +[IRPersistenceManager defaultModelsDirectory];
  v4 = [(IRPersistenceManager *)self _getDefaultStoresDirectory];
  v5 = [(IRPersistenceManager *)self initWithModelsDirectory:v3 storesDirectory:v4];

  return v5;
}

- (IRPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isFileURL] || !objc_msgSend(v7, "isFileURL")) {
    goto LABEL_9;
  }
  v26.receiver = self;
  v26.super_class = (Class)IRPersistenceManager;
  self = [(IRPersistenceManager *)&v26 init];
  if (self)
  {
    v8 = NSURL;
    v9 = [v6 path];
    v10 = [v8 fileURLWithPath:v9 isDirectory:1];
    modelsDirectory = self->_modelsDirectory;
    self->_modelsDirectory = v10;

    v12 = NSURL;
    v13 = [v7 path];
    v14 = [v12 fileURLWithPath:v13 isDirectory:1];
    storesDirectory = self->_storesDirectory;
    self->_storesDirectory = v14;

    [(IRPersistenceManager *)self _enableConcurrencyDebug];
    v16 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:self->_modelsDirectory];
    managedObjectModel = self->_managedObjectModel;
    self->_managedObjectModel = v16;

    if (self->_managedObjectModel)
    {
      v18 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_managedObjectModel;
        v20 = v18;
        v21 = [(NSManagedObjectModel *)v19 versionIdentifiers];
        *(_DWORD *)buf = 138412290;
        v28 = v21;
        _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEFAULT, "#persistence-manager, Loaded ManagedObjectModel Version: %@", buf, 0xCu);
      }
      v22 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:self->_managedObjectModel];
      persistentStoreCoordinator = self->_persistentStoreCoordinator;
      self->_persistentStoreCoordinator = v22;

      self->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_8;
    }
LABEL_9:
    v24 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self = self;
  v24 = self;
LABEL_10:

  return v24;
}

- (id)getLocalStoreURL
{
  v2 = [(NSURL *)self->_storesDirectory URLByAppendingPathComponent:@"intelligentRouting"];
  v3 = [v2 URLByAppendingPathExtension:@"sqlite"];

  return v3;
}

- (BOOL)connectToStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(IRPersistenceManager *)self _isStoreConnected])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [IRPersistenceStore alloc];
    id v6 = [(IRPersistenceManager *)self getLocalStoreURL];
    id v7 = [(IRPersistenceStore *)v5 initWithURL:v6];
    persistenceStore = self->_persistenceStore;
    self->_persistenceStore = v7;

    BOOL v4 = [(IRPersistenceStore *)self->_persistenceStore loadWithCoordinator:self->_persistentStoreCoordinator];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)disconnectFromStore
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(IRPersistenceManager *)self _isStoreConnected])
  {
    BOOL v4 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStores];
    v5 = [v4 firstObject];

    persistentStoreCoordinator = self->_persistentStoreCoordinator;
    id v14 = 0;
    [(NSPersistentStoreCoordinator *)persistentStoreCoordinator removePersistentStore:v5 error:&v14];
    id v7 = v14;
    if (v7)
    {
      v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      v9 = (id)*MEMORY[0x263F50090];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v5 URL];
        *(_DWORD *)buf = 136315906;
        v16 = "#persistence-manager, ";
        __int16 v17 = 2112;
        v18 = v8;
        __int16 v19 = 2112;
        v20 = v10;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Persistence manager disconnect error] Failed to disconnect from store %@ with error %@", buf, 0x2Au);
      }
    }
    BOOL v11 = [(IRPersistenceManager *)self _isStoreConnected];

    char v12 = !v11;
  }
  else
  {
    char v12 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)createManagedObjectContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(IRPersistenceManager *)self _isStoreConnected])
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    v5 = [MEMORY[0x263EFF2B0] errorMergePolicy];
    [v4 setMergePolicy:v5];

    id v6 = [(IRPersistenceManager *)self persistentStoreCoordinator];
    [v4 setPersistentStoreCoordinator:v6];

    id v7 = [MEMORY[0x263F08AB0] processInfo];
    v8 = [v7 processName];
    [v4 setName:v8];

    v9 = [v4 name];
    [v4 setTransactionAuthor:v9];

    [v4 setUndoManager:0];
  }
  else
  {
    BOOL v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)defaultModelsDirectory
{
  v2 = NSURL;
  v3 = [MEMORY[0x263F086E0] IRFrameworkBundle];
  BOOL v4 = [v3 pathForResource:@"intelligentRouting" ofType:@"momd"];
  v5 = [v2 fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)_getDefaultStoresDirectory
{
  v2 = [MEMORY[0x263F08850] userLibraryDirectoryPath];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 stringByAppendingPathComponent:@"com.apple.intelligentroutingd"];
    v5 = [MEMORY[0x263F08850] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          id v7 = objc_claimAutoreleasedReturnValue(),
          id v14 = 0,
          int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14], v9 = v14, v7, v8)&& !v9)
    {
      v10 = [NSURL fileURLWithPath:v4 isDirectory:1];

      goto LABEL_12;
    }
    char v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      [(IRPersistenceManager *)(uint64_t)v4 _getDefaultStoresDirectory];
    }
  }
  else
  {
    BOOL v11 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRPersistenceManager _getDefaultStoresDirectory](v11);
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_isStoreConnected
{
  v2 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStores];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (IRPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);

  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

- (void)_getDefaultStoresDirectory
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#persistence-manager, [ErrorId - Store directory create error] Failed to create %@, error, %@", (uint8_t *)&v3, 0x16u);
}

@end