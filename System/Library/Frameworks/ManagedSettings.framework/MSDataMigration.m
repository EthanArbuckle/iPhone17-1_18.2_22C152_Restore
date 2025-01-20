@interface MSDataMigration
+ (BOOL)isUpgradeDisposition;
@end

@implementation MSDataMigration

+ (BOOL)isUpgradeDisposition
{
  return (DMGetUserDataDisposition() >> 1) & 1;
}

@end