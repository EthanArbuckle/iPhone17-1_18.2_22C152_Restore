@interface _NBPhoneNumberUtil
+ (_NBPhoneNumberUtil)sharedInstance;
+ (void)initialize;
- (BOOL)canBeInternationallyDialled:(id)a3;
- (BOOL)canBeInternationallyDialled:(id)a3 error:(id *)a4;
- (BOOL)checkRegionForParsing:(id)a3 defaultRegion:(id)a4;
- (BOOL)descHasPossibleNumberData:(id)a3;
- (BOOL)formattingRuleHasFirstGroupOnly:(id)a3;
- (BOOL)hasFormattingPatternForNumber:(id)a3;
- (BOOL)hasUnexpectedItalianLeadingZero:(id)a3;
- (BOOL)hasValidCountryCallingCode:(id)a3;
- (BOOL)isAllDigits:(id)a3;
- (BOOL)isAlphaNumber:(id)a3;
- (BOOL)isLeadingZeroPossible:(id)a3;
- (BOOL)isNANPACountry:(id)a3;
- (BOOL)isNationalNumberSuffixOfTheOther:(id)a3 second:(id)a4;
- (BOOL)isNumberGeographical:(id)a3;
- (BOOL)isNumberMatchingDesc:(id)a3 numberDesc:(id)a4;
- (BOOL)isPossibleNumber:(id)a3;
- (BOOL)isPossibleNumber:(id)a3 error:(id *)a4;
- (BOOL)isPossibleNumberString:(id)a3 regionDialingFrom:(id)a4 error:(id *)a5;
- (BOOL)isStartingStringByRegex:(id)a3 regex:(id)a4;
- (BOOL)isValidNumber:(id)a3;
- (BOOL)isValidNumberForRegion:(id)a3 regionCode:(id)a4;
- (BOOL)isValidRegionCode:(id)a3;
- (BOOL)isViablePhoneNumber:(id)a3;
- (BOOL)matchesEntirely:(id)a3 string:(id)a4;
- (BOOL)maybeStripNationalPrefixAndCarrierCode:(id *)a3 metadata:(id)a4 carrierCode:(id *)a5;
- (BOOL)parsePrefixAsIdd:(id)a3 sourceString:(id *)a4;
- (BOOL)rawInputContainsNationalPrefix:(id)a3 nationalPrefix:(id)a4 regionCode:(id)a5;
- (BOOL)truncateTooLongNumber:(id)a3;
- (CTTelephonyNetworkInfo)telephonyNetworkInfo;
- (NSDictionary)DIGIT_MAPPINGS;
- (NSLock)entireStringCacheLock;
- (NSLock)lockPatternCache;
- (NSMutableDictionary)entireStringRegexCache;
- (NSMutableDictionary)regexPatternCache;
- (NSRegularExpression)CAPTURING_DIGIT_PATTERN;
- (NSRegularExpression)VALID_ALPHA_PHONE_PATTERN;
- (_NBMetadataHelper)helper;
- (_NBPhoneNumberUtil)init;
- (_NBRegExMatcher)matcher;
- (id)chooseFormattingPatternForNumber:(id)a3 nationalNumber:(id)a4;
- (id)componentsSeparatedByRegex:(id)a3 regex:(id)a4;
- (id)convertAlphaCharactersInNumber:(id)a3;
- (id)countryCodeByCarrier;
- (id)entireRegularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)errorWithObject:(id)a3 withDomain:(id)a4;
- (id)extractCountryCode:(id)a3 nationalNumber:(id *)a4;
- (id)extractPossibleNumber:(id)a3;
- (id)format:(id)a3 numberFormat:(int64_t)a4;
- (id)format:(id)a3 numberFormat:(int64_t)a4 error:(id *)a5;
- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5;
- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5 error:(id *)a6;
- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4;
- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5;
- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4;
- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4 error:(id *)a5;
- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4;
- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4 error:(id *)a5;
- (id)formatNsn:(id)a3 metadata:(id)a4 phoneNumberFormat:(int64_t)a5 carrierCode:(id)a6;
- (id)formatNsnUsingPattern:(id)a3 formattingPattern:(id)a4 numberFormat:(int64_t)a5 carrierCode:(id)a6;
- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5;
- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5 error:(id *)a6;
- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4;
- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5;
- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4;
- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5;
- (id)getCountryCodeForRegion:(id)a3;
- (id)getCountryCodeForValidRegion:(id)a3 error:(id *)a4;
- (id)getCountryMobileTokenFromCountryCode:(int64_t)a3;
- (id)getExampleNumber:(id)a3 error:(id *)a4;
- (id)getExampleNumberForNonGeoEntity:(id)a3 error:(id *)a4;
- (id)getExampleNumberForType:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (id)getMetadataForRegionOrCallingCode:(id)a3 regionCode:(id)a4;
- (id)getNationalSignificantNumber:(id)a3;
- (id)getNddPrefixForRegion:(id)a3 stripNonDigits:(BOOL)a4;
- (id)getNumberDescByType:(id)a3 type:(int64_t)a4;
- (id)getRegionCodeForCountryCode:(id)a3;
- (id)getRegionCodeForNumber:(id)a3;
- (id)getRegionCodeForNumberFromRegionList:(id)a3 regionCodes:(id)a4;
- (id)getRegionCodesForCountryCode:(id)a3;
- (id)getSupportedRegions;
- (id)matchFirstByRegex:(id)a3 regex:(id)a4;
- (id)matchedStringByRegex:(id)a3 regex:(id)a4;
- (id)matchesByRegex:(id)a3 regex:(id)a4;
- (id)maybeExtractCountryCode:(id)a3 metadata:(id)a4 nationalNumber:(id *)a5 keepRawInput:(BOOL)a6 phoneNumber:(id *)a7 error:(id *)a8;
- (id)maybeGetFormattedExtension:(id)a3 metadata:(id)a4 numberFormat:(int64_t)a5;
- (id)maybeStripExtension:(id *)a3;
- (id)normalize:(id)a3;
- (id)normalizeDiallableCharsOnly:(id)a3;
- (id)normalizeDigitsOnly:(id)a3;
- (id)normalizeHelper:(id)a3 normalizationReplacements:(id)a4 removeNonMatches:(BOOL)a5;
- (id)parse:(id)a3 defaultRegion:(id)a4 error:(id *)a5;
- (id)parseAndKeepRawInput:(id)a3 defaultRegion:(id)a4 error:(id *)a5;
- (id)parseHelper:(id)a3 defaultRegion:(id)a4 keepRawInput:(BOOL)a5 checkRegion:(BOOL)a6 error:(id *)a7;
- (id)parseWithPhoneCarrierRegion:(id)a3 error:(id *)a4;
- (id)prefixNumberWithCountryCallingCode:(id)a3 phoneNumberFormat:(int64_t)a4 formattedNationalNumber:(id)a5 formattedExtension:(id)a6;
- (id)regularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)replaceFirstStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5;
- (id)replaceStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5;
- (id)stringByReplacingOccurrencesString:(id)a3 withMap:(id)a4 removeNonMatches:(BOOL)a5;
- (int)getLengthOfGeographicalAreaCode:(id)a3;
- (int)getLengthOfGeographicalAreaCode:(id)a3 error:(id *)a4;
- (int)getLengthOfNationalDestinationCode:(id)a3;
- (int)getLengthOfNationalDestinationCode:(id)a3 error:(id *)a4;
- (int)indexOfStringByString:(id)a3 target:(id)a4;
- (int)stringPositionByRegex:(id)a3 regex:(id)a4;
- (int64_t)getNumberType:(id)a3;
- (int64_t)getNumberTypeHelper:(id)a3 metadata:(id)a4;
- (int64_t)isNumberMatch:(id)a3 second:(id)a4;
- (int64_t)isNumberMatch:(id)a3 second:(id)a4 error:(id *)a5;
- (int64_t)isPossibleNumberWithReason:(id)a3;
- (int64_t)isPossibleNumberWithReason:(id)a3 error:(id *)a4;
- (int64_t)maybeStripInternationalPrefixAndNormalize:(id *)a3 possibleIddPrefix:(id)a4;
- (int64_t)testNumberLength:(id)a3 desc:(id)a4;
- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4;
- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4 type:(int64_t)a5;
- (void)buildNationalNumberForParsing:(id)a3 nationalNumber:(id *)a4;
- (void)initNormalizationMappings;
- (void)initRegularExpressionSet;
- (void)normalizeSB:(id *)a3;
- (void)setCAPTURING_DIGIT_PATTERN:(id)a3;
- (void)setEntireStringCacheLock:(id)a3;
- (void)setEntireStringRegexCache:(id)a3;
- (void)setHelper:(id)a3;
- (void)setItalianLeadingZerosForPhoneNumber:(id)a3 phoneNumber:(id)a4;
- (void)setLockPatternCache:(id)a3;
- (void)setMatcher:(id)a3;
- (void)setRegexPatternCache:(id)a3;
- (void)setVALID_ALPHA_PHONE_PATTERN:(id)a3;
@end

@implementation _NBPhoneNumberUtil

+ (_NBPhoneNumberUtil)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36___NBPhoneNumberUtil_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26ACEFD10 != -1) {
    dispatch_once(&qword_26ACEFD10, block);
  }
  v2 = (void *)_MergedGlobals_41;

  return (_NBPhoneNumberUtil *)v2;
}

- (id)errorWithObject:(id)a3 withDomain:(id)a4
{
  v5 = NSDictionary;
  uint64_t v6 = *MEMORY[0x263F08320];
  id v7 = a4;
  v8 = [v5 dictionaryWithObject:a3 forKey:v6];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:0 userInfo:v8];

  return v9;
}

- (id)entireRegularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  [(NSLock *)self->_entireStringCacheLock lock];
  entireStringRegexCache = self->_entireStringRegexCache;
  if (!entireStringRegexCache)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = self->_entireStringRegexCache;
    self->_entireStringRegexCache = v9;

    entireStringRegexCache = self->_entireStringRegexCache;
  }
  v11 = [(NSMutableDictionary *)entireStringRegexCache objectForKey:v7];
  if (!v11)
  {
    id v12 = v7;
    v13 = v12;
    if ([v12 rangeOfString:@"^"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [NSString stringWithFormat:@"^(?:%@)$", v12];
    }
    v11 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:v13 options:0 error:a5];
    [(NSMutableDictionary *)self->_entireStringRegexCache setObject:v11 forKey:v12];
  }
  [(NSLock *)self->_entireStringCacheLock unlock];

  return v11;
}

- (id)regularExpressionWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  [(NSLock *)self->_lockPatternCache lock];
  regexPatternCache = self->_regexPatternCache;
  if (!regexPatternCache)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v11 = self->_regexPatternCache;
    self->_regexPatternCache = v10;

    regexPatternCache = self->_regexPatternCache;
  }
  id v12 = [(NSMutableDictionary *)regexPatternCache objectForKey:v8];
  if (!v12)
  {
    id v12 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v8 options:a4 error:a5];
    [(NSMutableDictionary *)self->_regexPatternCache setObject:v12 forKey:v8];
  }
  [(NSLock *)self->_lockPatternCache unlock];

  return v12;
}

- (id)componentsSeparatedByRegex:(id)a3 regex:(id)a4
{
  v4 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:a3 regex:a4 withTemplate:@"<SEP>"];
  v5 = [v4 componentsSeparatedByString:@"<SEP>"];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 removeObject:&stru_26C611188];

  return v6;
}

- (int)stringPositionByRegex:(id)a3 regex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v8 = [v6 length];
  int v9 = -1;
  if (!v7 || !v8) {
    goto LABEL_10;
  }
  if (![v7 length])
  {
LABEL_7:
    int v9 = -1;
    goto LABEL_10;
  }
  uint64_t v14 = 0;
  v10 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:v7 options:0 error:&v14];
  v11 = objc_msgSend(v10, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  if ([v11 count])
  {
    id v12 = [v11 objectAtIndex:0];
    int v9 = [v12 range];
  }
  else
  {
    int v9 = -1;
  }

LABEL_10:
  return v9;
}

- (int)indexOfStringByString:(id)a3 target:(id)a4
{
  return [a3 rangeOfString:a4];
}

- (id)replaceFirstStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)[v8 copy];
  uint64_t v20 = 0;
  id v12 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:v10 options:0 error:&v20];

  uint64_t v13 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    v17 = (void *)[v8 mutableCopy];
    uint64_t v18 = objc_msgSend(v12, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, v15, v16, v9);

    v11 = (void *)v18;
  }

  return v11;
}

- (id)replaceStringByRegex:(id)a3 regex:(id)a4 withTemplate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  id v10 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:a4 options:0 error:&v20];
  v11 = objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  if ([v11 count] == 1)
  {
    uint64_t v12 = objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = v12;
      uint64_t v15 = v13;
      uint64_t v16 = (void *)[v8 mutableCopy];
      v17 = objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, v14, v15, v9);

      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ((unint64_t)[v11 count] < 2)
  {
LABEL_6:
    uint64_t v18 = [v8 copy];
    goto LABEL_7;
  }
  uint64_t v18 = objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), v9);
LABEL_7:
  v17 = (void *)v18;
LABEL_8:

  return v17;
}

- (id)matchFirstByRegex:(id)a3 regex:(id)a4
{
  uint64_t v11 = 0;
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:a4 options:0 error:&v11];
  id v8 = objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if ([v8 count])
  {
    id v9 = [v8 objectAtIndex:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)matchesByRegex:(id)a3 regex:(id)a4
{
  uint64_t v10 = 0;
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:a4 options:0 error:&v10];
  id v8 = objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v8;
}

