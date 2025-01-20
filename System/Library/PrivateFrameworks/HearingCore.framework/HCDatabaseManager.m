@interface HCDatabaseManager
- (BOOL)saveIfPossible;
- (HCDatabaseManager)init;
- (NSManagedObjectContext)managedObjectContext;
- (id)apsConnectionMachServiceName;
- (id)cloudKitContainer;
- (id)containerIdentifier;
- (id)databaseFilePath;
- (id)managedObjectModelName;
- (void)contentDidUpdate:(id)a3;
- (void)dealloc;
- (void)setManagedObjectContext:(id)a3;
- (void)setupDatabase;
- (void)storesWillChange:(id)a3;
@end

@implementation HCDatabaseManager

- (HCDatabaseManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)HCDatabaseManager;
  v2 = [(HCDatabaseManager *)&v11 init];
  v3 = v2;
  if (v2) {
    [(HCDatabaseManager *)v2 setupDatabase];
  }
  if (MKBDeviceFormattedForContentProtection())
  {
    objc_initWeak(&location, v3);
    v4 = (const char *)*MEMORY[0x1E4F78160];
    v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__HCDatabaseManager_init__block_invoke;
    v8[3] = &unk_1E6191D48;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch(v4, &v3->_contentProtectionNotifyToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __25__HCDatabaseManager_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logMessage:@"Auth changed"];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setupDatabase];

  id v4 = objc_loadWeakRetained(v1);
  [v4 saveIfPossible];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(HCDatabaseManager *)self setManagedObjectContext:0];
  v4.receiver = self;
  v4.super_class = (Class)HCDatabaseManager;
  [(HCDatabaseManager *)&v4 dealloc];
}

- (id)apsConnectionMachServiceName
{
  return @"com.apple.aps.heard";
}

- (void)setupDatabase
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[HCUtilities isProtectedDataAvailable];
  HAInitializeLogging();
  if (v3)
  {
    objc_super v4 = [NSString stringWithFormat:@"Protected data is available: %@", self];
    v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HCDatabaseManager setupDatabase]", 71, v4];
    id v6 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v64 = [v7 UTF8String];
      _os_log_impl(&dword_1B8AF3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v9 = [(HCDatabaseManager *)self managedObjectContext];

    if (!v9)
    {
      context = (void *)MEMORY[0x1BA9C6CA0]();
      v10 = [(HCDatabaseManager *)self managedObjectModelName];
      objc_super v11 = [(HCDatabaseManager *)self cloudKitContainer];
      v12 = [(HCDatabaseManager *)self containerIdentifier];
      v13 = [(HCDatabaseManager *)self databaseFilePath];
      HAInitializeLogging();
      v14 = [NSString stringWithFormat:@"Setting up heard database: mom: %@, container: %@ identifier: %@ url: %@", v10, v11, v12, v13];
      v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HCDatabaseManager setupDatabase]", 81, v14];
      v16 = (void *)HAEngineeringLog;
      if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v13;
        id v18 = v15;
        v19 = v16;
        v20 = v18;
        v13 = v17;
        uint64_t v21 = [v20 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v64 = v21;
        _os_log_impl(&dword_1B8AF3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      if ([v10 length]
        && [v11 length]
        && [v12 length]
        && ([v13 absoluteString],
            v22 = objc_claimAutoreleasedReturnValue(),
            uint64_t v23 = [v22 length],
            v22,
            v23))
      {
        id v24 = objc_alloc(MEMORY[0x1E4F1C120]);
        v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v26 = [v25 URLForResource:v10 withExtension:@"momd"];
        v27 = (void *)[v24 initWithContentsOfURL:v26];

        v59 = (void *)[objc_alloc(MEMORY[0x1E4F1C140]) initWithName:v11 managedObjectModel:v27];
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v13];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C058]) initWithContainerIdentifier:v12];
        v30 = [(HCDatabaseManager *)self apsConnectionMachServiceName];
        v56 = v29;
        [v29 setApsConnectionMachServiceName:v30];

        v55 = (void *)[objc_alloc(MEMORY[0x1E4F1C050]) initWithOptions:v29];
        [v28 setMirroringDelegate:v55];
        [v28 setOption:*MEMORY[0x1E4F28358] forKey:*MEMORY[0x1E4F1BEC0]];
        v53 = (void *)[objc_alloc(MEMORY[0x1E4F1C148]) initWithContainerIdentifier:v12];
        [v53 setUseDeviceToDeviceEncryption:1];
        v31 = [(HCDatabaseManager *)self apsConnectionMachServiceName];
        [v53 setApsConnectionMachServiceName:v31];

        v54 = v28;
        [v28 setCloudKitContainerOptions:v53];
        v62 = v28;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
        [v59 setPersistentStoreDescriptions:v32];

        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __34__HCDatabaseManager_setupDatabase__block_invoke;
        v61[3] = &unk_1E6191D70;
        v61[4] = self;
        [v59 loadPersistentStoresWithCompletionHandler:v61];
        v33 = [v59 viewContext];
        [(HCDatabaseManager *)self setManagedObjectContext:v33];

        v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v57 = v13;
        uint64_t v35 = *MEMORY[0x1E4F1BEA8];
        v36 = [(HCDatabaseManager *)self managedObjectContext];
        [v36 persistentStoreCoordinator];
        v37 = v58 = v12;
        [v34 addObserver:self selector:sel_storesWillChange_ name:v35 object:v37];

        v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v39 = *MEMORY[0x1E4F1BE20];
        v40 = [(HCDatabaseManager *)self managedObjectContext];
        v12 = v58;
        [v38 addObserver:self selector:sel_contentDidUpdate_ name:v39 object:v40];

        v52 = NSString;
        v41 = [(HCDatabaseManager *)self managedObjectContext];
        v42 = [v41 persistentStoreCoordinator];
        v43 = [v42 persistentStores];
        uint64_t v44 = [v43 count];
        v45 = [(HCDatabaseManager *)self managedObjectContext];
        v46 = [v52 stringWithFormat:@"Creating DB [%d] %@", v44, v45];
        [(HCDatabaseManager *)self logMessage:v46];

        v13 = v57;
      }
      else
      {
        v27 = [NSString stringWithFormat:@"Missing mom or container %@, %@", v10, v11];
        [(HCDatabaseManager *)self logMessage:v27];
      }
    }
  }
  else
  {
    v47 = [NSString stringWithFormat:@"Protected state, will not create database: %@", self];
    v48 = [NSString stringWithFormat:@"%s:%d %@", "-[HCDatabaseManager setupDatabase]", 125, v47];
    v49 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = v48;
      v51 = v49;
      *(_DWORD *)buf = 136446210;
      uint64_t v64 = [v50 UTF8String];
      _os_log_impl(&dword_1B8AF3000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __34__HCDatabaseManager_setupDatabase__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"Loaded stores %@", a3];
  [v3 logMessage:v4];
}

