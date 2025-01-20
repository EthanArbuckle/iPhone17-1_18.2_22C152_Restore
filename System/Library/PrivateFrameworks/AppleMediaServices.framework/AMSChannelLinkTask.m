@interface AMSChannelLinkTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_postLinkingParametersWithResult:(id)a3 account:(id)a4;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSChannelLinkParams)linkParams;
- (AMSChannelLinkTask)initWithAccount:(id)a3 bag:(id)a4 engagementHandler:(id)a5 guid:(id)a6 linkParams:(id)a7 metrics:(id)a8 msisdn:(id)a9 pacTokenPromise:(id)a10 productCode:(id)a11 requestEncoder:(id)a12 supplementaryFields:(id)a13 urlSession:(id)a14;
- (AMSChannelLinkTask)initWithAccount:(id)a3 bag:(id)a4 linkParams:(id)a5 productCode:(id)a6 supplementaryFields:(id)a7;
- (AMSChannelLinkTaskDelegate)delegate;
- (AMSEngagement)engagementHandler;
- (AMSMetrics)metrics;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)pacTokenPromise;
- (AMSURLRequestEncoder)requestEncoder;
- (AMSURLSession)urlSession;
- (NSDictionary)additionalLinkingParameters;
- (NSDictionary)metricsOverlay;
- (NSSet)supplementaryFields;
- (NSString)guid;
- (NSString)msisdn;
- (NSString)productCode;
- (id)_chainedLinkingResult:(id)a3;
- (id)_linkFailureFromResult:(id)a3;
- (id)_linkParameters;
- (id)_linkURLRequest;
- (id)_metricsEventFromChannelLinkResult:(id)a3 error:(id)a4;
- (id)_performLinking;
- (id)_performLinkingWithValidations;
- (id)_postLinkingActionURLRequestWithResult:(id)a3;
- (id)_processPostLinkingActionsWithResult:(id)a3;
- (id)_processPostLinkingMetricsWithResult:(id)a3 error:(id)a4;
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

@implementation AMSChannelLinkTask

- (AMSChannelLinkTask)initWithAccount:(id)a3 bag:(id)a4 linkParams:(id)a5 productCode:(id)a6 supplementaryFields:(id)a7
{
  id v11 = a7;
  v12 = (void *)MEMORY[0x1E4F18DD0];
  id v29 = a6;
  id v13 = a5;
  id v27 = a4;
  id v28 = a3;
  v14 = +[AMSProcessInfo currentProcess];
  uint64_t v15 = objc_msgSend(v12, "ams_configurationWithProcessInfo:bag:", v14, 0);

  v32 = (void *)v15;
  v16 = [[AMSURLSession alloc] initWithConfiguration:v15 delegate:0 delegateQueue:0];
  LODWORD(v15) = [v11 containsObject:@"MSISDN"];
  int v17 = [v11 containsObject:@"PAC"];
  v18 = 0;
  if (v15)
  {
    v19 = objc_opt_new();
    v18 = [v19 msisdn];
  }
  if (v17)
  {
    v20 = +[AMSDevice voicePreferredPACToken];
  }
  else
  {
    v20 = 0;
  }
  v25 = objc_alloc_init(AMSEngagement);
  v26 = +[AMSDevice deviceGUID];
  v21 = [[AMSChannelLinkParams alloc] initWithString:v13];

  v22 = +[AMSMetrics internalInstanceUsingBag:v27];
  v23 = [[AMSURLRequestEncoder alloc] initWithBag:v27];
  v31 = [(AMSChannelLinkTask *)self initWithAccount:v28 bag:v27 engagementHandler:v25 guid:v26 linkParams:v21 metrics:v22 msisdn:v18 pacTokenPromise:v20 productCode:v29 requestEncoder:v23 supplementaryFields:v11 urlSession:v16];

  return v31;
}

