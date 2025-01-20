@interface AMSUIAuthKitUpdateTask
- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5;
- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5;
- (UIViewController)getPresentingViewController;
- (UIWindow)presentingWindow;
- (id)_createAuthKitContext;
- (unint64_t)_authenticationType;
- (void)_configureAuthKitContext:(id)a3;
- (void)contextDidDismissLoginAlertController:(id)a3;
- (void)contextDidEndPresentingSecondaryUI:(id)a3;
- (void)contextDidPresentLoginAlertController:(id)a3;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)contextWillDismissLoginAlertController:(id)a3;
@end

@implementation AMSUIAuthKitUpdateTask

- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIAuthKitUpdateTask;
  v10 = [(AMSAuthKitUpdateTask *)&v13 initWithAccount:a3 options:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v11;
}

- (AMSUIAuthKitUpdateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIAuthKitUpdateTask;
  v10 = [(AMSAuthKitUpdateTask *)&v13 initWithAccount:a3 options:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_presentingWindow, a4);
  }

  return v11;
}

- (unint64_t)_authenticationType
{
  v2 = [(AMSAuthKitUpdateTask *)self options];
  unint64_t v3 = [v2 authenticationType];

  return v3;
}

- (void)_configureAuthKitContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIAuthKitUpdateTask;
  [(AMSAuthKitUpdateTask *)&v15 _configureAuthKitContext:v4];
  getAKAppleIDAuthenticationInAppContextClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 cancelButtonString];

    if (!v6)
    {
      v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
      v8 = AMSUILocalizedStringFromBundle(@"CANCEL", 0, v7);
      [v5 setCancelButtonString:v8];
    }
    id v9 = [v5 defaultButtonString];

    if (!v9)
    {
      v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
      v11 = AMSUILocalizedStringFromBundle(@"SIGN_IN_BUTTON_TITLE", 0, v10);
      [v5 setDefaultButtonString:v11];
    }
    v12 = [(AMSUIAuthKitUpdateTask *)self presentingWindow];

    if (v12)
    {
      objc_super v13 = [(AMSUIAuthKitUpdateTask *)self presentingWindow];
      v14 = [v13 rootViewController];
      [v5 setPresentingViewController:v14];
    }
    else
    {
      objc_super v13 = [(AMSUIAuthKitUpdateTask *)self getPresentingViewController];
      [v5 setPresentingViewController:v13];
    }

    [v5 setDelegate:self];
  }
}

- (id)_createAuthKitContext
{
  id v2 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
  return v2;
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AMSAuthKitUpdateTask *)self options];
    v10 = [v9 logKey];
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      objc_super v13 = [(AMSAuthKitUpdateTask *)self options];
      uint64_t v3 = [v13 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v3, a2];
    }
    else
    {
      objc_super v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    objc_super v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }
  }
}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AMSAuthKitUpdateTask *)self options];
    v10 = [v9 logKey];
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      objc_super v13 = [(AMSAuthKitUpdateTask *)self options];
      uint64_t v3 = [v13 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v3, a2];
    }
    else
    {
      objc_super v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    objc_super v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }
  }
}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AMSAuthKitUpdateTask *)self options];
    v10 = [v9 logKey];
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      objc_super v13 = [(AMSAuthKitUpdateTask *)self options];
      uint64_t v3 = [v13 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v3, a2];
    }
    else
    {
      objc_super v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    objc_super v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }
  }
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AMSAuthKitUpdateTask *)self options];
    v10 = [v9 logKey];
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      objc_super v13 = [(AMSAuthKitUpdateTask *)self options];
      uint64_t v3 = [v13 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v3, a2];
    }
    else
    {
      objc_super v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    objc_super v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }
  }
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AMSAuthKitUpdateTask *)self options];
    v10 = [v9 logKey];
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      objc_super v13 = [(AMSAuthKitUpdateTask *)self options];
      uint64_t v3 = [v13 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v3, a2];
    }
    else
    {
      objc_super v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    objc_super v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@context: %{public}@", buf, 0x16u);
    if (v10)
    {

      v14 = (void *)v3;
    }
  }
}

- (UIViewController)getPresentingViewController
{
  return self->_presentingViewController;
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end