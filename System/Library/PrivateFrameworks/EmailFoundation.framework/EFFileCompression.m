@interface EFFileCompression
+ (BOOL)_compressFile:(const char *)a3 error:(id *)a4;
+ (BOOL)_doCompressFile:(const char *)a3 errorCode:(int64_t *)a4;
+ (BOOL)compressDirectory:(id)a3 shouldCancel:(id)a4 error:(id *)a5;
+ (BOOL)compressFile:(id)a3 error:(id *)a4;
+ (CompressionQueueContext_s)_compressionQueueContext;
+ (OS_os_log)log;
+ (id)_compressionLock;
@end

@implementation EFFileCompression

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EFFileCompression_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

void __24__EFFileCompression_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

+ (BOOL)compressFile:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (const char *)[v6 fileSystemRepresentation];
  v8 = v7;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v18.st_blksize = v9;
  *(timespec *)v18.st_qspare = v9;
  v18.st_birthtimespec = v9;
  *(timespec *)&v18.st_size = v9;
  v18.st_mtimespec = v9;
  v18.st_ctimespec = v9;
  *(timespec *)&v18.st_uid = v9;
  v18.st_atimespec = v9;
  *(timespec *)&v18.st_dev = v9;
  if (!v7) {
    goto LABEL_9;
  }
  if (stat(v7, &v18))
  {
    int v10 = *__error();
    if (!v10) {
      goto LABEL_14;
    }
LABEL_10:
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F289D0];
    v20[0] = v6;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v12 = [v13 errorWithDomain:*MEMORY[0x1E4F28798] code:v10 userInfo:v14];

    v15 = +[EFFileCompression log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EFFileCompression compressFile:error:]();
    }

    char v11 = 0;
    if (a4) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if ((v18.st_mode & 0xF000) != 0x8000)
  {
LABEL_9:
    int v10 = 22;
    goto LABEL_10;
  }
  if ((v18.st_flags & 0x20) == 0)
  {
    id v17 = 0;
    char v11 = [a1 _compressFile:v8 error:&v17];
    id v12 = v17;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_14:
  id v12 = 0;
  char v11 = 1;
  if (a4) {
LABEL_15:
  }
    *a4 = v12;
LABEL_16:

  return v11;
}

