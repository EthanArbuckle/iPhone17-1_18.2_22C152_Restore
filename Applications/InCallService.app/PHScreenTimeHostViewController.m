@interface PHScreenTimeHostViewController
- (BOOL)_canShowWhileLocked;
- (PHScreenTimeHostViewController)initWithRequest:(id)a3 delegate:(id)a4;
- (PHScreenTimeHostViewControllerDelegate)delegate;
- (STLockoutViewController)lockoutViewController;
- (void)dismissAlert;
- (void)lockoutViewControllerDidFinishDismissing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLockoutViewController:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHScreenTimeHostViewController

- (PHScreenTimeHostViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PHScreenTimeHostViewController;
  v8 = [(PHScreenTimeHostViewController *)&v25 init];
  if (v8)
  {
    v9 = [v6 bundleIdentifier];
    if ([v9 length])
    {
      v10 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForBundleIdentifier:v9];
      id v11 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v10];
      objc_storeWeak((id *)&v8->_delegate, v7);
      v12 = [v6 sanitizedHandles];
      v13 = [v12 allObjects];
      v14 = [v6 contactNamesByHandleWithContactsDataSource:v11];
      uint64_t v15 = +[STLockoutViewController lockoutViewControllerWithBundleIdentifier:v9 contactsHandles:v13 contactNameByHandle:v14];
      lockoutViewController = v8->_lockoutViewController;
      v8->_lockoutViewController = (STLockoutViewController *)v15;

      [(STLockoutViewController *)v8->_lockoutViewController setViewControllerDelegate:v8];
      [(STLockoutViewController *)v8->_lockoutViewController setOkButtonAction:1];
      v17 = [(STLockoutViewController *)v8->_lockoutViewController view];
      [v17 setAutoresizingMask:18];

      v18 = [(PHScreenTimeHostViewController *)v8 lockoutViewController];
      [v18 willMoveToParentViewController:v8];

      v19 = [(PHScreenTimeHostViewController *)v8 lockoutViewController];
      [(PHScreenTimeHostViewController *)v8 addChildViewController:v19];

      v20 = [(PHScreenTimeHostViewController *)v8 view];
      v21 = [(PHScreenTimeHostViewController *)v8 lockoutViewController];
      v22 = [v21 view];
      [v20 addSubview:v22];

      v23 = [(PHScreenTimeHostViewController *)v8 lockoutViewController];
      [v23 didMoveToParentViewController:v8];
    }
    else
    {
      v10 = sub_1000D5130();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E97B0((uint64_t)v6, v10);
      }
    }
  }
  return v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHScreenTimeHostViewController;
  [(PHScreenTimeHostViewController *)&v5 viewWillDisappear:a3];
  if ([(PHScreenTimeHostViewController *)self isBeingDismissed])
  {
    v4 = [(PHScreenTimeHostViewController *)self delegate];
    [v4 didDismissAlertFromHostViewController];
  }
}

- (void)lockoutViewControllerDidFinishDismissing:(id)a3
{
  id v3 = [(PHScreenTimeHostViewController *)self delegate];
  [v3 didDismissAlertFromHostViewController];
}

- (void)dismissAlert
{
  id v2 = [(PHScreenTimeHostViewController *)self lockoutViewController];
  [v2 dismissViewControllerAnimated:1 completion:&stru_1002CDF50];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (PHScreenTimeHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHScreenTimeHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lockoutViewController, 0);
}

@end