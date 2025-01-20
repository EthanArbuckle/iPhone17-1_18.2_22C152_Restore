@interface NSURL(NSURLSession_Additions)
- (BOOL)_isSafeDirectoryForDownloads:()NSURLSession_Additions withToken:;
- (BOOL)_isSafeFileForBackgroundUploadForMe;
@end

@implementation NSURL(NSURLSession_Additions)

- (BOOL)_isSafeFileForBackgroundUploadForMe
{
  pid_t v2 = getpid();
  int v3 = [a1 isFileURL];
  BOOL result = 0;
  if (v3)
  {
    if ((v2 & 0x80000000) == 0)
    {
      [a1 fileSystemRepresentation];
      return sandbox_check() == 0;
    }
  }
  return result;
}

- (BOOL)_isSafeDirectoryForDownloads:()NSURLSession_Additions withToken:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 isFileURL];
  BOOL v6 = 0;
  if ((a3 & 0x80000000) == 0 && v5)
  {
    [a1 fileSystemRepresentation];
    int v7 = sandbox_check_by_audit_token();
    BOOL v6 = v7 == 0;
    if (v7)
    {
      int v8 = v7;
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v9 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        int v14 = *__error();
        *(_DWORD *)buf = 67109632;
        int v17 = v8;
        __int16 v18 = 1024;
        int v19 = a3;
        __int16 v20 = 1024;
        int v21 = v14;
        _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, "sandbox_check_by_audit_token() returned %d for operation file-read-data for pid %d, errno %d", buf, 0x14u);
      }
    }
    int v10 = sandbox_check_by_audit_token();
    if (v10)
    {
      int v11 = v10;
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v12 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        int v15 = *__error();
        *(_DWORD *)buf = 67109632;
        int v17 = v11;
        __int16 v18 = 1024;
        int v19 = a3;
        __int16 v20 = 1024;
        int v21 = v15;
        _os_log_error_impl(&dword_184085000, v12, OS_LOG_TYPE_ERROR, "sandbox_check_by_audit_token() returned %d for operation file-write-data for pid %d, errno %d", buf, 0x14u);
      }
      return 0;
    }
  }
  return v6;
}

@end