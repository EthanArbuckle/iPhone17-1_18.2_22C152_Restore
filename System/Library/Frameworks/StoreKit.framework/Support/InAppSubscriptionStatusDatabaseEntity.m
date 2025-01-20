@interface InAppSubscriptionStatusDatabaseEntity
+ (id)databaseTable;
@end

@implementation InAppSubscriptionStatusDatabaseEntity

+ (id)databaseTable
{
  return @"iap_subscription_status";
}

@end