@interface InAppPromotionDatabaseEntity
+ (id)databaseTable;
@end

@implementation InAppPromotionDatabaseEntity

+ (id)databaseTable
{
  return @"promoted_iaps";
}

@end