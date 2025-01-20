@interface AMSFinanceDialogResponse
+ (BOOL)_credentialSource:(unint64_t)a3 satisfiesAuthenticationType:(unint64_t)a4;
+ (BOOL)_shouldSendOverIDS:(id)a3 taskInfo:(id)a4;
+ (id)_handleAskPermissionRequestWithURL:(id)a3 account:(id)a4;
+ (id)_presentDialog:(id)a3 taskInfo:(id)a4;
+ (id)_presentIDSDialog:(id)a3 taskInfo:(id)a4;
+ (id)_serviceActionFromButton:(id)a3 taskInfo:(id)a4;
+ (id)handleDialogResult:(id)a3 taskInfo:(id)a4;
+ (id)performFinanceDialog:(id)a3 taskInfo:(id)a4;
+ (int64_t)dialogKindForTaskInfo:(id)a3 withResponseDictionary:(id)a4;
- (AMSDialogRequest)dialogRequest;
- (AMSFinanceDialogResponse)initWithResponseDictionary:(id)a3 kind:(int64_t)a4 taskInfo:(id)a5;
- (AMSURLTaskInfo)taskInfo;
- (BOOL)_isCommerceUIURL:(id)a3 actionType:(int64_t)a4 URLType:(int64_t)a5;
- (BOOL)containsCommerceUIURL;
- (NSDictionary)dialogDictionary;
- (NSDictionary)responseDictionary;
- (id)_createActionFromButtonDictionary:(id)a3 title:(id)a4;
- (id)_createDialogRequest;
- (id)_createRequestButtonsFromDialogDictionary:(id)a3;
- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3;
- (id)performWithTaskInfo:(id)a3;
- (int64_t)_actionTypeFromButtonDictionary:(id)a3;
- (int64_t)kind;
- (void)setKind:(int64_t)a3;
- (void)setTaskInfo:(id)a3;
@end

@implementation AMSFinanceDialogResponse

+ (int64_t)dialogKindForTaskInfo:(id)a3 withResponseDictionary:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [v9 objectForKeyedSubscript:@"paymentSheetInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  v12 = [v9 objectForKeyedSubscript:@"kind"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (([v13 isEqualToString:@"authorization"] & 1) == 0)
  {
    v14 = [v7 objectForKeyedSubscript:@"failureType"];
    if (objc_opt_respondsToSelector())
    {
      v15 = [v7 objectForKeyedSubscript:@"failureType"];
      uint64_t v16 = [v15 longLongValue];

      if (v16 == 2002) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (v11)
    {
      int64_t v17 = 4;
    }
    else if (+[AMSFinanceVerifyPurchaseResponse isVerifyPurchasePayload:v7])
    {
      int64_t v17 = 5;
    }
    else
    {
      int64_t v17 = v9 != 0;
    }
    goto LABEL_32;
  }
LABEL_13:
  if (v11)
  {
    if (+[AMSFinanceExpressCheckoutResponse isExpressCheckoutPayload:v7])
    {
      int64_t v17 = 7;
    }
    else if (+[AMSFinanceDelegateAuthenticateChallengeResponse isDelegateAuthChallengeForTaskInfo:v6])
    {
      int64_t v17 = 6;
    }
    else
    {
      int64_t v17 = 3;
    }
  }
  else
  {
    uint64_t v18 = [v6 previousAuthorizationCredentialSource];
    v19 = [v6 response];
    LODWORD(v18) = objc_msgSend(a1, "_credentialSource:satisfiesAuthenticationType:", v18, +[AMSFinanceAuthenticateResponse authenticationTypeForResponse:responseDictionary:](AMSFinanceAuthenticateResponse, "authenticationTypeForResponse:responseDictionary:", v19, v7));

    if (v18)
    {
      v20 = +[AMSLogConfig sharedAccountsConfig];
      if (!v20)
      {
        v20 = +[AMSLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        v23 = AMSLogKey();
        v24 = AMSHashIfNeeded(v9);
        int v26 = 138543874;
        uint64_t v27 = v22;
        __int16 v28 = 2114;
        v29 = v23;
        __int16 v30 = 2114;
        v31 = v24;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Encountered a redundant authorization dialog. dialogDictionary = %{public}@", (uint8_t *)&v26, 0x20u);
      }
      int64_t v17 = 1;
    }
    else
    {
      int64_t v17 = 2;
    }
  }
LABEL_32:

  return v17;
}

- (AMSFinanceDialogResponse)initWithResponseDictionary:(id)a3 kind:(int64_t)a4 taskInfo:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = +[AMSFinanceResponse valueForProtocolKey:@"dialog" inResponse:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;

    if (v12)
    {
      v22.receiver = self;
      v22.super_class = (Class)AMSFinanceDialogResponse;
      id v13 = [(AMSFinanceDialogResponse *)&v22 init];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_responseDictionary, a3);
        objc_storeStrong((id *)&v14->_dialogDictionary, v11);
        v14->_kind = a4;
        objc_storeStrong((id *)&v14->_taskInfo, a5);
      }
      self = v14;
      v15 = self;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v16 = +[AMSLogConfig sharedConfig];
  int64_t v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = objc_opt_class();
    id v19 = v18;
    v20 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v24 = v18;
    __int16 v25 = 2114;
    int v26 = v20;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to initialize a finance dialog without a dictionary", buf, 0x16u);
  }
  id v12 = 0;
  v15 = 0;
LABEL_10:

  return v15;
}

