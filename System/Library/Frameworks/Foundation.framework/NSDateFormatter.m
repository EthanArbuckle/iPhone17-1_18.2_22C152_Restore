@interface NSDateFormatter
+ (NSDateFormatterBehavior)defaultFormatterBehavior;
+ (NSString)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale;
+ (NSString)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle;
+ (id)_componentsFromFormatString:(id)a3;
+ (id)_formatStringFromComponents:(id)a3;
+ (void)initialize;
+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)defaultFormatterBehavior;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_tracksCacheGenerationCount;
- (BOOL)_usesCharacterDirection;
- (BOOL)doesRelativeDateFormatting;
- (BOOL)generatesCalendarDates;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error;
- (BOOL)isLenient;
- (NSArray)eraSymbols;
- (NSArray)longEraSymbols;
- (NSArray)monthSymbols;
- (NSArray)quarterSymbols;
- (NSArray)shortMonthSymbols;
- (NSArray)shortQuarterSymbols;
- (NSArray)shortStandaloneMonthSymbols;
- (NSArray)shortStandaloneQuarterSymbols;
- (NSArray)shortStandaloneWeekdaySymbols;
- (NSArray)shortWeekdaySymbols;
- (NSArray)standaloneMonthSymbols;
- (NSArray)standaloneQuarterSymbols;
- (NSArray)standaloneWeekdaySymbols;
- (NSArray)veryShortMonthSymbols;
- (NSArray)veryShortStandaloneMonthSymbols;
- (NSArray)veryShortStandaloneWeekdaySymbols;
- (NSArray)veryShortWeekdaySymbols;
- (NSArray)weekdaySymbols;
- (NSCalendar)calendar;
- (NSDate)dateFromString:(NSString *)string;
- (NSDate)defaultDate;
- (NSDate)gregorianStartDate;
- (NSDate)twoDigitStartDate;
- (NSDateFormatter)init;
- (NSDateFormatter)initWithCoder:(id)a3;
- (NSDateFormatterBehavior)formatterBehavior;
- (NSDateFormatterStyle)dateStyle;
- (NSDateFormatterStyle)timeStyle;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSString)AMSymbol;
- (NSString)PMSymbol;
- (NSString)dateFormat;
- (NSString)stringFromDate:(NSDate *)date;
- (NSTimeZone)timeZone;
- (id)_attributedStringWithFieldsFromDate:(id)a3;
- (id)_dateFormat;
- (id)_getLocaleAlreadyLocked:(BOOL)a3;
- (id)_locale_forOldMethods;
- (id)_nextChangeDateAfterDate:(id)a3;
- (id)_timeZone_forOldMethods;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)_cacheGenerationCount;
- (void)_clearFormatter;
- (void)_invalidateCache;
- (void)_regenerateFormatter;
- (void)_regenerateFormatterIfAbsent;
- (void)_reset;
- (void)_setDateFormat:(id)a3;
- (void)_setDateFormat:(id)a3 alreadyLocked:(BOOL)a4;
- (void)_setIsLenient:(BOOL)a3;
- (void)_setUsesCharacterDirection:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setAMSymbol:(NSString *)AMSymbol;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDateFormat:(NSString *)dateFormat;
- (void)setDateStyle:(NSDateFormatterStyle)dateStyle;
- (void)setDefaultDate:(NSDate *)defaultDate;
- (void)setDoesRelativeDateFormatting:(BOOL)doesRelativeDateFormatting;
- (void)setEraSymbols:(NSArray *)eraSymbols;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setGeneratesCalendarDates:(BOOL)generatesCalendarDates;
- (void)setGregorianStartDate:(NSDate *)gregorianStartDate;
- (void)setLenient:(BOOL)lenient;
- (void)setLocale:(NSLocale *)locale;
- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate;
- (void)setLongEraSymbols:(NSArray *)longEraSymbols;
- (void)setMonthSymbols:(NSArray *)monthSymbols;
- (void)setPMSymbol:(NSString *)PMSymbol;
- (void)setQuarterSymbols:(NSArray *)quarterSymbols;
- (void)setShortMonthSymbols:(NSArray *)shortMonthSymbols;
- (void)setShortQuarterSymbols:(NSArray *)shortQuarterSymbols;
- (void)setShortStandaloneMonthSymbols:(NSArray *)shortStandaloneMonthSymbols;
- (void)setShortStandaloneQuarterSymbols:(NSArray *)shortStandaloneQuarterSymbols;
- (void)setShortStandaloneWeekdaySymbols:(NSArray *)shortStandaloneWeekdaySymbols;
- (void)setShortWeekdaySymbols:(NSArray *)shortWeekdaySymbols;
- (void)setStandaloneMonthSymbols:(NSArray *)standaloneMonthSymbols;
- (void)setStandaloneQuarterSymbols:(NSArray *)standaloneQuarterSymbols;
- (void)setStandaloneWeekdaySymbols:(NSArray *)standaloneWeekdaySymbols;
- (void)setTimeStyle:(NSDateFormatterStyle)timeStyle;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setTwoDigitStartDate:(NSDate *)twoDigitStartDate;
- (void)setVeryShortMonthSymbols:(NSArray *)veryShortMonthSymbols;
- (void)setVeryShortStandaloneMonthSymbols:(NSArray *)veryShortStandaloneMonthSymbols;
- (void)setVeryShortStandaloneWeekdaySymbols:(NSArray *)veryShortStandaloneWeekdaySymbols;
- (void)setVeryShortWeekdaySymbols:(NSArray *)veryShortWeekdaySymbols;
- (void)setWeekdaySymbols:(NSArray *)weekdaySymbols;
@end

