@interface AMSFinanceActionResponse
+ (BOOL)_isModernURL:(id)a3 taskInfo:(id)a4;
+ (BOOL)_stashTIDContinueHeadersForTaskInfo:(id)a3;
+ (id)_URLForCommerceUIFromURL:(id)a3 taskInfo:(id)a4 tidContinue:(BOOL)a5;
+ (id)_bodyObjectFromRequest:(id)a3;
+ (id)_deepLinkForURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 isAccountURL:(BOOL)a6 tidContinue:(BOOL)a7;
+ (id)_presentEngagementForURL:(id)a3 taskInfo:(id)a4;
+ (id)actionWithActionDictionary:(id)a3 taskInfo:(id)a4;
+ (id)actionWithUpdatedCreditString:(id)a3 account:(id)a4 taskInfo:(id)a5;
+ (id)handleGotoURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 accountURL:(BOOL)a6 tidContinue:(BOOL)a7 retryOnSuccess:(BOOL)a8;
+ (void)handleExternalGotoURL:(id)a3;
+ (void)handleExternalGotoURL:(id)a3 taskInfo:(id)a4;
- (ACAccount)account;
- (AMSFinanceActionResponse)initWithTaskInfo:(id)a3;
- (AMSURLTaskInfo)taskInfo;
- (BOOL)shouldRetry;
- (BOOL)tidContinue;
- (NSString)creditString;
- (NSURL)URL;
- (id)_handleGotoAction;
- (id)_performCreditDisplayUpdate;
- (id)_performGotoURL;
- (id)_performOpenStandardURL;
- (id)performWithTaskInfo:(id)a3;
- (int64_t)kind;
- (void)setAccount:(id)a3;
- (void)setCreditString:(id)a3;
- (void)setKind:(int64_t)a3;
- (void)setShouldRetry:(BOOL)a3;
- (void)setTaskInfo:(id)a3;
- (void)setTidContinue:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSFinanceActionResponse

- (AMSFinanceActionResponse)initWithTaskInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSFinanceActionResponse;
    v6 = [(AMSFinanceActionResponse *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_taskInfo, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)actionWithActionDictionary:(id)a3 taskInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[AMSFinanceActionResponse alloc] initWithTaskInfo:v6];

  v8 = [v5 objectForKeyedSubscript:@"retry"];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v5 objectForKeyedSubscript:@"retry"];
    -[AMSFinanceActionResponse setShouldRetry:](v7, "setShouldRetry:", [v9 BOOLValue]);
  }
  else
  {
    [(AMSFinanceActionResponse *)v7 setShouldRetry:0];
  }

  objc_super v10 = [v5 objectForKeyedSubscript:@"tidContinue"];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v5 objectForKeyedSubscript:@"tidContinue"];
    -[AMSFinanceActionResponse setTidContinue:](v7, "setTidContinue:", [v11 BOOLValue]);
  }
  else
  {
    [(AMSFinanceActionResponse *)v7 setTidContinue:0];
  }

  v12 = [v5 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;

    if (v13)
    {
      v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      [(AMSFinanceActionResponse *)v7 setURL:v14];

      goto LABEL_12;
    }
  }
  else
  {
  }
  [(AMSFinanceActionResponse *)v7 setURL:0];
  id v13 = 0;
LABEL_12:
  v15 = [v5 objectForKeyedSubscript:@"kind"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  if (![v15 caseInsensitiveCompare:@"GoBack"])
  {
    v16 = v7;
    uint64_t v17 = 2;
    goto LABEL_21;
  }
  if (![v15 caseInsensitiveCompare:@"RetryRestoreAll"])
  {
    v16 = v7;
    uint64_t v17 = 5;
    goto LABEL_21;
  }
  if ([v15 isEqualToString:@"Goto"])
  {
    v16 = v7;
    uint64_t v17 = 3;
LABEL_21:
    [(AMSFinanceActionResponse *)v16 setKind:v17];
    goto LABEL_22;
  }
  if ([v15 isEqualToString:@"OpenURL"])
  {
    v16 = v7;
    uint64_t v17 = 4;
    goto LABEL_21;
  }
  if ([v15 isEqualToString:@"GotoFinance"])
  {
    [(AMSFinanceActionResponse *)v7 setKind:4];
    v19 = [(AMSFinanceActionResponse *)v7 URL];
    v20 = v19;
    v21 = @"itms-ui";
  }
  else
  {
    if (![v15 isEqualToString:@"GotoFinanceV2"]) {
      goto LABEL_22;
    }
    [(AMSFinanceActionResponse *)v7 setKind:4];
    v19 = [(AMSFinanceActionResponse *)v7 URL];
    v20 = v19;
    v21 = @"ams-ui";
  }
  v22 = objc_msgSend(v19, "ams_URLByReplacingSchemeWithScheme:", v21);
  [(AMSFinanceActionResponse *)v7 setURL:v22];

LABEL_22:
  return v7;
}

