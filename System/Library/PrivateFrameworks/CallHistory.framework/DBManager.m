@interface DBManager
+ (BOOL)deleteDirectoryAtLocation:(id)a3;
+ (BOOL)destroyDBAtLocation:(id)a3 withModel:(id)a4;
+ (BOOL)destroyDBAtLocation:(id)a3 withModelAtLocation:(id)a4;
+ (BOOL)makeDatabaseAtURLClassCDataProtected:(id)a3;
+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModel:(id)a5;
+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModelAtLocation:(id)a5;
+ (BOOL)performMigrationFrom:(id)a3 sourceModel:(id)a4 toDestinationURL:(id)a5 destinationModel:(id)a6 mappingModel:(id)a7 isEncrypted:(BOOL)a8;
+ (BOOL)replacePersistentStore:(id)a3 withURL:(id)a4;
+ (id)entityDescriptionHavingName:(id)a3 forContext:(id)a4;
+ (id)getManagedObjectModelFromDB:(id)a3 orModelURL:(id)a4;
+ (id)getPersistentCoordinatorWithModel:(id)a3;
+ (id)getPropertyValueForKey:(id)a3 forContext:(id)a4;
+ (id)instanceWithModelURL:(id)a3;
+ (id)migrateDataStoreAtLocation:(id)a3 withGetDestinationModel:(id)a4 isEncrypted:(BOOL)a5;
+ (id)migrationDirectoryFromSourceURL:(id)a3;
+ (id)migrationStoreURLIn:(id)a3 fromSourceURL:(id)a4 andModelURL:(id)a5;
+ (id)modelForDBMetadata:(id)a3;
+ (id)persistentStoreOptionsWithURL:(id)a3 isEncrypted:(BOOL)a4;
+ (id)sourceMetadataForDBAtLocation:(id)a3 withOptions:(id)a4;
+ (int64_t)isDataStoreAtURLInitialized:(id)a3 withModelAtURL:(id)a4;
+ (int64_t)mapToDBMErrorCode:(id)a3;
+ (int64_t)versionForDBAtLocation:(id)a3;
+ (int64_t)versionForManagedObjectModel:(id)a3;
+ (void)setPropertyValue:(id)a3 forKey:(id)a4 forContext:(id)a5;
- (BOOL)addDataStoreAtLocation:(id)a3 isEncrypted:(BOOL)a4;
- (DBManager)init;
- (NSPersistentStoreCoordinator)fPersistentStoreCoordinator;
- (id)createManagedObjectContext;
- (void)removeDataStoreAtLocation:(id)a3;
- (void)setFPersistentStoreCoordinator:(id)a3;
@end

@implementation DBManager

+ (int64_t)versionForManagedObjectModel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [a3 versionIdentifiers];
  if ([v3 count] == 1)
  {
    v4 = [v3 anyObject];
    int64_t v5 = [v4 integerValue];
  }
  else
  {
    v6 = +[CHLogServer sharedInstance];
    v7 = [v6 logHandleForDomain:"ch.dbm"];

    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = [v3 count];
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Either version indentifier set is nil (%p) or has count not equal to 1 (%lu)", (uint8_t *)&v10, 0x16u);
    }

    int64_t v5 = 0;
  }

  return v5;
}

- (void)removeDataStoreAtLocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(DBManager *)self fPersistentStoreCoordinator];
    v6 = [v5 persistentStoreForURL:v4];

    if (v6)
    {
      v7 = [(DBManager *)self fPersistentStoreCoordinator];
      id v11 = 0;
      char v8 = [v7 removePersistentStore:v6 error:&v11];
      v9 = v11;

      if ((v8 & 1) == 0)
      {
        int v10 = [(CHLogger *)self logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[DBManager removeDataStoreAtLocation:]();
        }
      }
    }
    else
    {
      v9 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v4;
        _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Persistent store at URL %{public}@ is not present", buf, 0xCu);
      }
    }
  }
  else
  {
    v6 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBManager addDataStoreAtLocation:isEncrypted:]();
    }
  }
}

