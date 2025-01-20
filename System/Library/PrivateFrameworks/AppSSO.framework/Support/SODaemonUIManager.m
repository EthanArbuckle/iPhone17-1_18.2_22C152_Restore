@interface SODaemonUIManager
+ (id)_queue;
- (BOOL)_closeRemoteUIWithError:(id *)a3;
- (BOOL)beginAuthorizationWithRequestParameters:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)cancelAuthorization:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SODaemonUIManager)init;
- (SODaemonUIProtocol)delegate;
- (id)invalidationHandler;
- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)extensionCleanupWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation SODaemonUIManager

+ (id)_queue
{
  if (qword_100016158 != -1) {
    dispatch_once(&qword_100016158, &stru_100010488);
  }
  v2 = (void *)qword_100016150;
  return v2;
}

- (SODaemonUIManager)init
{
  v3 = sub_100004600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SODaemonUIManager init]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SODaemonUIManager;
  return [(SODaemonUIManager *)&v5 init];
}

- (void)dealloc
{
  v3 = sub_100004600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A06C();
  }

  [(SODaemonUIManager *)self _closeRemoteUIWithError:0];
  v4.receiver = self;
  v4.super_class = (Class)SODaemonUIManager;
  [(SODaemonUIManager *)&v4 dealloc];
}

- (BOOL)beginAuthorizationWithRequestParameters:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = sub_100004600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[SODaemonUIManager beginAuthorizationWithRequestParameters:profile:error:]";
    __int16 v39 = 2112;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  self->_isInternalExtension = [v8 useInternalExtensions];
  v11 = +[NSXPCListener anonymousListener];
  uiListener = self->_uiListener;
  self->_uiListener = v11;

  [(NSXPCListener *)self->_uiListener setDelegate:self];
  v13 = self->_uiListener;
  v14 = +[SODaemonUIManager _queue];
  [(NSXPCListener *)v13 _setQueue:v14];

  [(NSXPCListener *)self->_uiListener resume];
  if (!SBSGetScreenLockStatus()) {
    goto LABEL_15;
  }
  if (([v8 canShowOnCoverScreen] & 1) == 0
    && !+[SODaemonUtils isInternalBuild])
  {
    id v15 = [v9 screenLockedBehavior];
    v16 = sub_100004600();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15 == (id)2)
    {
      if (v17) {
        sub_10000A160();
      }

      if (a5)
      {
        id v18 = sub_10000501C();
        uint64_t v19 = -5;
LABEL_23:
        [v18 errorWithCode:v19];
        BOOL v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
    }
    else
    {
      if (v17) {
        sub_10000A194();
      }

      if (a5)
      {
        id v18 = sub_10000501C();
        uint64_t v19 = -3;
        goto LABEL_23;
      }
    }
    BOOL v30 = 0;
    goto LABEL_30;
  }
  v20 = sub_100004600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10000A120();
  }

LABEL_15:
  id v21 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.AppSSOUIService" viewControllerClassName:@"SOUIServiceViewController"];
  v22 = objc_opt_new();
  v23 = sub_100004AB4((uint64_t)v22, v8, v9);
  [v22 setUserInfo:v23];

  v24 = [(NSXPCListener *)self->_uiListener endpoint];
  v25 = [v24 _endpoint];
  [v22 setXpcEndpoint:v25];

  v26 = objc_opt_new();
  [v26 setActivatingForSiri:0];
  v27 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v21 configurationContext:v22];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v27;

  v29 = self->_remoteAlertHandle;
  BOOL v30 = v29 != 0;
  if (v29)
  {
    [(SBSRemoteAlertHandle *)v29 registerObserver:self];
    v31 = [v8 identifier];
    requestThatPresentedRemoteAlert = self->_requestThatPresentedRemoteAlert;
    self->_requestThatPresentedRemoteAlert = v31;

    v33 = sub_100004600();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = self->_remoteAlertHandle;
      *(_DWORD *)buf = 138543362;
      v38 = (const char *)v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "activating SBSRemoteAlertHandle %{public}@", buf, 0xCu);
    }

    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v26];
  }
  else
  {
    v35 = sub_100004600();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000A0EC();
    }

    if (a5)
    {
      *a5 = [sub_10000501C() errorWithCode:-3];
    }
  }

LABEL_30:
  return v30;
}

- (BOOL)cancelAuthorization:(id)a3 error:(id *)a4
{
  v6 = sub_100004600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SODaemonUIManager cancelAuthorization:error:]";
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  return [(SODaemonUIManager *)self _closeRemoteUIWithError:a4];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100004600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A1C8((uint64_t)self, (uint64_t)v4, v5);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = (SBSRemoteAlertHandle *)a3;
  objc_super v5 = sub_100004600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A270((uint64_t)self, (uint64_t)v4, v5);
  }

  if (self->_remoteAlertHandle == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      BOOL isInternalExtension = self->_isInternalExtension;

      if (!isInternalExtension)
      {
        int v8 = [sub_10000501C() errorWithCode:-3];
        [(SODaemonUIManager *)self authorizationDidCompleteWithCredential:0 error:v8 completion:0];
      }
    }
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  v6 = (SBSRemoteAlertHandle *)a3;
  id v7 = a4;
  int v8 = sub_100004600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    remoteAlertHandle = self->_remoteAlertHandle;
    int v12 = 136316162;
    v13 = "-[SODaemonUIManager remoteAlertHandle:didInvalidateWithError:]";
    __int16 v14 = 2114;
    id v15 = remoteAlertHandle;
    __int16 v16 = 2114;
    BOOL v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s _remoteAlertHandle = %{public}@, handle = %{public}@, error = %{public}@ on %@", (uint8_t *)&v12, 0x34u);
  }

  if (self->_remoteAlertHandle == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      __int16 v10 = [sub_10000501C() errorWithCode:-3];
      [(SODaemonUIManager *)self authorizationDidCompleteWithCredential:0 error:v10 completion:0];
    }
  }
}

