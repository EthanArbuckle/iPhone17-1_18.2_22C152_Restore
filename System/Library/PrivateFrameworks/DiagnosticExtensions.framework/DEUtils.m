@interface DEUtils
+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4;
+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4 keepSourceDir:(BOOL)a5;
+ (BOOL)copyFile:(id)a3 toDir:(id)a4;
+ (BOOL)isValidDirectory:(id)a3;
+ (id)applicationSupportDirectoryForApp:(id)a3;
+ (id)componentsByRemovingComponentsBeforeComponent:(id)a3 sourceURL:(id)a4 keepingComponent:(BOOL)a5;
+ (id)copyAndReturn:(id)a3 toDir:(id)a4;
+ (id)copyAndReturn:(id)a3 toDir:(id)a4 withNewFileName:(id)a5;
+ (id)copyItem:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5;
+ (id)copyPath:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5;
+ (id)copyPaths:(id)a3 toDestinationDir:(id)a4 withZipName:(id)a5;
+ (id)createDirectoryWithClassCDataProtection:(id)a3;
+ (id)createUserOwnedDirectoryAtUrl:(id)a3;
+ (id)dirForTarGz:(id)a3;
+ (id)enumeratorForAllItems:(id)a3;
+ (id)findAllItems:(id)a3 includeDirs:(BOOL)a4;
+ (id)findAllfiles:(id)a3;
+ (id)findEntriesInDirectory:(id)a3 createdAfter:(id)a4 matchingPattern:(id)a5;
+ (id)lsDir:(id)a3;
+ (id)lsDir:(id)a3 sorted:(BOOL)a4;
+ (id)moveItem:(id)a3 toDestinationDir:(id)a4;
+ (id)pathComponentsInURL:(id)a3 removingBaseURLComponents:(id)a4 keepingFirstComponent:(BOOL)a5;
+ (id)processErrorResponse:(id)a3;
+ (id)tarGzForDirectoryUrl:(id)a3;
+ (id)tarGzForDirectoryUrl:(id)a3 validatesUrl:(BOOL)a4;
+ (id)uniqueDateString;
+ (id)uniqueTemporaryDirectory;
+ (id)urlByRemovingComponentsBefore:(id)a3 source:(id)a4 keepComponent:(BOOL)a5;
+ (id)userLibraryDirectoryForApp:(id)a3;
+ (unint64_t)getDirectorySize:(id)a3;
+ (unint64_t)getFileSystemItemSize:(id)a3;
+ (void)excludeFromBackup:(id)a3;
+ (void)removeFile:(id)a3;
+ (void)uniqueTemporaryDirectory;
@end

@implementation DEUtils

+ (unint64_t)getFileSystemItemSize:(id)a3
{
  id v4 = a3;
  char v17 = 0;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v17];

  if (v7)
  {
    if (v17)
    {
      unint64_t v8 = [a1 getDirectorySize:v4];
    }
    else
    {
      id v16 = 0;
      uint64_t v10 = *MEMORY[0x1E4F1C5F8];
      id v15 = 0;
      [v4 getResourceValue:&v16 forKey:v10 error:&v15];
      id v11 = v16;
      id v12 = v15;
      if (v12 || !v11)
      {
        v13 = Log_3();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[DEUtils getFileSystemItemSize:]();
        }

        unint64_t v8 = 0;
      }
      else
      {
        unint64_t v8 = [v11 unsignedIntegerValue];
      }
    }
  }
  else
  {
    v9 = Log_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[DEUtils getFileSystemItemSize:](v4);
    }

    unint64_t v8 = 0;
  }

  return v8;
}

