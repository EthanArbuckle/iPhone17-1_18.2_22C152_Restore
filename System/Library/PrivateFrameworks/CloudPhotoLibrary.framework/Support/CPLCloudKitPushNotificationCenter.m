@interface CPLCloudKitPushNotificationCenter
- (BOOL)clientIsForeground;
- (CPLCloudKitCoordinator)delegate;
- (CPLCloudKitPushNotificationCenter)init;
- (OS_dispatch_queue)queue;
- (void)_setPushRegistrationStatus:(id)a3 error:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)setClientIsForeground:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startWaitingForPushNotificationsForContainer:(id)a3;
- (void)stopWaitingForPushNotifications;
- (void)unregisterFromPushNotifications;
@end

@implementation CPLCloudKitPushNotificationCenter

- (CPLCloudKitPushNotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLCloudKitPushNotificationCenter;
  v2 = [(CPLCloudKitPushNotificationCenter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    pushRegistrationStatus = v2->_pushRegistrationStatus;
    v2->_pushRegistrationStatus = (NSString *)@"not registered";
  }
  return v3;
}

- (void)setClientIsForeground:(BOOL)a3
{
  if (self->_clientIsForeground != a3)
  {
    self->_clientIsForeground = a3;
    pushConnection = self->_pushConnection;
    if (a3)
    {
      if (pushConnection && self->_pushEnvironment)
      {
        if (!_CPLSilentLogging)
        {
          v5 = sub_100003960();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            objc_super v6 = [(NSArray *)self->_pushTopics componentsJoinedByString:@", "];
            int v11 = 138412290;
            v12 = v6;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Marking topics %@ as fully enabled", (uint8_t *)&v11, 0xCu);
          }
          pushConnection = self->_pushConnection;
        }
        pushTopics = self->_pushTopics;
        v8 = 0;
LABEL_17:
        [(APSConnection *)pushConnection setEnabledTopics:pushTopics ignoredTopics:0 opportunisticTopics:v8];
      }
    }
    else if (pushConnection && self->_pushEnvironment)
    {
      if (!_CPLSilentLogging)
      {
        v9 = sub_100003960();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = [(NSArray *)self->_pushTopics componentsJoinedByString:@", "];
          int v11 = 138412290;
          v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Marking topics %@ as opportunistic", (uint8_t *)&v11, 0xCu);
        }
        pushConnection = self->_pushConnection;
      }
      v8 = self->_pushTopics;
      pushTopics = 0;
      goto LABEL_17;
    }
  }
}

- (void)startWaitingForPushNotificationsForContainer:(id)a3
{
  self->_stoppedWaitingForPush = 0;
  id v5 = a3;
  [(CPLCloudKitPushNotificationCenter *)self _setPushRegistrationStatus:@"registering" error:0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003A60;
  v6[3] = &unk_100275CF0;
  v6[4] = self;
  v6[5] = a2;
  [v5 serverPreferredPushEnvironmentWithCompletionHandler:v6];
}

- (void)stopWaitingForPushNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_stoppedWaitingForPush = 1;
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    if (!_CPLSilentLogging)
    {
      v4 = sub_100003960();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop waiting for push notifications", v8, 2u);
      }

      pushConnection = self->_pushConnection;
    }
    [(APSConnection *)pushConnection _setEnabledTopics:&__NSArray0__struct];
    [(APSConnection *)self->_pushConnection shutdown];
    self->_ignorePushNotifications = 0;
    id v5 = self->_pushConnection;
    self->_pushConnection = 0;

    pushTopics = self->_pushTopics;
    self->_pushTopics = 0;

    pushEnvironment = self->_pushEnvironment;
    self->_pushEnvironment = 0;

    [(CPLCloudKitPushNotificationCenter *)self _setPushRegistrationStatus:@"stopped" error:0];
  }
}

