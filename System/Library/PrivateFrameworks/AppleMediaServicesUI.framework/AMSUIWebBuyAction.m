@interface AMSUIWebBuyAction
- (ACAccount)account;
- (AMSUIWebBuyAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)legacyBuy;
- (BOOL)makeCurrentAccount;
- (BOOL)requiresAccount;
- (BOOL)sendBlindedData;
- (NSDictionary)metricsOverlay;
- (NSDictionary)performanceMetricsOverlay;
- (NSString)buyParams;
- (NSString)contentType;
- (id)_iTunesAccount;
- (id)_purchasePluginIdentifierForContentType:(id)a3;
- (id)_runBuy;
- (id)_runBuyWithContentType:(id)a3;
- (id)_runLegacyBuy;
- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5;
- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5;
- (id)purchaseContentWithType:(id)a3;
- (id)runAction;
- (int64_t)type;
- (void)_makeCurrentAccountIfNeeded:(id)a3;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5;
- (void)setAccount:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setContentType:(id)a3;
- (void)setLegacyBuy:(BOOL)a3;
- (void)setMakeCurrentAccount:(BOOL)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setPerformanceMetricsOverlay:(id)a3;
- (void)setRequiresAccount:(BOOL)a3;
- (void)setSendBlindedData:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AMSUIWebBuyAction

- (AMSUIWebBuyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AMSUIWebBuyAction;
  v7 = [(AMSUIWebAction *)&v38 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"type"];
    if (objc_opt_respondsToSelector()) {
      v7->_type = [v8 integerValue];
    }
    v9 = [v6 objectForKeyedSubscript:@"legacyBuy"];
    if (objc_opt_respondsToSelector())
    {
      v10 = [v6 objectForKeyedSubscript:@"legacyBuy"];
      v7->_legacyBuy = [v10 BOOLValue];
    }
    else
    {
      v7->_legacyBuy = 0;
    }

    v11 = [v6 objectForKeyedSubscript:@"buyParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    buyParams = v7->_buyParams;
    v7->_buyParams = v12;

    v14 = [v6 objectForKeyedSubscript:@"contentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    contentType = v7->_contentType;
    v7->_contentType = v15;

    v17 = [v6 objectForKeyedSubscript:@"requiresAccount"];
    if (objc_opt_respondsToSelector()) {
      char v18 = [v17 BOOLValue];
    }
    else {
      char v18 = 1;
    }
    v7->_requiresAccount = v18;
    v19 = [v6 objectForKeyedSubscript:@"metricsOverlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }

    metricsOverlay = v7->_metricsOverlay;
    v7->_metricsOverlay = v20;

    v22 = [v6 objectForKeyedSubscript:@"performanceMetricsOverlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }

    performanceMetricsOverlay = v7->_performanceMetricsOverlay;
    v7->_performanceMetricsOverlay = v23;

    v25 = [v6 objectForKeyedSubscript:@"makeCurrentAccount"];
    if (objc_opt_respondsToSelector())
    {
      v26 = [v6 objectForKeyedSubscript:@"makeCurrentAccount"];
      v7->_makeCurrentAccount = [v26 BOOLValue];
    }
    else
    {
      v7->_makeCurrentAccount = 0;
    }

    v27 = [v6 objectForKeyedSubscript:@"sendBlindedData"];
    if (objc_opt_respondsToSelector())
    {
      v28 = [v6 objectForKeyedSubscript:@"sendBlindedData"];
      v7->_sendBlindedData = [v28 BOOLValue];
    }
    else
    {
      v7->_sendBlindedData = 0;
    }

    v29 = [(AMSUIWebAction *)v7 context];
    v30 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v31 = [v29 iTunesAccountFromJSAccount:v30];
    account = v7->_account;
    v7->_account = (ACAccount *)v31;

    if (!v7->_account)
    {
      v33 = [(AMSUIWebAction *)v7 context];
      v34 = [v6 objectForKeyedSubscript:@"dsid"];
      uint64_t v35 = [v33 iTunesAccountFromJSDSID:v34];
      v36 = v7->_account;
      v7->_account = (ACAccount *)v35;
    }
  }

  return v7;
}

- (id)runAction
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebBuyAction;
  id v3 = [(AMSUIWebAction *)&v17 runAction];
  v4 = [(AMSUIWebBuyAction *)self buyParams];
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    v9 = [(AMSUIWebBuyAction *)self account];
    v10 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v10;
    __int16 v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running purchase with account: %{public}@ buyParameters: %@", buf, 0x2Au);
  }
  if (v4)
  {
    if (![(AMSUIWebBuyAction *)self legacyBuy]
      || ([(AMSUIWebBuyAction *)self _runLegacyBuy],
          (v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12 = [(AMSUIWebBuyAction *)self contentType];
      if (v12) {
        [(AMSUIWebBuyAction *)self _runBuyWithContentType:v12];
      }
      else {
      v11 = [(AMSUIWebBuyAction *)self _runBuy];
      }
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __30__AMSUIWebBuyAction_runAction__block_invoke;
    v16[3] = &unk_2643E39E0;
    v16[4] = self;
    [v11 addFinishBlock:v16];
  }
  else
  {
    v13 = (void *)MEMORY[0x263F27E10];
    v14 = AMSError();
    v11 = [v13 promiseWithError:v14];
  }
  return v11;
}

void __30__AMSUIWebBuyAction_runAction__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    int v12 = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished purchase", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) context];
  int v7 = [v6 signatureResumption];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) context];
    v9 = [v8 additionalHeaders];
    v10 = (void *)[v9 mutableCopy];

    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278E8]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278C0]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278C8]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278D8]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278D0]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F278E0]];
    v11 = [*(id *)(a1 + 32) context];
    [v11 setAdditionalHeaders:v10];
  }
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(AMSUIWebAction *)self context];
  v10 = [v9 actionDelegate];
  v11 = [v10 action:self pauseTimeouts:1 handleAuthenticateRequest:v8];

  [v11 addFinishBlock:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__AMSUIWebBuyAction_purchase_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_2643E4920;
  v12[4] = self;
  [v11 addSuccessBlock:v12];
}