- (id)matchedStringByRegex:(id)a3 regex:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self matchesByRegex:v6 regex:a4];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "range", (void)v18);
        uint64_t v16 = objc_msgSend(v6, "substringWithRange:", v14, v15);
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BOOL)isStartingStringByRegex:(id)a3 regex:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v18 = 0;
  id v7 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:a4 options:0 error:&v18];
  id v8 = v18;
  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "range", (void)v14))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)stringByReplacingOccurrencesString:(id)a3 withMap:(id)a4 removeNonMatches:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v10 = [v7 length];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      __int16 v18 = 0;
      __int16 v18 = [v7 characterAtIndex:v12];
      uint64_t v13 = [NSString stringWithCharacters:&v18 length:1];
      long long v14 = [v8 objectForKey:v13];
      if (v14) {
        break;
      }
      if (!a5)
      {
        long long v15 = v9;
        long long v16 = v13;
        goto LABEL_7;
      }
LABEL_8:

      if (v11 == ++v12) {
        goto LABEL_9;
      }
    }
    long long v15 = v9;
    long long v16 = v14;
LABEL_7:
    [v15 appendString:v16];
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (BOOL)isAllDigits:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 decimalDigitCharacterSet];
  id v6 = [v5 invertedSet];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)getNationalSignificantNumber:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nationalNumber];
  v5 = [v4 stringValue];

  if ([v3 italianLeadingZero])
  {
    id v6 = [v3 numberOfLeadingZeros];
    if ([v6 integerValue] < 0)
    {
      id v8 = [&stru_26C611188 stringByPaddingToLength:0 withString:@"0" startingAtIndex:0];
    }
    else
    {
      uint64_t v7 = [v3 numberOfLeadingZeros];
      id v8 = objc_msgSend(&stru_26C611188, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v7, "integerValue"), @"0", 0);
    }
    uint64_t v9 = [NSString stringWithFormat:@"%@%@", v8, v5];
  }
  else
  {
    id v8 = [v3 nationalNumber];
    uint64_t v9 = [v8 stringValue];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____NBPhoneNumberUtil;
  objc_msgSendSuper2(&v3, sel_initialize);
  v2 = (void *)GEO_MOBILE_COUNTRIES;
  GEO_MOBILE_COUNTRIES = (uint64_t)&unk_26C628E10;
}

- (_NBPhoneNumberUtil)init
{
  v12.receiver = self;
  v12.super_class = (Class)_NBPhoneNumberUtil;
  v2 = [(_NBPhoneNumberUtil *)&v12 init];
  if (v2)
  {
    objc_super v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lockPatternCache = v2->_lockPatternCache;
    v2->_lockPatternCache = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    entireStringCacheLock = v2->_entireStringCacheLock;
    v2->_entireStringCacheLock = v5;

    uint64_t v7 = objc_alloc_init(_NBMetadataHelper);
    helper = v2->_helper;
    v2->_helper = v7;

    uint64_t v9 = objc_alloc_init(_NBRegExMatcher);
    matcher = v2->_matcher;
    v2->_matcher = v9;

    [(_NBPhoneNumberUtil *)v2 initRegularExpressionSet];
    [(_NBPhoneNumberUtil *)v2 initNormalizationMappings];
  }
  return v2;
}

- (void)initRegularExpressionSet
{
  if (self->_CAPTURING_DIGIT_PATTERN)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"([%@])", 0x26C612D08];
    id v11 = 0;
    v5 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:v4 options:0 error:&v11];
    id v3 = v11;
    CAPTURING_DIGIT_PATTERN = self->_CAPTURING_DIGIT_PATTERN;
    self->_CAPTURING_DIGIT_PATTERN = v5;
  }
  if (!self->_VALID_ALPHA_PHONE_PATTERN)
  {
    id v10 = v3;
    uint64_t v7 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:@"(?:.*?[A-Za-z]){3}.*" options:0 error:&v10];
    id v8 = v10;

    VALID_ALPHA_PHONE_PATTERN = self->_VALID_ALPHA_PHONE_PATTERN;
    self->_VALID_ALPHA_PHONE_PATTERN = v7;

    id v3 = v8;
  }
  if (initRegularExpressionSet_onceToken != -1) {
    dispatch_once(&initRegularExpressionSet_onceToken, &__block_literal_global_12);
  }
}

- (NSDictionary)DIGIT_MAPPINGS
{
  if (qword_26ACEFD50 != -1) {
    dispatch_once(&qword_26ACEFD50, &__block_literal_global_117);
  }
  v2 = (void *)qword_26ACEFD58;

  return (NSDictionary *)v2;
}

- (void)initNormalizationMappings
{
  if (initNormalizationMappings_onceToken != -1) {
    dispatch_once(&initNormalizationMappings_onceToken, &__block_literal_global_293);
  }
}

- (id)extractPossibleNumber:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  unsigned int v5 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v4 regex:qword_26ACEFD20];
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v7 = &stru_26C611188;
  }
  else
  {
    id v6 = [v4 substringFromIndex:v5];
    uint64_t v7 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v6 regex:qword_26ACEFD30 withTemplate:&stru_26C611188];

    int v8 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v7 regex:qword_26ACEFD28];
    if (v8 >= 1)
    {
      uint64_t v9 = -[__CFString substringWithRange:](v7, "substringWithRange:", 0, v8);

      uint64_t v7 = (__CFString *)v9;
    }
  }

  return v7;
}

- (BOOL)isViablePhoneNumber:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  BOOL v5 = (unint64_t)[v4 length] >= 2
    && [(_NBPhoneNumberUtil *)self matchesEntirely:qword_26ACEFD48 string:v4];

  return v5;
}

- (id)normalize:(id)a3
{
  id v4 = a3;
  if ([(_NBPhoneNumberUtil *)self matchesEntirely:@"(?:.*?[A-Za-z]){3}.*" string:v4]) {
    [(_NBPhoneNumberUtil *)self normalizeHelper:v4 normalizationReplacements:qword_26ACEFD68 removeNonMatches:1];
  }
  else {
  BOOL v5 = [(_NBPhoneNumberUtil *)self normalizeDigitsOnly:v4];
  }

  return v5;
}

- (void)normalizeSB:(id *)a3
{
  if (a3)
  {
    *a3 = [(_NBPhoneNumberUtil *)self normalize:*a3];
  }
}

- (id)normalizeDigitsOnly:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  BOOL v5 = [(_NBPhoneNumberUtil *)self DIGIT_MAPPINGS];
  id v6 = [(_NBPhoneNumberUtil *)self stringByReplacingOccurrencesString:v4 withMap:v5 removeNonMatches:1];

  return v6;
}

- (id)normalizeDiallableCharsOnly:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  BOOL v5 = [(_NBPhoneNumberUtil *)self stringByReplacingOccurrencesString:v4 withMap:qword_26ACEFD60 removeNonMatches:1];

  return v5;
}

- (id)convertAlphaCharactersInNumber:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  BOOL v5 = [(_NBPhoneNumberUtil *)self stringByReplacingOccurrencesString:v4 withMap:qword_26ACEFD68 removeNonMatches:0];

  return v5;
}

- (int)getLengthOfGeographicalAreaCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  LODWORD(self) = [(_NBPhoneNumberUtil *)self getLengthOfGeographicalAreaCode:v5];

  return (int)self;
}

- (int)getLengthOfGeographicalAreaCode:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self getRegionCodeForNumber:v4];
  id v6 = [(_NBPhoneNumberUtil *)self helper];
  uint64_t v7 = [v6 getMetadataForRegion:v5];

  if (!v7) {
    goto LABEL_7;
  }
  int v8 = [v7 nationalPrefix];
  if (v8)
  {
  }
  else if (([v4 italianLeadingZero] & 1) == 0)
  {
LABEL_7:
    int v9 = 0;
    goto LABEL_8;
  }
  if (![(_NBPhoneNumberUtil *)self isNumberGeographical:v4]) {
    goto LABEL_7;
  }
  int v9 = [(_NBPhoneNumberUtil *)self getLengthOfNationalDestinationCode:v4];
LABEL_8:

  return v9;
}

- (int)getLengthOfNationalDestinationCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  LODWORD(self) = [(_NBPhoneNumberUtil *)self getLengthOfNationalDestinationCode:v5];

  return (int)self;
}

- (int)getLengthOfNationalDestinationCode:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 extension];
  BOOL v6 = +[_NBMetadataHelper hasValue:v5];

  if (v6)
  {
    id v7 = (id)[v4 copy];
    [v7 setExtension:0];
  }
  else
  {
    id v7 = v4;
  }
  int v8 = [(_NBPhoneNumberUtil *)self format:v7 numberFormat:1];
  int v9 = [(_NBPhoneNumberUtil *)self componentsSeparatedByRegex:v8 regex:@"\\D+"];
  id v10 = (void *)[v9 mutableCopy];

  if ([v10 count])
  {
    id v11 = [v10 objectAtIndex:0];
    uint64_t v12 = [v11 length];

    if (!v12) {
      [v10 removeObjectAtIndex:0];
    }
  }
  if ((unint64_t)[v10 count] >= 3)
  {
    long long v14 = [v4 countryCode];
    long long v15 = +[_NBMetadataHelper regionCodeFromCountryCode:v14];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
LABEL_11:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "isEqualToString:", @"AR", (void)v23)) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v18) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }

      if ([(_NBPhoneNumberUtil *)self getNumberType:v4] != 1) {
        goto LABEL_20;
      }
      long long v21 = [v10 objectAtIndex:2];
      int v13 = [v21 length] + 1;
    }
    else
    {
LABEL_17:

LABEL_20:
      long long v21 = objc_msgSend(v10, "objectAtIndex:", 1, (void)v23);
      int v13 = [v21 length];
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (id)getCountryMobileTokenFromCountryCode:(int64_t)a3
{
  id v3 = (void *)qword_26ACEFD78;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = &stru_26C611188;
  }

  return v6;
}

- (id)normalizeHelper:(id)a3 normalizationReplacements:(id)a4 removeNonMatches:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 length];
  id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (v9)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = objc_msgSend(v7, "substringWithRange:", v11, 1);
      int v13 = [v12 uppercaseString];
      long long v14 = [v8 objectForKey:v13];

      if (v14) {
        break;
      }
      if (!a5)
      {
        long long v15 = v10;
        id v16 = v12;
        goto LABEL_7;
      }
LABEL_8:

      if (v9 == ++v11) {
        goto LABEL_9;
      }
    }
    long long v15 = v10;
    id v16 = v14;
LABEL_7:
    [v15 appendString:v16];
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BOOL)formattingRuleHasFirstGroupOnly:(id)a3
{
  id v4 = a3;
  int v5 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v4 regex:@"^\\(?\\$1\\)?"];
  uint64_t v6 = [v4 length];

  if (v6) {
    BOOL v7 = v5 < 0;
  }
  else {
    BOOL v7 = 0;
  }
  return !v7;
}

- (BOOL)isNumberGeographical:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_NBPhoneNumberUtil *)self getNumberType:v4];
  uint64_t v6 = (void *)GEO_MOBILE_COUNTRIES;
  BOOL v7 = [v4 countryCode];

  char v8 = [v6 containsObject:v7];
  if (v5 == 1) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  return (v5 | 2) == 2 || v9;
}

- (BOOL)isValidRegionCode:(id)a3
{
  id v4 = a3;
  if (+[_NBMetadataHelper hasValue:v4] && isNan(v4))
  {
    int64_t v5 = [(_NBPhoneNumberUtil *)self helper];
    uint64_t v6 = [v4 uppercaseString];
    BOOL v7 = [v5 getMetadataForRegion:v6];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasValidCountryCallingCode:(id)a3
{
  id v3 = +[_NBMetadataHelper regionCodeFromCountryCode:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)format:(id)a3 numberFormat:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = [(_NBPhoneNumberUtil *)self format:v7 numberFormat:a4];

  return v8;
}

- (id)format:(id)a3 numberFormat:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 nationalNumber];
  if ([v7 isEqualToNumber:&unk_26C628DE0])
  {
    BOOL v8 = [v6 rawInput];
    BOOL v9 = +[_NBMetadataHelper hasValue:v8];

    if (!v9) {
      goto LABEL_5;
    }
    id v7 = [v6 rawInput];
    if (+[_NBMetadataHelper hasValue:v7]) {
      goto LABEL_12;
    }
  }

LABEL_5:
  id v10 = [v6 countryCode];
  uint64_t v11 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
  if (!a4)
  {
    id v16 = [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v10 phoneNumberFormat:0 formattedNationalNumber:v11 formattedExtension:&stru_26C611188];
LABEL_10:
    id v7 = v16;
    goto LABEL_11;
  }
  if (![(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v10])
  {
    id v16 = v11;
    goto LABEL_10;
  }
  uint64_t v18 = +[_NBMetadataHelper regionCodeFromCountryCode:v10];
  uint64_t v12 = [v18 objectAtIndex:0];
  int v13 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v10 regionCode:v12];
  long long v14 = [(_NBPhoneNumberUtil *)self maybeGetFormattedExtension:v6 metadata:v13 numberFormat:a4];
  long long v15 = [(_NBPhoneNumberUtil *)self formatNsn:v11 metadata:v13 phoneNumberFormat:a4 carrierCode:0];
  id v7 = [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v10 phoneNumberFormat:a4 formattedNationalNumber:v15 formattedExtension:v14];

LABEL_11:
LABEL_12:

  return v7;
}

- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(_NBPhoneNumberUtil *)self formatByPattern:v9 numberFormat:a4 userDefinedFormats:v10];

  return v11;
}

