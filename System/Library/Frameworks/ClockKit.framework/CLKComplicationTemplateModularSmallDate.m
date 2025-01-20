@interface CLKComplicationTemplateModularSmallDate
+ (id)templateWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4;
- (BOOL)highlightLine2;
- (CLKComplicationTemplateModularSmallDate)initWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4;
- (CLKDateTextProvider)dayTextProvider;
- (CLKDateTextProvider)weekdayTextProvider;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3;
- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (int64_t)compatibleFamily;
- (unint64_t)highlightMode;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setDayTextProvider:(id)a3;
- (void)setHighlightLine2:(BOOL)a3;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setWeekdayTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateModularSmallDate

- (CLKComplicationTemplateModularSmallDate)initWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateModularSmallDate;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateModularSmallDate *)v8 setWeekdayTextProvider:v6];
    [(CLKComplicationTemplateModularSmallDate *)v9 setDayTextProvider:v7];
  }

  return v9;
}

+ (id)templateWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithWeekdayTextProvider:v7 dayTextProvider:v6];

  return v8;
}

- (int64_t)compatibleFamily
{
  return 0;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"weekdayTextProvider", 0, 1, &v4);
  if (!v4) {
    v3[2](v3, @"dayTextProvider", 0, 1, &v4);
  }
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"highlightMode", 0, &__block_literal_global_528, &v3);
}

BOOL __74__CLKComplicationTemplateModularSmallDate__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)a3
{
}

- (BOOL)highlightLine2
{
  return [(CLKComplicationTemplateModularSmallDate *)self highlightMode] != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateModularSmallDate;
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
  v7.super_class = (Class)CLKComplicationTemplateModularSmallDate;
  char v4 = [(CLKComplicationTemplate *)&v7 JSONObjectRepresentationWritingResourcesToBundlePath:a3 purpose:0];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CLKComplicationTemplateModularSmallDate highlightLine2](self, "highlightLine2"));
  [v4 setObject:v5 forKeyedSubscript:@"highlightLine2"];

  return v4;
}

- (CLKDateTextProvider)weekdayTextProvider
{
  return self->_weekdayTextProvider;
}

- (void)setWeekdayTextProvider:(id)a3
{
}

- (CLKDateTextProvider)dayTextProvider
{
  return self->_dayTextProvider;
}

- (void)setDayTextProvider:(id)a3
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
  objc_storeStrong((id *)&self->_dayTextProvider, 0);

  objc_storeStrong((id *)&self->_weekdayTextProvider, 0);
}

@end