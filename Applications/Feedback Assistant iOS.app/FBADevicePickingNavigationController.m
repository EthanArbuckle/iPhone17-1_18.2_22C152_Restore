@interface FBADevicePickingNavigationController
- (FBADevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5;
- (id)completion;
- (id)initForPlatform:(id)a3 completion:(id)a4;
- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4;
- (void)deviceChoicesControllerDidCancelWithController:(id)a3;
- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4;
- (void)pairingViewDidCancel;
- (void)pairingViewDidClose;
- (void)setCompletion:(id)a3;
@end

@implementation FBADevicePickingNavigationController

- (FBADevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = +[UIStoryboard fbaMainStoryboard];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [v10 instantiateViewControllerWithIdentifier:v12];

  [v13 setDeviceChoices:v9];
  [v13 setIsMultiSelect:v5];
  [v13 setChoiceDelegate:self];
  v17.receiver = self;
  v17.super_class = (Class)FBADevicePickingNavigationController;
  v14 = [(FBADevicePickingNavigationController *)&v17 initWithRootViewController:v13];
  v15 = v14;
  if (v14) {
    [(FBADevicePickingNavigationController *)v14 setCompletion:v8];
  }

  return v15;
}

- (id)initForPlatform:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIStoryboard fbaMainStoryboard];
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 instantiateViewControllerWithIdentifier:v10];

  [v11 setContext:4];
  [v11 setFilterPlatform:v7];

  [v11 setDelegate:self];
  v15.receiver = self;
  v15.super_class = (Class)FBADevicePickingNavigationController;
  v12 = [(FBADevicePickingNavigationController *)&v15 initWithRootViewController:v11];
  v13 = v12;
  if (v12) {
    [(FBADevicePickingNavigationController *)v12 setCompletion:v6];
  }

  return v13;
}

- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[FBALog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 description];
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device picker paired new device [%{public}@]", buf, 0xCu);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003E7E8;
    v13[3] = &unk_1000F26D8;
    v13[4] = self;
    id v14 = v6;
    [(FBADevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    v10 = +[FBALog ded];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        v12 = [v7 description];
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "removed device [%{public}@] while being asked to pair with new one, noop", buf, 0xCu);
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "how did we get here?", buf, 2u);
    }
  }
}

- (void)pairingViewDidClose
{
  v2 = +[FBALog ded];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000A6648(v2);
  }
}

- (void)pairingViewDidCancel
{
  v3 = +[FBALog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device picker paired no device", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E9A4;
  v4[3] = &unk_1000F2518;
  v4[4] = self;
  [(FBADevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v4];
}

- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4
{
  id v5 = a4;
  id v6 = +[FBALog ded];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 valueForKeyPath:@"publicLogDescription"];
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device picker chose devices [%{public}@]", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003EB88;
  v9[3] = &unk_1000F26D8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(FBADevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v9];
}

- (void)deviceChoicesControllerDidCancelWithController:(id)a3
{
  v4 = +[FBALog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device picker chose no device", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003ED08;
  v5[3] = &unk_1000F2518;
  v5[4] = self;
  [(FBADevicePickingNavigationController *)self dismissViewControllerAnimated:1 completion:v5];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end