@interface _NBNumberFormat
- (BOOL)nationalPrefixOptionalWhenFormatting;
- (NSArray)leadingDigitsPatterns;
- (NSString)domesticCarrierCodeFormattingRule;
- (NSString)format;
- (NSString)nationalPrefixFormattingRule;
- (NSString)pattern;
- (_NBNumberFormat)initWithEntry:(id)a3;
- (_NBNumberFormat)initWithPattern:(id)a3 withFormat:(id)a4 withLeadingDigitsPatterns:(id)a5 withNationalPrefixFormattingRule:(id)a6 whenFormatting:(BOOL)a7 withDomesticCarrierCodeFormattingRule:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDomesticCarrierCodeFormattingRule:(id)a3;
- (void)setFormat:(id)a3;
- (void)setLeadingDigitsPatterns:(id)a3;
- (void)setNationalPrefixFormattingRule:(id)a3;
- (void)setNationalPrefixOptionalWhenFormatting:(BOOL)a3;
- (void)setPattern:(id)a3;
@end

@implementation _NBNumberFormat

- (_NBNumberFormat)initWithPattern:(id)a3 withFormat:(id)a4 withLeadingDigitsPatterns:(id)a5 withNationalPrefixFormattingRule:(id)a6 whenFormatting:(BOOL)a7 withDomesticCarrierCodeFormattingRule:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_NBNumberFormat;
  v18 = [(_NBNumberFormat *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pattern, a3);
    objc_storeStrong((id *)&v19->_format, a4);
    objc_storeStrong((id *)&v19->_leadingDigitsPatterns, a5);
    objc_storeStrong((id *)&v19->_nationalPrefixFormattingRule, a6);
    v19->_nationalPrefixOptionalWhenFormatting = a7;
    objc_storeStrong((id *)&v19->_domesticCarrierCodeFormattingRule, a8);
  }

  return v19;
}

- (_NBNumberFormat)initWithEntry:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_NBNumberFormat;
  v5 = [(_NBNumberFormat *)&v19 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = objc_msgSend(v4, "nb_safeStringAtIndex:", 1);
    pattern = v6->_pattern;
    v6->_pattern = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v4, "nb_safeStringAtIndex:", 2);
    format = v6->_format;
    v6->_format = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 3);
    leadingDigitsPatterns = v6->_leadingDigitsPatterns;
    v6->_leadingDigitsPatterns = (NSArray *)v11;

    uint64_t v13 = objc_msgSend(v4, "nb_safeStringAtIndex:", 4);
    nationalPrefixFormattingRule = v6->_nationalPrefixFormattingRule;
    v6->_nationalPrefixFormattingRule = (NSString *)v13;

    id v15 = objc_msgSend(v4, "nb_safeNumberAtIndex:", 6);
    v6->_nationalPrefixOptionalWhenFormatting = [v15 BOOLValue];

    uint64_t v16 = objc_msgSend(v4, "nb_safeStringAtIndex:", 5);
    domesticCarrierCodeFormattingRule = v6->_domesticCarrierCodeFormattingRule;
    v6->_domesticCarrierCodeFormattingRule = (NSString *)v16;
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(_NBNumberFormat *)self pattern];
  v5 = [(_NBNumberFormat *)self format];
  v6 = [(_NBNumberFormat *)self leadingDigitsPatterns];
  uint64_t v7 = [(_NBNumberFormat *)self nationalPrefixFormattingRule];
  if ([(_NBNumberFormat *)self nationalPrefixOptionalWhenFormatting]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  uint64_t v9 = [(_NBNumberFormat *)self domesticCarrierCodeFormattingRule];
  v10 = [v3 stringWithFormat:@"[pattern:%@, format:%@, leadingDigitsPattern:%@, nationalPrefixFormattingRule:%@, nationalPrefixOptionalWhenFormatting:%@, domesticCarrierCodeFormattingRule:%@]", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_NBNumberFormat alloc];
  v5 = [(_NBNumberFormat *)self pattern];
  v6 = [(_NBNumberFormat *)self format];
  uint64_t v7 = [(_NBNumberFormat *)self leadingDigitsPatterns];
  v8 = [(_NBNumberFormat *)self nationalPrefixFormattingRule];
  BOOL v9 = [(_NBNumberFormat *)self nationalPrefixOptionalWhenFormatting];
  v10 = [(_NBNumberFormat *)self domesticCarrierCodeFormattingRule];
  uint64_t v11 = [(_NBNumberFormat *)v4 initWithPattern:v5 withFormat:v6 withLeadingDigitsPatterns:v7 withNationalPrefixFormattingRule:v8 whenFormatting:v9 withDomesticCarrierCodeFormattingRule:v10];

  return v11;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)setPattern:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSArray)leadingDigitsPatterns
{
  return self->_leadingDigitsPatterns;
}

- (void)setLeadingDigitsPatterns:(id)a3
{
}

- (NSString)nationalPrefixFormattingRule
{
  return self->_nationalPrefixFormattingRule;
}

- (void)setNationalPrefixFormattingRule:(id)a3
{
}

- (BOOL)nationalPrefixOptionalWhenFormatting
{
  return self->_nationalPrefixOptionalWhenFormatting;
}

- (void)setNationalPrefixOptionalWhenFormatting:(BOOL)a3
{
  self->_nationalPrefixOptionalWhenFormatting = a3;
}

- (NSString)domesticCarrierCodeFormattingRule
{
  return self->_domesticCarrierCodeFormattingRule;
}

- (void)setDomesticCarrierCodeFormattingRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domesticCarrierCodeFormattingRule, 0);
  objc_storeStrong((id *)&self->_nationalPrefixFormattingRule, 0);
  objc_storeStrong((id *)&self->_leadingDigitsPatterns, 0);
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_pattern, 0);
}

@end