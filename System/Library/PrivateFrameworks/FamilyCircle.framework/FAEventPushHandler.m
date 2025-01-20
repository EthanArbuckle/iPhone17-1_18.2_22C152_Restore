@interface FAEventPushHandler
- (BOOL)shouldProcess:(id)a3;
- (FAEventPushHandler)init;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (void)_deliverNotificationWithResponse:(id)a3 payload:(id)a4;
- (void)process:(id)a3;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
@end

@implementation FAEventPushHandler

- (FAEventPushHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)FAEventPushHandler;
  v2 = [(FAEventPushHandler *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSSet setWithObjects:@"f_delete", @"f_member_upd", @"f_child_transfer_apr", @"f_child_transfer_req", @"f_member_add", @"f_member_invite", 0];
    events = v2->_events;
    v2->_events = (NSSet *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("family_push_detail_request", v5);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (BOOL)shouldProcess:(id)a3
{
  events = self->_events;
  v4 = [a3 event];
  LOBYTE(events) = [(NSSet *)events containsObject:v4];

  return (char)events;
}

- (void)process:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CacheUpdate:Processing family event push", buf, 2u);
  }

  networkingQueue = self->_networkingQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C554;
  v8[3] = &unk_10004E3D8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(networkingQueue, v8);
}

- (void)_deliverNotificationWithResponse:(id)a3 payload:(id)a4
{
  id v4 = +[FANotificationBuilder buildNotificationWithResponse:a3 payload:a4];
  if (v4)
  {
    v5 = +[FAPushHelperService sharedInstance];
    dispatch_queue_t v6 = [v5 familyNotifier];

    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dispatching new FAFamilyNotification %@ to notifier %@", (uint8_t *)&v8, 0x16u);
    }

    [v6 deliverNotification:v4];
  }
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyRefreshActivityScheduler, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end