void __67__AMSUIWebBuyAction_purchase_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 account];
  [v2 _makeCurrentAccountIfNeeded:v3];
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(AMSUIWebAction *)self context];
  v10 = [v9 actionDelegate];
  id v11 = [v10 action:self pauseTimeouts:1 handleDialogRequest:v8];

  [v11 addFinishBlock:v7];
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__AMSUIWebBuyAction_purchase_handleEngagementRequest_completion___block_invoke;
  block[3] = &unk_2643E4948;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__AMSUIWebBuyAction_purchase_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  v2 = [AMSUIEngagementTask alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) context];
  v5 = [v4 bag];
  id v6 = [*(id *)(a1 + 40) context];
  id v7 = [v6 flowController];
  id v8 = [v7 currentContainer];
  id v10 = [(AMSUIEngagementTask *)v2 initWithRequest:v3 bag:v5 presentingViewController:v8];

  id v9 = [(AMSUIEngagementTask *)v10 presentEngagement];
  [v9 addFinishBlock:*(void *)(a1 + 48)];
}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v6 = [(AMSUIWebAction *)self context];
  id v7 = [v6 flowController];
  id v8 = [v7 currentContainer];
  id v9 = [v8 view];
  id v10 = [v9 window];

  if (a5 && !v10)
  {
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  uint64_t v6 = [(AMSUIWebAction *)self presentingSceneIdentifier];
  id v7 = (void *)v6;
  if (a5 && !v6)
  {
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void *, void))a5;
  id v8 = [(AMSUIWebAction *)self context];
  id v9 = [v8 clientInfo];
  id v10 = [v9 proxyAppBundleID];

  if (v10)
  {
    id v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    uint64_t v13 = AMSLogKey();
    id v14 = NSString;
    uint64_t v15 = objc_opt_class();
    v29 = a2;
    if (v13) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v8 = [(AMSUIWebAction *)self context];
  uint64_t v16 = [v8 clientInfo];
  id v10 = [v16 bundleIdentifier];

  if (!v10) {
    goto LABEL_18;
  }
  id v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v11)
  {
    id v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = AMSLogKey();
    id v14 = NSString;
    uint64_t v15 = objc_opt_class();
    v29 = a2;
    if (v13)
    {
LABEL_12:
      objc_super v17 = AMSLogKey();
      uint64_t v28 = NSStringFromSelector(a2);
      [v14 stringWithFormat:@"%@: [%@] %@ ", v15, v17, v28];
      char v18 = LABEL_14:;
      id v8 = AMSHashIfNeeded();
      uint64_t v19 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      v33 = v8;
      __int16 v34 = 2114;
      uint64_t v35 = v19;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found scene identifier %{public}@ in %{public}@", buf, 0x20u);
      if (v13)
      {

        char v18 = (void *)v28;
      }

      a2 = v29;
      goto LABEL_17;
    }
LABEL_13:
    objc_super v17 = NSStringFromSelector(a2);
    [v14 stringWithFormat:@"%@: %@ ", v15, v17];
    goto LABEL_14;
  }
