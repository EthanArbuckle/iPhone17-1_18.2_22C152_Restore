void sub_247E5480C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E549DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E54DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASULogHandleForCategory(uint64_t a1)
{
  if (ASULogHandleForCategory_onceToken != -1) {
    dispatch_once(&ASULogHandleForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)ASULogHandleForCategory_logHandles[a1];

  return v2;
}

uint64_t __ASULogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.appstoreutilities", "Defaults");
  v1 = (void *)ASULogHandleForCategory_logHandles[0];
  ASULogHandleForCategory_logHandles[0] = (uint64_t)v0;

  qword_2692D0848 = (uint64_t)os_log_create("com.apple.appstoreutilities", "SQL");

  return MEMORY[0x270F9A758]();
}

void sub_247E552E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E55430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_247E55558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASUSQLiteCopyFoundationValue(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = (id *)v3;
  if (!v3 || (a2 & 0x80000000) != 0)
  {
    if (!v3)
    {
LABEL_11:
      uint64_t v5 = [v4 dataForColumnIndex:a2];
LABEL_12:
      id v6 = (id)v5;
      goto LABEL_13;
    }
LABEL_7:
    id v6 = 0;
    switch(sqlite3_column_type(*((sqlite3_stmt **)v3 + 6), a2))
    {
      case 1:
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "int64ForColumnIndex:", a2));
        goto LABEL_12;
      case 2:
        v7 = NSNumber;
        [v4 doubleForColumnIndex:a2];
        uint64_t v5 = objc_msgSend(v7, "numberWithDouble:");
        goto LABEL_12;
      case 3:
        goto LABEL_9;
      case 5:
        goto LABEL_13;
      default:
        goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (*((_DWORD *)v3 + 2) <= (int)a2) {
    goto LABEL_7;
  }
  switch(*(unsigned char *)(*((void *)v3 + 2) + a2))
  {
    case 0:
      goto LABEL_7;
    case 1:
      uint64_t v5 = [v3 dateForColumnIndex:a2];
      goto LABEL_12;
    case 2:
      v9 = [v3 dataForColumnIndex:a2];
      if (v9)
      {
        id v14 = 0;
        v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v14];
        id v11 = v14;
        if (v10) {
          goto LABEL_26;
        }
        v12 = ASULogHandleForCategory(1);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = [v4[5] objectAtIndexedSubscript:a2];
          *(_DWORD *)buf = 138543618;
          v16 = v13;
          __int16 v17 = 2114;
          id v18 = v11;
        }
      }
      else
      {
        id v11 = 0;
      }
      v10 = 0;
LABEL_26:
      id v6 = v10;

      break;
    case 3:
      uint64_t v5 = [v3 UUIDForColumnIndex:a2];
      goto LABEL_12;
    case 4:
      uint64_t v5 = [v3 URLForColumnIndex:a2];
      goto LABEL_12;
    case 5:
LABEL_9:
      uint64_t v5 = [v4 stringForColumnIndex:a2];
      goto LABEL_12;
    default:
      id v6 = 0;
      break;
  }
LABEL_13:

  return v6;
}

void sub_247E573C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_247E57E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E587A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E58B2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_247E59EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E5A48C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_247E5B300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E5B72C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_247E5BEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E5C87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_247E5CA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E5CD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E5D184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ASUSQLiteApplyConnectionOptions(sqlite3 *a1, void *a2)
{
  id v3 = a2;
  sqlite3_extended_result_codes(a1, 1);
  v4 = [v3 encryptionKeyId];

  if (!v4
    || ([v3 encryptionKeyId],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = ASUSQLiteEncryptDatabase((uint64_t)a1, v5),
        v5,
        !v6))
  {
    uint64_t v6 = sqlite3_exec(a1, "PRAGMA journal_mode=WAL", 0, 0, 0);
    if (!v6)
    {
      id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA cache_size=%ld", objc_msgSend(v3, "cacheSize"));
      uint64_t v6 = sqlite3_exec(a1, (const char *)[v7 UTF8String], 0, 0, 0);
    }
  }

  return v6;
}

