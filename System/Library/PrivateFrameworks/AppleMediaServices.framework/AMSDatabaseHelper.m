@interface AMSDatabaseHelper
+ (BOOL)_addSkipBackupAttribute:(BOOL)a3 forURL:(id)a4;
+ (BOOL)removeDatabaseAtURL:(id)a3;
+ (BOOL)removeDatabaseForCachePath:(id)a3;
+ (BOOL)removeDatabaseForDataVaultPath:(id)a3;
+ (id)_cachesURLForCachePath:(id)a3;
+ (id)_databaseNameForType:(int64_t)a3;
+ (id)dataVaultURLForDataVaultPath:(id)a3;
+ (id)databaseFolderNameForType:(int64_t)a3;
+ (id)databasePathForCachePath:(id)a3 type:(int64_t)a4;
+ (id)databasePathForDataVaultPath:(id)a3 type:(int64_t)a4;
+ (id)databaseURLForCachePath:(id)a3 type:(int64_t)a4;
+ (id)databaseURLForDataVaultPath:(id)a3 type:(int64_t)a4;
+ (void)_applyProtectionClassForDirectoryAtURL:(id)a3;
@end

@implementation AMSDatabaseHelper

+ (id)databaseFolderNameForType:(int64_t)a3
{
  if (_MergedGlobals_95 != -1) {
    dispatch_once(&_MergedGlobals_95, &__block_literal_global_36);
  }
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = (id)qword_1EB38D778;
  v6 = [v4 numberWithInteger:a3];
  v7 = [v5 objectForKey:v6];

  return v7;
}

+ (id)databasePathForCachePath:(id)a3 type:(int64_t)a4
{
  v4 = [a1 databaseURLForCachePath:a3 type:a4];
  id v5 = [v4 path];

  return v5;
}

+ (id)databasePathForDataVaultPath:(id)a3 type:(int64_t)a4
{
  v4 = [a1 databaseURLForDataVaultPath:a3 type:a4];
  id v5 = [v4 path];

  return v5;
}

+ (id)databaseURLForDataVaultPath:(id)a3 type:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = [a1 dataVaultURLForDataVaultPath:a3];
  if (v6)
  {
    v7 = [a1 _databaseNameForType:a4];
    v8 = [v6 URLByAppendingPathComponent:v7];

    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSHashIfNeeded(v8);
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Database location = %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dataVaultURLForDataVaultPath:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(a2);
    v10 = AMSHashIfNeeded(v9);
    uint64_t v11 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v8;
    __int16 v30 = 2114;
    v31 = v10;
    __int16 v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ | dataVaultPath = %{public}@", buf, 0x20u);
  }
  BOOL v12 = +[AMSUnitTests isRunningUnitTests];
  v13 = (void *)MEMORY[0x1E4F1CB10];
  if (!v12)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "ams_dataVaultDirectory");
    if (v15) {
      goto LABEL_7;
    }
LABEL_15:
    id v25 = 0;
    goto LABEL_16;
  }
  int v14 = NSTemporaryDirectory();
  uint64_t v15 = [v13 fileURLWithPath:v14];

  if (!v15) {
    goto LABEL_15;
  }
LABEL_7:
  __int16 v16 = [v15 URLByAppendingPathComponent:v5];

  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = 0;
  char v18 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v27];
  id v19 = v27;

  if ((v18 & 1) == 0)
  {
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSHashIfNeeded(v5);
      v24 = AMSLogableError(v19);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      v31 = v23;
      __int16 v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create %{public}@ directory in data vault. error = %{public}@", buf, 0x20u);
    }
  }
  [a1 _addSkipBackupAttribute:1 forURL:v16];
  id v25 = v16;

LABEL_16:
  return v25;
}

