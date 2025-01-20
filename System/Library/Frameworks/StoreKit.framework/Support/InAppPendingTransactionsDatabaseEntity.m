@interface InAppPendingTransactionsDatabaseEntity
+ (id)databaseTable;
@end

@implementation InAppPendingTransactionsDatabaseEntity

+ (id)databaseTable
{
  return @"iap_pending_transactions";
}

@end