uint64_t ASUSQLiteEncryptDatabase(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = +[ASUDefaultsManager databaseEncryptionKeyWithIdentifier:]((uint64_t)ASUDefaultsManager, v2);
    v4 = v3;
    if (v3 && [v3 length] == 16)
    {
      id v5 = 0;
    }
    else
    {
      id v14 = 0;
      uint64_t v6 = +[ASUSQLiteKeychainHelper fetchKeyWithIdentifier:v2 error:&v14];
      id v5 = v14;

      if (v6 && [v6 length] == 16)
      {
        v4 = v6;
      }
      else
      {

        v8 = ASULogHandleForCategory(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v2;
          _os_log_impl(&dword_247E53000, v8, OS_LOG_TYPE_DEFAULT, "Generating new encryption key for identifier: %{public}@", buf, 0xCu);
        }

        CCRandomGenerateBytes(buf, 0x10uLL);
        v4 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16];

        id v13 = 0;
        BOOL v9 = +[ASUSQLiteKeychainHelper storeKey:v4 withIdentifier:v2 error:&v13];
        id v5 = v13;
        if (!v9)
        {
          v10 = ASULogHandleForCategory(1);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v16 = v2;
            __int16 v17 = 2114;
            id v18 = v5;
            _os_log_fault_impl(&dword_247E53000, v10, OS_LOG_TYPE_FAULT, "Unable to fetch/generate key with identifier: %{public}@ error: %{public}@", buf, 0x16u);
          }

          +[ASUDefaultsManager setDatabaseEncryptionKey:withIdentifier:]((uint64_t)ASUDefaultsManager, v4, v2);
        }
      }
    }
    id v11 = v4;
    [v11 bytes];
    [v11 length];
    uint64_t v7 = sqlite3_key();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id ASUSQLiteCreateErrorForResultCode(int a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a1 - 100 < 2 || a1 == 0)
  {
    id v2 = 0;
  }
  else
  {
    v4 = sqlite3_errstr(a1);
    if (v4 && *v4)
    {
      uint64_t v8 = *MEMORY[0x263F08320];
      id v5 = [NSString stringWithUTF8String:v4];
      v9[0] = v5;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v2 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ASUSQLiteErrorDomain" code:a1 userInfo:v6];
  }

  return v2;
}

BOOL ASUSQLiteResultIsSuccess(unsigned __int8 a1)
{
  return a1 - 100 < 2 || a1 == 0;
}

void ASUSQLiteTrashDatabaseName(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08C38];
  id v4 = a1;
  id v5 = [v3 UUID];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v6 substringToIndex:8];

  uint64_t v8 = ASUSQLiteGetRelatedFilePath(v4, 0);
  BOOL v9 = ASUSQLiteGetRelatedFilePath(v4, 1);
  v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [v8 stringByAppendingString:v7];
  id v21 = 0;
  [v10 moveItemAtPath:v8 toPath:v11 error:&v21];
  id v12 = v21;

  id v13 = [MEMORY[0x263F08850] defaultManager];
  id v14 = [v9 stringByAppendingString:v7];
  id v20 = v12;
  [v13 moveItemAtPath:v9 toPath:v14 error:&v20];
  id v15 = v20;

  id v16 = [MEMORY[0x263F08850] defaultManager];
  __int16 v17 = [v4 stringByAppendingString:v7];
  id v19 = v15;
  [v16 moveItemAtPath:v4 toPath:v17 error:&v19];

  id v18 = v19;
  if (a2 && v18) {
    *a2 = v18;
  }
}

id ASUSQLiteGetRelatedFilePath(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v5 = v4;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_6;
    }
    uint64_t v6 = @"-wal";
  }
  else
  {
    uint64_t v6 = @"-shm";
  }
  id v2 = [v4 stringByAppendingString:v6];
LABEL_6:

  return v2;
}

uint64_t ASUSQLiteDeleteDatabase(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08850];
  id v4 = a1;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = ASUSQLiteGetRelatedFilePath(v4, 0);
  id v15 = 0;
  [v5 removeItemAtPath:v6 error:&v15];
  id v7 = v15;

  uint64_t v8 = ASUSQLiteGetRelatedFilePath(v4, 1);
  id v14 = v7;
  [v5 removeItemAtPath:v8 error:&v14];
  id v9 = v14;

  id v13 = v9;
  uint64_t v10 = [v5 removeItemAtPath:v4 error:&v13];

  id v11 = v13;
  if (a2 && v11) {
    *a2 = v11;
  }

  return v10;
}

