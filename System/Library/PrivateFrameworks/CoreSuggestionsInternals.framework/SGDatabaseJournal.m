@interface SGDatabaseJournal
+ (SGDatabaseJournal)journalWithName:(id)a3;
+ (id)_allowedTypesForQueryKeyedArchives;
+ (id)_binderForDictionary:(id)a3;
+ (id)journalForInMemoryDb;
- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5;
- (BOOL)deleteAllJournaledQueries;
- (BOOL)executeQueriesOnDatabase:(id)a3;
- (BOOL)journaling;
- (BOOL)startJournaling;
- (BOOL)stopJournaling;
- (id)_getCurrentFile;
- (void)_addCurrentFileToLog;
- (void)_clearCurrentFile;
- (void)_closeCurrentFile;
- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5;
@end

@implementation SGDatabaseJournal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)journaling
{
  return self->_journaling;
}

- (BOOL)stopJournaling
{
  if (self->_inMemory) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SGDatabaseJournal_stopJournaling__block_invoke;
  v5[3] = &unk_1E65C0728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v2 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __35__SGDatabaseJournal_stopJournaling__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (BOOL)startJournaling
{
  if (self->_inMemory) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SGDatabaseJournal_startJournaling__block_invoke;
  v5[3] = &unk_1E65C0728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v2 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __36__SGDatabaseJournal_startJournaling__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40) ^ 1;
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

- (BOOL)deleteAllJournaledQueries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SGDatabaseJournal_deleteAllJournaledQueries__block_invoke;
  v5[3] = &unk_1E65C0728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__SGDatabaseJournal_deleteAllJournaledQueries__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1CB79B230]();
  char v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(void **)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    id v20 = v15;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "Removing all journal files at %@", buf, 0xCu);
  }

  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v5 = +[SGPaths suggestionsSubdirectory:@"journals"];
  LOBYTE(v4) = [v4 hasPrefix:v5];

  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
    id v18 = 0;
    [v6 removeItemAtPath:v7 error:&v18];
    id v8 = v18;

    if (v8)
    {
      char v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to remove journal directory: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    id v17 = v8;
    [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v12 = v17;

    if (v12)
    {
      v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v12;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to re-create directory for storing journals: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      id v20 = v16;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "SGDatabaseJournal not removing bogus journal directory: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)executeQueriesOnDatabase:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = 1;
  if (!self->_inMemory)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke;
    block[3] = &unk_1E65C0700;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(queue, block);
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _closeCurrentFile];
  BOOL v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    char v3 = [*(id *)(a1 + 40) filename];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "Executing queries from journals to %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke_64;
  v4[3] = &unk_1E65C06D8;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  p_long long buf = &buf;
  [(id)v5 writeTransaction:v4];

  _Block_object_dispose(&buf, 8);
}

void __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke_64(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[SGXpcTransaction transactionWithName:"SGDatabaseJournal.executeQueriesOnDatabase"];
  v22 = 0;
  char v3 = (const char *)[*(id *)(*(void *)(a1 + 32) + 16) UTF8String];
  int v4 = scandir(v3, &v22, 0, MEMORY[0x1E4F14610]);
  if (v4 < 0)
  {
    uint64_t v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = *__error();
      id v20 = __error();
      uint64_t v21 = strerror(*v20);
      *(_DWORD *)long long buf = 67109378;
      int v24 = v19;
      __int16 v25 = 2080;
      v26 = v21;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to open journal directory: error(%i): %s", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_29;
  }
  int v5 = v4;
  if (!v4)
  {
    LODWORD(v6) = 0;
    goto LABEL_25;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = v22[v6];
    if (v7->d_type != 8)
    {
      free(v22[v6]);
      goto LABEL_14;
    }
    uint64_t v8 = (void *)[[NSString alloc] initWithUTF8String:v7->d_name];
    free(v7);
    int v9 = (void *)MEMORY[0x1CB79B230]();
    buf[0] = 0;
    if (([*(id *)(a1 + 32) _executeFile:v8 onDb:*(void *)(a1 + 40) becameLocked:buf] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    if (buf[0])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_24;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    int v11 = *(_DWORD *)(v10 + 24) + 1;
    *(_DWORD *)(v10 + 24) = v11;
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)long long buf = 67109120;
        int v24 = v13;
        _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "journal execution checking lock state after %u files", buf, 8u);
      }

      if (([MEMORY[0x1E4F93B10] isUnlocked] & 1) == 0) {
        break;
      }
    }

LABEL_14:
    if (v5 == ++v6)
    {
      LODWORD(v6) = v5;
      goto LABEL_25;
    }
  }
  char v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)long long buf = 67109120;
    int v24 = v16;
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_INFO, "journal execution exiting early after %u files because device is locked", buf, 8u);
  }

