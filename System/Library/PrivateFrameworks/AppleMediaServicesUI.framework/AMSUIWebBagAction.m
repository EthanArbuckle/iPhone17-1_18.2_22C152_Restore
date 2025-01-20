@interface AMSUIWebBagAction
- (ACAccount)account;
- (AMSUIWebBagAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)requestedKeys;
- (NSString)profile;
- (NSString)profileVersion;
- (id)runAction;
- (void)_fetchValuesForKeys:(id)a3 bag:(id)a4 startingAtIndex:(int64_t)a5 valuesArray:(id)a6 completion:(id)a7;
- (void)setAccount:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
- (void)setRequestedKeys:(id)a3;
@end

@implementation AMSUIWebBagAction

- (AMSUIWebBagAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebBagAction;
  v7 = [(AMSUIWebAction *)&v46 initWithJSObject:v6 context:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(AMSUIWebAction *)v7 context];
    v10 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v11 = [v9 iTunesAccountFromJSAccount:v10];
    account = v8->_account;
    v8->_account = (ACAccount *)v11;

    v13 = [v6 objectForKeyedSubscript:@"profile"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }

    profile = v8->_profile;
    v8->_profile = v14;

    v16 = [v6 objectForKeyedSubscript:@"profileVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }

    profileVersion = v8->_profileVersion;
    v8->_profileVersion = v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = [v6 objectForKeyedSubscript:@"keys"];
    objc_opt_class();
    id v38 = v6;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v22 = v21;
    uint64_t v41 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v43;
      v39 = v19;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v43 != v40) {
            objc_enumerationMutation(v22);
          }
          id v24 = *(id *)(*((void *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v25 = v24;
          }
          else {
            id v25 = 0;
          }

          v26 = [v25 objectForKeyedSubscript:@"key"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v27 = v26;
          }
          else {
            id v27 = 0;
          }

          v28 = [v25 objectForKeyedSubscript:@"type"];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v29 = [v28 integerValue];
            if (v27) {
              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v29 = 4;
            if (v27)
            {
LABEL_24:
              v30 = objc_alloc_init(AMSUIWebBagKey);
              [(AMSUIWebBagKey *)v30 setKey:v27];
              [(AMSUIWebBagKey *)v30 setValueType:v29];
              [(NSArray *)v19 addObject:v30];
              goto LABEL_31;
            }
          }
          v30 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
          if (!v30)
          {
            v30 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v31 = [(AMSUIWebBagKey *)v30 OSLogObject];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = v8;
            id v33 = v22;
            uint64_t v34 = objc_opt_class();
            v35 = AMSLogKey();
            *(_DWORD *)buf = 138543874;
            uint64_t v48 = v34;
            id v22 = v33;
            __int16 v49 = 2114;
            v50 = v35;
            __int16 v51 = 2114;
            id v52 = v25;
            _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown bag key in def: %{public}@", buf, 0x20u);

            v8 = v32;
            v19 = v39;
          }

LABEL_31:
        }
        uint64_t v41 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v41);
    }

    requestedKeys = v8->_requestedKeys;
    v8->_requestedKeys = v19;

    id v6 = v38;
  }

  return v8;
}

- (id)runAction
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)AMSUIWebBagAction;
  id v3 = [(AMSUIWebAction *)&v43 runAction];
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  v5 = [(AMSUIWebBagAction *)self requestedKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(AMSUIWebBagAction *)self profile];
    uint64_t v8 = [(AMSUIWebBagAction *)self profileVersion];
    v9 = (void *)v8;
    v36 = v4;
    if (!v7 || !v8)
    {
      v10 = [(AMSUIWebAction *)self context];
      uint64_t v11 = [v10 bag];
      uint64_t v12 = [v11 profile];

      v13 = [(AMSUIWebAction *)self context];
      v14 = [v13 bag];
      uint64_t v15 = [v14 profileVersion];

      v9 = (void *)v15;
      v7 = (void *)v12;
    }
    v16 = (void *)MEMORY[0x263F27B28];
    v17 = [(AMSUIWebAction *)self context];
    v18 = [v17 clientInfo];
    v35 = [v16 bagForProfile:v7 profileVersion:v9 processInfo:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F27D80]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v20 = [(AMSUIWebBagAction *)self requestedKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v26 = [v25 key];
          objc_msgSend(v19, "addBagKey:valueType:", v26, objc_msgSend(v25, "valueType"));
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v22);
    }

    [MEMORY[0x263F27B40] registerBagKeySet:v19 forProfile:v7 profileVersion:v9];
    id v27 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v27)
    {
      id v27 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      v30 = AMSLogKey();
      v31 = [(AMSUIWebBagAction *)self requestedKeys];
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v29;
      __int16 v46 = 2114;
      v47 = v30;
      __int16 v48 = 2114;
      __int16 v49 = v31;
      _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up keys: %{public}@", buf, 0x20u);
    }
    v32 = [(AMSUIWebBagAction *)self requestedKeys];
    id v33 = objc_opt_new();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __30__AMSUIWebBagAction_runAction__block_invoke;
    v37[3] = &unk_2643E4880;
    id v4 = v36;
    id v38 = v36;
    [(AMSUIWebBagAction *)self _fetchValuesForKeys:v32 bag:v35 startingAtIndex:0 valuesArray:v33 completion:v37];
  }
  else
  {
    v7 = AMSError();
    [v4 finishWithError:v7];
  }

  return v4;
}