+ (id)_cachesURLForCachePath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "ams_cachesDirectory");
  if (v5)
  {
    v6 = v5;
    v7 = [v5 URLByAppendingPathComponent:v4];

    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [v7 absoluteString];
    char v10 = [v8 fileExistsAtPath:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v19 = 0;
      int v12 = [v11 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v19];
      id v13 = v19;

      if (!v12 || v13)
      {
        int v14 = +[AMSLogConfig sharedConfig];
        if (!v14)
        {
          int v14 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v15 = [v14 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = objc_opt_class();
          v17 = AMSLogableError(v13);
          *(_DWORD *)buf = 138543874;
          uint64_t v21 = v16;
          __int16 v22 = 2114;
          id v23 = v4;
          __int16 v24 = 2114;
          id v25 = v17;
          _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create %{public}@ directory. Error = %{public}@", buf, 0x20u);
        }
      }
    }
    [a1 _applyProtectionClassForDirectoryAtURL:v7];
    [a1 _addSkipBackupAttribute:1 forURL:v7];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_addSkipBackupAttribute:(BOOL)a3 forURL:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v9 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error excluding nil URL from backup", buf, 0xCu);
    }
    goto LABEL_13;
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  uint64_t v7 = *MEMORY[0x1E4F1C630];
  id v16 = 0;
  char v8 = [v5 setResourceValue:v6 forKey:v7 error:&v16];
  id v9 = v16;

  if ((v8 & 1) == 0)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error excluding %{public}@ from backup %{public}@", buf, 0x20u);
    }
LABEL_13:

    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

+ (id)databaseURLForCachePath:(id)a3 type:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = [a1 _cachesURLForCachePath:a3];
  if (v6)
  {
    uint64_t v7 = [a1 _databaseNameForType:a4];
    char v8 = [v6 URLByAppendingPathComponent:v7];

    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    BOOL v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = AMSHashIfNeeded(v8);
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Database location = %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)_databaseNameForType:(int64_t)a3
{
  if (qword_1EB38D780 != -1) {
    dispatch_once(&qword_1EB38D780, &__block_literal_global_25);
  }
  BOOL v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = (id)qword_1EB38D788;
  v6 = [v4 numberWithInteger:a3];
  uint64_t v7 = [v5 objectForKey:v6];

  char v8 = [v7 stringByAppendingPathExtension:@"sqlitedb"];

  return v8;
}

+ (void)_applyProtectionClassForDirectoryAtURL:(id)a3
{
  v3 = [a3 path];
  if (v3)
  {
    id v5 = v3;
    int v4 = open((const char *)[v3 UTF8String], 0x1000000);
    v3 = v5;
    if (v4)
    {
      fcntl(v4, 64, 4);
      close(v4);
      v3 = v5;
    }
  }
}

void __47__AMSDatabaseHelper_databaseFolderNameForType___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EDD010F0;
  v2[1] = &unk_1EDD01108;
  v3[0] = @"Metrics";
  v3[1] = @"Storage";
  v2[2] = &unk_1EDD01120;
  v2[3] = &unk_1EDD01138;
  v3[2] = @"Accounts";
  v3[3] = @"Engagement";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)qword_1EB38D778;
  qword_1EB38D778 = v0;
}

void __42__AMSDatabaseHelper__databaseNameForType___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EDD010F0;
  v2[1] = &unk_1EDD01108;
  v3[0] = @"metrics";
  v3[1] = @"storage";
  v2[2] = &unk_1EDD01120;
  v2[3] = &unk_1EDD01138;
  v3[2] = @"cookies";
  v3[3] = @"engagement";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)qword_1EB38D788;
  qword_1EB38D788 = v0;
}

+ (BOOL)removeDatabaseForCachePath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _cachesURLForCachePath:v4];
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    char v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      BOOL v10 = AMSHashIfNeeded(v5);
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@: Removing database at cache URL: %{public}@.", (uint8_t *)&v14, 0x16u);
    }
    BOOL v11 = +[AMSDatabaseHelper removeDatabaseAtURL:v5];
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v7 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at path: %{public}@. Unable to determine the URL.", (uint8_t *)&v14, 0x16u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)removeDatabaseForDataVaultPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 dataVaultURLForDataVaultPath:v4];
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    char v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      BOOL v10 = AMSHashIfNeeded(v5);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@: Removing database at data vault URL: %{public}@.", (uint8_t *)&v16, 0x16u);
    }
    BOOL v11 = +[AMSDatabaseHelper removeDatabaseAtURL:v5];
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v7 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSHashIfNeeded(v4);
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at data vault path: %{public}@. Unable to determine the URL.", (uint8_t *)&v16, 0x16u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)removeDatabaseAtURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  int v5 = [v4 removeItemAtURL:v3 error:&v16];
  id v6 = v16;

  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  uint64_t v8 = +[AMSLogConfig sharedConfig];
  uint64_t v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    BOOL v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@: Successfully removed database at URL: %{public}@.", buf, 0x16u);
LABEL_13:
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    BOOL v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v12 = AMSHashIfNeeded(v3);
      int v14 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove database at URL: %{public}@. Error = %{public}@", buf, 0x20u);

      goto LABEL_13;
    }
  }

  return v7;
}

@end