@implementation NSDateFormatter

- (NSString)stringFromDate:(NSDate *)date
{
  if (date) {
    return (NSString *)-[NSDateFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else {
    return 0;
  }
}

+ (NSString)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale
{
  return (NSString *)_dateFormatFromTemplate((const __CFString *)tmplate, opts, (CFLocaleRef)locale);
}

+ (id)_componentsFromFormatString:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v29 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [a3 length];
  if (qword_1EB1ECB60 != -1) {
    dispatch_once(&qword_1EB1ECB60, &__block_literal_global_7);
  }
  v28 = (void *)_MergedGlobals_5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v32 = 0u;
  CFStringRef theString = (CFStringRef)a3;
  uint64_t v42 = 0;
  int64_t v43 = v4;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  v40 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  }
  int64_t v44 = 0;
  int64_t v45 = 0;
  v41 = CStringPtr;
  v7 = +[NSString string];
  if (v4 < 1)
  {
    uint64_t v11 = 0;
    uint64_t v20 = 0;
    int v18 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    UniChar v9 = 0;
    int64_t v10 = 0;
    uint64_t v11 = 0;
    char v12 = 0;
    char v13 = 1;
    uint64_t v14 = 64;
    for (i = v4; i != v10; uint64_t v20 = i)
    {
      if ((unint64_t)v10 >= 4) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = v10;
      }
      int64_t v16 = v43;
      if (v43 <= v10)
      {
        UniChar v17 = 0;
      }
      else if (v40)
      {
        UniChar v17 = v40[v10 + v42];
      }
      else if (v41)
      {
        UniChar v17 = v41[v42 + v10];
      }
      else
      {
        int64_t v21 = v44;
        if (v45 <= v10 || v44 > v10)
        {
          uint64_t v23 = v15 + v8;
          uint64_t v24 = v14 - v15;
          int64_t v25 = v10 - v15;
          int64_t v26 = v25 + 64;
          if (v25 + 64 >= v43) {
            int64_t v26 = v43;
          }
          int64_t v44 = v25;
          int64_t v45 = v26;
          if (v43 >= v24) {
            int64_t v16 = v24;
          }
          v47.length = v16 + v23;
          v47.location = v25 + v42;
          CFStringGetCharacters(theString, v47, buffer);
          int64_t v21 = v44;
        }
        UniChar v17 = buffer[v10 - v21];
      }
      if (v12) {
        int v18 = 0;
      }
      else {
        int v18 = [v28 characterIsMember:v17];
      }
      if ((v18 & 1) == 0 && ((v13 ^ 1) & 1) == 0 || (v17 != v9 ? (int v19 = v18) : (int v19 = 0), v19 == 1))
      {
        if (v10 > v11)
        {
          objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v10 - v11, (v13 ^ 1) & 1));
          v7 = +[NSString string];
          uint64_t v11 = v10;
        }
      }
      if (v17 == 39)
      {
        if (v9 == 39) {
          [(NSString *)v7 appendString:@"'"];
        }
        v12 ^= 1u;
      }
      else
      {
        [(NSString *)v7 appendFormat:@"%C", v17];
      }
      ++v10;
      --v8;
      ++v14;
      UniChar v9 = v17;
      char v13 = v18;
    }
  }
  if ([(NSString *)v7 length]) {
    objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v20 - v11, v18 ^ 1u));
  }
  return v29;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      char v4 = 0;
      uint64_t v5 = 256;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      CFStringRef v6 = 0;
      uint64_t v5 = 0xFFFFFFFFLL;
      char v4 = 1;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      char v4 = 0;
      uint64_t v5 = 260;
      goto LABEL_9;
    case NSFormattingContextListItem:
      char v4 = 0;
      uint64_t v5 = 259;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      char v4 = 0;
      uint64_t v5 = 258;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      char v4 = 0;
      uint64_t v5 = 257;
      goto LABEL_9;
    default:
      char v4 = 0;
      uint64_t v5 = 0;
LABEL_9:
      CFStringRef v6 = @"kCFDateFormatterFormattingContextKey";
LABEL_10:
      v7 = +[NSNumber numberWithInt:v5];
      os_unfair_lock_lock(&self->_lock);
      uint64_t v8 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formattingContext"];
      if ((v7 == 0) == (v8 != 0) || ([v8 isEqual:v7] & 1) == 0)
      {
        ++self->_cacheGeneration;
        id v9 = [(NSNumber *)v7 copyWithZone:0];
        [(NSMutableDictionary *)self->_attributes setValue:v9 forKey:@"formattingContext"];
        if ((v4 & 1) == 0)
        {
          if (v9 && (formatter = self->_formatter) != 0)
          {
            CFDateFormatterSetProperty(formatter, v6, v9);
          }
          else if (!v9)
          {
            [(NSDateFormatter *)self _clearFormatter];
          }
        }
      }
      os_unfair_lock_unlock(&self->_lock);
      return;
  }
}