+ (id)actionWithUpdatedCreditString:(id)a3 account:(id)a4 taskInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [[AMSFinanceActionResponse alloc] initWithTaskInfo:v7];

  [(AMSFinanceActionResponse *)v10 setKind:1];
  [(AMSFinanceActionResponse *)v10 setAccount:v8];

  [(AMSFinanceActionResponse *)v10 setCreditString:v9];
  return v10;
}

+ (void)handleExternalGotoURL:(id)a3
{
}

+ (void)handleExternalGotoURL:(id)a3 taskInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  objc_super v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = AMSLogKey();
    v12 = NSString;
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
    v15 = };
    v16 = AMSLogableURL(v7);
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    __int16 v20 = 2114;
    v21 = v16;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Action opening standard URL: %{public}@", buf, 0x16u);
    if (v11)
    {

      v15 = (void *)v4;
    }
  }
  if (v8 && [a1 _stashTIDContinueHeadersForTaskInfo:v8])
  {
    uint64_t v17 = objc_msgSend(v7, "ams_URLByAppendingQueryParameter:name:", @"1", @"signatureResumption");

    id v7 = (id)v17;
  }
  +[AMSOpenURL openStandardURL:v7];
}

+ (id)handleGotoURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 accountURL:(BOOL)a6 tidContinue:(BOOL)a7 retryOnSuccess:(BOOL)a8
{
  BOOL v9 = a8;
  BOOL v51 = a6;
  BOOL v53 = a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    uint64_t v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = AMSLogKey();
    uint64_t v17 = NSString;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = v18;
    if (v16)
    {
      uint64_t v8 = AMSLogKey();
      [v17 stringWithFormat:@"%@: [%@] ", v19, v8];
    }
    else
    {
      [v17 stringWithFormat:@"%@: ", v18];
    __int16 v20 = };
    v21 = AMSLogableURL(v12);
    *(_DWORD *)buf = 138543618;
    v57 = v20;
    __int16 v58 = 2114;
    v59 = v21;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Action opening Goto URL: %{public}@", buf, 0x16u);
    if (v16)
    {

      __int16 v20 = (void *)v8;
    }
  }
  uint64_t v22 = 0;
  if (v12 && v13)
  {
    [a1 _stashTIDContinueHeadersForTaskInfo:v13];
    v23 = [a1 _presentEngagementForURL:v12 taskInfo:v13];
    id v55 = 0;
    v24 = [v23 resultWithError:&v55];
    id v25 = v55;

    if (v24)
    {
      uint64_t v26 = 1;
    }
    else
    {
      v27 = [v25 userInfo];
      v28 = [v27 objectForKeyedSubscript:@"AMSEngagementPresented"];
      if (objc_opt_respondsToSelector())
      {
        [v25 userInfo];
        v29 = BOOL v49 = v9;
        v30 = [v29 objectForKeyedSubscript:@"AMSEngagementPresented"];
        uint64_t v31 = [v30 BOOLValue];

        uint64_t v26 = v31;
        BOOL v9 = v49;
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    if ([v25 code] == 4097)
    {
      v32 = [v25 domain];
      int v33 = [v32 isEqualToString:*MEMORY[0x1E4F281F8]];
    }
    else
    {
      int v33 = 0;
    }
    if (((v26 | v33) & 1) == 0)
    {
      v34 = [a1 _deepLinkForURL:v12 taskInfo:v13 gotoType:a5 isAccountURL:v51 tidContinue:v53];
      [v13 properties];
      v35 = unsigned int v52 = v26;
      [v35 clientInfo];
      v54 = v24;
      id v36 = v12;
      id v37 = v25;
      v39 = BOOL v38 = v9;
      v40 = [v13 properties];
      v41 = [v40 bag];
      id v42 = +[AMSOpenURL openURL:v34 clientInfo:v39 bag:v41];

      BOOL v9 = v38;
      id v25 = v37;
      id v12 = v36;
      v24 = v54;

      uint64_t v26 = v52;
    }
    if (!v26) {
      goto LABEL_28;
    }
    if (v25)
    {
      v43 = +[AMSURLAction actionWithError:v25];
      goto LABEL_29;
    }
    if (v24)
    {
      v44 = [v13 task];
      v45 = [v44 originalRequest];
      v43 = objc_msgSend(v24, "ams_requestActionFromRequest:", v45);
    }
    else
    {
LABEL_28:
      v43 = 0;
    }
LABEL_29:
    if (!v43 && v9)
    {
      v43 = +[AMSURLAction retryAction];
      [v43 setRetryIdentifier:@"GotoAction"];
    }
    if (!v43)
    {
      v46 = objc_msgSend(v24, "ams_buyParams");

      if (!v46
        || (+[AMSURLAction retryAction],
            (v43 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v43 = +[AMSURLAction proceedAction];
      }
    }
    v47 = objc_msgSend(v24, "ams_buyParams");
    [v43 setUpdatedBuyParams:v47];

    uint64_t v22 = objc_alloc_init(AMSOpenActionResult);
    [(AMSOpenActionResult *)v22 setEngagementPresented:v26];
    [(AMSOpenActionResult *)v22 setInterruptionResult:v24 != 0];
    [(AMSOpenActionResult *)v22 setAction:v43];
  }
  return v22;
}

- (id)performWithTaskInfo:(id)a3
{
  int64_t v4 = [(AMSFinanceActionResponse *)self kind];
  switch(v4)
  {
    case 4:
      id v5 = [(AMSFinanceActionResponse *)self _performOpenStandardURL];
      break;
    case 3:
      id v5 = [(AMSFinanceActionResponse *)self _handleGotoAction];
      break;
    case 1:
      id v5 = [(AMSFinanceActionResponse *)self _performCreditDisplayUpdate];
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

+ (id)_bodyObjectFromRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = [v3 allHTTPHeaderFields];
  id v5 = [v4 objectForKeyedSubscript:@"Content-Type"];

  id v6 = [v3 HTTPBody];

  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v16 = 0;
    id v7 = +[AMSData objectWithData:encoding:error:](AMSData, "objectWithData:encoding:error:", v6, +[AMSData dataEncodingFromContentType:v5], &v16);
    id v8 = v16;
    if (v8)
    {
      BOOL v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        BOOL v9 = +[AMSLogConfig sharedConfig];
      }
      objc_super v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        __int16 v20 = v12;
        __int16 v21 = 2114;
        id v22 = v8;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode body object from request. Falling back to string encoding. %{public}@", buf, 0x20u);
      }
      id v13 = (id)[[NSString alloc] initWithData:v6 encoding:4];
    }
    else
    {
      id v13 = v7;
    }
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_performCreditDisplayUpdate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AMSFinanceActionResponse *)self account];
  if (v3)
  {
    int64_t v4 = (void *)v3;
    id v5 = [(AMSFinanceActionResponse *)self creditString];

    if (v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
      if (!v6)
      {
        id v6 = +[AMSLogConfig sharedConfig];
      }
      id v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_opt_class();
        id v9 = v8;
        objc_super v10 = [(AMSFinanceActionResponse *)self taskInfo];
        uint64_t v11 = [v10 properties];
        id v12 = [v11 logUUID];
        int v22 = 138543618;
        uint64_t v23 = v8;
        __int16 v24 = 2114;
        id v25 = v12;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing creditDisplay response action", (uint8_t *)&v22, 0x16u);
      }
      id v13 = [(AMSFinanceActionResponse *)self account];
      uint64_t v14 = [(AMSFinanceActionResponse *)self creditString];
      objc_msgSend(v13, "ams_setCreditsString:", v14);

      v15 = (void *)MEMORY[0x1E4F179C8];
      id v16 = [(AMSFinanceActionResponse *)self taskInfo];
      uint64_t v17 = [v16 properties];
      uint64_t v18 = [v17 clientInfo];
      __int16 v19 = objc_msgSend(v15, "ams_sharedAccountStoreForProcessInfo:", v18);

      id v20 = (id)objc_msgSend(v19, "ams_saveAccount:verifyCredentials:", v13, 0);
    }
  }
  return 0;
}

