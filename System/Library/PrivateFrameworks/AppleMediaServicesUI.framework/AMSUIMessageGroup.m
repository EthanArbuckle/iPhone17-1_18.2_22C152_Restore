@interface AMSUIMessageGroup
- (AMSBagProtocol)bag;
- (AMSUIMessageGroup)init;
- (AMSUIMessageGroup)initWithBag:(id)a3;
- (AMSUIMessageGroupDelegate)delegate;
- (NSDictionary)clientData;
- (NSDictionary)clientMetricsOverlay;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (id)_dictionaryForParamObject:(id)a3 error:(id *)a4;
- (id)_viewControllerForServiceType:(id)a3 placement:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 params:(id)a7 account:(id)a8 sidepack:(id)a9 metrics:(id)a10;
- (id)_viewControllerForURL:(id)a3 account:(id)a4 sidepack:(id)a5 metrics:(id)a6;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)setBag:(id)a3;
- (void)setClientData:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientMetricsOverlay:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
@end

@implementation AMSUIMessageGroup

- (void)setClientMetricsOverlay:(id)a3
{
}

- (AMSUIMessageGroup)initWithBag:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIMessageGroup;
  v6 = [(IAMMessageGroup *)&v12 initWithGroupIdentifier:@"com.apple.ams"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    clientData = v7->_clientData;
    v9 = (NSDictionary *)MEMORY[0x263EFFA78];
    v7->_clientData = (NSDictionary *)MEMORY[0x263EFFA78];

    clientMetricsOverlay = v7->_clientMetricsOverlay;
    v7->_clientMetricsOverlay = v9;
  }
  return v7;
}

- (AMSUIMessageGroup)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIMessageGroup;
  v2 = [(IAMMessageGroup *)&v12 initWithGroupIdentifier:@"com.apple.ams"];
  if (v2)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v3)
    {
      v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Incorrect initializer used. This will fetch a bag", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F27B28] bagForProfile:@"AppStore" profileVersion:@"1"];
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v6;

    clientData = v2->_clientData;
    v9 = (NSDictionary *)MEMORY[0x263EFFA78];
    v2->_clientData = (NSDictionary *)MEMORY[0x263EFFA78];

    clientMetricsOverlay = v2->_clientMetricsOverlay;
    v2->_clientMetricsOverlay = v9;
  }
  return v2;
}

- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v70 = a4;
  uint64_t v5 = [a3 contentPages];
  uint64_t v6 = [v5 firstObject];
  v7 = [v6 contentParameters];

  v8 = [v7 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    uint64_t v10 = [NSURL URLWithString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v75 = (void *)v10;
  v11 = [v7 objectForKeyedSubscript:@"clientIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(AMSUIMessageGroup *)self clientIdentifier];
  }
  id v72 = v13;

  uint64_t v14 = [v7 objectForKeyedSubscript:@"clientVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [(AMSUIMessageGroup *)self clientVersion];
  }
  id v17 = v16;

  v18 = [v7 objectForKeyedSubscript:@"placement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v76 = v18;
  }
  else {
    id v76 = 0;
  }

  v19 = [v7 objectForKeyedSubscript:@"serviceType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }
  id v71 = v20;

  v21 = [v7 objectForKeyedSubscript:@"params"];
  id v83 = 0;
  uint64_t v22 = [(AMSUIMessageGroup *)self _dictionaryForParamObject:v21 error:&v83];
  id v23 = v83;

  v74 = v23;
  if (v23)
  {
    v24 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v24)
    {
      v24 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_opt_class();
      [v7 objectForKeyedSubscript:@"params"];
      v28 = uint64_t v27 = v22;
      *(_DWORD *)buf = 138543874;
      uint64_t v85 = v26;
      __int16 v86 = 2114;
      id v87 = v74;
      __int16 v88 = 2112;
      v89 = v28;
      _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing MI params data. %{public}@ %@", buf, 0x20u);

      uint64_t v22 = v27;
    }
  }
  v69 = v9;
  v66 = (void *)v22;
  v29 = [v7 objectForKeyedSubscript:@"sidepack"];
  id v82 = 0;
  v30 = [(AMSUIMessageGroup *)self _dictionaryForParamObject:v29 error:&v82];
  id v31 = v82;

  v73 = v31;
  if (v31)
  {
    v32 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v32)
    {
      v32 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class();
      [v7 objectForKeyedSubscript:@"sidepack"];
      v35 = v30;
      v37 = id v36 = v17;
      *(_DWORD *)buf = 138543874;
      uint64_t v85 = v34;
      __int16 v86 = 2114;
      id v87 = v73;
      __int16 v88 = 2112;
      v89 = v37;
      _os_log_impl(&dword_21C134000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing sidepack data. %{public}@ %@", buf, 0x20u);

      id v17 = v36;
      v30 = v35;
    }
  }
  v38 = [v7 objectForKeyedSubscript:@"metrics"];
  id v81 = 0;
  v39 = [(AMSUIMessageGroup *)self _dictionaryForParamObject:v38 error:&v81];
  id v40 = v81;

  if (v40)
  {
    v41 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v41)
    {
      v41 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v42 = [v41 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = v39;
      v44 = v30;
      id v45 = v17;
      uint64_t v46 = objc_opt_class();
      v47 = [v7 objectForKeyedSubscript:@"metrics"];
      *(_DWORD *)buf = 138543874;
      uint64_t v85 = v46;
      id v17 = v45;
      v30 = v44;
      v39 = v43;
      __int16 v86 = 2114;
      id v87 = v40;
      __int16 v88 = 2112;
      v89 = v47;
      _os_log_impl(&dword_21C134000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing metrics overlay. %{public}@ %@", buf, 0x20u);
    }
  }
  v48 = [(AMSUIMessageGroup *)self clientMetricsOverlay];

  if (v48)
  {
    if (v39) {
      v49 = v39;
    }
    else {
      v49 = (void *)MEMORY[0x263EFFA78];
    }
    v50 = [(AMSUIMessageGroup *)self clientMetricsOverlay];
    uint64_t v51 = objc_msgSend(v49, "ams_dictionaryByAddingEntriesFromDictionary:", v50);

    v39 = (void *)v51;
  }
  v52 = [v7 objectForKeyedSubscript:@"account"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v53 = v52;
  }
  else {
    id v53 = 0;
  }
  v54 = v71;

  if ([v53 isEqualToString:@"activeiTunes"])
  {
    v55 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    v56 = objc_msgSend(v55, "ams_activeiTunesAccount");
  }
  else
  {
    v56 = 0;
  }
  v57 = v72;
  v67 = v53;
  v68 = v40;
  if (v71 && v76 && v72 && v17)
  {
    v58 = v66;
    [(AMSUIMessageGroup *)self _viewControllerForServiceType:v71 placement:v76 clientIdentifier:v72 clientVersion:v17 params:v66 account:v56 sidepack:v30 metrics:v39];
    v60 = v59 = v17;
  }
  else
  {
    v59 = v17;
    if (v75)
    {
      v60 = [(AMSUIMessageGroup *)self _viewControllerForURL:v75 account:v56 sidepack:v30 metrics:v39];
    }
    else
    {
      v61 = (void *)MEMORY[0x263F27E10];
      v62 = AMSError();
      v63 = v61;
      v57 = v72;
      v60 = [v63 promiseWithError:v62];

      v54 = v71;
    }
    v58 = v66;
  }
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke;
  v78[3] = &unk_2643E3EB8;
  v78[4] = self;
  id v79 = v7;
  id v80 = v70;
  id v64 = v70;
  id v65 = v7;
  [v60 addFinishBlock:v78];
}

void __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke_2;
  block[3] = &unk_2643E3E90;
  id v11 = v6;
  id v12 = v5;
  v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfigOversize];
    if (!v2)
    {
      v2 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 56);
      int v9 = 138543874;
      uint64_t v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load view controller. %{public}@ \nparams: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    if ([MEMORY[0x263F27BF8] deviceIsiPad]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = -2;
    }
    [*(id *)(a1 + 40) setModalPresentationStyle:v7];
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v2)
    {
      v2 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully loaded view controller", (uint8_t *)&v9, 0xCu);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [(AMSUIMessageGroup *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending web purchase completion", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v12 = [(AMSUIMessageGroup *)self delegate];
    [v12 messageGroup:self didFinishPurchaseWithResult:v7 error:v8];
  }
  else
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v16 = [v12 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping web purchase completion callback", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [(AMSUIMessageGroup *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dynamic purchase completion", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v12 = [(AMSUIMessageGroup *)self delegate];
    [v12 messageGroup:self didFinishPurchaseWithResult:v7 error:v8];
  }
  else
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v16 = [v12 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dynamic purchase completion callback", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [(AMSUIMessageGroup *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dynamic carrier linking completion", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v12 = [(AMSUIMessageGroup *)self delegate];
    [v12 messageGroup:self didFinishCarrierLinkingWithResult:v7 error:v8];
  }
  else
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v16 = [v12 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dynamic carrier linking completion callback", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (id)_dictionaryForParamObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = (unint64_t)v5;
  }
  else {
    unint64_t v6 = 0;
  }

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v5 dataUsingEncoding:4];
      if (v8)
      {
        id v11 = 0;
        int v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v11];
        uint64_t v7 = (uint64_t)v11;
        objc_opt_class();
        unint64_t v6 = 0;
        if (objc_opt_isKindOfClass()) {
          unint64_t v6 = v9;
        }
      }
      else
      {
        unint64_t v6 = 0;
        uint64_t v7 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    if (!(v6 | v7))
    {
      uint64_t v7 = AMSError();
      unint64_t v6 = 0;
    }
  }
  if (a4) {
    *a4 = (id) v7;
  }

  return (id)v6;
}

