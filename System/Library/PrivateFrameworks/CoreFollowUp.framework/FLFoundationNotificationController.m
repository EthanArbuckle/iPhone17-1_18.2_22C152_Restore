@interface FLFoundationNotificationController
- (BOOL)_unsafe_hasAlertForItem:(id)a3;
- (FLFoundationNotificationController)init;
- (NotificationProviderDelegate)delegate;
- (__CFUserNotification)_createUserNotificationWithItem:(id)a3;
- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4;
- (void)_showNotification:(__CFUserNotification *)a3 identifier:(id)a4 item:(id)a5;
- (void)postNotificationForFollowUpItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldUpdateExistingForItem:(id)a3 completionHandler:(id)a4;
- (void)tearDownNotificationsForFollowUpItem:(id)a3;
@end

@implementation FLFoundationNotificationController

- (FLFoundationNotificationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)FLFoundationNotificationController;
  v2 = [(FLFoundationNotificationController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    notificationsByID = v2->_notificationsByID;
    v2->_notificationsByID = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.followup.cfnotificationqueue", 0);
    notificationSerializationQueue = v2->_notificationSerializationQueue;
    v2->_notificationSerializationQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)shouldUpdateExistingForItem:(id)a3 completionHandler:(id)a4
{
}

- (void)postNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to post springboard alert for item: %@", (uint8_t *)&buf, 0xCu);
  }

  v6 = [v4 uniqueIdentifier];
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    notificationSerializationQueue = self->_notificationSerializationQueue;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10000E148;
    v14 = &unk_10001CE60;
    v15 = self;
    id v8 = v4;
    id v16 = v8;
    p_long long buf = &buf;
    id v9 = v6;
    id v17 = v9;
    dispatch_sync(notificationSerializationQueue, &v11);
    -[FLFoundationNotificationController _showNotification:identifier:item:](self, "_showNotification:identifier:item:", *(void *)(*((void *)&buf + 1) + 24), v9, v8, v11, v12, v13, v14, v15);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v10 = _FLLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100011018(v10);
    }
  }
}

- (void)_showNotification:(__CFUserNotification *)a3 identifier:(id)a4 item:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v10 = (void *)os_transaction_create();
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000E350;
    v12[3] = &unk_10001CE88;
    id v13 = v8;
    objc_copyWeak(&v17, &location);
    v14 = self;
    id v15 = v9;
    id v11 = v10;
    id v16 = v11;
    [(FLFoundationNotificationController *)self _receiveResponseFromNotification:a3 handler:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_unsafe_hasAlertForItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationSerializationQueue);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  dispatch_queue_t v5 = [v4 uniqueIdentifier];
  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_notificationsByID objectForKeyedSubscript:v5];
    *((unsigned char *)v21 + 24) = v6 != 0;

    if (!*((unsigned char *)v21 + 24))
    {
      id v7 = objc_alloc((Class)FLTopLevelViewModel);
      id v8 = [v4 clientIdentifier];
      id v9 = [v7 initWithIdentifier:v8];

      v10 = [v9 allPendingItems];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000E794;
      v16[3] = &unk_10001CEB0;
      id v17 = v5;
      id v11 = v4;
      id v18 = v11;
      v19 = &v20;
      [v10 enumerateObjectsUsingBlock:v16];
      uint64_t v12 = _FLLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *((unsigned __int8 *)v21 + 24);
        *(_DWORD *)long long buf = 138412546;
        id v25 = v11;
        __int16 v26 = 1024;
        int v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Verified item status: %@, hasAlert: %d", buf, 0x12u);
      }
    }
  }
  BOOL v14 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (void)tearDownNotificationsForFollowUpItem:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to teardown springboard alert for item: %@", buf, 0xCu);
  }

  v6 = [v4 uniqueIdentifier];
  id v7 = v6;
  if (v6)
  {
    notificationSerializationQueue = self->_notificationSerializationQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E954;
    v9[3] = &unk_10001CBA8;
    v9[4] = self;
    id v10 = v6;
    dispatch_sync(notificationSerializationQueue, v9);
  }
}

- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4
{
  id v5 = a4;
  v6 = dispatch_get_global_queue(25, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EA68;
  v8[3] = &unk_10001CED8;
  id v9 = v5;
  id v10 = a3;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (__CFUserNotification)_createUserNotificationWithItem:(id)a3
{
  id v3 = a3;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will display user notification...", v29, 2u);
  }

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = [v3 notification];
  id v7 = [v6 title];

  if (v7)
  {
    id v8 = [v3 notification];
    id v9 = [v8 title];
    [v5 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  }
  id v10 = [v3 notification];
  id v11 = [v10 informativeText];

  if (v11)
  {
    id v12 = [v3 notification];
    int v13 = [v12 informativeText];
    [v5 setObject:v13 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  }
  BOOL v14 = [v3 notification];
  id v15 = [v14 activateAction];
  id v16 = [v15 label];

  if (v16)
  {
    id v17 = [v3 notification];
    id v18 = [v17 activateAction];
    v19 = [v18 label];
    [v5 setObject:v19 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  else
  {
    id v17 = _FLLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001105C((uint64_t)v3, v17);
    }
  }

  uint64_t v20 = [v3 notification];
  uint64_t v21 = [v20 clearAction];
  uint64_t v22 = [v21 label];

  if (v22)
  {
    char v23 = [v3 notification];
    v24 = [v23 clearAction];
    id v25 = [v24 label];
    [v5 setObject:v25 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
  }
  else
  {
    char v23 = FLLoc();
    [v5 setObject:v23 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
  }

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  __int16 v26 = +[NotificationController sharedController];
  [v26 updateNotificationDeliveryDateForItem:v3];

  int v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v5);
  return v27;
}

- (NotificationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (NotificationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_notificationSerializationQueue, 0);

  objc_storeStrong((id *)&self->_notificationsByID, 0);
}

@end