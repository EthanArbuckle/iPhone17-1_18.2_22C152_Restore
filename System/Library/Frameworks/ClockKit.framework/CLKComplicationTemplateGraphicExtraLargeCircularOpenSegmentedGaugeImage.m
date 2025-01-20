@interface CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage
- (CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage)initWithImageProvider:(id)a3 gaugeProvider:(id)a4 textProvider:(id)a5;
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)textProvider;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage

- (CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage)initWithImageProvider:(id)a3 gaugeProvider:(id)a4 textProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage;
  v12 = [(CLKComplicationTemplate *)&v15 initPrivate];
  v13 = (CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 9, a4);
    objc_storeStrong((id *)&v13->_textProvider, a5);
    objc_storeStrong((id *)&v13->_imageProvider, a3);
  }

  return v13;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, __CFString *, uint64_t, uint64_t, void *, uint64_t, unsigned char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1687);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1688);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1688);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1688, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1689 = [v6 version];

    __121__CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1689;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1687);
  double v14 = *(double *)&qword_267C8B5F0;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1685[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1686];
  v4[2](v4, @"imageProvider", 1, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __121__CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  double v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __121__CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v7[3] = &__block_descriptor_40_e26_d16__0__CLKDeviceMetrics_8l;
  *(double *)&v7[4] = v4;
  v5 = (double (**)(void, void))MEMORY[0x21D4AACC0](v7);
  [v3 scaledValue:v4 * 19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1686 = v6;
  qword_267C8B5F0 = ((double (**)(void, void *))v5)[2](v5, v3);
  [v3 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1685 = ((double (**)(void, void *))v5)[2](v5, v3);
}

uint64_t __121__CLKComplicationTemplateGraphicExtraLargeCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 scaledValue:3 withOverride:*(double *)(a1 + 32) * 34.0 forSizeClass:*(double *)(a1 + 32) * 38.0];
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, @"textProvider", 1, 1, &v3);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end