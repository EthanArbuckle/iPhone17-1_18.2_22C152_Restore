@interface BRCDatabaseBackupStorage
- (BOOL)addRecord:(id)a3;
- (BOOL)addRecordIfNotExist:(id)a3;
- (BOOL)attachDatabase:(id)a3 error:(id *)a4;
- (BOOL)clearStagedIDs:(id)a3;
- (BOOL)fixUpBackupDetector:(id)a3;
- (BOOL)fixUpClientState:(id)a3;
- (BOOL)negateIDs:(id)a3;
- (BOOL)setForeignKeys:(id)a3 enabled:(BOOL)a4;
- (BOOL)setUpDatabaseWithError:(id *)a3;
- (BOOL)updateAttachedDatabase;
- (BOOL)updateIDs:(id)a3;
- (BRCDatabaseBackupStorage)initWithDatabaseURL:(id)a3;
- (BRCPQLConnection)database;
- (NSArray)urlPropertiesToFetch;
- (NSURL)attachedDatabaseURL;
- (NSURL)databaseURL;
- (id)backupManifestEnumerator:(id)a3;
- (id)docIDForURL:(id)a3;
- (void)dealloc;
- (void)flushAndClose;
- (void)populateNewColumnsInDatabase:(id)a3 forRecord:(id)a4 basePath:(id)a5;
- (void)populateNewColumnsWithBasePath:(id)a3;
- (void)setAttachedDatabaseURL:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDatabaseURL:(id)a3;
- (void)setUrlPropertiesToFetch:(id)a3;
- (void)updateAttachedDatabase;
@end

@implementation BRCDatabaseBackupStorage

- (BRCDatabaseBackupStorage)initWithDatabaseURL:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCDatabaseBackupStorage;
  v6 = [(BRCDatabaseBackupStorage *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    v8 = [[BRCPQLConnection alloc] initWithLabel:@"backup-db" dbCorruptionHandler:0];
    database = v7->_database;
    v7->_database = v8;

    id v20 = 0;
    BOOL v10 = [(BRCDatabaseBackupStorage *)v7 setUpDatabaseWithError:&v20];
    id v11 = v20;
    if (v10)
    {
      uint64_t v12 = *MEMORY[0x1E4F1CE00];
      v22[0] = *MEMORY[0x1E4F1C520];
      v22[1] = v12;
      uint64_t v13 = *MEMORY[0x1E4F1C600];
      v22[2] = *MEMORY[0x1E4F1C550];
      v22[3] = v13;
      v22[4] = *MEMORY[0x1E4F1C628];
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
      urlPropertiesToFetch = v7->_urlPropertiesToFetch;
      v7->_urlPropertiesToFetch = (NSArray *)v14;
    }
    else
    {
      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = [v5 path];
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        v28 = v16;
        _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] Can't open database at %@: %@%@", buf, 0x20u);
      }
      urlPropertiesToFetch = v7;
      v7 = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = self->_databaseURL;
  v4 = self->_database;
  id v5 = [(BRCPQLConnection *)v4 serialQueue];

  if (v5)
  {
    v6 = [(BRCPQLConnection *)v4 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BRCDatabaseBackupStorage_dealloc__block_invoke;
    block[3] = &unk_1E6993628;
    v9 = v4;
    BOOL v10 = v3;
    dispatch_sync(v6, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)BRCDatabaseBackupStorage;
  [(BRCDatabaseBackupStorage *)&v7 dealloc];
}

void __35__BRCDatabaseBackupStorage_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v8 = 0;
  char v3 = objc_msgSend(v2, "brc_closeWithError:", &v8);
  id v4 = v8;
  if ((v3 & 1) == 0)
  {
    id v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      objc_super v7 = [*(id *)(a1 + 40) path];
      *(_DWORD *)buf = 138412802;
      BOOL v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_1D353B000, v6, (os_log_type_t)0x90u, "[ERROR] Can't close database at %@: %@%@", buf, 0x20u);
    }
  }
}