- (BOOL)addDataStoreAtLocation:(id)a3 isEncrypted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = [(id)objc_opt_class() persistentStoreOptionsWithURL:v6 isEncrypted:v4];
    char v8 = [v6 URLByDeletingLastPathComponent];
    v9 = getDBDirCreateOptions();
    char DirectoryAtPath = createDirectoryAtPath(v8, v9);

    if (DirectoryAtPath)
    {
      id v11 = [(DBManager *)self fPersistentStoreCoordinator];
      uint64_t v12 = *MEMORY[0x1E4F1BF70];
      id v18 = 0;
      id v13 = [v11 addPersistentStoreWithType:v12 configuration:0 URL:v6 options:v7 error:&v18];
      uint64_t v14 = v18;

      if (v13)
      {
        BOOL v15 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v16 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DBManager addDataStoreAtLocation:isEncrypted:]();
      }
    }
    else
    {
      v16 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DBManager addDataStoreAtLocation:isEncrypted:]();
      }
      uint64_t v14 = 0;
    }

    BOOL v15 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[DBManager addDataStoreAtLocation:isEncrypted:]();
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (id)createManagedObjectContext
{
  id v3 = [(DBManager *)self fPersistentStoreCoordinator];

  if (v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C110]);
    [v3 setPersistentStoreCoordinator:self->fPersistentStoreCoordinator];
  }
  return v3;
}

- (NSPersistentStoreCoordinator)fPersistentStoreCoordinator
{
  return self->fPersistentStoreCoordinator;
}

+ (id)persistentStoreOptionsWithURL:(id)a3 isEncrypted:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v5 = +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:a3];
  id v6 = v5;
  v7 = (void *)MEMORY[0x1E4F28378];
  if (v4) {
    v7 = (void *)MEMORY[0x1E4F28358];
  }
  [v5 setOption:*v7 forKey:*MEMORY[0x1E4F1BEC0]];
  char v8 = [v6 options];

  return v8;
}

+ (int64_t)isDataStoreAtURLInitialized:(id)a3 withModelAtURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F1BF70];
    id v22 = 0;
    v9 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v8 URL:v5 error:&v22];
    int v10 = v22;
    id v11 = v10;
    if (!v9)
    {
      uint64_t v16 = [v10 code];
      v17 = +[CHLogServer sharedInstance];
      id v13 = [v17 logHandleForDomain:"ch.dbm"];

      if (v16 == 260)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v24 = v5;
          _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Data store at path %{public}@ does not exist", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[DBManager isDataStoreAtURLInitialized:withModelAtURL:]();
      }
      int64_t v14 = 1;
      goto LABEL_23;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v7];
    id v13 = v12;
    if (v12)
    {
      if ([v12 isConfiguration:0 compatibleWithStoreMetadata:v9])
      {
        int64_t v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v20 = +[CHLogServer sharedInstance];
      v19 = [v20 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v5;
        _os_log_impl(&dword_1B8E4A000, v19, OS_LOG_TYPE_DEFAULT, "Destination store at location %{public}@ is not compatible with newer version, migration required", buf, 0xCu);
      }
      int64_t v14 = 2;
    }
    else
    {
      id v18 = +[CHLogServer sharedInstance];
      v19 = [v18 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[DBManager isDataStoreAtURLInitialized:withModelAtURL:]();
      }
      int64_t v14 = 3;
    }

    goto LABEL_23;
  }
  BOOL v15 = +[CHLogServer sharedInstance];
  id v11 = [v15 logHandleForDomain:"ch.dbm"];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[DBManager isDataStoreAtURLInitialized:withModelAtURL:]();
  }
  int64_t v14 = 3;
LABEL_24:

  return v14;
}

+ (id)instanceWithModelURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = objc_alloc_init(DBManager);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v3];
    id v6 = +[DBManager getPersistentCoordinatorWithModel:v5];
    if (v6)
    {
      [(DBManager *)v4 setFPersistentStoreCoordinator:v6];
      v7 = v4;
    }
    else
    {
      v9 = +[CHLogServer sharedInstance];
      int v10 = [v9 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[DBManager instanceWithModelURL:]();
      }

      v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = +[CHLogServer sharedInstance];
    BOOL v4 = [v8 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_ERROR)) {
      +[DBManager instanceWithModelURL:]();
    }
    v7 = 0;
  }

  return v7;
}

