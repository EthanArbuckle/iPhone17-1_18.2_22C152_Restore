@interface BDSNotificationConnection
+ (BOOL)isWithinConnectionDateRange;
- (BDSNotificationConnection)init;
- (NSDate)lastConnectionDate;
- (_BDSNotificationConnectionListening)listener;
- (os_unfair_lock_s)unfairLock;
- (void)didAcceptConnection:(id)a3;
- (void)handleNotification:(id)a3;
- (void)setLastConnectionDate:(id)a3;
- (void)setListener:(id)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
- (void)startListeningForNotifications;
@end

@implementation BDSNotificationConnection

- (void)didAcceptConnection:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v5 = +[NSDate date];
  [(BDSNotificationConnection *)self setLastConnectionDate:v5];

  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [(BDSNotificationConnection *)self lastConnectionDate];
  [v6 setObject:v7 forKey:@"BookDataStore.ConnectionDate"];

  v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001E8620((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  }

  os_unfair_lock_unlock(p_unfairLock);
}

- (void)setLastConnectionDate:(id)a3
{
}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

+ (BOOL)isWithinConnectionDateRange
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"BookDataStore.ConnectionDate"];

  if (!v3)
  {
    v3 = +[NSDate date];
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setObject:v3 forKey:@"BookDataStore.ConnectionDate"];
  }
  v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v3 timeIntervalSinceReferenceDate];
  double v9 = v7 - v8;

  uint64_t v10 = sub_1000083A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1001E852C(v9 < 1209600.0, v10, v11, v12, v13, v14, v15, v16);
  }

  return v9 < 1209600.0;
}

- (BDSNotificationConnection)init
{
  v25.receiver = self;
  v25.super_class = (Class)BDSNotificationConnection;
  v2 = [(BDSNotificationConnection *)&v25 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
    v4 = +[BCCloudKitController sharedInstance];
    v5 = [v4 configuration];
    [v3 addObject:v5];

    double v6 = +[BCCloudKitController secureSharedInstance];
    double v7 = [v6 configuration];
    [v3 addObject:v7];

    double v8 = [[_BDSNotificationConnectionListener alloc] initWithContainerConfigurations:v3 delegate:v2];
    listener = v2->_listener;
    v2->_listener = (_BDSNotificationConnectionListening *)v8;

    v2->_unfairLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = +[NSUserDefaults standardUserDefaults];
    uint64_t v11 = [v10 objectForKey:@"BookDataStore.ConnectionDate"];
    p_lastConnectionDate = &v2->_lastConnectionDate;
    lastConnectionDate = v2->_lastConnectionDate;
    v2->_lastConnectionDate = (NSDate *)v11;

    if (!v2->_lastConnectionDate)
    {
      uint64_t v14 = +[NSDate date];
      uint64_t v15 = (void *)*p_lastConnectionDate;
      void *p_lastConnectionDate = v14;

      uint64_t v16 = +[NSUserDefaults standardUserDefaults];
      [v16 setObject:*p_lastConnectionDate forKey:@"BookDataStore.ConnectionDate"];
    }
    v17 = sub_1000083A0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1001E85B0((uint64_t)&v2->_lastConnectionDate, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  return v2;
}

- (void)startListeningForNotifications
{
  id v2 = [(BDSNotificationConnection *)self listener];
  [v2 startListeningForNotifications];
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  double v6 = +[NSDate date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;
  double v9 = [(BDSNotificationConnection *)self lastConnectionDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v8 - v10;

  os_unfair_lock_unlock(p_unfairLock);
  uint64_t v12 = sub_1000083A0();
  uint64_t v13 = v12;
  if (v11 >= 1209600.0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Ignoring cloud notifications - Application has not been launched recently.", v14, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1001E8690(v13);
    }

    uint64_t v13 = +[BCCloudKitController instanceForCKNotification:v4];
    [v13 handleRemoteCKNotification:v4];
  }
}

- (_BDSNotificationConnectionListening)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionDate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end