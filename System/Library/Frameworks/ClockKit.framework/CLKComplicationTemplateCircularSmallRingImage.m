@interface CLKComplicationTemplateCircularSmallRingImage
+ (CLKComplicationTemplateCircularSmallRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (CLKComplicationRingStyle)ringStyle;
- (CLKComplicationTemplateCircularSmallRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
- (CLKImageProvider)imageProvider;
- (float)fillFraction;
- (int64_t)compatibleFamily;
- (void)_enumerateFloatKeysWithBlock:(id)a3;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)setFillFraction:(float)fillFraction;
- (void)setImageProvider:(CLKImageProvider *)imageProvider;
- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle;
@end

@implementation CLKComplicationTemplateCircularSmallRingImage

- (CLKComplicationTemplateCircularSmallRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = imageProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateCircularSmallRingImage;
  v9 = [(CLKComplicationTemplate *)&v13 initPrivate];
  v10 = v9;
  if (v9)
  {
    [(CLKComplicationTemplateCircularSmallRingImage *)v9 setImageProvider:v8];
    *(float *)&double v11 = fillFraction;
    [(CLKComplicationTemplateCircularSmallRingImage *)v10 setFillFraction:v11];
    [(CLKComplicationTemplateCircularSmallRingImage *)v10 setRingStyle:ringStyle];
  }

  return v10;
}

+ (CLKComplicationTemplateCircularSmallRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = imageProvider;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = fillFraction;
  double v11 = (void *)[v9 initWithImageProvider:v8 fillFraction:ringStyle ringStyle:v10];

  return (CLKComplicationTemplateCircularSmallRingImage *)v11;
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
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, uint64_t, char *, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 0, 1, 0, 4, 1, &v9, v7, v8, v5, v6);
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void, char *))a3 + 2))(a3, @"fillFraction", 1, 0, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"ringStyle", 1, &__block_literal_global_852, &v3);
}

BOOL __80__CLKComplicationTemplateCircularSmallRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)fillFraction
{
  self->_fillFraction = fillFraction;
}

- (CLKComplicationRingStyle)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle
{
  self->_ringStyle = ringStyle;
}

- (void).cxx_destruct
{
}

@end