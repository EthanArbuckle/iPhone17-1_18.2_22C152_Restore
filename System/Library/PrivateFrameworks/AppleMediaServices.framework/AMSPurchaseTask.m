@interface AMSPurchaseTask
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)shouldPreauthenticatePurchaseWithInfo:(id)a3;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_filterResponseDictionary:(id)a3;
+ (id)createBagForSubProfile;
+ (id)engagementEventWithInfo:(id)a3 responseDictionary:(id)a4 error:(id)a5;
- (AMSBagProtocol)bag;
- (AMSPurchaseDelegate)delegate;
- (AMSPurchaseInfo)purchaseInfo;
- (AMSPurchaseRequestEncoder)purchaseRequestEncoder;
- (AMSPurchaseTask)initWithPurchase:(id)a3 bag:(id)a4;
- (AMSURLSession)session;
- (BOOL)_shouldAttemptCardEnrollment;
- (BOOL)_shouldFinalizeBlindedDataWithResponseDictionary:(id)a3;
- (BOOL)_shouldGenerateAFDSWithPurchaseInfo:(id)a3;
- (BOOL)_shouldSendBlindedData;
- (Class)paymentSheetTaskClass;
- (id)_buySignatureJSONWithFinalizedBlindedItems:(id)a3;
- (id)_finalizeBlindingWithPurchaseInfo:(id)a3 responseDictionary:(id)a4 outError:(id *)a5;
- (id)_promptForAccount;
- (id)_recordEngagementEventWithInfo:(id)a3 responseDictionary:(id)a4 finalizedBlindedItems:(id)a5 error:(id)a6;
- (id)_runAuthenticateRequest:(id)a3;
- (id)_runDialogRequest:(id)a3;
- (id)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4;
- (id)performPreauthenticate;
- (id)performPurchase;
- (id)performPurchaseRequest;
- (id)preauthenticateOptions;
- (void)_generateAndAttachBlindedData;
- (void)_partialFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5;
- (void)_regenerateFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)generateFDSWithInfo:(id)a3 bag:(id)a4;
- (void)setBag:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentSheetTaskClass:(Class)a3;
- (void)setPurchaseInfo:(id)a3;
- (void)setPurchaseRequestEncoder:(id)a3;
@end

@implementation AMSPurchaseTask

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (void)generateFDSWithInfo:(id)a3 bag:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 purchase];
  v9 = [v8 logUUID];

  v10 = [v6 purchase];
  uint64_t v11 = [v10 purchaseType];

  if (v11 == 5)
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [(AMSGenerateFDSTask *)v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = objc_opt_class();
      __int16 v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Skipping AFDS for VPP download", buf, 0x16u);
    }
  }
  else
  {
    v14 = [[AMSGenerateFDSTask alloc] initWithPurchaseInfo:v6 bag:v7];
    [(AMSTask *)v14 setRunMode:1];
    v13 = [(AMSGenerateFDSTask *)v14 runTask];
    objc_initWeak((id *)buf, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke;
    v20[3] = &unk_1E55A5E88;
    objc_copyWeak(&v25, (id *)buf);
    id v15 = v9;
    id v21 = v15;
    v12 = v14;
    v22 = v12;
    id v16 = v6;
    id v23 = v16;
    id v24 = v7;
    [v13 addErrorBlock:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke_3;
    v17[3] = &unk_1E55A5EB0;
    id v18 = v15;
    id v19 = v16;
    [v13 addSuccessBlock:v17];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(v3, "ams_hasDomain:code:", @"AMSErrorDomain", 5) & 1) == 0)
  {
    v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate AFDS, error = %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (objc_msgSend(v3, "ams_hasDomain:", @"com.apple.asd.ca")
    && [*(id *)(a1 + 40) action] == 4)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate ODI, attempting to fetch partial score", (uint8_t *)&v13, 0x16u);
    }

    [WeakRetained _partialFDSWithInfo:*(void *)(a1 + 48) bag:*(void *)(a1 + 56) action:4];
  }
}

void __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [v3 value];
    uint64_t v8 = AMSHashIfNeeded(v7);
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated AFDS = %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = +[AMSFDSService cacheFDS:v3 forPurchaseInfo:*(void *)(a1 + 40)];
}

- (void)_partialFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 purchase];
  uint64_t v11 = [v10 logUUID];

  __int16 v12 = objc_alloc_init(AMSFDSOptions);
  [(AMSFDSOptions *)v12 setAction:a5];
  int v13 = [v8 clientInfo];
  [(AMSFDSOptions *)v12 setClientInfo:v13];

  uint64_t v14 = [AMSFDSRequest alloc];
  __int16 v15 = [v8 purchase];
  uint64_t v16 = [v15 uniqueIdentifier];
  __int16 v17 = [v8 account];
  id v18 = [(AMSFDSRequest *)v14 initWithPurchaseIdentifier:v16 account:v17 options:v12];

  [(AMSFDSRequest *)v18 setLogKey:v11];
  uint64_t v19 = [[AMSGeneratePartialFDSTask alloc] initWithRequest:v18 bag:v9];

  [(AMSTask *)v19 setRunMode:1];
  v20 = [(AMSGeneratePartialFDSTask *)v19 runTask];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke;
  v28[3] = &unk_1E55A5ED8;
  v28[4] = self;
  id v21 = v11;
  id v29 = v21;
  unint64_t v30 = a5;
  [v20 addErrorBlock:v28];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke_10;
  v24[3] = &unk_1E55A5F00;
  id v26 = v8;
  unint64_t v27 = a5;
  id v25 = v21;
  id v22 = v8;
  id v23 = v21;
  [v20 addSuccessBlock:v24];
}

void __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", @"AMSErrorDomain", 5) & 1) == 0)
  {
    v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
      int v9 = 138544130;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v3;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch partial AFDS, error = %{public}@, action: %{public}@", (uint8_t *)&v9, 0x2Au);
    }
  }
}

void __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke_10(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = [v3 value];
    id v8 = AMSHashIfNeeded(v7);
    int v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[6]];
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated partial AFDS = %{public}@, action = %{public}@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = +[AMSFDSService cacheFDS:v3 forPurchaseInfo:a1[5]];
}

