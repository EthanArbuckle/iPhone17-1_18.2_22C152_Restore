@interface ISGrayscaleConversion
- (BOOL)computeGrayscaleConversionColorWithCGImage:(CGImage *)a3 grayscaleConversion:;
- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:;
- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:;
@end

@implementation ISGrayscaleConversion

- (double)computeGrayscaleConversionColorWithWidth:height:ucharSamples:
{
  return 0.00000079472886;
}

- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:
{
  return 0.00000079472886;
}

- (BOOL)computeGrayscaleConversionColorWithCGImage:(CGImage *)a3 grayscaleConversion:
{
  if (!a3) {
    return 0;
  }
  v4 = v3;
  if (CGImageGetBitsPerComponent(a3) != 8) {
    return 0;
  }
  if (CGImageGetBitsPerPixel(a3) != 32) {
    return 0;
  }
  DataProvider = CGImageGetDataProvider(a3);
  if (!DataProvider) {
    return 0;
  }
  CFDataRef v8 = CGDataProviderCopyData(DataProvider);
  if (!v8) {
    return 0;
  }
  CFDataRef v9 = v8;
  BytePtr = CFDataGetBytePtr(v8);
  BOOL v11 = BytePtr != 0;
  if (BytePtr)
  {
    v12 = BytePtr;
    size_t Width = CGImageGetWidth(a3);
    [(ISGrayscaleConversion *)self computeGrayscaleConversionColorWithWidth:Width height:CGImageGetHeight(a3) ucharSamples:v12];
    _OWORD *v4 = v14;
  }
  CFRelease(v9);
  return v11;
}

@end