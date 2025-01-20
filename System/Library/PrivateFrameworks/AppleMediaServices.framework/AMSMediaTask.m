@interface AMSMediaTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSMediaTask)initWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 bag:(id)a6;
- (AMSProcessInfo)clientInfo;
- (BOOL)URLKnownToBeTrusted;
- (BOOL)charts;
- (NSArray)additionalPlatforms;
- (NSArray)bundleIdentifiers;
- (NSArray)includedResultKeys;
- (NSArray)itemIdentifiers;
- (NSDictionary)additionalQueryParams;
- (NSDictionary)filters;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)logKey;
- (NSString)searchTerm;
- (id)perform;
- (int64_t)type;
- (void)setAccount:(id)a3;
- (void)setAdditionalPlatforms:(id)a3;
- (void)setAdditionalQueryParams:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setCharts:(BOOL)a3;
- (void)setClientInfo:(id)a3;
- (void)setFilters:(id)a3;
- (void)setIncludedResultKeys:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setURLKnownToBeTrusted:(BOOL)a3;
@end

@implementation AMSMediaTask

- (AMSMediaTask)initWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 bag:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AMSMediaTask;
  v14 = [(AMSTask *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_clientIdentifier, a4);
    objc_storeStrong((id *)&v15->_clientVersion, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
    uint64_t v16 = AMSGenerateLogCorrelationKey();
    logKey = v15->_logKey;
    v15->_logKey = (NSString *)v16;
  }
  return v15;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__AMSMediaTask_perform__block_invoke;
  v4[3] = &unk_1E55A2C20;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __23__AMSMediaTask_perform__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSLogConfig sharedMediaConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    v51 = v6;
    __int16 v52 = 2114;
    v53 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting media task", buf, 0x16u);
  }
  v10 = +[AMSMediaTaskTypeConfig configForType:](AMSMediaTaskTypeConfig, "configForType:", [*(id *)(a1 + 32) type]);
  id v11 = [AMSMediaTaskURLBuilder alloc];
  id v12 = [*(id *)(a1 + 32) clientVersion];
  id v13 = [*(id *)(a1 + 32) bag];
  v14 = [(AMSMediaTaskURLBuilder *)v11 initWithConfig:v10 clientVersion:v12 bag:v13];

  v15 = [*(id *)(a1 + 32) additionalPlatforms];
  [(AMSMediaTaskURLBuilder *)v14 setAdditionalPlatforms:v15];

  uint64_t v16 = [*(id *)(a1 + 32) additionalQueryParams];
  [(AMSMediaTaskURLBuilder *)v14 setAdditionalQueryParams:v16];

  v17 = [*(id *)(a1 + 32) bundleIdentifiers];
  [(AMSMediaTaskURLBuilder *)v14 setBundleIdentifiers:v17];

  -[AMSMediaTaskURLBuilder setCharts:](v14, "setCharts:", [*(id *)(a1 + 32) charts]);
  v18 = [*(id *)(a1 + 32) filters];
  [(AMSMediaTaskURLBuilder *)v14 setFilters:v18];

  objc_super v19 = [*(id *)(a1 + 32) includedResultKeys];
  [(AMSMediaTaskURLBuilder *)v14 setIncludedResultKeys:v19];

  v20 = [*(id *)(a1 + 32) itemIdentifiers];
  [(AMSMediaTaskURLBuilder *)v14 setItemIdentifiers:v20];

  v21 = [*(id *)(a1 + 32) searchTerm];
  [(AMSMediaTaskURLBuilder *)v14 setSearchTerm:v21];

  v22 = [(AMSMediaTaskURLBuilder *)v14 build];
  id v49 = 0;
  v23 = [v22 resultWithTimeout:&v49 error:30.0];
  id v24 = v49;
  if (v23)
  {
    v45 = v10;
    v46 = a2;
    v25 = +[AMSMediaSharedProperties propertiesForMediaTask:*(void *)(a1 + 32)];
    v26 = [AMSMediaRequestEncoder alloc];
    uint64_t v27 = [v25 tokenService];
    v28 = [*(id *)(a1 + 32) bag];
    v29 = [(AMSMediaRequestEncoder *)v26 initWithTokenService:v27 bag:v28];

    v30 = [*(id *)(a1 + 32) account];
    LOBYTE(v27) = objc_msgSend(v30, "ams_isEphemeralAccount");

    if ((v27 & 1) == 0)
    {
      v31 = [*(id *)(a1 + 32) account];
      [(AMSMediaRequestEncoder *)v29 setAccount:v31];
    }
    v32 = [*(id *)(a1 + 32) clientInfo];
    [(AMSMediaRequestEncoder *)v29 setClientInfo:v32];

    v33 = [*(id *)(a1 + 32) logKey];
    [(AMSMediaRequestEncoder *)v29 setLogKey:v33];

    -[AMSMediaRequestEncoder setURLKnownToBeTrusted:](v29, "setURLKnownToBeTrusted:", [*(id *)(a1 + 32) URLKnownToBeTrusted]);
    v44 = objc_alloc_init(AMSMediaResponseDecoder);
    -[AMSMediaRequestEncoder setResponseDecoder:](v29, "setResponseDecoder:");
    v34 = [(AMSMediaRequestEncoder *)v29 requestWithComponents:v23];
    id v48 = v24;
    v35 = [v34 resultWithTimeout:&v48 error:60.0];
    id v36 = v48;

    if (v35)
    {
      v37 = [v25 session];
      [v37 dataTaskPromiseWithRequest:v35];
      v43 = v23;
      v39 = v38 = v22;

      id v47 = v36;
      v40 = [v39 resultWithTimeout:&v47 error:60.0];
      id v41 = v47;

      v22 = v38;
      v23 = v43;
      id v36 = v41;
    }
    else
    {
      v40 = 0;
    }

    id v24 = v36;
    v10 = v45;
    a2 = v46;
    if (v46) {
      goto LABEL_14;
    }
  }
  else
  {
    v40 = 0;
    if (a2) {
LABEL_14:
    }
      *a2 = v24;
  }

  return v40;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (NSDictionary)filters
{
  return self->_filters;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (BOOL)charts
{
  return self->_charts;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (NSDictionary)additionalQueryParams
{
  return self->_additionalQueryParams;
}

- (NSArray)additionalPlatforms
{
  return self->_additionalPlatforms;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)URLKnownToBeTrusted
{
  return self->_URLKnownToBeTrusted;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (void)setAdditionalPlatforms:(id)a3
{
}

void __36__AMSMediaTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D198;
  qword_1EB38D198 = @"1";
}

void __29__AMSMediaTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D188;
  qword_1EB38D188 = @"AMSMediaTask";
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_12 != -1) {
    dispatch_once(&_MergedGlobals_1_12, &__block_literal_global_77);
  }
  v2 = (void *)qword_1EB38D188;
  return (NSString *)v2;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D190 != -1) {
    dispatch_once(&qword_1EB38D190, &__block_literal_global_60);
  }
  v2 = (void *)qword_1EB38D198;
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalQueryParams, 0);
  objc_storeStrong((id *)&self->_additionalPlatforms, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (void)setAccount:(id)a3
{
}

- (void)setAdditionalQueryParams:(id)a3
{
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (void)setCharts:(BOOL)a3
{
  self->_charts = a3;
}

- (void)setClientInfo:(id)a3
{
}

- (void)setFilters:(id)a3
{
}

- (void)setIncludedResultKeys:(id)a3
{
}

- (void)setLogKey:(id)a3
{
}

- (void)setSearchTerm:(id)a3
{
}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  self->_URLKnownToBeTrusted = a3;
}

@end