- (id)formatByPattern:(id)a3 numberFormat:(int64_t)a4 userDefinedFormats:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 countryCode];
  uint64_t v11 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v8];
  if ([(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v10])
  {
    uint64_t v12 = +[_NBMetadataHelper regionCodeFromCountryCode:v10];
    int v13 = v12;
    if (v12 && [v12 count])
    {
      uint64_t v14 = [v13 objectAtIndex:0];
    }
    else
    {
      uint64_t v14 = 0;
    }
    v30 = (void *)v14;
    id v16 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v10 regionCode:v14];
    uint64_t v17 = [(_NBPhoneNumberUtil *)self chooseFormattingPatternForNumber:v9 nationalNumber:v11];
    uint64_t v18 = v17;
    v31 = v13;
    if (v17)
    {
      id v29 = v9;
      uint64_t v19 = (void *)[v17 copy];
      uint64_t v20 = [v18 nationalPrefixFormattingRule];
      if ([(__CFString *)v20 length])
      {
        long long v21 = [v16 nationalPrefix];
        if ([v21 length])
        {
          [(_NBPhoneNumberUtil *)self replaceStringByRegex:v20 regex:@"\\$NP" withTemplate:v21];
          v22 = uint64_t v28 = v21;

          uint64_t v20 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v22 regex:@"\\$FG" withTemplate:@"\\$1"];

          long long v21 = v28;
          long long v23 = v19;
          long long v24 = v20;
        }
        else
        {
          long long v24 = &stru_26C611188;
          long long v23 = v19;
        }
        objc_msgSend(v23, "setNationalPrefixFormattingRule:", v24, v28);
      }
      id v25 = [(_NBPhoneNumberUtil *)self formatNsnUsingPattern:v11 formattingPattern:v19 numberFormat:a4 carrierCode:0];

      id v9 = v29;
    }
    else
    {
      id v25 = v11;
    }
    long long v26 = [(_NBPhoneNumberUtil *)self maybeGetFormattedExtension:v8 metadata:v16 numberFormat:a4];
    id v15 = [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v10 phoneNumberFormat:a4 formattedNationalNumber:v25 formattedExtension:v26];
  }
  else
  {
    id v15 = v11;
  }

  return v15;
}

- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NBPhoneNumberUtil *)self formatNationalNumberWithCarrierCode:v7 carrierCode:v8];

  return v9;
}

- (id)formatNationalNumberWithCarrierCode:(id)a3 carrierCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 countryCode];
  id v9 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
  if ([(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v8])
  {
    id v10 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v8];
    uint64_t v11 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v8 regionCode:v10];
    uint64_t v12 = [(_NBPhoneNumberUtil *)self maybeGetFormattedExtension:v6 metadata:v11 numberFormat:2];
    int v13 = [(_NBPhoneNumberUtil *)self formatNsn:v9 metadata:v11 phoneNumberFormat:2 carrierCode:v7];
    id v14 = [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v8 phoneNumberFormat:2 formattedNationalNumber:v13 formattedExtension:v12];
  }
  else
  {
    id v14 = v9;
  }

  return v14;
}

- (id)getMetadataForRegionOrCallingCode:(id)a3 regionCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_NBPhoneNumberUtil *)self helper];
  if ([v7 isEqualToString:0x26C612D28]) {
    [v8 getMetadataForNonGeographicalRegion:v6];
  }
  else {
  id v9 = [v8 getMetadataForRegion:v7];
  }

  return v9;
}

- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NBPhoneNumberUtil *)self formatNationalNumberWithCarrierCode:v7 carrierCode:v8];

  return v9;
}

- (id)formatNationalNumberWithPreferredCarrierCode:(id)a3 fallbackCarrierCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 preferredDomesticCarrierCode];
  if (v8)
  {
    id v9 = [v6 preferredDomesticCarrierCode];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  uint64_t v11 = [(_NBPhoneNumberUtil *)self formatNationalNumberWithCarrierCode:v6 carrierCode:v10];

  return v11;
}

- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(_NBPhoneNumberUtil *)self formatNumberForMobileDialing:v9 regionCallingFrom:v10 withFormatting:v6];

  return v11;
}

- (id)formatNumberForMobileDialing:(id)a3 regionCallingFrom:(id)a4 withFormatting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 countryCode];
  if ([(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v10])
  {
    uint64_t v11 = (void *)[v8 copy];
    [v11 setExtension:&stru_26C611188];
    uint64_t v12 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v10];
    if (![v9 isEqualToString:v12])
    {
      if ([(_NBPhoneNumberUtil *)self canBeInternationallyDialled:v11])
      {
        id v16 = [(_NBPhoneNumberUtil *)self format:v11 numberFormat:v5];
        id v15 = &stru_26C611188;
LABEL_28:

        goto LABEL_29;
      }
      id v15 = &stru_26C611188;
      if (v5) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
    unint64_t v13 = [(_NBPhoneNumberUtil *)self getNumberType:v11];
    if (![v12 isEqualToString:@"CO"] || v13)
    {
      if ([v12 isEqualToString:@"BR"] && v13 <= 2)
      {
        uint64_t v17 = [v11 preferredDomesticCarrierCode];
        if (+[_NBMetadataHelper hasValue:v17])
        {
          id v15 = [(_NBPhoneNumberUtil *)self formatNationalNumberWithPreferredCarrierCode:v11 fallbackCarrierCode:&stru_26C611188];
        }
        else
        {
          id v15 = &stru_26C611188;
        }

        if (v5) {
          goto LABEL_26;
        }
        goto LABEL_16;
      }
      if (([v10 unsignedIntegerValue] == 1
         || ([v12 isEqualToString:0x26C612D28] & 1) != 0
         || [v12 isEqualToString:@"MX"] && v13 <= 2)
        && [(_NBPhoneNumberUtil *)self canBeInternationallyDialled:v11])
      {
        uint64_t v19 = self;
        uint64_t v20 = v11;
        uint64_t v21 = 1;
      }
      else
      {
        uint64_t v19 = self;
        uint64_t v20 = v11;
        uint64_t v21 = 2;
      }
      uint64_t v14 = [(_NBPhoneNumberUtil *)v19 format:v20 numberFormat:v21];
    }
    else
    {
      uint64_t v14 = [(_NBPhoneNumberUtil *)self formatNationalNumberWithCarrierCode:v11 carrierCode:@"3"];
    }
    id v15 = (__CFString *)v14;
    if (v5)
    {
LABEL_26:
      uint64_t v18 = v15;
      id v15 = v18;
      goto LABEL_27;
    }
LABEL_16:
    uint64_t v18 = [(_NBPhoneNumberUtil *)self normalizeHelper:v15 normalizationReplacements:qword_26ACEFD60 removeNonMatches:1];
LABEL_27:
    id v16 = v18;
    goto LABEL_28;
  }
  id v15 = [v8 rawInput];
  if (+[_NBMetadataHelper hasValue:v15])
  {
    id v16 = [v8 rawInput];
  }
  else
  {
    id v16 = &stru_26C611188;
  }
LABEL_29:

  return v16;
}

- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NBPhoneNumberUtil *)self formatOutOfCountryCallingNumber:v7 regionCallingFrom:v8];

  return v9;
}

- (id)formatOutOfCountryCallingNumber:(id)a3 regionCallingFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_NBPhoneNumberUtil *)self isValidRegionCode:v7])
  {
    id v13 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:1];
    goto LABEL_22;
  }
  id v8 = [v6 countryCode];
  id v9 = (void *)[v8 copy];

  id v10 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
  if (![(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v9])
  {
    id v14 = v10;
    goto LABEL_8;
  }
  if ([v9 unsignedIntegerValue] != 1)
  {
    id v15 = [(_NBPhoneNumberUtil *)self getCountryCodeForValidRegion:v7 error:0];
    int v16 = [v9 isEqualToNumber:v15];

    if (!v16)
    {
LABEL_11:
      uint64_t v17 = [(_NBPhoneNumberUtil *)self helper];
      uint64_t v18 = [v17 getMetadataForRegion:v7];

      uint64_t v19 = [v18 internationalPrefix];
      v35 = v18;
      v33 = v19;
      if ([(_NBPhoneNumberUtil *)self matchesEntirely:@"[\\d]+(?:[~\\u2053\\u223C\\uFF5E][\\d]+)?" string:v19])
      {
        uint64_t v20 = v19;
      }
      else
      {
        uint64_t v21 = [v18 preferredInternationalPrefix];
        BOOL v22 = +[_NBMetadataHelper hasValue:v21];

        if (!v22)
        {
          long long v23 = &stru_26C611188;
          goto LABEL_17;
        }
        uint64_t v20 = [v18 preferredInternationalPrefix];
      }
      long long v23 = v20;
LABEL_17:
      v32 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v9];
      long long v24 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v9 regionCode:v32];
      id v25 = [(_NBPhoneNumberUtil *)self formatNsn:v10 metadata:v24 phoneNumberFormat:1 carrierCode:0];
      long long v26 = [(_NBPhoneNumberUtil *)self maybeGetFormattedExtension:v6 metadata:v24 numberFormat:1];
      v27 = [NSString stringWithFormat:@"%@ %@ %@%@", v23, v9, v25, v26];
      [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v9 phoneNumberFormat:1 formattedNationalNumber:v25 formattedExtension:v26];
      v34 = v10;
      v29 = uint64_t v28 = v23;
      if ([(__CFString *)v28 length]) {
        v30 = v27;
      }
      else {
        v30 = v29;
      }
      id v13 = v30;

      id v10 = v34;
      goto LABEL_21;
    }
    id v14 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:2];
LABEL_8:
    id v13 = v14;
    goto LABEL_21;
  }
  if (![(_NBPhoneNumberUtil *)self isNANPACountry:v7]) {
    goto LABEL_11;
  }
  uint64_t v11 = NSString;
  uint64_t v12 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:2];
  id v13 = [v11 stringWithFormat:@"%@ %@", v9, v12];

LABEL_21:
LABEL_22:

  return v13;
}

- (id)prefixNumberWithCountryCallingCode:(id)a3 phoneNumberFormat:(int64_t)a4 formattedNationalNumber:(id)a5 formattedExtension:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4 == 3)
  {
    [NSString stringWithFormat:@"%@+%@-%@%@", @"tel:", v9, v10, v11];
  }
  else if (a4 == 1)
  {
    [NSString stringWithFormat:@"+%@ %@%@", v9, v10, v11, v15];
  }
  else if (a4)
  {
    [NSString stringWithFormat:@"%@%@", v10, v11, v14, v15];
  }
  else
  {
    [NSString stringWithFormat:@"+%@%@%@", v9, v10, v11, v15];
  uint64_t v12 = };

  return v12;
}

- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NBPhoneNumberUtil *)self formatInOriginalFormat:v7 regionCallingFrom:v8];

  return v9;
}

- (id)formatInOriginalFormat:(id)a3 regionCallingFrom:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 rawInput];
  if (+[_NBMetadataHelper hasValue:v8])
  {
    BOOL v9 = [(_NBPhoneNumberUtil *)self hasFormattingPatternForNumber:v6];

    if (!v9)
    {
      uint64_t v10 = [v6 rawInput];
LABEL_11:
      id v15 = (id)v10;
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v11 = [v6 countryCodeSource];

  if (!v11)
  {
    uint64_t v10 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:2];
    goto LABEL_11;
  }
  uint64_t v12 = [v6 countryCodeSource];
  uint64_t v13 = [v12 integerValue];

  switch(v13)
  {
    case 10:
      int v16 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:1];
      id v15 = [v16 substringFromIndex:1];
      break;
    case 5:
      uint64_t v14 = [(_NBPhoneNumberUtil *)self formatOutOfCountryCallingNumber:v6 regionCallingFrom:v7];
      goto LABEL_14;
    case 1:
      uint64_t v14 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:1];
LABEL_14:
      id v15 = (id)v14;
      goto LABEL_21;
    default:
      uint64_t v17 = [v6 countryCode];
      int v16 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v17];

      uint64_t v18 = [(_NBPhoneNumberUtil *)self getNddPrefixForRegion:v16 stripNonDigits:1];
      uint64_t v19 = [(_NBPhoneNumberUtil *)self format:v6 numberFormat:2];
      if (v18
        && [v18 length]
        && ([v6 rawInput],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            BOOL v21 = [(_NBPhoneNumberUtil *)self rawInputContainsNationalPrefix:v20 nationalPrefix:v18 regionCode:v16], v20, !v21))
      {
        uint64_t v28 = [(_NBPhoneNumberUtil *)self helper];
        id v29 = [v28 getMetadataForRegion:v16];

        v30 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
        v31 = [v29 numberFormats];
        v32 = [(_NBPhoneNumberUtil *)self chooseFormattingPatternForNumber:v31 nationalNumber:v30];

        if (v32)
        {
          v38 = v29;
          v33 = [v32 nationalPrefixFormattingRule];
          uint64_t v34 = [v33 rangeOfString:@"$1"];
          if (v34
            && v34 != 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v33, "substringWithRange:", 0, v34),
                v35 = objc_claimAutoreleasedReturnValue(),
                v33,
                [(_NBPhoneNumberUtil *)self normalizeDigitsOnly:v35],
                v33 = objc_claimAutoreleasedReturnValue(),
                v35,
                [v33 length]))
          {
            v37 = (void *)[v32 copy];
            [v37 setNationalPrefixFormattingRule:0];
            v39[0] = v37;
            v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
            id v15 = [(_NBPhoneNumberUtil *)self formatByPattern:v6 numberFormat:2 userDefinedFormats:v36];
          }
          else
          {
            id v15 = v19;
          }

          id v29 = v38;
        }
        else
        {
          id v15 = v19;
        }
      }
      else
      {
        id v15 = v19;
      }

      break;
  }

LABEL_21:
  BOOL v22 = [v6 rawInput];
  long long v23 = v22;
  if (v15 && [v22 length])
  {
    long long v24 = [(_NBPhoneNumberUtil *)self normalizeHelper:v15 normalizationReplacements:qword_26ACEFD60 removeNonMatches:1];
    id v25 = [(_NBPhoneNumberUtil *)self normalizeHelper:v23 normalizationReplacements:qword_26ACEFD60 removeNonMatches:1];
    if (([v24 isEqualToString:v25] & 1) == 0)
    {
      id v26 = v23;

      id v15 = v26;
    }
  }
