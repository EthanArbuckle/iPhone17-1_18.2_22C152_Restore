@interface CCDatabaseInsert
+ (id)builderWithTableName:(id)a3 columnNames:(id)a4;
@end

@implementation CCDatabaseInsert

+ (id)builderWithTableName:(id)a3 columnNames:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CCDatabaseInsertBuilder alloc] initWithTableName:v6 columnNames:v5];

  return v7;
}

@end