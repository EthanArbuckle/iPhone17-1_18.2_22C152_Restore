@interface CLKComplicationTemplateExtraLargeSimpleImage
+ (CLKComplicationTemplateExtraLargeSimpleImage)templateWithImageProvider:(CLKImageProvider *)imageProvider;
- (CLKComplicationTemplateExtraLargeSimpleImage)initWithImageProvider:(CLKImageProvider *)imageProvider;
- (CLKImageProvider)imageProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateExtraLargeSimpleImage

- (CLKComplicationTemplateExtraLargeSimpleImage)initWithImageProvider:(CLKImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateExtraLargeSimpleImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateExtraLargeSimpleImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateExtraLargeSimpleImage)templateWithImageProvider:(CLKImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateExtraLargeSimpleImage *)v5;
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
  v13[0] = &unk_26CCDC2F8;
  v13[1] = &unk_26CCDC308;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v13 forKeys:v12 count:2];
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  _SquareImageSizeScaled(v6, 3, [(CLKComplicationTemplate *)self sdkVersion], &v9, &v7, 103.25);
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, void, char *, double, double, double, double))v5
   + 2))(v5, @"imageProvider", 0, 1, 0, 4, 0, &v11, v9, v10, v7, v8);
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