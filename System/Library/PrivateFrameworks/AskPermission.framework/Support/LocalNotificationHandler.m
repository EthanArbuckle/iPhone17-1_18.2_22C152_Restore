@interface LocalNotificationHandler
+ (LocalNotificationHandler)sharedHandler;
- (NSArray)presentedRequests;
- (UNUserNotificationCenter)notificationCenter;
- (id)_notificationContentWithRequest:(id)a3 silently:(BOOL)a4;
- (id)retrieveRequestWithIdentifier:(id)a3;
- (void)_handleApproverRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleRequesterRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleUnknownRequestIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentNotificationWithRequest:(id)a3 silently:(BOOL)a4;
- (void)_replaceNotificationWithRequest:(id)a3;
- (void)dismissNotificationWithIdentifier:(id)a3;
- (void)presentNotificationWithRequest:(id)a3 silently:(BOOL)a4;
- (void)start;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation LocalNotificationHandler

+ (LocalNotificationHandler)sharedHandler
{
  if (qword_100042AF0 != -1) {
    dispatch_once(&qword_100042AF0, &stru_100038A98);
  }
  v2 = (void *)qword_100042AF8;
  return (LocalNotificationHandler *)v2;
}

- (NSArray)presentedRequests
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(LocalNotificationHandler *)self notificationCenter];
  v5 = [v4 deliveredNotifications];

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) request];
        v11 = [v10 content];
        v12 = [v11 userInfo];

        v13 = [[GenericRequest alloc] initWithDictionary:v12];
        if ([(GenericRequest *)v13 status] == -1)
        {
          v15 = &off_1000383F8;
        }
        else
        {
          id v14 = [(GenericRequest *)v13 status];
          v15 = &off_1000384E8;
          if (v14 != (id)1)
          {
            if ([(GenericRequest *)v13 status]) {
              goto LABEL_12;
            }
            v15 = &off_1000384E8;
          }
        }
        id v16 = [objc_alloc(*v15) initWithDictionary:v12];
        objc_msgSend(v3, "ap_addNullableObject:", v16);

LABEL_12:
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      id v8 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Dismissing notification. Identifier: %{public}@", buf, 0x16u);
    }
    id v6 = [(LocalNotificationHandler *)self notificationCenter];
    id v11 = v4;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 removeDeliveredNotificationsWithIdentifiers:v9];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = (id)objc_opt_class();
      id v10 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not dismiss notification without request identifier", buf, 0xCu);
    }
  }
}

- (void)presentNotificationWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 requestIdentifier];

  uint64_t v8 = +[APLogConfig sharedDaemonConfig];
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [v6 requestIdentifier];
      int v18 = 138543618;
      id v19 = v11;
      __int16 v20 = 2114;
      long long v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting local notification. Identifier: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    __int16 v14 = [v6 requestIdentifier];
    id v15 = [(LocalNotificationHandler *)self retrieveRequestWithIdentifier:v14];

    if (v15) {
      [(LocalNotificationHandler *)self _replaceNotificationWithRequest:v6];
    }
    else {
      [(LocalNotificationHandler *)self _presentNotificationWithRequest:v6 silently:v4];
    }
  }
  else
  {
    if (!v8)
    {
      v9 = +[APLogConfig sharedConfig];
    }
    id v16 = [v9 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v17 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Could not present notification without request identifier", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (id)retrieveRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(LocalNotificationHandler *)self presentedRequests];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = [v10 requestIdentifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v17 = +[APLogConfig sharedDaemonConfig];
          if (!v17)
          {
            id v17 = +[APLogConfig sharedConfig];
          }
          int v18 = [v17 OSLogObject];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v27 = v19;
            __int16 v28 = 2114;
            id v29 = v10;
            id v20 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved request. Request: %{public}@", buf, 0x16u);
          }
          id v16 = v10;
          goto LABEL_19;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[APLogConfig sharedConfig];
  }
  id v13 = [v5 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    __int16 v28 = 2114;
    id v29 = v4;
    id v15 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not retrieve request. Identifier: %{public}@", buf, 0x16u);
  }
  id v16 = 0;
LABEL_19:

  return v16;
}

