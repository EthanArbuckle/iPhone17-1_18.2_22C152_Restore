@interface CLKComplicationTemplateCircularMediumCircularImage
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (int64_t)compatibleFamily;
@end

@implementation CLKComplicationTemplateCircularMediumCircularImage

- (int64_t)compatibleFamily
{
  return 105;
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = &unk_26CCDB6C8;
  v9[1] = &unk_26CCDB6E0;
  v10[0] = &unk_26CCDC288;
  v10[1] = &unk_26CCDC2B8;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 42.0);
}

@end