- (NSDate)dateFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (!string) {
    return 0;
  }
  v4[0] = 0;
  if ([(NSDateFormatter *)self getObjectValue:v4 forString:string errorDescription:0])
  {
    return (NSDate *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  v16[1] = *(id *)MEMORY[0x1E4F143B8];
  v16[0] = 0;
  if (!getObjectValue_forString_errorDescription__baseIMP)
  {
    id v9 = objc_lookUpClass("NSDateFormatter");
    getObjectValue_forString_errorDescription__baseIMP = (uint64_t)class_getMethodImplementation(v9, sel_getObjectValue_forString_range_error_);
  }
  int64_t v10 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5) {
    char v12 = (NSError **)v16;
  }
  else {
    char v12 = 0;
  }
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP) {
    char ObjectValue = getObjectValue((uint64_t)self, a3, (__CFString *)a4, 0, 1, v12);
  }
  else {
    char ObjectValue = [(NSDateFormatter *)self getObjectValue:a3 forString:a4 range:0 error:v12];
  }
  BOOL v14 = ObjectValue;
  if (a5) {
    *a5 = (id)[v16[0] localizedDescription];
  }
  return v14;
}

- (BOOL)generatesCalendarDates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"generatesCalendarDates"];
  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  os_unfair_lock_lock(&self->_lock);
  char v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"calendar"];
  if ((calendar == 0) == (v5 != 0) || ([v5 isEqual:calendar] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D060];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSCalendar *)calendar copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"calendar"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocale:(NSLocale *)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"locale"];
  if (locale && !v6 || ([v6 isEqual:locale] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSLocale *)locale copyWithZone:0] forKey:@"locale"];
    [(NSDateFormatter *)self _clearFormatter];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSDateFormatter *)self _setDateFormat:_dateFormatFromTemplate((const __CFString *)dateFormatTemplate, 0, (CFLocaleRef)[(NSDateFormatter *)self _getLocaleAlreadyLocked:1]) alreadyLocked:1];

  os_unfair_lock_unlock(p_lock);
}

- (void)_setDateFormat:(id)a3 alreadyLocked:(BOOL)a4
{
  if (!a4) {
    os_unfair_lock_lock(&self->_lock);
  }
  id v7 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"];
  if (!a3 || v7) && ([v7 isEqualToString:a3])
  {
LABEL_11:
    if (a4) {
      return;
    }
    goto LABEL_14;
  }
  ++self->_cacheGeneration;
  CFStringRef v8 = (const __CFString *)(id)[a3 copyWithZone:0];
  [(NSMutableDictionary *)self->_attributes setValue:v8 forKey:@"dateFormat"];
  if (!v8 || (formatter = self->_formatter) == 0)
  {
    if (!v8)
    {
      [(NSDateFormatter *)self _clearFormatter];
      if (a4) {
        return;
      }
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  CFDateFormatterSetFormat(formatter, v8);
  if (a4) {
    return;
  }
LABEL_14:

  os_unfair_lock_unlock(&self->_lock);
}

+ (NSString)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle
{
  if (!date) {
    return 0;
  }
  CFStringRef v8 = objc_opt_new();
  [v8 setFormatterBehavior:1040];
  [v8 setDateStyle:dstyle];
  [v8 setTimeStyle:tstyle];
  id v9 = (NSString *)[v8 stringForObjectValue:date];

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(NSDateFormatter *)self _clearFormatter];
  v3.receiver = self;
  v3.super_class = (Class)NSDateFormatter;
  [(NSDateFormatter *)&v3 dealloc];
}

- (id)_attributedStringWithFieldsFromDate:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  if (!a3 || !_NSIsNSDate()) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v7 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v7 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  if (self->_formatter)
  {
    [a3 timeIntervalSinceReferenceDate];
    AttributedStringAndFieldsWithAbsoluteTime = (void *)_CFDateFormatterCreateAttributedStringAndFieldsWithAbsoluteTime();
  }
  else
  {
    AttributedStringAndFieldsWithAbsoluteTime = 0;
  }
  id v9 = AttributedStringAndFieldsWithAbsoluteTime;
  if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext"), "intValue") == -1)
  {
    int64_t v10 = objc_alloc_init(_NSStringProxyForContext);
    [(_NSStringProxyForContext *)v10 setString:[(NSAttributedString *)v9 string]];
    [(_NSStringProxyForContext *)v10 setItem:a3];
    uint64_t v11 = (id *)[objc_allocWithZone((Class)objc_opt_class()) init];
    [v11[1] setDictionary:self->_attributes];
    [(_NSStringProxyForContext *)v10 _retainFormatter:v11];

    char v12 = [[NSMutableAttributedString alloc] initWithString:v10];
    uint64_t v13 = [(NSAttributedString *)v9 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke;
    v15[3] = &unk_1E51F73C0;
    v15[4] = v12;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v9, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v15);
    id v9 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || !_NSIsNSDate()) {
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  formatter = self->_formatter;
  if (formatter
    && (StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], formatter, (CFDateRef)a3)) != 0)
  {
    id v9 = StringWithDate;
  }
  else
  {
    id v9 = 0;
  }
  if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext"), "intValue") == -1)
  {
    int64_t v10 = objc_alloc_init(_NSStringProxyForContext);
    [(_NSStringProxyForContext *)v10 setString:v9];
    [(_NSStringProxyForContext *)v10 setItem:a3];
    uint64_t v11 = (id *)[objc_allocWithZone((Class)objc_opt_class()) init];
    [v11[1] setDictionary:self->_attributes];
    [(_NSStringProxyForContext *)v10 _retainFormatter:v11];

    id v9 = v10;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v9;
}

- (void)_regenerateFormatterIfAbsent
{
  if (!self->_formatter) {
    [(NSDateFormatter *)self _regenerateFormatter];
  }
}

