@interface FontSettingsStringMatcher
- (BOOL)stringMatchesPattern:(id)a3;
- (FontSettingsStringMatcher)initWithPatternString:(id)a3;
- (NSLocale)currentLocale;
- (NSString)pattern;
- (__CFStringTokenizer)tokenizer;
- (void)dealloc;
- (void)enumerateRangesMatchingPattern:(id)a3 matchingType:(int)a4 withBlock:(id)a5;
- (void)setCurrentLocale:(id)a3;
- (void)setTokenizer:(__CFStringTokenizer *)a3;
@end

@implementation FontSettingsStringMatcher

- (FontSettingsStringMatcher)initWithPatternString:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FontSettingsStringMatcher;
  v6 = [(FontSettingsStringMatcher *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pattern, a3);
    uint64_t v8 = +[NSLocale currentLocale];
    currentLocale = v7->_currentLocale;
    v7->_currentLocale = (NSLocale *)v8;

    v12.location = 0;
    v12.length = 0;
    v7->_tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, 0, v12, 0, (CFLocaleRef)v7->_currentLocale);
  }

  return v7;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)FontSettingsStringMatcher;
  [(FontSettingsStringMatcher *)&v4 dealloc];
}

- (void)enumerateRangesMatchingPattern:(id)a3 matchingType:(int)a4 withBlock:(id)a5
{
  v7 = (__CFString *)a3;
  uint64_t v8 = (void (**)(id, CFIndex, NSUInteger, unsigned char *))a5;
  if (self->_tokenizer)
  {
    if ([(NSString *)self->_pattern length])
    {
      v9 = (char *)[(__CFString *)v7 length];
      NSUInteger v10 = [(NSString *)self->_pattern length];
      v21.CFIndex location = 0;
      v21.length = (CFIndex)v9;
      CFStringTokenizerSetString(self->_tokenizer, v7, v21);
      id v11 = [(__CFString *)v7 localizedStandardRangeOfString:self->_pattern];
      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        for (CFIndex i = (CFIndex)v11;
              i != 0x7FFFFFFFFFFFFFFFLL;
              CFIndex i = (CFIndex)-[__CFString rangeOfString:options:range:locale:](v7, "rangeOfString:options:range:locale:", self->_pattern, 129, i + 1, &v9[~i], self->_currentLocale))
        {
          char v19 = 0;
          char v13 = CFStringTokenizerGoToTokenAtIndex(self->_tokenizer, i);
          if (CFStringTokenizerGetCurrentTokenRange(self->_tokenizer).location == i)
          {
            v8[2](v8, i, v10, &v19);
            if (v19) {
              break;
            }
          }
          if ((v13 & 2) != 0)
          {
            CFIndex CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens(self->_tokenizer, ranges, 32, 0);
            if (CurrentSubTokens >= 1)
            {
              CFIndex v15 = CurrentSubTokens;
              for (CFIndex j = 0; j < v15; ++j)
              {
                while (1)
                {
                  CFIndex location = ranges[j].location;
                  if (location == i) {
                    break;
                  }
                  ++j;
                  if (location > i || j >= v15) {
                    goto LABEL_19;
                  }
                }
                v8[2](v8, i, v10, &v19);
                if (v19) {
                  goto LABEL_4;
                }
              }
            }
          }
LABEL_19:
          ;
        }
      }
    }
  }
LABEL_4:
}

- (BOOL)stringMatchesPattern:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_101F0;
    v7[3] = &unk_1CD10;
    v7[4] = &v8;
    [(FontSettingsStringMatcher *)self enumerateRangesMatchingPattern:v4 matchingType:0 withBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(__CFStringTokenizer *)a3
{
  self->_tokenizer = a3;
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void)setCurrentLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocale, 0);

  objc_storeStrong((id *)&self->_pattern, 0);
}

@end