- (void)_regenerateFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 purchase];
  int v11 = [v10 logUUID];

  uint64_t v12 = objc_alloc_init(AMSFDSOptions);
  [(AMSFDSOptions *)v12 setAction:a5];
  __int16 v13 = [v8 clientInfo];
  [(AMSFDSOptions *)v12 setClientInfo:v13];

  id v14 = [AMSFDSRequest alloc];
  __int16 v15 = [v8 purchase];
  uint64_t v16 = [v15 uniqueIdentifier];
  uint64_t v17 = [v8 account];
  id v18 = [(AMSFDSRequest *)v14 initWithPurchaseIdentifier:v16 account:v17 options:v12];

  [(AMSFDSRequest *)v18 setLogKey:v11];
  uint64_t v19 = [[AMSGenerateFDSTask alloc] initWithRequest:v18 bag:v9];

  [(AMSTask *)v19 setRunMode:1];
  v20 = [(AMSGenerateFDSTask *)v19 runTask];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke;
  v28[3] = &unk_1E55A5ED8;
  v28[4] = self;
  id v21 = v11;
  id v29 = v21;
  unint64_t v30 = a5;
  [v20 addErrorBlock:v28];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke_11;
  v24[3] = &unk_1E55A5F00;
  id v26 = v8;
  unint64_t v27 = a5;
  id v25 = v21;
  id v22 = v8;
  id v23 = v21;
  [v20 addSuccessBlock:v24];
}

void __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", @"AMSErrorDomain", 5) & 1) == 0)
  {
    v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
      int v9 = 138544130;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v3;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed second attempt to generate AFDS, error = %{public}@, action: %{public}@", (uint8_t *)&v9, 0x2Au);
    }
  }
}

void __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke_11(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = [v3 value];
    id v8 = AMSHashIfNeeded(v7);
    int v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[6]];
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated AFDS = %{public}@, action = %{public}@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = +[AMSFDSService cacheFDS:v3 forPurchaseInfo:a1[5]];
}

- (AMSPurchaseTask)initWithPurchase:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AMSPurchaseTask;
  id v8 = [(AMSTask *)&v22 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    Class paymentSheetTaskClass = v8->_paymentSheetTaskClass;
    v8->_Class paymentSheetTaskClass = (Class)v9;

    int v11 = [[AMSPurchaseInfo alloc] initWithPurchase:v6];
    purchaseInfo = v8->_purchaseInfo;
    v8->_purchaseInfo = v11;

    [(AMSPurchaseInfo *)v8->_purchaseInfo setActivePurchaseTask:v8];
    objc_storeStrong((id *)&v8->_bag, a4);
    __int16 v13 = [[AMSPurchaseRequestEncoder alloc] initWithPurchaseInfo:v8->_purchaseInfo bag:v8->_bag];
    purchaseRequestEncoder = v8->_purchaseRequestEncoder;
    v8->_purchaseRequestEncoder = v13;

    __int16 v15 = (void *)MEMORY[0x1E4F18DD0];
    uint64_t v16 = +[AMSProcessInfo currentProcess];
    uint64_t v17 = objc_msgSend(v15, "ams_configurationWithProcessInfo:bag:", v16, 0);

    id v18 = [[AMSURLSession alloc] initWithConfiguration:v17 delegate:v8 delegateQueue:0];
    session = v8->_session;
    v8->_session = v18;

    v20 = objc_alloc_init(AMSPurchaseProtocolHandler);
    [(AMSURLSession *)v8->_session setProtocolHandler:v20];
  }
  return v8;
}

- (AMSPurchaseDelegate)delegate
{
  v2 = [(AMSPurchaseTask *)self purchaseInfo];
  id v3 = [v2 delegate];

  return (AMSPurchaseDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPurchaseTask *)self purchaseInfo];
  [v5 setDelegate:v4];
}

- (BOOL)_shouldAttemptCardEnrollment
{
  v2 = [(AMSPurchaseTask *)self purchaseInfo];
  id v3 = [v2 purchase];
  unint64_t v4 = [v3 purchaseType];

  return (v4 > 5) | (9u >> v4) & 1;
}

- (BOOL)_shouldGenerateAFDSWithPurchaseInfo:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 account];
  char v5 = objc_msgSend(v4, "ams_isEphemeralAccount");

  if ((v5 & 1) != 0
    || ([v3 purchase],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isRedownload],
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [v3 purchase];
    uint64_t v10 = [v9 purchaseType];

    if (v10) {
      BOOL v11 = v10 == 3;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v8 = v11;
  }

  return v8;
}

