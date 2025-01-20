@interface AMSLookup
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSLookup)initWithBag:(id)a3 caller:(id)a4 keyProfile:(id)a5;
- (AMSLookup)initWithBagContract:(id)a3;
- (AMSLookup)initWithBagContract:(id)a3 caller:(id)a4 keyProfile:(id)a5;
- (AMSProcessInfo)clientInfo;
- (NSString)caller;
- (NSString)imageProfile;
- (NSString)keyProfile;
- (NSString)language;
- (NSString)platform;
- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4;
- (id)contract;
- (id)performLookupWithBundleIdentifiers:(id)a3 itemIdentifiers:(id)a4;
- (int64_t)signatureType;
- (int64_t)version;
- (void)_addJSSignatureToRequest:(id)a3;
- (void)setBag:(id)a3;
- (void)setCaller:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setContract:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setKeyProfile:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setSignatureType:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation AMSLookup

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSLookup)initWithBag:(id)a3 caller:(id)a4 keyProfile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSLookup;
  v12 = [(AMSTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a3);
    v13->_version = 2;
    uint64_t v14 = +[AMSProcessInfo currentProcess];
    clientInfo = v13->_clientInfo;
    v13->_clientInfo = (AMSProcessInfo *)v14;

    objc_storeStrong((id *)&v13->_caller, a4);
    objc_storeStrong((id *)&v13->_keyProfile, a5);
  }

  return v13;
}

- (id)performLookupWithBundleIdentifiers:(id)a3 itemIdentifiers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = AMSGenerateLogCorrelationKey();
  uint64_t v9 = [(AMSLookup *)self bag];
  uint64_t v10 = [(AMSLookup *)self contract];
  if (v9 | v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke;
    v19[3] = &unk_1E55A3640;
    v19[4] = self;
    id v20 = v8;
    id v21 = (id)v9;
    id v22 = (id)v10;
    id v23 = v6;
    id v24 = v7;
    v16 = [(AMSTask *)self performTaskWithPromiseBlock:v19];
  }
  else
  {
    BOOL v11 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = objc_opt_class();
        __int16 v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSLookup requires its bag or contract properties to be set.", buf, 0x16u);
      }

      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v15 = +[AMSLogConfig sharedConfig];
      [v13 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v15 userInfo:0];
    }
    else
    {
      if (!v12)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v13 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = objc_opt_class();
        __int16 v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] AMSLookup requires its bag or contract properties to be set.", buf, 0x16u);
      }
    }

    objc_super v17 = AMSError(2, @"AMSLookup failed", @"Neither bag nor bag contract was provided.", 0);
    v16 = +[AMSPromise promiseWithError:v17];
  }
  return v16;
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v4;
    __int16 v35 = 2114;
    uint64_t v36 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting lookup request", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [AMSURLRequestEncoder alloc];
  if (v6) {
    v8 = [(AMSURLRequestEncoder *)v7 initWithBag:*(void *)(a1 + 48)];
  }
  else {
    v8 = [(AMSURLRequestEncoder *)v7 initWithBagContract:*(void *)(a1 + 56)];
  }
  uint64_t v9 = v8;
  [(AMSURLRequestEncoder *)v8 setLogUUID:*(void *)(a1 + 40)];
  uint64_t v10 = [*(id *)(a1 + 32) clientInfo];
  [(AMSURLRequestEncoder *)v9 setClientInfo:v10];

  BOOL v11 = objc_alloc_init(AMSLookupDecoder);
  [(AMSURLRequestEncoder *)v9 setResponseDecoder:v11];

  if ([*(id *)(a1 + 32) signatureType] == 1) {
    [(AMSURLRequestEncoder *)v9 setMescalType:1];
  }
  uint64_t v12 = *(void **)(a1 + 48);
  if (v12)
  {
    v13 = [v12 URLForKey:@"storeplatform-lookup-url-unpersonalized"];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [*(id *)(a1 + 48) URLForKey:@"storeplatform-lookup-url"];
    }
    v16 = v15;

    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_super v17 = @"Bag contract doesn't support providing either personalized or unpersonalized URLs.";
      goto LABEL_26;
    }
    v16 = [*(id *)(a1 + 56) personalizedLookupURL];
    if (!v16)
    {
      objc_super v17 = @"Bag contract provided a nil personalized URL.";
      goto LABEL_26;
    }