- (void)unregisterFromPushNotifications
{
  objc_storeStrong((id *)&self->_pushEnvironment, APSEnvironmentProduction);
  v3 = (APSConnection *)[objc_alloc((Class)APSConnection) initWithEnvironmentName:self->_pushEnvironment namedDelegatePort:@"com.apple.photos.cloud.pushnotification" queue:self->_queue];
  pushConnection = self->_pushConnection;
  self->_pushConnection = v3;

  [(APSConnection *)self->_pushConnection setDelegate:self];
  [(APSConnection *)self->_pushConnection _setEnabledTopics:&__NSArray0__struct];
  self->_ignorePushNotifications = 1;
  [(CPLCloudKitPushNotificationCenter *)self stopWaitingForPushNotifications];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  objc_super v6 = (APSConnection *)a3;
  id v7 = a4;
  if (self->_pushConnection == v6 && _CPLSilentLogging == 0)
  {
    v9 = sub_100003960();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Receive public token %@ for APSConnection %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  objc_super v6 = (APSConnection *)a3;
  id v7 = a4;
  v8 = v7;
  if (self->_ignorePushNotifications)
  {
    if (!_CPLSilentLogging)
    {
      v9 = sub_100003960();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = [v8 topic];
        int v30 = 138412290;
        v31 = v10;
        id v11 = "Received unexpected push notification for %@";
        __int16 v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v30, 0xCu);
LABEL_36:

        goto LABEL_37;
      }
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  if (self->_pushConnection == v6)
  {
    v9 = [v7 topic];
    int v10 = [v8 userInfo];
    if (!_CPLSilentLogging)
    {
      v14 = sub_100003960();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138412802;
        v31 = v9;
        __int16 v32 = 2112;
        v33 = v10;
        __int16 v34 = 2112;
        v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received incoming message for topic %@ info %@ for APSConnection %@", (uint8_t *)&v30, 0x20u);
      }
    }
    v15 = +[NSDate date];
    lastPushNotificationDate = self->_lastPushNotificationDate;
    self->_lastPushNotificationDate = v15;

    v17 = [v8 topic];
    lastPushTopic = self->_lastPushTopic;
    self->_lastPushTopic = v17;

    if (self->_lastStartOfPushNotificationBurst
      && (-[NSDate timeIntervalSinceDate:](self->_lastPushNotificationDate, "timeIntervalSinceDate:"), v19 <= 10.0)
      && (id)[(NSDate *)self->_lastStartOfPushNotificationBurst compare:self->_lastPushNotificationDate] != (id)1)
    {
      unint64_t v20 = self->_countOfPushNotificationBurst + 1;
    }
    else
    {
      objc_storeStrong((id *)&self->_lastStartOfPushNotificationBurst, self->_lastPushNotificationDate);
      unint64_t v20 = 1;
    }
    self->_countOfPushNotificationBurst = v20;
    lastPushNotification = self->_lastPushNotification;
    self->_lastPushNotification = 0;

    if (v10)
    {
      v22 = +[CKNotification notificationFromRemoteNotificationDictionary:v10];
      v23 = self->_lastPushNotification;
      self->_lastPushNotification = v22;
    }
    if (self->_lastPushNotification)
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        goto LABEL_31;
      }
    }
    else
    {
      v25 = @"push notification of unknown kind";
      if (!v9) {
        goto LABEL_31;
      }
    }
    if ([(NSArray *)self->_pushTopics containsObject:v9])
    {
      if (!_CPLSilentLogging)
      {
        v26 = sub_100003960();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = [v8 userInfo];
          int v30 = 138412546;
          v31 = v25;
          __int16 v32 = 2112;
          v33 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Received %@ %@", (uint8_t *)&v30, 0x16u);
        }
      }
      if (self->_lastPushNotification)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained center:self didReceivePushNotification:self->_lastPushNotification];
      }
      else
      {
        if (_CPLSilentLogging) {
          goto LABEL_35;
        }
        WeakRetained = sub_100003960();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        {
          v29 = [v8 userInfo];
          int v30 = 138412290;
          v31 = v29;
          _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid CloudKit push notification %@", (uint8_t *)&v30, 0xCu);
        }
      }
      goto LABEL_34;
    }
LABEL_31:
    if (_CPLSilentLogging)
    {
LABEL_35:

      goto LABEL_36;
    }
    WeakRetained = sub_100003960();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412546;
      v31 = v25;
      __int16 v32 = 2112;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Discarding unexpected %@ with topic %@", (uint8_t *)&v30, 0x16u);
    }
LABEL_34:

    goto LABEL_35;
  }
  if (!_CPLSilentLogging)
  {
    v9 = sub_100003960();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v8 topic];
      int v30 = 138412290;
      v31 = v10;
      id v11 = "Discarding unexpected push notification with topic %@";
      __int16 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_9;
    }
LABEL_37:
  }
LABEL_38:
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  int v10 = (APSConnection *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_pushConnection == v10 && _CPLSilentLogging == 0)
  {
    v15 = sub_100003960();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138413058;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Received token %@ for topic %@ with identifier %@ for APSConnection %@", (uint8_t *)&v16, 0x2Au);
    }
  }
}

- (void)_setPushRegistrationStatus:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (NSString *)[a3 copy];
  pushRegistrationStatus = self->_pushRegistrationStatus;
  self->_pushRegistrationStatus = v7;

  v9 = (NSString *)[v6 copy];
  pushRegistrationError = self->_pushRegistrationError;
  self->_pushRegistrationError = v9;
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004904;
  v7[3] = &unk_100275D68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained getLastClientServedWithAPushNotificationWithCompletionHandler:v7];
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005040;
  v7[3] = &unk_100275D68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained getLastClientServedWithAPushNotificationWithCompletionHandler:v7];
}

- (CPLCloudKitCoordinator)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLCloudKitCoordinator *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)clientIsForeground
{
  return self->_clientIsForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastPushNotification, 0);
  objc_storeStrong((id *)&self->_pushRegistrationError, 0);
  objc_storeStrong((id *)&self->_pushRegistrationStatus, 0);
  objc_storeStrong((id *)&self->_lastPushTopic, 0);
  objc_storeStrong((id *)&self->_lastStartOfPushNotificationBurst, 0);
  objc_storeStrong((id *)&self->_lastPushNotificationDate, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
}

@end