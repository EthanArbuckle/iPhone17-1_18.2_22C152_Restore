@interface WFTemporaryFileManager
+ (BOOL)isTemporaryFile:(id)a3;
+ (id)appGroupIdentifier;
+ (id)createSharedTemporaryDirectoryWithFilename:(id)a3;
+ (id)createSharedTemporaryFileWithFilename:(id)a3;
+ (id)createTemporaryDirectoryWithFilename:(id)a3;
+ (id)createTemporaryDirectoryWithFilename:(id)a3 inDirectory:(id)a4;
+ (id)createTemporaryFileWithFilename:(id)a3;
+ (id)createTemporaryFileWithFilename:(id)a3 inDirectory:(id)a4;
+ (id)createUniqueDirectoryInDirectory:(id)a3;
+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4;
+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4 isDirectory:(BOOL)a5;
+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4;
+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4 isDirectory:(BOOL)a5;
+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3;
+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4;
+ (id)proposedTemporaryFileURLForFilename:(id)a3;
+ (id)proposedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4;
+ (id)sharedAppGroupDirectoryURL;
+ (id)sharedShortcutsAppGroupDirectoryURL;
+ (id)sharedTemporaryDirectoryURL;
+ (id)temporaryDirectoryURL;
+ (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:(id)a3 error:(id *)a4;
+ (void)clearTemporaryFiles;
+ (void)configureBackupFlagAtURL:(id)a3;
+ (void)configureBackupFlagIfNecessary;
+ (void)configureFileProtectionAtPath:(id)a3;
+ (void)configureTemporaryDirectoryProtectionIfNecessary;
+ (void)createSharedDirectoryIfNecessary;
+ (void)markDirectoryAsPurgeableAtURL:(id)a3;
+ (void)setUpDirectories;
@end

@implementation WFTemporaryFileManager

void __45__WFTemporaryFileManager_clearTemporaryFiles__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __42__WFTemporaryFileManager_setUpDirectories__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) configureTemporaryDirectoryProtectionIfNecessary];
  id v2 = *(void **)(a1 + 32);
  return [v2 configureBackupFlagIfNecessary];
}

void __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  id v2 = (void *)v1;
  uint64_t v3 = @"com.apple.shortcuts.unknown";
  if (v1) {
    uint64_t v3 = (__CFString *)v1;
  }
  uint64_t v4 = v3;

  int v5 = _sandbox_in_a_container();
  uint64_t v6 = getWFFilesLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v15 = 136315138;
      v16 = "+[WFTemporaryFileManager temporaryDirectoryURL]_block_invoke";
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_DEFAULT, "%s No access to Shortcuts Temporary Data Vault, but containerized, using container's NSTemporaryDirectory()", (uint8_t *)&v15, 0xCu);
    }

    long long v8 = NSURL;
    long long v9 = NSTemporaryDirectory();
    uint64_t v10 = [v8 fileURLWithPath:v9 isDirectory:1];
    v11 = (void *)temporaryDirectoryURL_URL;
    temporaryDirectoryURL_URL = v10;
  }
  else
  {
    if (v7)
    {
      int v15 = 136315138;
      v16 = "+[WFTemporaryFileManager temporaryDirectoryURL]_block_invoke";
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_DEFAULT, "%s No access to Shortcuts Temporary Data Vault, and not containerized, using system NSTemporaryDirectory() with suffix", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = NSURL;
    long long v9 = NSTemporaryDirectory();
    v11 = [v12 fileURLWithPath:v9 isDirectory:1];
    uint64_t v13 = [v11 URLByAppendingPathComponent:v4 isDirectory:1];
    v14 = (void *)temporaryDirectoryURL_URL;
    temporaryDirectoryURL_URL = v13;
  }
}

+ (void)configureBackupFlagIfNecessary
{
  id v3 = [a1 sharedTemporaryDirectoryURL];
  [a1 configureBackupFlagAtURL:v3];
}