LABEL_17:

LABEL_18:
  __int16 v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v20)
  {
    __int16 v20 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = AMSLogKey();
    v23 = NSString;
    uint64_t v24 = objc_opt_class();
    if (v22)
    {
      v25 = AMSLogKey();
      id v8 = NSStringFromSelector(a2);
      [v23 stringWithFormat:@"%@: [%@] %@ ", v24, v25, v8];
    }
    else
    {
      v25 = NSStringFromSelector(a2);
      [v23 stringWithFormat:@"%@: %@ ", v24, v25];
    uint64_t v26 = };
    v27 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v26;
    __int16 v32 = 2114;
    v33 = v27;
    _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Using bundle identifier: %{public}@", buf, 0x16u);
    if (v22)
    {

      uint64_t v26 = v8;
    }
  }
  v7[2](v7, v10, 0);
}

- (id)_iTunesAccount
{
  uint64_t v3 = [(AMSUIWebBuyAction *)self account];
  if ((objc_msgSend(v3, "ams_isiTunesAccount") & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFB210];
    v5 = [(AMSUIWebAction *)self context];
    uint64_t v6 = [v5 clientInfo];
    id v7 = [v6 accountMediaType];
    id v8 = objc_msgSend(v4, "ams_sharedAccountStoreForMediaType:", v7);

    uint64_t v9 = objc_msgSend(v8, "ams_iTunesAccountForAccount:", v3);
    id v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = v3;
    }
    id v12 = v11;

    uint64_t v3 = v12;
  }
  return v3;
}

- (void)_makeCurrentAccountIfNeeded:(id)a3
{
  id v10 = a3;
  if ([(AMSUIWebBuyAction *)self makeCurrentAccount]
    || ([(AMSUIWebAction *)self context],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 account],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v10, "web_matchAccount:", v5),
        v5,
        v4,
        v6))
  {
    id v7 = [(AMSUIWebAction *)self context];
    id v8 = [(AMSUIWebAction *)self context];
    uint64_t v9 = [v8 clientInfo];
    [v7 replaceCurrentAccount:v10 clientInfo:v9];
  }
}

- (id)purchaseContentWithType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
  if ([v4 isEqualToString:AMSUIWebPluginPurchaseContentTypeApp])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    int v6 = (void *)getASDPurchaseClass_softClass;
    uint64_t v32 = getASDPurchaseClass_softClass;
    if (!getASDPurchaseClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getASDPurchaseClass_block_invoke;
      v27 = &unk_2643E33D8;
      uint64_t v28 = &v29;
      __getASDPurchaseClass_block_invoke((uint64_t)&v24);
      int v6 = (void *)v30[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v29, 8);
    id v8 = objc_alloc_init(v7);
    id v9 = objc_alloc(MEMORY[0x263F27B80]);
    id v10 = [(AMSUIWebBuyAction *)self buyParams];
    id v11 = (void *)[v9 initWithString:v10];

    id v12 = [(AMSUIWebBuyAction *)self account];
    uint64_t v13 = objc_msgSend(v12, "ams_DSID");
    [v8 setAccountIdentifier:v13];

    id v14 = [v11 stringValue];
    [v8 setBuyParameters:v14];

    uint64_t v15 = NSNumber;
    uint64_t v16 = [v11 parameterForKey:*MEMORY[0x263F27828]];
    objc_super v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
    [v8 setItemID:v17];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    char v18 = (void *)getASDPurchaseManagerClass_softClass;
    uint64_t v32 = getASDPurchaseManagerClass_softClass;
    if (!getASDPurchaseManagerClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getASDPurchaseManagerClass_block_invoke;
      v27 = &unk_2643E33D8;
      uint64_t v28 = &v29;
      __getASDPurchaseManagerClass_block_invoke((uint64_t)&v24);
      char v18 = (void *)v30[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v29, 8);
    __int16 v20 = [v19 sharedManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __45__AMSUIWebBuyAction_purchaseContentWithType___block_invoke;
    v22[3] = &unk_2643E4970;
    id v23 = v5;
    [v20 processPurchase:v8 withResponseHandler:v22];
  }
  else
  {
    AMSError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v5 finishWithError:v8];
  }

  return v5;
}

