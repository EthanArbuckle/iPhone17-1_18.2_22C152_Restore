@interface NSData(DeviceManagement)
- (uint64_t)dm_atomicWriteToURL:()DeviceManagement error:;
@end

@implementation NSData(DeviceManagement)

- (uint64_t)dm_atomicWriteToURL:()DeviceManagement error:
{
  id v6 = a3;
  unsigned __int8 v39 = 0;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v39];
  int v10 = v39;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = [v6 URLByDeletingLastPathComponent];
    v13 = NSString;
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v16 = [v15 substringToIndex:8];
    v17 = [v6 lastPathComponent];
    v18 = [v13 stringWithFormat:@".temp-%@-%@", v16, v17];

    v19 = [v12 URLByAppendingPathComponent:v18];
    id v38 = 0;
    char v20 = [a1 writeToURL:v19 options:0 error:&v38];
    id v21 = v38;
    if (v20)
    {
      v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v37 = v21;
      char v23 = [v22 replaceItemAtURL:v6 withItemAtURL:v19 backupItemName:0 options:1 resultingItemURL:0 error:&v37];
      id v24 = v37;

      v25 = DMFAtomicFileWritingLog();
      v26 = v25;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[NSData(DeviceManagement) dm_atomicWriteToURL:error:]();
        }

        uint64_t v27 = 1;
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.4();
        }

        id v31 = v24;
        *a4 = v31;
        v32 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v36 = v31;
        char v33 = [v32 removeItemAtURL:v19 error:&v36];
        id v24 = v36;

        if ((v33 & 1) == 0)
        {
          v34 = DMFAtomicFileWritingLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[NSData(DeviceManagement) dm_atomicWriteToURL:error:]();
          }
        }
        uint64_t v27 = 0;
      }
    }
    else
    {
      v30 = DMFAtomicFileWritingLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.5();
      }

      id v24 = v21;
      uint64_t v27 = 0;
      *a4 = v24;
    }
  }
  else
  {
    v28 = DMFAtomicFileWritingLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[NSData(DeviceManagement) dm_atomicWriteToURL:error:]();
    }

    DMFErrorWithCodeAndUserInfo(6, 0);
    uint64_t v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to write temporary file since a directory is present: %{public}@", v2, v3, v4, v5, v6);
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BE0E2000, v0, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", v1, 0xCu);
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to remove temporary file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to replace original file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BE0E2000, v0, v1, "Failed to write temporary file: %{public}@", v2, v3, v4, v5, v6);
}

@end