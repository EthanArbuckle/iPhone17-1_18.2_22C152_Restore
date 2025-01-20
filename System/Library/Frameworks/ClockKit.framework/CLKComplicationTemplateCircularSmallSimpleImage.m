@interface CLKComplicationTemplateCircularSmallSimpleImage
+ (CLKComplicationTemplateCircularSmallSimpleImage)templateWithImageProvider:(CLKImageProvider *)imageProvider;
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (CLKComplicationTemplateCircularSmallSimpleImage)initWithImageProvider:(CLKImageProvider *)imageProvider;
- (CLKImageProvider)imageProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateCircularSmallSimpleImage

- (CLKComplicationTemplateCircularSmallSimpleImage)initWithImageProvider:(CLKImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateCircularSmallSimpleImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateCircularSmallSimpleImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateCircularSmallSimpleImage)templateWithImageProvider:(CLKImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateCircularSmallSimpleImage *)v5;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  char v9 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, void, char *, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  char v9 = &unk_26CCDB6C8;
  v10[0] = &unk_26CCDC268;
  double v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 18.0);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
}

- (void).cxx_destruct
{
}

@end