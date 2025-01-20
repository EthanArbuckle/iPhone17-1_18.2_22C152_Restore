@interface EMSearchableIndexQueryExpression
+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3;
+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5;
- (BOOL)isValid;
- (CSSuggestion)updatedSuggestion;
- (EMSearchableIndexQueryExpression)init;
- (EMSearchableIndexQueryExpression)initWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5;
- (NSString)ef_publicDescription;
- (NSString)queryString;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setQueryString:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation EMSearchableIndexQueryExpression

+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithQueryString:v4 searchString:0 updatedSuggestion:0];

  return (EMSearchableIndexQueryExpression *)v5;
}

+ (EMSearchableIndexQueryExpression)expressionWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithQueryString:v8 searchString:v9 updatedSuggestion:v10];

  return (EMSearchableIndexQueryExpression *)v11;
}

- (EMSearchableIndexQueryExpression)init
{
}

- (EMSearchableIndexQueryExpression)initWithQueryString:(id)a3 searchString:(id)a4 updatedSuggestion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexQueryExpression;
  v11 = [(EMSearchableIndexQueryExpression *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    searchString = v11->_searchString;
    v11->_searchString = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    updatedSuggestion = v11->_updatedSuggestion;
    v11->_updatedSuggestion = (CSSuggestion *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(EMSearchableIndexQueryExpression *)self queryString];
  v6 = [(EMSearchableIndexQueryExpression *)self searchString];
  v7 = [(EMSearchableIndexQueryExpression *)self updatedSuggestion];
  id v8 = (void *)[v4 initWithQueryString:v5 searchString:v6 updatedSuggestion:v7];

  return v8;
}

- (NSString)ef_publicDescription
{
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F60E00];
    v6 = [(EMSearchableIndexQueryExpression *)self searchString];
    uint64_t v7 = [v5 partiallyRedactedStringForString:v6];

    uint64_t v8 = [(EMSearchableIndexQueryExpression *)self updatedSuggestion];
    id v9 = [(EMSearchableIndexQueryExpression *)self queryString];
    id v10 = v9;
    if (v7 | v8)
    {
      v11 = NSString;
      uint64_t v12 = +[EMCSLoggingAdditions publicDescriptionForSuggestion:v8];
      v13 = [v11 stringWithFormat:@"(%@) %@ %@", v7, v12, v10];
    }
    else
    {
      id v10 = v9;
      v13 = v10;
    }
  }
  else
  {
    uint64_t v14 = NSString;
    v15 = (void *)MEMORY[0x1E4F60E00];
    uint64_t v7 = [(EMSearchableIndexQueryExpression *)self searchString];
    uint64_t v8 = [v15 partiallyRedactedStringForString:v7];
    id v10 = [(EMSearchableIndexQueryExpression *)self updatedSuggestion];
    uint64_t v16 = [(EMSearchableIndexQueryExpression *)self queryString];
    v13 = [v14 stringWithFormat:@"(%@) %p queryString %{BOOL}d", v8, v10, v16 != 0];
  }
  return (NSString *)v13;
}

- (BOOL)isValid
{
  v3 = [(EMSearchableIndexQueryExpression *)self queryString];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(EMSearchableIndexQueryExpression *)self searchString];
    if ([v5 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(EMSearchableIndexQueryExpression *)self updatedSuggestion];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (CSSuggestion)updatedSuggestion
{
  return self->_updatedSuggestion;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_updatedSuggestion, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end