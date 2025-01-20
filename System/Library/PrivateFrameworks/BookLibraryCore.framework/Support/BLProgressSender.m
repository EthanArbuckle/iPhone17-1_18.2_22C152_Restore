@interface BLProgressSender
- (BLProgressSender)init;
- (NSMutableSet)progressReceivers;
- (OS_dispatch_queue)dispatchQueue;
- (void)registerProgressReceiver:(id)a3;
- (void)removeProgressReceiver:(id)a3;
- (void)sendDidFailNotificatonWithUserInfo:(id)a3;
- (void)sendDownloadCompleteWithUserInfo:(id)a3;
- (void)sendProgressNotificationWithUserInfo:(id)a3;
- (void)sendPurchaseFailedWithUserInfo:(id)a3;
- (void)sendPurchaseSucceededWithUserInfo:(id)a3;
@end

@implementation BLProgressSender

- (void)registerProgressReceiver:(id)a3
{
  id v4 = a3;
  v5 = [(BLProgressSender *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005BA4;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSMutableSet)progressReceivers
{
  return self->_progressReceivers;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BLProgressSender)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLProgressSender;
  v2 = [(BLProgressSender *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("dispatch sender queue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    progressReceivers = v2->_progressReceivers;
    v2->_progressReceivers = v6;
  }
  return v2;
}

- (void)removeProgressReceiver:(id)a3
{
  id v4 = a3;
  v5 = [(BLProgressSender *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000404A8;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendProgressNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Posting Progress Notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000405C4;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void)sendDidFailNotificatonWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Posting DidFail Notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040868;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void)sendDownloadCompleteWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Posting DidComplete Notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040B0C;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void)sendPurchaseSucceededWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Posting PurchaseSucceeded Notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040DB0;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void)sendPurchaseFailedWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Posting PurchaseFailed Notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100041054;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReceivers, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end