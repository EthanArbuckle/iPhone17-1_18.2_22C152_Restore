@interface PBCodable(BRCProtocolBufferAdditions)
+ (uint64_t)newFromSqliteStatement:()BRCProtocolBufferAdditions atIndex:;
+ (uint64_t)newFromSqliteValue:()BRCProtocolBufferAdditions;
- (void)sqliteBind:()BRCProtocolBufferAdditions index:;
@end

@implementation PBCodable(BRCProtocolBufferAdditions)

- (void)sqliteBind:()BRCProtocolBufferAdditions index:
{
  id v6 = [a1 data];
  [v6 sqliteBind:a3 index:a4];
}

+ (uint64_t)newFromSqliteValue:()BRCProtocolBufferAdditions
{
  if (sqlite3_value_type(a3) != 4) {
    return 0;
  }
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteValue:a3];
  uint64_t v6 = [v4 initWithData:v5];

  return v6;
}

+ (uint64_t)newFromSqliteStatement:()BRCProtocolBufferAdditions atIndex:
{
  if (sqlite3_column_type(a3, iCol) != 4) {
    return 0;
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteStatement:a3 atIndex:iCol];
  uint64_t v8 = [v6 initWithData:v7];

  return v8;
}

@end