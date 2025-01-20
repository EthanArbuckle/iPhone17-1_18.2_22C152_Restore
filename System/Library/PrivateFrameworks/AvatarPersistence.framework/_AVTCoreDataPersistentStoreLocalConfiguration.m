@interface _AVTCoreDataPersistentStoreLocalConfiguration
+ (id)createStoreDescriptionWithDatabaseLocation:(id)a3 logger:(id)a4;
+ (id)databaseFolderForStoreLocation:(id)a3;
+ (id)databaseLocationForFolderLocation:(id)a3;
+ (id)sideDatabaseFolderForStoreLocation:(id)a3;
- (AVTCoreEnvironment)environment;
- (AVTUILogger)logger;
- (BOOL)contentExists;
- (BOOL)copyStorageAside:(id *)a3;
- (BOOL)createDatabaseDirectoryIfNeeded:(id *)a3 usingFileManager:(id)a4;
- (BOOL)setupIfNeeded:(id *)a3;
- (BOOL)tearDownAndEraseAllContent:(id *)a3;
- (NSPersistentStoreCoordinator)coordinator;
- (NSPersistentStoreDescription)storeDescription;
- (NSURL)databaseLocation;
- (NSURL)folderLocation;
- (NSURL)storeLocation;
- (_AVTCoreDataPersistentStoreLocalConfiguration)initWithStoreLocation:(id)a3 copiedAside:(BOOL)a4 environment:(id)a5;
- (id)copiedAsideMigratableSource;
- (id)createManagedObjectContext;
- (id)createStoreServerWithError:(id *)a3;
- (id)migratableSources;
- (void)updateBackupInclusionStatusOnQueue:(id)a3 completionHandler:(id)a4;
@end

@implementation _AVTCoreDataPersistentStoreLocalConfiguration

- (_AVTCoreDataPersistentStoreLocalConfiguration)initWithStoreLocation:(id)a3 copiedAside:(BOOL)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_AVTCoreDataPersistentStoreLocalConfiguration;
  v11 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)&v29 init];
  if (v11)
  {
    uint64_t v12 = [v10 logger];
    logger = v11->_logger;
    v11->_logger = (AVTUILogger *)v12;

    objc_storeStrong((id *)&v11->_storeLocation, a3);
    v14 = objc_opt_class();
    v15 = v14;
    if (a4)
    {
      uint64_t v16 = [v14 sideDatabaseFolderForStoreLocation:v9];
      folderLocation = v11->_folderLocation;
      v11->_folderLocation = (NSURL *)v16;
    }
    else
    {
      folderLocation = [(_AVTCoreDataPersistentStoreLocalConfiguration *)v11 storeLocation];
      uint64_t v18 = [v15 databaseFolderForStoreLocation:folderLocation];
      v19 = v11->_folderLocation;
      v11->_folderLocation = (NSURL *)v18;
    }
    uint64_t v20 = [(id)objc_opt_class() databaseLocationForFolderLocation:v11->_folderLocation];
    databaseLocation = v11->_databaseLocation;
    v11->_databaseLocation = (NSURL *)v20;

    id v22 = objc_alloc(MEMORY[0x263EFF320]);
    v23 = +[AVTCoreDataPersistentStoreConfiguration createModel];
    uint64_t v24 = [v22 initWithManagedObjectModel:v23];
    coordinator = v11->_coordinator;
    v11->_coordinator = (NSPersistentStoreCoordinator *)v24;

    uint64_t v26 = [(id)objc_opt_class() createStoreDescriptionWithDatabaseLocation:v11->_databaseLocation logger:v11->_logger];
    storeDescription = v11->_storeDescription;
    v11->_storeDescription = (NSPersistentStoreDescription *)v26;

    if (!a4
      && +[AVTCoreDataCloudKitMirroringConfiguration cloudKitMirroringEnabled])
    {
      [(AVTUILogger *)v11->_logger logSyncEnabled];
      +[AVTCoreDataCloudKitMirroringConfiguration configureStoreDescriptionForMirroring:v11->_storeDescription logger:v11->_logger];
    }
    objc_storeStrong((id *)&v11->_environment, a5);
  }

  return v11;
}

