@interface QLExternalThumbnailCacheDatabase
- (BOOL)deleteOldestThumbnail;
- (BOOL)insertOrReplaceThumbnailRepresentingFPItem:(id)a3 size:(unint64_t)a4 modificationDate:(id)a5 fileExtension:(id)a6 error:(id *)a7;
- (BOOL)open;
- (BOOL)removeAllThumbnails:(id *)a3;
- (NSURL)databaseURL;
- (PQLConnection)db;
- (QLExternalThumbnailCacheDatabase)initWithURL:(id)a3;
- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4;
- (id)_openDatabaseAtURL:(id)a3;
- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4;
- (id)deleteOldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4;
- (id)oldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4;
- (id)pathExtensionForItem:(id)a3 error:(id *)a4;
- (id)whereClauseForItem:(id)a3;
- (unint64_t)totalThumbnailCount;
- (unint64_t)totalThumbnailsSize;
- (void)_closeDatabaseOnItsQueue:(id)a3;
- (void)close;
- (void)deleteOldestThumbnail;
- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5;
- (void)open;
- (void)totalThumbnailCount;
- (void)totalThumbnailsSize;
@end

@implementation QLExternalThumbnailCacheDatabase

- (QLExternalThumbnailCacheDatabase)initWithURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLExternalThumbnailCacheDatabase;
    v6 = [(QLExternalThumbnailCacheDatabase *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_databaseURL, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)open
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_db)
  {
    v3 = _log_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[QLExternalThumbnailCacheDatabase open]();
    }

    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(QLExternalThumbnailCacheDatabase *)v2 _openDatabaseAtURL:v2->_databaseURL];
    if (v5) {
      objc_storeStrong((id *)&v2->_db, v5);
    }
    BOOL v4 = v2->_db != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)_openDatabaseAtURL:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  id v5 = [(QLExternalThumbnailCacheDatabase *)self _createDatabaseIfNeededAtURL:v4 error:&v21];
  id v6 = v21;
  if (!v5)
  {
    v7 = _log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.5();
    }

    unsigned int v8 = [v6 code];
    if (v8 > 0x1A || ((1 << v8) & 0x5000800) == 0) {
      goto LABEL_18;
    }
    objc_super v10 = _log_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.4();
    }

    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 removeItemAtURL:v4 error:0];

    id v20 = v6;
    id v5 = [(QLExternalThumbnailCacheDatabase *)self _createDatabaseIfNeededAtURL:v4 error:&v20];
    id v12 = v20;

    id v6 = v12;
    if (!v5)
    {
LABEL_18:
      v17 = _log_1();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:]();
      }

      goto LABEL_21;
    }
  }
  v13 = v6;
  id v19 = v6;
  v14 = [(QLExternalThumbnailCacheDatabase *)self _setupDatabaseTablesIfNeeded:v5 error:&v19];
  id v6 = v19;

  v15 = _log_1();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:]();
    }

LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:]();
  }

  [v14 useSerialQueue];
LABEL_22:

  return v14;
}

- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = _log_1();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:].cold.4();
  }

  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
LABEL_7:
    id v11 = objc_alloc_init(MEMORY[0x1E4FBA8F0]);
    [v11 setShouldUseWALJournalMode:0];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke;
    v36[3] = &unk_1E6009B90;
    v36[4] = self;
    v36[5] = v37;
    [v11 setSqliteErrorHandler:v36];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2;
    aBlock[3] = &unk_1E6009BB8;
    v35 = a4;
    id v8 = v11;
    id v33 = v8;
    v34 = v37;
    id v12 = (void (**)(void))_Block_copy(aBlock);
    [v8 setLabel:@"External thumbnail cache"];
    if ([v8 openAtURL:v6 sharedCache:0 error:a4])
    {
      if ([v8 setupPragmas])
      {
        [v8 setSynchronousMode:1];
        v13 = [v8 lastError];

        if (!v13)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_78;
          v31[3] = &unk_1E6009BE0;
          v31[4] = self;
          [v8 setSqliteErrorHandler:v31];
          v30 = _log_1();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:]();
          }

          id v21 = v8;
          goto LABEL_15;
        }
      }
      v12[2](v12);
    }
    else
    {
      v14 = _log_1();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:]((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    [v8 close:0];
    id v21 = 0;
LABEL_15:

    _Block_object_dispose(v37, 8);
    goto LABEL_16;
  }
  id v8 = [v6 URLByDeletingLastPathComponent];
  if (([v8 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:a4],
        v9,
        (v10 & 1) != 0))
  {

    goto LABEL_7;
  }
  v23 = _log_1();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:]((uint64_t)a4, v23, v24, v25, v26, v27, v28, v29);
  }

  id v21 = 0;
