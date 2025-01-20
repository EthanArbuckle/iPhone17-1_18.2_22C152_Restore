@interface BRCDatabaseBackupManager
- (BOOL)enumerateRootURL:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateURL:(id)a3 rootURL:(id)a4 usingBlock:(id)a5 error:(id *)a6;
- (BRCDatabaseBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4;
- (NSArray)urlPropertiesToFetch;
- (NSURL)databaseURL;
- (NSURL)destinationDirectory;
- (NSURL)outputUserURL;
- (NSURL)userURL;
- (id)desiredBackupDataDirectoryForUserURL:(id)a3;
- (void)backUpWithCompletionBlock:(id)a3;
- (void)cleanOnDisk;
- (void)setDestinationDirectory:(id)a3;
- (void)setOutputUserURL:(id)a3;
- (void)setUserURL:(id)a3;
@end

@implementation BRCDatabaseBackupManager

- (BRCDatabaseBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCDatabaseBackupManager;
  v9 = [(BRCDatabaseBackupManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userURL, a3);
    objc_storeStrong((id *)&v10->_outputUserURL, a4);
    uint64_t v11 = [(BRCDatabaseBackupManager *)v10 desiredBackupDataDirectoryForUserURL:v10->_outputUserURL];
    destinationDirectory = v10->_destinationDirectory;
    v10->_destinationDirectory = (NSURL *)v11;

    if (!v10->_destinationDirectory)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ~/Library/Application Support/CloudDocs/session does not exist. No need to back up.%@", buf, 0xCu);
      }
    }
  }

  return v10;
}

- (void)backUpWithCompletionBlock:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(BRCDatabaseBackupManager *)self destinationDirectory];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [(BRCDatabaseBackupManager *)self destinationDirectory];
    id v8 = [v7 path];
    int v9 = [v6 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [(BRCDatabaseBackupManager *)self destinationDirectory];
      id v38 = 0;
      char v11 = [v6 removeItemAtURL:v10 error:&v38];
      id v12 = v38;

      if ((v11 & 1) == 0)
      {
        v13 = brc_bread_crumbs();
        v14 = brc_default_log();
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        {
          v15 = [(BRCDatabaseBackupManager *)self destinationDirectory];
          objc_super v16 = [v15 path];
          *(_DWORD *)buf = 138412802;
          v40 = v16;
          __int16 v41 = 2112;
          id v42 = v12;
          __int16 v43 = 2112;
          v44 = v13;
          v17 = "[ERROR] Unable to delete existing destination directory at %@: %@%@";
LABEL_20:
          _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, v17, buf, 0x20u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v12 = 0;
    }
    v18 = v12;
    uint64_t v19 = [(BRCDatabaseBackupManager *)self destinationDirectory];
    id v37 = v12;
    char v20 = [v6 createDirectoryAtURL:v19 withIntermediateDirectories:0 attributes:0 error:&v37];
    id v12 = v37;

    if (v20)
    {
      v21 = [BRCDatabaseBackupStorage alloc];
      v22 = [(BRCDatabaseBackupManager *)self databaseURL];
      v23 = [(BRCDatabaseBackupStorage *)v21 initWithDatabaseURL:v22];

      userURL = self->_userURL;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke;
      v35[3] = &unk_1E69960C8;
      v25 = v23;
      v36 = v25;
      id v34 = v12;
      BOOL v26 = [(BRCDatabaseBackupManager *)self enumerateRootURL:userURL usingBlock:v35 error:&v34];
      id v27 = v34;

      [(BRCDatabaseBackupStorage *)v25 flushAndClose];
      v28 = [(BRCDatabaseBackupManager *)self destinationDirectory];
      id v33 = v27;
      BRCRecursivelyChangeOwnerAndGroupToMobile(v28, &v33);
      id v12 = v33;

      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [(BRCDatabaseBackupManager *)self destinationDirectory];
        *(_DWORD *)buf = 138412802;
        v40 = v31;
        __int16 v41 = 2112;
        id v42 = v12;
        __int16 v43 = 2112;
        v44 = v29;
        _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] Calling completion block with URL: %@, error: %@%@", buf, 0x20u);
      }
      if (v26)
      {
        v32 = [(BRCDatabaseBackupManager *)self destinationDirectory];
        v4[2](v4, v32, 0);
      }
      else
      {
        ((void (**)(id, void *, id))v4)[2](v4, 0, v12);
      }

      goto LABEL_17;
    }
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      v15 = [(BRCDatabaseBackupManager *)self destinationDirectory];
      objc_super v16 = [v15 path];
      *(_DWORD *)buf = 138412802;
      v40 = v16;
      __int16 v41 = 2112;
      id v42 = v12;
      __int16 v43 = 2112;
      v44 = v13;
      v17 = "[ERROR] Could not create destination directory %@: %@%@";
      goto LABEL_20;
    }
