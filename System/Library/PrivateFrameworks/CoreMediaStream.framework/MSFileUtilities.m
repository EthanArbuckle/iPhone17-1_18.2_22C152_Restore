@interface MSFileUtilities
+ (BOOL)hardlinkOrCopyFileFromPath:(id)a3 toPath:(id)a4 outError:(id *)a5;
@end

@implementation MSFileUtilities

+ (BOOL)hardlinkOrCopyFileFromPath:(id)a3 toPath:(id)a4 outError:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = (const char *)[v10 fileSystemRepresentation];
  id v12 = v9;
  int v13 = link(v11, (const char *)[v12 fileSystemRepresentation]);
  if (v13 != 18)
  {
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138543874;
        id v25 = a1;
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Hardlinked path %@ to %@.", (uint8_t *)&v24, 0x20u);
      }
      char v14 = 1;
      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28798];
    uint64_t v18 = v13;
    v19 = NSString;
    v20 = __error();
    v21 = [v19 stringWithUTF8String:strerror(*v20)];
    v22 = [v16 MSErrorWithDomain:v17 code:v18 description:v21];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v24 = 138544130;
      id v25 = a1;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2114;
      v31 = v22;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not hardlink path %@ to %@. Error: %{public}@", (uint8_t *)&v24, 0x2Au);
      if (!a5) {
        goto LABEL_12;
      }
    }
    else if (!a5)
    {
LABEL_12:

      char v14 = 0;
      goto LABEL_13;
    }
    *a5 = v22;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138543874;
    id v25 = a1;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Copying path %@ to %@.", (uint8_t *)&v24, 0x20u);
  }
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v15 copyItemAtPath:v10 toPath:v12 error:a5];

LABEL_13:
  return v14;
}

@end