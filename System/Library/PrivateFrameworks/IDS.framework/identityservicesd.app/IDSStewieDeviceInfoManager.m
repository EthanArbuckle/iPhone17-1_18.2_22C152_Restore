@interface IDSStewieDeviceInfoManager
- (ACMonitoredAccountStore)accountStore;
- (IDSPushHandler)pushHandler;
- (IDSStewieDeviceInfoManager)initWithDelegate:(id)a3 queue:(id)a4;
- (IDSStewieDeviceInfoManager)initWithDelegate:(id)a3 queue:(id)a4 pushHandler:(id)a5 accountStore:(id)a6;
- (IDSStewieDeviceInfoManagerDelegate)delegate;
- (NSArray)accessTokens;
- (NSArray)featureIDs;
- (NSData)pushToken;
- (NSObject)featureChangeObserver;
- (NSString)dsid;
- (NSString)locale;
- (OS_dispatch_queue)mainQueue;
- (void)_requestFeature:(id)a3 completion:(id)a4;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)localeChanged:(id)a3;
- (void)performInitialDeviceInfoCheck;
- (void)requestAccessTokensForFeatures:(id)a3;
- (void)setAccessTokens:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDsid:(id)a3;
- (void)setFeatureChangeObserver:(id)a3;
- (void)setFeatureIDs:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation IDSStewieDeviceInfoManager

- (IDSStewieDeviceInfoManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)IMWeakLinkClass());
  if (qword_100A4AAC0 != -1) {
    dispatch_once(&qword_100A4AAC0, &stru_100985F18);
  }
  v9 = +[NSSet setWithObject:qword_100A4AAC8];
  id v10 = [v8 initWithAccountTypes:v9 delegate:self];

  v11 = +[IDSPushHandler sharedInstance];
  v12 = [(IDSStewieDeviceInfoManager *)self initWithDelegate:v7 queue:v6 pushHandler:v11 accountStore:v10];

  return v12;
}

- (IDSStewieDeviceInfoManager)initWithDelegate:(id)a3 queue:(id)a4 pushHandler:(id)a5 accountStore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IDSStewieDeviceInfoManager;
  v14 = [(IDSStewieDeviceInfoManager *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->_mainQueue, a4);
    objc_storeStrong((id *)&v15->_pushHandler, a5);
    [(IDSPushHandler *)v15->_pushHandler addListener:v15 topics:0 commands:0 queue:v11];
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v15 selector:"localeChanged:" name:IMCurrentPreferredLanguageChangedNotification object:0];

    objc_storeStrong((id *)&v15->_accountStore, a6);
    [(ACMonitoredAccountStore *)v15->_accountStore registerWithCompletion:&stru_100985ED0];
    v17 = (void *)IMWeakLinkClass();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001F07EC;
    v22[3] = &unk_10097E4D0;
    v18 = v15;
    v23 = v18;
    uint64_t v19 = [v17 registerForFeatureChangeNotificationsUsingBlock:v22];
    featureChangeObserver = v18->_featureChangeObserver;
    v18->_featureChangeObserver = v19;
  }
  return v15;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(IDSPushHandler *)self->_pushHandler removeListener:self];
  v4 = [(IDSStewieDeviceInfoManager *)self featureChangeObserver];

  if (v4)
  {
    v5 = (void *)IMWeakLinkClass();
    id v6 = [(IDSStewieDeviceInfoManager *)self featureChangeObserver];
    [v5 unregisterForFeatureChangeNotificationsUsingObserver:v6];

    [(IDSStewieDeviceInfoManager *)self setFeatureChangeObserver:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)IDSStewieDeviceInfoManager;
  [(IDSStewieDeviceInfoManager *)&v7 dealloc];
}