LABEL_14:

    ((void (**)(id, void *, id))v4)[2](v4, 0, v12);
LABEL_17:

    goto LABEL_18;
  }
  v4[2](v4, 0, 0);
LABEL_18:
}

void __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  objc_super v16 = [[BRCDatabaseBackupRecord alloc] initWithRelativePath:v15 fileID:v14 docID:v13 genCount:a7 isDirectory:a8];

  v17 = brc_bread_crumbs();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) addRecord:v16];
}

- (id)desiredBackupDataDirectoryForUserURL:(id)a3
{
  v3 = [a3 URLByAppendingPathComponent:@"Library/Application Support/CloudDocs" isDirectory:1];
  v4 = [v3 URLByAppendingPathComponent:@"session" isDirectory:1];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [v3 URLByAppendingPathComponent:@"backup" isDirectory:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSURL)databaseURL
{
  v2 = [(BRCDatabaseBackupManager *)self destinationDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"backup_manifest.db"];

  return (NSURL *)v3;
}

- (NSArray)urlPropertiesToFetch
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1CE00];
  v6[0] = *MEMORY[0x1E4F1C520];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1C600];
  v6[2] = *MEMORY[0x1E4F1C550];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4F1C628];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  return (NSArray *)v4;
}

- (BOOL)enumerateRootURL:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  LOBYTE(v10) = 1;
  char v11 = [v8 URLByAppendingPathComponent:@"Library/Mobile Documents/" isDirectory:1];
  v30[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v22 = a5;
    id v15 = 0;
    uint64_t v16 = *(void *)v26;
LABEL_3:
    uint64_t v17 = 0;
    v18 = v15;
    while (1)
    {
      if (*(void *)v26 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
      char v20 = (void *)MEMORY[0x1D9438760]();
      id v24 = v18;
      BOOL v10 = [(BRCDatabaseBackupManager *)self enumerateURL:v19 rootURL:v8 usingBlock:v9 error:&v24];
      id v15 = v24;

      if (!v10) {
        break;
      }
      ++v17;
      v18 = v15;
      if (v14 == v17)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14) {
          goto LABEL_3;
        }
        LOBYTE(v10) = 1;
        break;
      }
    }
    a5 = v22;
  }
  else
  {
    id v15 = 0;
  }

  if (a5) {
    *a5 = v15;
  }

  return v10;
}

- (BOOL)enumerateURL:(id)a3 rootURL:(id)a4 usingBlock:(id)a5 error:(id *)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v52 = (void (**)(id, void, void *, NSObject *, void *, void *, uint64_t, uint64_t))a5;
  if (!v11)
  {
    brc_bread_crumbs();
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupManager enumerateURL:rootURL:usingBlock:error:]((uint64_t)v51, v17);
    }
    goto LABEL_25;
  }
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = [v11 path];
  char v14 = [v12 fileExistsAtPath:v13];

  if ((v14 & 1) == 0)
  {
    brc_bread_crumbs();
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupManager enumerateURL:rootURL:usingBlock:error:](v11, (uint64_t)v51, v17);
    }
