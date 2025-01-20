@interface NSString(sqlite3)
+ (id)stringWithSQLite3Column:()sqlite3 column:;
@end

@implementation NSString(sqlite3)

+ (id)stringWithSQLite3Column:()sqlite3 column:
{
  v4 = (void *)sqlite3_column_text(a3, iCol);
  if (v4)
  {
    v4 = [NSString stringWithUTF8String:v4];
  }
  return v4;
}

@end