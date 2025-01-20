@interface AMSAuthorizeMachineTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)validAccount;
- (AMSAuthenticateRequest)authenticateRequest;
- (AMSAuthorizeMachineTask)initWithAccount:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5;
- (AMSAuthorizeMachineTask)initWithUsername:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5 presentationDelegate:(id)a6;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSRequestPresentationDelegate)presentationDelegate;
- (AMSURLSession)session;
- (BOOL)isDeauthorize;
- (NSNumber)familyMemberAccountDSID;
- (NSString)logKey;
- (id)_authenticate;
- (id)_buildRequest;
- (id)_buildRequestParametersWithError:(id *)a3;
- (id)_buildRequestTask;
- (id)_checkRequestThrottle;
- (id)_keybagSyncStringForAccount:(id)a3 withTransactionType:(unsigned int)a4 error:(id *)a5;
- (id)_performAuthorization;
- (id)performDeauthorization;
- (unint64_t)authorizeReason;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)setAuthenticateRequest:(id)a3;
- (void)setAuthorizeReason:(unint64_t)a3;
- (void)setClientInfo:(id)a3;
- (void)setDeauthorize:(BOOL)a3;
- (void)setFamilyMemberAccountDSID:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setValidAccount:(id)a3;
@end

@implementation AMSAuthorizeMachineTask

- (AMSAuthorizeMachineTask)initWithAccount:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSAuthorizeMachineTask;
  v11 = [(AMSTask *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_validAccount, a3);
    v12->_authorizeReason = a4;
    objc_storeStrong((id *)&v12->_bag, a5);
    uint64_t v13 = AMSGenerateLogCorrelationKey();
    logKey = v12->_logKey;
    v12->_logKey = (NSString *)v13;
  }
  return v12;
}

- (AMSAuthorizeMachineTask)initWithUsername:(id)a3 authorizeReason:(unint64_t)a4 bag:(id)a5 presentationDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(AMSAuthorizeMachineTask *)self initWithAccount:0 authorizeReason:a4 bag:a5];
  if (v12)
  {
    uint64_t v13 = objc_alloc_init(AMSAuthenticateOptions);
    [(AMSAuthenticateOptions *)v13 setAuthenticationType:2];
    [(AMSAuthenticateOptions *)v13 setCanMakeAccountActive:0];
    [(AMSAuthenticateOptions *)v13 setCredentialSource:2];
    [(AMSAuthenticateOptions *)v13 setDebugReason:@"Apple ID authentication for machine task authorization"];
    v14 = [[AMSAuthenticateRequest alloc] initWithDSID:0 altDSID:0 username:v10 options:v13];
    v15 = [(AMSAuthorizeMachineTask *)v12 logKey];
    [(AMSAuthenticateRequest *)v14 setLogKey:v15];

    authenticateRequest = v12->_authenticateRequest;
    v12->_authenticateRequest = v14;

    objc_storeWeak((id *)&v12->_presentationDelegate, v11);
  }

  return v12;
}

- (id)performDeauthorization
{
  self->_deauthorize = 1;
  return [(AMSAuthorizeMachineTask *)self _performAuthorization];
}

- (id)_performAuthorization
{
  v3 = [(AMSAuthorizeMachineTask *)self _checkRequestThrottle];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke;
  v7[3] = &unk_1E559F370;
  v7[4] = self;
  v4 = [v3 thenWithBlock:v7];
  v5 = [v4 binaryPromiseAdapter];

  return v5;
}

id __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _buildRequestTask];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke_2;
  v5[3] = &unk_1E559F348;
  v5[4] = *(void *)(a1 + 32);
  v3 = [v2 thenWithBlock:v5];

  return v3;
}