+ (unint64_t)getDirectorySize:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned __int8 v46 = 0;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v46];
  int v7 = v46;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v15 = Log_3();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[DEUtils getDirectorySize:](v3);
    }
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *MEMORY[0x1E4F1C628];
    uint64_t v12 = *MEMORY[0x1E4F1C5F8];
    v52[0] = *MEMORY[0x1E4F1C628];
    v52[1] = v12;
    uint64_t v36 = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v35 = v3;
    v14 = [v10 enumeratorAtURL:v3 includingPropertiesForKeys:v13 options:0 errorHandler:&__block_literal_global_62];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      unint64_t v37 = 0;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v40 = 0;
          id v41 = 0;
          [v20 getResourceValue:&v41 forKey:v11 error:&v40];
          id v21 = v41;
          id v22 = v40;
          if (v22) {
            BOOL v23 = 1;
          }
          else {
            BOOL v23 = v21 == 0;
          }
          if (v23)
          {
            id v24 = v22;
            v25 = Log_3();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v29 = [v20 path];
              *(_DWORD *)buf = 138543618;
              v48 = v29;
              __int16 v49 = 2114;
              id v50 = v24;
              _os_log_error_impl(&dword_1A7E51000, v25, OS_LOG_TYPE_ERROR, "Could not get isDir for file [%{public}@] with error [%{public}@]", buf, 0x16u);
            }
            id v26 = 0;
          }
          else
          {
            char v27 = [v21 BOOLValue];
            if (v27)
            {
              id v26 = 0;
              id v24 = 0;
            }
            else
            {
              id v38 = 0;
              id v39 = 0;
              [v20 getResourceValue:&v39 forKey:v36 error:&v38];
              id v26 = v39;
              id v24 = v38;
              if (v24 || !v26)
              {
                v28 = Log_3();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  v30 = [v20 path];
                  *(_DWORD *)buf = 138543618;
                  v48 = v30;
                  __int16 v49 = 2114;
                  id v50 = v24;
                  _os_log_error_impl(&dword_1A7E51000, v28, OS_LOG_TYPE_ERROR, "Could not get file size for file [%{public}@] with error [%{public}@]", buf, 0x16u);
                }
              }
              else
              {
                id v24 = 0;
                v37 += [v26 unsignedIntegerValue];
              }
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v17);
    }
    else
    {
      unint64_t v37 = 0;
    }

    v31 = Log_3();
    id v3 = v35;
    unint64_t v9 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v35 path];
      v33 = [MEMORY[0x1E4F28B68] stringFromByteCount:v37 countStyle:0];
      *(_DWORD *)buf = 138543618;
      v48 = v32;
      __int16 v49 = 2114;
      id v50 = v33;
      _os_log_impl(&dword_1A7E51000, v31, OS_LOG_TYPE_INFO, "[%{public}@] size: [%{public}@]", buf, 0x16u);
    }
  }

  return v9;
}

uint64_t __28__DEUtils_getDirectorySize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = Log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __28__DEUtils_getDirectorySize___block_invoke_cold_1();
  }

  return 1;
}

+ (void)excludeFromBackup:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  uint64_t v5 = *MEMORY[0x1E4F1C630];
  id v9 = 0;
  char v6 = [v3 setResourceValue:v4 forKey:v5 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    BOOL v8 = Log_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[DEUtils excludeFromBackup:](v3);
    }
  }
}

+ (id)tarGzForDirectoryUrl:(id)a3
{
  return (id)[a1 tarGzForDirectoryUrl:a3 validatesUrl:1];
}

+ (id)tarGzForDirectoryUrl:(id)a3 validatesUrl:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = Log_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[DEUtils tarGzForDirectoryUrl:validatesUrl:]();
  }

  if (v4) {
    int v8 = [a1 isValidDirectory:v6];
  }
  else {
    int v8 = 1;
  }
  id v9 = 0;
  if (v6 && v8)
  {
    uint64_t v10 = [v6 lastPathComponent];
    uint64_t v11 = [v10 stringByAppendingPathExtension:@"tar.gz"];

    uint64_t v12 = [v6 URLByDeletingLastPathComponent];
    id v9 = [v12 URLByAppendingPathComponent:v11];
  }
  return v9;
}