- (id)performPurchase
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AMSPurchaseTask_performPurchase__block_invoke;
  v5[3] = &unk_1E55A1AD8;
  objc_copyWeak(&v6, &location);
  id v3 = [(AMSTask *)self performTaskWithPromiseBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __34__AMSPurchaseTask_performPurchase__block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained purchaseInfo];
  id v3 = [v2 purchase];
  unint64_t v4 = [v3 logUUID];

  char v5 = [WeakRetained purchaseInfo];
  id v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  char v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v4) {
      [v8 stringWithFormat:@"%@: [%@] ", v9, v4];
    }
    else {
    uint64_t v10 = [v8 stringWithFormat:@"%@: ", v9, v65];
    }
    *(_DWORD *)buf = 138543362;
    v87 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting purchase task", buf, 0xCu);
  }
  int v11 = [WeakRetained _shouldGenerateAFDSWithPurchaseInfo:v5];
  if (v11)
  {
    uint64_t v12 = [WeakRetained bag];
    [WeakRetained generateFDSWithInfo:v5 bag:v12];
  }
  int v13 = [WeakRetained _shouldSendBlindedData];
  uint64_t v14 = +[AMSLogConfig sharedPurchaseConfig];
  __int16 v15 = (void *)v14;
  if (v13)
  {
    if (!v14)
    {
      __int16 v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = NSString;
      uint64_t v18 = objc_opt_class();
      if (v4) {
        [v17 stringWithFormat:@"%@: [%@] ", v18, v4];
      }
      else {
      objc_super v22 = [v17 stringWithFormat:@"%@: ", v18, v65];
      }
      *(_DWORD *)buf = 138543362;
      v87 = v22;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, "%{public}@Generating buySignature data", buf, 0xCu);
    }
    [WeakRetained _generateAndAttachBlindedData];
  }
  else
  {
    if (!v14)
    {
      __int16 v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v15 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = NSString;
      uint64_t v21 = objc_opt_class();
      if (v4) {
        [v20 stringWithFormat:@"%@: [%@] ", v21, v4];
      }
      else {
      id v23 = [v20 stringWithFormat:@"%@: ", v21, v65];
      }
      *(_DWORD *)buf = 138543362;
      v87 = v23;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_INFO, "%{public}@Not generating buySignature data", buf, 0xCu);
    }
  }
  if ([WeakRetained _shouldAttemptCardEnrollment])
  {
    id v24 = [WeakRetained bag];
    id v25 = [WeakRetained purchaseInfo];
    id v26 = [v25 account];
    BOOL v27 = +[AMSCardEnrollment beginCardEnrollmentAttemptWithBag:v24 account:v26];

    if (v27)
    {
      __int16 v28 = +[AMSCardEnrollment paymentServicesMerchantURL];
      id v29 = [WeakRetained purchaseInfo];
      [v29 setPaymentServicesURL:v28];
    }
    else
    {
      unint64_t v30 = [v5 purchase];
      char v31 = [v30 requiresApplePayClassic];

      if (v31)
      {
        v32 = AMSError(500, @"Purchase Task Failed", @"Purchase requires Apple Pay Classic, but there was not a payment services URL.", 0);
        v33 = +[AMSPromise promiseWithError:v32];
        goto LABEL_62;
      }
    }
    v34 = [WeakRetained bag];
    BOOL v35 = +[AMSFinanceExpressCheckoutResponse isEligibleForBag:v34];

    if (v35)
    {
      v36 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v36)
      {
        v36 = +[AMSLogConfig sharedConfig];
      }
      v37 = [v36 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = NSString;
        uint64_t v39 = objc_opt_class();
        if (v4) {
          [v38 stringWithFormat:@"%@: [%@] ", v39, v4];
        }
        else {
        v40 = [v38 stringWithFormat:@"%@: ", v39, v65];
        }
        *(_DWORD *)buf = 138543362;
        v87 = v40;
        _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@AURUM storefront is eligible for Express Checkout", buf, 0xCu);
      }
      v41 = [WeakRetained bag];
      if (+[AMSFinanceExpressCheckoutResponse isExpressCheckoutShouldCheckForWalletBiometricsForBag:v41])
      {
        BOOL v42 = +[AMSDevice isWalletBiometricsEnabled];

        if (v42)
        {
          v43 = +[AMSCardEnrollment paymentServicesMerchantURL];
          v44 = [WeakRetained purchaseInfo];
          [v44 setPaymentServicesURL:v43];

          v45 = [WeakRetained purchaseInfo];
          v46 = [v45 buyParams];
          v47 = (void *)MEMORY[0x1E4F28ED0];
          v48 = [WeakRetained bag];
          v49 = objc_msgSend(v47, "numberWithBool:", +[AMSCardEnrollment isApplePayWalletRefreshedForBag:](AMSCardEnrollment, "isApplePayWalletRefreshedForBag:", v48));
          [v46 setParameter:v49 forKey:@"isApplePayWalletRefreshed"];

LABEL_52:
          goto LABEL_53;
        }
      }
      else
      {
      }
      v50 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v50)
      {
        v50 = +[AMSLogConfig sharedConfig];
      }
      v51 = [v50 OSLogObject];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = NSString;
        uint64_t v53 = objc_opt_class();
        if (v4) {
          [v52 stringWithFormat:@"%@: [%@] ", v53, v4];
        }
        else {
        v54 = [v52 stringWithFormat:@"%@: ", v53, v65];
        }
        *(_DWORD *)buf = 138543362;
        v87 = v54;
        _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@When Wallet & Apple Pay biometrics toggle is OFF then ExpressCheckout is ineligible, remove the paymentServicesURL", buf, 0xCu);
      }
      v45 = [WeakRetained purchaseInfo];
      [v45 setPaymentServicesURL:0];
      goto LABEL_52;
    }
  }
LABEL_53:
  v55 = [v5 purchase];
  if ([v55 requiresAccount])
  {
    v56 = [v5 account];

    if (!v56)
    {
      v57 = [WeakRetained _promptForAccount];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_47;
      v82[3] = &unk_1E55A5F28;
      id v83 = v4;
      id v84 = WeakRetained;
      id v85 = v5;
      [v57 addSuccessBlock:v82];
      v32 = [v57 binaryPromiseAdapter];

      v58 = v83;
      goto LABEL_59;
    }
  }
  else
  {
  }
  v59 = objc_opt_class();
  v60 = [WeakRetained purchaseInfo];
  LODWORD(v59) = [v59 shouldPreauthenticatePurchaseWithInfo:v60];

  if (!v59)
  {
    v32 = +[AMSBinaryPromise promiseWithSuccess];
    goto LABEL_61;
  }
  v57 = [WeakRetained performPreauthenticate];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_49;
  v78[3] = &unk_1E55A5F28;
  id v79 = v4;
  id v80 = WeakRetained;
  id v81 = v5;
  [v57 addSuccessBlock:v78];
  v32 = [v57 binaryPromiseAdapter];

  v58 = v79;
LABEL_59:

LABEL_61:
  v61 = [v32 promiseAdapter];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_51;
  v77[3] = &unk_1E559F370;
  v77[4] = WeakRetained;
  v62 = [v61 thenWithBlock:v77];

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_2;
  v73[3] = &unk_1E55A5F50;
  char v76 = v11;
  id v74 = v5;
  id v75 = WeakRetained;
  v33 = [v62 continueWithBlock:v73];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_5;
  v72[3] = &unk_1E55A5F78;
  v72[4] = WeakRetained;
  [v33 addSuccessBlock:v72];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_6;
  v69[3] = &unk_1E559E7E8;
  id v63 = v4;
  id v70 = v63;
  id v71 = WeakRetained;
  [v33 addErrorBlock:v69];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_65;
  v66[3] = &unk_1E55A5FA0;
  id v67 = v63;
  id v68 = WeakRetained;
  [v33 addSuccessBlock:v66];

LABEL_62:
  return v33;
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v4)
  {
    unint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  char v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSString;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_opt_class();
    if (v7) {
      [v6 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 32)];
    }
    else {
    uint64_t v9 = [v6 stringWithFormat:@"%@: ", v8, v12];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Pre-Flight Authentication", buf, 0xCu);
  }
  uint64_t v10 = [v3 account];

  [*(id *)(a1 + 48) setAccount:v10];
  return [*(id *)(a1 + 48) setHasBeenAuthedForBuy:1];
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_49(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = NSString;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_opt_class();
    if (v5) {
      [v4 stringWithFormat:@"%@: [%@] ", v6, *(void *)(a1 + 32)];
    }
    else {
    uint64_t v7 = [v4 stringWithFormat:@"%@: ", v6, v9];
    }
    *(_DWORD *)buf = 138543362;
    int v11 = v7;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Device Restrictions", buf, 0xCu);
  }
  return [*(id *)(a1 + 48) setHasBeenAuthedForBuy:1];
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPurchaseRequest];
}

