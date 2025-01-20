@interface UTType
@end

@implementation UTType

uint64_t __51__UTType_SHShazamAdditions__SHSignatureContentType__block_invoke()
{
  SHSignatureContentType_signatureType = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.shazamsignature"];

  return MEMORY[0x270F9A758]();
}

uint64_t __55__UTType_SHShazamAdditions__SHCustomCatalogContentType__block_invoke()
{
  SHCustomCatalogContentType_catalogType = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.shazamcatalog"];

  return MEMORY[0x270F9A758]();
}

@end