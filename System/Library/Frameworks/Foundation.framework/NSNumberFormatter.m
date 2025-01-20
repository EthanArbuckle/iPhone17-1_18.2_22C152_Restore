@interface NSNumberFormatter
+ (NSNumberFormatterBehavior)defaultFormatterBehavior;
+ (NSString)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle;
+ (void)initialize;
+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior;
- (BOOL)_hasSetCurrencyCode;
- (BOOL)_hasSetCurrencySymbol;
- (BOOL)_hasSetInternationalCurrencySymbol;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_tracksCacheGenerationCount;
- (BOOL)_usesCharacterDirection;
- (BOOL)allowsFloats;
- (BOOL)alwaysShowsDecimalSeparator;
- (BOOL)checkLocaleChange;
- (BOOL)checkModify;
- (BOOL)generatesDecimalNumbers;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error;
- (BOOL)isLenient;
- (BOOL)isPartialStringValidationEnabled;
- (BOOL)usesGroupingSeparator;
- (BOOL)usesSignificantDigits;
- (NSDictionary)textAttributesForNegativeInfinity;
- (NSDictionary)textAttributesForNegativeValues;
- (NSDictionary)textAttributesForNil;
- (NSDictionary)textAttributesForNotANumber;
- (NSDictionary)textAttributesForPositiveInfinity;
- (NSDictionary)textAttributesForPositiveValues;
- (NSDictionary)textAttributesForZero;
- (NSFormattingContext)formattingContext;
- (NSLocale)locale;
- (NSNumber)maximum;
- (NSNumber)minimum;
- (NSNumber)multiplier;
- (NSNumber)numberFromString:(NSString *)string;
- (NSNumber)roundingIncrement;
- (NSNumberFormatter)init;
- (NSNumberFormatter)initWithCoder:(id)a3;
- (NSNumberFormatterBehavior)formatterBehavior;
- (NSNumberFormatterPadPosition)paddingPosition;
- (NSNumberFormatterRoundingMode)roundingMode;
- (NSNumberFormatterStyle)numberStyle;
- (NSString)currencyCode;
- (NSString)currencyDecimalSeparator;
- (NSString)currencyGroupingSeparator;
- (NSString)currencySymbol;
- (NSString)decimalSeparator;
- (NSString)exponentSymbol;
- (NSString)groupingSeparator;
- (NSString)internationalCurrencySymbol;
- (NSString)minusSign;
- (NSString)negativeFormat;
- (NSString)negativeInfinitySymbol;
- (NSString)negativePrefix;
- (NSString)negativeSuffix;
- (NSString)nilSymbol;
- (NSString)notANumberSymbol;
- (NSString)paddingCharacter;
- (NSString)perMillSymbol;
- (NSString)percentSymbol;
- (NSString)plusSign;
- (NSString)positiveFormat;
- (NSString)positiveInfinitySymbol;
- (NSString)positivePrefix;
- (NSString)positiveSuffix;
- (NSString)stringFromNumber:(NSNumber *)number;
- (NSString)zeroSymbol;
- (NSUInteger)formatWidth;
- (NSUInteger)groupingSize;
- (NSUInteger)maximumFractionDigits;
- (NSUInteger)maximumIntegerDigits;
- (NSUInteger)maximumSignificantDigits;
- (NSUInteger)minimumFractionDigits;
- (NSUInteger)minimumIntegerDigits;
- (NSUInteger)minimumSignificantDigits;
- (NSUInteger)secondaryGroupingSize;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)_cacheGenerationCount;
- (int64_t)minimumGroupingDigits;
- (void)__Keynote_NOOP;
- (void)_clearFormatter;
- (void)_invalidateCache;
- (void)_regenerateFormatter;
- (void)_reset;
- (void)_setUsesCharacterDirection:(BOOL)a3;
- (void)clearPropertyBit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getFormatter;
- (void)receiveObservedValue:(id)a3;
- (void)resetCheckLocaleChange;
- (void)resetCheckModify;
- (void)setAllowsFloats:(BOOL)allowsFloats;
- (void)setAlwaysShowsDecimalSeparator:(BOOL)alwaysShowsDecimalSeparator;
- (void)setCurrencyCode:(NSString *)currencyCode;
- (void)setCurrencyDecimalSeparator:(NSString *)currencyDecimalSeparator;
- (void)setCurrencyGroupingSeparator:(NSString *)currencyGroupingSeparator;
- (void)setCurrencySymbol:(NSString *)currencySymbol;
- (void)setDecimalSeparator:(NSString *)decimalSeparator;
- (void)setExponentSymbol:(NSString *)exponentSymbol;
- (void)setFormatWidth:(NSUInteger)formatWidth;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setGeneratesDecimalNumbers:(BOOL)generatesDecimalNumbers;
- (void)setGroupingSeparator:(NSString *)groupingSeparator;
- (void)setGroupingSize:(NSUInteger)groupingSize;
- (void)setInternationalCurrencySymbol:(NSString *)internationalCurrencySymbol;
- (void)setLenient:(BOOL)lenient;
- (void)setLocale:(NSLocale *)locale;
- (void)setMaximum:(NSNumber *)maximum;
- (void)setMaximumFractionDigits:(NSUInteger)maximumFractionDigits;
- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits;
- (void)setMaximumSignificantDigits:(NSUInteger)maximumSignificantDigits;
- (void)setMinimum:(NSNumber *)minimum;
- (void)setMinimumFractionDigits:(NSUInteger)minimumFractionDigits;
- (void)setMinimumGroupingDigits:(int64_t)a3;
- (void)setMinimumIntegerDigits:(NSUInteger)minimumIntegerDigits;
- (void)setMinimumSignificantDigits:(NSUInteger)minimumSignificantDigits;
- (void)setMinusSign:(NSString *)minusSign;
- (void)setMultiplier:(NSNumber *)multiplier;
- (void)setNegativeFormat:(NSString *)negativeFormat;
- (void)setNegativeInfinitySymbol:(NSString *)negativeInfinitySymbol;
- (void)setNegativePrefix:(NSString *)negativePrefix;
- (void)setNegativeSuffix:(NSString *)negativeSuffix;
- (void)setNilSymbol:(NSString *)nilSymbol;
- (void)setNotANumberSymbol:(NSString *)notANumberSymbol;
- (void)setNumberStyle:(NSNumberFormatterStyle)numberStyle;
- (void)setPaddingCharacter:(NSString *)paddingCharacter;
- (void)setPaddingPosition:(NSNumberFormatterPadPosition)paddingPosition;
- (void)setPartialStringValidationEnabled:(BOOL)partialStringValidationEnabled;
- (void)setPerMillSymbol:(NSString *)perMillSymbol;
- (void)setPercentSymbol:(NSString *)percentSymbol;
- (void)setPlusSign:(NSString *)plusSign;
- (void)setPositiveFormat:(NSString *)positiveFormat;
- (void)setPositiveInfinitySymbol:(NSString *)positiveInfinitySymbol;
- (void)setPositivePrefix:(NSString *)positivePrefix;
- (void)setPositiveSuffix:(NSString *)positiveSuffix;
- (void)setPropertyBit;
- (void)setRoundingIncrement:(NSNumber *)roundingIncrement;
- (void)setRoundingMode:(NSNumberFormatterRoundingMode)roundingMode;
- (void)setSecondaryGroupingSize:(NSUInteger)secondaryGroupingSize;
- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)textAttributesForNegativeInfinity;
- (void)setTextAttributesForNegativeValues:(NSDictionary *)textAttributesForNegativeValues;
- (void)setTextAttributesForNil:(NSDictionary *)textAttributesForNil;
- (void)setTextAttributesForNotANumber:(NSDictionary *)textAttributesForNotANumber;
- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)textAttributesForPositiveInfinity;
- (void)setTextAttributesForPositiveValues:(NSDictionary *)textAttributesForPositiveValues;
- (void)setTextAttributesForZero:(NSDictionary *)textAttributesForZero;
- (void)setUsesGroupingSeparator:(BOOL)usesGroupingSeparator;
- (void)setUsesSignificantDigits:(BOOL)usesSignificantDigits;
- (void)setZeroSymbol:(NSString *)zeroSymbol;
@end

