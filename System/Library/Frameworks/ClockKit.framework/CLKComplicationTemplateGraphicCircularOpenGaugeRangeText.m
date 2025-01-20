@interface CLKComplicationTemplateGraphicCircularOpenGaugeRangeText
+ (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)centerTextProvider;
- (CLKTextProvider)leadingTextProvider;
- (CLKTextProvider)trailingTextProvider;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setLeadingTextProvider:(CLKTextProvider *)leadingTextProvider;
- (void)setTrailingTextProvider:(CLKTextProvider *)trailingTextProvider;
@end

@implementation CLKComplicationTemplateGraphicCircularOpenGaugeRangeText

- (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = centerTextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenGaugeRangeText;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v14 setGaugeProvider:v10];
    [(CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v15 setLeadingTextProvider:v11];
    [(CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v15 setTrailingTextProvider:v12];
    [(CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v15 setCenterTextProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  v10 = centerTextProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v13 leadingTextProvider:v12 trailingTextProvider:v11 centerTextProvider:v10];

  return (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v14;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"leadingTextProvider", 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, @"trailingTextProvider", 0, 1, &v4);
    if (!v4) {
      v3[2](v3, @"centerTextProvider", 0, 1, &v4);
    }
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
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end