- (id)_viewControllerForServiceType:(id)a3 placement:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 params:(id)a7 account:(id)a8 sidepack:(id)a9 metrics:(id)a10
{
  id v16 = a8;
  id v33 = a9;
  id v32 = a10;
  uint64_t v17 = (objc_class *)MEMORY[0x263F27CE8];
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v17 alloc];
  v24 = [(AMSUIMessageGroup *)self bag];
  v25 = (void *)[v23 initWithBag:v24 clientIdentifier:v20 clientVersion:v19 placement:v21 serviceType:v22];

  [v25 setAccount:v16];
  [v25 setContextInfo:v18];

  uint64_t v26 = [v25 perform];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke;
  v34[3] = &unk_2643E3F08;
  v34[4] = self;
  id v35 = v16;
  id v36 = v33;
  id v37 = v32;
  id v27 = v32;
  id v28 = v33;
  id v29 = v16;
  v30 = [v26 thenWithBlock:v34];

  return v30;
}

id __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke_2;
  v12[3] = &unk_2643E3EE0;
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void **)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v5;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v7 = v4;
  id v18 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v12);
  int v9 = v18;
  id v10 = v7;

  return v10;
}

void __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke_2(uint64_t a1)
{
  v2 = [AMSUIMarketingItemViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) bag];
  uint64_t v5 = [(AMSUIMarketingItemViewController *)v2 initWithMarketingItem:v3 bag:v4];

  [(AMSUIDynamicViewController *)v5 setAccount:*(void *)(a1 + 48)];
  [(AMSUIDynamicViewController *)v5 setClientOptions:*(void *)(a1 + 56)];
  [(AMSUIDynamicViewController *)v5 setMetricsOverlay:*(void *)(a1 + 64)];
  [(AMSUIDynamicViewController *)v5 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 72) finishWithResult:v5];
}

- (id)_viewControllerForURL:(id)a3 account:(id)a4 sidepack:(id)a5 metrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x263F27EC8]);
  id v15 = [(AMSUIMessageGroup *)self bag];
  id v16 = (void *)[v14 initWithBag:v15];

  id v17 = [v16 typeForURL:v10];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke;
  v24[3] = &unk_2643E3F58;
  v24[4] = self;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v10;
  id v18 = v10;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = [v17 thenWithBlock:v24];

  return v22;
}

id __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke_2;
  block[3] = &unk_2643E3F30;
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void **)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v5;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v7 = v4;
  id v19 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  int v9 = v19;
  id v10 = v7;

  return v10;
}

void __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  if (v2 == 2)
  {
    id v7 = [AMSUIDynamicViewController alloc];
    id v8 = [*(id *)(a1 + 40) bag];
    uint64_t v5 = [(AMSUIDynamicViewController *)v7 initWithBag:v8 URL:*(void *)(a1 + 72)];

    [(AMSUIDynamicViewController *)v5 setAccount:*(void *)(a1 + 48)];
    [(AMSUIDynamicViewController *)v5 setClientOptions:*(void *)(a1 + 56)];
    [(AMSUIDynamicViewController *)v5 setDelegate:*(void *)(a1 + 40)];
    [(AMSUIDynamicViewController *)v5 setMetricsOverlay:*(void *)(a1 + 64)];
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    if (v2)
    {
      int v9 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v9)
      {
        int v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_opt_class();
        uint64_t v12 = *(void *)(a1 + 32);
        int v15 = 138543618;
        id v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        id v13 = v11;
        _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported URL type: %@", (uint8_t *)&v15, 0x16u);
      }
      goto LABEL_12;
    }
    id v3 = [AMSUIWebViewController alloc];
    id v4 = [*(id *)(a1 + 40) bag];
    uint64_t v5 = [(AMSUIWebViewController *)v3 initWithBag:v4 account:*(void *)(a1 + 48) clientInfo:0];

    [(AMSUIDynamicViewController *)v5 setClientOptions:*(void *)(a1 + 56)];
    [(AMSUIDynamicViewController *)v5 setMetricsOverlay:*(void *)(a1 + 64)];
    [(AMSUIDynamicViewController *)v5 setDelegate:*(void *)(a1 + 40)];
    id v6 = (id)[(AMSUIDynamicViewController *)v5 loadURL:*(void *)(a1 + 72)];
    if (!v5)
    {
LABEL_12:
      uint64_t v14 = *(void **)(a1 + 80);
      AMSError();
      uint64_t v5 = (AMSUIDynamicViewController *)objc_claimAutoreleasedReturnValue();
      [v14 finishWithError:v5];
      goto LABEL_13;
    }
  }
  [*(id *)(a1 + 80) finishWithResult:v5];
LABEL_13:
}

- (NSDictionary)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
}

- (AMSUIMessageGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIMessageGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)clientMetricsOverlay
{
  return self->_clientMetricsOverlay;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientMetricsOverlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end