+ (BOOL)compressDirectory:(id)a3 shouldCancel:(id)a4 error:(id *)a5
{
  v50[2] = *(char **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (unsigned int (**)(void))a4;
  id v39 = v6;
  if ([v39 fileSystemRepresentation])
  {
    id v38 = v39;
    v33 = strdup((const char *)[v38 fileSystemRepresentation]);
    v50[0] = v33;
    v50[1] = 0;
    v8 = fts_open(v50, 80, 0);
    timespec v9 = 0;
    int v10 = 0;
    uint64_t v34 = *MEMORY[0x1E4F28798];
    uint64_t v35 = *MEMORY[0x1E4F289D0];
    char v36 = 1;
    while (1)
    {
      char v11 = fts_read(v8);
      if (!v11)
      {
LABEL_20:
        if (fts_close(v8) == -1)
        {
          v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = *__error();
          uint64_t v46 = v35;
          id v47 = v38;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          v22 = [v27 errorWithDomain:v34 code:v28 userInfo:v29];

          v30 = +[EFFileCompression log];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_msgSend(v22, "ef_publicDescription");
            +[EFFileCompression compressDirectory:shouldCancel:error:](v31, (uint64_t)buf, (uint64_t)v38, v30);
          }
        }
        else
        {
          v22 = v9;
        }
        free(v33);
        BOOL v26 = v36 & 1;
        goto LABEL_29;
      }
      id v12 = (void *)MEMORY[0x1BA9A5240]();
      fts_statp = v11->fts_statp;
      if ((fts_statp->st_mode & 0xF000) == 0x8000 && (fts_statp->st_flags & 0x20) == 0)
      {
        fts_accpath = v11->fts_accpath;
        id v41 = v9;
        char v15 = [a1 _compressFile:fts_accpath error:&v41];
        id v16 = v41;

        if ((v15 & 1) == 0)
        {
          char v36 = 0;
          char v21 = 0;
          timespec v9 = v16;
          goto LABEL_19;
        }
        timespec v9 = v16;
      }
      if (!v7) {
        goto LABEL_17;
      }
      if (v10 < 9)
      {
        char v21 = 1;
      }
      else
      {
        if (!v7[2](v7))
        {
          int v10 = 0;
LABEL_17:
          char v21 = 1;
          goto LABEL_19;
        }
        id v17 = +[EFFileCompression log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v38;
          _os_log_impl(&dword_1B5A59000, v17, OS_LOG_TYPE_DEFAULT, "Canceling compression of directory %@", buf, 0xCu);
        }

        stat v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v48 = v35;
        id v49 = v38;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        uint64_t v20 = [v18 errorWithDomain:v34 code:4 userInfo:v19];

        char v21 = 0;
        timespec v9 = (void *)v20;
      }
      ++v10;
LABEL_19:
      if ((v21 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F289D0];
  id v43 = v39;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v22 = [v23 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v24];

  v25 = +[EFFileCompression log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v22, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    +[EFFileCompression compressDirectory:shouldCancel:error:]();
  }

  BOOL v26 = 1;
LABEL_29:
  if (a5) {
    *a5 = v22;
  }

  return v26;
}

+ (BOOL)_compressFile:(const char *)a3 error:(id *)a4
{
  v45[4] = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  v7 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:a3 isDirectory:0 relativeToURL:0];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v38 = 0;
  timespec v9 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v7 create:1 error:&v38];
  id v10 = v38;

  if (v9)
  {
    char v11 = [v7 lastPathComponent];
    id v12 = [v9 URLByAppendingPathComponent:v11];

    id v13 = v12;
    if (copyfile(a3, (const char *)[v13 fileSystemRepresentation], 0, 0x10E000Fu))
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *__error();
      uint64_t v44 = *MEMORY[0x1E4F289D0];
      v45[0] = v7;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      id v17 = [v14 errorWithDomain:*MEMORY[0x1E4F28798] code:v15 userInfo:v16];

      stat v18 = +[EFFileCompression log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EFFileCompression _compressFile:error:].cold.4();
      }

      uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v19 removeItemAtURL:v9 error:0];

      if (a4)
      {
LABEL_21:
        id v17 = v17;
        BOOL v21 = 0;
        *a4 = v17;
LABEL_23:

        id v10 = v17;
        goto LABEL_24;
      }
    }
    else
    {
      id v22 = v13;
      if (objc_msgSend(a1, "_doCompressFile:errorCode:", objc_msgSend(v22, "fileSystemRepresentation"), &v39))
      {
        v23 = (const std::__fs::filesystem::path *)[v22 fileSystemRepresentation];
        rename(v23, (const std::__fs::filesystem::path *)a3, v24);
        if (!v25)
        {
          v37 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v37 removeItemAtURL:v9 error:0];

          BOOL v21 = 1;
          id v17 = v10;
          goto LABEL_23;
        }
        BOOL v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *__error();
        uint64_t v40 = *MEMORY[0x1E4F289D0];
        id v41 = v7;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v17 = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:v27 userInfo:v28];

        v29 = +[EFFileCompression log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[EFFileCompression _compressFile:error:]();
        }

        v30 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v30 removeItemAtURL:v9 error:0];

        if (a4) {
          goto LABEL_21;
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = v39;
        uint64_t v42 = *MEMORY[0x1E4F289D0];
        id v43 = v7;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v17 = [v31 errorWithDomain:*MEMORY[0x1E4F28798] code:v32 userInfo:v33];

        uint64_t v34 = +[EFFileCompression log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[EFFileCompression _compressFile:error:]();
        }

        uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v35 removeItemAtURL:v9 error:0];

        if (a4) {
          goto LABEL_21;
        }
      }
    }
    BOOL v21 = 0;
    goto LABEL_23;
  }
  uint64_t v20 = +[EFFileCompression log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    +[EFFileCompression _compressFile:error:]();
  }

  if (a4)
  {
    id v10 = v10;
    BOOL v21 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_24:

  return v21;
}

+ (BOOL)_doCompressFile:(const char *)a3 errorCode:(int64_t *)a4
{
  id v6 = [a1 _compressionLock];
  [v6 lock];
  [a1 _compressionQueueContext];
  if (CompressFile())
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    *a4 = *__error();
  }
  [v6 unlock];

  return v7;
}

+ (CompressionQueueContext_s)_compressionQueueContext
{
  if (_compressionQueueContext_onceToken != -1) {
    dispatch_once(&_compressionQueueContext_onceToken, &__block_literal_global_6);
  }
  return (CompressionQueueContext_s *)_compressionQueueContext_context;
}

uint64_t __45__EFFileCompression__compressionQueueContext__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F4D878];
  v2[0] = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:&v1 count:1];
  uint64_t result = CreateCompressionQueue();
  _compressionQueueContext_context = result;
  return result;
}

+ (id)_compressionLock
{
  if (_compressionLock_onceToken != -1) {
    dispatch_once(&_compressionLock_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_compressionLock_fileCompressionLock;
  return v2;
}

void __37__EFFileCompression__compressionLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v1 = (void *)_compressionLock_fileCompressionLock;
  _compressionLock_fileCompressionLock = (uint64_t)v0;
}

+ (void)compressFile:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ No Invalid URL for compression: %@", v4, v5);
}

+ (void)compressDirectory:shouldCancel:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ No filesystem representation for URL %@", v4, v5);
}

+ (void)compressDirectory:(uint64_t)a3 shouldCancel:(NSObject *)a4 error:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ attempting to close fts for URL %@", (uint8_t *)a2, a4);
}

+ (void)_compressFile:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ Attempting to get the item replacement directory for file %@", v4, v5);
}

+ (void)_compressFile:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ Attempting to move file %@ back to its original location", v4, v5);
}

+ (void)_compressFile:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ Attempting to compress file %@", v4, v5);
}

+ (void)_compressFile:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B5A59000, "Error %{public}@ Attempting to copy file %@ to a temporary location", v4, v5);
}

@end