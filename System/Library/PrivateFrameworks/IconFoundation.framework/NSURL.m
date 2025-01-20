@interface NSURL
@end

@implementation NSURL

uint64_t __62__NSURL_IconFoundationAdditions_Internal__coreGlyphsBundleURL__block_invoke()
{
  coreGlyphsBundleURL_url = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/CoreGlyphs.bundle"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __69__NSURL_IconFoundationAdditions_Internal__coreGlyphsPrivateBundleURL__block_invoke()
{
  coreGlyphsPrivateBundleURL_url = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/CoreGlyphsPrivate.bundle"];

  return MEMORY[0x1F41817F8]();
}

@end