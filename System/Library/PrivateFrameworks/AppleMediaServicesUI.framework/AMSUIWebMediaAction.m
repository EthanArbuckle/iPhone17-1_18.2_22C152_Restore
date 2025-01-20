@interface AMSUIWebMediaAction
- (AMSUIWebMediaAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)bundleIdentifiers;
- (NSArray)includedResultKeys;
- (NSArray)itemIdentifiers;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)urlString;
- (id)_runMediaRequestWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5;
- (id)_runMediaRequestWithURL:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5;
- (id)runAction;
- (int64_t)type;
- (void)setBundleIdentifiers:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setIncludedResultKeys:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrlString:(id)a3;
@end

@implementation AMSUIWebMediaAction

- (AMSUIWebMediaAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebMediaAction;
  v7 = [(AMSUIWebAction *)&v27 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9) {
      objc_storeStrong((id *)&v7->_urlString, v9);
    }
    v10 = [v6 objectForKeyedSubscript:@"type"];
    if (objc_opt_respondsToSelector()) {
      v7->_type = [v10 integerValue];
    }
    v11 = [v6 objectForKeyedSubscript:@"bundleIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    bundleIdentifiers = v7->_bundleIdentifiers;
    v7->_bundleIdentifiers = v12;

    v14 = [v6 objectForKeyedSubscript:@"clientIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    if (v15) {
      v16 = v15;
    }
    else {
      v16 = @"appstore";
    }
    objc_storeStrong((id *)&v7->_clientIdentifier, v16);

    v17 = [v6 objectForKeyedSubscript:@"clientVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    if (v18) {
      v19 = v18;
    }
    else {
      v19 = @"1";
    }
    objc_storeStrong((id *)&v7->_clientVersion, v19);

    v20 = [v6 objectForKeyedSubscript:@"itemIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    itemIdentifiers = v7->_itemIdentifiers;
    v7->_itemIdentifiers = v21;

    v23 = [v6 objectForKeyedSubscript:@"includedResultKeys"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }

    includedResultKeys = v7->_includedResultKeys;
    v7->_includedResultKeys = v24;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebMediaAction;
  id v3 = [(AMSUIWebAction *)&v17 runAction];
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
    v8 = [(AMSUIWebMediaAction *)self bundleIdentifiers];
    id v9 = [(AMSUIWebMediaAction *)self itemIdentifiers];
    *(_DWORD *)buf = 138544130;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running media action with identifiers: %@ %@", buf, 0x2Au);
  }
  v10 = [(AMSUIWebMediaAction *)self urlString];

  if (v10)
  {
    v11 = [(AMSUIWebMediaAction *)self urlString];
    v12 = [(AMSUIWebMediaAction *)self clientIdentifier];
    v13 = [(AMSUIWebMediaAction *)self clientVersion];
    v14 = [(AMSUIWebMediaAction *)self _runMediaRequestWithURL:v11 clientIdentifier:v12 clientVersion:v13];
  }
  else
  {
    int64_t v15 = [(AMSUIWebMediaAction *)self type];
    v11 = [(AMSUIWebMediaAction *)self clientIdentifier];
    v12 = [(AMSUIWebMediaAction *)self clientVersion];
    v14 = [(AMSUIWebMediaAction *)self _runMediaRequestWithType:v15 clientIdentifier:v11 clientVersion:v12];
  }

  return v14;
}

- (id)_runMediaRequestWithURL:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5
{
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F08BA0];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithString:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F27D20]);
    v12 = [(AMSUIWebAction *)self context];
    v13 = [v12 bag];
    v14 = (void *)[v11 initWithClientIdentifier:v7 bag:v13];

    id v15 = objc_alloc(MEMORY[0x263F27D00]);
    v16 = [(AMSUIWebAction *)self context];
    objc_super v17 = [v16 bag];
    v18 = (void *)[v15 initWithTokenService:v14 bag:v17];

    id v19 = objc_alloc_init(MEMORY[0x263F27D08]);
    [v18 setResponseDecoder:v19];

    __int16 v20 = [(AMSUIWebAction *)self context];
    v21 = [v20 account];
    [v18 setAccount:v21];

    __int16 v22 = AMSLogKey();
    [v18 setLogKey:v22];

    id v23 = objc_alloc_init(MEMORY[0x263F27EF0]);
    __int16 v24 = (void *)[objc_alloc(MEMORY[0x263F27CF8]) initWithTokenService:v14];
    [v23 setProtocolHandler:v24];

    v25 = [v18 requestWithComponents:v10];
    uint64_t v26 = [v23 dataTaskPromiseWithRequestPromise:v25];
    id v27 = objc_alloc_init(MEMORY[0x263F27E10]);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __78__AMSUIWebMediaAction__runMediaRequestWithURL_clientIdentifier_clientVersion___block_invoke;
    v32[3] = &unk_2643E5408;
    id v28 = v27;
    id v33 = v28;
    [v26 addFinishBlock:v32];
  }
  else
  {
    v29 = (void *)MEMORY[0x263F27E10];
    v30 = AMSError();
    id v28 = [v29 promiseWithError:v30];
  }
  return v28;
}

void __78__AMSUIWebMediaAction__runMediaRequestWithURL_clientIdentifier_clientVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v10;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x263F27D10]) initWithResult:v10];
  }
  id v7 = v6;
  v8 = *(void **)(a1 + 32);
  id v9 = [v6 responseDictionary];
  [v8 finishWithResult:v9 error:v5];
}

- (id)_runMediaRequestWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x263F27E10]);
  id v7 = objc_alloc(MEMORY[0x263F27D18]);
  int64_t v8 = [(AMSUIWebMediaAction *)self type];
  id v9 = [(AMSUIWebMediaAction *)self clientIdentifier];
  id v10 = [(AMSUIWebMediaAction *)self clientVersion];
  id v11 = [(AMSUIWebAction *)self context];
  v12 = [v11 bag];
  v13 = (void *)[v7 initWithType:v8 clientIdentifier:v9 clientVersion:v10 bag:v12];

  v14 = [(AMSUIWebAction *)self context];
  id v15 = [v14 account];
  [v13 setAccount:v15];

  v16 = [(AMSUIWebMediaAction *)self bundleIdentifiers];
  [v13 setBundleIdentifiers:v16];

  objc_super v17 = [(AMSUIWebMediaAction *)self itemIdentifiers];
  [v13 setItemIdentifiers:v17];

  v18 = [(AMSUIWebMediaAction *)self includedResultKeys];
  [v13 setIncludedResultKeys:v18];

  id v19 = [v13 perform];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __79__AMSUIWebMediaAction__runMediaRequestWithType_clientIdentifier_clientVersion___block_invoke;
  v22[3] = &unk_2643E5430;
  id v20 = v6;
  id v23 = v20;
  [v19 addFinishBlock:v22];

  return v20;
}

void __79__AMSUIWebMediaAction__runMediaRequestWithType_clientIdentifier_clientVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 responseDictionary];
  [v4 finishWithResult:v6 error:v5];
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
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

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (void)setIncludedResultKeys:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end