- (void)_regenerateFormatter
{
  [(NSDateFormatter *)self _clearFormatter];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  self->_counter = v4 + _CFCalendarGetMidnightNoteCount();
  CFLocaleRef v5 = (const __CFLocale *)[(NSMutableDictionary *)self->_attributes objectForKey:@"locale"];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateStyle"];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeStyle"];
  CFStringRef v8 = (const __CFAllocator **)MEMORY[0x1E4F1CFB0];
  if (!v5) {
    CFLocaleRef v5 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
  }
  CFAllocatorRef v9 = *v8;
  if (v6) {
    uint64_t v6 = (void *)[v6 integerValue];
  }
  if (v7) {
    CFDateFormatterStyle v10 = [v7 integerValue];
  }
  else {
    CFDateFormatterStyle v10 = kCFDateFormatterNoStyle;
  }
  uint64_t v11 = CFDateFormatterCreate(v9, v5, (CFDateFormatterStyle)v6, v10);
  self->_formatter = v11;
  if (v11)
  {
    CFStringRef v12 = (const __CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"];
    if (v12) {
      CFDateFormatterSetFormat(self->_formatter, v12);
    }
    uint64_t v13 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeZone"];
    if (v13) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0F8], v13);
    }
    BOOL v14 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"calendar"];
    if (v14) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D060], v14);
    }
    uint64_t v15 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"lenient"];
    if (v15) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D088], v15);
    }
    int64_t v16 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"twoDigitStartDate"];
    if (v16) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D100], v16);
    }
    UniChar v17 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"defaultDate"];
    if (v17) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D068], v17);
    }
    int v18 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"eraSymbols"];
    if (v18) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D078], v18);
    }
    int v19 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"monthSymbols"];
    if (v19) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D098], v19);
    }
    uint64_t v20 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortMonthSymbols"];
    if (v20) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0B0], v20);
    }
    int64_t v21 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"weekdaySymbols"];
    if (v21) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D130], v21);
    }
    v22 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortWeekdaySymbols"];
    if (v22) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0D8], v22);
    }
    uint64_t v23 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"AMSymbol"];
    if (v23) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D058], v23);
    }
    uint64_t v24 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"PMSymbol"];
    if (v24) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0A0], v24);
    }
    int64_t v25 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"longEraSymbols"];
    if (v25) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D090], v25);
    }
    int64_t v26 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortMonthSymbols"];
    if (v26) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D110], v26);
    }
    v27 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneMonthSymbols"];
    if (v27) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0E0], v27);
    }
    v28 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneMonthSymbols"];
    if (v28) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0C0], v28);
    }
    v29 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneMonthSymbols"];
    if (v29) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D118], v29);
    }
    v30 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortWeekdaySymbols"];
    if (v30) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D128], v30);
    }
    v31 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneWeekdaySymbols"];
    if (v31) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0F0], v31);
    }
    long long v32 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneWeekdaySymbols"];
    if (v32) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0D0], v32);
    }
    long long v33 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneWeekdaySymbols"];
    if (v33) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D120], v33);
    }
    long long v34 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"quarterSymbols"];
    if (v34) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0A8], v34);
    }
    long long v35 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortQuarterSymbols"];
    if (v35) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0B8], v35);
    }
    long long v36 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneQuarterSymbols"];
    if (v36) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0E8], v36);
    }
    long long v37 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneQuarterSymbols"];
    if (v37) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D0C8], v37);
    }
    long long v38 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"gregorianStartDate"];
    if (v38) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D080], v38);
    }
    v39 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"doesRelativeDateFormatting"];
    if (v39) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D070], v39);
    }
    v40 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesCharacterDirection"];
    if (v40) {
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E4F1D108], v40);
    }
    v41 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formattingContext"];
    if (v41)
    {
      uint64_t v42 = v41;
      if ([v41 intValue] != -1)
      {
        formatter = self->_formatter;
        CFDateFormatterSetProperty(formatter, @"kCFDateFormatterFormattingContextKey", v42);
      }
    }
  }
}

- (void)_clearFormatter
{
  formatter = self->_formatter;
  if (formatter) {
    CFRelease(formatter);
  }
  self->_formatter = 0;
  ++self->_cacheGeneration;
}

