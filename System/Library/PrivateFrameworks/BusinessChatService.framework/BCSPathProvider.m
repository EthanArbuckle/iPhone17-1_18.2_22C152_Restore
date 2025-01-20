@interface BCSPathProvider
+ (id)sharedInstance;
- (BCSFileManagementProviding)fileManager;
- (BCSPathProvider)init;
- (BCSPathProvider)initWithFileManager:(id)a3 temporaryDirectoryBuilder:(id)a4;
- (BOOL)cachesDirectoryFileProtectionLevelVerified;
- (BOOL)documentsDirectoryFileProtectionLevelVerified;
- (NSURL)brandLogoCacheURL;
- (NSURL)cachesURL;
- (NSURL)documentsURL;
- (NSURL)tempURL;
- (id)_setupStorageWithBaseFileURL:(id)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5;
- (id)_setupStorageWithSearchPathDirectory:(unint64_t)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5;
- (id)temporaryDirectoryBuilder;
- (void)setCachesDirectoryFileProtectionLevelVerified:(BOOL)a3;
- (void)setDocumentsDirectoryFileProtectionLevelVerified:(BOOL)a3;
- (void)setFileManager:(id)a3;
- (void)setTemporaryDirectoryBuilder:(id)a3;
@end

@implementation BCSPathProvider

+ (id)sharedInstance
{
  if (_MergedGlobals_40 != -1) {
    dispatch_once(&_MergedGlobals_40, &__block_literal_global_9);
  }
  v2 = (void *)qword_26ACEFD00;

  return v2;
}

uint64_t __33__BCSPathProvider_sharedInstance__block_invoke()
{
  qword_26ACEFD00 = objc_alloc_init(BCSPathProvider);

  return MEMORY[0x270F9A758]();
}

- (NSURL)documentsURL
{
  return (NSURL *)[(BCSPathProvider *)self _setupStorageWithSearchPathDirectory:9 applyFileProtectionType:*MEMORY[0x263EFF648] verificationToken:&self->_documentsDirectoryFileProtectionLevelVerified];
}

- (NSURL)cachesURL
{
  return (NSURL *)[(BCSPathProvider *)self _setupStorageWithSearchPathDirectory:13 applyFileProtectionType:*MEMORY[0x263EFF648] verificationToken:&self->_cachesDirectoryFileProtectionLevelVerified];
}

- (NSURL)tempURL
{
  v3 = NSURL;
  v4 = [(BCSPathProvider *)self temporaryDirectoryBuilder];
  v5 = v4[2]();
  v6 = [v3 fileURLWithPath:v5];
  v7 = [(BCSPathProvider *)self _setupStorageWithBaseFileURL:v6 applyFileProtectionType:0 verificationToken:0];

  return (NSURL *)v7;
}

- (BCSPathProvider)init
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(BCSPathProvider *)self initWithFileManager:v3 temporaryDirectoryBuilder:&__block_literal_global_6];

  return v4;
}

- (BCSPathProvider)initWithFileManager:(id)a3 temporaryDirectoryBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSPathProvider;
  v9 = [(BCSPathProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    uint64_t v11 = MEMORY[0x2166BDB40](v8);
    id temporaryDirectoryBuilder = v10->_temporaryDirectoryBuilder;
    v10->_id temporaryDirectoryBuilder = (id)v11;
  }
  return v10;
}

- (id)_setupStorageWithSearchPathDirectory:(unint64_t)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = [(BCSPathProvider *)self fileManager];
  id v15 = 0;
  v10 = [v9 URLForDirectory:a3 inDomain:1 appropriateForURL:0 create:0 error:&v15];
  id v11 = v15;

  if (v10)
  {
    v12 = [(BCSPathProvider *)self _setupStorageWithBaseFileURL:v10 applyFileProtectionType:v8 verificationToken:a5];
  }
  else
  {
    if (v11)
    {
      v13 = ABSLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_2154F4000, v13, OS_LOG_TYPE_ERROR, "Unable to determine directory from NSFileManager: %@", buf, 0xCu);
      }
    }
    v12 = 0;
  }

  return v12;
}

- (id)_setupStorageWithBaseFileURL:(id)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v10 bundleIdentifier];
    v12 = [v8 URLByAppendingPathComponent:v11 isDirectory:1];

    if (v12)
    {
      v13 = [(BCSPathProvider *)self fileManager];
      objc_super v14 = [v12 path];
      char v15 = [v13 fileExistsAtPath:v14];

      if ((v15 & 1) == 0)
      {
        v16 = ABSLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v27 = [v12 path];
          *(_DWORD *)buf = 138412290;
          id v32 = v27;
          _os_log_debug_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEBUG, "Creating directory here: %@", buf, 0xCu);
        }
        id v17 = [(BCSPathProvider *)self fileManager];
        id v30 = 0;
        char v18 = [v17 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v30];
        id v19 = v30;

        if ((v18 & 1) == 0)
        {
          v20 = ABSLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v28 = [v12 path];
            *(_DWORD *)buf = 138543618;
            id v32 = v28;
            __int16 v33 = 2112;
            id v34 = v19;
            _os_log_error_impl(&dword_2154F4000, v20, OS_LOG_TYPE_ERROR, "Error creating directory: %{public}@ - %@}", buf, 0x16u);
          }
          v12 = 0;
        }
      }
      if (v9 && v12 && (!a5 || !*a5))
      {
        uint64_t v21 = *MEMORY[0x263EFF650];
        id v29 = 0;
        int v22 = [v12 setResourceValue:v9 forKey:v21 error:&v29];
        id v23 = v29;
        v24 = ABSLogCommon();
        v25 = v24;
        if (!v22 || v23)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v23;
            _os_log_error_impl(&dword_2154F4000, v25, OS_LOG_TYPE_ERROR, "Failed to set the file protection level to class C on the caches directory, error: %@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_2154F4000, v25, OS_LOG_TYPE_DEBUG, "Successfully set caches directory file protection level to class C", buf, 2u);
          }

          if (a5) {
            *a5 = 1;
          }
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSURL)brandLogoCacheURL
{
  v2 = [(BCSPathProvider *)self cachesURL];
  v3 = [v2 URLByAppendingPathComponent:@"BrandLogos" isDirectory:1];

  return (NSURL *)v3;
}

- (BOOL)documentsDirectoryFileProtectionLevelVerified
{
  return self->_documentsDirectoryFileProtectionLevelVerified;
}

- (void)setDocumentsDirectoryFileProtectionLevelVerified:(BOOL)a3
{
  self->_documentsDirectoryFileProtectionLevelVerified = a3;
}

- (BOOL)cachesDirectoryFileProtectionLevelVerified
{
  return self->_cachesDirectoryFileProtectionLevelVerified;
}

- (void)setCachesDirectoryFileProtectionLevelVerified:(BOOL)a3
{
  self->_cachesDirectoryFileProtectionLevelVerified = a3;
}

- (BCSFileManagementProviding)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (id)temporaryDirectoryBuilder
{
  return self->_temporaryDirectoryBuilder;
}

- (void)setTemporaryDirectoryBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_temporaryDirectoryBuilder, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end