LABEL_16:

  return v21;
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 logError:v8 onDB:a2 statement:a3];
  uint64_t v9 = [v8 code];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) lastError];
    if (!v2)
    {
      v3 = _log_1();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
      }

      v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FBA910] code:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
    }
    id v10 = v2;
    **(void **)(a1 + 48) = v10;
  }
}

uint64_t __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) logError:a4 onDB:a2 statement:a3];
}

- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _log_1();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.5();
  }

  uint64_t v7 = [v5 userVersion];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 unsignedIntValue];
    if (v9)
    {
      int v10 = v9;
      id v11 = _log_1();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.4(v10, v11);
      }
      int v12 = 1;
    }
    else
    {
      uint64_t v15 = _log_1();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:](v15);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke;
      v23[3] = &__block_descriptor_44_e23_B16__0__PQLConnection_8l;
      int v24 = 0;
      v23[4] = a4;
      int v12 = [v5 performWithFlags:10 action:v23];
      uint64_t v16 = [v5 userVersion];
      int v17 = [v16 unsignedIntValue];

      if (v17 == 1) {
        goto LABEL_19;
      }
      id v11 = _log_1();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v5 userVersion];
        int v22 = [v21 unsignedIntValue];
        *(_DWORD *)buf = 67109376;
        int v26 = v22;
        __int16 v27 = 1024;
        int v28 = 1;
        _os_log_error_impl(&dword_1B281E000, v11, OS_LOG_TYPE_ERROR, "database is at version %u instead of %d", buf, 0xEu);
      }
    }

LABEL_19:
    uint64_t v18 = [v5 userVersion];
    int v19 = [v18 unsignedIntValue];
    if (v12 && !v19) {
      -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:]();
    }

    if ((v12 & 1) == 0)
    {
      [v5 close:0];

      id v5 = 0;
    }
    id v5 = v5;
    v14 = v5;
    goto LABEL_24;
  }
  if (a4)
  {
    *a4 = [v5 lastError];
  }
  v13 = _log_1();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:](v5, v13);
  }

  [v5 close:0];
  v14 = 0;
LABEL_24:

  return v14;
}

uint64_t __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = 0;
  uint64_t v3 = ql_external_thumbnail_cache_create_tables_initial(a2, &v7);
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = _log_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1((int *)(a1 + 40), (uint64_t)v4, v5);
    }

    if (*(void *)(a1 + 32)) {
      **(void **)(a1 + 32) = v4;
    }
  }

  return v3;
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  id v4 = (PQLConnection *)a3;
  id v8 = 0;
  char v5 = [(PQLConnection *)v4 close:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = _log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase _closeDatabaseOnItsQueue:]();
    }
  }
  if (self->_db == v4)
  {
    self->_db = 0;
  }
}

