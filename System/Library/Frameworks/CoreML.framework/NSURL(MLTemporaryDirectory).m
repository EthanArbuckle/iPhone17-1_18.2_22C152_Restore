@interface NSURL(MLTemporaryDirectory)
+ (id)uniqueDirectoryURLInPath:()MLTemporaryDirectory;
- (uint64_t)removeItemAndReturnError:()MLTemporaryDirectory;
@end

@implementation NSURL(MLTemporaryDirectory)

- (uint64_t)removeItemAndReturnError:()MLTemporaryDirectory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x19F3C29E0]();
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  uint64_t v7 = [v6 removeItemAtURL:a1 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to delete the temporary directory: %@. Error: %@", buf, 0x16u);
    }
  }
  if (a3) {
    *a3 = v8;
  }

  return v7;
}

+ (id)uniqueDirectoryURLInPath:()MLTemporaryDirectory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x19F3C29E0]();
  v5 = [MEMORY[0x1E4F28F80] processInfo];
  v6 = [v5 globallyUniqueString];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [v3 stringByAppendingPathComponent:v6];
  v9 = [v7 fileURLWithPath:v8 isDirectory:1];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = 0;
    char v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v16];
    v12 = v16;

    if (v11)
    {
      id v13 = v9;
      goto LABEL_10;
    }
    __int16 v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory at: %@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Failed to create URL from base directory %@ and the unique string %@", buf, 0x16u);
    }
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

@end