@interface LibcoreIcuICU
+ (IOSObjectArray)getAvailableCalendarLocalesNative;
+ (IOSObjectArray)getAvailableDateFormatLocalesNative;
+ (IOSObjectArray)getAvailableNumberFormatLocalesNative;
+ (IOSObjectArray)getISOCountriesNative;
+ (IOSObjectArray)getISOLanguagesNative;
+ (const)__metadata;
+ (id)getAvailableBreakIteratorLocales;
+ (id)getAvailableBreakIteratorLocalesNative;
+ (id)getAvailableCalendarLocales;
+ (id)getAvailableCollatorLocales;
+ (id)getAvailableCollatorLocalesNative;
+ (id)getAvailableCurrencyCodes;
+ (id)getAvailableDateFormatLocales;
+ (id)getAvailableDateFormatSymbolsLocales;
+ (id)getAvailableDecimalFormatSymbolsLocales;
+ (id)getAvailableLocalesNative;
+ (id)getAvailableNumberFormatLocales;
+ (id)getCurrencyCodeWithNSString:(id)a3;
+ (id)getCurrencySymbolWithNSString:(id)a3;
+ (id)getDisplayCountryNativeWithNSString:(id)a3 withNSString:(id)a4;
+ (id)getDisplayLanguageNativeWithNSString:(id)a3 withNSString:(id)a4;
+ (id)getDisplayVariantNativeWithNSString:(id)a3 withNSString:(id)a4;
+ (id)getISO3CountryNativeWithNSString:(id)a3;
+ (id)getISO3LanguageNativeWithNSString:(id)a3;
+ (id)localeFromStringWithNSString:(id)a3;
+ (id)localesFromStringsWithNSStringArray:(id)a3;
+ (int)getCurrencyFractionDigitsWithNSString:(id)a3;
@end

@implementation LibcoreIcuICU

+ (id)localeFromStringWithNSString:(id)a3
{
  return LibcoreIcuICU_localeFromStringWithNSString_(a3);
}

+ (id)localesFromStringsWithNSStringArray:(id)a3
{
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)a3);
}