- (void)close
{
  uint64_t v3 = [(PQLConnection *)self->_db serialQueue];

  if (v3)
  {
    id v4 = [(PQLConnection *)self->_db serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__QLExternalThumbnailCacheDatabase_close__block_invoke;
    block[3] = &unk_1E6009C28;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

void __41__QLExternalThumbnailCacheDatabase_close__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 db];
  [v1 _closeDatabaseOnItsQueue:v2];
}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = _log_1();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
    {
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_1B281E000, v10, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (v11)
  {
    -[QLExternalThumbnailCacheDatabase logError:onDB:statement:]();
  }
}

- (BOOL)insertOrReplaceThumbnailRepresentingFPItem:(id)a3 size:(unint64_t)a4 modificationDate:(id)a5 fileExtension:(id)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  db = self->_db;
  if (db)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    __int16 v16 = [(PQLConnection *)db serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__QLExternalThumbnailCacheDatabase_insertOrReplaceThumbnailRepresentingFPItem_size_modificationDate_fileExtension_error___block_invoke;
    block[3] = &unk_1E6009C50;
    __int16 v27 = &v29;
    block[4] = self;
    id v17 = v12;
    id v25 = v17;
    unint64_t v28 = a4;
    id v26 = v14;
    dispatch_sync(v16, block);

    if (*((unsigned char *)v30 + 24))
    {
      uint64_t v18 = _log_1();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = v17;
        __int16 v35 = 2048;
        unint64_t v36 = a4;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_debug_impl(&dword_1B281E000, v18, OS_LOG_TYPE_DEBUG, "Successfully inserted or updated thumbnail for FPItem: %@, size: %lu, date: %@.", buf, 0x20u);
      }
    }
    else
    {
      id v21 = _log_1();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = [(PQLConnection *)self->_db lastError];
        -[QLExternalThumbnailCacheDatabase insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:]((uint64_t)v17, v22, buf, v21);
      }

      if (a7)
      {
        *a7 = [(PQLConnection *)self->_db lastError];
      }
    }
    BOOL v20 = *((unsigned char *)v30 + 24) != 0;

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    int v19 = _log_1();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:]();
    }

    BOOL v20 = 0;
  }

  return v20;
}

void __121__QLExternalThumbnailCacheDatabase_insertOrReplaceThumbnailRepresentingFPItem_size_modificationDate_fileExtension_error___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) db];
  id v2 = [*(id *)(a1 + 40) itemIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) versionIdentifier];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 execute:@"INSERT OR REPLACE INTO thumbnails(fpitemId, versionId, last_hit_date, size, file_extension) VALUES (%@, %@, %@, %llu, %@)", v2, v3, v4, *(void *)(a1 + 64), *(void *)(a1 + 48)];
}

- (id)deleteOldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -[QLExternalThumbnailCacheDatabase oldestThumbnailsToFreeAtLeastSpace:error:](self, "oldestThumbnailsToFreeAtLeastSpace:error:");
  id v8 = (id)v7;
  if (self->_db)
  {
    BOOL v9 = v7 == 0;
    int v10 = _log_1();
    BOOL v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B281E000, v11, OS_LOG_TYPE_INFO, "Won't delete thumbnails from database because an error occured.", buf, 2u);
      }

      id v8 = 0;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:]((uint64_t)v8, a3, v11);
      }

      *(void *)buf = 0;
      v23 = buf;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      id v12 = [(PQLConnection *)self->_db serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__QLExternalThumbnailCacheDatabase_deleteOldestThumbnailsToFreeAtLeastSpace_error___block_invoke;
      block[3] = &unk_1E6009A28;
      id v21 = buf;
      block[4] = self;
      id v13 = v8;
      id v20 = v13;
      dispatch_sync(v12, block);

      if (!v23[24])
      {
        if (a4)
        {
          *a4 = [(PQLConnection *)self->_db lastError];
        }

        id v14 = _log_1();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = [(PQLConnection *)self->_db lastError];
          -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:](v15, v26, v14);
        }

        id v13 = 0;
      }
      __int16 v16 = v20;
      id v8 = v13;

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v17 = _log_1();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:]();
    }

    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLExternalThumbnailCacheDatabaseErrorDomain" code:1 userInfo:0];
    }
  }

  return v8;
}

void __83__QLExternalThumbnailCacheDatabase_deleteOldestThumbnailsToFreeAtLeastSpace_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "execute:", @"DELETE FROM thumbnails ORDER BY last_hit_date LIMIT %llu", objc_msgSend(*(id *)(a1 + 40), "count"));
}