+ (id)dirForTarGz:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && ([v3 path], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = [v5 stringByReplacingOccurrencesOfString:@".tar.gz" withString:@"/"];
    int v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidDirectory:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    id v6 = Log_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DEUtils isValidDirectory:](v6, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_12;
  }
  if (([v3 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v6 = Log_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DEUtils isValidDirectory:]();
    }
LABEL_12:
    char v15 = 0;
    goto LABEL_13;
  }
  id v24 = 0;
  char v5 = [v4 getResourceValue:&v24 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v6 = v24;
  if ((v5 & 1) == 0)
  {
    id v7 = Log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[DEUtils isValidDirectory:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  char v15 = [v6 BOOLValue];
LABEL_13:

  return v15;
}

+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4 keepSourceDir:(BOOL)a5
{
  BOOL v42 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v43 = a4;
  v34 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v44 = v7;
  uint64_t v8 = +[DEUtils enumeratorForAllItems:v7];
  uint64_t v9 = Log_3();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v31 = @"NO";
    *(_DWORD *)buf = 138412802;
    v57 = v44;
    __int16 v58 = 2112;
    if (v42) {
      v31 = @"YES";
    }
    id v59 = v43;
    __int16 v60 = 2112;
    v61 = v31;
    _os_log_debug_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_DEBUG, "copying files from [%@] to [%@], keeping source dir? [%@]", buf, 0x20u);
  }

  if (v8)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v8;
    uint64_t v45 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v45)
    {
      v32 = v8;
      char v36 = 0;
      uint64_t v10 = 0;
      uint64_t v40 = *(void *)v50;
      id v41 = 0;
      uint64_t v39 = *MEMORY[0x1E4F1C628];
      id v38 = a1;
      while (1)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10;
        do
        {
          if (*(void *)v50 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
          uint64_t v14 = (void *)MEMORY[0x1AD0DC7C0]();
          char v15 = [a1 pathComponentsInURL:v13 removingBaseURLComponents:v44 keepingFirstComponent:v42];
          uint64_t v16 = [v43 pathComponents];
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v16];
          [v17 addObjectsFromArray:v15];
          uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v17];

          uint64_t v18 = [v10 URLByDeletingLastPathComponent];
          if (([v18 checkResourceIsReachableAndReturnError:0] & 1) == 0) {
            id v19 = (id)[a1 createDirectoryWithClassCDataProtection:v18];
          }
          id v48 = 0;
          [v13 getResourceValue:&v48 forKey:v39 error:0];
          id v20 = v48;
          if (![v20 BOOLValue])
          {
            unsigned __int8 v46 = v14;
            id v47 = 0;
            [v34 copyItemAtURL:v13 toURL:v10 error:&v47];
            uint64_t v22 = v47;
            if (v22)
            {
              BOOL v23 = Log_3();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                unint64_t v37 = [v13 path];
                id v24 = [v10 path];
                v33 = [v22 localizedDescription];
                *(_DWORD *)buf = 138543874;
                v57 = v37;
                __int16 v58 = 2114;
                id v59 = v24;
                __int16 v60 = 2114;
                v61 = v33;
                _os_log_error_impl(&dword_1A7E51000, v23, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);
              }
              char v36 = 1;
LABEL_19:
              a1 = v38;
            }

            uint64_t v14 = v46;
            goto LABEL_21;
          }
          uint64_t v21 = [a1 createDirectoryWithClassCDataProtection:v10];

          if (v21)
          {
            unsigned __int8 v46 = v14;
            uint64_t v22 = Log_3();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              +[DEUtils copyAllFilesFromDir:toDir:keepSourceDir:](v53, v10, &v54, v22);
            }
            char v36 = 1;
            id v41 = (void *)v21;
            goto LABEL_19;
          }
          id v41 = 0;
          a1 = v38;
LABEL_21:

          ++v11;
          uint64_t v12 = v10;
        }
        while (v45 != v11);
        uint64_t v25 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        uint64_t v45 = v25;
        if (!v25)
        {

          uint64_t v8 = v32;
          id v26 = v41;
          char v27 = v36;
          goto LABEL_30;
        }
      }
    }
    char v27 = 0;
    id v26 = 0;
LABEL_30:

    char v29 = v27 ^ 1;
  }
  else
  {
    v28 = Log_3();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyAllFilesFromDir:toDir:keepSourceDir:]();
    }

    id v26 = 0;
    char v29 = 0;
  }

  return v29 & 1;
}

+ (id)copyItem:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 lastPathComponent];
  id v10 = [v8 URLByAppendingPathComponent:v9];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v8 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    int v12 = [v11 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:0];
    uint64_t v13 = Log_3();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v24 = 138412290;
        *(void *)&v24[4] = v8;
        _os_log_impl(&dword_1A7E51000, v14, OS_LOG_TYPE_DEFAULT, "Created folder [%@]", v24, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      +[DEUtils copyItem:toDestinationDir:zipped:]();
    }
  }
  v24[0] = 0;
  char v15 = objc_msgSend(v7, "path", *(void *)v24);
  int v16 = [v11 fileExistsAtPath:v15 isDirectory:v24];
  int v17 = v24[0];

  if (v16 && v17)
  {
    if (!+[DEUtils copyAllFilesFromDir:v7 toDir:v10 keepSourceDir:0])goto LABEL_11; {
LABEL_16:
    }
    uint64_t v21 = Log_3();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[DEUtils copyItem:toDestinationDir:zipped:]();
    }

    goto LABEL_19;
  }
  id v20 = +[DEUtils copyAndReturn:v7 toDir:v8];

  if (v20) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v18 = Log_3();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    +[DEUtils copyItem:toDestinationDir:zipped:](v7, v8);
  }

  if (!v24[0])
  {
    id v19 = 0;
    goto LABEL_25;
  }
