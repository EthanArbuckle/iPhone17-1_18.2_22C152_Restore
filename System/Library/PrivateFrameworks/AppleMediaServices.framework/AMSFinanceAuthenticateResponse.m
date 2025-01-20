@interface AMSFinanceAuthenticateResponse
+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4 dialogResponse:(id)a5 serviceIdentifier:(id)a6;
+ (id)_handleAuthResult:(id)a3 authError:(id)a4 originalRequest:(id)a5 actionResult:(id)a6 redirectURL:(id)a7 taskInfo:(id)a8;
+ (id)_performAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6;
+ (id)_performSyncAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6;
+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4;
+ (id)_serviceIdentifierForResponse:(id)a3 taskInfo:(id)a4;
+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4;
+ (unint64_t)authenticationTypeForResponse:(id)a3 responseDictionary:(id)a4;
+ (void)_handleDialogFromAuthError:(id)a3 taskInfo:(id)a4;
+ (void)_updateTaskWithAuthedAccount:(id)a3 taskInfo:(id)a4;
+ (void)_updateTaskWithLastCredentialSource:(id)a3 taskInfo:(id)a4;
- (AMSAuthenticateRequest)authenticateRequest;
- (AMSFinanceAuthenticateResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4;
- (AMSFinanceDialogResponse)dialogResponse;
- (NSDictionary)dialogDictionary;
- (id)_locateActionableButtonUsingDialogResponse:(id)a3;
- (id)performWithTaskInfo:(id)a3;
- (void)setDialogDictionary:(id)a3;
@end

@implementation AMSFinanceAuthenticateResponse

- (AMSFinanceAuthenticateResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AMSFinanceAuthenticateResponse;
  v8 = [(AMSFinanceAuthenticateResponse *)&v23 init];
  if (v8)
  {
    v9 = +[AMSFinanceResponse valueForProtocolKey:@"dialog" inResponse:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }

    dialogDictionary = v8->_dialogDictionary;
    v8->_dialogDictionary = v10;

    if (v8->_dialogDictionary)
    {
      v12 = [[AMSFinanceDialogResponse alloc] initWithResponseDictionary:v6 kind:2 taskInfo:v7];
      dialogResponse = v8->_dialogResponse;
      v8->_dialogResponse = v12;
    }
    v14 = objc_opt_class();
    v15 = [v7 response];
    uint64_t v16 = [v14 authenticationTypeForResponse:v15 responseDictionary:v6];

    v17 = objc_opt_class();
    v18 = [v7 response];
    v19 = [v17 _serviceIdentifierForResponse:v18 taskInfo:v7];

    uint64_t v20 = [(id)objc_opt_class() _authenticateRequestWithAuthType:v16 taskInfo:v7 dialogResponse:v8->_dialogResponse serviceIdentifier:v19];
    authenticateRequest = v8->_authenticateRequest;
    v8->_authenticateRequest = (AMSAuthenticateRequest *)v20;
  }
  return v8;
}

+ (unint64_t)authenticationTypeForResponse:(id)a3 responseDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"X-Apple-Allow-Auth-Types");
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v7 componentsSeparatedByString:@" "];
  v10 = [v8 setWithArray:v9];

  int v11 = [v10 containsObject:@"loud"];
  int v12 = [v10 containsObject:@"silent"];
  uint64_t v13 = objc_msgSend(v6, "ams_statusCode");

  if (v13 != 401)
  {
    if ((v12 & 1) == 0)
    {
      uint64_t v16 = [v5 objectForKeyedSubscript:@"failureType"];
      if (objc_opt_respondsToSelector())
      {
        v17 = [v5 objectForKeyedSubscript:@"failureType"];
        uint64_t v18 = [v17 longLongValue];

        if (v18 == 2002) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      unint64_t v15 = 2;
      goto LABEL_15;
    }
LABEL_12:
    unint64_t v15 = 0;
    goto LABEL_15;
  }
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12) {
    uint64_t v14 = 1;
  }
  if (v11) {
    uint64_t v14 = 2;
  }
  if (v11 & v12) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v14;
  }
LABEL_15:

  return v15;
}