- (BOOL)deleteOldestThumbnail
{
  db = self->_db;
  id v4 = _log_1();
  id v5 = v4;
  if (db)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnail]();
    }

    uint64_t v10 = 0;
    BOOL v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v6 = [(PQLConnection *)self->_db serialQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__QLExternalThumbnailCacheDatabase_deleteOldestThumbnail__block_invoke;
    v9[3] = &unk_1E6009A50;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v6, v9);

    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnail]();
    }

    return 0;
  }
  return v7;
}

void __57__QLExternalThumbnailCacheDatabase_deleteOldestThumbnail__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 execute:@"DELETE FROM thumbnails ORDER BY last_hit_date LIMIT 1"];
}

- (unint64_t)totalThumbnailsSize
{
  db = self->_db;
  if (db)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    id v4 = [(PQLConnection *)db serialQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__QLExternalThumbnailCacheDatabase_totalThumbnailsSize__block_invoke;
    v8[3] = &unk_1E6009C78;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    unint64_t v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = _log_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase totalThumbnailsSize]();
    }

    return 0;
  }
  return v5;
}

void __55__QLExternalThumbnailCacheDatabase_totalThumbnailsSize__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  id v3 = (id)[v2 fetchObjectOfClass:objc_opt_class() sql:@"SELECT SUM(size) FROM thumbnails"];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 longLongValue];
}

- (unint64_t)totalThumbnailCount
{
  db = self->_db;
  if (db)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    id v4 = [(PQLConnection *)db serialQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__QLExternalThumbnailCacheDatabase_totalThumbnailCount__block_invoke;
    v8[3] = &unk_1E6009C78;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    unint64_t v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = _log_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase totalThumbnailCount]();
    }

    return 0;
  }
  return v5;
}

void __55__QLExternalThumbnailCacheDatabase_totalThumbnailCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  id v3 = (id)[v2 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) FROM thumbnails"];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 longLongValue];
}

- (id)pathExtensionForItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  db = self->_db;
  if (db)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__1;
    uint64_t v27 = __Block_byref_object_dispose__1;
    id v28 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__1;
    id v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    id v8 = [(PQLConnection *)db serialQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke;
    v13[3] = &unk_1E6009CA0;
    v13[4] = self;
    id v14 = v6;
    id v15 = &v17;
    __int16 v16 = &v23;
    dispatch_sync(v8, v13);

    if (a4)
    {
      uint64_t v9 = (void *)v18[5];
      if (v9) {
        *a4 = v9;
      }
    }
    id v10 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLExternalThumbnailCacheDatabaseErrorDomain" code:1 userInfo:0];
    }
    uint64_t v11 = _log_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase pathExtensionForItem:error:]();
    }

    id v10 = 0;
  }

  return v10;
}

void __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  id v3 = [*(id *)(a1 + 32) whereClauseForItem:*(void *)(a1 + 40)];
  id v4 = (void *)[v2 fetch:@"SELECT file_extension FROM thumbnails WHERE %@", v3];

  unint64_t v5 = [v4 error];

  if (v5)
  {
    id v6 = _log_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke_cold_1(v4, v6);
    }

    uint64_t v7 = [v4 error];
    uint64_t v8 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  if ([v4 next])
  {
    uint64_t v7 = [v4 stringAtIndex:0];
    uint64_t v8 = *(void *)(a1 + 56);
LABEL_7:
    uint64_t v9 = *(void *)(v8 + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
  }
}

- (id)oldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  if (!self->_db)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLExternalThumbnailCacheDatabaseErrorDomain" code:1 userInfo:0];
    }
    uint64_t v7 = _log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase pathExtensionForItem:error:]();
    }
    goto LABEL_12;
  }
  if ([(QLExternalThumbnailCacheDatabase *)self totalThumbnailsSize] < a3)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLExternalThumbnailCacheDatabaseErrorDomain" code:0 userInfo:0];
    }
    uint64_t v7 = _log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_1B281E000, v7, OS_LOG_TYPE_INFO, "Can't free space (%lu) because less than this space is stored in the DB.", (uint8_t *)&buf, 0xCu);
    }
