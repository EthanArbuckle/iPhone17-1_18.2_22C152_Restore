@interface UserNotificationControllerImpl
- (UserNotificationControllerImpl)initWithLogger:(const void *)a3;
- (void)publishNotificationWithInfo:(UserNotificationInfo *)data;
- (void)removeNotificationWithIdentifier:(const void *)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationControllerImpl

- (UserNotificationControllerImpl)initWithLogger:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UserNotificationControllerImpl;
  v4 = [(UserNotificationControllerImpl *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->logger = a3;
    v6 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Bridge"];
    fUserNotificationCenter = v5->fUserNotificationCenter;
    v5->fUserNotificationCenter = v6;

    [(UNUserNotificationCenter *)v5->fUserNotificationCenter setDelegate:v5];
    [(UNUserNotificationCenter *)v5->fUserNotificationCenter setWantsNotificationResponsesDelivered];
  }
  return v5;
}

- (void)publishNotificationWithInfo:(UserNotificationInfo *)data
{
  v5 = objc_opt_new();
  p_var0 = &data->var0.__r_.var0;
  if (data[1].var0.__r_.__value_.var0.var0.__data_[7] < 0) {
    p_var0 = *(int **)p_var0;
  }
  v7 = +[NSString stringWithUTF8String:p_var0];
  v8 = +[UNNotificationIcon iconForApplicationIdentifier:v7];
  [v5 setIcon:v8];

  [v5 setTitle:*((void *)&data[1].var0.__r_.__value_.var0.var1 + 2)];
  if (data[1].var0.__r_.__value_.var0.var0.__data_[8]) {
    [v5 setInterruptionLevel:2];
  }
  [v5 setBody:*(void *)&data[1].var0.__r_.var0];
  objc_super v9 = +[UNNotificationSound defaultSound];
  [v5 setSound:v9];

  v10 = &data[1].var0.var0;
  if (data[2].var0.__r_.__value_.var0.var0.__data_[15] < 0)
  {
    if (!data[2].var0.__r_.__value_.var0.var1.__data_) {
      goto LABEL_11;
    }
    v10 = (int64_t *)*v10;
    goto LABEL_10;
  }
  if (data[2].var0.__r_.__value_.var0.var0.__data_[15])
  {
LABEL_10:
    v11 = +[NSString stringWithUTF8String:v10];
    v12 = +[NSURL URLWithString:v11];
    [v5 setDefaultActionURL:v12];
  }
LABEL_11:
  if (*((char *)&data->var0.__r_.__value_.var0.var1 + 23) < 0) {
    data = (UserNotificationInfo *)data->var0.__r_.__value_.var0.var1.__data_;
  }
  v13 = +[NSString stringWithUTF8String:data];
  v14 = +[UNNotificationRequest requestWithIdentifier:v13 content:v5 trigger:0];

  v15 = sub_100200FB4((id *)self->logger);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v14 identifier];
    int v17 = 138412290;
    v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Posting notification: (%@)", (uint8_t *)&v17, 0xCu);
  }
  [(UNUserNotificationCenter *)self->fUserNotificationCenter addNotificationRequest:v14 withCompletionHandler:0];
}

- (void)removeNotificationWithIdentifier:(const void *)a3
{
  fUserNotificationCenter = self->fUserNotificationCenter;
  if (*((char *)a3 + 23) < 0) {
    a3 = *(const void **)a3;
  }
  v4 = +[NSString stringWithUTF8String:a3];
  v6 = v4;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(UNUserNotificationCenter *)fUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:v5];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(void))a5;
  objc_super v9 = sub_100200FB4((id *)self->logger);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 notification];
    v11 = [v10 request];
    v12 = [v11 identifier];
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I Received notification response: (%@)", (uint8_t *)&v13, 0xCu);
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void).cxx_destruct
{
}

@end