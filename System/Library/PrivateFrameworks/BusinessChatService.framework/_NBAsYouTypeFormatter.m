@interface _NBAsYouTypeFormatter
- (BOOL)ableToExtractLongerNdd_;
- (BOOL)ableToFormat_;
- (BOOL)attemptToExtractCountryCallingCode_;
- (BOOL)attemptToExtractIdd_;
- (BOOL)createFormattingTemplate_:(id)a3;
- (BOOL)inputHasFormatting_;
- (BOOL)isCompleteNumber_;
- (BOOL)isDigitOrLeadingPlusSign_:(id)a3;
- (BOOL)isExpectingCountryCallingCode_;
- (BOOL)isFormatEligible_:(id)a3;
- (BOOL)isNanpaNumberWithNationalPrefix_;
- (BOOL)isSuccessfulFormatting;
- (BOOL)maybeCreateNewTemplate_;
- (BOOL)shouldAddSpaceAfterNationalPrefix_;
- (NSMutableArray)possibleFormats_;
- (NSMutableString)accruedInputWithoutFormatting_;
- (NSMutableString)accruedInput_;
- (NSMutableString)formattingTemplate_;
- (NSMutableString)nationalNumber_;
- (NSMutableString)prefixBeforeNationalNumber_;
- (NSRegularExpression)CHARACTER_CLASS_PATTERN_;
- (NSRegularExpression)DIGIT_PATTERN_;
- (NSRegularExpression)ELIGIBLE_FORMAT_PATTERN_;
- (NSRegularExpression)NATIONAL_PREFIX_SEPARATORS_PATTERN_;
- (NSRegularExpression)STANDALONE_DIGIT_PATTERN_;
- (NSString)currentFormattingPattern_;
- (NSString)currentOutput_;
- (NSString)defaultCountry_;
- (NSString)nationalPrefixExtracted_;
- (_NBAsYouTypeFormatter)init;
- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3;
- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3 bundle:(id)a4;
- (_NBPhoneMetaData)currentMetaData_;
- (_NBPhoneMetaData)defaultMetaData_;
- (_NBPhoneNumberUtil)phoneUtil_;
- (id)appendNationalNumber_:(id)a3;
- (id)attemptToChooseFormattingPattern_;
- (id)attemptToChoosePatternWithPrefixExtracted_;
- (id)attemptToFormatAccruedDigits_;
- (id)getFormattingTemplate_:(id)a3 numberFormat:(id)a4;
- (id)getMetadataForRegion_:(id)a3;
- (id)inputAccruedNationalNumber_;
- (id)inputDigit:(id)a3;
- (id)inputDigitAndRememberPosition:(id)a3;
- (id)inputDigitHelper_:(id)a3;
- (id)inputDigitWithOptionToRememberPosition_:(id)a3 rememberPosition:(BOOL)a4;
- (id)inputString:(id)a3;
- (id)inputStringAndRememberPosition:(id)a3;
- (id)normalizeAndAccrueDigitsAndPlusSign_:(id)a3 rememberPosition:(BOOL)a4;
- (id)removeLastDigit;
- (id)removeLastDigitAndRememberPosition;
- (id)removeNationalPrefixFromNationalNumber_;
- (unint64_t)getRememberedPosition;
- (unint64_t)lastMatchPosition_;
- (unint64_t)originalPosition_;
- (unint64_t)positionToRemember_;
- (void)clear;
- (void)getAvailableFormats_:(id)a3;
- (void)narrowDownPossibleFormats_:(id)a3;
- (void)setAbleToFormat_:(BOOL)a3;
- (void)setAccruedInputWithoutFormatting_:(id)a3;
- (void)setAccruedInput_:(id)a3;
- (void)setCHARACTER_CLASS_PATTERN_:(id)a3;
- (void)setCurrentFormattingPattern_:(id)a3;
- (void)setCurrentMetaData_:(id)a3;
- (void)setCurrentOutput_:(id)a3;
- (void)setDIGIT_PATTERN_:(id)a3;
- (void)setDefaultCountry_:(id)a3;
- (void)setDefaultMetaData_:(id)a3;
- (void)setELIGIBLE_FORMAT_PATTERN_:(id)a3;
- (void)setFormattingTemplate_:(id)a3;
- (void)setInputHasFormatting_:(BOOL)a3;
- (void)setIsCompleteNumber_:(BOOL)a3;
- (void)setIsExpectingCountryCallingCode_:(BOOL)a3;
- (void)setLastMatchPosition_:(unint64_t)a3;
- (void)setNATIONAL_PREFIX_SEPARATORS_PATTERN_:(id)a3;
- (void)setNationalNumber_:(id)a3;
- (void)setNationalPrefixExtracted_:(id)a3;
- (void)setOriginalPosition_:(unint64_t)a3;
- (void)setPhoneUtil_:(id)a3;
- (void)setPositionToRemember_:(unint64_t)a3;
- (void)setPossibleFormats_:(id)a3;
- (void)setPrefixBeforeNationalNumber_:(id)a3;
- (void)setSTANDALONE_DIGIT_PATTERN_:(id)a3;
- (void)setShouldAddSpaceAfterNationalPrefix_:(BOOL)a3;
@end

@implementation _NBAsYouTypeFormatter

