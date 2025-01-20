@interface AMSURLProtocolHandler
+ (id)reversePushSamplingPercentageForTask:(id)a3;
- (AMSFairPlayDeviceIdentity)fairPlayDeviceIdentity;
- (AMSURLMetricsLoadURLHandler)metricsHandler;
- (AMSURLProtocolHandler)init;
- (AMSURLProtocolHandler)initWithMetricsHandler:(id)a3 fairPlayDeviceIdentity:(id)a4;
- (AMSURLSession)session;
- (id)_URLIsTrustedFromRequest:(id)a3 bag:(id)a4;
- (id)_handleResponse:(id)a3 task:(id)a4;
- (id)_setResponseCookiesFromResponse:(id)a3 taskInfo:(id)a4;
- (id)decodeData:(id)a3 task:(id)a4 error:(id *)a5;
- (id)decodeMutableData:(id)a3 task:(id)a4 error:(id *)a5;
- (id)shouldEnableReversePushForTask:(id)a3;
- (void)_pingURL:(id)a3 session:(id)a4 account:(id)a5 bag:(id)a6;
- (void)decodeMutableData:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)didCreateTask:(id)a3 fromRequest:(id)a4 completionHandler:(id)a5;
- (void)didCreateTask:(id)a3 fromRequest:(id)a4 error:(id *)a5;
- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6;
- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
- (void)reportMetricsForContext:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSURLProtocolHandler

void __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [a2 value];
  if (v2)
  {
    v3 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_opt_class();
      id v6 = v5;
      v7 = AMSLogKey();
      int v8 = 138543618;
      v9 = v5;
      __int16 v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Absinthe action generate.", (uint8_t *)&v8, 0x16u);
    }
  }
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 value];
  if ((_os_feature_enabled_impl() & 1) == 0) {
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = +[AMSPromise promiseWithError:v5];
    goto LABEL_7;
  }
  if (v6 && [v6 actionType])
  {
LABEL_6:
    int v8 = [[AMSOptional alloc] initWithValue:v6];
    v7 = +[AMSPromise promiseWithResult:v8];
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v16 = [*(id *)(a1 + 40) originalRequest];
    __int16 v10 = [*(id *)(a1 + 48) properties];
    v11 = [v10 purchaseInfo];
    uint64_t v12 = [v11 buyParams];
    v13 = [*(id *)(a1 + 48) properties];
    v14 = [v13 bag];
    v15 = [*(id *)(a1 + 56) fairPlayDeviceIdentity];
    v7 = +[AMSFairPlayDeviceIdentityResponseHandler handleResponse:v17 request:v16 buyParams:v12 bag:v14 fairPlayDeviceIdentity:v15];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_2_147;
    v18[3] = &unk_1E55A77F0;
    v18[4] = *(void *)(a1 + 56);
    [v7 addFinishBlock:v18];
  }
LABEL_7:

  return v7;
}

id __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) value];
        if (![*(id *)(a1 + 32) actionType] && objc_msgSend(v12, "actionType"))
        {
          id v13 = v12;

          id v7 = v13;
        }
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v16;
        }
        else
        {
          uint64_t v18 = [v12 authenticateResult];
          uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v17 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;
        }

        uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
        v21 = *(void **)(v20 + 40);
        if (v21)
        {
          id v22 = v21;
          v23 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v22;
        }
        else
        {
          uint64_t v24 = [v12 dialogResult];
          uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
          v23 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = v24;
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }
  v26 = +[AMSPromise promiseWithResult:v7];

  return v26;
}

void __63__AMSURLProtocolHandler_handleResponse_task_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 value];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [a2 value];
  double v5 = v4;
  +[AMSRandomNumberGenerator normalizedRandomDouble];
  if (v6 <= 0.0 || v6 > v5)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v8 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v8)
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) properties];
        v11 = [v10 logUUID];
        uint64_t v12 = NSString;
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = v13;
        if (v11)
        {
          a1 = [*(id *)(a1 + 32) properties];
          uint64_t v2 = [(id)a1 logUUID];
          [v12 stringWithFormat:@"%@: [%@] ", v14, v2];
        }
        else
        {
          [v12 stringWithFormat:@"%@: ", v13];
        v15 = };
        *(_DWORD *)buf = 138543362;
        long long v28 = v15;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Reverse push not sampled", buf, 0xCu);
        if (v11)
        {

          v15 = (void *)a1;
        }
      }
    }
    id v16 = +[AMSBoolean BOOLeanWithBool:0];
    uint64_t v20 = +[AMSPromise promiseWithResult:v16];
  }
  else
  {
    id v16 = [*(id *)(a1 + 48) arrayForKey:@"aps-enabled-patterns"];
    uint64_t v17 = [v16 valuePromise];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke_167;
    v22[3] = &unk_1E55A7888;
    char v26 = *(unsigned char *)(a1 + 72);
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    id v23 = v18;
    uint64_t v24 = v19;
    id v25 = *(id *)(a1 + 64);
    uint64_t v20 = [v17 thenWithBlock:v22];
  }
  return v20;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v5)
    {
      double v5 = +[AMSLogConfig sharedConfig];
    }
    double v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [*(id *)(a1 + 40) properties];
      uint64_t v9 = [v8 logUUID];
      uint64_t v10 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v7;
      __int16 v43 = 2114;
      v44 = v9;
      __int16 v45 = 2114;
      v46 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to set response cookies on account. Continuing with request. error = %{public}@", buf, 0x20u);
    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 48), "ams_valueForHTTPHeaderField:", @"X-Set-Apple-Store-Front");
  if (![v11 length]
    || ([*(id *)(a1 + 40) properties],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 shouldSetStorefrontFromResponse],
        v12,
        !v13))
  {
    uint64_t v24 = +[AMSBinaryPromise promiseWithSuccess];
    goto LABEL_28;
  }
  uint64_t v14 = [*(id *)(a1 + 40) properties];
  v15 = [v14 account];

  if (!v15)
  {
    id v25 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v25)
    {
      id v25 = +[AMSLogConfig sharedConfig];
    }
    char v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      long long v28 = *(void **)(a1 + 40);
      id v29 = v27;
      long long v30 = [v28 properties];
      long long v31 = [v30 logUUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = (uint64_t)v27;
      __int16 v43 = 2114;
      v44 = v31;
      __int16 v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Set store front received (%{public}@) with no account to set it on", buf, 0x20u);
    }
    v32 = AMSError(0, @"Failed to save account with updated storefront", @"No account was provided", 0);
    uint64_t v33 = +[AMSBinaryPromise promiseWithError:v32];
    goto LABEL_25;
  }
  id v16 = [*(id *)(a1 + 40) properties];
  uint64_t v17 = [v16 clientInfo];
  id v18 = [v17 accountMediaType];
  objc_msgSend(v15, "ams_setStorefront:forMediaType:", v11, v18);

  if (objc_msgSend(v15, "ams_isEphemeralAccount"))
  {
    uint64_t v19 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v19)
    {
      uint64_t v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      id v22 = [*(id *)(a1 + 40) properties];
      id v23 = [v22 logUUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v21;
      __int16 v43 = 2114;
      v44 = v23;
      __int16 v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ^Ephemeral Account^ skipping save, set StoreFront: %{public}@", buf, 0x20u);
    }
    uint64_t v24 = +[AMSBinaryPromise promiseWithSuccess];
    goto LABEL_27;
  }
  v34 = (void *)MEMORY[0x1E4F179C8];
  v35 = [*(id *)(a1 + 40) properties];
  v36 = [v35 clientInfo];
  v32 = objc_msgSend(v34, "ams_sharedAccountStoreForProcessInfo:", v36);

  if (!v32)
  {
    uint64_t v33 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_25:
    uint64_t v24 = (void *)v33;
    goto LABEL_26;
  }
  uint64_t v24 = objc_msgSend(v32, "ams_saveAccount:verifyCredentials:", v15, 0);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_119;
  v39[3] = &unk_1E559E7E8;
  v37 = *(void **)(a1 + 40);
  v39[4] = *(void *)(a1 + 32);
  id v40 = v37;
  [v24 addErrorBlock:v39];