@implementation NSNumberFormatter

- (void)setMaximumFractionDigits:(NSUInteger)maximumFractionDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumFractionDigits"];
  if (!v5 || [v5 integerValue] != maximumFractionDigits)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2C8];
    v7 = +[NSNumber numberWithInteger:maximumFractionDigits];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"maximumFractionDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2E0];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumFractionDigits"];
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (!self->_formatter) {
    [(NSNumberFormatter *)self _regenerateFormatter];
  }
  if (v9)
  {
    v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if ([v10 integerValue] > maximumFractionDigits)
      {
        v11 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumFractionDigits"];
        if (!v11 || [v11 integerValue] != maximumFractionDigits)
        {
          v12 = +[NSNumber numberWithInteger:maximumFractionDigits];
          [(NSMutableDictionary *)self->_attributes setValue:v12 forKey:@"minimumFractionDigits"];
          ++self->_cacheGeneration;
          if (v9)
          {
            v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setRoundingMode:(NSNumberFormatterRoundingMode)roundingMode
{
  [(NSRecursiveLock *)self->_lock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingMode"];
  if (!v5 || [v5 integerValue] != roundingMode)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D368];
    v7 = +[NSNumber numberWithInteger:roundingMode];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"roundingMode"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setUsesGroupingSeparator:(BOOL)usesGroupingSeparator
{
  v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!usesGroupingSeparator) {
    v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  v5 = *v4;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"usesGroupingSeparator"];
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D378], v5);
  }
  self->_stateBitMask |= 1uLL;
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSNumber)numberFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (!string) {
    return 0;
  }
  v4[0] = 0;
  if ([(NSNumberFormatter *)self getObjectValue:v4 forString:string errorDescription:0])
  {
    return (NSNumber *)v4[0];
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
  if (!getObjectValue_forString_errorDescription__baseIMP_0)
  {
    CFStringRef v9 = objc_lookUpClass("NSNumberFormatter");
    getObjectValue_forString_errorDescription__baseIMP_0 = (uint64_t)class_getMethodImplementation(v9, sel_getObjectValue_forString_range_error_);
  }
  v10 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5) {
    v12 = v16;
  }
  else {
    v12 = 0;
  }
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP_0) {
    char ObjectValue_0 = getObjectValue_0((uint64_t)self, a3, (__CFString *)a4, 0, 1, v12);
  }
  else {
    char ObjectValue_0 = [(NSNumberFormatter *)self getObjectValue:a3 forString:a4 range:0 error:v12];
  }
  BOOL v14 = ObjectValue_0;
  if (a5) {
    *a5 = (id)[v16[0] localizedDescription];
  }
  return v14;
}

- (NSString)decimalSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"decimalSeparator"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D290];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      v3 = 0;
    }
  }
LABEL_2:
  v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)groupingSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"groupingSeparator"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D2A8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      v3 = 0;
    }
  }
LABEL_2:
  v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)positiveInfinitySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positiveInfinitySymbol"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)nilSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"nilSymbol"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)negativeInfinitySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeInfinitySymbol"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (BOOL)allowsFloats
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"allowsFloats"), "BOOLValue");
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (NSNumber)minimum
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimum"];
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSNumber *)v3;
}

- (NSNumber)maximum
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximum"];
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSNumber *)v3;
}

- (BOOL)generatesDecimalNumbers
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"generatesDecimalNumbers"];
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (void)setMinimumFractionDigits:(NSUInteger)minimumFractionDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumFractionDigits"];
  if (!v5 || [v5 integerValue] != minimumFractionDigits)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2E0];
    v7 = +[NSNumber numberWithInteger:minimumFractionDigits];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"minimumFractionDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2C8];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumFractionDigits"];
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_21;
    }
