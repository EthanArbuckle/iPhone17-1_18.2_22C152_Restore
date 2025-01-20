@interface CLKComplicationTemplateExtraLargeProgressRingImage
+ (id)templateWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5;
- (CLKComplicationTemplateExtraLargeProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5;
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

@implementation CLKComplicationTemplateExtraLargeProgressRingImage

- (CLKComplicationTemplateExtraLargeProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateExtraLargeProgressRingImage;
  v10 = [(CLKComplicationTemplate *)&v13 initPrivate];
  v11 = v10;
  if (v10)
  {
    [(CLKComplicationTemplateExtraLargeProgressRingImage *)v10 setImageProvider:v8];
    [(CLKComplicationTemplateExtraLargeProgressRingImage *)v11 setProgressProvider:v9];
    [(CLKComplicationTemplateExtraLargeProgressRingImage *)v11 setRingStyle:a5];
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
  return 7;
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  char v11 = 0;
  v12[0] = &unk_26CCDB6C8;
  v12[1] = &unk_26CCDB6E0;
  v13[0] = &unk_26CCDC338;
  v13[1] = &unk_26CCDC348;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v13 forKeys:v12 count:2];
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  _SquareImageSizeScaled(v6, 1, [(CLKComplicationTemplate *)self sdkVersion], &v9, &v7, 52.0);
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, uint64_t, char *, double, double, double, double))v5
   + 2))(v5, @"imageProvider", 0, 1, 0, 4, 1, &v11, v9, v10, v7, v8);
}

- (void)_enumerateProgressProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"progressProvider", 0, 1, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"ringStyle", 1, &__block_literal_global_1003, &v3);
}

BOOL __85__CLKComplicationTemplateExtraLargeProgressRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
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