LABEL_26:
LABEL_27:

LABEL_28:
  return v24;
}

- (id)_URLIsTrustedFromRequest:(id)a3 bag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(AMSMutablePromise);
  uint64_t v8 = [[AMSURLSentry alloc] initWithBag:v5];

  uint64_t v9 = [v6 URL];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__AMSURLProtocolHandler__URLIsTrustedFromRequest_bag___block_invoke;
  v12[3] = &unk_1E55A0478;
  uint64_t v10 = v7;
  int v13 = v10;
  [(AMSURLSentry *)v8 isTrustedURL:v9 completionHandler:v12];

  return v10;
}

- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(AMSURLProtocolHandler *)self _handleResponse:a3 task:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__AMSURLProtocolHandler_handleResponse_task_completionHandler___block_invoke;
  v11[3] = &unk_1E55A3B00;
  id v12 = v8;
  id v10 = v8;
  [v9 addFinishBlock:v11];
}

- (id)_handleResponse:(id)a3 task:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSURLTaskInfo taskInfoForTask:v7];
  v41 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"X-Apple-Application-Site");
  objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"X-Apple-Jingle-Correlation-Key");
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    id v40 = v9;
  }
  else
  {

    id v40 = @"<private>";
  }
  id v10 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v36 = v12;
    int v13 = [v8 properties];
    uint64_t v14 = [v13 logUUID];
    id v38 = v7;
    v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v6, "ams_statusCode"));
    *(_DWORD *)buf = 138544386;
    v65 = v12;
    __int16 v66 = 2114;
    v67 = v14;
    __int16 v68 = 2114;
    v69 = v15;
    __int16 v70 = 2114;
    v71 = v40;
    __int16 v72 = 2114;
    v73 = v41;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] StatusCode: %{public}@; %{public}@; Environment: %{public}@",
      buf,
      0x34u);

    id v7 = v38;
  }

  v39 = [(AMSURLProtocolHandler *)self _setResponseCookiesFromResponse:v6 taskInfo:v8];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke;
  v61[3] = &unk_1E55A1D20;
  v61[4] = self;
  id v16 = v8;
  id v62 = v16;
  id v17 = v6;
  id v63 = v17;
  v37 = [v39 continueWithBlock:v61];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_127;
  v59[3] = &unk_1E55A7780;
  v59[4] = self;
  id v18 = v16;
  id v60 = v18;
  uint64_t v19 = [v37 catchWithBlock:v59];
  uint64_t v20 = [v19 promiseAdapter];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_128;
  v55[3] = &unk_1E55A77A8;
  id v21 = v17;
  id v56 = v21;
  v57 = self;
  id v22 = v18;
  id v58 = v22;
  id v23 = [v20 thenWithBlock:v55];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_136;
  v51[3] = &unk_1E55A7818;
  id v24 = v22;
  id v52 = v24;
  id v25 = v21;
  id v53 = v25;
  v54 = self;
  char v26 = [v23 continueWithBlock:v51];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_145;
  v46[3] = &unk_1E55A7840;
  id v27 = v25;
  id v47 = v27;
  id v28 = v7;
  id v48 = v28;
  id v29 = v24;
  id v49 = v29;
  v50 = self;
  long long v30 = [v26 continueWithBlock:v46];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_148;
  v42[3] = &unk_1E55A7840;
  v42[4] = self;
  id v43 = v27;
  id v44 = v29;
  id v45 = v28;
  id v31 = v28;
  id v32 = v29;
  id v33 = v27;
  v34 = [v30 continueWithBlock:v42];

  return v34;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_128(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"X-Apple-Partner");
  if (v2)
  {
    id v3 = +[AMSProcessInfo currentProcess];
    [v3 setPartnerHeader:v2];
  }
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"x-apple-aps-delivery-type");
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"x-apple-aps-delivery-type");
    uint64_t v6 = [v5 integerValue];

    if (v6 >= 1)
    {
      id v7 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v7)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_opt_class();
        id v10 = [*(id *)(a1 + 48) properties];
        v11 = [v10 logUUID];
        int v18 = 138543874;
        uint64_t v19 = v9;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2048;
        uint64_t v23 = v6;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reverse push received response header %ld", (uint8_t *)&v18, 0x20u);
      }
      if (v6 == 1001)
      {
        id v12 = [*(id *)(a1 + 48) properties];
        [v12 setReversePushType:2];

        int v13 = +[AMSURLAction retryAction];
        [v13 setReason:@"reverse push"];
        [v13 setRetryIdentifier:0x1EDCC3BA8];
        if (v13 && [v13 actionType]) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
  }
  int v13 = 0;
LABEL_15:
  if (objc_msgSend(*(id *)(a1 + 32), "ams_statusCode") == 401)
  {
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"X-Apple-Allow-Auth-Types");

    if (v14)
    {
      v15 = +[AMSFinanceAuthenticateResponse performAuthFromResponse:*(void *)(a1 + 32) taskInfo:*(void *)(a1 + 48)];
      goto LABEL_19;
    }
  }
LABEL_18:
  id v16 = [[AMSOptional alloc] initWithValue:v13];
  v15 = +[AMSPromise promiseWithResult:v16];

LABEL_19:
  return v15;
}

- (void)decodeMutableData:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[AMSURLTaskInfo taskInfoForTask:v9];
  id v25 = [v11 properties];
  uint64_t v12 = [v25 mescalType];
  int v13 = [v11 properties];
  uint64_t v14 = [v13 bag];
  v15 = +[AMSMescal verificationPromiseForTask:v9 data:v8 type:v12 bag:v14];
  id v16 = [v15 promiseAdapter];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke;
  v32[3] = &unk_1E559ECD0;
  id v17 = v11;
  id v33 = v17;
  v34 = self;
  id v35 = v8;
  id v36 = v9;
  id v24 = v9;
  id v18 = v8;
  uint64_t v19 = [v16 continueWithBlock:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_41;
  v30[3] = &unk_1E55A7550;
  id v20 = v17;
  id v31 = v20;
  id v21 = [v19 catchWithBlock:v30];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_2;
  v26[3] = &unk_1E55A7578;
  id v28 = self;
  id v29 = v10;
  id v27 = v20;
  id v22 = v20;
  id v23 = v10;
  [v21 addFinishBlock:v26];
}

- (id)_setResponseCookiesFromResponse:(id)a3 taskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 properties];
  if ([v8 shouldSetCookiesFromResponse])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = (void *)MEMORY[0x1E4F179C8];
      v11 = [v7 properties];
      uint64_t v12 = [v11 clientInfo];
      int v13 = objc_msgSend(v10, "ams_sharedAccountStoreForProcessInfo:", v12);

      uint64_t v14 = [v7 properties];
      v15 = [v14 account];
      id v16 = objc_msgSend(v13, "ams_addCookiesForResponse:account:", v6, v15);

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__AMSURLProtocolHandler__setResponseCookiesFromResponse_taskInfo___block_invoke;
      v22[3] = &unk_1E559E7E8;
      void v22[4] = self;
      id v23 = v7;
      [v16 addErrorBlock:v22];

      goto LABEL_10;
    }
  }
  else
  {
  }
  id v17 = [v7 properties];
  if ([v17 shouldSetCookiesFromResponse])
  {
  }
  else
  {
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if (v18)
    {
      uint64_t v19 = [v7 properties];
      id v20 = [v19 account];
      id v16 = objc_msgSend(v20, "ams_asynchronouslyAddCookiesForResponse:", v6);

      goto LABEL_10;
    }
  }
  id v16 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_10:

  return v16;
}

