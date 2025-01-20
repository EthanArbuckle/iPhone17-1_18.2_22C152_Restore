@interface CLSDBCache
+ (BOOL)locationIsValidForDatabaseAtURL:(id)a3;
+ (id)defaultCacheName;
+ (id)urlWithParentURL:(id)a3;
- (BOOL)_save;
- (BOOL)save;
- (BOOL)supportsVersioning;
- (CLSDBCache)initWithURL:(id)a3;
- (CLSDBCache)initWithURL:(id)a3 dataModelName:(id)a4;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)dataModelName;
- (NSURL)diskCacheURL;
- (id)formatVersion;
- (id)initForTesting;
- (void)_resetCoreDataStack;
- (void)_saveAsync;
- (void)invalidateDiskCaches;
- (void)invalidateMemoryCaches;
- (void)setSupportsVersioning:(BOOL)a3;
@end

@implementation CLSDBCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_dataModelName, 0);
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
}

- (void)setSupportsVersioning:(BOOL)a3
{
  self->_supportsVersioning = a3;
}

- (BOOL)supportsVersioning
{
  return self->_supportsVersioning;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (NSString)dataModelName
{
  return self->_dataModelName;
}

- (void)invalidateMemoryCaches
{
  v3 = [(CLSDBCache *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__CLSDBCache_invalidateMemoryCaches__block_invoke;
  v4[3] = &unk_1E6910188;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

void __36__CLSDBCache_invalidateMemoryCaches__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 refreshAllObjects];

  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  [v3 reset];
}

- (void)invalidateDiskCaches
{
  id v3 = [(CLSDBCache *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CLSDBCache_invalidateDiskCaches__block_invoke;
  v4[3] = &unk_1E6910188;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

void __34__CLSDBCache_invalidateDiskCaches__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  uint64_t v4 = *MEMORY[0x1E4F1BE50];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  v6 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, v4, v5, *MEMORY[0x1E4F1BDE8], 0);

  v7 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  v8 = v7;
  if (v7)
  {
    uint64_t v26 = a1;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v7 persistentStores];
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    uint64_t v10 = *MEMORY[0x1E4F1BF70];
    if (v9)
    {
      uint64_t v11 = v9;
      id v12 = 0;
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        v15 = v12;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = [*(id *)(*((void *)&v30 + 1) + 8 * v14) URL];
          id v29 = v15;
          char v17 = [v8 destroyPersistentStoreAtURL:v16 withType:v10 options:v6 error:&v29];
          id v12 = v29;

          if ((v17 & 1) == 0)
          {
            v18 = +[CLSLogging sharedLogging];
            v19 = [v18 loggingConnection];

            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v35 = v12;
              _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Could not destroy persistent store for DBCache, %@", buf, 0xCu);
            }
          }
          ++v14;
          v15 = v12;
        }
        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
    }

    v20 = [*(id *)(v26 + 32) diskCacheURL];
    id v28 = v12;
    v21 = [v8 addPersistentStoreWithType:v10 configuration:0 URL:v20 options:v6 error:&v28];
    id v22 = v28;

    if (!v21)
    {
      v23 = +[CLSLogging sharedLogging];
      v24 = [v23 loggingConnection];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = [v22 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v35 = v25;
        _os_log_error_impl(&dword_1D2150000, v24, OS_LOG_TYPE_ERROR, "An error occured creating database store: \"%@\"", buf, 0xCu);
      }
      [*(id *)(v26 + 32) _resetCoreDataStack];
    }
  }
}

- (void)_resetCoreDataStack
{
  id obj = self;
  objc_sync_enter(obj);
  persistentStoreCoordinator = obj->_persistentStoreCoordinator;
  obj->_persistentStoreCoordinator = 0;

  managedObjectContext = obj->_managedObjectContext;
  obj->_managedObjectContext = 0;

  objc_sync_exit(obj);
}

- (void)_saveAsync
{
  id v3 = [(CLSDBCache *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__CLSDBCache__saveAsync__block_invoke;
  v4[3] = &unk_1E6910188;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __24__CLSDBCache__saveAsync__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _save];
  }
}

- (BOOL)save
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  int v3 = [(CLSDBCache *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__CLSDBCache_save__block_invoke;
  v5[3] = &unk_1E690F0D0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __18__CLSDBCache_save__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _save];
  }
}

