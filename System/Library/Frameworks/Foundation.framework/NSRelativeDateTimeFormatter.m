@interface NSRelativeDateTimeFormatter
- (NSCalendar)calendar;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSRelativeDateTimeFormatterStyle)dateTimeStyle;
- (NSRelativeDateTimeFormatterUnitsStyle)unitsStyle;
- (NSString)localizedStringForDate:(NSDate *)date relativeToDate:(NSDate *)referenceDate;
- (NSString)localizedStringFromTimeInterval:(NSTimeInterval)timeInterval;
- (NSString)stringForObjectValue:(id)obj;
- (id)_stringForCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)_stringFromDateComponents:(id)a3;
- (void)_clearFormatter;
- (void)dealloc;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDateTimeStyle:(NSRelativeDateTimeFormatterStyle)dateTimeStyle;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setLocale:(NSLocale *)locale;
- (void)setUnitsStyle:(NSRelativeDateTimeFormatterUnitsStyle)unitsStyle;
@end

@implementation NSRelativeDateTimeFormatter

- (void)_clearFormatter
{
  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  self->_formatter = 0;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  if (self->_formattingContext != formattingContext)
  {
    self->_formattingContext = formattingContext;
    [(NSRelativeDateTimeFormatter *)self _clearFormatter];
  }
}

- (void)setDateTimeStyle:(NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  if (self->_dateTimeStyle != dateTimeStyle)
  {
    self->_dateTimeStyle = dateTimeStyle;
    [(NSRelativeDateTimeFormatter *)self _clearFormatter];
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSRelativeDateTimeFormatter;
  [(NSRelativeDateTimeFormatter *)&v4 dealloc];
}

- (void)setLocale:(NSLocale *)locale
{
  v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)[(NSLocale *)locale copy];

    [(NSRelativeDateTimeFormatter *)self _clearFormatter];
  }
}

- (NSLocale)locale
{
  if (self->_locale) {
    return self->_locale;
  }
  v3 = [(NSRelativeDateTimeFormatter *)self calendar];

  return [(NSCalendar *)v3 locale];
}

- (void)setCalendar:(NSCalendar *)calendar
{
  v3 = self->_calendar;
  if (v3 != calendar)
  {
    self->_calendar = (NSCalendar *)[(NSCalendar *)calendar copy];

    [(NSRelativeDateTimeFormatter *)self _clearFormatter];
  }
}

- (NSCalendar)calendar
{
  result = self->_calendar;
  if (!result) {
    return (NSCalendar *)[MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  }
  return result;
}

- (void)setUnitsStyle:(NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  if (self->_unitsStyle != unitsStyle)
  {
    self->_unitsStyle = unitsStyle;
    [(NSRelativeDateTimeFormatter *)self _clearFormatter];
  }
}

- (NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  return self->_unitsStyle;
}

- (NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  return self->_dateTimeStyle;
}

- (NSFormattingContext)formattingContext
{
  return self->_formattingContext;
}

- (NSString)localizedStringFromTimeInterval:(NSTimeInterval)timeInterval
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:timeInterval];

  return [(NSRelativeDateTimeFormatter *)self localizedStringForDate:v6 relativeToDate:v5];
}

- (NSString)localizedStringForDate:(NSDate *)date relativeToDate:(NSDate *)referenceDate
{
  uint64_t v5 = [(NSCalendar *)[(NSRelativeDateTimeFormatter *)self calendar] components:4348 fromDate:referenceDate toDate:date options:0];

  return (NSString *)[(NSRelativeDateTimeFormatter *)self _stringFromDateComponents:v5];
}

- (NSString)stringForObjectValue:(id)obj
{
  if (!obj || !_NSIsNSDate()) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];

  return [(NSRelativeDateTimeFormatter *)self localizedStringForDate:obj relativeToDate:v5];
}

- (id)_stringForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  if (!self->_formatter)
  {
    [(NSRelativeDateTimeFormatter *)self locale];
    self->_formatter = (__CFRelativeDateTimeFormatter *)_CFRelativeDateTimeFormatterCreate();
  }
  StringWithCalendarUnit = (const void *)_CFRelativeDateTimeFormatterCreateStringWithCalendarUnit();

  return (id)CFAutorelease(StringWithCalendarUnit);
}

- (id)_stringFromDateComponents:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke;
  v10 = &unk_1E51F8E68;
  id v11 = a3;
  v12 = &v18;
  v13 = &v14;
  do
  {
    char v22 = 0;
    v9((uint64_t)v8, allAllowedUnits[v4], &v22);
    if (v22) {
      break;
    }
  }
  while (v4++ != 6);
  if (v19[3] && v15[3] != 0x7FFFFFFFFFFFFFFFLL) {
    id v6 = -[NSRelativeDateTimeFormatter _stringForCalendarUnit:value:](self, "_stringForCalendarUnit:value:");
  }
  else {
    id v6 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (result) {
      *a3 = 1;
    }
  }
  return result;
}

@end