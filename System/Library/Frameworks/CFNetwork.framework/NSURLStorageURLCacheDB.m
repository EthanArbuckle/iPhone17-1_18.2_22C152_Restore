@interface NSURLStorageURLCacheDB
- (BOOL)_prepareDBSelectStatements;
- (_BYTE)getEntryIDandReceiverDataForRequestKey:(sqlite3_stmt *)a1;
- (const)createCachedResponseForKey:(uint64_t)a1 cacheDataPath:(void *)a2 cacheDataFile:(void *)a3 caller:(void *)a4;
- (sqlite3)openReadWriteConnection;
- (sqlite3_stmt)_finalizeDBDeleteStatements;
- (sqlite3_stmt)_finalizeDBInsertUpdateStatements;
- (uint64_t)_closeDBWriteConnections;
- (uint64_t)_openDBReadConnections;
- (uint64_t)_openDBWriteConnections;
- (uint64_t)execSQLStatement:(os_unfair_lock_s *)a1 onConnection:(char *)sql toCompletionWithRetry:(sqlite3 *)a3 writeLockHeld:(int)a4;
- (uint64_t)isSchemaCurrent;
- (uint64_t)openAndPrepareWriteCacheDB_NoLock;
- (uint64_t)stepSQLStatement:(void *)a1 toCompletionWithRetry:(sqlite3_stmt *)a2;
- (uint64_t)updateToCurrentSchema;
- (void)_closeDBReadConnections;
- (void)dealloc;
- (void)initWithDBPath:(uint64_t)a3 maxSize:;
- (void)updateFSBackedCacheUsageOnDisk;
- (void)updateSQLiteDBCacheUsageOnDisk;
@end

@implementation NSURLStorageURLCacheDB

- (const)createCachedResponseForKey:(uint64_t)a1 cacheDataPath:(void *)a2 cacheDataFile:(void *)a3 caller:(void *)a4
{
  id v7 = a2;
  BOOL v42 = 0;
  if ((*(unsigned char *)(a1 + 153) & 1) == 0
    || !*(void *)(a1 + 80) && !-[NSURLStorageURLCacheDB _prepareDBSelectStatements](a1))
  {
    v8 = 0;
    goto LABEL_36;
  }
  CFStringRef v9 = (const __CFString *)v7;
  v10 = (__CFString *)v9;
  if (!*(void *)(a1 + 80))
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_34;
  }
  v11 = _ExtractCStringfromCFStringRef(v9, &v42);
  if (!v11)
  {
    v8 = 0;
    goto LABEL_35;
  }
  v12 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 80), 1, v11, -1, 0))
  {
    v8 = 0;
    v13 = 0;
    goto LABEL_32;
  }
  v37 = a4;
  v38 = a3;
  v34 = v11;
  v35 = v10;
  id v36 = v7;
  v39 = 0;
  v8 = 0;
  while (1)
  {
    int v14 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    int v15 = v14;
    if (v14 > 22) {
      break;
    }
    if (v14) {
      goto LABEL_29;
    }
LABEL_16:
    sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 0);
    int v41 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 1);
    v40 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 2);
    v16 = (UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 3);
    int v17 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 4);
    v18 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 5);
    v19 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 6);
    v20 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 7);
    v21 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 80), 8);
    int v22 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 5);
    if (v21)
    {
      uint64_t v23 = [NSString stringWithUTF8String:v21];

      v39 = (__CFString *)v23;
    }
    if (v17 && v18)
    {
      id v24 = [NSString alloc];
      id v26 = objc_getProperty((id)a1, v25, 160, 1);
      void *v38 = (id)[v24 initWithString:v26];

      void *v37 = (id)[[NSString alloc] initWithCString:v18 encoding:4];
LABEL_22:
      int v27 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 2);
      int v28 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 3);
      int v29 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 6);
      int v30 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 7);
      uint64_t CachedResponseFromParts = __createCachedResponseFromParts(v41, v40, v27, v16, v28, v18, v22, v19, v29, v20, v30);
      v8 = (const void *)CachedResponseFromParts;
      if (CachedResponseFromParts)
      {
        uint64_t v32 = *(void *)(CachedResponseFromParts + 16);
        if (v32) {
          *(unsigned char *)(v32 + 24) = 1;
        }
      }
      goto LABEL_26;
    }
    if (v18) {
      goto LABEL_22;
    }
    CFLog();
LABEL_26:
    if (v15 != 100) {
      goto LABEL_31;
    }
  }
  if (v14 == 100) {
    goto LABEL_16;
  }
  if (v14 == 101) {
    goto LABEL_31;
  }
LABEL_29:
  if (v8)
  {
    CFRelease(v8);
    v8 = 0;
  }
LABEL_31:
  id v7 = v36;
  v12 = (os_unfair_lock_s *)(a1 + 24);
  v13 = v39;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 80));
  v11 = v34;
  v10 = v35;
