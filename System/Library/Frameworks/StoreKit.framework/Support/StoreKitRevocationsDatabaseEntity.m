@interface StoreKitRevocationsDatabaseEntity
+ (id)databaseTable;
@end

@implementation StoreKitRevocationsDatabaseEntity

+ (id)databaseTable
{
  return @"storekit_revocations";
}

@end