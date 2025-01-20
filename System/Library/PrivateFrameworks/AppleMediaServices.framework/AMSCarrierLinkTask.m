@interface AMSCarrierLinkTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSCarrierLinkParams)linkParams;
- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 engagementHandler:(id)a5 guid:(id)a6 linkParams:(id)a7 metrics:(id)a8 msisdn:(id)a9 pacTokenPromise:(id)a10 productCode:(id)a11 requestEncoder:(id)a12 urlSession:(id)a13;
- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 linkParams:(id)a5 productCode:(id)a6;
- (AMSCarrierLinkTaskDelegate)delegate;
- (AMSEngagement)engagementHandler;
- (AMSMetrics)metrics;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)pacTokenPromise;
- (AMSURLRequestEncoder)requestEncoder;
- (AMSURLSession)urlSession;
- (NSDictionary)additionalLinkingParameters;
- (NSDictionary)metricsOverlay;
- (NSString)guid;
- (NSString)msisdn;
- (NSString)productCode;
- (id)_linkFailureFromResult:(id)a3;
- (id)_linkParameters;
- (id)_linkURLRequest;
- (id)_metricsEventFromCarrierLinkResult:(id)a3 error:(id)a4;
- (id)_pacToken;
- (id)_performLinking;
- (id)_performLinkingWithValidations;
- (id)_promptForAccount;
- (id)_recordEngagementMetricsEvent:(id)a3;
- (id)_resultDecodingURLResult:(id)a3;
- (id)perform;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_delegateHandleEngagementRequest:(id)a3 completion:(id)a4;
- (void)_performDelegateAuthenticationWithRequest:(id)a3 completion:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAdditionalLinkingParameters:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsOverlay:(id)a3;
@end

@implementation AMSCarrierLinkTask

- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 linkParams:(id)a5 productCode:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F18DD0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[AMSProcessInfo currentProcess];
  v27 = objc_msgSend(v9, "ams_configurationWithProcessInfo:bag:", v14, 0);

  v21 = [[AMSURLSession alloc] initWithConfiguration:v27 delegate:0 delegateQueue:0];
  v24 = objc_alloc_init(AMSEngagement);
  v23 = +[AMSDevice deviceGUID];
  v20 = [[AMSCarrierLinkParams alloc] initWithString:v11];

  v15 = +[AMSMetrics internalInstanceUsingBag:v12];
  v22 = objc_opt_new();
  v16 = [v22 msisdn];
  v17 = +[AMSDevice voicePreferredPACToken];
  v18 = [[AMSURLRequestEncoder alloc] initWithBag:v12];
  v26 = [(AMSCarrierLinkTask *)self initWithAccount:v13 bag:v12 engagementHandler:v24 guid:v23 linkParams:v20 metrics:v15 msisdn:v16 pacTokenPromise:v17 productCode:v10 requestEncoder:v18 urlSession:v21];

  return v26;
}

- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 engagementHandler:(id)a5 guid:(id)a6 linkParams:(id)a7 metrics:(id)a8 msisdn:(id)a9 pacTokenPromise:(id)a10 productCode:(id)a11 requestEncoder:(id)a12 urlSession:(id)a13
{
  id v35 = a3;
  id v34 = a4;
  id v33 = a5;
  id v26 = a6;
  id v32 = a6;
  id v27 = a7;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  v36.receiver = self;
  v36.super_class = (Class)AMSCarrierLinkTask;
  v22 = [(AMSTask *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_account, a3);
    objc_storeStrong((id *)&v23->_bag, a4);
    objc_storeStrong((id *)&v23->_engagementHandler, a5);
    objc_storeStrong((id *)&v23->_guid, v26);
    objc_storeStrong((id *)&v23->_linkParams, v27);
    objc_storeStrong((id *)&v23->_metrics, a8);
    objc_storeStrong((id *)&v23->_msisdn, a9);
    objc_storeStrong((id *)&v23->_pacTokenPromise, a10);
    objc_storeStrong((id *)&v23->_productCode, a11);
    objc_storeStrong((id *)&v23->_requestEncoder, a12);
    objc_storeStrong((id *)&v23->_urlSession, a13);
    [(AMSURLSession *)v23->_urlSession setDelegate:v23];
  }

  return v23;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__AMSCarrierLinkTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __29__AMSCarrierLinkTask_perform__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _performLinkingWithValidations];
  id v10 = 0;
  v3 = [v2 resultWithError:&v10];
  id v4 = v10;
  v5 = [*(id *)(a1 + 32) _metricsEventFromCarrierLinkResult:v3 error:v4];
  v6 = [*(id *)(a1 + 32) _recordEngagementMetricsEvent:v5];
  [v6 waitUntilFinished];

  v7 = [*(id *)(a1 + 32) metrics];

  id v8 = (id)[v7 flush];
  return v2;
}

