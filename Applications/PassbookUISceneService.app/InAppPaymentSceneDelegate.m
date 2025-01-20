@interface InAppPaymentSceneDelegate
- (InAppPaymentSceneDelegate)init;
- (UIWindow)window;
- (void)_dismissWithReason:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation InAppPaymentSceneDelegate

- (InAppPaymentSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)InAppPaymentSceneDelegate;
  return [(InAppPaymentSceneDelegate *)&v3 init];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v8;
    v11 = [v10 userActivities];
    v24 = [v11 pk_anyObjectPassingTest:&stru_10000C518];

    v12 = [v24 userInfo];
    v13 = [v12 objectForKeyedSubscript:@"hostSceneIdentifier"];
    v14 = [v12 objectForKeyedSubscript:@"hostSceneBundleIdentifier"];
    if ([v14 length])
    {
      id v23 = v14;
    }
    else
    {
      id v23 = [v12 objectForKeyedSubscript:@"hostBundleIdentifier"];
    }
    if ([v13 length] && objc_msgSend(v23, "length"))
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v9);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100007370;
      v34[3] = &unk_10000C3E8;
      objc_copyWeak(&v35, (id *)location);
      objc_copyWeak(&v36, &from);
      v15 = objc_retainBlock(v34);
      v16 = +[UIApplication sharedApplication];
      id val = [v16 delegate];

      objc_initWeak(&v33, val);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100007534;
      v25[3] = &unk_10000C568;
      objc_copyWeak(&v30, (id *)location);
      id v26 = v12;
      v17 = v15;
      id v29 = v17;
      id v27 = v22;
      id v28 = v13;
      objc_copyWeak(&v31, &v33);
      objc_copyWeak(&v32, &from);
      v18 = objc_retainBlock(v25);
      ((void (*)(void *, void))v18[2])(v18, 0);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v33);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = v13;
        __int16 v41 = 2112;
        id v42 = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Destroying in-app payment scene due to missing hostSceneIdentifier %@ or hostBundleIdentifier %@", location, 0x16u);
      }

      v20 = +[UIApplication sharedApplication];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000072AC;
      v38[3] = &unk_10000C3C0;
      id v39 = v9;
      [v20 requestSceneSessionDestruction:v39 options:0 errorHandler:v38];
    }
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(InAppPaymentSceneDelegate *)self _dismissWithReason:@"scene did enter background"];
  }
}

- (void)_dismissWithReason:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    inAppPaymentViewController = self->_inAppPaymentViewController;
    int v8 = 134349314;
    id v9 = inAppPaymentViewController;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationRemoteAlertViewController (%{public}p): Dismissing with reason: %@", (uint8_t *)&v8, 0x16u);
  }

  [(PKPaymentAuthorizationRemoteAlertViewController *)self->_inAppPaymentViewController askForDismissalWithReason:1 error:0 completion:0];
  hostSceneIdentifier = self->_hostSceneIdentifier;
  self->_hostSceneIdentifier = 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_hostSceneIdentifier, 0);

  objc_storeStrong((id *)&self->_inAppPaymentViewController, 0);
}

@end