+ (id)reversePushSamplingPercentageForTask:(id)a3
{
  id v4 = +[AMSURLTaskInfo taskInfoForTask:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 properties];
    id v7 = [v6 bag];

    if (v7)
    {
      id v8 = objc_alloc_init(AMSMutablePromise);
      id v9 = [v5 properties];
      id v10 = [v9 bag];
      v11 = [v10 doubleForKey:@"aps-sampling-percentage"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__AMSURLProtocolHandler_reversePushSamplingPercentageForTask___block_invoke;
      v18[3] = &unk_1E55A7758;
      id v19 = v5;
      id v21 = a1;
      uint64_t v12 = v8;
      id v20 = v12;
      [v11 valueWithCompletion:v18];

      int v13 = v20;
      uint64_t v14 = v12;

      goto LABEL_7;
    }
    v15 = @"Cannot determine reverse push sampling percentage for a nil bag.";
  }
  else
  {
    v15 = @"Cannot determine reverse push sampling percentage for a nil task.";
  }
  id v16 = AMSError(2, @"Task Missing", v15, 0);
  uint64_t v14 = +[AMSPromise promiseWithError:v16];

LABEL_7:
  return v14;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 value];
  id v7 = v6;
  if (v5)
  {
    id v8 = +[AMSPromise promiseWithError:v5];
  }
  else if (v6 && [v6 actionType])
  {
    id v9 = [[AMSOptional alloc] initWithValue:v7];
    id v8 = +[AMSPromise promiseWithResult:v9];
  }
  else
  {
    if (+[AMSDefaults enableRemoteSecuritySigning]
      && ([*(id *)(a1 + 32) properties],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 remoteSecuritySigningEnabled],
          v10,
          v11))
    {
      uint64_t v12 = +[AMSSigningSecurityService sharedService];
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = [*(id *)(a1 + 32) properties];
      v15 = [v14 bag];
      id v16 = [(AMSOptional *)v12 handleResponse:v13 bag:v15];
      id v8 = [v16 continueWithBlock:&__block_literal_global_134];
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 40);
      char v18 = [*(id *)(a1 + 32) properties];
      id v19 = [v18 bag];
      uint64_t v20 = +[AMSAbsinthe handleResponse:v17 bag:v19];

      uint64_t v12 = [[AMSOptional alloc] initWithValue:v20];
      id v8 = +[AMSPromise promiseWithResult:v12];
      id v7 = (void *)v20;
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_3;
    v22[3] = &unk_1E55A77F0;
    void v22[4] = *(void *)(a1 + 48);
    [v8 addFinishBlock:v22];
  }

  return v8;
}

- (id)shouldEnableReversePushForTask:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[AMSURLTaskInfo taskInfoForTask:v3];
  id v5 = [v4 properties];
  uint64_t v6 = [v5 reversePushType];

  id v7 = [v4 properties];
  id v8 = [v7 purchaseInfo];
  BOOL v9 = v8 != 0;

  id v10 = [v4 properties];
  int v11 = [v10 bag];

  uint64_t v12 = [v4 properties];
  uint64_t v13 = [v12 logUUID];

  uint64_t v14 = [v3 currentRequest];
  v15 = [v14 URL];
  id v16 = [v15 absoluteString];

  if (+[AMSDefaults QAMode])
  {
    if (v8)
    {
      uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      char v18 = [v17 OSLogObject];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      id v19 = NSString;
      uint64_t v20 = objc_opt_class();
      if (v13) {
        [v19 stringWithFormat:@"%@: [%@] ", v20, v13];
      }
      else {
      id v32 = [v19 stringWithFormat:@"%@: ", v20, v44];
      }
      *(_DWORD *)buf = 138543362;
      v54 = v32;
      id v33 = "%{public}@Reverse push disabled (QAMode)";
      goto LABEL_36;
    }
  }
  else if ((unint64_t)(v6 - 1) > 1)
  {
    if (v6 == 3)
    {
      id v23 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v23)
      {
        id v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = NSString;
        uint64_t v26 = objc_opt_class();
        if (v13) {
          [v25 stringWithFormat:@"%@: [%@] ", v26, v13];
        }
        else {
        v39 = [v25 stringWithFormat:@"%@: ", v26, v44];
        }
        *(_DWORD *)buf = 138543362;
        v54 = v39;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Reverse push explicitly enabled by caller", buf, 0xCu);
      }
      uint64_t v36 = 1;
      goto LABEL_40;
    }
    if (+[AMSDefaults reversePushEnabled] != 2)
    {
      if (v16)
      {
        if (v11)
        {
          if (+[AMSDefaults reversePushEnabled] == 1)
          {
            id v29 = +[AMSDouble doubleWithDouble:1.0];
            long long v30 = +[AMSPromise promiseWithResult:v29];

            id v31 = self;
          }
          else
          {
            id v31 = self;
            long long v30 = [(id)objc_opt_class() reversePushSamplingPercentageForTask:v3];
          }
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke;
          v46[3] = &unk_1E55A78B0;
          BOOL v52 = v9;
          id v47 = v4;
          id v48 = v31;
          id v49 = v11;
          id v50 = v13;
          id v51 = v16;
          v37 = [v30 thenWithBlock:v46];

          goto LABEL_41;
        }
        if (!v8) {
          goto LABEL_39;
        }
        uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
        if (!v17)
        {
          uint64_t v17 = +[AMSLogConfig sharedConfig];
        }
        char v18 = [v17 OSLogObject];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        uint64_t v42 = NSString;
        uint64_t v43 = objc_opt_class();
        if (v13) {
          [v42 stringWithFormat:@"%@: [%@] ", v43, v13];
        }
        else {
        id v32 = [v42 stringWithFormat:@"%@: ", v43, v44];
        }
        *(_DWORD *)buf = 138543362;
        v54 = v32;
        id v33 = "%{public}@Reverse push disabled because we the bag is nil.";
      }
      else
      {
        if (!v8) {
          goto LABEL_39;
        }
        uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
        if (!v17)
        {
          uint64_t v17 = +[AMSLogConfig sharedConfig];
        }
        char v18 = [v17 OSLogObject];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        id v40 = NSString;
        uint64_t v41 = objc_opt_class();
        if (v13) {
          [v40 stringWithFormat:@"%@: [%@] ", v41, v13];
        }
        else {
        id v32 = [v40 stringWithFormat:@"%@: ", v41, v44];
        }
        *(_DWORD *)buf = 138543362;
        v54 = v32;
        id v33 = "%{public}@Reverse push disabled because we can’t find a URL";
      }
      v34 = v18;
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      goto LABEL_37;
    }
    if (v8)
    {
      uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      char v18 = [v17 OSLogObject];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_38;
      }
      id v27 = NSString;
      uint64_t v28 = objc_opt_class();
      if (v13) {
        [v27 stringWithFormat:@"%@: [%@] ", v28, v13];
      }
      else {
      id v32 = [v27 stringWithFormat:@"%@: ", v28, v44];
      }
      *(_DWORD *)buf = 138543362;
      v54 = v32;
      id v33 = "%{public}@Reverse push disabled (AMSDefaults)";
      v34 = v18;
      os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
      goto LABEL_37;
    }
  }
  else if (v8)
  {
    uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    char v18 = [v17 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    id v21 = NSString;
    uint64_t v22 = objc_opt_class();
    if (v13) {
      [v21 stringWithFormat:@"%@: [%@] ", v22, v13];
    }
    else {
    id v32 = [v21 stringWithFormat:@"%@: ", v22, v44];
    }
    *(_DWORD *)buf = 138543362;
    v54 = v32;
    id v33 = "%{public}@Reverse push disabled by caller";
LABEL_36:
    v34 = v18;
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
LABEL_37:
    _os_log_impl(&dword_18D554000, v34, v35, v33, buf, 0xCu);

LABEL_38:
  }
LABEL_39:
  uint64_t v36 = 0;
LABEL_40:
  long long v30 = +[AMSBoolean BOOLeanWithBool:v36];
  v37 = +[AMSPromise promiseWithResult:v30];
LABEL_41:

  return v37;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_148(id *a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v48 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = a1[5];
      id v7 = [v5 value];
      id v8 = v7;
      if (!v7 || ![v7 actionType])
      {
        BOOL v9 = [a1[6] properties];
        uint64_t v10 = [v9 anisetteType];
        int v11 = [a1[6] properties];
        [v11 bag];
        uint64_t v12 = v47 = v5;
        uint64_t v13 = [a1[6] properties];
        uint64_t v14 = [v13 account];
        uint64_t v15 = +[AMSAnisette handleResponse:v6 type:v10 bag:v12 account:v14];

        id v5 = v47;
        id v8 = (void *)v15;
        if (!v15) {
          goto LABEL_34;
        }
      }
      if (![v8 actionType])
      {
LABEL_34:
        char v49 = 0;
        id v16 = +[AMSURLSession sharedAuthKitSession];
        uint64_t v17 = [a1[7] currentRequest];
        [v16 handleResponse:v6 forRequest:v17 shouldRetry:&v49];

        if (v49)
        {
          char v18 = +[AMSURLAction retryAction];

          [v18 setRetryIdentifier:0x1EDCC3B08];
          id v19 = +[AMSLogConfig sharedURLLoadingConfig];
          if (!v19)
          {
            id v19 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v20 = [v19 OSLogObject];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = objc_opt_class();
            uint64_t v22 = [a1[6] properties];
            id v23 = [v22 logUUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v21;
            __int16 v52 = 2114;
            id v53 = v23;
            _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying for AuthKit anisette", buf, 0x16u);
          }
          id v8 = v18;
        }
      }
      id v24 = [[AMSOptional alloc] initWithValue:v8];
      id v25 = +[AMSPromise promiseWithResult:v24];

      if (!v8 || ![v8 actionType])
      {
        uint64_t v26 = [a1[4] session];
        if (!v26)
        {
          id v27 = +[AMSLogConfig sharedURLLoadingConfig];
          if (!v27)
          {
            id v27 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v28 = [v27 OSLogObject];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = objc_opt_class();
            long long v30 = [a1[6] properties];
            id v31 = [v30 logUUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v29;
            __int16 v52 = 2114;
            id v53 = v31;
            _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL session is unexpectedly nil for Fraud Report, using default session", buf, 0x16u);
          }
          uint64_t v26 = +[AMSURLSession defaultSession];
        }
        id v32 = [a1[6] properties];
        id v33 = [v32 account];
        v34 = [a1[6] properties];
        os_log_type_t v35 = [v34 bag];
        uint64_t v36 = AMSFraudReportHandleResponse(v26, v6, v33, v35);

        id v25 = (void *)v36;
      }
    }
    else
    {
      id v25 = +[AMSPromise promiseWithResult:v5];
    }
  }
  else
  {
    v37 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v37)
    {
      v37 = +[AMSLogConfig sharedConfig];
    }
    id v38 = [v37 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      id v40 = v39;
      uint64_t v41 = AMSLogKey();
      uint64_t v42 = AMSLogableError(v48);
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = (uint64_t)v39;
      __int16 v52 = 2114;
      id v53 = v41;
      __int16 v54 = 2114;
      uint64_t v55 = v42;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error occurred when handling response. error = %{public}@", buf, 0x20u);
    }
    uint64_t v43 = [AMSOptional alloc];
    uint64_t v44 = +[AMSURLAction actionWithError:v48];
    id v45 = [(AMSOptional *)v43 initWithValue:v44];
    id v25 = +[AMSPromise promiseWithResult:v45];
  }
  return v25;
}