- (void)_delegateHandleEngagementRequest:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSCarrierLinkTask *)self delegate];

  if (v8)
  {
    v9 = [(AMSCarrierLinkTask *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = 0;
      goto LABEL_12;
    }
    id v12 = @"Delegate method not implemented";
    id v13 = @"Delegate cannot handle this engagement request";
  }
  else
  {
    id v12 = @"No delegate available";
    id v13 = @"There is no delegate set to handle this engagement request";
  }
  id v11 = AMSError(12, v12, v13, 0);
  if (v11)
  {
    v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      v17 = AMSLogKey();
      int v23 = 138543874;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      id v26 = v17;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There is no delegate set to handle engagement request challenge: %{public}@ for this task. Terminating carrier linking", (uint8_t *)&v23, 0x20u);
    }
  }
LABEL_12:
  id v18 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v18)
  {
    id v18 = +[AMSLogConfig sharedConfig];
  }
  id v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    id v21 = AMSLogKey();
    int v23 = 138543618;
    uint64_t v24 = v20;
    __int16 v25 = 2114;
    id v26 = v21;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle engagement request", (uint8_t *)&v23, 0x16u);
  }
  v22 = [(AMSCarrierLinkTask *)self delegate];
  [v22 handleEngagementRequest:v7 completion:v6];
}

- (id)_linkFailureFromResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 statusCode];

  if (v4)
  {
    v5 = [v3 statusCode];
    id v6 = (void *)[v5 integerValue];

    if (!v6) {
      goto LABEL_10;
    }
    id v7 = [v3 error];
    if (!v7)
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown error - no error on server response. Code: %ld", v6);
      id v6 = AMSError(0, @"Carrier linking failed", v8, 0);

LABEL_8:
      id v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = [v3 error];
    if (!v7)
    {
      id v6 = AMSError(0, @"Carrier linking failed", @"Unknown error - no status code or error in response", 0);
      goto LABEL_8;
    }
  }
  id v9 = v7;
  id v6 = v9;
LABEL_9:

LABEL_10:
  return v6;
}

- (id)_linkParameters
{
  id v3 = objc_opt_new();
  id v4 = [(AMSCarrierLinkTask *)self guid];
  [v3 setObject:v4 forKeyedSubscript:@"guid"];

  v5 = [(AMSCarrierLinkTask *)self msisdn];
  [v3 setObject:v5 forKeyedSubscript:@"channelCustomerId"];

  id v6 = [(AMSCarrierLinkTask *)self linkParams];
  id v7 = [v6 linkParamsString];
  [v3 setObject:v7 forKeyedSubscript:@"linkParams"];

  id v8 = [(AMSCarrierLinkTask *)self productCode];
  [v3 setObject:v8 forKeyedSubscript:@"productCode"];

  id v9 = [(AMSCarrierLinkTask *)self _pacToken];
  [v3 setObject:v9 forKeyedSubscript:@"pac"];

  char v10 = [(AMSCarrierLinkTask *)self additionalLinkingParameters];

  if (v10)
  {
    id v11 = [(AMSCarrierLinkTask *)self additionalLinkingParameters];
    [v3 addEntriesFromDictionary:v11];
  }
  id v12 = (void *)[v3 copy];

  return v12;
}

