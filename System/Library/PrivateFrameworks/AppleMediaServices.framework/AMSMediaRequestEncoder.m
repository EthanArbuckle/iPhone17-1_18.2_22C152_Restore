@interface AMSMediaRequestEncoder
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSMediaRequestEncoder)initWithTokenService:(id)a3 bag:(id)a4;
- (AMSMediaTokenServiceProtocol)tokenService;
- (AMSProcessInfo)clientInfo;
- (AMSResponseDecoding)responseDecoder;
- (AMSURLRequestEncoder)requestEncoder;
- (BOOL)URLKnownToBeTrusted;
- (BOOL)alwaysIncludeAuthKitHeaders;
- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders;
- (BOOL)disableAccountMediaTypeComponent;
- (BOOL)disableResponseDecoding;
- (BOOL)excludeIdentifierHeadersForAccount;
- (NSString)gsTokenIdentifier;
- (NSString)logKey;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
- (id)requestWithComponents:(id)a3;
- (id)requestWithURL:(id)a3;
- (int64_t)requestEncoding;
- (void)setAccount:(id)a3;
- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3;
- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3;
- (void)setClientInfo:(id)a3;
- (void)setDisableAccountMediaTypeComponent:(BOOL)a3;
- (void)setDisableResponseDecoding:(BOOL)a3;
- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3;
- (void)setGsTokenIdentifier:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setRequestEncoding:(int64_t)a3;
- (void)setResponseDecoder:(id)a3;
- (void)setURLKnownToBeTrusted:(BOOL)a3;
@end

@implementation AMSMediaRequestEncoder

void __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = [v4 tokenString];
    v6 = [@"Bearer " stringByAppendingString:v5];

    [v3 setValue:v6 forHTTPHeaderField:0x1EDCB9CC8];
  }
  v7 = [MEMORY[0x1E4F28F80] processInfo];
  v8 = [v7 processName];
  int v9 = [v8 isEqualToString:@"mapspushd"];

  if (v9)
  {
    v10 = +[AMSLogConfig sharedMediaConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = [v3 properties];
      v15 = [v14 logUUID];
      *(_DWORD *)v40 = 138543618;
      *(void *)&v40[4] = v12;
      *(_WORD *)&v40[12] = 2114;
      *(void *)&v40[14] = v15;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stripping cookies for mapspushd request", v40, 0x16u);
    }
    [v3 setValue:0 forHTTPHeaderField:@"Cookie"];
  }
  if (*(void *)(a1 + 48) || (v31 = *(void **)(a1 + 32)) == 0)
  {
    v16 = +[AMSLogConfig sharedMediaConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v18 = objc_opt_class();
    id v19 = v18;
    v20 = [v3 properties];
    v21 = [v20 logUUID];
    uint64_t v22 = *(void *)(a1 + 48);
    *(_DWORD *)v40 = 138543874;
    *(void *)&v40[4] = v18;
    *(_WORD *)&v40[12] = 2114;
    *(void *)&v40[14] = v21;
    *(_WORD *)&v40[22] = 2114;
    uint64_t v41 = v22;
    v23 = "%{public}@: [%{public}@] We did not receive a media token. We will continue regardless. %{public}@";
    v24 = v17;
    uint32_t v25 = 32;
    goto LABEL_14;
  }
  char v32 = [v31 isValid];
  uint64_t v33 = +[AMSLogConfig sharedMediaConfig];
  v16 = (void *)v33;
  if ((v32 & 1) == 0)
  {
    if (!v33)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v39 = objc_opt_class();
    id v19 = v39;
    v20 = [v3 properties];
    v21 = [v20 logUUID];
    *(_DWORD *)v40 = 138543618;
    *(void *)&v40[4] = v39;
    *(_WORD *)&v40[12] = 2114;
    *(void *)&v40[14] = v21;
    v23 = "%{public}@: [%{public}@] We received an invalid media token. Will continue regardless.";
    v24 = v17;
    uint32_t v25 = 22;
LABEL_14:
    _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, v23, v40, v25);

LABEL_15:
    v26 = [v3 properties];
    v27 = v26;
    uint64_t v28 = 0;
    goto LABEL_16;
  }
  if (!v33)
  {
    v16 = +[AMSLogConfig sharedConfig];
  }
  v34 = [v16 OSLogObject];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_opt_class();
    id v36 = v35;
    v37 = [v3 properties];
    v38 = [v37 logUUID];
    *(_DWORD *)v40 = 138543618;
    *(void *)&v40[4] = v35;
    *(_WORD *)&v40[12] = 2114;
    *(void *)&v40[14] = v38;
    _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We received a valid media token.", v40, 0x16u);
  }
  v26 = [v3 properties];
  v27 = v26;
  uint64_t v28 = 1;
