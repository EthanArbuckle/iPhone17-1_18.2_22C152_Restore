@interface CAMTimelapseDiskUtilities
+ (BOOL)hasPendingWork;
+ (BOOL)removeDummyFileForTimelapseUUID:(id)a3;
+ (BOOL)reserveDummyFileForTimelapseUUID:(id)a3 width:(int64_t)a4 height:(int64_t)a5 useHEVC:(BOOL)a6;
+ (BOOL)writeSecondaryStateToDisk:(id)a3 forTimelapseUUID:(id)a4;
+ (BOOL)writeStateToDisk:(id)a3 createDirectoryIfNeeded:(BOOL)a4;
+ (id)directoryPathForTimelapseUUID:(id)a3;
+ (id)dummyFileName;
+ (id)dummyFilePathForTimelapseUUID:(id)a3;
+ (id)fileNameForImageFrameIndex:(int64_t)a3;
+ (id)fileNameForImageVISIndex:(int64_t)a3;
+ (id)readFrameFilePathsForTimelapseUUID:(id)a3;
+ (id)readSecondaryStateForTimelapseUUID:(id)a3;
+ (id)readSortedStatesFromDiskMergeSecondaryState:(BOOL)a3;
+ (id)readStateForTimelapseUUID:(id)a3 mergeSecondaryState:(BOOL)a4;
+ (id)secondaryStateFileName;
+ (id)secondaryStateFilePathForTimelapseUUID:(id)a3;
+ (id)sortedArrayFromFilePathDictionary:(id)a3 reverse:(BOOL)a4;
+ (id)stateFileName;
+ (id)stateFilePathForTimelapseUUID:(id)a3;
+ (id)timelapseDirectoryPath;
+ (id)timelapseDirectoryPathCreateIfNeeded:(BOOL)a3;
+ (id)timelapseUUIDsOnDisk;
+ (id)updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:(id)a3;
+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 forStateReadSuccessfully:(BOOL)a4;
+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 withStopReasons:(int64_t)a4 stopTime:(id)a5;
+ (int64_t)frameIndexFromImageFileName:(id)a3;
+ (void)timelapseUUIDsOnDisk;
@end

@implementation CAMTimelapseDiskUtilities

+ (BOOL)hasPendingWork
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [a1 timelapseDirectoryPathCreateIfNeeded:0];
  v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  BOOL v5 = 0;
  if (v4)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    v7 = [v6 contentsOfDirectoryAtPath:v2 error:&v11];
    id v8 = v11;

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v2;
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
      }
    }
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

+ (id)timelapseDirectoryPathCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [MEMORY[0x263F5DB20] photoDCIMDirectory];
  BOOL v5 = [v4 stringByAppendingPathComponent:@".MISC/Timelapse"];

  if (v3)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v5;
}

+ (id)stateFileName
{
  return @"STATE.TML";
}

+ (id)secondaryStateFileName
{
  return @"SECONDARY_STATE.TLS";
}

+ (id)timelapseDirectoryPath
{
  return (id)[a1 timelapseDirectoryPathCreateIfNeeded:1];
}

+ (id)directoryPathForTimelapseUUID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = v3;
    BOOL v5 = +[CAMTimelapseDiskUtilities timelapseDirectoryPath];
    v6 = [v5 stringByAppendingPathComponent:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fileNameForImageFrameIndex:(int64_t)a3
{
  return (id)[NSString stringWithFormat:@"%@%ld%@", @"FRAME_", a3, @".JPG"];
}

+ (id)fileNameForImageVISIndex:(int64_t)a3
{
  return (id)[NSString stringWithFormat:@"%@%ld%@", @"FRAME_", a3, @".tvis"];
}

+ (int64_t)frameIndexFromImageFileName:(id)a3
{
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = (void *)MEMORY[0x21050BCA0](a1, a2);
  BOOL v5 = [a3 lowercaseString];
  v6 = [MEMORY[0x263F08B08] scannerWithString:v5];
  v7 = [@"FRAME_" lowercaseString];
  int v8 = [v6 scanString:v7 intoString:0];

  if (!v8
    || ![v6 scanInteger:&v13]
    || ([@".JPG" lowercaseString],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v6 scanString:v9 intoString:0],
        v9,
        !v10)
    || ([v6 isAtEnd] & 1) == 0)
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  int64_t v11 = v13;

  return v11;
}

+ (id)timelapseUUIDsOnDisk
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = +[CAMTimelapseDiskUtilities timelapseDirectoryPath];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v22 = 0;
  BOOL v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v22];
  id v6 = v22;
  if (v6)
  {
    v7 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CAMTimelapseDiskUtilities timelapseUUIDsOnDisk]();
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v14 = [v3 stringByAppendingPathComponent:v13];
        char v17 = 0;
        if ([v4 fileExistsAtPath:v14 isDirectory:&v17]) {
          BOOL v15 = v17 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v2 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  return v2;
}

+ (id)stateFilePathForTimelapseUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 stateFileName];
  id v6 = [a1 directoryPathForTimelapseUUID:v4];

  v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

