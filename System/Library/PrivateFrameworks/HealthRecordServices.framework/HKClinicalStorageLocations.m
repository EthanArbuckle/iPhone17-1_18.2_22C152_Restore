@interface HKClinicalStorageLocations
+ (BOOL)removeLocalFileAtURL:(id)a3 error:(id *)a4;
+ (BOOL)storeData:(id)a3 inLocalFileAtURL:(id)a4 error:(id *)a5;
+ (id)downloadableAttachmentsDirectory;
+ (id)homeMobileDirectory;
+ (id)mobileLibraryHealthDirectory;
@end

@implementation HKClinicalStorageLocations

+ (id)homeMobileDirectory
{
  v2 = NSURL;
  v3 = HKSharedResourcesDirectory();
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return v4;
}

+ (id)mobileLibraryHealthDirectory
{
  v2 = +[HKClinicalStorageLocations homeMobileDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Library/Health" isDirectory:1];

  return v3;
}

+ (id)downloadableAttachmentsDirectory
{
  v2 = +[HKClinicalStorageLocations mobileLibraryHealthDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"DownloadedAttachments" isDirectory:1];

  return v3;
}

+ (BOOL)storeData:(id)a3 inLocalFileAtURL:(id)a4 error:(id *)a5
{
  v28[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F08850] defaultManager];
  v11 = [v9 URLByDeletingPathExtension];
  v12 = [v11 URLByDeletingLastPathComponent];

  id v26 = 0;
  char v13 = [v10 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v14 = v26;
  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      +[HKClinicalStorageLocations storeData:inLocalFileAtURL:error:]((uint64_t)a1, v23, v12);
    }
    id v24 = v14;
    id v17 = v24;
    if (v24)
    {
      if (a5)
      {
        id v17 = v24;
        char v19 = 0;
        *a5 = v17;
        goto LABEL_13;
      }
      _HKLogDroppedError();
    }
    char v19 = 0;
    goto LABEL_13;
  }
  uint64_t v15 = *MEMORY[0x263F08088];
  uint64_t v16 = *MEMORY[0x263F08078];
  v27[0] = *MEMORY[0x263F080A8];
  v27[1] = v16;
  v28[0] = v15;
  v28[1] = &unk_26D45B5B0;
  id v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v18 = [v9 path];
  char v19 = [v10 createFileAtPath:v18 contents:v8 attributes:v17];

  if ((v19 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      +[HKClinicalStorageLocations storeData:inLocalFileAtURL:error:]((uint64_t)a1, v20, v9);
    }
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = [v9 path];
    objc_msgSend(v21, "hk_assignError:code:format:", a5, 102, @"Error creating file at %@", v22);
  }
LABEL_13:

  return v19;
}

+ (BOOL)removeLocalFileAtURL:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  id v13 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v13];

  id v9 = v13;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    id v11 = v9;
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v8;
}

+ (void)storeData:(uint64_t)a1 inLocalFileAtURL:(void *)a2 error:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 path];
  id v6 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_221D38000, v7, v8, "%{public}@: Failed to create file %{public}@.", v9, v10, v11, v12, v13);
}

+ (void)storeData:(uint64_t)a1 inLocalFileAtURL:(void *)a2 error:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 path];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_221D38000, v6, v7, "%{public}@: Failed to create directory %{public}@.", v8, v9, v10, v11, v12);
}

@end