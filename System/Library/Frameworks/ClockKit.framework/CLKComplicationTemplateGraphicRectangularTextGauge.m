@interface CLKComplicationTemplateGraphicRectangularTextGauge
+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider;
+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (CLKFullColorImageProvider)headerImageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)body1TextProvider;
- (CLKTextProvider)headerTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider;
- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider;
@end

@implementation CLKComplicationTemplateGraphicRectangularTextGauge

- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  return [(CLKComplicationTemplateGraphicRectangularTextGauge *)self initWithHeaderImageProvider:0 headerTextProvider:headerTextProvider body1TextProvider:body1TextProvider gaugeProvider:gaugeProvider];
}

- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  v10 = headerImageProvider;
  v11 = headerTextProvider;
  v12 = body1TextProvider;
  v13 = gaugeProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicRectangularTextGauge;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicRectangularTextGauge *)v14 setHeaderImageProvider:v10];
    [(CLKComplicationTemplateGraphicRectangularTextGauge *)v15 setHeaderTextProvider:v11];
    [(CLKComplicationTemplateGraphicRectangularTextGauge *)v15 setBody1TextProvider:v12];
    [(CLKComplicationTemplateGraphicRectangularTextGauge *)v15 setGaugeProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  v8 = gaugeProvider;
  v9 = body1TextProvider;
  v10 = headerTextProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v10 body1TextProvider:v9 gaugeProvider:v8];

  return (CLKComplicationTemplateGraphicRectangularTextGauge *)v11;
}

+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  v10 = gaugeProvider;
  v11 = body1TextProvider;
  v12 = headerTextProvider;
  v13 = headerImageProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v13 headerTextProvider:v12 body1TextProvider:v11 gaugeProvider:v10];

  return (CLKComplicationTemplateGraphicRectangularTextGauge *)v14;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"headerTextProvider", 0, 1, &v4);
  if (!v4) {
    v3[2](v3, @"body1TextProvider", 0, 1, &v4);
  }
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  char v4 = (void (**)(id, __CFString *, uint64_t, uint64_t, void *, uint64_t, unsigned char *, double, double, double, double, double))a3;
  v5 = +[CLKRenderingContext sharedRenderingContext];
  id v6 = [v5 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1515);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1516);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1516);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1516, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1517 = [v6 version];

    __100__CLKComplicationTemplateGraphicRectangularTextGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1517;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1515);
  double v14 = *(double *)&qword_267C8B410;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1513[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1514];
  v4[2](v4, @"headerImageProvider", 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);
}

void __100__CLKComplicationTemplateGraphicRectangularTextGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:12.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1514 = v2;
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  qword_267C8B410 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1513 = v4;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (CLKFullColorImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider
{
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider
{
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end