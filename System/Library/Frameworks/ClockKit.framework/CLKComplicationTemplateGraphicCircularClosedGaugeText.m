@interface CLKComplicationTemplateGraphicCircularClosedGaugeText
+ (CLKComplicationTemplateGraphicCircularClosedGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKComplicationTemplateGraphicCircularClosedGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)centerTextProvider;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularClosedGaugeText

- (CLKComplicationTemplateGraphicCircularClosedGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v6 = gaugeProvider;
  v7 = centerTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCircularClosedGaugeText;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicCircularClosedGaugeText *)v8 setGaugeProvider:v6];
    [(CLKComplicationTemplateGraphicCircularClosedGaugeText *)v9 setCenterTextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCircularClosedGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v6 = centerTextProvider;
  v7 = gaugeProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v7 centerTextProvider:v6];

  return (CLKComplicationTemplateGraphicCircularClosedGaugeText *)v8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"centerTextProvider", 0, 1, &v3);
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end