- (void)setFPersistentStoreCoordinator:(id)a3
{
}

- (DBManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)DBManager;
  return [(CHLogger *)&v3 initWithDomain:"ch.dbm"];
}

+ (id)getPersistentCoordinatorWithModel:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v3];
  }
  else
  {
    id v5 = +[CHLogServer sharedInstance];
    id v6 = [v5 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DBManager getPersistentCoordinatorWithModel:]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ (id)getManagedObjectModelFromDB:(id)a3 orModelURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  if (v6)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v6];
    id v9 = 0;
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v5)
    {
      id v9 = 0;
LABEL_10:
      int v10 = +[CHLogServer sharedInstance];
      id v11 = [v10 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        unint64_t v15 = v5;
        __int16 v16 = 2114;
        v17 = v7;
        __int16 v18 = 2114;
        id v19 = v9;
        _os_log_error_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_ERROR, "Couldn't get managedObjectModel from db at %{public}@ or model at %{public}@: %{public}@", buf, 0x20u);
      }

      uint64_t v8 = 0;
      goto LABEL_13;
    }
    id v13 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1C180] cachedModelForPersistentStoreWithURL:v5 options:0 error:&v13];
    id v9 = v13;
    if (!v8) {
      goto LABEL_10;
    }
  }
LABEL_13:

LABEL_14:
  return v8;
}

+ (id)sourceMetadataForDBAtLocation:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F1BF70];
  id v15 = 0;
  v7 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v6 URL:v5 options:a4 error:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v13 = v7;
  }
  else
  {
    id v11 = +[CHLogServer sharedInstance];
    uint64_t v12 = [v11 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[DBManager sourceMetadataForDBAtLocation:withOptions:]();
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)modelForDBMetadata:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = objc_msgSend(v4, "arrayWithObjects:", v5, 0);

    v7 = [MEMORY[0x1E4F1C120] mergedModelFromBundles:v6 forStoreMetadata:v3];
    if (!v7)
    {
      id v8 = +[CHLogServer sharedInstance];
      id v9 = [v8 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Failed to look up the managed object model for the source meta data", buf, 2u);
      }
    }
  }
  else
  {
    BOOL v10 = +[CHLogServer sharedInstance];
    uint64_t v6 = [v10 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DBManager modelForDBMetadata:]();
    }
    v7 = 0;
  }

  return v7;
}