void __45__AMSUIWebBuyAction_purchaseContentWithType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 items];
  int v6 = [v5 firstObject];

  if (v8)
  {
    id v7 = v8;
LABEL_4:
    [*(id *)(a1 + 32) finishWithError:v7];

    goto LABEL_5;
  }
  id v7 = [v6 error];
  if (v7) {
    goto LABEL_4;
  }
  if (([v6 success] & 1) == 0)
  {
    AMSError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_4;
    }
  }
  [*(id *)(a1 + 32) finishWithResult:&unk_26CC73998];
LABEL_5:
}

- (id)_purchasePluginIdentifierForContentType:(id)a3
{
  return 0;
}

- (id)_runBuy
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F27B80]);
  id v4 = [(AMSUIWebBuyAction *)self buyParams];
  id v5 = (void *)[v3 initWithString:v4];

  int v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    int v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v50 = v8;
    __int16 v51 = 2114;
    v52 = v9;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting buy", buf, 0x16u);
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F27E28]), "initWithPurchaseType:buyParams:", -[AMSUIWebBuyAction type](self, "type"), v5);
  id v11 = [(AMSUIWebBuyAction *)self _iTunesAccount];
  [v10 setAccount:v11];

  [v10 setUserInitiated:1];
  id v12 = [(AMSUIWebAction *)self context];
  uint64_t v13 = [v12 clientInfo];
  [v10 setClientInfo:v13];

  objc_msgSend(v10, "setRequiresAccount:", -[AMSUIWebBuyAction requiresAccount](self, "requiresAccount"));
  id v14 = [(AMSUIWebAction *)self context];
  uint64_t v15 = [v14 additionalHeaders];
  [v10 setAdditionalHeaders:v15];

  objc_msgSend(v10, "setSendBlindedData:", -[AMSUIWebBuyAction sendBlindedData](self, "sendBlindedData"));
  uint64_t v16 = AMSLogKey();
  [v10 setLogUUID:v16];

  objc_super v17 = [(AMSUIWebBuyAction *)self metricsOverlay];
  char v18 = (void *)[v17 mutableCopy];
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v21 = v20;

  __int16 v22 = [(AMSUIWebAction *)self context];
  id v23 = [v22 metricsOverlay];

  if (v23)
  {
    uint64_t v24 = [(AMSUIWebAction *)self context];
    uint64_t v25 = [v24 metricsOverlay];
    [v21 addEntriesFromDictionary:v25];
  }
  [v10 setMetricsOverlay:v21];
  uint64_t v26 = [(AMSUIWebBuyAction *)self performanceMetricsOverlay];
  v27 = (void *)[v26 mutableCopy];
  uint64_t v28 = v27;
  if (v27) {
    id v29 = v27;
  }
  else {
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v30 = v29;

  uint64_t v31 = [(AMSUIWebAction *)self context];
  uint64_t v32 = [v31 performanceMetricsOverlay];

  if (v32)
  {
    v33 = [(AMSUIWebAction *)self context];
    __int16 v34 = [v33 performanceMetricsOverlay];
    [v30 addEntriesFromDictionary:v34];
  }
  [v10 setPerformanceMetricsOverlay:v30];
  uint64_t v35 = [AMSUIPurchaseTask alloc];
  uint64_t v36 = [(AMSUIWebAction *)self context];
  v37 = [v36 bag];
  objc_super v38 = [(AMSPurchaseTask *)v35 initWithPurchase:v10 bag:v37];

  [(AMSPurchaseTask *)v38 setDelegate:self];
  v39 = [(AMSPurchaseTask *)v38 performPurchase];
  objc_initWeak((id *)buf, self);
  uint64_t v43 = MEMORY[0x263EF8330];
  uint64_t v44 = 3221225472;
  v45 = __28__AMSUIWebBuyAction__runBuy__block_invoke;
  v46 = &unk_2643E4998;
  objc_copyWeak(&v48, (id *)buf);
  id v40 = v10;
  id v47 = v40;
  [v39 addFinishBlock:&v43];
  v41 = objc_msgSend(v39, "thenWithBlock:", &__block_literal_global_18, v43, v44, v45, v46);

  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);

  return v41;
}

