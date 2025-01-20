@interface NSError(sqlite3)
+ (__CFString)errorMessageForSQLite3Context:()sqlite3;
+ (id)hmbErrorWithSQLite3Connection:()sqlite3;
+ (id)hmbErrorWithSQLite3Connection:()sqlite3 statement:;
+ (id)hmbErrorWithSQLite3Statement:()sqlite3;
+ (id)hmbErrorWithSQLite3Status:()sqlite3;
+ (uint64_t)hmbErrorWithSQLContext:()sqlite3;
+ (uint64_t)hmbErrorWithSQLContext:()sqlite3 statement:;
@end

@implementation NSError(sqlite3)

+ (__CFString)errorMessageForSQLite3Context:()sqlite3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = sqlite3_errmsg(a3);
  if (v4)
  {
    v5 = v4;
    v6 = [NSString stringWithUTF8String:v4];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = [NSString stringWithCString:v5 encoding:1];
      v10 = v9;
      if (v9)
      {
        v8 = v9;
      }
      else
      {
        v11 = (void *)MEMORY[0x1D944CB30]();
        id v12 = a1;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = HMFGetLogIdentifier();
          int v16 = 138543618;
          v17 = v14;
          __int16 v18 = 2080;
          v19 = v5;
          _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not convert SQLite error into NSString: %s", (uint8_t *)&v16, 0x16u);
        }
        v8 = @"<Unknown SQLite3 error>";
      }
    }
  }
  else
  {
    v8 = @"<NULL SQLite3 error>";
  }
  return v8;
}

+ (id)hmbErrorWithSQLite3Status:()sqlite3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F64ED0];
  v14[0] = @"extcode";
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
  v14[1] = @"text";
  v15[0] = v6;
  v7 = NSString;
  v8 = sqlite3_errstr(a3);
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = "NULL SQLite3 error for status";
  }
  v10 = [v7 stringWithUTF8String:v9];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = [v4 errorWithDomain:v5 code:3 userInfo:v11];

  return v12;
}

+ (id)hmbErrorWithSQLite3Statement:()sqlite3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F64ED0];
  v18[0] = @"extcode";
  v7 = (void *)MEMORY[0x1E4F28ED0];
  v8 = sqlite3_db_handle(a3);
  v9 = [v7 numberWithInt:sqlite3_errcode(v8)];
  v19[0] = v9;
  v18[1] = @"text";
  v10 = [a1 errorMessageForSQLite3Context:sqlite3_db_handle(a3)];
  v19[1] = v10;
  v18[2] = @"statement";
  v11 = NSString;
  id v12 = sqlite3_sql(a3);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = "NULL SQLite3 statement";
  }
  v14 = [v11 stringWithUTF8String:v13];
  v19[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  int v16 = [v5 errorWithDomain:v6 code:3 userInfo:v15];

  return v16;
}

+ (id)hmbErrorWithSQLite3Connection:()sqlite3 statement:
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F64ED0];
  v16[0] = @"extcode";
  v9 = [MEMORY[0x1E4F28ED0] numberWithInt:sqlite3_errcode(db)];
  v17[0] = v9;
  v16[1] = @"text";
  v10 = [a1 errorMessageForSQLite3Context:db];
  v17[1] = v10;
  v16[2] = @"statement";
  if (a4) {
    v11 = a4;
  }
  else {
    v11 = "NULL statement";
  }
  id v12 = [NSString stringWithUTF8String:v11];
  v17[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v14 = [v7 errorWithDomain:v8 code:3 userInfo:v13];

  return v14;
}

+ (id)hmbErrorWithSQLite3Connection:()sqlite3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F64ED0];
  v14[0] = @"extcode";
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:sqlite3_errcode(db)];
  v14[1] = @"text";
  v15[0] = v6;
  v7 = NSString;
  uint64_t v8 = sqlite3_errmsg(db);
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = "NULL SQLite3 error for context";
  }
  v10 = [v7 stringWithUTF8String:v9];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = [v4 errorWithDomain:v5 code:3 userInfo:v11];

  return v12;
}

+ (uint64_t)hmbErrorWithSQLContext:()sqlite3 statement:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = [a3 connection];
  return [v5 hmbErrorWithSQLite3Connection:v6 statement:a4];
}

+ (uint64_t)hmbErrorWithSQLContext:()sqlite3
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = [a3 connection];
  return [v3 hmbErrorWithSQLite3Connection:v4];
}

@end