- (AMSDialogRequest)dialogRequest
{
  dialogRequest = self->_dialogRequest;
  if (!dialogRequest)
  {
    v4 = [(AMSFinanceDialogResponse *)self _createDialogRequest];
    v5 = self->_dialogRequest;
    self->_dialogRequest = v4;

    dialogRequest = self->_dialogRequest;
  }
  return dialogRequest;
}

+ (id)handleDialogResult:(id)a3 taskInfo:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 originalRequest];
  id v9 = [v6 selectedActionIdentifier];
  id v10 = [v8 locateActionWithIdentifier:v9];

  id v11 = [v10 deepLink];
  if (objc_msgSend(v10, "ams_actionType") == 11)
  {
    id v12 = [a1 _serviceActionFromButton:v10 taskInfo:v7];
  }
  else if (v11)
  {
    if (objc_msgSend(v10, "ams_actionType") == 12)
    {
      id v13 = [v7 properties];
      v14 = [v13 account];
      v15 = [a1 _handleAskPermissionRequestWithURL:v11 account:v14];

      id v12 = +[AMSURLAction actionWithError:v15];

      uint64_t v16 = 0;
      int64_t v17 = 0;
    }
    else if (objc_msgSend(v10, "ams_actionType") == 5)
    {
      +[AMSFinanceActionResponse handleExternalGotoURL:v11];
      uint64_t v16 = 0;
      int64_t v17 = 0;
      id v12 = 0;
    }
    else
    {
      uint64_t v18 = +[AMSFinanceActionResponse handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:](AMSFinanceActionResponse, "handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:", v11, v7, objc_msgSend(v10, "ams_actionType"), objc_msgSend(v10, "ams_commerceUIURL"), objc_msgSend(v10, "ams_tidContinue"), objc_msgSend(v10, "ams_shouldRetry"));
      uint64_t v16 = [v18 interruptionResult];
      id v19 = [v18 action];
      int64_t v17 = [v19 updatedBuyParams];

      id v12 = [v18 action];
    }
    [v10 setDeepLink:0];
    objc_msgSend(v10, "ams_setResolvedInterruption:", v16);
    objc_msgSend(v10, "ams_setBuyParams:", v17);
    v20 = [v6 originalRequest];
    [v20 replaceAction:v10];
  }
  else
  {
    id v12 = 0;
  }
  v21 = [AMSHandleDialogResultTask alloc];
  objc_super v22 = [v7 properties];
  v23 = [v22 bag];
  v24 = [(AMSHandleDialogResultTask *)v21 initWithResult:v6 bag:v23];

  [(AMSTask *)v24 setRunMode:1];
  __int16 v25 = [v7 properties];
  int v26 = [v25 account];
  [(AMSHandleDialogResultTask *)v24 setAccount:v26];

  uint64_t v27 = [v7 properties];
  __int16 v28 = [v27 clientInfo];
  v29 = [v28 proxyAppBundleID];
  [(AMSHandleDialogResultTask *)v24 setProxyBundleId:v29];

  __int16 v30 = [v7 properties];
  v31 = [v30 clientInfo];
  [(AMSHandleDialogResultTask *)v24 setClientInfo:v31];

  uint64_t v32 = [(AMSHandleDialogResultTask *)v24 perform];
  id v40 = 0;
  [v32 resultWithError:&v40];
  id v33 = v40;

  if (!v12)
  {
    if (v33 && [v33 code] == 6)
    {
      v34 = +[AMSLogConfig sharedConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = objc_opt_class();
        v37 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v36;
        __int16 v43 = 2114;
        v44 = v37;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The dialog was cancelled by the user", buf, 0x16u);
      }
      uint64_t v38 = +[AMSURLAction actionWithError:v33];
    }
    else
    {
      uint64_t v38 = +[AMSURLAction proceedAction];
    }
    id v12 = (void *)v38;
  }
  [v12 setDialogResult:v6];

  return v12;
}