+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 authenticationTypeForResponse:v6 responseDictionary:0];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = +[AMSOptional optionalWithNil];
    v10 = +[AMSPromise promiseWithResult:v9];
  }
  else
  {
    uint64_t v11 = v8;
    v9 = [(id)objc_opt_class() _serviceIdentifierForResponse:v6 taskInfo:v7];
    int v12 = [a1 _authenticateRequestWithAuthType:v11 taskInfo:v7 dialogResponse:0 serviceIdentifier:v9];
    uint64_t v13 = [v7 properties];
    uint64_t v14 = [v13 bag];
    unint64_t v15 = [v14 stringForKey:@"skip-authenticate-header"];
    uint64_t v16 = [v15 valueWithError:0];

    if (v16)
    {
      v17 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", v16);

      if (v17)
      {
        uint64_t v18 = [v12 options];
        [v18 setServiceTokenOnly:1];
      }
    }
    v19 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"Location");
    if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
    }
    else
    {
      uint64_t v20 = 0;
    }
    v10 = [a1 _performAuthRequest:v12 actionResult:0 redirectURL:v20 taskInfo:v7];
  }
  return v10;
}

- (id)performWithTaskInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSFinanceAuthenticateResponse *)self dialogResponse];
  id v6 = [(AMSFinanceAuthenticateResponse *)self _locateActionableButtonUsingDialogResponse:v5];

  id v7 = [AMSDialogResult alloc];
  uint64_t v8 = [(AMSFinanceAuthenticateResponse *)self dialogResponse];
  v9 = [v8 dialogRequest];
  v10 = [v6 identifier];
  uint64_t v11 = [(AMSDialogResult *)v7 initWithOriginalRequest:v9 selectedActionIdentifier:v10];

  int v12 = [v6 deepLink];

  if (v12)
  {
    uint64_t v13 = objc_msgSend(v6, "ams_rawURL");
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v6 deepLink];
    }
    int v12 = v15;
  }
  uint64_t v16 = objc_opt_class();
  v17 = [(AMSFinanceAuthenticateResponse *)self authenticateRequest];
  uint64_t v18 = [v16 _performSyncAuthRequest:v17 actionResult:v11 redirectURL:v12 taskInfo:v4];

  return v18;
}

+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4 dialogResponse:(id)a5 serviceIdentifier:(id)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [v9 properties];
  if ([v12 dialogOptions])
  {
  }
  else
  {
    uint64_t v13 = [v9 properties];
    char v14 = [v13 dialogOptions];

    if ((v14 & 4) == 0) {
      goto LABEL_10;
    }
  }
  id v15 = +[AMSLogConfig sharedAccountsConfig];
  if (!v15)
  {
    id v15 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    id v64 = v17;
    [v9 properties];
    id v18 = v11;
    uint64_t v20 = v19 = v9;
    [v20 logUUID];
    v22 = id v21 = v10;
    *(_DWORD *)buf = 138544130;
    v72 = v17;
    __int16 v73 = 2114;
    v74 = v22;
    __int16 v75 = 2048;
    unint64_t v76 = a3;
    __int16 v77 = 2048;
    uint64_t v78 = 1;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding the authentication type. originalAuthenticationType = %lu | newAuthenticationType = %lu", buf, 0x2Au);

    id v10 = v21;
    id v9 = v19;
    id v11 = v18;
  }
  a3 = 1;
LABEL_10:
  objc_super v23 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v23 setAuthenticationType:a3];
  [(AMSAuthenticateOptions *)v23 setAllowServerDialogs:a3 != 1];
  [(AMSAuthenticateOptions *)v23 setAllowSecondaryCredentialSource:0];
  [(AMSAuthenticateOptions *)v23 setCanMakeAccountActive:0];
  v24 = [v9 properties];
  v25 = [v24 clientInfo];

  if (v25)
  {
    v26 = [v9 properties];
    v27 = [v26 clientInfo];
    [(AMSAuthenticateOptions *)v23 setClientInfo:v27];
  }
  v65 = v11;
  [(AMSAuthenticateOptions *)v23 setServiceIdentifier:v11];
  if (v10)
  {
    v28 = [v10 dialogRequest];
    v29 = [v28 title];
    [(AMSAuthenticateOptions *)v23 setPromptTitle:v29];

    v30 = [v10 dialogRequest];
    v31 = [v30 message];
    [(AMSAuthenticateOptions *)v23 setReason:v31];

    v62 = v10;
    v32 = NSString;
    v33 = [v9 response];
    v34 = [v33 URL];
    v35 = AMSLogableURL(v34);
    v36 = v9;
    v37 = (void *)MEMORY[0x1E4F28ED0];
    v38 = [v36 response];
    v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "ams_statusCode"));
    v63 = v36;
    v40 = [v36 response];
    v41 = objc_msgSend(v40, "ams_valueForHTTPHeaderField:", @"X-Apple-Jingle-Correlation-Key");
    v42 = AMSHashIfNeeded(v41);
    v43 = [v32 stringWithFormat:@"url: %@; status: %@; correlation: %@", v35, v39, v42];
    [(AMSAuthenticateOptions *)v23 setDebugReason:v43];

    id v10 = v62;
    v44 = [v62 dialogRequest];
    v45 = [v44 buttonActions];

    if ((unint64_t)[v45 count] <= 2)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v67;
        while (2)
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v67 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if (objc_msgSend(v51, "ams_actionType") && objc_msgSend(v51, "ams_actionType") != 6)
            {
              v52 = [v51 title];
              [(AMSAuthenticateOptions *)v23 setDefaultButtonString:v52];

              goto LABEL_26;
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:v70 count:16];
          if (v48) {
            continue;
          }
          break;
        }
      }
