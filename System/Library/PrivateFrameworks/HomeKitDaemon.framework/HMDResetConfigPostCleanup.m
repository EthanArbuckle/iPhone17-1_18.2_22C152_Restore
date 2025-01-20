@interface HMDResetConfigPostCleanup
+ (id)_readExistingPostCleanupRecord;
+ (id)filesToExcludeFromCacheDirectory;
+ (id)filesToExcludeFromHomedDirectory;
+ (id)logCategory;
+ (id)resetConfigPostCleanupFileLocation;
+ (id)sqlFileListToRemove:(id)a3 fromRootDirectory:(id)a4;
+ (void)cleanupInvalidUserDefaults:(id)a3;
+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5;
+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5 usingFileManager:(id)a6;
+ (void)performAnyPostCleanupStepsIfNecessary;
+ (void)performIndividualCleanupTasks:(unint64_t)a3 onRootDirectory:(id)a4;
+ (void)performResetConfigPostCleanupSteps:(unint64_t)a3 dueToReason:(unint64_t)a4;
+ (void)removeFilesAtLocation:(id)a3;
+ (void)removeFilesAtLocation:(id)a3 usingFileManager:(id)a4;
+ (void)writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:(unint64_t)a3;
+ (void)writePostCleanupRecordWithReason:(unint64_t)a3 steps:(unint64_t)a4;
@end

@implementation HMDResetConfigPostCleanup

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_257726 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_257726, &__block_literal_global_257727);
  }
  v2 = (void *)logCategory__hmf_once_v26_257728;
  return v2;
}

void __40__HMDResetConfigPostCleanup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26_257728;
  logCategory__hmf_once_v26_257728 = v0;
}

+ (id)resetConfigPostCleanupFileLocation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = HMDCreateHomeKitDaemonCacheDirectory();
  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
    v5 = [v4 URLByAppendingPathComponent:@"resetConfigPostCleanup.plist"];
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to create homekit daemon cache directory", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

+ (void)writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:(unint64_t)a3
{
}

+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5 usingFileManager:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = a1;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v16;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the files inside directory: %@", buf, 0x16u);
  }
  v17 = [NSURL fileURLWithPath:v10];
  uint64_t v18 = *MEMORY[0x263EFF6A8];
  v27[0] = *MEMORY[0x263EFF750];
  v27[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __110__HMDResetConfigPostCleanup_deleteFilesInsideDirectory_excludingFiles_shouldSkipDirectories_usingFileManager___block_invoke;
  v22[3] = &unk_264A2DC38;
  id v24 = v12;
  id v25 = v14;
  BOOL v26 = a5;
  id v23 = v11;
  id v20 = v12;
  id v21 = v11;
  [v20 enumerateItemsAtURL:v17 includingPropertiesForKeys:v19 usingBlock:v22];
}

void __110__HMDResetConfigPostCleanup_deleteFilesInsideDirectory_excludingFiles_shouldSkipDirectories_usingFileManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5
    && ([v3 lastPathComponent],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 containsObject:v6],
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 48);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting excluded file: %@", buf, 0x16u);
    }
  }
  else
  {
    id v18 = 0;
    [v4 getResourceValue:&v18 forKey:*MEMORY[0x263EFF6A8] error:0];
    id v12 = v18;
    if ([v12 BOOLValue] && *(unsigned char *)(a1 + 56))
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 48);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping the directory : %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      v17 = *(void **)(a1 + 48);
      v19 = v4;
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      [v17 removeFilesAtLocation:v14 usingFileManager:*(void *)(a1 + 40)];
    }
  }
}

+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(HMDFileManager);
  [a1 deleteFilesInsideDirectory:v9 excludingFiles:v8 shouldSkipDirectories:v5 usingFileManager:v10];
}

+ (void)removeFilesAtLocation:(id)a3 usingFileManager:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HMDResetConfigPostCleanup_removeFilesAtLocation_usingFileManager___block_invoke;
  v8[3] = &unk_264A2DC10;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __68__HMDResetConfigPostCleanup_removeFilesAtLocation_usingFileManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  BOOL v5 = [(__CFString *)v3 path];
  LOBYTE(v4) = [v4 isDeletableFileAtPath:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    id v18 = 0;
    int v7 = [v6 removeItemAtURL:v3 error:&v18];
    id v8 = v18;
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = @"Unsuccessfully";
      *(_DWORD *)buf = 138544130;
      id v20 = v12;
      __int16 v21 = 2112;
      if (v7) {
        uint64_t v13 = @"Successfully";
      }
      __int16 v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v3;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ removed file [%@] with error: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = v3;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@File is not deletable by homed: %@", buf, 0x16u);
    }
  }
}

