@interface AMSClipMediaTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSClipMediaTask)initWithClientID:(id)a3 bundleID:(id)a4 URL:(id)a5 bag:(id)a6;
- (AMSProcessInfo)clientInfo;
- (NSNumber)externalVersionID;
- (NSString)bundleID;
- (NSString)clientID;
- (NSURL)URL;
- (id)_componentsPromise;
- (id)_performJourneysLookup;
- (id)_performNetworkLookup;
- (id)perform;
- (void)setBag:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientID:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setExternalVersionID:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSClipMediaTask

- (AMSClipMediaTask)initWithClientID:(id)a3 bundleID:(id)a4 URL:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMSClipMediaTask;
  v15 = [(AMSTask *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bag, a6);
    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_clientID, a3);
    uint64_t v17 = +[AMSProcessInfo currentProcess];
    clientInfo = v16->_clientInfo;
    v16->_clientInfo = (AMSProcessInfo *)v17;

    objc_storeStrong((id *)&v16->_URL, a5);
  }

  return v16;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__AMSClipMediaTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __27__AMSClipMediaTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    v6 = [*(id *)(a1 + 32) clientID];
    v7 = [*(id *)(a1 + 32) bundleID];
    v8 = [*(id *)(a1 + 32) URL];
    *(_DWORD *)buf = 138544386;
    uint64_t v16 = v4;
    __int16 v17 = 2114;
    v18 = v5;
    __int16 v19 = 2114;
    objc_super v20 = v6;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting clip media task. (client: %{public}@, bundle: %@, url: %@)", buf, 0x34u);
  }
  v9 = [*(id *)(a1 + 32) bundleID];
  int v10 = [v9 isEqualToString:@"com.apple.ams.ac"];

  id v11 = *(void **)(a1 + 32);
  if (v10) {
    [v11 _performJourneysLookup];
  }
  else {
  id v12 = [v11 _performNetworkLookup];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__AMSClipMediaTask_perform__block_invoke_2;
  v14[3] = &unk_1E55A1180;
  v14[4] = *(void *)(a1 + 32);
  [v12 addFinishBlock:v14];
  return v12;
}

void __27__AMSClipMediaTask_perform__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      v18 = v9;
      int v10 = "%{public}@: [%{public}@] Clip media task finished successfully.";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_10:
      _os_log_impl(&dword_18D554000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v9 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      v18 = v9;
      __int16 v19 = 2114;
      id v20 = v4;
      int v10 = "%{public}@: [%{public}@] Clip media task finished with error. %{public}@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
      goto LABEL_10;
    }
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSMediaTask bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSMediaTask bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSMediaTask createBagForSubProfile];
}

- (id)_performJourneysLookup
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v5;
    __int16 v34 = 2114;
    v35 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing journeys lookup", buf, 0x16u);
  }
  v31[0] = @"AMSClipMediaTask";
  v30[0] = @"source";
  v30[1] = @"url";
  v7 = [(AMSClipMediaTask *)self URL];
  uint64_t v8 = [v7 absoluteString];
  v9 = (void *)v8;
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  else {
    int v10 = &stru_1EDCA7308;
  }
  v31[1] = v10;
  v30[2] = @"clientId";
  uint64_t v11 = [(AMSClipMediaTask *)self clientID];
  os_log_type_t v12 = (void *)v11;
  if (v11) {
    uint32_t v13 = (__CFString *)v11;
  }
  else {
    uint32_t v13 = &stru_1EDCA7308;
  }
  v31[2] = v13;
  v30[3] = @"bundleId";
  uint64_t v14 = [(AMSClipMediaTask *)self bundleID];
  int v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_1EDCA7308;
  }
  v31[3] = v16;
  v30[4] = @"clientInfo";
  v28 = @"bundleId";
  __int16 v17 = [(AMSClipMediaTask *)self clientInfo];
  uint64_t v18 = [v17 bundleIdentifier];
  __int16 v19 = (void *)v18;
  if (v18) {
    id v20 = (__CFString *)v18;
  }
  else {
    id v20 = &stru_1EDCA7308;
  }
  v29 = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[4] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];

  __int16 v23 = objc_alloc_init(AMSEngagement);
  v24 = [(AMSEngagement *)v23 enqueueData:v22];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __42__AMSClipMediaTask__performJourneysLookup__block_invoke;
  v27[3] = &unk_1E55A11A8;
  v27[4] = self;
  uint64_t v25 = [v24 thenWithBlock:v27];

  return v25;
}

