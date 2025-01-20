@interface InstallAttributionParamsDatabaseEntity
+ (id)databaseTable;
@end

@implementation InstallAttributionParamsDatabaseEntity

+ (id)databaseTable
{
  return @"install_attribution_params";
}

@end