@interface BMFileManager
+ (BMFileManager)fileManagerWithDirectAccessToDirectory:(id)a3 cachingOptions:(int64_t)a4;
+ (BMFileManager)fileManagerWithMediatedAccessToDirectory:(id)a3 useCase:(id)a4 domain:(unint64_t)a5 user:(unsigned int)a6;
+ (id)globalWeakFileHandleCache;
- (BMFileManager)init;
- (BMFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4;
- (BMFileManagerDelegate)delegate;
- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4;
- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)acquireLockfile:(id)a3 andRunBlock:(id)a4;
- (BOOL)changePermissionsOfFileAtPath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4;
- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4;
- (BOOL)removeDirectoryAtPath:(id)a3 error:(id *)a4;
- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6;
- (NSString)directory;
- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6;
- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4;
- (id)dataWithContentsOfFileAtPath:(id)a3 error:(id *)a4;
- (id)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6;
- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6;
- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4;
- (unint64_t)modificationTimeOfFileAtPath:(id)a3 error:(id *)a4;
- (unint64_t)sizeOfFileAtPath:(id)a3 error:(id *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BMFileManager

- (NSString)directory
{
  return self->_directory;
}

- (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BMFileManager.m", 343, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    v8 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:537920000 protection:0xFFFFFFFFLL error:a4];
    LOBYTE(a4) = v8 != 0;
  }
  else
  {
    v9 = __biome_log_for_category(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v11 = [NSString stringWithFormat:@"Invalid path"];
      v16[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v10 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v12];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"BMFileManager.m", 128, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if (![v7 length])
  {
    v16 = __biome_log_for_category(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (!a4)
    {
      id v15 = 0;
      goto LABEL_21;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28228];
    v9 = [NSString stringWithFormat:@"Invalid path"];
    v38[0] = v9;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v17 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v13];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v8 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:554696704 protection:0xFFFFFFFFLL error:a4];
  v9 = v8;
  if (v8)
  {
    int v10 = dup([v8 fd]);
    if ((v10 & 0x80000000) == 0)
    {
      int v11 = v10;
      v12 = objc_opt_new();
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__1;
      v33 = __Block_byref_object_dispose__1;
      id v34 = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke;
      v25[3] = &unk_1E6023090;
      int v28 = v11;
      v27 = &v29;
      id v13 = v12;
      id v26 = v13;
      [v9 performWithInProcessLock:v25];
      if (a4 && (v14 = (void *)v30[5]) != 0)
      {
        id v15 = 0;
        *a4 = v14;
      }
      else
      {
        id v15 = v13;
      }

      _Block_object_dispose(&v29, 8);
      goto LABEL_19;
    }
    if (a4)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28228];
      v19 = NSString;
      v20 = __error();
      v21 = strerror(*v20);
      objc_msgSend(v19, "stringWithFormat:", @"dup(): %s: %d", v21, *__error());
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = v13;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      *a4 = [v18 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v22];

      id v15 = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  id v15 = 0;
LABEL_20:

LABEL_21:
  return v15;
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = fdopendir(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    memset(&v27, 0, 512);
    v24 = 0;
    uint64_t v4 = readdir_r(v2, &v27, &v24);
    for (BOOL i = v4 == 0; !v4 && v24; BOOL i = v4 == 0)
    {
      if (v27.d_ino) {
        BOOL v6 = v27.d_namlen == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6
        && (v27.d_namlen != 1 || v27.d_name[0] != 46)
        && (v27.d_namlen != 2 || v27.d_name[0] != 46 || v27.d_name[1] != 46))
      {
        id v7 = [NSString alloc];
        v8 = (void *)[v7 initWithBytes:v27.d_name length:v27.d_namlen encoding:_NSDefaultFileSystemEncoding()];
        if ([v8 length]) {
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
      uint64_t v4 = readdir_r(v3, &v27, &v24);
    }
    if (!i)
    {
      v9 = __biome_log_for_category(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_2(v4, v9);
      }

      int v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28228];
      int v11 = objc_msgSend(NSString, "stringWithFormat:", @"readdir_r(): %s: %d", strerror(v4), v4);
      id v26 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v13 = [v10 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    rewinddir(v3);
    if (closedir(v3) == -1)
    {
      v16 = __biome_log_for_category(2);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_1(v16);
      }
    }
  }
  else
  {
    uint64_t v17 = *__error();
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"fdopendir(): %s: %d", strerror(v17), v17);
    v29[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v21 = [v18 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v20];
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    close(*(_DWORD *)(a1 + 48));
  }
}

id __64__BMFileManager_fileHandleForFileAtPath_flags_protection_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  uint64_t v4 = *(unsigned int *)(a1 + 60);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = [v2 _fileHandleForFileAtPath:v1 flags:v3 protection:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

- (id)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (!v11)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"BMFileManager.m", 210, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v11 length])
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    id v41 = 0;
    v12 = (void *)MEMORY[0x1B3EB5880]();
    uint64_t v13 = BMDataProtectionClassFromOSProtectionClass(a5);
    uint64_t v14 = [[BMFileAttributes alloc] initWithPath:v11 mode:BMFileAccessModeFromOFlags(a4) protectionClass:v13];
    int64_t cachingOptions = self->_cachingOptions;
    v16 = [(BMFileManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v17 = [v16 cachingOptionsForFileHandleWithAttributes:v14];
    }
    else {
      char v17 = cachingOptions & 2;
    }
    int64_t v23 = self->_cachingOptions;
    if (v23 & 1) != 0 && (v17)
    {
      v24 = self->_fileHandleCache;
    }
    else
    {
      uint64_t v25 = 0;
      if ((v23 & 2) == 0 || (v17 & 2) == 0)
      {
LABEL_19:
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __64__BMFileManager_fileHandleForFileAtPath_flags_protection_error___block_invoke;
        v31[3] = &unk_1E60230B8;
        v31[4] = self;
        int v34 = a4;
        int v35 = a5;
        id v32 = v11;
        v33 = &v36;
        uint64_t v26 = MEMORY[0x1B3EB5AC0](v31);
        dirent v27 = (void *)v26;
        if (v25) {
          [(BMCache *)v25 cachedObjectWithKey:v14 missHandler:v26];
        }
        else {
        uint64_t v22 = (*(void (**)(uint64_t))(v26 + 16))(v26);
        }

        if (a6)
        {
          uint64_t v28 = (void *)v37[5];
          if (v28) {
            *a6 = v28;
          }
        }
        _Block_object_dispose(&v36, 8);

        goto LABEL_26;
      }
      v24 = +[BMFileManager globalWeakFileHandleCache];
    }
    uint64_t v25 = v24;
    goto LABEL_19;
  }
  v18 = __biome_log_for_category(2);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a6)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28228];
    v20 = [NSString stringWithFormat:@"Invalid path"];
    v43[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    *a6 = [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v21];
  }
  uint64_t v22 = 0;
LABEL_26:

  return v22;
}