id __48__AMSAuthorizeMachineTask__performAuthorization__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = AMSLogKey();
  v4 = [v2 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v2 object];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v6 objectForKeyedSubscript:@"keybag"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
    goto LABEL_13;
  }
  id v8 = v7;

  if (!v8)
  {
LABEL_13:
    id v10 = 0;
    goto LABEL_14;
  }
  id v9 = +[AMSKeybag sharedInstance];
  id v16 = 0;
  [v9 importKeybagWithData:v8 error:&v16];
  id v10 = v16;

  if (v10)
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v3;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to import keybag data error: %{public}@", buf, 0x20u);
    }
  }
LABEL_14:
  v14 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];

  return v14;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSAuthorizeMachine";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(AMSAuthorizeMachineTask *)self presentationDelegate];
  [v10 handleAuthenticateRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(AMSAuthorizeMachineTask *)self presentationDelegate];
  [v10 handleDialogRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  if (a6)
  {
    v6 = (void (**)(id, void, id))a6;
    AMSError(12, @"Engagement request not supported", @"Engagement request not supported on authorize machine calls.", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }
}

- (id)_buildRequest
{
  id v18 = 0;
  v3 = [(AMSAuthorizeMachineTask *)self _buildRequestParametersWithError:&v18];
  id v4 = v18;
  if (v3)
  {
    v5 = [AMSURLRequestEncoder alloc];
    v6 = [(AMSAuthorizeMachineTask *)self bag];
    id v7 = [(AMSURLRequestEncoder *)v5 initWithBag:v6];

    id v8 = [(AMSAuthorizeMachineTask *)self validAccount];
    [(AMSURLRequestEncoder *)v7 setAccount:v8];

    id v9 = [(AMSAuthorizeMachineTask *)self clientInfo];
    [(AMSURLRequestEncoder *)v7 setClientInfo:v9];

    [(AMSURLRequestEncoder *)v7 setAnisetteType:1];
    id v10 = [(AMSAuthorizeMachineTask *)self bag];
    BOOL v11 = [(AMSAuthorizeMachineTask *)self isDeauthorize];
    v12 = AMSBagKeyDeauthorizeMachineURL;
    if (!v11) {
      v12 = AMSBagKeyAuthorizeMachineURL;
    }
    uint64_t v13 = [v10 URLForKey:*v12];

    v14 = [(AMSURLRequestEncoder *)v7 requestWithMethod:4 bagURL:v13 parameters:v3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__AMSAuthorizeMachineTask__buildRequest__block_invoke;
    v17[3] = &unk_1E559E9C0;
    v17[4] = self;
    v15 = [v14 thenWithBlock:v17];
  }
  else
  {
    v15 = +[AMSPromise promiseWithError:v4];
  }

  return v15;
}

id __40__AMSAuthorizeMachineTask__buildRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setCachePolicy:1];
  id v4 = [*(id *)(a1 + 32) familyMemberAccountDSID];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 stringValue];
    [v3 setValue:v6 forHTTPHeaderField:@"X-FM-Dsid"];
  }
  if ([*(id *)(a1 + 32) authorizeReason] == 2) {
    [v3 setTimeoutInterval:15.0];
  }
  id v7 = +[AMSPromise promiseWithResult:v3];

  return v7;
}

