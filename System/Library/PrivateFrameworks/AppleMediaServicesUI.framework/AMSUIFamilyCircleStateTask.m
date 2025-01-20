@interface AMSUIFamilyCircleStateTask
- (AMSUIFamilyCircleStateTask)initWithJSONDictionary:(id)a3 presentingViewController:(id)a4;
- (FACircleContext)faContext;
- (UIViewController)presentingViewController;
- (id)present;
- (void)setFaContext:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AMSUIFamilyCircleStateTask

- (AMSUIFamilyCircleStateTask)initWithJSONDictionary:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)AMSUIFamilyCircleStateTask;
  v8 = [(AMSTask *)&v29 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  [(AMSUIFamilyCircleStateTask *)v8 setPresentingViewController:v7];
  v10 = [v6 objectForKeyedSubscript:@"eventType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  v12 = [v6 objectForKeyedSubscript:@"clientBundleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v14 = [v6 objectForKeyedSubscript:@"clientName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  v16 = [v6 objectForKeyedSubscript:@"additionalParameters"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (!v11)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    v25 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    uint64_t v38 = getFACircleEventTypeInitiateSymbolLoc_ptr;
    if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
    {
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      v32 = __getFACircleEventTypeInitiateSymbolLoc_block_invoke;
      v33 = &unk_2643E33D8;
      v34 = &v35;
      v26 = (void *)FamilyCircleUILibrary();
      v27 = dlsym(v26, "FACircleEventTypeInitiate");
      *(void *)(v34[1] + 24) = v27;
      getFACircleEventTypeInitiateSymbolLoc_ptr = *(void *)(v34[1] + 24);
      v25 = (id *)v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (!v25) {
      getAIDAServiceTypeCloud_cold_1();
    }
    id v11 = *v25;
    if (v13) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
  if (!v13)
  {
LABEL_24:
    v28 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = [v28 bundleIdentifier];
  }
LABEL_16:
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v18 = (void *)getFACircleContextClass_softClass;
  uint64_t v38 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __getFACircleContextClass_block_invoke;
    v33 = &unk_2643E33D8;
    v34 = &v35;
    __getFACircleContextClass_block_invoke((uint64_t)&v30);
    v18 = (void *)v36[3];
  }
  v19 = v18;
  _Block_object_dispose(&v35, 8);
  v20 = (void *)[[v19 alloc] initWithEventType:v11];
  [(AMSUIFamilyCircleStateTask *)v9 setFaContext:v20];

  v21 = [(AMSUIFamilyCircleStateTask *)v9 faContext];
  [v21 setClientBundleID:v13];

  v22 = [(AMSUIFamilyCircleStateTask *)v9 faContext];
  [v22 setClientName:v15];

  v23 = [(AMSUIFamilyCircleStateTask *)v9 faContext];
  [v23 setAdditionalParameters:v17];

LABEL_19:
  return v9;
}

- (id)present
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v3 = (void *)getFACircleStateControllerClass_softClass;
  uint64_t v17 = getFACircleStateControllerClass_softClass;
  if (!getFACircleStateControllerClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getFACircleStateControllerClass_block_invoke;
    v13[3] = &unk_2643E33D8;
    v13[4] = &v14;
    __getFACircleStateControllerClass_block_invoke((uint64_t)v13);
    v3 = (void *)v15[3];
  }
  v4 = v3;
  _Block_object_dispose(&v14, 8);
  id v5 = [v4 alloc];
  id v6 = [(AMSUIFamilyCircleStateTask *)self presentingViewController];
  id v12 = (id)[v5 initWithPresenter:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__AMSUIFamilyCircleStateTask_present__block_invoke;
  v10[3] = &unk_2643E3C30;
  v10[4] = self;
  v10[5] = v11;
  id v7 = [(AMSTask *)self performTaskWithPromiseBlock:v10];
  v8 = [v7 binaryPromiseAdapter];

  _Block_object_dispose(v11, 8);
  return v8;
}

id __37__AMSUIFamilyCircleStateTask_present__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F27B58]);
  v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v4 = [*(id *)(a1 + 32) faContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__AMSUIFamilyCircleStateTask_present__block_invoke_2;
  v10[3] = &unk_2643E3C08;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v2;
  uint64_t v12 = v5;
  v10[4] = v6;
  id v7 = v2;
  [v3 performWithContext:v4 completion:v10];

  v8 = [v7 promiseAdapter];

  return v8;
}

void __37__AMSUIFamilyCircleStateTask_present__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = [v3 error];

  uint64_t v7 = [MEMORY[0x263F27CB8] sharedActionConfig];
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      uint64_t v12 = [v3 error];
      int v18 = 138543874;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      v21 = v11;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open family circle. %{public}@", (uint8_t *)&v18, 0x20u);
    }
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v3 error];
    [v13 finishWithError:v14];
  }
  else
  {
    if (!v7)
    {
      v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v15 = [v8 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully opened family circle", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithSuccess];
  }
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (FACircleContext)faContext
{
  return self->_faContext;
}

- (void)setFaContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faContext, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end