- (void)didCreateTask:(id)a3 fromRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[AMSURLTaskInfo taskInfoForTask:v8];
  uint64_t v12 = [v11 properties];
  int v13 = [v12 knownToBeTrusted];

  if (v13)
  {
    uint64_t v14 = +[AMSBoolean BOOLeanWithBool:1];
    uint64_t v15 = +[AMSPromise promiseWithResult:v14];
  }
  else
  {
    uint64_t v14 = [v11 properties];
    id v16 = [v14 bag];
    uint64_t v15 = [(AMSURLProtocolHandler *)self _URLIsTrustedFromRequest:v9 bag:v16];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke;
  v21[3] = &unk_1E55A75C8;
  id v22 = v11;
  id v23 = self;
  id v25 = v8;
  id v26 = v10;
  id v24 = v9;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  [v15 addFinishBlock:v21];
}

void __54__AMSURLProtocolHandler__URLIsTrustedFromRequest_bag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    id v5 = +[AMSBoolean BOOLeanWithBool:a2];
    [v3 finishWithResult:v5];
  }
}

id __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    id v16 = a1[6];
    id v17 = [a1[7] response];
    id v18 = objc_msgSend(v17, "ams_valueForHTTPHeaderField:", @"Content-Encoding");

    if (v18 && ![v18 caseInsensitiveCompare:@"gzip"])
    {
      id v19 = +[AMSData decompressedDataWithGzippedData:a1[6]];
      id v20 = v19;
      if (v19)
      {
        id v21 = v19;

        id v16 = v21;
      }
    }
    if ([v6 BOOLValue]
      && ([a1[4] properties],
          id v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 disableResponseDecoding],
          v22,
          (v23 & 1) == 0))
    {
      uint64_t v29 = [a1[4] response];
      id v31 = 0;
      id v24 = +[AMSData objectWithData:v16 response:v29 error:&v31];
      id v25 = (AMSOptional *)v31;

      if (v25)
      {
        long long v30 = AMSError(4, @"Data decoding failed", @"Failed to decode data in response", v25);
        id v26 = +[AMSPromise promiseWithError:v30];

        goto LABEL_16;
      }
    }
    else
    {
      id v24 = 0;
    }
    id v25 = [[AMSOptional alloc] initWithValue:v24];
    id v26 = +[AMSPromise promiseWithResult:v25];
LABEL_16:

    goto LABEL_22;
  }
  id v8 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [a1[4] properties];
    int v11 = [v10 logUUID];
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      a1 = [a1[4] properties];
      id v3 = [a1 logUUID];
      [v12 stringWithFormat:@"%@: [%@] ", v14, v3];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    uint64_t v15 = };
    id v27 = AMSLogableError(v7);
    *(_DWORD *)buf = 138543618;
    id v33 = v15;
    __int16 v34 = 2114;
    os_log_type_t v35 = v27;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Protocol encountered verification error = %{public}@", buf, 0x16u);
    if (v11)
    {

      uint64_t v15 = a1;
    }
  }
  AMSError(304, @"Mescal Verification Failed", @"Failed to verify mescal response header", v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = +[AMSPromise promiseWithError:v16];
LABEL_22:

  return v26;
}

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[AMSURLTaskInfo taskInfoForTask:v9];
    uint64_t v13 = [[AMSFinanceResponse alloc] initWithTaskInfo:v12 decodedObject:v10];
    if (!v13)
    {
      uint64_t v14 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v14)
      {
        uint64_t v14 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        id v16 = [v12 properties];
        id v17 = [v16 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2114;
        __int16 v34 = v17;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to parse decodedObject", buf, 0x16u);
      }
    }
    id v18 = [v12 response];
    id v19 = [(AMSURLProtocolHandler *)self session];
    id v20 = +[AMSBiometrics handleResponse:v18 financeResponse:v13 session:v19 taskInfo:v12];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
    v25[3] = &unk_1E55A76E0;
    id v26 = v13;
    id v27 = self;
    id v28 = v12;
    id v29 = v9;
    id v30 = v11;
    id v21 = v12;
    id v22 = v13;
    [v20 addFinishBlock:v25];
  }
  else
  {
    char v23 = +[AMSURLAction proceedAction];
    (*((void (**)(id, void *))v11 + 2))(v11, v23);
  }
}

