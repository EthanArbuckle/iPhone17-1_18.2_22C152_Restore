@interface SHMatchResultUserNotificationContentDeliverer
- (SHMatchResultUserNotificationContentDeliverer)initWithContentProvider:(id)a3;
- (SHMatchResultUserNotificationContentProvider)contentProvider;
- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4;
- (void)deliverContentForNoMatchWithCompletion:(id)a3;
@end

@implementation SHMatchResultUserNotificationContentDeliverer

- (SHMatchResultUserNotificationContentDeliverer)initWithContentProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMatchResultUserNotificationContentDeliverer;
  v6 = [(SHMatchResultUserNotificationContentDeliverer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentProvider, a3);
  }

  return v7;
}

- (void)deliverContentForNoMatchWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMatchResultUserNotificationContentDeliverer *)self contentProvider];
  v6 = [v5 notificationContentForNoMatch];

  v7 = +[UNNotificationRequest requestWithIdentifier:@"NOMATCH" content:v6 trigger:0];
  v8 = +[SHMatchResultNotificationScheduler userNotificationCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000123B0;
  v10[3] = &unk_100074CA8;
  id v11 = v4;
  id v9 = v4;
  [v8 addNotificationRequest:v7 withCompletionHandler:v10];
}

- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SHMatchResultUserNotificationContentDeliverer *)self contentProvider];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012554;
  v11[3] = &unk_100075190;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 notificationContentForMediaItem:v10 completionHandler:v11];
}

- (SHMatchResultUserNotificationContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void).cxx_destruct
{
}

@end