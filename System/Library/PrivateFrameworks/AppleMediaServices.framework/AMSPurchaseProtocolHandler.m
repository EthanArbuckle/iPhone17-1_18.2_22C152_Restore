@interface AMSPurchaseProtocolHandler
+ (id)reversePushSamplingPercentageForTask:(id)a3;
- (AMSPurchaseProtocolHandler)init;
- (BOOL)_isEquivalentURL:(id)a3 toURL:(id)a4;
- (BOOL)_shouldRetryForFailureAction:(id)a3 response:(id)a4 task:(id)a5 decodedObject:(id)a6 responseDictionary:(id)a7;
- (id)_determineUpdatedBuyParamsFromResponse:(id)a3 urlAction:(id)a4 selectedAction:(id)a5 purchaseInfo:(id)a6;
- (id)_shouldRedirectWithPurchaseInfo:(id)a3 bag:(id)a4 urlAction:(id)a5 currentURL:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_syncKeybagFromResponse:(id)a3 purchaseInfo:(id)a4;
- (void)_updatePasswordSettingWithBuyParams:(id)a3 account:(id)a4;
- (void)_updateSubscriptionStatusFromBody:(id)a3 account:(id)a4;
- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6;
- (void)setSession:(id)a3;
@end

@implementation AMSPurchaseProtocolHandler

- (AMSPurchaseProtocolHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSPurchaseProtocolHandler;
  result = [(AMSURLProtocolHandler *)&v3 init];
  if (result) {
    result->_propertiesLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setSession:(id)a3
{
  p_propertiesLock = &self->_propertiesLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  [v5 setDelegate:self];
  v6.receiver = self;
  v6.super_class = (Class)AMSPurchaseProtocolHandler;
  [(AMSURLProtocolHandler *)&v6 setSession:v5];

  os_unfair_lock_unlock(p_propertiesLock);
}

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v14 = +[AMSURLTaskInfo taskInfoForTask:v10];
  v15 = [v14 properties];
  v16 = [v15 purchaseInfo];

  id v17 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  v19 = [v18 objectForKeyedSubscript:@"failureType"];
  v20 = [v16 account];
  [(AMSPurchaseProtocolHandler *)self _updateSubscriptionStatusFromBody:v18 account:v20];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
  v29[3] = &unk_1E55A5A10;
  v29[4] = self;
  id v30 = v18;
  id v31 = v16;
  id v32 = v14;
  id v33 = v10;
  id v34 = v19;
  id v35 = v17;
  id v36 = v12;
  v28.receiver = self;
  v28.super_class = (Class)AMSPurchaseProtocolHandler;
  id v21 = v12;
  id v22 = v17;
  id v23 = v19;
  id v24 = v10;
  id v25 = v14;
  id v26 = v16;
  id v27 = v18;
  [(AMSURLProtocolHandler *)&v28 handleCompletionWithTask:v24 metrics:v13 decodedObject:v22 completionHandler:v29];
}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__58;
  v62 = __Block_byref_object_dispose__58;
  id v63 = a2;
  id v47 = v63;
  v4 = [v63 dialogResult];

  if (v4)
  {
    id v5 = [(id)v59[5] dialogResult];
    uint64_t v6 = [v5 selectedActionIdentifier];
    v7 = (void *)v6;
    v8 = @"AMSDialogResultDismissIdentifier";
    if (v6) {
      v8 = (__CFString *)v6;
    }
    v9 = v8;

    id v10 = [(id)v59[5] dialogResult];
    id v11 = [v10 originalRequest];
    id v12 = [v11 locateActionWithIdentifier:v9];

    if (v12)
    {
      if ((objc_msgSend(v12, "ams_resolvedInterruption") & 1) != 0 || objc_msgSend(v12, "ams_actionType") == 4)
      {
        id v13 = (void *)v59[5];
        if (!v13 || [v13 actionType] != 2)
        {
          uint64_t v14 = +[AMSURLAction retryAction];
          v15 = (void *)v59[5];
          v59[5] = v14;
        }
        v16 = NSString;
        id v17 = [v12 identifier];
        id v18 = [v16 stringWithFormat:@"%@-%@", 0x1EDCC3B68, v17];
        [(id)v59[5] setRetryIdentifier:v18];
      }
      else
      {
        if ([v12 style] != 2) {
          goto LABEL_13;
        }
        v42 = [(id)v59[5] error];
        if (!v42) {
          goto LABEL_13;
        }
        BOOL v43 = [(id)v59[5] actionType] == 3;

        if (!v43) {
          goto LABEL_13;
        }
        v44 = [(id)v59[5] error];
        id v17 = AMSError(6, @"Purchase Cancelled", @"The dialog was cancelled", v44);

        uint64_t v45 = +[AMSURLAction actionWithError:v17];
        id v18 = (void *)v59[5];
        v59[5] = v45;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
LABEL_13:
  v19 = [a1[4] _determineUpdatedBuyParamsFromResponse:a1[5] urlAction:v59[5] selectedAction:v12 purchaseInfo:a1[6]];
  if (!v19) {
    goto LABEL_36;
  }
  v20 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v20)
  {
    v20 = +[AMSLogConfig sharedConfig];
  }
  id v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [a1[6] purchase];
    id v22 = [v46 logUUID];
    id v23 = NSString;
    if (v22)
    {
      uint64_t v24 = objc_opt_class();
      id v25 = [a1[6] purchase];
      v2 = [v25 logUUID];
      id v26 = [v23 stringWithFormat:@"%@: [%@] ", v24, v2];
    }
    else
    {
      id v26 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      id v25 = v26;
    }
    id v27 = AMSHashIfNeeded(v19);
    *(_DWORD *)buf = 138543618;
    v65 = v26;
    __int16 v66 = 2114;
    v67 = v27;
    _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Response determined updated buyParams = %{public}@", buf, 0x16u);
    if (v22)
    {
    }
  }

  [a1[6] setBuyParams:v19];
  id v28 = a1[4];
  v29 = [a1[7] properties];
  id v30 = [v29 account];
  [v28 _updatePasswordSettingWithBuyParams:v19 account:v30];

  if (!+[AMSPurchaseRequestEncoder isRedirectBagURLOverrideEnabled])goto LABEL_36; {
  id v31 = a1[4];
  }
  id v32 = a1[6];
  id v33 = [a1[7] properties];
  id v34 = [v33 bag];
  uint64_t v35 = v59[5];
  id v36 = [a1[8] currentRequest];
  v37 = [v36 URL];
  v38 = [v31 _shouldRedirectWithPurchaseInfo:v32 bag:v34 urlAction:v35 currentURL:v37];

  if (!v38)
  {
LABEL_36:
    if (v59[5]) {
      +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:");
    }
    else {
    v39 = +[AMSOptional optionalWithNil];
    }
    v38 = +[AMSPromise promiseWithResult:v39];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_70;
  v48[3] = &unk_1E55A59E8;
  v57 = &v58;
  id v49 = a1[9];
  id v40 = a1[8];
  id v41 = a1[4];
  id v50 = v40;
  id v51 = v41;
  id v52 = a1[10];
  id v53 = a1[5];
  id v54 = a1[6];
  id v55 = a1[7];
  id v56 = a1[11];
  [v38 addFinishBlock:v48];

  _Block_object_dispose(&v58, 8);
}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 value];

  if (v6)
  {
    uint64_t v7 = [v5 value];
    uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) actionType] == 2
    || [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) actionType] == 1
    || !*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 48) _syncKeybagFromResponse:*(void *)(a1 + 64) purchaseInfo:*(void *)(a1 + 72)];
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) response];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if ([*(id *)(a1 + 48) _shouldRetryForFailureAction:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) response:v11 task:*(void *)(a1 + 40) decodedObject:*(void *)(a1 + 56) responseDictionary:*(void *)(a1 + 64)])
    {
      uint64_t v31 = +[AMSURLAction retryAction];
      uint64_t v32 = *(void *)(*(void *)(a1 + 96) + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v12 = [*(id *)(a1 + 32) integerValue] & 0xFFFFFFFFFFFFFFFDLL;
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (!v13)
    {
      if (v12 != 1001) {
        goto LABEL_24;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (!v13) {
      goto LABEL_24;
    }
    unint64_t v12 = 0;
  }
  if ([v13 actionType] != 3 || v12 != 1001)
  {
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v22 && [v22 actionType]) {
      goto LABEL_28;
    }
LABEL_24:
    id v23 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"cancel-purchase-batch"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v24 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"cancel-purchase-batch"];
      int v25 = [v24 BOOLValue];

      if (!v25)
      {
LABEL_28:
        v29 = [[AMSOptional alloc] initWithValue:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
        uint64_t v30 = +[AMSPromise promiseWithResult:v29];
        goto LABEL_38;
      }
      id v23 = AMSError(305, @"Purchase Failed", @"Server canceled the purchase", 0);
      uint64_t v26 = +[AMSURLAction actionWithError:v23];
      uint64_t v27 = *(void *)(*(void *)(a1 + 96) + 8);
      id v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;
    }
    goto LABEL_28;
  }
LABEL_17:
  uint64_t v14 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v14)
  {
    uint64_t v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [*(id *)(a1 + 72) purchase];
    id v17 = [v16 logUUID];
    id v18 = NSString;
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = v19;
    if (v17)
    {
      v2 = [*(id *)(a1 + 72) purchase];
      objc_super v3 = [v2 logUUID];
      [v18 stringWithFormat:@"%@: [%@] ", v20, v3];
    }
    else
    {
      [v18 stringWithFormat:@"%@: ", v19];
    id v21 = };
    uint64_t v34 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    __int16 v40 = 2114;
    uint64_t v41 = v34;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Response has failureType %{public}@, authenticating…", buf, 0x16u);
    if (v17)
    {

      id v21 = v2;
    }
  }
  v29 = [*(id *)(a1 + 80) response];
  uint64_t v30 = +[AMSFinanceAuthenticateResponse performAuthFromResponse:v29 taskInfo:*(void *)(a1 + 80)];
