@interface AMSUIWebClientContext
+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5;
+ (id)_createClientInfoFromAccount:(id)a3 clientInfo:(id)a4;
+ (id)_sharedSnapshotCache;
- (ACAccount)account;
- (AMSBagProtocol)backingBag;
- (AMSLRUCache)snapshotCache;
- (AMSMescalAccountPrimeSession)mescalSession;
- (AMSMetrics)metrics;
- (AMSProcessInfo)clientInfo;
- (AMSSnapshotBag)bag;
- (AMSUIWebActionRunnerDelegate)actionDelegate;
- (AMSUIWebClientContext)initWithAccount:(id)a3 clientInfo:(id)a4 backingBag:(id)a5;
- (AMSUIWebFlowController)flowController;
- (AMSUIWebJSDataProvider)dataProvider;
- (AMSUIWebPageViewController)webPage;
- (AMSUIWebPluginLoader)pluginLoader;
- (AMSURLSession)URLSession;
- (BOOL)bootstrapComplete;
- (BOOL)disableTrustedDomains;
- (BOOL)loadUsingWebKit;
- (BOOL)reducedMemoryMode;
- (BOOL)signatureResumption;
- (NSDictionary)additionalHeaders;
- (NSDictionary)clientOptions;
- (NSDictionary)metricsOverlay;
- (NSDictionary)performanceMetricsOverlay;
- (NSString)URL;
- (NSString)logKey;
- (NSString)versionNumber;
- (id)JSAccountFromAccount:(id)a3 store:(id)a4;
- (id)iTunesAccountFromJSAccount:(id)a3;
- (id)iTunesAccountFromJSDSID:(id)a3;
- (id)loadSnapshot;
- (void)replaceCurrentAccount:(id)a3 clientInfo:(id)a4;
- (void)setActionDelegate:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setBackingBag:(id)a3;
- (void)setBootstrapComplete:(BOOL)a3;
- (void)setClientOptions:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setLoadUsingWebKit:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMescalSession:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setPerformanceMetricsOverlay:(id)a3;
- (void)setPluginLoader:(id)a3;
- (void)setReducedMemoryMode:(BOOL)a3;
- (void)setSignatureResumption:(BOOL)a3;
- (void)setSnapshotCache:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLSession:(id)a3;
- (void)setVersionNumber:(id)a3;
- (void)setWebPage:(id)a3;
@end

@implementation AMSUIWebClientContext

- (AMSUIWebClientContext)initWithAccount:(id)a3 clientInfo:(id)a4 backingBag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebClientContext;
  v11 = [(AMSUIWebClientContext *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_backingBag, a5);
    objc_storeStrong((id *)&v12->_clientInfo, a4);
    uint64_t v13 = +[AMSUIWebClientContext _sharedSnapshotCache];
    snapshotCache = v12->_snapshotCache;
    v12->_snapshotCache = (AMSLRUCache *)v13;

    [(AMSUIWebClientContext *)v12 replaceCurrentAccount:v8 clientInfo:v9];
  }

  return v12;
}

- (AMSSnapshotBag)bag
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  bag = self->_bag;
  if (!bag)
  {
    v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v4)
    {
      v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      v7 = AMSLogKey();
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] INVALID: Use of bag before bootstrap.", (uint8_t *)&v10, 0x16u);
    }
    bag = self->_backingBag;
  }
  id v8 = bag;
  return v8;
}

- (BOOL)disableTrustedDomains
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    v3 = objc_opt_class();
    LOBYTE(has_internal_content) = [v3 _BOOLForKey:@"AMSUIWebDisableTrustedDomains" defaultValue:0 domain:@"com.apple.AppleMediaServices"];
  }
  return has_internal_content;
}

