@interface AKLoginPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)presentationCompletion;
- (void)_callCompletionWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6;
- (void)authenticationRequestFinishedWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6;
- (void)presentOOPLoginUIWithContext:(id)a3 completion:(id)a4;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKLoginPresenter

- (void)presentOOPLoginUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100182470();
  }

  id v31 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v31];
  id v10 = v31;
  if (!v9)
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001823FC();
    }

    v12 = +[NSError ak_errorWithCode:-7034];
    [(AKLoginPresenter *)self _callCompletionWithResults:0 password:0 additionalData:0 error:v12];
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  [v13 setObject:v9 forKeyedSubscript:@"context"];
  [v13 setObject:&off_10023AFA8 forKeyedSubscript:@"oopUIMode"];
  v14 = +[NSXPCListener anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v14;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  [(AKLoginPresenter *)self setPresentationCompletion:v7];

  v16 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v30 = 0;
  if ([v16 canOpenApplication:@"com.apple.AuthKitUIService" reason:&v30])
  {
    id v28 = v10;
    id v17 = objc_alloc_init((Class)BSMutableSettings);
    [v17 setObject:v13 forSetting:0];
    v18 = [(NSXPCListener *)self->_remoteListener endpoint];
    v19 = [v18 _endpoint];
    [v17 setObject:v19 forSetting:1];

    id v20 = objc_alloc((Class)BSAction);
    id v21 = [v17 copy];
    id v22 = [v20 initWithInfo:v21 responder:0];

    id v32 = v22;
    v33[0] = FBSOpenApplicationOptionKeyActions;
    v23 = +[NSArray arrayWithObjects:&v32 count:1];
    v34[0] = v23;
    v34[1] = &__kCFBooleanFalse;
    v33[1] = FBSOpenApplicationOptionKeyActivateSuspended;
    v33[2] = FBSOpenApplicationOptionKeyLaunchIntent;
    v34[2] = &off_10023AFC0;
    v24 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    v25 = +[FBSOpenApplicationOptions optionsWithDictionary:v24];

    v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100182314(v26);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100045918;
    v29[3] = &unk_100228398;
    v29[4] = self;
    [v16 openApplication:@"com.apple.AuthKitUIService" withOptions:v25 completion:v29];

    id v10 = v28;
  }
  else
  {
    v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100182358((uint64_t)&v30, v27);
    }

    id v17 = +[NSError ak_errorWithCode:-7034];
    [(AKLoginPresenter *)self _callCompletionWithResults:0 password:0 additionalData:0 error:v17];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[AKLoginPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)authenticationRequestFinishedWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1001825D8(self, v14);
  }

  [(AKLoginPresenter *)self _callCompletionWithResults:v13 password:v12 additionalData:v11 error:v10];
}

- (void)_callCompletionWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AKLoginPresenter *)self presentationCompletion];

  if (v13)
  {
    v14 = [(AKLoginPresenter *)self presentationCompletion];
    ((void (**)(void, id, id, id, id))v14)[2](v14, v15, v10, v11, v12);
  }
  [(AKLoginPresenter *)self setPresentationCompletion:0];
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);

  objc_storeStrong((id *)&self->_remoteListener, 0);
}

@end