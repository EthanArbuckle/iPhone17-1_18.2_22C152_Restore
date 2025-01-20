@interface FBAOnDemandPinParingNavigationController
- (FBAOnDemandPinParingNavigationController)initWithDevice:(id)a3 completion:(id)a4;
- (FBKGroupedDevice)pairingDevice;
- (id)completion;
- (void)dealloc;
- (void)didCancelPairing:(id)a3;
- (void)didPinPair:(id)a3;
- (void)didPinPairWithDevice:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPairingDevice:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAOnDemandPinParingNavigationController

- (FBAOnDemandPinParingNavigationController)initWithDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[UIStoryboard fbaMainStoryboard];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 instantiateViewControllerWithIdentifier:v10];

  [v11 setDevice:v6];
  [v11 setContext:1];
  v15.receiver = self;
  v15.super_class = (Class)FBAOnDemandPinParingNavigationController;
  v12 = [(FBAOnDemandPinParingNavigationController *)&v15 initWithRootViewController:v11];
  v13 = v12;
  if (v12)
  {
    [(FBAOnDemandPinParingNavigationController *)v12 setCompletion:v7];
    [(FBAOnDemandPinParingNavigationController *)v13 setPairingDevice:v6];
  }

  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FBAOnDemandPinParingNavigationController;
  [(FBAOnDemandPinParingNavigationController *)&v5 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"didPinPair:" name:FBKDeviceManagerDidPinPairWithDeviceNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didCancelPairing:" name:@"FBAPinPairingViewControllerDidCancel" object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBAOnDemandPinParingNavigationController;
  [(FBAOnDemandPinParingNavigationController *)&v4 dealloc];
}

- (void)didCancelPairing:(id)a3
{
  objc_super v4 = +[FBALog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [(FBAOnDemandPinParingNavigationController *)self pairingDevice];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did cancel pairing with device [%{public}@]", (uint8_t *)&v6, 0xCu);
  }
  [(FBAOnDemandPinParingNavigationController *)self didPinPairWithDevice:0];
}

- (void)didPinPair:(id)a3
{
  objc_super v4 = [a3 object];
  objc_super v5 = +[FBALog ffu];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing navigation controller got pairing success for device [%{public}@]", buf, 0xCu);
  }

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000135C4;
  v8[3] = &unk_1000F26D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)didPinPairWithDevice:(id)a3
{
  if (a3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v4 = +[FBKDeviceManager sharedInstance];
    objc_super v5 = [v4 configuredDevices];

    id obj = v5;
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v23 = *(void *)v25;
      *(void *)&long long v7 = 138543362;
      long long v21 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v23) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v11 = [v10 dedSharingDevice:v21];
          v12 = [v11 address];
          v13 = [(FBAOnDemandPinParingNavigationController *)self pairingDevice];
          v14 = [v13 dedSharingDevice];
          objc_super v15 = [v14 address];
          unsigned int v16 = [v12 isEqualToString:v15];

          if (v16)
          {
            v17 = +[FBALog ded];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v29 = v10;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "On demand pairing found paired sharing device [%{public}@]", buf, 0xCu);
            }

            v18 = [(FBAOnDemandPinParingNavigationController *)self completion];
            ((void (**)(void, void *))v18)[2](v18, v10);
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v19 = [(FBAOnDemandPinParingNavigationController *)self completion];
    v19[2](v19, 0);
  }
  v20 = [(FBAOnDemandPinParingNavigationController *)self presentingViewController];
  [v20 dismissViewControllerAnimated:1 completion:0];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (FBKGroupedDevice)pairingDevice
{
  return (FBKGroupedDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDevice, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end