@interface StoreKitMessagesDatabaseEntity
+ (id)databaseTable;
@end

@implementation StoreKitMessagesDatabaseEntity

+ (id)databaseTable
{
  return @"storekit_messages";
}

@end