+ (int64_t)versionForDBAtLocation:(id)a3
{
  id v3 = +[DBManager sourceMetadataForDBAtLocation:a3 withOptions:0];
  BOOL v4 = +[DBManager modelForDBMetadata:v3];
  if (v4) {
    int64_t v5 = +[DBManager versionForManagedObjectModel:v4];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

+ (int64_t)mapToDBMErrorCode:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3
    && [v3 code] == 134110
    && ([v4 userInfo], int64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 userInfo];
    v7 = [v6 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v7)
    {
      if ([v7 code] == 134111) {
        int64_t v8 = 4;
      }
      else {
        int64_t v8 = 3;
      }
    }
    else
    {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 3;
  }

  return v8;
}

+ (id)migrateDataStoreAtLocation:(id)a3 withGetDestinationModel:(id)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int64_t v8 = (void (**)(id, uint64_t))a4;
  id v9 = [[DBMigrationResult alloc] initWithErrorCode:3 andDBVersion:-1];
  BOOL v10 = +[DBManager persistentStoreOptionsWithURL:v7 isEncrypted:v5];
  id v11 = +[DBManager sourceMetadataForDBAtLocation:v7 withOptions:v10];

  uint64_t v12 = +[CHLogServer sharedInstance];
  id v13 = [v12 logHandleForDomain:"ch.dbm"];

  if (v11)
  {
    BOOL v67 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Completed migration step 1: Fetching source metadata", buf, 2u);
    }

    int64_t v14 = +[DBManager modelForDBMetadata:v11];
    id v15 = +[CHLogServer sharedInstance];
    __int16 v16 = [v15 logHandleForDomain:"ch.dbm"];

    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Completed migration step 2: Fetching source model", buf, 2u);
      }

      uint64_t v18 = +[DBManager versionForManagedObjectModel:v14];
      id v19 = +[CHLogServer sharedInstance];
      __int16 v16 = [v19 logHandleForDomain:"ch.dbm"];

      if (v18 > 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Completed migration step 3: Fetching source version", buf, 2u);
        }

        uint64_t v66 = v18;
        uint64_t v20 = v8[2](v8, v18);
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v20];
        id v22 = +[CHLogServer sharedInstance];
        v23 = [v22 logHandleForDomain:"ch.dbm"];

        v68 = (void *)v21;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B8E4A000, v23, OS_LOG_TYPE_DEFAULT, "Completed migration step 4: Fetching temp model", buf, 2u);
          }

          uint64_t v24 = +[DBManager versionForManagedObjectModel:v21];
          uint64_t v25 = +[CHLogServer sharedInstance];
          v26 = [v25 logHandleForDomain:"ch.dbm"];

          if (v24 > 0)
          {
            v64 = v8;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B8E4A000, v26, OS_LOG_TYPE_DEFAULT, "Completed migration step 5: Fetching temp version", buf, 2u);
            }

            uint64_t v65 = +[DBManager migrationDirectoryFromSourceURL:v7];
            int v27 = [v68 isConfiguration:0 compatibleWithStoreMetadata:v11];
            v28 = +[CHLogServer sharedInstance];
            v29 = [v28 logHandleForDomain:"ch.dbm"];

            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if (v27)
            {
              int64_t v8 = v64;
              if (v30)
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v72 = (uint64_t)v7;
                _os_log_impl(&dword_1B8E4A000, v29, OS_LOG_TYPE_DEFAULT, "Destination store at location %{public}@ is compatible with newer version; no migration required",
                  buf,
                  0xCu);
              }

              v31 = (void *)v65;
              +[DBManager deleteDirectoryAtLocation:v65];
              [(DBMigrationResult *)v9 setDbVersion:v24];
              [(DBMigrationResult *)v9 setErrorCode:0];
              v32 = v9;
              id v33 = 0;
              goto LABEL_63;
            }
            if (v30)
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v72 = v66;
              __int16 v73 = 2048;
              uint64_t v74 = v24;
              _os_log_impl(&dword_1B8E4A000, v29, OS_LOG_TYPE_DEFAULT, "Completed migration step 6: Stores were incompatible. Beginning migration from version %ld to version %ld", buf, 0x16u);
            }

            v34 = (void *)MEMORY[0x1E4F1C978];
            v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            uint64_t v36 = objc_msgSend(v34, "arrayWithObjects:", v35, 0);

            v62 = (void *)v36;
            v63 = [MEMORY[0x1E4F1C128] mappingModelFromBundles:v36 forSourceModel:v14 destinationModel:v68];
            if (v63)
            {
              id v33 = 0;
            }
            else
            {
              v37 = +[CHLogServer sharedInstance];
              v38 = [v37 logHandleForDomain:"ch.dbm"];

              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B8E4A000, v38, OS_LOG_TYPE_DEFAULT, "Failed to look for the mapping bundle in the framework bundle, now inferring automatically", buf, 2u);
              }

              id v70 = 0;
              uint64_t v39 = [MEMORY[0x1E4F1C128] inferredMappingModelForSourceModel:v14 destinationModel:v68 error:&v70];
              id v33 = v70;
              v63 = (void *)v39;
              if (!v39)
              {
                v58 = +[CHLogServer sharedInstance];
                v59 = [v58 logHandleForDomain:"ch.dbm"];

                v31 = (void *)v65;
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B8E4A000, v59, OS_LOG_TYPE_DEFAULT, "Failed to infer the mapping model automatically", buf, 2u);
                }

                v32 = v9;
                int64_t v8 = v64;
                v54 = v62;
                goto LABEL_62;
              }
            }
            v40 = +[CHLogServer sharedInstance];
            v41 = [v40 logHandleForDomain:"ch.dbm"];

            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B8E4A000, v41, OS_LOG_TYPE_DEFAULT, "Completed migration step 7: Fetching mapping model", buf, 2u);
            }

            v42 = +[DBManager migrationStoreURLIn:v65 fromSourceURL:v7 andModelURL:v20];
            v43 = [MEMORY[0x1E4F28CB8] defaultManager];
            v44 = [v42 path];
            int v45 = [v43 fileExistsAtPath:v44];

            v61 = v42;
            if (v45)
            {
              v46 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v69 = v33;
              char v47 = [v46 removeItemAtURL:v42 error:&v69];
              id v60 = v69;

              if ((v47 & 1) == 0)
              {
                v55 = +[CHLogServer sharedInstance];
                v56 = [v55 logHandleForDomain:"ch.dbm"];

                v31 = (void *)v65;
                v54 = v62;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                  +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.6();
                }

                v32 = v9;
                int64_t v8 = v64;
                goto LABEL_60;
              }
              v48 = v42;
            }
            else
            {
              id v60 = v33;
              v48 = v42;
            }
            v49 = +[CHLogServer sharedInstance];
            v50 = [v49 logHandleForDomain:"ch.dbm"];

            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B8E4A000, v50, OS_LOG_TYPE_DEFAULT, "Completed migration step 8: Fetching tempURL", buf, 2u);
            }

            BOOL v51 = +[DBManager performMigrationFrom:v7 sourceModel:v14 toDestinationURL:v48 destinationModel:v68 mappingModel:v63 isEncrypted:v67];
            v52 = +[CHLogServer sharedInstance];
            v53 = [v52 logHandleForDomain:"ch.dbm"];

            if (!v51)
            {
              v31 = (void *)v65;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.5();
              }

              [(DBMigrationResult *)v9 setDbVersion:v66];
              [(DBMigrationResult *)v9 setErrorCode:+[DBManager mapToDBMErrorCode:v60]];
              v32 = v9;
              id v33 = v60;
              int64_t v8 = v64;
              v54 = v62;
              goto LABEL_61;
            }
            v31 = (void *)v65;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B8E4A000, v53, OS_LOG_TYPE_DEFAULT, "Completed migration step 9: Performing migration", buf, 2u);
            }

            int64_t v8 = v64;
            v32 = +[DBManager migrateDataStoreAtLocation:v7 withGetDestinationModel:v64 isEncrypted:v67];
            v54 = v62;