- (BOOL)_save
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(CLSDBCache *)self managedObjectContext];
  id v9 = 0;
  char v3 = [v2 save:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    v5 = +[CLSLogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_error_impl(&dword_1D2150000, v6, OS_LOG_TYPE_ERROR, "An error occured saving parent context to the database: \"%@\"", buf, 0xCu);
    }
  }

  return 1;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  v54[2] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  persistentStoreCoordinator = v2->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    id v4 = persistentStoreCoordinator;
    goto LABEL_27;
  }
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  uint64_t v6 = *MEMORY[0x1E4F1BDE8];
  v53[0] = *MEMORY[0x1E4F1BE50];
  v53[1] = v6;
  v54[0] = MEMORY[0x1E4F1CC38];
  v54[1] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  uint64_t v8 = [(CLSDBCache *)v2 managedObjectModel];
  if (!v8)
  {
    id v35 = +[CLSLogging sharedLogging];
    uint64_t v14 = [v35 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, v14, OS_LOG_TYPE_ERROR, "An error occured when we get the managedObjectModel", buf, 2u);
    }
    id v27 = 0;
    id v4 = 0;
    goto LABEL_26;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v8];
  uint64_t v10 = v2->_persistentStoreCoordinator;
  v2->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v9;

  uint64_t v11 = NSString;
  uint64_t v12 = [(CLSDBCache *)v2 dataModelName];
  uint64_t v13 = [(NSURL *)v2->_diskCacheURL lastPathComponent];
  uint64_t v14 = [v11 stringWithFormat:@"%@.formatVersion.%@", v12, v13];

  v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v16 = [v15 stringForKey:v14];
  char v17 = [(CLSDBCache *)v2 formatVersion];
  int v18 = [v16 isEqualToString:v17];

  v19 = [(CLSDBCache *)v2 formatVersion];
  if (v19
    && (BOOL v20 = [(CLSDBCache *)v2 supportsVersioning], v19, ((v18 ^ 1) & v20) == 1))
  {
    uint64_t v51 = *MEMORY[0x1E4F1BDD8];
    uint64_t v52 = v5;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];

    int v22 = 1;
    v7 = (void *)v21;
  }
  else
  {
    int v22 = 0;
  }
  v23 = v2->_persistentStoreCoordinator;
  uint64_t v24 = *MEMORY[0x1E4F1BF70];
  diskCacheURL = v2->_diskCacheURL;
  id v48 = 0;
  uint64_t v26 = [(NSPersistentStoreCoordinator *)v23 addPersistentStoreWithType:v24 configuration:0 URL:diskCacheURL options:v7 error:&v48];
  id v27 = v48;
  if (v26)
  {
    if (v22)
    {
      [(CLSDBCache *)v2 invalidateDiskCaches];
      [(CLSDBCache *)v2 invalidateMemoryCaches];
      id v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v29 = [(CLSDBCache *)v2 formatVersion];
      [v28 setObject:v29 forKey:v14];

      long long v30 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v30 synchronize];

      long long v31 = +[CLSLogging sharedLogging];
      long long v32 = [v31 loggingConnection];

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2150000, v32, OS_LOG_TYPE_INFO, "Core Data database successfully cleared", buf, 2u);
      }
    }
    long long v33 = +[CLSLogging sharedLogging];
    p_super = [v33 loggingConnection];

    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2150000, p_super, OS_LOG_TYPE_INFO, "Core Data database successfully initialized", buf, 2u);
    }
  }
  else
  {
    v36 = +[CLSLogging sharedLogging];
    uint64_t v37 = [v36 loggingConnection];

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v27;
      _os_log_error_impl(&dword_1D2150000, v37, OS_LOG_TYPE_ERROR, "Cannot initialize Core Data database: \"%@\". Removing store", buf, 0xCu);
    }

    v38 = v2->_persistentStoreCoordinator;
    v39 = v2->_diskCacheURL;
    id v47 = v27;
    [(NSPersistentStoreCoordinator *)v38 destroyPersistentStoreAtURL:v39 withType:v24 options:0 error:&v47];
    id v40 = v47;

    v41 = v2->_persistentStoreCoordinator;
    v42 = v2->_diskCacheURL;
    id v46 = v40;
    uint64_t v26 = [(NSPersistentStoreCoordinator *)v41 addPersistentStoreWithType:v24 configuration:0 URL:v42 options:v7 error:&v46];
    id v27 = v46;

    if (v26) {
      goto LABEL_25;
    }
    v43 = +[CLSLogging sharedLogging];
    v44 = [v43 loggingConnection];

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v27;
      _os_log_error_impl(&dword_1D2150000, v44, OS_LOG_TYPE_ERROR, "Cannot initialize Core Data database even after removing store: \"%@\".", buf, 0xCu);
    }

    uint64_t v26 = 0;
    p_super = &v2->_persistentStoreCoordinator->super;
    v2->_persistentStoreCoordinator = 0;
  }