LABEL_19:
  if (v5)
  {
    if (v24[0]) {
      +[DEArchiver archiveDirectoryAt:v10];
    }
    else {
    uint64_t v22 = +[DEArchiver archiveFile:v10];
    }

    id v10 = (id)v22;
  }
  id v10 = v10;
  id v19 = v10;
LABEL_25:

  return v19;
}

+ (id)moveItem:(id)a3 toDestinationDir:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = Log_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v17 = "+[DEUtils moveItem:toDestinationDir:]";
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1A7E51000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}@] [%{public}@]", buf, 0x20u);
  }

  id v8 = [v5 lastPathComponent];
  uint64_t v9 = [v6 URLByAppendingPathComponent:v8];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  [v10 moveItemAtURL:v5 toURL:v9 error:&v15];
  id v11 = v15;

  if (v11)
  {
    int v12 = Log_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v17 = "+[DEUtils moveItem:toDestinationDir:]";
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1A7E51000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s error [%{public}@]", buf, 0x16u);
    }

    id v13 = 0;
  }
  else
  {
    id v13 = v9;
  }

  return v13;
}

+ (BOOL)copyFile:(id)a3 toDir:(id)a4
{
  BOOL v4 = (void *)[a1 copyAndReturn:a3 toDir:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)copyAndReturn:(id)a3 toDir:(id)a4 withNewFileName:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  [v7 getResourceValue:&v22 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v11 = v22;
  if ([v11 BOOLValue])
  {
    int v12 = Log_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyAndReturn:toDir:withNewFileName:](v7);
    }
    id v13 = 0;
  }
  else
  {
    int v12 = [v8 URLByAppendingPathComponent:v9];
    id v21 = 0;
    [v10 copyItemAtURL:v7 toURL:v12 error:&v21];
    id v13 = v21;
    if (!v13)
    {
      int v12 = v12;
      id v15 = v12;
      goto LABEL_10;
    }
    uint64_t v14 = Log_3();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = [v7 path];
      int v17 = [v12 path];
      uint64_t v18 = [v13 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v24 = v20;
      __int16 v25 = 2114;
      id v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      id v19 = (void *)v18;
      _os_log_error_impl(&dword_1A7E51000, v14, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);
    }
  }
  id v15 = 0;
LABEL_10:

  return v15;
}

+ (id)copyAndReturn:(id)a3 toDir:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  [v5 getResourceValue:&v20 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v8 = v20;
  if ([v8 BOOLValue])
  {
    id v9 = Log_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyAndReturn:toDir:withNewFileName:](v5);
    }
    id v10 = 0;
    id v11 = 0;
  }
  else
  {
    id v9 = [v5 lastPathComponent];
    int v12 = [v6 URLByAppendingPathComponent:v9];
    id v19 = 0;
    [v7 copyItemAtURL:v5 toURL:v12 error:&v19];
    id v10 = v19;
    if (v10)
    {
      id v13 = Log_3();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v5 path];
        id v15 = [v12 path];
        uint64_t v16 = [v10 localizedDescription];
        *(_DWORD *)buf = 138543874;
        id v22 = v18;
        __int16 v23 = 2114;
        id v24 = v15;
        __int16 v25 = 2114;
        uint64_t v26 = v16;
        int v17 = (void *)v16;
        _os_log_error_impl(&dword_1A7E51000, v13, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);
      }
      id v11 = 0;
    }
    else
    {
      id v11 = v12;
    }
  }
  return v11;
}

+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4
{
  return [a1 copyAllFilesFromDir:a3 toDir:a4 keepSourceDir:0];
}

