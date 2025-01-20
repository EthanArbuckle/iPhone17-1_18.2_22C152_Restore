@interface AMSUIAuthenticateCloudTask
- (AMSAuthenticateRequest)authRequest;
- (AMSUIAuthenticateCloudTask)initWithAuthRequest:(id)a3 presentingViewController:(id)a4;
- (CDPUIController)cdpUIController;
- (UIViewController)presentingViewController;
- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4;
- (id)performAuthenticate;
- (void)setAuthRequest:(id)a3;
- (void)setCdpUIController:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AMSUIAuthenticateCloudTask

- (AMSUIAuthenticateCloudTask)initWithAuthRequest:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIAuthenticateCloudTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authRequest, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)performAuthenticate
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke;
  v4[3] = &unk_2643E3258;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F27E10]);
  v3 = [AMSUIAuthKitUpdateTask alloc];
  v4 = [*(id *)(a1 + 32) authRequest];
  v5 = [v4 account];
  v6 = [*(id *)(a1 + 32) presentingViewController];
  id v7 = [*(id *)(a1 + 32) authRequest];
  id v8 = [v7 options];
  v9 = [(AMSUIAuthKitUpdateTask *)v3 initWithAccount:v5 presentingViewController:v6 options:v8];

  v10 = [(AMSAuthKitUpdateTask *)v9 performAuthKitUpdate];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_2;
  v15[3] = &unk_2643E3388;
  id v11 = v2;
  uint64_t v12 = *(void *)(a1 + 32);
  id v16 = v11;
  uint64_t v17 = v12;
  [v10 addFinishBlock:v15];
  id v13 = v11;

  return v13;
}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_3;
    v10[3] = &unk_2643E3360;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    id v7 = v10;
    id v8 = AMSLogKey();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke;
    block[3] = &unk_2643E33B0;
    id v14 = v8;
    id v15 = v7;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_3(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a1[4];
  v4 = [a1[5] authenticationResults];
  id v5 = [a1[4] presentingViewController];
  v6 = [v3 _serviceContextWithResults:v4 parentViewController:v5];

  id v7 = [MEMORY[0x263F27CB8] sharedConfigOversize];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning service owners manager sign in", buf, 0x16u);
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v11 = (void *)getAIDAServiceOwnersManagerClass_softClass;
  uint64_t v23 = getAIDAServiceOwnersManagerClass_softClass;
  if (!getAIDAServiceOwnersManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAIDAServiceOwnersManagerClass_block_invoke;
    v25 = &unk_2643E33D8;
    v26 = &v20;
    __getAIDAServiceOwnersManagerClass_block_invoke((uint64_t)buf);
    id v11 = (void *)v21[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v20, 8);
  id v13 = [v12 alloc];
  id v14 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v15 = (void *)[v13 initWithAccountStore:v14];

  id v16 = getAIDAServiceTypeCloud();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_31;
  v17[3] = &unk_2643E3338;
  v17[4] = a1[4];
  id v18 = a1[6];
  id v19 = a1[5];
  [v15 signInService:v16 withContext:v6 completion:v17];
}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setCdpUIController:0];
  v4 = *(void **)(a1 + 40);
  if (v5) {
    [v4 finishWithError:v5];
  }
  else {
    [v4 finishWithResult:*(void *)(a1 + 48)];
  }
}

- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v8 = (void *)getCDPUIControllerClass_softClass;
  uint64_t v32 = getCDPUIControllerClass_softClass;
  if (!getCDPUIControllerClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getCDPUIControllerClass_block_invoke;
    uint64_t v27 = &unk_2643E33D8;
    v28 = &v29;
    __getCDPUIControllerClass_block_invoke((uint64_t)&v24);
    id v8 = (void *)v30[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v29, 8);
  v10 = (void *)[[v9 alloc] initWithPresentingViewController:v7];
  [(AMSUIAuthenticateCloudTask *)self setCdpUIController:v10];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v11 = (void *)getAAUISignInFlowControllerDelegateClass_softClass;
  uint64_t v32 = getAAUISignInFlowControllerDelegateClass_softClass;
  if (!getAAUISignInFlowControllerDelegateClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getAAUISignInFlowControllerDelegateClass_block_invoke;
    uint64_t v27 = &unk_2643E33D8;
    v28 = &v29;
    __getAAUISignInFlowControllerDelegateClass_block_invoke((uint64_t)&v24);
    id v11 = (void *)v30[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v29, 8);
  id v13 = (void *)[[v12 alloc] initWithPresentingViewController:v7];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v14 = (void *)getAIDAMutableServiceContextClass_softClass;
  uint64_t v32 = getAIDAMutableServiceContextClass_softClass;
  if (!getAIDAMutableServiceContextClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getAIDAMutableServiceContextClass_block_invoke;
    uint64_t v27 = &unk_2643E33D8;
    v28 = &v29;
    __getAIDAMutableServiceContextClass_block_invoke((uint64_t)&v24);
    id v14 = (void *)v30[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v29, 8);
  id v16 = objc_alloc_init(v15);
  [v16 setAuthenticationResults:v6];
  [v16 setShouldForceOperation:0];
  [v16 setOperationUIPermissions:1];
  [v16 setViewController:v7];
  uint64_t v17 = [(AMSUIAuthenticateCloudTask *)self cdpUIController];
  [v16 setCdpUiProvider:v17];

  id v18 = [v16 signInContexts];
  id v19 = (void *)[v18 mutableCopy];

  uint64_t v20 = getAIDAServiceTypeCloud();
  [v19 setObject:v13 forKeyedSubscript:v20];

  v21 = (void *)[v19 copy];
  [v16 setSignInContexts:v21];

  uint64_t v22 = (void *)[v16 copy];
  return v22;
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
}

- (AMSAuthenticateRequest)authRequest
{
  return self->_authRequest;
}

- (void)setAuthRequest:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_authRequest, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
}

@end