LABEL_25:
  id v4 = v2->_persistentStoreCoordinator;

LABEL_26:
LABEL_27:
  objc_sync_exit(v2);

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  managedObjectModel = v2->_managedObjectModel;
  if (managedObjectModel)
  {
    id v4 = managedObjectModel;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [(CLSDBCache *)v2 dataModelName];
    v7 = [v5 pathForResource:v6 ofType:@"momd"];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1C120]);
      uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
      uint64_t v10 = [v8 initWithContentsOfURL:v9];
      uint64_t v11 = v2->_managedObjectModel;
      v2->_managedObjectModel = (NSManagedObjectModel *)v10;
    }
    else
    {
      uint64_t v12 = +[CLSLogging sharedLogging];
      uint64_t v13 = [v12 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = [(CLSDBCache *)v2 dataModelName];
        int v16 = 138412290;
        char v17 = v15;
        _os_log_error_impl(&dword_1D2150000, v13, OS_LOG_TYPE_ERROR, "Failed to load a bundle containing \"%@\".", (uint8_t *)&v16, 0xCu);
      }
    }
    id v4 = v2->_managedObjectModel;
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = self;
  objc_sync_enter(v2);
  managedObjectContext = v2->_managedObjectContext;
  if (managedObjectContext)
  {
    id v4 = managedObjectContext;
  }
  else
  {
    uint64_t v5 = [(CLSDBCache *)v2 persistentStoreCoordinator];
    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
      v7 = v2->_managedObjectContext;
      v2->_managedObjectContext = (NSManagedObjectContext *)v6;

      [(NSManagedObjectContext *)v2->_managedObjectContext setUndoManager:0];
      [(NSManagedObjectContext *)v2->_managedObjectContext setPersistentStoreCoordinator:v5];
    }
    id v4 = v2->_managedObjectContext;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formatVersion
{
  v2 = NSString;
  char v3 = [(CLSDBCache *)self dataModelName];
  id v4 = [v2 stringWithFormat:@"%@Version", v3];

  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 infoDictionary];
  v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (CLSDBCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(id)objc_opt_class() locationIsValidForDatabaseAtURL:v7])
  {
    v12.receiver = self;
    v12.super_class = (Class)CLSDBCache;
    uint64_t v9 = [(CLSDBCache *)&v12 init];
    uint64_t v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_diskCacheURL, a3);
      objc_storeStrong((id *)&v10->_dataModelName, a4);
    }
  }
  else
  {

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)initForTesting
{
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = [v3 fileURLWithPath:v4];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v5 URLByAppendingPathComponent:v7];
  uint64_t v9 = [(CLSDBCache *)self initWithURL:v8 dataModelName:0];

  return v9;
}

- (CLSDBCache)initWithURL:(id)a3
{
  return [(CLSDBCache *)self initWithURL:a3 dataModelName:0];
}

+ (BOOL)locationIsValidForDatabaseAtURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  char v15 = 0;
  uint64_t v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5 isDirectory:&v15];

  if (v6)
  {
    if (!v15)
    {
      char v9 = 1;
      goto LABEL_12;
    }
    id v7 = +[CLSLogging sharedLogging];
    id v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v3;
      _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "Path \"%@\" specified for database already exists as a directory", buf, 0xCu);
    }
    char v9 = 0;
  }
  else
  {
    uint64_t v10 = [v3 URLByDeletingLastPathComponent];
    id v14 = 0;
    char v9 = [v4 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v8 = v14;
    if ((v9 & 1) == 0)
    {
      uint64_t v11 = +[CLSLogging sharedLogging];
      objc_super v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v3;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "Failed to create intermediate cache directories \"%@\": \"%@\"", buf, 0x16u);
      }
    }
  }

LABEL_12:
  return v9;
}

+ (id)urlWithParentURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(a1, "defaultCacheName", 0);
  char v6 = [v5 pathComponents];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    id v8 = v4;
    do
    {
      uint64_t v11 = 0;
      objc_super v12 = v8;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v8 = [v12 URLByAppendingPathComponent:*(void *)(*((void *)&v15 + 1) + 8 * v11)];

        ++v11;
        objc_super v12 = v8;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v8 URLByAppendingPathExtension:@"sqlite"];

  return v13;
}

+ (id)defaultCacheName
{
}

@end