- (BOOL)setUpDatabaseWithError:(id *)a3
{
  BOOL v5 = [(BRCPQLConnection *)self->_database openAtURL:self->_databaseURL withFlags:3145734 error:a3];
  if (v5)
  {
    v6 = [(BRCPQLConnection *)self->_database userVersion];
    uint64_t v7 = [v6 integerValue];

    if (v7 > 0
      || (BOOL v8 = [(BRCPQLConnection *)self->_database execute:@"create table backup_manifest (relative_path blob not null, file_id integer, doc_id integer, gen_count integer, is_directory integer, new_file_id integer, new_doc_id integer, new_gen_count integer)"], [(BRCPQLConnection *)self->_database setUserVersion:1], v8))
    {
      [(BRCPQLConnection *)self->_database useBatchingWithDelay:1000 changeCount:0.5];
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      id v9 = [(BRCPQLConnection *)self->_database lastError];
      LOBYTE(v5) = 0;
      *a3 = v9;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)addRecord:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__BRCDatabaseBackupStorage_addRecord___block_invoke;
  v8[3] = &unk_1E6993A88;
  id v9 = v4;
  BOOL v10 = self;
  id v6 = v4;
  LOBYTE(database) = [(BRCPQLConnection *)database performWithFlags:1 action:v8];

  return (char)database;
}

uint64_t __38__BRCDatabaseBackupStorage_addRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) relativePath];
  uint64_t v5 = [v4 UTF8String];
  id v6 = [*(id *)(a1 + 32) fileID];
  uint64_t v7 = [v6 longLongValue];
  BOOL v8 = [*(id *)(a1 + 32) docID];
  uint64_t v9 = [v3 execute:@"INSERT INTO backup_manifest (relative_path, file_id, doc_id, gen_count, is_directory, new_file_id, new_doc_id, new_gen_count) VALUES (%s, %lld, %lld, %d, %d, NULL, NULL, NULL)", v5, v7, objc_msgSend(v8, "longLongValue"), objc_msgSend(*(id *)(a1 + 32), "genCount"), objc_msgSend(*(id *)(a1 + 32), "isDirectory")];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      __int16 v13 = [*(id *)(a1 + 40) databaseURL];
      uint64_t v14 = [v13 path];
      uint64_t v15 = [v3 lastError];
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v15;
      __int16 v20 = 2112;
      objc_super v21 = v10;
      _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] Can't insert into the database %@: %@%@", buf, 0x20u);
    }
  }

  return v9;
}

- (BOOL)addRecordIfNotExist:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke;
  v8[3] = &unk_1E6993A88;
  id v9 = v4;
  BOOL v10 = self;
  id v6 = v4;
  LOBYTE(database) = [(BRCPQLConnection *)database performWithFlags:1 action:v8];

  return (char)database;
}

uint64_t __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) relativePath];
  id v6 = (void *)[v3 numberWithSQL:@"SELECT 1 FROM backup_manifest WHERE relative_path = %@", v5];

  if ([v6 BOOLValue])
  {
    uint64_t v7 = 1;
  }
  else
  {
    v19 = v6;
    id v8 = [*v4 relativePath];
    uint64_t v9 = [v8 UTF8String];
    BOOL v10 = [*v4 fileID];
    uint64_t v11 = [v10 longLongValue];
    id v12 = [*v4 docID];
    uint64_t v7 = [v3 execute:@"INSERT INTO backup_manifest (relative_path, file_id, doc_id, gen_count, is_directory, new_file_id, new_doc_id, new_gen_count) VALUES (%s, %lld, %lld, %d, %d, NULL, NULL, NULL)", v9, v11, objc_msgSend(v12, "longLongValue"), objc_msgSend(*v4, "genCount"), objc_msgSend(*v4, "isDirectory")];

    if (v7)
    {
      if (![v3 changes])
      {
        uint64_t v7 = 1;
        goto LABEL_10;
      }
      __int16 v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke_cold_1((void *)(a1 + 32));
      }
    }
    else
    {
      __int16 v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v16 = [*(id *)(a1 + 40) databaseURL];
        v17 = [v16 path];
        __int16 v18 = [v3 lastError];
        *(_DWORD *)buf = 138412802;
        objc_super v21 = v17;
        __int16 v22 = 2112;
        v23 = v18;
        __int16 v24 = 2112;
        __int16 v25 = v13;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] Can't insert into the database %@: %@%@", buf, 0x20u);
      }
    }
    id v6 = v19;
  }
