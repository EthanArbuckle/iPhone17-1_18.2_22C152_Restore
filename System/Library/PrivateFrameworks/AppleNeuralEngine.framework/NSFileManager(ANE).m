@interface NSFileManager(ANE)
+ (uint64_t)ane_addWriteModeForPath:()ANE;
+ (uint64_t)ane_addWriteModeIfMissing:()ANE originalMode:;
@end

@implementation NSFileManager(ANE)

+ (uint64_t)ane_addWriteModeIfMissing:()ANE originalMode:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if ((a4 & 0x80) == 0
    && (id v8 = v6,
        chmod((const char *)[v8 fileSystemRepresentation], a4 | 0x80) == -1))
  {
    v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = *__error();
      int v14 = 138413058;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 1024;
      int v19 = a4;
      __int16 v20 = 1024;
      int v21 = v13;
      _os_log_error_impl(&dword_1DB8AB000, v11, OS_LOG_TYPE_ERROR, "%@: fail to chmod (%@) with originalMode=0x%x errno=%{darwin:errno}d", (uint8_t *)&v14, 0x22u);
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (uint64_t)ane_addWriteModeForPath:()ANE
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  memset(&v21, 0, sizeof(v21));
  id v7 = v5;
  if (stat((const char *)[v7 fileSystemRepresentation], &v21) == -1)
  {
    uint64_t v9 = +[_ANELog common];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NSFileManager(ANE) ane_addWriteModeForPath:v9];
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v7, v21.st_mode);
  }
  __int16 v20 = v6;
  v10 = [v6 enumeratorAtPath:v7];
  uint64_t v11 = [v10 nextObject];
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = *MEMORY[0x1E4F28330];
    do
    {
      int v14 = (void *)MEMORY[0x1E0193890]();
      v15 = [v7 stringByAppendingPathComponent:v12];
      __int16 v16 = [v10 fileAttributes];
      id v17 = [v16 objectForKeyedSubscript:v13];

      uint64_t v8 = objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v15, objc_msgSend(v17, "unsignedShortValue")) & v8;
      uint64_t v18 = [v10 nextObject];

      v12 = (void *)v18;
    }
    while (v18);
  }

  return v8;
}

+ (void)ane_addWriteModeForPath:()ANE .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl(&dword_1DB8AB000, a3, OS_LOG_TYPE_ERROR, "%@: fail to stat (%@) with errno=%{darwin:errno}d", (uint8_t *)&v7, 0x1Cu);
}

@end