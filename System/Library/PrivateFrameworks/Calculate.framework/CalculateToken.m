@interface CalculateToken
+ (BOOL)isClose:(unint64_t)a3;
+ (BOOL)isOpen:(unint64_t)a3;
+ (id)tokenWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6;
- (BOOL)isAnyUnknown;
- (BOOL)isClose;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMaybeX;
- (BOOL)isOpen;
- (BOOL)isOperand;
- (BOOL)isOperator;
- (BOOL)isPotentialVariable;
- (BOOL)isXVariable;
- (BOOL)loadedNeedsWhitespaceAfter;
- (BOOL)needsWhitespaceAfter;
- (CalculateToken)initWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6;
- (NSString)normalizedText;
- (NSString)text;
- (UnitRanks)ranks;
- (_NSRange)range;
- (id)description;
- (int)characterType;
- (unint64_t)tokenType;
- (void)setCharacterType:(int)a3;
- (void)setLoadedNeedsWhitespaceAfter:(BOOL)a3;
- (void)setNeedsWhitespaceAfter:(BOOL)a3;
- (void)setNormalizedText:(id)a3;
- (void)setRanks:(id)a3;
- (void)setTokenType:(unint64_t)a3;
@end

@implementation CalculateToken

+ (id)tokenWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a6;
  id v11 = a5;
  v12 = -[CalculateToken initWithType:range:text:ranks:]([CalculateToken alloc], "initWithType:range:text:ranks:", a3, location, length, v11, v10);

  return v12;
}

- (CalculateToken)initWithType:(unint64_t)a3 range:(_NSRange)a4 text:(id)a5 ranks:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CalculateToken;
  v14 = [(CalculateToken *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_tokenType = a3;
    v14->_range.NSUInteger location = location;
    v14->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v14->_text, a5);
    objc_storeStrong((id *)&v15->_ranks, a6);
  }

  return v15;
}

+ (BOOL)isOpen:(unint64_t)a3
{
  return (a3 < 0x32) & (0x2A8002A800100uLL >> a3);
}

- (BOOL)isMaybeX
{
  unint64_t tokenType = self->_tokenType;
  BOOL v3 = tokenType > 0x34;
  uint64_t v4 = (1 << tokenType) & 0x10008000000040;
  BOOL v5 = v3 || v4 == 0;
  if (v5 || self->_range.length != 1) {
    return 0;
  }
  if ([(NSString *)self->_text isEqualToString:@"x"]) {
    return 1;
  }
  text = self->_text;
  return [(NSString *)text isEqualToString:@"X"];
}

+ (BOOL)isClose:(unint64_t)a3
{
  return (a3 < 0x33) & (0x5500055000200uLL >> a3);
}

- (UnitRanks)ranks
{
  return self->_ranks;
}

- (void)setTokenType:(unint64_t)a3
{
  self->_unint64_t tokenType = a3;
}

- (unint64_t)tokenType
{
  return self->_tokenType;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)isOperand
{
  return (self->_tokenType < 0x35) & (0x1000E000000008uLL >> self->_tokenType);
}

- (BOOL)isAnyUnknown
{
  return self->_tokenType - 52 < 3;
}

- (BOOL)isOperator
{
  return (self->_tokenType < 0x25) & (0x140007FCF0uLL >> self->_tokenType);
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isPotentialVariable
{
  int64_t tokenType = self->_tokenType;
  BOOL result = 1;
  if (tokenType <= 38)
  {
    if (tokenType == 2) {
      return result;
    }
    if (tokenType == 35)
    {
      if ([(NSString *)self->_text length] > 1) {
        return 1;
      }
      int64_t tokenType = self->_tokenType;
    }
    goto LABEL_10;
  }
  if (tokenType != 39 && tokenType != 52)
  {
LABEL_10:
    BOOL v5 = (unint64_t)tokenType > 0x26;
    unint64_t v6 = (0x700007E000uLL >> tokenType) & 1;
    if (v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

- (BOOL)needsWhitespaceAfter
{
  unint64_t tokenType = self->_tokenType;
  if (tokenType != 52 && tokenType != 39) {
    return 0;
  }
  if (!self->_loadedNeedsWhitespaceAfter)
  {
    self->_loadedNeedsWhitespaceAfter = 1;
    if ([(NSString *)self->_text length])
    {
      uint64_t v4 = +[CalculateTokenizer nonWhitespaceLanguageSet];
      self->_needsWhitespaceAfter = objc_msgSend(v4, "characterIsMember:", -[NSString characterAtIndex:](self->_text, "characterAtIndex:", 0)) ^ 1;
    }
    else
    {
      self->_needsWhitespaceAfter = 0;
    }
  }
  return self->_needsWhitespaceAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranks, 0);
  objc_storeStrong((id *)&self->_normalizedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setCharacterType:(int)a3
{
  self->_characterType = a3;
}

- (int)characterType
{
  return self->_characterType;
}

- (void)setLoadedNeedsWhitespaceAfter:(BOOL)a3
{
  self->_loadedNeedsWhitespaceAfter = a3;
}

- (BOOL)loadedNeedsWhitespaceAfter
{
  return self->_loadedNeedsWhitespaceAfter;
}

- (void)setNeedsWhitespaceAfter:(BOOL)a3
{
  self->_needsWhitespaceAfter = a3;
}

- (void)setRanks:(id)a3
{
}

- (void)setNormalizedText:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"text: \"%@\", type: %lu, range: [%lu, %lu]", self->_text, self->_tokenType, self->_range.location, self->_range.length];
}

- (BOOL)isXVariable
{
  if (self->_tokenType != 39 || self->_range.length != 1) {
    return 0;
  }
  if ([(NSString *)self->_text isEqualToString:@"x"]) {
    return 1;
  }
  text = self->_text;
  return [(NSString *)text isEqualToString:@"X"];
}

- (BOOL)isClose
{
  return +[CalculateToken isClose:self->_tokenType];
}

- (BOOL)isOpen
{
  return +[CalculateToken isOpen:self->_tokenType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = -[CalculateToken range](self, "range"), v5 == [v4 range])
    && (-[CalculateToken range](self, "range"), uint64_t v7 = v6, [v4 range], v7 == v8))
  {
    unint64_t v9 = [(CalculateToken *)self tokenType];
    BOOL v10 = v9 == [v4 tokenType];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)normalizedText
{
  normalizedText = self->_normalizedText;
  if (!normalizedText) {
    normalizedText = self->_text;
  }
  return normalizedText;
}

@end