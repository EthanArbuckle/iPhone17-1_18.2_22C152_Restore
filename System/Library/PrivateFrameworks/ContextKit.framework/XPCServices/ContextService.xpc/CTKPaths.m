@interface CTKPaths
+ (id)assetTypeDescriptor;
+ (id)database;
@end

@implementation CTKPaths

+ (id)database
{
  return @"/var/db/ContextKit";
}

+ (id)assetTypeDescriptor
{
  return [@"/System/Library/AssetTypeDescriptors" stringByAppendingPathComponent:@"com.apple.MobileAsset.AssetTypeDescriptor.ContextKit.plist"];
}

@end