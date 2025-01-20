@interface CLKComplicationTemplateCircularSmallProgressRingImage
+ (id)templateWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5;
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (CLKComplicationTemplateCircularSmallProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5;
- (CLKImageProvider)imageProvider;
- (CLKProgressProvider)progressProvider;
- (int64_t)compatibleFamily;
- (int64_t)ringStyle;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateProgressProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setProgressProvider:(id)a3;
- (void)setRingStyle:(int64_t)a3;
@end

@implementation CLKComplicationTemplateCircularSmallProgressRingImage

- (CLKComplicationTemplateCircularSmallProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateCircularSmallProgressRingImage;
  v10 = [(CLKComplicationTemplate *)&v13 initPrivate];
  v11 = v10;
  if (v10)
  {
    [(CLKComplicationTemplateCircularSmallProgressRingImage *)v10 setImageProvider:v8];
    [(CLKComplicationTemplateCircularSmallProgressRingImage *)v11 setProgressProvider:v9];
    [(CLKComplicationTemplateCircularSmallProgressRingImage *)v11 setRingStyle:a5];
  }

  return v11;
}

+ (id)templateWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v9 progressProvider:v8 ringStyle:a5];

  return v10;
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

- (void)_enumerateProgressProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"progressProvider", 0, 1, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"ringStyle", 1, &__block_literal_global_878, &v3);
}

BOOL __88__CLKComplicationTemplateCircularSmallProgressRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
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

- (void)setImageProvider:(id)a3
{
}

- (CLKProgressProvider)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
}

- (int64_t)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(int64_t)a3
{
  self->_ringStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProvider, 0);

  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end