LABEL_26:
    }
    id v9 = v63;
  }
  else
  {
    [(AMSAuthenticateOptions *)v23 setDebugReason:@"no dialogResponse in AMSFinanceAuthenticateResponse"];
  }
  v53 = [v9 properties];
  v54 = [v53 account];
  char v55 = objc_msgSend(v54, "ams_isLocalAccount");

  if (v55)
  {
    v56 = 0;
  }
  else
  {
    v57 = [v9 properties];
    v56 = [v57 account];
  }
  v58 = [[AMSAuthenticateRequest alloc] initWithAccount:v56 options:v23];
  v59 = [v9 properties];
  v60 = [v59 logUUID];
  [(AMSAuthenticateRequest *)v58 setLogKey:v60];

  [(AMSAuthenticateRequest *)v58 setIsServerRequested:1];
  return v58;
}

- (id)_locateActionableButtonUsingDialogResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(v3, "dialogRequest", 0);
  id v5 = [v4 buttonActions];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      if (objc_msgSend(v11, "ams_actionType"))
      {
        id v12 = v11;

        uint64_t v8 = v12;
      }
      if (objc_msgSend(v11, "ams_actionType") == 1)
      {
        uint64_t v13 = objc_msgSend(v11, "ams_subtarget");
        char v14 = [v13 lowercaseString];
        int v15 = [v14 containsString:@"signup"];

        if (!v15) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_performAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [a1 _presentAuthRequest:v10 taskInfo:v13];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__AMSFinanceAuthenticateResponse__performAuthRequest_actionResult_redirectURL_taskInfo___block_invoke;
  v21[3] = &unk_1E55A2C68;
  id v25 = v13;
  id v26 = a1;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  long long v19 = [v14 continueWithBlock:v21];

  return v19;
}

uint64_t __88__AMSFinanceAuthenticateResponse__performAuthRequest_actionResult_redirectURL_taskInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 64) _handleAuthResult:a2 authError:a3 originalRequest:*(void *)(a1 + 32) actionResult:*(void *)(a1 + 40) redirectURL:*(void *)(a1 + 48) taskInfo:*(void *)(a1 + 56)];
}

+ (id)_performSyncAuthRequest:(id)a3 actionResult:(id)a4 redirectURL:(id)a5 taskInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = [a1 _presentAuthRequest:v13 taskInfo:v10];
  id v21 = 0;
  id v15 = [v14 resultWithError:&v21];
  id v16 = v21;

  id v17 = [(id)objc_opt_class() _handleAuthResult:v15 authError:v16 originalRequest:v13 actionResult:v12 redirectURL:v11 taskInfo:v10];

  id v18 = [v17 resultWithError:0];
  long long v19 = [v18 value];

  return v19;
}

