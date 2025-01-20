@interface IHKBilateralGridUtils
+ (CGImage)autoApplyGridBufferWithGridBuffer:(vImage_Buffer *)a3 image:(CGImage *)a4 assume_BGRA_sRGB:(BOOL)a5 gridStrength:(float)a6;
- (_TtC21ImageHarmonizationKit21IHKBilateralGridUtils)init;
@end

@implementation IHKBilateralGridUtils

+ (CGImage)autoApplyGridBufferWithGridBuffer:(vImage_Buffer *)a3 image:(CGImage *)a4 assume_BGRA_sRGB:(BOOL)a5 gridStrength:(float)a6
{
  data = a3->data;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  size_t rowBytes = a3->rowBytes;
  v12 = a4;
  v13 = sub_2529D7CA8((uint64_t)data, height, width, rowBytes, (uint64_t)v12, a5, a6);

  return (CGImage *)v13;
}

- (_TtC21ImageHarmonizationKit21IHKBilateralGridUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return [(IHKBilateralGridUtils *)&v3 init];
}

@end