+ (id)createStoreDescriptionWithDatabaseLocation:(id)a3 logger:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263EFF328];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setType:*MEMORY[0x263EFF168]];
  [v6 setURL:v5];

  [v6 setShouldAddStoreAsynchronously:0];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [v6 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF100]];
  [v6 setOption:*MEMORY[0x263F08098] forKey:*MEMORY[0x263EFF0E0]];
  [v6 setOption:v7 forKey:*MEMORY[0x263EFF0B0]];

  return v6;
}

+ (id)databaseFolderForStoreLocation:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"CoreDataBackend"];
}

+ (id)sideDatabaseFolderForStoreLocation:(id)a3
{
  v3 = [a1 databaseFolderForStoreLocation:a3];
  v4 = [v3 URLByAppendingPathExtension:@"movedaside"];

  return v4;
}

+ (id)databaseLocationForFolderLocation:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"avatars.db"];
}

- (id)migratableSources
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [AVTArchiverBasedStoreMigratableSource alloc];
  v4 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self storeLocation];
  id v5 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self environment];
  id v6 = [(AVTArchiverBasedStoreMigratableSource *)v3 initWithStoreLocation:v4 environment:v5];
  v10[0] = v6;
  uint64_t v7 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self copiedAsideMigratableSource];
  v10[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

- (id)copiedAsideMigratableSource
{
  v3 = [_AVTCoreDataPersistentStoreLocalConfiguration alloc];
  v4 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self storeLocation];
  id v5 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self environment];
  id v6 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)v3 initWithStoreLocation:v4 copiedAside:1 environment:v5];

  uint64_t v7 = [AVTSideCoreDataStoreMigratableSource alloc];
  v8 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self environment];
  id v9 = [(AVTSideCoreDataStoreMigratableSource *)v7 initWithConfiguration:v6 environment:v8];

  return v9;
}

- (BOOL)createDatabaseDirectoryIfNeeded:(id *)a3 usingFileManager:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self folderLocation];
  v8 = [v7 path];
  char v9 = [v6 fileExistsAtPath:v8];

  if (v9) {
    char v10 = 1;
  }
  else {
    char v10 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3];
  }

  return v10;
}

- (BOOL)setupIfNeeded:(id *)a3
{
  id v5 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self coordinator];
  id v6 = [v5 persistentStores];
  uint64_t v7 = [v6 count];

  BOOL v8 = 1;
  if (!v7)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__7;
    v28 = __Block_byref_object_dispose__7;
    id v29 = 0;
    char v9 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
    char v10 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self folderLocation];
    uint64_t v11 = [v10 path];
    [v9 logReadingBackendAtPath:v11];

    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = (id *)(v25 + 5);
    id obj = (id)v25[5];
    LOBYTE(v11) = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self createDatabaseDirectoryIfNeeded:&obj usingFileManager:v12];
    objc_storeStrong(v13, obj);
    *((unsigned char *)v31 + 24) = v11;
    if (v11)
    {
      v14 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
      v15 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self coordinator];
      uint64_t v16 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self storeDescription];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63___AVTCoreDataPersistentStoreLocalConfiguration_setupIfNeeded___block_invoke;
      v19[3] = &unk_2647C4178;
      v21 = &v30;
      id v22 = &v24;
      id v17 = v14;
      id v20 = v17;
      [v15 addPersistentStoreWithDescription:v16 completionHandler:v19];

      BOOL v8 = *((unsigned char *)v31 + 24) != 0;
      if (a3 && !*((unsigned char *)v31 + 24)) {
        *a3 = (id) v25[5];
      }
    }
    else
    {
      BOOL v8 = 0;
      if (a3) {
        *a3 = (id) v25[5];
      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  return v8;
}

- (id)createManagedObjectContext
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  v4 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self coordinator];
  [v3 setPersistentStoreCoordinator:v4];

  [v3 setTransactionAuthor:@"AvatarUIClient"];

  return v3;
}