- (id)_linkURLRequest
{
  id v3 = [(AMSCarrierLinkTask *)self bag];
  id v4 = [v3 URLForKey:@"linkChannelSubscription"];

  if (v4)
  {
    v5 = [v4 valuePromise];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__AMSCarrierLinkTask__linkURLRequest__block_invoke;
    v9[3] = &unk_1E55A0E10;
    v9[4] = self;
    uint64_t v6 = [v5 thenWithBlock:v9];
  }
  else
  {
    v5 = AMSError(2, @"URL Request could not be created", @"bagURL is nil", 0);
    uint64_t v6 = +[AMSPromise promiseWithError:v5];
  }
  id v7 = (void *)v6;

  return v7;
}

id __37__AMSCarrierLinkTask__linkURLRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F18D50] requestWithURL:a2];
  [v3 setHTTPMethod:@"POST"];
  id v4 = [*(id *)(a1 + 32) requestEncoder];
  [v4 setRequestEncoding:3];

  v5 = [*(id *)(a1 + 32) requestEncoder];
  uint64_t v6 = (void *)[v3 copy];
  id v7 = [*(id *)(a1 + 32) _linkParameters];
  id v8 = [v5 requestByEncodingRequest:v6 parameters:v7];

  return v8;
}

- (id)_metricsEventFromCarrierLinkResult:(id)a3 error:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    uint64_t v13 = [(id)v6 error];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = (void *)v7;
    }
    id v8 = v15;

    id v16 = [[AMSMetricsEvent alloc] initForEngagement];
    [v16 setProperty:@"carrier-link" forBodyKey:@"eventType"];
    [v16 setProperty:@"AMS" forBodyKey:@"source"];
    v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v8 == 0];
    [v16 setProperty:v17 forBodyKey:@"success"];

    id v18 = [(id)v6 channelCustomerId];
    [v16 setProperty:v18 forBodyKey:@"channelCustomerId"];

    id v19 = [(id)v6 linkParams];
    uint64_t v20 = [v19 dictionary];
    [v16 setProperty:v20 forBodyKey:@"linkParams"];

    id v21 = [(id)v6 productCode];
    [v16 setProperty:v21 forBodyKey:@"productCode"];

    v22 = [(id)v6 response];
    int v23 = +[AMSMetricsEvent sanitizedObject:v22];
    [v16 setProperty:v23 forBodyKey:@"responseDictionary"];

    uint64_t v24 = [(AMSCarrierLinkTask *)self additionalLinkingParameters];
    __int16 v25 = +[AMSMetricsEvent sanitizedObject:v24];
    [v16 setProperty:v25 forBodyKey:@"additionalLinkingParameters"];

    id v26 = [(AMSCarrierLinkTask *)self account];
    __int16 v27 = objc_msgSend(v26, "ams_DSID");
    v28 = [v27 description];
    [v16 setProperty:v28 forBodyKey:@"accountId"];

    uint64_t v29 = [(AMSCarrierLinkTask *)self metricsOverlay];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __63__AMSCarrierLinkTask__metricsEventFromCarrierLinkResult_error___block_invoke;
    v42[3] = &unk_1E55A0958;
    id v12 = v16;
    v43 = v12;
    [v29 enumerateKeysAndObjectsUsingBlock:v42];

    if (v7)
    {
      v44[0] = @"code";
      id v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend((id)v7, "code"));
      v45[0] = v30;
      v44[1] = @"domain";
      uint64_t v31 = [(id)v7 domain];
      id v32 = (void *)v31;
      if (v31) {
        id v33 = (__CFString *)v31;
      }
      else {
        id v33 = &stru_1EDCA7308;
      }
      v45[1] = v33;
      v44[2] = @"title";
      uint64_t v34 = objc_msgSend((id)v7, "ams_title");
      id v35 = (void *)v34;
      if (v34) {
        objc_super v36 = (__CFString *)v34;
      }
      else {
        objc_super v36 = &stru_1EDCA7308;
      }
      v45[2] = v36;
      v44[3] = @"message";
      uint64_t v37 = objc_msgSend((id)v7, "ams_message");
      v38 = (void *)v37;
      if (v37) {
        v39 = (__CFString *)v37;
      }
      else {
        v39 = &stru_1EDCA7308;
      }
      v45[3] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];

      [v12 setProperty:v40 forBodyKey:@"error"];
    }
    id v9 = v43;
  }
  else
  {
    id v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v10;
      __int16 v48 = 2114;
      v49 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No result or error to form metrics around.", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

uint64_t __63__AMSCarrierLinkTask__metricsEventFromCarrierLinkResult_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setProperty:a3 forBodyKey:a2];
}