- (AMSURLSession)session
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  os_unfair_lock_unlock(p_propertiesLock);
  return (AMSURLSession *)WeakRetained;
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) pingURLs];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v13 = *(void *)v15;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v15 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v14 + 1) + 8 * v4);
        id v6 = *(void **)(a1 + 40);
        id v7 = +[AMSURLSession defaultSession];
        id v8 = [*(id *)(a1 + 48) properties];
        id v9 = [v8 account];
        id v10 = [*(id *)(a1 + 48) properties];
        id v11 = [v10 bag];
        [v6 _pingURL:v5 session:v7 account:v9 bag:v11];

        ++v4;
      }
      while (v3 != v4);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__73;
  v48[4] = __Block_byref_object_dispose__73;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__73;
  void v46[4] = __Block_byref_object_dispose__73;
  id v47 = 0;
  if (v6 || v5 && [v5 actionType])
  {
    id v7 = +[AMSPromise promiseWithResult:v5];
  }
  else
  {
    if ([*(id *)(a1 + 32) supportedProtocolVersion])
    {
      id v8 = objc_alloc_init(AMSPromiseSerialQueue);
      id v9 = [*(id *)(a1 + 32) actions];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_67;
      v43[3] = &unk_1E55A7640;
      id v10 = v8;
      uint64_t v44 = v10;
      id v45 = *(id *)(a1 + 48);
      id v11 = objc_msgSend(v9, "ams_mapWithTransform:", v43);

      uint64_t v12 = +[AMSPromise promiseWithAll:v11];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_4;
      v39[3] = &unk_1E55A7668;
      id v40 = v5;
      uint64_t v41 = v48;
      uint64_t v42 = v46;
      id v7 = [v12 continueWithBlock:v39];

      uint64_t v13 = v44;
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) versionMismatchURL];
      long long v14 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v14)
      {
        long long v14 = +[AMSLogConfig sharedConfig];
      }
      long long v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (id)objc_opt_class();
        long long v16 = [*(id *)(a1 + 48) properties];
        long long v17 = [v16 logUUID];
        id v18 = AMSLogableURL(v10);
        *(_DWORD *)buf = 138543874;
        id v51 = v25;
        __int16 v52 = 2114;
        id v53 = v17;
        __int16 v54 = 2114;
        uint64_t v55 = v18;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unsupported protocol version, redirecting to: %{public}@", buf, 0x20u);
      }
      uint64_t v13 = +[AMSURLAction redirectActionWithURL:v10];
      id v7 = +[AMSPromise promiseWithResult:v13];
    }

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_5;
    v35[3] = &unk_1E55A7690;
    id v19 = *(id *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = *(void **)(a1 + 48);
    id v36 = v19;
    uint64_t v37 = v20;
    id v38 = v21;
    [v7 addFinishBlock:v35];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_6;
  v26[3] = &unk_1E55A76B8;
  id v22 = v6;
  id v27 = v22;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 40);
  id v28 = v23;
  uint64_t v29 = v24;
  id v30 = *(id *)(a1 + 56);
  id v31 = *(id *)(a1 + 48);
  __int16 v33 = v48;
  __int16 v34 = v46;
  id v32 = *(id *)(a1 + 64);
  [v7 resultWithCompletion:v26];

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 32) || v5 && [v5 actionType]) {
    goto LABEL_2;
  }
  id v9 = [*(id *)(a1 + 40) serverError];

  if (!v9) {
    goto LABEL_2;
  }
  id v10 = [*(id *)(a1 + 48) session];
  id v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  uint64_t v13 = [*(id *)(a1 + 48) session];
  long long v14 = [v13 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v12)
  {
    long long v16 = [*(id *)(a1 + 48) session];
    long long v17 = [v16 delegate];
    id v18 = [*(id *)(a1 + 48) session];
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = [*(id *)(a1 + 40) serverError];
    LOBYTE(v19) = [v17 AMSURLSession:v18 task:v19 shouldFailWithServerError:v20];

    if ((v19 & 1) == 0) {
      goto LABEL_2;
    }
    goto LABEL_15;
  }
  if ((v15 & 1) == 0) {
    goto LABEL_15;
  }
  id v21 = +[AMSLogConfig sharedConfig];
  id v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = objc_opt_class();
    uint64_t v24 = *(void **)(a1 + 64);
    id v25 = v23;
    id v26 = [v24 properties];
    id v27 = [v26 logUUID];
    int v34 = 138543618;
    uint64_t v35 = v23;
    __int16 v36 = 2114;
    uint64_t v37 = v27;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for shouldFailWithServerError", (uint8_t *)&v34, 0x16u);
  }
  id v28 = [*(id *)(a1 + 48) session];
  uint64_t v29 = [v28 delegate];
  id v30 = [*(id *)(a1 + 48) session];
  id v31 = [*(id *)(a1 + 40) serverError];
  int v32 = [v29 AMSURLSession:v30 shouldFailWithServerError:v31];

  if (v32)
  {
LABEL_15:
    uint64_t v33 = [*(id *)(a1 + 40) serverError];

    id v7 = (id)v33;
  }
LABEL_2:
  if (v7)
  {
    uint64_t v8 = +[AMSURLAction actionWithError:v7];

    id v5 = (id)v8;
  }
  [v5 setAuthenticateResult:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [v5 setDialogResult:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)reportMetricsForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLProtocolHandler *)self metricsHandler];
  [v5 reportMetricsForContext:v4];
}

- (AMSURLMetricsLoadURLHandler)metricsHandler
{
  return self->_metricsHandler;
}

- (void)setSession:(id)a3
{
  p_propertiesLock = &self->_propertiesLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_session, v5);

  os_unfair_lock_unlock(p_propertiesLock);
}

- (AMSURLProtocolHandler)init
{
  uint64_t v3 = [[AMSURLMetricsLoadURLHandler alloc] initWithMetrics:objc_opt_class()];
  id v4 = +[AMSFairPlayDeviceIdentity shared];
  id v5 = [(AMSURLProtocolHandler *)self initWithMetricsHandler:v3 fairPlayDeviceIdentity:v4];

  return v5;
}

- (AMSURLProtocolHandler)initWithMetricsHandler:(id)a3 fairPlayDeviceIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSURLProtocolHandler;
  id v9 = [(AMSURLProtocolHandler *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricsHandler, a3);
    v10->_propertiesLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_fairPlayDeviceIdentity, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayDeviceIdentity, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_metricsHandler, 0);
}

void __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a2 value];
  if (v7)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
    id v10 = (void *)v9;
    if (v6)
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_super v12 = [*(id *)(a1 + 32) properties];
        uint64_t v13 = [v12 logUUID];
        long long v14 = NSString;
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = v15;
        if (v13)
        {
          id v25 = [*(id *)(a1 + 32) properties];
          uint64_t v3 = [v25 logUUID];
          [v14 stringWithFormat:@"%@: [%@] ", v16, v3];
        }
        else
        {
          [v14 stringWithFormat:@"%@: ", v15];
        long long v17 = };
        uint64_t v24 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v24;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data decoding failed. error = %{public}@.", buf, 0x16u);
        if (v13)
        {

          long long v17 = v25;
        }
      }
    }
    else
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(a1 + 32) properties];
        uint64_t v19 = [v18 logUUID];
        uint64_t v20 = NSString;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v21;
        if (v19)
        {
          id v25 = [*(id *)(a1 + 32) properties];
          uint64_t v3 = [v25 logUUID];
          [v20 stringWithFormat:@"%@: [%@] ", v22, v3];
        }
        else
        {
          [v20 stringWithFormat:@"%@: ", v21];
        id v23 = };
        *(_DWORD *)buf = 138543362;
        id v27 = v23;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Data decoding finish without a created object or error.", buf, 0xCu);
        if (v19)
        {

          id v23 = v25;
        }
      }
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
}

