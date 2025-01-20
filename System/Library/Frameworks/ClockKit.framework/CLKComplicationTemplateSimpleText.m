@interface CLKComplicationTemplateSimpleText
+ (id)templateWithTextProvider:(id)a3;
- (CLKComplicationTemplateSimpleText)initWithTextProvider:(id)a3;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateSimpleText

- (CLKComplicationTemplateSimpleText)initWithTextProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateSimpleText;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5) {
    [(CLKComplicationTemplateSimpleText *)v5 setTextProvider:v4];
  }

  return v6;
}

+ (id)templateWithTextProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v4];

  return v5;
}

- (int64_t)compatibleFamily
{
  return 106;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
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
}

@end