- (void)performInitialDeviceInfoCheck
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing initial stewie device info check", v11, 2u);
  }

  v4 = [(IDSStewieDeviceInfoManager *)self pushHandler];
  v5 = [v4 pushToken];
  [(IDSStewieDeviceInfoManager *)self setPushToken:v5];

  id v6 = sub_1001F0B14((uint64_t)self);
  [(IDSStewieDeviceInfoManager *)self setLocale:v6];

  objc_super v7 = [(IDSStewieDeviceInfoManager *)self accountStore];
  id v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = [v8 normalizedDSID];
  [(IDSStewieDeviceInfoManager *)self setDsid:v9];

  v12[0] = @"networking.st.text-911";
  v12[1] = @"networking.st.find-my";
  v12[2] = @"networking.st.roadside";
  v12[3] = @"networking.st.imessage-lite";
  v12[4] = @"networking.st.sms";
  id v10 = +[NSArray arrayWithObjects:v12 count:5];
  [(IDSStewieDeviceInfoManager *)self requestAccessTokensForFeatures:v10];

  sub_1001F0C28(self);
}

- (void)requestAccessTokensForFeatures:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v9);
        id v11 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001F0ECC;
        v17[3] = &unk_100985EF8;
        v17[4] = self;
        v17[5] = v10;
        id v18 = v11;
        id v12 = v11;
        [(IDSStewieDeviceInfoManager *)self _requestFeature:v10 completion:v17];
        id v13 = [v12 promise];
        [v5 addObject:v13];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v14 = +[CUTUnsafePromise allWithPartialSuccesses:v5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001F1124;
  v16[3] = &unk_10097FCA8;
  v16[4] = self;
  [v14 registerResultBlock:v16];
}

- (void)_requestFeature:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)IMWeakLinkClass() requestFeatureWithId:v6 completion:v5];
}

- (void)localeChanged:(id)a3
{
  id v4 = sub_1001F0B14((uint64_t)self);
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification that locale changed { locale: %@ }", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(IDSStewieDeviceInfoManager *)self locale];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(IDSStewieDeviceInfoManager *)self locale];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found new locale { old: %@, new: %@ }", (uint8_t *)&v10, 0x16u);
    }
    [(IDSStewieDeviceInfoManager *)self setLocale:v4];
    sub_1001F0C28(self);
  }
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = [v5 debugDescription];
    int v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification that push token changed { token: %@ }", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v8 = [(IDSStewieDeviceInfoManager *)self pushToken];
  unsigned __int8 v9 = [v5 isEqualToData:v8];

  if ((v9 & 1) == 0)
  {
    int v10 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IDSStewieDeviceInfoManager *)self pushToken];
      __int16 v12 = [v11 debugDescription];
      id v13 = [v5 debugDescription];
      int v14 = 138412546;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found new token { old: %@, new: %@ }", (uint8_t *)&v14, 0x16u);
    }
    [(IDSStewieDeviceInfoManager *)self setPushToken:v5];
    sub_1001F0C28(self);
  }
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACMonitoredAccountStore - accountWasAdded: %@", buf, 0xCu);
  }

  id v6 = [(IDSStewieDeviceInfoManager *)self mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F1BE4;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACMonitoredAccountStore - accountWasRemoved: %@", buf, 0xCu);
  }

  id v6 = [(IDSStewieDeviceInfoManager *)self mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F1D28;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)accountWasModified:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACMonitoredAccountStore - accountWasModified: %@", buf, 0xCu);
  }

  id v6 = [(IDSStewieDeviceInfoManager *)self mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F1E6C;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)accountCredentialChanged:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ACMonitoredAccountStore - accountCredentialChanged: %@", buf, 0xCu);
  }

  id v6 = [(IDSStewieDeviceInfoManager *)self mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F1FB0;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (IDSStewieDeviceInfoManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewieDeviceInfoManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSArray)featureIDs
{
  return self->_featureIDs;
}

- (void)setFeatureIDs:(id)a3
{
}

- (NSArray)accessTokens
{
  return self->_accessTokens;
}

- (void)setAccessTokens:(id)a3
{
}

- (ACMonitoredAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSObject)featureChangeObserver
{
  return self->_featureChangeObserver;
}

- (void)setFeatureChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accessTokens, 0);
  objc_storeStrong((id *)&self->_featureIDs, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end