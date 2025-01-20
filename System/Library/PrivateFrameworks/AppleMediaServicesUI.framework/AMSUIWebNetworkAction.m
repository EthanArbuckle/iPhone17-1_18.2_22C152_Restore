@interface AMSUIWebNetworkAction
- (ACAccount)account;
- (AMSUIWebNetworkAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)includeAuthKitTokens;
- (BOOL)includeiCloudTokens;
- (BOOL)requiresCellularAccess;
- (BOOL)usePrimaryKeychain;
- (NSDictionary)headers;
- (NSString)body;
- (NSString)gsTokenIdentifier;
- (NSString)method;
- (NSString)signatureData;
- (NSURL)URL;
- (id)_createSession;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setBody:(id)a3;
- (void)setGsTokenIdentifier:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setIncludeAuthKitTokens:(BOOL)a3;
- (void)setIncludeiCloudTokens:(BOOL)a3;
- (void)setMethod:(id)a3;
- (void)setRequiresCellularAccess:(BOOL)a3;
- (void)setSignatureData:(id)a3;
- (void)setURL:(id)a3;
- (void)setUsePrimaryKeychain:(BOOL)a3;
@end

@implementation AMSUIWebNetworkAction

- (AMSUIWebNetworkAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebNetworkAction;
  v7 = [(AMSUIWebAction *)&v45 initWithJSObject:v6 context:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(AMSUIWebAction *)v7 context];
    v10 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v11 = [v9 iTunesAccountFromJSAccount:v10];
    account = v8->_account;
    v8->_account = (ACAccount *)v11;

    if (!v8->_account)
    {
      v13 = [(AMSUIWebAction *)v8 context];
      v14 = [v6 objectForKeyedSubscript:@"dsid"];
      uint64_t v15 = [v13 iTunesAccountFromJSDSID:v14];
      v16 = v8->_account;
      v8->_account = (ACAccount *)v15;
    }
    v17 = [v6 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    body = v8->_body;
    v8->_body = v18;

    v20 = [v6 objectForKeyedSubscript:@"gsTokenIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    gsTokenIdentifier = v8->_gsTokenIdentifier;
    v8->_gsTokenIdentifier = v21;

    v23 = [v6 objectForKeyedSubscript:@"headers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }

    headers = v8->_headers;
    v8->_headers = v24;

    v26 = [v6 objectForKeyedSubscript:@"includeAuthKitTokens"];
    if (objc_opt_respondsToSelector())
    {
      v27 = [v6 objectForKeyedSubscript:@"includeAuthKitTokens"];
      v8->_includeAuthKitTokens = [v27 BOOLValue];
    }
    else
    {
      v8->_includeAuthKitTokens = 0;
    }

    v28 = [v6 objectForKeyedSubscript:@"includeiCloudTokens"];
    if (objc_opt_respondsToSelector())
    {
      v29 = [v6 objectForKeyedSubscript:@"includeiCloudTokens"];
      v8->_includeiCloudTokens = [v29 BOOLValue];
    }
    else
    {
      v8->_includeiCloudTokens = 0;
    }

    v30 = [v6 objectForKeyedSubscript:@"method"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }

    method = v8->_method;
    v8->_method = v31;

    v33 = [v6 objectForKeyedSubscript:@"requiresCellularAccess"];
    if (objc_opt_respondsToSelector())
    {
      v34 = [v6 objectForKeyedSubscript:@"requiresCellularAccess"];
      v8->_requiresCellularAccess = [v34 BOOLValue];
    }
    else
    {
      v8->_requiresCellularAccess = 0;
    }

    v35 = [v6 objectForKeyedSubscript:@"signatureData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v36 = v35;
    }
    else {
      v36 = 0;
    }

    signatureData = v8->_signatureData;
    v8->_signatureData = v36;

    v38 = [v6 objectForKeyedSubscript:@"usePrimaryKeychain"];
    if (objc_opt_respondsToSelector())
    {
      v39 = [v6 objectForKeyedSubscript:@"usePrimaryKeychain"];
      v8->_usePrimaryKeychain = [v39 BOOLValue];
    }
    else
    {
      v8->_usePrimaryKeychain = 0;
    }

    v40 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v41 = v40;
    }
    else {
      id v41 = 0;
    }

    if (v41)
    {
      uint64_t v42 = [NSURL URLWithString:v41];
      URL = v8->_URL;
      v8->_URL = (NSURL *)v42;
    }
  }

  return v8;
}

- (id)runAction
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)AMSUIWebNetworkAction;
  id v3 = [(AMSUIWebAction *)&v73 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    v8 = [(AMSUIWebNetworkAction *)self URL];
    v9 = AMSLogableURL();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v79 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running network action for URL: %{public}@", buf, 0x20u);
  }
  v10 = [(AMSUIWebNetworkAction *)self URL];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    v40 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v41 = [v40 promiseWithError:v24];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263F089E0]);
    v13 = [(AMSUIWebNetworkAction *)self URL];
    v14 = (void *)[v12 initWithURL:v13];

    uint64_t v15 = [(AMSUIWebNetworkAction *)self body];
    v16 = [v15 dataUsingEncoding:4];
    [v14 setHTTPBody:v16];

    uint64_t v17 = [(AMSUIWebNetworkAction *)self method];
    v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = @"GET";
    }
    [v14 setHTTPMethod:v19];

    v20 = [(AMSUIWebNetworkAction *)self headers];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke;
    v71[3] = &unk_2643E4488;
    id v21 = v14;
    id v72 = v21;
    [v20 enumerateKeysAndObjectsUsingBlock:v71];

    v22 = [(AMSUIWebAction *)self context];
    v23 = [v22 additionalHeaders];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2;
    v69[3] = &unk_2643E46D0;
    id v24 = v21;
    id v70 = v24;
    [v23 enumerateKeysAndObjectsUsingBlock:v69];

    if ([(AMSUIWebNetworkAction *)self includeAuthKitTokens])
    {
      objc_msgSend(v24, "ak_addClientInfoHeader");
      objc_msgSend(v24, "ak_addPRKRequestHeader");
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2050000000;
      v25 = (void *)getAKAppleIDServerResourceLoadDelegateClass_softClass;
      uint64_t v77 = getAKAppleIDServerResourceLoadDelegateClass_softClass;
      if (!getAKAppleIDServerResourceLoadDelegateClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAKAppleIDServerResourceLoadDelegateClass_block_invoke;
        v79 = &unk_2643E33D8;
        v80 = &v74;
        __getAKAppleIDServerResourceLoadDelegateClass_block_invoke((uint64_t)buf);
        v25 = (void *)v75[3];
      }
      v26 = v25;
      _Block_object_dispose(&v74, 8);
      id v27 = objc_alloc_init(v26);
      [v27 setShouldSendSigningHeaders:1];
      [v27 signRequest:v24];
    }
    if ([(AMSUIWebNetworkAction *)self includeiCloudTokens])
    {
      v28 = [(AMSUIWebAction *)self context];
      v29 = [v28 account];
      v30 = [v29 accountStore];
      v31 = [(AMSUIWebAction *)self context];
      v32 = [v31 account];
      v33 = objc_msgSend(v30, "ams_iCloudAccountForAccount:", v32);

      v34 = [v33 accountStore];
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2020000000;
      v35 = (void **)getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr;
      uint64_t v77 = getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr;
      if (!getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke;
        v79 = &unk_2643E33D8;
        v80 = &v74;
        __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke((uint64_t)buf);
        v35 = (void **)v75[3];
      }
      _Block_object_dispose(&v74, 8);
      if (!v35) {
        getAIDAServiceTypeCloud_cold_1();
      }
      v36 = *v35;
      id v68 = 0;
      id v37 = v36;
      v38 = objc_msgSend(v34, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v33, v37, &v68);
      id v39 = v68;

      if (v39 || !v38)
      {
        uint64_t v42 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v42)
        {
          uint64_t v42 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v43 = [v42 OSLogObject];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = objc_opt_class();
          objc_super v45 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v45;
          *(_WORD *)&buf[22] = 2114;
          v79 = v39;
          _os_log_impl(&dword_21C134000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch GS token. %{public}@", buf, 0x20u);
        }
      }
      else
      {
        [v24 setValue:v38 forHTTPHeaderField:*MEMORY[0x263F27890]];
      }
    }
    id v46 = objc_alloc(MEMORY[0x263F27ED8]);
    v47 = [(AMSUIWebAction *)self context];
    v48 = [v47 bag];
    v49 = (void *)[v46 initWithBag:v48];

    v50 = [(AMSUIWebNetworkAction *)self account];
    [v49 setAccount:v50];

    v51 = [(AMSUIWebAction *)self context];
    v52 = [v51 clientInfo];
    [v49 setClientInfo:v52];

    [v49 setEnableRemoteSecuritySigning:1];
    v53 = AMSLogKey();
    [v49 setLogUUID:v53];

    v54 = [(AMSUIWebNetworkAction *)self gsTokenIdentifier];
    [v49 setGsTokenIdentifier:v54];

    id v55 = objc_alloc_init(MEMORY[0x263F27C98]);
    objc_msgSend(v55, "setPurpose:", -[AMSUIWebNetworkAction usePrimaryKeychain](self, "usePrimaryKeychain") ^ 1);
    objc_msgSend(v55, "setStyle:", objc_msgSend(MEMORY[0x263F27C98], "preferredAttestationStyle"));
    [v49 setKeychainOptions:v55];
    v56 = [v49 requestByEncodingRequest:v24 parameters:0];
    v57 = [(AMSUIWebNetworkAction *)self signatureData];
    v58 = v57;
    if (v57)
    {
      v59 = [v57 dataUsingEncoding:4];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_56;
      v66[3] = &unk_2643E44D8;
      v66[4] = self;
      id v67 = v59;
      id v60 = v59;
      uint64_t v61 = [v56 thenWithBlock:v66];

      v56 = (void *)v61;
    }
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2_63;
    v65[3] = &unk_2643E54D0;
    v65[4] = self;
    v62 = [v56 thenWithBlock:v65];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_3_66;
    v64[3] = &unk_2643E3758;
    v64[4] = self;
    id v41 = [v62 thenWithBlock:v64];
  }
  return v41;
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) context];
  v5 = [v4 mescalSession];
  uint64_t v6 = [v5 signData:*(void *)(a1 + 40)];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_2_57;
  v18[3] = &unk_2643E5480;
  id v7 = v3;
  id v19 = v7;
  [v6 addSuccessBlock:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_3;
  v17[3] = &unk_2643E3570;
  v17[4] = *(void *)(a1 + 32);
  [v6 addErrorBlock:v17];
  id v8 = objc_alloc_init(MEMORY[0x263F27E10]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __34__AMSUIWebNetworkAction_runAction__block_invoke_60;
  v14[3] = &unk_2643E54A8;
  id v9 = v8;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  [v6 addFinishBlock:v14];
  BOOL v11 = v16;
  id v12 = v9;

  return v12;
}

void __34__AMSUIWebNetworkAction_runAction__block_invoke_2_57(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base64EncodedStringWithOptions:0];
  [v2 setValue:v3 forHTTPHeaderField:*MEMORY[0x263F278F0]];
}

