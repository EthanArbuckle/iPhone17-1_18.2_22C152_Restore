@interface CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage
+ (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKFullColorImageProvider)bottomImageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)centerTextProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider;
- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage

- (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v8 = gaugeProvider;
  v9 = bottomImageProvider;
  v10 = centerTextProvider;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage;
  v11 = [(CLKComplicationTemplate *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *)v11 setGaugeProvider:v8];
    [(CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *)v12 setBottomImageProvider:v9];
    [(CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *)v12 setCenterTextProvider:v10];
  }

  return v12;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v8 = centerTextProvider;
  v9 = bottomImageProvider;
  v10 = gaugeProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v10 bottomImageProvider:v9 centerTextProvider:v8];

  return (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *)v11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"centerTextProvider", 0, 1, &v3);
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1617);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1618);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1618);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1618, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1619 = [v6 version];

    __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1619;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1617);
  double v14 = *(double *)&qword_267C8B528;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1615[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1616];
  v4[2](v4, @"bottomImageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:3];
  double v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v7[3] = &__block_descriptor_40_e26_d16__0__CLKDeviceMetrics_8l;
  *(double *)&v7[4] = v4;
  v5 = (double (**)(void, void))MEMORY[0x21D4AACC0](v7);
  [v3 scaledValue:v4 * 11.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1616 = v6;
  qword_267C8B528 = ((double (**)(void, void *))v5)[2](v5, v3);
  [v3 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1615 = ((double (**)(void, void *))v5)[2](v5, v3);
}

uint64_t __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 scaledValue:3 withOverride:*(double *)(a1 + 32) * 11.0 forSizeClass:*(double *)(a1 + 32) * 12.0];
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
}

- (CLKFullColorImageProvider)bottomImageProvider
{
  return self->_bottomImageProvider;
}

- (void)setBottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider
{
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerTextProvider, 0);
  objc_storeStrong((id *)&self->_bottomImageProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end