+ (id)performFinanceDialog:(id)a3 taskInfo:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 properties];
  char v9 = [v8 dialogOptions];

  if (v9)
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v13 = objc_opt_class();
    v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v13;
    __int16 v42 = 2114;
    __int16 v43 = v14;
    v15 = "%{public}@: [%{public}@] Dialogs were suppressed by the caller";
    uint64_t v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  id v10 = [v6 title];
  if (![v10 length])
  {
    id v19 = [v6 message];
    uint64_t v20 = [v19 length];

    if (v20) {
      goto LABEL_12;
    }
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

LABEL_10:
      uint64_t v18 = +[AMSURLAction proceedAction];
      goto LABEL_25;
    }
    uint64_t v37 = objc_opt_class();
    v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v37;
    __int16 v42 = 2114;
    __int16 v43 = v14;
    v15 = "%{public}@: [%{public}@] Suppressing blank dialog (no title & no message)";
    uint64_t v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_18D554000, v16, v17, v15, buf, 0x16u);

    goto LABEL_9;
  }

LABEL_12:
  if ([a1 _shouldSendOverIDS:v6 taskInfo:v7])
  {
    v21 = [a1 _presentIDSDialog:v6 taskInfo:v7];
    int v22 = [v21 resultWithError:0];

    if (v22) {
      goto LABEL_10;
    }
  }
  v23 = [v7 properties];
  v24 = [v23 purchaseInfo];
  __int16 v25 = [v24 activePurchaseTask];
  int v26 = [v25 performPreActionRequestForTaskInfo:v7 requiresAuthorization:0];
  id v39 = 0;
  char v27 = [v26 resultWithError:&v39];
  id v28 = v39;

  if ((v27 & 1) != 0 || !v28)
  {
    v29 = [a1 _presentDialog:v6 taskInfo:v7];
    id v38 = 0;
    __int16 v30 = [v29 resultWithError:&v38];
    id v31 = v38;

    if (v31)
    {
      uint64_t v32 = +[AMSLogConfig sharedConfig];
      if (!v32)
      {
        uint64_t v32 = +[AMSLogConfig sharedConfig];
      }
      id v33 = [v32 OSLogObject];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = objc_opt_class();
        v35 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v41 = v34;
        __int16 v42 = 2114;
        __int16 v43 = v35;
        __int16 v44 = 2114;
        id v45 = v31;
        _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An error occurred during dialog presentation %{public}@", buf, 0x20u);
      }
    }
    uint64_t v18 = [a1 handleDialogResult:v30 taskInfo:v7];
  }
  else
  {
    uint64_t v18 = +[AMSURLAction actionWithError:v28];
  }

LABEL_25:
  return v18;
}

- (id)performWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFinanceDialogResponse *)self dialogRequest];
  id v6 = +[AMSFinanceDialogResponse performFinanceDialog:v5 taskInfo:v4];

  return v6;
}

