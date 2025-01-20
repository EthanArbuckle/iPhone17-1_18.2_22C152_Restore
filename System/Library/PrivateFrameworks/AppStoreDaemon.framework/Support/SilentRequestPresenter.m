@interface SilentRequestPresenter
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation SilentRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100018248;
  v28 = sub_100017CE0;
  id v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10033DDD4;
  v20[3] = &unk_100528B18;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  v23 = &v24;
  v10 = objc_retainBlock(v20);
  v11 = [v8 options];
  id v12 = [v11 authenticationType];

  if ((unint64_t)v12 > 1)
  {
    v19 = ASDErrorWithUserInfoAndFormat();
    ((void (*)(void *, void, void *))v10[2])(v10, 0, v19);
  }
  else
  {
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v8 logKey];
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting authentication request silently", buf, 0xCu);
    }
    sub_1002EB014(v8);
    id v15 = objc_alloc((Class)AMSAuthenticateTask);
    v16 = sub_10030B11C();
    id v17 = [v15 initWithRequest:v8 bag:v16];
    v18 = (void *)v25[5];
    v25[5] = (uint64_t)v17;

    [(id)v25[5] setDelegate:self];
    v19 = [(id)v25[5] performAuthentication];
    [v19 addFinishBlock:v10];
  }

  _Block_object_dispose(&v24, 8);
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 logKey];
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dialogs cannot be presented silently, failing request", (uint8_t *)&v10, 0xCu);
  }
  id v9 = ASDErrorWithUserInfoAndFormat();
  if (v6) {
    v6[2](v6, 0, v9);
  }
  if (v5) {
    sub_1004224B8(v5, 0, v9, &stru_10052D918);
  }
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 logKey];
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Engagements cannot be presented silently, failing request", (uint8_t *)&v11, 0xCu);
  }
  int v10 = ASDErrorWithUserInfoAndFormat();
  if (v7) {
    v7[2](v7, 0, v10);
  }
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

@end