+ (id)pathComponentsInURL:(id)a3 removingBaseURLComponents:(id)a4 keepingFirstComponent:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [a3 URLByResolvingSymlinksInPath];
  id v9 = [v8 URLByStandardizingPath];

  id v10 = [v7 URLByResolvingSymlinksInPath];

  id v11 = [v10 URLByStandardizingPath];

  int v12 = [v11 pathComponents];
  uint64_t v13 = [v12 count];

  uint64_t v14 = v13 - v5;
  id v15 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v16 = [v9 pathComponents];
  int v17 = [v15 arrayWithArray:v16];

  objc_msgSend(v17, "removeObjectsInRange:", 0, v14);
  return v17;
}

+ (id)componentsByRemovingComponentsBeforeComponent:(id)a3 sourceURL:(id)a4 keepingComponent:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [a4 pathComponents];
  uint64_t v9 = [v8 indexOfObject:v7];

  id v10 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v9 + !v5;
    id v10 = v8;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = v8;
      if (v11 < [v8 count])
      {
        id v10 = objc_msgSend(v8, "subarrayWithRange:", v11, objc_msgSend(v8, "count") - v11);
      }
    }
  }

  return v10;
}

+ (id)urlByRemovingComponentsBefore:(id)a3 source:(id)a4 keepComponent:(BOOL)a5
{
  BOOL v5 = [a1 componentsByRemovingComponentsBeforeComponent:a3 sourceURL:a4 keepingComponent:a5];
  id v6 = [v5 componentsJoinedByString:@"/"];
  id v7 = [v6 escape];

  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

+ (id)enumeratorForAllItems:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  BOOL v5 = [v3 defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C628];
  v10[0] = *MEMORY[0x1E4F1C6E8];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:v7 options:4 errorHandler:&__block_literal_global_85];

  return v8;
}

uint64_t __33__DEUtils_enumeratorForAllItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = Log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1A7E51000, v6, OS_LOG_TYPE_INFO, "Error [%{public}@] enumerating url [%{public}@]", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

+ (id)findAllItems:(id)a3 includeDirs:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 enumeratorForAllItems:a3];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = *MEMORY[0x1E4F1C628];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);

        id v19 = 0;
        id v20 = 0;
        [v14 getResourceValue:&v20 forKey:v12 error:&v19];
        id v9 = v20;
        id v10 = v19;
        if (v10)
        {
          id v15 = Log_3();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v26 = v10;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            _os_log_impl(&dword_1A7E51000, v15, OS_LOG_TYPE_INFO, "Error [%@] getting NSURLIsDirectoryKey for url [%@]", buf, 0x16u);
          }
        }
        else if (a4 || ([v9 BOOLValue] & 1) == 0)
        {
          [v18 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18 copyItems:1];

  return v16;
}

+ (id)findAllfiles:(id)a3
{
  return (id)[a1 findAllItems:a3 includeDirs:0];
}

+ (id)lsDir:(id)a3 sorted:(BOOL)a4
{
  BOOL v4 = a4;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v4)
  {
    uint64_t v7 = *MEMORY[0x1E4F1C628];
    v20[0] = *MEMORY[0x1E4F1C530];
    v20[1] = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = v20;
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4F1C628];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = &v19;
    uint64_t v10 = 1;
  }
  uint64_t v11 = [v8 arrayWithObjects:v9 count:v10];
  id v18 = 0;
  uint64_t v12 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v11 options:4 error:&v18];
  id v13 = v18;
  if (v13 || !v12)
  {
    id v15 = Log_3();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[DEUtils lsDir:sorted:]();
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (v4)
    {
      id v14 = [v12 sortedArrayUsingComparator:&__block_literal_global_88];
    }
    else
    {
      id v14 = v12;
    }
    uint64_t v16 = v14;
  }

  return v16;
}

uint64_t __24__DEUtils_lsDir_sorted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v18 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C530];
  id v17 = 0;
  [v4 getResourceValue:&v18 forKey:v6 error:&v17];
  id v7 = v18;
  id v8 = v17;
  if (v8)
  {
    id v9 = Log_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_INFO, "failed to get [%@] modifcation date", buf, 0xCu);
    }
  }
  id v15 = 0;
  id v16 = 0;
  [v5 getResourceValue:&v16 forKey:v6 error:&v15];
  id v10 = v16;
  id v11 = v15;

  if (v11)
  {
    uint64_t v12 = Log_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1A7E51000, v12, OS_LOG_TYPE_INFO, "failed to get [%@] modifcation date", buf, 0xCu);
    }
  }
  uint64_t v13 = [v10 compare:v7];

  return v13;
}

