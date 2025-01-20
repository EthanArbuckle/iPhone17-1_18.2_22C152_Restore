@interface PurchaseHistoryAppEntity
+ (id)databaseTable;
@end

@implementation PurchaseHistoryAppEntity

+ (id)databaseTable
{
  return @"purchase_history_apps";
}

@end