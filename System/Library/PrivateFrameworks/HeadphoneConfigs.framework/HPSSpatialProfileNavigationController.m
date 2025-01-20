@interface HPSSpatialProfileNavigationController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (id)dismissalHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)setDismissalHandler:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation HPSSpatialProfileNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HPSSpatialProfileNavigationController;
  [(HPSSpatialProfileNavigationController *)&v12 viewDidAppear:a3];
  v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Navigation Controller viewDidDisappear", v11, 2u);
  }

  id v5 = (id)[(HPSSpatialProfileNavigationController *)self popToRootViewControllerAnimated:0];
  v6 = [(HPSSpatialProfileNavigationController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Top View Controller is HPSSpatialProfileEnrollmentController", v11, 2u);
    }

    v9 = [(HPSSpatialProfileNavigationController *)self topViewController];
    [v9 viewDidDisappear:1];
  }
  dismissalHandler = (void (**)(void))self->dismissalHandler;
  if (dismissalHandler) {
    dismissalHandler[2]();
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)dismissalHandler
{
  return self->dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end