LABEL_24:
    v11 = 0;
    goto LABEL_8;
  }
  [(NSNumberFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_24;
  }
LABEL_21:
  v11 = self->_formatter;
  if (v11)
  {
    v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
    v11 = (__CFNumberFormatter *)[v10 integerValue];
  }
LABEL_8:
  if ((unint64_t)v11 < minimumFractionDigits)
  {
    v12 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumFractionDigits"];
    if (!v12 || [v12 integerValue] != minimumFractionDigits)
    {
      v13 = +[NSNumber numberWithInteger:minimumFractionDigits];
      [(NSMutableDictionary *)self->_attributes setValue:v13 forKey:@"maximumFractionDigits"];
      ++self->_cacheGeneration;
      if (v9)
      {
        BOOL v14 = self->_formatter;
        if (v14) {
          CFNumberFormatterSetProperty(v14, v9, v13);
        }
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setPaddingCharacter:(NSString *)paddingCharacter
{
  [(NSRecursiveLock *)self->_lock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingCharacter"];
  if ((paddingCharacter == 0) == (v5 != 0) || ([v5 isEqual:paddingCharacter] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D328];
    id v7 = [(NSString *)paddingCharacter copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"paddingCharacter"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

+ (NSString)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle
{
  if (!num) {
    return 0;
  }
  CFStringRef v6 = objc_opt_new();
  [v6 setFormatterBehavior:1040];
  [v6 setNumberStyle:nstyle];
  id v7 = (NSString *)[v6 stringForObjectValue:num];

  return v7;
}

- (id)stringForObjectValue:(id)a3
{
  if (a3)
  {
    if ((_NSIsNSNumber() & 1) == 0) {
      return 0;
    }
    [(NSRecursiveLock *)self->_lock lock];
    [a3 doubleValue];
    double v6 = v5;
    switch(__fpclassifyd(v5))
    {
      case 1:
        id v7 = [(NSNumberFormatter *)self notANumberSymbol];
        goto LABEL_13;
      case 2:
        if ((*(void *)&v6 & 0x8000000000000000) != 0) {
          id v7 = [(NSNumberFormatter *)self negativeInfinitySymbol];
        }
        else {
          id v7 = [(NSNumberFormatter *)self positiveInfinitySymbol];
        }
        goto LABEL_13;
      case 3:
      case 5:
        id v7 = [(NSNumberFormatter *)self zeroSymbol];
LABEL_13:
        CFStringRef v9 = (const __CFString *)v7;
        if (!v7) {
          goto LABEL_14;
        }
        goto LABEL_19;
      default:
LABEL_14:
        if (_CFLocaleGetNoteCount() != self->_counter) {
          [(NSNumberFormatter *)self _clearFormatter];
        }
        formatter = self->_formatter;
        if (formatter
          || ([(NSNumberFormatter *)self _regenerateFormatter],
              (formatter = self->_formatter) != 0))
        {
          CFStringRef v9 = (id)CFNumberFormatterCreateStringWithNumber((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], formatter, (CFNumberRef)a3);
        }
        else
        {
          CFStringRef v9 = 0;
        }
LABEL_19:
        if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"formattingContext"), "intValue") == -1)
        {
          v11 = objc_alloc_init(_NSStringProxyForContext);
          [(_NSStringProxyForContext *)v11 setString:v9];
          [(_NSStringProxyForContext *)v11 setItem:a3];
          v12 = (id *)[objc_allocWithZone((Class)objc_opt_class()) init];
          [v12[1] setDictionary:self->_attributes];
          [(_NSStringProxyForContext *)v11 _retainFormatter:v12];
          [v12 _clearFormatter];

          CFStringRef v9 = v11;
        }
        [(NSRecursiveLock *)self->_lock unlock];
        break;
    }
    return (id)v9;
  }
  else
  {
    return [(NSNumberFormatter *)self nilSymbol];
  }
}

- (void)setNumberStyle:(NSNumberFormatterStyle)numberStyle
{
  [(NSRecursiveLock *)self->_lock lock];
  if ((self->_stateBitMask & 2) == 0
    && objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"numberStyle"), "integerValue") != numberStyle)
  {
    [(NSMutableDictionary *)self->_attributes setValue:+[NSNumber numberWithInteger:numberStyle] forKey:@"numberStyle"];
    [(NSNumberFormatter *)self _clearFormatter];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)_regenerateFormatter
{
  if (self->_formatter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  self->_counter = _CFLocaleGetNoteCount();
  CFLocaleRef v3 = (const __CFLocale *)[(NSMutableDictionary *)self->_attributes objectForKey:@"locale"];
  uint64_t v4 = [(NSMutableDictionary *)self->_attributes objectForKey:@"numberStyle"];
  double v5 = (void *)v4;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  if (v3)
  {
    if (v4)
    {
LABEL_5:
      CFNumberFormatterStyle v7 = [v5 integerValue];
      goto LABEL_8;
    }
  }
  else
  {
    CFLocaleRef v3 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    if (v5) {
      goto LABEL_5;
    }
  }
  CFNumberFormatterStyle v7 = kCFNumberFormatterNoStyle;
LABEL_8:
  v8 = CFNumberFormatterCreate(v6, v3, v7);
  self->_formatter = v8;
  if (!v8) {
    return;
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_attributes objectForKey:@"positiveFormat"];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeFormat"];
  v11 = v10;
  if (v9)
  {
    if (!v10 || ([v10 isEqualToString:v9] & 1) != 0)
    {
      formatter = self->_formatter;
      CFStringRef v13 = (const __CFString *)v9;
LABEL_19:
      CFNumberFormatterSetFormat(formatter, v13);
      goto LABEL_20;
    }
    v15 = [[NSString alloc] initWithFormat:@"%@;%@", v9, v11];
    CFNumberFormatterSetFormat(self->_formatter, (CFStringRef)v15);
  }
  else if (v10)
  {
    id v14 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(self->_formatter), "componentsSeparatedByString:", @";"),
                                 "mutableCopy"));
    if ((unint64_t)[v14 count] > 1) {
      [v14 replaceObjectAtIndex:1 withObject:v11];
    }
    else {
      [v14 addObject:v11];
    }
    CFStringRef v13 = (const __CFString *)[v14 componentsJoinedByString:@";"];
    formatter = self->_formatter;
    goto LABEL_19;
  }
LABEL_20:
  v16 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"alwaysShowsDecimalSeparator"];
  if (v16) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D268], v16);
  }
  v17 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"decimalSeparator"];
  if (v17) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D290], v17);
  }
  v18 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyDecimalSeparator"];
  if (v18) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D278], v18);
  }
  v19 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesGroupingSeparator"];
  if (v19) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D378], v19);
  }
  v20 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"zeroSymbol"];
  if (v20) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D390], v20);
  }
  v21 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"notANumberSymbol"];
  if (v21) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D310], v21);
  }
  v22 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"groupingSeparator"];
  if (v22) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2A8], v22);
  }
  v23 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positivePrefix"];
  if (v23) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D350], v23);
  }
  v24 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positiveSuffix"];
  if (v24) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D358], v24);
  }
  v25 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativePrefix"];
  if (v25) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D318], v25);
  }
  v26 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeSuffix"];
  if (v26) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D320], v26);
  }
  v27 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyCode"];
  if (v27) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D270], v27);
  }
  v28 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencySymbol"];
  if (v28) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D288], v28);
  }
  v29 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"internationalCurrencySymbol"];
  if (v29) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2B8], v29);
  }
  v30 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"percentSymbol"];
  if (v30) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D340], v30);
  }
  v31 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"perMillSymbol"];
  if (v31) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D338], v31);
  }
  v32 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minusSign"];
  if (v32) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D300], v32);
  }
  v33 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"plusSign"];
  if (v33) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D348], v33);
  }
  v34 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"exponentSymbol"];
  if (v34) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D298], v34);
  }
  v35 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"groupingSize"];
  if (v35) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2B0], v35);
  }
  v36 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"secondaryGroupingSize"];
  if (v36) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D370], v36);
  }
  v37 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formatWidth"];
  if (v37) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2A0], v37);
  }
  v38 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"multiplier"];
  if (v38) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D308], v38);
  }
  v39 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingCharacter"];
  if (v39) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D328], v39);
  }
  v40 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingPosition"];
  if (v40) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D330], v40);
  }
  v41 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingMode"];
  if (v41) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D368], v41);
  }
  v42 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingIncrement"];
  if (v42) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D360], v42);
  }
  v43 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumIntegerDigits"];
  if (v43) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2F0], v43);
  }
  v44 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumIntegerDigits"];
  if (v44) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2D0], v44);
  }
  v45 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumFractionDigits"];
  if (v45) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2E0], v45);
  }
  v46 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumFractionDigits"];
  if (v46) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2C8], v46);
  }
  v47 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyGroupingSeparator"];
  if (v47) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D280], v47);
  }
  v48 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"lenient"];
  if (v48) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2C0], v48);
  }
  v49 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesSignificantDigits"];
  if (v49) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D380], v49);
  }
  v50 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumSignificantDigits"];
  if (v50) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2F8], v50);
  }
  v51 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumSignificantDigits"];
  if (v51) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2D8], v51);
  }
  v52 = (const void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesCharacterDirection"];
  if (v52) {
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D388], v52);
  }
  v53 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formattingContext"];
  if (v53)
  {
    v54 = v53;
    if ([v53 intValue] != -1) {
      CFNumberFormatterSetProperty(self->_formatter, @"kCFNumberFormatterFormattingContextKey", v54);
    }
  }
  uint64_t v55 = [(NSMutableDictionary *)self->_attributes objectForKey:@"minimumGroupingDigits"];
  if (v55)
  {
    v56 = (const void *)v55;
    v57 = self->_formatter;
    CFStringRef v58 = (const __CFString *)*MEMORY[0x1E4F1D2E8];
    CFNumberFormatterSetProperty(v57, v58, v56);
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
  v4.super_class = (Class)NSNumberFormatter;
  [(NSNumberFormatter *)&v4 dealloc];
}