LABEL_27:

  return v15;
}

- (BOOL)rawInputContainsNationalPrefix:(id)a3 nationalPrefix:(id)a4 regionCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(_NBPhoneNumberUtil *)self normalizeDigitsOnly:a3];
  if (![(_NBPhoneNumberUtil *)self isStartingStringByRegex:v10 regex:v8]) {
    goto LABEL_3;
  }
  id v11 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v8, "length"));
  uint64_t v16 = 0;
  uint64_t v12 = [(_NBPhoneNumberUtil *)self parse:v11 defaultRegion:v9 error:&v16];
  uint64_t v13 = v16;
  BOOL v14 = [(_NBPhoneNumberUtil *)self isValidNumber:v12];

  if (v13) {
LABEL_3:
  }
    BOOL v14 = 0;

  return v14;
}

- (BOOL)hasUnexpectedItalianLeadingZero:(id)a3
{
  id v4 = a3;
  if ([v4 italianLeadingZero])
  {
    BOOL v5 = [v4 countryCode];
    BOOL v6 = ![(_NBPhoneNumberUtil *)self isLeadingZeroPossible:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasFormattingPatternForNumber:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 countryCode];
  BOOL v6 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v5];
  id v7 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v5 regionCode:v6];
  if (v7)
  {
    id v8 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v4];
    id v9 = [v7 numberFormats];
    uint64_t v10 = [(_NBPhoneNumberUtil *)self chooseFormattingPatternForNumber:v9 nationalNumber:v8];

    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_NBPhoneNumberUtil *)self formatOutOfCountryKeepingAlphaChars:v7 regionCallingFrom:v8];

  return v9;
}

- (id)formatOutOfCountryKeepingAlphaChars:(id)a3 regionCallingFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 rawInput];
  id v9 = v8;
  if (!v8 || ![v8 length])
  {
    id v18 = [(_NBPhoneNumberUtil *)self formatOutOfCountryCallingNumber:v6 regionCallingFrom:v7];
    goto LABEL_30;
  }
  uint64_t v10 = [v6 countryCode];
  if ([(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v10])
  {
    id v11 = [(_NBPhoneNumberUtil *)self normalizeHelper:v9 normalizationReplacements:qword_26ACEFD70 removeNonMatches:0];

    uint64_t v12 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
    if ((unint64_t)[v12 length] >= 4)
    {
      uint64_t v13 = objc_msgSend(v12, "substringWithRange:", 0, 3);
      int v14 = [(_NBPhoneNumberUtil *)self indexOfStringByString:v11 target:v13];

      if (v14 != -1)
      {
        uint64_t v15 = [v11 substringFromIndex:v14];

        id v11 = (id)v15;
      }
    }
    uint64_t v16 = [(_NBPhoneNumberUtil *)self helper];
    uint64_t v17 = [v16 getMetadataForRegion:v7];

    if ([v10 unsignedIntegerValue] == 1)
    {
      if ([(_NBPhoneNumberUtil *)self isNANPACountry:v7])
      {
        id v18 = [NSString stringWithFormat:@"%@ %@", v10, v11];
LABEL_28:

        goto LABEL_29;
      }
      if (v17) {
        goto LABEL_17;
      }
    }
    else if (v17)
    {
      uint64_t v19 = [(_NBPhoneNumberUtil *)self getCountryCodeForValidRegion:v7 error:0];
      int v20 = [v10 isEqualToNumber:v19];

      if (v20)
      {
        BOOL v21 = [v17 numberFormats];
        BOOL v22 = [(_NBPhoneNumberUtil *)self chooseFormattingPatternForNumber:v21 nationalNumber:v12];

        if (v22)
        {
          long long v23 = (void *)[v22 copy];
          [v23 setPattern:@"(\\d+)(.*)"];
          [v23 setFormat:@"$1$2"];
          id v18 = [(_NBPhoneNumberUtil *)self formatNsnUsingPattern:v11 formattingPattern:v23 numberFormat:2 carrierCode:0];
        }
        else
        {
          id v18 = v11;
        }

        goto LABEL_28;
      }
LABEL_17:
      long long v24 = [v17 internationalPrefix];
      v31 = v12;
      if ([(_NBPhoneNumberUtil *)self matchesEntirely:@"[\\d]+(?:[~\\u2053\\u223C\\uFF5E][\\d]+)?" string:v24])
      {
        id v25 = v24;
      }
      else
      {
        id v25 = [v17 preferredInternationalPrefix];
      }
      id v26 = v25;

      goto LABEL_22;
    }
    v31 = v12;
    id v26 = &stru_26C611188;
LABEL_22:
    v27 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v10];
    uint64_t v28 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v10 regionCode:v27];
    id v29 = [(_NBPhoneNumberUtil *)self maybeGetFormattedExtension:v6 metadata:v28 numberFormat:1];
    if ([(__CFString *)v26 length]) {
      [NSString stringWithFormat:@"%@ %@ %@%@", v26, v10, v11, v29];
    }
    else {
    id v18 = [(_NBPhoneNumberUtil *)self prefixNumberWithCountryCallingCode:v10 phoneNumberFormat:1 formattedNationalNumber:v11 formattedExtension:v29];
    }

    uint64_t v12 = v31;
    goto LABEL_28;
  }
  id v11 = v9;
  id v18 = v11;
LABEL_29:

  id v9 = v11;
LABEL_30:

  return v18;
}

- (id)formatNsn:(id)a3 metadata:(id)a4 phoneNumberFormat:(int64_t)a5 carrierCode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v11 intlNumberFormats];
  uint64_t v14 = [v13 count];
  if (a5 == 2 || !v14)
  {
    id v15 = [v11 numberFormats];
  }
  else
  {
    id v15 = v13;
  }
  uint64_t v16 = v15;
  uint64_t v17 = [(_NBPhoneNumberUtil *)self chooseFormattingPatternForNumber:v15 nationalNumber:v10];
  if (v17)
  {
    id v18 = [(_NBPhoneNumberUtil *)self formatNsnUsingPattern:v10 formattingPattern:v17 numberFormat:a5 carrierCode:v12];
  }
  else
  {
    id v18 = v10;
  }
  uint64_t v19 = v18;

  return v19;
}

- (id)chooseFormattingPatternForNumber:(id)a3 nationalNumber:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "leadingDigitsPatterns", (void)v23);
        uint64_t v15 = [v14 count];

        if (v15)
        {
          uint64_t v16 = [v13 leadingDigitsPatterns];
          uint64_t v17 = [v16 lastObject];
          int v18 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v7 regex:v17];

          if (v18) {
            continue;
          }
        }
        uint64_t v19 = [v13 pattern];
        BOOL v20 = [(_NBPhoneNumberUtil *)self matchesEntirely:v19 string:v7];

        if (v20)
        {
          id v21 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

- (id)formatNsnUsingPattern:(id)a3 formattingPattern:(id)a4 numberFormat:(int64_t)a5 carrierCode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v11 format];
  uint64_t v14 = [v11 domesticCarrierCodeFormattingRule];
  if (a5 == 2)
  {
    if (+[_NBMetadataHelper hasValue:v12]
      && [v14 length])
    {
      uint64_t v15 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v14 regex:@"\\$CC" withTemplate:v12];
      uint64_t v16 = [(_NBPhoneNumberUtil *)self replaceFirstStringByRegex:v13 regex:@"(\\$\\d)" withTemplate:v15];

      uint64_t v17 = [v11 pattern];
      int v18 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v10 regex:v17 withTemplate:v16];

      uint64_t v13 = (void *)v16;
      goto LABEL_10;
    }
    uint64_t v15 = [v11 nationalPrefixFormattingRule];
    if (+[_NBMetadataHelper hasValue:v15])
    {
      uint64_t v19 = [(_NBPhoneNumberUtil *)self replaceFirstStringByRegex:v13 regex:@"(\\$\\d)" withTemplate:v15];
      BOOL v20 = [v11 pattern];
      int v18 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v10 regex:v20 withTemplate:v19];

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = [v11 nationalPrefixFormattingRule];
  }
  id v21 = [v11 pattern];
  int v18 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v10 regex:v21 withTemplate:v13];

  if (a5 != 3) {
    goto LABEL_11;
  }
  BOOL v22 = [NSString stringWithFormat:@"^%@", qword_26ACEFD40];
  uint64_t v15 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v18 regex:v22 withTemplate:&stru_26C611188];

  int v18 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v15 regex:qword_26ACEFD40 withTemplate:@"-"];
LABEL_10:

LABEL_11:

  return v18;
}

- (id)getExampleNumber:(id)a3 error:(id *)a4
{
  return [(_NBPhoneNumberUtil *)self getExampleNumberForType:a3 type:0 error:a4];
}

- (id)getExampleNumberForType:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(_NBPhoneNumberUtil *)self isValidRegionCode:v8])
  {
    uint64_t v9 = [(_NBPhoneNumberUtil *)self helper];
    id v10 = [v9 getMetadataForRegion:v8];
    id v11 = [(_NBPhoneNumberUtil *)self getNumberDescByType:v10 type:a4];

    id v12 = [v11 exampleNumber];
    LODWORD(v9) = +[_NBMetadataHelper hasValue:v12];

    if (v9)
    {
      uint64_t v13 = [v11 exampleNumber];
      uint64_t v14 = [(_NBPhoneNumberUtil *)self parse:v13 defaultRegion:v8 error:a5];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)getExampleNumberForNonGeoEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self helper];
  id v8 = [v7 getMetadataForNonGeographicalRegion:v6];

  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v9 = [v8 mobile];
  id v10 = [v9 exampleNumber];
  BOOL v11 = +[_NBMetadataHelper hasValue:v10];

  if (v11)
  {
    id v12 = [v8 mobile];
  }
  else
  {
    uint64_t v13 = [v8 tollFree];
    uint64_t v14 = [v13 exampleNumber];
    BOOL v15 = +[_NBMetadataHelper hasValue:v14];

    if (v15)
    {
      id v12 = [v8 tollFree];
    }
    else
    {
      uint64_t v16 = [v8 sharedCost];
      uint64_t v17 = [v16 exampleNumber];
      BOOL v18 = +[_NBMetadataHelper hasValue:v17];

      if (v18)
      {
        id v12 = [v8 sharedCost];
      }
      else
      {
        uint64_t v19 = [v8 voip];
        BOOL v20 = [v19 exampleNumber];
        BOOL v21 = +[_NBMetadataHelper hasValue:v20];

        if (v21)
        {
          id v12 = [v8 voip];
        }
        else
        {
          BOOL v22 = [v8 voicemail];
          long long v23 = [v22 exampleNumber];
          BOOL v24 = +[_NBMetadataHelper hasValue:v23];

          if (v24)
          {
            id v12 = [v8 voicemail];
          }
          else
          {
            long long v25 = [v8 uan];
            long long v26 = [v25 exampleNumber];
            BOOL v27 = +[_NBMetadataHelper hasValue:v26];

            if (v27)
            {
              id v12 = [v8 uan];
            }
            else
            {
              uint64_t v28 = [v8 premiumRate];
              id v29 = [v28 exampleNumber];
              BOOL v30 = +[_NBMetadataHelper hasValue:v29];

              if (!v30) {
                goto LABEL_18;
              }
              id v12 = [v8 premiumRate];
            }
          }
        }
      }
    }
  }
  v31 = v12;
  v32 = [v12 exampleNumber];

  if (v32)
  {
    v33 = [NSString stringWithFormat:@"+%@%@", v6, v32];
    uint64_t v34 = [(_NBPhoneNumberUtil *)self parse:v33 defaultRegion:0x26C612CA8 error:a4];

    goto LABEL_19;
  }
LABEL_18:
  uint64_t v34 = 0;
LABEL_19:

  return v34;
}

- (id)maybeGetFormattedExtension:(id)a3 metadata:(id)a4 numberFormat:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 extension];
  BOOL v10 = +[_NBMetadataHelper hasValue:v9];

  if (!v10)
  {
    BOOL v15 = &stru_26C611188;
    goto LABEL_10;
  }
  if (a5 == 3)
  {
    BOOL v11 = NSString;
    uint64_t v12 = [v7 extension];
    uint64_t v13 = (void *)v12;
    uint64_t v14 = @";ext=";
LABEL_8:
    BOOL v15 = [v11 stringWithFormat:@"%@%@", v14, v12];
    goto LABEL_9;
  }
  uint64_t v16 = [v8 preferredExtnPrefix];
  BOOL v17 = +[_NBMetadataHelper hasValue:v16];

  BOOL v11 = NSString;
  if (!v17)
  {
    uint64_t v12 = [v7 extension];
    uint64_t v13 = (void *)v12;
    uint64_t v14 = @" ext. ";
    goto LABEL_8;
  }
  uint64_t v13 = [v8 preferredExtnPrefix];
  BOOL v18 = [v7 extension];
  BOOL v15 = [v11 stringWithFormat:@"%@%@", v13, v18];

LABEL_9:
LABEL_10:

  return v15;
}

- (id)getNumberDescByType:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 0:
    case 2:
      id v7 = [v5 fixedLine];

      if (!v7) {
        goto LABEL_6;
      }
      uint64_t v8 = [v6 fixedLine];
      break;
    case 1:
      uint64_t v9 = [v5 mobile];

      if (!v9) {
        goto LABEL_6;
      }
      uint64_t v8 = [v6 mobile];
      break;
    case 3:
      uint64_t v8 = [v5 tollFree];
      break;
    case 4:
      uint64_t v8 = [v5 premiumRate];
      break;
    case 5:
      uint64_t v8 = [v5 sharedCost];
      break;
    case 6:
      uint64_t v8 = [v5 voip];
      break;
    case 7:
      uint64_t v8 = [v5 personalNumber];
      break;
    case 8:
      uint64_t v8 = [v5 pager];
      break;
    case 9:
      uint64_t v8 = [v5 uan];
      break;
    case 10:
      uint64_t v8 = [v5 voicemail];
      break;
    default:
