@interface DEArchiver
+ (id)archiveDirectoryAt:(id)a3;
+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4;
+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5;
+ (id)archiveFile:(id)a3;
+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4;
+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5;
+ (unint64_t)directorySizeOf:(id)a3;
@end

@implementation DEArchiver

+ (unint64_t)directorySizeOf:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  +[DEUtils enumeratorForAllItems:](DEUtils, "enumeratorForAllItems:");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v19 = 0;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = *MEMORY[0x1E4F1C628];
    uint64_t v8 = *MEMORY[0x1E4F1C5F8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1AD0DC7C0]();
        id v22 = 0;
        id v23 = 0;
        [v10 getResourceValue:&v23 forKey:v7 error:&v22];
        id v12 = v23;
        id v13 = v22;
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v12 == 0;
        }
        if (v14)
        {
          id v15 = v13;
        }
        else if ([v12 BOOLValue])
        {
          id v15 = 0;
        }
        else
        {
          id v20 = 0;
          v21 = 0;
          [v10 getResourceValue:&v21 forKey:v8 error:&v20];
          v16 = v21;
          id v15 = v20;
          if (!v15) {
            v19 += [v16 unsignedLongLongValue];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

+ (id)archiveDirectoryAt:(id)a3
{
  return (id)[a1 archiveDirectoryAt:a3 deleteOriginal:1];
}

+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4
{
  return (id)[a1 archiveDirectoryAt:a3 deleteOriginal:a4 progressHandler:0];
}

+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5
{
  BOOL v27 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v29 = a5;
  uint64_t v6 = +[DELogging fwHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:](v30);
  }

  v28 = [[DEArchive alloc] initWithURL:v30];
  if (v28)
  {
    +[DEUtils enumeratorForAllItems:v30];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v7)
    {
      uint64_t v31 = 0;
      id v8 = 0;
      id v9 = 0;
      uint64_t v33 = *MEMORY[0x1E4F1C628];
      uint64_t v34 = *(void *)v44;
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v12 = (void *)MEMORY[0x1AD0DC7C0]();

          id v41 = 0;
          id v42 = 0;
          [v11 getResourceValue:&v42 forKey:v33 error:&v41];
          id v8 = v42;
          id v9 = v41;
          if (v9 || !v8)
          {
            id v18 = +[DELogging fwHandle];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v11;
              _os_log_impl(&dword_1A7E51000, v18, OS_LOG_TYPE_INFO, "Error [%{public}@] getting NSURLIsDirectoryKey for url [%{public}@]", buf, 0x16u);
            }
          }
          else if (([v8 BOOLValue] & 1) == 0)
          {
            id v13 = +[DEUtils pathComponentsInURL:v11 removingBaseURLComponents:v30 keepingFirstComponent:1];
            if (v13)
            {
              uint64_t v14 = [NSString pathWithComponents:v13];
              id v15 = (void *)v14;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              uint64_t v52 = 0;
              if (v29)
              {
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __64__DEArchiver_archiveDirectoryAt_deleteOriginal_progressHandler___block_invoke;
                v37[3] = &unk_1E5D30068;
                v39 = buf;
                id v38 = v29;
                uint64_t v40 = v31;
                v16 = (void *)MEMORY[0x1AD0DC9D0](v37);

                if (v15) {
                  goto LABEL_15;
                }
LABEL_22:
                v17 = +[DELogging fwHandle];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v20 = [v30 lastPathComponent];
                  *(_DWORD *)v47 = 138412546;
                  v48 = v11;
                  __int16 v49 = 2112;
                  uint64_t v50 = v20;
                  v21 = (void *)v20;
                  _os_log_error_impl(&dword_1A7E51000, v17, OS_LOG_TYPE_ERROR, "could not build path from %@ with root component %@", v47, 0x16u);
                }
LABEL_24:
              }
              else
              {
                v16 = 0;
                if (!v14) {
                  goto LABEL_22;
                }
LABEL_15:
                if (![(DEArchive *)v28 addFile:v11 withPathName:v15 progressHandler:v16])
                {
                  v17 = +[DELogging fwHandle];
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:](&v35, v36, v17);
                  }
                  goto LABEL_24;
                }
              }
              uint64_t v19 = *(void *)(*(void *)&buf[8] + 24);

              _Block_object_dispose(buf, 8);
              v31 += v19;
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (!v7) {
          goto LABEL_33;
        }
      }
    }
    id v8 = 0;
    id v9 = 0;