LABEL_10:

  return v7;
}

- (void)flushAndClose
{
  id v3 = [(BRCPQLConnection *)self->_database serialQueue];

  if (v3)
  {
    id v4 = [(BRCPQLConnection *)self->_database serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke;
    block[3] = &unk_1E6993698;
    void block[4] = self;
    dispatch_sync(v4, block);
  }
}

void __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  v2 = [*(id *)(a1 + 32) database];
  char v3 = [v2 execute:@"CREATE UNIQUE INDEX relative_path_index ON backup_manifest (relative_path)"];

  if ((v3 & 1) == 0)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke_cold_1(v1, (uint64_t)v4, v5);
    }
  }
  id v6 = [*v1 database];
  [v6 makeNextFlushFullSync];

  uint64_t v7 = [*v1 database];
  [v7 flush];

  id v8 = [*v1 database];
  id v15 = 0;
  char v9 = [v8 close:&v15];
  id v10 = v15;

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      __int16 v13 = [*v1 databaseURL];
      uint64_t v14 = [v13 path];
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      objc_super v21 = v11;
      _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] Can't close database at %@: %@%@", buf, 0x20u);
    }
  }
  [*v1 setDatabase:0];
}

- (id)backupManifestEnumerator:(id)a3
{
  char v3 = (void *)[a3 fetch:@"SELECT * FROM backup_manifest WHERE new_file_id IS NULL"];
  id v4 = [v3 enumerateObjects:&__block_literal_global_24];

  return v4;
}

BRCDatabaseBackupRecord *__53__BRCDatabaseBackupStorage_backupManifestEnumerator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [[BRCDatabaseBackupRecord alloc] initWithPQLResultSet:v2];

  return v3;
}

- (void)populateNewColumnsWithBasePath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] Populating new columns with base path: %@%@", buf, 0x16u);
  }

  database = self->_database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__BRCDatabaseBackupStorage_populateNewColumnsWithBasePath___block_invoke;
  v9[3] = &unk_1E6993A88;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(BRCPQLConnection *)database performWithFlags:5 action:v9];
}

uint64_t __59__BRCDatabaseBackupStorage_populateNewColumnsWithBasePath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) backupManifestEnumerator:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1D9438760](v5);
        objc_msgSend(*(id *)(a1 + 32), "populateNewColumnsInDatabase:forRecord:basePath:", v3, v9, *(void *)(a1 + 40), (void)v12);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  return 1;
}

- (void)populateNewColumnsInDatabase:(id)a3 forRecord:(id)a4 basePath:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 relativePath];
  long long v12 = [v10 stringByAppendingPathComponent:v11];

  long long v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
  urlPropertiesToFetch = self->_urlPropertiesToFetch;
  id v35 = 0;
  long long v15 = [v13 resourceValuesForKeys:urlPropertiesToFetch error:&v35];
  v16 = v35;
  if (v15)
  {
    uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1CE00]];
    __int16 v18 = [v9 docID];
    v33 = v12;
    v34 = v16;
    if ([v18 unsignedLongLongValue])
    {
      id v19 = [(BRCDatabaseBackupStorage *)self docIDForURL:v13];
    }
    else
    {
      id v19 = 0;
    }

    id v21 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1C600]];
    uint64_t v22 = *(unsigned int *)([v21 bytes] + 8);
    v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v32 = [v9 relativePath];
      *(_DWORD *)buf = 138413314;
      v37 = v17;
      __int16 v38 = 2112;
      v39 = v19;
      __int16 v40 = 1024;
      *(_DWORD *)v41 = v22;
      *(_WORD *)&v41[4] = 2112;
      *(void *)&v41[6] = v32;
      __int16 v42 = 2112;
      v43 = v23;
      _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating %@ %@ %d into database for %@%@", buf, 0x30u);
    }
    uint64_t v25 = [v17 unsignedLongLongValue];
    uint64_t v26 = [v9 relativePath];
    int v31 = v22;
    LOBYTE(v25) = [v8 execute:@"UPDATE backup_manifest SET new_file_id = %llu, new_doc_id = %@, new_gen_count = %d WHERE relative_path = %@", v25, v19, v22, v26];

    long long v12 = v33;
    if ((v25 & 1) == 0)
    {
      __int16 v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        v30 = [v9 relativePath];
        uint64_t v29 = [v8 lastError];
        *(_DWORD *)buf = 138413570;
        v37 = v17;
        __int16 v38 = 2112;
        v39 = v19;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v31;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v30;
        __int16 v42 = 2112;
        v43 = v29;
        __int16 v44 = 2112;
        v45 = v27;
        _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] Failed to update %@ %@ %d into database for %@: %@%@", buf, 0x3Au);
      }
    }

    v16 = v34;
  }
  else
  {
    uint64_t v17 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      __int16 v20 = [v13 path];
      *(_DWORD *)buf = 138412802;
      v37 = v20;
      __int16 v38 = 2112;
      v39 = v16;
      __int16 v40 = 2112;
      *(void *)v41 = v17;
      _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] Unable to fetch URL properties for %@: %@%@", buf, 0x20u);
    }
  }
}

