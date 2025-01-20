@interface NSUUID(sqlite3)
+ (__int128)hmbUUIDWithSQLite3Column:()sqlite3 column:;
@end

@implementation NSUUID(sqlite3)

+ (__int128)hmbUUIDWithSQLite3Column:()sqlite3 column:
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = (long long *)sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    v7 = v6;
    if (sqlite3_column_bytes(a3, iCol) == 16)
    {
      long long v9 = *v7;
      v6 = (long long *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v9];
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

@end