LABEL_18:
    v18 = [*(id *)(a1 + 32) _compileQueryParametersWithBundleIds:*(void *)(a1 + 64) itemIds:*(void *)(a1 + 72)];
    v19 = [v16 valuePromise];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_77;
    v30[3] = &unk_1E55A1068;
    v31 = v9;
    id v32 = v18;
    id v20 = v18;
    id v21 = [v19 thenWithBlock:v30];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_2;
    v27[3] = &unk_1E55A1E88;
    v27[4] = *(void *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    id v29 = *(id *)(a1 + 56);
    id v22 = [v21 thenWithBlock:v27];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_5;
    v25[3] = &unk_1E559E7E8;
    id v23 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v23;
    [v22 addErrorBlock:v25];

    goto LABEL_19;
  }
  v16 = [*(id *)(a1 + 56) unpersonalizedLookupURL];
  if (v16) {
    goto LABEL_18;
  }
  objc_super v17 = @"Bag contract provided a nil unpersonalized URL.";
LABEL_26:
  v16 = AMSError(0, @"Bag lookup URL fetch failed", v17, 0);
  id v22 = +[AMSPromise promiseWithError:v16];
LABEL_19:

  return v22;
}

uint64_t __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_77(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requestWithMethod:2 URL:a2 parameters:*(void *)(a1 + 40)];
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[v3 mutableCopy];
  }
  uint64_t v5 = v4;
  if (![*(id *)(a1 + 32) signatureType]) {
    [*(id *)(a1 + 32) _addJSSignatureToRequest:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 32) clientInfo];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[AMSProcessInfo currentProcess];
  }
  uint64_t v9 = v8;

  uint64_t v10 = *(void **)(a1 + 40);
  if (v10) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = [[AMSContractBagShim alloc] initWithBagContract:*(void *)(a1 + 48)];
  }
  uint64_t v12 = v11;
  v13 = objc_msgSend(MEMORY[0x1E4F18DD0], "ams_configurationWithClientInfo:bag:", v9, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_3;
  v17[3] = &unk_1E55A3618;
  id v18 = v5;
  id v14 = v5;
  id v15 = [v13 thenWithBlock:v17];

  return v15;
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[AMSURLSession alloc] initWithConfiguration:v3];

  uint64_t v5 = [(AMSURLSession *)v4 dataTaskPromiseWithRequest:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_4;
  v8[3] = &unk_1E55A35F0;
  uint64_t v9 = v4;
  uint64_t v6 = v4;
  [v5 addFinishBlock:v8];

  return v5;
}

uint64_t __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTasksAndInvalidate];
}

void __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSLookup failed. error = %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_10 != -1) {
    dispatch_once(&_MergedGlobals_1_10, &__block_literal_global_70);
  }
  v2 = (void *)qword_1EB38D148;
  return (NSString *)v2;
}

void __26__AMSLookup_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D148;
  qword_1EB38D148 = @"AMSLookup";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D150 != -1) {
    dispatch_once(&qword_1EB38D150, &__block_literal_global_93);
  }
  v2 = (void *)qword_1EB38D158;
  return (NSString *)v2;
}

