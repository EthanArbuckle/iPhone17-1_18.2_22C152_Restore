@interface NSFileManager(RPExtensions)
- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording;
- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording;
- (id)_srGetCreationDateForFile:()RPExtensions;
- (id)dateSuffix;
- (id)outputPath:()RPExtensions bundleID:;
- (id)trimmedOutputPath:()RPExtensions;
- (uint64_t)_srDeleteAllAndSystemTempFiles;
- (uint64_t)_srDeleteAllTempFiles;
- (uint64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:()RPExtensions deleteSystemFiles:;
- (uint64_t)_srDeviceFreeDiskSpace;
- (uint64_t)_srSizeOfTempDir:()RPExtensions;
- (uint64_t)_srTempPath;
- (void)_srDeleteFilesWithPrefix:()RPExtensions;
- (void)_srMoveFileFromURL:()RPExtensions toURL:completion:;
- (void)_srRemoveFile:()RPExtensions completion:;
- (void)_srSetupTempDirectory;
@end

@implementation NSFileManager(RPExtensions)

- (uint64_t)_srTempPath
{
  return [@"/private/var/mobile/Library/ReplayKit/" stringByExpandingTildeInPath];
}

- (void)_srSetupTempDirectory
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error creating temp directory", v0, 2u);
}

- (id)dateSuffix
{
  v0 = [MEMORY[0x263EFF910] date];
  id v1 = objc_alloc_init(MEMORY[0x263F08790]);
  [v1 setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
  v2 = [v1 stringFromDate:v0];
  v3 = [v2 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

  return v3;
}

- (id)outputPath:()RPExtensions bundleID:
{
  id v6 = a4;
  v7 = [a1 dateSuffix];
  if (a3 == 1)
  {
    v11 = NSString;
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v9 _srTempPath];
    [v11 stringWithFormat:@"%@/ClipRecording_%@.mp4", v10, v7];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v8 = NSString;
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v9 _srTempPath];
    [v8 stringWithFormat:@"%@/ScreenRecording_%@.mp4", v10, v7];
    v12 = LABEL_5:;
    goto LABEL_7;
  }
  v13 = NSString;
  v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [v9 _srTempPath];
  v14 = [MEMORY[0x263F086E0] _rpLocalizedAppNameFromBundleID:v6];
  v12 = [v13 stringWithFormat:@"%@/%@_%@.mp4", v10, v14, v7];

LABEL_7:

  return v12;
}

- (id)trimmedOutputPath:()RPExtensions
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  v7 = [v6 _srTempPath];
  v8 = [MEMORY[0x263F086E0] _rpLocalizedAppNameFromBundleID:v5];

  v9 = [v3 stringWithFormat:@"%@/%@_trimmed.mp4", v7, v8];

  return v9;
}

- (uint64_t)_srSizeOfTempDir:()RPExtensions
{
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [a1 _srTempPath];
  v7 = [v5 attributesOfItemAtPath:v6 error:a3];

  uint64_t v8 = [v7 fileSize];
  return v8;
}

- (uint64_t)_srDeleteAllTempFiles
{
  return [a1 _srDeleteFilesOlderThanTimeToLiveInSeconds:0 deleteSystemFiles:0.0];
}

- (uint64_t)_srDeleteAllAndSystemTempFiles
{
  return [a1 _srDeleteFilesOlderThanTimeToLiveInSeconds:1 deleteSystemFiles:0.0];
}

- (uint64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:()RPExtensions deleteSystemFiles:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v43 = (int)a2;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "_srDeleteFilesOlderThanTimeToLiveInSeconds: %i", buf, 8u);
  }
  v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = [a1 _srTempPath];
  id v40 = 0;
  v9 = [v7 contentsOfDirectoryAtPath:v8 error:&v40];
  id v10 = v40;

  __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v11, v10);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v33 = 0;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if ((a4 & 1) != 0
          || ([*(id *)(*((void *)&v36 + 1) + 8 * i) containsString:@"ScreenRecording_"] & 1) == 0)
        {
          v17 = NSString;
          v18 = [a1 _srTempPath];
          v19 = [v17 stringWithFormat:@"%@/%@", v18, v16];

          id v35 = v10;
          v20 = [a1 attributesOfItemAtPath:v19 error:&v35];
          id v21 = v35;

          __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v22, v21);
          v23 = [MEMORY[0x263EFF910] date];
          v24 = [v20 fileModificationDate];
          [v23 timeIntervalSinceDate:v24];
          double v26 = v25;

          uint64_t v27 = [v20 fileSize];
          if (a2 == 0.0 || v26 > a2)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "deleting old file", buf, 2u);
            }
            id v34 = v21;
            [a1 removeItemAtPath:v19 error:&v34];
            id v28 = v34;

            __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v29, v28);
            if (v28) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = v27;
            }
            v33 += v30;
            id v21 = v28;
          }

          id v10 = v21;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

- (void)_srRemoveFile:()RPExtensions completion:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke;
  block[3] = &unk_26451D758;
  id v12 = v6;
  uint64_t v13 = a1;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_srMoveFileFromURL:()RPExtensions toURL:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke;
  v15[3] = &unk_26451D780;
  v15[4] = a1;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)_srDeleteFilesWithPrefix:()RPExtensions
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke;
  v7[3] = &unk_26451D7A8;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_srGetCreationDateForFile:()RPExtensions
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v6 = [v4 path];

  id v7 = [v5 attributesOfItemAtPath:v6 error:0];

  id v8 = [v7 objectForKey:*MEMORY[0x263F08008]];

  return v8;
}

- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording
{
  return (unint64_t)[a1 _srDeviceFreeDiskSpace] > 0x5F5E100;
}

- (uint64_t)_srDeviceFreeDiskSpace
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [a1 _srTempPath];
  id v4 = [v2 attributesOfFileSystemForPath:v3 error:0];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
  uint64_t v6 = [v5 unsignedLongValue];

  return v6;
}

- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording
{
  unint64_t v2 = 2 * [a1 _srSizeOfTempDir:0] + 20000000;
  return v2 < [a1 _srDeviceFreeDiskSpace];
}

@end