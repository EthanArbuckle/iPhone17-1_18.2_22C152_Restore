@interface AMSRatingsStorefrontTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSRatingsStorefrontTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5;
- (NSString)clientIdentifier;
- (id)_queryItems;
- (id)_urlBagKeyForMediaType:(unint64_t)a3;
- (id)_urlForMediaType:(unint64_t)a3;
- (id)performTask;
- (unint64_t)mediaType;
@end

@implementation AMSRatingsStorefrontTask

- (AMSRatingsStorefrontTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSRatingsStorefrontTask;
  v11 = [(AMSTask *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_mediaType = a3;
    objc_storeStrong((id *)&v11->_clientIdentifier, a4);
    objc_storeStrong((id *)&v12->_bag, a5);
  }

  return v12;
}

- (id)performTask
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AMSRatingsStorefrontTask_performTask__block_invoke;
  v5[3] = &unk_1E55A61D0;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSRatingsStorefrontTask;
  v2 = [(AMSTask *)&v4 performTaskWithBlock:v5];
  return v2;
}

AMSRatingsStorefrontResult *__39__AMSRatingsStorefrontTask_performTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  objc_super v4 = -[AMSRatingsCache initWithMediaType:]([AMSRatingsCache alloc], "initWithMediaType:", [*(id *)(a1 + 32) mediaType]);
  [(AMSRatingsCache *)v4 clearCacheIfNeeded];
  v5 = [(AMSRatingsCache *)v4 getCacheData];
  if (v5)
  {
    v6 = -[AMSRatingsStorefrontResult initWithData:mediaType:]([AMSRatingsStorefrontResult alloc], "initWithData:mediaType:", v5, [*(id *)(a1 + 32) mediaType]);
    if (v6)
    {
      v7 = v6;
      goto LABEL_35;
    }
  }
  v47 = a2;
  uint64_t v8 = AMSLogKey();
  id v9 = objc_msgSend(*(id *)(a1 + 32), "_urlForMediaType:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  id v10 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    v13 = [v9 absoluteString];
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v12;
    __int16 v55 = 2114;
    uint64_t v56 = v8;
    __int16 v57 = 2112;
    id v58 = v13;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL for Storefronts: %@.", buf, 0x20u);
  }
  objc_super v14 = [MEMORY[0x1E4F18DA8] requestWithURL:v9];
  v15 = +[AMSMediaSharedProperties propertiesForStorefrontsTask:*(void *)(a1 + 32)];
  v16 = [AMSMediaRequestEncoder alloc];
  v50 = v15;
  v17 = [v15 tokenService];
  v18 = [*(id *)(a1 + 32) bag];
  v19 = [(AMSMediaRequestEncoder *)v16 initWithTokenService:v17 bag:v18];

  [(AMSMediaRequestEncoder *)v19 setLogKey:v8];
  v20 = [(AMSMediaRequestEncoder *)v19 requestByEncodingRequest:v14 parameters:0];
  v21 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v21)
  {
    v21 = +[AMSLogConfig sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v23;
    __int16 v55 = 2114;
    uint64_t v56 = v8;
    __int16 v57 = 2112;
    id v58 = v14;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated: %@.", buf, 0x20u);
  }

  id v52 = 0;
  v48 = v20;
  v24 = [v20 resultWithTimeout:&v52 error:60.0];
  id v25 = v52;
  v26 = v25;
  v49 = v9;
  if (!v24)
  {
    v34 = (void *)v8;
    v35 = 0;
    id v30 = v25;
    if (!v25) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v43 = v19;
  v27 = [v50 session];
  v28 = [v27 dataTaskPromiseWithRequest:v24];

  id v51 = v26;
  v44 = v28;
  uint64_t v29 = [v28 resultWithTimeout:&v51 error:60.0];
  id v30 = v51;

  v45 = v14;
  v46 = (void *)v29;
  if (v30)
  {
    v31 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v31)
    {
      v31 = +[AMSLogConfig sharedConfig];
    }
    v32 = [v31 OSLogObject];
    v19 = v43;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v33;
      __int16 v55 = 2114;
      v34 = (void *)v8;
      uint64_t v56 = v8;
      __int16 v57 = 2112;
      id v58 = v30;
      _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request completed with error: %@.", buf, 0x20u);
    }
    else
    {
      v34 = (void *)v8;
    }
    v35 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v34 = (void *)v8;
  v35 = -[AMSRatingsStorefrontResult initWithURLResult:mediaType:]([AMSRatingsStorefrontResult alloc], "initWithURLResult:mediaType:", v29, [*(id *)(a1 + 32) mediaType]);
  v36 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v36)
  {
    v36 = +[AMSLogConfig sharedConfig];
  }
  v37 = [v36 OSLogObject];
  v19 = v43;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v38;
    __int16 v55 = 2114;
    uint64_t v56 = (uint64_t)v34;
    __int16 v57 = 2112;
    id v58 = v46;
    _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request completed: %@.", buf, 0x20u);
  }

  v39 = [v46 data];
  BOOL v40 = [(AMSRatingsCache *)v4 addCacheData:v39];

  if (!v40)
  {
    v31 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v31)
    {
      v31 = +[AMSLogConfig sharedConfig];
    }
    v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = v41;
      __int16 v55 = 2114;
      uint64_t v56 = (uint64_t)v34;
      _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache data", buf, 0x16u);
    }
    goto LABEL_31;
  }
