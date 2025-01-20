@interface CNAutocompleteResultTokenMatcher
+ (id)indexTokensFromPhoneNumber:(id)a3;
+ (id)normalizePhoneNumber:(id)a3 countryCode:(id)a4;
+ (id)searchTokensFromString:(id)a3;
+ (id)tokenizePhoneNumber:(id)a3;
- (BOOL)evaluateResult:(id)a3;
- (BOOL)evaluateSingleResult:(id)a3;
- (BOOL)evaluateTopLevelGroupResult:(id)a3;
- (CNAutocompleteResultTokenMatcher)init;
- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3;
- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3 countryCode:(id)a4;
- (id)filterAdapter;
- (id)nameTokensForResult:(id)a3;
- (id)representationsOfPhoneNumber:(id)a3;
- (id)tokensForResultName:(id)a3;
- (id)tokensForResultValue:(id)a3;
@end

@implementation CNAutocompleteResultTokenMatcher

- (CNAutocompleteResultTokenMatcher)init
{
  return [(CNAutocompleteResultTokenMatcher *)self initWithSearchString:0];
}

- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 currentLocale];
  v7 = [v6 objectForKey:*MEMORY[0x1E4F1C400]];

  v8 = [(CNAutocompleteResultTokenMatcher *)self initWithSearchString:v5 countryCode:v7];
  return v8;
}

- (CNAutocompleteResultTokenMatcher)initWithSearchString:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteResultTokenMatcher;
  v8 = [(CNAutocompleteResultTokenMatcher *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() searchTokensFromString:v6];
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (id)searchTokensFromString:(id)a3
{
  v3 = +[CNAutocompleteInputStringTokenizer tokensFromString:a3];
  v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_24);

  return v4;
}

- (id)filterAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CNAutocompleteResultTokenMatcher_filterAdapter__block_invoke;
  v4[3] = &unk_1E63DE4C0;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

uint64_t __49__CNAutocompleteResultTokenMatcher_filterAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateResult:a2];
}

- (BOOL)evaluateResult:(id)a3
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [(CNAutocompleteResultTokenMatcher *)self evaluateSingleResult:v4]
  }
      || [(CNAutocompleteResultTokenMatcher *)self evaluateTopLevelGroupResult:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)evaluateSingleResult:(id)a3
{
  v3 = self;
  id v4 = [(CNAutocompleteResultTokenMatcher *)self nameTokensForResult:a3];
  LOBYTE(v3) = +[CNAutocompleteTokenMatcher doSearchTokens:v3->_tokens matchNameTokens:v4];

  return (char)v3;
}

- (BOOL)evaluateTopLevelGroupResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 resultType] == 1)
  {
    id v11 = 0;
    BOOL v5 = [v4 members:&v11];
    id v6 = v11;
    if (v5)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__CNAutocompleteResultTokenMatcher_evaluateTopLevelGroupResult___block_invoke;
      v10[3] = &unk_1E63DE4C0;
      v10[4] = self;
      char v7 = objc_msgSend(v5, "_cn_any:", v10);
    }
    else
    {
      v8 = CNALoggingContextDebug();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v6;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Error: %@ a result %@ has no members", buf, 0x16u);
      }

      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __64__CNAutocompleteResultTokenMatcher_evaluateTopLevelGroupResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateSingleResult:a2];
}

- (id)nameTokensForResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  char v7 = [(CNAutocompleteResultTokenMatcher *)self tokensForResultName:v5];
  [v6 addObject:v7];

  v8 = [v5 value];

  uint64_t v9 = [(CNAutocompleteResultTokenMatcher *)self tokensForResultValue:v8];
  [v6 addObject:v9];

  v10 = objc_msgSend(v6, "_cn_flatten");
  id v11 = objc_msgSend(v10, "_cn_map:", &__block_literal_global_24);

  return v11;
}

- (id)tokensForResultName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  id v6 = [v4 nameComponents];
  char v7 = [v6 firstName];
  objc_msgSend(v5, "_cn_addNonNilObject:", v7);

  v8 = [v4 nameComponents];
  uint64_t v9 = [v8 lastName];
  objc_msgSend(v5, "_cn_addNonNilObject:", v9);

  v10 = [v4 nameComponents];
  id v11 = [v10 nickname];
  objc_msgSend(v5, "_cn_addNonNilObject:", v11);

  v12 = [v4 nameComponents];
  id v13 = [v12 nameSuffix];
  objc_msgSend(v5, "_cn_addNonNilObject:", v13);

  __int16 v14 = [v4 displayName];

  objc_msgSend(v5, "_cn_addNonNilObject:", v14);
  id v15 = objc_msgSend(v5, "_cn_flatMap:", &__block_literal_global_9_0);

  return v15;
}

id __56__CNAutocompleteResultTokenMatcher_tokensForResultName___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNAutocompleteTokenMatcher tokensForNameString:a2];
}

- (id)tokensForResultValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [v4 addressType];
    char v7 = [v4 address];
    if (v6 == 2)
    {
      v8 = [(CNAutocompleteResultTokenMatcher *)self representationsOfPhoneNumber:v7];
      [v5 addObjectsFromArray:v8];
    }
    else
    {
      objc_msgSend(v5, "_cn_addNonNilObject:", v7);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)representationsOfPhoneNumber:(id)a3
{
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    [v6 addObject:v4];
    char v7 = [(id)objc_opt_class() normalizePhoneNumber:v4 countryCode:self->_countryCode];
    objc_msgSend(v6, "_cn_addNonNilObject:", v7);
    v8 = [(id)objc_opt_class() indexTokensFromPhoneNumber:v7];
    [v6 addObjectsFromArray:v8];

    uint64_t v9 = [(id)objc_opt_class() indexTokensFromPhoneNumber:v4];
    [v6 addObjectsFromArray:v9];

    id v5 = objc_msgSend(v6, "_cn_distinctObjects");
  }
  return v5;
}

+ (id)indexTokensFromPhoneNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a1 tokenizePhoneNumber:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v7 = 0;
      v8 = v6;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        v10 = [v8 arrayByAddingObject:&stru_1F1A2F2D8];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __63__CNAutocompleteResultTokenMatcher_indexTokensFromPhoneNumber___block_invoke;
        v13[3] = &unk_1E63DE820;
        v13[4] = v9;
        uint64_t v6 = objc_msgSend(v10, "_cn_map:", v13);

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

uint64_t __63__CNAutocompleteResultTokenMatcher_indexTokensFromPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByAppendingString:*(void *)(a1 + 32)];
}

+ (id)tokenizePhoneNumber:(id)a3
{
  uint64_t v3 = tokenizePhoneNumber__cn_once_token_1;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&tokenizePhoneNumber__cn_once_token_1, &__block_literal_global_12_2);
  }
  uint64_t v5 = [v4 componentsSeparatedByCharactersInSet:tokenizePhoneNumber__cn_once_object_1];

  uint64_t v6 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_18_1);

  return v6;
}

uint64_t __56__CNAutocompleteResultTokenMatcher_tokenizePhoneNumber___block_invoke()
{
  tokenizePhoneNumber__cn_once_object_1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+()- "];
  return MEMORY[0x1F41817F8]();
}

BOOL __56__CNAutocompleteResultTokenMatcher_tokenizePhoneNumber___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

+ (id)normalizePhoneNumber:(id)a3 countryCode:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  CFStringRef v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  uint64_t v7 = (const void *)CFPhoneNumberCreate();

  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7) {
LABEL_3:
  }
    CFRelease(v7);
LABEL_4:
  if (v6) {
    CFRelease(v6);
  }
  return String;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end