void __28__AMSUIWebBuyAction__runBuy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = @"purchase";
  v15[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v11 = objc_msgSend(v6, "ams_errorByAddingUserInfo:", v10);

  id v12 = [WeakRetained context];
  uint64_t v13 = [v12 actionDelegate];
  [v13 actionDidFinishPurchaseWithResult:v7 error:v11];
}

id __28__AMSUIWebBuyAction__runBuy__block_invoke_2(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08A00];
  id v3 = a2;
  id v4 = [v2 defaultCenter];
  [v4 postNotificationName:@"AMSPurchaseFinishedNotification" object:0];

  v12[0] = @"success";
  v12[1] = @"responseData";
  v13[0] = @"true";
  id v5 = [v3 responseDictionary];

  uint64_t v6 = objc_msgSend(v5, "ams_sanitizeServerObject");
  id v7 = (void *)v6;
  uint64_t v8 = &stru_26CC491D8;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  v13[1] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v10 = [MEMORY[0x263F27E10] promiseWithResult:v9];

  return v10;
}

- (id)_runBuyWithContentType:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AMSLogKey();
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = objc_opt_class();
    __int16 v28 = 2114;
    id v29 = v5;
    __int16 v30 = 2114;
    id v31 = v4;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchasing content with type: %{public}@", buf, 0x20u);
  }

  uint64_t v8 = [(AMSUIWebBuyAction *)self _purchasePluginIdentifierForContentType:v4];
  if (!v8)
  {
    objc_super v17 = [(AMSUIWebBuyAction *)self purchaseContentWithType:v4];
    goto LABEL_18;
  }
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v11;
    __int16 v28 = 2114;
    id v29 = v5;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading plugin: %{public}@", buf, 0x20u);
  }

  id v12 = [(AMSUIWebAction *)self context];
  uint64_t v13 = [v12 pluginLoader];
  id v14 = [v13 pluginForBundleIdentifier:v8];

  if (!v14)
  {
    char v18 = (void *)MEMORY[0x263F27E10];
LABEL_16:
    uint64_t v15 = AMSError();
    uint64_t v16 = [v18 promiseWithError:v15];
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v18 = (void *)MEMORY[0x263F27E10];
    goto LABEL_16;
  }
  uint64_t v15 = [(AMSUIWebBuyAction *)self buyParams];
  uint64_t v16 = [v14 purchaseContentWithType:v4 buyParams:v15];
LABEL_17:
  objc_super v17 = (void *)v16;

LABEL_18:
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke;
  v24[3] = &unk_2643E49E0;
  v24[4] = self;
  id v19 = v5;
  id v25 = v19;
  [v17 addSuccessBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke_118;
  v22[3] = &unk_2643E37F8;
  void v22[4] = self;
  id v23 = v19;
  id v20 = v19;
  [v17 addErrorBlock:v22];

  return v17;
}

void __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchase finished", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"AMSPurchaseFinishedNotification" object:0];
}

