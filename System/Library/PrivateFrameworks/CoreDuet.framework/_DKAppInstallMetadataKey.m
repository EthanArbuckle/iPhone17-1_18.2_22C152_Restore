@interface _DKAppInstallMetadataKey
+ (id)isInstall;
+ (id)primaryCategory;
+ (id)subCategories;
+ (id)title;
@end

@implementation _DKAppInstallMetadataKey

+ (id)title
{
  return @"_DKAppInstallMetadataKey-title";
}

+ (id)isInstall
{
  return @"_DKAppInstallMetadataKey-isInstall";
}

+ (id)primaryCategory
{
  return @"_DKAppInstallMetadataKey-primaryCategory";
}

+ (id)subCategories
{
  return @"_DKAppInstallMetadataKey-subCategories";
}

@end