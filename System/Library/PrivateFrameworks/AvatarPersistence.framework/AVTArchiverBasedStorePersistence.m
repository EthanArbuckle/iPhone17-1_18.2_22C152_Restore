@interface AVTArchiverBasedStorePersistence
+ (BOOL)_createStoreEmptyFileIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6;
+ (BOOL)_createStoreFolderIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6;
+ (BOOL)_createStoreIfNeededAtLocation:(id)a3 logger:(id)a4 error:(id *)a5;
+ (BOOL)_migrateFromPre0_5ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6;
+ (BOOL)_migrateFromPre0_6ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6;
+ (BOOL)_performMigrationIfNeededForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6;
+ (BOOL)_writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6;
+ (BOOL)contentExistsAtLocation:(id)a3;
+ (BOOL)isFileNotFoundError:(id)a3;
+ (BOOL)removeFilesAtLocation:(id)a3 error:(id *)a4;
+ (BOOL)writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6;
+ (BOOL)writeVersion:(id)a3 toDiskAtLocation:(id)a4 error:(id *)a5;
+ (id)_migrateDifferentAvatarKitVersionsForContent:(id)a3 logger:(id)a4;
+ (id)_readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5;
+ (id)currentVersion;
+ (id)dbLocationForStoreLocation:(id)a3;
+ (id)readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5;
+ (id)readVersionForStoreAtLocation:(id)a3 error:(id *)a4;
@end

@implementation AVTArchiverBasedStorePersistence

+ (id)dbLocationForStoreLocation:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"avatars.db"];
}

+ (id)currentVersion
{
  return +[AVTBackendVersion currentVersion];
}

+ (BOOL)contentExistsAtLocation:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [a1 dbLocationForStoreLocation:v5];

  v8 = [v7 path];
  char v9 = [v6 fileExistsAtPath:v8];

  return v9;
}

+ (BOOL)removeFilesAtLocation:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F08850];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  char v9 = [a1 dbLocationForStoreLocation:v7];
  v10 = +[AVTBackendVersion versionFileLocationForStoreLocation:v7];

  v11 = [v9 path];
  int v12 = [v8 fileExistsAtPath:v11];

  BOOL v15 = 0;
  if (!v12 || [v8 removeItemAtURL:v9 error:a4])
  {
    v13 = [v10 path];
    int v14 = [v8 fileExistsAtPath:v13];

    if (!v14 || [v8 removeItemAtURL:v10 error:a4]) {
      BOOL v15 = 1;
    }
  }

  return v15;
}

+ (id)readVersionForStoreAtLocation:(id)a3 error:(id *)a4
{
  return +[AVTBackendVersion versionFromDiskAtLocation:a3 error:a4];
}

+ (BOOL)writeVersion:(id)a3 toDiskAtLocation:(id)a4 error:(id *)a5
{
  return [a3 saveToDiskAtLocation:a4 error:a5];
}

+ (BOOL)isFileNotFoundError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqual:*MEMORY[0x263F07F70]]) {
    BOOL v5 = [v3 code] == 260 || objc_msgSend(v3, "code") == 4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0;
  char v10 = [a1 _createStoreIfNeededAtLocation:v8 logger:v9 error:&v15];
  id v11 = v15;
  int v12 = v11;
  if (v10)
  {
    v13 = [a1 _readContentFromDiskAtLocation:v8 logger:v9 error:a5];
  }
  else
  {
    v13 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v13;
}

+ (id)_readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [v9 path];
  [v8 logReadingBackendAtPath:v10];

  id v11 = [a1 dbLocationForStoreLocation:v9];

  id v21 = 0;
  int v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11 options:0 error:&v21];
  id v13 = v21;
  if (v12 || ([a1 isFileNotFoundError:v13] & 1) != 0)
  {
    if ([v12 length])
    {
      id v20 = v13;
      int v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v20];
      id v15 = v20;

      if (!v14)
      {
        if (a5) {
          *a5 = v15;
        }
        v16 = [v15 description];
        [v8 logReadingError:v16];

        int v14 = 0;
      }
      id v13 = v15;
    }
    else
    {
      v17 = [AVTArchiverBasedStoreRoot alloc];
      int v14 = [(AVTArchiverBasedStoreRoot *)v17 initWithDomains:MEMORY[0x263EFFA68] records:MEMORY[0x263EFFA68]];
    }
  }
  else
  {
    if (a5) {
      *a5 = v13;
    }
    v18 = [v13 description];
    [v8 logReadingError:v18];

    int v14 = 0;
  }

  return v14;
}

