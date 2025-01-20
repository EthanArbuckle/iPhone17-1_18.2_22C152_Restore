@interface CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText
+ (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)bottomTextProvider;
- (CLKTextProvider)centerTextProvider;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBottomTextProvider:(CLKTextProvider *)bottomTextProvider;
- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText

- (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v8 = gaugeProvider;
  v9 = bottomTextProvider;
  v10 = centerTextProvider;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText;
  v11 = [(CLKComplicationTemplate *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *)v11 setGaugeProvider:v8];
    [(CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *)v12 setBottomTextProvider:v9];
    [(CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *)v12 setCenterTextProvider:v10];
  }

  return v12;
}

+ (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v8 = centerTextProvider;
  v9 = bottomTextProvider;
  v10 = gaugeProvider;
  v11 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v10 bottomTextProvider:v9 centerTextProvider:v8];

  return (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *)v11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"bottomTextProvider", 0, 1, &v4);
  if (!v4) {
    v3[2](v3, @"centerTextProvider", 0, 1, &v4);
  }
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

- (CLKTextProvider)bottomTextProvider
{
  return self->_bottomTextProvider;
}

- (void)setBottomTextProvider:(CLKTextProvider *)bottomTextProvider
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
  objc_storeStrong((id *)&self->_bottomTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end