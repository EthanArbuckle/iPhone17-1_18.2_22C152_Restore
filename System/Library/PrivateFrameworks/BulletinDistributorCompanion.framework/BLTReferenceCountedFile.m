@interface BLTReferenceCountedFile
+ (BOOL)release:(id)a3;
+ (BOOL)retain:(id)a3;
+ (BOOL)retain:(id)a3 fileData:(id)a4;
+ (BOOL)writeRetainCount:(int64_t)a3 oldMetadata:(id)a4 to:(id)a5;
+ (id)metadataForFile:(id)a3;
@end

@implementation BLTReferenceCountedFile

+ (BOOL)retain:(id)a3 fileData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&__read_write_lock);
  v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = [v6 relativePath];
  int v10 = [v8 fileExistsAtPath:v9];

  if (!v10)
  {
    if ([v7 writeToURL:v6 atomically:1])
    {
      v12 = objc_msgSend(v6, "blt_metadataURL");
      char v13 = [a1 writeRetainCount:1 oldMetadata:MEMORY[0x263EFFA78] to:v12];

      if (v13)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
        char v11 = 1;
        goto LABEL_15;
      }
      v15 = [MEMORY[0x263F08850] defaultManager];
      id v20 = 0;
      char v16 = [v15 removeItemAtURL:v6 error:&v20];
      id v17 = v20;

      if ((v16 & 1) == 0)
      {
        v18 = blt_general_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          +[BLTReferenceCountedFile retain:fileData:]();
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
    }
    else
    {
      v14 = blt_general_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[BLTReferenceCountedFile retain:fileData:]();
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
    }
    char v11 = 0;
    goto LABEL_15;
  }
  char v11 = [a1 retain:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
LABEL_15:

  return v11;
}

+ (BOOL)retain:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  v5 = [a1 metadataForFile:v4];
  id v6 = v5;
  if (!v5)
  {
    v8 = blt_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BLTReferenceCountedFile retain:]();
    }
    goto LABEL_9;
  }
  id v7 = [v5 objectForKeyedSubscript:@"refCount"];
  v8 = v7;
  if (!v7)
  {
    v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[BLTReferenceCountedFile retain:]();
    }

LABEL_9:
    char v11 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = (int)([v7 intValue] + 1);
  int v10 = objc_msgSend(v4, "blt_metadataURL");
  char v11 = [a1 writeRetainCount:v9 oldMetadata:v6 to:v10];

LABEL_10:
  return v11;
}

+ (id)metadataForFile:(id)a3
{
  id v3 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  id v4 = objc_msgSend(v3, "blt_metadataURL");

  v5 = [NSDictionary dictionaryWithContentsOfURL:v4];
  if (!v5)
  {
    id v6 = blt_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[BLTReferenceCountedFile retain:]();
    }
  }
  return v5;
}

+ (BOOL)writeRetainCount:(int64_t)a3 oldMetadata:(id)a4 to:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  uint64_t v9 = (void *)[v8 mutableCopy];

  int v10 = [NSNumber numberWithInteger:a3];
  [v9 setObject:v10 forKeyedSubscript:@"refCount"];

  char v11 = [v9 writeToURL:v7 atomically:1];
  if ((v11 & 1) == 0)
  {
    v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[BLTReferenceCountedFile writeRetainCount:oldMetadata:to:]();
    }
  }
  return v11;
}

+ (BOOL)release:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__read_write_lock);
  v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v4 relativePath];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [a1 metadataForFile:v4];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"refCount"];
    int v10 = v9;
    if (v8 && v9)
    {
      int v11 = [v9 intValue];
      if (v11 < 2)
      {
        v18 = [MEMORY[0x263F08850] defaultManager];
        id v28 = 0;
        char v15 = [v18 removeItemAtURL:v4 error:&v28];
        id v19 = v28;

        if ((v15 & 1) == 0)
        {
          id v20 = blt_general_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[BLTReferenceCountedFile release:]();
          }
        }
        v21 = [MEMORY[0x263F08850] defaultManager];
        v22 = objc_msgSend(v4, "blt_metadataURL");
        id v27 = v19;
        char v23 = [v21 removeItemAtURL:v22 error:&v27];
        id v24 = v27;

        if ((v23 & 1) == 0)
        {
          v25 = blt_general_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            +[BLTReferenceCountedFile release:]();
          }

          char v15 = 0;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);

        goto LABEL_24;
      }
      uint64_t v12 = (v11 - 1);
      char v13 = objc_msgSend(v4, "blt_metadataURL");
      char v14 = [a1 writeRetainCount:v12 oldMetadata:v8 to:v13];

      if (v14)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
        char v15 = 1;
LABEL_24:

        goto LABEL_25;
      }
      id v17 = blt_general_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[BLTReferenceCountedFile release:]();
      }
    }
    else
    {
      id v17 = blt_general_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[BLTReferenceCountedFile release:].cold.4();
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
    char v15 = 0;
    goto LABEL_24;
  }
  char v16 = blt_general_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[BLTReferenceCountedFile release:].cold.5();
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
  char v15 = 0;
LABEL_25:

  return v15;
}

+ (void)retain:fileData:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Succeeded saving data to: %@ but failed to write metadata and then failed to remove file - things are going badly", v2, v3, v4, v5, v6);
}

+ (void)retain:fileData:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Error saving data to: %@", v2, v3, v4, v5, v6);
}

+ (void)retain:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Error reading file data from: %@", v2, v3, v4, v5, v6);
}

+ (void)retain:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Error reading refCount from: %@", v2, v3, v4, v5, v6);
}

+ (void)writeRetainCount:oldMetadata:to:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Failed to write url: %@ fileInfo: %@");
}

+ (void)release:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Failed to write updated retain count: %@ - this is bad", v2, v3, v4, v5, v6);
}

+ (void)release:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: Unable to remove file: %@ error: %@");
}

+ (void)release:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: No metadata for file at url: %@ - this is bad", v2, v3, v4, v5, v6);
}

+ (void)release:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTReferenceCountedFile: No file at url: %@", v2, v3, v4, v5, v6);
}

@end