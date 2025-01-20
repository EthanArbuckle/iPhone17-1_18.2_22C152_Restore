@interface CLKComplicationTemplateUtilitarianSmallRingImage
+ (CLKComplicationTemplateUtilitarianSmallRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
- (CLKComplicationRingStyle)ringStyle;
- (CLKComplicationTemplateUtilitarianSmallRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
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

@implementation CLKComplicationTemplateUtilitarianSmallRingImage

- (CLKComplicationTemplateUtilitarianSmallRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = imageProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateUtilitarianSmallRingImage;
  v9 = [(CLKComplicationTemplate *)&v13 initPrivate];
  v10 = v9;
  if (v9)
  {
    [(CLKComplicationTemplateUtilitarianSmallRingImage *)v9 setImageProvider:v8];
    *(float *)&double v11 = fillFraction;
    [(CLKComplicationTemplateUtilitarianSmallRingImage *)v10 setFillFraction:v11];
    [(CLKComplicationTemplateUtilitarianSmallRingImage *)v10 setRingStyle:ringStyle];
  }

  return v10;
}

+ (CLKComplicationTemplateUtilitarianSmallRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = imageProvider;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = fillFraction;
  double v11 = (void *)[v9 initWithImageProvider:v8 fillFraction:ringStyle ringStyle:v10];

  return (CLKComplicationTemplateUtilitarianSmallRingImage *)v11;
}

- (int64_t)compatibleFamily
{
  return 2;
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  char v11 = 0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  v12[0] = &unk_26CCDB6C8;
  v12[1] = &unk_26CCDB6E0;
  v13[0] = &unk_26CCDC258;
  v13[1] = &unk_26CCDC268;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v13 forKeys:v12 count:2];
  _SquareImageSizeScaled(v6, 1, [(CLKComplicationTemplate *)self sdkVersion], &v9, &v7, 14.0);

  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, uint64_t, char *, double, double, double, double))v5
   + 2))(v5, @"imageProvider", 0, 1, 0, 4, 1, &v11, v9, v10, v7, v8);
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void, char *))a3 + 2))(a3, @"fillFraction", 1, 0, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"ringStyle", 1, &__block_literal_global_798, &v3);
}

BOOL __83__CLKComplicationTemplateUtilitarianSmallRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
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