LABEL_12:

    id v8 = 0;
    goto LABEL_17;
  }
  unint64_t v9 = [(QLExternalThumbnailCacheDatabase *)self totalThumbnailCount];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v10 = [(PQLConnection *)self->_db serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke;
  v13[3] = &unk_1E6009CC8;
  v13[4] = self;
  void v13[5] = &v14;
  v13[8] = v9;
  v13[9] = vcvtpd_u64_f64((double)v9 * 10.0 / 100.0);
  v13[6] = &buf;
  v13[7] = a3;
  dispatch_sync(v10, v13);

  if (a4)
  {
    uint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
    if (v11) {
      *a4 = v11;
    }
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&buf, 8);

LABEL_17:
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    unint64_t v2 = 0;
    while ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] < *(void *)(a1 + 64))
    {
      id v3 = [*(id *)(a1 + 32) db];
      id v4 = (void *)[v3 fetch:@"SELECT fpItemId, versionId, file_extension, size FROM thumbnails ORDER BY last_hit_date LIMIT %llu OFFSET %llu", *(void *)(a1 + 72), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count")];

      unint64_t v5 = [v4 error];

      if (v5)
      {
        uint64_t v16 = [v4 error];
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        id v19 = _log_1();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke_cold_1();
        }

        return;
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = [v4 enumerateObjectsOfClass:objc_opt_class()];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
            uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            if (!v12)
            {
              uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
              id v15 = *(void **)(v14 + 40);
              *(void *)(v14 + 40) = v13;

              uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            }
            [v12 addObject:v11];
            v2 += [v11 size];
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }

      if (v2 >= *(void *)(a1 + 56)) {
        return;
      }
    }
  }
}

- (BOOL)removeAllThumbnails:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->_db == 0;
  id v6 = _log_1();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCacheDatabase removeAllThumbnails:]();
    }

    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"QLExternalThumbnailCacheDatabaseErrorDomain" code:1 userInfo:0];
      BOOL v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[QLExternalThumbnailCacheDatabase removeAllThumbnails:]();
    }

    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v8 = [(PQLConnection *)self->_db serialQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__QLExternalThumbnailCacheDatabase_removeAllThumbnails___block_invoke;
    v13[3] = &unk_1E6009A50;
    v13[4] = self;
    void v13[5] = &v14;
    dispatch_sync(v8, v13);

    if (!*((unsigned char *)v15 + 24))
    {
      uint64_t v9 = _log_1();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [(PQLConnection *)self->_db lastError];
        [(QLExternalThumbnailCacheDatabase *)v10 removeAllThumbnails:v9];
      }

      if (a3)
      {
        *a3 = [(PQLConnection *)self->_db lastError];
      }
    }
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  return v11;
}

void __56__QLExternalThumbnailCacheDatabase_removeAllThumbnails___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 execute:@"DELETE FROM thumbnails"];
}

- (id)whereClauseForItem:(id)a3
{
  id v3 = a3;
  id v4 = _log_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[QLExternalThumbnailCacheDatabase whereClauseForItem:](v3, v4);
  }

  BOOL v5 = (void *)MEMORY[0x1E4FBA8F8];
  id v6 = [v3 itemIdentifier];
  uint64_t v7 = [v3 versionIdentifier];
  uint64_t v8 = [v5 formatInjection:@"fpItemId = %@ AND versionId = %@", v6, v7];

  return v8;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (PQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)open
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
}

- (void)_openDatabaseAtURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not create database after resetting it. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openDatabaseAtURL:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not setup the tables of the database. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openDatabaseAtURL:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Thumbnails database open and upgraded", v2, v3, v4, v5, v6);
}