+ (id)_handleAuthResult:(id)a3 authError:(id)a4 originalRequest:(id)a5 actionResult:(id)a6 redirectURL:(id)a7 taskInfo:(id)a8
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v75 = a7;
  id v17 = a8;
  id v18 = +[AMSLogConfig sharedAccountsConfig];
  if (!v18)
  {
    id v18 = +[AMSLogConfig sharedConfig];
  }
  long long v19 = [v18 OSLogObject];
  long long v20 = v76;
  id v73 = v15;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_opt_class();
    id v69 = v16;
    id v22 = v21;
    [v17 properties];
    v24 = id v23 = a1;
    [v24 logUUID];
    v26 = id v25 = v17;
    *(_DWORD *)buf = 138543874;
    uint64_t v79 = (uint64_t)v21;
    __int16 v80 = 2114;
    v81 = v26;
    __int16 v82 = 1024;
    LODWORD(v83) = v76 != 0;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication finished (success: %d)", buf, 0x1Cu);

    id v17 = v25;
    a1 = v23;

    id v15 = v73;
    id v16 = v69;
  }

  v74 = v14;
  if (v14)
  {
    [a1 _handleDialogFromAuthError:v14 taskInfo:v17];
    v27 = +[AMSURLAction actionWithError:v14];
    v28 = v27;
    if (v27)
    {
      v29 = v27;
      if ([v27 actionType]) {
        goto LABEL_39;
      }
    }
  }
  else
  {
    [a1 _updateTaskWithAuthedAccount:v76 taskInfo:v17];
    [a1 _updateTaskWithLastCredentialSource:v76 taskInfo:v17];
    v28 = 0;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v31 = [v16 originalRequest];
  v32 = [v16 selectedActionIdentifier];
  v33 = [v31 locateActionWithIdentifier:v32];

  v72 = v33;
  if (objc_msgSend(v33, "ams_URLType") == 1 || objc_msgSend(v33, "ams_actionType") == 5)
  {
    uint64_t v34 = +[AMSFinanceDialogResponse handleDialogResult:v16 taskInfo:v17];
  }
  else
  {
    if (v75) {
      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:");
    }
    else {
    uint64_t v34 = +[AMSURLAction retryAction];
    }
  }
  v29 = (void *)v34;

  [v29 setRetryIdentifier:0x1EDCAA288];
  [v29 setReason:@"authentication"];
  [v29 setDialogResult:v16];
  [v29 setAuthenticateResult:v76];
  v35 = [v15 options];
  v36 = [v35 serviceIdentifier];

  if (v36)
  {
    long long v68 = v36;
    v37 = +[AMSLogConfig sharedConfig];
    if (!v37)
    {
      v37 = +[AMSLogConfig sharedConfig];
    }
    v38 = [v37 OSLogObject];
    id v67 = v17;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = objc_opt_class();
      v40 = AMSLogKey();
      v41 = [v76 authKitUpdateResult];
      [v41 authenticationResults];
      v42 = id v70 = v16;
      v43 = objc_msgSend(v42, "ak_redactedCopy");
      v44 = AMSHashIfNeeded(v43);
      *(_DWORD *)buf = 138544130;
      uint64_t v79 = v39;
      long long v20 = v76;
      __int16 v80 = 2114;
      v81 = v40;
      __int16 v82 = 2112;
      v83 = v68;
      __int16 v84 = 2112;
      v85 = v44;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth request service identifier: %@. Authentication results: %@", buf, 0x2Au);

      id v16 = v70;
    }

    v45 = [MEMORY[0x1E4F4BFA0] currentInfo];
    __int16 v77 = [v45 clientInfoHeader];

    v71 = +[AMSDevice uniqueDeviceId];
    id v46 = [v20 authKitUpdateResult];
    uint64_t v47 = [v46 authenticationResults];
    uint64_t v48 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v49 = v48;
    }
    else {
      id v49 = 0;
    }
    v36 = v68;

    v50 = [v49 objectForKeyedSubscript:v68];
    [v30 setObject:v77 forKeyedSubscript:@"X-MMe-Client-Info"];
    [v30 setObject:v71 forKeyedSubscript:@"X-Mme-Device-Id"];
    [v30 setObject:v50 forKeyedSubscript:@"X-Apple-GS-Token"];
    [v30 setObject:v68 forKeyedSubscript:@"X-Apple-GS-Token-Identifier"];
    uint64_t v51 = +[AMSLogConfig sharedConfig];
    v52 = (void *)v51;
    if (v50)
    {
      if (!v51)
      {
        v52 = +[AMSLogConfig sharedConfig];
      }
      v53 = [v52 OSLogObject];
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      uint64_t v54 = objc_opt_class();
      AMSLogKey();
      v56 = id v55 = v16;
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v54;
      __int16 v80 = 2114;
      v81 = v56;
      __int16 v82 = 2112;
      v83 = v50;
      v57 = "%{public}@: [%{public}@] Received an updated GrandSlam token %@";
      v58 = v53;
      os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!v51)
      {
        v52 = +[AMSLogConfig sharedConfig];
      }
      v53 = [v52 OSLogObject];
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      uint64_t v60 = objc_opt_class();
      AMSLogKey();
      v56 = id v55 = v16;
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v60;
      __int16 v80 = 2114;
      v81 = v56;
      __int16 v82 = 2112;
      v83 = v20;
      v57 = "%{public}@: [%{public}@] Unable to locate GrandSlam token in auth result: %@";
      v58 = v53;
      os_log_type_t v59 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_18D554000, v58, v59, v57, buf, 0x20u);

    id v16 = v55;
    v36 = v68;
