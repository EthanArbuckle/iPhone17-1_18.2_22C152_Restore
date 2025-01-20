@interface PeerPaymentRegistrationSceneDelegate
- (PeerPaymentRegistrationSceneDelegate)init;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation PeerPaymentRegistrationSceneDelegate

- (PeerPaymentRegistrationSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PeerPaymentRegistrationSceneDelegate;
  return [(PeerPaymentRegistrationSceneDelegate *)&v3 init];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    v12 = [v10 userActivities];
    v13 = [v12 pk_anyObjectPassingTest:&stru_10000C398];

    v14 = [v13 userInfo];
    v27 = [v14 objectForKeyedSubscript:@"hostSceneIdentifier"];
    v26 = [v14 objectForKeyedSubscript:@"hostSceneBundleIdentifier"];
    if ([v26 length])
    {
      id v25 = v26;
    }
    else
    {
      id v25 = [v14 objectForKeyedSubscript:@"hostBundleIdentifier"];
    }
    if ([v27 length] && objc_msgSend(v25, "length"))
    {
      id v15 = [objc_alloc((Class)PKPeerPaymentRegistrationViewController) initWithUserInfo:v14];
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v9);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100005208;
      v30[3] = &unk_10000C3E8;
      objc_copyWeak(&v31, (id *)location);
      objc_copyWeak(&v32, &from);
      v16 = objc_retainBlock(v30);
      [v15 setDismissHandler:v16];
      v24 = v13;
      id v17 = [objc_alloc((Class)UIWindow) initWithWindowScene:v11];
      [v17 setRootViewController:v15];
      [v17 makeKeyAndVisible];
      [(PeerPaymentRegistrationSceneDelegate *)self setWindow:v17];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000053B8;
      v28[3] = &unk_10000C410;
      v18 = v16;
      id v29 = v18;
      [v15 startRegistrationFlowWithCompletion:v28];
      id v19 = v11;
      registrationViewController = self->_registrationViewController;
      self->_registrationViewController = (PKPeerPaymentRegistrationViewController *)v15;
      id v21 = v15;

      id v11 = v19;
      v13 = v24;

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = v27;
        __int16 v37 = 2112;
        id v38 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Destroying peer payment registration scene due to missing hostSceneIdentifier %@ or hostBundleIdentifier %@", location, 0x16u);
      }

      v23 = +[UIApplication sharedApplication];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100005144;
      v34[3] = &unk_10000C3C0;
      id v35 = v9;
      [v23 requestSceneSessionDestruction:v35 options:0 errorHandler:v34];
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
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      registrationViewController = self->_registrationViewController;
      int v8 = 134349056;
      id v9 = registrationViewController;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRegistrationViewController (%{public}p): Dismissing due to sceneDidEnterBackground", (uint8_t *)&v8, 0xCu);
    }

    [(PKPeerPaymentRegistrationViewController *)self->_registrationViewController dismissViewControllerAnimated:1 completion:0];
  }
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

  objc_storeStrong((id *)&self->_registrationViewController, 0);
}

@end