LABEL_32:

  objc_super v14 = v45;
  if (v30) {
LABEL_33:
  }
    void *v47 = v30;
LABEL_34:
  v7 = v35;

LABEL_35:
  return v7;
}

- (id)_urlBagKeyForMediaType:(unint64_t)a3
{
  if (a3 > 4) {
    return @"AMSRatingsStorefrontMediaURL";
  }
  else {
    return off_1E55A61F0[a3];
  }
}

- (id)_urlForMediaType:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(AMSRatingsStorefrontTask *)self _urlBagKeyForMediaType:a3];
  v5 = [(AMSRatingsStorefrontTask *)self bag];
  v6 = [v5 stringForKey:v4];
  id v28 = 0;
  v7 = [v6 valueWithError:&v28];
  id v8 = v28;

  if (v8 || !v7)
  {
    id v10 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      v21 = AMSHashIfNeeded(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      v32 = v20;
      __int16 v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting URL from the bag for the key: %@.", buf, 0x20u);
    }
    goto LABEL_16;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  if (!v9)
  {
    v22 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = AMSLogKey();
      v26 = AMSHashIfNeeded(v7);
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating URL from string: %@.", buf, 0x20u);
    }
    v11 = AMSError(200, @"Storefronts URL string malformed", @"Failed to create URL from bag-provided URL string", 0);
    id v10 = 0;
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  id v10 = (void *)v9;
  v11 = [(AMSRatingsStorefrontTask *)self _queryItems];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v10 resolvingAgainstBaseURL:0];
  uint64_t v13 = [v12 queryItems];
  objc_super v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    v15 = (void *)v13;
  }
  id v16 = v15;

  v17 = [v16 arrayByAddingObjectsFromArray:v11];

  [v12 setQueryItems:v17];
  v18 = [v12 URL];

LABEL_17:
  return v18;
}

- (id)_queryItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v4 = [(AMSRatingsStorefrontTask *)self bag];
  v5 = [v4 stringForKey:@"language-tag"];
  v6 = [v5 valueWithError:0];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[AMSDevice language];
  }
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"l" value:v9];
    [v3 addObject:v10];
  }
  v11 = +[AMSMediaURLBuilderUtility devicePlatform];
  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"platform" value:v11];
    [v3 addObject:v12];
  }
  if (+[AMSDevice deviceIsChinaSKU])
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"with" value:@"cnformat"];
    [v3 addObject:v13];
  }
  return v3;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSRatingsProvider";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  objc_super v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end