- (void)setDateStyle:(NSDateFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateStyle"];
  uint64_t v7 = +[NSNumber numberWithInteger:dateStyle];
  if (!v6
    || ![v6 isEqualToNumber:v7]
    || [(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"])
  {
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"dateStyle"];
    [(NSMutableDictionary *)self->_attributes setValue:0 forKey:@"dateFormat"];
    [(NSDateFormatter *)self _clearFormatter];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setTimeStyle:(NSDateFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeStyle"];
  uint64_t v7 = +[NSNumber numberWithInteger:timeStyle];
  if (!v6
    || ![v6 isEqualToNumber:v7]
    || [(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"])
  {
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"timeStyle"];
    [(NSMutableDictionary *)self->_attributes setValue:0 forKey:@"dateFormat"];
    [(NSDateFormatter *)self _clearFormatter];
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatter)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSDateFormatter;
  v2 = [(NSDateFormatter *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
    v3->_attributes = v4;
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() defaultFormatterBehavior]), @"formatterBehavior");
  }
  return v3;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  os_unfair_lock_lock(&self->_lock);
  CFLocaleRef v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeZone"];
  if ((timeZone == 0) == (v5 != 0) || ([v5 isEqual:timeZone] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0F8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSTimeZone *)timeZone copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"timeZone"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

+ (NSDateFormatterBehavior)defaultFormatterBehavior
{
  return __NSDateFormatterDefaultBehavior;
}

- (id)_getLocaleAlreadyLocked:(BOOL)a3
{
  if (!a3) {
    os_unfair_lock_lock(&self->_lock);
  }
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  CFLocaleRef Locale = (CFLocaleRef)[(NSMutableDictionary *)self->_attributes objectForKey:@"locale"];
  if (!Locale)
  {
    formatter = self->_formatter;
    if (formatter) {
      CFLocaleRef Locale = CFDateFormatterGetLocale(formatter);
    }
    else {
      CFLocaleRef Locale = 0;
    }
  }
  CFLocaleRef v9 = Locale;
  if (!a3) {
    os_unfair_lock_unlock(&self->_lock);
  }

  return Locale;
}

- (NSString)dateFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  Format = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"];
  if (!Format)
  {
    formatter = self->_formatter;
    if (formatter) {
      Format = (__CFString *)CFDateFormatterGetFormat(formatter);
    }
    else {
      Format = 0;
    }
  }
  CFStringRef v8 = Format;
  os_unfair_lock_unlock(p_lock);

  return (NSString *)Format;
}

- (void)setDateFormat:(NSString *)dateFormat
{
}

- (NSString)PMSymbol
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"PMSymbol"];
  if (formatter) {
    goto LABEL_2;
  }
  uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D0A0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSString *)v4;
}

- (NSString)AMSymbol
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"AMSymbol"];
  if (formatter) {
    goto LABEL_2;
  }
  uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D058];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v6[1] setDictionary:self->_attributes];
  os_unfair_lock_unlock(p_lock);
  [v6 _clearFormatter];
  return v6;
}

+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)defaultFormatterBehavior
{
  NSDateFormatterBehavior v3 = NSDateFormatterBehavior10_4;
  if (defaultFormatterBehavior) {
    NSDateFormatterBehavior v3 = defaultFormatterBehavior;
  }
  __NSDateFormatterDefaultBehavior = v3;
}

+ (void)initialize
{
  if (!__NSDateFormatterDefaultBehavior) {
    [a1 setDefaultFormatterBehavior:0];
  }
}

- (NSTimeZone)timeZone
{
  [MEMORY[0x1E4F1CAF0] localTimeZone];
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeZone"];
  if (formatter) {
    goto LABEL_2;
  }
  uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D0F8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSTimeZone *)v4;
}

- (void)setDoesRelativeDateFormatting:(BOOL)doesRelativeDateFormatting
{
  uint64_t v4 = (void **)MEMORY[0x1E4F1CFD0];
  if (!doesRelativeDateFormatting) {
    uint64_t v4 = (void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"doesRelativeDateFormatting"];
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D070];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v8 forKey:@"doesRelativeDateFormatting"];
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          [(NSDateFormatter *)self _clearFormatter];
        }
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSFormattingContext)formattingContext
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formattingContext"];
  if (!formatter)
  {
    uint64_t NoteCount = _CFLocaleGetNoteCount();
    uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
      [(NSDateFormatter *)self _clearFormatter];
    }
    formatter = self->_formatter;
    if (formatter
      || ([(NSDateFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
    {
      formatter = (id)CFDateFormatterCopyProperty(formatter, @"kCFDateFormatterFormattingContextKey");
    }
  }
  uint64_t v6 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  CFStringRef v7 = v6;
  int v8 = [(__CFDateFormatter *)v7 intValue];
  if (!v7 && self->_formatter) {
    int v8 = objc_msgSend((id)(id)CFDateFormatterCopyProperty(self->_formatter, @"kCFDateFormatterFormattingContextKey"), "intValue");
  }
  switch(v8)
  {
    case 256:
      goto LABEL_14;
    case 257:
      NSFormattingContext result = NSFormattingContextMiddleOfSentence;
      break;
    case 258:
      NSFormattingContext result = NSFormattingContextBeginningOfSentence;
      break;
    case 259:
      NSFormattingContext result = NSFormattingContextListItem;
      break;
    case 260:
      NSFormattingContext result = NSFormattingContextStandalone;
      break;
    default:
      if (v8 == -1) {
        NSFormattingContext result = NSFormattingContextDynamic;
      }
      else {
LABEL_14:
      }
        NSFormattingContext result = NSFormattingContextUnknown;
      break;
  }
  return result;
}

- (NSCalendar)calendar
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"calendar"];
  if (formatter) {
    goto LABEL_2;
  }
  uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D060];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSCalendar *)v4;
}

+ (id)_formatStringFromComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[NSString string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x1E4F1C390];
    uint64_t v9 = *MEMORY[0x1E4F1C380];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        CFStringRef v12 = (NSString *)[v11 valueForKey:v8];
        if (objc_msgSend((id)objc_msgSend(v11, "valueForKey:", v9), "BOOLValue")) {
          goto LABEL_10;
        }
        if (qword_1EB1ECB70 != -1) {
          dispatch_once(&qword_1EB1ECB70, &__block_literal_global_351);
        }
        if ([(NSString *)v12 rangeOfCharacterFromSet:qword_1EB1ECB68] != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_10:
          CFStringRef v12 = [(NSString *)v12 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
          if (qword_1EB1ECB60 != -1) {
            dispatch_once(&qword_1EB1ECB60, &__block_literal_global_7);
          }
          if ([(NSString *)v12 rangeOfCharacterFromSet:_MergedGlobals_5] != 0x7FFFFFFFFFFFFFFFLL) {
            CFStringRef v12 = +[NSString stringWithFormat:@"'%@'", v12];
          }
        }
        [(NSString *)v4 appendString:v12];
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)_invalidateCache
{
}

