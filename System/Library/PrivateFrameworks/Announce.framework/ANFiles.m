@interface ANFiles
+ (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5;
+ (id)createTemporaryURLWithFileExtension:(id)a3 directory:(id)a4;
+ (id)shared;
+ (id)temporaryDirectoryUrl;
+ (void)purgeTemporarySubDirectory:(id)a3;
+ (void)removeItem:(id)a3;
- (id)createDirectory:(id)a3 andFileURLWithExtension:(id)a4;
- (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5;
- (id)createTemporaryURLWithExtension:(id)a3 directory:(id)a4;
- (void)purgeTemporarySubDirectory:(id)a3;
- (void)removeDirectoryIfEmpty:(id)a3;
- (void)removeItem:(id)a3;
@end

@implementation ANFiles

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__ANFiles_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_shared;

  return v2;
}

uint64_t __17__ANFiles_shared__block_invoke()
{
  shared_shared = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[ANFiles shared];
  v11 = [v10 createTemporaryFileWithData:v9 extension:v8 directory:v7];

  return v11;
}

+ (id)createTemporaryURLWithFileExtension:(id)a3 directory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ANFiles shared];
  id v8 = [v7 createTemporaryURLWithExtension:v6 directory:v5];

  return v8;
}

+ (void)purgeTemporarySubDirectory:(id)a3
{
  id v3 = a3;
  id v4 = +[ANFiles shared];
  [v4 purgeTemporarySubDirectory:v3];
}

+ (void)removeItem:(id)a3
{
  id v3 = a3;
  id v4 = +[ANFiles shared];
  [v4 removeItem:v3];
}

+ (id)temporaryDirectoryUrl
{
  v2 = NSURL;
  id v3 = NSTemporaryDirectory();
  id v4 = [v2 fileURLWithPath:v3];

  return v4;
}

- (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(ANFiles *)self createDirectory:a5 andFileURLWithExtension:a4];
  if (!v9) {
    goto LABEL_4;
  }
  id v16 = 0;
  char v10 = [v8 writeToURL:v9 options:1 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {

LABEL_4:
    id v13 = v9;
    goto LABEL_8;
  }
  v14 = ANLogHandleFiles();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v18 = &stru_26D2D46B0;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_220FAA000, v14, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to write to temporary file: %@", buf, 0x16u);
  }

  id v13 = 0;
LABEL_8:

  return v13;
}

- (id)createTemporaryURLWithExtension:(id)a3 directory:(id)a4
{
  return [(ANFiles *)self createDirectory:a4 andFileURLWithExtension:a3];
}

- (void)purgeTemporarySubDirectory:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[ANFiles temporaryDirectoryUrl];
  id v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:1];

  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];

  id v8 = +[ANFiles temporaryDirectoryUrl];
  id v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:1];

  id v10 = v5;
  id v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
  id v12 = v9;
  id v13 = (const std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
  rename(v11, v13, v14);
  if (v15)
  {
    int v16 = *__error();
    v17 = ANLogHandleFiles();
    v18 = v17;
    if (v16 == 2)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = &stru_26D2D46B0;
        __int16 v19 = "%@ANFiles: skipping purge, directory does not exist";
        v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        uint32_t v22 = 12;
LABEL_11:
        _os_log_impl(&dword_220FAA000, v20, v21, v19, buf, v22);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v25 = *__error();
      *(_DWORD *)buf = 138412546;
      v28 = &stru_26D2D46B0;
      __int16 v29 = 1024;
      LODWORD(v30) = v25;
      __int16 v19 = "%@ANFiles: failed to rename directory before safely purging: %d";
      v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    [v23 removeItemAtURL:v12 error:&v26];
    v18 = v26;

    if (v18)
    {
      v24 = ANLogHandleFiles();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v28 = &stru_26D2D46B0;
        __int16 v29 = 2112;
        id v30 = v12;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_220FAA000, v24, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to remove temporary sub directory at %@: %@", buf, 0x20u);
      }
    }
  }
}

- (void)removeItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v8 = 0;
  [v5 removeItemAtURL:v4 error:&v8];
  id v6 = v8;

  if (v6)
  {
    id v7 = ANLogHandleFiles();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v10 = &stru_26D2D46B0;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to remove item at %@: %@", buf, 0x20u);
    }
  }
  else
  {
    id v7 = [v4 URLByDeletingLastPathComponent];
    [(ANFiles *)self removeDirectoryIfEmpty:v7];
  }
}

- (id)createDirectory:(id)a3 andFileURLWithExtension:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ANFiles temporaryDirectoryUrl];
  id v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:1];

  id v9 = ANLogHandleFiles();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = &stru_26D2D46B0;
    __int16 v24 = 2112;
    int v25 = v8;
    _os_log_impl(&dword_220FAA000, v9, OS_LOG_TYPE_DEFAULT, "%@ANFiles: creating directory at: %@", buf, 0x16u);
  }

  id v10 = v8;
  if (mkdir((const char *)[v10 fileSystemRepresentation], 0x1EDu) && *__error() != 17)
  {
    v17 = ANLogHandleFiles();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = *__error();
      *(_DWORD *)buf = 138412546;
      v23 = &stru_26D2D46B0;
      __int16 v24 = 1024;
      LODWORD(v25) = v20;
      _os_log_impl(&dword_220FAA000, v17, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to create directory: %d", buf, 0x12u);
    }
    v18 = 0;
  }
  else
  {
    __int16 v11 = NSString;
    id v12 = objc_opt_new();
    __int16 v13 = [v12 UUIDString];
    id v14 = +[ANUtils an_dateFormatterForFilename];
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    int v16 = [v14 stringFromDate:v15];
    v17 = [v11 stringWithFormat:@"%@--%@", v13, v16];

    v18 = [v10 URLByAppendingPathComponent:v17 isDirectory:0];
    if ([v5 length])
    {
      uint64_t v19 = [v18 URLByAppendingPathExtension:v5];

      v18 = (void *)v19;
    }
  }

  return v18;
}

- (void)removeDirectoryIfEmpty:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (rmdir((const char *)[v3 fileSystemRepresentation]))
  {
    if (*__error() == 66)
    {
      id v4 = ANLogHandleFiles();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        __int16 v13 = &stru_26D2D46B0;
        id v5 = "%@ANFiles: failed to remove directory because it is not empty";
        id v6 = v4;
        os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
        uint32_t v8 = 12;
LABEL_10:
        _os_log_impl(&dword_220FAA000, v6, v7, v5, (uint8_t *)&v12, v8);
      }
    }
    else
    {
      int v9 = *__error();
      id v10 = ANLogHandleFiles();
      id v4 = v10;
      if (v9 == 20)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412546;
          __int16 v13 = &stru_26D2D46B0;
          __int16 v14 = 2112;
          id v15 = v3;
          id v5 = "%@ANFiles: failed to remove item. %@ is not a directory";
          id v6 = v4;
          os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
          uint32_t v8 = 22;
          goto LABEL_10;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = *__error();
        int v12 = 138412546;
        __int16 v13 = &stru_26D2D46B0;
        __int16 v14 = 1024;
        LODWORD(v15) = v11;
        id v5 = "%@ANFiles: failed to remove directory: %d";
        id v6 = v4;
        os_log_type_t v7 = OS_LOG_TYPE_ERROR;
        uint32_t v8 = 18;
        goto LABEL_10;
      }
    }
  }
}

@end