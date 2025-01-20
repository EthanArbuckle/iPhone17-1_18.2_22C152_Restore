@interface SSUCacheDirectoryProviderTemporary
- (NSURL)_directory;
- (id)lookupOrCreateCacheDirectory:(id *)a3;
- (void)dealloc;
@end

@implementation SSUCacheDirectoryProviderTemporary

- (void).cxx_destruct
{
}

- (NSURL)_directory
{
  return self->__directory;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->__directory)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      directory = self->__directory;
      *(_DWORD *)buf = 136315394;
      v14 = "-[SSUCacheDirectoryProviderTemporary dealloc]";
      __int16 v15 = 2112;
      v16 = directory;
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Cleaning up temporary cache directory: %@", buf, 0x16u);
    }

    v4 = [MEMORY[0x263F08850] defaultManager];
    v5 = self->__directory;
    id v12 = 0;
    char v6 = [v4 removeItemAtURL:v5 error:&v12];
    id v7 = v12;

    if ((v6 & 1) == 0)
    {
      v8 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = self->__directory;
        *(_DWORD *)buf = 136315650;
        v14 = "-[SSUCacheDirectoryProviderTemporary dealloc]";
        __int16 v15 = 2112;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to remove temporary cache directory: %@. Error: %@.", buf, 0x20u);
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SSUCacheDirectoryProviderTemporary;
  [(SSUCacheDirectoryProviderTemporary *)&v11 dealloc];
}

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  directory = self->__directory;
  if (directory) {
    goto LABEL_7;
  }
  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"SSUCacheDirectoryProviderTemporary-%p", self);
  id v7 = NSURL;
  v8 = NSTemporaryDirectory();
  v9 = [v8 stringByAppendingPathComponent:v6];
  v10 = [v7 fileURLWithPath:v9];
  objc_super v11 = self->__directory;
  self->__directory = v10;

  id v12 = [MEMORY[0x263F08850] defaultManager];
  v13 = self->__directory;
  id v24 = 0;
  int v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v15 = v24;

  if (a3 && (v14 & 1) == 0)
  {
    uint64_t v16 = *MEMORY[0x263F08320];
    v26[0] = @"Could not create cache directory.";
    uint64_t v17 = *MEMORY[0x263F08338];
    v25[0] = v16;
    v25[1] = v17;
    id v18 = NSString;
    uint64_t v19 = [v15 description];
    v20 = [v18 stringWithFormat:@"createDirectoryAtURL call failed with error: %@.", v19];
    v26[1] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

    *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"SSUCacheDirectoryProviderErrorDomain" code:2 userInfo:v21];
  }
  if (v14)
  {
    directory = self->__directory;
LABEL_7:
    v22 = directory;
    goto LABEL_8;
  }
  v22 = 0;
LABEL_8:
  return v22;
}

@end