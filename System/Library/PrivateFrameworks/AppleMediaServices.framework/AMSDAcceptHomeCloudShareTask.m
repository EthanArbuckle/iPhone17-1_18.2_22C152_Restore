@interface AMSDAcceptHomeCloudShareTask
- (AMSDAcceptHomeCloudShareTask)initWithController:(id)a3 cloudShare:(id)a4;
- (AMSDHomeCloudShare)share;
- (AMSDMultiUserController)controller;
- (id)_generateInviteCode;
- (id)_performAuthKitUpdateTaskWithOptions:(id)a3;
- (id)performTask;
@end

@implementation AMSDAcceptHomeCloudShareTask

- (AMSDAcceptHomeCloudShareTask)initWithController:(id)a3 cloudShare:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDAcceptHomeCloudShareTask;
  v9 = [(AMSDAcceptHomeCloudShareTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    objc_storeStrong((id *)&v10->_share, a4);
  }

  return v10;
}

- (id)performTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000190D8;
  v4[3] = &unk_100111EF8;
  v4[4] = self;
  v2 = [(AMSDAcceptHomeCloudShareTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

- (id)_generateInviteCode
{
  id v3 = objc_alloc_init((Class)AMSMutablePromise);
  v4 = [(AMSDAcceptHomeCloudShareTask *)self controller];
  v5 = [v4 homeManager];
  v6 = [(AMSDAcceptHomeCloudShareTask *)self share];
  id v7 = [v6 homeIdentifier];
  id v8 = [v5 homeWithHomeIdentifier:v7];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100019968;
  v21[3] = &unk_100111F20;
  id v9 = v3;
  id v22 = v9;
  [v8 addErrorBlock:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019974;
  v20[3] = &unk_100111F48;
  v20[4] = self;
  v10 = [v8 thenWithBlock:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100019A10;
  v18[3] = &unk_100111F20;
  id v11 = v9;
  id v19 = v11;
  [v10 addErrorBlock:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100019A1C;
  v16[3] = &unk_100111F70;
  id v12 = v11;
  id v17 = v12;
  [v10 addSuccessBlock:v16];
  v13 = v17;
  id v14 = v12;

  return v14;
}

- (id)_performAuthKitUpdateTaskWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)AMSAuthKitUpdateTask);
  v5 = +[ACAccountStore ams_sharedAccountStore];
  v6 = objc_msgSend(v5, "ams_activeiCloudAccount");
  id v7 = [v4 initWithAccount:v6 options:v3];

  [v7 setRunMode:1];
  id v8 = [v7 performAuthKitUpdate];

  return v8;
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDHomeCloudShare)share
{
  return self->_share;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end