- (BOOL)attachDatabase:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] Attaching database %@%@", buf, 0x16u);
  }
  p_attachedDatabaseURL = &self->_attachedDatabaseURL;
  if (self->_attachedDatabaseURL)
  {
    brc_bread_crumbs();
    long long v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      __int16 v20 = [(NSURL *)*p_attachedDatabaseURL path];
      id v21 = [v7 path];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] Already have attached database %@ while trying to attach database %@.%@", buf, 0x20u);
    }
    char v14 = 1;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__20;
    __int16 v38 = __Block_byref_object_dispose__20;
    id v39 = 0;
    database = self->_database;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __49__BRCDatabaseBackupStorage_attachDatabase_error___block_invoke;
    __int16 v27 = &unk_1E6996E08;
    id v16 = v7;
    id v28 = v16;
    uint64_t v29 = buf;
    char v14 = [(BRCPQLConnection *)database performWithFlags:1 action:&v24];
    if (v14)
    {
      objc_storeStrong((id *)p_attachedDatabaseURL, a3);
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v22 = objc_msgSend(v16, "path", v24, v25, v26, v27);
        uint64_t v23 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v30 = 138412802;
        int v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v17;
        _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] Unable to attach db %@: %@%@", v30, 0x20u);
      }
      if (a4) {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  return v14;
}

uint64_t __49__BRCDatabaseBackupStorage_attachDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) path];
  uint64_t v5 = [v3 execute:@"ATTACH DATABASE %@ AS clientdb", v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v3 lastError];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return v5;
}

- (id)docIDForURL:(id)a3
{
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  if (v4 < 0)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage docIDForURL:]();
    }
    uint64_t v6 = 0;
  }
  else
  {
    int v5 = v4;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:GSLibraryGetOrAllocateDocumentId()];
    if (!close(v5)) {
      goto LABEL_9;
    }
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage docIDForURL:]();
    }
  }

LABEL_9:
  return v6;
}

- (BOOL)updateAttachedDatabase
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_attachedDatabaseURL)
  {
    id v3 = brc_bread_crumbs();
    int v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [(NSURL *)self->_attachedDatabaseURL path];
      database = self->_database;
      *(_DWORD *)buf = 138412802;
      long long v13 = v5;
      __int16 v14 = 2112;
      long long v15 = database;
      __int16 v16 = 2112;
      uint64_t v17 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_INFO, "[INFO] Updating attached database %@ %@%@", buf, 0x20u);
    }
    uint64_t v7 = self->_database;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke;
    v11[3] = &unk_1E6993A60;
    v11[4] = self;
    return [(BRCPQLConnection *)v7 performWithFlags:5 action:v11];
  }
  else
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateAttachedDatabase]();
    }

    return 0;
  }
}

