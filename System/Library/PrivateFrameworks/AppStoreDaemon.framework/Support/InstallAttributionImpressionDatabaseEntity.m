@interface InstallAttributionImpressionDatabaseEntity
+ (id)databaseTable;
@end

@implementation InstallAttributionImpressionDatabaseEntity

+ (id)databaseTable
{
  return @"install_attribution_impression";
}

@end