@interface AMSUIAutomaticDownloadKindsSetTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSAutomaticDownloadKindsSetTask)task;
- (AMSBagProtocol)bag;
- (AMSUIAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 viewController:(id)a6;
- (NSArray)enabledMediaKinds;
- (UIViewController)viewController;
- (id)perform;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)setTask:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIAutomaticDownloadKindsSetTask

- (AMSUIAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 viewController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIAutomaticDownloadKindsSetTask;
  v14 = [(AMSTask *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x263F27B20]) initWithEnabledMediaKinds:v10 account:v11 bag:v12 presentationDelegate:v14];
    task = v14->_task;
    v14->_task = (AMSAutomaticDownloadKindsSetTask *)v15;

    objc_storeStrong((id *)&v14->_viewController, a6);
  }

  return v14;
}

- (id)perform
{
  v2 = [(AMSUIAutomaticDownloadKindsSetTask *)self task];
  v3 = [v2 perform];

  return v3;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [AMSUIAuthenticateTask alloc];
  v9 = [(AMSUIAutomaticDownloadKindsSetTask *)self viewController];
  id v10 = [(AMSUIAuthenticateTask *)v8 initWithRequest:v7 presentingViewController:v9];

  id v11 = [(AMSAuthenticateTask *)v10 performAuthentication];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__AMSUIAutomaticDownloadKindsSetTask_handleAuthenticateRequest_completion___block_invoke;
  v13[3] = &unk_2643E31B8;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

uint64_t __75__AMSUIAutomaticDownloadKindsSetTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [AMSUIAlertDialogTask alloc];
  v9 = [(AMSUIAutomaticDownloadKindsSetTask *)self viewController];
  id v10 = [(AMSUIAlertDialogTask *)v8 initWithRequest:v7 presentingViewController:v9];

  id v11 = [(AMSUIAlertDialogTask *)v10 present];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__AMSUIAutomaticDownloadKindsSetTask_handleDialogRequest_completion___block_invoke;
  v13[3] = &unk_2643E31E0;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

uint64_t __69__AMSUIAutomaticDownloadKindsSetTask_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)[MEMORY[0x263F27B20] bagKeySet];
}

+ (NSString)bagSubProfile
{
  return (NSString *)[MEMORY[0x263F27B20] bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)[MEMORY[0x263F27B20] bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return (id)[MEMORY[0x263F27B20] createBagForSubProfile];
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSArray)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (AMSAutomaticDownloadKindsSetTask)task
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
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end