LABEL_32:
  os_unfair_lock_unlock(v12);
  if (v42) {
    MEMORY[0x18531B6B0](v11, 0x1000C8077774924);
  }
LABEL_34:

  v10 = v13;
LABEL_35:

LABEL_36:
  return v8;
}

- (void)initWithDBPath:(uint64_t)a3 maxSize:
{
  id v5 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)NSURLStorageURLCacheDB;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    a1[1] = 0;
    a1[2] = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    id v7 = (void *)a1[17];
    a1[17] = v6;

    a1[22] = a3;
    a1[26] = 4096;
    v8 = (void *)[v5 copy];
    objc_setProperty_atomic(a1, v9, v8, 160);

    v11 = [NSString stringWithFormat:@"%@/Cache.db", objc_getProperty(a1, v10, 160, 1)];
    objc_setProperty_atomic(a1, v12, v11, 168);

    a1[3] = 0;
  }

  return a1;
}

- (BOOL)_prepareDBSelectStatements
{
  if (!*(void *)(a1 + 8)) {
    return 0;
  }
  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*(void *)(a1 + 80))
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = sqlite3_mprintf("SELECT r.version, r.storage_policy, b.response_object, b.proto_props, d.isDataOnFS, d.receiver_data, b.request_object, b.user_info, r.time_stamp FROM cfurl_cache_response r, cfurl_cache_blob_data b, cfurl_cache_receiver_data d WHERE r.request_key=%q AND b.entry_ID=r.entry_ID AND b.entry_ID=d.entry_ID;",
           "?");
    int v5 = strlen(v4);
    BOOL v3 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 8), v4, v5, (sqlite3_stmt **)(a1 + 80), 0) == 0;
    sqlite3_free(v4);
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)updateSQLiteDBCacheUsageOnDisk
{
  if (a1)
  {
    BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (v3)
    {
      id v4 = objc_getProperty(a1, v2, 168, 1);
      uint64_t v6 = [NSString stringWithFormat:@"%@-shm", objc_getProperty(a1, v5, 168, 1)];
      v8 = [NSString stringWithFormat:@"%@-wal", objc_getProperty(a1, v7, 168, 1)];
      id v23 = 0;
      SEL v9 = [v3 attributesOfItemAtPath:v4 error:&v23];
      id v10 = v23;
      v11 = v10;
      if (v9 || !v10)
      {
        SEL v12 = [v9 objectForKey:*MEMORY[0x1E4F28390]];
        a1[24] = [v12 integerValue];
      }
      else
      {
        id v19 = v4;
        CFLog();
      }
      id v22 = v11;
      v13 = objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, &v22, v19);
      id v14 = v22;

      if (v13 || !v14)
      {
        int v15 = [v13 objectForKey:*MEMORY[0x1E4F28390]];
        a1[24] += [v15 integerValue];
      }
      else
      {
        v20 = v6;
        CFLog();
      }
      id v21 = v14;
      v16 = objc_msgSend(v3, "attributesOfItemAtPath:error:", v8, &v21, v20);
      id v17 = v21;

      if (v16 || !v17)
      {
        v18 = [v16 objectForKey:*MEMORY[0x1E4F28390]];
        a1[24] += [v18 integerValue];
      }
      else
      {
        CFLog();
      }
    }
    a1[25] = a1[23] + a1[24];
  }
}

- (void)updateFSBackedCacheUsageOnDisk
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 160, 1);
    if (v3)
    {
      SEL v5 = v3;
      uint64_t FS2 = _CFURLCacheCreateFS2((uint64_t)v3);
      if (FS2)
      {
        SEL v7 = (void *)FS2;
        BOOL v14 = 0;
        v8 = _ExtractCStringfromCFStringRef(*(const __CFString **)(FS2 + 80), &v14);
        if (v8)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          int v9 = dirstat_np();
          uint64_t v10 = *(void *)buf;
          if (v9 == -1) {
            int v11 = *__error();
          }
          else {
            int v11 = 0;
          }
          if (v14) {
            MEMORY[0x18531B6B0](v8, 0x1000C8077774924);
          }
          if ((v11 & 0xFFFFFFFD) != 0)
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            SEL v12 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = v7[10];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v11;
              _os_log_error_impl(&dword_184085000, v12, OS_LOG_TYPE_ERROR, "ERROR: unable to determine file-system usage for FS-backed cache at %@. Errno=%{errno}d", buf, 0x12u);
            }
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        a1[23] = v10;
        (*(void (**)(void *))(*v7 + 8))(v7);
      }
    }
    else
    {
      objc_getProperty(a1, v4, 160, 1);
      CFLog();
    }
    a1[25] = a1[23] + a1[24];
  }
}