- (_NBAsYouTypeFormatter)init
{
  v26.receiver = self;
  v26.super_class = (Class)_NBAsYouTypeFormatter;
  v2 = [(_NBAsYouTypeFormatter *)&v26 init];
  v3 = v2;
  if (v2)
  {
    v2->_isSuccessfulFormatting = 0;
    [(_NBAsYouTypeFormatter *)v2 setCurrentOutput_:&stru_26C611188];
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(_NBAsYouTypeFormatter *)v3 setFormattingTemplate_:v4];

    id v25 = 0;
    v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@" " options:0 error:&v25];
    id v6 = v25;
    [(_NBAsYouTypeFormatter *)v3 setDIGIT_PATTERN_:v5];

    id v24 = v6;
    v7 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[- ]" options:0 error:&v24];
    id v8 = v24;

    [(_NBAsYouTypeFormatter *)v3 setNATIONAL_PREFIX_SEPARATORS_PATTERN_:v7];
    id v23 = v8;
    v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\[([^\\[\\]])*\\]" options:0 error:&v23];
    id v10 = v23;

    [(_NBAsYouTypeFormatter *)v3 setCHARACTER_CLASS_PATTERN_:v9];
    id v22 = v10;
    v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\d(?=[^,}][^,}])" options:0 error:&v22];
    id v12 = v22;

    [(_NBAsYouTypeFormatter *)v3 setSTANDALONE_DIGIT_PATTERN_:v11];
    id v21 = v12;
    v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～]*(\\$\\d[-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～]*)+$" options:0 error:&v21];
    id v14 = v21;

    [(_NBAsYouTypeFormatter *)v3 setELIGIBLE_FORMAT_PATTERN_:v13];
    [(_NBAsYouTypeFormatter *)v3 setCurrentFormattingPattern_:&stru_26C611188];
    id v15 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(_NBAsYouTypeFormatter *)v3 setAccruedInput_:v15];

    id v16 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(_NBAsYouTypeFormatter *)v3 setAccruedInputWithoutFormatting_:v16];

    [(_NBAsYouTypeFormatter *)v3 setAbleToFormat_:1];
    [(_NBAsYouTypeFormatter *)v3 setInputHasFormatting_:0];
    [(_NBAsYouTypeFormatter *)v3 setIsCompleteNumber_:0];
    [(_NBAsYouTypeFormatter *)v3 setIsExpectingCountryCallingCode_:0];
    [(_NBAsYouTypeFormatter *)v3 setLastMatchPosition_:0];
    [(_NBAsYouTypeFormatter *)v3 setOriginalPosition_:0];
    [(_NBAsYouTypeFormatter *)v3 setPositionToRemember_:0];
    id v17 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(_NBAsYouTypeFormatter *)v3 setPrefixBeforeNationalNumber_:v17];

    [(_NBAsYouTypeFormatter *)v3 setShouldAddSpaceAfterNationalPrefix_:0];
    [(_NBAsYouTypeFormatter *)v3 setNationalPrefixExtracted_:&stru_26C611188];
    id v18 = objc_alloc_init(MEMORY[0x263F089D8]);
    [(_NBAsYouTypeFormatter *)v3 setNationalNumber_:v18];

    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(_NBAsYouTypeFormatter *)v3 setPossibleFormats_:v19];
  }
  return v3;
}

- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3
{
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 mainBundle];
  v7 = [(_NBAsYouTypeFormatter *)self initWithRegionCode:v5 bundle:v6];

  return v7;
}

- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = [(_NBAsYouTypeFormatter *)self init];
  if (v6)
  {
    v7 = +[_NBPhoneNumberUtil sharedInstance];
    [(_NBAsYouTypeFormatter *)v6 setPhoneUtil_:v7];

    [(_NBAsYouTypeFormatter *)v6 setDefaultCountry_:v5];
    id v8 = [(_NBAsYouTypeFormatter *)v6 defaultCountry];
    v9 = [(_NBAsYouTypeFormatter *)v6 getMetadataForRegion_:v8];
    [(_NBAsYouTypeFormatter *)v6 setCurrentMetaData_:v9];

    id v10 = [(_NBAsYouTypeFormatter *)v6 currentMetaData];
    [(_NBAsYouTypeFormatter *)v6 setDefaultMetaData_:v10];
  }
  return v6;
}

- (id)getMetadataForRegion_:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_NBMetadataHelper);
  id v6 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  v7 = [v6 getCountryCodeForRegion:v4];

  id v8 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  v9 = [v8 getRegionCodeForCountryCode:v7];

  id v10 = [(_NBMetadataHelper *)v5 getMetadataForRegion:v9];
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init(_NBPhoneMetaData);
  }
  v13 = v12;

  return v13;
}

- (BOOL)maybeCreateNewTemplate_
{
  v3 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(_NBAsYouTypeFormatter *)self possibleFormats];
      v7 = objc_msgSend(v6, "nb_safeObjectAtIndex:class:", v5, objc_opt_class());

      id v8 = [v7 pattern];
      if (![v8 length]
        || ([(_NBAsYouTypeFormatter *)self currentFormattingPattern],
            v9 = objc_claimAutoreleasedReturnValue(),
            char v10 = [v9 isEqualToString:v8],
            v9,
            (v10 & 1) != 0))
      {
        BOOL v11 = 0;
        goto LABEL_13;
      }
      if ([(_NBAsYouTypeFormatter *)self createFormattingTemplate_:v7]) {
        break;
      }

      if (v4 == ++v5) {
        goto LABEL_7;
      }
    }
    [(_NBAsYouTypeFormatter *)self setCurrentFormattingPattern_:v8];
    id v12 = [v7 nationalPrefixFormattingRule];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      id v14 = [(_NBAsYouTypeFormatter *)self NATIONAL_PREFIX_SEPARATORS_PATTERN];
      id v15 = [v7 nationalPrefixFormattingRule];
      id v16 = objc_msgSend(v14, "firstMatchInString:options:range:", v15, 0, 0, v13);

      [(_NBAsYouTypeFormatter *)self setShouldAddSpaceAfterNationalPrefix_:v16 != 0];
    }
    else
    {
      [(_NBAsYouTypeFormatter *)self setShouldAddSpaceAfterNationalPrefix_:0];
    }
    [(_NBAsYouTypeFormatter *)self setLastMatchPosition_:0];
    BOOL v11 = 1;
LABEL_13:
  }
  else
  {
LABEL_7:
    [(_NBAsYouTypeFormatter *)self setAbleToFormat_:0];
    return 0;
  }
  return v11;
}