id __34__AMSPurchaseTask_performPurchase__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = objc_alloc_init(AMSPurchaseResult);
    uint64_t v8 = [v5 object];
    [(AMSPurchaseResult *)v7 setResponseDictionary:v8];

    uint64_t v9 = [*(id *)(a1 + 32) purchase];
    [(AMSPurchaseResult *)v7 setPurchase:v9];

    uint64_t v10 = [v5 response];
    [(AMSPurchaseResult *)v7 setURLResponse:v10];

    int v11 = [v5 loadURLEventDictionary];
    [(AMSPurchaseResult *)v7 setLoadURLEventDictionary:v11];

    -[AMSPurchaseResult setDidShowPaymentSheet:](v7, "setDidShowPaymentSheet:", [*(id *)(a1 + 32) didShowPaymentSheet]);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v12 = [v5 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [v5 response];
    uint64_t v15 = [v14 allHeaderFields];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"X-Apple-Jingle-Correlation-Key"];

    [(AMSPurchaseResult *)v7 setCorrelationID:v16];
  }
  if (*(unsigned char *)(a1 + 48)) {
    id v17 = +[AMSFDSService cacheFDS:0 forPurchaseInfo:*(void *)(a1 + 32)];
  }
  uint64_t v18 = [*(id *)(a1 + 32) account];
  int v19 = objc_msgSend(v18, "ams_isEphemeralAccount");

  if (v19)
  {
    v20 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    uint64_t v21 = *(void **)(a1 + 40);
    objc_super v22 = [v5 object];
    LODWORD(v21) = [v21 _shouldFinalizeBlindedDataWithResponseDictionary:v22];

    if (v21)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      id v23 = *(void **)(a1 + 40);
      id v25 = [v5 object];
      uint64_t v43 = 0;
      id v26 = [v23 _finalizeBlindingWithPurchaseInfo:v24 responseDictionary:v25 outError:&v43];
    }
    else
    {
      id v26 = 0;
    }
    uint64_t v28 = *(void *)(a1 + 32);
    BOOL v27 = *(void **)(a1 + 40);
    id v29 = [v5 object];
    unint64_t v30 = [v27 _recordEngagementEventWithInfo:v28 responseDictionary:v29 finalizedBlindedItems:v26 error:v6];

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_3;
    v42[3] = &unk_1E559EA90;
    v42[4] = *(void *)(a1 + 40);
    [v30 addSuccessBlock:v42];
    char v31 = [*(id *)(a1 + 40) purchaseInfo];
    v32 = [v31 purchase];
    LODWORD(v29) = [v32 asyncRecordEngagementEvent];

    if (v29)
    {
      id v33 = +[AMSBinaryPromise promiseWithSuccess];
    }
    else
    {
      id v33 = v30;
    }
    v20 = v33;
  }
  v34 = [v20 promiseAdapter];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_4;
  v39[3] = &unk_1E559E6F8;
  v40 = v7;
  id v41 = v6;
  id v35 = v6;
  v36 = v7;
  v37 = [v34 continueWithBlock:v39];

  return v37;
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) bag];
  v1 = +[AMSMetrics internalInstanceUsingBag:v3];
  id v2 = (id)[v1 flush];
}

id __34__AMSPurchaseTask_performPurchase__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_6;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
    goto LABEL_5;
  }
  uint64_t v10 = AMSError(0, @"No Purchase Result", 0, 0);
  uint64_t v8 = +[AMSPromise promiseWithError:v10];

LABEL_6:
  return v8;
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 bag];
  id v5 = [*(id *)(a1 + 32) purchaseInfo];
  id v6 = [v5 buyParams];
  +[AMSCardEnrollment finishCardEnrollmentAttemptWithBag:v7 buyParams:v6 purchaseResult:v4];
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_opt_class();
    if (v7) {
      [v6 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 32)];
    }
    else {
    uint64_t v9 = [v6 stringWithFormat:@"%@: ", v8, v11];
    }
    uint64_t v10 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Purchase completed with error: %{public}@", buf, 0x16u);
  }
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_65(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSString;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_opt_class();
    if (v5) {
      [v4 stringWithFormat:@"%@: [%@] ", v6, *(void *)(a1 + 32)];
    }
    else {
    uint64_t v7 = [v4 stringWithFormat:@"%@: ", v6, v8];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Purchase completed successfully", buf, 0xCu);
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseBagConsumer bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseBagConsumer bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSPurchaseBagConsumer createBagForSubProfile];
}

