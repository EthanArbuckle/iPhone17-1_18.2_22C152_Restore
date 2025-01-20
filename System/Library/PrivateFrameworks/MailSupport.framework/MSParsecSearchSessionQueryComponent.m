@interface MSParsecSearchSessionQueryComponent
+ (OS_os_log)log;
+ (id)_structuredQueryForComponents:(id)a3 hasCurrentMailboxScope:(BOOL)a4 languages:(id)a5;
+ (id)freeTextQueryComponentWithString:(id)a3;
+ (id)suggestionAtomQueryComponentWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6;
+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokenString:(id)a4;
+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokens:(id)a4;
- (BOOL)cannedSuggestion;
- (MSParsecSearchSessionQueryComponent)initWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6;
- (NSString)category;
- (NSString)queryString;
- (NSString)scope;
- (id)_structuredQueryComponentWithLanguages:(id)a3;
@end

@implementation MSParsecSearchSessionQueryComponent

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSParsecSearchSessionQueryComponent_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __42__MSParsecSearchSessionQueryComponent_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

+ (id)freeTextQueryComponentWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCategory:@"free_text" scope:0 queryString:v4 cannedSuggestion:0];

  return v5;
}

+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokens:(id)a4
{
  id v5 = a3;
  v6 = [a4 componentsJoinedByString:@" "];
  v7 = +[MSParsecSearchSessionQueryComponent userTypedQueryComponentWithString:v5 removingFreeTextTokenString:v6];

  return v7;
}

+ (id)userTypedQueryComponentWithString:(id)a3 removingFreeTextTokenString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if ([v7 length])
  {
    uint64_t v10 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, &stru_1F1AA2F90, 8, 0, objc_msgSend(v7, "length"));

    v9 = (void *)v10;
  }
  if ([v9 length]) {
    v11 = (void *)[objc_alloc((Class)a1) initWithCategory:@"user_typed" scope:0 queryString:v9 cannedSuggestion:0];
  }
  else {
    v11 = 0;
  }

  return v11;
}

+ (id)suggestionAtomQueryComponentWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[objc_alloc((Class)a1) initWithCategory:v10 scope:v11 queryString:v12 cannedSuggestion:v6];

  return v13;
}

+ (id)_structuredQueryForComponents:(id)a3 hasCurrentMailboxScope:(BOOL)a4 languages:(id)a5
{
  BOOL v6 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke;
    v20 = &unk_1E63FEE38;
    id v21 = v8;
    id v10 = objc_msgSend(v7, "ef_compactMap:", &v17);
    objc_msgSend(v9, "addObjectsFromArray:", v10, v17, v18, v19, v20);
    id v11 = @"all";
    if (v6) {
      id v11 = @"curr";
    }
    id v12 = v11;
    v22 = @"mf";
    v23[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [v9 addObject:v13];
  }
  v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:0];
  v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];

  return v15;
}

id __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA98] null];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    BOOL v6 = +[MSParsecSearchSessionQueryComponent log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke_cold_1(v6);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = [v3 _structuredQueryComponentWithLanguages:*(void *)(a1 + 32)];
  }

  return v7;
}

- (MSParsecSearchSessionQueryComponent)initWithCategory:(id)a3 scope:(id)a4 queryString:(id)a5 cannedSuggestion:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MSParsecSearchSessionQueryComponent;
  v14 = [(MSParsecSearchSessionQueryComponent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_category, a3);
    objc_storeStrong((id *)&v15->_scope, a4);
    objc_storeStrong((id *)&v15->_queryString, a5);
    v15->_cannedSuggestion = a6;
  }

  return v15;
}

- (id)_structuredQueryComponentWithLanguages:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MSParsecSearchSessionQueryComponent *)self cannedSuggestion])
  {
    char v5 = [(MSParsecSearchSessionQueryComponent *)self category];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [(MSParsecSearchSessionQueryComponent *)self category];
    if (v7)
    {
      id v8 = [(MSParsecSearchSessionQueryComponent *)self scope];

      if (v8)
      {
        id v9 = [(MSParsecSearchSessionQueryComponent *)self scope];
        [v6 setObject:v9 forKeyedSubscript:@"s"];
      }
    }
    id v10 = [(MSParsecSearchSessionQueryComponent *)self queryString];
    id v11 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_localesFromLanguages:", v23);
    id v12 = [v11 firstObject];
    id v13 = objc_msgSend(v10, "ef_wordComponentsForLocale:", v12);

    v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v13;
    uint64_t v16 = 0;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v16 += [*(id *)(*((void *)&v24 + 1) + 8 * i) length];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:v16];
    [v6 setObject:v20 forKeyedSubscript:@"nc"];

    [v6 setObject:v14 forKeyedSubscript:@"nw"];
    id v21 = [(MSParsecSearchSessionQueryComponent *)self category];
    [v4 setObject:v6 forKeyedSubscript:v21];
  }
  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)scope
{
  return self->_scope;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)cannedSuggestion
{
  return self->_cannedSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

void __102__MSParsecSearchSessionQueryComponent__structuredQueryForComponents_hasCurrentMailboxScope_languages___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BF36E000, log, OS_LOG_TYPE_ERROR, "Could not get a MSParsecSearchSessionQueryComponent", v1, 2u);
}

@end