- (id)_performGotoURL
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AMSFinanceActionResponse *)self URL];

  if (v3)
  {
    int64_t v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      int64_t v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = v6;
      id v8 = [(AMSFinanceActionResponse *)self taskInfo];
      id v9 = [v8 properties];
      objc_super v10 = [v9 logUUID];
      int v14 = 138543618;
      v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing Goto response action", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v11 = [(AMSFinanceActionResponse *)self URL];
    id v12 = +[AMSURLAction redirectActionWithURL:v11];
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)_performOpenStandardURL
{
  uint64_t v3 = [(AMSFinanceActionResponse *)self URL];

  if (v3)
  {
    int64_t v4 = objc_opt_class();
    id v5 = [(AMSFinanceActionResponse *)self URL];
    id v6 = [(AMSFinanceActionResponse *)self taskInfo];
    [v4 handleExternalGotoURL:v5 taskInfo:v6];
  }
  return 0;
}

- (id)_handleGotoAction
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AMSFinanceActionResponse *)self URL];

  if (v3)
  {
    int64_t v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      int64_t v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = v6;
      id v8 = [(AMSFinanceActionResponse *)self taskInfo];
      id v9 = [v8 properties];
      objc_super v10 = [v9 logUUID];
      int v17 = 138543618;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action opening app URL", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v11 = objc_opt_class();
    id v12 = [(AMSFinanceActionResponse *)self URL];
    id v13 = [(AMSFinanceActionResponse *)self taskInfo];
    int v14 = objc_msgSend(v11, "handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:", v12, v13, 1, 0, -[AMSFinanceActionResponse tidContinue](self, "tidContinue"), -[AMSFinanceActionResponse shouldRetry](self, "shouldRetry"));

    v15 = [v14 action];
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)_presentEngagementForURL:(id)a3 taskInfo:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSLogConfig sharedConfig];
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
    uint64_t v44 = v10;
    __int16 v45 = 2114;
    v46 = v11;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting inline engagement.", buf, 0x16u);
  }
  id v12 = [v7 session];
  id v13 = [v12 delegate];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    AMSError(2, @"Finance Engagement Error", @"No delegate to present the engagement", 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v32 = +[AMSLogConfig sharedConfig];
    if (!v32)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    int v33 = [v32 OSLogObject];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v34 = objc_opt_class();
    v35 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v34;
    __int16 v45 = 2114;
    v46 = v35;
    __int16 v47 = 2114;
    id v48 = v14;
    id v36 = "%{public}@: [%{public}@] Failed to present engagement (no delegate). %{public}@";
    goto LABEL_21;
  }
  if (!v6)
  {
    AMSError(2, @"Finance Engagement Error", @"No URL for engagement", 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v32 = +[AMSLogConfig sharedConfig];
    if (!v32)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    int v33 = [v32 OSLogObject];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v37 = objc_opt_class();
    v35 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v37;
    __int16 v45 = 2114;
    v46 = v35;
    __int16 v47 = 2114;
    id v48 = v14;
    id v36 = "%{public}@: [%{public}@] Failed to present engagement (no URL). %{public}@";
    goto LABEL_21;
  }
  if ([a1 _isModernURL:v6 taskInfo:v7])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = [v7 task];
    __int16 v16 = [v15 originalRequest];
    int v17 = [v16 URL];
    uint64_t v18 = [v17 absoluteString];
    [v14 setObject:v18 forKeyedSubscript:@"url"];

    __int16 v19 = [v7 task];
    id v20 = [v19 originalRequest];
    uint64_t v21 = [a1 _bodyObjectFromRequest:v20];
    [v14 setObject:v21 forKeyedSubscript:@"body"];

    int v22 = objc_alloc_init(AMSEngagementRequest);
    uint64_t v23 = [v7 properties];
    __int16 v24 = [v23 account];
    [(AMSEngagementRequest *)v22 setAccount:v24];

    id v25 = AMSLogKey();
    [(AMSEngagementRequest *)v22 setLogKey:v25];

    [(AMSEngagementRequest *)v22 setFailOnDismiss:1];
    [(AMSEngagementRequest *)v22 setSilentlyCheckURL:1];
    v41[0] = @"inlineInterrupt";
    v41[1] = @"request";
    v42[0] = MEMORY[0x1E4F1CC38];
    v42[1] = v14;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
    [(AMSEngagementRequest *)v22 setClientData:v26];

    v27 = objc_msgSend(v6, "ams_URLByReplacingSchemeWithScheme:", @"https");
    [(AMSEngagementRequest *)v22 setURL:v27];

    v28 = objc_alloc_init(AMSPromise);
    v29 = [v7 session];
    v30 = [v7 task];
    uint64_t v31 = [(AMSPromise *)v28 completionHandlerAdapter];
    [v13 AMSURLSession:v29 task:v30 handleEngagementRequest:v22 completion:v31];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __62__AMSFinanceActionResponse__presentEngagementForURL_taskInfo___block_invoke;
    v40[3] = &__block_descriptor_40_e41_v24__0__AMSEngagementResult_8__NSError_16l;
    v40[4] = a1;
    [(AMSPromise *)v28 addFinishBlock:v40];

    goto LABEL_23;
  }
  AMSError(2, @"Finance Engagement Error", @"URL does not match patterns", 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v32 = +[AMSLogConfig sharedConfig];
  if (!v32)
  {
    v32 = +[AMSLogConfig sharedConfig];
  }
  int v33 = [v32 OSLogObject];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v38 = objc_opt_class();
    v35 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v38;
    __int16 v45 = 2114;
    v46 = v35;
    __int16 v47 = 2114;
    id v48 = v14;
    id v36 = "%{public}@: [%{public}@] Failed to present engagement (patterns). %{public}@";
LABEL_21:
    _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0x20u);
  }