LABEL_16:
  objc_msgSend(v26, "setMaxRetryCount:", v28, *(_OWORD *)v40, *(void *)&v40[16], v41);

  v29 = [v3 properties];
  v30 = [v29 userInfo];
  [v30 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isMediaRequest"];

  [*(id *)(a1 + 56) finishWithResult:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_tokenService, 0);
}

- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setAlwaysIncludeMMeClientInfoAndDeviceHeaders:v3];
}

- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setAlwaysIncludeAuthKitHeaders:v3];
}

- (void)setGsTokenIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v5 setGsTokenIdentifier:v4];
}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setDisableResponseDecoding:v3];
}

- (AMSMediaRequestEncoder)initWithTokenService:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaRequestEncoder;
  int v9 = [(AMSMediaRequestEncoder *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenService, a3);
    v11 = [[AMSURLRequestEncoder alloc] initWithBag:v8];
    requestEncoder = v10->_requestEncoder;
    v10->_requestEncoder = v11;
  }
  return v10;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v5 setAccount:v4];
}

- (void)setClientInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v5 setClientInfo:v4];
}

void __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    int v9 = (void *)[v8 copy];
  }
  else
  {
    int v9 = 0;
  }
  v10 = [*(id *)(a1 + 32) requestEncoder];
  v11 = [v10 requestByEncodingRequest:*(void *)(a1 + 40) parameters:*(void *)(a1 + 48)];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2;
  v20[3] = &unk_1E559F028;
  id v21 = *(id *)(a1 + 56);
  [v11 addErrorBlock:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_3;
  v15[3] = &unk_1E55A3BA8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v12;
  id v18 = v6;
  id v19 = *(id *)(a1 + 56);
  id v13 = v6;
  id v14 = v9;
  [v11 addSuccessBlock:v15];
}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (void)setResponseDecoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v5 setResponseDecoder:v4];
}

- (void)setLogKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v5 setLogUUID:v4];
}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setUrlKnownToBeTrusted:v3];
}

- (id)requestWithComponents:(id)a3
{
  id v4 = [a3 URL];
  id v5 = [(AMSMediaRequestEncoder *)self requestWithURL:v4];

  return v5;
}

- (id)requestWithURL:(id)a3
{
  id v4 = [MEMORY[0x1E4F18DA8] requestWithURL:a3];
  id v5 = [(AMSMediaRequestEncoder *)self requestByEncodingRequest:v4 parameters:0];

  return v5;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AMSMutablePromise);
  int v9 = [(AMSMediaRequestEncoder *)self tokenService];
  v10 = [v9 fetchMediaToken];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  v17[3] = &unk_1E55A3BD0;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  v11 = v8;
  v20 = v11;
  id v12 = v7;
  id v13 = v6;
  [v10 addFinishBlock:v17];

  id v14 = v20;
  v15 = v11;

  return v15;
}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setExcludeIdentifierHeadersForAccount:v3];
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  BOOL v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (ACAccount)account
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  BOOL v3 = [v2 account];

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  BOOL v3 = [v2 bag];

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  BOOL v3 = [v2 clientInfo];

  return (AMSProcessInfo *)v3;
}

- (BOOL)disableResponseDecoding
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 disableResponseDecoding];

  return v3;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 excludeIdentifierHeadersForAccount];

  return v3;
}

- (BOOL)alwaysIncludeAuthKitHeaders
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 alwaysIncludeAuthKitHeaders];

  return v3;
}

- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 alwaysIncludeMMeClientInfoAndDeviceHeaders];

  return v3;
}

- (NSString)gsTokenIdentifier
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 gsTokenIdentifier];

  return (NSString *)v3;
}

- (NSString)logKey
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 logUUID];

  return (NSString *)v3;
}

- (int64_t)requestEncoding
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  int64_t v3 = [v2 requestEncoding];

  return v3;
}

- (AMSResponseDecoding)responseDecoder
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  int64_t v3 = [v2 responseDecoder];

  return (AMSResponseDecoding *)v3;
}

- (BOOL)URLKnownToBeTrusted
{
  v2 = [(AMSMediaRequestEncoder *)self requestEncoder];
  char v3 = [v2 urlKnownToBeTrusted];

  return v3;
}

- (void)setRequestEncoding:(int64_t)a3
{
  id v4 = [(AMSMediaRequestEncoder *)self requestEncoder];
  [v4 setRequestEncoding:a3];
}

uint64_t __62__AMSMediaRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)disableAccountMediaTypeComponent
{
  return self->_disableAccountMediaTypeComponent;
}

- (void)setDisableAccountMediaTypeComponent:(BOOL)a3
{
  self->_disableAccountMediaTypeComponent = a3;
}

@end