uint64_t __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_2((uint64_t)v3);
  }

  uint64_t v6 = 0;
  if ([*(id *)(a1 + 32) setForeignKeys:v3 enabled:0])
  {
    if ([*(id *)(a1 + 32) negateIDs:v3]
      && [*(id *)(a1 + 32) updateIDs:v3]
      && [*(id *)(a1 + 32) clearStagedIDs:v3]
      && [*(id *)(a1 + 32) fixUpBackupDetector:v3]
      && [*(id *)(a1 + 32) fixUpClientState:v3]
      && [*(id *)(a1 + 32) setForeignKeys:v3 enabled:1])
    {
      uint64_t v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_1((uint64_t)v3);
      }

      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (BOOL)setForeignKeys:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    if (([v5 execute:@"PRAGMA foreign_keys = ON"] & 1) == 0)
    {
      uint64_t v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
        -[BRCDatabaseBackupStorage setForeignKeys:enabled:]();
      }
LABEL_9:

      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  else if (([v5 execute:@"PRAGMA foreign_keys = OFF"] & 1) == 0)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage setForeignKeys:enabled:]();
    }
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)negateIDs:(id)a3
{
  id v3 = a3;
  if (([v3 execute:@"UPDATE clientdb.client_items SET item_file_id = -item_file_id"] & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage negateIDs:].cold.4();
    }
    goto LABEL_11;
  }
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage negateIDs:]();
  }

  if (([v3 execute:@"UPDATE clientdb.client_items SET item_doc_id = -item_doc_id"] & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage negateIDs:]();
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = brc_bread_crumbs();
  BOOL v7 = 1;
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage negateIDs:]();
  }
LABEL_12:

  return v7;
}

- (BOOL)updateIDs:(id)a3
{
  id v3 = a3;
  if (([v3 execute:@"CREATE INDEX file_id_gen_count_index ON backup_manifest(file_id, gen_count)"] & 1) == 0)
  {
    long long v12 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateIDs:]0();
    }
    goto LABEL_26;
  }
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage updateIDs:].cold.9();
  }

  if (([v3 execute:@"CREATE INDEX doc_id_index ON backup_manifest(doc_id)"] & 1) == 0)
  {
    long long v12 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateIDs:].cold.8();
    }
    goto LABEL_26;
  }
  uint64_t v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage updateIDs:].cold.7();
  }

  if (([v3 execute:@"UPDATE clientdb.client_items  SET item_generation = (SELECT new_gen_count FROM backup_manifest WHERE file_id = -clientdb.client_items.item_file_id AND gen_count = clientdb.client_items.item_generation)"] & 1) == 0)
  {
    long long v12 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateIDs:].cold.6();
    }
    goto LABEL_26;
  }
  id v8 = brc_bread_crumbs();
  BOOL v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage updateIDs:].cold.5();
  }

  if (([v3 execute:@"UPDATE OR IGNORE clientdb.client_items  SET item_file_id = (SELECT new_file_id FROM backup_manifest WHERE file_id = -clientdb.client_items.item_file_id)"] & 1) == 0)
  {
    long long v12 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateIDs:].cold.4();
    }
    goto LABEL_26;
  }
  id v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage updateIDs:]();
  }

  if (([v3 execute:@"UPDATE OR IGNORE clientdb.client_items  SET item_doc_id = (SELECT new_doc_id FROM backup_manifest WHERE doc_id = -clientdb.client_items.item_doc_id)"] & 1) == 0)
  {
    long long v12 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCDatabaseBackupStorage updateIDs:]();
    }
LABEL_26:
    BOOL v13 = 0;
    goto LABEL_27;
  }
  long long v12 = brc_bread_crumbs();
  BOOL v13 = 1;
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage updateIDs:]();
  }
LABEL_27:

  return v13;
}

- (BOOL)clearStagedIDs:(id)a3
{
  id v3 = a3;
  if (([v3 execute:@"UPDATE OR IGNORE clientdb.client_items SET item_staged_generation = NULL WHERE item_staged_generation IS NOT NULL"] & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage clearStagedIDs:]();
  }

  if (([v3 execute:@"UPDATE OR IGNORE clientdb.client_items SET item_staged_file_id = NULL WHERE item_staged_file_id IS NOT NULL"] & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
LABEL_10:
    }
      -[BRCDatabaseBackupStorage clearStagedIDs:]();
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = brc_bread_crumbs();
  BOOL v7 = 1;
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCDatabaseBackupStorage clearStagedIDs:]();
  }
LABEL_12:

  return v7;
}