+ (id)readStateForTimelapseUUID:(id)a3 mergeSecondaryState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 stateFilePathForTimelapseUUID:v6];
  id v8 = +[CAMTimelapseState stateWithContentsOfFile:v7];
  if (v4)
  {
    uint64_t v9 = [a1 readSecondaryStateForTimelapseUUID:v6];
    [v8 mergeSecondaryState:v9];
  }
  return v8;
}

+ (BOOL)writeStateToDisk:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 timelapseUUID];
    uint64_t v9 = [a1 stateFilePathForTimelapseUUID:v8];

    char v10 = [v7 writeToFile:v9 createDirectoryIfNeeded:v4];
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CAMTimelapseDiskUtilities writeStateToDisk:createDirectoryIfNeeded:]();
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)secondaryStateFilePathForTimelapseUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 secondaryStateFileName];
  id v6 = [a1 directoryPathForTimelapseUUID:v4];

  v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

+ (id)readSecondaryStateForTimelapseUUID:(id)a3
{
  id v3 = [a1 secondaryStateFilePathForTimelapseUUID:a3];
  id v4 = +[CAMNebulaSecondaryState secondaryStateWithContentsOfFile:v3];

  return v4;
}

+ (BOOL)writeSecondaryStateToDisk:(id)a3 forTimelapseUUID:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [a1 secondaryStateFilePathForTimelapseUUID:a4];
    char v8 = [v6 writeToFile:v7];
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CAMTimelapseDiskUtilities writeSecondaryStateToDisk:forTimelapseUUID:]();
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 withStopReasons:(int64_t)a4 stopTime:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  char v10 = [a1 readSecondaryStateForTimelapseUUID:v9];
  if (!v10) {
    char v10 = objc_alloc_init(CAMNebulaSecondaryState);
  }
  [(CAMNebulaSecondaryState *)v10 addStopReasons:a4 stopTime:v8];
  [a1 writeSecondaryStateToDisk:v10 forTimelapseUUID:v9];

  return v10;
}

+ (id)updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 readSecondaryStateForTimelapseUUID:v4];
  if (!v5) {
    BOOL v5 = objc_alloc_init(CAMNebulaSecondaryState);
  }
  [(CAMNebulaSecondaryState *)v5 notifyWillAttemptToWriteMovie];
  [a1 writeSecondaryStateToDisk:v5 forTimelapseUUID:v4];

  return v5;
}

+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 forStateReadSuccessfully:(BOOL)a4
{
  id v6 = a3;
  v7 = [a1 readSecondaryStateForTimelapseUUID:v6];
  if (!v7 && !a4) {
    v7 = objc_alloc_init(CAMNebulaSecondaryState);
  }
  if (v7)
  {
    if (a4) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [(CAMNebulaSecondaryState *)v7 failedStateReadAttemptsCount] + 1;
    }
    [(CAMNebulaSecondaryState *)v7 setFailedStateReadAttemptsCount:v8];
    [a1 writeSecondaryStateToDisk:v7 forTimelapseUUID:v6];
  }

  return v7;
}

+ (id)readSortedStatesFromDiskMergeSecondaryState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v5 = [MEMORY[0x263EFF980] array];
  id v6 = [a1 timelapseUUIDsOnDisk];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [a1 readStateForTimelapseUUID:*(void *)(*((void *)&v13 + 1) + 8 * i) mergeSecondaryState:v3];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [v5 sortUsingComparator:&__block_literal_global_48];

  return v5;
}

uint64_t __73__CAMTimelapseDiskUtilities_readSortedStatesFromDiskMergeSecondaryState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 startTime];
  id v6 = [v4 startTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)readFrameFilePathsForTimelapseUUID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  BOOL v5 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v3];
  id v26 = 0;
  id v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v26];
  id v7 = v26;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:]();
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      long long v19 = v4;
      id v20 = v3;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          int64_t v14 = +[CAMTimelapseDiskUtilities frameIndexFromImageFileName:v13];
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int64_t v15 = v14;
            long long v16 = [v5 stringByAppendingPathComponent:v13];
            char v17 = [NSNumber numberWithInteger:v15];
            [v21 setObject:v16 forKey:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
      id v4 = v19;
      id v3 = v20;
    }
  }

  return v21;
}

+ (id)sortedArrayFromFilePathDictionary:(id)a3 reverse:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v5 allKeys];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__CAMTimelapseDiskUtilities_sortedArrayFromFilePathDictionary_reverse___block_invoke;
  v20[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  BOOL v21 = a4;
  uint64_t v8 = [v7 sortedArrayUsingComparator:v20];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        int64_t v14 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v6 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  return v6;
}

uint64_t __71__CAMTimelapseDiskUtilities_sortedArrayFromFilePathDictionary_reverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v3 = a3;
    a3 = a2;
  }
  else
  {
    id v3 = a2;
  }
  return [v3 compare:a3];
}

+ (id)dummyFileName
{
  return @"RESERVED_SPACE.BIN";
}

+ (id)dummyFilePathForTimelapseUUID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 dummyFileName];
  id v6 = [a1 directoryPathForTimelapseUUID:v4];

  id v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

