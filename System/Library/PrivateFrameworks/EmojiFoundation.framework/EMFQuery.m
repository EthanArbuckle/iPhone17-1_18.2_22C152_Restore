@interface EMFQuery
- (EMFQuery)initWithLocale:(id)a3;
- (EMFQuery)initWithQueryString:(id)a3 andLocale:(id)a4;
- (EMFQuery)initWithQueryString:(id)a3 andQueryTokens:(id)a4 andLocale:(id)a5;
- (EMFQuery)initWithQueryTokens:(id)a3 andLocale:(id)a4;
- (EMFStringStemmer)stringStemmer;
- (NSArray)tokens;
- (NSLocale)locale;
- (NSString)normalizedQueryString;
- (NSString)queryString;
- (NSString)trimmedQueryString;
- (id)_finalTokenAnalyzed:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)finalTokenAnalyzed;
- (id)finalTokenUnanalyzed;
- (id)tokenCounts;
- (void)reset;
- (void)setQueryString:(id)a3;
- (void)setStringStemmer:(id)a3;
- (void)setTokens:(id)a3;
- (void)tokens;
@end

@implementation EMFQuery

- (EMFQuery)initWithQueryString:(id)a3 andLocale:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _createNormalizedString(v7, v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  normalizedString = self->_normalizedString;
  self->_normalizedString = v8;

  v10 = [(EMFQuery *)self initWithQueryString:v7 andQueryTokens:0 andLocale:v6];
  return v10;
}

- (EMFQuery)initWithQueryString:(id)a3 andQueryTokens:(id)a4 andLocale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EMFQuery;
  v11 = [(EMFQuery *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    queryTokens = v11->_queryTokens;
    v11->_queryTokens = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_queryTokensAnalyzed, v11->_queryTokens);
    objc_storeStrong((id *)&v11->_locale, a5);
  }

  return v11;
}

- (EMFQuery)initWithLocale:(id)a3
{
  return [(EMFQuery *)self initWithQueryString:0 andQueryTokens:0 andLocale:a3];
}

- (EMFQuery)initWithQueryTokens:(id)a3 andLocale:(id)a4
{
  return [(EMFQuery *)self initWithQueryString:0 andQueryTokens:a3 andLocale:a4];
}

- (id)finalTokenAnalyzed
{
  return [(EMFQuery *)self _finalTokenAnalyzed:1];
}

- (id)finalTokenUnanalyzed
{
  return [(EMFQuery *)self _finalTokenAnalyzed:0];
}

- (NSString)trimmedQueryString
{
  v2 = [(EMFQuery *)self queryString];
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return (NSString *)v4;
}

- (NSString)normalizedQueryString
{
  v3 = [(EMFQuery *)self trimmedQueryString];
  v4 = _createNormalizedString(v3, self->_locale);

  return (NSString *)v4;
}

- (void)setQueryString:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  queryString = self->_queryString;
  self->_queryString = v5;

  _createNormalizedString(v4, self->_locale);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  normalizedString = self->_normalizedString;
  self->_normalizedString = v7;

  queryTokens = self->_queryTokens;
  self->_queryTokens = 0;
}

- (void)setTokens:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&self->_queryTokens, v4);
  id v6 = v4;
  queryTokensAnalyzed = self->_queryTokensAnalyzed;
  self->_queryTokensAnalyzed = 0;
}

- (NSArray)tokens
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_queryTokens)
  {
    v3 = _createTokensForString(self->_normalizedString, self->_locale);
    id v4 = v3;
    stringStemmer = self->_stringStemmer;
    if (stringStemmer)
    {
      uint64_t v6 = _createStemmedTokensForTokenArray(v3, stringStemmer);
      if (!v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[EMFQuery tokens]((id *)&self->_locale);
        }
        __assert_rtn("-[EMFQuery tokens]", "EMFQuery.m", 150, "stemmedTokens");
      }
      id v7 = (void *)v6;

      id v4 = v7;
    }
    id v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v4;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", &stru_1F126FA78, (void)v21) & 1) == 0) {
            [(NSArray *)v8 addObject:v14];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    queryTokens = self->_queryTokens;
    self->_queryTokens = v9;
    v16 = v9;

    queryTokensAnalyzed = self->_queryTokensAnalyzed;
    self->_queryTokensAnalyzed = v8;
  }
  if (self->_queryString && (v18 = self->_queryTokensAnalyzed) != 0) {
    v19 = (NSArray *)[(NSArray *)v18 copy];
  }
  else {
    v19 = self->_queryTokens;
  }
  return v19;
}

- (id)tokenCounts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(EMFQuery *)self tokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKey:v9];
        if (v10) {
          uint64_t v11 = (void *)v10;
        }
        else {
          uint64_t v11 = &unk_1F12868D8;
        }
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);

        [v3 setObject:v12 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)reset
{
  self->_queryTokens = 0;
  MEMORY[0x1F41817F8]();
}

- (id)_finalTokenAnalyzed:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(EMFQuery *)self tokens];
    id v4 = [v3 lastObject];
  }
  else
  {
    id v4 = [(NSArray *)self->_queryTokens lastObject];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithQueryString:self->_queryString andQueryTokens:self->_queryTokens andLocale:self->_locale];
  [v4 setStringStemmer:self->_stringStemmer];
  return v4;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (EMFStringStemmer)stringStemmer
{
  return self->_stringStemmer;
}

- (void)setStringStemmer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringStemmer, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_queryTokensAnalyzed, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
}

- (void)tokens
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [*a1 localeIdentifier];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_error_impl(&dword_1B8C45000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Stemming failed for locale %@", (uint8_t *)&v2, 0xCu);
}

@end