uint64_t __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a2 value])
  {
    if (+[AMSProcessInfo BOOLForEntitlement:@"aps-connection-initiate"])
    {
      objc_msgSend(*(id *)(a1 + 32), "set_APSRelayTopic:", @"com.apple.private.alloy.itunes.apsr");
    }
    else
    {
      BOOL v3 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
      id v5 = (void *)v4;
      if (v3)
      {
        if (!v4)
        {
          id v5 = +[AMSLogConfig sharedConfig];
        }
        id v6 = [v5 OSLogObject];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v7 = (objc_class *)objc_opt_class();
          id v8 = NSStringFromClass(v7);
          int v13 = 138543362;
          long long v14 = v8;
          _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Reverse push would have been attempted, but the current process lacks the correct entitlement", (uint8_t *)&v13, 0xCu);
        }
        id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
        [v5 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v9 userInfo:0];
      }
      else
      {
        if (!v4)
        {
          id v5 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v9 = [v5 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          id v10 = (objc_class *)objc_opt_class();
          id v11 = NSStringFromClass(v10);
          int v13 = 138543362;
          long long v14 = v11;
          _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Reverse push would have been attempted, but the current process lacks the correct entitlement", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 properties];
  id v6 = [(id)v5 bag];

  LOBYTE(v5) = [v4 value];
  if (v5)
  {
    id v7 = [a1[5] shouldEnableReversePushForTask:a1[7]];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__AMSURLProtocolHandler_didCreateTask_fromRequest_completionHandler___block_invoke_54;
    v19[3] = &unk_1E55A75A0;
    id v8 = a1[7];
    id v9 = a1[5];
    id v20 = v8;
    id v21 = v9;
    id v22 = a1[8];
    [v7 addFinishBlock:v19];

    id v10 = v20;
  }
  else
  {
    id v11 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    objc_super v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      long long v14 = [a1[4] properties];
      uint64_t v15 = [v14 logUUID];
      uint64_t v16 = [a1[6] URL];
      long long v17 = AMSLogableURL(v16);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      id v26 = v15;
      __int16 v27 = 2114;
      __int16 v28 = v17;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL not trusted: %{public}@", buf, 0x20u);
    }
    id v18 = (void (**)(id, void, void *))a1[8];
    id v10 = AMSError(300, @"Invalid Request", @"URL not trusted", 0);
    v18[2](v18, 0, v10);
  }
}

void __62__AMSURLProtocolHandler_reversePushSamplingPercentageForTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v13 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v13)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  long long v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [*(id *)(a1 + 32) properties];
    uint64_t v16 = [v15 logUUID];
    long long v17 = NSString;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = v18;
    if (v16)
    {
      id v22 = [*(id *)(a1 + 32) properties];
      id v4 = [v22 logUUID];
      [v17 stringWithFormat:@"%@: [%@] ", v19, v4];
    }
    else
    {
      [v17 stringWithFormat:@"%@: ", v18];
    id v20 = };
    id v21 = AMSHashIfNeeded(v8);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v20;
    __int16 v25 = 2114;
    id v26 = v21;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Failed to fetch the APS sampling percentage from the bag. error = %{public}@", buf, 0x16u);
    if (v16)
    {

      id v20 = v22;
    }
  }
  if (!v8)
  {
LABEL_2:
    id v9 = *(void **)(a1 + 40);
    char v10 = objc_opt_respondsToSelector();
    double v11 = 0.0;
    if (v10) {
      objc_msgSend(v7, "doubleValue", 0.0);
    }
    objc_super v12 = +[AMSDouble doubleWithDouble:v11];
    [v9 finishWithResult:v12];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithError:v8];
  }
}

id __66__AMSURLProtocolHandler_decodeMutableData_task_completionHandler___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) response];
  unint64_t v5 = objc_msgSend(v4, "ams_statusCode") - 200;

  if (v5 > 0x63)
  {
    id v7 = +[AMSOptional optionalWithNil];
    id v6 = +[AMSPromise promiseWithResult:v7];
  }
  else
  {
    id v6 = +[AMSPromise promiseWithError:v3];
  }

  return v6;
}

- (id)decodeData:(id)a3 task:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)[a3 mutableCopy];
  char v10 = [(AMSURLProtocolHandler *)self decodeMutableData:v9 task:v8 error:a5];

  return v10;
}

- (id)decodeMutableData:(id)a3 task:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = objc_alloc_init(AMSMutablePromise);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__AMSURLProtocolHandler_decodeMutableData_task_error___block_invoke;
  v15[3] = &unk_1E55A3370;
  uint64_t v16 = v10;
  double v11 = v10;
  [(AMSURLProtocolHandler *)self decodeMutableData:v9 task:v8 completionHandler:v15];

  objc_super v12 = [(AMSPromise *)v11 resultWithError:a5];
  uint64_t v13 = [v12 value];

  return v13;
}

void __54__AMSURLProtocolHandler_decodeMutableData_task_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    id v8 = a2;
    id v7 = [[AMSOptional alloc] initWithValue:v8];

    id v6 = 0;
  }
  [*(id *)(a1 + 32) finishWithResult:v7 error:v6];
}

- (void)didCreateTask:(id)a3 fromRequest:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = objc_alloc_init(AMSMutablePromise);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__AMSURLProtocolHandler_didCreateTask_fromRequest_error___block_invoke;
  v13[3] = &unk_1E55A0478;
  long long v14 = v10;
  double v11 = v10;
  [(AMSURLProtocolHandler *)self didCreateTask:v9 fromRequest:v8 completionHandler:v13];

  id v12 = [(AMSPromise *)v11 resultWithError:a5];
}

uint64_t __57__AMSURLProtocolHandler_didCreateTask_fromRequest_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v5 = 0;
  }
  return [v4 finishWithResult:v5 error:a3];
}

id __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_2;
  v8[3] = &unk_1E55A7618;
  id v9 = v3;
  id v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = [v4 runPromiseBlock:v8];

  return v6;
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_3;
    v9[3] = &unk_1E55A75F0;
    id v10 = v3;
    [v5 performWithTaskInfo:v6 completionHandler:v9];
  }
  else
  {
    id v7 = [v5 performWithTaskInfo:v6];
    id v8 = [[AMSOptional alloc] initWithValue:v7];
    (*((void (**)(id, AMSOptional *, void))v3 + 2))(v3, v8, 0);
  }
}