- (id)_pacToken
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSCarrierLinkTask *)self pacTokenPromise];

  if (!v3) {
    goto LABEL_9;
  }
  id v4 = [(AMSCarrierLinkTask *)self pacTokenPromise];
  id v17 = 0;
  v5 = [v4 resultWithError:&v17];
  id v6 = v17;

  if (v6)
  {
    unint64_t v7 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v7)
    {
      unint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      id v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2114;
      int v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not retrieve PAC. Error: %{public}@", buf, 0x20u);
    }
  }

  if (!v5)
  {
LABEL_9:
    id v12 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No PAC token available", buf, 0x16u);
    }
    v5 = 0;
  }
  return v5;
}

- (void)_performDelegateAuthenticationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = [(AMSCarrierLinkTask *)self delegate];

  if (v8)
  {
    uint64_t v9 = [(AMSCarrierLinkTask *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10) {
      goto LABEL_11;
    }
    id v11 = @"Delegate does not handle authentication requests";
  }
  else
  {
    id v11 = @"Delegate does not exist";
  }
  uint64_t v12 = AMSError(12, @"AMSCarrierLinkTask failed", v11, 0);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      id v18 = AMSLogableError(v13);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      uint64_t v31 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform auth request. Error: %{public}@", buf, 0x20u);
    }
    v7[2](v7, 0, v13);
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v19 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v19)
  {
    uint64_t v19 = +[AMSLogConfig sharedConfig];
  }
  __int16 v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    __int16 v22 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v21;
    __int16 v28 = 2114;
    uint64_t v29 = v22;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle authentication request", buf, 0x16u);
  }
  int v23 = [(AMSCarrierLinkTask *)self delegate];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__AMSCarrierLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke;
  v24[3] = &unk_1E55A0E38;
  __int16 v25 = v7;
  [v23 handleAuthenticateRequest:v6 completion:v24];

  uint64_t v13 = v25;
LABEL_16:
}

uint64_t __75__AMSCarrierLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_performLinkingWithValidations
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSCarrierLinkTask *)self linkParams];

  if (!v3)
  {
    unint64_t v7 = AMSError(7, @"Missing required field.", @"linkParams is missing", 0);
    id v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    uint64_t v12 = AMSLogableError(v7);
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v10;
    __int16 v35 = 2114;
    objc_super v36 = v11;
    __int16 v37 = 2114;
    v38 = v12;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting carrier link task. Error: %{public}@.", buf, 0x20u);

LABEL_13:
    id v6 = +[AMSPromise promiseWithError:v7];

    goto LABEL_14;
  }
  id v4 = [(AMSCarrierLinkTask *)self productCode];

  if (!v4)
  {
    unint64_t v7 = AMSError(7, @"Missing required field.", @"productCode is missing", 0);
    id v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v5 = [(AMSCarrierLinkTask *)self account];

  if (v5)
  {
    id v6 = [(AMSCarrierLinkTask *)self _performLinking];
  }
  else
  {
    uint64_t v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v16;
      __int16 v35 = 2114;
      objc_super v36 = v17;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Account is missing. Prompting for account.", buf, 0x16u);
    }
    id v18 = [(AMSCarrierLinkTask *)self _promptForAccount];
    id v32 = 0;
    uint64_t v19 = [v18 resultWithError:&v32];
    id v20 = v32;

    uint64_t v21 = +[AMSLogConfig sharedPrivacyConfig];
    __int16 v22 = (void *)v21;
    if (v20)
    {
      if (!v21)
      {
        __int16 v22 = +[AMSLogConfig sharedConfig];
      }
      int v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        __int16 v25 = AMSLogKey();
        id v26 = AMSLogableError(v20);
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v24;
        __int16 v35 = 2114;
        objc_super v36 = v25;
        __int16 v37 = 2114;
        v38 = v26;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get account. Error: %{public}@.", buf, 0x20u);
      }
      uint64_t v27 = +[AMSPromise promiseWithError:v20];
    }
    else
    {
      if (!v21)
      {
        __int16 v22 = +[AMSLogConfig sharedConfig];
      }
      __int16 v28 = [v22 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = objc_opt_class();
        __int16 v30 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v29;
        __int16 v35 = 2114;
        objc_super v36 = v30;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication prompt succeeded. Updating account value.", buf, 0x16u);
      }
      uint64_t v31 = [v19 account];
      [(AMSCarrierLinkTask *)self setAccount:v31];

      uint64_t v27 = [(AMSCarrierLinkTask *)self _performLinking];
    }
    id v6 = (void *)v27;
  }
