@interface CLKComplicationTemplateGraphicExtraLargeCircularStackImage
+ (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKFullColorImageProvider)line1ImageProvider;
- (CLKTextProvider)line2TextProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularStackImage

- (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularStackImage;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicExtraLargeCircularStackImage *)v8 setLine1ImageProvider:v6];
    [(CLKComplicationTemplateGraphicExtraLargeCircularStackImage *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1ImageProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateGraphicExtraLargeCircularStackImage *)v8;
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1656);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1657);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1657);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1657, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1658 = [v6 version];

    __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1658;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1656);
  double v14 = *(double *)&qword_267C8B590;
  double v15 = unk_267C8B598;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___maxImageSize[2
                                                                    * [(CLKComplicationTemplate *)self sdkVersion]];
  double v17 = *(double *)v16;
  double v18 = *((double *)v16 + 1);
  char v21 = 0;
  *(float *)&double v19 = v15;
  v20 = [NSNumber numberWithFloat:v19];
  v4[2](v4, @"line1ImageProvider", 0, 1, v20, 4, &v21, v17, v18, v14, v15, 0.0);
}

void __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKRenderingContext sharedRenderingContext];
  v4 = [v3 device];
  v5 = +[CLKDeviceMetrics metricsWithDevice:v4 identitySizeClass:2];

  double v6 = CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v10[3] = &__block_descriptor_40_e36__CGSize_dd_16__0__CLKDeviceMetrics_8l;
  *(double *)&v10[4] = v6;
  v7 = (double (**)(void, void))MEMORY[0x21D4AACC0](v10);
  qword_267C8B590 = ((double (**)(void, void *))v7)[2](v7, v5);
  unk_267C8B598 = v8;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  _enumerateFullColorImageProviderKeysWithBlock___maxImageSize = ((double (**)(void, void *))v7)[2](v7, v5);
  *(void *)algn_267C8B588 = v9;
}

uint64_t __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scaledSize:withOverride:forSizeClass:", 3, *(double *)(a1 + 32) * 28.0, *(double *)(a1 + 32) * 14.0, *(double *)(a1 + 32) * 31.0, *(double *)(a1 + 32) * 16.0);
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