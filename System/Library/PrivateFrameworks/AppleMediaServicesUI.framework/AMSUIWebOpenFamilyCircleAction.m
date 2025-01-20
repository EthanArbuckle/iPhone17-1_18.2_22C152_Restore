@interface AMSUIWebOpenFamilyCircleAction
- (AMSUIWebOpenFamilyCircleAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)clientName;
- (id)runAction;
- (void)setClientName:(id)a3;
@end

@implementation AMSUIWebOpenFamilyCircleAction

- (AMSUIWebOpenFamilyCircleAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOpenFamilyCircleAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"clientName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    clientName = v7->_clientName;
    v7->_clientName = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)AMSUIWebOpenFamilyCircleAction;
  id v3 = [(AMSUIWebAction *)&v34 runAction];
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting to open family circle", buf, 0x16u);
  }
  uint64_t v35 = 0;
  uint64_t v36 = (uint64_t)&v35;
  uint64_t v37 = 0x2050000000;
  v9 = (void *)getFACircleContextClass_softClass_0;
  v38 = (void *)getFACircleContextClass_softClass_0;
  if (!getFACircleContextClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFACircleContextClass_block_invoke_0;
    v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_2643E33D8;
    v46 = (void (*)(uint64_t))&v35;
    __getFACircleContextClass_block_invoke_0((uint64_t)buf);
    v9 = *(void **)(v36 + 24);
  }
  v10 = v9;
  _Block_object_dispose(&v35, 8);
  id v11 = [v10 alloc];
  uint64_t v35 = 0;
  uint64_t v36 = (uint64_t)&v35;
  uint64_t v37 = 0x2020000000;
  objc_super v12 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  v38 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_0)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFACircleEventTypeInitiateSymbolLoc_block_invoke_0;
    v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_2643E33D8;
    v46 = (void (*)(uint64_t))&v35;
    v13 = (void *)FamilyCircleUILibrary_0();
    v14 = dlsym(v13, "FACircleEventTypeInitiate");
    *(void *)(*((void *)v46 + 1) + 24) = v14;
    getFACircleEventTypeInitiateSymbolLoc_ptr_0 = *(void *)(*((void *)v46 + 1) + 24);
    objc_super v12 = *(void **)(v36 + 24);
  }
  _Block_object_dispose(&v35, 8);
  if (!v12) {
    getAIDAServiceTypeCloud_cold_1();
  }
  v15 = (void *)[v11 initWithEventType:*v12];
  v16 = [(AMSUIWebOpenFamilyCircleAction *)self clientName];
  [v15 setClientName:v16];

  v17 = [(AMSUIWebAction *)self context];
  v18 = [v17 flowController];
  v19 = [v18 currentContainer];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__7;
  v46 = __Block_byref_object_dispose__7;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v20 = (void *)getFACircleStateControllerClass_softClass_0;
  uint64_t v43 = getFACircleStateControllerClass_softClass_0;
  if (!getFACircleStateControllerClass_softClass_0)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    uint64_t v37 = (uint64_t)__getFACircleStateControllerClass_block_invoke_0;
    v38 = &unk_2643E33D8;
    v39 = &v40;
    __getFACircleStateControllerClass_block_invoke_0((uint64_t)&v35);
    v20 = (void *)v41[3];
  }
  v21 = v20;
  _Block_object_dispose(&v40, 8);
  id v47 = (id)[[v21 alloc] initWithPresenter:v19];
  v22 = AMSLogKey();
  v23 = *(void **)(*(void *)&buf[8] + 40);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __43__AMSUIWebOpenFamilyCircleAction_runAction__block_invoke;
  v29[3] = &unk_2643E5550;
  id v24 = v22;
  v33 = buf;
  id v30 = v24;
  v31 = self;
  id v25 = v4;
  id v32 = v25;
  [v23 performWithContext:v15 completion:v29];
  v26 = v32;
  id v27 = v25;

  _Block_object_dispose(buf, 8);
  return v27;
}

void __43__AMSUIWebOpenFamilyCircleAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id)AMSSetLogKey();
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = [v3 error];

  uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      objc_super v12 = AMSLogKey();
      v13 = [v3 error];
      int v19 = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      v22 = v12;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open family circle. %{public}@", (uint8_t *)&v19, 0x20u);
    }
    v14 = *(void **)(a1 + 48);
    v15 = [v3 error];
    [v14 finishWithError:v15];
  }
  else
  {
    if (!v8)
    {
      v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v9 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successully opened family circle", (uint8_t *)&v19, 0x16u);
    }
    [*(id *)(a1 + 48) finishWithResult:MEMORY[0x263EFFA88]];
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end