LABEL_22:

  v28 = +[AMSPromise promiseWithError:v14];
LABEL_23:

  return v28;
}

void __62__AMSFinanceActionResponse__presentEngagementForURL_taskInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
      id v9 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@: [%{public}@] Engagement succeeded.";
      uint64_t v11 = v7;
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
      id v9 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v4;
      uint64_t v10 = "%{public}@: [%{public}@] Engagement failed. %{public}@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
      goto LABEL_10;
    }
  }
}

+ (BOOL)_stashTIDContinueHeadersForTaskInfo:(id)a3
{
  uint64_t v3 = [a3 task];
  id v4 = [v3 currentRequest];
  uint64_t v5 = +[AMSBiometrics resumptionHeadersFromRequest:v4];

  if (v5) {
    BOOL v6 = +[AMSKeychain stashResumptionHeaders:v5 error:0];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)_deepLinkForURL:(id)a3 taskInfo:(id)a4 gotoType:(int64_t)a5 isAccountURL:(BOOL)a6 tidContinue:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = v12;
  int v15 = v14;
  if (v8)
  {
    int v15 = [a1 _URLForCommerceUIFromURL:v14 taskInfo:v13 tidContinue:v7];
  }
  if (a5 == 3)
  {
    uint64_t v16 = &AMSUIURLScheme;
  }
  else
  {
    if (a5 != 2) {
      goto LABEL_8;
    }
    uint64_t v16 = ITMSUIURLScheme;
  }
  uint64_t v17 = objc_msgSend(v15, "ams_URLByReplacingSchemeWithScheme:", *v16);

  int v15 = (void *)v17;
LABEL_8:

  return v15;
}

