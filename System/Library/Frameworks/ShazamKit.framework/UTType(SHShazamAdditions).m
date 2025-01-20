@interface UTType(SHShazamAdditions)
+ (id)SHCustomCatalogContentType;
+ (id)SHSignatureContentType;
@end

@implementation UTType(SHShazamAdditions)

+ (id)SHSignatureContentType
{
  if (SHSignatureContentType_onceToken != -1) {
    dispatch_once(&SHSignatureContentType_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)SHSignatureContentType_signatureType;

  return v0;
}

+ (id)SHCustomCatalogContentType
{
  if (SHCustomCatalogContentType_onceToken != -1) {
    dispatch_once(&SHCustomCatalogContentType_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)SHCustomCatalogContentType_catalogType;

  return v0;
}

@end