+ (void)configureBackupFlagAtURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 206, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  id v21 = 0;
  uint64_t v6 = *MEMORY[0x263EFF6B0];
  id v20 = 0;
  char v7 = [v5 getResourceValue:&v21 forKey:v6 error:&v20];
  id v8 = v21;
  id v9 = v20;
  if ((v7 & 1) == 0)
  {
    uint64_t v13 = getWFTemporaryFileManagerLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Error checking backup flag at %@: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if (([v8 BOOLValue] & 1) == 0)
  {
    id v19 = v9;
    int v10 = [v5 setResourceValue:MEMORY[0x263EFFA88] forKey:v6 error:&v19];
    id v11 = v19;

    uint64_t v12 = getWFTemporaryFileManagerLogObject();
    uint64_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
        __int16 v24 = 2112;
        id v25 = v5;
        v14 = "%s Set backup flag at %@";
        int v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
        uint32_t v17 = 22;
LABEL_12:
        _os_log_impl(&dword_216505000, v15, v16, v14, buf, v17);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v11;
      v14 = "%s Error setting backup flag at %@: %@";
      int v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
      goto LABEL_12;
    }
    id v9 = v11;
LABEL_14:
  }
}

+ (void)setUpDirectories
{
  [a1 createSharedDirectoryIfNecessary];
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WFTemporaryFileManager_setUpDirectories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

+ (void)createSharedDirectoryIfNecessary
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [a1 sharedTemporaryDirectoryURL];
  [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
}

+ (void)clearTemporaryFiles
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = objc_opt_new();
  id v5 = [a1 temporaryDirectoryURL];
  uint64_t v6 = [v3 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:0];
  [v4 addObjectsFromArray:v6];

  char v7 = [a1 sharedTemporaryDirectoryURL];
  id v8 = [v3 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:0];
  [v4 addObjectsFromArray:v8];

  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

  id v11 = dispatch_queue_create("WFInitializeProcessWithDatabase temporary file clearing", v10);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__WFTemporaryFileManager_clearTemporaryFiles__block_invoke;
  v14[3] = &unk_264288C08;
  id v15 = v4;
  id v16 = v3;
  id v12 = v3;
  id v13 = v4;
  dispatch_async(v11, v14);
}

+ (void)configureTemporaryDirectoryProtectionIfNecessary
{
  id v3 = [a1 temporaryDirectoryURL];
  id v4 = [v3 path];
  [a1 configureFileProtectionAtPath:v4];

  id v6 = [a1 sharedTemporaryDirectoryURL];
  id v5 = [v6 path];
  [a1 configureFileProtectionAtPath:v5];
}

+ (void)configureFileProtectionAtPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint32_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 187, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v6 = getWFFilesLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_DEBUG, "%s Configuring file protection at path: %@", buf, 0x16u);
  }

  char v7 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  id v8 = [v7 attributesOfItemAtPath:v5 error:&v19];
  id v9 = v19;
  if (v9)
  {
    id v10 = v9;
    id v11 = getWFFilesLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_ERROR, "%s Failed to read attributes of path %@: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F080A8];
    id v13 = [v8 objectForKey:*MEMORY[0x263F080A8]];
    id v11 = v13;
    if (v13
      && (uint64_t v14 = *MEMORY[0x263F08098],
          ([v13 isEqualToString:*MEMORY[0x263F08098]] & 1) == 0))
    {
      uint64_t v20 = v12;
      uint64_t v21 = v14;
      id v15 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v18 = 0;
      [v7 setAttributes:v15 ofItemAtPath:v5 error:&v18];
      id v10 = v18;

      if (v10)
      {
        id v16 = getWFFilesLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set file protection attributes: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v10 = 0;
    }
  }
}

+ (id)sharedTemporaryDirectoryURL
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [a1 sharedAppGroupDirectoryURL];
  id v3 = [v2 URLByAppendingPathComponent:@"Temporary" isDirectory:1];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 bundleIdentifier];
  id v6 = [v3 URLByAppendingPathComponent:v5 isDirectory:1];

  if (!v6)
  {
    char v7 = getWFTemporaryFileManagerLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "+[WFTemporaryFileManager sharedTemporaryDirectoryURL]";
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s sharedTemporaryDirectoryURL should not be nil", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

+ (id)sharedAppGroupDirectoryURL
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [a1 appGroupIdentifier];
  id v5 = [v3 containerURLForSecurityApplicationGroupIdentifier:v4];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    char v7 = [a1 appGroupIdentifier];
    id v10 = 0;
    id v5 = objc_msgSend(a1, "wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:error:", v7, &v10);
    id v6 = v10;

    if (!v5)
    {
      id v8 = getWFTemporaryFileManagerLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "+[WFTemporaryFileManager sharedAppGroupDirectoryURL]";
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, "%s sharedAppGroupDirectoryURL should not be nil: %{public}@", buf, 0x16u);
      }

      id v5 = 0;
    }
  }

  return v5;
}

