@interface CLKComplicationTemplateGraphicCircularImage
+ (CLKComplicationTemplateGraphicCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularImage

- (CLKComplicationTemplateGraphicCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicCircularImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateGraphicCircularImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateGraphicCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateGraphicCircularImage *)v5;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1275);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1276);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1276);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1276, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1277 = [v6 version];

    __93__CLKComplicationTemplateGraphicCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1277;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1275);
  double v14 = *(double *)&qword_267C8B238;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1273[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1274];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __93__CLKComplicationTemplateGraphicCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:24.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1274 = v2;
  [v5 scaledValue:3 withOverride:42.0 forSizeClass:47.0];
  qword_267C8B238 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:42.0 forSizeClass:47.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1273 = v4;
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
}

@end