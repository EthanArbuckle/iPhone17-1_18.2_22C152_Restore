@interface CLKComplicationTemplateGraphicCircularStackImage
+ (CLKComplicationTemplateGraphicCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKComplicationTemplateGraphicCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKFullColorImageProvider)line1ImageProvider;
- (CLKTextProvider)line2TextProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularStackImage

- (CLKComplicationTemplateGraphicCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCircularStackImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicCircularStackImage *)v8 setLine1ImageProvider:v6];
    [(CLKComplicationTemplateGraphicCircularStackImage *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1ImageProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateGraphicCircularStackImage *)v8;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1375);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1376);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1376);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1376, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1377 = [v6 version];

    __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1377;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1375);
  double v14 = *(double *)&qword_267C8B2D0;
  double v15 = unk_267C8B2D8;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize[2
                                                                 * [(CLKComplicationTemplate *)self sdkVersion]];
  double v17 = *(double *)v16;
  double v18 = *((double *)v16 + 1);
  char v19 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, @"line1ImageProvider", 0, 1, 0, 4, &v19, v17, v18, v14, v15, 0.0);
}

void __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  qword_267C8B2D0 = __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v4, v4);
  unk_267C8B2D8 = v2;
  _enumerateFullColorImageProviderKeysWithBlock___imageSize = __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  *(void *)algn_267C8B2C8 = v3;
}

double __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  [v2 scaledValue:28.0];
  double v4 = v3;
  v7 = &unk_26CCDB6E0;
  v8[0] = &unk_26CCDC268;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 scaledValue:v5 withOverrides:14.0];

  return v4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"line2TextProvider", 0, 1, &v3);
}

- (CLKFullColorImageProvider)line1ImageProvider
{
  return self->_line1ImageProvider;
}

- (void)setLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider
{
}

- (CLKTextProvider)line2TextProvider
{
  return self->_line2TextProvider;
}

- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);

  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end