+ (id)_filterResponseDictionary:(id)a3
{
  if (a3)
  {
    id v3 = objc_msgSend(a3, "ams_dictionaryRemovingKeys:", &unk_1EDD019D8);
    id v4 = +[AMSMetricsEvent sanitizedObject:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_finalizeBlindingWithPurchaseInfo:(id)a3 responseDictionary:(id)a4 outError:(id *)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v98 = a4;
  id v81 = v9;
  uint64_t v10 = [v9 purchase];
  uint64_t v11 = [v10 blindedData];

  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__AMSPurchaseTask__finalizeBlindingWithPurchaseInfo_responseDictionary_outError___block_invoke;
    aBlock[3] = &unk_1E559EA90;
    id v87 = v81;
    id v112 = v87;
    id v79 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v12 = [v98 objectForKeyedSubscript:@"buySignatures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v82 = v12;
    }
    else {
      id v82 = 0;
    }

    if ([v82 count])
    {
      id v83 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v82, "count"));
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id obj = v82;
      uint64_t v20 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
      if (!v20) {
        goto LABEL_87;
      }
      uint64_t v105 = *(void *)v108;
      while (1)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v108 != v105) {
            objc_enumerationMutation(obj);
          }
          objc_super v22 = *(void **)(*((void *)&v107 + 1) + 8 * v21);
          id v23 = [v22 objectForKeyedSubscript:@"songId"];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v24 = [v22 objectForKeyedSubscript:@"songId"];
            uint64_t v25 = [v24 unsignedIntegerValue];

            if (v25)
            {
              id v26 = [v22 objectForKeyedSubscript:@"token-info"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = v26;

                if (v27)
                {
                  uint64_t v28 = [v98 objectForKeyedSubscript:@"metrics"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v29 = v28;

                    if (v29)
                    {
                      unint64_t v30 = [v29 objectForKeyedSubscript:@"commerceEvent_purchase_priceType"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        char v31 = v30;

                        if (v31)
                        {
                          v93 = [v87 purchase];
                          os_log_t loga = [v93 blindedData];
                          uint64_t v88 = [loga privateInput];
                          v90 = [v87 purchase];
                          v89 = [v90 blindedData];
                          v32 = [v89 timestamp];
                          id v33 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v25);
                          id v106 = 0;
                          v34 = +[AMSBlinder finalizeBlindedDataWithPrivateInput:v88 timeStamp:v32 priceType:v31 adamId:v33 serverData:v27 error:&v106];
                          id v35 = v106;

                          if (v34)
                          {
                            [v83 addObject:v34];
                          }
                          else
                          {
                            v60 = +[AMSLogConfig sharedPurchaseConfig];
                            if (!v60)
                            {
                              v60 = +[AMSLogConfig sharedConfig];
                            }
                            v61 = [v60 OSLogObject];
                            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                            {
                              log = v61;
                              v94 = AMSLogKey();
                              v62 = NSString;
                              if (v94)
                              {
                                uint64_t v63 = objc_opt_class();
                                uint64_t v78 = AMSLogKey();
                                uint64_t v64 = [v62 stringWithFormat:@"%@: [%@] ", v63, v78];
                                char v76 = (void *)v64;
                              }
                              else
                              {
                                uint64_t v64 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
                                v77 = (void *)v64;
                              }
                              uint64_t v65 = AMSLogableError(v35);
                              *(_DWORD *)buf = 138543618;
                              uint64_t v114 = v64;
                              __int16 v115 = 2114;
                              v116 = v65;
                              v61 = log;
                              _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@Finalize Blinding failed to return data. Error: %{public}@", buf, 0x16u);
                              v66 = v77;
                              if (v94)
                              {

                                v66 = (void *)v78;
                              }
                            }
                            if (a5)
                            {
                              id v35 = v35;
                              v34 = 0;
                              *a5 = v35;
                            }
                            else
                            {
                              v34 = 0;
                            }
                          }
                          goto LABEL_69;
                        }
                      }
                      else
                      {
                      }
                      id v35 = +[AMSLogConfig sharedPurchaseConfig];
                      if (!v35)
                      {
                        id v35 = +[AMSLogConfig sharedConfig];
                      }
                      v34 = [v35 OSLogObject];
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      {
                        v52 = AMSLogKey();
                        uint64_t v53 = NSString;
                        if (v52)
                        {
                          uint64_t v54 = objc_opt_class();
                          uint64_t v86 = AMSLogKey();
                          uint64_t v55 = [v53 stringWithFormat:@"%@: [%@] ", v54, v86];
                          id v84 = (void *)v55;
                        }
                        else
                        {
                          uint64_t v55 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
                          id v85 = (void *)v55;
                        }
                        v58 = AMSHashIfNeeded(v29);
                        *(_DWORD *)buf = 138543618;
                        uint64_t v114 = v55;
                        __int16 v115 = 2112;
                        v116 = v58;
                        v59 = v85;
                        if (v52)
                        {

                          v59 = (void *)v86;
                        }
                      }
                      char v31 = 0;
LABEL_69:

LABEL_70:
LABEL_71:

                      goto LABEL_72;
                    }
                  }
                  else
                  {
                  }
                  char v31 = +[AMSLogConfig sharedPurchaseConfig];
                  if (!v31)
                  {
                    char v31 = +[AMSLogConfig sharedConfig];
                  }
                  id v35 = [v31 OSLogObject];
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  {
                    v46 = AMSLogKey();
                    v47 = NSString;
                    if (v46)
                    {
                      uint64_t v48 = objc_opt_class();
                      uint64_t v97 = AMSLogKey();
                      uint64_t v49 = [v47 stringWithFormat:@"%@: [%@] ", v48, v97];
                      v95 = (void *)v49;
                    }
                    else
                    {
                      uint64_t v49 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
                      v96 = (void *)v49;
                    }
                    v56 = AMSHashIfNeeded(0);
                    *(_DWORD *)buf = 138543618;
                    uint64_t v114 = v49;
                    __int16 v115 = 2112;
                    v116 = v56;
                    v57 = v96;
                    if (v46)
                    {

                      v57 = (void *)v97;
                    }
                  }
                  id v29 = 0;
                  goto LABEL_70;
                }
              }
              else
              {
              }
              id v29 = +[AMSLogConfig sharedPurchaseConfig];
              if (!v29)
              {
                id v29 = +[AMSLogConfig sharedConfig];
              }
              char v31 = [v29 OSLogObject];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v40 = AMSLogKey();
                id v41 = NSString;
                if (v40)
                {
                  uint64_t v42 = objc_opt_class();
                  uint64_t v101 = AMSLogKey();
                  uint64_t v43 = [v41 stringWithFormat:@"%@: [%@] ", v42, v101];
                  v99 = (void *)v43;
                }
                else
                {
                  uint64_t v43 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
                  v100 = (void *)v43;
                }
                v50 = AMSHashIfNeeded(v22);
                *(_DWORD *)buf = 138543618;
                uint64_t v114 = v43;
                __int16 v115 = 2112;
                v116 = v50;
                v51 = v100;
                if (v40)
                {

                  v51 = (void *)v101;
                }
              }
              id v27 = 0;
              goto LABEL_71;
            }
          }
          else
          {
          }
          id v27 = +[AMSLogConfig sharedPurchaseConfig];
          if (!v27)
          {
            id v27 = +[AMSLogConfig sharedConfig];
          }
          id v29 = [v27 OSLogObject];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v36 = AMSLogKey();
            v37 = NSString;
            if (v36)
            {
              uint64_t v38 = objc_opt_class();
              uint64_t v7 = AMSLogKey();
              uint64_t v39 = [v37 stringWithFormat:@"%@: [%@] ", v38, v7];
              v102 = (void *)v39;
            }
            else
            {
              uint64_t v39 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
              v103 = (void *)v39;
            }
            v44 = AMSHashIfNeeded(v22);
            *(_DWORD *)buf = 138543618;
            uint64_t v114 = v39;
            __int16 v115 = 2112;
            v116 = v44;
            v45 = v103;
            if (v36)
            {

              v45 = (void *)v7;
            }
          }
LABEL_72:

          ++v21;
        }
        while (v20 != v21);
        uint64_t v67 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
        uint64_t v20 = v67;
        if (!v67)
        {
LABEL_87:

          id v68 = [MEMORY[0x1E4F1C978] arrayWithArray:v83];
          goto LABEL_103;
        }
      }
    }
    v69 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v69)
    {
      v69 = +[AMSLogConfig sharedConfig];
    }
    id v83 = v69;
    id v70 = [v69 OSLogObject];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      id v71 = AMSLogKey();
      v72 = NSString;
      if (v71)
      {
        uint64_t v73 = objc_opt_class();
        uint64_t v5 = AMSLogKey();
        [v72 stringWithFormat:@"%@: [%@] ", v73, v5];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      id v74 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v114 = (uint64_t)v74;
      _os_log_impl(&dword_18D554000, v70, OS_LOG_TYPE_ERROR, "%{public}@Unable to Finalize Blinding. Array is empty.", buf, 0xCu);
      if (v71)
      {

        id v74 = (void *)v5;
      }
    }
    id v68 = 0;
LABEL_103:

    v79[2]();
    int v13 = v112;
  }
  else
  {
    int v13 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v13)
    {
      int v13 = +[AMSLogConfig sharedConfig];
    }
    __int16 v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = AMSLogKey();
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        uint64_t v6 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, v6];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      int v19 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v114 = (uint64_t)v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to Finalize Blinding. Data missing!", buf, 0xCu);
      if (v15)
      {

        int v19 = (void *)v6;
      }
    }
    id v68 = 0;
  }

  return v68;
}