LABEL_34:

    id v15 = v73;
    id v17 = v67;
  }
  v61 = [v20 account];
  int64_t v62 = +[AMSBiometrics stateForAccount:v61];

  if (v20 && v62 == 1) {
    [v30 setObject:0x1EDCAC5E8 forKeyedSubscript:@"X-Apple-TID-Action"];
  }
  v63 = (void *)[v30 copy];
  [v29 setUpdatedHeaders:v63];

LABEL_39:
  id v64 = [[AMSOptional alloc] initWithValue:v29];
  v65 = +[AMSPromise promiseWithResult:v64];

  return v65;
}

+ (void)_handleDialogFromAuthError:(id)a3 taskInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"AMSAuthenticateErrorDialog"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    if (v9)
    {
LABEL_7:
      id v14 = +[AMSLogConfig sharedAccountsConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_opt_class();
        id v17 = v16;
        id v18 = [v6 properties];
        long long v19 = [v18 logUUID];
        int v21 = 138543618;
        id v22 = v16;
        __int16 v23 = 2114;
        id v24 = v19;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication returned a dialog.", (uint8_t *)&v21, 0x16u);
      }
      id v20 = +[AMSFinanceDialogResponse performFinanceDialog:v9 taskInfo:v6];

      goto LABEL_13;
    }
  }
  else
  {
  }
  id v10 = [v5 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v12 = [v11 userInfo];
  id v13 = [v12 objectForKeyedSubscript:@"AMSAuthenticateErrorDialog"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_13;
  }
  id v9 = v13;

  if (v9) {
    goto LABEL_7;
  }
LABEL_13:
}

+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 session];
  uint64_t v8 = [v7 delegate];
  char v9 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  if (v9 & 1) != 0 || (v10)
  {
    id v18 = +[AMSLogConfig sharedAccountsConfig];
    if (!v18)
    {
      id v18 = +[AMSLogConfig sharedConfig];
    }
    long long v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_opt_class();
      id v30 = v20;
      int v21 = [v6 properties];
      id v22 = [v21 logUUID];
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      __int16 v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing authentication", buf, 0x16u);
    }
    id v17 = objc_alloc_init(AMSPromise);
    if (v9)
    {
      id v16 = [v6 task];
      __int16 v23 = [(AMSPromise *)v17 completionHandlerAdapter];
      [v8 AMSURLSession:v7 task:v16 handleAuthenticateRequest:v5 completion:v23];
    }
    else
    {
      id v24 = +[AMSLogConfig sharedAccountsConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = objc_opt_class();
        id v31 = v26;
        v27 = [v6 properties];
        v28 = [v27 logUUID];
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for authentication handling", buf, 0x16u);
      }
      id v16 = [(AMSPromise *)v17 completionHandlerAdapter];
      [v8 AMSURLSession:v7 handleAuthenticateRequest:v5 completion:v16];
    }
  }
  else
  {
    id v16 = AMSErrorWithFormat(2, @"Finance Authentication Error", @"No delegate to perform authentication: %@", v11, v12, v13, v14, v15, (uint64_t)v5);
    id v17 = +[AMSPromise promiseWithError:v16];
  }

  return v17;
}