- (id)_buildRequestParametersWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(AMSAuthorizeMachineTask *)self authorizeReason] == 2) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [(AMSAuthorizeMachineTask *)self validAccount];
  id v8 = [(AMSAuthorizeMachineTask *)self _keybagSyncStringForAccount:v7 withTransactionType:v6 error:a3];

  if (v8)
  {
    [v5 setObject:v8 forKeyedSubscript:@"kbsync"];
    id v9 = +[AMSDevice deviceGUID];
    id v10 = [v9 uppercaseString];
    [v5 setObject:v10 forKeyedSubscript:@"guid"];

    BOOL v11 = +[AMSDevice deviceName];
    [v5 setObject:v11 forKeyedSubscript:@"machineName"];

    v12 = [(AMSAuthorizeMachineTask *)self validAccount];
    uint64_t v13 = objc_msgSend(v12, "ams_DSID");
    [v5 setObject:v13 forKeyedSubscript:@"ownerDsid"];

    unint64_t v14 = [(AMSAuthorizeMachineTask *)self authorizeReason];
    if (v14 == 1) {
      v15 = @"family";
    }
    else {
      v15 = 0;
    }
    if (v14 == 2) {
      v15 = @"refetch";
    }
    if (v15)
    {
      id v16 = v15;
      unint64_t v17 = [(AMSAuthorizeMachineTask *)self authorizeReason];
      if (v17 == 1) {
        id v18 = @"family";
      }
      else {
        id v18 = 0;
      }
      if (v17 == 2) {
        __int16 v19 = @"refetch";
      }
      else {
        __int16 v19 = v18;
      }
      [v5 setObject:v19 forKeyedSubscript:@"reason"];
    }
    id v20 = v5;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_authenticate
{
  uint64_t v3 = [(AMSAuthorizeMachineTask *)self presentationDelegate];
  if (v3
    && (id v4 = (void *)v3,
        [(AMSAuthorizeMachineTask *)self authenticateRequest],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = objc_alloc_init(AMSPromise);
    id v7 = [(AMSAuthorizeMachineTask *)self presentationDelegate];
    id v8 = [(AMSAuthorizeMachineTask *)self authenticateRequest];
    id v9 = [(AMSPromise *)v6 completionHandlerAdapter];
    [v7 handleAuthenticateRequest:v8 completion:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__AMSAuthorizeMachineTask__authenticate__block_invoke;
    v12[3] = &unk_1E559F168;
    v12[4] = self;
    [(AMSPromise *)v6 addFinishBlock:v12];
  }
  else
  {
    id v10 = AMSError(12, @"Interactive Authorization Failed", @"Could not present authenticate request, presentation delegate not set", 0);
    uint64_t v6 = +[AMSPromise promiseWithError:v10];
  }
  return v6;
}

void __40__AMSAuthorizeMachineTask__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) logKey];
      int v10 = 138543618;
      BOOL v11 = v9;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Machine authorization/deauthorization account authentication failed: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_9;
  }
  if (v5)
  {
    id v7 = [v5 account];
    [*(id *)(a1 + 32) setValidAccount:v7];
LABEL_9:
  }
}

- (id)_buildRequestTask
{
  uint64_t v3 = [(AMSAuthorizeMachineTask *)self authenticateRequest];

  if (v3)
  {
    id v4 = [(AMSAuthorizeMachineTask *)self _authenticate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke;
    v9[3] = &unk_1E559F398;
    v9[4] = self;
    id v5 = [v4 thenWithBlock:v9];
  }
  else
  {
    id v5 = [(AMSAuthorizeMachineTask *)self _buildRequest];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_2;
  v8[3] = &unk_1E559E9C0;
  v8[4] = self;
  id v6 = [v5 thenWithBlock:v8];

  return v6;
}

uint64_t __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildRequest];
}

id __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMSURLSession defaultSession];
  id v5 = [v4 configuration];

  id v6 = [[AMSURLSession alloc] initWithConfiguration:v5 delegate:*(void *)(a1 + 32) delegateQueue:0];
  [*(id *)(a1 + 32) setSession:v6];

  id v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_3;
  v12[3] = &unk_1E559F3C0;
  v12[4] = *(void *)(a1 + 32);
  [v7 setReconfigureRequestHandler:v12];
  id v8 = [*(id *)(a1 + 32) session];
  [v8 setProtocolHandler:v7];

  id v9 = [*(id *)(a1 + 32) session];
  int v10 = [v9 dataTaskPromiseWithRequest:v3];

  return v10;
}