- (id)iTunesAccountFromJSAccount:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (!v7)
  {
    id v9 = 0;
    goto LABEL_38;
  }
  v31 = [v7 objectForKeyedSubscript:@"DSID"];
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v31, "longLongValue"));
  }
  else
  {
    id v8 = 0;
  }
  int v10 = [v7 objectForKeyedSubscript:@"altDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  __int16 v12 = [v7 objectForKeyedSubscript:@"username"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (!v8)
  {
    if (v11) {
      goto LABEL_18;
    }
LABEL_22:
    if (!v13)
    {
      v29 = self;
      id v30 = 0;
      int v28 = 0;
      if (v8) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  v3 = [(AMSUIWebClientContext *)self account];
  v4 = objc_msgSend(v3, "ams_DSID");
  if ([v4 isEqualToNumber:v8])
  {
LABEL_20:

    goto LABEL_30;
  }
  if (!v11) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v14 = [(AMSUIWebClientContext *)self account];
  v15 = objc_msgSend(v14, "ams_altDSID");
  if (![v15 isEqualToString:v11])
  {
    v27 = v15;
    id v30 = v13;
    if (!v13)
    {
      v29 = self;
      int v28 = 0;
      goto LABEL_32;
    }
    v25 = v14;
LABEL_27:
    v29 = self;
    objc_super v16 = [(AMSUIWebClientContext *)self account];
    v17 = [v16 username];
    id v30 = v13;
    int v28 = [v17 isEqualToString:v13];

    uint64_t v14 = v26;
    if (!v11)
    {
      if (v8) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
LABEL_32:

    if (v8)
    {
LABEL_29:

      self = v29;
      id v13 = v30;
      if (v28) {
        goto LABEL_30;
      }
LABEL_34:
      v19 = (void *)MEMORY[0x263EFB210];
      [(AMSUIWebClientContext *)self clientInfo];
      v21 = id v20 = v13;
      v22 = [v21 accountMediaType];
      v23 = objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v22);

      id v13 = v20;
      id v9 = objc_msgSend(v23, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v8, v20);
      if (!v9)
      {
        id v9 = objc_msgSend(v23, "ams_localiTunesAccount");
      }

      goto LABEL_37;
    }
LABEL_33:
    self = v29;
    id v13 = v30;
    if (v28) {
      goto LABEL_30;
    }
    goto LABEL_34;
  }

  if (v8) {
    goto LABEL_20;
  }
LABEL_30:
  v18 = [(AMSUIWebClientContext *)self account];
  [v18 reload];

  id v9 = [(AMSUIWebClientContext *)self account];
LABEL_37:

LABEL_38:
  return v9;
}

- (id)iTunesAccountFromJSDSID:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v9 = @"DSID";
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(AMSUIWebClientContext *)self iTunesAccountFromJSAccount:v6];

  return v7;
}

- (id)JSAccountFromAccount:(id)a3 store:(id)a4
{
  v53[11] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFFA78];
  if (!v6) {
    goto LABEL_38;
  }
  if (objc_msgSend(v6, "ams_isiTunesAccount"))
  {
    int v9 = objc_msgSend(v6, "ams_isSandboxAccount");
    int v10 = @"iTunes";
    id v11 = @"iTunes.sandbox";
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "ams_isLocalAccount"))
  {
    int v10 = @"local";
  }
  else
  {
    if ((objc_msgSend(v6, "ams_isiCloudAccount") & 1) == 0)
    {
      int v9 = objc_msgSend(v6, "ams_isIDMSAccount");
      int v10 = @"unknown";
      id v11 = @"IDMS";
LABEL_4:
      if (v9) {
        int v10 = v11;
      }
      goto LABEL_11;
    }
    int v10 = @"iCloud";
  }
