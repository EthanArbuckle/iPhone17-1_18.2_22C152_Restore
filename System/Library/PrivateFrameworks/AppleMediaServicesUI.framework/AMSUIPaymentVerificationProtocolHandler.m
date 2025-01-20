@interface AMSUIPaymentVerificationProtocolHandler
+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 accountStore:(id)a5;
+ (id)_encoderWithBag:(id)a3 account:(id)a4;
+ (id)_headersFromAccount:(id)a3;
+ (id)_headersFromAccountParameters:(id)a3;
+ (id)_promiseToFetchURLResponseForAccount:(id)a3 accountParameters:(id)a4 url:(id)a5 bag:(id)a6 requestBody:(id)a7 bodyEncoding:(int64_t)a8 contentType:(id)a9;
+ (id)_sessionWithBag:(id)a3 account:(id)a4 accountParameters:(id)a5;
+ (id)headersFromAccount:(id)a3 accountParameters:(id)a4;
+ (id)requestAddingHeaders:(id)a3 to:(id)a4;
+ (void)_setHeaders:(id)a3 on:(id)a4;
- (ACAccount)account;
- (AMSUIPaymentVerificationProtocolHandler)initWithAccount:(id)a3 accountParameters:(id)a4;
- (NSMutableDictionary)accountParameters;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
- (void)setAccount:(id)a3;
- (void)setAccountParameters:(id)a3;
@end

@implementation AMSUIPaymentVerificationProtocolHandler

- (AMSUIPaymentVerificationProtocolHandler)initWithAccount:(id)a3 accountParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIPaymentVerificationProtocolHandler;
  v9 = [(AMSURLProtocolHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    uint64_t v11 = [v8 mutableCopy];
    accountParameters = v10->_accountParameters;
    v10->_accountParameters = (NSMutableDictionary *)v11;
  }
  return v10;
}

+ (id)requestAddingHeaders:(id)a3 to:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__AMSUIPaymentVerificationProtocolHandler_requestAddingHeaders_to___block_invoke;
  v8[3] = &unk_2643E4488;
  id v6 = v5;
  id v9 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

uint64_t __67__AMSUIPaymentVerificationProtocolHandler_requestAddingHeaders_to___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

+ (id)headersFromAccount:(id)a3 accountParameters:(id)a4
{
  if (a4) {
    [a1 _headersFromAccountParameters:a4];
  }
  else {
  v4 = [a1 _headersFromAccount:a3];
  }
  return v4;
}

+ (id)_headersFromAccount:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F27BF8] deviceGUID];
  id v5 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v26 = 0;
  objc_msgSend(v5, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v3, @"com.apple.gs.ams.pvkit", &v26);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v7 = v26;

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v8 = (void *)getAADeviceInfoClass_softClass;
  uint64_t v30 = getAADeviceInfoClass_softClass;
  if (!getAADeviceInfoClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAADeviceInfoClass_block_invoke;
    v34 = &unk_2643E33D8;
    v35 = &v27;
    __getAADeviceInfoClass_block_invoke((uint64_t)buf);
    id v8 = (void *)v28[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v27, 8);
  v10 = [v9 currentInfo];
  uint64_t v11 = [v10 clientInfoHeader];

  v12 = [MEMORY[0x263F291C0] currentDevice];
  v13 = [v12 uniqueDeviceIdentifier];

  objc_super v14 = v6;
  if (!v6)
  {
    v15 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v15)
    {
      v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v34 = v7;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to fetch GS Token from account %{public}@", buf, 0x20u);
    }
    objc_super v14 = &stru_26CC491D8;
  }
  uint64_t v19 = *MEMORY[0x263F278A0];
  v31[0] = *MEMORY[0x263F27890];
  v31[1] = v19;
  if (v11) {
    v20 = v11;
  }
  else {
    v20 = &stru_26CC491D8;
  }
  v32[0] = v14;
  v32[1] = v20;
  if (v13) {
    v21 = v13;
  }
  else {
    v21 = &stru_26CC491D8;
  }
  uint64_t v22 = *MEMORY[0x263F27898];
  v31[2] = *MEMORY[0x263F278A8];
  v31[3] = v22;
  if (v4) {
    v23 = v4;
  }
  else {
    v23 = &stru_26CC491D8;
  }
  v32[2] = v21;
  v32[3] = v23;
  v31[4] = @"X-Guid";
  v31[5] = @"X-Apple-Payment-Verification";
  v32[4] = v23;
  v32[5] = @"1";
  v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:6];

  return v24;
}