LABEL_38:
  uint64_t v35 = (void *)v30;

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_83;
  v36[3] = &unk_1E55A3B00;
  id v37 = *(id *)(a1 + 88);
  [v35 addFinishBlock:v36];
}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 value];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v9 = a4;
  id v46 = a6;
  id v47 = v9;
  id v10 = +[AMSURLTaskInfo taskInfoForTask:v9];
  id v11 = [v10 properties];
  unint64_t v12 = [v11 purchaseInfo];

  id v13 = [v12 account];
  uint64_t v14 = objc_msgSend(v13, "ams_DSID");
  if (v14)
  {
    v15 = (void *)v14;
    BOOL v45 = a5;
    v44 = v13;
    v16 = [v10 properties];
    id v17 = [v16 account];
    uint64_t v18 = objc_msgSend(v17, "ams_DSID");
    if (!v18)
    {

LABEL_15:
      a5 = v45;
      goto LABEL_16;
    }
    uint64_t v19 = (void *)v18;
    uint64_t v20 = v44;
    id v21 = objc_msgSend(v44, "ams_DSID");
    [v10 properties];
    id v22 = v43 = v12;
    id v23 = [v22 account];
    uint64_t v24 = objc_msgSend(v23, "ams_DSID");
    LODWORD(v42) = [v21 isEqual:v24];

    unint64_t v12 = v43;
    id v13 = v44;

    a5 = v45;
    if (v42)
    {
      int v25 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v25)
      {
        int v25 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v43 purchase];
        id v28 = [v27 logUUID];
        v29 = NSString;
        uint64_t v30 = objc_opt_class();
        uint64_t v31 = v30;
        if (v28)
        {
          uint64_t v42 = [v43 purchase];
          uint64_t v20 = [v42 logUUID];
          [v29 stringWithFormat:@"%@: [%@] ", v31, v20];
        }
        else
        {
          [v29 stringWithFormat:@"%@: ", v30];
        uint64_t v32 = };
        id v13 = v44;
        AMSHashIfNeeded(v44);
        *(_DWORD *)buf = 138543618;
        v57 = v32;
        id v33 = v58 = 2114;
        v59 = v33;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Purchase account has changed to: %{public}@", buf, 0x16u);
        if (v28)
        {

          uint64_t v32 = v42;
        }
      }
      uint64_t v34 = [v10 properties];
      [v34 setAccount:v13];

      goto LABEL_15;
    }
  }
LABEL_16:
  uint64_t v35 = (void *)[v48 mutableCopy];
  id v36 = [v10 properties];
  id v37 = [v36 bag];
  v38 = +[AMSPurchaseRequestEncoder configureRequest:v35 purchaseInfo:v12 bag:v37];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __92__AMSPurchaseProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
  v50[3] = &unk_1E55A5A38;
  id v51 = v35;
  id v52 = v47;
  BOOL v55 = a5;
  id v53 = self;
  id v54 = v46;
  id v39 = v46;
  id v40 = v47;
  id v41 = v35;
  [v38 addFinishBlock:v50];
}