LABEL_11:
  v49 = v10;
  uint64_t v12 = (uint64_t)v8;
  uint64_t v13 = objc_msgSend(v6, "ams_DSID");
  uint64_t v14 = (void *)v13;
  v15 = &unk_26CC736E8;
  if (v13) {
    v15 = (void *)v13;
  }
  id v48 = v15;

  uint64_t v16 = objc_msgSend(v6, "ams_altDSID");
  v17 = (void *)v16;
  v18 = &stru_26CC491D8;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v51 = v18;

  if (!v7)
  {
    v19 = (void *)MEMORY[0x263EFB210];
    id v20 = [(AMSUIWebClientContext *)self clientInfo];
    v21 = [v20 accountMediaType];
    objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v21);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v22 = objc_msgSend(v7, "ams_iTunesAccountForAccount:", v6);
  v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v6;
  }
  id v25 = v24;

  objc_msgSend(v25, "ams_creditsString");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = objc_msgSend(v25, "ams_firstName");
  objc_msgSend(v25, "ams_lastName");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ams_storefront");
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v28 = [v25 username];
  v52[0] = @"accountFlags";
  uint64_t v29 = objc_msgSend(v6, "ams_accountFlags");
  id v30 = (void *)v29;
  if (v29) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = v12;
  }
  v53[0] = v31;
  v52[1] = @"active";
  v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isActive"));
  v53[1] = v32;
  v53[2] = v51;
  v52[2] = @"altDSID";
  v52[3] = @"credits";
  if (v26) {
    v33 = v26;
  }
  else {
    v33 = &stru_26CC491D8;
  }
  v53[3] = v33;
  v52[4] = @"DSID";
  v34 = [v48 stringValue];

  v47 = (void *)v27;
  if (v27) {
    v35 = (__CFString *)v27;
  }
  else {
    v35 = &stru_26CC491D8;
  }
  v53[4] = v34;
  v53[5] = v35;
  v52[5] = @"firstName";
  v52[6] = @"lastName";
  v36 = v50;
  if (!v50) {
    v36 = &stru_26CC491D8;
  }
  v53[6] = v36;
  v52[7] = @"isManagedAppleID";
  v37 = NSNumber;
  id v38 = v7;
  uint64_t v39 = objc_msgSend(v6, "ams_isManagedAppleID");

  uint64_t v40 = v39;
  id v7 = v38;
  uint64_t v41 = [v37 numberWithBool:v40];
  v42 = (void *)v41;
  if (v46) {
    v43 = v46;
  }
  else {
    v43 = &stru_26CC491D8;
  }
  v53[7] = v41;
  v53[8] = v43;
  v52[8] = @"storefront";
  v52[9] = @"type";
  v52[10] = @"username";
  if (v28) {
    v44 = v28;
  }
  else {
    v44 = &stru_26CC491D8;
  }
  v53[9] = v49;
  v53[10] = v44;
  id v8 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:11];

LABEL_38:
  return v8;
}

- (id)loadSnapshot
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F27B58]);
  if (self->_bag)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v4)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Snapshot already loaded.", buf, 0x16u);
    }
    [v3 finishWithSuccess];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v8 = [(AMSUIWebClientContext *)self backingBag];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __37__AMSUIWebClientContext_loadSnapshot__block_invoke;
    v10[3] = &unk_2643E4B40;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v3;
    [v8 createSnapshotWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __37__AMSUIWebClientContext_loadSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 2, a2);
    [*(id *)(a1 + 32) finishWithSuccess:v6 == 0 error:v6];
  }
  else
  {
    int v9 = *(void **)(a1 + 32);
    int v10 = AMSError();
    [v9 finishWithError:v10];
  }
}