- (AMSChannelLinkTask)initWithAccount:(id)a3 bag:(id)a4 engagementHandler:(id)a5 guid:(id)a6 linkParams:(id)a7 metrics:(id)a8 msisdn:(id)a9 pacTokenPromise:(id)a10 productCode:(id)a11 requestEncoder:(id)a12 supplementaryFields:(id)a13 urlSession:(id)a14
{
  id v37 = a3;
  id v27 = a4;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v28 = a7;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  v38.receiver = self;
  v38.super_class = (Class)AMSChannelLinkTask;
  v23 = [(AMSTask *)&v38 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_account, a3);
    objc_storeStrong((id *)&v24->_bag, v27);
    objc_storeStrong((id *)&v24->_engagementHandler, a5);
    objc_storeStrong((id *)&v24->_guid, a6);
    objc_storeStrong((id *)&v24->_linkParams, v28);
    objc_storeStrong((id *)&v24->_metrics, a8);
    objc_storeStrong((id *)&v24->_msisdn, a9);
    objc_storeStrong((id *)&v24->_pacTokenPromise, a10);
    objc_storeStrong((id *)&v24->_productCode, a11);
    objc_storeStrong((id *)&v24->_requestEncoder, a12);
    objc_storeStrong((id *)&v24->_supplementaryFields, a13);
    objc_storeStrong((id *)&v24->_urlSession, a14);
    [(AMSURLSession *)v24->_urlSession setDelegate:v24];
  }

  return v24;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__AMSChannelLinkTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __29__AMSChannelLinkTask_perform__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _performLinkingWithValidations];
  v3 = [*(id *)(a1 + 32) _chainedLinkingResult:v2];

  return v3;
}

- (id)_chainedLinkingResult:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AMSChannelLinkTask__chainedLinkingResult___block_invoke;
  v8[3] = &unk_1E55A0FC8;
  v8[4] = self;
  v4 = [a3 thenWithBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AMSChannelLinkTask__chainedLinkingResult___block_invoke_2;
  v7[3] = &unk_1E55A0FF0;
  v7[4] = self;
  v5 = [v4 continueWithBlock:v7];

  return v5;
}

uint64_t __44__AMSChannelLinkTask__chainedLinkingResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processPostLinkingActionsWithResult:a2];
}

uint64_t __44__AMSChannelLinkTask__chainedLinkingResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _processPostLinkingMetricsWithResult:a2 error:a3];
}

- (id)_processPostLinkingActionsWithResult:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 subscriptionId];

  if (v6)
  {
    v7 = [(AMSChannelLinkTask *)self urlSession];
    v8 = [(AMSChannelLinkTask *)self _postLinkingActionURLRequestWithResult:v4];
    v9 = [v7 dataTaskPromiseWithRequestPromise:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__AMSChannelLinkTask__processPostLinkingActionsWithResult___block_invoke;
    v14[3] = &unk_1E55A1018;
    v14[4] = self;
    id v10 = v5;
    id v15 = v10;
    id v16 = v4;
    [v9 addFinishBlock:v14];

    id v11 = v16;
    id v12 = v10;
  }
  else
  {
    [v5 finishWithResult:v4];
  }

  return v5;
}

void __59__AMSChannelLinkTask__processPostLinkingActionsWithResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      v9 = AMSLogableError(v4);
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Post linking action failed. Error: %{public}@.", (uint8_t *)&v10, 0x20u);
    }
  }
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 48)];
}

- (id)_processPostLinkingMetricsWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = [(AMSChannelLinkTask *)self _metricsEventFromChannelLinkResult:v6 error:v7];

  int v10 = [(AMSChannelLinkTask *)self _recordEngagementMetricsEvent:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AMSChannelLinkTask__processPostLinkingMetricsWithResult_error___block_invoke;
  v16[3] = &unk_1E559E9E8;
  v16[4] = self;
  id v17 = v6;
  id v11 = v8;
  id v18 = v11;
  id v12 = v6;
  [v10 addFinishBlock:v16];

  id v13 = v18;
  id v14 = v11;

  return v14;
}

void __65__AMSChannelLinkTask__processPostLinkingMetricsWithResult_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [*(id *)(a1 + 32) metrics];
  id v5 = (id)[v4 flush];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v7, "finishWithResult:");
  }
  else if (v9)
  {
    objc_msgSend(v7, "finishWithError:");
  }
  else
  {
    v8 = AMSError(0, @"Unexpectedly completed with no result or error!", 0, 0);
    [v7 finishWithError:v8];
  }
}