void __92__AMSPurchaseProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  v7.receiver = v2;
  v7.super_class = (Class)AMSPurchaseProtocolHandler;
  objc_msgSendSuper2(&v7, sel_reconfigureNewRequest_originalTask_redirect_completionHandler_, v3, v4, v5, v6);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void, void *))a6;
  id v10 = +[AMSURLTaskInfo taskInfoForTask:a4];
  id v11 = [v10 properties];
  unint64_t v12 = [v11 purchaseInfo];

  id v13 = [v12 delegate];
  uint64_t v14 = [v12 purchase];
  char v15 = [v14 isUserInitiated];

  if ((v15 & 1) == 0)
  {
    uint64_t v24 = @"Not user initiated";
LABEL_6:
    int v25 = AMSError(2, @"Purchase Dialog Failed", v24, 0);
    v9[2](v9, 0, v25);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v24 = @"Purchase delegate not observing callback";
    goto LABEL_6;
  }
  v16 = [v12 purchase];
  id v17 = [v16 metricsOverlay];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke;
  v29[3] = &unk_1E55A0958;
  id v18 = v8;
  id v30 = v18;
  [v17 enumerateKeysAndObjectsUsingBlock:v29];

  uint64_t v19 = [v10 properties];
  uint64_t v20 = [v19 purchaseInfo];
  id v21 = [v20 account];

  id v22 = [v12 purchase];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke_2;
  v26[3] = &unk_1E55A5A60;
  id v27 = v21;
  id v28 = v9;
  id v23 = v21;
  [v13 purchase:v22 handleDialogRequest:v18 completion:v26];

LABEL_7:
}

void __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) metricsEvent];
    [v6 setProperty:v5 forBodyKey:v7];
  }
}

void __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 originalRequest];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v7 metricsEvent];
  [v9 setAccount:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = objc_msgSend(v7, "buttonActions", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) metricsEvent];
        [v16 setAccount:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v14 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  id v9 = +[AMSURLTaskInfo taskInfoForTask:a4];
  id v10 = [v9 properties];
  uint64_t v11 = [v10 purchaseInfo];

  uint64_t v12 = [v11 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [v11 purchase];
    [v12 purchase:v13 handleAuthenticateRequest:v14 completion:v8];
  }
  else
  {
    uint64_t v13 = AMSError(2, @"Purchase Authentication Failed", @"Purchase delegate not observing callback", 0);
    v8[2](v8, 0, v13);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v24 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  id v9 = +[AMSURLTaskInfo taskInfoForTask:a4];
  id v10 = [v9 properties];
  uint64_t v11 = [v10 purchaseInfo];

  uint64_t v12 = [v11 delegate];
  uint64_t v13 = [v24 metricsOverlay];
  if (!v13) {
    goto LABEL_4;
  }
  id v14 = (void *)v13;
  uint64_t v15 = [v11 purchase];
  v16 = [v15 metricsOverlay];

  if (v16)
  {
    long long v17 = [v24 metricsOverlay];
    long long v18 = [v11 purchase];
    long long v19 = [v18 metricsOverlay];
    long long v20 = objc_msgSend(v17, "ams_dictionaryByAddingEntriesFromDictionary:", v19);
    [v24 setMetricsOverlay:v20];
  }
  else
  {
LABEL_4:
    id v21 = [v11 purchase];
    uint64_t v22 = [v21 metricsOverlay];

    if (!v22) {
      goto LABEL_7;
    }
    long long v17 = [v11 purchase];
    long long v18 = [v17 metricsOverlay];
    [v24 setMetricsOverlay:v18];
  }

LABEL_7:
  if (objc_opt_respondsToSelector())
  {
    id v23 = [v11 purchase];
    [v12 purchase:v23 handleEngagementRequest:v24 completion:v8];
  }
  else
  {
    id v23 = AMSError(2, @"Purchase Engagement Failed", @"Purchase delegate not observing callback", 0);
    v8[2](v8, 0, v23);
  }
}

+ (id)reversePushSamplingPercentageForTask:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = +[AMSURLTaskInfo taskInfoForTask:a3];
  id v7 = [v6 properties];
  uint64_t v8 = [v7 purchaseInfo];

  id v9 = [v8 buyParams];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 parameterForKey:0x1EDCAD4C8];
    if (v11)
    {
      uint64_t v12 = [v6 properties];
      uint64_t v13 = [v12 bag];

      if (v13)
      {
        id v14 = objc_alloc_init(AMSMutablePromise);
        uint64_t v15 = [v13 dictionaryForKey:@"aps-allowed-product-type"];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __67__AMSPurchaseProtocolHandler_reversePushSamplingPercentageForTask___block_invoke;
        v40[3] = &unk_1E55A5A88;
        id v41 = v6;
        id v44 = a1;
        v16 = v14;
        uint64_t v42 = v16;
        id v43 = v11;
        [v15 valueWithCompletion:v40];
        long long v17 = v43;
        long long v18 = v16;
      }
      else
      {
        uint64_t v34 = AMSError(2, @"Task Missing", @"Cannot determine reverse push sampling percentage for a nil bag.", 0);
        long long v18 = +[AMSPromise promiseWithError:v34];

        uint64_t v13 = 0;
      }
    }
    else
    {
      id v27 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v27)
      {
        id v27 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id v39 = [v6 properties];
        v29 = [v39 logUUID];
        id v30 = NSString;
        uint64_t v31 = objc_opt_class();
        uint64_t v32 = v31;
        if (v29)
        {
          id v37 = [v6 properties];
          uint64_t v4 = [v37 logUUID];
          [v30 stringWithFormat:@"%@: [%@] ", v32, v4];
        }
        else
        {
          [v30 stringWithFormat:@"%@: ", v31];
        id v33 = };
        uint64_t v35 = AMSHashIfNeeded(v10);
        *(_DWORD *)buf = 138543618;
        id v46 = v33;
        __int16 v47 = 2114;
        id v48 = v35;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Failed to fetch the APS sampling percentage. The buy params have no product type. buyParams = %{public}@", buf, 0x16u);
        if (v29)
        {

          id v33 = v37;
        }
      }
      uint64_t v13 = AMSError(2, @"Missing Buy Params", @"Cannot compute reverse push sampling percentage with no product type in the buy params.", 0);
      long long v18 = +[AMSPromise promiseWithError:v13];
    }
  }
  else
  {
    long long v19 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v19)
    {
      long long v19 = +[AMSLogConfig sharedConfig];
    }
    long long v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [v6 properties];
      uint64_t v22 = [v21 logUUID];
      id v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      if (v22)
      {
        v38 = [v6 properties];
        id v3 = [v38 logUUID];
        [v23 stringWithFormat:@"%@: [%@] ", v25, v3];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      uint64_t v26 = };
      *(_DWORD *)buf = 138543362;
      id v46 = v26;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Failed to fetch the APS sampling percentage. The task has no buy params.", buf, 0xCu);
      if (v22)
      {

        uint64_t v26 = v38;
      }
    }
    uint64_t v11 = AMSError(2, @"Missing Buy Params", @"Cannot compute reverse push sampling percentage with no buy params.", 0);
    long long v18 = +[AMSPromise promiseWithError:v11];
  }

  return v18;
}

