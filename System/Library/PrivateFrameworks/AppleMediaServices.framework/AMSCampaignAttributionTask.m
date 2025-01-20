@interface AMSCampaignAttributionTask
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_isCampaignAttributorV2Enabled;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4;
- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4 URLSession:(id)a5;
- (AMSCampaignAttributor)campaignAttributor;
- (AMSProcessInfo)clientInfo;
- (AMSURLSession)URLSession;
- (BOOL)_validateAllowlist:(id)a3 error:(id *)a4;
- (NSArray)additionalQueryItems;
- (NSURL)URL;
- (id)_buildProcessRedirectURLWithEndpointURL:(id)a3 error:(id *)a4;
- (id)_encodeRequestForURL:(id)a3 error:(id *)a4;
- (id)_parseAllowedQueryParamsFromInfo:(id)a3 error:(id *)a4;
- (id)_parseCookiesFromResult:(id)a3;
- (id)_parseEndpointURLFromInfo:(id)a3 error:(id *)a4;
- (id)_parseRedirectURLFromResult:(id)a3 error:(id *)a4;
- (id)_processRedirectWithEndpointURL:(id)a3 error:(id *)a4;
- (id)_processRedirectWithRequest:(id)a3 error:(id *)a4;
- (id)_queryItemNames;
- (id)_retrieveProcessRedirectInfoWithError:(id *)a3;
- (id)perform;
- (void)_setAccountCookies:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAdditionalQueryItems:(id)a3;
- (void)setCampaignAttributor:(id)a3;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSCampaignAttributionTask

- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4 URLSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AMSCampaignAttributionTask;
  v12 = [(AMSTask *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_URLSession, a5);
  }
  if (+[AMSCampaignAttributionTask _isCampaignAttributorV2Enabled])
  {
    v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEBUG, "Campaign Attributor V2 is Enabled", v19, 2u);
    }

    v16 = [[AMSCampaignAttributor alloc] initWithBag:v10];
    campaignAttributor = v13->_campaignAttributor;
    v13->_campaignAttributor = v16;
  }
  return v13;
}

- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AMSURLSession defaultSession];
  id v9 = [(AMSCampaignAttributionTask *)self initWithURL:v7 bag:v6 URLSession:v8];

  return v9;
}

- (id)perform
{
  if (+[AMSCampaignAttributionTask _isCampaignAttributorV2Enabled])
  {
    v3 = objc_alloc_init(AMSMutablePromise);
    v4 = [(AMSCampaignAttributionTask *)self account];
    v5 = [(AMSCampaignAttributionTask *)self campaignAttributor];
    [v5 setAccount:v4];

    id v6 = [(AMSCampaignAttributionTask *)self campaignAttributor];
    id v7 = [(AMSCampaignAttributionTask *)self URL];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__AMSCampaignAttributionTask_perform__block_invoke;
    v12[3] = &unk_1E55A0980;
    v8 = v3;
    v13 = v8;
    [v6 processURL:v7 ignoreMarketing:0 completionHandler:v12];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__AMSCampaignAttributionTask_perform__block_invoke_2;
    v11[3] = &unk_1E55A09A8;
    v11[4] = self;
    v10.receiver = self;
    v10.super_class = (Class)AMSCampaignAttributionTask;
    v8 = [(AMSTask *)&v10 performTaskWithBlock:v11];
  }
  return v8;
}

void __37__AMSCampaignAttributionTask_perform__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [[AMSCampaignAttributionResult alloc] initWithURL:v3];
  }
  else
  {
    v4 = 0;
  }
  [*(id *)(a1 + 32) finishWithResult:v4];
}

