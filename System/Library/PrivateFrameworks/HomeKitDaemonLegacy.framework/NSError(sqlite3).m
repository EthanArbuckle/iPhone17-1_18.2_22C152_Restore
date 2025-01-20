@interface NSError(sqlite3)
+ (id)errorWithSQLite3Context:()sqlite3;
+ (id)errorWithSQLite3Context:()sqlite3 statement:;
+ (id)errorWithSQLite3Statement:()sqlite3;
@end

@implementation NSError(sqlite3)

+ (id)errorWithSQLite3Statement:()sqlite3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F64ED0];
  v16[0] = @"extcode";
  v6 = NSNumber;
  v7 = sqlite3_db_handle(a3);
  v8 = [v6 numberWithInt:sqlite3_errcode(v7)];
  v17[0] = v8;
  v16[1] = @"text";
  v9 = NSString;
  v10 = sqlite3_db_handle(a3);
  v11 = [v9 stringWithUTF8String:sqlite3_errmsg(v10)];
  v17[1] = v11;
  v16[2] = @"statement";
  v12 = [NSString stringWithUTF8String:sqlite3_sql(a3)];
  v17[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v14 = [v4 errorWithDomain:v5 code:3 userInfo:v13];

  return v14;
}

+ (id)errorWithSQLite3Context:()sqlite3 statement:
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F64ED0];
  v14[0] = @"extcode";
  v8 = [NSNumber numberWithInt:sqlite3_errcode(db)];
  v15[0] = v8;
  v14[1] = @"text";
  v9 = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
  v15[1] = v9;
  v14[2] = @"statement";
  v10 = [NSString stringWithUTF8String:a4];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v12 = [v6 errorWithDomain:v7 code:3 userInfo:v11];

  return v12;
}

+ (id)errorWithSQLite3Context:()sqlite3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F64ED0];
  v11[0] = @"extcode";
  v6 = [NSNumber numberWithInt:sqlite3_errcode(db)];
  v11[1] = @"text";
  v12[0] = v6;
  uint64_t v7 = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v9 = [v4 errorWithDomain:v5 code:3 userInfo:v8];

  return v9;
}

@end