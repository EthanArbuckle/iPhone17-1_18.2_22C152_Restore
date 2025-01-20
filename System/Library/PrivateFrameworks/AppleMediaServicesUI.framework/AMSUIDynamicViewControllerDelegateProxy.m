@interface AMSUIDynamicViewControllerDelegateProxy
- (AMSUIDynamicViewController)dynamicViewController;
- (AMSUIDynamicViewControllerDelegate)delegate;
- (AMSUIDynamicViewControllerDelegateProxy)initWithDynamicViewController:(id)a3;
- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5;
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4;
- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDynamicViewController:(id)a3;
@end

@implementation AMSUIDynamicViewControllerDelegateProxy

- (AMSUIDynamicViewControllerDelegateProxy)initWithDynamicViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIDynamicViewControllerDelegateProxy;
  v5 = [(AMSUIDynamicViewControllerDelegateProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dynamicViewController, v4);
  }

  return v6;
}

- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4
{
  id v5 = a4;
  v6 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v9 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    v10 = [v8 dynamicViewController:v9 contentViewControllerWithDictionary:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  v11 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v14 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    v15 = objc_msgSend(v13, "dynamicViewController:contentViewWithDictionary:frame:", v14, v10, x, y, width, height);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v11)
    {
      v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forwarding carrier link result to delegate", (uint8_t *)&v17, 0x16u);
    }
    v15 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v16 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    [v15 dynamicViewController:v16 didFinishCarrierLinkingWithResult:v7 error:v8];
  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v11 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    [v10 dynamicViewController:v11 didFinishPurchaseWithResult:v12 error:v7];
  }
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v11 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    [v10 dynamicViewController:v11 didFinishWithPurchaseResult:v12 error:v7];
  }
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    v11 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    [v10 dynamicViewController:v11 didResolveWithResult:v12 error:v7];
  }
}

- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    id v12 = [(AMSUIDynamicViewControllerDelegateProxy *)self dynamicViewController];
    char v13 = [v11 dynamicViewController:v12 handleDelegateAction:v7 completionHandler:v8];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AMSUIDynamicViewControllerDelegateProxy *)self delegate];
    char v8 = [v7 dynamicViewControllerShouldDismiss:v4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (AMSUIDynamicViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIDynamicViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSUIDynamicViewController)dynamicViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicViewController);
  return (AMSUIDynamicViewController *)WeakRetained;
}

- (void)setDynamicViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dynamicViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end