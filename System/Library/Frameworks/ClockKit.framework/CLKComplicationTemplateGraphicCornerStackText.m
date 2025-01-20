@interface CLKComplicationTemplateGraphicCornerStackText
+ (CLKComplicationTemplateGraphicCornerStackText)templateWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
- (CLKComplicationTemplateGraphicCornerStackText)initWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider;
- (CLKTextProvider)innerTextProvider;
- (CLKTextProvider)outerTextProvider;
- (int64_t)compatibleFamily;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setInnerTextProvider:(CLKTextProvider *)innerTextProvider;
- (void)setOuterTextProvider:(CLKTextProvider *)outerTextProvider;
@end

@implementation CLKComplicationTemplateGraphicCornerStackText

- (CLKComplicationTemplateGraphicCornerStackText)initWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  v6 = innerTextProvider;
  v7 = outerTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCornerStackText;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicCornerStackText *)v8 setInnerTextProvider:v6];
    [(CLKComplicationTemplateGraphicCornerStackText *)v9 setOuterTextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCornerStackText)templateWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  v6 = outerTextProvider;
  v7 = innerTextProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithInnerTextProvider:v7 outerTextProvider:v6];

  return (CLKComplicationTemplateGraphicCornerStackText *)v8;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"innerTextProvider", 0, 1, &v4);
  if (!v4) {
    v3[2](v3, @"outerTextProvider", 0, 1, &v4);
  }
}

- (CLKTextProvider)innerTextProvider
{
  return self->_innerTextProvider;
}

- (void)setInnerTextProvider:(CLKTextProvider *)innerTextProvider
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

  objc_storeStrong((id *)&self->_innerTextProvider, 0);
}

@end