void __67__AMSPurchaseProtocolHandler_reversePushSamplingPercentageForTask___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7) {
    goto LABEL_2;
  }
  long long v17 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v17)
  {
    long long v17 = +[AMSLogConfig sharedConfig];
  }
  long long v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    long long v19 = [a1[4] properties];
    long long v20 = [v19 logUUID];
    id v21 = NSString;
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = v22;
    if (v20)
    {
      uint64_t v34 = [a1[4] properties];
      uint64_t v4 = [v34 logUUID];
      [v21 stringWithFormat:@"%@: [%@] ", v23, v4];
    }
    else
    {
      [v21 stringWithFormat:@"%@: ", v22];
    uint64_t v24 = };
    uint64_t v25 = AMSLogableError(v8);
    *(_DWORD *)buf = 138543618;
    id v37 = v24;
    __int16 v38 = 2114;
    id v39 = v25;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to fetch the APS sampling percentage from the bag. error = %{public}@", buf, 0x16u);
    if (v20)
    {

      uint64_t v24 = v34;
    }
  }
  if (!v8)
  {
LABEL_2:
    id v9 = [v7 objectForKeyedSubscript:a1[6]];
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = [a1[4] properties];
        uint64_t v12 = [v35 logUUID];
        uint64_t v13 = NSString;
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = v14;
        if (v12)
        {
          id v33 = [a1[4] properties];
          uint64_t v32 = [v33 logUUID];
          [v13 stringWithFormat:@"%@: [%@] ", v15, v32];
        }
        else
        {
          [v13 stringWithFormat:@"%@: ", v14];
        v16 = };
        uint64_t v26 = AMSHashIfNeeded(a1[6]);
        id v27 = AMSHashIfNeeded(v7);
        *(_DWORD *)buf = 138543874;
        id v37 = v16;
        __int16 v38 = 2114;
        id v39 = v26;
        __int16 v40 = 2114;
        id v41 = v27;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Failed to fetch the APS sampling percentage. The task’s product type is not an allowed product type. productType = %{public}@ | allowedProductTypes = %{public}@", buf, 0x20u);
        if (v12)
        {

          v16 = v33;
        }
      }
    }
    id v28 = a1[5];
    char v29 = objc_opt_respondsToSelector();
    double v30 = 0.0;
    if (v29) {
      objc_msgSend(v9, "doubleValue", 0.0);
    }
    uint64_t v31 = +[AMSDouble doubleWithDouble:v30];
    [v28 finishWithResult:v31];
  }
  else
  {
    [a1[5] finishWithError:v8];
  }
}