+ (id)lsDir:(id)a3
{
  return (id)[a1 lsDir:a3 sorted:0];
}

+ (id)userLibraryDirectoryForApp:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (!getuid())
    {
      id v4 = Log_3();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory be under root domain", v12, 2u);
      }
    }
    id v5 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    uint64_t v6 = v5;
    if (v5 && [v5 count])
    {
      id v7 = (void *)MEMORY[0x1E4F1CB10];
      id v8 = [v6 firstObject];
      id v9 = [v7 fileURLWithPath:v8 isDirectory:1];

      id v10 = [v9 URLByAppendingPathComponent:v3 isDirectory:1];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)applicationSupportDirectoryForApp:(id)a3
{
  id v3 = a3;
  if (!getuid())
  {
    id v4 = Log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory be under root domain", v12, 2u);
    }
  }
  id v5 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [v6 firstObject];
    id v9 = [v7 fileURLWithPath:v8 isDirectory:1];

    id v10 = [v9 URLByAppendingPathComponent:v3 isDirectory:1];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)createUserOwnedDirectoryAtUrl:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!getuid())
  {
    id v4 = Log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory will be owned by root", buf, 2u);
    }
  }
  v13[0] = *MEMORY[0x1E4F28320];
  id v5 = NSUserName();
  v14[0] = v5;
  v13[1] = *MEMORY[0x1E4F282E0];
  uint64_t v6 = NSUserName();
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  [v8 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:v7 error:&v11];

  id v9 = v11;
  return v9;
}

+ (id)createDirectoryWithClassCDataProtection:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!getuid())
  {
    id v4 = Log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, directory will be owned by root", buf, 2u);
    }
  }
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  [v5 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v6 = v13;

  if (!v6)
  {
    id v7 = Log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[DEUtils createDirectoryWithClassCDataProtection:](v3);
    }

    uint64_t v15 = *MEMORY[0x1E4F1C590];
    v16[0] = *MEMORY[0x1E4F1C580];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = 0;
    [v3 setResourceValues:v8 error:&v12];
    id v9 = v12;

    if (v9)
    {
      id v10 = Log_3();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[DEUtils createDirectoryWithClassCDataProtection:](v9);
      }
    }
  }

  return v6;
}

+ (id)copyPath:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 lastPathComponent];
  id v10 = [v8 URLByAppendingPathComponent:v9];

  id v11 = v8;
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v51 = 0;
  [v7 getResourceValue:&v51 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v13 = v51;
  id v14 = v11;
  if ([v13 BOOLValue])
  {
    id v14 = v11;
    if (!v5)
    {
      id v14 = v10;
    }
  }
  if (([v14 checkResourceIsReachableAndReturnError:0] & 1) == 0
    && ([v12 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
  {
    uint64_t v15 = Log_3();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyPath:toDestinationDir:zipped:].cold.4();
    }
  }
  if (!BOMCopierNew())
  {
    long long v24 = Log_3();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyPath:toDestinationDir:zipped:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_27;
  }
  if (!v5)
  {
    id v50 = v13;
    if ([v10 checkResourceIsReachableAndReturnError:0])
    {
      id v45 = v14;
      unsigned __int8 v46 = v12;
      id v47 = v11;
      id v49 = v7;
      v32 = 0;
      uint64_t v33 = 1;
      do
      {
        v34 = v32;
        v35 = NSString;
        char v36 = [v10 URLByDeletingPathExtension];
        unint64_t v37 = [v36 path];
        id v38 = [MEMORY[0x1E4F28ED0] numberWithInt:v33];
        uint64_t v39 = [v35 stringWithFormat:@"%@-%@", v37, v38];
        uint64_t v40 = [v10 pathExtension];
        id v41 = [v39 stringByAppendingPathExtension:v40];

        v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v41 isDirectory:0];

        uint64_t v33 = (v33 + 1);
      }
      while (([v32 checkResourceIsReachableAndReturnError:0] & 1) != 0);

      id v11 = v47;
      id v7 = v49;
      id v14 = v45;
      id v12 = v46;
    }
    else
    {
      v32 = v10;
    }
    [v7 fileSystemRepresentation];
    id v10 = v32;
    [v10 fileSystemRepresentation];
    int v42 = BOMCopierCopy();
    if (!v42)
    {
      id v13 = v50;
      goto LABEL_30;
    }
    int v43 = v42;
    long long v24 = Log_3();
    id v13 = v50;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[DEUtils copyPath:toDestinationDir:zipped:](v43);
    }
LABEL_27:

    long long v23 = 0;
    goto LABEL_31;
  }
  id v16 = [v7 lastPathComponent];
  id v17 = [v16 stringByAppendingPathExtension:@"zip"];

  id v48 = v17;
  id v18 = [v11 URLByAppendingPathComponent:v17];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = MEMORY[0x1E4F1CC38];
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"createPKZip"];
  [v19 setObject:v20 forKeyedSubscript:@"copyResources"];
  if (v13) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"keepParent"];
  }
  [v7 fileSystemRepresentation];
  id v10 = v18;
  [v10 fileSystemRepresentation];
  if (!BOMCopierCopyWithOptions())
  {

LABEL_30:
    BOMCopierFree();
    id v10 = v10;
    long long v23 = v10;
    goto LABEL_31;
  }
  id v21 = v14;
  long long v22 = Log_3();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    +[DEUtils copyPath:toDestinationDir:zipped:]();
  }

  long long v23 = 0;
  id v14 = v21;
