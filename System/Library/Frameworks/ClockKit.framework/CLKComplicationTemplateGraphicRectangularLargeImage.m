@interface CLKComplicationTemplateGraphicRectangularLargeImage
+ (CLKComplicationTemplateGraphicRectangularLargeImage)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicRectangularLargeImage)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateGraphicRectangularLargeImage

- (CLKComplicationTemplateGraphicRectangularLargeImage)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = textProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicRectangularLargeImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicRectangularLargeImage *)v8 setTextProvider:v6];
    [(CLKComplicationTemplateGraphicRectangularLargeImage *)v9 setImageProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicRectangularLargeImage)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateGraphicRectangularLargeImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1483);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1484);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1484);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1484, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1485 = [v6 version];

    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1485;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1483);
  double v14 = *(double *)&qword_267C8B3B0;
  double v15 = unk_267C8B3B8;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize_1482[2
                                                                      * [(CLKComplicationTemplate *)self sdkVersion]];
  double v17 = *(double *)v16;
  double v18 = *((double *)v16 + 1);
  char v19 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, void, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, @"imageProvider", 0, 1, 0, 4, &v19, v17, v18, v14, v15, 4.0);
}

void __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  qword_267C8B3B0 = __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v7, v2);
  unk_267C8B3B8 = v3;
  double v4 = __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2([v7 setNewestAllowedSizeClass:&unk_26CCDB6E0], v2);
  uint64_t v6 = v5;

  _enumerateFullColorImageProviderKeysWithBlock___imageSize_1482 = *(void *)&v4;
  *(void *)algn_267C8B3A8 = v6;
}

double __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v3 = (double (*)(id))getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr;
  double v18 = getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr)
  {
    double v4 = (void *)ComplicationDisplayLibrary();
    v16[3] = (uint64_t)dlsym(v4, "CDGraphicLargeRectangularComplicationSize");
    getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr = (_UNKNOWN *)v16[3];
    uint64_t v3 = (double (*)(id))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v3)
  {
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
LABEL_12:
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    goto LABEL_13;
  }
  double v5 = v3(v2);

  id v6 = v2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v7 = (double (*)(id))getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr;
  double v18 = getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr)
  {
    v8 = (void *)ComplicationDisplayLibrary();
    v16[3] = (uint64_t)dlsym(v8, "CDGraphicLargeRectangularComplicationInset");
    getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr = (_UNKNOWN *)v16[3];
    id v7 = (double (*)(id))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v7) {
    goto LABEL_12;
  }
  double v9 = v7(v6);

  id v10 = v6;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v11 = (void (*)(id))getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr;
  double v18 = getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr)
  {
    id v12 = (void *)ComplicationDisplayLibrary();
    v16[3] = (uint64_t)dlsym(v12, "CDGraphicLargeRectangularComplicationLargeImageHeight");
    getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr = (_UNKNOWN *)v16[3];
    uint64_t v11 = (void (*)(id))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v11)
  {
LABEL_13:
    double v14 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  v11(v10);

  return v5 + v9 * -2.0;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
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

  objc_storeStrong((id *)&self->_textProvider, 0);
}

uint64_t __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1()
{
  return __get_ClientRendererClass_block_invoke_cold_1();
}

@end