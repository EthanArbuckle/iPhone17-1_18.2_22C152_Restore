@interface InstallAttributionPingbackFetchInfoDatabaseEntity
+ (id)databaseTable;
@end

@implementation InstallAttributionPingbackFetchInfoDatabaseEntity

+ (id)databaseTable
{
  return @"install_attribution_pingback_fetch_info";
}

@end