- (_BYTE)getEntryIDandReceiverDataForRequestKey:(sqlite3_stmt *)a1
{
  if (![(NSURLStorageURLCacheDB *)a1 openAndPrepareWriteCacheDB_NoLock]) {
    return 0;
  }
  int v4 = sqlite3_bind_text(a1[11], 1, a2, -1, 0);
  SEL v5 = 0;
  if (!v4)
  {
    int v6 = sqlite3_step(a1[11]);
    if (v6 == 100 || v6 == 0)
    {
      int v8 = sqlite3_column_count(a1[11]);
      int v9 = v8 - 1;
      if (v8 >= 1)
      {
        int v10 = v8;
        int v11 = malloc_type_malloc(0x18uLL, 0x1010040760DC88DuLL);
        SEL v5 = v11;
        if (!v11) {
          goto LABEL_20;
        }
        void *v11 = 0;
        v11[1] = 0;
        *(void *)((char *)v11 + 13) = 0;
        if (sqlite3_column_type(a1[11], v10 - 3) == 1) {
          *(void *)SEL v5 = sqlite3_column_int64(a1[11], v10 - 3);
        }
        if (sqlite3_column_type(a1[11], v9) != 1) {
          goto LABEL_20;
        }
        if (!sqlite3_column_int64(a1[11], v9)) {
          goto LABEL_20;
        }
        v5[20] = 1;
        int v12 = v10 - 2;
        if ((sqlite3_column_type(a1[11], v10 - 2) - 3) > 1) {
          goto LABEL_20;
        }
        uint64_t v13 = sqlite3_column_text(a1[11], v10 - 2);
        int v14 = sqlite3_column_bytes(a1[11], v12);
        int v15 = (char *)malloc_type_malloc(v14 + 1, 0x921F41FBuLL);
        *((void *)v5 + 1) = v15;
        if (v15)
        {
          *((_DWORD *)v5 + 4) = v14;
          strncpy(v15, (const char *)v13, v14);
          *(unsigned char *)(*((void *)v5 + 1) + *((int *)v5 + 4)) = 0;
LABEL_20:
          sqlite3_reset(a1[11]);
          return v5;
        }
        CFLog();
        free(v5);
      }
    }
    SEL v5 = 0;
    goto LABEL_20;
  }
  return v5;
}

- (uint64_t)stepSQLStatement:(void *)a1 toCompletionWithRetry:(sqlite3_stmt *)a2
{
  if (a2)
  {
    uint64_t v4 = sqlite3_step(a2);
    uint64_t result = 0;
    if ((v4 - 100) >= 2 && v4)
    {
      if (v4 == 19)
      {
        return 19;
      }
      else
      {
        objc_getProperty(a1, v3, 168, 1);
        CFLog();
        return v4;
      }
    }
  }
  else
  {
    CFLog();
    return 1;
  }
  return result;
}

