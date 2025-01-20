@interface NSFileManager(_QLTUtilities)
+ (void)_QLTRemoveTemporaryDirectoryAtURL:()_QLTUtilities;
@end

@implementation NSFileManager(_QLTUtilities)

+ (void)_QLTRemoveTemporaryDirectoryAtURL:()_QLTUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = 0;
    char v9 = [v8 removeItemAtURL:v4 error:&v14];
    id v10 = v14;

    v11 = _log();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[NSFileManager(_QLTUtilities) _QLTRemoveTemporaryDirectoryAtURL:v12];
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl(&dword_1B281E000, v12, OS_LOG_TYPE_ERROR, "%@ Could not remove temporary directory at url %@. %@", buf, 0x20u);
    }
  }
}

+ (void)_QLTRemoveTemporaryDirectoryAtURL:()_QLTUtilities .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1B281E000, a3, OS_LOG_TYPE_DEBUG, "%@ Removed temporary directory at url %@.", (uint8_t *)&v6, 0x16u);
}

@end