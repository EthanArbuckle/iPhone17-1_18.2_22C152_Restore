@interface CDMTokenChain
+ (id)convertCDMTokenChainToProtoTokenChain:(id)a3;
- (CDMTokenChain)initWithProtoTokenChain:(id)a3;
- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4;
- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5;
- (NSArray)tokens;
- (NSString)locale;
- (NSString)string;
- (id)cleanStringFromToken:(int64_t)a3 toToken:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dropInsignificantTokens;
- (id)dropWhitespaceTokens;
- (id)extractTokens;
- (id)normalizedString;
- (int)tokenIndexFromCharacterIndex:(int64_t)a3;
- (unsigned)nonWhiteSpaceCountFromToken:(int64_t)a3 toToken:(int64_t)a4;
- (void)addToken:(id)a3;
@end

@implementation CDMTokenChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_characterToTokenIndexMapping, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)string
{
  return self->_string;
}

- (id)extractTokens
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = self->_tokens;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v3)
  {
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v4 = 0;
      uint64_t v28 = v3;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v31 + 1) + 8 * v4);
        memset(&__p, 0, sizeof(__p));
        if (([v5 isWhiteSpace] & 1) == 0)
        {
          CFStringRef v6 = [v5 cleanValue];
          v7 = (__CFString *)v6;
          memset(&v29, 0, sizeof(v29));
          if (v6)
          {
            CFIndex Length = CFStringGetLength(v6);
            std::basic_string<char16_t>::resize(&v29, Length, v9);
            if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v10 = &v29;
            }
            else {
              v10 = (std::basic_string<char16_t> *)v29.__r_.__value_.__r.__words[0];
            }
            v38.location = 0;
            v38.length = Length;
            CFStringGetCharacters(v7, v38, (UniChar *)v10);
          }

          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          std::basic_string<char16_t> __p = v29;
          *((unsigned char *)&v29.__r_.__value_.__s + 23) = 0;
          v29.__r_.__value_.__s.__data_[0] = 0;
        }
        std::basic_string<char16_t>::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        char v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::basic_string<char16_t>::size_type size = __p.__r_.__value_.__l.__size_;
        }
        if (size)
        {
          v13 = [CDMToken alloc];
          v14 = [v5 value];
          uint64_t v15 = [v5 begin];
          uint64_t v16 = [v5 end];
          uint64_t v17 = [v5 isSignificant];
          uint64_t v18 = [v5 isWhiteSpace];
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::basic_string<char16_t>::size_type v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::basic_string<char16_t>::size_type v20 = __p.__r_.__value_.__l.__size_;
          }
          v21 = [NSString stringWithCharacters:p_p length:v20];
          v22 = -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:](v13, "initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:", v14, v15, v16, v17, v18, v21, [v5 tokenIndex], objc_msgSend(v5, "nonWhitespaceTokenIndex"));

          [v26 addObject:v22];
          char v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        if (v12 < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        ++v4;
      }
      while (v28 != v4);
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v3);
  }

  v23 = (void *)[v26 copy];
  return v23;
}

- (id)dropInsignificantTokens
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:self->_string locale:self->_locale];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_tokens copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        std::basic_string<char16_t>::value_type v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSignificant", (void)v11)) {
          [v3 addToken:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)dropWhitespaceTokens
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:self->_string locale:self->_locale];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_tokens copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        std::basic_string<char16_t>::value_type v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isWhiteSpace", (void)v11) & 1) == 0) {
          [v3 addToken:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int)tokenIndexFromCharacterIndex:(int64_t)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_characterToTokenIndexMapping objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"{ string:%@ locale:%@ tokens: [", self->_string, self->_locale];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v4 = self->_tokens;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) description];
        [v3 appendString:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [v3 appendString:@"]}"];
  return v3;
}

- (unsigned)nonWhiteSpaceCountFromToken:(int64_t)a3 toToken:(int64_t)a4
{
  unint64_t v7 = [(NSMutableArray *)self->_tokens count];
  unsigned int v8 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v7 > a3 && a3 < a4)
  {
    unsigned int v8 = 0;
    do
    {
      if (a3 >= (unint64_t)[(NSMutableArray *)self->_tokens count]) {
        break;
      }
      long long v10 = [(NSMutableArray *)self->_tokens objectAtIndexedSubscript:a3];
      int v11 = [v10 isWhiteSpace];

      v8 += v11 ^ 1;
      ++a3;
    }
    while (a4 != a3);
  }
  return v8;
}

