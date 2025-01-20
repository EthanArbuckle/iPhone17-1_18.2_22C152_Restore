@interface AMSUIWebFetchMetricsIdentifierAction
- (ACAccount)account;
- (AMSUIWebFetchMetricsIdentifierAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)crossDeviceSync;
- (BOOL)generateEventFields;
- (NSString)bagNamespace;
- (NSString)bagProfile;
- (NSString)bagProfileVersion;
- (NSString)identifierKey;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setBagNamespace:(id)a3;
- (void)setBagProfile:(id)a3;
- (void)setBagProfileVersion:(id)a3;
- (void)setCrossDeviceSync:(BOOL)a3;
- (void)setGenerateEventFields:(BOOL)a3;
- (void)setIdentifierKey:(id)a3;
@end

@implementation AMSUIWebFetchMetricsIdentifierAction

- (AMSUIWebFetchMetricsIdentifierAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)AMSUIWebFetchMetricsIdentifierAction;
  v8 = [(AMSUIWebAction *)&v29 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v10 = [v7 iTunesAccountFromJSAccount:v9];
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

    v12 = [v6 objectForKeyedSubscript:@"bagNamespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }

    bagNamespace = v8->_bagNamespace;
    v8->_bagNamespace = v13;

    v15 = [v6 objectForKeyedSubscript:@"bagProfile"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }

    bagProfile = v8->_bagProfile;
    v8->_bagProfile = v16;

    v18 = [v6 objectForKeyedSubscript:@"bagProfileVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }

    bagProfileVersion = v8->_bagProfileVersion;
    v8->_bagProfileVersion = v19;

    v21 = [v6 objectForKeyedSubscript:@"crossDeviceSync"];
    if (objc_opt_respondsToSelector())
    {
      v22 = [v6 objectForKeyedSubscript:@"crossDeviceSync"];
      v8->_crossDeviceSync = [v22 BOOLValue];
    }
    else
    {
      v8->_crossDeviceSync = 0;
    }

    v23 = [v6 objectForKeyedSubscript:@"generateEventFields"];
    if (objc_opt_respondsToSelector())
    {
      v24 = [v6 objectForKeyedSubscript:@"generateEventFields"];
      v8->_generateEventFields = [v24 BOOLValue];
    }
    else
    {
      v8->_generateEventFields = 0;
    }

    v25 = [v6 objectForKeyedSubscript:@"identifierKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }

    identifierKey = v8->_identifierKey;
    v8->_identifierKey = v26;
  }
  return v8;
}

- (id)runAction
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebFetchMetricsIdentifierAction;
  id v3 = [(AMSUIWebAction *)&v45 runAction];
  v4 = [(AMSUIWebFetchMetricsIdentifierAction *)self bagNamespace];
  if (v4)
  {
    BOOL v5 = [(AMSUIWebFetchMetricsIdentifierAction *)self crossDeviceSync];
    BOOL v6 = [(AMSUIWebFetchMetricsIdentifierAction *)self generateEventFields];
    id v7 = [(AMSUIWebFetchMetricsIdentifierAction *)self identifierKey];
    if (v7)
    {
      BOOL v35 = v6;
      v8 = [(AMSUIWebAction *)self context];
      v9 = [(AMSUIWebFetchMetricsIdentifierAction *)self account];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v8 account];
      }
      v36 = v11;
      BOOL v37 = v5;

      v15 = [(AMSUIWebFetchMetricsIdentifierAction *)self bagProfile];
      uint64_t v16 = [(AMSUIWebFetchMetricsIdentifierAction *)self bagProfileVersion];
      v17 = (void *)v16;
      if (!v15) {
        goto LABEL_11;
      }
      if (!v16) {
        goto LABEL_11;
      }
      v18 = (void *)v16;
      v19 = (void *)MEMORY[0x263F27B28];
      v20 = [v8 clientInfo];
      v21 = v19;
      v17 = v18;
      uint64_t v22 = [v21 bagForProfile:v15 profileVersion:v18 processInfo:v20];

      v38 = (void *)v22;
      if (!v22)
      {
LABEL_11:
        v38 = [v8 bag];
      }
      v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v23)
      {
        v23 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v17;
        uint64_t v25 = objc_opt_class();
        v26 = AMSLogKey();
        AMSHashIfNeeded();
        v27 = v34 = v8;
        uint64_t v28 = AMSHashIfNeeded();
        objc_super v29 = (void *)v28;
        *(_DWORD *)buf = 138544898;
        v30 = @"false";
        uint64_t v47 = v25;
        __int16 v48 = 2114;
        if (v37) {
          v30 = @"true";
        }
        v49 = v26;
        __int16 v50 = 2114;
        v51 = v27;
        __int16 v52 = 2114;
        uint64_t v53 = v28;
        __int16 v54 = 2114;
        v55 = v4;
        __int16 v56 = 2114;
        v57 = v7;
        v17 = v33;
        __int16 v58 = 2114;
        v59 = v30;
        _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting (account: %{public}@; bag: %{public}@; bagNamespace: %{public}@; identifierK"
          "ey: %{public}@; crossDeviceSync: %{public}@)",
          buf,
          0x48u);

        v8 = v34;
      }

      v31 = [MEMORY[0x263F27D60] identifierStoreWithAccount:v36 bagNamespace:v4 bag:v38];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke;
      v41[3] = &unk_2643E4E60;
      id v42 = v7;
      BOOL v43 = v37;
      BOOL v44 = v35;
      v13 = [v31 thenWithBlock:v41];

      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_2;
      v40[3] = &unk_2643E3570;
      v40[4] = self;
      [v13 addErrorBlock:v40];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_53;
      v39[3] = &unk_2643E4E88;
      v39[4] = self;
      [v13 addSuccessBlock:v39];
    }
    else
    {
      v14 = (void *)MEMORY[0x263F27E10];
      v8 = AMSError();
      v13 = [v14 promiseWithError:v8];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F27E10];
    id v7 = AMSError();
    v13 = [v12 promiseWithError:v7];
  }

  return v13;
}