- (void)storesWillChange:(id)a3
{
  id v4 = [(HCDatabaseManager *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__HCDatabaseManager_storesWillChange___block_invoke;
  v5[3] = &unk_1E6191BE8;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __38__HCDatabaseManager_storesWillChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 saveIfPossible];
  }
  else
  {
    id v5 = [v4 managedObjectContext];
    [v5 reset];
  }
}

- (id)managedObjectModelName
{
  return 0;
}

- (id)cloudKitContainer
{
  return 0;
}

- (id)containerIdentifier
{
  return 0;
}

- (id)databaseFilePath
{
  int v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v4 = [v3 lastObject];
  id v5 = [v4 stringByAppendingPathComponent:@"Accessibility"];

  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 bundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.accessibility.HearingTestApp"];

  if (v8)
  {

    id v5 = @"/var/mobile/Library/Accessibility";
  }
  id v9 = [(HCDatabaseManager *)self cloudKitContainer];
  v10 = [(__CFString *)v5 stringByAppendingPathComponent:v9];
  objc_super v11 = [v10 stringByAppendingPathExtension:@"sqlite"];

  v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];

  return v12;
}

- (void)contentDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HCDatabaseManager *)self managedObjectContext];
  [v5 mergeChangesFromContextDidSaveNotification:v4];
}

- (BOOL)saveIfPossible
{
  v2 = self;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__0;
  v6[4] = __Block_byref_object_dispose__0;
  id v7 = 0;
  int v3 = [(HCDatabaseManager *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__HCDatabaseManager_saveIfPossible__block_invoke;
  v5[3] = &unk_1E6191D98;
  v5[4] = v2;
  void v5[5] = v6;
  v5[6] = &v8;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __35__HCDatabaseManager_saveIfPossible__block_invoke(uint64_t a1)
{
  BOOL v2 = +[HCUtilities isProtectedDataAvailable];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) managedObjectContext];
    id v5 = [v4 persistentStoreCoordinator];
    id v6 = [v5 persistentStores];
    if ([v6 count])
    {
      id v7 = [*(id *)(a1 + 32) managedObjectContext];
      int v8 = [v7 hasChanges];

      if (v8)
      {
        id v9 = [*(id *)(a1 + 32) managedObjectContext];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        id obj = *(id *)(v10 + 40);
        [v9 save:&obj];
        objc_storeStrong((id *)(v10 + 40), obj);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                               + 40) == 0;
        char v11 = *(void **)(a1 + 32);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          [NSString stringWithFormat:@"Updated DB %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        }
        else {
        id v18 = [NSString stringWithFormat:@"Failed DB save with err %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        }
        [v11 logMessage:v18];

        return;
      }
    }
    else
    {
    }
    v12 = *(void **)(a1 + 32);
    v13 = NSString;
    id v19 = [v12 managedObjectContext];
    v14 = [v19 persistentStoreCoordinator];
    v15 = [v14 persistentStores];
    v16 = [*(id *)(a1 + 32) managedObjectContext];
    v17 = [v13 stringWithFormat:@"No persistent stores[%@], or changes:[%d]", v15, objc_msgSend(v16, "hasChanges")];
    [v12 logMessage:v17];
  }
  else
  {
    id v19 = [NSString stringWithFormat:@"Protected data state, not saving"];
    [v3 logMessage:v19];
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end