- (void)_reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  uint64_t v4 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  self->_attributes = v4;
  -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() defaultFormatterBehavior]), @"formatterBehavior");
  [(NSDateFormatter *)self _clearFormatter];

  os_unfair_lock_unlock(p_lock);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSDateFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateFormatters cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  [a3 encodeObject:self->_attributes forKey:@"NS.attributes"];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateFormatter)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSDateFormatter;
  uint64_t v4 = -[NSFormatter initWithCoder:](&v11, sel_initWithCoder_);
  objc_super v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    if (([a3 allowsKeyedCoding] & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateFormatters cannot be decoded by non-keyed archivers" userInfo:0]);
    }
    uint64_t v6 = (NSMutableDictionary *)(id)[a3 decodeObjectForKey:@"NS.attributes"];
    v5->_attributes = v6;
    uint64_t v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"formatterBehavior"), "integerValue");
    if (v7 != 1040)
    {
      attributes = v5->_attributes;
      if (v7) {
        uint64_t v9 = 1040;
      }
      else {
        uint64_t v9 = [(id)objc_opt_class() defaultFormatterBehavior];
      }
      [(NSMutableDictionary *)attributes setValue:+[NSNumber numberWithInteger:v9] forKey:@"formatterBehavior"];
    }
    [(NSDateFormatter *)v5 _clearFormatter];
  }
  return v5;
}

- (id)_timeZone_forOldMethods
{
  NSDateFormatterBehavior v3 = (objc_class *)objc_opt_class();
  if (([(NSDateFormatter *)self isMemberOfClass:v3] & 1) != 0
    || (uint64_t v4 = (objc_class *)objc_opt_class(),
        IMP MethodImplementation = class_getMethodImplementation(v4, sel_timeZone),
        MethodImplementation == class_getMethodImplementation(v3, sel_timeZone)))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAF0];
    return (id)[v7 localTimeZone];
  }
  else
  {
    return [(NSDateFormatter *)self timeZone];
  }
}

- (id)_locale_forOldMethods
{
  if (_CFExecutableLinkedOnOrAfter())
  {
    v2 = (void *)MEMORY[0x1E4F1CA20];
    return (id)[v2 currentLocale];
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return (id)[v4 dictionaryRepresentation];
  }
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSDateFormatterStyle)dateStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateStyle"];
  if (v6)
  {
    CFDateFormatterStyle DateStyle = [v6 integerValue];
  }
  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      NSDateFormatterStyle v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }
    CFDateFormatterStyle DateStyle = CFDateFormatterGetDateStyle(formatter);
  }
  NSDateFormatterStyle v9 = DateStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSDateFormatterStyle)timeStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"timeStyle"];
  if (v6)
  {
    CFDateFormatterStyle TimeStyle = [v6 integerValue];
  }
  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      NSDateFormatterStyle v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }
    CFDateFormatterStyle TimeStyle = CFDateFormatterGetTimeStyle(formatter);
  }
  NSDateFormatterStyle v9 = TimeStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSLocale)locale
{
  return (NSLocale *)[(NSDateFormatter *)self _getLocaleAlreadyLocked:0];
}

- (void)setGeneratesCalendarDates:(BOOL)generatesCalendarDates
{
  BOOL v3 = generatesCalendarDates;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(NSMutableDictionary *)self->_attributes setValue:*v6 forKey:@"generatesCalendarDates"];

  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatterBehavior)formatterBehavior
{
  return 1040;
}

- (id)_dateFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  id v6 = (id)[(NSMutableDictionary *)self->_attributes objectForKey:@"dateFormat"];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)_setDateFormat:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  CFStringRef v6 = (const __CFString *)(id)[a3 copyWithZone:0];
  [(NSMutableDictionary *)self->_attributes setValue:v6 forKey:@"dateFormat"];
  formatter = self->_formatter;
  if (formatter) {
    CFDateFormatterSetFormat(formatter, v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_setIsLenient:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  CFStringRef v6 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    CFStringRef v6 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v7 = (const void *)*v6;
  [(NSMutableDictionary *)self->_attributes setValue:*v6 forKey:@"lenient"];
  formatter = self->_formatter;
  if (formatter) {
    CFDateFormatterSetProperty(formatter, (CFStringRef)*MEMORY[0x1E4F1D088], v7);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isLenient
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"lenient"];
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    CFStringRef v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E4F1D088]);
  }
  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setLenient:(BOOL)lenient
{
  uint64_t v4 = (void **)MEMORY[0x1E4F1CFD0];
  if (!lenient) {
    uint64_t v4 = (void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"lenient"];
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D088];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v8 forKey:@"lenient"];
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          [(NSDateFormatter *)self _clearFormatter];
        }
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)twoDigitStartDate
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"twoDigitStartDate"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D100];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSDate *)v4;
}

- (void)setTwoDigitStartDate:(NSDate *)twoDigitStartDate
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"twoDigitStartDate"];
  if ((twoDigitStartDate == 0) == (v5 != 0) || ([v5 isEqual:twoDigitStartDate] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D100];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSDate *)twoDigitStartDate copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"twoDigitStartDate"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)defaultDate
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"defaultDate"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D068];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSDate *)v4;
}