void __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Purchase failed: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_runLegacyBuy
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIWebAction *)self presentingSceneIdentifierPromise];
  uint64_t v4 = [(AMSUIWebAction *)self presentingSceneBundleIdentifierPromise];
  uint64_t v5 = (void *)MEMORY[0x263F27E10];
  v11[0] = v3;
  v11[1] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  uint64_t v7 = [v5 promiseWithAll:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke;
  v10[3] = &unk_2643E4A58;
  v10[4] = self;
  int v8 = [v7 thenWithBlock:v10];

  return v8;
}

id __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke(uint64_t a1, void *a2)
{
  v60[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = AMSLogKey();
    uint64_t v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v2 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    __int16 v12 = };
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy buy", (uint8_t *)&buf, 0xCu);
    if (v8)
    {

      __int16 v12 = (void *)v2;
    }
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  id v13 = (void *)getSSPurchaseClass_softClass;
  uint64_t v54 = getSSPurchaseClass_softClass;
  if (!getSSPurchaseClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v56 = (uint64_t)__getSSPurchaseClass_block_invoke;
    v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_2643E33D8;
    v58 = (void (*)(uint64_t))&v51;
    __getSSPurchaseClass_block_invoke((uint64_t)&buf);
    id v13 = (void *)v52[3];
  }
  uint64_t v14 = v13;
  _Block_object_dispose(&v51, 8);
  id v15 = objc_alloc_init(v14);
  uint64_t v16 = [*(id *)(a1 + 32) buyParams];
  [v15 setBuyParameters:v16];

  objc_super v17 = [*(id *)(a1 + 32) account];
  char v18 = objc_msgSend(v17, "ams_DSID");
  [v15 setAccountIdentifier:v18];

  id v19 = [v4 objectAtIndexedSubscript:0];
  id v20 = [v19 value];
  [v15 setPresentingSceneIdentifier:v20];

  v21 = [v4 objectAtIndexedSubscript:1];
  __int16 v22 = [v21 value];
  [v15 setPresentingSceneBundleIdentifier:v22];

  id v23 = [*(id *)(a1 + 32) context];
  uint64_t v24 = [v23 additionalHeaders];
  [v15 setTidHeaders:v24];

  id v25 = [*(id *)(a1 + 32) account];
  LODWORD(v24) = objc_msgSend(v25, "ams_isSandboxAccount");

  if (v24)
  {
    uint64_t v26 = [v15 requestProperties];
    uint64_t v27 = (void *)[v26 mutableCopy];
    __int16 v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2050000000;
      __int16 v30 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
      uint64_t v54 = getSSMutableURLRequestPropertiesClass_softClass;
      if (!getSSMutableURLRequestPropertiesClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v56 = (uint64_t)__getSSMutableURLRequestPropertiesClass_block_invoke;
        v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_2643E33D8;
        v58 = (void (*)(uint64_t))&v51;
        __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&buf);
        __int16 v30 = (void *)v52[3];
      }
      id v31 = v30;
      _Block_object_dispose(&v51, 8);
      id v29 = objc_alloc_init(v31);
    }
    uint64_t v32 = v29;

    [v32 setURLBagType:1];
    [v15 setRequestProperties:v32];
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  v33 = (void *)getSSPurchaseRequestClass_softClass;
  uint64_t v54 = getSSPurchaseRequestClass_softClass;
  if (!getSSPurchaseRequestClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v56 = (uint64_t)__getSSPurchaseRequestClass_block_invoke;
    v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_2643E33D8;
    v58 = (void (*)(uint64_t))&v51;
    __getSSPurchaseRequestClass_block_invoke((uint64_t)&buf);
    v33 = (void *)v52[3];
  }
  __int16 v34 = v33;
  _Block_object_dispose(&v51, 8);
  id v35 = [v34 alloc];
  v60[0] = v15;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
  v37 = (void *)[v35 initWithPurchases:v36];

  [v37 setBackgroundRequest:0];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__4;
  v58 = __Block_byref_object_dispose__4;
  id v59 = 0;
  objc_super v38 = AMSLogKey();
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_127;
  v50[3] = &unk_2643E4A08;
  v50[4] = &buf;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_2;
  v45[3] = &unk_2643E4A30;
  id v39 = v38;
  p_long long buf = &buf;
  uint64_t v40 = *(void *)(a1 + 32);
  id v46 = v39;
  uint64_t v47 = v40;
  id v41 = v5;
  id v48 = v41;
  [v37 startWithPurchaseResponseBlock:v50 completionBlock:v45];
  v42 = v48;
  id v43 = v41;

  _Block_object_dispose(&buf, 8);
  return v43;
}

