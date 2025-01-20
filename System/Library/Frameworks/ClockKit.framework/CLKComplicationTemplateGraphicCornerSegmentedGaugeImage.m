@interface CLKComplicationTemplateGraphicCornerSegmentedGaugeImage
- (CLKComplicationTemplateGraphicCornerSegmentedGaugeImage)initWithImageProvider:(id)a3 gaugeProvider:(id)a4 textProvider:(id)a5;
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)leadingTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setLeadingTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCornerSegmentedGaugeImage

- (int64_t)compatibleFamily
{
  return 8;
}

- (CLKComplicationTemplateGraphicCornerSegmentedGaugeImage)initWithImageProvider:(id)a3 gaugeProvider:(id)a4 textProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CLKComplicationTemplateGraphicCornerSegmentedGaugeImage;
  v12 = [(CLKComplicationTemplate *)&v15 initPrivate];
  v13 = (CLKComplicationTemplateGraphicCornerSegmentedGaugeImage *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 9, a4);
    objc_storeStrong((id *)&v13->_leadingTextProvider, a5);
    objc_storeStrong((id *)&v13->_imageProvider, a3);
  }

  return v13;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, @"leadingTextProvider", 1, 1, &v3);
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1255);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1256);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1256);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1256, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1257 = [v6 version];

    __105__CLKComplicationTemplateGraphicCornerSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1257;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1255);
  double v14 = *(double *)&qword_267C8B208;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1253[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1254];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __105__CLKComplicationTemplateGraphicCornerSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:16.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1254 = v2;
  [v5 scaledValue:20.0];
  qword_267C8B208 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:20.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1253 = v4;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
}

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(id)a3
{
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
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end