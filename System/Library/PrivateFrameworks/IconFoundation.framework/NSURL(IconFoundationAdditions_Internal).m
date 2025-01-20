@interface NSURL(IconFoundationAdditions_Internal)
+ (id)coreGlyphsBundleURL;
+ (id)coreGlyphsPrivateBundleURL;
@end

@implementation NSURL(IconFoundationAdditions_Internal)

+ (id)coreGlyphsBundleURL
{
  if (coreGlyphsBundleURL_onceToken != -1) {
    dispatch_once(&coreGlyphsBundleURL_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)coreGlyphsBundleURL_url;

  return v0;
}

+ (id)coreGlyphsPrivateBundleURL
{
  if (coreGlyphsPrivateBundleURL_onceToken != -1) {
    dispatch_once(&coreGlyphsPrivateBundleURL_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)coreGlyphsPrivateBundleURL_url;

  return v0;
}

@end