+ (BOOL)reserveDummyFileForTimelapseUUID:(id)a3 width:(int64_t)a4 height:(int64_t)a5 useHEVC:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = +[CAMTimelapseSettings sharedInstance];
  uint64_t v12 = [v11 maxMovieFileLengthForWidth:a4 height:a5 useHEVC:v6];

  uint64_t v13 = (void *)MEMORY[0x263F5DB48];
  int64_t v14 = NSHomeDirectory();
  uint64_t v15 = [v13 diskSpaceAvailableForPath:v14];

  if (v15 < 0 || v12 <= v15)
  {
    long long v16 = [a1 dummyFilePathForTimelapseUUID:v10];
    long long v18 = [MEMORY[0x263F08850] defaultManager];
    int v19 = [v18 fileExistsAtPath:v16];

    if (v19)
    {
      id v20 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v16;
        _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Cannot reserve disk space. File already exists at %{public}@", buf, 0xCu);
      }
      BOOL v17 = 0;
    }
    else
    {
      id v20 = [a1 directoryPathForTimelapseUUID:v10];
      BOOL v21 = [MEMORY[0x263F08850] defaultManager];
      id v47 = 0;
      int v22 = [v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v47];
      id v23 = v47;

      if (!v22 || v23)
      {
        long long v24 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v20;
          _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create directory %{public}@", buf, 0xCu);
        }
      }
      long long v25 = v16;
      id v26 = fopen((const char *)[v25 fileSystemRepresentation], "wb");
      if (v26)
      {
        v27 = v26;
        if (fseek(v26, v12 - 1, 0))
        {
          uint64_t v28 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_2099F8000, v28, OS_LOG_TYPE_DEFAULT, "Failed to seek to end of file %{public}@", buf, 0xCu);
          }
        }
        char __ptr = 0;
        if (fwrite(&__ptr, 1uLL, 1uLL, v27) != 1)
        {
          v29 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_2099F8000, v29, OS_LOG_TYPE_DEFAULT, "Failed to write byte at end of file %{public}@", buf, 0xCu);
          }
        }
        if (fclose(v27))
        {
          v30 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_2099F8000, v30, OS_LOG_TYPE_DEFAULT, "Failed to close file %{public}@", buf, 0xCu);
          }
        }
        v31 = [MEMORY[0x263F08850] defaultManager];
        id v45 = 0;
        v32 = [v31 attributesOfItemAtPath:v25 error:&v45];
        id v23 = v45;

        if (!v32 || v23)
        {
          v33 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v49 = v25;
            __int16 v50 = 2114;
            uint64_t v51 = (uint64_t)v23;
            _os_log_impl(&dword_2099F8000, v33, OS_LOG_TYPE_DEFAULT, "Failed to get attribures for file %{public}@ with error %{public}@", buf, 0x16u);
          }
        }
        v34 = [v32 objectForKey:*MEMORY[0x263F080B8]];
        uint64_t v35 = [v34 longLongValue];
        BOOL v17 = v35 == v12;
        if (v35 != v12)
        {
          v36 = [MEMORY[0x263F08850] defaultManager];
          int v37 = [v36 fileExistsAtPath:v25];

          if (v37)
          {

            v38 = [MEMORY[0x263F08850] defaultManager];
            id v44 = 0;
            int v39 = [v38 removeItemAtPath:v25 error:&v44];
            id v40 = v44;

            if (!v39 || (id v23 = 0, v40))
            {
              v41 = os_log_create("com.apple.camera", "Nebula");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v49 = v25;
                _os_log_impl(&dword_2099F8000, v41, OS_LOG_TYPE_DEFAULT, "Failed to remove file %{public}@", buf, 0xCu);
              }

              id v23 = v40;
            }
          }
        }
      }
      else
      {
        v42 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:width:height:useHEVC:]((uint64_t)v25, v42);
        }

        BOOL v17 = 0;
      }
    }
  }
  else
  {
    long long v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v49 = v12;
      __int16 v50 = 2048;
      uint64_t v51 = v15;
      _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "Cannot reserve disk space. %lld bytes needed, %lld available", buf, 0x16u);
    }
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)removeDummyFileForTimelapseUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [a1 dummyFilePathForTimelapseUUID:a3];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    int v7 = [v6 removeItemAtPath:v3 error:&v12];
    id v8 = v12;

    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      id v10 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        int64_t v14 = v3;
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to remove file %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (void)timelapseUUIDsOnDisk
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to get contents of directory %{public}@: %{public}@");
}

+ (void)writeStateToDisk:createDirectoryIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to write state to disk at path %{public}@ (state %{public}@)");
}

+ (void)writeSecondaryStateToDisk:forTimelapseUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to write secondary state to disk at path %{public}@ (state %{public}@)");
}

+ (void)readFrameFilePathsForTimelapseUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to read frame file paths for timelapseUUID %{public}@: %{public}@");
}

+ (void)reserveDummyFileForTimelapseUUID:(uint64_t)a1 width:(NSObject *)a2 height:useHEVC:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Cannot open file at %{public}@", (uint8_t *)&v2, 0xCu);
}

@end