LABEL_6:
      uint64_t v8 = [v6 generalDesc];
      break;
  }
  BOOL v10 = (void *)v8;

  return v10;
}

- (int64_t)getNumberType:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self getRegionCodeForNumber:v4];
  id v6 = [v4 countryCode];
  id v7 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v6 regionCode:v5];

  if (v7)
  {
    uint64_t v8 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v4];
    int64_t v9 = [(_NBPhoneNumberUtil *)self getNumberTypeHelper:v8 metadata:v7];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (int64_t)getNumberTypeHelper:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 generalDesc];
  if (![(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v8]) {
    goto LABEL_22;
  }
  int64_t v9 = [v7 premiumRate];
  BOOL v10 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v9];

  if (v10)
  {
    int64_t v11 = 4;
    goto LABEL_23;
  }
  uint64_t v12 = [v7 tollFree];
  BOOL v13 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v12];

  if (v13)
  {
    int64_t v11 = 3;
    goto LABEL_23;
  }
  uint64_t v14 = [v7 sharedCost];
  BOOL v15 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v14];

  if (v15)
  {
    int64_t v11 = 5;
    goto LABEL_23;
  }
  uint64_t v16 = [v7 voip];
  BOOL v17 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v16];

  if (v17)
  {
    int64_t v11 = 6;
    goto LABEL_23;
  }
  BOOL v18 = [v7 personalNumber];
  BOOL v19 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v18];

  if (v19)
  {
    int64_t v11 = 7;
    goto LABEL_23;
  }
  BOOL v20 = [v7 pager];
  BOOL v21 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v20];

  if (v21)
  {
    int64_t v11 = 8;
    goto LABEL_23;
  }
  BOOL v22 = [v7 uan];
  BOOL v23 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v22];

  if (v23)
  {
    int64_t v11 = 9;
    goto LABEL_23;
  }
  BOOL v24 = [v7 voicemail];
  BOOL v25 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v24];

  if (v25)
  {
    int64_t v11 = 10;
    goto LABEL_23;
  }
  long long v26 = [v7 fixedLine];
  BOOL v27 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v26];

  char v28 = [v7 sameMobileAndFixedLinePattern];
  if (v27)
  {
    if (v28)
    {
      int64_t v11 = 2;
    }
    else
    {
      BOOL v30 = [v7 mobile];
      BOOL v31 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v30];

      if (v31) {
        int64_t v11 = 2;
      }
      else {
        int64_t v11 = 0;
      }
    }
    goto LABEL_23;
  }
  if (v28)
  {
LABEL_22:
    int64_t v11 = -1;
    goto LABEL_23;
  }
  v32 = [v7 mobile];
  BOOL v33 = [(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v6 numberDesc:v32];

  if (v33) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = -1;
  }
LABEL_23:

  return v11;
}

- (BOOL)isNumberMatchingDesc:(id)a3 numberDesc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  int64_t v9 = [v7 possibleLength];
  if (![v9 count])
  {

    goto LABEL_5;
  }
  BOOL v10 = [v7 possibleLength];
  uint64_t v11 = [v10 indexOfObject:v8];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    BOOL v13 = [v7 nationalNumberPattern];
    BOOL v12 = [(_NBPhoneNumberUtil *)self matchesEntirely:v13 string:v6];

    goto LABEL_6;
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)isValidNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self getRegionCodeForNumber:v4];
  LOBYTE(self) = [(_NBPhoneNumberUtil *)self isValidNumberForRegion:v4 regionCode:v5];

  return (char)self;
}

- (BOOL)isValidNumberForRegion:(id)a3 regionCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 countryCode];
  int64_t v9 = (void *)[v8 copy];

  BOOL v10 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v9 regionCode:v7];
  if (v10
    && (([@"001" isEqualToString:v7] & 1) != 0
     || ([(_NBPhoneNumberUtil *)self getCountryCodeForValidRegion:v7 error:0],
         uint64_t v11 = objc_claimAutoreleasedReturnValue(),
         int v12 = [v9 isEqualToNumber:v11],
         v11,
         v12)))
  {
    BOOL v13 = [v10 generalDesc];
    uint64_t v14 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v6];
    BOOL v15 = [v13 nationalNumberPattern];
    BOOL v16 = +[_NBMetadataHelper hasValue:v15];

    if (v16) {
      BOOL v17 = [(_NBPhoneNumberUtil *)self getNumberTypeHelper:v14 metadata:v10] != -1;
    }
    else {
      BOOL v17 = (unint64_t)([v14 length] - 3) < 0xE;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)getRegionCodeForNumber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 countryCode];
    id v7 = +[_NBMetadataHelper regionCodeFromCountryCode:v6];

    if (v7 && [v7 count])
    {
      if ([v7 count] == 1) {
        [v7 objectAtIndex:0];
      }
      else {
      uint64_t v8 = [(_NBPhoneNumberUtil *)self getRegionCodeForNumberFromRegionList:v5 regionCodes:v7];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getRegionCodeForNumberFromRegionList:(id)a3 regionCodes:(id)a4
{
  id v6 = a4;
  id v7 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:a3];
  uint64_t v8 = [v6 count];
  int64_t v9 = [(_NBPhoneNumberUtil *)self helper];
  if (!v8)
  {
LABEL_8:
    id v17 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = [v6 objectAtIndex:v10];
    int v12 = [v9 getMetadataForRegion:v11];
    BOOL v13 = [v12 leadingDigits];
    BOOL v14 = +[_NBMetadataHelper hasValue:v13];

    if (!v14) {
      break;
    }
    BOOL v15 = [v12 leadingDigits];
    int v16 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v7 regex:v15];

    if (!v16) {
      goto LABEL_9;
    }
LABEL_7:

    if (v8 == ++v10) {
      goto LABEL_8;
    }
  }
  if ([(_NBPhoneNumberUtil *)self getNumberTypeHelper:v7 metadata:v12] == -1) {
    goto LABEL_7;
  }
LABEL_9:
  id v17 = v11;

LABEL_10:

  return v17;
}

- (id)getRegionCodeForCountryCode:(id)a3
{
  id v3 = +[_NBMetadataHelper regionCodeFromCountryCode:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectAtIndex:0];
  }
  else
  {
    id v5 = @"ZZ";
  }
  id v6 = v5;

  return v6;
}

- (id)getRegionCodesForCountryCode:(id)a3
{
  return +[_NBMetadataHelper regionCodeFromCountryCode:a3];
}

- (id)getCountryCodeForRegion:(id)a3
{
  id v4 = a3;
  if ([(_NBPhoneNumberUtil *)self isValidRegionCode:v4])
  {
    uint64_t v9 = 0;
    id v5 = [(_NBPhoneNumberUtil *)self getCountryCodeForValidRegion:v4 error:&v9];
    id v6 = v5;
    if (v9) {
      id v7 = &unk_26C628DE0;
    }
    else {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = &unk_26C628DE0;
  }

  return v7;
}

- (id)getCountryCodeForValidRegion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self helper];
  uint64_t v8 = [v7 getMetadataForRegion:v6];

  if (v8)
  {
    uint64_t v9 = [v8 countryCode];
  }
  else
  {
    uint64_t v10 = NSDictionary;
    uint64_t v11 = [NSString stringWithFormat:@"Invalid region code:%@", v6];
    int v12 = [v10 dictionaryWithObject:v11 forKey:*MEMORY[0x263F08320]];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"INVALID_REGION_CODE" code:0 userInfo:v12];
    }

    uint64_t v9 = &unk_26C628DF8;
  }

  return v9;
}

- (id)getNddPrefixForRegion:(id)a3 stripNonDigits:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_NBPhoneNumberUtil *)self helper];
  uint64_t v8 = [v7 getMetadataForRegion:v6];

  if (v8)
  {
    uint64_t v9 = [v8 nationalPrefix];
    if ([v9 length])
    {
      if (v4)
      {
        uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"~" withString:&stru_26C611188];

        uint64_t v9 = (void *)v10;
      }
      id v11 = v9;
      uint64_t v9 = v11;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isNANPACountry:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [NSNumber numberWithUnsignedInteger:1];
  id v5 = +[_NBMetadataHelper regionCodeFromCountryCode:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v13 = objc_msgSend(v3, "uppercaseString", (void)v15);
        LOBYTE(v12) = [v12 isEqualToString:v13];

        v9 |= v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return (v3 != 0) & v9;
}

- (BOOL)isLeadingZeroPossible:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v4];
  id v6 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v4 regionCode:v5];

  if (v6) {
    char v7 = [v6 leadingZeroPossible];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAlphaNumber:(id)a3
{
  id v4 = a3;
  if ([(_NBPhoneNumberUtil *)self isViablePhoneNumber:v4])
  {
    id v5 = [v4 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];

    id v6 = (void *)[v5 copy];
    id v11 = v6;
    id v7 = [(_NBPhoneNumberUtil *)self maybeStripExtension:&v11];
    id v8 = v11;

    BOOL v9 = [(_NBPhoneNumberUtil *)self matchesEntirely:@"(?:.*?[A-Za-z]){3}.*" string:v8];
    id v4 = v5;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isPossibleNumber:(id)a3 error:(id *)a4
{
  id v5 = a3;
  LOBYTE(self) = [(_NBPhoneNumberUtil *)self isPossibleNumber:v5];

  return (char)self;
}

- (BOOL)isPossibleNumber:(id)a3
{
  return [(_NBPhoneNumberUtil *)self isPossibleNumberWithReason:a3] == 1;
}

- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4
{
  return [(_NBPhoneNumberUtil *)self validateNumberLength:a3 metadata:a4 type:-1];
}

- (int64_t)validateNumberLength:(id)a3 metadata:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(_NBPhoneNumberUtil *)self getNumberDescByType:v9 type:a5];
  id v11 = [v10 possibleLength];
  if ([v11 count])
  {
    int v12 = [v10 possibleLength];
  }
  else
  {
    BOOL v13 = [v9 generalDesc];
    int v12 = [v13 possibleLength];
  }
  BOOL v14 = [v10 possibleLengthLocalOnly];
  if (a5 == 2)
  {
    long long v15 = [(_NBPhoneNumberUtil *)self getNumberDescByType:v9 type:0];
    BOOL v16 = [(_NBPhoneNumberUtil *)self descHasPossibleNumberData:v15];

    if (v16)
    {
      int64_t v17 = [(_NBPhoneNumberUtil *)self validateNumberLength:v8 metadata:v9 type:1];
      goto LABEL_30;
    }
    long long v18 = [(_NBPhoneNumberUtil *)self getNumberDescByType:v9 type:1];
    if ([(_NBPhoneNumberUtil *)self descHasPossibleNumberData:v18])
    {
      BOOL v19 = [v18 possibleLength];
      if ([v19 count])
      {
        uint64_t v20 = [v18 possibleLength];
        BOOL v21 = [v12 arrayByAddingObjectsFromArray:v20];
      }
      else
      {
        uint64_t v20 = [v9 generalDesc];
        BOOL v22 = [v20 possibleLength];
        BOOL v21 = [v12 arrayByAddingObjectsFromArray:v22];
      }
      uint64_t v23 = [v21 sortedArrayUsingSelector:sel_compare_];

      uint64_t v24 = [v14 count];
      BOOL v25 = [v18 possibleLengthLocalOnly];
      if (v24)
      {
        long long v26 = [v14 arrayByAddingObjectsFromArray:v25];

        BOOL v25 = [v26 sortedArrayUsingSelector:sel_compare_];

        BOOL v14 = v26;
      }

      BOOL v14 = v25;
      int v12 = (void *)v23;
    }
  }
  BOOL v27 = [v12 firstObject];
  char v28 = [v27 isEqualToNumber:&unk_26C628DF8];

  if (v28)
  {
    int64_t v17 = -1;
  }
  else
  {
    id v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    if ([v14 containsObject:v29])
    {
      int64_t v17 = 5;
    }
    else
    {
      BOOL v30 = [v12 firstObject];
      uint64_t v31 = [v30 compare:v29];
      if (v31)
      {
        if (v31 == 1)
        {
          int64_t v17 = 3;
        }
        else
        {
          v32 = [v12 lastObject];
          uint64_t v33 = [v32 compare:v29];

          if (v33 == -1)
          {
            int64_t v17 = 4;
          }
          else
          {
            int64_t v17 = 1;
            uint64_t v34 = objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
            if (![v34 containsObject:v29]) {
              int64_t v17 = -1;
            }
          }
        }
      }
      else
      {
        int64_t v17 = 1;
      }
    }
  }
LABEL_30:

  return v17;
}

- (int64_t)testNumberLength:(id)a3 desc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 possibleLength];
  id v8 = [v5 possibleLengthLocalOnly];

  unint64_t v9 = [v6 length];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
  LOBYTE(v6) = [v8 containsObject:v10];

  if (v6)
  {
    int64_t v11 = 1;
  }
  else
  {
    int v12 = [v7 objectAtIndexedSubscript:0];
    if ([v12 unsignedIntegerValue] == v9)
    {
      int64_t v11 = 1;
    }
    else if ([v12 unsignedIntegerValue] <= v9)
    {
      unint64_t v13 = [v7 count] - 1;
      if (v13 >= [v7 count]
        || (objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1),
            BOOL v14 = objc_claimAutoreleasedReturnValue(),
            unint64_t v15 = [v14 integerValue],
            v14,
            v15 >= v9))
      {
        BOOL v16 = [NSNumber numberWithUnsignedInteger:v9];
        if ([v7 containsObject:v16]) {
          int64_t v11 = 1;
        }
        else {
          int64_t v11 = 4;
        }
      }
      else
      {
        int64_t v11 = 4;
      }
    }
    else
    {
      int64_t v11 = 3;
    }
  }
  return v11;
}