void __34__AMSUIWebNetworkAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 32) context];
    id v8 = [v7 logKey];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sign a request: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __34__AMSUIWebNetworkAction_runAction__block_invoke_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_2_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) account];

  if (v4) {
    objc_msgSend(v3, "ak_addClientInfoHeader");
  }
  v5 = (void *)[v3 mutableCopy];
  uint64_t v6 = [*(id *)(a1 + 32) context];
  id v7 = [v6 actionDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [*(id *)(a1 + 32) context];
    uint64_t v10 = [v9 actionDelegate];
    [v10 action:*(void *)(a1 + 32) didEncodeNetworkRequest:v5];
  }
  __int16 v11 = [*(id *)(a1 + 32) _createSession];
  id v12 = [v11 dataTaskPromiseWithRequest:v5];

  return v12;
}

id __34__AMSUIWebNetworkAction_runAction__block_invoke_3_66(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 context];
  v5 = [v4 account];
  objc_msgSend(v5, "ams_addCookiesForResult:", v3);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [v3 object];
  char v8 = objc_msgSend(v7, "ams_sanitizeServerObject");
  [v6 setObject:v8 forKeyedSubscript:@"body"];

  int v9 = [v3 responseHeaders];
  [v6 setObject:v9 forKeyedSubscript:@"headers"];

  uint64_t v10 = NSNumber;
  uint64_t v11 = [v3 responseStatusCode];

  id v12 = [v10 numberWithInteger:v11];
  [v6 setObject:v12 forKeyedSubscript:@"status"];

  __int16 v13 = [MEMORY[0x263F27E10] promiseWithResult:v6];

  return v13;
}

