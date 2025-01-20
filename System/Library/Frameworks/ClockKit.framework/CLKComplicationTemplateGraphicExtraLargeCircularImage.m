@interface CLKComplicationTemplateGraphicExtraLargeCircularImage
+ (CLKComplicationTemplateGraphicExtraLargeCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicExtraLargeCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularImage

- (CLKComplicationTemplateGraphicExtraLargeCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularImage;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateGraphicExtraLargeCircularImage *)v5 setImageProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v4 = imageProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithImageProvider:v4];

  return (CLKComplicationTemplateGraphicExtraLargeCircularImage *)v5;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1593);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1594);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1594);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1594, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1595 = [v6 version];

    __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1595;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1593);
  double v14 = *(double *)&qword_267C8B4F8;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1591[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1592];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  double v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  id v12 = &unk_26440E300;
  id v13 = v2;
  double v14 = v4;
  id v5 = v2;
  id v6 = (double (**)(void, void))MEMORY[0x21D4AACC0](&v9);
  objc_msgSend(v3, "scaledValue:", 24.0, v9, v10, v11, v12);
  CLKRoundForDevice(v5, v4 * v7);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1592 = v8;
  qword_267C8B4F8 = ((double (**)(void, void *))v6)[2](v6, v3);
  [v3 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1591 = ((double (**)(void, void *))v6)[2](v6, v3);
}

double __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v5 = (double (*)(id))getCDCircularMediumComplicationDiameterSymbolLoc_ptr;
  double v15 = getCDCircularMediumComplicationDiameterSymbolLoc_ptr;
  if (!getCDCircularMediumComplicationDiameterSymbolLoc_ptr)
  {
    id v6 = (void *)ComplicationDisplayLibrary();
    v13[3] = (uint64_t)dlsym(v6, "CDCircularMediumComplicationDiameter");
    getCDCircularMediumComplicationDiameterSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    id v5 = (double (*)(id))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    uint64_t v11 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  double v7 = v5(v4);

  CLKRoundForDevice(*(void **)(a1 + 32), v7 * *(double *)(a1 + 40));
  double v9 = v8;

  return v9;
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