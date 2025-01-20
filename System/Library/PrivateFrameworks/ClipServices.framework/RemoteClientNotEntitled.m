@interface RemoteClientNotEntitled
- (BOOL)_connectionClientHasReadAllWebClipsEntitlement;
- (BOOL)_connectionClientIsWebBrowser;
- (BOOL)_connectionIsAuthorizedForClientBundleID:(id)a3;
- (NSXPCConnection)connection;
- (RemoteClientNotEntitled)initWithConnection:(id)a3;
- (void)_requestLocationConsentWithRegion:(id)a3 clipBundleID:(id)a4 appName:(id)a5 record:(id)a6 completion:(id)a7;
- (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 reply:(id)a5;
- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 reply:(id)a4;
- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 reply:(id)a4;
- (void)getWebClipDictionaryWithIdentifier:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation RemoteClientNotEntitled

- (RemoteClientNotEntitled)initWithConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RemoteClientNotEntitled;
  v6 = [(RemoteClientNotEntitled *)&v17 init];
  if (v6)
  {
    if (qword_10001A340 != -1) {
      dispatch_once(&qword_10001A340, &stru_100014BC8);
    }
    [v5 setExportedInterface:qword_10001A338];
    [v5 setExportedObject:v6];
    objc_initWeak(&location, v6);
    objc_initWeak(&from, v5);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000AF0C;
    v12[3] = &unk_100014780;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    [v5 setInterruptionHandler:v12];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000AFEC;
    v9[3] = &unk_100014780;
    objc_copyWeak(&v10, &location);
    objc_copyWeak(&v11, &from);
    [v5 setInvalidationHandler:v9];
    objc_storeStrong((id *)&v6->_connection, a3);
    v7 = v6;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[CPSLocationProvider locationServiceEnabled])
  {
    id v11 = [(RemoteClientNotEntitled *)self connection];
    v12 = v11;
    if (v11) {
      [v11 auditToken];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    id v26 = 0;
    v15 = +[LSBundleProxy bundleProxyWithAuditToken:v27 error:&v26];
    id v14 = v26;

    v16 = [v15 bundleIdentifier];
    if (v16)
    {
      objc_super v17 = +[CPSWebClipStore sharedStore];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000B340;
      v20[3] = &unk_100014CB8;
      id v21 = v16;
      id v25 = v10;
      v22 = self;
      id v23 = v9;
      id v24 = v15;
      [v17 getWebClipWithURL:v8 completionHandler:v20];

      v18 = v21;
    }
    else
    {
      v19 = sub_1000051D4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000C598((uint64_t)v14, v19);
      }
      v18 = +[NSError cps_errorWithCode:10];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
    }
  }
  else
  {
    id v13 = sub_1000051D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "User has denied location confirmation for all app clips.", buf, 2u);
    }
    id v14 = +[NSError cps_errorWithCode:15];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
  }
}

- (void)_requestLocationConsentWithRegion:(id)a3 clipBundleID:(id)a4 appName:(id)a5 record:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, id))a7;
  v16 = +[NSUserDefaults cps_clipServicesDefaults];
  unsigned int v17 = objc_msgSend(v16, "cps_didShowFirstTimeLocationConsent");

  if (v17)
  {
    v15[2](v15, +[CPSLocationProvider locationServiceEnabled]);
  }
  else
  {
    v18 = +[CPSLocationProvider sharedProvider];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000BDB4;
    v19[3] = &unk_100014D08;
    id v24 = v15;
    id v20 = v14;
    id v21 = v12;
    id v22 = v13;
    id v23 = v11;
    [v18 getCurrentLocationWithCompletion:v19];
  }
}

- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RemoteClientNotEntitled *)self _connectionIsAuthorizedForClientBundleID:v6])
  {
    id v8 = +[CPSWebClipStore sharedStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000C13C;
    v10[3] = &unk_100014870;
    id v11 = v7;
    [v8 fetchWebClipsUUIDStringForClientBundleID:v6 completionHandler:v10];
  }
  else
  {
    id v9 = +[NSError cps_errorWithCode:20];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RemoteClientNotEntitled *)self _connectionIsAuthorizedForClientBundleID:v6])
  {
    id v8 = +[CPSWebClipStore sharedStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000C264;
    v10[3] = &unk_100014870;
    id v11 = v7;
    [v8 fetchWebClipsURLStringForClientBundleID:v6 completionHandler:v10];
  }
  else
  {
    id v9 = +[NSError cps_errorWithCode:20];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

- (void)getWebClipDictionaryWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RemoteClientNotEntitled *)self _connectionClientHasReadAllWebClipsEntitlement]|| [(RemoteClientNotEntitled *)self _connectionClientIsWebBrowser])
  {
    id v8 = +[CPSWebClipStore sharedStore];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000C394;
    v10[3] = &unk_100014D30;
    id v11 = v7;
    [v8 getWebClipDictionaryWithIdentifier:v6 completionHandler:v10];
  }
  else
  {
    id v9 = +[NSError cps_errorWithCode:20];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

- (BOOL)_connectionIsAuthorizedForClientBundleID:(id)a3
{
  id v4 = a3;
  if ([(RemoteClientNotEntitled *)self _connectionClientHasReadAllWebClipsEntitlement])
  {
    unsigned __int8 v5 = 1;
  }
  else if ([(RemoteClientNotEntitled *)self _connectionClientIsWebBrowser])
  {
    id v6 = [(RemoteClientNotEntitled *)self connection];
    id v7 = v6;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    id v8 = +[LSBundleProxy bundleProxyWithAuditToken:v11 error:0];

    id v9 = [v8 bundleIdentifier];
    unsigned __int8 v5 = [v9 isEqualToString:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_connectionClientHasReadAllWebClipsEntitlement
{
  v2 = [(RemoteClientNotEntitled *)self connection];
  v3 = [v2 valueForEntitlement:@"com.apple.private.ClipServices.read-all-web-clips"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_connectionClientIsWebBrowser
{
  v2 = [(RemoteClientNotEntitled *)self connection];
  v3 = [v2 valueForEntitlement:@"com.apple.developer.web-browser"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end