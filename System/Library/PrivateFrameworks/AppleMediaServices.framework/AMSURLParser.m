@interface AMSURLParser
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSURLParser)initWithBag:(id)a3;
- (AMSURLParser)initWithBagContract:(id)a3;
- (BOOL)_matchURL:(id)a3 toPatterns:(id)a4;
- (id)_commerceUIArrayForKey:(id)a3;
- (id)_correctURL:(id)a3;
- (id)_defaultWebAllowedForURL:(id)a3;
- (id)_dynamicUIAllowedForURL:(id)a3;
- (id)_legacyWebAllowedForURL:(id)a3;
- (id)bagContract;
- (id)isCommerceUIURL:(id)a3;
- (id)typeForCommerceUIURL:(id)a3;
- (id)typeForURL:(id)a3;
- (void)_waitForPromises:(id)a3 block:(id)a4;
- (void)setBag:(id)a3;
@end

@implementation AMSURLParser

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSURLParser)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSURLParser;
  v6 = [(AMSURLParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

- (id)isCommerceUIURL:(id)a3
{
  v4 = [(AMSURLParser *)self _correctURL:a3];
  id v5 = [v4 absoluteString];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = [(AMSURLParser *)self _commerceUIArrayForKey:@"url-patterns"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __32__AMSURLParser_isCommerceUIURL___block_invoke;
    v14[3] = &unk_1E559F028;
    v14[4] = self;
    [v7 addErrorBlock:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__AMSURLParser_isCommerceUIURL___block_invoke_27;
    v12[3] = &unk_1E55A3060;
    v12[4] = self;
    id v13 = v4;
    v8 = [v7 thenWithBlock:v12];
    objc_super v9 = +[AMSBinaryPromise promiseWithPromise:v8];
  }
  else
  {
    v10 = AMSError(2, @"No URL to match", @"There was no URL passed in for matching", 0);
    objc_super v9 = +[AMSBinaryPromise promiseWithError:v10];
  }
  return v9;
}

void __32__AMSURLParser_isCommerceUIURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: There was no bag value found for commerce UI URL patterns. [%{public}@]", (uint8_t *)&v5, 0x16u);
  }
}

id __32__AMSURLParser_isCommerceUIURL___block_invoke_27(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _matchURL:*(void *)(a1 + 40) toPatterns:a2])
  {
    id v2 = +[AMSBinaryPromise promiseWithSuccess];
    v3 = [v2 promiseAdapter];
  }
  else
  {
    id v2 = AMSError(7, @"Commerce UI URL not found", @"The parsed URL did not match a commerce UI URL pattern", 0);
    v4 = +[AMSBinaryPromise promiseWithError:v2];
    v3 = [v4 promiseAdapter];
  }
  return v3;
}

- (id)typeForCommerceUIURL:(id)a3
{
  v4 = [(AMSURLParser *)self _correctURL:a3];
  int v5 = [v4 absoluteString];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    __int16 v7 = objc_alloc_init(AMSMutablePromise);
    id v8 = [(AMSURLParser *)self typeForURL:v4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__AMSURLParser_typeForCommerceUIURL___block_invoke;
    v12[3] = &unk_1E559EE78;
    uint64_t v9 = v7;
    id v13 = v9;
    [v8 addFinishBlock:v12];
  }
  else
  {
    v10 = AMSError(2, @"No URL to match", @"There was no URL passed in for matching", 0);
    uint64_t v9 = +[AMSPromise promiseWithError:v10];
  }
  return v9;
}

void __37__AMSURLParser_typeForCommerceUIURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
    return;
  }
  uint64_t v5 = [a2 integerValue];
  if (v5 == 1)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    __int16 v7 = &unk_1EDD01870;
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    __int16 v7 = &unk_1EDD01858;
LABEL_9:
    [v6 finishWithResult:v7];
    return;
  }
  id v8 = *(void **)(a1 + 32);
  AMSError(7, @"Commerce UI URL Type Not Found", @"The parsed URL did not match a commerce UI URL pattern", 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 finishWithError:v9];
}

