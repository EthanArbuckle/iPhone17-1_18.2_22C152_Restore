@interface AKAuthorizationPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)authorizationResponseValidator;
- (id)fetchIconBlock;
- (id)presentationCompletion;
- (void)_callCompletionBlockWithAuthorization:(id)a3 error:(id)a4;
- (void)authorizationRequestFinishedWithAuthorization:(id)a3 error:(id)a4 completion:(id)a5;
- (void)authorizationRequestInitiatedWithUserProvidedInformation:(id)a3 completion:(id)a4;
- (void)continueFetchingIconWithCompletion:(id)a3;
- (void)dealloc;
- (void)presentAuthorizationWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAuthorizationResponseValidator:(id)a3;
- (void)setFetchIconBlock:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKAuthorizationPresenter

- (void)presentAuthorizationWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, void, id))a5;
  id v25 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v25];
  id v9 = v25;
  if (!v8)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10017C4A0((uint64_t)v9, v10);
    }
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:v8 forKeyedSubscript:@"context"];
  v12 = +[NSXPCListener anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v12;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  [(AKAuthorizationPresenter *)self setPresentationCompletion:v7];
  if (SBSGetScreenLockStatus())
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device screen is locked, cancelling authorization.", buf, 2u);
    }

    id v15 = +[NSError ak_errorWithCode:-7013];
    v7[2](v7, 0, v15);
  }
  else
  {
    id v15 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.AuthKitUIService" viewControllerClassName:@"AKAuthorizationRemoteViewController"];
    v16 = objc_opt_new();
    v17 = [(NSXPCListener *)self->_remoteListener endpoint];
    v18 = [v17 _endpoint];
    [v16 setXpcEndpoint:v18];

    [v16 setUserInfo:v11];
    v19 = objc_opt_new();
    id v20 = +[SBSRemoteAlertHandle newHandleWithDefinition:v15 configurationContext:v16];
    [(AKAuthorizationPresenter *)self setRemoteAlertHandle:v20];

    v21 = [(AKAuthorizationPresenter *)self remoteAlertHandle];
    [v21 registerObserver:self];

    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(AKAuthorizationPresenter *)self remoteAlertHandle];
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", buf, 0xCu);
    }
    v24 = [(AKAuthorizationPresenter *)self remoteAlertHandle];
    [v24 activateWithContext:v19];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[AKAuthorizationPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)authorizationRequestFinishedWithAuthorization:(id)a3 error:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Remote view sent a finish event", v12, 2u);
  }

  [(AKAuthorizationPresenter *)self _callCompletionBlockWithAuthorization:v10 error:v9];
  v8[2](v8, 1, 0);
}

- (void)authorizationRequestInitiatedWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote view sent a user response event: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(AKAuthorizationPresenter *)self authorizationResponseValidator];
  ((void (**)(void, id, id))v9)[2](v9, v6, v7);
}

- (void)continueFetchingIconWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = [(AKAuthorizationPresenter *)self fetchIconBlock];

  if (v5)
  {
    id v6 = [(AKAuthorizationPresenter *)self fetchIconBlock];
    v6[2](v6, v4);
  }
  else
  {
    id v6 = +[NSError ak_errorWithCode:-7027];
    v4[2](v4, 0);
  }
}

- (void)_callCompletionBlockWithAuthorization:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPresenter *)self presentationCompletion];

  if (v7)
  {
    v8 = [(AKAuthorizationPresenter *)self presentationCompletion];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(AKAuthorizationPresenter *)self setPresentationCompletion:0];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  v4 = _AKLogSystem();
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
  int v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated.", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[NSError ak_errorWithCode:-7034];
  [(AKAuthorizationPresenter *)self _callCompletionBlockWithAuthorization:0 error:v6];
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
      int v10 = _AKLogSystem();
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
  v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100186800((uint64_t)v6, (uint64_t)v7, v12);
  }

  uint64_t v11 = +[NSError ak_errorWithCode:-7034 underlyingError:v7];
LABEL_12:
  v13 = (void *)v11;
  [(AKAuthorizationPresenter *)self _callCompletionBlockWithAuthorization:0 error:v11];
}

- (void)dealloc
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10017C64C((uint64_t)self, v3);
  }

  id v4 = [(AKAuthorizationPresenter *)self remoteAlertHandle];
  [v4 unregisterObserver:self];

  int v5 = [(AKAuthorizationPresenter *)self remoteAlertHandle];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationPresenter;
  [(AKAuthorizationPresenter *)&v6 dealloc];
}

- (id)authorizationResponseValidator
{
  return self->_authorizationResponseValidator;
}

- (void)setAuthorizationResponseValidator:(id)a3
{
}

- (id)fetchIconBlock
{
  return self->_fetchIconBlock;
}

- (void)setFetchIconBlock:(id)a3
{
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
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
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong(&self->_fetchIconBlock, 0);

  objc_storeStrong(&self->_authorizationResponseValidator, 0);
}

@end