@interface InteractiveRequestPresenter
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation InteractiveRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  if (sub_1002EAF7C(v6)) {
    sub_10030B1B0();
  }
  else {
  v9 = sub_10030B11C();
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100018248;
  v21 = sub_100017CE0;
  id v22 = [objc_alloc((Class)AMSAuthenticateTask) initWithRequest:v6 bag:v9];
  [(id)v18[5] setDelegate:self];
  v10 = [(id)v18[5] performAuthentication];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033D308;
  v13[3] = &unk_100528B18;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  v16 = &v17;
  [v10 addFinishBlock:v13];

  _Block_object_dispose(&v17, 8);
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100018248;
  id v22 = sub_100017CE0;
  id v23 = [objc_alloc((Class)AMSSystemEngagementTask) initWithRequest:v7];
  [(id)v19[5] setClientInfo:v8];
  id v11 = [(id)v19[5] present];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10033D988;
  v14[3] = &unk_100528B68;
  id v12 = v7;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  uint64_t v17 = &v18;
  [v11 addFinishBlock:v14];

  _Block_object_dispose(&v18, 8);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

@end