- (NSNumberFormatter)init
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (objc_lookUpClass("ChartNumberFormatter")
    && objc_msgSend(@"com.apple.Keynote", "isEqual:", -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier")))
  {
    CFLocaleRef v3 = (objc_class *)self;
    objc_super v4 = sel_registerName("__Keynote_NOOP");
    IMP MethodImplementation = class_getMethodImplementation(v3, v4);
    CFAllocatorRef v6 = (objc_class *)self;
    CFNumberFormatterStyle v7 = sel_registerName("_getNegative");
    InstanceMethod = class_getInstanceMethod(v6, v7);
    if (InstanceMethod) {
      method_setImplementation(InstanceMethod, MethodImplementation);
    }
    uint64_t v9 = (objc_class *)self;
    v10 = sel_registerName("_setNegativeFormat:");
    v11 = class_getInstanceMethod(v9, v10);
    if (v11) {
      method_setImplementation(v11, MethodImplementation);
    }
    v12 = (objc_class *)self;
    CFStringRef v13 = sel_registerName("_getPositive");
    id v14 = class_getInstanceMethod(v12, v13);
    if (v14) {
      method_setImplementation(v14, MethodImplementation);
    }
    v15 = (objc_class *)self;
    v16 = sel_registerName("_setPositiveFormat:");
    v17 = class_getInstanceMethod(v15, v16);
    if (v17) {
      method_setImplementation(v17, MethodImplementation);
    }
    v18 = (objc_class *)self;
    v19 = sel_registerName("setNegativeFormat:");
    v20 = class_getMethodImplementation(v18, v19);
    v21 = objc_lookUpClass("ChartNumberFormatter");
    v22 = sel_registerName("setNegativeFormat:");
    v23 = class_getInstanceMethod(v21, v22);
    if (v23) {
      method_setImplementation(v23, v20);
    }
    v24 = (objc_class *)self;
    v25 = sel_registerName("setPositiveFormat:");
    v26 = class_getMethodImplementation(v24, v25);
    v27 = objc_lookUpClass("ChartNumberFormatter");
    v28 = sel_registerName("setPositiveFormat:");
    v29 = class_getInstanceMethod(v27, v28);
    if (v29) {
      method_setImplementation(v29, v26);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)NSNumberFormatter;
  v30 = [(NSNumberFormatter *)&v33 init];
  if (v30)
  {
    v30->_lock = objc_alloc_init(NSRecursiveLock);
    v31 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
    v30->_attributes = v31;
    -[NSMutableDictionary setValue:forKey:](v31, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() defaultFormatterBehavior]), @"formatterBehavior");
    [(NSNumberFormatter *)v30 setNilSymbol:&stru_1ECA5C228];
    v34[0] = 0x221E002D221E002BLL;
    [(NSNumberFormatter *)v30 setPositiveInfinitySymbol:+[NSString stringWithCharacters:v34 length:2]];
    [(NSNumberFormatter *)v30 setNegativeInfinitySymbol:+[NSString stringWithCharacters:(char *)v34 + 4 length:2]];
    [(NSNumberFormatter *)v30 setAllowsFloats:1];
    [(NSNumberFormatter *)v30 _clearFormatter];
  }
  return v30;
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

- (void)setPositiveInfinitySymbol:(NSString *)positiveInfinitySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positiveInfinitySymbol"];
  if ((positiveInfinitySymbol == 0) == (v5 != 0) || ([v5 isEqual:positiveInfinitySymbol] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:[(NSString *)positiveInfinitySymbol copyWithZone:0] forKey:@"positiveInfinitySymbol"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setNilSymbol:(NSString *)nilSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"nilSymbol"];
  if ((nilSymbol == 0) == (v5 != 0) || ([v5 isEqual:nilSymbol] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:[(NSString *)nilSymbol copyWithZone:0] forKey:@"nilSymbol"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setNegativeInfinitySymbol:(NSString *)negativeInfinitySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeInfinitySymbol"];
  if ((negativeInfinitySymbol == 0) == (v5 != 0) || ([v5 isEqual:negativeInfinitySymbol] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:[(NSString *)negativeInfinitySymbol copyWithZone:0] forKey:@"negativeInfinitySymbol"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setAllowsFloats:(BOOL)allowsFloats
{
  BOOL v3 = allowsFloats;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(NSMutableDictionary *)self->_attributes setValue:*v5 forKey:@"allowsFloats"];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

+ (NSNumberFormatterBehavior)defaultFormatterBehavior
{
  return __NSNumberFormatterDefaultBehavior;
}

- (NSString)zeroSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"zeroSymbol"];
  if (!v3)
  {
    CFAllocatorRef v6 = (__CFString **)MEMORY[0x1E4F1D390];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  objc_super v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setRoundingIncrement:(NSNumber *)roundingIncrement
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingIncrement"];
  if ((roundingIncrement == 0) == (v5 != 0) || ([v5 isEqual:roundingIncrement] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D360];
    id v7 = [(NSNumber *)roundingIncrement copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"roundingIncrement"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSLocale)locale
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  CFLocaleRef v3 = (CFLocaleRef)[(NSMutableDictionary *)self->_attributes objectForKey:@"locale"];
  if (!v3)
  {
    formatter = self->_formatter;
    if (formatter
      || ([(NSNumberFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
    {
      CFLocaleRef Locale = CFNumberFormatterGetLocale(formatter);
    }
    else
    {
      CFLocaleRef Locale = (CFLocaleRef)[MEMORY[0x1E4F1CA20] currentLocale];
    }
    CFLocaleRef v3 = Locale;
  }
  CFLocaleRef v6 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSLocale *)v3;
}

- (NSString)stringFromNumber:(NSNumber *)number
{
  if (number) {
    return (NSString *)-[NSNumberFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else {
    return 0;
  }
}

- (void)setMinimumIntegerDigits:(NSUInteger)minimumIntegerDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumIntegerDigits"];
  if (!v5 || [v5 integerValue] != minimumIntegerDigits)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2F0];
    id v7 = +[NSNumber numberWithInteger:minimumIntegerDigits];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"minimumIntegerDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2D0];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumIntegerDigits"];
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (self->_formatter)
  {
    if (v9) {
      goto LABEL_21;
    }
LABEL_24:
    v11 = 0;
    goto LABEL_8;
  }
  [(NSNumberFormatter *)self _regenerateFormatter];
  if (!v9) {
    goto LABEL_24;
  }
LABEL_21:
  v11 = self->_formatter;
  if (v11)
  {
    v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
    v11 = (__CFNumberFormatter *)[v10 integerValue];
  }
LABEL_8:
  if ((unint64_t)v11 < minimumIntegerDigits)
  {
    v12 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumIntegerDigits"];
    if (!v12 || [v12 integerValue] != minimumIntegerDigits)
    {
      CFStringRef v13 = +[NSNumber numberWithInteger:minimumIntegerDigits];
      [(NSMutableDictionary *)self->_attributes setValue:v13 forKey:@"maximumIntegerDigits"];
      ++self->_cacheGeneration;
      if (v9)
      {
        id v14 = self->_formatter;
        if (v14) {
          CFNumberFormatterSetProperty(v14, v9, v13);
        }
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)resetCheckLocaleChange
{
  self->_stateBitMask &= ~4uLL;
}

- (NSFormattingContext)formattingContext
{
  [(NSRecursiveLock *)self->_lock lock];
  CFLocaleRef v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formattingContext"];
  int v4 = [v3 intValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      formatter = self->_formatter;
    }
    int v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, @"kCFNumberFormatterFormattingContextKey"), "intValue");
  }
  int v6 = v4;
  [(NSRecursiveLock *)self->_lock unlock];
  switch(v6)
  {
    case 256:
      goto LABEL_9;
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
      if (v6 == -1) {
        NSFormattingContext result = NSFormattingContextDynamic;
      }
      else {
LABEL_9:
      }
        NSFormattingContext result = NSFormattingContextUnknown;
      break;
  }
  return result;
}

- (void)setLocale:(NSLocale *)locale
{
  [(NSRecursiveLock *)self->_lock lock];
  if ((objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", @"locale"), "isEqual:", locale) & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSLocale *)locale copyWithZone:0] forKey:@"locale"];
    [(NSNumberFormatter *)self _clearFormatter];
    self->_stateBitMask |= 5uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)checkLocaleChange
{
  return (LOBYTE(self->_stateBitMask) >> 2) & 1;
}

- (void)setPropertyBit
{
  self->_stateBitMask |= 2uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5[1] setDictionary:self->_attributes];
  [(NSRecursiveLock *)self->_lock unlock];
  [v5 _clearFormatter];
  return v5;
}

- (void)clearPropertyBit
{
  self->_stateBitMask &= ~2uLL;
}

- (void)resetCheckModify
{
  self->_stateBitMask &= ~1uLL;
}

- (void)getFormatter
{
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    formatter = self->_formatter;
  }

  return (void *)MEMORY[0x1F40D8EE0](formatter);
}

- (BOOL)checkModify
{
  return self->_stateBitMask & 1;
}

+ (void)initialize
{
  if (!__NSNumberFormatterDefaultBehavior) {
    [a1 setDefaultFormatterBehavior:0];
  }
}

+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior
{
  NSNumberFormatterBehavior v3 = NSNumberFormatterBehavior10_4;
  if (behavior) {
    NSNumberFormatterBehavior v3 = behavior;
  }
  __NSNumberFormatterDefaultBehavior = v3;
}

- (NSUInteger)maximumFractionDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumFractionDigits"];
  if (!v3)
  {
    int v6 = (const __CFString **)MEMORY[0x1E4F1D2C8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    NSNumberFormatterBehavior v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (NSNumberFormatterStyle)numberStyle
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"numberStyle"];
  CFNumberFormatterStyle Style = [v3 integerValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      formatter = self->_formatter;
      if (!formatter)
      {
        NSNumberFormatterStyle v6 = NSNumberFormatterNoStyle;
        goto LABEL_8;
      }
    }
    CFNumberFormatterStyle Style = CFNumberFormatterGetStyle(formatter);
  }
  NSNumberFormatterStyle v6 = Style;
LABEL_8:
  [(NSRecursiveLock *)self->_lock unlock];
  return v6;
}

- (NSUInteger)minimumFractionDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumFractionDigits"];
  if (!v3)
  {
    NSNumberFormatterStyle v6 = (const __CFString **)MEMORY[0x1E4F1D2E0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    NSNumberFormatterBehavior v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (NSNumberFormatterRoundingMode)roundingMode
{
  [(NSRecursiveLock *)self->_lock lock];
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingMode"];
  if (!v3)
  {
    NSNumberFormatterStyle v6 = (const __CFString **)MEMORY[0x1E4F1D368];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    NSNumberFormatterBehavior v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSNumberFormatterRoundingMode)v4;
}

- (BOOL)usesGroupingSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"usesGroupingSeparator"];
  char v4 = [v3 BOOLValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      formatter = self->_formatter;
      if (!formatter)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }
    char v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D378]), "BOOLValue");
  }
  BOOL v6 = v4;
LABEL_8:
  [(NSRecursiveLock *)self->_lock unlock];
  return v6;
}

- (NSUInteger)maximumSignificantDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  NSNumberFormatterBehavior v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumSignificantDigits"];
  if (!v3)
  {
    BOOL v6 = (const __CFString **)MEMORY[0x1E4F1D2D8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    NSNumberFormatterBehavior v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (void)setUsesSignificantDigits:(BOOL)usesSignificantDigits
{
  CFStringRef v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!usesSignificantDigits) {
    CFStringRef v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"usesSignificantDigits"];
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D380], v5);
  }
  self->_stateBitMask |= 1uLL;
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)usesSignificantDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"usesSignificantDigits"];
  CFStringRef v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      uint64_t v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (v4) {
      goto LABEL_5;
    }
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D380]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