- (id)_createSession
{
  id v3 = [(AMSUIWebAction *)self context];
  v4 = [v3 URLSession];

  if ([(AMSUIWebNetworkAction *)self requiresCellularAccess])
  {
    v5 = (void *)MEMORY[0x263F08C00];
    id v6 = [(AMSUIWebAction *)self context];
    id v7 = [v6 clientInfo];
    char v8 = [(AMSUIWebAction *)self context];
    int v9 = [v8 bag];
    uint64_t v10 = objc_msgSend(v5, "ams_configurationWithProcessInfo:bag:", v7, v9);

    objc_msgSend(v10, "set_CTDataConnectionServiceType:", *MEMORY[0x263F02E10]);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F27EF0]) initWithConfiguration:v10];

    v4 = (void *)v11;
  }
  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (void)setGsTokenIdentifier:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (BOOL)includeAuthKitTokens
{
  return self->_includeAuthKitTokens;
}

- (void)setIncludeAuthKitTokens:(BOOL)a3
{
  self->_includeAuthKitTokens = a3;
}

- (BOOL)includeiCloudTokens
{
  return self->_includeiCloudTokens;
}

- (void)setIncludeiCloudTokens:(BOOL)a3
{
  self->_includeiCloudTokens = a3;
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (BOOL)requiresCellularAccess
{
  return self->_requiresCellularAccess;
}

- (void)setRequiresCellularAccess:(BOOL)a3
{
  self->_requiresCellularAccess = a3;
}

- (NSString)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)usePrimaryKeychain
{
  return self->_usePrimaryKeychain;
}

- (void)setUsePrimaryKeychain:(BOOL)a3
{
  self->_usePrimaryKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end