- (void)replaceCurrentAccount:(id)a3 clientInfo:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v9)
  {
    int v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  int v10 = [v9 OSLogObject];
  v55 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = AMSLogKey();
    id v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      uint64_t v4 = AMSLogKey();
      [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    __int16 v15 = };
    uint64_t v16 = AMSHashIfNeeded();
    uint64_t v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v57 = (uint64_t)v15;
    __int16 v58 = 2114;
    v59 = v16;
    __int16 v60 = 2114;
    v61 = v17;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_INFO, "%{public}@Replacing current account with account: %{public}@ | clientInfo: %{public}@", buf, 0x20u);
    if (v11)
    {

      __int16 v15 = (void *)v4;
    }

    id v8 = v55;
  }

  v18 = [(AMSUIWebClientContext *)self clientInfo];
  v54 = [(id)objc_opt_class() _createClientInfoFromAccount:v7 clientInfo:v8];
  objc_storeStrong((id *)&self->_clientInfo, v54);
  if (v7)
  {
    v19 = (ACAccount *)v7;
    account = self->_account;
    self->_account = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x263EFB210];
    account = [(AMSUIWebClientContext *)self clientInfo];
    uint64_t v22 = objc_msgSend(v21, "ams_sharedAccountStoreForClient:", account);
    objc_msgSend(v22, "ams_localiTunesAccount");
    v23 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v24 = self->_account;
    self->_account = v23;
  }
  id v25 = [(AMSUIWebClientContext *)self backingBag];
  char v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v27 = [(AMSUIWebClientContext *)self backingBag];
  int v28 = [v27 processInfo];

  uint64_t v29 = [v28 accountMediaType];

  if (v29)
  {
    char v30 = 0;
    if (!v18) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_17:
    uint64_t v31 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v31)
    {
      uint64_t v31 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_opt_class();
      v34 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v33;
      __int16 v58 = 2114;
      v59 = v34;
      _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unable to locate bag media type", buf, 0x16u);
    }
    uint64_t v29 = 0;
    char v30 = 1;
    if (!v18) {
      goto LABEL_31;
    }
  }
  v35 = [(AMSUIWebClientContext *)self clientInfo];
  v36 = [v35 accountMediaType];
  v37 = v36;
  if (v30)
  {
    id v38 = [v18 accountMediaType];
    char v39 = [v37 isEqualToString:v38];

    if (v39) {
      goto LABEL_31;
    }
  }
  else
  {
    char v40 = [v36 isEqualToString:v29];

    if (v40) {
      goto LABEL_31;
    }
  }
  uint64_t v41 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v41)
  {
    uint64_t v41 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v42 = [v41 OSLogObject];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = objc_opt_class();
    v44 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v43;
    __int16 v58 = 2114;
    v59 = v44;
    _os_log_impl(&dword_21C134000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating bag to match new account type", buf, 0x16u);
  }
  v45 = (void *)MEMORY[0x263F27B28];
  v46 = [(AMSUIWebClientContext *)self backingBag];
  v47 = [v46 profile];
  id v48 = [(AMSUIWebClientContext *)self backingBag];
  v49 = [v48 profileVersion];
  v50 = [(AMSUIWebClientContext *)self clientInfo];
  v51 = [v45 bagForProfile:v47 profileVersion:v49 processInfo:v50];
  [(AMSUIWebClientContext *)self updateBackingBag:v51];

LABEL_31:
  v52 = [(AMSUIWebClientContext *)self dataProvider];
  id v53 = (id)[v52 syncProperties];
}

+ (id)_sharedSnapshotCache
{
  if (_sharedSnapshotCache_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_sharedSnapshotCache_ams_once_token___COUNTER__, &__block_literal_global_20);
  }
  id v2 = (id)_sharedSnapshotCache_ams_once_object___COUNTER__;
  return v2;
}

uint64_t __45__AMSUIWebClientContext__sharedSnapshotCache__block_invoke()
{
  _sharedSnapshotCache_ams_once_object___COUNTER__ = [objc_alloc(MEMORY[0x263F27CA0]) initWithMaxSize:5];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  id v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  else {
    return a4;
  }
}

