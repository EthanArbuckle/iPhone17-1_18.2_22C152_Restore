@interface BMPaths
+ (BOOL)getServiceDomain:(unint64_t *)a3 subpath:(id *)a4 forPath:(id)a5;
+ (BOOL)isTestPathOverridden;
+ (BOOL)pathIsManaged:(id)a3 domain:(unint64_t *)a4;
+ (NSString)basePathForTesting;
+ (NSString)localComputeDirectory;
+ (NSString)localFlexibleStorageDirectory;
+ (NSString)syncDirectory;
+ (id)_biomeDirectoryForDomain:(unint64_t)a3 options:(unint64_t)a4;
+ (id)_biomeSystemDataDirectory;
+ (id)_biomeUserDataDirectory:(unint64_t)a3;
+ (id)_pathForLibraryStreamWithDomain:(unint64_t)a3;
+ (id)_pathForTesting;
+ (id)_systemRoot;
+ (id)_userHome;
+ (id)biomeDirectoryForDomain:(unint64_t)a3;
+ (id)biomeTemporaryDirectoryForContainer:(id)a3;
+ (id)biomeTemporaryDirectoryForDomain:(unint64_t)a3;
+ (id)computeDirectoryForDomain:(unint64_t)a3;
+ (id)dataResourcePathComponentFromResource:(id)a3;
+ (id)databaseDirectoryForDomain:(unint64_t)a3;
+ (id)legacySetsRootDirectoryURL;
+ (id)optionalBiomeDirectoryForDomainUser;
+ (id)pathComponentForStreamType:(unint64_t)a3;
+ (id)pathForDatabase:(id)a3;
+ (id)pathForResource:(id)a3 inContainer:(id)a4;
+ (id)pathForSetResource:(id)a3 inContainer:(id)a4;
+ (id)pathForSharedSyncWithAccount:(id)a3 domain:(unint64_t)a4;
+ (id)pathForSharedSyncWithAccount:(id)a3 streamType:(unint64_t)a4 domain:(unint64_t)a5;
+ (id)pathForStreamIdentifier:(id)a3 streamType:(unint64_t)a4;
+ (id)pathForStreamType:(unint64_t)a3 domain:(unint64_t)a4;
+ (id)privacyPathname:(id)a3;
+ (id)privacyURLToString:(id)a3;
+ (id)resourceFromDataResourcePath:(id)a3 inContainer:(id)a4;
+ (id)setsDirectoryInContainer:(id)a3;
+ (id)sharedSyncDirectoryForDomain:(unint64_t)a3;
+ (void)setBasePathForTestingWithPath:(id)a3;
+ (void)unsetBasePathForTesting;
@end

@implementation BMPaths

+ (id)privacyPathname:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)biomeTemporaryDirectoryForDomain:(unint64_t)a3
{
  id v3 = [a1 biomeDirectoryForDomain:a3];
  v4 = +[BMStoreDirectory tmp];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)computeDirectoryForDomain:(unint64_t)a3
{
  id v3 = [a1 biomeDirectoryForDomain:a3];
  v4 = +[BMStoreDirectory compute];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)biomeDirectoryForDomain:(unint64_t)a3
{
  return (id)[a1 _biomeDirectoryForDomain:a3 options:1];
}

+ (BOOL)getServiceDomain:(unint64_t *)a3 subpath:(id *)a4 forPath:(id)a5
{
  id v7 = a5;
  unint64_t v8 = 0;
  char v9 = 1;
  while (1)
  {
    char v10 = v9;
    v11 = +[BMPaths _biomeDirectoryForDomain:v8 options:2];
    if ([v11 hasSuffix:@"/"])
    {
      uint64_t v12 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);

      v11 = (void *)v12;
    }
    if ([v11 length])
    {
      if ([v7 hasPrefix:v11])
      {
        uint64_t v13 = [v7 length];
        if (v13 == [v11 length]
          || objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v11, "length")) == 47)
        {
          break;
        }
      }
    }

    char v9 = 0;
    BOOL v14 = 0;
    unint64_t v8 = 1;
    if ((v10 & 1) == 0) {
      goto LABEL_18;
    }
  }
  if (a3) {
    *a3 = v8;
  }
  if (a4)
  {
    unint64_t v15 = [v7 length];
    uint64_t v16 = [v11 length];
    if (v15 >= v16 + 1) {
      unint64_t v17 = v16 + 1;
    }
    else {
      unint64_t v17 = v15;
    }
    *a4 = [v7 substringFromIndex:v17];
  }

  BOOL v14 = 1;