+ (id)appGroupIdentifier
{
  id v2 = @"group.com.apple.shortcuts";
  return @"group.com.apple.shortcuts";
}

+ (id)temporaryDirectoryURL
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (temporaryDirectoryURL_onceToken != -1) {
    dispatch_once(&temporaryDirectoryURL_onceToken, &__block_literal_global_16);
  }
  if ((temporaryDirectoryURL_hasCheckedDirectoryExists & 1) == 0)
  {
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v4 = [(id)temporaryDirectoryURL_URL path];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

    if (v5)
    {
      temporaryDirectoryURL_hasCheckedDirectoryExists = 1;
      id v6 = getWFFilesLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        char v7 = [(id)temporaryDirectoryURL_URL path];
        *(_DWORD *)buf = 136315394;
        id v19 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
        __int16 v20 = 2112;
        uint64_t v21 = v7;
        _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_DEFAULT, "%s Found an existing temporary directory at %@", buf, 0x16u);
      }
    }
    else
    {
      id v8 = getWFFilesLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [(id)temporaryDirectoryURL_URL path];
        *(_DWORD *)buf = 136315394;
        id v19 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_DEFAULT, "%s Creating a new temporary directory at %@", buf, 0x16u);
      }
      id v10 = [MEMORY[0x263F08850] defaultManager];
      id v17 = 0;
      int v11 = [v10 createDirectoryAtURL:temporaryDirectoryURL_URL withIntermediateDirectories:1 attributes:0 error:&v17];
      id v6 = v17;

      if (v11)
      {
        temporaryDirectoryURL_hasCheckedDirectoryExists = 1;
        uint64_t v12 = getWFFilesLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v19 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
          _os_log_impl(&dword_216505000, v12, OS_LOG_TYPE_DEFAULT, "%s Successfully created process temporary directory, I will set it up.", buf, 0xCu);
        }

        __int16 v13 = dispatch_get_global_queue(0, 0);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke_21;
        v16[3] = &__block_descriptor_40_e5_v8__0l;
        v16[4] = a1;
        dispatch_async(v13, v16);
      }
      else
      {
        __int16 v13 = getWFFilesLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v19 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
          __int16 v20 = 2112;
          uint64_t v21 = v6;
          _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create process temporary directory with error: %@", buf, 0x16u);
        }
      }
    }
  }
  id v14 = (void *)temporaryDirectoryURL_URL;
  return v14;
}

+ (BOOL)isTemporaryFile:(id)a3
{
  id v3 = a3;
  id v4 = +[WFTemporaryFileManager temporaryDirectoryURL];
  int v5 = +[WFTemporaryFileManager sharedTemporaryDirectoryURL];
  if (objc_msgSend(v3, "wf_proposedFileIsContainedByDirectoryAtURL:", v4)) {
    char v6 = 1;
  }
  else {
    char v6 = objc_msgSend(v3, "wf_proposedFileIsContainedByDirectoryAtURL:", v5);
  }

  return v6;
}

+ (id)createSharedTemporaryFileWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 sharedTemporaryDirectoryURL];
  char v6 = [a1 createTemporaryFileWithFilename:v4 inDirectory:v5];

  return v6;
}

+ (id)createTemporaryFileWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 temporaryDirectoryURL];
  char v6 = [a1 createTemporaryFileWithFilename:v4 inDirectory:v5];

  return v6;
}

+ (id)createTemporaryFileWithFilename:(id)a3 inDirectory:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 390, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  __int16 v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 391, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

LABEL_3:
  id v10 = [v9 URLByAppendingPathComponent:v7 isDirectory:0];
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
    int v13 = open((const char *)[v12 fileSystemRepresentation], 2562, 420);
    if (v13 != -1)
    {
      close(v13);
      id v14 = v12;
      goto LABEL_12;
    }
    if (*__error() == 17)
    {
      uint64_t v15 = [a1 createUniqueDirectoryInDirectory:v9];
      id v14 = [a1 createTemporaryFileWithFilename:v7 inDirectory:v15];

      goto LABEL_12;
    }
    id v16 = getWFTemporaryFileManagerLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = *__error();
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[WFTemporaryFileManager createTemporaryFileWithFilename:inDirectory:]";
      __int16 v23 = 1026;
      int v24 = v17;
      _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create temporary file, errno=%{public}d", buf, 0x12u);
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

