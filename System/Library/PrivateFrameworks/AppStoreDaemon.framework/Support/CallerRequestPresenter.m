@interface CallerRequestPresenter
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation CallerRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  v9 = [(XPCNotificationClient *)self->_notificationClient processInfo];

  if (v9)
  {
    v10 = [(XPCNotificationClient *)self->_notificationClient processInfo];
    v11 = [v6 options];
    [v11 setClientInfo:v10];
  }
  notificationClient = self->_notificationClient;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10033C5A0;
  v15[3] = &unk_100524148;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(XPCNotificationClient *)notificationClient deliverAuthenticateRequest:v14 withResultHandler:v15];
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  notificationClient = self->_notificationClient;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10033C7FC;
  v12[3] = &unk_100524170;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(XPCNotificationClient *)notificationClient deliverDialogRequest:v11 withResultHandler:v12];
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  notificationClient = self->_notificationClient;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10033CA2C;
  v12[3] = &unk_100527D70;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(XPCNotificationClient *)notificationClient deliverEngagementRequest:v11 withResultHandler:v12];
}

- (void).cxx_destruct
{
}

@end