- (id)createStoreServerWithError:(id *)a3
{
  v17[5] = *MEMORY[0x263EF8340];
  id v5 = +[AVTCoreDataPersistentStoreConfiguration currentManagedObjectModel];
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:a3];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08850]);
    if ([(_AVTCoreDataPersistentStoreLocalConfiguration *)self createDatabaseDirectoryIfNeeded:a3 usingFileManager:v7])
    {
      uint64_t v8 = *MEMORY[0x263EFF1B8];
      v16[0] = *MEMORY[0x263EFF1A0];
      v16[1] = v8;
      v17[0] = MEMORY[0x263EFFA88];
      v17[1] = @"com.apple.avatar.service";
      uint64_t v9 = *MEMORY[0x263EFF0E0];
      v16[2] = *MEMORY[0x263EFF100];
      v16[3] = v9;
      uint64_t v10 = *MEMORY[0x263F08098];
      v17[2] = MEMORY[0x263EFFA88];
      v17[3] = v10;
      v16[4] = *MEMORY[0x263EFF0B0];
      v17[4] = MEMORY[0x263EFFA88];
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
      id v12 = objc_alloc(MEMORY[0x263EFF358]);
      v13 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self databaseLocation];
      v14 = (void *)[v12 initForStoreWithURL:v13 usingModel:v5 options:v11 policy:0];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)tearDownAndEraseAllContent:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
  id v6 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self folderLocation];
  id v7 = [v6 path];
  [v5 logTearingDownCoreDataStack:v7];

  uint64_t v8 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self coordinator];
  uint64_t v9 = [v8 persistentStores];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v32;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v13;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * v15);
        uint64_t v18 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self coordinator];
        id v30 = v16;
        int v19 = [v18 removePersistentStore:v17 error:&v30];
        id v13 = v30;

        if (!v19)
        {
          id v20 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
          v21 = [v13 description];
          [v20 logErrorTearingDownCoreDataStack:v21];

          if (a3)
          {
            id v13 = v13;
            char v22 = 0;
            *a3 = v13;
          }
          else
          {
            char v22 = 0;
          }
          goto LABEL_19;
        }
        ++v15;
        uint64_t v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
  v23 = v13;

  id v24 = objc_alloc_init(MEMORY[0x263F08850]);
  v25 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self folderLocation];
  id v29 = v13;
  char v22 = [v24 removeItemAtURL:v25 error:&v29];
  id v13 = v29;

  if ((v22 & 1) == 0)
  {
    if (a3) {
      *a3 = v13;
    }
    uint64_t v26 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
    v27 = [v13 description];
    [v26 logErrorRemovingStoreFolder:v27];
  }
LABEL_19:

  return v22;
}

- (BOOL)copyStorageAside:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__7;
  id v13 = __Block_byref_object_dispose__7;
  id v14 = 0;
  id v5 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66___AVTCoreDataPersistentStoreLocalConfiguration_copyStorageAside___block_invoke;
  v8[3] = &unk_2647C41A0;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  [v5 copyingStorageAside:v8];

  int v6 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24)) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6 != 0;
}

- (BOOL)contentExists
{
  id v3 = objc_alloc_init(MEMORY[0x263F08850]);
  v4 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self databaseLocation];
  id v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (void)updateBackupInclusionStatusOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_AVTCoreDataPersistentStoreLocalConfiguration *)self logger];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke;
  v11[3] = &unk_2647C4218;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[AVTCoreDataCloudKitMirroringConfiguration deviceConfigurationSupportsCloudKitMirroringWithLogger:v8 completionHandler:v11];
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSURL)folderLocation
{
  return self->_folderLocation;
}

- (NSURL)databaseLocation
{
  return self->_databaseLocation;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_databaseLocation, 0);
  objc_storeStrong((id *)&self->_folderLocation, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
  objc_storeStrong((id *)&self->_storeDescription, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end