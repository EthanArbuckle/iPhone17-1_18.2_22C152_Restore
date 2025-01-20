@interface CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage
+ (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage

- (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = gaugeProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *)v8 setGaugeProvider:v6];
    [(CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *)v9 setImageProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = gaugeProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *)v8;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1637);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1638);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1638);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1638, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1639 = [v6 version];

    __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1639;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1637);
  double v14 = *(double *)&qword_267C8B558;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1635[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1636];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:3];
  double v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v7[3] = &__block_descriptor_40_e26_d16__0__CLKDeviceMetrics_8l;
  *(double *)&v7[4] = v4;
  v5 = (double (**)(void, void))MEMORY[0x21D4AACC0](v7);
  [v3 scaledValue:v4 * 19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1636 = v6;
  qword_267C8B558 = ((double (**)(void, void *))v5)[2](v5, v3);
  [v3 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1635 = ((double (**)(void, void *))v5)[2](v5, v3);
}

uint64_t __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 scaledValue:3 withOverride:*(double *)(a1 + 32) * 27.0 forSizeClass:*(double *)(a1 + 32) * 31.0];
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end