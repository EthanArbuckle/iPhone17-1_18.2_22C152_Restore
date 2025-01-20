@interface ODRManifestEntity
+ (id)databaseTable;
@end

@implementation ODRManifestEntity

+ (id)databaseTable
{
  return @"odr_manifest";
}

@end