LABEL_14:
  return v6;
}

- (id)_performLinking
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v5;
    __int16 v27 = 2114;
    __int16 v28 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning linking.", buf, 0x16u);
  }
  unint64_t v7 = [(AMSCarrierLinkTask *)self account];

  if (v7)
  {
    id v8 = [(AMSCarrierLinkTask *)self account];
    uint64_t v9 = [(AMSCarrierLinkTask *)self requestEncoder];
    [v9 setAccount:v8];

    uint64_t v10 = objc_opt_new();
    id v11 = [(AMSCarrierLinkTask *)self urlSession];
    uint64_t v12 = [(AMSCarrierLinkTask *)self _linkURLRequest];
    uint64_t v13 = [v11 dataTaskPromiseWithRequestPromise:v12];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__AMSCarrierLinkTask__performLinking__block_invoke;
    v23[3] = &unk_1E559EA10;
    v23[4] = self;
    id v14 = v10;
    id v24 = v14;
    [v13 addFinishBlock:v23];

    v15 = v24;
    id v16 = v14;

    id v17 = v16;
  }
  else
  {
    id v18 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v18)
    {
      id v18 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      __int16 v28 = v21;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Linking failure. Account is nil.", buf, 0x16u);
    }
    AMSError(12, @"Carrier linking failed", @"No account at link time", 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = +[AMSPromise promiseWithError:v16];
  }

  return v17;
}

void __37__AMSCarrierLinkTask__performLinking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      uint64_t v10 = AMSLogableError(v5);
      int v18 = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      int v23 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _resultDecodingURLResult:a2];
    uint64_t v12 = [*(id *)(a1 + 32) _linkFailureFromResult:v11];
    if (v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        id v16 = AMSLogKey();
        id v17 = AMSLogableError(v12);
        int v18 = 138543874;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        uint64_t v21 = v16;
        __int16 v22 = 2114;
        int v23 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 40) finishWithError:v12];
    }
    else
    {
      [*(id *)(a1 + 40) finishWithResult:v11];
    }
  }
}

- (id)_promptForAccount
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  [v4 setEnableAccountCreation:1];
  [v4 setAuthenticationType:2];
  id v5 = [(AMSCarrierLinkTask *)self clientInfo];
  [v4 setClientInfo:v5];

  [v4 setDebugReason:@"Account is not present while attempting carrier linking."];
  id v6 = objc_alloc_init(AMSAuthenticateRequest);
  [(AMSAuthenticateRequest *)v6 setOptions:v4];
  unint64_t v7 = [v3 completionHandlerAdapter];
  [(AMSCarrierLinkTask *)self _performDelegateAuthenticationWithRequest:v6 completion:v7];

  return v3;
}

