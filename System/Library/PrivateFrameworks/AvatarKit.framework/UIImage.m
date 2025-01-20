@interface UIImage
@end

@implementation UIImage

void __63__UIImage_Conversion__avt_dataRepresentationForTypeIdentifier___block_invoke(uint64_t a1, id a2)
{
  v3 = (CGImage *)[a2 CGImage];
  CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 32);
  v4 = *(CGImageDestination **)(a1 + 40);
  CGImageDestinationAddImage(v4, v3, v5);
}

@end