- (id)typeForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSURLParser *)self bag];

  if (!v5)
  {
    v12 = AMSError(2, @"Missing bag", @"No bag was passed in", 0);
    v19 = +[AMSPromise promiseWithError:v12];
    goto LABEL_5;
  }
  uint64_t v6 = [(AMSURLParser *)self _correctURL:v4];

  __int16 v7 = [v6 absoluteString];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = [(AMSURLParser *)self _defaultWebAllowedForURL:v6];
    v10 = [(AMSURLParser *)self _dynamicUIAllowedForURL:v6];
    v11 = [(AMSURLParser *)self _legacyWebAllowedForURL:v6];
    v12 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(v12, "ams_addNullableObject:", v9);
    objc_msgSend(v12, "ams_addNullableObject:", v10);
    objc_msgSend(v12, "ams_addNullableObject:", v11);
    id v13 = objc_alloc_init(AMSMutablePromise);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __27__AMSURLParser_typeForURL___block_invoke;
    v22[3] = &unk_1E55A2258;
    id v23 = v9;
    id v24 = v10;
    id v25 = v11;
    v14 = v13;
    v26 = v14;
    id v4 = v6;
    id v27 = v4;
    id v15 = v11;
    id v16 = v10;
    id v17 = v9;
    [(AMSURLParser *)self _waitForPromises:v12 block:v22];
    v18 = v27;
    v19 = v14;

LABEL_5:
    goto LABEL_7;
  }
  v20 = AMSError(2, @"No URL to match", @"There was no URL passed in for matching", 0);
  v19 = +[AMSPromise promiseWithError:v20];

  id v4 = v6;
LABEL_7:

  return v19;
}

void __27__AMSURLParser_typeForURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultWithError:0];
  char v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = &unk_1EDD01858;
LABEL_7:
    id v9 = *(void **)(a1 + 56);
    [v9 finishWithResult:v4];
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 40) resultWithError:0];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    id v4 = &unk_1EDD01888;
    goto LABEL_7;
  }
  __int16 v7 = [*(id *)(a1 + 48) resultWithError:0];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v4 = &unk_1EDD01870;
    goto LABEL_7;
  }
  id v12 = [NSString stringWithFormat:@"The parsed URL did not match a commerce UI URL pattern, %@", *(void *)(a1 + 64)];
  v10 = *(void **)(a1 + 56);
  v11 = AMSError(7, @"URL Type Not Found", v12, 0);
  [v10 finishWithError:v11];
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_151 != -1) {
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_133);
  }
  id v2 = (void *)qword_1EB38E028;
  return (NSString *)v2;
}

void __29__AMSURLParser_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38E028;
  qword_1EB38E028 = @"AMSURLParser";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38E030 != -1) {
    dispatch_once(&qword_1EB38E030, &__block_literal_global_65_2);
  }
  id v2 = (void *)qword_1EB38E038;
  return (NSString *)v2;
}

void __36__AMSURLParser_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38E038;
  qword_1EB38E038 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  char v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (AMSURLParser)initWithBagContract:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  char v6 = [(AMSURLParser *)self initWithBag:v5];

  return v6;
}

- (id)bagContract
{
  char v3 = [AMSDeprecatedBagContract alloc];
  id v4 = [(AMSURLParser *)self bag];
  uint64_t v5 = [(AMSDeprecatedBagContract *)v3 initWithBag:v4];

  return v5;
}

- (id)_commerceUIArrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSURLParser *)self bag];
  char v6 = [v5 dictionaryForKey:@"commerce-ui-urls"];

  __int16 v7 = [v6 valuePromise];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__AMSURLParser__commerceUIArrayForKey___block_invoke;
  v11[3] = &unk_1E55A0FA0;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __39__AMSURLParser__commerceUIArrayForKey___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      v10 = +[AMSPromise promiseWithResult:v4];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11 = AMSErrorWithFormat(7, @"CommerceUI Value Not Found", @"Bag value not found for key: %@", v5, v6, v7, v8, v9, *(void *)(a1 + 32));
  v10 = +[AMSPromise promiseWithError:v11];

  id v4 = 0;
