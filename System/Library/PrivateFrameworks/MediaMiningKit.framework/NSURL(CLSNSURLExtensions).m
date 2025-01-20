@interface NSURL(CLSNSURLExtensions)
+ (id)userCachesDirectoryURL:()CLSNSURLExtensions;
@end

@implementation NSURL(CLSNSURLExtensions)

+ (id)userCachesDirectoryURL:()CLSNSURLExtensions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v27 = 0;
  v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v27];
  id v6 = v27;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 bundleIdentifier];

    if ([v12 length])
    {
      v9 = v12;
    }
    else
    {
      v13 = [MEMORY[0x1E4F28F80] processInfo];
      v9 = [v13 processName];
    }
    v14 = [v5 URLByAppendingPathComponent:@"com.apple.mediaminingkit"];
    v15 = [v14 URLByAppendingPathComponent:v9];

    if (a3)
    {
      char v26 = 0;
      v16 = [v15 path];
      char v17 = [v4 fileExistsAtPath:v16 isDirectory:&v26];

      if (v17)
      {
        if (!v26)
        {
          v18 = +[CLSLogging sharedLogging];
          v19 = [v18 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v15;
            _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Caches directory at %@ is not a directory!", buf, 0xCu);
          }
          v7 = 0;
LABEL_17:

          id v10 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        id v25 = 0;
        [v4 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v25];
        id v20 = v25;
        if (v20)
        {
          v7 = v20;
          v21 = +[CLSLogging sharedLogging];
          v19 = [v21 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v24 = [v7 localizedDescription];
            *(_DWORD *)buf = 138412546;
            v29 = v15;
            __int16 v30 = 2112;
            v31 = v24;
            _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Could not create caches directory at %@. \"%@\"", buf, 0x16u);
          }
          goto LABEL_17;
        }
      }
    }
    id v10 = v15;
    v7 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  v8 = +[CLSLogging sharedLogging];
  v9 = [v8 loggingConnection];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v23 = [v7 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v29 = v23;
    _os_log_error_impl(&dword_1D2150000, v9, OS_LOG_TYPE_ERROR, "Could not get caches directory. \"%@\"", buf, 0xCu);
  }
  id v10 = 0;
LABEL_20:

  return v10;
}

@end