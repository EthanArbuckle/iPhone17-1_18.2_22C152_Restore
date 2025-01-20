@interface CLKComplicationTemplateGraphicRectangularFull
+ (id)templateWithImageProvider:(id)a3;
- (CLKComplicationTemplateGraphicRectangularFull)initWithImageProvider:(id)a3;
- (CLKFullColorImageProvider)imageProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicRectangularFull

- (CLKComplicationTemplateGraphicRectangularFull)initWithImageProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicRectangularFull;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateGraphicRectangularFull *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (id)templateWithImageProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return v5;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1548);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1549);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1549);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1549, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1550 = [v6 version];

    __95__CLKComplicationTemplateGraphicRectangularFull__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1550;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1548);
  double v14 = *(double *)&qword_267C8B478;
  double v15 = unk_267C8B480;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize_1547[2
                                                                      * [(CLKComplicationTemplate *)self sdkVersion]];
  double v17 = *(double *)v16;
  double v18 = *((double *)v16 + 1);
  char v19 = 0;
  (*((void (**)(id, __CFString *, void, void, void, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 0, 0, 0, 4, &v19, v17, v18, v14, v15, 9.0);
}

void __95__CLKComplicationTemplateGraphicRectangularFull__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  qword_267C8B478 = __95__CLKComplicationTemplateGraphicRectangularFull__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v4, v4);
  unk_267C8B480 = v2;
  _enumerateFullColorImageProviderKeysWithBlock___imageSize_1547 = __95__CLKComplicationTemplateGraphicRectangularFull__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  unk_267C8B470 = v3;
}

double __95__CLKComplicationTemplateGraphicRectangularFull__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 scaledValue:3 withOverride:157.0 forSizeClass:184.0];
  double v4 = v3;
  [v2 scaledValue:3 withOverride:69.0 forSizeClass:78.0];

  return v4;
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end