+ (id)_createClientInfoFromAccount:(id)a3 clientInfo:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v6 copy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F27E08] currentProcess];
  }
  int v10 = v9;

  if (objc_msgSend(v5, "ams_isSandboxAccount"))
  {
    [v10 setAccountMediaType:*MEMORY[0x263F277E8]];
    id v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      int v29 = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Switching to sandbox media type", (uint8_t *)&v29, 0x16u);
    }
  }
  uint64_t v15 = [v10 accountMediaType];
  if (!v15)
  {
LABEL_14:
    id v19 = objc_alloc(MEMORY[0x263F27E08]);
    id v20 = [v6 bundleIdentifier];
    uint64_t v16 = (void *)[v19 initWithBundleIdentifier:v20];

    v21 = [v16 accountMediaType];
    if (v21)
    {
      [v10 setAccountMediaType:v21];
    }
    else
    {
      uint64_t v22 = [MEMORY[0x263F27E08] defaultMediaTypeForCurrentProcess];
      [v10 setAccountMediaType:v22];
    }
    v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v23)
    {
      v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class();
      char v26 = AMSLogKey();
      uint64_t v27 = [v10 accountMediaType];
      int v29 = 138543874;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      v32 = v26;
      __int16 v33 = 2114;
      v34 = v27;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Switching to media type: %{public}@", (uint8_t *)&v29, 0x20u);
    }
    goto LABEL_22;
  }
  uint64_t v16 = (void *)v15;
  if (v5 && (objc_msgSend(v5, "ams_isSandboxAccount") & 1) == 0)
  {
    uint64_t v17 = [v6 accountMediaType];
    int v18 = [v17 isEqualToString:*MEMORY[0x263F277E8]];

    if (!v18) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
LABEL_22:

LABEL_23:
  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSUIWebActionRunnerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (AMSUIWebActionRunnerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (BOOL)bootstrapComplete
{
  return self->_bootstrapComplete;
}

- (void)setBootstrapComplete:(BOOL)a3
{
  self->_bootstrapComplete = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (void)setClientOptions:(id)a3
{
}

- (AMSUIWebJSDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (AMSUIWebFlowController)flowController
{
  return self->_flowController;
}

- (void)setFlowController:(id)a3
{
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (BOOL)loadUsingWebKit
{
  return self->_loadUsingWebKit;
}

- (void)setLoadUsingWebKit:(BOOL)a3
{
  self->_loadUsingWebKit = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSDictionary)performanceMetricsOverlay
{
  return self->_performanceMetricsOverlay;
}

- (void)setPerformanceMetricsOverlay:(id)a3
{
}

- (AMSMescalAccountPrimeSession)mescalSession
{
  return self->_mescalSession;
}

- (void)setMescalSession:(id)a3
{
}

- (AMSUIWebPluginLoader)pluginLoader
{
  return self->_pluginLoader;
}

- (void)setPluginLoader:(id)a3
{
}

- (BOOL)reducedMemoryMode
{
  return self->_reducedMemoryMode;
}

- (void)setReducedMemoryMode:(BOOL)a3
{
  self->_reducedMemoryMode = a3;
}

- (BOOL)signatureResumption
{
  return self->_signatureResumption;
}

- (void)setSignatureResumption:(BOOL)a3
{
  self->_signatureResumption = a3;
}

- (AMSLRUCache)snapshotCache
{
  return self->_snapshotCache;
}

- (void)setSnapshotCache:(id)a3
{
}

- (AMSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (AMSUIWebPageViewController)webPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webPage);
  return (AMSUIWebPageViewController *)WeakRetained;
}

- (void)setWebPage:(id)a3
{
}

- (NSString)URL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URL);
  return (NSString *)WeakRetained;
}

- (void)setURL:(id)a3
{
}

- (AMSBagProtocol)backingBag
{
  return self->_backingBag;
}

- (void)setBackingBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingBag, 0);
  objc_destroyWeak((id *)&self->_URL);
  objc_destroyWeak((id *)&self->_webPage);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_pluginLoader, 0);
  objc_storeStrong((id *)&self->_mescalSession, 0);
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end