- (BMFileManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BMFileManagerDelegate *)WeakRetained;
}

+ (id)globalWeakFileHandleCache
{
  if (globalWeakFileHandleCache_onceToken != -1) {
    dispatch_once(&globalWeakFileHandleCache_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)globalWeakFileHandleCache_cache;
  return v2;
}

uint64_t __50__BMFileManager_initWithDirectory_cachingOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isStale];
}

uint64_t __42__BMFileManager_globalWeakFileHandleCache__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isStale];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileHandleCache, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

uint64_t __42__BMFileManager_globalWeakFileHandleCache__block_invoke()
{
  uint64_t v0 = +[BMCache weakCache];
  uint64_t v1 = (void *)globalWeakFileHandleCache_cache;
  globalWeakFileHandleCache_cache = v0;

  v2 = (void *)globalWeakFileHandleCache_cache;
  return [v2 setIsExpiredBlock:&__block_literal_global_5_0];
}

+ (BMFileManager)fileManagerWithMediatedAccessToDirectory:(id)a3 useCase:(id)a4 domain:(unint64_t)a5 user:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[_BMXPCFileManager alloc] initWithDirectory:v10 cachingOptions:3 useCase:v9 domain:a5 user:v6];

  return (BMFileManager *)v11;
}

+ (BMFileManager)fileManagerWithDirectAccessToDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[_BMDirectFileManager alloc] initWithDirectory:v5 cachingOptions:a4];

  return (BMFileManager *)v6;
}