- (void)_openDatabaseAtURL:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Corrupt database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
}

- (void)_openDatabaseAtURL:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not open the database: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1B281E000, v0, v1, "Successfully opened database %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNeededAtURL:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDatabaseIfNeededAtURL:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1B281E000, v0, v1, "Opening database at %@", v2, v3, v4, v5, v6);
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setupDatabaseTablesIfNeeded:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 lastError];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Hit error %@, closing db %@", (uint8_t *)&v5, 0x16u);
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.2()
{
  __assert_rtn("-[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:]", "QLExternalThumbnailCacheDatabase.m", 327, "(db.userVersion.unsignedIntValue >= QLExternalThumbnailCacheDatabaseVersionMax) || !result");
}

- (void)_setupDatabaseTablesIfNeeded:(os_log_t)log error:.cold.3(os_log_t log)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109376;
  v1[1] = 0;
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_debug_impl(&dword_1B281E000, log, OS_LOG_TYPE_DEBUG, "migrating database from version %d to %d", (uint8_t *)v1, 0xEu);
}

- (void)_setupDatabaseTablesIfNeeded:(int)a1 error:(NSObject *)a2 .cold.4(int a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  __int16 v5 = 1024;
  int v6 = 1;
  _os_log_debug_impl(&dword_1B281E000, a2, OS_LOG_TYPE_DEBUG, "no database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1B281E000, v0, v1, "Upgrading database %@", v2, v3, v4, v5, v6);
}

void __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a1 + 1;
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "can't migrate from version %d to %d: %@", (uint8_t *)v5, 0x18u);
}

- (void)_closeDatabaseOnItsQueue:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not close database %@: %@");
}

- (void)logError:onDB:statement:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Sqlite failed on %@ with error [%@]");
}

- (void)insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't add thumbnail to DB because it's not open.", v2, v3, v4, v5, v6);
}

- (void)insertOrReplaceThumbnailRepresentingFPItem:(uint8_t *)buf size:(os_log_t)log modificationDate:fileExtension:error:.cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Could not insert or replace thumbnail for FPItem:, %@. Error: %@", buf, 0x16u);
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't delete oldest thumbnails from database because it's not open.", v2, v3, v4, v5, v6);
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:(os_log_t)log error:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Could not delete thumbnails from DB to free space. Error: %@", buf, 0xCu);
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:(os_log_t)log error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1B281E000, log, OS_LOG_TYPE_DEBUG, "Removing oldest thumbnails to free space (%lu). Removing thumbnails: %@", (uint8_t *)&v3, 0x16u);
}

- (void)deleteOldestThumbnail
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Removing oldest thumbnail.", v2, v3, v4, v5, v6);
}

- (void)totalThumbnailsSize
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't get thumbnails size sum from the DB because it's not open.", v2, v3, v4, v5, v6);
}

- (void)totalThumbnailCount
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't get thumbnail count from the DB because it's not open.", v2, v3, v4, v5, v6);
}

- (void)pathExtensionForItem:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't get path extension for item identifier because DB is not open.", v2, v3, v4, v5, v6);
}

void __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Can't get path extension for item identifier because of database error: %@.", v4, 0xCu);
}

void __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Could not obtain data of old thumbnails to free space", v2, v3, v4, v5, v6);
}

- (void)removeAllThumbnails:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B281E000, v0, v1, "Can't delete all thumbnails from database because it's not open.", v2, v3, v4, v5, v6);
}

- (void)removeAllThumbnails:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Could not delete all thumbnails from database. Error: %@", buf, 0xCu);
}

- (void)removeAllThumbnails:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1B281E000, v0, v1, "Removing all thumbnails from database.", v2, v3, v4, v5, v6);
}

- (void)whereClauseForItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 itemIdentifier];
  uint64_t v5 = [a1 versionIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1B281E000, a2, OS_LOG_TYPE_DEBUG, "Using fpItemId=%@ and versionId=%@", (uint8_t *)&v6, 0x16u);
}

@end