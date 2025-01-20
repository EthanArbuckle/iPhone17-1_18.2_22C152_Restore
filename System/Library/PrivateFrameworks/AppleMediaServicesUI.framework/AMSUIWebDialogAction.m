@interface AMSUIWebDialogAction
- (AMSDialogRequest)request;
- (AMSUIWebDialogAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)pauseTimeouts;
- (NSArray)buttonModels;
- (id)runAction;
- (void)setButtonModels:(id)a3;
- (void)setPauseTimeouts:(BOOL)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSUIWebDialogAction

- (AMSUIWebDialogAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v77.receiver = self;
  v77.super_class = (Class)AMSUIWebDialogAction;
  id v66 = a4;
  v61 = -[AMSUIWebAction initWithJSObject:context:](&v77, sel_initWithJSObject_context_, v6);
  if (v61)
  {
    v7 = [v6 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    v9 = [v6 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v59 = v6;
    v11 = [v6 objectForKeyedSubscript:@"buttons"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [v6 objectForKeyedSubscript:@"preferredButtonIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = [v6 objectForKeyedSubscript:@"textFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v60 = v15;
    }
    else {
      id v60 = 0;
    }

    v16 = [v6 objectForKeyedSubscript:@"style"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = [v16 integerValue];
    }
    else {
      uint64_t v17 = 1;
    }
    v18 = [v6 objectForKeyedSubscript:@"pauseTimeouts"];
    v54 = v18;
    v55 = v16;
    if (objc_opt_respondsToSelector()) {
      char v19 = objc_msgSend(v18, "BOOLValue", v18, v16);
    }
    else {
      char v19 = 1;
    }
    v61->_pauseTimeouts = v19;
    v57 = v10;
    v58 = v8;
    v20 = (AMSDialogRequest *)[objc_alloc(MEMORY[0x263F27C10]) initWithTitle:v8 message:v10];
    v56 = v14;
    [(AMSDialogRequest *)v20 setPreferredButtonActionIdentifier:v14];
    v65 = v20;
    [(AMSDialogRequest *)v20 setStyle:v17];
    id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v12;
    uint64_t v21 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v74;
      do
      {
        uint64_t v24 = 0;
        uint64_t v67 = v22;
        do
        {
          if (*(void *)v74 != v23) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(id *)(*((void *)&v73 + 1) + 8 * v24);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v26 = v25;
          }
          else {
            id v26 = 0;
          }

          if (v26)
          {
            v27 = [[AMSUIWebButtonModel alloc] initWithJSObject:v26 context:v66];
            v28 = [(AMSUIWebButtonModel *)v27 createDialogAction];
            [v64 addObject:v28];
          }
          else
          {
            v27 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
            if (!v27)
            {
              v27 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            v28 = [(AMSUIWebButtonModel *)v27 OSLogObject];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = v23;
              uint64_t v30 = objc_opt_class();
              v31 = [(AMSUIWebAction *)v61 context];
              v32 = [v31 logKey];
              *(_DWORD *)buf = 138543874;
              uint64_t v80 = v30;
              __int16 v81 = 2114;
              v82 = v32;
              __int16 v83 = 2114;
              id v84 = v25;
              _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid button object: %{public}@", buf, 0x20u);

              uint64_t v23 = v29;
              uint64_t v22 = v67;
            }
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v22);
    }

    [(AMSDialogRequest *)v65 setButtonActions:v64];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v62 = v60;
    uint64_t v33 = [v62 countByEnumeratingWithState:&v69 objects:v78 count:16];
    id v6 = v59;
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v68 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v70 != v68) {
            objc_enumerationMutation(v62);
          }
          id v36 = *(id *)(*((void *)&v69 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v37 = v36;
          }
          else {
            id v37 = 0;
          }

          if (v37)
          {
            v38 = [v59 objectForKeyedSubscript:@"placeholder"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v39 = v38;
            }
            else {
              id v39 = 0;
            }

            v44 = [v59 objectForKeyedSubscript:@"initialText"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v40 = v44;
            }
            else {
              v40 = 0;
            }

            v45 = [v59 objectForKeyedSubscript:@"keyboardType"];
            if (objc_opt_respondsToSelector())
            {
              v46 = [v59 objectForKeyedSubscript:@"keyboardType"];
              uint64_t v47 = [v46 integerValue];
            }
            else
            {
              uint64_t v47 = 0;
            }

            v48 = [v59 objectForKeyedSubscript:@"tag"];
            if (objc_opt_respondsToSelector())
            {
              v49 = [v59 objectForKeyedSubscript:@"tag"];
              uint64_t v50 = [v49 integerValue];
            }
            else
            {
              uint64_t v50 = 0;
            }

            id v51 = objc_alloc_init(MEMORY[0x263F27C20]);
            [v51 setPlaceholder:v39];
            [v51 setText:v40];
            [v51 setKeyboardType:v47];
            [v51 setTag:v50];
            [(AMSDialogRequest *)v65 addTextField:v51];
          }
          else
          {
            id v39 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
            if (!v39)
            {
              id v39 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            v40 = objc_msgSend(v39, "OSLogObject", v54);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              uint64_t v41 = objc_opt_class();
              v42 = [(AMSUIWebAction *)v61 context];
              v43 = [v42 logKey];
              *(_DWORD *)buf = 138543874;
              uint64_t v80 = v41;
              __int16 v81 = 2114;
              v82 = v43;
              __int16 v83 = 2114;
              id v84 = v36;
              _os_log_impl(&dword_21C134000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid text field object: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v34 = [v62 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v34);
    }

    request = v61->_request;
    v61->_request = v65;
  }
  return v61;
}

- (id)runAction
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebDialogAction;
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
    id v8 = [(AMSUIWebDialogAction *)self request];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running dialog: %{public}@", buf, 0x20u);
  }
  v9 = [(AMSUIWebAction *)self context];
  id v10 = [v9 actionDelegate];
  BOOL v11 = [(AMSUIWebDialogAction *)self pauseTimeouts];
  id v12 = [(AMSUIWebDialogAction *)self request];
  v13 = [v10 action:self pauseTimeouts:v11 handleDialogRequest:v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__AMSUIWebDialogAction_runAction__block_invoke;
  v16[3] = &unk_2643E4CE8;
  v16[4] = self;
  id v14 = [v13 thenWithBlock:v16];

  return v14;
}

id __33__AMSUIWebDialogAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) request];
  v5 = [v3 selectedActionIdentifier];
  uint64_t v6 = [v4 locateActionWithIdentifier:v5];

  v7 = [v6 userInfo];

  if (v7)
  {
    id v8 = [v6 userInfo];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA78];
  }
  v9 = [AMSUIWebButtonModel alloc];
  id v10 = [*(id *)(a1 + 32) context];
  BOOL v11 = [(AMSUIWebButtonModel *)v9 initWithJSObject:v8 context:v10];

  id v12 = [(AMSUIWebButtonModel *)v11 action];

  if (v12)
  {
    v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v13)
    {
      v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      objc_super v17 = [(AMSUIWebButtonModel *)v11 action];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v16;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running dialog action: %{public}@", buf, 0x20u);
    }
    v18 = [(AMSUIWebButtonModel *)v11 action];
    uint64_t v19 = [v18 runAction];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __33__AMSUIWebDialogAction_runAction__block_invoke_51;
  v24[3] = &unk_2643E4CC0;
  v24[4] = *(void *)(a1 + 32);
  id v25 = v8;
  id v26 = v3;
  id v20 = v3;
  id v21 = v8;
  __int16 v22 = [v19 continueWithBlock:v24];

  return v22;
}

id __33__AMSUIWebDialogAction_runAction__block_invoke_51(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) acceptedResponseVersions];
  int v3 = [v2 containsObject:&unk_26CC73700];

  v4 = (void *)MEMORY[0x263F27E10];
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v11[0] = @"selectedButton";
    v11[1] = @"textFieldValues";
    v12[0] = v6;
    v7 = [v5 textfieldValues];
    v12[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    v9 = [v4 promiseWithResult:v8];
  }
  else
  {
    v9 = [MEMORY[0x263F27E10] promiseWithResult:*(void *)(a1 + 40)];
  }
  return v9;
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (BOOL)pauseTimeouts
{
  return self->_pauseTimeouts;
}

- (void)setPauseTimeouts:(BOOL)a3
{
  self->_pauseTimeouts = a3;
}

- (NSArray)buttonModels
{
  return self->_buttonModels;
}

- (void)setButtonModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonModels, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end