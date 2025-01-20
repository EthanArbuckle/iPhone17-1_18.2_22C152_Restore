@interface CLKComplicationTemplateCircularMediumSimpleImage
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (int64_t)compatibleFamily;
@end

@implementation CLKComplicationTemplateCircularMediumSimpleImage

- (int64_t)compatibleFamily
{
  return 105;
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = &unk_26CCDB6C8;
  v10[0] = &unk_26CCDC2A8;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 28.0);
}

@end