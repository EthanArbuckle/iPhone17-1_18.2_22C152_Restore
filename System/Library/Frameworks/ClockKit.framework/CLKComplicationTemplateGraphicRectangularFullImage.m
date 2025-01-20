@interface CLKComplicationTemplateGraphicRectangularFullImage
+ (CLKComplicationTemplateGraphicRectangularFullImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicRectangularFullImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicRectangularFullImage

- (CLKComplicationTemplateGraphicRectangularFullImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicRectangularFullImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateGraphicRectangularFullImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateGraphicRectangularFullImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateGraphicRectangularFullImage *)v5;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1469);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1470);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1470);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1470, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1471 = [v6 version];

    __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1471;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1469);
  double v14 = *(double *)&qword_267C8B378;
  double v15 = unk_267C8B380;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize_1468[2
                                                                      * [(CLKComplicationTemplate *)self sdkVersion]];
  double v17 = *(double *)v16;
  double v18 = *((double *)v16 + 1);
  char v19 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 0, 1, 0, 4, &v19, v17, v18, v14, v15, 4.0);
}

void __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  qword_267C8B378 = __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v4, v4);
  unk_267C8B380 = v2;
  _enumerateFullColorImageProviderKeysWithBlock___imageSize_1468 = __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  unk_267C8B370 = v3;
}

double __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 scaledValue:3 withOverride:162.0 forSizeClass:184.0];
  double v4 = v3;
  [v2 scaledValue:3 withOverride:69.0 forSizeClass:78.0];

  return v4;
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