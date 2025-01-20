@interface NSLocale
+ (BOOL)supportsSecureCoding;
+ (NSArray)ISOCountryCodes;
+ (NSArray)ISOCurrencyCodes;
+ (NSArray)ISOLanguageCodes;
+ (NSArray)availableLocaleIdentifiers;
+ (NSArray)commonISOCurrencyCodes;
+ (NSArray)preferredLanguages;
+ (NSDictionary)componentsFromLocaleIdentifier:(NSString *)string;
+ (NSLocale)allocWithZone:(_NSZone *)a3;
+ (NSLocale)currentLocale;
+ (NSLocale)localeWithLocaleIdentifier:(NSString *)ident;
+ (NSLocale)systemLocale;
+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode;
+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode;
+ (NSString)canonicalLanguageIdentifierFromString:(NSString *)string;
+ (NSString)canonicalLocaleIdentifierFromString:(NSString *)string;
+ (NSString)localeIdentifierFromComponents:(NSDictionary *)dict;
+ (NSString)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid;
+ (id)internetServicesRegion;
+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesMetricSystem;
- (NSCharacterSet)exemplarCharacterSet;
- (NSLocale)init;
- (NSLocale)initWithCoder:(NSCoder *)coder;
- (NSString)alternateQuotationBeginDelimiter;
- (NSString)alternateQuotationEndDelimiter;
- (NSString)calendarIdentifier;
- (NSString)collationIdentifier;
- (NSString)collatorIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)currencySymbol;
- (NSString)decimalSeparator;
- (NSString)displayNameForKey:(NSLocaleKey)key value:(id)value;
- (NSString)groupingSeparator;
- (NSString)languageCode;
- (NSString)languageIdentifier;
- (NSString)localeIdentifier;
- (NSString)localizedStringForCalendarIdentifier:(NSString *)calendarIdentifier;
- (NSString)localizedStringForCollationIdentifier:(NSString *)collationIdentifier;
- (NSString)localizedStringForCollatorIdentifier:(NSString *)collatorIdentifier;
- (NSString)localizedStringForCountryCode:(NSString *)countryCode;
- (NSString)localizedStringForCurrencyCode:(NSString *)currencyCode;
- (NSString)localizedStringForLanguageCode:(NSString *)languageCode;
- (NSString)localizedStringForLocaleIdentifier:(NSString *)localeIdentifier;
- (NSString)localizedStringForScriptCode:(NSString *)scriptCode;
- (NSString)localizedStringForVariantCode:(NSString *)variantCode;
- (NSString)quotationBeginDelimiter;
- (NSString)quotationEndDelimiter;
- (NSString)regionCode;
- (NSString)scriptCode;
- (NSString)variantCode;
- (id)_copyDisplayNameForKey:(id)a3 value:(id)a4;
- (id)_prefForKey:(id)a3;
- (id)localizedStringForAlternateQuotationBeginDelimiter:(id)a3;
- (id)localizedStringForAlternateQuotationEndDelimiter:(id)a3;
- (id)localizedStringForCurrencySymbol:(id)a3;
- (id)localizedStringForDecimalSeparator:(id)a3;
- (id)localizedStringForGroupingSeparator:(id)a3;
- (id)localizedStringForQuotationBeginDelimiter:(id)a3;
- (id)localizedStringForQuotationEndDelimiter:(id)a3;
- (id)objectForKey:(NSLocaleKey)key;
- (unint64_t)hash;
@end

@implementation NSLocale

+ (NSLocale)currentLocale
{
  return (NSLocale *)+[NSLocale _current];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(NSLocale *)self localeIdentifier];
  uint64_t v6 = [a3 localeIdentifier];

  return [(NSString *)v5 isEqual:v6];
}

- (unint64_t)hash
{
  v2 = [(NSLocale *)self localeIdentifier];

  return [(NSString *)v2 hash];
}

