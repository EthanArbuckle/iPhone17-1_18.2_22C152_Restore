@interface EMPersistenceLayoutManager
+ (NSString)baseMailDirectoryPath;
+ (NSURL)baseMailDirectory;
+ (NSURL)mailAccountDirectory;
+ (NSURL)mailDataDirectory;
+ (OS_os_log)log;
+ (id)_nonContainerizedBaseMailDirectoryPathCreated:(BOOL *)a3;
@end

@implementation EMPersistenceLayoutManager

void __51__EMPersistenceLayoutManager_baseMailDirectoryPath__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  uint64_t v1 = [*(id *)(a1 + 32) _nonContainerizedBaseMailDirectoryPathCreated:&v9];
  v2 = (void *)baseMailDirectoryPath_mailDirectory;
  baseMailDirectoryPath_mailDirectory = v1;

  if (v9)
  {
    int v3 = open((const char *)[(id)baseMailDirectoryPath_mailDirectory fileSystemRepresentation], 0);
    if (v3 < 0)
    {
      v8 = +[EMPersistenceLayoutManager log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = baseMailDirectoryPath_mailDirectory;
        _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "Could not open fd for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      int v4 = v3;
      int v5 = fcntl(v3, 64, 4);
      if (v5)
      {
        int v6 = v5;
        v7 = +[EMPersistenceLayoutManager log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v11 = baseMailDirectoryPath_mailDirectory;
          __int16 v12 = 1024;
          int v13 = v6;
          _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Could not set protection class on %{public}@: %d", buf, 0x12u);
        }
      }
      close(v4);
    }
  }
}

+ (NSURL)mailAccountDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = [a1 mailAccountDirectoryPath];
  int v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

+ (NSURL)mailDataDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = [a1 mailDataDirectoryPath];
  int v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

+ (NSString)baseMailDirectoryPath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__EMPersistenceLayoutManager_baseMailDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (baseMailDirectoryPath_onceToken != -1) {
    dispatch_once(&baseMailDirectoryPath_onceToken, block);
  }
  v2 = (void *)baseMailDirectoryPath_mailDirectory;
  return (NSString *)v2;
}

+ (id)_nonContainerizedBaseMailDirectoryPathCreated:(BOOL *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = EFNonContainerizedHomeDirectory();
  v7 = [v6 URLByAppendingPathComponent:@"Library"];
  v8 = [v7 URLByAppendingPathComponent:@"Mail"];

  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"EMPersistenceLayoutManager.m" lineNumber:55 description:@"Unable to get mail directory"];
  }
  *a3 = 0;
  char v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  int v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:&v19];
  id v11 = v19;

  if (v10)
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v11, "ef_match");
    __int16 v12 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    char v13 = v12[2](v12, *MEMORY[0x1E4F281F8], 516);

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = +[EMPersistenceLayoutManager log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_msgSend(v11, "ef_publicDescription");
        +[EMPersistenceLayoutManager _nonContainerizedBaseMailDirectoryPathCreated:v14];
      }
    }
  }
  v16 = [v8 path];

  return v16;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EMPersistenceLayoutManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1) {
    dispatch_once(&log_onceToken_32, block);
  }
  v2 = (void *)log_log_32;
  return (OS_os_log *)v2;
}

void __33__EMPersistenceLayoutManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;
}

+ (NSURL)baseMailDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [a1 baseMailDirectoryPath];
  int v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

+ (void)_nonContainerizedBaseMailDirectoryPathCreated:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to create Mail directory:\n%{public}@", buf, 0xCu);
}

@end