- (id)_shouldRedirectWithPurchaseInfo:(id)a3 bag:(id)a4 urlAction:(id)a5 currentURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10
    && [v12 actionType] != 3
    && ([v10 buyParams],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v14 dictionary],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 count],
        v15,
        v14,
        v16))
  {
    long long v17 = +[AMSPurchaseRequestEncoder bagURLFromPurchaseInfo:v10 bag:v11];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__AMSPurchaseProtocolHandler__shouldRedirectWithPurchaseInfo_bag_urlAction_currentURL___block_invoke;
    v20[3] = &unk_1E55A5AB0;
    v20[4] = self;
    id v21 = v13;
    id v22 = v10;
    id v23 = v12;
    long long v18 = [v17 continueWithBlock:v20];
  }
  else
  {
    long long v17 = +[AMSOptional optionalWithNil];
    long long v18 = +[AMSPromise promiseWithResult:v17];
  }

  return v18;
}

id __87__AMSPurchaseProtocolHandler__shouldRedirectWithPurchaseInfo_bag_urlAction_currentURL___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([a1[4] _isEquivalentURL:a1[5] toURL:v5] & 1) != 0)
  {
    id v7 = +[AMSOptional optionalWithNil];
    id v8 = +[AMSPromise promiseWithResult:v7];
  }
  else
  {
    id v10 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [a1[6] purchase];
      id v13 = [v12 logUUID];
      uint64_t v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        uint64_t v24 = [a1[6] purchase];
        id v23 = [v24 logUUID];
        [v14 stringWithFormat:@"%@: [%@] ", v16, v23];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      long long v17 = };
      long long v18 = AMSLogableURL(a1[5]);
      long long v19 = AMSLogableURL(v5);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      __int16 v29 = 2114;
      double v30 = v19;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Redirect from updated buyParam - from current URL: %{public}@ to URL: %{public}@", buf, 0x20u);
      if (v13)
      {

        long long v17 = v24;
      }
    }
    id v7 = +[AMSURLAction redirectActionWithURL:v5];
    [v7 setReason:@"buyParam redirect"];
    long long v20 = [a1[7] retryIdentifier];
    [v7 setRetryIdentifier:v20];

    id v21 = [a1[7] updatedHeaders];
    [v7 setUpdatedHeaders:v21];

    id v22 = +[AMSOptional optionalWithValue:v7];
    id v8 = +[AMSPromise promiseWithResult:v22];
  }
  return v8;
}

- (BOOL)_isEquivalentURL:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqual:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [v5 scheme];
    id v9 = [v6 scheme];
    uint64_t v10 = [v8 caseInsensitiveCompare:v9];

    if (v10
      || ([v5 host],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v6 host],
          id v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v11 caseInsensitiveCompare:v12],
          v12,
          v11,
          v13))
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v15 = [v5 path];
      uint64_t v16 = [v6 path];
      BOOL v7 = [v15 caseInsensitiveCompare:v16] == 0;
    }
  }

  return v7;
}

- (id)_determineUpdatedBuyParamsFromResponse:(id)a3 urlAction:(id)a4 selectedAction:(id)a5 purchaseInfo:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v66 = v11;
  if (v11)
  {
    uint64_t v13 = objc_msgSend(v11, "ams_buyParams");
    if (v13)
    {
      id v14 = (id)v13;
      uint64_t v15 = +[AMSLogConfig sharedConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [v12 purchase];
        long long v18 = [v17 logUUID];
        *(_DWORD *)buf = 138543362;
        uint64_t v68 = v18;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Updating buy params from selected action", buf, 0xCu);
      }
      goto LABEL_26;
    }
  }
  if ([v10 actionType] == 3
    || ([v10 updatedHeaders],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "ams_firstKeyObjectPassingTest:", &__block_literal_global_108),
        long long v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
LABEL_25:
    id v14 = [v10 updatedBuyParams];
    goto LABEL_26;
  }
  id v21 = [v9 objectForKeyedSubscript:@"dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  id v23 = [v22 objectForKeyedSubscript:@"okButtonAction"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  uint64_t v25 = [v24 objectForKeyedSubscript:@"buyParams"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_24;
  }
  id v14 = v25;

  if (!v14)
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v26 = +[AMSLogConfig sharedConfig];
  if (!v26)
  {
    uint64_t v26 = +[AMSLogConfig sharedConfig];
  }
  __int16 v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v12 purchase];
    __int16 v29 = [v28 logUUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = v29;
    __int16 v69 = 2114;
    id v70 = v10;
    __int16 v71 = 2114;
    v72 = v66;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Updating buy params from any action the current URLAction is %{public}@ selected action is %{public}@", buf, 0x20u);
  }
