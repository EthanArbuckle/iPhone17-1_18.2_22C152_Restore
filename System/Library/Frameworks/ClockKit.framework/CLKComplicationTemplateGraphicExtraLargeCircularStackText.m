@interface CLKComplicationTemplateGraphicExtraLargeCircularStackText
+ (CLKComplicationTemplateGraphicExtraLargeCircularStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (BOOL)highlightLine2;
- (CLKComplicationTemplateGraphicExtraLargeCircularStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider;
- (CLKTextProvider)line1TextProvider;
- (CLKTextProvider)line2TextProvider;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (unint64_t)highlightMode;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setHighlightLine2:(BOOL)a3;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setLine1TextProvider:(CLKTextProvider *)line1TextProvider;
- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularStackText

- (CLKComplicationTemplateGraphicExtraLargeCircularStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line1TextProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularStackText;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicExtraLargeCircularStackText *)v8 setLine1TextProvider:v6];
    [(CLKComplicationTemplateGraphicExtraLargeCircularStackText *)v9 setLine2TextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  v6 = line2TextProvider;
  v7 = line1TextProvider;
  v8 = (void *)[objc_alloc((Class)a1) initWithLine1TextProvider:v7 line2TextProvider:v6];

  return (CLKComplicationTemplateGraphicExtraLargeCircularStackText *)v8;
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

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"highlightMode", 0, &__block_literal_global_1649, &v3);
}

BOOL __92__CLKComplicationTemplateGraphicExtraLargeCircularStackText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)a3
{
}

- (BOOL)highlightLine2
{
  return [(CLKComplicationTemplateGraphicExtraLargeCircularStackText *)self highlightMode] != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularStackText;
  id v7 = [(CLKComplicationTemplate *)&v10 initPrivateWithJSONObjectRepresentation:v6 bundle:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"highlightLine2"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"highlightLine2", v8 format];
      }
      objc_msgSend(v7, "setHighlightLine2:", objc_msgSend(v8, "BOOLValue"));
    }
  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularStackText;
  char v4 = [(CLKComplicationTemplate *)&v7 JSONObjectRepresentationWritingResourcesToBundlePath:a3 purpose:0];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CLKComplicationTemplateGraphicExtraLargeCircularStackText highlightLine2](self, "highlightLine2"));
  [v4 setObject:v5 forKeyedSubscript:@"highlightLine2"];

  return v4;
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

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);

  objc_storeStrong((id *)&self->_line1TextProvider, 0);
}

@end