- (int64_t)_actionTypeFromButtonDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"kind"];
  if (!v4)
  {
    id v4 = [v3 objectForKey:@"action"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"Buy"])
    {
      int64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"OpenURL"])
    {
      int64_t v6 = 5;
    }
    else if ([v5 caseInsensitiveCompare:@"goback"])
    {
      if ([v5 isEqualToString:@"QRCode"])
      {
        int64_t v6 = 7;
      }
      else if ([v5 isEqualToString:@"redeem-code"])
      {
        int64_t v6 = 8;
      }
      else if ([v5 isEqualToString:@"RetryRestoreAll"])
      {
        int64_t v6 = 10;
      }
      else if ([v5 isEqualToString:@"Review"])
      {
        int64_t v6 = 9;
      }
      else if ([v5 isEqualToString:@"Goto"])
      {
        int64_t v6 = 1;
      }
      else if ([v5 isEqualToString:@"GotoFinance"])
      {
        int64_t v6 = 2;
      }
      else if ([v5 isEqualToString:@"GotoFinanceV2"])
      {
        int64_t v6 = 3;
      }
      else if ([v5 isEqualToString:@"ServiceAction"])
      {
        int64_t v6 = 11;
      }
      else if ([v5 isEqualToString:@"FamilyPermissionAction"])
      {
        int64_t v6 = 12;
      }
      else
      {
        int64_t v6 = 0;
      }
    }
    else
    {
      int64_t v6 = 6;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)_createActionFromButtonDictionary:(id)a3 title:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[AMSDialogAction actionWithTitle:a4];
  objc_msgSend(v7, "ams_setButtonDictionary:", v6);
  objc_msgSend(v7, "ams_setActionType:", -[AMSFinanceDialogResponse _actionTypeFromButtonDictionary:](self, "_actionTypeFromButtonDictionary:", v6));
  v8 = [v6 objectForKeyedSubscript:@"retry"];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [v6 objectForKeyedSubscript:@"retry"];
    objc_msgSend(v7, "ams_setShouldRetry:", objc_msgSend(v9, "BOOLValue"));
  }
  else
  {
    objc_msgSend(v7, "ams_setShouldRetry:", 0);
  }

  id v10 = [v6 objectForKeyedSubscript:@"subtarget"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  objc_msgSend(v7, "ams_setSubtarget:", v11);
  id v12 = [v6 objectForKeyedSubscript:@"tidContinue"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"tidContinue"];
    objc_msgSend(v7, "ams_setTidContinue:", objc_msgSend(v13, "BOOLValue"));
  }
  else
  {
    objc_msgSend(v7, "ams_setTidContinue:", 0);
  }

  if (objc_msgSend(v7, "ams_tidContinue"))
  {
    unint64_t v14 = 1;
  }
  else
  {
    v15 = objc_msgSend(v7, "ams_subtarget");
    if ([v15 hasPrefix:@"account"])
    {
      unint64_t v14 = 1;
    }
    else if ([v15 hasPrefix:@"background"])
    {
      unint64_t v14 = 2;
    }
    else
    {
      unint64_t v14 = 0;
    }
  }
  uint64_t v16 = [v6 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;

    if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
      goto LABEL_23;
    }
  }
  else
  {

    id v17 = 0;
  }
  uint64_t v18 = 0;
LABEL_23:
  objc_msgSend(v7, "ams_setURLType:", v14);
  switch(objc_msgSend(v7, "ams_actionType"))
  {
    case 1:
    case 2:
    case 3:
      if (v14 < 2)
      {
        if (-[AMSFinanceDialogResponse _isCommerceUIURL:actionType:URLType:](self, "_isCommerceUIURL:actionType:URLType:", v18, objc_msgSend(v7, "ams_actionType"), v14))
        {
          objc_msgSend(v7, "ams_setCommerceUIURL:", 1);
        }
        goto LABEL_27;
      }
      if (v18)
      {
        id v19 = [MEMORY[0x1E4F18DA8] requestWithURL:v18];
        [v7 setRequest:v19];
      }
      else
      {
        [v7 setRequest:0];
      }
      break;
    case 5:
      [v7 setDeepLink:v18];
      [v7 setInferLinkDestination:0];
      break;
    case 7:
      uint64_t v20 = [v6 objectForKeyedSubscript:@"message"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      int v22 = [v6 objectForKeyedSubscript:@"explanation"];
      objc_opt_class();
      v23 = v18;
      if (objc_opt_isKindOfClass()) {
        id v24 = v22;
      }
      else {
        id v24 = 0;
      }

      __int16 v25 = v21;
      int v26 = [[AMSDialogRequest alloc] initWithTitle:v21 message:v24];
      char v27 = AMSLogKey();
      [(AMSDialogRequest *)v26 setLogKey:v27];

      id v28 = [(AMSDialogRequest *)v26 userInfo];
      v29 = (void *)[v28 mutableCopy];
      __int16 v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v32 = v31;

      [v32 setObject:v6 forKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];
      [(AMSDialogRequest *)v26 setUserInfo:v32];
      [v7 setDialogRequest:v26];

      uint64_t v18 = v23;
      break;
    case 12:
LABEL_27:
      [v7 setDeepLink:v18];
      break;
    default:
      break;
  }
  id v33 = [v7 deepLink];

  if (v33)
  {
    uint64_t v34 = +[AMSLogConfig sharedConfig];
    if (!v34)
    {
      uint64_t v34 = +[AMSLogConfig sharedConfig];
    }
    v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = v6;
      uint64_t v37 = v18;
      id v38 = objc_opt_class();
      id v52 = v38;
      id v39 = AMSSetLogKeyIfNeeded();
      id v40 = [v7 deepLink];
      AMSHashIfNeeded(v40);
      __int16 v42 = v41 = v17;
      *(_DWORD *)buf = 138543874;
      v56 = v38;
      uint64_t v18 = v37;
      id v6 = v36;
      __int16 v57 = 2114;
      v58 = v39;
      __int16 v59 = 2114;
      v60 = v42;
      _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Button Deep-Link URL: %{public}@", buf, 0x20u);

      id v17 = v41;
    }
  }
  __int16 v43 = +[AMSLogConfig sharedConfig];
  if (!v43)
  {
    __int16 v43 = +[AMSLogConfig sharedConfig];
  }
  __int16 v44 = [v43 OSLogObject];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = v17;
    uint64_t v46 = objc_opt_class();
    id v53 = v46;
    v47 = AMSSetLogKeyIfNeeded();
    id v54 = v6;
    v48 = v18;
    v49 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v7, "ams_commerceUIURL"));
    v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v7, "ams_resolvedInterruption"));
    *(_DWORD *)buf = 138544130;
    v56 = v46;
    id v17 = v45;
    __int16 v57 = 2114;
    v58 = v47;
    __int16 v59 = 2114;
    v60 = v49;
    __int16 v61 = 2114;
    v62 = v50;
    _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Button CommerceUIURL: %{public}@, ResolvedInterruption: %{public}@", buf, 0x2Au);

    uint64_t v18 = v48;
    id v6 = v54;
  }
  return v7;
}