void __90__AMSURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  char v4 = [[AMSOptional alloc] initWithValue:v3];

  (*(void (**)(uint64_t, AMSOptional *, void))(v2 + 16))(v2, v4, 0);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v44 = a6;
  id v11 = a3;
  id v12 = +[AMSURLTaskInfo taskInfoForTask:v10];
  uint64_t v13 = (void *)[v11 mutableCopy];

  long long v14 = [v12 properties];
  uint64_t v15 = (void *)[v14 copy];

  uint64_t v16 = +[AMSBinaryPromise promiseWithSuccess];
  uint64_t v43 = v10;
  if (v7)
  {
    long long v17 = [v10 response];
    if (v17) {
      [v10 response];
    }
    else {
    uint64_t v18 = [v12 originalResponse];
    }

    uint64_t v19 = [(AMSURLProtocolHandler *)self _setResponseCookiesFromResponse:v18 taskInfo:v12];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
    v72[3] = &unk_1E55A1D20;
    v72[4] = self;
    id v73 = v10;
    id v74 = v13;
    uint64_t v20 = [v19 continueWithBlock:v72];

    uint64_t v16 = (void *)v20;
  }
  uint64_t v42 = v16;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_82;
  v68[3] = &unk_1E55A7708;
  id v21 = v13;
  id v69 = v21;
  id v22 = v15;
  id v70 = v22;
  v71 = self;
  id v23 = [v16 thenWithBlock:v68];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_86;
  v65[3] = &unk_1E559E888;
  id v24 = v22;
  id v66 = v24;
  id v25 = v21;
  id v67 = v25;
  id v26 = [v23 thenWithBlock:v65];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_87;
  v61[3] = &unk_1E55A7708;
  id v27 = v24;
  id v62 = v27;
  id v28 = v25;
  id v63 = v28;
  v64 = self;
  uint64_t v29 = [v26 thenWithBlock:v61];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_90;
  v57[3] = &unk_1E55A7708;
  id v30 = v27;
  id v58 = v30;
  id v31 = v28;
  id v59 = v31;
  id v60 = self;
  int v32 = [v29 thenWithBlock:v57];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_92;
  v53[3] = &unk_1E55A7708;
  id v33 = v31;
  id v54 = v33;
  id v34 = v30;
  id v55 = v34;
  uint64_t v56 = self;
  uint64_t v35 = [v32 thenWithBlock:v53];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_94;
  v48[3] = &unk_1E55A7730;
  id v36 = v33;
  id v49 = v36;
  id v50 = self;
  id v51 = v12;
  id v52 = v34;
  id v41 = v34;
  id v37 = v12;
  uint64_t v38 = [v35 thenWithBlock:v48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_98;
  v45[3] = &unk_1E559F868;
  id v46 = v36;
  id v47 = v44;
  id v39 = v36;
  id v40 = v44;
  [v38 addSuccessBlock:v45];
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = AMSLogKey();
      id v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      id v12 = };
      uint64_t v13 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to set response cookies. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
      if (v8)
      {

        id v12 = (void *)v3;
      }
    }
  }
  long long v14 = [*(id *)(a1 + 40) originalRequest];
  uint64_t v15 = [v14 HTTPBody];

  if (v15)
  {
    uint64_t v16 = [v14 HTTPBody];
    [*(id *)(a1 + 48) setHTTPBody:v16];
  }
  long long v17 = [v14 HTTPMethod];

  if (v17)
  {
    uint64_t v18 = [v14 HTTPMethod];
    [*(id *)(a1 + 48) setHTTPMethod:v18];
  }
  uint64_t v19 = [v14 valueForHTTPHeaderField:@"Content-Type"];
  [*(id *)(a1 + 48) setValue:v19 forHTTPHeaderField:@"Content-Type"];
  uint64_t v20 = +[AMSBinaryPromise promiseWithSuccess];

  return v20;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_82(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) account];
  char v4 = [*(id *)(a1 + 40) clientInfo];
  id v5 = [*(id *)(a1 + 40) bag];
  objc_msgSend(v2, "ams_addCookiesForAccount:clientInfo:bag:", v3, v4, v5);

  if (([*(id *)(a1 + 40) excludeIdentifierHeadersForAccount] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) account];
    objc_msgSend(v6, "ams_addIdentifierHeadersForAccount:", v7);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) account];
  uint64_t v10 = [*(id *)(a1 + 40) clientInfo];
  uint64_t v11 = [v10 accountMediaType];
  id v12 = [*(id *)(a1 + 40) bag];
  uint64_t v13 = +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:v8 forAccount:v9 mediaType:v11 bag:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2;
  v16[3] = &unk_1E55A0C70;
  v16[4] = *(void *)(a1 + 48);
  long long v14 = [v13 catchWithBlock:v16];

  return v14;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    char v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = AMSLogKey();
    BOOL v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add storefront header. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_86(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) account];
  if (objc_msgSend(v2, "ams_isLocalAccount") & 1) != 0 || (objc_msgSend(v2, "ams_isEphemeralAccount"))
  {
    uint64_t v3 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "ams_addAuthKitHeaders");
  }
  char v4 = (void *)v3;

  return v4;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_87(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reversePushType] == 2)
  {
    uint64_t v2 = [&unk_1EDD018A0 stringValue];
    [*(id *)(a1 + 40) setValue:v2 forHTTPHeaderField:@"x-apple-aps-delivery-type"];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = [*(id *)(a1 + 32) purchaseInfo];
  id v5 = [v4 buyParams];
  uint64_t v6 = [*(id *)(a1 + 32) bag];
  BOOL v7 = +[AMSURLRequestDecoration addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:](AMSURLRequestDecoration, "addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:", v3, v5, v6, [*(id *)(a1 + 32) remoteSecuritySigningEnabled]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_89;
  v10[3] = &unk_1E55A0C70;
  v10[4] = *(void *)(a1 + 48);
  uint64_t v8 = [v7 catchWithBlock:v10];

  return v8;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    char v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = AMSLogKey();
    BOOL v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Absinthe headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_90(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mescalType])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) mescalType];
    char v4 = [*(id *)(a1 + 32) bag];
    id v5 = [*(id *)(a1 + 32) logUUID];
    uint64_t v6 = +[AMSURLRequestDecoration addMescalHeaderToRequest:v2 type:v3 bag:v4 logKey:v5];
  }
  else
  {
    uint64_t v6 = +[AMSBinaryPromise promiseWithSuccess];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_91;
  v9[3] = &unk_1E55A0C70;
  void v9[4] = *(void *)(a1 + 48);
  BOOL v7 = [v6 catchWithBlock:v9];

  return v7;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_91(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    char v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = AMSLogKey();
    BOOL v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Mescal headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_92(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_removeAnisetteHeaders");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) account];
  uint64_t v4 = [*(id *)(a1 + 40) anisetteType];
  id v5 = [*(id *)(a1 + 40) bag];
  uint64_t v6 = +[AMSURLRequestDecoration addAnisetteHeadersToRequest:v2 account:v3 type:v4 bag:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_93;
  v9[3] = &unk_1E55A0C70;
  void v9[4] = *(void *)(a1 + 48);
  BOOL v7 = [v6 catchWithBlock:v9];

  return v7;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2_93(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = AMSLogKey();
    BOOL v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Anisette headers. Continuing with request reconfiguration. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_94(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = [a1[4] valueForHTTPHeaderField:@"X-Apple-FPDIRetryCount"];
    id v3 = v2;
    if (v2) {
      uint64_t v4 = [v2 integerValue] + 1;
    }
    else {
      uint64_t v4 = 1;
    }
    objc_msgSend(a1[4], "ams_removeFPDIHeaders");
    uint64_t v6 = [a1[5] session];
    if (!v6)
    {
      BOOL v7 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v7)
      {
        BOOL v7 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = [a1[6] properties];
        uint64_t v11 = [v10 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v9;
        __int16 v22 = 2114;
        id v23 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL session is unexpectedly nil for adding FPDI Headers, using default session", buf, 0x16u);
      }
      uint64_t v6 = +[AMSURLSession defaultSession];
    }
    id v12 = a1[4];
    uint64_t v13 = [a1[7] purchaseInfo];
    long long v14 = [v13 buyParams];
    uint64_t v15 = [a1[7] bag];
    __int16 v16 = [a1[5] fairPlayDeviceIdentity];
    long long v17 = +[AMSURLRequestDecoration addFPDIHeadersToRequest:v12 buyParams:v14 bag:v15 retryCount:v4 fairPlayDeviceIdentity:v16 fpdiNetworkProvider:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_97;
    v19[3] = &unk_1E55A0C70;
    void v19[4] = a1[5];
    id v5 = [v17 catchWithBlock:v19];
  }
  else
  {
    id v5 = +[AMSBinaryPromise promiseWithSuccess];
  }
  return v5;
}

id __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = AMSLogKey();
    BOOL v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add FPDI headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

uint64_t __87__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(AMSMutablePromise);
  uint64_t v13 = [(AMSPromise *)v12 completionHandlerAdapter];
  [(AMSURLProtocolHandler *)self reconfigureNewRequest:v10 originalTask:v11 redirect:v7 completionHandler:v13];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_error___block_invoke;
  v17[3] = &unk_1E559E998;
  id v18 = v10;
  id v14 = v10;
  uint64_t v15 = [(AMSMutablePromise *)v12 thenWithBlock:v17];
  id v16 = (id)[v15 resultWithError:a6];
}

id __75__AMSURLProtocolHandler_reconfigureNewRequest_originalTask_redirect_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    uint64_t v9 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    id v5 = [v3 allHTTPHeaderFields];
    [*(id *)(a1 + 32) setAllHTTPHeaderFields:v5];

    uint64_t v6 = [v4 HTTPMethod];
    [*(id *)(a1 + 32) setHTTPMethod:v6];

    objc_msgSend(*(id *)(a1 + 32), "setHTTPShouldHandleCookies:", objc_msgSend(v4, "HTTPShouldHandleCookies"));
    objc_msgSend(*(id *)(a1 + 32), "setHTTPShouldUsePipelining:", objc_msgSend(v4, "HTTPShouldUsePipelining"));
    BOOL v7 = [v4 URL];
    [*(id *)(a1 + 32) setURL:v7];

    uint64_t v8 = [v4 HTTPBodyStream];
    if (v8)
    {
      [*(id *)(a1 + 32) setHTTPBodyStream:v8];
    }
    else
    {
      id v10 = [v4 HTTPBody];
      [*(id *)(a1 + 32) setHTTPBody:v10];
    }
    uint64_t v9 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  return v9;
}

void __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = *(void **)(a1 + 40);
    id v8 = v6;
    uint64_t v9 = [v7 properties];
    id v10 = [v9 logUUID];
    int v11 = 138543874;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v10;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set the storefront. error = %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_127(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v2)
  {
    uint64_t v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 40) properties];
    uint64_t v6 = [v5 logUUID];
    int v9 = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to save account with updated storefront. Response handling will continue.", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = +[AMSBinaryPromise promiseWithSuccess];
  return v7;
}

id __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    uint64_t v6 = [v4 reason];

    if (!v6) {
      [v4 setReason:@"daemon security"];
    }
  }
  BOOL v7 = [[AMSOptional alloc] initWithValue:v4];
  id v8 = +[AMSPromise promiseWithResult:v7];

  return v8;
}

