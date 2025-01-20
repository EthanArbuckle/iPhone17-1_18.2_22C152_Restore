@interface NSData(sqlite3)
+ (id)dataWithSQLite3Column:()sqlite3 column:;
+ (id)dataWithSQLite3ColumnNoCopy:()sqlite3 column:;
@end

@implementation NSData(sqlite3)

+ (id)dataWithSQLite3Column:()sqlite3 column:
{
  v6 = sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v6, sqlite3_column_bytes(a3, iCol));
  }
  else if (sqlite3_column_type(a3, iCol) == 5)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263EFF8F8] data];
  }
  return v7;
}

+ (id)dataWithSQLite3ColumnNoCopy:()sqlite3 column:
{
  v6 = sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v6, sqlite3_column_bytes(a3, iCol), 0);
  }
  else if (sqlite3_column_type(a3, iCol) == 5)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263EFF8F8] data];
  }
  return v7;
}

@end