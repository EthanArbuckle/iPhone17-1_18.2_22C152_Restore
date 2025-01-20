@interface BRLTTranslationParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isPartial;
- (BOOL)useTechnicalTableIfPossible;
- (BRLTTextFormattingRanges)textFormattingRanges;
- (BRLTTranslationParameters)initWithCoder:(id)a3;
- (BRLTTranslationParameters)initWithLanguage:(id)a3 mode:(unint64_t)a4 partial:(BOOL)a5 useTechnicalTable:(BOOL)a6 textPositionsRange:(_NSRange)a7 textFormattingRanges:(id)a8;
- (NSString)language;
- (_NSRange)textPositionsRange;
- (id)description;
- (unint64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRLTTranslationParameters

- (BRLTTranslationParameters)initWithLanguage:(id)a3 mode:(unint64_t)a4 partial:(BOOL)a5 useTechnicalTable:(BOOL)a6 textPositionsRange:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BRLTTranslationParameters;
  v16 = [(BRLTTranslationParameters *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    language = v16->_language;
    v16->_language = (NSString *)v17;

    v16->_mode = a4;
    v16->_partial = a5;
    v16->_useTechnicalTableIfPossible = a6;
    v16->_textPositionsRange.NSUInteger location = location;
    v16->_textPositionsRange.NSUInteger length = length;
    objc_storeStrong((id *)&v16->_textFormattingRanges, a8);
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)BRLTTranslationParameters;
  v4 = [(BRLTTranslationParameters *)&v13 description];
  v5 = [(BRLTTranslationParameters *)self language];
  unint64_t v6 = [(BRLTTranslationParameters *)self mode] - 1;
  if (v6 > 3) {
    v7 = @"?";
  }
  else {
    v7 = off_26440BB50[v6];
  }
  if ([(BRLTTranslationParameters *)self isPartial]) {
    v8 = " partial";
  }
  else {
    v8 = "";
  }
  if ([(BRLTTranslationParameters *)self useTechnicalTableIfPossible]) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  v15.NSUInteger location = [(BRLTTranslationParameters *)self textPositionsRange];
  v10 = NSStringFromRange(v15);
  v11 = [v3 stringWithFormat:@"<%@ lang:%@ mode:%@%s useTechnicalTable:%s pos:%@>", v4, v5, v7, v8, v9, v10];

  return v11;
}

- (BRLTTranslationParameters)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRLTTranslationParameters;
  v5 = [(BRLTTranslationParameters *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v6;

    v5->_mode = [v4 decodeIntegerForKey:@"mode"];
    v5->_partial = [v4 decodeBoolForKey:@"partial"];
    v5->_useTechnicalTableIfPossible = [v4 decodeBoolForKey:@"useTechnicalTable"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textPositionsRange"];
    v5->_textPositionsRange.NSUInteger location = [v8 rangeValue];
    v5->_textPositionsRange.NSUInteger length = v9;

    v10 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"textFormatting"];
    textFormattingRanges = v5->_textFormattingRanges;
    v5->_textFormattingRanges = (BRLTTextFormattingRanges *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BRLTTranslationParameters *)self language];
  [v4 encodeObject:v5 forKey:@"language"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BRLTTranslationParameters mode](self, "mode"), @"mode");
  objc_msgSend(v4, "encodeBool:forKey:", -[BRLTTranslationParameters isPartial](self, "isPartial"), @"partial");
  objc_msgSend(v4, "encodeBool:forKey:", -[BRLTTranslationParameters useTechnicalTableIfPossible](self, "useTechnicalTableIfPossible"), @"useTechnicalTable");
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  uint64_t v7 = [(BRLTTranslationParameters *)self textPositionsRange];
  NSUInteger v9 = objc_msgSend(v6, "valueWithRange:", v7, v8);
  [v4 encodeObject:v9 forKey:@"textPositionsRange"];

  id v10 = [(BRLTTranslationParameters *)self textFormattingRanges];
  [v4 encodeObject:v10 forKey:@"textFormatting"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (BOOL)useTechnicalTableIfPossible
{
  return self->_useTechnicalTableIfPossible;
}

- (_NSRange)textPositionsRange
{
  NSUInteger length = self->_textPositionsRange.length;
  NSUInteger location = self->_textPositionsRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BRLTTextFormattingRanges)textFormattingRanges
{
  return self->_textFormattingRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFormattingRanges, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end