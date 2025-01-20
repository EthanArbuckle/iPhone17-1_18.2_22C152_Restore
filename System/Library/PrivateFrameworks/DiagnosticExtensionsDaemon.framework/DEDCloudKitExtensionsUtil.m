@interface DEDCloudKitExtensionsUtil
+ (id)copyFiles:(id)a3 toDirectory:(id)a4;
+ (id)getAllFilesInSessionDirectoryForSessionID:(id)a3;
+ (id)getCompletedExtensionFromAllExtensions:(id)a3;
+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4;
+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4 progressHandler:(id)a5;
+ (id)getVerifiedExtensionDirectoriesFromCompletedExtensions:(id)a3 forSession:(id)a4;
+ (void)updateELSSnapshotStatus:(unint64_t)a3;
@end

@implementation DEDCloudKitExtensionsUtil

+ (id)getCompletedExtensionFromAllExtensions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "stringValue", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)getVerifiedExtensionDirectoriesFromCompletedExtensions:(id)a3 forSession:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  v21 = v6;
  uint64_t v8 = [v6 identifier];
  uint64_t v9 = [v7 directoryForBugSessionIdentifier:v8];

  v20 = (void *)v9;
  v10 = [MEMORY[0x263F3A0A0] lsDir:v9];
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    uint64_t v15 = *MEMORY[0x263F3B708];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v18 = [v17 lastPathComponent];
        if ([v5 containsObject:v18]
          && ([MEMORY[0x263F3A0A0] isValidDirectory:v17] & 1) != 0)
        {
          [v22 setValue:v17 forKey:v18];
        }
        else
        {
          [MEMORY[0x263F3B740] createLoggingEventWith:v15 postfix:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  return v22;
}

+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4
{
  return (id)[a1 getOutputDirectories:a3 withProcessingMap:a4 progressHandler:0];
}

+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4 progressHandler:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v29 = a4;
  id v26 = a5;
  uint64_t v7 = +[DEDConfiguration sharedInstance];
  os_log_t v24 = os_log_create((const char *)[v7 loggingSubsystem], "ded-cloudkit-finisher");

  long long v25 = [MEMORY[0x263EFF9A0] dictionary];
  if (v26)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v27;
    uint64_t v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v24, v25);
    if (v30)
    {
      uint64_t v8 = 0;
      uint64_t v28 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          v33 = [obj objectForKey:v10];
          v32 = [v29 objectForKey:v10];
          id v11 = [v32 objectForKey:@"package"];
          if ([v11 isEqualToString:@"parent-directory"])
          {
            if ([MEMORY[0x263F3A0A0] isValidDirectory:v33]) {
              v8 += [MEMORY[0x263F3A070] directorySizeOf:v33];
            }
          }
          else
          {
            uint64_t v12 = [MEMORY[0x263F3A0A0] lsDir:v33];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v43;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v43 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * j);
                  if ([MEMORY[0x263F3A0A0] isValidDirectory:v16]) {
                    v8 += [MEMORY[0x263F3A070] directorySizeOf:v16];
                  }
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }
              while (v13);
            }
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v30);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke;
  v34[3] = &unk_26453BFA8;
  id v17 = v29;
  id v35 = v17;
  v18 = v24;
  v36 = v18;
  id v19 = v26;
  id v38 = v19;
  v39 = v41;
  uint64_t v40 = v8;
  id v20 = v25;
  id v37 = v20;
  [v27 enumerateKeysAndObjectsUsingBlock:v34];
  v21 = v37;
  id v22 = v20;

  _Block_object_dispose(v41, 8);
  return v22;
}

void __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v55[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v35 = a3;
  id v37 = v5;
  v31 = [*(id *)(a1 + 32) objectForKey:v5];
  uint64_t v30 = [v31 objectForKey:@"package"];
  uint64_t v40 = [v31 objectForKey:@"compression"];
  id v38 = [MEMORY[0x263EFF980] array];
  int v39 = [v30 isEqualToString:@"flat-directories"];
  if (v39)
  {
    id v6 = [MEMORY[0x263F3A0A0] lsDir:v35];
  }
  else
  {
    v55[0] = v35;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v47;
    uint64_t v34 = *MEMORY[0x263F3B700];
    uint64_t v33 = *MEMORY[0x263F3B6F8];
    uint64_t v32 = *MEMORY[0x263F3B6F0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v11 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v10;
          _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Processing file/directory (%{public}@)", buf, 0xCu);
        }
        if (v39 && ([MEMORY[0x263F3A0A0] isValidDirectory:v10] & 1) == 0)
        {
          id v20 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_21FE04000, v20, OS_LOG_TYPE_DEFAULT, "Skipping file compression when flatterned directory requested (%{public}@) (%@)", buf, 0x16u);
          }
          goto LABEL_21;
        }
        if (v40 && ([v40 BOOLValue] & 1) == 0)
        {
          v21 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_21FE04000, v21, OS_LOG_TYPE_DEFAULT, "Skipping file/directory compression when not requested (%{public}@) (%@)", buf, 0x16u);
          }