- (BMFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMFileManager;
  id v7 = [(BMFileManager *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    directory = v7->_directory;
    v7->_directory = (NSString *)v8;

    v7->_int64_t cachingOptions = a4;
    if (a4)
    {
      if ((a4 & 2) != 0)
      {
        id v11 = +[BMFileManager globalWeakFileHandleCache];
        uint64_t v12 = +[BMCache strongCacheWithFallbackCache:v11];
        fileHandleCache = v7->_fileHandleCache;
        v7->_fileHandleCache = (BMCache *)v12;
      }
      else
      {
        uint64_t v10 = +[BMCache strongCache];
        id v11 = v7->_fileHandleCache;
        v7->_fileHandleCache = (BMCache *)v10;
      }

      [(BMCache *)v7->_fileHandleCache setIsExpiredBlock:&__block_literal_global_13];
    }
  }

  return v7;
}

- (id)dataWithContentsOfFileAtPath:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BMFileManager.m", 453, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    uint64_t v8 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:0x20000000 protection:0xFFFFFFFFLL error:a4];
    id v9 = v8;
    if (v8)
    {
      a4 = [v8 readDataWithError:a4];
    }
    else
    {
      a4 = 0;
    }
  }
  else
  {
    uint64_t v10 = __biome_log_for_category(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      uint64_t v12 = [NSString stringWithFormat:@"Invalid path"];
      v17[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a4 = [v11 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v13];

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMFileManager.m", 98, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    int v8 = access((const char *)[v7 fileSystemRepresentation], 0);
    id v9 = __error();
    if (a4 && v8 && *v9 != 2)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28228];
      id v11 = NSString;
      uint64_t v12 = __error();
      uint64_t v13 = strerror(*v12);
      uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", @"access(): %s: %d", v13, *__error());
      int64_t v23 = v14;
      objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      *a4 = [v10 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v15];
    }
    LOBYTE(a4) = v8 == 0;
  }
  else
  {
    uint64_t v16 = __biome_log_for_category(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      char v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28228];
      v18 = [NSString stringWithFormat:@"Invalid path"];
      v25[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      *a4 = [v17 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v19];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) fd];
  uint64_t v3 = +[BMProcess current];
  uint64_t v4 = [v3 runningBoardAssertionWithExplanation:@"BiomeFileLock"];

  if (flock(v2, 2))
  {
    id v5 = __biome_log_for_category(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = __error();
      __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_2(v6, (uint64_t)v7, (uint64_t)v11);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (flock(v2, 8))
    {
      int v8 = __biome_log_for_category(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = __error();
        __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_1(v9, (uint64_t)v10, (uint64_t)v11);
      }
    }
  }
  [v4 invalidate];
}

- (BOOL)acquireLockfile:(id)a3 andRunBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BMFileManager.m", 395, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    id v25 = 0;
    uint64_t v9 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:536871424 protection:4 error:&v25];
    uint64_t v10 = v25;
    id v11 = v10;
    if (!v9 || v10)
    {
      uint64_t v13 = __biome_log_for_category(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BMFileManager acquireLockfile:andRunBlock:]((uint64_t)v7, (uint64_t)v11, v13);
      }

      BOOL v12 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke;
      v16[3] = &unk_1E6023158;
      id v17 = v9;
      id v18 = v7;
      v20 = &v21;
      id v19 = v8;
      [v17 performWithInProcessLock:v16];
      BOOL v12 = *((unsigned char *)v22 + 24) != 0;

      _Block_object_dispose(&v21, 8);
    }
  }
  else
  {
    id v11 = __biome_log_for_category(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (BMFileManager)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BMFileManager.m" lineNumber:71 description:@"Use designated initializer"];

  return 0;
}

- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMFileManager.m", 263, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__1;
    v28[4] = __Block_byref_object_dispose__1;
    id v29 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke;
    v24[3] = &unk_1E60230E0;
    uint64_t v26 = &v30;
    v24[4] = self;
    id v8 = v7;
    id v25 = v8;
    dirent v27 = v28;
    uint64_t v9 = (void (**)(void))MEMORY[0x1B3EB5AC0](v24);
    int64_t cachingOptions = self->_cachingOptions;
    if (cachingOptions)
    {
      id v11 = self->_fileHandleCache;
    }
    else
    {
      if ((cachingOptions & 2) == 0) {
        goto LABEL_15;
      }
      id v11 = +[BMFileManager globalWeakFileHandleCache];
    }
    id v17 = v11;
    if (v11)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke_2;
      v22[3] = &unk_1E6023108;
      id v23 = v8;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke_3;
      v20[3] = &unk_1E6023130;
      uint64_t v21 = v9;
      [(BMCache *)v17 pruneCacheWithBlock:v22 completion:v20];

LABEL_16:
      BOOL v16 = *((unsigned char *)v31 + 24) != 0;

      _Block_object_dispose(v28, 8);
      _Block_object_dispose(&v30, 8);
      goto LABEL_17;
    }
