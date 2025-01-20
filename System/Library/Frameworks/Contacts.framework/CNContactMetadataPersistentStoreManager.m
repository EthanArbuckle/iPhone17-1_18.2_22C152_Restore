@interface CNContactMetadataPersistentStoreManager
+ (BOOL)performLightweightMigrationIfNeededError:(id *)a3;
+ (OS_os_log)os_log;
+ (id)createModel;
+ (id)currentManagedObjectModel;
+ (id)defaultStoreLocation;
+ (id)sharedPersistentContainerForModel:(id)a3 storeLocation:(id)a4;
+ (id)sharedPersistentContainerForStoreLocation:(id)a3;
+ (id)storeFileURLForLocation:(id)a3;
+ (void)createModel;
- (BOOL)createStoreDirectoryIfNeeded:(id *)a3;
- (BOOL)performWorkWithManagedObjectContext:(id)a3 error:(id *)a4;
- (CNContactMetadataPersistentStoreManager)init;
- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3;
- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3 container:(id)a4;
- (NSError)loadPersistentStoresError;
- (NSPersistentContainer)container;
- (NSURL)storeLocation;
- (id)createManagedObjectContext;
- (id)persistentStoreCoordinator;
- (id)storeDescription;
- (void)setLoadPersistentStoresError:(id)a3;
- (void)setupIfNeeded;
@end

@implementation CNContactMetadataPersistentStoreManager

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_2 != -1) {
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_105);
  }
  v2 = (void *)os_log_cn_once_object_1_2;

  return (OS_os_log *)v2;
}

uint64_t __49__CNContactMetadataPersistentStoreManager_os_log__block_invoke()
{
  os_log_cn_once_object_1_2 = (uint64_t)os_log_create("com.apple.contacts", "CNContactMetadata");

  return MEMORY[0x1F41817F8]();
}

+ (id)currentManagedObjectModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CNContactMetadataPersistentStoreManager_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_cn_once_token_2 != -1) {
    dispatch_once(&currentManagedObjectModel_cn_once_token_2, block);
  }
  v2 = (void *)currentManagedObjectModel_cn_once_object_2;

  return v2;
}

uint64_t __68__CNContactMetadataPersistentStoreManager_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  currentManagedObjectModel_cn_once_object_2 = [*(id *)(a1 + 32) createModel];

  return MEMORY[0x1F41817F8]();
}

+ (id)createModel
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 URLForResource:@"CNContactMetadata" withExtension:@"momd"];

  if (!v4)
  {
    v5 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CNContactMetadataPersistentStoreManager createModel](v5);
    }
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v4];

  return v6;
}

+ (id)sharedPersistentContainerForModel:(id)a3 storeLocation:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F1C150];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithName:@"CNContactMetadata" managedObjectModel:v7];

  v9 = [(id)objc_opt_class() storeFileURLForLocation:v6];

  v10 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:v9];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v10 setOption:v12 forKey:*MEMORY[0x1E4F1BE98]];

  uint64_t v13 = MEMORY[0x1E4F1CC38];
  [v10 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BDE8]];
  [v10 setOption:v13 forKey:*MEMORY[0x1E4F1BE50]];
  v16 = v10;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v8 setPersistentStoreDescriptions:v14];

  return v8;
}

+ (id)storeFileURLForLocation:(id)a3
{
  id v3 = a3;
  v4 = [@"CNContactMetadata" stringByAppendingString:@".db"];
  v5 = [v3 URLByAppendingPathComponent:v4];

  return v5;
}

+ (id)defaultStoreLocation
{
  v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library"];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  v4 = [v3 URLByAppendingPathComponent:@"ContactsMetadata" isDirectory:1];

  return v4;
}

+ (id)sharedPersistentContainerForStoreLocation:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [(id)objc_opt_class() currentManagedObjectModel];
  id v6 = [v4 sharedPersistentContainerForModel:v5 storeLocation:v3];

  return v6;
}

- (CNContactMetadataPersistentStoreManager)init
{
  id v3 = [(id)objc_opt_class() defaultStoreLocation];
  v4 = [(CNContactMetadataPersistentStoreManager *)self initWithStoreLocation:v3];

  return v4;
}

- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __65__CNContactMetadataPersistentStoreManager_initWithStoreLocation___block_invoke;
  v15 = &unk_1E56B3DC8;
  v5 = self;
  v16 = v5;
  id v17 = v4;
  uint64_t v6 = initWithStoreLocation__cn_once_token_4;
  id v7 = v4;
  if (v6 != -1) {
    dispatch_once(&initWithStoreLocation__cn_once_token_4, &v12);
  }
  v8 = v17;
  id v9 = (id)initWithStoreLocation__cn_once_object_4;

  v10 = -[CNContactMetadataPersistentStoreManager initWithStoreLocation:container:](v5, "initWithStoreLocation:container:", v7, v9, v12, v13, v14, v15);
  return v10;
}

