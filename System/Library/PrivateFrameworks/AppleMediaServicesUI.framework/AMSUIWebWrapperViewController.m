@interface AMSUIWebWrapperViewController
- (AMSUIWebClientContext)wrapperContext;
- (AMSUIWebWrapperViewController)initWithContext:(id)a3 account:(id)a4;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (void)setWrapperContext:(id)a3;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIWebWrapperViewController

- (AMSUIWebWrapperViewController)initWithContext:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 bag];
  v10 = v8;
  if (!v8)
  {
    v10 = [v7 account];
  }
  v11 = [v7 clientInfo];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebWrapperViewController;
  v12 = [(AMSUIWebViewController *)&v15 initWithBag:v9 account:v10 clientInfo:v11];

  if (!v8) {
  if (v12)
  }
  {
    objc_storeStrong((id *)&v12->_wrapperContext, a3);
    v14.receiver = v12;
    v14.super_class = (Class)AMSUIWebWrapperViewController;
    [(AMSUIWebViewController *)&v14 setDelegate:v12];
  }

  return v12;
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if (v13)
  {
    id v8 = [(AMSUIWebWrapperViewController *)self wrapperContext];
    v9 = [v8 dataProvider];
    id v10 = (id)[v9 postEvent:@"BuyConfirmed" options:MEMORY[0x263EFFA78]];
  }
  v11 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  v12 = [v11 actionDelegate];
  [v12 actionDidFinishPurchaseWithResult:v13 error:v7];
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  v9 = [v11 actionDelegate];
  id v10 = [v9 action:0 pauseTimeouts:1 handleDialogRequest:v8];

  [v10 addFinishBlock:v7];
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  v9 = [v11 actionDelegate];
  id v10 = [v9 action:0 pauseTimeouts:1 handleAuthenticateRequest:v8];

  [v10 addFinishBlock:v7];
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  id v10 = [v9 logKey];
  id v11 = AMSUIWebSetSubLogKey(v10, 0);

  v12 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"RouteDelegateAction" logKey:v11];
  [(AMSUIWebJSRequest *)v12 setOptions:v8];

  id v13 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  objc_super v14 = [v13 dataProvider];
  objc_super v15 = [v14 runJSRequest:v12];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__AMSUIWebWrapperViewController_webViewController_handleDelegateAction_completion___block_invoke;
  v18[3] = &unk_2643E5D70;
  id v19 = v7;
  id v16 = v7;
  [v15 addFinishBlock:v18];

  return 1;
}

void __83__AMSUIWebWrapperViewController_webViewController_handleDelegateAction_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    uint64_t v5 = [a2 body];
    v6 = (void *)v5;
    id v7 = (void *)MEMORY[0x263EFFA78];
    if (v5) {
      id v7 = (void *)v5;
    }
    a2 = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AMSUIWebWrapperViewController *)self wrapperContext];
  id v11 = [v10 dataProvider];
  v17[0] = @"result";
  v12 = v8;
  if (!v8)
  {
    v12 = [MEMORY[0x263EFF9D0] null];
  }
  v17[1] = @"error";
  v18[0] = v12;
  id v13 = AMSUIWebJSError(v9);
  objc_super v14 = v13;
  if (!v13)
  {
    objc_super v14 = [MEMORY[0x263EFF9D0] null];
  }
  v18[1] = v14;
  objc_super v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v16 = (id)[v11 postEvent:@"RouteResolve" options:v15];

  if (!v13) {
  if (!v8)
  }
}

- (AMSUIWebClientContext)wrapperContext
{
  return self->_wrapperContext;
}

- (void)setWrapperContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end