+ (void)removeFilesAtLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(HMDFileManager);
  [a1 removeFilesAtLocation:v4 usingFileManager:v5];
}

+ (void)cleanupInvalidUserDefaults:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dictionaryRepresentation];
  BOOL v5 = [v4 allKeys];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDResetConfigPostCleanup_cleanupInvalidUserDefaults___block_invoke;
  v7[3] = &unk_264A2DBE8;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v5, "na_each:", v7);
}

void __56__HMDResetConfigPostCleanup_cleanupInvalidUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:@"HMDHomeWalletKeyManagerHomeNeedsWalletKeyRoll_"]) {
    [*(id *)(a1 + 32) removeObjectForKey:v3];
  }
}

+ (id)sqlFileListToRemove:(id)a3 fromRootDirectory:(id)a4
{
  BOOL v5 = NSURL;
  id v6 = a3;
  int v7 = [v5 fileURLWithPath:a4];
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [NSString stringWithFormat:@"%@", v6];
  id v10 = [v7 URLByAppendingPathComponent:v9];
  [v8 addObject:v10];

  id v11 = [NSString stringWithFormat:@"%@-shm", v6];
  id v12 = [v7 URLByAppendingPathComponent:v11];
  [v8 addObject:v12];

  uint64_t v13 = [NSString stringWithFormat:@"%@-wal", v6];

  id v14 = [v7 URLByAppendingPathComponent:v13];
  [v8 addObject:v14];

  id v15 = (void *)[v8 copy];
  return v15;
}

+ (id)filesToExcludeFromHomedDirectory
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26E474530];
}

+ (id)filesToExcludeFromCacheDirectory
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26E474518];
}

+ (void)performIndividualCleanupTasks:(unint64_t)a3 onRootDirectory:(id)a4
{
  __int16 v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [MEMORY[0x263EFF9C0] set];
  if ((v4 & 2) != 0)
  {
    id v15 = +[HMDCoreData storeNameForConfiguration:@"core.sqlite"];
    v16 = [a1 sqlFileListToRemove:v15 fromRootDirectory:v6];
    [v7 addObjectsFromArray:v16];

    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  v17 = +[HMDCoreData storeNameForConfiguration:@"core-cloudkit.sqlite"];
  id v18 = [a1 sqlFileListToRemove:v17 fromRootDirectory:v6];
  [v7 addObjectsFromArray:v18];

  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v19 = +[HMDCoreData storeNameForConfiguration:@"core-local.sqlite"];
  id v20 = [a1 sqlFileListToRemove:v19 fromRootDirectory:v6];
  [v7 addObjectsFromArray:v20];

  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  __int16 v21 = +[HMDCoreData storeNameForConfiguration:@"core-cloudkit-shared.sqlite"];
  __int16 v22 = [a1 sqlFileListToRemove:v21 fromRootDirectory:v6];
  [v7 addObjectsFromArray:v22];

  if ((v4 & 0x100) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  __int16 v23 = [a1 sqlFileListToRemove:@"core-client.sqlite" fromRootDirectory:v6];
  [v7 addObjectsFromArray:v23];

  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  uint64_t v24 = [a1 sqlFileListToRemove:@"datastore.sqlite" fromRootDirectory:v6];
  [v7 addObjectsFromArray:v24];

  if ((v4 & 0x40) != 0)
  {
LABEL_8:
    id v8 = [a1 sqlFileListToRemove:@"datastore.sqlite" fromRootDirectory:v6];
    [v7 addObjectsFromArray:v8];

    id v9 = [a1 sqlFileListToRemove:@"datastore3.sqlite" fromRootDirectory:v6];
    [v7 addObjectsFromArray:v9];
  }
LABEL_9:
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v25 = 138543618;
    id v26 = v13;
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to remove following files : %@", (uint8_t *)&v25, 0x16u);
  }
  id v14 = (void *)[v7 copy];
  [v11 removeFilesAtLocation:v14];
}

+ (void)performResetConfigPostCleanupSteps:(unint64_t)a3 dueToReason:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v7 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v8 = a1;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (a3 != 1 && a4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = HMDResetConfigPostCleanupStepsToString(a3);
      uint64_t v13 = (void *)v12;
      if (a4 - 1 > 8) {
        id v14 = @"Unknown";
      }
      else {
        id v14 = off_264A2DC58[a4 - 1];
      }
      int v28 = 138543874;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to perform reset config post cleanup steps: %@ due to reason: %@", (uint8_t *)&v28, 0x20u);
    }
    id v18 = determineHomeKitDaemonRootStorePath();
    if (a3 == 128)
    {
      __int16 v23 = (void *)MEMORY[0x263EFFA08];
      uint64_t v24 = HMDHomeKitDaemonDemoModePersistencePath();
      int v25 = [v24 lastPathComponent];
      __int16 v22 = [v23 setWithObject:v25];

      [v8 deleteFilesInsideDirectory:v18 excludingFiles:0 shouldSkipDirectories:0];
      id v26 = HMHomeKitCacheDirectory();
      [v8 deleteFilesInsideDirectory:v26 excludingFiles:0 shouldSkipDirectories:1];

      __int16 v27 = HMCacheSubdirectoryWithRelativePath();
      [v8 deleteFilesInsideDirectory:v27 excludingFiles:v22 shouldSkipDirectories:1];
    }
    else
    {
      if (a3 != -1)
      {
        [v8 performIndividualCleanupTasks:a3 onRootDirectory:v18];
        goto LABEL_20;
      }
      v19 = [v8 filesToExcludeFromHomedDirectory];
      [v8 deleteFilesInsideDirectory:v18 excludingFiles:v19 shouldSkipDirectories:1];

      id v20 = HMHomeKitCacheDirectory();
      __int16 v21 = [v8 filesToExcludeFromCacheDirectory];
      [v8 deleteFilesInsideDirectory:v20 excludingFiles:v21 shouldSkipDirectories:1];

      __int16 v22 = HMCacheSubdirectoryWithRelativePath();
      [v8 deleteFilesInsideDirectory:v22 excludingFiles:0 shouldSkipDirectories:0];
    }

LABEL_20:
    return;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v15 = HMFGetLogIdentifier();
    if (a4 - 1 > 8) {
      v16 = @"Unknown";
    }
    else {
      v16 = off_264A2DC58[a4 - 1];
    }
    HMDResetConfigPostCleanupStepsToString(a3);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v28 = 138543874;
    uint64_t v29 = v15;
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v16;
    __int16 v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Clean up reason or steps are not known. [reason: %@] [steps: %@]", (uint8_t *)&v28, 0x20u);
  }
}