id __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27D58] keyWithName:*(void *)(a1 + 32) crossDeviceSync:*(unsigned __int8 *)(a1 + 40)];
  BOOL v5 = [v3 identifierForKey:v4];
  BOOL v6 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v5, @"identifier", 0);
  if (*(unsigned char *)(a1 + 41))
  {
    v15[0] = v4;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v8 = [v3 generateEventFieldsForKeys:v7];

    v13 = @"eventFields";
    v14 = v8;
    v9 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v10 = objc_msgSend(v6, "ams_dictionaryByAddingEntriesFromDictionary:", v9);

    BOOL v6 = (void *)v10;
  }
  id v11 = [MEMORY[0x263F27E10] promiseWithResult:v6];

  return v11;
}

void __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = AMSLogKey();
    id v7 = AMSHashIfNeeded();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failure (error: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
}

void __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success (result: %{public}@)", (uint8_t *)&v7, 0x20u);
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)bagNamespace
{
  return self->_bagNamespace;
}

- (void)setBagNamespace:(id)a3
{
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (void)setBagProfile:(id)a3
{
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

- (void)setBagProfileVersion:(id)a3
{
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (BOOL)generateEventFields
{
  return self->_generateEventFields;
}

- (void)setGenerateEventFields:(BOOL)a3
{
  self->_generateEventFields = a3;
}

- (NSString)identifierKey
{
  return self->_identifierKey;
}

- (void)setIdentifierKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierKey, 0);
  objc_storeStrong((id *)&self->_bagProfileVersion, 0);
  objc_storeStrong((id *)&self->_bagProfile, 0);
  objc_storeStrong((id *)&self->_bagNamespace, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end