+ (BOOL)writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v12 logSavingBackend];
  id v13 = objc_alloc_init(MEMORY[0x263F08850]);
  id v26 = 0;
  char v14 = [a1 _createStoreFolderIfNeededAtLocation:v11 logger:v12 fileManager:v13 error:&v26];
  id v15 = v26;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    if (a6) {
      *a6 = v15;
    }
    v22 = [v16 description];
    [v12 logSavingError:v22];
    goto LABEL_8;
  }
  id v25 = v15;
  int v17 = [a1 _writeContent:v10 toDiskAtLocation:v11 logger:v12 error:&v25];
  id v18 = v25;

  if (!v17)
  {
    BOOL v21 = 0;
    goto LABEL_11;
  }
  v19 = [a1 currentVersion];
  id v24 = v18;
  char v20 = [a1 writeVersion:v19 toDiskAtLocation:v11 error:&v24];
  id v16 = v24;

  if ((v20 & 1) == 0)
  {
    if (a6) {
      *a6 = v16;
    }
    v22 = [v16 description];
    [v12 logErrorUpdatingVersion:v22];
LABEL_8:

    BOOL v21 = 0;
    goto LABEL_9;
  }
  BOOL v21 = 1;
LABEL_9:
  id v18 = v16;
LABEL_11:

  return v21;
}

+ (BOOL)_writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v21 = 0;
  id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v21];
  id v13 = v21;
  char v14 = v13;
  if (v12)
  {
    id v15 = [a1 dbLocationForStoreLocation:v10];
    id v20 = v14;
    char v16 = [v12 writeToURL:v15 options:AVTDefaultFileProtectionDataWritingOptions() | 1 error:&v20];
    id v17 = v20;

    if ((v16 & 1) == 0)
    {
      if (a6) {
        *a6 = v17;
      }
      id v18 = [v17 description];
      [v11 logSavingError:v18];
    }
    char v14 = v17;
  }
  else
  {
    if (a6) {
      *a6 = v13;
    }
    id v15 = [v14 description];
    [v11 logSavingError:v15];
    char v16 = 0;
  }

  return v16;
}

