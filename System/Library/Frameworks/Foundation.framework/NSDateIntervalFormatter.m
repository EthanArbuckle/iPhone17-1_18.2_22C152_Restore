@interface NSDateIntervalFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
- (NSCalendar)calendar;
- (NSDateIntervalFormatter)init;
- (NSDateIntervalFormatter)initWithCoder:(id)a3;
- (NSDateIntervalFormatterStyle)dateStyle;
- (NSDateIntervalFormatterStyle)timeStyle;
- (NSLocale)locale;
- (NSString)dateTemplate;
- (NSString)stringFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
- (NSString)stringFromDateInterval:(NSDateInterval *)dateInterval;
- (NSTimeZone)timeZone;
- (id)_stringFromDate:(id)a3 toDate:(id)a4;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)editingStringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (unint64_t)boundaryStyle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundaryStyle:(unint64_t)a3;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDateStyle:(NSDateIntervalFormatterStyle)dateStyle;
- (void)setDateTemplate:(NSString *)dateTemplate;
- (void)setLocale:(NSLocale *)locale;
- (void)setTimeStyle:(NSDateIntervalFormatterStyle)timeStyle;
- (void)setTimeZone:(NSTimeZone *)timeZone;
@end

@implementation NSDateIntervalFormatter

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 startDate];
  uint64_t v6 = [a3 endDate];

  return [(NSDateIntervalFormatter *)self _stringFromDate:v5 toDate:v6];
}

- (id)_stringFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_modified && self->_formatter)
  {
    udtitvfmt_close();
    self->_formatter = 0;
    self->_modified = 0;
  }
  if (!self->_formatter)
  {
    id v23 = a3;
    locale = self->_locale;
    if (!locale) {
      locale = (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    }
    calendar = self->_calendar;
    uint64_t v10 = *MEMORY[0x1E4F1C3E0];
    if (!calendar) {
      calendar = [(NSLocale *)locale objectForKey:*MEMORY[0x1E4F1C3E0]];
    }
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "componentsFromLocaleIdentifier:", -[NSLocale localeIdentifier](locale, "localeIdentifier", v23)), "mutableCopy");
    [v11 setObject:calendar forKey:v10];
    v12 = (void *)[MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v11];

    int v38 = 0;
    memset(v37, 0, sizeof(v37));
    [v12 getCString:v37 maxLength:100 encoding:4];
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    timeZone = self->_timeZone;
    if (!timeZone) {
      timeZone = (NSTimeZone *)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    v14 = [(NSTimeZone *)timeZone name];
    [(NSString *)v14 getCharacters:v25];
    uint64_t v15 = 6;
    if (!self->_useTemplate) {
      uint64_t v15 = 7;
    }
    v16 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NSDateIntervalFormatter__modified[v15]);
    uint64_t v36 = 0;
    memset(v35, 0, sizeof(v35));
    [v16 getCharacters:v35];
    [v16 length];
    [(NSString *)v14 length];
    self->_formatter = (UDateIntervalFormat *)udtitvfmt_open();
    if (!self->_formatter)
    {
      v17 = _NSOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v22 = u_errorName(U_ZERO_ERROR);
        *(_DWORD *)buf = 136315906;
        v28 = v37;
        __int16 v29 = 2112;
        v30 = v16;
        __int16 v31 = 2112;
        v32 = v14;
        __int16 v33 = 2080;
        v34 = v22;
        _os_log_error_impl(&dword_181795000, v17, OS_LOG_TYPE_ERROR, "udtitvfmt_open failed!  Formatter is NULL! -- locale: %s, template: %@, timezone: %@, status: %s", buf, 0x2Au);
      }
    }
    if (self->_formatter) {
      udtitvfmt_setAttribute();
    }
    a3 = v24;
  }
  if (self->_formatter)
  {
    [a3 timeIntervalSince1970];
    [a4 timeIntervalSince1970];
    bzero(v25, 0x7D0uLL);
    v35[0] = 0;
    int v18 = udtitvfmt_format();
    if (v18 < 1001)
    {
      v20 = +[NSString stringWithCharacters:v25 length:v18];
    }
    else
    {
      v19 = malloc_type_calloc(v18, 2uLL, 0x1000040BDFB0063uLL);
      v35[0] = 0;
      v20 = +[NSString stringWithCharacters:v19 length:(int)udtitvfmt_format()];
      free(v19);
    }
  }
  else
  {
    v20 = (NSString *)&stru_1ECA5C228;
  }
  os_unfair_lock_unlock(p_lock);
  return v20;
}