- (void)start
{
  id v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting local notification center", (uint8_t *)&v8, 0xCu);
  }
  id v6 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.askpermission.notifications"];
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v6;

  [(UNUserNotificationCenter *)self->_notificationCenter setDelegate:self];
  [(UNUserNotificationCenter *)self->_notificationCenter setWantsNotificationResponsesDelivered];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 notification];
  id v10 = [v9 request];
  id v11 = [v10 content];
  unsigned int v12 = [v11 userInfo];

  id v13 = [[GenericRequest alloc] initWithDictionary:v12];
  __int16 v14 = +[APLogConfig sharedDaemonConfig];
  if (!v14)
  {
    __int16 v14 = +[APLogConfig sharedConfig];
  }
  id v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2114;
    long long v23 = v13;
    id v16 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Received notification response. Request: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  if ([(GenericRequest *)v13 status] == -1)
  {
    id v19 = [[ApprovalRequest alloc] initWithDictionary:v12];
    [(LocalNotificationHandler *)self _handleApproverRequest:v19 withCompletionHandler:v8];
  }
  else if ((id)[(GenericRequest *)v13 status] == (id)1 || ![(GenericRequest *)v13 status])
  {
    id v19 = [[RequesterRequest alloc] initWithDictionary:v12];
    [(LocalNotificationHandler *)self _handleRequesterRequest:v19 withCompletionHandler:v8];
  }
  else
  {
    id v17 = [v7 notification];
    int v18 = [v17 request];
    id v19 = [v18 identifier];

    [(LocalNotificationHandler *)self _handleUnknownRequestIdentifier:v19 withCompletionHandler:v8];
  }
}

- (void)_handleApproverRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[ApproverLocalNotificationTask alloc] initWithRequest:v6];
  objc_initWeak(&location, self);
  id v9 = [(ApproverLocalNotificationTask *)v8 perform];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000123F8;
  v11[3] = &unk_100038AC0;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_handleRequesterRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[RequesterLocalNotificationTask alloc] initWithRequest:v6];
  objc_initWeak(&location, self);
  id v9 = [(RequesterLocalNotificationTask *)v8 perform];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000126DC;
  v11[3] = &unk_100038AC0;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_handleUnknownRequestIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v10 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Unknown notification. Identifier: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(LocalNotificationHandler *)self dismissNotificationWithIdentifier:v6];
  v7[2](v7);
}

- (void)_presentNotificationWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(LocalNotificationHandler *)self _notificationContentWithRequest:v6 silently:v4];
  if (v4) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 15;
  }
  id v9 = [v6 requestIdentifier];
  id v10 = +[UNNotificationRequest requestWithIdentifier:v9 content:v7 trigger:0 destinations:v8];

  objc_initWeak(&location, self);
  int v11 = [(LocalNotificationHandler *)self notificationCenter];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012B54;
  v13[3] = &unk_100038AE8;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v14 = v12;
  BOOL v16 = v4;
  [v11 addNotificationRequest:v10 withCompletionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_replaceNotificationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(LocalNotificationHandler *)self _notificationContentWithRequest:v4 silently:1];
  objc_initWeak(&location, self);
  id v6 = [(LocalNotificationHandler *)self notificationCenter];
  id v7 = [v4 requestIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012EA0;
  v9[3] = &unk_100038B10;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v6 replaceContentForRequestWithIdentifier:v7 replacementContent:v5 completionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_notificationContentWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v7 = [v5 localizations];
  id v8 = [v7 body];
  [v6 setBody:v8];

  id v9 = [v5 localizations];
  id v10 = [v9 title];
  [v6 setTitle:v10];

  id v11 = [v5 date];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSDate date];
  }
  id v14 = v13;

  [v6 setDate:v14];
  id v15 = [v14 dateByAddingTimeInterval:2592000.0];
  [v6 setExpirationDate:v15];

  BOOL v16 = [v5 compile];
  [v6 setUserInfo:v16];

  [v6 setHasDefaultAction:1];
  if ([v5 status] == (id)-1) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = UNNotificationInterruptionLevelDefault;
  }
  [v6 setInterruptionLevel:v17];
  [v6 setShouldAuthenticateDefaultAction:1];
  [v6 setShouldBackgroundDefaultAction:1];
  [v6 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  if (v4)
  {
    [v6 setSound:0];
  }
  else
  {
    int v18 = +[UNNotificationSound defaultSound];
    [v6 setSound:v18];
  }
  return v6;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
}

@end