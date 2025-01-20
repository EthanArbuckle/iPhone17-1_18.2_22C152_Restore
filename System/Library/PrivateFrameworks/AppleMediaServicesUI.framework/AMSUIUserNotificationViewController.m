@interface AMSUIUserNotificationViewController
+ (id)userNotificationFromNotification:(id)a3;
- (AMSUIUserNotificationContentViewController)contentViewController;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)openNotification;
- (void)renderUserNotification:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIUserNotificationViewController

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AMSUIUserNotificationViewController;
  [(AMSUIUserNotificationViewController *)&v15 viewWillLayoutSubviews];
  v3 = [(AMSUIUserNotificationViewController *)self contentViewController];

  if (v3)
  {
    v4 = [(AMSUIUserNotificationViewController *)self view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(AMSUIUserNotificationViewController *)self contentViewController];
    v14 = [v13 view];
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIUserNotificationViewController;
  [(AMSUIUserNotificationViewController *)&v5 viewWillDisappear:a3];
  v4 = [(AMSUIUserNotificationViewController *)self contentViewController];
  [v4 mediaPause];
}

+ (id)userNotificationFromNotification:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F27F10];
  id v4 = a3;
  objc_super v5 = (void *)[[v3 alloc] initWithUNNotification:v4];

  return v5;
}

- (void)openNotification
{
  id v2 = [(AMSUIUserNotificationViewController *)self extensionContext];
  [v2 performNotificationDefaultAction];
}

- (void)renderUserNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F27CB8] sharedUserNotificationConfig];
  if (!v5)
  {
    objc_super v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [v4 logKey];
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will render notification", buf, 0x16u);
  }
  double v8 = [v4 createUNNotificationActions];
  if (v8)
  {
    double v9 = [(AMSUIUserNotificationViewController *)self extensionContext];
    [v9 setNotificationActions:v8];
  }
  double v10 = [MEMORY[0x263F825C8] systemBackgroundColor];
  double v11 = [(AMSUIUserNotificationViewController *)self view];
  [v11 setBackgroundColor:v10];

  double v12 = [[AMSUIUserNotificationContentViewController alloc] initWithNotification:v4 delegate:self];
  [(AMSUIUserNotificationViewController *)self setContentViewController:v12];

  v13 = [(AMSUIUserNotificationViewController *)self contentViewController];
  [v13 setDelegate:self];

  v14 = [(AMSUIUserNotificationViewController *)self contentViewController];
  [v14 setModalPresentationStyle:0];

  objc_super v15 = [(AMSUIUserNotificationViewController *)self contentViewController];
  [v15 expectedContentSize];
  -[AMSUIUserNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  v16 = [(AMSUIUserNotificationViewController *)self contentViewController];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__AMSUIUserNotificationViewController_renderUserNotification___block_invoke;
  v17[3] = &unk_2643E3118;
  v17[4] = self;
  [(AMSUIUserNotificationViewController *)self presentViewController:v16 animated:0 completion:v17];
}

void __62__AMSUIUserNotificationViewController_renderUserNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentViewController];
  [v2 preferredContentSize];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");

  id v4 = [*(id *)(a1 + 32) presentingViewController];
  v3 = [v4 view];
  [v3 setNeedsLayout];
}

- (void)didReceiveNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() userNotificationFromNotification:v4];

  if (v5)
  {
    [(AMSUIUserNotificationViewController *)self renderUserNotification:v5];
  }
  else
  {
    int v6 = [MEMORY[0x263F27EF8] isRunningUnitTests];
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
    double v8 = (void *)v7;
    if (v6)
    {
      if (!v7)
      {
        double v8 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      double v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543362;
        id v15 = (id)objc_opt_class();
        id v10 = v15;
        _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v14, 0xCu);
      }
      double v8 = [MEMORY[0x263F08A00] defaultCenter];
      double v11 = [MEMORY[0x263F27CB8] sharedConfig];
      [v8 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
    }
    else
    {
      if (!v7)
      {
        double v8 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      double v12 = [v8 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138543362;
        id v15 = (id)objc_opt_class();
        id v13 = v15;
        _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_FAULT, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
}

- (AMSUIUserNotificationContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end