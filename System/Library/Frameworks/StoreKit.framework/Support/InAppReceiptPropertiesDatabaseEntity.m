@interface InAppReceiptPropertiesDatabaseEntity
+ (id)databaseTable;
@end

@implementation InAppReceiptPropertiesDatabaseEntity

+ (id)databaseTable
{
  return @"iap_receipts_properties";
}

@end