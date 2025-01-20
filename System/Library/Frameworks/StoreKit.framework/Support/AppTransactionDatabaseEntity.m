@interface AppTransactionDatabaseEntity
+ (id)databaseTable;
@end

@implementation AppTransactionDatabaseEntity

+ (id)databaseTable
{
  return @"app_receipts";
}

@end