+ (id)createTemporaryDirectoryWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 temporaryDirectoryURL];
  char v6 = [a1 createTemporaryDirectoryWithFilename:v4 inDirectory:v5];

  return v6;
}

+ (id)createSharedTemporaryDirectoryWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 sharedTemporaryDirectoryURL];
  char v6 = [a1 createTemporaryDirectoryWithFilename:v4 inDirectory:v5];

  return v6;
}

+ (id)createTemporaryDirectoryWithFilename:(id)a3 inDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 364, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  __int16 v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 365, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

LABEL_3:
  id v10 = [v9 URLByAppendingPathComponent:v7 isDirectory:1];
  if (!v10)
  {
    id v13 = 0;
    goto LABEL_9;
  }
  int v11 = [MEMORY[0x263F08850] defaultManager];
  id v21 = 0;
  char v12 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:0 attributes:0 error:&v21];
  id v13 = v21;

  if (v12)
  {
LABEL_9:
    id v17 = v10;
    goto LABEL_12;
  }
  id v14 = [v13 domain];
  if ([v14 isEqualToString:*MEMORY[0x263F07F70]])
  {
    uint64_t v15 = [v13 code];

    if (v15 == 516)
    {
      id v16 = [a1 createUniqueDirectoryInDirectory:v9];
      id v17 = [a1 createTemporaryDirectoryWithFilename:v7 inDirectory:v16];

      goto LABEL_12;
    }
  }
  else
  {
  }
  id v17 = 0;
LABEL_12:

  return v17;
}

+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4
{
  return (id)[a1 proposedFileURLForFilename:a3 atTheRootOfDirectory:a4 isDirectory:0];
}

+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4
{
  return (id)[a1 proposedFileURLForFilename:a3 inDirectory:a4 isDirectory:0];
}

+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3
{
  return (id)[a1 proposedSharedTemporaryFileURLForFilename:a3 isDirectory:0];
}

+ (id)proposedTemporaryFileURLForFilename:(id)a3
{
  return (id)[a1 proposedTemporaryFileURLForFilename:a3 isDirectory:0];
}

+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 sharedTemporaryDirectoryURL];
  id v8 = [a1 proposedFileURLForFilename:v6 inDirectory:v7 isDirectory:v4];

  return v8;
}

+ (id)proposedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 temporaryDirectoryURL];
  id v8 = [a1 proposedFileURLForFilename:v6 inDirectory:v7 isDirectory:v4];

  return v8;
}

+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 320, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 321, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

LABEL_3:
  SEL v31 = a2;
  id v32 = a1;
  uint64_t v12 = [v11 URLByAppendingPathComponent:v9 isDirectory:v5];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = 2;
    do
    {
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      id v16 = [v13 path];
      int v17 = [v15 fileExistsAtPath:v16];

      if (!v17) {
        goto LABEL_13;
      }
      id v18 = v11;
      id v19 = v9;
      if (v11)
      {
        if (!v9) {
          goto LABEL_11;
        }
      }
      else
      {
        __int16 v23 = [MEMORY[0x263F08690] currentHandler];
        int v24 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nonnull WFFileURLByAppendingIterationCount(NSURL * _Nonnull __strong, NSString * _Nonnull __strong, BOOL, NSUInteger)");
        [v23 handleFailureInFunction:v24, @"WFTemporaryFileManager.m", 281, @"Invalid parameter not satisfying: %@", @"directory" file lineNumber description];

        if (!v9)
        {
LABEL_11:
          uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
          __int16 v26 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nonnull WFFileURLByAppendingIterationCount(NSURL * _Nonnull __strong, NSString * _Nonnull __strong, BOOL, NSUInteger)");
          [v25 handleFailureInFunction:v26, @"WFTemporaryFileManager.m", 282, @"Invalid parameter not satisfying: %@", @"filename" file lineNumber description];
        }
      }
      __int16 v20 = objc_msgSend(NSString, "stringWithFormat:", @"-%lu", v14);
      id v21 = objc_msgSend(v19, "wf_filenameTruncatedToMaximumLengthWithSuffix:", v20);
      uint64_t v22 = [v18 URLByAppendingPathComponent:v21 isDirectory:v5];

      ++v14;
      id v13 = (void *)v22;
    }
    while (v22);
  }
  id v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:v31 object:v32 file:@"WFTemporaryFileManager.m" lineNumber:331 description:@"fileURL should not be nil"];

  id v13 = 0;
