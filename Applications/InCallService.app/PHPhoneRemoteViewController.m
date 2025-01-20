@interface PHPhoneRemoteViewController
+ (BOOL)isSupported;
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (NSString)serviceBundleIdentifier;
+ (NSString)viewControllerClassName;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
- (PHInCallBackgroundStyleProtocol)backgroundStyleDelegate;
- (PHPhoneRemoteViewControllerDelegate)delegate;
- (int64_t)backgroundStyle;
- (void)setBackgroundStyleDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHPhoneRemoteViewController

+ (BOOL)isSupported
{
  return 1;
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 viewControllerClassName];
  v6 = [a1 serviceBundleIdentifier];
  v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting view controller with class name %@ and bundle identifier %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = [a1 requestViewController:v5 fromServiceWithBundleIdentifier:v6 connectionHandler:v4];

  return v8;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(PHPhoneRemoteViewController *)self delegate];

  if (v4)
  {
    v5 = [(PHPhoneRemoteViewController *)self delegate];
    [v5 viewServiceDidTerminateWithError:v6];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteViewController;
  [(PHPhoneRemoteViewController *)&v5 viewDidAppear:a3];
  id v4 = [(PHPhoneRemoteViewController *)self backgroundStyleDelegate];
  [v4 setBackgroundStyle:[self backgroundStyle] animatedWithDuration:0.5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteViewController;
  [(PHPhoneRemoteViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(PHPhoneRemoteViewController *)self backgroundStyleDelegate];
  [v4 setBackgroundStyle:4 animatedWithDuration:0.5];
}

+ (NSString)viewControllerClassName
{
  return 0;
}

+ (NSString)serviceBundleIdentifier
{
  return 0;
}

- (int64_t)backgroundStyle
{
  return 0;
}

- (PHPhoneRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHPhoneRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PHInCallBackgroundStyleProtocol)backgroundStyleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundStyleDelegate);

  return (PHInCallBackgroundStyleProtocol *)WeakRetained;
}

- (void)setBackgroundStyleDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundStyleDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end