+ (NSString)localeIdentifierFromComponents:(NSDictionary *)dict
{
  return (NSString *)+[NSLocale _localeIdentifierFromComponents:dict];
}

+ (NSDictionary)componentsFromLocaleIdentifier:(NSString *)string
{
  return (NSDictionary *)+[NSLocale _componentsFromLocaleIdentifier:string];
}

+ (NSArray)preferredLanguages
{
  return (NSArray *)+[NSLocale _preferredLanguages];
}

+ (NSString)canonicalLanguageIdentifierFromString:(NSString *)string
{
  if (string) {
    return (NSString *)+[NSLocale _canonicalLanguageIdentifierFromString:](NSLocale, "_canonicalLanguageIdentifierFromString:");
  }
  else {
    return 0;
  }
}

+ (NSLocale)systemLocale
{
  return (NSLocale *)+[NSLocale _system];
}

+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _characterDirectionForLanguage:isoLangCode];
}

+ (NSLocale)localeWithLocaleIdentifier:(NSString *)ident
{
  v3 = (void *)[objc_alloc((Class)a1) initWithLocaleIdentifier:ident];

  return (NSLocale *)v3;
}

+ (NSLocale)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSLocale == a1) {
    return (NSLocale *)&__placeholderLocale;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSLocale;
  return (NSLocale *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSString)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid
{
  return (NSString *)+[NSLocale _localeIdentifierFromWindowsLocaleCode:*(void *)&lcid];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)ISOCountryCodes
{
  return (NSArray *)+[NSLocale _isoCountryCodes];
}

- (NSLocale)init
{
  return [(NSLocale *)self initWithLocaleIdentifier:0];
}

- (NSLocale)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSString)localeIdentifier
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleIdentifierKey"];
}

- (NSString)localizedStringForLocaleIdentifier:(NSString *)localeIdentifier
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleIdentifierKey" value:localeIdentifier];
}

- (NSString)languageCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleLanguageCodeKey"];
}

- (NSString)localizedStringForLanguageCode:(NSString *)languageCode
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleLanguageCodeKey" value:languageCode];
}

- (NSString)countryCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleCountryCodeKey"];
}

- (NSString)localizedStringForCountryCode:(NSString *)countryCode
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleCountryCodeKey" value:countryCode];
}

- (NSString)scriptCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleScriptCodeKey"];
}

- (NSString)localizedStringForScriptCode:(NSString *)scriptCode
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleScriptCodeKey" value:scriptCode];
}

- (NSString)variantCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleVariantCodeKey"];
}

- (NSString)localizedStringForVariantCode:(NSString *)variantCode
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleVariantCodeKey" value:variantCode];
}

- (NSString)calendarIdentifier
{
  return (NSString *)[(NSLocale *)self objectForKey:@"calendar"];
}

- (NSString)localizedStringForCalendarIdentifier:(NSString *)calendarIdentifier
{
  return [(NSLocale *)self displayNameForKey:@"calendar" value:calendarIdentifier];
}

- (NSString)collationIdentifier
{
  return (NSString *)[(NSLocale *)self objectForKey:@"collation"];
}

- (NSString)localizedStringForCollationIdentifier:(NSString *)collationIdentifier
{
  return [(NSLocale *)self displayNameForKey:@"collation" value:collationIdentifier];
}

- (NSString)decimalSeparator
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleDecimalSeparatorKey"];
}

- (id)localizedStringForDecimalSeparator:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleDecimalSeparatorKey" value:a3];
}

- (NSString)groupingSeparator
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleGroupingSeparatorKey"];
}

- (id)localizedStringForGroupingSeparator:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleGroupingSeparatorKey" value:a3];
}

- (NSString)currencySymbol
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleCurrencySymbolKey"];
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleCurrencySymbolKey" value:a3];
}

- (NSString)currencyCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"currency"];
}

- (NSString)localizedStringForCurrencyCode:(NSString *)currencyCode
{
  return [(NSLocale *)self displayNameForKey:@"currency" value:currencyCode];
}