LABEL_24:
LABEL_25:
  int v17 = v6 + 1;
  if ((int)v6 + 1 < v5)
  {
    uint64_t v18 = 8 * v6 + 8;
    do
    {
      free(*(dirent **)((char *)v22 + v18));
      ++v17;
      v18 += 8;
    }
    while (v5 > v17);
  }
  free(v22);
LABEL_29:
}

- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (self->_inMemory)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SGDatabaseJournal.m", 225, @"Invalid parameter not satisfying: %@", @"!_inMemory" object file lineNumber description];
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  int v11 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v12 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:v9];
  int v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    v49 = v12;
    _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "executing journal file: %@", buf, 0xCu);
  }

  uint64_t v14 = (void *)MEMORY[0x1CB79B230]();
  char v15 = [[SGDatabaseJournalFile alloc] initWithPath:v12];
  int v16 = [(SGDatabaseJournalFile *)v15 read];

  if (v16)
  {
    int v17 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v18 = +[SGDatabaseJournal _allowedTypesForQueryKeyedArchives];
    int v19 = [v17 unarchivedObjectOfClasses:v18 fromData:v16 error:0];
  }
  else
  {
    int v19 = 0;
  }

  if (!v16)
  {
    int v26 = 0;
    char v25 = 1;
    goto LABEL_25;
  }
  if (!v19)
  {
    uint64_t v27 = sgLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v49 = v12;
      _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "Got nil after trying to unarchive a db journal: %@", buf, 0xCu);
    }

    int v19 = 0;
    goto LABEL_22;
  }
  id v20 = [v19 objectForKeyedSubscript:@"__query"];
  BOOL v21 = v20 == 0;

  if (v21)
  {
    v28 = sgLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v49 = v12;
      _os_log_error_impl(&dword_1CA650000, v28, OS_LOG_TYPE_ERROR, "No __query key set in journal file: %@", buf, 0xCu);
    }

LABEL_22:
    char v25 = 0;
    int v26 = 0;
    goto LABEL_25;
  }
  v22 = [v19 objectForKeyedSubscript:@"__query"];
  char v23 = [v22 isEqualToString:@"DELETE FROM snippets WHERE entityId NOT IN (SELECT id FROM entities.entity)"];

  if (v23)
  {
    int v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      v49 = v12;
      _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "ignoring journal file: %@", buf, 0xCu);
    }

    char v25 = 1;
  }
  else
  {
    v29 = (void *)MEMORY[0x1CB79B230]();
    v30 = [v19 objectForKeyedSubscript:@"__query"];
    v31 = +[SGDatabaseJournal _binderForDictionary:v19];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __52__SGDatabaseJournal__executeFile_onDb_becameLocked___block_invoke;
    v40[3] = &unk_1E65C06B0;
    id v32 = v19;
    id v41 = v32;
    v42 = &v44;
    v43 = a5;
    [v10 prepAndRunQuery:v30 onPrep:v31 onRow:0 onError:v40];

    char v25 = 1;
    int v19 = v32;
  }
  int v26 = 1;
LABEL_25:
  if (*((unsigned char *)v45 + 24))
  {
    v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v39 = 0;
    char v34 = [v33 removeItemAtPath:v12 error:&v39];
    id v35 = v39;

    if (v34)
    {
      v36 = sgLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v49 = v12;
        _os_log_debug_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEBUG, "SGDatabaseJournal deleted journal file: %@", buf, 0xCu);
      }
    }
    else
    {
      v36 = sgLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        v49 = v12;
        __int16 v50 = 2112;
        id v51 = v35;
        _os_log_error_impl(&dword_1CA650000, v36, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to delete journal file: %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v35 = 0;
    char v34 = 1;
  }
  if (!v26) {
    char v34 = v25;
  }
  _Block_object_dispose(&v44, 8);

  return v34;
}