LABEL_60:
            id v33 = v60;
LABEL_61:

LABEL_62:
LABEL_63:

            goto LABEL_64;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.4();
          }
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:]();
          }
        }
        v32 = v9;
        id v33 = 0;
LABEL_64:

        goto LABEL_65;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:]();
      }
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Failed to look up the managed object model for the source meta data", buf, 2u);
    }

    v32 = v9;
    id v33 = 0;
LABEL_65:

    goto LABEL_66;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:]();
  }

  v32 = v9;
LABEL_66:

  return v32;
}

+ (BOOL)performMigrationFrom:(id)a3 sourceModel:(id)a4 toDestinationURL:(id)a5 destinationModel:(id)a6 mappingModel:(id)a7 isEncrypted:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = (objc_class *)MEMORY[0x1E4F1C138];
  id v18 = a4;
  id v19 = (void *)[[v17 alloc] initWithSourceModel:v18 destinationModel:v15];

  uint64_t v20 = +[DBManager persistentStoreOptionsWithURL:v14 isEncrypted:v8];
  uint64_t v21 = +[CHLogServer sharedInstance];
  id v22 = [v21 logHandleForDomain:"ch.dbm"];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v33 = v13;
    __int16 v34 = 2114;
    id v35 = v14;
    __int16 v36 = 2114;
    id v37 = v16;
    __int16 v38 = 2114;
    uint64_t v39 = v20;
    _os_log_impl(&dword_1B8E4A000, v22, OS_LOG_TYPE_DEFAULT, "Migrating from %{public}@ to %{public}@ with mapping model %{public}@ and options %{public}@", buf, 0x2Au);
  }

  uint64_t v23 = *MEMORY[0x1E4F1BF70];
  id v31 = 0;
  char v24 = [v19 migrateStoreFromURL:v13 type:v23 options:0 withMappingModel:v16 toDestinationURL:v14 destinationType:v23 destinationOptions:v20 error:&v31];
  id v25 = v31;
  v26 = +[CHLogServer sharedInstance];
  int v27 = [v26 logHandleForDomain:"ch.dbm"];

  if ((v24 & 1) == 0)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.5();
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = v13;
    __int16 v34 = 2114;
    id v35 = v14;
    _os_log_impl(&dword_1B8E4A000, v27, OS_LOG_TYPE_DEFAULT, "Replacing source DB at %{public}@ with migrated DB at %{public}@", buf, 0x16u);
  }

  if (!+[DBManager moveDBAtLocation:v14 toLocation:v13 withModel:v15])
  {
    v29 = +[CHLogServer sharedInstance];
    int v27 = [v29 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[DBManager performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:]();
    }
LABEL_12:

    BOOL v28 = 0;
    goto LABEL_13;
  }
  BOOL v28 = 1;
