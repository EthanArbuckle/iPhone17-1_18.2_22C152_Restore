@interface DELoggingPreferences
+ (id)_subsystemPayloadForURL:(id)a3 error:(id *)a4;
+ (id)combinedLoggingPayloadForURLs:(id)a3 error:(id *)a4;
+ (id)loggingPayloadForURL:(id)a3 error:(id *)a4;
+ (id)managedLoggingProfilesDirectory;
+ (id)managedLoggingProfilesDirectoryForSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
+ (id)removeLoggingProfileForSessionIdentifier:(id)a3 extensionIdentifier:(id)a4 error:(id *)a5;
+ (unint64_t)numberOfManagedLoggingPreferences;
+ (void)installLoggingProfile:(id)a3 sessionIdentifier:(id)a4 extensionIdentifier:(id)a5 error:(id *)a6;
+ (void)managedLoggingProfilesDirectory;
@end

@implementation DELoggingPreferences

+ (void)installLoggingProfile:(id)a3 sessionIdentifier:(id)a4 extensionIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = [a1 managedLoggingProfilesDirectoryForSessionIdentifier:a4 createIfNeeded:1 error:a6];
  v13 = [v12 URLByAppendingPathComponent:v11];

  v14 = [v13 URLByAppendingPathExtension:@"plist"];

  [v10 writeToURL:v14 error:a6];
  if (!*a6)
  {
    OSLogInstallProfilePayload();
    if (*a6)
    {
      v15 = +[DELogging fwHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1A7E51000, v15, OS_LOG_TYPE_INFO, "Failed to install logging preference payload. Deleting [%{public}@]", (uint8_t *)&v17, 0xCu);
      }

      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 removeItemAtURL:v14 error:0];
    }
  }
}

+ (id)removeLoggingProfileForSessionIdentifier:(id)a3 extensionIdentifier:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [a1 managedLoggingProfilesDirectoryForSessionIdentifier:a3 createIfNeeded:0 error:0];
  id v10 = [v9 URLByAppendingPathComponent:v8];

  id v11 = [v10 URLByAppendingPathExtension:@"plist"];

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [v11 path];
  int v14 = [v12 fileExistsAtPath:v13];

  v15 = 0;
  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v11];
    if (v15)
    {
      OSLogRemoveProfilePayload();
      if (!*a5)
      {
        v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v16 removeItemAtURL:v11 error:a5];

        int v17 = +[DEUtils lsDir:v9];
        uint64_t v18 = [v17 count];

        if (!v18)
        {
          uint64_t v19 = +[DELogging fwHandle];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v25 = 138543362;
            v26 = v9;
            _os_log_impl(&dword_1A7E51000, v19, OS_LOG_TYPE_INFO, "Deleting [%{public}@]", (uint8_t *)&v25, 0xCu);
          }

          v20 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v20 removeItemAtURL:v9 error:a5];
        }
      }
      id v21 = v15;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"url";
      v28[0] = v11;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a5 = [v22 errorWithDomain:@"DEExtensionErrorDomain" code:3 userInfo:v23];
    }
  }

  return v15;
}

+ (id)loggingPayloadForURL:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 _subsystemPayloadForURL:a3 error:a4];
  v5 = (void *)v4;
  if (v4)
  {
    id v8 = @"Subsystems";
    v9[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)combinedLoggingPayloadForURLs:(id)a3 error:(id *)a4
{
  int v25 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v30 = 0;
        id v10 = objc_msgSend(a1, "_subsystemPayloadForURL:error:", v9, &v30, v25);
        id v11 = v30;
        if (v10)
        {
          v12 = [v10 allKeys];
          v13 = [v12 firstObject];
          int v14 = [v10 objectForKeyedSubscript:v13];
          v15 = [v10 allKeys];
          v16 = [v15 firstObject];
          [v28 setObject:v14 forKeyedSubscript:v16];
        }
        else
        {
          [v26 addObject:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v6);
  }

  if (v25 && [v26 count])
  {
    int v17 = (void *)MEMORY[0x1E4F28C58];
    v37 = @"errors";
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v26];
    v38 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    *int v25 = [v17 errorWithDomain:@"DEExtensionErrorDomain" code:1 userInfo:v19];
  }
  v20 = objc_msgSend(v28, "allKeys", v25);
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v35 = @"Subsystems";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v28];
    v36 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_subsystemPayloadForURL:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v5];
  if (v6)
  {
    uint64_t v7 = [v5 URLByDeletingPathExtension];
    id v8 = [v7 lastPathComponent];

    if (v8)
    {
      int v14 = v8;
      v15 = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    else
    {
      if (a4)
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        v16 = @"url";
        id v17 = v5;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        *a4 = [v11 errorWithDomain:@"DEExtensionErrorDomain" code:4 userInfo:v12];
      }
      uint64_t v9 = 0;
    }
    goto LABEL_9;
  }
  if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = @"url";
    v19[0] = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v10 errorWithDomain:@"DEExtensionErrorDomain" code:2 userInfo:v8];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

+ (unint64_t)numberOfManagedLoggingPreferences
{
  v3 = (void *)MEMORY[0x1AD0DC7C0](a1, a2);
  id v4 = [a1 managedLoggingProfilesDirectory];
  id v5 = +[DEUtils findAllItems:v4 includeDirs:0];
  unint64_t v6 = [v5 count];

  return v6;
}

+ (id)managedLoggingProfilesDirectory
{
  v2 = +[DEUtils applicationSupportDirectoryForApp:@"com.apple.diagnosticextensions"];
  v3 = [v2 URLByAppendingPathComponent:@"LoggingProfiles"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = +[DELogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[DELoggingPreferences managedLoggingProfilesDirectory](v5);
    }

    unint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v7 = NSHomeDirectory();
    id v4 = [v6 fileURLWithPath:v7 isDirectory:1];
  }
  return v4;
}

+ (id)managedLoggingProfilesDirectoryForSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [a1 managedLoggingProfilesDirectory];
  id v10 = [v9 URLByAppendingPathComponent:v8];

  if (v6)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [v10 path];
    char v13 = [v11 fileExistsAtPath:v12];

    if ((v13 & 1) == 0)
    {
      int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a5];
    }
  }
  return v10;
}

+ (void)managedLoggingProfilesDirectory
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A7E51000, log, OS_LOG_TYPE_FAULT, "could not build Application Support directory url", v1, 2u);
}

@end