- (void)getAvailableFormats_:(id)a3
{
  id v26 = a3;
  if ([(_NBAsYouTypeFormatter *)self isCompleteNumber]
    && ([(_NBAsYouTypeFormatter *)self currentMetaData],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 intlNumberFormats],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v7 = [(_NBAsYouTypeFormatter *)self currentMetaData];
    uint64_t v8 = [v7 intlNumberFormats];
  }
  else
  {
    v7 = [(_NBAsYouTypeFormatter *)self currentMetaData];
    uint64_t v8 = [v7 numberFormats];
  }
  v9 = (void *)v8;

  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = objc_msgSend(v9, "nb_safeObjectAtIndex:class:", v12, objc_opt_class());
      id v14 = [(_NBAsYouTypeFormatter *)self currentMetaData];
      uint64_t v15 = [v14 nationalPrefix];
      if (!v15) {
        break;
      }
      id v16 = (void *)v15;
      id v17 = [(_NBAsYouTypeFormatter *)self currentMetaData];
      id v18 = [v17 nationalPrefix];
      uint64_t v19 = [v18 length];

      if (!v19) {
        goto LABEL_14;
      }
      if ([(_NBAsYouTypeFormatter *)self isCompleteNumber]) {
        goto LABEL_14;
      }
      if ([v13 nationalPrefixOptionalWhenFormatting]) {
        goto LABEL_14;
      }
      v20 = [(_NBAsYouTypeFormatter *)self phoneUtil];
      id v21 = [v13 nationalPrefixFormattingRule];
      int v22 = [v20 formattingRuleHasFirstGroupOnly:v21];

      if (v22) {
        goto LABEL_14;
      }
LABEL_16:

      if (v11 == ++v12) {
        goto LABEL_17;
      }
    }

LABEL_14:
    id v23 = [v13 format];
    BOOL v24 = [(_NBAsYouTypeFormatter *)self isFormatEligible_:v23];

    if (v24)
    {
      id v25 = [(_NBAsYouTypeFormatter *)self possibleFormats];
      [v25 addObject:v13];
    }
    goto LABEL_16;
  }
LABEL_17:
  [(_NBAsYouTypeFormatter *)self narrowDownPossibleFormats_:v26];
}

- (BOOL)isFormatEligible_:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(_NBAsYouTypeFormatter *)self ELIGIBLE_FORMAT_PATTERN];
    uint64_t v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)narrowDownPossibleFormats_:(id)a3
{
  id v22 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v22 length];
  uint64_t v6 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v5 - 3;
    do
    {
      uint64_t v10 = [(_NBAsYouTypeFormatter *)self possibleFormats];
      uint64_t v11 = objc_msgSend(v10, "nb_safeObjectAtIndex:class:", v8, objc_opt_class());

      uint64_t v12 = [v11 leadingDigitsPatterns];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        id v14 = [v11 leadingDigitsPatterns];
        [v14 count];

        uint64_t v15 = [v11 leadingDigitsPatterns];
        uint64_t v16 = [v15 count];

        if (v9 >= v16 - 1) {
          unint64_t v17 = v16 - 1;
        }
        else {
          unint64_t v17 = v9;
        }
        id v18 = [v11 leadingDigitsPatterns];
        uint64_t v19 = objc_msgSend(v18, "nb_safeStringAtIndex:", v17);

        v20 = [(_NBAsYouTypeFormatter *)self phoneUtil];
        int v21 = [v20 stringPositionByRegex:v22 regex:v19];

        if (!v21) {
          [v4 addObject:v11];
        }
      }
      else
      {
        [v4 addObject:v11];
      }

      ++v8;
    }
    while (v7 != v8);
  }
  [(_NBAsYouTypeFormatter *)self setPossibleFormats_:v4];
}

- (BOOL)createFormattingTemplate_:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pattern];
  if ([v5 rangeOfString:@"|"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(_NBAsYouTypeFormatter *)self CHARACTER_CLASS_PATTERN];
    uint64_t v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), @"\\\\d");

    uint64_t v8 = [(_NBAsYouTypeFormatter *)self STANDALONE_DIGIT_PATTERN];
    uint64_t v5 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"\\\\d");

    unint64_t v9 = [(_NBAsYouTypeFormatter *)self formattingTemplate];
    [v9 setString:&stru_26C611188];

    uint64_t v10 = [v4 format];
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self getFormattingTemplate_:v5 numberFormat:v10];

    uint64_t v12 = [v11 length];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      id v14 = [(_NBAsYouTypeFormatter *)self formattingTemplate];
      [v14 appendString:v11];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)getFormattingTemplate_:(id)a3 numberFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  unint64_t v9 = [v8 matchedStringByRegex:@"999999999999999" regex:v6];

  uint64_t v10 = objc_msgSend(v9, "nb_safeStringAtIndex:", 0);
  unint64_t v11 = [v10 length];
  uint64_t v12 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  unint64_t v13 = [v12 length];

  if (v11 >= v13)
  {
    uint64_t v15 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    uint64_t v16 = [v15 replaceStringByRegex:v10 regex:v6 withTemplate:v7];

    unint64_t v17 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    id v14 = [v17 replaceStringByRegex:v16 regex:@"9" withTemplate:@" "];
  }
  else
  {
    id v14 = &stru_26C611188;
  }

  return v14;
}

- (void)clear
{
  [(_NBAsYouTypeFormatter *)self setCurrentOutput_:&stru_26C611188];
  v3 = [(_NBAsYouTypeFormatter *)self accruedInput];
  [v3 setString:&stru_26C611188];

  id v4 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
  [v4 setString:&stru_26C611188];

  uint64_t v5 = [(_NBAsYouTypeFormatter *)self formattingTemplate];
  [v5 setString:&stru_26C611188];

  [(_NBAsYouTypeFormatter *)self setLastMatchPosition_:0];
  [(_NBAsYouTypeFormatter *)self setCurrentFormattingPattern_:&stru_26C611188];
  id v6 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
  [v6 setString:&stru_26C611188];

  [(_NBAsYouTypeFormatter *)self setNationalPrefixExtracted_:&stru_26C611188];
  id v7 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  [v7 setString:&stru_26C611188];

  [(_NBAsYouTypeFormatter *)self setAbleToFormat_:1];
  [(_NBAsYouTypeFormatter *)self setInputHasFormatting_:0];
  [(_NBAsYouTypeFormatter *)self setPositionToRemember_:0];
  [(_NBAsYouTypeFormatter *)self setOriginalPosition_:0];
  [(_NBAsYouTypeFormatter *)self setIsCompleteNumber_:0];
  [(_NBAsYouTypeFormatter *)self setIsExpectingCountryCallingCode_:0];
  uint64_t v8 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  [v8 removeAllObjects];

  [(_NBAsYouTypeFormatter *)self setShouldAddSpaceAfterNationalPrefix_:0];
  unint64_t v9 = [(_NBAsYouTypeFormatter *)self currentMetaData];
  uint64_t v10 = [(_NBAsYouTypeFormatter *)self defaultMetaData];

  if (v9 != v10)
  {
    id v12 = [(_NBAsYouTypeFormatter *)self defaultCountry];
    unint64_t v11 = [(_NBAsYouTypeFormatter *)self getMetadataForRegion_:v12];
    [(_NBAsYouTypeFormatter *)self setCurrentMetaData_:v11];
  }
}