LABEL_13:

  return v28;
}

+ (id)migrationDirectoryFromSourceURL:(id)a3
{
  id v3 = [a3 URLByDeletingLastPathComponent];
  BOOL v4 = [v3 URLByAppendingPathComponent:@"Migration" isDirectory:1];
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [v4 path];
  id v12 = 0;
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v7 = v12;

  if (v7)
  {
    BOOL v8 = +[CHLogServer sharedInstance];
    id v9 = [v8 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[DBManager migrationDirectoryFromSourceURL:]();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

+ (BOOL)deleteDirectoryAtLocation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  BOOL v5 = [v3 defaultManager];
  id v10 = 0;
  [v5 removeItemAtURL:v4 error:&v10];

  id v6 = v10;
  if (v6)
  {
    id v7 = +[CHLogServer sharedInstance];
    BOOL v8 = [v7 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[DBManager deleteDirectoryAtLocation:]();
    }
  }
  return v6 == 0;
}

+ (id)migrationStoreURLIn:(id)a3 fromSourceURL:(id)a4 andModelURL:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 path];
  id v11 = [v10 pathExtension];

  id v12 = [v11 stringByDeletingPathExtension];
  id v13 = [v8 lastPathComponent];

  id v14 = [v13 stringByDeletingPathExtension];

  id v15 = [NSString stringWithFormat:@"%@.%@.%@", v12, v14, v11];
  id v16 = [v9 URLByAppendingPathComponent:v15];

  BOOL v17 = +[CHLogServer sharedInstance];
  id v18 = [v17 logHandleForDomain:"ch.dbm"];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, "Got destinationURL %{public}@ from sourceURL %{public}@ and modelName %{public}@", buf, 0x20u);
  }

  return v16;
}

+ (BOOL)destroyDBAtLocation:(id)a3 withModelAtLocation:(id)a4
{
  id v5 = a3;
  id v6 = +[DBManager getManagedObjectModelFromDB:v5 orModelURL:a4];
  BOOL v7 = +[DBManager destroyDBAtLocation:v5 withModel:v6];

  return v7;
}