- (void)setDefaultDate:(NSDate *)defaultDate
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"defaultDate"];
  if ((defaultDate == 0) == (v5 != 0) || ([v5 isEqual:defaultDate] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D068];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSDate *)defaultDate copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"defaultDate"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)eraSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"eraSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D078];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setEraSymbols:(NSArray *)eraSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"eraSymbols"];
  if ((eraSymbols == 0) == (v5 != 0) || ([v5 isEqual:eraSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D078];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)eraSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"eraSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)monthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"monthSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D098];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setMonthSymbols:(NSArray *)monthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"monthSymbols"];
  if ((monthSymbols == 0) == (v5 != 0) || ([v5 isEqual:monthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D098];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)monthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"monthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortMonthSymbols
{
  if (!self->_attributes && _CFAppVersionCheckLessThan())
  {
    [(NSDateFormatter *)self init];
    _NSDateFormatterNoInit();
  }
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortMonthSymbols"];
  if (!formatter)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0B0];
    uint64_t NoteCount = _CFLocaleGetNoteCount();
    uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
      [(NSDateFormatter *)self _clearFormatter];
    }
    CFStringRef v9 = *v6;
    if (self->_formatter)
    {
      if (v9) {
        goto LABEL_12;
      }
    }
    else
    {
      [(NSDateFormatter *)self _regenerateFormatter];
      if (v9)
      {
LABEL_12:
        formatter = self->_formatter;
        if (formatter) {
          formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
        }
        goto LABEL_5;
      }
    }
    formatter = 0;
  }
LABEL_5:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortMonthSymbols:(NSArray *)shortMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortMonthSymbols"];
  if ((shortMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:shortMonthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0B0];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortMonthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortMonthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)weekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"weekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D130];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setWeekdaySymbols:(NSArray *)weekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"weekdaySymbols"];
  if ((weekdaySymbols == 0) == (v5 != 0) || ([v5 isEqual:weekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D130];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)weekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"weekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortWeekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0D8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortWeekdaySymbols:(NSArray *)shortWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortWeekdaySymbols"];
  if ((shortWeekdaySymbols == 0) == (v5 != 0) || ([v5 isEqual:shortWeekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0D8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortWeekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortWeekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAMSymbol:(NSString *)AMSymbol
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"AMSymbol"];
  if ((AMSymbol == 0) == (v5 != 0) || ([v5 isEqual:AMSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D058];
    ++self->_cacheGeneration;
    id v7 = [(NSString *)AMSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"AMSymbol"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPMSymbol:(NSString *)PMSymbol
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"PMSymbol"];
  if ((PMSymbol == 0) == (v5 != 0) || ([v5 isEqual:PMSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0A0];
    ++self->_cacheGeneration;
    id v7 = [(NSString *)PMSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"PMSymbol"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)longEraSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"longEraSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D090];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setLongEraSymbols:(NSArray *)longEraSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"longEraSymbols"];
  if ((longEraSymbols == 0) == (v5 != 0) || ([v5 isEqual:longEraSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D090];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)longEraSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"longEraSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortMonthSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D110];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setVeryShortMonthSymbols:(NSArray *)veryShortMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortMonthSymbols"];
  if ((veryShortMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:veryShortMonthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D110];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)veryShortMonthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"veryShortMonthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneMonthSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0E0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setStandaloneMonthSymbols:(NSArray *)standaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneMonthSymbols"];
  if ((standaloneMonthSymbols == 0) == (v5 != 0) || ([v5 isEqual:standaloneMonthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0E0];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)standaloneMonthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"standaloneMonthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneMonthSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0C0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortStandaloneMonthSymbols:(NSArray *)shortStandaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneMonthSymbols"];
  if ((shortStandaloneMonthSymbols == 0) == (v5 != 0)
    || ([v5 isEqual:shortStandaloneMonthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0C0];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortStandaloneMonthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortStandaloneMonthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneMonthSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D118];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneMonthSymbols:(NSArray *)veryShortStandaloneMonthSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneMonthSymbols"];
  if ((veryShortStandaloneMonthSymbols == 0) == (v5 != 0)
    || ([v5 isEqual:veryShortStandaloneMonthSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D118];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)veryShortStandaloneMonthSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"veryShortStandaloneMonthSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortWeekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D128];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setVeryShortWeekdaySymbols:(NSArray *)veryShortWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortWeekdaySymbols"];
  if ((veryShortWeekdaySymbols == 0) == (v5 != 0)
    || ([v5 isEqual:veryShortWeekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D128];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)veryShortWeekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"veryShortWeekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneWeekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0F0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setStandaloneWeekdaySymbols:(NSArray *)standaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneWeekdaySymbols"];
  if ((standaloneWeekdaySymbols == 0) == (v5 != 0)
    || ([v5 isEqual:standaloneWeekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0F0];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)standaloneWeekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"standaloneWeekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneWeekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0D0];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortStandaloneWeekdaySymbols:(NSArray *)shortStandaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneWeekdaySymbols"];
  if ((shortStandaloneWeekdaySymbols == 0) == (v5 != 0)
    || ([v5 isEqual:shortStandaloneWeekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0D0];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortStandaloneWeekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortStandaloneWeekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneWeekdaySymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D120];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneWeekdaySymbols:(NSArray *)veryShortStandaloneWeekdaySymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"veryShortStandaloneWeekdaySymbols"];
  if ((veryShortStandaloneWeekdaySymbols == 0) == (v5 != 0)
    || ([v5 isEqual:veryShortStandaloneWeekdaySymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D120];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)veryShortStandaloneWeekdaySymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"veryShortStandaloneWeekdaySymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)quarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"quarterSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0A8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setQuarterSymbols:(NSArray *)quarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"quarterSymbols"];
  if ((quarterSymbols == 0) == (v5 != 0) || ([v5 isEqual:quarterSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0A8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)quarterSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"quarterSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortQuarterSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0B8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortQuarterSymbols:(NSArray *)shortQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortQuarterSymbols"];
  if ((shortQuarterSymbols == 0) == (v5 != 0) || ([v5 isEqual:shortQuarterSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0B8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortQuarterSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortQuarterSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneQuarterSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0E8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setStandaloneQuarterSymbols:(NSArray *)standaloneQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"standaloneQuarterSymbols"];
  if ((standaloneQuarterSymbols == 0) == (v5 != 0)
    || ([v5 isEqual:standaloneQuarterSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0E8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)standaloneQuarterSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"standaloneQuarterSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneQuarterSymbols"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D0C8];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSArray *)v4;
}

- (void)setShortStandaloneQuarterSymbols:(NSArray *)shortStandaloneQuarterSymbols
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"shortStandaloneQuarterSymbols"];
  if ((shortStandaloneQuarterSymbols == 0) == (v5 != 0)
    || ([v5 isEqual:shortStandaloneQuarterSymbols] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D0C8];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSArray *)shortStandaloneQuarterSymbols copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"shortStandaloneQuarterSymbols"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)gregorianStartDate
{
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)[(NSMutableDictionary *)self->_attributes objectForKey:@"gregorianStartDate"];
  if (formatter) {
    goto LABEL_2;
  }
  CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D080];
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  CFStringRef v9 = *v6;
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:
    formatter = 0;
    goto LABEL_2;
  }
  [(NSDateFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  formatter = self->_formatter;
  if (formatter) {
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
  }
LABEL_2:
  uint64_t v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);

  return (NSDate *)v4;
}

- (void)setGregorianStartDate:(NSDate *)gregorianStartDate
{
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"gregorianStartDate"];
  if ((gregorianStartDate == 0) == (v5 != 0) || ([v5 isEqual:gregorianStartDate] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D080];
    ++self->_cacheGeneration;
    id v7 = (id)[(NSDate *)gregorianStartDate copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"gregorianStartDate"];
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSDateFormatter *)self _clearFormatter];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)doesRelativeDateFormatting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"doesRelativeDateFormatting"];
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    CFStringRef v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E4F1D070]);
  }
  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)_usesCharacterDirection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  [(NSDateFormatter *)self _regenerateFormatterIfAbsent];
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesCharacterDirection"];
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    CFStringRef v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E4F1D108]);
  }
  char v8 = [v6 BOOLValue];
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  uint64_t v4 = (void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    uint64_t v4 = (void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  CFStringRef v6 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesCharacterDirection"];
  if ((v5 == 0) == (v6 != 0) || ([v6 isEqual:v5] & 1) == 0)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D108];
    ++self->_cacheGeneration;
    id v8 = (id)[v5 copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v8 forKey:@"usesCharacterDirection"];
    if (v7)
    {
      formatter = self->_formatter;
      if (v8) {
        BOOL v10 = formatter == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          [(NSDateFormatter *)self _clearFormatter];
        }
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)_cacheGenerationCount
{
  if (![(NSDateFormatter *)self _tracksCacheGenerationCount]) {
    return -1;
  }
  uint64_t NoteCount = _CFLocaleGetNoteCount();
  uint64_t v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v4 + _CFCalendarGetMidnightNoteCount() != self->_counter) {
    [(NSDateFormatter *)self _clearFormatter];
  }
  return self->_cacheGeneration;
}

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)NSDateFormatter;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSDate() & 1) != 0)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    CFStringRef v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSDateFormatter;
    return [(NSFormatter *)&v9 _mayDecorateAttributedStringForObjectValue:a3];
  }
}