+ (void)performAnyPostCleanupStepsIfNecessary
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [a1 cleanupInvalidUserDefaults:v3];

  __int16 v4 = [a1 resetConfigPostCleanupFileLocation];
  if (v4)
  {
    BOOL v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      id v8 = [a1 _readExistingPostCleanupRecord];
      id v9 = [v8 objectForKeyedSubscript:@"RST.POST.CleanUP.reason"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      uint64_t v12 = [v8 objectForKeyedSubscript:@"RST.PST.CleanUP.steps"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      id v14 = v13;

      if (v11 && v14)
      {
        objc_msgSend(a1, "performResetConfigPostCleanupSteps:dueToReason:", objc_msgSend(v14, "unsignedLongValue"), objc_msgSend(v11, "unsignedIntValue"));
        id v20 = v4;
        id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        [a1 removeFilesAtLocation:v15];

        if (isFirstLaunchAfterBoot_onceToken != -1) {
          dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_917);
        }
      }
      else
      {
        v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = a1;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          __int16 v22 = v19;
          __int16 v23 = 2112;
          id v24 = v11;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to cast NSNumber from dictionary value : %@, %@", buf, 0x20u);
        }
      }
    }
  }
}

+ (void)writePostCleanupRecordWithReason:(unint64_t)a3 steps:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (a3 && a4 != 1)
  {
    int v7 = [a1 _readExistingPostCleanupRecord];
    id v8 = (__CFString *)[v7 mutableCopy];

    id v9 = [(__CFString *)v8 objectForKeyedSubscript:@"RST.PST.CleanUP.steps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = a1;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        int v44 = 138543618;
        v45 = v15;
        __int16 v46 = 2112;
        v47 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Found existing reason : %@", (uint8_t *)&v44, 0x16u);
      }
    }
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[__CFString unsignedLongValue](v11, "unsignedLongValue") | a4);
    [(__CFString *)v8 setObject:v16 forKeyedSubscript:@"RST.PST.CleanUP.steps"];

    id v17 = [NSNumber numberWithUnsignedInteger:a3];
    [(__CFString *)v8 setObject:v17 forKeyedSubscript:@"RST.POST.CleanUP.reason"];

    id v18 = [a1 resetConfigPostCleanupFileLocation];
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    __int16 v21 = HMFGetOSLogHandle();
    __int16 v22 = v21;
    if (!v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        int v44 = 138543362;
        v45 = v41;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to write reset config cleanup record", (uint8_t *)&v44, 0xCu);
      }
      goto LABEL_32;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v44 = 138543874;
      v45 = v23;
      __int16 v46 = 2112;
      v47 = v8;
      __int16 v48 = 2112;
      v49 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to write reset config cleanup record : [%@] -> [%@]", (uint8_t *)&v44, 0x20u);
    }
    encodeRootObject();
    id v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      __int16 v25 = [(__CFString *)v18 path];
      char v26 = [(__CFString *)v24 writeToFile:v25 atomically:1];

      uint64_t v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v20;
      uint64_t v29 = HMFGetOSLogHandle();
      __int16 v30 = v29;
      if (v26)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          int v44 = 138544130;
          v45 = v31;
          __int16 v46 = 2112;
          v47 = v8;
          __int16 v48 = 2112;
          v49 = v24;
          __int16 v50 = 2112;
          v51 = v18;
          __int16 v32 = "%{public}@Successfully written reset config post cleanup record on disk : %@, %@, %@";
          v33 = v30;
          os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
          uint32_t v35 = 42;
