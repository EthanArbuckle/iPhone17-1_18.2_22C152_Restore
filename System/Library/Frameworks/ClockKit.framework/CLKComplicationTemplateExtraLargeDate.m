@interface CLKComplicationTemplateExtraLargeDate
+ (id)templateWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4;
- (BOOL)highlightLine2;
- (CLKComplicationTemplateExtraLargeDate)initWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4;
- (CLKDateTextProvider)dayTextProvider;
- (CLKDateTextProvider)weekdayTextProvider;
- (int64_t)compatibleFamily;
- (unint64_t)highlightMode;
- (void)_enumerateIntegerKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setDayTextProvider:(id)a3;
- (void)setHighlightLine2:(BOOL)a3;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setWeekdayTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateExtraLargeDate

- (CLKComplicationTemplateExtraLargeDate)initWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateExtraLargeDate;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateExtraLargeDate *)v8 setWeekdayTextProvider:v6];
    [(CLKComplicationTemplateExtraLargeDate *)v9 setDayTextProvider:v7];
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
  return 7;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  id v3 = a3;
  char v4 = 0;
  (*((void (**)(id, __CFString *, void, void, char *))v3 + 2))(v3, @"weekdayTextProvider", 0, 0, &v4);
  if (!v4) {
    (*((void (**)(id, __CFString *, void, void, char *))v3 + 2))(v3, @"dayTextProvider", 0, 0, &v4);
  }
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, void *, char *))a3 + 2))(a3, @"highlightMode", 0, &__block_literal_global_991, &v3);
}

BOOL __72__CLKComplicationTemplateExtraLargeDate__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)a3
{
}

- (BOOL)highlightLine2
{
  return [(CLKComplicationTemplateExtraLargeDate *)self highlightMode] != 0;
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