- (uint64_t)openAndPrepareWriteCacheDB_NoLock
{
  if (*((void *)self + 2)) {
    return 1;
  }
  uint64_t v4 = *((void *)self + 22);
  if (v4 < 5242880)
  {
    if (v4 >= 1)
    {
      objc_getProperty(self, a2, 160, 1);
      CFLog();
    }
    return 0;
  }
  else
  {
    uint64_t result = [(NSURLStorageURLCacheDB *)(sqlite3 **)self _openDBWriteConnections];
    if (result)
    {
      if (*((void *)self + 2))
      {
        if (!*((void *)self + 5))
        {
          SEL v5 = sqlite3_mprintf("INSERT into cfurl_cache_response (version, hash_value, storage_policy, \t\t\t\t\t\t\t\t\t request_key, partition) VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          int v6 = strlen(v5);
          if (sqlite3_prepare_v2(*((sqlite3 **)self + 2), v5, v6, (sqlite3_stmt **)self + 5, 0))
          {
            objc_getProperty(self, v7, 168, 1);
            CFLog();
          }
          sqlite3_free(v5);
        }
        if (!*((void *)self + 6))
        {
          int v8 = sqlite3_mprintf("INSERT into cfurl_cache_blob_data (entry_ID, response_object, request_object,\t\t\t\t\t\t\t\t\t proto_props, user_info) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          int v9 = strlen(v8);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v8, v9, (sqlite3_stmt **)self + 6, 0);
          sqlite3_free(v8);
        }
        if (!*((void *)self + 7))
        {
          int v10 = sqlite3_mprintf("INSERT into cfurl_cache_receiver_data (entry_ID, isDataOnFS, receiver_data) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q);",
                  "?",
                  "?",
                  "?");
          int v11 = strlen(v10);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v10, v11, (sqlite3_stmt **)self + 7, 0);
          sqlite3_free(v10);
        }
        if (!*((void *)self + 8))
        {
          int v12 = sqlite3_mprintf("UPDATE cfurl_cache_response SET version=%q, hash_value=%q, storage_policy=%q, partition=%q\t\t\t\t\t\t\t\t\t WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          int v13 = strlen(v12);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v12, v13, (sqlite3_stmt **)self + 8, 0);
          sqlite3_free(v12);
        }
        if (!*((void *)self + 9))
        {
          int v14 = sqlite3_mprintf("UPDATE cfurl_cache_blob_data SET response_object=%q, request_object=%q,\t\t\t\t\t\t\t\t\t proto_props=%q, user_info=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          int v15 = strlen(v14);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v14, v15, (sqlite3_stmt **)self + 9, 0);
          sqlite3_free(v14);
        }
        if (!*((void *)self + 4))
        {
          uint64_t v16 = sqlite3_mprintf("UPDATE cfurl_cache_receiver_data SET receiver_data=%q, isDataOnFS=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?");
          int v17 = strlen(v16);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v16, v17, (sqlite3_stmt **)self + 4, 0);
          sqlite3_free(v16);
        }
        if (!*((void *)self + 11))
        {
          v18 = sqlite3_mprintf("SELECT r.entry_ID, d.receiver_data, d.isDataOnFS FROM cfurl_cache_response r, cfurl_cache_receiver_data d WHERE r.request_key=%q AND d.entry_ID=r.entry_ID", "?");
          int v19 = strlen(v18);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v18, v19, (sqlite3_stmt **)self + 11, 0);
          sqlite3_free(v18);
        }
        if (!*((void *)self + 12))
        {
          v20 = sqlite3_mprintf("SELECT isDataOnFS,receiver_data FROM cfurl_cache_receiver_data WHERE entry_ID=%q", "?");
          int v21 = strlen(v20);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v20, v21, (sqlite3_stmt **)self + 12, 0);
          sqlite3_free(v20);
        }
        if (!*((void *)self + 13))
        {
          id v22 = sqlite3_mprintf("SELECT receiver_data from %s WHERE isDataOnFS > 0 AND entry_ID in \t\t\t\t\t\t\t\t\t (SELECT entry_ID from cfurl_cache_response WHERE entry_ID > 0 ORDER BY time_stamp ASC LIMIT %q)", "cfurl_cache_receiver_data", "?");
          int v23 = strlen(v22);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v22, v23, (sqlite3_stmt **)self + 13, 0);
          sqlite3_free(v22);
        }
        if (*((void *)self + 2))
        {
          if (!*((void *)self + 14))
          {
            id v24 = sqlite3_mprintf("DELETE from cfurl_cache_response WHERE entry_ID=%s;", "?");
            int v25 = strlen(v24);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v24, v25, (sqlite3_stmt **)self + 14, 0);
            sqlite3_free(v24);
          }
          if (!*((void *)self + 15))
          {
            id v26 = sqlite3_mprintf("DELETE from cfurl_cache_blob_data WHERE entry_ID=%s;", "?");
            int v27 = strlen(v26);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v26, v27, (sqlite3_stmt **)self + 15, 0);
            sqlite3_free(v26);
          }
          if (!*((void *)self + 16))
          {
            int v28 = sqlite3_mprintf("DELETE from cfurl_cache_receiver_data WHERE entry_ID=%s;", "?");
            int v29 = strlen(v28);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v28, v29, (sqlite3_stmt **)self + 16, 0);
            sqlite3_free(v28);
          }
        }
      }
      return 1;
    }
  }
  return result;
}

- (uint64_t)execSQLStatement:(os_unfair_lock_s *)a1 onConnection:(char *)sql toCompletionWithRetry:(sqlite3 *)a3 writeLockHeld:(int)a4
{
  errmsg = 0;
  uint64_t v4 = 1;
  if (sql && a3)
  {
    unint64_t v9 = 0;
    int v10 = a1 + 7;
    while (1)
    {
      uint64_t v11 = sqlite3_exec(a3, sql, 0, 0, &errmsg);
      uint64_t v4 = v11;
      char v12 = 1;
      if ((int)v11 > 18)
      {
        if ((v11 - 100) < 2) {
          goto LABEL_20;
        }
        if (v11 == 19) {
          goto LABEL_22;
        }
      }
      else if (v11 == 11)
      {
        if (a4) {
          os_unfair_lock_unlock(v10);
        }
        int v15 = 141;
        uint64_t v4 = sqlite3_file_control(a3, 0, 101, &v15);
        -[NSURLStorageURLCacheDB updateToCurrentSchema](a1);
        if (a4) {
          os_unfair_lock_lock(v10);
        }
        char v12 = 0;
      }
      else if (!v11)
      {
LABEL_20:
        uint64_t v4 = 0;
        goto LABEL_22;
      }
      if (errmsg) {
        break;
      }
      if (v9++ >= 9) {
        char v12 = 0;
      }
      if ((v12 & 1) == 0) {
        return v4;
      }
    }
    CFLog();
LABEL_22:
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }
  return v4;
}