uint64_t __30__AMSUIWebBagAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithResult:a2];
  }
}

- (void)_fetchValuesForKeys:(id)a3 bag:(id)a4 startingAtIndex:(int64_t)a5 valuesArray:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [v12 objectAtIndexedSubscript:a5];
  switch([v16 valueType])
  {
    case 0:
      v17 = [v16 key];
      uint64_t v18 = [v13 arrayForKey:v17];
      goto LABEL_16;
    case 1:
      v17 = [v16 key];
      uint64_t v18 = [v13 BOOLForKey:v17];
      goto LABEL_16;
    case 2:
      v17 = [v16 key];
      uint64_t v18 = [v13 doubleForKey:v17];
      goto LABEL_16;
    case 3:
      v17 = [v16 key];
      uint64_t v18 = [v13 integerForKey:v17];
      goto LABEL_16;
    case 4:
      v17 = [v16 key];
      uint64_t v18 = [v13 stringForKey:v17];
      goto LABEL_16;
    case 5:
      char v20 = objc_opt_respondsToSelector();
      v17 = [v16 key];
      if (v20)
      {
        uint64_t v21 = [(AMSUIWebBagAction *)self account];
        uint64_t v22 = (uint64_t)v21;
        if (!v21)
        {
          v28 = [(AMSUIWebAction *)self context];
          uint64_t v22 = [v28 account];
        }
        uint64_t v29 = (void *)v22;
        id v19 = [v13 URLForKey:v17 account:v22];
        if (!v21)
        {
        }
      }
      else
      {
        uint64_t v18 = [v13 URLForKey:v17];
LABEL_16:
        id v19 = (void *)v18;
      }

LABEL_18:
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __84__AMSUIWebBagAction__fetchValuesForKeys_bag_startingAtIndex_valuesArray_completion___block_invoke;
      v30[3] = &unk_2643E48A8;
      id v31 = v14;
      id v32 = v16;
      id v36 = v15;
      int64_t v37 = a5;
      id v33 = self;
      id v34 = v12;
      id v35 = v13;
      id v23 = v13;
      id v24 = v12;
      id v25 = v15;
      id v26 = v16;
      id v27 = v14;
      [v19 valueWithCompletion:v30];

      return;
    case 6:
      v17 = [v16 key];
      uint64_t v18 = [v13 dictionaryForKey:v17];
      goto LABEL_16;
    default:
      id v19 = 0;
      goto LABEL_18;
  }
}

void __84__AMSUIWebBagAction__fetchValuesForKeys_bag_startingAtIndex_valuesArray_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 absoluteString];
  }
  v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) key];
  [v10 setObject:v9 forKeyedSubscript:v11];

  if (v7)
  {
    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = [*(id *)(a1 + 48) context];
      v16 = [v15 logKey];
      v17 = [*(id *)(a1 + 40) key];
      int v20 = 138544130;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = v16;
      __int16 v24 = 2114;
      id v25 = v17;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag key: %{public}@. %{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }
  if ([v7 code] == 203)
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_14:
    v18();
    goto LABEL_15;
  }
  unint64_t v19 = *(void *)(a1 + 80);
  if (v19 >= [*(id *)(a1 + 56) count] - 1)
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_14;
  }
  [*(id *)(a1 + 48) _fetchValuesForKeys:*(void *)(a1 + 56) bag:*(void *)(a1 + 64) startingAtIndex:*(void *)(a1 + 80) + 1 valuesArray:*(void *)(a1 + 32) completion:*(void *)(a1 + 72)];
LABEL_15:
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (NSArray)requestedKeys
{
  return self->_requestedKeys;
}

- (void)setRequestedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedKeys, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end