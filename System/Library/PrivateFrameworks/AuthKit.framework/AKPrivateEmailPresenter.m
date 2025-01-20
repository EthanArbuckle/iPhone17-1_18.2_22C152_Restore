@interface AKPrivateEmailPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)privateEmailCompletion;
- (void)_callCompletionBlockWithEmail:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)presentPrivateEmailWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)privateEmailFetchCompletedWith:(id)a3 error:(id)a4 completion:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPrivateEmailCompletion:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKPrivateEmailPresenter

- (void)presentPrivateEmailWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void, id))a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = [v7 altDSID];
  [v9 setObject:v10 forKeyedSubscript:AKAltDSID];

  v11 = [v7 key];
  [v9 setObject:v11 forKeyedSubscript:AKPrivateEmailIdentifierKey];

  v12 = [v7 clientAppBundleId];

  if (v12)
  {
    v13 = [v7 clientAppBundleId];
    [v9 setObject:v13 forKeyedSubscript:AKPrivateEmailClientAppBundleIdKey];
  }
  v14 = _AKLogHme();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Context info %@", (uint8_t *)&v26, 0xCu);
  }

  v15 = +[NSXPCListener anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v15;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  [(AKPrivateEmailPresenter *)self setPrivateEmailCompletion:v8];
  if (SBSGetScreenLockStatus())
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device screen is locked, cancelling authorization.", (uint8_t *)&v26, 2u);
    }

    id v18 = +[NSError ak_errorWithCode:-7013];
    v8[2](v8, 0, v18);
  }
  else
  {
    id v18 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.AuthKitUIService" viewControllerClassName:@"AKPrivateEmailRemoteViewController"];
    v19 = objc_opt_new();
    v20 = [(NSXPCListener *)self->_remoteListener endpoint];
    v21 = [v20 _endpoint];
    [v19 setXpcEndpoint:v21];

    [v19 setUserInfo:v9];
    v22 = objc_opt_new();
    id v23 = +[SBSRemoteAlertHandle newHandleWithDefinition:v18 configurationContext:v19];
    [(AKPrivateEmailPresenter *)self setRemoteAlertHandle:v23];

    v24 = [(AKPrivateEmailPresenter *)self remoteAlertHandle];
    [v24 registerObserver:self];

    v25 = [(AKPrivateEmailPresenter *)self remoteAlertHandle];
    [v25 activateWithContext:v22];
  }
}

- (void)privateEmailFetchCompletedWith:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  v11 = _AKLogHme();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received: %@ (%@)", (uint8_t *)&v12, 0x16u);
  }

  [(AKPrivateEmailPresenter *)self _callCompletionBlockWithEmail:v8 error:v9];
  v10[2](v10, 1, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[AKPrivateEmailPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)_callCompletionBlockWithEmail:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(AKPrivateEmailPresenter *)self privateEmailCompletion];

  if (v7)
  {
    id v8 = [(AKPrivateEmailPresenter *)self privateEmailCompletion];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(AKPrivateEmailPresenter *)self setPrivateEmailCompletion:0];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) activated.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  int v5 = _AKLogHme();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated.", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[NSError ak_errorWithCode:-7034];
  [(AKPrivateEmailPresenter *)self _callCompletionBlockWithEmail:0 error:v6];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqualToString:SBSRemoteAlertHandleInvalidationErrorDomain])
  {
    if ([v7 code] == (id)4)
    {

LABEL_6:
      v10 = _AKLogHme();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated by request.", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v11 = +[NSError ak_errorWithCode:-7003];
      goto LABEL_12;
    }
    id v9 = [v7 code];

    if (v9 == (id)5) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v12 = _AKLogHme();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100186800((uint64_t)v6, (uint64_t)v7, v12);
  }

  uint64_t v11 = +[NSError ak_errorWithCode:-7034 underlyingError:v7];
LABEL_12:
  id v13 = (void *)v11;
  [(AKPrivateEmailPresenter *)self _callCompletionBlockWithEmail:0 error:v11];
}

- (void)dealloc
{
  id v3 = [(AKPrivateEmailPresenter *)self remoteAlertHandle];
  [v3 unregisterObserver:self];

  id v4 = [(AKPrivateEmailPresenter *)self remoteAlertHandle];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)AKPrivateEmailPresenter;
  [(AKPrivateEmailPresenter *)&v5 dealloc];
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)privateEmailCompletion
{
  return self->_privateEmailCompletion;
}

- (void)setPrivateEmailCompletion:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_privateEmailCompletion, 0);

  objc_storeStrong((id *)&self->_remoteListener, 0);
}

@end