LABEL_25:
    char v16 = 1;
    goto LABEL_26;
  }
  id v65 = 0;
  uint64_t v15 = *MEMORY[0x1E4F1C520];
  uint64_t v64 = 0;
  uint64_t v50 = v15;
  char v16 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v65);
  id v51 = v65;
  uint64_t v17 = 0;
  if (v16)
  {
    uint64_t v18 = [(BRCDatabaseBackupManager *)self urlPropertiesToFetch];
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    v54 = (void *)v18;
    char v20 = [v19 enumeratorAtURL:v10 includingPropertiesForKeys:v18 options:2 errorHandler:&__block_literal_global_16];

    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v68 = v10;
      __int16 v69 = 2112;
      v70 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] Enumarating URL: %@%@", buf, 0x16u);
    }
    char v42 = v16;
    id v43 = v11;
    id v44 = v10;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v20;
    uint64_t v55 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v55)
    {
      uint64_t v53 = *(void *)v61;
      uint64_t v48 = *MEMORY[0x1E4F1C550];
      uint64_t v49 = *MEMORY[0x1E4F1CE00];
      uint64_t v46 = *MEMORY[0x1E4F1C628];
      uint64_t v47 = *MEMORY[0x1E4F1C600];
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          id v24 = v17;
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v26 = (void *)MEMORY[0x1D9438760]();
          v59 = v17;
          long long v27 = [v25 resourceValuesForKeys:v54 error:&v59];
          uint64_t v17 = v59;

          if (v27)
          {
            v56 = [v27 objectForKeyedSubscript:v50];
            long long v28 = objc_msgSend(v56, "substringFromIndex:", objc_msgSend(v51, "length") + 1);
            v29 = [v27 objectForKeyedSubscript:v49];
            v30 = [v27 objectForKeyedSubscript:v48];
            v31 = [v27 objectForKeyedSubscript:v47];
            v32 = v31;
            v57 = v26;
            v58 = v17;
            id v33 = v25;
            if (v31) {
              uint64_t v34 = BRCGenerationCountFromData(v31);
            }
            else {
              uint64_t v34 = 0;
            }
            v36 = [v27 objectForKeyedSubscript:v46];
            uint64_t v37 = [v36 BOOLValue];

            id v38 = v33;
            v35 = v56;
            ((void (**)(id, void *, void *, NSObject *, void *, void *, uint64_t, uint64_t))v52)[2](v52, v38, v56, v28, v29, v30, v34, v37);

            long long v26 = v57;
            uint64_t v17 = v58;
          }
          else
          {
            v35 = brc_bread_crumbs();
            long long v28 = brc_default_log();
            if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              id v68 = v25;
              __int16 v69 = 2112;
              v70 = v17;
              __int16 v71 = 2112;
              v72 = v35;
              _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] Failed to fetch resource values for %@. Error: %@%@", buf, 0x20u);
            }
          }
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v55);
    }

    id v11 = v43;
    id v10 = v44;
    char v16 = v42;
  }
  else
  {
    v40 = brc_bread_crumbs();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v68 = v11;
      __int16 v69 = 2112;
      v70 = v17;
      __int16 v71 = 2112;
      v72 = v40;
      _os_log_error_impl(&dword_1D353B000, v41, (os_log_type_t)0x90u, "[ERROR] Could not get the canonical path for the root URL %@. Error: %@%@", buf, 0x20u);
    }

    if (a6)
    {
      uint64_t v17 = v17;
      *a6 = v17;
    }
  }
LABEL_26:

  return v16;
}

uint64_t __66__BRCDatabaseBackupManager_enumerateURL_rootURL_usingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    int v9 = 138412802;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    char v14 = v6;
    _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] Enumeration error: %@. Error: %@%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)cleanOnDisk
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  destinationDirectory = self->_destinationDirectory;
  id v10 = 0;
  char v5 = [v3 removeItemAtURL:destinationDirectory error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    int v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      int v9 = [(NSURL *)self->_destinationDirectory path];
      *(_DWORD *)buf = 138412802;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      char v16 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to remove directory %@: %@%@", buf, 0x20u);
    }
  }
}

- (NSURL)userURL
{
  return self->_userURL;
}

- (void)setUserURL:(id)a3
{
}

- (NSURL)outputUserURL
{
  return self->_outputUserURL;
}

- (void)setOutputUserURL:(id)a3
{
}

- (NSURL)destinationDirectory
{
  return self->_destinationDirectory;
}

- (void)setDestinationDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_outputUserURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
}

void __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D353B000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] %@%@", v2, 0x16u);
}

- (void)enumerateURL:(uint64_t)a1 rootURL:(NSObject *)a2 usingBlock:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D353B000, a2, (os_log_type_t)0x90u, "[ERROR] rootURL is nil, nothing to enumerate.%@", (uint8_t *)&v2, 0xCu);
}

- (void)enumerateURL:(NSObject *)a3 rootURL:usingBlock:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 path];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] %@ does not exist, nothing to enumerate.%@", v6, 0x16u);
}

@end