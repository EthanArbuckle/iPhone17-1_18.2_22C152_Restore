@interface MPModelHomeSharingAsset
+ (id)__URL_KEY;
+ (id)__available_KEY;
+ (id)__protectedContentSupportStorageFileURL_KEY;
+ (void)__MPModelPropertyHomeSharingAssetAvailable__MAPPING_MISSING__;
+ (void)__MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyHomeSharingAssetURL__MAPPING_MISSING__;
@end

@implementation MPModelHomeSharingAsset

+ (id)__protectedContentSupportStorageFileURL_KEY
{
  return @"MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL";
}

+ (id)__available_KEY
{
  return @"MPModelPropertyHomeSharingAssetAvailable";
}

+ (id)__URL_KEY
{
  return @"MPModelPropertyHomeSharingAssetURL";
}

+ (void)__MPModelPropertyHomeSharingAssetURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelHomeSharingAsset.m" lineNumber:20 description:@"Translator was missing mapping for MPModelPropertyHomeSharingAssetURL"];
}

+ (void)__MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelHomeSharingAsset.m" lineNumber:19 description:@"Translator was missing mapping for MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL"];
}

+ (void)__MPModelPropertyHomeSharingAssetAvailable__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelHomeSharingAsset.m" lineNumber:18 description:@"Translator was missing mapping for MPModelPropertyHomeSharingAssetAvailable"];
}

@end