LABEL_6:

  return v10;
}

- (id)_defaultWebAllowedForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSURLParser *)self _commerceUIArrayForKey:@"v2-url-patterns"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AMSURLParser__defaultWebAllowedForURL___block_invoke;
  v9[3] = &unk_1E55A3060;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __41__AMSURLParser__defaultWebAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _matchURL:*(void *)(a1 + 40) toPatterns:a2])
  {
    id v2 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    char v3 = AMSError(7, @"Commerce UI URL type not found", @"The parsed URL did not match a commerce UI default URL pattern", 0);
    id v2 = +[AMSPromise promiseWithError:v3];
  }
  return v2;
}

- (id)_dynamicUIAllowedForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSURLParser *)self _commerceUIArrayForKey:@"dynamic-url-patterns"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AMSURLParser__dynamicUIAllowedForURL___block_invoke;
  v9[3] = &unk_1E55A3060;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __40__AMSURLParser__dynamicUIAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _matchURL:*(void *)(a1 + 40) toPatterns:a2])
  {
    id v2 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    char v3 = AMSError(7, @"Commerce UI URL type not found", @"The parsed URL did not match a commerce UI dynamic URL pattern", 0);
    id v2 = +[AMSPromise promiseWithError:v3];
  }
  return v2;
}

- (id)_legacyWebAllowedForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSURLParser *)self _commerceUIArrayForKey:@"url-patterns"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AMSURLParser__legacyWebAllowedForURL___block_invoke;
  v9[3] = &unk_1E55A3060;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __40__AMSURLParser__legacyWebAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _matchURL:*(void *)(a1 + 40) toPatterns:a2])
  {
    id v2 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    char v3 = AMSError(7, @"Commerce UI URL type not found", @"The parsed URL did not match a commerce UI legacy URL pattern", 0);
    id v2 = +[AMSPromise promiseWithError:v3];
  }
  return v2;
}

- (BOOL)_matchURL:(id)a3 toPatterns:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138543618;
    long long v23 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v24 = 0;
        id v13 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", v12, 1, &v24, v23);
        id v14 = v24;
        if (v14)
        {
          id v15 = +[AMSLogConfig sharedConfig];
          if (!v15)
          {
            id v15 = +[AMSLogConfig sharedConfig];
          }
          id v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = objc_opt_class();
            *(_DWORD *)buf = v23;
            uint64_t v30 = v17;
            __int16 v31 = 2114;
            id v32 = v14;
            _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Invalid commerceUI pattern. %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v18 = [v5 absoluteString];
          v19 = [v5 absoluteString];
          uint64_t v20 = objc_msgSend(v13, "numberOfMatchesInString:options:range:", v18, 2, 0, objc_msgSend(v19, "length"));

          if (v20)
          {

            BOOL v21 = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

- (id)_correctURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "ams_parameters");
  id v5 = [v4 objectForKeyedSubscript:@"action"];
  id v6 = [v4 objectForKeyedSubscript:@"url"];
  if (![v6 length]
    || ![v5 isEqualToString:@"account"]
    || ([MEMORY[0x1E4F1CB10] URLWithString:v6], (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = v3;
  }
  uint64_t v8 = [v7 scheme];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [v7 scheme];
    char v11 = [v10 hasSuffix:@"http"];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(v7, "ams_URLByReplacingSchemeWithScheme:", @"https");

      id v7 = (id)v12;
    }
  }

  return v7;
}

- (void)_waitForPromises:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = +[AMSPromise promiseWithFlattenedPromises:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSURLParser__waitForPromises_block___block_invoke;
  v8[3] = &unk_1E55A5918;
  id v9 = v5;
  id v7 = v5;
  [v6 addFinishBlock:v8];
}

uint64_t __39__AMSURLParser__waitForPromises_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end