LABEL_31:

  return v23;
}

+ (id)copyPaths:(id)a3 toDestinationDir:(id)a4 withZipName:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 URLByAppendingPathComponent:a5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  id v15 = +[DEUtils copyPath:v9 toDestinationDir:v8 zipped:1];
  +[DEUtils removeFile:v9];

  return v15;
}

+ (id)uniqueDateString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd-HHmmssSS"];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

+ (void)removeFile:(id)a3
{
  id v3 = a3;
  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    int v5 = [v4 removeItemAtURL:v3 error:&v10];
    id v6 = v10;

    if (!v5 || v6 != 0)
    {
      id v8 = Log_3();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[DEUtils removeFile:]((uint64_t)v3, v6);
      }

      if (v6)
      {
        id v9 = Log_3();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[DEUtils removeFile:]((uint64_t)v3, v6);
        }
      }
    }
  }
}

+ (id)findEntriesInDirectory:(id)a3 createdAfter:(id)a4 matchingPattern:(id)a5
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  [v9 array];
  uint64_t v29 = v28 = v7;
  uint64_t v11 = [v7 dateByAddingTimeInterval:-1.0];
  uint64_t v12 = [v10 URLByResolvingSymlinksInPath];

  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = *MEMORY[0x1E4F1C540];
  v36[0] = *MEMORY[0x1E4F1C6E8];
  v36[1] = v14;
  v36[2] = *MEMORY[0x1E4F1C628];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  uint64_t v27 = (void *)v12;
  id v16 = [v13 enumeratorAtURL:v12 includingPropertiesForKeys:v15 options:1 errorHandler:0];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v30 = 0;
        [v22 getResourceValue:&v30 forKey:v14 error:0];
        id v23 = v30;
        if ([v11 compare:v23] == -1)
        {
          long long v24 = [v22 lastPathComponent];
          if (objc_msgSend(v8, "numberOfMatchesInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length")) == 1) {
            [v29 addObject:v22];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [v29 sortedArrayUsingComparator:&__block_literal_global_113];

  return v25;
}

uint64_t __63__DEUtils_findEntriesInDirectory_createdAfter_matchingPattern___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C540];
  id v3 = a2;
  [v3 getResourceValue:&v8 forKey:v2 error:0];
  uint64_t v7 = 0;
  id v4 = v8;
  [v3 getResourceValue:&v7 forKey:v2 error:0];

  uint64_t v5 = [v4 compare:v7];
  return v5;
}

