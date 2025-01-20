@interface AMSMarketingItemTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSMarketingItemTask)initWithAccount:(id)a3 bag:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 placement:(id)a7 serviceType:(id)a8;
- (AMSMarketingItemTask)initWithBag:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 placement:(id)a6 serviceType:(id)a7;
- (AMSProcessInfo)clientInfo;
- (BOOL)hydrateRelatedContent;
- (BOOL)includeMediaAssets;
- (NSDictionary)contextInfo;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)logKey;
- (NSString)offerHints;
- (NSString)placement;
- (NSString)serviceType;
- (id)_fetchItems;
- (id)_fetchItemsFromURL:(id)a3;
- (id)_processMediaResultFromPromise:(id)a3;
- (id)_requestForURL:(id)a3 tokenService:(id)a4;
- (id)perform;
- (id)performWithFetchOnly;
- (void)setAccount:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setHydrateRelatedContent:(BOOL)a3;
- (void)setIncludeMediaAssets:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setOfferHints:(id)a3;
@end

@implementation AMSMarketingItemTask

uint64_t __35__AMSMarketingItemTask__fetchItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchItemsFromURL:a2];
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

id __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [AMSMutableLazyPromise alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke_2;
  v12 = &unk_1E55A39B8;
  id v13 = *(id *)(a1 + 32);
  id v14 = v3;
  id v5 = v3;
  v6 = [(AMSMutableLazyPromise *)v4 initWithBlock:&v9];
  v7 = objc_msgSend(*(id *)(a1 + 40), "_processMediaResultFromPromise:", v6, v9, v10, v11, v12);

  return v7;
}

- (id)performWithFetchOnly
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AMSMarketingItemTask_performWithFetchOnly__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __44__AMSMarketingItemTask_performWithFetchOnly__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _fetchItems];
  v2 = [v1 thenWithBlock:&__block_literal_global_73];

  return v2;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)_fetchItems
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedMarketingItemConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(AMSMarketingItemTask *)self logKey];
    v8 = [(AMSMarketingItemTask *)self serviceType];
    uint64_t v9 = [(AMSMarketingItemTask *)self placement];
    uint64_t v10 = [(AMSMarketingItemTask *)self contextInfo];
    *(_DWORD *)buf = 138544386;
    v31 = v5;
    __int16 v32 = 2114;
    v33 = v7;
    __int16 v34 = 2114;
    v35 = v8;
    __int16 v36 = 2114;
    v37 = v9;
    __int16 v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching marketing items for serviceType: %{public}@ \nplacement: %{public}@ \ncontext: %{public}@", buf, 0x34u);
  }
  if (+[AMSDefaults disableStubbedMarketingItems])
  {
    v11 = objc_alloc_init(AMSMarketingItemTaskURLBuilder);
    v12 = [(AMSMarketingItemTask *)self serviceType];
    id v13 = [(AMSMarketingItemTask *)self placement];
    id v14 = [(AMSMarketingItemTask *)self bag];
    BOOL v15 = [(AMSMarketingItemTask *)self hydrateRelatedContent];
    v16 = [(AMSMarketingItemTask *)self offerHints];
    v17 = [(AMSMarketingItemTask *)self contextInfo];
    v18 = [(AMSMarketingItemTaskURLBuilder *)v11 urlWithServiceType:v12 placement:v13 bag:v14 hydrateRelatedContents:v15 offerHints:v16 additionalParameters:v17];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __35__AMSMarketingItemTask__fetchItems__block_invoke;
    v28[3] = &unk_1E55A0E10;
    v28[4] = self;
    v19 = [v18 thenWithBlock:v28];
  }
  else
  {
    v20 = +[AMSLogConfig sharedMarketingItemConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      id v23 = v22;
      v24 = [(AMSMarketingItemTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      __int16 v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using local stubs", buf, 0x16u);
    }
    v11 = [(AMSMarketingItemTask *)self serviceType];
    v18 = [(AMSMarketingItemTask *)self placement];
    v25 = +[AMSMarketingItemStub stubForServiceType:v11 placement:v18];
    v29 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v19 = +[AMSPromise promiseWithResult:v26];
  }
  return v19;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)placement
{
  return self->_placement;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSString)offerHints
{
  return self->_offerHints;
}

- (BOOL)hydrateRelatedContent
{
  return self->_hydrateRelatedContent;
}

- (id)_fetchItemsFromURL:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSMediaSharedProperties propertiesForMarketingItemTask:self];
  id v6 = [v5 tokenService];
  v7 = [(AMSMarketingItemTask *)self _requestForURL:v4 tokenService:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke;
  v11[3] = &unk_1E559FA68;
  id v12 = v5;
  id v13 = self;
  id v8 = v5;
  uint64_t v9 = [v7 thenWithBlock:v11];

  return v9;
}

- (id)_processMediaResultFromPromise:(id)a3
{
  id v3 = a3;
  id v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke;
  v8[3] = &unk_1E55A0A90;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(AMSMutableLazyPromise *)v4 initWithTimeout:v8 block:60.0];

  return v6;
}

- (void)setOfferHints:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

void __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_2;
  v10[3] = &unk_1E559F028;
  id v5 = v3;
  id v11 = v5;
  [v4 addErrorBlock:v10];
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_3;
  v8[3] = &unk_1E55A39E0;
  id v9 = v5;
  id v7 = v5;
  [v6 addSuccessBlock:v8];
}