+ (id)_headersFromAccountParameters:(id)a3
{
  v19[6] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F27BF8];
  id v4 = a3;
  id v5 = [v3 deviceGUID];
  v18[0] = *MEMORY[0x263F27890];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"gsToken"];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_26CC491D8;
  }
  v19[0] = v8;
  v18[1] = *MEMORY[0x263F278A0];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"mmeClientInfo"];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_26CC491D8;
  }
  v19[1] = v11;
  v18[2] = *MEMORY[0x263F278A8];
  v12 = [v4 objectForKeyedSubscript:@"deviceId"];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = &stru_26CC491D8;
  }
  uint64_t v14 = *MEMORY[0x263F27898];
  if (v5) {
    v15 = v5;
  }
  else {
    v15 = &stru_26CC491D8;
  }
  v19[2] = v13;
  v19[3] = v15;
  v18[3] = v14;
  v18[4] = @"X-Guid";
  v18[5] = @"X-Apple-Payment-Verification";
  v19[4] = v15;
  v19[5] = @"1";
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];

  return v16;
}

+ (void)_setHeaders:(id)a3 on:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AMSUIPaymentVerificationProtocolHandler__setHeaders_on___block_invoke;
  v7[3] = &unk_2643E4488;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __58__AMSUIPaymentVerificationProtocolHandler__setHeaders_on___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  v10 = (void *)MEMORY[0x263F27CB8];
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 sharedConfig];
  if (!v13)
  {
    v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    v16 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v15;
    __int16 v29 = 2114;
    uint64_t v30 = v16;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding required headers to request", buf, 0x16u);
  }
  v26.receiver = self;
  v26.super_class = (Class)AMSUIPaymentVerificationProtocolHandler;
  [(AMSURLProtocolHandler *)&v26 reconfigureNewRequest:v12 originalTask:v11 redirect:v7 error:a6];

  uint64_t v17 = objc_opt_class();
  v18 = [(AMSUIPaymentVerificationProtocolHandler *)self account];
  uint64_t v19 = [(AMSUIPaymentVerificationProtocolHandler *)self accountParameters];
  v20 = [v17 headersFromAccount:v18 accountParameters:v19];

  [(id)objc_opt_class() _setHeaders:v20 on:v12];
  v21 = [(AMSUIPaymentVerificationProtocolHandler *)self account];
  uint64_t v22 = objc_msgSend(v21, "ams_DSID");
  v23 = [v22 stringValue];
  [v12 setValue:v23 forHTTPHeaderField:*MEMORY[0x263F27888]];

  v24 = [(AMSUIPaymentVerificationProtocolHandler *)self account];
  v25 = objc_msgSend(v24, "ams_altDSID");
  [v12 setValue:v25 forHTTPHeaderField:*MEMORY[0x263F27878]];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a6;
  uint64_t v9 = (void *)MEMORY[0x263F27CB8];
  id v10 = a5;
  id v11 = [v9 sharedConfig];
  if (!v11)
  {
    id v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v13;
    __int16 v25 = 2114;
    objc_super v26 = v14;
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting GS token update", buf, 0x16u);
  }
  uint64_t v15 = [v10 options];

  v16 = (void *)[v15 copy];
  [v16 setServiceIdentifier:@"com.apple.gs.ams.pvkit"];
  uint64_t v17 = [(AMSUIPaymentVerificationProtocolHandler *)self account];
  v18 = (void *)[objc_alloc(MEMORY[0x263F27AF8]) initWithAccount:v17 options:v16];
  uint64_t v19 = [v18 performAuthKitUpdate];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __99__AMSUIPaymentVerificationProtocolHandler_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
  v21[3] = &unk_2643E44B0;
  v21[4] = self;
  id v22 = v8;
  id v20 = v8;
  [v19 addFinishBlock:v21];
}

void __99__AMSUIPaymentVerificationProtocolHandler_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [v5 authenticationResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F28FB0]];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"com.apple.gs.ams.pvkit"];
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) accountParameters];
    [v10 setObject:v9 forKeyedSubscript:@"gsToken"];

    id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v11)
    {
      id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)uint64_t v28 = 138543874;
      *(void *)&v28[4] = v13;
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v14;
      *(_WORD *)&v28[22] = 2112;
      id v29 = v9;
      uint64_t v15 = "%{public}@: [%{public}@] Received an updated GS token %@";
      v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 32;
