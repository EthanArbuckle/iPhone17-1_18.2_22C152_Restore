@interface AKPasswordResetPresenter
- (BOOL)isPasswordResetRequestInProgress;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)resetCompletion;
- (void)_launchViewServiceWithUserInfo:(id)a3;
- (void)dealloc;
- (void)passwordResetFinishedWithResult:(id)a3 error:(id)a4 completion:(id)a5;
- (void)presentWithContext:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setIsPasswordResetRequestInProgress:(BOOL)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRemoteListener:(id)a3;
- (void)setResetCompletion:(id)a3;
@end

@implementation AKPasswordResetPresenter

- (void)presentWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  v8 = +[AKFeatureManager sharedManager];
  unsigned __int8 v9 = [v8 isForgotPasswordNativeTakeoverEnabled];

  if (v9)
  {
    if (![(AKPasswordResetPresenter *)self isPasswordResetRequestInProgress])
    {
      [(AKPasswordResetPresenter *)self setIsPasswordResetRequestInProgress:1];
      id v20 = 0;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v20];
      id v13 = v20;
      if (!v14)
      {
        v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10017C4A0((uint64_t)v13, v15);
        }
      }
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      [v16 setObject:v14 forKeyedSubscript:@"context"];
      v17 = +[NSXPCListener anonymousListener];
      [(AKPasswordResetPresenter *)self setRemoteListener:v17];

      v18 = [(AKPasswordResetPresenter *)self remoteListener];
      [v18 setDelegate:self];

      v19 = [(AKPasswordResetPresenter *)self remoteListener];
      [v19 resume];

      [(AKPasswordResetPresenter *)self setResetCompletion:v7];
      [(AKPasswordResetPresenter *)self _launchViewServiceWithUserInfo:v16];

      goto LABEL_17;
    }
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10017C45C(v10);
    }

    if (v7)
    {
      uint64_t v11 = -7113;
LABEL_11:
      id v13 = +[NSError ak_errorWithCode:v11];
      v7[2](v7, 0, v13);
LABEL_17:
    }
  }
  else
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10017C518(v12);
    }

    if (v7)
    {
      uint64_t v11 = -7027;
      goto LABEL_11;
    }
  }
}

- (void)_launchViewServiceWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.AuthKitUIService" viewControllerClassName:@"AKPasswordResetRemoteViewController"];
  id v6 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v7 = [(AKPasswordResetPresenter *)self remoteListener];
  v8 = [v7 endpoint];
  unsigned __int8 v9 = [v8 _endpoint];
  [v6 setXpcEndpoint:v9];

  [v6 setUserInfo:v4];
  id v10 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:v5 configurationContext:v6];
  [(AKPasswordResetPresenter *)self setRemoteAlertHandle:v11];

  v12 = [(AKPasswordResetPresenter *)self remoteAlertHandle];
  [v12 registerObserver:self];

  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(AKPasswordResetPresenter *)self remoteAlertHandle];
    int v16 = 138412290;
    v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", (uint8_t *)&v16, 0xCu);
  }
  v15 = [(AKPasswordResetPresenter *)self remoteAlertHandle];
  [v15 activateWithContext:v10];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[AKPasswordResetPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)passwordResetFinishedWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (!v9) {
      CFStringRef v12 = @"YES";
    }
    int v16 = 138412290;
    CFStringRef v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Password reset finished with result is success: %@", (uint8_t *)&v16, 0xCu);
  }

  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10017C55C();
  }

  v14 = [(AKPasswordResetPresenter *)self resetCompletion];

  if (v14)
  {
    v15 = [(AKPasswordResetPresenter *)self resetCompletion];
    ((void (**)(void, id, id))v15)[2](v15, v8, v9);
  }
  [(AKPasswordResetPresenter *)self setResetCompletion:0];
  if (v10) {
    v10[2](v10, 1, 0);
  }
  [(AKPasswordResetPresenter *)self setIsPasswordResetRequestInProgress:0];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
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
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Password reset alert handle (%@) deactivated.", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(AKPasswordResetPresenter *)self resetCompletion];

  if (v6)
  {
    v7 = [(AKPasswordResetPresenter *)self resetCompletion];
    id v8 = +[NSError ak_errorWithCode:-7034];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
  [(AKPasswordResetPresenter *)self setResetCompletion:0];
  [(AKPasswordResetPresenter *)self setIsPasswordResetRequestInProgress:0];
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
      id v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Password reset alert handle (%@) deactivated by request.", (uint8_t *)&v16, 0xCu);
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
  CFStringRef v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10017C5D4();
  }

  uint64_t v11 = +[NSError ak_errorWithCode:-7034 underlyingError:v7];
LABEL_12:
  id v13 = (void *)v11;
  v14 = [(AKPasswordResetPresenter *)self resetCompletion];

  if (v14)
  {
    v15 = [(AKPasswordResetPresenter *)self resetCompletion];
    ((void (**)(void, void, void *))v15)[2](v15, 0, v13);
  }
  [(AKPasswordResetPresenter *)self setResetCompletion:0];
  [(AKPasswordResetPresenter *)self setIsPasswordResetRequestInProgress:0];
}

- (void)dealloc
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10017C64C((uint64_t)self, v3);
  }

  id v4 = [(AKPasswordResetPresenter *)self remoteAlertHandle];
  [v4 unregisterObserver:self];

  int v5 = [(AKPasswordResetPresenter *)self remoteAlertHandle];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)AKPasswordResetPresenter;
  [(AKPasswordResetPresenter *)&v6 dealloc];
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)resetCompletion
{
  return self->_resetCompletion;
}

- (void)setResetCompletion:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (BOOL)isPasswordResetRequestInProgress
{
  return self->_isPasswordResetRequestInProgress;
}

- (void)setIsPasswordResetRequestInProgress:(BOOL)a3
{
  self->_isPasswordResetRequestInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_resetCompletion, 0);

  objc_storeStrong((id *)&self->_remoteListener, 0);
}

@end