- (void)_delegateHandleEngagementRequest:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(AMSChannelLinkTask *)self delegate];

  if (v8)
  {
    id v9 = [(AMSChannelLinkTask *)self delegate];
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
    id v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      int v23 = 138543874;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There is no delegate set to handle engagement request challenge: %{public}@ for this task. Terminating Channel linking", (uint8_t *)&v23, 0x20u);
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
    v26 = v21;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle engagement request", (uint8_t *)&v23, 0x16u);
  }
  id v22 = [(AMSChannelLinkTask *)self delegate];
  [v22 handleEngagementRequest:v7 completion:v6];
}

- (id)_linkFailureFromResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 statusCode];

  if (v4)
  {
    id v5 = [v3 statusCode];
    id v6 = (void *)[v5 integerValue];

    if (!v6) {
      goto LABEL_10;
    }
    id v7 = [v3 error];
    if (!v7)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown error - no error on server response. Code: %ld", v6);
      id v6 = AMSError(0, @"Channel linking failed", v8, 0);

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
      id v6 = AMSError(0, @"Channel linking failed", @"Unknown error - no status code or error in response", 0);
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
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__17;
  id v17 = __Block_byref_object_dispose__17;
  id v18 = (id)objc_opt_new();
  id v3 = [(AMSChannelLinkTask *)self guid];
  id v4 = [(AMSChannelLinkTask *)self linkParams];
  id v5 = [v4 linkParamsString];
  id v6 = [(AMSChannelLinkTask *)self productCode];
  id v7 = [(AMSChannelLinkTask *)self additionalLinkingParameters];
  v8 = [(AMSChannelLinkTask *)self msisdn];
  id v9 = [(AMSChannelLinkTask *)self pacTokenPromise];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__AMSChannelLinkTask__linkParameters__block_invoke;
  v12[3] = &unk_1E55A1040;
  v12[4] = &v13;
  +[AMSChannelLinkRequestParametersBuilder linkRequestParametersWithGuid:v3 linkParams:v5 productCode:v6 additionalParameters:v7 customerID:v8 pacPromise:v9 completionHandler:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __37__AMSChannelLinkTask__linkParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithResult:a2];
}

- (id)_linkURLRequest
{
  id v3 = [(AMSChannelLinkTask *)self bag];
  id v4 = [v3 URLForKey:@"linkChannelSubscription"];

  if (v4)
  {
    id v5 = [v4 valuePromise];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__AMSChannelLinkTask__linkURLRequest__block_invoke;
    v9[3] = &unk_1E55A0E10;
    v9[4] = self;
    uint64_t v6 = [v5 thenWithBlock:v9];
  }
  else
  {
    id v5 = AMSError(2, @"URL Request could not be created", @"bagURL is nil", 0);
    uint64_t v6 = +[AMSPromise promiseWithError:v5];
  }
  id v7 = (void *)v6;

  return v7;
}

id __37__AMSChannelLinkTask__linkURLRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _linkParameters];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__AMSChannelLinkTask__linkURLRequest__block_invoke_2;
  v9[3] = &unk_1E559F320;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  id v7 = [v4 thenWithBlock:v9];

  return v7;
}

id __37__AMSChannelLinkTask__linkURLRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F18D50];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [v3 requestWithURL:v4];
  [v6 setHTTPMethod:@"POST"];
  id v7 = [*(id *)(a1 + 40) requestEncoder];
  [v7 setRequestEncoding:3];

  v8 = [*(id *)(a1 + 40) requestEncoder];
  id v9 = (void *)[v6 copy];
  id v10 = [v8 requestByEncodingRequest:v9 parameters:v5];

  return v10;
}

- (id)_postLinkingActionURLRequestWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSChannelLinkTask *)self bag];
  id v6 = [v5 URLForKey:@"getChannelPostLinkingAction"];

  id v7 = [v6 valuePromise];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__AMSChannelLinkTask__postLinkingActionURLRequestWithResult___block_invoke;
  v11[3] = &unk_1E55A1068;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __61__AMSChannelLinkTask__postLinkingActionURLRequestWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F18D50] requestWithURL:a2];
  [v3 setHTTPMethod:@"POST"];
  id v4 = [*(id *)(a1 + 32) requestEncoder];
  [v4 setRequestEncoding:3];

  id v5 = [*(id *)(a1 + 32) requestEncoder];
  id v6 = (void *)[v3 copy];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) account];
  id v9 = +[AMSChannelLinkTask _postLinkingParametersWithResult:v7 account:v8];
  id v10 = [v5 requestByEncodingRequest:v6 parameters:v9];

  return v10;
}

