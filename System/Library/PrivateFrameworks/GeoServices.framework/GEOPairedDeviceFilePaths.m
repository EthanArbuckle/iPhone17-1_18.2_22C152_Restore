@interface GEOPairedDeviceFilePaths
+ (id)urlFor:(unint64_t)a3 forDevice:(id)a4;
+ (void)_cleanupOldDevices;
+ (void)_pairedDevicesDidChange:(id)a3;
+ (void)registerCleanupTasks;
@end

@implementation GEOPairedDeviceFilePaths

+ (id)urlFor:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 >= 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    __int16 v21 = 0;
    v16 = MEMORY[0x1E4F14500];
    v17 = "Assertion failed: filePathType < GEOPairedDeviceFilePath_Count";
    v18 = (uint8_t *)&v21;
LABEL_19:
    _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_17;
  }
  if (urlFor_forDevice__filePathRecords[3 * a3] == a3)
  {
    v6 = (char *)&urlFor_forDevice__filePathRecords[3 * a3];
    uint64_t v7 = *((void *)v6 + 1);
    id v8 = *((id *)v6 + 2);
    if (v7)
    {
      if (v7 == 1)
      {
        uint64_t v9 = +[GEOFilePaths urlFor:14];
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [v5 pairingID];
          v12 = [v11 UUIDString];
          v13 = [v10 URLByAppendingPathComponent:v12 isDirectory:1];

          v14 = [v13 URLByAppendingPathComponent:v8];

LABEL_10:
          goto LABEL_11;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: baseURL != ((void *)0)", v19, 2u);
      }
    }
    v14 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E4F14500];
    v17 = "Assertion failed: record->filePathType == filePathType";
    v18 = buf;
    goto LABEL_19;
  }
LABEL_17:
  v14 = 0;
LABEL_11:

  return v14;
}

+ (void)registerCleanupTasks
{
  if (NanoRegistryLibraryCore())
  {
    v3 = +[GEOKeyBagNotification sharedObject];
    global_queue = (void *)geo_get_global_queue();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__GEOPairedDeviceFilePaths_registerCleanupTasks__block_invoke;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = a1;
    [v3 runAfterFirstUnlock:global_queue block:v5];
  }
}

uint64_t __48__GEOPairedDeviceFilePaths_registerCleanupTasks__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = getNRPairedDeviceRegistryDevicesDidUpdateNotification();
  [v2 addObserver:v3 selector:sel__pairedDevicesDidChange_ name:v4 object:0];

  id v5 = *(void **)(a1 + 32);

  return [v5 _cleanupOldDevices];
}

+ (void)_pairedDevicesDidChange:(id)a3
{
}

uint64_t __52__GEOPairedDeviceFilePaths__pairedDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupOldDevices];
}

+ (void)_cleanupOldDevices
{
  if (NanoRegistryLibraryCore())
  {
    id v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
    [v2 getDevicesWithBlock:&__block_literal_global_149];
  }
}

void __46__GEOPairedDeviceFilePaths__cleanupOldDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(a2, "_geo_compactMap:", &__block_literal_global_7_1);
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = +[GEOFilePaths urlFor:14];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 path];
  v6 = [v3 contentsOfDirectoryAtPath:v5 error:0];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        if (v11 && ([v2 containsObject:v11] & 1) == 0)
        {
          v12 = [v11 UUIDString];
          v13 = [v4 URLByAppendingPathComponent:v12 isDirectory:1];

          v14 = GEOGetGEOFilePathsLog_0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            id v25 = v13;
            _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "[PairedDevice] Cleaning up data for old paired device: %{private}@", buf, 0xCu);
          }

          id v19 = 0;
          char v15 = [v3 removeItemAtURL:v13 error:&v19];
          id v16 = v19;
          if ((v15 & 1) == 0)
          {
            v17 = GEOGetGEOFilePathsLog_0();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v25 = v16;
              _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to remove data for old paired device: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
}

uint64_t __46__GEOPairedDeviceFilePaths__cleanupOldDevices__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pairingID];
}

@end