LABEL_30:
          _os_log_impl(&dword_22F52A000, v33, v34, v32, (uint8_t *)&v44, v35);
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        int v44 = 138543874;
        v45 = v31;
        __int16 v46 = 2112;
        v47 = v24;
        __int16 v48 = 2112;
        v49 = v18;
        __int16 v32 = "%{public}@Unable to write reset config post cleanup record [%@] to location : %@";
        v33 = v30;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 32;
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v27 = (void *)MEMORY[0x230FBD990]();
      id v43 = v20;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        int v44 = 138543618;
        v45 = v31;
        __int16 v46 = 2112;
        v47 = v18;
        __int16 v32 = "%{public}@Unable to write reset config cleanup record at location : %@";
        v33 = v30;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 22;
        goto LABEL_30;
      }
    }

LABEL_32:

    return;
  }
  v36 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v37 = a1;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    v39 = HMFGetLogIdentifier();
    if (a3 - 1 > 8) {
      v40 = @"Unknown";
    }
    else {
      v40 = off_264A2DC58[a3 - 1];
    }
    HMDResetConfigPostCleanupStepsToString(a4);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v44 = 138543874;
    v45 = v39;
    __int16 v46 = 2112;
    v47 = v40;
    __int16 v48 = 2112;
    v49 = v42;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Clean up reason or steps are needed. [reason: %@] [steps: %@]", (uint8_t *)&v44, 0x20u);
  }
}

+ (id)_readExistingPostCleanupRecord
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = [NSDictionary dictionary];
  __int16 v4 = [a1 resetConfigPostCleanupFileLocation];
  if (v4
    && ([MEMORY[0x263F08850] defaultManager],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 fileExistsAtPath:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v50 = v11;
      __int16 v51 = 2112;
      id v52 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Found reset config post cleanup record on disk at %@. Going to read it.", buf, 0x16u);
    }
    uint64_t v12 = (void *)MEMORY[0x263EFF8F8];
    id v13 = [v4 path];
    id v46 = 0;
    id v14 = [v12 dataWithContentsOfFile:v13 options:2 error:&v46];
    id v15 = v46;

    if (v14)
    {
      id v44 = v15;
      v16 = (void *)MEMORY[0x263F08928];
      id v17 = (void *)MEMORY[0x263EFFA08];
      uint64_t v48 = objc_opt_class();
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      v19 = [v17 setWithArray:v18];
      id v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v47 = objc_opt_class();
      __int16 v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
      __int16 v22 = [v20 setWithArray:v21];
      id v45 = 0;
      __int16 v23 = [v16 unarchivedDictionaryWithKeysOfClasses:v19 objectsOfClasses:v22 fromData:v14 error:&v45];
      id v24 = v45;

      if (v23)
      {
        id v25 = v23;
        objc_opt_class();
        int v26 = objc_opt_isKindOfClass() & 1;
        if (v26) {
          uint64_t v27 = v25;
        }
        else {
          uint64_t v27 = 0;
        }
        id v28 = v27;

        if (!v26)
        {
          uint64_t v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = v9;
          uint64_t v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v32 = v43 = v29;
            *(_DWORD *)buf = 138543618;
            __int16 v50 = v32;
            __int16 v51 = 2112;
            id v52 = v25;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the reset config post cleanup record : %@", buf, 0x16u);

            uint64_t v29 = v43;
          }

          id v25 = v3;
        }
        id v33 = v25;
      }
      else
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v9;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v50 = v41;
          __int16 v51 = 2112;
          id v52 = v24;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive reset config post cleanup record from archive data: %@", buf, 0x16u);
        }
        id v33 = v3;
      }
      id v15 = v44;
    }
    else
    {
      os_log_type_t v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = v9;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v50 = v37;
        __int16 v51 = 2112;
        id v52 = v15;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the post cleanup record due to an error: [%@]", buf, 0x16u);
      }
      id v33 = v3;
    }
  }
  else
  {
    id v33 = v3;
  }

  return v33;
}

@end