void __81__AMSPurchaseTask__finalizeBlindingWithPurchaseInfo_responseDictionary_outError___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) purchase];
  id v2 = [v1 blindedData];
  id v4 = [v2 privateInput];

  id v3 = v4;
  if (v4)
  {
    +[AMSBlinder removeCachedClientForPrivateInput:v4];
    id v3 = v4;
  }
}

- (id)_buySignatureJSONWithFinalizedBlindedItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v26[0] = @"songId";
        uint64_t v8 = [v7 adamId];
        v27[0] = v8;
        v26[1] = @"finalizedBlindedData";
        id v9 = [v7 finalizedData];
        uint64_t v10 = [v9 base64EncodedStringWithOptions:0];
        v27[1] = v10;
        v26[2] = @"privateInput";
        uint64_t v11 = [v7 privateInput];
        uint64_t v12 = [v11 base64EncodedStringWithOptions:0];
        v27[2] = v12;
        v26[3] = @"timestamp";
        int v13 = (void *)MEMORY[0x1E4F28ED0];
        __int16 v14 = [v7 timestamp];
        uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "longLongValue"));
        v27[3] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

        [v21 addObject:v16];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v21];

  return v17;
}

- (void)_generateAndAttachBlindedData
{
  id v9 = +[AMSBlinder generateRandomPrivateInput];
  id v3 = +[AMSBlinder makeBlindedDataWithPrivateInputData:v9];
  uint64_t v4 = [(AMSPurchaseTask *)self purchaseInfo];
  uint64_t v5 = [v4 purchase];
  [v5 setBlindedData:v3];

  uint64_t v6 = [(AMSPurchaseTask *)self purchaseInfo];
  uint64_t v7 = [v6 purchase];
  uint64_t v8 = [v7 buyParams];
  [v8 addBlindedData:v3];
}

- (id)_promptForAccount
{
  uint64_t v4 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v4 setAuthenticationType:2];
  uint64_t v5 = [(AMSPurchaseTask *)self purchaseInfo];
  uint64_t v6 = [v5 clientInfo];
  [(AMSAuthenticateOptions *)v4 setClientInfo:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = NSStringFromSelector(a2);
  uint64_t v11 = [v7 stringWithFormat:@"-[%@ %@]", v9, v10];
  [(AMSAuthenticateOptions *)v4 setDebugReason:v11];

  [(AMSAuthenticateOptions *)v4 setEnableAccountCreation:1];
  [(AMSAuthenticateOptions *)v4 setIgnoreAccountConversion:1];
  uint64_t v12 = AMSLogKey();
  [(AMSAuthenticateOptions *)v4 setLogKey:v12];

  int v13 = [[AMSAuthenticateRequest alloc] initWithDSID:0 altDSID:0 username:0 options:v4];
  __int16 v14 = [(AMSPurchaseTask *)self _runAuthenticateRequest:v13];

  return v14;
}

- (BOOL)_shouldFinalizeBlindedDataWithResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSPurchaseTask *)self bag];
  uint64_t v6 = [v5 BOOLForKey:@"preventSendingBlindedData"];
  uint64_t v7 = [v6 valueWithError:0];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(AMSPurchaseTask *)self bag];
    id v9 = [v8 BOOLForKey:@"preventSendingBlindedData"];
    uint64_t v10 = [v9 valueWithError:0];
    char v11 = [v10 BOOLValue];

    if (v11)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  int v13 = [v4 objectForKeyedSubscript:@"buySignatures"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  BOOL v12 = [v14 count] != 0;
LABEL_9:

  return v12;
}

- (BOOL)_shouldSendBlindedData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (+[AMSDefaults alwaysSendBlindedData])
  {
    id v3 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = AMSLogKey();
      uint64_t v6 = NSString;
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = v7;
      if (v5)
      {
        AMSLogKey();
        self = (AMSPurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v6 stringWithFormat:@"%@: [%@] ", v8, self];
      }
      else
      {
        [v6 stringWithFormat:@"%@: ", v7];
      id v9 = };
      *(_DWORD *)buf = 138543362;
      long long v22 = v9;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding shouldSendBlindedData for user defaults", buf, 0xCu);
      if (v5)
      {

        id v9 = self;
      }
    }
    return 1;
  }
  else
  {
    uint64_t v10 = [(AMSPurchaseTask *)self bag];
    char v11 = [v10 BOOLForKey:@"preventSendingBlindedData"];
    BOOL v12 = [v11 valueWithError:0];
    if (objc_opt_respondsToSelector())
    {
      int v13 = [(AMSPurchaseTask *)self bag];
      id v14 = [v13 BOOLForKey:@"preventSendingBlindedData"];
      uint64_t v15 = [v14 valueWithError:0];
      char v16 = [v15 BOOLValue];

      if (v16) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v18 = [(AMSPurchaseTask *)self purchaseInfo];
    int v19 = [v18 purchase];
    char v20 = [v19 sendBlindedData];

    return v20;
  }
}

- (id)_recordEngagementEventWithInfo:(id)a3 responseDictionary:(id)a4 finalizedBlindedItems:(id)a5 error:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = [(id)objc_opt_class() engagementEventWithInfo:v11 responseDictionary:v14 error:v13];

  if (v12)
  {
    char v16 = [(AMSPurchaseTask *)self _buySignatureJSONWithFinalizedBlindedItems:v12];
    uint64_t v17 = v16;
    if (v16 && [v16 count])
    {
      [v15 setProperty:v17 forBodyKey:@"buySignatures"];
    }
    else
    {
      uint64_t v18 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v18)
      {
        uint64_t v18 = +[AMSLogConfig sharedConfig];
      }
      int v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v45 = v13;
        uint64_t v6 = AMSLogKey();
        char v20 = NSString;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v21;
        v44 = (void *)v6;
        if (v6)
        {
          uint64_t v6 = AMSLogKey();
          [v20 stringWithFormat:@"%@: [%@] ", v22, v6];
        }
        else
        {
          [v20 stringWithFormat:@"%@: ", v21];
        uint64_t v23 = };
        long long v24 = AMSLogableError(v45);
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v23;
        __int16 v54 = 2114;
        uint64_t v55 = v24;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to generate buySignature for blinded element. %{public}@", buf, 0x16u);
        if (v44)
        {

          uint64_t v23 = (void *)v6;
        }

        id v13 = v45;
      }
    }
  }
  long long v25 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v25)
  {
    long long v25 = +[AMSLogConfig sharedConfig];
  }
  id v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = v12;
    id v27 = v13;
    uint64_t v28 = AMSLogKey();
    uint64_t v29 = NSString;
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = v30;
    if (v28)
    {
      uint64_t v6 = AMSLogKey();
      [v29 stringWithFormat:@"%@: [%@] ", v31, v6];
    }
    else
    {
      [v29 stringWithFormat:@"%@: ", v30];
    v32 = };
    id v33 = [v15 propertyForBodyKey:@"success"];
    *(_DWORD *)buf = 138543618;
    uint64_t v53 = v32;
    __int16 v54 = 2114;
    uint64_t v55 = v33;
    _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Recording engagement event. success: %{public}@", buf, 0x16u);
    if (v28)
    {

      v32 = (void *)v6;
    }

    id v13 = v27;
    id v12 = v46;
  }

  v34 = [AMSEngagement alloc];
  id v35 = [(AMSPurchaseTask *)self bag];
  v36 = [(AMSEngagement *)v34 initWithBag:v35];

  v37 = [v15 dictionaryForPosting];
  uint64_t v38 = [(AMSEngagement *)v36 enqueueData:v37];

  uint64_t v39 = objc_alloc_init(AMSMutableBinaryPromise);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke;
  v48[3] = &unk_1E55A5FC8;
  v40 = v39;
  uint64_t v49 = v40;
  id v50 = v11;
  v51 = self;
  id v41 = v11;
  [v38 addFinishBlock:v48];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke_105;
  v47[3] = &unk_1E559F028;
  v47[4] = self;
  [(AMSBinaryPromise *)v40 addErrorBlock:v47];
  uint64_t v42 = v40;

  return v42;
}