- (id)_createDialogRequest
{
  id v3 = [(AMSFinanceDialogResponse *)self taskInfo];
  id v4 = [v3 properties];
  id v5 = [v4 account];

  id v6 = [(AMSFinanceDialogResponse *)self dialogDictionary];
  id v7 = [v6 objectForKeyedSubscript:@"message"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  char v9 = [v5 username];
  id v10 = objc_msgSend(v8, "ams_replaceAccountPatternWithUsername:", v9);

  id v11 = [(AMSFinanceDialogResponse *)self dialogDictionary];
  id v12 = [v11 objectForKeyedSubscript:@"explanation"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  unint64_t v14 = [v5 username];
  v15 = objc_msgSend(v13, "ams_replaceAccountPatternWithUsername:", v14);

  uint64_t v16 = [[AMSDialogRequest alloc] initWithTitle:v10 message:v15];
  id v17 = AMSLogKey();
  [(AMSDialogRequest *)v16 setLogKey:v17];

  uint64_t v18 = [(AMSDialogRequest *)v16 userInfo];
  id v19 = (void *)[v18 mutableCopy];
  uint64_t v20 = v19;
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v22 = v21;

  v23 = [(AMSFinanceDialogResponse *)self dialogDictionary];
  [v22 setObject:v23 forKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];

  [(AMSDialogRequest *)v16 setUserInfo:v22];
  id v24 = [(AMSFinanceDialogResponse *)self responseDictionary];
  __int16 v25 = [v24 objectForKeyedSubscript:@"metrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;

    if (!v26) {
      goto LABEL_15;
    }
    __int16 v25 = [(AMSFinanceDialogResponse *)self _enrichedMetricsDictionaryWithFinanceDictionary:v26];
    char v27 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v25];
    [(AMSDialogRequest *)v16 setMetricsEvent:v27];
  }
  else
  {
    id v26 = 0;
  }

LABEL_15:
  id v28 = [v26 objectForKeyedSubscript:@"dialogId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v28;

    if (v29) {
      [(AMSDialogRequest *)v16 setIdentifier:v29];
    }
  }
  else
  {

    id v29 = 0;
  }
  __int16 v30 = [(AMSFinanceDialogResponse *)self dialogDictionary];
  id v31 = [(AMSFinanceDialogResponse *)self _createRequestButtonsFromDialogDictionary:v30];
  [(AMSDialogRequest *)v16 setButtonActions:v31];

  uint64_t v32 = [(AMSFinanceDialogResponse *)self dialogDictionary];
  id v33 = [v32 objectForKeyedSubscript:@"preventsCancelButtonStyle"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v34 = [(AMSFinanceDialogResponse *)self dialogDictionary];
    [v34 objectForKeyedSubscript:@"preventsCancelButtonStyle"];
    id v42 = v29;
    id v35 = v26;
    id v36 = v22;
    uint64_t v37 = v15;
    id v38 = v5;
    id v40 = v39 = v10;
    -[AMSDialogRequest setPreventsCancelButtonStyle:](v16, "setPreventsCancelButtonStyle:", [v40 BOOLValue]);

    id v10 = v39;
    id v5 = v38;
    v15 = v37;
    int v22 = v36;
    id v26 = v35;
    id v29 = v42;
  }
  else
  {
    [(AMSDialogRequest *)v16 setPreventsCancelButtonStyle:0];
  }

  return v16;
}

- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  [v3 setObject:&unk_1EDD012B8 forKeyedSubscript:@"eventVersion"];
  id v4 = +[AMSDevice screenScale];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"pixelRatio"];
  }
  id v5 = +[AMSDevice screenWidth];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"screenWidth"];
  }
  id v6 = +[AMSDevice screenHeight];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"screenHeight"];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