uint64_t __65__CNContactMetadataPersistentStoreManager_initWithStoreLocation___block_invoke(uint64_t a1)
{
  initWithStoreLocation__cn_once_object_4 = [(id)objc_opt_class() sharedPersistentContainerForStoreLocation:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactMetadataPersistentStoreManager;
  id v9 = [(CNContactMetadataPersistentStoreManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeLocation, a3);
    objc_storeStrong((id *)&v10->_container, a4);
    [(CNContactMetadataPersistentStoreManager *)v10 setupIfNeeded];
    v11 = v10;
  }

  return v10;
}

- (BOOL)performWorkWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNContactMetadataPersistentStoreManager *)self persistentStoreCoordinator];
  id v8 = [v7 persistentStores];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(CNContactMetadataPersistentStoreManager *)self createManagedObjectContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__CNContactMetadataPersistentStoreManager_performWorkWithManagedObjectContext_error___block_invoke;
    v15[3] = &unk_1E56B8678;
    id v16 = v10;
    id v17 = v6;
    id v11 = v10;
    [v11 performBlockAndWait:v15];
  }
  else
  {
    uint64_t v12 = [(CNContactMetadataPersistentStoreManager *)self loadPersistentStoresError];
    objc_super v13 = v12;
    if (a4) {
      *a4 = v12;
    }
  }
  return v9 != 0;
}

uint64_t __85__CNContactMetadataPersistentStoreManager_performWorkWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)createManagedObjectContext
{
  v2 = [(CNContactMetadataPersistentStoreManager *)self container];
  id v3 = (void *)[v2 newBackgroundContext];

  return v3;
}

- (void)setupIfNeeded
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Failed to setup store: %@", v4, v5, v6, v7, v8);
}

void __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint8_t v8 = WeakRetained;
  if (v6)
  {
    [WeakRetained setLoadPersistentStoresError:v6];
    uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke_cold_1(v6);
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Loaded container with description: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)persistentStoreCoordinator
{
  uint64_t v2 = [(CNContactMetadataPersistentStoreManager *)self container];
  uint64_t v3 = [v2 persistentStoreCoordinator];

  return v3;
}

- (id)storeDescription
{
  uint64_t v2 = [(CNContactMetadataPersistentStoreManager *)self container];
  uint64_t v3 = [v2 persistentStoreDescriptions];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (BOOL)createStoreDirectoryIfNeeded:(id *)a3
{
  uint64_t v4 = [(CNContactMetadataPersistentStoreManager *)self storeLocation];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = 0;
LABEL_4:
    id v10 = v8;
    BOOL v11 = 1;
    goto LABEL_5;
  }
  id v15 = 0;
  char v9 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v8 = v15;
  if (v9) {
    goto LABEL_4;
  }
  objc_super v13 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CNContactMetadataPersistentStoreManager createStoreDirectoryIfNeeded:]();
  }

  id v14 = v8;
  id v10 = v14;
  if (a3)
  {
    id v10 = v14;
    BOOL v11 = 0;
    *a3 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)performLightweightMigrationIfNeededError:(id *)a3
{
  uint64_t v4 = [(id)objc_opt_class() defaultStoreLocation];
  id v5 = [(id)objc_opt_class() storeFileURLForLocation:v4];
  uint64_t v6 = *MEMORY[0x1E4F1BF70];
  id v23 = 0;
  char v7 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v6 URL:v5 options:0 error:&v23];
  id v8 = v23;
  int v9 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))();
  id v10 = objc_opt_class();
  if (!v9)
  {
    objc_super v13 = [v10 currentManagedObjectModel];
    id v14 = v13;
    if (v13)
    {
      int v15 = [v13 isConfiguration:0 compatibleWithStoreMetadata:v7];
      id v16 = objc_opt_class();
      if (!v15)
      {
        id v17 = [v16 sharedPersistentContainerForModel:v14 storeLocation:v4];

        id v21 = 0;
        char v12 = [v17 load:&v21];
        id v8 = v21;
        if ((v12 & 1) == 0)
        {
          v20 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[CNContactMetadataPersistentStoreManager performLightweightMigrationIfNeededError:](v8);
          }

          if (a3)
          {
            id v8 = v8;
            *a3 = v8;
          }
        }
        goto LABEL_15;
      }
      id v17 = objc_msgSend(v16, "os_log");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Did not perform migration, existing model is already compatible with store metadata";
LABEL_13:
        _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      id v17 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Did not perform migration, no existing managed object model found";
        goto LABEL_13;
      }
    }
    char v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v11 = objc_msgSend(v10, "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[CNContactMetadataPersistentStoreManager performLightweightMigrationIfNeededError:](v8);
  }

  if (a3)
  {
    id v8 = v8;
    char v12 = 0;
    *a3 = v8;
  }
  else
  {
    char v12 = 0;
  }
LABEL_16:

  return v12;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSError)loadPersistentStoresError
{
  return self->_loadPersistentStoresError;
}

- (void)setLoadPersistentStoresError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadPersistentStoresError, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_storeLocation, 0);
}

+ (void)createModel
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = @"CNContactMetadata";
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Could not find model named %@", (uint8_t *)&v1, 0xCu);
}

void __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke_cold_1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Failed to load persistent stores: %@", v4, v5, v6, v7, v8);
}

- (void)createStoreDirectoryIfNeeded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1909E3000, v0, OS_LOG_TYPE_ERROR, "Failed to create ContactMetadata store location - %@", v1, 0xCu);
}

+ (void)performLightweightMigrationIfNeededError:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Did not perform migration, no store metadata found, %@", v4, v5, v6, v7, v8);
}

+ (void)performLightweightMigrationIfNeededError:(void *)a1 .cold.2(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Did not perform migration, failed to load persistent stores: %@", v4, v5, v6, v7, v8);
}

@end