- (id)cleanStringFromToken:(int64_t)a3 toToken:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v7 = [MEMORY[0x263F089D8] string];
  if ([(NSMutableArray *)self->_tokens count] > (unint64_t)a3 && a3 <= a4)
  {
    do
    {
      if (a3 >= (unint64_t)[(NSMutableArray *)self->_tokens count]) {
        break;
      }
      std::basic_string<char16_t>::value_type v9 = [(NSMutableArray *)self->_tokens objectAtIndexedSubscript:a3];
      int v10 = [v9 getHasCleanValues];

      if (v10)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        int v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3, 0);
        long long v12 = [v11 cleanValues];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              [v7 appendString:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v13);
        }
      }
      else
      {
        long long v12 = [(NSMutableArray *)self->_tokens objectAtIndexedSubscript:a3];
        uint64_t v16 = [v12 value];
        [v7 appendString:v16];
      }
    }
    while (a3++ != a4);
  }
  return v7;
}

- (id)normalizedString
{
  uint64_t v3 = [(NSMutableArray *)self->_tokens count] - 1;
  return [(CDMTokenChain *)self cleanStringFromToken:0 toToken:v3];
}

- (void)addToken:(id)a3
{
  id v10 = a3;
  -[NSMutableArray addObject:](self->_tokens, "addObject:");
  if ([v10 isWhiteSpace])
  {
    for (uint64_t i = [v10 begin]; i < objc_msgSend(v10, "end"); ++i)
    {
      characterToTokenIndexMapping = self->_characterToTokenIndexMapping;
      uint64_t v6 = [NSNumber numberWithInt:0xFFFFFFFFLL];
      [(NSMutableArray *)characterToTokenIndexMapping addObject:v6];
    }
  }
  else
  {
    for (uint64_t j = [v10 begin]; j < objc_msgSend(v10, "end"); ++j)
    {
      unsigned int v8 = self->_characterToTokenIndexMapping;
      std::basic_string<char16_t>::value_type v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "tokenIndex"));
      [(NSMutableArray *)v8 addObject:v9];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:self->_string locale:self->_locale];
  if (v4)
  {
    uint64_t v5 = [(NSMutableArray *)self->_tokens copy];
    uint64_t v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(NSMutableArray *)self->_characterToTokenIndexMapping copy];
    unsigned int v8 = (void *)v4[2];
    v4[2] = v7;
  }
  return v4;
}

- (CDMTokenChain)initWithProtoTokenChain:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = [v4 locale];
  uint64_t v7 = [(CDMTokenChain *)self initWithString:v5 locale:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v8 = objc_msgSend(v4, "tokens", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [[CDMToken alloc] initWithProtoToken:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        [(CDMTokenChain *)v7 addToken:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [(CDMTokenChain *)self initWithString:a3 locale:a4];
  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          -[CDMTokenChain addToken:](v9, "addToken:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  return v9;
}

- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDMTokenChain;
  id v8 = [(CDMTokenChain *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    locale = v8->_locale;
    v8->_locale = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    tokens = v8->_tokens;
    v8->_tokens = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    characterToTokenIndexMapping = v8->_characterToTokenIndexMapping;
    v8->_characterToTokenIndexMapping = (NSMutableArray *)v15;
  }
  return v8;
}

+ (id)convertCDMTokenChainToProtoTokenChain:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F71F28]);
  if (v3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v20 = v3;
    uint64_t v5 = [v3 tokens];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v10 = objc_alloc_init(MEMORY[0x263F71F20]);
          objc_msgSend(v10, "setBegin:", objc_msgSend(v9, "begin"));
          objc_msgSend(v10, "setEnd:", objc_msgSend(v9, "end"));
          uint64_t v11 = [v9 value];
          [v10 setValue:v11];

          objc_msgSend(v10, "setIsSignificant:", objc_msgSend(v9, "isSignificant"));
          objc_msgSend(v10, "setIsWhitespace:", objc_msgSend(v9, "isWhiteSpace"));
          uint64_t v12 = [v9 cleanValues];
          uint64_t v13 = (void *)[v12 copy];
          [v10 setCleanValues:v13];

          long long v14 = [v9 cleanValue];
          [v10 setCleanValue:v14];

          objc_msgSend(v10, "setTokenIndex:", objc_msgSend(v9, "tokenIndex"));
          objc_msgSend(v10, "setNonWhitespaceTokenIndex:", objc_msgSend(v9, "nonWhitespaceTokenIndex"));
          uint64_t v15 = [v9 normalizedValues];
          long long v16 = (void *)[v15 copy];
          [v10 setNormalizedValues:v16];

          [v4 addTokens:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    long long v17 = [v20 locale];
    [v4 setLocale:v17];

    objc_super v18 = [v20 string];
    [v4 setStringValue:v18];

    id v3 = v20;
  }

  return v4;
}

@end