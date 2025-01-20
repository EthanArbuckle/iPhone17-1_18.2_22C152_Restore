@interface CLKComplicationTemplateGraphicCornerGaugeImage
+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider;
- (CLKFullColorImageProvider)imageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)leadingTextProvider;
- (CLKTextProvider)trailingTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider;
- (void)setLeadingTextProvider:(CLKTextProvider *)leadingTextProvider;
- (void)setTrailingTextProvider:(CLKTextProvider *)trailingTextProvider;
@end

@implementation CLKComplicationTemplateGraphicCornerGaugeImage

- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  return [(CLKComplicationTemplateGraphicCornerGaugeImage *)self initWithGaugeProvider:gaugeProvider leadingTextProvider:0 trailingTextProvider:0 imageProvider:imageProvider];
}

- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = imageProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCornerGaugeImage;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicCornerGaugeImage *)v14 setGaugeProvider:v10];
    [(CLKComplicationTemplateGraphicCornerGaugeImage *)v15 setLeadingTextProvider:v11];
    [(CLKComplicationTemplateGraphicCornerGaugeImage *)v15 setTrailingTextProvider:v12];
    [(CLKComplicationTemplateGraphicCornerGaugeImage *)v15 setImageProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v6 = imageProvider;
  v7 = gaugeProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v7 imageProvider:v6];

  return (CLKComplicationTemplateGraphicCornerGaugeImage *)v8;
}

+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  v10 = imageProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v13 leadingTextProvider:v12 trailingTextProvider:v11 imageProvider:v10];

  return (CLKComplicationTemplateGraphicCornerGaugeImage *)v14;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, uint64_t, uint64_t, unsigned char *))a3;
  char v4 = 0;
  v3[2](v3, @"leadingTextProvider", 1, 1, &v4);
  if (!v4) {
    v3[2](v3, @"trailingTextProvider", 1, 1, &v4);
  }
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  char v4 = (void (**)(id, __CFString *, void, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion = [v6 version];

    __96__CLKComplicationTemplateGraphicCornerGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock);
  double v14 = *(double *)&qword_267C8B118;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize];
  v4[2](v4, @"imageProvider", 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);
}

void __96__CLKComplicationTemplateGraphicCornerGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:16.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize = v2;
  [v5 scaledValue:20.0];
  qword_267C8B118 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:20.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter = v4;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
}

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(CLKTextProvider *)leadingTextProvider
{
}

- (CLKTextProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void)setTrailingTextProvider:(CLKTextProvider *)trailingTextProvider
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
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end