- (id)_recordEngagementMetricsEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    int v23 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event.", buf, 0x16u);
  }
  uint64_t v9 = [(AMSCarrierLinkTask *)self engagementHandler];
  uint64_t v10 = [v4 dictionaryForPosting];

  id v11 = [v9 enqueueData:v10];

  uint64_t v12 = objc_alloc_init(AMSMutableBinaryPromise);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke;
  v17[3] = &unk_1E55A0E88;
  uint64_t v13 = v12;
  int v18 = v13;
  uint64_t v19 = self;
  [v11 addFinishBlock:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_140;
  v16[3] = &unk_1E559F028;
  v16[4] = self;
  [(AMSBinaryPromise *)v13 addErrorBlock:v16];
  id v14 = v13;

  return v14;
}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else
  {
    uint64_t v7 = [v5 request];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v6 request];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_2;
      v12[3] = &unk_1E55A0E60;
      int8x16_t v11 = *(int8x16_t *)(a1 + 32);
      id v10 = (id)v11.i64[0];
      int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
      [v8 _delegateHandleEngagementRequest:v9 completion:v12];
    }
    else
    {
      [*(id *)(a1 + 32) finishWithSuccess];
    }
  }
}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement completed successfully", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 40) finishWithSuccess:v4 == 0 error:v4];
}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = (void *)v6;
    uint64_t v8 = &stru_1EDCA7308;
    int v9 = 138543874;
    uint64_t v10 = v5;
    if (v2) {
      uint64_t v8 = v2;
    }
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Engagement failed. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_resultDecodingURLResult:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = [AMSCarrierLinkResult alloc];
  uint64_t v7 = [(AMSCarrierLinkTask *)self linkParams];
  uint64_t v8 = [(AMSCarrierLinkResult *)v6 initWithResponse:v5 linkParams:v7];

  return v8;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a5;
  uint64_t v10 = [(AMSCarrierLinkTask *)self delegate];

  if (v10)
  {
    __int16 v11 = [(AMSCarrierLinkTask *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12) {
      goto LABEL_11;
    }
    __int16 v13 = @"Delegate method not implemented";
    id v14 = @"Delegate cannot handle this dialog request";
  }
  else
  {
    __int16 v13 = @"No delegate available";
    id v14 = @"There is no delegate set to handle dialog requests";
  }
  uint64_t v15 = AMSError(12, v13, v14, 0);
  if (v15)
  {
    id v16 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = AMSLogKey();
      __int16 v20 = AMSLogableError(v15);
      int v26 = 138543874;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      uint64_t v31 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle dialog request. Error: %{public}@", (uint8_t *)&v26, 0x20u);
    }
  }
LABEL_11:
  uint64_t v21 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v21)
  {
    uint64_t v21 = +[AMSLogConfig sharedConfig];
  }
  __int16 v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = AMSLogKey();
    int v26 = 138543618;
    uint64_t v27 = v23;
    __int16 v28 = 2114;
    uint64_t v29 = v24;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle engagement request", (uint8_t *)&v26, 0x16u);
  }
  __int16 v25 = [(AMSCarrierLinkTask *)self delegate];
  [v25 handleDialogRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_5 != -1) {
    dispatch_once(&_MergedGlobals_1_5, &__block_literal_global_27);
  }
  v2 = (void *)qword_1EB38D0A8;
  return (NSString *)v2;
}

void __35__AMSCarrierLinkTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D0A8;
  qword_1EB38D0A8 = @"AMSCarrierLinkTask";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D0B0 != -1) {
    dispatch_once(&qword_1EB38D0B0, &__block_literal_global_156);
  }
  v2 = (void *)qword_1EB38D0B8;
  return (NSString *)v2;
}

void __42__AMSCarrierLinkTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D0B8;
  qword_1EB38D0B8 = @"1";
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

- (NSDictionary)additionalLinkingParameters
{
  return self->_additionalLinkingParameters;
}

- (void)setAdditionalLinkingParameters:(id)a3
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

- (AMSCarrierLinkTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSCarrierLinkTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSCarrierLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSString)productCode
{
  return self->_productCode;
}

- (AMSEngagement)engagementHandler
{
  return self->_engagementHandler;
}

- (NSString)guid
{
  return self->_guid;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSString)msisdn
{
  return self->_msisdn;
}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (AMSPromise)pacTokenPromise
{
  return self->_pacTokenPromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacTokenPromise, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_msisdn, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_engagementHandler, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalLinkingParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end