void __33__AMSLookup_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D158;
  qword_1EB38D158 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (void)_addJSSignatureToRequest:(id)a3
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  uint64_t v7 = v6;

  objc_msgSend(v4, "appendFormat:", @"%.0f", v7);
  uint64_t v50 = v7;
  id v8 = [NSString stringWithFormat:@"%.0f"];
  [v3 setValue:v8 forHTTPHeaderField:@"X-JS-TIMESTAMP"];

  int v9 = [v3 valueForHTTPHeaderField:@"X-Apple-Store-Front"];
  if (v9)
  {
    [v4 appendString:v9];
  }
  else
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    __int16 v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      __int16 v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v12;
      __int16 v57 = 2114;
      v58 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] JS sign is missing a storefront", buf, 0x16u);
    }
  }
  id v14 = [v3 URL];
  uint64_t v15 = objc_msgSend(v14, "ams_parameters");

  v62[0] = @"caller";
  v62[1] = @"id";
  v62[2] = @"p";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [v15 objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        if (v21) {
          [v4 appendString:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v18);
  }

  id v22 = v4;
  id v23 = (const void *)[v22 UTF8String];
  if (![v22 length])
  {
    v39 = AMSErrorWithFormat(0, @"Lookup JS Failed", @"Signature string is empty", v24, v25, v26, v27, v28, v7);
    if (!v39) {
      goto LABEL_33;
    }
    goto LABEL_28;
  }
  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
  CC_LONG v30 = [v22 length];
  id v31 = v29;
  CC_SHA1(v23, v30, (unsigned __int8 *)[v31 mutableBytes]);
  [v31 setLength:16];
  id v32 = v31;
  fd3fa4R8(3, [v32 mutableBytes]);
  if (v33)
  {
    v39 = AMSErrorWithFormat(0, @"Lookup JS Failed", @"JS sign returned invalid status code: %ld", v34, v35, v36, v37, v38, v33);
  }
  else
  {
    v39 = 0;
  }
  v40 = [v32 base64EncodedStringWithOptions:0];
  if ([v40 length])
  {
    [v3 setValue:v40 forHTTPHeaderField:@"X-JS-SP-TOKEN"];
  }
  else if (!v39)
  {
    v39 = AMSErrorWithFormat(0, @"Lookup JS Failed", @"Signature cookie value is empty", v41, v42, v43, v44, v45, v50);
  }

  if (v39)
  {
LABEL_28:
    v46 = +[AMSLogConfig sharedConfig];
    if (!v46)
    {
      v46 = +[AMSLogConfig sharedConfig];
    }
    v47 = [v46 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = objc_opt_class();
      v49 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v56 = v48;
      __int16 v57 = 2114;
      v58 = v49;
      __int16 v59 = 2114;
      v60 = v39;
      _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error occurred during JS sign: %{public}@", buf, 0x20u);
    }
  }
LABEL_33:
}

- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[AMSLookup version](self, "version"));
  [v9 setObject:v10 forKeyedSubscript:@"version"];

  __int16 v11 = [v8 componentsJoinedByString:@","];

  if (v8) {
    [v9 setObject:v11 forKeyedSubscript:@"bundleId"];
  }
  uint64_t v12 = [(AMSLookup *)self caller];
  if (v12) {
    goto LABEL_7;
  }
  __int16 v13 = [(AMSLookup *)self clientInfo];
  uint64_t v12 = [v13 bundleIdentifier];

  if (v12) {
    goto LABEL_7;
  }
  id v14 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v12 = [v14 bundleIdentifier];

  if (v12
    || ([MEMORY[0x1E4F28F80] processInfo],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v15 processName],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v15,
        v12))
  {
LABEL_7:
    [v9 setObject:v12 forKeyedSubscript:@"caller"];
  }
  id v16 = [(AMSLookup *)self imageProfile];

  if (v16)
  {
    uint64_t v17 = [(AMSLookup *)self imageProfile];
    [v9 setObject:v17 forKeyedSubscript:@"artwork"];
  }
  uint64_t v18 = [v6 componentsJoinedByString:@","];
  if (v18) {
    [v9 setObject:v18 forKeyedSubscript:@"id"];
  }
  uint64_t v19 = [(AMSLookup *)self keyProfile];

  if (v19)
  {
    id v20 = [(AMSLookup *)self keyProfile];
    [v9 setObject:v20 forKeyedSubscript:@"p"];
  }
  id v21 = [(AMSLookup *)self platform];

  if (v21)
  {
    id v22 = [(AMSLookup *)self platform];
    [v9 setObject:v22 forKeyedSubscript:@"platform"];
  }
  id v23 = [(AMSLookup *)self language];

  if (v23)
  {
    uint64_t v24 = [(AMSLookup *)self language];
    [v9 setObject:v24 forKeyedSubscript:@"lang"];
  }
  return v9;
}

- (AMSLookup)initWithBagContract:(id)a3
{
  return [(AMSLookup *)self initWithBagContract:a3 caller:0 keyProfile:0];
}

- (AMSLookup)initWithBagContract:(id)a3 caller:(id)a4 keyProfile:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [[AMSContractBagShim alloc] initWithBagContract:v10];

  uint64_t v12 = [(AMSLookup *)self initWithBag:v11 caller:v9 keyProfile:v8];
  return v12;
}

- (id)contract
{
  id v3 = [AMSDeprecatedBagContract alloc];
  id v4 = [(AMSLookup *)self bag];
  uint64_t v5 = [(AMSDeprecatedBagContract *)v3 initWithBag:v4];

  return v5;
}

- (void)setContract:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];

  [(AMSLookup *)self setBag:v5];
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (int64_t)signatureType
{
  return self->_signatureType;
}

- (void)setSignatureType:(int64_t)a3
{
  self->_signatureType = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end