- (BOOL)fixUpBackupDetector:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCDatabaseBackupStorage *)self attachedDatabaseURL];
  uint64_t v6 = [v5 URLByDeletingLastPathComponent];

  BOOL v7 = [v6 URLByAppendingPathComponent:@"control-odd" isDirectory:0];
  id v8 = [v6 URLByAppendingPathComponent:@"control-even" isDirectory:0];
  BOOL v9 = (void *)[v4 fetchObjectOfClass:objc_opt_class() sql:@"SELECT counter FROM clientdb.backup_detector"];
  id v30 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1CE00];
  id v29 = 0;
  char v11 = [v7 getResourceValue:&v30 forKey:v10 error:&v29];
  long long v12 = v30;
  id v13 = v29;
  uint64_t v26 = v8;
  if (v11)
  {
    id v27 = 0;
    id v28 = 0;
    char v14 = [v8 getResourceValue:&v28 forKey:v10 error:&v27];
    long long v15 = v28;
    id v16 = v27;

    if (v14)
    {
      if ([v9 unsignedLongLongValue]) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = v12;
      }
      uint64_t v18 = [v17 unsignedLongLongValue];
      if ([v9 unsignedLongLongValue]) {
        id v19 = v12;
      }
      else {
        id v19 = v15;
      }
      if ([v4 execute:@"UPDATE clientdb.backup_detector SET old = %llu, new = %llu", v18, -[NSObject unsignedLongLongValue](v19, "unsignedLongLongValue")])
      {
        __int16 v20 = brc_bread_crumbs();
        BOOL v21 = 1;
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[BRCDatabaseBackupStorage fixUpBackupDetector:]();
        }
        goto LABEL_20;
      }
      __int16 v20 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u)) {
        -[BRCDatabaseBackupStorage fixUpBackupDetector:]();
      }
    }
    else
    {
      __int16 v20 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        uint64_t v23 = [v26 path];
        *(_DWORD *)buf = 138412802;
        __int16 v32 = v23;
        __int16 v33 = 2112;
        id v34 = v16;
        __int16 v35 = 2112;
        v36 = v20;
        _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] Unable to get inode for %@: %@%@", buf, 0x20u);
      }
    }
    BOOL v21 = 0;
LABEL_20:

    goto LABEL_21;
  }
  long long v15 = brc_bread_crumbs();
  __int16 v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    uint64_t v25 = [v7 path];
    *(_DWORD *)buf = 138412802;
    __int16 v32 = v25;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    v36 = v15;
    _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] Unable to get inode for %@: %@%@", buf, 0x20u);
  }
  BOOL v21 = 0;
  id v16 = v13;
LABEL_21:

  return v21;
}

- (BOOL)fixUpClientState:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 fetch:@"SELECT * FROM client_state"];
  id v5 = +[BRCAccountSession _classesForClientState];
  if ([v4 next])
  {
    uint64_t v6 = [v4 unarchivedObjectOfClasses:v5 atIndex:0];
    [v4 close];
    BOOL v7 = [[BRCClientState alloc] initWithDictionary:v6 clientStateData:0];
    id v8 = [(BRCClientState *)v7 objectForKeyedSubscript:@"fsevents"];
    BOOL v9 = objc_msgSend(v3, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT new_file_id FROM backup_manifest WHERE file_id = %llu", objc_msgSend(v8, "rootID"));
    objc_msgSend(v8, "setRootID:", objc_msgSend(v9, "unsignedLongLongValue"));
    uint64_t v10 = [(BRCClientState *)v7 dictionary];
    char v11 = (void *)[v10 mutableCopy];
    char v12 = [v3 execute:@"UPDATE client_state SET v = %@", v11];

    if (v12)
    {
      id v13 = brc_bread_crumbs();
      char v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCDatabaseBackupStorage fixUpClientState:]();
      }
    }
    else
    {
      id v13 = brc_bread_crumbs();
      char v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCDatabaseBackupStorage fixUpClientState:]();
      }
    }
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    brc_default_log();
    BOOL v7 = (BRCClientState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_FAULT)) {
      -[BRCDatabaseBackupStorage fixUpClientState:]();
    }
    char v12 = 0;
  }

  return v12;
}

- (BRCPQLConnection)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
}

- (NSArray)urlPropertiesToFetch
{
  return self->_urlPropertiesToFetch;
}