+ (BOOL)_createStoreIfNeededAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263F08850]);
  if ([a1 _performMigrationIfNeededForStoreAtLocation:v8 logger:v9 fileManager:v10 error:a5]&& objc_msgSend(a1, "_createStoreFolderIfNeededAtLocation:logger:fileManager:error:", v8, v9, v10, a5))
  {
    id v11 = [a1 dbLocationForStoreLocation:v8];
    char v12 = [a1 _createStoreEmptyFileIfNeededAtLocation:v11 logger:v9 fileManager:v10 error:a5];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)_performMigrationIfNeededForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v29 = 0;
  uint64_t v13 = [a1 readVersionForStoreAtLocation:v10 error:&v29];
  id v14 = v29;
  if (v13 || ([a1 isFileNotFoundError:v14] & 1) != 0)
  {
    uint64_t v15 = [a1 currentVersion];
    if (!(v13 | v15) || ([(id)v13 isEqual:v15] & 1) != 0)
    {
      char v16 = 1;
LABEL_6:

      goto LABEL_7;
    }
    id v18 = [(id)v13 description];
    v19 = [(id)v15 description];
    [v11 logBackendVersionMismatch:v18 actual:v19];

    if (v13
      && ([(id)v13 backendVersion], v20 >= 0.5)
      && ([(id)v13 backendVersion], double v22 = v21, objc_msgSend((id)v15, "backendVersion"), v22 <= v23))
    {
      [(id)v13 backendVersion];
      if (v28 >= 0.6
        || objc_msgSend(a1, "_migrateFromPre0_6ToCurrentForStoreAtLocation:logger:fileManager:error:", v10, v11, v12, a6))
      {
LABEL_12:
        id v24 = [a1 _readContentFromDiskAtLocation:v10 logger:v11 error:a6];
        if (!v24) {
          goto LABEL_20;
        }
        [(id)v13 avatarKitVersion];
        if (v25 < 12.0)
        {
          uint64_t v26 = [a1 _migrateDifferentAvatarKitVersionsForContent:v24 logger:v11];

          id v24 = (void *)v26;
        }
        if ([a1 _createStoreFolderIfNeededAtLocation:v10 logger:v11 fileManager:v12 error:a6]&& objc_msgSend(a1, "_writeContent:toDiskAtLocation:logger:error:", v24, v10, v11, a6))
        {
          v27 = [a1 currentVersion];
          char v16 = [a1 writeVersion:v27 toDiskAtLocation:v10 error:a6];
        }
        else
        {
LABEL_20:
          char v16 = 0;
        }

        goto LABEL_6;
      }
    }
    else if (objc_msgSend(a1, "_migrateFromPre0_5ToCurrentForStoreAtLocation:logger:fileManager:error:", v10, v11, v12, a6))
    {
      goto LABEL_12;
    }
    char v16 = 0;
    goto LABEL_6;
  }
  char v16 = 0;
  if (a6) {
    *a6 = v14;
  }
LABEL_7:

  return v16;
}

+ (BOOL)_migrateFromPre0_5ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11) {
    char v12 = [v9 removeItemAtURL:v8 error:a6];
  }
  else {
    char v12 = 1;
  }

  return v12;
}

+ (BOOL)_migrateFromPre0_6ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    char v12 = [v8 path];
    uint64_t v13 = [v9 attributesOfItemAtPath:v12 error:a6];
    id v14 = (void *)[v13 mutableCopy];

    if (v14)
    {
      uint64_t v15 = *MEMORY[0x263F080A8];
      char v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F080A8]];
      id v17 = AVTDefaultFileProtectionType();
      char v18 = [v16 isEqual:v17];

      if (v18)
      {
        char v19 = 1;
      }
      else
      {
        double v20 = AVTDefaultFileProtectionType();
        [v14 setObject:v20 forKeyedSubscript:v15];

        double v21 = [v8 path];
        char v19 = [v9 setAttributes:v14 ofItemAtPath:v21 error:a6];
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

+ (id)_migrateDifferentAvatarKitVersionsForContent:(id)a3 logger:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v5, "records", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 avatarData];
        if (+[AVTAvatarRecord canLoadAvatarWithData:v14])
        {
          [v7 addObject:v13];
        }
        else
        {
          uint64_t v15 = [v13 description];
          [v6 logDroppingUnsupportedAvatarRecord:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  char v16 = [AVTArchiverBasedStoreRoot alloc];
  id v17 = [v5 domains];
  char v18 = [(AVTArchiverBasedStoreRoot *)v16 initWithDomains:v17 records:v7];

  return v18;
}

+ (BOOL)_createStoreFolderIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [v9 path];
  char v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = [v9 path];
    [v10 logCreatingBackendFolderAtPath:v15];

    BOOL v14 = 1;
    if (([v11 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a6] & 1) == 0)
    {
      char v16 = [*a6 description];
      [v10 logErrorCreatingBackendContent:v16];

      BOOL v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)_createStoreEmptyFileIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [v9 path];
  char v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = [v9 path];
    [v10 logCreatingBackendDBAtPath:v15];

    id v16 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    BOOL v14 = 1;
    char v17 = [v16 writeToURL:v9 options:1 error:a6];

    if ((v17 & 1) == 0)
    {
      char v18 = [*a6 description];
      [v10 logErrorCreatingBackendContent:v18];

      BOOL v14 = 0;
    }
  }

  return v14;
}

@end