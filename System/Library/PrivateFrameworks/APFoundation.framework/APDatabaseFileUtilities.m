@interface APDatabaseFileUtilities
+ (void)_moveCorruptedFileAtPath:(id)a3;
+ (void)removeDatabaseAtPath:(id)a3;
@end

@implementation APDatabaseFileUtilities

+ (void)removeDatabaseAtPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 databaseDirectory];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    id v13 = 0;
    char v6 = [v5 removeItemAtPath:v4 error:&v13];
    id v7 = v13;
    if ((v6 & 1) == 0)
    {
      v8 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        id v10 = v9;
        v11 = [v7 localizedFailureReason];
        v12 = [v7 userInfo];
        *(_DWORD *)buf = 138478339;
        v15 = v9;
        __int16 v16 = 2114;
        v17 = v11;
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to Remove Database: %{public}@ %{public}@", buf, 0x20u);
      }
      +[APDatabaseFileUtilities _moveCorruptedFileAtPath:v3];
    }
  }
}

+ (void)_moveCorruptedFileAtPath:(id)a3
{
  id v4 = a3;
  v5 = dispatch_queue_create("com.apple.ap.database.corruptedfile.queue", 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D70D8A94;
  v7[3] = &unk_1E6A6BA80;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

@end