- (int64_t)isPossibleNumberWithReason:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(_NBPhoneNumberUtil *)self isPossibleNumberWithReason:v5];

  return v6;
}

- (int64_t)isPossibleNumberWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v4];
  int64_t v6 = [v4 countryCode];

  if ([(_NBPhoneNumberUtil *)self hasValidCountryCallingCode:v6])
  {
    id v7 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v6];
    id v8 = [(_NBPhoneNumberUtil *)self getMetadataForRegionOrCallingCode:v6 regionCode:v7];
    unint64_t v9 = [v8 generalDesc];
    int64_t v10 = [(_NBPhoneNumberUtil *)self testNumberLength:v5 desc:v9];
  }
  else
  {
    int64_t v10 = 2;
  }

  return v10;
}

- (BOOL)isPossibleNumberString:(id)a3 regionDialingFrom:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unint64_t v9 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  int64_t v10 = [(_NBPhoneNumberUtil *)self parse:v9 defaultRegion:v8 error:a5];

  LOBYTE(self) = [(_NBPhoneNumberUtil *)self isPossibleNumber:v10];
  return (char)self;
}

- (BOOL)truncateTooLongNumber:(id)a3
{
  id v4 = a3;
  if ([(_NBPhoneNumberUtil *)self isValidNumber:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    int64_t v6 = (void *)[v4 copy];
    id v7 = [v4 nationalNumber];
    while (1)
    {
      id v8 = v7;
      id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", (uint64_t)(double)(objc_msgSend(v7, "unsignedLongLongValue") / 0xAuLL));

      unint64_t v9 = (void *)[v7 copy];
      [v6 setNationalNumber:v9];

      if (([v7 isEqualToNumber:&unk_26C628DE0] & 1) != 0
        || [(_NBPhoneNumberUtil *)self isPossibleNumberWithReason:v6] == 3)
      {
        break;
      }
      if ([(_NBPhoneNumberUtil *)self isValidNumber:v6])
      {
        [v4 setNationalNumber:v7];
        BOOL v5 = 1;
        goto LABEL_9;
      }
    }
    BOOL v5 = 0;
LABEL_9:
  }
  return v5;
}

- (id)extractCountryCode:(id)a3 nationalNumber:(id *)a4
{
  BOOL v5 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  if (![v5 length]) {
    goto LABEL_13;
  }
  int64_t v6 = [v5 substringToIndex:1];
  char v7 = [v6 isEqualToString:@"0"];

  if (v7) {
    goto LABEL_13;
  }
  unint64_t v8 = [v5 length];
  int v9 = [v5 hasPrefix:@"+"];
  unint64_t v10 = 3;
  if (v9) {
    unint64_t v10 = 4;
  }
  unint64_t v11 = v10 >= v8 ? v8 : v10;
  if (v11)
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = v12 + 1;
      BOOL v14 = objc_msgSend(v5, "substringWithRange:", 0, v12 + 1);
      unint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      BOOL v16 = +[_NBMetadataHelper regionCodeFromCountryCode:v15];
      int64_t v17 = v16;
      if (v16)
      {
        if ([v16 count]) {
          break;
        }
      }

      ++v12;
      if (v11 == v13) {
        goto LABEL_13;
      }
    }
    if (a4)
    {
      id v19 = *a4;
      uint64_t v20 = NSString;
      uint64_t v21 = [v5 substringFromIndex:v12 + 1];
      BOOL v22 = (void *)v21;
      if (v19) {
        [v20 stringWithFormat:@"%@%@", v19, v21];
      }
      else {
      *a4 = [v20 stringWithFormat:@"%@", v21, v23];
      }
    }
  }
  else
  {
LABEL_13:
    unint64_t v15 = &unk_26C628DE0;
  }

  return v15;
}

- (id)getSupportedRegions
{
  v2 = +[_NBMetadataHelper CCode2CNMap];
  id v3 = [v2 allKeys];

  id v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_569];
  BOOL v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)maybeExtractCountryCode:(id)a3 metadata:(id)a4 nationalNumber:(id *)a5 keepRawInput:(BOOL)a6 phoneNumber:(id *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = &unk_26C628DE0;
  if (a5 && a7 && [v14 length])
  {
    int64_t v17 = (void *)[v14 copy];
    if (v15)
    {
      uint64_t v18 = [v15 internationalPrefix];
      if (v18) {
        id v19 = (__CFString *)v18;
      }
      else {
        id v19 = @"NonMatch";
      }
    }
    else
    {
      id v19 = &stru_26C611188;
    }
    id v47 = v17;
    v45 = v19;
    int64_t v20 = -[_NBPhoneNumberUtil maybeStripInternationalPrefixAndNormalize:possibleIddPrefix:](self, "maybeStripInternationalPrefixAndNormalize:possibleIddPrefix:", &v47);
    id v21 = v47;

    if (v10)
    {
      BOOL v22 = [NSNumber numberWithInteger:v20];
      [*a7 setCountryCodeSource:v22];
    }
    if (v20 != 20)
    {
      if ((unint64_t)[v21 length] > 2)
      {
        v35 = [(_NBPhoneNumberUtil *)self extractCountryCode:v21 nationalNumber:a5];
        if ([v35 isEqualToNumber:&unk_26C628DE0])
        {
          v36 = NSDictionary;
          v37 = [NSString stringWithFormat:@"INVALID_COUNTRY_CODE:%@", v35];
          v38 = [v36 dictionaryWithObject:v37 forKey:*MEMORY[0x263F08320]];

          if (a8)
          {
            *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"INVALID_COUNTRY_CODE" code:0 userInfo:v38];
          }

          id v16 = &unk_26C628DE0;
        }
        else
        {
          [*a7 setCountryCode:v35];
          id v16 = v35;
        }
      }
      else
      {
        v32 = NSDictionary;
        uint64_t v33 = [NSString stringWithFormat:@"TOO_SHORT_AFTER_IDD:%@", v21];
        uint64_t v34 = [v32 dictionaryWithObject:v33 forKey:*MEMORY[0x263F08320]];

        if (a8)
        {
          *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"TOO_SHORT_AFTER_IDD" code:0 userInfo:v34];
        }

        id v16 = &unk_26C628DE0;
      }
      goto LABEL_33;
    }
    if (v15)
    {
      id v16 = [v15 countryCode];
      uint64_t v23 = [NSString stringWithFormat:@"%@", v16];
      uint64_t v24 = (void *)[v21 copy];
      if ([v24 hasPrefix:v23])
      {
        v42 = v23;
        v41 = v24;
        BOOL v25 = objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v23, "length"));
        v43 = [v15 generalDesc];
        v44 = [v43 nationalNumberPattern];
        id v46 = v25;
        [(_NBPhoneNumberUtil *)self maybeStripNationalPrefixAndCarrierCode:&v46 metadata:v15 carrierCode:0];
        id v26 = v21;
        id v27 = v46;

        v40 = v27;
        char v28 = v27;
        id v21 = v26;
        id v29 = (void *)[v28 copy];
        if (![(_NBPhoneNumberUtil *)self matchesEntirely:v44 string:v21]
          && [(_NBPhoneNumberUtil *)self matchesEntirely:v44 string:v29]
          || [(_NBPhoneNumberUtil *)self testNumberLength:v21 desc:v43] == 4)
        {
          *a5 = [*a5 stringByAppendingString:v29];
          if (v10)
          {
            [NSNumber numberWithInteger:10];
            v31 = BOOL v30 = v29;
            [*a7 setCountryCodeSource:v31];

            id v29 = v30;
          }
          [*a7 setCountryCode:v16];

          goto LABEL_33;
        }

        uint64_t v24 = v41;
        uint64_t v23 = v42;
      }
    }
    id v16 = &unk_26C628DE0;
    [*a7 setCountryCode:&unk_26C628DE0];
LABEL_33:
  }

  return v16;
}

- (BOOL)descHasPossibleNumberData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 possibleLength];
  if ([v4 count] == 1)
  {
    BOOL v5 = [v3 possibleLength];
    int64_t v6 = [v5 firstObject];
    int v7 = [v6 isEqualToNumber:&unk_26C628DF8] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)parsePrefixAsIdd:(id)a3 sourceString:(id *)a4
{
  id v6 = a3;
  if (a4)
  {
    int v7 = (void *)[*a4 copy];
    if ([(_NBPhoneNumberUtil *)self stringPositionByRegex:v7 regex:v6])
    {
      LOBYTE(a4) = 0;
LABEL_13:

      goto LABEL_14;
    }
    unint64_t v8 = [(_NBPhoneNumberUtil *)self matchesByRegex:v7 regex:v6];
    int v9 = [v8 objectAtIndex:0];

    uint64_t v10 = [v9 range];
    uint64_t v12 = objc_msgSend(v7, "substringWithRange:", v10, v11);
    uint64_t v13 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v12, "length"));
    id v14 = -[NSRegularExpression matchesInString:options:range:](self->_CAPTURING_DIGIT_PATTERN, "matchesInString:options:range:", v13, 0, 0, [v13 length]);
    id v15 = v14;
    if (v14)
    {
      if ([v14 count])
      {
        id v16 = [v15 objectAtIndex:0];

        if (v16)
        {
          int64_t v17 = [v15 objectAtIndex:0];
          uint64_t v18 = [v17 range];
          int64_t v20 = objc_msgSend(v13, "substringWithRange:", v18, v19);

          if ([v20 length])
          {
            id v21 = [(_NBPhoneNumberUtil *)self normalizeDigitsOnly:v20];
            char v22 = [v21 isEqualToString:@"0"];

            if (v22)
            {

              LOBYTE(a4) = 0;
LABEL_12:

              goto LABEL_13;
            }
          }
        }
      }
    }
    *a4 = (id)[v13 copy];
    LOBYTE(a4) = 1;
    goto LABEL_12;
  }
LABEL_14:

  return (char)a4;
}

- (int64_t)maybeStripInternationalPrefixAndNormalize:(id *)a3 possibleIddPrefix:(id)a4
{
  id v6 = a4;
  if (a3 && [*a3 length])
  {
    if ([(_NBPhoneNumberUtil *)self isStartingStringByRegex:*a3 regex:qword_26ACEFD18])
    {
      id v7 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:*a3 regex:qword_26ACEFD18 withTemplate:&stru_26C611188];
      *a3 = v7;
      *a3 = [(_NBPhoneNumberUtil *)self normalize:v7];
      int64_t v8 = 1;
    }
    else
    {
      int v9 = (void *)[v6 copy];
      [(_NBPhoneNumberUtil *)self normalizeSB:a3];
      if ([(_NBPhoneNumberUtil *)self parsePrefixAsIdd:v9 sourceString:a3]) {
        int64_t v8 = 5;
      }
      else {
        int64_t v8 = 20;
      }
    }
  }
  else
  {
    int64_t v8 = 20;
  }

  return v8;
}

- (BOOL)maybeStripNationalPrefixAndCarrierCode:(id *)a3 metadata:(id)a4 carrierCode:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    int v9 = (void *)[*a3 copy];
    uint64_t v10 = [v9 length];
    uint64_t v11 = [v8 nationalPrefixForParsing];
    if (!v10 || !+[_NBMetadataHelper hasValue:v11])
    {
      LOBYTE(a3) = 0;
LABEL_42:

      goto LABEL_43;
    }
    uint64_t v12 = [NSString stringWithFormat:@"^(?:%@)", v11];
    id v46 = 0;
    uint64_t v13 = [(_NBPhoneNumberUtil *)self regularExpressionWithPattern:v12 options:0 error:&v46];
    id v45 = v46;
    id v14 = objc_msgSend(v13, "matchesInString:options:range:", v9, 0, 0, v10);
    id v15 = v14;
    if (!v14 || ![v14 count])
    {
      LOBYTE(a3) = 0;
      id v26 = v45;
LABEL_41:

      goto LABEL_42;
    }
    v38 = v13;
    v39 = v12;
    id v16 = [v8 generalDesc];
    v42 = [v16 nationalNumberPattern];

    int64_t v17 = [v15 objectAtIndex:0];
    uint64_t v18 = [v17 range];
    v43 = objc_msgSend(v9, "substringWithRange:", v18, v19);
    uint64_t v20 = [v17 numberOfRanges] - 1;
    id v21 = [v8 nationalPrefixTransformRule];
    unint64_t v36 = v20;
    v37 = v17;
    unint64_t v22 = [v17 rangeAtIndex:v20];
    v44 = 0;
    v41 = v21;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v24 = v22;
      uint64_t v25 = v23;
      if (v22 >= [v9 length])
      {
        v44 = 0;
      }
      else
      {
        v44 = objc_msgSend(v9, "substringWithRange:", v24, v25);
      }
    }
    if (v21
      && [v21 length]
      && +[_NBMetadataHelper hasValue:v44])
    {
      uint64_t v12 = v39;
      id v40 = [(_NBPhoneNumberUtil *)self replaceFirstStringByRegex:v9 regex:v39 withTemplate:v21];
      int v27 = 0;
    }
    else
    {
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v43, "length"));
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      int v27 = 1;
      uint64_t v12 = v39;
    }
    if (+[_NBMetadataHelper hasValue:v42]
      && [(_NBPhoneNumberUtil *)self matchesEntirely:v42 string:v9]
      && ![(_NBPhoneNumberUtil *)self matchesEntirely:v42 string:v40])
    {
      LOBYTE(a3) = 0;
      id v29 = v37;
      uint64_t v13 = v38;
      id v26 = v45;
      uint64_t v34 = v40;
      goto LABEL_40;
    }
    if (v36) {
      int v28 = v27;
    }
    else {
      int v28 = 0;
    }
    if (v28 == 1)
    {
      if (!+[_NBMetadataHelper hasValue:v44])
      {
        BOOL v33 = +[_NBMetadataHelper hasValue:v43];
        id v29 = v37;
        uint64_t v13 = v38;
        id v26 = v45;
        if (!a5) {
          goto LABEL_39;
        }
        if (!v33) {
          goto LABEL_39;
        }
        id v31 = *a5;
        if (!*a5) {
          goto LABEL_39;
        }
        v32 = v43;
        goto LABEL_38;
      }
      id v29 = v37;
      uint64_t v13 = v38;
      id v26 = v45;
      if (!a5) {
        goto LABEL_39;
      }
    }
    else
    {
      if (v36 < 2) {
        char v30 = 1;
      }
      else {
        char v30 = v27;
      }
      id v29 = v37;
      uint64_t v13 = v38;
      id v26 = v45;
      if (!a5 || (v30 & 1) != 0) {
        goto LABEL_39;
      }
    }
    id v31 = *a5;
    if (!*a5)
    {
LABEL_39:
      uint64_t v34 = v40;
      *a3 = v40;
      LOBYTE(a3) = 1;
LABEL_40:

      goto LABEL_41;
    }
    v32 = v44;
