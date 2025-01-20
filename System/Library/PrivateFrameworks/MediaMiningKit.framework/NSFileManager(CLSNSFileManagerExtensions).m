@interface NSFileManager(CLSNSFileManagerExtensions)
+ (id)temporaryFilePathWithExtension:()CLSNSFileManagerExtensions;
- (id)incrementalPathInDirectory:()CLSNSFileManagerExtensions withFilename:andExtension:;
- (uint64_t)createDirectoryIfNecessary:()CLSNSFileManagerExtensions;
@end

@implementation NSFileManager(CLSNSFileManagerExtensions)

- (id)incrementalPathInDirectory:()CLSNSFileManagerExtensions withFilename:andExtension:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 stringByAppendingPathComponent:v9];
  v12 = [v11 stringByAppendingPathExtension:v10];

  if ([a1 fileExistsAtPath:v12])
  {
    uint64_t v13 = 2;
    do
    {
      v14 = [NSString stringWithFormat:@"%@ %lu.%@", v9, v13, v10];
      v15 = [v8 stringByAppendingPathComponent:v14];

      ++v13;
      v12 = v15;
    }
    while (([a1 fileExistsAtPath:v15] & 1) != 0);
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (uint64_t)createDirectoryIfNecessary:()CLSNSFileManagerExtensions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v12 = 0;
  if ([a1 fileExistsAtPath:v4 isDirectory:&v12])
  {
    uint64_t v5 = v12 != 0;
  }
  else
  {
    id v11 = 0;
    uint64_t v5 = [a1 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v6 = v11;
    if ((v5 & 1) == 0)
    {
      v7 = +[CLSLogging sharedLogging];
      id v8 = [v7 loggingConnection];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v6 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "An error occured creating a directory at \"%@\": \"%@\"", buf, 0x16u);
      }
    }
  }
  return v5;
}

+ (id)temporaryFilePathWithExtension:()CLSNSFileManagerExtensions
{
  id v3 = a3;
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = objc_msgSend(NSString, "cls_generateUUID");
  id v6 = [v5 stringByAppendingPathExtension:v3];

  v7 = [v4 stringByAppendingPathComponent:v6];

  return v7;
}

@end