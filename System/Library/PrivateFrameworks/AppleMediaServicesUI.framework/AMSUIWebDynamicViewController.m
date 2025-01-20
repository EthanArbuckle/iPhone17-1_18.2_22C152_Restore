@interface AMSUIWebDynamicViewController
- (AMSUIWebClientContext)context;
- (AMSUIWebDynamicViewController)initWithContext:(id)a3 URL:(id)a4;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)setContext:(id)a3;
@end

@implementation AMSUIWebDynamicViewController

- (AMSUIWebDynamicViewController)initWithContext:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 bag];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebDynamicViewController;
  v10 = [(AMSUIDynamicViewController *)&v12 initWithBag:v9 URL:v8];

  if (v10) {
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if (v13)
  {
    id v8 = [(AMSUIWebDynamicViewController *)self context];
    v9 = [v8 dataProvider];
    id v10 = (id)[v9 postEvent:@"BuyConfirmed" options:MEMORY[0x263EFFA78]];
  }
  v11 = [(AMSUIWebDynamicViewController *)self context];
  objc_super v12 = [v11 actionDelegate];
  [v12 actionDidFinishPurchaseWithResult:v13 error:v7];
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v6 = [(UIViewController *)self ams_parentContainer];
  v5 = [v6 modalPresentationDelegate];

  if (v5) {
    [v6 handleModalDismissal];
  }
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end