LABEL_38:
    *a5 = [v31 stringByAppendingString:v32];
    goto LABEL_39;
  }
LABEL_43:

  return (char)a3;
}

- (id)maybeStripExtension:(id *)a3
{
  if (a3)
  {
    BOOL v5 = (void *)[*a3 copy];
    unsigned int v6 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v5 regex:qword_26ACEFD38];
    if ((v6 & 0x80000000) != 0
      || (uint64_t v7 = v6,
          objc_msgSend(v5, "substringWithRange:", 0, v6),
          id v8 = objc_claimAutoreleasedReturnValue(),
          BOOL v9 = [(_NBPhoneNumberUtil *)self isViablePhoneNumber:v8],
          v8,
          !v9))
    {
      uint64_t v18 = &stru_26C611188;
    }
    else
    {
      uint64_t v10 = [(_NBPhoneNumberUtil *)self matchFirstByRegex:v5 regex:qword_26ACEFD38];
      unint64_t v11 = [v10 numberOfRanges];
      if (v11 < 2)
      {
        uint64_t v18 = &stru_26C611188;
      }
      else
      {
        unint64_t v12 = v11;
        uint64_t v13 = 1;
        while (1)
        {
          unint64_t v14 = [v10 rangeAtIndex:v13];
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v16 = v14;
            uint64_t v17 = v15;
            if (v14 < [v5 length]) {
              break;
            }
          }
          if (v12 == ++v13)
          {
            uint64_t v18 = &stru_26C611188;
            goto LABEL_14;
          }
        }
        objc_msgSend(*a3, "substringWithRange:", v16, v17);
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = objc_msgSend(v5, "substringWithRange:", 0, v7);
        *a3 = &stru_26C611188;
        *a3 = [&stru_26C611188 stringByAppendingString:v19];
      }
LABEL_14:
    }
  }
  else
  {
    uint64_t v18 = &stru_26C611188;
  }

  return v18;
}

- (BOOL)checkRegionForParsing:(id)a3 defaultRegion:(id)a4
{
  id v6 = a3;
  if ([(_NBPhoneNumberUtil *)self isValidRegionCode:a4]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6
  }
      && [v6 length]
      && [(_NBPhoneNumberUtil *)self isStartingStringByRegex:v6 regex:qword_26ACEFD18];

  return v7;
}

- (id)parse:(id)a3 defaultRegion:(id)a4 error:(id *)a5
{
  id v13 = 0;
  BOOL v7 = [(_NBPhoneNumberUtil *)self parseHelper:a3 defaultRegion:a4 keepRawInput:0 checkRegion:1 error:&v13];
  id v8 = v13;
  BOOL v9 = v8;
  if (a5 && v8)
  {
    uint64_t v10 = [v8 description];
    unint64_t v11 = [v9 domain];
    *a5 = [(_NBPhoneNumberUtil *)self errorWithObject:v10 withDomain:v11];
  }

  return v7;
}

- (id)parseWithPhoneCarrierRegion:(id)a3 error:(id *)a4
{
  id v6 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  BOOL v7 = [(_NBPhoneNumberUtil *)self countryCodeByCarrier];
  if ([@"ZZ" isEqualToString:v7])
  {
    id v8 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v9 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];

    BOOL v7 = (void *)v9;
  }
  uint64_t v10 = [(_NBPhoneNumberUtil *)self parse:v6 defaultRegion:v7 error:a4];

  return v10;
}

- (CTTelephonyNetworkInfo)telephonyNetworkInfo
{
  if (qword_26ACEFD80 != -1) {
    dispatch_once(&qword_26ACEFD80, &__block_literal_global_590);
  }
  v2 = (void *)qword_26ACEFD88;

  return (CTTelephonyNetworkInfo *)v2;
}

- (id)countryCodeByCarrier
{
  v2 = [(_NBPhoneNumberUtil *)self telephonyNetworkInfo];
  id v3 = [v2 subscriberCellularProvider];
  id v4 = [v3 isoCountryCode];

  if (![v4 length])
  {
    BOOL v5 = @"ZZ";

    id v4 = v5;
  }

  return v4;
}

- (id)parseAndKeepRawInput:(id)a3 defaultRegion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(_NBPhoneNumberUtil *)self isValidRegionCode:v9]
    && [v8 length]
    && ([v8 hasPrefix:@"+"] & 1) == 0)
  {
    uint64_t v10 = NSDictionary;
    unint64_t v11 = [NSString stringWithFormat:@"Invalid country code:%@", v8];
    unint64_t v12 = [v10 dictionaryWithObject:v11 forKey:*MEMORY[0x263F08320]];

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"INVALID_COUNTRY_CODE" code:0 userInfo:v12];
    }
  }
  id v13 = [(_NBPhoneNumberUtil *)self parseHelper:v8 defaultRegion:v9 keepRawInput:1 checkRegion:1 error:a5];

  return v13;
}

- (void)setItalianLeadingZerosForPhoneNumber:(id)a3 phoneNumber:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ((unint64_t)[v10 length] >= 2)
  {
    if ([v10 hasPrefix:@"0"])
    {
      [v5 setItalianLeadingZero:1];
      if ((unint64_t)([v10 length] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v6 = 1;
        while (1)
        {
          BOOL v7 = objc_msgSend(v10, "substringWithRange:", v6, 1);
          int v8 = [v7 isEqualToString:@"0"];

          if (!v8) {
            break;
          }
          if (++v6 >= (unint64_t)([v10 length] - 1)) {
            goto LABEL_9;
          }
        }
        if (v6 == 1) {
          goto LABEL_10;
        }
LABEL_9:
        id v9 = [NSNumber numberWithUnsignedInteger:v6];
        [v5 setNumberOfLeadingZeros:v9];
      }
    }
  }
LABEL_10:
}

- (id)parseHelper:(id)a3 defaultRegion:(id)a4 keepRawInput:(BOOL)a5 checkRegion:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = [a3 stringByReplacingOccurrencesOfString:0x26C612CC8 withString:@" "];
  unint64_t v14 = v13;
  if (!v13)
  {
    if (a7)
    {
      uint64_t v15 = [NSString stringWithFormat:@"NOT_A_NUMBER:%@", 0];
      unint64_t v16 = @"NOT_A_NUMBER";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v17 = 0;
    goto LABEL_71;
  }
  if ((unint64_t)[v13 length] >= 0xFB)
  {
    if (a7)
    {
      uint64_t v15 = [NSString stringWithFormat:@"TOO_LONG:%@", v14];
      unint64_t v16 = @"TOO_LONG";
LABEL_7:
      *a7 = [(_NBPhoneNumberUtil *)self errorWithObject:v15 withDomain:v16];

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v93[0] = &stru_26C611188;
  [(_NBPhoneNumberUtil *)self buildNationalNumberForParsing:v14 nationalNumber:v93];
  uint64_t v18 = (__CFString *)v93[0];
  if ([(_NBPhoneNumberUtil *)self isViablePhoneNumber:v18])
  {
    if (!v8
      || [(_NBPhoneNumberUtil *)self checkRegionForParsing:v18 defaultRegion:v12])
    {
      uint64_t v19 = objc_alloc_init(_NBPhoneNumber);
      if (v9)
      {
        uint64_t v20 = (void *)[v14 copy];
        [(_NBPhoneNumber *)v19 setRawInput:v20];
      }
      v92 = v18;
      id v21 = [(_NBPhoneNumberUtil *)self maybeStripExtension:&v92];
      unint64_t v22 = v92;

      if ([v21 length])
      {
        uint64_t v23 = (void *)[v21 copy];
        [(_NBPhoneNumber *)v19 setExtension:v23];
      }
      v80 = v21;
      unint64_t v24 = [(_NBPhoneNumberUtil *)self helper];
      uint64_t v25 = [v24 getMetadataForRegion:v12];

      v81 = v22;
      id v26 = (void *)[(__CFString *)v22 copy];
      v91 = &stru_26C611188;
      id v89 = 0;
      v90 = v19;
      v82 = (void *)v25;
      int v27 = [(_NBPhoneNumberUtil *)self maybeExtractCountryCode:v26 metadata:v25 nationalNumber:&v91 keepRawInput:v9 phoneNumber:&v90 error:&v89];
      int v28 = v91;
      id v29 = v90;

      id v30 = v89;
      v76 = v30;
      if (v30)
      {
        v75 = v28;
        id v31 = [v30 domain];
        if ([v31 isEqualToString:@"INVALID_COUNTRY_CODE"])
        {
          int v32 = [(_NBPhoneNumberUtil *)self stringPositionByRegex:v26 regex:qword_26ACEFD18];

          if ((v32 & 0x80000000) == 0)
          {
            uint64_t v33 = [(_NBPhoneNumberUtil *)self replaceStringByRegex:v26 regex:qword_26ACEFD18 withTemplate:&stru_26C611188];

            v87 = v29;
            v88 = v75;
            id v86 = 0;
            v72 = (void *)v33;
            uint64_t v34 = [(_NBPhoneNumberUtil *)self maybeExtractCountryCode:v33 metadata:v82 nationalNumber:&v88 keepRawInput:v9 phoneNumber:&v87 error:&v86];
            v35 = v88;

            v73 = v87;
            id v36 = v86;

            if ([v34 isEqualToNumber:&unk_26C628DE0])
            {
              id v37 = v36;
              if (!a7)
              {
                id v26 = v72;
                id v29 = v73;
                v41 = v37;
                goto LABEL_33;
              }
              v38 = [v76 description];
              [v76 domain];
              id v40 = v39 = v34;
              *a7 = [(_NBPhoneNumberUtil *)self errorWithObject:v38 withDomain:v40];

              uint64_t v34 = v39;
              id v26 = v72;
              id v29 = v73;
              v41 = v37;
LABEL_32:

LABEL_33:
              uint64_t v17 = 0;
              id v46 = v35;
              int v27 = v34;
              id v47 = v76;
LABEL_67:

              v64 = v26;
              v35 = v46;
              v52 = v27;
              v43 = v80;
              v48 = v82;
              goto LABEL_68;
            }

            v43 = v80;
            id v29 = v73;
LABEL_36:

            v48 = v82;
            v74 = v29;
            if ([v34 isEqualToNumber:&unk_26C628DE0])
            {
              v77 = v34;
              v85 = v81;
              [(_NBPhoneNumberUtil *)self normalizeSB:&v85];
              v49 = v85;

              uint64_t v50 = [(__CFString *)v35 stringByAppendingString:v49];

              if (v12)
              {
                uint64_t v51 = [v82 countryCode];

                [(_NBPhoneNumber *)v74 setCountryCode:v51];
                v81 = v49;
                v35 = (__CFString *)v50;
                v52 = (void *)v51;
                v48 = v82;
              }
              else
              {
                if (v9) {
                  [(_NBPhoneNumber *)v74 clearCountryCodeSource];
                }
                v81 = v49;
                v35 = (__CFString *)v50;
                v52 = v77;
              }
            }
            else
            {
              uint64_t v53 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v34];
              v54 = v34;
              v55 = (void *)v53;
              v56 = v54;
              if ((id)v53 != v12)
              {
                uint64_t v78 = -[_NBPhoneNumberUtil getMetadataForRegionOrCallingCode:regionCode:](self, "getMetadataForRegionOrCallingCode:regionCode:");

                v48 = (void *)v78;
              }

              v52 = v56;
            }
            if ((unint64_t)[(__CFString *)v35 length] <= 1)
            {
              id v29 = v74;
              if (!a7)
              {
                uint64_t v17 = 0;
                v64 = v72;
LABEL_68:

                uint64_t v18 = v81;
                goto LABEL_69;
              }
              v82 = v48;
              uint64_t v57 = [NSString stringWithFormat:@"TOO_SHORT_NSN:%@", v35];
              [(_NBPhoneNumberUtil *)self errorWithObject:v57 withDomain:@"TOO_SHORT_NSN"];
              uint64_t v17 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
              id v26 = v72;
              id v46 = v35;
              id v47 = (void *)v57;
              goto LABEL_62;
            }
            if (v48)
            {
              v79 = v52;
              v58 = (void *)[(__CFString *)v35 copy];
              v83 = &stru_26C611188;
              id v84 = v58;
              [(_NBPhoneNumberUtil *)self maybeStripNationalPrefixAndCarrierCode:&v84 metadata:v48 carrierCode:&v83];
              id v59 = v84;

              v60 = v83;
              int64_t v61 = [(_NBPhoneNumberUtil *)self validateNumberLength:v59 metadata:v48];
              if ((unint64_t)(v61 + 1) <= 6 && ((1 << (v61 + 1)) & 0x51) != 0)
              {
                v62 = v35;
              }
              else
              {
                v62 = (__CFString *)v59;

                if (v9)
                {
                  v71 = (void *)[(__CFString *)v60 copy];
                  [(_NBPhoneNumber *)v74 setPreferredDomesticCarrierCode:v71];
                }
              }

              id v29 = v74;
              v52 = v79;
              v63 = v62;
            }
            else
            {
              v63 = v35;
              id v29 = v74;
            }
            v75 = v63;
            id v47 = (void *)[(__CFString *)v63 copy];
            unint64_t v65 = [v47 length];
            v82 = v48;
            if (v65 > 1)
            {
              if (v65 < 0x11)
              {
                [(_NBPhoneNumberUtil *)self setItalianLeadingZerosForPhoneNumber:v47 phoneNumber:v29];
                v69 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v47, "longLongValue"));
                [(_NBPhoneNumber *)v29 setNationalNumber:v69];

                uint64_t v17 = v29;
                goto LABEL_65;
              }
              if (a7)
              {
                v66 = v75;
                v67 = [NSString stringWithFormat:@"TOO_LONG:%@", v75];
                v68 = @"TOO_LONG";
                goto LABEL_61;
              }
            }
            else if (a7)
            {
              v66 = v75;
              v67 = [NSString stringWithFormat:@"TOO_SHORT_NSN:%@", v75];
              v68 = @"TOO_SHORT_NSN";
LABEL_61:
              *a7 = [(_NBPhoneNumberUtil *)self errorWithObject:v67 withDomain:v68];
              id v46 = v66;

              uint64_t v17 = 0;
              id v26 = v72;
LABEL_62:
              int v27 = v52;
              goto LABEL_67;
            }
            uint64_t v17 = 0;
LABEL_65:
            id v26 = v72;
            int v27 = v52;
            goto LABEL_66;
          }
        }
        else
        {
        }
        if (a7)
        {
          uint64_t v44 = [v76 description];
          v38 = [v76 domain];
          id v45 = self;
          v41 = (void *)v44;
          *a7 = [(_NBPhoneNumberUtil *)v45 errorWithObject:v44 withDomain:v38];
          v35 = v75;
          uint64_t v34 = v27;
          goto LABEL_32;
        }
        uint64_t v17 = 0;
        id v47 = v76;
LABEL_66:
        id v46 = v75;
        goto LABEL_67;
      }
      v35 = v28;
      uint64_t v34 = v27;
      v72 = v26;
      v43 = v80;
      goto LABEL_36;
    }
    if (a7)
    {
      id v29 = [NSString stringWithFormat:@"INVALID_COUNTRY_CODE:%@", v12];
      v42 = @"INVALID_COUNTRY_CODE";
      goto LABEL_24;
    }
  }
  else if (a7)
  {
    id v29 = [NSString stringWithFormat:@"NOT_A_NUMBER:%@", v18];
    v42 = @"NOT_A_NUMBER";
LABEL_24:
    [(_NBPhoneNumberUtil *)self errorWithObject:v29 withDomain:v42];
    uint64_t v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v17 = 0;
LABEL_70:

LABEL_71:

  return v17;
}