- (id)removeLastDigitAndRememberPosition
{
  v3 = [(_NBAsYouTypeFormatter *)self accruedInput];
  id v4 = (void *)[v3 copy];

  [(_NBAsYouTypeFormatter *)self clear];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    if (v5 == 1)
    {
      uint64_t v10 = &stru_26C611188;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = &stru_26C611188;
      do
      {
        unint64_t v9 = objc_msgSend(v4, "substringWithRange:", v7, 1);
        uint64_t v10 = [(_NBAsYouTypeFormatter *)self inputDigitAndRememberPosition:v9];

        ++v7;
        uint64_t v8 = v10;
      }
      while (v6 != v7);
    }
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = &stru_26C611188;
  }

  return v11;
}

- (id)removeLastDigit
{
  v3 = [(_NBAsYouTypeFormatter *)self accruedInput];
  id v4 = (void *)[v3 copy];

  [(_NBAsYouTypeFormatter *)self clear];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    if (v5 == 1)
    {
      uint64_t v10 = &stru_26C611188;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = &stru_26C611188;
      do
      {
        unint64_t v9 = objc_msgSend(v4, "substringWithRange:", v7, 1);
        uint64_t v10 = [(_NBAsYouTypeFormatter *)self inputDigit:v9];

        ++v7;
        uint64_t v8 = v10;
      }
      while (v6 != v7);
    }
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = &stru_26C611188;
  }

  return v11;
}

- (id)inputStringAndRememberPosition:(id)a3
{
  id v4 = a3;
  [(_NBAsYouTypeFormatter *)self clear];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = &stru_26C611188;
    do
    {
      unint64_t v9 = objc_msgSend(v4, "substringWithRange:", v7, 1);
      uint64_t v10 = [(_NBAsYouTypeFormatter *)self inputDigitAndRememberPosition:v9];

      ++v7;
      uint64_t v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    uint64_t v10 = &stru_26C611188;
  }

  return v10;
}

- (id)inputString:(id)a3
{
  id v4 = a3;
  [(_NBAsYouTypeFormatter *)self clear];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = &stru_26C611188;
    do
    {
      unint64_t v9 = objc_msgSend(v4, "substringWithRange:", v7, 1);
      uint64_t v10 = [(_NBAsYouTypeFormatter *)self inputDigit:v9];

      ++v7;
      uint64_t v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    uint64_t v10 = &stru_26C611188;
  }

  return v10;
}

- (id)inputDigit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [(_NBAsYouTypeFormatter *)self inputDigitWithOptionToRememberPosition_:v5 rememberPosition:0];
    [(_NBAsYouTypeFormatter *)self setCurrentOutput_:v6];
  }
  uint64_t v7 = [(_NBAsYouTypeFormatter *)self currentOutput];

  return v7;
}

- (id)inputDigitAndRememberPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [(_NBAsYouTypeFormatter *)self inputDigitWithOptionToRememberPosition_:v5 rememberPosition:1];
    [(_NBAsYouTypeFormatter *)self setCurrentOutput_:v6];
  }
  uint64_t v7 = [(_NBAsYouTypeFormatter *)self currentOutput];

  return v7;
}