- (void)setMaximumSignificantDigits:(NSUInteger)maximumSignificantDigits
{
  if (maximumSignificantDigits <= 1) {
    NSUInteger v4 = 1;
  }
  else {
    NSUInteger v4 = maximumSignificantDigits;
  }
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumSignificantDigits"];
  if (!v5 || [v5 integerValue] != v4)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2D8];
    char v7 = +[NSNumber numberWithInteger:v4];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"maximumSignificantDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2F8];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumSignificantDigits"];
  if (v10) {
    goto LABEL_10;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (!self->_formatter) {
    [(NSNumberFormatter *)self _regenerateFormatter];
  }
  if (v9)
  {
    id v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_10:
      if (v4 < [v10 integerValue])
      {
        v11 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumSignificantDigits"];
        if (!v11 || [v11 integerValue] != v4)
        {
          v12 = +[NSNumber numberWithInteger:v4];
          [(NSMutableDictionary *)self->_attributes setValue:v12 forKey:@"minimumSignificantDigits"];
          ++self->_cacheGeneration;
          if (v9)
          {
            CFStringRef v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setMinimumSignificantDigits:(NSUInteger)minimumSignificantDigits
{
  if (minimumSignificantDigits <= 1) {
    NSUInteger v4 = 1;
  }
  else {
    NSUInteger v4 = minimumSignificantDigits;
  }
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumSignificantDigits"];
  if (!v5 || [v5 integerValue] != v4)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2F8];
    char v7 = +[NSNumber numberWithInteger:v4];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"minimumSignificantDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2D8];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumSignificantDigits"];
  if (v10)
  {
LABEL_10:
    if (v4 <= [v10 integerValue]) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (self->_formatter)
  {
    if (!v9) {
      goto LABEL_20;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (!v9) {
      goto LABEL_20;
    }
  }
  v11 = self->_formatter;
  if (v11)
  {
    v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
    goto LABEL_10;
  }
LABEL_20:
  v12 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumSignificantDigits"];
  if (!v12 || [v12 integerValue] != v4)
  {
    CFStringRef v13 = +[NSNumber numberWithInteger:v4];
    [(NSMutableDictionary *)self->_attributes setValue:v13 forKey:@"maximumSignificantDigits"];
    ++self->_cacheGeneration;
    if (v9)
    {
      id v14 = self->_formatter;
      if (v14) {
        CFNumberFormatterSetProperty(v14, v9, v13);
      }
    }
  }
LABEL_25:
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)currencyGroupingSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyGroupingSeparator"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D280];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  NSUInteger v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)currencyDecimalSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyDecimalSeparator"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D278];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  NSUInteger v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setNegativePrefix:(NSString *)negativePrefix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativePrefix"];
  if ((negativePrefix == 0) == (v5 != 0) || ([v5 isEqual:negativePrefix] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D318];
    id v7 = [(NSString *)negativePrefix copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"negativePrefix"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setPositivePrefix:(NSString *)positivePrefix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positivePrefix"];
  if ((positivePrefix == 0) == (v5 != 0) || ([v5 isEqual:positivePrefix] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D350];
    id v7 = [(NSString *)positivePrefix copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"positivePrefix"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setGeneratesDecimalNumbers:(BOOL)generatesDecimalNumbers
{
  BOOL v3 = generatesDecimalNumbers;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(NSMutableDictionary *)self->_attributes setValue:*v5 forKey:@"generatesDecimalNumbers"];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      uint64_t v4 = 256;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      int v5 = 0;
      uint64_t v4 = 0xFFFFFFFFLL;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      uint64_t v4 = 260;
      goto LABEL_9;
    case NSFormattingContextListItem:
      uint64_t v4 = 259;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      uint64_t v4 = 258;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      uint64_t v4 = 257;
      goto LABEL_9;
    default:
      uint64_t v4 = 0;
LABEL_9:
      int v5 = 1;
LABEL_10:
      CFStringRef v6 = +[NSNumber numberWithInt:v4];
      [(NSRecursiveLock *)self->_lock lock];
      ++self->_cacheGeneration;
      [(NSMutableDictionary *)self->_attributes setValue:v6 forKey:@"formattingContext"];
      if (v5)
      {
        formatter = self->_formatter;
        if (formatter) {
          CFNumberFormatterSetProperty(formatter, @"kCFNumberFormatterFormattingContextKey", v6);
        }
      }
      self->_stateBitMask |= 1uLL;
      lock = self->_lock;
      [(NSRecursiveLock *)lock unlock];
      return;
  }
}

- (void)setPositiveFormat:(NSString *)positiveFormat
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:[(NSString *)positiveFormat copyWithZone:0] forKey:@"positiveFormat"];
  if (!positiveFormat) {
    goto LABEL_7;
  }
  formatter = self->_formatter;
  if (formatter
    || ([(NSNumberFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
  {
    id v6 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", @";"),
                                "mutableCopy"));
    [v6 replaceObjectAtIndex:0 withObject:positiveFormat];
    CFStringRef v7 = (const __CFString *)[v6 componentsJoinedByString:@";"];
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7) {
LABEL_7:
    }
      [(NSNumberFormatter *)self _clearFormatter];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSUInteger)secondaryGroupingSize
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"secondaryGroupingSize"];
  if (!v3)
  {
    id v6 = (const __CFString **)MEMORY[0x1E4F1D370];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (NSUInteger)maximumIntegerDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumIntegerDigits"];
  if (!v3)
  {
    id v6 = (const __CFString **)MEMORY[0x1E4F1D2D0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (NSUInteger)groupingSize
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"groupingSize"];
  if (!v3)
  {
    id v6 = (const __CFString **)MEMORY[0x1E4F1D2B0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  int v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximumIntegerDigits"];
  if (!v5 || [v5 integerValue] != maximumIntegerDigits)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2D0];
    CFStringRef v7 = +[NSNumber numberWithInteger:maximumIntegerDigits];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"maximumIntegerDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D2F0];
  v10 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumIntegerDigits"];
  if (v10) {
    goto LABEL_7;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  if (!self->_formatter) {
    [(NSNumberFormatter *)self _regenerateFormatter];
  }
  if (v9)
  {
    id v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if ([v10 integerValue] > maximumIntegerDigits)
      {
        v11 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumIntegerDigits"];
        if (!v11 || [v11 integerValue] != maximumIntegerDigits)
        {
          v12 = +[NSNumber numberWithInteger:maximumIntegerDigits];
          [(NSMutableDictionary *)self->_attributes setValue:v12 forKey:@"minimumIntegerDigits"];
          ++self->_cacheGeneration;
          if (v9)
          {
            CFStringRef v13 = self->_formatter;
            if (v13) {
              CFNumberFormatterSetProperty(v13, v9, v12);
            }
          }
        }
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  [(NSRecursiveLock *)self->_lock lock];
  int v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyCode"];
  if ((currencyCode == 0) == (v5 != 0) || ([v5 isEqual:currencyCode] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D270];
    id v7 = [(NSString *)currencyCode copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"currencyCode"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setNegativeFormat:(NSString *)negativeFormat
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:[(NSString *)negativeFormat copyWithZone:0] forKey:@"negativeFormat"];
  if (!negativeFormat) {
    goto LABEL_10;
  }
  formatter = self->_formatter;
  if (formatter
    || ([(NSNumberFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
  {
    id v6 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", @";"),
                                "mutableCopy"));
    if ((unint64_t)[v6 count] > 1) {
      [v6 replaceObjectAtIndex:1 withObject:negativeFormat];
    }
    else {
      [v6 addObject:negativeFormat];
    }
    CFStringRef v7 = (const __CFString *)[v6 componentsJoinedByString:@";"];
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7) {
LABEL_10:
    }
      [(NSNumberFormatter *)self _clearFormatter];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setDecimalSeparator:(NSString *)decimalSeparator
{
  id v4 = [(NSString *)decimalSeparator copyWithZone:0];
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:v4 forKey:@"decimalSeparator"];
  if (v4)
  {
    formatter = self->_formatter;
    if (formatter
      || ([(NSNumberFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D290], v4);
    }
  }
  else
  {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  self->_stateBitMask |= 1uLL;
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)_invalidateCache
{
}

- (void)__Keynote_NOOP
{
  return 0;
}

- (void)_reset
{
  v4[1] = *MEMORY[0x1E4F143B8];

  BOOL v3 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  self->_attributes = v3;
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)objc_opt_class() defaultFormatterBehavior]), @"formatterBehavior");
  [(NSNumberFormatter *)self setNilSymbol:&stru_1ECA5C228];
  v4[0] = 0x221E002D221E002BLL;
  [(NSNumberFormatter *)self setPositiveInfinitySymbol:+[NSString stringWithCharacters:v4 length:2]];
  [(NSNumberFormatter *)self setNegativeInfinitySymbol:+[NSString stringWithCharacters:(char *)v4 + 4 length:2]];
  [(NSNumberFormatter *)self setAllowsFloats:1];
  [(NSNumberFormatter *)self _clearFormatter];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSNumberFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSNumberFormatters cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [(NSRecursiveLock *)self->_lock lock];
  [a3 encodeObject:self->_attributes forKey:@"NS.attributes"];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (NSNumberFormatter)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSNumberFormatter;
  id v4 = -[NSFormatter initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v4->_lock = objc_alloc_init(NSRecursiveLock);
    if (([a3 allowsKeyedCoding] & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSNumberFormatters cannot be decoded by non-keyed archivers" userInfo:0]);
    }
    objc_super v5 = (NSMutableDictionary *)(id)[a3 decodeObjectForKey:@"NS.attributes"];
    v4->_attributes = v5;
    uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"formatterBehavior"), "integerValue");
    if (v6 != 1040)
    {
      attributes = v4->_attributes;
      if (v6) {
        uint64_t v8 = 1040;
      }
      else {
        uint64_t v8 = [(id)objc_opt_class() defaultFormatterBehavior];
      }
      [(NSMutableDictionary *)attributes setValue:+[NSNumber numberWithInteger:v8] forKey:@"formatterBehavior"];
    }
    v4->_behavior = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v4->_attributes, "objectForKey:", @"formatterBehavior"), "integerValue");
    [(NSNumberFormatter *)v4 _clearFormatter];
  }
  return v4;
}

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)NSNumberFormatter;
}

- (int64_t)_cacheGenerationCount
{
  if (![(NSNumberFormatter *)self _tracksCacheGenerationCount]) {
    return -1;
  }
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  return self->_cacheGeneration;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)NSNumberFormatter;
    return [(NSFormatter *)&v12 _mayDecorateAttributedStringForObjectValue:a3];
  }
  else
  {
    objc_super v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    CFStringRef v7 = (objc_class *)objc_opt_class();
    if (MethodImplementation == class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_))
    {
      if (a3)
      {
        [a3 doubleValue];
        double v10 = v9;
        switch(__fpclassifyd(v9))
        {
          case 1:
            uint64_t v11 = [(NSNumberFormatter *)self textAttributesForNotANumber];
            break;
          case 2:
            if ((*(void *)&v10 & 0x8000000000000000) != 0) {
              uint64_t v11 = [(NSNumberFormatter *)self textAttributesForNegativeInfinity];
            }
            else {
              uint64_t v11 = [(NSNumberFormatter *)self textAttributesForPositiveInfinity];
            }
            break;
          case 3:
          case 5:
            uint64_t v11 = [(NSNumberFormatter *)self textAttributesForZero];
            break;
          default:
            if ((*(void *)&v10 & 0x8000000000000000) != 0) {
              uint64_t v11 = [(NSNumberFormatter *)self textAttributesForNegativeValues];
            }
            else {
              uint64_t v11 = [(NSNumberFormatter *)self textAttributesForPositiveValues];
            }
            break;
        }
      }
      else
      {
        uint64_t v11 = [(NSNumberFormatter *)self textAttributesForNil];
      }
      return v11 != 0;
    }
    else
    {
      return 1;
    }
  }
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return 0;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue_0((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSNumberFormatterBehavior)formatterBehavior
{
  return 1040;
}

- (NSString)negativeFormat
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"negativeFormat"];
  id v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (v4) {
      goto LABEL_10;
    }
  }
  formatter = self->_formatter;
  if (formatter)
  {
    uint64_t v6 = (void *)[(__CFString *)(id)CFNumberFormatterGetFormat(formatter) componentsSeparatedByString:@";"];
    id v4 = objc_msgSend(v6, "objectAtIndex:", (unint64_t)objc_msgSend(v6, "count") > 1);
  }
  else
  {
    id v4 = 0;
  }
LABEL_10:
  id v7 = v4;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v4;
}

- (NSDictionary)textAttributesForNegativeValues
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNegativeValues"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeValues:(NSDictionary *)textAttributesForNegativeValues
{
  [(NSRecursiveLock *)self->_lock lock];
  objc_super v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNegativeValues"];
  if ((textAttributesForNegativeValues == 0) == (v5 != 0)
    || ([v5 isEqual:textAttributesForNegativeValues] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForNegativeValues copyWithZone:0] forKey:@"textAttributesForNegativeValues"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)positiveFormat
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"positiveFormat"];
  id v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (v4) {
      goto LABEL_10;
    }
  }
  formatter = self->_formatter;
  if (formatter) {
    id v4 = objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", @";"),
  }
                   "objectAtIndex:",
                   0);
  else {
    id v4 = 0;
  }
