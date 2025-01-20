@interface NSFileManager
- (uint64_t)_hd_removeDatabaseFilesAtDatabaseURL:(void *)a3 extensionSuffixes:(int)a4 preserveCopy:;
@end

@implementation NSFileManager

- (uint64_t)_hd_removeDatabaseFilesAtDatabaseURL:(void *)a3 extensionSuffixes:(int)a4 preserveCopy:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v37 = v7;
  v38 = v6;
  if (a1)
  {
    v8 = v7;
    if (!v6)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:sel__hd_removeDatabaseFilesAtDatabaseURL_extensionSuffixes_preserveCopy_, a1, @"NSFileManager+HealthDaemon.m", 29, @"Invalid parameter not satisfying: %@", @"databaseURL != nil" object file lineNumber description];
    }
    if (![v8 count])
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:sel__hd_removeDatabaseFilesAtDatabaseURL_extensionSuffixes_preserveCopy_, a1, @"NSFileManager+HealthDaemon.m", 30, @"Invalid parameter not satisfying: %@", @"[extensionsSuffixes count] > 0" object file lineNumber description];
    }
    v9 = [v6 lastPathComponent];
    v10 = [v6 URLByDeletingLastPathComponent];
    v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [v9 stringByAppendingString:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          v18 = [v10 URLByAppendingPathComponent:v17];
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v14);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v11;
    uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      char v39 = 1;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (a4)
          {
            uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lf.moved-aside", CFAbsoluteTimeGetCurrent());
            v25 = [v23 URLByAppendingPathExtension:v24];

            id v43 = 0;
            LOBYTE(v24) = [a1 copyItemAtURL:v23 toURL:v25 error:&v43];
            id v26 = v43;
            v27 = v26;
            if ((v24 & 1) == 0 && (objc_msgSend(v26, "hk_isCocoaNoSuchFileError") & 1) == 0)
            {
              _HKInitializeLogging();
              v28 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v53 = v27;
                _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Failed to preserve copy of database file: %{public}@", buf, 0xCu);
              }
            }
          }
          id v42 = 0;
          char v29 = [a1 removeItemAtURL:v23 error:&v42];
          id v30 = v42;
          v31 = v30;
          if (v29)
          {
            _HKInitializeLogging();
            v32 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v23;
              _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "Deleted database file at URL \"%{public}@\"", buf, 0xCu);
            }
          }
          else if ((objc_msgSend(v30, "hk_isCocoaNoSuchFileError") & 1) == 0)
          {
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = v23;
              __int16 v54 = 2114;
              v55 = v31;
              _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Failed to delete file at URL \"%{public}@\": %{public}@", buf, 0x16u);
            }
            char v39 = 0;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v20);
    }
    else
    {
      char v39 = 1;
    }
  }
  else
  {
    char v39 = 0;
  }

  return v39 & 1;
}

@end