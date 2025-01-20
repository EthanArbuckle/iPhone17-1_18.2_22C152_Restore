@interface CCDatabaseUpdate
+ (id)builderWithTableName:(id)a3;
@end

@implementation CCDatabaseUpdate

+ (id)builderWithTableName:(id)a3
{
  id v3 = a3;
  v4 = [[CCDatabaseUpdateBuilder alloc] initWithTableName:v3];

  return v4;
}

@end