@interface MPModelStaticAsset
+ (id)__duration_KEY;
+ (id)__flavorType_KEY;
+ (id)__mediaType_KEY;
+ (id)__url_KEY;
+ (void)__MPModelPropertyStaticAssetDuration__MAPPING_MISSING__;
+ (void)__MPModelPropertyStaticAssetFlavorType__MAPPING_MISSING__;
+ (void)__MPModelPropertyStaticAssetMediaType__MAPPING_MISSING__;
+ (void)__MPModelPropertyStaticAssetURL__MAPPING_MISSING__;
@end

@implementation MPModelStaticAsset

+ (void)__MPModelPropertyStaticAssetURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStaticAsset.m" lineNumber:28 description:@"Translator was missing mapping for MPModelPropertyStaticAssetURL"];
}

+ (id)__url_KEY
{
  return @"MPModelPropertyStaticAssetURL";
}

+ (void)__MPModelPropertyStaticAssetMediaType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStaticAsset.m" lineNumber:27 description:@"Translator was missing mapping for MPModelPropertyStaticAssetMediaType"];
}

+ (id)__mediaType_KEY
{
  return @"MPModelPropertyStaticAssetMediaType";
}

+ (void)__MPModelPropertyStaticAssetFlavorType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStaticAsset.m" lineNumber:26 description:@"Translator was missing mapping for MPModelPropertyStaticAssetFlavorType"];
}

+ (id)__flavorType_KEY
{
  return @"MPModelPropertyStaticAssetFlavorType";
}

+ (void)__MPModelPropertyStaticAssetDuration__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStaticAsset.m" lineNumber:25 description:@"Translator was missing mapping for MPModelPropertyStaticAssetDuration"];
}

+ (id)__duration_KEY
{
  return @"MPModelPropertyStaticAssetDuration";
}

@end