- (id)inputDigitWithOptionToRememberPosition_:(id)a3 rememberPosition:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ![v6 length])
  {
    self->_isSuccessfulFormatting = 0;
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self currentOutput];
    goto LABEL_30;
  }
  uint64_t v8 = [(_NBAsYouTypeFormatter *)self accruedInput];
  [v8 appendString:v7];

  if (v4)
  {
    unint64_t v9 = [(_NBAsYouTypeFormatter *)self accruedInput];
    -[_NBAsYouTypeFormatter setOriginalPosition_:](self, "setOriginalPosition_:", [v9 length]);
  }
  if ([(_NBAsYouTypeFormatter *)self isDigitOrLeadingPlusSign_:v7])
  {
    uint64_t v10 = [(_NBAsYouTypeFormatter *)self normalizeAndAccrueDigitsAndPlusSign_:v7 rememberPosition:v4];

    uint64_t v7 = (void *)v10;
  }
  else
  {
    [(_NBAsYouTypeFormatter *)self setAbleToFormat_:0];
    [(_NBAsYouTypeFormatter *)self setInputHasFormatting_:1];
  }
  if (([(_NBAsYouTypeFormatter *)self ableToFormat] & 1) == 0)
  {
    if ([(_NBAsYouTypeFormatter *)self inputHasFormatting])
    {
      self->_isSuccessfulFormatting = 1;
      id v14 = NSString;
      uint64_t v15 = [(_NBAsYouTypeFormatter *)self accruedInput];
      uint64_t v16 = [v14 stringWithString:v15];
LABEL_24:

      goto LABEL_31;
    }
    if ([(_NBAsYouTypeFormatter *)self attemptToExtractIdd])
    {
      if (![(_NBAsYouTypeFormatter *)self attemptToExtractCountryCallingCode])goto LABEL_28; {
    }
      }
    else
    {
      if (![(_NBAsYouTypeFormatter *)self ableToExtractLongerNdd])
      {
LABEL_28:
        self->_isSuccessfulFormatting = 0;
        goto LABEL_29;
      }
      uint64_t v19 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
      [v19 appendString:@" "];
    }
    self->_isSuccessfulFormatting = 1;
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self attemptToChoosePatternWithPrefixExtracted];
LABEL_30:
    uint64_t v16 = (void *)v11;
    goto LABEL_31;
  }
  id v12 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
  unint64_t v13 = [v12 length];

  if (v13 < 3)
  {
    self->_isSuccessfulFormatting = 1;
LABEL_29:
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self accruedInput];
    goto LABEL_30;
  }
  if (v13 == 3)
  {
    if (![(_NBAsYouTypeFormatter *)self attemptToExtractIdd])
    {
      id v26 = [(_NBAsYouTypeFormatter *)self removeNationalPrefixFromNationalNumber];
      [(_NBAsYouTypeFormatter *)self setNationalPrefixExtracted_:v26];

      self->_isSuccessfulFormatting = 1;
LABEL_39:
      uint64_t v11 = [(_NBAsYouTypeFormatter *)self attemptToChooseFormattingPattern];
      goto LABEL_30;
    }
    [(_NBAsYouTypeFormatter *)self setIsExpectingCountryCallingCode_:1];
  }
  if ([(_NBAsYouTypeFormatter *)self isExpectingCountryCallingCode])
  {
    if ([(_NBAsYouTypeFormatter *)self attemptToExtractCountryCallingCode])[(_NBAsYouTypeFormatter *)self setIsExpectingCountryCallingCode_:0]; {
    self->_isSuccessfulFormatting = 1;
    }
    unint64_t v17 = NSString;
    uint64_t v15 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
    id v18 = [(_NBAsYouTypeFormatter *)self nationalNumber];
    uint64_t v16 = [v17 stringWithFormat:@"%@%@", v15, v18];

    goto LABEL_24;
  }
  int v21 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    self->_isSuccessfulFormatting = 0;
    goto LABEL_39;
  }
  id v23 = [(_NBAsYouTypeFormatter *)self inputDigitHelper_:v7];
  BOOL v24 = [(_NBAsYouTypeFormatter *)self attemptToFormatAccruedDigits];
  if ([v24 length])
  {
    self->_isSuccessfulFormatting = 1;
    id v25 = v24;
  }
  else
  {
    v27 = [(_NBAsYouTypeFormatter *)self nationalNumber];
    [(_NBAsYouTypeFormatter *)self narrowDownPossibleFormats_:v27];

    if ([(_NBAsYouTypeFormatter *)self maybeCreateNewTemplate])
    {
      self->_isSuccessfulFormatting = 1;
      id v25 = [(_NBAsYouTypeFormatter *)self inputAccruedNationalNumber];
    }
    else
    {
      if ([(_NBAsYouTypeFormatter *)self ableToFormat])
      {
        self->_isSuccessfulFormatting = 1;
        [(_NBAsYouTypeFormatter *)self appendNationalNumber_:v23];
      }
      else
      {
        self->_isSuccessfulFormatting = 0;
        [(_NBAsYouTypeFormatter *)self accruedInput];
      }
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v16 = v25;

LABEL_31:

  return v16;
}

- (id)attemptToChoosePatternWithPrefixExtracted_
{
  [(_NBAsYouTypeFormatter *)self setAbleToFormat_:1];
  [(_NBAsYouTypeFormatter *)self setIsExpectingCountryCallingCode_:0];
  v3 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  [v3 removeAllObjects];

  return (id)[(_NBAsYouTypeFormatter *)self attemptToChooseFormattingPattern];
}

- (BOOL)ableToExtractLongerNdd_
{
  v3 = [(_NBAsYouTypeFormatter *)self nationalPrefixExtracted];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = NSString;
    id v6 = [(_NBAsYouTypeFormatter *)self nationalNumber];
    uint64_t v7 = [v5 stringWithString:v6];

    uint64_t v8 = [(_NBAsYouTypeFormatter *)self nationalPrefixExtracted];
    unint64_t v9 = (void *)[v8 mutableCopy];
    [(_NBAsYouTypeFormatter *)self setNationalNumber_:v9];

    uint64_t v10 = [(_NBAsYouTypeFormatter *)self nationalNumber];
    [v10 appendString:v7];

    uint64_t v11 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
    id v12 = (void *)[v11 copy];

    unint64_t v13 = [(_NBAsYouTypeFormatter *)self nationalPrefixExtracted];
    uint64_t v14 = [v12 rangeOfString:v13 options:4];

    uint64_t v15 = objc_msgSend(v12, "substringWithRange:", 0, v14);
    uint64_t v16 = (void *)[v15 mutableCopy];
    [(_NBAsYouTypeFormatter *)self setPrefixBeforeNationalNumber_:v16];
  }
  unint64_t v17 = [(_NBAsYouTypeFormatter *)self nationalPrefixExtracted];
  id v18 = [(_NBAsYouTypeFormatter *)self removeNationalPrefixFromNationalNumber];
  BOOL v19 = v17 != v18;

  return v19;
}

- (BOOL)isDigitOrLeadingPlusSign_:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"([%@])", 0x26C612D08];
  uint64_t v7 = [NSString stringWithFormat:@"[%@]+", 0x26C612CE8];
  uint64_t v8 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  unint64_t v9 = [v8 matchesByRegex:v5 regex:v6];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  id v12 = [v11 matchesByRegex:v5 regex:v7];

  uint64_t v13 = [v12 count];
  if (v10)
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = [(_NBAsYouTypeFormatter *)self accruedInput];
    BOOL v14 = [v15 length] == 1 && v13 != 0;
  }
  return v14;
}

- (id)attemptToFormatAccruedDigits_
{
  v3 = NSString;
  uint64_t v4 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  id v26 = [v3 stringWithString:v4];

  id v5 = [(_NBAsYouTypeFormatter *)self possibleFormats];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(_NBAsYouTypeFormatter *)self possibleFormats];
      unint64_t v9 = [v8 objectAtIndexedSubscript:v7];

      uint64_t v10 = [v9 pattern];
      uint64_t v11 = [NSString stringWithFormat:@"^(?:%@)$", v10];
      id v12 = [(_NBAsYouTypeFormatter *)self phoneUtil];
      uint64_t v13 = [v12 matchesByRegex:v26 regex:v11];
      uint64_t v14 = [v13 count];

      if (v14) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
    uint64_t v16 = [v9 nationalPrefixFormattingRule];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      id v18 = [(_NBAsYouTypeFormatter *)self NATIONAL_PREFIX_SEPARATORS_PATTERN];
      BOOL v19 = [v9 nationalPrefixFormattingRule];
      v20 = [v9 nationalPrefixFormattingRule];
      int v21 = objc_msgSend(v18, "matchesInString:options:range:", v19, 0, 0, objc_msgSend(v20, "length"));

      -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", [v21 count] != 0);
    }
    else
    {
      [(_NBAsYouTypeFormatter *)self setShouldAddSpaceAfterNationalPrefix_:0];
    }
    uint64_t v22 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    id v23 = [v9 format];
    BOOL v24 = [v22 replaceStringByRegex:v26 regex:v10 withTemplate:v23];

    uint64_t v15 = [(_NBAsYouTypeFormatter *)self appendNationalNumber_:v24];
  }
  else
  {
LABEL_5:
    uint64_t v15 = &stru_26C611188;
  }

  return v15;
}

