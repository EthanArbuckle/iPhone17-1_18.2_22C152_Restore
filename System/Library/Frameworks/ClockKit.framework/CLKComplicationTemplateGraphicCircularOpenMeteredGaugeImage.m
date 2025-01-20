@interface CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage

- (int64_t)compatibleFamily
{
  return 10;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1395);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1396);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1396);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1396, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1397 = [v6 version];

    __109__CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1397;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1395);
  double v14 = *(double *)&qword_267C8B300;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1393[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1394];
  v4[2](v4, @"imageProvider", 1, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __109__CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1394 = v2;
  [v5 scaledValue:3 withOverride:27.0 forSizeClass:31.0];
  qword_267C8B300 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:27.0 forSizeClass:31.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1393 = v4;
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