LABEL_13:

  return v13;
}

+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 306, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_10:
    __int16 v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 307, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v12 = [v11 URLByAppendingPathComponent:v9 isDirectory:v5];
  if (v12)
  {
    id v13 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v14 = [v12 path];
    int v15 = [v13 fileExistsAtPath:v14];

    if (v15)
    {
      id v16 = [a1 createUniqueDirectoryInDirectory:v11];
      uint64_t v17 = [v16 URLByAppendingPathComponent:v9 isDirectory:v5];

      uint64_t v12 = (void *)v17;
    }
  }

  return v12;
}

+ (id)createUniqueDirectoryInDirectory:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    int v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 291, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];
  }
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];

  id v8 = [v5 URLByAppendingPathComponent:v7 isDirectory:1];
  id v9 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:&v16];
  id v11 = v16;

  if (v10)
  {
    id v12 = v8;
  }
  else
  {
    id v13 = getWFTemporaryFileManagerLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "+[WFTemporaryFileManager createUniqueDirectoryInDirectory:]";
      __int16 v19 = 2112;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create unique directory (%@): %@", buf, 0x20u);
    }

    id v12 = 0;
  }

  return v12;
}

+ (void)markDirectoryAsPurgeableAtURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (const char *)[a3 fileSystemRepresentation];
  uint64_t v14 = 73733;
  int v4 = open(v3, 0);
  if (v4 < 0)
  {
    id v8 = getWFFilesLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = __error();
      id v13 = strerror(*v12);
      *(_DWORD *)buf = 136315650;
      id v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
      __int16 v17 = 2080;
      id v18 = v3;
      __int16 v19 = 2080;
      __int16 v20 = v13;
      id v11 = "%s Could not get file descriptor to %s with error: %s";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  int v5 = v4;
  int v6 = ffsctl(v4, 0xC0084A44uLL, &v14, 0);
  id v7 = getWFFilesLogObject();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = __error();
      char v10 = strerror(*v9);
      *(_DWORD *)buf = 136315650;
      id v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
      __int16 v17 = 2080;
      id v18 = v3;
      __int16 v19 = 2080;
      __int16 v20 = v10;
      id v11 = "%s Failed to mark %s as purgeable with error: %s";
LABEL_7:
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x20u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
    __int16 v17 = 2080;
    id v18 = v3;
    _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_DEBUG, "%s Marked shared temp directory %s as purgeable", buf, 0x16u);
  }

  close(v5);
}

uint64_t __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke_21(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [(id)temporaryDirectoryURL_URL path];
  [v2 configureFileProtectionAtPath:v3];

  [*(id *)(a1 + 32) configureBackupFlagAtURL:temporaryDirectoryURL_URL];
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = temporaryDirectoryURL_URL;
  return [v4 markDirectoryAsPurgeableAtURL:v5];
}

+ (id)sharedShortcutsAppGroupDirectoryURL
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.is.workflow.shortcuts"];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v8 = 0;
    int v4 = objc_msgSend(a1, "wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:error:", @"group.is.workflow.shortcuts", &v8);
    id v5 = v8;
    if (!v4)
    {
      int v6 = getWFTemporaryFileManagerLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        char v10 = "+[WFTemporaryFileManager sharedShortcutsAppGroupDirectoryURL]";
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_ERROR, "%s sharedShortcutsAppGroupDirectoryURL should not be nil: %{public}@", buf, 0x16u);
      }

      int v4 = 0;
    }
  }

  return v4;
}

+ (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 length])
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFTemporaryFileManager.m", 45, @"Invalid parameter not satisfying: %@", @"groupIdentifier.length" object file lineNumber description];
  }
  id v7 = v6;
  [v7 UTF8String];
  uint64_t v8 = container_create_or_lookup_path_for_current_user();
  if (v8)
  {
    id v9 = (void *)v8;
    char v10 = [NSURL fileURLWithFileSystemRepresentation:v8 isDirectory:1 relativeToURL:0];
    free(v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end