LABEL_26:
  double v30 = [v14 componentsSeparatedByString:@"&"];
  uint64_t v31 = (void *)[v30 mutableCopy];

  uint64_t v32 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  if ([v31 count])
  {
    unint64_t v33 = 0;
    do
    {
      uint64_t v34 = [v31 objectAtIndexedSubscript:v33];
      if ((objc_msgSend(v34, "ams_isPercentEncodedForAllowedCharacters:", v32) & 1) == 0)
      {
        uint64_t v35 = [v34 stringByRemovingPercentEncoding];
        id v36 = v35;
        if (!v35) {
          uint64_t v35 = v34;
        }
        uint64_t v37 = [v35 stringByAddingPercentEncodingWithAllowedCharacters:v32];

        uint64_t v34 = (void *)v37;
      }
      [v31 setObject:v34 atIndexedSubscript:v33];

      ++v33;
    }
    while (v33 < [v31 count]);
  }
  v65 = v10;
  if ([v31 count])
  {
    id v63 = v9;
    __int16 v38 = [[AMSBuyParams alloc] initWithArray:v31];
    id v39 = [v12 paymentToken];

    if (v39)
    {
      __int16 v40 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v40)
      {
        __int16 v40 = +[AMSLogConfig sharedConfig];
      }
      id v41 = [v40 OSLogObject];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [v12 purchase];
        uint64_t v42 = [v61 logUUID];
        id v43 = NSString;
        uint64_t v44 = objc_opt_class();
        uint64_t v45 = v44;
        if (v42)
        {
          uint64_t v60 = [v12 purchase];
          v59 = [v60 logUUID];
          [v43 stringWithFormat:@"%@: [%@] ", v45, v59];
        }
        else
        {
          [v43 stringWithFormat:@"%@: ", v44];
        id v46 = };
        *(_DWORD *)buf = 138543362;
        uint64_t v68 = v46;
        _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Appending payment token to buyParams", buf, 0xCu);
        if (v42)
        {

          id v46 = v60;
        }
      }
      __int16 v47 = [v12 paymentToken];
      [(AMSBuyParams *)v38 setParameter:v47 forKey:@"pkPayment"];
    }
    id v48 = [v12 paymentMethodType];

    if (v48)
    {
      uint64_t v49 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v49)
      {
        uint64_t v49 = +[AMSLogConfig sharedConfig];
      }
      id v50 = [v49 OSLogObject];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v62 = [v12 purchase];
        id v51 = [v62 logUUID];
        id v52 = NSString;
        uint64_t v53 = objc_opt_class();
        uint64_t v54 = v53;
        if (v51)
        {
          self = [v12 purchase];
          uint64_t v60 = [(AMSPurchaseProtocolHandler *)self logUUID];
          [v52 stringWithFormat:@"%@: [%@] ", v54, v60];
        }
        else
        {
          [v52 stringWithFormat:@"%@: ", v53];
        BOOL v55 = };
        *(_DWORD *)buf = 138543362;
        uint64_t v68 = v55;
        _os_log_impl(&dword_18D554000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Appending ApplePay payment method type to buyParams", buf, 0xCu);
        if (v51)
        {

          BOOL v55 = self;
        }
      }
      id v56 = [v12 paymentMethodType];
      v57 = [v56 stringValue];
      [(AMSBuyParams *)v38 setParameter:v57 forKey:@"applePayPaymentMethodType"];
    }
    id v9 = v63;
  }
  else
  {
    __int16 v38 = 0;
  }

  return v38;
}