+ (id)_postLinkingParametersWithResult:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  id v8 = [v6 subscriptionId];
  [v7 setObject:v8 forKeyedSubscript:@"subId"];

  id v9 = [v6 postLinkingFields];

  LODWORD(v6) = [v9 containsObject:@"icloud-partition"];
  if (v6)
  {
    id v10 = objc_msgSend(v5, "ams_iCloudPartition");
    uint64_t v11 = [v10 stringValue];
    [v7 setObject:v11 forKeyedSubscript:@"iCloudPartition"];
  }
  id v12 = (void *)[v7 copy];

  return v12;
}

- (id)_metricsEventFromChannelLinkResult:(id)a3 error:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    uint64_t v13 = [(id)v6 error];
    id v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = (void *)v7;
    }
    id v8 = v15;

    id v16 = [[AMSMetricsEvent alloc] initForEngagement];
    [v16 setProperty:@"carrier-link" forBodyKey:@"eventType"];
    [v16 setProperty:@"AMS" forBodyKey:@"source"];
    id v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v8 == 0];
    [v16 setProperty:v17 forBodyKey:@"success"];

    id v18 = [(id)v6 channelCustomerId];
    [v16 setProperty:v18 forBodyKey:@"channelCustomerId"];

    id v19 = [(id)v6 linkParams];
    uint64_t v20 = [v19 dictionary];
    [v16 setProperty:v20 forBodyKey:@"linkParams"];

    id v21 = [(id)v6 productCode];
    [v16 setProperty:v21 forBodyKey:@"productCode"];

    id v22 = [(id)v6 supplementaryFields];
    [v16 setProperty:v22 forBodyKey:@"supplementaryFields"];

    int v23 = [(id)v6 response];
    uint64_t v24 = +[AMSMetricsEvent sanitizedObject:v23];
    [v16 setProperty:v24 forBodyKey:@"responseDictionary"];

    __int16 v25 = [(AMSChannelLinkTask *)self additionalLinkingParameters];
    v26 = +[AMSMetricsEvent sanitizedObject:v25];
    [v16 setProperty:v26 forBodyKey:@"additionalLinkingParameters"];

    __int16 v27 = [(AMSChannelLinkTask *)self account];
    id v28 = objc_msgSend(v27, "ams_DSID");
    uint64_t v29 = [v28 description];
    [v16 setProperty:v29 forBodyKey:@"accountId"];

    id v30 = [(AMSChannelLinkTask *)self metricsOverlay];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __63__AMSChannelLinkTask__metricsEventFromChannelLinkResult_error___block_invoke;
    v43[3] = &unk_1E55A0958;
    id v12 = v16;
    v44 = v12;
    [v30 enumerateKeysAndObjectsUsingBlock:v43];

    if (v7)
    {
      v45[0] = @"code";
      id v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend((id)v7, "code"));
      v46[0] = v31;
      v45[1] = @"domain";
      uint64_t v32 = [(id)v7 domain];
      id v33 = (void *)v32;
      if (v32) {
        id v34 = (__CFString *)v32;
      }
      else {
        id v34 = &stru_1EDCA7308;
      }
      v46[1] = v34;
      v45[2] = @"title";
      uint64_t v35 = objc_msgSend((id)v7, "ams_title");
      id v36 = (void *)v35;
      if (v35) {
        id v37 = (__CFString *)v35;
      }
      else {
        id v37 = &stru_1EDCA7308;
      }
      v46[2] = v37;
      v45[3] = @"message";
      uint64_t v38 = objc_msgSend((id)v7, "ams_message");
      v39 = (void *)v38;
      if (v38) {
        v40 = (__CFString *)v38;
      }
      else {
        v40 = &stru_1EDCA7308;
      }
      v46[3] = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];

      [v12 setProperty:v41 forBodyKey:@"error"];
    }
    id v9 = v44;
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
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v10;
      __int16 v49 = 2114;
      v50 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No result or error to form metrics around.", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