LABEL_18:

  return v14;
}

+ (id)_biomeDirectoryForDomain:(unint64_t)a3 options:(unint64_t)a4
{
  if (a3 == 1)
  {
    v4 = objc_msgSend(a1, "_biomeSystemDataDirectory", 1, a4);
  }
  else if (a3)
  {
    v4 = 0;
  }
  else
  {
    v4 = [a1 _biomeUserDataDirectory:a4];
  }
  return v4;
}

+ (id)_biomeUserDataDirectory:(unint64_t)a3
{
  v4 = objc_msgSend(a1, "_pathForTesting", a3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [a1 _userHome];
    id v6 = [v7 stringByAppendingPathComponent:@"/Library/Biome"];
  }
  return v6;
}

+ (id)_pathForTesting
{
  v2 = [a1 basePathForTesting];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (NSString)basePathForTesting
{
  return (NSString *)(id)_bmBasePathForTesting;
}

+ (id)_userHome
{
  return @"/private/var/mobile";
}

+ (id)pathForStreamType:(unint64_t)a3 domain:(unint64_t)a4
{
  v5 = +[BMPaths biomeDirectoryForDomain:a4];
  id v6 = +[BMStoreDirectory streams];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  unint64_t v8 = +[BMPaths pathComponentForStreamType:a3];
  if (v8)
  {
    char v9 = [v7 stringByAppendingPathComponent:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)_pathForLibraryStreamWithDomain:(unint64_t)a3
{
  id v3 = +[BMPaths _biomeDirectoryForDomain:a3 options:0];
  if (v3)
  {
    id v4 = +[BMStoreDirectory streams];
    v5 = [v3 stringByAppendingPathComponent:v4];

    id v6 = +[BMPaths pathComponentForStreamType:2];
    id v7 = [v5 stringByAppendingPathComponent:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)pathComponentForStreamType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = __biome_log_for_category(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[BMPaths pathComponentForStreamType:](v4);
      }
      goto LABEL_11;
    case 1uLL:
      id v6 = +[BMStoreDirectory public];
      goto LABEL_14;
    case 2uLL:
      id v6 = +[BMStoreDirectory restricted];
      goto LABEL_14;
    case 3uLL:
      id v4 = __biome_log_for_category(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[BMPaths pathComponentForStreamType:](v4);
      }
LABEL_11:

      goto LABEL_12;
    case 4uLL:
      id v6 = +[BMStoreDirectory private];
      goto LABEL_14;
    default:
      v5 = __biome_log_for_category(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[BMPaths pathComponentForStreamType:](a3, v5);
      }

LABEL_12:
      id v6 = 0;
LABEL_14:
      return v6;
  }
}

+ (id)_biomeSystemDataDirectory
{
  id v3 = [a1 _pathForTesting];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [a1 _systemRoot];
    id v5 = [v6 stringByAppendingPathComponent:@"/private/var/db/biome"];
  }
  return v5;
}

+ (id)_systemRoot
{
  return @"/";
}

+ (BOOL)isTestPathOverridden
{
  return _bmBasePathForTesting != 0;
}

+ (id)pathForResource:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0;
  switch([v6 type])
  {
    case 1:
      char v9 = [v6 name];
      uint64_t v10 = [a1 pathForStreamIdentifier:v9 streamType:2];
      goto LABEL_4;
    case 3:
      char v9 = [v6 name];
      uint64_t v10 = [a1 pathForDatabase:v9];
LABEL_4:
      unint64_t v8 = (void *)v10;

      goto LABEL_15;
    case 4:
      uint64_t v11 = [a1 pathForSetResource:v6 inContainer:v7];
      goto LABEL_14;
    case 5:
      uint64_t v12 = [v6 name];
      int v13 = [v12 isEqual:@"BMSyncResource"];

      if (v13)
      {
        uint64_t v11 = [a1 syncDirectory];
LABEL_14:
        unint64_t v8 = (void *)v11;
        goto LABEL_15;
      }
      BOOL v14 = [v6 name];
      int v15 = [v14 isEqual:@"BMSharedSyncResource"];

      if (v15)
      {
        uint64_t v11 = [a1 sharedSyncDirectoryForDomain:0];
        goto LABEL_14;
      }
      uint64_t v16 = [v6 name];
      int v17 = [v16 isEqual:@"BMFlexibleStorageResource"];

      if (v17)
      {
        uint64_t v11 = [a1 localFlexibleStorageDirectory];
        goto LABEL_14;
      }
      v18 = [v6 name];
      int v19 = [v18 isEqual:@"BMSetsResource"];

      if (v19)
      {
        uint64_t v11 = [a1 setsDirectoryInContainer:v7];
        goto LABEL_14;
      }
      v21 = [v6 name];
      int v22 = [v21 isEqual:@"BMSetsMergeableDeltasResource"];

      if (v22)
      {
        v23 = [a1 biomeTemporaryDirectoryForContainer:v7];
        v24 = +[BMStoreDirectory setsMergeableDeltas];
        unint64_t v8 = [v23 stringByAppendingPathComponent:v24];
      }
      else
      {
        unint64_t v8 = 0;
      }
LABEL_15:

      return v8;
    default:
      goto LABEL_15;
  }
}

+ (id)pathForSetResource:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = [a1 setsDirectoryInContainer:a4];
  unint64_t v8 = [a1 dataResourcePathComponentFromResource:v6];

  if (v8)
  {
    uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

    id v7 = (void *)v9;
  }

  return v7;
}