- (id)appendNationalNumber_:(id)a3
{
  id v4 = a3;
  id v5 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
  uint64_t v6 = [v5 length];

  int v7 = [@" " characterAtIndex:0];
  if (-[_NBAsYouTypeFormatter shouldAddSpaceAfterNationalPrefix](self, "shouldAddSpaceAfterNationalPrefix")&& v6&& (-[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber"), uint64_t v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 characterAtIndex:v6 - 1], v8, v9 != v7))
  {
    id v12 = NSString;
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
    [v12 stringWithFormat:@"%@%@%@", v11, @" ", v4];
  }
  else
  {
    uint64_t v10 = NSString;
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
    [v10 stringWithFormat:@"%@%@", v11, v4, v15];
  uint64_t v13 = };

  return v13;
}

- (unint64_t)getRememberedPosition
{
  if ([(_NBAsYouTypeFormatter *)self ableToFormat])
  {
    v3 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
    id v4 = [(_NBAsYouTypeFormatter *)self currentOutput];
    if ([(_NBAsYouTypeFormatter *)self positionToRemember])
    {
      unint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        if (v6 >= [v4 length]) {
          break;
        }
        int v7 = [v3 characterAtIndex:v5];
        if (v7 == [v4 characterAtIndex:v6]) {
          ++v5;
        }
        ++v6;
      }
      while (v5 < [(_NBAsYouTypeFormatter *)self positionToRemember]);
    }
    else
    {
      unint64_t v6 = 0;
    }

    return v6;
  }
  else
  {
    return [(_NBAsYouTypeFormatter *)self originalPosition];
  }
}

- (id)attemptToChooseFormattingPattern_
{
  v3 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  id v4 = (void *)[v3 copy];

  if ((unint64_t)[v4 length] < 3)
  {
    int v7 = [(_NBAsYouTypeFormatter *)self appendNationalNumber_:v4];
  }
  else
  {
    [(_NBAsYouTypeFormatter *)self getAvailableFormats_:v4];
    unint64_t v5 = [(_NBAsYouTypeFormatter *)self attemptToFormatAccruedDigits];
    if ([v5 length])
    {
      id v6 = v5;
    }
    else
    {
      if ([(_NBAsYouTypeFormatter *)self maybeCreateNewTemplate]) {
        [(_NBAsYouTypeFormatter *)self inputAccruedNationalNumber];
      }
      else {
      id v6 = [(_NBAsYouTypeFormatter *)self accruedInput];
      }
    }
    int v7 = v6;
  }

  return v7;
}

- (id)inputAccruedNationalNumber_
{
  v3 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = &stru_26C611188;
    do
    {
      int v9 = v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%C", objc_msgSend(v4, "characterAtIndex:", v7));
      uint64_t v8 = [(_NBAsYouTypeFormatter *)self inputDigitHelper_:v10];

      ++v7;
    }
    while (v6 != v7);
    if ([(_NBAsYouTypeFormatter *)self ableToFormat]) {
      [(_NBAsYouTypeFormatter *)self appendNationalNumber_:v8];
    }
    else {
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self accruedInput];
    }
  }
  else
  {
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
  }

  return v11;
}

- (BOOL)isNanpaNumberWithNationalPrefix_
{
  v3 = [(_NBAsYouTypeFormatter *)self currentMetaData];
  id v4 = [v3 countryCode];
  int v5 = [v4 isEqual:&unk_26C628D20];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  uint64_t v7 = (void *)[v6 copy];

  BOOL v8 = [v7 characterAtIndex:0] == 49
    && [v7 characterAtIndex:1] != 48
    && [v7 characterAtIndex:1] != 49;

  return v8;
}