uint64_t __63__AMSChannelLinkTask__metricsEventFromChannelLinkResult_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setProperty:a3 forBodyKey:a2];
}

- (void)_performDelegateAuthenticationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = [(AMSChannelLinkTask *)self delegate];

  if (v8)
  {
    id v9 = [(AMSChannelLinkTask *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10) {
      goto LABEL_11;
    }
    uint64_t v11 = @"Delegate does not handle authentication requests";
  }
  else
  {
    uint64_t v11 = @"Delegate does not exist";
  }
  uint64_t v12 = AMSError(12, @"AMSChannelLinkTask failed", v11, 0);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
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
      id v31 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform auth request. Error: %{public}@", buf, 0x20u);
    }
    v7[2](v7, 0, v13);
    goto LABEL_16;
  }
LABEL_11:
  id v19 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v19)
  {
    id v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    id v22 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v21;
    __int16 v28 = 2114;
    uint64_t v29 = v22;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle authentication request", buf, 0x16u);
  }
  int v23 = [(AMSChannelLinkTask *)self delegate];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__AMSChannelLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke;
  v24[3] = &unk_1E55A0E38;
  __int16 v25 = v7;
  [v23 handleAuthenticateRequest:v6 completion:v24];

  uint64_t v13 = v25;
LABEL_16:
}

uint64_t __75__AMSChannelLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_performLinkingWithValidations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSChannelLinkTask *)self linkParams];

  if (!v3)
  {
    unint64_t v7 = AMSError(7, @"Missing required field.", @"linkParams is missing", 0);
    id v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    uint64_t v12 = AMSLogableError(v7);
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = v11;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting Channel link task. Error: %{public}@.", buf, 0x20u);

LABEL_13:
    id v6 = +[AMSPromise promiseWithError:v7];
    goto LABEL_14;
  }
  id v4 = [(AMSChannelLinkTask *)self productCode];

  if (!v4)
  {
    unint64_t v7 = AMSError(7, @"Missing required field.", @"productCode is missing", 0);
    id v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v5 = [(AMSChannelLinkTask *)self account];

  if (v5)
  {
    id v6 = [(AMSChannelLinkTask *)self _performLinking];
    goto LABEL_15;
  }
  id v14 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v14)
  {
    id v14 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Account is missing. Prompting for account.", buf, 0x16u);
  }
  unint64_t v7 = [(AMSChannelLinkTask *)self _promptForAccount];
  id v18 = objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__AMSChannelLinkTask__performLinkingWithValidations__block_invoke;
  v24[3] = &unk_1E55A1090;
  void v24[4] = self;
  id v19 = v18;
  id v25 = v19;
  [v7 addSuccessBlock:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__AMSChannelLinkTask__performLinkingWithValidations__block_invoke_158;
  v22[3] = &unk_1E559E7E8;
  v22[4] = self;
  id v20 = v19;
  id v23 = v20;
  [v7 addErrorBlock:v22];
  uint64_t v21 = v23;
  id v6 = v20;

LABEL_14:
LABEL_15:
  return v6;
}

void __52__AMSChannelLinkTask__performLinkingWithValidations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication prompt succeeded. Updating account value.", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [v3 account];

  [*(id *)(a1 + 32) setAccount:v8];
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 32) _performLinking];
  [v9 finishWithPromise:v10];
}

void __52__AMSChannelLinkTask__performLinkingWithValidations__block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = AMSLogKey();
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get account. Error: %{public}@.", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 40) finishWithError:v3];
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
    uint64_t v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v5;
    __int16 v27 = 2114;
    __int16 v28 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning linking.", buf, 0x16u);
  }
  unint64_t v7 = [(AMSChannelLinkTask *)self account];

  if (v7)
  {
    id v8 = [(AMSChannelLinkTask *)self account];
    int v9 = [(AMSChannelLinkTask *)self requestEncoder];
    [v9 setAccount:v8];

    uint64_t v10 = objc_opt_new();
    __int16 v11 = [(AMSChannelLinkTask *)self urlSession];
    uint64_t v12 = [(AMSChannelLinkTask *)self _linkURLRequest];
    __int16 v13 = [v11 dataTaskPromiseWithRequestPromise:v12];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__AMSChannelLinkTask__performLinking__block_invoke;
    v23[3] = &unk_1E559EA10;
    v23[4] = self;
    id v14 = v10;
    id v24 = v14;
    [v13 addFinishBlock:v23];

    uint64_t v15 = v24;
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
    id v19 = [v18 OSLogObject];
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
    AMSError(12, @"Channel linking failed", @"No account at link time", 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = +[AMSPromise promiseWithError:v16];
  }

  return v17;
}

