@interface CNFileServices
+ (CNFileServices)sharedInstance;
+ (id)tmpDirLog;
- (id)bespokeTemporaryDirectory;
- (id)preferredTemporaryDirectory;
- (id)secureTemporaryDirectory;
- (id)secureTemporarySubdirectoryWithName:(id)a3;
- (id)secureTemporarySubdirectoryWithSubpathComponents:(id)a3;
- (id)temporaryDirectory;
- (id)temporaryDirectoryOfLastResort;
- (int)close:(int)a3;
- (int)errnoValue;
- (int)fcntl_flock:(int)a3 :(int)a4 :(flock *)a5;
- (int)flock:(int)a3 :(int)a4;
- (int)fstatfs:(int)a3 :(statfs *)a4;
- (int)open:(const char *)a3 :(int)a4 :(unsigned __int16)a5;
- (int)statfs:(const char *)a3 :(statfs *)a4;
- (void)preferredTemporaryDirectory;
@end

@implementation CNFileServices

+ (id)tmpDirLog
{
  if (tmpDirLog_cn_once_token_1 != -1) {
    dispatch_once(&tmpDirLog_cn_once_token_1, &__block_literal_global_20);
  }
  v2 = (void *)tmpDirLog_cn_once_object_1;

  return v2;
}

uint64_t __27__CNFileServices_tmpDirLog__block_invoke()
{
  tmpDirLog_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "temp-dir");

  return MEMORY[0x1F41817F8]();
}

+ (CNFileServices)sharedInstance
{
  if (sharedInstance_cn_once_token_2_0 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_2_0, &__block_literal_global_4_1);
  }
  v2 = (void *)sharedInstance_cn_once_object_2_0;

  return (CNFileServices *)v2;
}

uint64_t __32__CNFileServices_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_2_0 = objc_alloc_init(CNFileServices);

  return MEMORY[0x1F41817F8]();
}

- (int)errnoValue
{
  return *__error();
}

- (int)open:(const char *)a3 :(int)a4 :(unsigned __int16)a5
{
  return open(a3, a4, a5);
}

- (int)close:(int)a3
{
  return close(a3);
}

- (int)statfs:(const char *)a3 :(statfs *)a4
{
  return statfs(a3, a4);
}

- (int)fstatfs:(int)a3 :(statfs *)a4
{
  return fstatfs(a3, a4);
}

- (int)flock:(int)a3 :(int)a4
{
  return flock(a3, a4);
}

- (int)fcntl_flock:(int)a3 :(int)a4 :(flock *)a5
{
  return fcntl(a3, a4, a5);
}

- (id)temporaryDirectory
{
  v3 = [(CNFileServices *)self preferredTemporaryDirectory];
  if (!v3)
  {
    v3 = [(CNFileServices *)self bespokeTemporaryDirectory];
    if (!v3)
    {
      v3 = [(CNFileServices *)self temporaryDirectoryOfLastResort];
    }
  }

  return v3;
}

- (id)secureTemporaryDirectory
{
  return [(CNFileServices *)self secureTemporarySubdirectoryWithSubpathComponents:MEMORY[0x1E4F1CBF0]];
}

- (id)secureTemporarySubdirectoryWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v9 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v7 = -[CNFileServices secureTemporarySubdirectoryWithSubpathComponents:](self, "secureTemporarySubdirectoryWithSubpathComponents:", v6, v9, v10);

  return v7;
}

- (id)secureTemporarySubdirectoryWithSubpathComponents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNFileServices *)self temporaryDirectory];
  v6 = [v5 URLByAppendingPathComponent:@"TemporaryItems" isDirectory:1];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v12 length])
        {
          uint64_t v13 = [v6 URLByAppendingPathComponent:v12 isDirectory:1];

          v6 = (void *)v13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v21 = 0;
  char v15 = [v14 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v16 = v21;
  if ((v15 & 1) == 0
    && !+[CNFoundationError isFileAlreadyExistsError:v16])
  {
    v17 = [(id)objc_opt_class() tmpDirLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(CNFileServices *)(uint64_t)v6 secureTemporarySubdirectoryWithSubpathComponents:v17];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19091D000, v17, OS_LOG_TYPE_DEFAULT, "The action with a temporary URL will still be attempted, but the behavior is now undefined.", v20, 2u);
    }
  }
  id v18 = v6;

  return v18;
}

- (id)preferredTemporaryDirectory
{
  v2 = NSTemporaryDirectory();
  v3 = v2;
  if (v2)
  {
    if ([v2 length])
    {
      id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
      goto LABEL_9;
    }
    id v5 = [(id)objc_opt_class() tmpDirLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNFileServices preferredTemporaryDirectory](v5);
    }
  }
  else
  {
    id v5 = [(id)objc_opt_class() tmpDirLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNFileServices preferredTemporaryDirectory](v5);
    }
  }

  id v4 = 0;
LABEL_9:

  return v4;
}

- (id)bespokeTemporaryDirectory
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/" isDirectory:1];
  uint64_t v9 = 0;
  id v4 = [v2 URLForDirectory:99 inDomain:1 appropriateForURL:v3 create:1 error:&v9];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(id)objc_opt_class() tmpDirLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_19091D000, v6, OS_LOG_TYPE_INFO, "FileManager did not provide an item replacement directory", v8, 2u);
    }
  }

  return v4;
}

- (id)temporaryDirectoryOfLastResort
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/tmp" isDirectory:1];
}

- (void)secureTemporarySubdirectoryWithSubpathComponents:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "Could not create secure temporary directory %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)preferredTemporaryDirectory
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "NSTemporaryDirectory() returned an empty string", v1, 2u);
}

@end