+ (id)_serviceIdentifierForResponse:(id)a3 taskInfo:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = [v6 properties];
    uint64_t v12 = [v11 logUUID];
    *(_DWORD *)buf = 138543618;
    v57 = v9;
    __int16 v58 = 2114;
    os_log_type_t v59 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Getting service identifier from response", buf, 0x16u);
  }
  uint64_t v13 = objc_msgSend(v5, "ams_valueForHTTPHeaderField:", @"X-Apple-Auth-Services");
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [v13 componentsSeparatedByString:@" "];
  id v16 = [v14 setWithArray:v15];

  int v17 = [v16 containsObject:@"GS"];
  uint64_t v18 = objc_msgSend(v5, "ams_statusCode");
  uint64_t v19 = +[AMSLogConfig sharedAccountsConfig];
  id v20 = (id)v19;
  if (v18 == 401 && v17)
  {
    if (!v19)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    int v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_opt_class();
      id v53 = v22;
      [v6 properties];
      id v23 = v5;
      id v24 = v16;
      uint64_t v25 = v13;
      v27 = id v26 = v6;
      v28 = [v27 logUUID];
      *(_DWORD *)buf = 138543618;
      v57 = v22;
      __int16 v58 = 2114;
      os_log_type_t v59 = v28;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth services header contain GS", buf, 0x16u);

      id v6 = v26;
      uint64_t v13 = v25;
      id v16 = v24;
      id v5 = v23;
    }
    v29 = objc_msgSend(v5, "ams_valueForHTTPHeaderField:", @"X-Apple-GS-Token-Identifier");
    uint64_t v30 = +[AMSLogConfig sharedAccountsConfig];
    id v31 = (void *)v30;
    if (v29)
    {
      if (!v30)
      {
        id v31 = +[AMSLogConfig sharedConfig];
      }
      v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        id v54 = v33;
        [v6 properties];
        v35 = id v34 = v6;
        uint64_t v36 = [v35 logUUID];
        *(_DWORD *)buf = 138543874;
        v57 = v33;
        __int16 v58 = 2114;
        os_log_type_t v59 = v36;
        __int16 v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found GS token header: %@", buf, 0x20u);

        id v6 = v34;
      }

      id v20 = v29;
      v37 = v20;
    }
    else
    {
      if (!v30)
      {
        id v31 = +[AMSLogConfig sharedConfig];
      }
      v44 = [v31 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = [v6 properties];
        v45 = [v55 logUUID];
        id v46 = v6;
        uint64_t v47 = objc_opt_class();
        id v52 = v47;
        uint64_t v48 = [v46 properties];
        id v49 = [v48 gsTokenIdentifier];
        *(_DWORD *)buf = 138543874;
        v57 = v45;
        __int16 v58 = 2114;
        os_log_type_t v59 = v47;
        id v6 = v46;
        __int16 v60 = 2112;
        v61 = v49;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No GS token header. Falling back to that of the task info: %@", buf, 0x20u);
      }
      v50 = [v6 properties];
      v37 = [v50 gsTokenIdentifier];

      id v20 = 0;
    }
  }
  else
  {
    if (!v19)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    v38 = [v20 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = objc_opt_class();
      id v40 = v39;
      v41 = [v6 properties];
      [v41 logUUID];
      v43 = id v42 = v6;
      *(_DWORD *)buf = 138543618;
      v57 = v39;
      __int16 v58 = 2114;
      os_log_type_t v59 = v43;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auth services missing GS", buf, 0x16u);

      id v6 = v42;
    }

    v37 = 0;
  }

  return v37;
}

+ (void)_updateTaskWithAuthedAccount:(id)a3 taskInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [a3 account];
  if (v8)
  {
    char v9 = +[AMSLogConfig sharedAccountsConfig];
    if (!v9)
    {
      char v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v7 properties];
      uint64_t v12 = [v11 logUUID];
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        a1 = [v7 properties];
        id v4 = [a1 logUUID];
        [v13 stringWithFormat:@"%@: [%@] ", v15, v4];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      id v16 = };
      int v17 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      id v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account on URL task. account = %{public}@", buf, 0x16u);
      if (v12)
      {

        id v16 = a1;
      }
    }
    uint64_t v18 = [v7 properties];
    [v18 setAccount:v8];

    uint64_t v19 = [v7 properties];
    id v20 = [v19 purchaseInfo];
    int v21 = [v20 purchase];
    [v21 setAccount:v8];
  }
}

+ (void)_updateTaskWithLastCredentialSource:(id)a3 taskInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 account];
  objc_msgSend(v5, "setPreviousAuthorizationCredentialSource:", objc_msgSend(v6, "ams_lastAuthenticationCredentialSource"));

  if (![v5 previousAuthorizationCredentialSource])
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [v5 properties];
      uint64_t v12 = [v11 logUUID];
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine the credential source from authentication.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (AMSAuthenticateRequest)authenticateRequest
{
  return self->_authenticateRequest;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (void)setDialogDictionary:(id)a3
{
}

- (AMSFinanceDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogResponse, 0);
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
  objc_storeStrong((id *)&self->_authenticateRequest, 0);
}

@end