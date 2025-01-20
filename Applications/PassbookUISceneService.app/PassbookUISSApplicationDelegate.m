@interface PassbookUISSApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)inAppPaymentInterfaceWillPresentWithSceneSession:(id)a3;
@end

@implementation PassbookUISSApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [a5 userActivities];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = PKPassbookUISSUserActivityTypeInAppPayment;
    uint64_t v12 = PKPassbookUISSUserActivityTypePeerPaymentRegistration;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) activityType];
      if ([v14 isEqualToString:v11])
      {
        id v15 = objc_alloc((Class)UISceneConfiguration);
        v16 = [v6 role];
        CFStringRef v17 = @"InAppPaymentConfiguration";
        goto LABEL_13;
      }
      if ([v14 isEqualToString:v12]) {
        break;
      }

      if (v9 == (id)++v13)
      {
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v15 = objc_alloc((Class)UISceneConfiguration);
    v16 = [v6 role];
    CFStringRef v17 = @"PeerPaymentRegistrationConfiguration";
LABEL_13:
    id v18 = [v15 initWithName:v17 sessionRole:v16];

    if (v18) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_10:
  }
  id v19 = objc_alloc((Class)UISceneConfiguration);
  v20 = [v6 role];
  id v18 = [v19 initWithName:@"Default Configuration" sessionRole:v20];

LABEL_15:

  return v18;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v7 = a4;
  p_inAppSceneSession = &self->_inAppSceneSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inAppSceneSession);
  if (WeakRetained && [v7 containsObject:WeakRetained])
  {
    objc_storeWeak((id *)p_inAppSceneSession, 0);

    id WeakRetained = 0;
  }
}

- (void)inAppPaymentInterfaceWillPresentWithSceneSession:(id)a3
{
  id v4 = a3;
  p_inAppSceneSession = &self->_inAppSceneSession;
  id WeakRetained = objc_loadWeakRetained((id *)p_inAppSceneSession);
  id v7 = WeakRetained;
  if (WeakRetained) {
    BOOL v8 = WeakRetained == v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = +[UIApplication sharedApplication];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000058E0;
    v10[3] = &unk_10000C3C0;
    id v11 = v7;
    [v9 requestSceneSessionDestruction:v11 options:0 errorHandler:v10];
  }
  objc_storeWeak((id *)p_inAppSceneSession, v4);
}

- (void).cxx_destruct
{
}

@end