id __42__AMSClipMediaTask__performJourneysLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 data];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"metadata"];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E4F1CC08];
  if (v5) {
    uint64_t v8 = (void *)v5;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = v8;

  int v10 = [v3 data];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"body"];
  os_log_type_t v12 = (void *)v11;
  if (v11) {
    uint32_t v13 = (void *)v11;
  }
  else {
    uint32_t v13 = v7;
  }
  id v14 = v13;

  if ([v9 count] && objc_msgSend(v14, "count"))
  {
    int v15 = [*(id *)(a1 + 32) URL];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://"];
    }
    uint64_t v18 = v17;

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F18D40]) initWithURL:v18 statusCode:200 HTTPVersion:0 headerFields:v9];
    uint64_t v21 = [AMSURLResult alloc];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    __int16 v23 = [(AMSURLResult *)v21 initWithTask:0 response:v20 data:v22 object:v14];

    v24 = [[AMSMediaResult alloc] initWithResult:v23];
    __int16 v19 = +[AMSPromise promiseWithResult:v24];
  }
  else
  {
    uint64_t v18 = AMSError(7, @"Clip Media Task Failed", @"No journeys data provided", 0);
    __int16 v19 = +[AMSPromise promiseWithError:v18];
  }

  return v19;
}

- (id)_performNetworkLookup
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network lookup", buf, 0x16u);
  }
  v7 = [[AMSMediaTokenService alloc] initWithClientIdentifier:self->_clientID bag:self->_bag];
  uint64_t v8 = [AMSURLSession alloc];
  id v9 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  int v10 = [(AMSURLSession *)v8 initWithConfiguration:v9];

  uint64_t v11 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v7];
  [(AMSURLSession *)v10 setProtocolHandler:v11];

  os_log_type_t v12 = objc_alloc_init(AMSMediaResponseDecoder);
  [(AMSURLSession *)v10 setResponseDecoder:v12];

  [(AMSMediaTokenService *)v7 setSession:v10];
  uint32_t v13 = [(AMSClipMediaTask *)self _componentsPromise];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __41__AMSClipMediaTask__performNetworkLookup__block_invoke;
  uint64_t v21 = &unk_1E55A11D0;
  id v22 = v7;
  __int16 v23 = self;
  id v14 = v7;
  int v15 = [v13 thenWithBlock:&v18];
  uint64_t v16 = -[AMSURLSession dataTaskPromiseWithRequestPromise:](v10, "dataTaskPromiseWithRequestPromise:", v15, v18, v19, v20, v21);

  return v16;
}

id __41__AMSClipMediaTask__performNetworkLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [AMSMediaRequestEncoder alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [*(id *)(a1 + 40) bag];
  v7 = [(AMSMediaRequestEncoder *)v4 initWithTokenService:v5 bag:v6];

  uint64_t v8 = [*(id *)(a1 + 40) clientInfo];
  [(AMSMediaRequestEncoder *)v7 setClientInfo:v8];

  id v9 = AMSLogKey();
  [(AMSMediaRequestEncoder *)v7 setLogKey:v9];

  int v10 = [(AMSMediaRequestEncoder *)v7 requestWithComponents:v3];

  return v10;
}

- (id)_componentsPromise
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [AMSClipMediaURLBuilder alloc];
  id v4 = [(AMSClipMediaTask *)self bundleID];
  uint64_t v5 = [(AMSClipMediaTask *)self bag];
  v6 = [(AMSClipMediaURLBuilder *)v3 initWithBundleID:v4 bag:v5];

  v7 = [(AMSClipMediaTask *)self externalVersionID];

  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      os_log_type_t v12 = [(AMSClipMediaTask *)self externalVersionID];
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Requesting specific version (unsupported in production) %{public}@", (uint8_t *)&v16, 0x20u);
    }
    uint32_t v13 = [(AMSClipMediaTask *)self externalVersionID];
    [(AMSClipMediaURLBuilder *)v6 setExternalVersionID:v13];
  }
  id v14 = [(AMSClipMediaURLBuilder *)v6 build];

  return v14;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end