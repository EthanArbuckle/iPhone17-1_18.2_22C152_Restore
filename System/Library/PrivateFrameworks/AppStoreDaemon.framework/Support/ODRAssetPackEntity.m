@interface ODRAssetPackEntity
+ (id)databaseTable;
@end

@implementation ODRAssetPackEntity

+ (id)databaseTable
{
  return @"odr_asset_pack";
}

@end