uint64_t __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

- (id)_nextChangeDateAfterDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [(NSDateFormatter *)self dateFormat];
  if (![(NSString *)v5 length]) {
    return 0;
  }
  [(NSDateFormatter *)self locale];
  uint64_t SkeletonFromTemplate = _CFDateFormatterCreateSkeletonFromTemplate();
  if (!SkeletonFromTemplate) {
    return 0;
  }
  CFStringRef v7 = (const void *)SkeletonFromTemplate;
  uint64_t UnitsFromDateFormat = _CFCalendarGetUnitsFromDateFormat();
  if (!UnitsFromDateFormat)
  {
    uint64_t v12 = _NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v16 = v5;
      __int16 v17 = 2112;
      long long v18 = v7;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "Fail to get calendar units from date format %@; skeleton: %@",
        buf,
        0x16u);
    }
    CFRelease(v7);
    return 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = qword_18226FE78[v9];
    if ((v10 & UnitsFromDateFormat) != 0) {
      break;
    }
    if (++v9 == 14)
    {
      objc_super v11 = 0;
      goto LABEL_16;
    }
  }
  BOOL v14 = [(NSDateFormatter *)self calendar];
  objc_super v11 = [(NSCalendar *)v14 nextDateAfterDate:a3 matchingUnit:v10 value:[(NSCalendar *)v14 component:v10 fromDate:a3] + 1 options:1024];
LABEL_16:
  CFRelease(v7);
  return v11;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((_NSIsNSDate() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 16, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSDate(value)" object file lineNumber description];
    }
    v6.receiver = self;
    v6.super_class = (Class)NSDateFormatter;
    [(NSDateFormatter *)&v6 receiveObservedValue:[(NSDateFormatter *)self stringFromDate:a3]];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSDateFormatter;
    [(NSDateFormatter *)&v7 receiveObservedValue:0];
  }
}

@end