AMSCampaignAttributionResult *__37__AMSCampaignAttributionTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  id v29 = 0;
  v5 = [v4 _retrieveProcessRedirectInfoWithError:&v29];
  id v6 = v29;
  if (v6)
  {
    id v7 = v6;
    if (a2)
    {
      id v7 = v6;
      v8 = 0;
      *a2 = v7;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v28 = 0;
    objc_super v10 = [v9 _parseAllowedQueryParamsFromInfo:v5 error:&v28];
    id v11 = v28;
    if (v11)
    {
      id v7 = v11;
      if (a2)
      {
        id v7 = v11;
        v8 = 0;
        *a2 = v7;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      id v27 = 0;
      v13 = [v12 _parseEndpointURLFromInfo:v5 error:&v27];
      id v14 = v27;
      if (v14
        || (v15 = *(void **)(a1 + 32),
            id v26 = 0,
            [v15 _validateAllowlist:v10 error:&v26],
            (id v14 = v26) != 0))
      {
        id v7 = v14;
        if (a2)
        {
          id v7 = v14;
          v8 = 0;
          *a2 = v7;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v16 = *(void **)(a1 + 32);
        id v25 = 0;
        v17 = [v16 _processRedirectWithEndpointURL:v13 error:&v25];
        id v18 = v25;
        if (v18)
        {
          id v7 = v18;
          if (a2)
          {
            id v7 = v18;
            v8 = 0;
            *a2 = v7;
          }
          else
          {
            v8 = 0;
          }
        }
        else
        {
          v19 = *(void **)(a1 + 32);
          id v24 = 0;
          objc_super v20 = [v19 _parseRedirectURLFromResult:v17 error:&v24];
          id v21 = v24;
          id v7 = v21;
          if (v21)
          {
            v8 = 0;
            if (a2) {
              *a2 = v21;
            }
          }
          else
          {
            v22 = [*(id *)(a1 + 32) _parseCookiesFromResult:v17];
            [*(id *)(a1 + 32) _setAccountCookies:v22];
            v8 = [[AMSCampaignAttributionResult alloc] initWithURL:v20];
          }
        }
      }
    }
  }
  return v8;
}

+ (BOOL)_isCampaignAttributorV2Enabled
{
  return _os_feature_enabled_impl();
}

- (id)_retrieveProcessRedirectInfoWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [(AMSCampaignAttributionTask *)self bag];
  v5 = [v4 dictionaryForKey:@"processRedirectUrl"];
  id v14 = 0;
  id v6 = [v5 valueWithError:&v14];
  id v7 = v14;

  if (v7)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve process redirect information. Error: %@.", buf, 0x20u);
    }
    if (a3)
    {
      AMSError(204, @"Failed to retrieve process redirect information", 0, v7);
      id v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

- (id)_parseAllowedQueryParamsFromInfo:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"whitelistedQueryParams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve allowed query params", (uint8_t *)&v13, 0x16u);
  }
  if (a4)
  {
    AMSError(204, @"Failed to retrieve allowed query params", 0, 0);
    id v6 = 0;
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }
LABEL_12:

  return v7;
}

- (id)_parseEndpointURLFromInfo:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"endpoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve endpoint", (uint8_t *)&v15, 0x16u);
    }
    if (a4)
    {
      AMSError(204, @"Failed to retrieve endpoint", 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (BOOL)_validateAllowlist:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AMSCampaignAttributionTask *)self _queryItemNames];
  char v8 = [v7 intersectsSet:v6];

  if ((v8 & 1) == 0)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL not for a campaign", (uint8_t *)&v14, 0x16u);
    }
    if (a4)
    {
      AMSError(700, @"URL not for a campaign", 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (id)_queryItemNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F29088]);
  v4 = [(AMSCampaignAttributionTask *)self URL];
  v5 = (void *)[v3 initWithURL:v4 resolvingAgainstBaseURL:1];

  id v6 = [v5 queryItems];
  id v7 = objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_22);

  if (v7) {
    char v8 = v7;
  }
  else {
    char v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

  return v9;
}

