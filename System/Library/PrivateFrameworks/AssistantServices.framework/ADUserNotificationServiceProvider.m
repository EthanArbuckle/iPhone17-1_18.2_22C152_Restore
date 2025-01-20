@interface ADUserNotificationServiceProvider
+ (id)personalDomainNotificationProvider;
- (ADUserNotificationServiceProvider)initWithConnection:(id)a3 bundleIdentifier:(id)a4 notificationCategories:(id)a5;
- (BOOL)_isMonitoringUnlockActivity;
- (void)_clearNotificationWithIdentifier:(id)a3;
- (void)_snoozeNotifications;
- (void)_startMonitoringUnlockActivity;
- (void)_stopMonitoringUnlockActivity;
- (void)postNotificationRequest:(id)a3 completion:(id)a4;
- (void)postNotificationRequest:(id)a3 options:(unint64_t)a4 responseHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)withdrawNotificationRequestWithIdentifier:(id)a3;
@end

@implementation ADUserNotificationServiceProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_notificationsToBeSnoozed, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseHandlersByNotificationID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADUserNotificationServiceProvider userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F4888;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (void)postNotificationRequest:(id)a3 options:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002F4C40;
  v13[3] = &unk_10050C278;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F5074;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_clearNotificationWithIdentifier:(id)a3
{
  responseHandlersByNotificationID = self->_responseHandlersByNotificationID;
  id v5 = a3;
  [(NSMutableDictionary *)responseHandlersByNotificationID removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_notificationsToBeSnoozed removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_notificationsToBeSnoozed count])
  {
    [(ADUserNotificationServiceProvider *)self _stopMonitoringUnlockActivity];
  }
}

- (void)_snoozeNotifications
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(NSMutableDictionary *)self->_notificationsToBeSnoozed allKeys];
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        notificationCenter = self->_notificationCenter;
        uint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v6);
        uint64_t v7 = v19;
        id v9 = +[NSArray arrayWithObjects:&v19 count:1];
        [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v9];

        v10 = [(NSMutableDictionary *)self->_notificationsToBeSnoozed objectForKey:v7];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1002F52D0;
        v13[3] = &unk_10050C610;
        id v14 = v10;
        id v11 = v10;
        [(ADUserNotificationServiceProvider *)self postNotificationRequest:v11 completion:v13];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v4);
  }

  [(ADUserNotificationServiceProvider *)self _stopMonitoringUnlockActivity];
  [(NSMutableDictionary *)self->_notificationsToBeSnoozed removeAllObjects];
}

- (void)_stopMonitoringUnlockActivity
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;
}

- (void)_startMonitoringUnlockActivity
{
  id v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v3 setNeedsUserInteractivePriority:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002F54AC;
  v6[3] = &unk_10050B748;
  v6[4] = self;
  [v3 setTransitionHandler:v6];
  id v4 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v3];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v4;
}

- (BOOL)_isMonitoringUnlockActivity
{
  return self->_layoutMonitor != 0;
}

- (void)withdrawNotificationRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F57F4;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)postNotificationRequest:(id)a3 completion:(id)a4
{
}

- (ADUserNotificationServiceProvider)initWithConnection:(id)a3 bundleIdentifier:(id)a4 notificationCategories:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ADUserNotificationServiceProvider;
  id v11 = [(ADUserNotificationServiceProvider *)&v29 init];
  if (v11)
  {
    id v12 = (void *)kAssistantNotificationBundleID;
    if (v9) {
      id v12 = v9;
    }
    id v13 = v12;
    id v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    long long v16 = (const char *)[v15 UTF8String];
    long long v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);

    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    v20 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:v13];
    notificationCenter = v11->_notificationCenter;
    v11->_notificationCenter = v20;

    [(UNUserNotificationCenter *)v11->_notificationCenter setDelegate:v11];
    [(UNUserNotificationCenter *)v11->_notificationCenter setWantsNotificationResponsesDelivered];
    [(UNUserNotificationCenter *)v11->_notificationCenter setNotificationCategories:v10];
    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    responseHandlersByNotificationID = v11->_responseHandlersByNotificationID;
    v11->_responseHandlersByNotificationID = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationsToBeSnoozed = v11->_notificationsToBeSnoozed;
    v11->_notificationsToBeSnoozed = v24;

    v26 = (NSXPCConnection *)v8;
    connection = v11->_connection;
    v11->_connection = v26;
  }
  return v11;
}

+ (id)personalDomainNotificationProvider
{
  if (qword_1005864C0 != -1) {
    dispatch_once(&qword_1005864C0, &stru_10050E418);
  }
  v2 = (void *)qword_1005864C8;
  return v2;
}

@end