+ (id)getAvailableBreakIteratorLocales
{
  v2 = +[IOSObjectArray arrayWithLength:0 type:NSString_class_()];
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableCalendarLocales
{
  v2 = +[LibcoreIcuICU getAvailableCalendarLocalesNative]_0();
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableCollatorLocales
{
  v2 = +[IOSObjectArray arrayWithLength:0 type:NSString_class_()];
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableDateFormatLocales
{
  v2 = +[LibcoreIcuICU getAvailableDateFormatLocalesNative]_0();
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableDateFormatSymbolsLocales
{
  v2 = +[LibcoreIcuICU getAvailableDateFormatLocalesNative]_0();
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableDecimalFormatSymbolsLocales
{
  v2 = +[LibcoreIcuICU getAvailableNumberFormatLocalesNative]_0();
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableNumberFormatLocales
{
  v2 = +[LibcoreIcuICU getAvailableNumberFormatLocalesNative]_0();
  return LibcoreIcuICU_localesFromStringsWithNSStringArray_((uint64_t)v2);
}

+ (id)getAvailableCurrencyCodes
{
  v2 = +[NSLocale ISOCurrencyCodes];
  uint64_t v3 = NSString_class_();
  return +[IOSObjectArray arrayWithNSArray:v2 type:v3];
}

+ (id)getAvailableBreakIteratorLocalesNative
{
  uint64_t v2 = NSString_class_();
  return +[IOSObjectArray arrayWithLength:0 type:v2];
}

+ (id)getAvailableCollatorLocalesNative
{
  uint64_t v2 = NSString_class_();
  return +[IOSObjectArray arrayWithLength:0 type:v2];
}

+ (id)getAvailableLocalesNative
{
  uint64_t v2 = +[NSLocale availableLocaleIdentifiers];
  uint64_t v3 = NSString_class_();
  return +[IOSObjectArray arrayWithNSArray:v2 type:v3];
}

+ (id)getDisplayCountryNativeWithNSString:(id)a3 withNSString:(id)a4
{
  return LibcoreIcuICU_getDisplayCountryNativeWithNSString_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (id)getDisplayLanguageNativeWithNSString:(id)a3 withNSString:(id)a4
{
  return LibcoreIcuICU_getDisplayLanguageNativeWithNSString_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (id)getDisplayVariantNativeWithNSString:(id)a3 withNSString:(id)a4
{
  return LibcoreIcuICU_getDisplayVariantNativeWithNSString_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (id)getISO3CountryNativeWithNSString:(id)a3
{
}

+ (id)getISO3LanguageNativeWithNSString:(id)a3
{
}

+ (id)getCurrencyCodeWithNSString:(id)a3
{
  return LibcoreIcuICU_getCurrencyCodeWithNSString_((uint64_t)a3);
}

+ (id)getCurrencySymbolWithNSString:(id)a3
{
  return LibcoreIcuICU_getCurrencySymbolWithNSString_((uint64_t)a3);
}

+ (int)getCurrencyFractionDigitsWithNSString:(id)a3
{
  return LibcoreIcuICU_getCurrencyFractionDigitsWithNSString_((uint64_t)a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100480610;
}

+ (IOSObjectArray)getISOLanguagesNative
{
  v0 = +[NSLocale ISOLanguageCodes];
  NSUInteger v1 = [(NSArray *)v0 count];
  uint64_t v2 = +[NSMutableData dataWithLength:8 * v1];
  -[NSArray getObjects:range:](v0, "getObjects:range:", [(NSMutableData *)v2 mutableBytes], 0, v1);
  id v3 = [(NSMutableData *)v2 mutableBytes];
  uint64_t v4 = NSString_class_();
  return +[IOSObjectArray arrayWithObjects:v3 count:(int)v1 type:v4];
}

+ (IOSObjectArray)getISOCountriesNative
{
  v0 = +[NSLocale ISOCountryCodes];
  NSUInteger v1 = [(NSArray *)v0 count];
  uint64_t v2 = +[NSMutableData dataWithLength:8 * v1];
  -[NSArray getObjects:range:](v0, "getObjects:range:", [(NSMutableData *)v2 mutableBytes], 0, v1);
  id v3 = [(NSMutableData *)v2 mutableBytes];
  uint64_t v4 = NSString_class_();
  return +[IOSObjectArray arrayWithObjects:v3 count:(int)v1 type:v4];
}

+ (IOSObjectArray)getAvailableDateFormatLocalesNative
{
  id v0 = +[NSMutableArray array];
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = +[NSLocale availableLocaleIdentifiers];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v7];
        [v1 setLocale:v8];
        if ([v1 dateFormat]) {
          [v0 addObject:v7];
        }

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return +[IOSObjectArray arrayWithNSArray:v0 type:NSString_class_()];
}

+ (IOSObjectArray)getAvailableCalendarLocalesNative
{
  id v0 = +[NSMutableArray array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = +[NSLocale availableLocaleIdentifiers];
  id v2 = [(NSArray *)v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v5);
        id v7 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v6];
        if ([v7 objectForKey:NSLocaleCalendar]) {
          [v0 addObject:v6];
        }

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [(NSArray *)v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  return +[IOSObjectArray arrayWithNSArray:v0 type:NSString_class_()];
}

+ (IOSObjectArray)getAvailableNumberFormatLocalesNative
{
  id v0 = +[NSMutableArray array];
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = +[NSLocale availableLocaleIdentifiers];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v7];
        [v1 setLocale:v8];
        if ([v1 positiveFormat]) {
          [v0 addObject:v7];
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return +[IOSObjectArray arrayWithNSArray:v0 type:NSString_class_()];
}

@end