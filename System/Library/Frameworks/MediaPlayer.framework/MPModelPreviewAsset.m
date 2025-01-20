@interface MPModelPreviewAsset
+ (id)__assetURL_KEY;
+ (void)__MPModelPropertyPreviewAssetURL__MAPPING_MISSING__;
@end

@implementation MPModelPreviewAsset

+ (void)__MPModelPropertyPreviewAssetURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPreviewAsset.m" lineNumber:17 description:@"Translator was missing mapping for MPModelPropertyPreviewAssetURL"];
}

+ (id)__assetURL_KEY
{
  return @"MPModelPropertyPreviewAssetURL";
}

@end