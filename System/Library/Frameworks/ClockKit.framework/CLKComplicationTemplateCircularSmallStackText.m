@interface CLKComplicationTemplateCircularSmallStackText
+ (CLKComplicationTemplateCircularSmallStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKComplicationTemplateCircularSmallStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKTextProvider)line1TextProvider;
- (CLKTextProvider)line2TextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setLine1TextProvider:(CLKTextProvider *)line1TextProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateCircularSmallStackText

- (CLKComplicationTemplateCircularSmallStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1TextProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateCircularSmallStackText;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateCircularSmallStackText *)v8 setLine1TextProvider:v6];
    [(CLKComplicationTemplateCircularSmallStackText *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateCircularSmallStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1TextProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1TextProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateCircularSmallStackText *)v8;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"line1TextProvider", 0, 1, &v4);
  if (!v4) {
    v3[2](v3, @"line2TextProvider", 0, 1, &v4);
  }
}

- (CLKTextProvider)line1TextProvider
{
  return self->_line1TextProvider;
}

- (void)setLine1TextProvider:(CLKTextProvider *)line1TextProvider
{
}

- (CLKTextProvider)line2TextProvider
{
  return self->_line2TextProvider;
}

- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);

  objc_storeStrong((id *)&self->_line1TextProvider, 0);
}

@end