- (uint64_t)_openDBWriteConnections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (const char *)objc_msgSend(objc_getProperty(a1, a2, 168, 1), "fileSystemRepresentation");
  int v4 = volumeSupportsFileProtection(v3);
  int v6 = a1[2];
  SEL v5 = a1 + 2;
  if (v6) {
    return 0;
  }
  if (v4) {
    int v7 = 3211270;
  }
  else {
    int v7 = 65542;
  }
  if (sqlite3_open_v2(v3, v5, v7, 0))
  {
    sqlite3_errmsg(*v5);
    CFLog();
    return 0;
  }
  char value = -1;
  if (setxattr(v3, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    unint64_t v9 = (id)CFNLog::logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *__error();
      *(_DWORD *)buf = 136315394;
      int v13 = v3;
      __int16 v14 = 1024;
      int v15 = v10;
      _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, "Failed to set can-suspend-locked at %s: %{errno}d", buf, 0x12u);
    }
  }
  sqlite3_db_config(*v5, 1001, 0, 1200, 32);
  sqlite3_busy_timeout(*v5, 1000);
  return 1;
}

- (uint64_t)isSchemaCurrent
{
  if ([(NSURLStorageURLCacheDB *)(uint64_t)a1 _openDBReadConnections])
  {
    ppStmt = 0;
    if (!sqlite3_prepare_v2(a1[1], "PRAGMA user_version", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        int v4 = sqlite3_column_int(ppStmt, 0);
        sqlite3_finalize(ppStmt);
        if (v4 == 203) {
          return 1;
        }
      }
      else
      {
        sqlite3_finalize(ppStmt);
      }
    }
    -[NSURLStorageURLCacheDB _closeDBReadConnections]((uint64_t)a1);
  }
  else
  {
    objc_getProperty(a1, v3, 168, 1);
    CFLog();
  }
  return 0;
}

- (uint64_t)_openDBReadConnections
{
  uint64_t v3 = 1;
  int v4 = (const char *)objc_msgSend(objc_getProperty( (id) a1, a2, 168, 1), "cStringUsingEncoding:", 4);
  if (volumeSupportsFileProtection(v4)) {
    int v5 = 3211270;
  }
  else {
    int v5 = 65542;
  }
  if ((*(unsigned char *)(a1 + 153) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if (!*(void *)(a1 + 8))
    {
      int v6 = sqlite3_open_v2(v4, (sqlite3 **)(a1 + 8), v5, 0);
      int v7 = *(sqlite3 **)(a1 + 8);
      if (!v6)
      {
        sqlite3_db_config(v7, 1001, 0, 1200, 32);
        sqlite3_busy_timeout(*(sqlite3 **)(a1 + 8), 1000);
        uint64_t v3 = 1;
        *(unsigned char *)(a1 + 153) = 1;
        goto LABEL_9;
      }
      sqlite3_errmsg(v7);
      CFLog();
    }
    uint64_t v3 = 0;
LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  return v3;
}

- (sqlite3_stmt)_finalizeDBInsertUpdateStatements
{
  v2 = a1[5];
  if (v2)
  {
    sqlite3_reset(v2);
    sqlite3_finalize(a1[5]);
    a1[5] = 0;
  }
  uint64_t v3 = a1[6];
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_finalize(a1[6]);
    a1[6] = 0;
  }
  int v4 = a1[7];
  if (v4)
  {
    sqlite3_reset(v4);
    sqlite3_finalize(a1[7]);
    a1[7] = 0;
  }
  int v5 = a1[9];
  if (v5)
  {
    sqlite3_reset(v5);
    sqlite3_finalize(a1[9]);
    a1[9] = 0;
  }
  int v6 = a1[4];
  if (v6)
  {
    sqlite3_reset(v6);
    sqlite3_finalize(a1[4]);
    a1[4] = 0;
  }
  uint64_t result = a1[8];
  if (result)
  {
    sqlite3_reset(result);
    uint64_t result = (sqlite3_stmt *)sqlite3_finalize(a1[8]);
    a1[8] = 0;
  }
  return result;
}

- (sqlite3_stmt)_finalizeDBDeleteStatements
{
  v2 = a1[15];
  if (v2)
  {
    sqlite3_reset(v2);
    sqlite3_finalize(a1[15]);
    a1[15] = 0;
  }
  uint64_t v3 = a1[16];
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_finalize(a1[16]);
    a1[16] = 0;
  }
  int v4 = a1[14];
  if (v4)
  {
    sqlite3_reset(v4);
    sqlite3_finalize(a1[14]);
    a1[14] = 0;
  }
  int v5 = a1[11];
  if (v5)
  {
    sqlite3_reset(v5);
    sqlite3_finalize(a1[11]);
    a1[11] = 0;
  }
  int v6 = a1[12];
  if (v6)
  {
    sqlite3_reset(v6);
    sqlite3_finalize(a1[12]);
    a1[12] = 0;
  }
  uint64_t result = a1[13];
  if (result)
  {
    sqlite3_reset(result);
    uint64_t result = (sqlite3_stmt *)sqlite3_finalize(a1[13]);
    a1[13] = 0;
  }
  return result;
}

- (uint64_t)_closeDBWriteConnections
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    uint64_t result = sqlite3_close((sqlite3 *)result);
    if (result) {
      return CFLog();
    }
    else {
      *(void *)(a1 + 16) = 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbPathFile, 0);
  objc_storeStrong((id *)&self->_dbPathDirectory, 0);

  objc_storeStrong((id *)&self->_entryIDsToDelete, 0);
}