LABEL_10:
  id v6 = v4;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v4;
}

- (NSDictionary)textAttributesForPositiveValues
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForPositiveValues"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveValues:(NSDictionary *)textAttributesForPositiveValues
{
  [(NSRecursiveLock *)self->_lock lock];
  objc_super v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForPositiveValues"];
  if ((textAttributesForPositiveValues == 0) == (v5 != 0)
    || ([v5 isEqual:textAttributesForPositiveValues] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForPositiveValues copyWithZone:0] forKey:@"textAttributesForPositiveValues"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)alwaysShowsDecimalSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"alwaysShowsDecimalSeparator"];
  char v4 = [v3 BOOLValue];
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      formatter = self->_formatter;
      if (!formatter)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }
    char v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D268]), "BOOLValue");
  }
  BOOL v6 = v4;
LABEL_8:
  [(NSRecursiveLock *)self->_lock unlock];
  return v6;
}

- (void)setAlwaysShowsDecimalSeparator:(BOOL)alwaysShowsDecimalSeparator
{
  char v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!alwaysShowsDecimalSeparator) {
    char v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  objc_super v5 = *v4;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"alwaysShowsDecimalSeparator"];
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D268], v5);
  }
  self->_stateBitMask |= 1uLL;
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setCurrencyDecimalSeparator:(NSString *)currencyDecimalSeparator
{
  if ((self->_stateBitMask & 2) == 0)
  {
    [(NSRecursiveLock *)self->_lock lock];
    objc_super v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyDecimalSeparator"];
    if ((currencyDecimalSeparator == 0) == (v5 != 0)
      || ([v5 isEqual:currencyDecimalSeparator] & 1) == 0)
    {
      CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D278];
      id v7 = [(NSString *)currencyDecimalSeparator copyWithZone:0];
      [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"currencyDecimalSeparator"];
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }
        else if (!v7)
        {
          [(NSNumberFormatter *)self _clearFormatter];
        }
      }
      self->_stateBitMask |= 1uLL;
    }
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (void)setGroupingSeparator:(NSString *)groupingSeparator
{
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  id v5 = [(NSString *)groupingSeparator copyWithZone:0];
  [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"groupingSeparator"];
  if (v5)
  {
    formatter = self->_formatter;
    if (formatter
      || ([(NSNumberFormatter *)self _regenerateFormatter], (formatter = self->_formatter) != 0))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2A8], v5);
    }
  }
  else
  {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  self->_stateBitMask |= 1uLL;
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setZeroSymbol:(NSString *)zeroSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"zeroSymbol"];
  if ((zeroSymbol == 0) == (v5 != 0) || ([v5 isEqual:zeroSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D390];
    id v7 = [(NSString *)zeroSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"zeroSymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDictionary)textAttributesForZero
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForZero"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForZero:(NSDictionary *)textAttributesForZero
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForZero"];
  if ((textAttributesForZero == 0) == (v5 != 0) || ([v5 isEqual:textAttributesForZero] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForZero copyWithZone:0] forKey:@"textAttributesForZero"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDictionary)textAttributesForNil
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNil"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNil:(NSDictionary *)textAttributesForNil
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNil"];
  if ((textAttributesForNil == 0) == (v5 != 0) || ([v5 isEqual:textAttributesForNil] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForNil copyWithZone:0] forKey:@"textAttributesForNil"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)notANumberSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"notANumberSymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D310];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setNotANumberSymbol:(NSString *)notANumberSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"notANumberSymbol"];
  if ((notANumberSymbol == 0) == (v5 != 0) || ([v5 isEqual:notANumberSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D310];
    id v7 = [(NSString *)notANumberSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"notANumberSymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDictionary)textAttributesForNotANumber
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNotANumber"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNotANumber:(NSDictionary *)textAttributesForNotANumber
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNotANumber"];
  if ((textAttributesForNotANumber == 0) == (v5 != 0)
    || ([v5 isEqual:textAttributesForNotANumber] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForNotANumber copyWithZone:0] forKey:@"textAttributesForNotANumber"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDictionary)textAttributesForPositiveInfinity
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForPositiveInfinity"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)textAttributesForPositiveInfinity
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForPositiveInfinity"];
  if ((textAttributesForPositiveInfinity == 0) == (v5 != 0)
    || ([v5 isEqual:textAttributesForPositiveInfinity] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForPositiveInfinity copyWithZone:0] forKey:@"textAttributesForPositiveInfinity"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDictionary)textAttributesForNegativeInfinity
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNegativeInfinity"];
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    if (!self->_formatter) {
      [(NSNumberFormatter *)self _regenerateFormatter];
    }
  }
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)textAttributesForNegativeInfinity
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"textAttributesForNegativeInfinity"];
  if ((textAttributesForNegativeInfinity == 0) == (v5 != 0)
    || ([v5 isEqual:textAttributesForNegativeInfinity] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:(id)[(NSDictionary *)textAttributesForNegativeInfinity copyWithZone:0] forKey:@"textAttributesForNegativeInfinity"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)positivePrefix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positivePrefix"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D350];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)positiveSuffix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positiveSuffix"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D358];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setPositiveSuffix:(NSString *)positiveSuffix
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"positiveSuffix"];
  if ((positiveSuffix == 0) == (v5 != 0) || ([v5 isEqual:positiveSuffix] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D358];
    id v7 = [(NSString *)positiveSuffix copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"positiveSuffix"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)negativePrefix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativePrefix"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D318];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)negativeSuffix
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeSuffix"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D320];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setNegativeSuffix:(NSString *)negativeSuffix
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"negativeSuffix"];
  if ((negativeSuffix == 0) == (v5 != 0) || ([v5 isEqual:negativeSuffix] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D320];
    id v7 = [(NSString *)negativeSuffix copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"negativeSuffix"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)currencyCode
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyCode"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D270];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    uint64_t v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      uint64_t v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (BOOL)_hasSetCurrencyCode
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"currencyCode"] != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (NSString)currencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencySymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D288];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (BOOL)_hasSetCurrencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"currencySymbol"] != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)setCurrencySymbol:(NSString *)currencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencySymbol"];
  if ((currencySymbol == 0) == (v5 != 0) || ([v5 isEqual:currencySymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D288];
    id v7 = [(NSString *)currencySymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"currencySymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)internationalCurrencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"internationalCurrencySymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D2B8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setInternationalCurrencySymbol:(NSString *)internationalCurrencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"internationalCurrencySymbol"];
  if ((internationalCurrencySymbol == 0) == (v5 != 0)
    || ([v5 isEqual:internationalCurrencySymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2B8];
    id v7 = [(NSString *)internationalCurrencySymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"internationalCurrencySymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)_hasSetInternationalCurrencySymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"internationalCurrencySymbol"] != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (NSString)percentSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"percentSymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D340];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setPercentSymbol:(NSString *)percentSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"percentSymbol"];
  if ((percentSymbol == 0) == (v5 != 0) || ([v5 isEqual:percentSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D340];
    id v7 = [(NSString *)percentSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"percentSymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)perMillSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"perMillSymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D338];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setPerMillSymbol:(NSString *)perMillSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"perMillSymbol"];
  if ((perMillSymbol == 0) == (v5 != 0) || ([v5 isEqual:perMillSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D338];
    id v7 = [(NSString *)perMillSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"perMillSymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)minusSign
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minusSign"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D300];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setMinusSign:(NSString *)minusSign
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minusSign"];
  if ((minusSign == 0) == (v5 != 0) || ([v5 isEqual:minusSign] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D300];
    id v7 = [(NSString *)minusSign copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"minusSign"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)plusSign
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"plusSign"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D348];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setPlusSign:(NSString *)plusSign
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"plusSign"];
  if ((plusSign == 0) == (v5 != 0) || ([v5 isEqual:plusSign] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D348];
    id v7 = [(NSString *)plusSign copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"plusSign"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)exponentSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"exponentSymbol"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D298];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  id v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setExponentSymbol:(NSString *)exponentSymbol
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"exponentSymbol"];
  if ((exponentSymbol == 0) == (v5 != 0) || ([v5 isEqual:exponentSymbol] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D298];
    id v7 = [(NSString *)exponentSymbol copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"exponentSymbol"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setGroupingSize:(NSUInteger)groupingSize
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"groupingSize"];
  if (!v5 || [v5 integerValue] != groupingSize)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2B0];
    id v7 = +[NSNumber numberWithInteger:groupingSize];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"groupingSize"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setSecondaryGroupingSize:(NSUInteger)secondaryGroupingSize
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"secondaryGroupingSize"];
  if (!v5 || [v5 integerValue] != secondaryGroupingSize)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D370];
    id v7 = +[NSNumber numberWithInteger:secondaryGroupingSize];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"secondaryGroupingSize"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSUInteger)formatWidth
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formatWidth"];
  if (!v3)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D2A0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (void)setFormatWidth:(NSUInteger)formatWidth
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"formatWidth"];
  if (!v5 || [v5 integerValue] != formatWidth)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2A0];
    id v7 = +[NSNumber numberWithInteger:formatWidth];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"formatWidth"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSNumber)multiplier
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"multiplier"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D308];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  CFStringRef v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSNumber *)v3;
}