- (NSString)collatorIdentifier
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleCollatorIdentifierKey"];
}

- (NSString)localizedStringForCollatorIdentifier:(NSString *)collatorIdentifier
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleCollatorIdentifierKey" value:collatorIdentifier];
}

- (NSString)quotationBeginDelimiter
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleQuotationBeginDelimiterKey"];
}

- (id)localizedStringForQuotationBeginDelimiter:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleQuotationBeginDelimiterKey" value:a3];
}

- (NSString)quotationEndDelimiter
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleQuotationEndDelimiterKey"];
}

- (id)localizedStringForQuotationEndDelimiter:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleQuotationEndDelimiterKey" value:a3];
}

- (NSString)alternateQuotationBeginDelimiter
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleAlternateQuotationBeginDelimiterKey"];
}

- (id)localizedStringForAlternateQuotationBeginDelimiter:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleAlternateQuotationBeginDelimiterKey" value:a3];
}

- (NSString)alternateQuotationEndDelimiter
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleAlternateQuotationEndDelimiterKey"];
}

- (id)localizedStringForAlternateQuotationEndDelimiter:(id)a3
{
  return [(NSLocale *)self displayNameForKey:@"kCFLocaleAlternateQuotationEndDelimiterKey" value:a3];
}

- (NSCharacterSet)exemplarCharacterSet
{
  return (NSCharacterSet *)[(NSLocale *)self objectForKey:@"kCFLocaleExemplarCharacterSetKey"];
}

- (BOOL)usesMetricSystem
{
  id v2 = [(NSLocale *)self objectForKey:@"kCFLocaleUsesMetricSystemKey"];

  return [v2 BOOLValue];
}

- (NSString)regionCode
{
  return (NSString *)[(NSLocale *)self objectForKey:@"kCFLocaleCountryCodeKey"];
}

- (NSString)languageIdentifier
{
  return (NSString *)[(NSLocale *)self objectForKey:@"locale:languageIdentifier"];
}

+ (NSArray)availableLocaleIdentifiers
{
  return (NSArray *)+[NSLocale _availableLocaleIdentifiers];
}

+ (NSArray)ISOLanguageCodes
{
  return (NSArray *)+[NSLocale _isoLanguageCodes];
}

+ (NSArray)ISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _isoCurrencyCodes];
}

+ (NSArray)commonISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _commonISOCurrencyCodes];
}

+ (NSString)canonicalLocaleIdentifierFromString:(NSString *)string
{
  if (string) {
    return (NSString *)+[NSLocale _canonicalLocaleIdentifierFromString:](NSLocale, "_canonicalLocaleIdentifierFromString:");
  }
  else {
    return 0;
  }
}

+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier
{
  return +[NSLocale _windowsLocaleCodeFromLocaleIdentifier:localeIdentifier];
}

+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _lineDirectionForLanguage:isoLangCode];
}

- (id)_copyDisplayNameForKey:(id)a3 value:(id)a4
{
  objc_super v4 = [(NSLocale *)self displayNameForKey:a3 value:a4];

  return v4;
}

- (id)_prefForKey:(id)a3
{
  return 0;
}

+ (id)internetServicesRegion
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"AppleInternetServicesRegion", @"kCFPreferencesCurrentApplication");
  if (v2)
  {
    v3 = (void *)v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
    {
      return v3;
    }
    CFRelease(v3);
  }
  uint64_t v6 = +[NSLocale currentLocale];

  return [(NSLocale *)v6 objectForKey:@"kCFLocaleCountryCodeKey"];
}

- (id)objectForKey:(NSLocaleKey)key
{
  uint64_t v5 = __CFLookUpClass("NSLocale");
  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

- (NSString)displayNameForKey:(NSLocaleKey)key value:(id)value
{
  uint64_t v6 = __CFLookUpClass("NSLocale");
  __CFRequireConcreteImplementation(v6, (objc_class *)self, a2);
}

@end