uint64_t __52__SGDatabaseJournal__executeFile_onDb_becameLocked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"__query"];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when replaying query: %@: %@", (uint8_t *)&v8, 0x16u);
  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    int v5 = *(unsigned char **)(a1 + 48);
    if (v5) {
      unsigned char *v5 = 1;
    }
  }

  return 0;
}

- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (self->_inMemory)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_34;
    v20[3] = &unk_1E65C0688;
    id v21 = v10;
    id v22 = v8;
    id v23 = v9;
    [v21 writeTransaction:v20];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    unint64_t v13 = [v8 length];
    if (v13 >= 6) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = v13;
    }
    char v15 = [v8 substringToIndex:v14];
    int v16 = [v15 lowercaseString];
    int v17 = [v16 isEqualToString:@"select"];

    if (v17)
    {
      uint64_t v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "skipping select query", buf, 2u);
      }
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke;
      block[3] = &unk_1E65C0638;
      char v25 = v9;
      id v26 = v8;
      uint64_t v27 = self;
      id v28 = v11;
      dispatch_sync(queue, block);

      uint64_t v18 = v25;
    }
  }
}

void __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v3 = (void *)MEMORY[0x1CB79B230]([v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"__query"]);
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
  int v5 = [*(id *)(a1 + 48) _getCurrentFile];
  [v5 write:v4];

  uint64_t v6 = *(unsigned char **)(a1 + 48);
  if (v6[40])
  {
    [v6 _addCurrentFileToLog];
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = +[SGDatabaseJournal _binderForDictionary:*(void *)(a1 + 32)];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    unint64_t v13 = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2;
    uint64_t v14 = &unk_1E65C0610;
    id v15 = *(id *)(a1 + 40);
    int v16 = &v17;
    [v7 prepAndRunQuery:v8 onPrep:v9 onRow:0 onError:&v11];

    id v10 = *(void **)(a1 + 48);
    if (*((unsigned char *)v18 + 24)) {
      objc_msgSend(v10, "_clearCurrentFile", v11, v12, v13, v14);
    }
    else {
      objc_msgSend(v10, "_addCurrentFileToLog", v11, v12, v13, v14);
    }

    _Block_object_dispose(&v17, 8);
  }
}

void __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_34(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  int v4 = [MEMORY[0x1E4F93AF0] _binderForDictionary:a1[6]];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2_36;
  v5[3] = &unk_1E65C0660;
  id v6 = (id)a1[5];
  [v2 prepAndRunSQL:v3 onPrep:v4 onRow:0 onError:v5];
}

uint64_t __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2_36(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E4F93C08];
}

uint64_t __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v7, 0x16u);
  }

  if (_sqliteErrorIndicatesDeviceBecameLocked(v3)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }

  return 0;
}

- (void)_closeCurrentFile
{
  [(SGDatabaseJournalFile *)self->_currentFile destroyAndUnlinkIfEmpty];
  currentFile = self->_currentFile;
  self->_currentFile = 0;
}

- (void)_addCurrentFileToLog
{
  id v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  directoryPath = self->_directoryPath;
  id v5 = [NSString alloc];
  unint64_t serialNumber = self->_serialNumber;
  uuid = self->_uuid;
  self->_unint64_t serialNumber = serialNumber + 1;
  uint64_t v8 = (void *)[v5 initWithFormat:@"J-%20llu.%@.suggestdDbJournal", serialNumber, uuid];
  id v11 = [(NSString *)directoryPath stringByAppendingPathComponent:v8];

  __int16 v9 = [[SGDatabaseJournalFile alloc] initWithPath:v11];
  currentFile = self->_currentFile;
  self->_currentFile = v9;
}

- (void)_clearCurrentFile
{
}

- (id)_getCurrentFile
{
  currentFile = self->_currentFile;
  if (!currentFile)
  {
    [(SGDatabaseJournal *)self _addCurrentFileToLog];
    currentFile = self->_currentFile;
  }
  return currentFile;
}