- (void)setMultiplier:(NSNumber *)multiplier
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"multiplier"];
  if ((multiplier == 0) == (v5 != 0) || ([v5 isEqual:multiplier] & 1) == 0)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D308];
    id v7 = [(NSNumber *)multiplier copyWithZone:0];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"multiplier"];
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        [(NSNumberFormatter *)self _clearFormatter];
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)paddingCharacter
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingCharacter"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D328];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  CFStringRef v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSNumberFormatterPadPosition)paddingPosition
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingPosition"];
  if (!v3)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D330];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSNumberFormatterPadPosition)v4;
}

- (void)setPaddingPosition:(NSNumberFormatterPadPosition)paddingPosition
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"paddingPosition"];
  if (!v5 || [v5 integerValue] != paddingPosition)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D330];
    id v7 = +[NSNumber numberWithInteger:paddingPosition];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"paddingPosition"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSNumber)roundingIncrement
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (__CFString *)[(NSMutableDictionary *)self->_attributes objectForKey:@"roundingIncrement"];
  if (!v3)
  {
    CFStringRef v6 = (__CFString **)MEMORY[0x1E4F1D360];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    BOOL v3 = *v6;
    if (self->_formatter)
    {
      if (!v3) {
        goto LABEL_2;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v3) {
        goto LABEL_2;
      }
    }
    formatter = self->_formatter;
    if (formatter) {
      BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    }
    else {
      BOOL v3 = 0;
    }
  }
