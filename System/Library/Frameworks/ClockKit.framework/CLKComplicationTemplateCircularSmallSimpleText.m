@interface CLKComplicationTemplateCircularSmallSimpleText
+ (CLKComplicationTemplateCircularSmallSimpleText)templateWithTextProvider:(CLKTextProvider *)textProvider;
- (CLKComplicationTemplateCircularSmallSimpleText)init;
- (CLKComplicationTemplateCircularSmallSimpleText)initWithTextProvider:(CLKTextProvider *)textProvider;
- (CLKTextProvider)textProvider;
- (int64_t)compatibleFamily;
- (int64_t)maxDynamicFontSize;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setMaxDynamicFontSize:(int64_t)a3;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateCircularSmallSimpleText

- (CLKComplicationTemplateCircularSmallSimpleText)init
{
  return [(CLKComplicationTemplateCircularSmallSimpleText *)self initWithTextProvider:0];
}

- (CLKComplicationTemplateCircularSmallSimpleText)initWithTextProvider:(CLKTextProvider *)textProvider
{
  v4 = textProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateCircularSmallSimpleText;
  v5 = [(CLKComplicationTemplate *)&v8 initPrivate];
  v6 = v5;
  if (v5)
  {
    v5->_maxDynamicFontSize = 4;
    [(CLKComplicationTemplateCircularSmallSimpleText *)v5 setTextProvider:v4];
  }

  return v6;
}

+ (CLKComplicationTemplateCircularSmallSimpleText)templateWithTextProvider:(CLKTextProvider *)textProvider
{
  v4 = textProvider;
  v5 = (void *)[objc_alloc((Class)a1) initWithTextProvider:v4];

  return (CLKComplicationTemplateCircularSmallSimpleText *)v5;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"maxDynamicFontSize", 0, &__block_literal_global_819, &v3);
}

BOOL __81__CLKComplicationTemplateCircularSmallSimpleText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationDynamicFontSize(a2);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
}

- (int64_t)maxDynamicFontSize
{
  return self->_maxDynamicFontSize;
}

- (void)setMaxDynamicFontSize:(int64_t)a3
{
  self->_maxDynamicFontSize = a3;
}

- (void).cxx_destruct
{
}

@end