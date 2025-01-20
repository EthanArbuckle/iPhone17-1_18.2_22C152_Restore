@interface CLKComplicationTemplateGraphicCornerCircularImage
+ (CLKComplicationTemplateGraphicCornerCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicCornerCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicCornerCircularImage

- (CLKComplicationTemplateGraphicCornerCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicCornerCircularImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateGraphicCornerCircularImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateGraphicCornerCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateGraphicCornerCircularImage *)v5;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1187);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1188);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1188);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1188, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1189 = [v6 version];

    __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1189;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1187);
  double v14 = *(double *)&qword_267C8B178;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1185[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1186];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:3];
  uint64_t v2 = [v4 scaledValue:19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1186 = v3;
  qword_267C8B178 = __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(v2, v4);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1185 = __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
}

double __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26CCDB6F8;
  v8[1] = &unk_26CCDB710;
  v9[0] = &unk_26CCDC2D8;
  v9[1] = &unk_26CCDC358;
  v8[2] = &unk_26CCDB728;
  v8[3] = &unk_26CCDB740;
  v9[2] = &unk_26CCDC368;
  v9[3] = &unk_26CCDC358;
  uint64_t v2 = NSDictionary;
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v9 forKeys:v8 count:4];
  [v3 scaledValue:v4 withOverrides:36.0];
  double v6 = v5;

  return v6;
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