LABEL_2:
  CFStringRef v4 = v3;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSNumber *)v3;
}

- (NSUInteger)minimumIntegerDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumIntegerDigits"];
  if (!v3)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D2F0];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    BOOL v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (void)setMinimum:(NSNumber *)minimum
{
  BOOL v3 = minimum;
  if (minimum
    && [+[NSDecimalNumber notANumber] isEqual:minimum])
  {
    BOOL v3 = 0;
  }
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimum"];
  if ((v3 == 0) == (v5 != 0) || ([v5 isEqual:v3] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:[(NSNumber *)v3 copyWithZone:0] forKey:@"minimum"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setMaximum:(NSNumber *)maximum
{
  BOOL v3 = maximum;
  if (maximum
    && [+[NSDecimalNumber notANumber] isEqual:maximum])
  {
    BOOL v3 = 0;
  }
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"maximum"];
  if ((v3 == 0) == (v5 != 0) || ([v5 isEqual:v3] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_attributes setValue:[(NSNumber *)v3 copyWithZone:0] forKey:@"maximum"];
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setCurrencyGroupingSeparator:(NSString *)currencyGroupingSeparator
{
  if ((self->_stateBitMask & 2) == 0)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"currencyGroupingSeparator"];
    if ((currencyGroupingSeparator == 0) == (v5 != 0)
      || ([v5 isEqual:currencyGroupingSeparator] & 1) == 0)
    {
      CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D280];
      id v7 = [(NSString *)currencyGroupingSeparator copyWithZone:0];
      [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"currencyGroupingSeparator"];
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }
        else if (!v7)
        {
          [(NSNumberFormatter *)self _clearFormatter];
        }
      }
      self->_stateBitMask |= 1uLL;
    }
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (BOOL)isLenient
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"lenient"];
  CFStringRef v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      id v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (v4) {
      goto LABEL_5;
    }
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }
  id v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2C0]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

- (void)setLenient:(BOOL)lenient
{
  if (lenient) {
    CFStringRef v4 = (const void **)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFStringRef v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  [(NSRecursiveLock *)self->_lock lock];
  if ((self->_stateBitMask & 2) == 0)
  {
    id v5 = *v4;
    ++self->_cacheGeneration;
    [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"lenient"];
    formatter = self->_formatter;
    if (formatter) {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D2C0], v5);
    }
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (NSUInteger)minimumSignificantDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumSignificantDigits"];
  if (!v3)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D2F8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (NSUInteger)v4;
}

- (BOOL)isPartialStringValidationEnabled
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"partialStringValidationEnabled"];
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (void)setPartialStringValidationEnabled:(BOOL)partialStringValidationEnabled
{
  BOOL v3 = partialStringValidationEnabled;
  [(NSRecursiveLock *)self->_lock lock];
  if ((self->_stateBitMask & 2) == 0)
  {
    if (v3) {
      uint64_t v5 = *MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v5 = *MEMORY[0x1E4F1CFC8];
    }
    ++self->_cacheGeneration;
    [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"partialStringValidationEnabled"];
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (BOOL)_usesCharacterDirection
{
  [(NSRecursiveLock *)self->_lock lock];
  if (_CFLocaleGetNoteCount() != self->_counter) {
    [(NSNumberFormatter *)self _clearFormatter];
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_attributes objectForKey:@"usesCharacterDirection"];
  char v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      uint64_t v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    [(NSNumberFormatter *)self _regenerateFormatter];
    if (v4) {
      goto LABEL_5;
    }
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    char v7 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D388]);
LABEL_9:
  char v7 = [v5 BOOLValue];
LABEL_10:
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  char v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    char v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  [(NSRecursiveLock *)self->_lock lock];
  ++self->_cacheGeneration;
  [(NSMutableDictionary *)self->_attributes setValue:v5 forKey:@"usesCharacterDirection"];
  formatter = self->_formatter;
  if (formatter) {
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E4F1D388], v5);
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (int64_t)minimumGroupingDigits
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumGroupingDigits"];
  if (!v3)
  {
    CFStringRef v6 = (const __CFString **)MEMORY[0x1E4F1D2E8];
    if (_CFLocaleGetNoteCount() != self->_counter) {
      [(NSNumberFormatter *)self _clearFormatter];
    }
    CFStringRef v4 = *v6;
    if (self->_formatter)
    {
      if (!v4) {
        goto LABEL_3;
      }
    }
    else
    {
      [(NSNumberFormatter *)self _regenerateFormatter];
      if (!v4) {
        goto LABEL_3;
      }
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      CFStringRef v4 = 0;
      goto LABEL_3;
    }
    uint64_t v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  CFStringRef v4 = (const __CFString *)[v3 integerValue];
LABEL_3:
  [(NSRecursiveLock *)self->_lock unlock];
  return (int64_t)v4;
}

- (void)setMinimumGroupingDigits:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attributes objectForKey:@"minimumGroupingDigits"];
  if (!v5 || [v5 integerValue] != a3)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D2E8];
    char v7 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)self->_attributes setValue:v7 forKey:@"minimumGroupingDigits"];
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter) {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
    }
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((_NSIsNSNumber() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 40, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSNumber(value)" object file lineNumber description];
    }
    v6.receiver = self;
    v6.super_class = (Class)NSNumberFormatter;
    [(NSNumberFormatter *)&v6 receiveObservedValue:[(NSNumberFormatter *)self stringFromNumber:a3]];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSNumberFormatter;
    [(NSNumberFormatter *)&v7 receiveObservedValue:0];
  }
}

@end