- (void)setUrlPropertiesToFetch:(id)a3
{
}

- (NSURL)attachedDatabaseURL
{
  return self->_attachedDatabaseURL;
}

- (void)setAttachedDatabaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedDatabaseURL, 0);
  objc_storeStrong((id *)&self->_urlPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Added record: %@%@", (void)v3, DWORD2(v3));
}

void __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*a1 databaseURL];
  BOOL v7 = [v6 path];
  id v8 = [*a1 database];
  BOOL v9 = [v8 lastError];
  int v10 = 138412802;
  char v11 = v7;
  __int16 v12 = 2112;
  id v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] Could not create a unique index %@: %@%@", (uint8_t *)&v10, 0x20u);
}

- (void)docIDForURL:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to open %@%@", v4, v5, v6, v7, v8);
}

- (void)docIDForURL:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] failed closing %@%@", v4, v5, v6, v7, v8);
}

- (void)updateAttachedDatabase
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Not updating attached database because no database has been attached.%@", v1, 0xCu);
}

void __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Successfully finished updating attach database batch: %@%@", (void)v3, DWORD2(v3));
}

void __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Beginning update attach database batch: %@%@", (void)v3, DWORD2(v3));
}

- (void)setForeignKeys:enabled:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to enable foreign keys: %@%@", v4, v5, v6, v7, v8);
}

- (void)setForeignKeys:enabled:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to disable foreign keys: %@%@", v4, v5, v6, v7, v8);
}

- (void)negateIDs:.cold.1()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when negating doc ids%@", v3, v4, v5, v6, v7);
}

- (void)negateIDs:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to negate doc ids: %@%@", v4, v5, v6, v7, v8);
}

- (void)negateIDs:.cold.3()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when negating file ids%@", v3, v4, v5, v6, v7);
}

- (void)negateIDs:.cold.4()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to negate file ids: %@%@", v4, v5, v6, v7, v8);
}

- (void)updateIDs:.cold.1()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when updating doc ids%@", v3, v4, v5, v6, v7);
}

- (void)updateIDs:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to update the doc ids: %@%@", v4, v5, v6, v7, v8);
}

- (void)updateIDs:.cold.3()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when updating file ids%@", v3, v4, v5, v6, v7);
}

- (void)updateIDs:.cold.4()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to update the file ids: %@%@", v4, v5, v6, v7, v8);
}

- (void)updateIDs:.cold.5()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when updating gen counts%@", v3, v4, v5, v6, v7);
}

- (void)updateIDs:.cold.6()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to update the gen count: %@%@", v4, v5, v6, v7, v8);
}

- (void)updateIDs:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Created doc_id_index%@", v2, v3, v4, v5, v6);
}

- (void)updateIDs:.cold.8()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to create doc_id_index, so updating will be incredibly slow: %@%@", v4, v5, v6, v7, v8);
}

- (void)updateIDs:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Created file_id_gen_count_index%@", v2, v3, v4, v5, v6);
}

- (void)updateIDs:.cold.10()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to create file_id_gen_count_index, so updating will be incredibly slow: %@%@", v4, v5, v6, v7, v8);
}

- (void)clearStagedIDs:.cold.1()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when clearing the staged file ids%@", v3, v4, v5, v6, v7);
}

- (void)clearStagedIDs:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to update the staged file ids: %@%@", v4, v5, v6, v7, v8);
}

- (void)clearStagedIDs:.cold.3()
{
  OUTLINED_FUNCTION_8();
  [v0 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Changed %lld items when clearing the staged generation ids%@", v3, v4, v5, v6, v7);
}

- (void)fixUpBackupDetector:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Patched the backup detector%@", v2, v3, v4, v5, v6);
}

- (void)fixUpBackupDetector:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Failed to update the backup detector value: %@%@", v4, v5, v6, v7, v8);
}

- (void)fixUpClientState:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Fixed up the FSEvents root ID%@", v2, v3, v4, v5, v6);
}

- (void)fixUpClientState:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] unable to flush client state, crash to maintain consistency%@", v1, 0xCu);
}

- (void)fixUpClientState:.cold.3()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 lastError];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] there should always be one row in client_state {%@}%@", v3, 0x16u);
}

@end