- (AMSMarketingItemTask)initWithBag:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 placement:(id)a6 serviceType:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AMSMarketingItemTask;
  v17 = [(AMSTask *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bag, a3);
    objc_storeStrong((id *)&v18->_clientIdentifier, a4);
    objc_storeStrong((id *)&v18->_clientVersion, a5);
    v18->_hydrateRelatedContent = 1;
    v18->_includeMediaAssets = 1;
    objc_storeStrong((id *)&v18->_placement, a6);
    objc_storeStrong((id *)&v18->_serviceType, a7);
  }

  return v18;
}

- (AMSMarketingItemTask)initWithAccount:(id)a3 bag:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 placement:(id)a7 serviceType:(id)a8
{
  id v15 = a3;
  id v16 = [(AMSMarketingItemTask *)self initWithBag:a4 clientIdentifier:a5 clientVersion:a6 placement:a7 serviceType:a8];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_account, a3);
  }

  return v17;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__AMSMarketingItemTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __31__AMSMarketingItemTask_perform__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _fetchItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AMSMarketingItemTask_perform__block_invoke_2;
  v5[3] = &unk_1E559E528;
  v5[4] = *(void *)(a1 + 32);
  id v3 = [v2 thenWithBlock:v5];

  return v3;
}

id __31__AMSMarketingItemTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 serviceType];
  id v6 = [*(id *)(a1 + 32) placement];
  id v7 = +[AMSMarketingItemParser selectionFromRawMarketingItems:v4 serviceType:v5 placement:v6];

  return v7;
}

AMSMutablePromise *__44__AMSMarketingItemTask_performWithFetchOnly__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_9_0);

  [(AMSMutablePromise *)v3 finishWithResult:v4];
  return v3;
}

AMSMarketingItem *__44__AMSMarketingItemTask_performWithFetchOnly__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AMSMarketingItem alloc] initWithDictionary:v2];

  return v3;
}

void __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 session];
  id v5 = [v6 dataTaskPromiseWithRequest:*(void *)(a1 + 40)];
  [v4 finishWithPromise:v5];
}

- (id)_requestForURL:(id)a3 tokenService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [AMSMediaRequestEncoder alloc];
  id v9 = [(AMSMarketingItemTask *)self bag];
  uint64_t v10 = [(AMSMediaRequestEncoder *)v8 initWithTokenService:v6 bag:v9];

  id v11 = [(AMSMarketingItemTask *)self account];
  [(AMSMediaRequestEncoder *)v10 setAccount:v11];

  id v12 = [(AMSMarketingItemTask *)self clientInfo];
  [(AMSMediaRequestEncoder *)v10 setClientInfo:v12];

  id v13 = [(AMSMarketingItemTask *)self logKey];
  [(AMSMediaRequestEncoder *)v10 setLogKey:v13];

  id v14 = objc_alloc_init(AMSMediaResponseDecoder);
  [(AMSMediaRequestEncoder *)v10 setResponseDecoder:v14];
  id v15 = [(AMSMediaRequestEncoder *)v10 requestWithURL:v7];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__AMSMarketingItemTask__requestForURL_tokenService___block_invoke;
  v19[3] = &unk_1E559E9C0;
  v19[4] = self;
  id v16 = [v15 thenWithBlock:v19];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__AMSMarketingItemTask__requestForURL_tokenService___block_invoke_2;
  v18[3] = &unk_1E559F028;
  v18[4] = self;
  [v16 addErrorBlock:v18];

  return v16;
}

id __52__AMSMarketingItemTask__requestForURL_tokenService___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 account];
  id v5 = objc_msgSend(v4, "ams_iCloudPartition");
  id v6 = [v5 description];
  [v3 setValue:v6 forHTTPHeaderField:@"x-apple-icloud-partition"];

  id v7 = +[AMSPromise promiseWithResult:v3];

  return v7;
}

void __52__AMSMarketingItemTask__requestForURL_tokenService___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedMarketingItemConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 logKey];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v9 = [v3 stringWithFormat:@"%@.%@", @"results", @"data"];
  id v5 = [v4 responseDictionary];

  id v6 = [v5 valueForKeyPath:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7)
    {
      [*(id *)(a1 + 32) finishWithResult:v7];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = AMSError(7, @"Could not find array for key path results.data in response dictionary", @"Data expected is missing.", 0);
  [*(id *)(a1 + 32) finishWithError:v8];

  id v7 = 0;
LABEL_6:
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_11 != -1) {
    dispatch_once(&_MergedGlobals_1_11, &__block_literal_global_38);
  }
  id v2 = (void *)qword_1EB38D168;
  return (NSString *)v2;
}

void __37__AMSMarketingItemTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D168;
  qword_1EB38D168 = @"AMSMarketingItemTask";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D170 != -1) {
    dispatch_once(&qword_1EB38D170, &__block_literal_global_43_0);
  }
  id v2 = (void *)qword_1EB38D178;
  return (NSString *)v2;
}

void __44__AMSMarketingItemTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D178;
  qword_1EB38D178 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (void)setContextInfo:(id)a3
{
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setHydrateRelatedContent:(BOOL)a3
{
  self->_hydrateRelatedContent = a3;
}

- (void)setLogKey:(id)a3
{
}

- (BOOL)includeMediaAssets
{
  return self->_includeMediaAssets;
}

- (void)setIncludeMediaAssets:(BOOL)a3
{
  self->_includeMediaAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_offerHints, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end