+ (id)_allowedTypesForQueryKeyedArchives
{
  if (_allowedTypesForQueryKeyedArchives__pasOnceToken7 != -1) {
    dispatch_once(&_allowedTypesForQueryKeyedArchives__pasOnceToken7, &__block_literal_global_42793);
  }
  BOOL v2 = (void *)_allowedTypesForQueryKeyedArchives__pasExprOnceResult;
  return v2;
}

void __55__SGDatabaseJournal__allowedTypesForQueryKeyedArchives__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = (void *)MEMORY[0x1CB79B230]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  uint64_t v8 = (void *)_allowedTypesForQueryKeyedArchives__pasExprOnceResult;
  _allowedTypesForQueryKeyedArchives__pasExprOnceResult = v7;
}

+ (id)_binderForDictionary:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SGDatabaseJournal__binderForDictionary___block_invoke;
  v7[3] = &unk_1E65C05C8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

uint64_t __42__SGDatabaseJournal__binderForDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SGDatabaseJournal__binderForDictionary___block_invoke_2;
  v4[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
  v4[4] = a2;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __42__SGDatabaseJournal__binderForDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"__query"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"qmarksSeparatedByCommas"])
    {
      id v19 = v6;
      id v20 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v8) {
        goto LABEL_15;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      int v11 = 1;
      while (1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v14 = v11 + 1;
            sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 32), v11, [v13 longLongValue]);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            int v14 = v11 + 1;
            sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 32), v11, (const char *)[v13 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          int v11 = v14;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v9)
        {
LABEL_15:

          id v6 = v19;
          id v5 = v20;
          goto LABEL_21;
        }
      }
    }
    id v15 = [MEMORY[0x1E4F1CA98] null];

    if (v15 == v6)
    {
      +[SGSqliteDatabase bindParamToNull:name:](SGSqliteDatabase, "bindParamToNull:name:", *(void *)(a1 + 32), [v5 UTF8String]);
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [v5 UTF8String];
      if (isKindOfClass) {
        +[SGSqliteDatabase bindParam:name:int64:](SGSqliteDatabase, "bindParam:name:int64:", v17, v18, [v6 longLongValue]);
      }
      else {
        +[SGSqliteDatabase bindParam:v17 name:v18 nsstring:v6];
      }
    }
  }
LABEL_21:
}

+ (id)journalForInMemoryDb
{
  uint64_t v2 = objc_opt_new();
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.suggestions.databasejournal.inmemory", 0);
  id v4 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = v3;

  id v5 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(void *)(v2 + 24) = 0;
  id v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = v7;

  *(unsigned char *)(v2 + 41) = 1;
  return (id)v2;
}

+ (SGDatabaseJournal)journalWithName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  pthread_mutex_lock(&journalWithName__lock);
  id v4 = (void *)journalWithName__instances;
  if (!journalWithName__instances)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:1];
    id v6 = (void *)journalWithName__instances;
    journalWithName__instances = v5;

    id v4 = (void *)journalWithName__instances;
  }
  uint64_t v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v7 = objc_opt_new();
    id v9 = [@"com.apple.suggestions.databasejournal." stringByAppendingString:v3];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    int v11 = (void *)v7[1];
    v7[1] = v10;

    uint64_t v12 = +[SGPaths suggestionsSubdirectory:@"journals"];
    uint64_t v13 = [v12 stringByAppendingPathComponent:v3];
    int v14 = (void *)v7[2];
    v7[2] = v13;

    v7[3] = 0;
    id v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    uint64_t v17 = (void *)v7[4];
    void v7[4] = v16;

    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v19 = v7[2];
    id v24 = 0;
    char v20 = [v18 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v21 = v24;

    if (v20)
    {
      [(id)journalWithName__instances setObject:v7 forKey:v3];
    }
    else
    {
      long long v22 = sgLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v21;
        _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to create directory for storing journals: %@", buf, 0xCu);
      }

      uint64_t v7 = 0;
    }
  }
  pthread_mutex_unlock(&journalWithName__lock);

  return (SGDatabaseJournal *)v7;
}

@end