void __37__AMSChannelLinkTask__performLinking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      int v9 = AMSLogKey();
      uint64_t v10 = AMSLogableError(v5);
      int v18 = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Channel Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    __int16 v11 = [*(id *)(a1 + 32) _resultDecodingURLResult:a2];
    uint64_t v12 = [*(id *)(a1 + 32) _linkFailureFromResult:v11];
    if (v12)
    {
      __int16 v13 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v13)
      {
        __int16 v13 = +[AMSLogConfig sharedConfig];
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
        id v23 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Channel Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);
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
  id v5 = [(AMSChannelLinkTask *)self clientInfo];
  [v4 setClientInfo:v5];

  [v4 setDebugReason:@"Account is not present while attempting Channel linking."];
  uint64_t v6 = objc_alloc_init(AMSAuthenticateRequest);
  [(AMSAuthenticateRequest *)v6 setOptions:v4];
  unint64_t v7 = [v3 completionHandlerAdapter];
  [(AMSChannelLinkTask *)self _performDelegateAuthenticationWithRequest:v6 completion:v7];

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
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event.", buf, 0x16u);
  }
  int v9 = [(AMSChannelLinkTask *)self engagementHandler];
  uint64_t v10 = [v4 dictionaryForPosting];

  __int16 v11 = [v9 enqueueData:v10];

  uint64_t v12 = objc_alloc_init(AMSMutableBinaryPromise);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke;
  v17[3] = &unk_1E55A0E88;
  __int16 v13 = v12;
  int v18 = v13;
  uint64_t v19 = self;
  [v11 addFinishBlock:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke_171;
  v16[3] = &unk_1E559F028;
  v16[4] = self;
  [(AMSBinaryPromise *)v13 addErrorBlock:v16];
  id v14 = v13;

  return v14;
}

void __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
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
      int v9 = [v6 request];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke_2;
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

void __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
    uint64_t v6 = [v5 OSLogObject];
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

void __52__AMSChannelLinkTask__recordEngagementMetricsEvent___block_invoke_171(uint64_t a1, void *a2)
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

  uint64_t v6 = [AMSChannelLinkResult alloc];
  uint64_t v7 = [(AMSChannelLinkTask *)self linkParams];
  uint64_t v8 = [(AMSChannelLinkTask *)self supplementaryFields];
  int v9 = [(AMSChannelLinkResult *)v6 initWithResponse:v5 linkParams:v7 supplementaryFields:v8];

  return v9;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a5;
  uint64_t v10 = [(AMSChannelLinkTask *)self delegate];

  if (v10)
  {
    __int16 v11 = [(AMSChannelLinkTask *)self delegate];
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
      id v31 = v20;
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
  id v25 = [(AMSChannelLinkTask *)self delegate];
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
  if (_MergedGlobals_1_7 != -1) {
    dispatch_once(&_MergedGlobals_1_7, &__block_literal_global_29);
  }
  v2 = (void *)qword_1EB38D0E8;
  return (NSString *)v2;
}

void __35__AMSChannelLinkTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D0E8;
  qword_1EB38D0E8 = @"AMSCarrierLinkTask";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D0F0 != -1) {
    dispatch_once(&qword_1EB38D0F0, &__block_literal_global_186);
  }
  v2 = (void *)qword_1EB38D0F8;
  return (NSString *)v2;
}

void __42__AMSChannelLinkTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D0F8;
  qword_1EB38D0F8 = @"1";
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

- (AMSChannelLinkTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSChannelLinkTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSChannelLinkParams)linkParams
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

- (NSSet)supplementaryFields
{
  return self->_supplementaryFields;
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
  objc_storeStrong((id *)&self->_supplementaryFields, 0);
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