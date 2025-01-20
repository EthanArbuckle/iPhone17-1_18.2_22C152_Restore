@interface _UNNotificationContentExtensionHostViewController
- (BOOL)__shouldRemoteViewControllerFenceOperations;
- (BOOL)_canShowWhileLocked;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (NSString)notificationRequestIdentifier;
- (_UNNotificationContentExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)description;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setNotificationRequestIdentifier:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UNNotificationContentExtensionHostViewController

- (_UNNotificationContentExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  return [(_UNNotificationContentExtensionHostViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewWillAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  [(_UIRemoteViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewDidAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  [(_UIRemoteViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewWillDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  [(_UIRemoteViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostViewController viewDidDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  [(_UIRemoteViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = (NSCopying *)a3;
  objc_super v5 = [(_UNNotificationContentExtensionHostViewController *)self notificationRequestIdentifier];
  objc_super v6 = objc_msgSend(v5, "un_logDigest");

  v7 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_222224000, v7, OS_LOG_TYPE_DEFAULT, "Extension view service for notification request %{public}@ disconnected with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  if (WeakRetained && self->_extensionRequestIdentifier)
  {
    uint64_t v9 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_222224000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling loaded extension for notification request %{public}@", (uint8_t *)&v12, 0xCu);
    }
    [WeakRetained cancelExtensionRequestWithIdentifier:self->_extensionRequestIdentifier];
  }
  else
  {
    v10 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_ERROR))
    {
      extensionRequestIdentifier = self->_extensionRequestIdentifier;
      int v12 = 138543874;
      id v13 = WeakRetained;
      __int16 v14 = 2114;
      v15 = extensionRequestIdentifier;
      __int16 v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_222224000, v10, OS_LOG_TYPE_ERROR, "Can't cancel extension request – missing extension (%{public}@) or extension request ID (%{public}@) for notification request %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostViewController;
  -[_UNNotificationContentExtensionHostViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height, 0.0);
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(_UNNotificationContentExtensionHostViewController *)self notificationRequestIdentifier];
  objc_super v6 = objc_msgSend(v5, "un_logDigest");
  v7 = [(_UNNotificationContentExtensionHostViewController *)self extension];
  v8 = [v7 identifier];
  uint64_t v9 = [(_UNNotificationContentExtensionHostViewController *)self extensionRequestIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; notificationRequestID: %@; extensionID: %@; extensionRequestID: %@>",
    v4,
    self,
    v6,
    v8,
  v10 = v9);

  return v10;
}

- (NSExtension)extension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);

  return (NSExtension *)WeakRetained;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);

  objc_destroyWeak((id *)&self->_extension);
}

@end