void __46__AMSURLProtocolHandler__handleResponse_task___block_invoke_2_147(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 value];
  if (v2)
  {
    id v3 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      id v6 = v5;
      BOOL v7 = AMSLogKey();
      int v8 = 138543618;
      int v9 = v5;
      __int16 v10 = 2114;
      __int16 v11 = v7;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] FPDI action generate.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_pingURL:(id)a3 session:(id)a4 account:(id)a5 bag:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    __int16 v15 = [v13 URLForKey:@"metrics/metricsUrl"];
    id v16 = [v15 valuePromise];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke;
    v29[3] = &unk_1E55A5AB0;
    v29[4] = self;
    id v30 = v10;
    id v31 = v14;
    id v32 = v12;
    uint64_t v17 = [v16 continueWithBlock:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_2;
    v27[3] = &unk_1E559FA68;
    v27[4] = self;
    id v28 = v11;
    id v18 = [v17 thenWithBlock:v27];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_164;
    v26[3] = &unk_1E55A0F50;
    void v26[4] = self;
    [v18 addFinishBlock:v26];
  }
  else
  {
    uint64_t v19 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v19)
    {
      uint64_t v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = AMSLogKey();
      __int16 v22 = NSString;
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = v23;
      if (v21)
      {
        AMSLogKey();
        self = (AMSURLProtocolHandler *)objc_claimAutoreleasedReturnValue();
        [v22 stringWithFormat:@"%@: [%@] ", v24, self];
      }
      else
      {
        [v22 stringWithFormat:@"%@: ", v23];
      id v25 = };
      *(_DWORD *)buf = 138543362;
      id v34 = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping ping-url as bag was not provided.", buf, 0xCu);
      if (v21)
      {

        id v25 = self;
      }
    }
  }
}

id __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v7)
    {
      BOOL v7 = +[AMSLogConfig sharedConfig];
    }
    int v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = AMSLogKey();
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        a1 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, a1];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      id v13 = };
      id v32 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      id v37 = v13;
      __int16 v38 = 2114;
      id v39 = v32;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@Response ping-url failed to fetch metrics url string. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        id v13 = (void *)a1;
      }
    }
    id v31 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    id v14 = *(id *)(a1 + 40);
    __int16 v15 = [v14 host];
    id v16 = [v5 host];
    int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v14 resolvingAgainstBaseURL:0];
      uint64_t v19 = [v14 path];
      uint64_t v20 = [v5 path];
      uint64_t v21 = [v18 queryItems];
      uint64_t v22 = [v21 indexOfObjectPassingTest:&__block_literal_global_155_0];
      if ([v19 hasPrefix:v20] && v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v23 timeIntervalSince1970];
        double v25 = v24;

        id v34 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)(v25 * 1000.0));
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"eventTime" value:v34];
        uint64_t v35 = v19;
        id v27 = (void *)[v21 mutableCopy];
        [v27 replaceObjectAtIndex:v22 withObject:v26];
        id v28 = (void *)[v27 copy];
        [v18 setQueryItems:v28];

        uint64_t v29 = [v18 URL];

        uint64_t v19 = v35;
        id v14 = (id)v29;
      }
    }
    id v30 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 48)];
    [(AMSURLRequestEncoder *)v30 setUrlKnownToBeTrusted:1];
    [(AMSURLRequestEncoder *)v30 setAccount:*(void *)(a1 + 56)];
    id v31 = [(AMSURLRequestEncoder *)v30 requestWithMethod:2 URL:v14 parameters:0];
  }
  return v31;
}

uint64_t __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"eventTime"];

  return v3;
}

id __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [v4 properties];
    int v8 = [v7 logUUID];
    int v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      int v17 = [v4 properties];
      uint64_t v2 = [v17 logUUID];
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    uint64_t v12 = };
    id v13 = [v4 URL];
    id v14 = AMSLogableURL(v13);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@Pinging %{public}@.", buf, 0x16u);

    if (v8)
    {

      uint64_t v12 = v17;
    }
  }
  [v4 setTimeoutInterval:20.0];
  __int16 v15 = [*(id *)(a1 + 40) dataTaskPromiseWithRequest:v4];

  return v15;
}

void __54__AMSURLProtocolHandler__pingURL_session_account_bag___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedURLLoadingConfig];
  int v8 = (void *)v7;
  if (v5)
  {
    if (!v7)
    {
      int v8 = +[AMSLogConfig sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v5 logUUID];
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        a1 = [v5 logUUID];
        [v11 stringWithFormat:@"%@: [%@] ", v13, a1];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      id v14 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v14;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@Ping-url succeeded.", buf, 0xCu);
      if (v10)
      {

        id v14 = (void *)a1;
      }
    }
  }
  else
  {
    if (!v7)
    {
      int v8 = +[AMSLogConfig sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = [0 logUUID];
      id v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        a1 = [0 logUUID];
        [v16 stringWithFormat:@"%@: [%@] ", v18, a1];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      uint64_t v19 = };
      __int16 v20 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2114;
      double v24 = v20;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ping-url failed. %{public}@", buf, 0x16u);
      if (v15)
      {

        uint64_t v19 = (void *)a1;
      }
    }
  }
}

void __66__AMSURLProtocolHandler__setResponseCookiesFromResponse_taskInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 40) properties];
    int v8 = [v7 logUUID];
    int v9 = AMSLogableError(v3);
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    __int16 v15 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to add cookies for response. error = %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

id __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke_167(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke_168;
    v26[3] = &unk_1E559E2C0;
    id v27 = *(id *)(a1 + 48);
    uint64_t v4 = objc_msgSend(v3, "ams_concurrentAnyWithTest:", v26);
    if (v4)
    {
      id v5 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v5)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v6 = [v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      uint64_t v7 = NSString;
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_opt_class();
      if (v8) {
        [v7 stringWithFormat:@"%@: [%@] ", v9, *(void *)(a1 + 32)];
      }
      else {
      uint64_t v18 = [v7 stringWithFormat:@"%@: ", v9, v25];
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      uint64_t v19 = "%{public}@Reverse push enabled";
    }
    else
    {
      if (!*(unsigned char *)(a1 + 56))
      {
LABEL_30:
        __int16 v23 = +[AMSBoolean BOOLeanWithBool:v4];
        uint64_t v22 = +[AMSPromise promiseWithResult:v23];

        uint64_t v21 = v27;
        goto LABEL_31;
      }
      id v5 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v5)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v6 = [v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:

        goto LABEL_30;
      }
      __int16 v15 = NSString;
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = objc_opt_class();
      if (v16) {
        [v15 stringWithFormat:@"%@: [%@] ", v17, *(void *)(a1 + 32)];
      }
      else {
      uint64_t v18 = [v15 stringWithFormat:@"%@: ", v17, v25];
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      uint64_t v19 = "%{public}@Reverse push sampled, but not enabled";
    }
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

    goto LABEL_29;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    int v10 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v10)
    {
      int v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = NSString;
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = objc_opt_class();
      if (v13) {
        [v12 stringWithFormat:@"%@: [%@] ", v14, *(void *)(a1 + 32)];
      }
      else {
      __int16 v20 = [v12 stringWithFormat:@"%@: ", v14, v25];
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v20;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Reverse push sampled, but failed to find patterns.", buf, 0xCu);
    }
  }
  uint64_t v21 = +[AMSBoolean BOOLeanWithBool:0];
  uint64_t v22 = +[AMSPromise promiseWithResult:v21];
LABEL_31:

  return v22;
}

BOOL __56__AMSURLProtocolHandler_shouldEnableReversePushForTask___block_invoke_168(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) rangeOfString:a2 options:1024];
  return v2 != 0;
}

- (AMSFairPlayDeviceIdentity)fairPlayDeviceIdentity
{
  return self->_fairPlayDeviceIdentity;
}

@end