+ (id)processErrorResponse:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [&unk_1EFE526E0 countByEnumeratingWithState:&v22 objects:v26 count:16];
  uint64_t v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v10 = v7;
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(&unk_1EFE526E0);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v21 = v7;
        uint64_t v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v11 options:0 error:&v21];
        id v7 = v21;

        uint64_t v13 = objc_msgSend(v12, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
        uint64_t v14 = v13;
        if (v13)
        {
          if ([v13 count])
          {
            id v15 = [v14 objectAtIndexedSubscript:0];
            uint64_t v16 = [v15 rangeAtIndex:1];

            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v17 = [v14 objectAtIndexedSubscript:0];
              uint64_t v18 = [v17 rangeAtIndex:1];
              uint64_t v5 = objc_msgSend(v3, "substringWithRange:", v18, v19);

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v6 = [&unk_1EFE526E0 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v5 = v3;
LABEL_13:
  }
  return v5;
}

+ (id)uniqueTemporaryDirectory
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = NSTemporaryDirectory();
  uint64_t v4 = [v2 fileURLWithPath:v3];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  uint64_t v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:v4 create:1 error:&v11];
  id v7 = v11;

  if (v7)
  {
    uint64_t v8 = Log_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[DEUtils uniqueTemporaryDirectory](v7);
    }

    id v9 = v4;
    uint64_t v6 = v9;
  }

  return v6;
}

+ (void)getFileSystemItemSize:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "NSURLFileSizeKey error [%{public}@]", v2);
}

+ (void)getFileSystemItemSize:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "given URL [%{public}@] does not exist", v4, v5, v6, v7, v8);
}

+ (void)getDirectorySize:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "given directory [%{public}@] does not exist or is not directory, cannot get size", v4, v5, v6, v7, v8);
}

void __28__DEUtils_getDirectorySize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11(&dword_1A7E51000, v0, v1, "Error enumrating url [%{public}@] err [%{public}@]");
}

+ (void)excludeFromBackup:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v2, v3, "Error excluding [%{public}@] from backup %@", v4, v5, v6, v7, v8);
}

+ (void)tarGzForDirectoryUrl:validatesUrl:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "+[DEUtils tarGzForDirectoryUrl:validatesUrl:]";
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1A7E51000, v0, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v1, 0x16u);
}

+ (void)isValidDirectory:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidDirectory:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidDirectory:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "url given [%@] does not exist", v2);
}

+ (void)copyAllFilesFromDir:toDir:keepSourceDir:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "Failed to create enumerator for [%{public}@]", v2);
}

+ (void)copyAllFilesFromDir:(void *)a3 toDir:(NSObject *)a4 keepSourceDir:.cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1A7E51000, a4, OS_LOG_TYPE_ERROR, "Failed to create directory [%{public}@]", a1, 0xCu);
}

+ (void)copyItem:toDestinationDir:zipped:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1A7E51000, v0, OS_LOG_TYPE_DEBUG, "Copied [%@] to [%@]", v1, 0x16u);
}

+ (void)copyItem:(void *)a1 toDestinationDir:(void *)a2 zipped:.cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 path];
  id v10 = [a2 path];
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v4, v5, "Failed to copy item [%{public}@] to destination [%{public}@]", v6, v7, v8, v9, 2u);
}

+ (void)copyItem:toDestinationDir:zipped:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "Error: Failed to create folder [%@]", v2);
}

+ (void)copyAndReturn:(void *)a1 toDir:withNewFileName:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "tried to copy directory [%{public}@], wrong method", v4, v5, v6, v7, v8);
}

+ (void)lsDir:sorted:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11(&dword_1A7E51000, v0, v1, "failed to get contents of feedback directory [%@] error [%@]");
}

+ (void)createDirectoryWithClassCDataProtection:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "Error setting file protection key: %@", v4, v5, v6, v7, v8);
}

+ (void)createDirectoryWithClassCDataProtection:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Setting Class C for [%{public}@]", v4, v5, v6, v7, v8);
}

+ (void)copyPath:(uint64_t)a3 toDestinationDir:(uint64_t)a4 zipped:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)copyPath:toDestinationDir:zipped:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "Error copying and zipping: %@", v2);
}

+ (void)copyPath:(uint64_t)a1 toDestinationDir:zipped:.cold.3(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v2, v3, "Error copying (%@) %@", v4, v5, v6, v7, v8);
}

+ (void)copyPath:toDestinationDir:zipped:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v0, v1, "Error: Create folder failed %@", v2);
}

+ (void)removeFile:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v3, v4, "Error removing file: %@, %@", v5, v6, v7, v8, 2u);
}

+ (void)uniqueTemporaryDirectory
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "Failed to initialize destination directory for SPX with error [%{public}@]", v4, v5, v6, v7, v8);
}

@end