LABEL_21:
          [v38 addObject:v10];
          continue;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v53 = 0;
        uint64_t v12 = [v35 lastPathComponent];
        uint64_t v13 = [NSString stringWithFormat:@"%@,%@", v37, v12];
        [MEMORY[0x263F3B740] createLoggingEventWith:v34 postfix:v37];
        uint64_t v14 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v50 = 138543362;
          uint64_t v51 = v10;
          _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "Compressing folder... (%{public}@)", v50, 0xCu);
        }
        uint64_t v15 = *(void **)(a1 + 56);
        if (v15)
        {
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke_34;
          v41[3] = &unk_26453BF80;
          long long v43 = buf;
          id v16 = v15;
          uint64_t v17 = *(void *)(a1 + 64);
          uint64_t v18 = *(void *)(a1 + 72);
          id v42 = v16;
          uint64_t v44 = v17;
          uint64_t v45 = v18;
          id v19 = (void *)MEMORY[0x223C5FFB0](v41);
        }
        else
        {
          id v19 = 0;
        }
        if ([MEMORY[0x263F3A0A0] isValidDirectory:v10]) {
          [MEMORY[0x263F3A070] archiveDirectoryAt:v10 deleteOriginal:1 progressHandler:v19];
        }
        else {
        id v22 = [MEMORY[0x263F3A070] archiveFile:v10 deleteOriginal:1 progressHandler:v19];
        }
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(*(void *)&buf[8] + 24);
        long long v23 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_21FE04000, v23, OS_LOG_TYPE_DEFAULT, "Finished compressing", v50, 2u);
        }
        if (v22)
        {
          [v38 addObject:v22];
          [MEMORY[0x263F3B740] createLoggingEventWith:v33 postfix:v13];
        }
        else
        {
          [MEMORY[0x263F3B740] createLoggingEventWith:v32 postfix:v13];
          os_log_t v24 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v50 = 138543362;
            uint64_t v51 = v10;
            _os_log_error_impl(&dword_21FE04000, v24, OS_LOG_TYPE_ERROR, "Error compressing: %{public}@", v50, 0xCu);
          }
        }

        _Block_object_dispose(buf, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  uint64_t v25 = [v38 count];
  id v26 = *(NSObject **)(a1 + 40);
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      uint64_t v28 = v26;
      uint64_t v29 = [v38 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      _os_log_impl(&dword_21FE04000, v28, OS_LOG_TYPE_DEFAULT, "Adding (%lu) files to %@ for upload", buf, 0x16u);
    }
    [*(id *)(a1 + 48) setValue:v38 forKey:v37];
  }
  else if (v27)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v37;
    _os_log_impl(&dword_21FE04000, v26, OS_LOG_TYPE_DEFAULT, "No files to %@ for upload", buf, 0xCu);
  }
}

uint64_t __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke_34(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24) + *(void *)(*(void *)(a1[6] + 8) + 24), a1[7]);
}

+ (void)updateELSSnapshotStatus:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F3B748] sharedManager];
  id v6 = [v4 snapshot];

  [v6 setStatus:a3];
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F3B6C0], 0);
  [v6 refreshKeyPaths:v5];
}

+ (id)getAllFilesInSessionDirectoryForSessionID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_opt_new();
  id v6 = [v5 directoryForBugSessionIdentifier:v3];

  uint64_t v7 = [MEMORY[0x263F3A0A0] lsDir:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([MEMORY[0x263F3A0A0] isValidDirectory:v12] & 1) == 0) {
          [v4 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v4;
}

+ (id)copyFiles:(id)a3 toDirectory:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        [MEMORY[0x263F3A0A0] copyFile:*(void *)(*((void *)&v12 + 1) + 8 * v10++) toDir:v6];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v6;
}

@end