void __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_127(uint64_t a1, void *a2)
{
}

void __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id)AMSSetLogKey();
  if (v3
    || ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error],
        (id v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"SSErrorDomain"])
    {
      uint64_t v6 = [v3 code];

      if (v6 != 134)
      {
LABEL_7:
        uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v7)
        {
          uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        int v8 = [v7 OSLogObject];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = objc_opt_class();
          uint64_t v10 = *(void **)(a1 + 32);
          *(_DWORD *)long long buf = 138543874;
          uint64_t v42 = v9;
          __int16 v43 = 2114;
          uint64_t v44 = v10;
          __int16 v45 = 2114;
          id v46 = v3;
          _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy purchase failed: %{public}@", buf, 0x20u);
        }

        [*(id *)(a1 + 48) finishWithError:v3];
        goto LABEL_12;
      }
      AMSError();
      id v5 = v3;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_7;
  }
  uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  __int16 v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v42 = v13;
    __int16 v43 = 2114;
    uint64_t v44 = v14;
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Legacy buy finished successfully", buf, 0x16u);
  }

  id v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) URLResponse];
  id v3 = [v15 bodyData];

  if (v3)
  {
    id v38 = 0;
    uint64_t v16 = [MEMORY[0x263F27BD8] objectWithData:v3 encoding:0 error:&v38];
    id v17 = v38;
    id v18 = v16;
    objc_opt_class();
    id v19 = 0;
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }

    if (!v19 || v17)
    {
      id v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v20)
      {
        id v20 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class();
        id v23 = AMSLogKey();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v42 = v22;
        __int16 v43 = 2114;
        uint64_t v44 = v23;
        __int16 v45 = 2114;
        id v46 = v17;
        _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode server response. %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) purchase];
  id v25 = [v24 accountIdentifier];

  if (v25)
  {
    uint64_t v26 = (void *)MEMORY[0x263EFB210];
    uint64_t v27 = [*(id *)(a1 + 40) context];
    __int16 v28 = [v27 clientInfo];
    id v29 = [v28 accountMediaType];
    __int16 v30 = objc_msgSend(v26, "ams_sharedAccountStoreForMediaType:", v29);

    id v31 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) purchase];
    uint64_t v32 = [v31 accountIdentifier];
    v33 = objc_msgSend(v30, "ams_iTunesAccountWithDSID:", v32);

    [*(id *)(a1 + 40) _makeCurrentAccountIfNeeded:v33];
  }
  v39[0] = @"success";
  v39[1] = @"responseData";
  v40[0] = @"true";
  uint64_t v34 = objc_msgSend(v19, "ams_sanitizeServerObject");
  id v35 = (void *)v34;
  uint64_t v36 = &stru_26CC491D8;
  if (v34) {
    uint64_t v36 = (__CFString *)v34;
  }
  v40[1] = v36;
  v37 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  [*(id *)(a1 + 48) finishWithResult:v37];
LABEL_12:
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (BOOL)legacyBuy
{
  return self->_legacyBuy;
}

- (void)setLegacyBuy:(BOOL)a3
{
  self->_legacyBuy = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (BOOL)makeCurrentAccount
{
  return self->_makeCurrentAccount;
}

- (void)setMakeCurrentAccount:(BOOL)a3
{
  self->_makeCurrentAccount = a3;
}

- (BOOL)requiresAccount
{
  return self->_requiresAccount;
}

- (void)setRequiresAccount:(BOOL)a3
{
  self->_requiresAccount = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSDictionary)performanceMetricsOverlay
{
  return self->_performanceMetricsOverlay;
}

- (void)setPerformanceMetricsOverlay:(id)a3
{
}

- (BOOL)sendBlindedData
{
  return self->_sendBlindedData;
}

- (void)setSendBlindedData:(BOOL)a3
{
  self->_sendBlindedData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end