LABEL_10:
      _os_log_impl(&dword_21C134000, v16, v17, v15, v28, v18);
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v11)
    {
      id v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)uint64_t v28 = 138543618;
      *(void *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v14;
      uint64_t v15 = "%{public}@: [%{public}@] Unable to locate GS Token in auth result";
      v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 22;
      goto LABEL_10;
    }
  }

  if (v6)
  {
    id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v20)
    {
      id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v21 = objc_msgSend(v20, "OSLogObject", *(_OWORD *)v28, *(void *)&v28[16], v29);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSLogKey();
      *(_DWORD *)uint64_t v28 = 138543874;
      *(void *)&v28[4] = v22;
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v23;
      *(_WORD *)&v28[22] = 2114;
      id v29 = v6;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] token update error: %{public}@", v28, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x263F27B10]);
    __int16 v25 = [v5 account];
    objc_super v26 = (void *)[v24 initWithAccount:v25];

    (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v26, 0, v27);
  }
}

+ (id)_encoderWithBag:(id)a3 account:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F27ED8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithBag:v7];

  [v8 setAccount:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F27C98]);
  [v9 setAuthenticationFallbackVisible:0];
  [v9 setDisplayAuthenticationReason:0];
  objc_msgSend(v9, "setStyle:", objc_msgSend(MEMORY[0x263F27C98], "preferredAttestationStyle"));
  [v9 setPurpose:1];
  [v8 setKeychainOptions:v9];

  return v8;
}

+ (id)_sessionWithBag:(id)a3 account:(id)a4 accountParameters:(id)a5
{
  id v7 = (void *)MEMORY[0x263F08C00];
  id v8 = (void *)MEMORY[0x263F27E08];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 currentProcess];
  uint64_t v13 = objc_msgSend(v7, "ams_configurationWithProcessInfo:bag:", v12, v11);

  uint64_t v14 = [[AMSUIPaymentVerificationProtocolHandler alloc] initWithAccount:v10 accountParameters:v9];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F27EF0]) initWithConfiguration:v13 delegate:v14 delegateQueue:0];
  [v15 setProtocolHandler:v14];

  return v15;
}

+ (id)_promiseToFetchURLResponseForAccount:(id)a3 accountParameters:(id)a4 url:(id)a5 bag:(id)a6 requestBody:(id)a7 bodyEncoding:(int64_t)a8 contentType:(id)a9
{
  id v13 = a6;
  id v14 = a9;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = +[AMSUIPaymentVerificationProtocolHandler _encoderWithBag:v13 account:v18];
  id v20 = v19;
  if (v15) {
    [v19 setRequestEncoding:a8];
  }
  v21 = +[AMSUIPaymentVerificationProtocolHandler _sessionWithBag:v13 account:v18 accountParameters:v17];
  uint64_t v22 = +[AMSUIPaymentVerificationProtocolHandler headersFromAccount:v18 accountParameters:v17];

  v23 = [v20 requestWithMethod:4 URL:v16 headers:v22 parameters:v15];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __143__AMSUIPaymentVerificationProtocolHandler__promiseToFetchURLResponseForAccount_accountParameters_url_bag_requestBody_bodyEncoding_contentType___block_invoke;
  v29[3] = &unk_2643E44D8;
  id v30 = v14;
  id v31 = v21;
  id v24 = v21;
  id v25 = v14;
  objc_super v26 = [v23 thenWithBlock:v29];

  return v26;
}

id __143__AMSUIPaymentVerificationProtocolHandler__promiseToFetchURLResponseForAccount_accountParameters_url_bag_requestBody_bodyEncoding_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    [v3 setValue:v5 forHTTPHeaderField:@"Content-Type"];
  }
  id v6 = [*(id *)(a1 + 40) dataTaskPromiseWithRequest:v4];

  return v6;
}

+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 accountStore:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [a4 objectForKeyedSubscript:@"altDsId"];
    id v11 = objc_msgSend(v8, "ams_iTunesAccountWithAltDSID:", v10);
    id v12 = v11;
    if (v11)
    {
      id v9 = v11;
    }
    else
    {
      id v13 = objc_msgSend(v8, "ams_activeiCloudAccount");
      id v14 = objc_msgSend(v13, "ams_altDSID");
      int v15 = [v14 isEqualToString:v10];

      if (v15)
      {
        uint64_t v16 = objc_msgSend(v8, "ams_iTunesAccountForAccount:", v13);
        id v17 = (void *)v16;
        if (v16) {
          id v18 = (void *)v16;
        }
        else {
          id v18 = v13;
        }
        id v9 = v18;
      }
      else
      {
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableDictionary)accountParameters
{
  return self->_accountParameters;
}

- (void)setAccountParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end