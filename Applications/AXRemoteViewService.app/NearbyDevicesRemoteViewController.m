@interface NearbyDevicesRemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_NearbyDevicesNavigationController)navigationController;
- (void)_dismiss;
- (void)_dismissViewService;
- (void)_nearbyDevicesNavigationControllerDidDismiss;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setNavigationController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation NearbyDevicesRemoteViewController

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NearbyDevicesRemoteViewController;
  [(NearbyDevicesRemoteViewController *)&v5 viewDidAppear:a3];
  [(NearbyDevicesRemoteViewController *)self _setupRemoteProxy];
  v4 = [(NearbyDevicesRemoteViewController *)self navigationController];
  [(NearbyDevicesRemoteViewController *)self presentViewController:v4 animated:1 completion:&stru_100004160];
}

- (void)_dismissViewService
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000192C;
  v2[3] = &unk_100004188;
  v2[4] = self;
  [(NearbyDevicesRemoteViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (void)_nearbyDevicesNavigationControllerDidDismiss
{
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = ax_remote_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v6 userInfo];
    int v18 = 138412802;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ - Did prepare for alert activation context: %@, userInfo: %@", (uint8_t *)&v18, 0x20u);
  }
  v12 = objc_opt_new();
  v13 = [[_NearbyDevicesNavigationController alloc] initWithRootViewController:v12];
  [(NearbyDevicesRemoteViewController *)self setNavigationController:v13];

  v14 = [(NearbyDevicesRemoteViewController *)self navigationController];
  [v14 setDismissObserver:self];

  v15 = [(NearbyDevicesRemoteViewController *)self navigationController];
  [v15 setModalPresentationStyle:1];

  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_dismissViewService"];
  v17 = [v12 navigationItem];
  [v17 setRightBarButtonItem:v16];

  if (v7) {
    v7[2](v7);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  v7 = ax_remote_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v5 userInfo];
    int v11 = 138412802;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ - Did configure with alert configuration context : %@, userInfo : %@", (uint8_t *)&v11, 0x20u);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)_setupRemoteProxy
{
  id v2 = [(NearbyDevicesRemoteViewController *)self _remoteViewControllerProxy];
  [v2 setWallpaperTunnelActive:0];
  [v2 setWallpaperStyle:0 withDuration:0.3];
}

- (void)_dismiss
{
  id v2 = [(NearbyDevicesRemoteViewController *)self _remoteViewControllerProxy];
  [v2 deactivate];
  [v2 invalidate];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000041A8);
}

- (_NearbyDevicesNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end