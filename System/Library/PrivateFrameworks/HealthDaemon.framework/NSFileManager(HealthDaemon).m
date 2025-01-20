@interface NSFileManager(HealthDaemon)
- (uint64_t)hd_removeAllFilesAtDirectoryPath:()HealthDaemon error:;
- (uint64_t)hd_removeHFDDatabaseAtURL:()HealthDaemon preserveCopy:;
- (uint64_t)hd_removeSQLiteDatabaseAtURL:()HealthDaemon preserveCopy:;
@end

@implementation NSFileManager(HealthDaemon)

- (uint64_t)hd_removeSQLiteDatabaseAtURL:()HealthDaemon preserveCopy:
{
  return -[NSFileManager _hd_removeDatabaseFilesAtDatabaseURL:extensionSuffixes:preserveCopy:](a1, a3, &unk_1F17EAD40, a4);
}

- (uint64_t)hd_removeHFDDatabaseAtURL:()HealthDaemon preserveCopy:
{
  return -[NSFileManager _hd_removeDatabaseFilesAtDatabaseURL:extensionSuffixes:preserveCopy:](a1, a3, &unk_1F17EAD58, a4);
}

- (uint64_t)hd_removeAllFilesAtDirectoryPath:()HealthDaemon error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = [a1 enumeratorAtPath:v6];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v8)
  {
    char v19 = 1;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v9 = v8;
  v21 = a4;
  id v10 = 0;
  uint64_t v11 = *(void *)v25;
  char v22 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      id v23 = 0;
      char v14 = [a1 removeItemAtPath:v13 error:&v23];
      id v15 = v23;
      v16 = v15;
      if ((v14 & 1) == 0)
      {
        if (!v10) {
          id v10 = v15;
        }
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v29 = v13;
          __int16 v30 = 2114;
          v31 = v16;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Error removing file at '%{public}@': %{public}@", buf, 0x16u);
        }
        char v22 = 0;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v9);

  id v18 = v10;
  if (v18)
  {
    v7 = v18;
    if (v21) {
      void *v21 = v18;
    }
    else {
      _HKLogDroppedError();
    }
    char v19 = v22;

    goto LABEL_21;
  }
  char v19 = v22;
LABEL_22:

  return v19 & 1;
}

@end