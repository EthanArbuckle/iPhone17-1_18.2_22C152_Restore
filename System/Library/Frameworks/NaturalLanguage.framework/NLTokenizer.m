@interface NLTokenizer
- (NLTokenUnit)unit;
- (NLTokenizer)initWithUnit:(NLTokenUnit)unit;
- (NSArray)tokensForRange:(NSRange)range;
- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex;
- (NSRange)tokenRangeForRange:(NSRange)range;
- (NSString)string;
- (const)_tokenAtIndex:(unint64_t)a3;
- (id)_wordCharacterSet;
- (id)language;
- (void)dealloc;
- (void)enumerateTokensInRange:(NSRange)range usingBlock:(void *)block;
- (void)setLanguage:(NLLanguage)language;
- (void)setString:(NSString *)string;
@end

@implementation NLTokenizer

- (NLTokenizer)initWithUnit:(NLTokenUnit)unit
{
  v4 = self;
  if (unit == NLTokenUnitDocument
    && (v11.receiver = self,
        v11.super_class = (Class)NLTokenizer,
        v5 = [(NLTokenizer *)&v11 init],
        (v4 = v5) != 0))
  {
    v5->_unit = 3;
  }
  else
  {
    uint64_t v6 = NLTokenizerCreate();
    if (v6)
    {
      v7 = (__NLTokenizer *)v6;
      v10.receiver = v4;
      v10.super_class = (Class)NLTokenizer;
      v8 = [(NLTokenizer *)&v10 init];
      v4 = v8;
      if (v8)
      {
        v8->_unit = unit;
        v8->_tokenizer = v7;
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  if (self->_tokenizer) {
    NLTokenizerRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLTokenizer;
  [(NLTokenizer *)&v3 dealloc];
}

- (NLTokenUnit)unit
{
  return self->_unit;
}

- (void)setString:(NSString *)string
{
  v5 = string;
  objc_storeStrong((id *)&self->_string, string);
  if (self->_tokenizer)
  {
    [(NSString *)v5 length];
    NLTokenizerSetString();
  }
}

- (NSString)string
{
  return self->_string;
}

- (void)setLanguage:(NLLanguage)language
{
  v4 = language;
  localeIdentifier = v4;
  if (self->_tokenizer)
  {
    CFLocaleRef v5 = CFLocaleCreate(0, v4);
    v4 = localeIdentifier;
    if (v5)
    {
      CFLocaleRef v6 = v5;
      NLTokenizerSetLocale();
      CFRelease(v6);
      v4 = localeIdentifier;
    }
  }
  v7 = (NSString *)[(__CFString *)v4 copy];
  v8 = self->_language;
  self->_language = v7;
}

- (id)language
{
  return self->_language;
}

- (id)_wordCharacterSet
{
  if (_wordCharacterSet_onceToken != -1) {
    dispatch_once(&_wordCharacterSet_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_wordCharacterSet_wordCharacterSet;

  return v2;
}

void __32__NLTokenizer__wordCharacterSet__block_invoke()
{
  id v4 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v4 formUnionWithCharacterSet:v0];
  v1 = ;
  [v4 formUnionWithCharacterSet:v1];

  [v4 invert];
  uint64_t v2 = [v4 copy];
  objc_super v3 = (void *)_wordCharacterSet_wordCharacterSet;
  _wordCharacterSet_wordCharacterSet = v2;
}

- (const)_tokenAtIndex:(unint64_t)a3
{
  if ([(NSString *)self->_string length] <= a3 || !self->_tokenizer) {
    return 0;
  }
  id v4 = (const $BE5D9439A6AC50F82D67159C8E3E9CC4 *)NLTokenizerGoToTokenAtIndex();
  if (v4)
  {
    if ([(NLTokenizer *)self unit] == NLTokenUnitWord)
    {
      int64_t var0 = v4->var0.var0;
      int64_t var1 = v4->var0.var1;
      string = self->_string;
      v8 = [(NLTokenizer *)self _wordCharacterSet];
      -[NSString rangeOfCharacterFromSet:options:range:](string, "rangeOfCharacterFromSet:options:range:", v8, 0, var0, var1);
      uint64_t v10 = v9;

      if (!v10) {
        return 0;
      }
    }
  }
  return v4;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex
{
  NSUInteger v5 = [(NSString *)self->_string length];
  if (v5 <= characterIndex) {
    goto LABEL_7;
  }
  NSUInteger var1 = v5;
  if ([(NLTokenizer *)self unit] != NLTokenUnitDocument)
  {
    if (self->_tokenizer)
    {
      v8 = [(NLTokenizer *)self _tokenAtIndex:characterIndex];
      if (v8)
      {
        uint64_t v9 = v8;
        NSUInteger var0 = v8->var0.var0;
        NSUInteger var1 = v9->var0.var1;
        goto LABEL_8;
      }
    }
LABEL_7:
    NSUInteger var1 = 0;
    NSUInteger var0 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  NSUInteger var0 = 0;
LABEL_8:
  NSUInteger v10 = var1;
  result.length = v10;
  result.location = var0;
  return result;
}

- (NSRange)tokenRangeForRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = [(NSString *)self->_string length];
  if (v6 <= location) {
    goto LABEL_16;
  }
  NSUInteger var1 = v6;
  if (location + length <= v6) {
    NSUInteger v8 = length;
  }
  else {
    NSUInteger v8 = v6 - location;
  }
  if ([(NLTokenizer *)self unit] == NLTokenUnitDocument)
  {
    uint64_t var0 = 0;
    goto LABEL_17;
  }
  if (!self->_tokenizer)
  {
LABEL_16:
    NSUInteger var1 = 0;
    uint64_t var0 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  NSUInteger v10 = [(NLTokenizer *)self _tokenAtIndex:location];
  if (!v10)
  {
    if ([(NLTokenizer *)self unit] == NLTokenUnitWord)
    {
      NSUInteger v18 = v8 + location;
      NSUInteger v19 = location;
      while (v19 < v18)
      {
        uint64_t v20 = [(NSString *)self->_string rangeOfComposedCharacterSequenceAtIndex:v19];
        NSUInteger v22 = v20 + v21;
        if (v20 + v21 <= v19 || v22 >= v18) {
          break;
        }
        NSUInteger v10 = [(NLTokenizer *)self _tokenAtIndex:v22];
        NSUInteger v19 = v22;
        if (v10) {
          goto LABEL_9;
        }
      }
    }
    goto LABEL_16;
  }
LABEL_9:
  uint64_t var0 = v10->var0.var0;
  NSUInteger var1 = v10->var0.var1;
  if (v8)
  {
    unint64_t v11 = var1 + var0;
    NSUInteger v12 = v8 + location;
    if (var1 + var0 < v8 + location)
    {
      unint64_t v13 = v12 - 1;
      v14 = [(NLTokenizer *)self _tokenAtIndex:v12 - 1];
      if (v14)
      {
LABEL_12:
        unint64_t v15 = v14->var0.var1 + v14->var0.var0;
        if (v15 > v11) {
          NSUInteger var1 = v15 - var0;
        }
      }
      else if ([(NLTokenizer *)self unit] == NLTokenUnitWord)
      {
        while (v13 > v11)
        {
          unint64_t v24 = [(NSString *)self->_string rangeOfComposedCharacterSequenceAtIndex:v13 - 1];
          if (v24 >= v13 || v24 < v11) {
            break;
          }
          unint64_t v26 = v24;
          v14 = [(NLTokenizer *)self _tokenAtIndex:v24];
          unint64_t v13 = v26;
          if (v14) {
            goto LABEL_12;
          }
        }
      }
    }
  }
LABEL_17:
  NSUInteger v16 = var0;
  NSUInteger v17 = var1;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (NSArray)tokensForRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__NLTokenizer_tokensForRange___block_invoke;
  v9[3] = &unk_1E5C545F8;
  id v7 = v6;
  id v10 = v7;
  -[NLTokenizer enumerateTokensInRange:usingBlock:](self, "enumerateTokensInRange:usingBlock:", location, length, v9);

  return (NSArray *)v7;
}

void __30__NLTokenizer_tokensForRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (void)enumerateTokensInRange:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v7 = block;
  NSUInteger v8 = [(NSString *)self->_string length];
  char v39 = 0;
  NLTokenUnit v9 = [(NLTokenizer *)self unit];
  id v10 = [(NLTokenizer *)self _wordCharacterSet];
  if (enumerateTokensInRange_usingBlock__onceToken != -1) {
    dispatch_once(&enumerateTokensInRange_usingBlock__onceToken, &__block_literal_global_9);
  }
  NSUInteger v11 = location + length;
  if (location + length <= v8)
  {
    if ([(NLTokenizer *)self unit] == NLTokenUnitDocument)
    {
      (*((void (**)(void *, void, NSUInteger, void, char *))v7 + 2))(v7, 0, v8, 0, &v39);
      goto LABEL_34;
    }
    if (!self->_tokenizer) {
      goto LABEL_34;
    }
    NextToken = (NSUInteger *)NLTokenizerGoToTokenAtIndex();
    if (!NextToken)
    {
      if ([(NLTokenizer *)self unit]) {
        goto LABEL_34;
      }
      NSUInteger v30 = location;
      do
      {
        if (v30 >= v11) {
          goto LABEL_34;
        }
        uint64_t v31 = [(NSString *)self->_string rangeOfComposedCharacterSequenceAtIndex:v30];
        NSUInteger v33 = v31 + v32;
        if (v31 + v32 <= v30 || v33 >= v11) {
          goto LABEL_34;
        }
        uint64_t v35 = NLTokenizerGoToTokenAtIndex();
        NSUInteger v30 = v33;
      }
      while (!v35);
      NextToken = (NSUInteger *)v35;
    }
    NLTokenUnit v36 = v9;
    v37 = v10;
    NSUInteger v38 = location;
    while (1)
    {
      uint64_t v13 = NextToken[1];
      if (v13 < 1) {
        goto LABEL_34;
      }
      NSUInteger v14 = *NextToken;
      NSUInteger v15 = *NextToken + v13;
      if (*NextToken >= v11 || v15 < location) {
        goto LABEL_34;
      }
      if (v9) {
        break;
      }
      -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", v10, 0, *NextToken, NextToken[1]);
      if (v18)
      {
        uint64_t v17 = (NextToken[2] >> 3) & 1;
        if (v14 < v15)
        {
          NSUInteger v19 = v14;
          do
          {
            uint64_t v20 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet, 0, v19, v15 - v19);
            if (!v21) {
              break;
            }
            uint64_t v22 = v20;
            uint64_t v23 = v21;
            uint64_t v24 = [(NSString *)self->_string rangeOfComposedCharacterSequenceAtIndex:v20];
            if (v24 + v25 <= v15)
            {
              uint64_t v23 = v25;
              uint64_t v22 = v24;
            }
            -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet, 0, v22, v23);
            if (v26)
            {
              v27 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v22, v23);
              int v28 = CEMStringContainsEmoji();
              uint64_t v29 = 4;
              if (!v28) {
                uint64_t v29 = 2;
              }
              v17 |= v29;
            }
            NSUInteger v19 = v22 + v23;
          }
          while (v22 + v23 < v15);
        }
        goto LABEL_17;
      }
LABEL_18:
      if (!v39)
      {
        NextToken = (NSUInteger *)NLTokenizerGetNextToken();
        if (NextToken) {
          continue;
        }
      }
      goto LABEL_34;
    }
    uint64_t v17 = 0;
LABEL_17:
    (*((void (**)(void *, NSUInteger, uint64_t, uint64_t, char *))v7 + 2))(v7, v14, v13, v17, &v39);
    id v10 = v37;
    NSUInteger location = v38;
    NLTokenUnit v9 = v36;
    goto LABEL_18;
  }
LABEL_34:
}

void __49__NLTokenizer_enumerateTokensInRange_usingBlock___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  uint64_t v1 = [v0 invertedSet];
  uint64_t v2 = (void *)enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet;
  enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet = v1;

  id v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"':_-’"];
  uint64_t v3 = [v5 invertedSet];
  id v4 = (void *)enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet;
  enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end