+ (BOOL)_isModernURL:(id)a3 taskInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [AMSURLParser alloc];
  BOOL v8 = [v5 properties];
  id v9 = [v8 bag];
  uint64_t v10 = [(AMSURLParser *)v7 initWithBag:v9];

  uint64_t v11 = [(AMSURLParser *)v10 typeForURL:v6];

  id v21 = 0;
  id v12 = [v11 resultWithError:&v21];
  id v13 = v21;

  if (v13 || !v12)
  {
    int v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      int v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = [v5 properties];
      __int16 v19 = [v18 logUUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      id v25 = v19;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to parse URL. %{public}@", buf, 0x20u);
    }
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = [v12 integerValue] != 1;
  }

  return v14;
}

+ (id)_URLForCommerceUIFromURL:(id)a3 taskInfo:(id)a4 tidContinue:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 setObject:@"account" forKeyedSubscript:@"action"];
  uint64_t v11 = [v8 properties];
  id v12 = [v11 account];
  id v13 = [v12 accountType];
  BOOL v14 = [v13 identifier];
  [v10 setObject:v14 forKeyedSubscript:@"accountType"];

  int v15 = [v8 properties];
  uint64_t v16 = [v15 account];
  uint64_t v17 = objc_msgSend(v16, "ams_DSID");
  uint64_t v18 = [v17 stringValue];
  [v10 setObject:v18 forKeyedSubscript:@"dsid"];

  __int16 v19 = [v8 properties];

  id v20 = [v19 account];
  id v21 = [v20 username];
  [v10 setObject:v21 forKeyedSubscript:@"username"];

  if (v5) {
    [v10 setObject:@"1" forKeyedSubscript:@"signatureResumption"];
  }
  int v22 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
  uint64_t v23 = objc_msgSend(v22, "ams_URLByReplaceingQueryParameters:", v10);

  __int16 v24 = [v9 absoluteString];

  id v25 = objc_msgSend(v23, "ams_URLByAppendingQueryParameter:name:", v24, @"url");

  return v25;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)creditString
{
  return self->_creditString;
}

- (void)setCreditString:(id)a3
{
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (BOOL)tidContinue
{
  return self->_tidContinue;
}

- (void)setTidContinue:(BOOL)a3
{
  self->_tidContinue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_creditString, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end