void __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
      uint64_t v8 = [*(id *)(a1 + 40) delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = +[AMSLogConfig sharedConfig];
        if (!v10)
        {
          uint64_t v10 = +[AMSLogConfig sharedConfig];
        }
        id v11 = [v10 OSLogObject];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = objc_opt_class();
          id v13 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v12;
          __int16 v28 = 2114;
          uint64_t v29 = v13;
          _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);
        }
        id v14 = [*(id *)(a1 + 40) delegate];
        uint64_t v15 = [*(id *)(a1 + 40) purchase];
        char v16 = [v6 request];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke_102;
        v24[3] = &unk_1E55A0E60;
        void v24[4] = *(void *)(a1 + 48);
        id v25 = *(id *)(a1 + 32);
        [v14 purchase:v15 handleEngagementRequest:v16 completion:v24];
      }
      else
      {
        uint64_t v17 = [*(id *)(a1 + 40) delegate];
        uint64_t v23 = AMSErrorWithFormat(2, @"Engagement presentation failed", @"Delegate does not respond: %@", v18, v19, v20, v21, v22, (uint64_t)v17);

        [*(id *)(a1 + 32) finishWithError:v23];
      }
    }
    else
    {
      [*(id *)(a1 + 32) finishWithSuccess];
    }
  }
}

void __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
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

void __97__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_finalizedBlindedItems_error___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = NSString;
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
    __int16 v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Engagement failed. %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
}

- (id)_runAuthenticateRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPurchaseTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AMSPromise);
    uint64_t v8 = [(AMSPurchaseTask *)self delegate];
    uint64_t v9 = [(AMSPurchaseTask *)self purchaseInfo];
    uint64_t v10 = [v9 purchase];
    __int16 v11 = [(AMSPromise *)v7 completionHandlerAdapter];
    [v8 purchase:v10 handleAuthenticateRequest:v4 completion:v11];
  }
  else
  {
    uint64_t v8 = AMSError(12, @"Purchase Authentication Failed", @"Delegate does not respond to auth callback", 0);
    uint64_t v7 = +[AMSPromise promiseWithError:v8];
  }

  return v7;
}

- (id)_runDialogRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPurchaseTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AMSPromise);
    uint64_t v8 = [(AMSPurchaseTask *)self delegate];
    uint64_t v9 = [(AMSPurchaseTask *)self purchaseInfo];
    uint64_t v10 = [v9 purchase];
    __int16 v11 = [(AMSPromise *)v7 completionHandlerAdapter];
    [v8 purchase:v10 handleDialogRequest:v4 completion:v11];
  }
  else
  {
    uint64_t v8 = AMSError(12, @"Purchase Dialog Failed", @"Delegate does not respond to dialog callback", 0);
    uint64_t v7 = +[AMSPromise promiseWithError:v8];
  }

  return v7;
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(AMSPurchaseTask *)self delegate];

  if (v9)
  {
    uint64_t v10 = [(AMSPurchaseTask *)self delegate];
    __int16 v11 = [(AMSPurchaseTask *)self purchaseInfo];
    uint64_t v12 = [v11 purchase];
    [v10 purchase:v12 handleDialogRequest:v7 completion:v8];
  }
  else
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Auth task dialog is being dropped as there is no purchase delegate set on this task.", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (Class)paymentSheetTaskClass
{
  return self->_paymentSheetTaskClass;
}

- (void)setPaymentSheetTaskClass:(Class)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
}

- (AMSPurchaseRequestEncoder)purchaseRequestEncoder
{
  return self->_purchaseRequestEncoder;
}

- (void)setPurchaseRequestEncoder:(id)a3
{
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_purchaseRequestEncoder, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_paymentSheetTaskClass, 0);
}

+ (id)engagementEventWithInfo:(id)a3 responseDictionary:(id)a4 error:(id)a5
{
  v46[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = +[AMSDefaults forceEngagementPurchaseSuccess];
  if (v9) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 1;
  }
  id v13 = [[AMSMetricsEvent alloc] initForEngagement];
  [v13 setProperty:@"purchase" forBodyKey:@"eventType"];
  [v13 setProperty:@"AMS" forBodyKey:@"source"];
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
  [v13 setProperty:v14 forBodyKey:@"success"];

  uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
  int v16 = [v8 purchase];
  uint64_t v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "purchaseType"));
  [v13 setProperty:v17 forBodyKey:@"purchaseType"];

  __int16 v18 = [v8 purchase];
  uint64_t v19 = [v18 account];
  uint64_t v20 = objc_msgSend(v19, "ams_DSID");
  uint64_t v21 = [v20 description];
  [v13 setProperty:v21 forBodyKey:@"accountId"];

  uint64_t v22 = [v8 purchase];
  uint64_t v23 = [v22 buyParams];
  long long v24 = [v23 dictionary];
  id v25 = +[AMSMetricsEvent sanitizedObject:v24];
  [v13 setProperty:v25 forBodyKey:@"buyParameters"];

  id v26 = [a1 _filterResponseDictionary:v10];
  [v13 setProperty:v26 forBodyKey:@"responseDictionary"];

  uint64_t v27 = [v10 objectForKeyedSubscript:@"metrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;

    if (v28) {
      [v13 addPropertiesWithDictionary:v28];
    }
  }
  else
  {

    id v28 = 0;
  }
  uint64_t v29 = [v8 purchase];
  uint64_t v30 = [v29 metricsOverlay];

  if (v30)
  {
    uint64_t v31 = [v8 purchase];
    v32 = [v31 metricsOverlay];
    [v13 addPropertiesWithDictionary:v32];
  }
  if (v9)
  {
    v45[0] = @"code";
    id v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "code"));
    v46[0] = v33;
    v45[1] = @"domain";
    uint64_t v34 = [v9 domain];
    id v35 = (void *)v34;
    if (v34) {
      v36 = (__CFString *)v34;
    }
    else {
      v36 = &stru_1EDCA7308;
    }
    v46[1] = v36;
    v45[2] = @"title";
    uint64_t v37 = objc_msgSend(v9, "ams_title");
    uint64_t v38 = (void *)v37;
    if (v37) {
      uint64_t v39 = (__CFString *)v37;
    }
    else {
      uint64_t v39 = &stru_1EDCA7308;
    }
    v46[2] = v39;
    v45[3] = @"message";
    uint64_t v40 = objc_msgSend(v9, "ams_message");
    id v41 = (void *)v40;
    if (v40) {
      uint64_t v42 = (__CFString *)v40;
    }
    else {
      uint64_t v42 = &stru_1EDCA7308;
    }
    v46[3] = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];

    [v13 setProperty:v43 forBodyKey:@"error"];
  }

  return v13;
}