uint64_t ASUSQLiteOpenDatabaseAndApplyOptions(sqlite3 **a1, void *a2)
{
  id v3 = a2;
  ppDb = 0;
  id v4 = [v3 databasePath];
  if ([v3 isReadOnly])
  {
    int v5 = 2;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08850]);
    id v7 = [v4 stringByDeletingLastPathComponent];
    [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

    int v5 = 6;
  }
  uint64_t v8 = [v3 protectionType];
  id v9 = v8;
  if (v8) {
    v5 |= ASUSQLiteOpenFlagForProtectionType(v8);
  }
  id v10 = v4;
  uint64_t v11 = sqlite3_open_v2((const char *)[v10 fileSystemRepresentation], &ppDb, v5, 0);
  if (v11 || (uint64_t v11 = ASUSQLiteApplyConnectionOptions(ppDb, v3), v11))
  {
    if (ppDb) {
      sqlite3_close(ppDb);
    }
  }
  else
  {
    *a1 = ppDb;
  }

  return v11;
}

uint64_t ASUSQLiteOpenFlagForProtectionType(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 isEqualToString:*MEMORY[0x263F080B0]])
    {
      uint64_t v3 = 0x400000;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F08080]])
    {
      uint64_t v3 = 0x100000;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F08088]])
    {
      uint64_t v3 = 0x200000;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F08098]])
    {
      uint64_t v3 = 3145728;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_247E603B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E60544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E60F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASUSQLiteBindFoundationValue(void *a1, uint64_t a2, void *a3)
{
  id v9 = a1;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindArray:v5 atPosition:a2];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindDictionary:v5 atPosition:a2];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindString:v5 atPosition:a2];
    goto LABEL_10;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v9 bindNullAtPosition:a2];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 timeIntervalSinceReferenceDate];
LABEL_15:
    objc_msgSend(v9, "bindDouble:atPosition:", a2);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindData:v5 atPosition:a2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 bindUUID:v5 atPosition:a2];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [v5 absoluteString];
        [v9 bindString:v6 atPosition:a2];
      }
      else
      {
        id v7 = v5;
        uint64_t v8 = (const char *)[v7 objCType];
        if (!strcmp(v8, "d") || !strcmp(v8, "f"))
        {
          [v7 doubleValue];
          goto LABEL_15;
        }
        objc_msgSend(v9, "bindInt64:atPosition:", objc_msgSend(v7, "longLongValue"), a2);
      }
    }
  }
LABEL_10:
}

__CFString *ASUSQLitePlaceholderGenerator(uint64_t a1)
{
  if (a1)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:3 * a1 + 1];
    [v2 appendString:@"?"];
    uint64_t v3 = a1 - 1;
    if (a1 != 1)
    {
      do
      {
        [v2 appendString:@", ?"];
        --v3;
      }
      while (v3);
    }
    id v4 = (__CFString *)[v2 copy];
  }
  else
  {
    id v4 = &stru_26FC18F88;
  }

  return v4;
}

void sub_247E62CB0(_Unwind_Exception *a1)
{
}

void sub_247E63214(_Unwind_Exception *a1)
{
}

void sub_247E638F4(_Unwind_Exception *a1)
{
}

void sub_247E63EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E63FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _timeIntervalSinceReferenceDate(sqlite3_context *a1)
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];

  sqlite3_result_int64(a1, (uint64_t)v2);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x270EE51B0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x270EF2AB8](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
}

void NSResetHashTable(NSHashTable *table)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x270EFD8F0](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

const char *__cdecl sqlite3_column_decltype(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x270F9B588](a1, *(void *)&a2);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x270F9B600](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x270F9B680](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

uint64_t sqlite3_key()
{
  return MEMORY[0x270F9B6C0]();
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x270F9B700](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x270F9B7F8](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B810](pStmt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}