LABEL_15:
    v9[2](v9);
    id v17 = 0;
    goto LABEL_16;
  }
  BOOL v12 = __biome_log_for_category(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    uint64_t v14 = [NSString stringWithFormat:@"Invalid path"];
    v35[0] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    *a4 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v15];
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

void __40__BMFileManager_removeFileAtPath_error___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _removeFileAtPath:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t __40__BMFileManager_removeFileAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 path];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __40__BMFileManager_removeFileAtPath_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMFileManager.m", 300, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    char v33 = __Block_byref_object_copy__1;
    uint64_t v34 = __Block_byref_object_dispose__1;
    id v35 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke;
    v26[3] = &unk_1E60230E0;
    uint64_t v28 = &v36;
    v26[4] = self;
    id v8 = v7;
    id v27 = v8;
    id v29 = &v30;
    uint64_t v9 = (void (**)(void))MEMORY[0x1B3EB5AC0](v26);
    int64_t cachingOptions = self->_cachingOptions;
    if (cachingOptions)
    {
      BOOL v16 = self->_fileHandleCache;
    }
    else
    {
      if ((cachingOptions & 2) == 0)
      {
        id v11 = 0;
LABEL_14:
        if ([v8 hasSuffix:@"/"])
        {
          id v17 = v8;
        }
        else
        {
          id v17 = [v8 stringByAppendingString:@"/"];
        }
        id v18 = v17;
        if (v11)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_2;
          v24[3] = &unk_1E6023108;
          id v25 = v17;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_3;
          v22[3] = &unk_1E6023130;
          id v23 = v9;
          [(BMCache *)v11 pruneCacheWithBlock:v24 completion:v22];
        }
        else
        {
          v9[2](v9);
        }
        id v19 = v37;
        if (a4 && !*((unsigned char *)v37 + 24))
        {
          *a4 = (id) v31[5];
          id v19 = v37;
        }
        LOBYTE(a4) = *((unsigned char *)v19 + 24) != 0;

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v36, 8);
        goto LABEL_24;
      }
      BOOL v16 = +[BMFileManager globalWeakFileHandleCache];
    }
    id v11 = v16;
    goto LABEL_14;
  }
  BOOL v12 = __biome_log_for_category(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28228];
    uint64_t v14 = [NSString stringWithFormat:@"Invalid path"];
    v41[0] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    *a4 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v15];

    LOBYTE(a4) = 0;
  }
LABEL_24:

  return (char)a4;
}

void __45__BMFileManager_removeDirectoryAtPath_error___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _removeDirectoryAtPath:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 path];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)sizeOfFileAtPath:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMFileManager.m", 359, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    id v24 = 0;
    id v8 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:0x8000 protection:0xFFFFFFFFLL error:&v24];
    id v9 = v24;
    uint64_t v10 = v9;
    if (v8 && !v9)
    {
      memset(&v23, 0, sizeof(v23));
      if (fstat([v8 fd], &v23) != -1)
      {
        off_t st_size = v23.st_size;
LABEL_19:

        goto LABEL_20;
      }
      if (a4)
      {
        objc_super v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F28228];
        BOOL v16 = NSString;
        id v17 = __error();
        id v18 = strerror(*v17);
        id v19 = objc_msgSend(v16, "stringWithFormat:", @"fstat(): %s: %d", v18, *__error());
        uint64_t v26 = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *a4 = [v15 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v20];
      }
LABEL_18:
      off_t st_size = 0;
      goto LABEL_19;
    }
    if (!a4) {
      goto LABEL_18;
    }
    id v14 = v9;
    uint64_t v10 = v14;
LABEL_14:
    off_t st_size = 0;
    *a4 = v14;
    goto LABEL_19;
  }
  BOOL v12 = __biome_log_for_category(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    uint64_t v10 = [NSString stringWithFormat:@"Invalid path"];
    v28[0] = v10;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v14 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v8];
    goto LABEL_14;
  }
  off_t st_size = 0;
LABEL_20:

  return st_size;
}

