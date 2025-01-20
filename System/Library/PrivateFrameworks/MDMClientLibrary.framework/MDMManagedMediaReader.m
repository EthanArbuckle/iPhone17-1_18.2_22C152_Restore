@interface MDMManagedMediaReader
+ (id)_metadataByBundleIDExcludeDDMApps:(BOOL)a3;
+ (id)attributesByAppID;
+ (id)attributesByAppIDExcludeDDMApps:(BOOL)a3;
+ (id)managedAppIDs;
+ (id)managedAppIDsExcludeDDMApps:(BOOL)a3;
+ (id)managedAppIDsWithFlags:(unint64_t)a3;
+ (id)managedAppIDsWithFlags:(unint64_t)a3 excludeDDMApps:(BOOL)a4;
+ (id)managedBooks;
@end

@implementation MDMManagedMediaReader

+ (id)attributesByAppIDExcludeDDMApps:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [a1 _metadataByBundleIDExcludeDDMApps:a3];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "length", v18))
        {
          v10 = [v4 objectForKey:v9];
          v11 = [v10 objectForKey:@"Attributes"];
          v12 = [v10 objectForKey:@"state"];
          unsigned int v13 = [v12 intValue];

          if ((v13 > 0x12 || ((1 << v13) & 0x60C00) == 0) && v11 != 0) {
            [v18 setObject:v11 forKey:v9];
          }
        }
        else
        {
          v16 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD340000, v16, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader skipping app with blank bundleID", buf, 2u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v18;
}

+ (id)_metadataByBundleIDExcludeDDMApps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = MDMAppManagementFilePath();
  int v6 = [v4 fileExistsAtPath:v5];

  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F28F98];
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  v9 = MDMAppManagementFilePath();
  v10 = [v8 dataWithContentsOfFile:v9];
  id v30 = 0;
  v11 = [v7 DMCSafePropertyListWithData:v10 options:1 format:0 error:&v30];
  id v12 = v30;

  if (v12)
  {
    unsigned int v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v12;
      _os_log_impl(&dword_1DD340000, v13, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader cannot read manifest with error: %{public}@", buf, 0xCu);
    }
  }

  if (v11)
  {
    v14 = [v11 objectForKey:@"metadataByBundleID"];
    v15 = (void *)[v14 mutableCopy];

    if (v3)
    {
      v16 = [v15 allKeys];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            long long v22 = [v15 objectForKeyedSubscript:v21];
            long long v23 = [v22 objectForKey:@"source"];

            if (v23) {
              [v15 setObject:0 forKeyedSubscript:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v18);
      }
    }
    v24 = (void *)[v15 copy];
  }
  else
  {
LABEL_18:
    v24 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

+ (id)attributesByAppID
{
  return +[MDMManagedMediaReader attributesByAppIDExcludeDDMApps:0];
}

+ (id)managedBooks
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  BOOL v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = MDMManagedStoreBooksManifestPath();
  uint64_t v5 = [v3 dictionaryWithContentsOfFile:v4];

  if (v5)
  {
    int v6 = [v5 objectForKeyedSubscript:@"Books"];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [[MDMBook alloc] initWithManifestDictionary:*(void *)(*((void *)&v28 + 1) + 8 * i)];
            [v2 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v9);
      }
    }
  }
  unsigned int v13 = (void *)MEMORY[0x1E4F1C9E8];
  v14 = MDMManagedNonStoreBooksManifestPath();
  v15 = [v13 dictionaryWithContentsOfFile:v14];

  if (v15)
  {
    v16 = [v15 objectForKeyedSubscript:@"Books"];
    uint64_t v17 = v16;
    if (v16)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = [[MDMBook alloc] initWithManifestDictionary:*(void *)(*((void *)&v24 + 1) + 8 * j)];
            [v2 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v19);
      }
    }
  }

  return v2;
}

+ (id)managedAppIDs
{
  return +[MDMManagedMediaReader managedAppIDsExcludeDDMApps:0];
}

+ (id)managedAppIDsExcludeDDMApps:(BOOL)a3
{
  BOOL v3 = +[MDMManagedMediaReader attributesByAppIDExcludeDDMApps:a3];
  id v4 = [v3 allKeys];

  return v4;
}

+ (id)managedAppIDsWithFlags:(unint64_t)a3
{
  return +[MDMManagedMediaReader managedAppIDsWithFlags:a3 excludeDDMApps:0];
}

+ (id)managedAppIDsWithFlags:(unint64_t)a3 excludeDDMApps:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = (id)objc_opt_new();
  int v6 = +[MDMManagedMediaReader _metadataByBundleIDExcludeDDMApps:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v12 length])
          {
            unsigned int v13 = [v7 objectForKey:v12];
            v14 = [v13 objectForKey:@"flags"];
            unint64_t v15 = (int)[v14 intValue] & a3;

            if (v15) {
              [v18 addObject:v12];
            }
          }
          else
          {
            v16 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DD340000, v16, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader skipping app with blank appID", buf, 2u);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }

  return v18;
}

@end