+ (BOOL)destroyDBAtLocation:(id)a3 withModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[DBManager getPersistentCoordinatorWithModel:v6];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = [NSNumber numberWithBool:1];
    id v10 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E4F1BF18], 0);

    uint64_t v11 = *MEMORY[0x1E4F1BF70];
    id v18 = 0;
    char v12 = [v7 _destroyPersistentStoreAtURL:v5 withType:v11 options:v10 error:&v18];
    id v13 = v18;
    if ((v12 & 1) == 0)
    {
      id v14 = +[CHLogServer sharedInstance];
      id v15 = [v14 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[DBManager destroyDBAtLocation:withModel:]();
      }
    }
  }
  else
  {
    id v16 = +[CHLogServer sharedInstance];
    id v13 = [v16 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[DBManager destroyDBAtLocation:withModel:]();
    }
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModelAtLocation:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[DBManager getManagedObjectModelFromDB:v8 orModelURL:a5];
  BOOL v10 = +[DBManager moveDBAtLocation:v8 toLocation:v7 withModel:v9];

  return v10;
}

+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModel:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = +[DBManager getPersistentCoordinatorWithModel:v9];
  uint64_t v11 = v10;
  if (!v10)
  {
    id v16 = +[CHLogServer sharedInstance];
    BOOL v17 = [v16 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[DBManager moveDBAtLocation:toLocation:withModel:]();
    }
    id v14 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = *MEMORY[0x1E4F1BF70];
  id v20 = 0;
  char v13 = [v10 _replacePersistentStoreAtURL:v8 destinationOptions:0 withPersistentStoreFromURL:v7 sourceOptions:0 storeType:v12 error:&v20];
  id v14 = v20;
  if ((v13 & 1) == 0)
  {
    id v18 = +[CHLogServer sharedInstance];
    BOOL v17 = [v18 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v22 = v7;
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_error_impl(&dword_1B8E4A000, v17, OS_LOG_TYPE_ERROR, "Failed to copy data store src: %{public}@ dst: %{public}@ error: %{public}@", buf, 0x20u);
    }
LABEL_9:

    BOOL v15 = 0;
    goto LABEL_10;
  }
  BOOL v15 = 1;
LABEL_10:

  return v15;
}

+ (id)entityDescriptionHavingName:(id)a3 forContext:(id)a4
{
  id v5 = a3;
  id v6 = [a4 persistentStoreCoordinator];
  id v7 = [v6 managedObjectModel];

  if (v7)
  {
    id v8 = [v7 entitiesByName];
    id v9 = [v8 objectForKey:v5];
  }
  else
  {
    BOOL v10 = +[CHLogServer sharedInstance];
    uint64_t v11 = [v10 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[DBManager entityDescriptionHavingName:forContext:]();
    }

    id v9 = 0;
  }

  return v9;
}

+ (void)setPropertyValue:(id)a3 forKey:(id)a4 forContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 persistentStoreCoordinator];
  BOOL v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 persistentStores];
    uint64_t v12 = [v11 firstObject];

    if (v12)
    {
      char v13 = [v10 metadataForPersistentStore:v12];
      id v14 = v13;
      if (v13)
      {
        BOOL v15 = [v13 mutableCopy];
        [v15 setObject:v7 forKey:v8];
        [v10 setMetadata:v15 forPersistentStore:v12];
      }
      else
      {
        id v18 = +[CHLogServer sharedInstance];
        BOOL v15 = [v18 logHandleForDomain:"ch.dbm"];

        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[DBManager setPropertyValue:forKey:forContext:]();
        }
      }
    }
    else
    {
      BOOL v17 = +[CHLogServer sharedInstance];
      id v14 = [v17 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[DBManager setPropertyValue:forKey:forContext:]();
      }
    }
  }
  else
  {
    id v16 = +[CHLogServer sharedInstance];
    uint64_t v12 = [v16 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[DBManager setPropertyValue:forKey:forContext:]();
    }
  }
}

+ (id)getPropertyValueForKey:(id)a3 forContext:(id)a4
{
  id v5 = a3;
  id v6 = [a4 persistentStoreCoordinator];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 persistentStores];
    id v9 = [v8 firstObject];

    if (v9)
    {
      BOOL v10 = [v7 metadataForPersistentStore:v9];
      uint64_t v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 valueForKey:v5];