- (NSLocale)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  locale = self->_locale;
  if (!locale) {
    locale = (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
  }
  uint64_t v5 = locale;
  os_unfair_lock_unlock(p_lock);

  return locale;
}

- (NSString)dateTemplate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = 6;
  if (!self->_useTemplate) {
    uint64_t v4 = 7;
  }
  uint64_t v5 = *(NSString **)((char *)&self->super.super.isa + OBJC_IVAR___NSDateIntervalFormatter__modified[v4]);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSString)stringFromDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateIntervalFormatter.m", 336, @"Invalid parameter not satisfying: %@", @"dateInterval != nil" object file lineNumber description];
  }

  return (NSString *)[(NSDateIntervalFormatter *)self stringForObjectValue:dateInterval];
}

- (void)setDateTemplate:(NSString *)dateTemplate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSString *)self->_dateTemplate isEqualToString:dateTemplate])
  {

    self->_dateTemplate = (NSString *)[(NSString *)dateTemplate copyWithZone:0];
    self->_modified = 1;
    self->_useTemplate = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDateIntervalFormatter)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSDateIntervalFormatter;
  v2 = [(NSDateIntervalFormatter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_modified = 0;
    v2->_useTemplate = 0;
    v2->_locale = 0;
    v2->_calendar = 0;
    v2->_timeZone = 0;
    v2->_formatter = 0;
    v2->_dateTemplate = (NSString *)&stru_1ECA5C228;
    v3->_dateTemplateFromStyles = 0;
    v3->_dateStyle = 1;
    v3->_timeStyle = 1;
    v3->_boundaryStyle = 0;
    updateDateTemplate((uint64_t)v3, v3->_dateStyle, v3->_timeStyle);
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  locale = self->_locale;
  if (locale)
  {

    self->_locale = 0;
  }
  calendar = self->_calendar;
  if (calendar)
  {

    self->_calendar = 0;
  }
  timeZone = self->_timeZone;
  if (timeZone)
  {

    self->_timeZone = 0;
  }
  if (self->_formatter)
  {
    udtitvfmt_close();
    self->_formatter = 0;
  }
  dateTemplate = self->_dateTemplate;
  if (dateTemplate)
  {

    self->_dateTemplate = 0;
  }
  dateTemplateFromStyles = self->_dateTemplateFromStyles;
  if (dateTemplateFromStyles)
  {

    self->_dateTemplateFromStyles = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateIntervalFormatter;
  [(NSDateIntervalFormatter *)&v8 dealloc];
}

- (void)setLocale:(NSLocale *)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_locale;
  if (v6 != locale)
  {

    self->_locale = (NSLocale *)[(NSLocale *)locale copyWithZone:0];
    self->_modified = 1;
    updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSCalendar)calendar
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  calendar = self->_calendar;
  if (!calendar)
  {
    locale = self->_locale;
    if (!locale) {
      locale = (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    }
    calendar = [(NSLocale *)locale objectForKey:*MEMORY[0x1E4F1C3E0]];
  }
  uint64_t v6 = calendar;
  os_unfair_lock_unlock(p_lock);

  return calendar;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_calendar;
  if (v6 != calendar)
  {

    self->_calendar = (NSCalendar *)[(NSCalendar *)calendar copyWithZone:0];
    self->_modified = 1;
    updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSTimeZone)timeZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timeZone = self->_timeZone;
  if (!timeZone) {
    timeZone = (NSTimeZone *)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  objc_super v5 = timeZone;
  os_unfair_lock_unlock(p_lock);

  return timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_timeZone;
  if (v6 != timeZone)
  {

    self->_timeZone = (NSTimeZone *)[(NSTimeZone *)timeZone copyWithZone:0];
    self->_modified = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDateIntervalFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateIntervalFormatterStyle dateStyle = self->_dateStyle;
  os_unfair_lock_unlock(p_lock);
  return dateStyle;
}

- (void)setDateStyle:(NSDateIntervalFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_NSDateIntervalFormatterStyle dateStyle = dateStyle;
  self->_modified = 1;
  self->_useTemplate = 0;
  updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);

  os_unfair_lock_unlock(p_lock);
}

- (NSDateIntervalFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateIntervalFormatterStyle timeStyle = self->_timeStyle;
  os_unfair_lock_unlock(p_lock);
  return timeStyle;
}

- (void)setTimeStyle:(NSDateIntervalFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_NSDateIntervalFormatterStyle timeStyle = timeStyle;
  self->_modified = 1;
  self->_useTemplate = 0;
  updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)boundaryStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t boundaryStyle = self->_boundaryStyle;
  os_unfair_lock_unlock(p_lock);
  return boundaryStyle;
}

- (void)setBoundaryStyle:(unint64_t)a3
{
  if (a3 >= 3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateIntervalFormatter.m", 319, @"Invalid parameter not satisfying: %@", @"boundaryStyle == NSDateIntervalFormatterBoundaryStyleDefault || boundaryStyle == NSDateIntervalFormatterBoundaryStyleMinimizeAdjacentMonths || boundaryStyle == NSDateIntervalFormatterBoundaryStyleMinimizeAdjacentDays" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t boundaryStyle = a3;
  self->_modified = 1;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stringFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
  if (fromDate)
  {
    if (toDate) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateIntervalFormatter.m", 330, @"Invalid parameter not satisfying: %@", @"fromDate != nil" object file lineNumber description];
    if (toDate) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateIntervalFormatter.m", 331, @"Invalid parameter not satisfying: %@", @"toDate != nil" object file lineNumber description];
LABEL_3:

  return (NSString *)[(NSDateIntervalFormatter *)self _stringFromDate:fromDate toDate:toDate];
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return 0;
}

- (id)editingStringForObjectValue:(id)a3
{
  return 0;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v6 + 8) = [(NSLocale *)self->_locale copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSCalendar *)self->_calendar copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSTimeZone *)self->_timeZone copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_dateTemplate copyWithZone:a3];
  *(void *)(v6 + 40) = [(NSString *)self->_dateTemplateFromStyles copyWithZone:a3];
  *(void *)(v6 + 56) = self->_dateStyle;
  *(void *)(v6 + 64) = self->_timeStyle;
  *(unsigned char *)(v6 + 84) = self->_modified;
  *(unsigned char *)(v6 + 85) = self->_useTemplate;
  os_unfair_lock_unlock(p_lock);
  return (id)v6;
}

- (NSDateIntervalFormatter)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateIntervalFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateIntervalFormatter;
  objc_super v5 = [(NSFormatter *)&v8 initWithCoder:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_NSDateIntervalFormatterStyle dateStyle = [a3 decodeInt64ForKey:@"NS.dateStyle"];
    v6->_NSDateIntervalFormatterStyle timeStyle = [a3 decodeInt64ForKey:@"NS.timeStyle"];
    v6->_dateTemplate = (NSString *)(id)[a3 decodeObjectForKey:@"NS.dateTemplate"];
    v6->_dateTemplateFromStyles = (NSString *)(id)[a3 decodeObjectForKey:@"NS.dateTemplateFromStyles"];
    v6->_modified = [a3 decodeBoolForKey:@"NS.modified"];
    v6->_useTemplate = [a3 decodeBoolForKey:@"NS.useTemplate"];
    v6->_locale = 0;
    v6->_calendar = 0;
    v6->_timeZone = 0;
    if ([a3 containsValueForKey:@"NS.locale"]) {
      v6->_locale = (NSLocale *)(id)[a3 decodeObjectForKey:@"NS.locale"];
    }
    if ([a3 containsValueForKey:@"NS.calendar"]) {
      v6->_calendar = (NSCalendar *)(id)[a3 decodeObjectForKey:@"NS.calendar"];
    }
    if ([a3 containsValueForKey:@"NS.timeZone"]) {
      v6->_timeZone = (NSTimeZone *)(id)[a3 decodeObjectForKey:@"NS.timeZone"];
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateIntervalFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  [a3 encodeInt64:self->_dateStyle forKey:@"NS.dateStyle"];
  [a3 encodeInt64:self->_timeStyle forKey:@"NS.timeStyle"];
  [a3 encodeObject:self->_dateTemplate forKey:@"NS.dateTemplate"];
  [a3 encodeObject:self->_dateTemplateFromStyles forKey:@"NS.dateTemplateFromStyles"];
  [a3 encodeBool:self->_modified forKey:@"NS.modified"];
  [a3 encodeBool:self->_useTemplate forKey:@"NS.useTemplate"];
  locale = self->_locale;
  if (locale) {
    [a3 encodeObject:locale forKey:@"NS.locale"];
  }
  calendar = self->_calendar;
  if (calendar) {
    [a3 encodeObject:calendar forKey:@"NS.calendar"];
  }
  timeZone = self->_timeZone;
  if (timeZone) {
    [a3 encodeObject:timeZone forKey:@"NS.timeZone"];
  }

  os_unfair_lock_unlock(&self->_lock);
}

@end