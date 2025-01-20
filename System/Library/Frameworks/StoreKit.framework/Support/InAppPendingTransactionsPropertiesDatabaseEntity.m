@interface InAppPendingTransactionsPropertiesDatabaseEntity
+ (id)databaseTable;
@end

@implementation InAppPendingTransactionsPropertiesDatabaseEntity

+ (id)databaseTable
{
  return @"iap_pending_transactions_properties";
}

@end