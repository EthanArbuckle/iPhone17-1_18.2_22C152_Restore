@interface AMSHandleDialogResultTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDialogRequest)request;
- (AMSDialogResult)result;
- (AMSHandleDialogResultTask)initWithRequest:(id)a3 result:(id)a4 error:(id)a5 bag:(id)a6;
- (AMSHandleDialogResultTask)initWithResult:(id)a3 bag:(id)a4;
- (AMSProcessInfo)clientInfo;
- (NSError)error;
- (NSString)proxyBundleId;
- (id)perform;
- (void)setAccount:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setProxyBundleId:(id)a3;
@end

@implementation AMSHandleDialogResultTask

- (AMSHandleDialogResultTask)initWithRequest:(id)a3 result:(id)a4 error:(id)a5 bag:(id)a6
{
  return -[AMSHandleDialogResultTask initWithResult:bag:](self, "initWithResult:bag:", a4, a6, a5);
}

- (AMSHandleDialogResultTask)initWithResult:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSHandleDialogResultTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_result, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (AMSDialogRequest)request
{
  v2 = [(AMSHandleDialogResultTask *)self result];
  v3 = [v2 originalRequest];

  return (AMSDialogRequest *)v3;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__AMSHandleDialogResultTask_perform__block_invoke;
  v4[3] = &unk_1E559EDC0;
  v4[4] = self;
  v2 = [(AMSTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

BOOL __36__AMSHandleDialogResultTask_perform__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v4 = off_1E559C000;
  v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [*(id *)(a1 + 32) request];
    v9 = [v8 logKey];
    v10 = [*(id *)(a1 + 32) result];
    *(_DWORD *)buf = 138543874;
    uint64_t v112 = v7;
    __int16 v113 = 2114;
    v114 = v9;
    __int16 v115 = 2114;
    v116 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog result: %{public}@", buf, 0x20u);
  }
  v11 = [*(id *)(a1 + 32) result];
  uint64_t v12 = [v11 selectedActionIdentifier];
  v13 = (void *)v12;
  v14 = @"AMSDialogResultDismissIdentifier";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = v14;

  v16 = [*(id *)(a1 + 32) request];
  v106 = v15;
  v17 = [v16 locateActionWithIdentifier:v15];

  v18 = [v17 request];

  if (v18)
  {
    v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      v22 = *(void **)(a1 + 32);
      id v23 = v21;
      v24 = [v22 request];
      [v24 logKey];
      v26 = v25 = a2;
      *(_DWORD *)buf = 138543618;
      uint64_t v112 = (uint64_t)v21;
      __int16 v113 = 2114;
      v114 = v26;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);

      a2 = v25;
    }

    v27 = [AMSURLRequestEncoder alloc];
    v28 = [*(id *)(a1 + 32) bag];
    v29 = [(AMSURLRequestEncoder *)v27 initWithBag:v28];

    v30 = [*(id *)(a1 + 32) account];
    [(AMSURLRequestEncoder *)v29 setAccount:v30];

    v31 = AMSLogKey();
    [(AMSURLRequestEncoder *)v29 setLogUUID:v31];

    v32 = [v17 request];
    v33 = [(AMSURLRequestEncoder *)v29 requestByEncodingRequest:v32 parameters:0];
    id v110 = 0;
    v34 = [v33 resultWithError:&v110];
    id v35 = v110;

    v107 = v35;
    if (v35)
    {
      v36 = +[AMSLogConfig sharedConfig];
      if (!v36)
      {
        v36 = +[AMSLogConfig sharedConfig];
      }
      v37 = [v36 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = a2;
        v39 = objc_opt_class();
        v40 = *(void **)(a1 + 32);
        id v104 = v39;
        v41 = [v40 request];
        v42 = [v41 logKey];
        *(_DWORD *)buf = 138543874;
        uint64_t v112 = (uint64_t)v39;
        a2 = v38;
        __int16 v113 = 2114;
        v114 = v42;
        __int16 v115 = 2114;
        v116 = v107;
        _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating request: %{public}@", buf, 0x20u);
      }
      v105 = 0;
    }
    else
    {
      v36 = +[AMSURLSession defaultSession];
      v43 = [v36 dataTaskPromiseWithRequest:v34];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __36__AMSHandleDialogResultTask_perform__block_invoke_3;
      v109[3] = &unk_1E559F028;
      v109[4] = *(void *)(a1 + 32);
      [v43 addErrorBlock:v109];
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __36__AMSHandleDialogResultTask_perform__block_invoke_4;
      v108[3] = &unk_1E559E310;
      v108[4] = *(void *)(a1 + 32);
      v105 = v43;
      [v43 addSuccessBlock:v108];
    }

    v4 = off_1E559C000;
  }
  else
  {
    v107 = 0;
    v105 = 0;
  }
  v44 = [v17 deepLink];

  if (v44)
  {
    int v45 = [v17 inferLinkDestination];
    uint64_t v46 = +[AMSLogConfig sharedConfig];
    v47 = (void *)v46;
    if (v45)
    {
      if (!v46)
      {
        v47 = +[AMSLogConfig sharedConfig];
      }
      v48 = [v47 OSLogObject];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_opt_class();
        v50 = *(void **)(a1 + 32);
        id v102 = v49;
        v51 = [v50 request];
        v52 = [v51 logKey];
        [v17 deepLink];
        v54 = v53 = a2;
        v55 = AMSLogableURL(v54);
        *(_DWORD *)buf = 138543874;
        uint64_t v112 = (uint64_t)v49;
        __int16 v113 = 2114;
        v114 = v52;
        __int16 v115 = 2112;
        v116 = v55;
        _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);

        a2 = v53;
      }

      v56 = [*(id *)(a1 + 32) clientInfo];
      v57 = (void *)[v56 copy];
      v58 = v57;
      if (v57)
      {
        id v59 = v57;
      }
      else
      {
        id v59 = +[AMSProcessInfo currentProcess];
      }
      v68 = v59;

      v69 = [*(id *)(a1 + 32) proxyBundleId];

      if (v69)
      {
        v70 = [*(id *)(a1 + 32) proxyBundleId];
        [v68 setProxyAppBundleID:v70];
      }
      v71 = [v17 deepLink];
      v72 = [*(id *)(a1 + 32) bag];
      id v73 = +[AMSOpenURL openURL:v71 clientInfo:v68 bag:v72];

      v4 = off_1E559C000;
    }
    else
    {
      if (!v46)
      {
        v47 = +[AMSLogConfig sharedConfig];
      }
      v60 = [v47 OSLogObject];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = objc_opt_class();
        v62 = *(void **)(a1 + 32);
        id v103 = v61;
        v63 = [v62 request];
        v64 = [v63 logKey];
        v65 = [v17 deepLink];
        AMSLogableURL(v65);
        v67 = v66 = a2;
        *(_DWORD *)buf = 138543874;
        uint64_t v112 = (uint64_t)v61;
        __int16 v113 = 2114;
        v114 = v64;
        __int16 v115 = 2112;
        v116 = v67;
        _os_log_impl(&dword_18D554000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening standard URL: %@", buf, 0x20u);

        a2 = v66;
        v4 = off_1E559C000;
      }
      v68 = [v17 deepLink];
      +[AMSOpenURL openStandardURL:v68];
    }
  }
  if (objc_msgSend(v17, "ams_actionType") == 7)
  {
    v74 = [(__objc2_class *)v4[17] sharedConfig];
    if (!v74)
    {
      v74 = [(__objc2_class *)v4[17] sharedConfig];
    }
    v75 = [v74 OSLogObject];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = objc_opt_class();
      v77 = *(void **)(a1 + 32);
      id v78 = v76;
      v79 = [v77 request];
      v80 = [v79 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v112 = (uint64_t)v76;
      __int16 v113 = 2114;
      v114 = v80;
      _os_log_impl(&dword_18D554000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting QR code dialog action", buf, 0x16u);
    }
    v81 = [v17 dialogRequest];
    v82 = [*(id *)(a1 + 32) result];
    v83 = [*(id *)(a1 + 32) request];
    v84 = [v83 logKey];
    +[AMSHandleQRDialogResult handleQRDialogPresentationForRequest:v81 result:v82 logKey:v84];
  }
  v85 = [*(id *)(a1 + 32) request];
  v86 = [v85 metricsEvent];

  if (v86)
  {
    v87 = objc_msgSend(v17, "ams_metricsDictionary");
    uint64_t v88 = [v87 count];

    if (v88)
    {
      v89 = [*(id *)(a1 + 32) request];
      v90 = [v89 metricsEvent];
      v91 = objc_msgSend(v17, "ams_metricsDictionary");
      [v90 addPropertiesWithDictionary:v91];
    }
    v92 = [*(id *)(a1 + 32) bag];
    v93 = +[AMSMetrics internalInstanceUsingBag:v92];
    v94 = [*(id *)(a1 + 32) request];
    v95 = [v94 metricsEvent];
    [v93 enqueueEvent:v95];
  }
  v96 = [v17 metricsEvent];

  if (v96)
  {
    v97 = [*(id *)(a1 + 32) bag];
    v98 = +[AMSMetrics internalInstanceUsingBag:v97];
    v99 = [v17 metricsEvent];
    [v98 enqueueEvent:v99];
  }
  if ([v17 style] == 2)
  {
    v100 = AMSError(6, @"Dialog cancelled", @"Cancel action selected", 0);
    if (!a2) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  v100 = 0;
  if (a2) {
LABEL_55:
  }
    *a2 = v100;
LABEL_56:

  return v100 == 0;
}

void __36__AMSHandleDialogResultTask_perform__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = [v7 request];
    v10 = [v9 logKey];
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    v14 = v10;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error completing the dialog result request: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

void __36__AMSHandleDialogResultTask_perform__block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 request];
    id v8 = [v7 logKey];
    int v9 = 138543618;
    v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed dialog result request successfully", (uint8_t *)&v9, 0x16u);
  }
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

- (NSString)proxyBundleId
{
  return self->_proxyBundleId;
}

- (void)setProxyBundleId:(id)a3
{
}

- (AMSDialogResult)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_proxyBundleId, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end