- (id)_createRequestButtonsFromDialogDictionary:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v4 objectForKeyedSubscript:@"okButtonString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7)
    {
LABEL_7:
      id v8 = [v4 objectForKeyedSubscript:@"okButtonAction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      id v10 = [(AMSFinanceDialogResponse *)self _createActionFromButtonDictionary:v9 title:v7];
      uint64_t v32 = @"targetId";
      v33[0] = @"OK";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      objc_msgSend(v10, "ams_setMetricsDictionary:", v11);

      [v5 addObject:v10];
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v7 = [v4 objectForKeyedSubscript:@"okButton"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v7;

    if (!v7) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
LABEL_11:

LABEL_12:
  id v12 = [v4 objectForKeyedSubscript:@"cancelButtonString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;

    if (v13)
    {
LABEL_18:
      v15 = v5;
      uint64_t v16 = @"cancelButtonAction";
      int v17 = 1;
      goto LABEL_23;
    }
  }
  else
  {
  }
  unint64_t v14 = [v4 objectForKeyedSubscript:@"cancelButton"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v14;

    if (v13) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v18 = [v4 objectForKeyedSubscript:@"otherButtonString"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = 0;
    goto LABEL_38;
  }
  id v13 = v18;

  if (!v13) {
    goto LABEL_39;
  }
  v15 = v5;
  int v17 = 0;
  uint64_t v16 = @"otherButtonAction";
LABEL_23:
  id v19 = [v4 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  id v21 = [(AMSFinanceDialogResponse *)self _createActionFromButtonDictionary:v20 title:v13];
  [v21 setStyle:2];
  __int16 v30 = @"targetId";
  id v31 = @"Cancel";
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  objc_msgSend(v21, "ams_setMetricsDictionary:", v22);

  [v15 addObject:v21];
  if (!v17)
  {
    id v5 = v15;
    goto LABEL_39;
  }
  id v23 = [v4 objectForKeyedSubscript:@"otherButtonString"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = 0;
    id v5 = v15;
LABEL_37:

    goto LABEL_38;
  }
  id v18 = v23;

  if (v18)
  {
    id v24 = [v4 objectForKeyedSubscript:@"otherButtonAction"];
    objc_opt_class();
    id v5 = v15;
    if (objc_opt_isKindOfClass()) {
      id v23 = v24;
    }
    else {
      id v23 = 0;
    }

    __int16 v25 = [(AMSFinanceDialogResponse *)self _createActionFromButtonDictionary:v23 title:v18];
    id v28 = @"targetId";
    id v29 = @"Other";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    objc_msgSend(v25, "ams_setMetricsDictionary:", v26);

    [v5 addObject:v25];
    goto LABEL_37;
  }
  id v5 = v15;
LABEL_38:

LABEL_39:
  return v5;
}

+ (BOOL)_credentialSource:(unint64_t)a3 satisfiesAuthenticationType:(unint64_t)a4
{
  BOOL v4 = a4 < 2;
  if (a3 != 5) {
    BOOL v4 = 0;
  }
  return a3 == 2 || v4;
}

+ (id)_handleAskPermissionRequestWithURL:(id)a3 account:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(AMSMutableBinaryPromise);
  id v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = AMSLogKey();
    id v13 = AMSLogableURL(v5);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    char v27 = v13;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting ask permission request: %@", buf, 0x20u);
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  unint64_t v14 = (void *)_MergedGlobals_107;
  uint64_t v25 = _MergedGlobals_107;
  if (!_MergedGlobals_107)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAPRequestHandlerClass_block_invoke;
    char v27 = &unk_1E559EC70;
    id v28 = &v22;
    __getAPRequestHandlerClass_block_invoke((uint64_t)buf);
    unint64_t v14 = (void *)v23[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v22, 8);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__AMSFinanceDialogResponse__handleAskPermissionRequestWithURL_account___block_invoke;
  v20[3] = &unk_1E559F028;
  uint64_t v16 = v7;
  id v21 = v16;
  [v15 addRequestWithURL:v5 account:v6 completion:v20];
  id v19 = 0;
  [(AMSBinaryPromise *)v16 resultWithError:&v19];
  id v17 = v19;
  if (!v17)
  {
    AMSError(512, @"Family permission unknown error", &stru_1EDCA7308, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __71__AMSFinanceDialogResponse__handleAskPermissionRequestWithURL_account___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = @"Family permission failed";
    uint64_t v4 = 512;
  }
  else
  {
    id v3 = @"Family permission required";
    uint64_t v4 = 511;
  }
  AMSError(v4, v3, 0, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (BOOL)_isCommerceUIURL:(id)a3 actionType:(int64_t)a4 URLType:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8) {
    goto LABEL_13;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
LABEL_3:
    char v9 = 1;
    goto LABEL_14;
  }
  if (a4 != 1)
  {
LABEL_13:
    char v9 = 0;
    goto LABEL_14;
  }
  if (a5 == 1) {
    goto LABEL_3;
  }
  id v10 = [AMSURLParser alloc];
  id v11 = [(AMSFinanceDialogResponse *)self taskInfo];
  id v12 = [v11 properties];
  id v13 = [v12 bag];
  unint64_t v14 = [(AMSURLParser *)v10 initWithBag:v13];

  id v15 = [(AMSURLParser *)v14 isCommerceUIURL:v8];
  id v22 = 0;
  char v9 = [v15 resultWithError:&v22];
  id v16 = v22;

  if (v16)
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      id v20 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      id v26 = v20;
      __int16 v27 = 2114;
      id v28 = v16;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provided URL is not identified as Commerce UI URL. %{public}@", buf, 0x20u);
    }
  }

LABEL_14:
  return v9;
}

+ (id)_presentDialog:(id)a3 taskInfo:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 session];
  char v9 = [v8 delegate];

  char v10 = objc_opt_respondsToSelector();
  char v11 = objc_opt_respondsToSelector();
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    id v12 = AMSError(2, @"Finance Dialog Error", @"No delegate to present the dialog", 0);
    id v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    uint64_t v15 = objc_opt_class();
    id v16 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v15;
    __int16 v42 = 2114;
    __int16 v43 = v16;
    __int16 v44 = 2114;
    id v45 = v12;
    id v17 = "%{public}@: [%{public}@] Failed to present dialog (no delegate). %{public}@";
LABEL_16:
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

LABEL_17:
    id v23 = +[AMSPromise promiseWithError:v12];

    goto LABEL_27;
  }
  if (!v6)
  {
    id v12 = AMSError(2, @"Finance Dialog Failed", @"No dialog request", 0);
    id v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    uint64_t v27 = objc_opt_class();
    id v16 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v27;
    __int16 v42 = 2114;
    __int16 v43 = v16;
    __int16 v44 = 2114;
    id v45 = v12;
    id v17 = "%{public}@: [%{public}@] Failed to present dialog (no request). %{public}@";
    goto LABEL_16;
  }
  id v18 = +[AMSLogConfig sharedConfig];
  uint64_t v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = objc_opt_class();
    id v21 = v20;
    id v22 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = (uint64_t)v20;
    __int16 v42 = 2114;
    __int16 v43 = v22;
    __int16 v44 = 2114;
    id v45 = v6;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting dialog: %{public}@", buf, 0x20u);
  }
  id v23 = [[AMSPromise alloc] initWithTimeout:300.0];
  if (v10)
  {
    uint64_t v24 = [v7 session];
    __int16 v25 = [v7 task];
    id v26 = [(AMSPromise *)v23 completionHandlerAdapter];
    [v9 AMSURLSession:v24 task:v25 handleDialogRequest:v6 completion:v26];
  }
  else
  {
    BOOL v28 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v29 = +[AMSLogConfig sharedConfig];
    __int16 v30 = [v29 OSLogObject];
    id v31 = v30;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class();
        id v33 = v32;
        uint64_t v34 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = (uint64_t)v32;
        __int16 v42 = 2114;
        __int16 v43 = v34;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);
      }
      uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:0 userInfo:0];
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        id v35 = objc_opt_class();
        id v36 = v35;
        uint64_t v37 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = (uint64_t)v35;
        __int16 v42 = 2114;
        __int16 v43 = v37;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);
      }
    }

    uint64_t v24 = [v7 session];
    __int16 v25 = [(AMSPromise *)v23 completionHandlerAdapter];
    [v9 AMSURLSession:v24 handleDialogRequest:v6 completion:v25];
  }

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __52__AMSFinanceDialogResponse__presentDialog_taskInfo___block_invoke;
  v39[3] = &__block_descriptor_40_e37_v24__0__AMSDialogResult_8__NSError_16l;
  v39[4] = a1;
  [(AMSPromise *)v23 addFinishBlock:v39];