LABEL_14:

        goto LABEL_15;
      }
      BOOL v15 = +[CHLogServer sharedInstance];
      id v16 = [v15 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[DBManager setPropertyValue:forKey:forContext:]();
      }
    }
    else
    {
      id v14 = +[CHLogServer sharedInstance];
      uint64_t v11 = [v14 logHandleForDomain:"ch.dbm"];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[DBManager setPropertyValue:forKey:forContext:]();
      }
    }
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  char v13 = +[CHLogServer sharedInstance];
  id v9 = [v13 logHandleForDomain:"ch.dbm"];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[DBManager setPropertyValue:forKey:forContext:]();
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)makeDatabaseAtURLClassCDataProtected:(id)a3
{
  id v3 = a3;
  id v4 = +[DBManager sourceMetadataForDBAtLocation:v3 withOptions:0];
  id v5 = +[DBManager modelForDBMetadata:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(DBManager);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v5];
    [(DBManager *)v6 setFPersistentStoreCoordinator:v7];

    BOOL v8 = [(DBManager *)v6 addDataStoreAtLocation:v3 isEncrypted:1];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)replacePersistentStore:(id)a3 withURL:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = *MEMORY[0x1E4F1BF70];
  id v14 = 0;
  char v9 = [v7 _replacePersistentStoreAtURL:v5 destinationOptions:0 withPersistentStoreFromURL:v6 sourceOptions:0 storeType:v8 error:&v14];
  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = +[CHLogServer sharedInstance];
    uint64_t v12 = [v11 logHandleForDomain:"ch.dbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_ERROR, "Could not replace persistent data store at %{public}@ with %{public}@: %{public}@", buf, 0x20u);
    }
  }
  return v9;
}

- (void).cxx_destruct
{
}

+ (void)getPersistentCoordinatorWithModel:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to created coordinator because no model was provided", v2, v3, v4, v5, v6);
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Invalid value dbURL: %{public}@ or modelURL: %{public}@");
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Unexpected error: %{public}@ when querying meta data for database: %{public}@, treating as data store not initialized");
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to get the destination managed object model", v2, v3, v4, v5, v6);
}

+ (void)instanceWithModelURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Cannot create instance with nil modelURL!", v2, v3, v4, v5, v6);
}

+ (void)instanceWithModelURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to create peristent coordinator for persistent store", v2, v3, v4, v5, v6);
}

+ (void)sourceMetadataForDBAtLocation:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to get metadata for source datastore at %{public}@: %{public}@");
}

+ (void)modelForDBMetadata:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to get model because no metadata was provided", v2, v3, v4, v5, v6);
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to get metadata for source data store: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to get the source version from sourceModel: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to get the destination managed object model from: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to get the destination version from tempModel: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to migrate the store at location: %{public}@ with error %{public}@");
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.6()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to delete data store at path: %{public}@. Error: %{public}@");
}

+ (void)performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to copy data store src: %{public}@ dst: %{public}@");
}

+ (void)migrationDirectoryFromSourceURL:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Error creating migration directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)deleteDirectoryAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Error removing migration directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)destroyDBAtLocation:withModel:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Couldn't get the coordinator for db at %{public}@ and model at %{public}@");
}

+ (void)destroyDBAtLocation:withModel:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to remove store at URL: %{public}@ with error %{public}@");
}

+ (void)moveDBAtLocation:toLocation:withModel:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Couldn't get the coordinator for source db at %{public}@ and model at %{public}@");
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Database location is nil", v2, v3, v4, v5, v6);
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to add the store at location %{public}@ with error %{public}@");
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to create directory at path: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeDataStoreAtLocation:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Failed to remove persistent store at URL: %{public}@ with error: %{public}@");
}

+ (void)entityDescriptionHavingName:forContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Managed object does not exist", v2, v3, v4, v5, v6);
}

+ (void)setPropertyValue:forKey:forContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Coordinator not set", v2, v3, v4, v5, v6);
}

+ (void)setPropertyValue:forKey:forContext:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Persistent store not found", v2, v3, v4, v5, v6);
}

+ (void)setPropertyValue:forKey:forContext:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "No meta data properties dict found", v2, v3, v4, v5, v6);
}

@end