- (id)removeNationalPrefixFromNationalNumber_
{
  v3 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  id v4 = (void *)[v3 copy];

  if ([(_NBAsYouTypeFormatter *)self isNanpaNumberWithNationalPrefix])
  {
    int v5 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
    [v5 appendFormat:@"1%@", @" "];

    uint64_t v6 = 1;
    [(_NBAsYouTypeFormatter *)self setIsCompleteNumber_:1];
    goto LABEL_13;
  }
  uint64_t v7 = [(_NBAsYouTypeFormatter *)self currentMetaData];
  uint64_t v6 = [v7 nationalPrefixForParsing];
  if (v6)
  {
    BOOL v8 = [(_NBAsYouTypeFormatter *)self currentMetaData];
    int v9 = [v8 nationalPrefixForParsing];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    uint64_t v11 = NSString;
    id v12 = [(_NBAsYouTypeFormatter *)self currentMetaData];
    uint64_t v13 = [v12 nationalPrefixForParsing];
    uint64_t v7 = [v11 stringWithFormat:@"^(?:%@)", v13];

    uint64_t v14 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    uint64_t v15 = [v14 matchedStringByRegex:v4 regex:v7];

    uint64_t v16 = objc_msgSend(v15, "nb_safeStringAtIndex:", 0);
    uint64_t v17 = v16;
    uint64_t v6 = 0;
    if (v15 && v16)
    {
      if ([v16 length])
      {
        [(_NBAsYouTypeFormatter *)self setIsCompleteNumber_:1];
        uint64_t v6 = [v17 length];
        id v18 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
        BOOL v19 = objc_msgSend(v4, "substringWithRange:", 0, v6);
        [v18 appendString:v19];
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }
LABEL_13:
  v20 = [v4 substringFromIndex:v6];
  int v21 = (void *)[v20 mutableCopy];
  [(_NBAsYouTypeFormatter *)self setNationalNumber_:v21];

  uint64_t v22 = objc_msgSend(v4, "substringWithRange:", 0, v6);

  return v22;
}

- (BOOL)attemptToExtractIdd_
{
  v3 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
  id v4 = (void *)[v3 copy];

  int v5 = NSString;
  uint64_t v6 = [(_NBAsYouTypeFormatter *)self currentMetaData];
  uint64_t v7 = [v6 internationalPrefix];
  BOOL v8 = [v5 stringWithFormat:@"^(?:\\+|%@)", v7];

  int v9 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  uint64_t v10 = [v9 matchedStringByRegex:v4 regex:v8];

  uint64_t v11 = objc_msgSend(v10, "nb_safeStringAtIndex:", 0);
  id v12 = v11;
  BOOL v13 = 0;
  if (v10 && v11)
  {
    if ([v11 length])
    {
      BOOL v13 = 1;
      [(_NBAsYouTypeFormatter *)self setIsCompleteNumber_:1];
      uint64_t v14 = [v12 length];
      uint64_t v15 = [v4 substringFromIndex:v14];
      uint64_t v16 = (void *)[v15 mutableCopy];
      [(_NBAsYouTypeFormatter *)self setNationalNumber_:v16];

      uint64_t v17 = objc_msgSend(v4, "substringWithRange:", 0, v14);
      id v18 = (void *)[v17 mutableCopy];
      [(_NBAsYouTypeFormatter *)self setPrefixBeforeNationalNumber_:v18];

      if ([v4 characterAtIndex:0] != 43)
      {
        BOOL v19 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
        [v19 appendString:@" "];
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)attemptToExtractCountryCallingCode_
{
  v3 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    int v5 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    uint64_t v6 = [(_NBAsYouTypeFormatter *)self nationalNumber];
    BOOL v19 = &stru_26C611188;
    uint64_t v7 = [v5 extractCountryCode:v6 nationalNumber:&v19];
    BOOL v8 = v19;

    char v9 = [v7 isEqualToNumber:&unk_26C628D38];
    if (v9)
    {
LABEL_10:
      char v15 = v9 ^ 1;

      return v15;
    }
    uint64_t v10 = (void *)[(__CFString *)v8 mutableCopy];
    [(_NBAsYouTypeFormatter *)self setNationalNumber_:v10];

    uint64_t v11 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    id v12 = [v11 getRegionCodeForCountryCode:v7];

    if ([@"001" isEqualToString:v12])
    {
      BOOL v13 = objc_alloc_init(_NBMetadataHelper);
      uint64_t v14 = [(_NBMetadataHelper *)v13 getMetadataForNonGeographicalRegion:v7];
      [(_NBAsYouTypeFormatter *)self setCurrentMetaData_:v14];
    }
    else
    {
      uint64_t v16 = [(_NBAsYouTypeFormatter *)self defaultCountry];

      if (v12 == v16)
      {
LABEL_9:
        uint64_t v17 = [(_NBAsYouTypeFormatter *)self prefixBeforeNationalNumber];
        [v17 appendFormat:@"%@%@", v7, @" "];

        goto LABEL_10;
      }
      BOOL v13 = [(_NBAsYouTypeFormatter *)self getMetadataForRegion_:v12];
      [(_NBAsYouTypeFormatter *)self setCurrentMetaData_:v13];
    }

    goto LABEL_9;
  }
  return 0;
}

- (id)normalizeAndAccrueDigitsAndPlusSign_:(id)a3 rememberPosition:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"+"])
  {
    uint64_t v7 = (__CFString *)v6;
    BOOL v8 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
  }
  else
  {
    char v9 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    uint64_t v10 = objc_msgSend(v9, "DIGIT_MAPPINGS");
    uint64_t v7 = [v10 objectForKey:v6];

    if (!v7)
    {
      uint64_t v7 = &stru_26C611188;
      goto LABEL_8;
    }
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
    [v11 appendString:v7];

    BOOL v8 = [(_NBAsYouTypeFormatter *)self nationalNumber];
  }
  id v12 = v8;
  [v8 appendString:v7];

  if (v4)
  {
    BOOL v13 = [(_NBAsYouTypeFormatter *)self accruedInputWithoutFormatting];
    -[_NBAsYouTypeFormatter setPositionToRemember_:](self, "setPositionToRemember_:", [v13 length]);
  }
LABEL_8:

  return v7;
}

- (id)inputDigitHelper_:(id)a3
{
  id v4 = a3;
  int v5 = [(_NBAsYouTypeFormatter *)self formattingTemplate];
  id v6 = (void *)[v5 copy];

  unint64_t v7 = [v6 length];
  if (v7 <= [(_NBAsYouTypeFormatter *)self lastMatchPosition])
  {
    BOOL v8 = &stru_26C611188;
  }
  else
  {
    objc_msgSend(v6, "substringFromIndex:", -[_NBAsYouTypeFormatter lastMatchPosition](self, "lastMatchPosition"));
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  char v9 = [(_NBAsYouTypeFormatter *)self phoneUtil];
  int v10 = [v9 stringPositionByRegex:v8 regex:@" "];

  if (v10 < 0)
  {
    id v18 = [(_NBAsYouTypeFormatter *)self possibleFormats];
    uint64_t v19 = [v18 count];

    if (v19 == 1) {
      [(_NBAsYouTypeFormatter *)self setAbleToFormat_:0];
    }
    [(_NBAsYouTypeFormatter *)self setCurrentFormattingPattern_:&stru_26C611188];
    uint64_t v17 = [(_NBAsYouTypeFormatter *)self accruedInput];
  }
  else
  {
    uint64_t v11 = [(_NBAsYouTypeFormatter *)self phoneUtil];
    int v12 = [v11 stringPositionByRegex:v6 regex:@" "];

    uint64_t v13 = [v6 rangeOfString:@" "];
    char v15 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @" ", v4, 2, v13, v14);
    uint64_t v16 = (void *)[v15 mutableCopy];
    [(_NBAsYouTypeFormatter *)self setFormattingTemplate_:v16];

    [(_NBAsYouTypeFormatter *)self setLastMatchPosition_:v12];
    uint64_t v17 = objc_msgSend(v15, "substringWithRange:", 0, -[_NBAsYouTypeFormatter lastMatchPosition](self, "lastMatchPosition") + 1);
  }

  return v17;
}

- (BOOL)isSuccessfulFormatting
{
  return self->_isSuccessfulFormatting;
}

- (NSString)currentOutput_
{
  return self->_currentOutput_;
}

- (void)setCurrentOutput_:(id)a3
{
}

- (NSString)currentFormattingPattern_
{
  return self->_currentFormattingPattern_;
}

- (void)setCurrentFormattingPattern_:(id)a3
{
}

- (NSString)defaultCountry_
{
  return self->_defaultCountry_;
}

- (void)setDefaultCountry_:(id)a3
{
}

- (NSString)nationalPrefixExtracted_
{
  return self->_nationalPrefixExtracted_;
}

- (void)setNationalPrefixExtracted_:(id)a3
{
}

- (NSMutableString)formattingTemplate_
{
  return self->_formattingTemplate_;
}

- (void)setFormattingTemplate_:(id)a3
{
}

- (NSMutableString)accruedInput_
{
  return self->_accruedInput_;
}

- (void)setAccruedInput_:(id)a3
{
}

- (NSMutableString)prefixBeforeNationalNumber_
{
  return self->_prefixBeforeNationalNumber_;
}

- (void)setPrefixBeforeNationalNumber_:(id)a3
{
}

- (NSMutableString)accruedInputWithoutFormatting_
{
  return self->_accruedInputWithoutFormatting_;
}

- (void)setAccruedInputWithoutFormatting_:(id)a3
{
}

- (NSMutableString)nationalNumber_
{
  return self->_nationalNumber_;
}

- (void)setNationalNumber_:(id)a3
{
}

- (NSRegularExpression)DIGIT_PATTERN_
{
  return self->_DIGIT_PATTERN_;
}

- (void)setDIGIT_PATTERN_:(id)a3
{
}

- (NSRegularExpression)NATIONAL_PREFIX_SEPARATORS_PATTERN_
{
  return self->_NATIONAL_PREFIX_SEPARATORS_PATTERN_;
}

- (void)setNATIONAL_PREFIX_SEPARATORS_PATTERN_:(id)a3
{
}

- (NSRegularExpression)CHARACTER_CLASS_PATTERN_
{
  return self->_CHARACTER_CLASS_PATTERN_;
}

- (void)setCHARACTER_CLASS_PATTERN_:(id)a3
{
}

- (NSRegularExpression)STANDALONE_DIGIT_PATTERN_
{
  return self->_STANDALONE_DIGIT_PATTERN_;
}

- (void)setSTANDALONE_DIGIT_PATTERN_:(id)a3
{
}

- (NSRegularExpression)ELIGIBLE_FORMAT_PATTERN_
{
  return self->_ELIGIBLE_FORMAT_PATTERN_;
}

- (void)setELIGIBLE_FORMAT_PATTERN_:(id)a3
{
}

- (BOOL)ableToFormat_
{
  return self->_ableToFormat_;
}

- (void)setAbleToFormat_:(BOOL)a3
{
  self->_ableToFormat_ = a3;
}

- (BOOL)inputHasFormatting_
{
  return self->_inputHasFormatting_;
}

- (void)setInputHasFormatting_:(BOOL)a3
{
  self->_inputHasFormatting_ = a3;
}

- (BOOL)isCompleteNumber_
{
  return self->_isCompleteNumber_;
}

- (void)setIsCompleteNumber_:(BOOL)a3
{
  self->_isCompleteNumber_ = a3;
}

- (BOOL)isExpectingCountryCallingCode_
{
  return self->_isExpectingCountryCallingCode_;
}

- (void)setIsExpectingCountryCallingCode_:(BOOL)a3
{
  self->_isExpectingCountryCallingCode_ = a3;
}

- (BOOL)shouldAddSpaceAfterNationalPrefix_
{
  return self->_shouldAddSpaceAfterNationalPrefix_;
}

- (void)setShouldAddSpaceAfterNationalPrefix_:(BOOL)a3
{
  self->_shouldAddSpaceAfterNationalPrefix_ = a3;
}

- (_NBPhoneNumberUtil)phoneUtil_
{
  return self->_phoneUtil_;
}

- (void)setPhoneUtil_:(id)a3
{
}

- (unint64_t)lastMatchPosition_
{
  return self->_lastMatchPosition_;
}

- (void)setLastMatchPosition_:(unint64_t)a3
{
  self->_lastMatchPosition_ = a3;
}

- (unint64_t)originalPosition_
{
  return self->_originalPosition_;
}

- (void)setOriginalPosition_:(unint64_t)a3
{
  self->_originalPosition_ = a3;
}

- (unint64_t)positionToRemember_
{
  return self->_positionToRemember_;
}

- (void)setPositionToRemember_:(unint64_t)a3
{
  self->_positionToRemember_ = a3;
}

- (NSMutableArray)possibleFormats_
{
  return self->_possibleFormats_;
}

- (void)setPossibleFormats_:(id)a3
{
}

- (_NBPhoneMetaData)currentMetaData_
{
  return self->_currentMetaData_;
}

- (void)setCurrentMetaData_:(id)a3
{
}

- (_NBPhoneMetaData)defaultMetaData_
{
  return self->_defaultMetaData_;
}

- (void)setDefaultMetaData_:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetaData_, 0);
  objc_storeStrong((id *)&self->_currentMetaData_, 0);
  objc_storeStrong((id *)&self->_possibleFormats_, 0);
  objc_storeStrong((id *)&self->_phoneUtil_, 0);
  objc_storeStrong((id *)&self->_ELIGIBLE_FORMAT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_STANDALONE_DIGIT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_CHARACTER_CLASS_PATTERN_, 0);
  objc_storeStrong((id *)&self->_NATIONAL_PREFIX_SEPARATORS_PATTERN_, 0);
  objc_storeStrong((id *)&self->_DIGIT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_nationalNumber_, 0);
  objc_storeStrong((id *)&self->_accruedInputWithoutFormatting_, 0);
  objc_storeStrong((id *)&self->_prefixBeforeNationalNumber_, 0);
  objc_storeStrong((id *)&self->_accruedInput_, 0);
  objc_storeStrong((id *)&self->_formattingTemplate_, 0);
  objc_storeStrong((id *)&self->_nationalPrefixExtracted_, 0);
  objc_storeStrong((id *)&self->_defaultCountry_, 0);
  objc_storeStrong((id *)&self->_currentFormattingPattern_, 0);

  objc_storeStrong((id *)&self->_currentOutput_, 0);
}

@end