uint64_t __107__AMSPurchaseProtocolHandler__determineUpdatedBuyParamsFromResponse_urlAction_selectedAction_purchaseInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 isEqualToString:@"X-Apple-TID-Action"]) {
    uint64_t v5 = [v4 isEqualToString:@"FB"];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldRetryForFailureAction:(id)a3 response:(id)a4 task:(id)a5 decodedObject:(id)a6 responseDictionary:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a7;
  id v11 = +[AMSURLTaskInfo taskInfoForTask:a5];
  id v12 = [v11 properties];
  uint64_t v13 = [v12 purchaseInfo];

  id v14 = [v10 objectForKeyedSubscript:@"dialog"];

  if (v14
    || ([v13 hasRetriedOriginalOwnerAccount] & 1) != 0
    || ([v13 purchase],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v15 ownerAccountId],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    char v27 = 0;
  }
  else
  {
    [v13 setHasRetriedOriginalOwnerAccount:1];
    long long v17 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    long long v18 = [v13 purchase];
    long long v19 = [v18 ownerAccountId];
    long long v20 = objc_msgSend(v17, "ams_iTunesAccountWithDSID:", v19);
    [v13 setAccount:v20];

    id v21 = [v13 account];
    id v22 = [v11 properties];
    [v22 setAccount:v21];

    id v23 = +[AMSLogConfig sharedConfig];
    if (!v23)
    {
      id v23 = +[AMSLogConfig sharedConfig];
    }
    id v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v13 purchase];
      uint64_t v26 = [v25 logUUID];
      int v32 = 138543362;
      unint64_t v33 = v26;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Falling back to owner account", (uint8_t *)&v32, 0xCu);
    }
    char v27 = 1;
  }
  id v28 = [v9 error];
  uint64_t v29 = [v28 code];

  if ((unint64_t)(v29 - 513) < 0xFFFFFFFFFFFFFFFELL) {
    BOOL v30 = v27;
  }
  else {
    BOOL v30 = 0;
  }

  return v30;
}

- (void)_syncKeybagFromResponse:(id)a3 purchaseInfo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"keybag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if ([v7 length])
  {
    id v8 = +[AMSKeybag sharedInstance];
    id v17 = 0;
    char v9 = [v8 importKeybagWithData:v7 error:&v17];
    id v10 = v17;

    if ((v9 & 1) == 0)
    {
      id v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v5 purchase];
        id v14 = [v13 logUUID];
        uint64_t v15 = [v5 account];
        uint64_t v16 = objc_msgSend(v15, "ams_DSID");
        *(_DWORD *)buf = 138543874;
        long long v19 = v14;
        __int16 v20 = 2114;
        id v21 = v16;
        __int16 v22 = 2114;
        id v23 = v10;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "AMSPurchaseProtocolHandler: [%{public}@] Error importing keybag data for account: %{public}@ error: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)_updatePasswordSettingWithBuyParams:(id)a3 account:(id)a4
{
  id v9 = a4;
  id v5 = [a3 parameterForKey:@"asn"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 integerValue];
    objc_msgSend(v9, "ams_setFreePasswordPromptSetting:", +[AMSSyncPasswordSettingsTask freePasswordSettingFromServerValue:](AMSSyncPasswordSettingsTask, "freePasswordSettingFromServerValue:", v6));
    objc_msgSend(v9, "ams_setPaidPasswordPromptSetting:", +[AMSSyncPasswordSettingsTask paidPasswordSettingFromServerValue:](AMSSyncPasswordSettingsTask, "paidPasswordSettingFromServerValue:", v6));
    id v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v8 = (id)objc_msgSend(v7, "ams_saveAccount:", v9);
  }
}

- (void)_updateSubscriptionStatusFromBody:(id)a3 account:(id)a4
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v17[0] = @"newsEntitlements";
  v17[1] = @"appStoreEntitlements";
  v18[0] = &unk_1EDD01690;
  v18[1] = &unk_1EDD016A8;
  v17[2] = @"activityEntitlements";
  v17[3] = @"musicEntitlements";
  v18[2] = &unk_1EDD016C0;
  v18[3] = &unk_1EDD016D8;
  v17[4] = @"tvEntitlements";
  v17[5] = @"iCloudEntitlements";
  v18[4] = &unk_1EDD016F0;
  v18[5] = &unk_1EDD01708;
  v17[6] = @"podcastEntitlements";
  v18[6] = &unk_1EDD01720;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__AMSPurchaseProtocolHandler__updateSubscriptionStatusFromBody_account___block_invoke;
  v14[3] = &unk_1E55A5AF8;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];
  id v10 = [v8 objectForKeyedSubscript:@"subscriptionStatus"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = 0;
LABEL_8:

    goto LABEL_9;
  }
  id v11 = v10;

  if (v11)
  {
    id v12 = [v11 objectForKeyedSubscript:@"music"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v12;

      if (v10) {
        id v13 = +[AMSSubscriptionEntitlementsTask updateCacheForMediaType:2 account:v9 data:0];
      }
    }
    else
    {

      id v10 = 0;
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __72__AMSPurchaseProtocolHandler__updateSubscriptionStatusFromBody_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6) {
      id v7 = +[AMSSubscriptionEntitlementsTask updateCacheForMediaType:account:data:](AMSSubscriptionEntitlementsTask, "updateCacheForMediaType:account:data:", [v8 integerValue], *(void *)(a1 + 40), v6);
    }
  }
  else
  {

    id v6 = 0;
  }
}

@end