- (void)dealloc
{
  if (self)
  {
    os_unfair_lock_lock(&self->_dbWriteConnectionLock);
    sqlSelectStmt = self->_sqlSelectStmt;
    if (sqlSelectStmt)
    {
      sqlite3_reset(sqlSelectStmt);
      sqlite3_finalize(self->_sqlSelectStmt);
      self->_sqlSelectStmt = 0;
    }
    -[NSURLStorageURLCacheDB _finalizeDBInsertUpdateStatements](&self->super.isa);
    -[NSURLStorageURLCacheDB _finalizeDBDeleteStatements](&self->super.isa);
    -[NSURLStorageURLCacheDB _closeDBReadConnections]((uint64_t)self);
    -[NSURLStorageURLCacheDB _closeDBWriteConnections]((uint64_t)self);
    os_unfair_lock_unlock(&self->_dbWriteConnectionLock);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLStorageURLCacheDB;
  [(NSURLStorageURLCacheDB *)&v4 dealloc];
}

- (void)_closeDBReadConnections
{
  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v3 = *(sqlite3 **)(a1 + 8);
  if (v3)
  {
    if (sqlite3_close(v3)) {
      CFLog();
    }
    else {
      *(void *)(a1 + 8) = 0;
    }
  }
  *(unsigned char *)(a1 + 153) = 0;

  os_unfair_lock_unlock(v2);
}

- (sqlite3)openReadWriteConnection
{
  v2 = (const char *)objc_msgSend(objc_getProperty(a1, a2, 168, 1), "cStringUsingEncoding:", 4);
  ppDb = 0;
  if (volumeSupportsFileProtection(v2)) {
    int v3 = 3211270;
  }
  else {
    int v3 = 65542;
  }
  int v4 = sqlite3_open_v2(v2, &ppDb, v3, 0);
  if (v4)
  {
    if (v4 != 14)
    {
      sqlite3_errmsg(ppDb);
      CFLog();
    }
  }
  else
  {
    sqlite3_busy_timeout(ppDb, 1000);
  }
  return ppDb;
}

- (uint64_t)updateToCurrentSchema
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v2 = self;
    if (!*(unsigned char *)(self + 152))
    {
      *(unsigned char *)(self + 152) = 1;
      if (!*(void *)(self + 16))
      {
        uint64_t v28 = *(void *)(self + 176);
        if (v28 < 5242880)
        {
          if (v28 >= 1)
          {
            objc_getProperty(self, a2, 160, 1);
            self = CFLog();
          }
          goto LABEL_102;
        }
        self = [(NSURLStorageURLCacheDB *)(sqlite3 **)self _openDBWriteConnections];
        if (!self)
        {
LABEL_102:
          *(unsigned char *)(v2 + 152) = 0;
          return self;
        }
      }
      id v3 = objc_getProperty((id)v2, a2, 160, 1);
      if (v3)
      {
        int v5 = v3;
        uint64_t FS2 = _CFURLCacheCreateFS2((uint64_t)v3);
        if (FS2)
        {
          int v7 = (void *)FS2;
          *(_WORD *)v77 = 0;
          CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)(FS2 + 80));
          if (Copy)
          {
            CFStringRef v10 = Copy;
            CFStringRef v11 = CFStringCreateWithFormat(v8, 0, @"%@/%s_remove", v7[9], "fsCachedData");
            if (v11)
            {
              CFStringRef v12 = v11;
              CStringfromCFStringRef = (const std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v10, &v77[1]);
              __int16 v14 = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v12, v77);
              if (!stat((const char *)v14, &v76) && v76.st_size && removefile((const char *)v14, 0, 1u))
              {
                if (CFNLog::onceToken != -1) {
                  dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                }
                uint64_t v16 = CFNLog::logger;
                if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                {
                  if (v14) {
                    v34 = (const char *)v14;
                  }
                  else {
                    v34 = "NULL";
                  }
                  int v35 = *__error();
                  *(_DWORD *)buf = 136315394;
                  v80 = (void *)v34;
                  __int16 v81 = 1024;
                  LODWORD(v82) = v35;
                  _os_log_error_impl(&dword_184085000, v16, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - failed to remove existing target dir %s.  Errno=%{errno}d", buf, 0x12u);
                }
              }
              rename(CStringfromCFStringRef, v14, v15);
              if (v18)
              {
                if (*__error() != 2)
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                  }
                  int v19 = CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                  {
                    id v36 = "NULL";
                    if (CStringfromCFStringRef) {
                      v37 = (const char *)CStringfromCFStringRef;
                    }
                    else {
                      v37 = "NULL";
                    }
                    if (v14) {
                      id v36 = (const char *)v14;
                    }
                    CFUUIDRef uuida = (CFUUIDRef)v36;
                    int v38 = *__error();
                    *(_DWORD *)buf = 136315650;
                    v80 = (void *)v37;
                    __int16 v81 = 2080;
                    v82 = uuida;
                    __int16 v83 = 1024;
                    int v84 = v38;
                    _os_log_error_impl(&dword_184085000, v19, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - failed to rename the current cache dir %s to new cache dir %s.  Errno=%{errno}d", buf, 0x1Cu);
                  }
                  *(_WORD *)v78 = 0;
                  __from = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v10, v78);
                  CFUUIDRef uuid = CFUUIDCreate(v8);
                  if (uuid)
                  {
                    CFStringRef v20 = CFUUIDCreateString(v8, uuid);
                    if (v20)
                    {
                      MutableCFStringRef Copy = CFStringCreateMutableCopy(v8, 0, v10);
                      CFStringRef v22 = MutableCopy;
                      if (MutableCopy)
                      {
                        CFStringAppend(MutableCopy, v20);
                        id v24 = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v22, &v78[1]);
                        if (v24)
                        {
                          rename(__from, v24, v23);
                          if (v26)
                          {
                            if (CFNLog::onceToken != -1) {
                              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                            }
                            v72 = CFNLog::logger;
                            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                            {
                              int v27 = *__error();
                              *(_DWORD *)buf = 136315650;
                              v80 = __from;
                              __int16 v81 = 2080;
                              v82 = v24;
                              __int16 v83 = 1024;
                              int v84 = v27;
                              _os_log_error_impl(&dword_184085000, v72, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure path cleanup also failed to rename the current cache dir %s to new cache dir %s.  Errno=%{errno}d", buf, 0x1Cu);
                            }
                          }
                          else
                          {
                            CFURLCacheFS::asyncCacheDirectoryRemove((CFURLCacheFS *)v24, v25);
                          }
                          if (v78[1]) {
                            MEMORY[0x18531B6B0](v24, 0x1000C8077774924);
                          }
                        }
                        else
                        {
                          if (CFNLog::onceToken != -1) {
                            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                          }
                          v33 = CFNLog::logger;
                          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v80 = (void *)v22;
                            _os_log_error_impl(&dword_184085000, v33, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure extract char string from CFStringRef:%@", buf, 0xCu);
                          }
                        }
                        CFRelease(v22);
                      }
                      else
                      {
                        if (CFNLog::onceToken != -1) {
                          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                        }
                        uint64_t v32 = CFNLog::logger;
                        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v80 = (void *)v10;
                          _os_log_error_impl(&dword_184085000, v32, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a mutable string from CFStringRef:%@", buf, 0xCu);
                        }
                      }
                      CFRelease(v20);
                    }
                    else
                    {
                      if (CFNLog::onceToken != -1) {
                        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                      }
                      v31 = CFNLog::logger;
                      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_184085000, v31, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a string from a UUID.", buf, 2u);
                      }
                    }
                    CFRelease(uuid);
                  }
                  else
                  {
                    if (CFNLog::onceToken != -1) {
                      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                    }
                    int v30 = CFNLog::logger;
                    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_184085000, v30, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a UUID.", buf, 2u);
                    }
                  }
                  if (v78[0] && __from) {
                    MEMORY[0x18531B6B0](__from, 0x1000C8077774924);
                  }
                }
              }
              else
              {
                CFURLCacheFS::asyncCacheDirectoryRemove((CFURLCacheFS *)v14, v17);
              }
              if (v77[1] && CStringfromCFStringRef) {
                MEMORY[0x18531B6B0](CStringfromCFStringRef, 0x1000C8077774924);
              }
              if (v14 && v77[0]) {
                MEMORY[0x18531B6B0](v14, 0x1000C8077774924);
              }
              CFRelease(v12);
            }
            else
            {
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              int v29 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v76.st_dev) = 0;
                _os_log_error_impl(&dword_184085000, v29, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - unable to allocate string for new path.", (uint8_t *)&v76, 2u);
              }
            }
            CFRelease(v10);
          }
          (*(void (**)(void *))(*v7 + 8))(v7);
        }
      }
      else
      {
        objc_getProperty((id)v2, v4, 160, 1);
        CFLog();
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v2 + 28));
      v40 = *(sqlite3 **)(v2 + 16);
      if (!v40)
      {
        v40 = [(NSURLStorageURLCacheDB *)(void *)v2 openReadWriteConnection];
        if (!v40)
        {
LABEL_101:
          self = -[NSURLStorageURLCacheDB _closeDBWriteConnections](v2);
          *(void *)(v2 + 200) = 0;
          goto LABEL_102;
        }
      }
      if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "PRAGMA auto_vacuum = 2;",
                           v40,
                           1))
      {
        id v42 = objc_getProperty((id)v2, v41, 168, 1);
        v43 = sqlite3_errmsg(v40);
        uint64_t v44 = sqlite3_errcode(v40);
        NSLog(&cfstr_ErrorNsurlstor.isa, v40, v42, v43, v44);
      }
      else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "PRAGMA journal_mode=WAL;", {
                                v40,
      }
                                1))
      {
        id v42 = objc_getProperty((id)v2, v45, 168, 1);
        v46 = sqlite3_errmsg(v40);
        uint64_t v47 = sqlite3_errcode(v40);
        NSLog(&cfstr_ErrorNsurlstor_0.isa, v42, v46, v47);
      }
      else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "DROP table IF EXISTS cfurl_cache_schema_version;", {
                                v40,
      }
                                1))
      {
        id v42 = objc_getProperty((id)v2, v48, 168, 1);
        v49 = sqlite3_errmsg(v40);
        uint64_t v50 = sqlite3_errcode(v40);
        NSLog(&cfstr_ErrorNsurlstor_1.isa, v40, v42, v49, v50);
      }
      else
      {
        -[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "DROP table IF EXISTS cfurl_cache_response;",
          v40,
          1);
        if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE table cfurl_cache_response(entry_ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, \t version INTEGER, hash_value INTEGER, storage_policy INTEGER, request_key TEXT UNIQUE, \t time_stamp NOT NULL DEFAULT CURRENT_TIMESTAMP, partition TEXT);",
                             v40,
                             1))
        {
          id v42 = objc_getProperty((id)v2, v51, 168, 1);
          v52 = sqlite3_errmsg(v40);
          uint64_t v53 = sqlite3_errcode(v40);
          NSLog(&cfstr_ErrorNsurlstor_2.isa, v42, v52, v53);
        }
        else
        {
          -[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "DROP table IF EXISTS cfurl_cache_blob_data;",
            v40,
            1);
          if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE table cfurl_cache_blob_data(entry_ID INTEGER PRIMARY KEY, response_object BLOB, request_object BLOB, \t\t\t  proto_props BLOB, user_info BLOB);",
                               v40,
                               1))
          {
            id v42 = objc_getProperty((id)v2, v54, 168, 1);
            v55 = sqlite3_errmsg(v40);
            uint64_t v56 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_3.isa, v42, v55, v56);
          }
          else if (sqlite3_exec(v40, "DROP table IF EXISTS cfurl_cache_receiver_data;", 0, 0, 0) {
                 || sqlite3_exec(v40, "CREATE table cfurl_cache_receiver_data(entry_ID INTEGER PRIMARY KEY, isDataOnFS INTEGER, receiver_data BLOB);",
          }
                      0,
                      0,
                      0))
          {
            id v42 = objc_getProperty((id)v2, v57, 168, 1);
            v58 = sqlite3_errmsg(v40);
            uint64_t v59 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_4.isa, v42, v58, v59);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE INDEX request_key_index ON cfurl_cache_response(request_key);", {
                                    v40,
          }
                                    1))
          {
            id v42 = objc_getProperty((id)v2, v60, 168, 1);
            v61 = sqlite3_errmsg(v40);
            uint64_t v62 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_5.isa, v42, v61, v62);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE INDEX time_stamp_index ON cfurl_cache_response(time_stamp);", {
                                    v40,
          }
                                    1))
          {
            id v42 = objc_getProperty((id)v2, v63, 168, 1);
            v64 = sqlite3_errmsg(v40);
            uint64_t v65 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_6.isa, v42, v64, v65);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE INDEX proto_props_index ON cfurl_cache_blob_data(entry_ID);", {
                                    v40,
          }
                                    1))
          {
            id v42 = objc_getProperty((id)v2, v66, 168, 1);
            v67 = sqlite3_errmsg(v40);
            uint64_t v68 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_7.isa, v42, v67, v68);
          }
          else
          {
            if (!-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "CREATE INDEX receiver_data_index ON cfurl_cache_receiver_data(entry_ID);",
                                  v40,
                                  1)
              && !-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:]((os_unfair_lock_s *)v2, "PRAGMA user_version=203", v40, 1))
            {
              goto LABEL_100;
            }
            id v42 = objc_getProperty((id)v2, v69, 168, 1);
            v70 = sqlite3_errmsg(v40);
            uint64_t v71 = sqlite3_errcode(v40);
            NSLog(&cfstr_ErrorNsurlstor_8.isa, v42, v70, v71);
          }
        }
      }

LABEL_100:
      -[NSURLStorageURLCacheDB _finalizeDBDeleteStatements]((sqlite3_stmt **)v2);
      -[NSURLStorageURLCacheDB _finalizeDBInsertUpdateStatements]((sqlite3_stmt **)v2);
      -[NSURLStorageURLCacheDB _closeDBWriteConnections](v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 28));
      goto LABEL_101;
    }
  }
  return self;
}

void __44__NSURLStorageURLCacheDB_deleteAllResponses__block_invoke(uint64_t a1)
{
}

sqlite3 *__44__NSURLStorageURLCacheDB_deleteAllResponses__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(sqlite3 **)(a1 + 40);
  if (v2) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    return (sqlite3 *)sqlite3_close(result);
  }
  return result;
}

@end