LABEL_33:

    [(DEArchive *)v28 closeArchive];
    uint64_t v24 = [(DEArchive *)v28 tarGzUrl];
    long long v25 = (void *)v24;
    if (v27 && v24) {
      +[DEUtils removeFile:v30];
    }
    id v22 = v25;

    id v23 = v22;
  }
  else
  {
    id v22 = +[DELogging fwHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:]();
    }
    id v23 = 0;
  }

  return v23;
}

uint64_t __64__DEArchiver_archiveDirectoryAt_deleteOriginal_progressHandler___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6]);
}

+ (id)archiveFile:(id)a3
{
  return (id)[a1 archiveFile:a3 deleteOriginal:1];
}

+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4
{
  return (id)[a1 archiveFile:a3 deleteOriginal:a4 progressHandler:0];
}

+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = +[DELogging fwHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.5(v7);
  }

  v10 = [[DEArchive alloc] initWithURL:v7];
  if (v10)
  {
    id v21 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1C628];
    id v20 = 0;
    [v7 getResourceValue:&v21 forKey:v11 error:&v20];
    id v12 = v21;
    id v13 = v20;
    if (v13)
    {
      uint64_t v14 = +[DELogging fwHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.4();
      }
    }
    else if (([v12 BOOLValue] & 1) == 0)
    {
      v16 = [v7 lastPathComponent];
      if (v16)
      {
        if (![(DEArchive *)v10 addFile:v7 withPathName:v16 progressHandler:v8])
        {
          id v18 = +[DELogging fwHandle];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[DEArchiver archiveFile:deleteOriginal:progressHandler:](v18);
          }
        }
        [(DEArchive *)v10 closeArchive];
        uint64_t v19 = [(DEArchive *)v10 tarGzUrl];
        id v15 = (void *)v19;
        if (v6 && v19) {
          +[DEUtils removeFile:v7];
        }
        goto LABEL_16;
      }
LABEL_15:
      id v15 = 0;
LABEL_16:

LABEL_18:
      goto LABEL_19;
    }
    if (!v12)
    {
      id v15 = 0;
      goto LABEL_18;
    }
    v16 = +[DELogging fwHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[DEArchiver archiveFile:deleteOriginal:progressHandler:](v16);
    }
    goto LABEL_15;
  }
  id v13 = +[DELogging fwHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:]();
  }
  id v15 = 0;
LABEL_19:

  return v15;
}

+ (void)archiveDirectoryAt:deleteOriginal:progressHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A7E51000, v0, OS_LOG_TYPE_ERROR, "Failed to initialize archive at [%{public}@]", v1, 0xCu);
}

+ (void)archiveDirectoryAt:(uint8_t *)buf deleteOriginal:(unsigned char *)a2 progressHandler:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Failed to add file to archiver", buf, 2u);
}

+ (void)archiveDirectoryAt:(void *)a1 deleteOriginal:progressHandler:.cold.3(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "archiveDirectoryAt [%{public}@]", v4, v5, v6, v7, v8);
}

+ (void)archiveFile:(os_log_t)log deleteOriginal:progressHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Used archiveFile to archive direcctory", v1, 2u);
}

+ (void)archiveFile:(os_log_t)log deleteOriginal:progressHandler:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Failed to add file to archiver", v1, 2u);
}

+ (void)archiveFile:deleteOriginal:progressHandler:.cold.4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A7E51000, v1, OS_LOG_TYPE_ERROR, "Error [%{public}@] getting NSURLIsDirectoryKey for url [%{public}@]", v2, 0x16u);
}

+ (void)archiveFile:(void *)a1 deleteOriginal:progressHandler:.cold.5(void *a1)
{
  os_log_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "archiveFile [%{public}@]", v4, v5, v6, v7, v8);
}

@end