- (BOOL)_closeRemoteUIWithError:(id *)a3
{
  objc_super v5 = sub_100004600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    remoteAlertHandle = self->_remoteAlertHandle;
    int v11 = 136315650;
    int v12 = "-[SODaemonUIManager _closeRemoteUIWithError:]";
    __int16 v13 = 2114;
    __int16 v14 = remoteAlertHandle;
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s _remoteAlertHandle = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }

  id v7 = self->_remoteAlertHandle;
  if (v7)
  {
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle unregisterObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    int v8 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

    id v9 = 0;
    if (!a3) {
      return v7 != 0;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    id v9 = [sub_10000501C() internalErrorWithMessage:@"SBSRemoteAlertHandle is nil"];
LABEL_8:
    *a3 = v9;
  }
  return v7 != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_100004600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000A33C();
  }

  p_uiServiceConnection = &self->_uiServiceConnection;
  objc_storeStrong((id *)&self->_uiServiceConnection, a4);
  __int16 v10 = [sub_10000571C() interfaceWithInternalProtocol:&OBJC_PROTOCOL___SODaemonUIProtocol];
  [(NSXPCConnection *)self->_uiServiceConnection setExportedInterface:v10];

  [(NSXPCConnection *)self->_uiServiceConnection setExportedObject:self];
  [(NSXPCConnection *)self->_uiServiceConnection resume];
  int v11 = [sub_10000571C() interfaceWithInternalProtocol:&OBJC_PROTOCOL___SOUIServiceProtocol];
  [(NSXPCConnection *)self->_uiServiceConnection setRemoteObjectInterface:v11];

  objc_initWeak(&location, self);
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_100005800;
  BOOL v17 = &unk_100010310;
  objc_copyWeak(&v18, &location);
  [(SODaemonUIManager *)self setInvalidationHandler:&v14];
  int v12 = [(SODaemonUIManager *)self invalidationHandler];
  [(NSXPCConnection *)*p_uiServiceConnection setInvalidationHandler:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 1;
}

- (void)connectionInvalidated
{
  v3 = sub_100004600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    objc_super v5 = "-[SODaemonUIManager connectionInvalidated]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void, void *))a5;
  int v11 = sub_100004600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v17 = 136316162;
    id v18 = "-[SODaemonUIManager authorizationDidCompleteWithCredential:error:completion:]";
    __int16 v19 = 2114;
    id v20 = WeakRetained;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2112;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s delegate = %{public}@, credential = %{public}@, error = %{public}@ on %@", (uint8_t *)&v17, 0x34u);
  }
  p_delegate = &self->_delegate;
  id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v14)
  {
    objc_storeWeak((id *)p_delegate, 0);
    [v14 authorizationDidCompleteWithCredential:v8 error:v9 completion:v10];
  }
  else
  {
    uint64_t v15 = sub_100004600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "authorization already finished => ignoring complete request", (uint8_t *)&v17, 2u);
    }

    if (v10)
    {
      __int16 v16 = [sub_10000501C() silentInternalErrorWithMessage:@"authorization already finished => ignoring complete request"];
      v10[2](v10, 0, v16);
    }
  }
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000A3BC();
  }

  uiServiceConnection = self->_uiServiceConnection;
  if (uiServiceConnection)
  {
    __int16 v10 = [(NSXPCConnection *)uiServiceConnection remoteObjectProxyWithErrorHandler:&stru_1000104C8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005C60;
    v12[3] = &unk_1000104F0;
    v12[4] = self;
    id v13 = v7;
    [v10 finishAuthorization:v6 completion:v12];
  }
  else if (v7)
  {
    int v11 = [sub_10000501C() internalErrorWithMessage:@"no uiServiceConnection"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)extensionCleanupWithCompletion:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  objc_super v5 = sub_100004600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A4B8();
  }

  uiServiceConnection = self->_uiServiceConnection;
  if (uiServiceConnection)
  {
    id v7 = [(NSXPCConnection *)uiServiceConnection remoteObjectProxyWithErrorHandler:&stru_100010510];
    [v7 extensionCleanupWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v7 = [sub_10000501C() internalErrorWithMessage:@"no uiServiceConnection"];
    v4[2](v4, 0, v7);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (SODaemonUIProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SODaemonUIProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_uiServiceConnection, 0);
  objc_storeStrong((id *)&self->_uiListener, 0);
  objc_storeStrong((id *)&self->_requestThatPresentedRemoteAlert, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end