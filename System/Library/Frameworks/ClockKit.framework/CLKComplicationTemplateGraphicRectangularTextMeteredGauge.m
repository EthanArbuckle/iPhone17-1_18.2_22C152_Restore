@interface CLKComplicationTemplateGraphicRectangularTextMeteredGauge
+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6;
+ (id)templateWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5;
- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6;
- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5;
- (CLKFullColorImageProvider)headerImageProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)body1TextProvider;
- (CLKTextProvider)headerTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBody1TextProvider:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setHeaderImageProvider:(id)a3;
- (void)setHeaderTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicRectangularTextMeteredGauge

- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5
{
  return [(CLKComplicationTemplateGraphicRectangularTextMeteredGauge *)self initWithHeaderImageProvider:0 headerTextProvider:a3 body1TextProvider:a4 gaugeProvider:a5];
}

- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicRectangularTextMeteredGauge;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicRectangularTextMeteredGauge *)v14 setHeaderImageProvider:v10];
    [(CLKComplicationTemplateGraphicRectangularTextMeteredGauge *)v15 setHeaderTextProvider:v11];
    [(CLKComplicationTemplateGraphicRectangularTextMeteredGauge *)v15 setBody1TextProvider:v12];
    [(CLKComplicationTemplateGraphicRectangularTextMeteredGauge *)v15 setGaugeProvider:v13];
  }

  return v15;
}

+ (id)templateWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithHeaderTextProvider:v10 body1TextProvider:v9 gaugeProvider:v8];

  return v11;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithHeaderImageProvider:v13 headerTextProvider:v12 body1TextProvider:v11 gaugeProvider:v10];

  return v14;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1568);
  id WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1569);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1569);
  if (v6 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1569, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1570 = [v6 version];

    __107__CLKComplicationTemplateGraphicRectangularTextMeteredGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1570;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1568);
  double v14 = *(double *)&qword_267C8B4A8;
  double v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1566[[(CLKComplicationTemplate *)self sdkVersion]];
  char v17 = 0;
  v16 = [NSNumber numberWithDouble:*(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1567];
  v4[2](v4, @"headerImageProvider", 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);
}

void __107__CLKComplicationTemplateGraphicRectangularTextMeteredGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:19.0];
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1567 = v2;
  [v5 scaledValue:14.0];
  qword_267C8B4A8 = v3;
  [v5 setNewestAllowedSizeClass:&unk_26CCDB6E0];
  [v5 scaledValue:14.0];
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1566 = v4;
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

- (void)setHeaderImageProvider:(id)a3
{
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(id)a3
{
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
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