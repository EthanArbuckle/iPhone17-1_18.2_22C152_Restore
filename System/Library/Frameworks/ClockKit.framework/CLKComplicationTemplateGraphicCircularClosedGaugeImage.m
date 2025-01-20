@interface CLKComplicationTemplateGraphicCircularClosedGaugeImage
+ (CLKComplicationTemplateGraphicCircularClosedGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicCircularClosedGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularClosedGaugeImage

- (CLKComplicationTemplateGraphicCircularClosedGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = gaugeProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCircularClosedGaugeImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicCircularClosedGaugeImage *)v8 setGaugeProvider:v6];
    [(CLKComplicationTemplateGraphicCircularClosedGaugeImage *)v9 setImageProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCircularClosedGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = gaugeProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateGraphicCircularClosedGaugeImage *)v8;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1354);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1355);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1355);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1355, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1356 = [v6 version];

    __104__CLKComplicationTemplateGraphicCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1356;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1354);
  double v14 = *(double *)&qword_267C8B298;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1352[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1353];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __104__CLKComplicationTemplateGraphicCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1353 = v2;
  [v5 scaledValue:3 withOverride:27.0 forSizeClass:31.0];
  qword_267C8B298 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:27.0 forSizeClass:31.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1352 = v4;
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