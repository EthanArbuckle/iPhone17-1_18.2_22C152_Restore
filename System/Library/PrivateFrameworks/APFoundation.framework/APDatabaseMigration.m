@interface APDatabaseMigration
- (APDatabaseMigration)initWithDatabasePath:(id)a3;
- (APDatabasePath)databasePath;
- (NSArray)sortedScriptsURLs;
- (id)_buildSortedURLs;
- (id)_getQueriesForFileAtURL:(id)a3;
- (id)getMigrationQueriesFromVersion:(int)a3;
- (int64_t)_getVersionFromFileAtURL:(id)a3;
- (int64_t)lastVersion;
@end

@implementation APDatabaseMigration

- (APDatabaseMigration)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APDatabaseMigration;
  v6 = [(APDatabaseMigration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databasePath, a3);
    uint64_t v8 = [(APDatabaseMigration *)v7 _buildSortedURLs];
    sortedScriptsURLs = v7->_sortedScriptsURLs;
    v7->_sortedScriptsURLs = (NSArray *)v8;
  }
  return v7;
}

- (int64_t)lastVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseMigration *)self sortedScriptsURLs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(APDatabaseMigration *)self sortedScriptsURLs];
    v6 = [v5 lastObject];

    int64_t v7 = [(APDatabaseMigration *)self _getVersionFromFileAtURL:v6];
    return v7;
  }
  else
  {
    v9 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = (id)objc_opt_class();
      id v10 = v12;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No migration files found.", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
}

- (id)getMigrationQueriesFromVersion:(int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(APDatabaseMigration *)self lastVersion] == a3)
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int64_t v7 = [(APDatabaseMigration *)self sortedScriptsURLs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int64_t v10 = a3;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([(APDatabaseMigration *)self _getVersionFromFileAtURL:v13] > v10)
          {
            uint64_t v14 = [(APDatabaseMigration *)self _getQueriesForFileAtURL:v13];
            if (!v14)
            {
              v16 = APLogForCategory(0xBuLL);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v17 = objc_opt_class();
                id v18 = v17;
                v19 = [v13 absoluteString];
                *(_DWORD *)buf = 138478083;
                v26 = v17;
                __int16 v27 = 2113;
                v28 = v19;
                _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No migration queries found at path: %{private}@.", buf, 0x16u);
              }
              id v5 = 0;
              goto LABEL_17;
            }
            v15 = (void *)v14;
            [v6 addObjectsFromArray:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v5 = v6;
LABEL_17:
  }
  return v5;
}

- (id)_getQueriesForFileAtURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  if (v4)
  {
    id v16 = 0;
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v16];
    v6 = v16;
    if (v6)
    {
      int64_t v7 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        id v9 = v8;
        int64_t v10 = [v6 localizedDescription];
        *(_DWORD *)buf = 138478083;
        id v18 = v8;
        __int16 v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: Could not create dictionary from data: %{public}@.", buf, 0x16u);
      }
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [v5 objectForKey:@"Queries"];
    }
  }
  else
  {
    v6 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      uint64_t v14 = [v3 absoluteString];
      *(_DWORD *)buf = 138478083;
      id v18 = v12;
      __int16 v19 = 2113;
      v20 = v14;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No data found at path: %{private}@.", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_buildSortedURLs
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [(APDatabaseMigration *)self databasePath];
  id v3 = [v2 migrationScriptsPath];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v20[0] = *MEMORY[0x1E4F1C6E8];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v15 = 0;
    int64_t v7 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:4 error:&v15];
    id v8 = v15;

    if (v8)
    {
      id v9 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int64_t v10 = objc_opt_class();
        id v11 = v10;
        id v12 = [v8 localizedDescription];
        *(_DWORD *)buf = 138478083;
        v17 = v10;
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: Could not get contents of directory: %{public}@.", buf, 0x16u);
      }
      id v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v13 = [v7 sortedArrayUsingComparator:&unk_1F2E9CB70];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (int64_t)_getVersionFromFileAtURL:(id)a3
{
  id v3 = [a3 lastPathComponent];
  uint64_t v4 = [v3 stringByDeletingPathExtension];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (APDatabasePath)databasePath
{
  return self->_databasePath;
}

- (NSArray)sortedScriptsURLs
{
  return self->_sortedScriptsURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedScriptsURLs, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end