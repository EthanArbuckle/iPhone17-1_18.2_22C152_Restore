@interface ODRAssetDownloadEntity
+ (id)databaseTable;
@end

@implementation ODRAssetDownloadEntity

+ (id)databaseTable
{
  return @"odr_asset_download";
}

@end