- (unint64_t)modificationTimeOfFileAtPath:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMFileManager.m", 511, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v7 length])
  {
    id v24 = 0;
    id v8 = [(BMFileManager *)self fileHandleForFileAtPath:v7 flags:0x8000 protection:0xFFFFFFFFLL error:&v24];
    id v9 = v24;
    uint64_t v10 = v9;
    if (v8 && !v9)
    {
      memset(&v23, 0, sizeof(v23));
      if (fstat([v8 fd], &v23) != -1)
      {
        __darwin_time_t tv_sec = v23.st_mtimespec.tv_sec;
LABEL_19:

        goto LABEL_20;
      }
      if (a4)
      {
        objc_super v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F28228];
        BOOL v16 = NSString;
        id v17 = __error();
        id v18 = strerror(*v17);
        id v19 = objc_msgSend(v16, "stringWithFormat:", @"fstat(): %s: %d", v18, *__error());
        uint64_t v26 = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *a4 = [v15 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v20];
      }
LABEL_18:
      __darwin_time_t tv_sec = 0;
      goto LABEL_19;
    }
    if (!a4) {
      goto LABEL_18;
    }
    id v14 = v9;
    uint64_t v10 = v14;
LABEL_14:
    __darwin_time_t tv_sec = 0;
    *a4 = v14;
    goto LABEL_19;
  }
  BOOL v12 = __biome_log_for_category(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    uint64_t v10 = [NSString stringWithFormat:@"Invalid path"];
    v28[0] = v10;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v14 = [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v8];
    goto LABEL_14;
  }
  __darwin_time_t tv_sec = 0;
LABEL_20:

  return tv_sec;
}

- (BOOL)changePermissionsOfFileAtPath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"BMFileManager.m", 547, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([v9 length])
  {
    id v25 = 0;
    uint64_t v10 = [(BMFileManager *)self fileHandleForFileAtPath:v9 flags:0 protection:0xFFFFFFFFLL error:&v25];
    id v11 = v25;
    BOOL v12 = v11;
    if (v10 && !v11)
    {
      if (fchmod([v10 fd], a4) != -1)
      {
        BOOL v13 = 1;
LABEL_19:

        goto LABEL_20;
      }
      if (a5)
      {
        id v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28228];
        id v18 = NSString;
        id v19 = __error();
        v20 = strerror(*v19);
        uint64_t v21 = objc_msgSend(v18, "stringWithFormat:", @"fchmod(): %s: %d", v20, *__error());
        uint64_t v27 = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        *a5 = [v17 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v22];
      }
LABEL_18:
      BOOL v13 = 0;
      goto LABEL_19;
    }
    if (!a5) {
      goto LABEL_18;
    }
    id v16 = v11;
    BOOL v12 = v16;
LABEL_14:
    BOOL v13 = 0;
    *a5 = v16;
    goto LABEL_19;
  }
  id v14 = __biome_log_for_category(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (a5)
  {
    objc_super v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    BOOL v12 = [NSString stringWithFormat:@"Invalid path"];
    v29[0] = v12;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v16 = [v15 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v10];
    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  OUTLINED_FUNCTION_5();
  uint64_t v6 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v6);
  return 0;
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_5();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v4);
  return 0;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_5();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v4);
  return 0;
}

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_5();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v4);
  return 0;
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  OUTLINED_FUNCTION_5();
  uint64_t v6 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v6);
  return 0;
}

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  OUTLINED_FUNCTION_5();
  uint64_t v6 = objc_opt_class();
  OUTLINED_FUNCTION_2_1(v6);
  return 0;
}

- (void)fileExistsAtPath:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Missing path parameter", v2, v3, v4, v5, v6);
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1B30A0000, a1, OS_LOG_TYPE_FAULT, "closedir(): %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_FAULT, "contentsOfDirectoryAtPath:error: %{darwin.errno}d", (uint8_t *)v2, 8u);
}

- (void)acquireLockfile:(os_log_t)log andRunBlock:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B30A0000, log, OS_LOG_TYPE_FAULT, "Failed to open lockfile %@: %@", (uint8_t *)&v3, 0x16u);
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4(a1, 5.778e-34, a2, a3);
  _os_log_fault_impl(&dword_1B30A0000, v4, OS_LOG_TYPE_FAULT, "Failed to unlock lockfile %@: %{darwin.errno}d", v3, 0x12u);
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4(a1, 5.778e-34, a2, a3);
  _os_log_fault_impl(&dword_1B30A0000, v4, OS_LOG_TYPE_FAULT, "Failed to acquire lockfile %@: %{darwin.errno}d", v3, 0x12u);
}

@end