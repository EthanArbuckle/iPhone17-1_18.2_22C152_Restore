@interface AMSMockURLOverride
+ (AMSMockURLOverride)overrideWithHost:(id)a3 usingResponse:(id)a4;
+ (AMSMockURLOverride)overrideWithPathComponent:(id)a3 usingResponse:(id)a4;
+ (AMSMockURLOverride)overrideWithURLRegex:(id)a3 usingResponse:(id)a4;
- (AMSMockURLOverride)init;
- (AMSMockURLResponse)response;
- (AMSObservable)executedObservable;
- (BOOL)shouldOverrideURLRequest:(id)a3;
- (NSMutableArray)comparators;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_withURLMatchingHost:(id)a3 containingPath:(id)a4 queryItems:(id)a5;
- (void)setComparators:(id)a3;
- (void)setExecutedObservable:(id)a3;
- (void)setResponse:(id)a3;
- (void)withHTTPBodyValidation:(id)a3 encoding:(int64_t)a4;
- (void)withHTTPHeaderValidation:(id)a3;
- (void)withURLContainingPath:(id)a3;
- (void)withURLMatchingHost:(id)a3;
- (void)withURLQueryItems:(id)a3;
- (void)withURLRegexValidation:(id)a3;
@end

@implementation AMSMockURLOverride

- (AMSMockURLOverride)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSMockURLOverride;
  v2 = [(AMSMockURLOverride *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSObservable);
    executedObservable = v2->_executedObservable;
    v2->_executedObservable = v3;

    uint64_t v5 = objc_opt_new();
    comparators = v2->_comparators;
    v2->_comparators = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AMSMockURLOverride);
  uint64_t v5 = [(AMSMockURLOverride *)self response];
  [(AMSMockURLOverride *)v4 setResponse:v5];

  return v4;
}

+ (AMSMockURLOverride)overrideWithHost:(id)a3 usingResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  [(AMSMockURLOverride *)v7 withURLMatchingHost:v6];

  [(AMSMockURLOverride *)v7 setResponse:v5];
  return v7;
}

+ (AMSMockURLOverride)overrideWithPathComponent:(id)a3 usingResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  [(AMSMockURLOverride *)v7 withURLContainingPath:v6];

  [(AMSMockURLOverride *)v7 setResponse:v5];
  return v7;
}

+ (AMSMockURLOverride)overrideWithURLRegex:(id)a3 usingResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  [(AMSMockURLOverride *)v7 withURLRegexValidation:v6];

  [(AMSMockURLOverride *)v7 setResponse:v5];
  return v7;
}

- (void)withURLMatchingHost:(id)a3
{
}

- (void)withURLContainingPath:(id)a3
{
}

- (void)withURLQueryItems:(id)a3
{
}

- (void)withURLRegexValidation:(id)a3
{
  id v4 = a3;
  id v5 = [AMSMockURLRequestComparator alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__AMSMockURLOverride_withURLRegexValidation___block_invoke;
  v9[3] = &unk_1E55A4C20;
  id v10 = v4;
  id v6 = v4;
  v7 = [(AMSMockURLRequestComparator *)v5 initWithCriteriaBlock:v9];
  objc_super v8 = [(AMSMockURLOverride *)self comparators];
  [v8 addObject:v7];
}

BOOL __45__AMSMockURLOverride_withURLRegexValidation___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 URL];
  id v4 = [v3 absoluteString];
  uint64_t v5 = [v4 rangeOfString:*(void *)(a1 + 32) options:1024];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)withHTTPHeaderValidation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [AMSMockURLRequestComparator alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__AMSMockURLOverride_withHTTPHeaderValidation___block_invoke;
  v9[3] = &unk_1E55A4C48;
  id v10 = v4;
  id v6 = v4;
  v7 = [(AMSMockURLRequestComparator *)v5 initWithCriteriaBlock:v9];
  objc_super v8 = [(AMSMockURLOverride *)self comparators];
  [v8 addObject:v7];
}

uint64_t __47__AMSMockURLOverride_withHTTPHeaderValidation___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 allHTTPHeaderFields];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)withHTTPBodyValidation:(id)a3 encoding:(int64_t)a4
{
  id v6 = a3;
  v7 = [AMSMockURLRequestComparator alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __54__AMSMockURLOverride_withHTTPBodyValidation_encoding___block_invoke;
  v14 = &unk_1E55A4C70;
  id v15 = v6;
  int64_t v16 = a4;
  id v8 = v6;
  v9 = [(AMSMockURLRequestComparator *)v7 initWithCriteriaBlock:&v11];
  id v10 = [(AMSMockURLOverride *)self comparators];
  [v10 addObject:v9];
}

uint64_t __54__AMSMockURLOverride_withHTTPBodyValidation_encoding___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 body];
  if (v3)
  {
    uint64_t v4 = +[AMSData objectWithData:v3 encoding:*(void *)(a1 + 40) error:0];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldOverrideURLRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSMockURLOverride *)self comparators];
  int v6 = [v5 count] != 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = [(AMSMockURLOverride *)self comparators];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v6 &= [*(id *)(*((void *)&v13 + 1) + 8 * i) shouldOverrideURLRequest:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_withURLMatchingHost:(id)a3 containingPath:(id)a4 queryItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [AMSMockURLRequestComparator alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke;
  v17[3] = &unk_1E55A4CE0;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  long long v15 = [(AMSMockURLRequestComparator *)v11 initWithCriteriaBlock:v17];
  long long v16 = [(AMSMockURLOverride *)self comparators];
  [v16 addObject:v15];
}

uint64_t __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[4])
  {
    uint64_t v5 = [v3 URL];
    int v6 = [v5 host];
    uint64_t v7 = [v6 isEqualToString:a1[4]];
  }
  else
  {
    uint64_t v7 = 1;
  }
  if (a1[5]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = [v4 URL];
    id v10 = [v9 path];
    uint64_t v7 = [v10 containsString:a1[5]];
  }
  if (a1[6] && v7)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F29088]);
    id v12 = [v4 URL];
    id v13 = [v12 absoluteString];
    id v14 = (void *)[v11 initWithString:v13];
    long long v15 = [v14 queryItems];

    uint64_t v16 = objc_msgSend(v15, "ams_dictionaryUsingTransform:", &__block_literal_global_97);
    v17 = (void *)v16;
    id v18 = (void *)MEMORY[0x1E4F1CC08];
    if (v16) {
      id v18 = (void *)v16;
    }
    id v19 = v18;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    id v20 = (void *)a1[6];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_3;
    v23[3] = &unk_1E55A4CB8;
    id v21 = v19;
    id v24 = v21;
    v25 = &v26;
    [v20 enumerateKeysAndObjectsUsingBlock:v23];
    uint64_t v7 = *((unsigned char *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

uint64_t __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

void __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v8 = [v7 value];

  if (!v8 || ([v9 isEqualToString:v8] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (AMSObservable)executedObservable
{
  return self->_executedObservable;
}

- (void)setExecutedObservable:(id)a3
{
}

- (AMSMockURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSMutableArray)comparators
{
  return self->_comparators;
}

- (void)setComparators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparators, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_executedObservable, 0);
}

@end