LABEL_27:

  return v23;
}

void __52__AMSFinanceDialogResponse__presentDialog_taskInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      char v9 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      char v10 = "%{public}@: [%{public}@] Dialog succeeded.";
      char v11 = v7;
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
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      char v9 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v4;
      char v10 = "%{public}@: [%{public}@] Dialog failed. %{public}@";
      char v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
      goto LABEL_10;
    }
  }
}

+ (id)_presentIDSDialog:(id)a3 taskInfo:(id)a4
{
  id v4 = AMSError(11, @"IDS Not Supported", @"Invalid platform", 0);
  uint64_t v5 = +[AMSBinaryPromise promiseWithError:v4];

  return v5;
}

+ (id)_serviceActionFromButton:(id)a3 taskInfo:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "ams_buttonDictionary");
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;

      if (v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
        if (v8)
        {
          char v9 = v8;
          char v10 = [v5 objectForKeyedSubscript:@"dialogData"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;

            if (v11)
            {
              if ([MEMORY[0x1E4F28D90] isValidJSONObject:v11])
              {
                id v28 = 0;
                os_log_type_t v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:0 error:&v28];
                id v13 = v28;
                if (!v13)
                {
LABEL_37:

                  goto LABEL_38;
                }
                uint64_t v14 = +[AMSLogConfig sharedConfig];
                if (!v14)
                {
                  uint64_t v14 = +[AMSLogConfig sharedConfig];
                }
                int v15 = [v14 OSLogObject];
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v16 = objc_opt_class();
                  uint64_t v17 = AMSLogKey();
                  *(_DWORD *)buf = 138543874;
                  uint64_t v32 = v16;
                  __int16 v33 = 2114;
                  uint64_t v34 = v17;
                  id v18 = (void *)v17;
                  __int16 v35 = 2114;
                  id v36 = v13;
                  _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service action dialog data encountered JSON error: %{public}@", buf, 0x20u);
                }
              }
              else
              {
                id v13 = +[AMSLogConfig sharedConfig];
                if (!v13)
                {
                  id v13 = +[AMSLogConfig sharedConfig];
                }
                uint64_t v14 = [v13 OSLogObject];
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v25 = objc_opt_class();
                  id v26 = AMSLogKey();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v32 = v25;
                  __int16 v33 = 2114;
                  uint64_t v34 = (uint64_t)v26;
                  _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service action dialog data not JSON compatible", buf, 0x16u);
                }
                os_log_type_t v12 = 0;
              }

              goto LABEL_37;
            }
          }
          else
          {

            id v11 = 0;
          }
          os_log_type_t v12 = 0;
LABEL_38:
          uint64_t v21 = +[AMSURLAction redirectActionWithURL:v9];
          [v21 setUpdatedMethod:@"POST"];
          [v21 setUpdatedBody:v12];
          uint64_t v29 = @"Content-Type";
          __int16 v30 = @"application/json";
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          [v21 setUpdatedHeaders:v27];

LABEL_25:
          goto LABEL_26;
        }
      }
    }
    else
    {

      id v7 = 0;
    }
    char v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      char v9 = +[AMSLogConfig sharedConfig];
    }
    os_log_type_t v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      id v23 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v22;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v23;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to locate URL for service action", buf, 0x16u);
    }
    uint64_t v21 = 0;
    goto LABEL_25;
  }
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  char v9 = [v7 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_opt_class();
    id v20 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v19;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v20;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to locate button dictionary for service action", buf, 0x16u);
  }
  uint64_t v21 = 0;
LABEL_26:

  return v21;
}

+ (BOOL)_shouldSendOverIDS:(id)a3 taskInfo:(id)a4
{
  return 0;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (BOOL)containsCommerceUIURL
{
  return self->_containsCommerceUIURL;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
}

@end