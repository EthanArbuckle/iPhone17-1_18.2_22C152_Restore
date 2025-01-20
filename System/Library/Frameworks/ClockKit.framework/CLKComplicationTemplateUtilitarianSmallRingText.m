@interface CLKComplicationTemplateUtilitarianSmallRingText
+ (CLKComplicationTemplateUtilitarianSmallRingText)templateWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
- (CLKComplicationRingStyle)ringStyle;
- (CLKComplicationTemplateUtilitarianSmallRingText)initWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle;
- (CLKTextProvider)textProvider;
- (float)fillFraction;
- (int64_t)compatibleFamily;
- (void)_enumerateFloatKeysWithBlock:(id)a3;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setFillFraction:(float)fillFraction;
- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateUtilitarianSmallRingText

- (CLKComplicationTemplateUtilitarianSmallRingText)initWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = textProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateUtilitarianSmallRingText;
  v9 = [(CLKComplicationTemplate *)&v13 initPrivate];
  v10 = v9;
  if (v9)
  {
    [(CLKComplicationTemplateUtilitarianSmallRingText *)v9 setTextProvider:v8];
    *(float *)&double v11 = fillFraction;
    [(CLKComplicationTemplateUtilitarianSmallRingText *)v10 setFillFraction:v11];
    [(CLKComplicationTemplateUtilitarianSmallRingText *)v10 setRingStyle:ringStyle];
  }

  return v10;
}

+ (CLKComplicationTemplateUtilitarianSmallRingText)templateWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  v8 = textProvider;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = fillFraction;
  double v11 = (void *)[v9 initWithTextProvider:v8 fillFraction:ringStyle ringStyle:v10];

  return (CLKComplicationTemplateUtilitarianSmallRingText *)v11;
}

- (int64_t)compatibleFamily
{
  return 2;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void, char *))a3 + 2))(a3, @"fillFraction", 1, 0, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, void *, char *))a3 + 2))(a3, @"ringStyle", 1, &__block_literal_global_786, &v3);
}

BOOL __82__CLKComplicationTemplateUtilitarianSmallRingText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)fillFraction
{
  self->_fillFraction = fillFraction;
}

- (CLKComplicationRingStyle)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle
{
  self->_ringStyle = ringStyle;
}

- (void).cxx_destruct
{
}

@end