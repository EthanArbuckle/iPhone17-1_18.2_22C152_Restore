@interface _BDSNotificationConnectionListener
- (CKNotificationListener)notificationListener;
- (NSOrderedSet)configurations;
- (_BDSNotificationConnectionListener)initWithContainerConfigurations:(id)a3 delegate:(id)a4;
- (_BDSNotificationConnectionListenerDelegate)delegate;
- (void)_registerContainerWithConfiguration:(id)a3;
- (void)_registerForSubscriptionID:(id)a3 inDatabase:(id)a4;
- (void)setConfigurations:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationListener:(id)a3;
- (void)startListeningForNotifications;
@end

@implementation _BDSNotificationConnectionListener

- (_BDSNotificationConnectionListener)initWithContainerConfigurations:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BDSNotificationConnectionListener;
  v9 = [(_BDSNotificationConnectionListener *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurations, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)startListeningForNotifications
{
  v3 = [(_BDSNotificationConnectionListener *)self notificationListener];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)CKNotificationListener) initWithMachServiceName:@"com.apple.aps.bookdatastored"];
    [(_BDSNotificationConnectionListener *)self setNotificationListener:v4];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(_BDSNotificationConnectionListener *)self configurations];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(_BDSNotificationConnectionListener *)self _registerContainerWithConfiguration:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_registerContainerWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerIdentifier];
  id v6 = +[CKContainer containerWithIdentifier:v5];

  id v7 = [v4 appBundleIdentifier];
  [v6 setSourceApplicationBundleIdentifier:v7];

  uint64_t v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v4 containerIdentifier];
    int v12 = 138543362;
    long long v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Notification] Registering for notifications for container %{public}@", (uint8_t *)&v12, 0xCu);
  }
  long long v10 = [v4 dbSubscriptionID];
  long long v11 = [v6 privateCloudDatabase];
  [(_BDSNotificationConnectionListener *)self _registerForSubscriptionID:v10 inDatabase:v11];
}

- (void)_registerForSubscriptionID:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(_BDSNotificationConnectionListener *)self notificationListener];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030958;
  v9[3] = &unk_100260BF8;
  objc_copyWeak(&v10, &location);
  [v8 registerForSubscriptionWithID:v6 inDatabase:v7 handler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSOrderedSet)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (_BDSNotificationConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_BDSNotificationConnectionListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (void)setNotificationListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end