+ (id)dataResourcePathComponentFromResource:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 name];
  id v5 = [@"Default" stringByAppendingPathComponent:v4];

  id v6 = [v3 descriptors];
  id v23 = 0;
  id v7 = +[BMResourceDescriptor sortedDescriptorsDetectingDuplicates:v6 error:&v23];
  id v8 = v23;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        uint64_t v16 = v5;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          int v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "encodedString", (void)v19);
          id v5 = [v16 stringByAppendingPathComponent:v17];

          ++v15;
          uint64_t v16 = v5;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    id v5 = v5;
    uint64_t v10 = v5;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)setsDirectoryInContainer:(id)a3
{
  id v3 = [a3 url];
  id v4 = [v3 path];
  id v5 = +[BMStoreDirectory sets];
  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (NSString)localFlexibleStorageDirectory
{
  v2 = [a1 biomeDirectoryForDomain:0];
  id v3 = +[BMStoreDirectory flexibleStorage];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return (NSString *)v4;
}

+ (BOOL)pathIsManaged:(id)a3 domain:(unint64_t *)a4
{
  id v6 = a3;
  if ([a1 getServiceDomain:a4 subpath:0 forPath:v6])
  {
    id v7 = +[BMPaths _pathForTesting];
    BOOL v8 = !v7 || ([v6 hasPrefix:v7] & 1) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)biomeTemporaryDirectoryForContainer:(id)a3
{
  id v3 = [a3 url];
  id v4 = [v3 path];
  id v5 = +[BMStoreDirectory tmp];
  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)optionalBiomeDirectoryForDomainUser
{
  return (id)[a1 _biomeDirectoryForDomain:0 options:2];
}

+ (NSString)localComputeDirectory
{
  return (NSString *)[a1 computeDirectoryForDomain:0];
}

+ (NSString)syncDirectory
{
  v2 = [a1 biomeDirectoryForDomain:0];
  id v3 = +[BMStoreDirectory sync];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return (NSString *)v4;
}

+ (id)pathForSharedSyncWithAccount:(id)a3 domain:(unint64_t)a4
{
  id v7 = [a3 identifier];
  if ((BMIdentifierIsPathSafe(v7) & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"BMPaths.m", 212, @"Invalid parameter not satisfying: %@", @"BMIdentifierIsPathSafe(identifier)" object file lineNumber description];
  }
  BOOL v8 = +[BMPaths sharedSyncDirectoryForDomain:a4];
  BOOL v9 = [v8 stringByAppendingPathComponent:v7];

  return v9;
}

+ (id)pathForSharedSyncWithAccount:(id)a3 streamType:(unint64_t)a4 domain:(unint64_t)a5
{
  id v6 = [a1 pathForSharedSyncWithAccount:a3 domain:a5];
  id v7 = +[BMStoreDirectory streams];
  BOOL v8 = [v6 stringByAppendingPathComponent:v7];

  BOOL v9 = +[BMPaths pathComponentForStreamType:a4];
  if (v9)
  {
    uint64_t v10 = [v8 stringByAppendingPathComponent:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)sharedSyncDirectoryForDomain:(unint64_t)a3
{
  id v3 = +[BMPaths biomeDirectoryForDomain:a3];
  id v4 = +[BMStoreDirectory sharedSync];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)pathForStreamIdentifier:(id)a3 streamType:(unint64_t)a4
{
  id v6 = a3;
  if (BMIdentifierIsPathSafe(v6))
  {
    id v7 = objc_msgSend(a1, "pathForStreamType:domain:", a4, BMServiceDomainForStream(a4, v6));
    BOOL v8 = [v7 stringByAppendingPathComponent:v6];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)databaseDirectoryForDomain:(unint64_t)a3
{
  id v3 = [a1 biomeDirectoryForDomain:a3];
  id v4 = +[BMStoreDirectory databases];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)pathForDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [[BMResourceSpecifier alloc] initWithType:3 name:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [a1 databaseDirectoryForDomain:BMServiceDomainForResource(v5)];
    BOOL v8 = [v7 stringByAppendingPathComponent:v4];
  }
  else
  {
    BOOL v9 = __biome_log_for_category(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMPaths pathForDatabase:]((uint64_t)v4, v9);
    }

    BOOL v8 = 0;
  }

  return v8;
}

+ (id)privacyURLToString:(id)a3
{
  return (id)[a3 absoluteString];
}

+ (void)setBasePathForTestingWithPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    bzero(v7, 0x400uLL);
    realpath_DARWIN_EXTSN((const char *)[a3 fileSystemRepresentation], v7);
    uint64_t v4 = [NSString stringWithUTF8String:v7];
    id v5 = (void *)_bmBasePathForTesting;
    _bmBasePathForTesting = v4;
  }
  else
  {
    id v6 = (void *)_bmBasePathForTesting;
    _bmBasePathForTesting = 0;
  }
}

+ (void)unsetBasePathForTesting
{
  v2 = (void *)_bmBasePathForTesting;
  _bmBasePathForTesting = 0;
}

+ (id)resourceFromDataResourcePath:(id)a3 inContainer:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if (!v5)
  {
    long long v21 = 0;
    goto LABEL_32;
  }
  id v33 = v6;
  uint64_t v8 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  BOOL v9 = [v5 pathComponents];
  uint64_t v10 = [v9 reverseObjectEnumerator];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
LABEL_4:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "isEqualToString:", @"/", v33) & 1) == 0) {
        [v8 addObject:v15];
      }
      if ([v15 isEqualToString:@"Default"]) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v12) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  uint64_t v16 = [v8 reverseObjectEnumerator];
  int v17 = [v16 allObjects];
  v18 = (void *)[v17 mutableCopy];

  if (![v18 count])
  {
LABEL_30:
    long long v21 = 0;
    goto LABEL_31;
  }
  long long v19 = [v18 objectAtIndex:0];
  int v20 = [v19 isEqualToString:@"Default"];

  long long v21 = 0;
  if (v20)
  {
    [v18 removeObjectAtIndex:0];
    if ([v18 count])
    {
      long long v22 = [v18 objectAtIndex:0];
      [v18 removeObjectAtIndex:0];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v23 = v18;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v29 = [BMResourceDescriptor alloc];
            uint64_t v34 = 0;
            v30 = [(BMResourceDescriptor *)v29 initWithEncodedString:v28 error:&v34];
            if (v30) {
              BOOL v31 = v34 == 0;
            }
            else {
              BOOL v31 = 0;
            }
            if (v31) {
              [v7 addObject:v30];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v25);
      }

      long long v21 = +[BMResourceSpecifier resourceFromContainer:v33 withType:4 name:v22 descriptors:v7];

      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_31:

  id v6 = v33;
LABEL_32:

  return v21;
}

+ (id)legacySetsRootDirectoryURL
{
  v2 = [[BMResourceSpecifier alloc] initWithType:5 name:@"BMSetsResource"];
  id v3 = +[BMResourceContainerManager sharedInstance];
  id v9 = 0;
  uint64_t v4 = [v3 openContainerForResource:v2 mode:3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = +[BMPaths pathForResource:v2 inContainer:v4];
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
  }
  else
  {
    id v6 = __biome_log_for_category(17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[BMPaths(Sets) legacySetsRootDirectoryURL];
    }
    id v7 = 0;
  }

  return v7;
}

+ (void)pathComponentForStreamType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Attempt to look up stream path for unknown stream type %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)pathComponentForStreamType:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "Attempt to look up stream path through access client for private stream", v1, 2u);
}

+ (void)pathComponentForStreamType:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "Attempt to look up stream path for unsupported stream type BMStreamTypeUnknown", v1, 2u);
}

+ (void)pathForDatabase:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Failed to create resource specifier for %@", (uint8_t *)&v2, 0xCu);
}

@end