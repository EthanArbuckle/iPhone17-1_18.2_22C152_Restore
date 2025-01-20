@interface AMSUIAgeVerificationTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_dateFormatter;
+ (id)_dialogForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6;
+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4;
+ (id)_promiseResultForOpeningURL:(id)a3;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSAgeVerificationTask)task;
- (AMSBagProtocol)bag;
- (AMSUIAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 viewController:(id)a6;
- (NSDictionary)options;
- (NSString)pincode;
- (UIViewController)viewController;
- (id)_performTaskWithVerificationResult:(id)a3;
- (id)isVerificationNeeded;
- (id)performTask;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)setOptions:(id)a3;
- (void)setPincode:(id)a3;
- (void)setTask:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIAgeVerificationTask

- (AMSUIAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 viewController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIAgeVerificationTask;
  v15 = [(AMSTask *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F27AF0]) initWithAccount:v11 bag:v12 options:v13 presentationDelegate:v16];
    task = v16->_task;
    v16->_task = (AMSAgeVerificationTask *)v17;

    objc_storeStrong((id *)&v16->_viewController, a6);
  }

  return v16;
}

- (id)isVerificationNeeded
{
  v2 = [(AMSUIAgeVerificationTask *)self task];
  v3 = [v2 isVerificationNeeded];

  return v3;
}

- (id)performTask
{
  v3 = objc_opt_class();
  v4 = [(AMSUIAgeVerificationTask *)self account];
  v5 = [(AMSUIAgeVerificationTask *)self bag];
  v6 = [v3 _errorCheckWithAccount:v4 bag:v5];

  if (v6)
  {
    v7 = [MEMORY[0x263F27E10] promiseWithError:v6];
  }
  else
  {
    v8 = [(AMSUIAgeVerificationTask *)self isVerificationNeeded];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__AMSUIAgeVerificationTask_performTask__block_invoke;
    v10[3] = &unk_2643E3140;
    v10[4] = self;
    v7 = [v8 thenWithBlock:v10];
  }
  return v7;
}

uint64_t __39__AMSUIAgeVerificationTask_performTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performTaskWithVerificationResult:a2];
}

- (void)setPincode:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAgeVerificationTask *)self task];
  [v5 setPincode:v4];
}

- (NSString)pincode
{
  v2 = [(AMSUIAgeVerificationTask *)self task];
  v3 = [v2 pincode];

  return (NSString *)v3;
}

- (id)_performTaskWithVerificationResult:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAgeVerificationTask *)self bag];
  v6 = [v5 URLForKey:@"korAgeVerificationUrl"];

  v7 = [v6 valuePromise];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke;
  v11[3] = &unk_2643E3190;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  id v5 = [*(id *)(a1 + 32) account];
  v6 = objc_msgSend(v5, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x263F277C0]);

  v7 = +[AMSUIAgeVerificationCore _timestampOfExpiryFrom:v6];
  id v8 = objc_opt_class();
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [*(id *)(a1 + 32) bag];
  id v11 = [(id)objc_opt_class() _dateFormatter];
  id v12 = [v8 _dialogForResult:v9 withBag:v10 expiration:v7 dateFormatter:v11];

  id v13 = [AMSUIAlertDialogTask alloc];
  id v14 = [*(id *)(a1 + 32) viewController];
  v15 = [(AMSUIAlertDialogTask *)v13 initWithRequest:v12 presentingViewController:v14];

  v16 = [(AMSUIAlertDialogTask *)v15 present];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke_2;
  v24[3] = &unk_2643E3168;
  id v25 = v12;
  id v26 = *(id *)(a1 + 40);
  id v17 = v4;
  uint64_t v18 = *(void *)(a1 + 32);
  id v27 = v17;
  uint64_t v28 = v18;
  id v29 = v3;
  id v19 = v3;
  id v20 = v12;
  [v16 addFinishBlock:v24];

  v21 = v29;
  id v22 = v17;

  return v22;
}

void __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 selectedActionIdentifier];
  id v6 = [v3 locateActionWithIdentifier:v4];

  if ([v6 style] == 2) {
    +[AMSUIAgeVerificationCore _promiseResultForCancelWithVerificationResult:*(void *)(a1 + 40)];
  }
  else {
  id v5 = [(id)objc_opt_class() _promiseResultForOpeningURL:*(void *)(a1 + 64)];
  }
  [*(id *)(a1 + 48) finishWithPromiseResult:v5];
}

+ (id)_promiseResultForOpeningURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F27E20];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  int v6 = [MEMORY[0x263F27DC8] openStandardURL:v4];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F27AE8]);
    [v7 setSuccessType:2];
    [v5 setResult:v7];
  }
  else
  {
    AMSError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setError:v7];
  }

  return v5;
}

+ (id)_dialogForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[AMSUIAgeVerificationCore _titleForResult:v12 withBag:v11 bundle:0];
  id v14 = +[AMSUIAgeVerificationCore _messageForResult:v12 withBag:v11 expiration:v10 dateFormatter:v9 bundle:0];

  v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v16 = AMSUILocalizedStringFromBundle(@"AGE_VERIFICATION_DIALOG_PROCEED_ACTION", v11, v15);

  id v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  uint64_t v18 = AMSUILocalizedStringFromBundle(@"AGE_VERIFICATION_DIALOG_CANCEL_ACTION", v11, v17);

  id v19 = (void *)[objc_alloc(MEMORY[0x263F27C10]) initWithTitle:v13 message:v14];
  id v20 = [MEMORY[0x263F27C08] actionWithTitle:v16];
  [v19 addButtonAction:v20];

  v21 = [MEMORY[0x263F27C08] actionWithTitle:v18 style:2];
  [v19 addButtonAction:v21];

  return v19;
}

+ (id)_dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateStyle:1];
  [v2 setTimeStyle:0];
  return v2;
}

+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = AMSCustomError();
  }

  return v8;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [AMSUIAuthenticateTask alloc];
  id v9 = [(AMSUIAgeVerificationTask *)self viewController];
  id v10 = [(AMSUIAuthenticateTask *)v8 initWithRequest:v7 presentingViewController:v9];

  id v11 = [(AMSAuthenticateTask *)v10 performAuthentication];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__AMSUIAgeVerificationTask_handleAuthenticateRequest_completion___block_invoke;
  v13[3] = &unk_2643E31B8;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

uint64_t __65__AMSUIAgeVerificationTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [AMSUIAlertDialogTask alloc];
  id v9 = [(AMSUIAgeVerificationTask *)self viewController];
  id v10 = [(AMSUIAlertDialogTask *)v8 initWithRequest:v7 presentingViewController:v9];

  id v11 = [(AMSUIAlertDialogTask *)v10 present];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__AMSUIAgeVerificationTask_handleDialogRequest_completion___block_invoke;
  v13[3] = &unk_2643E31E0;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

uint64_t __59__AMSUIAgeVerificationTask_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)[MEMORY[0x263F27AF0] bagKeySet];
}

+ (NSString)bagSubProfile
{
  return (NSString *)[MEMORY[0x263F27AF0] bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)[MEMORY[0x263F27AF0] bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return (id)[MEMORY[0x263F27AF0] createBagForSubProfile];
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (AMSAgeVerificationTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end