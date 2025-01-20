@interface MADSystemDataStore
+ (id)defaultDatabasePath;
+ (id)systemDataStore;
- (BOOL)commitChangesOrRollback:(id *)a3;
- (BOOL)commitChangesOrRollbackAndResetContext:(id *)a3;
- (MADSystemDataStore)initWithManagedObjectModel:(id)a3;
- (id)managedObjectContext;
- (void)rollbackAndResetContext;
@end

@implementation MADSystemDataStore

+ (id)defaultDatabasePath
{
  uid_t v2 = getuid();
  v3 = getpwuid(v2);
  if (v3)
  {
    v4 = [NSString stringWithUTF8String:v3->pw_dir];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 stringByAppendingPathComponent:@"Library/MediaAnalysis/MediaAnalysis.sqlite"];

      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to query user home directory", buf, 2u);
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to query user info", v10, 2u);
    }
  }
  v6 = 0;
LABEL_13:
  return v6;
}

- (MADSystemDataStore)initWithManagedObjectModel:(id)a3
{
  v42[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MADSystemDataStore;
  v5 = [(MADSystemDataStore *)&v36 init];
  if (v5)
  {
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v4];
    uint64_t v6 = *MEMORY[0x1E4F1BDE8];
    v41[0] = *MEMORY[0x1E4F1BE50];
    v41[1] = v6;
    v42[0] = MEMORY[0x1E4F1CC38];
    v42[1] = MEMORY[0x1E4F1CC38];
    uint64_t v7 = *MEMORY[0x1E4F1BEC0];
    v41[2] = *MEMORY[0x1E4F1BF68];
    v41[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4F28358];
    v42[2] = &unk_1F15EE888;
    v42[3] = v8;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];
    v9 = [(id)objc_opt_class() defaultDatabasePath];
    if (!v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to determine database path", buf, 2u);
        }
      }
      goto LABEL_32;
    }
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [v9 stringByDeletingLastPathComponent];
    if (([v10 fileExistsAtPath:v11] & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v11;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Creating %@", buf, 0xCu);
        }
      }
      uint64_t v37 = *MEMORY[0x1E4F28330];
      v38 = &unk_1F15EBB50;
      v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v31);
      id v35 = 0;
      char v14 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:v13 error:&v35];
      id v15 = v35;

      if ((v14 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v40 = v15;
            _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "Failed to create MediaAnalysis directory for database (%@)", buf, 0xCu);
          }
        }
        goto LABEL_32;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v9;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Opening %@", buf, 0xCu);
      }
    }
    v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v9, 0, v31);
    uint64_t v18 = *MEMORY[0x1E4F1BF70];
    id v34 = 0;
    id v19 = (id)[v33 addPersistentStoreWithType:v18 configuration:0 URL:v17 options:v32 error:&v34];
    id v20 = v34;
    v21 = v20;
    if (v20)
    {
      int v22 = [v20 code];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v21;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "Failed to create database (%@)", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
      managedObjectContext = v5->_managedObjectContext;
      v5->_managedObjectContext = (NSManagedObjectContext *)v25;

      [(NSManagedObjectContext *)v5->_managedObjectContext setPersistentStoreCoordinator:v33];
      [(NSManagedObjectContext *)v5->_managedObjectContext setMergePolicy:*MEMORY[0x1E4F1BE48]];
      int v22 = 0;
    }

    if (!v22) {
      goto LABEL_26;
    }
LABEL_32:
    v27 = 0;
    goto LABEL_33;
  }
LABEL_26:
  v27 = v5;
LABEL_33:
  v29 = v27;

  return v29;
}

+ (id)systemDataStore
{
  if (+[MADSystemDataStore systemDataStore]::once != -1) {
    dispatch_once(&+[MADSystemDataStore systemDataStore]::once, &__block_literal_global_35);
  }
  uid_t v2 = (void *)+[MADSystemDataStore systemDataStore]::database;
  return v2;
}

void __37__MADSystemDataStore_systemDataStore__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaAnalysis"];
  if (v0
    || ([MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.mediaanalysisd"],
        (v0 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v1 = [v0 pathForResource:@"SystemDataStore" ofType:@"momd"];
    if (!v1)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_25:

        goto LABEL_26;
      }
      uid_t v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        uint64_t v10 = 0;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Missing model definition (%@)", (uint8_t *)&v9, 0xCu);
      }
LABEL_24:

      goto LABEL_25;
    }
    uid_t v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v2];
    if (v3)
    {
      id v4 = [[MADSystemDataStore alloc] initWithManagedObjectModel:v3];
      v5 = (void *)+[MADSystemDataStore systemDataStore]::database;
      +[MADSystemDataStore systemDataStore]::database = (uint64_t)v4;

      if (+[MADSystemDataStore systemDataStore]::database)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          uint64_t v6 = VCPLogInstance();
          os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v9) = 0;
            uint64_t v8 = "[MADSystemDataStore] Successfully opened MediaAnalysis CoreData";
LABEL_21:
            _os_log_impl(&dword_1BBEDA000, v6, v7, v8, (uint8_t *)&v9, 2u);
            goto LABEL_22;
          }
          goto LABEL_22;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v6 = VCPLogInstance();
        os_log_type_t v7 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v9) = 0;
          uint64_t v8 = "[MADSystemDataStore] Failed to open MediaAnalysis CoreData";
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v6 = VCPLogInstance();
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        uint64_t v8 = "[MADSystemDataStore] Failed to load embedding model";
        goto LABEL_21;
      }
LABEL_22:
    }
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    return;
  }
  v0 = VCPLogInstance();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to load bundle", (uint8_t *)&v9, 2u);
  }
LABEL_26:
}

- (id)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)rollbackAndResetContext
{
  [(NSManagedObjectContext *)self->_managedObjectContext rollback];
  [(NSManagedObjectContext *)self->_managedObjectContext reset];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Roll back and reset context", v4, 2u);
    }
  }
}

- (BOOL)commitChangesOrRollback:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  managedObjectContext = self->_managedObjectContext;
  id v10 = 0;
  BOOL v5 = [(NSManagedObjectContext *)managedObjectContext save:&v10];
  id v6 = v10;
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Committed changes", buf, 2u);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to commit changes (%@)", buf, 0xCu);
      }
    }
    if (a3) {
      *a3 = (id)[v6 copy];
    }
  }

  return v5;
}

- (BOOL)commitChangesOrRollbackAndResetContext:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  managedObjectContext = self->_managedObjectContext;
  id v11 = 0;
  BOOL v6 = [(NSManagedObjectContext *)managedObjectContext save:&v11];
  id v7 = v11;
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Committed changes", buf, 2u);
      }
    }
    [(NSManagedObjectContext *)self->_managedObjectContext reset];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to commit changes (%@)", buf, 0xCu);
      }
    }
    [(MADSystemDataStore *)self rollbackAndResetContext];
    if (a3) {
      *a3 = (id)[v7 copy];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end