uint64_t __45__AMSCampaignAttributionTask__queryItemNames__block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)_processRedirectWithEndpointURL:(id)a3 error:(id *)a4
{
  id v17 = 0;
  id v6 = [(AMSCampaignAttributionTask *)self _buildProcessRedirectURLWithEndpointURL:a3 error:&v17];
  id v7 = v17;
  if (v7)
  {
    id v8 = v7;
    if (a4)
    {
      id v8 = v7;
      id v9 = 0;
      *a4 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v16 = 0;
    uint64_t v10 = [(AMSCampaignAttributionTask *)self _encodeRequestForURL:v6 error:&v16];
    id v11 = v16;
    if (v11)
    {
      id v8 = v11;
      if (a4)
      {
        id v8 = v11;
        id v9 = 0;
        *a4 = v8;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v15 = 0;
      uint64_t v12 = [(AMSCampaignAttributionTask *)self _processRedirectWithRequest:v10 error:&v15];
      id v13 = v15;
      id v8 = v13;
      if (v13)
      {
        id v9 = 0;
        if (a4) {
          *a4 = v13;
        }
      }
      else
      {
        id v9 = v12;
      }
    }
  }

  return v9;
}

- (id)_buildProcessRedirectURLWithEndpointURL:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F290C8];
  id v8 = [(AMSCampaignAttributionTask *)self URL];
  id v9 = [v8 absoluteString];
  uint64_t v10 = [v7 queryItemWithName:@"url" value:v9];

  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v10, 0);
  uint64_t v12 = [(AMSCampaignAttributionTask *)self additionalQueryItems];

  if (v12)
  {
    id v13 = [(AMSCampaignAttributionTask *)self additionalQueryItems];
    [v11 addObjectsFromArray:v13];
  }
  int v14 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
  [v14 setQueryItems:v11];
  id v15 = [v14 URL];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      uint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      id v26 = v21;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to build process redirect URL", buf, 0x16u);
    }
    if (a4)
    {
      AMSError(701, @"Failed to build process redirect URL", 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)_encodeRequestForURL:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [AMSURLRequestEncoder alloc];
  id v8 = [(AMSCampaignAttributionTask *)self bag];
  id v9 = [(AMSURLRequestEncoder *)v7 initWithBag:v8];

  uint64_t v10 = [(AMSCampaignAttributionTask *)self account];
  [(AMSURLRequestEncoder *)v9 setAccount:v10];

  id v11 = AMSLogKey();
  [(AMSURLRequestEncoder *)v9 setLogUUID:v11];

  uint64_t v12 = [(AMSCampaignAttributionTask *)self clientInfo];
  [(AMSURLRequestEncoder *)v9 setClientInfo:v12];

  [(AMSURLRequestEncoder *)v9 setRequestEncoding:1];
  id v13 = [(AMSURLRequestEncoder *)v9 requestWithMethod:4 URL:v6 parameters:0];

  id v22 = 0;
  int v14 = [v13 resultWithTimeout:&v22 error:60.0];
  id v15 = v22;
  if (v15)
  {
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      id v26 = v19;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode process redirect request", buf, 0x16u);
    }
    if (a4)
    {
      AMSError(3, @"Failed to encode process redirect request", 0, v15);
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = v14;
  }

  return v20;
}

- (id)_processRedirectWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AMSCampaignAttributionTask *)self URLSession];
  id v8 = [v7 dataTaskPromiseWithRequest:v6];

  id v18 = 0;
  id v9 = [v8 resultWithTimeout:&v18 error:60.0];
  id v10 = v18;
  if (v10)
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Process redirect request failed", buf, 0x16u);
    }
    if (a4)
    {
      AMSError(3, @"Process redirect request failed", 0, v10);
      id v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v16 = [v9 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v16;
    }
    else {
      id v15 = 0;
    }
  }
  return v15;
}

- (id)_parseRedirectURLFromResult:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"redirectUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Process redirect result missing redirect url", (uint8_t *)&v15, 0x16u);
    }
    if (a4)
    {
      AMSError(701, @"Process redirect result missing redirect url", 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_parseCookiesFromResult:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"setCookies"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

- (void)_setAccountCookies:(id)a3
{
  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_75);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(AMSCampaignAttributionTask *)self account];
  objc_msgSend(v4, "ams_addCookies:", v5);
}

id __49__AMSCampaignAttributionTask__setAccountCookies___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  id v5 = [v3 objectForKeyedSubscript:@"domain"];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F18C10]];

  id v6 = [v3 objectForKeyedSubscript:@"maxAge"];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F18C20]];

  id v7 = [v3 objectForKeyedSubscript:@"name"];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F18C28]];

  id v8 = [v3 objectForKeyedSubscript:@"path"];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F18C38]];

  id v9 = [v3 objectForKeyedSubscript:@"value"];

  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F18C58]];
  id v10 = [MEMORY[0x1E4F18D28] cookieWithProperties:v4];

  return v10;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSCampaignAttribution";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (void)setAdditionalQueryItems:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSURLSession)URLSession
{
  return self->_URLSession;
}

- (AMSCampaignAttributor)campaignAttributor
{
  return self->_campaignAttributor;
}

- (void)setCampaignAttributor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_campaignAttributor, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end