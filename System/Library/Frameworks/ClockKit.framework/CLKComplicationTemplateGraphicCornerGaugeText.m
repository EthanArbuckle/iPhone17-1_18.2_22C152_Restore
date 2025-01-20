@interface CLKComplicationTemplateGraphicCornerGaugeText
+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)leadingTextProvider;
- (CLKTextProvider)outerTextProvider;
- (CLKTextProvider)trailingTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider;
- (void)setLeadingTextProvider:(CLKTextProvider *)leadingTextProvider;
- (void)setOuterTextProvider:(CLKTextProvider *)outerTextProvider;
- (void)setTrailingTextProvider:(CLKTextProvider *)trailingTextProvider;
@end

@implementation CLKComplicationTemplateGraphicCornerGaugeText

- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  return [(CLKComplicationTemplateGraphicCornerGaugeText *)self initWithGaugeProvider:gaugeProvider leadingTextProvider:0 trailingTextProvider:0 outerTextProvider:outerTextProvider];
}

- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = outerTextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCornerGaugeText;
  v14 = [(CLKComplicationTemplate *)&v17 initPrivate];
  v15 = v14;
  if (v14)
  {
    [(CLKComplicationTemplateGraphicCornerGaugeText *)v14 setGaugeProvider:v10];
    [(CLKComplicationTemplateGraphicCornerGaugeText *)v15 setLeadingTextProvider:v11];
    [(CLKComplicationTemplateGraphicCornerGaugeText *)v15 setTrailingTextProvider:v12];
    [(CLKComplicationTemplateGraphicCornerGaugeText *)v15 setOuterTextProvider:v13];
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  v6 = outerTextProvider;
  v7 = gaugeProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v7 outerTextProvider:v6];

  return (CLKComplicationTemplateGraphicCornerGaugeText *)v8;
}

+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  v10 = outerTextProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)[objc_alloc((Class)a1) initWithGaugeProvider:v13 leadingTextProvider:v12 trailingTextProvider:v11 outerTextProvider:v10];

  return (CLKComplicationTemplateGraphicCornerGaugeText *)v14;
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
  if (!v4)
  {
    v3[2](v3, @"trailingTextProvider", 1, 1, &v4);
    if (!v4) {
      v3[2](v3, @"outerTextProvider", 0, 1, &v4);
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

- (CLKTextProvider)outerTextProvider
{
  return self->_outerTextProvider;
}

- (void)setOuterTextProvider:(CLKTextProvider *)outerTextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerTextProvider, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end