void __44__AMSAuthorizeMachineTask__buildRequestTask__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v18 = 0;
  id v5 = [v4 _buildRequestParametersWithError:&v18];
  id v6 = v18;
  if (v5)
  {
    id v17 = 0;
    id v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v17];
    id v8 = v17;

    uint64_t v9 = +[AMSLogConfig sharedConfig];
    int v10 = v9;
    if (v7)
    {
      if (!v9)
      {
        int v10 = +[AMSLogConfig sharedConfig];
      }
      BOOL v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [*(id *)(a1 + 32) logKey];
        uint64_t v13 = [v7 length];
        *(_DWORD *)buf = 138543618;
        id v20 = v12;
        __int16 v21 = 2048;
        uint64_t v22 = v13;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting updated request parameters for authorization/deauthorization, %lu bytes", buf, 0x16u);
      }
      [v3 setHTTPBody:v7];
      int v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      uint64_t v14 = [v10 stringValue];
      [v3 setValue:v14 forHTTPHeaderField:@"Content-Length"];
    }
    else
    {
      if (!v9)
      {
        int v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v10 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v16 = [*(id *)(a1 + 32) logKey];
        *(_DWORD *)buf = 138543618;
        id v20 = v16;
        __int16 v21 = 2114;
        uint64_t v22 = (uint64_t)v8;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Serializing reconfigured request parameters for authorization/deauthorization failed: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    int v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = [*(id *)(a1 + 32) logKey];
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2114;
      uint64_t v22 = (uint64_t)v6;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Building reconfigured request parameters for authorization/deauthorization failed: %{public}@", buf, 0x16u);
    }
    id v8 = v6;
  }
}

- (id)_checkRequestThrottle
{
  if ([(AMSAuthorizeMachineTask *)self isDeauthorize])
  {
    id v3 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    id v4 = [(AMSBagProtocol *)self->_bag integerForKey:@"min-keybag-repair-interval-seconds"];
    id v5 = [v4 valuePromise];

    id v3 = [v5 thenWithBlock:&__block_literal_global_12];
  }
  return v3;
}

id __48__AMSAuthorizeMachineTask__checkRequestThrottle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 integerValue];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_1);
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  [v4 systemUptime];
  uint64_t v6 = (uint64_t)v5;

  if (v6 - qword_1EB38D048 >= v3)
  {
    qword_1EB38D048 = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_1);
    uint64_t v9 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_1);
    id v7 = [NSString stringWithFormat:@"Previous request was within %@s of this one", v2];
    id v8 = AMSError(308, @"Request Throttled", v7, 0);

    uint64_t v9 = +[AMSPromise promiseWithError:v8];
  }
  return v9;
}

- (id)_keybagSyncStringForAccount:(id)a3 withTransactionType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[AMSKeybag sharedInstance];
  uint64_t v9 = objc_msgSend(v7, "ams_DSID");

  if (v9) {
    int v10 = v9;
  }
  else {
    int v10 = &unk_1EDD00D60;
  }
  id v19 = 0;
  BOOL v11 = [v8 keybagSyncDataWithAccountID:v10 transactionType:v6 error:&v19];
  id v12 = v19;

  if (!v11)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain keybag data for account error: %{public}@", buf, 0x20u);
    }
    if (a5) {
      *a5 = v12;
    }
  }
  id v17 = [v11 base64EncodedStringWithOptions:0];

  return v17;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)validAccount
{
  return self->_validAccount;
}

- (void)setValidAccount:(id)a3
{
}

- (unint64_t)authorizeReason
{
  return self->_authorizeReason;
}

- (void)setAuthorizeReason:(unint64_t)a3
{
  self->_authorizeReason = a3;
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

- (NSNumber)familyMemberAccountDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFamilyMemberAccountDSID:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (AMSRequestPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (AMSAuthenticateRequest)authenticateRequest
{
  return self->_authenticateRequest;
}

- (void)setAuthenticateRequest:(id)a3
{
}

- (BOOL)isDeauthorize
{
  return self->_deauthorize;
}

- (void)setDeauthorize:(BOOL)a3
{
  self->_deauthorize = a3;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_authenticateRequest, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_familyMemberAccountDSID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_validAccount, 0);
}

@end