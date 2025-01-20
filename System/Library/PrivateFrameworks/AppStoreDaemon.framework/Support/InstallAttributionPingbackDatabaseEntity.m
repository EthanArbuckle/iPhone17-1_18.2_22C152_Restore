@interface InstallAttributionPingbackDatabaseEntity
+ (id)databaseTable;
@end

@implementation InstallAttributionPingbackDatabaseEntity

+ (id)databaseTable
{
  return @"install_attribution_pingbacks";
}

@end