- (id)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4
{
  return +[AMSBinaryPromise promiseWithSuccess];
}

- (id)performPreauthenticate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase for device restrictions", buf, 0x16u);
  }
  id v8 = [(AMSPurchaseTask *)self preauthenticateOptions];
  id v9 = [AMSAuthenticateRequest alloc];
  id v10 = [(AMSPurchaseTask *)self purchaseInfo];
  BOOL v11 = [v10 account];
  uint64_t v12 = [(AMSAuthenticateRequest *)v9 initWithAccount:v11 options:v8];

  id v13 = AMSLogKey();
  [(AMSAuthenticateRequest *)v12 setLogKey:v13];

  uint64_t v14 = [(AMSPurchaseTask *)self _runAuthenticateRequest:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__AMSPurchaseTask_AppleMediaServices_Project__performPreauthenticate__block_invoke;
  v16[3] = &unk_1E559F168;
  v16[4] = self;
  [v14 addFinishBlock:v16];

  return v14;
}

void __69__AMSPurchaseTask_AppleMediaServices_Project__performPreauthenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = AMSLogKey();
      int v15 = 138543874;
      int v16 = v8;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Purchase pre-authentication for device restrictions failed with error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    BOOL v11 = [a2 authenticationResults];
    uint64_t v12 = [v11 valueForKey:*MEMORY[0x1E4F4EDC0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    uint64_t v14 = [*(id *)(a1 + 32) purchaseInfo];
    [v14 setIdmsTokens:v13];
  }
}

- (id)performPurchaseRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSPurchaseTask *)self purchaseInfo];
  id v4 = [v3 purchase];
  id v5 = [v4 logUUID];

  id v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v5) {
      [v8 stringWithFormat:@"%@: [%@] ", v9, v5];
    }
    else {
    id v10 = [v8 stringWithFormat:@"%@: ", v9, v16];
    }
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Performing purchase", buf, 0xCu);
  }
  BOOL v11 = [(AMSPurchaseTask *)self purchaseRequestEncoder];
  uint64_t v12 = [(AMSPurchaseTask *)self session];
  id v13 = [v11 encodeRequest];
  uint64_t v14 = [v12 dataTaskPromiseWithRequestPromise:v13];

  return v14;
}

- (id)preauthenticateOptions
{
  id v3 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v3 setAuthenticationType:2];
  [(AMSAuthenticateOptions *)v3 setCanMakeAccountActive:0];
  id v4 = [(AMSPurchaseTask *)self purchaseInfo];
  id v5 = [v4 clientInfo];
  [(AMSAuthenticateOptions *)v3 setClientInfo:v5];

  [(AMSAuthenticateOptions *)v3 setDebugReason:@"Pre-authentication due to device restrictions around purchasing."];
  return v3;
}

+ (BOOL)shouldPreauthenticatePurchaseWithInfo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[AMSRestrictions requirePasswordImmediately];
  uint64_t v5 = +[AMSLogConfig sharedPurchaseConfig];
  id v6 = (void *)v5;
  if (!v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v6 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    uint64_t v16 = objc_opt_class();
    id v13 = v16;
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v16;
    __int16 v34 = 2114;
    id v35 = v14;
    int v15 = "%{public}@: [%{public}@] Purchase pre-authentication not required.";
    __int16 v17 = v11;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    goto LABEL_26;
  }
  if (!v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v8;
    __int16 v34 = 2114;
    id v35 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchase requires pre-authentication.", (uint8_t *)&v32, 0x16u);
  }
  if ([v3 hasBeenAuthedForBuy])
  {
    id v6 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v6 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    uint64_t v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v12;
    __int16 v34 = 2114;
    id v35 = v14;
    int v15 = "%{public}@: [%{public}@] Purchase has already been authed, skipping purchase pre-authentication.";
    goto LABEL_25;
  }
  uint64_t v19 = [v3 purchase];
  id v20 = [v19 account];
  BOOL v21 = +[AMSBiometrics isAvailableForAccount:v20];

  if (v21)
  {
    id v6 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v6 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    uint64_t v22 = objc_opt_class();
    id v13 = v22;
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v22;
    __int16 v34 = 2114;
    id v35 = v14;
    int v15 = "%{public}@: [%{public}@] Biometrics enabled, skipping purchase pre-authentication.";
    goto LABEL_25;
  }
  uint64_t v23 = [v3 purchase];
  int v24 = [v23 ignoreRequirePasswordRestriction];

  uint64_t v25 = +[AMSLogConfig sharedPurchaseConfig];
  id v6 = (void *)v25;
  if (v24)
  {
    if (!v25)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v6 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    id v26 = objc_opt_class();
    id v13 = v26;
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v26;
    __int16 v34 = 2114;
    id v35 = v14;
    int v15 = "%{public}@: [%{public}@] Purchase is configured to ignore password restriction, skipping purchase pre-authentication.";
LABEL_25:
    __int16 v17 = v11;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_26:
    _os_log_impl(&dword_18D554000, v17, v18, v15, (uint8_t *)&v32, 0x16u);

LABEL_27:
    BOOL v27 = 0;
    goto LABEL_28;
  }
  if (!v25)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  BOOL v11 = [v6 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = objc_opt_class();
    id v30 = v29;
    uint64_t v31 = AMSSetLogKeyIfNeeded();
    int v32 = 138543618;
    id v33 = v29;
    __int16 v34 = 2114;
    id v35 = v31;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enforcing purchase pre-authentication.", (uint8_t *)&v32, 0x16u);
  }
  BOOL v27 = 1;
LABEL_28:

  return v27;
}

@end