- (void)buildNationalNumberForParsing:(id)a3 nationalNumber:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    goto LABEL_15;
  }
  id v23 = v6;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  int v8 = [(_NBPhoneNumberUtil *)self indexOfStringByString:v23 target:@";phone-context="];
  if (v8 < 1)
  {
    uint64_t v12 = [(_NBPhoneNumberUtil *)self extractPossibleNumber:v23];
  }
  else
  {
    unsigned int v9 = v8;
    uint64_t v10 = [@";phone-context=" length] + v8;
    if ([v23 characterAtIndex:v10] == 43)
    {
      uint64_t v11 = objc_msgSend(v23, "rangeOfString:options:range:", @";", 2, v10, objc_msgSend(v23, "length") - v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        [v23 substringFromIndex:v10];
      }
      else {
      id v13 = objc_msgSend(v23, "substringWithRange:", v10, v11 - v10);
      }
      [v7 appendString:v13];
    }
    if ([(_NBPhoneNumberUtil *)self indexOfStringByString:v23 target:@"tel:"] < 1) {
      goto LABEL_12;
    }
    int v14 = [(_NBPhoneNumberUtil *)self indexOfStringByString:v23 target:@"tel:"];
    uint64_t v15 = [@"tel:" length];
    uint64_t v12 = objc_msgSend(v23, "substringWithRange:", v15 + v14, v9 - (v15 + v14));
  }
  unint64_t v16 = (void *)v12;
  [v7 appendString:v12];

LABEL_12:
  uint64_t v17 = (void *)[v7 copy];
  int v18 = [(_NBPhoneNumberUtil *)self indexOfStringByString:v17 target:@";isub="];
  if (v18 >= 1)
  {
    uint64_t v19 = v18;
    id v20 = objc_alloc(MEMORY[0x263F089D8]);
    id v21 = objc_msgSend(v17, "substringWithRange:", 0, v19);
    uint64_t v22 = [v20 initWithString:v21];

    id v7 = (id)v22;
  }
  *a4 = (id)[v7 copy];

  id v6 = v23;
LABEL_15:
}

- (int64_t)isNumberMatch:(id)a3 second:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [(_NBPhoneNumberUtil *)self isNumberMatch:v7 second:v8];

  return v9;
}

- (int64_t)isNumberMatch:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v45 = 0;
    id v8 = [(_NBPhoneNumberUtil *)self parse:v6 defaultRegion:0x26C612CA8 error:&v45];
    id v9 = v45;
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 domain];
      int v12 = [v11 isEqualToString:@"INVALID_COUNTRY_CODE"];

      if (!v12)
      {
        uint64_t v19 = 0;
        int64_t v17 = 0;
        uint64_t v15 = v8;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = [v7 countryCode];
        int v14 = [(_NBPhoneNumberUtil *)self getRegionCodeForCountryCode:v13];

        if (v14 != @"ZZ")
        {
          uint64_t v44 = 0;
          uint64_t v15 = [(_NBPhoneNumberUtil *)self parse:v6 defaultRegion:v14 error:&v44];
          uint64_t v16 = v44;

          int64_t v17 = 0;
          if (!v16)
          {
            int64_t v18 = [(_NBPhoneNumberUtil *)self isNumberMatch:v15 second:v7];
            if (v18 == 4) {
              int64_t v17 = 3;
            }
            else {
              int64_t v17 = v18;
            }
          }

          uint64_t v19 = 0;
          goto LABEL_51;
        }
      }
      uint64_t v43 = 0;
      uint64_t v15 = [(_NBPhoneNumberUtil *)self parseHelper:v6 defaultRegion:0 keepRawInput:0 checkRegion:0 error:&v43];
      uint64_t v40 = v43;

      if (v40)
      {
        uint64_t v19 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v15 = v8;
    }
  }
  else
  {
    uint64_t v15 = (void *)[v6 copy];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = 0;
    uint64_t v19 = [(_NBPhoneNumberUtil *)self parse:v7 defaultRegion:0x26C612CA8 error:&v42];
    id v20 = v42;
    uint64_t v10 = v20;
    if (v20)
    {
      id v21 = [v20 domain];
      int v22 = [v21 isEqualToString:@"INVALID_COUNTRY_CODE"];

      if (!v22)
      {
LABEL_48:
        int64_t v17 = 0;
        goto LABEL_51;
      }
      id v23 = self;
      id v24 = v7;
      uint64_t v25 = v15;
    }
    else
    {
      id v23 = self;
      id v24 = v6;
      uint64_t v25 = v19;
    }
    int64_t v17 = [(_NBPhoneNumberUtil *)v23 isNumberMatch:v24 second:v25];
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v19 = (void *)[v7 copy];
  [v15 setRawInput:&stru_26C611188];
  [v15 clearCountryCodeSource];
  [v15 setPreferredDomesticCarrierCode:&stru_26C611188];
  [v19 setRawInput:&stru_26C611188];
  [v19 clearCountryCodeSource];
  [v19 setPreferredDomesticCarrierCode:&stru_26C611188];
  uint64_t v26 = [v15 extension];
  if (v26)
  {
    int v27 = (void *)v26;
    int v28 = [v15 extension];
    uint64_t v29 = [v28 length];

    if (!v29) {
      [v15 setExtension:0];
    }
  }
  uint64_t v30 = [v19 extension];
  if (v30)
  {
    id v31 = (void *)v30;
    int v32 = [v19 extension];
    uint64_t v33 = [v32 length];

    if (!v33) {
      [v19 setExtension:0];
    }
  }
  uint64_t v34 = [v15 extension];
  if (!+[_NBMetadataHelper hasValue:v34]) {
    goto LABEL_32;
  }
  v35 = [v19 extension];
  if (!+[_NBMetadataHelper hasValue:v35])
  {

LABEL_32:
LABEL_33:
    uint64_t v10 = [v15 countryCode];
    v39 = [v19 countryCode];
    if (([v10 isEqualToNumber:&unk_26C628DE0] & 1) != 0
      || ([v39 isEqualToNumber:&unk_26C628DE0] & 1) != 0)
    {
      [v15 setCountryCode:&unk_26C628DE0];
      [v19 setCountryCode:&unk_26C628DE0];
      if ([v15 isEqual:v19])
      {
        int64_t v17 = 3;
      }
      else if ([(_NBPhoneNumberUtil *)self isNationalNumberSuffixOfTheOther:v15 second:v19])
      {
        int64_t v17 = 2;
      }
      else
      {
        int64_t v17 = 1;
      }
    }
    else if ([v15 isEqual:v19])
    {
      int64_t v17 = 4;
    }
    else if ([v10 isEqualToNumber:v39] {
           && [(_NBPhoneNumberUtil *)self isNationalNumberSuffixOfTheOther:v15 second:v19])
    }
    {
      int64_t v17 = 2;
    }
    else
    {
      int64_t v17 = 1;
    }

    goto LABEL_51;
  }
  id v36 = [v15 extension];
  id v37 = [v19 extension];
  char v38 = [v36 isEqualToString:v37];

  if (v38) {
    goto LABEL_33;
  }
  int64_t v17 = 1;
LABEL_52:

  return v17;
}

- (BOOL)isNationalNumberSuffixOfTheOther:(id)a3 second:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = [a3 nationalNumber];
  id v8 = [v5 stringWithFormat:@"%@", v7];

  id v9 = NSString;
  uint64_t v10 = [v6 nationalNumber];

  uint64_t v11 = [v9 stringWithFormat:@"%@", v10];

  if ([v8 hasSuffix:v11]) {
    char v12 = 1;
  }
  else {
    char v12 = [v11 hasSuffix:v8];
  }

  return v12;
}

- (BOOL)canBeInternationallyDialled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  LOBYTE(self) = [(_NBPhoneNumberUtil *)self canBeInternationallyDialled:v5];

  return (char)self;
}

- (BOOL)canBeInternationallyDialled:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBPhoneNumberUtil *)self helper];
  id v6 = [(_NBPhoneNumberUtil *)self getRegionCodeForNumber:v4];
  id v7 = [v5 getMetadataForRegion:v6];

  if (v7)
  {
    id v8 = [(_NBPhoneNumberUtil *)self getNationalSignificantNumber:v4];
    id v9 = [v7 noInternationalDialling];
    BOOL v10 = ![(_NBPhoneNumberUtil *)self isNumberMatchingDesc:v8 numberDesc:v9];
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)matchesEntirely:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"NA"])
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    id v9 = [(_NBPhoneNumberUtil *)self entireRegularExpressionWithPattern:v6 options:0 error:&v15];
    uint64_t v10 = [v7 length];
    uint64_t v11 = objc_msgSend(v9, "firstMatchInString:options:range:", v7, 4, 0, v10);
    char v12 = v11;
    BOOL v8 = v11 && ![v11 range] && v13 == v10;
  }
  return v8;
}

- (NSLock)entireStringCacheLock
{
  return self->_entireStringCacheLock;
}

- (void)setEntireStringCacheLock:(id)a3
{
}

- (NSMutableDictionary)entireStringRegexCache
{
  return self->_entireStringRegexCache;
}

- (void)setEntireStringRegexCache:(id)a3
{
}

- (NSLock)lockPatternCache
{
  return self->_lockPatternCache;
}

- (void)setLockPatternCache:(id)a3
{
}

- (NSMutableDictionary)regexPatternCache
{
  return self->_regexPatternCache;
}

- (void)setRegexPatternCache:(id)a3
{
}

- (NSRegularExpression)CAPTURING_DIGIT_PATTERN
{
  return self->_CAPTURING_DIGIT_PATTERN;
}

- (void)setCAPTURING_DIGIT_PATTERN:(id)a3
{
}

- (NSRegularExpression)VALID_ALPHA_PHONE_PATTERN
{
  return self->_VALID_ALPHA_PHONE_PATTERN;
}

- (void)setVALID_ALPHA_PHONE_PATTERN:(id)a3
{
}

- (_NBMetadataHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
}

- (_NBRegExMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_VALID_ALPHA_PHONE_PATTERN, 0);
  objc_storeStrong((id *)&self->_CAPTURING_DIGIT_PATTERN, 0);
  objc_storeStrong((id *)&self->_regexPatternCache, 0);
  objc_storeStrong((id *)&self->_lockPatternCache, 0);
  objc_storeStrong((id *)&self->_entireStringRegexCache, 0);

  objc_storeStrong((id *)&self->_entireStringCacheLock, 0);
}

@end