@interface UserNotificationViewController
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation UserNotificationViewController

- (void)didReceiveNotification:(id)a3
{
  id v25 = a3;
  +[AMSUIUserNotificationViewController userNotificationFromNotification:](AMSUIUserNotificationViewController, "userNotificationFromNotification:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [v25 request];
    if (self)
    {
      uint64_t v6 = sub_10000254C((uint64_t)Bulletin, v5);
      id v7 = objc_alloc((Class)AMSUserNotification);
      if (v6) {
        v8 = *(void **)(v6 + 64);
      }
      else {
        v8 = 0;
      }
      id v9 = v8;
      id v4 = [v7 initWithTitle:v9];

      if (v6)
      {
        id v10 = *(id *)(v6 + 48);
        [v4 setInformativeText:v10];

        v11 = *(void **)(v6 + 24);
      }
      else
      {
        [v4 setInformativeText:0];
        v11 = 0;
      }
      id v12 = v11;

      if (v12)
      {
        id v13 = [objc_alloc((Class)AMSUserNotificationAction) initWithTitle:0];
        if (v6) {
          v14 = *(void **)(v6 + 24);
        }
        else {
          v14 = 0;
        }
        id v15 = v14;
        [v13 setDefaultURL:v15];

        [v4 setDefaultAction:v13];
      }
      if (v6) {
        v16 = *(void **)(v6 + 8);
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        id v18 = objc_alloc((Class)AMSUserNotificationAction);
        if (v6) {
          v19 = *(void **)(v6 + 8);
        }
        else {
          v19 = 0;
        }
        id v20 = v19;
        id v21 = [v18 initWithTitle:v20];

        if (v6) {
          v22 = *(void **)(v6 + 16);
        }
        else {
          v22 = 0;
        }
        id v23 = v22;
        [v21 setDefaultURL:v23];

        id v26 = v21;
        v24 = +[NSArray arrayWithObjects:&v26 count:1];
        [v4 setButtonActions:v24];
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  [(UserNotificationViewController *)self renderUserNotification:v4];
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  v8 = [v6 notification];
  id v9 = +[AMSUIUserNotificationViewController userNotificationFromNotification:v8];

  if (v9
    && (v14.receiver = self,
        v14.super_class = (Class)UserNotificationViewController,
        [(UserNotificationViewController *)&v14 respondsToSelector:"didReceiveNotificationResponse:completionHandler:"]))
  {
    v13.receiver = self;
    v13.super_class = (Class)UserNotificationViewController;
    [(UserNotificationViewController *)&v13 didReceiveNotificationResponse:v6 completionHandler:v7];
  }
  else
  {
    id v10 = [v6 notification];
    v11 = [v10 request];
    id v12 = sub_10000254C((uint64_t)Bulletin, v11);

    sub_100002844((uint64_t)v12, v6);
    v7[2](v7, 1);
  }
}

@end